require 'i18n_linter/linter'
require 'i18n_linter/options'
require 'i18n_linter/config'

module I18nLinter
  class Runner
    def initialize(options, config)
      @options = options
      @linter = I18nLinter.linter.new(options, config)
    end

    def run
      @options.files.map do |file|
        result = lint(file)
        if result.success?
          true
        else
          @linter.show_errors(result)
          false
        end
      end.all?
    end

    private

    def lint(filename)
      file = File.read(filename)
      @linter.lint(filename: filename, file: file)
    end
  end
end
