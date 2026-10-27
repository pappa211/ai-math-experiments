import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 5201
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_5101 : ExponentCertificate 5101 1376 1375 := by decide
private theorem cert_5102 : ExponentCertificate 5102 1376 1376 := by decide
private theorem cert_5103 : ExponentCertificate 5103 1377 1376 := by decide
private theorem cert_5104 : ExponentCertificate 5104 1377 1376 := by decide
private theorem cert_5105 : ExponentCertificate 5105 1377 1376 := by decide
private theorem cert_5106 : ExponentCertificate 5106 1377 1376 := by decide
private theorem cert_5107 : ExponentCertificate 5107 1377 1377 := by decide
private theorem cert_5108 : ExponentCertificate 5108 1378 1377 := by decide
private theorem cert_5109 : ExponentCertificate 5109 1378 1377 := by decide
private theorem cert_5110 : ExponentCertificate 5110 1378 1377 := by decide
private theorem suffix_5111 : 1378 < digitSum ((5111 : ℕ) ^ 1378 % 10 ^ 345) := by
  have hmod : (5111 : ℕ) ^ 1378 % 10 ^ 345 = 255521492143192097894021506051242556178916149860416804011249309046659349511992014468080992042977506131557582895316830060812948575817865054412180626629305688768067972934334189014704344908666377749034350164083004853637331601008481455248535692486885316774279548936469142858531146037583042129995057896637569013814841466551886525970296841272145708881 := by
    have h1 : (5111 : ℕ) ^ 1 % 10 ^ 345 = 5111 := by decide
    have h2 : (5111 : ℕ) ^ 2 % 10 ^ 345 = 26122321 := by
      have step := pow_mod_double (k := 5111) (e := 1) (m := 10 ^ 345) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (5111 : ℕ) ^ 5 % 10 ^ 345 = 3487621969776606551 := by
      have step := pow_mod_double_add_one (k := 5111) (e := 2) (m := 10 ^ 345) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (5111 : ℕ) ^ 10 % 10 ^ 345 = 12163507004068457098676955573056115601 := by
      have step := pow_mod_double (k := 5111) (e := 5) (m := 10 ^ 345) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (5111 : ℕ) ^ 21 % 10 ^ 345 = 756177063382932551894735842872669975581441773784906241641863119218818946628311 := by
      have step := pow_mod_double_add_one (k := 5111) (e := 10) (m := 10 ^ 345) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h43 : (5111 : ℕ) ^ 43 % 10 ^ 345 = 2922488972313872320854013917939282948403505552159619536972728191135326180438263573722346635703605987986419617474113616643786907851172548363465209368959288717031 := by
      have step := pow_mod_double_add_one (k := 5111) (e := 21) (m := 10 ^ 345) h21
      have he : 2 * 21 + 1 = 43 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h86 : (5111 : ℕ) ^ 86 % 10 ^ 345 = 8540941793296193576722318428022419824794904452992219238372556198890661245365650356979053756501490247788696984195456333028711263447303449065252838285388425273718969381513688768836473880573704748212271254311262434197029090828416155515532452648768529255267060056078826148101840274829618941265638160985279535438981989454961 := by
      have step := pow_mod_double (k := 5111) (e := 43) (m := 10 ^ 345) h43
      have he : 2 * 43 = 86 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h172 : (5111 : ℕ) ^ 172 % 10 ^ 345 = 566937654569017366898197316523988100733116655650478110190968571794377534687014432106774566879501216192676897575168162427518646692314690840302187877075010012140501735174903853256911108915411440804782656824616495751521079085357707799490287582938431345181384288830082890619011457803209405544546134380948131522891368651903342942112105490601847511521 := by
      have step := pow_mod_double (k := 5111) (e := 86) (m := 10 ^ 345) h86
      have he : 2 * 86 = 172 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h344 : (5111 : ℕ) ^ 344 % 10 ^ 345 = 170879620959361508018601485143720054234960147938132022184280943346403235427869837794971936874472595735404469141028483959118755793988126465899077566239053648785823724167452136566574537616974223439617444961746774332281962832578431228276971011451275807283679248900973155148318027826474088041606733099315290230181660750598990294905127704020227733441 := by
      have step := pow_mod_double (k := 5111) (e := 172) (m := 10 ^ 345) h172
      have he : 2 * 172 = 344 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h689 : (5111 : ℕ) ^ 689 % 10 ^ 345 = 193506039718563997432919269831900338749876397285136581023434093983595928125139715349624750592032768680755627359112341038592186957420432573889040905960353537534641213395950874824800506161616289319566861634445830304103194389162814435064897901164337417113221914390150265625312553772481324068181943880667061933124128026997778742667115026525119158391 := by
      have step := pow_mod_double_add_one (k := 5111) (e := 344) (m := 10 ^ 345) h344
      have he : 2 * 344 + 1 = 689 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1378 : (5111 : ℕ) ^ 1378 % 10 ^ 345 = 255521492143192097894021506051242556178916149860416804011249309046659349511992014468080992042977506131557582895316830060812948575817865054412180626629305688768067972934334189014704344908666377749034350164083004853637331601008481455248535692486885316774279548936469142858531146037583042129995057896637569013814841466551886525970296841272145708881 := by
      have step := pow_mod_double (k := 5111) (e := 689) (m := 10 ^ 345) h689
      have he : 2 * 689 = 1378 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1378
  rw [hmod]
  decide
private theorem cert_5111 : ExponentCertificate 5111 1378 1378 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5111) (by decide) (by decide) (by decide) suffix_5111
private theorem cert_5112 : ExponentCertificate 5112 1379 1378 := by decide
private theorem cert_5113 : ExponentCertificate 5113 1379 1378 := by decide
private theorem cert_5114 : ExponentCertificate 5114 1379 1378 := by decide
private theorem cert_5115 : ExponentCertificate 5115 1379 1379 := by decide
private theorem cert_5116 : ExponentCertificate 5116 1380 1379 := by decide
private theorem cert_5117 : ExponentCertificate 5117 1380 1379 := by decide
private theorem cert_5118 : ExponentCertificate 5118 1380 1379 := by decide
private theorem cert_5119 : ExponentCertificate 5119 1380 1380 := by decide
private theorem cert_5120 : ExponentCertificate 5120 1381 1380 := by decide
private theorem cert_5121 : ExponentCertificate 5121 1381 1380 := by decide
private theorem cert_5122 : ExponentCertificate 5122 1381 1380 := by decide
private theorem cert_5123 : ExponentCertificate 5123 1381 1381 := by decide
private theorem cert_5124 : ExponentCertificate 5124 1382 1381 := by decide
private theorem cert_5125 : ExponentCertificate 5125 1382 1381 := by decide
private theorem cert_5126 : ExponentCertificate 5126 1382 1381 := by decide
private theorem cert_5127 : ExponentCertificate 5127 1382 1381 := by decide
private theorem cert_5128 : ExponentCertificate 5128 1382 1382 := by decide
private theorem cert_5129 : ExponentCertificate 5129 1383 1382 := by decide
private theorem cert_5130 : ExponentCertificate 5130 1383 1382 := by decide
private theorem cert_5131 : ExponentCertificate 5131 1383 1382 := by decide
private theorem cert_5132 : ExponentCertificate 5132 1383 1383 := by decide
private theorem cert_5133 : ExponentCertificate 5133 1384 1383 := by decide
private theorem cert_5134 : ExponentCertificate 5134 1384 1383 := by decide
private theorem cert_5135 : ExponentCertificate 5135 1384 1383 := by decide
private theorem cert_5136 : ExponentCertificate 5136 1384 1384 := by decide
private theorem cert_5137 : ExponentCertificate 5137 1385 1384 := by decide
private theorem cert_5138 : ExponentCertificate 5138 1385 1384 := by decide
private theorem cert_5139 : ExponentCertificate 5139 1385 1384 := by decide
private theorem cert_5140 : ExponentCertificate 5140 1385 1385 := by decide
private theorem cert_5141 : ExponentCertificate 5141 1386 1385 := by decide
private theorem cert_5142 : ExponentCertificate 5142 1386 1385 := by decide
private theorem cert_5143 : ExponentCertificate 5143 1386 1385 := by decide
private theorem cert_5144 : ExponentCertificate 5144 1386 1386 := by decide
private theorem cert_5145 : ExponentCertificate 5145 1387 1386 := by decide
private theorem cert_5146 : ExponentCertificate 5146 1387 1386 := by decide
private theorem cert_5147 : ExponentCertificate 5147 1387 1386 := by decide
private theorem cert_5148 : ExponentCertificate 5148 1387 1386 := by decide
private theorem suffix_5149 : 1387 < digitSum ((5149 : ℕ) ^ 1387 % 10 ^ 347) := by
  have hmod : (5149 : ℕ) ^ 1387 % 10 ^ 347 = 49190116343108942205174626024290981152679986032341704673728447990397822049895487197347892127671674968381854986012944342815903330845517828068358608808182407504336947672639447766358213530464560460517337196256317972117740735777024447976443113336296511068085794554802453047139748853469709712965420501542276623454819543673995904336060539668981045720549 := by
    have h1 : (5149 : ℕ) ^ 1 % 10 ^ 347 = 5149 := by decide
    have h2 : (5149 : ℕ) ^ 2 % 10 ^ 347 = 26512201 := by
      have step := pow_mod_double (k := 5149) (e := 1) (m := 10 ^ 347) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (5149 : ℕ) ^ 5 % 10 ^ 347 = 3619215632799800749 := by
      have step := pow_mod_double_add_one (k := 5149) (e := 2) (m := 10 ^ 347) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (5149 : ℕ) ^ 10 % 10 ^ 347 = 13098721796702462171171897974100961001 := by
      have step := pow_mod_double (k := 5149) (e := 5) (m := 10 ^ 347) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (5149 : ℕ) ^ 21 % 10 ^ 347 = 883447463930444712235886675793371162533624351604016247554458027902301325383149 := by
      have step := pow_mod_double_add_one (k := 5149) (e := 10) (m := 10 ^ 347) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h43 : (5149 : ℕ) ^ 43 % 10 ^ 347 = 4018688541432917081409216226609789916963925962814642380474874468071560490770325749033755987785394623395348370353652614474523439523996735846539395016122101278949 := by
      have step := pow_mod_double_add_one (k := 5149) (e := 21) (m := 10 ^ 347) h21
      have he : 2 * 21 + 1 = 43 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h86 : (5149 : ℕ) ^ 86 % 10 ^ 347 = 16149857593044226509712179962711917985251489028142456236415845437457169427286265533120593523141620269728392974099620265673441328900341162490347374591135838567862290943165515626476241636952127221239664094284736594590649198903219379368722218179422244918435620450590569093537722233809748501213188910347541358688981510544601 := by
      have step := pow_mod_double (k := 5149) (e := 43) (m := 10 ^ 347) h43
      have he : 2 * 43 = 86 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h173 : (5149 : ℕ) ^ 173 % 10 ^ 347 = 71556008128385722701055608881839366143401202635021627323558484306789048654798992164708034715051178017238470448017440284921834996555771909422841506162602639832576493682089794230601323989709562420129997474759217539226626686386022054319768257876707193601257811669488483294475987986061156113526764148717198031253009450634095394632387479461841173135949 := by
      have step := pow_mod_double_add_one (k := 5149) (e := 86) (m := 10 ^ 347) h86
      have he : 2 * 86 + 1 = 173 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h346 : (5149 : ℕ) ^ 346 % 10 ^ 347 = 41330904751531065550320956274845070790283991162991496716859710086435244908869517102220599753328941696372548856384299049546394801806151643827881474836673610208421144150289515393609366711898973389993081181358121917428352382434795840044461590545030173541778381086767996084760114505143656225770553626110937760560906324185006799893968731620274836130601 := by
      have step := pow_mod_double (k := 5149) (e := 173) (m := 10 ^ 347) h173
      have he : 2 * 173 = 346 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h693 : (5149 : ℕ) ^ 693 % 10 ^ 347 = 77591863976091227271202727107147422337254434208832103228159730566582917453211511515792282903460072905438540440218760957804185126865192344393462596042289765442640249615506442826967199157007640773658832695289058199691413712206862076464055372652680168286415826428119136119002450982212198459987329504366436723665416760435849401254444001285402470563949 := by
      have step := pow_mod_double_add_one (k := 5149) (e := 346) (m := 10 ^ 347) h346
      have he : 2 * 346 + 1 = 693 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1387 : (5149 : ℕ) ^ 1387 % 10 ^ 347 = 49190116343108942205174626024290981152679986032341704673728447990397822049895487197347892127671674968381854986012944342815903330845517828068358608808182407504336947672639447766358213530464560460517337196256317972117740735777024447976443113336296511068085794554802453047139748853469709712965420501542276623454819543673995904336060539668981045720549 := by
      have step := pow_mod_double_add_one (k := 5149) (e := 693) (m := 10 ^ 347) h693
      have he : 2 * 693 + 1 = 1387 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1387
  rw [hmod]
  decide
private theorem cert_5149 : ExponentCertificate 5149 1387 1387 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5149) (by decide) (by decide) (by decide) suffix_5149
private theorem cert_5150 : ExponentCertificate 5150 1388 1387 := by decide
private theorem cert_5151 : ExponentCertificate 5151 1388 1387 := by decide
private theorem cert_5152 : ExponentCertificate 5152 1388 1387 := by decide
private theorem cert_5153 : ExponentCertificate 5153 1388 1388 := by decide
private theorem cert_5154 : ExponentCertificate 5154 1389 1388 := by decide
private theorem cert_5155 : ExponentCertificate 5155 1389 1388 := by decide
private theorem cert_5156 : ExponentCertificate 5156 1389 1388 := by decide
private theorem cert_5157 : ExponentCertificate 5157 1389 1389 := by decide
private theorem cert_5158 : ExponentCertificate 5158 1390 1389 := by decide
private theorem cert_5159 : ExponentCertificate 5159 1390 1389 := by decide
private theorem cert_5160 : ExponentCertificate 5160 1390 1389 := by decide
private theorem suffix_5161 : 1390 < digitSum ((5161 : ℕ) ^ 1390 % 10 ^ 348) := by
  have hmod : (5161 : ℕ) ^ 1390 % 10 ^ 348 = 830625428073187968197223478158731953094999680490982709901278415381233576284265797859824840020906132774595616896577283715952550523015449048124964345727524195324312364805086786827204891449251281037157052718025713272442846895129879842913918066582293243505985446484405314030658438543824924556097327716782707968562615200406524542055534299459728790140401 := by
    have h1 : (5161 : ℕ) ^ 1 % 10 ^ 348 = 5161 := by decide
    have h2 : (5161 : ℕ) ^ 2 % 10 ^ 348 = 26635921 := by
      have step := pow_mod_double (k := 5161) (e := 1) (m := 10 ^ 348) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (5161 : ℕ) ^ 5 % 10 ^ 348 = 3661586475881641801 := by
      have step := pow_mod_double_add_one (k := 5161) (e := 2) (m := 10 ^ 348) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (5161 : ℕ) ^ 10 % 10 ^ 348 = 13407215520359341014449775215270523601 := by
      have step := pow_mod_double (k := 5161) (e := 5) (m := 10 ^ 348) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (5161 : ℕ) ^ 21 % 10 ^ 348 = 927707441956329643895243074080096200999026154982269033750012546156730415164361 := by
      have step := pow_mod_double_add_one (k := 5161) (e := 10) (m := 10 ^ 348) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h43 : (5161 : ℕ) ^ 43 % 10 ^ 348 = 4441768706061429910860389476910405962144897271485131161532653772478709365201046339409706604023856675636054969620907021604270253487704121495617401174792462274681 := by
      have step := pow_mod_double_add_one (k := 5161) (e := 21) (m := 10 ^ 348) h21
      have he : 2 * 21 + 1 = 43 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h86 : (5161 : ℕ) ^ 86 % 10 ^ 348 = 19729309238146629347347868660973016933825427360749094362158586409522662993268211143423915281918630477613494178994211309549082756365584534545055606296817339903594872588674827291419482934848457873475439625529787975363427830926223684966332727983930461333942285320602890232742903180545418039088085290295516207780584693651761 := by
      have step := pow_mod_double (k := 5161) (e := 43) (m := 10 ^ 348) h43
      have he : 2 * 43 = 86 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h173 : (5161 : ℕ) ^ 173 % 10 ^ 348 = 981086449174795943173898480186130968307993436941616456319259058220644122848763807643184940789721989122061613050987322538409772405732025894990752926799523056844998989711215742182635309743331445586911936993535280960738492824261592891293440223389351588274927800336811760909613782948470856631355285628092163692275218524275920277868597126775471688185481 := by
      have step := pow_mod_double_add_one (k := 5161) (e := 86) (m := 10 ^ 348) h86
      have he : 2 * 86 + 1 = 173 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h347 : (5161 : ℕ) ^ 347 % 10 ^ 348 = 611549650931074718936322428283335761413897233638691300548636703695128029654471543662249575495894634874513207923664929024791333959310871855601105763611305200035265075397366661754290801285297690251875009102394295468441274626388309327951896435555584245704172168097508588770963687078623589582353088110671254567830147340550005074161684113240975738224121 := by
      have step := pow_mod_double_add_one (k := 5161) (e := 173) (m := 10 ^ 348) h173
      have he : 2 * 173 + 1 = 347 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h695 : (5161 : ℕ) ^ 695 % 10 ^ 348 = 645822683373154366202615984079170020084553724575481318214631223822365351224260262486055590346357777951819124046400859733084464101013166564387508222051181073819558800368822444243249197087968128533632962658941646112596571059019621244886491443421936361238827991328054333372799434021481777149525762736292582837040605489653823347399343434633386135050201 := by
      have step := pow_mod_double_add_one (k := 5161) (e := 347) (m := 10 ^ 348) h347
      have he : 2 * 347 + 1 = 695 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1390 : (5161 : ℕ) ^ 1390 % 10 ^ 348 = 830625428073187968197223478158731953094999680490982709901278415381233576284265797859824840020906132774595616896577283715952550523015449048124964345727524195324312364805086786827204891449251281037157052718025713272442846895129879842913918066582293243505985446484405314030658438543824924556097327716782707968562615200406524542055534299459728790140401 := by
      have step := pow_mod_double (k := 5161) (e := 695) (m := 10 ^ 348) h695
      have he : 2 * 695 = 1390 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1390
  rw [hmod]
  decide
private theorem cert_5161 : ExponentCertificate 5161 1390 1390 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5161) (by decide) (by decide) (by decide) suffix_5161
private theorem cert_5162 : ExponentCertificate 5162 1391 1390 := by decide
private theorem cert_5163 : ExponentCertificate 5163 1391 1390 := by decide
private theorem cert_5164 : ExponentCertificate 5164 1391 1390 := by decide
private theorem cert_5165 : ExponentCertificate 5165 1391 1391 := by decide
private theorem cert_5166 : ExponentCertificate 5166 1392 1391 := by decide
private theorem cert_5167 : ExponentCertificate 5167 1392 1391 := by decide
private theorem cert_5168 : ExponentCertificate 5168 1392 1391 := by decide
private theorem cert_5169 : ExponentCertificate 5169 1392 1391 := by decide
private theorem cert_5170 : ExponentCertificate 5170 1392 1392 := by decide
private theorem cert_5171 : ExponentCertificate 5171 1393 1392 := by decide
private theorem cert_5172 : ExponentCertificate 5172 1393 1392 := by decide
private theorem cert_5173 : ExponentCertificate 5173 1393 1392 := by decide
private theorem cert_5174 : ExponentCertificate 5174 1393 1393 := by decide
private theorem cert_5175 : ExponentCertificate 5175 1394 1393 := by decide
private theorem cert_5176 : ExponentCertificate 5176 1394 1393 := by decide
private theorem cert_5177 : ExponentCertificate 5177 1394 1393 := by decide
private theorem cert_5178 : ExponentCertificate 5178 1394 1394 := by decide
private theorem cert_5179 : ExponentCertificate 5179 1395 1394 := by decide
private theorem cert_5180 : ExponentCertificate 5180 1395 1394 := by decide
private theorem cert_5181 : ExponentCertificate 5181 1395 1394 := by decide
private theorem cert_5182 : ExponentCertificate 5182 1395 1395 := by decide
private theorem cert_5183 : ExponentCertificate 5183 1396 1395 := by decide
private theorem cert_5184 : ExponentCertificate 5184 1396 1395 := by decide
private theorem cert_5185 : ExponentCertificate 5185 1396 1395 := by decide
private theorem cert_5186 : ExponentCertificate 5186 1396 1396 := by decide
private theorem cert_5187 : ExponentCertificate 5187 1396 1396 := by decide
private theorem cert_5188 : ExponentCertificate 5188 1397 1396 := by decide
private theorem cert_5189 : ExponentCertificate 5189 1397 1396 := by decide
private theorem cert_5190 : ExponentCertificate 5190 1397 1396 := by decide
private theorem cert_5191 : ExponentCertificate 5191 1397 1397 := by decide
private theorem cert_5192 : ExponentCertificate 5192 1398 1397 := by decide
private theorem cert_5193 : ExponentCertificate 5193 1398 1397 := by decide
private theorem cert_5194 : ExponentCertificate 5194 1398 1397 := by decide
private theorem cert_5195 : ExponentCertificate 5195 1398 1398 := by decide
private theorem cert_5196 : ExponentCertificate 5196 1399 1398 := by decide
private theorem cert_5197 : ExponentCertificate 5197 1399 1398 := by decide
private theorem cert_5198 : ExponentCertificate 5198 1399 1398 := by decide
private theorem cert_5199 : ExponentCertificate 5199 1399 1399 := by decide
private theorem cert_5200 : ExponentCertificate 5200 1400 1399 := by decide

private theorem certificates_5101_5200 {k : ℕ} (hlo : 5101 ≤ k) (hhi : k ≤ 5200) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1376, 1375, cert_5101⟩
  · exact ⟨1376, 1376, cert_5102⟩
  · exact ⟨1377, 1376, cert_5103⟩
  · exact ⟨1377, 1376, cert_5104⟩
  · exact ⟨1377, 1376, cert_5105⟩
  · exact ⟨1377, 1376, cert_5106⟩
  · exact ⟨1377, 1377, cert_5107⟩
  · exact ⟨1378, 1377, cert_5108⟩
  · exact ⟨1378, 1377, cert_5109⟩
  · exact ⟨1378, 1377, cert_5110⟩
  · exact ⟨1378, 1378, cert_5111⟩
  · exact ⟨1379, 1378, cert_5112⟩
  · exact ⟨1379, 1378, cert_5113⟩
  · exact ⟨1379, 1378, cert_5114⟩
  · exact ⟨1379, 1379, cert_5115⟩
  · exact ⟨1380, 1379, cert_5116⟩
  · exact ⟨1380, 1379, cert_5117⟩
  · exact ⟨1380, 1379, cert_5118⟩
  · exact ⟨1380, 1380, cert_5119⟩
  · exact ⟨1381, 1380, cert_5120⟩
  · exact ⟨1381, 1380, cert_5121⟩
  · exact ⟨1381, 1380, cert_5122⟩
  · exact ⟨1381, 1381, cert_5123⟩
  · exact ⟨1382, 1381, cert_5124⟩
  · exact ⟨1382, 1381, cert_5125⟩
  · exact ⟨1382, 1381, cert_5126⟩
  · exact ⟨1382, 1381, cert_5127⟩
  · exact ⟨1382, 1382, cert_5128⟩
  · exact ⟨1383, 1382, cert_5129⟩
  · exact ⟨1383, 1382, cert_5130⟩
  · exact ⟨1383, 1382, cert_5131⟩
  · exact ⟨1383, 1383, cert_5132⟩
  · exact ⟨1384, 1383, cert_5133⟩
  · exact ⟨1384, 1383, cert_5134⟩
  · exact ⟨1384, 1383, cert_5135⟩
  · exact ⟨1384, 1384, cert_5136⟩
  · exact ⟨1385, 1384, cert_5137⟩
  · exact ⟨1385, 1384, cert_5138⟩
  · exact ⟨1385, 1384, cert_5139⟩
  · exact ⟨1385, 1385, cert_5140⟩
  · exact ⟨1386, 1385, cert_5141⟩
  · exact ⟨1386, 1385, cert_5142⟩
  · exact ⟨1386, 1385, cert_5143⟩
  · exact ⟨1386, 1386, cert_5144⟩
  · exact ⟨1387, 1386, cert_5145⟩
  · exact ⟨1387, 1386, cert_5146⟩
  · exact ⟨1387, 1386, cert_5147⟩
  · exact ⟨1387, 1386, cert_5148⟩
  · exact ⟨1387, 1387, cert_5149⟩
  · exact ⟨1388, 1387, cert_5150⟩
  · exact ⟨1388, 1387, cert_5151⟩
  · exact ⟨1388, 1387, cert_5152⟩
  · exact ⟨1388, 1388, cert_5153⟩
  · exact ⟨1389, 1388, cert_5154⟩
  · exact ⟨1389, 1388, cert_5155⟩
  · exact ⟨1389, 1388, cert_5156⟩
  · exact ⟨1389, 1389, cert_5157⟩
  · exact ⟨1390, 1389, cert_5158⟩
  · exact ⟨1390, 1389, cert_5159⟩
  · exact ⟨1390, 1389, cert_5160⟩
  · exact ⟨1390, 1390, cert_5161⟩
  · exact ⟨1391, 1390, cert_5162⟩
  · exact ⟨1391, 1390, cert_5163⟩
  · exact ⟨1391, 1390, cert_5164⟩
  · exact ⟨1391, 1391, cert_5165⟩
  · exact ⟨1392, 1391, cert_5166⟩
  · exact ⟨1392, 1391, cert_5167⟩
  · exact ⟨1392, 1391, cert_5168⟩
  · exact ⟨1392, 1391, cert_5169⟩
  · exact ⟨1392, 1392, cert_5170⟩
  · exact ⟨1393, 1392, cert_5171⟩
  · exact ⟨1393, 1392, cert_5172⟩
  · exact ⟨1393, 1392, cert_5173⟩
  · exact ⟨1393, 1393, cert_5174⟩
  · exact ⟨1394, 1393, cert_5175⟩
  · exact ⟨1394, 1393, cert_5176⟩
  · exact ⟨1394, 1393, cert_5177⟩
  · exact ⟨1394, 1394, cert_5178⟩
  · exact ⟨1395, 1394, cert_5179⟩
  · exact ⟨1395, 1394, cert_5180⟩
  · exact ⟨1395, 1394, cert_5181⟩
  · exact ⟨1395, 1395, cert_5182⟩
  · exact ⟨1396, 1395, cert_5183⟩
  · exact ⟨1396, 1395, cert_5184⟩
  · exact ⟨1396, 1395, cert_5185⟩
  · exact ⟨1396, 1396, cert_5186⟩
  · exact ⟨1396, 1396, cert_5187⟩
  · exact ⟨1397, 1396, cert_5188⟩
  · exact ⟨1397, 1396, cert_5189⟩
  · exact ⟨1397, 1396, cert_5190⟩
  · exact ⟨1397, 1397, cert_5191⟩
  · exact ⟨1398, 1397, cert_5192⟩
  · exact ⟨1398, 1397, cert_5193⟩
  · exact ⟨1398, 1397, cert_5194⟩
  · exact ⟨1398, 1398, cert_5195⟩
  · exact ⟨1399, 1398, cert_5196⟩
  · exact ⟨1399, 1398, cert_5197⟩
  · exact ⟨1399, 1398, cert_5198⟩
  · exact ⟨1399, 1399, cert_5199⟩
  · exact ⟨1400, 1399, cert_5200⟩

theorem no_fixed_digitCount_5101_5200 {n : ℕ} (hn : a n = n)
    (hlo : 5101 ≤ digitCount n) (hhi : digitCount n ≤ 5200) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_5101_5200 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_5101_5200
end OeisA113010
