# frozen_string_literal: true

module I18nLinter
  module Rules
    class Puts
      PUTS_IDENT = 'puts'

      def check(tokens)
        command_or_method(tokens) && I18nLinter::Digger.new(:@ident).find([PUTS_IDENT], tokens[1])
      end

      private

      def command_or_method(tokens)
        %i[command method_add_arg].include?(tokens[0])
      end
    end
  end
end
