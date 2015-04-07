package evoting.model

public class Question implements Serializable {

    static hasMany = [ answerList : Answer]

    static belongsTo = [voting : Voting]

    Integer number
    QuestionTypeEnum type
    String text
    Integer multiplicity
    List<Answer> answerList = new ArrayList<Answer>()
    String answerString

    static transients = ["answerString"]

    static constraints = {
        number(min:1, max:10)
        type(nullable:false)
        text(blank:false, size: 1..255)
        multiplicity(nullable:true)
        answerList(minSize:2)
        answerString(bindable:true,size: 1..1000)
    }

    @Override
    public String toString() {
        return "Question [number=" + number + ", type=" + type + ", text=" + text + ", multiplicity=" + multiplicity
        + ", answerList=" + answerList + ", answerString=" + answerString + "]"
    }
}
