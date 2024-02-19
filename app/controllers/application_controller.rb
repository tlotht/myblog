class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :user_signed_in?
  #before_action :authenticate_user

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id]) 
  end

  def user_signed_in?
    !current_user.nil?
  end

  # def authenticate_user
  #   redirect_to new_session_path, flash: {danger: 'You must be signed in'} if current_user.nil?
  # end

  # def authenticate
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == "money" && password == "money"
  #   end
  # end



  # def redirect_if_authenticated
  #  redirect_to root_path, flash: { info: 'You are already logged in.'} if user_signed_in?
  # end

  def per_page
    if params[:per_page].present?
      a = params[:per_page].to_i
    else
      a = 20
    end
    return a 
  end

  def page
    if params[:page].present?
      a = params[:page].to_i
    else
      a = 1
    end
    return [1,a].max 
  end
end
