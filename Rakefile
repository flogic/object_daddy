require 'rake'
require 'rake/testtask'
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

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
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
