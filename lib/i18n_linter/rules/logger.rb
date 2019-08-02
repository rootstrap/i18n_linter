# frozen_string_literal: true

module I18nLinter
  module Rules
    class Logger
      LOGGER_IDENT = 'logger'

      def check(tokens)
        command_or_method(tokens) && I18nLinter::Digger.new(:@ident).find(LOGGER_IDENT, tokens[1])
      end

      private

      def command_or_method(tokens)
        %i[command_call method_add_block method_add_arg].include?(tokens[0])
      end
    end
  end
end
