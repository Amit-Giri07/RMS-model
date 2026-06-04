class PaymentPolicy < ApplicationPolicy
  def create?
    user.admin? ||
    user.manager? ||
    user.cashier?
  end

  def new?
    create?
  end

  def index?
    create?
  end

  def show?
    create?
  end
end
