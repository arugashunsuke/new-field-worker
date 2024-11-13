# ベースイメージ
FROM python:3.9-slim

# 作業ディレクトリを設定（field_worker内に変更）
WORKDIR /app

# 依存パッケージのインストール
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# アプリケーションのコピー
COPY . .

# Gunicornでアプリケーションを起動
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]