# frozen_string_literal: true

module I18nLinter
  module Rules
    class Constant
      def check(tokens)
        tokens[0] == :assign && constant_assign(tokens)
      end

      private

      def constant_assign(tokens)
        assign_tokens = tokens[1]
        assign_tokens[0] == :var_field && assign_tokens[1][0] == :@const
      end
    end
  end
end
