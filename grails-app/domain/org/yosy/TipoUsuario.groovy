package org.yosy

public enum TipoUsuario {

	USUARIO("1"),
	VOLUNTARIO("2"),
	ADMIN("3")

	String tipoUsuarioId

	TipoUsuario(String tipoUsuarioId) {
		this.tipoUsuarioId = tipoUsuarioId
	}
	
	String getId()
	{
		tipoUsuarioId
	}

	static list() {
		[USUARIO, VOLUNTARIO, ADMIN]
	}

	static listRegistro() {
		[USUARIO, VOLUNTARIO]
	}
	
	static TipoUsuario byId(String id) {
		values().find { it.tipoUsuarioId == id }
	 }

	public static TipoUsuario GetTipoUsuario(String idTipoUsuario){
		switch(idTipoUsuario) {
			case "1":
				return TipoUsuario.USUARIO
				break
			case "2":
				return TipoUsuario.VOLUNTARIO
				break
			case "3":
				return TipoUsuario.ADMIN
				break
		}
	}
}
