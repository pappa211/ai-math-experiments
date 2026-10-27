import A113010.SuffixFiniteCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2100
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_1401 : ExponentCertificate 1401 445 445 := by decide
private theorem cert_1402 : ExponentCertificate 1402 446 445 := by decide
private theorem cert_1403 : ExponentCertificate 1403 446 445 := by decide
private theorem cert_1404 : ExponentCertificate 1404 446 446 := by decide
private theorem cert_1405 : ExponentCertificate 1405 447 446 := by decide
private theorem cert_1406 : ExponentCertificate 1406 447 446 := by decide
private theorem cert_1407 : ExponentCertificate 1407 447 446 := by decide
private theorem cert_1408 : ExponentCertificate 1408 447 447 := by decide
private theorem cert_1409 : ExponentCertificate 1409 448 447 := by decide
private theorem cert_1410 : ExponentCertificate 1410 448 447 := by decide
private theorem suffix_1411 : 448 < digitSum ((1411 : ℕ) ^ 448 % 10 ^ 112) := by
  have hmod : (1411 : ℕ) ^ 448 % 10 ^ 112 = 7769096719389936102790777821734602795503036717688424393388458642354237836063430626688189201938206073680827124481 := by
    have h1 : (1411 : ℕ) ^ 1 % 10 ^ 112 = 1411 := by decide
    have h3 : (1411 : ℕ) ^ 3 % 10 ^ 112 = 2809189531 := by
      have step := pow_mod_double_add_one (k := 1411) (e := 1) (m := 10 ^ 112) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1411 : ℕ) ^ 7 % 10 ^ 112 = 11134971153543879944971 := by
      have step := pow_mod_double_add_one (k := 1411) (e := 3) (m := 10 ^ 112) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h14 : (1411 : ℕ) ^ 14 % 10 ^ 112 = 123987582590254324405190430237667657988190841 := by
      have step := pow_mod_double (k := 1411) (e := 7) (m := 10 ^ 112) h7
      have he : 2 * 7 = 14 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h28 : (1411 : ℕ) ^ 28 % 10 ^ 112 = 15372920636575137244486466868443979613704184221424714806034847227294913675180212236287281 := by
      have step := pow_mod_double (k := 1411) (e := 14) (m := 10 ^ 112) h14
      have he : 2 * 14 = 28 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h56 : (1411 : ℕ) ^ 56 % 10 ^ 112 = 6004390659251424918065273535905743811939439090460857388785724892989151739585432767238951241043012798823162372961 := by
      have step := pow_mod_double (k := 1411) (e := 28) (m := 10 ^ 112) h28
      have he : 2 * 28 = 56 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h112 : (1411 : ℕ) ^ 112 % 10 ^ 112 = 8925134879724816267561586116511003158156680790135165933754913070392046060894504163673427618340602014784463907521 := by
      have step := pow_mod_double (k := 1411) (e := 56) (m := 10 ^ 112) h56
      have he : 2 * 56 = 112 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h224 : (1411 : ℕ) ^ 224 % 10 ^ 112 = 8164761584896025685560059734372346782045052128385139119562112697301391642177377618914800195308316791116040365441 := by
      have step := pow_mod_double (k := 1411) (e := 112) (m := 10 ^ 112) h112
      have he : 2 * 112 = 224 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h448 : (1411 : ℕ) ^ 448 % 10 ^ 112 = 7769096719389936102790777821734602795503036717688424393388458642354237836063430626688189201938206073680827124481 := by
      have step := pow_mod_double (k := 1411) (e := 224) (m := 10 ^ 112) h224
      have he : 2 * 224 = 448 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h448
  rw [hmod]
  decide
private theorem cert_1411 : ExponentCertificate 1411 448 448 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1411
private theorem cert_1412 : ExponentCertificate 1412 448 448 := by decide
private theorem cert_1413 : ExponentCertificate 1413 449 448 := by decide
private theorem cert_1414 : ExponentCertificate 1414 449 448 := by decide
private theorem cert_1415 : ExponentCertificate 1415 449 449 := by decide
private theorem cert_1416 : ExponentCertificate 1416 450 449 := by decide
private theorem cert_1417 : ExponentCertificate 1417 450 449 := by decide
private theorem cert_1418 : ExponentCertificate 1418 450 449 := by decide
private theorem suffix_1419 : 450 < digitSum ((1419 : ℕ) ^ 450 % 10 ^ 113) := by
  have hmod : (1419 : ℕ) ^ 450 % 10 ^ 113 = 24551067320983012054866353446025259200496350868488968671999978354576262079578245563932533633533828886888326971001 := by
    have h1 : (1419 : ℕ) ^ 1 % 10 ^ 113 = 1419 := by decide
    have h3 : (1419 : ℕ) ^ 3 % 10 ^ 113 = 2857243059 := by
      have step := pow_mod_double_add_one (k := 1419) (e := 1) (m := 10 ^ 113) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1419 : ℕ) ^ 7 % 10 ^ 113 = 11584485977551018345539 := by
      have step := pow_mod_double_add_one (k := 1419) (e := 3) (m := 10 ^ 113) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h14 : (1419 : ℕ) ^ 14 % 10 ^ 113 = 134200315364076173123236193230326536801200521 := by
      have step := pow_mod_double (k := 1419) (e := 7) (m := 10 ^ 113) h7
      have he : 2 * 7 = 14 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h28 : (1419 : ℕ) ^ 28 % 10 ^ 113 = 18009724643817499366817121737882029811119150032480105120131279630147883928572786850671441 := by
      have step := pow_mod_double (k := 1419) (e := 14) (m := 10 ^ 113) h14
      have he : 2 * 14 = 28 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h56 : (1419 : ℕ) ^ 56 % 10 ^ 113 = 51748275023952029972964682023594252906096019858540178395667448547498125951735985175189829041302603651152533016481 := by
      have step := pow_mod_double (k := 1419) (e := 28) (m := 10 ^ 113) h28
      have he : 2 * 28 = 56 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h112 : (1419 : ℕ) ^ 112 % 10 ^ 113 = 10023116355727072220028779054778817699061089559495120844789533221131127412430082519694745835653865378793017623361 := by
      have step := pow_mod_double (k := 1419) (e := 56) (m := 10 ^ 113) h56
      have he : 2 * 56 = 112 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h225 : (1419 : ℕ) ^ 225 % 10 ^ 113 = 75122858203393814180884039757401749888790865294003705047347646131553641361079110004076214056572723645842316639499 := by
      have step := pow_mod_double_add_one (k := 1419) (e := 112) (m := 10 ^ 113) h112
      have he : 2 * 112 + 1 = 225 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h450 : (1419 : ℕ) ^ 450 % 10 ^ 113 = 24551067320983012054866353446025259200496350868488968671999978354576262079578245563932533633533828886888326971001 := by
      have step := pow_mod_double (k := 1419) (e := 225) (m := 10 ^ 113) h225
      have he : 2 * 225 = 450 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h450
  rw [hmod]
  decide
private theorem cert_1419 : ExponentCertificate 1419 450 450 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1419
private theorem cert_1420 : ExponentCertificate 1420 451 450 := by decide
private theorem cert_1421 : ExponentCertificate 1421 451 450 := by decide
private theorem cert_1422 : ExponentCertificate 1422 451 451 := by decide
private theorem suffix_1423 : 451 < digitSum ((1423 : ℕ) ^ 451 % 10 ^ 113) := by
  have hmod : (1423 : ℕ) ^ 451 % 10 ^ 113 = 52238563360719230551286539418970211975957077981464099534014018967751019786440431213453290073919489851212295121327 := by
    have h1 : (1423 : ℕ) ^ 1 % 10 ^ 113 = 1423 := by decide
    have h3 : (1423 : ℕ) ^ 3 % 10 ^ 113 = 2881473967 := by
      have step := pow_mod_double_add_one (k := 1423) (e := 1) (m := 10 ^ 113) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1423 : ℕ) ^ 7 % 10 ^ 113 = 11815015632615674417647 := by
      have step := pow_mod_double_add_one (k := 1423) (e := 3) (m := 10 ^ 113) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h14 : (1423 : ℕ) ^ 14 % 10 ^ 113 = 139594594398952765161822658304352972585016609 := by
      have step := pow_mod_double (k := 1423) (e := 7) (m := 10 ^ 113) h7
      have he : 2 * 7 = 14 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h28 : (1423 : ℕ) ^ 28 % 10 ^ 113 = 19486650785408134715047265402258182247927280671434017543395539206389315579268328805858881 := by
      have step := pow_mod_double (k := 1423) (e := 14) (m := 10 ^ 113) h14
      have he : 2 * 14 = 28 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h56 : (1423 : ℕ) ^ 56 % 10 ^ 113 = 14675845285154018864626817628956066469547320258873621133384531008414309366592500287479630045667851050472086572161 := by
      have step := pow_mod_double (k := 1423) (e := 28) (m := 10 ^ 113) h28
      have he : 2 * 28 = 56 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h112 : (1423 : ℕ) ^ 112 % 10 ^ 113 = 69255591241248996710278733582791015869869897364379886999811202257544763068950753729621880530114969714723060209921 := by
      have step := pow_mod_double (k := 1423) (e := 56) (m := 10 ^ 113) h56
      have he : 2 * 56 = 112 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h225 : (1423 : ℕ) ^ 225 % 10 ^ 113 = 57377491100050784697806667982514427693556244014445799280582540762112871639149242237601855072072146857835053740943 := by
      have step := pow_mod_double_add_one (k := 1423) (e := 112) (m := 10 ^ 113) h112
      have he : 2 * 112 + 1 = 225 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h451 : (1423 : ℕ) ^ 451 % 10 ^ 113 = 52238563360719230551286539418970211975957077981464099534014018967751019786440431213453290073919489851212295121327 := by
      have step := pow_mod_double_add_one (k := 1423) (e := 225) (m := 10 ^ 113) h225
      have he : 2 * 225 + 1 = 451 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h451
  rw [hmod]
  decide
private theorem cert_1423 : ExponentCertificate 1423 451 451 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1423
private theorem cert_1424 : ExponentCertificate 1424 452 451 := by decide
private theorem cert_1425 : ExponentCertificate 1425 452 451 := by decide
private theorem cert_1426 : ExponentCertificate 1426 452 452 := by decide
private theorem cert_1427 : ExponentCertificate 1427 453 452 := by decide
private theorem cert_1428 : ExponentCertificate 1428 453 452 := by decide
private theorem cert_1429 : ExponentCertificate 1429 453 452 := by decide
private theorem cert_1430 : ExponentCertificate 1430 453 453 := by decide
private theorem cert_1431 : ExponentCertificate 1431 454 453 := by decide
private theorem cert_1432 : ExponentCertificate 1432 454 453 := by decide
private theorem cert_1433 : ExponentCertificate 1433 454 454 := by decide
private theorem cert_1434 : ExponentCertificate 1434 454 454 := by decide
private theorem cert_1435 : ExponentCertificate 1435 455 454 := by decide
private theorem cert_1436 : ExponentCertificate 1436 455 454 := by decide
private theorem cert_1437 : ExponentCertificate 1437 455 455 := by decide
private theorem cert_1438 : ExponentCertificate 1438 456 455 := by decide
private theorem cert_1439 : ExponentCertificate 1439 456 455 := by decide
private theorem cert_1440 : ExponentCertificate 1440 456 455 := by decide
private theorem cert_1441 : ExponentCertificate 1441 456 456 := by decide
private theorem cert_1442 : ExponentCertificate 1442 457 456 := by decide
private theorem cert_1443 : ExponentCertificate 1443 457 456 := by decide
private theorem cert_1444 : ExponentCertificate 1444 457 457 := by decide
private theorem cert_1445 : ExponentCertificate 1445 457 457 := by decide
private theorem cert_1446 : ExponentCertificate 1446 458 457 := by decide
private theorem cert_1447 : ExponentCertificate 1447 458 457 := by decide
private theorem cert_1448 : ExponentCertificate 1448 458 458 := by decide
private theorem cert_1449 : ExponentCertificate 1449 459 458 := by decide
private theorem cert_1450 : ExponentCertificate 1450 459 458 := by decide
private theorem cert_1451 : ExponentCertificate 1451 459 458 := by decide
private theorem suffix_1452 : 459 < digitSum ((1452 : ℕ) ^ 459 % 10 ^ 115) := by
  have hmod : (1452 : ℕ) ^ 459 % 10 ^ 115 = 6204194922867286974284818005479790620441423514524401367991358988206390436421257399886743550889978870546421606514688 := by
    have h1 : (1452 : ℕ) ^ 1 % 10 ^ 115 = 1452 := by decide
    have h3 : (1452 : ℕ) ^ 3 % 10 ^ 115 = 3061257408 := by
      have step := pow_mod_double_add_one (k := 1452) (e := 1) (m := 10 ^ 115) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1452 : ℕ) ^ 7 % 10 ^ 115 = 13607123124986643529728 := by
      have step := pow_mod_double_add_one (k := 1452) (e := 3) (m := 10 ^ 115) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h14 : (1452 : ℕ) ^ 14 % 10 ^ 115 = 185153799738546279353987165915298126819753984 := by
      have step := pow_mod_double (k := 1452) (e := 7) (m := 10 ^ 115) h7
      have he : 2 * 7 = 14 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h28 : (1452 : ℕ) ^ 28 % 10 ^ 115 = 34281929557621700264862585880539170322827511875514053080492090546981167344464562283872256 := by
      have step := pow_mod_double (k := 1452) (e := 14) (m := 10 ^ 115) h14
      have he : 2 * 14 = 28 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h57 : (1452 : ℕ) ^ 57 % 10 ^ 115 = 9662256356336661021431636716038919257441086874044319391076617666087291924093585306647038288608890591576906920886272 := by
      have step := pow_mod_double_add_one (k := 1452) (e := 28) (m := 10 ^ 115) h28
      have he : 2 * 28 + 1 = 57 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h114 : (1452 : ℕ) ^ 114 % 10 ^ 115 = 5989203569711915315783212941698464979840583044121529319649940874645861181014000549428518358399099983300389958057984 := by
      have step := pow_mod_double (k := 1452) (e := 57) (m := 10 ^ 115) h57
      have he : 2 * 57 = 114 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h229 : (1452 : ℕ) ^ 229 % 10 ^ 115 = 5053982646555830596291055084165925768417388074618315184750383009599915068584804429868812258272862253419729321459712 := by
      have step := pow_mod_double_add_one (k := 1452) (e := 114) (m := 10 ^ 115) h114
      have he : 2 * 114 + 1 = 229 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h459 : (1452 : ℕ) ^ 459 % 10 ^ 115 = 6204194922867286974284818005479790620441423514524401367991358988206390436421257399886743550889978870546421606514688 := by
      have step := pow_mod_double_add_one (k := 1452) (e := 229) (m := 10 ^ 115) h229
      have he : 2 * 229 + 1 = 459 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h459
  rw [hmod]
  decide
private theorem cert_1452 : ExponentCertificate 1452 459 459 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1452
private theorem cert_1453 : ExponentCertificate 1453 460 459 := by decide
private theorem cert_1454 : ExponentCertificate 1454 460 459 := by decide
private theorem cert_1455 : ExponentCertificate 1455 460 460 := by decide
private theorem cert_1456 : ExponentCertificate 1456 460 460 := by decide
private theorem cert_1457 : ExponentCertificate 1457 461 460 := by decide
private theorem cert_1458 : ExponentCertificate 1458 461 460 := by decide
private theorem cert_1459 : ExponentCertificate 1459 461 461 := by decide
private theorem cert_1460 : ExponentCertificate 1460 462 461 := by decide
private theorem cert_1461 : ExponentCertificate 1461 462 461 := by decide
private theorem cert_1462 : ExponentCertificate 1462 462 461 := by decide
private theorem cert_1463 : ExponentCertificate 1463 462 462 := by decide
private theorem cert_1464 : ExponentCertificate 1464 463 462 := by decide
private theorem cert_1465 : ExponentCertificate 1465 463 462 := by decide
private theorem cert_1466 : ExponentCertificate 1466 463 463 := by decide
private theorem cert_1467 : ExponentCertificate 1467 463 463 := by decide
private theorem cert_1468 : ExponentCertificate 1468 464 463 := by decide
private theorem cert_1469 : ExponentCertificate 1469 464 463 := by decide
private theorem cert_1470 : ExponentCertificate 1470 464 464 := by decide
private theorem cert_1471 : ExponentCertificate 1471 465 464 := by decide
private theorem cert_1472 : ExponentCertificate 1472 465 464 := by decide
private theorem cert_1473 : ExponentCertificate 1473 465 464 := by decide
private theorem cert_1474 : ExponentCertificate 1474 465 465 := by decide
private theorem cert_1475 : ExponentCertificate 1475 466 465 := by decide
private theorem cert_1476 : ExponentCertificate 1476 466 465 := by decide
private theorem cert_1477 : ExponentCertificate 1477 466 466 := by decide
private theorem suffix_1478 : 466 < digitSum ((1478 : ℕ) ^ 466 % 10 ^ 117) := by
  have hmod : (1478 : ℕ) ^ 466 % 10 ^ 117 = 54886868808600241112189059778361760672685991269791525491485934602526295584361612127775160772101052912835344889544704 := by
    have h1 : (1478 : ℕ) ^ 1 % 10 ^ 117 = 1478 := by decide
    have h3 : (1478 : ℕ) ^ 3 % 10 ^ 117 = 3228667352 := by
      have step := pow_mod_double_add_one (k := 1478) (e := 1) (m := 10 ^ 117) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1478 : ℕ) ^ 7 % 10 ^ 117 = 15407104861668882634112 := by
      have step := pow_mod_double_add_one (k := 1478) (e := 3) (m := 10 ^ 117) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h14 : (1478 : ℕ) ^ 14 % 10 ^ 117 = 237378880218460919088378363215080607666028544 := by
      have step := pow_mod_double (k := 1478) (e := 7) (m := 10 ^ 117) h7
      have he : 2 * 7 = 14 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h29 : (1478 : ℕ) ^ 29 % 10 ^ 117 = 83283427039632675796380761989824862688007791295221474869368362554575109843165354510839185408 := by
      have step := pow_mod_double_add_one (k := 1478) (e := 14) (m := 10 ^ 117) h14
      have he : 2 * 14 + 1 = 29 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h58 : (1478 : ℕ) ^ 58 % 10 ^ 117 = 453150905197133692044597550796340691548765445811940846257986639048792252168987806904297614740408172582212309000126464 := by
      have step := pow_mod_double (k := 1478) (e := 29) (m := 10 ^ 117) h29
      have he : 2 * 29 = 58 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h116 : (1478 : ℕ) ^ 116 % 10 ^ 117 = 379704216334333090740669660500138050539208957009806678724567578627558587514817229371250530709386354794890767993143296 := by
      have step := pow_mod_double (k := 1478) (e := 58) (m := 10 ^ 117) h58
      have he : 2 * 58 = 116 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h233 : (1478 : ℕ) ^ 233 % 10 ^ 117 = 561422145954104147024368702601702645118316033735079287529256300269303017803591163866410692190811801717852836041064448 := by
      have step := pow_mod_double_add_one (k := 1478) (e := 116) (m := 10 ^ 117) h116
      have he : 2 * 116 + 1 = 233 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h466 : (1478 : ℕ) ^ 466 % 10 ^ 117 = 54886868808600241112189059778361760672685991269791525491485934602526295584361612127775160772101052912835344889544704 := by
      have step := pow_mod_double (k := 1478) (e := 233) (m := 10 ^ 117) h233
      have he : 2 * 233 = 466 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h466
  rw [hmod]
  decide
private theorem cert_1478 : ExponentCertificate 1478 466 466 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1478
private theorem cert_1479 : ExponentCertificate 1479 467 466 := by decide
private theorem cert_1480 : ExponentCertificate 1480 467 466 := by decide
private theorem cert_1481 : ExponentCertificate 1481 467 467 := by decide
private theorem cert_1482 : ExponentCertificate 1482 468 467 := by decide
private theorem cert_1483 : ExponentCertificate 1483 468 467 := by decide
private theorem cert_1484 : ExponentCertificate 1484 468 467 := by decide
private theorem suffix_1485 : 468 < digitSum ((1485 : ℕ) ^ 468 % 10 ^ 117) := by
  have hmod : (1485 : ℕ) ^ 468 % 10 ^ 117 = 304722768791598447599098290845956937272754557694347893878611411294860924548789926635805613841512240469455718994140625 := by
    have h1 : (1485 : ℕ) ^ 1 % 10 ^ 117 = 1485 := by decide
    have h3 : (1485 : ℕ) ^ 3 % 10 ^ 117 = 3274759125 := by
      have step := pow_mod_double_add_one (k := 1485) (e := 1) (m := 10 ^ 117) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1485 : ℕ) ^ 7 % 10 ^ 117 = 15925210280254586953125 := by
      have step := pow_mod_double_add_one (k := 1485) (e := 3) (m := 10 ^ 117) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h14 : (1485 : ℕ) ^ 14 % 10 ^ 117 = 253612322470326379926185070766701470947265625 := by
      have step := pow_mod_double (k := 1485) (e := 7) (m := 10 ^ 117) h7
      have he : 2 * 7 = 14 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h29 : (1485 : ℕ) ^ 29 % 10 ^ 117 = 95514027011557330041966185591554338466440599182561122653508872117440368421375751495361328125 := by
      have step := pow_mod_double_add_one (k := 1485) (e := 14) (m := 10 ^ 117) h14
      have he : 2 * 14 + 1 = 29 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h58 : (1485 : ℕ) ^ 58 % 10 ^ 117 = 230069819669127578118509590262731316686101057951963121761079721393696540572872122343284218004555441439151763916015625 := by
      have step := pow_mod_double (k := 1485) (e := 29) (m := 10 ^ 117) h29
      have he : 2 * 29 = 58 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h117 : (1485 : ℕ) ^ 117 % 10 ^ 117 = 537938008175670252464590531646376277610726093280119308058035370174070741622514291169210309817572124302387237548828125 := by
      have step := pow_mod_double_add_one (k := 1485) (e := 58) (m := 10 ^ 117) h58
      have he : 2 * 58 + 1 = 117 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h234 : (1485 : ℕ) ^ 234 % 10 ^ 117 = 266813667906902759433761279180155330690573083717829205171185237615506772473374097476295219166786409914493560791015625 := by
      have step := pow_mod_double (k := 1485) (e := 117) (m := 10 ^ 117) h117
      have he : 2 * 117 = 234 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h468 : (1485 : ℕ) ^ 468 % 10 ^ 117 = 304722768791598447599098290845956937272754557694347893878611411294860924548789926635805613841512240469455718994140625 := by
      have step := pow_mod_double (k := 1485) (e := 234) (m := 10 ^ 117) h234
      have he : 2 * 234 = 468 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h468
  rw [hmod]
  decide
private theorem cert_1485 : ExponentCertificate 1485 468 468 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1485
private theorem cert_1486 : ExponentCertificate 1486 469 468 := by decide
private theorem cert_1487 : ExponentCertificate 1487 469 468 := by decide
private theorem cert_1488 : ExponentCertificate 1488 469 469 := by decide
private theorem cert_1489 : ExponentCertificate 1489 469 469 := by decide
private theorem cert_1490 : ExponentCertificate 1490 470 469 := by decide
private theorem cert_1491 : ExponentCertificate 1491 470 469 := by decide
private theorem cert_1492 : ExponentCertificate 1492 470 470 := by decide
private theorem cert_1493 : ExponentCertificate 1493 471 470 := by decide
private theorem cert_1494 : ExponentCertificate 1494 471 470 := by decide
private theorem cert_1495 : ExponentCertificate 1495 471 470 := by decide
private theorem cert_1496 : ExponentCertificate 1496 471 471 := by decide
private theorem cert_1497 : ExponentCertificate 1497 472 471 := by decide
private theorem cert_1498 : ExponentCertificate 1498 472 471 := by decide
private theorem suffix_1499 : 472 < digitSum ((1499 : ℕ) ^ 472 % 10 ^ 118) := by
  have hmod : (1499 : ℕ) ^ 472 % 10 ^ 118 = 3058980980409885946300880214823882460077564974696829311834530838603130124266717621693439973572318257789619640100292001 := by
    have h1 : (1499 : ℕ) ^ 1 % 10 ^ 118 = 1499 := by decide
    have h3 : (1499 : ℕ) ^ 3 % 10 ^ 118 = 3368254499 := by
      have step := pow_mod_double_add_one (k := 1499) (e := 1) (m := 10 ^ 118) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1499 : ℕ) ^ 7 % 10 ^ 118 = 17006362416680577760499 := by
      have step := pow_mod_double_add_one (k := 1499) (e := 3) (m := 10 ^ 118) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h14 : (1499 : ℕ) ^ 14 % 10 ^ 118 = 289216362647485661151094472099253834204729001 := by
      have step := pow_mod_double (k := 1499) (e := 7) (m := 10 ^ 118) h7
      have he : 2 * 7 = 14 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h29 : (1499 : ℕ) ^ 29 % 10 ^ 118 = 125385510530139866785559542478501001162876665022148630996825334551834460126988054143836543499 := by
      have step := pow_mod_double_add_one (k := 1499) (e := 14) (m := 10 ^ 118) h14
      have he : 2 * 14 + 1 = 29 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h59 : (1499 : ℕ) ^ 59 % 10 ^ 118 = 8151645212996803477832783350729954908340640270085015026190622712108810760758966415795121156597499772033471839025338499 := by
      have step := pow_mod_double_add_one (k := 1499) (e := 29) (m := 10 ^ 118) h29
      have he : 2 * 29 + 1 = 59 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h118 : (1499 : ℕ) ^ 118 % 10 ^ 118 = 9408311887237335898106976757376321725728126369412558156836736577258922165753619107605610962758382629318701361531573001 := by
      have step := pow_mod_double (k := 1499) (e := 59) (m := 10 ^ 118) h59
      have he : 2 * 59 = 118 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h236 : (1499 : ℕ) ^ 236 % 10 ^ 118 = 9850991751687786851107231629287898837432764002626939101553198937489871209385898444967632079849677657061678577392146001 := by
      have step := pow_mod_double (k := 1499) (e := 118) (m := 10 ^ 118) h118
      have he : 2 * 118 = 236 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h472 : (1499 : ℕ) ^ 472 % 10 ^ 118 = 3058980980409885946300880214823882460077564974696829311834530838603130124266717621693439973572318257789619640100292001 := by
      have step := pow_mod_double (k := 1499) (e := 236) (m := 10 ^ 118) h236
      have he : 2 * 236 = 472 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h472
  rw [hmod]
  decide
private theorem cert_1499 : ExponentCertificate 1499 472 472 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1499
private theorem cert_1500 : ExponentCertificate 1500 472 472 := by decide

private theorem certificates_1401_1500 {k : ℕ} (hlo : 1401 ≤ k) (hhi : k ≤ 1500) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨445, 445, cert_1401⟩
  · exact ⟨446, 445, cert_1402⟩
  · exact ⟨446, 445, cert_1403⟩
  · exact ⟨446, 446, cert_1404⟩
  · exact ⟨447, 446, cert_1405⟩
  · exact ⟨447, 446, cert_1406⟩
  · exact ⟨447, 446, cert_1407⟩
  · exact ⟨447, 447, cert_1408⟩
  · exact ⟨448, 447, cert_1409⟩
  · exact ⟨448, 447, cert_1410⟩
  · exact ⟨448, 448, cert_1411⟩
  · exact ⟨448, 448, cert_1412⟩
  · exact ⟨449, 448, cert_1413⟩
  · exact ⟨449, 448, cert_1414⟩
  · exact ⟨449, 449, cert_1415⟩
  · exact ⟨450, 449, cert_1416⟩
  · exact ⟨450, 449, cert_1417⟩
  · exact ⟨450, 449, cert_1418⟩
  · exact ⟨450, 450, cert_1419⟩
  · exact ⟨451, 450, cert_1420⟩
  · exact ⟨451, 450, cert_1421⟩
  · exact ⟨451, 451, cert_1422⟩
  · exact ⟨451, 451, cert_1423⟩
  · exact ⟨452, 451, cert_1424⟩
  · exact ⟨452, 451, cert_1425⟩
  · exact ⟨452, 452, cert_1426⟩
  · exact ⟨453, 452, cert_1427⟩
  · exact ⟨453, 452, cert_1428⟩
  · exact ⟨453, 452, cert_1429⟩
  · exact ⟨453, 453, cert_1430⟩
  · exact ⟨454, 453, cert_1431⟩
  · exact ⟨454, 453, cert_1432⟩
  · exact ⟨454, 454, cert_1433⟩
  · exact ⟨454, 454, cert_1434⟩
  · exact ⟨455, 454, cert_1435⟩
  · exact ⟨455, 454, cert_1436⟩
  · exact ⟨455, 455, cert_1437⟩
  · exact ⟨456, 455, cert_1438⟩
  · exact ⟨456, 455, cert_1439⟩
  · exact ⟨456, 455, cert_1440⟩
  · exact ⟨456, 456, cert_1441⟩
  · exact ⟨457, 456, cert_1442⟩
  · exact ⟨457, 456, cert_1443⟩
  · exact ⟨457, 457, cert_1444⟩
  · exact ⟨457, 457, cert_1445⟩
  · exact ⟨458, 457, cert_1446⟩
  · exact ⟨458, 457, cert_1447⟩
  · exact ⟨458, 458, cert_1448⟩
  · exact ⟨459, 458, cert_1449⟩
  · exact ⟨459, 458, cert_1450⟩
  · exact ⟨459, 458, cert_1451⟩
  · exact ⟨459, 459, cert_1452⟩
  · exact ⟨460, 459, cert_1453⟩
  · exact ⟨460, 459, cert_1454⟩
  · exact ⟨460, 460, cert_1455⟩
  · exact ⟨460, 460, cert_1456⟩
  · exact ⟨461, 460, cert_1457⟩
  · exact ⟨461, 460, cert_1458⟩
  · exact ⟨461, 461, cert_1459⟩
  · exact ⟨462, 461, cert_1460⟩
  · exact ⟨462, 461, cert_1461⟩
  · exact ⟨462, 461, cert_1462⟩
  · exact ⟨462, 462, cert_1463⟩
  · exact ⟨463, 462, cert_1464⟩
  · exact ⟨463, 462, cert_1465⟩
  · exact ⟨463, 463, cert_1466⟩
  · exact ⟨463, 463, cert_1467⟩
  · exact ⟨464, 463, cert_1468⟩
  · exact ⟨464, 463, cert_1469⟩
  · exact ⟨464, 464, cert_1470⟩
  · exact ⟨465, 464, cert_1471⟩
  · exact ⟨465, 464, cert_1472⟩
  · exact ⟨465, 464, cert_1473⟩
  · exact ⟨465, 465, cert_1474⟩
  · exact ⟨466, 465, cert_1475⟩
  · exact ⟨466, 465, cert_1476⟩
  · exact ⟨466, 466, cert_1477⟩
  · exact ⟨466, 466, cert_1478⟩
  · exact ⟨467, 466, cert_1479⟩
  · exact ⟨467, 466, cert_1480⟩
  · exact ⟨467, 467, cert_1481⟩
  · exact ⟨468, 467, cert_1482⟩
  · exact ⟨468, 467, cert_1483⟩
  · exact ⟨468, 467, cert_1484⟩
  · exact ⟨468, 468, cert_1485⟩
  · exact ⟨469, 468, cert_1486⟩
  · exact ⟨469, 468, cert_1487⟩
  · exact ⟨469, 469, cert_1488⟩
  · exact ⟨469, 469, cert_1489⟩
  · exact ⟨470, 469, cert_1490⟩
  · exact ⟨470, 469, cert_1491⟩
  · exact ⟨470, 470, cert_1492⟩
  · exact ⟨471, 470, cert_1493⟩
  · exact ⟨471, 470, cert_1494⟩
  · exact ⟨471, 470, cert_1495⟩
  · exact ⟨471, 471, cert_1496⟩
  · exact ⟨472, 471, cert_1497⟩
  · exact ⟨472, 471, cert_1498⟩
  · exact ⟨472, 472, cert_1499⟩
  · exact ⟨472, 472, cert_1500⟩

theorem no_fixed_digitCount_1401_1500 {n : ℕ} (hn : a n = n)
    (hlo : 1401 ≤ digitCount n) (hhi : digitCount n ≤ 1500) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_1401_1500 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_1401_1500
end OeisA113010
