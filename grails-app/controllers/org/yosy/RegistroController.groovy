package org.yosy

class RegistroController {

	static allowedMethods = [save: "POST"]

	def index = {
		def asd = TipoUsuario.values()
		render(view: "create", model: [usuarioInstance: new Usuario()])
	}

	def save = {
		def usuarioInstance = new Usuario(params)
		def passwordRepeat = params["passwordRepeat"]
		def p = TipoUsuario.byId(params["tipoUsuario"])
		usuarioInstance.setTipoUsuario(p)
		//usuarioInstance.tipoUsuario = TipoUsuario.list()[new Integer(params["tipoUsuario"])-1]//(new Integer(params["tipoUsuario"]))
		usuarioInstance.fechaAlta = new java.util.Date()
		if (passwordRepeat.equals(usuarioInstance.password))
		{
			if (usuarioInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
				redirect(action: "show", id: usuarioInstance.id)
			}
			else {
				render(view: "create", model: [usuarioInstance: usuarioInstance])
			}
		}else{
			//Error validación passwords diferentes.
		}
	}
}

