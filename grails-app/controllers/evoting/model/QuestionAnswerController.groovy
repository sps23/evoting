package evoting.model



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class QuestionAnswerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond QuestionAnswer.list(params), model:[questionAnswerInstanceCount: QuestionAnswer.count()]
    }

    def show(QuestionAnswer questionAnswerInstance) {
        respond questionAnswerInstance
    }

    def create() {
        respond new QuestionAnswer(params)
    }

    @Transactional
    def save(QuestionAnswer questionAnswerInstance) {
        if (questionAnswerInstance == null) {
            notFound()
            return
        }

        if (questionAnswerInstance.hasErrors()) {
            respond questionAnswerInstance.errors, view:'create'
            return
        }

        questionAnswerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'questionAnswer.label', default: 'QuestionAnswer'), questionAnswerInstance.id])
                redirect questionAnswerInstance
            }
            '*' { respond questionAnswerInstance, [status: CREATED] }
        }
    }

    def edit(QuestionAnswer questionAnswerInstance) {
        respond questionAnswerInstance
    }

    @Transactional
    def update(QuestionAnswer questionAnswerInstance) {
        if (questionAnswerInstance == null) {
            notFound()
            return
        }

        if (questionAnswerInstance.hasErrors()) {
            respond questionAnswerInstance.errors, view:'edit'
            return
        }

        questionAnswerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'QuestionAnswer.label', default: 'QuestionAnswer'), questionAnswerInstance.id])
                redirect questionAnswerInstance
            }
            '*'{ respond questionAnswerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(QuestionAnswer questionAnswerInstance) {

        if (questionAnswerInstance == null) {
            notFound()
            return
        }

        questionAnswerInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'QuestionAnswer.label', default: 'QuestionAnswer'), questionAnswerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'questionAnswer.label', default: 'QuestionAnswer'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
