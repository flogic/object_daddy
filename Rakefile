# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "object-daddy"
  gem.homepage = "http://github.com/awebneck/object_daddy"
  gem.license = "MIT"
  gem.summary = %Q{Kill Fixtures}
  gem.description = %Q{Object Daddy is a library (as well as a Ruby on Rails plugin) designed to assist in automating testing of large collections of objects, especially webs of ActiveRecord models. It is a descendent of the "Object Mother" pattern for creating objects for testing, and is related to the concept of an "object exemplar" or stereotype.}
  gem.email = ["blogicx@rickbradley.com", "ymendel@pobox.com", "jeremy@jeremypholland.com"]
  gem.authors = ["Rick Bradley", "Yossef Mendelssohn", "Jeremy Holland"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec
