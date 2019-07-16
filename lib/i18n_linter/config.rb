# frozen_string_literal: true

require 'yaml'

module I18nLinter
  class Config
    DOTFILE = '.i18n_linter.yml'
    I18N_LINTER_HOME = File.realpath(File.join(File.dirname(__FILE__), '..', '..'))
    DEFAULT_FILE = File.join(I18N_LINTER_HOME, 'config', 'default.yml')

    def initialize
      path = File.exist?(DOTFILE) ? DOTFILE : DEFAULT_FILE
      @hash = load_yaml_configuration(path)
      add_missing_rules(@hash['Rules'])
    end

    def patterns_to_include
      linter_patterns['Include'] || []
    end

    def patterns_to_exclude
      linter_patterns['Exclude'] || []
    end

    def enabled_positive_rules
      all_rules.keys.select { |rule| positive_rule?(rule) && enabled_rule?(rule) }
    end

    def enabled_negative_string_rules
      all_rules.keys.select { |rule| negative_string_rule?(rule) && enabled_rule?(rule) }
    end

    def enabled_negative_context_rules
      all_rules.keys.select { |rule| negative_context_rule?(rule) && enabled_rule?(rule) }
    end

    private

    def [](key)
      @hash[key]
    end

    def linter_patterns
      @linter_patterns ||= self['Linter'] || {}
    end

    def all_rules
      @all_rules ||= self['Rules'] || {}
    end

    def enabled_rule?(rule)
      all_rules[rule]['Enabled']
    end

    def positive_rule?(rule)
      Rules::POSITIVE_RULES.include?(rule)
    end

    def negative_context_rule?(rule)
      Rules::NEGATIVE_CONTEXT_RULES.include?(rule)
    end

    def negative_string_rule?(rule)
      Rules::NEGATIVE_STRING_RULES.include?(rule)
    end

    def load_yaml_configuration(path)
      yaml_code = File.read(path)
      hash = YAML.safe_load(yaml_code, [Regexp, Symbol], [], false, path) || {}

      raise(TypeError, "Malformed configuration in #{path}") unless hash.is_a?(Hash)

      hash
    end

    def add_missing_rules(loaded_rules)
      missing = (Rules::POSITIVE_RULES + Rules::NEGATIVE_RULES) - loaded_rules.keys
      missing.each do |rule|
        loaded_rules.store(rule, 'Enabled' => true)
      end
    end
  end
end
