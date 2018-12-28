require 'i18n_linter'

module I18nLinter
  class Linter
    def initialize(options, config)
      @options = options
      @config = config
    end

    def lint(filename:, file:)
      parsed_file = tokenize_file(filename, file)
      lines = find_strings(filename, parsed_file)
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

    def tokenize_file(filename, file)
      Ripper.lex(file, filename).map { |token| Token.new(token) }
    end

    def get_token(file, index)
      file[index]
    end

    def get_string_array(file, current_index)
      (rest_of_file(file, current_index).take_while do |token|
        token.type != :on_tstring_end
      end).map(&:content)
    end

    def rest_of_file(file, current_index)
      file.last(file.length - current_index)
    end

    def find_strings(filename, file)
      strings = []
      current_index = 0

      while current_index < file.length
        token = get_token(file, current_index)

        if token.type == :on_tstring_beg
          new_array_string = get_string_array(file, current_index)
          current_index += new_array_string.length
          new_array_string << file[current_index].content
          new_string = [token.coords, new_array_string.join]

          strings << StringLine.new(new_string) if need_i18n?(filename, new_string)
        end

        current_index += 1
      end

      strings
    end

    def compile(filename, lines)
      result_set = ResultSet.new
      lines.each do |line|
        result_set.add_result(Result.new(filename, line, line.string))
      end
      result_set
    end

    def need_i18n?(filename, line)
      file = File.readlines(filename)
      plain_line = file[line[0][0] - 1]
      string_content = line[1]

      check_positive_rules(plain_line, string_content) &&
        check_negative_rules(plain_line, string_content)
    end

    def check_positive_rules(plain_line, string_content)
      @config.enabled_positive_rules.any? do |rule|
        Rules.check_rule(rule, plain_line, string_content)
      end
    end

    def check_negative_rules(plain_line, string_content)
      @config.enabled_negative_rules.none? do |rule|
        Rules.check_rule(rule, plain_line, string_content)
      end
    end

    def print_block(result, file, line)
      line_number = line.line_number
      column_number = line.column_number

      previous_line = file[line_number - 2] if line_number > 2
      current_line = file[line_number - 1]
      next_line = file[line_number] if line_number < file.length

      puts "#{result.filename}:#{line_number}:#{column_number}"
      puts "#{line_number - 1}:  #{previous_line}" if previous_line
      puts "#{line_number}:  #{current_line}"
      puts "#{line_number + 1}:  #{next_line}" if next_line
      puts '-' * 16
    end
  end
end
