# frozen_string_literal: true

module I18nLinter
  module Rules
    class HttpHeaders
      def check(tokens)
        tokens[0] == :assoc_new && string_literal(tokens)
      end

      private

      def string_literal(tokens)
        literal_tokens = tokens[1]
        literal_tokens[0] == :string_literal && string_content(literal_tokens)
      end

      def string_content(tokens)
        content_tokens = tokens[1]
        content_tokens[0] == :string_content && header_string(content_tokens)
      end

      def header_string(tokens)
        header_tokens = tokens[1]
        header_tokens[0] == :@tstring_content && http_header(header_tokens)
      end

      def http_header(tokens)
        string = tokens[1]
        I18nLinter::Constants::HTTP_HEADERS.any? do |header|
          string.include?(header)
        end
      end
    end
  end
end
