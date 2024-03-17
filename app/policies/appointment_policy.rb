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
    user.vet == false # Only pet owners can create appointments
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

end
