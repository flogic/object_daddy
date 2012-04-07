require 'rubygems'
require 'rails/all'
require 'rails/generators'
require 'rspec/rails'
require 'pry'

$:.unshift(File.dirname(__FILE__) + '/../lib/')

RSpec.configure do |config|
  config.mock_with :mocha
end

def setup_rails_database
  dir = File.dirname(__FILE__)

  ENV["RAILS_ENV"] ||= "test"

  ActiveRecord::Base.configurations = {'test' => {:adapter => 'sqlite3', :database => dir + '/tmp/object_daddy.db'}}
  ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['test'])
  ActiveRecord::Migration.verbose = false
  load "#{dir}/resources/schema"
end
