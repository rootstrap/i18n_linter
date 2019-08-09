# frozen_string_literal: true

module I18nLinter
  module Rules
    class HttpHeaders
      def check(tokens)
        tokens[0] == :assoc_new && literal_or_symbol(tokens)
      end

      private

      def literal_or_symbol(tokens)
        literal_symbol_tokens = tokens[1]
        (literal(literal_symbol_tokens) || symbol(literal_symbol_tokens)) &&
          string_content(literal_symbol_tokens)
      end

      def literal(tokens)
        tokens[0] == :string_literal
      end

      def symbol(tokens)
        tokens[0] == :dyna_symbol
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
        string = tokens[1].downcase
        I18nLinter::Constants::HTTP_HEADERS.map(&:downcase).any? do |header|
          string.include?(header)
        end
      end
    end
  end
end
