import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 3001
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_2901 : ExponentCertificate 2901 838 837 := by decide
private theorem cert_2902 : ExponentCertificate 2902 838 838 := by decide
private theorem cert_2903 : ExponentCertificate 2903 839 838 := by decide
private theorem cert_2904 : ExponentCertificate 2904 839 838 := by decide
private theorem cert_2905 : ExponentCertificate 2905 839 838 := by decide
private theorem cert_2906 : ExponentCertificate 2906 839 839 := by decide
private theorem cert_2907 : ExponentCertificate 2907 840 839 := by decide
private theorem cert_2908 : ExponentCertificate 2908 840 839 := by decide
private theorem cert_2909 : ExponentCertificate 2909 840 839 := by decide
private theorem cert_2910 : ExponentCertificate 2910 840 840 := by decide
private theorem cert_2911 : ExponentCertificate 2911 841 840 := by decide
private theorem cert_2912 : ExponentCertificate 2912 841 840 := by decide
private theorem cert_2913 : ExponentCertificate 2913 841 840 := by decide
private theorem cert_2914 : ExponentCertificate 2914 841 841 := by decide
private theorem cert_2915 : ExponentCertificate 2915 842 841 := by decide
private theorem cert_2916 : ExponentCertificate 2916 842 841 := by decide
private theorem cert_2917 : ExponentCertificate 2917 842 841 := by decide
private theorem cert_2918 : ExponentCertificate 2918 842 842 := by decide
private theorem cert_2919 : ExponentCertificate 2919 843 842 := by decide
private theorem cert_2920 : ExponentCertificate 2920 843 842 := by decide
private theorem cert_2921 : ExponentCertificate 2921 843 842 := by decide
private theorem cert_2922 : ExponentCertificate 2922 843 843 := by decide
private theorem cert_2923 : ExponentCertificate 2923 844 843 := by decide
private theorem cert_2924 : ExponentCertificate 2924 844 843 := by decide
private theorem cert_2925 : ExponentCertificate 2925 844 843 := by decide
private theorem cert_2926 : ExponentCertificate 2926 844 844 := by decide
private theorem cert_2927 : ExponentCertificate 2927 845 844 := by decide
private theorem cert_2928 : ExponentCertificate 2928 845 844 := by decide
private theorem cert_2929 : ExponentCertificate 2929 845 844 := by decide
private theorem cert_2930 : ExponentCertificate 2930 845 845 := by decide
private theorem cert_2931 : ExponentCertificate 2931 846 845 := by decide
private theorem cert_2932 : ExponentCertificate 2932 846 845 := by decide
private theorem cert_2933 : ExponentCertificate 2933 846 845 := by decide
private theorem suffix_2934 : 846 < digitSum ((2934 : ℕ) ^ 846 % 10 ^ 212) := by
  have hmod : (2934 : ℕ) ^ 846 % 10 ^ 212 = 63508228904501020878127342757473080217008944757345691980750605772587263933178722861965225554347657407861900315674281760633393257323321131347336470494903215140487575185712765440870399836733519639914030653941743616 := by
    have h1 : (2934 : ℕ) ^ 1 % 10 ^ 212 = 2934 := by decide
    have h3 : (2934 : ℕ) ^ 3 % 10 ^ 212 = 25256916504 := by
      have step := pow_mod_double_add_one (k := 2934) (e := 1) (m := 10 ^ 212) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (2934 : ℕ) ^ 6 % 10 ^ 212 = 637911831290027582016 := by
      have step := pow_mod_double (k := 2934) (e := 3) (m := 10 ^ 212) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h13 : (2934 : ℕ) ^ 13 % 10 ^ 212 = 1193937034202403262110040268345287677835567104 := by
      have step := pow_mod_double_add_one (k := 2934) (e := 6) (m := 10 ^ 212) h6
      have he : 2 * 6 + 1 = 13 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h26 : (2934 : ℕ) ^ 26 % 10 ^ 212 = 1425485641640030656912139199730259378444481053017609756270457004577366122333727201286946816 := by
      have step := pow_mod_double (k := 2934) (e := 13) (m := 10 ^ 212) h13
      have he : 2 * 13 = 26 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h52 : (2934 : ℕ) ^ 52 % 10 ^ 212 = 2032009314521889903865742897404816071921729099302829801861407835927812772866700967801692572614702564530808464504841290826898660680112868074903396462688157627153420561422507212537856 := by
      have step := pow_mod_double (k := 2934) (e := 26) (m := 10 ^ 212) h26
      have he : 2 * 26 = 52 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h105 : (2934 : ℕ) ^ 105 % 10 ^ 212 = 45573571819323741814124553919020310354120303541793465935254727413328842372684067505651739538881873823488415169360585380920362472456437691718766693258328054383628910082861465862890890012101370200959499299847143424 := by
      have step := pow_mod_double_add_one (k := 2934) (e := 52) (m := 10 ^ 212) h52
      have he : 2 * 52 + 1 = 105 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h211 : (2934 : ℕ) ^ 211 % 10 ^ 212 = 39316222136402180205907377675413884659075350241191350902496131126847117913067320048528922390412682879805693359461328654704859283774388850275637016833848497687656979540110574114835599121809123086928877312786038784 := by
      have step := pow_mod_double_add_one (k := 2934) (e := 105) (m := 10 ^ 212) h105
      have he : 2 * 105 + 1 = 211 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h423 : (2934 : ℕ) ^ 423 % 10 ^ 212 = 35128649553756237669626901281308911727973558435847364216778811391529861065595321776317543413599352357153388662912300965905824580399618470690945419486457094167831642975569766298182531688072407747927741583750856704 := by
      have step := pow_mod_double_add_one (k := 2934) (e := 211) (m := 10 ^ 212) h211
      have he : 2 * 211 + 1 = 423 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h846 : (2934 : ℕ) ^ 846 % 10 ^ 212 = 63508228904501020878127342757473080217008944757345691980750605772587263933178722861965225554347657407861900315674281760633393257323321131347336470494903215140487575185712765440870399836733519639914030653941743616 := by
      have step := pow_mod_double (k := 2934) (e := 423) (m := 10 ^ 212) h423
      have he : 2 * 423 = 846 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h846
  rw [hmod]
  decide
private theorem cert_2934 : ExponentCertificate 2934 846 846 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2934) (by decide) (by decide) (by decide) suffix_2934
private theorem cert_2935 : ExponentCertificate 2935 847 846 := by decide
private theorem cert_2936 : ExponentCertificate 2936 847 846 := by decide
private theorem cert_2937 : ExponentCertificate 2937 847 846 := by decide
private theorem cert_2938 : ExponentCertificate 2938 847 847 := by decide
private theorem cert_2939 : ExponentCertificate 2939 848 847 := by decide
private theorem cert_2940 : ExponentCertificate 2940 848 847 := by decide
private theorem cert_2941 : ExponentCertificate 2941 848 847 := by decide
private theorem cert_2942 : ExponentCertificate 2942 848 848 := by decide
private theorem cert_2943 : ExponentCertificate 2943 849 848 := by decide
private theorem cert_2944 : ExponentCertificate 2944 849 848 := by decide
private theorem cert_2945 : ExponentCertificate 2945 849 848 := by decide
private theorem cert_2946 : ExponentCertificate 2946 849 849 := by decide
private theorem cert_2947 : ExponentCertificate 2947 850 849 := by decide
private theorem cert_2948 : ExponentCertificate 2948 850 849 := by decide
private theorem cert_2949 : ExponentCertificate 2949 850 849 := by decide
private theorem cert_2950 : ExponentCertificate 2950 850 850 := by decide
private theorem cert_2951 : ExponentCertificate 2951 851 850 := by decide
private theorem cert_2952 : ExponentCertificate 2952 851 850 := by decide
private theorem cert_2953 : ExponentCertificate 2953 851 850 := by decide
private theorem suffix_2954 : 851 < digitSum ((2954 : ℕ) ^ 851 % 10 ^ 213) := by
  have hmod : (2954 : ℕ) ^ 851 % 10 ^ 213 = 341078846784625246318032795888016859277246073319024209187575200442415611386579356121672173338232396139261365830898018732976440532431891864869473995878654696693612434227080207857941487036427129163857785685702344704 := by
    have h1 : (2954 : ℕ) ^ 1 % 10 ^ 213 = 2954 := by decide
    have h3 : (2954 : ℕ) ^ 3 % 10 ^ 213 = 25776946664 := by
      have step := pow_mod_double_add_one (k := 2954) (e := 1) (m := 10 ^ 213) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (2954 : ℕ) ^ 6 % 10 ^ 213 = 664450979318700728896 := by
      have step := pow_mod_double (k := 2954) (e := 3) (m := 10 ^ 213) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h13 : (2954 : ℕ) ^ 13 % 10 ^ 213 = 1304176536972532689910090579184050350425022464 := by
      have step := pow_mod_double_add_one (k := 2954) (e := 6) (m := 10 ^ 213) h6
      have he : 2 * 6 + 1 = 13 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h26 : (2954 : ℕ) ^ 26 % 10 ^ 213 = 1700876439589667926293227998956733383176912538383448408599449104191106878694768894904631296 := by
      have step := pow_mod_double (k := 2954) (e := 13) (m := 10 ^ 213) h13
      have he : 2 * 13 = 26 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h53 : (2954 : ℕ) ^ 53 % 10 ^ 213 = 8545864877767119496852685971870244245918583503178738886188578611789821103298440784481641320852813858931371190719857251534143391845151024839399104806429994659680870843695621741597425664 := by
      have step := pow_mod_double_add_one (k := 2954) (e := 26) (m := 10 ^ 213) h26
      have he : 2 * 26 + 1 = 53 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h106 : (2954 : ℕ) ^ 106 % 10 ^ 213 = 760808448806503610667052124583799890749375239931797838755782315244676557547822741518436933347045873988163076302754161722482382354809657008121478159622804384597878849038397412468044081516338065146376439472005840896 := by
      have step := pow_mod_double (k := 2954) (e := 53) (m := 10 ^ 213) h53
      have he : 2 * 53 = 106 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h212 : (2954 : ℕ) ^ 212 % 10 ^ 213 = 192326456884991587697401816241248426271545086745193409675926685692738085031791635562027669043972484743193675956596998581403026900050759202096968279641640427467338591138200420157370298378802057903612527940066082816 := by
      have step := pow_mod_double (k := 2954) (e := 106) (m := 10 ^ 213) h106
      have he : 2 * 106 = 212 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h425 : (2954 : ℕ) ^ 425 % 10 ^ 213 = 765460245647806032558808428924050278147536410282977598409637356023176089164826590506226296190004374318260120000275408696380366277698784386047835269218945374463598528310798974257075571898004646774017304857227034624 := by
      have step := pow_mod_double_add_one (k := 2954) (e := 212) (m := 10 ^ 213) h212
      have he : 2 * 212 + 1 = 425 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h851 : (2954 : ℕ) ^ 851 % 10 ^ 213 = 341078846784625246318032795888016859277246073319024209187575200442415611386579356121672173338232396139261365830898018732976440532431891864869473995878654696693612434227080207857941487036427129163857785685702344704 := by
      have step := pow_mod_double_add_one (k := 2954) (e := 425) (m := 10 ^ 213) h425
      have he : 2 * 425 + 1 = 851 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h851
  rw [hmod]
  decide
private theorem cert_2954 : ExponentCertificate 2954 851 851 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2954) (by decide) (by decide) (by decide) suffix_2954
private theorem cert_2955 : ExponentCertificate 2955 852 851 := by decide
private theorem cert_2956 : ExponentCertificate 2956 852 851 := by decide
private theorem cert_2957 : ExponentCertificate 2957 852 851 := by decide
private theorem cert_2958 : ExponentCertificate 2958 852 852 := by decide
private theorem cert_2959 : ExponentCertificate 2959 853 852 := by decide
private theorem cert_2960 : ExponentCertificate 2960 853 852 := by decide
private theorem cert_2961 : ExponentCertificate 2961 853 852 := by decide
private theorem cert_2962 : ExponentCertificate 2962 853 853 := by decide
private theorem cert_2963 : ExponentCertificate 2963 854 853 := by decide
private theorem cert_2964 : ExponentCertificate 2964 854 853 := by decide
private theorem cert_2965 : ExponentCertificate 2965 854 853 := by decide
private theorem cert_2966 : ExponentCertificate 2966 854 854 := by decide
private theorem cert_2967 : ExponentCertificate 2967 855 854 := by decide
private theorem cert_2968 : ExponentCertificate 2968 855 854 := by decide
private theorem cert_2969 : ExponentCertificate 2969 855 854 := by decide
private theorem suffix_2970 : 855 < digitSum ((297 : ℕ) ^ 855 % 10 ^ 214) := by
  have hmod : (297 : ℕ) ^ 855 % 10 ^ 214 = 5229421919440645878243181897185129999081770078741184870910549109493486178311973345109964325172526959863371602856241743116774059804840929672128032773535241653041746289746253005911609991921664043629125950553613995993 := by
    have h1 : (297 : ℕ) ^ 1 % 10 ^ 214 = 297 := by decide
    have h3 : (297 : ℕ) ^ 3 % 10 ^ 214 = 26198073 := by
      have step := pow_mod_double_add_one (k := 297) (e := 1) (m := 10 ^ 214) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (297 : ℕ) ^ 6 % 10 ^ 214 = 686339028913329 := by
      have step := pow_mod_double (k := 297) (e := 3) (m := 10 ^ 214) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h13 : (297 : ℕ) ^ 13 % 10 ^ 214 = 139905194995078363929650377085577 := by
      have step := pow_mod_double_add_one (k := 297) (e := 6) (m := 10 ^ 214) h6
      have he : 2 * 6 + 1 = 13 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h26 : (297 : ℕ) ^ 26 % 10 ^ 214 = 19573463586610900091741627077571330223423167756257509632381422929 := by
      have step := pow_mod_double (k := 297) (e := 13) (m := 10 ^ 214) h13
      have he : 2 * 13 = 26 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h53 : (297 : ℕ) ^ 53 % 10 ^ 214 = 113786781602585703716753785452261722219609371959272972035094996160652137317907089240916132379695166646905872157808600948909780895177 := by
      have step := pow_mod_double_add_one (k := 297) (e := 26) (m := 10 ^ 214) h26
      have he : 2 * 26 + 1 = 53 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h106 : (297 : ℕ) ^ 106 % 10 ^ 214 = 9564378874842261600695615060856210996215815112529993632996370877721397250088442986380153182955394132440522349934130987050316807477669581921155982113345565853779276199379576292280863084557867030522932821063461861329 := by
      have step := pow_mod_double (k := 297) (e := 53) (m := 10 ^ 214) h53
      have he : 2 * 53 = 106 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h213 : (297 : ℕ) ^ 213 % 10 ^ 214 = 9955913019335176965579851799029109508775554200715256622858024055560696961515986306447377809365466867725003740435221765323778903274040243645246290301859387441464627981171041679528505506377764362898920218344016933577 := by
      have step := pow_mod_double_add_one (k := 297) (e := 106) (m := 10 ^ 214) h106
      have he : 2 * 106 + 1 = 213 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h427 : (297 : ℕ) ^ 427 % 10 ^ 214 = 8472356853525606937087159168021031858737260208649353026923348011934751396944774106695914143191266029550945244470380376769845915440750393025569177365546142780686922425009991734657872249157184781897937437442914433913 := by
      have step := pow_mod_double_add_one (k := 297) (e := 213) (m := 10 ^ 214) h213
      have he : 2 * 213 + 1 = 427 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h855 : (297 : ℕ) ^ 855 % 10 ^ 214 = 5229421919440645878243181897185129999081770078741184870910549109493486178311973345109964325172526959863371602856241743116774059804840929672128032773535241653041746289746253005911609991921664043629125950553613995993 := by
      have step := pow_mod_double_add_one (k := 297) (e := 427) (m := 10 ^ 214) h427
      have he : 2 * 427 + 1 = 855 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h855
  rw [hmod]
  decide
private theorem cert_2970 : ExponentCertificate 2970 855 855 :=
  exponentCertificate_of_normalized_suffix (t := 1) (u := 297) (by decide) (by decide) (by decide) suffix_2970
private theorem cert_2971 : ExponentCertificate 2971 856 855 := by decide
private theorem cert_2972 : ExponentCertificate 2972 856 855 := by decide
private theorem cert_2973 : ExponentCertificate 2973 856 855 := by decide
private theorem cert_2974 : ExponentCertificate 2974 856 856 := by decide
private theorem cert_2975 : ExponentCertificate 2975 857 856 := by decide
private theorem cert_2976 : ExponentCertificate 2976 857 856 := by decide
private theorem cert_2977 : ExponentCertificate 2977 857 856 := by decide
private theorem cert_2978 : ExponentCertificate 2978 857 857 := by decide
private theorem cert_2979 : ExponentCertificate 2979 858 857 := by decide
private theorem cert_2980 : ExponentCertificate 2980 858 857 := by decide
private theorem cert_2981 : ExponentCertificate 2981 858 857 := by decide
private theorem cert_2982 : ExponentCertificate 2982 858 858 := by decide
private theorem cert_2983 : ExponentCertificate 2983 859 858 := by decide
private theorem cert_2984 : ExponentCertificate 2984 859 858 := by decide
private theorem cert_2985 : ExponentCertificate 2985 859 859 := by decide
private theorem cert_2986 : ExponentCertificate 2986 859 859 := by decide
private theorem cert_2987 : ExponentCertificate 2987 860 859 := by decide
private theorem cert_2988 : ExponentCertificate 2988 860 859 := by decide
private theorem cert_2989 : ExponentCertificate 2989 860 860 := by decide
private theorem cert_2990 : ExponentCertificate 2990 860 860 := by decide
private theorem cert_2991 : ExponentCertificate 2991 861 860 := by decide
private theorem cert_2992 : ExponentCertificate 2992 861 860 := by decide
private theorem cert_2993 : ExponentCertificate 2993 861 861 := by decide
private theorem cert_2994 : ExponentCertificate 2994 861 861 := by decide
private theorem cert_2995 : ExponentCertificate 2995 862 861 := by decide
private theorem cert_2996 : ExponentCertificate 2996 862 861 := by decide
private theorem cert_2997 : ExponentCertificate 2997 862 862 := by decide
private theorem cert_2998 : ExponentCertificate 2998 862 862 := by decide
private theorem cert_2999 : ExponentCertificate 2999 863 862 := by decide
private theorem cert_3000 : ExponentCertificate 3000 863 862 := by decide

private theorem certificates_2901_3000 {k : ℕ} (hlo : 2901 ≤ k) (hhi : k ≤ 3000) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨838, 837, cert_2901⟩
  · exact ⟨838, 838, cert_2902⟩
  · exact ⟨839, 838, cert_2903⟩
  · exact ⟨839, 838, cert_2904⟩
  · exact ⟨839, 838, cert_2905⟩
  · exact ⟨839, 839, cert_2906⟩
  · exact ⟨840, 839, cert_2907⟩
  · exact ⟨840, 839, cert_2908⟩
  · exact ⟨840, 839, cert_2909⟩
  · exact ⟨840, 840, cert_2910⟩
  · exact ⟨841, 840, cert_2911⟩
  · exact ⟨841, 840, cert_2912⟩
  · exact ⟨841, 840, cert_2913⟩
  · exact ⟨841, 841, cert_2914⟩
  · exact ⟨842, 841, cert_2915⟩
  · exact ⟨842, 841, cert_2916⟩
  · exact ⟨842, 841, cert_2917⟩
  · exact ⟨842, 842, cert_2918⟩
  · exact ⟨843, 842, cert_2919⟩
  · exact ⟨843, 842, cert_2920⟩
  · exact ⟨843, 842, cert_2921⟩
  · exact ⟨843, 843, cert_2922⟩
  · exact ⟨844, 843, cert_2923⟩
  · exact ⟨844, 843, cert_2924⟩
  · exact ⟨844, 843, cert_2925⟩
  · exact ⟨844, 844, cert_2926⟩
  · exact ⟨845, 844, cert_2927⟩
  · exact ⟨845, 844, cert_2928⟩
  · exact ⟨845, 844, cert_2929⟩
  · exact ⟨845, 845, cert_2930⟩
  · exact ⟨846, 845, cert_2931⟩
  · exact ⟨846, 845, cert_2932⟩
  · exact ⟨846, 845, cert_2933⟩
  · exact ⟨846, 846, cert_2934⟩
  · exact ⟨847, 846, cert_2935⟩
  · exact ⟨847, 846, cert_2936⟩
  · exact ⟨847, 846, cert_2937⟩
  · exact ⟨847, 847, cert_2938⟩
  · exact ⟨848, 847, cert_2939⟩
  · exact ⟨848, 847, cert_2940⟩
  · exact ⟨848, 847, cert_2941⟩
  · exact ⟨848, 848, cert_2942⟩
  · exact ⟨849, 848, cert_2943⟩
  · exact ⟨849, 848, cert_2944⟩
  · exact ⟨849, 848, cert_2945⟩
  · exact ⟨849, 849, cert_2946⟩
  · exact ⟨850, 849, cert_2947⟩
  · exact ⟨850, 849, cert_2948⟩
  · exact ⟨850, 849, cert_2949⟩
  · exact ⟨850, 850, cert_2950⟩
  · exact ⟨851, 850, cert_2951⟩
  · exact ⟨851, 850, cert_2952⟩
  · exact ⟨851, 850, cert_2953⟩
  · exact ⟨851, 851, cert_2954⟩
  · exact ⟨852, 851, cert_2955⟩
  · exact ⟨852, 851, cert_2956⟩
  · exact ⟨852, 851, cert_2957⟩
  · exact ⟨852, 852, cert_2958⟩
  · exact ⟨853, 852, cert_2959⟩
  · exact ⟨853, 852, cert_2960⟩
  · exact ⟨853, 852, cert_2961⟩
  · exact ⟨853, 853, cert_2962⟩
  · exact ⟨854, 853, cert_2963⟩
  · exact ⟨854, 853, cert_2964⟩
  · exact ⟨854, 853, cert_2965⟩
  · exact ⟨854, 854, cert_2966⟩
  · exact ⟨855, 854, cert_2967⟩
  · exact ⟨855, 854, cert_2968⟩
  · exact ⟨855, 854, cert_2969⟩
  · exact ⟨855, 855, cert_2970⟩
  · exact ⟨856, 855, cert_2971⟩
  · exact ⟨856, 855, cert_2972⟩
  · exact ⟨856, 855, cert_2973⟩
  · exact ⟨856, 856, cert_2974⟩
  · exact ⟨857, 856, cert_2975⟩
  · exact ⟨857, 856, cert_2976⟩
  · exact ⟨857, 856, cert_2977⟩
  · exact ⟨857, 857, cert_2978⟩
  · exact ⟨858, 857, cert_2979⟩
  · exact ⟨858, 857, cert_2980⟩
  · exact ⟨858, 857, cert_2981⟩
  · exact ⟨858, 858, cert_2982⟩
  · exact ⟨859, 858, cert_2983⟩
  · exact ⟨859, 858, cert_2984⟩
  · exact ⟨859, 859, cert_2985⟩
  · exact ⟨859, 859, cert_2986⟩
  · exact ⟨860, 859, cert_2987⟩
  · exact ⟨860, 859, cert_2988⟩
  · exact ⟨860, 860, cert_2989⟩
  · exact ⟨860, 860, cert_2990⟩
  · exact ⟨861, 860, cert_2991⟩
  · exact ⟨861, 860, cert_2992⟩
  · exact ⟨861, 861, cert_2993⟩
  · exact ⟨861, 861, cert_2994⟩
  · exact ⟨862, 861, cert_2995⟩
  · exact ⟨862, 861, cert_2996⟩
  · exact ⟨862, 862, cert_2997⟩
  · exact ⟨862, 862, cert_2998⟩
  · exact ⟨863, 862, cert_2999⟩
  · exact ⟨863, 862, cert_3000⟩

theorem no_fixed_digitCount_2901_3000 {n : ℕ} (hn : a n = n)
    (hlo : 2901 ≤ digitCount n) (hhi : digitCount n ≤ 3000) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_2901_3000 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_2901_3000
end OeisA113010
