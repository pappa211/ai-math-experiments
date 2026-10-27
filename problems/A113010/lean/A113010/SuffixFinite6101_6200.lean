import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 6201
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_6101 : ExponentCertificate 6101 1612 1611 := by decide
private theorem cert_6102 : ExponentCertificate 6102 1612 1611 := by decide
private theorem suffix_6103 : 1612 < digitSum ((6103 : ℕ) ^ 1612 % 10 ^ 403) := by
  have hmod : (6103 : ℕ) ^ 1612 % 10 ^ 403 = 5123736971507058037231027331809023948044541290870258791266952700343334705915182957067222867339665771229590559337718456914657186149183297454328610664203727549451982291124486514173272723967626536111149555393011828619188589103717953804183737424105509725290432756940195092990269359250059174864145202236641240692263747791170032726958630778640339193825297521868201169107955380565575385735400136354759943583841 := by
    have h1 : (6103 : ℕ) ^ 1 % 10 ^ 403 = 6103 := by decide
    have h3 : (6103 : ℕ) ^ 3 % 10 ^ 403 = 227316054727 := by
      have step := pow_mod_double_add_one (k := 6103) (e := 1) (m := 10 ^ 403) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (6103 : ℕ) ^ 6 % 10 ^ 403 = 51672588736648459044529 := by
      have step := pow_mod_double (k := 6103) (e := 3) (m := 10 ^ 403) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (6103 : ℕ) ^ 12 % 10 ^ 403 = 2670056426746809192736593554783119463604831841 := by
      have step := pow_mod_double (k := 6103) (e := 6) (m := 10 ^ 403) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h25 : (6103 : ℕ) ^ 25 % 10 ^ 403 = 43509515668238862769095175260805728399054599043260265087818420392508372235699285156479102961943 := by
      have step := pow_mod_double_add_one (k := 6103) (e := 12) (m := 10 ^ 403) h12
      have he : 2 * 12 + 1 = 25 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h50 : (6103 : ℕ) ^ 50 % 10 ^ 403 = 1893077953684723093012953843808925467179319032163570302720241720116127316504222819502122997471141223636738176233523380519159587168237084167042812281217714620500169220404285284358555706335249 := by
      have step := pow_mod_double (k := 6103) (e := 25) (m := 10 ^ 403) h25
      have he : 2 * 25 = 50 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h100 : (6103 : ℕ) ^ 100 % 10 ^ 403 = 3583744138727138592054428244347790934073128410540718323019509248198772126585269071330611637845027024219480492558538450259289047142894666141215951994856310708944176360311775520772483781533067138375151175118133540321321991754975714069872388253313515434833095542502035826108913700778497209763679192433957248864569805047288730263982630326799264358139348931255676897001319873979892001 := by
      have step := pow_mod_double (k := 6103) (e := 50) (m := 10 ^ 403) h50
      have he : 2 * 50 = 100 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h201 : (6103 : ℕ) ^ 201 % 10 ^ 403 = 6778724841724142113375250184532748639676975921156737795274086339641456499950974993210946454208887599694471905351980458872325955932629387073373125907197195302942316645312395606930715560061162374193524797832888172904347259164436059459904561956381856788361425241071114764787643805912592087248926125382810377627839360509410203051041391802703631746221185946251025431622082332346557906772466437265943953758103 := by
      have step := pow_mod_double_add_one (k := 6103) (e := 100) (m := 10 ^ 403) h100
      have he : 2 * 100 + 1 = 201 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h403 : (6103 : ℕ) ^ 403 % 10 ^ 403 = 4862591463505781818497894046149286991564056722319021510596872647689462645807502279118650860560469683371498960093670324949226207460581838225349150800502270290800752676432683062417861650264568488891330132821539312133538860406433995470305899063376233849324577007092260284410425569428617277891796805102895614019320931008006701781736408245125813561999683295342664446093941095231420640288291105420263881990727 := by
      have step := pow_mod_double_add_one (k := 6103) (e := 201) (m := 10 ^ 403) h201
      have he : 2 * 201 + 1 = 403 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h806 : (6103 : ℕ) ^ 806 % 10 ^ 403 = 3673517544234737086080724054669003453678313864523062194137158772930916190058050039996692247339882958272789089831903663686955490389369262617493208662596635498754731438198210728933232958885106331372546510487665568836435265957983756021582858726122366397283768895815206647657709102369335356904303893932463447793712045266568617888478533531725946902771198576362039244982994924735848574303672585710044513988529 := by
      have step := pow_mod_double (k := 6103) (e := 403) (m := 10 ^ 403) h403
      have he : 2 * 403 = 806 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1612 : (6103 : ℕ) ^ 1612 % 10 ^ 403 = 5123736971507058037231027331809023948044541290870258791266952700343334705915182957067222867339665771229590559337718456914657186149183297454328610664203727549451982291124486514173272723967626536111149555393011828619188589103717953804183737424105509725290432756940195092990269359250059174864145202236641240692263747791170032726958630778640339193825297521868201169107955380565575385735400136354759943583841 := by
      have step := pow_mod_double (k := 6103) (e := 806) (m := 10 ^ 403) h806
      have he : 2 * 806 = 1612 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1612
  rw [hmod]
  decide
private theorem cert_6103 : ExponentCertificate 6103 1612 1612 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 6103) (by decide) (by decide) (by decide) suffix_6103
private theorem cert_6104 : ExponentCertificate 6104 1613 1612 := by decide
private theorem cert_6105 : ExponentCertificate 6105 1613 1612 := by decide
private theorem cert_6106 : ExponentCertificate 6106 1613 1612 := by decide
private theorem suffix_6107 : 1613 < digitSum ((6107 : ℕ) ^ 1613 % 10 ^ 404) := by
  have hmod : (6107 : ℕ) ^ 1613 % 10 ^ 404 = 7256341862302657460023193793772010769630891072001035329389028315185805853303732418201612825013041627680212895798226780264006986259720825050753656413707680338573753886791173713964755873438619732769086541113920980502765308605916494235377505132065549915904466391501991677351466785070134837228744492656741394001530479981243272347150577414300507791022429812321828554268196743797088421757551967041470482869707 := by
    have h1 : (6107 : ℕ) ^ 1 % 10 ^ 404 = 6107 := by decide
    have h3 : (6107 : ℕ) ^ 3 % 10 ^ 404 = 227763307043 := by
      have step := pow_mod_double_add_one (k := 6107) (e := 1) (m := 10 ^ 404) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (6107 : ℕ) ^ 6 % 10 ^ 404 = 51876124035163893403849 := by
      have step := pow_mod_double (k := 6107) (e := 3) (m := 10 ^ 404) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (6107 : ℕ) ^ 12 % 10 ^ 404 = 2691132244911708990318205001869255211408014801 := by
      have step := pow_mod_double (k := 6107) (e := 6) (m := 10 ^ 404) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h25 : (6107 : ℕ) ^ 25 % 10 ^ 404 = 44228071182898784939960144262592074615112300163811124543832302203844798877664162433692770053307 := by
      have step := pow_mod_double_add_one (k := 6107) (e := 12) (m := 10 ^ 404) h12
      have he : 2 * 12 + 1 = 25 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h50 : (6107 : ℕ) ^ 50 % 10 ^ 404 = 1956122280559561925728541527746121511939376041672220146551028444372136115751207331488353886736051108819857357526618062688852315008096726320994748394181277017076670650185763978620983621636249 := by
      have step := pow_mod_double (k := 6107) (e := 25) (m := 10 ^ 404) h25
      have he : 2 * 25 = 50 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h100 : (6107 : ℕ) ^ 100 % 10 ^ 404 = 3826414376501541500227720177383886771130693055486544794649060058588793571751126163803945436128716645499590962076193247324875756483331980100788601027399092725109849945364168483089075542365495859683955066466874589916828906546640456493223999249171615516908125387057973943954363389876210263849055922687880296519958501364955041814119848949785847151973808825313624817516057160070790001 := by
      have step := pow_mod_double (k := 6107) (e := 50) (m := 10 ^ 404) h50
      have he : 2 * 50 = 100 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h201 : (6107 : ℕ) ^ 201 % 10 ^ 404 = 86132807517201527604689686446293181752422001499873532797811212389037677432393974771689613931125909307985564356859701052939472248959367784465363279572650704946916651658716343330810818976452535659575686861838699058359757453452444952897512691836627198694189122697926539279031150690285036494484742305908872694568710467250483644277401144625052547323780023188120764646901933026422131224577528795298683329066107 := by
      have step := pow_mod_double_add_one (k := 6107) (e := 100) (m := 10 ^ 404) h100
      have he : 2 * 100 + 1 = 201 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h403 : (6107 : ℕ) ^ 403 % 10 ^ 404 = 43356864667623858125589204201288387308864397162395244572680151155870189659514377152814863398034682168894665913606060152339784123273803975629464088670564410718294961029490833339278202044086993866045494132112426558372069257660114383567341390817534083150406154845396677135367819267475999912240844154508345291228255856752378847983846122901818728977818616451107448873827916452645759577933417384365787859187043 := by
      have step := pow_mod_double_add_one (k := 6107) (e := 201) (m := 10 ^ 404) h201
      have he : 2 * 201 + 1 = 403 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h806 : (6107 : ℕ) ^ 806 % 10 ^ 404 = 75494005715075127474755922875788023251806716266313227082990821762135154858784962948012111884020226422263872007874865898791807612256019891869749766836202178465304498706435858164475853035450457715669889867917274968229947675236223224345346619341855968985450618754166854392051154180473491786673505624540304207934826577702677141572454345730815912925480833479002686965665739861852498082845439663998056859083849 := by
      have step := pow_mod_double (k := 6107) (e := 403) (m := 10 ^ 404) h403
      have he : 2 * 403 = 806 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1613 : (6107 : ℕ) ^ 1613 % 10 ^ 404 = 7256341862302657460023193793772010769630891072001035329389028315185805853303732418201612825013041627680212895798226780264006986259720825050753656413707680338573753886791173713964755873438619732769086541113920980502765308605916494235377505132065549915904466391501991677351466785070134837228744492656741394001530479981243272347150577414300507791022429812321828554268196743797088421757551967041470482869707 := by
      have step := pow_mod_double_add_one (k := 6107) (e := 806) (m := 10 ^ 404) h806
      have he : 2 * 806 + 1 = 1613 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1613
  rw [hmod]
  decide
private theorem cert_6107 : ExponentCertificate 6107 1613 1613 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 6107) (by decide) (by decide) (by decide) suffix_6107
private theorem cert_6108 : ExponentCertificate 6108 1614 1613 := by decide
private theorem cert_6109 : ExponentCertificate 6109 1614 1613 := by decide
private theorem cert_6110 : ExponentCertificate 6110 1614 1613 := by decide
private theorem cert_6111 : ExponentCertificate 6111 1614 1614 := by decide
private theorem cert_6112 : ExponentCertificate 6112 1615 1614 := by decide
private theorem cert_6113 : ExponentCertificate 6113 1615 1614 := by decide
private theorem cert_6114 : ExponentCertificate 6114 1615 1614 := by decide
private theorem cert_6115 : ExponentCertificate 6115 1615 1614 := by decide
private theorem cert_6116 : ExponentCertificate 6116 1615 1615 := by decide
private theorem cert_6117 : ExponentCertificate 6117 1616 1615 := by decide
private theorem cert_6118 : ExponentCertificate 6118 1616 1615 := by decide
private theorem cert_6119 : ExponentCertificate 6119 1616 1615 := by decide
private theorem cert_6120 : ExponentCertificate 6120 1616 1616 := by decide
private theorem cert_6121 : ExponentCertificate 6121 1617 1616 := by decide
private theorem cert_6122 : ExponentCertificate 6122 1617 1616 := by decide
private theorem cert_6123 : ExponentCertificate 6123 1617 1616 := by decide
private theorem cert_6124 : ExponentCertificate 6124 1617 1617 := by decide
private theorem cert_6125 : ExponentCertificate 6125 1618 1617 := by decide
private theorem cert_6126 : ExponentCertificate 6126 1618 1617 := by decide
private theorem cert_6127 : ExponentCertificate 6127 1618 1617 := by decide
private theorem cert_6128 : ExponentCertificate 6128 1618 1618 := by decide
private theorem cert_6129 : ExponentCertificate 6129 1619 1618 := by decide
private theorem cert_6130 : ExponentCertificate 6130 1619 1618 := by decide
private theorem cert_6131 : ExponentCertificate 6131 1619 1618 := by decide
private theorem cert_6132 : ExponentCertificate 6132 1619 1618 := by decide
private theorem cert_6133 : ExponentCertificate 6133 1619 1619 := by decide
private theorem cert_6134 : ExponentCertificate 6134 1620 1619 := by decide
private theorem cert_6135 : ExponentCertificate 6135 1620 1619 := by decide
private theorem cert_6136 : ExponentCertificate 6136 1620 1619 := by decide
private theorem cert_6137 : ExponentCertificate 6137 1620 1620 := by decide
private theorem cert_6138 : ExponentCertificate 6138 1621 1620 := by decide
private theorem cert_6139 : ExponentCertificate 6139 1621 1620 := by decide
private theorem cert_6140 : ExponentCertificate 6140 1621 1620 := by decide
private theorem cert_6141 : ExponentCertificate 6141 1621 1621 := by decide
private theorem cert_6142 : ExponentCertificate 6142 1622 1621 := by decide
private theorem cert_6143 : ExponentCertificate 6143 1622 1621 := by decide
private theorem cert_6144 : ExponentCertificate 6144 1622 1621 := by decide
private theorem cert_6145 : ExponentCertificate 6145 1622 1622 := by decide
private theorem cert_6146 : ExponentCertificate 6146 1622 1622 := by decide
private theorem cert_6147 : ExponentCertificate 6147 1623 1622 := by decide
private theorem cert_6148 : ExponentCertificate 6148 1623 1622 := by decide
private theorem cert_6149 : ExponentCertificate 6149 1623 1622 := by decide
private theorem cert_6150 : ExponentCertificate 6150 1623 1623 := by decide
private theorem cert_6151 : ExponentCertificate 6151 1624 1623 := by decide
private theorem cert_6152 : ExponentCertificate 6152 1624 1623 := by decide
private theorem cert_6153 : ExponentCertificate 6153 1624 1623 := by decide
private theorem cert_6154 : ExponentCertificate 6154 1624 1624 := by decide
private theorem cert_6155 : ExponentCertificate 6155 1625 1624 := by decide
private theorem cert_6156 : ExponentCertificate 6156 1625 1624 := by decide
private theorem cert_6157 : ExponentCertificate 6157 1625 1624 := by decide
private theorem suffix_6158 : 1625 < digitSum ((6158 : ℕ) ^ 1625 % 10 ^ 407) := by
  have hmod : (6158 : ℕ) ^ 1625 % 10 ^ 407 = 89773414736457443474051077863266052579905245675288754573315272418611115862428577102776094787627136087061826736324365965854751767178646190082910372649574316450049508392447604699882377967542592711490301788373911729826304878003188304412650102043144109255223640158194036633267359722605018132746953068044188021208562209629567913916545330479914555063820546001203491689197348292859676236173646162762615654153453568 := by
    have h1 : (6158 : ℕ) ^ 1 % 10 ^ 407 = 6158 := by decide
    have h3 : (6158 : ℕ) ^ 3 % 10 ^ 407 = 233517296312 := by
      have step := pow_mod_double_add_one (k := 6158) (e := 1) (m := 10 ^ 407) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (6158 : ℕ) ^ 6 % 10 ^ 407 = 54530327676866408801344 := by
      have step := pow_mod_double (k := 6158) (e := 3) (m := 10 ^ 407) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (6158 : ℕ) ^ 12 % 10 ^ 407 = 2973556636546422672654068082604134346856206336 := by
      have step := pow_mod_double (k := 6158) (e := 6) (m := 10 ^ 407) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h25 : (6158 : ℕ) ^ 25 % 10 ^ 407 = 54449276597674029445711669980596181853750434317310949956380080829338448583088930455524703469568 := by
      have step := pow_mod_double_add_one (k := 6158) (e := 12) (m := 10 ^ 407) h12
      have he : 2 * 12 + 1 = 25 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h50 : (6158 : ℕ) ^ 50 % 10 ^ 407 = 2964723722010012731857608944262212638503534484513576281542565620692701258107589732376159705603325656733300224739475330122979651564281697311575692389724832871204777706140835517856697102106624 := by
      have step := pow_mod_double (k := 6158) (e := 25) (m := 10 ^ 407) h25
      have he : 2 * 25 = 50 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h101 : (6158 : ℕ) ^ 101 % 10 ^ 407 = 54126275193253546221632605690884611509724322997472338924912933108382838401228648799742871593671609563319621298840456021475632935548761401693912768373983887494896726188699237475334880365757989916328012344795844082078627752656175820152178088439628077794005772744674478670713787667984454276435541084638288170913744211491048557023606215105120725937577179701360407566382414635737083281408 := by
      have step := pow_mod_double_add_one (k := 6158) (e := 50) (m := 10 ^ 407) h50
      have he : 2 * 50 + 1 = 101 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h203 : (6158 : ℕ) ^ 203 % 10 ^ 407 = 2020027733739101789621567671447750970374017625462239016164143269150803296662763200780663467879037664153100408080114393375911375200353021485245227915886671690769074210001078309858563981741868742198856976874117538035604711036347712038327949624658058149291960755873014689082489244184381944802929449674619242017332036895078779629098767864624274069476971787548791932335340280949314784679410617537916727891853312 := by
      have step := pow_mod_double_add_one (k := 6158) (e := 101) (m := 10 ^ 407) h101
      have he : 2 * 101 + 1 = 203 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h406 : (6158 : ℕ) ^ 406 % 10 ^ 407 = 86668700417030591636836492524693403224054462693696528587861148739874549785037945563551637996680585453962548236463369850999690260524120385896993576621303286397394998409628003015224397725782469489072775055829466176898513539601372685524041893656554439843552602619020379079552114736663570459978050434349638146022381261957975218742519145497132430992493985576334260214650551085754533958104705166905701978125369344 := by
      have step := pow_mod_double (k := 6158) (e := 203) (m := 10 ^ 407) h203
      have he : 2 * 203 = 406 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h812 : (6158 : ℕ) ^ 812 % 10 ^ 407 = 63000611972681412880876036307321186224254573876712412187093622209515086500146152221452038394873295904373597104851683687078406435563951286566039728820176010145421463959169277446524952586181896111424136369244872311595262679326165368781236807172418529137803554959683793250849972064523713123550664883091969146392039593327778869615795171082673472243078356840648952842153356091432953509129869217698442336414990336 := by
      have step := pow_mod_double (k := 6158) (e := 406) (m := 10 ^ 407) h406
      have he : 2 * 406 = 812 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1625 : (6158 : ℕ) ^ 1625 % 10 ^ 407 = 89773414736457443474051077863266052579905245675288754573315272418611115862428577102776094787627136087061826736324365965854751767178646190082910372649574316450049508392447604699882377967542592711490301788373911729826304878003188304412650102043144109255223640158194036633267359722605018132746953068044188021208562209629567913916545330479914555063820546001203491689197348292859676236173646162762615654153453568 := by
      have step := pow_mod_double_add_one (k := 6158) (e := 812) (m := 10 ^ 407) h812
      have he : 2 * 812 + 1 = 1625 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1625
  rw [hmod]
  decide
private theorem cert_6158 : ExponentCertificate 6158 1625 1625 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 6158) (by decide) (by decide) (by decide) suffix_6158
private theorem cert_6159 : ExponentCertificate 6159 1626 1625 := by decide
private theorem cert_6160 : ExponentCertificate 6160 1626 1625 := by decide
private theorem cert_6161 : ExponentCertificate 6161 1626 1625 := by decide
private theorem cert_6162 : ExponentCertificate 6162 1626 1625 := by decide
private theorem cert_6163 : ExponentCertificate 6163 1626 1626 := by decide
private theorem cert_6164 : ExponentCertificate 6164 1627 1626 := by decide
private theorem cert_6165 : ExponentCertificate 6165 1627 1626 := by decide
private theorem cert_6166 : ExponentCertificate 6166 1627 1626 := by decide
private theorem cert_6167 : ExponentCertificate 6167 1627 1627 := by decide
private theorem cert_6168 : ExponentCertificate 6168 1628 1627 := by decide
private theorem cert_6169 : ExponentCertificate 6169 1628 1627 := by decide
private theorem cert_6170 : ExponentCertificate 6170 1628 1627 := by decide
private theorem cert_6171 : ExponentCertificate 6171 1628 1628 := by decide
private theorem cert_6172 : ExponentCertificate 6172 1629 1628 := by decide
private theorem cert_6173 : ExponentCertificate 6173 1629 1628 := by decide
private theorem cert_6174 : ExponentCertificate 6174 1629 1628 := by decide
private theorem cert_6175 : ExponentCertificate 6175 1629 1629 := by decide
private theorem cert_6176 : ExponentCertificate 6176 1629 1629 := by decide
private theorem cert_6177 : ExponentCertificate 6177 1630 1629 := by decide
private theorem cert_6178 : ExponentCertificate 6178 1630 1629 := by decide
private theorem cert_6179 : ExponentCertificate 6179 1630 1629 := by decide
private theorem cert_6180 : ExponentCertificate 6180 1630 1630 := by decide
private theorem cert_6181 : ExponentCertificate 6181 1631 1630 := by decide
private theorem cert_6182 : ExponentCertificate 6182 1631 1630 := by decide
private theorem cert_6183 : ExponentCertificate 6183 1631 1630 := by decide
private theorem cert_6184 : ExponentCertificate 6184 1631 1631 := by decide
private theorem cert_6185 : ExponentCertificate 6185 1632 1631 := by decide
private theorem cert_6186 : ExponentCertificate 6186 1632 1631 := by decide
private theorem cert_6187 : ExponentCertificate 6187 1632 1631 := by decide
private theorem cert_6188 : ExponentCertificate 6188 1632 1632 := by decide
private theorem cert_6189 : ExponentCertificate 6189 1633 1632 := by decide
private theorem cert_6190 : ExponentCertificate 6190 1633 1632 := by decide
private theorem cert_6191 : ExponentCertificate 6191 1633 1632 := by decide
private theorem cert_6192 : ExponentCertificate 6192 1633 1632 := by decide
private theorem cert_6193 : ExponentCertificate 6193 1633 1633 := by decide
private theorem cert_6194 : ExponentCertificate 6194 1634 1633 := by decide
private theorem cert_6195 : ExponentCertificate 6195 1634 1633 := by decide
private theorem cert_6196 : ExponentCertificate 6196 1634 1633 := by decide
private theorem cert_6197 : ExponentCertificate 6197 1634 1634 := by decide
private theorem cert_6198 : ExponentCertificate 6198 1635 1634 := by decide
private theorem cert_6199 : ExponentCertificate 6199 1635 1634 := by decide
private theorem cert_6200 : ExponentCertificate 6200 1635 1634 := by decide

private theorem certificates_6101_6200 {k : ℕ} (hlo : 6101 ≤ k) (hhi : k ≤ 6200) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1612, 1611, cert_6101⟩
  · exact ⟨1612, 1611, cert_6102⟩
  · exact ⟨1612, 1612, cert_6103⟩
  · exact ⟨1613, 1612, cert_6104⟩
  · exact ⟨1613, 1612, cert_6105⟩
  · exact ⟨1613, 1612, cert_6106⟩
  · exact ⟨1613, 1613, cert_6107⟩
  · exact ⟨1614, 1613, cert_6108⟩
  · exact ⟨1614, 1613, cert_6109⟩
  · exact ⟨1614, 1613, cert_6110⟩
  · exact ⟨1614, 1614, cert_6111⟩
  · exact ⟨1615, 1614, cert_6112⟩
  · exact ⟨1615, 1614, cert_6113⟩
  · exact ⟨1615, 1614, cert_6114⟩
  · exact ⟨1615, 1614, cert_6115⟩
  · exact ⟨1615, 1615, cert_6116⟩
  · exact ⟨1616, 1615, cert_6117⟩
  · exact ⟨1616, 1615, cert_6118⟩
  · exact ⟨1616, 1615, cert_6119⟩
  · exact ⟨1616, 1616, cert_6120⟩
  · exact ⟨1617, 1616, cert_6121⟩
  · exact ⟨1617, 1616, cert_6122⟩
  · exact ⟨1617, 1616, cert_6123⟩
  · exact ⟨1617, 1617, cert_6124⟩
  · exact ⟨1618, 1617, cert_6125⟩
  · exact ⟨1618, 1617, cert_6126⟩
  · exact ⟨1618, 1617, cert_6127⟩
  · exact ⟨1618, 1618, cert_6128⟩
  · exact ⟨1619, 1618, cert_6129⟩
  · exact ⟨1619, 1618, cert_6130⟩
  · exact ⟨1619, 1618, cert_6131⟩
  · exact ⟨1619, 1618, cert_6132⟩
  · exact ⟨1619, 1619, cert_6133⟩
  · exact ⟨1620, 1619, cert_6134⟩
  · exact ⟨1620, 1619, cert_6135⟩
  · exact ⟨1620, 1619, cert_6136⟩
  · exact ⟨1620, 1620, cert_6137⟩
  · exact ⟨1621, 1620, cert_6138⟩
  · exact ⟨1621, 1620, cert_6139⟩
  · exact ⟨1621, 1620, cert_6140⟩
  · exact ⟨1621, 1621, cert_6141⟩
  · exact ⟨1622, 1621, cert_6142⟩
  · exact ⟨1622, 1621, cert_6143⟩
  · exact ⟨1622, 1621, cert_6144⟩
  · exact ⟨1622, 1622, cert_6145⟩
  · exact ⟨1622, 1622, cert_6146⟩
  · exact ⟨1623, 1622, cert_6147⟩
  · exact ⟨1623, 1622, cert_6148⟩
  · exact ⟨1623, 1622, cert_6149⟩
  · exact ⟨1623, 1623, cert_6150⟩
  · exact ⟨1624, 1623, cert_6151⟩
  · exact ⟨1624, 1623, cert_6152⟩
  · exact ⟨1624, 1623, cert_6153⟩
  · exact ⟨1624, 1624, cert_6154⟩
  · exact ⟨1625, 1624, cert_6155⟩
  · exact ⟨1625, 1624, cert_6156⟩
  · exact ⟨1625, 1624, cert_6157⟩
  · exact ⟨1625, 1625, cert_6158⟩
  · exact ⟨1626, 1625, cert_6159⟩
  · exact ⟨1626, 1625, cert_6160⟩
  · exact ⟨1626, 1625, cert_6161⟩
  · exact ⟨1626, 1625, cert_6162⟩
  · exact ⟨1626, 1626, cert_6163⟩
  · exact ⟨1627, 1626, cert_6164⟩
  · exact ⟨1627, 1626, cert_6165⟩
  · exact ⟨1627, 1626, cert_6166⟩
  · exact ⟨1627, 1627, cert_6167⟩
  · exact ⟨1628, 1627, cert_6168⟩
  · exact ⟨1628, 1627, cert_6169⟩
  · exact ⟨1628, 1627, cert_6170⟩
  · exact ⟨1628, 1628, cert_6171⟩
  · exact ⟨1629, 1628, cert_6172⟩
  · exact ⟨1629, 1628, cert_6173⟩
  · exact ⟨1629, 1628, cert_6174⟩
  · exact ⟨1629, 1629, cert_6175⟩
  · exact ⟨1629, 1629, cert_6176⟩
  · exact ⟨1630, 1629, cert_6177⟩
  · exact ⟨1630, 1629, cert_6178⟩
  · exact ⟨1630, 1629, cert_6179⟩
  · exact ⟨1630, 1630, cert_6180⟩
  · exact ⟨1631, 1630, cert_6181⟩
  · exact ⟨1631, 1630, cert_6182⟩
  · exact ⟨1631, 1630, cert_6183⟩
  · exact ⟨1631, 1631, cert_6184⟩
  · exact ⟨1632, 1631, cert_6185⟩
  · exact ⟨1632, 1631, cert_6186⟩
  · exact ⟨1632, 1631, cert_6187⟩
  · exact ⟨1632, 1632, cert_6188⟩
  · exact ⟨1633, 1632, cert_6189⟩
  · exact ⟨1633, 1632, cert_6190⟩
  · exact ⟨1633, 1632, cert_6191⟩
  · exact ⟨1633, 1632, cert_6192⟩
  · exact ⟨1633, 1633, cert_6193⟩
  · exact ⟨1634, 1633, cert_6194⟩
  · exact ⟨1634, 1633, cert_6195⟩
  · exact ⟨1634, 1633, cert_6196⟩
  · exact ⟨1634, 1634, cert_6197⟩
  · exact ⟨1635, 1634, cert_6198⟩
  · exact ⟨1635, 1634, cert_6199⟩
  · exact ⟨1635, 1634, cert_6200⟩

theorem no_fixed_digitCount_6101_6200 {n : ℕ} (hn : a n = n)
    (hlo : 6101 ≤ digitCount n) (hhi : digitCount n ≤ 6200) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_6101_6200 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_6101_6200
end OeisA113010
