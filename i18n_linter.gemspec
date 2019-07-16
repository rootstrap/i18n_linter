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

  s.files       = `git ls-files config lib LICENSE.txt README.md`
                  .split($RS)
  s.executables = ['i18n_linter']
  s.bindir      = 'exe'
end
