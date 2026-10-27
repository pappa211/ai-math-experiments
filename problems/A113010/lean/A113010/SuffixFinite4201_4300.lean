import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 4301
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_4201 : ExponentCertificate 4201 1160 1159 := by decide
private theorem cert_4202 : ExponentCertificate 4202 1160 1159 := by decide
private theorem cert_4203 : ExponentCertificate 4203 1160 1159 := by decide
private theorem cert_4204 : ExponentCertificate 4204 1160 1160 := by decide
private theorem cert_4205 : ExponentCertificate 4205 1161 1160 := by decide
private theorem cert_4206 : ExponentCertificate 4206 1161 1160 := by decide
private theorem cert_4207 : ExponentCertificate 4207 1161 1160 := by decide
private theorem cert_4208 : ExponentCertificate 4208 1161 1161 := by decide
private theorem cert_4209 : ExponentCertificate 4209 1162 1161 := by decide
private theorem cert_4210 : ExponentCertificate 4210 1162 1161 := by decide
private theorem cert_4211 : ExponentCertificate 4211 1162 1161 := by decide
private theorem cert_4212 : ExponentCertificate 4212 1162 1162 := by decide
private theorem cert_4213 : ExponentCertificate 4213 1163 1162 := by decide
private theorem cert_4214 : ExponentCertificate 4214 1163 1162 := by decide
private theorem cert_4215 : ExponentCertificate 4215 1163 1162 := by decide
private theorem cert_4216 : ExponentCertificate 4216 1163 1163 := by decide
private theorem cert_4217 : ExponentCertificate 4217 1164 1163 := by decide
private theorem cert_4218 : ExponentCertificate 4218 1164 1163 := by decide
private theorem cert_4219 : ExponentCertificate 4219 1164 1163 := by decide
private theorem cert_4220 : ExponentCertificate 4220 1164 1164 := by decide
private theorem cert_4221 : ExponentCertificate 4221 1165 1164 := by decide
private theorem cert_4222 : ExponentCertificate 4222 1165 1164 := by decide
private theorem cert_4223 : ExponentCertificate 4223 1165 1164 := by decide
private theorem cert_4224 : ExponentCertificate 4224 1165 1165 := by decide
private theorem suffix_4225 : 1165 < digitSum ((4225 : ℕ) ^ 1165 % 10 ^ 292) := by
  have hmod : (4225 : ℕ) ^ 1165 % 10 ^ 292 = 4243690508114965722588342580521187317810088798926939652027970781669758722300151297076238335425697291071298387872217420422396111957517819764946256061643050481250816811777147336118568293488073872055114990506730397170299381323504819414690960581281118355924386609245857471250928938388824462890625 := by
    have h1 : (4225 : ℕ) ^ 1 % 10 ^ 292 = 4225 := by decide
    have h2 : (4225 : ℕ) ^ 2 % 10 ^ 292 = 17850625 := by
      have step := pow_mod_double (k := 4225) (e := 1) (m := 10 ^ 292) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4225 : ℕ) ^ 4 % 10 ^ 292 = 318644812890625 := by
      have step := pow_mod_double (k := 4225) (e := 2) (m := 10 ^ 292) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (4225 : ℕ) ^ 9 % 10 ^ 292 = 428983333404378483310699462890625 := by
      have step := pow_mod_double_add_one (k := 4225) (e := 4) (m := 10 ^ 292) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (4225 : ℕ) ^ 18 % 10 ^ 292 = 184026700338732148291739418068921897948035621084272861480712890625 := by
      have step := pow_mod_double (k := 4225) (e := 9) (m := 10 ^ 292) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h36 : (4225 : ℕ) ^ 36 % 10 ^ 292 = 33865826437561518982818353020625082436851274788721302610865925286844074904720322674451225310188196004901328706182539463043212890625 := by
      have step := pow_mod_double (k := 4225) (e := 18) (m := 10 ^ 292) h18
      have he : 2 * 18 = 36 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h72 : (4225 : ℕ) ^ 72 % 10 ^ 292 = 1146894200299040723795729560557432803945230313807638769578093982012136321215160297940927699948343520671556845736219442653802354370285339236026666053285729313583210976982346005885535676256381806750392833850835102059290680244496574147206047200597822666168212890625 := by
      have step := pow_mod_double (k := 4225) (e := 36) (m := 10 ^ 292) h36
      have he : 2 * 36 = 72 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h145 : (4225 : ℕ) ^ 145 % 10 ^ 292 = 2100441635265334466895443119969692420080707778108484379362278120480522825288784171004703286482038679709354780629076828425975661181456056277068473976109614336353787840275781959303165155966349500517268495219787976188457609282729196297149875762028323742704183363372294479631818830966949462890625 := by
      have step := pow_mod_double_add_one (k := 4225) (e := 72) (m := 10 ^ 292) h72
      have he : 2 * 72 + 1 = 145 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h291 : (4225 : ℕ) ^ 291 % 10 ^ 292 = 8018675035657025547479702581050760526492159960687330140179345602451519171522650013647074370081780027363315834652664434023946224053345508243121562051619711871547950221200478840626655385546446047582231249376682961839665404643010998044426188741904751853574462305829229080700315535068511962890625 := by
      have step := pow_mod_double_add_one (k := 4225) (e := 145) (m := 10 ^ 292) h145
      have he : 2 * 145 + 1 = 291 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h582 : (4225 : ℕ) ^ 582 % 10 ^ 292 = 2920580082006945267522073052506370072063340251095394477142614885616847291437483104727204519504986611317155990082996700289596233412794355139761435388285092918976155610815521696814367543759019044938946662097106766627345364554606198323160946792254600277473353120427645990275777876377105712890625 := by
      have step := pow_mod_double (k := 4225) (e := 291) (m := 10 ^ 292) h291
      have he : 2 * 291 = 582 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1165 : (4225 : ℕ) ^ 1165 % 10 ^ 292 = 4243690508114965722588342580521187317810088798926939652027970781669758722300151297076238335425697291071298387872217420422396111957517819764946256061643050481250816811777147336118568293488073872055114990506730397170299381323504819414690960581281118355924386609245857471250928938388824462890625 := by
      have step := pow_mod_double_add_one (k := 4225) (e := 582) (m := 10 ^ 292) h582
      have he : 2 * 582 + 1 = 1165 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1165
  rw [hmod]
  decide
private theorem cert_4225 : ExponentCertificate 4225 1165 1165 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4225) (by decide) (by decide) (by decide) suffix_4225
private theorem cert_4226 : ExponentCertificate 4226 1166 1165 := by decide
private theorem cert_4227 : ExponentCertificate 4227 1166 1165 := by decide
private theorem cert_4228 : ExponentCertificate 4228 1166 1165 := by decide
private theorem cert_4229 : ExponentCertificate 4229 1166 1166 := by decide
private theorem cert_4230 : ExponentCertificate 4230 1167 1166 := by decide
private theorem cert_4231 : ExponentCertificate 4231 1167 1166 := by decide
private theorem cert_4232 : ExponentCertificate 4232 1167 1166 := by decide
private theorem cert_4233 : ExponentCertificate 4233 1167 1167 := by decide
private theorem cert_4234 : ExponentCertificate 4234 1168 1167 := by decide
private theorem cert_4235 : ExponentCertificate 4235 1168 1167 := by decide
private theorem cert_4236 : ExponentCertificate 4236 1168 1167 := by decide
private theorem suffix_4237 : 1168 < digitSum ((4237 : ℕ) ^ 1168 % 10 ^ 292) := by
  have hmod : (4237 : ℕ) ^ 1168 % 10 ^ 292 = 9422955714751165687246139530063175790519472458220080751915322161900338612319574953734720858552270692119474237179990605349143562903082813697575957116177639998557950449076157311022578651297543669008524088141632181721208939924212818660480570138669409160875361867069974869718558193846577061101121 := by
    have h1 : (4237 : ℕ) ^ 1 % 10 ^ 292 = 4237 := by decide
    have h2 : (4237 : ℕ) ^ 2 % 10 ^ 292 = 17952169 := by
      have step := pow_mod_double (k := 4237) (e := 1) (m := 10 ^ 292) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4237 : ℕ) ^ 4 % 10 ^ 292 = 322280371804561 := by
      have step := pow_mod_double (k := 4237) (e := 2) (m := 10 ^ 292) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (4237 : ℕ) ^ 9 % 10 ^ 292 = 440074471419909507365926166328877 := by
      have step := pow_mod_double_add_one (k := 4237) (e := 4) (m := 10 ^ 292) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (4237 : ℕ) ^ 18 % 10 ^ 292 = 193665540395512749820185116520771916935153441071426955499324081129 := by
      have step := pow_mod_double (k := 4237) (e := 9) (m := 10 ^ 292) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h36 : (4237 : ℕ) ^ 36 % 10 ^ 292 = 37506341536685980698052442252240770940898530596148750717810065212429178217971721333354836232772931583797452373759402385320173914641 := by
      have step := pow_mod_double (k := 4237) (e := 18) (m := 10 ^ 292) h18
      have he : 2 * 18 = 36 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h73 : (4237 : ℕ) ^ 73 % 10 ^ 292 = 5960296602211713421774289087517658979069811532671818573985419115774260834936440681363520615404135312585086081315765074826198961086835861046344644686610400936040790544306645752384945199003645983948173208462438142576722313730931029200623744477075781391379954571178797 := by
      have step := pow_mod_double_add_one (k := 4237) (e := 36) (m := 10 ^ 292) h36
      have he : 2 * 36 + 1 = 73 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h146 : (4237 : ℕ) ^ 146 % 10 ^ 292 = 4387336119687779325135333744602556214325606585106376241922720491721643061219637723278032413133355192715687319004913211716386248135367986649790510934631694545219405531776330465708779679735039562942526095291740731755961793867834245047964464830694518483819591637869494178968892917515894142367209 := by
      have step := pow_mod_double (k := 4237) (e := 73) (m := 10 ^ 292) h73
      have he : 2 * 73 = 146 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h292 : (4237 : ℕ) ^ 292 % 10 ^ 292 = 7079592183569119708522552691864145127268026423770094487390228734935561268176582463831047901372492605553370464679332870348485986818451325128380535829290421251286763278420740642272730255231228742383322200222746073020537442273770847375871759764541280559602979909977407307592446104108114198449681 := by
      have step := pow_mod_double (k := 4237) (e := 146) (m := 10 ^ 292) h146
      have he : 2 * 146 = 292 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h584 : (4237 : ℕ) ^ 584 % 10 ^ 292 = 6124042770134106142809314178464832806662560873772022175308197758688745309166211499253704218020319998308542412704416210430339005833342990987083102030785613456855655011654496698209672739352734435453173754864773329010986965186028675242015236073532857850638301273049767015376892065005543889001761 := by
      have step := pow_mod_double (k := 4237) (e := 292) (m := 10 ^ 292) h292
      have he : 2 * 292 = 584 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1168 : (4237 : ℕ) ^ 1168 % 10 ^ 292 = 9422955714751165687246139530063175790519472458220080751915322161900338612319574953734720858552270692119474237179990605349143562903082813697575957116177639998557950449076157311022578651297543669008524088141632181721208939924212818660480570138669409160875361867069974869718558193846577061101121 := by
      have step := pow_mod_double (k := 4237) (e := 584) (m := 10 ^ 292) h584
      have he : 2 * 584 = 1168 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1168
  rw [hmod]
  decide
private theorem cert_4237 : ExponentCertificate 4237 1168 1168 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4237) (by decide) (by decide) (by decide) suffix_4237
private theorem cert_4238 : ExponentCertificate 4238 1169 1168 := by decide
private theorem cert_4239 : ExponentCertificate 4239 1169 1168 := by decide
private theorem cert_4240 : ExponentCertificate 4240 1169 1168 := by decide
private theorem cert_4241 : ExponentCertificate 4241 1169 1169 := by decide
private theorem cert_4242 : ExponentCertificate 4242 1170 1169 := by decide
private theorem cert_4243 : ExponentCertificate 4243 1170 1169 := by decide
private theorem cert_4244 : ExponentCertificate 4244 1170 1169 := by decide
private theorem suffix_4245 : 1170 < digitSum ((4245 : ℕ) ^ 1170 % 10 ^ 293) := by
  have hmod : (4245 : ℕ) ^ 1170 % 10 ^ 293 = 59375090913762986485932546760938759929027817390025696956858681808941304722445521678103007253914381042868765511620551895084161109265422399767921398167737829693206901375147642433275459415146196594341110112134014989526677862210748767057222479055650986670168711700767971706227399408817291259765625 := by
    have h1 : (4245 : ℕ) ^ 1 % 10 ^ 293 = 4245 := by decide
    have h2 : (4245 : ℕ) ^ 2 % 10 ^ 293 = 18020025 := by
      have step := pow_mod_double (k := 4245) (e := 1) (m := 10 ^ 293) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4245 : ℕ) ^ 4 % 10 ^ 293 = 324721301000625 := by
      have step := pow_mod_double (k := 4245) (e := 2) (m := 10 ^ 293) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (4245 : ℕ) ^ 9 % 10 ^ 293 = 447609454508420943648432908203125 := by
      have step := pow_mod_double_add_one (k := 4245) (e := 4) (m := 10 ^ 293) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (4245 : ℕ) ^ 18 % 10 ^ 293 = 200354223765326158235771499933228795429695732534512332916259765625 := by
      have step := pow_mod_double (k := 4245) (e := 9) (m := 10 ^ 293) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h36 : (4245 : ℕ) ^ 36 % 10 ^ 293 = 40141814980606385135530227829258370854263980499854572357740359691044983557119553608120878309065647174348137923516333103179931640625 := by
      have step := pow_mod_double (k := 4245) (e := 18) (m := 10 ^ 293) h18
      have he : 2 * 18 = 36 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h73 : (4245 : ℕ) ^ 73 % 10 ^ 293 = 6840245740683563424995541485266020432995375466891598518079524389243481087287583305479351804716116804103483526497561411237454961878709631745335235583905334085844419564123716447864974326073296591659536050201364058510912277287670246739281765258056111633777618408203125 := by
      have step := pow_mod_double_add_one (k := 4245) (e := 36) (m := 10 ^ 293) h36
      have he : 2 * 36 + 1 = 73 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h146 : (4245 : ℕ) ^ 146 % 10 ^ 293 = 50250035328673422842601234207462663785679383492050114977894019543047599611512304286405999610428230788515670019197131643743836170178697940995657016387635602694454436206482275554936597068380281911903068267861101151627542977818710128415758967360000352233607989749231137466267682611942291259765625 := by
      have step := pow_mod_double (k := 4245) (e := 73) (m := 10 ^ 293) h73
      have he : 2 * 73 = 146 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h292 : (4245 : ℕ) ^ 292 % 10 ^ 293 = 17462564376065260218432699206003738488177520265052972132060271293199042179168594432110238641187106655880626640072990546980278659088954583925189495368339998038374398377699818669762904093430992113062628286649615639926883607876795573028952560162299105701345924845924173496314324438571929931640625 := by
      have step := pow_mod_double (k := 4245) (e := 146) (m := 10 ^ 293) h146
      have he : 2 * 146 = 292 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h585 : (4245 : ℕ) ^ 585 % 10 ^ 293 = 69142475339415211235394252403268837679264197589131995494363491637770915862043724517120512756502925139758104061010223734219875135555018645186527739707741482981788654607805092886828746502042772788571767483401717776919662398005548003306631148835055330624695113517219624554854817688465118408203125 := by
      have step := pow_mod_double_add_one (k := 4245) (e := 292) (m := 10 ^ 293) h292
      have he : 2 * 292 + 1 = 585 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1170 : (4245 : ℕ) ^ 1170 % 10 ^ 293 = 59375090913762986485932546760938759929027817390025696956858681808941304722445521678103007253914381042868765511620551895084161109265422399767921398167737829693206901375147642433275459415146196594341110112134014989526677862210748767057222479055650986670168711700767971706227399408817291259765625 := by
      have step := pow_mod_double (k := 4245) (e := 585) (m := 10 ^ 293) h585
      have he : 2 * 585 = 1170 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1170
  rw [hmod]
  decide
private theorem cert_4245 : ExponentCertificate 4245 1170 1170 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4245) (by decide) (by decide) (by decide) suffix_4245
private theorem cert_4246 : ExponentCertificate 4246 1171 1170 := by decide
private theorem cert_4247 : ExponentCertificate 4247 1171 1170 := by decide
private theorem cert_4248 : ExponentCertificate 4248 1171 1170 := by decide
private theorem suffix_4249 : 1171 < digitSum ((4249 : ℕ) ^ 1171 % 10 ^ 293) := by
  have hmod : (4249 : ℕ) ^ 1171 % 10 ^ 293 = 4465999850542375136126665483453933109635532057020406266638815636454460812718200169934200854508493868024631092181897240963974126610984446264760498762529909117721674275073245573847961110031002242798027224324057896750252453022541376163871283290863732573492995122904956948323366289711665075914249 := by
    have h1 : (4249 : ℕ) ^ 1 % 10 ^ 293 = 4249 := by decide
    have h2 : (4249 : ℕ) ^ 2 % 10 ^ 293 = 18054001 := by
      have step := pow_mod_double (k := 4249) (e := 1) (m := 10 ^ 293) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4249 : ℕ) ^ 4 % 10 ^ 293 = 325946952108001 := by
      have step := pow_mod_double (k := 4249) (e := 2) (m := 10 ^ 293) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (4249 : ℕ) ^ 9 % 10 ^ 293 = 451419774835517369037127349788249 := by
      have step := pow_mod_double_add_one (k := 4249) (e := 4) (m := 10 ^ 293) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (4249 : ℕ) ^ 18 % 10 ^ 293 = 203779813112549200505718525663983875098871463296060993065138486001 := by
      have step := pow_mod_double (k := 4249) (e := 9) (m := 10 ^ 293) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h36 : (4249 : ℕ) ^ 36 % 10 ^ 293 = 41526212232185479077376975715361101038399701713324671118864088390812511711374893600099631873972772181763757626188340344502472972001 := by
      have step := pow_mod_double (k := 4249) (e := 18) (m := 10 ^ 293) h18
      have he : 2 * 18 = 36 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h73 : (4249 : ℕ) ^ 73 % 10 ^ 293 = 7327087358695818851863149341609632061313138379198444130256756086434516446181585422361028049926465250371164403271230296495823836785355076219697735264457583671176840107756464209557257193922523710313314686724372820163331746830609204948899699611387922683670834532060249 := by
      have step := pow_mod_double_add_one (k := 4249) (e := 36) (m := 10 ^ 293) h36
      have he : 2 * 36 + 1 = 73 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h146 : (4249 : ℕ) ^ 146 % 10 ^ 293 = 41418250864481920601759692518458527377659076184386664610502020747084521346710310191469099364600565170418639735489075514033036063070979292798426093495140323060219771309817990656816853511308570605136324897826690849514823915451509983656438331217446306012419410432460228019588860627243440565942001 := by
      have step := pow_mod_double (k := 4249) (e := 73) (m := 10 ^ 293) h73
      have he : 2 * 73 = 146 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h292 : (4249 : ℕ) ^ 292 % 10 ^ 293 = 95226609941230011010372857226366625298348110350401403915884281666928114693818136273261685796803846529404483277819113362922299053974708085010122034449197992492115709743904826709444435544168107415161515194753689575466810879724846522387949914238414309591255841854235906984418135415737228495884001 := by
      have step := pow_mod_double (k := 4249) (e := 146) (m := 10 ^ 293) h146
      have he : 2 * 146 = 292 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h585 : (4249 : ℕ) ^ 585 % 10 ^ 293 = 29544680791723103852673942813590015905234863302061548846611157240402825189647230382772152068337303958782458389772495700675679347728454530791462190449093031522441363063345657783948274960578005045586614395524399423949708487070322299218665695467686196304996993982602443520365285820964004566236249 := by
      have step := pow_mod_double_add_one (k := 4249) (e := 292) (m := 10 ^ 293) h292
      have he : 2 * 292 + 1 = 585 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1171 : (4249 : ℕ) ^ 1171 % 10 ^ 293 = 4465999850542375136126665483453933109635532057020406266638815636454460812718200169934200854508493868024631092181897240963974126610984446264760498762529909117721674275073245573847961110031002242798027224324057896750252453022541376163871283290863732573492995122904956948323366289711665075914249 := by
      have step := pow_mod_double_add_one (k := 4249) (e := 585) (m := 10 ^ 293) h585
      have he : 2 * 585 + 1 = 1171 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1171
  rw [hmod]
  decide
private theorem cert_4249 : ExponentCertificate 4249 1171 1171 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4249) (by decide) (by decide) (by decide) suffix_4249
private theorem cert_4250 : ExponentCertificate 4250 1172 1171 := by decide
private theorem cert_4251 : ExponentCertificate 4251 1172 1171 := by decide
private theorem cert_4252 : ExponentCertificate 4252 1172 1171 := by decide
private theorem cert_4253 : ExponentCertificate 4253 1172 1172 := by decide
private theorem cert_4254 : ExponentCertificate 4254 1173 1172 := by decide
private theorem cert_4255 : ExponentCertificate 4255 1173 1172 := by decide
private theorem cert_4256 : ExponentCertificate 4256 1173 1172 := by decide
private theorem cert_4257 : ExponentCertificate 4257 1173 1173 := by decide
private theorem cert_4258 : ExponentCertificate 4258 1173 1173 := by decide
private theorem cert_4259 : ExponentCertificate 4259 1174 1173 := by decide
private theorem cert_4260 : ExponentCertificate 4260 1174 1173 := by decide
private theorem cert_4261 : ExponentCertificate 4261 1174 1173 := by decide
private theorem suffix_4262 : 1174 < digitSum ((4262 : ℕ) ^ 1174 % 10 ^ 294) := by
  have hmod : (4262 : ℕ) ^ 1174 % 10 ^ 294 = 587531287324427796591828274382279077906959228368558683838945149120193772581757279179234261944291735712162386581593323034578783103149133594974534761422637843331200668129533333192242231054608609127390991431291644612083854396535826387003155477757198781321635896124498435722559631406208414031806464 := by
    have h1 : (4262 : ℕ) ^ 1 % 10 ^ 294 = 4262 := by decide
    have h2 : (4262 : ℕ) ^ 2 % 10 ^ 294 = 18164644 := by
      have step := pow_mod_double (k := 4262) (e := 1) (m := 10 ^ 294) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4262 : ℕ) ^ 4 % 10 ^ 294 = 329954291646736 := by
      have step := pow_mod_double (k := 4262) (e := 2) (m := 10 ^ 294) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (4262 : ℕ) ^ 9 % 10 ^ 294 = 464003234963335293770412111652352 := by
      have step := pow_mod_double_add_one (k := 4262) (e := 4) (m := 10 ^ 294) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (4262 : ℕ) ^ 18 % 10 ^ 294 = 215299002056440140399637434862647027625005277898908084295707131904 := by
      have step := pow_mod_double (k := 4262) (e := 9) (m := 10 ^ 294) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h36 : (4262 : ℕ) ^ 36 % 10 ^ 294 = 46353660286499015804749131223866609957347570515809911527630134278199838951139972268633803324956214601248233633362531730889654665216 := by
      have step := pow_mod_double (k := 4262) (e := 18) (m := 10 ^ 294) h18
      have he : 2 * 18 = 36 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h73 : (4262 : ℕ) ^ 73 % 10 ^ 294 = 9157596685177136957144621917449459832548590865167363431660383974258068561976191243059642309051502343985957410745845458573240368005344413029383492140059702971778417453884752008830538008279102079444274748246573007175167745910997455359866074280264810845927537872207872 := by
      have step := pow_mod_double_add_one (k := 4262) (e := 36) (m := 10 ^ 294) h36
      have he : 2 * 36 + 1 = 73 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h146 : (4262 : ℕ) ^ 146 % 10 ^ 294 = 810570772100646175629333886287345169041482929335318456287014547189273026909774308087747607150357421394642422833382140488760867176824403773036243195986310587530586533524512942482497811884864119967491178886423559787692240277094639194172457548848473741329550583283706742383704323586689099978768384 := by
      have step := pow_mod_double (k := 4262) (e := 73) (m := 10 ^ 294) h73
      have he : 2 * 73 = 146 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h293 : (4262 : ℕ) ^ 293 % 10 ^ 294 = 294565916006345513780400875257624429268111759296661693905996805666892993302719678323905448543879296790848671383685918469015343424015040001609087643455142921343522060551827529091154535686689898825670859645396451736843427248098266943260815015335651731089317771243039738681075883561576429594345472 := by
      have step := pow_mod_double_add_one (k := 4262) (e := 146) (m := 10 ^ 294) h146
      have he : 2 * 146 + 1 = 293 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h587 : (4262 : ℕ) ^ 587 % 10 ^ 294 = 504578158481334138355012632236370311220813549605269308976519929631435989910431974549521218758137599376006364580554952478707800411993799354355880224171741132866616039148875303784935381027157842288819834168807286194957950428162151136352080994947985152768075590743860221952774601406309562379665408 := by
      have step := pow_mod_double_add_one (k := 4262) (e := 293) (m := 10 ^ 294) h293
      have he : 2 * 293 + 1 = 587 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1174 : (4262 : ℕ) ^ 1174 % 10 ^ 294 = 587531287324427796591828274382279077906959228368558683838945149120193772581757279179234261944291735712162386581593323034578783103149133594974534761422637843331200668129533333192242231054608609127390991431291644612083854396535826387003155477757198781321635896124498435722559631406208414031806464 := by
      have step := pow_mod_double (k := 4262) (e := 587) (m := 10 ^ 294) h587
      have he : 2 * 587 = 1174 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1174
  rw [hmod]
  decide
private theorem cert_4262 : ExponentCertificate 4262 1174 1174 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4262) (by decide) (by decide) (by decide) suffix_4262
private theorem cert_4263 : ExponentCertificate 4263 1175 1174 := by decide
private theorem cert_4264 : ExponentCertificate 4264 1175 1174 := by decide
private theorem cert_4265 : ExponentCertificate 4265 1175 1174 := by decide
private theorem cert_4266 : ExponentCertificate 4266 1175 1175 := by decide
private theorem cert_4267 : ExponentCertificate 4267 1176 1175 := by decide
private theorem cert_4268 : ExponentCertificate 4268 1176 1175 := by decide
private theorem cert_4269 : ExponentCertificate 4269 1176 1175 := by decide
private theorem cert_4270 : ExponentCertificate 4270 1176 1176 := by decide
private theorem cert_4271 : ExponentCertificate 4271 1177 1176 := by decide
private theorem cert_4272 : ExponentCertificate 4272 1177 1176 := by decide
private theorem cert_4273 : ExponentCertificate 4273 1177 1176 := by decide
private theorem cert_4274 : ExponentCertificate 4274 1177 1177 := by decide
private theorem cert_4275 : ExponentCertificate 4275 1178 1177 := by decide
private theorem cert_4276 : ExponentCertificate 4276 1178 1177 := by decide
private theorem cert_4277 : ExponentCertificate 4277 1178 1177 := by decide
private theorem cert_4278 : ExponentCertificate 4278 1178 1178 := by decide
private theorem cert_4279 : ExponentCertificate 4279 1179 1178 := by decide
private theorem cert_4280 : ExponentCertificate 4280 1179 1178 := by decide
private theorem cert_4281 : ExponentCertificate 4281 1179 1178 := by decide
private theorem cert_4282 : ExponentCertificate 4282 1179 1179 := by decide
private theorem cert_4283 : ExponentCertificate 4283 1180 1179 := by decide
private theorem cert_4284 : ExponentCertificate 4284 1180 1179 := by decide
private theorem cert_4285 : ExponentCertificate 4285 1180 1179 := by decide
private theorem cert_4286 : ExponentCertificate 4286 1180 1180 := by decide
private theorem cert_4287 : ExponentCertificate 4287 1181 1180 := by decide
private theorem cert_4288 : ExponentCertificate 4288 1181 1180 := by decide
private theorem cert_4289 : ExponentCertificate 4289 1181 1180 := by decide
private theorem cert_4290 : ExponentCertificate 4290 1181 1181 := by decide
private theorem cert_4291 : ExponentCertificate 4291 1181 1181 := by decide
private theorem cert_4292 : ExponentCertificate 4292 1182 1181 := by decide
private theorem cert_4293 : ExponentCertificate 4293 1182 1181 := by decide
private theorem cert_4294 : ExponentCertificate 4294 1182 1181 := by decide
private theorem cert_4295 : ExponentCertificate 4295 1182 1182 := by decide
private theorem cert_4296 : ExponentCertificate 4296 1183 1182 := by decide
private theorem cert_4297 : ExponentCertificate 4297 1183 1182 := by decide
private theorem cert_4298 : ExponentCertificate 4298 1183 1182 := by decide
private theorem cert_4299 : ExponentCertificate 4299 1183 1183 := by decide
private theorem cert_4300 : ExponentCertificate 4300 1184 1183 := by decide

private theorem certificates_4201_4300 {k : ℕ} (hlo : 4201 ≤ k) (hhi : k ≤ 4300) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1160, 1159, cert_4201⟩
  · exact ⟨1160, 1159, cert_4202⟩
  · exact ⟨1160, 1159, cert_4203⟩
  · exact ⟨1160, 1160, cert_4204⟩
  · exact ⟨1161, 1160, cert_4205⟩
  · exact ⟨1161, 1160, cert_4206⟩
  · exact ⟨1161, 1160, cert_4207⟩
  · exact ⟨1161, 1161, cert_4208⟩
  · exact ⟨1162, 1161, cert_4209⟩
  · exact ⟨1162, 1161, cert_4210⟩
  · exact ⟨1162, 1161, cert_4211⟩
  · exact ⟨1162, 1162, cert_4212⟩
  · exact ⟨1163, 1162, cert_4213⟩
  · exact ⟨1163, 1162, cert_4214⟩
  · exact ⟨1163, 1162, cert_4215⟩
  · exact ⟨1163, 1163, cert_4216⟩
  · exact ⟨1164, 1163, cert_4217⟩
  · exact ⟨1164, 1163, cert_4218⟩
  · exact ⟨1164, 1163, cert_4219⟩
  · exact ⟨1164, 1164, cert_4220⟩
  · exact ⟨1165, 1164, cert_4221⟩
  · exact ⟨1165, 1164, cert_4222⟩
  · exact ⟨1165, 1164, cert_4223⟩
  · exact ⟨1165, 1165, cert_4224⟩
  · exact ⟨1165, 1165, cert_4225⟩
  · exact ⟨1166, 1165, cert_4226⟩
  · exact ⟨1166, 1165, cert_4227⟩
  · exact ⟨1166, 1165, cert_4228⟩
  · exact ⟨1166, 1166, cert_4229⟩
  · exact ⟨1167, 1166, cert_4230⟩
  · exact ⟨1167, 1166, cert_4231⟩
  · exact ⟨1167, 1166, cert_4232⟩
  · exact ⟨1167, 1167, cert_4233⟩
  · exact ⟨1168, 1167, cert_4234⟩
  · exact ⟨1168, 1167, cert_4235⟩
  · exact ⟨1168, 1167, cert_4236⟩
  · exact ⟨1168, 1168, cert_4237⟩
  · exact ⟨1169, 1168, cert_4238⟩
  · exact ⟨1169, 1168, cert_4239⟩
  · exact ⟨1169, 1168, cert_4240⟩
  · exact ⟨1169, 1169, cert_4241⟩
  · exact ⟨1170, 1169, cert_4242⟩
  · exact ⟨1170, 1169, cert_4243⟩
  · exact ⟨1170, 1169, cert_4244⟩
  · exact ⟨1170, 1170, cert_4245⟩
  · exact ⟨1171, 1170, cert_4246⟩
  · exact ⟨1171, 1170, cert_4247⟩
  · exact ⟨1171, 1170, cert_4248⟩
  · exact ⟨1171, 1171, cert_4249⟩
  · exact ⟨1172, 1171, cert_4250⟩
  · exact ⟨1172, 1171, cert_4251⟩
  · exact ⟨1172, 1171, cert_4252⟩
  · exact ⟨1172, 1172, cert_4253⟩
  · exact ⟨1173, 1172, cert_4254⟩
  · exact ⟨1173, 1172, cert_4255⟩
  · exact ⟨1173, 1172, cert_4256⟩
  · exact ⟨1173, 1173, cert_4257⟩
  · exact ⟨1173, 1173, cert_4258⟩
  · exact ⟨1174, 1173, cert_4259⟩
  · exact ⟨1174, 1173, cert_4260⟩
  · exact ⟨1174, 1173, cert_4261⟩
  · exact ⟨1174, 1174, cert_4262⟩
  · exact ⟨1175, 1174, cert_4263⟩
  · exact ⟨1175, 1174, cert_4264⟩
  · exact ⟨1175, 1174, cert_4265⟩
  · exact ⟨1175, 1175, cert_4266⟩
  · exact ⟨1176, 1175, cert_4267⟩
  · exact ⟨1176, 1175, cert_4268⟩
  · exact ⟨1176, 1175, cert_4269⟩
  · exact ⟨1176, 1176, cert_4270⟩
  · exact ⟨1177, 1176, cert_4271⟩
  · exact ⟨1177, 1176, cert_4272⟩
  · exact ⟨1177, 1176, cert_4273⟩
  · exact ⟨1177, 1177, cert_4274⟩
  · exact ⟨1178, 1177, cert_4275⟩
  · exact ⟨1178, 1177, cert_4276⟩
  · exact ⟨1178, 1177, cert_4277⟩
  · exact ⟨1178, 1178, cert_4278⟩
  · exact ⟨1179, 1178, cert_4279⟩
  · exact ⟨1179, 1178, cert_4280⟩
  · exact ⟨1179, 1178, cert_4281⟩
  · exact ⟨1179, 1179, cert_4282⟩
  · exact ⟨1180, 1179, cert_4283⟩
  · exact ⟨1180, 1179, cert_4284⟩
  · exact ⟨1180, 1179, cert_4285⟩
  · exact ⟨1180, 1180, cert_4286⟩
  · exact ⟨1181, 1180, cert_4287⟩
  · exact ⟨1181, 1180, cert_4288⟩
  · exact ⟨1181, 1180, cert_4289⟩
  · exact ⟨1181, 1181, cert_4290⟩
  · exact ⟨1181, 1181, cert_4291⟩
  · exact ⟨1182, 1181, cert_4292⟩
  · exact ⟨1182, 1181, cert_4293⟩
  · exact ⟨1182, 1181, cert_4294⟩
  · exact ⟨1182, 1182, cert_4295⟩
  · exact ⟨1183, 1182, cert_4296⟩
  · exact ⟨1183, 1182, cert_4297⟩
  · exact ⟨1183, 1182, cert_4298⟩
  · exact ⟨1183, 1183, cert_4299⟩
  · exact ⟨1184, 1183, cert_4300⟩

theorem no_fixed_digitCount_4201_4300 {n : ℕ} (hn : a n = n)
    (hlo : 4201 ≤ digitCount n) (hhi : digitCount n ≤ 4300) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_4201_4300 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_4201_4300
end OeisA113010
