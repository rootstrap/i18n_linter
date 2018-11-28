module I18nLinter
  module Rules
    class Uppercase
      def check(_plain_line, string)
        uppercase?(string)
      end

      private

      def uppercase?(string)
        /[A-Z]/ =~ string
      end
    end
  end
end
