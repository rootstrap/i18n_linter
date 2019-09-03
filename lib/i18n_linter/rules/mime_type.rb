# frozen_string_literal: true

require 'mime/types'

module I18nLinter
  module Rules
    class MimeType
      def check(tokens)
        tokens[0] == :string_content && mime_type?(tokens)
      end

      private

      def mime_type?(tokens)
        string_tokens = tokens[1]
        return false unless string_tokens

        string_tokens[0] == :@tstring_content && check_mime_types(string_tokens)
      end

      def check_mime_types(tokens)
        string = tokens[1]
        MIME::Types.any? { |mime| string.include?(mime) }
      end
    end
  end
end
