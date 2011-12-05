class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller:"index", action: "inicio")
		"/login"(controler:"index", action:'login')
		"500"(view:'/error')
	}
}
