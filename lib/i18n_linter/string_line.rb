module I18nLinter
  class StringLine
    attr_reader :line_number
    attr_reader :column_number
    attr_reader :string

    def initialize(line)
      string_position = line[0]
      @line_number = string_position[0]
      @column_number = string_position[1]
      @string = line[2]
    end
  end
end
