package evoting.model

class Voting implements Serializable {

    static int EXP_DATE_MAX = 30
    static int END_DATE_MAX = 7



    Creator creator
    String name = "nazwa"
    String description = "opis"

    Boolean sendAnswerToVoter = Boolean.TRUE
    Boolean sendResultsToVoters = Boolean.TRUE
    Boolean anonymous = Boolean.TRUE
    Boolean sendPartialResults = Boolean.FALSE
    Boolean sendNotification = Boolean.TRUE

    Date creationDate = new Date()
    Date startDate = new Date(creationDate.time)
    Date endDate = new Date(creationDate.time).plus(7)
    Date expirationDate = new Date(creationDate.time).plus(30)


    Integer numberOfVoters = 3
    Integer numberOfQuestions = 1


    static transients = ['EXP_DATE_MAX', 'END_DATE_MAX', 'numberOfVoters', 'numberOfQuestions']

    //    static hasOne = [creator : Creator]

    static hasMany = [
        questionList : Question,
        voterList : Voter,
        votingAnswerList : VotingAnswer
    ]

    static constraints = {
        name()
        description(blank:false)
        creator(unique:true)
        startDate(min : new Date().clearTime(), max : new Date().clearTime().plus(30))
        endDate(min : new Date().clearTime(), max : new Date().clearTime().plus(7))
    }
    @Override
    public String toString() {
        return "Voting [creator=" + creator + ", name=" + name + "]"
    }

}
