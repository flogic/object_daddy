require 'rake'
require 'rake/testtask'
begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "object_daddy"
    s.summary = "Object Daddy"
    s.authors = ['Rick Bradley', 'Yossef Mendelssohn']
    s.email = 'blogicx@rickbradley.com', 'ymendel@pobox.com'
    s.homepage = 'http://github.com/flogic/object_daddy'
    s.files = FileList["[A-Z]*.*", "*.rb", "{lib,rails,spec}/**/*"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickels-jeweler -s http://gems.github.com"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'spec/*_spec.rb'
  t.verbose = false
end

