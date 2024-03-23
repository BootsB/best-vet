class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :accept, :reject]
  before_action :set_vet_users, only: [:new, :create]

  def index
    @appointments = policy_scope(Appointment)

    if current_user.vet
      @appointments = @appointments.where(user_id: current_user.id)
    else
      @appointments = @appointments.where(pet_profile_id: current_user.pet_profiles.ids)
    end
  end

  def show
    authorize @appointment
  end

  def new
    @appointment = current_user.vet? ? Appointment.new : current_user.appointments.build
    authorize @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    authorize @appointment

    if Appointment.exists?(user_id: @appointment.user_id, appointment_date: @appointment.appointment_date, appointment_time: @appointment.appointment_time)
      redirect_to new_appointment_path, alert: 'The selected vet already has an appointment at the specified time.'
      return
    end

    if @appointment.save
      redirect_to @appointment, notice: 'Appointment request sent successfully.'
    else
      render :new, flash: { alert: 'Failed to send appointment request. Please try again later.' }
    end
  end


  def edit
    authorize @appointment
  end

  def update
    authorize @appointment
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  def accept
    authorize @appointment
    if @appointment.pending?
      @appointment.accepted!
      redirect_to appointments_path, notice: 'Appointment accepted successfully.'
    else
      redirect_to appointments_path, status: :unprocessable_entity, alert: 'You cannot accept this appointment or it has already been accepted.'
    end
  end

  def reject
    authorize @appointment
    if @appointment.pending?
      @appointment.declined!
      redirect_to appointments_path, notice: 'Appointment rejected successfully.'
    else
      redirect_to appointments_path, status: :unprocessable_entity, alert: 'You cannot reject this appointment or it has already been rejected/accepted.'
    end
  end

  def destroy
    authorize @appointment
    if @appointment.destroy
      redirect_to appointments_path, status: :see_other ,notice:  'Appointment was successfully deleted.'
    else
      redirect_to appointments_path, alert: 'Failed to delete appointment.'
    end
  end

  def available_vets
    authorize Appointment
    date = params[:date]
    time = params[:time]
    @available_vets = Appointment.available_vets(date, time).map do |vet|
      {
        id: vet.id,
        email: vet.email,
        profile_picture: vet.user_profile.photo.key
      }
    end

    render json: { vets: @available_vets }
  end






  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_vet_users
    @vet_users = User.where(vet: true)
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :appointment_time, :description_of_problem, :pet_profile_id, :user_id, :zoom_link)
  end
end
