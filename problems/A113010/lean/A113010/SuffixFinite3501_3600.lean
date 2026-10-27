import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 3601
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_3501 : ExponentCertificate 3501 988 987 := by decide
private theorem cert_3502 : ExponentCertificate 3502 988 988 := by decide
private theorem cert_3503 : ExponentCertificate 3503 989 988 := by decide
private theorem cert_3504 : ExponentCertificate 3504 989 988 := by decide
private theorem cert_3505 : ExponentCertificate 3505 989 988 := by decide
private theorem cert_3506 : ExponentCertificate 3506 989 989 := by decide
private theorem cert_3507 : ExponentCertificate 3507 990 989 := by decide
private theorem cert_3508 : ExponentCertificate 3508 990 989 := by decide
private theorem cert_3509 : ExponentCertificate 3509 990 989 := by decide
private theorem suffix_3510 : 990 < digitSum ((351 : ℕ) ^ 990 % 10 ^ 248) := by
  have hmod : (351 : ℕ) ^ 990 % 10 ^ 248 = 87704021296360706307770592506487343546669652902735295531210901734111193725630870877777368925733370291243644347116807010178047736482354000330843251823077811278258618376050342429207987445454990326926620836111106421944590689944611570115033756694584001 := by
    have h1 : (351 : ℕ) ^ 1 % 10 ^ 248 = 351 := by decide
    have h3 : (351 : ℕ) ^ 3 % 10 ^ 248 = 43243551 := by
      have step := pow_mod_double_add_one (k := 351) (e := 1) (m := 10 ^ 248) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (351 : ℕ) ^ 7 % 10 ^ 248 = 656371650784449951 := by
      have step := pow_mod_double_add_one (k := 351) (e := 3) (m := 10 ^ 248) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h15 : (351 : ℕ) ^ 15 % 10 ^ 248 = 151219134127679875209554948993989742751 := by
      have step := pow_mod_double_add_one (k := 351) (e := 7) (m := 10 ^ 248) h7
      have he : 2 * 7 + 1 = 15 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h30 : (351 : ℕ) ^ 30 % 10 ^ 248 = 22867226526325236333136086358098124637659244127333314947453972590199157048001 := by
      have step := pow_mod_double (k := 351) (e := 15) (m := 10 ^ 248) h15
      have he : 2 * 15 = 30 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h61 : (351 : ℕ) ^ 61 % 10 ^ 248 = 183541427201201659604137686002490700157002265211232738191982029463054872557677770580858571597111621888930298767527586746441241354628949240346913888951696351 := by
      have step := pow_mod_double_add_one (k := 351) (e := 30) (m := 10 ^ 248) h30
      have he : 2 * 30 + 1 = 61 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h123 : (351 : ℕ) ^ 123 % 10 ^ 248 = 18057335664464523136535681556356284654434839352467273430542227662088033379192149663645512751353752883594948101671882970260261833203521866909793943845453147772544838931759389296802828318183733836190958154273399984469161079904772029127333497857035551 := by
      have step := pow_mod_double_add_one (k := 351) (e := 61) (m := 10 ^ 248) h61
      have he : 2 * 61 + 1 = 123 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h247 : (351 : ℕ) ^ 247 % 10 ^ 248 = 92858816788729651287002115916400948126926165294541793157288187816647057283616825149764687888499408599430364698941847347056308024396779973590956061811045397582217104427574616727797275019363813856974714431762621757827359661643085975843584016933633951 := by
      have step := pow_mod_double_add_one (k := 351) (e := 123) (m := 10 ^ 248) h123
      have he : 2 * 123 + 1 = 247 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h495 : (351 : ℕ) ^ 495 % 10 ^ 248 = 80398951292276994553024547768263780697754024612660304816493415255284025980770941157303885602010571509806610963253402679655402716650519244906123110492318478362187264783394503624516970493330546996125691590624338384369975454385781968643102047414510751 := by
      have step := pow_mod_double_add_one (k := 351) (e := 247) (m := 10 ^ 248) h247
      have he : 2 * 247 + 1 = 495 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h990 : (351 : ℕ) ^ 990 % 10 ^ 248 = 87704021296360706307770592506487343546669652902735295531210901734111193725630870877777368925733370291243644347116807010178047736482354000330843251823077811278258618376050342429207987445454990326926620836111106421944590689944611570115033756694584001 := by
      have step := pow_mod_double (k := 351) (e := 495) (m := 10 ^ 248) h495
      have he : 2 * 495 = 990 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h990
  rw [hmod]
  decide
private theorem cert_3510 : ExponentCertificate 3510 990 990 :=
  exponentCertificate_of_normalized_suffix (t := 1) (u := 351) (by decide) (by decide) (by decide) suffix_3510
private theorem cert_3511 : ExponentCertificate 3511 991 990 := by decide
private theorem cert_3512 : ExponentCertificate 3512 991 990 := by decide
private theorem cert_3513 : ExponentCertificate 3513 991 990 := by decide
private theorem cert_3514 : ExponentCertificate 3514 991 991 := by decide
private theorem cert_3515 : ExponentCertificate 3515 991 991 := by decide
private theorem cert_3516 : ExponentCertificate 3516 992 991 := by decide
private theorem cert_3517 : ExponentCertificate 3517 992 991 := by decide
private theorem cert_3518 : ExponentCertificate 3518 992 992 := by decide
private theorem cert_3519 : ExponentCertificate 3519 992 992 := by decide
private theorem cert_3520 : ExponentCertificate 3520 993 992 := by decide
private theorem cert_3521 : ExponentCertificate 3521 993 992 := by decide
private theorem cert_3522 : ExponentCertificate 3522 993 993 := by decide
private theorem cert_3523 : ExponentCertificate 3523 993 993 := by decide
private theorem cert_3524 : ExponentCertificate 3524 994 993 := by decide
private theorem cert_3525 : ExponentCertificate 3525 994 993 := by decide
private theorem cert_3526 : ExponentCertificate 3526 994 994 := by decide
private theorem cert_3527 : ExponentCertificate 3527 994 994 := by decide
private theorem cert_3528 : ExponentCertificate 3528 995 994 := by decide
private theorem cert_3529 : ExponentCertificate 3529 995 994 := by decide
private theorem cert_3530 : ExponentCertificate 3530 995 994 := by decide
private theorem cert_3531 : ExponentCertificate 3531 995 995 := by decide
private theorem cert_3532 : ExponentCertificate 3532 996 995 := by decide
private theorem cert_3533 : ExponentCertificate 3533 996 995 := by decide
private theorem cert_3534 : ExponentCertificate 3534 996 995 := by decide
private theorem cert_3535 : ExponentCertificate 3535 996 996 := by decide
private theorem cert_3536 : ExponentCertificate 3536 997 996 := by decide
private theorem cert_3537 : ExponentCertificate 3537 997 996 := by decide
private theorem cert_3538 : ExponentCertificate 3538 997 996 := by decide
private theorem cert_3539 : ExponentCertificate 3539 997 997 := by decide
private theorem cert_3540 : ExponentCertificate 3540 998 997 := by decide
private theorem cert_3541 : ExponentCertificate 3541 998 997 := by decide
private theorem cert_3542 : ExponentCertificate 3542 998 997 := by decide
private theorem cert_3543 : ExponentCertificate 3543 998 998 := by decide
private theorem cert_3544 : ExponentCertificate 3544 999 998 := by decide
private theorem cert_3545 : ExponentCertificate 3545 999 998 := by decide
private theorem cert_3546 : ExponentCertificate 3546 999 998 := by decide
private theorem cert_3547 : ExponentCertificate 3547 999 999 := by decide
private theorem cert_3548 : ExponentCertificate 3548 1000 999 := by decide
private theorem cert_3549 : ExponentCertificate 3549 1000 999 := by decide
private theorem cert_3550 : ExponentCertificate 3550 1000 999 := by decide
private theorem cert_3551 : ExponentCertificate 3551 1000 1000 := by decide
private theorem cert_3552 : ExponentCertificate 3552 1001 1000 := by decide
private theorem cert_3553 : ExponentCertificate 3553 1001 1000 := by decide
private theorem cert_3554 : ExponentCertificate 3554 1001 1000 := by decide
private theorem cert_3555 : ExponentCertificate 3555 1001 1001 := by decide
private theorem cert_3556 : ExponentCertificate 3556 1002 1001 := by decide
private theorem cert_3557 : ExponentCertificate 3557 1002 1001 := by decide
private theorem cert_3558 : ExponentCertificate 3558 1002 1001 := by decide
private theorem cert_3559 : ExponentCertificate 3559 1002 1002 := by decide
private theorem cert_3560 : ExponentCertificate 3560 1003 1002 := by decide
private theorem cert_3561 : ExponentCertificate 3561 1003 1002 := by decide
private theorem cert_3562 : ExponentCertificate 3562 1003 1002 := by decide
private theorem cert_3563 : ExponentCertificate 3563 1003 1003 := by decide
private theorem cert_3564 : ExponentCertificate 3564 1004 1003 := by decide
private theorem cert_3565 : ExponentCertificate 3565 1004 1003 := by decide
private theorem cert_3566 : ExponentCertificate 3566 1004 1003 := by decide
private theorem cert_3567 : ExponentCertificate 3567 1004 1004 := by decide
private theorem cert_3568 : ExponentCertificate 3568 1005 1004 := by decide
private theorem cert_3569 : ExponentCertificate 3569 1005 1004 := by decide
private theorem cert_3570 : ExponentCertificate 3570 1005 1004 := by decide
private theorem cert_3571 : ExponentCertificate 3571 1005 1005 := by decide
private theorem cert_3572 : ExponentCertificate 3572 1006 1005 := by decide
private theorem cert_3573 : ExponentCertificate 3573 1006 1005 := by decide
private theorem cert_3574 : ExponentCertificate 3574 1006 1005 := by decide
private theorem suffix_3575 : 1006 < digitSum ((3575 : ℕ) ^ 1006 % 10 ^ 252) := by
  have hmod : (3575 : ℕ) ^ 1006 % 10 ^ 252 = 873387560637786899472191278419074090607184125311267518545074358704180106048327925101380648771110496441652599374358216056567722423363776993786147143941569180003093733125736801577640481732228010522427897526108659699561886924357168027199804782867431640625 := by
    have h1 : (3575 : ℕ) ^ 1 % 10 ^ 252 = 3575 := by decide
    have h3 : (3575 : ℕ) ^ 3 % 10 ^ 252 = 45690734375 := by
      have step := pow_mod_double_add_one (k := 3575) (e := 1) (m := 10 ^ 252) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (3575 : ℕ) ^ 7 % 10 ^ 252 = 7463324467623333740234375 := by
      have step := pow_mod_double_add_one (k := 3575) (e := 3) (m := 10 ^ 252) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h15 : (3575 : ℕ) ^ 15 % 10 ^ 252 = 199131833289764796844938555953844450414180755615234375 := by
      have step := pow_mod_double_add_one (k := 3575) (e := 7) (m := 10 ^ 252) h7
      have he : 2 * 7 + 1 = 15 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h31 : (3575 : ℕ) ^ 31 % 10 ^ 252 = 141761216129900078687597408678008013062697440321324988496637467074910042563740120158399804495275020599365234375 := by
      have step := pow_mod_double_add_one (k := 3575) (e := 15) (m := 10 ^ 252) h15
      have he : 2 * 15 + 1 = 31 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h62 : (3575 : ℕ) ^ 62 % 10 ^ 252 = 20096242398628242243373015988330735291556178743727324207196269309105442171063327758647196101843027124972816293255387101778662669133278692482201321968247975283999418397543166260794424149427328529782244004309177398681640625 := by
      have step := pow_mod_double (k := 3575) (e := 31) (m := 10 ^ 252) h31
      have he : 2 * 31 = 62 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h125 : (3575 : ℕ) ^ 125 % 10 ^ 252 = 155102963083138681354234115199824636364837830462837178200594184499747437969342873010543767493763777605961359750627330067416554711398413933362252009195811574966725628308036774883044533926573672098226723767232216287526025411125374375842511653900146484375 := by
      have step := pow_mod_double_add_one (k := 3575) (e := 62) (m := 10 ^ 252) h62
      have he : 2 * 62 + 1 = 125 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h251 : (3575 : ℕ) ^ 251 % 10 ^ 252 = 373555566510342671433541706342476319325789330147995095279948466336018493850774932955244438424520928718700580877959820315066353988602661622859838854786173530809338477216090656222461708945104958316212955619556638185707608812435864820145070552825927734375 := by
      have step := pow_mod_double_add_one (k := 3575) (e := 125) (m := 10 ^ 252) h125
      have he : 2 * 125 + 1 = 251 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h503 : (3575 : ℕ) ^ 503 % 10 ^ 252 = 824701163534209355544448749522849750968777802445414938055214265454404231346123686818608179675248435518768643226895458290259279743355304438290486314428046819029220553124853519476467184012037405845380288839100899576928238587925079627893865108489990234375 := by
      have step := pow_mod_double_add_one (k := 3575) (e := 251) (m := 10 ^ 252) h251
      have he : 2 * 251 + 1 = 503 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1006 : (3575 : ℕ) ^ 1006 % 10 ^ 252 = 873387560637786899472191278419074090607184125311267518545074358704180106048327925101380648771110496441652599374358216056567722423363776993786147143941569180003093733125736801577640481732228010522427897526108659699561886924357168027199804782867431640625 := by
      have step := pow_mod_double (k := 3575) (e := 503) (m := 10 ^ 252) h503
      have he : 2 * 503 = 1006 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1006
  rw [hmod]
  decide
private theorem cert_3575 : ExponentCertificate 3575 1006 1006 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 3575) (by decide) (by decide) (by decide) suffix_3575
private theorem cert_3576 : ExponentCertificate 3576 1007 1006 := by decide
private theorem cert_3577 : ExponentCertificate 3577 1007 1006 := by decide
private theorem cert_3578 : ExponentCertificate 3578 1007 1006 := by decide
private theorem cert_3579 : ExponentCertificate 3579 1007 1007 := by decide
private theorem cert_3580 : ExponentCertificate 3580 1008 1007 := by decide
private theorem cert_3581 : ExponentCertificate 3581 1008 1007 := by decide
private theorem cert_3582 : ExponentCertificate 3582 1008 1007 := by decide
private theorem cert_3583 : ExponentCertificate 3583 1008 1008 := by decide
private theorem cert_3584 : ExponentCertificate 3584 1009 1008 := by decide
private theorem cert_3585 : ExponentCertificate 3585 1009 1008 := by decide
private theorem cert_3586 : ExponentCertificate 3586 1009 1008 := by decide
private theorem cert_3587 : ExponentCertificate 3587 1009 1009 := by decide
private theorem cert_3588 : ExponentCertificate 3588 1010 1009 := by decide
private theorem cert_3589 : ExponentCertificate 3589 1010 1009 := by decide
private theorem cert_3590 : ExponentCertificate 3590 1010 1009 := by decide
private theorem cert_3591 : ExponentCertificate 3591 1010 1010 := by decide
private theorem cert_3592 : ExponentCertificate 3592 1011 1010 := by decide
private theorem cert_3593 : ExponentCertificate 3593 1011 1010 := by decide
private theorem cert_3594 : ExponentCertificate 3594 1011 1010 := by decide
private theorem cert_3595 : ExponentCertificate 3595 1011 1011 := by decide
private theorem cert_3596 : ExponentCertificate 3596 1012 1011 := by decide
private theorem cert_3597 : ExponentCertificate 3597 1012 1011 := by decide
private theorem cert_3598 : ExponentCertificate 3598 1012 1011 := by decide
private theorem cert_3599 : ExponentCertificate 3599 1012 1012 := by decide
private theorem cert_3600 : ExponentCertificate 3600 1013 1012 := by decide

private theorem certificates_3501_3600 {k : ℕ} (hlo : 3501 ≤ k) (hhi : k ≤ 3600) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨988, 987, cert_3501⟩
  · exact ⟨988, 988, cert_3502⟩
  · exact ⟨989, 988, cert_3503⟩
  · exact ⟨989, 988, cert_3504⟩
  · exact ⟨989, 988, cert_3505⟩
  · exact ⟨989, 989, cert_3506⟩
  · exact ⟨990, 989, cert_3507⟩
  · exact ⟨990, 989, cert_3508⟩
  · exact ⟨990, 989, cert_3509⟩
  · exact ⟨990, 990, cert_3510⟩
  · exact ⟨991, 990, cert_3511⟩
  · exact ⟨991, 990, cert_3512⟩
  · exact ⟨991, 990, cert_3513⟩
  · exact ⟨991, 991, cert_3514⟩
  · exact ⟨991, 991, cert_3515⟩
  · exact ⟨992, 991, cert_3516⟩
  · exact ⟨992, 991, cert_3517⟩
  · exact ⟨992, 992, cert_3518⟩
  · exact ⟨992, 992, cert_3519⟩
  · exact ⟨993, 992, cert_3520⟩
  · exact ⟨993, 992, cert_3521⟩
  · exact ⟨993, 993, cert_3522⟩
  · exact ⟨993, 993, cert_3523⟩
  · exact ⟨994, 993, cert_3524⟩
  · exact ⟨994, 993, cert_3525⟩
  · exact ⟨994, 994, cert_3526⟩
  · exact ⟨994, 994, cert_3527⟩
  · exact ⟨995, 994, cert_3528⟩
  · exact ⟨995, 994, cert_3529⟩
  · exact ⟨995, 994, cert_3530⟩
  · exact ⟨995, 995, cert_3531⟩
  · exact ⟨996, 995, cert_3532⟩
  · exact ⟨996, 995, cert_3533⟩
  · exact ⟨996, 995, cert_3534⟩
  · exact ⟨996, 996, cert_3535⟩
  · exact ⟨997, 996, cert_3536⟩
  · exact ⟨997, 996, cert_3537⟩
  · exact ⟨997, 996, cert_3538⟩
  · exact ⟨997, 997, cert_3539⟩
  · exact ⟨998, 997, cert_3540⟩
  · exact ⟨998, 997, cert_3541⟩
  · exact ⟨998, 997, cert_3542⟩
  · exact ⟨998, 998, cert_3543⟩
  · exact ⟨999, 998, cert_3544⟩
  · exact ⟨999, 998, cert_3545⟩
  · exact ⟨999, 998, cert_3546⟩
  · exact ⟨999, 999, cert_3547⟩
  · exact ⟨1000, 999, cert_3548⟩
  · exact ⟨1000, 999, cert_3549⟩
  · exact ⟨1000, 999, cert_3550⟩
  · exact ⟨1000, 1000, cert_3551⟩
  · exact ⟨1001, 1000, cert_3552⟩
  · exact ⟨1001, 1000, cert_3553⟩
  · exact ⟨1001, 1000, cert_3554⟩
  · exact ⟨1001, 1001, cert_3555⟩
  · exact ⟨1002, 1001, cert_3556⟩
  · exact ⟨1002, 1001, cert_3557⟩
  · exact ⟨1002, 1001, cert_3558⟩
  · exact ⟨1002, 1002, cert_3559⟩
  · exact ⟨1003, 1002, cert_3560⟩
  · exact ⟨1003, 1002, cert_3561⟩
  · exact ⟨1003, 1002, cert_3562⟩
  · exact ⟨1003, 1003, cert_3563⟩
  · exact ⟨1004, 1003, cert_3564⟩
  · exact ⟨1004, 1003, cert_3565⟩
  · exact ⟨1004, 1003, cert_3566⟩
  · exact ⟨1004, 1004, cert_3567⟩
  · exact ⟨1005, 1004, cert_3568⟩
  · exact ⟨1005, 1004, cert_3569⟩
  · exact ⟨1005, 1004, cert_3570⟩
  · exact ⟨1005, 1005, cert_3571⟩
  · exact ⟨1006, 1005, cert_3572⟩
  · exact ⟨1006, 1005, cert_3573⟩
  · exact ⟨1006, 1005, cert_3574⟩
  · exact ⟨1006, 1006, cert_3575⟩
  · exact ⟨1007, 1006, cert_3576⟩
  · exact ⟨1007, 1006, cert_3577⟩
  · exact ⟨1007, 1006, cert_3578⟩
  · exact ⟨1007, 1007, cert_3579⟩
  · exact ⟨1008, 1007, cert_3580⟩
  · exact ⟨1008, 1007, cert_3581⟩
  · exact ⟨1008, 1007, cert_3582⟩
  · exact ⟨1008, 1008, cert_3583⟩
  · exact ⟨1009, 1008, cert_3584⟩
  · exact ⟨1009, 1008, cert_3585⟩
  · exact ⟨1009, 1008, cert_3586⟩
  · exact ⟨1009, 1009, cert_3587⟩
  · exact ⟨1010, 1009, cert_3588⟩
  · exact ⟨1010, 1009, cert_3589⟩
  · exact ⟨1010, 1009, cert_3590⟩
  · exact ⟨1010, 1010, cert_3591⟩
  · exact ⟨1011, 1010, cert_3592⟩
  · exact ⟨1011, 1010, cert_3593⟩
  · exact ⟨1011, 1010, cert_3594⟩
  · exact ⟨1011, 1011, cert_3595⟩
  · exact ⟨1012, 1011, cert_3596⟩
  · exact ⟨1012, 1011, cert_3597⟩
  · exact ⟨1012, 1011, cert_3598⟩
  · exact ⟨1012, 1012, cert_3599⟩
  · exact ⟨1013, 1012, cert_3600⟩

theorem no_fixed_digitCount_3501_3600 {n : ℕ} (hn : a n = n)
    (hlo : 3501 ≤ digitCount n) (hhi : digitCount n ≤ 3600) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_3501_3600 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_3501_3600
end OeisA113010
