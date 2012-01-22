package org.yosy

import java.util.Date;

class Usuario {

	static hasMany = [deseos:Deseo]

	String nombre
	String email
	String password
	Date fechaAlta
	TipoUsuario tipoUsuario
	EstadoUsuario estadoUsuario

	static mapping = { id generator: 'native' }

	static constraints = {
		nombre(nullable: true,unique:true)
		email(email:true,unique:true)
		password(blank:false, password:true)
	}
}
