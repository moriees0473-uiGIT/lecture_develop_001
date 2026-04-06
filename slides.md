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
---

# 基礎数学Ⅱ

<div class="animation-frame">
  
  <div class="math-symbols">
    <div class="symbol integral">∫</div>
    <div class="symbol infinite">∞</div>
    <div class="symbol sum">∑</div>
    <div class="symbol delta">Δ</div>
    <div class="symbol sqrt">√</div>
    <div class="symbol nabla">∇</div>
    <div class="symbol pi">π</div>
    <div class="symbol theta">θ</div>
  </div>

  <div class="theme-section">
    <h2 class="theme-subtitle">本日のテーマ</h2>
    <ul class="theme-points">
      <li class="point-1">
        <span class="icon">󰑊</span>
        <span class="text">実数と演算</span>
        <span class="desc">(Real Numbers & Operations)</span>
      </li>
      <li class="point-2">
        <span class="icon">󰑊</span>
        <span class="text">方程式と不等式</span>
        <span class="desc">(Equations & Inequalities)</span>
      </li>
      <li class="point-3">
        <span class="icon">󰑊</span>
        <span class="text">関数とグラフ</span>
        <span class="desc">(Functions & Graphs)</span>
      </li>
    </ul>
  </div>

</div>

<style>
/* --- タイトル --- */
h1 {
  animation: fadeInDown 1s ease-out both;
}

@keyframes fadeInDown {
  0% { transform: translateY(-20px); opacity: 0; }
  100% { transform: translateY(0); opacity: 1; }
}

/* --- ベージュの背景枠 --- */
.animation-frame {
  position: relative;
  width: min(860px, 92vw);
  height: 380px; /* お気に入りの枠の大きさをキープ */
  margin: 10px auto 0;
  border-radius: 24px;
  background: linear-gradient(145deg, #ecfeff 0%, #f8fafc 45%, #e2e8f0 100%);
  box-shadow: inset 0 2px 10px rgba(0,0,0,0.05), 0 10px 30px rgba(0,0,0,0.1);
  /* overflow: hidden を外すことで、記号が枠を飛び越えて画面外へ散るようにします */
}

/* --- 数学記号 --- */
.math-symbols {
  position: absolute;
  top: 50%; left: 50%; /* 枠のど真ん中 */
  width: 0; height: 0;
  z-index: 10;
}

.symbol {
  position: absolute;
  top: 0; left: 0;
  font-size: 3.8rem;
  font-weight: 700;
  color: #0f172a;
  opacity: 0;
}

/* 全体で7秒のアニメーション
  最初円を作り、数秒キープした後、方々へ飛び消える
*/
.symbol.integral { animation: explode1 7s cubic-bezier(0.2, 0.8, 0.2, 1) 0.5s both; }
.symbol.infinite { animation: explode2 7s cubic-bezier(0.2, 0.8, 0.2, 1) 0.6s both; }
.symbol.sum      { animation: explode3 7s cubic-bezier(0.2, 0.8, 0.2, 1) 0.7s both; }
.symbol.delta    { animation: explode4 7s cubic-bezier(0.2, 0.8, 0.2, 1) 0.8s both; }
.symbol.sqrt     { animation: explode5 7s cubic-bezier(0.2, 0.8, 0.2, 1) 0.9s both; }
.symbol.nabla    { animation: explode6 7s cubic-bezier(0.2, 0.8, 0.2, 1) 1.0s both; }
.symbol.pi       { animation: explode7 7s cubic-bezier(0.2, 0.8, 0.2, 1) 1.1s both; }
.symbol.theta    { animation: explode8 7s cubic-bezier(0.2, 0.8, 0.2, 1) 1.2s both; }

@keyframes explode1 { /* 上 */
  0%   { transform: translate(-50%, -50%) translate(0, -400px) rotate(-180deg) scale(0.2); opacity: 0; }
  15%  { transform: translate(-50%, -50%) translate(0, -130px) rotate(0deg) scale(1); opacity: 1; }
  70%  { transform: translate(-50%, -50%) translate(0, -130px) rotate(0deg) scale(1); opacity: 1; }
  100% { transform: translate(-50%, -50%) translate(0, -600px) rotate(180deg) scale(2); opacity: 0; }
}
@keyframes explode2 { /* 右上 */
  0%   { transform: translate(-50%, -50%) translate(400px, -400px) rotate(180deg) scale(0.2); opacity: 0; }
  15%  { transform: translate(-50%, -50%) translate(92px, -92px) rotate(0deg) scale(1); opacity: 1; }
  70%  { transform: translate(-50%, -50%) translate(92px, -92px) rotate(0deg) scale(1); opacity: 1; }
  100% { transform: translate(-50%, -50%) translate(600px, -600px) rotate(180deg) scale(2); opacity: 0; }
}
@keyframes explode3 { /* 右 */
  0%   { transform: translate(-50%, -50%) translate(400px, 0) rotate(180deg) scale(0.2); opacity: 0; }
  15%  { transform: translate(-50%, -50%) translate(130px, 0) rotate(0deg) scale(1); opacity: 1; }
  70%  { transform: translate(-50%, -50%) translate(130px, 0) rotate(0deg) scale(1); opacity: 1; }
  100% { transform: translate(-50%, -50%) translate(600px, 0) rotate(180deg) scale(2); opacity: 0; }
}
@keyframes explode4 { /* 右下 */
  0%   { transform: translate(-50%, -50%) translate(400px, 400px) rotate(-180deg) scale(0.2); opacity: 0; }
  15%  { transform: translate(-50%, -50%) translate(92px, 92px) rotate(0deg) scale(1); opacity: 1; }
  70%  { transform: translate(-50%, -50%) translate(92px, 92px) rotate(0deg) scale(1); opacity: 1; }
  100% { transform: translate(-50%, -50%) translate(600px, 600px) rotate(180deg) scale(2); opacity: 0; }
}
@keyframes explode5 { /* 下 */
  0%   { transform: translate(-50%, -50%) translate(0, 400px) rotate(-180deg) scale(0.2); opacity: 0; }
  15%  { transform: translate(-50%, -50%) translate(0, 130px) rotate(0deg) scale(1); opacity: 1; }
  70%  { transform: translate(-50%, -50%) translate(0, 130px) rotate(0deg) scale(1); opacity: 1; }
  100% { transform: translate(-50%, -50%) translate(0, 600px) rotate(180deg) scale(2); opacity: 0; }
}
@keyframes explode6 { /* 左下 */
  0%   { transform: translate(-50%, -50%) translate(-400px, 400px) rotate(180deg) scale(0.2); opacity: 0; }
  15%  { transform: translate(-50%, -50%) translate(-92px, 92px) rotate(0deg) scale(1); opacity: 1; }
  70%  { transform: translate(-50%, -50%) translate(-92px, 92px) rotate(0deg) scale(1); opacity: 1; }
  100% { transform: translate(-50%, -50%) translate(-600px, 600px) rotate(-180deg) scale(2); opacity: 0; }
}
@keyframes explode7 { /* 左 */
  0%   { transform: translate(-50%, -50%) translate(-400px, 0) rotate(180deg) scale(0.2); opacity: 0; }
  15%  { transform: translate(-50%, -50%) translate(-130px, 0) rotate(0deg) scale(1); opacity: 1; }
  70%  { transform: translate(-50%, -50%) translate(-130px, 0) rotate(0deg) scale(1); opacity: 1; }
  100% { transform: translate(-50%, -50%) translate(-600px, 0) rotate(-180deg) scale(2); opacity: 0; }
}
@keyframes explode8 { /* 左上 */
  0%   { transform: translate(-50%, -50%) translate(-400px, -400px) rotate(-180deg) scale(0.2); opacity: 0; }
  15%  { transform: translate(-50%, -50%) translate(-92px, -92px) rotate(0deg) scale(1); opacity: 1; }
  70%  { transform: translate(-50%, -50%) translate(-92px, -92px) rotate(0deg) scale(1); opacity: 1; }
  100% { transform: translate(-50%, -50%) translate(-600px, -600px) rotate(-180deg) scale(2); opacity: 0; }
}

/* --- 本日のテーマ --- */
.theme-section {
  position: absolute;
  top: 50%; left: 50%;
  transform: translate(-50%, -50%); /* 枠の中央に固定 */
  width: min(650px, 90%);
  display: flex;
  flex-direction: column;
  align-items: center;
  z-index: 5;
}

.theme-subtitle {
  font-size: 2.5rem !important;
  font-weight: bold !important;
  color: #164e63 !important;
  margin-bottom: 20px !important;
  opacity: 0;
  /* 記号が飛び散るタイミング（約5.5秒）でフワッと表示 */
  animation: fadeInUp 1s ease-out 5.5s both;
}

.theme-points {
  list-style: none !important;
  padding: 0 !important;
  margin: 0 !important;
  display: flex;
  flex-direction: column;
  gap: 12px;
  width: 100%;
}

.theme-points li {
  display: flex;
  align-items: center;
  font-size: 1.6rem;
  font-weight: 600;
  color: #1f2937;
  background: rgba(255, 255, 255, 0.6);
  padding: 10px 20px;
  border-radius: 12px;
  box-shadow: 0 4px 6px rgba(0,0,0,0.05);
  opacity: 0;
}

/* 箇条書きが少しずつ遅れてスライドイン */
.point-1 { animation: slideInRight 0.8s ease-out 6.0s both; }
.point-2 { animation: slideInRight 0.8s ease-out 6.3s both; }
.point-3 { animation: slideInRight 0.8s ease-out 6.6s both; }

@keyframes fadeInUp {
  0% { transform: translateY(20px); opacity: 0; }
  100% { transform: translateY(0); opacity: 1; }
}

@keyframes slideInRight {
  0% { transform: translateX(30px); opacity: 0; }
  100% { transform: translateX(0); opacity: 1; }
}

.theme-points .icon {
  font-size: 1.6rem;
  color: #06b6d4;
  margin-right: 15px;
}
.theme-points .text { margin-right: 15px; }
.theme-points .desc {
  font-size: 1.1rem;
  color: #64748b;
  font-weight: normal;
}
</style>

---
transition: fade-out
---

# What is Slidev?

Slidev is a slides maker and presenter designed for developers, consist of the following features

- 📝 **Text-based** - focus on the content with Markdown, and then style them later
- 🎨 **Themable** - themes can be shared and re-used as npm packages
- 🧑‍💻 **Developer Friendly** - code highlighting, live coding with autocompletion
- 🤹 **Interactive** - embed Vue components to enhance your expressions
- 🎥 **Recording** - built-in recording and camera view
- 📤 **Portable** - export to PDF, PPTX, PNGs, or even a hostable SPA
- 🛠 **Hackable** - virtually anything that's possible on a webpage is possible in Slidev
<br>
<br>

Read more about [Why Slidev?](https://sli.dev/guide/why)

<!--
You can have `style` tag in markdown to override the style for the current page.
Learn more: https://sli.dev/features/slide-scope-style
-->

<style>
h1 {
  background-color: #2B90B6;
  background-image: linear-gradient(45deg, #4EC5D4 10%, #146b8c 20%);
  background-size: 100%;
  -webkit-background-clip: text;
  -moz-background-clip: text;
  -webkit-text-fill-color: transparent;
  -moz-text-fill-color: transparent;
}
</style>

<!--
Here is another comment.
-->

---
transition: slide-up
level: 2
---

# Navigation

Hover on the bottom-left corner to see the navigation's controls panel, [learn more](https://sli.dev/guide/ui#navigation-bar)

## Keyboard Shortcuts

|                                                     |                             |
| --------------------------------------------------- | --------------------------- |
| <kbd>right</kbd> / <kbd>space</kbd>                 | next animation or slide     |
| <kbd>left</kbd>  / <kbd>shift</kbd><kbd>space</kbd> | previous animation or slide |
| <kbd>up</kbd>                                       | previous slide              |
| <kbd>down</kbd>                                     | next slide                  |

<!-- https://sli.dev/guide/animations.html#click-animation -->
<img
  v-click
  class="absolute -bottom-9 -left-7 w-80 opacity-50"
  src="https://sli.dev/assets/arrow-bottom-left.svg"
  alt=""
/>
<p v-after class="absolute bottom-23 left-45 opacity-30 transform -rotate-10">Here!</p>

---
layout: image-right
image: https://cover.sli.dev
---

# Code

Use code snippets and get the highlighting directly, and even types hover!

```ts [filename-example.ts] {all|4|6|6-7|9|all} twoslash
// TwoSlash enables TypeScript hover information
// and errors in markdown code blocks
// More at https://shiki.style/packages/twoslash
import { computed, ref } from 'vue'

const count = ref(0)
const doubled = computed(() => count.value * 2)

doubled.value = 2
```

<arrow v-click="[4, 5]" x1="350" y1="310" x2="195" y2="342" color="#953" width="2" arrowSize="1" />

<!-- This allow you to embed external code blocks -->
<<< @/snippets/external.ts#snippet

<!-- Footer -->

[Learn more](https://sli.dev/features/line-highlighting)

<!-- Inline style -->
<style>
.footnotes-sep {
  @apply mt-5 opacity-10;
}
.footnotes {
  @apply text-sm opacity-75;
}
.footnote-backref {
  display: none;
}
</style>

<!--
Notes can also sync with clicks

[click] This will be highlighted after the first click

[click] Highlighted with `count = ref(0)`

[click:3] Last click (skip two clicks)
-->

---
level: 2
---

# Shiki Magic Move

Powered by [shiki-magic-move](https://shiki-magic-move.netlify.app/), Slidev supports animations across multiple code snippets.

Add multiple code blocks and wrap them with <code>````md magic-move</code> (four backticks) to enable the magic move. For example:

````md magic-move {lines: true}
```ts {*|2|*}
// step 1
const author = reactive({
  name: 'John Doe',
  books: [
    'Vue 2 - Advanced Guide',
    'Vue 3 - Basic Guide',
    'Vue 4 - The Mystery'
  ]
})
```

```ts {*|1-2|3-4|3-4,8}
// step 2
export default {
  data() {
    return {
      author: {
        name: 'John Doe',
        books: [
          'Vue 2 - Advanced Guide',
          'Vue 3 - Basic Guide',
          'Vue 4 - The Mystery'
        ]
      }
    }
  }
}
```

```ts
// step 3
export default {
  data: () => ({
    author: {
      name: 'John Doe',
      books: [
        'Vue 2 - Advanced Guide',
        'Vue 3 - Basic Guide',
        'Vue 4 - The Mystery'
      ]
    }
  })
}
```

Non-code blocks are ignored.

```vue
<!-- step 4 -->
<script setup>
const author = {
  name: 'John Doe',
  books: [
    'Vue 2 - Advanced Guide',
    'Vue 3 - Basic Guide',
    'Vue 4 - The Mystery'
  ]
}
</script>
```
````

---

# Components

<div grid="~ cols-2 gap-4">
<div>

You can use Vue components directly inside your slides.

We have provided a few built-in components like `<Tweet/>` and `<Youtube/>` that you can use directly. And adding your custom components is also super easy.

```html
<Counter :count="10" />
```

<!-- ./components/Counter.vue -->
<Counter :count="10" m="t-4" />

Check out [the guides](https://sli.dev/builtin/components.html) for more.

</div>
<div>

```html
<Tweet id="1390115482657726468" />
```

<Tweet id="1390115482657726468" scale="0.65" />

</div>
</div>

<!--
Presenter note with **bold**, *italic*, and ~~striked~~ text.

Also, HTML elements are valid:
<div class="flex w-full">
  <span style="flex-grow: 1;">Left content</span>
  <span>Right content</span>
</div>
-->

---
class: px-20
---

# Themes

Slidev comes with powerful theming support. Themes can provide styles, layouts, components, or even configurations for tools. Switching between themes by just **one edit** in your frontmatter:

<div grid="~ cols-2 gap-2" m="t-2">

```yaml
---
theme: default
---
```

```yaml
---
theme: seriph
---
```

<img border="rounded" src="https://github.com/slidevjs/themes/blob/main/screenshots/theme-default/01.png?raw=true" alt="">

<img border="rounded" src="https://github.com/slidevjs/themes/blob/main/screenshots/theme-seriph/01.png?raw=true" alt="">

</div>

Read more about [How to use a theme](https://sli.dev/guide/theme-addon#use-theme) and
check out the [Awesome Themes Gallery](https://sli.dev/resources/theme-gallery).

---

# Clicks Animations

You can add `v-click` to elements to add a click animation.

<div v-click>

This shows up when you click the slide:

```html
<div v-click>This shows up when you click the slide.</div>
```

</div>

<br>

<v-click>

The <span v-mark.red="3"><code>v-mark</code> directive</span>
also allows you to add
<span v-mark.circle.orange="4">inline marks</span>
, powered by [Rough Notation](https://roughnotation.com/):

```html
<span v-mark.underline.orange>inline markers</span>
```

</v-click>

<div mt-20 v-click>

[Learn more](https://sli.dev/guide/animations#click-animation)

</div>

---

# Motions

Motion animations are powered by [@vueuse/motion](https://motion.vueuse.org/), triggered by `v-motion` directive.

```html
<div
  v-motion
  :initial="{ x: -80 }"
  :enter="{ x: 0 }"
  :click-3="{ x: 80 }"
  :leave="{ x: 1000 }"
>
  Slidev
</div>
```

<div class="w-60 relative">
  <div class="relative w-40 h-40">
    <img
      v-motion
      :initial="{ x: 800, y: -100, scale: 1.5, rotate: -50 }"
      :enter="final"
      class="absolute inset-0"
      src="https://sli.dev/logo-square.png"
      alt=""
    />
    <img
      v-motion
      :initial="{ y: 500, x: -100, scale: 2 }"
      :enter="final"
      class="absolute inset-0"
      src="https://sli.dev/logo-circle.png"
      alt=""
    />
    <img
      v-motion
      :initial="{ x: 600, y: 400, scale: 2, rotate: 100 }"
      :enter="final"
      class="absolute inset-0"
      src="https://sli.dev/logo-triangle.png"
      alt=""
    />
  </div>

  <div
    class="text-5xl absolute top-14 left-40 text-[#2B90B6] -z-1"
    v-motion
    :initial="{ x: -80, opacity: 0}"
    :enter="{ x: 0, opacity: 1, transition: { delay: 2000, duration: 1000 } }">
    Slidev
  </div>
</div>

<!-- vue script setup scripts can be directly used in markdown, and will only affects current page -->
<script setup lang="ts">
const final = {
  x: 0,
  y: 0,
  rotate: 0,
  scale: 1,
  transition: {
    type: 'spring',
    damping: 10,
    stiffness: 20,
    mass: 2
  }
}
</script>

<div
  v-motion
  :initial="{ x:35, y: 30, opacity: 0}"
  :enter="{ y: 0, opacity: 1, transition: { delay: 3500 } }">

[Learn more](https://sli.dev/guide/animations.html#motion)

</div>

---

# $\LaTeX$

$\LaTeX$ is supported out-of-box. Powered by [$\KaTeX$](https://katex.org/).

<div h-3 />

Inline $\sqrt{3x-1}+(1+x)^2$

Block
$$ {1|3|all}
\begin{aligned}
\nabla \cdot \vec{E} &= \frac{\rho}{\varepsilon_0} \\
\nabla \cdot \vec{B} &= 0 \\
\nabla \times \vec{E} &= -\frac{\partial\vec{B}}{\partial t} \\
\nabla \times \vec{B} &= \mu_0\vec{J} + \mu_0\varepsilon_0\frac{\partial\vec{E}}{\partial t}
\end{aligned}
$$

[Learn more](https://sli.dev/features/latex)

---

# Diagrams

You can create diagrams / graphs from textual descriptions, directly in your Markdown.

<div class="grid grid-cols-4 gap-5 pt-4 -mb-6">

```mermaid {scale: 0.5, alt: 'A simple sequence diagram'}
sequenceDiagram
    Alice->John: Hello John, how are you?
    Note over Alice,John: A typical interaction
```

```mermaid {theme: 'neutral', scale: 0.8}
graph TD
B[Text] --> C{Decision}
C -->|One| D[Result 1]
C -->|Two| E[Result 2]
```

```mermaid
mindmap
  root((mindmap))
    Origins
      Long history
      ::icon(fa fa-book)
      Popularisation
        British popular psychology author Tony Buzan
    Research
      On effectiveness<br/>and features
      On Automatic creation
        Uses
            Creative techniques
            Strategic planning
            Argument mapping
    Tools
      Pen and paper
      Mermaid
```

```plantuml {scale: 0.7}
@startuml

package "Some Group" {
  HTTP - [First Component]
  [Another Component]
}

node "Other Groups" {
  FTP - [Second Component]
  [First Component] --> FTP
}

cloud {
  [Example 1]
}

database "MySql" {
  folder "This is my folder" {
    [Folder 3]
  }
  frame "Foo" {
    [Frame 4]
  }
}

[Another Component] --> [Example 1]
[Example 1] --> [Folder 3]
[Folder 3] --> [Frame 4]

@enduml
```

</div>

Learn more: [Mermaid Diagrams](https://sli.dev/features/mermaid) and [PlantUML Diagrams](https://sli.dev/features/plantuml)

---
foo: bar
dragPos:
  square: 691,32,167,_,-16
---

# Draggable Elements

Double-click on the draggable elements to edit their positions.

<br>

###### Directive Usage

```md
<img v-drag="'square'" src="https://sli.dev/logo.png">
```

<br>

###### Component Usage

```md
<v-drag text-3xl>
  <div class="i-carbon:arrow-up" />
  Use the `v-drag` component to have a draggable container!
</v-drag>
```

<v-drag pos="663,206,261,_,-15">
  <div text-center text-3xl border border-main rounded>
    Double-click me!
  </div>
</v-drag>

<img v-drag="'square'" src="https://sli.dev/logo.png">

###### Draggable Arrow

```md
<v-drag-arrow two-way />
```

<v-drag-arrow pos="67,452,253,46" two-way op70 />

---
src: ./pages/imported-slides.md
hide: false
---

---

# Monaco Editor

Slidev provides built-in Monaco Editor support.

Add `{monaco}` to the code block to turn it into an editor:

```ts {monaco}
import { ref } from 'vue'
import { emptyArray } from './external'

const arr = ref(emptyArray(10))
```

Use `{monaco-run}` to create an editor that can execute the code directly in the slide:

```ts {monaco-run}
import { version } from 'vue'
import { emptyArray, sayHello } from './external'

sayHello()
console.log(`vue ${version}`)
console.log(emptyArray<number>(10).reduce(fib => [...fib, fib.at(-1)! + fib.at(-2)!], [1, 1]))
```

---
layout: center
class: text-center
---

# Learn More

[Documentation](https://sli.dev) · [GitHub](https://github.com/slidevjs/slidev) · [Showcases](https://sli.dev/resources/showcases)

<PoweredBySlidev mt-10 />
