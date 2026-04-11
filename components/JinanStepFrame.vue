<script setup lang="ts">
const props = withDefaults(defineProps<{
  variant?: 'beige' | 'white' | 'point-bg'
}>(), {
  variant: 'beige'
})
</script>

<template>
  <div :class="['jinan-step-frame', `jinan-step-frame--${props.variant}`]">
    <slot />
  </div>
</template>

<style scoped>
.jinan-step-frame {
  width: min(980px, 100%);
  margin: 0px auto 0;
  padding: 32px 44px;
  border-radius: var(--app-radius, 24px);
  text-align: left;
}

.jinan-step-frame--beige {
  background: linear-gradient(
    145deg,
    var(--app-bg-start, #d9c9b2) 0%,
    var(--app-bg-middle, #bda78d) 45%,
    var(--app-bg-end, #a78c6f) 100%
  );
  box-shadow: inset 0 2px 10px rgba(0, 0, 0, 0.05), var(--app-shadow, 0 10px 30px rgba(0, 0, 0, 0.1));
}

.jinan-step-frame--white {
  background: #ffffff;
  box-shadow: inset 0 1px 4px rgba(0, 0, 0, 0.04), var(--app-shadow, 0 8px 24px rgba(0, 0, 0, 0.08));
}

.jinan-step-frame--point-bg {
  background: transparent;
  box-shadow: none;
}
</style>
