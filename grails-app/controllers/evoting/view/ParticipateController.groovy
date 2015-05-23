package evoting.view

import evoting.model.Answer
import evoting.model.Question
import evoting.model.QuestionAnswer
import evoting.model.Voter
import evoting.model.Voting
import evoting.model.VotingAnswer
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class ParticipateController {

    static scope = "session"

    def index() {
        redirect(action: "participateInVoting")
    }

    def participateInVotingFlow = {

        authenticate {
            on("authenticate") {
                log.info("params:\n" + params)
                def voters = Voter.findByEmailAndToken(params.voter.email, params.voter.token)
                log.info("voters:\n" + voters)

                Voter voter = voters.first()

                /*
                 * Jeżeli voter wypełnił już swoje głosowanie to prezentujemy widok podglądu odpowiedzi
                 */
                if(voter.submitDate == null) {
                    flow.viewState = "Edit"
                } else {
                    flow.viewState = "View"
                }

                Voting voting = voter.voting

                /*
                 * Tworzymy i dodajemy do flow obiekt typu: VotingAnswer
                 * kojarzymy obiekt VotingAnswer ze znalezionym Voting
                 * uzupełniamy question, zostawiamy AnswerList puste
                 */
                VotingAnswer votingAnswer = new VotingAnswer()
                if(!voting.anonymous) {
                    votingAnswer.voter = voter
                }

                for(Question question : voting.questionList) {
                    QuestionAnswer qAnswer = new QuestionAnswer(question: question)
                    votingAnswer.addToQuestionAnswerList(qAnswer)
                }
                voting.addToVotingAnswerList(votingAnswer)

                flow.votingAnswer = votingAnswer
                flow.voter = voter
                [
                    votingAnswer : flow.votingAnswer,
                    voter : flow.voter
                ]
            }.to("answerQuestions")
        }

        answerQuestions {
            on("answerQuestions") {
                log.info("answerQuestions params:\n" + params)

                // czyścimy wcześniejsze zaznaczenia
                for(QuestionAnswer qAnswer : flow.votingAnswer.questionAnswerList) {
                    qAnswer.answerList.clear()
                }

                flow.votingAnswer.properties = params
                log.info("votingAnswer: " + flow.votingAnswer)

                [
                    votingAnswer : flow.votingAnswer,
                    voter : flow.voter
                ]
            }.to("participateSummary")
        }

        participateSummary {
            on("confirmAnswers") {

                //flow.voter.setSubmitDate(votingAnswer.getSubmissionDate())

            }.to("index")

            on("backToAnswerQuestions") {
            }.to("answerQuestions")
        }
    }
}
