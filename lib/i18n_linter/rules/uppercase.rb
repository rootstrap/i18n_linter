module I18nLinter
  module Rules
    class Uppercase
      def check(_plain_line, string)
        /(^[A-Z]|[^\w][A-Z])\w*/ =~ string
      end
    end
  end
end
