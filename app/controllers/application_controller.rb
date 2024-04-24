class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, :authenticate_coach!, :authenticate_admin!
  # protect_from_forgery with: :exception

  # private
  # def current_admin
  #   current_admin if admin_signed_in?
  # end

  # def current_user
  #   current_user if user_signed_in?
  # end

  # def current_coach
  #   current_coach if coach_signed_in?
  # end


  # def after_sign_in_path_for(resource)
  #   # check for the class of the object to determine what type it is
  #   case resource.class
  #   when Admin
  #     root_path
  #   when Coach
  #     coaches_root_path  
  #   when Employee
  #     employees_root_path
  #   end
  # end
  # protected

  # def after_sign_in_path_for(resource)
  #   if resource.is_a?(Coach)
  #     coaches_root_path
  #   elsif resource.is_a?(Admin)
  #     admin_root_path
  #   elsif resource.is_a?(Employee)
  #     employees_root_path
  #   else
  #     super
  #   end
  # end
end
