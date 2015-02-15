package evoting.model



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CreatorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Creator.list(params), model:[creatorInstanceCount: Creator.count()]
    }

    def show(Creator creatorInstance) {
        respond creatorInstance
    }

    def create() {
        respond new Creator(params)
    }

    @Transactional
    def save(Creator creatorInstance) {
        if (creatorInstance == null) {
            notFound()
            return
        }

        if (creatorInstance.hasErrors()) {
            respond creatorInstance.errors, view:'create'
            return
        }

        creatorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'creator.label', default: 'Creator'), creatorInstance.id])
                redirect creatorInstance
            }
            '*' { respond creatorInstance, [status: CREATED] }
        }
    }

    def edit(Creator creatorInstance) {
        respond creatorInstance
    }

    @Transactional
    def update(Creator creatorInstance) {
        if (creatorInstance == null) {
            notFound()
            return
        }

        if (creatorInstance.hasErrors()) {
            respond creatorInstance.errors, view:'edit'
            return
        }

        creatorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Creator.label', default: 'Creator'), creatorInstance.id])
                redirect creatorInstance
            }
            '*'{ respond creatorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Creator creatorInstance) {

        if (creatorInstance == null) {
            notFound()
            return
        }

        creatorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Creator.label', default: 'Creator'), creatorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'creator.label', default: 'Creator'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
