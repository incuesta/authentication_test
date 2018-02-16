class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception




  ## Just testing stuff kekekeke
  # before_action :configure_permitted_parameters, if: :devise_controller?		# Do this only for Devise Controllers

  # protected

  #   def configure_permitted_parameters
  #         devise_parameter_sanitizer.for(:sign_up).push(:user_name)				# Append to the current allowed parameters
  #         devise_parameter_sanitizer.for(:sign_in).push(:user_name)				
  #         devise_parameter_sanitizer.for(:account_update).push(:user_name)
  #   end
end
