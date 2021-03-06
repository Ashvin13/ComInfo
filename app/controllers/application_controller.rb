class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:email,:password,:password_confirmation,:uname,:email,:phone_no,:date_of_birth,:user_type]

    if params[:action] == 'update'
      devise_parameter_sanitizer.permit(:account_update) do 
        |u| u.permit(registration_params << :current_password)
      end
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.permit(:sign_up) do 
        |u| u.permit(registration_params) 
      end
    end
  end
end
