# frozen_string_literal: true

module I18nLinter
  module Rules
    POSITIVE_RULES = %w[MiddleSpace Words].freeze
    # Rules that filter the strings found
    NEGATIVE_RULES = %w[
      ClassName Constant EnvironmentVariable HttpHeaders
      Logger MimeType Puts Query RegExp Scope Strftime Underscore
    ].freeze

    class << self
      def check_rule(rule, string_or_tokens)
        Kernel.const_get("I18nLinter::Rules::#{rule}").new.check(string_or_tokens)
      end

      def check_positive_rules(config, string)
        config.enabled_positive_rules.any? { |rule| Rules.check_rule(rule, string) }
      end

      def check_negative_rules(config, tokens)
        config.enabled_negative_rules.any? { |rule| Rules.check_rule(rule, tokens) }
      end

      def check_string_rules(config, string)
        check_positive_rules(config, string)
      end
    end
  end
end
