require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe MemoTomato::Parser::SimilarMovies do
  let(:client) { MemoTomato::Client.new(:apikey => "abcd1234") }
  
  it 'should be awesome' do
    mock_api :get, 'movies/770672122/similar' , 'movies/770672122/similar', :params => client.params do
      m = client.similar_movies("770672122")
      m.first.id.should == "770671912"
    end
  end
end

