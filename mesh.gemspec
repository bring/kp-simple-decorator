# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mesh/version"

Gem::Specification.new do |s|
  s.name        = "mesh"
  s.version     = Mesh::VERSION
  s.authors     = ["Eirik Lied"]
  s.email       = ["eiriklied@gmail.com"]
  s.homepage    = "https://github.com/Posten-Konsernportal"
  s.summary     = %q{A ruby sitemesh-like implementation}
  s.description = %q{A simple gem to give sitemesh-like functionality in a rack app using decorators.}

  s.rubyforge_project = "mesh"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "rack-plastic"
end
