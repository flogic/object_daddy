require 'spec_helper'
require 'generators/object_daddy_generator'
require 'generator_spec/test_case'

describe ObjectDaddyGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp/generator/", __FILE__)

  before(:all) do
    prepare_destination
  end

  describe 'when there is a spec directory under RAILS_ROOT' do
    before :each do
      FileUtils.mkdir "#{destination_root}/spec"
    end

    describe 'and there is a spec/exemplars directory under RAILS_ROOT' do
      before :each do
        FileUtils.mkdir "#{destination_root}/spec/exemplars"
      end

      it 'should not create any new directories' do
        FileUtils.touch "#{destination_root}/spec/exemplars/test_exemplar.rb"
        run_generator
        destination_root.should have_structure {
          directory "spec" do
            directory "exemplars" do
              file "test_exemplar.rb"
            end
          end
        }
      end

      after :each do
        FileUtils.rm_rf "#{destination_root}/spec/exemplars"
      end
    end

    describe 'but there is no spec/exemplars directory under RAILS_ROOT' do
      it 'should create a spec/exemplars directory under RAILS_ROOT' do
        run_generator
        destination_root.should have_structure {
          directory "spec" do
            directory "exemplars" do
              file ".gitkeep"
            end
          end
        }
      end
    end

    after :each do
      FileUtils.rm_rf "#{destination_root}/spec"
    end
  end

  describe 'when there is no spec directory under RAILS_ROOT' do
    describe 'and there is a test directory under RAILS_ROOT' do
      before :each do
        FileUtils.mkdir "#{destination_root}/test"
      end

      describe 'and there is a test/exemplars directory under RAILS_ROOT' do
        before :each do
          FileUtils.mkdir "#{destination_root}/test/exemplars"
        end

        it 'should not create any new directories' do
          FileUtils.touch "#{destination_root}/test/exemplars/test_exemplar.rb"
          run_generator
          destination_root.should have_structure {
            directory "test" do
              directory "exemplars" do
                file "test_exemplar.rb"
              end
            end
          }
        end

        after :each do
          FileUtils.rm_rf "#{destination_root}/test/exemplars"
        end
      end

      describe 'but there is no test/exemplars directory under RAILS_ROOT' do
        it 'should create a test/exemplars directory under RAILS_ROOT' do
          run_generator
          destination_root.should have_structure {
            directory "test" do
              directory "exemplars" do
                file ".gitkeep"
              end
            end
          }
        end
      end

      after :each do
        FileUtils.rm_rf "#{destination_root}/test"
      end
    end

    describe 'and there is no test directory under RAILS_ROOT' do
      it 'should create a spec directory under RAILS_ROOT' do
        run_generator
        destination_root.should have_structure {
          directory "spec"
        }
      end

      it 'should create a spec/exemplars directory under RAILS_ROOT' do
        run_generator
        destination_root.should have_structure {
          directory "spec" do
            directory "exemplars" do
              file ".gitkeep"
            end
          end
        }
      end
    end
  end
end
