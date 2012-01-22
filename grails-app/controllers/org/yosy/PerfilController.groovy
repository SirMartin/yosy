package org.yosy

class PerfilController {

	def indexPerfil = {

		def deseosVotados = Deseo.withCriteria {
			and {
				votos { eq ("email", session.user.email) }
			}
		}
		def deseosCreados = Deseo.withCriteria {

			usuarios { idEq(session.user.id)}
		}
		render(view: "../masterpage", model: ["template":"perfil", deseosVotados: deseosVotados, deseosCreados:deseosCreados])
	}
}
