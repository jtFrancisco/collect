# Collect
Collect is a gem for connecting [ODK Collect](https://docs.getodk.org/collect-intro/) forms to a Rails application.

A step by step guide to create a working example app is available at:
https://github.com/donBigote/collect/wiki/

Browse an example app repo here:
https://github.com/donBigote/collect_app

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'collect', github: 'donBigote/collect', branch: 'main'
```
Run bundle install.
```bash
$ bundle install
```
Run the generator to add the default configuration.
```bash
$ rails g collect:install
```
Migrate the database.
```bash
$ rails db:migrate
```
Collect requires Active Storage to be installed. So if you don't have Active Storage installed run:
```bash
$ rails active_storage:install
$ rails db:migrate
```
You will need an environment variable defined as "DOMAIN".
`DOMAIN` is the domain your app uses.
For example:
```
DOMAIN: "https://45ff5b117a8b.ngrok.io"
```
Add the 'crack' and 'responders',  gem to your app's gemfile.
```bash
gem 'crack'
gem 'responders'
```
Run bundle install:
```bash
$ bundle install
```
Then, install responders.
```bash
$ rails g responders:install
```
You should be all set to go at this point.

## Usage
After installation, navigate to: 
localhost:3000/collect/forms

You can upload xlsform forms in XML format in:
localhost:3000/collect/forms/new

## Configure ODK Collect

 1. Install the ODK Collect app in your Android device.
 2. Open the ODK Collect app.
 3. Click the **menu icon** in the top right corner.
 4. Select **'General Settings'**.
 5. Select **'Server'**.
 6. Adjust the following settings:
**Type:** ODK
**URL:** yourdomain/collect/
*Custom server paths* 
**Form list path:** /formList
**Submission path:** /submission
7. If you have added forms like in the "Usage" section above, then go back to the ODK Collect main menu and select **"Get Blank Form"**.
8. Download blank forms.
9. Fill out forms.
10. Send forms to server (this will send a form submission to your Rails app). 

## License

MIT License. Copyright 2019-2021 K&F Consulting. http://www.dataconsulta.com


