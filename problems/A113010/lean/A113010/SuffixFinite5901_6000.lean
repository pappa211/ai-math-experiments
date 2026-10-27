import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 6001
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_5901 : ExponentCertificate 5901 1565 1564 := by decide
private theorem cert_5902 : ExponentCertificate 5902 1565 1565 := by decide
private theorem cert_5903 : ExponentCertificate 5903 1566 1565 := by decide
private theorem cert_5904 : ExponentCertificate 5904 1566 1565 := by decide
private theorem cert_5905 : ExponentCertificate 5905 1566 1565 := by decide
private theorem cert_5906 : ExponentCertificate 5906 1566 1566 := by decide
private theorem cert_5907 : ExponentCertificate 5907 1567 1566 := by decide
private theorem cert_5908 : ExponentCertificate 5908 1567 1566 := by decide
private theorem cert_5909 : ExponentCertificate 5909 1567 1566 := by decide
private theorem cert_5910 : ExponentCertificate 5910 1567 1566 := by decide
private theorem cert_5911 : ExponentCertificate 5911 1567 1567 := by decide
private theorem cert_5912 : ExponentCertificate 5912 1568 1567 := by decide
private theorem cert_5913 : ExponentCertificate 5913 1568 1567 := by decide
private theorem cert_5914 : ExponentCertificate 5914 1568 1567 := by decide
private theorem cert_5915 : ExponentCertificate 5915 1568 1568 := by decide
private theorem cert_5916 : ExponentCertificate 5916 1569 1568 := by decide
private theorem cert_5917 : ExponentCertificate 5917 1569 1568 := by decide
private theorem cert_5918 : ExponentCertificate 5918 1569 1568 := by decide
private theorem cert_5919 : ExponentCertificate 5919 1569 1569 := by decide
private theorem cert_5920 : ExponentCertificate 5920 1570 1569 := by decide
private theorem cert_5921 : ExponentCertificate 5921 1570 1569 := by decide
private theorem cert_5922 : ExponentCertificate 5922 1570 1569 := by decide
private theorem cert_5923 : ExponentCertificate 5923 1570 1570 := by decide
private theorem cert_5924 : ExponentCertificate 5924 1570 1570 := by decide
private theorem cert_5925 : ExponentCertificate 5925 1571 1570 := by decide
private theorem cert_5926 : ExponentCertificate 5926 1571 1570 := by decide
private theorem cert_5927 : ExponentCertificate 5927 1571 1570 := by decide
private theorem cert_5928 : ExponentCertificate 5928 1571 1571 := by decide
private theorem cert_5929 : ExponentCertificate 5929 1572 1571 := by decide
private theorem cert_5930 : ExponentCertificate 5930 1572 1571 := by decide
private theorem cert_5931 : ExponentCertificate 5931 1572 1571 := by decide
private theorem cert_5932 : ExponentCertificate 5932 1572 1572 := by decide
private theorem cert_5933 : ExponentCertificate 5933 1573 1572 := by decide
private theorem cert_5934 : ExponentCertificate 5934 1573 1572 := by decide
private theorem cert_5935 : ExponentCertificate 5935 1573 1572 := by decide
private theorem cert_5936 : ExponentCertificate 5936 1573 1573 := by decide
private theorem cert_5937 : ExponentCertificate 5937 1574 1573 := by decide
private theorem cert_5938 : ExponentCertificate 5938 1574 1573 := by decide
private theorem cert_5939 : ExponentCertificate 5939 1574 1573 := by decide
private theorem cert_5940 : ExponentCertificate 5940 1574 1574 := by decide
private theorem cert_5941 : ExponentCertificate 5941 1574 1574 := by decide
private theorem cert_5942 : ExponentCertificate 5942 1575 1574 := by decide
private theorem cert_5943 : ExponentCertificate 5943 1575 1574 := by decide
private theorem cert_5944 : ExponentCertificate 5944 1575 1574 := by decide
private theorem cert_5945 : ExponentCertificate 5945 1575 1575 := by decide
private theorem cert_5946 : ExponentCertificate 5946 1576 1575 := by decide
private theorem cert_5947 : ExponentCertificate 5947 1576 1575 := by decide
private theorem cert_5948 : ExponentCertificate 5948 1576 1575 := by decide
private theorem cert_5949 : ExponentCertificate 5949 1576 1576 := by decide
private theorem cert_5950 : ExponentCertificate 5950 1577 1576 := by decide
private theorem cert_5951 : ExponentCertificate 5951 1577 1576 := by decide
private theorem cert_5952 : ExponentCertificate 5952 1577 1576 := by decide
private theorem cert_5953 : ExponentCertificate 5953 1577 1577 := by decide
private theorem cert_5954 : ExponentCertificate 5954 1578 1577 := by decide
private theorem cert_5955 : ExponentCertificate 5955 1578 1577 := by decide
private theorem cert_5956 : ExponentCertificate 5956 1578 1577 := by decide
private theorem cert_5957 : ExponentCertificate 5957 1578 1578 := by decide
private theorem cert_5958 : ExponentCertificate 5958 1578 1578 := by decide
private theorem cert_5959 : ExponentCertificate 5959 1579 1578 := by decide
private theorem cert_5960 : ExponentCertificate 5960 1579 1578 := by decide
private theorem cert_5961 : ExponentCertificate 5961 1579 1578 := by decide
private theorem suffix_5962 : 1579 < digitSum ((5962 : ℕ) ^ 1579 % 10 ^ 395) := by
  have hmod : (5962 : ℕ) ^ 1579 % 10 ^ 395 = 87511123632990111172129964039277836365211499329496811686276869728474757964417549866427624552998998069734932505308355193257303023042261731675299993822026620169064939127514334072689785800435978601216999900931816867057681513971667425211368912765750993024907379524095740181658801319419844272638809039597500948963092092466493753275518269420969245229189731907047885207064682960609156439560540544565248 := by
    have h1 : (5962 : ℕ) ^ 1 % 10 ^ 395 = 5962 := by decide
    have h3 : (5962 : ℕ) ^ 3 % 10 ^ 395 = 211921937128 := by
      have step := pow_mod_double_add_one (k := 5962) (e := 1) (m := 10 ^ 395) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (5962 : ℕ) ^ 6 % 10 ^ 395 = 44910907436083984888384 := by
      have step := pow_mod_double (k := 5962) (e := 3) (m := 10 ^ 395) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (5962 : ℕ) ^ 12 % 10 ^ 395 = 2016989606732503769192480284708324872938131456 := by
      have step := pow_mod_double (k := 5962) (e := 6) (m := 10 ^ 395) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h24 : (5962 : ℕ) ^ 24 % 10 ^ 395 = 4068247073666940214170673267114414449826094385835945264591430367783247079860837892736679936 := by
      have step := pow_mod_double (k := 5962) (e := 12) (m := 10 ^ 395) h12
      have he : 2 * 12 = 24 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h49 : (5962 : ℕ) ^ 49 % 10 ^ 395 = 98674881412806549212503365007981646320688082902946620003235763480821378946002436923990457553671584142621064772623132629493087007700193179285095122962999564948865974236725360849795940352 := by
      have step := pow_mod_double_add_one (k := 5962) (e := 24) (m := 10 ^ 395) h24
      have he : 2 * 24 + 1 = 49 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h98 : (5962 : ℕ) ^ 98 % 10 ^ 395 = 9736732221831435409538073581259268566578170722811852576361489564867443354570206362139745219825792045296018090881885596955944945551151540862516541224188008056747642678305646965264467260743179025988424935342979214286781048953774121959613622866127099032900813308325271026932799436781785977761751391925161785559218013805860231918602226417094812158866230884593678739941883904 := by
      have step := pow_mod_double (k := 5962) (e := 49) (m := 10 ^ 395) h49
      have he : 2 * 49 = 98 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h197 : (5962 : ℕ) ^ 197 % 10 ^ 395 = 38642782144495151921711183855411791302795569453326523019785842706279244898138003947474105079932872005472564067698094179131982790766230287128129568051285203687901294728132855488855331686268433823079701893629658973702643219685100728997871786400828230842869555807076141592172269555397726660525422183705233884441950526721740093558159468673925257883078454240157322258579399716263209319986462344609792 := by
      have step := pow_mod_double_add_one (k := 5962) (e := 98) (m := 10 ^ 395) h98
      have he : 2 * 98 + 1 = 197 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h394 : (5962 : ℕ) ^ 394 % 10 ^ 395 = 54808629335832871513347359243625255376943824310579764908070515251386107245093581713501031536579342326993443965756448247569983757638595870117537761468750501641714113596833963229974067054071937287088427554036436068992123211962692234747656722335871685330293762568580380192162379163744572486636137450412567392173837623183536187558903308565497350347693374831171451623157099025303436344027716742283264 := by
      have step := pow_mod_double (k := 5962) (e := 197) (m := 10 ^ 395) h197
      have he : 2 * 197 = 394 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h789 : (5962 : ℕ) ^ 789 % 10 ^ 395 = 28208388803919704437611197819623493324321176354166595891470858040126865312540753481736907333761932002934283758066162243905436259465313422704022813717802433237042494582749546272075330373331293910472566329196616586529893028120519697865836444312242596120341446396176654158495952353948981885045692169742671282702518516504375404521424210208643100347875855900521104809247630789220508949721390411415552 := by
      have step := pow_mod_double_add_one (k := 5962) (e := 394) (m := 10 ^ 395) h394
      have he : 2 * 394 + 1 = 789 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1579 : (5962 : ℕ) ^ 1579 % 10 ^ 395 = 87511123632990111172129964039277836365211499329496811686276869728474757964417549866427624552998998069734932505308355193257303023042261731675299993822026620169064939127514334072689785800435978601216999900931816867057681513971667425211368912765750993024907379524095740181658801319419844272638809039597500948963092092466493753275518269420969245229189731907047885207064682960609156439560540544565248 := by
      have step := pow_mod_double_add_one (k := 5962) (e := 789) (m := 10 ^ 395) h789
      have he : 2 * 789 + 1 = 1579 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1579
  rw [hmod]
  decide
private theorem cert_5962 : ExponentCertificate 5962 1579 1579 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5962) (by decide) (by decide) (by decide) suffix_5962
private theorem cert_5963 : ExponentCertificate 5963 1580 1579 := by decide
private theorem cert_5964 : ExponentCertificate 5964 1580 1579 := by decide
private theorem cert_5965 : ExponentCertificate 5965 1580 1579 := by decide
private theorem cert_5966 : ExponentCertificate 5966 1580 1580 := by decide
private theorem cert_5967 : ExponentCertificate 5967 1581 1580 := by decide
private theorem cert_5968 : ExponentCertificate 5968 1581 1580 := by decide
private theorem cert_5969 : ExponentCertificate 5969 1581 1580 := by decide
private theorem cert_5970 : ExponentCertificate 5970 1581 1581 := by decide
private theorem cert_5971 : ExponentCertificate 5971 1582 1581 := by decide
private theorem cert_5972 : ExponentCertificate 5972 1582 1581 := by decide
private theorem cert_5973 : ExponentCertificate 5973 1582 1581 := by decide
private theorem cert_5974 : ExponentCertificate 5974 1582 1581 := by decide
private theorem cert_5975 : ExponentCertificate 5975 1582 1582 := by decide
private theorem cert_5976 : ExponentCertificate 5976 1583 1582 := by decide
private theorem cert_5977 : ExponentCertificate 5977 1583 1582 := by decide
private theorem cert_5978 : ExponentCertificate 5978 1583 1582 := by decide
private theorem cert_5979 : ExponentCertificate 5979 1583 1583 := by decide
private theorem cert_5980 : ExponentCertificate 5980 1584 1583 := by decide
private theorem cert_5981 : ExponentCertificate 5981 1584 1583 := by decide
private theorem cert_5982 : ExponentCertificate 5982 1584 1583 := by decide
private theorem cert_5983 : ExponentCertificate 5983 1584 1584 := by decide
private theorem cert_5984 : ExponentCertificate 5984 1585 1584 := by decide
private theorem cert_5985 : ExponentCertificate 5985 1585 1584 := by decide
private theorem cert_5986 : ExponentCertificate 5986 1585 1584 := by decide
private theorem cert_5987 : ExponentCertificate 5987 1585 1585 := by decide
private theorem cert_5988 : ExponentCertificate 5988 1586 1585 := by decide
private theorem cert_5989 : ExponentCertificate 5989 1586 1585 := by decide
private theorem cert_5990 : ExponentCertificate 5990 1586 1585 := by decide
private theorem cert_5991 : ExponentCertificate 5991 1586 1585 := by decide
private theorem cert_5992 : ExponentCertificate 5992 1586 1586 := by decide
private theorem cert_5993 : ExponentCertificate 5993 1587 1586 := by decide
private theorem cert_5994 : ExponentCertificate 5994 1587 1586 := by decide
private theorem cert_5995 : ExponentCertificate 5995 1587 1586 := by decide
private theorem cert_5996 : ExponentCertificate 5996 1587 1587 := by decide
private theorem cert_5997 : ExponentCertificate 5997 1588 1587 := by decide
private theorem cert_5998 : ExponentCertificate 5998 1588 1587 := by decide
private theorem cert_5999 : ExponentCertificate 5999 1588 1587 := by decide
private theorem cert_6000 : ExponentCertificate 6000 1588 1588 := by decide

private theorem certificates_5901_6000 {k : ℕ} (hlo : 5901 ≤ k) (hhi : k ≤ 6000) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1565, 1564, cert_5901⟩
  · exact ⟨1565, 1565, cert_5902⟩
  · exact ⟨1566, 1565, cert_5903⟩
  · exact ⟨1566, 1565, cert_5904⟩
  · exact ⟨1566, 1565, cert_5905⟩
  · exact ⟨1566, 1566, cert_5906⟩
  · exact ⟨1567, 1566, cert_5907⟩
  · exact ⟨1567, 1566, cert_5908⟩
  · exact ⟨1567, 1566, cert_5909⟩
  · exact ⟨1567, 1566, cert_5910⟩
  · exact ⟨1567, 1567, cert_5911⟩
  · exact ⟨1568, 1567, cert_5912⟩
  · exact ⟨1568, 1567, cert_5913⟩
  · exact ⟨1568, 1567, cert_5914⟩
  · exact ⟨1568, 1568, cert_5915⟩
  · exact ⟨1569, 1568, cert_5916⟩
  · exact ⟨1569, 1568, cert_5917⟩
  · exact ⟨1569, 1568, cert_5918⟩
  · exact ⟨1569, 1569, cert_5919⟩
  · exact ⟨1570, 1569, cert_5920⟩
  · exact ⟨1570, 1569, cert_5921⟩
  · exact ⟨1570, 1569, cert_5922⟩
  · exact ⟨1570, 1570, cert_5923⟩
  · exact ⟨1570, 1570, cert_5924⟩
  · exact ⟨1571, 1570, cert_5925⟩
  · exact ⟨1571, 1570, cert_5926⟩
  · exact ⟨1571, 1570, cert_5927⟩
  · exact ⟨1571, 1571, cert_5928⟩
  · exact ⟨1572, 1571, cert_5929⟩
  · exact ⟨1572, 1571, cert_5930⟩
  · exact ⟨1572, 1571, cert_5931⟩
  · exact ⟨1572, 1572, cert_5932⟩
  · exact ⟨1573, 1572, cert_5933⟩
  · exact ⟨1573, 1572, cert_5934⟩
  · exact ⟨1573, 1572, cert_5935⟩
  · exact ⟨1573, 1573, cert_5936⟩
  · exact ⟨1574, 1573, cert_5937⟩
  · exact ⟨1574, 1573, cert_5938⟩
  · exact ⟨1574, 1573, cert_5939⟩
  · exact ⟨1574, 1574, cert_5940⟩
  · exact ⟨1574, 1574, cert_5941⟩
  · exact ⟨1575, 1574, cert_5942⟩
  · exact ⟨1575, 1574, cert_5943⟩
  · exact ⟨1575, 1574, cert_5944⟩
  · exact ⟨1575, 1575, cert_5945⟩
  · exact ⟨1576, 1575, cert_5946⟩
  · exact ⟨1576, 1575, cert_5947⟩
  · exact ⟨1576, 1575, cert_5948⟩
  · exact ⟨1576, 1576, cert_5949⟩
  · exact ⟨1577, 1576, cert_5950⟩
  · exact ⟨1577, 1576, cert_5951⟩
  · exact ⟨1577, 1576, cert_5952⟩
  · exact ⟨1577, 1577, cert_5953⟩
  · exact ⟨1578, 1577, cert_5954⟩
  · exact ⟨1578, 1577, cert_5955⟩
  · exact ⟨1578, 1577, cert_5956⟩
  · exact ⟨1578, 1578, cert_5957⟩
  · exact ⟨1578, 1578, cert_5958⟩
  · exact ⟨1579, 1578, cert_5959⟩
  · exact ⟨1579, 1578, cert_5960⟩
  · exact ⟨1579, 1578, cert_5961⟩
  · exact ⟨1579, 1579, cert_5962⟩
  · exact ⟨1580, 1579, cert_5963⟩
  · exact ⟨1580, 1579, cert_5964⟩
  · exact ⟨1580, 1579, cert_5965⟩
  · exact ⟨1580, 1580, cert_5966⟩
  · exact ⟨1581, 1580, cert_5967⟩
  · exact ⟨1581, 1580, cert_5968⟩
  · exact ⟨1581, 1580, cert_5969⟩
  · exact ⟨1581, 1581, cert_5970⟩
  · exact ⟨1582, 1581, cert_5971⟩
  · exact ⟨1582, 1581, cert_5972⟩
  · exact ⟨1582, 1581, cert_5973⟩
  · exact ⟨1582, 1581, cert_5974⟩
  · exact ⟨1582, 1582, cert_5975⟩
  · exact ⟨1583, 1582, cert_5976⟩
  · exact ⟨1583, 1582, cert_5977⟩
  · exact ⟨1583, 1582, cert_5978⟩
  · exact ⟨1583, 1583, cert_5979⟩
  · exact ⟨1584, 1583, cert_5980⟩
  · exact ⟨1584, 1583, cert_5981⟩
  · exact ⟨1584, 1583, cert_5982⟩
  · exact ⟨1584, 1584, cert_5983⟩
  · exact ⟨1585, 1584, cert_5984⟩
  · exact ⟨1585, 1584, cert_5985⟩
  · exact ⟨1585, 1584, cert_5986⟩
  · exact ⟨1585, 1585, cert_5987⟩
  · exact ⟨1586, 1585, cert_5988⟩
  · exact ⟨1586, 1585, cert_5989⟩
  · exact ⟨1586, 1585, cert_5990⟩
  · exact ⟨1586, 1585, cert_5991⟩
  · exact ⟨1586, 1586, cert_5992⟩
  · exact ⟨1587, 1586, cert_5993⟩
  · exact ⟨1587, 1586, cert_5994⟩
  · exact ⟨1587, 1586, cert_5995⟩
  · exact ⟨1587, 1587, cert_5996⟩
  · exact ⟨1588, 1587, cert_5997⟩
  · exact ⟨1588, 1587, cert_5998⟩
  · exact ⟨1588, 1587, cert_5999⟩
  · exact ⟨1588, 1588, cert_6000⟩

theorem no_fixed_digitCount_5901_6000 {n : ℕ} (hn : a n = n)
    (hlo : 5901 ≤ digitCount n) (hhi : digitCount n ≤ 6000) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_5901_6000 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_5901_6000
end OeisA113010
