class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :mapbox

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :avatar, :gender, :birthday])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :avatar, :gender, :birthday])
  end

  private

  def mapbox
    @suggestions = Suggestion.all
    @markers = @suggestions.geocoded.map do |suggestion|
      {
        lat: suggestion.latitude,
        lng: suggestion.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: { suggestion: suggestion })
      }
    end
  end
end
