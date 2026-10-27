import A113010.SuffixFiniteCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2100
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_1201 : ExponentCertificate 1201 390 389 := by decide
private theorem cert_1202 : ExponentCertificate 1202 390 390 := by decide
private theorem cert_1203 : ExponentCertificate 1203 391 390 := by decide
private theorem cert_1204 : ExponentCertificate 1204 391 390 := by decide
private theorem cert_1205 : ExponentCertificate 1205 391 391 := by decide
private theorem cert_1206 : ExponentCertificate 1206 392 391 := by decide
private theorem cert_1207 : ExponentCertificate 1207 392 391 := by decide
private theorem cert_1208 : ExponentCertificate 1208 392 391 := by decide
private theorem cert_1209 : ExponentCertificate 1209 392 392 := by decide
private theorem cert_1210 : ExponentCertificate 1210 393 392 := by decide
private theorem cert_1211 : ExponentCertificate 1211 393 392 := by decide
private theorem cert_1212 : ExponentCertificate 1212 393 393 := by decide
private theorem cert_1213 : ExponentCertificate 1213 394 393 := by decide
private theorem cert_1214 : ExponentCertificate 1214 394 393 := by decide
private theorem cert_1215 : ExponentCertificate 1215 394 393 := by decide
private theorem cert_1216 : ExponentCertificate 1216 394 394 := by decide
private theorem cert_1217 : ExponentCertificate 1217 395 394 := by decide
private theorem cert_1218 : ExponentCertificate 1218 395 394 := by decide
private theorem cert_1219 : ExponentCertificate 1219 395 395 := by decide
private theorem cert_1220 : ExponentCertificate 1220 395 395 := by decide
private theorem cert_1221 : ExponentCertificate 1221 396 395 := by decide
private theorem cert_1222 : ExponentCertificate 1222 396 395 := by decide
private theorem cert_1223 : ExponentCertificate 1223 396 396 := by decide
private theorem cert_1224 : ExponentCertificate 1224 397 396 := by decide
private theorem cert_1225 : ExponentCertificate 1225 397 396 := by decide
private theorem cert_1226 : ExponentCertificate 1226 397 396 := by decide
private theorem cert_1227 : ExponentCertificate 1227 397 397 := by decide
private theorem cert_1228 : ExponentCertificate 1228 398 397 := by decide
private theorem cert_1229 : ExponentCertificate 1229 398 397 := by decide
private theorem cert_1230 : ExponentCertificate 1230 398 398 := by decide
private theorem cert_1231 : ExponentCertificate 1231 399 398 := by decide
private theorem cert_1232 : ExponentCertificate 1232 399 398 := by decide
private theorem cert_1233 : ExponentCertificate 1233 399 398 := by decide
private theorem cert_1234 : ExponentCertificate 1234 399 399 := by decide
private theorem cert_1235 : ExponentCertificate 1235 400 399 := by decide
private theorem cert_1236 : ExponentCertificate 1236 400 399 := by decide
private theorem suffix_1237 : 400 < digitSum ((1237 : ℕ) ^ 400 % 10 ^ 100) := by
  have hmod : (1237 : ℕ) ^ 400 % 10 ^ 100 = 1450744242963857222185465998936478794717016049709201447861306552839642413060918105664022709976376001 := by
    have h1 : (1237 : ℕ) ^ 1 % 10 ^ 100 = 1237 := by decide
    have h3 : (1237 : ℕ) ^ 3 % 10 ^ 100 = 1892819053 := by
      have step := pow_mod_double_add_one (k := 1237) (e := 1) (m := 10 ^ 100) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (1237 : ℕ) ^ 6 % 10 ^ 100 = 3582763967399816809 := by
      have step := pow_mod_double (k := 1237) (e := 3) (m := 10 ^ 100) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (1237 : ℕ) ^ 12 % 10 ^ 100 = 12836197646098475602532096086758942481 := by
      have step := pow_mod_double (k := 1237) (e := 6) (m := 10 ^ 100) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h25 : (1237 : ℕ) ^ 25 % 10 ^ 100 = 203817978902003904791698620300208299869526101403779576056635957645353980541557 := by
      have step := pow_mod_double_add_one (k := 1237) (e := 12) (m := 10 ^ 100) h12
      have he : 2 * 12 + 1 = 25 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h50 : (1237 : ℕ) ^ 50 % 10 ^ 100 = 9964637037096508351822318685014867130423771501208088425343462322884601679606678130930330987003984249 := by
      have step := pow_mod_double (k := 1237) (e := 25) (m := 10 ^ 100) h25
      have he : 2 * 25 = 50 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h100 : (1237 : ℕ) ^ 100 % 10 ^ 100 = 181041499436909106351562918397262822661743630083479757633955476528686820845356249609263400240094001 := by
      have step := pow_mod_double (k := 1237) (e := 50) (m := 10 ^ 100) h50
      have he : 2 * 50 = 100 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h200 : (1237 : ℕ) ^ 200 % 10 ^ 100 = 5777111588513488590019600500166131144484801438999172735361483266510638659057645472795371929316188001 := by
      have step := pow_mod_double (k := 1237) (e := 100) (m := 10 ^ 100) h100
      have he : 2 * 100 = 200 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h400 : (1237 : ℕ) ^ 400 % 10 ^ 100 = 1450744242963857222185465998936478794717016049709201447861306552839642413060918105664022709976376001 := by
      have step := pow_mod_double (k := 1237) (e := 200) (m := 10 ^ 100) h200
      have he : 2 * 200 = 400 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h400
  rw [hmod]
  decide
private theorem cert_1237 : ExponentCertificate 1237 400 400 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1237
private theorem suffix_1238 : 400 < digitSum ((1238 : ℕ) ^ 400 % 10 ^ 100) := by
  have hmod : (1238 : ℕ) ^ 400 % 10 ^ 100 = 8299423593728956657273269946795704702123192858543366854885478923284429983273838510532997903732965376 := by
    have h1 : (1238 : ℕ) ^ 1 % 10 ^ 100 = 1238 := by decide
    have h3 : (1238 : ℕ) ^ 3 % 10 ^ 100 = 1897413272 := by
      have step := pow_mod_double_add_one (k := 1238) (e := 1) (m := 10 ^ 100) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (1238 : ℕ) ^ 6 % 10 ^ 100 = 3600177124761745984 := by
      have step := pow_mod_double (k := 1238) (e := 3) (m := 10 ^ 100) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (1238 : ℕ) ^ 12 % 10 ^ 100 = 12961275329657752308371596976140128256 := by
      have step := pow_mod_double (k := 1238) (e := 6) (m := 10 ^ 100) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h25 : (1238 : ℕ) ^ 25 % 10 ^ 100 = 207977386815939008610207406173482077453307240592214327729546331826480446701568 := by
      have step := pow_mod_double_add_one (k := 1238) (e := 12) (m := 10 ^ 100) h12
      have he : 2 * 12 + 1 = 25 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h50 : (1238 : ℕ) ^ 50 % 10 ^ 100 = 2577530303487180210683668090636751871826232045498161378095234830170042681281901474039383570853658624 := by
      have step := pow_mod_double (k := 1238) (e := 25) (m := 10 ^ 100) h25
      have he : 2 * 25 = 50 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h100 : (1238 : ℕ) ^ 100 % 10 ^ 100 = 7353219141864469733317751869879760272504169134223415816885544231519072562450008701077548406329573376 := by
      have step := pow_mod_double (k := 1238) (e := 50) (m := 10 ^ 100) h50
      have he : 2 * 50 = 100 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h200 : (1238 : ℕ) ^ 200 % 10 ^ 100 = 2769771234881550542896752465434061099460466302142363062566507365494615364960145768046295922168037376 := by
      have step := pow_mod_double (k := 1238) (e := 100) (m := 10 ^ 100) h100
      have he : 2 * 100 = 200 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h400 : (1238 : ℕ) ^ 400 % 10 ^ 100 = 8299423593728956657273269946795704702123192858543366854885478923284429983273838510532997903732965376 := by
      have step := pow_mod_double (k := 1238) (e := 200) (m := 10 ^ 100) h200
      have he : 2 * 200 = 400 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h400
  rw [hmod]
  decide
private theorem cert_1238 : ExponentCertificate 1238 400 400 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1238
private theorem cert_1239 : ExponentCertificate 1239 401 400 := by decide
private theorem cert_1240 : ExponentCertificate 1240 401 400 := by decide
private theorem cert_1241 : ExponentCertificate 1241 401 401 := by decide
private theorem cert_1242 : ExponentCertificate 1242 402 401 := by decide
private theorem cert_1243 : ExponentCertificate 1243 402 401 := by decide
private theorem cert_1244 : ExponentCertificate 1244 402 401 := by decide
private theorem cert_1245 : ExponentCertificate 1245 402 402 := by decide
private theorem cert_1246 : ExponentCertificate 1246 403 402 := by decide
private theorem cert_1247 : ExponentCertificate 1247 403 402 := by decide
private theorem cert_1248 : ExponentCertificate 1248 403 403 := by decide
private theorem cert_1249 : ExponentCertificate 1249 404 403 := by decide
private theorem cert_1250 : ExponentCertificate 1250 404 403 := by decide
private theorem cert_1251 : ExponentCertificate 1251 404 403 := by decide
private theorem cert_1252 : ExponentCertificate 1252 404 404 := by decide
private theorem cert_1253 : ExponentCertificate 1253 405 404 := by decide
private theorem cert_1254 : ExponentCertificate 1254 405 404 := by decide
private theorem cert_1255 : ExponentCertificate 1255 405 405 := by decide
private theorem cert_1256 : ExponentCertificate 1256 405 405 := by decide
private theorem cert_1257 : ExponentCertificate 1257 406 405 := by decide
private theorem cert_1258 : ExponentCertificate 1258 406 405 := by decide
private theorem suffix_1259 : 406 < digitSum ((1259 : ℕ) ^ 406 % 10 ^ 102) := by
  have hmod : (1259 : ℕ) ^ 406 % 10 ^ 102 = 511422815096309576541073373900853452085815822577523266492236941811021154575366788807526002786115702441 := by
    have h1 : (1259 : ℕ) ^ 1 % 10 ^ 102 = 1259 := by decide
    have h3 : (1259 : ℕ) ^ 3 % 10 ^ 102 = 1995616979 := by
      have step := pow_mod_double_add_one (k := 1259) (e := 1) (m := 10 ^ 102) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (1259 : ℕ) ^ 6 % 10 ^ 102 = 3982487126873086441 := by
      have step := pow_mod_double (k := 1259) (e := 3) (m := 10 ^ 102) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (1259 : ℕ) ^ 12 % 10 ^ 102 = 15860203715709850899097597065458046481 := by
      have step := pow_mod_double (k := 1259) (e := 6) (m := 10 ^ 102) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h25 : (1259 : ℕ) ^ 25 % 10 ^ 102 = 316696491936905050247924241565507362627312647446485082464888317353924412551499 := by
      have step := pow_mod_double_add_one (k := 1259) (e := 12) (m := 10 ^ 102) h12
      have he : 2 * 12 + 1 = 25 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h50 : (1259 : ℕ) ^ 50 % 10 ^ 102 = 82289563809244847081157497475522260042649434454324616627816799347584858593658581674289662891327147001 := by
      have step := pow_mod_double (k := 1259) (e := 25) (m := 10 ^ 102) h25
      have he : 2 * 25 = 50 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h101 : (1259 : ℕ) ^ 101 % 10 ^ 102 = 804007996299572227555530088022075207223209392072407500101802595125340204625288298904493922309487147259 := by
      have step := pow_mod_double_add_one (k := 1259) (e := 50) (m := 10 ^ 102) h50
      have he : 2 * 50 + 1 = 101 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h203 : (1259 : ℕ) ^ 203 % 10 ^ 102 = 299278639771849068779331167386675662171458692734412262671846342085535264805852468978318373064577268979 := by
      have step := pow_mod_double_add_one (k := 1259) (e := 101) (m := 10 ^ 102) h101
      have he : 2 * 101 + 1 = 203 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h406 : (1259 : ℕ) ^ 406 % 10 ^ 102 = 511422815096309576541073373900853452085815822577523266492236941811021154575366788807526002786115702441 := by
      have step := pow_mod_double (k := 1259) (e := 203) (m := 10 ^ 102) h203
      have he : 2 * 203 = 406 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h406
  rw [hmod]
  decide
private theorem cert_1259 : ExponentCertificate 1259 406 406 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1259
private theorem cert_1260 : ExponentCertificate 1260 407 406 := by decide
private theorem cert_1261 : ExponentCertificate 1261 407 406 := by decide
private theorem cert_1262 : ExponentCertificate 1262 407 406 := by decide
private theorem cert_1263 : ExponentCertificate 1263 407 407 := by decide
private theorem cert_1264 : ExponentCertificate 1264 408 407 := by decide
private theorem cert_1265 : ExponentCertificate 1265 408 407 := by decide
private theorem cert_1266 : ExponentCertificate 1266 408 408 := by decide
private theorem cert_1267 : ExponentCertificate 1267 409 408 := by decide
private theorem cert_1268 : ExponentCertificate 1268 409 408 := by decide
private theorem cert_1269 : ExponentCertificate 1269 409 408 := by decide
private theorem cert_1270 : ExponentCertificate 1270 409 409 := by decide
private theorem cert_1271 : ExponentCertificate 1271 410 409 := by decide
private theorem cert_1272 : ExponentCertificate 1272 410 409 := by decide
private theorem cert_1273 : ExponentCertificate 1273 410 410 := by decide
private theorem cert_1274 : ExponentCertificate 1274 410 410 := by decide
private theorem cert_1275 : ExponentCertificate 1275 411 410 := by decide
private theorem cert_1276 : ExponentCertificate 1276 411 410 := by decide
private theorem cert_1277 : ExponentCertificate 1277 411 411 := by decide
private theorem cert_1278 : ExponentCertificate 1278 412 411 := by decide
private theorem cert_1279 : ExponentCertificate 1279 412 411 := by decide
private theorem cert_1280 : ExponentCertificate 1280 412 411 := by decide
private theorem cert_1281 : ExponentCertificate 1281 412 412 := by decide
private theorem cert_1282 : ExponentCertificate 1282 413 412 := by decide
private theorem cert_1283 : ExponentCertificate 1283 413 412 := by decide
private theorem cert_1284 : ExponentCertificate 1284 413 413 := by decide
private theorem cert_1285 : ExponentCertificate 1285 414 413 := by decide
private theorem cert_1286 : ExponentCertificate 1286 414 413 := by decide
private theorem cert_1287 : ExponentCertificate 1287 414 413 := by decide
private theorem cert_1288 : ExponentCertificate 1288 414 414 := by decide
private theorem cert_1289 : ExponentCertificate 1289 415 414 := by decide
private theorem cert_1290 : ExponentCertificate 1290 415 414 := by decide
private theorem cert_1291 : ExponentCertificate 1291 415 414 := by decide
private theorem cert_1292 : ExponentCertificate 1292 415 415 := by decide
private theorem cert_1293 : ExponentCertificate 1293 416 415 := by decide
private theorem cert_1294 : ExponentCertificate 1294 416 415 := by decide
private theorem cert_1295 : ExponentCertificate 1295 416 416 := by decide
private theorem cert_1296 : ExponentCertificate 1296 417 416 := by decide
private theorem cert_1297 : ExponentCertificate 1297 417 416 := by decide
private theorem cert_1298 : ExponentCertificate 1298 417 416 := by decide
private theorem cert_1299 : ExponentCertificate 1299 417 417 := by decide
private theorem cert_1300 : ExponentCertificate 1300 418 417 := by decide

private theorem certificates_1201_1300 {k : ℕ} (hlo : 1201 ≤ k) (hhi : k ≤ 1300) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨390, 389, cert_1201⟩
  · exact ⟨390, 390, cert_1202⟩
  · exact ⟨391, 390, cert_1203⟩
  · exact ⟨391, 390, cert_1204⟩
  · exact ⟨391, 391, cert_1205⟩
  · exact ⟨392, 391, cert_1206⟩
  · exact ⟨392, 391, cert_1207⟩
  · exact ⟨392, 391, cert_1208⟩
  · exact ⟨392, 392, cert_1209⟩
  · exact ⟨393, 392, cert_1210⟩
  · exact ⟨393, 392, cert_1211⟩
  · exact ⟨393, 393, cert_1212⟩
  · exact ⟨394, 393, cert_1213⟩
  · exact ⟨394, 393, cert_1214⟩
  · exact ⟨394, 393, cert_1215⟩
  · exact ⟨394, 394, cert_1216⟩
  · exact ⟨395, 394, cert_1217⟩
  · exact ⟨395, 394, cert_1218⟩
  · exact ⟨395, 395, cert_1219⟩
  · exact ⟨395, 395, cert_1220⟩
  · exact ⟨396, 395, cert_1221⟩
  · exact ⟨396, 395, cert_1222⟩
  · exact ⟨396, 396, cert_1223⟩
  · exact ⟨397, 396, cert_1224⟩
  · exact ⟨397, 396, cert_1225⟩
  · exact ⟨397, 396, cert_1226⟩
  · exact ⟨397, 397, cert_1227⟩
  · exact ⟨398, 397, cert_1228⟩
  · exact ⟨398, 397, cert_1229⟩
  · exact ⟨398, 398, cert_1230⟩
  · exact ⟨399, 398, cert_1231⟩
  · exact ⟨399, 398, cert_1232⟩
  · exact ⟨399, 398, cert_1233⟩
  · exact ⟨399, 399, cert_1234⟩
  · exact ⟨400, 399, cert_1235⟩
  · exact ⟨400, 399, cert_1236⟩
  · exact ⟨400, 400, cert_1237⟩
  · exact ⟨400, 400, cert_1238⟩
  · exact ⟨401, 400, cert_1239⟩
  · exact ⟨401, 400, cert_1240⟩
  · exact ⟨401, 401, cert_1241⟩
  · exact ⟨402, 401, cert_1242⟩
  · exact ⟨402, 401, cert_1243⟩
  · exact ⟨402, 401, cert_1244⟩
  · exact ⟨402, 402, cert_1245⟩
  · exact ⟨403, 402, cert_1246⟩
  · exact ⟨403, 402, cert_1247⟩
  · exact ⟨403, 403, cert_1248⟩
  · exact ⟨404, 403, cert_1249⟩
  · exact ⟨404, 403, cert_1250⟩
  · exact ⟨404, 403, cert_1251⟩
  · exact ⟨404, 404, cert_1252⟩
  · exact ⟨405, 404, cert_1253⟩
  · exact ⟨405, 404, cert_1254⟩
  · exact ⟨405, 405, cert_1255⟩
  · exact ⟨405, 405, cert_1256⟩
  · exact ⟨406, 405, cert_1257⟩
  · exact ⟨406, 405, cert_1258⟩
  · exact ⟨406, 406, cert_1259⟩
  · exact ⟨407, 406, cert_1260⟩
  · exact ⟨407, 406, cert_1261⟩
  · exact ⟨407, 406, cert_1262⟩
  · exact ⟨407, 407, cert_1263⟩
  · exact ⟨408, 407, cert_1264⟩
  · exact ⟨408, 407, cert_1265⟩
  · exact ⟨408, 408, cert_1266⟩
  · exact ⟨409, 408, cert_1267⟩
  · exact ⟨409, 408, cert_1268⟩
  · exact ⟨409, 408, cert_1269⟩
  · exact ⟨409, 409, cert_1270⟩
  · exact ⟨410, 409, cert_1271⟩
  · exact ⟨410, 409, cert_1272⟩
  · exact ⟨410, 410, cert_1273⟩
  · exact ⟨410, 410, cert_1274⟩
  · exact ⟨411, 410, cert_1275⟩
  · exact ⟨411, 410, cert_1276⟩
  · exact ⟨411, 411, cert_1277⟩
  · exact ⟨412, 411, cert_1278⟩
  · exact ⟨412, 411, cert_1279⟩
  · exact ⟨412, 411, cert_1280⟩
  · exact ⟨412, 412, cert_1281⟩
  · exact ⟨413, 412, cert_1282⟩
  · exact ⟨413, 412, cert_1283⟩
  · exact ⟨413, 413, cert_1284⟩
  · exact ⟨414, 413, cert_1285⟩
  · exact ⟨414, 413, cert_1286⟩
  · exact ⟨414, 413, cert_1287⟩
  · exact ⟨414, 414, cert_1288⟩
  · exact ⟨415, 414, cert_1289⟩
  · exact ⟨415, 414, cert_1290⟩
  · exact ⟨415, 414, cert_1291⟩
  · exact ⟨415, 415, cert_1292⟩
  · exact ⟨416, 415, cert_1293⟩
  · exact ⟨416, 415, cert_1294⟩
  · exact ⟨416, 416, cert_1295⟩
  · exact ⟨417, 416, cert_1296⟩
  · exact ⟨417, 416, cert_1297⟩
  · exact ⟨417, 416, cert_1298⟩
  · exact ⟨417, 417, cert_1299⟩
  · exact ⟨418, 417, cert_1300⟩

theorem no_fixed_digitCount_1201_1300 {n : ℕ} (hn : a n = n)
    (hlo : 1201 ≤ digitCount n) (hhi : digitCount n ≤ 1300) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_1201_1300 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_1201_1300
end OeisA113010
