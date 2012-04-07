class ObjectDaddyGenerator < Rails::Generators::Base
  desc "create exemplars directory"
  def create_exemplars_dir
    testfw = File.exists?("#{destination_root}/test") ? "test" : "spec"
    empty_directory "#{testfw}/exemplars"
    create_file "#{testfw}/exemplars/.gitkeep", "git sucks"
  end
end
