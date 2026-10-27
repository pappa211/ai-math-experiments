import A113010.SuffixFiniteCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2100
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_1501 : ExponentCertificate 1501 473 472 := by decide
private theorem cert_1502 : ExponentCertificate 1502 473 472 := by decide
private theorem cert_1503 : ExponentCertificate 1503 473 473 := by decide
private theorem cert_1504 : ExponentCertificate 1504 474 473 := by decide
private theorem cert_1505 : ExponentCertificate 1505 474 473 := by decide
private theorem cert_1506 : ExponentCertificate 1506 474 473 := by decide
private theorem cert_1507 : ExponentCertificate 1507 474 474 := by decide
private theorem cert_1508 : ExponentCertificate 1508 475 474 := by decide
private theorem cert_1509 : ExponentCertificate 1509 475 474 := by decide
private theorem cert_1510 : ExponentCertificate 1510 475 474 := by decide
private theorem cert_1511 : ExponentCertificate 1511 475 475 := by decide
private theorem cert_1512 : ExponentCertificate 1512 476 475 := by decide
private theorem cert_1513 : ExponentCertificate 1513 476 475 := by decide
private theorem cert_1514 : ExponentCertificate 1514 476 476 := by decide
private theorem cert_1515 : ExponentCertificate 1515 477 476 := by decide
private theorem cert_1516 : ExponentCertificate 1516 477 476 := by decide
private theorem cert_1517 : ExponentCertificate 1517 477 476 := by decide
private theorem suffix_1518 : 477 < digitSum ((1518 : ℕ) ^ 477 % 10 ^ 120) := by
  have hmod : (1518 : ℕ) ^ 477 % 10 ^ 120 = 293591898037383360313025313882820403110998046449919745733673971785093580836083397710307306206545265195143049276416851968 := by
    have h1 : (1518 : ℕ) ^ 1 % 10 ^ 120 = 1518 := by decide
    have h3 : (1518 : ℕ) ^ 3 % 10 ^ 120 = 3497963832 := by
      have step := pow_mod_double_add_one (k := 1518) (e := 1) (m := 10 ^ 120) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1518 : ℕ) ^ 7 % 10 ^ 120 = 18573869972429828572032 := by
      have step := pow_mod_double_add_one (k := 1518) (e := 3) (m := 10 ^ 120) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h14 : (1518 : ℕ) ^ 14 % 10 ^ 120 = 344988645752730440798530360247543068212609024 := by
      have step := pow_mod_double (k := 1518) (e := 7) (m := 10 ^ 120) h7
      have he : 2 * 7 = 14 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h29 : (1518 : ℕ) ^ 29 % 10 ^ 120 = 180668057530023855647684809224729291936615180708682443793565906440299420640030481128901050368 := by
      have step := pow_mod_double_add_one (k := 1518) (e := 14) (m := 10 ^ 120) h14
      have he : 2 * 14 + 1 = 29 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h59 : (1518 : ℕ) ^ 59 % 10 ^ 120 = 648911517682032234490051200888567952897758738072939575162956200335284014819947673267550743233870354806469396035515973632 := by
      have step := pow_mod_double_add_one (k := 1518) (e := 29) (m := 10 ^ 120) h29
      have he : 2 * 29 + 1 = 59 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h119 : (1518 : ℕ) ^ 119 % 10 ^ 120 = 378443430058350048950727522988465808797207914522496174892963043564647567475913085063512571335139096315095229899454021632 := by
      have step := pow_mod_double_add_one (k := 1518) (e := 59) (m := 10 ^ 120) h59
      have he : 2 * 59 + 1 = 119 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h238 : (1518 : ℕ) ^ 238 % 10 ^ 120 = 612706376351626522829365686553422935411117137474019378721166509710007389483179364391259056015632995229524485978323943424 := by
      have step := pow_mod_double (k := 1518) (e := 119) (m := 10 ^ 120) h119
      have he : 2 * 119 = 238 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h477 : (1518 : ℕ) ^ 477 % 10 ^ 120 = 293591898037383360313025313882820403110998046449919745733673971785093580836083397710307306206545265195143049276416851968 := by
      have step := pow_mod_double_add_one (k := 1518) (e := 238) (m := 10 ^ 120) h238
      have he : 2 * 238 + 1 = 477 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h477
  rw [hmod]
  decide
private theorem cert_1518 : ExponentCertificate 1518 477 477 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1518
private theorem cert_1519 : ExponentCertificate 1519 478 477 := by decide
private theorem cert_1520 : ExponentCertificate 1520 478 477 := by decide
private theorem cert_1521 : ExponentCertificate 1521 478 477 := by decide
private theorem suffix_1522 : 478 < digitSum ((1522 : ℕ) ^ 478 % 10 ^ 120) := by
  have hmod : (1522 : ℕ) ^ 478 % 10 ^ 120 = 567392118259030614579205392579893664956055932523077873550919477504968643637707871299491047484048021932038717802035544064 := by
    have h1 : (1522 : ℕ) ^ 1 % 10 ^ 120 = 1522 := by decide
    have h3 : (1522 : ℕ) ^ 3 % 10 ^ 120 = 3525688648 := by
      have step := pow_mod_double_add_one (k := 1522) (e := 1) (m := 10 ^ 120) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1522 : ℕ) ^ 7 % 10 ^ 120 = 18919191233692095349888 := by
      have step := pow_mod_double_add_one (k := 1522) (e := 3) (m := 10 ^ 120) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h14 : (1522 : ℕ) ^ 14 % 10 ^ 120 = 357935796937011828841481230237144593141612544 := by
      have step := pow_mod_double (k := 1522) (e := 7) (m := 10 ^ 120) h7
      have he : 2 * 7 = 14 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h29 : (1522 : ℕ) ^ 29 % 10 ^ 120 = 194995648857437192633659401704231322699377989977856896571482183754513562981111417452827246592 := by
      have step := pow_mod_double_add_one (k := 1522) (e := 14) (m := 10 ^ 120) h14
      have he : 2 * 14 + 1 = 29 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h59 : (1522 : ℕ) ^ 59 % 10 ^ 120 = 443233692578915051845988403109390516218792038924942451630074413357684689663103526534496671549701966314609787986885214208 := by
      have step := pow_mod_double_add_one (k := 1522) (e := 29) (m := 10 ^ 120) h29
      have he : 2 * 29 + 1 = 59 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h119 : (1522 : ℕ) ^ 119 % 10 ^ 120 = 923659418870147910361277180240441763668585561628326021378984611546248912189526025584145989482109015976656671208592375808 := by
      have step := pow_mod_double_add_one (k := 1522) (e := 59) (m := 10 ^ 120) h59
      have he : 2 * 59 + 1 = 119 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h239 : (1522 : ℕ) ^ 239 % 10 ^ 120 = 85007712481926186778000070869337958393158077313626573714820483120376794772678109948761213769442885428982625825359659008 := by
      have step := pow_mod_double_add_one (k := 1522) (e := 119) (m := 10 ^ 120) h119
      have he : 2 * 119 + 1 = 239 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h478 : (1522 : ℕ) ^ 478 % 10 ^ 120 = 567392118259030614579205392579893664956055932523077873550919477504968643637707871299491047484048021932038717802035544064 := by
      have step := pow_mod_double (k := 1522) (e := 239) (m := 10 ^ 120) h239
      have he : 2 * 239 = 478 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h478
  rw [hmod]
  decide
private theorem cert_1522 : ExponentCertificate 1522 478 478 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1522
private theorem cert_1523 : ExponentCertificate 1523 479 478 := by decide
private theorem cert_1524 : ExponentCertificate 1524 479 478 := by decide
private theorem cert_1525 : ExponentCertificate 1525 479 479 := by decide
private theorem cert_1526 : ExponentCertificate 1526 480 479 := by decide
private theorem cert_1527 : ExponentCertificate 1527 480 479 := by decide
private theorem cert_1528 : ExponentCertificate 1528 480 479 := by decide
private theorem cert_1529 : ExponentCertificate 1529 480 480 := by decide
private theorem cert_1530 : ExponentCertificate 1530 481 480 := by decide
private theorem cert_1531 : ExponentCertificate 1531 481 480 := by decide
private theorem cert_1532 : ExponentCertificate 1532 481 480 := by decide
private theorem cert_1533 : ExponentCertificate 1533 481 481 := by decide
private theorem cert_1534 : ExponentCertificate 1534 482 481 := by decide
private theorem cert_1535 : ExponentCertificate 1535 482 481 := by decide
private theorem cert_1536 : ExponentCertificate 1536 482 482 := by decide
private theorem cert_1537 : ExponentCertificate 1537 483 482 := by decide
private theorem cert_1538 : ExponentCertificate 1538 483 482 := by decide
private theorem cert_1539 : ExponentCertificate 1539 483 482 := by decide
private theorem cert_1540 : ExponentCertificate 1540 483 483 := by decide
private theorem cert_1541 : ExponentCertificate 1541 484 483 := by decide
private theorem cert_1542 : ExponentCertificate 1542 484 483 := by decide
private theorem cert_1543 : ExponentCertificate 1543 484 483 := by decide
private theorem cert_1544 : ExponentCertificate 1544 484 484 := by decide
private theorem cert_1545 : ExponentCertificate 1545 485 484 := by decide
private theorem cert_1546 : ExponentCertificate 1546 485 484 := by decide
private theorem suffix_1547 : 485 < digitSum ((1547 : ℕ) ^ 485 % 10 ^ 122) := by
  have hmod : (1547 : ℕ) ^ 485 % 10 ^ 122 = 38660347378806990547729402775806538266674860779237823939283307501229266356434080816744418383383847777073805690515030615707 := by
    have h1 : (1547 : ℕ) ^ 1 % 10 ^ 122 = 1547 := by decide
    have h3 : (1547 : ℕ) ^ 3 % 10 ^ 122 = 3702294323 := by
      have step := pow_mod_double_add_one (k := 1547) (e := 1) (m := 10 ^ 122) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1547 : ℕ) ^ 7 % 10 ^ 122 = 21204703094120589824963 := by
      have step := pow_mod_double_add_one (k := 1547) (e := 3) (m := 10 ^ 122) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h15 : (1547 : ℕ) ^ 15 % 10 ^ 122 = 695592203330271917395650827321308554994890767843 := by
      have step := pow_mod_double_add_one (k := 1547) (e := 7) (m := 10 ^ 122) h7
      have he : 2 * 7 + 1 = 15 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h30 : (1547 : ℕ) ^ 30 % 10 ^ 122 = 483848513333862350329629102610602816783914125869908774575265343718400657318975697983234122872649 := by
      have step := pow_mod_double (k := 1547) (e := 15) (m := 10 ^ 122) h15
      have he : 2 * 15 = 30 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h60 : (1547 : ℕ) ^ 60 % 10 ^ 122 = 75120325024591916833007304735499993595986809063032375665103808726354788422430052578224164927142509054403853431419872277201 := by
      have step := pow_mod_double (k := 1547) (e := 30) (m := 10 ^ 122) h30
      have he : 2 * 30 = 60 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h121 : (1547 : ℕ) ^ 121 % 10 ^ 122 = 70723562204401298767994181281965011184989940969680626567918548896844491460865622633656689964098222785883009855885658138347 := by
      have step := pow_mod_double_add_one (k := 1547) (e := 60) (m := 10 ^ 122) h60
      have he : 2 * 60 + 1 = 121 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h242 : (1547 : ℕ) ^ 242 % 10 ^ 122 = 27785647044573106177317331516677598794992708242460730725259872745102539160632477511579272419926027217099157390273791892409 := by
      have step := pow_mod_double (k := 1547) (e := 121) (m := 10 ^ 122) h121
      have he : 2 * 121 = 242 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h485 : (1547 : ℕ) ^ 485 % 10 ^ 122 = 38660347378806990547729402775806538266674860779237823939283307501229266356434080816744418383383847777073805690515030615707 := by
      have step := pow_mod_double_add_one (k := 1547) (e := 242) (m := 10 ^ 122) h242
      have he : 2 * 242 + 1 = 485 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h485
  rw [hmod]
  decide
private theorem cert_1547 : ExponentCertificate 1547 485 485 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1547
private theorem cert_1548 : ExponentCertificate 1548 485 485 := by decide
private theorem cert_1549 : ExponentCertificate 1549 486 485 := by decide
private theorem cert_1550 : ExponentCertificate 1550 486 485 := by decide
private theorem suffix_1551 : 486 < digitSum ((1551 : ℕ) ^ 486 % 10 ^ 122) := by
  have hmod : (1551 : ℕ) ^ 486 % 10 ^ 122 = 54064811707388517712455811350763632489691303224133666075183064904394708356230615511845832734378623774215323135115558640801 := by
    have h1 : (1551 : ℕ) ^ 1 % 10 ^ 122 = 1551 := by decide
    have h3 : (1551 : ℕ) ^ 3 % 10 ^ 122 = 3731087151 := by
      have step := pow_mod_double_add_one (k := 1551) (e := 1) (m := 10 ^ 122) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1551 : ℕ) ^ 7 % 10 ^ 122 = 21591488570282167338351 := by
      have step := pow_mod_double_add_one (k := 1551) (e := 3) (m := 10 ^ 122) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h15 : (1551 : ℕ) ^ 15 % 10 ^ 122 = 723064379333650104934327265386309708046584160751 := by
      have step := pow_mod_double_add_one (k := 1551) (e := 7) (m := 10 ^ 122) h7
      have he : 2 * 7 + 1 = 15 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h30 : (1551 : ℕ) ^ 30 % 10 ^ 122 = 522822096661156652966570752381328043706072465905480472490109869752641443106457825448875008884001 := by
      have step := pow_mod_double (k := 1551) (e := 15) (m := 10 ^ 122) h15
      have he : 2 * 15 = 30 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h60 : (1551 : ℕ) ^ 60 % 10 ^ 122 = 46048933161182443355415336881189460815934081409253189564486638017742426222800267220037225803993667621116261976675473768001 := by
      have step := pow_mod_double (k := 1551) (e := 30) (m := 10 ^ 122) h30
      have he : 2 * 30 = 60 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h121 : (1551 : ℕ) ^ 121 % 10 ^ 122 = 20882152714751310380230861004575106235815351469072780920034241861077822511277039755084406203184042298318845886064652337551 := by
      have step := pow_mod_double_add_one (k := 1551) (e := 60) (m := 10 ^ 122) h60
      have he : 2 * 60 + 1 = 121 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h243 : (1551 : ℕ) ^ 243 % 10 ^ 122 = 67899207937084006968126705768849018416927691102171634169811515045956641323814260513691329430791074476864695475897694959151 := by
      have step := pow_mod_double_add_one (k := 1551) (e := 121) (m := 10 ^ 122) h121
      have he : 2 * 121 + 1 = 243 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h486 : (1551 : ℕ) ^ 486 % 10 ^ 122 = 54064811707388517712455811350763632489691303224133666075183064904394708356230615511845832734378623774215323135115558640801 := by
      have step := pow_mod_double (k := 1551) (e := 243) (m := 10 ^ 122) h243
      have he : 2 * 243 = 486 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h486
  rw [hmod]
  decide
private theorem cert_1551 : ExponentCertificate 1551 486 486 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1551
private theorem cert_1552 : ExponentCertificate 1552 487 486 := by decide
private theorem cert_1553 : ExponentCertificate 1553 487 486 := by decide
private theorem cert_1554 : ExponentCertificate 1554 487 486 := by decide
private theorem cert_1555 : ExponentCertificate 1555 487 487 := by decide
private theorem cert_1556 : ExponentCertificate 1556 488 487 := by decide
private theorem cert_1557 : ExponentCertificate 1557 488 487 := by decide
private theorem cert_1558 : ExponentCertificate 1558 488 488 := by decide
private theorem cert_1559 : ExponentCertificate 1559 488 488 := by decide
private theorem cert_1560 : ExponentCertificate 1560 489 488 := by decide
private theorem cert_1561 : ExponentCertificate 1561 489 488 := by decide
private theorem cert_1562 : ExponentCertificate 1562 489 489 := by decide
private theorem cert_1563 : ExponentCertificate 1563 490 489 := by decide
private theorem cert_1564 : ExponentCertificate 1564 490 489 := by decide
private theorem cert_1565 : ExponentCertificate 1565 490 489 := by decide
private theorem cert_1566 : ExponentCertificate 1566 490 490 := by decide
private theorem cert_1567 : ExponentCertificate 1567 491 490 := by decide
private theorem cert_1568 : ExponentCertificate 1568 491 490 := by decide
private theorem cert_1569 : ExponentCertificate 1569 491 490 := by decide
private theorem cert_1570 : ExponentCertificate 1570 491 491 := by decide
private theorem cert_1571 : ExponentCertificate 1571 492 491 := by decide
private theorem cert_1572 : ExponentCertificate 1572 492 491 := by decide
private theorem cert_1573 : ExponentCertificate 1573 492 492 := by decide
private theorem cert_1574 : ExponentCertificate 1574 493 492 := by decide
private theorem cert_1575 : ExponentCertificate 1575 493 492 := by decide
private theorem cert_1576 : ExponentCertificate 1576 493 492 := by decide
private theorem cert_1577 : ExponentCertificate 1577 493 493 := by decide
private theorem cert_1578 : ExponentCertificate 1578 494 493 := by decide
private theorem cert_1579 : ExponentCertificate 1579 494 493 := by decide
private theorem cert_1580 : ExponentCertificate 1580 494 493 := by decide
private theorem cert_1581 : ExponentCertificate 1581 494 494 := by decide
private theorem cert_1582 : ExponentCertificate 1582 495 494 := by decide
private theorem cert_1583 : ExponentCertificate 1583 495 494 := by decide
private theorem suffix_1584 : 495 < digitSum ((1584 : ℕ) ^ 495 % 10 ^ 124) := by
  have hmod : (1584 : ℕ) ^ 495 % 10 ^ 124 = 8829680124354578819575912781538890744298039616482151991924354781056427033993016660988512098150857487069448895165461717581824 := by
    have h1 : (1584 : ℕ) ^ 1 % 10 ^ 124 = 1584 := by decide
    have h3 : (1584 : ℕ) ^ 3 % 10 ^ 124 = 3974344704 := by
      have step := pow_mod_double_add_one (k := 1584) (e := 1) (m := 10 ^ 124) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (1584 : ℕ) ^ 7 % 10 ^ 124 = 25019938668721150623744 := by
      have step := pow_mod_double_add_one (k := 1584) (e := 3) (m := 10 ^ 124) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h15 : (1584 : ℕ) ^ 15 % 10 ^ 124 = 991579772282723558316280336344366810646418817024 := by
      have step := pow_mod_double_add_one (k := 1584) (e := 7) (m := 10 ^ 124) h7
      have he : 2 * 7 + 1 = 15 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h30 : (1584 : ℕ) ^ 30 % 10 ^ 124 = 983230444800257907068504530027880279303751733486576690145936444348932952430914433882707592216576 := by
      have step := pow_mod_double (k := 1584) (e := 15) (m := 10 ^ 124) h15
      have he : 2 * 15 = 30 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h61 : (1584 : ℕ) ^ 61 % 10 ^ 124 = 1507226807958027279817391557510699249425635606983752407147222565357478554180710521620045250469350441121928020332032435421184 := by
      have step := pow_mod_double_add_one (k := 1584) (e := 30) (m := 10 ^ 124) h30
      have he : 2 * 30 + 1 = 61 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h123 : (1584 : ℕ) ^ 123 % 10 ^ 124 = 4840091044263182567570823778625248819995628591510769261853699920393724308879898222854074171960672333628563033839425923579904 := by
      have step := pow_mod_double_add_one (k := 1584) (e := 61) (m := 10 ^ 124) h61
      have he : 2 * 61 + 1 = 123 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h247 : (1584 : ℕ) ^ 247 % 10 ^ 124 = 7953588734001883919650695450605880258716357581957653060011922037156161158719717010107126142665712033635331907098691076358144 := by
      have step := pow_mod_double_add_one (k := 1584) (e := 123) (m := 10 ^ 124) h123
      have he : 2 * 123 + 1 = 247 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h495 : (1584 : ℕ) ^ 495 % 10 ^ 124 = 8829680124354578819575912781538890744298039616482151991924354781056427033993016660988512098150857487069448895165461717581824 := by
      have step := pow_mod_double_add_one (k := 1584) (e := 247) (m := 10 ^ 124) h247
      have he : 2 * 247 + 1 = 495 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h495
  rw [hmod]
  decide
private theorem cert_1584 : ExponentCertificate 1584 495 495 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1584
private theorem cert_1585 : ExponentCertificate 1585 495 495 := by decide
private theorem cert_1586 : ExponentCertificate 1586 496 495 := by decide
private theorem cert_1587 : ExponentCertificate 1587 496 495 := by decide
private theorem cert_1588 : ExponentCertificate 1588 496 496 := by decide
private theorem cert_1589 : ExponentCertificate 1589 497 496 := by decide
private theorem cert_1590 : ExponentCertificate 1590 497 496 := by decide
private theorem cert_1591 : ExponentCertificate 1591 497 496 := by decide
private theorem cert_1592 : ExponentCertificate 1592 497 497 := by decide
private theorem cert_1593 : ExponentCertificate 1593 498 497 := by decide
private theorem cert_1594 : ExponentCertificate 1594 498 497 := by decide
private theorem cert_1595 : ExponentCertificate 1595 498 498 := by decide
private theorem cert_1596 : ExponentCertificate 1596 498 498 := by decide
private theorem cert_1597 : ExponentCertificate 1597 499 498 := by decide
private theorem cert_1598 : ExponentCertificate 1598 499 498 := by decide
private theorem cert_1599 : ExponentCertificate 1599 499 499 := by decide
private theorem cert_1600 : ExponentCertificate 1600 500 499 := by decide

private theorem certificates_1501_1600 {k : ℕ} (hlo : 1501 ≤ k) (hhi : k ≤ 1600) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨473, 472, cert_1501⟩
  · exact ⟨473, 472, cert_1502⟩
  · exact ⟨473, 473, cert_1503⟩
  · exact ⟨474, 473, cert_1504⟩
  · exact ⟨474, 473, cert_1505⟩
  · exact ⟨474, 473, cert_1506⟩
  · exact ⟨474, 474, cert_1507⟩
  · exact ⟨475, 474, cert_1508⟩
  · exact ⟨475, 474, cert_1509⟩
  · exact ⟨475, 474, cert_1510⟩
  · exact ⟨475, 475, cert_1511⟩
  · exact ⟨476, 475, cert_1512⟩
  · exact ⟨476, 475, cert_1513⟩
  · exact ⟨476, 476, cert_1514⟩
  · exact ⟨477, 476, cert_1515⟩
  · exact ⟨477, 476, cert_1516⟩
  · exact ⟨477, 476, cert_1517⟩
  · exact ⟨477, 477, cert_1518⟩
  · exact ⟨478, 477, cert_1519⟩
  · exact ⟨478, 477, cert_1520⟩
  · exact ⟨478, 477, cert_1521⟩
  · exact ⟨478, 478, cert_1522⟩
  · exact ⟨479, 478, cert_1523⟩
  · exact ⟨479, 478, cert_1524⟩
  · exact ⟨479, 479, cert_1525⟩
  · exact ⟨480, 479, cert_1526⟩
  · exact ⟨480, 479, cert_1527⟩
  · exact ⟨480, 479, cert_1528⟩
  · exact ⟨480, 480, cert_1529⟩
  · exact ⟨481, 480, cert_1530⟩
  · exact ⟨481, 480, cert_1531⟩
  · exact ⟨481, 480, cert_1532⟩
  · exact ⟨481, 481, cert_1533⟩
  · exact ⟨482, 481, cert_1534⟩
  · exact ⟨482, 481, cert_1535⟩
  · exact ⟨482, 482, cert_1536⟩
  · exact ⟨483, 482, cert_1537⟩
  · exact ⟨483, 482, cert_1538⟩
  · exact ⟨483, 482, cert_1539⟩
  · exact ⟨483, 483, cert_1540⟩
  · exact ⟨484, 483, cert_1541⟩
  · exact ⟨484, 483, cert_1542⟩
  · exact ⟨484, 483, cert_1543⟩
  · exact ⟨484, 484, cert_1544⟩
  · exact ⟨485, 484, cert_1545⟩
  · exact ⟨485, 484, cert_1546⟩
  · exact ⟨485, 485, cert_1547⟩
  · exact ⟨485, 485, cert_1548⟩
  · exact ⟨486, 485, cert_1549⟩
  · exact ⟨486, 485, cert_1550⟩
  · exact ⟨486, 486, cert_1551⟩
  · exact ⟨487, 486, cert_1552⟩
  · exact ⟨487, 486, cert_1553⟩
  · exact ⟨487, 486, cert_1554⟩
  · exact ⟨487, 487, cert_1555⟩
  · exact ⟨488, 487, cert_1556⟩
  · exact ⟨488, 487, cert_1557⟩
  · exact ⟨488, 488, cert_1558⟩
  · exact ⟨488, 488, cert_1559⟩
  · exact ⟨489, 488, cert_1560⟩
  · exact ⟨489, 488, cert_1561⟩
  · exact ⟨489, 489, cert_1562⟩
  · exact ⟨490, 489, cert_1563⟩
  · exact ⟨490, 489, cert_1564⟩
  · exact ⟨490, 489, cert_1565⟩
  · exact ⟨490, 490, cert_1566⟩
  · exact ⟨491, 490, cert_1567⟩
  · exact ⟨491, 490, cert_1568⟩
  · exact ⟨491, 490, cert_1569⟩
  · exact ⟨491, 491, cert_1570⟩
  · exact ⟨492, 491, cert_1571⟩
  · exact ⟨492, 491, cert_1572⟩
  · exact ⟨492, 492, cert_1573⟩
  · exact ⟨493, 492, cert_1574⟩
  · exact ⟨493, 492, cert_1575⟩
  · exact ⟨493, 492, cert_1576⟩
  · exact ⟨493, 493, cert_1577⟩
  · exact ⟨494, 493, cert_1578⟩
  · exact ⟨494, 493, cert_1579⟩
  · exact ⟨494, 493, cert_1580⟩
  · exact ⟨494, 494, cert_1581⟩
  · exact ⟨495, 494, cert_1582⟩
  · exact ⟨495, 494, cert_1583⟩
  · exact ⟨495, 495, cert_1584⟩
  · exact ⟨495, 495, cert_1585⟩
  · exact ⟨496, 495, cert_1586⟩
  · exact ⟨496, 495, cert_1587⟩
  · exact ⟨496, 496, cert_1588⟩
  · exact ⟨497, 496, cert_1589⟩
  · exact ⟨497, 496, cert_1590⟩
  · exact ⟨497, 496, cert_1591⟩
  · exact ⟨497, 497, cert_1592⟩
  · exact ⟨498, 497, cert_1593⟩
  · exact ⟨498, 497, cert_1594⟩
  · exact ⟨498, 498, cert_1595⟩
  · exact ⟨498, 498, cert_1596⟩
  · exact ⟨499, 498, cert_1597⟩
  · exact ⟨499, 498, cert_1598⟩
  · exact ⟨499, 499, cert_1599⟩
  · exact ⟨500, 499, cert_1600⟩

theorem no_fixed_digitCount_1501_1600 {n : ℕ} (hn : a n = n)
    (hlo : 1501 ≤ digitCount n) (hhi : digitCount n ≤ 1600) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_1501_1600 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_1501_1600
end OeisA113010
