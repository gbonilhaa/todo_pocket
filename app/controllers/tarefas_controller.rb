class TarefasController < ApplicationController
	before_action :count_all, only: [:index, :ativas, :concluidas, :edit]
  
  def index
	@tarefas = Tarefa.all
    @count_concluidas = count_concluidas
  end

  def toggle
  	Tarefa.find(params[:id]).toggle! :concluida
    redirect_to :back
  end

  def create
    Tarefa.create titulo: params[:tarefa]
    redirect_to :back
  end

  def destroy
    tarefa = Tarefa.find params[:id]
    tarefa.destroy
    redirect_to :back
  end

  def edit
    @tarefas = case params[:list]
      when 'concluidas' then Tarefa.concluidas
      when 'ativas' then Tarefa.ativas
      else Tarefa.all
    end

    @tarefa = Tarefa.find params[:id]
    render :index
  end

  def update
    Tarefa.update params[:id], titulo: params[:titulo]
    #redirect_to tarefas_path
    redirect_to case params[:list]
       when 'concluidas' then concluidas_tarefas_path
       when 'ativas' then ativas_tarefas_path
       else tarefas_path
     end
  end
  
  def ativas
    @tarefas = Tarefa.ativas
    @count_concluidas = count_concluidas
    render :index
  end

  def concluidas
    @tarefas = Tarefa.concluidas
    render :index
  end

  def count_all
    count_concluidas
    count_todas
    count_ativas
  end

  def count_concluidas
    @count_concluidas = Tarefa.concluidas.count
  end

  def count_ativas
    @count_ativas = Tarefa.ativas.count
  end

  def count_todas
    @count_todas = Tarefa.count
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
        when 'concluidas' then Tarefa.concluidas
        when 'ativas' then Tarefa.ativas
        else Tarefa.all
    end
  end

end