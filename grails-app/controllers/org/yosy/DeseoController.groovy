package org.yosy


class DeseoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [deseoInstanceList: Deseo.list(params), deseoInstanceTotal: Deseo.count()]
    }

    def create = {
        def deseoInstance = new Deseo()
        deseoInstance.properties = params
        return [deseoInstance: deseoInstance]
    }

    def save = {
        def deseoInstance = new Deseo(params)
        if (deseoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'deseo.label', default: 'Deseo'), deseoInstance.id])}"
            redirect(action: "show", id: deseoInstance.id)
        }
        else {
            render(view: "create", model: [deseoInstance: deseoInstance])
        }
    }

    def show = {
        def deseoInstance = Deseo.get(params.id)
        if (!deseoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deseo.label', default: 'Deseo'), params.id])}"
            redirect(action: "list")
        }
        else {
            [deseoInstance: deseoInstance]
        }
    }

    def edit = {
        def deseoInstance = Deseo.get(params.id)
        if (!deseoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deseo.label', default: 'Deseo'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [deseoInstance: deseoInstance]
        }
    }

    def update = {
        def deseoInstance = Deseo.get(params.id)
        if (deseoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (deseoInstance.version > version) {
                    
                    deseoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'deseo.label', default: 'Deseo')] as Object[], "Another user has updated this Deseo while you were editing")
                    render(view: "edit", model: [deseoInstance: deseoInstance])
                    return
                }
            }
            deseoInstance.properties = params
            if (!deseoInstance.hasErrors() && deseoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'deseo.label', default: 'Deseo'), deseoInstance.id])}"
                redirect(action: "show", id: deseoInstance.id)
            }
            else {
                render(view: "edit", model: [deseoInstance: deseoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deseo.label', default: 'Deseo'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def deseoInstance = Deseo.get(params.id)
        if (deseoInstance) {
            try {
                deseoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'deseo.label', default: 'Deseo'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'deseo.label', default: 'Deseo'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'deseo.label', default: 'Deseo'), params.id])}"
            redirect(action: "list")
        }
    }
}
