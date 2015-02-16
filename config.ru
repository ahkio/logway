require "rubygems"
require "bundler/setup"

Bundler.require(:default)

require_relative "logway"

root_dir = File.dirname(__FILE__)

set :environment, ENV["RACK_ENV"].to_sym
set :root,        root_dir
set :app_file,    File.join(root_dir, "logway.rb")
disable :run

log = File.new("log/logway.log", "a+")
$stdout.reopen(log)
$stderr.reopen(log)

run Sinatra::Application
