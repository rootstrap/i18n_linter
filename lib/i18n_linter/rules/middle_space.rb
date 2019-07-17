# frozen_string_literal: true

module I18nLinter
  module Rules
    class MiddleSpace
      def check(string)
        /.\s+./ =~ string
      end
    end
  end
end
