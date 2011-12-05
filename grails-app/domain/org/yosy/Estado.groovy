package org.yosy

public enum Estado {
	CREADO(new Integer(1)),
	ACEPTADO(new Integer(2)),
	DENEGADO(new Integer(3)),
	FINALIZADO(new Integer(4)),
	BORRADO(new Integer(5))

	Integer estadoId

	Estado(Integer estadoId) {
		this.estadoId = estadoId
	}
	
	static list() {
		[CREADO, ACEPTADO, DENEGADO, FINALIZADO, BORRADO]
	}

}