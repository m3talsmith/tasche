# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'e4cd34de34883f6d18312d920712c68d'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  helper_method :current_user_session, :current_user
  
  before_filter :force_login, :except => [:login, :authenticate]
  
  private
    def current_user_session
      if !session[:expiry_time].nil? and session[:expiry_time] < Time.now
          # Session has expired. Clear the current session.
          reset_session
       end

       # Assign a new expiry time, whether the session has expired or not.
       session[:expiry_time] = MAX_SESSION_TIME.seconds.from_now
       return true
    end
    
    def current_user
      @current_user = session[:user_id] != nil ? User.find(session[:user_id]) : nil
      return @current_user
    end
    
    def force_login
      redirect_to login_users_path unless current_user
    end
end
