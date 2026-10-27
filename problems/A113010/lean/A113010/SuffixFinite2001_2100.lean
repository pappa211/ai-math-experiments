import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2101
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_2001 : ExponentCertificate 2001 606 606 := by decide
private theorem cert_2002 : ExponentCertificate 2002 607 606 := by decide
private theorem cert_2003 : ExponentCertificate 2003 607 606 := by decide
private theorem cert_2004 : ExponentCertificate 2004 607 606 := by decide
private theorem cert_2005 : ExponentCertificate 2005 607 607 := by decide
private theorem cert_2006 : ExponentCertificate 2006 608 607 := by decide
private theorem cert_2007 : ExponentCertificate 2007 608 607 := by decide
private theorem cert_2008 : ExponentCertificate 2008 608 607 := by decide
private theorem cert_2009 : ExponentCertificate 2009 608 608 := by decide
private theorem cert_2010 : ExponentCertificate 2010 609 608 := by decide
private theorem cert_2011 : ExponentCertificate 2011 609 608 := by decide
private theorem cert_2012 : ExponentCertificate 2012 609 609 := by decide
private theorem cert_2013 : ExponentCertificate 2013 609 609 := by decide
private theorem cert_2014 : ExponentCertificate 2014 610 609 := by decide
private theorem cert_2015 : ExponentCertificate 2015 610 609 := by decide
private theorem cert_2016 : ExponentCertificate 2016 610 610 := by decide
private theorem cert_2017 : ExponentCertificate 2017 611 610 := by decide
private theorem cert_2018 : ExponentCertificate 2018 611 610 := by decide
private theorem cert_2019 : ExponentCertificate 2019 611 610 := by decide
private theorem cert_2020 : ExponentCertificate 2020 611 611 := by decide
private theorem cert_2021 : ExponentCertificate 2021 612 611 := by decide
private theorem cert_2022 : ExponentCertificate 2022 612 611 := by decide
private theorem cert_2023 : ExponentCertificate 2023 612 611 := by decide
private theorem cert_2024 : ExponentCertificate 2024 612 612 := by decide
private theorem cert_2025 : ExponentCertificate 2025 613 612 := by decide
private theorem cert_2026 : ExponentCertificate 2026 613 612 := by decide
private theorem cert_2027 : ExponentCertificate 2027 613 612 := by decide
private theorem cert_2028 : ExponentCertificate 2028 613 613 := by decide
private theorem cert_2029 : ExponentCertificate 2029 614 613 := by decide
private theorem cert_2030 : ExponentCertificate 2030 614 613 := by decide
private theorem cert_2031 : ExponentCertificate 2031 614 614 := by decide
private theorem cert_2032 : ExponentCertificate 2032 614 614 := by decide
private theorem cert_2033 : ExponentCertificate 2033 615 614 := by decide
private theorem cert_2034 : ExponentCertificate 2034 615 614 := by decide
private theorem cert_2035 : ExponentCertificate 2035 615 615 := by decide
private theorem cert_2036 : ExponentCertificate 2036 616 615 := by decide
private theorem cert_2037 : ExponentCertificate 2037 616 615 := by decide
private theorem cert_2038 : ExponentCertificate 2038 616 615 := by decide
private theorem suffix_2039 : 616 < digitSum ((2039 : ℕ) ^ 616 % 10 ^ 154) := by
  have hmod : (2039 : ℕ) ^ 616 % 10 ^ 154 = 7949501489138161432961810352061431027825705846198150615630987722248084938691212688498795945788035157959087071547070293180853855280355235797278224707575361 := by
    have h1 : (2039 : ℕ) ^ 1 % 10 ^ 154 = 2039 := by decide
    have h2 : (2039 : ℕ) ^ 2 % 10 ^ 154 = 4157521 := by
      have step := pow_mod_double (k := 2039) (e := 1) (m := 10 ^ 154) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (2039 : ℕ) ^ 4 % 10 ^ 154 = 17284980865441 := by
      have step := pow_mod_double (k := 2039) (e := 2) (m := 10 ^ 154) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (2039 : ℕ) ^ 9 % 10 ^ 154 = 609193179014550801248825816759 := by
      have step := pow_mod_double_add_one (k := 2039) (e := 4) (m := 10 ^ 154) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h19 : (2039 : ℕ) ^ 19 % 10 ^ 154 = 756706195560665404490351197063212301323271095772714444893461159 := by
      have step := pow_mod_double_add_one (k := 2039) (e := 9) (m := 10 ^ 154) h9
      have he : 2 * 9 + 1 = 19 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h38 : (2039 : ℕ) ^ 38 % 10 ^ 154 = 572604266399895995114404832879126230270155245050990976101576747433904642049158413094712920472174025766808032222834034641623281 := by
      have step := pow_mod_double (k := 2039) (e := 19) (m := 10 ^ 154) h19
      have he : 2 * 19 = 38 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h77 : (2039 : ℕ) ^ 77 % 10 ^ 154 = 870642296071802484946107070803944444430399819062354083986094385554335974292732763270729938596271556536098505870154081594394692433652666655175608536915479 := by
      have step := pow_mod_double_add_one (k := 2039) (e := 38) (m := 10 ^ 154) h38
      have he : 2 * 38 + 1 = 77 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h154 : (2039 : ℕ) ^ 154 % 10 ^ 154 = 502765556522915663303530817087528982035468460108127473746730101955984275409578010404203974352205800937646863789409346650141527791751543085150695589799441 := by
      have step := pow_mod_double (k := 2039) (e := 77) (m := 10 ^ 154) h77
      have he : 2 * 77 = 154 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h308 : (2039 : ℕ) ^ 308 % 10 ^ 154 = 7811998756341631578524957881922631526366928505929179381630768713630621287705916789796021244920074471218427322471397158639717459904001615971386370603912481 := by
      have step := pow_mod_double (k := 2039) (e := 154) (m := 10 ^ 154) h154
      have he : 2 * 154 = 308 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h616 : (2039 : ℕ) ^ 616 % 10 ^ 154 = 7949501489138161432961810352061431027825705846198150615630987722248084938691212688498795945788035157959087071547070293180853855280355235797278224707575361 := by
      have step := pow_mod_double (k := 2039) (e := 308) (m := 10 ^ 154) h308
      have he : 2 * 308 = 616 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h616
  rw [hmod]
  decide
private theorem cert_2039 : ExponentCertificate 2039 616 616 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2039) (by decide) (by decide) (by decide) suffix_2039
private theorem cert_2040 : ExponentCertificate 2040 617 616 := by decide
private theorem cert_2041 : ExponentCertificate 2041 617 616 := by decide
private theorem cert_2042 : ExponentCertificate 2042 617 616 := by decide
private theorem cert_2043 : ExponentCertificate 2043 617 617 := by decide
private theorem cert_2044 : ExponentCertificate 2044 618 617 := by decide
private theorem cert_2045 : ExponentCertificate 2045 618 617 := by decide
private theorem cert_2046 : ExponentCertificate 2046 618 617 := by decide
private theorem cert_2047 : ExponentCertificate 2047 618 618 := by decide
private theorem cert_2048 : ExponentCertificate 2048 619 618 := by decide
private theorem cert_2049 : ExponentCertificate 2049 619 618 := by decide
private theorem suffix_2050 : 619 < digitSum ((205 : ℕ) ^ 619 % 10 ^ 155) := by
  have hmod : (205 : ℕ) ^ 619 % 10 ^ 155 = 76801760744668502517738291986376849339146188161620658339306337198632676323906712224856860679546535137898908556929218616193821844717604108154773712158203125 := by
    have h1 : (205 : ℕ) ^ 1 % 10 ^ 155 = 205 := by decide
    have h2 : (205 : ℕ) ^ 2 % 10 ^ 155 = 42025 := by
      have step := pow_mod_double (k := 205) (e := 1) (m := 10 ^ 155) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (205 : ℕ) ^ 4 % 10 ^ 155 = 1766100625 := by
      have step := pow_mod_double (k := 205) (e := 2) (m := 10 ^ 155) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (205 : ℕ) ^ 9 % 10 ^ 155 = 639417840613205078125 := by
      have step := pow_mod_double_add_one (k := 205) (e := 4) (m := 10 ^ 155) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h19 : (205 : ℕ) ^ 19 % 10 ^ 155 = 83815310853363097355088883406848907470703125 := by
      have step := pow_mod_double_add_one (k := 205) (e := 9) (m := 10 ^ 155) h9
      have he : 2 * 9 + 1 = 19 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h38 : (205 : ℕ) ^ 38 % 10 ^ 155 = 7025006333445885822982485608068702240405701179341548407766939271823503077030181884765625 := by
      have step := pow_mod_double (k := 205) (e := 19) (m := 10 ^ 155) h19
      have he : 2 * 19 = 38 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h77 : (205 : ℕ) ^ 77 % 10 ^ 155 = 77025616273087186153169960494603274325276681685534014893450763476689105370267725931973814581805536135230947044944156687495961932654608972370624542236328125 := by
      have step := pow_mod_double_add_one (k := 205) (e := 38) (m := 10 ^ 155) h38
      have he : 2 * 38 + 1 = 77 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h154 : (205 : ℕ) ^ 154 % 10 ^ 155 = 74737499947490976214271527443859161417148914658276597682566808349245210863375667014591483783645601703314563309826258630241824221229762770235538482666015625 := by
      have step := pow_mod_double (k := 205) (e := 77) (m := 10 ^ 155) h77
      have he : 2 * 77 = 154 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h309 : (205 : ℕ) ^ 309 % 10 ^ 155 = 98373537379986314665497301234276467074614689238447074634805967753692256805498591388762995549906545912594300182696556433814549791350145824253559112548828125 := by
      have step := pow_mod_double_add_one (k := 205) (e := 154) (m := 10 ^ 155) h154
      have he : 2 * 154 + 1 = 309 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h619 : (205 : ℕ) ^ 619 % 10 ^ 155 = 76801760744668502517738291986376849339146188161620658339306337198632676323906712224856860679546535137898908556929218616193821844717604108154773712158203125 := by
      have step := pow_mod_double_add_one (k := 205) (e := 309) (m := 10 ^ 155) h309
      have he : 2 * 309 + 1 = 619 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h619
  rw [hmod]
  decide
private theorem cert_2050 : ExponentCertificate 2050 619 619 :=
  exponentCertificate_of_normalized_suffix (t := 1) (u := 205) (by decide) (by decide) (by decide) suffix_2050
private theorem cert_2051 : ExponentCertificate 2051 619 619 := by decide
private theorem cert_2052 : ExponentCertificate 2052 620 619 := by decide
private theorem cert_2053 : ExponentCertificate 2053 620 619 := by decide
private theorem cert_2054 : ExponentCertificate 2054 620 620 := by decide
private theorem cert_2055 : ExponentCertificate 2055 621 620 := by decide
private theorem cert_2056 : ExponentCertificate 2056 621 620 := by decide
private theorem cert_2057 : ExponentCertificate 2057 621 620 := by decide
private theorem suffix_2058 : 621 < digitSum ((2058 : ℕ) ^ 621 % 10 ^ 156) := by
  have hmod : (2058 : ℕ) ^ 621 % 10 ^ 156 = 22155321456802775962217736811666719072125044211190373502158138998058008753383834684958198009195324817478442001530853118374500570229496167371099742412996608 := by
    have h1 : (2058 : ℕ) ^ 1 % 10 ^ 156 = 2058 := by decide
    have h2 : (2058 : ℕ) ^ 2 % 10 ^ 156 = 4235364 := by
      have step := pow_mod_double (k := 2058) (e := 1) (m := 10 ^ 156) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (2058 : ℕ) ^ 4 % 10 ^ 156 = 17938308212496 := by
      have step := pow_mod_double (k := 2058) (e := 2) (m := 10 ^ 156) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (2058 : ℕ) ^ 9 % 10 ^ 156 = 662229211341539960825151932928 := by
      have step := pow_mod_double_add_one (k := 2058) (e := 4) (m := 10 ^ 156) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h19 : (2058 : ℕ) ^ 19 % 10 ^ 156 = 902530813352610201285646364999547945382851036803768468724252672 := by
      have step := pow_mod_double_add_one (k := 2058) (e := 9) (m := 10 ^ 156) h9
      have he : 2 * 9 + 1 = 19 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h38 : (2058 : ℕ) ^ 38 % 10 ^ 156 = 814561869050924112401190072117777548994142062707419376647460136736138816978502331468136754473189298917266329761234924899139584 := by
      have step := pow_mod_double (k := 2058) (e := 19) (m := 10 ^ 156) h19
      have he : 2 * 19 = 38 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h77 : (2058 : ℕ) ^ 77 % 10 ^ 156 = 332715188281865437236697013364889316491152420259150365162044396738065683011685620882864451665272111118342863026634433142345348343880420549749929995296309248 := by
      have step := pow_mod_double_add_one (k := 2058) (e := 38) (m := 10 ^ 156) h38
      have he : 2 * 38 + 1 = 77 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h155 : (2058 : ℕ) ^ 155 % 10 ^ 156 = 28661982206832395882254129440036464440302626560594698060919132473594236423097256995952811418961938259340168516563298036284712853571239120112608946769887232 := by
      have step := pow_mod_double_add_one (k := 2058) (e := 77) (m := 10 ^ 156) h77
      have he : 2 * 77 + 1 = 155 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h310 : (2058 : ℕ) ^ 310 % 10 ^ 156 = 642605370078349475296009076777882891933875601219723442316681055885176299060649732196953362397655168528087842748817539831948581016706454976061481293996621824 := by
      have step := pow_mod_double (k := 2058) (e := 155) (m := 10 ^ 156) h155
      have he : 2 * 155 = 310 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h621 : (2058 : ℕ) ^ 621 % 10 ^ 156 = 22155321456802775962217736811666719072125044211190373502158138998058008753383834684958198009195324817478442001530853118374500570229496167371099742412996608 := by
      have step := pow_mod_double_add_one (k := 2058) (e := 310) (m := 10 ^ 156) h310
      have he : 2 * 310 + 1 = 621 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h621
  rw [hmod]
  decide
private theorem cert_2058 : ExponentCertificate 2058 621 621 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2058) (by decide) (by decide) (by decide) suffix_2058
private theorem cert_2059 : ExponentCertificate 2059 622 621 := by decide
private theorem cert_2060 : ExponentCertificate 2060 622 621 := by decide
private theorem cert_2061 : ExponentCertificate 2061 622 621 := by decide
private theorem suffix_2062 : 622 < digitSum ((2062 : ℕ) ^ 622 % 10 ^ 156) := by
  have hmod : (2062 : ℕ) ^ 622 % 10 ^ 156 = 3228352931358166125196288419792926418805080906196075076739735235936335651207527282106589977188261205895996022265977436476905344669792370323511391807340544 := by
    have h1 : (2062 : ℕ) ^ 1 % 10 ^ 156 = 2062 := by decide
    have h2 : (2062 : ℕ) ^ 2 % 10 ^ 156 = 4251844 := by
      have step := pow_mod_double (k := 2062) (e := 1) (m := 10 ^ 156) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (2062 : ℕ) ^ 4 % 10 ^ 156 = 18078177400336 := by
      have step := pow_mod_double (k := 2062) (e := 2) (m := 10 ^ 156) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (2062 : ℕ) ^ 9 % 10 ^ 156 = 673903867119355786729026391552 := by
      have step := pow_mod_double_add_one (k := 2062) (e := 4) (m := 10 ^ 156) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h19 : (2062 : ℕ) ^ 19 % 10 ^ 156 = 936449922408186868101411765771480758443383223644706494989467648 := by
      have step := pow_mod_double_add_one (k := 2062) (e := 9) (m := 10 ^ 156) h9
      have he : 2 * 9 + 1 = 19 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h38 : (2062 : ℕ) ^ 38 % 10 ^ 156 = 876938457178299205756599191583610178245119137655815889007860168731040548696976131081724662881607866330543481516058450438651904 := by
      have step := pow_mod_double (k := 2062) (e := 19) (m := 10 ^ 156) h19
      have he : 2 * 19 = 38 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h77 : (2062 : ℕ) ^ 77 % 10 ^ 156 = 455367234072892648110271967813596534655930769177522290357403903116085382767696296455719199462973709526560958661152489697690746145357510930721757524385595392 := by
      have step := pow_mod_double_add_one (k := 2062) (e := 38) (m := 10 ^ 156) h38
      have he : 2 * 38 + 1 = 77 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h155 : (2062 : ℕ) ^ 155 % 10 ^ 156 = 583398441221919464847606547134547411287216094453954845773218316724080288627149463779222239506473900317586003594968314552676770265939425590574087247828615168 := by
      have step := pow_mod_double_add_one (k := 2062) (e := 77) (m := 10 ^ 156) h77
      have he : 2 * 77 + 1 = 155 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h311 : (2062 : ℕ) ^ 311 % 10 ^ 156 = 515788415076427638149840122911967669945566267474675592023263183113560047592673963868057372477978085373790557822117444329919546329756289008851318774995877888 := by
      have step := pow_mod_double_add_one (k := 2062) (e := 155) (m := 10 ^ 156) h155
      have he : 2 * 155 + 1 = 311 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h622 : (2062 : ℕ) ^ 622 % 10 ^ 156 = 3228352931358166125196288419792926418805080906196075076739735235936335651207527282106589977188261205895996022265977436476905344669792370323511391807340544 := by
      have step := pow_mod_double (k := 2062) (e := 311) (m := 10 ^ 156) h311
      have he : 2 * 311 = 622 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h622
  rw [hmod]
  decide
private theorem cert_2062 : ExponentCertificate 2062 622 622 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2062) (by decide) (by decide) (by decide) suffix_2062
private theorem cert_2063 : ExponentCertificate 2063 623 622 := by decide
private theorem cert_2064 : ExponentCertificate 2064 623 622 := by decide
private theorem cert_2065 : ExponentCertificate 2065 623 622 := by decide
private theorem suffix_2066 : 623 < digitSum ((2066 : ℕ) ^ 623 % 10 ^ 156) := by
  have hmod : (2066 : ℕ) ^ 623 % 10 ^ 156 = 958632231533353819743033699328030228027375965132568114390413762647549038858879991480427595922330462947596519456622294977502208471171853658489309215426871296 := by
    have h1 : (2066 : ℕ) ^ 1 % 10 ^ 156 = 2066 := by decide
    have h2 : (2066 : ℕ) ^ 2 % 10 ^ 156 = 4268356 := by
      have step := pow_mod_double (k := 2066) (e := 1) (m := 10 ^ 156) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (2066 : ℕ) ^ 4 % 10 ^ 156 = 18218862942736 := by
      have step := pow_mod_double (k := 2066) (e := 2) (m := 10 ^ 156) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (2066 : ℕ) ^ 9 % 10 ^ 156 = 685761113669527261296932327936 := by
      have step := pow_mod_double_add_one (k := 2066) (e := 4) (m := 10 ^ 156) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h19 : (2066 : ℕ) ^ 19 % 10 ^ 156 = 971574318173944417549012709785957222752653599172706980277518336 := by
      have step := pow_mod_double_add_one (k := 2066) (e := 9) (m := 10 ^ 156) h9
      have he : 2 * 9 + 1 = 19 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h38 : (2066 : ℕ) ^ 38 % 10 ^ 156 = 943956655735164981730435170563711910106199009916754917836865386893676930970052044114548510419665273794361635487386986816208896 := by
      have step := pow_mod_double (k := 2066) (e := 19) (m := 10 ^ 156) h19
      have he : 2 * 19 = 38 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h77 : (2066 : ℕ) ^ 77 % 10 ^ 156 = 409475227566554433143343503695925726895465190158697628367745148832891728615606067175119581125189073733049073758619168097902074441470166481025971497107193856 := by
      have step := pow_mod_double_add_one (k := 2066) (e := 38) (m := 10 ^ 156) h38
      have he : 2 * 38 + 1 = 77 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h155 : (2066 : ℕ) ^ 155 % 10 ^ 156 = 984741232393042600800413131351956223205550147357574248681673651067218058745746782105192291392540155963076931449377652936790967256997151415886109054731288576 := by
      have step := pow_mod_double_add_one (k := 2066) (e := 77) (m := 10 ^ 156) h77
      have he : 2 * 77 + 1 = 155 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h311 : (2066 : ℕ) ^ 311 % 10 ^ 156 = 76111730989087490424176863840263922099757514295254347758492290067287879397512427456345366714651859616856895364860586003706150206152064495338513275830665216 := by
      have step := pow_mod_double_add_one (k := 2066) (e := 155) (m := 10 ^ 156) h155
      have he : 2 * 155 + 1 = 311 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h623 : (2066 : ℕ) ^ 623 % 10 ^ 156 = 958632231533353819743033699328030228027375965132568114390413762647549038858879991480427595922330462947596519456622294977502208471171853658489309215426871296 := by
      have step := pow_mod_double_add_one (k := 2066) (e := 311) (m := 10 ^ 156) h311
      have he : 2 * 311 + 1 = 623 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h623
  rw [hmod]
  decide
private theorem cert_2066 : ExponentCertificate 2066 623 623 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2066) (by decide) (by decide) (by decide) suffix_2066
private theorem cert_2067 : ExponentCertificate 2067 624 623 := by decide
private theorem cert_2068 : ExponentCertificate 2068 624 623 := by decide
private theorem cert_2069 : ExponentCertificate 2069 624 623 := by decide
private theorem cert_2070 : ExponentCertificate 2070 624 624 := by decide
private theorem cert_2071 : ExponentCertificate 2071 625 624 := by decide
private theorem cert_2072 : ExponentCertificate 2072 625 624 := by decide
private theorem cert_2073 : ExponentCertificate 2073 625 625 := by decide
private theorem suffix_2074 : 625 < digitSum ((2074 : ℕ) ^ 625 % 10 ^ 157) := by
  have hmod : (2074 : ℕ) ^ 625 % 10 ^ 157 = 1351014255337860332450082760053854945508577249776890500952874034662091416668802399245063252416656022295890000398229985960916863546426055007081165162884890624 := by
    have h1 : (2074 : ℕ) ^ 1 % 10 ^ 157 = 2074 := by decide
    have h2 : (2074 : ℕ) ^ 2 % 10 ^ 157 = 4301476 := by
      have step := pow_mod_double (k := 2074) (e := 1) (m := 10 ^ 157) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (2074 : ℕ) ^ 4 % 10 ^ 157 = 18502695778576 := by
      have step := pow_mod_double (k := 2074) (e := 2) (m := 10 ^ 157) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (2074 : ℕ) ^ 9 % 10 ^ 157 = 710033383728583787321899047424 := by
      have step := pow_mod_double_add_one (k := 2074) (e := 4) (m := 10 ^ 157) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h19 : (2074 : ℕ) ^ 19 % 10 ^ 157 = 1045601720062795235405478206218168055298976694148984618548199424 := by
      have step := pow_mod_double_add_one (k := 2074) (e := 9) (m := 10 ^ 157) h9
      have he : 2 * 9 + 1 = 19 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h39 : (2074 : ℕ) ^ 39 % 10 ^ 157 = 2267468852814424449509140313090762499798289555366993742256970173687252006349816610478754616286299247103687673679448102710934503424 := by
      have step := pow_mod_double_add_one (k := 2074) (e := 19) (m := 10 ^ 157) h19
      have he : 2 * 19 + 1 = 39 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h78 : (2074 : ℕ) ^ 78 % 10 ^ 157 = 7241949799461599032864249892016284522337475076068715511268455989156973310790890320095287536870954744204715692309739211593548364378787204926470654729467723776 := by
      have step := pow_mod_double (k := 2074) (e := 39) (m := 10 ^ 157) h39
      have he : 2 * 39 = 78 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h156 : (2074 : ℕ) ^ 156 % 10 ^ 157 = 2804073740728813832722386265400958961294934269642583980904020913350609516255595500007480346823917358013429842065296192494189997559319377407299038938635698176 := by
      have step := pow_mod_double (k := 2074) (e := 78) (m := 10 ^ 157) h78
      have he : 2 * 78 = 156 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h312 : (2074 : ℕ) ^ 312 % 10 ^ 157 = 4422564614218456356184867127746036913593131843867418129624378379983813639640383643822039003401140954780127521971427904986117931856991384123283266346969726976 := by
      have step := pow_mod_double (k := 2074) (e := 156) (m := 10 ^ 157) h156
      have he : 2 * 156 = 312 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h625 : (2074 : ℕ) ^ 625 % 10 ^ 157 = 1351014255337860332450082760053854945508577249776890500952874034662091416668802399245063252416656022295890000398229985960916863546426055007081165162884890624 := by
      have step := pow_mod_double_add_one (k := 2074) (e := 312) (m := 10 ^ 157) h312
      have he : 2 * 312 + 1 = 625 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h625
  rw [hmod]
  decide
private theorem cert_2074 : ExponentCertificate 2074 625 625 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2074) (by decide) (by decide) (by decide) suffix_2074
private theorem cert_2075 : ExponentCertificate 2075 626 625 := by decide
private theorem cert_2076 : ExponentCertificate 2076 626 625 := by decide
private theorem cert_2077 : ExponentCertificate 2077 626 626 := by decide
private theorem cert_2078 : ExponentCertificate 2078 627 626 := by decide
private theorem cert_2079 : ExponentCertificate 2079 627 626 := by decide
private theorem cert_2080 : ExponentCertificate 2080 627 626 := by decide
private theorem cert_2081 : ExponentCertificate 2081 627 627 := by decide
private theorem cert_2082 : ExponentCertificate 2082 628 627 := by decide
private theorem cert_2083 : ExponentCertificate 2083 628 627 := by decide
private theorem cert_2084 : ExponentCertificate 2084 628 627 := by decide
private theorem cert_2085 : ExponentCertificate 2085 628 628 := by decide
private theorem cert_2086 : ExponentCertificate 2086 629 628 := by decide
private theorem cert_2087 : ExponentCertificate 2087 629 628 := by decide
private theorem cert_2088 : ExponentCertificate 2088 629 628 := by decide
private theorem cert_2089 : ExponentCertificate 2089 629 629 := by decide
private theorem cert_2090 : ExponentCertificate 2090 630 629 := by decide
private theorem cert_2091 : ExponentCertificate 2091 630 629 := by decide
private theorem cert_2092 : ExponentCertificate 2092 630 630 := by decide
private theorem cert_2093 : ExponentCertificate 2093 630 630 := by decide
private theorem cert_2094 : ExponentCertificate 2094 631 630 := by decide
private theorem cert_2095 : ExponentCertificate 2095 631 630 := by decide
private theorem cert_2096 : ExponentCertificate 2096 631 631 := by decide
private theorem cert_2097 : ExponentCertificate 2097 632 631 := by decide
private theorem cert_2098 : ExponentCertificate 2098 632 631 := by decide
private theorem cert_2099 : ExponentCertificate 2099 632 631 := by decide
private theorem cert_2100 : ExponentCertificate 2100 632 632 := by decide

private theorem certificates_2001_2100 {k : ℕ} (hlo : 2001 ≤ k) (hhi : k ≤ 2100) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨606, 606, cert_2001⟩
  · exact ⟨607, 606, cert_2002⟩
  · exact ⟨607, 606, cert_2003⟩
  · exact ⟨607, 606, cert_2004⟩
  · exact ⟨607, 607, cert_2005⟩
  · exact ⟨608, 607, cert_2006⟩
  · exact ⟨608, 607, cert_2007⟩
  · exact ⟨608, 607, cert_2008⟩
  · exact ⟨608, 608, cert_2009⟩
  · exact ⟨609, 608, cert_2010⟩
  · exact ⟨609, 608, cert_2011⟩
  · exact ⟨609, 609, cert_2012⟩
  · exact ⟨609, 609, cert_2013⟩
  · exact ⟨610, 609, cert_2014⟩
  · exact ⟨610, 609, cert_2015⟩
  · exact ⟨610, 610, cert_2016⟩
  · exact ⟨611, 610, cert_2017⟩
  · exact ⟨611, 610, cert_2018⟩
  · exact ⟨611, 610, cert_2019⟩
  · exact ⟨611, 611, cert_2020⟩
  · exact ⟨612, 611, cert_2021⟩
  · exact ⟨612, 611, cert_2022⟩
  · exact ⟨612, 611, cert_2023⟩
  · exact ⟨612, 612, cert_2024⟩
  · exact ⟨613, 612, cert_2025⟩
  · exact ⟨613, 612, cert_2026⟩
  · exact ⟨613, 612, cert_2027⟩
  · exact ⟨613, 613, cert_2028⟩
  · exact ⟨614, 613, cert_2029⟩
  · exact ⟨614, 613, cert_2030⟩
  · exact ⟨614, 614, cert_2031⟩
  · exact ⟨614, 614, cert_2032⟩
  · exact ⟨615, 614, cert_2033⟩
  · exact ⟨615, 614, cert_2034⟩
  · exact ⟨615, 615, cert_2035⟩
  · exact ⟨616, 615, cert_2036⟩
  · exact ⟨616, 615, cert_2037⟩
  · exact ⟨616, 615, cert_2038⟩
  · exact ⟨616, 616, cert_2039⟩
  · exact ⟨617, 616, cert_2040⟩
  · exact ⟨617, 616, cert_2041⟩
  · exact ⟨617, 616, cert_2042⟩
  · exact ⟨617, 617, cert_2043⟩
  · exact ⟨618, 617, cert_2044⟩
  · exact ⟨618, 617, cert_2045⟩
  · exact ⟨618, 617, cert_2046⟩
  · exact ⟨618, 618, cert_2047⟩
  · exact ⟨619, 618, cert_2048⟩
  · exact ⟨619, 618, cert_2049⟩
  · exact ⟨619, 619, cert_2050⟩
  · exact ⟨619, 619, cert_2051⟩
  · exact ⟨620, 619, cert_2052⟩
  · exact ⟨620, 619, cert_2053⟩
  · exact ⟨620, 620, cert_2054⟩
  · exact ⟨621, 620, cert_2055⟩
  · exact ⟨621, 620, cert_2056⟩
  · exact ⟨621, 620, cert_2057⟩
  · exact ⟨621, 621, cert_2058⟩
  · exact ⟨622, 621, cert_2059⟩
  · exact ⟨622, 621, cert_2060⟩
  · exact ⟨622, 621, cert_2061⟩
  · exact ⟨622, 622, cert_2062⟩
  · exact ⟨623, 622, cert_2063⟩
  · exact ⟨623, 622, cert_2064⟩
  · exact ⟨623, 622, cert_2065⟩
  · exact ⟨623, 623, cert_2066⟩
  · exact ⟨624, 623, cert_2067⟩
  · exact ⟨624, 623, cert_2068⟩
  · exact ⟨624, 623, cert_2069⟩
  · exact ⟨624, 624, cert_2070⟩
  · exact ⟨625, 624, cert_2071⟩
  · exact ⟨625, 624, cert_2072⟩
  · exact ⟨625, 625, cert_2073⟩
  · exact ⟨625, 625, cert_2074⟩
  · exact ⟨626, 625, cert_2075⟩
  · exact ⟨626, 625, cert_2076⟩
  · exact ⟨626, 626, cert_2077⟩
  · exact ⟨627, 626, cert_2078⟩
  · exact ⟨627, 626, cert_2079⟩
  · exact ⟨627, 626, cert_2080⟩
  · exact ⟨627, 627, cert_2081⟩
  · exact ⟨628, 627, cert_2082⟩
  · exact ⟨628, 627, cert_2083⟩
  · exact ⟨628, 627, cert_2084⟩
  · exact ⟨628, 628, cert_2085⟩
  · exact ⟨629, 628, cert_2086⟩
  · exact ⟨629, 628, cert_2087⟩
  · exact ⟨629, 628, cert_2088⟩
  · exact ⟨629, 629, cert_2089⟩
  · exact ⟨630, 629, cert_2090⟩
  · exact ⟨630, 629, cert_2091⟩
  · exact ⟨630, 630, cert_2092⟩
  · exact ⟨630, 630, cert_2093⟩
  · exact ⟨631, 630, cert_2094⟩
  · exact ⟨631, 630, cert_2095⟩
  · exact ⟨631, 631, cert_2096⟩
  · exact ⟨632, 631, cert_2097⟩
  · exact ⟨632, 631, cert_2098⟩
  · exact ⟨632, 631, cert_2099⟩
  · exact ⟨632, 632, cert_2100⟩

theorem no_fixed_digitCount_2001_2100 {n : ℕ} (hn : a n = n)
    (hlo : 2001 ≤ digitCount n) (hhi : digitCount n ≤ 2100) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_2001_2100 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_2001_2100
end OeisA113010
