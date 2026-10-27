import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 4101
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_4001 : ExponentCertificate 4001 1111 1110 := by decide
private theorem cert_4002 : ExponentCertificate 4002 1111 1110 := by decide
private theorem cert_4003 : ExponentCertificate 4003 1111 1111 := by decide
private theorem cert_4004 : ExponentCertificate 4004 1112 1111 := by decide
private theorem cert_4005 : ExponentCertificate 4005 1112 1111 := by decide
private theorem cert_4006 : ExponentCertificate 4006 1112 1111 := by decide
private theorem cert_4007 : ExponentCertificate 4007 1112 1112 := by decide
private theorem cert_4008 : ExponentCertificate 4008 1113 1112 := by decide
private theorem cert_4009 : ExponentCertificate 4009 1113 1112 := by decide
private theorem cert_4010 : ExponentCertificate 4010 1113 1112 := by decide
private theorem cert_4011 : ExponentCertificate 4011 1113 1113 := by decide
private theorem cert_4012 : ExponentCertificate 4012 1114 1113 := by decide
private theorem cert_4013 : ExponentCertificate 4013 1114 1113 := by decide
private theorem cert_4014 : ExponentCertificate 4014 1114 1113 := by decide
private theorem cert_4015 : ExponentCertificate 4015 1114 1114 := by decide
private theorem cert_4016 : ExponentCertificate 4016 1115 1114 := by decide
private theorem cert_4017 : ExponentCertificate 4017 1115 1114 := by decide
private theorem cert_4018 : ExponentCertificate 4018 1115 1114 := by decide
private theorem cert_4019 : ExponentCertificate 4019 1115 1115 := by decide
private theorem cert_4020 : ExponentCertificate 4020 1116 1115 := by decide
private theorem cert_4021 : ExponentCertificate 4021 1116 1115 := by decide
private theorem cert_4022 : ExponentCertificate 4022 1116 1115 := by decide
private theorem suffix_4023 : 1116 < digitSum ((4023 : ℕ) ^ 1116 % 10 ^ 279) := by
  have hmod : (4023 : ℕ) ^ 1116 % 10 ^ 279 = 454602328350773999740886708364878992314619810068638426003977935068316549741618540592857151188692929117559219813137493038019721883640936463757117958413730498913609573011150870841141297655521748357805776034919578606456038336399029755582277067345946589137401651671803004275923492961 := by
    have h1 : (4023 : ℕ) ^ 1 % 10 ^ 279 = 4023 := by decide
    have h2 : (4023 : ℕ) ^ 2 % 10 ^ 279 = 16184529 := by
      have step := pow_mod_double (k := 4023) (e := 1) (m := 10 ^ 279) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4023 : ℕ) ^ 4 % 10 ^ 279 = 261938978951841 := by
      have step := pow_mod_double (k := 4023) (e := 2) (m := 10 ^ 279) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (4023 : ℕ) ^ 8 % 10 ^ 279 = 68612028694333002422997289281 := by
      have step := pow_mod_double (k := 4023) (e := 4) (m := 10 ^ 279) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h17 : (4023 : ℕ) ^ 17 % 10 ^ 279 = 18938716967283596588611852044727609670862954679146691930274103 := by
      have step := pow_mod_double_add_one (k := 4023) (e := 8) (m := 10 ^ 279) h8
      have he : 2 * 8 + 1 = 17 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h34 : (4023 : ℕ) ^ 34 % 10 ^ 279 = 358675000366875590138133629618625128382716560536157421874050292021200773537256610373851040202976696395163416296252712454609 := by
      have step := pow_mod_double (k := 4023) (e := 17) (m := 10 ^ 279) h17
      have he : 2 * 17 = 34 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h69 : (4023 : ℕ) ^ 69 % 10 ^ 279 = 517549921938140917589315752114959063019766799574787264732397440799432284134729234291294782275389685549165271808192504712734964443475593341183143599794007016650918418295418795410243511317902351901704087537941960622051456281467742929198601176734410263 := by
      have step := pow_mod_double_add_one (k := 4023) (e := 34) (m := 10 ^ 279) h34
      have he : 2 * 34 + 1 = 69 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h139 : (4023 : ℕ) ^ 139 % 10 ^ 279 = 932053450058056345885282483433267287702435912740397503987463484096601721770090847545641425503277198564093936463902748766991897748061230724735068441077353314698293107007268715908978923184588308466183457805714785016570476475693332311918422094380827135724770078973313672838110446887 := by
      have step := pow_mod_double_add_one (k := 4023) (e := 69) (m := 10 ^ 279) h69
      have he : 2 * 69 + 1 = 139 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h279 : (4023 : ℕ) ^ 279 % 10 ^ 279 = 671865005916183499613957506409930615691104649345828604370156297377370310130511965832172579008430891013582239641487526120029078581593488080975687933520195739268305991374648741624045666480554716898393609488785437384240593432857994332867770265105990132720929256626220617309466863687 := by
      have step := pow_mod_double_add_one (k := 4023) (e := 139) (m := 10 ^ 279) h139
      have he : 2 * 139 + 1 = 279 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h558 : (4023 : ℕ) ^ 558 % 10 ^ 279 = 137194894199996048795587270700432691439492059293810644672598667858715645722255935759685794885307925267651826970138640041386130643281481252070449979957256642662114156460082496743579098902162915731350063270317504103367466265413527627912553423323870500494403478025809478268239233969 := by
      have step := pow_mod_double (k := 4023) (e := 279) (m := 10 ^ 279) h279
      have he : 2 * 279 = 558 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1116 : (4023 : ℕ) ^ 1116 % 10 ^ 279 = 454602328350773999740886708364878992314619810068638426003977935068316549741618540592857151188692929117559219813137493038019721883640936463757117958413730498913609573011150870841141297655521748357805776034919578606456038336399029755582277067345946589137401651671803004275923492961 := by
      have step := pow_mod_double (k := 4023) (e := 558) (m := 10 ^ 279) h558
      have he : 2 * 558 = 1116 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1116
  rw [hmod]
  decide
private theorem cert_4023 : ExponentCertificate 4023 1116 1116 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4023) (by decide) (by decide) (by decide) suffix_4023
private theorem cert_4024 : ExponentCertificate 4024 1117 1116 := by decide
private theorem cert_4025 : ExponentCertificate 4025 1117 1116 := by decide
private theorem cert_4026 : ExponentCertificate 4026 1117 1116 := by decide
private theorem cert_4027 : ExponentCertificate 4027 1117 1117 := by decide
private theorem cert_4028 : ExponentCertificate 4028 1118 1117 := by decide
private theorem cert_4029 : ExponentCertificate 4029 1118 1117 := by decide
private theorem cert_4030 : ExponentCertificate 4030 1118 1117 := by decide
private theorem cert_4031 : ExponentCertificate 4031 1118 1118 := by decide
private theorem cert_4032 : ExponentCertificate 4032 1119 1118 := by decide
private theorem cert_4033 : ExponentCertificate 4033 1119 1118 := by decide
private theorem cert_4034 : ExponentCertificate 4034 1119 1118 := by decide
private theorem cert_4035 : ExponentCertificate 4035 1119 1119 := by decide
private theorem cert_4036 : ExponentCertificate 4036 1119 1119 := by decide
private theorem cert_4037 : ExponentCertificate 4037 1120 1119 := by decide
private theorem cert_4038 : ExponentCertificate 4038 1120 1119 := by decide
private theorem cert_4039 : ExponentCertificate 4039 1120 1119 := by decide
private theorem cert_4040 : ExponentCertificate 4040 1120 1120 := by decide
private theorem cert_4041 : ExponentCertificate 4041 1121 1120 := by decide
private theorem cert_4042 : ExponentCertificate 4042 1121 1120 := by decide
private theorem cert_4043 : ExponentCertificate 4043 1121 1120 := by decide
private theorem cert_4044 : ExponentCertificate 4044 1121 1121 := by decide
private theorem cert_4045 : ExponentCertificate 4045 1122 1121 := by decide
private theorem cert_4046 : ExponentCertificate 4046 1122 1121 := by decide
private theorem cert_4047 : ExponentCertificate 4047 1122 1121 := by decide
private theorem cert_4048 : ExponentCertificate 4048 1122 1122 := by decide
private theorem cert_4049 : ExponentCertificate 4049 1123 1122 := by decide
private theorem cert_4050 : ExponentCertificate 4050 1123 1122 := by decide
private theorem cert_4051 : ExponentCertificate 4051 1123 1122 := by decide
private theorem cert_4052 : ExponentCertificate 4052 1123 1123 := by decide
private theorem cert_4053 : ExponentCertificate 4053 1124 1123 := by decide
private theorem cert_4054 : ExponentCertificate 4054 1124 1123 := by decide
private theorem cert_4055 : ExponentCertificate 4055 1124 1123 := by decide
private theorem cert_4056 : ExponentCertificate 4056 1124 1124 := by decide
private theorem cert_4057 : ExponentCertificate 4057 1125 1124 := by decide
private theorem cert_4058 : ExponentCertificate 4058 1125 1124 := by decide
private theorem cert_4059 : ExponentCertificate 4059 1125 1124 := by decide
private theorem cert_4060 : ExponentCertificate 4060 1125 1125 := by decide
private theorem cert_4061 : ExponentCertificate 4061 1126 1125 := by decide
private theorem cert_4062 : ExponentCertificate 4062 1126 1125 := by decide
private theorem cert_4063 : ExponentCertificate 4063 1126 1125 := by decide
private theorem cert_4064 : ExponentCertificate 4064 1126 1126 := by decide
private theorem cert_4065 : ExponentCertificate 4065 1127 1126 := by decide
private theorem cert_4066 : ExponentCertificate 4066 1127 1126 := by decide
private theorem cert_4067 : ExponentCertificate 4067 1127 1126 := by decide
private theorem cert_4068 : ExponentCertificate 4068 1127 1127 := by decide
private theorem cert_4069 : ExponentCertificate 4069 1128 1127 := by decide
private theorem cert_4070 : ExponentCertificate 4070 1128 1127 := by decide
private theorem cert_4071 : ExponentCertificate 4071 1128 1127 := by decide
private theorem cert_4072 : ExponentCertificate 4072 1128 1128 := by decide
private theorem cert_4073 : ExponentCertificate 4073 1129 1128 := by decide
private theorem cert_4074 : ExponentCertificate 4074 1129 1128 := by decide
private theorem cert_4075 : ExponentCertificate 4075 1129 1128 := by decide
private theorem cert_4076 : ExponentCertificate 4076 1129 1129 := by decide
private theorem cert_4077 : ExponentCertificate 4077 1129 1129 := by decide
private theorem cert_4078 : ExponentCertificate 4078 1130 1129 := by decide
private theorem cert_4079 : ExponentCertificate 4079 1130 1129 := by decide
private theorem cert_4080 : ExponentCertificate 4080 1130 1129 := by decide
private theorem cert_4081 : ExponentCertificate 4081 1130 1130 := by decide
private theorem cert_4082 : ExponentCertificate 4082 1131 1130 := by decide
private theorem cert_4083 : ExponentCertificate 4083 1131 1130 := by decide
private theorem cert_4084 : ExponentCertificate 4084 1131 1130 := by decide
private theorem cert_4085 : ExponentCertificate 4085 1131 1131 := by decide
private theorem cert_4086 : ExponentCertificate 4086 1132 1131 := by decide
private theorem cert_4087 : ExponentCertificate 4087 1132 1131 := by decide
private theorem cert_4088 : ExponentCertificate 4088 1132 1131 := by decide
private theorem cert_4089 : ExponentCertificate 4089 1132 1132 := by decide
private theorem cert_4090 : ExponentCertificate 4090 1133 1132 := by decide
private theorem cert_4091 : ExponentCertificate 4091 1133 1132 := by decide
private theorem cert_4092 : ExponentCertificate 4092 1133 1132 := by decide
private theorem cert_4093 : ExponentCertificate 4093 1133 1133 := by decide
private theorem cert_4094 : ExponentCertificate 4094 1134 1133 := by decide
private theorem cert_4095 : ExponentCertificate 4095 1134 1133 := by decide
private theorem cert_4096 : ExponentCertificate 4096 1134 1133 := by decide
private theorem cert_4097 : ExponentCertificate 4097 1134 1134 := by decide
private theorem cert_4098 : ExponentCertificate 4098 1135 1134 := by decide
private theorem cert_4099 : ExponentCertificate 4099 1135 1134 := by decide
private theorem cert_4100 : ExponentCertificate 4100 1135 1134 := by decide

private theorem certificates_4001_4100 {k : ℕ} (hlo : 4001 ≤ k) (hhi : k ≤ 4100) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1111, 1110, cert_4001⟩
  · exact ⟨1111, 1110, cert_4002⟩
  · exact ⟨1111, 1111, cert_4003⟩
  · exact ⟨1112, 1111, cert_4004⟩
  · exact ⟨1112, 1111, cert_4005⟩
  · exact ⟨1112, 1111, cert_4006⟩
  · exact ⟨1112, 1112, cert_4007⟩
  · exact ⟨1113, 1112, cert_4008⟩
  · exact ⟨1113, 1112, cert_4009⟩
  · exact ⟨1113, 1112, cert_4010⟩
  · exact ⟨1113, 1113, cert_4011⟩
  · exact ⟨1114, 1113, cert_4012⟩
  · exact ⟨1114, 1113, cert_4013⟩
  · exact ⟨1114, 1113, cert_4014⟩
  · exact ⟨1114, 1114, cert_4015⟩
  · exact ⟨1115, 1114, cert_4016⟩
  · exact ⟨1115, 1114, cert_4017⟩
  · exact ⟨1115, 1114, cert_4018⟩
  · exact ⟨1115, 1115, cert_4019⟩
  · exact ⟨1116, 1115, cert_4020⟩
  · exact ⟨1116, 1115, cert_4021⟩
  · exact ⟨1116, 1115, cert_4022⟩
  · exact ⟨1116, 1116, cert_4023⟩
  · exact ⟨1117, 1116, cert_4024⟩
  · exact ⟨1117, 1116, cert_4025⟩
  · exact ⟨1117, 1116, cert_4026⟩
  · exact ⟨1117, 1117, cert_4027⟩
  · exact ⟨1118, 1117, cert_4028⟩
  · exact ⟨1118, 1117, cert_4029⟩
  · exact ⟨1118, 1117, cert_4030⟩
  · exact ⟨1118, 1118, cert_4031⟩
  · exact ⟨1119, 1118, cert_4032⟩
  · exact ⟨1119, 1118, cert_4033⟩
  · exact ⟨1119, 1118, cert_4034⟩
  · exact ⟨1119, 1119, cert_4035⟩
  · exact ⟨1119, 1119, cert_4036⟩
  · exact ⟨1120, 1119, cert_4037⟩
  · exact ⟨1120, 1119, cert_4038⟩
  · exact ⟨1120, 1119, cert_4039⟩
  · exact ⟨1120, 1120, cert_4040⟩
  · exact ⟨1121, 1120, cert_4041⟩
  · exact ⟨1121, 1120, cert_4042⟩
  · exact ⟨1121, 1120, cert_4043⟩
  · exact ⟨1121, 1121, cert_4044⟩
  · exact ⟨1122, 1121, cert_4045⟩
  · exact ⟨1122, 1121, cert_4046⟩
  · exact ⟨1122, 1121, cert_4047⟩
  · exact ⟨1122, 1122, cert_4048⟩
  · exact ⟨1123, 1122, cert_4049⟩
  · exact ⟨1123, 1122, cert_4050⟩
  · exact ⟨1123, 1122, cert_4051⟩
  · exact ⟨1123, 1123, cert_4052⟩
  · exact ⟨1124, 1123, cert_4053⟩
  · exact ⟨1124, 1123, cert_4054⟩
  · exact ⟨1124, 1123, cert_4055⟩
  · exact ⟨1124, 1124, cert_4056⟩
  · exact ⟨1125, 1124, cert_4057⟩
  · exact ⟨1125, 1124, cert_4058⟩
  · exact ⟨1125, 1124, cert_4059⟩
  · exact ⟨1125, 1125, cert_4060⟩
  · exact ⟨1126, 1125, cert_4061⟩
  · exact ⟨1126, 1125, cert_4062⟩
  · exact ⟨1126, 1125, cert_4063⟩
  · exact ⟨1126, 1126, cert_4064⟩
  · exact ⟨1127, 1126, cert_4065⟩
  · exact ⟨1127, 1126, cert_4066⟩
  · exact ⟨1127, 1126, cert_4067⟩
  · exact ⟨1127, 1127, cert_4068⟩
  · exact ⟨1128, 1127, cert_4069⟩
  · exact ⟨1128, 1127, cert_4070⟩
  · exact ⟨1128, 1127, cert_4071⟩
  · exact ⟨1128, 1128, cert_4072⟩
  · exact ⟨1129, 1128, cert_4073⟩
  · exact ⟨1129, 1128, cert_4074⟩
  · exact ⟨1129, 1128, cert_4075⟩
  · exact ⟨1129, 1129, cert_4076⟩
  · exact ⟨1129, 1129, cert_4077⟩
  · exact ⟨1130, 1129, cert_4078⟩
  · exact ⟨1130, 1129, cert_4079⟩
  · exact ⟨1130, 1129, cert_4080⟩
  · exact ⟨1130, 1130, cert_4081⟩
  · exact ⟨1131, 1130, cert_4082⟩
  · exact ⟨1131, 1130, cert_4083⟩
  · exact ⟨1131, 1130, cert_4084⟩
  · exact ⟨1131, 1131, cert_4085⟩
  · exact ⟨1132, 1131, cert_4086⟩
  · exact ⟨1132, 1131, cert_4087⟩
  · exact ⟨1132, 1131, cert_4088⟩
  · exact ⟨1132, 1132, cert_4089⟩
  · exact ⟨1133, 1132, cert_4090⟩
  · exact ⟨1133, 1132, cert_4091⟩
  · exact ⟨1133, 1132, cert_4092⟩
  · exact ⟨1133, 1133, cert_4093⟩
  · exact ⟨1134, 1133, cert_4094⟩
  · exact ⟨1134, 1133, cert_4095⟩
  · exact ⟨1134, 1133, cert_4096⟩
  · exact ⟨1134, 1134, cert_4097⟩
  · exact ⟨1135, 1134, cert_4098⟩
  · exact ⟨1135, 1134, cert_4099⟩
  · exact ⟨1135, 1134, cert_4100⟩

theorem no_fixed_digitCount_4001_4100 {n : ℕ} (hn : a n = n)
    (hlo : 4001 ≤ digitCount n) (hhi : digitCount n ≤ 4100) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_4001_4100 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_4001_4100
end OeisA113010
