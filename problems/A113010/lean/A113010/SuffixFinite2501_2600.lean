import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2601
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_2501 : ExponentCertificate 2501 736 735 := by decide
private theorem cert_2502 : ExponentCertificate 2502 736 736 := by decide
private theorem cert_2503 : ExponentCertificate 2503 737 736 := by decide
private theorem cert_2504 : ExponentCertificate 2504 737 736 := by decide
private theorem cert_2505 : ExponentCertificate 2505 737 737 := by decide
private theorem cert_2506 : ExponentCertificate 2506 737 737 := by decide
private theorem cert_2507 : ExponentCertificate 2507 738 737 := by decide
private theorem cert_2508 : ExponentCertificate 2508 738 737 := by decide
private theorem cert_2509 : ExponentCertificate 2509 738 738 := by decide
private theorem cert_2510 : ExponentCertificate 2510 739 738 := by decide
private theorem cert_2511 : ExponentCertificate 2511 739 738 := by decide
private theorem cert_2512 : ExponentCertificate 2512 739 738 := by decide
private theorem cert_2513 : ExponentCertificate 2513 739 739 := by decide
private theorem cert_2514 : ExponentCertificate 2514 740 739 := by decide
private theorem cert_2515 : ExponentCertificate 2515 740 739 := by decide
private theorem cert_2516 : ExponentCertificate 2516 740 739 := by decide
private theorem cert_2517 : ExponentCertificate 2517 740 740 := by decide
private theorem cert_2518 : ExponentCertificate 2518 741 740 := by decide
private theorem cert_2519 : ExponentCertificate 2519 741 740 := by decide
private theorem cert_2520 : ExponentCertificate 2520 741 740 := by decide
private theorem cert_2521 : ExponentCertificate 2521 741 741 := by decide
private theorem cert_2522 : ExponentCertificate 2522 742 741 := by decide
private theorem cert_2523 : ExponentCertificate 2523 742 741 := by decide
private theorem cert_2524 : ExponentCertificate 2524 742 741 := by decide
private theorem suffix_2525 : 742 < digitSum ((2525 : ℕ) ^ 742 % 10 ^ 186) := by
  have hmod : (2525 : ℕ) ^ 742 % 10 ^ 186 = 751044979451262757033427466737928871221159119241069567083825959245978773405025137037193271840157530656834456169768406308629792198679237287206275110185149657127112732268869876861572265625 := by
    have h1 : (2525 : ℕ) ^ 1 % 10 ^ 186 = 2525 := by decide
    have h2 : (2525 : ℕ) ^ 2 % 10 ^ 186 = 6375625 := by
      have step := pow_mod_double (k := 2525) (e := 1) (m := 10 ^ 186) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2525 : ℕ) ^ 5 % 10 ^ 186 = 102637700205078125 := by
      have step := pow_mod_double_add_one (k := 2525) (e := 2) (m := 10 ^ 186) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (2525 : ℕ) ^ 11 % 10 ^ 186 = 26599606196053422811272144317626953125 := by
      have step := pow_mod_double_add_one (k := 2525) (e := 5) (m := 10 ^ 186) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h23 : (2525 : ℕ) ^ 23 % 10 ^ 186 = 1786536100707437195796104662940277929873436207373060824465937912464141845703125 := by
      have step := pow_mod_double_add_one (k := 2525) (e := 11) (m := 10 ^ 186) h11
      have he : 2 * 11 + 1 = 23 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h46 : (2525 : ℕ) ^ 46 % 10 ^ 186 = 3191711239130934178045485825438133456491888407853513023899221393106459314675498279258151342747385724489005341428606889186969652882908121682703495025634765625 := by
      have step := pow_mod_double (k := 2525) (e := 23) (m := 10 ^ 186) h23
      have he : 2 * 23 = 46 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h92 : (2525 : ℕ) ^ 92 % 10 ^ 186 = 709394771691271859635856059900050576429730418425545644778792477335287474169044468902806969199550092168890018644331059719895673134049195641083669118531762620705194422043859958648681640625 := by
      have step := pow_mod_double (k := 2525) (e := 46) (m := 10 ^ 186) h46
      have he : 2 * 46 = 92 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h185 : (2525 : ℕ) ^ 185 % 10 ^ 186 = 546910605751675350051492197899721916299307142578501752935876877460277048430962017293646976555802311141354745332299055961478708302891285635246904246742349897658641566522419452667236328125 := by
      have step := pow_mod_double_add_one (k := 2525) (e := 92) (m := 10 ^ 186) h92
      have he : 2 * 92 + 1 = 185 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h371 : (2525 : ℕ) ^ 371 % 10 ^ 186 = 770500905508791621018548170899459058730850382169866467714077196361553653575460158449085493028426030174137041456454575625864446145558858340850129538257551331525974092073738574981689453125 := by
      have step := pow_mod_double_add_one (k := 2525) (e := 185) (m := 10 ^ 186) h185
      have he : 2 * 185 + 1 = 371 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h742 : (2525 : ℕ) ^ 742 % 10 ^ 186 = 751044979451262757033427466737928871221159119241069567083825959245978773405025137037193271840157530656834456169768406308629792198679237287206275110185149657127112732268869876861572265625 := by
      have step := pow_mod_double (k := 2525) (e := 371) (m := 10 ^ 186) h371
      have he : 2 * 371 = 742 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h742
  rw [hmod]
  decide
private theorem cert_2525 : ExponentCertificate 2525 742 742 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2525) (by decide) (by decide) (by decide) suffix_2525
private theorem cert_2526 : ExponentCertificate 2526 743 742 := by decide
private theorem cert_2527 : ExponentCertificate 2527 743 742 := by decide
private theorem cert_2528 : ExponentCertificate 2528 743 742 := by decide
private theorem cert_2529 : ExponentCertificate 2529 743 743 := by decide
private theorem cert_2530 : ExponentCertificate 2530 744 743 := by decide
private theorem cert_2531 : ExponentCertificate 2531 744 743 := by decide
private theorem cert_2532 : ExponentCertificate 2532 744 743 := by decide
private theorem cert_2533 : ExponentCertificate 2533 744 744 := by decide
private theorem cert_2534 : ExponentCertificate 2534 745 744 := by decide
private theorem cert_2535 : ExponentCertificate 2535 745 744 := by decide
private theorem cert_2536 : ExponentCertificate 2536 745 744 := by decide
private theorem cert_2537 : ExponentCertificate 2537 745 745 := by decide
private theorem cert_2538 : ExponentCertificate 2538 746 745 := by decide
private theorem cert_2539 : ExponentCertificate 2539 746 745 := by decide
private theorem cert_2540 : ExponentCertificate 2540 746 745 := by decide
private theorem cert_2541 : ExponentCertificate 2541 746 746 := by decide
private theorem cert_2542 : ExponentCertificate 2542 747 746 := by decide
private theorem cert_2543 : ExponentCertificate 2543 747 746 := by decide
private theorem suffix_2544 : 747 < digitSum ((2544 : ℕ) ^ 747 % 10 ^ 187) := by
  have hmod : (2544 : ℕ) ^ 747 % 10 ^ 187 = 5856055283119227970431725395210755733186056661001461825727599553110150384723081181929412720894644236128957975788451457275010117653178473712552542390750441101237836805550620626929754046464 := by
    have h1 : (2544 : ℕ) ^ 1 % 10 ^ 187 = 2544 := by decide
    have h2 : (2544 : ℕ) ^ 2 % 10 ^ 187 = 6471936 := by
      have step := pow_mod_double (k := 2544) (e := 1) (m := 10 ^ 187) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2544 : ℕ) ^ 5 % 10 ^ 187 = 106557871016116224 := by
      have step := pow_mod_double_add_one (k := 2544) (e := 2) (m := 10 ^ 187) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (2544 : ℕ) ^ 11 % 10 ^ 187 = 28886051203239594620240201079790239744 := by
      have step := pow_mod_double_add_one (k := 2544) (e := 5) (m := 10 ^ 187) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h23 : (2544 : ℕ) ^ 23 % 10 ^ 187 = 2122723659271560984178154499942299632517625868951157291473867711654312840003584 := by
      have step := pow_mod_double_add_one (k := 2544) (e := 11) (m := 10 ^ 187) h11
      have he : 2 * 11 + 1 = 23 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h46 : (2544 : ℕ) ^ 46 % 10 ^ 187 = 4505955733631246133026331824097475008272797021774450792482390675700155363237621499729554026262685272393715102306497849098969752430828456346003714437132845056 := by
      have step := pow_mod_double (k := 2544) (e := 23) (m := 10 ^ 187) h23
      have he : 2 * 23 = 46 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h93 : (2544 : ℕ) ^ 93 % 10 ^ 187 = 5067143093149236319557220243936286598994058799678881761851430309252000736029375484511018096276904891585612626438403246798251228314130348660498978560657876003895220368349295451386868137984 := by
      have step := pow_mod_double_add_one (k := 2544) (e := 46) (m := 10 ^ 187) h46
      have he : 2 * 46 + 1 = 93 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h186 : (2544 : ℕ) ^ 186 % 10 ^ 187 = 7693192885629694689976102522046629475958757743788713535034600797588659200135748659530283929077879783334803385879381923685172212682021842438670709874496517970578478842969977755207263584256 := by
      have step := pow_mod_double (k := 2544) (e := 93) (m := 10 ^ 187) h93
      have he : 2 * 93 = 186 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h373 : (2544 : ℕ) ^ 373 % 10 ^ 187 = 8313458010545859117572574921006855988520284057316624374799984547071469936637104606389882048419342099624266875465576778391617297016774458451486356147552035039393456492934129030364171075584 := by
      have step := pow_mod_double_add_one (k := 2544) (e := 186) (m := 10 ^ 187) h186
      have he : 2 * 186 + 1 = 373 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h747 : (2544 : ℕ) ^ 747 % 10 ^ 187 = 5856055283119227970431725395210755733186056661001461825727599553110150384723081181929412720894644236128957975788451457275010117653178473712552542390750441101237836805550620626929754046464 := by
      have step := pow_mod_double_add_one (k := 2544) (e := 373) (m := 10 ^ 187) h373
      have he : 2 * 373 + 1 = 747 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h747
  rw [hmod]
  decide
private theorem cert_2544 : ExponentCertificate 2544 747 747 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2544) (by decide) (by decide) (by decide) suffix_2544
private theorem cert_2545 : ExponentCertificate 2545 747 747 := by decide
private theorem cert_2546 : ExponentCertificate 2546 748 747 := by decide
private theorem cert_2547 : ExponentCertificate 2547 748 747 := by decide
private theorem suffix_2548 : 748 < digitSum ((2548 : ℕ) ^ 748 % 10 ^ 187) := by
  have hmod : (2548 : ℕ) ^ 748 % 10 ^ 187 = 776538081492679059866325730854455605972972429534730033916639267953308138007609778787214255307264639093392669006749595327538733216958566946573726627772552297639590008462088633644750995456 := by
    have h1 : (2548 : ℕ) ^ 1 % 10 ^ 187 = 2548 := by decide
    have h2 : (2548 : ℕ) ^ 2 % 10 ^ 187 = 6492304 := by
      have step := pow_mod_double (k := 2548) (e := 1) (m := 10 ^ 187) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2548 : ℕ) ^ 5 % 10 ^ 187 = 107398228610003968 := by
      have step := pow_mod_double_add_one (k := 2548) (e := 2) (m := 10 ^ 187) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (2548 : ℕ) ^ 11 % 10 ^ 187 = 29389598987827887503638850390198321152 := by
      have step := pow_mod_double_add_one (k := 2548) (e := 5) (m := 10 ^ 187) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h23 : (2548 : ℕ) ^ 23 % 10 ^ 187 = 2200831251039271005618706228954481039595206765503201750413527305630614386900992 := by
      have step := pow_mod_double_add_one (k := 2548) (e := 11) (m := 10 ^ 187) h11
      have he : 2 * 11 + 1 = 23 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h46 : (2548 : ℕ) ^ 46 % 10 ^ 187 = 4843658195551082713849232729625070313060601415755922143786178366136245194929552906190974601889527481257932044864196505851388063488463552139634030553610584064 := by
      have step := pow_mod_double (k := 2548) (e := 23) (m := 10 ^ 187) h23
      have he : 2 * 23 = 46 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h93 : (2548 : ℕ) ^ 93 % 10 ^ 187 = 6597484058952831734338664463833668035501142917064144456730169003921028195055205841137070600832821551361968875540184659092809982783066455988016789820660678026670712698420551336821006532608 := by
      have step := pow_mod_double_add_one (k := 2548) (e := 46) (m := 10 ^ 187) h46
      have he : 2 * 46 + 1 = 93 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h187 : (2548 : ℕ) ^ 187 % 10 ^ 187 = 7048374406188581203705291489756849197240138884938490509912502580820228063250798317276873890611197114017638751167131276447684129536898889504257586893625803252526262147729350255944633679872 := by
      have step := pow_mod_double_add_one (k := 2548) (e := 93) (m := 10 ^ 187) h93
      have he : 2 * 93 + 1 = 187 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h374 : (2548 : ℕ) ^ 374 % 10 ^ 187 = 3599168448138314493037963003868187633515127718530340426418992660779680669574470390133226001930801475075908724209549113332966744566755126385846885766045750330401466852795923868516177936384 := by
      have step := pow_mod_double (k := 2548) (e := 187) (m := 10 ^ 187) h187
      have he : 2 * 187 = 374 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h748 : (2548 : ℕ) ^ 748 % 10 ^ 187 = 776538081492679059866325730854455605972972429534730033916639267953308138007609778787214255307264639093392669006749595327538733216958566946573726627772552297639590008462088633644750995456 := by
      have step := pow_mod_double (k := 2548) (e := 374) (m := 10 ^ 187) h374
      have he : 2 * 374 = 748 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h748
  rw [hmod]
  decide
private theorem cert_2548 : ExponentCertificate 2548 748 748 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2548) (by decide) (by decide) (by decide) suffix_2548
private theorem cert_2549 : ExponentCertificate 2549 749 748 := by decide
private theorem cert_2550 : ExponentCertificate 2550 749 748 := by decide
private theorem cert_2551 : ExponentCertificate 2551 749 748 := by decide
private theorem suffix_2552 : 749 < digitSum ((2552 : ℕ) ^ 749 % 10 ^ 188) := by
  have hmod : (2552 : ℕ) ^ 749 % 10 ^ 188 = 57910446497922663164474779476899279988518708446533979126484949980623518054441365732897849665023351149928498194003526603593002610924422567424999388617110458437217819158483763631638039232512 := by
    have h1 : (2552 : ℕ) ^ 1 % 10 ^ 188 = 2552 := by decide
    have h2 : (2552 : ℕ) ^ 2 % 10 ^ 188 = 6512704 := by
      have step := pow_mod_double (k := 2552) (e := 1) (m := 10 ^ 188) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2552 : ℕ) ^ 5 % 10 ^ 188 = 108243879775404032 := by
      have step := pow_mod_double_add_one (k := 2552) (e := 2) (m := 10 ^ 188) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (2552 : ℕ) ^ 11 % 10 ^ 188 = 29901114122539575428449938884419125248 := by
      have step := pow_mod_double_add_one (k := 2552) (e := 5) (m := 10 ^ 188) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h23 : (2552 : ℕ) ^ 23 % 10 ^ 188 = 2281683548962834163006459235694892746715397220911121710532462515420528228958208 := by
      have step := pow_mod_double_add_one (k := 2552) (e := 11) (m := 10 ^ 188) h11
      have he : 2 * 11 + 1 = 23 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h46 : (2552 : ℕ) ^ 46 % 10 ^ 188 = 5206079817607634043295426137087731170197971038518399095696584408800827677329689986480846032018313730860038219980009427234824245007370514496967009509010571264 := by
      have step := pow_mod_double (k := 2552) (e := 23) (m := 10 ^ 188) h23
      have he : 2 * 23 = 46 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h93 : (2552 : ℕ) ^ 93 % 10 ^ 188 = 66654126721170424632804825596080241735784948390208792414619322674824776780330081460970507391501331150716148056375118111461509830192513740327670795156266590217693773490271287605244767240192 := by
      have step := pow_mod_double_add_one (k := 2552) (e := 46) (m := 10 ^ 188) h46
      have he : 2 * 46 + 1 = 93 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h187 : (2552 : ℕ) ^ 187 % 10 ^ 188 = 62136863366169943934093650424138591714391799856085354039548610888760982663321895371742751387923195657889827262647788806159113589225298503257429868846635623939018782861309271963377942396928 := by
      have step := pow_mod_double_add_one (k := 2552) (e := 93) (m := 10 ^ 188) h93
      have he : 2 * 93 + 1 = 187 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h374 : (2552 : ℕ) ^ 374 % 10 ^ 188 = 48330173648254276685346902984039145932537038386881055463911316047943422601385105629317378445724808877088649798257884721446531826060183390083892939971252831130658245156535914723681903837184 := by
      have step := pow_mod_double (k := 2552) (e := 187) (m := 10 ^ 188) h187
      have he : 2 * 187 = 374 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h749 : (2552 : ℕ) ^ 749 % 10 ^ 188 = 57910446497922663164474779476899279988518708446533979126484949980623518054441365732897849665023351149928498194003526603593002610924422567424999388617110458437217819158483763631638039232512 := by
      have step := pow_mod_double_add_one (k := 2552) (e := 374) (m := 10 ^ 188) h374
      have he : 2 * 374 + 1 = 749 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h749
  rw [hmod]
  decide
private theorem cert_2552 : ExponentCertificate 2552 749 749 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2552) (by decide) (by decide) (by decide) suffix_2552
private theorem cert_2553 : ExponentCertificate 2553 750 749 := by decide
private theorem cert_2554 : ExponentCertificate 2554 750 749 := by decide
private theorem cert_2555 : ExponentCertificate 2555 750 749 := by decide
private theorem cert_2556 : ExponentCertificate 2556 750 750 := by decide
private theorem cert_2557 : ExponentCertificate 2557 751 750 := by decide
private theorem cert_2558 : ExponentCertificate 2558 751 750 := by decide
private theorem cert_2559 : ExponentCertificate 2559 751 750 := by decide
private theorem suffix_2560 : 751 < digitSum ((256 : ℕ) ^ 751 % 10 ^ 188) := by
  have hmod : (256 : ℕ) ^ 751 % 10 ^ 188 = 24715587716001290876001834000895140700112948637319344803631914823290967250008996954302821862920226049092063847268494526812615807697301415690508313967287476465304209157929164966162654560256 := by
    have h1 : (256 : ℕ) ^ 1 % 10 ^ 188 = 256 := by decide
    have h2 : (256 : ℕ) ^ 2 % 10 ^ 188 = 65536 := by
      have step := pow_mod_double (k := 256) (e := 1) (m := 10 ^ 188) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (256 : ℕ) ^ 5 % 10 ^ 188 = 1099511627776 := by
      have step := pow_mod_double_add_one (k := 256) (e := 2) (m := 10 ^ 188) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (256 : ℕ) ^ 11 % 10 ^ 188 = 309485009821345068724781056 := by
      have step := pow_mod_double_add_one (k := 256) (e := 5) (m := 10 ^ 188) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h23 : (256 : ℕ) ^ 23 % 10 ^ 188 = 24519928653854221733733552434404946937899825954937634816 := by
      have step := pow_mod_double_add_one (k := 256) (e := 11) (m := 10 ^ 188) h11
      have he : 2 * 11 + 1 = 23 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h46 : (256 : ℕ) ^ 46 % 10 ^ 188 = 601226901190101306339707032778070279008174732520529886901066488712245510429339761526706943586500787976175353856 := by
      have step := pow_mod_double (k := 256) (e := 23) (m := 10 ^ 188) h23
      have he : 2 * 23 = 46 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h93 : (256 : ℕ) ^ 93 % 10 ^ 188 = 26297164983552492328825714470508751433275752444915676643171696540742381256647769999871944191701103114571826891603540250015524326325705641838924007751440909196452081155402449891024401596416 := by
      have step := pow_mod_double_add_one (k := 256) (e := 46) (m := 10 ^ 188) h46
      have he : 2 * 46 + 1 = 93 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h187 : (256 : ℕ) ^ 187 % 10 ^ 188 = 65145969328073335070647237256856867848792144622138138603615464539172545812797079707324508354668972710798956065124576690791458354281872000010940834720566180027136408649169720230232075534336 := by
      have step := pow_mod_double_add_one (k := 256) (e := 93) (m := 10 ^ 188) h93
      have he : 2 * 93 + 1 = 187 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h375 : (256 : ℕ) ^ 375 % 10 ^ 188 = 10320580417992206662247328722122088513643683907670360209162653670641130936997002170500675501374723998766005827579300723253474890612250135171889174899079911291512399773872178519018229989376 := by
      have step := pow_mod_double_add_one (k := 256) (e := 187) (m := 10 ^ 188) h187
      have he : 2 * 187 + 1 = 375 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h751 : (256 : ℕ) ^ 751 % 10 ^ 188 = 24715587716001290876001834000895140700112948637319344803631914823290967250008996954302821862920226049092063847268494526812615807697301415690508313967287476465304209157929164966162654560256 := by
      have step := pow_mod_double_add_one (k := 256) (e := 375) (m := 10 ^ 188) h375
      have he : 2 * 375 + 1 = 751 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h751
  rw [hmod]
  decide
private theorem cert_2560 : ExponentCertificate 2560 751 751 :=
  exponentCertificate_of_normalized_suffix (t := 1) (u := 256) (by decide) (by decide) (by decide) suffix_2560
private theorem cert_2561 : ExponentCertificate 2561 752 751 := by decide
private theorem cert_2562 : ExponentCertificate 2562 752 751 := by decide
private theorem cert_2563 : ExponentCertificate 2563 752 751 := by decide
private theorem cert_2564 : ExponentCertificate 2564 752 752 := by decide
private theorem cert_2565 : ExponentCertificate 2565 753 752 := by decide
private theorem cert_2566 : ExponentCertificate 2566 753 752 := by decide
private theorem cert_2567 : ExponentCertificate 2567 753 752 := by decide
private theorem cert_2568 : ExponentCertificate 2568 753 753 := by decide
private theorem cert_2569 : ExponentCertificate 2569 754 753 := by decide
private theorem cert_2570 : ExponentCertificate 2570 754 753 := by decide
private theorem cert_2571 : ExponentCertificate 2571 754 753 := by decide
private theorem suffix_2572 : 754 < digitSum ((2572 : ℕ) ^ 754 % 10 ^ 189) := by
  have hmod : (2572 : ℕ) ^ 754 % 10 ^ 189 = 793042431986586172115872212369976873024917856863693775236124830918398922569354355856611051217105260666483477601174536422631873289411972838021098406895076664122545372497470068517420499206144 := by
    have h1 : (2572 : ℕ) ^ 1 % 10 ^ 189 = 2572 := by decide
    have h2 : (2572 : ℕ) ^ 2 % 10 ^ 189 = 6615184 := by
      have step := pow_mod_double (k := 2572) (e := 1) (m := 10 ^ 189) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2572 : ℕ) ^ 5 % 10 ^ 189 = 112552415858117632 := by
      have step := pow_mod_double_add_one (k := 2572) (e := 2) (m := 10 ^ 189) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (2572 : ℕ) ^ 11 % 10 ^ 189 = 32582215123462526276677522858367254528 := by
      have step := pow_mod_double_add_one (k := 2572) (e := 5) (m := 10 ^ 189) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h23 : (2572 : ℕ) ^ 23 % 10 ^ 189 = 2730437109328289908039206173257668436979787119286475072238695962052257485160448 := by
      have step := pow_mod_double_add_one (k := 2572) (e := 11) (m := 10 ^ 189) h11
      have he : 2 * 11 + 1 = 23 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h47 : (2572 : ℕ) ^ 47 % 10 ^ 189 = 19174997670168355439739969436692456292872064823180567075493758270593202707003785430864359612960921869452335254907122667548706422115056531063877851221884758130688 := by
      have step := pow_mod_double_add_one (k := 2572) (e := 23) (m := 10 ^ 189) h23
      have he : 2 * 23 + 1 = 47 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h94 : (2572 : ℕ) ^ 94 % 10 ^ 189 = 657178684997382740892611910983155357818110867212435303845582049873798438482269137040597910110291939345079577896137331243269801363808192293782612971164737979255933975099073689914524087353344 := by
      have step := pow_mod_double (k := 2572) (e := 47) (m := 10 ^ 189) h47
      have he : 2 * 47 = 94 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h188 : (2572 : ℕ) ^ 188 % 10 ^ 189 = 597236536602007278652313397268928593321605316956799529120135733231611810091203939159585039339654907129670835589380311271632259301289772108182610165414756008390788062379481498767118707982336 := by
      have step := pow_mod_double (k := 2572) (e := 94) (m := 10 ^ 189) h94
      have he : 2 * 94 = 188 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h377 : (2572 : ℕ) ^ 377 % 10 ^ 189 = 539209604775495381479871226664570057761643141580240458394566654221888238078344000405277846898418628354706070644238303252129877544978366671541994735915973717996053067397671639298674379456512 := by
      have step := pow_mod_double_add_one (k := 2572) (e := 188) (m := 10 ^ 189) h188
      have he : 2 * 188 + 1 = 377 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h754 : (2572 : ℕ) ^ 754 % 10 ^ 189 = 793042431986586172115872212369976873024917856863693775236124830918398922569354355856611051217105260666483477601174536422631873289411972838021098406895076664122545372497470068517420499206144 := by
      have step := pow_mod_double (k := 2572) (e := 377) (m := 10 ^ 189) h377
      have he : 2 * 377 = 754 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h754
  rw [hmod]
  decide
private theorem cert_2572 : ExponentCertificate 2572 754 754 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2572) (by decide) (by decide) (by decide) suffix_2572
private theorem cert_2573 : ExponentCertificate 2573 755 754 := by decide
private theorem cert_2574 : ExponentCertificate 2574 755 754 := by decide
private theorem cert_2575 : ExponentCertificate 2575 755 754 := by decide
private theorem cert_2576 : ExponentCertificate 2576 755 755 := by decide
private theorem cert_2577 : ExponentCertificate 2577 756 755 := by decide
private theorem cert_2578 : ExponentCertificate 2578 756 755 := by decide
private theorem cert_2579 : ExponentCertificate 2579 756 755 := by decide
private theorem suffix_2580 : 756 < digitSum ((258 : ℕ) ^ 756 % 10 ^ 189) := by
  have hmod : (258 : ℕ) ^ 756 % 10 ^ 189 = 592245705226484741562142904241723341396987717363611984908310720435185826915722511018706863645531387187795479846855630538266580637266598983571170843518746197445999057154754637563618295545856 := by
    have h1 : (258 : ℕ) ^ 1 % 10 ^ 189 = 258 := by decide
    have h2 : (258 : ℕ) ^ 2 % 10 ^ 189 = 66564 := by
      have step := pow_mod_double (k := 258) (e := 1) (m := 10 ^ 189) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (258 : ℕ) ^ 5 % 10 ^ 189 = 1143137652768 := by
      have step := pow_mod_double_add_one (k := 258) (e := 2) (m := 10 ^ 189) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (258 : ℕ) ^ 11 % 10 ^ 189 = 337145032839390594819950592 := by
      have step := pow_mod_double_add_one (k := 258) (e := 5) (m := 10 ^ 189) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h23 : (258 : ℕ) ^ 23 % 10 ^ 189 = 29326027477414630752533533947806755231736625484856819712 := by
      have step := pow_mod_double_add_one (k := 258) (e := 11) (m := 10 ^ 189) h11
      have he : 2 * 11 + 1 = 23 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h47 : (258 : ℕ) ^ 47 % 10 ^ 189 = 221884099002368106252795878635847488275470549221542831170313112113117377888489562761057495891076622278596914839552 := by
      have step := pow_mod_double_add_one (k := 258) (e := 23) (m := 10 ^ 189) h23
      have he : 2 * 23 + 1 = 47 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h94 : (258 : ℕ) ^ 94 % 10 ^ 189 = 683093989524640438824337727141812550898444370464110905014431010705655047961278070927161264843707938208912251405386790478122200986903831029135673735580528916823711795577264804589389903560704 := by
      have step := pow_mod_double (k := 258) (e := 47) (m := 10 ^ 189) h47
      have he : 2 * 47 = 94 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h189 : (258 : ℕ) ^ 189 % 10 ^ 189 = 387419884142593596465460691473355661520938602298323016662746559755612604275215185339488802733613518799212673137159625464836886766661174092049396345317951485536134165749778614107715747708928 := by
      have step := pow_mod_double_add_one (k := 258) (e := 94) (m := 10 ^ 189) h94
      have he : 2 * 94 + 1 = 189 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h378 : (258 : ℕ) ^ 378 % 10 ^ 189 = 871894339791374711096730767445275202225697437668000978015701689592525217804583384428546400040627224962673009976235737313055663168631096069766001360785800000476708190104836077427681010909184 := by
      have step := pow_mod_double (k := 258) (e := 189) (m := 10 ^ 189) h189
      have he : 2 * 189 = 378 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h756 : (258 : ℕ) ^ 756 % 10 ^ 189 = 592245705226484741562142904241723341396987717363611984908310720435185826915722511018706863645531387187795479846855630538266580637266598983571170843518746197445999057154754637563618295545856 := by
      have step := pow_mod_double (k := 258) (e := 378) (m := 10 ^ 189) h378
      have he : 2 * 378 = 756 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h756
  rw [hmod]
  decide
private theorem cert_2580 : ExponentCertificate 2580 756 756 :=
  exponentCertificate_of_normalized_suffix (t := 1) (u := 258) (by decide) (by decide) (by decide) suffix_2580
private theorem cert_2581 : ExponentCertificate 2581 757 756 := by decide
private theorem cert_2582 : ExponentCertificate 2582 757 756 := by decide
private theorem cert_2583 : ExponentCertificate 2583 757 757 := by decide
private theorem suffix_2584 : 757 < digitSum ((2584 : ℕ) ^ 757 % 10 ^ 190) := by
  have hmod : (2584 : ℕ) ^ 757 % 10 ^ 190 = 3741835637399061559222483011256978736778733360813888476375871320087280918749871718476031809938461974758074985357214254346702125636955785024092736809027454263550736891539616671647138781855744 := by
    have h1 : (2584 : ℕ) ^ 1 % 10 ^ 190 = 2584 := by decide
    have h2 : (2584 : ℕ) ^ 2 % 10 ^ 190 = 6677056 := by
      have step := pow_mod_double (k := 2584) (e := 1) (m := 10 ^ 190) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2584 : ℕ) ^ 5 % 10 ^ 190 = 115202670521319424 := by
      have step := pow_mod_double_add_one (k := 2584) (e := 2) (m := 10 ^ 190) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (2584 : ℕ) ^ 11 % 10 ^ 190 = 34293957282909667587941495153763549184 := by
      have step := pow_mod_double_add_one (k := 2584) (e := 5) (m := 10 ^ 190) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h23 : (2584 : ℕ) ^ 23 % 10 ^ 190 = 3038979107819333350368065495987277805566153393987673715402548618434440178171904 := by
      have step := pow_mod_double_add_one (k := 2584) (e := 11) (m := 10 ^ 190) h11
      have he : 2 * 11 + 1 = 23 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h47 : (2584 : ℕ) ^ 47 % 10 ^ 190 = 23864258141898019161952359441594748215546000698649523012659352046700944760621142951238684904417847292348717967806499168505892125360230758948509126059216961798144 := by
      have step := pow_mod_double_add_one (k := 2584) (e := 23) (m := 10 ^ 190) h23
      have he : 2 * 23 + 1 = 47 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h94 : (2584 : ℕ) ^ 94 % 10 ^ 190 = 5790599639382017465457669718019125347778100969440628036079781264696690222087909317641860172321623243154676652336991794083326526172371370477016968725898719624445588876556288890845877801844736 := by
      have step := pow_mod_double (k := 2584) (e := 47) (m := 10 ^ 190) h47
      have he : 2 * 47 = 94 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h189 : (2584 : ℕ) ^ 189 % 10 ^ 190 = 6728612276342232207443049107433833963261257874478620328402113902825986983820458255450609505677748102873379080928578856366839460600253657152244852693113103264140854761343866201613297950654464 := by
      have step := pow_mod_double_add_one (k := 2584) (e := 94) (m := 10 ^ 190) h94
      have he : 2 * 94 + 1 = 189 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h378 : (2584 : ℕ) ^ 378 % 10 ^ 190 = 6229106140002967547302016172628419772239198736099563914392306506237263007122786042514908369346259605165692612404011079707250746794295668038878196847388275397914727614375019493359525923127296 := by
      have step := pow_mod_double (k := 2584) (e := 189) (m := 10 ^ 190) h189
      have he : 2 * 189 = 378 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h757 : (2584 : ℕ) ^ 757 % 10 ^ 190 = 3741835637399061559222483011256978736778733360813888476375871320087280918749871718476031809938461974758074985357214254346702125636955785024092736809027454263550736891539616671647138781855744 := by
      have step := pow_mod_double_add_one (k := 2584) (e := 378) (m := 10 ^ 190) h378
      have he : 2 * 378 + 1 = 757 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h757
  rw [hmod]
  decide
private theorem cert_2584 : ExponentCertificate 2584 757 757 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2584) (by decide) (by decide) (by decide) suffix_2584
private theorem cert_2585 : ExponentCertificate 2585 758 757 := by decide
private theorem cert_2586 : ExponentCertificate 2586 758 757 := by decide
private theorem cert_2587 : ExponentCertificate 2587 758 758 := by decide
private theorem cert_2588 : ExponentCertificate 2588 758 758 := by decide
private theorem cert_2589 : ExponentCertificate 2589 759 758 := by decide
private theorem cert_2590 : ExponentCertificate 2590 759 758 := by decide
private theorem cert_2591 : ExponentCertificate 2591 759 759 := by decide
private theorem cert_2592 : ExponentCertificate 2592 760 759 := by decide
private theorem cert_2593 : ExponentCertificate 2593 760 759 := by decide
private theorem cert_2594 : ExponentCertificate 2594 760 759 := by decide
private theorem cert_2595 : ExponentCertificate 2595 760 760 := by decide
private theorem cert_2596 : ExponentCertificate 2596 761 760 := by decide
private theorem cert_2597 : ExponentCertificate 2597 761 760 := by decide
private theorem cert_2598 : ExponentCertificate 2598 761 760 := by decide
private theorem cert_2599 : ExponentCertificate 2599 761 761 := by decide
private theorem cert_2600 : ExponentCertificate 2600 762 761 := by decide

private theorem certificates_2501_2600 {k : ℕ} (hlo : 2501 ≤ k) (hhi : k ≤ 2600) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨736, 735, cert_2501⟩
  · exact ⟨736, 736, cert_2502⟩
  · exact ⟨737, 736, cert_2503⟩
  · exact ⟨737, 736, cert_2504⟩
  · exact ⟨737, 737, cert_2505⟩
  · exact ⟨737, 737, cert_2506⟩
  · exact ⟨738, 737, cert_2507⟩
  · exact ⟨738, 737, cert_2508⟩
  · exact ⟨738, 738, cert_2509⟩
  · exact ⟨739, 738, cert_2510⟩
  · exact ⟨739, 738, cert_2511⟩
  · exact ⟨739, 738, cert_2512⟩
  · exact ⟨739, 739, cert_2513⟩
  · exact ⟨740, 739, cert_2514⟩
  · exact ⟨740, 739, cert_2515⟩
  · exact ⟨740, 739, cert_2516⟩
  · exact ⟨740, 740, cert_2517⟩
  · exact ⟨741, 740, cert_2518⟩
  · exact ⟨741, 740, cert_2519⟩
  · exact ⟨741, 740, cert_2520⟩
  · exact ⟨741, 741, cert_2521⟩
  · exact ⟨742, 741, cert_2522⟩
  · exact ⟨742, 741, cert_2523⟩
  · exact ⟨742, 741, cert_2524⟩
  · exact ⟨742, 742, cert_2525⟩
  · exact ⟨743, 742, cert_2526⟩
  · exact ⟨743, 742, cert_2527⟩
  · exact ⟨743, 742, cert_2528⟩
  · exact ⟨743, 743, cert_2529⟩
  · exact ⟨744, 743, cert_2530⟩
  · exact ⟨744, 743, cert_2531⟩
  · exact ⟨744, 743, cert_2532⟩
  · exact ⟨744, 744, cert_2533⟩
  · exact ⟨745, 744, cert_2534⟩
  · exact ⟨745, 744, cert_2535⟩
  · exact ⟨745, 744, cert_2536⟩
  · exact ⟨745, 745, cert_2537⟩
  · exact ⟨746, 745, cert_2538⟩
  · exact ⟨746, 745, cert_2539⟩
  · exact ⟨746, 745, cert_2540⟩
  · exact ⟨746, 746, cert_2541⟩
  · exact ⟨747, 746, cert_2542⟩
  · exact ⟨747, 746, cert_2543⟩
  · exact ⟨747, 747, cert_2544⟩
  · exact ⟨747, 747, cert_2545⟩
  · exact ⟨748, 747, cert_2546⟩
  · exact ⟨748, 747, cert_2547⟩
  · exact ⟨748, 748, cert_2548⟩
  · exact ⟨749, 748, cert_2549⟩
  · exact ⟨749, 748, cert_2550⟩
  · exact ⟨749, 748, cert_2551⟩
  · exact ⟨749, 749, cert_2552⟩
  · exact ⟨750, 749, cert_2553⟩
  · exact ⟨750, 749, cert_2554⟩
  · exact ⟨750, 749, cert_2555⟩
  · exact ⟨750, 750, cert_2556⟩
  · exact ⟨751, 750, cert_2557⟩
  · exact ⟨751, 750, cert_2558⟩
  · exact ⟨751, 750, cert_2559⟩
  · exact ⟨751, 751, cert_2560⟩
  · exact ⟨752, 751, cert_2561⟩
  · exact ⟨752, 751, cert_2562⟩
  · exact ⟨752, 751, cert_2563⟩
  · exact ⟨752, 752, cert_2564⟩
  · exact ⟨753, 752, cert_2565⟩
  · exact ⟨753, 752, cert_2566⟩
  · exact ⟨753, 752, cert_2567⟩
  · exact ⟨753, 753, cert_2568⟩
  · exact ⟨754, 753, cert_2569⟩
  · exact ⟨754, 753, cert_2570⟩
  · exact ⟨754, 753, cert_2571⟩
  · exact ⟨754, 754, cert_2572⟩
  · exact ⟨755, 754, cert_2573⟩
  · exact ⟨755, 754, cert_2574⟩
  · exact ⟨755, 754, cert_2575⟩
  · exact ⟨755, 755, cert_2576⟩
  · exact ⟨756, 755, cert_2577⟩
  · exact ⟨756, 755, cert_2578⟩
  · exact ⟨756, 755, cert_2579⟩
  · exact ⟨756, 756, cert_2580⟩
  · exact ⟨757, 756, cert_2581⟩
  · exact ⟨757, 756, cert_2582⟩
  · exact ⟨757, 757, cert_2583⟩
  · exact ⟨757, 757, cert_2584⟩
  · exact ⟨758, 757, cert_2585⟩
  · exact ⟨758, 757, cert_2586⟩
  · exact ⟨758, 758, cert_2587⟩
  · exact ⟨758, 758, cert_2588⟩
  · exact ⟨759, 758, cert_2589⟩
  · exact ⟨759, 758, cert_2590⟩
  · exact ⟨759, 759, cert_2591⟩
  · exact ⟨760, 759, cert_2592⟩
  · exact ⟨760, 759, cert_2593⟩
  · exact ⟨760, 759, cert_2594⟩
  · exact ⟨760, 760, cert_2595⟩
  · exact ⟨761, 760, cert_2596⟩
  · exact ⟨761, 760, cert_2597⟩
  · exact ⟨761, 760, cert_2598⟩
  · exact ⟨761, 761, cert_2599⟩
  · exact ⟨762, 761, cert_2600⟩

theorem no_fixed_digitCount_2501_2600 {n : ℕ} (hn : a n = n)
    (hlo : 2501 ≤ digitCount n) (hhi : digitCount n ≤ 2600) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_2501_2600 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_2501_2600
end OeisA113010
