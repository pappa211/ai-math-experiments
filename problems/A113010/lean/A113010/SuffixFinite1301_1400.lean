import A113010.SuffixFiniteCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2100
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_1301 : ExponentCertificate 1301 418 417 := by decide
private theorem cert_1302 : ExponentCertificate 1302 418 418 := by decide
private theorem cert_1303 : ExponentCertificate 1303 418 418 := by decide
private theorem cert_1304 : ExponentCertificate 1304 419 418 := by decide
private theorem cert_1305 : ExponentCertificate 1305 419 418 := by decide
private theorem cert_1306 : ExponentCertificate 1306 419 419 := by decide
private theorem cert_1307 : ExponentCertificate 1307 420 419 := by decide
private theorem cert_1308 : ExponentCertificate 1308 420 419 := by decide
private theorem cert_1309 : ExponentCertificate 1309 420 419 := by decide
private theorem cert_1310 : ExponentCertificate 1310 420 420 := by decide
private theorem cert_1311 : ExponentCertificate 1311 421 420 := by decide
private theorem cert_1312 : ExponentCertificate 1312 421 420 := by decide
private theorem cert_1313 : ExponentCertificate 1313 421 421 := by decide
private theorem cert_1314 : ExponentCertificate 1314 422 421 := by decide
private theorem cert_1315 : ExponentCertificate 1315 422 421 := by decide
private theorem cert_1316 : ExponentCertificate 1316 422 421 := by decide
private theorem cert_1317 : ExponentCertificate 1317 422 422 := by decide
private theorem cert_1318 : ExponentCertificate 1318 423 422 := by decide
private theorem cert_1319 : ExponentCertificate 1319 423 422 := by decide
private theorem cert_1320 : ExponentCertificate 1320 423 422 := by decide
private theorem cert_1321 : ExponentCertificate 1321 423 423 := by decide
private theorem cert_1322 : ExponentCertificate 1322 424 423 := by decide
private theorem cert_1323 : ExponentCertificate 1323 424 423 := by decide
private theorem suffix_1324 : 424 < digitSum ((1324 : ℕ) ^ 424 % 10 ^ 106) := by
  have hmod : (1324 : ℕ) ^ 424 % 10 ^ 106 = 9259228986195483257876164743969055146890753896571679319899820953627510015265042033049268210373936677912576 := by
    have h1 : (1324 : ℕ) ^ 1 % 10 ^ 106 = 1324 := by decide
    have h3 : (1324 : ℕ) ^ 3 % 10 ^ 106 = 2320940224 := by
      have step := pow_mod_double_add_one (k := 1324) (e := 1) (m := 10 ^ 106) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (1324 : ℕ) ^ 6 % 10 ^ 106 = 5386763523381170176 := by
      have step := pow_mod_double (k := 1324) (e := 3) (m := 10 ^ 106) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h13 : (1324 : ℕ) ^ 13 % 10 ^ 106 = 38418800944042812397738668937971157172224 := by
      have step := pow_mod_double_add_one (k := 1324) (e := 6) (m := 10 ^ 106) h6
      have he : 2 * 6 + 1 = 13 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h26 : (1324 : ℕ) ^ 26 % 10 ^ 106 = 1476004265977984893109316388220259675211217174469648739763932402264938115997106176 := by
      have step := pow_mod_double (k := 1324) (e := 13) (m := 10 ^ 106) h13
      have he : 2 * 13 = 26 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h53 : (1324 : ℕ) ^ 53 % 10 ^ 106 = 4727570849857333687062469273769313509785316375862916131650811281867769569834521651883070289981031762100224 := by
      have step := pow_mod_double_add_one (k := 1324) (e := 26) (m := 10 ^ 106) h26
      have he : 2 * 26 + 1 = 53 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h106 : (1324 : ℕ) ^ 106 % 10 ^ 106 = 329590686265026604318138070207559117405134375225543694318867783737196731845214119427538942498639420850176 := by
      have step := pow_mod_double (k := 1324) (e := 53) (m := 10 ^ 106) h53
      have he : 2 * 53 = 106 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h212 : (1324 : ℕ) ^ 212 % 10 ^ 106 = 7713621055632637824663914847749069751171574987403716145160983729876887270382778083247133382935798639230976 := by
      have step := pow_mod_double (k := 1324) (e := 106) (m := 10 ^ 106) h106
      have he : 2 * 106 = 212 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h424 : (1324 : ℕ) ^ 424 % 10 ^ 106 = 9259228986195483257876164743969055146890753896571679319899820953627510015265042033049268210373936677912576 := by
      have step := pow_mod_double (k := 1324) (e := 212) (m := 10 ^ 106) h212
      have he : 2 * 212 = 424 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h424
  rw [hmod]
  decide
private theorem cert_1324 : ExponentCertificate 1324 424 424 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1324
private theorem cert_1325 : ExponentCertificate 1325 425 424 := by decide
private theorem cert_1326 : ExponentCertificate 1326 425 424 := by decide
private theorem cert_1327 : ExponentCertificate 1327 425 424 := by decide
private theorem suffix_1328 : 425 < digitSum ((1328 : ℕ) ^ 425 % 10 ^ 107) := by
  have hmod : (1328 : ℕ) ^ 425 % 10 ^ 107 = 77390530331811184231478543360928852870891010498364013872214095948358002181094696857622299998419351993581568 := by
    have h1 : (1328 : ℕ) ^ 1 % 10 ^ 107 = 1328 := by decide
    have h3 : (1328 : ℕ) ^ 3 % 10 ^ 107 = 2342039552 := by
      have step := pow_mod_double_add_one (k := 1328) (e := 1) (m := 10 ^ 107) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (1328 : ℕ) ^ 6 % 10 ^ 107 = 5485149263132360704 := by
      have step := pow_mod_double (k := 1328) (e := 3) (m := 10 ^ 107) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h13 : (1328 : ℕ) ^ 13 % 10 ^ 107 = 39955353318781484915452007324431362818048 := by
      have step := pow_mod_double_add_one (k := 1328) (e := 6) (m := 10 ^ 107) h6
      have he : 2 * 6 + 1 = 13 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h26 : (1328 : ℕ) ^ 26 % 10 ^ 107 = 1596430258828662620943755339313036940706941526778260402774144024647898311954530304 := by
      have step := pow_mod_double (k := 1328) (e := 13) (m := 10 ^ 107) h13
      have he : 2 * 13 = 26 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h53 : (1328 : ℕ) ^ 53 % 10 ^ 107 = 9115170982485386487692811265123908087181082723459358689464344867826257787016079272415468316459329753448448 := by
      have step := pow_mod_double_add_one (k := 1328) (e := 26) (m := 10 ^ 107) h26
      have he : 2 * 26 + 1 = 53 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h106 : (1328 : ℕ) ^ 106 % 10 ^ 107 = 32164049994481106822255682540012783412308036803909731682551316049728197482841258539589150148027347793608704 := by
      have step := pow_mod_double (k := 1328) (e := 53) (m := 10 ^ 107) h53
      have he : 2 * 53 = 106 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h212 : (1328 : ℕ) ^ 212 % 10 ^ 107 = 40822741076505305677908281393786575635917767648173621245850378558462879565546751742733191648271351064559616 := by
      have step := pow_mod_double (k := 1328) (e := 106) (m := 10 ^ 107) h106
      have he : 2 * 106 = 212 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h425 : (1328 : ℕ) ^ 425 % 10 ^ 107 = 77390530331811184231478543360928852870891010498364013872214095948358002181094696857622299998419351993581568 := by
      have step := pow_mod_double_add_one (k := 1328) (e := 212) (m := 10 ^ 107) h212
      have he : 2 * 212 + 1 = 425 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h425
  rw [hmod]
  decide
private theorem cert_1328 : ExponentCertificate 1328 425 425 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1328
private theorem cert_1329 : ExponentCertificate 1329 426 425 := by decide
private theorem cert_1330 : ExponentCertificate 1330 426 425 := by decide
private theorem cert_1331 : ExponentCertificate 1331 426 426 := by decide
private theorem cert_1332 : ExponentCertificate 1332 426 426 := by decide
private theorem cert_1333 : ExponentCertificate 1333 427 426 := by decide
private theorem cert_1334 : ExponentCertificate 1334 427 426 := by decide
private theorem cert_1335 : ExponentCertificate 1335 427 427 := by decide
private theorem cert_1336 : ExponentCertificate 1336 428 427 := by decide
private theorem cert_1337 : ExponentCertificate 1337 428 427 := by decide
private theorem cert_1338 : ExponentCertificate 1338 428 427 := by decide
private theorem cert_1339 : ExponentCertificate 1339 428 428 := by decide
private theorem cert_1340 : ExponentCertificate 1340 429 428 := by decide
private theorem cert_1341 : ExponentCertificate 1341 429 428 := by decide
private theorem cert_1342 : ExponentCertificate 1342 429 429 := by decide
private theorem cert_1343 : ExponentCertificate 1343 430 429 := by decide
private theorem cert_1344 : ExponentCertificate 1344 430 429 := by decide
private theorem cert_1345 : ExponentCertificate 1345 430 429 := by decide
private theorem cert_1346 : ExponentCertificate 1346 430 430 := by decide
private theorem cert_1347 : ExponentCertificate 1347 431 430 := by decide
private theorem cert_1348 : ExponentCertificate 1348 431 430 := by decide
private theorem cert_1349 : ExponentCertificate 1349 431 430 := by decide
private theorem cert_1350 : ExponentCertificate 1350 431 431 := by decide
private theorem cert_1351 : ExponentCertificate 1351 432 431 := by decide
private theorem cert_1352 : ExponentCertificate 1352 432 431 := by decide
private theorem suffix_1353 : 432 < digitSum ((1353 : ℕ) ^ 432 % 10 ^ 108) := by
  have hmod : (1353 : ℕ) ^ 432 % 10 ^ 108 = 281914942509756883338370365500494687714417170132069330657588137905268362670162922175675369772177322194490241 := by
    have h1 : (1353 : ℕ) ^ 1 % 10 ^ 108 = 1353 := by decide
    have h3 : (1353 : ℕ) ^ 3 % 10 ^ 108 = 2476813977 := by
      have step := pow_mod_double_add_one (k := 1353) (e := 1) (m := 10 ^ 108) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (1353 : ℕ) ^ 6 % 10 ^ 108 = 6134607476662556529 := by
      have step := pow_mod_double (k := 1353) (e := 3) (m := 10 ^ 108) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h13 : (1353 : ℕ) ^ 13 % 10 ^ 108 = 50918002231855760132743626737149074168873 := by
      have step := pow_mod_double_add_one (k := 1353) (e := 6) (m := 10 ^ 108) h6
      have he : 2 * 6 + 1 = 13 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h27 : (1353 : ℕ) ^ 27 % 10 ^ 108 = 3507845913086261834088763555680411667654273716333725184539857347045614568751987944537 := by
      have step := pow_mod_double_add_one (k := 1353) (e := 13) (m := 10 ^ 108) h13
      have he : 2 * 13 + 1 = 27 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h54 : (1353 : ℕ) ^ 54 % 10 ^ 108 = 271304512317832377045237816209835477727711579923929393807935654562440859553925885761706012298760982188144369 := by
      have step := pow_mod_double (k := 1353) (e := 27) (m := 10 ^ 108) h27
      have he : 2 * 27 = 54 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h108 : (1353 : ℕ) ^ 108 % 10 ^ 108 = 924288013364843237506828306243283845272045859003247540069052061128900370868910216460517572915819019586408161 := by
      have step := pow_mod_double (k := 1353) (e := 54) (m := 10 ^ 108) h54
      have he : 2 * 54 = 108 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h216 : (1353 : ℕ) ^ 216 % 10 ^ 108 = 571265173410818596893261052667508958190642626879395186884226703063584119098776289645620038825102649287401921 := by
      have step := pow_mod_double (k := 1353) (e := 108) (m := 10 ^ 108) h108
      have he : 2 * 108 = 216 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h432 : (1353 : ℕ) ^ 432 % 10 ^ 108 = 281914942509756883338370365500494687714417170132069330657588137905268362670162922175675369772177322194490241 := by
      have step := pow_mod_double (k := 1353) (e := 216) (m := 10 ^ 108) h216
      have he : 2 * 216 = 432 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h432
  rw [hmod]
  decide
private theorem cert_1353 : ExponentCertificate 1353 432 432 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1353
private theorem cert_1354 : ExponentCertificate 1354 433 432 := by decide
private theorem cert_1355 : ExponentCertificate 1355 433 432 := by decide
private theorem cert_1356 : ExponentCertificate 1356 433 432 := by decide
private theorem cert_1357 : ExponentCertificate 1357 433 433 := by decide
private theorem cert_1358 : ExponentCertificate 1358 434 433 := by decide
private theorem cert_1359 : ExponentCertificate 1359 434 433 := by decide
private theorem cert_1360 : ExponentCertificate 1360 434 434 := by decide
private theorem cert_1361 : ExponentCertificate 1361 434 434 := by decide
private theorem cert_1362 : ExponentCertificate 1362 435 434 := by decide
private theorem cert_1363 : ExponentCertificate 1363 435 434 := by decide
private theorem cert_1364 : ExponentCertificate 1364 435 435 := by decide
private theorem cert_1365 : ExponentCertificate 1365 436 435 := by decide
private theorem cert_1366 : ExponentCertificate 1366 436 435 := by decide
private theorem cert_1367 : ExponentCertificate 1367 436 435 := by decide
private theorem cert_1368 : ExponentCertificate 1368 436 436 := by decide
private theorem cert_1369 : ExponentCertificate 1369 437 436 := by decide
private theorem cert_1370 : ExponentCertificate 1370 437 436 := by decide
private theorem cert_1371 : ExponentCertificate 1371 437 437 := by decide
private theorem cert_1372 : ExponentCertificate 1372 437 437 := by decide
private theorem cert_1373 : ExponentCertificate 1373 438 437 := by decide
private theorem cert_1374 : ExponentCertificate 1374 438 437 := by decide
private theorem cert_1375 : ExponentCertificate 1375 438 438 := by decide
private theorem cert_1376 : ExponentCertificate 1376 439 438 := by decide
private theorem cert_1377 : ExponentCertificate 1377 439 438 := by decide
private theorem cert_1378 : ExponentCertificate 1378 439 438 := by decide
private theorem cert_1379 : ExponentCertificate 1379 439 439 := by decide
private theorem cert_1380 : ExponentCertificate 1380 440 439 := by decide
private theorem cert_1381 : ExponentCertificate 1381 440 439 := by decide
private theorem cert_1382 : ExponentCertificate 1382 440 440 := by decide
private theorem cert_1383 : ExponentCertificate 1383 441 440 := by decide
private theorem cert_1384 : ExponentCertificate 1384 441 440 := by decide
private theorem cert_1385 : ExponentCertificate 1385 441 440 := by decide
private theorem suffix_1386 : 441 < digitSum ((1386 : ℕ) ^ 441 % 10 ^ 111) := by
  have hmod : (1386 : ℕ) ^ 441 % 10 ^ 111 = 960891558794543483575768230715619176420763942317588007867894651127941075984080489828848309758889627505483841536 := by
    have h1 : (1386 : ℕ) ^ 1 % 10 ^ 111 = 1386 := by decide
    have h3 : (1386 : ℕ) ^ 3 % 10 ^ 111 = 2662500456 := by
      have step := pow_mod_double_add_one (k := 1386) (e := 1) (m := 10 ^ 111) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (1386 : ℕ) ^ 6 % 10 ^ 111 = 7088908678200207936 := by
      have step := pow_mod_double (k := 1386) (e := 3) (m := 10 ^ 111) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h13 : (1386 : ℕ) ^ 13 % 10 ^ 111 = 69650139979537035858143571121021408813056 := by
      have step := pow_mod_double_add_one (k := 1386) (e := 6) (m := 10 ^ 111) h6
      have he : 2 * 6 + 1 = 13 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h27 : (1386 : ℕ) ^ 27 % 10 ^ 111 = 6723682810848377265037847277417130033702654181318932072243590821029676254923897962496 := by
      have step := pow_mod_double_add_one (k := 1386) (e := 13) (m := 10 ^ 111) h13
      have he : 2 * 13 + 1 = 27 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h55 : (1386 : ℕ) ^ 55 % 10 ^ 111 = 183656144526393266481834978777548728520222331285688638037195238832550315830864235532823199569310152668454322176 := by
      have step := pow_mod_double_add_one (k := 1386) (e := 27) (m := 10 ^ 111) h27
      have he : 2 * 27 + 1 = 55 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h110 : (1386 : ℕ) ^ 110 % 10 ^ 111 = 715060343484873349005402212651766946004636665005029145284449705974503794494037305764690020982242339775605374976 := by
      have step := pow_mod_double (k := 1386) (e := 55) (m := 10 ^ 111) h55
      have he : 2 * 55 = 110 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h220 : (1386 : ℕ) ^ 220 % 10 ^ 111 = 666506773029517715352873521240125191882904291932134571876002270900316141823912812865675956360315419661567000576 := by
      have step := pow_mod_double (k := 1386) (e := 110) (m := 10 ^ 111) h110
      have he : 2 * 110 = 220 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h441 : (1386 : ℕ) ^ 441 % 10 ^ 111 = 960891558794543483575768230715619176420763942317588007867894651127941075984080489828848309758889627505483841536 := by
      have step := pow_mod_double_add_one (k := 1386) (e := 220) (m := 10 ^ 111) h220
      have he : 2 * 220 + 1 = 441 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h441
  rw [hmod]
  decide
private theorem cert_1386 : ExponentCertificate 1386 441 441 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1386
private theorem cert_1387 : ExponentCertificate 1387 442 441 := by decide
private theorem cert_1388 : ExponentCertificate 1388 442 441 := by decide
private theorem cert_1389 : ExponentCertificate 1389 442 441 := by decide
private theorem cert_1390 : ExponentCertificate 1390 442 442 := by decide
private theorem cert_1391 : ExponentCertificate 1391 443 442 := by decide
private theorem cert_1392 : ExponentCertificate 1392 443 442 := by decide
private theorem cert_1393 : ExponentCertificate 1393 443 443 := by decide
private theorem cert_1394 : ExponentCertificate 1394 444 443 := by decide
private theorem cert_1395 : ExponentCertificate 1395 444 443 := by decide
private theorem cert_1396 : ExponentCertificate 1396 444 443 := by decide
private theorem cert_1397 : ExponentCertificate 1397 444 444 := by decide
private theorem cert_1398 : ExponentCertificate 1398 445 444 := by decide
private theorem cert_1399 : ExponentCertificate 1399 445 444 := by decide
private theorem cert_1400 : ExponentCertificate 1400 445 444 := by decide

private theorem certificates_1301_1400 {k : ℕ} (hlo : 1301 ≤ k) (hhi : k ≤ 1400) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨418, 417, cert_1301⟩
  · exact ⟨418, 418, cert_1302⟩
  · exact ⟨418, 418, cert_1303⟩
  · exact ⟨419, 418, cert_1304⟩
  · exact ⟨419, 418, cert_1305⟩
  · exact ⟨419, 419, cert_1306⟩
  · exact ⟨420, 419, cert_1307⟩
  · exact ⟨420, 419, cert_1308⟩
  · exact ⟨420, 419, cert_1309⟩
  · exact ⟨420, 420, cert_1310⟩
  · exact ⟨421, 420, cert_1311⟩
  · exact ⟨421, 420, cert_1312⟩
  · exact ⟨421, 421, cert_1313⟩
  · exact ⟨422, 421, cert_1314⟩
  · exact ⟨422, 421, cert_1315⟩
  · exact ⟨422, 421, cert_1316⟩
  · exact ⟨422, 422, cert_1317⟩
  · exact ⟨423, 422, cert_1318⟩
  · exact ⟨423, 422, cert_1319⟩
  · exact ⟨423, 422, cert_1320⟩
  · exact ⟨423, 423, cert_1321⟩
  · exact ⟨424, 423, cert_1322⟩
  · exact ⟨424, 423, cert_1323⟩
  · exact ⟨424, 424, cert_1324⟩
  · exact ⟨425, 424, cert_1325⟩
  · exact ⟨425, 424, cert_1326⟩
  · exact ⟨425, 424, cert_1327⟩
  · exact ⟨425, 425, cert_1328⟩
  · exact ⟨426, 425, cert_1329⟩
  · exact ⟨426, 425, cert_1330⟩
  · exact ⟨426, 426, cert_1331⟩
  · exact ⟨426, 426, cert_1332⟩
  · exact ⟨427, 426, cert_1333⟩
  · exact ⟨427, 426, cert_1334⟩
  · exact ⟨427, 427, cert_1335⟩
  · exact ⟨428, 427, cert_1336⟩
  · exact ⟨428, 427, cert_1337⟩
  · exact ⟨428, 427, cert_1338⟩
  · exact ⟨428, 428, cert_1339⟩
  · exact ⟨429, 428, cert_1340⟩
  · exact ⟨429, 428, cert_1341⟩
  · exact ⟨429, 429, cert_1342⟩
  · exact ⟨430, 429, cert_1343⟩
  · exact ⟨430, 429, cert_1344⟩
  · exact ⟨430, 429, cert_1345⟩
  · exact ⟨430, 430, cert_1346⟩
  · exact ⟨431, 430, cert_1347⟩
  · exact ⟨431, 430, cert_1348⟩
  · exact ⟨431, 430, cert_1349⟩
  · exact ⟨431, 431, cert_1350⟩
  · exact ⟨432, 431, cert_1351⟩
  · exact ⟨432, 431, cert_1352⟩
  · exact ⟨432, 432, cert_1353⟩
  · exact ⟨433, 432, cert_1354⟩
  · exact ⟨433, 432, cert_1355⟩
  · exact ⟨433, 432, cert_1356⟩
  · exact ⟨433, 433, cert_1357⟩
  · exact ⟨434, 433, cert_1358⟩
  · exact ⟨434, 433, cert_1359⟩
  · exact ⟨434, 434, cert_1360⟩
  · exact ⟨434, 434, cert_1361⟩
  · exact ⟨435, 434, cert_1362⟩
  · exact ⟨435, 434, cert_1363⟩
  · exact ⟨435, 435, cert_1364⟩
  · exact ⟨436, 435, cert_1365⟩
  · exact ⟨436, 435, cert_1366⟩
  · exact ⟨436, 435, cert_1367⟩
  · exact ⟨436, 436, cert_1368⟩
  · exact ⟨437, 436, cert_1369⟩
  · exact ⟨437, 436, cert_1370⟩
  · exact ⟨437, 437, cert_1371⟩
  · exact ⟨437, 437, cert_1372⟩
  · exact ⟨438, 437, cert_1373⟩
  · exact ⟨438, 437, cert_1374⟩
  · exact ⟨438, 438, cert_1375⟩
  · exact ⟨439, 438, cert_1376⟩
  · exact ⟨439, 438, cert_1377⟩
  · exact ⟨439, 438, cert_1378⟩
  · exact ⟨439, 439, cert_1379⟩
  · exact ⟨440, 439, cert_1380⟩
  · exact ⟨440, 439, cert_1381⟩
  · exact ⟨440, 440, cert_1382⟩
  · exact ⟨441, 440, cert_1383⟩
  · exact ⟨441, 440, cert_1384⟩
  · exact ⟨441, 440, cert_1385⟩
  · exact ⟨441, 441, cert_1386⟩
  · exact ⟨442, 441, cert_1387⟩
  · exact ⟨442, 441, cert_1388⟩
  · exact ⟨442, 441, cert_1389⟩
  · exact ⟨442, 442, cert_1390⟩
  · exact ⟨443, 442, cert_1391⟩
  · exact ⟨443, 442, cert_1392⟩
  · exact ⟨443, 443, cert_1393⟩
  · exact ⟨444, 443, cert_1394⟩
  · exact ⟨444, 443, cert_1395⟩
  · exact ⟨444, 443, cert_1396⟩
  · exact ⟨444, 444, cert_1397⟩
  · exact ⟨445, 444, cert_1398⟩
  · exact ⟨445, 444, cert_1399⟩
  · exact ⟨445, 444, cert_1400⟩

theorem no_fixed_digitCount_1301_1400 {n : ℕ} (hn : a n = n)
    (hlo : 1301 ≤ digitCount n) (hhi : digitCount n ≤ 1400) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_1301_1400 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_1301_1400
end OeisA113010
