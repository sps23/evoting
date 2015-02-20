package evoting.parser

import evoting.model.Answer

class AnswerParser {

    public static List<Answer> parse(String answerString) {
        String[] answerSplit = answerString?.split("\\n")
        if(answerSplit != null) {
            int number = 1
            List<Answer> answerList = new ArrayList<Answer>()
            for(answerText in answerSplit) {
                answerList.add(new Answer(number: number++, text: answerText.trim()))
            }
            return answerList
        }
        return null
    }
}
