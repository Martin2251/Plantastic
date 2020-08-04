class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      return true
    end
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
