module I18nLinter
  module Rules
    class ClassName
      def check(plain_line, string)
        escaped_string = Regexp.escape(string)

        /class\_name\:\s*#{escaped_string}/ =~ plain_line
      end
    end
  end
end
