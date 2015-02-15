package evoting.model



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VotingController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Voting.list(params), model:[votingInstanceCount: Voting.count()]
    }

    def show(Voting votingInstance) {
        respond votingInstance
    }

    def create() {
        respond new Voting(params)
    }

    @Transactional
    def save(Voting votingInstance) {
        if (votingInstance == null) {
            notFound()
            return
        }

        if (votingInstance.hasErrors()) {
            respond votingInstance.errors, view:'create'
            return
        }

        votingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [
                    message(code: 'voting.label', default: 'Voting'),
                    votingInstance.id
                ])
                redirect votingInstance
            }
            '*' { respond votingInstance, [status: CREATED] }
        }
    }

    def edit(Voting votingInstance) {
        respond votingInstance
    }

    @Transactional
    def update(Voting votingInstance) {
        if (votingInstance == null) {
            notFound()
            return
        }

        if (votingInstance.hasErrors()) {
            respond votingInstance.errors, view:'edit'
            return
        }

        votingInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [
                    message(code: 'Voting.label', default: 'Voting'),
                    votingInstance.id
                ])
                redirect votingInstance
            }
            '*'{ respond votingInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Voting votingInstance) {

        if (votingInstance == null) {
            notFound()
            return
        }

        votingInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [
                    message(code: 'Voting.label', default: 'Voting'),
                    votingInstance.id
                ])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [
                    message(code: 'voting.label', default: 'Voting'),
                    params.id
                ])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
