class UsuariosController < ApplicationController
  before_action :acesso_restrito!, except: :new
    def index
      @usuarios = Usuario.all

    end

    def create
      Usuario.create! usuario_params
      redirect_to usuarios_path
    end

    def update
      Usuario.update params[:id], usuario_params
      redirect_to usuarios_path
    end

    def destroy
      usuario = Usuario.find params[:id]
      usuario.destroy
      redirect_to usuarios_path
    end

    def new
      @usuario = Usuario.new
    end

    def edit
      @usuario = Usuario.find params[:id]
      render :new

    end

    private
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end
    
    def usuario_params
      params.require(:usuario).permit(:nome, :email, :password, :password_confirmation)
      #params.require(:usuario).permit(:nome, :email, :password, password_confirmation)
    end

    
end