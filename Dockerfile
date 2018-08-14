FROM ruby:2.5.1-alpine

ADD . /app

ENV RACK_ENV=production \
    LANG=C.UTF-8

RUN cd /app \
  && bundle install --deployment --without="test development"

WORKDIR /app

# start service
CMD [ "ruby", "app.rb" ]
