# Memo Tomato #

This gem is an object-oriented Ruby wrapper for the Rotten Tomatoes API
http://api.rottentomatoes.com/

[![Build Status](https://secure.travis-ci.org/appsbakery/memo_tomato.png)](http://travis-ci.org/appsbakery/memo_tomato)

## Installation

Install the latest stable release:

    [sudo] gem install memo_tomato

In Rails, add it to your Gemfile:

```ruby
gem 'memo_tomato'
```

## How to use it? ##

First you have to create a client with your api key

```ruby
client = MemoTomato::Client.new(:key => "abcd1234")

client.search("Star Wars") # Search for movies
client.movie_info("771271134") # Get movie info
client.similar_movies("771271134") # Get similar movies
client.upcoming_movies # Get upcoming movies
```
