module I18nLinter
  module Rules
    class ClassName
      def check(plain_line, string)
        class_name?(plain_line, string)
      end

      private

      def class_name?(plain_line, string)
        /class\_name\:[ ]*?['"]#{string}['"]/ =~ plain_line
      end
    end
  end
end
