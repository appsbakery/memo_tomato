# Memo Tomato #

Memo Tomato is an api wrapper for the http://api.rottentomatoes.com/
The gem is created to fulfil the needs of the project http://watchmemo.com

## Installation ##

gem install memo_tomato

## How to use it? ##

First you have to create a client with your api key

    client = MemoTomato::Client.new(:key => "abcd1234")

You can search tv shows with

    client.search("NAME OF THE MOVIE")

Get show info with

    client.movie_info("THE ID OF THE SHOW")

Get similar movies info with

    client.similar_movies("THE ID OF THE SHOW")

Get upcoming movies 

    client.upcoming_movies


