require 'rake'
require 'rake/testtask'
require 'yaml'
begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "object_daddy"
    s.summary = "Object Daddy"
    s.description = "Fixture killer"
    s.authors = ['Rick Bradley', 'Yossef Mendelssohn']
    s.email = 'blogicx@rickbradley.com', 'ymendel@pobox.com'
    s.homepage = 'http://github.com/flogic/object_daddy'
    s.files = FileList["[A-Z]*.*", "*.rb", "{lib,rails,spec}/**/*"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickels-jeweler -s http://gems.github.com"
end

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.rcov = true
end
task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  config = YAML.load(File.read('VERSION.yml'))
  version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "postgis_adapter #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
