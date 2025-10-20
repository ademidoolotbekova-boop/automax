# frozen_string_literal: true

class DashboardPolicy < ApplicationPolicy
  def index?
    user.super_admin?
  end
end
