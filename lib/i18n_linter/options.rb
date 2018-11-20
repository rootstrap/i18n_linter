module I18nLinter
  class Options
    attr_writer :files

    def files
      return Dir[*@files].uniq if @files

      supported_files
    end

    def supported_files
      Dir['*app/**/*.rb', '*lib/**/*.rb'].uniq
    end
  end
end
