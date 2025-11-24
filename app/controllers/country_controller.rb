class CountryController < ApplicationController
  before_action :authenticate_user!

  def select
    country = params[:country]

    # Validate country code
    valid_countries = %w[kg ru us]
    country = 'kg' unless valid_countries.include?(country)

    # Store in session
    session[:selected_country] = country

    head :ok
  end
end
