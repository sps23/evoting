package evoting.view

import evoting.model.Answer
import evoting.model.Creator
import evoting.model.Question
import evoting.model.Voter
import evoting.model.Voting
import evoting.parser.AnswerParser
import evoting.token.TokenGenerator

class CreateController {

    static scope = "session"

    def index() {
        redirect(action: "init")
    }

    def createVotingFlow = {

        init {
            action {
                Voting voting = new Voting()
                voting.creator = new Creator()
                log.info("\n\n init voting:\n" + voting)
                flow.voting = voting
                [voting : flow.voting]
            }
            on('success').to("createBasics")
            // on(Exception).to("error")
        }

        createBasics {
            on("createQuestions") {
                log.info("params:\n" + params)
                Voting voting = new Voting(params)
                int numberOfVoters = params.int("numberOfVoters")
                int numberOfQuestions = params.int("numberOfQuestions")
                log.info("\n\n createQuestions voting:\n" + voting)
                flow.voting = voting
                flow.numberOfVoters = numberOfVoters
                flow.numberOfQuestions = numberOfQuestions
                [
                    voting : flow.voting,
                    numberOfVoters : flow.numberOfVoters,
                    numberOfQuestions : flow.numberOfQuestions
                ]
            }.to "createQuestions"
        }

        createQuestions {
            on("createSummary") {
                log.info("params:\n" + params)
                flow.voting.properties = params
                log.info("\n\n createSummary flow.voting:\n" + flow.voting)

                for(voter in flow.voting.voterList) {
                    // generujemy tokeny
                    voter.token = TokenGenerator.generateToken()
                }


                for(question in flow.voting.questionList) {
                    // parsujemy pytania
                    List<Answer> answerList = AnswerParser.parse(question.answerString)
                    log.info("\n\n createSummary answerList:\n" + answerList)
                    for(answer in answerList) {
                        question.addToAnswerList(answer)
                    }
                }

                log.info("\n\n createSummary flow.voting:\n" + flow.voting)
                [voting : flow.voting]
            }.to "createSummary"

            on("backToBasics").to "createBasics"
        }

        createSummary {
            action {
                Voting voting = flow.voting
                log.info("\n\n createSummary voting:\n" + voting)
            }
        }
    }
}
