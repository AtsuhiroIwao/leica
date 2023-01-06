class Admin::ApplicationController < ApplicationController
  layout 'admin/application'

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


  def after_sign_in_path_for(resource)
    admin_users_path
  end
end