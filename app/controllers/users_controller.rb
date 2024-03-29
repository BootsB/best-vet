class UsersController < ApplicationController
  def dashboard
    @user = current_user
    authorize @user
    if @user.vet?
      @appointment = @user.appointments
      .where(status: 'accepted')
      .where("appointment_date >= ?", Date.today)
      .order(appointment_date: :asc, appointment_time: :asc)
      .find { |appointment| appointment_datetime_within_5_minutes?(appointment) }
    else
      @appointment = Appointment.joins(pet_profile: :user)
        .where(pet_profiles: { user_id: @user.id })
        .where(status: 'accepted')
        .where("appointment_date >= ?", Date.today)
        .order(appointment_date: :asc, appointment_time: :asc)
        .find { |appointment| appointment_datetime_within_5_minutes?(appointment) }
    end

    if @user.vet?
      @next_appointment = @user.appointments.where("appointment_date = ?", Date.today)
      .where(status: 'accepted')
      .order(appointment_date: :asc, appointment_time: :asc)
      .find { |appointment| appointment_datetime(appointment) >= Time.now }
    # @profile = current_user.profile
    else
      @next_appointment = Appointment.joins(pet_profile: :user)
        .where(pet_profiles: { user_id: @user.id })
        .where(status: 'accepted')
        .order(appointment_date: :asc, appointment_time: :asc)
        .find { |appointment| appointment_datetime(appointment) >= Time.now }
    end
  end

  private

  def appointment_datetime_within_5_minutes?(appointment)
    appointment_datetime = appointment_datetime(appointment)
    appointment_datetime >= Time.now - 5.minutes && appointment_datetime <= Time.now + 5.minutes
  end

  def appointment_datetime(appointment)
    appointment_date = appointment.appointment_date.to_date
    appointment_time = appointment.appointment_time
    DateTime.new(appointment_date.year, appointment_date.month, appointment_date.day, appointment_time.hour, appointment_time.min, appointment_time.sec)
  end

end
