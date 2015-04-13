package evoting.model

class Answer implements Serializable {

    static belongsTo = [ question : Question ]

    Integer number
    String text

    static constraints = {
        number(min:1, max:10)
        text(blank:false, size: 1..255)
    }

    @Override
    public String toString() {
        return number + ". " + text
    }
}
