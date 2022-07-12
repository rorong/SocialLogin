# Load the Rails application.
require_relative 'application'

Rails.application.initialize!

OmniAuth.config.mock_auth[:twitter] = {
    :uid => '1341',
    :provider => 'twitter',
    :info => {
      :name => 'John',
      :email => 'john@gmail.com'
    }
  }

OmniAuth.config.mock_auth[:google] = {
    :uid => '1345',
    :provider => 'google',
    :info => {
      :name => 'John',
      :email => 'john@gmail.com'
    }
  }

OmniAuth.config.mock_auth[:instagram] = {
    :uid => '1337',
    :provider => 'instagram',
    :info => {
      :name => 'JonnieHallman',
      :email => 'johnie01@gmail.com'
    }
  }

OmniAuth.config.mock_auth[:facebook] = {
    :uid => '1397',
    :provider => 'facebook',
    :info => {
      :name => 'RonnieColeman',
      :email => 'ronnieC@gmail.com'
    }
  }

OmniAuth.config.mock_auth[:linkedin] = {
    :uid => '1357',
    :provider => 'linkedin',
    :info => {
      :name => 'JonnieHallman',
      :email => 'johnie01@gmail.com'
    }
  }