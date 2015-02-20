package evoting.model

import evoting.token.TokenGenerator
import grails.test.mixin.TestFor
import grails.test.mixin.TestMixin
import grails.test.mixin.domain.DomainClassUnitTestMixin
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(VotingAnswer)
@TestMixin(DomainClassUnitTestMixin)
class VotingAnswerSpec {

    def setup() {
    }

    def cleanup() {
    }

    void "test save without voter"() {

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

        //        Voter voter = new Voter(email: "v@vv.pl", token: TokenGenerator.generateToken())

        VotingAnswer va = new VotingAnswer()
        va.questionAnwerList.add(qa)

        when:
        va.save(flush: true)

        then:
        assert va.id != null
        //        assert voter.id != null
        //        assert va.voter == voter
        assert va.questionAnwerList.contains(qa)
        assert qa.question == question
        assert question.id != null
        assert answer1.id != null
        assert answer2.id != null
        assert answer3.id != null
    }
}
