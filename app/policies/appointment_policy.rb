class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # By default, allow all users to view all appointments.
      scope.where(user: user)
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
    true
  end

  def create?
    user.vet? || user.non_vet? # Vets can create appointments, non-vets can request appointments
  end

  def update?
    true
  end

  def destroy?
    user.vet? && record.vet_id == user.id # Vets can only destroy their own appointments
  end

  def accept?
    user.vet? && record.vet_id == user.id && record.pending? # Vets can only accept pending appointments
  end

  def reject?
    user.vet? && record.vet_id == user.id && record.pending? # Vets can only reject pending appointments
  end

  def create_for_user?
    user.vet? # Only vets can create appointments for users
  end
end
