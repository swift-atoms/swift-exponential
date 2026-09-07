# Exponential

Exponential defines numerical contracts for real exponentials and their logarithmic inverses. `Exponential.Protocol` requires natural and base-two exponentials, natural/base-two/base-ten logarithms, and cancellation-sensitive expm1 and log1p operations. expm1(x) approximates exp(x)-1 without first rounding exp(x) near one; log1p(x) approximates log(1+x) without first rounding 1+x near one.

Exponentials accept every real value: zero maps to one, negative infinity to positive zero, and positive infinity to positive infinity. expm1 preserves signed zero and maps negative infinity to -1. Logarithms have positive real domain, return negative infinity at either signed zero, positive infinity at positive infinity, and NaN for negative inputs. log1p preserves signed zero, returns negative infinity at -1, and NaN below -1. NaN inputs propagate NaN.

A backend must document accuracy, supported rounding environments, and platform differences. These protocols do not promise universal correct rounding, floating-point exception flags, or a particular NaN payload. Floating overflow and underflow follow the destination representation. Exact symbolic expressions, arbitrary-precision rational roots, and general real power evaluation are separate responsibilities.

Core and Foundation Integration contain no platform math implementation. The higher Numeric compatibility package supplies its existing platform implementations. SDK-backed conformances in this package's test target are reference fixtures only; they are not shipped in the core or Test Support products.
