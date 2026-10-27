import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 7601
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_7501 : ExponentCertificate 7501 1936 1935 := by decide
private theorem cert_7502 : ExponentCertificate 7502 1936 1935 := by decide
private theorem cert_7503 : ExponentCertificate 7503 1936 1936 := by decide
private theorem cert_7504 : ExponentCertificate 7504 1937 1936 := by decide
private theorem cert_7505 : ExponentCertificate 7505 1937 1936 := by decide
private theorem cert_7506 : ExponentCertificate 7506 1937 1936 := by decide
private theorem cert_7507 : ExponentCertificate 7507 1937 1937 := by decide
private theorem cert_7508 : ExponentCertificate 7508 1938 1937 := by decide
private theorem cert_7509 : ExponentCertificate 7509 1938 1937 := by decide
private theorem cert_7510 : ExponentCertificate 7510 1938 1937 := by decide
private theorem cert_7511 : ExponentCertificate 7511 1938 1937 := by decide
private theorem cert_7512 : ExponentCertificate 7512 1938 1938 := by decide
private theorem cert_7513 : ExponentCertificate 7513 1939 1938 := by decide
private theorem cert_7514 : ExponentCertificate 7514 1939 1938 := by decide
private theorem cert_7515 : ExponentCertificate 7515 1939 1938 := by decide
private theorem cert_7516 : ExponentCertificate 7516 1939 1939 := by decide
private theorem cert_7517 : ExponentCertificate 7517 1940 1939 := by decide
private theorem cert_7518 : ExponentCertificate 7518 1940 1939 := by decide
private theorem cert_7519 : ExponentCertificate 7519 1940 1939 := by decide
private theorem cert_7520 : ExponentCertificate 7520 1940 1940 := by decide
private theorem cert_7521 : ExponentCertificate 7521 1941 1940 := by decide
private theorem cert_7522 : ExponentCertificate 7522 1941 1940 := by decide
private theorem cert_7523 : ExponentCertificate 7523 1941 1940 := by decide
private theorem cert_7524 : ExponentCertificate 7524 1941 1940 := by decide
private theorem cert_7525 : ExponentCertificate 7525 1941 1941 := by decide
private theorem cert_7526 : ExponentCertificate 7526 1942 1941 := by decide
private theorem cert_7527 : ExponentCertificate 7527 1942 1941 := by decide
private theorem cert_7528 : ExponentCertificate 7528 1942 1941 := by decide
private theorem cert_7529 : ExponentCertificate 7529 1942 1942 := by decide
private theorem cert_7530 : ExponentCertificate 7530 1943 1942 := by decide
private theorem cert_7531 : ExponentCertificate 7531 1943 1942 := by decide
private theorem cert_7532 : ExponentCertificate 7532 1943 1942 := by decide
private theorem cert_7533 : ExponentCertificate 7533 1943 1943 := by decide
private theorem cert_7534 : ExponentCertificate 7534 1943 1943 := by decide
private theorem cert_7535 : ExponentCertificate 7535 1944 1943 := by decide
private theorem cert_7536 : ExponentCertificate 7536 1944 1943 := by decide
private theorem cert_7537 : ExponentCertificate 7537 1944 1943 := by decide
private theorem cert_7538 : ExponentCertificate 7538 1944 1944 := by decide
private theorem cert_7539 : ExponentCertificate 7539 1945 1944 := by decide
private theorem cert_7540 : ExponentCertificate 7540 1945 1944 := by decide
private theorem cert_7541 : ExponentCertificate 7541 1945 1944 := by decide
private theorem cert_7542 : ExponentCertificate 7542 1945 1945 := by decide
private theorem cert_7543 : ExponentCertificate 7543 1946 1945 := by decide
private theorem cert_7544 : ExponentCertificate 7544 1946 1945 := by decide
private theorem cert_7545 : ExponentCertificate 7545 1946 1945 := by decide
private theorem cert_7546 : ExponentCertificate 7546 1946 1945 := by decide
private theorem cert_7547 : ExponentCertificate 7547 1946 1946 := by decide
private theorem cert_7548 : ExponentCertificate 7548 1947 1946 := by decide
private theorem cert_7549 : ExponentCertificate 7549 1947 1946 := by decide
private theorem cert_7550 : ExponentCertificate 7550 1947 1946 := by decide
private theorem cert_7551 : ExponentCertificate 7551 1947 1947 := by decide
private theorem cert_7552 : ExponentCertificate 7552 1948 1947 := by decide
private theorem cert_7553 : ExponentCertificate 7553 1948 1947 := by decide
private theorem cert_7554 : ExponentCertificate 7554 1948 1947 := by decide
private theorem suffix_7555 : 1948 < digitSum ((7555 : ℕ) ^ 1948 % 10 ^ 487) := by
  have hmod : (7555 : ℕ) ^ 1948 % 10 ^ 487 = 2065573946277177211961837762124368486472339894908667854010227495630049115605100105615842428514724386013204703723898717203329138545785108330988171069500093933754180874288884643603743308383907084210507314385670385027080220832233374139021645297923941208665379819984746975854113605591664262787269800006623284806176405069585804000346503802883647887963530975449806144599858516793929157546235786372953507709841268491796527738271269749230028243774408476009230017922391198226250708103179931640625 := by
    have h1 : (7555 : ℕ) ^ 1 % 10 ^ 487 = 7555 := by decide
    have h3 : (7555 : ℕ) ^ 3 % 10 ^ 487 = 431224478875 := by
      have step := pow_mod_double_add_one (k := 7555) (e := 1) (m := 10 ^ 487) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h7 : (7555 : ℕ) ^ 7 % 10 ^ 487 = 1404886634172570752161796875 := by
      have step := pow_mod_double_add_one (k := 7555) (e := 3) (m := 10 ^ 487) h3
      have he : 2 * 3 + 1 = 7 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h15 : (7555 : ℕ) ^ 15 % 10 ^ 487 = 14911352266593730222520976300829438076190676518280029296875 := by
      have step := pow_mod_double_add_one (k := 7555) (e := 7) (m := 10 ^ 487) h7
      have he : 2 * 7 + 1 = 15 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h30 : (7555 : ℕ) ^ 30 % 10 ^ 487 = 222348426418449975754314203968945486307592868310105622284777854658915909871412568318070659971610642969608306884765625 := by
      have step := pow_mod_double (k := 7555) (e := 15) (m := 10 ^ 487) h15
      have he : 2 * 15 = 30 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h60 : (7555 : ℕ) ^ 60 % 10 ^ 487 = 49438822730760863112520234132662108675485849588008580574599749322483108461161333315401622003257233769497356603810034576976719175934123607290447314046614371293381976710313478121098356368940535988942830414316631504334509372711181640625 := by
      have step := pow_mod_double (k := 7555) (e := 30) (m := 10 ^ 487) h30
      have he : 2 * 30 = 60 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h121 : (7555 : ℕ) ^ 121 % 10 ^ 487 = 18465909793142175380208717396479299416562467072884179479753562819186992429638059797450303315718322915665582376007018393633817027202083985244023974213834071356915284999189654697303020236550732598199498933451110430679977720229277541296306569737855030308815144840156620269157982030821218262195533176503953976376266476526927474940129234326681102579392605312737478713309041266840258550132692207873581446195147474415222422876950108638731407051380983830313198268413543701171875 := by
      have step := pow_mod_double_add_one (k := 7555) (e := 60) (m := 10 ^ 487) h60
      have he : 2 * 60 + 1 = 121 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h243 : (7555 : ℕ) ^ 243 % 10 ^ 487 = 1011578104606703642022731241604294928253905247099515418228645228524080314296708783715609137398777227361678218777291224720878055125046824167209496715612174689658331257591851254725944349609195536723568382581730275212969495428631045617801445471608817552799524616866742892607678262106917799996937614782344784840220771827414306859242606965278150842502672804363554650236324065011995516680551084433807973777555621781946463220657311675519514383457788590618686708211271252366714179515838623046875 := by
      have step := pow_mod_double_add_one (k := 7555) (e := 121) (m := 10 ^ 487) h121
      have he : 2 * 121 + 1 = 243 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h487 : (7555 : ℕ) ^ 487 % 10 ^ 487 = 2223158573583093176481169635749021151446334003264102993827692695425448503675390792708945411569043659828488069178485828707411746330849990513145240937170538074613609718014258375391166580064699634505881418939572657092612346580330902708010411996270539128141011429800900948740115798887262208109970186428033460150724014187953495344351448701997085774541072898085296583238053795606385241011070067928794314910119522099781539045458015912714627125458053259580981642073993498343043029308319091796875 := by
      have step := pow_mod_double_add_one (k := 7555) (e := 243) (m := 10 ^ 487) h243
      have he : 2 * 243 + 1 = 487 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h974 : (7555 : ℕ) ^ 974 % 10 ^ 487 = 9082672593855836908573808883892337610392045417152734539619855944331877668015665021360006588481532248621273259189117577977606680321644108587756871074868184179970236239765397832505078333332248601190567091657826860474487213272441826788673830574981211578469770386503162681849111823978018237908379889530448939624734536439925669881450918860977468158740260013461085586992399352518102223938067928631929848548646704459397121932277495445756773152131479200956098996044829618767835199832916259765625 := by
      have step := pow_mod_double (k := 7555) (e := 487) (m := 10 ^ 487) h487
      have he : 2 * 487 = 974 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1948 : (7555 : ℕ) ^ 1948 % 10 ^ 487 = 2065573946277177211961837762124368486472339894908667854010227495630049115605100105615842428514724386013204703723898717203329138545785108330988171069500093933754180874288884643603743308383907084210507314385670385027080220832233374139021645297923941208665379819984746975854113605591664262787269800006623284806176405069585804000346503802883647887963530975449806144599858516793929157546235786372953507709841268491796527738271269749230028243774408476009230017922391198226250708103179931640625 := by
      have step := pow_mod_double (k := 7555) (e := 974) (m := 10 ^ 487) h974
      have he : 2 * 974 = 1948 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1948
  rw [hmod]
  decide
private theorem cert_7555 : ExponentCertificate 7555 1948 1948 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 7555) (by decide) (by decide) (by decide) suffix_7555
private theorem cert_7556 : ExponentCertificate 7556 1949 1948 := by decide
private theorem cert_7557 : ExponentCertificate 7557 1949 1948 := by decide
private theorem cert_7558 : ExponentCertificate 7558 1949 1948 := by decide
private theorem cert_7559 : ExponentCertificate 7559 1949 1948 := by decide
private theorem cert_7560 : ExponentCertificate 7560 1949 1949 := by decide
private theorem cert_7561 : ExponentCertificate 7561 1950 1949 := by decide
private theorem cert_7562 : ExponentCertificate 7562 1950 1949 := by decide
private theorem cert_7563 : ExponentCertificate 7563 1950 1949 := by decide
private theorem cert_7564 : ExponentCertificate 7564 1950 1950 := by decide
private theorem cert_7565 : ExponentCertificate 7565 1951 1950 := by decide
private theorem cert_7566 : ExponentCertificate 7566 1951 1950 := by decide
private theorem cert_7567 : ExponentCertificate 7567 1951 1950 := by decide
private theorem cert_7568 : ExponentCertificate 7568 1951 1951 := by decide
private theorem cert_7569 : ExponentCertificate 7569 1951 1951 := by decide
private theorem cert_7570 : ExponentCertificate 7570 1952 1951 := by decide
private theorem cert_7571 : ExponentCertificate 7571 1952 1951 := by decide
private theorem cert_7572 : ExponentCertificate 7572 1952 1951 := by decide
private theorem cert_7573 : ExponentCertificate 7573 1952 1952 := by decide
private theorem cert_7574 : ExponentCertificate 7574 1953 1952 := by decide
private theorem cert_7575 : ExponentCertificate 7575 1953 1952 := by decide
private theorem cert_7576 : ExponentCertificate 7576 1953 1952 := by decide
private theorem cert_7577 : ExponentCertificate 7577 1953 1953 := by decide
private theorem cert_7578 : ExponentCertificate 7578 1954 1953 := by decide
private theorem cert_7579 : ExponentCertificate 7579 1954 1953 := by decide
private theorem cert_7580 : ExponentCertificate 7580 1954 1953 := by decide
private theorem cert_7581 : ExponentCertificate 7581 1954 1954 := by decide
private theorem cert_7582 : ExponentCertificate 7582 1954 1954 := by decide
private theorem cert_7583 : ExponentCertificate 7583 1955 1954 := by decide
private theorem cert_7584 : ExponentCertificate 7584 1955 1954 := by decide
private theorem cert_7585 : ExponentCertificate 7585 1955 1954 := by decide
private theorem cert_7586 : ExponentCertificate 7586 1955 1955 := by decide
private theorem cert_7587 : ExponentCertificate 7587 1956 1955 := by decide
private theorem cert_7588 : ExponentCertificate 7588 1956 1955 := by decide
private theorem cert_7589 : ExponentCertificate 7589 1956 1955 := by decide
private theorem cert_7590 : ExponentCertificate 7590 1956 1956 := by decide
private theorem cert_7591 : ExponentCertificate 7591 1957 1956 := by decide
private theorem cert_7592 : ExponentCertificate 7592 1957 1956 := by decide
private theorem cert_7593 : ExponentCertificate 7593 1957 1956 := by decide
private theorem cert_7594 : ExponentCertificate 7594 1957 1956 := by decide
private theorem cert_7595 : ExponentCertificate 7595 1957 1957 := by decide
private theorem cert_7596 : ExponentCertificate 7596 1958 1957 := by decide
private theorem cert_7597 : ExponentCertificate 7597 1958 1957 := by decide
private theorem cert_7598 : ExponentCertificate 7598 1958 1957 := by decide
private theorem cert_7599 : ExponentCertificate 7599 1958 1958 := by decide
private theorem cert_7600 : ExponentCertificate 7600 1959 1958 := by decide

private theorem certificates_7501_7600 {k : ℕ} (hlo : 7501 ≤ k) (hhi : k ≤ 7600) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1936, 1935, cert_7501⟩
  · exact ⟨1936, 1935, cert_7502⟩
  · exact ⟨1936, 1936, cert_7503⟩
  · exact ⟨1937, 1936, cert_7504⟩
  · exact ⟨1937, 1936, cert_7505⟩
  · exact ⟨1937, 1936, cert_7506⟩
  · exact ⟨1937, 1937, cert_7507⟩
  · exact ⟨1938, 1937, cert_7508⟩
  · exact ⟨1938, 1937, cert_7509⟩
  · exact ⟨1938, 1937, cert_7510⟩
  · exact ⟨1938, 1937, cert_7511⟩
  · exact ⟨1938, 1938, cert_7512⟩
  · exact ⟨1939, 1938, cert_7513⟩
  · exact ⟨1939, 1938, cert_7514⟩
  · exact ⟨1939, 1938, cert_7515⟩
  · exact ⟨1939, 1939, cert_7516⟩
  · exact ⟨1940, 1939, cert_7517⟩
  · exact ⟨1940, 1939, cert_7518⟩
  · exact ⟨1940, 1939, cert_7519⟩
  · exact ⟨1940, 1940, cert_7520⟩
  · exact ⟨1941, 1940, cert_7521⟩
  · exact ⟨1941, 1940, cert_7522⟩
  · exact ⟨1941, 1940, cert_7523⟩
  · exact ⟨1941, 1940, cert_7524⟩
  · exact ⟨1941, 1941, cert_7525⟩
  · exact ⟨1942, 1941, cert_7526⟩
  · exact ⟨1942, 1941, cert_7527⟩
  · exact ⟨1942, 1941, cert_7528⟩
  · exact ⟨1942, 1942, cert_7529⟩
  · exact ⟨1943, 1942, cert_7530⟩
  · exact ⟨1943, 1942, cert_7531⟩
  · exact ⟨1943, 1942, cert_7532⟩
  · exact ⟨1943, 1943, cert_7533⟩
  · exact ⟨1943, 1943, cert_7534⟩
  · exact ⟨1944, 1943, cert_7535⟩
  · exact ⟨1944, 1943, cert_7536⟩
  · exact ⟨1944, 1943, cert_7537⟩
  · exact ⟨1944, 1944, cert_7538⟩
  · exact ⟨1945, 1944, cert_7539⟩
  · exact ⟨1945, 1944, cert_7540⟩
  · exact ⟨1945, 1944, cert_7541⟩
  · exact ⟨1945, 1945, cert_7542⟩
  · exact ⟨1946, 1945, cert_7543⟩
  · exact ⟨1946, 1945, cert_7544⟩
  · exact ⟨1946, 1945, cert_7545⟩
  · exact ⟨1946, 1945, cert_7546⟩
  · exact ⟨1946, 1946, cert_7547⟩
  · exact ⟨1947, 1946, cert_7548⟩
  · exact ⟨1947, 1946, cert_7549⟩
  · exact ⟨1947, 1946, cert_7550⟩
  · exact ⟨1947, 1947, cert_7551⟩
  · exact ⟨1948, 1947, cert_7552⟩
  · exact ⟨1948, 1947, cert_7553⟩
  · exact ⟨1948, 1947, cert_7554⟩
  · exact ⟨1948, 1948, cert_7555⟩
  · exact ⟨1949, 1948, cert_7556⟩
  · exact ⟨1949, 1948, cert_7557⟩
  · exact ⟨1949, 1948, cert_7558⟩
  · exact ⟨1949, 1948, cert_7559⟩
  · exact ⟨1949, 1949, cert_7560⟩
  · exact ⟨1950, 1949, cert_7561⟩
  · exact ⟨1950, 1949, cert_7562⟩
  · exact ⟨1950, 1949, cert_7563⟩
  · exact ⟨1950, 1950, cert_7564⟩
  · exact ⟨1951, 1950, cert_7565⟩
  · exact ⟨1951, 1950, cert_7566⟩
  · exact ⟨1951, 1950, cert_7567⟩
  · exact ⟨1951, 1951, cert_7568⟩
  · exact ⟨1951, 1951, cert_7569⟩
  · exact ⟨1952, 1951, cert_7570⟩
  · exact ⟨1952, 1951, cert_7571⟩
  · exact ⟨1952, 1951, cert_7572⟩
  · exact ⟨1952, 1952, cert_7573⟩
  · exact ⟨1953, 1952, cert_7574⟩
  · exact ⟨1953, 1952, cert_7575⟩
  · exact ⟨1953, 1952, cert_7576⟩
  · exact ⟨1953, 1953, cert_7577⟩
  · exact ⟨1954, 1953, cert_7578⟩
  · exact ⟨1954, 1953, cert_7579⟩
  · exact ⟨1954, 1953, cert_7580⟩
  · exact ⟨1954, 1954, cert_7581⟩
  · exact ⟨1954, 1954, cert_7582⟩
  · exact ⟨1955, 1954, cert_7583⟩
  · exact ⟨1955, 1954, cert_7584⟩
  · exact ⟨1955, 1954, cert_7585⟩
  · exact ⟨1955, 1955, cert_7586⟩
  · exact ⟨1956, 1955, cert_7587⟩
  · exact ⟨1956, 1955, cert_7588⟩
  · exact ⟨1956, 1955, cert_7589⟩
  · exact ⟨1956, 1956, cert_7590⟩
  · exact ⟨1957, 1956, cert_7591⟩
  · exact ⟨1957, 1956, cert_7592⟩
  · exact ⟨1957, 1956, cert_7593⟩
  · exact ⟨1957, 1956, cert_7594⟩
  · exact ⟨1957, 1957, cert_7595⟩
  · exact ⟨1958, 1957, cert_7596⟩
  · exact ⟨1958, 1957, cert_7597⟩
  · exact ⟨1958, 1957, cert_7598⟩
  · exact ⟨1958, 1958, cert_7599⟩
  · exact ⟨1959, 1958, cert_7600⟩

theorem no_fixed_digitCount_7501_7600 {n : ℕ} (hn : a n = n)
    (hlo : 7501 ≤ digitCount n) (hhi : digitCount n ≤ 7600) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_7501_7600 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_7501_7600
end OeisA113010
