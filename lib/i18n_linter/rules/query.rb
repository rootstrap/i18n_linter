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
          /\w+\.\*/,
          /ILIKE (\?|:\w)/i,
          /ILIKE .*\%/i,
          /LIKE (\?|:\w)/i,
          /LIKE .*\%/i,
          /\w+ asc/i,
          /\w+ desc/i
        ]
      end

      def custom_query_patterns
        not_an_interpolated_variable = ->(match) { /^((?!\#\{\@?#{match}\}).)*$/ }
        [
          { matcher: /(\w+\_\w+)/, negative_rules: [not_an_interpolated_variable] },
          { matcher: /(\w+\.\w+)/, negative_rules: [not_an_interpolated_variable] }
        ]
      end

      def get_matches(matcher, string)
        matches = matcher.match(string)
        return [] if matches.nil?

        matches.captures
      end

      def check_custom_pattern(pattern, string)
        get_matches(pattern[:matcher], string).any? do |match|
          check_custom_rules(pattern[:negative_rules], match, string)
        end
      end

      def check_custom_rules(rules, match, string)
        rules.all? { |rule| rule.call(match) =~ string }
      end
    end
  end
end
