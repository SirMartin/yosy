package org.yosy

class Voto {
	
	static belongsTo = Deseo
	
	String email

	static mapping = {
		id generator: 'native'
	}
	
	static constraints = {
	}
}
