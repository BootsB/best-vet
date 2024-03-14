class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :accept, :reject] # Include additional actions as needed
  before_action :authorize_appointment, only: [:accept, :reject]

  def index
    @appointments = policy_scope(Appointment)

    if current_user.vet?
      @vet_appointments = Appointment.where(vet_id: current_user.id)
      @pet_owner_appointments = Appointment.joins(:pet_profile).where("pet_profiles.user_id = ? AND appointments.status = ?", current_user.id, "requested")
    else
      @pet_owner_appointments = current_user.appointments
      @vet_appointments = Appointment.joins(:pet_profile).where("pet_profiles.user_id = ?", current_user.id)
    end

    @appointments = (@vet_appointments + @pet_owner_appointments).uniq.sort_by(&:created_at).reverse
  end


  def show
    @appointment = Appointment.find(params[:id])
    authorize @appointment # Authorize the specific appointment
  end

  def new
    @appointment = current_user.vet? ? Appointment.new : current_user.appointments.build
    authorize @appointment
  end

  def create
    if current_user.vet?
      @appointment = current_user.vet_appointments.build(appointment_params)
    else
      @appointment = current_user.appointments.build(appointment_params)
      @appointment.pet_owner_id = current_user.id # Assign the pet_owner_id based on the current user
      @appointment.status = "requested" # Set status to "requested" for non-vet users
    end

    authorize @appointment

    if @appointment.save
      redirect_to @appointment, notice: 'Appointment was successfully created.'
    else
      puts @appointment.errors.full_messages # Output the full error messages to the console
      render :new, alert: 'Failed to create the appointment. Please try again later.'
    end
  end



  def edit
    @appointment = Appointment.find(params[:id])
    if current_user.vet? && @appointment.vet_id == current_user.id
      authorize @appointment
    elsif !current_user.vet? && @appointment.pet_owner_id == current_user.id
      authorize @appointment
    else
      flash[:alert] = "You are not authorized to edit this appointment."
      redirect_to appointments_path
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    if current_user.vet? && @appointment.vet_id == current_user.id
      authorize @appointment
    elsif !current_user.vet? && @appointment.pet_owner_id == current_user.id
      authorize @appointment
    else
      flash[:alert] = "You are not authorized to update this appointment."
      redirect_to appointments_path
      return
    end

    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  def accept
    @appointment = Appointment.find(params[:id])
    authorize @appointment

    if current_user.vet? && @appointment.status == "requested"
      @appointment.update(status: "accepted")
      render json: { message: 'Appointment accepted successfully.' }
    else
      render json: { error: 'You are not authorized to accept this appointment.' }, status: :unprocessable_entity
    end
  end

  def reject
    @appointment = Appointment.find(params[:id])
    authorize @appointment

    if current_user.vet? && @appointment.status == "requested"
      @appointment.update(status: "declined")
      render json: { message: 'Appointment rejected successfully.' }
    else
      render json: { error: 'You are not authorized to reject this appointment.' }, status: :unprocessable_entity
    end
  end

  # Other actions...

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :appointment_time, :status, :description_of_problem, :pet_profile_id, :vet_id)
  end

end
