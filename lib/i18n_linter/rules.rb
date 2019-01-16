module I18nLinter
  module Rules
    POSITIVE_RULES = %w[Uppercase MiddleSpace].freeze
    # Rules that filters the strings found
    NEGATIVE_RULES = %w[ForwardSlash MiddleDash EnvironmentVariable
                        ClassName Constant Logger Puts Query Strftime
                        HttpHeaders].freeze

    class << self
      def check_rule(rule, plain_line, string_content)
        Kernel.const_get("I18nLinter::Rules::#{rule}").new.check(plain_line, string_content)
      end
    end
  end
end
