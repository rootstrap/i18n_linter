class Video < ApplicationRecord
  # Testing ClassName rule
  has_many :followers, class_name: 'User'

  # Testing Constant rule
  VIDEO_STATUS_READY = 'ready'.freeze
  ERROR_CODES = '[NOT_FOUND]'.freeze
end
