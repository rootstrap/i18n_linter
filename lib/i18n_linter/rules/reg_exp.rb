# frozen_string_literal: true

module I18nLinter
  module Rules
    class RegExp
      def check(tokens)
        tokens[0] == :regexp_literal
      end
    end
  end
end
