require 'fileutils'

def readme_contents
  IO.read(File.join(File.dirname(__FILE__), 'README'))
end

FileUtils.mkdir(File.dirname(__FILE__) + '/../../../test/exemplars') unless File.directory?(File.dirname(__FILE__) + '/../../../test/exemplars')

puts readme_contents
