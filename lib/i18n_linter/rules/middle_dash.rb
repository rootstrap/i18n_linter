module I18nLinter
  module Rules
    class MiddleDash
      def check(_plain_line, string)
        middle_dash?(string)
      end

      private

      def middle_dash?(string)
        /[a-zA-Z]\-[a-zA-Z]/ =~ string
      end
    end
  end
end
