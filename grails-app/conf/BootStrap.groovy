import javax.swing.plaf.metal.MetalBorders.QuestionDialogBorder

import evoting.model.Answer
import evoting.model.Creator
import evoting.model.Question
import evoting.model.Question.QuestionTypeEnum
import evoting.model.QuestionAnswer
import evoting.model.Voter
import evoting.model.VotingAnswer
import evoting.token.TokenGenerator
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->

        println "initializing data..."
        if(Environment.DEVELOPMENT.equals(Environment.current)) {

            println "initializing data for DEV env"
            // questions with answers

            Question ulubionyPoeta = new Question(
                            number: 1, type: QuestionTypeEnum.SINGLE, multiplicity: 0, orderedMultiplicity: 0,
                            text: "Jaki jest Twój ulubiony poeta")

            Answer mickiewicz = new Answer(number: 1, text: "Adam Mickiewicz")
            Answer slowacki = new Answer(number: 2, text: "Juliusz Słowacki")
            Answer norwid = new Answer(number: 3, text: "Cyprian Kamil Norwid")
            ulubionyPoeta.addToAnswerList(mickiewicz)
            ulubionyPoeta.addToAnswerList(slowacki)
            ulubionyPoeta.addToAnswerList(norwid)

            ulubionyPoeta.save(flush : true, failOnError:true)

            Question ulubionyKompozytor = new Question(
                            number: 2, type: QuestionTypeEnum.MULTIPLE, multiplicity: 3, orderedMultiplicity: 0,
                            text: "Jaki jest Twój ulubiony kompozytor")

            Answer chopin = new Answer(number: 1, text: "Fryderyk Franciszek Chopin")
            Answer szymanowski = new Answer(number: 2, text: "Karol Szymanowski")
            Answer lutoslawski = new Answer(number: 3, text: "Witold Lutoslawski")
            Answer penderecki = new Answer(number: 4, text: "Krzysztof Penderecki")
            Answer kilar = new Answer(number: 5, text: "Wojciech Kilar")
            Answer moniuszko = new Answer(number: 6, text: "Stanisław Moniuszko")
            ulubionyKompozytor.addToAnswerList(chopin)
            ulubionyKompozytor.addToAnswerList(szymanowski)
            ulubionyKompozytor.addToAnswerList(lutoslawski)
            ulubionyKompozytor.addToAnswerList(penderecki)
            ulubionyKompozytor.addToAnswerList(kilar)
            ulubionyKompozytor.addToAnswerList(moniuszko)

            ulubionyKompozytor.save(flush : true, failOnError:true)

            // Voters
            Voter voter1 = new Voter(
                            email: "voter1@svs.pl", token: TokenGenerator.generateToken()).save(flush : true, failOnError:true)
            Voter voter2 = new Voter(
                            email: "voter2@svs.pl", token: TokenGenerator.generateToken()).save(flush : true, failOnError:true)
            Voter voter3 = new Voter(
                            email: "voter3@svs.pl", token: TokenGenerator.generateToken()).save(flush : true, failOnError:true)
            Voter voter4 = new Voter(
                            email: "voter4@svs.pl", token: TokenGenerator.generateToken()).save(flush : true, failOnError:true)
            Voter voter5 = new Voter(
                            email: "voter5@svs.pl", token: TokenGenerator.generateToken()).save(flush : true, failOnError:true)
            Voter voter6 = new Voter(
                            email: "voter6@svs.pl", token: TokenGenerator.generateToken()).save(flush : true, failOnError:true)

            // Creators
            new Creator(email: "creator1@svs.pl", token: TokenGenerator.generateToken()).save(flush : true, failOnError:true)
            new Creator(email: "creator2@svs.pl", token: TokenGenerator.generateToken()).save(flush : true, failOnError:true)
            new Creator(email: "creator3@svs.pl", token: TokenGenerator.generateToken()).save(flush : true, failOnError:true)

            // VotingAnswer with answers
            VotingAnswer votingAnswer1 = new VotingAnswer(voter: voter1, submissionDate: new Date())

            QuestionAnswer questionAnswer1 = new QuestionAnswer(
                            question: ulubionyKompozytor,
                            answerList: [chopin, szymanowski, kilar])
            QuestionAnswer questionAnswer2 = new QuestionAnswer(
                            question: ulubionyPoeta,
                            answerList: [mickiewicz])

            votingAnswer1.addToQuestionAnswerList(questionAnswer1)
            votingAnswer1.addToQuestionAnswerList(questionAnswer2)

            votingAnswer1.save(flush : true, failOnError:true)

        }
    }
    def destroy = {
    }
}
