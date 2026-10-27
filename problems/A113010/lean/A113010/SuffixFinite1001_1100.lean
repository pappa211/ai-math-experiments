import A113010.SuffixFiniteCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2100
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_1001 : ExponentCertificate 1001 334 333 := by decide
private theorem cert_1002 : ExponentCertificate 1002 334 333 := by decide
private theorem cert_1003 : ExponentCertificate 1003 334 334 := by decide
private theorem cert_1004 : ExponentCertificate 1004 335 334 := by decide
private theorem cert_1005 : ExponentCertificate 1005 335 334 := by decide
private theorem cert_1006 : ExponentCertificate 1006 335 335 := by decide
private theorem cert_1007 : ExponentCertificate 1007 335 335 := by decide
private theorem cert_1008 : ExponentCertificate 1008 336 335 := by decide
private theorem cert_1009 : ExponentCertificate 1009 336 335 := by decide
private theorem cert_1010 : ExponentCertificate 1010 336 336 := by decide
private theorem cert_1011 : ExponentCertificate 1011 337 336 := by decide
private theorem cert_1012 : ExponentCertificate 1012 337 336 := by decide
private theorem cert_1013 : ExponentCertificate 1013 337 337 := by decide
private theorem cert_1014 : ExponentCertificate 1014 337 337 := by decide
private theorem cert_1015 : ExponentCertificate 1015 338 337 := by decide
private theorem cert_1016 : ExponentCertificate 1016 338 337 := by decide
private theorem cert_1017 : ExponentCertificate 1017 338 338 := by decide
private theorem cert_1018 : ExponentCertificate 1018 339 338 := by decide
private theorem cert_1019 : ExponentCertificate 1019 339 338 := by decide
private theorem cert_1020 : ExponentCertificate 1020 339 339 := by decide
private theorem cert_1021 : ExponentCertificate 1021 339 339 := by decide
private theorem cert_1022 : ExponentCertificate 1022 340 339 := by decide
private theorem cert_1023 : ExponentCertificate 1023 340 339 := by decide
private theorem suffix_1024 : 340 < digitSum ((1024 : ℕ) ^ 340 % 10 ^ 85) := by
  have hmod : (1024 : ℕ) ^ 340 % 10 ^ 85 = 8553590550584450399115760931106863321194276388088237585666814431669877909775110373376 := by
    have h1 : (1024 : ℕ) ^ 1 % 10 ^ 85 = 1024 := by decide
    have h2 : (1024 : ℕ) ^ 2 % 10 ^ 85 = 1048576 := by
      have step := pow_mod_double (k := 1024) (e := 1) (m := 10 ^ 85) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (1024 : ℕ) ^ 5 % 10 ^ 85 = 1125899906842624 := by
      have step := pow_mod_double_add_one (k := 1024) (e := 2) (m := 10 ^ 85) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (1024 : ℕ) ^ 10 % 10 ^ 85 = 1267650600228229401496703205376 := by
      have step := pow_mod_double (k := 1024) (e := 5) (m := 10 ^ 85) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (1024 : ℕ) ^ 21 % 10 ^ 85 = 1645504557321206042154969182557350504982735865633579863348609024 := by
      have step := pow_mod_double_add_one (k := 1024) (e := 10) (m := 10 ^ 85) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h42 : (1024 : ℕ) ^ 42 % 10 ^ 85 = 5581421695874189921465443966120903931272499975005961073806735733604454495675614232576 := by
      have step := pow_mod_double (k := 1024) (e := 21) (m := 10 ^ 85) h21
      have he : 2 * 21 = 42 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h85 : (1024 : ℕ) ^ 85 % 10 ^ 85 = 2577336628349889145412319979767917902626154330339044684617119264613887239597666074624 := by
      have step := pow_mod_double_add_one (k := 1024) (e := 42) (m := 10 ^ 85) h42
      have he : 2 * 42 + 1 = 85 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h170 : (1024 : ℕ) ^ 170 % 10 ^ 85 = 6692261634047197324706752950818927815472385992693228752306187618995383028460736741376 := by
      have step := pow_mod_double (k := 1024) (e := 85) (m := 10 ^ 85) h85
      have he : 2 * 85 = 170 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h340 : (1024 : ℕ) ^ 340 % 10 ^ 85 = 8553590550584450399115760931106863321194276388088237585666814431669877909775110373376 := by
      have step := pow_mod_double (k := 1024) (e := 170) (m := 10 ^ 85) h170
      have he : 2 * 170 = 340 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h340
  rw [hmod]
  decide
private theorem cert_1024 : ExponentCertificate 1024 340 340 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1024
private theorem cert_1025 : ExponentCertificate 1025 341 340 := by decide
private theorem cert_1026 : ExponentCertificate 1026 341 340 := by decide
private theorem cert_1027 : ExponentCertificate 1027 341 341 := by decide
private theorem cert_1028 : ExponentCertificate 1028 341 341 := by decide
private theorem cert_1029 : ExponentCertificate 1029 342 341 := by decide
private theorem cert_1030 : ExponentCertificate 1030 342 341 := by decide
private theorem cert_1031 : ExponentCertificate 1031 342 342 := by decide
private theorem cert_1032 : ExponentCertificate 1032 343 342 := by decide
private theorem cert_1033 : ExponentCertificate 1033 343 342 := by decide
private theorem cert_1034 : ExponentCertificate 1034 343 343 := by decide
private theorem cert_1035 : ExponentCertificate 1035 343 343 := by decide
private theorem cert_1036 : ExponentCertificate 1036 344 343 := by decide
private theorem cert_1037 : ExponentCertificate 1037 344 343 := by decide
private theorem cert_1038 : ExponentCertificate 1038 344 344 := by decide
private theorem cert_1039 : ExponentCertificate 1039 345 344 := by decide
private theorem cert_1040 : ExponentCertificate 1040 345 344 := by decide
private theorem cert_1041 : ExponentCertificate 1041 345 344 := by decide
private theorem cert_1042 : ExponentCertificate 1042 345 345 := by decide
private theorem cert_1043 : ExponentCertificate 1043 346 345 := by decide
private theorem cert_1044 : ExponentCertificate 1044 346 345 := by decide
private theorem cert_1045 : ExponentCertificate 1045 346 346 := by decide
private theorem cert_1046 : ExponentCertificate 1046 347 346 := by decide
private theorem cert_1047 : ExponentCertificate 1047 347 346 := by decide
private theorem cert_1048 : ExponentCertificate 1048 347 346 := by decide
private theorem cert_1049 : ExponentCertificate 1049 347 347 := by decide
private theorem cert_1050 : ExponentCertificate 1050 348 347 := by decide
private theorem cert_1051 : ExponentCertificate 1051 348 347 := by decide
private theorem cert_1052 : ExponentCertificate 1052 348 348 := by decide
private theorem cert_1053 : ExponentCertificate 1053 349 348 := by decide
private theorem cert_1054 : ExponentCertificate 1054 349 348 := by decide
private theorem cert_1055 : ExponentCertificate 1055 349 348 := by decide
private theorem cert_1056 : ExponentCertificate 1056 349 349 := by decide
private theorem cert_1057 : ExponentCertificate 1057 350 349 := by decide
private theorem cert_1058 : ExponentCertificate 1058 350 349 := by decide
private theorem cert_1059 : ExponentCertificate 1059 350 350 := by decide
private theorem cert_1060 : ExponentCertificate 1060 351 350 := by decide
private theorem cert_1061 : ExponentCertificate 1061 351 350 := by decide
private theorem cert_1062 : ExponentCertificate 1062 351 350 := by decide
private theorem cert_1063 : ExponentCertificate 1063 351 351 := by decide
private theorem cert_1064 : ExponentCertificate 1064 352 351 := by decide
private theorem cert_1065 : ExponentCertificate 1065 352 351 := by decide
private theorem cert_1066 : ExponentCertificate 1066 352 352 := by decide
private theorem cert_1067 : ExponentCertificate 1067 353 352 := by decide
private theorem cert_1068 : ExponentCertificate 1068 353 352 := by decide
private theorem cert_1069 : ExponentCertificate 1069 353 352 := by decide
private theorem cert_1070 : ExponentCertificate 1070 353 353 := by decide
private theorem cert_1071 : ExponentCertificate 1071 354 353 := by decide
private theorem cert_1072 : ExponentCertificate 1072 354 353 := by decide
private theorem cert_1073 : ExponentCertificate 1073 354 354 := by decide
private theorem cert_1074 : ExponentCertificate 1074 355 354 := by decide
private theorem cert_1075 : ExponentCertificate 1075 355 354 := by decide
private theorem cert_1076 : ExponentCertificate 1076 355 354 := by decide
private theorem cert_1077 : ExponentCertificate 1077 355 355 := by decide
private theorem cert_1078 : ExponentCertificate 1078 356 355 := by decide
private theorem cert_1079 : ExponentCertificate 1079 356 355 := by decide
private theorem cert_1080 : ExponentCertificate 1080 356 356 := by decide
private theorem cert_1081 : ExponentCertificate 1081 356 356 := by decide
private theorem cert_1082 : ExponentCertificate 1082 357 356 := by decide
private theorem cert_1083 : ExponentCertificate 1083 357 356 := by decide
private theorem cert_1084 : ExponentCertificate 1084 357 357 := by decide
private theorem cert_1085 : ExponentCertificate 1085 358 357 := by decide
private theorem cert_1086 : ExponentCertificate 1086 358 357 := by decide
private theorem suffix_1087 : 358 < digitSum ((1087 : ℕ) ^ 358 % 10 ^ 90) := by
  have hmod : (1087 : ℕ) ^ 358 % 10 ^ 90 = 525181197984119290597646946615292488470488053730771927932705761160397687509772556634816129 := by
    have h1 : (1087 : ℕ) ^ 1 % 10 ^ 90 = 1087 := by decide
    have h2 : (1087 : ℕ) ^ 2 % 10 ^ 90 = 1181569 := by
      have step := pow_mod_double (k := 1087) (e := 1) (m := 10 ^ 90) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (1087 : ℕ) ^ 5 % 10 ^ 90 = 1517566463014207 := by
      have step := pow_mod_double_add_one (k := 1087) (e := 2) (m := 10 ^ 90) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (1087 : ℕ) ^ 11 % 10 ^ 90 = 2503369663026344696195633732828863 := by
      have step := pow_mod_double_add_one (k := 1087) (e := 5) (m := 10 ^ 90) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h22 : (1087 : ℕ) ^ 22 % 10 ^ 90 = 6266859669760634595474896042664085848442053788941850948700445872769 := by
      have step := pow_mod_double (k := 1087) (e := 11) (m := 10 ^ 90) h11
      have he : 2 * 11 = 22 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h44 : (1087 : ℕ) ^ 44 % 10 ^ 90 = 318984562969068121390117540954589249036568994055483737706484934921014964490703126135727361 := by
      have step := pow_mod_double (k := 1087) (e := 22) (m := 10 ^ 90) h22
      have he : 2 * 22 = 44 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h89 : (1087 : ℕ) ^ 89 % 10 ^ 90 = 6806566285276434009169008829567322350480926474530254200847475691258797684499825614436927 := by
      have step := pow_mod_double_add_one (k := 1087) (e := 44) (m := 10 ^ 90) h44
      have he : 2 * 44 + 1 = 89 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h179 : (1087 : ℕ) ^ 179 % 10 ^ 90 = 868046137983338241233065472993710747476284720637063158016486119476174908330208252928018623 := by
      have step := pow_mod_double_add_one (k := 1087) (e := 89) (m := 10 ^ 90) h89
      have he : 2 * 89 + 1 = 179 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h358 : (1087 : ℕ) ^ 358 % 10 ^ 90 = 525181197984119290597646946615292488470488053730771927932705761160397687509772556634816129 := by
      have step := pow_mod_double (k := 1087) (e := 179) (m := 10 ^ 90) h179
      have he : 2 * 179 = 358 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h358
  rw [hmod]
  decide
private theorem cert_1087 : ExponentCertificate 1087 358 358 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1087
private theorem cert_1088 : ExponentCertificate 1088 358 358 := by decide
private theorem cert_1089 : ExponentCertificate 1089 359 358 := by decide
private theorem cert_1090 : ExponentCertificate 1090 359 358 := by decide
private theorem cert_1091 : ExponentCertificate 1091 359 359 := by decide
private theorem cert_1092 : ExponentCertificate 1092 360 359 := by decide
private theorem cert_1093 : ExponentCertificate 1093 360 359 := by decide
private theorem cert_1094 : ExponentCertificate 1094 360 359 := by decide
private theorem suffix_1095 : 360 < digitSum ((1095 : ℕ) ^ 360 % 10 ^ 90) := by
  have hmod : (1095 : ℕ) ^ 360 % 10 ^ 90 = 943979769037908924441114097003562927704182033126524553612313184203230775892734527587890625 := by
    have h1 : (1095 : ℕ) ^ 1 % 10 ^ 90 = 1095 := by decide
    have h2 : (1095 : ℕ) ^ 2 % 10 ^ 90 = 1199025 := by
      have step := pow_mod_double (k := 1095) (e := 1) (m := 10 ^ 90) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (1095 : ℕ) ^ 5 % 10 ^ 90 = 1574238740934375 := by
      have step := pow_mod_double_add_one (k := 1095) (e := 2) (m := 10 ^ 90) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (1095 : ℕ) ^ 11 % 10 ^ 90 = 2713659236737217639641622021484375 := by
      have step := pow_mod_double_add_one (k := 1095) (e := 5) (m := 10 ^ 90) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h22 : (1095 : ℕ) ^ 22 % 10 ^ 90 = 7363946453129218610054704505442893761904915244234945774078369140625 := by
      have step := pow_mod_double (k := 1095) (e := 11) (m := 10 ^ 90) h11
      have he : 2 * 11 = 22 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h45 : (1095 : ℕ) ^ 45 % 10 ^ 90 = 418621986999490579822613988652197798876489559712256005181501450351788662374019622802734375 := by
      have step := pow_mod_double_add_one (k := 1095) (e := 22) (m := 10 ^ 90) h22
      have he : 2 * 22 + 1 = 45 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h90 : (1095 : ℕ) ^ 90 % 10 ^ 90 = 35292566705844773830636051016671362086591498736544425529615409686812199652194976806640625 := by
      have step := pow_mod_double (k := 1095) (e := 45) (m := 10 ^ 90) h45
      have he : 2 * 45 = 90 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h180 : (1095 : ℕ) ^ 180 % 10 ^ 90 = 573429831493732140261628779315439264014368209014006760870785228689783252775669097900390625 := by
      have step := pow_mod_double (k := 1095) (e := 90) (m := 10 ^ 90) h90
      have he : 2 * 90 = 180 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h360 : (1095 : ℕ) ^ 360 % 10 ^ 90 = 943979769037908924441114097003562927704182033126524553612313184203230775892734527587890625 := by
      have step := pow_mod_double (k := 1095) (e := 180) (m := 10 ^ 90) h180
      have he : 2 * 180 = 360 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h360
  rw [hmod]
  decide
private theorem cert_1095 : ExponentCertificate 1095 360 360 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1095
private theorem cert_1096 : ExponentCertificate 1096 361 360 := by decide
private theorem cert_1097 : ExponentCertificate 1097 361 360 := by decide
private theorem cert_1098 : ExponentCertificate 1098 361 361 := by decide
private theorem cert_1099 : ExponentCertificate 1099 362 361 := by decide
private theorem cert_1100 : ExponentCertificate 1100 362 361 := by decide

private theorem certificates_1001_1100 {k : ℕ} (hlo : 1001 ≤ k) (hhi : k ≤ 1100) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨334, 333, cert_1001⟩
  · exact ⟨334, 333, cert_1002⟩
  · exact ⟨334, 334, cert_1003⟩
  · exact ⟨335, 334, cert_1004⟩
  · exact ⟨335, 334, cert_1005⟩
  · exact ⟨335, 335, cert_1006⟩
  · exact ⟨335, 335, cert_1007⟩
  · exact ⟨336, 335, cert_1008⟩
  · exact ⟨336, 335, cert_1009⟩
  · exact ⟨336, 336, cert_1010⟩
  · exact ⟨337, 336, cert_1011⟩
  · exact ⟨337, 336, cert_1012⟩
  · exact ⟨337, 337, cert_1013⟩
  · exact ⟨337, 337, cert_1014⟩
  · exact ⟨338, 337, cert_1015⟩
  · exact ⟨338, 337, cert_1016⟩
  · exact ⟨338, 338, cert_1017⟩
  · exact ⟨339, 338, cert_1018⟩
  · exact ⟨339, 338, cert_1019⟩
  · exact ⟨339, 339, cert_1020⟩
  · exact ⟨339, 339, cert_1021⟩
  · exact ⟨340, 339, cert_1022⟩
  · exact ⟨340, 339, cert_1023⟩
  · exact ⟨340, 340, cert_1024⟩
  · exact ⟨341, 340, cert_1025⟩
  · exact ⟨341, 340, cert_1026⟩
  · exact ⟨341, 341, cert_1027⟩
  · exact ⟨341, 341, cert_1028⟩
  · exact ⟨342, 341, cert_1029⟩
  · exact ⟨342, 341, cert_1030⟩
  · exact ⟨342, 342, cert_1031⟩
  · exact ⟨343, 342, cert_1032⟩
  · exact ⟨343, 342, cert_1033⟩
  · exact ⟨343, 343, cert_1034⟩
  · exact ⟨343, 343, cert_1035⟩
  · exact ⟨344, 343, cert_1036⟩
  · exact ⟨344, 343, cert_1037⟩
  · exact ⟨344, 344, cert_1038⟩
  · exact ⟨345, 344, cert_1039⟩
  · exact ⟨345, 344, cert_1040⟩
  · exact ⟨345, 344, cert_1041⟩
  · exact ⟨345, 345, cert_1042⟩
  · exact ⟨346, 345, cert_1043⟩
  · exact ⟨346, 345, cert_1044⟩
  · exact ⟨346, 346, cert_1045⟩
  · exact ⟨347, 346, cert_1046⟩
  · exact ⟨347, 346, cert_1047⟩
  · exact ⟨347, 346, cert_1048⟩
  · exact ⟨347, 347, cert_1049⟩
  · exact ⟨348, 347, cert_1050⟩
  · exact ⟨348, 347, cert_1051⟩
  · exact ⟨348, 348, cert_1052⟩
  · exact ⟨349, 348, cert_1053⟩
  · exact ⟨349, 348, cert_1054⟩
  · exact ⟨349, 348, cert_1055⟩
  · exact ⟨349, 349, cert_1056⟩
  · exact ⟨350, 349, cert_1057⟩
  · exact ⟨350, 349, cert_1058⟩
  · exact ⟨350, 350, cert_1059⟩
  · exact ⟨351, 350, cert_1060⟩
  · exact ⟨351, 350, cert_1061⟩
  · exact ⟨351, 350, cert_1062⟩
  · exact ⟨351, 351, cert_1063⟩
  · exact ⟨352, 351, cert_1064⟩
  · exact ⟨352, 351, cert_1065⟩
  · exact ⟨352, 352, cert_1066⟩
  · exact ⟨353, 352, cert_1067⟩
  · exact ⟨353, 352, cert_1068⟩
  · exact ⟨353, 352, cert_1069⟩
  · exact ⟨353, 353, cert_1070⟩
  · exact ⟨354, 353, cert_1071⟩
  · exact ⟨354, 353, cert_1072⟩
  · exact ⟨354, 354, cert_1073⟩
  · exact ⟨355, 354, cert_1074⟩
  · exact ⟨355, 354, cert_1075⟩
  · exact ⟨355, 354, cert_1076⟩
  · exact ⟨355, 355, cert_1077⟩
  · exact ⟨356, 355, cert_1078⟩
  · exact ⟨356, 355, cert_1079⟩
  · exact ⟨356, 356, cert_1080⟩
  · exact ⟨356, 356, cert_1081⟩
  · exact ⟨357, 356, cert_1082⟩
  · exact ⟨357, 356, cert_1083⟩
  · exact ⟨357, 357, cert_1084⟩
  · exact ⟨358, 357, cert_1085⟩
  · exact ⟨358, 357, cert_1086⟩
  · exact ⟨358, 358, cert_1087⟩
  · exact ⟨358, 358, cert_1088⟩
  · exact ⟨359, 358, cert_1089⟩
  · exact ⟨359, 358, cert_1090⟩
  · exact ⟨359, 359, cert_1091⟩
  · exact ⟨360, 359, cert_1092⟩
  · exact ⟨360, 359, cert_1093⟩
  · exact ⟨360, 359, cert_1094⟩
  · exact ⟨360, 360, cert_1095⟩
  · exact ⟨361, 360, cert_1096⟩
  · exact ⟨361, 360, cert_1097⟩
  · exact ⟨361, 361, cert_1098⟩
  · exact ⟨362, 361, cert_1099⟩
  · exact ⟨362, 361, cert_1100⟩

theorem no_fixed_digitCount_1001_1100 {n : ℕ} (hn : a n = n)
    (hlo : 1001 ≤ digitCount n) (hhi : digitCount n ≤ 1100) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_1001_1100 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_1001_1100
end OeisA113010
