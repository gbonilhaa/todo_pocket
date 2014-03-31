class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nomerails
      t.string :g
      t.string :scaffold
      t.string :cadastro
      t.string :nome
      t.string :email
      t.string :password_digest
      t.text :endereco
      t.boolean :admin
      t.date :data_nasc

      t.timestamps
    end
  end
end
