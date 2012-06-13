require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'pry'

describe MemoTomato::Parser::MovieInfo do
  let(:client) { MemoTomato::Client.new(:apikey => "abcd1234") }
  
  it 'should be awesome' do
    mock_api :get, 'movies/770672122' , 'movies/770672122', :params => client.params do
      movie = client.movie_info("770672122")
      movie.id.should == 770672122
      movie.directors.first.name.should == "Lee Unkrich"
      movie.genres.should =~ ["Animation", "Kids & Family", "Science Fiction & Fantasy", "Comedy"]
      movie.image.should == "http://content6.flixster.com/movie/11/13/43/11134356_det.jpg"
    end
  end
  
  it 'should handle missing attributes like director' do
    mock_api :get, 'movies/770885199' , 'movies/770885199', :params => client.params do
      movie = client.movie_info("770885199")
      movie.directors.should == []
    end
  end
  
  it 'should reject `default_poster.gif` for movie poster' do
    mock_api :get, 'movies/770675547' , 'movies/770675547', :params => client.params do
      movie = client.movie_info("770675547")
      movie.image.should be_nil
    end    
  end
end

