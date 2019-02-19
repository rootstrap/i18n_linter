module I18nLinter
  class StringLine
    attr_reader :line_number
    attr_reader :column_number
    attr_reader :string

    def initialize(coords, string)
      @line_number = coords[0]
      @column_number = coords[1]
      @string = string
    end
  end
end
