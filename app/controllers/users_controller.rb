class UsersController < ApplicationController
  def authenticate
    open_id_user = try_login(params[:user][:openid_identifier])
    if open_id_user
      user = User.find(:first, :conditions => {:identity_url => params[:user][:openid_identity]})
      if user
        session[:user_id] = user.id
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
  
  private
    def try_login(current_identity_url)
      logger.debug("\t\tCurrent Identity URL: #{current_identity_url}")
      authenticate_with_open_id(current_identity_url) do |result, identity_url|
        logger.debug("\t\tMessage from openid provider: #{result.message}\n\t\tIdentity URL: #{identity_url}")
        if result.successful?
          user = User.find_by_identity_url(identity_url)
          return user
        else
          return nil
          # failed_login(result.message || "Sorry, no user by that identity URL exists (#{identity_url})")
        end
      end
    end
end
