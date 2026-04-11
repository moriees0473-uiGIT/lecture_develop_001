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
  subtitle="本日のテーマ"
  :points="[
    { title: 'ソフトウェア ライフ サイクル プロセス', desc: '(**[red]SLCP[/red]** : Software Life Cycle Process)' },
    { title: '方程式と不等式', desc: '(Equations & Inequalities)' },
    { title: '関数とグラフ', desc: '(Functions & Graphs)' }
  ]"
/>

---
theme: default
layout: none
background: 'linear-gradient(145deg, #d9c9b2 0%, #bda78d 45%, #a78c6f 100%)'
---

<div class="w-full" style="min-height: 100vh; background: linear-gradient(145deg, #d9c9b2 0%, #bda78d 45%, #a78c6f 100%);">
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
background: 'linear-gradient(145deg, #d9c9b2 0%, #bda78d 45%, #a78c6f 100%)'
canvasWidth: 1100
---

<div class="w-full" style="min-height: 100vh; background: linear-gradient(145deg, #d9c9b2 0%, #bda78d 45%, #a78c6f 100%);">
<JinanStepFrame variant="point-bg">
  <JinanStep kind="title" title="**学習の進め方**" />
  <JinanStep kind="body" read-aloud title="この時間は、基礎を固めながら順番に理解を積み上げていきます。" />
  <JinanStep kind="subtitle" title="**{学校|がっこう}**の**{準備|じゅんび}**" />

  <JinanStep v-click kind="body" highlight read-aloud title="0. 公式の意味を言葉で説明できるようにする" />
  <JinanStep v-click kind="body" highlight read-aloud title="2. 例題で考え方の手順を確認する" />
  <JinanStep v-click kind="body" highlight read-aloud title="3. 練習問題で自力で解く力をつける" />
  <JinanStep v-click kind="body" highlight read-aloud title="4. 間違いを見直して次に活かす" />
</JinanStepFrame>
</div>
