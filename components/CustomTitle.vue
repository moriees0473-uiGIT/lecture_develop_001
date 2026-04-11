<template>
  <div class="animation-frame">
    <div class="math-symbols">
      <div v-for="(s, i) in symbols" :key="i" :class="['symbol', `explode-${i + 1}`]">
        {{ s }}
      </div>
    </div>

    <div class="theme-section">
      <h2 v-if="subtitle" class="theme-subtitle">{{ subtitle }}</h2>
      
      <p v-if="description" class="theme-description">{{ description }}</p>

      <ul class="theme-points">
        <li v-for="(item, i) in points" :key="i" :class="`point-${i + 1}`">
          <span class="custom-icon"></span>
          <span class="text">{{ item.title }}</span>
          <span v-if="item.desc" class="desc" v-html="formatDesc(item.desc)"></span>
        </li>
      </ul>
    </div>
  </div>
</template>

<script setup>
/**
 * @param subtitle - 譛ｬ譌･縺ｮ繝・・繝槭↑縺ｩ縺ｮ蟆剰ｦ句・縺・
 * @param description - 繝ｪ繧ｹ繝医・荳翫・陬懆ｶｳ隱ｬ譏弱ユ繧ｭ繧ｹ繝・
 * @param points - { title: string, desc: string } 縺ｮ驟榊・
 */
defineProps({
  subtitle: { type: String, default: '' },
  description: { type: String, default: '' },
  points: { type: Array, default: () => [] }
})

const formatDesc = (value = '') => {
  const escaped = value
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;')

  return escaped
    .replace(/\[red\](.+?)\[\/red\]/g, '<span class="desc-red">$1</span>')
    .replace(/\[green\](.+?)\[\/green\]/g, '<span class="desc-green">$1</span>')
    .replace(/\[hl\](.+?)\[\/hl\]/g, '<span class="desc-hl">$1</span>')
    .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')
}

const symbols = ['∫', '∞', '∑', 'Δ', '√', '∇', 'π', 'θ']
</script>

<style scoped>
/* --- 繝｡繧､繝ｳ繝輔Ξ繝ｼ繝 (繧ｰ繝ｭ繝ｼ繝舌Ν螟画焚蜿ら・) --- */
.animation-frame {
  position: relative;
  width: min(980px, 100%);
  height: 400px;
  margin: 10px auto 0;
  border-radius: var(--app-radius, 24px);
  /* 閭梧勹繧ｰ繝ｩ繝・・繧ｷ繝ｧ繝ｳ繧偵げ繝ｭ繝ｼ繝舌Ν蛟､縺ｧ讒区・ */
  background: linear-gradient(
    145deg, 
    var(--app-bg-start, #ecfeff) 0%, 
    var(--app-bg-middle, #f8fafc) 45%, 
    var(--app-bg-end, #e2e8f0) 100%
  );
  box-shadow: inset 0 2px 10px rgba(0,0,0,0.05), var(--app-shadow, 0 10px 30px rgba(0,0,0,0.1));
  overflow: visible; /* 險伜捷縺悟､悶↓鬟帙・蜃ｺ縺吶ｈ縺・↓險ｭ螳・*/
}

/* --- 謨ｰ蟄ｦ險伜捷繧｢繝九Γ繝ｼ繧ｷ繝ｧ繝ｳ (蜈ｨ菴薙ｒ4s縺ｫ蜉騾・ --- */
.math-symbols {
  position: absolute;
  top: 50%; left: 50%;
  width: 0; height: 0;
  z-index: 10;
}

.symbol {
  position: absolute;
  top: 0; left: 0;
  font-size: 3.8rem;
  font-weight: 700;
  color: var(--app-text-main, #0f172a);
  opacity: 0;
  animation-duration: 4s !important;
  animation-timing-function: cubic-bezier(0.2, 0.8, 0.2, 1) !important;
  animation-fill-mode: both !important;
}

/* 險伜捷縺斐→縺ｮ繧｢繝九Γ繝ｼ繧ｷ繝ｧ繝ｳ驕・ｻｶ險ｭ螳・*/
.explode-1 { animation-name: explode1; animation-delay: 0.1s; }
.explode-2 { animation-name: explode2; animation-delay: 0.15s; }
.explode-3 { animation-name: explode3; animation-delay: 0.2s; }
.explode-4 { animation-name: explode4; animation-delay: 0.25s; }
.explode-5 { animation-name: explode5; animation-delay: 0.3s; }
.explode-6 { animation-name: explode6; animation-delay: 0.35s; }
.explode-7 { animation-name: explode7; animation-delay: 0.4s; }
.explode-8 { animation-name: explode8; animation-delay: 0.45s; }

/* 辷・匱繧｢繝九Γ繝ｼ繧ｷ繝ｧ繝ｳ縺ｮ霆碁％ (45%蝨ｰ轤ｹ縺ｧ鬟帙・謨｣繧企幕蟋・ */
@keyframes explode1 { 0% { transform: translate(-50%, -50%) translate(0, -400px) scale(0.2); opacity: 0; } 15%, 45% { transform: translate(-50%, -50%) translate(0, -130px) scale(1); opacity: 1; } 100% { transform: translate(-50%, -50%) translate(0, -600px) scale(2); opacity: 0; } }
@keyframes explode2 { 0% { transform: translate(-50%, -50%) translate(400px, -400px) scale(0.2); opacity: 0; } 15%, 45% { transform: translate(-50%, -50%) translate(92px, -92px) scale(1); opacity: 1; } 100% { transform: translate(-50%, -50%) translate(600px, -600px) scale(2); opacity: 0; } }
@keyframes explode3 { 0% { transform: translate(-50%, -50%) translate(400px, 0) scale(0.2); opacity: 0; } 15%, 45% { transform: translate(-50%, -50%) translate(130px, 0) scale(1); opacity: 1; } 100% { transform: translate(-50%, -50%) translate(600px, 0) scale(2); opacity: 0; } }
@keyframes explode4 { 0% { transform: translate(-50%, -50%) translate(400px, 400px) scale(0.2); opacity: 0; } 15%, 45% { transform: translate(-50%, -50%) translate(92px, 92px) scale(1); opacity: 1; } 100% { transform: translate(-50%, -50%) translate(600px, 600px) scale(2); opacity: 0; } }
@keyframes explode5 { 0% { transform: translate(-50%, -50%) translate(0, 400px) scale(0.2); opacity: 0; } 15%, 45% { transform: translate(-50%, -50%) translate(0, 130px) scale(1); opacity: 1; } 100% { transform: translate(-50%, -50%) translate(0, 600px) scale(2); opacity: 0; } }
@keyframes explode6 { 0% { transform: translate(-50%, -50%) translate(-400px, 400px) scale(0.2); opacity: 0; } 15%, 45% { transform: translate(-50%, -50%) translate(-92px, 92px) scale(1); opacity: 1; } 100% { transform: translate(-50%, -50%) translate(-600px, 600px) scale(2); opacity: 0; } }
@keyframes explode7 { 0% { transform: translate(-50%, -50%) translate(-400px, 0) scale(0.2); opacity: 0; } 15%, 45% { transform: translate(-50%, -50%) translate(-130px, 0) scale(1); opacity: 1; } 100% { transform: translate(-50%, -50%) translate(-600px, 0) scale(2); opacity: 0; } }
@keyframes explode8 { 0% { transform: translate(-50%, -50%) translate(-400px, -400px) scale(0.2); opacity: 0; } 15%, 45% { transform: translate(-50%, -50%) translate(-92px, -92px) scale(1); opacity: 1; } 100% { transform: translate(-50%, -50%) translate(-600px, -600px) scale(2); opacity: 0; } }

/* --- 繝・く繧ｹ繝医そ繧ｯ繧ｷ繝ｧ繝ｳ --- */
.theme-section {
  position: absolute;
  top: 42%; left: 50%;
  transform: translate(-50%, -50%);
  width: min(840px, 96%);
  display: flex;
  flex-direction: column;
  align-items: center;
  z-index: 5;
}

.theme-subtitle {
  font-size: var(--app-font-size-subtitle, 2.5rem) !important;
  font-weight: bold !important;
  color: var(--app-title-color, #164e63) !important;
  margin-bottom: 30px !important;
  /* 險伜捷縺碁｣帙・謨｣繧九ち繧､繝溘Φ繧ｰ(邏・.2s)縺ｧ陦ｨ遉ｺ髢句ｧ・*/
  animation: fadeInUp 0.8s ease-out 2.2s both;
}

.theme-description {
  font-size: 1.1rem;
  color: var(--app-text-sub, #64748b);
  margin-bottom: 15px;
  animation: fadeInUp 0.8s ease-out 2.4s both;
}

/* --- 繝ｪ繧ｹ繝医せ繧ｿ繧､繝ｫ --- */
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
  font-size: var(--app-font-size-body, 1.6rem);
  font-weight: 600;
  color: var(--app-text-main, #1f2937);
  background: rgba(255, 255, 255, 0.6);
  padding: 10px 20px;
  border-radius: 12px;
  box-shadow: 0 4px 6px rgba(0,0,0,0.05);
  opacity: 0;
  animation: slideInRight 0.6s ease-out both;
}

/* 繝ｪ繧ｹ繝医・繧ｹ繝ｩ繧､繝峨う繝ｳ驕・ｻｶ */
.point-1 { animation-delay: 2.6s !important; }
.point-2 { animation-delay: 2.8s !important; }
.point-3 { animation-delay: 3.0s !important; }
.point-4 { animation-delay: 3.2s !important; } /* 4陦檎岼莉･髯阪ｂ蟇ｾ蠢懷庄閭ｽ */

/* --- 繧｢繧､繧ｳ繝ｳ (繧ｷ繝ｳ繝励Ν縺ｪ譫) --- */
.custom-icon {
  width: 20px; height: 20px;
  border: 2px solid var(--app-accent, #06b6d4);
  margin-right: 15px;
  flex-shrink: 0;
}

.text { margin-right: 15px; }
.desc {
  font-size: 1.1rem;
  color: var(--app-text-sub, #64748b);
  font-weight: normal;
}

.desc-red {
  color: #dc2626;
}

.desc-green {
  color: #2f855a;
}

.desc-hl {
  background: #fef3c7;
  border: 1px solid #fde68a;
  border-radius: 0.3em;
  padding: 0.02em 0.3em;
  color: #5b4630;
}

/* --- 繧｢繝九Γ繝ｼ繧ｷ繝ｧ繝ｳ螳夂ｾｩ --- */
@keyframes fadeInUp {
  0% { transform: translateY(20px); opacity: 0; }
  100% { transform: translateY(0); opacity: 1; }
}

@keyframes slideInRight {
  0% { transform: translateX(30px); opacity: 0; }
  100% { transform: translateX(0); opacity: 1; }
}
</style>


