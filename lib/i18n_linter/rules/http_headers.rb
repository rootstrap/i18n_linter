module I18nLinter
  module Rules
    class HttpHeaders
      def check(plain_line, _string)
        headers_words.any? do |header|
          plain_line.include?(header)
        end
      end

      private

      def headers_words
        [
          'Accept',
          'Accept-Charset',
          'Accept-Encoding',
          'Accept-Language',
          'Authorization',
          'Cache-Control',
          'Connection',
          'Content-Length',
          'Content-Type',
          'Cookie',
          'Host'
        ]
      end
    end
  end
end
