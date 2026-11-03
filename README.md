# swift-exponential

Use this package when generic code needs exponentials or logarithms of a floating-point scalar without picking a math library: constrain on `Exponential.Protocol` and let the conforming type supply the backend. The package itself conforms no type; `Swift.Double` and `Swift.Float` conform only inside the tests, against the platform C runtime. For circular and hyperbolic functions, use the sibling package swift-trigonometry instead.

## Laws

A conformance must satisfy, as the tests check against the reference backend:

- Exact values: `exp(0) == 1`, `exp2(3) == 8`, `log(1) == 0`, `log2(8) == 3`, `log10(100) == 2`.
- Infinities: `exp(-∞) == 0`, `exp(+∞) == +∞`, `expm1(-∞) == -1`, `log(0) == -∞`, `log1p(-1) == -∞`.
- Out of domain: `log(x)` for `x < 0` and `log1p(x)` for `x < -1` return NaN; they do not trap.
- NaN in gives NaN out.
- `expm1` and `log1p` exist for arguments where `1 + x` rounds to `1`: for such tiny `x`, `expm1(x) == x` and `log1p(x) == x`, where `exp(x) - 1` and `log(1 + x)` would give `0`.
- Signed zero is preserved: `expm1(-0.0)` and `log1p(-0.0)` are `-0.0`.
