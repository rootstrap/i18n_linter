require 'yaml'

module I18nLinter
  class Config
    DOTFILE = '.i18n_linter.yml'.freeze
    I18N_LINTER_HOME = File.realpath(File.join(File.dirname(__FILE__), '..', '..'))
    DEFAULT_FILE = File.join(I18N_LINTER_HOME, 'config', 'default.yml')

    def initialize
      path = if from_file?
               DOTFILE
             else
               DEFAULT_FILE
             end
      @hash = load_yaml_configuration(path)
    end

    def [](key)
      @hash[key]
    end

    def from_file?
      File.exist?(DOTFILE)
    end

    def all_rules
      @all_rules ||= self['AllRules'] || {}
    end

    def patterns_to_include
      all_rules['Include'] || []
    end

    def patterns_to_exclude
      all_rules['Exclude'] || []
    end

    def load_yaml_configuration(path)
      yaml_code = File.read(path)
      hash = yaml_safe_load(yaml_code, path) || {}

      raise(TypeError, "Malformed configuration in #{path}") unless hash.is_a?(Hash)

      hash
    end

    def yaml_safe_load(yaml_code, filename)
      if defined?(SafeYAML) && SafeYAML.respond_to?(:load)
        SafeYAML.load(yaml_code, filename,
                      whitelisted_tags: %w[!ruby/regexp])
      # Ruby 2.6+
      elsif Gem::Version.new(Psych::VERSION) >= Gem::Version.new('3.1.0.pre1')
        YAML.safe_load(
          yaml_code,
          permitted_classes: [Regexp, Symbol],
          permitted_symbols: [],
          aliases: false,
          filename: filename
        )
      else
        YAML.safe_load(yaml_code, [Regexp, Symbol], [], false, filename)
      end
    end
  end
end
