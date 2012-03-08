# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "memo_tomato/version"

Gem::Specification.new do |s|
  s.name        = "memo_tomato"
  s.version     = MemoTomato::VERSION
  s.authors     = ["Todor Grudev", "Alex Ganov"]
  s.email       = ["tagrudev@gmail.com", "aganov@gmail.com"]
  s.homepage    = "www.appsbakery.eu"
  s.summary     = %q{Memo Tomato is an api wrapper for the http://api.rottentomatoes.com/ The gem is created to fulfil the needs of the project http://watchmemo.com}
  s.description = %q{https://github.com/appsbakery/memo_tomato}

  s.rubyforge_project = "memo_tomato"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency "multi_json", "~> 1.0"
  s.add_runtime_dependency "httpclient", ">= 2.2.0.2"
  s.add_runtime_dependency "hashie", ">= 1.1.0"
  s.add_development_dependency "pry", ">= 0.9.8.4"
  s.add_development_dependency "rake", ">= 0.8.7"
  s.add_development_dependency "rspec", ">= 2"
  s.add_development_dependency "webmock", ">= 1.6.2"
  s.add_development_dependency "timecop", ">= 0.3.5"
end
