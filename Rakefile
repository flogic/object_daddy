require 'rake'
require 'rake/testtask'
require 'yaml'

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
