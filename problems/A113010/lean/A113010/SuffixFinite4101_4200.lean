import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 4201
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_4101 : ExponentCertificate 4101 1135 1135 := by decide
private theorem cert_4102 : ExponentCertificate 4102 1136 1135 := by decide
private theorem cert_4103 : ExponentCertificate 4103 1136 1135 := by decide
private theorem cert_4104 : ExponentCertificate 4104 1136 1135 := by decide
private theorem cert_4105 : ExponentCertificate 4105 1136 1136 := by decide
private theorem cert_4106 : ExponentCertificate 4106 1137 1136 := by decide
private theorem cert_4107 : ExponentCertificate 4107 1137 1136 := by decide
private theorem cert_4108 : ExponentCertificate 4108 1137 1136 := by decide
private theorem cert_4109 : ExponentCertificate 4109 1137 1137 := by decide
private theorem cert_4110 : ExponentCertificate 4110 1138 1137 := by decide
private theorem cert_4111 : ExponentCertificate 4111 1138 1137 := by decide
private theorem cert_4112 : ExponentCertificate 4112 1138 1137 := by decide
private theorem cert_4113 : ExponentCertificate 4113 1138 1138 := by decide
private theorem cert_4114 : ExponentCertificate 4114 1138 1138 := by decide
private theorem cert_4115 : ExponentCertificate 4115 1139 1138 := by decide
private theorem cert_4116 : ExponentCertificate 4116 1139 1138 := by decide
private theorem cert_4117 : ExponentCertificate 4117 1139 1138 := by decide
private theorem cert_4118 : ExponentCertificate 4118 1139 1139 := by decide
private theorem cert_4119 : ExponentCertificate 4119 1140 1139 := by decide
private theorem cert_4120 : ExponentCertificate 4120 1140 1139 := by decide
private theorem cert_4121 : ExponentCertificate 4121 1140 1139 := by decide
private theorem cert_4122 : ExponentCertificate 4122 1140 1140 := by decide
private theorem cert_4123 : ExponentCertificate 4123 1141 1140 := by decide
private theorem cert_4124 : ExponentCertificate 4124 1141 1140 := by decide
private theorem cert_4125 : ExponentCertificate 4125 1141 1140 := by decide
private theorem cert_4126 : ExponentCertificate 4126 1141 1141 := by decide
private theorem cert_4127 : ExponentCertificate 4127 1142 1141 := by decide
private theorem cert_4128 : ExponentCertificate 4128 1142 1141 := by decide
private theorem cert_4129 : ExponentCertificate 4129 1142 1141 := by decide
private theorem cert_4130 : ExponentCertificate 4130 1142 1142 := by decide
private theorem cert_4131 : ExponentCertificate 4131 1143 1142 := by decide
private theorem cert_4132 : ExponentCertificate 4132 1143 1142 := by decide
private theorem cert_4133 : ExponentCertificate 4133 1143 1142 := by decide
private theorem suffix_4134 : 1143 < digitSum ((4134 : ℕ) ^ 1143 % 10 ^ 286) := by
  have hmod : (4134 : ℕ) ^ 1143 % 10 ^ 286 = 9743468187879209232285068461773658195643039973375430331345282389455251415082471087070802827561975679634175961292200372700381234213923927814828802878091101544720524798589035024047073570335136802288772838142785030685688013074965829117473184584163638087189120840744737717266029145179029504 := by
    have h1 : (4134 : ℕ) ^ 1 % 10 ^ 286 = 4134 := by decide
    have h2 : (4134 : ℕ) ^ 2 % 10 ^ 286 = 17089956 := by
      have step := pow_mod_double (k := 4134) (e := 1) (m := 10 ^ 286) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (4134 : ℕ) ^ 4 % 10 ^ 286 = 292066596081936 := by
      have step := pow_mod_double (k := 4134) (e := 2) (m := 10 ^ 286) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (4134 : ℕ) ^ 8 % 10 ^ 286 = 85302896546888753226425508096 := by
      have step := pow_mod_double (k := 4134) (e := 4) (m := 10 ^ 286) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h17 : (4134 : ℕ) ^ 17 % 10 ^ 286 = 30081398914501574210706091303897314728698219875326302227922944 := by
      have step := pow_mod_double_add_one (k := 4134) (e := 8) (m := 10 ^ 286) h8
      have he : 2 * 8 + 1 = 17 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h35 : (4134 : ℕ) ^ 35 % 10 ^ 286 = 3740817577741058398211717193738379989942678572213379919380610574657968129502240227084439753500982617205350485484113556326580224 := by
      have step := pow_mod_double_add_one (k := 4134) (e := 17) (m := 10 ^ 286) h17
      have he : 2 * 17 + 1 = 35 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h71 : (4134 : ℕ) ^ 71 % 10 ^ 286 = 57850022563837406223139628703643514427510432202306798749678095359621801059732997443646397945541561849193053397755872945322095363833109258894050141709216091082861652448651380793379158286840869254236764848135714611145981740779725945782329498300278746417987584 := by
      have step := pow_mod_double_add_one (k := 4134) (e := 35) (m := 10 ^ 286) h35
      have he : 2 * 35 + 1 = 71 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h142 : (4134 : ℕ) ^ 142 % 10 ^ 286 = 9206015834951910914933720668439966851814822415858594975004307164907171968622295742122242625649327729233862489125402126714424305045829346157733697223405832187296098494388731892756241754118945890958141169487802493321641423197463215828844173760160559633846008135072263755308892948378157056 := by
      have step := pow_mod_double (k := 4134) (e := 71) (m := 10 ^ 286) h71
      have he : 2 * 71 = 142 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h285 : (4134 : ℕ) ^ 285 % 10 ^ 286 = 2932730352499040365157715972663599862736663119763055718532800051161042508253508020331854188643580077827124386084033136718628080499702769913829454017956379761390372695569818528840965039404486663017310461731722697156729112616597754474721567980325308947359724868993861465639521300695220224 := by
      have step := pow_mod_double_add_one (k := 4134) (e := 142) (m := 10 ^ 286) h142
      have he : 2 * 142 + 1 = 285 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h571 : (4134 : ℕ) ^ 571 % 10 ^ 286 = 7889239387851374425106973789122532116306301254420692525178901479426621516813694029101476786087575732526757997646026410684018101805519580314277456756749850986985794830355171970748410770372148522111703973507115517924482008975220940928445137765644077752007134933887722293851296455494467584 := by
      have step := pow_mod_double_add_one (k := 4134) (e := 285) (m := 10 ^ 286) h285
      have he : 2 * 285 + 1 = 571 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1143 : (4134 : ℕ) ^ 1143 % 10 ^ 286 = 9743468187879209232285068461773658195643039973375430331345282389455251415082471087070802827561975679634175961292200372700381234213923927814828802878091101544720524798589035024047073570335136802288772838142785030685688013074965829117473184584163638087189120840744737717266029145179029504 := by
      have step := pow_mod_double_add_one (k := 4134) (e := 571) (m := 10 ^ 286) h571
      have he : 2 * 571 + 1 = 1143 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h1143
  rw [hmod]
  decide
private theorem cert_4134 : ExponentCertificate 4134 1143 1143 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 4134) (by decide) (by decide) (by decide) suffix_4134
private theorem cert_4135 : ExponentCertificate 4135 1144 1143 := by decide
private theorem cert_4136 : ExponentCertificate 4136 1144 1143 := by decide
private theorem cert_4137 : ExponentCertificate 4137 1144 1143 := by decide
private theorem cert_4138 : ExponentCertificate 4138 1144 1144 := by decide
private theorem cert_4139 : ExponentCertificate 4139 1145 1144 := by decide
private theorem cert_4140 : ExponentCertificate 4140 1145 1144 := by decide
private theorem cert_4141 : ExponentCertificate 4141 1145 1144 := by decide
private theorem cert_4142 : ExponentCertificate 4142 1145 1145 := by decide
private theorem cert_4143 : ExponentCertificate 4143 1146 1145 := by decide
private theorem cert_4144 : ExponentCertificate 4144 1146 1145 := by decide
private theorem cert_4145 : ExponentCertificate 4145 1146 1145 := by decide
private theorem cert_4146 : ExponentCertificate 4146 1146 1146 := by decide
private theorem cert_4147 : ExponentCertificate 4147 1147 1146 := by decide
private theorem cert_4148 : ExponentCertificate 4148 1147 1146 := by decide
private theorem cert_4149 : ExponentCertificate 4149 1147 1146 := by decide
private theorem cert_4150 : ExponentCertificate 4150 1147 1147 := by decide
private theorem cert_4151 : ExponentCertificate 4151 1147 1147 := by decide
private theorem cert_4152 : ExponentCertificate 4152 1148 1147 := by decide
private theorem cert_4153 : ExponentCertificate 4153 1148 1147 := by decide
private theorem cert_4154 : ExponentCertificate 4154 1148 1148 := by decide
private theorem cert_4155 : ExponentCertificate 4155 1148 1148 := by decide
private theorem cert_4156 : ExponentCertificate 4156 1149 1148 := by decide
private theorem cert_4157 : ExponentCertificate 4157 1149 1148 := by decide
private theorem cert_4158 : ExponentCertificate 4158 1149 1148 := by decide
private theorem cert_4159 : ExponentCertificate 4159 1149 1149 := by decide
private theorem cert_4160 : ExponentCertificate 4160 1150 1149 := by decide
private theorem cert_4161 : ExponentCertificate 4161 1150 1149 := by decide
private theorem cert_4162 : ExponentCertificate 4162 1150 1149 := by decide
private theorem cert_4163 : ExponentCertificate 4163 1150 1150 := by decide
private theorem cert_4164 : ExponentCertificate 4164 1151 1150 := by decide
private theorem cert_4165 : ExponentCertificate 4165 1151 1150 := by decide
private theorem cert_4166 : ExponentCertificate 4166 1151 1150 := by decide
private theorem cert_4167 : ExponentCertificate 4167 1151 1151 := by decide
private theorem cert_4168 : ExponentCertificate 4168 1152 1151 := by decide
private theorem cert_4169 : ExponentCertificate 4169 1152 1151 := by decide
private theorem cert_4170 : ExponentCertificate 4170 1152 1151 := by decide
private theorem cert_4171 : ExponentCertificate 4171 1152 1152 := by decide
private theorem cert_4172 : ExponentCertificate 4172 1153 1152 := by decide
private theorem cert_4173 : ExponentCertificate 4173 1153 1152 := by decide
private theorem cert_4174 : ExponentCertificate 4174 1153 1152 := by decide
private theorem cert_4175 : ExponentCertificate 4175 1153 1153 := by decide
private theorem cert_4176 : ExponentCertificate 4176 1154 1153 := by decide
private theorem cert_4177 : ExponentCertificate 4177 1154 1153 := by decide
private theorem cert_4178 : ExponentCertificate 4178 1154 1153 := by decide
private theorem cert_4179 : ExponentCertificate 4179 1154 1154 := by decide
private theorem cert_4180 : ExponentCertificate 4180 1155 1154 := by decide
private theorem cert_4181 : ExponentCertificate 4181 1155 1154 := by decide
private theorem cert_4182 : ExponentCertificate 4182 1155 1154 := by decide
private theorem cert_4183 : ExponentCertificate 4183 1155 1155 := by decide
private theorem cert_4184 : ExponentCertificate 4184 1156 1155 := by decide
private theorem cert_4185 : ExponentCertificate 4185 1156 1155 := by decide
private theorem cert_4186 : ExponentCertificate 4186 1156 1155 := by decide
private theorem cert_4187 : ExponentCertificate 4187 1156 1156 := by decide
private theorem cert_4188 : ExponentCertificate 4188 1156 1156 := by decide
private theorem cert_4189 : ExponentCertificate 4189 1157 1156 := by decide
private theorem cert_4190 : ExponentCertificate 4190 1157 1156 := by decide
private theorem cert_4191 : ExponentCertificate 4191 1157 1156 := by decide
private theorem cert_4192 : ExponentCertificate 4192 1157 1157 := by decide
private theorem cert_4193 : ExponentCertificate 4193 1158 1157 := by decide
private theorem cert_4194 : ExponentCertificate 4194 1158 1157 := by decide
private theorem cert_4195 : ExponentCertificate 4195 1158 1157 := by decide
private theorem cert_4196 : ExponentCertificate 4196 1158 1158 := by decide
private theorem cert_4197 : ExponentCertificate 4197 1159 1158 := by decide
private theorem cert_4198 : ExponentCertificate 4198 1159 1158 := by decide
private theorem cert_4199 : ExponentCertificate 4199 1159 1158 := by decide
private theorem cert_4200 : ExponentCertificate 4200 1159 1159 := by decide

private theorem certificates_4101_4200 {k : ℕ} (hlo : 4101 ≤ k) (hhi : k ≤ 4200) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨1135, 1135, cert_4101⟩
  · exact ⟨1136, 1135, cert_4102⟩
  · exact ⟨1136, 1135, cert_4103⟩
  · exact ⟨1136, 1135, cert_4104⟩
  · exact ⟨1136, 1136, cert_4105⟩
  · exact ⟨1137, 1136, cert_4106⟩
  · exact ⟨1137, 1136, cert_4107⟩
  · exact ⟨1137, 1136, cert_4108⟩
  · exact ⟨1137, 1137, cert_4109⟩
  · exact ⟨1138, 1137, cert_4110⟩
  · exact ⟨1138, 1137, cert_4111⟩
  · exact ⟨1138, 1137, cert_4112⟩
  · exact ⟨1138, 1138, cert_4113⟩
  · exact ⟨1138, 1138, cert_4114⟩
  · exact ⟨1139, 1138, cert_4115⟩
  · exact ⟨1139, 1138, cert_4116⟩
  · exact ⟨1139, 1138, cert_4117⟩
  · exact ⟨1139, 1139, cert_4118⟩
  · exact ⟨1140, 1139, cert_4119⟩
  · exact ⟨1140, 1139, cert_4120⟩
  · exact ⟨1140, 1139, cert_4121⟩
  · exact ⟨1140, 1140, cert_4122⟩
  · exact ⟨1141, 1140, cert_4123⟩
  · exact ⟨1141, 1140, cert_4124⟩
  · exact ⟨1141, 1140, cert_4125⟩
  · exact ⟨1141, 1141, cert_4126⟩
  · exact ⟨1142, 1141, cert_4127⟩
  · exact ⟨1142, 1141, cert_4128⟩
  · exact ⟨1142, 1141, cert_4129⟩
  · exact ⟨1142, 1142, cert_4130⟩
  · exact ⟨1143, 1142, cert_4131⟩
  · exact ⟨1143, 1142, cert_4132⟩
  · exact ⟨1143, 1142, cert_4133⟩
  · exact ⟨1143, 1143, cert_4134⟩
  · exact ⟨1144, 1143, cert_4135⟩
  · exact ⟨1144, 1143, cert_4136⟩
  · exact ⟨1144, 1143, cert_4137⟩
  · exact ⟨1144, 1144, cert_4138⟩
  · exact ⟨1145, 1144, cert_4139⟩
  · exact ⟨1145, 1144, cert_4140⟩
  · exact ⟨1145, 1144, cert_4141⟩
  · exact ⟨1145, 1145, cert_4142⟩
  · exact ⟨1146, 1145, cert_4143⟩
  · exact ⟨1146, 1145, cert_4144⟩
  · exact ⟨1146, 1145, cert_4145⟩
  · exact ⟨1146, 1146, cert_4146⟩
  · exact ⟨1147, 1146, cert_4147⟩
  · exact ⟨1147, 1146, cert_4148⟩
  · exact ⟨1147, 1146, cert_4149⟩
  · exact ⟨1147, 1147, cert_4150⟩
  · exact ⟨1147, 1147, cert_4151⟩
  · exact ⟨1148, 1147, cert_4152⟩
  · exact ⟨1148, 1147, cert_4153⟩
  · exact ⟨1148, 1148, cert_4154⟩
  · exact ⟨1148, 1148, cert_4155⟩
  · exact ⟨1149, 1148, cert_4156⟩
  · exact ⟨1149, 1148, cert_4157⟩
  · exact ⟨1149, 1148, cert_4158⟩
  · exact ⟨1149, 1149, cert_4159⟩
  · exact ⟨1150, 1149, cert_4160⟩
  · exact ⟨1150, 1149, cert_4161⟩
  · exact ⟨1150, 1149, cert_4162⟩
  · exact ⟨1150, 1150, cert_4163⟩
  · exact ⟨1151, 1150, cert_4164⟩
  · exact ⟨1151, 1150, cert_4165⟩
  · exact ⟨1151, 1150, cert_4166⟩
  · exact ⟨1151, 1151, cert_4167⟩
  · exact ⟨1152, 1151, cert_4168⟩
  · exact ⟨1152, 1151, cert_4169⟩
  · exact ⟨1152, 1151, cert_4170⟩
  · exact ⟨1152, 1152, cert_4171⟩
  · exact ⟨1153, 1152, cert_4172⟩
  · exact ⟨1153, 1152, cert_4173⟩
  · exact ⟨1153, 1152, cert_4174⟩
  · exact ⟨1153, 1153, cert_4175⟩
  · exact ⟨1154, 1153, cert_4176⟩
  · exact ⟨1154, 1153, cert_4177⟩
  · exact ⟨1154, 1153, cert_4178⟩
  · exact ⟨1154, 1154, cert_4179⟩
  · exact ⟨1155, 1154, cert_4180⟩
  · exact ⟨1155, 1154, cert_4181⟩
  · exact ⟨1155, 1154, cert_4182⟩
  · exact ⟨1155, 1155, cert_4183⟩
  · exact ⟨1156, 1155, cert_4184⟩
  · exact ⟨1156, 1155, cert_4185⟩
  · exact ⟨1156, 1155, cert_4186⟩
  · exact ⟨1156, 1156, cert_4187⟩
  · exact ⟨1156, 1156, cert_4188⟩
  · exact ⟨1157, 1156, cert_4189⟩
  · exact ⟨1157, 1156, cert_4190⟩
  · exact ⟨1157, 1156, cert_4191⟩
  · exact ⟨1157, 1157, cert_4192⟩
  · exact ⟨1158, 1157, cert_4193⟩
  · exact ⟨1158, 1157, cert_4194⟩
  · exact ⟨1158, 1157, cert_4195⟩
  · exact ⟨1158, 1158, cert_4196⟩
  · exact ⟨1159, 1158, cert_4197⟩
  · exact ⟨1159, 1158, cert_4198⟩
  · exact ⟨1159, 1158, cert_4199⟩
  · exact ⟨1159, 1159, cert_4200⟩

theorem no_fixed_digitCount_4101_4200 {n : ℕ} (hn : a n = n)
    (hlo : 4101 ≤ digitCount n) (hhi : digitCount n ≤ 4200) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_4101_4200 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_4101_4200
end OeisA113010
