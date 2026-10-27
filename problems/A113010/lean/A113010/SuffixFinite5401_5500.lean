import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 5501
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_5401 : ExponentCertificate 5401 1447 1447 := by decide
private theorem cert_5402 : ExponentCertificate 5402 1447 1447 := by decide
private theorem cert_5403 : ExponentCertificate 5403 1448 1447 := by decide
private theorem cert_5404 : ExponentCertificate 5404 1448 1447 := by decide
private theorem cert_5405 : ExponentCertificate 5405 1448 1447 := by decide
private theorem cert_5406 : ExponentCertificate 5406 1448 1448 := by decide
private theorem cert_5407 : ExponentCertificate 5407 1449 1448 := by decide
private theorem cert_5408 : ExponentCertificate 5408 1449 1448 := by decide
private theorem cert_5409 : ExponentCertificate 5409 1449 1448 := by decide
private theorem cert_5410 : ExponentCertificate 5410 1449 1449 := by decide
private theorem cert_5411 : ExponentCertificate 5411 1450 1449 := by decide
private theorem cert_5412 : ExponentCertificate 5412 1450 1449 := by decide
private theorem cert_5413 : ExponentCertificate 5413 1450 1449 := by decide
private theorem cert_5414 : ExponentCertificate 5414 1450 1450 := by decide
private theorem cert_5415 : ExponentCertificate 5415 1451 1450 := by decide
private theorem cert_5416 : ExponentCertificate 5416 1451 1450 := by decide
private theorem cert_5417 : ExponentCertificate 5417 1451 1450 := by decide
private theorem cert_5418 : ExponentCertificate 5418 1451 1451 := by decide
private theorem cert_5419 : ExponentCertificate 5419 1452 1451 := by decide
private theorem cert_5420 : ExponentCertificate 5420 1452 1451 := by decide
private theorem cert_5421 : ExponentCertificate 5421 1452 1451 := by decide
private theorem cert_5422 : ExponentCertificate 5422 1452 1452 := by decide
private theorem cert_5423 : ExponentCertificate 5423 1452 1452 := by decide
private theorem cert_5424 : ExponentCertificate 5424 1453 1452 := by decide
private theorem cert_5425 : ExponentCertificate 5425 1453 1452 := by decide
private theorem cert_5426 : ExponentCertificate 5426 1453 1452 := by decide
private theorem cert_5427 : ExponentCertificate 5427 1453 1453 := by decide
private theorem cert_5428 : ExponentCertificate 5428 1454 1453 := by decide
private theorem cert_5429 : ExponentCertificate 5429 1454 1453 := by decide
private theorem cert_5430 : ExponentCertificate 5430 1454 1453 := by decide
private theorem cert_5431 : ExponentCertificate 5431 1454 1454 := by decide
private theorem cert_5432 : ExponentCertificate 5432 1455 1454 := by decide
private theorem cert_5433 : ExponentCertificate 5433 1455 1454 := by decide
private theorem cert_5434 : ExponentCertificate 5434 1455 1454 := by decide
private theorem cert_5435 : ExponentCertificate 5435 1455 1455 := by decide
private theorem cert_5436 : ExponentCertificate 5436 1456 1455 := by decide
private theorem cert_5437 : ExponentCertificate 5437 1456 1455 := by decide
private theorem cert_5438 : ExponentCertificate 5438 1456 1455 := by decide
private theorem cert_5439 : ExponentCertificate 5439 1456 1456 := by decide
private theorem cert_5440 : ExponentCertificate 5440 1456 1456 := by decide
private theorem cert_5441 : ExponentCertificate 5441 1457 1456 := by decide
private theorem cert_5442 : ExponentCertificate 5442 1457 1456 := by decide
private theorem cert_5443 : ExponentCertificate 5443 1457 1456 := by decide
private theorem suffix_5444 : 1457 < digitSum ((5444 : ℕ) ^ 1457 % 10 ^ 365) := by
  have hmod : (5444 : ℕ) ^ 1457 % 10 ^ 365 = 19127710590646504799792880609925148034546696984703662051744491593533414874349202850017288641114058482422663506499048286112887021325217774240249958170309951767834411060452059243201677555698034110976412386285571915449778636286197823276480216644483133816952793411342678534530870911772593798615121953439772645880810296823550914615969835941496982215734062920050057150464 := by
    have h1 : (5444 : ℕ) ^ 1 % 10 ^ 365 = 5444 := by decide
    have h2 : (5444 : ℕ) ^ 2 % 10 ^ 365 = 29637136 := by
      have step := pow_mod_double (k := 5444) (e := 1) (m := 10 ^ 365) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (5444 : ℕ) ^ 5 % 10 ^ 365 = 4781790916057908224 := by
      have step := pow_mod_double_add_one (k := 5444) (e := 2) (m := 10 ^ 365) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (5444 : ℕ) ^ 11 % 10 ^ 365 = 124479914642482549993033772692334805254144 := by
      have step := pow_mod_double_add_one (k := 5444) (e := 5) (m := 10 ^ 365) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h22 : (5444 : ℕ) ^ 22 % 10 ^ 365 = 15495249149399741552050916293225911065516977117005730642255552468629498428429172736 := by
      have step := pow_mod_double (k := 5444) (e := 11) (m := 10 ^ 365) h11
      have he : 2 * 11 = 22 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h45 : (5444 : ℕ) ^ 45 % 10 ^ 365 = 1307119350323543266303965280852700104831939188429202467625105484487938792963782794607799758345966500176546392048065086770345758213607529343784610330682699887105250689024 := by
      have step := pow_mod_double_add_one (k := 5444) (e := 22) (m := 10 ^ 365) h22
      have he : 2 * 22 + 1 = 45 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h91 : (5444 : ℕ) ^ 91 % 10 ^ 365 = 9301406062170876511636966266310149522196063380833822327284486827913033753162393054950410713584348496052500071134677243726435710236085844401577840041279095797174962173230975464498239537199288045354153863280865234544480196520959829173733430217976452442649637114810054751342597278077043481843849527084513435327959183193817405703649649171103744 := by
      have step := pow_mod_double_add_one (k := 5444) (e := 45) (m := 10 ^ 365) h45
      have he : 2 * 45 + 1 = 91 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h182 : (5444 : ℕ) ^ 182 % 10 ^ 365 = 17947930844708709434146119322712964683778172795219703826604060296578963621473867844261644834017296387292945307555210600000451591564097749953956365075051752533318257500129199459841337539721426373364331401567297204377709566163741083163152906875704278488640831324281554444250202899531515630874006238507360632053333749710081168078025739092590074346019845648203210817536 := by
      have step := pow_mod_double (k := 5444) (e := 91) (m := 10 ^ 365) h91
      have he : 2 * 91 = 182 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h364 : (5444 : ℕ) ^ 364 % 10 ^ 365 = 74053756307398483840516733265430832644450885642945550587963972413925916173533586243426807192479942718243916802950332918095745652279957770005502776954183569452184170797048158894384799734417785510988814556404584055334971271676726247326831703555352534119074873626056126887494443700488286971928417006783235488007920395856964319241213880891966667662518003019649485111296 := by
      have step := pow_mod_double (k := 5444) (e := 182) (m := 10 ^ 365) h182
      have he : 2 * 182 = 364 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h728 : (5444 : ℕ) ^ 728 % 10 ^ 365 = 53967001446390354193471379395716370358938989502432808305209275747955870408718612901357578842941187139830088592525962713515384130255836658836801833300929731809636586840421079554437565985886047643920268131879664188067537406822122796105555644256057862156363686785757193650828110636522601023825059976953948797428195464408183039357788081918613078219588915043177506799616 := by
      have step := pow_mod_double (k := 5444) (e := 364) (m := 10 ^ 365) h364
      have he : 2 * 364 = 728 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1457 : (5444 : ℕ) ^ 1457 % 10 ^ 365 = 19127710590646504799792880609925148034546696984703662051744491593533414874349202850017288641114058482422663506499048286112887021325217774240249958170309951767834411060452059243201677555698034110976412386285571915449778636286197823276480216644483133816952793411342678534530870911772593798615121953439772645880810296823550914615969835941496982215734062920050057150464 := by
      have step := pow_mod_double_add_one (k := 5444) (e := 728) (m := 10 ^ 365) h728
      have he : 2 * 728 + 1 = 1457 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1457
  rw [hmod]
  decide
private theorem cert_5444 : ExponentCertificate 5444 1457 1457 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5444) (by decide) (by decide) (by decide) suffix_5444
private theorem cert_5445 : ExponentCertificate 5445 1458 1457 := by decide
private theorem cert_5446 : ExponentCertificate 5446 1458 1457 := by decide
private theorem cert_5447 : ExponentCertificate 5447 1458 1457 := by decide
private theorem suffix_5448 : 1458 < digitSum ((5448 : ℕ) ^ 1458 % 10 ^ 365) := by
  have hmod : (5448 : ℕ) ^ 1458 % 10 ^ 365 = 37878173935224140390126740935965615007654067665954967381756874961955117531558973917923684006863452681199439388570454889554975540184243915434255729310724092439518608993496886968098821307075306316595544528094984045680182257103038335816390928714626741425243133238921455789456575076181492389668713175069702533407424926344732896458364373537939076519289021422217455468544 := by
    have h1 : (5448 : ℕ) ^ 1 % 10 ^ 365 = 5448 := by decide
    have h2 : (5448 : ℕ) ^ 2 % 10 ^ 365 = 29680704 := by
      have step := pow_mod_double (k := 5448) (e := 1) (m := 10 ^ 365) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (5448 : ℕ) ^ 5 % 10 ^ 365 = 4799383946769235968 := by
      have step := pow_mod_double_add_one (k := 5448) (e := 2) (m := 10 ^ 365) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (5448 : ℕ) ^ 11 % 10 ^ 365 = 125489701990822041433573862369172758986752 := by
      have step := pow_mod_double_add_one (k := 5448) (e := 5) (m := 10 ^ 365) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h22 : (5448 : ℕ) ^ 22 % 10 ^ 365 = 15747665305745325429145908490840041946925134093735779056115068930338479577711509504 := by
      have step := pow_mod_double (k := 5448) (e := 11) (m := 10 ^ 365) h11
      have he : 2 * 11 = 22 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h45 : (5448 : ℕ) ^ 45 % 10 ^ 365 = 1351043868145510275337918759689452927074218251849680010507492269382910603189682712616539620768575403728825190403078413788726404022434751560222212699131103286258112135168 := by
      have step := pow_mod_double_add_one (k := 5448) (e := 22) (m := 10 ^ 365) h22
      have he : 2 * 22 + 1 = 45 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h91 : (5448 : ℕ) ^ 91 % 10 ^ 365 = 9944340819344719935972972438645047501396868837200349658489887255784907635473593626587139260051785436804171835693740332496023103262376727390882388717411033610636512086022974736710496611303843475847095947744570667963145577917467899802451243487577351908664090187604940340113011683968750953170105849251029916220021877029030453775728300211044352 := by
      have step := pow_mod_double_add_one (k := 5448) (e := 45) (m := 10 ^ 365) h45
      have he : 2 * 45 + 1 = 91 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h182 : (5448 : ℕ) ^ 182 % 10 ^ 365 = 46201514403951480279021497112350780304614706616749078358493071675013156640201848037853951993852167040212408511604976378223851443448947453537026864950275209973433277273715380714389053610187548128972853257798659816283197031220158957636124351621251097635928415002456113979689481817899176364221441650047817568891784289469910465000510436425030031619064847662918511099904 := by
      have step := pow_mod_double (k := 5448) (e := 91) (m := 10 ^ 365) h91
      have he : 2 * 91 = 182 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h364 : (5448 : ℕ) ^ 364 % 10 ^ 365 = 81620775964927856316751702700046190201395998913571388092300461695194742337150618013476681558779109860686242698056095792784309765979280143698065567076474659035771264730846951970667710755461249641818055947181304918131940874650113173423745573625195467855943221525422360316782780017004601974995344597949099238940579905703306585931454732585168568695308289542855868809216 := by
      have step := pow_mod_double (k := 5448) (e := 182) (m := 10 ^ 365) h182
      have he : 2 * 182 = 364 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h729 : (5448 : ℕ) ^ 729 % 10 ^ 365 = 22856648882878623929251611743799029743763292463823386134624885674204966713330038887643589476043068533544047216372263270661910683055439871908868499286555682191787485915924104034707681119463222724920287318580909581254543129800356189693340612602323437821493822917338795792778396875357717038364697191231441515867307882206855247539439431999086223038672280369618000805888 := by
      have step := pow_mod_double_add_one (k := 5448) (e := 364) (m := 10 ^ 365) h364
      have he : 2 * 364 + 1 = 729 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1458 : (5448 : ℕ) ^ 1458 % 10 ^ 365 = 37878173935224140390126740935965615007654067665954967381756874961955117531558973917923684006863452681199439388570454889554975540184243915434255729310724092439518608993496886968098821307075306316595544528094984045680182257103038335816390928714626741425243133238921455789456575076181492389668713175069702533407424926344732896458364373537939076519289021422217455468544 := by
      have step := pow_mod_double (k := 5448) (e := 729) (m := 10 ^ 365) h729
      have he : 2 * 729 = 1458 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1458
  rw [hmod]
  decide
private theorem cert_5448 : ExponentCertificate 5448 1458 1458 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5448) (by decide) (by decide) (by decide) suffix_5448
private theorem cert_5449 : ExponentCertificate 5449 1459 1458 := by decide
private theorem cert_5450 : ExponentCertificate 5450 1459 1458 := by decide
private theorem cert_5451 : ExponentCertificate 5451 1459 1458 := by decide
private theorem cert_5452 : ExponentCertificate 5452 1459 1459 := by decide
private theorem cert_5453 : ExponentCertificate 5453 1460 1459 := by decide
private theorem cert_5454 : ExponentCertificate 5454 1460 1459 := by decide
private theorem cert_5455 : ExponentCertificate 5455 1460 1459 := by decide
private theorem cert_5456 : ExponentCertificate 5456 1460 1460 := by decide
private theorem cert_5457 : ExponentCertificate 5457 1461 1460 := by decide
private theorem cert_5458 : ExponentCertificate 5458 1461 1460 := by decide
private theorem cert_5459 : ExponentCertificate 5459 1461 1460 := by decide
private theorem cert_5460 : ExponentCertificate 5460 1461 1460 := by decide
private theorem cert_5461 : ExponentCertificate 5461 1461 1461 := by decide
private theorem cert_5462 : ExponentCertificate 5462 1462 1461 := by decide
private theorem cert_5463 : ExponentCertificate 5463 1462 1461 := by decide
private theorem cert_5464 : ExponentCertificate 5464 1462 1461 := by decide
private theorem cert_5465 : ExponentCertificate 5465 1462 1462 := by decide
private theorem cert_5466 : ExponentCertificate 5466 1463 1462 := by decide
private theorem cert_5467 : ExponentCertificate 5467 1463 1462 := by decide
private theorem cert_5468 : ExponentCertificate 5468 1463 1462 := by decide
private theorem cert_5469 : ExponentCertificate 5469 1463 1463 := by decide
private theorem cert_5470 : ExponentCertificate 5470 1464 1463 := by decide
private theorem cert_5471 : ExponentCertificate 5471 1464 1463 := by decide
private theorem cert_5472 : ExponentCertificate 5472 1464 1463 := by decide
private theorem cert_5473 : ExponentCertificate 5473 1464 1464 := by decide
private theorem cert_5474 : ExponentCertificate 5474 1465 1464 := by decide
private theorem cert_5475 : ExponentCertificate 5475 1465 1464 := by decide
private theorem cert_5476 : ExponentCertificate 5476 1465 1464 := by decide
private theorem cert_5477 : ExponentCertificate 5477 1465 1465 := by decide
private theorem cert_5478 : ExponentCertificate 5478 1465 1465 := by decide
private theorem cert_5479 : ExponentCertificate 5479 1466 1465 := by decide
private theorem cert_5480 : ExponentCertificate 5480 1466 1465 := by decide
private theorem cert_5481 : ExponentCertificate 5481 1466 1465 := by decide
private theorem cert_5482 : ExponentCertificate 5482 1466 1466 := by decide
private theorem cert_5483 : ExponentCertificate 5483 1467 1466 := by decide
private theorem cert_5484 : ExponentCertificate 5484 1467 1466 := by decide
private theorem cert_5485 : ExponentCertificate 5485 1467 1466 := by decide
private theorem cert_5486 : ExponentCertificate 5486 1467 1467 := by decide
private theorem cert_5487 : ExponentCertificate 5487 1468 1467 := by decide
private theorem cert_5488 : ExponentCertificate 5488 1468 1467 := by decide
private theorem cert_5489 : ExponentCertificate 5489 1468 1467 := by decide
private theorem cert_5490 : ExponentCertificate 5490 1468 1468 := by decide
private theorem cert_5491 : ExponentCertificate 5491 1469 1468 := by decide
private theorem cert_5492 : ExponentCertificate 5492 1469 1468 := by decide
private theorem cert_5493 : ExponentCertificate 5493 1469 1468 := by decide
private theorem cert_5494 : ExponentCertificate 5494 1469 1469 := by decide
private theorem suffix_5495 : 1469 < digitSum ((5495 : ℕ) ^ 1469 % 10 ^ 368) := by
  have hmod : (5495 : ℕ) ^ 1469 % 10 ^ 368 = 28373066592347611708765608437077596812032514067117512251522713021572560422796512664316607318139021301897917377488382588991529465894989946356241669371982870466288823153896209765237136769380019225981279628002576997779482383470108165826722449780056701472067025568374245934554619132046356628208203762477911194575446691705687281260216126010931247947155497968196868896484375 := by
    have h1 : (5495 : ℕ) ^ 1 % 10 ^ 368 = 5495 := by decide
    have h2 : (5495 : ℕ) ^ 2 % 10 ^ 368 = 30195025 := by
      have step := pow_mod_double (k := 5495) (e := 1) (m := 10 ^ 368) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (5495 : ℕ) ^ 5 % 10 ^ 368 = 5010008743454684375 := by
      have step := pow_mod_double_add_one (k := 5495) (e := 2) (m := 10 ^ 368) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (5495 : ℕ) ^ 11 % 10 ^ 368 = 137925530914160657978060866624125927734375 := by
      have step := pow_mod_double_add_one (k := 5495) (e := 5) (m := 10 ^ 368) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h22 : (5495 : ℕ) ^ 22 % 10 ^ 368 = 19023452077953087349235255397664937533814461305817790104155634607794284820556640625 := by
      have step := pow_mod_double (k := 5495) (e := 11) (m := 10 ^ 368) h11
      have he : 2 * 11 = 22 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h45 : (5495 : ℕ) ^ 45 % 10 ^ 368 = 1988595050647166115076803085129637550339769222875198872416701392706536755784745632760874230774959836121159981104433282989427379908197210028220069943927228450775146484375 := by
      have step := pow_mod_double_add_one (k := 5495) (e := 22) (m := 10 ^ 368) h22
      have he : 2 * 22 + 1 = 45 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h91 : (5495 : ℕ) ^ 91 % 10 ^ 368 = 21730033963643936389135813997066941615810861601003003918972096004510796353263140705694480973123364767751314392895274031423349779866709493887074497133276222254884101869114066398650217416636569717718245673966840782675707456662317080236435512244369887470640081531766256054487603940945077012209914871557724092010488448067917488515377044677734375 := by
      have step := pow_mod_double_add_one (k := 5495) (e := 45) (m := 10 ^ 368) h45
      have he : 2 * 45 + 1 = 91 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h183 : (5495 : ℕ) ^ 183 % 10 ^ 368 = 21608452066583197561060434805117294057687164042480457490875219647133830995742640596178412421469993961661795531626633991577003918826779242376277975962243937331373749972589937786217137479486496506229905241881416713745859109321926779587910959702256036910200851453349268947189106804743438756431851681009652187990820135655682738737813630702788714188500307500362396240234375 := by
      have step := pow_mod_double_add_one (k := 5495) (e := 91) (m := 10 ^ 368) h91
      have he : 2 * 91 + 1 = 183 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h367 : (5495 : ℕ) ^ 367 % 10 ^ 368 = 71250276484380985076712852993271744491229833829275880190521031024453878329492726856946326118237121103364081286761654518551951653457996861818088560646623882941788031450938387590617594346987837341847977527767976297589067320350479124179321349592877816252913694931028287849037045143983655086050405980706209947932783995905625909115209404287583083714707754552364349365234375 := by
      have step := pow_mod_double_add_one (k := 5495) (e := 183) (m := 10 ^ 368) h183
      have he : 2 * 183 + 1 = 367 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h734 : (5495 : ℕ) ^ 734 % 10 ^ 368 = 27913605798196271231114367484769939495200379067813014458457085680260435096934756923591827574225985381225618631420873854750978326473023094548973972715397964968902518169576164776734326591124390663000011062658864643208127255515176941047419353463871093066003322917561975762683945284144529146121226393420493225744997133184436234804894072514258596129366196691989898681640625 := by
      have step := pow_mod_double (k := 5495) (e := 367) (m := 10 ^ 368) h367
      have he : 2 * 367 = 734 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1469 : (5495 : ℕ) ^ 1469 % 10 ^ 368 = 28373066592347611708765608437077596812032514067117512251522713021572560422796512664316607318139021301897917377488382588991529465894989946356241669371982870466288823153896209765237136769380019225981279628002576997779482383470108165826722449780056701472067025568374245934554619132046356628208203762477911194575446691705687281260216126010931247947155497968196868896484375 := by
      have step := pow_mod_double_add_one (k := 5495) (e := 734) (m := 10 ^ 368) h734
      have he : 2 * 734 + 1 = 1469 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1469
  rw [hmod]
  decide
private theorem cert_5495 : ExponentCertificate 5495 1469 1469 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5495) (by decide) (by decide) (by decide) suffix_5495
private theorem cert_5496 : ExponentCertificate 5496 1470 1469 := by decide
private theorem cert_5497 : ExponentCertificate 5497 1470 1469 := by decide
private theorem cert_5498 : ExponentCertificate 5498 1470 1469 := by decide
private theorem cert_5499 : ExponentCertificate 5499 1470 1470 := by decide
private theorem cert_5500 : ExponentCertificate 5500 1471 1470 := by decide

private theorem certificates_5401_5500 {k : ℕ} (hlo : 5401 ≤ k) (hhi : k ≤ 5500) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1447, 1447, cert_5401⟩
  · exact ⟨1447, 1447, cert_5402⟩
  · exact ⟨1448, 1447, cert_5403⟩
  · exact ⟨1448, 1447, cert_5404⟩
  · exact ⟨1448, 1447, cert_5405⟩
  · exact ⟨1448, 1448, cert_5406⟩
  · exact ⟨1449, 1448, cert_5407⟩
  · exact ⟨1449, 1448, cert_5408⟩
  · exact ⟨1449, 1448, cert_5409⟩
  · exact ⟨1449, 1449, cert_5410⟩
  · exact ⟨1450, 1449, cert_5411⟩
  · exact ⟨1450, 1449, cert_5412⟩
  · exact ⟨1450, 1449, cert_5413⟩
  · exact ⟨1450, 1450, cert_5414⟩
  · exact ⟨1451, 1450, cert_5415⟩
  · exact ⟨1451, 1450, cert_5416⟩
  · exact ⟨1451, 1450, cert_5417⟩
  · exact ⟨1451, 1451, cert_5418⟩
  · exact ⟨1452, 1451, cert_5419⟩
  · exact ⟨1452, 1451, cert_5420⟩
  · exact ⟨1452, 1451, cert_5421⟩
  · exact ⟨1452, 1452, cert_5422⟩
  · exact ⟨1452, 1452, cert_5423⟩
  · exact ⟨1453, 1452, cert_5424⟩
  · exact ⟨1453, 1452, cert_5425⟩
  · exact ⟨1453, 1452, cert_5426⟩
  · exact ⟨1453, 1453, cert_5427⟩
  · exact ⟨1454, 1453, cert_5428⟩
  · exact ⟨1454, 1453, cert_5429⟩
  · exact ⟨1454, 1453, cert_5430⟩
  · exact ⟨1454, 1454, cert_5431⟩
  · exact ⟨1455, 1454, cert_5432⟩
  · exact ⟨1455, 1454, cert_5433⟩
  · exact ⟨1455, 1454, cert_5434⟩
  · exact ⟨1455, 1455, cert_5435⟩
  · exact ⟨1456, 1455, cert_5436⟩
  · exact ⟨1456, 1455, cert_5437⟩
  · exact ⟨1456, 1455, cert_5438⟩
  · exact ⟨1456, 1456, cert_5439⟩
  · exact ⟨1456, 1456, cert_5440⟩
  · exact ⟨1457, 1456, cert_5441⟩
  · exact ⟨1457, 1456, cert_5442⟩
  · exact ⟨1457, 1456, cert_5443⟩
  · exact ⟨1457, 1457, cert_5444⟩
  · exact ⟨1458, 1457, cert_5445⟩
  · exact ⟨1458, 1457, cert_5446⟩
  · exact ⟨1458, 1457, cert_5447⟩
  · exact ⟨1458, 1458, cert_5448⟩
  · exact ⟨1459, 1458, cert_5449⟩
  · exact ⟨1459, 1458, cert_5450⟩
  · exact ⟨1459, 1458, cert_5451⟩
  · exact ⟨1459, 1459, cert_5452⟩
  · exact ⟨1460, 1459, cert_5453⟩
  · exact ⟨1460, 1459, cert_5454⟩
  · exact ⟨1460, 1459, cert_5455⟩
  · exact ⟨1460, 1460, cert_5456⟩
  · exact ⟨1461, 1460, cert_5457⟩
  · exact ⟨1461, 1460, cert_5458⟩
  · exact ⟨1461, 1460, cert_5459⟩
  · exact ⟨1461, 1460, cert_5460⟩
  · exact ⟨1461, 1461, cert_5461⟩
  · exact ⟨1462, 1461, cert_5462⟩
  · exact ⟨1462, 1461, cert_5463⟩
  · exact ⟨1462, 1461, cert_5464⟩
  · exact ⟨1462, 1462, cert_5465⟩
  · exact ⟨1463, 1462, cert_5466⟩
  · exact ⟨1463, 1462, cert_5467⟩
  · exact ⟨1463, 1462, cert_5468⟩
  · exact ⟨1463, 1463, cert_5469⟩
  · exact ⟨1464, 1463, cert_5470⟩
  · exact ⟨1464, 1463, cert_5471⟩
  · exact ⟨1464, 1463, cert_5472⟩
  · exact ⟨1464, 1464, cert_5473⟩
  · exact ⟨1465, 1464, cert_5474⟩
  · exact ⟨1465, 1464, cert_5475⟩
  · exact ⟨1465, 1464, cert_5476⟩
  · exact ⟨1465, 1465, cert_5477⟩
  · exact ⟨1465, 1465, cert_5478⟩
  · exact ⟨1466, 1465, cert_5479⟩
  · exact ⟨1466, 1465, cert_5480⟩
  · exact ⟨1466, 1465, cert_5481⟩
  · exact ⟨1466, 1466, cert_5482⟩
  · exact ⟨1467, 1466, cert_5483⟩
  · exact ⟨1467, 1466, cert_5484⟩
  · exact ⟨1467, 1466, cert_5485⟩
  · exact ⟨1467, 1467, cert_5486⟩
  · exact ⟨1468, 1467, cert_5487⟩
  · exact ⟨1468, 1467, cert_5488⟩
  · exact ⟨1468, 1467, cert_5489⟩
  · exact ⟨1468, 1468, cert_5490⟩
  · exact ⟨1469, 1468, cert_5491⟩
  · exact ⟨1469, 1468, cert_5492⟩
  · exact ⟨1469, 1468, cert_5493⟩
  · exact ⟨1469, 1469, cert_5494⟩
  · exact ⟨1469, 1469, cert_5495⟩
  · exact ⟨1470, 1469, cert_5496⟩
  · exact ⟨1470, 1469, cert_5497⟩
  · exact ⟨1470, 1469, cert_5498⟩
  · exact ⟨1470, 1470, cert_5499⟩
  · exact ⟨1471, 1470, cert_5500⟩

theorem no_fixed_digitCount_5401_5500 {n : ℕ} (hn : a n = n)
    (hlo : 5401 ≤ digitCount n) (hhi : digitCount n ≤ 5500) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_5401_5500 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_5401_5500
end OeisA113010
