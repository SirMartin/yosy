package org.yosy

public enum TipoUsuario {

	USUARIO(new Integer(1)),
	VOLUNTARIO(new Integer(2)),
	ADMIN(new Integer(3))

	String tipoUsuarioId

	TipoUsuario(Integer tipoUsuarioId) {
		this.tipoUsuarioId = tipoUsuarioId
	}

	static list() {
		[USUARIO, VOLUNTARIO, ADMIN]
	}

	static listRegistro() {
		[USUARIO, VOLUNTARIO]
	}
	
}
