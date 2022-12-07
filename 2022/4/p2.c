#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#if defined(__AVX2__) && defined(__GNUC__)
    #include <immintrin.h>
    #define uint128x2_t __m256i
    #define uint128_t unsigned __int128
#else
    #error "AVX2 intrinsics not enabled."
#endif

int main(void) {
    FILE *f = fopen("input.txt", "r");

    int p, q, s = 0;
    uint8_t x, y, z, w;
    uint128_t a, b;
    register uint128x2_t v, t;
    while (fscanf(f, "%hhu-%hhu,%hhu-%hhu", &x, &y, &z, &w) == 4) {
        a = ~(a ^ a);
        b = ~(b ^ b);
        a = (a >> (x-1)) & ~(a >> y);
        b = (b >> (z-1)) & ~(b >> w);
        v = _mm256_set_m128i(
            _mm_lddqu_si128((__m128i *)&a),
            _mm_lddqu_si128((__m128i *)&b)
        );
        t = _mm256_and_si256(v, _mm256_permute2x128_si256(v, v, 1));
        p = _mm_testz_si128(
            _mm256_extracti128_si256(t, 0),
            _mm256_extracti128_si256(t, 0)
        );
        q = _mm_testz_si128(
            _mm256_extracti128_si256(t, 1),
            _mm256_extracti128_si256(t, 1)
        );
        s += (1 - p) | (1 - q);
    }

    printf("%d\n", s);
    return 0;
}
