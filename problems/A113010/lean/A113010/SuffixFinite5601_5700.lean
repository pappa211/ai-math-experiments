import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 5701
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_5601 : ExponentCertificate 5601 1495 1494 := by decide
private theorem cert_5602 : ExponentCertificate 5602 1495 1494 := by decide
private theorem cert_5603 : ExponentCertificate 5603 1495 1494 := by decide
private theorem cert_5604 : ExponentCertificate 5604 1495 1494 := by decide
private theorem cert_5605 : ExponentCertificate 5605 1495 1495 := by decide
private theorem cert_5606 : ExponentCertificate 5606 1496 1495 := by decide
private theorem cert_5607 : ExponentCertificate 5607 1496 1495 := by decide
private theorem cert_5608 : ExponentCertificate 5608 1496 1495 := by decide
private theorem cert_5609 : ExponentCertificate 5609 1496 1496 := by decide
private theorem cert_5610 : ExponentCertificate 5610 1497 1496 := by decide
private theorem cert_5611 : ExponentCertificate 5611 1497 1496 := by decide
private theorem cert_5612 : ExponentCertificate 5612 1497 1496 := by decide
private theorem cert_5613 : ExponentCertificate 5613 1497 1497 := by decide
private theorem cert_5614 : ExponentCertificate 5614 1498 1497 := by decide
private theorem cert_5615 : ExponentCertificate 5615 1498 1497 := by decide
private theorem cert_5616 : ExponentCertificate 5616 1498 1497 := by decide
private theorem cert_5617 : ExponentCertificate 5617 1498 1498 := by decide
private theorem cert_5618 : ExponentCertificate 5618 1499 1498 := by decide
private theorem cert_5619 : ExponentCertificate 5619 1499 1498 := by decide
private theorem cert_5620 : ExponentCertificate 5620 1499 1498 := by decide
private theorem cert_5621 : ExponentCertificate 5621 1499 1499 := by decide
private theorem cert_5622 : ExponentCertificate 5622 1499 1499 := by decide
private theorem cert_5623 : ExponentCertificate 5623 1500 1499 := by decide
private theorem cert_5624 : ExponentCertificate 5624 1500 1499 := by decide
private theorem cert_5625 : ExponentCertificate 5625 1500 1499 := by decide
private theorem cert_5626 : ExponentCertificate 5626 1500 1500 := by decide
private theorem cert_5627 : ExponentCertificate 5627 1501 1500 := by decide
private theorem cert_5628 : ExponentCertificate 5628 1501 1500 := by decide
private theorem cert_5629 : ExponentCertificate 5629 1501 1500 := by decide
private theorem cert_5630 : ExponentCertificate 5630 1501 1501 := by decide
private theorem cert_5631 : ExponentCertificate 5631 1502 1501 := by decide
private theorem cert_5632 : ExponentCertificate 5632 1502 1501 := by decide
private theorem cert_5633 : ExponentCertificate 5633 1502 1501 := by decide
private theorem cert_5634 : ExponentCertificate 5634 1502 1502 := by decide
private theorem cert_5635 : ExponentCertificate 5635 1503 1502 := by decide
private theorem cert_5636 : ExponentCertificate 5636 1503 1502 := by decide
private theorem cert_5637 : ExponentCertificate 5637 1503 1502 := by decide
private theorem cert_5638 : ExponentCertificate 5638 1503 1503 := by decide
private theorem cert_5639 : ExponentCertificate 5639 1503 1503 := by decide
private theorem cert_5640 : ExponentCertificate 5640 1504 1503 := by decide
private theorem cert_5641 : ExponentCertificate 5641 1504 1503 := by decide
private theorem cert_5642 : ExponentCertificate 5642 1504 1503 := by decide
private theorem cert_5643 : ExponentCertificate 5643 1504 1504 := by decide
private theorem cert_5644 : ExponentCertificate 5644 1505 1504 := by decide
private theorem cert_5645 : ExponentCertificate 5645 1505 1504 := by decide
private theorem cert_5646 : ExponentCertificate 5646 1505 1504 := by decide
private theorem cert_5647 : ExponentCertificate 5647 1505 1505 := by decide
private theorem cert_5648 : ExponentCertificate 5648 1506 1505 := by decide
private theorem cert_5649 : ExponentCertificate 5649 1506 1505 := by decide
private theorem cert_5650 : ExponentCertificate 5650 1506 1505 := by decide
private theorem cert_5651 : ExponentCertificate 5651 1506 1506 := by decide
private theorem cert_5652 : ExponentCertificate 5652 1507 1506 := by decide
private theorem cert_5653 : ExponentCertificate 5653 1507 1506 := by decide
private theorem cert_5654 : ExponentCertificate 5654 1507 1506 := by decide
private theorem cert_5655 : ExponentCertificate 5655 1507 1507 := by decide
private theorem suffix_5656 : 1507 < digitSum ((5656 : ℕ) ^ 1507 % 10 ^ 377) := by
  have hmod : (5656 : ℕ) ^ 1507 % 10 ^ 377 = 74207016588746907813761688282301281211536025167800856565885518935368565729506589250395174787845323544670849734158923339942139184633323544954549877545325818475470764617526105811797314893967332568214913297150595785013483237494614021379059213870591628707461009673980700655407644107569584803990582356346460453749947779665776845232112119508158961074110169573894532088743742444404736 := by
    have h1 : (5656 : ℕ) ^ 1 % 10 ^ 377 = 5656 := by decide
    have h2 : (5656 : ℕ) ^ 2 % 10 ^ 377 = 31990336 := by
      have step := pow_mod_double (k := 5656) (e := 1) (m := 10 ^ 377) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (5656 : ℕ) ^ 5 % 10 ^ 377 = 5788246314854219776 := by
      have step := pow_mod_double_add_one (k := 5656) (e := 2) (m := 10 ^ 377) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (5656 : ℕ) ^ 11 % 10 ^ 377 = 189497466790451064513230803574980876435456 := by
      have step := pow_mod_double_add_one (k := 5656) (e := 5) (m := 10 ^ 377) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h23 : (5656 : ℕ) ^ 23 % 10 ^ 377 = 203102943787509276616144093377221079752262573184594752767368701310052259632427896406016 := by
      have step := pow_mod_double_add_one (k := 5656) (e := 11) (m := 10 ^ 377) h11
      have he : 2 * 11 + 1 = 23 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h47 : (5656 : ℕ) ^ 47 % 10 ^ 377 = 233314557464260577714434265248667729410747530147646210745503208012890539727546687901395198538593925052107456803059472299093583575900668124039643749355955119266714596250732199936 := by
      have step := pow_mod_double_add_one (k := 5656) (e := 23) (m := 10 ^ 377) h23
      have he : 2 * 23 + 1 = 47 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h94 : (5656 : ℕ) ^ 94 % 10 ^ 377 = 54435682724743751259552490223967070191580238506915195244381920677849328451937425501701075822915115081511162430877751690465475733129519419721421263380525294111884868450981050609599172067628711739222511414984301921673360447148599342357959935228324398332761145024888268369786306928475676645987351034033552634481829695030544111892435651109567796746278404096 := by
      have step := pow_mod_double (k := 5656) (e := 47) (m := 10 ^ 377) h47
      have he : 2 * 47 = 94 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h188 : (5656 : ℕ) ^ 188 % 10 ^ 377 = 83429141290941794985986648673832474840375721059208558919503410353508145844865945079075441652328009587019303122498139273269996300658405869435557867349007462384099564892739198295976017495255551977588349180835774341302611664468006697572987194646631689902486847414875701479249901724608358281147106141058765509984010735965985774224652370611311028558169143429427323641252072669577216 := by
      have step := pow_mod_double (k := 5656) (e := 94) (m := 10 ^ 377) h94
      have he : 2 * 94 = 188 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h376 : (5656 : ℕ) ^ 376 % 10 ^ 377 = 9717591953186175286080013097023490023614838743962629378115277798217838823737667591117831497445917997665390021905599981531567948050957113354606765605631828480398264784902178618845627772619245173079963751628852149814914663653627578686612053845348845137151958510104135732290569826321871853517001627231929070449005840295901492065994188464268020934692011520374274696316752186310656 := by
      have step := pow_mod_double (k := 5656) (e := 188) (m := 10 ^ 377) h188
      have he : 2 * 188 = 376 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h753 : (5656 : ℕ) ^ 753 % 10 ^ 377 = 86820735355272046393743832715979351869309769512324500419677366005044344456110263628983896427462208379567085211990408012454145735051566925701857097532577713670169937872948010974054937537638315573198145195848660343870847384632861512378033589460419890758241696877973577523858156542819204494799668647468182433847682773853678599169388280386796935847064828345230311191289353434300416 := by
      have step := pow_mod_double_add_one (k := 5656) (e := 376) (m := 10 ^ 377) h376
      have he : 2 * 376 + 1 = 753 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1507 : (5656 : ℕ) ^ 1507 % 10 ^ 377 = 74207016588746907813761688282301281211536025167800856565885518935368565729506589250395174787845323544670849734158923339942139184633323544954549877545325818475470764617526105811797314893967332568214913297150595785013483237494614021379059213870591628707461009673980700655407644107569584803990582356346460453749947779665776845232112119508158961074110169573894532088743742444404736 := by
      have step := pow_mod_double_add_one (k := 5656) (e := 753) (m := 10 ^ 377) h753
      have he : 2 * 753 + 1 = 1507 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1507
  rw [hmod]
  decide
private theorem cert_5656 : ExponentCertificate 5656 1507 1507 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5656) (by decide) (by decide) (by decide) suffix_5656
private theorem cert_5657 : ExponentCertificate 5657 1508 1507 := by decide
private theorem cert_5658 : ExponentCertificate 5658 1508 1507 := by decide
private theorem cert_5659 : ExponentCertificate 5659 1508 1507 := by decide
private theorem cert_5660 : ExponentCertificate 5660 1508 1508 := by decide
private theorem cert_5661 : ExponentCertificate 5661 1509 1508 := by decide
private theorem cert_5662 : ExponentCertificate 5662 1509 1508 := by decide
private theorem cert_5663 : ExponentCertificate 5663 1509 1508 := by decide
private theorem cert_5664 : ExponentCertificate 5664 1509 1509 := by decide
private theorem cert_5665 : ExponentCertificate 5665 1510 1509 := by decide
private theorem cert_5666 : ExponentCertificate 5666 1510 1509 := by decide
private theorem cert_5667 : ExponentCertificate 5667 1510 1509 := by decide
private theorem suffix_5668 : 1510 < digitSum ((5668 : ℕ) ^ 1510 % 10 ^ 378) := by
  have hmod : (5668 : ℕ) ^ 1510 % 10 ^ 378 = 385185339370510341878399413162920786687071475554511822717199568806782814863095841230433491015781971911454124768697973812387593336109911445685985046612731350902639516226788680470134516389800764896026989817446540477916913313281689944268406401518910435832306554428171354564578399423760317797078700928581453201083015745362206009533934078017666396151288147259319070694457860763418624 := by
    have h1 : (5668 : ℕ) ^ 1 % 10 ^ 378 = 5668 := by decide
    have h2 : (5668 : ℕ) ^ 2 % 10 ^ 378 = 32126224 := by
      have step := pow_mod_double (k := 5668) (e := 1) (m := 10 ^ 378) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (5668 : ℕ) ^ 5 % 10 ^ 378 = 5849910313847661568 := by
      have step := pow_mod_double_add_one (k := 5668) (e := 2) (m := 10 ^ 378) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (5668 : ℕ) ^ 11 % 10 ^ 378 = 193967182454587143840632942886166391160832 := by
      have step := pow_mod_double_add_one (k := 5668) (e := 5) (m := 10 ^ 378) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h23 : (5668 : ℕ) ^ 23 % 10 ^ 378 = 213248682283595387630217655845874572731339372705530907599053403540142007392142603845632 := by
      have step := pow_mod_double_add_one (k := 5668) (e := 11) (m := 10 ^ 378) h11
      have he : 2 * 11 + 1 = 23 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h47 : (5668 : ℕ) ^ 47 % 10 ^ 378 = 257752302809569839380339854655862138853222098734733162222594762569598371030588596439631163103758227946031435750412914867823058017353626429272577795478224100291810235998097375232 := by
      have step := pow_mod_double_add_one (k := 5668) (e := 23) (m := 10 ^ 378) h23
      have he : 2 * 23 + 1 = 47 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h94 : (5668 : ℕ) ^ 94 % 10 ^ 378 = 66436249603636184115509026994097039110841101487137174746346118733735854644000943387017449980726871850854857581105930056441750968756552130776704377187016742560117811555386069611906512137647594487337792457248015855091164571040706311777782975859792385076995757568787871170381470932869702539362821329517792556623801575160998678636267634864569485007807053824 := by
      have step := pow_mod_double (k := 5668) (e := 47) (m := 10 ^ 378) h47
      have he : 2 * 47 = 94 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h188 : (5668 : ℕ) ^ 188 % 10 ^ 378 = 306180719579626180406799377514353740221329103629379486295616265710841034057098965274095178434249497502250067985515487012578743701663320150202869493247772636659647501867690769656076453013599104840480459447148728327715831736392230415234414850292484371975622020097222680818579781946174393110782446489327680007254546299506329936218657990574345989815080878970840026871369410833022976 := by
      have step := pow_mod_double (k := 5668) (e := 94) (m := 10 ^ 378) h94
      have he : 2 * 94 = 188 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h377 : (5668 : ℕ) ^ 377 % 10 ^ 378 = 917290821056538676197154446516449070522455928362698109843746568621034506188869517991731813997154218284310657108261650736898432402215562497870858755932564244354464379224462347978792111640126897037625443893541808253789211125810482945955135059304322239706863207287416401233293560397184956189609546697277649796212830844905760237420692377072113853883907018721027660543132546805792768 := by
      have step := pow_mod_double_add_one (k := 5668) (e := 188) (m := 10 ^ 378) h188
      have he : 2 * 188 + 1 = 377 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h755 : (5668 : ℕ) ^ 755 % 10 ^ 378 = 93930089219776545336206392547998452812358608514189093497391041642870343668582880710655299146071574706865969474772647512490370310719155403395112261712293089146182328648632089769067651215815011352640429147490639584923123241832551218524687848896702639372335396330711227116995030888927389467172707757406390604208253334945132314238565276709034012732285538559344087172640967525138432 := by
      have step := pow_mod_double_add_one (k := 5668) (e := 377) (m := 10 ^ 378) h377
      have he : 2 * 377 + 1 = 755 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1510 : (5668 : ℕ) ^ 1510 % 10 ^ 378 = 385185339370510341878399413162920786687071475554511822717199568806782814863095841230433491015781971911454124768697973812387593336109911445685985046612731350902639516226788680470134516389800764896026989817446540477916913313281689944268406401518910435832306554428171354564578399423760317797078700928581453201083015745362206009533934078017666396151288147259319070694457860763418624 := by
      have step := pow_mod_double (k := 5668) (e := 755) (m := 10 ^ 378) h755
      have he : 2 * 755 = 1510 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1510
  rw [hmod]
  decide
private theorem cert_5668 : ExponentCertificate 5668 1510 1510 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5668) (by decide) (by decide) (by decide) suffix_5668
private theorem cert_5669 : ExponentCertificate 5669 1511 1510 := by decide
private theorem cert_5670 : ExponentCertificate 5670 1511 1510 := by decide
private theorem cert_5671 : ExponentCertificate 5671 1511 1510 := by decide
private theorem cert_5672 : ExponentCertificate 5672 1511 1511 := by decide
private theorem cert_5673 : ExponentCertificate 5673 1511 1511 := by decide
private theorem cert_5674 : ExponentCertificate 5674 1512 1511 := by decide
private theorem cert_5675 : ExponentCertificate 5675 1512 1511 := by decide
private theorem cert_5676 : ExponentCertificate 5676 1512 1511 := by decide
private theorem cert_5677 : ExponentCertificate 5677 1512 1512 := by decide
private theorem cert_5678 : ExponentCertificate 5678 1513 1512 := by decide
private theorem cert_5679 : ExponentCertificate 5679 1513 1512 := by decide
private theorem cert_5680 : ExponentCertificate 5680 1513 1512 := by decide
private theorem cert_5681 : ExponentCertificate 5681 1513 1513 := by decide
private theorem cert_5682 : ExponentCertificate 5682 1514 1513 := by decide
private theorem cert_5683 : ExponentCertificate 5683 1514 1513 := by decide
private theorem cert_5684 : ExponentCertificate 5684 1514 1513 := by decide
private theorem cert_5685 : ExponentCertificate 5685 1514 1514 := by decide
private theorem cert_5686 : ExponentCertificate 5686 1515 1514 := by decide
private theorem cert_5687 : ExponentCertificate 5687 1515 1514 := by decide
private theorem cert_5688 : ExponentCertificate 5688 1515 1514 := by decide
private theorem cert_5689 : ExponentCertificate 5689 1515 1515 := by decide
private theorem cert_5690 : ExponentCertificate 5690 1516 1515 := by decide
private theorem cert_5691 : ExponentCertificate 5691 1516 1515 := by decide
private theorem cert_5692 : ExponentCertificate 5692 1516 1515 := by decide
private theorem cert_5693 : ExponentCertificate 5693 1516 1515 := by decide
private theorem cert_5694 : ExponentCertificate 5694 1516 1516 := by decide
private theorem cert_5695 : ExponentCertificate 5695 1517 1516 := by decide
private theorem cert_5696 : ExponentCertificate 5696 1517 1516 := by decide
private theorem cert_5697 : ExponentCertificate 5697 1517 1516 := by decide
private theorem cert_5698 : ExponentCertificate 5698 1517 1517 := by decide
private theorem cert_5699 : ExponentCertificate 5699 1518 1517 := by decide
private theorem cert_5700 : ExponentCertificate 5700 1518 1517 := by decide

private theorem certificates_5601_5700 {k : ℕ} (hlo : 5601 ≤ k) (hhi : k ≤ 5700) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1495, 1494, cert_5601⟩
  · exact ⟨1495, 1494, cert_5602⟩
  · exact ⟨1495, 1494, cert_5603⟩
  · exact ⟨1495, 1494, cert_5604⟩
  · exact ⟨1495, 1495, cert_5605⟩
  · exact ⟨1496, 1495, cert_5606⟩
  · exact ⟨1496, 1495, cert_5607⟩
  · exact ⟨1496, 1495, cert_5608⟩
  · exact ⟨1496, 1496, cert_5609⟩
  · exact ⟨1497, 1496, cert_5610⟩
  · exact ⟨1497, 1496, cert_5611⟩
  · exact ⟨1497, 1496, cert_5612⟩
  · exact ⟨1497, 1497, cert_5613⟩
  · exact ⟨1498, 1497, cert_5614⟩
  · exact ⟨1498, 1497, cert_5615⟩
  · exact ⟨1498, 1497, cert_5616⟩
  · exact ⟨1498, 1498, cert_5617⟩
  · exact ⟨1499, 1498, cert_5618⟩
  · exact ⟨1499, 1498, cert_5619⟩
  · exact ⟨1499, 1498, cert_5620⟩
  · exact ⟨1499, 1499, cert_5621⟩
  · exact ⟨1499, 1499, cert_5622⟩
  · exact ⟨1500, 1499, cert_5623⟩
  · exact ⟨1500, 1499, cert_5624⟩
  · exact ⟨1500, 1499, cert_5625⟩
  · exact ⟨1500, 1500, cert_5626⟩
  · exact ⟨1501, 1500, cert_5627⟩
  · exact ⟨1501, 1500, cert_5628⟩
  · exact ⟨1501, 1500, cert_5629⟩
  · exact ⟨1501, 1501, cert_5630⟩
  · exact ⟨1502, 1501, cert_5631⟩
  · exact ⟨1502, 1501, cert_5632⟩
  · exact ⟨1502, 1501, cert_5633⟩
  · exact ⟨1502, 1502, cert_5634⟩
  · exact ⟨1503, 1502, cert_5635⟩
  · exact ⟨1503, 1502, cert_5636⟩
  · exact ⟨1503, 1502, cert_5637⟩
  · exact ⟨1503, 1503, cert_5638⟩
  · exact ⟨1503, 1503, cert_5639⟩
  · exact ⟨1504, 1503, cert_5640⟩
  · exact ⟨1504, 1503, cert_5641⟩
  · exact ⟨1504, 1503, cert_5642⟩
  · exact ⟨1504, 1504, cert_5643⟩
  · exact ⟨1505, 1504, cert_5644⟩
  · exact ⟨1505, 1504, cert_5645⟩
  · exact ⟨1505, 1504, cert_5646⟩
  · exact ⟨1505, 1505, cert_5647⟩
  · exact ⟨1506, 1505, cert_5648⟩
  · exact ⟨1506, 1505, cert_5649⟩
  · exact ⟨1506, 1505, cert_5650⟩
  · exact ⟨1506, 1506, cert_5651⟩
  · exact ⟨1507, 1506, cert_5652⟩
  · exact ⟨1507, 1506, cert_5653⟩
  · exact ⟨1507, 1506, cert_5654⟩
  · exact ⟨1507, 1507, cert_5655⟩
  · exact ⟨1507, 1507, cert_5656⟩
  · exact ⟨1508, 1507, cert_5657⟩
  · exact ⟨1508, 1507, cert_5658⟩
  · exact ⟨1508, 1507, cert_5659⟩
  · exact ⟨1508, 1508, cert_5660⟩
  · exact ⟨1509, 1508, cert_5661⟩
  · exact ⟨1509, 1508, cert_5662⟩
  · exact ⟨1509, 1508, cert_5663⟩
  · exact ⟨1509, 1509, cert_5664⟩
  · exact ⟨1510, 1509, cert_5665⟩
  · exact ⟨1510, 1509, cert_5666⟩
  · exact ⟨1510, 1509, cert_5667⟩
  · exact ⟨1510, 1510, cert_5668⟩
  · exact ⟨1511, 1510, cert_5669⟩
  · exact ⟨1511, 1510, cert_5670⟩
  · exact ⟨1511, 1510, cert_5671⟩
  · exact ⟨1511, 1511, cert_5672⟩
  · exact ⟨1511, 1511, cert_5673⟩
  · exact ⟨1512, 1511, cert_5674⟩
  · exact ⟨1512, 1511, cert_5675⟩
  · exact ⟨1512, 1511, cert_5676⟩
  · exact ⟨1512, 1512, cert_5677⟩
  · exact ⟨1513, 1512, cert_5678⟩
  · exact ⟨1513, 1512, cert_5679⟩
  · exact ⟨1513, 1512, cert_5680⟩
  · exact ⟨1513, 1513, cert_5681⟩
  · exact ⟨1514, 1513, cert_5682⟩
  · exact ⟨1514, 1513, cert_5683⟩
  · exact ⟨1514, 1513, cert_5684⟩
  · exact ⟨1514, 1514, cert_5685⟩
  · exact ⟨1515, 1514, cert_5686⟩
  · exact ⟨1515, 1514, cert_5687⟩
  · exact ⟨1515, 1514, cert_5688⟩
  · exact ⟨1515, 1515, cert_5689⟩
  · exact ⟨1516, 1515, cert_5690⟩
  · exact ⟨1516, 1515, cert_5691⟩
  · exact ⟨1516, 1515, cert_5692⟩
  · exact ⟨1516, 1515, cert_5693⟩
  · exact ⟨1516, 1516, cert_5694⟩
  · exact ⟨1517, 1516, cert_5695⟩
  · exact ⟨1517, 1516, cert_5696⟩
  · exact ⟨1517, 1516, cert_5697⟩
  · exact ⟨1517, 1517, cert_5698⟩
  · exact ⟨1518, 1517, cert_5699⟩
  · exact ⟨1518, 1517, cert_5700⟩

theorem no_fixed_digitCount_5601_5700 {n : ℕ} (hn : a n = n)
    (hlo : 5601 ≤ digitCount n) (hhi : digitCount n ≤ 5700) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_5601_5700 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_5601_5700
end OeisA113010
