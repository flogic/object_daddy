require File.dirname(__FILE__) + '/spec_helper'
require 'fileutils'

describe 'the plugin install.rb script' do
  before :each do
    FileUtils.stubs(:mkdir)
    self.stubs(:puts).returns(true)
  end
  
  def do_install
    eval File.read(File.join(File.dirname(__FILE__), *%w[.. install.rb ]))
  end
  
  describe 'when there is a test/exemplars directory under RAILS_ROOT' do
    it 'CURRENTLY does not make a new test/exemplars directory' do
      File.stubs(:directory?).with('./../../../test/exemplars').returns(true)      
      FileUtils.expects(:mkdir).never
      do_install
    end
  end

  describe 'when there is no test/exemplars directory under RAILS_ROOT' do
    it 'CURRENTLY creates a new test/exemplars directory' do
      File.stubs(:directory?).with('./../../../test/exemplars').returns(false)
      FileUtils.expects(:mkdir)
      do_install
    end
  end
  
  it 'displays the content of the plugin README file' do
    self.stubs(:readme_contents).returns('README CONTENTS')
    self.expects(:puts).with('README CONTENTS')
    do_install
  end
  
  describe 'readme_contents' do
    it 'should work without arguments' do
      do_install
      lambda { readme_contents }.should_not raise_error(ArgumentError)
    end
    
    it 'should accept no arguments' do
      do_install
      lambda { readme_contents(:foo) }.should raise_error(ArgumentError)
    end
    
    it 'should read the plugin README file' do
      do_install
      File.stubs(:join).returns('/path/to/README')
      IO.expects(:read).with('/path/to/README')
      readme_contents
    end
    
    it 'should return the contents of the plugin README file' do
      do_install
      File.stubs(:join).returns('/path/to/README')
      IO.stubs(:read).with('/path/to/README').returns('README CONTENTS')
      readme_contents.should == 'README CONTENTS'
    end
  end
end