# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "adconnect/version"

Gem::Specification.new do |s|
  s.name        = "adconnect"
  s.version     = Adconnect::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Moulton"]
  s.email       = ["dave@themoultons.net"]
  s.homepage    = ""
  s.summary     = %q{Connect to Active Directory}
  s.description = %q{A Gem tuned specifically to authenticate to Active Directory's flavor of ldap. Very bare-bones}

  s.rubyforge_project = "adconnect"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency(%q<net-ldap>, [">= 0.1.1.0"])
end
