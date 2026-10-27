import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 5601
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_5501 : ExponentCertificate 5501 1471 1470 := by decide
private theorem cert_5502 : ExponentCertificate 5502 1471 1470 := by decide
private theorem suffix_5503 : 1471 < digitSum ((5503 : ℕ) ^ 1471 % 10 ^ 368) := by
  have hmod : (5503 : ℕ) ^ 1471 % 10 ^ 368 = 70619493620297646657795798519384803197780421027353413726706217480594219965273082774704884990919151716194948531068093792975731562180710602104058109213116446970044350801220116575425572336949021462851706639161061156278035406037640753185318360693982675194728285451716442848135576861627665230451773045962534719554060433438020782383774394053464222907103832922432083036818047 := by
    have h1 : (5503 : ℕ) ^ 1 % 10 ^ 368 = 5503 := by decide
    have h2 : (5503 : ℕ) ^ 2 % 10 ^ 368 = 30283009 := by
      have step := pow_mod_double (k := 5503) (e := 1) (m := 10 ^ 368) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (5503 : ℕ) ^ 5 % 10 ^ 368 = 5046584669419727743 := by
      have step := pow_mod_double_add_one (k := 5503) (e := 2) (m := 10 ^ 368) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (5503 : ℕ) ^ 11 % 10 ^ 368 = 140150496591399091777465830463878038891647 := by
      have step := pow_mod_double_add_one (k := 5503) (e := 5) (m := 10 ^ 368) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h22 : (5503 : ℕ) ^ 22 % 10 ^ 368 = 19642161694815768442875601280340286912591513223476915852270064809980366692206372609 := by
      have step := pow_mod_double (k := 5503) (e := 11) (m := 10 ^ 368) h11
      have he : 2 * 11 = 22 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h45 : (5503 : ℕ) ^ 45 % 10 ^ 368 = 2123137281797219098842605866683757664078201964848989643796204020388159421575866264715434661580367921204283577313743268234080400376495935707693695888956533009129304246143 := by
      have step := pow_mod_double_add_one (k := 5503) (e := 22) (m := 10 ^ 368) h22
      have he : 2 * 22 + 1 = 45 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h91 : (5503 : ℕ) ^ 91 % 10 ^ 368 = 24805938681217134630077310175453562136647156641316315758752997199546150333190457887211749064233446054458753832821558637505883243308296608952433348980868913632294541086926219716570401559644645205538971915583323606698745855339861293825956116254511467283868197021563242120041216541238238537384765544320248309467887500132794512915286245661598847 := by
      have step := pow_mod_double_add_one (k := 5503) (e := 45) (m := 10 ^ 368) h45
      have he : 2 * 45 + 1 = 91 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h183 : (5503 : ℕ) ^ 183 % 10 ^ 368 = 80788361153270282959603084634586373686611985343787966758746235037424413645684086658707552432351225286516360462883968054919473753668469230254642533046506773769435065132557044259887033368678531146931857673106603777388763307010414105447914820899363345123300777778102831424927848538638384879602008258073964428274215267318954855758049750507196084234691950491250127566937727 := by
      have step := pow_mod_double_add_one (k := 5503) (e := 91) (m := 10 ^ 368) h91
      have he : 2 * 91 + 1 = 183 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h367 : (5503 : ℕ) ^ 367 % 10 ^ 368 = 83668179641785269317876014764167725899960565873253767540645337467671912311218477094829440668306123902096001854184320786535056258748195471653295785772828949738742709578908353062454644998988519415237306785038793230286063249984332527759310392545913148647412393743758091921026621602361465413471864588098435986522083604134817571677727817955755245676179226359046760483689087 := by
      have step := pow_mod_double_add_one (k := 5503) (e := 183) (m := 10 ^ 368) h183
      have he : 2 * 183 + 1 = 367 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h735 : (5503 : ℕ) ^ 735 % 10 ^ 368 = 85717466837860783756743390821843345205711717895223016187669028307252085846386223231913627170178235699303599840363801269673859722217820798131889569245149912172325322614974622813955517179454775903667421343112361937565541603254638427714733736688384291659294993705615956316531559402741504574017239180170546497090019446655993248817977629099452624922412938452664974563310207 := by
      have step := pow_mod_double_add_one (k := 5503) (e := 367) (m := 10 ^ 368) h367
      have he : 2 * 367 + 1 = 735 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1471 : (5503 : ℕ) ^ 1471 % 10 ^ 368 = 70619493620297646657795798519384803197780421027353413726706217480594219965273082774704884990919151716194948531068093792975731562180710602104058109213116446970044350801220116575425572336949021462851706639161061156278035406037640753185318360693982675194728285451716442848135576861627665230451773045962534719554060433438020782383774394053464222907103832922432083036818047 := by
      have step := pow_mod_double_add_one (k := 5503) (e := 735) (m := 10 ^ 368) h735
      have he : 2 * 735 + 1 = 1471 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1471
  rw [hmod]
  decide
private theorem cert_5503 : ExponentCertificate 5503 1471 1471 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5503) (by decide) (by decide) (by decide) suffix_5503
private theorem cert_5504 : ExponentCertificate 5504 1472 1471 := by decide
private theorem cert_5505 : ExponentCertificate 5505 1472 1471 := by decide
private theorem cert_5506 : ExponentCertificate 5506 1472 1471 := by decide
private theorem cert_5507 : ExponentCertificate 5507 1472 1472 := by decide
private theorem cert_5508 : ExponentCertificate 5508 1473 1472 := by decide
private theorem cert_5509 : ExponentCertificate 5509 1473 1472 := by decide
private theorem cert_5510 : ExponentCertificate 5510 1473 1472 := by decide
private theorem cert_5511 : ExponentCertificate 5511 1473 1473 := by decide
private theorem cert_5512 : ExponentCertificate 5512 1474 1473 := by decide
private theorem cert_5513 : ExponentCertificate 5513 1474 1473 := by decide
private theorem cert_5514 : ExponentCertificate 5514 1474 1473 := by decide
private theorem cert_5515 : ExponentCertificate 5515 1474 1473 := by decide
private theorem cert_5516 : ExponentCertificate 5516 1474 1474 := by decide
private theorem cert_5517 : ExponentCertificate 5517 1475 1474 := by decide
private theorem cert_5518 : ExponentCertificate 5518 1475 1474 := by decide
private theorem cert_5519 : ExponentCertificate 5519 1475 1474 := by decide
private theorem cert_5520 : ExponentCertificate 5520 1475 1475 := by decide
private theorem cert_5521 : ExponentCertificate 5521 1476 1475 := by decide
private theorem cert_5522 : ExponentCertificate 5522 1476 1475 := by decide
private theorem cert_5523 : ExponentCertificate 5523 1476 1475 := by decide
private theorem cert_5524 : ExponentCertificate 5524 1476 1476 := by decide
private theorem cert_5525 : ExponentCertificate 5525 1477 1476 := by decide
private theorem cert_5526 : ExponentCertificate 5526 1477 1476 := by decide
private theorem cert_5527 : ExponentCertificate 5527 1477 1476 := by decide
private theorem cert_5528 : ExponentCertificate 5528 1477 1477 := by decide
private theorem cert_5529 : ExponentCertificate 5529 1478 1477 := by decide
private theorem cert_5530 : ExponentCertificate 5530 1478 1477 := by decide
private theorem cert_5531 : ExponentCertificate 5531 1478 1477 := by decide
private theorem cert_5532 : ExponentCertificate 5532 1478 1478 := by decide
private theorem cert_5533 : ExponentCertificate 5533 1478 1478 := by decide
private theorem cert_5534 : ExponentCertificate 5534 1479 1478 := by decide
private theorem cert_5535 : ExponentCertificate 5535 1479 1478 := by decide
private theorem cert_5536 : ExponentCertificate 5536 1479 1478 := by decide
private theorem cert_5537 : ExponentCertificate 5537 1479 1479 := by decide
private theorem cert_5538 : ExponentCertificate 5538 1480 1479 := by decide
private theorem cert_5539 : ExponentCertificate 5539 1480 1479 := by decide
private theorem cert_5540 : ExponentCertificate 5540 1480 1479 := by decide
private theorem cert_5541 : ExponentCertificate 5541 1480 1480 := by decide
private theorem cert_5542 : ExponentCertificate 5542 1481 1480 := by decide
private theorem cert_5543 : ExponentCertificate 5543 1481 1480 := by decide
private theorem cert_5544 : ExponentCertificate 5544 1481 1480 := by decide
private theorem cert_5545 : ExponentCertificate 5545 1481 1481 := by decide
private theorem cert_5546 : ExponentCertificate 5546 1482 1481 := by decide
private theorem cert_5547 : ExponentCertificate 5547 1482 1481 := by decide
private theorem cert_5548 : ExponentCertificate 5548 1482 1481 := by decide
private theorem cert_5549 : ExponentCertificate 5549 1482 1482 := by decide
private theorem cert_5550 : ExponentCertificate 5550 1482 1482 := by decide
private theorem cert_5551 : ExponentCertificate 5551 1483 1482 := by decide
private theorem cert_5552 : ExponentCertificate 5552 1483 1482 := by decide
private theorem cert_5553 : ExponentCertificate 5553 1483 1482 := by decide
private theorem cert_5554 : ExponentCertificate 5554 1483 1483 := by decide
private theorem cert_5555 : ExponentCertificate 5555 1484 1483 := by decide
private theorem cert_5556 : ExponentCertificate 5556 1484 1483 := by decide
private theorem cert_5557 : ExponentCertificate 5557 1484 1483 := by decide
private theorem cert_5558 : ExponentCertificate 5558 1484 1484 := by decide
private theorem cert_5559 : ExponentCertificate 5559 1485 1484 := by decide
private theorem cert_5560 : ExponentCertificate 5560 1485 1484 := by decide
private theorem cert_5561 : ExponentCertificate 5561 1485 1484 := by decide
private theorem suffix_5562 : 1485 < digitSum ((5562 : ℕ) ^ 1485 % 10 ^ 372) := by
  have hmod : (5562 : ℕ) ^ 1485 % 10 ^ 372 = 274302472097459141830403905685139217286520899049073806968860538122628604687638792649145701743493148410323304172202317888084131448317351232432137591891734351092395750779167572218158864226564035280949049051526650128121798664092260270352935658241714666426666895823979199185448201568395059089972777030307398379506866813400616643996904367296294449113864782250287988382453727232 := by
    have h1 : (5562 : ℕ) ^ 1 % 10 ^ 372 = 5562 := by decide
    have h2 : (5562 : ℕ) ^ 2 % 10 ^ 372 = 30935844 := by
      have step := pow_mod_double (k := 5562) (e := 1) (m := 10 ^ 372) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (5562 : ℕ) ^ 5 % 10 ^ 372 = 5322981081485372832 := by
      have step := pow_mod_double_add_one (k := 5562) (e := 2) (m := 10 ^ 372) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (5562 : ℕ) ^ 11 % 10 ^ 372 = 157594417677000315249077595548583060645888 := by
      have step := pow_mod_double_add_one (k := 5562) (e := 5) (m := 10 ^ 372) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h23 : (5562 : ℕ) ^ 23 % 10 ^ 372 = 138137834686183637341490129754433203508224458778262853741762254319567634267089538121728 := by
      have step := pow_mod_double_add_one (k := 5562) (e := 11) (m := 10 ^ 372) h11
      have he : 2 * 11 + 1 = 23 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h46 : (5562 : ℕ) ^ 46 % 10 ^ 372 = 19082061371787399248037913868510356846227949476271896415724733888337749001669385037081106596723237822568925890351136843917371037916009645016074908587663277181994578145705984 := by
      have step := pow_mod_double (k := 5562) (e := 23) (m := 10 ^ 372) h23
      have he : 2 * 23 = 46 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h92 : (5562 : ℕ) ^ 92 % 10 ^ 372 = 364125066196660801190697445123263979584772572706703770111687602821559699422250728646699742772242753538106169521428527322665758233489689718182586869339052983014189795856461004464193198953630906256348502482891395848328618236480868558032904834823462120504544413967286411898674085825296727877333693422860905095217987497294546332618161539737773408256 := by
      have step := pow_mod_double (k := 5562) (e := 46) (m := 10 ^ 372) h46
      have he : 2 * 46 = 92 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h185 : (5562 : ℕ) ^ 185 % 10 ^ 372 = 607332867133969954005248392605407559846762043838087477135543435973373916224987482822616971750578845819489670713259880670472227198435046643716951287205876238780194552606839950387217326965604671476859765717156467716003394784606701579859560039659079425352435701605592713419552578620428410439369751971135863810926815828192286471593153132307517455365376924660738865285124063232 := by
      have step := pow_mod_double_add_one (k := 5562) (e := 92) (m := 10 ^ 372) h92
      have he : 2 * 92 + 1 = 185 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h371 : (5562 : ℕ) ^ 371 % 10 ^ 372 = 287446895940579982094438313782209314457014141853677377980919871147370952607587232526063981844520323292668588501531471566976464023160410982628843566387458895835515502939705924904559616793265948614443375802460249892423955801644126298107650201569715070464134797644129847028657000572931269550486974236337617073163063356979331922071829767970525601592943486275763813821697753088 := by
      have step := pow_mod_double_add_one (k := 5562) (e := 185) (m := 10 ^ 372) h185
      have he : 2 * 185 + 1 = 371 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h742 : (5562 : ℕ) ^ 742 % 10 ^ 372 = 992182580692353455467027896378203559949674282506764340745709860260265657056603009120782950832589147273985787967397665797482250561537076925464869877244968788845020212109990908692464198223629979404305053174368302517104138806991152617406581875884310820376766789166247755960129478678024737853566695708225643210540631418416640773036688540392189098219950261346006517867813535744 := by
      have step := pow_mod_double (k := 5562) (e := 371) (m := 10 ^ 372) h371
      have he : 2 * 371 = 742 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1485 : (5562 : ℕ) ^ 1485 % 10 ^ 372 = 274302472097459141830403905685139217286520899049073806968860538122628604687638792649145701743493148410323304172202317888084131448317351232432137591891734351092395750779167572218158864226564035280949049051526650128121798664092260270352935658241714666426666895823979199185448201568395059089972777030307398379506866813400616643996904367296294449113864782250287988382453727232 := by
      have step := pow_mod_double_add_one (k := 5562) (e := 742) (m := 10 ^ 372) h742
      have he : 2 * 742 + 1 = 1485 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1485
  rw [hmod]
  decide
private theorem cert_5562 : ExponentCertificate 5562 1485 1485 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5562) (by decide) (by decide) (by decide) suffix_5562
private theorem cert_5563 : ExponentCertificate 5563 1486 1485 := by decide
private theorem cert_5564 : ExponentCertificate 5564 1486 1485 := by decide
private theorem cert_5565 : ExponentCertificate 5565 1486 1485 := by decide
private theorem cert_5566 : ExponentCertificate 5566 1486 1486 := by decide
private theorem cert_5567 : ExponentCertificate 5567 1487 1486 := by decide
private theorem cert_5568 : ExponentCertificate 5568 1487 1486 := by decide
private theorem cert_5569 : ExponentCertificate 5569 1487 1486 := by decide
private theorem cert_5570 : ExponentCertificate 5570 1487 1486 := by decide
private theorem cert_5571 : ExponentCertificate 5571 1487 1487 := by decide
private theorem cert_5572 : ExponentCertificate 5572 1488 1487 := by decide
private theorem cert_5573 : ExponentCertificate 5573 1488 1487 := by decide
private theorem cert_5574 : ExponentCertificate 5574 1488 1487 := by decide
private theorem cert_5575 : ExponentCertificate 5575 1488 1488 := by decide
private theorem cert_5576 : ExponentCertificate 5576 1489 1488 := by decide
private theorem cert_5577 : ExponentCertificate 5577 1489 1488 := by decide
private theorem cert_5578 : ExponentCertificate 5578 1489 1488 := by decide
private theorem cert_5579 : ExponentCertificate 5579 1489 1489 := by decide
private theorem cert_5580 : ExponentCertificate 5580 1490 1489 := by decide
private theorem cert_5581 : ExponentCertificate 5581 1490 1489 := by decide
private theorem cert_5582 : ExponentCertificate 5582 1490 1489 := by decide
private theorem cert_5583 : ExponentCertificate 5583 1490 1490 := by decide
private theorem cert_5584 : ExponentCertificate 5584 1491 1490 := by decide
private theorem cert_5585 : ExponentCertificate 5585 1491 1490 := by decide
private theorem cert_5586 : ExponentCertificate 5586 1491 1490 := by decide
private theorem cert_5587 : ExponentCertificate 5587 1491 1490 := by decide
private theorem cert_5588 : ExponentCertificate 5588 1491 1491 := by decide
private theorem cert_5589 : ExponentCertificate 5589 1492 1491 := by decide
private theorem cert_5590 : ExponentCertificate 5590 1492 1491 := by decide
private theorem cert_5591 : ExponentCertificate 5591 1492 1491 := by decide
private theorem cert_5592 : ExponentCertificate 5592 1492 1492 := by decide
private theorem cert_5593 : ExponentCertificate 5593 1493 1492 := by decide
private theorem cert_5594 : ExponentCertificate 5594 1493 1492 := by decide
private theorem cert_5595 : ExponentCertificate 5595 1493 1492 := by decide
private theorem cert_5596 : ExponentCertificate 5596 1493 1493 := by decide
private theorem cert_5597 : ExponentCertificate 5597 1494 1493 := by decide
private theorem cert_5598 : ExponentCertificate 5598 1494 1493 := by decide
private theorem cert_5599 : ExponentCertificate 5599 1494 1493 := by decide
private theorem cert_5600 : ExponentCertificate 5600 1494 1494 := by decide

private theorem certificates_5501_5600 {k : ℕ} (hlo : 5501 ≤ k) (hhi : k ≤ 5600) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1471, 1470, cert_5501⟩
  · exact ⟨1471, 1470, cert_5502⟩
  · exact ⟨1471, 1471, cert_5503⟩
  · exact ⟨1472, 1471, cert_5504⟩
  · exact ⟨1472, 1471, cert_5505⟩
  · exact ⟨1472, 1471, cert_5506⟩
  · exact ⟨1472, 1472, cert_5507⟩
  · exact ⟨1473, 1472, cert_5508⟩
  · exact ⟨1473, 1472, cert_5509⟩
  · exact ⟨1473, 1472, cert_5510⟩
  · exact ⟨1473, 1473, cert_5511⟩
  · exact ⟨1474, 1473, cert_5512⟩
  · exact ⟨1474, 1473, cert_5513⟩
  · exact ⟨1474, 1473, cert_5514⟩
  · exact ⟨1474, 1473, cert_5515⟩
  · exact ⟨1474, 1474, cert_5516⟩
  · exact ⟨1475, 1474, cert_5517⟩
  · exact ⟨1475, 1474, cert_5518⟩
  · exact ⟨1475, 1474, cert_5519⟩
  · exact ⟨1475, 1475, cert_5520⟩
  · exact ⟨1476, 1475, cert_5521⟩
  · exact ⟨1476, 1475, cert_5522⟩
  · exact ⟨1476, 1475, cert_5523⟩
  · exact ⟨1476, 1476, cert_5524⟩
  · exact ⟨1477, 1476, cert_5525⟩
  · exact ⟨1477, 1476, cert_5526⟩
  · exact ⟨1477, 1476, cert_5527⟩
  · exact ⟨1477, 1477, cert_5528⟩
  · exact ⟨1478, 1477, cert_5529⟩
  · exact ⟨1478, 1477, cert_5530⟩
  · exact ⟨1478, 1477, cert_5531⟩
  · exact ⟨1478, 1478, cert_5532⟩
  · exact ⟨1478, 1478, cert_5533⟩
  · exact ⟨1479, 1478, cert_5534⟩
  · exact ⟨1479, 1478, cert_5535⟩
  · exact ⟨1479, 1478, cert_5536⟩
  · exact ⟨1479, 1479, cert_5537⟩
  · exact ⟨1480, 1479, cert_5538⟩
  · exact ⟨1480, 1479, cert_5539⟩
  · exact ⟨1480, 1479, cert_5540⟩
  · exact ⟨1480, 1480, cert_5541⟩
  · exact ⟨1481, 1480, cert_5542⟩
  · exact ⟨1481, 1480, cert_5543⟩
  · exact ⟨1481, 1480, cert_5544⟩
  · exact ⟨1481, 1481, cert_5545⟩
  · exact ⟨1482, 1481, cert_5546⟩
  · exact ⟨1482, 1481, cert_5547⟩
  · exact ⟨1482, 1481, cert_5548⟩
  · exact ⟨1482, 1482, cert_5549⟩
  · exact ⟨1482, 1482, cert_5550⟩
  · exact ⟨1483, 1482, cert_5551⟩
  · exact ⟨1483, 1482, cert_5552⟩
  · exact ⟨1483, 1482, cert_5553⟩
  · exact ⟨1483, 1483, cert_5554⟩
  · exact ⟨1484, 1483, cert_5555⟩
  · exact ⟨1484, 1483, cert_5556⟩
  · exact ⟨1484, 1483, cert_5557⟩
  · exact ⟨1484, 1484, cert_5558⟩
  · exact ⟨1485, 1484, cert_5559⟩
  · exact ⟨1485, 1484, cert_5560⟩
  · exact ⟨1485, 1484, cert_5561⟩
  · exact ⟨1485, 1485, cert_5562⟩
  · exact ⟨1486, 1485, cert_5563⟩
  · exact ⟨1486, 1485, cert_5564⟩
  · exact ⟨1486, 1485, cert_5565⟩
  · exact ⟨1486, 1486, cert_5566⟩
  · exact ⟨1487, 1486, cert_5567⟩
  · exact ⟨1487, 1486, cert_5568⟩
  · exact ⟨1487, 1486, cert_5569⟩
  · exact ⟨1487, 1486, cert_5570⟩
  · exact ⟨1487, 1487, cert_5571⟩
  · exact ⟨1488, 1487, cert_5572⟩
  · exact ⟨1488, 1487, cert_5573⟩
  · exact ⟨1488, 1487, cert_5574⟩
  · exact ⟨1488, 1488, cert_5575⟩
  · exact ⟨1489, 1488, cert_5576⟩
  · exact ⟨1489, 1488, cert_5577⟩
  · exact ⟨1489, 1488, cert_5578⟩
  · exact ⟨1489, 1489, cert_5579⟩
  · exact ⟨1490, 1489, cert_5580⟩
  · exact ⟨1490, 1489, cert_5581⟩
  · exact ⟨1490, 1489, cert_5582⟩
  · exact ⟨1490, 1490, cert_5583⟩
  · exact ⟨1491, 1490, cert_5584⟩
  · exact ⟨1491, 1490, cert_5585⟩
  · exact ⟨1491, 1490, cert_5586⟩
  · exact ⟨1491, 1490, cert_5587⟩
  · exact ⟨1491, 1491, cert_5588⟩
  · exact ⟨1492, 1491, cert_5589⟩
  · exact ⟨1492, 1491, cert_5590⟩
  · exact ⟨1492, 1491, cert_5591⟩
  · exact ⟨1492, 1492, cert_5592⟩
  · exact ⟨1493, 1492, cert_5593⟩
  · exact ⟨1493, 1492, cert_5594⟩
  · exact ⟨1493, 1492, cert_5595⟩
  · exact ⟨1493, 1493, cert_5596⟩
  · exact ⟨1494, 1493, cert_5597⟩
  · exact ⟨1494, 1493, cert_5598⟩
  · exact ⟨1494, 1493, cert_5599⟩
  · exact ⟨1494, 1494, cert_5600⟩

theorem no_fixed_digitCount_5501_5600 {n : ℕ} (hn : a n = n)
    (hlo : 5501 ≤ digitCount n) (hhi : digitCount n ≤ 5600) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_5501_5600 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_5501_5600
end OeisA113010
