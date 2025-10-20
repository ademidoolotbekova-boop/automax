# frozen_string_literal: true

# Policy for Audited::Audit records
# Note: Pundit will look for this policy when using policy_scope(Audited::Audit)
# We name it AuditLogPolicy instead of Audited::AuditPolicy for simplicity
class AuditLogPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.super_admin?
        scope.all
      else
        scope.none
      end
    end
  end

  def index?
    user.super_admin?
  end
end

# Alias for Audited::Audit model to use AuditLogPolicy
module Audited
  class Audit
    def self.policy_class
      AuditLogPolicy
    end
  end
end
