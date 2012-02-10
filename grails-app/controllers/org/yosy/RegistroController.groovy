package org.yosy

import org.codehaus.groovy.tools.Utilities;

class RegistroController {

	static allowedMethods = [save: "POST"]
	def defaultAction = 'index'

	//Carga por application context
	org.yosy.utils.Utilities utilities

	//Carga p�gina de registro
	def index = {
		render(view: "registro", model: [usuarioInstance: new Usuario()])
	}

	//Registra al usuario
	def save = {
		def usuarioInstance = new Usuario(params)
		def passwordRepeat = params["passwordRepeat"]
		usuarioInstance.fechaAlta = new java.util.Date()
		if (passwordRepeat.equals(usuarioInstance.password)) {
			//Codificamos la contrase�a antes de introducirla en base de datos
			usuarioInstance.password = org.yosy.utils.Utilities.codMD5(usuarioInstance.password)
			usuarioInstance.estadoUsuario = EstadoUsuario.NOREGISTRADO
			if (usuarioInstance.save(flush: true)) {
				//Se necesita hacer esto para parir el hash (s�, ya me jode ya...)
				def timestamp = new java.sql.Timestamp(usuarioInstance.fechaAlta.getTime()).toString()
				timestamp = timestamp.substring(0,timestamp.length()-3) +"0"
				//
				utilities.sendEmail(usuarioInstance.email, "Acaba de iniciar un proceso de registro en http://www.yosy.org."
						+"\nPara confirmar el mismo, s�lo tiene que clicar sobre el siguiente <a href='http://yosydev.yosy.cloudbees.net/registro/activate?email="+usuarioInstance.email+"&c="+org.yosy.utils.Utilities.codMD5(usuarioInstance.password+timestamp+usuarioInstance.email)+"'>enlace</a>"
						,"Finalizaci�n de registro yosy.org",true)
				flash.message = "${message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])}"
				//Se cierra el popup
				render(view:'../vacio',,model: ["actionN":actionName])
			}
			else {
				render(view: "registro", model: [usuarioInstance: usuarioInstance])
			}
		}else{
			//Error validaci�n passwords diferentes.
		}
	}

	def login = {
		def email = params?.email
		if(email==null || email.length() == 0)
		{
			render(view: "login", model: [usuarioInstance: new Usuario()])
		}
		else {
			def usuarioInstance = Usuario.findByEmail(email)
			if(usuarioInstance != null && usuarioInstance.password == org.yosy.utils.Utilities.codMD5(params['password']))
			{
				session.user = usuarioInstance.email
				session.estadoUsuario = usuarioInstance.estadoUsuario
				session.userId = usuarioInstance.id
				//Se cierra el popup
				render(view:'../vacio',model: ["actionN":actionName])
			}
			else
			{
				//TODO: a�adir un error de contrase�a no v�lida
				render(view: "login", model: [usuarioInstance: usuarioInstance])
			}
		}
	}

	def activate = {
		def correo = params['email']
		def md5 = params['c']
		def usuarioInstance = Usuario.findByEmail(correo)
		def md5C = org.yosy.utils.Utilities.codMD5(usuarioInstance.password+usuarioInstance.fechaAlta.toString()+usuarioInstance.email)
		if(md5C.compareTo(md5) == 0)
		{
			usuarioInstance.estadoUsuario = EstadoUsuario.REGISTRADO
			usuarioInstance.save()
		}
	}

	def logout = {
		session.user = null
		session.estadoUsuario = null
		session.userId = null
		render(view:'../vacio',model: ["actionN":actionName])
	}
}

