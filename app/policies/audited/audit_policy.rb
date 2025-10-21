# frozen_string_literal: true

# Policy for Audited::Audit records
module Audited
  class AuditPolicy < ApplicationPolicy
    class Scope < ApplicationPolicy::Scope
      def resolve
        if user.owner?
          scope.all
        else
          scope.none
        end
      end
    end

    def index?
      user.owner?
    end
  end
end
