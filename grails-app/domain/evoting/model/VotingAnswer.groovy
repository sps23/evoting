package evoting.model

class VotingAnswer implements Serializable {

    static belongsTo = [voting : Voting]
    static hasMany = [ questionAnswerList : QuestionAnswer]

    Date submissionDate = new Date()
    Voter voter
    List<QuestionAnswer> questionAnswerList = new ArrayList<QuestionAnswer>()

    static constraints = {
        questionAnswerList(minSize : 1)
        submissionDate()
        voter(nullable:true)
    }
    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder()
        builder.append(getClass().getName())
        builder.append("[")
        builder.append(System.identityHashCode(this))
        builder.append("] {\n\tsubmissionDate: ")
        builder.append(submissionDate)
        builder.append("\n\tvoter: ")
        builder.append(voter)
        builder.append("\n\tquestionAnswerList: ")
        builder.append(questionAnswerList)
        builder.append("\n}")
        return builder.toString()
    }
}
