module I18nLinter
  module Rules
    class Constant
      def check(plain_line, string)
        escaped_string = Regexp.escape(string)

        /[A-Z]+\s*?\=\s*#{escaped_string}/ =~ plain_line
      end
    end
  end
end
