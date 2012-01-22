package org.yosy

public enum EstadoUsuario {
	
	NOREGISTRADO(new Integer(1)),
	REGISTRADO(new Integer(2)),
	BANEADO(new Integer(3)),
	BORRADO(new Integer(4))

	Integer estadoUsuarioId

	EstadoUsuario(Integer estadoUsuarioId) {
		this.estadoUsuarioId = estadoUsuarioId
	}
	
	static list() {
		[NOREGISTRADO, REGISTRADO, BANEADO,  BORRADO]
	}

}
