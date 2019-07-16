# frozen_string_literal: true

module I18nLinter
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
end
