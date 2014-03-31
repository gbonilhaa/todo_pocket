# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
#for	i in 1..10
#	Tarefa.create titulo: "Tarefa #{i}",
#				  concluida: i % 3 == 0
#end


for	i in 1..10
	Usuarios.create nome: "Usuário #{i}"
end