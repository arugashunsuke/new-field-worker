#!/bin/bash

# 除外したいサブディレクトリのリスト（スペース区切りで入力）
EXCLUDE_DIR=("README.md") # 例: cmd と internal/bigquery を除外

# 除外ディレクトリの条件を生成
EXCLUDE_FIND_OPTS=""
for dir in "${EXCLUDE_DIRS[@]}"; do
  EXCLUDE_FIND_OPTS+=" -path ./$(echo $dir | sed 's|/|\\\/|g') -prune -o"
done

# ディレクトリ構造を表示する
eval "find . $EXCLUDE_FIND_OPTS -print" | sed \
    -e 's|[^/]*/|    |g' \
    -e 's|    |│   |g' \
    -e 's|│   \([^│]\)|├── \1|g' \
    -e 's|│   $|└── |g' \
    -e 's|^\./||' \
    -e 's|/$||'