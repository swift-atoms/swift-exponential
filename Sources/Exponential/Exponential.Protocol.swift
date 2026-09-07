extension Exponential {
    public protocol `Protocol`: FloatingPoint {
        static func exp(_ x: Self) -> Self
        static func expm1(_ x: Self) -> Self
        static func exp2(_ x: Self) -> Self
        static func log(_ x: Self) -> Self
        static func log1p(_ x: Self) -> Self
        static func log2(_ x: Self) -> Self
        static func log10(_ x: Self) -> Self
    }
}
