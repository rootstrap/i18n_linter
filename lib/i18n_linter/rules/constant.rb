module I18nLinter
  module Rules
    class Constant
      def check(plain_line, string)
        constant?(plain_line, string)
      end

      private

      def constant?(plain_line, string)
        /[A-Z]+[ ]*?\=[ ]*[\'\"]#{string}[\'\"]/ =~ plain_line
      end
    end
  end
end
