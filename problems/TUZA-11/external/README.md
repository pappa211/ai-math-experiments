# External theorem editions and acquisition

Yiming Liu, *Generalized Tuza's Conjecture for Pair-Packing Number Four*,
v1.0.2, dated 6 October 2026: [version record](https://zenodo.org/records/23177679),
[version DOI](https://doi.org/10.5281/zenodo.23177679).
The concept DOI 10.5281/zenodo.23139224 is not the version pin.
The accepted input requires the [auditor-documented Table 1 class 9 correction](CLASS9_TABLE_ERRATUM.md)
378 to 389; no author endorsement of the correction is claimed.

Download the exact named files from that version record and check SHA-256:

| File | SHA-256 |
|---|---|
| manuscript.pdf | `8303403632de6c70da3bfb793076a361d299d9abd88eef47cf065cb255edc4df` |
| tuza_four_certificate.zip | `e6b05bdbe965fe3b13c9a74c108ecbbe5dac3f9cd41ab93ddb8085ba3b1632ce` |
| complete-source-and-reproduction.zip | `1457d32fbfce5fccd645fc548d51006f539c7c588c7a6ce6cf5e6ae4ede2a6fe` |

For example, with an existing curl executable, in a new scratch directory:

```sh
curl --fail --location --output complete-source-and-reproduction.zip 'https://zenodo.org/records/23177679/files/complete-source-and-reproduction.zip?download=1'
python3 -c 'import hashlib; print(hashlib.sha256(open("complete-source-and-reproduction.zip","rb").read()).hexdigest())'
```

Quote the URL in shells that treat `?` as a pattern. The release's own README,
licenses and reproduction instructions govern the external replay. This
publication reuses the historical project replay of ten cases and 154,874 RUP
additions; it does not claim a fresh external-certificate replay.
The manuscript/documentation and original certificate data are CC BY 4.0;
original executable code is Apache-2.0, copyright 2026 Yiming Liu. No full
third-party manuscript, certificate ZIP or executable dependency is redistributed
here. Preserve those licenses if acquiring or redistributing the release.

Other precise theorem inputs: [HKT flat theorem, dated author manuscript](https://perso.ens-lyon.fr/stephan.thomasse/liste/packplanar.pdf),
Theorem 2 and equality proof, and [Parker arXiv:2406.06501v3](https://arxiv.org/abs/2406.06501v3),
Corollary 1.3. Full statements and their uses appear in the gluing proof.
