FROM node:16-slim
ENV HOST 0.0.0.0
COPY ./nuxt /app
WORKDIR /app

RUN apt-get update \
  && apt-get install -y \
  git \
  vim
