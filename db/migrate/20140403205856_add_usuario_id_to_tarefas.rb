class AddUsuarioIdToTarefas < ActiveRecord::Migration
  def change
    add_reference :tarefas, :usuario, index: true
  end
end
