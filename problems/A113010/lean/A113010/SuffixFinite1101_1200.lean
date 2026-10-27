import A113010.SuffixFiniteCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2100
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_1101 : ExponentCertificate 1101 362 361 := by decide
private theorem cert_1102 : ExponentCertificate 1102 362 362 := by decide
private theorem cert_1103 : ExponentCertificate 1103 363 362 := by decide
private theorem cert_1104 : ExponentCertificate 1104 363 362 := by decide
private theorem cert_1105 : ExponentCertificate 1105 363 363 := by decide
private theorem cert_1106 : ExponentCertificate 1106 364 363 := by decide
private theorem cert_1107 : ExponentCertificate 1107 364 363 := by decide
private theorem cert_1108 : ExponentCertificate 1108 364 363 := by decide
private theorem cert_1109 : ExponentCertificate 1109 364 364 := by decide
private theorem cert_1110 : ExponentCertificate 1110 365 364 := by decide
private theorem cert_1111 : ExponentCertificate 1111 365 364 := by decide
private theorem cert_1112 : ExponentCertificate 1112 365 365 := by decide
private theorem cert_1113 : ExponentCertificate 1113 366 365 := by decide
private theorem cert_1114 : ExponentCertificate 1114 366 365 := by decide
private theorem cert_1115 : ExponentCertificate 1115 366 365 := by decide
private theorem cert_1116 : ExponentCertificate 1116 366 366 := by decide
private theorem cert_1117 : ExponentCertificate 1117 367 366 := by decide
private theorem cert_1118 : ExponentCertificate 1118 367 366 := by decide
private theorem cert_1119 : ExponentCertificate 1119 367 367 := by decide
private theorem cert_1120 : ExponentCertificate 1120 367 367 := by decide
private theorem cert_1121 : ExponentCertificate 1121 368 367 := by decide
private theorem cert_1122 : ExponentCertificate 1122 368 367 := by decide
private theorem cert_1123 : ExponentCertificate 1123 368 368 := by decide
private theorem cert_1124 : ExponentCertificate 1124 369 368 := by decide
private theorem cert_1125 : ExponentCertificate 1125 369 368 := by decide
private theorem cert_1126 : ExponentCertificate 1126 369 368 := by decide
private theorem cert_1127 : ExponentCertificate 1127 369 369 := by decide
private theorem cert_1128 : ExponentCertificate 1128 370 369 := by decide
private theorem cert_1129 : ExponentCertificate 1129 370 369 := by decide
private theorem cert_1130 : ExponentCertificate 1130 370 370 := by decide
private theorem cert_1131 : ExponentCertificate 1131 371 370 := by decide
private theorem cert_1132 : ExponentCertificate 1132 371 370 := by decide
private theorem cert_1133 : ExponentCertificate 1133 371 370 := by decide
private theorem cert_1134 : ExponentCertificate 1134 371 371 := by decide
private theorem cert_1135 : ExponentCertificate 1135 372 371 := by decide
private theorem cert_1136 : ExponentCertificate 1136 372 371 := by decide
private theorem cert_1137 : ExponentCertificate 1137 372 372 := by decide
private theorem cert_1138 : ExponentCertificate 1138 373 372 := by decide
private theorem cert_1139 : ExponentCertificate 1139 373 372 := by decide
private theorem cert_1140 : ExponentCertificate 1140 373 372 := by decide
private theorem cert_1141 : ExponentCertificate 1141 373 373 := by decide
private theorem cert_1142 : ExponentCertificate 1142 374 373 := by decide
private theorem cert_1143 : ExponentCertificate 1143 374 373 := by decide
private theorem cert_1144 : ExponentCertificate 1144 374 374 := by decide
private theorem cert_1145 : ExponentCertificate 1145 375 374 := by decide
private theorem cert_1146 : ExponentCertificate 1146 375 374 := by decide
private theorem cert_1147 : ExponentCertificate 1147 375 374 := by decide
private theorem cert_1148 : ExponentCertificate 1148 375 375 := by decide
private theorem cert_1149 : ExponentCertificate 1149 376 375 := by decide
private theorem cert_1150 : ExponentCertificate 1150 376 375 := by decide
private theorem cert_1151 : ExponentCertificate 1151 376 376 := by decide
private theorem cert_1152 : ExponentCertificate 1152 376 376 := by decide
private theorem cert_1153 : ExponentCertificate 1153 377 376 := by decide
private theorem cert_1154 : ExponentCertificate 1154 377 376 := by decide
private theorem cert_1155 : ExponentCertificate 1155 377 377 := by decide
private theorem cert_1156 : ExponentCertificate 1156 378 377 := by decide
private theorem cert_1157 : ExponentCertificate 1157 378 377 := by decide
private theorem cert_1158 : ExponentCertificate 1158 378 377 := by decide
private theorem cert_1159 : ExponentCertificate 1159 378 378 := by decide
private theorem cert_1160 : ExponentCertificate 1160 379 378 := by decide
private theorem cert_1161 : ExponentCertificate 1161 379 378 := by decide
private theorem suffix_1162 : 379 < digitSum ((1162 : ℕ) ^ 379 % 10 ^ 95) := by
  have hmod : (1162 : ℕ) ^ 379 % 10 ^ 95 = 29868043266514449591686320503327612087177040039079259460576876383132220733335857735677088104448 := by
    have h1 : (1162 : ℕ) ^ 1 % 10 ^ 95 = 1162 := by decide
    have h2 : (1162 : ℕ) ^ 2 % 10 ^ 95 = 1350244 := by
      have step := pow_mod_double (k := 1162) (e := 1) (m := 10 ^ 95) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (1162 : ℕ) ^ 5 % 10 ^ 95 = 2118510594780832 := by
      have step := pow_mod_double_add_one (k := 1162) (e := 2) (m := 10 ^ 95) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (1162 : ℕ) ^ 11 % 10 ^ 95 = 5215157256910813364388369179404288 := by
      have step := pow_mod_double_add_one (k := 1162) (e := 5) (m := 10 ^ 95) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h23 : (1162 : ℕ) ^ 23 % 10 ^ 95 = 31603919379027661530172699431296347779160800248936397532670246338428928 := by
      have step := pow_mod_double_add_one (k := 1162) (e := 11) (m := 10 ^ 95) h11
      have he : 2 * 11 + 1 = 23 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h47 : (1162 : ℕ) ^ 47 % 10 ^ 95 = 41535029337445805523298174305549712659217284021319733014211702883236687825758974763187000311808 := by
      have step := pow_mod_double_add_one (k := 1162) (e := 23) (m := 10 ^ 95) h23
      have he : 2 * 23 + 1 = 47 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h94 : (1162 : ℕ) ^ 94 % 10 ^ 95 = 9884937189716306464755383505972316691598118406994524320590120235077878905774919624289224228864 := by
      have step := pow_mod_double (k := 1162) (e := 47) (m := 10 ^ 95) h47
      have he : 2 * 47 = 94 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h189 : (1162 : ℕ) ^ 189 % 10 ^ 95 = 71809432387879084611003047935916335590726256294090159702653748754219466529502865079473748836352 := by
      have step := pow_mod_double_add_one (k := 1162) (e := 94) (m := 10 ^ 95) h94
      have he : 2 * 94 + 1 = 189 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h379 : (1162 : ℕ) ^ 379 % 10 ^ 95 = 29868043266514449591686320503327612087177040039079259460576876383132220733335857735677088104448 := by
      have step := pow_mod_double_add_one (k := 1162) (e := 189) (m := 10 ^ 95) h189
      have he : 2 * 189 + 1 = 379 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h379
  rw [hmod]
  decide
private theorem cert_1162 : ExponentCertificate 1162 379 379 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1162
private theorem cert_1163 : ExponentCertificate 1163 380 379 := by decide
private theorem cert_1164 : ExponentCertificate 1164 380 379 := by decide
private theorem cert_1165 : ExponentCertificate 1165 380 379 := by decide
private theorem cert_1166 : ExponentCertificate 1166 380 380 := by decide
private theorem cert_1167 : ExponentCertificate 1167 381 380 := by decide
private theorem cert_1168 : ExponentCertificate 1168 381 380 := by decide
private theorem cert_1169 : ExponentCertificate 1169 381 381 := by decide
private theorem cert_1170 : ExponentCertificate 1170 382 381 := by decide
private theorem cert_1171 : ExponentCertificate 1171 382 381 := by decide
private theorem cert_1172 : ExponentCertificate 1172 382 381 := by decide
private theorem cert_1173 : ExponentCertificate 1173 382 382 := by decide
private theorem cert_1174 : ExponentCertificate 1174 383 382 := by decide
private theorem cert_1175 : ExponentCertificate 1175 383 382 := by decide
private theorem cert_1176 : ExponentCertificate 1176 383 383 := by decide
private theorem cert_1177 : ExponentCertificate 1177 383 383 := by decide
private theorem cert_1178 : ExponentCertificate 1178 384 383 := by decide
private theorem cert_1179 : ExponentCertificate 1179 384 383 := by decide
private theorem cert_1180 : ExponentCertificate 1180 384 384 := by decide
private theorem cert_1181 : ExponentCertificate 1181 385 384 := by decide
private theorem cert_1182 : ExponentCertificate 1182 385 384 := by decide
private theorem cert_1183 : ExponentCertificate 1183 385 384 := by decide
private theorem cert_1184 : ExponentCertificate 1184 385 385 := by decide
private theorem cert_1185 : ExponentCertificate 1185 386 385 := by decide
private theorem cert_1186 : ExponentCertificate 1186 386 385 := by decide
private theorem cert_1187 : ExponentCertificate 1187 386 386 := by decide
private theorem cert_1188 : ExponentCertificate 1188 387 386 := by decide
private theorem cert_1189 : ExponentCertificate 1189 387 386 := by decide
private theorem cert_1190 : ExponentCertificate 1190 387 386 := by decide
private theorem suffix_1191 : 387 < digitSum ((1191 : ℕ) ^ 387 % 10 ^ 97) := by
  have hmod : (1191 : ℕ) ^ 387 % 10 ^ 97 = 5799587275428854230371712914598237860801474084317761641005799716555993370083903925523407245240631 := by
    have h1 : (1191 : ℕ) ^ 1 % 10 ^ 97 = 1191 := by decide
    have h3 : (1191 : ℕ) ^ 3 % 10 ^ 97 = 1689410871 := by
      have step := pow_mod_double_add_one (k := 1191) (e := 1) (m := 10 ^ 97) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (1191 : ℕ) ^ 6 % 10 ^ 97 = 2854109091052978641 := by
      have step := pow_mod_double (k := 1191) (e := 3) (m := 10 ^ 97) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (1191 : ℕ) ^ 12 % 10 ^ 97 = 8145938703631259922816657398402206881 := by
      have step := pow_mod_double (k := 1191) (e := 6) (m := 10 ^ 97) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h24 : (1191 : ℕ) ^ 24 % 10 ^ 97 = 66356317363317731483248493639626147041000760073020907417952081651123748161 := by
      have step := pow_mod_double (k := 1191) (e := 12) (m := 10 ^ 97) h12
      have he : 2 * 12 = 24 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h48 : (1191 : ℕ) ^ 48 % 10 ^ 97 = 9889558921451806311938097388497319134132288304161534917735389374596419216542781881501229350881921 := by
      have step := pow_mod_double (k := 1191) (e := 24) (m := 10 ^ 97) h24
      have he : 2 * 24 = 48 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h96 : (1191 : ℕ) ^ 96 % 10 ^ 97 = 8883370080689403490397120306566739667809862286180964626860079291043807299040732313879940484650241 := by
      have step := pow_mod_double (k := 1191) (e := 48) (m := 10 ^ 97) h48
      have he : 2 * 48 = 96 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h193 : (1191 : ℕ) ^ 193 % 10 ^ 97 = 3273329915162535377168438175971930720596313880195130412820948945439354321558028117170896717474471 := by
      have step := pow_mod_double_add_one (k := 1191) (e := 96) (m := 10 ^ 97) h96
      have he : 2 * 96 + 1 = 193 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h387 : (1191 : ℕ) ^ 387 % 10 ^ 97 = 5799587275428854230371712914598237860801474084317761641005799716555993370083903925523407245240631 := by
      have step := pow_mod_double_add_one (k := 1191) (e := 193) (m := 10 ^ 97) h193
      have he : 2 * 193 + 1 = 387 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h387
  rw [hmod]
  decide
private theorem cert_1191 : ExponentCertificate 1191 387 387 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1191
private theorem cert_1192 : ExponentCertificate 1192 388 387 := by decide
private theorem cert_1193 : ExponentCertificate 1193 388 387 := by decide
private theorem cert_1194 : ExponentCertificate 1194 388 388 := by decide
private theorem cert_1195 : ExponentCertificate 1195 388 388 := by decide
private theorem cert_1196 : ExponentCertificate 1196 389 388 := by decide
private theorem cert_1197 : ExponentCertificate 1197 389 388 := by decide
private theorem cert_1198 : ExponentCertificate 1198 389 389 := by decide
private theorem cert_1199 : ExponentCertificate 1199 390 389 := by decide
private theorem cert_1200 : ExponentCertificate 1200 390 389 := by decide

private theorem certificates_1101_1200 {k : ℕ} (hlo : 1101 ≤ k) (hhi : k ≤ 1200) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨362, 361, cert_1101⟩
  · exact ⟨362, 362, cert_1102⟩
  · exact ⟨363, 362, cert_1103⟩
  · exact ⟨363, 362, cert_1104⟩
  · exact ⟨363, 363, cert_1105⟩
  · exact ⟨364, 363, cert_1106⟩
  · exact ⟨364, 363, cert_1107⟩
  · exact ⟨364, 363, cert_1108⟩
  · exact ⟨364, 364, cert_1109⟩
  · exact ⟨365, 364, cert_1110⟩
  · exact ⟨365, 364, cert_1111⟩
  · exact ⟨365, 365, cert_1112⟩
  · exact ⟨366, 365, cert_1113⟩
  · exact ⟨366, 365, cert_1114⟩
  · exact ⟨366, 365, cert_1115⟩
  · exact ⟨366, 366, cert_1116⟩
  · exact ⟨367, 366, cert_1117⟩
  · exact ⟨367, 366, cert_1118⟩
  · exact ⟨367, 367, cert_1119⟩
  · exact ⟨367, 367, cert_1120⟩
  · exact ⟨368, 367, cert_1121⟩
  · exact ⟨368, 367, cert_1122⟩
  · exact ⟨368, 368, cert_1123⟩
  · exact ⟨369, 368, cert_1124⟩
  · exact ⟨369, 368, cert_1125⟩
  · exact ⟨369, 368, cert_1126⟩
  · exact ⟨369, 369, cert_1127⟩
  · exact ⟨370, 369, cert_1128⟩
  · exact ⟨370, 369, cert_1129⟩
  · exact ⟨370, 370, cert_1130⟩
  · exact ⟨371, 370, cert_1131⟩
  · exact ⟨371, 370, cert_1132⟩
  · exact ⟨371, 370, cert_1133⟩
  · exact ⟨371, 371, cert_1134⟩
  · exact ⟨372, 371, cert_1135⟩
  · exact ⟨372, 371, cert_1136⟩
  · exact ⟨372, 372, cert_1137⟩
  · exact ⟨373, 372, cert_1138⟩
  · exact ⟨373, 372, cert_1139⟩
  · exact ⟨373, 372, cert_1140⟩
  · exact ⟨373, 373, cert_1141⟩
  · exact ⟨374, 373, cert_1142⟩
  · exact ⟨374, 373, cert_1143⟩
  · exact ⟨374, 374, cert_1144⟩
  · exact ⟨375, 374, cert_1145⟩
  · exact ⟨375, 374, cert_1146⟩
  · exact ⟨375, 374, cert_1147⟩
  · exact ⟨375, 375, cert_1148⟩
  · exact ⟨376, 375, cert_1149⟩
  · exact ⟨376, 375, cert_1150⟩
  · exact ⟨376, 376, cert_1151⟩
  · exact ⟨376, 376, cert_1152⟩
  · exact ⟨377, 376, cert_1153⟩
  · exact ⟨377, 376, cert_1154⟩
  · exact ⟨377, 377, cert_1155⟩
  · exact ⟨378, 377, cert_1156⟩
  · exact ⟨378, 377, cert_1157⟩
  · exact ⟨378, 377, cert_1158⟩
  · exact ⟨378, 378, cert_1159⟩
  · exact ⟨379, 378, cert_1160⟩
  · exact ⟨379, 378, cert_1161⟩
  · exact ⟨379, 379, cert_1162⟩
  · exact ⟨380, 379, cert_1163⟩
  · exact ⟨380, 379, cert_1164⟩
  · exact ⟨380, 379, cert_1165⟩
  · exact ⟨380, 380, cert_1166⟩
  · exact ⟨381, 380, cert_1167⟩
  · exact ⟨381, 380, cert_1168⟩
  · exact ⟨381, 381, cert_1169⟩
  · exact ⟨382, 381, cert_1170⟩
  · exact ⟨382, 381, cert_1171⟩
  · exact ⟨382, 381, cert_1172⟩
  · exact ⟨382, 382, cert_1173⟩
  · exact ⟨383, 382, cert_1174⟩
  · exact ⟨383, 382, cert_1175⟩
  · exact ⟨383, 383, cert_1176⟩
  · exact ⟨383, 383, cert_1177⟩
  · exact ⟨384, 383, cert_1178⟩
  · exact ⟨384, 383, cert_1179⟩
  · exact ⟨384, 384, cert_1180⟩
  · exact ⟨385, 384, cert_1181⟩
  · exact ⟨385, 384, cert_1182⟩
  · exact ⟨385, 384, cert_1183⟩
  · exact ⟨385, 385, cert_1184⟩
  · exact ⟨386, 385, cert_1185⟩
  · exact ⟨386, 385, cert_1186⟩
  · exact ⟨386, 386, cert_1187⟩
  · exact ⟨387, 386, cert_1188⟩
  · exact ⟨387, 386, cert_1189⟩
  · exact ⟨387, 386, cert_1190⟩
  · exact ⟨387, 387, cert_1191⟩
  · exact ⟨388, 387, cert_1192⟩
  · exact ⟨388, 387, cert_1193⟩
  · exact ⟨388, 388, cert_1194⟩
  · exact ⟨388, 388, cert_1195⟩
  · exact ⟨389, 388, cert_1196⟩
  · exact ⟨389, 388, cert_1197⟩
  · exact ⟨389, 389, cert_1198⟩
  · exact ⟨390, 389, cert_1199⟩
  · exact ⟨390, 389, cert_1200⟩

theorem no_fixed_digitCount_1101_1200 {n : ℕ} (hn : a n = n)
    (hlo : 1101 ≤ digitCount n) (hhi : digitCount n ≤ 1200) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_1101_1200 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_1101_1200
end OeisA113010
