<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps<{
  title: string      // タイトル行
  description: string // 下に表示する文章（改行で区切ると複数行になります）
}>()

// 文字列処理関数（太字とルビに対応）
const format = (text: string) => {
  if (!text) return ''
  return text
    .replace(/\*\*(.*?)\*\*/g, '<strong class="font-bold text-blue-600">$1</strong>')
    .replace(/\{([^|]+)\|([^}]+)\}/g, '<ruby>$1<rt>$2</rt></ruby>')
}

// 文章を改行で区切って配列にする
const descriptionLines = computed(() => {
  if (!props.description) return []
  return props.description.split('\n').filter(line => line.trim() !== '')
})
</script>

<template>
  <div class="jinan-step-container">
    <div class="step-title" v-html="format(props.title)"></div>

    <div class="step-arrow">↓</div>

    <div class="step-content">
      <div 
        v-for="(line, index) in descriptionLines" 
        :key="index"
        class="step-line"
      >
        <span class="bullet">・</span>
        <span v-html="format(line)"></span>
      </div>
    </div>
  </div>
</template>

<style scoped>
.jinan-step-container {
  margin: 1.5rem 0;
  font-family: 'Hiragino Kaku Gothic Pro', 'Meiryo', sans-serif;
}

/* タイトル：太字で大きく */
.step-title {
  font-size: 2.2rem;
  font-weight: 900;
  color: #1a202c;
  line-height: 1.2;
}

/* 矢印：中央付近に配置 */
.step-arrow {
  font-size: 1.8rem;
  color: #3b82f6;
  margin-left: 1rem;
  padding: 0.2rem 0;
}

/* 説明文エリア：タイトルより少しインデント */
.step-content {
  margin-left: 2rem;
}

/* 各行のスタイル */
.step-line {
  font-size: 1.5rem;
  display: flex;
  align-items: flex-start;
  margin-bottom: 0.5rem;
  line-height: 1.6;
}

.bullet {
  margin-right: 0.5rem;
  font-weight: bold;
  color: #3b82f6;
}

/* ルビの調整 */
:deep(rt) {
  font-size: 0.55em;
  color: #4a5568;
  font-weight: normal;
}
</style>