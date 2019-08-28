# frozen_string_literal: true

module I18nLinter
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
end
