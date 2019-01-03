module I18nLinter
  module Rules
    class Logger
      def check(plain_line, string)
        escaped_string = Regexp.escape(string)

        /logger\.\w*\(#{escaped_string}\)/ =~ plain_line ||
          /logger\.\w*\s*#{escaped_string}/ =~ plain_line
      end
    end
  end
end
