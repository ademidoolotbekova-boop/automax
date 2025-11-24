class ProgressController < ApplicationController
  before_action :authenticate_user!

  def index
    country = session[:selected_country] || 'kg'

    render inertia: "Progress/Index", props: {
      breadcrumbs: [
        { label: 'Dashboard', href: '/dashboard' },
        { label: 'My Progress' }
      ],
      country: country
    }
  end
end
