# frozen_string_literal: true

module I18nLinter
  module Rules
    class ForwardSlash
      def check(_plain_line, string)
        %r{\/} =~ string
      end
    end
  end
end
