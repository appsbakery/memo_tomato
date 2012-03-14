require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")
require 'pry'

describe MemoTomato::Parser::MovieInfo do
  let(:client) { MemoTomato::Client.new(:apikey => "abcd1234") }
  
  it 'should be awesome' do
    mock_api :get, 'movies/770672122' , 'movies/770672122', :params => client.params do
      movie = client.movie_info("770672122")
      movie.id.should == 770672122
      movie.directors.first.name.should == "Lee Unkrich"
      movie.genres.first.type.should == "Animation"
    end
  end
  
  it 'should handle missing attributes like director' do
    mock_api :get, 'movies/770885199' , 'movies/770885199', :params => client.params do
      movie = client.movie_info("770885199")
      movie.directors.should == []
    end
  end
end

