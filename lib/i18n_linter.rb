require 'i18n_linter/linter'

module I18nLinter
  class << self
    def linter
      ::I18nLinter::Linter
    end
  end
end
