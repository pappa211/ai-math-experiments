import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2301
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_2201 : ExponentCertificate 2201 659 658 := by decide
private theorem cert_2202 : ExponentCertificate 2202 659 658 := by decide
private theorem cert_2203 : ExponentCertificate 2203 659 658 := by decide
private theorem cert_2204 : ExponentCertificate 2204 659 659 := by decide
private theorem cert_2205 : ExponentCertificate 2205 660 659 := by decide
private theorem cert_2206 : ExponentCertificate 2206 660 659 := by decide
private theorem cert_2207 : ExponentCertificate 2207 660 660 := by decide
private theorem cert_2208 : ExponentCertificate 2208 660 660 := by decide
private theorem cert_2209 : ExponentCertificate 2209 661 660 := by decide
private theorem cert_2210 : ExponentCertificate 2210 661 660 := by decide
private theorem cert_2211 : ExponentCertificate 2211 661 661 := by decide
private theorem cert_2212 : ExponentCertificate 2212 662 661 := by decide
private theorem cert_2213 : ExponentCertificate 2213 662 661 := by decide
private theorem cert_2214 : ExponentCertificate 2214 662 661 := by decide
private theorem cert_2215 : ExponentCertificate 2215 662 662 := by decide
private theorem cert_2216 : ExponentCertificate 2216 663 662 := by decide
private theorem cert_2217 : ExponentCertificate 2217 663 662 := by decide
private theorem cert_2218 : ExponentCertificate 2218 663 662 := by decide
private theorem cert_2219 : ExponentCertificate 2219 663 663 := by decide
private theorem cert_2220 : ExponentCertificate 2220 664 663 := by decide
private theorem cert_2221 : ExponentCertificate 2221 664 663 := by decide
private theorem cert_2222 : ExponentCertificate 2222 664 663 := by decide
private theorem cert_2223 : ExponentCertificate 2223 664 664 := by decide
private theorem cert_2224 : ExponentCertificate 2224 665 664 := by decide
private theorem cert_2225 : ExponentCertificate 2225 665 664 := by decide
private theorem cert_2226 : ExponentCertificate 2226 665 664 := by decide
private theorem cert_2227 : ExponentCertificate 2227 665 665 := by decide
private theorem cert_2228 : ExponentCertificate 2228 666 665 := by decide
private theorem cert_2229 : ExponentCertificate 2229 666 665 := by decide
private theorem cert_2230 : ExponentCertificate 2230 666 666 := by decide
private theorem cert_2231 : ExponentCertificate 2231 666 666 := by decide
private theorem cert_2232 : ExponentCertificate 2232 667 666 := by decide
private theorem cert_2233 : ExponentCertificate 2233 667 666 := by decide
private theorem cert_2234 : ExponentCertificate 2234 667 667 := by decide
private theorem cert_2235 : ExponentCertificate 2235 668 667 := by decide
private theorem cert_2236 : ExponentCertificate 2236 668 667 := by decide
private theorem cert_2237 : ExponentCertificate 2237 668 667 := by decide
private theorem cert_2238 : ExponentCertificate 2238 668 668 := by decide
private theorem cert_2239 : ExponentCertificate 2239 669 668 := by decide
private theorem cert_2240 : ExponentCertificate 2240 669 668 := by decide
private theorem cert_2241 : ExponentCertificate 2241 669 668 := by decide
private theorem cert_2242 : ExponentCertificate 2242 669 669 := by decide
private theorem cert_2243 : ExponentCertificate 2243 670 669 := by decide
private theorem cert_2244 : ExponentCertificate 2244 670 669 := by decide
private theorem cert_2245 : ExponentCertificate 2245 670 669 := by decide
private theorem suffix_2246 : 670 < digitSum ((2246 : ℕ) ^ 670 % 10 ^ 168) := by
  have hmod : (2246 : ℕ) ^ 670 % 10 ^ 168 = 215572852691983281152059793909041922203275549665735697780734883342522223443545410325202017522187386104564065064537286977720019866317471595489666259795347555291313995776 := by
    have h1 : (2246 : ℕ) ^ 1 % 10 ^ 168 = 2246 := by decide
    have h2 : (2246 : ℕ) ^ 2 % 10 ^ 168 = 5044516 := by
      have step := pow_mod_double (k := 2246) (e := 1) (m := 10 ^ 168) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2246 : ℕ) ^ 5 % 10 ^ 168 = 57154280200378976 := by
      have step := pow_mod_double_add_one (k := 2246) (e := 2) (m := 10 ^ 168) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (2246 : ℕ) ^ 10 % 10 ^ 168 = 3266611745223432240986294022808576 := by
      have step := pow_mod_double (k := 2246) (e := 5) (m := 10 ^ 168) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h20 : (2246 : ℕ) ^ 20 % 10 ^ 168 = 10670752294031677790284918844171741863252478353208403834919139147776 := by
      have step := pow_mod_double (k := 2246) (e := 10) (m := 10 ^ 168) h10
      have he : 2 * 10 = 20 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h41 : (2246 : ℕ) ^ 41 % 10 ^ 168 = 255740687853227877564513859647326513114504305835797480359338371184128141603225890282902870154158718313324838491819075763643011456665911296 := by
      have step := pow_mod_double_add_one (k := 2246) (e := 20) (m := 10 ^ 168) h20
      have he : 2 * 20 + 1 = 41 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h83 : (2246 : ℕ) ^ 83 % 10 ^ 168 = 267663517992513472942214050608373469764359401995620195113792499659631856760796653986011817271197106417098547195004167438370193898475390409566466717767030356591337537536 := by
      have step := pow_mod_double_add_one (k := 2246) (e := 41) (m := 10 ^ 168) h41
      have he : 2 * 41 + 1 = 83 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h167 : (2246 : ℕ) ^ 167 % 10 ^ 168 = 783241977179707213614032625905168141628590889783734840145858610948321938177637783588730881011440330699876343511308965483877160334076033659702191232748219340909304610816 := by
      have step := pow_mod_double_add_one (k := 2246) (e := 83) (m := 10 ^ 168) h83
      have he : 2 * 83 + 1 = 167 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h335 : (2246 : ℕ) ^ 335 % 10 ^ 168 = 169427207597643284100546407108123662561611103031501392611854604176602463492358003894438672724448568727970950432751978310231582587401578098619409135211242758805521432576 := by
      have step := pow_mod_double_add_one (k := 2246) (e := 167) (m := 10 ^ 168) h167
      have he : 2 * 167 + 1 = 335 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h670 : (2246 : ℕ) ^ 670 % 10 ^ 168 = 215572852691983281152059793909041922203275549665735697780734883342522223443545410325202017522187386104564065064537286977720019866317471595489666259795347555291313995776 := by
      have step := pow_mod_double (k := 2246) (e := 335) (m := 10 ^ 168) h335
      have he : 2 * 335 = 670 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h670
  rw [hmod]
  decide
private theorem cert_2246 : ExponentCertificate 2246 670 670 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2246) (by decide) (by decide) (by decide) suffix_2246
private theorem cert_2247 : ExponentCertificate 2247 671 670 := by decide
private theorem cert_2248 : ExponentCertificate 2248 671 670 := by decide
private theorem cert_2249 : ExponentCertificate 2249 671 670 := by decide
private theorem cert_2250 : ExponentCertificate 2250 671 671 := by decide
private theorem cert_2251 : ExponentCertificate 2251 672 671 := by decide
private theorem cert_2252 : ExponentCertificate 2252 672 671 := by decide
private theorem cert_2253 : ExponentCertificate 2253 672 671 := by decide
private theorem cert_2254 : ExponentCertificate 2254 672 672 := by decide
private theorem cert_2255 : ExponentCertificate 2255 673 672 := by decide
private theorem cert_2256 : ExponentCertificate 2256 673 672 := by decide
private theorem suffix_2257 : 673 < digitSum ((2257 : ℕ) ^ 673 % 10 ^ 169) := by
  have hmod : (2257 : ℕ) ^ 673 % 10 ^ 169 = 4428429072866523599939422068483411403731121242421341428419133021426287320983184312323219181541319179815505192965568168107509402448891145467131831403899465666235625896657 := by
    have h1 : (2257 : ℕ) ^ 1 % 10 ^ 169 = 2257 := by decide
    have h2 : (2257 : ℕ) ^ 2 % 10 ^ 169 = 5094049 := by
      have step := pow_mod_double (k := 2257) (e := 1) (m := 10 ^ 169) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2257 : ℕ) ^ 5 % 10 ^ 169 = 58567649578903057 := by
      have step := pow_mod_double_add_one (k := 2257) (e := 2) (m := 10 ^ 169) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (2257 : ℕ) ^ 10 % 10 ^ 169 = 3430169577197183429934735403945249 := by
      have step := pow_mod_double (k := 2257) (e := 5) (m := 10 ^ 169) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (2257 : ℕ) ^ 21 % 10 ^ 169 = 26556004932038788030302946223881450081080909361472066403275486089706257 := by
      have step := pow_mod_double_add_one (k := 2257) (e := 10) (m := 10 ^ 169) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h42 : (2257 : ℕ) ^ 42 % 10 ^ 169 = 705221397950468434872056715262347911347525235007535299536140702559862144113151241399721448736706551459780131727107782722788785879016544950049 := by
      have step := pow_mod_double (k := 2257) (e := 21) (m := 10 ^ 169) h21
      have he : 2 * 21 = 42 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h84 : (2257 : ℕ) ^ 84 % 10 ^ 169 = 6534429246369933353606059614074538088522891688800189677657364657783911709365066961925590846905271740362852707369115698712950952745025167685173993691096851514123905102401 := by
      have step := pow_mod_double (k := 2257) (e := 42) (m := 10 ^ 169) h42
      have he : 2 * 42 = 84 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h168 : (2257 : ℕ) ^ 168 % 10 ^ 169 = 7619237667622838605719419161209696531938423430034106176057437580270305932682218287305030681670419331650319121730414800859467656516336199359058893717076244629002295964801 := by
      have step := pow_mod_double (k := 2257) (e := 84) (m := 10 ^ 169) h84
      have he : 2 * 84 = 168 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h336 : (2257 : ℕ) ^ 336 % 10 ^ 169 = 2714561518843707446915796842337420993217940724118538513115015214254066139487281063741523481434251267143149289793019768623974760633041190372161861602903879112367430969601 := by
      have step := pow_mod_double (k := 2257) (e := 168) (m := 10 ^ 169) h168
      have he : 2 * 168 = 336 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h673 : (2257 : ℕ) ^ 673 % 10 ^ 169 = 4428429072866523599939422068483411403731121242421341428419133021426287320983184312323219181541319179815505192965568168107509402448891145467131831403899465666235625896657 := by
      have step := pow_mod_double_add_one (k := 2257) (e := 336) (m := 10 ^ 169) h336
      have he : 2 * 336 + 1 = 673 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h673
  rw [hmod]
  decide
private theorem cert_2257 : ExponentCertificate 2257 673 673 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2257) (by decide) (by decide) (by decide) suffix_2257
private theorem cert_2258 : ExponentCertificate 2258 673 673 := by decide
private theorem cert_2259 : ExponentCertificate 2259 674 673 := by decide
private theorem cert_2260 : ExponentCertificate 2260 674 673 := by decide
private theorem cert_2261 : ExponentCertificate 2261 674 674 := by decide
private theorem cert_2262 : ExponentCertificate 2262 675 674 := by decide
private theorem cert_2263 : ExponentCertificate 2263 675 674 := by decide
private theorem cert_2264 : ExponentCertificate 2264 675 674 := by decide
private theorem suffix_2265 : 675 < digitSum ((2265 : ℕ) ^ 675 % 10 ^ 169) := by
  have hmod : (2265 : ℕ) ^ 675 % 10 ^ 169 = 773827350432489405906631723639324393192258336495304690183487859455611650420455604067606242725498206730006337931172551015580212720179620333738057524897158145904541015625 := by
    have h1 : (2265 : ℕ) ^ 1 % 10 ^ 169 = 2265 := by decide
    have h2 : (2265 : ℕ) ^ 2 % 10 ^ 169 = 5130225 := by
      have step := pow_mod_double (k := 2265) (e := 1) (m := 10 ^ 169) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2265 : ℕ) ^ 5 % 10 ^ 169 = 59613007367165625 := by
      have step := pow_mod_double_add_one (k := 2265) (e := 2) (m := 10 ^ 169) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (2265 : ℕ) ^ 10 % 10 ^ 169 = 3553710647357743081379346181640625 := by
      have step := pow_mod_double (k := 2265) (e := 5) (m := 10 ^ 169) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (2265 : ℕ) ^ 21 % 10 ^ 169 = 28604366462050682998938190925628133233941894020178135706424713134765625 := by
      have step := pow_mod_double_add_one (k := 2265) (e := 10) (m := 10 ^ 169) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h42 : (2265 : ℕ) ^ 42 % 10 ^ 169 = 818209780695289907594044909014361589783764886598893827051506210717094454375192443501844240932073601550637074162523276754654943943023681640625 := by
      have step := pow_mod_double (k := 2265) (e := 21) (m := 10 ^ 169) h21
      have he : 2 * 21 = 42 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h84 : (2265 : ℕ) ^ 84 % 10 ^ 169 = 3541659978563367831456968994317019252513002966524432415089006159723720207000582600922864064233705685142615051899962021192871789755651779074696605675853788852691650390625 := by
      have step := pow_mod_double (k := 2265) (e := 42) (m := 10 ^ 169) h42
      have he : 2 * 42 = 84 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h168 : (2265 : ℕ) ^ 168 % 10 ^ 169 = 2878098407306605347605880546425977652036748329753875723977326045853787795227530190914593294271411080642195408829739002406732637819042341931208284222520887851715087890625 := by
      have step := pow_mod_double (k := 2265) (e := 84) (m := 10 ^ 169) h84
      have he : 2 * 84 = 168 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h337 : (2265 : ℕ) ^ 337 % 10 ^ 169 = 898027018076939100268683011176460484773099628117741876702713853623242263995860904168870670212152453518100555090270175427800644109288530358981006429530680179595947265625 := by
      have step := pow_mod_double_add_one (k := 2265) (e := 168) (m := 10 ^ 169) h168
      have he : 2 * 168 + 1 = 337 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h675 : (2265 : ℕ) ^ 675 % 10 ^ 169 = 773827350432489405906631723639324393192258336495304690183487859455611650420455604067606242725498206730006337931172551015580212720179620333738057524897158145904541015625 := by
      have step := pow_mod_double_add_one (k := 2265) (e := 337) (m := 10 ^ 169) h337
      have he : 2 * 337 + 1 = 675 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h675
  rw [hmod]
  decide
private theorem cert_2265 : ExponentCertificate 2265 675 675 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2265) (by decide) (by decide) (by decide) suffix_2265
private theorem cert_2266 : ExponentCertificate 2266 676 675 := by decide
private theorem cert_2267 : ExponentCertificate 2267 676 675 := by decide
private theorem cert_2268 : ExponentCertificate 2268 676 675 := by decide
private theorem suffix_2269 : 676 < digitSum ((2269 : ℕ) ^ 676 % 10 ^ 169) := by
  have hmod : (2269 : ℕ) ^ 676 % 10 ^ 169 = 9981999799337775163333301219695911635320590115084891285333582597243867329113846120811134490146628677580219672906982769610951224516037551040824488853239754269082131750481 := by
    have h1 : (2269 : ℕ) ^ 1 % 10 ^ 169 = 2269 := by decide
    have h2 : (2269 : ℕ) ^ 2 % 10 ^ 169 = 5148361 := by
      have step := pow_mod_double (k := 2269) (e := 1) (m := 10 ^ 169) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2269 : ℕ) ^ 5 % 10 ^ 169 = 60141254017962349 := by
      have step := pow_mod_double_add_one (k := 2269) (e := 2) (m := 10 ^ 169) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (2269 : ℕ) ^ 10 % 10 ^ 169 = 3616970434853072387613937981597801 := by
      have step := pow_mod_double (k := 2269) (e := 5) (m := 10 ^ 169) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (2269 : ℕ) ^ 21 % 10 ^ 169 = 29684136062258176268645864981446131321790970730037817399410109712778669 := by
      have step := pow_mod_double_add_one (k := 2269) (e := 10) (m := 10 ^ 169) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h42 : (2269 : ℕ) ^ 42 % 10 ^ 169 = 881147933762656346816993296191548037204626605776658295534101282444367657231611259595045796567651996616674910061168782625039264383272981411561 := by
      have step := pow_mod_double (k := 2269) (e := 21) (m := 10 ^ 169) h21
      have he : 2 * 21 = 42 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h84 : (2269 : ℕ) ^ 84 % 10 ^ 169 = 7545218994115480392396831042734232453431565296225508746793527695018238001595681356944255320001107320644404295195705270446285999766182710674749437715342314783836064456721 := by
      have step := pow_mod_double (k := 2269) (e := 42) (m := 10 ^ 169) h42
      have he : 2 * 42 = 84 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h169 : (2269 : ℕ) ^ 169 % 10 ^ 169 = 5243222028545341107031721962767774881299381784251286725225996259635327430701684912848557216010540141877729183010749609764164100196537747414401201094152964592421421007229 := by
      have step := pow_mod_double_add_one (k := 2269) (e := 84) (m := 10 ^ 169) h84
      have he : 2 * 84 + 1 = 169 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h338 : (2269 : ℕ) ^ 338 % 10 ^ 169 = 8700735783584911320804009975958681658825318073167643926727983826085616523146167011075762387636079236840712123232393349647494883122214712416364866091621736469904870258441 := by
      have step := pow_mod_double (k := 2269) (e := 169) (m := 10 ^ 169) h169
      have he : 2 * 169 = 338 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h676 : (2269 : ℕ) ^ 676 % 10 ^ 169 = 9981999799337775163333301219695911635320590115084891285333582597243867329113846120811134490146628677580219672906982769610951224516037551040824488853239754269082131750481 := by
      have step := pow_mod_double (k := 2269) (e := 338) (m := 10 ^ 169) h338
      have he : 2 * 338 = 676 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h676
  rw [hmod]
  decide
private theorem cert_2269 : ExponentCertificate 2269 676 676 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2269) (by decide) (by decide) (by decide) suffix_2269
private theorem cert_2270 : ExponentCertificate 2270 677 676 := by decide
private theorem cert_2271 : ExponentCertificate 2271 677 676 := by decide
private theorem cert_2272 : ExponentCertificate 2272 677 676 := by decide
private theorem suffix_2273 : 677 < digitSum ((2273 : ℕ) ^ 677 % 10 ^ 170) := by
  have hmod : (2273 : ℕ) ^ 677 % 10 ^ 170 = 58233399296159084771370663652520802008692425294214032455054539911896990106059480881806326416626215322792262960751614776989588489954302908065354171785429609510773804589153 := by
    have h1 : (2273 : ℕ) ^ 1 % 10 ^ 170 = 2273 := by decide
    have h2 : (2273 : ℕ) ^ 2 % 10 ^ 170 = 5166529 := by
      have step := pow_mod_double (k := 2273) (e := 1) (m := 10 ^ 170) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2273 : ℕ) ^ 5 % 10 ^ 170 = 60673238796522593 := by
      have step := pow_mod_double_add_one (k := 2273) (e := 2) (m := 10 ^ 170) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (2273 : ℕ) ^ 10 % 10 ^ 170 = 3681241906059854349380509159443649 := by
      have step := pow_mod_double (k := 2273) (e := 5) (m := 10 ^ 170) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (2273 : ℕ) ^ 21 % 10 ^ 170 = 30802654899926593766220683869718863883450813428275235996988276227211873 := by
      have step := pow_mod_double_add_one (k := 2273) (e := 10) (m := 10 ^ 170) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h42 : (2273 : ℕ) ^ 42 % 10 ^ 170 = 948803548883971796226779393437051112056505938808364607474247342005390187828999775487077122891791828394604431099277542237633149627131232168129 := by
      have step := pow_mod_double (k := 2273) (e := 21) (m := 10 ^ 170) h21
      have he : 2 * 21 = 42 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h84 : (2273 : ℕ) ^ 84 % 10 ^ 170 = 87238753601394215845344564117169901759407890589525206143499300189074337692200933284742257197296236382944643611368735141326605560005043074896183854765777157717838123360641 := by
      have step := pow_mod_double (k := 2273) (e := 42) (m := 10 ^ 170) h42
      have he : 2 * 42 = 84 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h169 : (2273 : ℕ) ^ 169 % 10 ^ 170 = 36271391022725427212665782754033407364012347672091497721917903252170804198850778193097276623961459567021246940644476253416887395159300082121944103458921523330199046892513 := by
      have step := pow_mod_double_add_one (k := 2273) (e := 84) (m := 10 ^ 170) h84
      have he : 2 * 84 + 1 = 169 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h338 : (2273 : ℕ) ^ 338 % 10 ^ 170 = 52486063792205202548709878669529431816144593334012206925179049810913530874933752012827976068548689563049408188683933114577870266687917367298496830377083321999081775455169 := by
      have step := pow_mod_double (k := 2273) (e := 169) (m := 10 ^ 170) h169
      have he : 2 * 169 = 338 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h677 : (2273 : ℕ) ^ 677 % 10 ^ 170 = 58233399296159084771370663652520802008692425294214032455054539911896990106059480881806326416626215322792262960751614776989588489954302908065354171785429609510773804589153 := by
      have step := pow_mod_double_add_one (k := 2273) (e := 338) (m := 10 ^ 170) h338
      have he : 2 * 338 + 1 = 677 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h677
  rw [hmod]
  decide
private theorem cert_2273 : ExponentCertificate 2273 677 677 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2273) (by decide) (by decide) (by decide) suffix_2273
private theorem cert_2274 : ExponentCertificate 2274 678 677 := by decide
private theorem cert_2275 : ExponentCertificate 2275 678 677 := by decide
private theorem cert_2276 : ExponentCertificate 2276 678 677 := by decide
private theorem cert_2277 : ExponentCertificate 2277 678 678 := by decide
private theorem cert_2278 : ExponentCertificate 2278 679 678 := by decide
private theorem cert_2279 : ExponentCertificate 2279 679 678 := by decide
private theorem cert_2280 : ExponentCertificate 2280 679 678 := by decide
private theorem suffix_2281 : 679 < digitSum ((2281 : ℕ) ^ 679 % 10 ^ 170) := by
  have hmod : (2281 : ℕ) ^ 679 % 10 ^ 170 = 63967041508513006755799437549053225262350327607793208689479896289054605112782123891869131310540997505560914693689800593561411434918106012836509562012789217682334724026521 := by
    have h1 : (2281 : ℕ) ^ 1 % 10 ^ 170 = 2281 := by decide
    have h2 : (2281 : ℕ) ^ 2 % 10 ^ 170 = 5202961 := by
      have step := pow_mod_double (k := 2281) (e := 1) (m := 10 ^ 170) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2281 : ℕ) ^ 5 % 10 ^ 170 = 61748502025115401 := by
      have step := pow_mod_double_add_one (k := 2281) (e := 2) (m := 10 ^ 170) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (2281 : ℕ) ^ 10 % 10 ^ 170 = 3812877502345680778389387367390801 := by
      have step := pow_mod_double (k := 2281) (e := 5) (m := 10 ^ 170) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (2281 : ℕ) ^ 21 % 10 ^ 170 = 33161257488045842036666185610641632828350669418193489660096198140671881 := by
      have step := pow_mod_double_add_one (k := 2281) (e := 10) (m := 10 ^ 170) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h42 : (2281 : ℕ) ^ 42 % 10 ^ 170 = 1099668998188476429307325537766901102133315744566020956478330425488254127301425415584476882974787443152787259569542238934769647005454104078161 := by
      have step := pow_mod_double (k := 2281) (e := 21) (m := 10 ^ 170) h21
      have he : 2 * 21 = 42 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h84 : (2281 : ℕ) ^ 84 % 10 ^ 170 = 93761564508661283386034349747004402427549764347753599617336824627574490858016572020355044067294381505619679473907739968886303158832150020756616353384009629412451597141921 := by
      have step := pow_mod_double (k := 2281) (e := 42) (m := 10 ^ 170) h42
      have he : 2 * 42 = 84 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h169 : (2281 : ℕ) ^ 169 % 10 ^ 170 = 2997556227958833048296252282601772134521824860606289339751760683055544642040429220150275795187295730703762547349182136666397809643451632322161723594049588587275315719721 := by
      have step := pow_mod_double_add_one (k := 2281) (e := 84) (m := 10 ^ 170) h84
      have he : 2 * 84 + 1 = 169 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h339 : (2281 : ℕ) ^ 339 % 10 ^ 170 = 31955502241948958982566242887639184941579033059712673035434149647752278108753020539310251877025282364054845261890778586259780416436283286514568151451697867221772792995321 := by
      have step := pow_mod_double_add_one (k := 2281) (e := 169) (m := 10 ^ 170) h169
      have he : 2 * 169 + 1 = 339 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h679 : (2281 : ℕ) ^ 679 % 10 ^ 170 = 63967041508513006755799437549053225262350327607793208689479896289054605112782123891869131310540997505560914693689800593561411434918106012836509562012789217682334724026521 := by
      have step := pow_mod_double_add_one (k := 2281) (e := 339) (m := 10 ^ 170) h339
      have he : 2 * 339 + 1 = 679 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h679
  rw [hmod]
  decide
private theorem cert_2281 : ExponentCertificate 2281 679 679 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2281) (by decide) (by decide) (by decide) suffix_2281
private theorem cert_2282 : ExponentCertificate 2282 680 679 := by decide
private theorem cert_2283 : ExponentCertificate 2283 680 679 := by decide
private theorem cert_2284 : ExponentCertificate 2284 680 680 := by decide
private theorem cert_2285 : ExponentCertificate 2285 680 680 := by decide
private theorem cert_2286 : ExponentCertificate 2286 681 680 := by decide
private theorem cert_2287 : ExponentCertificate 2287 681 680 := by decide
private theorem cert_2288 : ExponentCertificate 2288 681 681 := by decide
private theorem cert_2289 : ExponentCertificate 2289 682 681 := by decide
private theorem cert_2290 : ExponentCertificate 2290 682 681 := by decide
private theorem cert_2291 : ExponentCertificate 2291 682 681 := by decide
private theorem cert_2292 : ExponentCertificate 2292 682 682 := by decide
private theorem cert_2293 : ExponentCertificate 2293 683 682 := by decide
private theorem cert_2294 : ExponentCertificate 2294 683 682 := by decide
private theorem cert_2295 : ExponentCertificate 2295 683 682 := by decide
private theorem cert_2296 : ExponentCertificate 2296 683 683 := by decide
private theorem cert_2297 : ExponentCertificate 2297 684 683 := by decide
private theorem cert_2298 : ExponentCertificate 2298 684 683 := by decide
private theorem cert_2299 : ExponentCertificate 2299 684 683 := by decide
private theorem cert_2300 : ExponentCertificate 2300 684 684 := by decide

private theorem certificates_2201_2300 {k : ℕ} (hlo : 2201 ≤ k) (hhi : k ≤ 2300) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨659, 658, cert_2201⟩
  · exact ⟨659, 658, cert_2202⟩
  · exact ⟨659, 658, cert_2203⟩
  · exact ⟨659, 659, cert_2204⟩
  · exact ⟨660, 659, cert_2205⟩
  · exact ⟨660, 659, cert_2206⟩
  · exact ⟨660, 660, cert_2207⟩
  · exact ⟨660, 660, cert_2208⟩
  · exact ⟨661, 660, cert_2209⟩
  · exact ⟨661, 660, cert_2210⟩
  · exact ⟨661, 661, cert_2211⟩
  · exact ⟨662, 661, cert_2212⟩
  · exact ⟨662, 661, cert_2213⟩
  · exact ⟨662, 661, cert_2214⟩
  · exact ⟨662, 662, cert_2215⟩
  · exact ⟨663, 662, cert_2216⟩
  · exact ⟨663, 662, cert_2217⟩
  · exact ⟨663, 662, cert_2218⟩
  · exact ⟨663, 663, cert_2219⟩
  · exact ⟨664, 663, cert_2220⟩
  · exact ⟨664, 663, cert_2221⟩
  · exact ⟨664, 663, cert_2222⟩
  · exact ⟨664, 664, cert_2223⟩
  · exact ⟨665, 664, cert_2224⟩
  · exact ⟨665, 664, cert_2225⟩
  · exact ⟨665, 664, cert_2226⟩
  · exact ⟨665, 665, cert_2227⟩
  · exact ⟨666, 665, cert_2228⟩
  · exact ⟨666, 665, cert_2229⟩
  · exact ⟨666, 666, cert_2230⟩
  · exact ⟨666, 666, cert_2231⟩
  · exact ⟨667, 666, cert_2232⟩
  · exact ⟨667, 666, cert_2233⟩
  · exact ⟨667, 667, cert_2234⟩
  · exact ⟨668, 667, cert_2235⟩
  · exact ⟨668, 667, cert_2236⟩
  · exact ⟨668, 667, cert_2237⟩
  · exact ⟨668, 668, cert_2238⟩
  · exact ⟨669, 668, cert_2239⟩
  · exact ⟨669, 668, cert_2240⟩
  · exact ⟨669, 668, cert_2241⟩
  · exact ⟨669, 669, cert_2242⟩
  · exact ⟨670, 669, cert_2243⟩
  · exact ⟨670, 669, cert_2244⟩
  · exact ⟨670, 669, cert_2245⟩
  · exact ⟨670, 670, cert_2246⟩
  · exact ⟨671, 670, cert_2247⟩
  · exact ⟨671, 670, cert_2248⟩
  · exact ⟨671, 670, cert_2249⟩
  · exact ⟨671, 671, cert_2250⟩
  · exact ⟨672, 671, cert_2251⟩
  · exact ⟨672, 671, cert_2252⟩
  · exact ⟨672, 671, cert_2253⟩
  · exact ⟨672, 672, cert_2254⟩
  · exact ⟨673, 672, cert_2255⟩
  · exact ⟨673, 672, cert_2256⟩
  · exact ⟨673, 673, cert_2257⟩
  · exact ⟨673, 673, cert_2258⟩
  · exact ⟨674, 673, cert_2259⟩
  · exact ⟨674, 673, cert_2260⟩
  · exact ⟨674, 674, cert_2261⟩
  · exact ⟨675, 674, cert_2262⟩
  · exact ⟨675, 674, cert_2263⟩
  · exact ⟨675, 674, cert_2264⟩
  · exact ⟨675, 675, cert_2265⟩
  · exact ⟨676, 675, cert_2266⟩
  · exact ⟨676, 675, cert_2267⟩
  · exact ⟨676, 675, cert_2268⟩
  · exact ⟨676, 676, cert_2269⟩
  · exact ⟨677, 676, cert_2270⟩
  · exact ⟨677, 676, cert_2271⟩
  · exact ⟨677, 676, cert_2272⟩
  · exact ⟨677, 677, cert_2273⟩
  · exact ⟨678, 677, cert_2274⟩
  · exact ⟨678, 677, cert_2275⟩
  · exact ⟨678, 677, cert_2276⟩
  · exact ⟨678, 678, cert_2277⟩
  · exact ⟨679, 678, cert_2278⟩
  · exact ⟨679, 678, cert_2279⟩
  · exact ⟨679, 678, cert_2280⟩
  · exact ⟨679, 679, cert_2281⟩
  · exact ⟨680, 679, cert_2282⟩
  · exact ⟨680, 679, cert_2283⟩
  · exact ⟨680, 680, cert_2284⟩
  · exact ⟨680, 680, cert_2285⟩
  · exact ⟨681, 680, cert_2286⟩
  · exact ⟨681, 680, cert_2287⟩
  · exact ⟨681, 681, cert_2288⟩
  · exact ⟨682, 681, cert_2289⟩
  · exact ⟨682, 681, cert_2290⟩
  · exact ⟨682, 681, cert_2291⟩
  · exact ⟨682, 682, cert_2292⟩
  · exact ⟨683, 682, cert_2293⟩
  · exact ⟨683, 682, cert_2294⟩
  · exact ⟨683, 682, cert_2295⟩
  · exact ⟨683, 683, cert_2296⟩
  · exact ⟨684, 683, cert_2297⟩
  · exact ⟨684, 683, cert_2298⟩
  · exact ⟨684, 683, cert_2299⟩
  · exact ⟨684, 684, cert_2300⟩

theorem no_fixed_digitCount_2201_2300 {n : ℕ} (hn : a n = n)
    (hlo : 2201 ≤ digitCount n) (hhi : digitCount n ≤ 2300) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_2201_2300 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_2201_2300
end OeisA113010
