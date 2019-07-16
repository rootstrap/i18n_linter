# frozen_string_literal: true

module I18nLinter
  module Rules
    class EnvironmentVariable
      def check(plain_line, string)
        escaped_string = Regexp.escape(string)

        /ENV\[#{escaped_string}\]/ =~ plain_line ||
          /ENV\.fetch\(#{escaped_string}\)/ =~ plain_line
      end
    end
  end
end
