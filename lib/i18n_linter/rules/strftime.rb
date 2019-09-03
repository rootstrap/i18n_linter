# frozen_string_literal: true

module I18nLinter
  module Rules
    class Strftime
      STRFTIME_IDENT = 'strftime'

      def check(tokens)
        tokens[0] == :method_add_arg &&
          I18nLinter::Digger.new(:@ident).find([STRFTIME_IDENT], tokens[1])
      end
    end
  end
end
