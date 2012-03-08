require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe MemoTomato::Parser::UpcomingMovies do
  let(:client) { MemoTomato::Client.new(:apikey => "abcd1234") }
  
  it 'should be awesome' do
    mock_api :get, 'lists/movies/upcoming' , 'lists/movies/upcoming', :params => client.params do
      m = client.upcoming_movies
      m.first.id.should == "770863876"
    end
  end
end

