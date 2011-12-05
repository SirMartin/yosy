package org.yosy

class Deseo {

	static hasMany =	[
							comentarios:Comentario,
							votos:Voto,
							usuarios:Usuario
						]
	
	static belongsTo = Usuario
	
	
	String titulo
	String descripcion
	Date fechaModificacion
	Date fechaCreacion
	Estado estado

	static mapping = {
		id generator: 'native'
	}
	
	static constraints = {
	}
}
