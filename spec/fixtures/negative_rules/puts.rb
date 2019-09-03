# frozen_string_literal: true

class Puts < ApplicationController
  def create
    do_something
    puts 'Successfully created'
  end

  def delete
    do_something
    puts('Successfully deleted')
  end
end
