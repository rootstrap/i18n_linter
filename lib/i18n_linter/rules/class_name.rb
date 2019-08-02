# frozen_string_literal: true

module I18nLinter
  module Rules
    class ClassName
      CLASS_NAME_LABEL = 'class_name:'

      def check(tokens)
        tokens[0] == :assoc_new && I18nLinter::Digger.new(:@label).find(CLASS_NAME_LABEL, tokens[1])
      end
    end
  end
end
