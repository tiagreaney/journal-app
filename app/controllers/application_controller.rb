class ApplicationController < ActionController::Base
    before_action :set_current_user
    
    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    before_action :require_login

    private

    def require_login
        unless logged_in?
        flash[:alert] = 'You must be logged in to access this page.'
        redirect_to login_path
        end
    end

    def logged_in?
        session[:user_id].present?
    end

    helper_method :logged_in?

    helper_method :current_user 
    private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
