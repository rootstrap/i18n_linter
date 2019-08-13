# frozen_string_literal: true

module I18nLinter
  module Rules
    class Underscore
      def check(tokens)
        tokens[0] == :string_content && underscore?(tokens)
      end

      private

      def underscore?(tokens)
        string_tokens = tokens[1]
        return false unless string_tokens

        string_tokens[0] == :@tstring_content && /\_/ =~ string_tokens[1]
      end
    end
  end
end
