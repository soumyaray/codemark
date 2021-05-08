$:.push File.expand_path("../lib", __FILE__)
require 'codemark/version'

Gem::Specification.new do |s|
  s.name        =  'codemark'
  s.version     =  CodeMark::VERSION
  s.date        =  CodeMark::DATE

  s.executables << 'codemark'

  s.add_runtime_dependency 'redcarpet', '~> 3.5', '>= 3.5.1'

  s.add_development_dependency 'minitest', '~> 5.14'
  s.add_development_dependency 'minitest-rg', '~> 5.2'
  s.add_development_dependency 'rerun', '~> 0.13'
  s.add_development_dependency 'pry', '~> 0.14'

  s.summary     =  'Converts RMarkdown files to pure R scripts'
  s.description =  'Makes Rmd text into R comments and unfences code chunks'
  s.authors     =  ['Soumya Ray']
  s.email       =  'soumya.ray@gmail.com'

  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files -- {test,spec,features}/*`.split("\n")

  s.homepage    =  'https://github.com/soumyaray/codemark'
  s.license     =  'MIT'
end
