FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update

RUN apt-get install -y --no-install-recommends \
    locales \
    ca-certificates \
    build-essential \
    curl \
    git \
    libghc-zlib-dev \
    libyaml-dev
RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

ENV RBENV_ROOT=/opt/rbenv
ENV PATH=${RBENV_ROOT}/shims:${PATH}:${RBENV_ROOT}/bin
ENV RBENV_SHELL=bash

RUN apt remove ruby rubygems ruby-rubygems -y

RUN git clone https://github.com/rbenv/rbenv.git ${RBENV_ROOT}
RUN git clone https://github.com/rbenv/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build
RUN rbenv install 3.3.8
RUN rbenv global 3.3.8
RUN command rbenv rehash
RUN gem update --system 3.7.0

RUN apt-get install -y --no-install-recommends \
    fonts-ipafont \
    fonts-noto-cjk \
    texlive-latex-extra \
    texlive-lang-japanese \
    texlive-luatex \
    ghostscript 

RUN gem install webrick
RUN gem install review
WORKDIR /workdir