# frozen_string_literal: true

module I18nLinter
  module Rules
    class Scope
      SCOPE_IDENT = 'scope'

      def check(tokens)
        tokens[0] == :command && I18nLinter::Digger.new(:@ident).find(SCOPE_IDENT, tokens[1])
      end
    end
  end
end
