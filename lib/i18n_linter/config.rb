require 'yaml'

module I18nLinter
  class Config
    DOTFILE = '.i18n_linter.yml'.freeze
    I18N_LINTER_HOME = File.realpath(File.join(File.dirname(__FILE__), '..', '..'))
    DEFAULT_FILE = File.join(I18N_LINTER_HOME, 'config', 'default.yml')

    def initialize
      path = from_file? ? DOTFILE : DEFAULT_FILE
      @hash = load_yaml_configuration(path)
    end

    def patterns_to_include
      linter_patterns['Include'] || []
    end

    def patterns_to_exclude
      linter_patterns['Exclude'] || []
    end

    def enabled_positive_rules
      all_rules.keys.select { |rule| positive_rule(rule) && enabled_rule?(rule) }
    end

    def enabled_negative_rules
      all_rules.keys.select { |rule| negative_rule(rule) && enabled_rule?(rule) }
    end

    private

    def [](key)
      @hash[key]
    end

    def from_file?
      File.exist?(DOTFILE)
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

    def positive_rule(rule)
      Rules::POSITIVE_RULES.include?(rule)
    end

    def negative_rule(rule)
      Rules::NEGATIVE_RULES.include?(rule)
    end

    def load_yaml_configuration(path)
      yaml_code = File.read(path)
      hash = yaml_safe_load(yaml_code, path) || {}

      raise(TypeError, "Malformed configuration in #{path}") unless hash.is_a?(Hash)

      hash
    end

    def yaml_safe_load(yaml_code, filename)
      YAML.safe_load(yaml_code, [Regexp, Symbol], [], false, filename)
    end
  end
end
