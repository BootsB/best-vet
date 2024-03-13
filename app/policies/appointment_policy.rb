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

  def dashboard?
    true
  end

  def show?
    user.vet? && record.vet_id == user.id # Vets can only view their own appointments
  end

  def create?
    user.vet? # Only vets can create appointments
  end

  def update?
    user.vet? && record.vet_id == user.id # Vets can only update their own appointments
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
    user.id == record.user_id # Users can only create appointments for themselves
  end
end
