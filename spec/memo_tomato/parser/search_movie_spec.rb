require File.expand_path(File.dirname(__FILE__) + "/../../spec_helper")

describe MemoTomato::Parser::SearchMovie do
  let(:client) { MemoTomato::Client.new(:apikey => "abcd1234") }
  
  it 'should be awesome' do
    mock_api :get, 'movies', 'movies', :params => client.params.merge(:q => "Jack") do
      m = client.search("Jack")
      m.class.should == Array
      m.first.title == "Jack the Giant Killer"
    end
  end
end

