require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")

describe MemoTomato::Client do
  let(:client) { MemoTomato::Client.new(:apikey => 'abcd1234') }
  
  describe '#build_params' do
    it 'should merge provided params with api key' do
      params = client.send :build_params, { :q => 'Jack' }
      params[:apikey].should == 'abcd1234'
      params[:q].should == 'Jack'
    end
  end
  
  describe '#build_endpoint' do
    it 'should merge path with root url' do
      client.send(:build_endpoint, 'movies').should == "http://api.rottentomatoes.com/api/public/v1.0/movies.json"
    end
  end
end
