# frozen_string_literal: true

module I18nLinter
  module Rules
    class Words
      def check(string)
        /^[A-Z].*[a-z]/ =~ string.strip
      end
    end
  end
end
