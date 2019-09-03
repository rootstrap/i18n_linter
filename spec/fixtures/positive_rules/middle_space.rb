# frozen_string_literal: true

class MiddleSpace < ApplicationRecord
  def some_action
    do_something
    render json: { message: 'successfully updated' }
  end
end
