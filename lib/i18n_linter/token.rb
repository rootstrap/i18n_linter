module I18nLinter
  class Token
    attr_reader :coords
    attr_reader :type
    attr_reader :content

    def initialize(token)
      @coords = token[0]
      @type = token[1]
      @content = token[2]
    end
  end
end
