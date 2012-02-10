

import java.net.Authenticator.RequestorType;
import org.yosy.EstadoUsuario;
import org.yosy.Usuario

class Filters {

	def filters = {
		all(controller:'index|comentario|deseo|usuario|voto|perfil', action:'nuevoDeseo|votar|indexPerfil') {
			before = {
				if(!session.user || session.estadoUsuario != EstadoUsuario.REGISTRADO) {	
					response.status = 401 // no autorizado
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
