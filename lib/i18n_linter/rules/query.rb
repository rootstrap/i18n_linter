# frozen_string_literal: true

module I18nLinter
  module Rules
    class Query
      def check(tokens)
        tokens[0] == :method_add_arg &&
          I18nLinter::Digger.new(:@ident).find(I18nLinter::Constants::QUERY_METHODS, tokens[1])
      end
    end
  end
end
