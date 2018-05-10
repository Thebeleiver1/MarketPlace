class ApplicationController < ActionController::Base
#to add custom field data from devise to to database.
before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
  # saving from fake users
  #protect_from_forgery with: :exception

  helper_method :admin?
  
  def admin?
    current_user.email == "punyachapagain@gmail.com"
  end

  def add_cart
    

  end


end
