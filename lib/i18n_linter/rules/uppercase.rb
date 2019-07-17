# frozen_string_literal: true

module I18nLinter
  module Rules
    class Uppercase
      def check(string)
        /(^[A-Z]|[^\w][A-Z])\w*/ =~ string
      end
    end
  end
end
