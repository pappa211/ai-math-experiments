import A113010.SuffixFiniteCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2100
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_1601 : ExponentCertificate 1601 500 499 := by decide
private theorem cert_1602 : ExponentCertificate 1602 500 499 := by decide
private theorem cert_1603 : ExponentCertificate 1603 500 500 := by decide
private theorem cert_1604 : ExponentCertificate 1604 501 500 := by decide
private theorem cert_1605 : ExponentCertificate 1605 501 500 := by decide
private theorem cert_1606 : ExponentCertificate 1606 501 500 := by decide
private theorem cert_1607 : ExponentCertificate 1607 501 501 := by decide
private theorem cert_1608 : ExponentCertificate 1608 502 501 := by decide
private theorem cert_1609 : ExponentCertificate 1609 502 501 := by decide
private theorem cert_1610 : ExponentCertificate 1610 502 502 := by decide
private theorem cert_1611 : ExponentCertificate 1611 503 502 := by decide
private theorem cert_1612 : ExponentCertificate 1612 503 502 := by decide
private theorem cert_1613 : ExponentCertificate 1613 503 502 := by decide
private theorem cert_1614 : ExponentCertificate 1614 503 503 := by decide
private theorem cert_1615 : ExponentCertificate 1615 504 503 := by decide
private theorem cert_1616 : ExponentCertificate 1616 504 503 := by decide
private theorem cert_1617 : ExponentCertificate 1617 504 503 := by decide
private theorem cert_1618 : ExponentCertificate 1618 504 504 := by decide
private theorem cert_1619 : ExponentCertificate 1619 505 504 := by decide
private theorem cert_1620 : ExponentCertificate 1620 505 504 := by decide
private theorem suffix_1621 : 505 < digitSum ((1621 : ℕ) ^ 505 % 10 ^ 127) := by
  have hmod : (1621 : ℕ) ^ 505 % 10 ^ 127 = 7390623879231286608467668491963000361992924106316671188816748852553456365291576404302299684494092771902946718767998831875242101 := by
    have h1 : (1621 : ℕ) ^ 1 % 10 ^ 127 = 1621 := by decide
    have h3 : (1621 : ℕ) ^ 3 % 10 ^ 127 = 4259406061 := by
      have step := pow_mod_double_add_one (k := 1621) (e := 1) (m := 10 ^ 127) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1621 : ℕ) ^ 7 % 10 ^ 127 = 29409057327815811403741 := by
      have step := pow_mod_double_add_one (k := 1621) (e := 3) (m := 10 ^ 127) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h15 : (1621 : ℕ) ^ 15 % 10 ^ 127 = 1401990990368336892123340825013449422533156826301 := by
      have step := pow_mod_double_add_one (k := 1621) (e := 7) (m := 10 ^ 127) h7
      have he : 2 * 7 + 1 = 15 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h31 : (1621 : ℕ) ^ 31 % 10 ^ 127 = 3186203132796937965422551080149740955707490999388281924409867644210865699899820735807549944940356221 := by
      have step := pow_mod_double_add_one (k := 1621) (e := 15) (m := 10 ^ 127) h15
      have he : 2 * 15 + 1 = 31 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h63 : (1621 : ℕ) ^ 63 % 10 ^ 127 = 3234504798817420184378417506985685195818666672495911779592824118584457988265958089282239667983223204213976478487847075282763261 := by
      have step := pow_mod_double_add_one (k := 1621) (e := 31) (m := 10 ^ 127) h31
      have he : 2 * 31 + 1 = 63 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h126 : (1621 : ℕ) ^ 126 % 10 ^ 127 = 25119132610561676916864257362469299857838643125826799827088430314927576784100611438103655089024330255095600672578211771354121 := by
      have step := pow_mod_double (k := 1621) (e := 63) (m := 10 ^ 127) h63
      have he : 2 * 63 = 126 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h252 : (1621 : ℕ) ^ 252 % 10 ^ 127 = 524497894134344863751821345987536017040972862766424294277829934154215984784445806252413823039370595567487671094302241983682641 := by
      have step := pow_mod_double (k := 1621) (e := 126) (m := 10 ^ 127) h126
      have he : 2 * 126 = 252 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h505 : (1621 : ℕ) ^ 505 % 10 ^ 127 = 7390623879231286608467668491963000361992924106316671188816748852553456365291576404302299684494092771902946718767998831875242101 := by
      have step := pow_mod_double_add_one (k := 1621) (e := 252) (m := 10 ^ 127) h252
      have he : 2 * 252 + 1 = 505 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h505
  rw [hmod]
  decide
private theorem cert_1621 : ExponentCertificate 1621 505 505 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1621
private theorem cert_1622 : ExponentCertificate 1622 505 505 := by decide
private theorem cert_1623 : ExponentCertificate 1623 506 505 := by decide
private theorem cert_1624 : ExponentCertificate 1624 506 505 := by decide
private theorem cert_1625 : ExponentCertificate 1625 506 506 := by decide
private theorem cert_1626 : ExponentCertificate 1626 507 506 := by decide
private theorem cert_1627 : ExponentCertificate 1627 507 506 := by decide
private theorem cert_1628 : ExponentCertificate 1628 507 506 := by decide
private theorem cert_1629 : ExponentCertificate 1629 507 507 := by decide
private theorem cert_1630 : ExponentCertificate 1630 508 507 := by decide
private theorem cert_1631 : ExponentCertificate 1631 508 507 := by decide
private theorem cert_1632 : ExponentCertificate 1632 508 507 := by decide
private theorem suffix_1633 : 508 < digitSum ((1633 : ℕ) ^ 508 % 10 ^ 127) := by
  have hmod : (1633 : ℕ) ^ 508 % 10 ^ 127 = 4105490109023963379758630060464334477249910950081475075226555587906853082265503535784350339147769593577686337221645337301683841 := by
    have h1 : (1633 : ℕ) ^ 1 % 10 ^ 127 = 1633 := by decide
    have h3 : (1633 : ℕ) ^ 3 % 10 ^ 127 = 4354703137 := by
      have step := pow_mod_double_add_one (k := 1633) (e := 1) (m := 10 ^ 127) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1633 : ℕ) ^ 7 % 10 ^ 127 = 30967296558812347375777 := by
      have step := pow_mod_double_add_one (k := 1633) (e := 3) (m := 10 ^ 127) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h15 : (1633 : ℕ) ^ 15 % 10 ^ 127 = 1566003653911616907184838551177234150202895639457 := by
      have step := pow_mod_double_add_one (k := 1633) (e := 7) (m := 10 ^ 127) h7
      have he : 2 * 7 + 1 = 15 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h31 : (1633 : ℕ) ^ 31 % 10 ^ 127 = 4004716036157386019823767551758516980531423274268416767005620985793437522821123543446215839271168417 := by
      have step := pow_mod_double_add_one (k := 1633) (e := 15) (m := 10 ^ 127) h15
      have he : 2 * 15 + 1 = 31 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h63 : (1633 : ℕ) ^ 63 % 10 ^ 127 = 3990045762768511546233114459497770487494890148003380585290710847807096529642249792727586254731374214978259823669377405740856737 := by
      have step := pow_mod_double_add_one (k := 1633) (e := 31) (m := 10 ^ 127) h31
      have he : 2 * 31 + 1 = 63 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h127 : (1633 : ℕ) ^ 127 % 10 ^ 127 = 4632822024157337604727519139819678545994837661276213725997630516706882847626643520400497008661223963537819740679160880282946977 := by
      have step := pow_mod_double_add_one (k := 1633) (e := 63) (m := 10 ^ 127) h63
      have he : 2 * 63 + 1 = 127 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h254 : (1633 : ℕ) ^ 254 % 10 ^ 127 = 3924227388869390198008333176835231025998094208790844333897337774564559628201475206437007011466770542514559395865378511793438529 := by
      have step := pow_mod_double (k := 1633) (e := 127) (m := 10 ^ 127) h127
      have he : 2 * 127 = 254 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h508 : (1633 : ℕ) ^ 508 % 10 ^ 127 = 4105490109023963379758630060464334477249910950081475075226555587906853082265503535784350339147769593577686337221645337301683841 := by
      have step := pow_mod_double (k := 1633) (e := 254) (m := 10 ^ 127) h254
      have he : 2 * 254 = 508 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h508
  rw [hmod]
  decide
private theorem cert_1633 : ExponentCertificate 1633 508 508 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1633
private theorem cert_1634 : ExponentCertificate 1634 509 508 := by decide
private theorem cert_1635 : ExponentCertificate 1635 509 508 := by decide
private theorem cert_1636 : ExponentCertificate 1636 509 509 := by decide
private theorem cert_1637 : ExponentCertificate 1637 510 509 := by decide
private theorem cert_1638 : ExponentCertificate 1638 510 509 := by decide
private theorem cert_1639 : ExponentCertificate 1639 510 509 := by decide
private theorem cert_1640 : ExponentCertificate 1640 510 510 := by decide
private theorem cert_1641 : ExponentCertificate 1641 511 510 := by decide
private theorem cert_1642 : ExponentCertificate 1642 511 510 := by decide
private theorem cert_1643 : ExponentCertificate 1643 511 510 := by decide
private theorem cert_1644 : ExponentCertificate 1644 511 511 := by decide
private theorem cert_1645 : ExponentCertificate 1645 512 511 := by decide
private theorem cert_1646 : ExponentCertificate 1646 512 511 := by decide
private theorem cert_1647 : ExponentCertificate 1647 512 512 := by decide
private theorem cert_1648 : ExponentCertificate 1648 512 512 := by decide
private theorem cert_1649 : ExponentCertificate 1649 513 512 := by decide
private theorem cert_1650 : ExponentCertificate 1650 513 512 := by decide
private theorem cert_1651 : ExponentCertificate 1651 513 513 := by decide
private theorem cert_1652 : ExponentCertificate 1652 514 513 := by decide
private theorem cert_1653 : ExponentCertificate 1653 514 513 := by decide
private theorem cert_1654 : ExponentCertificate 1654 514 513 := by decide
private theorem suffix_1655 : 514 < digitSum ((1655 : ℕ) ^ 514 % 10 ^ 129) := by
  have hmod : (1655 : ℕ) ^ 514 % 10 ^ 129 = 304313442807773733616670562316665086754942551091180035529860512644523220748373610366533693893931200591396191157400608062744140625 := by
    have h1 : (1655 : ℕ) ^ 1 % 10 ^ 129 = 1655 := by decide
    have h2 : (1655 : ℕ) ^ 2 % 10 ^ 129 = 2739025 := by
      have step := pow_mod_double (k := 1655) (e := 1) (m := 10 ^ 129) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1655 : ℕ) ^ 4 % 10 ^ 129 = 7502257950625 := by
      have step := pow_mod_double (k := 1655) (e := 2) (m := 10 ^ 129) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (1655 : ℕ) ^ 8 % 10 ^ 129 = 56283874357716024937890625 := by
      have step := pow_mod_double (k := 1655) (e := 4) (m := 10 ^ 129) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (1655 : ℕ) ^ 16 % 10 ^ 129 = 3167874512715163478730942023928087523388824462890625 := by
      have step := pow_mod_double (k := 1655) (e := 8) (m := 10 ^ 129) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h32 : (1655 : ℕ) ^ 32 % 10 ^ 129 = 10035428928310334456881469488013507737129138595841006534519803405251825524911865615285933017730712890625 := by
      have step := pow_mod_double (k := 1655) (e := 16) (m := 10 ^ 129) h16
      have he : 2 * 16 = 32 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h64 : (1655 : ℕ) ^ 64 % 10 ^ 129 = 854190817721917153180556249515853751795295797466008310269364186369842779428439127204484605793144424978891038335859775543212890625 := by
      have step := pow_mod_double (k := 1655) (e := 32) (m := 10 ^ 129) h32
      have he : 2 * 32 = 64 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h128 : (1655 : ℕ) ^ 128 % 10 ^ 129 = 100299939678399173828026618764340163199664574206327512334496170438258571270570860962099458968399545710781239904463291168212890625 := by
      have step := pow_mod_double (k := 1655) (e := 64) (m := 10 ^ 129) h64
      have he : 2 * 64 = 128 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h257 : (1655 : ℕ) ^ 257 % 10 ^ 129 = 837431300186868680612736542020018408391920868992280717389672978465904921443332467804305206671156014408552437089383602142333984375 := by
      have step := pow_mod_double_add_one (k := 1655) (e := 128) (m := 10 ^ 129) h128
      have he : 2 * 128 + 1 = 257 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h514 : (1655 : ℕ) ^ 514 % 10 ^ 129 = 304313442807773733616670562316665086754942551091180035529860512644523220748373610366533693893931200591396191157400608062744140625 := by
      have step := pow_mod_double (k := 1655) (e := 257) (m := 10 ^ 129) h257
      have he : 2 * 257 = 514 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h514
  rw [hmod]
  decide
private theorem cert_1655 : ExponentCertificate 1655 514 514 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1655
private theorem cert_1656 : ExponentCertificate 1656 515 514 := by decide
private theorem cert_1657 : ExponentCertificate 1657 515 514 := by decide
private theorem cert_1658 : ExponentCertificate 1658 515 514 := by decide
private theorem cert_1659 : ExponentCertificate 1659 515 515 := by decide
private theorem cert_1660 : ExponentCertificate 1660 516 515 := by decide
private theorem cert_1661 : ExponentCertificate 1661 516 515 := by decide
private theorem cert_1662 : ExponentCertificate 1662 516 516 := by decide
private theorem cert_1663 : ExponentCertificate 1663 517 516 := by decide
private theorem cert_1664 : ExponentCertificate 1664 517 516 := by decide
private theorem cert_1665 : ExponentCertificate 1665 517 516 := by decide
private theorem cert_1666 : ExponentCertificate 1666 517 517 := by decide
private theorem cert_1667 : ExponentCertificate 1667 518 517 := by decide
private theorem cert_1668 : ExponentCertificate 1668 518 517 := by decide
private theorem cert_1669 : ExponentCertificate 1669 518 517 := by decide
private theorem cert_1670 : ExponentCertificate 1670 518 518 := by decide
private theorem cert_1671 : ExponentCertificate 1671 519 518 := by decide
private theorem cert_1672 : ExponentCertificate 1672 519 518 := by decide
private theorem cert_1673 : ExponentCertificate 1673 519 519 := by decide
private theorem cert_1674 : ExponentCertificate 1674 519 519 := by decide
private theorem cert_1675 : ExponentCertificate 1675 520 519 := by decide
private theorem cert_1676 : ExponentCertificate 1676 520 519 := by decide
private theorem cert_1677 : ExponentCertificate 1677 520 520 := by decide
private theorem cert_1678 : ExponentCertificate 1678 521 520 := by decide
private theorem cert_1679 : ExponentCertificate 1679 521 520 := by decide
private theorem cert_1680 : ExponentCertificate 1680 521 520 := by decide
private theorem cert_1681 : ExponentCertificate 1681 521 521 := by decide
private theorem cert_1682 : ExponentCertificate 1682 522 521 := by decide
private theorem cert_1683 : ExponentCertificate 1683 522 521 := by decide
private theorem cert_1684 : ExponentCertificate 1684 522 521 := by decide
private theorem cert_1685 : ExponentCertificate 1685 522 522 := by decide
private theorem cert_1686 : ExponentCertificate 1686 523 522 := by decide
private theorem cert_1687 : ExponentCertificate 1687 523 522 := by decide
private theorem cert_1688 : ExponentCertificate 1688 523 523 := by decide
private theorem cert_1689 : ExponentCertificate 1689 523 523 := by decide
private theorem cert_1690 : ExponentCertificate 1690 524 523 := by decide
private theorem cert_1691 : ExponentCertificate 1691 524 523 := by decide
private theorem cert_1692 : ExponentCertificate 1692 524 524 := by decide
private theorem cert_1693 : ExponentCertificate 1693 525 524 := by decide
private theorem cert_1694 : ExponentCertificate 1694 525 524 := by decide
private theorem cert_1695 : ExponentCertificate 1695 525 524 := by decide
private theorem cert_1696 : ExponentCertificate 1696 525 525 := by decide
private theorem cert_1697 : ExponentCertificate 1697 526 525 := by decide
private theorem cert_1698 : ExponentCertificate 1698 526 525 := by decide
private theorem cert_1699 : ExponentCertificate 1699 526 525 := by decide
private theorem cert_1700 : ExponentCertificate 1700 526 526 := by decide

private theorem certificates_1601_1700 {k : ℕ} (hlo : 1601 ≤ k) (hhi : k ≤ 1700) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨500, 499, cert_1601⟩
  · exact ⟨500, 499, cert_1602⟩
  · exact ⟨500, 500, cert_1603⟩
  · exact ⟨501, 500, cert_1604⟩
  · exact ⟨501, 500, cert_1605⟩
  · exact ⟨501, 500, cert_1606⟩
  · exact ⟨501, 501, cert_1607⟩
  · exact ⟨502, 501, cert_1608⟩
  · exact ⟨502, 501, cert_1609⟩
  · exact ⟨502, 502, cert_1610⟩
  · exact ⟨503, 502, cert_1611⟩
  · exact ⟨503, 502, cert_1612⟩
  · exact ⟨503, 502, cert_1613⟩
  · exact ⟨503, 503, cert_1614⟩
  · exact ⟨504, 503, cert_1615⟩
  · exact ⟨504, 503, cert_1616⟩
  · exact ⟨504, 503, cert_1617⟩
  · exact ⟨504, 504, cert_1618⟩
  · exact ⟨505, 504, cert_1619⟩
  · exact ⟨505, 504, cert_1620⟩
  · exact ⟨505, 505, cert_1621⟩
  · exact ⟨505, 505, cert_1622⟩
  · exact ⟨506, 505, cert_1623⟩
  · exact ⟨506, 505, cert_1624⟩
  · exact ⟨506, 506, cert_1625⟩
  · exact ⟨507, 506, cert_1626⟩
  · exact ⟨507, 506, cert_1627⟩
  · exact ⟨507, 506, cert_1628⟩
  · exact ⟨507, 507, cert_1629⟩
  · exact ⟨508, 507, cert_1630⟩
  · exact ⟨508, 507, cert_1631⟩
  · exact ⟨508, 507, cert_1632⟩
  · exact ⟨508, 508, cert_1633⟩
  · exact ⟨509, 508, cert_1634⟩
  · exact ⟨509, 508, cert_1635⟩
  · exact ⟨509, 509, cert_1636⟩
  · exact ⟨510, 509, cert_1637⟩
  · exact ⟨510, 509, cert_1638⟩
  · exact ⟨510, 509, cert_1639⟩
  · exact ⟨510, 510, cert_1640⟩
  · exact ⟨511, 510, cert_1641⟩
  · exact ⟨511, 510, cert_1642⟩
  · exact ⟨511, 510, cert_1643⟩
  · exact ⟨511, 511, cert_1644⟩
  · exact ⟨512, 511, cert_1645⟩
  · exact ⟨512, 511, cert_1646⟩
  · exact ⟨512, 512, cert_1647⟩
  · exact ⟨512, 512, cert_1648⟩
  · exact ⟨513, 512, cert_1649⟩
  · exact ⟨513, 512, cert_1650⟩
  · exact ⟨513, 513, cert_1651⟩
  · exact ⟨514, 513, cert_1652⟩
  · exact ⟨514, 513, cert_1653⟩
  · exact ⟨514, 513, cert_1654⟩
  · exact ⟨514, 514, cert_1655⟩
  · exact ⟨515, 514, cert_1656⟩
  · exact ⟨515, 514, cert_1657⟩
  · exact ⟨515, 514, cert_1658⟩
  · exact ⟨515, 515, cert_1659⟩
  · exact ⟨516, 515, cert_1660⟩
  · exact ⟨516, 515, cert_1661⟩
  · exact ⟨516, 516, cert_1662⟩
  · exact ⟨517, 516, cert_1663⟩
  · exact ⟨517, 516, cert_1664⟩
  · exact ⟨517, 516, cert_1665⟩
  · exact ⟨517, 517, cert_1666⟩
  · exact ⟨518, 517, cert_1667⟩
  · exact ⟨518, 517, cert_1668⟩
  · exact ⟨518, 517, cert_1669⟩
  · exact ⟨518, 518, cert_1670⟩
  · exact ⟨519, 518, cert_1671⟩
  · exact ⟨519, 518, cert_1672⟩
  · exact ⟨519, 519, cert_1673⟩
  · exact ⟨519, 519, cert_1674⟩
  · exact ⟨520, 519, cert_1675⟩
  · exact ⟨520, 519, cert_1676⟩
  · exact ⟨520, 520, cert_1677⟩
  · exact ⟨521, 520, cert_1678⟩
  · exact ⟨521, 520, cert_1679⟩
  · exact ⟨521, 520, cert_1680⟩
  · exact ⟨521, 521, cert_1681⟩
  · exact ⟨522, 521, cert_1682⟩
  · exact ⟨522, 521, cert_1683⟩
  · exact ⟨522, 521, cert_1684⟩
  · exact ⟨522, 522, cert_1685⟩
  · exact ⟨523, 522, cert_1686⟩
  · exact ⟨523, 522, cert_1687⟩
  · exact ⟨523, 523, cert_1688⟩
  · exact ⟨523, 523, cert_1689⟩
  · exact ⟨524, 523, cert_1690⟩
  · exact ⟨524, 523, cert_1691⟩
  · exact ⟨524, 524, cert_1692⟩
  · exact ⟨525, 524, cert_1693⟩
  · exact ⟨525, 524, cert_1694⟩
  · exact ⟨525, 524, cert_1695⟩
  · exact ⟨525, 525, cert_1696⟩
  · exact ⟨526, 525, cert_1697⟩
  · exact ⟨526, 525, cert_1698⟩
  · exact ⟨526, 525, cert_1699⟩
  · exact ⟨526, 526, cert_1700⟩

theorem no_fixed_digitCount_1601_1700 {n : ℕ} (hn : a n = n)
    (hlo : 1601 ≤ digitCount n) (hhi : digitCount n ≤ 1700) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_1601_1700 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_1601_1700
end OeisA113010
