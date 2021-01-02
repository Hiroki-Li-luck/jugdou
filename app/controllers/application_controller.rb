class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller? 

  def after_sign_in_path_for(resource)
    page_path(current_user)
  end

  private

    def configure_permitted_parameters
      added_attrs = [ :username, :email, :profile, :profile_image_id, :password, :password_confirmation,]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    end
    
    def autheniticate_user
      if current_user == nil 
        flash[:notice] = "ログインしてください"
        redirect_to new_user_session_path
      end
    end
end
