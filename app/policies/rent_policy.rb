class RentPolicy < ApplicationPolicy
  def index?
    record.to_a.all? { |rent| rent.user_id == user.id }
  end

  def create?
    record.user_id == user.id
  end
end
