# Setup
* Install Dependencies
  * Install postgres if needed (PG app recommended for OSX)
  * Install chromedriver
  * Install ruby version per `.ruby-version` file
* Run `bundle install`, manually installing the `pg` gem if needed, noted below:
  * If needed something like `gem install pg -v '1.5.9' -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/14/bin/pg_config` depending on your postgres version (14), and the current version of the `pg` gem. Once the `pg` gem is successfully installed, run `bundle install` again.
* Run `bundle exec rails db:setup`
* Confirm `bundle exec rspec` runs and tests are passing (note there are a number of pending tests due to boilerplate code)
* Confirm `bundle exec rails s` runs and you can naviage to `localhost:3000` and interact with the application (we have no CSS libraries currently so it's expected that there is no styling)
