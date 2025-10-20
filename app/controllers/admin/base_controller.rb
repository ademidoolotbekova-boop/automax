# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!

    # Handle unauthorized access in admin area
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
end
