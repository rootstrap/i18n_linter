# frozen_string_literal: true

class Strftime < ApplicationRecord
  def today
    date = Time.now.strftime("It's %I:%M%p on %A %B %d, %Y")
    puts date
  end

  def date(year, month, day)
    date = Time.new(year, month, day).strftime("It's %B %d, %Y at %-I:%M%p")
    puts date
  end

  def appointment
    { appointment_datetime: DateTime.new(2016, 0o3, 15, 18, 0o0, 0) }
  end

  def appointment_date
    date = appointment.appointment_datetime.strftime("It's %B %d, %Y at %-I:%M%p")
    puts date
  end
end
