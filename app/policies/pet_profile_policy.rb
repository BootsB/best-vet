class PetProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end


  def index?
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    record.user == user
  end

  def new?
    create?
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end
end
