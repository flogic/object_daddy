# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{object_daddy}
  s.version = "0.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rick Bradley, Yossef Mendelssohn"]
  s.date = %q{2009-01-31}
  s.description = %q{0.4.0}
  s.email = ["blogicx@rickbradley.com", "ymendel@pobox.com"]
  s.extra_rdoc_files = ["lib/object_daddy.rb", "README.markdown"]
  s.files = ["init.rb", "install.rb", "lib/object_daddy.rb", "MIT-LICENSE", "object_daddy.gemspec", "Rakefile", "README.markdown", "spec/install_spec.rb", "spec/object_daddy_spec.rb", "spec/resources/config/database.yml", "spec/resources/schema", "spec/spec.opts", "spec/spec_helper.rb", "rails/init.rb", "Manifest.txt"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/flogic/object_daddy}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Object_daddy", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{object_daddy}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{0.4.0}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
