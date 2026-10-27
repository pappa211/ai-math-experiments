> Publication edition: private operational details were removed. Mathematical content is preserved. Original paths in historical prose are mapped in [the publication manifest](../reproduction/PUBLICATION_MANIFEST.md); use [current reproduction instructions](../reproduction/README.md) for executable commands.

# Explicit suffix-certificate size limit

2026-10-27, Session01. Elementary rigorous deduction, not a new Lean theorem and not an exclusion of the unresolved case.

Every decimal string of at most m positions has digit sum at most9m. Therefore an explicit suffix or selected-digit certificate showing S(N)>s by summing displayed/individually computed decimal digits must account for at least floor(s/9)+1 positions. This lower bound does not apply to a compressed symbolic proof that proves the contribution of whole blocks without expanding them.

The unresolved normalized necessary-condition survivor is u4,t35,s11235304926103517236760601181978660, with k4*10^35. It passes the recorded length/modulo9 conditions; its digit sum has not been computed and it is not a verified fixed point or a complete solution candidate. A direct suffix-excess calculation would require at least

    1248367214011501915195622353553185

positions, even if every such digit were9. Indeed9*(m-1)=11235304926103517236760601181978656<=s<9*m=11235304926103517236760601181978665. The heuristic suffix width used by the successful finite search, ceil(s/4)+32, would be2808826231525879309190150295494697 positions.

A one-byte-per-digit representation of the theoretical minimum already exceeds10^33 bytes. This rules out treating the unresolved case as an ordinary resource upgrade for the current explicit-digit method. Streaming could reduce retained memory, but not the number of digit contributions that this direct certificate must establish. A different exact argument might avoid this expansion; none has been found here. The case is left unresolved rather than launched as an infeasible calculation.

For comparison, the completed u6,t9 suffix used140,000,000 positions and peak memory below1.1GiB; the completed five-million-base-count search had peakRSS21,220KiB. The final consolidated110-module Lean run had peakRSS2,295,148KiB, within the3.7GiB host, with no swaps. Heavy work was serialized.
