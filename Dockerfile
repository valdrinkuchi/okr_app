FROM ruby:3.0.3-alpine

RUN apk add --update \
build-base \
libxml2-dev \
libxslt-dev \
postgresql-dev \
&& rm -rf /var/cache/apk/*
RUN apk add --no-cache tzdata
RUN apk add nano
RUN apk --update add bash && \
    apk add dos2unix


COPY . .
RUN bundle install
ENV PATH="bin/scripts:${PATH}"
ENV RAILS_ENV=production

RUN chmod +x ./bin/scripts/*

CMD ["setup.sh"]