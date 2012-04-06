require 'rubygems'
require 'rails/all'
require 'rails/generators'
require 'rspec/rails'

$:.unshift(File.dirname(__FILE__) + '/../lib/')

RSpec.configure do |config|
  config.mock_with :mocha
end

def setup_rails_database
  dir = File.dirname(__FILE__)

  ENV["RAILS_ENV"] ||= "test"
  require "#{dir}/../../../../config/environment"

  db = YAML::load(IO.read("#{dir}/resources/config/database.yml"))
  ActiveRecord::Base.configurations = {'test' => db[ENV['DB'] || 'sqlite3']}
  ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['test'])
  ActiveRecord::Migration.verbose = false
  load "#{dir}/resources/schema"

  # def ::ActiveRecord::Base.
  #   def self.inherited_with_object_daddy(subclass)
  #     self.inherited_without_object_daddy(subclass)
  #     subclass.send(:include, ObjectDaddy) unless subclass < ObjectDaddy
  #   end

  #   class << self
  #     alias_method_chain :inherited, :object_daddy
  #   end
  # end
end
