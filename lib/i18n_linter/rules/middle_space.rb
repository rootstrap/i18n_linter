module I18nLinter
  module Rules
    class MiddleSpace
      def check(_plain_line, string)
        middle_space?(string)
      end

      private

      def middle_space?(string)
        /[a-zA-Z][ ]+[a-zA-Z]/ =~ string
      end
    end
  end
end
