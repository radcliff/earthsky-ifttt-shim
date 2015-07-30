# encoding: UTF-8

require 'bundler'

Bundler.setup
Bundler.require

ENV["RACK_ENV"] = "test"

require 'rspec'
require 'rack/test'

require "find"
%w{./config/initializers ./lib}.each do |load_path|
  Find.find(load_path) { |f| require f if f.match(/\.rb$/) }
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.color = true
  config.formatter = :documentation
end
