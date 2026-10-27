import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 5101
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_5001 : ExponentCertificate 5001 1352 1351 := by decide
private theorem cert_5002 : ExponentCertificate 5002 1352 1352 := by decide
private theorem cert_5003 : ExponentCertificate 5003 1353 1352 := by decide
private theorem cert_5004 : ExponentCertificate 5004 1353 1352 := by decide
private theorem cert_5005 : ExponentCertificate 5005 1353 1352 := by decide
private theorem cert_5006 : ExponentCertificate 5006 1353 1353 := by decide
private theorem cert_5007 : ExponentCertificate 5007 1354 1353 := by decide
private theorem cert_5008 : ExponentCertificate 5008 1354 1353 := by decide
private theorem cert_5009 : ExponentCertificate 5009 1354 1353 := by decide
private theorem cert_5010 : ExponentCertificate 5010 1354 1354 := by decide
private theorem cert_5011 : ExponentCertificate 5011 1355 1354 := by decide
private theorem cert_5012 : ExponentCertificate 5012 1355 1354 := by decide
private theorem cert_5013 : ExponentCertificate 5013 1355 1354 := by decide
private theorem cert_5014 : ExponentCertificate 5014 1355 1355 := by decide
private theorem cert_5015 : ExponentCertificate 5015 1356 1355 := by decide
private theorem cert_5016 : ExponentCertificate 5016 1356 1355 := by decide
private theorem cert_5017 : ExponentCertificate 5017 1356 1355 := by decide
private theorem cert_5018 : ExponentCertificate 5018 1356 1356 := by decide
private theorem cert_5019 : ExponentCertificate 5019 1356 1356 := by decide
private theorem cert_5020 : ExponentCertificate 5020 1357 1356 := by decide
private theorem cert_5021 : ExponentCertificate 5021 1357 1356 := by decide
private theorem cert_5022 : ExponentCertificate 5022 1357 1356 := by decide
private theorem cert_5023 : ExponentCertificate 5023 1357 1357 := by decide
private theorem cert_5024 : ExponentCertificate 5024 1358 1357 := by decide
private theorem cert_5025 : ExponentCertificate 5025 1358 1357 := by decide
private theorem cert_5026 : ExponentCertificate 5026 1358 1357 := by decide
private theorem cert_5027 : ExponentCertificate 5027 1358 1358 := by decide
private theorem cert_5028 : ExponentCertificate 5028 1359 1358 := by decide
private theorem cert_5029 : ExponentCertificate 5029 1359 1358 := by decide
private theorem cert_5030 : ExponentCertificate 5030 1359 1358 := by decide
private theorem suffix_5031 : 1359 < digitSum ((5031 : ℕ) ^ 1359 % 10 ^ 340) := by
  have hmod : (5031 : ℕ) ^ 1359 % 10 ^ 340 = 9762981085040986373279379351259550995372331470581422352633298309486412487867824458060688539573032359356997870342682679879463868996737295761411741391777174156576175819700673125892458285287732797684040535966391695710603104754196253494496043701428198157307222112213917832567335959872761207410833889955530952897846035221051594338976482289323671 := by
    have h1 : (5031 : ℕ) ^ 1 % 10 ^ 340 = 5031 := by decide
    have h2 : (5031 : ℕ) ^ 2 % 10 ^ 340 = 25310961 := by
      have step := pow_mod_double (k := 5031) (e := 1) (m := 10 ^ 340) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (5031 : ℕ) ^ 5 % 10 ^ 340 = 3223083720866654151 := by
      have step := pow_mod_double_add_one (k := 5031) (e := 2) (m := 10 ^ 340) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (5031 : ℕ) ^ 10 % 10 ^ 340 = 10388268671715636170668132857445530801 := by
      have step := pow_mod_double (k := 5031) (e := 5) (m := 10 ^ 340) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (5031 : ℕ) ^ 21 % 10 ^ 340 = 542926029884610944307227631612971898238004090482666289519545051436066338754631 := by
      have step := pow_mod_double_add_one (k := 5031) (e := 10) (m := 10 ^ 340) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h42 : (5031 : ℕ) ^ 42 % 10 ^ 340 = 294768673926265456187863030849536381740362760181122843823692199147393061755808866487572723797250424859649850148978950322314070274187930557230597992023946161 := by
      have step := pow_mod_double (k := 5031) (e := 21) (m := 10 ^ 340) h21
      have he : 2 * 21 = 42 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h84 : (5031 : ℕ) ^ 84 % 10 ^ 340 = 86888571128249008590439743945461811727724609117041870236639284813081179197031582167524403646914218764344050030926981897997564465194359617259566032600782427854112411415084344095091009303337673770636234799298860367489658881088983557873677580832045420632109606868645787461851921914495180674959291285990842626637921 := by
      have step := pow_mod_double (k := 5031) (e := 42) (m := 10 ^ 340) h42
      have he : 2 * 42 = 84 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h169 : (5031 : ℕ) ^ 169 % 10 ^ 340 = 7312320091578964957462563032791426581436726237734217016717636454253318271552556827856705620106354817629012916198365803722344672007928895918583714472287860551972892475967668263977082484735927567673287759837317100444212229114700006060360834122216425743701434993740256845316541482549237951021154321951360652730523784323312913410175665102474471 := by
      have step := pow_mod_double_add_one (k := 5031) (e := 84) (m := 10 ^ 340) h84
      have he : 2 * 84 + 1 = 169 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h339 : (5031 : ℕ) ^ 339 % 10 ^ 340 = 5989540920874067107903411128965469040538908290385744036939168228379164468134024842627795921630386867072117400717761231386643118454214509872067270326069757254827321078239091320947395316964207038625589292913634985911477004170126121122273590254958468460457056211449063431971397523712814928750070455300760854100562027319603459165556897057830071 := by
      have step := pow_mod_double_add_one (k := 5031) (e := 169) (m := 10 ^ 340) h169
      have he : 2 * 169 + 1 = 339 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h679 : (5031 : ℕ) ^ 679 % 10 ^ 340 = 8807805189878782178809748035672654141441697871799228563837307391713044747671063575064486910574452560715869963729045736134498953237006870765417264183022049133346657003865597547880862163827872550334997411126396105011977953945765733336478655893177883950474837230720193470054038712937338945793180656394874457511226251307097855021209983793021271 := by
      have step := pow_mod_double_add_one (k := 5031) (e := 339) (m := 10 ^ 340) h339
      have he : 2 * 339 + 1 = 679 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1359 : (5031 : ℕ) ^ 1359 % 10 ^ 340 = 9762981085040986373279379351259550995372331470581422352633298309486412487867824458060688539573032359356997870342682679879463868996737295761411741391777174156576175819700673125892458285287732797684040535966391695710603104754196253494496043701428198157307222112213917832567335959872761207410833889955530952897846035221051594338976482289323671 := by
      have step := pow_mod_double_add_one (k := 5031) (e := 679) (m := 10 ^ 340) h679
      have he : 2 * 679 + 1 = 1359 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1359
  rw [hmod]
  decide
private theorem cert_5031 : ExponentCertificate 5031 1359 1359 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5031) (by decide) (by decide) (by decide) suffix_5031
private theorem cert_5032 : ExponentCertificate 5032 1360 1359 := by decide
private theorem cert_5033 : ExponentCertificate 5033 1360 1359 := by decide
private theorem cert_5034 : ExponentCertificate 5034 1360 1359 := by decide
private theorem cert_5035 : ExponentCertificate 5035 1360 1360 := by decide
private theorem cert_5036 : ExponentCertificate 5036 1361 1360 := by decide
private theorem cert_5037 : ExponentCertificate 5037 1361 1360 := by decide
private theorem cert_5038 : ExponentCertificate 5038 1361 1360 := by decide
private theorem cert_5039 : ExponentCertificate 5039 1361 1361 := by decide
private theorem cert_5040 : ExponentCertificate 5040 1361 1361 := by decide
private theorem cert_5041 : ExponentCertificate 5041 1362 1361 := by decide
private theorem cert_5042 : ExponentCertificate 5042 1362 1361 := by decide
private theorem cert_5043 : ExponentCertificate 5043 1362 1361 := by decide
private theorem cert_5044 : ExponentCertificate 5044 1362 1362 := by decide
private theorem cert_5045 : ExponentCertificate 5045 1363 1362 := by decide
private theorem cert_5046 : ExponentCertificate 5046 1363 1362 := by decide
private theorem cert_5047 : ExponentCertificate 5047 1363 1362 := by decide
private theorem cert_5048 : ExponentCertificate 5048 1363 1363 := by decide
private theorem cert_5049 : ExponentCertificate 5049 1364 1363 := by decide
private theorem cert_5050 : ExponentCertificate 5050 1364 1363 := by decide
private theorem cert_5051 : ExponentCertificate 5051 1364 1363 := by decide
private theorem cert_5052 : ExponentCertificate 5052 1364 1364 := by decide
private theorem cert_5053 : ExponentCertificate 5053 1365 1364 := by decide
private theorem cert_5054 : ExponentCertificate 5054 1365 1364 := by decide
private theorem cert_5055 : ExponentCertificate 5055 1365 1364 := by decide
private theorem cert_5056 : ExponentCertificate 5056 1365 1365 := by decide
private theorem cert_5057 : ExponentCertificate 5057 1366 1365 := by decide
private theorem cert_5058 : ExponentCertificate 5058 1366 1365 := by decide
private theorem cert_5059 : ExponentCertificate 5059 1366 1365 := by decide
private theorem suffix_5060 : 1366 < digitSum ((506 : ℕ) ^ 1366 % 10 ^ 342) := by
  have hmod : (506 : ℕ) ^ 1366 % 10 ^ 342 = 10309133297415261647665235354773551437322128761559841866040686411142804658008470501326974039318540025485736676270128207642313829020237858821804667848861914047714390560168839546825551353128249656356291594203910359599987593952588755622408671343401302897380510845220823773959552960540052295065593563573530868471381460836587905874213405464723456 := by
    have h1 : (506 : ℕ) ^ 1 % 10 ^ 342 = 506 := by decide
    have h2 : (506 : ℕ) ^ 2 % 10 ^ 342 = 256036 := by
      have step := pow_mod_double (k := 506) (e := 1) (m := 10 ^ 342) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (506 : ℕ) ^ 5 % 10 ^ 342 = 33170543247776 := by
      have step := pow_mod_double_add_one (k := 506) (e := 2) (m := 10 ^ 342) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (506 : ℕ) ^ 10 % 10 ^ 342 = 1100284939352577986128946176 := by
      have step := pow_mod_double (k := 506) (e := 5) (m := 10 ^ 342) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (506 : ℕ) ^ 21 % 10 ^ 342 = 612577235569649745825059439636364724385332635282341625856 := by
      have step := pow_mod_double_add_one (k := 506) (e := 10) (m := 10 ^ 342) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h42 : (506 : ℕ) ^ 42 % 10 ^ 342 = 375250869538154157756436243404742241109127475432312756248538186894412758657959731004763517890270014811009487732736 := by
      have step := pow_mod_double (k := 506) (e := 21) (m := 10 ^ 342) h21
      have he : 2 * 21 = 42 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h85 : (506 : ℕ) ^ 85 % 10 ^ 342 = 71251486835105240750857188309226614517555751218931146584825421479054803198113256085030727999446871078200335489432876624955397444556411085036758834094795160630945466844263697357206506752419054651182187967932393456169421701619122176 := by
      have step := pow_mod_double_add_one (k := 506) (e := 42) (m := 10 ^ 342) h42
      have he : 2 * 42 + 1 = 85 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h170 : (506 : ℕ) ^ 170 % 10 ^ 342 = 707849059101587576210950546416609417982096171010146765415782712586422222295057613227770766774298385416620254312563554844745370702688363644750047606828555266461308030563957345087558464006473645549059751518963811426318653204829486336726872740547770886997002120251951910409566087757980790229718098112654977414956924339713279377752795020814974976 := by
      have step := pow_mod_double (k := 506) (e := 85) (m := 10 ^ 342) h85
      have he : 2 * 85 = 170 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h341 : (506 : ℕ) ^ 341 % 10 ^ 342 = 918030931185550879129039932455920459358089224653316017655494830900530348061024641452075292237349365749460760968098138634437572138480267159952042775273443676239568010975349536136160012101056750645382722898592775250383675077074812998438951281811029846283933714090965253412676674419787764320295676838537587998689999859784606757785765262137491456 := by
      have step := pow_mod_double_add_one (k := 506) (e := 170) (m := 10 ^ 342) h170
      have he : 2 * 170 + 1 = 341 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h683 : (506 : ℕ) ^ 683 % 10 ^ 342 = 158387612434044388037338532197213208654109403612833246018229769526077279738893506434033665879340678264918125599697669667110790158671948812192522802959614309398427953644058538668261314713076385756024975947109784259937138778015085889087049288579062598731521134206292505743600175841582429801159998946697380033186730442348946243526063303337967616 := by
      have step := pow_mod_double_add_one (k := 506) (e := 341) (m := 10 ^ 342) h341
      have he : 2 * 341 + 1 = 683 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1366 : (506 : ℕ) ^ 1366 % 10 ^ 342 = 10309133297415261647665235354773551437322128761559841866040686411142804658008470501326974039318540025485736676270128207642313829020237858821804667848861914047714390560168839546825551353128249656356291594203910359599987593952588755622408671343401302897380510845220823773959552960540052295065593563573530868471381460836587905874213405464723456 := by
      have step := pow_mod_double (k := 506) (e := 683) (m := 10 ^ 342) h683
      have he : 2 * 683 = 1366 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1366
  rw [hmod]
  decide
private theorem cert_5060 : ExponentCertificate 5060 1366 1366 :=
  exponentCertificate_of_normalized_suffix (t := 1) (u := 506) (by decide) (by decide) (by decide) suffix_5060
private theorem cert_5061 : ExponentCertificate 5061 1367 1366 := by decide
private theorem cert_5062 : ExponentCertificate 5062 1367 1366 := by decide
private theorem cert_5063 : ExponentCertificate 5063 1367 1366 := by decide
private theorem cert_5064 : ExponentCertificate 5064 1367 1366 := by decide
private theorem cert_5065 : ExponentCertificate 5065 1367 1367 := by decide
private theorem cert_5066 : ExponentCertificate 5066 1368 1367 := by decide
private theorem cert_5067 : ExponentCertificate 5067 1368 1367 := by decide
private theorem cert_5068 : ExponentCertificate 5068 1368 1367 := by decide
private theorem cert_5069 : ExponentCertificate 5069 1368 1368 := by decide
private theorem cert_5070 : ExponentCertificate 5070 1369 1368 := by decide
private theorem cert_5071 : ExponentCertificate 5071 1369 1368 := by decide
private theorem cert_5072 : ExponentCertificate 5072 1369 1368 := by decide
private theorem cert_5073 : ExponentCertificate 5073 1369 1369 := by decide
private theorem cert_5074 : ExponentCertificate 5074 1370 1369 := by decide
private theorem cert_5075 : ExponentCertificate 5075 1370 1369 := by decide
private theorem cert_5076 : ExponentCertificate 5076 1370 1369 := by decide
private theorem cert_5077 : ExponentCertificate 5077 1370 1370 := by decide
private theorem cert_5078 : ExponentCertificate 5078 1371 1370 := by decide
private theorem cert_5079 : ExponentCertificate 5079 1371 1370 := by decide
private theorem cert_5080 : ExponentCertificate 5080 1371 1370 := by decide
private theorem cert_5081 : ExponentCertificate 5081 1371 1371 := by decide
private theorem cert_5082 : ExponentCertificate 5082 1372 1371 := by decide
private theorem cert_5083 : ExponentCertificate 5083 1372 1371 := by decide
private theorem cert_5084 : ExponentCertificate 5084 1372 1371 := by decide
private theorem cert_5085 : ExponentCertificate 5085 1372 1371 := by decide
private theorem cert_5086 : ExponentCertificate 5086 1372 1372 := by decide
private theorem cert_5087 : ExponentCertificate 5087 1373 1372 := by decide
private theorem cert_5088 : ExponentCertificate 5088 1373 1372 := by decide
private theorem cert_5089 : ExponentCertificate 5089 1373 1372 := by decide
private theorem cert_5090 : ExponentCertificate 5090 1373 1373 := by decide
private theorem cert_5091 : ExponentCertificate 5091 1374 1373 := by decide
private theorem cert_5092 : ExponentCertificate 5092 1374 1373 := by decide
private theorem cert_5093 : ExponentCertificate 5093 1374 1373 := by decide
private theorem cert_5094 : ExponentCertificate 5094 1374 1374 := by decide
private theorem cert_5095 : ExponentCertificate 5095 1375 1374 := by decide
private theorem cert_5096 : ExponentCertificate 5096 1375 1374 := by decide
private theorem cert_5097 : ExponentCertificate 5097 1375 1374 := by decide
private theorem cert_5098 : ExponentCertificate 5098 1375 1375 := by decide
private theorem cert_5099 : ExponentCertificate 5099 1376 1375 := by decide
private theorem cert_5100 : ExponentCertificate 5100 1376 1375 := by decide

private theorem certificates_5001_5100 {k : ℕ} (hlo : 5001 ≤ k) (hhi : k ≤ 5100) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1352, 1351, cert_5001⟩
  · exact ⟨1352, 1352, cert_5002⟩
  · exact ⟨1353, 1352, cert_5003⟩
  · exact ⟨1353, 1352, cert_5004⟩
  · exact ⟨1353, 1352, cert_5005⟩
  · exact ⟨1353, 1353, cert_5006⟩
  · exact ⟨1354, 1353, cert_5007⟩
  · exact ⟨1354, 1353, cert_5008⟩
  · exact ⟨1354, 1353, cert_5009⟩
  · exact ⟨1354, 1354, cert_5010⟩
  · exact ⟨1355, 1354, cert_5011⟩
  · exact ⟨1355, 1354, cert_5012⟩
  · exact ⟨1355, 1354, cert_5013⟩
  · exact ⟨1355, 1355, cert_5014⟩
  · exact ⟨1356, 1355, cert_5015⟩
  · exact ⟨1356, 1355, cert_5016⟩
  · exact ⟨1356, 1355, cert_5017⟩
  · exact ⟨1356, 1356, cert_5018⟩
  · exact ⟨1356, 1356, cert_5019⟩
  · exact ⟨1357, 1356, cert_5020⟩
  · exact ⟨1357, 1356, cert_5021⟩
  · exact ⟨1357, 1356, cert_5022⟩
  · exact ⟨1357, 1357, cert_5023⟩
  · exact ⟨1358, 1357, cert_5024⟩
  · exact ⟨1358, 1357, cert_5025⟩
  · exact ⟨1358, 1357, cert_5026⟩
  · exact ⟨1358, 1358, cert_5027⟩
  · exact ⟨1359, 1358, cert_5028⟩
  · exact ⟨1359, 1358, cert_5029⟩
  · exact ⟨1359, 1358, cert_5030⟩
  · exact ⟨1359, 1359, cert_5031⟩
  · exact ⟨1360, 1359, cert_5032⟩
  · exact ⟨1360, 1359, cert_5033⟩
  · exact ⟨1360, 1359, cert_5034⟩
  · exact ⟨1360, 1360, cert_5035⟩
  · exact ⟨1361, 1360, cert_5036⟩
  · exact ⟨1361, 1360, cert_5037⟩
  · exact ⟨1361, 1360, cert_5038⟩
  · exact ⟨1361, 1361, cert_5039⟩
  · exact ⟨1361, 1361, cert_5040⟩
  · exact ⟨1362, 1361, cert_5041⟩
  · exact ⟨1362, 1361, cert_5042⟩
  · exact ⟨1362, 1361, cert_5043⟩
  · exact ⟨1362, 1362, cert_5044⟩
  · exact ⟨1363, 1362, cert_5045⟩
  · exact ⟨1363, 1362, cert_5046⟩
  · exact ⟨1363, 1362, cert_5047⟩
  · exact ⟨1363, 1363, cert_5048⟩
  · exact ⟨1364, 1363, cert_5049⟩
  · exact ⟨1364, 1363, cert_5050⟩
  · exact ⟨1364, 1363, cert_5051⟩
  · exact ⟨1364, 1364, cert_5052⟩
  · exact ⟨1365, 1364, cert_5053⟩
  · exact ⟨1365, 1364, cert_5054⟩
  · exact ⟨1365, 1364, cert_5055⟩
  · exact ⟨1365, 1365, cert_5056⟩
  · exact ⟨1366, 1365, cert_5057⟩
  · exact ⟨1366, 1365, cert_5058⟩
  · exact ⟨1366, 1365, cert_5059⟩
  · exact ⟨1366, 1366, cert_5060⟩
  · exact ⟨1367, 1366, cert_5061⟩
  · exact ⟨1367, 1366, cert_5062⟩
  · exact ⟨1367, 1366, cert_5063⟩
  · exact ⟨1367, 1366, cert_5064⟩
  · exact ⟨1367, 1367, cert_5065⟩
  · exact ⟨1368, 1367, cert_5066⟩
  · exact ⟨1368, 1367, cert_5067⟩
  · exact ⟨1368, 1367, cert_5068⟩
  · exact ⟨1368, 1368, cert_5069⟩
  · exact ⟨1369, 1368, cert_5070⟩
  · exact ⟨1369, 1368, cert_5071⟩
  · exact ⟨1369, 1368, cert_5072⟩
  · exact ⟨1369, 1369, cert_5073⟩
  · exact ⟨1370, 1369, cert_5074⟩
  · exact ⟨1370, 1369, cert_5075⟩
  · exact ⟨1370, 1369, cert_5076⟩
  · exact ⟨1370, 1370, cert_5077⟩
  · exact ⟨1371, 1370, cert_5078⟩
  · exact ⟨1371, 1370, cert_5079⟩
  · exact ⟨1371, 1370, cert_5080⟩
  · exact ⟨1371, 1371, cert_5081⟩
  · exact ⟨1372, 1371, cert_5082⟩
  · exact ⟨1372, 1371, cert_5083⟩
  · exact ⟨1372, 1371, cert_5084⟩
  · exact ⟨1372, 1371, cert_5085⟩
  · exact ⟨1372, 1372, cert_5086⟩
  · exact ⟨1373, 1372, cert_5087⟩
  · exact ⟨1373, 1372, cert_5088⟩
  · exact ⟨1373, 1372, cert_5089⟩
  · exact ⟨1373, 1373, cert_5090⟩
  · exact ⟨1374, 1373, cert_5091⟩
  · exact ⟨1374, 1373, cert_5092⟩
  · exact ⟨1374, 1373, cert_5093⟩
  · exact ⟨1374, 1374, cert_5094⟩
  · exact ⟨1375, 1374, cert_5095⟩
  · exact ⟨1375, 1374, cert_5096⟩
  · exact ⟨1375, 1374, cert_5097⟩
  · exact ⟨1375, 1375, cert_5098⟩
  · exact ⟨1376, 1375, cert_5099⟩
  · exact ⟨1376, 1375, cert_5100⟩

theorem no_fixed_digitCount_5001_5100 {n : ℕ} (hn : a n = n)
    (hlo : 5001 ≤ digitCount n) (hhi : digitCount n ≤ 5100) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_5001_5100 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_5001_5100
end OeisA113010
