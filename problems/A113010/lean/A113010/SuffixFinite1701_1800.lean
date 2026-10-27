import A113010.SuffixFiniteCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2100
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_1701 : ExponentCertificate 1701 527 526 := by decide
private theorem cert_1702 : ExponentCertificate 1702 527 526 := by decide
private theorem suffix_1703 : 527 < digitSum ((1703 : ℕ) ^ 527 % 10 ^ 132) := by
  have hmod : (1703 : ℕ) ^ 527 % 10 ^ 132 = 625652779747991310864318382015419930920884007059425285921262113429299682409274025354243046565606560131789692678807883396878696776087 := by
    have h1 : (1703 : ℕ) ^ 1 % 10 ^ 132 = 1703 := by decide
    have h2 : (1703 : ℕ) ^ 2 % 10 ^ 132 = 2900209 := by
      have step := pow_mod_double (k := 1703) (e := 1) (m := 10 ^ 132) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1703 : ℕ) ^ 4 % 10 ^ 132 = 8411212243681 := by
      have step := pow_mod_double (k := 1703) (e := 2) (m := 10 ^ 132) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (1703 : ℕ) ^ 8 % 10 ^ 132 = 70748491408249162124429761 := by
      have step := pow_mod_double (k := 1703) (e := 4) (m := 10 ^ 132) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (1703 : ℕ) ^ 16 % 10 ^ 132 = 5005349036543105511302898027780237327703329422517121 := by
      have step := pow_mod_double (k := 1703) (e := 8) (m := 10 ^ 132) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h32 : (1703 : ℕ) ^ 32 % 10 ^ 132 = 25053518977622994591187459091119806553550855232333356370440655948272265315985630478129400912335538128641 := by
      have step := pow_mod_double (k := 1703) (e := 16) (m := 10 ^ 132) h16
      have he : 2 * 16 = 32 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h65 : (1703 : ℕ) ^ 65 % 10 ^ 132 = 704019366615647333936878345393708406746509443657674936806016314319662954712541559339685786671995472930784651986840655904962455218343 := by
      have step := pow_mod_double_add_one (k := 1703) (e := 32) (m := 10 ^ 132) h32
      have he : 2 * 32 + 1 = 65 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h131 : (1703 : ℕ) ^ 131 % 10 ^ 132 = 593650986653056294578922089104108287366844140908547242096162855794450545068431220878016853033356664909012704941912905821081642600247 := by
      have step := pow_mod_double_add_one (k := 1703) (e := 65) (m := 10 ^ 132) h65
      have he : 2 * 65 + 1 = 131 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h263 : (1703 : ℕ) ^ 263 % 10 ^ 132 = 360896673493343004410477042246958674873871995781646221445745971636086760035498048385148417942023745783328662767693142702729917098327 := by
      have step := pow_mod_double_add_one (k := 1703) (e := 131) (m := 10 ^ 132) h131
      have he : 2 * 131 + 1 = 263 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h527 : (1703 : ℕ) ^ 527 % 10 ^ 132 = 625652779747991310864318382015419930920884007059425285921262113429299682409274025354243046565606560131789692678807883396878696776087 := by
      have step := pow_mod_double_add_one (k := 1703) (e := 263) (m := 10 ^ 132) h263
      have he : 2 * 263 + 1 = 527 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h527
  rw [hmod]
  decide
private theorem cert_1703 : ExponentCertificate 1703 527 527 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1703
private theorem cert_1704 : ExponentCertificate 1704 528 527 := by decide
private theorem cert_1705 : ExponentCertificate 1705 528 527 := by decide
private theorem cert_1706 : ExponentCertificate 1706 528 527 := by decide
private theorem cert_1707 : ExponentCertificate 1707 528 528 := by decide
private theorem cert_1708 : ExponentCertificate 1708 529 528 := by decide
private theorem cert_1709 : ExponentCertificate 1709 529 528 := by decide
private theorem cert_1710 : ExponentCertificate 1710 529 528 := by decide
private theorem cert_1711 : ExponentCertificate 1711 529 529 := by decide
private theorem cert_1712 : ExponentCertificate 1712 530 529 := by decide
private theorem cert_1713 : ExponentCertificate 1713 530 529 := by decide
private theorem cert_1714 : ExponentCertificate 1714 530 529 := by decide
private theorem cert_1715 : ExponentCertificate 1715 530 530 := by decide
private theorem cert_1716 : ExponentCertificate 1716 531 530 := by decide
private theorem cert_1717 : ExponentCertificate 1717 531 530 := by decide
private theorem cert_1718 : ExponentCertificate 1718 531 531 := by decide
private theorem cert_1719 : ExponentCertificate 1719 532 531 := by decide
private theorem cert_1720 : ExponentCertificate 1720 532 531 := by decide
private theorem cert_1721 : ExponentCertificate 1721 532 531 := by decide
private theorem cert_1722 : ExponentCertificate 1722 532 532 := by decide
private theorem cert_1723 : ExponentCertificate 1723 533 532 := by decide
private theorem cert_1724 : ExponentCertificate 1724 533 532 := by decide
private theorem cert_1725 : ExponentCertificate 1725 533 532 := by decide
private theorem cert_1726 : ExponentCertificate 1726 533 533 := by decide
private theorem cert_1727 : ExponentCertificate 1727 534 533 := by decide
private theorem cert_1728 : ExponentCertificate 1728 534 533 := by decide
private theorem cert_1729 : ExponentCertificate 1729 534 534 := by decide
private theorem cert_1730 : ExponentCertificate 1730 534 534 := by decide
private theorem cert_1731 : ExponentCertificate 1731 535 534 := by decide
private theorem cert_1732 : ExponentCertificate 1732 535 534 := by decide
private theorem cert_1733 : ExponentCertificate 1733 535 535 := by decide
private theorem cert_1734 : ExponentCertificate 1734 536 535 := by decide
private theorem cert_1735 : ExponentCertificate 1735 536 535 := by decide
private theorem cert_1736 : ExponentCertificate 1736 536 535 := by decide
private theorem cert_1737 : ExponentCertificate 1737 536 536 := by decide
private theorem cert_1738 : ExponentCertificate 1738 537 536 := by decide
private theorem cert_1739 : ExponentCertificate 1739 537 536 := by decide
private theorem cert_1740 : ExponentCertificate 1740 537 536 := by decide
private theorem cert_1741 : ExponentCertificate 1741 537 537 := by decide
private theorem cert_1742 : ExponentCertificate 1742 538 537 := by decide
private theorem cert_1743 : ExponentCertificate 1743 538 537 := by decide
private theorem suffix_1744 : 538 < digitSum ((1744 : ℕ) ^ 538 % 10 ^ 135) := by
  have hmod : (1744 : ℕ) ^ 538 % 10 ^ 135 = 640572197060170394918053286041125809535776086624677977655076564201478017725845736822001251309929361064166384867058644807077409394262016 := by
    have h1 : (1744 : ℕ) ^ 1 % 10 ^ 135 = 1744 := by decide
    have h2 : (1744 : ℕ) ^ 2 % 10 ^ 135 = 3041536 := by
      have step := pow_mod_double (k := 1744) (e := 1) (m := 10 ^ 135) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1744 : ℕ) ^ 4 % 10 ^ 135 = 9250941239296 := by
      have step := pow_mod_double (k := 1744) (e := 2) (m := 10 ^ 135) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (1744 : ℕ) ^ 8 % 10 ^ 135 = 85579913812907412334575616 := by
      have step := pow_mod_double (k := 1744) (e := 4) (m := 10 ^ 135) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (1744 : ℕ) ^ 16 % 10 ^ 135 = 7323921648224660910114677246898556353672426821779456 := by
      have step := pow_mod_double (k := 1744) (e := 8) (m := 10 ^ 135) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h33 : (1744 : ℕ) ^ 33 % 10 ^ 135 = 93547860571478205990496378859400221628012731724462261959702282892695737403506382135100525355784113575952384 := by
      have step := pow_mod_double_add_one (k := 1744) (e := 16) (m := 10 ^ 135) h16
      have he : 2 * 16 + 1 = 33 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h67 : (1744 : ℕ) ^ 67 % 10 ^ 135 = 522880756196095595420004286317449527593782393340889984928711961483976223526979600913621533648531344424155862422448268525450515934347264 := by
      have step := pow_mod_double_add_one (k := 1744) (e := 33) (m := 10 ^ 135) h33
      have he : 2 * 33 + 1 = 67 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h134 : (1744 : ℕ) ^ 134 % 10 ^ 135 = 565393759402944497684857826731897910535350277739544088111203463647322276996684855140965122398392375366964187470349231988286729744285696 := by
      have step := pow_mod_double (k := 1744) (e := 67) (m := 10 ^ 135) h67
      have he : 2 * 67 = 134 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h269 : (1744 : ℕ) ^ 269 % 10 ^ 135 = 644127503694342979548072289263252320905979742743036900605797125553502057698217737811041298959910076175851452568378441461731431236501504 := by
      have step := pow_mod_double_add_one (k := 1744) (e := 134) (m := 10 ^ 135) h134
      have he : 2 * 134 + 1 = 269 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h538 : (1744 : ℕ) ^ 538 % 10 ^ 135 = 640572197060170394918053286041125809535776086624677977655076564201478017725845736822001251309929361064166384867058644807077409394262016 := by
      have step := pow_mod_double (k := 1744) (e := 269) (m := 10 ^ 135) h269
      have he : 2 * 269 = 538 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h538
  rw [hmod]
  decide
private theorem cert_1744 : ExponentCertificate 1744 538 538 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1744
private theorem cert_1745 : ExponentCertificate 1745 538 538 := by decide
private theorem cert_1746 : ExponentCertificate 1746 539 538 := by decide
private theorem cert_1747 : ExponentCertificate 1747 539 538 := by decide
private theorem cert_1748 : ExponentCertificate 1748 539 539 := by decide
private theorem cert_1749 : ExponentCertificate 1749 540 539 := by decide
private theorem cert_1750 : ExponentCertificate 1750 540 539 := by decide
private theorem cert_1751 : ExponentCertificate 1751 540 539 := by decide
private theorem suffix_1752 : 540 < digitSum ((1752 : ℕ) ^ 540 % 10 ^ 135) := by
  have hmod : (1752 : ℕ) ^ 540 % 10 ^ 135 = 666012442501725886346861488573870543988702112077730086403723333903238199590919667071012993730454596406656121264805681677247120488267776 := by
    have h1 : (1752 : ℕ) ^ 1 % 10 ^ 135 = 1752 := by decide
    have h2 : (1752 : ℕ) ^ 2 % 10 ^ 135 = 3069504 := by
      have step := pow_mod_double (k := 1752) (e := 1) (m := 10 ^ 135) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1752 : ℕ) ^ 4 % 10 ^ 135 = 9421854806016 := by
      have step := pow_mod_double (k := 1752) (e := 2) (m := 10 ^ 135) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (1752 : ℕ) ^ 8 % 10 ^ 135 = 88771347985646796989792256 := by
      have step := pow_mod_double (k := 1752) (e := 4) (m := 10 ^ 135) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (1752 : ℕ) ^ 16 % 10 ^ 135 = 7880352223188797641538416046814412643712262037569536 := by
      have step := pow_mod_double (k := 1752) (e := 8) (m := 10 ^ 135) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h33 : (1752 : ℕ) ^ 33 % 10 ^ 135 = 108799114434977127976607676027219772280632402126100530167645541650329005815414415545798005452809229767278592 := by
      have step := pow_mod_double_add_one (k := 1752) (e := 16) (m := 10 ^ 135) h16
      have he : 2 * 16 + 1 = 33 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h67 : (1752 : ℕ) ^ 67 % 10 ^ 135 = 598092790717878391984958124405565380660014876488523306023013789498682871180715301116103219502238949132827955390637665157589195112316928 := by
      have step := pow_mod_double_add_one (k := 1752) (e := 33) (m := 10 ^ 135) h33
      have he : 2 * 33 + 1 = 67 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h135 : (1752 : ℕ) ^ 135 % 10 ^ 135 = 127062314005600844004720918381571632441886596816845782578723914419427870078882989501497650771914474868878715692601978550573576505786368 := by
      have step := pow_mod_double_add_one (k := 1752) (e := 67) (m := 10 ^ 135) h67
      have he : 2 * 67 + 1 = 135 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h270 : (1752 : ℕ) ^ 270 % 10 ^ 135 = 350394477990489986837758915366290945770483825347052061150395824368122665058158083060253448448953743532729436990844802899443786054631424 := by
      have step := pow_mod_double (k := 1752) (e := 135) (m := 10 ^ 135) h135
      have he : 2 * 135 = 270 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h540 : (1752 : ℕ) ^ 540 % 10 ^ 135 = 666012442501725886346861488573870543988702112077730086403723333903238199590919667071012993730454596406656121264805681677247120488267776 := by
      have step := pow_mod_double (k := 1752) (e := 270) (m := 10 ^ 135) h270
      have he : 2 * 270 = 540 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h540
  rw [hmod]
  decide
private theorem cert_1752 : ExponentCertificate 1752 540 540 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1752
private theorem cert_1753 : ExponentCertificate 1753 541 540 := by decide
private theorem cert_1754 : ExponentCertificate 1754 541 540 := by decide
private theorem cert_1755 : ExponentCertificate 1755 541 540 := by decide
private theorem suffix_1756 : 541 < digitSum ((1756 : ℕ) ^ 541 % 10 ^ 136) := by
  have hmod : (1756 : ℕ) ^ 541 % 10 ^ 136 = 6389870189535817827148293618268239811684581966926386408522800892008422791678341829882560782412580697532431616169442235499595318958227456 := by
    have h1 : (1756 : ℕ) ^ 1 % 10 ^ 136 = 1756 := by decide
    have h2 : (1756 : ℕ) ^ 2 % 10 ^ 136 = 3083536 := by
      have step := pow_mod_double (k := 1756) (e := 1) (m := 10 ^ 136) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1756 : ℕ) ^ 4 % 10 ^ 136 = 9508194263296 := by
      have step := pow_mod_double (k := 1756) (e := 2) (m := 10 ^ 136) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (1756 : ℕ) ^ 8 % 10 ^ 136 = 90405758148574964172783616 := by
      have step := pow_mod_double (k := 1756) (e := 4) (m := 10 ^ 136) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (1756 : ℕ) ^ 16 % 10 ^ 136 = 8173201106418628533801211527865791083833825958035456 := by
      have step := pow_mod_double (k := 1756) (e := 8) (m := 10 ^ 136) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h33 : (1756 : ℕ) ^ 33 % 10 ^ 136 = 117302935868390490009204616933641370365271595243119528824421764956039669400716791732151452205268177692655616 := by
      have step := pow_mod_double_add_one (k := 1756) (e := 16) (m := 10 ^ 136) h16
      have he : 2 * 16 + 1 = 33 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h67 : (1756 : ℕ) ^ 67 % 10 ^ 136 = 1026028217227781517639630246154583845837181503497665370685989615752218033312840980586780917200172496214006867975718165462981356852084736 := by
      have step := pow_mod_double_add_one (k := 1756) (e := 33) (m := 10 ^ 136) h33
      have he : 2 * 33 + 1 = 67 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h135 : (1756 : ℕ) ^ 135 % 10 ^ 136 = 4537544675631508526006023441533313016044429574850855299552249687645445907665076200578981526388700102712775312717279879580225893277106176 := by
      have step := pow_mod_double_add_one (k := 1756) (e := 67) (m := 10 ^ 136) h67
      have he : 2 * 67 + 1 = 135 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h270 : (1756 : ℕ) ^ 270 % 10 ^ 136 = 1819026369305609977803326934896133501318781779543354093474414185209466582419785717521440027624819376492655174012081213927618168777342976 := by
      have step := pow_mod_double (k := 1756) (e := 135) (m := 10 ^ 136) h135
      have he : 2 * 135 = 270 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h541 : (1756 : ℕ) ^ 541 % 10 ^ 136 = 6389870189535817827148293618268239811684581966926386408522800892008422791678341829882560782412580697532431616169442235499595318958227456 := by
      have step := pow_mod_double_add_one (k := 1756) (e := 270) (m := 10 ^ 136) h270
      have he : 2 * 270 + 1 = 541 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h541
  rw [hmod]
  decide
private theorem cert_1756 : ExponentCertificate 1756 541 541 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1756
private theorem cert_1757 : ExponentCertificate 1757 542 541 := by decide
private theorem cert_1758 : ExponentCertificate 1758 542 541 := by decide
private theorem cert_1759 : ExponentCertificate 1759 542 542 := by decide
private theorem cert_1760 : ExponentCertificate 1760 542 542 := by decide
private theorem cert_1761 : ExponentCertificate 1761 543 542 := by decide
private theorem cert_1762 : ExponentCertificate 1762 543 542 := by decide
private theorem cert_1763 : ExponentCertificate 1763 543 543 := by decide
private theorem cert_1764 : ExponentCertificate 1764 544 543 := by decide
private theorem cert_1765 : ExponentCertificate 1765 544 543 := by decide
private theorem cert_1766 : ExponentCertificate 1766 544 543 := by decide
private theorem cert_1767 : ExponentCertificate 1767 544 544 := by decide
private theorem cert_1768 : ExponentCertificate 1768 545 544 := by decide
private theorem cert_1769 : ExponentCertificate 1769 545 544 := by decide
private theorem cert_1770 : ExponentCertificate 1770 545 544 := by decide
private theorem cert_1771 : ExponentCertificate 1771 545 545 := by decide
private theorem cert_1772 : ExponentCertificate 1772 546 545 := by decide
private theorem cert_1773 : ExponentCertificate 1773 546 545 := by decide
private theorem cert_1774 : ExponentCertificate 1774 546 546 := by decide
private theorem cert_1775 : ExponentCertificate 1775 546 546 := by decide
private theorem cert_1776 : ExponentCertificate 1776 547 546 := by decide
private theorem cert_1777 : ExponentCertificate 1777 547 546 := by decide
private theorem cert_1778 : ExponentCertificate 1778 547 547 := by decide
private theorem cert_1779 : ExponentCertificate 1779 548 547 := by decide
private theorem cert_1780 : ExponentCertificate 1780 548 547 := by decide
private theorem cert_1781 : ExponentCertificate 1781 548 547 := by decide
private theorem cert_1782 : ExponentCertificate 1782 548 548 := by decide
private theorem cert_1783 : ExponentCertificate 1783 549 548 := by decide
private theorem cert_1784 : ExponentCertificate 1784 549 548 := by decide
private theorem cert_1785 : ExponentCertificate 1785 549 548 := by decide
private theorem cert_1786 : ExponentCertificate 1786 549 549 := by decide
private theorem cert_1787 : ExponentCertificate 1787 550 549 := by decide
private theorem cert_1788 : ExponentCertificate 1788 550 549 := by decide
private theorem cert_1789 : ExponentCertificate 1789 550 550 := by decide
private theorem suffix_1790 : 550 < digitSum ((1790 : ℕ) ^ 550 % 10 ^ 682) := by
  have hmod : (1790 : ℕ) ^ 550 % 10 ^ 682 = 7531147405154515710083828565129409075904600919689703186559858833552283268907838590058567924363267957265310219242214253629414722910010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 := by
    have h1 : (1790 : ℕ) ^ 1 % 10 ^ 682 = 1790 := by decide
    have h2 : (1790 : ℕ) ^ 2 % 10 ^ 682 = 3204100 := by
      have step := pow_mod_double (k := 1790) (e := 1) (m := 10 ^ 682) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1790 : ℕ) ^ 4 % 10 ^ 682 = 10266256810000 := by
      have step := pow_mod_double (k := 1790) (e := 2) (m := 10 ^ 682) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (1790 : ℕ) ^ 8 % 10 ^ 682 = 105396028888871376100000000 := by
      have step := pow_mod_double (k := 1790) (e := 4) (m := 10 ^ 682) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h17 : (1790 : ℕ) ^ 17 % 10 ^ 682 = 19883898000923419323191446881334695665900000000000000000 := by
      have step := pow_mod_double_add_one (k := 1790) (e := 8) (m := 10 ^ 682) h8
      have he : 2 * 8 + 1 = 17 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h34 : (1790 : ℕ) ^ 34 % 10 ^ 682 = 395369399711126351267988231768197734791737100324805605415153567304572244422810000000000000000000000000000000000 := by
      have step := pow_mod_double (k := 1790) (e := 17) (m := 10 ^ 682) h17
      have he : 2 * 17 = 34 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h68 : (1790 : ℕ) ^ 68 % 10 ^ 682 = 156316962227936397733475477734252279243880133386914957820457990327661957944444061129078956548309352081871687269585625179629352155515107399287917150048296100000000000000000000000000000000000000000000000000000000000000000000 := by
      have step := pow_mod_double (k := 1790) (e := 34) (m := 10 ^ 682) h34
      have he : 2 * 34 = 68 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h137 : (1790 : ℕ) ^ 137 % 10 ^ 682 = 43738636897504469151055101650649209062765346298951558197516152337041643035070740771874954213455169529597928931392986549486429992570626180305736954726132540793346013259448797450978554490067048772422805428695333247822158291116620227718092297720266168603628199249514806779721808807422732533741323180026898762625900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 := by
      have step := pow_mod_double_add_one (k := 1790) (e := 68) (m := 10 ^ 682) h68
      have he : 2 * 68 + 1 = 137 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h275 : (1790 : ℕ) ^ 275 % 10 ^ 682 = 6474316744265588243189997999964778096418809877831855092794394318576531525191985510750148389908724486091422364922014362102608670957299747391301379102802549870445225289833806225535178802355916177470684537227186740486408173511502410063479013742056000085173045064640698719440897343568079093152911308318712002635195257625975454904669193704731566664737858230010000625530234000800247346457593614077100081247397949900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 := by
      have step := pow_mod_double_add_one (k := 1790) (e := 137) (m := 10 ^ 682) h137
      have he : 2 * 137 + 1 = 275 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h550 : (1790 : ℕ) ^ 550 % 10 ^ 682 = 7531147405154515710083828565129409075904600919689703186559858833552283268907838590058567924363267957265310219242214253629414722910010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 := by
      have step := pow_mod_double (k := 1790) (e := 275) (m := 10 ^ 682) h275
      have he : 2 * 275 = 550 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h550
  rw [hmod]
  decide
private theorem cert_1790 : ExponentCertificate 1790 550 550 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1790
private theorem cert_1791 : ExponentCertificate 1791 551 550 := by decide
private theorem cert_1792 : ExponentCertificate 1792 551 550 := by decide
private theorem cert_1793 : ExponentCertificate 1793 551 551 := by decide
private theorem cert_1794 : ExponentCertificate 1794 552 551 := by decide
private theorem cert_1795 : ExponentCertificate 1795 552 551 := by decide
private theorem cert_1796 : ExponentCertificate 1796 552 551 := by decide
private theorem cert_1797 : ExponentCertificate 1797 552 552 := by decide
private theorem cert_1798 : ExponentCertificate 1798 553 552 := by decide
private theorem cert_1799 : ExponentCertificate 1799 553 552 := by decide
private theorem cert_1800 : ExponentCertificate 1800 553 552 := by decide

private theorem certificates_1701_1800 {k : ℕ} (hlo : 1701 ≤ k) (hhi : k ≤ 1800) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨527, 526, cert_1701⟩
  · exact ⟨527, 526, cert_1702⟩
  · exact ⟨527, 527, cert_1703⟩
  · exact ⟨528, 527, cert_1704⟩
  · exact ⟨528, 527, cert_1705⟩
  · exact ⟨528, 527, cert_1706⟩
  · exact ⟨528, 528, cert_1707⟩
  · exact ⟨529, 528, cert_1708⟩
  · exact ⟨529, 528, cert_1709⟩
  · exact ⟨529, 528, cert_1710⟩
  · exact ⟨529, 529, cert_1711⟩
  · exact ⟨530, 529, cert_1712⟩
  · exact ⟨530, 529, cert_1713⟩
  · exact ⟨530, 529, cert_1714⟩
  · exact ⟨530, 530, cert_1715⟩
  · exact ⟨531, 530, cert_1716⟩
  · exact ⟨531, 530, cert_1717⟩
  · exact ⟨531, 531, cert_1718⟩
  · exact ⟨532, 531, cert_1719⟩
  · exact ⟨532, 531, cert_1720⟩
  · exact ⟨532, 531, cert_1721⟩
  · exact ⟨532, 532, cert_1722⟩
  · exact ⟨533, 532, cert_1723⟩
  · exact ⟨533, 532, cert_1724⟩
  · exact ⟨533, 532, cert_1725⟩
  · exact ⟨533, 533, cert_1726⟩
  · exact ⟨534, 533, cert_1727⟩
  · exact ⟨534, 533, cert_1728⟩
  · exact ⟨534, 534, cert_1729⟩
  · exact ⟨534, 534, cert_1730⟩
  · exact ⟨535, 534, cert_1731⟩
  · exact ⟨535, 534, cert_1732⟩
  · exact ⟨535, 535, cert_1733⟩
  · exact ⟨536, 535, cert_1734⟩
  · exact ⟨536, 535, cert_1735⟩
  · exact ⟨536, 535, cert_1736⟩
  · exact ⟨536, 536, cert_1737⟩
  · exact ⟨537, 536, cert_1738⟩
  · exact ⟨537, 536, cert_1739⟩
  · exact ⟨537, 536, cert_1740⟩
  · exact ⟨537, 537, cert_1741⟩
  · exact ⟨538, 537, cert_1742⟩
  · exact ⟨538, 537, cert_1743⟩
  · exact ⟨538, 538, cert_1744⟩
  · exact ⟨538, 538, cert_1745⟩
  · exact ⟨539, 538, cert_1746⟩
  · exact ⟨539, 538, cert_1747⟩
  · exact ⟨539, 539, cert_1748⟩
  · exact ⟨540, 539, cert_1749⟩
  · exact ⟨540, 539, cert_1750⟩
  · exact ⟨540, 539, cert_1751⟩
  · exact ⟨540, 540, cert_1752⟩
  · exact ⟨541, 540, cert_1753⟩
  · exact ⟨541, 540, cert_1754⟩
  · exact ⟨541, 540, cert_1755⟩
  · exact ⟨541, 541, cert_1756⟩
  · exact ⟨542, 541, cert_1757⟩
  · exact ⟨542, 541, cert_1758⟩
  · exact ⟨542, 542, cert_1759⟩
  · exact ⟨542, 542, cert_1760⟩
  · exact ⟨543, 542, cert_1761⟩
  · exact ⟨543, 542, cert_1762⟩
  · exact ⟨543, 543, cert_1763⟩
  · exact ⟨544, 543, cert_1764⟩
  · exact ⟨544, 543, cert_1765⟩
  · exact ⟨544, 543, cert_1766⟩
  · exact ⟨544, 544, cert_1767⟩
  · exact ⟨545, 544, cert_1768⟩
  · exact ⟨545, 544, cert_1769⟩
  · exact ⟨545, 544, cert_1770⟩
  · exact ⟨545, 545, cert_1771⟩
  · exact ⟨546, 545, cert_1772⟩
  · exact ⟨546, 545, cert_1773⟩
  · exact ⟨546, 546, cert_1774⟩
  · exact ⟨546, 546, cert_1775⟩
  · exact ⟨547, 546, cert_1776⟩
  · exact ⟨547, 546, cert_1777⟩
  · exact ⟨547, 547, cert_1778⟩
  · exact ⟨548, 547, cert_1779⟩
  · exact ⟨548, 547, cert_1780⟩
  · exact ⟨548, 547, cert_1781⟩
  · exact ⟨548, 548, cert_1782⟩
  · exact ⟨549, 548, cert_1783⟩
  · exact ⟨549, 548, cert_1784⟩
  · exact ⟨549, 548, cert_1785⟩
  · exact ⟨549, 549, cert_1786⟩
  · exact ⟨550, 549, cert_1787⟩
  · exact ⟨550, 549, cert_1788⟩
  · exact ⟨550, 550, cert_1789⟩
  · exact ⟨550, 550, cert_1790⟩
  · exact ⟨551, 550, cert_1791⟩
  · exact ⟨551, 550, cert_1792⟩
  · exact ⟨551, 551, cert_1793⟩
  · exact ⟨552, 551, cert_1794⟩
  · exact ⟨552, 551, cert_1795⟩
  · exact ⟨552, 551, cert_1796⟩
  · exact ⟨552, 552, cert_1797⟩
  · exact ⟨553, 552, cert_1798⟩
  · exact ⟨553, 552, cert_1799⟩
  · exact ⟨553, 552, cert_1800⟩

theorem no_fixed_digitCount_1701_1800 {n : ℕ} (hn : a n = n)
    (hlo : 1701 ≤ digitCount n) (hhi : digitCount n ≤ 1800) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_1701_1800 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_1701_1800
end OeisA113010
