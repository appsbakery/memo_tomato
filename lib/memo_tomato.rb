require 'multi_json'
require 'httpclient'
require 'hashie/mash'
require "memo_tomato/version"

module MemoTomato
  ROOT_URL = "http://api.rottentomatoes.com/api/public/v1.0"
end

require "memo_tomato/node"
require "memo_tomato/client"
require "memo_tomato/parser"
require "memo_tomato/movie"
