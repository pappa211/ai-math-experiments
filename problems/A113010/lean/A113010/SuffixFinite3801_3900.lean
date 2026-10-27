import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 3901
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_3801 : ExponentCertificate 3801 1062 1061 := by decide
private theorem cert_3802 : ExponentCertificate 3802 1062 1062 := by decide
private theorem cert_3803 : ExponentCertificate 3803 1062 1062 := by decide
private theorem cert_3804 : ExponentCertificate 3804 1063 1062 := by decide
private theorem cert_3805 : ExponentCertificate 3805 1063 1062 := by decide
private theorem cert_3806 : ExponentCertificate 3806 1063 1062 := by decide
private theorem cert_3807 : ExponentCertificate 3807 1063 1063 := by decide
private theorem cert_3808 : ExponentCertificate 3808 1064 1063 := by decide
private theorem cert_3809 : ExponentCertificate 3809 1064 1063 := by decide
private theorem cert_3810 : ExponentCertificate 3810 1064 1063 := by decide
private theorem cert_3811 : ExponentCertificate 3811 1064 1064 := by decide
private theorem cert_3812 : ExponentCertificate 3812 1065 1064 := by decide
private theorem cert_3813 : ExponentCertificate 3813 1065 1064 := by decide
private theorem cert_3814 : ExponentCertificate 3814 1065 1064 := by decide
private theorem cert_3815 : ExponentCertificate 3815 1065 1065 := by decide
private theorem cert_3816 : ExponentCertificate 3816 1066 1065 := by decide
private theorem cert_3817 : ExponentCertificate 3817 1066 1065 := by decide
private theorem cert_3818 : ExponentCertificate 3818 1066 1065 := by decide
private theorem cert_3819 : ExponentCertificate 3819 1066 1066 := by decide
private theorem cert_3820 : ExponentCertificate 3820 1067 1066 := by decide
private theorem cert_3821 : ExponentCertificate 3821 1067 1066 := by decide
private theorem cert_3822 : ExponentCertificate 3822 1067 1066 := by decide
private theorem cert_3823 : ExponentCertificate 3823 1067 1067 := by decide
private theorem cert_3824 : ExponentCertificate 3824 1068 1067 := by decide
private theorem cert_3825 : ExponentCertificate 3825 1068 1067 := by decide
private theorem cert_3826 : ExponentCertificate 3826 1068 1067 := by decide
private theorem cert_3827 : ExponentCertificate 3827 1068 1068 := by decide
private theorem cert_3828 : ExponentCertificate 3828 1069 1068 := by decide
private theorem cert_3829 : ExponentCertificate 3829 1069 1068 := by decide
private theorem cert_3830 : ExponentCertificate 3830 1069 1068 := by decide
private theorem cert_3831 : ExponentCertificate 3831 1069 1069 := by decide
private theorem cert_3832 : ExponentCertificate 3832 1070 1069 := by decide
private theorem cert_3833 : ExponentCertificate 3833 1070 1069 := by decide
private theorem cert_3834 : ExponentCertificate 3834 1070 1069 := by decide
private theorem cert_3835 : ExponentCertificate 3835 1070 1070 := by decide
private theorem cert_3836 : ExponentCertificate 3836 1071 1070 := by decide
private theorem cert_3837 : ExponentCertificate 3837 1071 1070 := by decide
private theorem cert_3838 : ExponentCertificate 3838 1071 1070 := by decide
private theorem cert_3839 : ExponentCertificate 3839 1071 1071 := by decide
private theorem cert_3840 : ExponentCertificate 3840 1072 1071 := by decide
private theorem cert_3841 : ExponentCertificate 3841 1072 1071 := by decide
private theorem cert_3842 : ExponentCertificate 3842 1072 1071 := by decide
private theorem cert_3843 : ExponentCertificate 3843 1072 1072 := by decide
private theorem cert_3844 : ExponentCertificate 3844 1073 1072 := by decide
private theorem cert_3845 : ExponentCertificate 3845 1073 1072 := by decide
private theorem cert_3846 : ExponentCertificate 3846 1073 1072 := by decide
private theorem cert_3847 : ExponentCertificate 3847 1073 1073 := by decide
private theorem cert_3848 : ExponentCertificate 3848 1074 1073 := by decide
private theorem cert_3849 : ExponentCertificate 3849 1074 1073 := by decide
private theorem cert_3850 : ExponentCertificate 3850 1074 1073 := by decide
private theorem cert_3851 : ExponentCertificate 3851 1074 1074 := by decide
private theorem cert_3852 : ExponentCertificate 3852 1074 1074 := by decide
private theorem cert_3853 : ExponentCertificate 3853 1075 1074 := by decide
private theorem cert_3854 : ExponentCertificate 3854 1075 1074 := by decide
private theorem cert_3855 : ExponentCertificate 3855 1075 1075 := by decide
private theorem suffix_3856 : 1075 < digitSum ((3856 : ℕ) ^ 1075 % 10 ^ 269) := by
  have hmod : (3856 : ℕ) ^ 1075 % 10 ^ 269 = 87583082192850776611473814074192995428149647004183841587544763042309368732872874930830596758341605788184790036997112986659648098639141105374192013949380788286758703517540846541157147514529726856311843966602038490145647947791560309832173822188310642605847004720582885376 := by
    have h1 : (3856 : ℕ) ^ 1 % 10 ^ 269 = 3856 := by decide
    have h2 : (3856 : ℕ) ^ 2 % 10 ^ 269 = 14868736 := by
      have step := pow_mod_double (k := 3856) (e := 1) (m := 10 ^ 269) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (3856 : ℕ) ^ 4 % 10 ^ 269 = 221079310237696 := by
      have step := pow_mod_double (k := 3856) (e := 2) (m := 10 ^ 269) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (3856 : ℕ) ^ 8 % 10 ^ 269 = 48876061415175435396019388416 := by
      have step := pow_mod_double (k := 3856) (e := 4) (m := 10 ^ 269) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (3856 : ℕ) ^ 16 % 10 ^ 269 = 2388869379460000984605447727080487616924877921382674989056 := by
      have step := pow_mod_double (k := 3856) (e := 8) (m := 10 ^ 269) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h33 : (3856 : ℕ) ^ 33 % 10 ^ 269 = 22005023293140928831249433179492438533811072346512464765898311685873986717576515653039918852710831891018293479437500416 := by
      have step := pow_mod_double_add_one (k := 3856) (e := 16) (m := 10 ^ 269) h16
      have he : 2 * 16 + 1 = 33 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h67 : (3856 : ℕ) ^ 67 % 10 ^ 269 = 1867156369307738214958494806527985757953789902563052086300678248719316489722728175967187144097868919997118361071387520015852923933399796419372868036165769475760295365233094211076099583897675284444668021265376272830757097141056883552667303936 := by
      have step := pow_mod_double_add_one (k := 3856) (e := 33) (m := 10 ^ 269) h33
      have he : 2 * 33 + 1 = 67 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h134 : (3856 : ℕ) ^ 134 % 10 ^ 269 = 51223676078733068365442807886225471314305119502069725192935212050211586663372328926606582822554600630340424581545265260963726235935536983705453964260462979573396802739275264901626404924767527040863180549500291371938696517778614065712129630966811347892731815887001092096 := by
      have step := pow_mod_double (k := 3856) (e := 67) (m := 10 ^ 269) h67
      have he : 2 * 67 = 134 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h268 : (3856 : ℕ) ^ 268 % 10 ^ 269 = 65091813338259569444085140605273379250543026669077153461302129847653974769123453451458965051240768552258898389006520657634378331546139816849224346059817359784370663186495846347560581966717951950036025313541710772670819104449188179745955336512042118459405859496673673216 := by
      have step := pow_mod_double (k := 3856) (e := 134) (m := 10 ^ 269) h134
      have he : 2 * 134 = 268 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h537 : (3856 : ℕ) ^ 537 % 10 ^ 269 = 87163400449627471658290918277976116949370173776805058046239436905583272540737501075169669485664077886370114626393784805086259816757963554182505034380256974159346281773455481261480152333060467922394568579892529451495523941069940361680712515797474419778298937973497921536 := by
      have step := pow_mod_double_add_one (k := 3856) (e := 268) (m := 10 ^ 269) h268
      have he : 2 * 268 + 1 = 537 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1075 : (3856 : ℕ) ^ 1075 % 10 ^ 269 = 87583082192850776611473814074192995428149647004183841587544763042309368732872874930830596758341605788184790036997112986659648098639141105374192013949380788286758703517540846541157147514529726856311843966602038490145647947791560309832173822188310642605847004720582885376 := by
      have step := pow_mod_double_add_one (k := 3856) (e := 537) (m := 10 ^ 269) h537
      have he : 2 * 537 + 1 = 1075 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1075
  rw [hmod]
  decide
private theorem cert_3856 : ExponentCertificate 3856 1075 1075 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 3856) (by decide) (by decide) (by decide) suffix_3856
private theorem cert_3857 : ExponentCertificate 3857 1076 1075 := by decide
private theorem cert_3858 : ExponentCertificate 3858 1076 1075 := by decide
private theorem cert_3859 : ExponentCertificate 3859 1076 1075 := by decide
private theorem cert_3860 : ExponentCertificate 3860 1076 1076 := by decide
private theorem cert_3861 : ExponentCertificate 3861 1077 1076 := by decide
private theorem cert_3862 : ExponentCertificate 3862 1077 1076 := by decide
private theorem cert_3863 : ExponentCertificate 3863 1077 1076 := by decide
private theorem cert_3864 : ExponentCertificate 3864 1077 1077 := by decide
private theorem cert_3865 : ExponentCertificate 3865 1078 1077 := by decide
private theorem cert_3866 : ExponentCertificate 3866 1078 1077 := by decide
private theorem cert_3867 : ExponentCertificate 3867 1078 1077 := by decide
private theorem suffix_3868 : 1078 < digitSum ((3868 : ℕ) ^ 1078 % 10 ^ 270) := by
  have hmod : (3868 : ℕ) ^ 1078 % 10 ^ 270 = 492233532113764981744139891977884211932973744511405237371782418454118449853487015186159398437793017713900357470004438767354159936592984751410223824239689480719365534059601519454651496438437017800365542907861797882555920373162172188587273052178878864393998092804842061824 := by
    have h1 : (3868 : ℕ) ^ 1 % 10 ^ 270 = 3868 := by decide
    have h2 : (3868 : ℕ) ^ 2 % 10 ^ 270 = 14961424 := by
      have step := pow_mod_double (k := 3868) (e := 1) (m := 10 ^ 270) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (3868 : ℕ) ^ 4 % 10 ^ 270 = 223844208107776 := by
      have step := pow_mod_double (k := 3868) (e := 2) (m := 10 ^ 270) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (3868 : ℕ) ^ 8 % 10 ^ 270 = 50106229503397330734431666176 := by
      have step := pow_mod_double (k := 3868) (e := 4) (m := 10 ^ 270) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (3868 : ℕ) ^ 16 % 10 ^ 270 = 2510634235047125116945215091083200788289292442055502462976 := by
      have step := pow_mod_double (k := 3868) (e := 8) (m := 10 ^ 270) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h33 : (3868 : ℕ) ^ 33 % 10 ^ 270 = 24381103526153484827727081575410399064563074632398976384890184891964598221601270121961591993489862294001795906003795968 := by
      have step := pow_mod_double_add_one (k := 3868) (e := 16) (m := 10 ^ 270) h16
      have he : 2 * 16 + 1 = 33 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h67 : (3868 : ℕ) ^ 67 % 10 ^ 270 = 2299286993003857732805469287771328351005383578829509757218291172807382724131163817392128563686317468605574943089050152056474846311962092172345408082453956248662873186970769902536842585905169724939815548864210800463795511232461149342984568832 := by
      have step := pow_mod_double_add_one (k := 3868) (e := 33) (m := 10 ^ 270) h33
      have he : 2 * 33 + 1 = 67 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h134 : (3868 : ℕ) ^ 134 % 10 ^ 270 = 357283313109492787175243162499437184792448301618636225917876277202126326681636177414830644786870424220622958446726271715149477427026821595667306081330537732505192729494750162820221354463066733286936653540812309181149397685399933256307441886965601341551030392872945844224 := by
      have step := pow_mod_double (k := 3868) (e := 67) (m := 10 ^ 270) h67
      have he : 2 * 67 = 134 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h269 : (3868 : ℕ) ^ 269 % 10 ^ 270 = 265308752226327464257580969116034261581372272541157896847467423750315433856150076767889175023027688691061047198638160266439162592995255970771233909656613391880258635828057008444540920476580091538989803134549714837607931606126659653153730115220759640770125366622859296768 := by
      have step := pow_mod_double_add_one (k := 3868) (e := 134) (m := 10 ^ 270) h134
      have he : 2 * 134 + 1 = 269 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h539 : (3868 : ℕ) ^ 539 % 10 ^ 270 = 282743893019726876080229858408747258555308716279292725634943825378166833388778549799383010814612783914567038482169817234380163428274324920497507279913517035176984865464755723713933642403232378045501702398910644688274244545570337947184777995983512044787202794751610847232 := by
      have step := pow_mod_double_add_one (k := 3868) (e := 269) (m := 10 ^ 270) h269
      have he : 2 * 269 + 1 = 539 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1078 : (3868 : ℕ) ^ 1078 % 10 ^ 270 = 492233532113764981744139891977884211932973744511405237371782418454118449853487015186159398437793017713900357470004438767354159936592984751410223824239689480719365534059601519454651496438437017800365542907861797882555920373162172188587273052178878864393998092804842061824 := by
      have step := pow_mod_double (k := 3868) (e := 539) (m := 10 ^ 270) h539
      have he : 2 * 539 = 1078 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1078
  rw [hmod]
  decide
private theorem cert_3868 : ExponentCertificate 3868 1078 1078 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 3868) (by decide) (by decide) (by decide) suffix_3868
private theorem cert_3869 : ExponentCertificate 3869 1079 1078 := by decide
private theorem cert_3870 : ExponentCertificate 3870 1079 1078 := by decide
private theorem cert_3871 : ExponentCertificate 3871 1079 1078 := by decide
private theorem cert_3872 : ExponentCertificate 3872 1079 1079 := by decide
private theorem cert_3873 : ExponentCertificate 3873 1080 1079 := by decide
private theorem cert_3874 : ExponentCertificate 3874 1080 1079 := by decide
private theorem cert_3875 : ExponentCertificate 3875 1080 1079 := by decide
private theorem suffix_3876 : 1080 < digitSum ((3876 : ℕ) ^ 1080 % 10 ^ 270) := by
  have hmod : (3876 : ℕ) ^ 1080 % 10 ^ 270 = 593779678759280026741309507932486551936326003296772865103678709423940536817251234480234029500846896627096772466117009540427351594886463450273688139630339057368477743092597421494478253972288516521670391971748541648938363321544315528201591941196064433078925900770365669376 := by
    have h1 : (3876 : ℕ) ^ 1 % 10 ^ 270 = 3876 := by decide
    have h2 : (3876 : ℕ) ^ 2 % 10 ^ 270 = 15023376 := by
      have step := pow_mod_double (k := 3876) (e := 1) (m := 10 ^ 270) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (3876 : ℕ) ^ 4 % 10 ^ 270 = 225701826437376 := by
      have step := pow_mod_double (k := 3876) (e := 2) (m := 10 ^ 270) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (3876 : ℕ) ^ 8 % 10 ^ 270 = 50941314457167399888449765376 := by
      have step := pow_mod_double (k := 3876) (e := 4) (m := 10 ^ 270) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (3876 : ℕ) ^ 16 % 10 ^ 270 = 2595017518624012345564200463256026675555339644669448421376 := by
      have step := pow_mod_double (k := 3876) (e := 8) (m := 10 ^ 270) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h33 : (3876 : ℕ) ^ 33 % 10 ^ 270 = 26101433313538379786721771752289676588402486785404221489432752039499284218755866879421539244604330571386092326670565376 := by
      have step := pow_mod_double_add_one (k := 3876) (e := 16) (m := 10 ^ 270) h16
      have he : 2 * 16 + 1 = 33 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h67 : (3876 : ℕ) ^ 67 % 10 ^ 270 = 2640659966277749197281605374560378593192510844547580377825355755381048355775836577958494229023761814848472945768433684848250580622542767522515112598680564513886474184324497650798555943656864189207306246251026220568731804802894384599322853376 := by
      have step := pow_mod_double_add_one (k := 3876) (e := 33) (m := 10 ^ 270) h33
      have he : 2 * 33 + 1 = 67 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h135 : (3876 : ℕ) ^ 135 % 10 ^ 270 = 55838663283052409752172814824583909665896274552539338654962952043734495049222587902307472228620898665659987222331591731291802748827665846466203807731961400639193195481002891750884993169112168188545486106128956683021213163497019613977836219595684132387532004529459429376 := by
      have step := pow_mod_double_add_one (k := 3876) (e := 67) (m := 10 ^ 270) h67
      have he : 2 * 67 + 1 = 135 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h270 : (3876 : ℕ) ^ 270 % 10 ^ 270 = 231074522743175418543263302374845622730530409500702542338457875782152151186061548722445123264651378009152581726116616134236573188880538363085572882867243331117971518757833499775761397478247561959036778714566608622251559630762423676734010456736686949882786363159531749376 := by
      have step := pow_mod_double (k := 3876) (e := 135) (m := 10 ^ 270) h135
      have he : 2 * 135 = 270 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h540 : (3876 : ℕ) ^ 540 % 10 ^ 270 = 859509542534908699079376666912069639728273905649426977916109785646498219862888192501071538494605104783759210757856318788201518068256079802767636963349043410698050772555703929707203872307096400747570435437807596250214915430143239332825603325308862302783498034966876389376 := by
      have step := pow_mod_double (k := 3876) (e := 270) (m := 10 ^ 270) h270
      have he : 2 * 270 = 540 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1080 : (3876 : ℕ) ^ 1080 % 10 ^ 270 = 593779678759280026741309507932486551936326003296772865103678709423940536817251234480234029500846896627096772466117009540427351594886463450273688139630339057368477743092597421494478253972288516521670391971748541648938363321544315528201591941196064433078925900770365669376 := by
      have step := pow_mod_double (k := 3876) (e := 540) (m := 10 ^ 270) h540
      have he : 2 * 540 = 1080 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1080
  rw [hmod]
  decide
private theorem cert_3876 : ExponentCertificate 3876 1080 1080 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 3876) (by decide) (by decide) (by decide) suffix_3876
private theorem cert_3877 : ExponentCertificate 3877 1081 1080 := by decide
private theorem cert_3878 : ExponentCertificate 3878 1081 1080 := by decide
private theorem cert_3879 : ExponentCertificate 3879 1081 1080 := by decide
private theorem suffix_3880 : 1081 < digitSum ((388 : ℕ) ^ 1081 % 10 ^ 271) := by
  have hmod : (388 : ℕ) ^ 1081 % 10 ^ 271 = 8045954629863011214972423290449761826614826723464223693988912529255634985523209599022445337350869508658006553455420807949494429668269226677146542029946460085330482306306834933631676123793866299542029705520942816078449208371329753645225080063415280384669267642827027775488 := by
    have h1 : (388 : ℕ) ^ 1 % 10 ^ 271 = 388 := by decide
    have h2 : (388 : ℕ) ^ 2 % 10 ^ 271 = 150544 := by
      have step := pow_mod_double (k := 388) (e := 1) (m := 10 ^ 271) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (388 : ℕ) ^ 4 % 10 ^ 271 = 22663495936 := by
      have step := pow_mod_double (k := 388) (e := 2) (m := 10 ^ 271) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (388 : ℕ) ^ 8 % 10 ^ 271 = 513634048041088516096 := by
      have step := pow_mod_double (k := 388) (e := 4) (m := 10 ^ 271) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (388 : ℕ) ^ 16 % 10 ^ 271 = 263819935307075225699091539370971251081216 := by
      have step := pow_mod_double (k := 388) (e := 8) (m := 10 ^ 271) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h33 : (388 : ℕ) ^ 33 % 10 ^ 271 = 27005171806986590617805191117699498731387538025547383431173252588744914060622878998528 := by
      have step := pow_mod_double_add_one (k := 388) (e := 16) (m := 10 ^ 271) h16
      have he : 2 * 16 + 1 = 33 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h67 : (388 : ℕ) ^ 67 % 10 ^ 271 = 282960370078046999164694754253471538172486889025270834395095795681813113996381979278942501050965469056207455317171393415056764080704920155618190075928007326616890759752712192 := by
      have step := pow_mod_double_add_one (k := 388) (e := 33) (m := 10 ^ 271) h33
      have he : 2 * 33 + 1 = 67 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h135 : (388 : ℕ) ^ 135 % 10 ^ 271 = 350694744681350666668834004617731196684124578460839024392174424371322705513104749318527001837696631486775837841699851464556374180877275349421438322985711581797775122045610162637365012210983097716822945815466711571707108227515247815030514029009014474694623922794352607232 := by
      have step := pow_mod_double_add_one (k := 388) (e := 67) (m := 10 ^ 271) h67
      have he : 2 * 67 + 1 = 135 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h270 : (388 : ℕ) ^ 270 % 10 ^ 271 = 9605368589332839227458232399275725731338880193284412583842737230572156213450610082651813929552661842138277672310959811642340398152061627569515089047764755823662306452053212791344788897790875467244613828362102992186915847562183684212723507423664883539830872424276058701824 := by
      have step := pow_mod_double (k := 388) (e := 135) (m := 10 ^ 271) h135
      have he : 2 * 135 = 270 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h540 : (388 : ℕ) ^ 540 % 10 ^ 271 = 4632195920409715398969180021823712273201101208044869843093388423274846327406953011353773023923696835526069917522770671701201683842051961819574428345994186861933791348560169164749973278618657762595166537388273960086520580994067866793515109807348651849808609604752140926976 := by
      have step := pow_mod_double (k := 388) (e := 270) (m := 10 ^ 271) h270
      have he : 2 * 270 = 540 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1081 : (388 : ℕ) ^ 1081 % 10 ^ 271 = 8045954629863011214972423290449761826614826723464223693988912529255634985523209599022445337350869508658006553455420807949494429668269226677146542029946460085330482306306834933631676123793866299542029705520942816078449208371329753645225080063415280384669267642827027775488 := by
      have step := pow_mod_double_add_one (k := 388) (e := 540) (m := 10 ^ 271) h540
      have he : 2 * 540 + 1 = 1081 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1081
  rw [hmod]
  decide
private theorem cert_3880 : ExponentCertificate 3880 1081 1081 :=
  exponentCertificate_of_normalized_suffix (t := 1) (u := 388) (by decide) (by decide) (by decide) suffix_3880
private theorem cert_3881 : ExponentCertificate 3881 1082 1081 := by decide
private theorem cert_3882 : ExponentCertificate 3882 1082 1081 := by decide
private theorem cert_3883 : ExponentCertificate 3883 1082 1081 := by decide
private theorem cert_3884 : ExponentCertificate 3884 1082 1082 := by decide
private theorem cert_3885 : ExponentCertificate 3885 1083 1082 := by decide
private theorem cert_3886 : ExponentCertificate 3886 1083 1082 := by decide
private theorem cert_3887 : ExponentCertificate 3887 1083 1082 := by decide
private theorem cert_3888 : ExponentCertificate 3888 1083 1083 := by decide
private theorem cert_3889 : ExponentCertificate 3889 1084 1083 := by decide
private theorem cert_3890 : ExponentCertificate 3890 1084 1083 := by decide
private theorem cert_3891 : ExponentCertificate 3891 1084 1083 := by decide
private theorem suffix_3892 : 1084 < digitSum ((3892 : ℕ) ^ 1084 % 10 ^ 271) := by
  have hmod : (3892 : ℕ) ^ 1084 % 10 ^ 271 = 1900301313132542054711211230128461626880729183208228838471159649934514064039186307242572943572705637121892365759639811053685874821233050752204781156631529877144335402159499013868496454027417819776220189112761659572699804362625576813248476721182514219165373572472473911296 := by
    have h1 : (3892 : ℕ) ^ 1 % 10 ^ 271 = 3892 := by decide
    have h2 : (3892 : ℕ) ^ 2 % 10 ^ 271 = 15147664 := by
      have step := pow_mod_double (k := 3892) (e := 1) (m := 10 ^ 271) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (3892 : ℕ) ^ 4 % 10 ^ 271 = 229451724656896 := by
      have step := pow_mod_double (k := 3892) (e := 2) (m := 10 ^ 271) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (3892 : ℕ) ^ 8 % 10 ^ 271 = 52648093948024015808920354816 := by
      have step := pow_mod_double (k := 3892) (e := 4) (m := 10 ^ 271) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (3892 : ℕ) ^ 16 % 10 ^ 271 = 2771821796359962999832552690363602606129952915643334393856 := by
      have step := pow_mod_double (k := 3892) (e := 8) (m := 10 ^ 271) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h33 : (3892 : ℕ) ^ 33 % 10 ^ 271 = 29902220707460862177134697299872004687694899516661817917128642342171343814255735647078394313205513361130076493695680512 := by
      have step := pow_mod_double_add_one (k := 3892) (e := 16) (m := 10 ^ 271) h16
      have he : 2 * 16 + 1 = 33 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h67 : (3892 : ℕ) ^ 67 % 10 ^ 271 = 3480003790201133011714839524000192184886135974897626780373739436393305650021957295938876279587518562277099777555020197671695543361759758147729886329117675842587682019436859581811620428926324652173762799033795042152385463724980564774457704448 := by
      have step := pow_mod_double_add_one (k := 3892) (e := 33) (m := 10 ^ 271) h33
      have he : 2 * 33 + 1 = 67 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h135 : (3892 : ℕ) ^ 135 % 10 ^ 271 = 7992583293629098438831398532845332041782728656655766874209364212442238586508031047207470165073407595325232642355706459850500354345357694666497372196607304445474744459377177933354251636049574293660726629934235439813968165323381747107207644736330954820010492593378288467968 := by
      have step := pow_mod_double_add_one (k := 3892) (e := 67) (m := 10 ^ 271) h67
      have he : 2 * 67 + 1 = 135 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h271 : (3892 : ℕ) ^ 271 % 10 ^ 271 = 8579118211445400802422478493783796236192877972318113376672465454404094458305859711319791067201364185724637827336158233824880633264135470494083150105289426385211698924813330622011896577748522066237247568320040540345884538561799937412868888059586531555653981383979494801408 := by
      have step := pow_mod_double_add_one (k := 3892) (e := 135) (m := 10 ^ 271) h135
      have he : 2 * 135 + 1 = 271 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h542 : (3892 : ℕ) ^ 542 % 10 ^ 271 = 3894428812588093433260550988770813807585710248567080074237204941380097642534681134396083972594320324478310361218129581963275476462071559153769708627349568504055304813730815952731278165258504450719035133546002864615192839261572281384757172704236278571638440513297358782464 := by
      have step := pow_mod_double (k := 3892) (e := 271) (m := 10 ^ 271) h271
      have he : 2 * 271 = 542 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1084 : (3892 : ℕ) ^ 1084 % 10 ^ 271 = 1900301313132542054711211230128461626880729183208228838471159649934514064039186307242572943572705637121892365759639811053685874821233050752204781156631529877144335402159499013868496454027417819776220189112761659572699804362625576813248476721182514219165373572472473911296 := by
      have step := pow_mod_double (k := 3892) (e := 542) (m := 10 ^ 271) h542
      have he : 2 * 542 = 1084 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1084
  rw [hmod]
  decide
private theorem cert_3892 : ExponentCertificate 3892 1084 1084 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 3892) (by decide) (by decide) (by decide) suffix_3892
private theorem cert_3893 : ExponentCertificate 3893 1085 1084 := by decide
private theorem cert_3894 : ExponentCertificate 3894 1085 1084 := by decide
private theorem cert_3895 : ExponentCertificate 3895 1085 1084 := by decide
private theorem cert_3896 : ExponentCertificate 3896 1085 1085 := by decide
private theorem cert_3897 : ExponentCertificate 3897 1086 1085 := by decide
private theorem cert_3898 : ExponentCertificate 3898 1086 1085 := by decide
private theorem cert_3899 : ExponentCertificate 3899 1086 1085 := by decide
private theorem cert_3900 : ExponentCertificate 3900 1086 1086 := by decide

private theorem certificates_3801_3900 {k : ℕ} (hlo : 3801 ≤ k) (hhi : k ≤ 3900) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1062, 1061, cert_3801⟩
  · exact ⟨1062, 1062, cert_3802⟩
  · exact ⟨1062, 1062, cert_3803⟩
  · exact ⟨1063, 1062, cert_3804⟩
  · exact ⟨1063, 1062, cert_3805⟩
  · exact ⟨1063, 1062, cert_3806⟩
  · exact ⟨1063, 1063, cert_3807⟩
  · exact ⟨1064, 1063, cert_3808⟩
  · exact ⟨1064, 1063, cert_3809⟩
  · exact ⟨1064, 1063, cert_3810⟩
  · exact ⟨1064, 1064, cert_3811⟩
  · exact ⟨1065, 1064, cert_3812⟩
  · exact ⟨1065, 1064, cert_3813⟩
  · exact ⟨1065, 1064, cert_3814⟩
  · exact ⟨1065, 1065, cert_3815⟩
  · exact ⟨1066, 1065, cert_3816⟩
  · exact ⟨1066, 1065, cert_3817⟩
  · exact ⟨1066, 1065, cert_3818⟩
  · exact ⟨1066, 1066, cert_3819⟩
  · exact ⟨1067, 1066, cert_3820⟩
  · exact ⟨1067, 1066, cert_3821⟩
  · exact ⟨1067, 1066, cert_3822⟩
  · exact ⟨1067, 1067, cert_3823⟩
  · exact ⟨1068, 1067, cert_3824⟩
  · exact ⟨1068, 1067, cert_3825⟩
  · exact ⟨1068, 1067, cert_3826⟩
  · exact ⟨1068, 1068, cert_3827⟩
  · exact ⟨1069, 1068, cert_3828⟩
  · exact ⟨1069, 1068, cert_3829⟩
  · exact ⟨1069, 1068, cert_3830⟩
  · exact ⟨1069, 1069, cert_3831⟩
  · exact ⟨1070, 1069, cert_3832⟩
  · exact ⟨1070, 1069, cert_3833⟩
  · exact ⟨1070, 1069, cert_3834⟩
  · exact ⟨1070, 1070, cert_3835⟩
  · exact ⟨1071, 1070, cert_3836⟩
  · exact ⟨1071, 1070, cert_3837⟩
  · exact ⟨1071, 1070, cert_3838⟩
  · exact ⟨1071, 1071, cert_3839⟩
  · exact ⟨1072, 1071, cert_3840⟩
  · exact ⟨1072, 1071, cert_3841⟩
  · exact ⟨1072, 1071, cert_3842⟩
  · exact ⟨1072, 1072, cert_3843⟩
  · exact ⟨1073, 1072, cert_3844⟩
  · exact ⟨1073, 1072, cert_3845⟩
  · exact ⟨1073, 1072, cert_3846⟩
  · exact ⟨1073, 1073, cert_3847⟩
  · exact ⟨1074, 1073, cert_3848⟩
  · exact ⟨1074, 1073, cert_3849⟩
  · exact ⟨1074, 1073, cert_3850⟩
  · exact ⟨1074, 1074, cert_3851⟩
  · exact ⟨1074, 1074, cert_3852⟩
  · exact ⟨1075, 1074, cert_3853⟩
  · exact ⟨1075, 1074, cert_3854⟩
  · exact ⟨1075, 1075, cert_3855⟩
  · exact ⟨1075, 1075, cert_3856⟩
  · exact ⟨1076, 1075, cert_3857⟩
  · exact ⟨1076, 1075, cert_3858⟩
  · exact ⟨1076, 1075, cert_3859⟩
  · exact ⟨1076, 1076, cert_3860⟩
  · exact ⟨1077, 1076, cert_3861⟩
  · exact ⟨1077, 1076, cert_3862⟩
  · exact ⟨1077, 1076, cert_3863⟩
  · exact ⟨1077, 1077, cert_3864⟩
  · exact ⟨1078, 1077, cert_3865⟩
  · exact ⟨1078, 1077, cert_3866⟩
  · exact ⟨1078, 1077, cert_3867⟩
  · exact ⟨1078, 1078, cert_3868⟩
  · exact ⟨1079, 1078, cert_3869⟩
  · exact ⟨1079, 1078, cert_3870⟩
  · exact ⟨1079, 1078, cert_3871⟩
  · exact ⟨1079, 1079, cert_3872⟩
  · exact ⟨1080, 1079, cert_3873⟩
  · exact ⟨1080, 1079, cert_3874⟩
  · exact ⟨1080, 1079, cert_3875⟩
  · exact ⟨1080, 1080, cert_3876⟩
  · exact ⟨1081, 1080, cert_3877⟩
  · exact ⟨1081, 1080, cert_3878⟩
  · exact ⟨1081, 1080, cert_3879⟩
  · exact ⟨1081, 1081, cert_3880⟩
  · exact ⟨1082, 1081, cert_3881⟩
  · exact ⟨1082, 1081, cert_3882⟩
  · exact ⟨1082, 1081, cert_3883⟩
  · exact ⟨1082, 1082, cert_3884⟩
  · exact ⟨1083, 1082, cert_3885⟩
  · exact ⟨1083, 1082, cert_3886⟩
  · exact ⟨1083, 1082, cert_3887⟩
  · exact ⟨1083, 1083, cert_3888⟩
  · exact ⟨1084, 1083, cert_3889⟩
  · exact ⟨1084, 1083, cert_3890⟩
  · exact ⟨1084, 1083, cert_3891⟩
  · exact ⟨1084, 1084, cert_3892⟩
  · exact ⟨1085, 1084, cert_3893⟩
  · exact ⟨1085, 1084, cert_3894⟩
  · exact ⟨1085, 1084, cert_3895⟩
  · exact ⟨1085, 1085, cert_3896⟩
  · exact ⟨1086, 1085, cert_3897⟩
  · exact ⟨1086, 1085, cert_3898⟩
  · exact ⟨1086, 1085, cert_3899⟩
  · exact ⟨1086, 1086, cert_3900⟩

theorem no_fixed_digitCount_3801_3900 {n : ℕ} (hn : a n = n)
    (hlo : 3801 ≤ digitCount n) (hhi : digitCount n ≤ 3900) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_3801_3900 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_3801_3900
end OeisA113010
