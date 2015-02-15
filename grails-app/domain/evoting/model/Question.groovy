package evoting.model

class Question {

    static hasMany = [ answerList : Answer]

    Integer number
    QuestionTypeEnum type
    String text
    Integer multiplicity
    Integer orderedMultiplicity
    List<Answer> answerList = new ArrayList<Answer>()

    enum QuestionTypeEnum {
        SINGLE,
        MULTIPLE,
        ORDERED
    }


    static constraints = {
        number(min:1, max:10)
        type(nullable:false)
        text(blank:false, size: 1..255)
        multiplicity(nullable:true)
        orderedMultiplicity(nullable:true)
        answerList(minSize:2)
    }


    @Override
    public String toString() {
        return "#" + number + ". [" + type + "] " + text
    }
}
