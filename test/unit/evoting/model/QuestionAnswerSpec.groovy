package evoting.model

import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin;
import grails.test.mixin.domain.DomainClassUnitTestMixin;
import grails.test.spock.IntegrationSpec;
import spock.lang.Specification
import evoting.model.Question.QuestionTypeEnum;

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(QuestionAnswer)
@TestMixin(DomainClassUnitTestMixin)
class QuestionAnswerSpec {

    def setup() {
    }

    def cleanup() {
    }

    void "test save"() {

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

        QuestionAnswer qa = new QuestionAnswer(question : question)
        qa.answerList.add(answer3)

        when:
        qa.save()

        then:
        qa.question == question
        question.id != null
        answer1.id != null
        answer2.id != null
        answer3.id != null
    }
}
