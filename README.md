#Social Login
Social login is a form of single sign-on using existing information from a social networking service such as Facebook, Twitter or Google+, to sign into a third party website instead of creating a new login account specifically for that website. It is designed to simplify logins for end users as well as provide more and more reliable demographic information to web developers.

This project aims at social authentication integration for Google, Facebook, LinkedIn and Instagram along devise.


## Prerequisites:
You will need the following things properly installed on your computer.
* ruby -v 2.5.1
* rails -v 5.0.7.2

## Installation:

Add to Gemfile:
* gem 'devise'
* gem 'omniauth-google-oauth2'
* gem 'omniauth-facebook'
* gem 'omniauth-linkedin-oauth2'
* gem 'omniauth-instagram'

Then bundle install.

## API Setup
* Go to [console.developers.google.com]('https://console.developers.google.com') and setup app for google authentication.
* Go to [developers.facebook.com]('https://developers.facebook.com/') and setup app for facebook authentication.
* Go to [linkedin.com/developers]('https://www.linkedin.com/developers/') and setup app for linkedin authentication.
* Go to [instagram.com/developer]('https://www.instagram.com/developer/') and setup app for instagram authentication.

##Usage
Create a file: config/initializers/omniauth.rb
Now add the middleware to a Rails app in config/initializers/omniauth.rb file.

Here is an example how:

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  provider :linkedin, ENV['LINKEDIN_KEY'], ENV['LINKEDIN_SECRET']
  provider :instagram, ENV['INSTAGRAM_ID'], ENV['INSTAGRAM_SECRET']
end

## Running / Development:
* rails s

## Install for Ubuntu and Mac
## Ubuntu
