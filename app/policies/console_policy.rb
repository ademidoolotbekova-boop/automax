# frozen_string_literal: true

class ConsolePolicy < ApplicationPolicy
  def index?
    user.owner?
  end
end
