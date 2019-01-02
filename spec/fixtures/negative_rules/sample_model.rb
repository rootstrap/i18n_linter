class Video < ApplicationRecord
  # Testing ClassName rule
  has_many :followers, class_name: 'User'

  # Testing Constant rule
  VIDEO_STATUS_READY = 'ready'.freeze
  ERROR_CODES = '[NOT_FOUND]'.freeze

  def logging
    logger = Rails.logger

    # Testing Logger rule
    logger.info('This is a log entry')
    logger.debug 'This is a log entry'
  end
end
