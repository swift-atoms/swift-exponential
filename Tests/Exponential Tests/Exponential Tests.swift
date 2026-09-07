import Exponential
import Testing

@Suite struct `Reference exponentials obey the scalar contract` {
    @Test func `Exponentials and logarithms agree at exact reference values`() {
        #expect(Double.exp(0) == 1 && Double.exp2(3) == 8)
        #expect(Double.log(1) == 0 && Double.log2(8) == 3 && Double.log10(100) == 2)
        #expect(Double.exp(-.infinity) == 0 && Double.exp(.infinity) == .infinity)
        #expect(Double.log(0) == -.infinity && Double.log(-1).isNaN)
        #expect(Double.exp(.nan).isNaN && Double.log(.nan).isNaN)
    }

    @Test func `Cancellation sensitive operations retain tiny values and signed zero`() {
        let tiny = 0x1p-60
        #expect(1 + tiny == 1)
        #expect(Double.expm1(tiny) == tiny && Double.log1p(tiny) == tiny)
        #expect(Double.expm1(-0.0).sign == .minus && Double.log1p(-0.0).sign == .minus)
        #expect(Double.log1p(-1) == -.infinity && Double.log1p(-2).isNaN)
        #expect(Double.expm1(-.infinity) == -1)
    }
}
