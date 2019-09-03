# frozen_string_literal: true

class HttpHeaders < ApplicationController
  def some_action
    do_something
    post(
      '/oauth/access_token',
      headers: { 'Content-Type' => 'application/x-www-form-urlencoded',
                 'Authorization' => "Basic #{Base64.strict_encode64('User:Password')}" }
    )
  end
end
