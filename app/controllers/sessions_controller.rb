class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token if Rails.env.development?

  def new
    session[:return_to] ||= request.referer
    redirect_to "/auth/facebook"
  end

  def create
    user = User.from_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to session.delete(:return_to) || root_url, flash: { success: "You signed in successfully." }
  end

  def failure
    redirect_to root_url, flash: { error: "You didn't sign in." }
  end

  def destroy
    session[:user_id] = nil
    session.delete(:return_to)
    redirect_to root_url, notice: "You signed out successfully."
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
