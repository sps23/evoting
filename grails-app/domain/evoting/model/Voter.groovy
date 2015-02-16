package evoting.model

import org.hibernate.cfg.annotations.Nullability

class Voter implements Serializable {

    //    static belongsTo = [voting : Voting]

    String email
    String token
    Date lastVisitDate = null
    Date submitDate = null

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
