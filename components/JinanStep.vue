<script setup lang="ts">
import { computed, onBeforeUnmount, ref } from 'vue'

const props = withDefaults(defineProps<{
  title?: string // 表示用テキスト
  kind?: 'title' | 'subtitle' | 'body' // 文字サイズの種類
  highlight?: boolean // 全文を背景ハイライトする
  readAloud?: boolean // 読み上げボタンを表示する
  showReadButton?: boolean // 読み上げボタン表示のON/OFF
  speechText?: string // 読み上げ専用テキスト
  pronunciationMap?: Record<string, string> // 読み替え辞書
  readLang?: string // 読み上げ言語
  readRate?: number // 読み上げ速度
  preferredVoiceName?: string // 優先する音声名
}>(), {
  kind: 'subtitle',
  highlight: false,
  readAloud: false,
  showReadButton: true,
  speechText: '',
  pronunciationMap: () => ({}),
  readLang: 'ja-JP',
  readRate: 0.8,
  preferredVoiceName: 'Microsoft Nanami'
})

const isSpeaking = ref(false)

const displayText = computed(() => {
  return (props.title?.trim() || props.speechText?.trim() || '')
})

const supportsSpeech = computed(() => {
  if (typeof window === 'undefined') return false
  return 'speechSynthesis' in window && 'SpeechSynthesisUtterance' in window
})

const plainTextForSpeech = computed(() => {
  const source = props.speechText?.trim() ? props.speechText : displayText.value
  let text = source
    .replace(/\[\/?(?:red|green|hl)\]/g, '')
    .replace(/\*\*(.*?)\*\*/g, '$1')
    .replace(/\{([^|]+)\|([^}]+)\}/g, '$2')
    .replace(/\s+/g, ' ')
    .trim()

  for (const [from, to] of Object.entries(props.pronunciationMap || {})) {
    if (!from) continue
    text = text.split(from).join(to)
  }

  return text
})

const stopSpeech = () => {
  if (!supportsSpeech.value) return
  window.speechSynthesis.cancel()
  isSpeaking.value = false
}

const getVoicesReady = async () => {
  if (!supportsSpeech.value) return [] as SpeechSynthesisVoice[]

  const initialVoices = window.speechSynthesis.getVoices()
  if (initialVoices.length > 0) return initialVoices

  // 初回は音声一覧が空のことがあるため、イベント到着を短時間待つ
  const loadedVoices = await new Promise<SpeechSynthesisVoice[]>((resolve) => {
    const timer = window.setTimeout(() => {
      resolve(window.speechSynthesis.getVoices())
    }, 500)

    const onVoicesChanged = () => {
      window.clearTimeout(timer)
      resolve(window.speechSynthesis.getVoices())
    }

    window.speechSynthesis.addEventListener('voiceschanged', onVoicesChanged, { once: true })
  })

  return loadedVoices
}

const speak = async () => {
  if (!supportsSpeech.value || !plainTextForSpeech.value) return
  stopSpeech()

  const utterance = new SpeechSynthesisUtterance(plainTextForSpeech.value)
  utterance.lang = props.readLang
  utterance.rate = props.readRate

  const voices = await getVoicesReady()
  const preferred = props.preferredVoiceName.toLowerCase()
  const preferredVoice = voices.find((voice) => voice.name.toLowerCase().includes(preferred))
    || voices.find((voice) => /microsoft/i.test(voice.name) && /nanami/i.test(voice.name))
  const jaVoice = voices.find((voice) => voice.lang.toLowerCase().startsWith('ja'))
  if (preferredVoice) {
    utterance.voice = preferredVoice
  } else if (jaVoice) {
    utterance.voice = jaVoice
  }

  utterance.onstart = () => {
    isSpeaking.value = true
  }
  utterance.onend = () => {
    isSpeaking.value = false
  }
  utterance.onerror = () => {
    isSpeaking.value = false
  }

  window.speechSynthesis.speak(utterance)
}

const toggleSpeech = async () => {
  if (isSpeaking.value) {
    stopSpeech()
    return
  }
  await speak()
}

onBeforeUnmount(() => {
  if (isSpeaking.value) stopSpeech()
})

// 文字列処理関数（太字とルビに対応）
const format = (text: string) => {
  if (!text) return ''
  const escaped = text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;')

  return escaped
    .replace(/\[red\](.+?)\[\/red\]/g, '<span class="step-red">$1</span>')
    .replace(/\[green\](.+?)\[\/green\]/g, '<span class="step-green">$1</span>')
    .replace(/\[hl\](.+?)\[\/hl\]/g, '<span class="step-hl">$1</span>')
    .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
    .replace(/\{([^|]+)\|([^}]+)\}/g, '<ruby>$1<rt>$2</rt></ruby>')
}
</script>

<template>
  <div :class="['jinan-step-container', { 'jinan-step-container--highlight': props.highlight }]">
    <div class="jinan-step-row">
      <div :class="['step-title', `step-title--${props.kind}`]" v-html="format(displayText)"></div>
      <button
        v-if="props.readAloud && props.showReadButton && supportsSpeech"
        type="button"
        class="step-read-button"
        @click="toggleSpeech"
      >
        {{ isSpeaking ? 'Stop' : 'Read' }}
      </button>
    </div>
  </div>
</template>

<style scoped>
.jinan-step-container {
  margin: 0.6rem 0;
  font-family: 'Hiragino Kaku Gothic Pro', 'Meiryo', sans-serif;
  color: var(--app-text-main, #1f2937);
}

.jinan-step-container--highlight {
  padding: 12px 16px;
  border-radius: 12px;
  background: rgba(255, 255, 255, 0.56);
}

.jinan-step-row {
  display: flex;
  align-items: flex-start;
  gap: 12px;
}

.step-read-button {
  margin-left: auto;
  min-width: 66px;
  padding: 6px 10px;
  border: 1px solid #b49a7b;
  border-radius: 999px;
  background: rgba(255, 255, 255, 0.75);
  color: #5b4630;
  font-size: 0.85rem;
  line-height: 1;
  cursor: pointer;
}

.step-read-button:hover {
  background: #fff;
}

/* タイトル：太字で大きく */
.step-title {
  line-height: 1.2;
}

.step-title--title {
  font-size: var(--app-font-size-title, 2.5rem);
  font-weight: 900;
  color: var(--app-title-color, #5b4630);
}

.step-title--subtitle {
  font-size: var(--app-font-size-subtitle, 2rem);
  font-weight: 900;
  color: var(--app-text-main, #3f3326);
}

.step-title--body {
  font-size: var(--app-font-size-body, 1.6rem);
  font-weight: 700;
  line-height: 1.45;
  color: var(--app-text-sub, #6f5c45);
}

:deep(.step-red) {
  color: #dc2626;
}

:deep(.step-green) {
  color: #2f855a;
}

:deep(.step-hl) {
  background: #fef3c7;
  border: 1px solid #fde68a;
  border-radius: 0.3em;
  padding: 0.02em 0.3em;
  color: #5b4630;
}

/* ルビの調整 */
:deep(rt) {
  font-size: 0.55em;
  color: #4a5568;
  font-weight: normal;
}
</style>