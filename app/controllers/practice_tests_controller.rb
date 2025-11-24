class PracticeTestsController < ApplicationController
  before_action :authenticate_user!

  def index
    country = session[:selected_country] || 'kg'

    render inertia: "PracticeTests/Index", props: {
      breadcrumbs: [
        { label: 'Dashboard', href: '/dashboard' },
        { label: 'Practice Tests' }
      ],
      country: country
    }
  end
end
