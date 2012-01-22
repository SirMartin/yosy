

import java.net.Authenticator.RequestorType;
import org.yosy.EstadoUsuario;

class Filters {

	def filters = {
		all(controller:'index|comentario|deseo|usuario|voto|perfil', action:'nuevoDeseo|votar|indexPerfil') {
			before = {
				if(!session.user || session.user.estadoUsuario != EstadoUsuario.REGISTRADO) {
					redirect(action:'login',controller:'registro',params:[needsLogin:"Para realizar esta tarea necesita estar registrado e iniciar sesión."])
					flash.noLogIn = true
					return false
				}
				else {
					flash.noLogIn = false
					return true
				}
			}
			after = {
			}
			afterView = {
			}
		}
	}
}
