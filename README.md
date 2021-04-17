# Collect
Collect is a gem for connecting ODK Collect forms to a Rails application. This gem helps to automatate the process of collecting data with ODK Collect with a Rails app. Collect lets you serve and collect data directly from a device using ODK Collect without passing through ODK Aggregate.

A step by step guide is available at:

https://github.com/donBigote/collect/wiki/

An example app with Collect configured is available here:

https://github.com/donBigote/collect_test


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'collect', github: 'donBigote/collect', branch: 'main'
```

And then execute:
```bash
$ bundle install
```

Then run:
```bash
$ rails g collect:install
```

Migrate the database:
```bash
$ rails db:migrate
```

Be sure to have cloud storage set up to work with Active Storage with the appropriate environment variables in place.


You may need to add 'crack' gem to your app's gemfile 
```bash
gem 'crack'
```
and then run
```bash
$ bundle install
```

Navigate to: 
localhost:3000/skooter/forms


## License

MIT License. Copyright 2019-2021 K&F Consulting. http://www.dataconsulta.com

You are not granted rights or licenses to the trademarks of K&F Consulting, including without limitation the Skooter name or logo.
