package evoting.model



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VoterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Voter.list(params), model:[voterInstanceCount: Voter.count()]
    }

    def show(Voter voterInstance) {
        respond voterInstance
    }

    def create() {
        respond new Voter(params)
    }

    @Transactional
    def save(Voter voterInstance) {
        if (voterInstance == null) {
            notFound()
            return
        }

        if (voterInstance.hasErrors()) {
            respond voterInstance.errors, view:'create'
            return
        }

        voterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'voter.label', default: 'Voter'), voterInstance.id])
                redirect voterInstance
            }
            '*' { respond voterInstance, [status: CREATED] }
        }
    }

    def edit(Voter voterInstance) {
        respond voterInstance
    }

    @Transactional
    def update(Voter voterInstance) {
        if (voterInstance == null) {
            notFound()
            return
        }

        if (voterInstance.hasErrors()) {
            respond voterInstance.errors, view:'edit'
            return
        }

        voterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Voter.label', default: 'Voter'), voterInstance.id])
                redirect voterInstance
            }
            '*'{ respond voterInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Voter voterInstance) {

        if (voterInstance == null) {
            notFound()
            return
        }

        voterInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Voter.label', default: 'Voter'), voterInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'voter.label', default: 'Voter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
