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
theme: seriph
class: text-center
---

<JinanStep 
  title="**{朝|あさ}**のごはん" 
  description="てを きれいに あらう
  おさらを テーブルに はこぶ
  **{感謝|かんしゃ}**して たべる"
/>

<JinanStep 
  title="**{学校|がっこう}**の**{準備|じゅんび}**" 
  description="ランドセルに きょうかしょを いれる
  すいとうを わすれない"
/>
