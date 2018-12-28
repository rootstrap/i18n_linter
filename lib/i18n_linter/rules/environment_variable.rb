module I18nLinter
  module Rules
    class EnvironmentVariable
      def check(plain_line, string)
        env_variable?(plain_line, string)
      end

      private

      def env_variable?(plain_line, string)
        escaped_string = Regexp.escape(string)

        /ENV\[['"]#{escaped_string}['"]\]/ =~ plain_line ||
          /ENV\.fetch\(['"]#{escaped_string}['"]\)/ =~ plain_line
      end
    end
  end
end
