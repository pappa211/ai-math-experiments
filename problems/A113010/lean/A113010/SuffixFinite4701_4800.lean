import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 4801
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_4701 : ExponentCertificate 4701 1280 1280 := by decide
private theorem cert_4702 : ExponentCertificate 4702 1281 1280 := by decide
private theorem cert_4703 : ExponentCertificate 4703 1281 1280 := by decide
private theorem cert_4704 : ExponentCertificate 4704 1281 1280 := by decide
private theorem cert_4705 : ExponentCertificate 4705 1281 1281 := by decide
private theorem cert_4706 : ExponentCertificate 4706 1282 1281 := by decide
private theorem cert_4707 : ExponentCertificate 4707 1282 1281 := by decide
private theorem cert_4708 : ExponentCertificate 4708 1282 1281 := by decide
private theorem cert_4709 : ExponentCertificate 4709 1282 1282 := by decide
private theorem cert_4710 : ExponentCertificate 4710 1283 1282 := by decide
private theorem cert_4711 : ExponentCertificate 4711 1283 1282 := by decide
private theorem cert_4712 : ExponentCertificate 4712 1283 1282 := by decide
private theorem cert_4713 : ExponentCertificate 4713 1283 1283 := by decide
private theorem cert_4714 : ExponentCertificate 4714 1284 1283 := by decide
private theorem cert_4715 : ExponentCertificate 4715 1284 1283 := by decide
private theorem cert_4716 : ExponentCertificate 4716 1284 1283 := by decide
private theorem cert_4717 : ExponentCertificate 4717 1284 1284 := by decide
private theorem cert_4718 : ExponentCertificate 4718 1284 1284 := by decide
private theorem cert_4719 : ExponentCertificate 4719 1285 1284 := by decide
private theorem cert_4720 : ExponentCertificate 4720 1285 1284 := by decide
private theorem cert_4721 : ExponentCertificate 4721 1285 1284 := by decide
private theorem cert_4722 : ExponentCertificate 4722 1285 1285 := by decide
private theorem cert_4723 : ExponentCertificate 4723 1286 1285 := by decide
private theorem cert_4724 : ExponentCertificate 4724 1286 1285 := by decide
private theorem cert_4725 : ExponentCertificate 4725 1286 1285 := by decide
private theorem cert_4726 : ExponentCertificate 4726 1286 1286 := by decide
private theorem cert_4727 : ExponentCertificate 4727 1287 1286 := by decide
private theorem cert_4728 : ExponentCertificate 4728 1287 1286 := by decide
private theorem cert_4729 : ExponentCertificate 4729 1287 1286 := by decide
private theorem cert_4730 : ExponentCertificate 4730 1287 1287 := by decide
private theorem cert_4731 : ExponentCertificate 4731 1288 1287 := by decide
private theorem cert_4732 : ExponentCertificate 4732 1288 1287 := by decide
private theorem cert_4733 : ExponentCertificate 4733 1288 1287 := by decide
private theorem cert_4734 : ExponentCertificate 4734 1288 1288 := by decide
private theorem cert_4735 : ExponentCertificate 4735 1289 1288 := by decide
private theorem cert_4736 : ExponentCertificate 4736 1289 1288 := by decide
private theorem cert_4737 : ExponentCertificate 4737 1289 1288 := by decide
private theorem cert_4738 : ExponentCertificate 4738 1289 1289 := by decide
private theorem cert_4739 : ExponentCertificate 4739 1290 1289 := by decide
private theorem cert_4740 : ExponentCertificate 4740 1290 1289 := by decide
private theorem cert_4741 : ExponentCertificate 4741 1290 1289 := by decide
private theorem cert_4742 : ExponentCertificate 4742 1290 1290 := by decide
private theorem cert_4743 : ExponentCertificate 4743 1290 1290 := by decide
private theorem cert_4744 : ExponentCertificate 4744 1291 1290 := by decide
private theorem cert_4745 : ExponentCertificate 4745 1291 1290 := by decide
private theorem cert_4746 : ExponentCertificate 4746 1291 1290 := by decide
private theorem suffix_4747 : 1291 < digitSum ((4747 : ℕ) ^ 1291 % 10 ^ 323) := by
  have hmod : (4747 : ℕ) ^ 1291 % 10 ^ 323 = 51654314460868287512966864901192228835122544568914297898137868191825275338893348999154687830570024568631640896460317938942118686269135359493730651546585095012793725259600554598061358188918939293976827897862556076243404275533822250801415007120949416389932495427259291353646664332813999107853983082505072133499897418669960403 := by
    have h1 : (4747 : ℕ) ^ 1 % 10 ^ 323 = 4747 := by decide
    have h2 : (4747 : ℕ) ^ 2 % 10 ^ 323 = 22534009 := by
      have step := pow_mod_double (k := 4747) (e := 1) (m := 10 ^ 323) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (4747 : ℕ) ^ 5 % 10 ^ 323 = 2410439072972548507 := by
      have step := pow_mod_double_add_one (k := 4747) (e := 2) (m := 10 ^ 323) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (4747 : ℕ) ^ 10 % 10 ^ 323 = 5810216524512759026321981606467929049 := by
      have step := pow_mod_double (k := 4747) (e := 5) (m := 10 ^ 323) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h20 : (4747 : ℕ) ^ 20 % 10 ^ 323 = 33758616061721124511395178767722719899067304705708360877601102982898044401 := by
      have step := pow_mod_double (k := 4747) (e := 10) (m := 10 ^ 323) h10
      have he : 2 * 10 = 20 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h40 : (4747 : ℕ) ^ 40 % 10 ^ 323 = 1139644158402695486746252139492955736070935047316282906139843069812235223493016392291539498453676955708369421646599687673003526013625491310167448801 := by
      have step := pow_mod_double (k := 4747) (e := 20) (m := 10 ^ 323) h20
      have he : 2 * 20 = 40 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h80 : (4747 : ℕ) ^ 80 % 10 ^ 323 = 1298788807781388082008829013382097106071865463667870489415510879604475066067827113130203693215462508019808158730075737345035850881967415274241761919032961912046506756239478961192429207673107987949040302649400147676171028320301644006303994306803009946696457266009974438393312465818877720956337601 := by
      have step := pow_mod_double (k := 4747) (e := 40) (m := 10 ^ 323) h40
      have he : 2 * 40 = 80 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h161 : (4747 : ℕ) ^ 161 % 10 ^ 323 = 54632610163620016686701737541822039167929514971619194098892534840116346512557415937004119481330412359357565473411965528264162682498488890365451358329569876335231051319261963785326807365568078537835341752076719082300168751933948235365625537051304655378615633650306103056281141916887904607768875138817671968898330519307899147 := by
      have step := pow_mod_double_add_one (k := 4747) (e := 80) (m := 10 ^ 323) h80
      have he : 2 * 80 + 1 = 161 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h322 : (4747 : ℕ) ^ 322 % 10 ^ 323 = 90647686934095522727978387700879542986056048350604690040814040254572458569272425688481192086535839967876805063076838235030395298768346496092297661098677553239977823657149037180349431816575423536145226510146204985711508738242738874815572232921897924383425680997963053090168522132952358092360316080866022354143136470723327609 := by
      have step := pow_mod_double (k := 4747) (e := 161) (m := 10 ^ 323) h161
      have he : 2 * 161 = 322 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h645 : (4747 : ℕ) ^ 645 % 10 ^ 323 = 88017902803994125621259682756967486600175425075768002737008356759067855754422771574926202205727360346597473774676085468228198264517148141553288652124939875507874668439651711849071693111681201985491388453416743197800573743840835393220572386202916484955001525685534549394947223950912043191907741187188050659111217353045214107 := by
      have step := pow_mod_double_add_one (k := 4747) (e := 322) (m := 10 ^ 323) h322
      have he : 2 * 322 + 1 = 645 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1291 : (4747 : ℕ) ^ 1291 % 10 ^ 323 = 51654314460868287512966864901192228835122544568914297898137868191825275338893348999154687830570024568631640896460317938942118686269135359493730651546585095012793725259600554598061358188918939293976827897862556076243404275533822250801415007120949416389932495427259291353646664332813999107853983082505072133499897418669960403 := by
      have step := pow_mod_double_add_one (k := 4747) (e := 645) (m := 10 ^ 323) h645
      have he : 2 * 645 + 1 = 1291 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1291
  rw [hmod]
  decide
private theorem cert_4747 : ExponentCertificate 4747 1291 1291 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4747) (by decide) (by decide) (by decide) suffix_4747
private theorem cert_4748 : ExponentCertificate 4748 1292 1291 := by decide
private theorem cert_4749 : ExponentCertificate 4749 1292 1291 := by decide
private theorem cert_4750 : ExponentCertificate 4750 1292 1291 := by decide
private theorem cert_4751 : ExponentCertificate 4751 1292 1292 := by decide
private theorem cert_4752 : ExponentCertificate 4752 1293 1292 := by decide
private theorem cert_4753 : ExponentCertificate 4753 1293 1292 := by decide
private theorem cert_4754 : ExponentCertificate 4754 1293 1292 := by decide
private theorem cert_4755 : ExponentCertificate 4755 1293 1293 := by decide
private theorem cert_4756 : ExponentCertificate 4756 1294 1293 := by decide
private theorem cert_4757 : ExponentCertificate 4757 1294 1293 := by decide
private theorem cert_4758 : ExponentCertificate 4758 1294 1293 := by decide
private theorem suffix_4759 : 1294 < digitSum ((4759 : ℕ) ^ 1294 % 10 ^ 324) := by
  have hmod : (4759 : ℕ) ^ 1294 % 10 ^ 324 = 479677707141390342068783339846147300533560763791452178271525107181819708723095409054035181841079275231151970926398537286112682083464699591001637356922138181918041719520158564479573293648191996041827176421570578533338735127955838890373161479959744344990294178439616705582151844560214538597692810314730001082803765568562946161 := by
    have h1 : (4759 : ℕ) ^ 1 % 10 ^ 324 = 4759 := by decide
    have h2 : (4759 : ℕ) ^ 2 % 10 ^ 324 = 22648081 := by
      have step := pow_mod_double (k := 4759) (e := 1) (m := 10 ^ 324) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (4759 : ℕ) ^ 5 % 10 ^ 324 = 2441060391824007799 := by
      have step := pow_mod_double_add_one (k := 4759) (e := 2) (m := 10 ^ 324) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (4759 : ℕ) ^ 10 % 10 ^ 324 = 5958775836531978481706967670812824401 := by
      have step := pow_mod_double (k := 4759) (e := 5) (m := 10 ^ 324) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h20 : (4759 : ℕ) ^ 20 % 10 ^ 324 = 35507009470037379940417895084344571575949980479901939808448914846861008801 := by
      have step := pow_mod_double (k := 4759) (e := 10) (m := 10 ^ 324) h10
      have he : 2 * 10 = 20 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h40 : (4759 : ℕ) ^ 40 % 10 ^ 324 = 1260747721505324180696813870294523948767230388643575430918081010905128358464092242096816962354417263949866193930168251259052743399352455447399457601 := by
      have step := pow_mod_double (k := 4759) (e := 20) (m := 10 ^ 324) h20
      have he : 2 * 20 = 40 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h80 : (4759 : ℕ) ^ 80 % 10 ^ 324 = 1589484817280866459614753085466927530100375859565823070851014707159795162386855035308301592651543717213240669155626211040683591737676933506288638516427861968351605154592086541238438078698888533238935872883530750770223806079569886968635383472061104310265110492278790369667803421795571668996675201 := by
      have step := pow_mod_double (k := 4759) (e := 40) (m := 10 ^ 324) h40
      have he : 2 * 40 = 80 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h161 : (4759 : ℕ) ^ 161 % 10 ^ 324 = 573019790521251758374495364306081591029496761374067693361928232567717247726067832569481755895584318126152381706519915741806652851868494378204118629215357979298413246221103131294196575464564469773324648901191136634757173068044407994385396140335688090956742692846856860112269827662521822602618819662990038440605711300449918359 := by
      have step := pow_mod_double_add_one (k := 4759) (e := 80) (m := 10 ^ 324) h80
      have he : 2 * 80 + 1 = 161 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h323 : (4759 : ℕ) ^ 323 % 10 ^ 324 = 80149829707252610032510829992733910434749664555528110491056819884212751540967096899828210934262759779584416965817811587153625225024348268398813068977490437691072736860914855171069806170639993057736405899639064758662963573328636908210895843533891270161297424830640767554222814434513481832923143096138685833264125752838460679 := by
      have step := pow_mod_double_add_one (k := 4759) (e := 161) (m := 10 ^ 324) h161
      have he : 2 * 161 + 1 = 323 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h647 : (4759 : ℕ) ^ 647 % 10 ^ 324 = 562719122528797721872869360836542739498784892383877670511761071074718791332193237111771982101952274743154793930885694539342397680346787544508102496572529841150982972977212492029885319375818003736153572799730223945552777997557009116482870714611798078505146656702056525126927153508261328398461965068972802291597397324482214119 := by
      have step := pow_mod_double_add_one (k := 4759) (e := 323) (m := 10 ^ 324) h323
      have he : 2 * 323 + 1 = 647 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1294 : (4759 : ℕ) ^ 1294 % 10 ^ 324 = 479677707141390342068783339846147300533560763791452178271525107181819708723095409054035181841079275231151970926398537286112682083464699591001637356922138181918041719520158564479573293648191996041827176421570578533338735127955838890373161479959744344990294178439616705582151844560214538597692810314730001082803765568562946161 := by
      have step := pow_mod_double (k := 4759) (e := 647) (m := 10 ^ 324) h647
      have he : 2 * 647 = 1294 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1294
  rw [hmod]
  decide
private theorem cert_4759 : ExponentCertificate 4759 1294 1294 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4759) (by decide) (by decide) (by decide) suffix_4759
private theorem cert_4760 : ExponentCertificate 4760 1295 1294 := by decide
private theorem cert_4761 : ExponentCertificate 4761 1295 1294 := by decide
private theorem cert_4762 : ExponentCertificate 4762 1295 1294 := by decide
private theorem cert_4763 : ExponentCertificate 4763 1295 1295 := by decide
private theorem cert_4764 : ExponentCertificate 4764 1296 1295 := by decide
private theorem cert_4765 : ExponentCertificate 4765 1296 1295 := by decide
private theorem cert_4766 : ExponentCertificate 4766 1296 1295 := by decide
private theorem cert_4767 : ExponentCertificate 4767 1296 1295 := by decide
private theorem cert_4768 : ExponentCertificate 4768 1296 1296 := by decide
private theorem cert_4769 : ExponentCertificate 4769 1297 1296 := by decide
private theorem cert_4770 : ExponentCertificate 4770 1297 1296 := by decide
private theorem cert_4771 : ExponentCertificate 4771 1297 1296 := by decide
private theorem cert_4772 : ExponentCertificate 4772 1297 1297 := by decide
private theorem cert_4773 : ExponentCertificate 4773 1298 1297 := by decide
private theorem cert_4774 : ExponentCertificate 4774 1298 1297 := by decide
private theorem cert_4775 : ExponentCertificate 4775 1298 1297 := by decide
private theorem cert_4776 : ExponentCertificate 4776 1298 1298 := by decide
private theorem cert_4777 : ExponentCertificate 4777 1299 1298 := by decide
private theorem cert_4778 : ExponentCertificate 4778 1299 1298 := by decide
private theorem cert_4779 : ExponentCertificate 4779 1299 1298 := by decide
private theorem cert_4780 : ExponentCertificate 4780 1299 1299 := by decide
private theorem cert_4781 : ExponentCertificate 4781 1300 1299 := by decide
private theorem cert_4782 : ExponentCertificate 4782 1300 1299 := by decide
private theorem cert_4783 : ExponentCertificate 4783 1300 1299 := by decide
private theorem suffix_4784 : 1300 < digitSum ((4784 : ℕ) ^ 1300 % 10 ^ 325) := by
  have hmod : (4784 : ℕ) ^ 1300 % 10 ^ 325 = 6517103901401359741095249856086997704120909227213162962732497654015741540856719018648042605759553013562917740008248178998327783423251833464257335248491508723674004514770551187701541889668818714927597082908419583421488570792658246287461421941648622000965405608208483908618664025067867541262248895482018540193562738045407461376 := by
    have h1 : (4784 : ℕ) ^ 1 % 10 ^ 325 = 4784 := by decide
    have h2 : (4784 : ℕ) ^ 2 % 10 ^ 325 = 22886656 := by
      have step := pow_mod_double (k := 4784) (e := 1) (m := 10 ^ 325) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (4784 : ℕ) ^ 5 % 10 ^ 325 = 2505854525373415424 := by
      have step := pow_mod_double_add_one (k := 4784) (e := 2) (m := 10 ^ 325) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (4784 : ℕ) ^ 10 % 10 ^ 325 = 6279306902334425085009826278881099776 := by
      have step := pow_mod_double (k := 4784) (e := 5) (m := 10 ^ 325) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h20 : (4784 : ℕ) ^ 20 % 10 ^ 325 = 39429695173704753093120117919081962854875095454721211067465764271267250176 := by
      have step := pow_mod_double (k := 4784) (e := 10) (m := 10 ^ 325) h10
      have he : 2 * 10 = 20 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h40 : (4784 : ℕ) ^ 40 % 10 ^ 325 = 1554700861491275899197406942968696124339477603937323600452040584415563188954706233016025420247463296162992218687515798047566908191869946048572030976 := by
      have step := pow_mod_double (k := 4784) (e := 20) (m := 10 ^ 325) h20
      have he : 2 * 20 = 40 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h81 : (4784 : ℕ) ^ 81 % 10 ^ 325 = 11563381373564686704106838481353891846448423838626448217369199592490525684326273390081838823891265591110616187670220801394996126570807933871065263574298101676338192231947897554402035321857749389030226467627251932607872775620726360521946867811432481229576480253635080630542007259694380078680804163584 := by
      have step := pow_mod_double_add_one (k := 4784) (e := 40) (m := 10 ^ 325) h40
      have he : 2 * 40 + 1 = 81 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h162 : (4784 : ℕ) ^ 162 % 10 ^ 325 = 8313100135620425434426494848078488677327971358651649520603086499309967991706568432081294103406166226864942267975150734356707912570883476708936586832049782134237499017896576082142731979958847842012378461411873708095784487966877193764315443481257608427623020037457141066723395622235935517237250748662693399859668257309831725056 := by
      have step := pow_mod_double (k := 4784) (e := 81) (m := 10 ^ 325) h81
      have he : 2 * 81 = 162 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h325 : (4784 : ℕ) ^ 325 % 10 ^ 325 = 8738452094019091111165270815051993552972617417300810864879775460077912971586228398936178000455140000167874722763147195009249974425745248365712714953322121889262883776755007325913379863262524057199145969304507505048331819227670864926917996878108822335502705187079868474551481357289583289087319687457642354761566685706923802624 := by
      have step := pow_mod_double_add_one (k := 4784) (e := 162) (m := 10 ^ 325) h162
      have he : 2 * 162 + 1 = 325 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h650 : (4784 : ℕ) ^ 650 % 10 ^ 325 = 9835129910602604820409294733547876689056873303366599034189584270559636041529563660369179559257479392942770434653209750043192751126061834919319168436258551784708425570134363325961785788794983014650716912254441824441368385234529870205637861591473396172662637007824764325930381331313079157728260417585933115649225596376109285376 := by
      have step := pow_mod_double (k := 4784) (e := 325) (m := 10 ^ 325) h325
      have he : 2 * 325 = 650 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1300 : (4784 : ℕ) ^ 1300 % 10 ^ 325 = 6517103901401359741095249856086997704120909227213162962732497654015741540856719018648042605759553013562917740008248178998327783423251833464257335248491508723674004514770551187701541889668818714927597082908419583421488570792658246287461421941648622000965405608208483908618664025067867541262248895482018540193562738045407461376 := by
      have step := pow_mod_double (k := 4784) (e := 650) (m := 10 ^ 325) h650
      have he : 2 * 650 = 1300 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1300
  rw [hmod]
  decide
private theorem cert_4784 : ExponentCertificate 4784 1300 1300 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4784) (by decide) (by decide) (by decide) suffix_4784
private theorem cert_4785 : ExponentCertificate 4785 1301 1300 := by decide
private theorem cert_4786 : ExponentCertificate 4786 1301 1300 := by decide
private theorem cert_4787 : ExponentCertificate 4787 1301 1300 := by decide
private theorem cert_4788 : ExponentCertificate 4788 1301 1301 := by decide
private theorem cert_4789 : ExponentCertificate 4789 1302 1301 := by decide
private theorem cert_4790 : ExponentCertificate 4790 1302 1301 := by decide
private theorem cert_4791 : ExponentCertificate 4791 1302 1301 := by decide
private theorem cert_4792 : ExponentCertificate 4792 1302 1301 := by decide
private theorem cert_4793 : ExponentCertificate 4793 1302 1302 := by decide
private theorem cert_4794 : ExponentCertificate 4794 1303 1302 := by decide
private theorem cert_4795 : ExponentCertificate 4795 1303 1302 := by decide
private theorem cert_4796 : ExponentCertificate 4796 1303 1302 := by decide
private theorem cert_4797 : ExponentCertificate 4797 1303 1303 := by decide
private theorem cert_4798 : ExponentCertificate 4798 1304 1303 := by decide
private theorem cert_4799 : ExponentCertificate 4799 1304 1303 := by decide
private theorem cert_4800 : ExponentCertificate 4800 1304 1303 := by decide

private theorem certificates_4701_4800 {k : ℕ} (hlo : 4701 ≤ k) (hhi : k ≤ 4800) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1280, 1280, cert_4701⟩
  · exact ⟨1281, 1280, cert_4702⟩
  · exact ⟨1281, 1280, cert_4703⟩
  · exact ⟨1281, 1280, cert_4704⟩
  · exact ⟨1281, 1281, cert_4705⟩
  · exact ⟨1282, 1281, cert_4706⟩
  · exact ⟨1282, 1281, cert_4707⟩
  · exact ⟨1282, 1281, cert_4708⟩
  · exact ⟨1282, 1282, cert_4709⟩
  · exact ⟨1283, 1282, cert_4710⟩
  · exact ⟨1283, 1282, cert_4711⟩
  · exact ⟨1283, 1282, cert_4712⟩
  · exact ⟨1283, 1283, cert_4713⟩
  · exact ⟨1284, 1283, cert_4714⟩
  · exact ⟨1284, 1283, cert_4715⟩
  · exact ⟨1284, 1283, cert_4716⟩
  · exact ⟨1284, 1284, cert_4717⟩
  · exact ⟨1284, 1284, cert_4718⟩
  · exact ⟨1285, 1284, cert_4719⟩
  · exact ⟨1285, 1284, cert_4720⟩
  · exact ⟨1285, 1284, cert_4721⟩
  · exact ⟨1285, 1285, cert_4722⟩
  · exact ⟨1286, 1285, cert_4723⟩
  · exact ⟨1286, 1285, cert_4724⟩
  · exact ⟨1286, 1285, cert_4725⟩
  · exact ⟨1286, 1286, cert_4726⟩
  · exact ⟨1287, 1286, cert_4727⟩
  · exact ⟨1287, 1286, cert_4728⟩
  · exact ⟨1287, 1286, cert_4729⟩
  · exact ⟨1287, 1287, cert_4730⟩
  · exact ⟨1288, 1287, cert_4731⟩
  · exact ⟨1288, 1287, cert_4732⟩
  · exact ⟨1288, 1287, cert_4733⟩
  · exact ⟨1288, 1288, cert_4734⟩
  · exact ⟨1289, 1288, cert_4735⟩
  · exact ⟨1289, 1288, cert_4736⟩
  · exact ⟨1289, 1288, cert_4737⟩
  · exact ⟨1289, 1289, cert_4738⟩
  · exact ⟨1290, 1289, cert_4739⟩
  · exact ⟨1290, 1289, cert_4740⟩
  · exact ⟨1290, 1289, cert_4741⟩
  · exact ⟨1290, 1290, cert_4742⟩
  · exact ⟨1290, 1290, cert_4743⟩
  · exact ⟨1291, 1290, cert_4744⟩
  · exact ⟨1291, 1290, cert_4745⟩
  · exact ⟨1291, 1290, cert_4746⟩
  · exact ⟨1291, 1291, cert_4747⟩
  · exact ⟨1292, 1291, cert_4748⟩
  · exact ⟨1292, 1291, cert_4749⟩
  · exact ⟨1292, 1291, cert_4750⟩
  · exact ⟨1292, 1292, cert_4751⟩
  · exact ⟨1293, 1292, cert_4752⟩
  · exact ⟨1293, 1292, cert_4753⟩
  · exact ⟨1293, 1292, cert_4754⟩
  · exact ⟨1293, 1293, cert_4755⟩
  · exact ⟨1294, 1293, cert_4756⟩
  · exact ⟨1294, 1293, cert_4757⟩
  · exact ⟨1294, 1293, cert_4758⟩
  · exact ⟨1294, 1294, cert_4759⟩
  · exact ⟨1295, 1294, cert_4760⟩
  · exact ⟨1295, 1294, cert_4761⟩
  · exact ⟨1295, 1294, cert_4762⟩
  · exact ⟨1295, 1295, cert_4763⟩
  · exact ⟨1296, 1295, cert_4764⟩
  · exact ⟨1296, 1295, cert_4765⟩
  · exact ⟨1296, 1295, cert_4766⟩
  · exact ⟨1296, 1295, cert_4767⟩
  · exact ⟨1296, 1296, cert_4768⟩
  · exact ⟨1297, 1296, cert_4769⟩
  · exact ⟨1297, 1296, cert_4770⟩
  · exact ⟨1297, 1296, cert_4771⟩
  · exact ⟨1297, 1297, cert_4772⟩
  · exact ⟨1298, 1297, cert_4773⟩
  · exact ⟨1298, 1297, cert_4774⟩
  · exact ⟨1298, 1297, cert_4775⟩
  · exact ⟨1298, 1298, cert_4776⟩
  · exact ⟨1299, 1298, cert_4777⟩
  · exact ⟨1299, 1298, cert_4778⟩
  · exact ⟨1299, 1298, cert_4779⟩
  · exact ⟨1299, 1299, cert_4780⟩
  · exact ⟨1300, 1299, cert_4781⟩
  · exact ⟨1300, 1299, cert_4782⟩
  · exact ⟨1300, 1299, cert_4783⟩
  · exact ⟨1300, 1300, cert_4784⟩
  · exact ⟨1301, 1300, cert_4785⟩
  · exact ⟨1301, 1300, cert_4786⟩
  · exact ⟨1301, 1300, cert_4787⟩
  · exact ⟨1301, 1301, cert_4788⟩
  · exact ⟨1302, 1301, cert_4789⟩
  · exact ⟨1302, 1301, cert_4790⟩
  · exact ⟨1302, 1301, cert_4791⟩
  · exact ⟨1302, 1301, cert_4792⟩
  · exact ⟨1302, 1302, cert_4793⟩
  · exact ⟨1303, 1302, cert_4794⟩
  · exact ⟨1303, 1302, cert_4795⟩
  · exact ⟨1303, 1302, cert_4796⟩
  · exact ⟨1303, 1303, cert_4797⟩
  · exact ⟨1304, 1303, cert_4798⟩
  · exact ⟨1304, 1303, cert_4799⟩
  · exact ⟨1304, 1303, cert_4800⟩

theorem no_fixed_digitCount_4701_4800 {n : ℕ} (hn : a n = n)
    (hlo : 4701 ≤ digitCount n) (hhi : digitCount n ≤ 4800) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_4701_4800 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_4701_4800
end OeisA113010
