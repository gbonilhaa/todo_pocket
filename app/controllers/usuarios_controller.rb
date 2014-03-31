class UsuariosController < ApplicationController
  before_action :acesso_restrito!, only: [:new, :edit]
    def index
      @usuarios = Usuario.all
      session[:logado] = ! session[:logado]
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

    end

    private

    def usuario_params
      params.require(:usuario).permit(:nome, :email, :password, password_confirmation)
    end

    def logado?
      session[:logado].present?
    end

    def acesso_restrito!
      render text: 'acesso negado'
      return false

    end
end