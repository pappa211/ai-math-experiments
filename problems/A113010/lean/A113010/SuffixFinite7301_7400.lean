import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 7401
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_7301 : ExponentCertificate 7301 1890 1889 := by decide
private theorem suffix_7302 : 1890 < digitSum ((7302 : ℕ) ^ 1890 % 10 ^ 473) := by
  have hmod : (7302 : ℕ) ^ 1890 % 10 ^ 473 = 30013480041943013853854593887328520600618651247372558207085334277660001808907275483827117273118678845533551216653918458153953612325386801026136545664462113676294979149788752555521459583566679906888748898937873724788986920973685650024176991571241617427188559496685195192727946477060677992533962796011196654610324100765459778637706581160633449728787175247536871161015661491110984207724513514361725191982372757668497826209039581195924455242522364829558126944223483280148660224 := by
    have h1 : (7302 : ℕ) ^ 1 % 10 ^ 473 = 7302 := by decide
    have h3 : (7302 : ℕ) ^ 3 % 10 ^ 473 = 389336827608 := by
      have step := pow_mod_double_add_one (k := 7302) (e := 1) (m := 10 ^ 473) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (7302 : ℕ) ^ 7 % 10 ^ 473 = 1106860273253252753334150528 := by
      have step := pow_mod_double_add_one (k := 7302) (e := 3) (m := 10 ^ 473) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h14 : (7302 : ℕ) ^ 14 % 10 ^ 473 = 1225139664506265352451015984361676379376463743362678784 := by
      have step := pow_mod_double (k := 7302) (e := 7) (m := 10 ^ 473) h7
      have he : 2 * 7 = 14 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h29 : (7302 : ℕ) ^ 29 % 10 ^ 473 = 10960062476484721342950240731463112589176300865432632913758185420189039613447422189119710421509996733703873626112 := by
      have step := pow_mod_double_add_one (k := 7302) (e := 14) (m := 10 ^ 473) h14
      have he : 2 * 14 + 1 = 29 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h59 : (7302 : ℕ) ^ 59 % 10 ^ 473 = 877137923204650238564381185258843297133873594398004024184466305398975755388403653718470385808747943776747128720228033997039660439070765581982113236444533617924738132634041362861008472325376053472520407891503789946261759263244288 := by
      have step := pow_mod_double_add_one (k := 7302) (e := 29) (m := 10 ^ 473) h29
      have he : 2 * 29 + 1 = 59 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h118 : (7302 : ℕ) ^ 118 % 10 ^ 473 = 769370936323766899433513349380898186151370342070100066746988286675144651159600851832076815258693190575011679068419130004803670894485392603256164650379275809062905178637090733368002083276351673780227464776688471800794211234140410373253402058342930586508744683298970777983382704120166499213765010533601284680967849013209949832599843918219513339909958036960283863514000154240351646404555307477327403500716144716337528227359645758011413184551088462739164626944 := by
      have step := pow_mod_double (k := 7302) (e := 59) (m := 10 ^ 473) h59
      have he : 2 * 59 = 118 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h236 : (7302 : ℕ) ^ 236 % 10 ^ 473 = 50973713081284932078671624256314102810636273209740912065018175829936394542550796621693056174536150913978572110229141691377659503133287791083965175583245878898510468387787673616547858688291031433678451213219983341645585137767439619694998169927165181750354259119301688766814411346658852640407122088513990657558147143710435249226621807015256977356272104343706473844653583418775958816569390736971996771343308877260405995395716390409938018861160655422098793109785981262690779136 := by
      have step := pow_mod_double (k := 7302) (e := 118) (m := 10 ^ 473) h118
      have he : 2 * 118 = 236 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h472 : (7302 : ℕ) ^ 472 % 10 ^ 473 = 2590478279925917633812646373358509281358397688565601899156737901613321488673763030994609093709158914053086410128003386266574731677827209277042677142688303391191839238980193410115029677835772013372409914180710417806670849692721346714588035728814762306803012671993362473492153168898200581245673423724468543399848056489497059771496393104436202695317041311159205668872216917584090688394327521860122388147782078484128854428624984506131113093937452882256539206630275078732906496 := by
      have step := pow_mod_double (k := 7302) (e := 236) (m := 10 ^ 473) h236
      have he : 2 * 236 = 472 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h945 : (7302 : ℕ) ^ 945 % 10 ^ 473 = 25670865514034010150030346433650265672881107364204124284306362685056685326209779302043493593454535392072345523022965559493027262208583651462991704153535229646955159760320462666566906997033306459164653458208527133045095830415076652613893706156832229930946516285629161167662505850985945879900519560257559025770083746814821928286150792333288906300435028269622805276229026314362432347237199124481311586204511279543777359578480958141252824472533357194699462813373478132443512832 := by
      have step := pow_mod_double_add_one (k := 7302) (e := 472) (m := 10 ^ 473) h472
      have he : 2 * 472 + 1 = 945 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1890 : (7302 : ℕ) ^ 1890 % 10 ^ 473 = 30013480041943013853854593887328520600618651247372558207085334277660001808907275483827117273118678845533551216653918458153953612325386801026136545664462113676294979149788752555521459583566679906888748898937873724788986920973685650024176991571241617427188559496685195192727946477060677992533962796011196654610324100765459778637706581160633449728787175247536871161015661491110984207724513514361725191982372757668497826209039581195924455242522364829558126944223483280148660224 := by
      have step := pow_mod_double (k := 7302) (e := 945) (m := 10 ^ 473) h945
      have he : 2 * 945 = 1890 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1890
  rw [hmod]
  decide
private theorem cert_7302 : ExponentCertificate 7302 1890 1890 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 7302) (by decide) (by decide) (by decide) suffix_7302
private theorem cert_7303 : ExponentCertificate 7303 1890 1890 := by decide
private theorem cert_7304 : ExponentCertificate 7304 1891 1890 := by decide
private theorem cert_7305 : ExponentCertificate 7305 1891 1890 := by decide
private theorem cert_7306 : ExponentCertificate 7306 1891 1890 := by decide
private theorem cert_7307 : ExponentCertificate 7307 1891 1891 := by decide
private theorem cert_7308 : ExponentCertificate 7308 1892 1891 := by decide
private theorem cert_7309 : ExponentCertificate 7309 1892 1891 := by decide
private theorem cert_7310 : ExponentCertificate 7310 1892 1891 := by decide
private theorem cert_7311 : ExponentCertificate 7311 1892 1892 := by decide
private theorem cert_7312 : ExponentCertificate 7312 1893 1892 := by decide
private theorem cert_7313 : ExponentCertificate 7313 1893 1892 := by decide
private theorem cert_7314 : ExponentCertificate 7314 1893 1892 := by decide
private theorem cert_7315 : ExponentCertificate 7315 1893 1893 := by decide
private theorem cert_7316 : ExponentCertificate 7316 1893 1893 := by decide
private theorem cert_7317 : ExponentCertificate 7317 1894 1893 := by decide
private theorem cert_7318 : ExponentCertificate 7318 1894 1893 := by decide
private theorem cert_7319 : ExponentCertificate 7319 1894 1893 := by decide
private theorem cert_7320 : ExponentCertificate 7320 1894 1894 := by decide
private theorem cert_7321 : ExponentCertificate 7321 1895 1894 := by decide
private theorem cert_7322 : ExponentCertificate 7322 1895 1894 := by decide
private theorem cert_7323 : ExponentCertificate 7323 1895 1894 := by decide
private theorem cert_7324 : ExponentCertificate 7324 1895 1895 := by decide
private theorem cert_7325 : ExponentCertificate 7325 1896 1895 := by decide
private theorem cert_7326 : ExponentCertificate 7326 1896 1895 := by decide
private theorem cert_7327 : ExponentCertificate 7327 1896 1895 := by decide
private theorem cert_7328 : ExponentCertificate 7328 1896 1895 := by decide
private theorem cert_7329 : ExponentCertificate 7329 1896 1896 := by decide
private theorem cert_7330 : ExponentCertificate 7330 1897 1896 := by decide
private theorem cert_7331 : ExponentCertificate 7331 1897 1896 := by decide
private theorem cert_7332 : ExponentCertificate 7332 1897 1896 := by decide
private theorem suffix_7333 : 1897 < digitSum ((7333 : ℕ) ^ 1897 % 10 ^ 475) := by
  have hmod : (7333 : ℕ) ^ 1897 % 10 ^ 475 = 4141472354897925498328621554957012393115773684820480130433211264002255142576981178704870043654558794586715799166399398709814968528273696138453726405456003247149766634635594223822247269798467230031503995893224300736089103523561554184603219032631062259458488320442476830300505715672400356595431838822736572459447280176598174272692529663508771644631424795618815265742563997891724881431601833689775784573666416541224881415411733230041489387853221164940163579445476936352233603973 := by
    have h1 : (7333 : ℕ) ^ 1 % 10 ^ 475 = 7333 := by decide
    have h3 : (7333 : ℕ) ^ 3 % 10 ^ 475 = 394316595037 := by
      have step := pow_mod_double_add_one (k := 7333) (e := 1) (m := 10 ^ 475) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (7333 : ℕ) ^ 7 % 10 ^ 475 = 1140175737032498131079028877 := by
      have step := pow_mod_double_add_one (k := 7333) (e := 3) (m := 10 ^ 475) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h14 : (7333 : ℕ) ^ 14 % 10 ^ 475 = 1300000711317600330109364838679144440601303337399881129 := by
      have step := pow_mod_double (k := 7333) (e := 7) (m := 10 ^ 475) h7
      have he : 2 * 7 = 14 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h29 : (7333 : ℕ) ^ 29 % 10 ^ 475 = 12392783561842814671817507452977870825654210175690245796376477231777302032498626962826255633546471677801197262453 := by
      have step := pow_mod_double_add_one (k := 7333) (e := 14) (m := 10 ^ 475) h14
      have he : 2 * 14 + 1 = 29 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h59 : (7333 : ℕ) ^ 59 % 10 ^ 475 = 1126210091983527295343849691541599762382162380252475853178591970416066900891982672271937659142001402003466956324259447577713174757460861919230935558930545608973937720008947773999457172311760513155609289177265392930421939111673597 := by
      have step := pow_mod_double_add_one (k := 7333) (e := 29) (m := 10 ^ 475) h29
      have he : 2 * 29 + 1 = 59 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h118 : (7333 : ℕ) ^ 118 % 10 ^ 475 = 1268349171285545011547687615489162136491207540991830014542977609703102850502441542716327931299505545192949759487519318841424491000830545446189789568566558373543824214857796919045492860142209561782632238723312958303754637997817071197037234429704694748975308203492651186699137464249380873835534209787348361238354599730663850046332489880355749815627608100418845995927811108907135221151394794109906607241571525035806139665046448231954676836898324160158266918409 := by
      have step := pow_mod_double (k := 7333) (e := 59) (m := 10 ^ 475) h59
      have he : 2 * 59 = 118 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h237 : (7333 : ℕ) ^ 237 % 10 ^ 475 = 7734277197909719311483606939525323952483455336959048080219496926600715300762247926436565328651252609481087650262709809954338844533153166886218394991144313711941447329977513557538730928047388041341539710231078514055968669322525729638827033942846087237643494854764763627605500133732785809463750447031885340562914487231605099491007572174518180595503690951739475314490751206278674532893853966003805208497415682142019639987344008393257893275012315129565543491110732880235648363573 := by
      have step := pow_mod_double_add_one (k := 7333) (e := 118) (m := 10 ^ 475) h118
      have he : 2 * 118 + 1 = 237 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h474 : (7333 : ℕ) ^ 474 % 10 ^ 475 = 7442564804889347151266764369939729135578798777545457052443178563275932352720005620618364841007207574430967615666622034339232475320351223209556948576101667365457711129417006144934319643066741212399134334802389992628762972241784026796104417637804709101720068257219122418347461863590471907063954351301677770369482843313255947446198304142355225783714530741691525478863059355255825076610678159222752543565032553261720400518080690585466063468249518966305750672980911734632793326329 := by
      have step := pow_mod_double (k := 7333) (e := 237) (m := 10 ^ 475) h237
      have he : 2 * 237 = 474 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h948 : (7333 : ℕ) ^ 948 % 10 ^ 475 = 1788820917993396658558269052228396775765079388277341740038758365003712296300489122694573121488101306014280652520856109073942771034323952931630266653858555461685230757556523132269603999843127586651045830717109017818855822518361860051203508042604044999679130472531574303206508422963738421671370453838687867236098531177833931553644968044919580615466822645547149174284758837884929013671427600459573996808251173820404565550362494876261287934137608292729640562441882818520284616241 := by
      have step := pow_mod_double (k := 7333) (e := 474) (m := 10 ^ 475) h474
      have he : 2 * 474 = 948 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1897 : (7333 : ℕ) ^ 1897 % 10 ^ 475 = 4141472354897925498328621554957012393115773684820480130433211264002255142576981178704870043654558794586715799166399398709814968528273696138453726405456003247149766634635594223822247269798467230031503995893224300736089103523561554184603219032631062259458488320442476830300505715672400356595431838822736572459447280176598174272692529663508771644631424795618815265742563997891724881431601833689775784573666416541224881415411733230041489387853221164940163579445476936352233603973 := by
      have step := pow_mod_double_add_one (k := 7333) (e := 948) (m := 10 ^ 475) h948
      have he : 2 * 948 + 1 = 1897 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1897
  rw [hmod]
  decide
private theorem cert_7333 : ExponentCertificate 7333 1897 1897 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 7333) (by decide) (by decide) (by decide) suffix_7333
private theorem cert_7334 : ExponentCertificate 7334 1898 1897 := by decide
private theorem cert_7335 : ExponentCertificate 7335 1898 1897 := by decide
private theorem cert_7336 : ExponentCertificate 7336 1898 1897 := by decide
private theorem cert_7337 : ExponentCertificate 7337 1898 1898 := by decide
private theorem cert_7338 : ExponentCertificate 7338 1899 1898 := by decide
private theorem cert_7339 : ExponentCertificate 7339 1899 1898 := by decide
private theorem cert_7340 : ExponentCertificate 7340 1899 1898 := by decide
private theorem cert_7341 : ExponentCertificate 7341 1899 1898 := by decide
private theorem cert_7342 : ExponentCertificate 7342 1899 1899 := by decide
private theorem cert_7343 : ExponentCertificate 7343 1900 1899 := by decide
private theorem cert_7344 : ExponentCertificate 7344 1900 1899 := by decide
private theorem cert_7345 : ExponentCertificate 7345 1900 1899 := by decide
private theorem cert_7346 : ExponentCertificate 7346 1900 1900 := by decide
private theorem cert_7347 : ExponentCertificate 7347 1901 1900 := by decide
private theorem cert_7348 : ExponentCertificate 7348 1901 1900 := by decide
private theorem cert_7349 : ExponentCertificate 7349 1901 1900 := by decide
private theorem cert_7350 : ExponentCertificate 7350 1901 1901 := by decide
private theorem cert_7351 : ExponentCertificate 7351 1902 1901 := by decide
private theorem cert_7352 : ExponentCertificate 7352 1902 1901 := by decide
private theorem cert_7353 : ExponentCertificate 7353 1902 1901 := by decide
private theorem cert_7354 : ExponentCertificate 7354 1902 1901 := by decide
private theorem cert_7355 : ExponentCertificate 7355 1902 1902 := by decide
private theorem cert_7356 : ExponentCertificate 7356 1903 1902 := by decide
private theorem cert_7357 : ExponentCertificate 7357 1903 1902 := by decide
private theorem cert_7358 : ExponentCertificate 7358 1903 1902 := by decide
private theorem cert_7359 : ExponentCertificate 7359 1903 1903 := by decide
private theorem cert_7360 : ExponentCertificate 7360 1904 1903 := by decide
private theorem cert_7361 : ExponentCertificate 7361 1904 1903 := by decide
private theorem cert_7362 : ExponentCertificate 7362 1904 1903 := by decide
private theorem cert_7363 : ExponentCertificate 7363 1904 1904 := by decide
private theorem cert_7364 : ExponentCertificate 7364 1905 1904 := by decide
private theorem cert_7365 : ExponentCertificate 7365 1905 1904 := by decide
private theorem cert_7366 : ExponentCertificate 7366 1905 1904 := by decide
private theorem cert_7367 : ExponentCertificate 7367 1905 1904 := by decide
private theorem cert_7368 : ExponentCertificate 7368 1905 1905 := by decide
private theorem cert_7369 : ExponentCertificate 7369 1906 1905 := by decide
private theorem cert_7370 : ExponentCertificate 7370 1906 1905 := by decide
private theorem cert_7371 : ExponentCertificate 7371 1906 1905 := by decide
private theorem cert_7372 : ExponentCertificate 7372 1906 1906 := by decide
private theorem cert_7373 : ExponentCertificate 7373 1907 1906 := by decide
private theorem cert_7374 : ExponentCertificate 7374 1907 1906 := by decide
private theorem cert_7375 : ExponentCertificate 7375 1907 1906 := by decide
private theorem cert_7376 : ExponentCertificate 7376 1907 1907 := by decide
private theorem cert_7377 : ExponentCertificate 7377 1907 1907 := by decide
private theorem cert_7378 : ExponentCertificate 7378 1908 1907 := by decide
private theorem cert_7379 : ExponentCertificate 7379 1908 1907 := by decide
private theorem cert_7380 : ExponentCertificate 7380 1908 1907 := by decide
private theorem cert_7381 : ExponentCertificate 7381 1908 1908 := by decide
private theorem cert_7382 : ExponentCertificate 7382 1909 1908 := by decide
private theorem cert_7383 : ExponentCertificate 7383 1909 1908 := by decide
private theorem cert_7384 : ExponentCertificate 7384 1909 1908 := by decide
private theorem cert_7385 : ExponentCertificate 7385 1909 1909 := by decide
private theorem cert_7386 : ExponentCertificate 7386 1910 1909 := by decide
private theorem cert_7387 : ExponentCertificate 7387 1910 1909 := by decide
private theorem cert_7388 : ExponentCertificate 7388 1910 1909 := by decide
private theorem cert_7389 : ExponentCertificate 7389 1910 1910 := by decide
private theorem cert_7390 : ExponentCertificate 7390 1910 1910 := by decide
private theorem cert_7391 : ExponentCertificate 7391 1911 1910 := by decide
private theorem cert_7392 : ExponentCertificate 7392 1911 1910 := by decide
private theorem cert_7393 : ExponentCertificate 7393 1911 1910 := by decide
private theorem cert_7394 : ExponentCertificate 7394 1911 1911 := by decide
private theorem cert_7395 : ExponentCertificate 7395 1912 1911 := by decide
private theorem cert_7396 : ExponentCertificate 7396 1912 1911 := by decide
private theorem cert_7397 : ExponentCertificate 7397 1912 1911 := by decide
private theorem cert_7398 : ExponentCertificate 7398 1912 1912 := by decide
private theorem cert_7399 : ExponentCertificate 7399 1913 1912 := by decide
private theorem cert_7400 : ExponentCertificate 7400 1913 1912 := by decide

private theorem certificates_7301_7400 {k : ℕ} (hlo : 7301 ≤ k) (hhi : k ≤ 7400) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1890, 1889, cert_7301⟩
  · exact ⟨1890, 1890, cert_7302⟩
  · exact ⟨1890, 1890, cert_7303⟩
  · exact ⟨1891, 1890, cert_7304⟩
  · exact ⟨1891, 1890, cert_7305⟩
  · exact ⟨1891, 1890, cert_7306⟩
  · exact ⟨1891, 1891, cert_7307⟩
  · exact ⟨1892, 1891, cert_7308⟩
  · exact ⟨1892, 1891, cert_7309⟩
  · exact ⟨1892, 1891, cert_7310⟩
  · exact ⟨1892, 1892, cert_7311⟩
  · exact ⟨1893, 1892, cert_7312⟩
  · exact ⟨1893, 1892, cert_7313⟩
  · exact ⟨1893, 1892, cert_7314⟩
  · exact ⟨1893, 1893, cert_7315⟩
  · exact ⟨1893, 1893, cert_7316⟩
  · exact ⟨1894, 1893, cert_7317⟩
  · exact ⟨1894, 1893, cert_7318⟩
  · exact ⟨1894, 1893, cert_7319⟩
  · exact ⟨1894, 1894, cert_7320⟩
  · exact ⟨1895, 1894, cert_7321⟩
  · exact ⟨1895, 1894, cert_7322⟩
  · exact ⟨1895, 1894, cert_7323⟩
  · exact ⟨1895, 1895, cert_7324⟩
  · exact ⟨1896, 1895, cert_7325⟩
  · exact ⟨1896, 1895, cert_7326⟩
  · exact ⟨1896, 1895, cert_7327⟩
  · exact ⟨1896, 1895, cert_7328⟩
  · exact ⟨1896, 1896, cert_7329⟩
  · exact ⟨1897, 1896, cert_7330⟩
  · exact ⟨1897, 1896, cert_7331⟩
  · exact ⟨1897, 1896, cert_7332⟩
  · exact ⟨1897, 1897, cert_7333⟩
  · exact ⟨1898, 1897, cert_7334⟩
  · exact ⟨1898, 1897, cert_7335⟩
  · exact ⟨1898, 1897, cert_7336⟩
  · exact ⟨1898, 1898, cert_7337⟩
  · exact ⟨1899, 1898, cert_7338⟩
  · exact ⟨1899, 1898, cert_7339⟩
  · exact ⟨1899, 1898, cert_7340⟩
  · exact ⟨1899, 1898, cert_7341⟩
  · exact ⟨1899, 1899, cert_7342⟩
  · exact ⟨1900, 1899, cert_7343⟩
  · exact ⟨1900, 1899, cert_7344⟩
  · exact ⟨1900, 1899, cert_7345⟩
  · exact ⟨1900, 1900, cert_7346⟩
  · exact ⟨1901, 1900, cert_7347⟩
  · exact ⟨1901, 1900, cert_7348⟩
  · exact ⟨1901, 1900, cert_7349⟩
  · exact ⟨1901, 1901, cert_7350⟩
  · exact ⟨1902, 1901, cert_7351⟩
  · exact ⟨1902, 1901, cert_7352⟩
  · exact ⟨1902, 1901, cert_7353⟩
  · exact ⟨1902, 1901, cert_7354⟩
  · exact ⟨1902, 1902, cert_7355⟩
  · exact ⟨1903, 1902, cert_7356⟩
  · exact ⟨1903, 1902, cert_7357⟩
  · exact ⟨1903, 1902, cert_7358⟩
  · exact ⟨1903, 1903, cert_7359⟩
  · exact ⟨1904, 1903, cert_7360⟩
  · exact ⟨1904, 1903, cert_7361⟩
  · exact ⟨1904, 1903, cert_7362⟩
  · exact ⟨1904, 1904, cert_7363⟩
  · exact ⟨1905, 1904, cert_7364⟩
  · exact ⟨1905, 1904, cert_7365⟩
  · exact ⟨1905, 1904, cert_7366⟩
  · exact ⟨1905, 1904, cert_7367⟩
  · exact ⟨1905, 1905, cert_7368⟩
  · exact ⟨1906, 1905, cert_7369⟩
  · exact ⟨1906, 1905, cert_7370⟩
  · exact ⟨1906, 1905, cert_7371⟩
  · exact ⟨1906, 1906, cert_7372⟩
  · exact ⟨1907, 1906, cert_7373⟩
  · exact ⟨1907, 1906, cert_7374⟩
  · exact ⟨1907, 1906, cert_7375⟩
  · exact ⟨1907, 1907, cert_7376⟩
  · exact ⟨1907, 1907, cert_7377⟩
  · exact ⟨1908, 1907, cert_7378⟩
  · exact ⟨1908, 1907, cert_7379⟩
  · exact ⟨1908, 1907, cert_7380⟩
  · exact ⟨1908, 1908, cert_7381⟩
  · exact ⟨1909, 1908, cert_7382⟩
  · exact ⟨1909, 1908, cert_7383⟩
  · exact ⟨1909, 1908, cert_7384⟩
  · exact ⟨1909, 1909, cert_7385⟩
  · exact ⟨1910, 1909, cert_7386⟩
  · exact ⟨1910, 1909, cert_7387⟩
  · exact ⟨1910, 1909, cert_7388⟩
  · exact ⟨1910, 1910, cert_7389⟩
  · exact ⟨1910, 1910, cert_7390⟩
  · exact ⟨1911, 1910, cert_7391⟩
  · exact ⟨1911, 1910, cert_7392⟩
  · exact ⟨1911, 1910, cert_7393⟩
  · exact ⟨1911, 1911, cert_7394⟩
  · exact ⟨1912, 1911, cert_7395⟩
  · exact ⟨1912, 1911, cert_7396⟩
  · exact ⟨1912, 1911, cert_7397⟩
  · exact ⟨1912, 1912, cert_7398⟩
  · exact ⟨1913, 1912, cert_7399⟩
  · exact ⟨1913, 1912, cert_7400⟩

theorem no_fixed_digitCount_7301_7400 {n : ℕ} (hn : a n = n)
    (hlo : 7301 ≤ digitCount n) (hhi : digitCount n ≤ 7400) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_7301_7400 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_7301_7400
end OeisA113010
