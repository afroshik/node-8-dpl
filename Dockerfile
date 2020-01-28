FROM ruby:2.4@sha256:5730bfc9091e78875b60e95a49d943272ae9fb63eeca3983c6a80cb1a10817eb
  
RUN apt-get -y install curl gnupg

RUN curl -sL https://deb.nodesource.com/setup_8.x  | bash -
RUN apt-get install nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get install yarn

RUN apt-get update && apt-get install -qq --no-install-recommends \
    python-pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN gem install dpl

RUN pip install -U pip
