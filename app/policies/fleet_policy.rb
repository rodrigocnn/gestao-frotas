class FleetPolicy < ApplicationPolicy
  def destroy?
    user.role == "admin"
  end

  class Scope < ApplicationPolicy::Scope
  end
end
