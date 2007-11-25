require 'fileutils'

FileUtils.mkdir(File.dirname(__FILE__) + '/../../../test/exemplars') unless File.directory?(File.dirname(__FILE__) + '/../../../test/exemplars')

puts IO.read(File.join(File.dirname(__FILE__), 'README'))
