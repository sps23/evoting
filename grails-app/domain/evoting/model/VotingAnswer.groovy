package evoting.model

class VotingAnswer implements Serializable {

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
        return submissionDate + ", [" + voter + "] qa:" + questionAnswerList
    }
}
