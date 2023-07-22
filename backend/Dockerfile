FROM ruby:3.0.6

COPY Gemfile Gemfile.lock ./

ENV BUNDLE_PATH /gems

WORKDIR /backend

RUN bundle install

COPY . ./backend
