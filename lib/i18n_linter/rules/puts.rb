module I18nLinter
  module Rules
    class Puts
      def check(plain_line, string)
        puts?(plain_line, string)
      end

      private

      def puts?(plain_line, string)
        escaped_string = Regexp.escape(string)

        /puts\s*\(#{escaped_string}\)/ =~ plain_line ||
          /puts\s+#{escaped_string}/ =~ plain_line
      end
    end
  end
end
