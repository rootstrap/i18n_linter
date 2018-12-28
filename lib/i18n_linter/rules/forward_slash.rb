module I18nLinter
  module Rules
    class ForwardSlash
      def check(_plain_line, string)
        forward_slash?(string)
      end

      private

      def forward_slash?(string)
        %r{\/} =~ string
      end
    end
  end
end
