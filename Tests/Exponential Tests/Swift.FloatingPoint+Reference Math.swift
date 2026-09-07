
public import Exponential
#if canImport(Darwin)
import Darwin
extension Swift.Double: Exponential.`Protocol` {
    public static func exp(_ x: Double) -> Double { Darwin.exp(x) }
    public static func expm1(_ x: Double) -> Double { Darwin.expm1(x) }
    public static func exp2(_ x: Double) -> Double { Darwin.exp2(x) }
    public static func log(_ x: Double) -> Double { Darwin.log(x) }
    public static func log1p(_ x: Double) -> Double { Darwin.log1p(x) }
    public static func log2(_ x: Double) -> Double { Darwin.log2(x) }
    public static func log10(_ x: Double) -> Double { Darwin.log10(x) }
}
extension Swift.Float: Exponential.`Protocol` {
    public static func exp(_ x: Float) -> Float { Darwin.expf(x) }
    public static func expm1(_ x: Float) -> Float { Darwin.expm1f(x) }
    public static func exp2(_ x: Float) -> Float { Darwin.exp2f(x) }
    public static func log(_ x: Float) -> Float { Darwin.logf(x) }
    public static func log1p(_ x: Float) -> Float { Darwin.log1pf(x) }
    public static func log2(_ x: Float) -> Float { Darwin.log2f(x) }
    public static func log10(_ x: Float) -> Float { Darwin.log10f(x) }
}
#elseif canImport(Glibc)
import Glibc
extension Swift.Double: Exponential.`Protocol` {
    public static func exp(_ x: Double) -> Double { Glibc.exp(x) }
    public static func expm1(_ x: Double) -> Double { Glibc.expm1(x) }
    public static func exp2(_ x: Double) -> Double { Glibc.exp2(x) }
    public static func log(_ x: Double) -> Double { Glibc.log(x) }
    public static func log1p(_ x: Double) -> Double { Glibc.log1p(x) }
    public static func log2(_ x: Double) -> Double { Glibc.log2(x) }
    public static func log10(_ x: Double) -> Double { Glibc.log10(x) }
}
extension Swift.Float: Exponential.`Protocol` {
    public static func exp(_ x: Float) -> Float { Glibc.expf(x) }
    public static func expm1(_ x: Float) -> Float { Glibc.expm1f(x) }
    public static func exp2(_ x: Float) -> Float { Glibc.exp2f(x) }
    public static func log(_ x: Float) -> Float { Glibc.logf(x) }
    public static func log1p(_ x: Float) -> Float { Glibc.log1pf(x) }
    public static func log2(_ x: Float) -> Float { Glibc.log2f(x) }
    public static func log10(_ x: Float) -> Float { Glibc.log10f(x) }
}
#else
#error("A test-only reference math backend is required on this platform")
#endif
