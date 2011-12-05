package org.yosy

import java.sql.Date;

class IndexController {
	def defaultAction = 'inicio'

	def inicio = {

		def hasCookies = false
		def EMAILCOOKIE = "email"
		def DESEOSCOOKIE = new java.lang.String("DESEOSCOOKIE")
		def md5 = java.security.MessageDigest.getInstance("MD5")
		DESEOSCOOKIE  = md5.digest(DESEOSCOOKIE.getBytes()).toString()
		md5.update(DESEOSCOOKIE.getBytes(), 0, DESEOSCOOKIE.length());
		DESEOSCOOKIE = new BigInteger(1, md5.digest()).toString(16)
		for (cookieIt in request.cookies) {
			if(cookieIt.name.equals(EMAILCOOKIE)==true || cookieIt.name.equals(EMAILCOOKIE)==true) {
				hasCookies = true
				break
			}
		}

		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		render(view:'../masterpage', model:["template":"../layouts/example",deseoInstanceList: Deseo.list(params), deseoInstanceTotal: Deseo.count(), hasCookies:hasCookies])
		return false;
	}

	def login = {
		render(view:'../masterpage', model:["template":"../layouts/example"])
	}

	def prueba = {
		render(view:'../masterpage', model:["template":"../layouts/example"])
	}

	def updateImage = {
		render("<strong>"+params['author']+"</strong>")
		return false;
	}

	def start = {
		render(view:'../masterpage', model:["template":"../layouts/branches","action":'flowInit'])
	}

	def nuevoDeseo = {

		def now = new java.util.Date()
		def usuarioInstance = Usuario.findByEmail(params['email'])
		if (usuarioInstance == null)
			usuarioInstance = new Usuario(email:params['email'],fechaAlta:now)
		def deseoInstance = new Deseo(titulo:params['titulo'],descripcion:params['descripcion'],fechaCreacion:now,fechaModificacion:now,estado:Estado.CREADO)
		if(usuarioInstance.addToDeseos(deseoInstance).save(flush:true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'deseo.label', default: 'Deseo'), deseoInstance.id])}"
			params.max = Math.min(params.max ? params.int('max') : 10, 100)
			render(template:'../deseo/listMain', model:[deseoInstanceList: Deseo.list(params), deseoInstanceTotal: Deseo.count()])
		}
		else {
			render(view: "../masterpage", model: ["template":"../layouts/example", deseoInstance: deseoInstance])
		}
	}

	def votar = {

		def emailCookie = null
		def EMAILCOOKIE = "email"
		//Si existe la cookie de correo, se pilla el deseo y se le mete el voto como dios
		for (cookieIt in request.cookies) {
			if(cookieIt.name.equals(EMAILCOOKIE)==true) {
				emailCookie = cookieIt
				break
			}
		}

		if (emailCookie != null)
		{

			//OBTENCIÓN MONSTRUOSA DE EMAIL

			def emailRaw = emailCookie.value.toString().split('_')
			def lengthString = Integer.parseInt(emailRaw[emailRaw.length-1])-1
			def email = new java.lang.String(emailCookie.value).substring(0,lengthString)
			def emailCuts = new java.lang.String(emailCookie.value).substring(lengthString,emailCookie.value.length()-1).split('_')
			for(def i = 1; i<emailCuts.length-1; i++)
			{
				email = new java.lang.StringBuffer(email).insert(Integer.parseInt(emailCuts[i]), "@").toString();
			}

			//

			def idDeseo = new Long(params['id'])
			def deseoList = Deseo.withCriteria {
				and
				{
					idEq (idDeseo)
					votos { eq ("email", email) }
				}
			}
			def existeVoto = deseoList.size() > 0

			if(!existeVoto)
			{
				def deseoInstance = Deseo.get(params['id']).addToVotos(new Voto(email: email)).save(flush:true)
				def numVotos = deseoInstance.votos.size()
				render(template:'../deseo/votosTabla', model:['numVotos':numVotos+" VOTOS"])
			}
			else
				render(template:'../deseo/votosTabla', model:['numVotos':"¿Ya vale de votar, no?"])
		}
		else
		{
			//Si no, se crea una cookie con los deseos votados :sadface:
			def DESEOSCOOKIE = new java.lang.String("DESEOSCOOKIE")
			def md5 = java.security.MessageDigest.getInstance("MD5")
			DESEOSCOOKIE  = md5.digest(DESEOSCOOKIE.getBytes()).toString()
			md5.update(DESEOSCOOKIE.getBytes(), 0, DESEOSCOOKIE.length());
			DESEOSCOOKIE = new BigInteger(1, md5.digest()).toString(16)

			def cookie = null
			for (cookieIt in request.cookies) {
				if(cookieIt.name.equals(DESEOSCOOKIE.value.toString())==true) {
					cookie = cookieIt
					break
				}
			}

			if (cookie == null) {
				cookie = new javax.servlet.http.Cookie(DESEOSCOOKIE.value.toString(), params['id']+'_')
				def deseoInstance = Deseo.get(params['id']).addToVotos(new Voto(email:'usuario_no_registrado@yosy.org')).save(flush:true)
				def numVotos = deseoInstance.votos.size()
				cookie.setValue(params['id']+'_'+cookie.value.value )
				render(template:'../deseo/votosTabla', model:['numVotos':numVotos+" VOTOS"])
				response.addCookie(cookie)
			}
			else {
				def ids = cookie.value.split("_")
				def idFound = false
				for (idIt in ids) {
					if (idIt.equals(params['id']) == true) {
						idFound = true
						break
					}
				}

				if (idFound == false) {
					def deseoInstance = Deseo.get(params['id']).addToVotos(new Voto(email:'usuario_no_registrado@yosy.org')).save(flush:true)
					def numVotos = deseoInstance.votos.size()
					cookie.setValue(params['id']+'_'+cookie.value.value )
					render(template:'../deseo/votosTabla', model:['numVotos':numVotos+" VOTOS"])
					response.addCookie(cookie)
				}
				else {
					render(template:'../deseo/votosTabla', model:['numVotos':"NOPE"])
				}
			}
		}
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
