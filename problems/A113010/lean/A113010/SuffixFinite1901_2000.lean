import A113010.SuffixFiniteCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2100
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_1901 : ExponentCertificate 1901 580 579 := by decide
private theorem cert_1902 : ExponentCertificate 1902 580 580 := by decide
private theorem suffix_1903 : 580 < digitSum ((1903 : ℕ) ^ 580 % 10 ^ 145) := by
  have hmod : (1903 : ℕ) ^ 580 % 10 ^ 145 = 3123685181860511885504293195703805897014419160469150021197179043873731322587052321785188103488721975639483305978017460807299378108053463266241601 := by
    have h1 : (1903 : ℕ) ^ 1 % 10 ^ 145 = 1903 := by decide
    have h2 : (1903 : ℕ) ^ 2 % 10 ^ 145 = 3621409 := by
      have step := pow_mod_double (k := 1903) (e := 1) (m := 10 ^ 145) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1903 : ℕ) ^ 4 % 10 ^ 145 = 13114603145281 := by
      have step := pow_mod_double (k := 1903) (e := 2) (m := 10 ^ 145) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (1903 : ℕ) ^ 9 % 10 ^ 145 = 327302328197581809079858732783 := by
      have step := pow_mod_double_add_one (k := 1903) (e := 4) (m := 10 ^ 145) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (1903 : ℕ) ^ 18 % 10 ^ 145 = 107126814043557556203617173581281384429802906095706598925089 := by
      have step := pow_mod_double (k := 1903) (e := 9) (m := 10 ^ 145) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h36 : (1903 : ℕ) ^ 36 % 10 ^ 145 = 11476154287122960445336146865326558426064706241295464113827598814803010455910196557326077178271210095075846930233657921 := by
      have step := pow_mod_double (k := 1903) (e := 18) (m := 10 ^ 145) h18
      have he : 2 * 18 = 36 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h72 : (1903 : ℕ) ^ 72 % 10 ^ 145 = 8748185785382765141068930680777109219472484766604309570782056265030891444519896036229848783396960042032114036308064106729694362010661084046042241 := by
      have step := pow_mod_double (k := 1903) (e := 36) (m := 10 ^ 145) h36
      have he : 2 * 36 = 72 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h145 : (1903 : ℕ) ^ 145 % 10 ^ 145 = 6398941777114693433808100674295201794067494542570468908220098036638176931731763343612215996485140336583321966420459988810176540854369444842860143 := by
      have step := pow_mod_double_add_one (k := 1903) (e := 72) (m := 10 ^ 145) h72
      have he : 2 * 72 + 1 = 145 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h290 : (1903 : ℕ) ^ 290 % 10 ^ 145 = 1323572831977946915848151433997737561888778518746485216171689785664920948368933472376046120411592975758745313361882265000387480199754204657980449 := by
      have step := pow_mod_double (k := 1903) (e := 145) (m := 10 ^ 145) h145
      have he : 2 * 145 = 290 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h580 : (1903 : ℕ) ^ 580 % 10 ^ 145 = 3123685181860511885504293195703805897014419160469150021197179043873731322587052321785188103488721975639483305978017460807299378108053463266241601 := by
      have step := pow_mod_double (k := 1903) (e := 290) (m := 10 ^ 145) h290
      have he : 2 * 290 = 580 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h580
  rw [hmod]
  decide
private theorem cert_1903 : ExponentCertificate 1903 580 580 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1903
private theorem cert_1904 : ExponentCertificate 1904 581 580 := by decide
private theorem cert_1905 : ExponentCertificate 1905 581 580 := by decide
private theorem cert_1906 : ExponentCertificate 1906 581 581 := by decide
private theorem cert_1907 : ExponentCertificate 1907 582 581 := by decide
private theorem cert_1908 : ExponentCertificate 1908 582 581 := by decide
private theorem cert_1909 : ExponentCertificate 1909 582 581 := by decide
private theorem cert_1910 : ExponentCertificate 1910 582 582 := by decide
private theorem cert_1911 : ExponentCertificate 1911 583 582 := by decide
private theorem cert_1912 : ExponentCertificate 1912 583 582 := by decide
private theorem cert_1913 : ExponentCertificate 1913 583 582 := by decide
private theorem cert_1914 : ExponentCertificate 1914 583 583 := by decide
private theorem cert_1915 : ExponentCertificate 1915 584 583 := by decide
private theorem cert_1916 : ExponentCertificate 1916 584 583 := by decide
private theorem cert_1917 : ExponentCertificate 1917 584 583 := by decide
private theorem cert_1918 : ExponentCertificate 1918 584 584 := by decide
private theorem cert_1919 : ExponentCertificate 1919 585 584 := by decide
private theorem cert_1920 : ExponentCertificate 1920 585 584 := by decide
private theorem cert_1921 : ExponentCertificate 1921 585 585 := by decide
private theorem cert_1922 : ExponentCertificate 1922 586 585 := by decide
private theorem cert_1923 : ExponentCertificate 1923 586 585 := by decide
private theorem cert_1924 : ExponentCertificate 1924 586 585 := by decide
private theorem suffix_1925 : 586 < digitSum ((1925 : ℕ) ^ 586 % 10 ^ 147) := by
  have hmod : (1925 : ℕ) ^ 586 % 10 ^ 147 = 700648498233273907645102866228764783051994907808307334652772895975142436753348685649401646775971330967738327777372120408472255803644657135009765625 := by
    have h1 : (1925 : ℕ) ^ 1 % 10 ^ 147 = 1925 := by decide
    have h2 : (1925 : ℕ) ^ 2 % 10 ^ 147 = 3705625 := by
      have step := pow_mod_double (k := 1925) (e := 1) (m := 10 ^ 147) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1925 : ℕ) ^ 4 % 10 ^ 147 = 13731656640625 := by
      have step := pow_mod_double (k := 1925) (e := 2) (m := 10 ^ 147) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (1925 : ℕ) ^ 9 % 10 ^ 147 = 362974908634839771270751953125 := by
      have step := pow_mod_double_add_one (k := 1925) (e := 4) (m := 10 ^ 147) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (1925 : ℕ) ^ 18 % 10 ^ 147 = 131750784298470279546506001739835031912662088871002197265625 := by
      have step := pow_mod_double (k := 1925) (e := 9) (m := 10 ^ 147) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h36 : (1925 : ℕ) ^ 36 % 10 ^ 147 = 17358269163262042750987168152426697897911404187217314234987695006574024556207126723794686995461233891546726226806640625 := by
      have step := pow_mod_double (k := 1925) (e := 18) (m := 10 ^ 147) h18
      have he : 2 * 18 = 36 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h73 : (1925 : ℕ) ^ 73 % 10 ^ 147 = 266653547565304579015026922662687246902726020841114881709030290199177479388961859900323052118536306789105434777997771789159742183983325958251953125 := by
      have step := pow_mod_double_add_one (k := 1925) (e := 36) (m := 10 ^ 147) h36
      have he : 2 * 36 + 1 = 73 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h146 : (1925 : ℕ) ^ 146 % 10 ^ 147 = 771001163747335476287957034519989894377243944550607386790386301619551680969919056030091426465556881365511800174861178902574465610086917877197265625 := by
      have step := pow_mod_double (k := 1925) (e := 73) (m := 10 ^ 147) h73
      have he : 2 * 73 = 146 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h293 : (1925 : ℕ) ^ 293 % 10 ^ 147 = 318023818502221855946865783016889968040054264226439062594025396680984248018478010475530512145976929112432991797465575700698536820709705352783203125 := by
      have step := pow_mod_double_add_one (k := 1925) (e := 146) (m := 10 ^ 147) h146
      have he : 2 * 146 + 1 = 293 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h586 : (1925 : ℕ) ^ 586 % 10 ^ 147 = 700648498233273907645102866228764783051994907808307334652772895975142436753348685649401646775971330967738327777372120408472255803644657135009765625 := by
      have step := pow_mod_double (k := 1925) (e := 293) (m := 10 ^ 147) h293
      have he : 2 * 293 = 586 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h586
  rw [hmod]
  decide
private theorem cert_1925 : ExponentCertificate 1925 586 586 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1925
private theorem cert_1926 : ExponentCertificate 1926 587 586 := by decide
private theorem cert_1927 : ExponentCertificate 1927 587 586 := by decide
private theorem cert_1928 : ExponentCertificate 1928 587 586 := by decide
private theorem cert_1929 : ExponentCertificate 1929 587 587 := by decide
private theorem cert_1930 : ExponentCertificate 1930 588 587 := by decide
private theorem cert_1931 : ExponentCertificate 1931 588 587 := by decide
private theorem cert_1932 : ExponentCertificate 1932 588 587 := by decide
private theorem cert_1933 : ExponentCertificate 1933 588 588 := by decide
private theorem cert_1934 : ExponentCertificate 1934 589 588 := by decide
private theorem cert_1935 : ExponentCertificate 1935 589 588 := by decide
private theorem cert_1936 : ExponentCertificate 1936 589 589 := by decide
private theorem cert_1937 : ExponentCertificate 1937 589 589 := by decide
private theorem cert_1938 : ExponentCertificate 1938 590 589 := by decide
private theorem cert_1939 : ExponentCertificate 1939 590 589 := by decide
private theorem cert_1940 : ExponentCertificate 1940 590 590 := by decide
private theorem cert_1941 : ExponentCertificate 1941 591 590 := by decide
private theorem cert_1942 : ExponentCertificate 1942 591 590 := by decide
private theorem cert_1943 : ExponentCertificate 1943 591 590 := by decide
private theorem cert_1944 : ExponentCertificate 1944 591 591 := by decide
private theorem cert_1945 : ExponentCertificate 1945 592 591 := by decide
private theorem cert_1946 : ExponentCertificate 1946 592 591 := by decide
private theorem cert_1947 : ExponentCertificate 1947 592 591 := by decide
private theorem cert_1948 : ExponentCertificate 1948 592 592 := by decide
private theorem cert_1949 : ExponentCertificate 1949 593 592 := by decide
private theorem cert_1950 : ExponentCertificate 1950 593 592 := by decide
private theorem cert_1951 : ExponentCertificate 1951 593 592 := by decide
private theorem suffix_1952 : 593 < digitSum ((1952 : ℕ) ^ 593 % 10 ^ 149) := by
  have hmod : (1952 : ℕ) ^ 593 % 10 ^ 149 = 69595942138350460846844149226303194931512478754049791098041754763712061958657510198129203190897240523257948461643423976857135259578912433784217403392 := by
    have h1 : (1952 : ℕ) ^ 1 % 10 ^ 149 = 1952 := by decide
    have h2 : (1952 : ℕ) ^ 2 % 10 ^ 149 = 3810304 := by
      have step := pow_mod_double (k := 1952) (e := 1) (m := 10 ^ 149) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1952 : ℕ) ^ 4 % 10 ^ 149 = 14518416572416 := by
      have step := pow_mod_double (k := 1952) (e := 2) (m := 10 ^ 149) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (1952 : ℕ) ^ 9 % 10 ^ 149 = 411451187391437336963094413312 := by
      have step := pow_mod_double_add_one (k := 1952) (e := 4) (m := 10 ^ 149) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (1952 : ℕ) ^ 18 % 10 ^ 149 = 169292079605823683012391531869341122542215282616785482809344 := by
      have step := pow_mod_double (k := 1952) (e := 9) (m := 10 ^ 149) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h37 : (1952 : ℕ) ^ 37 % 10 ^ 149 = 55943945640100387889604522952434906956981441733989780473921294067153395792417208565703501150620241979413329904060042575872 := by
      have step := pow_mod_double_add_one (k := 1952) (e := 18) (m := 10 ^ 149) h18
      have he : 2 * 18 + 1 = 37 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h74 : (1952 : ℕ) ^ 74 % 10 ^ 149 = 95287590789769589135860936626692186853244692879867415585781635707039673168510742021284610071975073782746286228831999356497861621778063493344876560384 := by
      have step := pow_mod_double (k := 1952) (e := 37) (m := 10 ^ 149) h37
      have he : 2 * 37 = 74 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h148 : (1952 : ℕ) ^ 148 % 10 ^ 149 = 81268718560333248239042055311518535005860371339063900239794587242337076613127761764376439468053564544757897062554937879398016499340764526298798227456 := by
      have step := pow_mod_double (k := 1952) (e := 74) (m := 10 ^ 149) h74
      have he : 2 * 74 = 148 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h296 : (1952 : ℕ) ^ 296 % 10 ^ 149 = 89477521749328023695160423188642755342231618014257427601034308523748293949905634205449784111494324240286694328587070830529941874648432442847512231936 := by
      have step := pow_mod_double (k := 1952) (e := 148) (m := 10 ^ 149) h148
      have he : 2 * 148 = 296 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h593 : (1952 : ℕ) ^ 593 % 10 ^ 149 = 69595942138350460846844149226303194931512478754049791098041754763712061958657510198129203190897240523257948461643423976857135259578912433784217403392 := by
      have step := pow_mod_double_add_one (k := 1952) (e := 296) (m := 10 ^ 149) h296
      have he : 2 * 296 + 1 = 593 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h593
  rw [hmod]
  decide
private theorem cert_1952 : ExponentCertificate 1952 593 593 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1952
private theorem cert_1953 : ExponentCertificate 1953 594 593 := by decide
private theorem cert_1954 : ExponentCertificate 1954 594 593 := by decide
private theorem cert_1955 : ExponentCertificate 1955 594 594 := by decide
private theorem suffix_1956 : 594 < digitSum ((1956 : ℕ) ^ 594 % 10 ^ 149) := by
  have hmod : (1956 : ℕ) ^ 594 % 10 ^ 149 = 18625424321787632418216946457910170629239148467675796481120380130895050576961289158173397056933604714402595527664076433835250781748970350367050039296 := by
    have h1 : (1956 : ℕ) ^ 1 % 10 ^ 149 = 1956 := by decide
    have h2 : (1956 : ℕ) ^ 2 % 10 ^ 149 = 3825936 := by
      have step := pow_mod_double (k := 1956) (e := 1) (m := 10 ^ 149) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (1956 : ℕ) ^ 4 % 10 ^ 149 = 14637786276096 := by
      have step := pow_mod_double (k := 1956) (e := 2) (m := 10 ^ 149) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h9 : (1956 : ℕ) ^ 9 % 10 ^ 149 = 419101923498483572543798378496 := by
      have step := pow_mod_double_add_one (k := 1956) (e := 4) (m := 10 ^ 149) h4
      have he : 2 * 4 + 1 = 9 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h18 : (1956 : ℕ) ^ 18 % 10 ^ 149 = 175646422280128776922517676399939196232704811878878875222016 := by
      have step := pow_mod_double (k := 1956) (e := 9) (m := 10 ^ 149) h9
      have he : 2 * 9 = 18 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h37 : (1956 : ℕ) ^ 37 % 10 ^ 149 = 60345858030587027592017570596735859441028510058854739208566920052125233059778701920253282753258616661159348680957399924736 := by
      have step := pow_mod_double_add_one (k := 1956) (e := 18) (m := 10 ^ 149) h18
      have he : 2 * 18 + 1 = 37 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h74 : (1956 : ℕ) ^ 74 % 10 ^ 149 = 96496680724264548320605273229403279659741571952747988661398349189819542946815346211892671575206202676384612191559862092614482386176512844498464669696 := by
      have step := pow_mod_double (k := 1956) (e := 37) (m := 10 ^ 149) h37
      have he : 2 * 37 = 74 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h148 : (1956 : ℕ) ^ 148 % 10 ^ 149 = 71967190972164440177199845713452288827737580987510984099443870984968416431321581541857456511393526180483033125466999479939118523590177783142380732416 := by
      have step := pow_mod_double (k := 1956) (e := 74) (m := 10 ^ 149) h74
      have he : 2 * 74 = 148 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h297 : (1956 : ℕ) ^ 297 % 10 ^ 149 = 96243058453357186988085567513430249065448580104602948425200014836510035822879439141697162065860633773343032723450416257756774504202820183256293441536 := by
      have step := pow_mod_double_add_one (k := 1956) (e := 148) (m := 10 ^ 149) h148
      have he : 2 * 148 + 1 = 297 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h594 : (1956 : ℕ) ^ 594 % 10 ^ 149 = 18625424321787632418216946457910170629239148467675796481120380130895050576961289158173397056933604714402595527664076433835250781748970350367050039296 := by
      have step := pow_mod_double (k := 1956) (e := 297) (m := 10 ^ 149) h297
      have he : 2 * 297 = 594 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h594
  rw [hmod]
  decide
private theorem cert_1956 : ExponentCertificate 1956 594 594 :=
  exponentCertificate_of_suffix (by decide) (by decide) suffix_1956
private theorem cert_1957 : ExponentCertificate 1957 595 594 := by decide
private theorem cert_1958 : ExponentCertificate 1958 595 594 := by decide
private theorem cert_1959 : ExponentCertificate 1959 595 595 := by decide
private theorem cert_1960 : ExponentCertificate 1960 596 595 := by decide
private theorem cert_1961 : ExponentCertificate 1961 596 595 := by decide
private theorem cert_1962 : ExponentCertificate 1962 596 595 := by decide
private theorem cert_1963 : ExponentCertificate 1963 596 596 := by decide
private theorem cert_1964 : ExponentCertificate 1964 597 596 := by decide
private theorem cert_1965 : ExponentCertificate 1965 597 596 := by decide
private theorem cert_1966 : ExponentCertificate 1966 597 596 := by decide
private theorem cert_1967 : ExponentCertificate 1967 597 597 := by decide
private theorem cert_1968 : ExponentCertificate 1968 598 597 := by decide
private theorem cert_1969 : ExponentCertificate 1969 598 597 := by decide
private theorem cert_1970 : ExponentCertificate 1970 598 597 := by decide
private theorem cert_1971 : ExponentCertificate 1971 598 598 := by decide
private theorem cert_1972 : ExponentCertificate 1972 599 598 := by decide
private theorem cert_1973 : ExponentCertificate 1973 599 598 := by decide
private theorem cert_1974 : ExponentCertificate 1974 599 599 := by decide
private theorem cert_1975 : ExponentCertificate 1975 599 599 := by decide
private theorem cert_1976 : ExponentCertificate 1976 600 599 := by decide
private theorem cert_1977 : ExponentCertificate 1977 600 599 := by decide
private theorem cert_1978 : ExponentCertificate 1978 600 600 := by decide
private theorem cert_1979 : ExponentCertificate 1979 601 600 := by decide
private theorem cert_1980 : ExponentCertificate 1980 601 600 := by decide
private theorem cert_1981 : ExponentCertificate 1981 601 600 := by decide
private theorem cert_1982 : ExponentCertificate 1982 601 601 := by decide
private theorem cert_1983 : ExponentCertificate 1983 602 601 := by decide
private theorem cert_1984 : ExponentCertificate 1984 602 601 := by decide
private theorem cert_1985 : ExponentCertificate 1985 602 601 := by decide
private theorem cert_1986 : ExponentCertificate 1986 602 602 := by decide
private theorem cert_1987 : ExponentCertificate 1987 603 602 := by decide
private theorem cert_1988 : ExponentCertificate 1988 603 602 := by decide
private theorem cert_1989 : ExponentCertificate 1989 603 602 := by decide
private theorem cert_1990 : ExponentCertificate 1990 603 603 := by decide
private theorem cert_1991 : ExponentCertificate 1991 604 603 := by decide
private theorem cert_1992 : ExponentCertificate 1992 604 603 := by decide
private theorem cert_1993 : ExponentCertificate 1993 604 604 := by decide
private theorem cert_1994 : ExponentCertificate 1994 604 604 := by decide
private theorem cert_1995 : ExponentCertificate 1995 605 604 := by decide
private theorem cert_1996 : ExponentCertificate 1996 605 604 := by decide
private theorem cert_1997 : ExponentCertificate 1997 605 605 := by decide
private theorem cert_1998 : ExponentCertificate 1998 606 605 := by decide
private theorem cert_1999 : ExponentCertificate 1999 606 605 := by decide
private theorem cert_2000 : ExponentCertificate 2000 606 605 := by decide

private theorem certificates_1901_2000 {k : ℕ} (hlo : 1901 ≤ k) (hhi : k ≤ 2000) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨580, 579, cert_1901⟩
  · exact ⟨580, 580, cert_1902⟩
  · exact ⟨580, 580, cert_1903⟩
  · exact ⟨581, 580, cert_1904⟩
  · exact ⟨581, 580, cert_1905⟩
  · exact ⟨581, 581, cert_1906⟩
  · exact ⟨582, 581, cert_1907⟩
  · exact ⟨582, 581, cert_1908⟩
  · exact ⟨582, 581, cert_1909⟩
  · exact ⟨582, 582, cert_1910⟩
  · exact ⟨583, 582, cert_1911⟩
  · exact ⟨583, 582, cert_1912⟩
  · exact ⟨583, 582, cert_1913⟩
  · exact ⟨583, 583, cert_1914⟩
  · exact ⟨584, 583, cert_1915⟩
  · exact ⟨584, 583, cert_1916⟩
  · exact ⟨584, 583, cert_1917⟩
  · exact ⟨584, 584, cert_1918⟩
  · exact ⟨585, 584, cert_1919⟩
  · exact ⟨585, 584, cert_1920⟩
  · exact ⟨585, 585, cert_1921⟩
  · exact ⟨586, 585, cert_1922⟩
  · exact ⟨586, 585, cert_1923⟩
  · exact ⟨586, 585, cert_1924⟩
  · exact ⟨586, 586, cert_1925⟩
  · exact ⟨587, 586, cert_1926⟩
  · exact ⟨587, 586, cert_1927⟩
  · exact ⟨587, 586, cert_1928⟩
  · exact ⟨587, 587, cert_1929⟩
  · exact ⟨588, 587, cert_1930⟩
  · exact ⟨588, 587, cert_1931⟩
  · exact ⟨588, 587, cert_1932⟩
  · exact ⟨588, 588, cert_1933⟩
  · exact ⟨589, 588, cert_1934⟩
  · exact ⟨589, 588, cert_1935⟩
  · exact ⟨589, 589, cert_1936⟩
  · exact ⟨589, 589, cert_1937⟩
  · exact ⟨590, 589, cert_1938⟩
  · exact ⟨590, 589, cert_1939⟩
  · exact ⟨590, 590, cert_1940⟩
  · exact ⟨591, 590, cert_1941⟩
  · exact ⟨591, 590, cert_1942⟩
  · exact ⟨591, 590, cert_1943⟩
  · exact ⟨591, 591, cert_1944⟩
  · exact ⟨592, 591, cert_1945⟩
  · exact ⟨592, 591, cert_1946⟩
  · exact ⟨592, 591, cert_1947⟩
  · exact ⟨592, 592, cert_1948⟩
  · exact ⟨593, 592, cert_1949⟩
  · exact ⟨593, 592, cert_1950⟩
  · exact ⟨593, 592, cert_1951⟩
  · exact ⟨593, 593, cert_1952⟩
  · exact ⟨594, 593, cert_1953⟩
  · exact ⟨594, 593, cert_1954⟩
  · exact ⟨594, 594, cert_1955⟩
  · exact ⟨594, 594, cert_1956⟩
  · exact ⟨595, 594, cert_1957⟩
  · exact ⟨595, 594, cert_1958⟩
  · exact ⟨595, 595, cert_1959⟩
  · exact ⟨596, 595, cert_1960⟩
  · exact ⟨596, 595, cert_1961⟩
  · exact ⟨596, 595, cert_1962⟩
  · exact ⟨596, 596, cert_1963⟩
  · exact ⟨597, 596, cert_1964⟩
  · exact ⟨597, 596, cert_1965⟩
  · exact ⟨597, 596, cert_1966⟩
  · exact ⟨597, 597, cert_1967⟩
  · exact ⟨598, 597, cert_1968⟩
  · exact ⟨598, 597, cert_1969⟩
  · exact ⟨598, 597, cert_1970⟩
  · exact ⟨598, 598, cert_1971⟩
  · exact ⟨599, 598, cert_1972⟩
  · exact ⟨599, 598, cert_1973⟩
  · exact ⟨599, 599, cert_1974⟩
  · exact ⟨599, 599, cert_1975⟩
  · exact ⟨600, 599, cert_1976⟩
  · exact ⟨600, 599, cert_1977⟩
  · exact ⟨600, 600, cert_1978⟩
  · exact ⟨601, 600, cert_1979⟩
  · exact ⟨601, 600, cert_1980⟩
  · exact ⟨601, 600, cert_1981⟩
  · exact ⟨601, 601, cert_1982⟩
  · exact ⟨602, 601, cert_1983⟩
  · exact ⟨602, 601, cert_1984⟩
  · exact ⟨602, 601, cert_1985⟩
  · exact ⟨602, 602, cert_1986⟩
  · exact ⟨603, 602, cert_1987⟩
  · exact ⟨603, 602, cert_1988⟩
  · exact ⟨603, 602, cert_1989⟩
  · exact ⟨603, 603, cert_1990⟩
  · exact ⟨604, 603, cert_1991⟩
  · exact ⟨604, 603, cert_1992⟩
  · exact ⟨604, 604, cert_1993⟩
  · exact ⟨604, 604, cert_1994⟩
  · exact ⟨605, 604, cert_1995⟩
  · exact ⟨605, 604, cert_1996⟩
  · exact ⟨605, 605, cert_1997⟩
  · exact ⟨606, 605, cert_1998⟩
  · exact ⟨606, 605, cert_1999⟩
  · exact ⟨606, 605, cert_2000⟩

theorem no_fixed_digitCount_1901_2000 {n : ℕ} (hn : a n = n)
    (hlo : 1901 ≤ digitCount n) (hhi : digitCount n ≤ 2000) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_1901_2000 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_1901_2000
end OeisA113010
