# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "stemmer"
  s.version = "1.0.1"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt Mower"]
  s.autorequire = "stemmer"
  s.cert_chain = nil
  s.date = "2005-04-20"
  s.email = "self@mattmower.com"
  s.homepage = "http://rubyforge.org/projects/stemmer/"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubygems_version = "1.8.16"
  s.summary = "Word stemming algorithm(s)"

  if s.respond_to? :specification_version then
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
