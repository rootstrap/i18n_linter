require 'i18n_linter/options'
require 'i18n_linter/result'
require 'i18n_linter/result_set'
require 'i18n_linter/string_line'
require 'ripper'

module I18nLinter
  class Linter
    def initialize(options, config)
      @options = options
      @config = config
    end

    def lint(filename:, file:)
      parsed_file = parse(filename, file)
      lines = find_strings(parsed_file)
      compile(filename, lines)
    end

    def show_errors(results)
      puts
      results.each do |result|
        file = File.readlines(result.filename)
        line = result.line
        print_block(result, file, line)
      end
      puts
    end

    private

    def parse(filename, file)
      Ripper.lex(file, filename)
    end

    def find_strings(file)
      (file.select do |line|
        token_type = line[1]
        string_content = line[2]
        token_type == :on_tstring_content && need_i18n?(string_content)
      end).map do |string_line|
        StringLine.new(string_line)
      end
    end

    def compile(filename, lines)
      result_set = ResultSet.new
      lines.each do |line|
        result_set.add_result(Result.new(filename, line, line.string))
      end
      result_set
    end

    def need_i18n?(_string)
      true
    end

    def print_block(result, file, line)
      line_number = line.line_number
      column_number = line.column_number

      previous_line = file[line_number - 2]
      current_line = file[line_number - 1]
      next_line = file[line_number]

      puts "#{result.filename}:#{line_number}:#{column_number}"
      puts "#{line_number - 1}:  #{previous_line}" if previous_line
      puts "#{line_number}:  #{current_line}"
      puts "#{line_number + 1}:  #{next_line}" if next_line
      puts '-' * 16
    end
  end
end
