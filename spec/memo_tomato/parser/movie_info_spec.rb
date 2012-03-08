require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe MemoTomato::Parser::MovieInfo do
  let(:client) { MemoTomato::Client.new(:apikey => "abcd1234") }
  
  it 'should be awesome' do
    mock_api :get, 'movies/770672122' , 'movies/770672122', :params => client.params do
      m = client.movie_info("770672122")
      m.id.should == 770672122
      m.directors.first.name.should == "Lee Unkrich"
      m.genres.first.type.should == "Animation"
    end
  end
end

