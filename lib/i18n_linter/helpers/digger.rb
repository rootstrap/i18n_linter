# frozen_string_literal: true

module I18nLinter
  class Digger
    def initialize(type)
      @type = type
    end

    def find(target, tree)
      return false unless tree.is_a? Array
      return true if target_found?(target, tree)

      tree.each do |item|
        return true if find(target, item)
      end
      false
    end

    def target_found?(target, tree)
      matches_type?(tree[0]) && matches_target?(tree[1], target)
    end

    def matches_type?(item)
      item == @type
    end

    def matches_target?(item, target)
      item == target
    end
  end
end
