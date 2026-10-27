import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 3501
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_3401 : ExponentCertificate 3401 963 963 := by decide
private theorem suffix_3402 : 963 < digitSum ((3402 : ℕ) ^ 963 % 10 ^ 241) := by
  have hmod : (3402 : ℕ) ^ 963 % 10 ^ 241 = 1884403651806046272558501887879426436835326438374677246662369462055601536344898378294460948716932703504864720113118026281834807709860857687410519085429630278979386959031832172619671065375578787126257888077754185116974911246551874546966724608 := by
    have h1 : (3402 : ℕ) ^ 1 % 10 ^ 241 = 3402 := by decide
    have h3 : (3402 : ℕ) ^ 3 % 10 ^ 241 = 39373400808 := by
      have step := pow_mod_double_add_one (k := 3402) (e := 1) (m := 10 ^ 241) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (3402 : ℕ) ^ 7 % 10 ^ 241 = 5274000479419586009843328 := by
      have step := pow_mod_double_add_one (k := 3402) (e := 3) (m := 10 ^ 241) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h15 : (3402 : ℕ) ^ 15 % 10 ^ 241 = 94626905755635114501037303965306324699126775005216768 := by
      have step := pow_mod_double_add_one (k := 3402) (e := 7) (m := 10 ^ 241) h7
      have he : 2 * 7 + 1 = 15 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h30 : (3402 : ℕ) ^ 30 % 10 ^ 241 = 8954251292885849960091984994558086617599019225464160806926558276322315607493413811676653375553614668365824 := by
      have step := pow_mod_double (k := 3402) (e := 15) (m := 10 ^ 241) h15
      have he : 2 * 15 = 30 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h60 : (3402 : ℕ) ^ 60 % 10 ^ 241 = 80178616216147915564128340304527691536876079410067706588723222482707218691248596259818735356360061653190090134562129619810774709261954678937510415171028277260595754249422808566201816895498289541801288746691198976 := by
      have step := pow_mod_double (k := 3402) (e := 30) (m := 10 ^ 241) h30
      have he : 2 * 30 = 60 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h120 : (3402 : ℕ) ^ 120 % 10 ^ 241 = 8596023162331005598834993374431675520932307952757012784368571356133086317459849302069529201022891541023905606238866684183756156604193232744745317944991504521994189282977432551279898671907116694286906313719563508308555372469908804216423448576 := by
      have step := pow_mod_double (k := 3402) (e := 60) (m := 10 ^ 241) h60
      have he : 2 * 60 = 120 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h240 : (3402 : ℕ) ^ 240 % 10 ^ 241 = 7078342093365971740479663319800309353474431277676126202167105611519729562959464955166213155582489448618456707711895652578033702453943642585202300941549524353131461898227430968591996821220891927524372320570024865890084346646435301528516427776 := by
      have step := pow_mod_double (k := 3402) (e := 120) (m := 10 ^ 241) h120
      have he : 2 * 120 = 240 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h481 : (3402 : ℕ) ^ 481 % 10 ^ 241 = 2518163747776277067504512970967239693097414883681542843097130089848931521417828966682151891843324849858202382890617996550860752593549928355620264361609294935073700878198692519363261576654552916559225054637399999920902553221486915210289610752 := by
      have step := pow_mod_double_add_one (k := 3402) (e := 240) (m := 10 ^ 241) h240
      have he : 2 * 240 + 1 = 481 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h963 : (3402 : ℕ) ^ 963 % 10 ^ 241 = 1884403651806046272558501887879426436835326438374677246662369462055601536344898378294460948716932703504864720113118026281834807709860857687410519085429630278979386959031832172619671065375578787126257888077754185116974911246551874546966724608 := by
      have step := pow_mod_double_add_one (k := 3402) (e := 481) (m := 10 ^ 241) h481
      have he : 2 * 481 + 1 = 963 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h963
  rw [hmod]
  decide
private theorem cert_3402 : ExponentCertificate 3402 963 963 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 3402) (by decide) (by decide) (by decide) suffix_3402
private theorem cert_3403 : ExponentCertificate 3403 964 963 := by decide
private theorem cert_3404 : ExponentCertificate 3404 964 963 := by decide
private theorem cert_3405 : ExponentCertificate 3405 964 964 := by decide
private theorem cert_3406 : ExponentCertificate 3406 964 964 := by decide
private theorem cert_3407 : ExponentCertificate 3407 965 964 := by decide
private theorem cert_3408 : ExponentCertificate 3408 965 964 := by decide
private theorem cert_3409 : ExponentCertificate 3409 965 965 := by decide
private theorem cert_3410 : ExponentCertificate 3410 965 965 := by decide
private theorem cert_3411 : ExponentCertificate 3411 966 965 := by decide
private theorem cert_3412 : ExponentCertificate 3412 966 965 := by decide
private theorem cert_3413 : ExponentCertificate 3413 966 965 := by decide
private theorem cert_3414 : ExponentCertificate 3414 966 966 := by decide
private theorem cert_3415 : ExponentCertificate 3415 967 966 := by decide
private theorem cert_3416 : ExponentCertificate 3416 967 966 := by decide
private theorem cert_3417 : ExponentCertificate 3417 967 966 := by decide
private theorem cert_3418 : ExponentCertificate 3418 967 967 := by decide
private theorem cert_3419 : ExponentCertificate 3419 968 967 := by decide
private theorem cert_3420 : ExponentCertificate 3420 968 967 := by decide
private theorem cert_3421 : ExponentCertificate 3421 968 967 := by decide
private theorem cert_3422 : ExponentCertificate 3422 968 968 := by decide
private theorem cert_3423 : ExponentCertificate 3423 969 968 := by decide
private theorem cert_3424 : ExponentCertificate 3424 969 968 := by decide
private theorem cert_3425 : ExponentCertificate 3425 969 968 := by decide
private theorem cert_3426 : ExponentCertificate 3426 969 969 := by decide
private theorem cert_3427 : ExponentCertificate 3427 970 969 := by decide
private theorem cert_3428 : ExponentCertificate 3428 970 969 := by decide
private theorem cert_3429 : ExponentCertificate 3429 970 969 := by decide
private theorem cert_3430 : ExponentCertificate 3430 970 970 := by decide
private theorem cert_3431 : ExponentCertificate 3431 971 970 := by decide
private theorem cert_3432 : ExponentCertificate 3432 971 970 := by decide
private theorem cert_3433 : ExponentCertificate 3433 971 970 := by decide
private theorem cert_3434 : ExponentCertificate 3434 971 971 := by decide
private theorem cert_3435 : ExponentCertificate 3435 972 971 := by decide
private theorem cert_3436 : ExponentCertificate 3436 972 971 := by decide
private theorem cert_3437 : ExponentCertificate 3437 972 971 := by decide
private theorem suffix_3438 : 972 < digitSum ((3438 : ℕ) ^ 972 % 10 ^ 243) := by
  have hmod : (3438 : ℕ) ^ 972 % 10 ^ 243 = 996251831213666712519017367712873761748302798342513783111942027898130232639550363618974412180486096053551669989656542135684787741834413199378926941788328674709054712457251810221653819675710795586608940125399562809799463835560104883608885395456 := by
    have h1 : (3438 : ℕ) ^ 1 % 10 ^ 243 = 3438 := by decide
    have h3 : (3438 : ℕ) ^ 3 % 10 ^ 243 = 40636623672 := by
      have step := pow_mod_double_add_one (k := 3438) (e := 1) (m := 10 ^ 243) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (3438 : ℕ) ^ 7 % 10 ^ 243 = 5677290360734623125201792 := by
      have step := pow_mod_double_add_one (k := 3438) (e := 3) (m := 10 ^ 243) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h15 : (3438 : ℕ) ^ 15 % 10 ^ 243 = 110812329638230338545663127159858854933734635398725632 := by
      have step := pow_mod_double_add_one (k := 3438) (e := 7) (m := 10 ^ 243) h7
      have he : 2 * 7 + 1 = 15 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h30 : (3438 : ℕ) ^ 30 % 10 ^ 243 = 12279372399851821912744772980125998513456193608174404082621597141719086726099122527082546080310769613799424 := by
      have step := pow_mod_double (k := 3438) (e := 15) (m := 10 ^ 243) h15
      have he : 2 * 15 = 30 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h60 : (3438 : ℕ) ^ 60 % 10 ^ 243 = 150782986534242692170168703898392487009326446676842582652648264888311136789828228995669537941777310528005492261332952757637812386730437096521837636178905777237167061103703163935545982949986467776883143844902731776 := by
      have step := pow_mod_double (k := 3438) (e := 30) (m := 10 ^ 243) h30
      have he : 2 * 30 = 60 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h121 : (3438 : ℕ) ^ 121 % 10 ^ 243 = 222085708549251188060384962669559950757931105472249675244469583623447097370465847411803461336062893673341682593794969555133576335886194816190224409620859753527692117740363069251656871398645512935225634631664427438632317482114878805961592537088 := by
      have step := pow_mod_double_add_one (k := 3438) (e := 60) (m := 10 ^ 243) h60
      have he : 2 * 60 + 1 = 121 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h243 : (3438 : ℕ) ^ 243 % 10 ^ 243 = 149854506696612315725141982357686362088943747035255251518651862626282914154634609837549088007070681988130506151430822342614493224707334235016232751034390428878532570445355289335139202144701433854493789479508975847716571370267003751421676879872 := by
      have step := pow_mod_double_add_one (k := 3438) (e := 121) (m := 10 ^ 243) h121
      have he : 2 * 121 + 1 = 243 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h486 : (3438 : ℕ) ^ 486 % 10 ^ 243 = 440645538878757069746507942799004342613230487444916496396411653688154535696055492793080645518123752974924877652667010593340571465407044314392797370226786676049129272276122017270877473478406874763063209536368805455657547729412190762585118736384 := by
      have step := pow_mod_double (k := 3438) (e := 243) (m := 10 ^ 243) h243
      have he : 2 * 243 = 486 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h972 : (3438 : ℕ) ^ 972 % 10 ^ 243 = 996251831213666712519017367712873761748302798342513783111942027898130232639550363618974412180486096053551669989656542135684787741834413199378926941788328674709054712457251810221653819675710795586608940125399562809799463835560104883608885395456 := by
      have step := pow_mod_double (k := 3438) (e := 486) (m := 10 ^ 243) h486
      have he : 2 * 486 = 972 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h972
  rw [hmod]
  decide
private theorem cert_3438 : ExponentCertificate 3438 972 972 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 3438) (by decide) (by decide) (by decide) suffix_3438
private theorem cert_3439 : ExponentCertificate 3439 973 972 := by decide
private theorem cert_3440 : ExponentCertificate 3440 973 972 := by decide
private theorem cert_3441 : ExponentCertificate 3441 973 972 := by decide
private theorem cert_3442 : ExponentCertificate 3442 973 973 := by decide
private theorem cert_3443 : ExponentCertificate 3443 974 973 := by decide
private theorem cert_3444 : ExponentCertificate 3444 974 973 := by decide
private theorem cert_3445 : ExponentCertificate 3445 974 973 := by decide
private theorem cert_3446 : ExponentCertificate 3446 974 974 := by decide
private theorem cert_3447 : ExponentCertificate 3447 975 974 := by decide
private theorem cert_3448 : ExponentCertificate 3448 975 974 := by decide
private theorem cert_3449 : ExponentCertificate 3449 975 974 := by decide
private theorem cert_3450 : ExponentCertificate 3450 975 975 := by decide
private theorem cert_3451 : ExponentCertificate 3451 976 975 := by decide
private theorem cert_3452 : ExponentCertificate 3452 976 975 := by decide
private theorem cert_3453 : ExponentCertificate 3453 976 975 := by decide
private theorem cert_3454 : ExponentCertificate 3454 976 976 := by decide
private theorem cert_3455 : ExponentCertificate 3455 977 976 := by decide
private theorem cert_3456 : ExponentCertificate 3456 977 976 := by decide
private theorem cert_3457 : ExponentCertificate 3457 977 976 := by decide
private theorem suffix_3458 : 977 < digitSum ((3458 : ℕ) ^ 977 % 10 ^ 245) := by
  have hmod : (3458 : ℕ) ^ 977 % 10 ^ 245 = 82496161882244331961922798391454416448845323241642874274861420247222446360094557787067669602541064834976578238318920538721363419767166146165156918881937378148835595990696312826855717459500525101040915002870256260166693311914008912640082389762048 := by
    have h1 : (3458 : ℕ) ^ 1 % 10 ^ 245 = 3458 := by decide
    have h3 : (3458 : ℕ) ^ 3 % 10 ^ 245 = 41349947912 := by
      have step := pow_mod_double_add_one (k := 3458) (e := 1) (m := 10 ^ 245) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (3458 : ℕ) ^ 7 % 10 ^ 245 = 5912551309060241306394752 := by
      have step := pow_mod_double_add_one (k := 3458) (e := 3) (m := 10 ^ 245) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h15 : (3458 : ℕ) ^ 15 % 10 ^ 245 = 120885673392689567017713342667469499298423447763320832 := by
      have step := pow_mod_double_add_one (k := 3458) (e := 7) (m := 10 ^ 245) h7
      have he : 2 * 7 + 1 = 15 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h30 : (3458 : ℕ) ^ 30 % 10 ^ 245 = 14613346031604014332234856743432509984062100482563377428930025676109261331810494797553813287354500565172224 := by
      have step := pow_mod_double (k := 3458) (e := 15) (m := 10 ^ 245) h15
      have he : 2 * 15 = 30 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h61 : (3458 : ℕ) ^ 61 % 10 ^ 245 = 738455492783834113135470073489964993637314905449321174072140720305521115330464486077752948360204806383822302747832734127864761750957269308511141948116213091849237711131301261852048698486541903986911730852737065156608 := by
      have step := pow_mod_double_add_one (k := 3458) (e := 30) (m := 10 ^ 245) h30
      have he : 2 * 30 + 1 = 61 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h122 : (3458 : ℕ) ^ 122 % 10 ^ 245 = 88104526353629502650358763273631144503646769551606152507568897594886694663811441199656669351823880556297067349731479444410778277980642714539599325605543266182304889768212864111507486582555764790911189657798367375423834869946715585117575566065664 := by
      have step := pow_mod_double (k := 3458) (e := 61) (m := 10 ^ 245) h61
      have he : 2 * 61 = 122 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h244 : (3458 : ℕ) ^ 244 % 10 ^ 245 = 58893702684094089720300834917550489976967895920808947747982009913038417142928501377106029383784010083684169398952575253075652099006266617246548151919404994558809542066166657276296253089147877591495255864869010596560308978498082541319935959760896 := by
      have step := pow_mod_double (k := 3458) (e := 122) (m := 10 ^ 245) h122
      have he : 2 * 122 = 244 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h488 : (3458 : ℕ) ^ 488 % 10 ^ 245 = 30883802079764756914778996492846801102078160158422072098520936931810813082343274555741028755626607578719399081735057667594137110154077434870720474825011413826678001043816180537140523843580880004637556902896153911236940896682581597664497490722816 := by
      have step := pow_mod_double (k := 3458) (e := 244) (m := 10 ^ 245) h244
      have he : 2 * 244 = 488 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h977 : (3458 : ℕ) ^ 977 % 10 ^ 245 = 82496161882244331961922798391454416448845323241642874274861420247222446360094557787067669602541064834976578238318920538721363419767166146165156918881937378148835595990696312826855717459500525101040915002870256260166693311914008912640082389762048 := by
      have step := pow_mod_double_add_one (k := 3458) (e := 488) (m := 10 ^ 245) h488
      have he : 2 * 488 + 1 = 977 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h977
  rw [hmod]
  decide
private theorem cert_3458 : ExponentCertificate 3458 977 977 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 3458) (by decide) (by decide) (by decide) suffix_3458
private theorem cert_3459 : ExponentCertificate 3459 978 977 := by decide
private theorem cert_3460 : ExponentCertificate 3460 978 977 := by decide
private theorem cert_3461 : ExponentCertificate 3461 978 977 := by decide
private theorem cert_3462 : ExponentCertificate 3462 978 978 := by decide
private theorem cert_3463 : ExponentCertificate 3463 979 978 := by decide
private theorem cert_3464 : ExponentCertificate 3464 979 978 := by decide
private theorem cert_3465 : ExponentCertificate 3465 979 978 := by decide
private theorem cert_3466 : ExponentCertificate 3466 979 979 := by decide
private theorem cert_3467 : ExponentCertificate 3467 980 979 := by decide
private theorem cert_3468 : ExponentCertificate 3468 980 979 := by decide
private theorem cert_3469 : ExponentCertificate 3469 980 979 := by decide
private theorem cert_3470 : ExponentCertificate 3470 980 980 := by decide
private theorem cert_3471 : ExponentCertificate 3471 981 980 := by decide
private theorem cert_3472 : ExponentCertificate 3472 981 980 := by decide
private theorem cert_3473 : ExponentCertificate 3473 981 980 := by decide
private theorem suffix_3474 : 981 < digitSum ((3474 : ℕ) ^ 981 % 10 ^ 246) := by
  have hmod : (3474 : ℕ) ^ 981 % 10 ^ 246 = 686670551566585020569906658876896158268397298374893348808641230444308871415572115605867218407289600149835583996030468594280887266048530195227385823497900931874364421716798343464529367954309683452680977937601547797868781742494144815857946511540224 := by
    have h1 : (3474 : ℕ) ^ 1 % 10 ^ 246 = 3474 := by decide
    have h3 : (3474 : ℕ) ^ 3 % 10 ^ 246 = 41926580424 := by
      have step := pow_mod_double_add_one (k := 3474) (e := 1) (m := 10 ^ 246) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (3474 : ℕ) ^ 7 % 10 ^ 246 = 6106729719378186428701824 := by
      have step := pow_mod_double_add_one (k := 3474) (e := 3) (m := 10 ^ 246) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h15 : (3474 : ℕ) ^ 15 % 10 ^ 246 = 129552921684874786115561444267859833380234323820314624 := by
      have step := pow_mod_double_add_one (k := 3474) (e := 7) (m := 10 ^ 246) h7
      have he : 2 * 7 + 1 = 15 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h30 : (3474 : ℕ) ^ 30 % 10 ^ 246 = 16783959517087299590095929976595930504922628160604230010806218505906131070847047395287465080195186348261376 := by
      have step := pow_mod_double (k := 3474) (e := 15) (m := 10 ^ 246) h15
      have he : 2 * 15 = 30 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h61 : (3474 : ℕ) ^ 61 % 10 ^ 246 = 978630306025436827203284875518969043998900032531014109306266413966227154029681742518149825984838605603182285357241339914282529664770748227967184494272269525553624611968593897342726777551105651429957002398738598068224 := by
      have step := pow_mod_double_add_one (k := 3474) (e := 30) (m := 10 ^ 246) h30
      have he : 2 * 30 + 1 = 61 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h122 : (3474 : ℕ) ^ 122 % 10 ^ 246 = 595249906034009024165294020972301582662907658611295053545335773855468603556818630168623461372764675990128171733349364866698794570667334151647343727433101853033565178561852832266386337143508495602677823491492514236768440833634598308688224558514176 := by
      have step := pow_mod_double (k := 3474) (e := 61) (m := 10 ^ 246) h61
      have he : 2 * 61 = 122 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h245 : (3474 : ℕ) ^ 245 % 10 ^ 246 = 614218812149055999418018403981316072942280519060675569555316046069995619339812259134785735777655549438749504243535560085722391713587083361350683203580770385098315506779004199396335872953369209090106371568981338922940229200132137967176522739482624 := by
      have step := pow_mod_double_add_one (k := 3474) (e := 122) (m := 10 ^ 246) h122
      have he : 2 * 122 + 1 = 245 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h490 : (3474 : ℕ) ^ 490 % 10 ^ 246 = 786776419830572922510569567361759579696205459938096911236039615413574001244562666563106892187449265318564751385816079701744381517124097683623911663928646303414469318990135657324639941735878186844815367071058403311755721769411925266342007197925376 := by
      have step := pow_mod_double (k := 3474) (e := 245) (m := 10 ^ 246) h245
      have he : 2 * 245 = 490 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h981 : (3474 : ℕ) ^ 981 % 10 ^ 246 = 686670551566585020569906658876896158268397298374893348808641230444308871415572115605867218407289600149835583996030468594280887266048530195227385823497900931874364421716798343464529367954309683452680977937601547797868781742494144815857946511540224 := by
      have step := pow_mod_double_add_one (k := 3474) (e := 490) (m := 10 ^ 246) h490
      have he : 2 * 490 + 1 = 981 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h981
  rw [hmod]
  decide
private theorem cert_3474 : ExponentCertificate 3474 981 981 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 3474) (by decide) (by decide) (by decide) suffix_3474
private theorem cert_3475 : ExponentCertificate 3475 982 981 := by decide
private theorem cert_3476 : ExponentCertificate 3476 982 981 := by decide
private theorem cert_3477 : ExponentCertificate 3477 982 981 := by decide
private theorem cert_3478 : ExponentCertificate 3478 982 982 := by decide
private theorem cert_3479 : ExponentCertificate 3479 983 982 := by decide
private theorem cert_3480 : ExponentCertificate 3480 983 982 := by decide
private theorem cert_3481 : ExponentCertificate 3481 983 982 := by decide
private theorem cert_3482 : ExponentCertificate 3482 983 983 := by decide
private theorem cert_3483 : ExponentCertificate 3483 984 983 := by decide
private theorem cert_3484 : ExponentCertificate 3484 984 983 := by decide
private theorem cert_3485 : ExponentCertificate 3485 984 983 := by decide
private theorem cert_3486 : ExponentCertificate 3486 984 984 := by decide
private theorem cert_3487 : ExponentCertificate 3487 985 984 := by decide
private theorem cert_3488 : ExponentCertificate 3488 985 984 := by decide
private theorem cert_3489 : ExponentCertificate 3489 985 984 := by decide
private theorem cert_3490 : ExponentCertificate 3490 985 985 := by decide
private theorem cert_3491 : ExponentCertificate 3491 986 985 := by decide
private theorem cert_3492 : ExponentCertificate 3492 986 985 := by decide
private theorem cert_3493 : ExponentCertificate 3493 986 985 := by decide
private theorem cert_3494 : ExponentCertificate 3494 986 986 := by decide
private theorem cert_3495 : ExponentCertificate 3495 987 986 := by decide
private theorem cert_3496 : ExponentCertificate 3496 987 986 := by decide
private theorem cert_3497 : ExponentCertificate 3497 987 986 := by decide
private theorem cert_3498 : ExponentCertificate 3498 987 987 := by decide
private theorem cert_3499 : ExponentCertificate 3499 988 987 := by decide
private theorem cert_3500 : ExponentCertificate 3500 988 987 := by decide

private theorem certificates_3401_3500 {k : ℕ} (hlo : 3401 ≤ k) (hhi : k ≤ 3500) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨963, 963, cert_3401⟩
  · exact ⟨963, 963, cert_3402⟩
  · exact ⟨964, 963, cert_3403⟩
  · exact ⟨964, 963, cert_3404⟩
  · exact ⟨964, 964, cert_3405⟩
  · exact ⟨964, 964, cert_3406⟩
  · exact ⟨965, 964, cert_3407⟩
  · exact ⟨965, 964, cert_3408⟩
  · exact ⟨965, 965, cert_3409⟩
  · exact ⟨965, 965, cert_3410⟩
  · exact ⟨966, 965, cert_3411⟩
  · exact ⟨966, 965, cert_3412⟩
  · exact ⟨966, 965, cert_3413⟩
  · exact ⟨966, 966, cert_3414⟩
  · exact ⟨967, 966, cert_3415⟩
  · exact ⟨967, 966, cert_3416⟩
  · exact ⟨967, 966, cert_3417⟩
  · exact ⟨967, 967, cert_3418⟩
  · exact ⟨968, 967, cert_3419⟩
  · exact ⟨968, 967, cert_3420⟩
  · exact ⟨968, 967, cert_3421⟩
  · exact ⟨968, 968, cert_3422⟩
  · exact ⟨969, 968, cert_3423⟩
  · exact ⟨969, 968, cert_3424⟩
  · exact ⟨969, 968, cert_3425⟩
  · exact ⟨969, 969, cert_3426⟩
  · exact ⟨970, 969, cert_3427⟩
  · exact ⟨970, 969, cert_3428⟩
  · exact ⟨970, 969, cert_3429⟩
  · exact ⟨970, 970, cert_3430⟩
  · exact ⟨971, 970, cert_3431⟩
  · exact ⟨971, 970, cert_3432⟩
  · exact ⟨971, 970, cert_3433⟩
  · exact ⟨971, 971, cert_3434⟩
  · exact ⟨972, 971, cert_3435⟩
  · exact ⟨972, 971, cert_3436⟩
  · exact ⟨972, 971, cert_3437⟩
  · exact ⟨972, 972, cert_3438⟩
  · exact ⟨973, 972, cert_3439⟩
  · exact ⟨973, 972, cert_3440⟩
  · exact ⟨973, 972, cert_3441⟩
  · exact ⟨973, 973, cert_3442⟩
  · exact ⟨974, 973, cert_3443⟩
  · exact ⟨974, 973, cert_3444⟩
  · exact ⟨974, 973, cert_3445⟩
  · exact ⟨974, 974, cert_3446⟩
  · exact ⟨975, 974, cert_3447⟩
  · exact ⟨975, 974, cert_3448⟩
  · exact ⟨975, 974, cert_3449⟩
  · exact ⟨975, 975, cert_3450⟩
  · exact ⟨976, 975, cert_3451⟩
  · exact ⟨976, 975, cert_3452⟩
  · exact ⟨976, 975, cert_3453⟩
  · exact ⟨976, 976, cert_3454⟩
  · exact ⟨977, 976, cert_3455⟩
  · exact ⟨977, 976, cert_3456⟩
  · exact ⟨977, 976, cert_3457⟩
  · exact ⟨977, 977, cert_3458⟩
  · exact ⟨978, 977, cert_3459⟩
  · exact ⟨978, 977, cert_3460⟩
  · exact ⟨978, 977, cert_3461⟩
  · exact ⟨978, 978, cert_3462⟩
  · exact ⟨979, 978, cert_3463⟩
  · exact ⟨979, 978, cert_3464⟩
  · exact ⟨979, 978, cert_3465⟩
  · exact ⟨979, 979, cert_3466⟩
  · exact ⟨980, 979, cert_3467⟩
  · exact ⟨980, 979, cert_3468⟩
  · exact ⟨980, 979, cert_3469⟩
  · exact ⟨980, 980, cert_3470⟩
  · exact ⟨981, 980, cert_3471⟩
  · exact ⟨981, 980, cert_3472⟩
  · exact ⟨981, 980, cert_3473⟩
  · exact ⟨981, 981, cert_3474⟩
  · exact ⟨982, 981, cert_3475⟩
  · exact ⟨982, 981, cert_3476⟩
  · exact ⟨982, 981, cert_3477⟩
  · exact ⟨982, 982, cert_3478⟩
  · exact ⟨983, 982, cert_3479⟩
  · exact ⟨983, 982, cert_3480⟩
  · exact ⟨983, 982, cert_3481⟩
  · exact ⟨983, 983, cert_3482⟩
  · exact ⟨984, 983, cert_3483⟩
  · exact ⟨984, 983, cert_3484⟩
  · exact ⟨984, 983, cert_3485⟩
  · exact ⟨984, 984, cert_3486⟩
  · exact ⟨985, 984, cert_3487⟩
  · exact ⟨985, 984, cert_3488⟩
  · exact ⟨985, 984, cert_3489⟩
  · exact ⟨985, 985, cert_3490⟩
  · exact ⟨986, 985, cert_3491⟩
  · exact ⟨986, 985, cert_3492⟩
  · exact ⟨986, 985, cert_3493⟩
  · exact ⟨986, 986, cert_3494⟩
  · exact ⟨987, 986, cert_3495⟩
  · exact ⟨987, 986, cert_3496⟩
  · exact ⟨987, 986, cert_3497⟩
  · exact ⟨987, 987, cert_3498⟩
  · exact ⟨988, 987, cert_3499⟩
  · exact ⟨988, 987, cert_3500⟩

theorem no_fixed_digitCount_3401_3500 {n : ℕ} (hn : a n = n)
    (hlo : 3401 ≤ digitCount n) (hhi : digitCount n ≤ 3500) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_3401_3500 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_3401_3500
end OeisA113010
