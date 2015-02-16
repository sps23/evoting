package evoting.view

import evoting.model.Voting

class CreateController {

    def index() {
        redirect(action: "createVoting")
    }

    def createVotingFlow = {

        init {
            action {
                def voting = new Voting()
                flow.voting = voting
            }
            on('success').to "createBasics"
        }

        createBasics {
            //            [voting : new Voting()]
            on("createQuestions").to "createQuestions"
        }

        createQuestions {
            //            render(view: "createVotingQuestions")
            on("createSummary").to "createSummary"
        }

        createSummary()
    }
}
