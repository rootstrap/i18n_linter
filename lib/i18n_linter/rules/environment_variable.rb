# frozen_string_literal: true

module I18nLinter
  module Rules
    class EnvironmentVariable
      ENV_CONST = 'ENV'

      def check(tokens)
        reference_or_method(tokens) && I18nLinter::Digger.new(:@const).find([ENV_CONST], tokens[1])
      end

      private

      def reference_or_method(tokens)
        %i[aref method_add_arg].include?(tokens[0])
      end
    end
  end
end
