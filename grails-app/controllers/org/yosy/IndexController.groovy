package org.yosy

import java.sql.Date;

class IndexController {
	def defaultAction = 'inicio'

	def inicio = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		render(view:'../masterpage', model:["template":"../index/index",deseoInstanceList: Deseo.list(params), deseoInstanceTotal: Deseo.count()])
		return false;
	}

	def login = {
		render(view:'../masterpage', model:["template":"../index/index"])
	}

	def prueba = {
		render(view:'../masterpage', model:["template":"../index/index"])
	}

	def start = {
		render(view:'../masterpage', model:["template":"../layouts/branches","action":'flowInit'])
	}

	//Acción a la que se redirige cuando se quiere vaciar el popup
	def vacio = {
		render(view:'../vacio')
	}
	
	def nuevoDeseo = {
		def now = new java.util.Date()
		def usuarioInstance = Usuario.findByEmail(session.user)
		def deseoInstance = new Deseo(titulo:params['titulo'],descripcion:params['descripcion'],fechaCreacion:now,fechaModificacion:now,estado:Estado.CREADO)
		if(usuarioInstance.addToDeseos(deseoInstance).save(flush:true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'deseo.label', default: 'Deseo'), deseoInstance.id])}"
			params.max = Math.min(params.max ? params.int('max') : 10, 100)
			render(template:'../deseo/listMain', model:[deseoInstanceList: Deseo.list(params), deseoInstanceTotal: Deseo.count()])
		}
		else {
			render(view: "../masterpage", model: ["template":"../index/index", deseoInstance: deseoInstance])
		}
	}
	
	def votar = {
		def email = session.user
		def idDeseo = new Long(params['id'])
		def deseoList = Deseo.withCriteria {
			and
			{
				idEq (idDeseo)
				votos { eq ("email", email) }
			}
		}
		def existeVoto = deseoList.size() > 0

		//Si no se ha votado por ese deseo, se añade
		if(!existeVoto)
		{
			def deseoInstance = Deseo.get(params['id']).addToVotos(new Voto(email: email)).save(flush:true)
			def numVotos = deseoInstance.votos.size()
			render(template:'../deseo/votosTabla', model:['numVotos':numVotos+" VOTOS"])
		}
		else
			render(template:'../deseo/votosTabla', model:['numVotos':"Ya has votado este deseo"])
	}

	def flowInitFlow = {

		paso1{
			on('izda').to 'paso2'
			on('dcha').to 'paso3'
		}

		paso2{
		}

		paso3{
		}
	}
}
