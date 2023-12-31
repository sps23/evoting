import javax.swing.plaf.metal.MetalBorders.QuestionDialogBorder

import evoting.model.Answer
import evoting.model.Creator
import evoting.model.Question
import evoting.model.QuestionAnswer
import evoting.model.QuestionTypeEnum
import evoting.model.Voter
import evoting.model.Voting
import evoting.model.VotingAnswer
import evoting.token.TokenGenerator
import grails.util.Environment

class BootStrap {

    def init = { servletContext ->

        println "initializing data..."
        if(Environment.DEVELOPMENT.equals(Environment.current)) {

            println "initializing data for DEV env"

            // voting
            String description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor " +
                            "incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud " +
                            "exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."

            Creator creator1 = new Creator(email: "easy.voting.office@gmail.com", token: "qwer1234")
            Voting  voting1 = new Voting(name : "Easy Voting Test", description: description, creator: creator1)

            Voter voterTom = new Voter( email: "easy.voting.tom@gmail.com", token: "tomtom")
            voting1.addToVoterList(voterTom)

            Voter voterJohn = new Voter( email: "easy.voting.john@gmail.com", token: "johnjohn")
            voting1.addToVoterList(voterJohn)

            Voter voterKate = new Voter( email: "easy.voting.kate@gmail.com", token: "katekate")
            voting1.addToVoterList(voterKate)

            // questions with answers
            Question ulubionyPoeta = new Question(
                            number: 1, type: QuestionTypeEnum.SINGLE, multiplicity: 1,
                            text: "Jaki jest Twój ulubiony poeta")

            Answer mickiewicz = new Answer(number: 1, text: "Adam Mickiewicz")
            Answer slowacki = new Answer(number: 2, text: "Juliusz Słowacki")
            Answer norwid = new Answer(number: 3, text: "Cyprian Kamil Norwid")
            ulubionyPoeta.addToAnswerList(mickiewicz)
            ulubionyPoeta.addToAnswerList(slowacki)
            ulubionyPoeta.addToAnswerList(norwid)
            voting1.addToQuestionList(ulubionyPoeta)

            Question ulubionyKompozytor = new Question(
                            number: 2, type: QuestionTypeEnum.MULTIPLE, multiplicity: 3,
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
            voting1.addToQuestionList(ulubionyKompozytor)

            Question ulubionyPianistaJazzowy = new Question(
                            number: 3, type: QuestionTypeEnum.ORDERED, multiplicity: 3,
                            text: "Jaki jest Twój ulubiony pianista jazzowy")

            Answer hancock = new Answer(number: 1, text: "Herbie Hancock")
            Answer brubeck = new Answer(number: 2, text: "Dave Brubeck")
            Answer corea = new Answer(number: 3, text: "Chick Corea")
            Answer jarret = new Answer(number: 4, text: "Keith Jarret")
            Answer evans = new Answer(number: 5, text: "Bill Evans")
            ulubionyPianistaJazzowy.addToAnswerList(hancock)
            ulubionyPianistaJazzowy.addToAnswerList(brubeck)
            ulubionyPianistaJazzowy.addToAnswerList(corea)
            ulubionyPianistaJazzowy.addToAnswerList(jarret)
            ulubionyPianistaJazzowy.addToAnswerList(evans)
            voting1.addToQuestionList(ulubionyPianistaJazzowy)

            //            println ("voting1: " + voting1.toString())
            //            voting1.save(flush:true, failOnError:true)

            // votingAnswers
            VotingAnswer votingAnswer = new VotingAnswer(voter : voterKate)
            voterKate.setSubmitDate(votingAnswer.getSubmissionDate())

            QuestionAnswer qAnswerUlubionyPoeta = new QuestionAnswer(question: ulubionyPoeta)
            qAnswerUlubionyPoeta.addToAnswerList(mickiewicz)
            votingAnswer.addToQuestionAnswerList(qAnswerUlubionyPoeta)

            QuestionAnswer qAnswerUlubionyKompozytor = new QuestionAnswer(question: ulubionyKompozytor)
            qAnswerUlubionyKompozytor.addToAnswerList(chopin)
            qAnswerUlubionyKompozytor.addToAnswerList(szymanowski)
            votingAnswer.addToQuestionAnswerList(qAnswerUlubionyKompozytor)

            QuestionAnswer qAnswerUlubionyPianistaJazzowy = new QuestionAnswer(question: ulubionyPianistaJazzowy)
            qAnswerUlubionyPianistaJazzowy.addToAnswerList(hancock)
            qAnswerUlubionyPianistaJazzowy.addToAnswerList(jarret)
            qAnswerUlubionyPianistaJazzowy.addToAnswerList(corea)
            qAnswerUlubionyPianistaJazzowy.addToAnswerList(brubeck)
            qAnswerUlubionyPianistaJazzowy.addToAnswerList(evans)
            votingAnswer.addToQuestionAnswerList(qAnswerUlubionyPianistaJazzowy)

            voting1.addToVotingAnswerList(votingAnswer)


            println ("voting1: " + voting1.toString())
            voting1.save(flush:true, failOnError:true)


            // generated voting data

            // automatic data
            String emailDomain = "@svs.pl"
            for(int i = 1; i <= 5; i++) {
                String s = String.valueOf(i)

                Creator creator = new Creator(email: ("creator_" + s + emailDomain), token: TokenGenerator.generateToken())
                Voting  voting = new Voting(name : ("Voting_" + s),description: ("voting_" + s + "_description"),creator: creator)

                for(int j = 1; j <= 8; j++) {
                    String v = s + "_" + String.valueOf(j)
                    Voter voter = new Voter( email: ("voter_" + v + emailDomain), token: TokenGenerator.generateToken())
                    voting.addToVoterList(voter)
                }

                int qte = 1
                for(int q = 1; q <= 3; q++) {
                    QuestionTypeEnum.each {

                        int number = qte++
                        String iNumber = String.valueOf(i) + "_" + String.valueOf(number)

                        Question question = new Question(
                                        number: Integer.valueOf(number), type: it, multiplicity: Integer.valueOf(q),
                                        text: ("Pytanie numer " + iNumber))

                        for(int a = 1; a <= q + 2; a++) {
                            Answer answer = new Answer(number: Integer.valueOf(a),
                            text: ("Odpowiedź " + iNumber + "_" + String.valueOf(a)))
                            question.addToAnswerList(answer)
                        }
                        voting.addToQuestionList(question)
                    }
                }
                voting.save(flush:true, failOnError:true)
            }
        }
    }
    def destroy = {
    }
}
