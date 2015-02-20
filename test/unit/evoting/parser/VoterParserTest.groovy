
package evoting.parser

import static org.junit.Assert.*

import org.junit.Test

class VoterParserTest {

    @Test
    public void test() {
        String voterString = "aaa@tr.pl \n; bbb@tr.pl \n ;ccc@tr.pl"
        List<String> validEmails = VoterParser.parse(voterString)
        assert validEmails.size() == 3
    }
}
