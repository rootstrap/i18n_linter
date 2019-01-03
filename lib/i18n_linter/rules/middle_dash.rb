module I18nLinter
  module Rules
    class MiddleDash
      def check(_plain_line, string)
        /[a-zA-Z]\-[a-zA-Z]/ =~ string
      end
    end
  end
end
