$:.unshift(File.dirname(__FILE__) + '/../lib/')

Spec::Runner.configure do |config|
  config.mock_with :mocha
end

def setup_rails_database
  ENV["RAILS_ENV"] ||= "test"
  require "#{File.dirname(__FILE__)}/../../../../config/environment"

  eval "
  class ActiveRecord::Base
    def self.inherited_with_object_daddy(subclass)
      self.inherited_without_object_daddy(subclass)
      subclass.send(:include, ObjectDaddy)
    end

    class << self
      alias_method_chain :inherited, :object_daddy
    end
  end
  "

  dir = File.dirname(__FILE__)
  db = YAML::load(IO.read("#{dir}/resources/config/database.yml"))
  ActiveRecord::Base.configurations = {'test' => db[ENV['DB'] || 'sqlite3']}
  ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['test'])
  ActiveRecord::Migration.verbose = false
  require "#{dir}/resources/schema"  
end
