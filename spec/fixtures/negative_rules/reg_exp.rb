# frozen_string_literal: true

class RegExp < ApplicationController
  def some_action(request)
    request.user_agent =~ /Mobile|iP(hone|od|ad)|Android|BlackBerry|IEMobile/
  end
end
