#!/usr/local/rbenv/shim/ruby
require 'json'
require 'oauth'
# gem install oauth
require 'pp'
require './config.rb'

consumer = OAuth::Consumer.new(
  CONSUMER_KEY, 
  CONSUMER_SECRET, 
  site:'https://api.twitter.com/',
  # :proxy=>'http://test.com'
)
endpoint = OAuth::AccessToken.new(consumer, ACCESS_TOKEN, ACCESS_TOKEN_SECRET)
response = endpoint.request(:get, 'https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=twitterapi&count=2')
result = JSON.parse(response.body)
pp result

