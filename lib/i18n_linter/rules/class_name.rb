module I18nLinter
  module Rules
    class ClassName
      def check(plain_line, string)
        class_name?(plain_line, string)
      end

      private

      def class_name?(plain_line, string)
        escaped_string = Regexp.escape(string)

        /class\_name\:[ ]*?['"]#{escaped_string}['"]/ =~ plain_line
      end
    end
  end
end
