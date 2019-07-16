# frozen_string_literal: true

module I18nLinter
  module Rules
    class Logger
      def check(plain_line, string)
        escaped_string = Regexp.escape(string)

        /logger\.\w+\s*\(\s*#{escaped_string}\s*\)/ =~ plain_line ||
          /logger\.\w+\s*#{escaped_string}/ =~ plain_line ||
          /logger\.\w+\s*\{\s*#{escaped_string}\s*\}/ =~ plain_line
      end
    end
  end
end
