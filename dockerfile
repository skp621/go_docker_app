# ベースイメージとして公式のGoイメージを使用
FROM golang:1.21

# 作業ディレクトリを作成
WORKDIR /app

# Goのモジュールとソースコードをコピー
COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . ./

# アプリケーションをビルド
RUN go build -o main .

# アプリケーションを実行
CMD ["./main"]

# コンテナがリッスンするポートを指定
EXPOSE 8080
