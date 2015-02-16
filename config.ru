require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

require 'sinatra'
require_relative 'logway'

root_dir = File.dirname(__FILE__)

set :environment, ENV['RACK_ENV'].to_sym
set :root,        root_dir
set :app_file,    File.join(root_dir, 'logway.rb')
disable :run, :reload

run Sinatra::Application
