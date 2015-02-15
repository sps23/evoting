package evoting.rand

class RandomGenerator {

	private static final INSTANCE = new Random()

	public static Random getInstance() {
		return INSTANCE
	}

	private RandomGenerator() {}

	def display() {
		println "RandomGenerator:${hashCode()}"
	}
}
