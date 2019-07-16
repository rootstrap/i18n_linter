# frozen_string_literal: true

module I18nLinter
  module Rules
    class Strftime
      def check(plain_line, string)
        escaped_string = Regexp.escape(string)

        /strftime\s*\(#{escaped_string}\)/ =~ plain_line ||
          /strftime\s+#{escaped_string}/ =~ plain_line
      end
    end
  end
end
