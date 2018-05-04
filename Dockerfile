FROM ruby:2.4.0
RUN mkdir -p /app
RUN apt-get update
RUN apt-get install -y qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
WORKDIR /app
COPY Gemfile /app/
RUN gem install bundler
RUN bundle install
COPY . /app
EXPOSE 80
CMD ["bundle", "exec", "rackup", "config.ru", "--host", "0.0.0.0", "-p", "80"]
