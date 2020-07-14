# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

require 'i18n_linter/config'
require 'i18n_linter/options'
require 'i18n_linter/runner'
require 'i18n_linter'

RSpec.configure do |config|
end
