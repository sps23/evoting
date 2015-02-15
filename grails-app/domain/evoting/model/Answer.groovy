package evoting.model

class Answer {

    static belongsTo = [ question : Question ]

    Integer number
    String text
    Question question

    static constraints = {
        number(min:1, max:10)
        text(blank:false, size: 1..255)
    }

    @Override
    public String toString() {
        return "#" + number + ". " + text
    }
}
