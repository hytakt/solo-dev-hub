# syntax = docker/dockerfile:1

ARG RUBY_VERSION=3.2.2
FROM registry.docker.com/library/ruby:${RUBY_VERSION}-slim AS base

# 共通環境変数
ENV RAILS_ENV=development \
    BUNDLE_DEPLOYMENT=0 \
    BUNDLE_PATH=/usr/local/bundle \
    PATH="/usr/local/bundle/bin:$PATH"

WORKDIR /rails

# ========================
# Build Stage
# ========================
FROM base AS build

#必要なパッケージ
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    git \
    libpq-dev \
    libvips \
    pkg-config
# Gemfileのインストール
COPY Gemfile Gemfile.lock ./

RUN bundle install && \
    rm -rf ~/.bundle /usr/local/bundle/ruby/*/cache /usr/local/bundle/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# アプリケーションのソースコード
COPY . .

#bootsnapとassetsのプリコンパイル
RUN bundle exec bootsnap precompile app/ lib/ && \
    SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# ========================
# Runtime Stage
# ========================
FROM base

# PATH をちゃんと通しておく（重要！）
ENV PATH="/usr/local/bundle/bin:/usr/local/bundle/gems/bin:$PATH"

# 必要なランタイムパッケージ
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    curl \
    libvips \
    postgresql-client \
    git && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# アプリケーションとgemをコピー
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# railsコマンドに実行権限をつける（念のため）
RUN chmod +x /rails/bin/rails

#railsユーザー作成とパーミッション調整
RUN useradd -m -s /bin/bash rails && \
    chown -R rails:rails /rails /usr/local/bundle

#実行ユーザーに切り替え
USER rails

#railsのポート
EXPOSE 3000

#サーバー起動
CMD ["bin/rails", "server", "-b", "0.0.0.0"]