# frozen_string_literal: true

module I18nLinter
  class Digger
    def initialize(type)
      @type = type
    end

    def find(targets, tree)
      return false unless tree.is_a? Array
      return true if target_found?(targets, tree)

      tree.each do |item|
        return true if find(targets, item)
      end
      false
    end

    def target_found?(targets, tree)
      matches_type?(tree[0]) && matches_target?(tree[1], targets)
    end

    def matches_type?(item)
      item == @type
    end

    def matches_target?(item, targets)
      targets.include?(item)
    end
  end
end
