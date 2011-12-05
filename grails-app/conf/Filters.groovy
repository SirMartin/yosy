

import java.net.Authenticator.RequestorType;

class Filters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
				if(!session.user && !actionName.equals('login')) {
					//redirect(action:'login',controller:'index')
					flash.noLogIn = "nigger, what are you doing?"
					//return false
				}
            }
            after = {
                
            }
            afterView = {
                
            }
        }
    }
    
}
