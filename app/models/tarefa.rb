class Tarefa < ActiveRecord::Base
  default_scope { order 'id desc' }
  scope :ativas, -> { where(concluida: false) }
  scope :concluidas, -> { where(concluida: true) }

  belongs_to :usuario
end
