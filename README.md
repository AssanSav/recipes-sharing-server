# README
This rails APP is use as a backend API to serve JSON formatted data to a React-Redux front-end APP

* Ruby version
ruby '2.6.1'
rails 'rails', '~> 6.0.3'

* Clone the repository 
- `git clone git@github.com:AssanSav/recipes-sharing-server.git`
- run `bundle install`

* System dependencies
```
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'
gem 'rack-cors', '~> 1.1', '>= 1.1.1'
gem 'pry-rails', '~> 0.3.9'
gem 'fast_jsonapi', '~> 1.5'
gem 'typhoeus', '~> 1.4'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bootsnap', '>= 1.4.2', require: false
```
```
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end
```
```
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
```
```
group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
```

* Database creation
- Run `rails db:migrate`
- To seed the database drop in `rails c` and create a new user to be associated with the recipes that would be creating and then
run `rails db:seed`
- run `sudo service postgresql start` to start the postgresql database server
- Then run `rails s` and head to `http://localhost:3001/api/recipes` to see the `JSON`

