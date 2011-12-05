package org.yosy


class ComentarioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [comentarioInstanceList: Comentario.list(params), comentarioInstanceTotal: Comentario.count()]
    }

    def create = {
        def comentarioInstance = new Comentario()
        comentarioInstance.properties = params
        return [comentarioInstance: comentarioInstance]
    }

    def save = {
        def comentarioInstance = new Comentario(params)
        if (comentarioInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'comentario.label', default: 'Comentario'), comentarioInstance.id])}"
            redirect(action: "show", id: comentarioInstance.id)
        }
        else {
            render(view: "create", model: [comentarioInstance: comentarioInstance])
        }
    }

    def show = {
        def comentarioInstance = Comentario.get(params.id)
        if (!comentarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comentario.label', default: 'Comentario'), params.id])}"
            redirect(action: "list")
        }
        else {
            [comentarioInstance: comentarioInstance]
        }
    }

    def edit = {
        def comentarioInstance = Comentario.get(params.id)
        if (!comentarioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comentario.label', default: 'Comentario'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [comentarioInstance: comentarioInstance]
        }
    }

    def update = {
        def comentarioInstance = Comentario.get(params.id)
        if (comentarioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (comentarioInstance.version > version) {
                    
                    comentarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'comentario.label', default: 'Comentario')] as Object[], "Another user has updated this Comentario while you were editing")
                    render(view: "edit", model: [comentarioInstance: comentarioInstance])
                    return
                }
            }
            comentarioInstance.properties = params
            if (!comentarioInstance.hasErrors() && comentarioInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'comentario.label', default: 'Comentario'), comentarioInstance.id])}"
                redirect(action: "show", id: comentarioInstance.id)
            }
            else {
                render(view: "edit", model: [comentarioInstance: comentarioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comentario.label', default: 'Comentario'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def comentarioInstance = Comentario.get(params.id)
        if (comentarioInstance) {
            try {
                comentarioInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'comentario.label', default: 'Comentario'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'comentario.label', default: 'Comentario'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'comentario.label', default: 'Comentario'), params.id])}"
            redirect(action: "list")
        }
    }
}
