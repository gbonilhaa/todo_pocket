class SessionsController < ApplicationController
  def create
    	usuario = Usuario.find_by_email(params[:email])
    	if usuario && usuario.authenticate(params[:password])
    		session[:id] = usuario.id
    		redirect_to root_path
    else
    	render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end