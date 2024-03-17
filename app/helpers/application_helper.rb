module ApplicationHelper
  def full_name(appointment)
    "#{appointment.last_name} #{appointment.first_name}"
  end
end
