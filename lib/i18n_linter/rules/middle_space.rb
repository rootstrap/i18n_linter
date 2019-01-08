module I18nLinter
  module Rules
    class MiddleSpace
      def check(_plain_line, string)
        /.\s+./ =~ string
      end
    end
  end
end
