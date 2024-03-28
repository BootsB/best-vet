class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # By default, allow all users to view all appointments.
      if user.vet?
        scope.where(user: user)
      else
        scope.all
      end
    end
  end

  def initialize(user, appointment)
    @user = user
    @appointment = appointment
  end

  def index?
    true
  end

  def show?
    user.present? # All users can view appointments
  end

  def new?
    create?
  end

  def create?
    !user.vet # Only pet owners can create appointments
  end

  def update?
    true
  end

  def destroy?
    # Only vet can destroy appointments
    user.vet
  end

  def accept?
    user.vet
  end

  def reject?
    user.vet
  end

  def available_vets?
    true
  end

  def videocall?
    user.present? && ( user == @appointment.user || user == @appointment.pet_profile.user )
  end

  def create_review?
    true
    # @record.present? && @record.user_id == @user.id
  end

end
