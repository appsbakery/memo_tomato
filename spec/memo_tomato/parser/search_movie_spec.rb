require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe MemoTomato::Parser::SearchMovie do
  let(:client) { MemoTomato::Client.new(:apikey => "abcd1234") }
  
  it 'should be awesome' do
    mock_api :get, 'movies', 'movies', :params => client.params.merge(:q => "Jack") do
      m = client.search("Jack")
      m.class.should == Array
      m.count.should == 30
      m.first.title.should == "Jack the Giant Killer"
      m.first.release_date == "2012-06-15"
      m.first.studio.should == nil
      m.first.cast.first.name.should == "Nicholas Hoult"
    end
  end
end

