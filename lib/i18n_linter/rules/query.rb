module I18nLinter
  module Rules
    class Query
      def check(_plain_line, string)
        commons = common_query_patterns.any? do |pattern|
          pattern =~ string
        end
        return true if commons

        custom_query_patterns.any? do |pattern|
          check_custom_pattern(pattern, string)
        end
      end

      private

      def common_query_patterns
        [
          /\w+\.\w+/,
          /\w+\.\*/,
          /ILIKE (\?|:\w)/,
          /ILIKE .*\%/,
          /LIKE (\?|:\w)/,
          /LIKE .*\%/,
          /\w+ asc/i,
          /\w+ desc/i
        ]
      end

      def custom_query_patterns
        [
          { matcher: /(\w+\_\w+)/, positive_rules: [->(match) { /^((?!\#\{#{match}\}).)*$/ }] }
        ]
      end

      def get_matches(matcher, string)
        matches = matcher.match(string)
        return [] if matches.nil?

        matches.captures
      end

      def check_custom_pattern(pattern, string)
        get_matches(pattern[:matcher], string).any? do |match|
          check_custom_rules(pattern[:positive_rules], match, string)
        end
      end

      def check_custom_rules(rules, match, string)
        rules.all? { |rule| rule.call(match) =~ string }
      end
    end
  end
end
