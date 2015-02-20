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
    Date endDate = new Date(creationDate.time).plus(7).clearTime()
    Date expirationDate = new Date(creationDate.time).plus(30).clearTime()

    static transients = ['EXP_DATE_MAX', 'END_DATE_MAX']

    List<Question> questionList = new ArrayList<Question>()
    List<Voter> voterList = new ArrayList<Voter>()
    List votingAnswerList

    //    static hasOne = [creator : Creator]

    static hasMany = [
        questionList : Question,
        voterList : Voter,
        votingAnswerList : VotingAnswer
    ]

    static constraints = {
        name(blank:false)
        description(blank:false)
        //        creator(blank:false, unique:true)
        startDate(min : new Date().clearTime(), max : new Date().clearTime().plus(EXP_DATE_MAX))
        endDate(min : new Date().clearTime(), max : new Date().clearTime().plus(END_DATE_MAX))
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder()
        builder.append(getClass().getName())
        builder.append("[")
        builder.append(System.identityHashCode(this))
        builder.append("] {\n\tcreator: ")
        builder.append(creator)
        builder.append("\n\tname: ")
        builder.append(name)
        builder.append("\n\tdescription: ")
        builder.append(description)
        builder.append("\n\tsendAnswerToVoter: ")
        builder.append(sendAnswerToVoter)
        builder.append("\n\tsendResultsToVoters: ")
        builder.append(sendResultsToVoters)
        builder.append("\n\tanonymous: ")
        builder.append(anonymous)
        builder.append("\n\tsendPartialResults: ")
        builder.append(sendPartialResults)
        builder.append("\n\tsendNotification: ")
        builder.append(sendNotification)
        builder.append("\n\tcreationDate: ")
        builder.append(creationDate)
        builder.append("\n\tstartDate: ")
        builder.append(startDate)
        builder.append("\n\tendDate: ")
        builder.append(endDate)
        builder.append("\n\texpirationDate: ")
        builder.append(expirationDate)
        builder.append("\n\tvoters: ")
        builder.append(voterList)
        builder.append("\n\tquestions: ")
        builder.append(questionList)
        return builder.toString()
    }
}
