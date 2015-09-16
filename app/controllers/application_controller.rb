class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?




  def is_logged
    if !logged_in?
        redirect_to :controller => 'users', :action => 'signin'
    end
  end




  private

      def current_user
        @current ||= session[:user_id] && User.find(session[:user_id])
      end

      def logged_in?
          current_user != nil
      end


end
