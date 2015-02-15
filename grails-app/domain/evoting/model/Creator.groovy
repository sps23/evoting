package evoting.model

import java.util.Date

class Creator {

    //	static belongsTo = [voting : Voting]

    String email
    String token
    Date lastVisitDate
    Date submitDate

    static constraints = {
        email(blank:false,email:true)
        token(blank:false,unique:true)
        lastVisitDate(nullable:true)
        submitDate(nullable:true)
    }

    @Override
    public String toString() {
        return email + " [" + token + "]"
    }
}
