FROM ruby:2.3

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client sqlite nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .
RUN bin/rails db:migrate RAILS_ENV=development
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0","-p","3000","-e","development"]
