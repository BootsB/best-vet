module ApplicationHelper
  def full_name(appointment)
    if appointment.present? && appointment.respond_to?(:last_name) && appointment.respond_to?(:first_name)
      "#{appointment.last_name} #{appointment.first_name}"
    else
      "No Appointment"
    end
  end
end
