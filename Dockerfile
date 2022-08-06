from ruby:2.6.6

RUN apt update && apt install -y nodejs

RUN gem update --system
RUN gem install bundler

WORKDIR /app

EXPOSE 3000

ENV RAILS_SERVE_STATIC_FILES 1
ENV RAILS_LOG_TO_STDOUT 1

ADD Gemfile Gemfile.lock /app/

RUN bundle update --bundler
RUN bundle install

COPY . .

RUN bundle exec rake assets:precompile

RUN mkdir -p tmp/pids

CMD ["/app/bin/docker-run"]
