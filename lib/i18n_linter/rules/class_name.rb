# frozen_string_literal: true

module I18nLinter
  module Rules
    class ClassName
      def check(tokens)
        tokens[0] == :assoc_new && class_name_label(tokens)
      end

      private

      def class_name_label(tokens)
        label_tokens = tokens[1]
        label_tokens[0] == :@label && label_tokens[1] == 'class_name:'
      end
    end
  end
end
