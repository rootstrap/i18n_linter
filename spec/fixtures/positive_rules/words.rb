# frozen_string_literal: true

class Words < ApplicationRecord
  def first_action
    do_something
    # Detected -> Starts with uppercase and have at least one lowercase
    render json: { message: 'Success' }
  end

  def second_action
    # Not detected -> Doesn't have any lowercase
    params[:param_1] == 'DEFAULT'
  end
end
