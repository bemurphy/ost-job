Gem::Specification.new do |s|
  s.name        = "ost_job"
  s.version     = "0.0.1"
  s.summary     = "Job base classes for Ost"
  s.description = s.summary
  s.authors     = ["Brendon Murphy"]
  s.email       = ["xternal1+github@gmail.com"]
  s.homepage    = "http://github.com/bemurphy/ost_job"
  s.license     = "MIT"

  s.files = Dir[
    "LICENSE",
    "README.md",
    "Makefile",
    "lib/**/*.rb",
    "*.gemspec",
    "test/**/*.rb"
  ]

  s.add_development_dependency "cutest", "~> 1.2"
end
