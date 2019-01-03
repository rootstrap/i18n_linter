module I18nLinter
  module Rules
    class MiddleSpace
      def check(_plain_line, string)
        /[a-zA-Z\d]\s+[a-zA-Z\d]/ =~ string
      end
    end
  end
end
