import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 5901
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_5801 : ExponentCertificate 5801 1542 1541 := by decide
private theorem cert_5802 : ExponentCertificate 5802 1542 1541 := by decide
private theorem cert_5803 : ExponentCertificate 5803 1542 1541 := by decide
private theorem cert_5804 : ExponentCertificate 5804 1542 1542 := by decide
private theorem cert_5805 : ExponentCertificate 5805 1543 1542 := by decide
private theorem cert_5806 : ExponentCertificate 5806 1543 1542 := by decide
private theorem cert_5807 : ExponentCertificate 5807 1543 1542 := by decide
private theorem cert_5808 : ExponentCertificate 5808 1543 1543 := by decide
private theorem suffix_5809 : 1543 < digitSum ((5809 : ℕ) ^ 1543 % 10 ^ 386) := by
  have hmod : (5809 : ℕ) ^ 1543 % 10 ^ 386 = 84576798680110863303759604651507177270032767791244035700864915149806393462040174628962394381481519063629181448790206731789361398567763667201615537497224401067535571850736702525203494541582874406262203098116397581970999397676816704262404957759536653677904842615879178750491321648027045926221215717814392690773940618591188718835931216464265185214851162386644074845966984029424412821912529 := by
    have h1 : (5809 : ℕ) ^ 1 % 10 ^ 386 = 5809 := by decide
    have h3 : (5809 : ℕ) ^ 3 % 10 ^ 386 = 196021690129 := by
      have step := pow_mod_double_add_one (k := 5809) (e := 1) (m := 10 ^ 386) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (5809 : ℕ) ^ 6 % 10 ^ 386 = 38424503001029696036641 := by
      have step := pow_mod_double (k := 5809) (e := 3) (m := 10 ^ 386) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (5809 : ℕ) ^ 12 % 10 ^ 386 = 1476442430876140116899060702773874183614562881 := by
      have step := pow_mod_double (k := 5809) (e := 6) (m := 10 ^ 386) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h24 : (5809 : ℕ) ^ 24 % 10 ^ 386 = 2179882251691445787197488001881832833987300252098071041856521246495111108249689980703020161 := by
      have step := pow_mod_double (k := 5809) (e := 12) (m := 10 ^ 386) h12
      have he : 2 * 12 = 24 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h48 : (5809 : ℕ) ^ 48 % 10 ^ 386 = 4751886631239367799559151530808477851123375038597678301572978492560323533680681482879196015957065942058525210811546857492386561840457034349685000592768160181571356373610906772465921 := by
      have step := pow_mod_double (k := 5809) (e := 24) (m := 10 ^ 386) h24
      have he : 2 * 24 = 48 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h96 : (5809 : ℕ) ^ 96 % 10 ^ 386 = 22580426556151427454291336649369771188212410856955601094155309321359504847445694236279386858931188903260771621467032497505608946863314219089435316688340866433975122155862284664158363083648862743357858703237144771869474241185730106412410440947490335547532831039238308072328127738893386026691541696491045907101214483496152015139365468271138861973794572451106378241 := by
      have step := pow_mod_double (k := 5809) (e := 48) (m := 10 ^ 386) h48
      have he : 2 * 48 = 96 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h192 : (5809 : ℕ) ^ 192 % 10 ^ 386 = 80835333176460061476532416943007088062768658587273618065813215392240223450278823626288727388683235642267043014776032831831231605484479426203896364181956329983494955333175099820163690148225843283973725220153627396474537182017073033687389400023641964875824913108738366823787663249839606492761242852251779650804723741676356007290370137217016709730665709756083432916256826380193712158254081 := by
      have step := pow_mod_double (k := 5809) (e := 96) (m := 10 ^ 386) h96
      have he : 2 * 96 = 192 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h385 : (5809 : ℕ) ^ 385 % 10 ^ 386 = 84653293997800983799481761494730783153300047353147741640891331180285573319014761669779791944850340284617166186179170371791169130323551675779331877413130314024116049362743161747687005015970540976806506008403612848660842125843755815695764209716914203000704686501714198693373669566428014929155694384253914827410904382389774295918688041171248996849558695594442031082564803032944571674844849 := by
      have step := pow_mod_double_add_one (k := 5809) (e := 192) (m := 10 ^ 386) h192
      have he : 2 * 192 + 1 = 385 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h771 : (5809 : ℕ) ^ 771 % 10 ^ 386 = 409922941823912353565459202045250380002716867098839370276839382178644443430456454148139447623428264047081186830147493996893231566238596142966735606032283812694149533854107725231478783002650774693717813745464864955345065420549515970721140157003232886471274401462597040984128422029145734780339850446309965929381327234876909680603274549194940161831128794053265627250878894049840626741009 := by
      have step := pow_mod_double_add_one (k := 5809) (e := 385) (m := 10 ^ 386) h385
      have he : 2 * 385 + 1 = 771 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1543 : (5809 : ℕ) ^ 1543 % 10 ^ 386 = 84576798680110863303759604651507177270032767791244035700864915149806393462040174628962394381481519063629181448790206731789361398567763667201615537497224401067535571850736702525203494541582874406262203098116397581970999397676816704262404957759536653677904842615879178750491321648027045926221215717814392690773940618591188718835931216464265185214851162386644074845966984029424412821912529 := by
      have step := pow_mod_double_add_one (k := 5809) (e := 771) (m := 10 ^ 386) h771
      have he : 2 * 771 + 1 = 1543 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1543
  rw [hmod]
  decide
private theorem cert_5809 : ExponentCertificate 5809 1543 1543 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5809) (by decide) (by decide) (by decide) suffix_5809
private theorem cert_5810 : ExponentCertificate 5810 1544 1543 := by decide
private theorem cert_5811 : ExponentCertificate 5811 1544 1543 := by decide
private theorem cert_5812 : ExponentCertificate 5812 1544 1543 := by decide
private theorem cert_5813 : ExponentCertificate 5813 1544 1544 := by decide
private theorem cert_5814 : ExponentCertificate 5814 1545 1544 := by decide
private theorem cert_5815 : ExponentCertificate 5815 1545 1544 := by decide
private theorem cert_5816 : ExponentCertificate 5816 1545 1544 := by decide
private theorem cert_5817 : ExponentCertificate 5817 1545 1545 := by decide
private theorem cert_5818 : ExponentCertificate 5818 1546 1545 := by decide
private theorem cert_5819 : ExponentCertificate 5819 1546 1545 := by decide
private theorem cert_5820 : ExponentCertificate 5820 1546 1545 := by decide
private theorem suffix_5821 : 1546 < digitSum ((5821 : ℕ) ^ 1546 % 10 ^ 387) := by
  have hmod : (5821 : ℕ) ^ 1546 % 10 ^ 387 = 750285976006108565553540461864460633089686117018881555280725892298165505976992152363076657164163378375243327122919001006494634214642327686685579419247227196420229135496273067956435036331123392880709110228864987371372832854841402080814506910643228864249758795971480053273399509521404516228143215479815140070468908479003664010520272930451338244747028278706611206253659228450953958076871721 := by
    have h1 : (5821 : ℕ) ^ 1 % 10 ^ 387 = 5821 := by decide
    have h3 : (5821 : ℕ) ^ 3 % 10 ^ 387 = 197239002661 := by
      have step := pow_mod_double_add_one (k := 5821) (e := 1) (m := 10 ^ 387) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (5821 : ℕ) ^ 6 % 10 ^ 387 = 38903224170705965080921 := by
      have step := pow_mod_double (k := 5821) (e := 3) (m := 10 ^ 387) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (5821 : ℕ) ^ 12 % 10 ^ 387 = 1513460850876200824499022092816619794078208241 := by
      have step := pow_mod_double (k := 5821) (e := 6) (m := 10 ^ 387) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h24 : (5821 : ℕ) ^ 24 % 10 ^ 387 = 2290563747134913790001709486378806689434136559852881563101482432151255575315161236960314081 := by
      have step := pow_mod_double (k := 5821) (e := 12) (m := 10 ^ 387) h12
      have he : 2 * 12 = 24 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h48 : (5821 : ℕ) ^ 48 % 10 ^ 387 = 5246682279688737281714775365783195190450481591134116286792607786986760494772435881780887437836110951781281464006792913745496425416588349410019540175063706286858392354531366166874561 := by
      have step := pow_mod_double (k := 5821) (e := 24) (m := 10 ^ 387) h24
      have he : 2 * 24 = 48 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h96 : (5821 : ℕ) ^ 96 % 10 ^ 387 = 27527674943999805223193444331464724168890643987894967062771013657570503583908768695417201543717013966660197183675380818136414088330834048873696471543480187273066286002092205012865624265449421001527340511267026900623194819069794083343363200481738675577224425852150086679713716414922129358181616164025713814671664666910450902289521644302064482312151807771108942721 := by
      have step := pow_mod_double (k := 5821) (e := 48) (m := 10 ^ 387) h48
      have he : 2 * 48 = 96 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h193 : (5821 : ℕ) ^ 193 % 10 ^ 387 = 129810389504831202837163882503110577618565268332265716780818831380733781591465098551677546548804579833547785611699792640182215695848548338579774951080389561320233483302910287093662590371707108189173143263054544369481187118209191600067071989750013291964886649657182938014866709894384709239174745135855950328325795367599512335648867185855840315804751470652916470956588126582135329162838461 := by
      have step := pow_mod_double_add_one (k := 5821) (e := 96) (m := 10 ^ 387) h96
      have he : 2 * 96 + 1 = 193 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h386 : (5821 : ℕ) ^ 386 % 10 ^ 387 = 262014695173767164437042320823070846067140647356084765459462548999208151092092459050914834681911933986320298060127712911757836917596397999420073187857264028069310978501508741516380200525653824443245402399314150992737453682646264966618585275284711508733418826545236192113642418103472773788168652470453245670933163127773693934713753429897069444001071789816132465956954455162693702380848521 := by
      have step := pow_mod_double (k := 5821) (e := 193) (m := 10 ^ 387) h193
      have he : 2 * 193 = 386 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h773 : (5821 : ℕ) ^ 773 % 10 ^ 387 = 187749188730422398091392632178711264811421655086462104015305701911006849972338760975465441449151980194552340773086275531482757992132671095692047411143854150638967520298311853929229916542262146107952348132873282080062412424712726317633825468720308675358738752122386451044963910277687588373237487430323170602654757119084487491746410280941972386187923007224788618768123860675440376652794061 := by
      have step := pow_mod_double_add_one (k := 5821) (e := 386) (m := 10 ^ 387) h386
      have he : 2 * 386 + 1 = 773 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1546 : (5821 : ℕ) ^ 1546 % 10 ^ 387 = 750285976006108565553540461864460633089686117018881555280725892298165505976992152363076657164163378375243327122919001006494634214642327686685579419247227196420229135496273067956435036331123392880709110228864987371372832854841402080814506910643228864249758795971480053273399509521404516228143215479815140070468908479003664010520272930451338244747028278706611206253659228450953958076871721 := by
      have step := pow_mod_double (k := 5821) (e := 773) (m := 10 ^ 387) h773
      have he : 2 * 773 = 1546 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1546
  rw [hmod]
  decide
private theorem cert_5821 : ExponentCertificate 5821 1546 1546 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5821) (by decide) (by decide) (by decide) suffix_5821
private theorem cert_5822 : ExponentCertificate 5822 1547 1546 := by decide
private theorem cert_5823 : ExponentCertificate 5823 1547 1546 := by decide
private theorem cert_5824 : ExponentCertificate 5824 1547 1546 := by decide
private theorem cert_5825 : ExponentCertificate 5825 1547 1547 := by decide
private theorem cert_5826 : ExponentCertificate 5826 1547 1547 := by decide
private theorem cert_5827 : ExponentCertificate 5827 1548 1547 := by decide
private theorem cert_5828 : ExponentCertificate 5828 1548 1547 := by decide
private theorem cert_5829 : ExponentCertificate 5829 1548 1547 := by decide
private theorem cert_5830 : ExponentCertificate 5830 1548 1548 := by decide
private theorem cert_5831 : ExponentCertificate 5831 1549 1548 := by decide
private theorem cert_5832 : ExponentCertificate 5832 1549 1548 := by decide
private theorem cert_5833 : ExponentCertificate 5833 1549 1548 := by decide
private theorem cert_5834 : ExponentCertificate 5834 1549 1549 := by decide
private theorem cert_5835 : ExponentCertificate 5835 1550 1549 := by decide
private theorem cert_5836 : ExponentCertificate 5836 1550 1549 := by decide
private theorem cert_5837 : ExponentCertificate 5837 1550 1549 := by decide
private theorem cert_5838 : ExponentCertificate 5838 1550 1550 := by decide
private theorem cert_5839 : ExponentCertificate 5839 1551 1550 := by decide
private theorem cert_5840 : ExponentCertificate 5840 1551 1550 := by decide
private theorem cert_5841 : ExponentCertificate 5841 1551 1550 := by decide
private theorem cert_5842 : ExponentCertificate 5842 1551 1551 := by decide
private theorem cert_5843 : ExponentCertificate 5843 1551 1551 := by decide
private theorem cert_5844 : ExponentCertificate 5844 1552 1551 := by decide
private theorem cert_5845 : ExponentCertificate 5845 1552 1551 := by decide
private theorem cert_5846 : ExponentCertificate 5846 1552 1551 := by decide
private theorem cert_5847 : ExponentCertificate 5847 1552 1552 := by decide
private theorem cert_5848 : ExponentCertificate 5848 1553 1552 := by decide
private theorem cert_5849 : ExponentCertificate 5849 1553 1552 := by decide
private theorem cert_5850 : ExponentCertificate 5850 1553 1552 := by decide
private theorem cert_5851 : ExponentCertificate 5851 1553 1553 := by decide
private theorem cert_5852 : ExponentCertificate 5852 1554 1553 := by decide
private theorem cert_5853 : ExponentCertificate 5853 1554 1553 := by decide
private theorem cert_5854 : ExponentCertificate 5854 1554 1553 := by decide
private theorem cert_5855 : ExponentCertificate 5855 1554 1554 := by decide
private theorem cert_5856 : ExponentCertificate 5856 1555 1554 := by decide
private theorem cert_5857 : ExponentCertificate 5857 1555 1554 := by decide
private theorem cert_5858 : ExponentCertificate 5858 1555 1554 := by decide
private theorem cert_5859 : ExponentCertificate 5859 1555 1555 := by decide
private theorem cert_5860 : ExponentCertificate 5860 1555 1555 := by decide
private theorem cert_5861 : ExponentCertificate 5861 1556 1555 := by decide
private theorem cert_5862 : ExponentCertificate 5862 1556 1555 := by decide
private theorem cert_5863 : ExponentCertificate 5863 1556 1555 := by decide
private theorem cert_5864 : ExponentCertificate 5864 1556 1556 := by decide
private theorem cert_5865 : ExponentCertificate 5865 1557 1556 := by decide
private theorem cert_5866 : ExponentCertificate 5866 1557 1556 := by decide
private theorem cert_5867 : ExponentCertificate 5867 1557 1556 := by decide
private theorem suffix_5868 : 1557 < digitSum ((5868 : ℕ) ^ 1557 % 10 ^ 390) := by
  have hmod : (5868 : ℕ) ^ 1557 % 10 ^ 390 = 871407013741096796803361884890135922133238151474334553511129060738497360927050273462407839548706216663703548631104288488760345504102913145814257226090198054135692000615425398039324499143472995124677749588917273669919885168571725643762116844230892853812046388677818826489844666331486645729251943802036388703954906660189073042491038259887046780971304521463869548677364769634720956286572167168 := by
    have h1 : (5868 : ℕ) ^ 1 % 10 ^ 390 = 5868 := by decide
    have h3 : (5868 : ℕ) ^ 3 % 10 ^ 390 = 202055332032 := by
      have step := pow_mod_double_add_one (k := 5868) (e := 1) (m := 10 ^ 390) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (5868 : ℕ) ^ 6 % 10 ^ 390 = 40826357202561765249024 := by
      have step := pow_mod_double (k := 5868) (e := 3) (m := 10 ^ 390) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (5868 : ℕ) ^ 12 % 10 ^ 390 = 1666791442431166926244964191936706996732952576 := by
      have step := pow_mod_double (k := 5868) (e := 6) (m := 10 ^ 390) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h24 : (5868 : ℕ) ^ 24 % 10 ^ 390 = 2778193712561770049663007939720627646926869966156591419390277491370879659888062870665035776 := by
      have step := pow_mod_double (k := 5868) (e := 12) (m := 10 ^ 390) h12
      have he : 2 * 12 = 24 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h48 : (5868 : ℕ) ^ 48 % 10 ^ 390 = 7718360304517750983442978342974223937779244134818106481485392693091456151969663320126328315796049709555121467397195615718620145722754841844712807239310837905184828216746823359922176 := by
      have step := pow_mod_double (k := 5868) (e := 24) (m := 10 ^ 390) h24
      have he : 2 * 24 = 48 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h97 : (5868 : ℕ) ^ 97 % 10 ^ 390 = 349574867417805191993797658485246178744419161881615894655159931460915838499036981728546236861045229646471413834133428437245275620304053397346026974128295300421258234410008897349318538671354747516748270037919448331318023279692407480055579763456776516987936601000254001554064181607161835228836902686556847477314552821097053427896378871071723769412364861040380941959168 := by
      have step := pow_mod_double_add_one (k := 5868) (e := 48) (m := 10 ^ 390) h48
      have he : 2 * 48 + 1 = 97 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h194 : (5868 : ℕ) ^ 194 % 10 ^ 390 = 999088886539538261910637904123244609277212371246632228347668357237261319772577401050542252885362566398747962624856815289283834689079965972683750737451319042743859770100043631085902075540696497868143471971413859064799077777304026092749528880362536079957561185450941072906267617371934632147401459423880668482927991796732711471835338828288721890508022623205672230166097380464805694754179252224 := by
      have step := pow_mod_double (k := 5868) (e := 97) (m := 10 ^ 390) h97
      have he : 2 * 97 = 194 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h389 : (5868 : ℕ) ^ 389 % 10 ^ 390 = 903201274026503053968835724937273418482059114451929440713625880204183884355300844788025550068693390788362019864636657531828639438902910569400477513189422765551033657445424605563147427738133021097672410558737964072341219242055207634737790062966241458666260673685131725417588574651823612415074426105961593308555854753816302992862683837100820494856925366294816759500253667006958486814896160768 := by
      have step := pow_mod_double_add_one (k := 5868) (e := 194) (m := 10 ^ 390) h194
      have he : 2 * 194 + 1 = 389 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h778 : (5868 : ℕ) ^ 778 % 10 ^ 390 = 512714796384290406063032156402340417964667257193586989563362969378786585198890668616110866553647811739454030032518360089467033109615119368886294793796633861247738194792695941766776273284464411193507425354201608589873802472674124929030047145089701201298885390420185251211956469589922579586331472143241306548136350055040628391945311147955686834759226346223751659580156228371507330426102349824 := by
      have step := pow_mod_double (k := 5868) (e := 389) (m := 10 ^ 390) h389
      have he : 2 * 389 = 778 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1557 : (5868 : ℕ) ^ 1557 % 10 ^ 390 = 871407013741096796803361884890135922133238151474334553511129060738497360927050273462407839548706216663703548631104288488760345504102913145814257226090198054135692000615425398039324499143472995124677749588917273669919885168571725643762116844230892853812046388677818826489844666331486645729251943802036388703954906660189073042491038259887046780971304521463869548677364769634720956286572167168 := by
      have step := pow_mod_double_add_one (k := 5868) (e := 778) (m := 10 ^ 390) h778
      have he : 2 * 778 + 1 = 1557 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1557
  rw [hmod]
  decide
private theorem cert_5868 : ExponentCertificate 5868 1557 1557 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 5868) (by decide) (by decide) (by decide) suffix_5868
private theorem cert_5869 : ExponentCertificate 5869 1558 1557 := by decide
private theorem cert_5870 : ExponentCertificate 5870 1558 1557 := by decide
private theorem cert_5871 : ExponentCertificate 5871 1558 1557 := by decide
private theorem cert_5872 : ExponentCertificate 5872 1558 1558 := by decide
private theorem cert_5873 : ExponentCertificate 5873 1559 1558 := by decide
private theorem cert_5874 : ExponentCertificate 5874 1559 1558 := by decide
private theorem cert_5875 : ExponentCertificate 5875 1559 1558 := by decide
private theorem cert_5876 : ExponentCertificate 5876 1559 1559 := by decide
private theorem cert_5877 : ExponentCertificate 5877 1559 1559 := by decide
private theorem cert_5878 : ExponentCertificate 5878 1560 1559 := by decide
private theorem cert_5879 : ExponentCertificate 5879 1560 1559 := by decide
private theorem cert_5880 : ExponentCertificate 5880 1560 1559 := by decide
private theorem cert_5881 : ExponentCertificate 5881 1560 1560 := by decide
private theorem cert_5882 : ExponentCertificate 5882 1561 1560 := by decide
private theorem cert_5883 : ExponentCertificate 5883 1561 1560 := by decide
private theorem cert_5884 : ExponentCertificate 5884 1561 1560 := by decide
private theorem cert_5885 : ExponentCertificate 5885 1561 1561 := by decide
private theorem cert_5886 : ExponentCertificate 5886 1562 1561 := by decide
private theorem cert_5887 : ExponentCertificate 5887 1562 1561 := by decide
private theorem cert_5888 : ExponentCertificate 5888 1562 1561 := by decide
private theorem cert_5889 : ExponentCertificate 5889 1562 1562 := by decide
private theorem cert_5890 : ExponentCertificate 5890 1563 1562 := by decide
private theorem cert_5891 : ExponentCertificate 5891 1563 1562 := by decide
private theorem cert_5892 : ExponentCertificate 5892 1563 1562 := by decide
private theorem cert_5893 : ExponentCertificate 5893 1563 1562 := by decide
private theorem cert_5894 : ExponentCertificate 5894 1563 1563 := by decide
private theorem cert_5895 : ExponentCertificate 5895 1564 1563 := by decide
private theorem cert_5896 : ExponentCertificate 5896 1564 1563 := by decide
private theorem cert_5897 : ExponentCertificate 5897 1564 1563 := by decide
private theorem cert_5898 : ExponentCertificate 5898 1564 1564 := by decide
private theorem cert_5899 : ExponentCertificate 5899 1565 1564 := by decide
private theorem cert_5900 : ExponentCertificate 5900 1565 1564 := by decide

private theorem certificates_5801_5900 {k : ℕ} (hlo : 5801 ≤ k) (hhi : k ≤ 5900) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1542, 1541, cert_5801⟩
  · exact ⟨1542, 1541, cert_5802⟩
  · exact ⟨1542, 1541, cert_5803⟩
  · exact ⟨1542, 1542, cert_5804⟩
  · exact ⟨1543, 1542, cert_5805⟩
  · exact ⟨1543, 1542, cert_5806⟩
  · exact ⟨1543, 1542, cert_5807⟩
  · exact ⟨1543, 1543, cert_5808⟩
  · exact ⟨1543, 1543, cert_5809⟩
  · exact ⟨1544, 1543, cert_5810⟩
  · exact ⟨1544, 1543, cert_5811⟩
  · exact ⟨1544, 1543, cert_5812⟩
  · exact ⟨1544, 1544, cert_5813⟩
  · exact ⟨1545, 1544, cert_5814⟩
  · exact ⟨1545, 1544, cert_5815⟩
  · exact ⟨1545, 1544, cert_5816⟩
  · exact ⟨1545, 1545, cert_5817⟩
  · exact ⟨1546, 1545, cert_5818⟩
  · exact ⟨1546, 1545, cert_5819⟩
  · exact ⟨1546, 1545, cert_5820⟩
  · exact ⟨1546, 1546, cert_5821⟩
  · exact ⟨1547, 1546, cert_5822⟩
  · exact ⟨1547, 1546, cert_5823⟩
  · exact ⟨1547, 1546, cert_5824⟩
  · exact ⟨1547, 1547, cert_5825⟩
  · exact ⟨1547, 1547, cert_5826⟩
  · exact ⟨1548, 1547, cert_5827⟩
  · exact ⟨1548, 1547, cert_5828⟩
  · exact ⟨1548, 1547, cert_5829⟩
  · exact ⟨1548, 1548, cert_5830⟩
  · exact ⟨1549, 1548, cert_5831⟩
  · exact ⟨1549, 1548, cert_5832⟩
  · exact ⟨1549, 1548, cert_5833⟩
  · exact ⟨1549, 1549, cert_5834⟩
  · exact ⟨1550, 1549, cert_5835⟩
  · exact ⟨1550, 1549, cert_5836⟩
  · exact ⟨1550, 1549, cert_5837⟩
  · exact ⟨1550, 1550, cert_5838⟩
  · exact ⟨1551, 1550, cert_5839⟩
  · exact ⟨1551, 1550, cert_5840⟩
  · exact ⟨1551, 1550, cert_5841⟩
  · exact ⟨1551, 1551, cert_5842⟩
  · exact ⟨1551, 1551, cert_5843⟩
  · exact ⟨1552, 1551, cert_5844⟩
  · exact ⟨1552, 1551, cert_5845⟩
  · exact ⟨1552, 1551, cert_5846⟩
  · exact ⟨1552, 1552, cert_5847⟩
  · exact ⟨1553, 1552, cert_5848⟩
  · exact ⟨1553, 1552, cert_5849⟩
  · exact ⟨1553, 1552, cert_5850⟩
  · exact ⟨1553, 1553, cert_5851⟩
  · exact ⟨1554, 1553, cert_5852⟩
  · exact ⟨1554, 1553, cert_5853⟩
  · exact ⟨1554, 1553, cert_5854⟩
  · exact ⟨1554, 1554, cert_5855⟩
  · exact ⟨1555, 1554, cert_5856⟩
  · exact ⟨1555, 1554, cert_5857⟩
  · exact ⟨1555, 1554, cert_5858⟩
  · exact ⟨1555, 1555, cert_5859⟩
  · exact ⟨1555, 1555, cert_5860⟩
  · exact ⟨1556, 1555, cert_5861⟩
  · exact ⟨1556, 1555, cert_5862⟩
  · exact ⟨1556, 1555, cert_5863⟩
  · exact ⟨1556, 1556, cert_5864⟩
  · exact ⟨1557, 1556, cert_5865⟩
  · exact ⟨1557, 1556, cert_5866⟩
  · exact ⟨1557, 1556, cert_5867⟩
  · exact ⟨1557, 1557, cert_5868⟩
  · exact ⟨1558, 1557, cert_5869⟩
  · exact ⟨1558, 1557, cert_5870⟩
  · exact ⟨1558, 1557, cert_5871⟩
  · exact ⟨1558, 1558, cert_5872⟩
  · exact ⟨1559, 1558, cert_5873⟩
  · exact ⟨1559, 1558, cert_5874⟩
  · exact ⟨1559, 1558, cert_5875⟩
  · exact ⟨1559, 1559, cert_5876⟩
  · exact ⟨1559, 1559, cert_5877⟩
  · exact ⟨1560, 1559, cert_5878⟩
  · exact ⟨1560, 1559, cert_5879⟩
  · exact ⟨1560, 1559, cert_5880⟩
  · exact ⟨1560, 1560, cert_5881⟩
  · exact ⟨1561, 1560, cert_5882⟩
  · exact ⟨1561, 1560, cert_5883⟩
  · exact ⟨1561, 1560, cert_5884⟩
  · exact ⟨1561, 1561, cert_5885⟩
  · exact ⟨1562, 1561, cert_5886⟩
  · exact ⟨1562, 1561, cert_5887⟩
  · exact ⟨1562, 1561, cert_5888⟩
  · exact ⟨1562, 1562, cert_5889⟩
  · exact ⟨1563, 1562, cert_5890⟩
  · exact ⟨1563, 1562, cert_5891⟩
  · exact ⟨1563, 1562, cert_5892⟩
  · exact ⟨1563, 1562, cert_5893⟩
  · exact ⟨1563, 1563, cert_5894⟩
  · exact ⟨1564, 1563, cert_5895⟩
  · exact ⟨1564, 1563, cert_5896⟩
  · exact ⟨1564, 1563, cert_5897⟩
  · exact ⟨1564, 1564, cert_5898⟩
  · exact ⟨1565, 1564, cert_5899⟩
  · exact ⟨1565, 1564, cert_5900⟩

theorem no_fixed_digitCount_5801_5900 {n : ℕ} (hn : a n = n)
    (hlo : 5801 ≤ digitCount n) (hhi : digitCount n ≤ 5900) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_5801_5900 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_5801_5900
end OeisA113010
