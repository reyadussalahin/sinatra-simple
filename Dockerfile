# version 0.0
FROM ubuntu:20.04
LABEL maintainer="reyadussalahin@gmail.com"
WORKDIR /App
RUN apt-get update -yqq; apt-get -yqq install ruby ruby-dev build-essential
ENV REFRESH_AT 2020_12_8_14_05
COPY . ./
RUN gem install bundler:2.1.4 && bundle install
EXPOSE 80
CMD ["rackup", "-o", "0.0.0.0", "-p", "80"]
