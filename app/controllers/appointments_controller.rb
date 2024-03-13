class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :accept, :reject] # Include additional actions as needed

  def index
    @appointments = policy_scope(Appointment)

    if current_user.vet?
      @appointments = current_user.appointments
    else
      @appointments = current_user.pet_profiles.map(&:appointments).flatten
    end
    raise
  end


  def show
    authorize @appointment # Authorize the specific appointment
  end

  def new
    @appointment = current_user.appointments.build
    authorize @appointment, :create_for_user? # Authorize the new action for the current user
  end

  def create
    @appointment = current_user.appointments.build(appointment_params)
    authorize @appointment, :create_for_user? # Authorize the create action for the current user

    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  # Other actions...

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :time, :status, :description_of_problem, :pet_profile_id)
  end
end
