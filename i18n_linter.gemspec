# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'i18n_linter/version'

Gem::Specification.new do |s|
  s.name        = 'i18n_linter'
  s.version     = I18nLinter::VERSION
  s.date        = '2019-10-04'
  s.summary     = 'i18n linter plugin'
  s.description = s.summary
  s.authors     = ['Franco Pariani']
  s.email       = 'franco@rootstrap.com'
  s.homepage    = 'http://rubygems.org/gems/i18n_linter'
  s.license     = 'MIT'

  s.files       = `git ls-files config lib LICENSE.txt README.md`
                  .split($RS)
  s.executables = ['i18n_linter']
  s.bindir      = 'exe'

  s.add_development_dependency 'colorize', '~> 0.8.1'
  s.add_development_dependency 'reek', '~> 5.2'
  s.add_development_dependency 'rspec', '~> 3.8'
  s.add_development_dependency 'rubocop', '~> 0.59.2'
  s.add_development_dependency 'simplecov', '~> 0.13.0'
end
