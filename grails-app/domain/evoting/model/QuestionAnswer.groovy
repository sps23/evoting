package evoting.model

import java.util.List

class QuestionAnswer implements Serializable {

    static hasMany = [ answerList : Answer ]
    static belongsTo = [ votingAnswer : VotingAnswer ]

    Question question
    List<Answer> answerList = new ArrayList<Answer>()

    static constraints = { answerList(minSize : 1) }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder()
        builder.append(getClass().getName())
        builder.append("[")
        builder.append(System.identityHashCode(this))
        builder.append("] {\n\tquestion: ")
        builder.append(question)
        builder.append("\n\tanswerList: ")
        builder.append(answerList)
        builder.append("\n}")
        return builder.toString()
    }
}
