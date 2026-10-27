import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 5001
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_4901 : ExponentCertificate 4901 1328 1328 := by decide
private theorem cert_4902 : ExponentCertificate 4902 1329 1328 := by decide
private theorem cert_4903 : ExponentCertificate 4903 1329 1328 := by decide
private theorem cert_4904 : ExponentCertificate 4904 1329 1328 := by decide
private theorem cert_4905 : ExponentCertificate 4905 1329 1329 := by decide
private theorem cert_4906 : ExponentCertificate 4906 1330 1329 := by decide
private theorem cert_4907 : ExponentCertificate 4907 1330 1329 := by decide
private theorem cert_4908 : ExponentCertificate 4908 1330 1329 := by decide
private theorem cert_4909 : ExponentCertificate 4909 1330 1329 := by decide
private theorem cert_4910 : ExponentCertificate 4910 1330 1330 := by decide
private theorem cert_4911 : ExponentCertificate 4911 1331 1330 := by decide
private theorem cert_4912 : ExponentCertificate 4912 1331 1330 := by decide
private theorem cert_4913 : ExponentCertificate 4913 1331 1330 := by decide
private theorem cert_4914 : ExponentCertificate 4914 1331 1331 := by decide
private theorem cert_4915 : ExponentCertificate 4915 1332 1331 := by decide
private theorem cert_4916 : ExponentCertificate 4916 1332 1331 := by decide
private theorem cert_4917 : ExponentCertificate 4917 1332 1331 := by decide
private theorem cert_4918 : ExponentCertificate 4918 1332 1332 := by decide
private theorem cert_4919 : ExponentCertificate 4919 1333 1332 := by decide
private theorem cert_4920 : ExponentCertificate 4920 1333 1332 := by decide
private theorem cert_4921 : ExponentCertificate 4921 1333 1332 := by decide
private theorem cert_4922 : ExponentCertificate 4922 1333 1333 := by decide
private theorem cert_4923 : ExponentCertificate 4923 1334 1333 := by decide
private theorem cert_4924 : ExponentCertificate 4924 1334 1333 := by decide
private theorem cert_4925 : ExponentCertificate 4925 1334 1333 := by decide
private theorem cert_4926 : ExponentCertificate 4926 1334 1334 := by decide
private theorem cert_4927 : ExponentCertificate 4927 1335 1334 := by decide
private theorem cert_4928 : ExponentCertificate 4928 1335 1334 := by decide
private theorem cert_4929 : ExponentCertificate 4929 1335 1334 := by decide
private theorem cert_4930 : ExponentCertificate 4930 1335 1335 := by decide
private theorem cert_4931 : ExponentCertificate 4931 1335 1335 := by decide
private theorem cert_4932 : ExponentCertificate 4932 1336 1335 := by decide
private theorem cert_4933 : ExponentCertificate 4933 1336 1335 := by decide
private theorem cert_4934 : ExponentCertificate 4934 1336 1335 := by decide
private theorem cert_4935 : ExponentCertificate 4935 1336 1336 := by decide
private theorem cert_4936 : ExponentCertificate 4936 1337 1336 := by decide
private theorem cert_4937 : ExponentCertificate 4937 1337 1336 := by decide
private theorem cert_4938 : ExponentCertificate 4938 1337 1336 := by decide
private theorem cert_4939 : ExponentCertificate 4939 1337 1337 := by decide
private theorem cert_4940 : ExponentCertificate 4940 1338 1337 := by decide
private theorem cert_4941 : ExponentCertificate 4941 1338 1337 := by decide
private theorem cert_4942 : ExponentCertificate 4942 1338 1337 := by decide
private theorem cert_4943 : ExponentCertificate 4943 1338 1338 := by decide
private theorem cert_4944 : ExponentCertificate 4944 1339 1338 := by decide
private theorem cert_4945 : ExponentCertificate 4945 1339 1338 := by decide
private theorem cert_4946 : ExponentCertificate 4946 1339 1338 := by decide
private theorem cert_4947 : ExponentCertificate 4947 1339 1339 := by decide
private theorem cert_4948 : ExponentCertificate 4948 1340 1339 := by decide
private theorem cert_4949 : ExponentCertificate 4949 1340 1339 := by decide
private theorem cert_4950 : ExponentCertificate 4950 1340 1339 := by decide
private theorem cert_4951 : ExponentCertificate 4951 1340 1340 := by decide
private theorem cert_4952 : ExponentCertificate 4952 1340 1340 := by decide
private theorem cert_4953 : ExponentCertificate 4953 1341 1340 := by decide
private theorem cert_4954 : ExponentCertificate 4954 1341 1340 := by decide
private theorem cert_4955 : ExponentCertificate 4955 1341 1340 := by decide
private theorem suffix_4956 : 1341 < digitSum ((4956 : ℕ) ^ 1341 % 10 ^ 336) := by
  have hmod : (4956 : ℕ) ^ 1341 % 10 ^ 336 = 431576182264009129570551583772161876164084189737978209278948902368502734011267249200849686465732932000068395307092554257938749528614364956815987323683467327763843922969726232811064289375625536783616091821317378047477627303305934763479944032611621996781018908113600917208963038392525632121007495594184582310454371786407678424590535622656 := by
    have h1 : (4956 : ℕ) ^ 1 % 10 ^ 336 = 4956 := by decide
    have h2 : (4956 : ℕ) ^ 2 % 10 ^ 336 = 24561936 := by
      have step := pow_mod_double (k := 4956) (e := 1) (m := 10 ^ 336) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (4956 : ℕ) ^ 5 % 10 ^ 336 = 2989898797537483776 := by
      have step := pow_mod_double_add_one (k := 4956) (e := 2) (m := 10 ^ 336) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (4956 : ℕ) ^ 10 % 10 ^ 336 = 8939494819516091399827723753463218176 := by
      have step := pow_mod_double (k := 4956) (e := 5) (m := 10 ^ 336) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h20 : (4956 : ℕ) ^ 20 % 10 ^ 336 = 79914567628155035551047138306271483804343113627035374831407640134576766976 := by
      have step := pow_mod_double (k := 4956) (e := 10) (m := 10 ^ 336) h10
      have he : 2 * 10 = 20 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h41 : (4956 : ℕ) ^ 41 % 10 ^ 336 = 31650691718730245273453687657774957881213415213173353676682785448160649843106601782184508997196160175210143386469715462892576042836161071015666338758656 := by
      have step := pow_mod_double_add_one (k := 4956) (e := 20) (m := 10 ^ 336) h20
      have he : 2 * 20 + 1 = 41 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h83 : (4956 : ℕ) ^ 83 % 10 ^ 336 = 4964753714774436267495161983108788661022244698654165499838017413217209995313334586804432002411689294500901994637454460663237695914109040405763009696486559949949276356548290039871917787158851921519088163312190892165752189040476703002374835584560886011659991549764983269444190891914288742489705537437974921216 := by
      have step := pow_mod_double_add_one (k := 4956) (e := 41) (m := 10 ^ 336) h41
      have he : 2 * 41 + 1 = 83 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h167 : (4956 : ℕ) ^ 167 % 10 ^ 336 = 463585933008441736122588795739419589069455348300582963859596424878397544173890681617017014475434129484650210724618582410844717749109368578487009476944571000551403488594190416729907479724306684912368726211738315981336802317687865532923166301983471888332564355725772974485166432950975792028618815915526745063424806051688976487932688859136 := by
      have step := pow_mod_double_add_one (k := 4956) (e := 83) (m := 10 ^ 336) h83
      have he : 2 * 83 + 1 = 167 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h335 : (4956 : ℕ) ^ 335 % 10 ^ 336 = 132473135582099389902424285801128392428820177289209372521653206748591346478091939548675274799976583449729020656007097199414892617395423222444606688130320520358150553290043599541691280125272394148506686982658971125427530353233129451346474573530652698317396293859692063185368405417244228243023486762028952873522500912713851568070303154176 := by
      have step := pow_mod_double_add_one (k := 4956) (e := 167) (m := 10 ^ 336) h167
      have he : 2 * 167 + 1 = 335 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h670 : (4956 : ℕ) ^ 670 % 10 ^ 336 = 842645726074266706891694353952813632615413427401330587423562194141824255474776611002944346400275097189916736602468986625292271016646344040886965729655214724413214222052471086481218385544155035533765603414425746624013277354830232589220881447480349497865976697435382149295055168602096867805150656021025312879303874716709229423094426238976 := by
      have step := pow_mod_double (k := 4956) (e := 335) (m := 10 ^ 336) h335
      have he : 2 * 335 = 670 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1341 : (4956 : ℕ) ^ 1341 % 10 ^ 336 = 431576182264009129570551583772161876164084189737978209278948902368502734011267249200849686465732932000068395307092554257938749528614364956815987323683467327763843922969726232811064289375625536783616091821317378047477627303305934763479944032611621996781018908113600917208963038392525632121007495594184582310454371786407678424590535622656 := by
      have step := pow_mod_double_add_one (k := 4956) (e := 670) (m := 10 ^ 336) h670
      have he : 2 * 670 + 1 = 1341 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1341
  rw [hmod]
  decide
private theorem cert_4956 : ExponentCertificate 4956 1341 1341 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4956) (by decide) (by decide) (by decide) suffix_4956
private theorem cert_4957 : ExponentCertificate 4957 1342 1341 := by decide
private theorem cert_4958 : ExponentCertificate 4958 1342 1341 := by decide
private theorem cert_4959 : ExponentCertificate 4959 1342 1341 := by decide
private theorem suffix_4960 : 1342 < digitSum ((496 : ℕ) ^ 1342 % 10 ^ 336) := by
  have hmod : (496 : ℕ) ^ 1342 % 10 ^ 336 = 262168504989301582594759111824449548607831487586816295395532130591868513145640637747491083964285438477730303116555880505191340719816847751813011972089464060905836146339812064989627407427692113772865872526826410612631611558992850856327506768839646071524457086955688432854101006489218465656088667490654827609928827173968728120889039650816 := by
    have h1 : (496 : ℕ) ^ 1 % 10 ^ 336 = 496 := by decide
    have h2 : (496 : ℕ) ^ 2 % 10 ^ 336 = 246016 := by
      have step := pow_mod_double (k := 496) (e := 1) (m := 10 ^ 336) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (496 : ℕ) ^ 5 % 10 ^ 336 = 30019840638976 := by
      have step := pow_mod_double_add_one (k := 496) (e := 2) (m := 10 ^ 336) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (496 : ℕ) ^ 10 % 10 ^ 336 = 901190831989514975970328576 := by
      have step := pow_mod_double (k := 496) (e := 5) (m := 10 ^ 336) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h20 : (496 : ℕ) ^ 20 % 10 ^ 336 = 812144915661954208942430769166533251186388745402187776 := by
      have step := pow_mod_double (k := 496) (e := 10) (m := 10 ^ 336) h10
      have he : 2 * 10 = 20 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h41 : (496 : ℕ) ^ 41 % 10 ^ 336 = 327151364561639106614738089372146906660218596102100961429983835784908513279031056983592238896627754593257783296 := by
      have step := pow_mod_double_add_one (k := 496) (e := 20) (m := 10 ^ 336) h20
      have he : 2 * 20 + 1 = 41 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h83 : (496 : ℕ) ^ 83 % 10 ^ 336 = 53085895605933077978772453628509514584340600692954974716310879366852837384152391312525066674568588451614909109155723492173124700101130716334813287974156576401736246713125523770026070197349244405265936459087137404713525313536 := by
      have step := pow_mod_double_add_one (k := 496) (e := 41) (m := 10 ^ 336) h41
      have he : 2 * 41 + 1 = 83 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h167 : (496 : ℕ) ^ 167 % 10 ^ 336 = 189559799637381232088462829128118207624247585368519574874057976772131299764130212213551534608947512904592515492735003895305691847339650417443529210576102326233980775501072498988038758693266748914055074180591836341864446071786494581789400200584255788958821912735799948298861219256519763438447661839420530583097102065308775744963992354816 := by
      have step := pow_mod_double_add_one (k := 496) (e := 83) (m := 10 ^ 336) h83
      have he : 2 * 83 + 1 = 167 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h335 : (496 : ℕ) ^ 335 % 10 ^ 336 = 310121822377805233118332747957912642725315830257736324585514191435700777212027000432781261816499617014995475806092167284749481127458563016728364093495096513604848731662713952257872984836601136564568056282716453144735193475387073934965384173221355673611267450378287369977267910297178189761336923040347752969475912676909070441631843352576 := by
      have step := pow_mod_double_add_one (k := 496) (e := 167) (m := 10 ^ 336) h167
      have he : 2 * 167 + 1 = 335 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h671 : (496 : ℕ) ^ 671 % 10 ^ 336 = 239051293600563214326384556838589704793948614201521310019925412941388825713565522678088956525718783592524087990859384460835536280294170420076083061996081652695140963309399412197605145503894590701333403369625379022104623507540041946602513941884241071549805639111645865109405132262322021741587869503231135168105170837450576333805134544896 := by
      have step := pow_mod_double_add_one (k := 496) (e := 335) (m := 10 ^ 336) h335
      have he : 2 * 335 + 1 = 671 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1342 : (496 : ℕ) ^ 1342 % 10 ^ 336 = 262168504989301582594759111824449548607831487586816295395532130591868513145640637747491083964285438477730303116555880505191340719816847751813011972089464060905836146339812064989627407427692113772865872526826410612631611558992850856327506768839646071524457086955688432854101006489218465656088667490654827609928827173968728120889039650816 := by
      have step := pow_mod_double (k := 496) (e := 671) (m := 10 ^ 336) h671
      have he : 2 * 671 = 1342 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1342
  rw [hmod]
  decide
private theorem cert_4960 : ExponentCertificate 4960 1342 1342 :=
  exponentCertificate_of_normalized_suffix (t := 1) (u := 496) (by decide) (by decide) (by decide) suffix_4960
private theorem cert_4961 : ExponentCertificate 4961 1343 1342 := by decide
private theorem cert_4962 : ExponentCertificate 4962 1343 1342 := by decide
private theorem cert_4963 : ExponentCertificate 4963 1343 1342 := by decide
private theorem suffix_4964 : 1343 < digitSum ((4964 : ℕ) ^ 1343 % 10 ^ 336) := by
  have hmod : (4964 : ℕ) ^ 1343 % 10 ^ 336 = 713994470528528014690875128000127279952274273655039897078295784714330066135690522905331148219592980819286816743173901087415031387615831310820482181461792889776756783698738498494014252135301048245787815609288300890377706127041996716264252324345591468817936382953405089253328846219751032494562100309712400226986789003285414797675482578944 := by
    have h1 : (4964 : ℕ) ^ 1 % 10 ^ 336 = 4964 := by decide
    have h2 : (4964 : ℕ) ^ 2 % 10 ^ 336 = 24641296 := by
      have step := pow_mod_double (k := 4964) (e := 1) (m := 10 ^ 336) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (4964 : ℕ) ^ 5 % 10 ^ 336 = 3014108377929933824 := by
      have step := pow_mod_double_add_one (k := 4964) (e := 2) (m := 10 ^ 336) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (4964 : ℕ) ^ 10 % 10 ^ 336 = 9084849313907416787812864213019262976 := by
      have step := pow_mod_double (k := 4964) (e := 5) (m := 10 ^ 336) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h20 : (4964 : ℕ) ^ 20 % 10 ^ 336 = 82534487056404061532556137663225290441111065562387381960652926838244376576 := by
      have step := pow_mod_double (k := 4964) (e := 10) (m := 10 ^ 336) h10
      have he : 2 * 10 = 20 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h41 : (4964 : ℕ) ^ 41 % 10 ^ 336 = 33814477872386753584454077207840445815470831350742713604201021289229804941827081430058970694751066295163274326170613680146601882567078392356159109464064 := by
      have step := pow_mod_double_add_one (k := 4964) (e := 20) (m := 10 ^ 336) h20
      have he : 2 * 20 + 1 = 41 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h83 : (4964 : ℕ) ^ 83 % 10 ^ 336 = 5675931488014510145135621662762361792126651093992750892411194924314795875929123463122314383016928199822060632866742430421626289779343229566827208724717946547365018083228155968892856544215636211637465328200259436454967110784344545393086856411134923772873828578958111108930258442611269683736813248137914220544 := by
      have step := pow_mod_double_add_one (k := 4964) (e := 41) (m := 10 ^ 336) h41
      have he : 2 * 41 + 1 = 83 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h167 : (4964 : ℕ) ^ 167 % 10 ^ 336 = 700421521752187723947148722077122284164553083871821377630563239759424099402336528488716929474764314961904599869081066766024356138366928206836347118624059925368165328473729502611981022301752227069920481829103435626510324245484070778101325352399262388087504366104468522454492839558332525574522448700053035091021866324864683414031700066304 := by
      have step := pow_mod_double_add_one (k := 4964) (e := 83) (m := 10 ^ 336) h83
      have he : 2 * 83 + 1 = 167 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h335 : (4964 : ℕ) ^ 335 % 10 ^ 336 = 250360783499289309406613755593728997295028951762688114057107815482018280481071905024318122518593014640130520528049291795907125183702294202064249106832507326320612789496004089326896713776481666902831584134703358463087363910702742246524556982117466929080240220724311799437881062358724829315508621226079621682086966951739493425573238145024 := by
      have step := pow_mod_double_add_one (k := 4964) (e := 167) (m := 10 ^ 336) h167
      have he : 2 * 167 + 1 = 335 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h671 : (4964 : ℕ) ^ 671 % 10 ^ 336 = 432522512967728470534720525214795417373296600313329632454813529735188635881926830601767891116451564706317130010100265715573870637157886418613238619262547376599223579980073696917607258433308435847056976731855921576055585677264933797927344276763759354394764720410970370141430523834050239659890886644109103055430661576853961602247388299264 := by
      have step := pow_mod_double_add_one (k := 4964) (e := 335) (m := 10 ^ 336) h335
      have he : 2 * 335 + 1 = 671 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1343 : (4964 : ℕ) ^ 1343 % 10 ^ 336 = 713994470528528014690875128000127279952274273655039897078295784714330066135690522905331148219592980819286816743173901087415031387615831310820482181461792889776756783698738498494014252135301048245787815609288300890377706127041996716264252324345591468817936382953405089253328846219751032494562100309712400226986789003285414797675482578944 := by
      have step := pow_mod_double_add_one (k := 4964) (e := 671) (m := 10 ^ 336) h671
      have he : 2 * 671 + 1 = 1343 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1343
  rw [hmod]
  decide
private theorem cert_4964 : ExponentCertificate 4964 1343 1343 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4964) (by decide) (by decide) (by decide) suffix_4964
private theorem cert_4965 : ExponentCertificate 4965 1344 1343 := by decide
private theorem cert_4966 : ExponentCertificate 4966 1344 1343 := by decide
private theorem cert_4967 : ExponentCertificate 4967 1344 1343 := by decide
private theorem cert_4968 : ExponentCertificate 4968 1344 1344 := by decide
private theorem cert_4969 : ExponentCertificate 4969 1345 1344 := by decide
private theorem cert_4970 : ExponentCertificate 4970 1345 1344 := by decide
private theorem cert_4971 : ExponentCertificate 4971 1345 1344 := by decide
private theorem suffix_4972 : 1345 < digitSum ((4972 : ℕ) ^ 1345 % 10 ^ 337) := by
  have hmod : (4972 : ℕ) ^ 1345 % 10 ^ 337 = 7347480318487306485031411980704403117914392040272214939000825444291102386155447719420769623190513637297059837576936857383308660813392865964965710067901730671667769049779612139021510424106979084989913286680611173376434919130973228720420937882000218719017720703949234533347336975203811872859524189973572196158346504997578077522312908767232 := by
    have h1 : (4972 : ℕ) ^ 1 % 10 ^ 337 = 4972 := by decide
    have h2 : (4972 : ℕ) ^ 2 % 10 ^ 337 = 24720784 := by
      have step := pow_mod_double (k := 4972) (e := 1) (m := 10 ^ 337) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h5 : (4972 : ℕ) ^ 5 % 10 ^ 337 = 3038474527349189632 := by
      have step := pow_mod_double_add_one (k := 4972) (e := 2) (m := 10 ^ 337) h2
      have he : 2 * 2 + 1 = 5 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h10 : (4972 : ℕ) ^ 10 % 10 ^ 337 = 9232327453349881332970941527096295424 := by
      have step := pow_mod_double (k := 4972) (e := 5) (m := 10 ^ 337) h5
      have he : 2 * 5 = 10 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h21 : (4972 : ℕ) ^ 21 % 10 ^ 337 = 423792746663624945054557160159311150998081920652369537185185615227685565366272 := by
      have step := pow_mod_double_add_one (k := 4972) (e := 10) (m := 10 ^ 337) h10
      have he : 2 * 10 + 1 = 21 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h42 : (4972 : ℕ) ^ 42 % 10 ^ 337 = 179600292124699391997937865134416550122930147135069942472717114171079995964317050113149124871785440581714496704292997810892608061920277830718919661515177984 := by
      have step := pow_mod_double (k := 4972) (e := 21) (m := 10 ^ 337) h21
      have he : 2 * 21 = 42 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h84 : (4972 : ℕ) ^ 84 % 10 ^ 337 = 32256264931277358445654146316651033375505517192460734302366230713717649552603685935975803337579527344657680866727819441333795593645390379360027582229526050535680882534563539491026190041401692497586974651934181047250634808275877701332422717162286447518980953828019850016829317340148542071687524489295203198304256 := by
      have step := pow_mod_double (k := 4972) (e := 42) (m := 10 ^ 337) h42
      have he : 2 * 42 = 84 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h168 : (4972 : ℕ) ^ 168 % 10 ^ 337 = 4660030341224588434768089073150385574477863732793791768441727707408668094727556388360284529484629998480314142955718433091936687312865017550485379452097307152696415839366087254130092419625098041131242317932857194902697465026370309226277838140149168190589696312059508918726689864276558651755769491743462585725926095474139429892513947713536 := by
      have step := pow_mod_double (k := 4972) (e := 84) (m := 10 ^ 337) h84
      have he : 2 * 84 = 168 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h336 : (4972 : ℕ) ^ 336 % 10 ^ 337 = 1051006948977162715446165765768941277466693685275475706081031046571979949707341238565644551003203286136955382980655889302783500687707082569380450651080180908621893435057660848653958146067658834231100272750709167576551391745444082405512127269116291373256582444283160662167987968701634550211371278666673360883127284776085088472882317623296 := by
      have step := pow_mod_double (k := 4972) (e := 168) (m := 10 ^ 337) h168
      have he : 2 * 168 = 336 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h672 : (4972 : ℕ) ^ 672 % 10 ^ 337 = 9057115591878629164001416862785181304184799165196220889471337344387578731429962861944254048091765811056959156205724478742502985584842104110927235554906194086676484453126985754864019777885328061586461226031082270769612860273924022646179618576894327184423393258610620788680515337912865083932607816519367655037612384940340875802702161903616 := by
      have step := pow_mod_double (k := 4972) (e := 336) (m := 10 ^ 337) h336
      have he : 2 * 336 = 672 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1345 : (4972 : ℕ) ^ 1345 % 10 ^ 337 = 7347480318487306485031411980704403117914392040272214939000825444291102386155447719420769623190513637297059837576936857383308660813392865964965710067901730671667769049779612139021510424106979084989913286680611173376434919130973228720420937882000218719017720703949234533347336975203811872859524189973572196158346504997578077522312908767232 := by
      have step := pow_mod_double_add_one (k := 4972) (e := 672) (m := 10 ^ 337) h672
      have he : 2 * 672 + 1 = 1345 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1345
  rw [hmod]
  decide
private theorem cert_4972 : ExponentCertificate 4972 1345 1345 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4972) (by decide) (by decide) (by decide) suffix_4972
private theorem cert_4973 : ExponentCertificate 4973 1346 1345 := by decide
private theorem cert_4974 : ExponentCertificate 4974 1346 1345 := by decide
private theorem cert_4975 : ExponentCertificate 4975 1346 1345 := by decide
private theorem cert_4976 : ExponentCertificate 4976 1346 1345 := by decide
private theorem cert_4977 : ExponentCertificate 4977 1346 1346 := by decide
private theorem cert_4978 : ExponentCertificate 4978 1347 1346 := by decide
private theorem cert_4979 : ExponentCertificate 4979 1347 1346 := by decide
private theorem cert_4980 : ExponentCertificate 4980 1347 1346 := by decide
private theorem cert_4981 : ExponentCertificate 4981 1347 1347 := by decide
private theorem cert_4982 : ExponentCertificate 4982 1348 1347 := by decide
private theorem cert_4983 : ExponentCertificate 4983 1348 1347 := by decide
private theorem cert_4984 : ExponentCertificate 4984 1348 1347 := by decide
private theorem cert_4985 : ExponentCertificate 4985 1348 1348 := by decide
private theorem cert_4986 : ExponentCertificate 4986 1349 1348 := by decide
private theorem cert_4987 : ExponentCertificate 4987 1349 1348 := by decide
private theorem cert_4988 : ExponentCertificate 4988 1349 1348 := by decide
private theorem cert_4989 : ExponentCertificate 4989 1349 1349 := by decide
private theorem cert_4990 : ExponentCertificate 4990 1350 1349 := by decide
private theorem cert_4991 : ExponentCertificate 4991 1350 1349 := by decide
private theorem cert_4992 : ExponentCertificate 4992 1350 1349 := by decide
private theorem cert_4993 : ExponentCertificate 4993 1350 1350 := by decide
private theorem cert_4994 : ExponentCertificate 4994 1351 1350 := by decide
private theorem cert_4995 : ExponentCertificate 4995 1351 1350 := by decide
private theorem cert_4996 : ExponentCertificate 4996 1351 1350 := by decide
private theorem cert_4997 : ExponentCertificate 4997 1351 1351 := by decide
private theorem cert_4998 : ExponentCertificate 4998 1351 1351 := by decide
private theorem cert_4999 : ExponentCertificate 4999 1352 1351 := by decide
private theorem cert_5000 : ExponentCertificate 5000 1352 1351 := by decide

private theorem certificates_4901_5000 {k : ℕ} (hlo : 4901 ≤ k) (hhi : k ≤ 5000) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1328, 1328, cert_4901⟩
  · exact ⟨1329, 1328, cert_4902⟩
  · exact ⟨1329, 1328, cert_4903⟩
  · exact ⟨1329, 1328, cert_4904⟩
  · exact ⟨1329, 1329, cert_4905⟩
  · exact ⟨1330, 1329, cert_4906⟩
  · exact ⟨1330, 1329, cert_4907⟩
  · exact ⟨1330, 1329, cert_4908⟩
  · exact ⟨1330, 1329, cert_4909⟩
  · exact ⟨1330, 1330, cert_4910⟩
  · exact ⟨1331, 1330, cert_4911⟩
  · exact ⟨1331, 1330, cert_4912⟩
  · exact ⟨1331, 1330, cert_4913⟩
  · exact ⟨1331, 1331, cert_4914⟩
  · exact ⟨1332, 1331, cert_4915⟩
  · exact ⟨1332, 1331, cert_4916⟩
  · exact ⟨1332, 1331, cert_4917⟩
  · exact ⟨1332, 1332, cert_4918⟩
  · exact ⟨1333, 1332, cert_4919⟩
  · exact ⟨1333, 1332, cert_4920⟩
  · exact ⟨1333, 1332, cert_4921⟩
  · exact ⟨1333, 1333, cert_4922⟩
  · exact ⟨1334, 1333, cert_4923⟩
  · exact ⟨1334, 1333, cert_4924⟩
  · exact ⟨1334, 1333, cert_4925⟩
  · exact ⟨1334, 1334, cert_4926⟩
  · exact ⟨1335, 1334, cert_4927⟩
  · exact ⟨1335, 1334, cert_4928⟩
  · exact ⟨1335, 1334, cert_4929⟩
  · exact ⟨1335, 1335, cert_4930⟩
  · exact ⟨1335, 1335, cert_4931⟩
  · exact ⟨1336, 1335, cert_4932⟩
  · exact ⟨1336, 1335, cert_4933⟩
  · exact ⟨1336, 1335, cert_4934⟩
  · exact ⟨1336, 1336, cert_4935⟩
  · exact ⟨1337, 1336, cert_4936⟩
  · exact ⟨1337, 1336, cert_4937⟩
  · exact ⟨1337, 1336, cert_4938⟩
  · exact ⟨1337, 1337, cert_4939⟩
  · exact ⟨1338, 1337, cert_4940⟩
  · exact ⟨1338, 1337, cert_4941⟩
  · exact ⟨1338, 1337, cert_4942⟩
  · exact ⟨1338, 1338, cert_4943⟩
  · exact ⟨1339, 1338, cert_4944⟩
  · exact ⟨1339, 1338, cert_4945⟩
  · exact ⟨1339, 1338, cert_4946⟩
  · exact ⟨1339, 1339, cert_4947⟩
  · exact ⟨1340, 1339, cert_4948⟩
  · exact ⟨1340, 1339, cert_4949⟩
  · exact ⟨1340, 1339, cert_4950⟩
  · exact ⟨1340, 1340, cert_4951⟩
  · exact ⟨1340, 1340, cert_4952⟩
  · exact ⟨1341, 1340, cert_4953⟩
  · exact ⟨1341, 1340, cert_4954⟩
  · exact ⟨1341, 1340, cert_4955⟩
  · exact ⟨1341, 1341, cert_4956⟩
  · exact ⟨1342, 1341, cert_4957⟩
  · exact ⟨1342, 1341, cert_4958⟩
  · exact ⟨1342, 1341, cert_4959⟩
  · exact ⟨1342, 1342, cert_4960⟩
  · exact ⟨1343, 1342, cert_4961⟩
  · exact ⟨1343, 1342, cert_4962⟩
  · exact ⟨1343, 1342, cert_4963⟩
  · exact ⟨1343, 1343, cert_4964⟩
  · exact ⟨1344, 1343, cert_4965⟩
  · exact ⟨1344, 1343, cert_4966⟩
  · exact ⟨1344, 1343, cert_4967⟩
  · exact ⟨1344, 1344, cert_4968⟩
  · exact ⟨1345, 1344, cert_4969⟩
  · exact ⟨1345, 1344, cert_4970⟩
  · exact ⟨1345, 1344, cert_4971⟩
  · exact ⟨1345, 1345, cert_4972⟩
  · exact ⟨1346, 1345, cert_4973⟩
  · exact ⟨1346, 1345, cert_4974⟩
  · exact ⟨1346, 1345, cert_4975⟩
  · exact ⟨1346, 1345, cert_4976⟩
  · exact ⟨1346, 1346, cert_4977⟩
  · exact ⟨1347, 1346, cert_4978⟩
  · exact ⟨1347, 1346, cert_4979⟩
  · exact ⟨1347, 1346, cert_4980⟩
  · exact ⟨1347, 1347, cert_4981⟩
  · exact ⟨1348, 1347, cert_4982⟩
  · exact ⟨1348, 1347, cert_4983⟩
  · exact ⟨1348, 1347, cert_4984⟩
  · exact ⟨1348, 1348, cert_4985⟩
  · exact ⟨1349, 1348, cert_4986⟩
  · exact ⟨1349, 1348, cert_4987⟩
  · exact ⟨1349, 1348, cert_4988⟩
  · exact ⟨1349, 1349, cert_4989⟩
  · exact ⟨1350, 1349, cert_4990⟩
  · exact ⟨1350, 1349, cert_4991⟩
  · exact ⟨1350, 1349, cert_4992⟩
  · exact ⟨1350, 1350, cert_4993⟩
  · exact ⟨1351, 1350, cert_4994⟩
  · exact ⟨1351, 1350, cert_4995⟩
  · exact ⟨1351, 1350, cert_4996⟩
  · exact ⟨1351, 1351, cert_4997⟩
  · exact ⟨1351, 1351, cert_4998⟩
  · exact ⟨1352, 1351, cert_4999⟩
  · exact ⟨1352, 1351, cert_5000⟩

theorem no_fixed_digitCount_4901_5000 {n : ℕ} (hn : a n = n)
    (hlo : 4901 ≤ digitCount n) (hhi : digitCount n ≤ 5000) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_4901_5000 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_4901_5000
end OeisA113010
