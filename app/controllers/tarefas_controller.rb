class TarefasController < ApplicationController
  before_action :acesso_restrito!
  before_action :count_all, only: [:index, :ativas, :concluidas, :edit]
  
  def index
   @tarefas = scope.all
   @count_concluidas = count_concluidas
  end

  def toggle
    scope.find(params[:id]).toggle! :concluida
    redirect_to :back
  end

  def create
    scope.create titulo: params[:tarefa]
    redirect_to :back
  end

  def destroy
    tarefa = scope.find params[:id]
    tarefa.destroy
    redirect_to :back
  end

  def edit
    @tarefas = case params[:list]
      when 'concluidas' then scope.concluidas
      when 'ativas' then scope.ativas
      else scope.all
    end

    @tarefa = scope.find params[:id]
    render :index
  end

  def update
    scope.update params[:id], titulo: params[:titulo]
    #redirect_to tarefas_path
    redirect_to case params[:list]
       when 'concluidas' then concluidas_tarefas_path
       when 'ativas' then ativas_tarefas_path
       else tarefas_path
     end
  end
  
  def ativas
    @tarefas = scope.ativas
    @count_concluidas = count_concluidas
    render :index
  end

  def concluidas
    @tarefas = scope.concluidas
    render :index
  end

  private

  def scope
    usuario_logado.tarefas
  end

  def count_all
    count_concluidas
    count_todas
    count_ativas
  end

  def count_concluidas
    @count_concluidas = scope.concluidas.count
  end

  def count_ativas
    @count_ativas = scope.ativas.count
  end

  def count_todas
    @count_todas = scope.count
  end

  def redirect
      redirect_to case params[:list]
        when 'concluidas' then concluidas_tarefas_path
        when 'ativas' then ativas_tarefas_path
        else tarefas_path
    end
  end

  def get_tarefas_edit
      case params[:list]
        when 'concluidas' then scope.concluidas
        when 'ativas' then scope.ativas
        else scope.all
    end
  end

end