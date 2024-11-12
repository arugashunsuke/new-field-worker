# ベースイメージ
FROM python:3.9-slim

# 作業ディレクトリの作成
WORKDIR /app/field_worker

# 依存パッケージのインストール
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# アプリケーションのコピー
COPY . .

# アプリケーションの実行
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "main:app"]