package org.yosy

import java.util.Date;

class Usuario {

	static hasMany = [deseos:Deseo]

	String nombre
	String email
	String password
	Date fechaAlta
	String tipoUsuario

   TipoUsuario getTipoUsuario() { tipoUsuario ? TipoUsuario.byId(tipoUsuario) : null }
   void setTipoUsuario(TipoUsuario tipoUsuario) { 
	   this.tipoUsuario = tipoUsuario.tipoUsuarioId
	   }

   static transients = ['tipoUsuario']

	static mapping = { id generator: 'native' }

	static constraints = { nombre(nullable: true)
		tipoUsuario inList: TipoUsuario.values()*.id  }
}
