package org.yosy

class PerfilController {

	def indexPerfil = {

		def deseosVotados = Deseo.withCriteria {
			and {
				votos { eq ("email", session.user) }
			}
		}
		def deseosCreados = Deseo.withCriteria {

			usuarios { idEq(session.userId)}
		}
		render(view: "../masterpage", model: ["template":"perfil", deseosVotados: deseosVotados, deseosCreados:deseosCreados])
	}
}
