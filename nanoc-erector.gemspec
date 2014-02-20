# encoding: utf-8

$LOAD_PATH.unshift(File.expand_path('../lib/', __FILE__))
require 'nanoc/erector/version'

Gem::Specification.new do |s|
  s.name        = 'nanoc-erector'
  s.version     = Nanoc::Erector::VERSION
  s.homepage    = 'http://nanoc.ws/'
  s.summary     = 'Erector filter for nanoc'
  s.description = 'Provides an :erector filter for nanoc'

  s.author  = 'Denis Defreyne'
  s.email   = 'denis.defreyne@stoneship.org'
  s.license = 'MIT'

  s.required_ruby_version = '>= 1.9.3'

  s.files              = Dir['[A-Z]*'] +
                         Dir['{lib,test}/**/*'] +
                         [ 'nanoc-erector.gemspec' ]
  s.require_paths      = [ 'lib' ]

  s.rdoc_options     = [ '--main', 'README.md' ]
  s.extra_rdoc_files = [ 'LICENSE', 'README.md', 'NEWS.md' ]

  s.add_runtime_dependency('nanoc', '>= 3.6.7', '< 4.0.0')
  s.add_runtime_dependency('erector')
  s.add_development_dependency('bundler')
end
