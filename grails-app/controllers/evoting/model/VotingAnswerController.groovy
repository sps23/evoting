package evoting.model



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class VotingAnswerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond VotingAnswer.list(params), model:[votingAnswerInstanceCount: VotingAnswer.count()]
    }

    def show(VotingAnswer votingAnswerInstance) {
        respond votingAnswerInstance
    }

    def create() {
        respond new VotingAnswer(params)
    }

    @Transactional
    def save(VotingAnswer votingAnswerInstance) {
        if (votingAnswerInstance == null) {
            notFound()
            return
        }

        if (votingAnswerInstance.hasErrors()) {
            respond votingAnswerInstance.errors, view:'create'
            return
        }

        votingAnswerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'votingAnswer.label', default: 'VotingAnswer'), votingAnswerInstance.id])
                redirect votingAnswerInstance
            }
            '*' { respond votingAnswerInstance, [status: CREATED] }
        }
    }

    def edit(VotingAnswer votingAnswerInstance) {
        respond votingAnswerInstance
    }

    @Transactional
    def update(VotingAnswer votingAnswerInstance) {
        if (votingAnswerInstance == null) {
            notFound()
            return
        }

        if (votingAnswerInstance.hasErrors()) {
            respond votingAnswerInstance.errors, view:'edit'
            return
        }

        votingAnswerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'VotingAnswer.label', default: 'VotingAnswer'), votingAnswerInstance.id])
                redirect votingAnswerInstance
            }
            '*'{ respond votingAnswerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(VotingAnswer votingAnswerInstance) {

        if (votingAnswerInstance == null) {
            notFound()
            return
        }

        votingAnswerInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'VotingAnswer.label', default: 'VotingAnswer'), votingAnswerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'votingAnswer.label', default: 'VotingAnswer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
