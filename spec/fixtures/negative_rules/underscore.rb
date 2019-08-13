# frozen_string_literal: true

class Underscore < ApplicationController
  def some_action
    params[:param_1] == 'DEFAULT_VALUE'
  end
end
