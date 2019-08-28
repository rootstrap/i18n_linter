# frozen_string_literal: true

module I18nLinter
  class Options
    attr_writer :files
    attr_accessor :out_file

    def initialize(config)
      @config = config
    end

    def files
      return Dir[*@files].uniq if @files

      supported_files
    end

    private

    def supported_files
      (Dir.glob(@config.patterns_to_include, 0) - Dir.glob(@config.patterns_to_exclude, 0)).uniq
    end
  end
end
