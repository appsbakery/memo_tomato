$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))


require 'rspec'
require 'pry'
require 'timecop'
require 'memo_tomato'
require 'helpers/webmock_helper'

RSpec.configure do |config|
  config.before(:each) do
    Timecop.return
  end
end
