# frozen_string_literal: true

class Scope < ApplicationRecord
  scope :removed, -> { where('removed_at IS NOT NULL') }
  scope :author_posts, lambda {
    left_outer_joins(:posts).distinct
                            .select('authors.*, COUNT(posts.*) AS posts_count')
                            .group('authors.id')
  }
end
