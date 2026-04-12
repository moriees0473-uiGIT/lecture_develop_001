---
theme: seriph
drawers: false
navbars: false
presenter: false
toc: false
background: none
class: text-center
transition: slide-left
comark: true
duration: 35min
canvasWidth: 1100
---

<InlineSmallTitle title="第2回 システム開発の流れ（全体）" suffix="マネジメント系"
  :suffix-scale="0.58" />

<CustomTitle
  subtitle='本日のテーマ'
  :points="[
    { title: '1. ソフトウェア ライフ サイクル プロセス', desc: '(**[red]SLCP[/red]** : [en]Software Life Cycle Process[/en])' },
    { title: '2. ソフトウェア開発手法', desc: '([en]Software Development Methodology[/en])' },
    { title: '3. プロジェクト マネージメント', desc: '([en]Project Management[/en])' },
    { title: '4. システム監査', desc: '([en]IT Audit[/en])' }
  ]"
/>

---
theme: default
layout: none
class: text-center
canvasWidth: 1100
---

<script setup>
import { computed } from 'vue'

const slcpSteps = [
  {
    id: 1, title: '1.企画', color: '#B5651D',
    left: '情報システム全体の[orange]{構想|こうそう}や計画[/orange]を{策定|さくてい}するプロセスです。',
    right_sections: [
      {
        rights_title: '＜システム化構想＞',
        rights: [
          '・経営上のニーズや課題を確認する。',
          '・業務と情報システムの[orange]将来像を明確[/orange]にした上で,[orange]全体{最適化|さいてきか}[/orange]を図る。'
        ]
      },
      {
        rights_title: '＜システム化計画＞',
        rights: [
          '・システム化の基本方針を策定する。',
          '・管理体制や開発スケジュール,概算コスト,[orange]費用対効果[/orange]([hl]ROI[/hl] : [en]Return on Investment[/en])などを検討する。'
        ]
      }
    ],
    image: '/images/2_process01_1.png'
  },
  {
    id: 2, title: '2.要件定義', color: '#C19A6B', textColor: '#513820',
    left: '情報システムの[orange]機能や性能[/orange]を明確にするプロセスです。',
    right_sections: [
      {
        rights_title: '＜業務要件定義＞',
        rights: [
          '・日々の業務に必要な要件。業務手順,関係する組織の責任や権限などを明確にする。'
        ]
      },
      {
        rights_title: '＜機能要件定義＞',
        rights: [
          '・システムに必要な機能。必要なデータ項目,処理内容,ユーザインタ要件フェースなどを明確にする。'
        ]
      },
      {
        rights_title: '＜非機能要件定義＞',
        rights: [
          '・システムに必要な目に見えない性能。応答時間,稼働時間,セキュリティなどを明確にする。'
        ]
      }
    ],
    image: '/images/2_process02_1.png'
  },
  {
    id: 3, title: '3.開発', color: '#D2B48C', textColor: '#302316',
    left: '**設計・実装**\n設計書をもとにプログラムを作成する',
    right_sections: [{ rights_title: '＜成果物＞', rights: ['設計書・ソースコード'] }],
    image: '/images/2_process03_1.png'
  },
  {
    id: 4, title: '4.運用', color: '#A0845C',
    left: '**本番環境での稼働**\nシステムをリリースし、実際に使用する',
    right_sections: [{ rights_title: '＜成果物＞', rights: ['運用マニュアル・障害対応記録'] }],
    image: '/images/2_process04_1.png'
  },
  {
    id: 5, title: '5.保守', color: '#7a6245',
    left: '**継続的な改善**\nバグ修正・機能追加・パフォーマンス改善を行う',
    right_sections: [{ rights_title: '＜成果物＞', rights: ['変更管理記録・テストレポート'] }],
    image: '/images/2_process05_1.png'
  }
]

const currentStep = computed(() => Math.min($slidev.nav.clicks, slcpSteps.length - 1))
const getRightSections = (step) => {
  if (Array.isArray(step.right_sections) && step.right_sections.length > 0) {
    return step.right_sections
  }

  const titles = Array.isArray(step.rights_titles) && step.rights_titles.length > 0
    ? step.rights_titles
    : (step.rights_title ? [step.rights_title] : [])

  const rights = Array.isArray(step.rights) && step.rights.length > 0
    ? step.rights
    : (step.right ? [step.right] : [])

  if (titles.length <= 1) {
    return [{ rights_title: titles[0] || '', rights }]
  }

  return titles.map((title, index) => ({
    rights_title: title,
    rights: rights[index] ? [rights[index]] : []
  }))
}
</script>

<div class="page-bg">
<JinanStepFrame variant="point-bg">

  <JinanStep kind="title" title="**ソフトウェア ライフ サイクル プロセス**" />
  <JinanStep kind="body" title="[red]SLCP[/red] : [en]Software Life Cycle Process[/en]" />
  <JinanStep kind="body" title=" 5{段階|だんかい}の工程（一連の活動）を{逐次|ちくじ}確認していくこととします。" />

  <ProcessFlow
    :current-index="currentStep"
    :items="slcpSteps"
    :step-width="194"
    :step-height="43"
    :head-width="26"
    style="margin-top: 1rem; margin-bottom: 2rem;"
  />

  <div class="slcp-body" style="margin-top: 0.2rem;">
    <div class="slcp-panel">
      <JinanStep kind="subtitle" :title="`${slcpSteps[currentStep].title}プロセス`" />
      <JinanStep kind="body" :title="slcpSteps[currentStep].left" />
      <img :src="slcpSteps[currentStep].image" class="w-full mt-4" />
    </div>
    <div class="slcp-divider" />
    <div class="slcp-panel" style="--app-font-size-subtitle: 1.25rem; --app-font-size-body: 1.25rem;">
      <template
        v-for="(section, sectionIndex) in getRightSections(slcpSteps[currentStep])"
        :key="'right-section-' + slcpSteps[currentStep].id + '-' + sectionIndex"
      >
        <JinanStep v-if="section.rights_title" kind="subtitle" :title="section.rights_title" />
        <JinanStep
          v-for="(rightText, rightIndex) in section.rights"
          :key="'right-' + slcpSteps[currentStep].id + '-' + sectionIndex + '-' + rightIndex"
          kind="body"
          :title="rightText"
        />
      </template>
    </div>
  </div>

</JinanStepFrame>
</div>
<span v-click="4"></span>

---
theme: default
layout: none
---

<div class="page-bg">
<TwoColumnStep number="01" title="未来を創るシステム開発">
  <template v-slot:title>
    <JinanStep kind="title" style="margin: 0;" title="未来を創るシステム開発" />
  </template>

  <template v-slot:description>
    <JinanStep kind="body" style="margin: 0;" title="ワクワクする新しい価値を届けるための、3つのステップを確認しましょう。" />
  </template>

  <template v-slot:left>
    <div class="relative w-full h-64 flex justify-center items-center">
      <img src="https://it-words.jp/img/sys-dev.png" class="w-48 opacity-90" />
      <div v-click="1" class="absolute inset-0 flex justify-center items-center bg-blue-400/20 rounded-full animate-ping h-48 w-48 m-auto"></div>
      <div v-click="2" class="absolute top-0 right-0 bg-yellow-200 p-4 rounded-xl shadow-lg transform rotate-12">
        <span class="text-3xl">✨</span>
      </div>
    </div>
    <ul class="mt-8 text-2xl space-y-2 text-gray-600 self-start">
      <li v-click="1">● 柔軟なコンポーネント設計</li>
      <li v-click="2">● ユーザー体験の最適化</li>
    </ul>
  </template>

  <template v-slot:right>
    <div class="space-y-6">
      <div v-click="1" class="bg-white p-6 rounded-2xl shadow-sm border-l-8 border-blue-300">
        <h3 class="text-2xl font-bold text-blue-500 mb-2">Step 01: 基礎の構築</h3>
        <p class="text-xl text-gray-600">再利用性の高いVueコンポーネントをベースに、堅牢なシステムを組み立てます。</p>
      </div>
      <div v-click="2" class="bg-white p-6 rounded-2xl shadow-sm border-l-8 border-yellow-300">
        <h3 class="text-2xl font-bold text-yellow-600 mb-2">Step 02: 価値の付加</h3>
        <p class="text-xl text-gray-600">視覚的なエフェクトや心地よい操作感を加え、使う人がワクワクするツールへ昇華させます。</p>
      </div>
    </div>
  </template>

</TwoColumnStep>
</div>

---
theme: default
layout: none
class: text-center
canvasWidth: 1100
---

<div class="page-bg">
<JinanStepFrame
  variant="point-bg"
  speech-text="Read in English"
  speech-link-text="▶ Read in English"
>
  <JinanStep kind="title" title="**学習の進め方**" />
  <JinanStep kind="body" title="[jp]この時間は、基礎を固めながら順番に理解を積み上げていきま。[/jp]" />
  <JinanStep kind="subtitle" title="**{学校|がっこう}**の**{準備|じゅんび}**" />

  <JinanStep v-click kind="body" highlight title="0. 公式の意味を言葉で説明できるようにする" />
  <JinanStep v-click kind="body" highlight title="2. 例題で考え方の手順を確認する" />
  <JinanStep v-click kind="body" highlight title="3. 練習問題で自力で解く力をつける" />
  <JinanStep v-click kind="body" highlight title="4. 間違いを見直して次に活かす" />
</JinanStepFrame>
</div>

---
layout: default
---

# 汎用アニメーション（文字入り・図形選択）

<script setup>
// typeに 'circle', 'square', 'triangle', 'arrow' のいずれかを指定します
const shapeData = [
  { id: 1, type: 'circle', text: '丸', color: '#ef4444', finalX: -110, startX: -300, startY: -200, startRot: -180 },
  { id: 2, type: 'square', text: '四角', color: '#3b82f6', finalX: 0, startX: 0, startY: 250, startRot: 0 },
  { id: 3, type: 'triangle', text: '三角', color: '#eab308', finalX: 110, startX: 300, startY: -200, startRot: 180 }
]
</script>

<div class="flex justify-center mt-10">
  <ShapesAssemble :clicks="$slidev.nav.clicks" :items="shapeData" />
</div>

<span v-click="3"></span>

---

### アニメーションのポイント

1.  **Vueコンポーネント (`.vue`):**
    -   `<TransitionGroup appear>` で、表示時にアニメーションを実行。
    -   CSS の `.assemble-enter-from` で、丸・四角・三角の「初期位置（方々）」を指定。
    -   通常の `.circle`, `.square` 等で「最終位置（重なり）」を指定。

2.  **Slidev (`.md`):**
    -   `<ShapesAssemble v-click />` のように `v-click` を使うのが最も簡単。
    -   PDF書き出し時など、アニメーションを飛ばして「最終状態」だけ見せたい場合は、Slidevの機能 (`::print-toggle::` など) と組み合わせる工夫が必要になります（今回のコードは画面表示優先のシンプルな実装です）。


