import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 4401
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_4301 : ExponentCertificate 4301 1184 1183 := by decide
private theorem cert_4302 : ExponentCertificate 4302 1184 1183 := by decide
private theorem cert_4303 : ExponentCertificate 4303 1184 1184 := by decide
private theorem cert_4304 : ExponentCertificate 4304 1185 1184 := by decide
private theorem cert_4305 : ExponentCertificate 4305 1185 1184 := by decide
private theorem cert_4306 : ExponentCertificate 4306 1185 1184 := by decide
private theorem cert_4307 : ExponentCertificate 4307 1185 1185 := by decide
private theorem cert_4308 : ExponentCertificate 4308 1186 1185 := by decide
private theorem cert_4309 : ExponentCertificate 4309 1186 1185 := by decide
private theorem cert_4310 : ExponentCertificate 4310 1186 1185 := by decide
private theorem cert_4311 : ExponentCertificate 4311 1186 1186 := by decide
private theorem cert_4312 : ExponentCertificate 4312 1187 1186 := by decide
private theorem cert_4313 : ExponentCertificate 4313 1187 1186 := by decide
private theorem cert_4314 : ExponentCertificate 4314 1187 1186 := by decide
private theorem cert_4315 : ExponentCertificate 4315 1187 1187 := by decide
private theorem cert_4316 : ExponentCertificate 4316 1188 1187 := by decide
private theorem cert_4317 : ExponentCertificate 4317 1188 1187 := by decide
private theorem cert_4318 : ExponentCertificate 4318 1188 1187 := by decide
private theorem cert_4319 : ExponentCertificate 4319 1188 1188 := by decide
private theorem cert_4320 : ExponentCertificate 4320 1189 1188 := by decide
private theorem cert_4321 : ExponentCertificate 4321 1189 1188 := by decide
private theorem cert_4322 : ExponentCertificate 4322 1189 1188 := by decide
private theorem cert_4323 : ExponentCertificate 4323 1189 1189 := by decide
private theorem cert_4324 : ExponentCertificate 4324 1189 1189 := by decide
private theorem cert_4325 : ExponentCertificate 4325 1190 1189 := by decide
private theorem cert_4326 : ExponentCertificate 4326 1190 1189 := by decide
private theorem cert_4327 : ExponentCertificate 4327 1190 1189 := by decide
private theorem cert_4328 : ExponentCertificate 4328 1190 1190 := by decide
private theorem cert_4329 : ExponentCertificate 4329 1191 1190 := by decide
private theorem cert_4330 : ExponentCertificate 4330 1191 1190 := by decide
private theorem cert_4331 : ExponentCertificate 4331 1191 1190 := by decide
private theorem cert_4332 : ExponentCertificate 4332 1191 1191 := by decide
private theorem cert_4333 : ExponentCertificate 4333 1192 1191 := by decide
private theorem cert_4334 : ExponentCertificate 4334 1192 1191 := by decide
private theorem cert_4335 : ExponentCertificate 4335 1192 1191 := by decide
private theorem cert_4336 : ExponentCertificate 4336 1192 1192 := by decide
private theorem cert_4337 : ExponentCertificate 4337 1193 1192 := by decide
private theorem cert_4338 : ExponentCertificate 4338 1193 1192 := by decide
private theorem cert_4339 : ExponentCertificate 4339 1193 1192 := by decide
private theorem suffix_4340 : 1193 < digitSum ((434 : ℕ) ^ 1193 % 10 ^ 299) := by
  have hmod : (434 : ℕ) ^ 1193 % 10 ^ 299 = 31894842103070955599357102406012399263907045977595424712233987672742666640253901054579788663338522025206106406622408288206376809059511443219679850231877355351114376340341660047618628608344644779334425212920584615371399802945774316260497477804511823160105677997182600533655800130676993477659699707904 := by
    have h1 : (434 : ℕ) ^ 1 % 10 ^ 299 = 434 := by decide
    have h2 : (434 : ℕ) ^ 2 % 10 ^ 299 = 188356 := by
      have step := pow_mod_double (k := 434) (e := 1) (m := 10 ^ 299) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (434 : ℕ) ^ 4 % 10 ^ 299 = 35477982736 := by
      have step := pow_mod_double (k := 434) (e := 2) (m := 10 ^ 299) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (434 : ℕ) ^ 9 % 10 ^ 299 = 546270270412906695832064 := by
      have step := pow_mod_double_add_one (k := 434) (e := 4) (m := 10 ^ 299) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (434 : ℕ) ^ 18 % 10 ^ 299 = 298411208336990204604470891337512618229290500096 := by
      have step := pow_mod_double (k := 434) (e := 9) (m := 10 ^ 299) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h37 : (434 : ℕ) ^ 37 % 10 ^ 299 = 38647374179335876332168675259785453453661224151526558385379342331554570733964597343178818787999744 := by
      have step := pow_mod_double_add_one (k := 434) (e := 18) (m := 10 ^ 299) h18
      have he : 2 * 18 + 1 = 37 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h74 : (434 : ℕ) ^ 74 % 10 ^ 299 = 1493619530957597400615498587525847984048806556343686010040054597243077599445843912624335217085764307012320067357532014948457863883947653757914045501083223637864543172382746853102081388780544065536 := by
      have step := pow_mod_double (k := 434) (e := 37) (m := 10 ^ 299) h37
      have he : 2 * 37 = 74 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h149 : (434 : ℕ) ^ 149 % 10 ^ 299 = 82502130188037749567749159538082736567340178922071459512321303315748534626964576702539720463625668479909185974423947777649328886297629137500268024169085147162342777508136360439992407585797866909768723746809937802805894379119463038537691889922497001945818790884860520385661238165651161888878927806464 := by
      have step := pow_mod_double_add_one (k := 434) (e := 74) (m := 10 ^ 299) h74
      have he : 2 * 74 + 1 = 149 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h298 : (434 : ℕ) ^ 298 % 10 ^ 299 = 48995891389058994581380455621073969172188992688223108106902650233738377040465311579588482355692025571299354005994811119414035215324609357136010417196349350545784794562518209422345439141663224297070505421355496537826916120876434340332090714717856400558236707627697602635834121638107777039618640183296 := by
      have step := pow_mod_double (k := 434) (e := 149) (m := 10 ^ 299) h149
      have he : 2 * 149 = 298 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h596 : (434 : ℕ) ^ 596 % 10 ^ 299 = 53798549105755888375195989833514367802864109673568792475788669516409742518030266653792917652836044185990662715661451688580112205356051321811603812449485046355778764903381778530073543257080522904284777872203026485512237646242734729281436132407022224666209336814943150235917453402835957476508477423616 := by
      have step := pow_mod_double (k := 434) (e := 298) (m := 10 ^ 299) h298
      have he : 2 * 298 = 596 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1193 : (434 : ℕ) ^ 1193 % 10 ^ 299 = 31894842103070955599357102406012399263907045977595424712233987672742666640253901054579788663338522025206106406622408288206376809059511443219679850231877355351114376340341660047618628608344644779334425212920584615371399802945774316260497477804511823160105677997182600533655800130676993477659699707904 := by
      have step := pow_mod_double_add_one (k := 434) (e := 596) (m := 10 ^ 299) h596
      have he : 2 * 596 + 1 = 1193 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1193
  rw [hmod]
  decide
private theorem cert_4340 : ExponentCertificate 4340 1193 1193 :=
  exponentCertificate_of_normalized_suffix (t := 1) (u := 434) (by decide) (by decide) (by decide) suffix_4340
private theorem cert_4341 : ExponentCertificate 4341 1194 1193 := by decide
private theorem cert_4342 : ExponentCertificate 4342 1194 1193 := by decide
private theorem cert_4343 : ExponentCertificate 4343 1194 1193 := by decide
private theorem cert_4344 : ExponentCertificate 4344 1194 1194 := by decide
private theorem cert_4345 : ExponentCertificate 4345 1195 1194 := by decide
private theorem cert_4346 : ExponentCertificate 4346 1195 1194 := by decide
private theorem cert_4347 : ExponentCertificate 4347 1195 1194 := by decide
private theorem cert_4348 : ExponentCertificate 4348 1195 1195 := by decide
private theorem cert_4349 : ExponentCertificate 4349 1196 1195 := by decide
private theorem cert_4350 : ExponentCertificate 4350 1196 1195 := by decide
private theorem cert_4351 : ExponentCertificate 4351 1196 1195 := by decide
private theorem cert_4352 : ExponentCertificate 4352 1196 1196 := by decide
private theorem cert_4353 : ExponentCertificate 4353 1197 1196 := by decide
private theorem cert_4354 : ExponentCertificate 4354 1197 1196 := by decide
private theorem cert_4355 : ExponentCertificate 4355 1197 1196 := by decide
private theorem suffix_4356 : 1197 < digitSum ((4356 : ℕ) ^ 1197 % 10 ^ 300) := by
  have hmod : (4356 : ℕ) ^ 1197 % 10 ^ 300 = 202553864856148935373178173333980189177943732693856471513138475929640841823121888944559289621485676578311004884571960985895589971784092206511100822149433003479917023375221733854351275880966585618539082223077918635782611166131246420850211858173780827080252109053323136267900666359733723259269688590336 := by
    have h1 : (4356 : ℕ) ^ 1 % 10 ^ 300 = 4356 := by decide
    have h2 : (4356 : ℕ) ^ 2 % 10 ^ 300 = 18974736 := by
      have step := pow_mod_double (k := 4356) (e := 1) (m := 10 ^ 300) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4356 : ℕ) ^ 4 % 10 ^ 300 = 360040606269696 := by
      have step := pow_mod_double (k := 4356) (e := 2) (m := 10 ^ 300) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (4356 : ℕ) ^ 9 % 10 ^ 300 = 564664961438246926567398233604096 := by
      have step := pow_mod_double_add_one (k := 4356) (e := 4) (m := 10 ^ 300) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (4356 : ℕ) ^ 18 % 10 ^ 300 = 318846518676056888589159943544822054272102701514840295289667977216 := by
      have step := pow_mod_double (k := 4356) (e := 9) (m := 10 ^ 300) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h37 : (4356 : ℕ) ^ 37 % 10 ^ 300 = 442844474367339806553819266450492943941310937051798313275032619854306447000363866816924804341723532062325858096663348766966018302017536 := by
      have step := pow_mod_double_add_one (k := 4356) (e := 18) (m := 10 ^ 300) h18
      have he : 2 * 18 + 1 = 37 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h74 : (4356 : ℕ) ^ 74 % 10 ^ 300 = 196111228477685482960114224963666149701491210733603638903765517456107414938479640529903608206921313338538434294133442054143235003925210305307283882628139679003268742165459175075250740648216147454085160344566676256890506462639545592306975333229598991753995397888051511296 := by
      have step := pow_mod_double (k := 4356) (e := 37) (m := 10 ^ 300) h37
      have he : 2 * 37 = 74 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h149 : (4356 : ℕ) ^ 149 % 10 ^ 300 = 732040439269832854681520853797037719536792221650447439634240003568161080610137368926781058586884020146483768605497600424341057982100739384580136706020461383059123492947143667399311074626384223948629084455993157125265825635211181614448598948116686142148910803661531555604360812195399439561485551927296 := by
      have step := pow_mod_double_add_one (k := 4356) (e := 74) (m := 10 ^ 300) h74
      have he : 2 * 74 + 1 = 149 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h299 : (4356 : ℕ) ^ 299 % 10 ^ 300 = 503205709442949548233778149508731483520375498582720698216325304208557897095838879936064680765302218402862291790041045568767442815373847222604392531742161804987830174107638799659252977741241838836146975714417328523087747458988737803480199238036313865253185501990618454082523179613280655218464360759296 := by
      have step := pow_mod_double_add_one (k := 4356) (e := 149) (m := 10 ^ 300) h149
      have he : 2 * 149 + 1 = 299 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h598 : (4356 : ℕ) ^ 598 % 10 ^ 300 = 277303651895626881065696509408239666337036767868728948866409449580744452845238396006066421841715181710535802510833894791619123567780252077237684222342480039040686286109194707313947991210049847419914110051928335905584935600123426198784953089948391784370905310538458076877012929373359727829957650415616 := by
      have step := pow_mod_double (k := 4356) (e := 299) (m := 10 ^ 300) h299
      have he : 2 * 299 = 598 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1197 : (4356 : ℕ) ^ 1197 % 10 ^ 300 = 202553864856148935373178173333980189177943732693856471513138475929640841823121888944559289621485676578311004884571960985895589971784092206511100822149433003479917023375221733854351275880966585618539082223077918635782611166131246420850211858173780827080252109053323136267900666359733723259269688590336 := by
      have step := pow_mod_double_add_one (k := 4356) (e := 598) (m := 10 ^ 300) h598
      have he : 2 * 598 + 1 = 1197 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1197
  rw [hmod]
  decide
private theorem cert_4356 : ExponentCertificate 4356 1197 1197 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4356) (by decide) (by decide) (by decide) suffix_4356
private theorem cert_4357 : ExponentCertificate 4357 1197 1197 := by decide
private theorem cert_4358 : ExponentCertificate 4358 1198 1197 := by decide
private theorem cert_4359 : ExponentCertificate 4359 1198 1197 := by decide
private theorem cert_4360 : ExponentCertificate 4360 1198 1197 := by decide
private theorem cert_4361 : ExponentCertificate 4361 1198 1198 := by decide
private theorem cert_4362 : ExponentCertificate 4362 1199 1198 := by decide
private theorem cert_4363 : ExponentCertificate 4363 1199 1198 := by decide
private theorem cert_4364 : ExponentCertificate 4364 1199 1198 := by decide
private theorem cert_4365 : ExponentCertificate 4365 1199 1199 := by decide
private theorem cert_4366 : ExponentCertificate 4366 1200 1199 := by decide
private theorem cert_4367 : ExponentCertificate 4367 1200 1199 := by decide
private theorem cert_4368 : ExponentCertificate 4368 1200 1199 := by decide
private theorem cert_4369 : ExponentCertificate 4369 1200 1200 := by decide
private theorem cert_4370 : ExponentCertificate 4370 1201 1200 := by decide
private theorem cert_4371 : ExponentCertificate 4371 1201 1200 := by decide
private theorem cert_4372 : ExponentCertificate 4372 1201 1200 := by decide
private theorem cert_4373 : ExponentCertificate 4373 1201 1201 := by decide
private theorem cert_4374 : ExponentCertificate 4374 1202 1201 := by decide
private theorem cert_4375 : ExponentCertificate 4375 1202 1201 := by decide
private theorem cert_4376 : ExponentCertificate 4376 1202 1201 := by decide
private theorem cert_4377 : ExponentCertificate 4377 1202 1202 := by decide
private theorem cert_4378 : ExponentCertificate 4378 1203 1202 := by decide
private theorem cert_4379 : ExponentCertificate 4379 1203 1202 := by decide
private theorem cert_4380 : ExponentCertificate 4380 1203 1202 := by decide
private theorem cert_4381 : ExponentCertificate 4381 1203 1203 := by decide
private theorem cert_4382 : ExponentCertificate 4382 1204 1203 := by decide
private theorem cert_4383 : ExponentCertificate 4383 1204 1203 := by decide
private theorem cert_4384 : ExponentCertificate 4384 1204 1203 := by decide
private theorem suffix_4385 : 1204 < digitSum ((4385 : ℕ) ^ 1204 % 10 ^ 301) := by
  have hmod : (4385 : ℕ) ^ 1204 % 10 ^ 301 = 4758093097709465437441468645313057919810739378209166936170347302525968069588362970834142316630665958987084794839171448487703473629705002393544896805145765127562007131722285793184049736950279938726337621647360651370731719308108335178851812264460336301437546322780358654114252203726209700107574462890625 := by
    have h1 : (4385 : ℕ) ^ 1 % 10 ^ 301 = 4385 := by decide
    have h2 : (4385 : ℕ) ^ 2 % 10 ^ 301 = 19228225 := by
      have step := pow_mod_double (k := 4385) (e := 1) (m := 10 ^ 301) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4385 : ℕ) ^ 4 % 10 ^ 301 = 369724636650625 := by
      have step := pow_mod_double (k := 4385) (e := 2) (m := 10 ^ 301) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (4385 : ℕ) ^ 9 % 10 ^ 301 = 599413305960124837495302025390625 := by
      have step := pow_mod_double_add_one (k := 4385) (e := 4) (m := 10 ^ 301) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (4385 : ℕ) ^ 18 % 10 ^ 301 = 359296311362046230033133521600557016564461475262305332183837890625 := by
      have step := pow_mod_double (k := 4385) (e := 9) (m := 10 ^ 301) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h37 : (4385 : ℕ) ^ 37 % 10 ^ 301 = 566076485586463284702691931562003521933610314090017131830498577590785673978812775033512883347944409065720508588128723204135894775390625 := by
      have step := pow_mod_double_add_one (k := 4385) (e := 18) (m := 10 ^ 301) h18
      have he : 2 * 18 + 1 = 37 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h75 : (4385 : ℕ) ^ 75 % 10 ^ 301 = 1405140746336245229006867943791552316278867325253132486387645980986739151760595965923252329121738747348952967795142484588832480602634851761577306218245605922245445502153997007136316196505501480079931755988112515546013472320612450031963869268025746350758709013462066650390625 := by
      have step := pow_mod_double_add_one (k := 4385) (e := 37) (m := 10 ^ 301) h37
      have he : 2 * 37 + 1 = 75 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h150 : (4385 : ℕ) ^ 150 % 10 ^ 301 = 5594337737801027031088903834074560962628846196772664119300782502847940096682835718058880225889917848135994055773374858165379708761746785483574802336045221314043142688471896434790368090585596462956939789658824612077488487678754256779584012524602150368019070334792142151769667179905809462070465087890625 := by
      have step := pow_mod_double (k := 4385) (e := 75) (m := 10 ^ 301) h75
      have he : 2 * 75 = 150 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h301 : (4385 : ℕ) ^ 301 % 10 ^ 301 = 6915657058854102259141097971571143570665990571308963571625272867043790607667690310089057757138575755720977825088684024094343663042655970271603169141631599474937396333973137315976995382943933442027212697444800607954842960023122314333690865561610856357774250306215402250842316789203323423862457275390625 := by
      have step := pow_mod_double_add_one (k := 4385) (e := 150) (m := 10 ^ 301) h150
      have he : 2 * 150 + 1 = 301 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h602 : (4385 : ℕ) ^ 602 % 10 ^ 301 = 4668491427529921388761848500247237441486845349198198450534249036954325013573232001309767094297232426584968610800005501097054837018948087633854896427043014259388762149286044925062162660926495847190352312982854786388003199169238692733988366567093001635314932482902217092401997433626092970371246337890625 := by
      have step := pow_mod_double (k := 4385) (e := 301) (m := 10 ^ 301) h301
      have he : 2 * 301 = 602 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1204 : (4385 : ℕ) ^ 1204 % 10 ^ 301 = 4758093097709465437441468645313057919810739378209166936170347302525968069588362970834142316630665958987084794839171448487703473629705002393544896805145765127562007131722285793184049736950279938726337621647360651370731719308108335178851812264460336301437546322780358654114252203726209700107574462890625 := by
      have step := pow_mod_double (k := 4385) (e := 602) (m := 10 ^ 301) h602
      have he : 2 * 602 = 1204 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1204
  rw [hmod]
  decide
private theorem cert_4385 : ExponentCertificate 4385 1204 1204 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4385) (by decide) (by decide) (by decide) suffix_4385
private theorem cert_4386 : ExponentCertificate 4386 1204 1204 := by decide
private theorem cert_4387 : ExponentCertificate 4387 1205 1204 := by decide
private theorem cert_4388 : ExponentCertificate 4388 1205 1204 := by decide
private theorem cert_4389 : ExponentCertificate 4389 1205 1204 := by decide
private theorem cert_4390 : ExponentCertificate 4390 1205 1205 := by decide
private theorem cert_4391 : ExponentCertificate 4391 1206 1205 := by decide
private theorem cert_4392 : ExponentCertificate 4392 1206 1205 := by decide
private theorem cert_4393 : ExponentCertificate 4393 1206 1205 := by decide
private theorem cert_4394 : ExponentCertificate 4394 1206 1206 := by decide
private theorem cert_4395 : ExponentCertificate 4395 1207 1206 := by decide
private theorem cert_4396 : ExponentCertificate 4396 1207 1206 := by decide
private theorem cert_4397 : ExponentCertificate 4397 1207 1206 := by decide
private theorem cert_4398 : ExponentCertificate 4398 1207 1207 := by decide
private theorem cert_4399 : ExponentCertificate 4399 1208 1207 := by decide
private theorem cert_4400 : ExponentCertificate 4400 1208 1207 := by decide

private theorem certificates_4301_4400 {k : ℕ} (hlo : 4301 ≤ k) (hhi : k ≤ 4400) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1184, 1183, cert_4301⟩
  · exact ⟨1184, 1183, cert_4302⟩
  · exact ⟨1184, 1184, cert_4303⟩
  · exact ⟨1185, 1184, cert_4304⟩
  · exact ⟨1185, 1184, cert_4305⟩
  · exact ⟨1185, 1184, cert_4306⟩
  · exact ⟨1185, 1185, cert_4307⟩
  · exact ⟨1186, 1185, cert_4308⟩
  · exact ⟨1186, 1185, cert_4309⟩
  · exact ⟨1186, 1185, cert_4310⟩
  · exact ⟨1186, 1186, cert_4311⟩
  · exact ⟨1187, 1186, cert_4312⟩
  · exact ⟨1187, 1186, cert_4313⟩
  · exact ⟨1187, 1186, cert_4314⟩
  · exact ⟨1187, 1187, cert_4315⟩
  · exact ⟨1188, 1187, cert_4316⟩
  · exact ⟨1188, 1187, cert_4317⟩
  · exact ⟨1188, 1187, cert_4318⟩
  · exact ⟨1188, 1188, cert_4319⟩
  · exact ⟨1189, 1188, cert_4320⟩
  · exact ⟨1189, 1188, cert_4321⟩
  · exact ⟨1189, 1188, cert_4322⟩
  · exact ⟨1189, 1189, cert_4323⟩
  · exact ⟨1189, 1189, cert_4324⟩
  · exact ⟨1190, 1189, cert_4325⟩
  · exact ⟨1190, 1189, cert_4326⟩
  · exact ⟨1190, 1189, cert_4327⟩
  · exact ⟨1190, 1190, cert_4328⟩
  · exact ⟨1191, 1190, cert_4329⟩
  · exact ⟨1191, 1190, cert_4330⟩
  · exact ⟨1191, 1190, cert_4331⟩
  · exact ⟨1191, 1191, cert_4332⟩
  · exact ⟨1192, 1191, cert_4333⟩
  · exact ⟨1192, 1191, cert_4334⟩
  · exact ⟨1192, 1191, cert_4335⟩
  · exact ⟨1192, 1192, cert_4336⟩
  · exact ⟨1193, 1192, cert_4337⟩
  · exact ⟨1193, 1192, cert_4338⟩
  · exact ⟨1193, 1192, cert_4339⟩
  · exact ⟨1193, 1193, cert_4340⟩
  · exact ⟨1194, 1193, cert_4341⟩
  · exact ⟨1194, 1193, cert_4342⟩
  · exact ⟨1194, 1193, cert_4343⟩
  · exact ⟨1194, 1194, cert_4344⟩
  · exact ⟨1195, 1194, cert_4345⟩
  · exact ⟨1195, 1194, cert_4346⟩
  · exact ⟨1195, 1194, cert_4347⟩
  · exact ⟨1195, 1195, cert_4348⟩
  · exact ⟨1196, 1195, cert_4349⟩
  · exact ⟨1196, 1195, cert_4350⟩
  · exact ⟨1196, 1195, cert_4351⟩
  · exact ⟨1196, 1196, cert_4352⟩
  · exact ⟨1197, 1196, cert_4353⟩
  · exact ⟨1197, 1196, cert_4354⟩
  · exact ⟨1197, 1196, cert_4355⟩
  · exact ⟨1197, 1197, cert_4356⟩
  · exact ⟨1197, 1197, cert_4357⟩
  · exact ⟨1198, 1197, cert_4358⟩
  · exact ⟨1198, 1197, cert_4359⟩
  · exact ⟨1198, 1197, cert_4360⟩
  · exact ⟨1198, 1198, cert_4361⟩
  · exact ⟨1199, 1198, cert_4362⟩
  · exact ⟨1199, 1198, cert_4363⟩
  · exact ⟨1199, 1198, cert_4364⟩
  · exact ⟨1199, 1199, cert_4365⟩
  · exact ⟨1200, 1199, cert_4366⟩
  · exact ⟨1200, 1199, cert_4367⟩
  · exact ⟨1200, 1199, cert_4368⟩
  · exact ⟨1200, 1200, cert_4369⟩
  · exact ⟨1201, 1200, cert_4370⟩
  · exact ⟨1201, 1200, cert_4371⟩
  · exact ⟨1201, 1200, cert_4372⟩
  · exact ⟨1201, 1201, cert_4373⟩
  · exact ⟨1202, 1201, cert_4374⟩
  · exact ⟨1202, 1201, cert_4375⟩
  · exact ⟨1202, 1201, cert_4376⟩
  · exact ⟨1202, 1202, cert_4377⟩
  · exact ⟨1203, 1202, cert_4378⟩
  · exact ⟨1203, 1202, cert_4379⟩
  · exact ⟨1203, 1202, cert_4380⟩
  · exact ⟨1203, 1203, cert_4381⟩
  · exact ⟨1204, 1203, cert_4382⟩
  · exact ⟨1204, 1203, cert_4383⟩
  · exact ⟨1204, 1203, cert_4384⟩
  · exact ⟨1204, 1204, cert_4385⟩
  · exact ⟨1204, 1204, cert_4386⟩
  · exact ⟨1205, 1204, cert_4387⟩
  · exact ⟨1205, 1204, cert_4388⟩
  · exact ⟨1205, 1204, cert_4389⟩
  · exact ⟨1205, 1205, cert_4390⟩
  · exact ⟨1206, 1205, cert_4391⟩
  · exact ⟨1206, 1205, cert_4392⟩
  · exact ⟨1206, 1205, cert_4393⟩
  · exact ⟨1206, 1206, cert_4394⟩
  · exact ⟨1207, 1206, cert_4395⟩
  · exact ⟨1207, 1206, cert_4396⟩
  · exact ⟨1207, 1206, cert_4397⟩
  · exact ⟨1207, 1207, cert_4398⟩
  · exact ⟨1208, 1207, cert_4399⟩
  · exact ⟨1208, 1207, cert_4400⟩

theorem no_fixed_digitCount_4301_4400 {n : ℕ} (hn : a n = n)
    (hlo : 4301 ≤ digitCount n) (hhi : digitCount n ≤ 4400) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_4301_4400 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_4301_4400
end OeisA113010
