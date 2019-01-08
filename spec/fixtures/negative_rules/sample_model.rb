class Video < ApplicationRecord
  # Testing ClassName rule
  has_many :followers, class_name: 'User'

  # Testing Constant rule
  VIDEO_STATUS_READY = 'ready'.freeze
  ERROR_CODES = '[NOT_FOUND]'.freeze

  # Testing Query rule
  scope :query_a, -> { select('followers.id').joins(:followers) }
  scope :query_b, -> { select('user_id') }
  scope :query_c, -> { select('followers.*').joins(:followers) }
  scope :query_d, ->(title) { where('title ILIKE ?', "%#{title}%") }
  scope :query_e, ->(gender) { where('gender ILIKE :gender', gender: "%#{gender}%") }
  scope :query_f, ->(title) { where('title LIKE ?', "%#{title}%") }
  scope :query_g, ->(gender) { where('gender LIKE :gender', gender: "%#{gender}%") }
  scope :query_h, -> { order('date asc') }
  scope :query_i, -> { order('date desc') }

  def logging
    logger = Rails.logger

    # Testing Logger rule
    logger.info('This is a log entry')
    logger.debug 'This is a log entry'
  end
end
