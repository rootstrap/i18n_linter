module I18nLinter
  module Rules
    POSITIVE_RULES = %w[].freeze
    # Rules that filters the strings found
    NEGATIVE_STRING_RULES = %w[].freeze
    NEGATIVE_CONTEXT_RULES = %w[ClassName].freeze
    NEGATIVE_RULES = NEGATIVE_STRING_RULES + NEGATIVE_CONTEXT_RULES

    class << self
      def check_rule(rule, string_or_tokens)
        Kernel.const_get("I18nLinter::Rules::#{rule}").new.check(string_or_tokens)
      end

      def check_positive_rules(config, string)
        config.enabled_positive_rules.any? { |rule| Rules.check_rule(rule, string) }
      end

      def check_negative_string_rules(config, string)
        config.enabled_negative_string_rules.none? { |rule| Rules.check_rule(rule, string) }
      end

      def check_negative_context_rules(config, tokens)
        config.enabled_negative_context_rules.any? { |rule| Rules.check_rule(rule, tokens) }
      end

      def check_string_rules(config, string)
        check_positive_rules(config, string) && check_negative_string_rules(config, string)
      end
    end
  end
end
