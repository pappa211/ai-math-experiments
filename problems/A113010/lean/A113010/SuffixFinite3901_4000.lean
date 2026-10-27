import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 4001
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_3901 : ExponentCertificate 3901 1086 1086 := by decide
private theorem cert_3902 : ExponentCertificate 3902 1087 1086 := by decide
private theorem cert_3903 : ExponentCertificate 3903 1087 1086 := by decide
private theorem suffix_3904 : 1087 < digitSum ((3904 : ℕ) ^ 1087 % 10 ^ 272) := by
  have hmod : (3904 : ℕ) ^ 1087 % 10 ^ 272 = 62276991289551038413004700840018018805763055728483200619527517203151212378909563923337543969585060074537934616411711593498994030439179508305456987671475442967970933708695175343112357783812942111442069093352404328434982046507621378165612570701741391132238453001272724291584 := by
    have h1 : (3904 : ℕ) ^ 1 % 10 ^ 272 = 3904 := by decide
    have h2 : (3904 : ℕ) ^ 2 % 10 ^ 272 = 15241216 := by
      have step := pow_mod_double (k := 3904) (e := 1) (m := 10 ^ 272) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (3904 : ℕ) ^ 4 % 10 ^ 272 = 232294665158656 := by
      have step := pow_mod_double (k := 3904) (e := 2) (m := 10 ^ 272) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (3904 : ℕ) ^ 8 % 10 ^ 272 = 53960811461172109765651726336 := by
      have step := pow_mod_double (k := 3904) (e := 4) (m := 10 ^ 272) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h16 : (3904 : ℕ) ^ 16 % 10 ^ 272 = 2911769173548163319750889018983561365950491289297035984896 := by
      have step := pow_mod_double (k := 3904) (e := 8) (m := 10 ^ 272) h8
      have he : 2 * 8 = 16 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h33 : (3904 : ℕ) ^ 33 % 10 ^ 272 = 33099672506978982178954694917148532746518753948196016525277391311811295415820662144700569754186908711096277833470705664 := by
      have step := pow_mod_double_add_one (k := 3904) (e := 16) (m := 10 ^ 272) h16
      have he : 2 * 16 + 1 = 33 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h67 : (3904 : ℕ) ^ 67 % 10 ^ 272 = 4277176801550392207538749862854271409103038221409011086401043827520841106350693389837184312276082007950191368769620786394962140958611734831514463811920743828849757534799273479522880564796318783546615207036879453463075809947290804059042217984 := by
      have step := pow_mod_double_add_one (k := 3904) (e := 33) (m := 10 ^ 272) h33
      have he : 2 * 33 + 1 = 67 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h135 : (3904 : ℕ) ^ 135 % 10 ^ 272 = 90391231547052746898845145149388907334861654510766348341508909740047439927582647296924537393227495702643245661483310725169165003415132098689180155741049069364477801749626537931975148110807520174041301695981735373158345824447844230658892235266424231260961815339555486695424 := by
      have step := pow_mod_double_add_one (k := 3904) (e := 67) (m := 10 ^ 272) h67
      have he : 2 * 67 + 1 = 135 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h271 : (3904 : ℕ) ^ 271 % 10 ^ 272 = 6459601661496870878753588968204970934469912817765376694499653958078042422609349601391598974298954930869761161035077438717030602857754314496583666162487980687520765063124502327709432052941808710683399561621284646798189540678043372542385810399768188662992778855698875285504 := by
      have step := pow_mod_double_add_one (k := 3904) (e := 135) (m := 10 ^ 272) h135
      have he : 2 * 135 + 1 = 271 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h543 : (3904 : ℕ) ^ 543 % 10 ^ 272 = 65952660519076484430051346278242906412712585307877775270308631166447133524050909139801737983512329740261340470037009532104341499679621563626463862938930938386220105190142920260440023422797837160218332165322334910540324171441413919575302239713577149827272462473488932798464 := by
      have step := pow_mod_double_add_one (k := 3904) (e := 271) (m := 10 ^ 272) h271
      have he : 2 * 271 + 1 = 543 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1087 : (3904 : ℕ) ^ 1087 % 10 ^ 272 = 62276991289551038413004700840018018805763055728483200619527517203151212378909563923337543969585060074537934616411711593498994030439179508305456987671475442967970933708695175343112357783812942111442069093352404328434982046507621378165612570701741391132238453001272724291584 := by
      have step := pow_mod_double_add_one (k := 3904) (e := 543) (m := 10 ^ 272) h543
      have he : 2 * 543 + 1 = 1087 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1087
  rw [hmod]
  decide
private theorem cert_3904 : ExponentCertificate 3904 1087 1087 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 3904) (by decide) (by decide) (by decide) suffix_3904
private theorem cert_3905 : ExponentCertificate 3905 1087 1087 := by decide
private theorem cert_3906 : ExponentCertificate 3906 1088 1087 := by decide
private theorem cert_3907 : ExponentCertificate 3907 1088 1087 := by decide
private theorem cert_3908 : ExponentCertificate 3908 1088 1087 := by decide
private theorem cert_3909 : ExponentCertificate 3909 1088 1088 := by decide
private theorem cert_3910 : ExponentCertificate 3910 1089 1088 := by decide
private theorem cert_3911 : ExponentCertificate 3911 1089 1088 := by decide
private theorem cert_3912 : ExponentCertificate 3912 1089 1088 := by decide
private theorem cert_3913 : ExponentCertificate 3913 1089 1089 := by decide
private theorem cert_3914 : ExponentCertificate 3914 1090 1089 := by decide
private theorem cert_3915 : ExponentCertificate 3915 1090 1089 := by decide
private theorem cert_3916 : ExponentCertificate 3916 1090 1089 := by decide
private theorem cert_3917 : ExponentCertificate 3917 1090 1090 := by decide
private theorem cert_3918 : ExponentCertificate 3918 1091 1090 := by decide
private theorem cert_3919 : ExponentCertificate 3919 1091 1090 := by decide
private theorem cert_3920 : ExponentCertificate 3920 1091 1090 := by decide
private theorem cert_3921 : ExponentCertificate 3921 1091 1091 := by decide
private theorem cert_3922 : ExponentCertificate 3922 1092 1091 := by decide
private theorem cert_3923 : ExponentCertificate 3923 1092 1091 := by decide
private theorem cert_3924 : ExponentCertificate 3924 1092 1091 := by decide
private theorem cert_3925 : ExponentCertificate 3925 1092 1092 := by decide
private theorem cert_3926 : ExponentCertificate 3926 1093 1092 := by decide
private theorem cert_3927 : ExponentCertificate 3927 1093 1092 := by decide
private theorem cert_3928 : ExponentCertificate 3928 1093 1092 := by decide
private theorem cert_3929 : ExponentCertificate 3929 1093 1093 := by decide
private theorem cert_3930 : ExponentCertificate 3930 1094 1093 := by decide
private theorem cert_3931 : ExponentCertificate 3931 1094 1093 := by decide
private theorem cert_3932 : ExponentCertificate 3932 1094 1093 := by decide
private theorem cert_3933 : ExponentCertificate 3933 1094 1094 := by decide
private theorem cert_3934 : ExponentCertificate 3934 1095 1094 := by decide
private theorem cert_3935 : ExponentCertificate 3935 1095 1094 := by decide
private theorem cert_3936 : ExponentCertificate 3936 1095 1094 := by decide
private theorem cert_3937 : ExponentCertificate 3937 1095 1095 := by decide
private theorem cert_3938 : ExponentCertificate 3938 1096 1095 := by decide
private theorem cert_3939 : ExponentCertificate 3939 1096 1095 := by decide
private theorem cert_3940 : ExponentCertificate 3940 1096 1095 := by decide
private theorem cert_3941 : ExponentCertificate 3941 1096 1096 := by decide
private theorem cert_3942 : ExponentCertificate 3942 1097 1096 := by decide
private theorem cert_3943 : ExponentCertificate 3943 1097 1096 := by decide
private theorem cert_3944 : ExponentCertificate 3944 1097 1096 := by decide
private theorem cert_3945 : ExponentCertificate 3945 1097 1097 := by decide
private theorem cert_3946 : ExponentCertificate 3946 1098 1097 := by decide
private theorem cert_3947 : ExponentCertificate 3947 1098 1097 := by decide
private theorem cert_3948 : ExponentCertificate 3948 1098 1097 := by decide
private theorem cert_3949 : ExponentCertificate 3949 1098 1098 := by decide
private theorem cert_3950 : ExponentCertificate 3950 1098 1098 := by decide
private theorem cert_3951 : ExponentCertificate 3951 1099 1098 := by decide
private theorem cert_3952 : ExponentCertificate 3952 1099 1098 := by decide
private theorem cert_3953 : ExponentCertificate 3953 1099 1098 := by decide
private theorem cert_3954 : ExponentCertificate 3954 1099 1099 := by decide
private theorem cert_3955 : ExponentCertificate 3955 1100 1099 := by decide
private theorem cert_3956 : ExponentCertificate 3956 1100 1099 := by decide
private theorem cert_3957 : ExponentCertificate 3957 1100 1099 := by decide
private theorem cert_3958 : ExponentCertificate 3958 1100 1100 := by decide
private theorem cert_3959 : ExponentCertificate 3959 1101 1100 := by decide
private theorem cert_3960 : ExponentCertificate 3960 1101 1100 := by decide
private theorem cert_3961 : ExponentCertificate 3961 1101 1100 := by decide
private theorem cert_3962 : ExponentCertificate 3962 1101 1101 := by decide
private theorem cert_3963 : ExponentCertificate 3963 1102 1101 := by decide
private theorem cert_3964 : ExponentCertificate 3964 1102 1101 := by decide
private theorem cert_3965 : ExponentCertificate 3965 1102 1101 := by decide
private theorem cert_3966 : ExponentCertificate 3966 1102 1102 := by decide
private theorem cert_3967 : ExponentCertificate 3967 1103 1102 := by decide
private theorem cert_3968 : ExponentCertificate 3968 1103 1102 := by decide
private theorem cert_3969 : ExponentCertificate 3969 1103 1102 := by decide
private theorem cert_3970 : ExponentCertificate 3970 1103 1103 := by decide
private theorem cert_3971 : ExponentCertificate 3971 1104 1103 := by decide
private theorem cert_3972 : ExponentCertificate 3972 1104 1103 := by decide
private theorem cert_3973 : ExponentCertificate 3973 1104 1103 := by decide
private theorem cert_3974 : ExponentCertificate 3974 1104 1104 := by decide
private theorem cert_3975 : ExponentCertificate 3975 1105 1104 := by decide
private theorem cert_3976 : ExponentCertificate 3976 1105 1104 := by decide
private theorem cert_3977 : ExponentCertificate 3977 1105 1104 := by decide
private theorem cert_3978 : ExponentCertificate 3978 1105 1105 := by decide
private theorem cert_3979 : ExponentCertificate 3979 1106 1105 := by decide
private theorem cert_3980 : ExponentCertificate 3980 1106 1105 := by decide
private theorem cert_3981 : ExponentCertificate 3981 1106 1105 := by decide
private theorem cert_3982 : ExponentCertificate 3982 1106 1106 := by decide
private theorem cert_3983 : ExponentCertificate 3983 1107 1106 := by decide
private theorem cert_3984 : ExponentCertificate 3984 1107 1106 := by decide
private theorem cert_3985 : ExponentCertificate 3985 1107 1106 := by decide
private theorem cert_3986 : ExponentCertificate 3986 1107 1107 := by decide
private theorem cert_3987 : ExponentCertificate 3987 1108 1107 := by decide
private theorem cert_3988 : ExponentCertificate 3988 1108 1107 := by decide
private theorem cert_3989 : ExponentCertificate 3989 1108 1107 := by decide
private theorem cert_3990 : ExponentCertificate 3990 1108 1108 := by decide
private theorem cert_3991 : ExponentCertificate 3991 1109 1108 := by decide
private theorem cert_3992 : ExponentCertificate 3992 1109 1108 := by decide
private theorem cert_3993 : ExponentCertificate 3993 1109 1108 := by decide
private theorem cert_3994 : ExponentCertificate 3994 1109 1109 := by decide
private theorem cert_3995 : ExponentCertificate 3995 1109 1109 := by decide
private theorem cert_3996 : ExponentCertificate 3996 1110 1109 := by decide
private theorem cert_3997 : ExponentCertificate 3997 1110 1109 := by decide
private theorem cert_3998 : ExponentCertificate 3998 1110 1109 := by decide
private theorem cert_3999 : ExponentCertificate 3999 1110 1110 := by decide
private theorem cert_4000 : ExponentCertificate 4000 1111 1110 := by decide

private theorem certificates_3901_4000 {k : ℕ} (hlo : 3901 ≤ k) (hhi : k ≤ 4000) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1086, 1086, cert_3901⟩
  · exact ⟨1087, 1086, cert_3902⟩
  · exact ⟨1087, 1086, cert_3903⟩
  · exact ⟨1087, 1087, cert_3904⟩
  · exact ⟨1087, 1087, cert_3905⟩
  · exact ⟨1088, 1087, cert_3906⟩
  · exact ⟨1088, 1087, cert_3907⟩
  · exact ⟨1088, 1087, cert_3908⟩
  · exact ⟨1088, 1088, cert_3909⟩
  · exact ⟨1089, 1088, cert_3910⟩
  · exact ⟨1089, 1088, cert_3911⟩
  · exact ⟨1089, 1088, cert_3912⟩
  · exact ⟨1089, 1089, cert_3913⟩
  · exact ⟨1090, 1089, cert_3914⟩
  · exact ⟨1090, 1089, cert_3915⟩
  · exact ⟨1090, 1089, cert_3916⟩
  · exact ⟨1090, 1090, cert_3917⟩
  · exact ⟨1091, 1090, cert_3918⟩
  · exact ⟨1091, 1090, cert_3919⟩
  · exact ⟨1091, 1090, cert_3920⟩
  · exact ⟨1091, 1091, cert_3921⟩
  · exact ⟨1092, 1091, cert_3922⟩
  · exact ⟨1092, 1091, cert_3923⟩
  · exact ⟨1092, 1091, cert_3924⟩
  · exact ⟨1092, 1092, cert_3925⟩
  · exact ⟨1093, 1092, cert_3926⟩
  · exact ⟨1093, 1092, cert_3927⟩
  · exact ⟨1093, 1092, cert_3928⟩
  · exact ⟨1093, 1093, cert_3929⟩
  · exact ⟨1094, 1093, cert_3930⟩
  · exact ⟨1094, 1093, cert_3931⟩
  · exact ⟨1094, 1093, cert_3932⟩
  · exact ⟨1094, 1094, cert_3933⟩
  · exact ⟨1095, 1094, cert_3934⟩
  · exact ⟨1095, 1094, cert_3935⟩
  · exact ⟨1095, 1094, cert_3936⟩
  · exact ⟨1095, 1095, cert_3937⟩
  · exact ⟨1096, 1095, cert_3938⟩
  · exact ⟨1096, 1095, cert_3939⟩
  · exact ⟨1096, 1095, cert_3940⟩
  · exact ⟨1096, 1096, cert_3941⟩
  · exact ⟨1097, 1096, cert_3942⟩
  · exact ⟨1097, 1096, cert_3943⟩
  · exact ⟨1097, 1096, cert_3944⟩
  · exact ⟨1097, 1097, cert_3945⟩
  · exact ⟨1098, 1097, cert_3946⟩
  · exact ⟨1098, 1097, cert_3947⟩
  · exact ⟨1098, 1097, cert_3948⟩
  · exact ⟨1098, 1098, cert_3949⟩
  · exact ⟨1098, 1098, cert_3950⟩
  · exact ⟨1099, 1098, cert_3951⟩
  · exact ⟨1099, 1098, cert_3952⟩
  · exact ⟨1099, 1098, cert_3953⟩
  · exact ⟨1099, 1099, cert_3954⟩
  · exact ⟨1100, 1099, cert_3955⟩
  · exact ⟨1100, 1099, cert_3956⟩
  · exact ⟨1100, 1099, cert_3957⟩
  · exact ⟨1100, 1100, cert_3958⟩
  · exact ⟨1101, 1100, cert_3959⟩
  · exact ⟨1101, 1100, cert_3960⟩
  · exact ⟨1101, 1100, cert_3961⟩
  · exact ⟨1101, 1101, cert_3962⟩
  · exact ⟨1102, 1101, cert_3963⟩
  · exact ⟨1102, 1101, cert_3964⟩
  · exact ⟨1102, 1101, cert_3965⟩
  · exact ⟨1102, 1102, cert_3966⟩
  · exact ⟨1103, 1102, cert_3967⟩
  · exact ⟨1103, 1102, cert_3968⟩
  · exact ⟨1103, 1102, cert_3969⟩
  · exact ⟨1103, 1103, cert_3970⟩
  · exact ⟨1104, 1103, cert_3971⟩
  · exact ⟨1104, 1103, cert_3972⟩
  · exact ⟨1104, 1103, cert_3973⟩
  · exact ⟨1104, 1104, cert_3974⟩
  · exact ⟨1105, 1104, cert_3975⟩
  · exact ⟨1105, 1104, cert_3976⟩
  · exact ⟨1105, 1104, cert_3977⟩
  · exact ⟨1105, 1105, cert_3978⟩
  · exact ⟨1106, 1105, cert_3979⟩
  · exact ⟨1106, 1105, cert_3980⟩
  · exact ⟨1106, 1105, cert_3981⟩
  · exact ⟨1106, 1106, cert_3982⟩
  · exact ⟨1107, 1106, cert_3983⟩
  · exact ⟨1107, 1106, cert_3984⟩
  · exact ⟨1107, 1106, cert_3985⟩
  · exact ⟨1107, 1107, cert_3986⟩
  · exact ⟨1108, 1107, cert_3987⟩
  · exact ⟨1108, 1107, cert_3988⟩
  · exact ⟨1108, 1107, cert_3989⟩
  · exact ⟨1108, 1108, cert_3990⟩
  · exact ⟨1109, 1108, cert_3991⟩
  · exact ⟨1109, 1108, cert_3992⟩
  · exact ⟨1109, 1108, cert_3993⟩
  · exact ⟨1109, 1109, cert_3994⟩
  · exact ⟨1109, 1109, cert_3995⟩
  · exact ⟨1110, 1109, cert_3996⟩
  · exact ⟨1110, 1109, cert_3997⟩
  · exact ⟨1110, 1109, cert_3998⟩
  · exact ⟨1110, 1110, cert_3999⟩
  · exact ⟨1111, 1110, cert_4000⟩

theorem no_fixed_digitCount_3901_4000 {n : ℕ} (hn : a n = n)
    (hlo : 3901 ≤ digitCount n) (hhi : digitCount n ≤ 4000) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_3901_4000 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_3901_4000
end OeisA113010
