#!/bin/bash

# ===========================
# ローカル開発環境用APIテストスクリプト
# APIテストをフォールバックモードで実施します。
# フォールバックモードでは、一部の項目はテストされません。
# ===========================

# (cd ../scoring/tool && node -prof ./nodeTool/check.js "fallback" && node --prof-process isolate*.log > ../../logs/isolate.txt && rm isolate*.log) || echo "処理に失敗しました。"
(cd ../scoring/tool && 0x -- node ./nodeTool/check.js "fallback") || echo "処理に失敗しました。"
