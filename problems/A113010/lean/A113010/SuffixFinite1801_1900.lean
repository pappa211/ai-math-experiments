import A113010.SuffixFiniteCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2100
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_1801 : ExponentCertificate 1801 553 553 := by decide
private theorem cert_1802 : ExponentCertificate 1802 554 553 := by decide
private theorem cert_1803 : ExponentCertificate 1803 554 553 := by decide
private theorem cert_1804 : ExponentCertificate 1804 554 554 := by decide
private theorem cert_1805 : ExponentCertificate 1805 554 554 := by decide
private theorem cert_1806 : ExponentCertificate 1806 555 554 := by decide
private theorem cert_1807 : ExponentCertificate 1807 555 554 := by decide
private theorem cert_1808 : ExponentCertificate 1808 555 555 := by decide
private theorem cert_1809 : ExponentCertificate 1809 556 555 := by decide
private theorem cert_1810 : ExponentCertificate 1810 556 555 := by decide
private theorem cert_1811 : ExponentCertificate 1811 556 555 := by decide
private theorem cert_1812 : ExponentCertificate 1812 556 556 := by decide
private theorem cert_1813 : ExponentCertificate 1813 557 556 := by decide
private theorem cert_1814 : ExponentCertificate 1814 557 556 := by decide
private theorem cert_1815 : ExponentCertificate 1815 557 556 := by decide
private theorem cert_1816 : ExponentCertificate 1816 557 557 := by decide
private theorem cert_1817 : ExponentCertificate 1817 558 557 := by decide
private theorem cert_1818 : ExponentCertificate 1818 558 557 := by decide
private theorem cert_1819 : ExponentCertificate 1819 558 558 := by decide
private theorem cert_1820 : ExponentCertificate 1820 558 558 := by decide
private theorem cert_1821 : ExponentCertificate 1821 559 558 := by decide
private theorem cert_1822 : ExponentCertificate 1822 559 558 := by decide
private theorem cert_1823 : ExponentCertificate 1823 559 559 := by decide
private theorem cert_1824 : ExponentCertificate 1824 560 559 := by decide
private theorem cert_1825 : ExponentCertificate 1825 560 559 := by decide
private theorem cert_1826 : ExponentCertificate 1826 560 559 := by decide
private theorem cert_1827 : ExponentCertificate 1827 560 560 := by decide
private theorem cert_1828 : ExponentCertificate 1828 561 560 := by decide
private theorem cert_1829 : ExponentCertificate 1829 561 560 := by decide
private theorem cert_1830 : ExponentCertificate 1830 561 560 := by decide
private theorem cert_1831 : ExponentCertificate 1831 561 561 := by decide
private theorem cert_1832 : ExponentCertificate 1832 562 561 := by decide
private theorem cert_1833 : ExponentCertificate 1833 562 561 := by decide
private theorem cert_1834 : ExponentCertificate 1834 562 561 := by decide
private theorem cert_1835 : ExponentCertificate 1835 562 562 := by decide
private theorem cert_1836 : ExponentCertificate 1836 563 562 := by decide
private theorem cert_1837 : ExponentCertificate 1837 563 562 := by decide
private theorem suffix_1838 : 563 < digitSum ((1838 : ℕ) ^ 563 % 10 ^ 141) := by
  have hmod : (1838 : ℕ) ^ 563 % 10 ^ 141 = 619877610538200031713760216770530889613368293575285548618257583647827621047065620016769486297286907352489150143566047204259204061665817526272 := by
    have h1 : (1838 : ℕ) ^ 1 % 10 ^ 141 = 1838 := by decide
    have h2 : (1838 : ℕ) ^ 2 % 10 ^ 141 = 3378244 := by
      have step := pow_mod_double (k := 1838) (e := 1) (m := 10 ^ 141) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1838 : ℕ) ^ 4 % 10 ^ 141 = 11412532523536 := by
      have step := pow_mod_double (k := 1838) (e := 2) (m := 10 ^ 141) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (1838 : ℕ) ^ 8 % 10 ^ 141 = 130245898600766980393943296 := by
      have step := pow_mod_double (k := 1838) (e := 4) (m := 10 ^ 141) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h17 : (1838 : ℕ) ^ 17 % 10 ^ 141 = 31179821160066501724551844146237814359656157091625566208 := by
      have step := pow_mod_double_add_one (k := 1838) (e := 8) (m := 10 ^ 141) h8
      have he : 2 * 8 + 1 = 17 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h35 : (1838 : ℕ) ^ 35 % 10 ^ 141 = 1786869133040517154077652436581195125025149791187226580962020812849571316160009383128910405412686779293455175647232 := by
      have step := pow_mod_double_add_one (k := 1838) (e := 17) (m := 10 ^ 141) h17
      have he : 2 * 17 + 1 = 35 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h70 : (1838 : ℕ) ^ 70 % 10 ^ 141 = 845805501195259992269381516505701507086501774257670170233756129692165988234618255672385697226065604654843378612021506768805603785070109261824 := by
      have step := pow_mod_double (k := 1838) (e := 35) (m := 10 ^ 141) h35
      have he : 2 * 35 = 70 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h140 : (1838 : ℕ) ^ 140 % 10 ^ 141 = 382730134697099745772522841492369085820525512931893974844547039452665988977747347870291345429525693702786282352686848046856116273506183806976 := by
      have step := pow_mod_double (k := 1838) (e := 70) (m := 10 ^ 141) h70
      have he : 2 * 70 = 140 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h281 : (1838 : ℕ) ^ 281 % 10 ^ 141 = 158828254491505681582973586720480700914238845746959110899869607631164360058292232083828626349487766019068545934901412486978532236791474290688 := by
      have step := pow_mod_double_add_one (k := 1838) (e := 140) (m := 10 ^ 141) h140
      have he : 2 * 140 + 1 = 281 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h563 : (1838 : ℕ) ^ 563 % 10 ^ 141 = 619877610538200031713760216770530889613368293575285548618257583647827621047065620016769486297286907352489150143566047204259204061665817526272 := by
      have step := pow_mod_double_add_one (k := 1838) (e := 281) (m := 10 ^ 141) h281
      have he : 2 * 281 + 1 = 563 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h563
  rw [hmod]
  decide
private theorem cert_1838 : ExponentCertificate 1838 563 563 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1838
private theorem cert_1839 : ExponentCertificate 1839 564 563 := by decide
private theorem cert_1840 : ExponentCertificate 1840 564 563 := by decide
private theorem cert_1841 : ExponentCertificate 1841 564 563 := by decide
private theorem cert_1842 : ExponentCertificate 1842 564 564 := by decide
private theorem cert_1843 : ExponentCertificate 1843 565 564 := by decide
private theorem cert_1844 : ExponentCertificate 1844 565 564 := by decide
private theorem cert_1845 : ExponentCertificate 1845 565 564 := by decide
private theorem cert_1846 : ExponentCertificate 1846 565 565 := by decide
private theorem cert_1847 : ExponentCertificate 1847 566 565 := by decide
private theorem cert_1848 : ExponentCertificate 1848 566 565 := by decide
private theorem cert_1849 : ExponentCertificate 1849 566 565 := by decide
private theorem cert_1850 : ExponentCertificate 1850 566 566 := by decide
private theorem cert_1851 : ExponentCertificate 1851 567 566 := by decide
private theorem cert_1852 : ExponentCertificate 1852 567 566 := by decide
private theorem cert_1853 : ExponentCertificate 1853 567 567 := by decide
private theorem suffix_1854 : 567 < digitSum ((1854 : ℕ) ^ 567 % 10 ^ 142) := by
  have hmod : (1854 : ℕ) ^ 567 % 10 ^ 142 = 8722711664176676183150275986186958362685535378063437953619303466896228953576898190780838308655927685402809204133954307495868349248972609552384 := by
    have h1 : (1854 : ℕ) ^ 1 % 10 ^ 142 = 1854 := by decide
    have h2 : (1854 : ℕ) ^ 2 % 10 ^ 142 = 3437316 := by
      have step := pow_mod_double (k := 1854) (e := 1) (m := 10 ^ 142) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1854 : ℕ) ^ 4 % 10 ^ 142 = 11815141283856 := by
      have step := pow_mod_double (k := 1854) (e := 2) (m := 10 ^ 142) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (1854 : ℕ) ^ 8 % 10 ^ 142 = 139597563557478407966228736 := by
      have step := pow_mod_double (k := 1854) (e := 4) (m := 10 ^ 142) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h17 : (1854 : ℕ) ^ 17 % 10 ^ 142 = 36129787458695550675267471669831749981977007700580368384 := by
      have step := pow_mod_double_add_one (k := 1854) (e := 8) (m := 10 ^ 142) h8
      have he : 2 * 8 + 1 = 17 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h35 : (1854 : ℕ) ^ 35 % 10 ^ 142 = 2420140298516693508291486281373886902876660830840602405309520698682987874546739493323983072672113374727366114279424 := by
      have step := pow_mod_double_add_one (k := 1854) (e := 17) (m := 10 ^ 142) h17
      have he : 2 * 17 + 1 = 35 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h70 : (1854 : ℕ) ^ 70 % 10 ^ 142 = 1148316968019944815680974382717129571192210977223333319691022633112835711308291720265910575900706831537017374570753343951035100094154749771776 := by
      have step := pow_mod_double (k := 1854) (e := 35) (m := 10 ^ 142) h35
      have he : 2 * 35 = 70 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h141 : (1854 : ℕ) ^ 141 % 10 ^ 142 = 8249858960913967408503846665046164842312246487784512507835408566834429201628438147526118555832889770110036255277553350212922785550455804002304 := by
      have step := pow_mod_double_add_one (k := 1854) (e := 70) (m := 10 ^ 142) h70
      have he : 2 * 70 + 1 = 141 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h283 : (1854 : ℕ) ^ 283 % 10 ^ 142 = 2916621237461557992802774963533878398204473072485155233869049251873195511813529256143835843634946237989667324623716271734652806903328369803264 := by
      have step := pow_mod_double_add_one (k := 1854) (e := 141) (m := 10 ^ 142) h141
      have he : 2 * 141 + 1 = 283 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h567 : (1854 : ℕ) ^ 567 % 10 ^ 142 = 8722711664176676183150275986186958362685535378063437953619303466896228953576898190780838308655927685402809204133954307495868349248972609552384 := by
      have step := pow_mod_double_add_one (k := 1854) (e := 283) (m := 10 ^ 142) h283
      have he : 2 * 283 + 1 = 567 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h567
  rw [hmod]
  decide
private theorem cert_1854 : ExponentCertificate 1854 567 567 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1854
private theorem cert_1855 : ExponentCertificate 1855 568 567 := by decide
private theorem cert_1856 : ExponentCertificate 1856 568 567 := by decide
private theorem cert_1857 : ExponentCertificate 1857 568 568 := by decide
private theorem cert_1858 : ExponentCertificate 1858 569 568 := by decide
private theorem cert_1859 : ExponentCertificate 1859 569 568 := by decide
private theorem cert_1860 : ExponentCertificate 1860 569 568 := by decide
private theorem cert_1861 : ExponentCertificate 1861 569 569 := by decide
private theorem cert_1862 : ExponentCertificate 1862 570 569 := by decide
private theorem cert_1863 : ExponentCertificate 1863 570 569 := by decide
private theorem cert_1864 : ExponentCertificate 1864 570 569 := by decide
private theorem cert_1865 : ExponentCertificate 1865 570 570 := by decide
private theorem cert_1866 : ExponentCertificate 1866 571 570 := by decide
private theorem cert_1867 : ExponentCertificate 1867 571 570 := by decide
private theorem cert_1868 : ExponentCertificate 1868 571 571 := by decide
private theorem cert_1869 : ExponentCertificate 1869 571 571 := by decide
private theorem cert_1870 : ExponentCertificate 1870 572 571 := by decide
private theorem cert_1871 : ExponentCertificate 1871 572 571 := by decide
private theorem cert_1872 : ExponentCertificate 1872 572 572 := by decide
private theorem cert_1873 : ExponentCertificate 1873 573 572 := by decide
private theorem cert_1874 : ExponentCertificate 1874 573 572 := by decide
private theorem cert_1875 : ExponentCertificate 1875 573 572 := by decide
private theorem cert_1876 : ExponentCertificate 1876 573 573 := by decide
private theorem cert_1877 : ExponentCertificate 1877 574 573 := by decide
private theorem cert_1878 : ExponentCertificate 1878 574 573 := by decide
private theorem cert_1879 : ExponentCertificate 1879 574 573 := by decide
private theorem cert_1880 : ExponentCertificate 1880 574 574 := by decide
private theorem cert_1881 : ExponentCertificate 1881 575 574 := by decide
private theorem cert_1882 : ExponentCertificate 1882 575 574 := by decide
private theorem cert_1883 : ExponentCertificate 1883 575 574 := by decide
private theorem cert_1884 : ExponentCertificate 1884 575 575 := by decide
private theorem cert_1885 : ExponentCertificate 1885 576 575 := by decide
private theorem cert_1886 : ExponentCertificate 1886 576 575 := by decide
private theorem suffix_1887 : 576 < digitSum ((1887 : ℕ) ^ 576 % 10 ^ 144) := by
  have hmod : (1887 : ℕ) ^ 576 % 10 ^ 144 = 830640930382641936179357475982632305408548034093453394524227068229601206924988221264304689522217401039829356412304612708385388276637957221181441 := by
    have h1 : (1887 : ℕ) ^ 1 % 10 ^ 144 = 1887 := by decide
    have h2 : (1887 : ℕ) ^ 2 % 10 ^ 144 = 3560769 := by
      have step := pow_mod_double (k := 1887) (e := 1) (m := 10 ^ 144) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1887 : ℕ) ^ 4 % 10 ^ 144 = 12679075871361 := by
      have step := pow_mod_double (k := 1887) (e := 2) (m := 10 ^ 144) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (1887 : ℕ) ^ 9 % 10 ^ 144 = 303352166863912059579525509727 := by
      have step := pow_mod_double_add_one (k := 1887) (e := 4) (m := 10 ^ 144) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (1887 : ℕ) ^ 18 % 10 ^ 144 = 92022537141030745760284271942816671402404012210339171614529 := by
      have step := pow_mod_double (k := 1887) (e := 9) (m := 10 ^ 144) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h36 : (1887 : ℕ) ^ 36 % 10 ^ 144 = 8468147341872383059616376340453758202477369501370054967470989447040050435921795714712651147046541296182282208563891841 := by
      have step := pow_mod_double (k := 1887) (e := 18) (m := 10 ^ 144) h18
      have he : 2 * 18 = 36 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h72 : (1887 : ℕ) ^ 72 % 10 ^ 144 = 576597749226435362862817396663989226084011723982952027184843884112524755116911850288708671451807224658567351027021707726862036019303864346369281 := by
      have step := pow_mod_double (k := 1887) (e := 36) (m := 10 ^ 144) h36
      have he : 2 * 36 = 72 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h144 : (1887 : ℕ) ^ 144 % 10 ^ 144 = 764635304300801187357736077115956239860974922559390362715239534143217358295789894206957477730077985850687724733277542769735259108375246820456961 := by
      have step := pow_mod_double (k := 1887) (e := 72) (m := 10 ^ 144) h72
      have he : 2 * 72 = 144 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h288 : (1887 : ℕ) ^ 288 % 10 ^ 144 = 978783451724855967744688321234058501187376338414328017332747007272812758636416792953737482015410101905027097730551648870770764634724436853355521 := by
      have step := pow_mod_double (k := 1887) (e := 144) (m := 10 ^ 144) h144
      have he : 2 * 144 = 288 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h576 : (1887 : ℕ) ^ 576 % 10 ^ 144 = 830640930382641936179357475982632305408548034093453394524227068229601206924988221264304689522217401039829356412304612708385388276637957221181441 := by
      have step := pow_mod_double (k := 1887) (e := 288) (m := 10 ^ 144) h288
      have he : 2 * 288 = 576 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h576
  rw [hmod]
  decide
private theorem cert_1887 : ExponentCertificate 1887 576 576 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1887
private theorem cert_1888 : ExponentCertificate 1888 577 576 := by decide
private theorem cert_1889 : ExponentCertificate 1889 577 576 := by decide
private theorem cert_1890 : ExponentCertificate 1890 577 576 := by decide
private theorem suffix_1891 : 577 < digitSum ((1891 : ℕ) ^ 577 % 10 ^ 145) := by
  have hmod : (1891 : ℕ) ^ 577 % 10 ^ 145 = 1821028072070926132059179057212048565162206902180910583667945594957505045728208009213564834797148717321951860120351767281799077817038645615980131 := by
    have h1 : (1891 : ℕ) ^ 1 % 10 ^ 145 = 1891 := by decide
    have h2 : (1891 : ℕ) ^ 2 % 10 ^ 145 = 3575881 := by
      have step := pow_mod_double (k := 1891) (e := 1) (m := 10 ^ 145) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1891 : ℕ) ^ 4 % 10 ^ 145 = 12786924926161 := by
      have step := pow_mod_double (k := 1891) (e := 2) (m := 10 ^ 145) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (1891 : ℕ) ^ 9 % 10 ^ 145 = 309188804186221743616456268611 := by
      have step := pow_mod_double_add_one (k := 1891) (e := 4) (m := 10 ^ 145) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (1891 : ℕ) ^ 18 % 10 ^ 145 = 95597716634105772409812034615828833516051549055797383869321 := by
      have step := pow_mod_double (k := 1891) (e := 9) (m := 10 ^ 145) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h36 : (1891 : ℕ) ^ 36 % 10 ^ 145 = 9138923425654783491677823600616685200025190365068346822375268614299226104411569286110005619720779303118363329605001041 := by
      have step := pow_mod_double (k := 1891) (e := 18) (m := 10 ^ 145) h18
      have he : 2 * 18 = 36 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h72 : (1891 : ℕ) ^ 72 % 10 ^ 145 = 5137969869740799949328538931656293441072066611577359067428908314381657154389595590863756435260345589431245267462612467087690961888477237611083681 := by
      have step := pow_mod_double (k := 1891) (e := 36) (m := 10 ^ 145) h36
      have he : 2 * 36 = 72 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h144 : (1891 : ℕ) ^ 144 % 10 ^ 145 = 1749432731090835440678852734285755370471959625473550100755763980669228554385523308303501872263847238670519237796576400229636932314762059184509761 := by
      have step := pow_mod_double (k := 1891) (e := 72) (m := 10 ^ 145) h72
      have he : 2 * 72 = 144 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h288 : (1891 : ℕ) ^ 288 % 10 ^ 145 = 7919802745022605968996116293491254242274292693968750981266571569729420625723151142305832570923079666936046767625822440782259329589959649904277121 := by
      have step := pow_mod_double (k := 1891) (e := 144) (m := 10 ^ 145) h144
      have he : 2 * 144 = 288 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h577 : (1891 : ℕ) ^ 577 % 10 ^ 145 = 1821028072070926132059179057212048565162206902180910583667945594957505045728208009213564834797148717321951860120351767281799077817038645615980131 := by
      have step := pow_mod_double_add_one (k := 1891) (e := 288) (m := 10 ^ 145) h288
      have he : 2 * 288 + 1 = 577 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h577
  rw [hmod]
  decide
private theorem cert_1891 : ExponentCertificate 1891 577 577 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1891
private theorem cert_1892 : ExponentCertificate 1892 578 577 := by decide
private theorem cert_1893 : ExponentCertificate 1893 578 577 := by decide
private theorem cert_1894 : ExponentCertificate 1894 578 577 := by decide
private theorem cert_1895 : ExponentCertificate 1895 578 578 := by decide
private theorem cert_1896 : ExponentCertificate 1896 579 578 := by decide
private theorem cert_1897 : ExponentCertificate 1897 579 578 := by decide
private theorem cert_1898 : ExponentCertificate 1898 579 578 := by decide
private theorem cert_1899 : ExponentCertificate 1899 579 579 := by decide
private theorem cert_1900 : ExponentCertificate 1900 580 579 := by decide

private theorem certificates_1801_1900 {k : ℕ} (hlo : 1801 ≤ k) (hhi : k ≤ 1900) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨553, 553, cert_1801⟩
  · exact ⟨554, 553, cert_1802⟩
  · exact ⟨554, 553, cert_1803⟩
  · exact ⟨554, 554, cert_1804⟩
  · exact ⟨554, 554, cert_1805⟩
  · exact ⟨555, 554, cert_1806⟩
  · exact ⟨555, 554, cert_1807⟩
  · exact ⟨555, 555, cert_1808⟩
  · exact ⟨556, 555, cert_1809⟩
  · exact ⟨556, 555, cert_1810⟩
  · exact ⟨556, 555, cert_1811⟩
  · exact ⟨556, 556, cert_1812⟩
  · exact ⟨557, 556, cert_1813⟩
  · exact ⟨557, 556, cert_1814⟩
  · exact ⟨557, 556, cert_1815⟩
  · exact ⟨557, 557, cert_1816⟩
  · exact ⟨558, 557, cert_1817⟩
  · exact ⟨558, 557, cert_1818⟩
  · exact ⟨558, 558, cert_1819⟩
  · exact ⟨558, 558, cert_1820⟩
  · exact ⟨559, 558, cert_1821⟩
  · exact ⟨559, 558, cert_1822⟩
  · exact ⟨559, 559, cert_1823⟩
  · exact ⟨560, 559, cert_1824⟩
  · exact ⟨560, 559, cert_1825⟩
  · exact ⟨560, 559, cert_1826⟩
  · exact ⟨560, 560, cert_1827⟩
  · exact ⟨561, 560, cert_1828⟩
  · exact ⟨561, 560, cert_1829⟩
  · exact ⟨561, 560, cert_1830⟩
  · exact ⟨561, 561, cert_1831⟩
  · exact ⟨562, 561, cert_1832⟩
  · exact ⟨562, 561, cert_1833⟩
  · exact ⟨562, 561, cert_1834⟩
  · exact ⟨562, 562, cert_1835⟩
  · exact ⟨563, 562, cert_1836⟩
  · exact ⟨563, 562, cert_1837⟩
  · exact ⟨563, 563, cert_1838⟩
  · exact ⟨564, 563, cert_1839⟩
  · exact ⟨564, 563, cert_1840⟩
  · exact ⟨564, 563, cert_1841⟩
  · exact ⟨564, 564, cert_1842⟩
  · exact ⟨565, 564, cert_1843⟩
  · exact ⟨565, 564, cert_1844⟩
  · exact ⟨565, 564, cert_1845⟩
  · exact ⟨565, 565, cert_1846⟩
  · exact ⟨566, 565, cert_1847⟩
  · exact ⟨566, 565, cert_1848⟩
  · exact ⟨566, 565, cert_1849⟩
  · exact ⟨566, 566, cert_1850⟩
  · exact ⟨567, 566, cert_1851⟩
  · exact ⟨567, 566, cert_1852⟩
  · exact ⟨567, 567, cert_1853⟩
  · exact ⟨567, 567, cert_1854⟩
  · exact ⟨568, 567, cert_1855⟩
  · exact ⟨568, 567, cert_1856⟩
  · exact ⟨568, 568, cert_1857⟩
  · exact ⟨569, 568, cert_1858⟩
  · exact ⟨569, 568, cert_1859⟩
  · exact ⟨569, 568, cert_1860⟩
  · exact ⟨569, 569, cert_1861⟩
  · exact ⟨570, 569, cert_1862⟩
  · exact ⟨570, 569, cert_1863⟩
  · exact ⟨570, 569, cert_1864⟩
  · exact ⟨570, 570, cert_1865⟩
  · exact ⟨571, 570, cert_1866⟩
  · exact ⟨571, 570, cert_1867⟩
  · exact ⟨571, 571, cert_1868⟩
  · exact ⟨571, 571, cert_1869⟩
  · exact ⟨572, 571, cert_1870⟩
  · exact ⟨572, 571, cert_1871⟩
  · exact ⟨572, 572, cert_1872⟩
  · exact ⟨573, 572, cert_1873⟩
  · exact ⟨573, 572, cert_1874⟩
  · exact ⟨573, 572, cert_1875⟩
  · exact ⟨573, 573, cert_1876⟩
  · exact ⟨574, 573, cert_1877⟩
  · exact ⟨574, 573, cert_1878⟩
  · exact ⟨574, 573, cert_1879⟩
  · exact ⟨574, 574, cert_1880⟩
  · exact ⟨575, 574, cert_1881⟩
  · exact ⟨575, 574, cert_1882⟩
  · exact ⟨575, 574, cert_1883⟩
  · exact ⟨575, 575, cert_1884⟩
  · exact ⟨576, 575, cert_1885⟩
  · exact ⟨576, 575, cert_1886⟩
  · exact ⟨576, 576, cert_1887⟩
  · exact ⟨577, 576, cert_1888⟩
  · exact ⟨577, 576, cert_1889⟩
  · exact ⟨577, 576, cert_1890⟩
  · exact ⟨577, 577, cert_1891⟩
  · exact ⟨578, 577, cert_1892⟩
  · exact ⟨578, 577, cert_1893⟩
  · exact ⟨578, 577, cert_1894⟩
  · exact ⟨578, 578, cert_1895⟩
  · exact ⟨579, 578, cert_1896⟩
  · exact ⟨579, 578, cert_1897⟩
  · exact ⟨579, 578, cert_1898⟩
  · exact ⟨579, 579, cert_1899⟩
  · exact ⟨580, 579, cert_1900⟩

theorem no_fixed_digitCount_1801_1900 {n : ℕ} (hn : a n = n)
    (hlo : 1801 ≤ digitCount n) (hhi : digitCount n ≤ 1900) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_1801_1900 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_1801_1900
end OeisA113010
