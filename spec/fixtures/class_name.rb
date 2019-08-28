# frozen_string_literal: true

class ClassName < ApplicationRecord
  has_many :links, class_name: 'Link'
end
