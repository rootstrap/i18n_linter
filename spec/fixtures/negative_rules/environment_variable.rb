# frozen_string_literal: true

class EnvironmentVariable < ApplicationController
  def some_action
    do_something
    post('some_url',
         body: {
           key: ENV['KEY_ID'],
           value: ENV.fetch('KEY_VALUE')
         })
  end
end
