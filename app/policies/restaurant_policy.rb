class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # current_user => user
    # @restaurant => record
    owner?
  end

  def create?
    true
  end

  def destroy?
    owner?
  end

  private

  def owner?
    user == record.user
  end
end
