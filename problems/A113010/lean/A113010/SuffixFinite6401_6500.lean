import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 6501
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_6401 : ExponentCertificate 6401 1682 1681 := by decide
private theorem cert_6402 : ExponentCertificate 6402 1682 1681 := by decide
private theorem cert_6403 : ExponentCertificate 6403 1682 1682 := by decide
private theorem cert_6404 : ExponentCertificate 6404 1683 1682 := by decide
private theorem cert_6405 : ExponentCertificate 6405 1683 1682 := by decide
private theorem cert_6406 : ExponentCertificate 6406 1683 1682 := by decide
private theorem cert_6407 : ExponentCertificate 6407 1683 1683 := by decide
private theorem cert_6408 : ExponentCertificate 6408 1684 1683 := by decide
private theorem cert_6409 : ExponentCertificate 6409 1684 1683 := by decide
private theorem cert_6410 : ExponentCertificate 6410 1684 1683 := by decide
private theorem cert_6411 : ExponentCertificate 6411 1684 1684 := by decide
private theorem cert_6412 : ExponentCertificate 6412 1685 1684 := by decide
private theorem cert_6413 : ExponentCertificate 6413 1685 1684 := by decide
private theorem cert_6414 : ExponentCertificate 6414 1685 1684 := by decide
private theorem cert_6415 : ExponentCertificate 6415 1685 1684 := by decide
private theorem cert_6416 : ExponentCertificate 6416 1685 1685 := by decide
private theorem cert_6417 : ExponentCertificate 6417 1686 1685 := by decide
private theorem cert_6418 : ExponentCertificate 6418 1686 1685 := by decide
private theorem cert_6419 : ExponentCertificate 6419 1686 1685 := by decide
private theorem cert_6420 : ExponentCertificate 6420 1686 1686 := by decide
private theorem cert_6421 : ExponentCertificate 6421 1687 1686 := by decide
private theorem cert_6422 : ExponentCertificate 6422 1687 1686 := by decide
private theorem cert_6423 : ExponentCertificate 6423 1687 1686 := by decide
private theorem cert_6424 : ExponentCertificate 6424 1687 1687 := by decide
private theorem cert_6425 : ExponentCertificate 6425 1688 1687 := by decide
private theorem cert_6426 : ExponentCertificate 6426 1688 1687 := by decide
private theorem cert_6427 : ExponentCertificate 6427 1688 1687 := by decide
private theorem cert_6428 : ExponentCertificate 6428 1688 1687 := by decide
private theorem cert_6429 : ExponentCertificate 6429 1688 1688 := by decide
private theorem cert_6430 : ExponentCertificate 6430 1689 1688 := by decide
private theorem cert_6431 : ExponentCertificate 6431 1689 1688 := by decide
private theorem cert_6432 : ExponentCertificate 6432 1689 1688 := by decide
private theorem cert_6433 : ExponentCertificate 6433 1689 1689 := by decide
private theorem cert_6434 : ExponentCertificate 6434 1690 1689 := by decide
private theorem cert_6435 : ExponentCertificate 6435 1690 1689 := by decide
private theorem cert_6436 : ExponentCertificate 6436 1690 1689 := by decide
private theorem suffix_6437 : 1690 < digitSum ((6437 : ℕ) ^ 1690 % 10 ^ 423) := by
  have hmod : (6437 : ℕ) ^ 1690 % 10 ^ 423 = 338384389647680124581415577149909543183730442656804777572801327565449588503065180909984874771062057554990240072972824182755389228403776364548766762329703085536691027013437702037219937050333593973527217743106261790295534352321953025685925960150465948758715371497120689400565506161608373563324128125856189993126672133172959741128574277678904597822192696724788798334910277563476216883214460139999543942145620655031402721638649 := by
    have h1 : (6437 : ℕ) ^ 1 % 10 ^ 423 = 6437 := by decide
    have h3 : (6437 : ℕ) ^ 3 % 10 ^ 423 = 266716895453 := by
      have step := pow_mod_double_add_one (k := 6437) (e := 1) (m := 10 ^ 423) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (6437 : ℕ) ^ 6 % 10 ^ 423 = 71137902320086532075209 := by
      have step := pow_mod_double (k := 6437) (e := 3) (m := 10 ^ 423) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h13 : (6437 : ℕ) ^ 13 % 10 ^ 423 = 32575089580034486333088255404888602445720518124597 := by
      have step := pow_mod_double_add_one (k := 6437) (e := 6) (m := 10 ^ 423) h6
      have he : 2 * 6 + 1 = 13 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h26 : (6437 : ℕ) ^ 26 % 10 ^ 423 = 1061136461147271367179272465027500663280277796465709268376949294368493747504262564047202778016412409 := by
      have step := pow_mod_double (k := 6437) (e := 13) (m := 10 ^ 423) h13
      have he : 2 * 13 = 26 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h52 : (6437 : ℕ) ^ 52 % 10 ^ 423 = 1126010589176154555772178327778908734029031311343424960642872980957354954560360735953276972676919936469113437062419096881219614663420537004501910308707186550391847922599059139980058597213771169183281 := by
      have step := pow_mod_double (k := 6437) (e := 26) (m := 10 ^ 423) h26
      have he : 2 * 26 = 52 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h105 : (6437 : ℕ) ^ 105 % 10 ^ 423 = 8161471314732379288194965107268329398255105343621760094144617371008326170698638418500489300952019269737619864426170000879971254094095733434446117121272487447462011323776250054755578720261623144718971527063211305286091262064986406231468739138446305864009467217861255565355043054674591727912327385043024004478276167969934243919483617452608075396789029025011807899527014605845665641683604107776606973957 := by
      have step := pow_mod_double_add_one (k := 6437) (e := 52) (m := 10 ^ 423) h52
      have he : 2 * 52 + 1 = 105 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h211 : (6437 : ℕ) ^ 211 % 10 ^ 423 = 844079228514604661183289508642160552891548904878080513813181207451042487011326271512329082063038302919782979813430140900196689872995098363023956233673651774991023122790268725846074739676583249239408335402131390569991255243066479976928785747538750922269807816494736357623476944840187075777866073569502951490073809459972319296412757251521640098440949802521781568248373568535169098972910037287499279787072475066026241543034013 := by
      have step := pow_mod_double_add_one (k := 6437) (e := 105) (m := 10 ^ 423) h105
      have he : 2 * 105 + 1 = 211 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h422 : (6437 : ℕ) ^ 422 % 10 ^ 423 = 876305356519154138795716562136075703480465387103814253231553013914931007689921321592694905875603474667022647241675397803172827278710792227358829446561519192325334470630938889611465685749126355457711142173111086673311310301746447413157436849817259530457923139858559495115136585481138734592474674949738061395456538952436871770224978429090340339653010507984600546524591765870207990044141714116759917814483420521956205274884169 := by
      have step := pow_mod_double (k := 6437) (e := 211) (m := 10 ^ 423) h211
      have he : 2 * 211 = 422 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h845 : (6437 : ℕ) ^ 845 % 10 ^ 423 = 6708429032242621697459217056542864649874904145005952182864742004618228407147789824128618344276172412174417934159466078235591095437354682117514060592080910541544410398435145031201468268860928539677770983781131362342920857801111899089523020338196348828334362860019681122136744141384237144328362354204127944766402248431597761472959214454046842040870481534083281779611428675566776093876364147911175818854881137364813223951157 := by
      have step := pow_mod_double_add_one (k := 6437) (e := 422) (m := 10 ^ 423) h422
      have he : 2 * 422 + 1 = 845 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1690 : (6437 : ℕ) ^ 1690 % 10 ^ 423 = 338384389647680124581415577149909543183730442656804777572801327565449588503065180909984874771062057554990240072972824182755389228403776364548766762329703085536691027013437702037219937050333593973527217743106261790295534352321953025685925960150465948758715371497120689400565506161608373563324128125856189993126672133172959741128574277678904597822192696724788798334910277563476216883214460139999543942145620655031402721638649 := by
      have step := pow_mod_double (k := 6437) (e := 845) (m := 10 ^ 423) h845
      have he : 2 * 845 = 1690 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1690
  rw [hmod]
  decide
private theorem cert_6437 : ExponentCertificate 6437 1690 1690 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 6437) (by decide) (by decide) (by decide) suffix_6437
private theorem cert_6438 : ExponentCertificate 6438 1691 1690 := by decide
private theorem cert_6439 : ExponentCertificate 6439 1691 1690 := by decide
private theorem cert_6440 : ExponentCertificate 6440 1691 1690 := by decide
private theorem cert_6441 : ExponentCertificate 6441 1691 1691 := by decide
private theorem cert_6442 : ExponentCertificate 6442 1691 1691 := by decide
private theorem cert_6443 : ExponentCertificate 6443 1692 1691 := by decide
private theorem cert_6444 : ExponentCertificate 6444 1692 1691 := by decide
private theorem cert_6445 : ExponentCertificate 6445 1692 1691 := by decide
private theorem cert_6446 : ExponentCertificate 6446 1692 1692 := by decide
private theorem cert_6447 : ExponentCertificate 6447 1693 1692 := by decide
private theorem cert_6448 : ExponentCertificate 6448 1693 1692 := by decide
private theorem cert_6449 : ExponentCertificate 6449 1693 1692 := by decide
private theorem cert_6450 : ExponentCertificate 6450 1693 1693 := by decide
private theorem cert_6451 : ExponentCertificate 6451 1694 1693 := by decide
private theorem cert_6452 : ExponentCertificate 6452 1694 1693 := by decide
private theorem cert_6453 : ExponentCertificate 6453 1694 1693 := by decide
private theorem cert_6454 : ExponentCertificate 6454 1694 1694 := by decide
private theorem cert_6455 : ExponentCertificate 6455 1695 1694 := by decide
private theorem cert_6456 : ExponentCertificate 6456 1695 1694 := by decide
private theorem cert_6457 : ExponentCertificate 6457 1695 1694 := by decide
private theorem cert_6458 : ExponentCertificate 6458 1695 1694 := by decide
private theorem cert_6459 : ExponentCertificate 6459 1695 1695 := by decide
private theorem cert_6460 : ExponentCertificate 6460 1696 1695 := by decide
private theorem cert_6461 : ExponentCertificate 6461 1696 1695 := by decide
private theorem cert_6462 : ExponentCertificate 6462 1696 1695 := by decide
private theorem cert_6463 : ExponentCertificate 6463 1696 1696 := by decide
private theorem cert_6464 : ExponentCertificate 6464 1697 1696 := by decide
private theorem cert_6465 : ExponentCertificate 6465 1697 1696 := by decide
private theorem cert_6466 : ExponentCertificate 6466 1697 1696 := by decide
private theorem cert_6467 : ExponentCertificate 6467 1697 1697 := by decide
private theorem cert_6468 : ExponentCertificate 6468 1698 1697 := by decide
private theorem cert_6469 : ExponentCertificate 6469 1698 1697 := by decide
private theorem cert_6470 : ExponentCertificate 6470 1698 1697 := by decide
private theorem cert_6471 : ExponentCertificate 6471 1698 1697 := by decide
private theorem cert_6472 : ExponentCertificate 6472 1698 1698 := by decide
private theorem cert_6473 : ExponentCertificate 6473 1699 1698 := by decide
private theorem cert_6474 : ExponentCertificate 6474 1699 1698 := by decide
private theorem cert_6475 : ExponentCertificate 6475 1699 1698 := by decide
private theorem cert_6476 : ExponentCertificate 6476 1699 1699 := by decide
private theorem cert_6477 : ExponentCertificate 6477 1700 1699 := by decide
private theorem cert_6478 : ExponentCertificate 6478 1700 1699 := by decide
private theorem cert_6479 : ExponentCertificate 6479 1700 1699 := by decide
private theorem cert_6480 : ExponentCertificate 6480 1700 1700 := by decide
private theorem cert_6481 : ExponentCertificate 6481 1701 1700 := by decide
private theorem cert_6482 : ExponentCertificate 6482 1701 1700 := by decide
private theorem cert_6483 : ExponentCertificate 6483 1701 1700 := by decide
private theorem cert_6484 : ExponentCertificate 6484 1701 1701 := by decide
private theorem cert_6485 : ExponentCertificate 6485 1701 1701 := by decide
private theorem cert_6486 : ExponentCertificate 6486 1702 1701 := by decide
private theorem cert_6487 : ExponentCertificate 6487 1702 1701 := by decide
private theorem cert_6488 : ExponentCertificate 6488 1702 1701 := by decide
private theorem cert_6489 : ExponentCertificate 6489 1702 1702 := by decide
private theorem cert_6490 : ExponentCertificate 6490 1703 1702 := by decide
private theorem cert_6491 : ExponentCertificate 6491 1703 1702 := by decide
private theorem cert_6492 : ExponentCertificate 6492 1703 1702 := by decide
private theorem cert_6493 : ExponentCertificate 6493 1703 1703 := by decide
private theorem cert_6494 : ExponentCertificate 6494 1704 1703 := by decide
private theorem cert_6495 : ExponentCertificate 6495 1704 1703 := by decide
private theorem cert_6496 : ExponentCertificate 6496 1704 1703 := by decide
private theorem cert_6497 : ExponentCertificate 6497 1704 1704 := by decide
private theorem cert_6498 : ExponentCertificate 6498 1705 1704 := by decide
private theorem cert_6499 : ExponentCertificate 6499 1705 1704 := by decide
private theorem cert_6500 : ExponentCertificate 6500 1705 1704 := by decide

private theorem certificates_6401_6500 {k : ℕ} (hlo : 6401 ≤ k) (hhi : k ≤ 6500) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1682, 1681, cert_6401⟩
  · exact ⟨1682, 1681, cert_6402⟩
  · exact ⟨1682, 1682, cert_6403⟩
  · exact ⟨1683, 1682, cert_6404⟩
  · exact ⟨1683, 1682, cert_6405⟩
  · exact ⟨1683, 1682, cert_6406⟩
  · exact ⟨1683, 1683, cert_6407⟩
  · exact ⟨1684, 1683, cert_6408⟩
  · exact ⟨1684, 1683, cert_6409⟩
  · exact ⟨1684, 1683, cert_6410⟩
  · exact ⟨1684, 1684, cert_6411⟩
  · exact ⟨1685, 1684, cert_6412⟩
  · exact ⟨1685, 1684, cert_6413⟩
  · exact ⟨1685, 1684, cert_6414⟩
  · exact ⟨1685, 1684, cert_6415⟩
  · exact ⟨1685, 1685, cert_6416⟩
  · exact ⟨1686, 1685, cert_6417⟩
  · exact ⟨1686, 1685, cert_6418⟩
  · exact ⟨1686, 1685, cert_6419⟩
  · exact ⟨1686, 1686, cert_6420⟩
  · exact ⟨1687, 1686, cert_6421⟩
  · exact ⟨1687, 1686, cert_6422⟩
  · exact ⟨1687, 1686, cert_6423⟩
  · exact ⟨1687, 1687, cert_6424⟩
  · exact ⟨1688, 1687, cert_6425⟩
  · exact ⟨1688, 1687, cert_6426⟩
  · exact ⟨1688, 1687, cert_6427⟩
  · exact ⟨1688, 1687, cert_6428⟩
  · exact ⟨1688, 1688, cert_6429⟩
  · exact ⟨1689, 1688, cert_6430⟩
  · exact ⟨1689, 1688, cert_6431⟩
  · exact ⟨1689, 1688, cert_6432⟩
  · exact ⟨1689, 1689, cert_6433⟩
  · exact ⟨1690, 1689, cert_6434⟩
  · exact ⟨1690, 1689, cert_6435⟩
  · exact ⟨1690, 1689, cert_6436⟩
  · exact ⟨1690, 1690, cert_6437⟩
  · exact ⟨1691, 1690, cert_6438⟩
  · exact ⟨1691, 1690, cert_6439⟩
  · exact ⟨1691, 1690, cert_6440⟩
  · exact ⟨1691, 1691, cert_6441⟩
  · exact ⟨1691, 1691, cert_6442⟩
  · exact ⟨1692, 1691, cert_6443⟩
  · exact ⟨1692, 1691, cert_6444⟩
  · exact ⟨1692, 1691, cert_6445⟩
  · exact ⟨1692, 1692, cert_6446⟩
  · exact ⟨1693, 1692, cert_6447⟩
  · exact ⟨1693, 1692, cert_6448⟩
  · exact ⟨1693, 1692, cert_6449⟩
  · exact ⟨1693, 1693, cert_6450⟩
  · exact ⟨1694, 1693, cert_6451⟩
  · exact ⟨1694, 1693, cert_6452⟩
  · exact ⟨1694, 1693, cert_6453⟩
  · exact ⟨1694, 1694, cert_6454⟩
  · exact ⟨1695, 1694, cert_6455⟩
  · exact ⟨1695, 1694, cert_6456⟩
  · exact ⟨1695, 1694, cert_6457⟩
  · exact ⟨1695, 1694, cert_6458⟩
  · exact ⟨1695, 1695, cert_6459⟩
  · exact ⟨1696, 1695, cert_6460⟩
  · exact ⟨1696, 1695, cert_6461⟩
  · exact ⟨1696, 1695, cert_6462⟩
  · exact ⟨1696, 1696, cert_6463⟩
  · exact ⟨1697, 1696, cert_6464⟩
  · exact ⟨1697, 1696, cert_6465⟩
  · exact ⟨1697, 1696, cert_6466⟩
  · exact ⟨1697, 1697, cert_6467⟩
  · exact ⟨1698, 1697, cert_6468⟩
  · exact ⟨1698, 1697, cert_6469⟩
  · exact ⟨1698, 1697, cert_6470⟩
  · exact ⟨1698, 1697, cert_6471⟩
  · exact ⟨1698, 1698, cert_6472⟩
  · exact ⟨1699, 1698, cert_6473⟩
  · exact ⟨1699, 1698, cert_6474⟩
  · exact ⟨1699, 1698, cert_6475⟩
  · exact ⟨1699, 1699, cert_6476⟩
  · exact ⟨1700, 1699, cert_6477⟩
  · exact ⟨1700, 1699, cert_6478⟩
  · exact ⟨1700, 1699, cert_6479⟩
  · exact ⟨1700, 1700, cert_6480⟩
  · exact ⟨1701, 1700, cert_6481⟩
  · exact ⟨1701, 1700, cert_6482⟩
  · exact ⟨1701, 1700, cert_6483⟩
  · exact ⟨1701, 1701, cert_6484⟩
  · exact ⟨1701, 1701, cert_6485⟩
  · exact ⟨1702, 1701, cert_6486⟩
  · exact ⟨1702, 1701, cert_6487⟩
  · exact ⟨1702, 1701, cert_6488⟩
  · exact ⟨1702, 1702, cert_6489⟩
  · exact ⟨1703, 1702, cert_6490⟩
  · exact ⟨1703, 1702, cert_6491⟩
  · exact ⟨1703, 1702, cert_6492⟩
  · exact ⟨1703, 1703, cert_6493⟩
  · exact ⟨1704, 1703, cert_6494⟩
  · exact ⟨1704, 1703, cert_6495⟩
  · exact ⟨1704, 1703, cert_6496⟩
  · exact ⟨1704, 1704, cert_6497⟩
  · exact ⟨1705, 1704, cert_6498⟩
  · exact ⟨1705, 1704, cert_6499⟩
  · exact ⟨1705, 1704, cert_6500⟩

theorem no_fixed_digitCount_6401_6500 {n : ℕ} (hn : a n = n)
    (hlo : 6401 ≤ digitCount n) (hhi : digitCount n ≤ 6500) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_6401_6500 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_6401_6500
end OeisA113010
