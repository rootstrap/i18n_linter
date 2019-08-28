# frozen_string_literal: true

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
      $stdout = StringIO.new

      result = @options.files.map { |file|
        lint_result = lint(file)
        if lint_result.success?
          true
        else
          @linter.show_errors(lint_result)
          false
        end
      }.all?

      handle_results

      $stdout = STDOUT

      result
    end

    private

    def handle_results
      output_file = @options.out_file
      output = $stdout.string

      if output_file
        File.open(output_file, 'w') do |file|
          file.write output
        end
      else
        STDOUT.puts output
      end
    end

    def lint(filename)
      file = File.read(filename)
      @linter.lint(filename: filename, file: file)
    end
  end
end
