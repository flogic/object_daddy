$:.unshift(File.join(File.dirname(__FILE__), 'lib'))
require 'rubygems'
require 'echoe'

VERSION = '0.2.9.1'

Echoe.new('object_daddy', VERSION) do |p|
  p.author = 'Rick Bradley', 'Yossef Mendelssohn'
  p.email = 'blogicx@rickbradley.com', 'ymendel@pobox.com'
  p.summary = VERSION
  p.url = 'http://github.com/flogic/object_daddy'
  p.manifest_name = 'Manifest.txt'
end

['audit','test','test_deps','default','post_blog'].each do |task|
  Rake.application.instance_variable_get('@tasks').delete(task)
end
