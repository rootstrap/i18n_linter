# frozen_string_literal: true

require 'i18n_linter/linter'

require 'i18n_linter/rules'
require 'i18n_linter/rules/middle_space'
require 'i18n_linter/rules/words'
require 'i18n_linter/rules/environment_variable'
require 'i18n_linter/rules/class_name'
require 'i18n_linter/rules/constant'
require 'i18n_linter/rules/logger'
require 'i18n_linter/rules/puts'
require 'i18n_linter/rules/scope'
require 'i18n_linter/rules/strftime'
require 'i18n_linter/rules/http_headers'

require 'i18n_linter/helpers/digger'
require 'i18n_linter/options'
require 'i18n_linter/constants'
require 'i18n_linter/result'
require 'i18n_linter/token'
require 'i18n_linter/result_set'
require 'i18n_linter/string_line'

require 'ripper'

module I18nLinter
  class << self
    def linter
      ::I18nLinter::Linter
    end
  end
end
