# frozen_string_literal: true

class Uppercase < ApplicationRecord
  def some_action
    do_something
    render json: { message: 'Success' }
  end
end
