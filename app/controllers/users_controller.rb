class UsersController < ApplicationController
  def authenticate
    try_login(params[:user] ? params[:user][:openid_identifier] : params["openid.identity"])
  end
  
  def logout
    reset_session
    redirect_to root_path
  end
  
  private
    def try_login(current_identity_url)
      logger.debug("\t\tCurrent Identity URL: #{current_identity_url}")
      authenticate_with_open_id(current_identity_url) do |result, identity_url|
        logger.debug("\t\tMessage from openid provider: #{result.message}\n\t\tIdentity URL: #{identity_url}")
        if result.successful?
          user = User.find_by_identity_url(identity_url)
          if user
            logger.debug("\t\tUser found for openid #{identity_url} . Logged in")
            session[:user_id] = user.id
            redirect_to user_url(user.id)
          else
            logger.debug("\t\tUser NOT found for openid #{identity_url} . Creating user.")
            user = User.create(:identity_url => identity_url)
            session[:user_id] = user.id
            redirect_to profile_user_url(user.id)
          end
        else
          logger.debug("\t\tOpenid #{identity_url} NOT found. Redirect to Signup")
          redirect_to signup_users_path
        end
      end
    end
end
