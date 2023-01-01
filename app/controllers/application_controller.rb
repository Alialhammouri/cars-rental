class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.class.to_s == "Admin"
      admins_path
    elsif resource.class.to_s == "Office"
      personal_information_path
    else
      main_page_path
    end
  end
  
end
