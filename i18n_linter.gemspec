$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'i18n_linter/version'

Gem::Specification.new do |s|
  s.name        = 'i18n_linter'
  s.version     = I18nLinter::VERSION
  s.date        = '2018-11-14'
  s.summary     = 'i18n linter plugin'
  s.description = s.summary
  s.authors     = ['Franco Pariani']
  s.email       = 'franco@rootstrap.com'
  s.homepage    = 'http://rubygems.org/gems/i18n_linter'
  s.license     = 'MIT'

  s.files       = Dir['{lib}/**/*', 'i18n_linter']
  s.executables = ['i18n_linter']

  s.add_development_dependency 'reek', '~> 5.2'
  s.add_development_dependency 'rspec-rails', '~> 3.8'
  s.add_development_dependency 'rubocop', '~> 0.59.2'
end
