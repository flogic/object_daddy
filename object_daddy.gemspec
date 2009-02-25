# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{object_daddy}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rick Bradley", "Yossef Mendelssohn"]
  s.date = %q{2009-02-25}
  s.email = ["blogicx@rickbradley.com", "ymendel@pobox.com"]
  s.files = ["Manifest.txt", "README.markdown", "VERSION.yml", "init.rb", "install.rb", "lib/object_daddy.rb", "rails/init.rb", "spec/install_spec.rb", "spec/object_daddy_spec.rb", "spec/resources", "spec/resources/config", "spec/resources/config/database.yml", "spec/resources/schema", "spec/spec.opts", "spec/spec_helper.rb", "spec/tmp"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/flogic/object_daddy}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Object Daddy}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
