class Usuario < ActiveRecord::Base
  has_secure_password

  has_many :tarefas
  
  validates :nome, :email, presence: true
  validates :email, uniqueness: true

  def self.find_by_authentication(email, password)
    find_by_email(email).try :authentication, password
  end
end
