import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 5301
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_5201 : ExponentCertificate 5201 1400 1399 := by decide
private theorem cert_5202 : ExponentCertificate 5202 1400 1399 := by decide
private theorem cert_5203 : ExponentCertificate 5203 1400 1400 := by decide
private theorem cert_5204 : ExponentCertificate 5204 1401 1400 := by decide
private theorem cert_5205 : ExponentCertificate 5205 1401 1400 := by decide
private theorem cert_5206 : ExponentCertificate 5206 1401 1400 := by decide
private theorem cert_5207 : ExponentCertificate 5207 1401 1401 := by decide
private theorem cert_5208 : ExponentCertificate 5208 1401 1401 := by decide
private theorem cert_5209 : ExponentCertificate 5209 1402 1401 := by decide
private theorem cert_5210 : ExponentCertificate 5210 1402 1401 := by decide
private theorem cert_5211 : ExponentCertificate 5211 1402 1401 := by decide
private theorem cert_5212 : ExponentCertificate 5212 1402 1402 := by decide
private theorem cert_5213 : ExponentCertificate 5213 1403 1402 := by decide
private theorem cert_5214 : ExponentCertificate 5214 1403 1402 := by decide
private theorem cert_5215 : ExponentCertificate 5215 1403 1402 := by decide
private theorem cert_5216 : ExponentCertificate 5216 1403 1403 := by decide
private theorem cert_5217 : ExponentCertificate 5217 1404 1403 := by decide
private theorem cert_5218 : ExponentCertificate 5218 1404 1403 := by decide
private theorem cert_5219 : ExponentCertificate 5219 1404 1403 := by decide
private theorem suffix_5220 : 1404 < digitSum ((522 : ℕ) ^ 1404 % 10 ^ 351) := by
  have hmod : (522 : ℕ) ^ 1404 % 10 ^ 351 = 222942148787143793998801403779424968868678053263663803869386805092179801736908068208525029121779425783022366170134638126145076047995635496367063449549159565347460840341583172985988686419762192996588997842142209301559832652967613209312600426370536236297094586078146563792651024975197531774640534060795895929493497508044472265065092129457714718893408256 := by
    have h1 : (522 : ℕ) ^ 1 % 10 ^ 351 = 522 := by decide
    have h2 : (522 : ℕ) ^ 2 % 10 ^ 351 = 272484 := by
      have step := pow_mod_double (k := 522) (e := 1) (m := 10 ^ 351) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (522 : ℕ) ^ 5 % 10 ^ 351 = 38757210793632 := by
      have step := pow_mod_double_add_one (k := 522) (e := 2) (m := 10 ^ 351) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (522 : ℕ) ^ 10 % 10 ^ 351 = 1502121388502024803291751424 := by
      have step := pow_mod_double (k := 522) (e := 5) (m := 10 ^ 351) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (522 : ℕ) ^ 21 % 10 ^ 351 = 1177824443545120986981157140589233731879978591125946499072 := by
      have step := pow_mod_double_add_one (k := 522) (e := 10) (m := 10 ^ 351) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h43 : (522 : ℕ) ^ 43 % 10 ^ 351 = 724155159142059173197589990490322622199485029429455749394348157350502114081583741420987221215819103492361500961538048 := by
      have step := pow_mod_double_add_one (k := 522) (e := 21) (m := 10 ^ 351) h21
      have he : 2 * 21 + 1 = 43 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h87 : (522 : ℕ) ^ 87 % 10 ^ 351 = 273737162535295866705633310107424759672299046010331760823061619724358307791894509152410534435286389326955686354211579246897612190297080668046413270532425082048967126517137109891187565998468550319076139992192510988591526265416066361458688 := by
      have step := pow_mod_double_add_one (k := 522) (e := 43) (m := 10 ^ 351) h43
      have he : 2 * 43 + 1 = 87 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h175 : (522 : ℕ) ^ 175 % 10 ^ 351 = 395969671098720232034270245440520213492699508551889281074710799358298085630557754134944900912536520956308884836886885397474511791325286036837270646183006783059900216056756353440964841770857680742495587743049285547415365835534390781910514546040131039046527579329412434548547748289808270124236505829376177506835680520988859285553021454263133946215661568 := by
      have step := pow_mod_double_add_one (k := 522) (e := 87) (m := 10 ^ 351) h87
      have he : 2 * 87 + 1 = 175 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h351 : (522 : ℕ) ^ 351 % 10 ^ 351 = 804433100381698588201601332053660136718439278400259155183330996112522768138369472907197287735527355418642217914405622654972686488724516339871325366586850976168671045026681592815737333265007534071769161444043307902990149457438802468721323497964997553826085714090398925655957518765083492427424582007805946426204871840110524021036110625754544450178121728 := by
      have step := pow_mod_double_add_one (k := 522) (e := 175) (m := 10 ^ 351) h175
      have he : 2 * 175 + 1 = 351 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h702 : (522 : ℕ) ^ 702 % 10 ^ 351 = 265357740800756926592466484896566481453480432885464329868081266857719717731151264609565401427933310014779026509867521323779444786024323039012999553417726473635564191065637905227559902312690870907130523871137947766523471035237925855357166702006961443698761507957776710387144412985453930819197241176008389308924904168153820577142924022605346549985705984 := by
      have step := pow_mod_double (k := 522) (e := 351) (m := 10 ^ 351) h351
      have he : 2 * 351 = 702 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1404 : (522 : ℕ) ^ 1404 % 10 ^ 351 = 222942148787143793998801403779424968868678053263663803869386805092179801736908068208525029121779425783022366170134638126145076047995635496367063449549159565347460840341583172985988686419762192996588997842142209301559832652967613209312600426370536236297094586078146563792651024975197531774640534060795895929493497508044472265065092129457714718893408256 := by
      have step := pow_mod_double (k := 522) (e := 702) (m := 10 ^ 351) h702
      have he : 2 * 702 = 1404 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1404
  rw [hmod]
  decide
private theorem cert_5220 : ExponentCertificate 5220 1404 1404 :=
  exponentCertificate_of_normalized_suffix (t := 1) (u := 522) (by decide) (by decide) (by decide) suffix_5220
private theorem cert_5221 : ExponentCertificate 5221 1405 1404 := by decide
private theorem cert_5222 : ExponentCertificate 5222 1405 1404 := by decide
private theorem cert_5223 : ExponentCertificate 5223 1405 1404 := by decide
private theorem cert_5224 : ExponentCertificate 5224 1405 1405 := by decide
private theorem cert_5225 : ExponentCertificate 5225 1406 1405 := by decide
private theorem cert_5226 : ExponentCertificate 5226 1406 1405 := by decide
private theorem cert_5227 : ExponentCertificate 5227 1406 1405 := by decide
private theorem cert_5228 : ExponentCertificate 5228 1406 1406 := by decide
private theorem cert_5229 : ExponentCertificate 5229 1406 1406 := by decide
private theorem cert_5230 : ExponentCertificate 5230 1407 1406 := by decide
private theorem cert_5231 : ExponentCertificate 5231 1407 1406 := by decide
private theorem cert_5232 : ExponentCertificate 5232 1407 1406 := by decide
private theorem cert_5233 : ExponentCertificate 5233 1407 1407 := by decide
private theorem cert_5234 : ExponentCertificate 5234 1408 1407 := by decide
private theorem cert_5235 : ExponentCertificate 5235 1408 1407 := by decide
private theorem cert_5236 : ExponentCertificate 5236 1408 1407 := by decide
private theorem cert_5237 : ExponentCertificate 5237 1408 1408 := by decide
private theorem cert_5238 : ExponentCertificate 5238 1409 1408 := by decide
private theorem cert_5239 : ExponentCertificate 5239 1409 1408 := by decide
private theorem cert_5240 : ExponentCertificate 5240 1409 1408 := by decide
private theorem cert_5241 : ExponentCertificate 5241 1409 1409 := by decide
private theorem cert_5242 : ExponentCertificate 5242 1410 1409 := by decide
private theorem cert_5243 : ExponentCertificate 5243 1410 1409 := by decide
private theorem cert_5244 : ExponentCertificate 5244 1410 1409 := by decide
private theorem cert_5245 : ExponentCertificate 5245 1410 1410 := by decide
private theorem cert_5246 : ExponentCertificate 5246 1411 1410 := by decide
private theorem cert_5247 : ExponentCertificate 5247 1411 1410 := by decide
private theorem cert_5248 : ExponentCertificate 5248 1411 1410 := by decide
private theorem cert_5249 : ExponentCertificate 5249 1411 1410 := by decide
private theorem cert_5250 : ExponentCertificate 5250 1411 1411 := by decide
private theorem cert_5251 : ExponentCertificate 5251 1412 1411 := by decide
private theorem cert_5252 : ExponentCertificate 5252 1412 1411 := by decide
private theorem cert_5253 : ExponentCertificate 5253 1412 1411 := by decide
private theorem cert_5254 : ExponentCertificate 5254 1412 1412 := by decide
private theorem cert_5255 : ExponentCertificate 5255 1413 1412 := by decide
private theorem cert_5256 : ExponentCertificate 5256 1413 1412 := by decide
private theorem cert_5257 : ExponentCertificate 5257 1413 1412 := by decide
private theorem cert_5258 : ExponentCertificate 5258 1413 1413 := by decide
private theorem cert_5259 : ExponentCertificate 5259 1414 1413 := by decide
private theorem cert_5260 : ExponentCertificate 5260 1414 1413 := by decide
private theorem cert_5261 : ExponentCertificate 5261 1414 1413 := by decide
private theorem cert_5262 : ExponentCertificate 5262 1414 1414 := by decide
private theorem cert_5263 : ExponentCertificate 5263 1415 1414 := by decide
private theorem cert_5264 : ExponentCertificate 5264 1415 1414 := by decide
private theorem cert_5265 : ExponentCertificate 5265 1415 1414 := by decide
private theorem cert_5266 : ExponentCertificate 5266 1415 1415 := by decide
private theorem cert_5267 : ExponentCertificate 5267 1415 1415 := by decide
private theorem cert_5268 : ExponentCertificate 5268 1416 1415 := by decide
private theorem cert_5269 : ExponentCertificate 5269 1416 1415 := by decide
private theorem cert_5270 : ExponentCertificate 5270 1416 1415 := by decide
private theorem cert_5271 : ExponentCertificate 5271 1416 1416 := by decide
private theorem cert_5272 : ExponentCertificate 5272 1417 1416 := by decide
private theorem cert_5273 : ExponentCertificate 5273 1417 1416 := by decide
private theorem cert_5274 : ExponentCertificate 5274 1417 1416 := by decide
private theorem cert_5275 : ExponentCertificate 5275 1417 1417 := by decide
private theorem cert_5276 : ExponentCertificate 5276 1418 1417 := by decide
private theorem cert_5277 : ExponentCertificate 5277 1418 1417 := by decide
private theorem cert_5278 : ExponentCertificate 5278 1418 1417 := by decide
private theorem cert_5279 : ExponentCertificate 5279 1418 1418 := by decide
private theorem cert_5280 : ExponentCertificate 5280 1419 1418 := by decide
private theorem cert_5281 : ExponentCertificate 5281 1419 1418 := by decide
private theorem cert_5282 : ExponentCertificate 5282 1419 1418 := by decide
private theorem cert_5283 : ExponentCertificate 5283 1419 1419 := by decide
private theorem cert_5284 : ExponentCertificate 5284 1420 1419 := by decide
private theorem cert_5285 : ExponentCertificate 5285 1420 1419 := by decide
private theorem cert_5286 : ExponentCertificate 5286 1420 1419 := by decide
private theorem cert_5287 : ExponentCertificate 5287 1420 1420 := by decide
private theorem cert_5288 : ExponentCertificate 5288 1420 1420 := by decide
private theorem cert_5289 : ExponentCertificate 5289 1421 1420 := by decide
private theorem cert_5290 : ExponentCertificate 5290 1421 1420 := by decide
private theorem cert_5291 : ExponentCertificate 5291 1421 1420 := by decide
private theorem cert_5292 : ExponentCertificate 5292 1421 1421 := by decide
private theorem cert_5293 : ExponentCertificate 5293 1422 1421 := by decide
private theorem cert_5294 : ExponentCertificate 5294 1422 1421 := by decide
private theorem cert_5295 : ExponentCertificate 5295 1422 1421 := by decide
private theorem cert_5296 : ExponentCertificate 5296 1422 1422 := by decide
private theorem cert_5297 : ExponentCertificate 5297 1423 1422 := by decide
private theorem cert_5298 : ExponentCertificate 5298 1423 1422 := by decide
private theorem cert_5299 : ExponentCertificate 5299 1423 1422 := by decide
private theorem cert_5300 : ExponentCertificate 5300 1423 1423 := by decide

private theorem certificates_5201_5300 {k : ℕ} (hlo : 5201 ≤ k) (hhi : k ≤ 5300) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1400, 1399, cert_5201⟩
  · exact ⟨1400, 1399, cert_5202⟩
  · exact ⟨1400, 1400, cert_5203⟩
  · exact ⟨1401, 1400, cert_5204⟩
  · exact ⟨1401, 1400, cert_5205⟩
  · exact ⟨1401, 1400, cert_5206⟩
  · exact ⟨1401, 1401, cert_5207⟩
  · exact ⟨1401, 1401, cert_5208⟩
  · exact ⟨1402, 1401, cert_5209⟩
  · exact ⟨1402, 1401, cert_5210⟩
  · exact ⟨1402, 1401, cert_5211⟩
  · exact ⟨1402, 1402, cert_5212⟩
  · exact ⟨1403, 1402, cert_5213⟩
  · exact ⟨1403, 1402, cert_5214⟩
  · exact ⟨1403, 1402, cert_5215⟩
  · exact ⟨1403, 1403, cert_5216⟩
  · exact ⟨1404, 1403, cert_5217⟩
  · exact ⟨1404, 1403, cert_5218⟩
  · exact ⟨1404, 1403, cert_5219⟩
  · exact ⟨1404, 1404, cert_5220⟩
  · exact ⟨1405, 1404, cert_5221⟩
  · exact ⟨1405, 1404, cert_5222⟩
  · exact ⟨1405, 1404, cert_5223⟩
  · exact ⟨1405, 1405, cert_5224⟩
  · exact ⟨1406, 1405, cert_5225⟩
  · exact ⟨1406, 1405, cert_5226⟩
  · exact ⟨1406, 1405, cert_5227⟩
  · exact ⟨1406, 1406, cert_5228⟩
  · exact ⟨1406, 1406, cert_5229⟩
  · exact ⟨1407, 1406, cert_5230⟩
  · exact ⟨1407, 1406, cert_5231⟩
  · exact ⟨1407, 1406, cert_5232⟩
  · exact ⟨1407, 1407, cert_5233⟩
  · exact ⟨1408, 1407, cert_5234⟩
  · exact ⟨1408, 1407, cert_5235⟩
  · exact ⟨1408, 1407, cert_5236⟩
  · exact ⟨1408, 1408, cert_5237⟩
  · exact ⟨1409, 1408, cert_5238⟩
  · exact ⟨1409, 1408, cert_5239⟩
  · exact ⟨1409, 1408, cert_5240⟩
  · exact ⟨1409, 1409, cert_5241⟩
  · exact ⟨1410, 1409, cert_5242⟩
  · exact ⟨1410, 1409, cert_5243⟩
  · exact ⟨1410, 1409, cert_5244⟩
  · exact ⟨1410, 1410, cert_5245⟩
  · exact ⟨1411, 1410, cert_5246⟩
  · exact ⟨1411, 1410, cert_5247⟩
  · exact ⟨1411, 1410, cert_5248⟩
  · exact ⟨1411, 1410, cert_5249⟩
  · exact ⟨1411, 1411, cert_5250⟩
  · exact ⟨1412, 1411, cert_5251⟩
  · exact ⟨1412, 1411, cert_5252⟩
  · exact ⟨1412, 1411, cert_5253⟩
  · exact ⟨1412, 1412, cert_5254⟩
  · exact ⟨1413, 1412, cert_5255⟩
  · exact ⟨1413, 1412, cert_5256⟩
  · exact ⟨1413, 1412, cert_5257⟩
  · exact ⟨1413, 1413, cert_5258⟩
  · exact ⟨1414, 1413, cert_5259⟩
  · exact ⟨1414, 1413, cert_5260⟩
  · exact ⟨1414, 1413, cert_5261⟩
  · exact ⟨1414, 1414, cert_5262⟩
  · exact ⟨1415, 1414, cert_5263⟩
  · exact ⟨1415, 1414, cert_5264⟩
  · exact ⟨1415, 1414, cert_5265⟩
  · exact ⟨1415, 1415, cert_5266⟩
  · exact ⟨1415, 1415, cert_5267⟩
  · exact ⟨1416, 1415, cert_5268⟩
  · exact ⟨1416, 1415, cert_5269⟩
  · exact ⟨1416, 1415, cert_5270⟩
  · exact ⟨1416, 1416, cert_5271⟩
  · exact ⟨1417, 1416, cert_5272⟩
  · exact ⟨1417, 1416, cert_5273⟩
  · exact ⟨1417, 1416, cert_5274⟩
  · exact ⟨1417, 1417, cert_5275⟩
  · exact ⟨1418, 1417, cert_5276⟩
  · exact ⟨1418, 1417, cert_5277⟩
  · exact ⟨1418, 1417, cert_5278⟩
  · exact ⟨1418, 1418, cert_5279⟩
  · exact ⟨1419, 1418, cert_5280⟩
  · exact ⟨1419, 1418, cert_5281⟩
  · exact ⟨1419, 1418, cert_5282⟩
  · exact ⟨1419, 1419, cert_5283⟩
  · exact ⟨1420, 1419, cert_5284⟩
  · exact ⟨1420, 1419, cert_5285⟩
  · exact ⟨1420, 1419, cert_5286⟩
  · exact ⟨1420, 1420, cert_5287⟩
  · exact ⟨1420, 1420, cert_5288⟩
  · exact ⟨1421, 1420, cert_5289⟩
  · exact ⟨1421, 1420, cert_5290⟩
  · exact ⟨1421, 1420, cert_5291⟩
  · exact ⟨1421, 1421, cert_5292⟩
  · exact ⟨1422, 1421, cert_5293⟩
  · exact ⟨1422, 1421, cert_5294⟩
  · exact ⟨1422, 1421, cert_5295⟩
  · exact ⟨1422, 1422, cert_5296⟩
  · exact ⟨1423, 1422, cert_5297⟩
  · exact ⟨1423, 1422, cert_5298⟩
  · exact ⟨1423, 1422, cert_5299⟩
  · exact ⟨1423, 1423, cert_5300⟩

theorem no_fixed_digitCount_5201_5300 {n : ℕ} (hn : a n = n)
    (hlo : 5201 ≤ digitCount n) (hhi : digitCount n ≤ 5300) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_5201_5300 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_5201_5300
end OeisA113010
