package evoting.token

import evoting.rand.RandomGenerator

class TokenGenerator {

    public static String generateToken() {
        long rand1 = RandomGenerator.getInstance().nextLong()
        if(rand1 < 0) {
            rand1 *= -1
        }
        long date = new Date().getTime()
        String token = rand1.toString() + date.toString()
        return token
    }
}
