# ０．初期化（テンプレート） ナビゲーションメニュー（目次リスト）
# npm create slidev@latest

# npm install @slidev/cli@0.49.29
# npx @slidev/cli --version     52.14.2

# http://localhost:3030/

Remove-Item -Recurse -Force node_modules\.vite -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2
npx slidev --port 3030 --open
