import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 4601
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_4501 : ExponentCertificate 4501 1232 1232 := by decide
private theorem cert_4502 : ExponentCertificate 4502 1233 1232 := by decide
private theorem cert_4503 : ExponentCertificate 4503 1233 1232 := by decide
private theorem cert_4504 : ExponentCertificate 4504 1233 1232 := by decide
private theorem cert_4505 : ExponentCertificate 4505 1233 1232 := by decide
private theorem suffix_4506 : 1233 < digitSum ((4506 : ℕ) ^ 1233 % 10 ^ 309) := by
  have hmod : (4506 : ℕ) ^ 1233 % 10 ^ 309 = 935446174861095777707695770600166090423576352545366356905458761492611829700665576290145117698310268668269408735212518244494072292420336223887351798130047715902683714186346709442646100305084100730649046056262109425190799000157624622721473554714108260247695554627646882548194328989988576816384022033304299503616 := by
    have h1 : (4506 : ℕ) ^ 1 % 10 ^ 309 = 4506 := by decide
    have h2 : (4506 : ℕ) ^ 2 % 10 ^ 309 = 20304036 := by
      have step := pow_mod_double (k := 4506) (e := 1) (m := 10 ^ 309) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4506 : ℕ) ^ 4 % 10 ^ 309 = 412253877889296 := by
      have step := pow_mod_double (k := 4506) (e := 2) (m := 10 ^ 309) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (4506 : ℕ) ^ 9 % 10 ^ 309 = 765809388815440173728493378525696 := by
      have step := pow_mod_double_add_one (k := 4506) (e := 4) (m := 10 ^ 309) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h19 : (4506 : ℕ) ^ 19 % 10 ^ 309 = 2642606874110438382687636007893971866652690960159255066777146473578496 := by
      have step := pow_mod_double_add_one (k := 4506) (e := 9) (m := 10 ^ 309) h9
      have he : 2 * 9 + 1 = 19 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h38 : (4506 : ℕ) ^ 38 % 10 ^ 309 = 6983371091095742334499775654911717376664367244194659578851233211831434982603155724265290744156161385282391761679097914716963981423873622016 := by
      have step := pow_mod_double (k := 4506) (e := 19) (m := 10 ^ 309) h19
      have he : 2 * 19 = 38 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h77 : (4506 : ℕ) ^ 77 % 10 ^ 309 = 219746227912558534955613738988855960513479283923683237405854203758431982903923596489904261370544051166471003001250396382716366574430625394622763756911883745725091313769179155699687690844613946849949392056504312945646200540922197347263789049005339490682688754179045101330556608577536 := by
      have step := pow_mod_double_add_one (k := 4506) (e := 38) (m := 10 ^ 309) h38
      have he : 2 * 38 + 1 = 77 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h154 : (4506 : ℕ) ^ 154 % 10 ^ 309 = 952983553050793988605514494692186739824092367555140209421007572666613577628469168033422745151931903640676981164206974775527933700904993400712973269793545495643355841309266880139050683990595799025910967077925995394411795236497958242955431076425100281484967394586124775350176276812307520470376554346649323831296 := by
      have step := pow_mod_double (k := 4506) (e := 77) (m := 10 ^ 309) h77
      have he : 2 * 77 = 154 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h308 : (4506 : ℕ) ^ 308 % 10 ^ 309 = 900719852270899215984574111688775081576114548431250391748595506298991364727198674627869607183524951700755495241375721382523696947582784072153274043434726602223243722487272366463884294889689469838154116690382555958155184547071960790651142812168602477615444662783387320539048572249192395933380662720916269039616 := by
      have step := pow_mod_double (k := 4506) (e := 154) (m := 10 ^ 309) h154
      have he : 2 * 154 = 308 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h616 : (4506 : ℕ) ^ 616 % 10 ^ 309 = 213780433160401718985610529429877284701687078926755414286028105410062661277266060488319706178615297304126494381366357157503518868323118442747648634573382369044255906716238845259071183513784235689430068039220521572040385021632823779331264112710758355832289537354304409777350933375245894039577583998826977427456 := by
      have step := pow_mod_double (k := 4506) (e := 308) (m := 10 ^ 309) h308
      have he : 2 * 308 = 616 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1233 : (4506 : ℕ) ^ 1233 % 10 ^ 309 = 935446174861095777707695770600166090423576352545366356905458761492611829700665576290145117698310268668269408735212518244494072292420336223887351798130047715902683714186346709442646100305084100730649046056262109425190799000157624622721473554714108260247695554627646882548194328989988576816384022033304299503616 := by
      have step := pow_mod_double_add_one (k := 4506) (e := 616) (m := 10 ^ 309) h616
      have he : 2 * 616 + 1 = 1233 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1233
  rw [hmod]
  decide
private theorem cert_4506 : ExponentCertificate 4506 1233 1233 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4506) (by decide) (by decide) (by decide) suffix_4506
private theorem cert_4507 : ExponentCertificate 4507 1234 1233 := by decide
private theorem cert_4508 : ExponentCertificate 4508 1234 1233 := by decide
private theorem cert_4509 : ExponentCertificate 4509 1234 1233 := by decide
private theorem suffix_4510 : 1234 < digitSum ((451 : ℕ) ^ 1234 % 10 ^ 309) := by
  have hmod : (451 : ℕ) ^ 1234 % 10 ^ 309 = 536079637544153436033267622255591787908570136865454032995862910711816615117388848061143172529671295589831191063114591682894006018350487908053644735679871921482814320332814765740121647376915308866611889957827705723836176429806685378380473905356881892708619199508605923814046420350835802542063117575637421657801 := by
    have h1 : (451 : ℕ) ^ 1 % 10 ^ 309 = 451 := by decide
    have h2 : (451 : ℕ) ^ 2 % 10 ^ 309 = 203401 := by
      have step := pow_mod_double (k := 451) (e := 1) (m := 10 ^ 309) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (451 : ℕ) ^ 4 % 10 ^ 309 = 41371966801 := by
      have step := pow_mod_double (k := 451) (e := 2) (m := 10 ^ 309) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (451 : ℕ) ^ 9 % 10 ^ 309 = 771949476279353824294051 := by
      have step := pow_mod_double_add_one (k := 451) (e := 4) (m := 10 ^ 309) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h19 : (451 : ℕ) ^ 19 % 10 ^ 309 = 268753603261513862341910033084900846928519809761051 := by
      have step := pow_mod_double_add_one (k := 451) (e := 9) (m := 10 ^ 309) h9
      have he : 2 * 9 + 1 = 19 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h38 : (451 : ℕ) ^ 38 % 10 ^ 309 = 72228499266047194546058178783816085553645224119128149179065955780213290664459612616990339897716624601 := by
      have step := pow_mod_double (k := 451) (e := 19) (m := 10 ^ 309) h19
      have he : 2 * 19 = 38 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h77 : (451 : ℕ) ^ 77 % 10 ^ 309 = 2352847203907646434673217781794756645636512694740354856799871400350790971668563839718474336782057930815276700359668454423742888274529059508801541489719287021531240586464799935814348615777500918754042549651 := by
      have step := pow_mod_double_add_one (k := 451) (e := 38) (m := 10 ^ 309) h38
      have he : 2 * 38 + 1 = 77 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h154 : (451 : ℕ) ^ 154 % 10 ^ 309 = 119127134575632657229868417178818110224931668582186206116120922226213060784768337815077322284780458108399088507292434679566540151079574588565195932374257964787648509300992040824970675147979199056685550330231777531754286389506731418202551184840833995582905138250433005403709975952101440428006325920180800221801 := by
      have step := pow_mod_double (k := 451) (e := 77) (m := 10 ^ 309) h77
      have he : 2 * 77 = 154 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h308 : (451 : ℕ) ^ 308 % 10 ^ 309 = 450956829906658881973823094518909433942149599338967945330011530283157938556151727407939227197837122067111079248355402704154275098838003877037043849525108487295994879612090155778328379099868222116549726611334360374464592836402523776214286782118576675220052017146248672897260700134110597166879484043290795683601 := by
      have step := pow_mod_double (k := 451) (e := 154) (m := 10 ^ 309) h154
      have he : 2 * 154 = 308 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h617 : (451 : ℕ) ^ 617 % 10 ^ 309 = 330163832850116430893828944074638270637390311377051411687101662103381489903954561684636358054084690023058785920242718416367415878740681590950917967039159327061932425883708368405598817274843654890555449171171702004734516219440874313527870628803595358634798312670892043589202624633459253390883966424778047567651 := by
      have step := pow_mod_double_add_one (k := 451) (e := 308) (m := 10 ^ 309) h308
      have he : 2 * 308 + 1 = 617 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1234 : (451 : ℕ) ^ 1234 % 10 ^ 309 = 536079637544153436033267622255591787908570136865454032995862910711816615117388848061143172529671295589831191063114591682894006018350487908053644735679871921482814320332814765740121647376915308866611889957827705723836176429806685378380473905356881892708619199508605923814046420350835802542063117575637421657801 := by
      have step := pow_mod_double (k := 451) (e := 617) (m := 10 ^ 309) h617
      have he : 2 * 617 = 1234 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1234
  rw [hmod]
  decide
private theorem cert_4510 : ExponentCertificate 4510 1234 1234 :=
  exponentCertificate_of_normalized_suffix (t := 1) (u := 451) (by decide) (by decide) (by decide) suffix_4510
private theorem cert_4511 : ExponentCertificate 4511 1235 1234 := by decide
private theorem cert_4512 : ExponentCertificate 4512 1235 1234 := by decide
private theorem cert_4513 : ExponentCertificate 4513 1235 1234 := by decide
private theorem suffix_4514 : 1235 < digitSum ((4514 : ℕ) ^ 1235 % 10 ^ 309) := by
  have hmod : (4514 : ℕ) ^ 1235 % 10 ^ 309 = 527492780646319495923504065557172306308288074229920173649546522821750274950470191229763614228091388336520147590877392857433110676499948892238759958538625049868495464062211938131680244798472527088125151303748198447555397571324200577695029479684081617694868953422679757183156621558311696234525064677187360129024 := by
    have h1 : (4514 : ℕ) ^ 1 % 10 ^ 309 = 4514 := by decide
    have h2 : (4514 : ℕ) ^ 2 % 10 ^ 309 = 20376196 := by
      have step := pow_mod_double (k := 4514) (e := 1) (m := 10 ^ 309) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4514 : ℕ) ^ 4 % 10 ^ 309 = 415189363430416 := by
      have step := pow_mod_double (k := 4514) (e := 2) (m := 10 ^ 309) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (4514 : ℕ) ^ 9 % 10 ^ 309 = 778133284680973821943546533814784 := by
      have step := pow_mod_double_add_one (k := 4514) (e := 4) (m := 10 ^ 309) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h19 : (4514 : ℕ) ^ 19 % 10 ^ 309 = 2733188219000004141858759322854247711419687523089681067151198987485184 := by
      have step := pow_mod_double_add_one (k := 4514) (e := 9) (m := 10 ^ 309) h9
      have he : 2 * 9 + 1 = 19 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h38 : (4514 : ℕ) ^ 38 % 10 ^ 309 = 7470317840480414601959131486380449591902182859008645579949460339403546287815983595958663824573377589708555606395307029439200827852619513856 := by
      have step := pow_mod_double (k := 4514) (e := 19) (m := 10 ^ 309) h19
      have he : 2 * 19 = 38 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h77 : (4514 : ℕ) ^ 77 % 10 ^ 309 = 251906697951029042657553143440190323083709370154663791021110441483742966279086155025557757493961742904754630789518970010145658255019784991403026700927086454292818975187730720289893341281215419682880552611354834614733459669586092398320587569869077617609168524461038489436576813154304 := by
      have step := pow_mod_double_add_one (k := 4514) (e := 38) (m := 10 ^ 309) h38
      have he : 2 * 38 + 1 = 77 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h154 : (4514 : ℕ) ^ 154 % 10 ^ 309 = 398858278823729631596464933171989153419948202902916209485733903769286920344498457982701605870491734925892495344880913458891474645618961491600739885421279787966453650664119332798203191873514007068450152116461113062252042314013579775592149926139835266001867473629768240213732758853583382593797280066130113724416 := by
      have step := pow_mod_double (k := 4514) (e := 77) (m := 10 ^ 309) h77
      have he : 2 * 77 = 154 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h308 : (4514 : ℕ) ^ 308 % 10 ^ 309 = 938665462856483716586625974327674149176476644346202512056897167024798502874175563267642020343665970475974949802956713789243585452263616116327603656504777810243605608681752728162344708016804085897359489418556353998224318790194318914755754802518299201807067120347317118429302453413825494972718164193402794541056 := by
      have step := pow_mod_double (k := 4514) (e := 154) (m := 10 ^ 309) h154
      have he : 2 * 154 = 308 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h617 : (4514 : ℕ) ^ 617 % 10 ^ 309 = 505735863204590788826844566710248820889293423015990941802697910043015746847490696576778077974888711205747801311440894826784455252260725874759864653543215169768327763448404578493275577295001530267835621586470586984202195040001880110950669206857194777458189758726123605525125155597430541675421853198704552443904 := by
      have step := pow_mod_double_add_one (k := 4514) (e := 308) (m := 10 ^ 309) h308
      have he : 2 * 308 + 1 = 617 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1235 : (4514 : ℕ) ^ 1235 % 10 ^ 309 = 527492780646319495923504065557172306308288074229920173649546522821750274950470191229763614228091388336520147590877392857433110676499948892238759958538625049868495464062211938131680244798472527088125151303748198447555397571324200577695029479684081617694868953422679757183156621558311696234525064677187360129024 := by
      have step := pow_mod_double_add_one (k := 4514) (e := 617) (m := 10 ^ 309) h617
      have he : 2 * 617 + 1 = 1235 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1235
  rw [hmod]
  decide
private theorem cert_4514 : ExponentCertificate 4514 1235 1235 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4514) (by decide) (by decide) (by decide) suffix_4514
private theorem cert_4515 : ExponentCertificate 4515 1236 1235 := by decide
private theorem cert_4516 : ExponentCertificate 4516 1236 1235 := by decide
private theorem cert_4517 : ExponentCertificate 4517 1236 1235 := by decide
private theorem cert_4518 : ExponentCertificate 4518 1236 1236 := by decide
private theorem cert_4519 : ExponentCertificate 4519 1237 1236 := by decide
private theorem cert_4520 : ExponentCertificate 4520 1237 1236 := by decide
private theorem cert_4521 : ExponentCertificate 4521 1237 1236 := by decide
private theorem suffix_4522 : 1237 < digitSum ((4522 : ℕ) ^ 1237 % 10 ^ 310) := by
  have hmod : (4522 : ℕ) ^ 1237 % 10 ^ 310 = 5758628188650818557407770957023696854260412990840410466788187883092313328451551485202827895089900894302907262430566745229261946937917805882309514542453842235696826403027091369694791565713729237460240098297329325615754699215892716034606054938555328100275774192174004768715310599584831268887813475526398351245312 := by
    have h1 : (4522 : ℕ) ^ 1 % 10 ^ 310 = 4522 := by decide
    have h2 : (4522 : ℕ) ^ 2 % 10 ^ 310 = 20448484 := by
      have step := pow_mod_double (k := 4522) (e := 1) (m := 10 ^ 310) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4522 : ℕ) ^ 4 % 10 ^ 310 = 418140497898256 := by
      have step := pow_mod_double (k := 4522) (e := 2) (m := 10 ^ 310) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (4522 : ℕ) ^ 9 % 10 ^ 310 = 790633154393323668057748499425792 := by
      have step := pow_mod_double_add_one (k := 4522) (e := 4) (m := 10 ^ 310) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h19 : (4522 : ℕ) ^ 19 % 10 ^ 310 = 2826705748982887930643341271686185945314667119847065084668698448887808 := by
      have step := pow_mod_double_add_one (k := 4522) (e := 9) (m := 10 ^ 310) h9
      have he : 2 * 9 + 1 = 19 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h38 : (4522 : ℕ) ^ 38 % 10 ^ 310 = 7990265391332909431344784905406292569671860251382259157530320628786309359349219580273940805702065541364499867173103195736704368232171044864 := by
      have step := pow_mod_double (k := 4522) (e := 19) (m := 10 ^ 310) h19
      have he : 2 * 19 = 38 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h77 : (4522 : ℕ) ^ 77 % 10 ^ 310 = 288704110110222549284023612014277196605719841643500416423240926138562884181347108902894169090764250479651543663630816862207503778348273292686759295083322797770871338276802139312109195455514927977893790411646444590988862451977654198666662312482656696022504949241083269086066520358912 := by
      have step := pow_mod_double_add_one (k := 4522) (e := 38) (m := 10 ^ 310) h38
      have he : 2 * 38 + 1 = 77 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h154 : (4522 : ℕ) ^ 154 % 10 ^ 310 = 4502707898911367637979236854995086155546951229637616886239542185575853491055294189348052436025190657877838888015922396053663664322118930068652045304822227291195769776148579075846233787136830123205943674772866594476760987799057825921717293950533894984422897950034563577950085298309677546562413347013781297823744 := by
      have step := pow_mod_double (k := 4522) (e := 77) (m := 10 ^ 310) h77
      have he : 2 * 77 = 154 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h309 : (4522 : ℕ) ^ 309 % 10 ^ 310 = 6038586247815926613258276029624678980039471426962987574877190708436750301898541859759774654918717318258409651885561203729272549521755725679840142084157849128184779806496167810008140745855257559691313553641005986440103111179644707762915016009210569177463101734189661257677643346689016254976817230081636582817792 := by
      have step := pow_mod_double_add_one (k := 4522) (e := 154) (m := 10 ^ 310) h154
      have he : 2 * 154 + 1 = 309 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h618 : (4522 : ℕ) ^ 618 % 10 ^ 310 = 7986010344336413797144569560429094748203900045311953228662616563432684451542406815316408093872377595680681537584488515542523458842639757500406912013647332482344754903220593532989716144193985852535640659923798462586668523116085223647841618652931765461536399692614023579964373376558178482883966486212002671755264 := by
      have step := pow_mod_double (k := 4522) (e := 309) (m := 10 ^ 310) h309
      have he : 2 * 309 = 618 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1237 : (4522 : ℕ) ^ 1237 % 10 ^ 310 = 5758628188650818557407770957023696854260412990840410466788187883092313328451551485202827895089900894302907262430566745229261946937917805882309514542453842235696826403027091369694791565713729237460240098297329325615754699215892716034606054938555328100275774192174004768715310599584831268887813475526398351245312 := by
      have step := pow_mod_double_add_one (k := 4522) (e := 618) (m := 10 ^ 310) h618
      have he : 2 * 618 + 1 = 1237 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1237
  rw [hmod]
  decide
private theorem cert_4522 : ExponentCertificate 4522 1237 1237 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4522) (by decide) (by decide) (by decide) suffix_4522
private theorem cert_4523 : ExponentCertificate 4523 1238 1237 := by decide
private theorem cert_4524 : ExponentCertificate 4524 1238 1237 := by decide
private theorem cert_4525 : ExponentCertificate 4525 1238 1237 := by decide
private theorem cert_4526 : ExponentCertificate 4526 1238 1238 := by decide
private theorem cert_4527 : ExponentCertificate 4527 1239 1238 := by decide
private theorem cert_4528 : ExponentCertificate 4528 1239 1238 := by decide
private theorem cert_4529 : ExponentCertificate 4529 1239 1238 := by decide
private theorem cert_4530 : ExponentCertificate 4530 1239 1239 := by decide
private theorem cert_4531 : ExponentCertificate 4531 1239 1239 := by decide
private theorem cert_4532 : ExponentCertificate 4532 1240 1239 := by decide
private theorem cert_4533 : ExponentCertificate 4533 1240 1239 := by decide
private theorem cert_4534 : ExponentCertificate 4534 1240 1239 := by decide
private theorem cert_4535 : ExponentCertificate 4535 1240 1240 := by decide
private theorem cert_4536 : ExponentCertificate 4536 1241 1240 := by decide
private theorem cert_4537 : ExponentCertificate 4537 1241 1240 := by decide
private theorem cert_4538 : ExponentCertificate 4538 1241 1240 := by decide
private theorem cert_4539 : ExponentCertificate 4539 1241 1241 := by decide
private theorem cert_4540 : ExponentCertificate 4540 1242 1241 := by decide
private theorem cert_4541 : ExponentCertificate 4541 1242 1241 := by decide
private theorem cert_4542 : ExponentCertificate 4542 1242 1241 := by decide
private theorem cert_4543 : ExponentCertificate 4543 1242 1242 := by decide
private theorem cert_4544 : ExponentCertificate 4544 1243 1242 := by decide
private theorem cert_4545 : ExponentCertificate 4545 1243 1242 := by decide
private theorem cert_4546 : ExponentCertificate 4546 1243 1242 := by decide
private theorem cert_4547 : ExponentCertificate 4547 1243 1243 := by decide
private theorem cert_4548 : ExponentCertificate 4548 1244 1243 := by decide
private theorem cert_4549 : ExponentCertificate 4549 1244 1243 := by decide
private theorem cert_4550 : ExponentCertificate 4550 1244 1243 := by decide
private theorem cert_4551 : ExponentCertificate 4551 1244 1244 := by decide
private theorem cert_4552 : ExponentCertificate 4552 1245 1244 := by decide
private theorem cert_4553 : ExponentCertificate 4553 1245 1244 := by decide
private theorem cert_4554 : ExponentCertificate 4554 1245 1244 := by decide
private theorem cert_4555 : ExponentCertificate 4555 1245 1245 := by decide
private theorem cert_4556 : ExponentCertificate 4556 1246 1245 := by decide
private theorem cert_4557 : ExponentCertificate 4557 1246 1245 := by decide
private theorem cert_4558 : ExponentCertificate 4558 1246 1245 := by decide
private theorem suffix_4559 : 1246 < digitSum ((4559 : ℕ) ^ 1246 % 10 ^ 312) := by
  have hmod : (4559 : ℕ) ^ 1246 % 10 ^ 312 = 513346303939841833315283744846249719207523844581134779526139264413748947604553443108016711272176356455281465927071694977004253706757686175563614418437162496936493246009845039778882013643823465060287458310621348950891547093067228006547973087365654189448350904506260355002005590558121690001855737784400557017774241 := by
    have h1 : (4559 : ℕ) ^ 1 % 10 ^ 312 = 4559 := by decide
    have h2 : (4559 : ℕ) ^ 2 % 10 ^ 312 = 20784481 := by
      have step := pow_mod_double (k := 4559) (e := 1) (m := 10 ^ 312) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4559 : ℕ) ^ 4 % 10 ^ 312 = 431994650439361 := by
      have step := pow_mod_double (k := 4559) (e := 2) (m := 10 ^ 312) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (4559 : ℕ) ^ 9 % 10 ^ 312 = 850797744339500980115311344655439 := by
      have step := pow_mod_double_add_one (k := 4559) (e := 4) (m := 10 ^ 312) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h19 : (4559 : ℕ) ^ 19 % 10 ^ 312 = 3300063159283940713680747979498271989287257534800218922918693576925039 := by
      have step := pow_mod_double_add_one (k := 4559) (e := 9) (m := 10 ^ 312) h9
      have he : 2 * 9 + 1 = 19 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h38 : (4559 : ℕ) ^ 38 % 10 ^ 312 = 10890416855263103858196629718297401894824557790882010058456371208143582496189349202065385920760159696280548064382207455059238550554625151521 := by
      have step := pow_mod_double (k := 4559) (e := 19) (m := 10 ^ 312) h19
      have he : 2 * 19 = 38 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h77 : (4559 : ℕ) ^ 77 % 10 ^ 312 = 540702776343896729872218118800945923185341835837391844307360249518502221313074822993144520645159544290650582495903719649316382893282795980667221090061925528616469741901311494083242491982575380459276262993283999245187347129429938528987650128079224554400053825405561038796779068677519 := by
      have step := pow_mod_double_add_one (k := 4559) (e := 38) (m := 10 ^ 312) h38
      have he : 2 * 38 + 1 = 77 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h155 : (4559 : ℕ) ^ 155 % 10 ^ 312 = 146579124716898318789851563567778935260615956384691707556114248328554320649287988808086474666381537414477939354595393185921033350579714660073831008634155997320863552509602922398039393118235471970291938517317077160347934764449723975903789631028321777385839614927447436402674300162783583512949694880229285322850799 := by
      have step := pow_mod_double_add_one (k := 4559) (e := 77) (m := 10 ^ 312) h77
      have he : 2 * 77 + 1 = 155 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h311 : (4559 : ℕ) ^ 311 % 10 ^ 312 = 161473191300593808003898731447026078290172654966031687536655115257684903499282032768604342473358126007025320808169069856718238414492188449558347648501837495034418075657250672620389920711600156803536486240473452777824071543873333702208692619600048124108387371819985757606473455015701827358492547157981903704170159 := by
      have step := pow_mod_double_add_one (k := 4559) (e := 155) (m := 10 ^ 312) h155
      have he : 2 * 155 + 1 = 311 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h623 : (4559 : ℕ) ^ 623 % 10 ^ 312 = 852795580827927777486542112498487138823222363799039414066812421966871584118169522222280723885549688221228459494389900183420305918380037495219028274249299404122988005623796503399504573024480430941977639884625576217995278724237305554767366214799469703592418412921868819798967279131165727611990224345575960122796079 := by
      have step := pow_mod_double_add_one (k := 4559) (e := 311) (m := 10 ^ 312) h311
      have he : 2 * 311 + 1 = 623 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1246 : (4559 : ℕ) ^ 1246 % 10 ^ 312 = 513346303939841833315283744846249719207523844581134779526139264413748947604553443108016711272176356455281465927071694977004253706757686175563614418437162496936493246009845039778882013643823465060287458310621348950891547093067228006547973087365654189448350904506260355002005590558121690001855737784400557017774241 := by
      have step := pow_mod_double (k := 4559) (e := 623) (m := 10 ^ 312) h623
      have he : 2 * 623 = 1246 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1246
  rw [hmod]
  decide
private theorem cert_4559 : ExponentCertificate 4559 1246 1246 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4559) (by decide) (by decide) (by decide) suffix_4559
private theorem cert_4560 : ExponentCertificate 4560 1246 1246 := by decide
private theorem cert_4561 : ExponentCertificate 4561 1247 1246 := by decide
private theorem cert_4562 : ExponentCertificate 4562 1247 1246 := by decide
private theorem cert_4563 : ExponentCertificate 4563 1247 1246 := by decide
private theorem cert_4564 : ExponentCertificate 4564 1247 1247 := by decide
private theorem cert_4565 : ExponentCertificate 4565 1248 1247 := by decide
private theorem cert_4566 : ExponentCertificate 4566 1248 1247 := by decide
private theorem cert_4567 : ExponentCertificate 4567 1248 1247 := by decide
private theorem cert_4568 : ExponentCertificate 4568 1248 1248 := by decide
private theorem cert_4569 : ExponentCertificate 4569 1249 1248 := by decide
private theorem cert_4570 : ExponentCertificate 4570 1249 1248 := by decide
private theorem cert_4571 : ExponentCertificate 4571 1249 1248 := by decide
private theorem cert_4572 : ExponentCertificate 4572 1249 1249 := by decide
private theorem cert_4573 : ExponentCertificate 4573 1250 1249 := by decide
private theorem cert_4574 : ExponentCertificate 4574 1250 1249 := by decide
private theorem cert_4575 : ExponentCertificate 4575 1250 1249 := by decide
private theorem cert_4576 : ExponentCertificate 4576 1250 1250 := by decide
private theorem cert_4577 : ExponentCertificate 4577 1251 1250 := by decide
private theorem cert_4578 : ExponentCertificate 4578 1251 1250 := by decide
private theorem cert_4579 : ExponentCertificate 4579 1251 1250 := by decide
private theorem cert_4580 : ExponentCertificate 4580 1251 1251 := by decide
private theorem cert_4581 : ExponentCertificate 4581 1252 1251 := by decide
private theorem cert_4582 : ExponentCertificate 4582 1252 1251 := by decide
private theorem cert_4583 : ExponentCertificate 4583 1252 1251 := by decide
private theorem cert_4584 : ExponentCertificate 4584 1252 1252 := by decide
private theorem cert_4585 : ExponentCertificate 4585 1253 1252 := by decide
private theorem cert_4586 : ExponentCertificate 4586 1253 1252 := by decide
private theorem cert_4587 : ExponentCertificate 4587 1253 1252 := by decide
private theorem cert_4588 : ExponentCertificate 4588 1253 1252 := by decide
private theorem cert_4589 : ExponentCertificate 4589 1253 1253 := by decide
private theorem cert_4590 : ExponentCertificate 4590 1254 1253 := by decide
private theorem cert_4591 : ExponentCertificate 4591 1254 1253 := by decide
private theorem cert_4592 : ExponentCertificate 4592 1254 1253 := by decide
private theorem cert_4593 : ExponentCertificate 4593 1254 1254 := by decide
private theorem cert_4594 : ExponentCertificate 4594 1255 1254 := by decide
private theorem cert_4595 : ExponentCertificate 4595 1255 1254 := by decide
private theorem cert_4596 : ExponentCertificate 4596 1255 1254 := by decide
private theorem cert_4597 : ExponentCertificate 4597 1255 1255 := by decide
private theorem cert_4598 : ExponentCertificate 4598 1256 1255 := by decide
private theorem cert_4599 : ExponentCertificate 4599 1256 1255 := by decide
private theorem cert_4600 : ExponentCertificate 4600 1256 1255 := by decide

private theorem certificates_4501_4600 {k : ℕ} (hlo : 4501 ≤ k) (hhi : k ≤ 4600) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1232, 1232, cert_4501⟩
  · exact ⟨1233, 1232, cert_4502⟩
  · exact ⟨1233, 1232, cert_4503⟩
  · exact ⟨1233, 1232, cert_4504⟩
  · exact ⟨1233, 1232, cert_4505⟩
  · exact ⟨1233, 1233, cert_4506⟩
  · exact ⟨1234, 1233, cert_4507⟩
  · exact ⟨1234, 1233, cert_4508⟩
  · exact ⟨1234, 1233, cert_4509⟩
  · exact ⟨1234, 1234, cert_4510⟩
  · exact ⟨1235, 1234, cert_4511⟩
  · exact ⟨1235, 1234, cert_4512⟩
  · exact ⟨1235, 1234, cert_4513⟩
  · exact ⟨1235, 1235, cert_4514⟩
  · exact ⟨1236, 1235, cert_4515⟩
  · exact ⟨1236, 1235, cert_4516⟩
  · exact ⟨1236, 1235, cert_4517⟩
  · exact ⟨1236, 1236, cert_4518⟩
  · exact ⟨1237, 1236, cert_4519⟩
  · exact ⟨1237, 1236, cert_4520⟩
  · exact ⟨1237, 1236, cert_4521⟩
  · exact ⟨1237, 1237, cert_4522⟩
  · exact ⟨1238, 1237, cert_4523⟩
  · exact ⟨1238, 1237, cert_4524⟩
  · exact ⟨1238, 1237, cert_4525⟩
  · exact ⟨1238, 1238, cert_4526⟩
  · exact ⟨1239, 1238, cert_4527⟩
  · exact ⟨1239, 1238, cert_4528⟩
  · exact ⟨1239, 1238, cert_4529⟩
  · exact ⟨1239, 1239, cert_4530⟩
  · exact ⟨1239, 1239, cert_4531⟩
  · exact ⟨1240, 1239, cert_4532⟩
  · exact ⟨1240, 1239, cert_4533⟩
  · exact ⟨1240, 1239, cert_4534⟩
  · exact ⟨1240, 1240, cert_4535⟩
  · exact ⟨1241, 1240, cert_4536⟩
  · exact ⟨1241, 1240, cert_4537⟩
  · exact ⟨1241, 1240, cert_4538⟩
  · exact ⟨1241, 1241, cert_4539⟩
  · exact ⟨1242, 1241, cert_4540⟩
  · exact ⟨1242, 1241, cert_4541⟩
  · exact ⟨1242, 1241, cert_4542⟩
  · exact ⟨1242, 1242, cert_4543⟩
  · exact ⟨1243, 1242, cert_4544⟩
  · exact ⟨1243, 1242, cert_4545⟩
  · exact ⟨1243, 1242, cert_4546⟩
  · exact ⟨1243, 1243, cert_4547⟩
  · exact ⟨1244, 1243, cert_4548⟩
  · exact ⟨1244, 1243, cert_4549⟩
  · exact ⟨1244, 1243, cert_4550⟩
  · exact ⟨1244, 1244, cert_4551⟩
  · exact ⟨1245, 1244, cert_4552⟩
  · exact ⟨1245, 1244, cert_4553⟩
  · exact ⟨1245, 1244, cert_4554⟩
  · exact ⟨1245, 1245, cert_4555⟩
  · exact ⟨1246, 1245, cert_4556⟩
  · exact ⟨1246, 1245, cert_4557⟩
  · exact ⟨1246, 1245, cert_4558⟩
  · exact ⟨1246, 1246, cert_4559⟩
  · exact ⟨1246, 1246, cert_4560⟩
  · exact ⟨1247, 1246, cert_4561⟩
  · exact ⟨1247, 1246, cert_4562⟩
  · exact ⟨1247, 1246, cert_4563⟩
  · exact ⟨1247, 1247, cert_4564⟩
  · exact ⟨1248, 1247, cert_4565⟩
  · exact ⟨1248, 1247, cert_4566⟩
  · exact ⟨1248, 1247, cert_4567⟩
  · exact ⟨1248, 1248, cert_4568⟩
  · exact ⟨1249, 1248, cert_4569⟩
  · exact ⟨1249, 1248, cert_4570⟩
  · exact ⟨1249, 1248, cert_4571⟩
  · exact ⟨1249, 1249, cert_4572⟩
  · exact ⟨1250, 1249, cert_4573⟩
  · exact ⟨1250, 1249, cert_4574⟩
  · exact ⟨1250, 1249, cert_4575⟩
  · exact ⟨1250, 1250, cert_4576⟩
  · exact ⟨1251, 1250, cert_4577⟩
  · exact ⟨1251, 1250, cert_4578⟩
  · exact ⟨1251, 1250, cert_4579⟩
  · exact ⟨1251, 1251, cert_4580⟩
  · exact ⟨1252, 1251, cert_4581⟩
  · exact ⟨1252, 1251, cert_4582⟩
  · exact ⟨1252, 1251, cert_4583⟩
  · exact ⟨1252, 1252, cert_4584⟩
  · exact ⟨1253, 1252, cert_4585⟩
  · exact ⟨1253, 1252, cert_4586⟩
  · exact ⟨1253, 1252, cert_4587⟩
  · exact ⟨1253, 1252, cert_4588⟩
  · exact ⟨1253, 1253, cert_4589⟩
  · exact ⟨1254, 1253, cert_4590⟩
  · exact ⟨1254, 1253, cert_4591⟩
  · exact ⟨1254, 1253, cert_4592⟩
  · exact ⟨1254, 1254, cert_4593⟩
  · exact ⟨1255, 1254, cert_4594⟩
  · exact ⟨1255, 1254, cert_4595⟩
  · exact ⟨1255, 1254, cert_4596⟩
  · exact ⟨1255, 1255, cert_4597⟩
  · exact ⟨1256, 1255, cert_4598⟩
  · exact ⟨1256, 1255, cert_4599⟩
  · exact ⟨1256, 1255, cert_4600⟩

theorem no_fixed_digitCount_4501_4600 {n : ℕ} (hn : a n = n)
    (hlo : 4501 ≤ digitCount n) (hhi : digitCount n ≤ 4600) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_4501_4600 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_4501_4600
end OeisA113010
