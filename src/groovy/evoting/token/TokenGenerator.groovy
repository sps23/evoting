package evoting.token

import evoting.rand.RandomGenerator;

class TokenGenerator {
	
	public static String generateToken() {
		long rand1 = RandomGenerator.getInstance().nextLong()
		long date = new Date().getTime()
		String token = rand1.toString() + date.toString();
		return token
	}

}
