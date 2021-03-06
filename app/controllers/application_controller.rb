class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

  def show
  end


  # def authenticate_approved_user!
  #   authenticate_user!
  #   unless current_user.approved?
  #     flash[:notice] = 'Waiting for approval'
  #     redirect_to '/posts'
  #   end
  # end
  
end
