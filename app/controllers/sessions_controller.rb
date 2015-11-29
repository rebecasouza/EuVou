class SessionsController < ApplicationController
  def create
    auth = request.env["ominiauth.auth"]
    #session[:omniauth] = auth.exept('extra')
    user = User.sign_in_from_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    session[:omniauth] = nil
    redirect_to root_url
  end
end