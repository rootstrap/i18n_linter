require 'i18n_linter/options'
require 'ripper'
require 'byebug'

module I18nLinter
  class Linter
    class AttributesParseError < StandardError; end

    class Result
      attr_reader :filename
      attr_reader :line
      attr_reader :string

      def initialize(filename, line, string)
        @filename = filename
        @line = line
        @string = string
      end
    end

    class ResultSet
      include Enumerable

      def initialize
        @results = []
      end

      def add_result(result)
        @results << result
      end

      def each
        @results.each do |result|
          yield result
        end
      end

      def success?
        count.zero?
      end
    end

    class StringLine
      attr_reader :line_number
      attr_reader :column_number
      attr_reader :string

      def initialize(line)
        string_position = line[0]
        @line_number = string_position[0]
        @column_number = string_position[1]
        @string = line[1]
      end
    end

    def initialize; end

    def lint(filename:, file:)
      parsed_file = parse(filename, file)
      lines = find_strings(parsed_file)
      compile(filename, lines)
    end

    def show_errors(results)
      puts
      files = Hash.new { |hash, key| hash[key] = File.readlines(key) }
      results.each do |result|
        file = files[result.filename]
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
        string_content = line[1]
        string_content == :on_tstring_content && need_i18n?(string_content)
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

      previous_line_number = line_number - 2
      current_line_number = line_number - 1
      next_line_number = line_number

      previous_line = file[previous_line_number]
      current_line = file[current_line_number]
      next_line = file[next_line_number]

      puts "#{result.filename}:#{line_number}:#{line.column_number}"
      puts "#{previous_line_number}:  #{previous_line}" if previous_line
      puts "#{current_line_number}:  #{current_line}"
      puts "#{next_line_number}:  #{next_line}" if next_line
      puts '-' * 16
    end
  end
end
