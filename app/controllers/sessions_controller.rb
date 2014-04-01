class SessionsController < ApplicationController
  def create
    	cadastro = cadastro.find_by_email(params[:email])
    	if cadastro && cadastro.authenticate(params[:password])
    else
    	render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end