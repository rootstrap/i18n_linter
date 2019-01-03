module I18nLinter
  module Rules
    class Uppercase
      def check(_plain_line, string)
        /[A-Z]/ =~ string
      end
    end
  end
end
