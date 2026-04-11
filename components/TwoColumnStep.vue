<script setup lang="ts">
defineProps<{
  number: string
  title: string
}>()
</script>

<template>
  <div class="w-full max-w-[980px] mx-auto h-full flex flex-col font-sans">
    <header class="mb-8 pt-4">
      <div class="flex items-center gap-4 text-4xl font-bold">
        <span class="bg-orange-200 text-orange-600 px-4 py-1 rounded-2xl shadow-sm">
          {{ number }}
        </span>
        <h1 class="!text-white">{{ title }}</h1>
      </div>
      <p class="mt-4 text-2xl text-gray-300 leading-relaxed italic">
        <slot name="description"></slot>
      </p>
    </header>

    <div class="grid grid-cols-[1fr_1fr] gap-2 flex-grow mt-4">
      <div class="min-w-0 bg-white/60 border-4 border-dashed border-blue-100 rounded-3xl p-6 flex flex-col justify-center items-center shadow-inner">
        <slot name="left"></slot>
      </div>

      <div class="min-w-0 bg-pink-50/50 rounded-3xl p-8 border-2 border-pink-100">
        <div class="space-y-6">
          <slot name="right"></slot>
        </div>
      </div>
    </div>
  </div>
</template>