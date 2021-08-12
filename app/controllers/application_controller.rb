class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
          redirect_to root_path, alert: "You dont't have permission."
    end

    include Pagy::Backend
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
         devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname,:user_image,:password_confirmation, :lastname, :email, :password)}

         devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname,:user_image, :lastname, :email, :password,:password_confirmation, :current_password)}
    end
end
