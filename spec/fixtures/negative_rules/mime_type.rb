# frozen_string_literal: true

class MimeType < ApplicationController
  def some_action
    csv = SomeService.generate_csv
    send_data csv, type: 'text/csv; charset=utf-8; header=present'
  end
end
