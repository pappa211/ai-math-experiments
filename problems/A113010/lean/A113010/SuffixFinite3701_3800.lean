import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 3801
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_3701 : ExponentCertificate 3701 1037 1037 := by decide
private theorem cert_3702 : ExponentCertificate 3702 1038 1037 := by decide
private theorem cert_3703 : ExponentCertificate 3703 1038 1037 := by decide
private theorem cert_3704 : ExponentCertificate 3704 1038 1037 := by decide
private theorem cert_3705 : ExponentCertificate 3705 1038 1038 := by decide
private theorem cert_3706 : ExponentCertificate 3706 1039 1038 := by decide
private theorem cert_3707 : ExponentCertificate 3707 1039 1038 := by decide
private theorem cert_3708 : ExponentCertificate 3708 1039 1038 := by decide
private theorem cert_3709 : ExponentCertificate 3709 1039 1039 := by decide
private theorem cert_3710 : ExponentCertificate 3710 1040 1039 := by decide
private theorem cert_3711 : ExponentCertificate 3711 1040 1039 := by decide
private theorem cert_3712 : ExponentCertificate 3712 1040 1039 := by decide
private theorem cert_3713 : ExponentCertificate 3713 1040 1040 := by decide
private theorem cert_3714 : ExponentCertificate 3714 1041 1040 := by decide
private theorem cert_3715 : ExponentCertificate 3715 1041 1040 := by decide
private theorem cert_3716 : ExponentCertificate 3716 1041 1040 := by decide
private theorem cert_3717 : ExponentCertificate 3717 1041 1041 := by decide
private theorem cert_3718 : ExponentCertificate 3718 1042 1041 := by decide
private theorem cert_3719 : ExponentCertificate 3719 1042 1041 := by decide
private theorem cert_3720 : ExponentCertificate 3720 1042 1041 := by decide
private theorem cert_3721 : ExponentCertificate 3721 1042 1042 := by decide
private theorem cert_3722 : ExponentCertificate 3722 1043 1042 := by decide
private theorem cert_3723 : ExponentCertificate 3723 1043 1042 := by decide
private theorem cert_3724 : ExponentCertificate 3724 1043 1042 := by decide
private theorem suffix_3725 : 1043 < digitSum ((3725 : ℕ) ^ 1043 % 10 ^ 261) := by
  have hmod : (3725 : ℕ) ^ 1043 % 10 ^ 261 = 966263242611566946155682793500999261798500782269361763803154768840059182861306686843442414920694796734969222848251562978554880349331687538978910646480447441518497075202026827219020337670708391314582869198361448846758552273794595777189897489733994007110595703125 := by
    have h1 : (3725 : ℕ) ^ 1 % 10 ^ 261 = 3725 := by decide
    have h2 : (3725 : ℕ) ^ 2 % 10 ^ 261 = 13875625 := by
      have step := pow_mod_double (k := 3725) (e := 1) (m := 10 ^ 261) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (3725 : ℕ) ^ 4 % 10 ^ 261 = 192532969140625 := by
      have step := pow_mod_double (k := 3725) (e := 2) (m := 10 ^ 261) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (3725 : ℕ) ^ 8 % 10 ^ 261 = 37068944206104858551025390625 := by
      have step := pow_mod_double (k := 3725) (e := 4) (m := 10 ^ 261) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (3725 : ℕ) ^ 16 % 10 ^ 261 = 1374106624555314961990975413650684081949293613433837890625 := by
      have step := pow_mod_double (k := 3725) (e := 8) (m := 10 ^ 261) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h32 : (3725 : ℕ) ^ 32 % 10 ^ 261 = 1888169015646801311664589795248128506624575640322794059450965470389403031738206895084886127733625471591949462890625 := by
      have step := pow_mod_double (k := 3725) (e := 16) (m := 10 ^ 261) h16
      have he : 2 * 16 = 32 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h65 : (3725 : ℕ) ^ 65 % 10 ^ 261 = 13280303812891074546504313068813794089109161517126975184264570123004229655273649250046503476794173536365925559231875569592777153084543438188741140236404220010004542610953954306684056211405983889684012666521084611304104328155517578125 := by
      have step := pow_mod_double_add_one (k := 3725) (e := 32) (m := 10 ^ 261) h32
      have he : 2 * 32 + 1 = 65 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h130 : (3725 : ℕ) ^ 130 % 10 ^ 261 = 265772975165439497961055423398275878613301365223327864993043261245182944871136933012056275155442464053621603471460589419464052948377813981991380466677773534759407226521927055737544780610559016007470037235703863725636030869436954304774189949966967105865478515625 := by
      have step := pow_mod_double (k := 3725) (e := 65) (m := 10 ^ 261) h65
      have he : 2 * 65 = 130 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h260 : (3725 : ℕ) ^ 260 % 10 ^ 261 = 987960820757255839823144862974042673045608403066607441095635750963462714530694046015414958500184294403417401523199028429365348445399300340548489414074367441098404997950705148458240597583065843554257604959228949136141651778120209570488441386260092258453369140625 := by
      have step := pow_mod_double (k := 3725) (e := 130) (m := 10 ^ 261) h130
      have he : 2 * 130 = 260 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h521 : (3725 : ℕ) ^ 521 % 10 ^ 261 = 262176292445285196112456168890186746024524316672023604918959347455586939774204227876018956450755304331569258889650895904556186598772955451266508753341572281087626980357108759076459038287531265089511049668154294604190926616660295422889248584397137165069580078125 := by
      have step := pow_mod_double_add_one (k := 3725) (e := 260) (m := 10 ^ 261) h260
      have he : 2 * 260 + 1 = 521 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1043 : (3725 : ℕ) ^ 1043 % 10 ^ 261 = 966263242611566946155682793500999261798500782269361763803154768840059182861306686843442414920694796734969222848251562978554880349331687538978910646480447441518497075202026827219020337670708391314582869198361448846758552273794595777189897489733994007110595703125 := by
      have step := pow_mod_double_add_one (k := 3725) (e := 521) (m := 10 ^ 261) h521
      have he : 2 * 521 + 1 = 1043 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1043
  rw [hmod]
  decide
private theorem cert_3725 : ExponentCertificate 3725 1043 1043 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 3725) (by decide) (by decide) (by decide) suffix_3725
private theorem cert_3726 : ExponentCertificate 3726 1044 1043 := by decide
private theorem cert_3727 : ExponentCertificate 3727 1044 1043 := by decide
private theorem cert_3728 : ExponentCertificate 3728 1044 1043 := by decide
private theorem suffix_3729 : 1044 < digitSum ((3729 : ℕ) ^ 1044 % 10 ^ 261) := by
  have hmod : (3729 : ℕ) ^ 1044 % 10 ^ 261 = 239343342622613289726075118539687872005458123359231479733580436545336204293968886871126407517023218807889760011381751097443392786665150701864793121553334500524010098983690156180292489116730109436666321402733383954383852165183793164362713871634614807676257321281 := by
    have h1 : (3729 : ℕ) ^ 1 % 10 ^ 261 = 3729 := by decide
    have h2 : (3729 : ℕ) ^ 2 % 10 ^ 261 = 13905441 := by
      have step := pow_mod_double (k := 3729) (e := 1) (m := 10 ^ 261) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (3729 : ℕ) ^ 4 % 10 ^ 261 = 193361289404481 := by
      have step := pow_mod_double (k := 3729) (e := 2) (m := 10 ^ 261) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (3729 : ℕ) ^ 8 % 10 ^ 261 = 37388588240163456235622879361 := by
      have step := pow_mod_double (k := 3729) (e := 4) (m := 10 ^ 261) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (3729 : ℕ) ^ 16 % 10 ^ 261 = 1397906530592489093377955230644210631535804510368359768321 := by
      have step := pow_mod_double (k := 3729) (e := 8) (m := 10 ^ 261) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h32 : (3729 : ℕ) ^ 32 % 10 ^ 261 = 1954142668273129645524690075702227649779488589625296129033471054006780532344201188561248191575582774337500795159041 := by
      have step := pow_mod_double (k := 3729) (e := 16) (m := 10 ^ 261) h16
      have he : 2 * 16 = 32 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h65 : (3729 : ℕ) ^ 65 % 10 ^ 261 = 14239833734943822383833472090192109078072141205003832317668000722630952533509190148021237953472301641485903061178362701211177096182290017058825112318992578239772956579427061974616204046475177484007796778453873646997061365904983970449 := by
      have step := pow_mod_double_add_one (k := 3729) (e := 32) (m := 10 ^ 261) h32
      have he : 2 * 32 + 1 = 65 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h130 : (3729 : ℕ) ^ 130 % 10 ^ 261 = 191779386036910434821183964350543274975332572575146011669237479210122479609099410502346868559440295945010810151137095790093762169810224639819220004726492666815155545603954273305313709006054666242684699789678001267661270706500522502800105684995192539636505261601 := by
      have step := pow_mod_double (k := 3729) (e := 65) (m := 10 ^ 261) h65
      have he : 2 * 65 = 130 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h261 : (3729 : ℕ) ^ 261 % 10 ^ 261 = 626122782721768961496587531182702521444908852142895099929631911778801703099417383760492131452452089256828979285380972919980965781050790231236579992630670336126126375271714776566454640207941896170042269010776723000810854500711207176196542981646717691512715256529 := by
      have step := pow_mod_double_add_one (k := 3729) (e := 130) (m := 10 ^ 261) h130
      have he : 2 * 130 + 1 = 261 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h522 : (3729 : ℕ) ^ 522 % 10 ^ 261 = 310595120572669081096943513717382910015015200011719770236268632938413000936084132259493866305479303724288263423465329269876353128829953163699293806268370340088618296954622625833687176671423121177192631677135861684964839705149988568314280846692043355598277127841 := by
      have step := pow_mod_double (k := 3729) (e := 261) (m := 10 ^ 261) h261
      have he : 2 * 261 = 522 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1044 : (3729 : ℕ) ^ 1044 % 10 ^ 261 = 239343342622613289726075118539687872005458123359231479733580436545336204293968886871126407517023218807889760011381751097443392786665150701864793121553334500524010098983690156180292489116730109436666321402733383954383852165183793164362713871634614807676257321281 := by
      have step := pow_mod_double (k := 3729) (e := 522) (m := 10 ^ 261) h522
      have he : 2 * 522 = 1044 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1044
  rw [hmod]
  decide
private theorem cert_3729 : ExponentCertificate 3729 1044 1044 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 3729) (by decide) (by decide) (by decide) suffix_3729
private theorem cert_3730 : ExponentCertificate 3730 1045 1044 := by decide
private theorem cert_3731 : ExponentCertificate 3731 1045 1044 := by decide
private theorem cert_3732 : ExponentCertificate 3732 1045 1044 := by decide
private theorem cert_3733 : ExponentCertificate 3733 1045 1045 := by decide
private theorem cert_3734 : ExponentCertificate 3734 1046 1045 := by decide
private theorem cert_3735 : ExponentCertificate 3735 1046 1045 := by decide
private theorem cert_3736 : ExponentCertificate 3736 1046 1045 := by decide
private theorem cert_3737 : ExponentCertificate 3737 1046 1046 := by decide
private theorem cert_3738 : ExponentCertificate 3738 1047 1046 := by decide
private theorem cert_3739 : ExponentCertificate 3739 1047 1046 := by decide
private theorem cert_3740 : ExponentCertificate 3740 1047 1046 := by decide
private theorem cert_3741 : ExponentCertificate 3741 1047 1047 := by decide
private theorem cert_3742 : ExponentCertificate 3742 1047 1047 := by decide
private theorem cert_3743 : ExponentCertificate 3743 1048 1047 := by decide
private theorem cert_3744 : ExponentCertificate 3744 1048 1047 := by decide
private theorem cert_3745 : ExponentCertificate 3745 1048 1048 := by decide
private theorem cert_3746 : ExponentCertificate 3746 1048 1048 := by decide
private theorem cert_3747 : ExponentCertificate 3747 1049 1048 := by decide
private theorem cert_3748 : ExponentCertificate 3748 1049 1048 := by decide
private theorem cert_3749 : ExponentCertificate 3749 1049 1048 := by decide
private theorem cert_3750 : ExponentCertificate 3750 1049 1049 := by decide
private theorem cert_3751 : ExponentCertificate 3751 1050 1049 := by decide
private theorem cert_3752 : ExponentCertificate 3752 1050 1049 := by decide
private theorem cert_3753 : ExponentCertificate 3753 1050 1049 := by decide
private theorem cert_3754 : ExponentCertificate 3754 1050 1050 := by decide
private theorem cert_3755 : ExponentCertificate 3755 1051 1050 := by decide
private theorem cert_3756 : ExponentCertificate 3756 1051 1050 := by decide
private theorem cert_3757 : ExponentCertificate 3757 1051 1050 := by decide
private theorem cert_3758 : ExponentCertificate 3758 1051 1051 := by decide
private theorem cert_3759 : ExponentCertificate 3759 1052 1051 := by decide
private theorem cert_3760 : ExponentCertificate 3760 1052 1051 := by decide
private theorem cert_3761 : ExponentCertificate 3761 1052 1051 := by decide
private theorem cert_3762 : ExponentCertificate 3762 1052 1052 := by decide
private theorem cert_3763 : ExponentCertificate 3763 1053 1052 := by decide
private theorem cert_3764 : ExponentCertificate 3764 1053 1052 := by decide
private theorem cert_3765 : ExponentCertificate 3765 1053 1052 := by decide
private theorem cert_3766 : ExponentCertificate 3766 1053 1053 := by decide
private theorem cert_3767 : ExponentCertificate 3767 1054 1053 := by decide
private theorem cert_3768 : ExponentCertificate 3768 1054 1053 := by decide
private theorem cert_3769 : ExponentCertificate 3769 1054 1053 := by decide
private theorem suffix_3770 : 1054 < digitSum ((377 : ℕ) ^ 1054 % 10 ^ 264) := by
  have hmod : (377 : ℕ) ^ 1054 % 10 ^ 264 = 555405910150581272494354336040442345726496328257595556290260586829069404227056423101581127814574512175020290315344028711249771256092795604327351915002035669625455031107552182886942749380593424086805005271905308891622581570360779970306001456312127886580709141350609 := by
    have h1 : (377 : ℕ) ^ 1 % 10 ^ 264 = 377 := by decide
    have h2 : (377 : ℕ) ^ 2 % 10 ^ 264 = 142129 := by
      have step := pow_mod_double (k := 377) (e := 1) (m := 10 ^ 264) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (377 : ℕ) ^ 4 % 10 ^ 264 = 20200652641 := by
      have step := pow_mod_double (k := 377) (e := 2) (m := 10 ^ 264) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (377 : ℕ) ^ 8 % 10 ^ 264 = 408066367122340274881 := by
      have step := pow_mod_double (k := 377) (e := 4) (m := 10 ^ 264) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (377 : ℕ) ^ 16 % 10 ^ 264 = 166518159976424592031909197511958639564161 := by
      have step := pow_mod_double (k := 377) (e := 8) (m := 10 ^ 264) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h32 : (377 : ℕ) ^ 32 % 10 ^ 264 = 27728297601934132888364161574397780613078760599677111928135263601820516792035633921 := by
      have step := pow_mod_double (k := 377) (e := 16) (m := 10 ^ 264) h16
      have he : 2 * 16 = 32 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h65 : (377 : ℕ) ^ 65 % 10 ^ 264 = 289859649938837671615598131180531360171534382395329243480309113061489952474022295838928027966589668852208008915011272098816125724428166532830738771193635985402839508857 := by
      have step := pow_mod_double_add_one (k := 377) (e := 32) (m := 10 ^ 264) h32
      have he : 2 * 32 + 1 = 65 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h131 : (377 : ℕ) ^ 131 % 10 ^ 264 = 988267519577427551024421319601378534076526053495885970353693544670941160666224442596815063504639125886683111090560825484045359771973043024076529530029999667877692756909632700519720127928326377301817807872524154832182934862097186152053387846626265586178166005311273 := by
      have step := pow_mod_double_add_one (k := 377) (e := 65) (m := 10 ^ 264) h65
      have he : 2 * 65 + 1 = 131 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h263 : (377 : ℕ) ^ 263 % 10 ^ 264 = 927051649930190475180260773012754947431315526542636743685332210435106799572863775771840824040571106199083234328925773466005995008850081576421803905545599006096557592656873667095350507259773523471378548723125266002629673395951016891986931287598350774684799071959433 := by
      have step := pow_mod_double_add_one (k := 377) (e := 131) (m := 10 ^ 264) h131
      have he : 2 * 131 + 1 = 263 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h527 : (377 : ℕ) ^ 527 % 10 ^ 264 = 729082004630733766505174340839820470845612371507177296228805313594922265001348299577732724914568749866492583825861002165161865676630933384812877032469621258141792099479652216608907463096681349061755630291972420351462083712861275387253940354738561830427437125921353 := by
      have step := pow_mod_double_add_one (k := 377) (e := 263) (m := 10 ^ 264) h263
      have he : 2 * 263 + 1 = 527 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1054 : (377 : ℕ) ^ 1054 % 10 ^ 264 = 555405910150581272494354336040442345726496328257595556290260586829069404227056423101581127814574512175020290315344028711249771256092795604327351915002035669625455031107552182886942749380593424086805005271905308891622581570360779970306001456312127886580709141350609 := by
      have step := pow_mod_double (k := 377) (e := 527) (m := 10 ^ 264) h527
      have he : 2 * 527 = 1054 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1054
  rw [hmod]
  decide
private theorem cert_3770 : ExponentCertificate 3770 1054 1054 :=
  exponentCertificate_of_normalized_suffix (t := 1) (u := 377) (by decide) (by decide) (by decide) suffix_3770
private theorem cert_3771 : ExponentCertificate 3771 1055 1054 := by decide
private theorem cert_3772 : ExponentCertificate 3772 1055 1054 := by decide
private theorem cert_3773 : ExponentCertificate 3773 1055 1054 := by decide
private theorem cert_3774 : ExponentCertificate 3774 1055 1055 := by decide
private theorem cert_3775 : ExponentCertificate 3775 1056 1055 := by decide
private theorem cert_3776 : ExponentCertificate 3776 1056 1055 := by decide
private theorem cert_3777 : ExponentCertificate 3777 1056 1055 := by decide
private theorem cert_3778 : ExponentCertificate 3778 1056 1056 := by decide
private theorem cert_3779 : ExponentCertificate 3779 1057 1056 := by decide
private theorem cert_3780 : ExponentCertificate 3780 1057 1056 := by decide
private theorem cert_3781 : ExponentCertificate 3781 1057 1056 := by decide
private theorem cert_3782 : ExponentCertificate 3782 1057 1057 := by decide
private theorem cert_3783 : ExponentCertificate 3783 1058 1057 := by decide
private theorem cert_3784 : ExponentCertificate 3784 1058 1057 := by decide
private theorem cert_3785 : ExponentCertificate 3785 1058 1057 := by decide
private theorem cert_3786 : ExponentCertificate 3786 1058 1058 := by decide
private theorem cert_3787 : ExponentCertificate 3787 1059 1058 := by decide
private theorem cert_3788 : ExponentCertificate 3788 1059 1058 := by decide
private theorem cert_3789 : ExponentCertificate 3789 1059 1058 := by decide
private theorem cert_3790 : ExponentCertificate 3790 1059 1059 := by decide
private theorem cert_3791 : ExponentCertificate 3791 1060 1059 := by decide
private theorem cert_3792 : ExponentCertificate 3792 1060 1059 := by decide
private theorem cert_3793 : ExponentCertificate 3793 1060 1059 := by decide
private theorem cert_3794 : ExponentCertificate 3794 1060 1060 := by decide
private theorem cert_3795 : ExponentCertificate 3795 1061 1060 := by decide
private theorem cert_3796 : ExponentCertificate 3796 1061 1060 := by decide
private theorem cert_3797 : ExponentCertificate 3797 1061 1060 := by decide
private theorem cert_3798 : ExponentCertificate 3798 1061 1061 := by decide
private theorem cert_3799 : ExponentCertificate 3799 1061 1061 := by decide
private theorem cert_3800 : ExponentCertificate 3800 1062 1061 := by decide

private theorem certificates_3701_3800 {k : ℕ} (hlo : 3701 ≤ k) (hhi : k ≤ 3800) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1037, 1037, cert_3701⟩
  · exact ⟨1038, 1037, cert_3702⟩
  · exact ⟨1038, 1037, cert_3703⟩
  · exact ⟨1038, 1037, cert_3704⟩
  · exact ⟨1038, 1038, cert_3705⟩
  · exact ⟨1039, 1038, cert_3706⟩
  · exact ⟨1039, 1038, cert_3707⟩
  · exact ⟨1039, 1038, cert_3708⟩
  · exact ⟨1039, 1039, cert_3709⟩
  · exact ⟨1040, 1039, cert_3710⟩
  · exact ⟨1040, 1039, cert_3711⟩
  · exact ⟨1040, 1039, cert_3712⟩
  · exact ⟨1040, 1040, cert_3713⟩
  · exact ⟨1041, 1040, cert_3714⟩
  · exact ⟨1041, 1040, cert_3715⟩
  · exact ⟨1041, 1040, cert_3716⟩
  · exact ⟨1041, 1041, cert_3717⟩
  · exact ⟨1042, 1041, cert_3718⟩
  · exact ⟨1042, 1041, cert_3719⟩
  · exact ⟨1042, 1041, cert_3720⟩
  · exact ⟨1042, 1042, cert_3721⟩
  · exact ⟨1043, 1042, cert_3722⟩
  · exact ⟨1043, 1042, cert_3723⟩
  · exact ⟨1043, 1042, cert_3724⟩
  · exact ⟨1043, 1043, cert_3725⟩
  · exact ⟨1044, 1043, cert_3726⟩
  · exact ⟨1044, 1043, cert_3727⟩
  · exact ⟨1044, 1043, cert_3728⟩
  · exact ⟨1044, 1044, cert_3729⟩
  · exact ⟨1045, 1044, cert_3730⟩
  · exact ⟨1045, 1044, cert_3731⟩
  · exact ⟨1045, 1044, cert_3732⟩
  · exact ⟨1045, 1045, cert_3733⟩
  · exact ⟨1046, 1045, cert_3734⟩
  · exact ⟨1046, 1045, cert_3735⟩
  · exact ⟨1046, 1045, cert_3736⟩
  · exact ⟨1046, 1046, cert_3737⟩
  · exact ⟨1047, 1046, cert_3738⟩
  · exact ⟨1047, 1046, cert_3739⟩
  · exact ⟨1047, 1046, cert_3740⟩
  · exact ⟨1047, 1047, cert_3741⟩
  · exact ⟨1047, 1047, cert_3742⟩
  · exact ⟨1048, 1047, cert_3743⟩
  · exact ⟨1048, 1047, cert_3744⟩
  · exact ⟨1048, 1048, cert_3745⟩
  · exact ⟨1048, 1048, cert_3746⟩
  · exact ⟨1049, 1048, cert_3747⟩
  · exact ⟨1049, 1048, cert_3748⟩
  · exact ⟨1049, 1048, cert_3749⟩
  · exact ⟨1049, 1049, cert_3750⟩
  · exact ⟨1050, 1049, cert_3751⟩
  · exact ⟨1050, 1049, cert_3752⟩
  · exact ⟨1050, 1049, cert_3753⟩
  · exact ⟨1050, 1050, cert_3754⟩
  · exact ⟨1051, 1050, cert_3755⟩
  · exact ⟨1051, 1050, cert_3756⟩
  · exact ⟨1051, 1050, cert_3757⟩
  · exact ⟨1051, 1051, cert_3758⟩
  · exact ⟨1052, 1051, cert_3759⟩
  · exact ⟨1052, 1051, cert_3760⟩
  · exact ⟨1052, 1051, cert_3761⟩
  · exact ⟨1052, 1052, cert_3762⟩
  · exact ⟨1053, 1052, cert_3763⟩
  · exact ⟨1053, 1052, cert_3764⟩
  · exact ⟨1053, 1052, cert_3765⟩
  · exact ⟨1053, 1053, cert_3766⟩
  · exact ⟨1054, 1053, cert_3767⟩
  · exact ⟨1054, 1053, cert_3768⟩
  · exact ⟨1054, 1053, cert_3769⟩
  · exact ⟨1054, 1054, cert_3770⟩
  · exact ⟨1055, 1054, cert_3771⟩
  · exact ⟨1055, 1054, cert_3772⟩
  · exact ⟨1055, 1054, cert_3773⟩
  · exact ⟨1055, 1055, cert_3774⟩
  · exact ⟨1056, 1055, cert_3775⟩
  · exact ⟨1056, 1055, cert_3776⟩
  · exact ⟨1056, 1055, cert_3777⟩
  · exact ⟨1056, 1056, cert_3778⟩
  · exact ⟨1057, 1056, cert_3779⟩
  · exact ⟨1057, 1056, cert_3780⟩
  · exact ⟨1057, 1056, cert_3781⟩
  · exact ⟨1057, 1057, cert_3782⟩
  · exact ⟨1058, 1057, cert_3783⟩
  · exact ⟨1058, 1057, cert_3784⟩
  · exact ⟨1058, 1057, cert_3785⟩
  · exact ⟨1058, 1058, cert_3786⟩
  · exact ⟨1059, 1058, cert_3787⟩
  · exact ⟨1059, 1058, cert_3788⟩
  · exact ⟨1059, 1058, cert_3789⟩
  · exact ⟨1059, 1059, cert_3790⟩
  · exact ⟨1060, 1059, cert_3791⟩
  · exact ⟨1060, 1059, cert_3792⟩
  · exact ⟨1060, 1059, cert_3793⟩
  · exact ⟨1060, 1060, cert_3794⟩
  · exact ⟨1061, 1060, cert_3795⟩
  · exact ⟨1061, 1060, cert_3796⟩
  · exact ⟨1061, 1060, cert_3797⟩
  · exact ⟨1061, 1061, cert_3798⟩
  · exact ⟨1061, 1061, cert_3799⟩
  · exact ⟨1062, 1061, cert_3800⟩

theorem no_fixed_digitCount_3701_3800 {n : ℕ} (hn : a n = n)
    (hlo : 3701 ≤ digitCount n) (hhi : digitCount n ≤ 3800) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_3701_3800 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_3701_3800
end OeisA113010
