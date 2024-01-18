# syntax=docker/dockerfile:1
FROM ruby:2.7.6
RUN apt-get update -qq && apt-get install -y nodejs npm postgresql-client
RUN npm install -y --global yarn
WORKDIR /inss_crud
COPY Gemfile /inss_crud/Gemfile
COPY Gemfile.lock /inss_crud/Gemfile.lock
RUN bundle install
RUN rails webpacker:install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
