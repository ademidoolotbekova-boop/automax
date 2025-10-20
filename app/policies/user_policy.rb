class UserPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.super_admin?
        scope.all
      else
        scope.where(id: user.id)
      end
    end
  end

  def index?
    user.super_admin?
  end

  def show?
    user.super_admin? || record.id == user.id
  end

  def create?
    user.super_admin?
  end

  def new?
    create?
  end

  def update?
    user.super_admin? || record.id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    user.super_admin? && record.id != user.id
  end

  def permitted_attributes_for_create
    if user.super_admin?
      [ :name, :email, :password, :password_confirmation, :role ]
    else
      [ :name, :email, :password, :password_confirmation ]
    end
  end

  def permitted_attributes_for_update
    if user.super_admin?
      [ :name, :email, :password, :password_confirmation, :role ]
    else
      [ :name, :email, :password, :password_confirmation ]
    end
  end

  def permitted_attributes
    permitted_attributes_for_update
  end
end
