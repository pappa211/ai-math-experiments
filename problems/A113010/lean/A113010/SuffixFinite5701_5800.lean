import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 5801
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_5701 : ExponentCertificate 5701 1518 1517 := by decide
private theorem cert_5702 : ExponentCertificate 5702 1518 1518 := by decide
private theorem cert_5703 : ExponentCertificate 5703 1519 1518 := by decide
private theorem cert_5704 : ExponentCertificate 5704 1519 1518 := by decide
private theorem cert_5705 : ExponentCertificate 5705 1519 1518 := by decide
private theorem cert_5706 : ExponentCertificate 5706 1519 1519 := by decide
private theorem cert_5707 : ExponentCertificate 5707 1520 1519 := by decide
private theorem cert_5708 : ExponentCertificate 5708 1520 1519 := by decide
private theorem cert_5709 : ExponentCertificate 5709 1520 1519 := by decide
private theorem cert_5710 : ExponentCertificate 5710 1520 1519 := by decide
private theorem cert_5711 : ExponentCertificate 5711 1520 1520 := by decide
private theorem cert_5712 : ExponentCertificate 5712 1521 1520 := by decide
private theorem cert_5713 : ExponentCertificate 5713 1521 1520 := by decide
private theorem cert_5714 : ExponentCertificate 5714 1521 1520 := by decide
private theorem suffix_5715 : 1521 < digitSum ((5715 : ℕ) ^ 1521 % 10 ^ 381) := by
  have hmod : (5715 : ℕ) ^ 1521 % 10 ^ 381 = 765482633775545479379536307000788662200429177716408451467161957558026432641893122067054412476883750560297043349325244127465242396568808756291663573346310550977461919675479977859020410560539360123174836746667851233016645128726784337606082581769430675186421505080665752827792023953684982101216883263477460841166130752497601061943294861535688582143688307724005426280200481414794921875 := by
    have h1 : (5715 : ℕ) ^ 1 % 10 ^ 381 = 5715 := by decide
    have h2 : (5715 : ℕ) ^ 2 % 10 ^ 381 = 32661225 := by
      have step := pow_mod_double (k := 5715) (e := 1) (m := 10 ^ 381) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (5715 : ℕ) ^ 5 % 10 ^ 381 = 6096508359731071875 := by
      have step := pow_mod_double_add_one (k := 5715) (e := 2) (m := 10 ^ 381) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (5715 : ℕ) ^ 11 % 10 ^ 381 = 212411772040247876177305748402617529296875 := by
      have step := pow_mod_double_add_one (k := 5715) (e := 5) (m := 10 ^ 381) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h23 : (5715 : ℕ) ^ 23 % 10 ^ 381 = 257853718550805081008061765464280844354902984097715064020023759802665793895721435546875 := by
      have step := pow_mod_double_add_one (k := 5715) (e := 11) (m := 10 ^ 381) h11
      have he : 2 * 11 + 1 = 23 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h47 : (5715 : ℕ) ^ 47 % 10 ^ 381 = 379982007074280629090695965255558839850329600698610730064179935254438928318795425013433679083719679809561322494612638574509180520389559377598521194840941461734473705291748046875 := by
      have step := pow_mod_double_add_one (k := 5715) (e := 23) (m := 10 ^ 381) h23
      have he : 2 * 23 + 1 = 47 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h95 : (5715 : ℕ) ^ 95 % 10 ^ 381 = 825167851376635307905626021018782831545065759222483100844582525519273952992554365486780970674750994886703586108690297108120196830471633502278058739250386904632312389781530603292910970595061353320595029517174304028822953843560654392837472740089646755430884930777200504923966794193823713612769763294004567661747617172800228768636543463799171149730682373046875 := by
      have step := pow_mod_double_add_one (k := 5715) (e := 47) (m := 10 ^ 381) h47
      have he : 2 * 47 + 1 = 95 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h190 : (5715 : ℕ) ^ 190 % 10 ^ 381 = 172007091933560913757740386514971411571465071108702749518828223488523685647841201104595951967972895530583637095898181035300061421901554611280114683549147606486162882895687270434579201668918108206569722717025143160090896808853020239613651900386248248400688237086940357215856104864265369719088718268492366950274298659415404197399559108237429051746492092433982179500162601470947265625 := by
      have step := pow_mod_double (k := 5715) (e := 95) (m := 10 ^ 381) h95
      have he : 2 * 95 = 190 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h380 : (5715 : ℕ) ^ 380 % 10 ^ 381 = 820647443314775351336010644675562837924205643281270581399463765508756989911578028173477745908821112267600116357981593095726309574637199937274691811330412535261090910180106994517496461717167290182317328868221164791917692498894320396381344312986426313742991315111454637645215212640324025878764581656445882794669821085715526932136873244908099357675101970244213589467108249664306640625 := by
      have step := pow_mod_double (k := 5715) (e := 190) (m := 10 ^ 381) h190
      have he : 2 * 190 = 380 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h760 : (5715 : ℕ) ^ 760 % 10 ^ 381 = 818273877614331068072783685676616398898780497842258556366622758765822139600761397935613531872483971331796136768424331930089705278565828939880255055160841824155529073352727257709497029497599695523573746304346177203018632965361482714082758953893805141683063456551274360357804484565191613975720336848833045751332209417801745924948863788444945212285919211581131094135344028472900390625 := by
      have step := pow_mod_double (k := 5715) (e := 380) (m := 10 ^ 381) h380
      have he : 2 * 380 = 760 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1521 : (5715 : ℕ) ^ 1521 % 10 ^ 381 = 765482633775545479379536307000788662200429177716408451467161957558026432641893122067054412476883750560297043349325244127465242396568808756291663573346310550977461919675479977859020410560539360123174836746667851233016645128726784337606082581769430675186421505080665752827792023953684982101216883263477460841166130752497601061943294861535688582143688307724005426280200481414794921875 := by
      have step := pow_mod_double_add_one (k := 5715) (e := 760) (m := 10 ^ 381) h760
      have he : 2 * 760 + 1 = 1521 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1521
  rw [hmod]
  decide
private theorem cert_5715 : ExponentCertificate 5715 1521 1521 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5715) (by decide) (by decide) (by decide) suffix_5715
private theorem cert_5716 : ExponentCertificate 5716 1522 1521 := by decide
private theorem cert_5717 : ExponentCertificate 5717 1522 1521 := by decide
private theorem cert_5718 : ExponentCertificate 5718 1522 1521 := by decide
private theorem cert_5719 : ExponentCertificate 5719 1522 1522 := by decide
private theorem cert_5720 : ExponentCertificate 5720 1523 1522 := by decide
private theorem cert_5721 : ExponentCertificate 5721 1523 1522 := by decide
private theorem cert_5722 : ExponentCertificate 5722 1523 1522 := by decide
private theorem cert_5723 : ExponentCertificate 5723 1523 1523 := by decide
private theorem cert_5724 : ExponentCertificate 5724 1524 1523 := by decide
private theorem cert_5725 : ExponentCertificate 5725 1524 1523 := by decide
private theorem cert_5726 : ExponentCertificate 5726 1524 1523 := by decide
private theorem cert_5727 : ExponentCertificate 5727 1524 1523 := by decide
private theorem cert_5728 : ExponentCertificate 5728 1524 1524 := by decide
private theorem cert_5729 : ExponentCertificate 5729 1525 1524 := by decide
private theorem cert_5730 : ExponentCertificate 5730 1525 1524 := by decide
private theorem cert_5731 : ExponentCertificate 5731 1525 1524 := by decide
private theorem cert_5732 : ExponentCertificate 5732 1525 1525 := by decide
private theorem cert_5733 : ExponentCertificate 5733 1526 1525 := by decide
private theorem cert_5734 : ExponentCertificate 5734 1526 1525 := by decide
private theorem cert_5735 : ExponentCertificate 5735 1526 1525 := by decide
private theorem cert_5736 : ExponentCertificate 5736 1526 1526 := by decide
private theorem cert_5737 : ExponentCertificate 5737 1527 1526 := by decide
private theorem cert_5738 : ExponentCertificate 5738 1527 1526 := by decide
private theorem cert_5739 : ExponentCertificate 5739 1527 1526 := by decide
private theorem cert_5740 : ExponentCertificate 5740 1527 1527 := by decide
private theorem cert_5741 : ExponentCertificate 5741 1528 1527 := by decide
private theorem cert_5742 : ExponentCertificate 5742 1528 1527 := by decide
private theorem cert_5743 : ExponentCertificate 5743 1528 1527 := by decide
private theorem cert_5744 : ExponentCertificate 5744 1528 1527 := by decide
private theorem cert_5745 : ExponentCertificate 5745 1528 1528 := by decide
private theorem cert_5746 : ExponentCertificate 5746 1529 1528 := by decide
private theorem cert_5747 : ExponentCertificate 5747 1529 1528 := by decide
private theorem cert_5748 : ExponentCertificate 5748 1529 1528 := by decide
private theorem cert_5749 : ExponentCertificate 5749 1529 1529 := by decide
private theorem cert_5750 : ExponentCertificate 5750 1530 1529 := by decide
private theorem cert_5751 : ExponentCertificate 5751 1530 1529 := by decide
private theorem cert_5752 : ExponentCertificate 5752 1530 1529 := by decide
private theorem cert_5753 : ExponentCertificate 5753 1530 1530 := by decide
private theorem cert_5754 : ExponentCertificate 5754 1531 1530 := by decide
private theorem cert_5755 : ExponentCertificate 5755 1531 1530 := by decide
private theorem cert_5756 : ExponentCertificate 5756 1531 1530 := by decide
private theorem cert_5757 : ExponentCertificate 5757 1531 1531 := by decide
private theorem cert_5758 : ExponentCertificate 5758 1532 1531 := by decide
private theorem cert_5759 : ExponentCertificate 5759 1532 1531 := by decide
private theorem cert_5760 : ExponentCertificate 5760 1532 1531 := by decide
private theorem cert_5761 : ExponentCertificate 5761 1532 1531 := by decide
private theorem cert_5762 : ExponentCertificate 5762 1532 1532 := by decide
private theorem cert_5763 : ExponentCertificate 5763 1533 1532 := by decide
private theorem cert_5764 : ExponentCertificate 5764 1533 1532 := by decide
private theorem cert_5765 : ExponentCertificate 5765 1533 1532 := by decide
private theorem cert_5766 : ExponentCertificate 5766 1533 1533 := by decide
private theorem cert_5767 : ExponentCertificate 5767 1534 1533 := by decide
private theorem cert_5768 : ExponentCertificate 5768 1534 1533 := by decide
private theorem cert_5769 : ExponentCertificate 5769 1534 1533 := by decide
private theorem cert_5770 : ExponentCertificate 5770 1534 1534 := by decide
private theorem cert_5771 : ExponentCertificate 5771 1535 1534 := by decide
private theorem cert_5772 : ExponentCertificate 5772 1535 1534 := by decide
private theorem cert_5773 : ExponentCertificate 5773 1535 1534 := by decide
private theorem cert_5774 : ExponentCertificate 5774 1535 1535 := by decide
private theorem cert_5775 : ExponentCertificate 5775 1536 1535 := by decide
private theorem cert_5776 : ExponentCertificate 5776 1536 1535 := by decide
private theorem cert_5777 : ExponentCertificate 5777 1536 1535 := by decide
private theorem cert_5778 : ExponentCertificate 5778 1536 1535 := by decide
private theorem cert_5779 : ExponentCertificate 5779 1536 1536 := by decide
private theorem cert_5780 : ExponentCertificate 5780 1537 1536 := by decide
private theorem cert_5781 : ExponentCertificate 5781 1537 1536 := by decide
private theorem cert_5782 : ExponentCertificate 5782 1537 1536 := by decide
private theorem cert_5783 : ExponentCertificate 5783 1537 1537 := by decide
private theorem cert_5784 : ExponentCertificate 5784 1538 1537 := by decide
private theorem cert_5785 : ExponentCertificate 5785 1538 1537 := by decide
private theorem cert_5786 : ExponentCertificate 5786 1538 1537 := by decide
private theorem cert_5787 : ExponentCertificate 5787 1538 1538 := by decide
private theorem cert_5788 : ExponentCertificate 5788 1539 1538 := by decide
private theorem cert_5789 : ExponentCertificate 5789 1539 1538 := by decide
private theorem cert_5790 : ExponentCertificate 5790 1539 1538 := by decide
private theorem cert_5791 : ExponentCertificate 5791 1539 1539 := by decide
private theorem cert_5792 : ExponentCertificate 5792 1540 1539 := by decide
private theorem cert_5793 : ExponentCertificate 5793 1540 1539 := by decide
private theorem cert_5794 : ExponentCertificate 5794 1540 1539 := by decide
private theorem cert_5795 : ExponentCertificate 5795 1540 1539 := by decide
private theorem cert_5796 : ExponentCertificate 5796 1540 1540 := by decide
private theorem cert_5797 : ExponentCertificate 5797 1541 1540 := by decide
private theorem cert_5798 : ExponentCertificate 5798 1541 1540 := by decide
private theorem cert_5799 : ExponentCertificate 5799 1541 1540 := by decide
private theorem cert_5800 : ExponentCertificate 5800 1541 1541 := by decide

private theorem certificates_5701_5800 {k : ℕ} (hlo : 5701 ≤ k) (hhi : k ≤ 5800) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1518, 1517, cert_5701⟩
  · exact ⟨1518, 1518, cert_5702⟩
  · exact ⟨1519, 1518, cert_5703⟩
  · exact ⟨1519, 1518, cert_5704⟩
  · exact ⟨1519, 1518, cert_5705⟩
  · exact ⟨1519, 1519, cert_5706⟩
  · exact ⟨1520, 1519, cert_5707⟩
  · exact ⟨1520, 1519, cert_5708⟩
  · exact ⟨1520, 1519, cert_5709⟩
  · exact ⟨1520, 1519, cert_5710⟩
  · exact ⟨1520, 1520, cert_5711⟩
  · exact ⟨1521, 1520, cert_5712⟩
  · exact ⟨1521, 1520, cert_5713⟩
  · exact ⟨1521, 1520, cert_5714⟩
  · exact ⟨1521, 1521, cert_5715⟩
  · exact ⟨1522, 1521, cert_5716⟩
  · exact ⟨1522, 1521, cert_5717⟩
  · exact ⟨1522, 1521, cert_5718⟩
  · exact ⟨1522, 1522, cert_5719⟩
  · exact ⟨1523, 1522, cert_5720⟩
  · exact ⟨1523, 1522, cert_5721⟩
  · exact ⟨1523, 1522, cert_5722⟩
  · exact ⟨1523, 1523, cert_5723⟩
  · exact ⟨1524, 1523, cert_5724⟩
  · exact ⟨1524, 1523, cert_5725⟩
  · exact ⟨1524, 1523, cert_5726⟩
  · exact ⟨1524, 1523, cert_5727⟩
  · exact ⟨1524, 1524, cert_5728⟩
  · exact ⟨1525, 1524, cert_5729⟩
  · exact ⟨1525, 1524, cert_5730⟩
  · exact ⟨1525, 1524, cert_5731⟩
  · exact ⟨1525, 1525, cert_5732⟩
  · exact ⟨1526, 1525, cert_5733⟩
  · exact ⟨1526, 1525, cert_5734⟩
  · exact ⟨1526, 1525, cert_5735⟩
  · exact ⟨1526, 1526, cert_5736⟩
  · exact ⟨1527, 1526, cert_5737⟩
  · exact ⟨1527, 1526, cert_5738⟩
  · exact ⟨1527, 1526, cert_5739⟩
  · exact ⟨1527, 1527, cert_5740⟩
  · exact ⟨1528, 1527, cert_5741⟩
  · exact ⟨1528, 1527, cert_5742⟩
  · exact ⟨1528, 1527, cert_5743⟩
  · exact ⟨1528, 1527, cert_5744⟩
  · exact ⟨1528, 1528, cert_5745⟩
  · exact ⟨1529, 1528, cert_5746⟩
  · exact ⟨1529, 1528, cert_5747⟩
  · exact ⟨1529, 1528, cert_5748⟩
  · exact ⟨1529, 1529, cert_5749⟩
  · exact ⟨1530, 1529, cert_5750⟩
  · exact ⟨1530, 1529, cert_5751⟩
  · exact ⟨1530, 1529, cert_5752⟩
  · exact ⟨1530, 1530, cert_5753⟩
  · exact ⟨1531, 1530, cert_5754⟩
  · exact ⟨1531, 1530, cert_5755⟩
  · exact ⟨1531, 1530, cert_5756⟩
  · exact ⟨1531, 1531, cert_5757⟩
  · exact ⟨1532, 1531, cert_5758⟩
  · exact ⟨1532, 1531, cert_5759⟩
  · exact ⟨1532, 1531, cert_5760⟩
  · exact ⟨1532, 1531, cert_5761⟩
  · exact ⟨1532, 1532, cert_5762⟩
  · exact ⟨1533, 1532, cert_5763⟩
  · exact ⟨1533, 1532, cert_5764⟩
  · exact ⟨1533, 1532, cert_5765⟩
  · exact ⟨1533, 1533, cert_5766⟩
  · exact ⟨1534, 1533, cert_5767⟩
  · exact ⟨1534, 1533, cert_5768⟩
  · exact ⟨1534, 1533, cert_5769⟩
  · exact ⟨1534, 1534, cert_5770⟩
  · exact ⟨1535, 1534, cert_5771⟩
  · exact ⟨1535, 1534, cert_5772⟩
  · exact ⟨1535, 1534, cert_5773⟩
  · exact ⟨1535, 1535, cert_5774⟩
  · exact ⟨1536, 1535, cert_5775⟩
  · exact ⟨1536, 1535, cert_5776⟩
  · exact ⟨1536, 1535, cert_5777⟩
  · exact ⟨1536, 1535, cert_5778⟩
  · exact ⟨1536, 1536, cert_5779⟩
  · exact ⟨1537, 1536, cert_5780⟩
  · exact ⟨1537, 1536, cert_5781⟩
  · exact ⟨1537, 1536, cert_5782⟩
  · exact ⟨1537, 1537, cert_5783⟩
  · exact ⟨1538, 1537, cert_5784⟩
  · exact ⟨1538, 1537, cert_5785⟩
  · exact ⟨1538, 1537, cert_5786⟩
  · exact ⟨1538, 1538, cert_5787⟩
  · exact ⟨1539, 1538, cert_5788⟩
  · exact ⟨1539, 1538, cert_5789⟩
  · exact ⟨1539, 1538, cert_5790⟩
  · exact ⟨1539, 1539, cert_5791⟩
  · exact ⟨1540, 1539, cert_5792⟩
  · exact ⟨1540, 1539, cert_5793⟩
  · exact ⟨1540, 1539, cert_5794⟩
  · exact ⟨1540, 1539, cert_5795⟩
  · exact ⟨1540, 1540, cert_5796⟩
  · exact ⟨1541, 1540, cert_5797⟩
  · exact ⟨1541, 1540, cert_5798⟩
  · exact ⟨1541, 1540, cert_5799⟩
  · exact ⟨1541, 1541, cert_5800⟩

theorem no_fixed_digitCount_5701_5800 {n : ℕ} (hn : a n = n)
    (hlo : 5701 ≤ digitCount n) (hhi : digitCount n ≤ 5800) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_5701_5800 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_5701_5800
end OeisA113010
