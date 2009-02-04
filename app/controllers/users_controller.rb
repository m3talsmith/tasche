class UsersController < ApplicationController
  def authenticate
    # open_id_user = try_login (params[:user][:openid_identity])
    if open_id_user.sucess 
      user = User.find(:first, :conditions => {:identity_url => params[:user][:openid_identity]})
      if user
        redirect_to user_url(user.id)
      else 
        user = User.create(:identity_url => params[:user][:openid_identity])
        redirect_to user_profile_url(user.id)
      end
    else
      redirect_to users_open_id_signup_url
    end
  end
  
  def index
  end
  
  def signup
  end  
end

