
package evoting.model

import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.domain.DomainClassUnitTestMixin
import grails.test.mixin.support.GrailsUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestFor(Question)
@TestMixin(DomainClassUnitTestMixin)
class QuestionSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {

        setup:
        Question question = new Question(
                        number: 1,
                        type: QuestionTypeEnum.SINGLE,
                        text: "Pytanie 1?")

        Answer answer1 = new Answer(number: 1, text: "ans1")
        Answer answer2 = new Answer(number: 2, text: "ans2")
        Answer answer3 = new Answer(number: 3, text: "ans3")

        question.answerList.add(answer1)
        question.answerList.add(answer2)
        question.answerList.add(answer3)

        when:
        question.save(flush: true)

        then:
        question.id != null
        answer1.question == question
        answer2.question == question
        answer3.question == question
        answer1.id != null
        answer2.id != null
        answer3.id != null
    }
}
