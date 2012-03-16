# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "memo_tomato/version"

Gem::Specification.new do |s|
  s.name        = "memo_tomato"
  s.version     = MemoTomato::VERSION
  s.authors     = ["Todor Grudev", "Alex Ganov"]
  s.email       = ["tagrudev@gmail.com", "aganov@gmail.com"]
  s.homepage    = "http://github.com/appsbakery/memo_tomato"
  s.summary     = %q{Ruby wrapper for the Rotten Tomatoes API}
  s.description = %q{An object-oriented Ruby wrapper for the Rotten Tomatoes API http://api.rottentomatoes.com/}

  s.rubyforge_project = "memo_tomato"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "multi_json", "~> 1.0"
  s.add_runtime_dependency "httpclient", "~> 2.2"
  s.add_runtime_dependency "hashie", "~> 1.1.0"
  
  
  s.add_development_dependency "pry"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", "~> 2.0"
  s.add_development_dependency "webmock", "~> 1.6"
end
