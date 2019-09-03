# frozen_string_literal: true

class Query < ApplicationRecord
  def monthly(year, month, donations)
    donations.where('extract(month from(donations.created_at)) = ?', month)
             .where('extract(year from(donations.created_at)) = ?', year)
             .group('year', 'month')
             .order('year ASC', 'month ASC')
  end
end
