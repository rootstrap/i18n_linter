# frozen_string_literal: true

require 'i18n_linter'
require 'colorize'

module I18nLinter
  class Linter
    def initialize(options, config)
      @options = options
      @config = config
      @strings = []
    end

    def lint(filename:, file:)
      parsed_file = tokenize_file(filename, file)
      find_strings(filename, parsed_file)
      compile(filename)
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

    def tokenize_file(filename, file)
      Ripper.sexp(file, filename)
    end

    def get_token(file, index)
      file[index]
    end

    def get_string_array(file, current_index)
      rest_of_file(file, current_index).take_while { |token|
        !%i[on_tstring_end on_label_end].include?(token.type)
      }.map(&:content)
    end

    def rest_of_file(file, current_index)
      file.last(file.length - current_index)
    end

    def find_strings(filename, tokens)
      return unless array?(tokens)

      if array?(tokens[0])
        tokens.each { |child| find_strings(filename, child) }
      else
        check_rules(filename, tokens)
      end
    end

    def check_rules(filename, tokens)
      if string_element?(tokens)
        string = tokens[1]
        @strings << StringLine.new(tokens[2], string) if Rules.check_string_rules(@config, string)
      else
        test_rules(filename, tokens)
      end
    end

    def array?(elem)
      elem.class == Array
    end

    def string_element?(elem)
      elem[0] == :@tstring_content
    end

    def compile(filename)
      result_set = ResultSet.new
      @strings.each do |string_line|
        result_set.add_result(Result.new(filename, string_line, string_line.string))
      end
      @strings = []
      result_set
    end

    def test_rules(filename, tokens)
      return if tokens.empty? || Rules.check_negative_context_rules(@config, tokens)

      check_rest_of_tokens(filename, tokens)
    end

    def check_rest_of_tokens(filename, tokens)
      tokens[1..-1].each { |child| find_strings(filename, child) }
    end

    def print_block(result, file, line)
      line_number = line.line_number
      column_number = line.column_number

      previous_line = file[line_number - 2] if line_number > 2
      current_line = file[line_number - 1]
      next_line = file[line_number] if line_number < file.length

      output = "#{result.filename}:#{line_number}:#{column_number}\n".colorize(:green)
      output += "#{line_number - 1}:  #{previous_line}" if previous_line
      output += "#{line_number}:  #{current_line}".colorize(:red)
      output += "#{line_number + 1}:  #{next_line}" if next_line

      puts output
    end
  end
end
