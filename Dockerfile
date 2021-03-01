# NOTE: 
#   1. Combine the apt-get update and apt-get install commands into a single RUN instruction
#      This ensures that whenever you change the packages being installed, you get the latest
#      package/repository information at the same time not cached information.

FROM ruby:3.0

LABEL maintainer="philip.maina@hey.com"

# nodejs specific repository and instructions
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends nodejs

# yarn specific repository and instructions
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends yarn

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Gemfile Caching Trick: 
#   Separate the copying of files that should trigger a rebuild of our gems from those that shouldn’t.
#   This avoids rebuilding the image for these steps (and hence running bundle install) when other unrelated 
#   files are changed.
COPY Gemfile* /usr/src/app/
RUN bundle install


# Yarn Caching Trick:
COPY package.json /usr/src/app
RUN yarn install

# Copy the app repo
COPY . /usr/src/app

RUN rails webpacker:install

CMD ["bin/rails", "s", "-b", "0.0.0.0"]