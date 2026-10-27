import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 4501
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_4401 : ExponentCertificate 4401 1208 1207 := by decide
private theorem cert_4402 : ExponentCertificate 4402 1208 1208 := by decide
private theorem cert_4403 : ExponentCertificate 4403 1209 1208 := by decide
private theorem cert_4404 : ExponentCertificate 4404 1209 1208 := by decide
private theorem cert_4405 : ExponentCertificate 4405 1209 1208 := by decide
private theorem cert_4406 : ExponentCertificate 4406 1209 1209 := by decide
private theorem cert_4407 : ExponentCertificate 4407 1210 1209 := by decide
private theorem cert_4408 : ExponentCertificate 4408 1210 1209 := by decide
private theorem cert_4409 : ExponentCertificate 4409 1210 1209 := by decide
private theorem cert_4410 : ExponentCertificate 4410 1210 1210 := by decide
private theorem cert_4411 : ExponentCertificate 4411 1211 1210 := by decide
private theorem cert_4412 : ExponentCertificate 4412 1211 1210 := by decide
private theorem cert_4413 : ExponentCertificate 4413 1211 1210 := by decide
private theorem cert_4414 : ExponentCertificate 4414 1211 1211 := by decide
private theorem cert_4415 : ExponentCertificate 4415 1211 1211 := by decide
private theorem cert_4416 : ExponentCertificate 4416 1212 1211 := by decide
private theorem cert_4417 : ExponentCertificate 4417 1212 1211 := by decide
private theorem cert_4418 : ExponentCertificate 4418 1212 1211 := by decide
private theorem cert_4419 : ExponentCertificate 4419 1212 1212 := by decide
private theorem cert_4420 : ExponentCertificate 4420 1213 1212 := by decide
private theorem cert_4421 : ExponentCertificate 4421 1213 1212 := by decide
private theorem cert_4422 : ExponentCertificate 4422 1213 1212 := by decide
private theorem cert_4423 : ExponentCertificate 4423 1213 1213 := by decide
private theorem cert_4424 : ExponentCertificate 4424 1214 1213 := by decide
private theorem cert_4425 : ExponentCertificate 4425 1214 1213 := by decide
private theorem cert_4426 : ExponentCertificate 4426 1214 1213 := by decide
private theorem cert_4427 : ExponentCertificate 4427 1214 1214 := by decide
private theorem cert_4428 : ExponentCertificate 4428 1215 1214 := by decide
private theorem cert_4429 : ExponentCertificate 4429 1215 1214 := by decide
private theorem cert_4430 : ExponentCertificate 4430 1215 1214 := by decide
private theorem suffix_4431 : 1215 < digitSum ((4431 : ℕ) ^ 1215 % 10 ^ 304) := by
  have hmod : (4431 : ℕ) ^ 1215 % 10 ^ 304 = 9028269583737782224615784581257949111477477656851892274091385189292909640683349843149591483487066211280424996804515004163173866199297188940141631453794900856461581466867415781246103264179224724441684269177467859788202256343565480888771260712351962214820731283396719287278236049033764331707209679309291951 := by
    have h1 : (4431 : ℕ) ^ 1 % 10 ^ 304 = 4431 := by decide
    have h2 : (4431 : ℕ) ^ 2 % 10 ^ 304 = 19633761 := by
      have step := pow_mod_double (k := 4431) (e := 1) (m := 10 ^ 304) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4431 : ℕ) ^ 4 % 10 ^ 304 = 385484571005121 := by
      have step := pow_mod_double (k := 4431) (e := 2) (m := 10 ^ 304) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (4431 : ℕ) ^ 9 % 10 ^ 304 = 658439308714182632888578643384271 := by
      have step := pow_mod_double_add_one (k := 4431) (e := 4) (m := 10 ^ 304) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (4431 : ℕ) ^ 18 % 10 ^ 304 = 433542323260010701679604359226698643980844105841175456596170201441 := by
      have step := pow_mod_double (k := 4431) (e := 9) (m := 10 ^ 304) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h37 : (4431 : ℕ) ^ 37 % 10 ^ 304 = 832846089981613827779558415806529608974156490568371137497030980752098328155554241634091712917910926444007781895473660595715359369287311 := by
      have step := pow_mod_double_add_one (k := 4431) (e := 18) (m := 10 ^ 304) h18
      have he : 2 * 18 + 1 = 37 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h75 : (4431 : ℕ) ^ 75 % 10 ^ 304 = 3073486093127242079833598254240718181366213292625182473320849835133788452909827879038717015030709210875274404230553721460510550249554488265904125229828708428586488941171079471192113449315755646903674775081692764465640206577212681462118263234763580668852873437795586721104751 := by
      have step := pow_mod_double_add_one (k := 4431) (e := 37) (m := 10 ^ 304) h37
      have he : 2 * 37 + 1 = 75 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h151 : (4431 : ℕ) ^ 151 % 10 ^ 304 = 7386416715462300024581827247240005823784271470350628449740100656972324459878374512260960697973907518811762730688887709079947526531831919131587586764832639035519594951177639671502739543079222373785497448217417992877146993544822569052949592590892297548822294677636123295012569865157968458609386476354736431 := by
      have step := pow_mod_double_add_one (k := 4431) (e := 75) (m := 10 ^ 304) h75
      have he : 2 * 75 + 1 = 151 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h303 : (4431 : ℕ) ^ 303 % 10 ^ 304 = 7599909846450952897223628049967491312387059356095737969785150598570750433932222518501173667517873953960851499203466945147652675551272195015550774906300883343534255849168736429342076691409708897764787900823585921007900437882016343456483750228487548215469921211322675511946386879503457716517108577755298991 := by
      have step := pow_mod_double_add_one (k := 4431) (e := 151) (m := 10 ^ 304) h151
      have he : 2 * 151 + 1 = 303 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h607 : (4431 : ℕ) ^ 607 % 10 ^ 304 = 5771844622104475112877227143159899621786464409824049067092910455008217176736820784751533726912825292420599797583394273049107717186886834436952608830552802565892859359322168457667833870482842030442615329373896222003157316605180257773415444905507452223196224956668328450793825123164897279208604718693716911 := by
      have step := pow_mod_double_add_one (k := 4431) (e := 303) (m := 10 ^ 304) h303
      have he : 2 * 303 + 1 = 607 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1215 : (4431 : ℕ) ^ 1215 % 10 ^ 304 = 9028269583737782224615784581257949111477477656851892274091385189292909640683349843149591483487066211280424996804515004163173866199297188940141631453794900856461581466867415781246103264179224724441684269177467859788202256343565480888771260712351962214820731283396719287278236049033764331707209679309291951 := by
      have step := pow_mod_double_add_one (k := 4431) (e := 607) (m := 10 ^ 304) h607
      have he : 2 * 607 + 1 = 1215 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1215
  rw [hmod]
  decide
private theorem cert_4431 : ExponentCertificate 4431 1215 1215 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4431) (by decide) (by decide) (by decide) suffix_4431
private theorem cert_4432 : ExponentCertificate 4432 1216 1215 := by decide
private theorem cert_4433 : ExponentCertificate 4433 1216 1215 := by decide
private theorem cert_4434 : ExponentCertificate 4434 1216 1215 := by decide
private theorem cert_4435 : ExponentCertificate 4435 1216 1216 := by decide
private theorem cert_4436 : ExponentCertificate 4436 1217 1216 := by decide
private theorem cert_4437 : ExponentCertificate 4437 1217 1216 := by decide
private theorem cert_4438 : ExponentCertificate 4438 1217 1216 := by decide
private theorem cert_4439 : ExponentCertificate 4439 1217 1217 := by decide
private theorem cert_4440 : ExponentCertificate 4440 1218 1217 := by decide
private theorem cert_4441 : ExponentCertificate 4441 1218 1217 := by decide
private theorem cert_4442 : ExponentCertificate 4442 1218 1217 := by decide
private theorem cert_4443 : ExponentCertificate 4443 1218 1218 := by decide
private theorem cert_4444 : ExponentCertificate 4444 1219 1218 := by decide
private theorem cert_4445 : ExponentCertificate 4445 1219 1218 := by decide
private theorem cert_4446 : ExponentCertificate 4446 1219 1218 := by decide
private theorem cert_4447 : ExponentCertificate 4447 1219 1219 := by decide
private theorem cert_4448 : ExponentCertificate 4448 1219 1219 := by decide
private theorem cert_4449 : ExponentCertificate 4449 1220 1219 := by decide
private theorem cert_4450 : ExponentCertificate 4450 1220 1219 := by decide
private theorem cert_4451 : ExponentCertificate 4451 1220 1219 := by decide
private theorem cert_4452 : ExponentCertificate 4452 1220 1220 := by decide
private theorem cert_4453 : ExponentCertificate 4453 1221 1220 := by decide
private theorem cert_4454 : ExponentCertificate 4454 1221 1220 := by decide
private theorem cert_4455 : ExponentCertificate 4455 1221 1220 := by decide
private theorem cert_4456 : ExponentCertificate 4456 1221 1221 := by decide
private theorem cert_4457 : ExponentCertificate 4457 1222 1221 := by decide
private theorem cert_4458 : ExponentCertificate 4458 1222 1221 := by decide
private theorem cert_4459 : ExponentCertificate 4459 1222 1221 := by decide
private theorem cert_4460 : ExponentCertificate 4460 1222 1222 := by decide
private theorem cert_4461 : ExponentCertificate 4461 1223 1222 := by decide
private theorem cert_4462 : ExponentCertificate 4462 1223 1222 := by decide
private theorem cert_4463 : ExponentCertificate 4463 1223 1222 := by decide
private theorem cert_4464 : ExponentCertificate 4464 1223 1223 := by decide
private theorem cert_4465 : ExponentCertificate 4465 1224 1223 := by decide
private theorem cert_4466 : ExponentCertificate 4466 1224 1223 := by decide
private theorem cert_4467 : ExponentCertificate 4467 1224 1223 := by decide
private theorem cert_4468 : ExponentCertificate 4468 1224 1224 := by decide
private theorem cert_4469 : ExponentCertificate 4469 1225 1224 := by decide
private theorem cert_4470 : ExponentCertificate 4470 1225 1224 := by decide
private theorem cert_4471 : ExponentCertificate 4471 1225 1224 := by decide
private theorem cert_4472 : ExponentCertificate 4472 1225 1225 := by decide
private theorem cert_4473 : ExponentCertificate 4473 1226 1225 := by decide
private theorem cert_4474 : ExponentCertificate 4474 1226 1225 := by decide
private theorem cert_4475 : ExponentCertificate 4475 1226 1225 := by decide
private theorem cert_4476 : ExponentCertificate 4476 1226 1226 := by decide
private theorem cert_4477 : ExponentCertificate 4477 1226 1226 := by decide
private theorem cert_4478 : ExponentCertificate 4478 1227 1226 := by decide
private theorem cert_4479 : ExponentCertificate 4479 1227 1226 := by decide
private theorem cert_4480 : ExponentCertificate 4480 1227 1226 := by decide
private theorem cert_4481 : ExponentCertificate 4481 1227 1227 := by decide
private theorem cert_4482 : ExponentCertificate 4482 1228 1227 := by decide
private theorem cert_4483 : ExponentCertificate 4483 1228 1227 := by decide
private theorem cert_4484 : ExponentCertificate 4484 1228 1227 := by decide
private theorem cert_4485 : ExponentCertificate 4485 1228 1228 := by decide
private theorem cert_4486 : ExponentCertificate 4486 1229 1228 := by decide
private theorem cert_4487 : ExponentCertificate 4487 1229 1228 := by decide
private theorem cert_4488 : ExponentCertificate 4488 1229 1228 := by decide
private theorem cert_4489 : ExponentCertificate 4489 1229 1229 := by decide
private theorem cert_4490 : ExponentCertificate 4490 1230 1229 := by decide
private theorem cert_4491 : ExponentCertificate 4491 1230 1229 := by decide
private theorem cert_4492 : ExponentCertificate 4492 1230 1229 := by decide
private theorem cert_4493 : ExponentCertificate 4493 1230 1230 := by decide
private theorem cert_4494 : ExponentCertificate 4494 1231 1230 := by decide
private theorem cert_4495 : ExponentCertificate 4495 1231 1230 := by decide
private theorem cert_4496 : ExponentCertificate 4496 1231 1230 := by decide
private theorem cert_4497 : ExponentCertificate 4497 1231 1231 := by decide
private theorem cert_4498 : ExponentCertificate 4498 1232 1231 := by decide
private theorem cert_4499 : ExponentCertificate 4499 1232 1231 := by decide
private theorem cert_4500 : ExponentCertificate 4500 1232 1231 := by decide

private theorem certificates_4401_4500 {k : ℕ} (hlo : 4401 ≤ k) (hhi : k ≤ 4500) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1208, 1207, cert_4401⟩
  · exact ⟨1208, 1208, cert_4402⟩
  · exact ⟨1209, 1208, cert_4403⟩
  · exact ⟨1209, 1208, cert_4404⟩
  · exact ⟨1209, 1208, cert_4405⟩
  · exact ⟨1209, 1209, cert_4406⟩
  · exact ⟨1210, 1209, cert_4407⟩
  · exact ⟨1210, 1209, cert_4408⟩
  · exact ⟨1210, 1209, cert_4409⟩
  · exact ⟨1210, 1210, cert_4410⟩
  · exact ⟨1211, 1210, cert_4411⟩
  · exact ⟨1211, 1210, cert_4412⟩
  · exact ⟨1211, 1210, cert_4413⟩
  · exact ⟨1211, 1211, cert_4414⟩
  · exact ⟨1211, 1211, cert_4415⟩
  · exact ⟨1212, 1211, cert_4416⟩
  · exact ⟨1212, 1211, cert_4417⟩
  · exact ⟨1212, 1211, cert_4418⟩
  · exact ⟨1212, 1212, cert_4419⟩
  · exact ⟨1213, 1212, cert_4420⟩
  · exact ⟨1213, 1212, cert_4421⟩
  · exact ⟨1213, 1212, cert_4422⟩
  · exact ⟨1213, 1213, cert_4423⟩
  · exact ⟨1214, 1213, cert_4424⟩
  · exact ⟨1214, 1213, cert_4425⟩
  · exact ⟨1214, 1213, cert_4426⟩
  · exact ⟨1214, 1214, cert_4427⟩
  · exact ⟨1215, 1214, cert_4428⟩
  · exact ⟨1215, 1214, cert_4429⟩
  · exact ⟨1215, 1214, cert_4430⟩
  · exact ⟨1215, 1215, cert_4431⟩
  · exact ⟨1216, 1215, cert_4432⟩
  · exact ⟨1216, 1215, cert_4433⟩
  · exact ⟨1216, 1215, cert_4434⟩
  · exact ⟨1216, 1216, cert_4435⟩
  · exact ⟨1217, 1216, cert_4436⟩
  · exact ⟨1217, 1216, cert_4437⟩
  · exact ⟨1217, 1216, cert_4438⟩
  · exact ⟨1217, 1217, cert_4439⟩
  · exact ⟨1218, 1217, cert_4440⟩
  · exact ⟨1218, 1217, cert_4441⟩
  · exact ⟨1218, 1217, cert_4442⟩
  · exact ⟨1218, 1218, cert_4443⟩
  · exact ⟨1219, 1218, cert_4444⟩
  · exact ⟨1219, 1218, cert_4445⟩
  · exact ⟨1219, 1218, cert_4446⟩
  · exact ⟨1219, 1219, cert_4447⟩
  · exact ⟨1219, 1219, cert_4448⟩
  · exact ⟨1220, 1219, cert_4449⟩
  · exact ⟨1220, 1219, cert_4450⟩
  · exact ⟨1220, 1219, cert_4451⟩
  · exact ⟨1220, 1220, cert_4452⟩
  · exact ⟨1221, 1220, cert_4453⟩
  · exact ⟨1221, 1220, cert_4454⟩
  · exact ⟨1221, 1220, cert_4455⟩
  · exact ⟨1221, 1221, cert_4456⟩
  · exact ⟨1222, 1221, cert_4457⟩
  · exact ⟨1222, 1221, cert_4458⟩
  · exact ⟨1222, 1221, cert_4459⟩
  · exact ⟨1222, 1222, cert_4460⟩
  · exact ⟨1223, 1222, cert_4461⟩
  · exact ⟨1223, 1222, cert_4462⟩
  · exact ⟨1223, 1222, cert_4463⟩
  · exact ⟨1223, 1223, cert_4464⟩
  · exact ⟨1224, 1223, cert_4465⟩
  · exact ⟨1224, 1223, cert_4466⟩
  · exact ⟨1224, 1223, cert_4467⟩
  · exact ⟨1224, 1224, cert_4468⟩
  · exact ⟨1225, 1224, cert_4469⟩
  · exact ⟨1225, 1224, cert_4470⟩
  · exact ⟨1225, 1224, cert_4471⟩
  · exact ⟨1225, 1225, cert_4472⟩
  · exact ⟨1226, 1225, cert_4473⟩
  · exact ⟨1226, 1225, cert_4474⟩
  · exact ⟨1226, 1225, cert_4475⟩
  · exact ⟨1226, 1226, cert_4476⟩
  · exact ⟨1226, 1226, cert_4477⟩
  · exact ⟨1227, 1226, cert_4478⟩
  · exact ⟨1227, 1226, cert_4479⟩
  · exact ⟨1227, 1226, cert_4480⟩
  · exact ⟨1227, 1227, cert_4481⟩
  · exact ⟨1228, 1227, cert_4482⟩
  · exact ⟨1228, 1227, cert_4483⟩
  · exact ⟨1228, 1227, cert_4484⟩
  · exact ⟨1228, 1228, cert_4485⟩
  · exact ⟨1229, 1228, cert_4486⟩
  · exact ⟨1229, 1228, cert_4487⟩
  · exact ⟨1229, 1228, cert_4488⟩
  · exact ⟨1229, 1229, cert_4489⟩
  · exact ⟨1230, 1229, cert_4490⟩
  · exact ⟨1230, 1229, cert_4491⟩
  · exact ⟨1230, 1229, cert_4492⟩
  · exact ⟨1230, 1230, cert_4493⟩
  · exact ⟨1231, 1230, cert_4494⟩
  · exact ⟨1231, 1230, cert_4495⟩
  · exact ⟨1231, 1230, cert_4496⟩
  · exact ⟨1231, 1231, cert_4497⟩
  · exact ⟨1232, 1231, cert_4498⟩
  · exact ⟨1232, 1231, cert_4499⟩
  · exact ⟨1232, 1231, cert_4500⟩

theorem no_fixed_digitCount_4401_4500 {n : ℕ} (hn : a n = n)
    (hlo : 4401 ≤ digitCount n) (hhi : digitCount n ≤ 4500) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_4401_4500 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_4401_4500
end OeisA113010
