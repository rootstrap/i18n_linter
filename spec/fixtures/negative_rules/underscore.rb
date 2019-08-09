# frozen_string_literal: true

class Underscore < ApplicationRecord
  def some_action
    params[:param_1] == 'DEFAULT_VALUE'
  end
end
