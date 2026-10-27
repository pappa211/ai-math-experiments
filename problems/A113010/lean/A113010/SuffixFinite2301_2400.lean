import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2401
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_2301 : ExponentCertificate 2301 685 684 := by decide
private theorem cert_2302 : ExponentCertificate 2302 685 684 := by decide
private theorem cert_2303 : ExponentCertificate 2303 685 684 := by decide
private theorem cert_2304 : ExponentCertificate 2304 685 685 := by decide
private theorem cert_2305 : ExponentCertificate 2305 686 685 := by decide
private theorem cert_2306 : ExponentCertificate 2306 686 685 := by decide
private theorem cert_2307 : ExponentCertificate 2307 686 685 := by decide
private theorem cert_2308 : ExponentCertificate 2308 686 686 := by decide
private theorem cert_2309 : ExponentCertificate 2309 687 686 := by decide
private theorem cert_2310 : ExponentCertificate 2310 687 686 := by decide
private theorem cert_2311 : ExponentCertificate 2311 687 687 := by decide
private theorem cert_2312 : ExponentCertificate 2312 687 687 := by decide
private theorem cert_2313 : ExponentCertificate 2313 688 687 := by decide
private theorem cert_2314 : ExponentCertificate 2314 688 687 := by decide
private theorem cert_2315 : ExponentCertificate 2315 688 688 := by decide
private theorem cert_2316 : ExponentCertificate 2316 689 688 := by decide
private theorem cert_2317 : ExponentCertificate 2317 689 688 := by decide
private theorem cert_2318 : ExponentCertificate 2318 689 688 := by decide
private theorem cert_2319 : ExponentCertificate 2319 689 689 := by decide
private theorem cert_2320 : ExponentCertificate 2320 690 689 := by decide
private theorem cert_2321 : ExponentCertificate 2321 690 689 := by decide
private theorem cert_2322 : ExponentCertificate 2322 690 689 := by decide
private theorem cert_2323 : ExponentCertificate 2323 690 690 := by decide
private theorem cert_2324 : ExponentCertificate 2324 691 690 := by decide
private theorem cert_2325 : ExponentCertificate 2325 691 690 := by decide
private theorem cert_2326 : ExponentCertificate 2326 691 690 := by decide
private theorem cert_2327 : ExponentCertificate 2327 691 691 := by decide
private theorem cert_2328 : ExponentCertificate 2328 692 691 := by decide
private theorem cert_2329 : ExponentCertificate 2329 692 691 := by decide
private theorem cert_2330 : ExponentCertificate 2330 692 691 := by decide
private theorem cert_2331 : ExponentCertificate 2331 692 692 := by decide
private theorem cert_2332 : ExponentCertificate 2332 693 692 := by decide
private theorem cert_2333 : ExponentCertificate 2333 693 692 := by decide
private theorem cert_2334 : ExponentCertificate 2334 693 692 := by decide
private theorem cert_2335 : ExponentCertificate 2335 693 693 := by decide
private theorem cert_2336 : ExponentCertificate 2336 694 693 := by decide
private theorem cert_2337 : ExponentCertificate 2337 694 693 := by decide
private theorem cert_2338 : ExponentCertificate 2338 694 694 := by decide
private theorem suffix_2339 : 694 < digitSum ((2339 : ℕ) ^ 694 % 10 ^ 174) := by
  have hmod : (2339 : ℕ) ^ 694 % 10 ^ 174 = 885270193867941622256366483901194945767557038728437555899681975949231132372372288925910268044898377825577796179994649236446383997438094799808901551061969653310301912035367641 := by
    have h1 : (2339 : ℕ) ^ 1 % 10 ^ 174 = 2339 := by decide
    have h2 : (2339 : ℕ) ^ 2 % 10 ^ 174 = 5470921 := by
      have step := pow_mod_double (k := 2339) (e := 1) (m := 10 ^ 174) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2339 : ℕ) ^ 5 % 10 ^ 174 = 70008554239895699 := by
      have step := pow_mod_double_add_one (k := 2339) (e := 2) (m := 10 ^ 174) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (2339 : ℕ) ^ 10 % 10 ^ 174 = 4901197666760418053168438398698601 := by
      have step := pow_mod_double (k := 2339) (e := 5) (m := 10 ^ 174) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (2339 : ℕ) ^ 21 % 10 ^ 174 = 56186846512090514513369324660253529220558812218239976543386977656493139 := by
      have step := pow_mod_double_add_one (k := 2339) (e := 10) (m := 10 ^ 174) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h43 : (2339 : ℕ) ^ 43 % 10 ^ 174 = 7384133465356356940087315667850582939501162256961670558628143183336177692375252757185439053002131475053107869678496267269846887694658428977497819 := by
      have step := pow_mod_double_add_one (k := 2339) (e := 21) (m := 10 ^ 174) h21
      have he : 2 * 21 + 1 = 43 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h86 : (2339 : ℕ) ^ 86 % 10 ^ 174 = 837176168041364477465016876511851828126863062932427199160684294480140936108351978138447994922849632752547151034902267203016876868839602815042610437962364287595439050149756761 := by
      have step := pow_mod_double (k := 2339) (e := 43) (m := 10 ^ 174) h43
      have he : 2 * 43 = 86 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h173 : (2339 : ℕ) ^ 173 % 10 ^ 174 = 793169004417714889072045057923691846463728198078183945908069794987332918482418148378627919957709362283842792194319283956482182420991951977183236172252431435746917481128812019 := by
      have step := pow_mod_double_add_one (k := 2339) (e := 86) (m := 10 ^ 174) h86
      have he : 2 * 86 + 1 = 173 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h347 : (2339 : ℕ) ^ 347 % 10 ^ 174 = 144701276562963601831210578959228549717420677805463161136451771191783840916974079545661890180435735412436105122143721867190601332530016615327605276407821359041304504685028379 := by
      have step := pow_mod_double_add_one (k := 2339) (e := 173) (m := 10 ^ 174) h173
      have he : 2 * 173 + 1 = 347 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h694 : (2339 : ℕ) ^ 694 % 10 ^ 174 = 885270193867941622256366483901194945767557038728437555899681975949231132372372288925910268044898377825577796179994649236446383997438094799808901551061969653310301912035367641 := by
      have step := pow_mod_double (k := 2339) (e := 347) (m := 10 ^ 174) h347
      have he : 2 * 347 = 694 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h694
  rw [hmod]
  decide
private theorem cert_2339 : ExponentCertificate 2339 694 694 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2339) (by decide) (by decide) (by decide) suffix_2339
private theorem cert_2340 : ExponentCertificate 2340 695 694 := by decide
private theorem cert_2341 : ExponentCertificate 2341 695 694 := by decide
private theorem cert_2342 : ExponentCertificate 2342 695 695 := by decide
private theorem cert_2343 : ExponentCertificate 2343 696 695 := by decide
private theorem cert_2344 : ExponentCertificate 2344 696 695 := by decide
private theorem cert_2345 : ExponentCertificate 2345 696 695 := by decide
private theorem cert_2346 : ExponentCertificate 2346 696 696 := by decide
private theorem cert_2347 : ExponentCertificate 2347 697 696 := by decide
private theorem cert_2348 : ExponentCertificate 2348 697 696 := by decide
private theorem cert_2349 : ExponentCertificate 2349 697 696 := by decide
private theorem cert_2350 : ExponentCertificate 2350 697 697 := by decide
private theorem cert_2351 : ExponentCertificate 2351 698 697 := by decide
private theorem cert_2352 : ExponentCertificate 2352 698 697 := by decide
private theorem cert_2353 : ExponentCertificate 2353 698 697 := by decide
private theorem cert_2354 : ExponentCertificate 2354 698 698 := by decide
private theorem cert_2355 : ExponentCertificate 2355 699 698 := by decide
private theorem cert_2356 : ExponentCertificate 2356 699 698 := by decide
private theorem cert_2357 : ExponentCertificate 2357 699 698 := by decide
private theorem cert_2358 : ExponentCertificate 2358 699 699 := by decide
private theorem cert_2359 : ExponentCertificate 2359 700 699 := by decide
private theorem cert_2360 : ExponentCertificate 2360 700 699 := by decide
private theorem cert_2361 : ExponentCertificate 2361 700 699 := by decide
private theorem cert_2362 : ExponentCertificate 2362 700 700 := by decide
private theorem cert_2363 : ExponentCertificate 2363 701 700 := by decide
private theorem cert_2364 : ExponentCertificate 2364 701 700 := by decide
private theorem cert_2365 : ExponentCertificate 2365 701 700 := by decide
private theorem suffix_2366 : 701 < digitSum ((2366 : ℕ) ^ 701 % 10 ^ 176) := by
  have hmod : (2366 : ℕ) ^ 701 % 10 ^ 176 = 9306732565114267381468868737588355248324437033605157196501464959452160228349624085883170278812268700231596826125982848592485667030100315315442818792529868701807254547376111616 := by
    have h1 : (2366 : ℕ) ^ 1 % 10 ^ 176 = 2366 := by decide
    have h2 : (2366 : ℕ) ^ 2 % 10 ^ 176 = 5597956 := by
      have step := pow_mod_double (k := 2366) (e := 1) (m := 10 ^ 176) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (2366 : ℕ) ^ 5 % 10 ^ 176 = 74143605520196576 := by
      have step := pow_mod_double_add_one (k := 2366) (e := 2) (m := 10 ^ 176) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (2366 : ℕ) ^ 10 % 10 ^ 176 = 5497274239534524177197437682123776 := by
      have step := pow_mod_double (k := 2366) (e := 5) (m := 10 ^ 176) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (2366 : ℕ) ^ 21 % 10 ^ 176 = 71500576936961618682945452253242694930162885370685909871587110122684416 := by
      have step := pow_mod_double_add_one (k := 2366) (e := 10) (m := 10 ^ 176) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h43 : (2366 : ℕ) ^ 43 % 10 ^ 176 = 12095778700485258047625531636264386705595383586510043735624369050599095950470153353646052278975748104832263230162286341166854264628528708631658496 := by
      have step := pow_mod_double_add_one (k := 2366) (e := 21) (m := 10 ^ 176) h21
      have he : 2 * 21 + 1 = 43 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h87 : (2366 : ℕ) ^ 87 % 10 ^ 176 = 91553526716271558974170480053668673345027901182574926365925755291725351580935033073123103063194282451464809879095347532488687111180698890691114772279198796948520340852211449856 := by
      have step := pow_mod_double_add_one (k := 2366) (e := 43) (m := 10 ^ 176) h43
      have he : 2 * 43 + 1 = 87 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h175 : (2366 : ℕ) ^ 175 % 10 ^ 176 = 31048731643547031403285266178380133041080334180368178247821710337615971903881727381336401478593746700550100000103388724547939419076145073270696095191742729792719844815327461376 := by
      have step := pow_mod_double_add_one (k := 2366) (e := 87) (m := 10 ^ 176) h87
      have he : 2 * 87 + 1 = 175 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h350 : (2366 : ℕ) ^ 350 % 10 ^ 176 = 28176295824437710831209027827508271651334693267139004699984273089200311243476284887351580716934456747595222410038127750068440488154655160592582749789522854556359961832771813376 := by
      have step := pow_mod_double (k := 2366) (e := 175) (m := 10 ^ 176) h175
      have he : 2 * 175 = 350 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h701 : (2366 : ℕ) ^ 701 % 10 ^ 176 = 9306732565114267381468868737588355248324437033605157196501464959452160228349624085883170278812268700231596826125982848592485667030100315315442818792529868701807254547376111616 := by
      have step := pow_mod_double_add_one (k := 2366) (e := 350) (m := 10 ^ 176) h350
      have he : 2 * 350 + 1 = 701 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h701
  rw [hmod]
  decide
private theorem cert_2366 : ExponentCertificate 2366 701 701 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2366) (by decide) (by decide) (by decide) suffix_2366
private theorem cert_2367 : ExponentCertificate 2367 702 701 := by decide
private theorem cert_2368 : ExponentCertificate 2368 702 701 := by decide
private theorem cert_2369 : ExponentCertificate 2369 702 702 := by decide
private theorem suffix_2370 : 702 < digitSum ((237 : ℕ) ^ 702 % 10 ^ 176) := by
  have hmod : (237 : ℕ) ^ 702 % 10 ^ 176 = 39110003038648891806650426916549088777308769858580158507344511454067684479259914467097912827400586798820120181975245221916044840601498799575056566132808606636312699618827358169 := by
    have h1 : (237 : ℕ) ^ 1 % 10 ^ 176 = 237 := by decide
    have h2 : (237 : ℕ) ^ 2 % 10 ^ 176 = 56169 := by
      have step := pow_mod_double (k := 237) (e := 1) (m := 10 ^ 176) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (237 : ℕ) ^ 5 % 10 ^ 176 = 747724704957 := by
      have step := pow_mod_double_add_one (k := 237) (e := 2) (m := 10 ^ 176) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (237 : ℕ) ^ 10 % 10 ^ 176 = 559092234403032700371849 := by
      have step := pow_mod_double (k := 237) (e := 5) (m := 10 ^ 176) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (237 : ℕ) ^ 21 % 10 ^ 176 = 74082437997036831849997331913054517295900587875837 := by
      have step := pow_mod_double_add_one (k := 237) (e := 10) (m := 10 ^ 176) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h43 : (237 : ℕ) ^ 43 % 10 ^ 176 = 1300705205841599154363667098745160070295593349736463148275113259477536159683829818263572500135642784853 := by
      have step := pow_mod_double_add_one (k := 237) (e := 21) (m := 10 ^ 176) h21
      have he : 2 * 21 + 1 = 43 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h87 : (237 : ℕ) ^ 87 % 10 ^ 176 = 63866579483469756336732289380625240474297077199803425307972262806030610567501210954993735863224880451383004470538328521215944251611888945298850040589115412875069594507356891333 := by
      have step := pow_mod_double_add_one (k := 237) (e := 43) (m := 10 ^ 176) h43
      have he : 2 * 43 + 1 = 87 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h175 : (237 : ℕ) ^ 175 % 10 ^ 176 = 35209198275308482468871765130254461063527489573372893748669051400934975002207356743635728420873284420577977707465342772951141184654308064141084045087806136993850539280212502693 := by
      have step := pow_mod_double_add_one (k := 237) (e := 87) (m := 10 ^ 176) h87
      have he : 2 * 87 + 1 = 175 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h351 : (237 : ℕ) ^ 351 % 10 ^ 176 = 4271107018719409113505651400041816227995679733285702631130596512919643756145428383769589753755029828018343685573659276018875311107371713323760075455989414112783515464143783013 := by
      have step := pow_mod_double_add_one (k := 237) (e := 175) (m := 10 ^ 176) h175
      have he : 2 * 175 + 1 = 351 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h702 : (237 : ℕ) ^ 702 % 10 ^ 176 = 39110003038648891806650426916549088777308769858580158507344511454067684479259914467097912827400586798820120181975245221916044840601498799575056566132808606636312699618827358169 := by
      have step := pow_mod_double (k := 237) (e := 351) (m := 10 ^ 176) h351
      have he : 2 * 351 = 702 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h702
  rw [hmod]
  decide
private theorem cert_2370 : ExponentCertificate 2370 702 702 :=
  exponentCertificate_of_normalized_suffix (t := 1) (u := 237) (by decide) (by decide) (by decide) suffix_2370
private theorem cert_2371 : ExponentCertificate 2371 703 702 := by decide
private theorem cert_2372 : ExponentCertificate 2372 703 702 := by decide
private theorem cert_2373 : ExponentCertificate 2373 703 703 := by decide
private theorem cert_2374 : ExponentCertificate 2374 704 703 := by decide
private theorem cert_2375 : ExponentCertificate 2375 704 703 := by decide
private theorem cert_2376 : ExponentCertificate 2376 704 703 := by decide
private theorem cert_2377 : ExponentCertificate 2377 704 704 := by decide
private theorem cert_2378 : ExponentCertificate 2378 705 704 := by decide
private theorem cert_2379 : ExponentCertificate 2379 705 704 := by decide
private theorem cert_2380 : ExponentCertificate 2380 705 704 := by decide
private theorem cert_2381 : ExponentCertificate 2381 705 705 := by decide
private theorem cert_2382 : ExponentCertificate 2382 706 705 := by decide
private theorem cert_2383 : ExponentCertificate 2383 706 705 := by decide
private theorem cert_2384 : ExponentCertificate 2384 706 705 := by decide
private theorem cert_2385 : ExponentCertificate 2385 706 706 := by decide
private theorem cert_2386 : ExponentCertificate 2386 707 706 := by decide
private theorem cert_2387 : ExponentCertificate 2387 707 706 := by decide
private theorem cert_2388 : ExponentCertificate 2388 707 706 := by decide
private theorem cert_2389 : ExponentCertificate 2389 707 707 := by decide
private theorem cert_2390 : ExponentCertificate 2390 708 707 := by decide
private theorem cert_2391 : ExponentCertificate 2391 708 707 := by decide
private theorem cert_2392 : ExponentCertificate 2392 708 707 := by decide
private theorem cert_2393 : ExponentCertificate 2393 708 708 := by decide
private theorem cert_2394 : ExponentCertificate 2394 709 708 := by decide
private theorem cert_2395 : ExponentCertificate 2395 709 708 := by decide
private theorem cert_2396 : ExponentCertificate 2396 709 708 := by decide
private theorem cert_2397 : ExponentCertificate 2397 709 709 := by decide
private theorem cert_2398 : ExponentCertificate 2398 710 709 := by decide
private theorem cert_2399 : ExponentCertificate 2399 710 709 := by decide
private theorem cert_2400 : ExponentCertificate 2400 710 710 := by decide

private theorem certificates_2301_2400 {k : ℕ} (hlo : 2301 ≤ k) (hhi : k ≤ 2400) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨685, 684, cert_2301⟩
  · exact ⟨685, 684, cert_2302⟩
  · exact ⟨685, 684, cert_2303⟩
  · exact ⟨685, 685, cert_2304⟩
  · exact ⟨686, 685, cert_2305⟩
  · exact ⟨686, 685, cert_2306⟩
  · exact ⟨686, 685, cert_2307⟩
  · exact ⟨686, 686, cert_2308⟩
  · exact ⟨687, 686, cert_2309⟩
  · exact ⟨687, 686, cert_2310⟩
  · exact ⟨687, 687, cert_2311⟩
  · exact ⟨687, 687, cert_2312⟩
  · exact ⟨688, 687, cert_2313⟩
  · exact ⟨688, 687, cert_2314⟩
  · exact ⟨688, 688, cert_2315⟩
  · exact ⟨689, 688, cert_2316⟩
  · exact ⟨689, 688, cert_2317⟩
  · exact ⟨689, 688, cert_2318⟩
  · exact ⟨689, 689, cert_2319⟩
  · exact ⟨690, 689, cert_2320⟩
  · exact ⟨690, 689, cert_2321⟩
  · exact ⟨690, 689, cert_2322⟩
  · exact ⟨690, 690, cert_2323⟩
  · exact ⟨691, 690, cert_2324⟩
  · exact ⟨691, 690, cert_2325⟩
  · exact ⟨691, 690, cert_2326⟩
  · exact ⟨691, 691, cert_2327⟩
  · exact ⟨692, 691, cert_2328⟩
  · exact ⟨692, 691, cert_2329⟩
  · exact ⟨692, 691, cert_2330⟩
  · exact ⟨692, 692, cert_2331⟩
  · exact ⟨693, 692, cert_2332⟩
  · exact ⟨693, 692, cert_2333⟩
  · exact ⟨693, 692, cert_2334⟩
  · exact ⟨693, 693, cert_2335⟩
  · exact ⟨694, 693, cert_2336⟩
  · exact ⟨694, 693, cert_2337⟩
  · exact ⟨694, 694, cert_2338⟩
  · exact ⟨694, 694, cert_2339⟩
  · exact ⟨695, 694, cert_2340⟩
  · exact ⟨695, 694, cert_2341⟩
  · exact ⟨695, 695, cert_2342⟩
  · exact ⟨696, 695, cert_2343⟩
  · exact ⟨696, 695, cert_2344⟩
  · exact ⟨696, 695, cert_2345⟩
  · exact ⟨696, 696, cert_2346⟩
  · exact ⟨697, 696, cert_2347⟩
  · exact ⟨697, 696, cert_2348⟩
  · exact ⟨697, 696, cert_2349⟩
  · exact ⟨697, 697, cert_2350⟩
  · exact ⟨698, 697, cert_2351⟩
  · exact ⟨698, 697, cert_2352⟩
  · exact ⟨698, 697, cert_2353⟩
  · exact ⟨698, 698, cert_2354⟩
  · exact ⟨699, 698, cert_2355⟩
  · exact ⟨699, 698, cert_2356⟩
  · exact ⟨699, 698, cert_2357⟩
  · exact ⟨699, 699, cert_2358⟩
  · exact ⟨700, 699, cert_2359⟩
  · exact ⟨700, 699, cert_2360⟩
  · exact ⟨700, 699, cert_2361⟩
  · exact ⟨700, 700, cert_2362⟩
  · exact ⟨701, 700, cert_2363⟩
  · exact ⟨701, 700, cert_2364⟩
  · exact ⟨701, 700, cert_2365⟩
  · exact ⟨701, 701, cert_2366⟩
  · exact ⟨702, 701, cert_2367⟩
  · exact ⟨702, 701, cert_2368⟩
  · exact ⟨702, 702, cert_2369⟩
  · exact ⟨702, 702, cert_2370⟩
  · exact ⟨703, 702, cert_2371⟩
  · exact ⟨703, 702, cert_2372⟩
  · exact ⟨703, 703, cert_2373⟩
  · exact ⟨704, 703, cert_2374⟩
  · exact ⟨704, 703, cert_2375⟩
  · exact ⟨704, 703, cert_2376⟩
  · exact ⟨704, 704, cert_2377⟩
  · exact ⟨705, 704, cert_2378⟩
  · exact ⟨705, 704, cert_2379⟩
  · exact ⟨705, 704, cert_2380⟩
  · exact ⟨705, 705, cert_2381⟩
  · exact ⟨706, 705, cert_2382⟩
  · exact ⟨706, 705, cert_2383⟩
  · exact ⟨706, 705, cert_2384⟩
  · exact ⟨706, 706, cert_2385⟩
  · exact ⟨707, 706, cert_2386⟩
  · exact ⟨707, 706, cert_2387⟩
  · exact ⟨707, 706, cert_2388⟩
  · exact ⟨707, 707, cert_2389⟩
  · exact ⟨708, 707, cert_2390⟩
  · exact ⟨708, 707, cert_2391⟩
  · exact ⟨708, 707, cert_2392⟩
  · exact ⟨708, 708, cert_2393⟩
  · exact ⟨709, 708, cert_2394⟩
  · exact ⟨709, 708, cert_2395⟩
  · exact ⟨709, 708, cert_2396⟩
  · exact ⟨709, 709, cert_2397⟩
  · exact ⟨710, 709, cert_2398⟩
  · exact ⟨710, 709, cert_2399⟩
  · exact ⟨710, 710, cert_2400⟩

theorem no_fixed_digitCount_2301_2400 {n : ℕ} (hn : a n = n)
    (hlo : 2301 ≤ digitCount n) (hhi : digitCount n ≤ 2400) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_2301_2400 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_2301_2400
end OeisA113010
