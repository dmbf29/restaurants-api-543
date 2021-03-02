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
    user == record.user
  end

  def create?
    true
  end
end
