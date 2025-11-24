class LanguageController < ApplicationController
  before_action :authenticate_user!

  def select
    language = params[:language]

    # Validate language code
    valid_languages = %w[en ru]
    language = 'en' unless valid_languages.include?(language)

    # Store in session
    session[:selected_language] = language

    head :ok
  end
end
