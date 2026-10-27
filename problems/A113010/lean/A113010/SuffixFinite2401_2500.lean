import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2501
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_2401 : ExponentCertificate 2401 710 710 := by decide
private theorem cert_2402 : ExponentCertificate 2402 711 710 := by decide
private theorem cert_2403 : ExponentCertificate 2403 711 710 := by decide
private theorem cert_2404 : ExponentCertificate 2404 711 711 := by decide
private theorem cert_2405 : ExponentCertificate 2405 712 711 := by decide
private theorem cert_2406 : ExponentCertificate 2406 712 711 := by decide
private theorem cert_2407 : ExponentCertificate 2407 712 711 := by decide
private theorem cert_2408 : ExponentCertificate 2408 712 712 := by decide
private theorem cert_2409 : ExponentCertificate 2409 713 712 := by decide
private theorem cert_2410 : ExponentCertificate 2410 713 712 := by decide
private theorem cert_2411 : ExponentCertificate 2411 713 712 := by decide
private theorem cert_2412 : ExponentCertificate 2412 713 713 := by decide
private theorem cert_2413 : ExponentCertificate 2413 714 713 := by decide
private theorem cert_2414 : ExponentCertificate 2414 714 713 := by decide
private theorem cert_2415 : ExponentCertificate 2415 714 713 := by decide
private theorem cert_2416 : ExponentCertificate 2416 714 714 := by decide
private theorem cert_2417 : ExponentCertificate 2417 715 714 := by decide
private theorem cert_2418 : ExponentCertificate 2418 715 714 := by decide
private theorem cert_2419 : ExponentCertificate 2419 715 714 := by decide
private theorem cert_2420 : ExponentCertificate 2420 715 715 := by decide
private theorem cert_2421 : ExponentCertificate 2421 716 715 := by decide
private theorem cert_2422 : ExponentCertificate 2422 716 715 := by decide
private theorem cert_2423 : ExponentCertificate 2423 716 715 := by decide
private theorem cert_2424 : ExponentCertificate 2424 716 716 := by decide
private theorem cert_2425 : ExponentCertificate 2425 717 716 := by decide
private theorem cert_2426 : ExponentCertificate 2426 717 716 := by decide
private theorem cert_2427 : ExponentCertificate 2427 717 716 := by decide
private theorem cert_2428 : ExponentCertificate 2428 717 717 := by decide
private theorem cert_2429 : ExponentCertificate 2429 718 717 := by decide
private theorem cert_2430 : ExponentCertificate 2430 718 717 := by decide
private theorem cert_2431 : ExponentCertificate 2431 718 718 := by decide
private theorem suffix_2432 : 718 < digitSum ((2432 : ℕ) ^ 718 % 10 ^ 180) := by
  have hmod : (2432 : ℕ) ^ 718 % 10 ^ 180 = 187046351907916717007408869380639047860338811853721891048652677027432750256200091236751009819805961144176079064949307791830847954635472433472966640937010748182836642128179572506624 := by
    have h1 : (2432 : ℕ) ^ 1 % 10 ^ 180 = 2432 := by decide
    have h2 : (2432 : ℕ) ^ 2 % 10 ^ 180 = 5914624 := by
      have step := pow_mod_double (k := 2432) (e := 1) (m := 10 ^ 180) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2432 : ℕ) ^ 5 % 10 ^ 180 = 85078113813266432 := by
      have step := pow_mod_double_add_one (k := 2432) (e := 2) (m := 10 ^ 180) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (2432 : ℕ) ^ 11 % 10 ^ 180 = 17603510214456219238035264888601837568 := by
      have step := pow_mod_double_add_one (k := 2432) (e := 5) (m := 10 ^ 180) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h22 : (2432 : ℕ) ^ 22 % 10 ^ 180 = 309883571870464445829362301510549517300127253157713566381221633226256154624 := by
      have step := pow_mod_double (k := 2432) (e := 11) (m := 10 ^ 180) h11
      have he : 2 * 11 = 22 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h44 : (2432 : ℕ) ^ 44 % 10 ^ 180 = 96027828115197303561986044742754373851027545536088594134930790309985127079983384948794976718509290720544610109532555334091028903315409489239396581376 := by
      have step := pow_mod_double (k := 2432) (e := 22) (m := 10 ^ 180) h22
      have he : 2 * 22 = 44 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h89 : (2432 : ℕ) ^ 89 % 10 ^ 180 = 414746912578693445348578018457490756471838107572230257438654344390684264355662923560618911066183147866665162664266020148585190810606404371151909548796022957906516626918401409810432 := by
      have step := pow_mod_double_add_one (k := 2432) (e := 44) (m := 10 ^ 180) h44
      have he : 2 * 44 + 1 = 89 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h179 : (2432 : ℕ) ^ 179 % 10 ^ 180 = 194497608972083378133645291989260618606377442146226161971124012980894182003008871010706631340089600909376866140256713611772886260126779429811327114505948961088820249347756096749568 := by
      have step := pow_mod_double_add_one (k := 2432) (e := 89) (m := 10 ^ 180) h89
      have he : 2 * 89 + 1 = 179 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h359 : (2432 : ℕ) ^ 359 % 10 ^ 180 = 950743305966242412098909130988225097467580032539488998096806257331353473423836236319364526408692236555240274265511559521073379670667909672434814366416311696511464843085216709869568 := by
      have step := pow_mod_double_add_one (k := 2432) (e := 179) (m := 10 ^ 180) h179
      have he : 2 * 179 + 1 = 359 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h718 : (2432 : ℕ) ^ 718 % 10 ^ 180 = 187046351907916717007408869380639047860338811853721891048652677027432750256200091236751009819805961144176079064949307791830847954635472433472966640937010748182836642128179572506624 := by
      have step := pow_mod_double (k := 2432) (e := 359) (m := 10 ^ 180) h359
      have he : 2 * 359 = 718 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h718
  rw [hmod]
  decide
private theorem cert_2432 : ExponentCertificate 2432 718 718 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2432) (by decide) (by decide) (by decide) suffix_2432
private theorem cert_2433 : ExponentCertificate 2433 719 718 := by decide
private theorem cert_2434 : ExponentCertificate 2434 719 718 := by decide
private theorem cert_2435 : ExponentCertificate 2435 719 719 := by decide
private theorem cert_2436 : ExponentCertificate 2436 719 719 := by decide
private theorem cert_2437 : ExponentCertificate 2437 720 719 := by decide
private theorem cert_2438 : ExponentCertificate 2438 720 719 := by decide
private theorem suffix_2439 : 720 < digitSum ((2439 : ℕ) ^ 720 % 10 ^ 180) := by
  have hmod : (2439 : ℕ) ^ 720 % 10 ^ 180 = 298120536356253499999926194317250000215558121753215730701628414332217255918659492227281603677781111926300028086915534188763213840905185612467939098065118410861128973981097518307201 := by
    have h1 : (2439 : ℕ) ^ 1 % 10 ^ 180 = 2439 := by decide
    have h2 : (2439 : ℕ) ^ 2 % 10 ^ 180 = 5948721 := by
      have step := pow_mod_double (k := 2439) (e := 1) (m := 10 ^ 180) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2439 : ℕ) ^ 5 % 10 ^ 180 = 86309579665916199 := by
      have step := pow_mod_double_add_one (k := 2439) (e := 2) (m := 10 ^ 180) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (2439 : ℕ) ^ 11 % 10 ^ 180 = 18168948899199302297645590834991938839 := by
      have step := pow_mod_double_add_one (k := 2439) (e := 5) (m := 10 ^ 180) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h22 : (2439 : ℕ) ^ 22 % 10 ^ 180 = 330110704101715538723791777193109367367537646822418015167677946112316667921 := by
      have step := pow_mod_double (k := 2439) (e := 11) (m := 10 ^ 180) h11
      have he : 2 * 11 = 22 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h45 : (2439 : ℕ) ^ 45 % 10 ^ 180 = 265785334711611626580791123393457530971259018877518768432006160364849171200666309765695999154716458268603512434906727369789906073340919822273028537405799 := by
      have step := pow_mod_double_add_one (k := 2439) (e := 22) (m := 10 ^ 180) h22
      have he : 2 * 22 + 1 = 45 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h90 : (2439 : ℕ) ^ 90 % 10 ^ 180 = 826783520609436616931612479267665840340573244271635344797807320286486055421744174961614385367667571455588577103755813459805394743736332606562042631955855809255933505783736798828401 := by
      have step := pow_mod_double (k := 2439) (e := 45) (m := 10 ^ 180) h45
      have he : 2 * 45 = 90 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h180 : (2439 : ℕ) ^ 180 % 10 ^ 180 = 757358208481424172640734922208035316192936575422331033024713508087087572415449086999888590475661225222805487517708090451795982520342643818224283199017520326492788799499086244216801 := by
      have step := pow_mod_double (k := 2439) (e := 90) (m := 10 ^ 180) h90
      have he : 2 * 90 = 180 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h360 : (2439 : ℕ) ^ 360 % 10 ^ 180 = 57566890877164472874275869285193436572175837311024137791379739424760407893032823405493266073033091292961248814374675519375702953466707700811966136559413375199990430329617890673601 := by
      have step := pow_mod_double (k := 2439) (e := 180) (m := 10 ^ 180) h180
      have he : 2 * 180 = 360 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h720 : (2439 : ℕ) ^ 720 % 10 ^ 180 = 298120536356253499999926194317250000215558121753215730701628414332217255918659492227281603677781111926300028086915534188763213840905185612467939098065118410861128973981097518307201 := by
      have step := pow_mod_double (k := 2439) (e := 360) (m := 10 ^ 180) h360
      have he : 2 * 360 = 720 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h720
  rw [hmod]
  decide
private theorem cert_2439 : ExponentCertificate 2439 720 720 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2439) (by decide) (by decide) (by decide) suffix_2439
private theorem cert_2440 : ExponentCertificate 2440 721 720 := by decide
private theorem cert_2441 : ExponentCertificate 2441 721 720 := by decide
private theorem cert_2442 : ExponentCertificate 2442 721 720 := by decide
private theorem cert_2443 : ExponentCertificate 2443 721 721 := by decide
private theorem cert_2444 : ExponentCertificate 2444 722 721 := by decide
private theorem cert_2445 : ExponentCertificate 2445 722 721 := by decide
private theorem cert_2446 : ExponentCertificate 2446 722 721 := by decide
private theorem cert_2447 : ExponentCertificate 2447 722 722 := by decide
private theorem cert_2448 : ExponentCertificate 2448 723 722 := by decide
private theorem cert_2449 : ExponentCertificate 2449 723 722 := by decide
private theorem cert_2450 : ExponentCertificate 2450 723 722 := by decide
private theorem cert_2451 : ExponentCertificate 2451 723 723 := by decide
private theorem cert_2452 : ExponentCertificate 2452 724 723 := by decide
private theorem cert_2453 : ExponentCertificate 2453 724 723 := by decide
private theorem cert_2454 : ExponentCertificate 2454 724 723 := by decide
private theorem cert_2455 : ExponentCertificate 2455 724 724 := by decide
private theorem cert_2456 : ExponentCertificate 2456 725 724 := by decide
private theorem cert_2457 : ExponentCertificate 2457 725 724 := by decide
private theorem cert_2458 : ExponentCertificate 2458 725 724 := by decide
private theorem suffix_2459 : 725 < digitSum ((2459 : ℕ) ^ 725 % 10 ^ 182) := by
  have hmod : (2459 : ℕ) ^ 725 % 10 ^ 182 = 37559298882588481393408098631686003428120197268037529159826092234641608648630517357376169278455062907132084270851622049528704030977038951158374201730898986523683909786283879196563499 := by
    have h1 : (2459 : ℕ) ^ 1 % 10 ^ 182 = 2459 := by decide
    have h2 : (2459 : ℕ) ^ 2 % 10 ^ 182 = 6046681 := by
      have step := pow_mod_double (k := 2459) (e := 1) (m := 10 ^ 182) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2459 : ℕ) ^ 5 % 10 ^ 182 = 89906821393656299 := by
      have step := pow_mod_double_add_one (k := 2459) (e := 2) (m := 10 ^ 182) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h11 : (2459 : ℕ) ^ 11 % 10 ^ 182 = 19876678634919491563040353526506029059 := by
      have step := pow_mod_double_add_one (k := 2459) (e := 5) (m := 10 ^ 182) h5
      have he : 2 * 5 + 1 = 11 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h22 : (2459 : ℕ) ^ 22 % 10 ^ 182 = 395082353555864982567300382774720273361737660395868131223834289476552425481 := by
      have step := pow_mod_double (k := 2459) (e := 11) (m := 10 ^ 182) h11
      have he : 2 * 11 = 22 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h45 : (2459 : ℕ) ^ 45 % 10 ^ 182 = 383825472518362848094195929181998470519236775823265527252505268724488735536801861796905547404166171431856422968271155302507723810409195164317358822066699 := by
      have step := pow_mod_double_add_one (k := 2459) (e := 22) (m := 10 ^ 182) h22
      have he : 2 * 22 + 1 = 45 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h90 : (2459 : ℕ) ^ 90 % 10 ^ 182 = 18018411378296077535696123180418008527732650167536015412848802209900515183599658034369646800749152918566658154473340583203357554488969453995686030539267391956054430834716141604756601 := by
      have step := pow_mod_double (k := 2459) (e := 45) (m := 10 ^ 182) h45
      have he : 2 * 45 = 90 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h181 : (2459 : ℕ) ^ 181 % 10 ^ 182 = 13669376562728489417066519601928698329807667174828602498425988277487572142884867693801194560027005135964975875020322799144166764100134444973590026902348834976540282373385966107001259 := by
      have step := pow_mod_double_add_one (k := 2459) (e := 90) (m := 10 ^ 182) h90
      have he : 2 * 90 + 1 = 181 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h362 : (2459 : ℕ) ^ 362 % 10 ^ 182 = 30434267103751524750893584276476144506487218915625005396566959161348308868193562533358325341429709512039878193736244534530390479315773022458810076003727994962088768921311657427585081 := by
      have step := pow_mod_double (k := 2459) (e := 181) (m := 10 ^ 182) h181
      have he : 2 * 181 = 362 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h725 : (2459 : ℕ) ^ 725 % 10 ^ 182 = 37559298882588481393408098631686003428120197268037529159826092234641608648630517357376169278455062907132084270851622049528704030977038951158374201730898986523683909786283879196563499 := by
      have step := pow_mod_double_add_one (k := 2459) (e := 362) (m := 10 ^ 182) h362
      have he : 2 * 362 + 1 = 725 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h725
  rw [hmod]
  decide
private theorem cert_2459 : ExponentCertificate 2459 725 725 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2459) (by decide) (by decide) (by decide) suffix_2459
private theorem cert_2460 : ExponentCertificate 2460 726 725 := by decide
private theorem cert_2461 : ExponentCertificate 2461 726 725 := by decide
private theorem cert_2462 : ExponentCertificate 2462 726 725 := by decide
private theorem cert_2463 : ExponentCertificate 2463 726 726 := by decide
private theorem cert_2464 : ExponentCertificate 2464 727 726 := by decide
private theorem cert_2465 : ExponentCertificate 2465 727 726 := by decide
private theorem cert_2466 : ExponentCertificate 2466 727 727 := by decide
private theorem cert_2467 : ExponentCertificate 2467 727 727 := by decide
private theorem cert_2468 : ExponentCertificate 2468 728 727 := by decide
private theorem cert_2469 : ExponentCertificate 2469 728 727 := by decide
private theorem cert_2470 : ExponentCertificate 2470 728 728 := by decide
private theorem cert_2471 : ExponentCertificate 2471 728 728 := by decide
private theorem cert_2472 : ExponentCertificate 2472 729 728 := by decide
private theorem cert_2473 : ExponentCertificate 2473 729 728 := by decide
private theorem cert_2474 : ExponentCertificate 2474 729 729 := by decide
private theorem cert_2475 : ExponentCertificate 2475 730 729 := by decide
private theorem cert_2476 : ExponentCertificate 2476 730 729 := by decide
private theorem cert_2477 : ExponentCertificate 2477 730 729 := by decide
private theorem cert_2478 : ExponentCertificate 2478 730 730 := by decide
private theorem cert_2479 : ExponentCertificate 2479 731 730 := by decide
private theorem cert_2480 : ExponentCertificate 2480 731 730 := by decide
private theorem cert_2481 : ExponentCertificate 2481 731 730 := by decide
private theorem cert_2482 : ExponentCertificate 2482 731 731 := by decide
private theorem cert_2483 : ExponentCertificate 2483 732 731 := by decide
private theorem cert_2484 : ExponentCertificate 2484 732 731 := by decide
private theorem cert_2485 : ExponentCertificate 2485 732 731 := by decide
private theorem cert_2486 : ExponentCertificate 2486 732 732 := by decide
private theorem cert_2487 : ExponentCertificate 2487 733 732 := by decide
private theorem cert_2488 : ExponentCertificate 2488 733 732 := by decide
private theorem cert_2489 : ExponentCertificate 2489 733 732 := by decide
private theorem cert_2490 : ExponentCertificate 2490 733 733 := by decide
private theorem cert_2491 : ExponentCertificate 2491 734 733 := by decide
private theorem cert_2492 : ExponentCertificate 2492 734 733 := by decide
private theorem cert_2493 : ExponentCertificate 2493 734 733 := by decide
private theorem cert_2494 : ExponentCertificate 2494 734 734 := by decide
private theorem cert_2495 : ExponentCertificate 2495 735 734 := by decide
private theorem cert_2496 : ExponentCertificate 2496 735 734 := by decide
private theorem cert_2497 : ExponentCertificate 2497 735 734 := by decide
private theorem cert_2498 : ExponentCertificate 2498 735 735 := by decide
private theorem cert_2499 : ExponentCertificate 2499 736 735 := by decide
private theorem cert_2500 : ExponentCertificate 2500 736 735 := by decide

private theorem certificates_2401_2500 {k : ℕ} (hlo : 2401 ≤ k) (hhi : k ≤ 2500) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨710, 710, cert_2401⟩
  · exact ⟨711, 710, cert_2402⟩
  · exact ⟨711, 710, cert_2403⟩
  · exact ⟨711, 711, cert_2404⟩
  · exact ⟨712, 711, cert_2405⟩
  · exact ⟨712, 711, cert_2406⟩
  · exact ⟨712, 711, cert_2407⟩
  · exact ⟨712, 712, cert_2408⟩
  · exact ⟨713, 712, cert_2409⟩
  · exact ⟨713, 712, cert_2410⟩
  · exact ⟨713, 712, cert_2411⟩
  · exact ⟨713, 713, cert_2412⟩
  · exact ⟨714, 713, cert_2413⟩
  · exact ⟨714, 713, cert_2414⟩
  · exact ⟨714, 713, cert_2415⟩
  · exact ⟨714, 714, cert_2416⟩
  · exact ⟨715, 714, cert_2417⟩
  · exact ⟨715, 714, cert_2418⟩
  · exact ⟨715, 714, cert_2419⟩
  · exact ⟨715, 715, cert_2420⟩
  · exact ⟨716, 715, cert_2421⟩
  · exact ⟨716, 715, cert_2422⟩
  · exact ⟨716, 715, cert_2423⟩
  · exact ⟨716, 716, cert_2424⟩
  · exact ⟨717, 716, cert_2425⟩
  · exact ⟨717, 716, cert_2426⟩
  · exact ⟨717, 716, cert_2427⟩
  · exact ⟨717, 717, cert_2428⟩
  · exact ⟨718, 717, cert_2429⟩
  · exact ⟨718, 717, cert_2430⟩
  · exact ⟨718, 718, cert_2431⟩
  · exact ⟨718, 718, cert_2432⟩
  · exact ⟨719, 718, cert_2433⟩
  · exact ⟨719, 718, cert_2434⟩
  · exact ⟨719, 719, cert_2435⟩
  · exact ⟨719, 719, cert_2436⟩
  · exact ⟨720, 719, cert_2437⟩
  · exact ⟨720, 719, cert_2438⟩
  · exact ⟨720, 720, cert_2439⟩
  · exact ⟨721, 720, cert_2440⟩
  · exact ⟨721, 720, cert_2441⟩
  · exact ⟨721, 720, cert_2442⟩
  · exact ⟨721, 721, cert_2443⟩
  · exact ⟨722, 721, cert_2444⟩
  · exact ⟨722, 721, cert_2445⟩
  · exact ⟨722, 721, cert_2446⟩
  · exact ⟨722, 722, cert_2447⟩
  · exact ⟨723, 722, cert_2448⟩
  · exact ⟨723, 722, cert_2449⟩
  · exact ⟨723, 722, cert_2450⟩
  · exact ⟨723, 723, cert_2451⟩
  · exact ⟨724, 723, cert_2452⟩
  · exact ⟨724, 723, cert_2453⟩
  · exact ⟨724, 723, cert_2454⟩
  · exact ⟨724, 724, cert_2455⟩
  · exact ⟨725, 724, cert_2456⟩
  · exact ⟨725, 724, cert_2457⟩
  · exact ⟨725, 724, cert_2458⟩
  · exact ⟨725, 725, cert_2459⟩
  · exact ⟨726, 725, cert_2460⟩
  · exact ⟨726, 725, cert_2461⟩
  · exact ⟨726, 725, cert_2462⟩
  · exact ⟨726, 726, cert_2463⟩
  · exact ⟨727, 726, cert_2464⟩
  · exact ⟨727, 726, cert_2465⟩
  · exact ⟨727, 727, cert_2466⟩
  · exact ⟨727, 727, cert_2467⟩
  · exact ⟨728, 727, cert_2468⟩
  · exact ⟨728, 727, cert_2469⟩
  · exact ⟨728, 728, cert_2470⟩
  · exact ⟨728, 728, cert_2471⟩
  · exact ⟨729, 728, cert_2472⟩
  · exact ⟨729, 728, cert_2473⟩
  · exact ⟨729, 729, cert_2474⟩
  · exact ⟨730, 729, cert_2475⟩
  · exact ⟨730, 729, cert_2476⟩
  · exact ⟨730, 729, cert_2477⟩
  · exact ⟨730, 730, cert_2478⟩
  · exact ⟨731, 730, cert_2479⟩
  · exact ⟨731, 730, cert_2480⟩
  · exact ⟨731, 730, cert_2481⟩
  · exact ⟨731, 731, cert_2482⟩
  · exact ⟨732, 731, cert_2483⟩
  · exact ⟨732, 731, cert_2484⟩
  · exact ⟨732, 731, cert_2485⟩
  · exact ⟨732, 732, cert_2486⟩
  · exact ⟨733, 732, cert_2487⟩
  · exact ⟨733, 732, cert_2488⟩
  · exact ⟨733, 732, cert_2489⟩
  · exact ⟨733, 733, cert_2490⟩
  · exact ⟨734, 733, cert_2491⟩
  · exact ⟨734, 733, cert_2492⟩
  · exact ⟨734, 733, cert_2493⟩
  · exact ⟨734, 734, cert_2494⟩
  · exact ⟨735, 734, cert_2495⟩
  · exact ⟨735, 734, cert_2496⟩
  · exact ⟨735, 734, cert_2497⟩
  · exact ⟨735, 735, cert_2498⟩
  · exact ⟨736, 735, cert_2499⟩
  · exact ⟨736, 735, cert_2500⟩

theorem no_fixed_digitCount_2401_2500 {n : ℕ} (hn : a n = n)
    (hlo : 2401 ≤ digitCount n) (hhi : digitCount n ≤ 2500) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_2401_2500 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_2401_2500
end OeisA113010
