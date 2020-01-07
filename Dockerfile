FROM ruby:2.4@sha256:5730bfc9091e78875b60e95a49d943272ae9fb63eeca3983c6a80cb1a10817eb
  
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get -y install nodejs \
  yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update -qqy \
  && apt-get install -qqy \
    default-jre \
    zip \
    unzip \
    ruby \
    curl \
    gnupg \
    xvfb \
    python-pip \
    libpython-dev \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN gem install dpl

RUN pip install -U pip

RUN pip install awscli
