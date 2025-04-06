#!/bin/bash
set -e

# 前回のRailsサーバのPIDファイルがあれば削除
rm -f /app/tmp/pids/server.pid

# コンテナ起動時に渡されたコマンドを実行（例: rails server）
exec "$@"
