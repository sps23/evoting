package evoting.view

import evoting.model.Voter
import evoting.model.Voting

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

                Voting voting = voters.first().voting
                flow.voting = voting
                flow.numberOfQuestions = voting.questionList.size()
            }.to("answerQuestions")
        }

        answerQuestions {
            on("answerQuestions") {
                log.info("params:\n" + params)
            }.to("participateSummary")
        }

        participateSummary {
            on("confirmAnswers") {
            }.to("index")

            on("backToAnswerQuestions") {
            }.to("answerQuestions")
        }
    }
}
