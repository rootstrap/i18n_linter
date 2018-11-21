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
      all_rules['Include'] || []
    end

    def patterns_to_exclude
      all_rules['Exclude'] || []
    end

    private

    def [](key)
      @hash[key]
    end

    def from_file?
      File.exist?(DOTFILE)
    end

    def all_rules
      @all_rules ||= self['AllRules'] || {}
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
