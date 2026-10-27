import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2201
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_2101 : ExponentCertificate 2101 633 632 := by decide
private theorem cert_2102 : ExponentCertificate 2102 633 632 := by decide
private theorem cert_2103 : ExponentCertificate 2103 633 632 := by decide
private theorem cert_2104 : ExponentCertificate 2104 633 633 := by decide
private theorem cert_2105 : ExponentCertificate 2105 634 633 := by decide
private theorem cert_2106 : ExponentCertificate 2106 634 633 := by decide
private theorem cert_2107 : ExponentCertificate 2107 634 633 := by decide
private theorem cert_2108 : ExponentCertificate 2108 634 634 := by decide
private theorem cert_2109 : ExponentCertificate 2109 635 634 := by decide
private theorem cert_2110 : ExponentCertificate 2110 635 634 := by decide
private theorem cert_2111 : ExponentCertificate 2111 635 634 := by decide
private theorem cert_2112 : ExponentCertificate 2112 635 635 := by decide
private theorem cert_2113 : ExponentCertificate 2113 636 635 := by decide
private theorem cert_2114 : ExponentCertificate 2114 636 635 := by decide
private theorem cert_2115 : ExponentCertificate 2115 636 636 := by decide
private theorem cert_2116 : ExponentCertificate 2116 636 636 := by decide
private theorem cert_2117 : ExponentCertificate 2117 637 636 := by decide
private theorem cert_2118 : ExponentCertificate 2118 637 636 := by decide
private theorem cert_2119 : ExponentCertificate 2119 637 637 := by decide
private theorem cert_2120 : ExponentCertificate 2120 638 637 := by decide
private theorem cert_2121 : ExponentCertificate 2121 638 637 := by decide
private theorem cert_2122 : ExponentCertificate 2122 638 637 := by decide
private theorem cert_2123 : ExponentCertificate 2123 638 638 := by decide
private theorem cert_2124 : ExponentCertificate 2124 639 638 := by decide
private theorem cert_2125 : ExponentCertificate 2125 639 638 := by decide
private theorem cert_2126 : ExponentCertificate 2126 639 638 := by decide
private theorem suffix_2127 : 639 < digitSum ((2127 : ℕ) ^ 639 % 10 ^ 160) := by
  have hmod : (2127 : ℕ) ^ 639 % 10 ^ 160 = 8133515102569421490045355898269411259065060122095297810922048110025555508508456911021235113424015984983570078439314306130509394383294792803673803448599406745263 := by
    have h1 : (2127 : ℕ) ^ 1 % 10 ^ 160 = 2127 := by decide
    have h2 : (2127 : ℕ) ^ 2 % 10 ^ 160 = 4524129 := by
      have step := pow_mod_double (k := 2127) (e := 1) (m := 10 ^ 160) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (2127 : ℕ) ^ 4 % 10 ^ 160 = 20467743208641 := by
      have step := pow_mod_double (k := 2127) (e := 2) (m := 10 ^ 160) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (2127 : ℕ) ^ 9 % 10 ^ 160 = 891060945140708017927381255887 := by
      have step := pow_mod_double_add_one (k := 2127) (e := 4) (m := 10 ^ 160) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h19 : (2127 : ℕ) ^ 19 % 10 ^ 160 = 1688815896120395314444465184327655344194006596970024514577447663 := by
      have step := pow_mod_double_add_one (k := 2127) (e := 9) (m := 10 ^ 160) h9
      have he : 2 * 9 + 1 = 19 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h39 : (2127 : ℕ) ^ 39 % 10 ^ 160 = 6066414851613462315306539510533647096116529673635076562229328308664528008998344645074172294313415697760044014561433090681351657263 := by
      have step := pow_mod_double_add_one (k := 2127) (e := 19) (m := 10 ^ 160) h19
      have he : 2 * 19 + 1 = 39 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h79 : (2127 : ℕ) ^ 79 % 10 ^ 160 = 6589990207935902437813933410636960538398301412203357122379417002818693083022367444254301288622095418820932808380925331364064163598229229516688956842892125036463 := by
      have step := pow_mod_double_add_one (k := 2127) (e := 39) (m := 10 ^ 160) h39
      have he : 2 * 39 + 1 = 79 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h159 : (2127 : ℕ) ^ 159 % 10 ^ 160 = 1687287066141216829607193395205957875593848557028570352512766364635897742117463331691270854876608784034978827544357329306494588322733299050705779984012203634863 := by
      have step := pow_mod_double_add_one (k := 2127) (e := 79) (m := 10 ^ 160) h79
      have he : 2 * 79 + 1 = 159 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h319 : (2127 : ℕ) ^ 319 % 10 ^ 160 = 2023277122529191905514036763312704755110181297229801864957533726804869457885919679351306113440211424709806426383376147635050484916326773277595597898275544191663 := by
      have step := pow_mod_double_add_one (k := 2127) (e := 159) (m := 10 ^ 160) h159
      have he : 2 * 159 + 1 = 319 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h639 : (2127 : ℕ) ^ 639 % 10 ^ 160 = 8133515102569421490045355898269411259065060122095297810922048110025555508508456911021235113424015984983570078439314306130509394383294792803673803448599406745263 := by
      have step := pow_mod_double_add_one (k := 2127) (e := 319) (m := 10 ^ 160) h319
      have he : 2 * 319 + 1 = 639 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h639
  rw [hmod]
  decide
private theorem cert_2127 : ExponentCertificate 2127 639 639 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2127) (by decide) (by decide) (by decide) suffix_2127
private theorem cert_2128 : ExponentCertificate 2128 640 639 := by decide
private theorem cert_2129 : ExponentCertificate 2129 640 639 := by decide
private theorem cert_2130 : ExponentCertificate 2130 640 639 := by decide
private theorem cert_2131 : ExponentCertificate 2131 640 640 := by decide
private theorem cert_2132 : ExponentCertificate 2132 641 640 := by decide
private theorem cert_2133 : ExponentCertificate 2133 641 640 := by decide
private theorem cert_2134 : ExponentCertificate 2134 641 640 := by decide
private theorem cert_2135 : ExponentCertificate 2135 641 641 := by decide
private theorem cert_2136 : ExponentCertificate 2136 642 641 := by decide
private theorem cert_2137 : ExponentCertificate 2137 642 641 := by decide
private theorem cert_2138 : ExponentCertificate 2138 642 642 := by decide
private theorem cert_2139 : ExponentCertificate 2139 643 642 := by decide
private theorem cert_2140 : ExponentCertificate 2140 643 642 := by decide
private theorem cert_2141 : ExponentCertificate 2141 643 642 := by decide
private theorem cert_2142 : ExponentCertificate 2142 643 643 := by decide
private theorem cert_2143 : ExponentCertificate 2143 644 643 := by decide
private theorem cert_2144 : ExponentCertificate 2144 644 643 := by decide
private theorem cert_2145 : ExponentCertificate 2145 644 643 := by decide
private theorem cert_2146 : ExponentCertificate 2146 644 644 := by decide
private theorem cert_2147 : ExponentCertificate 2147 645 644 := by decide
private theorem cert_2148 : ExponentCertificate 2148 645 644 := by decide
private theorem cert_2149 : ExponentCertificate 2149 645 644 := by decide
private theorem cert_2150 : ExponentCertificate 2150 645 645 := by decide
private theorem cert_2151 : ExponentCertificate 2151 646 645 := by decide
private theorem cert_2152 : ExponentCertificate 2152 646 645 := by decide
private theorem cert_2153 : ExponentCertificate 2153 646 645 := by decide
private theorem cert_2154 : ExponentCertificate 2154 646 646 := by decide
private theorem cert_2155 : ExponentCertificate 2155 647 646 := by decide
private theorem cert_2156 : ExponentCertificate 2156 647 646 := by decide
private theorem cert_2157 : ExponentCertificate 2157 647 646 := by decide
private theorem cert_2158 : ExponentCertificate 2158 647 647 := by decide
private theorem cert_2159 : ExponentCertificate 2159 648 647 := by decide
private theorem cert_2160 : ExponentCertificate 2160 648 647 := by decide
private theorem cert_2161 : ExponentCertificate 2161 648 648 := by decide
private theorem cert_2162 : ExponentCertificate 2162 649 648 := by decide
private theorem cert_2163 : ExponentCertificate 2163 649 648 := by decide
private theorem cert_2164 : ExponentCertificate 2164 649 648 := by decide
private theorem cert_2165 : ExponentCertificate 2165 649 649 := by decide
private theorem cert_2166 : ExponentCertificate 2166 650 649 := by decide
private theorem cert_2167 : ExponentCertificate 2167 650 649 := by decide
private theorem cert_2168 : ExponentCertificate 2168 650 649 := by decide
private theorem cert_2169 : ExponentCertificate 2169 650 650 := by decide
private theorem cert_2170 : ExponentCertificate 2170 651 650 := by decide
private theorem cert_2171 : ExponentCertificate 2171 651 650 := by decide
private theorem cert_2172 : ExponentCertificate 2172 651 650 := by decide
private theorem cert_2173 : ExponentCertificate 2173 651 651 := by decide
private theorem cert_2174 : ExponentCertificate 2174 652 651 := by decide
private theorem cert_2175 : ExponentCertificate 2175 652 651 := by decide
private theorem cert_2176 : ExponentCertificate 2176 652 651 := by decide
private theorem cert_2177 : ExponentCertificate 2177 652 652 := by decide
private theorem cert_2178 : ExponentCertificate 2178 653 652 := by decide
private theorem cert_2179 : ExponentCertificate 2179 653 652 := by decide
private theorem cert_2180 : ExponentCertificate 2180 653 652 := by decide
private theorem cert_2181 : ExponentCertificate 2181 653 653 := by decide
private theorem cert_2182 : ExponentCertificate 2182 654 653 := by decide
private theorem cert_2183 : ExponentCertificate 2183 654 653 := by decide
private theorem cert_2184 : ExponentCertificate 2184 654 654 := by decide
private theorem cert_2185 : ExponentCertificate 2185 654 654 := by decide
private theorem cert_2186 : ExponentCertificate 2186 655 654 := by decide
private theorem cert_2187 : ExponentCertificate 2187 655 654 := by decide
private theorem cert_2188 : ExponentCertificate 2188 655 655 := by decide
private theorem cert_2189 : ExponentCertificate 2189 656 655 := by decide
private theorem cert_2190 : ExponentCertificate 2190 656 655 := by decide
private theorem cert_2191 : ExponentCertificate 2191 656 655 := by decide
private theorem cert_2192 : ExponentCertificate 2192 656 656 := by decide
private theorem cert_2193 : ExponentCertificate 2193 657 656 := by decide
private theorem cert_2194 : ExponentCertificate 2194 657 656 := by decide
private theorem cert_2195 : ExponentCertificate 2195 657 656 := by decide
private theorem suffix_2196 : 657 < digitSum ((2196 : ℕ) ^ 657 % 10 ^ 165) := by
  have hmod : (2196 : ℕ) ^ 657 % 10 ^ 165 = 670412585815836486498153893879307750252453670286865203455475765450330693807176397088986370480670660734244434392428986285365957209945501588246974419840555719396950016 := by
    have h1 : (2196 : ℕ) ^ 1 % 10 ^ 165 = 2196 := by decide
    have h2 : (2196 : ℕ) ^ 2 % 10 ^ 165 = 4822416 := by
      have step := pow_mod_double (k := 2196) (e := 1) (m := 10 ^ 165) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2196 : ℕ) ^ 5 % 10 ^ 165 = 51069508585214976 := by
      have step := pow_mod_double_add_one (k := 2196) (e := 2) (m := 10 ^ 165) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (2196 : ℕ) ^ 10 % 10 ^ 165 = 2608094707135346139580184134680576 := by
      have step := pow_mod_double (k := 2196) (e := 5) (m := 10 ^ 165) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h20 : (2196 : ℕ) ^ 20 % 10 ^ 165 = 6802158001387406949522241464990829489035221549927176750825551691776 := by
      have step := pow_mod_double (k := 2196) (e := 10) (m := 10 ^ 165) h10
      have he : 2 * 10 = 20 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h41 : (2196 : ℕ) ^ 41 % 10 ^ 165 = 101607500232941834750152057835719261312479111136328870931143326474026170758907007953444780674238758456796284331044400176300097690451050496 := by
      have step := pow_mod_double_add_one (k := 2196) (e := 20) (m := 10 ^ 165) h20
      have he : 2 * 20 + 1 = 41 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h82 : (2196 : ℕ) ^ 82 % 10 ^ 165 = 960505615509531620868316633259280340442996113283202739291936099725741831138233282574086028394734590847148418708045128193012387773545655298628629116049355029941846016 := by
      have step := pow_mod_double (k := 2196) (e := 41) (m := 10 ^ 165) h41
      have he : 2 * 41 = 82 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h164 : (2196 : ℕ) ^ 164 % 10 ^ 165 = 247674871436542679595820128678465043088572984147662812362126635077613319512929403551420782592226617730795926021081263127980752030748613839872964228753502845855072256 := by
      have step := pow_mod_double (k := 2196) (e := 82) (m := 10 ^ 165) h82
      have he : 2 * 82 = 164 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h328 : (2196 : ℕ) ^ 328 % 10 ^ 165 = 933564055543145138716009588634387397589304669122366653108500090367487530526368727418445225189927343573870419770989021870686539163196220410398209516884285202980929536 := by
      have step := pow_mod_double (k := 2196) (e := 164) (m := 10 ^ 165) h164
      have he : 2 * 164 = 328 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h657 : (2196 : ℕ) ^ 657 % 10 ^ 165 = 670412585815836486498153893879307750252453670286865203455475765450330693807176397088986370480670660734244434392428986285365957209945501588246974419840555719396950016 := by
      have step := pow_mod_double_add_one (k := 2196) (e := 328) (m := 10 ^ 165) h328
      have he : 2 * 328 + 1 = 657 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h657
  rw [hmod]
  decide
private theorem cert_2196 : ExponentCertificate 2196 657 657 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2196) (by decide) (by decide) (by decide) suffix_2196
private theorem cert_2197 : ExponentCertificate 2197 658 657 := by decide
private theorem cert_2198 : ExponentCertificate 2198 658 657 := by decide
private theorem cert_2199 : ExponentCertificate 2199 658 657 := by decide
private theorem cert_2200 : ExponentCertificate 2200 658 658 := by decide

private theorem certificates_2101_2200 {k : ℕ} (hlo : 2101 ≤ k) (hhi : k ≤ 2200) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨633, 632, cert_2101⟩
  · exact ⟨633, 632, cert_2102⟩
  · exact ⟨633, 632, cert_2103⟩
  · exact ⟨633, 633, cert_2104⟩
  · exact ⟨634, 633, cert_2105⟩
  · exact ⟨634, 633, cert_2106⟩
  · exact ⟨634, 633, cert_2107⟩
  · exact ⟨634, 634, cert_2108⟩
  · exact ⟨635, 634, cert_2109⟩
  · exact ⟨635, 634, cert_2110⟩
  · exact ⟨635, 634, cert_2111⟩
  · exact ⟨635, 635, cert_2112⟩
  · exact ⟨636, 635, cert_2113⟩
  · exact ⟨636, 635, cert_2114⟩
  · exact ⟨636, 636, cert_2115⟩
  · exact ⟨636, 636, cert_2116⟩
  · exact ⟨637, 636, cert_2117⟩
  · exact ⟨637, 636, cert_2118⟩
  · exact ⟨637, 637, cert_2119⟩
  · exact ⟨638, 637, cert_2120⟩
  · exact ⟨638, 637, cert_2121⟩
  · exact ⟨638, 637, cert_2122⟩
  · exact ⟨638, 638, cert_2123⟩
  · exact ⟨639, 638, cert_2124⟩
  · exact ⟨639, 638, cert_2125⟩
  · exact ⟨639, 638, cert_2126⟩
  · exact ⟨639, 639, cert_2127⟩
  · exact ⟨640, 639, cert_2128⟩
  · exact ⟨640, 639, cert_2129⟩
  · exact ⟨640, 639, cert_2130⟩
  · exact ⟨640, 640, cert_2131⟩
  · exact ⟨641, 640, cert_2132⟩
  · exact ⟨641, 640, cert_2133⟩
  · exact ⟨641, 640, cert_2134⟩
  · exact ⟨641, 641, cert_2135⟩
  · exact ⟨642, 641, cert_2136⟩
  · exact ⟨642, 641, cert_2137⟩
  · exact ⟨642, 642, cert_2138⟩
  · exact ⟨643, 642, cert_2139⟩
  · exact ⟨643, 642, cert_2140⟩
  · exact ⟨643, 642, cert_2141⟩
  · exact ⟨643, 643, cert_2142⟩
  · exact ⟨644, 643, cert_2143⟩
  · exact ⟨644, 643, cert_2144⟩
  · exact ⟨644, 643, cert_2145⟩
  · exact ⟨644, 644, cert_2146⟩
  · exact ⟨645, 644, cert_2147⟩
  · exact ⟨645, 644, cert_2148⟩
  · exact ⟨645, 644, cert_2149⟩
  · exact ⟨645, 645, cert_2150⟩
  · exact ⟨646, 645, cert_2151⟩
  · exact ⟨646, 645, cert_2152⟩
  · exact ⟨646, 645, cert_2153⟩
  · exact ⟨646, 646, cert_2154⟩
  · exact ⟨647, 646, cert_2155⟩
  · exact ⟨647, 646, cert_2156⟩
  · exact ⟨647, 646, cert_2157⟩
  · exact ⟨647, 647, cert_2158⟩
  · exact ⟨648, 647, cert_2159⟩
  · exact ⟨648, 647, cert_2160⟩
  · exact ⟨648, 648, cert_2161⟩
  · exact ⟨649, 648, cert_2162⟩
  · exact ⟨649, 648, cert_2163⟩
  · exact ⟨649, 648, cert_2164⟩
  · exact ⟨649, 649, cert_2165⟩
  · exact ⟨650, 649, cert_2166⟩
  · exact ⟨650, 649, cert_2167⟩
  · exact ⟨650, 649, cert_2168⟩
  · exact ⟨650, 650, cert_2169⟩
  · exact ⟨651, 650, cert_2170⟩
  · exact ⟨651, 650, cert_2171⟩
  · exact ⟨651, 650, cert_2172⟩
  · exact ⟨651, 651, cert_2173⟩
  · exact ⟨652, 651, cert_2174⟩
  · exact ⟨652, 651, cert_2175⟩
  · exact ⟨652, 651, cert_2176⟩
  · exact ⟨652, 652, cert_2177⟩
  · exact ⟨653, 652, cert_2178⟩
  · exact ⟨653, 652, cert_2179⟩
  · exact ⟨653, 652, cert_2180⟩
  · exact ⟨653, 653, cert_2181⟩
  · exact ⟨654, 653, cert_2182⟩
  · exact ⟨654, 653, cert_2183⟩
  · exact ⟨654, 654, cert_2184⟩
  · exact ⟨654, 654, cert_2185⟩
  · exact ⟨655, 654, cert_2186⟩
  · exact ⟨655, 654, cert_2187⟩
  · exact ⟨655, 655, cert_2188⟩
  · exact ⟨656, 655, cert_2189⟩
  · exact ⟨656, 655, cert_2190⟩
  · exact ⟨656, 655, cert_2191⟩
  · exact ⟨656, 656, cert_2192⟩
  · exact ⟨657, 656, cert_2193⟩
  · exact ⟨657, 656, cert_2194⟩
  · exact ⟨657, 656, cert_2195⟩
  · exact ⟨657, 657, cert_2196⟩
  · exact ⟨658, 657, cert_2197⟩
  · exact ⟨658, 657, cert_2198⟩
  · exact ⟨658, 657, cert_2199⟩
  · exact ⟨658, 658, cert_2200⟩

theorem no_fixed_digitCount_2101_2200 {n : ℕ} (hn : a n = n)
    (hlo : 2101 ≤ digitCount n) (hhi : digitCount n ≤ 2200) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_2101_2200 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_2101_2200
end OeisA113010
