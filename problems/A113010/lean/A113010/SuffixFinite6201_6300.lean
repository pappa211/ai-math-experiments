import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 6301
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_6201 : ExponentCertificate 6201 1635 1635 := by decide
private theorem cert_6202 : ExponentCertificate 6202 1636 1635 := by decide
private theorem cert_6203 : ExponentCertificate 6203 1636 1635 := by decide
private theorem cert_6204 : ExponentCertificate 6204 1636 1635 := by decide
private theorem cert_6205 : ExponentCertificate 6205 1636 1636 := by decide
private theorem cert_6206 : ExponentCertificate 6206 1636 1636 := by decide
private theorem cert_6207 : ExponentCertificate 6207 1637 1636 := by decide
private theorem cert_6208 : ExponentCertificate 6208 1637 1636 := by decide
private theorem cert_6209 : ExponentCertificate 6209 1637 1636 := by decide
private theorem cert_6210 : ExponentCertificate 6210 1637 1637 := by decide
private theorem cert_6211 : ExponentCertificate 6211 1638 1637 := by decide
private theorem cert_6212 : ExponentCertificate 6212 1638 1637 := by decide
private theorem cert_6213 : ExponentCertificate 6213 1638 1637 := by decide
private theorem cert_6214 : ExponentCertificate 6214 1638 1638 := by decide
private theorem cert_6215 : ExponentCertificate 6215 1639 1638 := by decide
private theorem cert_6216 : ExponentCertificate 6216 1639 1638 := by decide
private theorem cert_6217 : ExponentCertificate 6217 1639 1638 := by decide
private theorem cert_6218 : ExponentCertificate 6218 1639 1639 := by decide
private theorem cert_6219 : ExponentCertificate 6219 1640 1639 := by decide
private theorem cert_6220 : ExponentCertificate 6220 1640 1639 := by decide
private theorem cert_6221 : ExponentCertificate 6221 1640 1639 := by decide
private theorem cert_6222 : ExponentCertificate 6222 1640 1639 := by decide
private theorem cert_6223 : ExponentCertificate 6223 1640 1640 := by decide
private theorem cert_6224 : ExponentCertificate 6224 1641 1640 := by decide
private theorem cert_6225 : ExponentCertificate 6225 1641 1640 := by decide
private theorem cert_6226 : ExponentCertificate 6226 1641 1640 := by decide
private theorem cert_6227 : ExponentCertificate 6227 1641 1641 := by decide
private theorem cert_6228 : ExponentCertificate 6228 1642 1641 := by decide
private theorem cert_6229 : ExponentCertificate 6229 1642 1641 := by decide
private theorem cert_6230 : ExponentCertificate 6230 1642 1641 := by decide
private theorem cert_6231 : ExponentCertificate 6231 1642 1642 := by decide
private theorem cert_6232 : ExponentCertificate 6232 1643 1642 := by decide
private theorem cert_6233 : ExponentCertificate 6233 1643 1642 := by decide
private theorem cert_6234 : ExponentCertificate 6234 1643 1642 := by decide
private theorem cert_6235 : ExponentCertificate 6235 1643 1643 := by decide
private theorem cert_6236 : ExponentCertificate 6236 1643 1643 := by decide
private theorem cert_6237 : ExponentCertificate 6237 1644 1643 := by decide
private theorem cert_6238 : ExponentCertificate 6238 1644 1643 := by decide
private theorem cert_6239 : ExponentCertificate 6239 1644 1643 := by decide
private theorem cert_6240 : ExponentCertificate 6240 1644 1644 := by decide
private theorem cert_6241 : ExponentCertificate 6241 1645 1644 := by decide
private theorem cert_6242 : ExponentCertificate 6242 1645 1644 := by decide
private theorem cert_6243 : ExponentCertificate 6243 1645 1644 := by decide
private theorem suffix_6244 : 1645 < digitSum ((6244 : ℕ) ^ 1645 % 10 ^ 412) := by
  have hmod : (6244 : ℕ) ^ 1645 % 10 ^ 412 = 1485229336364992921154416655401205832322015027311218681601964517594440451430531277727829676052262622195232885365505666226722975227490367416762869735370388175830859511793810365440475604391710035627147699925339079844490952724115742065005929630035872208552316753166783660572797907069214841053871420467515314772078164827787449321758647686735572864329958387211388437333602048974332589864045316318115260576695555457024 := by
    have h1 : (6244 : ℕ) ^ 1 % 10 ^ 412 = 6244 := by decide
    have h3 : (6244 : ℕ) ^ 3 % 10 ^ 412 = 243438174784 := by
      have step := pow_mod_double_add_one (k := 6244) (e := 1) (m := 10 ^ 412) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (6244 : ℕ) ^ 6 % 10 ^ 412 = 59262144942165333446656 := by
      have step := pow_mod_double (k := 6244) (e := 3) (m := 10 ^ 412) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (6244 : ℕ) ^ 12 % 10 ^ 412 = 3512001823146212212723003929576487152397582336 := by
      have step := pow_mod_double (k := 6244) (e := 6) (m := 10 ^ 412) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h25 : (6244 : ℕ) ^ 25 % 10 ^ 412 = 77014475095304796366068617592339910585893871786893996257129125911365560240409044416722710298624 := by
      have step := pow_mod_double_add_one (k := 6244) (e := 12) (m := 10 ^ 412) h12
      have he : 2 * 12 + 1 = 25 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h51 : (6244 : ℕ) ^ 51 % 10 ^ 412 = 37034596212538035084362432073947600596845469242585085887006063106092073187306268170383593000630103059283730842589082840106069504989860906253076844428902153256869137458736726705900014204295839744 := by
      have step := pow_mod_double_add_one (k := 6244) (e := 25) (m := 10 ^ 412) h25
      have he : 2 * 25 + 1 = 51 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h102 : (6244 : ℕ) ^ 102 % 10 ^ 412 = 1371561316625736573138793536393859115299677048727278625142405603832183533562152782956474924259033711116372895879983608514850599948289110087660988365363739881551057213253488464661830921372308580547772310742656635939205931910650870939339364989544275720731596269799772861808269533697078692554304533644902761296585213004830810271632056126874245023165056622329228791544600599502968706129985536 := by
      have step := pow_mod_double (k := 6244) (e := 51) (m := 10 ^ 412) h51
      have he : 2 * 51 = 102 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h205 : (6244 : ℕ) ^ 205 % 10 ^ 412 = 8031525747439381316314906250689688556485953992763319666926024372736759405704573304185807740893617074544845130526119669437445744965280270178507549204409469969764839234274813247430804710445593357786428812892719285662517635315289013133814650137644810696378476713867734023047982194664254643994754778004583249606487626128217703853030475940073437485477582553290993181548870559673261225570534369572347367682878130356224 := by
      have step := pow_mod_double_add_one (k := 6244) (e := 102) (m := 10 ^ 412) h102
      have he : 2 * 102 + 1 = 205 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h411 : (6244 : ℕ) ^ 411 % 10 ^ 412 = 7534250504466261278382296604881533353974462378036292696286834846566427618895610248658045853928553427049611388372413217805623864627753599822894549666535917560753863302843198705855354226843880194778874185053694386098632838906747692084258310320667486138817267847384062330531545322356622383915384759425320125058325643837267332344058610565543518279966091603869034762571225652218483946892315593333115994708562300370944 := by
      have step := pow_mod_double_add_one (k := 6244) (e := 205) (m := 10 ^ 412) h205
      have he : 2 * 205 + 1 = 411 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h822 : (6244 : ℕ) ^ 822 % 10 ^ 412 = 1873236323113370843598243132046983088808904302166212912586381776670962481941641009399502589200566838678865391235267870259850661991892133380928810603512614687176070092478597500041097133955848911683260574060085812680720529837296829545236502465912119272117774780337983137179425698088219866033350369049009286232297488215673072468156236576452744711218448317829639395121078015746126608937159631692063635867759999451136 := by
      have step := pow_mod_double (k := 6244) (e := 411) (m := 10 ^ 412) h411
      have he : 2 * 411 = 822 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1645 : (6244 : ℕ) ^ 1645 % 10 ^ 412 = 1485229336364992921154416655401205832322015027311218681601964517594440451430531277727829676052262622195232885365505666226722975227490367416762869735370388175830859511793810365440475604391710035627147699925339079844490952724115742065005929630035872208552316753166783660572797907069214841053871420467515314772078164827787449321758647686735572864329958387211388437333602048974332589864045316318115260576695555457024 := by
      have step := pow_mod_double_add_one (k := 6244) (e := 822) (m := 10 ^ 412) h822
      have he : 2 * 822 + 1 = 1645 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1645
  rw [hmod]
  decide
private theorem cert_6244 : ExponentCertificate 6244 1645 1645 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 6244) (by decide) (by decide) (by decide) suffix_6244
private theorem cert_6245 : ExponentCertificate 6245 1646 1645 := by decide
private theorem cert_6246 : ExponentCertificate 6246 1646 1645 := by decide
private theorem cert_6247 : ExponentCertificate 6247 1646 1645 := by decide
private theorem cert_6248 : ExponentCertificate 6248 1646 1646 := by decide
private theorem cert_6249 : ExponentCertificate 6249 1647 1646 := by decide
private theorem cert_6250 : ExponentCertificate 6250 1647 1646 := by decide
private theorem cert_6251 : ExponentCertificate 6251 1647 1646 := by decide
private theorem cert_6252 : ExponentCertificate 6252 1647 1646 := by decide
private theorem cert_6253 : ExponentCertificate 6253 1647 1647 := by decide
private theorem cert_6254 : ExponentCertificate 6254 1648 1647 := by decide
private theorem cert_6255 : ExponentCertificate 6255 1648 1647 := by decide
private theorem cert_6256 : ExponentCertificate 6256 1648 1647 := by decide
private theorem cert_6257 : ExponentCertificate 6257 1648 1648 := by decide
private theorem cert_6258 : ExponentCertificate 6258 1649 1648 := by decide
private theorem cert_6259 : ExponentCertificate 6259 1649 1648 := by decide
private theorem cert_6260 : ExponentCertificate 6260 1649 1648 := by decide
private theorem cert_6261 : ExponentCertificate 6261 1649 1649 := by decide
private theorem cert_6262 : ExponentCertificate 6262 1650 1649 := by decide
private theorem cert_6263 : ExponentCertificate 6263 1650 1649 := by decide
private theorem cert_6264 : ExponentCertificate 6264 1650 1649 := by decide
private theorem cert_6265 : ExponentCertificate 6265 1650 1650 := by decide
private theorem cert_6266 : ExponentCertificate 6266 1650 1650 := by decide
private theorem cert_6267 : ExponentCertificate 6267 1651 1650 := by decide
private theorem cert_6268 : ExponentCertificate 6268 1651 1650 := by decide
private theorem cert_6269 : ExponentCertificate 6269 1651 1650 := by decide
private theorem cert_6270 : ExponentCertificate 6270 1651 1651 := by decide
private theorem cert_6271 : ExponentCertificate 6271 1652 1651 := by decide
private theorem cert_6272 : ExponentCertificate 6272 1652 1651 := by decide
private theorem cert_6273 : ExponentCertificate 6273 1652 1651 := by decide
private theorem cert_6274 : ExponentCertificate 6274 1652 1652 := by decide
private theorem cert_6275 : ExponentCertificate 6275 1653 1652 := by decide
private theorem cert_6276 : ExponentCertificate 6276 1653 1652 := by decide
private theorem cert_6277 : ExponentCertificate 6277 1653 1652 := by decide
private theorem cert_6278 : ExponentCertificate 6278 1653 1653 := by decide
private theorem cert_6279 : ExponentCertificate 6279 1654 1653 := by decide
private theorem cert_6280 : ExponentCertificate 6280 1654 1653 := by decide
private theorem cert_6281 : ExponentCertificate 6281 1654 1653 := by decide
private theorem cert_6282 : ExponentCertificate 6282 1654 1653 := by decide
private theorem cert_6283 : ExponentCertificate 6283 1654 1654 := by decide
private theorem cert_6284 : ExponentCertificate 6284 1655 1654 := by decide
private theorem cert_6285 : ExponentCertificate 6285 1655 1654 := by decide
private theorem cert_6286 : ExponentCertificate 6286 1655 1654 := by decide
private theorem cert_6287 : ExponentCertificate 6287 1655 1655 := by decide
private theorem cert_6288 : ExponentCertificate 6288 1656 1655 := by decide
private theorem cert_6289 : ExponentCertificate 6289 1656 1655 := by decide
private theorem cert_6290 : ExponentCertificate 6290 1656 1655 := by decide
private theorem suffix_6291 : 1656 < digitSum ((6291 : ℕ) ^ 1656 % 10 ^ 414) := by
  have hmod : (6291 : ℕ) ^ 1656 % 10 ^ 414 = 458303763028849884922651413632215442612139649727516660818958428453120533983481603317173947158173307019521911875629520619549310163894943130467936345580303760935850749371081811001006221453328456486325315411850150207425126570394300550271897132837147676727670453560387662303623902500923889338658710742729626795620035431740726354760814033862355646752093733397361498984384725567905013129305873128501884330527545543190241 := by
    have h1 : (6291 : ℕ) ^ 1 % 10 ^ 414 = 6291 := by decide
    have h3 : (6291 : ℕ) ^ 3 % 10 ^ 414 = 248976900171 := by
      have step := pow_mod_double_add_one (k := 6291) (e := 1) (m := 10 ^ 414) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (6291 : ℕ) ^ 6 % 10 ^ 414 = 61989496818760099829241 := by
      have step := pow_mod_double (k := 6291) (e := 3) (m := 10 ^ 414) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (6291 : ℕ) ^ 12 % 10 ^ 414 = 3842697715843068537016772377460688197358636081 := by
      have step := pow_mod_double (k := 6291) (e := 6) (m := 10 ^ 414) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h25 : (6291 : ℕ) ^ 25 % 10 ^ 414 = 92894955201058768909074906498132768649714659821406507081567043394122093855531969815575387587251 := by
      have step := pow_mod_double_add_one (k := 6291) (e := 12) (m := 10 ^ 414) h12
      have he : 2 * 12 + 1 = 25 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h51 : (6291 : ℕ) ^ 51 % 10 ^ 414 = 54288012767066047970153685703158504094154375089291271384068742590209654513248435841334155671915599214873100884616544577129537712268642721845829444518173033826050839204628155523168688223503473291 := by
      have step := pow_mod_double_add_one (k := 6291) (e := 25) (m := 10 ^ 414) h25
      have he : 2 * 25 + 1 = 51 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h103 : (6291 : ℕ) ^ 103 % 10 ^ 414 = 18540761785270121065010696891911370025777451635126567047593677174285324580164759326477298615191408095764094860147829059578538173644305948498309744336185720964132430719304961154085118048883568382109717953003629207757833248733988859549012584861675255659880349066641688744740391232654622965372235061888732226101208969965254942340105628900352729908381669330969728104631207641106588684460581954171 := by
      have step := pow_mod_double_add_one (k := 6291) (e := 51) (m := 10 ^ 414) h51
      have he : 2 * 51 + 1 = 103 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h207 : (6291 : ℕ) ^ 207 % 10 ^ 414 = 954942728704744384443799482970128786611524046102173806857909512730919245001453580466152252254388476860355356807070065923537363837670769717250949797635118149951891952959665288616010157376987967065145143499000193604284867536680866678735411548275315074599690690110645859619296624977575092149607835684447103449701831612800978410249550250574147644721110718024375308213469726729085475135131356971865216900732214773943131 := by
      have step := pow_mod_double_add_one (k := 6291) (e := 103) (m := 10 ^ 414) h103
      have he : 2 * 103 + 1 = 207 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h414 : (6291 : ℕ) ^ 414 % 10 ^ 414 = 745986331398588358739080648865590876580810328307291989100994058424046068724510361298234009281870818766699981260488605074509889648125424188722528128700557423485742296565243877211373640319355405802562507906647948195723752636097649039851237177435921592359267860709289566588149420539442309555595430958238578116699635322855467420985626428289492471404604204796706695703411025548324061268023059093635408390432038022083161 := by
      have step := pow_mod_double (k := 6291) (e := 207) (m := 10 ^ 414) h207
      have he : 2 * 207 = 414 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h828 : (6291 : ℕ) ^ 828 % 10 ^ 414 = 796205925861686009365255684903174325614357423245465635174003509244852753177432301738548268033172867563888685308903257131586087855957131277834327443464017935838484735143686392779997201572633328032050392549865950394582234007323906187734224458310496816716286248409514161737729487349880534980586062490302531199918479164156285827262591780725077815489775565516811483277853455067482709232594713894406767109911901999751921 := by
      have step := pow_mod_double (k := 6291) (e := 414) (m := 10 ^ 414) h414
      have he : 2 * 414 = 828 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1656 : (6291 : ℕ) ^ 1656 % 10 ^ 414 = 458303763028849884922651413632215442612139649727516660818958428453120533983481603317173947158173307019521911875629520619549310163894943130467936345580303760935850749371081811001006221453328456486325315411850150207425126570394300550271897132837147676727670453560387662303623902500923889338658710742729626795620035431740726354760814033862355646752093733397361498984384725567905013129305873128501884330527545543190241 := by
      have step := pow_mod_double (k := 6291) (e := 828) (m := 10 ^ 414) h828
      have he : 2 * 828 = 1656 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1656
  rw [hmod]
  decide
private theorem cert_6291 : ExponentCertificate 6291 1656 1656 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 6291) (by decide) (by decide) (by decide) suffix_6291
private theorem cert_6292 : ExponentCertificate 6292 1657 1656 := by decide
private theorem cert_6293 : ExponentCertificate 6293 1657 1656 := by decide
private theorem cert_6294 : ExponentCertificate 6294 1657 1656 := by decide
private theorem cert_6295 : ExponentCertificate 6295 1657 1657 := by decide
private theorem cert_6296 : ExponentCertificate 6296 1657 1657 := by decide
private theorem cert_6297 : ExponentCertificate 6297 1658 1657 := by decide
private theorem cert_6298 : ExponentCertificate 6298 1658 1657 := by decide
private theorem cert_6299 : ExponentCertificate 6299 1658 1657 := by decide
private theorem cert_6300 : ExponentCertificate 6300 1658 1658 := by decide

private theorem certificates_6201_6300 {k : ℕ} (hlo : 6201 ≤ k) (hhi : k ≤ 6300) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1635, 1635, cert_6201⟩
  · exact ⟨1636, 1635, cert_6202⟩
  · exact ⟨1636, 1635, cert_6203⟩
  · exact ⟨1636, 1635, cert_6204⟩
  · exact ⟨1636, 1636, cert_6205⟩
  · exact ⟨1636, 1636, cert_6206⟩
  · exact ⟨1637, 1636, cert_6207⟩
  · exact ⟨1637, 1636, cert_6208⟩
  · exact ⟨1637, 1636, cert_6209⟩
  · exact ⟨1637, 1637, cert_6210⟩
  · exact ⟨1638, 1637, cert_6211⟩
  · exact ⟨1638, 1637, cert_6212⟩
  · exact ⟨1638, 1637, cert_6213⟩
  · exact ⟨1638, 1638, cert_6214⟩
  · exact ⟨1639, 1638, cert_6215⟩
  · exact ⟨1639, 1638, cert_6216⟩
  · exact ⟨1639, 1638, cert_6217⟩
  · exact ⟨1639, 1639, cert_6218⟩
  · exact ⟨1640, 1639, cert_6219⟩
  · exact ⟨1640, 1639, cert_6220⟩
  · exact ⟨1640, 1639, cert_6221⟩
  · exact ⟨1640, 1639, cert_6222⟩
  · exact ⟨1640, 1640, cert_6223⟩
  · exact ⟨1641, 1640, cert_6224⟩
  · exact ⟨1641, 1640, cert_6225⟩
  · exact ⟨1641, 1640, cert_6226⟩
  · exact ⟨1641, 1641, cert_6227⟩
  · exact ⟨1642, 1641, cert_6228⟩
  · exact ⟨1642, 1641, cert_6229⟩
  · exact ⟨1642, 1641, cert_6230⟩
  · exact ⟨1642, 1642, cert_6231⟩
  · exact ⟨1643, 1642, cert_6232⟩
  · exact ⟨1643, 1642, cert_6233⟩
  · exact ⟨1643, 1642, cert_6234⟩
  · exact ⟨1643, 1643, cert_6235⟩
  · exact ⟨1643, 1643, cert_6236⟩
  · exact ⟨1644, 1643, cert_6237⟩
  · exact ⟨1644, 1643, cert_6238⟩
  · exact ⟨1644, 1643, cert_6239⟩
  · exact ⟨1644, 1644, cert_6240⟩
  · exact ⟨1645, 1644, cert_6241⟩
  · exact ⟨1645, 1644, cert_6242⟩
  · exact ⟨1645, 1644, cert_6243⟩
  · exact ⟨1645, 1645, cert_6244⟩
  · exact ⟨1646, 1645, cert_6245⟩
  · exact ⟨1646, 1645, cert_6246⟩
  · exact ⟨1646, 1645, cert_6247⟩
  · exact ⟨1646, 1646, cert_6248⟩
  · exact ⟨1647, 1646, cert_6249⟩
  · exact ⟨1647, 1646, cert_6250⟩
  · exact ⟨1647, 1646, cert_6251⟩
  · exact ⟨1647, 1646, cert_6252⟩
  · exact ⟨1647, 1647, cert_6253⟩
  · exact ⟨1648, 1647, cert_6254⟩
  · exact ⟨1648, 1647, cert_6255⟩
  · exact ⟨1648, 1647, cert_6256⟩
  · exact ⟨1648, 1648, cert_6257⟩
  · exact ⟨1649, 1648, cert_6258⟩
  · exact ⟨1649, 1648, cert_6259⟩
  · exact ⟨1649, 1648, cert_6260⟩
  · exact ⟨1649, 1649, cert_6261⟩
  · exact ⟨1650, 1649, cert_6262⟩
  · exact ⟨1650, 1649, cert_6263⟩
  · exact ⟨1650, 1649, cert_6264⟩
  · exact ⟨1650, 1650, cert_6265⟩
  · exact ⟨1650, 1650, cert_6266⟩
  · exact ⟨1651, 1650, cert_6267⟩
  · exact ⟨1651, 1650, cert_6268⟩
  · exact ⟨1651, 1650, cert_6269⟩
  · exact ⟨1651, 1651, cert_6270⟩
  · exact ⟨1652, 1651, cert_6271⟩
  · exact ⟨1652, 1651, cert_6272⟩
  · exact ⟨1652, 1651, cert_6273⟩
  · exact ⟨1652, 1652, cert_6274⟩
  · exact ⟨1653, 1652, cert_6275⟩
  · exact ⟨1653, 1652, cert_6276⟩
  · exact ⟨1653, 1652, cert_6277⟩
  · exact ⟨1653, 1653, cert_6278⟩
  · exact ⟨1654, 1653, cert_6279⟩
  · exact ⟨1654, 1653, cert_6280⟩
  · exact ⟨1654, 1653, cert_6281⟩
  · exact ⟨1654, 1653, cert_6282⟩
  · exact ⟨1654, 1654, cert_6283⟩
  · exact ⟨1655, 1654, cert_6284⟩
  · exact ⟨1655, 1654, cert_6285⟩
  · exact ⟨1655, 1654, cert_6286⟩
  · exact ⟨1655, 1655, cert_6287⟩
  · exact ⟨1656, 1655, cert_6288⟩
  · exact ⟨1656, 1655, cert_6289⟩
  · exact ⟨1656, 1655, cert_6290⟩
  · exact ⟨1656, 1656, cert_6291⟩
  · exact ⟨1657, 1656, cert_6292⟩
  · exact ⟨1657, 1656, cert_6293⟩
  · exact ⟨1657, 1656, cert_6294⟩
  · exact ⟨1657, 1657, cert_6295⟩
  · exact ⟨1657, 1657, cert_6296⟩
  · exact ⟨1658, 1657, cert_6297⟩
  · exact ⟨1658, 1657, cert_6298⟩
  · exact ⟨1658, 1657, cert_6299⟩
  · exact ⟨1658, 1658, cert_6300⟩

theorem no_fixed_digitCount_6201_6300 {n : ℕ} (hn : a n = n)
    (hlo : 6201 ≤ digitCount n) (hhi : digitCount n ≤ 6300) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_6201_6300 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_6201_6300
end OeisA113010
