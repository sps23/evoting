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
        return "q:" + question + ", a:" + answerList + "]"
    }
}
