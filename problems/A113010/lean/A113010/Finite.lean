import A113010.Basic
import Mathlib.Tactic.IntervalCases

/-! Bounded verification only; this does not resolve either frozen target. -/
namespace OeisA113010

/-- Checked interval bounds together with a digit-sum or mod-nine obstruction. -/
abbrev ExponentCertificate (k lo hi : ℕ) : Prop :=
  k ^ (lo - 1) < 10 ^ (k - 1) ∧
  10 ^ k ≤ k ^ (hi + 1) ∧
  ∀ j : Fin (hi + 1 - lo),
    let e := lo + j.val
    k ^ e % 9 ≠ e % 9 ∨ digitSum (k ^ e) ≠ e

theorem no_fixed_of_certificate {n k lo hi : ℕ} (hk : 0 < k)
    (hc : ExponentCertificate k lo hi) (hn : a n = n)
    (hcount : digitCount n = k) : False := by
  obtain ⟨hlo, hhi, hbad⟩ := hc
  have hp := fixed_eq_pow hn
  rw [hcount] at hp
  have hb := digit_bounds (fixed_pos hn)
  rw [hcount, hp] at hb
  have hslo : lo ≤ digitSum n := by
    by_contra hh
    have hle : digitSum n ≤ lo - 1 := by omega
    have hpow := Nat.pow_le_pow_right hk hle
    omega
  have hshi : digitSum n ≤ hi := by
    by_contra hh
    have hle : hi + 1 ≤ digitSum n := by omega
    have hpow := Nat.pow_le_pow_right hk hle
    omega
  have hj : digitSum n - lo < hi + 1 - lo := by omega
  have he : lo + (digitSum n - lo) = digitSum n := by omega
  have bad := hbad ⟨digitSum n - lo, hj⟩
  dsimp only at bad
  rw [he, ← hp] at bad
  rcases bad with hmod | hsum
  · exact hmod (digitSum_mod_nine n)
  · exact hsum rfl

set_option exponentiation.threshold 2000
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_3 : ExponentCertificate 3 5 6 := by decide
private theorem cert_4 : ExponentCertificate 4 5 6 := by decide
private theorem cert_5 : ExponentCertificate 5 6 7 := by decide
private theorem cert_6 : ExponentCertificate 6 7 7 := by decide
private theorem cert_7 : ExponentCertificate 7 8 8 := by decide
private theorem cert_8 : ExponentCertificate 8 8 8 := by decide
private theorem cert_9 : ExponentCertificate 9 9 9 := by decide
private theorem cert_10 : ExponentCertificate 10 9 9 := by decide
private theorem cert_11 : ExponentCertificate 11 10 10 := by decide
private theorem cert_12 : ExponentCertificate 12 11 11 := by decide
private theorem cert_13 : ExponentCertificate 13 11 11 := by decide
private theorem cert_14 : ExponentCertificate 14 12 12 := by decide
private theorem cert_15 : ExponentCertificate 15 12 12 := by decide
private theorem cert_16 : ExponentCertificate 16 13 13 := by decide
private theorem cert_17 : ExponentCertificate 17 14 13 := by decide
private theorem cert_18 : ExponentCertificate 18 14 14 := by decide
private theorem cert_19 : ExponentCertificate 19 15 14 := by decide
private theorem cert_20 : ExponentCertificate 20 15 15 := by decide
private theorem cert_21 : ExponentCertificate 21 16 15 := by decide
private theorem cert_22 : ExponentCertificate 22 16 16 := by decide
private theorem cert_23 : ExponentCertificate 23 17 16 := by decide
private theorem cert_24 : ExponentCertificate 24 17 17 := by decide
private theorem cert_25 : ExponentCertificate 25 18 17 := by decide
private theorem cert_26 : ExponentCertificate 26 18 18 := by decide
private theorem cert_27 : ExponentCertificate 27 19 18 := by decide
private theorem cert_28 : ExponentCertificate 28 19 19 := by decide
private theorem cert_29 : ExponentCertificate 29 20 19 := by decide
private theorem cert_30 : ExponentCertificate 30 20 20 := by decide
private theorem cert_31 : ExponentCertificate 31 21 20 := by decide
private theorem cert_32 : ExponentCertificate 32 21 21 := by decide
private theorem cert_33 : ExponentCertificate 33 22 21 := by decide
private theorem cert_34 : ExponentCertificate 34 22 22 := by decide
private theorem cert_35 : ExponentCertificate 35 23 22 := by decide
private theorem cert_36 : ExponentCertificate 36 23 23 := by decide
private theorem cert_37 : ExponentCertificate 37 23 23 := by decide
private theorem cert_38 : ExponentCertificate 38 24 24 := by decide
private theorem cert_39 : ExponentCertificate 39 24 24 := by decide
private theorem cert_40 : ExponentCertificate 40 25 24 := by decide
private theorem cert_41 : ExponentCertificate 41 25 25 := by decide
private theorem cert_42 : ExponentCertificate 42 26 25 := by decide
private theorem cert_43 : ExponentCertificate 43 26 26 := by decide
private theorem cert_44 : ExponentCertificate 44 27 26 := by decide
private theorem cert_45 : ExponentCertificate 45 27 27 := by decide
private theorem cert_46 : ExponentCertificate 46 28 27 := by decide
private theorem cert_47 : ExponentCertificate 47 28 28 := by decide
private theorem cert_48 : ExponentCertificate 48 28 28 := by decide
private theorem cert_49 : ExponentCertificate 49 29 28 := by decide
private theorem cert_50 : ExponentCertificate 50 29 29 := by decide
private theorem cert_51 : ExponentCertificate 51 30 29 := by decide
private theorem cert_52 : ExponentCertificate 52 30 30 := by decide
private theorem cert_53 : ExponentCertificate 53 31 30 := by decide
private theorem cert_54 : ExponentCertificate 54 31 31 := by decide
private theorem cert_55 : ExponentCertificate 55 32 31 := by decide
private theorem cert_56 : ExponentCertificate 56 32 32 := by decide
private theorem cert_57 : ExponentCertificate 57 32 32 := by decide
private theorem cert_58 : ExponentCertificate 58 33 32 := by decide
private theorem cert_59 : ExponentCertificate 59 33 33 := by decide
private theorem cert_60 : ExponentCertificate 60 34 33 := by decide
private theorem cert_61 : ExponentCertificate 61 34 34 := by decide
private theorem cert_62 : ExponentCertificate 62 35 34 := by decide
private theorem cert_63 : ExponentCertificate 63 35 35 := by decide
private theorem cert_64 : ExponentCertificate 64 35 35 := by decide
private theorem cert_65 : ExponentCertificate 65 36 35 := by decide
private theorem cert_66 : ExponentCertificate 66 36 36 := by decide
private theorem cert_67 : ExponentCertificate 67 37 36 := by decide
private theorem cert_68 : ExponentCertificate 68 37 37 := by decide
private theorem cert_69 : ExponentCertificate 69 37 37 := by decide
private theorem cert_70 : ExponentCertificate 70 38 37 := by decide
private theorem cert_71 : ExponentCertificate 71 38 38 := by decide
private theorem cert_72 : ExponentCertificate 72 39 38 := by decide
private theorem cert_73 : ExponentCertificate 73 39 39 := by decide
private theorem cert_74 : ExponentCertificate 74 40 39 := by decide
private theorem cert_75 : ExponentCertificate 75 40 39 := by decide
private theorem cert_76 : ExponentCertificate 76 40 40 := by decide
private theorem cert_77 : ExponentCertificate 77 41 40 := by decide
private theorem cert_78 : ExponentCertificate 78 41 41 := by decide
private theorem cert_79 : ExponentCertificate 79 42 41 := by decide
private theorem cert_80 : ExponentCertificate 80 42 42 := by decide
private theorem cert_81 : ExponentCertificate 81 42 42 := by decide
private theorem cert_82 : ExponentCertificate 82 43 42 := by decide
private theorem cert_83 : ExponentCertificate 83 43 43 := by decide
private theorem cert_84 : ExponentCertificate 84 44 43 := by decide
private theorem cert_85 : ExponentCertificate 85 44 44 := by decide
private theorem cert_86 : ExponentCertificate 86 44 44 := by decide
private theorem cert_87 : ExponentCertificate 87 45 44 := by decide
private theorem cert_88 : ExponentCertificate 88 45 45 := by decide
private theorem cert_89 : ExponentCertificate 89 46 45 := by decide
private theorem cert_90 : ExponentCertificate 90 46 46 := by decide
private theorem cert_91 : ExponentCertificate 91 46 46 := by decide
private theorem cert_92 : ExponentCertificate 92 47 46 := by decide
private theorem cert_93 : ExponentCertificate 93 47 47 := by decide
private theorem cert_94 : ExponentCertificate 94 48 47 := by decide
private theorem cert_95 : ExponentCertificate 95 48 48 := by decide
private theorem cert_96 : ExponentCertificate 96 48 48 := by decide
private theorem cert_97 : ExponentCertificate 97 49 48 := by decide
private theorem cert_98 : ExponentCertificate 98 49 49 := by decide
private theorem cert_99 : ExponentCertificate 99 50 49 := by decide
private theorem cert_100 : ExponentCertificate 100 50 49 := by decide
private theorem cert_101 : ExponentCertificate 101 50 50 := by decide
private theorem cert_102 : ExponentCertificate 102 51 50 := by decide
private theorem cert_103 : ExponentCertificate 103 51 51 := by decide
private theorem cert_104 : ExponentCertificate 104 52 51 := by decide
private theorem cert_105 : ExponentCertificate 105 52 51 := by decide
private theorem cert_106 : ExponentCertificate 106 52 52 := by decide
private theorem cert_107 : ExponentCertificate 107 53 52 := by decide
private theorem cert_108 : ExponentCertificate 108 53 53 := by decide
private theorem cert_109 : ExponentCertificate 109 54 53 := by decide
private theorem cert_110 : ExponentCertificate 110 54 53 := by decide
private theorem cert_111 : ExponentCertificate 111 54 54 := by decide
private theorem cert_112 : ExponentCertificate 112 55 54 := by decide
private theorem cert_113 : ExponentCertificate 113 55 55 := by decide
private theorem cert_114 : ExponentCertificate 114 55 55 := by decide
private theorem cert_115 : ExponentCertificate 115 56 55 := by decide
private theorem cert_116 : ExponentCertificate 116 56 56 := by decide
private theorem cert_117 : ExponentCertificate 117 57 56 := by decide
private theorem cert_118 : ExponentCertificate 118 57 56 := by decide
private theorem cert_119 : ExponentCertificate 119 57 57 := by decide
private theorem cert_120 : ExponentCertificate 120 58 57 := by decide
private theorem cert_121 : ExponentCertificate 121 58 58 := by decide
private theorem cert_122 : ExponentCertificate 122 58 58 := by decide
private theorem cert_123 : ExponentCertificate 123 59 58 := by decide
private theorem cert_124 : ExponentCertificate 124 59 59 := by decide
private theorem cert_125 : ExponentCertificate 125 60 59 := by decide
private theorem cert_126 : ExponentCertificate 126 60 59 := by decide
private theorem cert_127 : ExponentCertificate 127 60 60 := by decide
private theorem cert_128 : ExponentCertificate 128 61 60 := by decide
private theorem cert_129 : ExponentCertificate 129 61 61 := by decide
private theorem cert_130 : ExponentCertificate 130 62 61 := by decide
private theorem cert_131 : ExponentCertificate 131 62 61 := by decide
private theorem cert_132 : ExponentCertificate 132 62 62 := by decide
private theorem cert_133 : ExponentCertificate 133 63 62 := by decide
private theorem cert_134 : ExponentCertificate 134 63 62 := by decide
private theorem cert_135 : ExponentCertificate 135 63 63 := by decide
private theorem cert_136 : ExponentCertificate 136 64 63 := by decide
private theorem cert_137 : ExponentCertificate 137 64 64 := by decide
private theorem cert_138 : ExponentCertificate 138 65 64 := by decide
private theorem cert_139 : ExponentCertificate 139 65 64 := by decide
private theorem cert_140 : ExponentCertificate 140 65 65 := by decide
private theorem cert_141 : ExponentCertificate 141 66 65 := by decide
private theorem cert_142 : ExponentCertificate 142 66 65 := by decide
private theorem cert_143 : ExponentCertificate 143 66 66 := by decide
private theorem cert_144 : ExponentCertificate 144 67 66 := by decide
private theorem cert_145 : ExponentCertificate 145 67 67 := by decide
private theorem cert_146 : ExponentCertificate 146 67 67 := by decide
private theorem cert_147 : ExponentCertificate 147 68 67 := by decide
private theorem cert_148 : ExponentCertificate 148 68 68 := by decide
private theorem cert_149 : ExponentCertificate 149 69 68 := by decide
private theorem cert_150 : ExponentCertificate 150 69 68 := by decide
private theorem cert_151 : ExponentCertificate 151 69 69 := by decide
private theorem cert_152 : ExponentCertificate 152 70 69 := by decide
private theorem cert_153 : ExponentCertificate 153 70 70 := by decide
private theorem cert_154 : ExponentCertificate 154 70 70 := by decide
private theorem cert_155 : ExponentCertificate 155 71 70 := by decide
private theorem cert_156 : ExponentCertificate 156 71 71 := by decide
private theorem cert_157 : ExponentCertificate 157 72 71 := by decide
private theorem cert_158 : ExponentCertificate 158 72 71 := by decide
private theorem cert_159 : ExponentCertificate 159 72 72 := by decide
private theorem cert_160 : ExponentCertificate 160 73 72 := by decide
private theorem cert_161 : ExponentCertificate 161 73 72 := by decide
private theorem cert_162 : ExponentCertificate 162 73 73 := by decide
private theorem cert_163 : ExponentCertificate 163 74 73 := by decide
private theorem cert_164 : ExponentCertificate 164 74 74 := by decide
private theorem cert_165 : ExponentCertificate 165 74 74 := by decide
private theorem cert_166 : ExponentCertificate 166 75 74 := by decide
private theorem cert_167 : ExponentCertificate 167 75 75 := by decide
private theorem cert_168 : ExponentCertificate 168 76 75 := by decide
private theorem cert_169 : ExponentCertificate 169 76 75 := by decide
private theorem cert_170 : ExponentCertificate 170 76 76 := by decide
private theorem cert_171 : ExponentCertificate 171 77 76 := by decide
private theorem cert_172 : ExponentCertificate 172 77 76 := by decide
private theorem cert_173 : ExponentCertificate 173 77 77 := by decide
private theorem cert_174 : ExponentCertificate 174 78 77 := by decide
private theorem cert_175 : ExponentCertificate 175 78 78 := by decide
private theorem cert_176 : ExponentCertificate 176 78 78 := by decide
private theorem cert_177 : ExponentCertificate 177 79 78 := by decide
private theorem cert_178 : ExponentCertificate 178 79 79 := by decide
private theorem cert_179 : ExponentCertificate 179 80 79 := by decide
private theorem cert_180 : ExponentCertificate 180 80 79 := by decide
private theorem cert_181 : ExponentCertificate 181 80 80 := by decide
private theorem cert_182 : ExponentCertificate 182 81 80 := by decide
private theorem cert_183 : ExponentCertificate 183 81 80 := by decide
private theorem cert_184 : ExponentCertificate 184 81 81 := by decide
private theorem cert_185 : ExponentCertificate 185 82 81 := by decide
private theorem cert_186 : ExponentCertificate 186 82 81 := by decide
private theorem cert_187 : ExponentCertificate 187 82 82 := by decide
private theorem cert_188 : ExponentCertificate 188 83 82 := by decide
private theorem cert_189 : ExponentCertificate 189 83 83 := by decide
private theorem cert_190 : ExponentCertificate 190 83 83 := by decide
private theorem cert_191 : ExponentCertificate 191 84 83 := by decide
private theorem cert_192 : ExponentCertificate 192 84 84 := by decide
private theorem cert_193 : ExponentCertificate 193 85 84 := by decide
private theorem cert_194 : ExponentCertificate 194 85 84 := by decide
private theorem cert_195 : ExponentCertificate 195 85 85 := by decide
private theorem cert_196 : ExponentCertificate 196 86 85 := by decide
private theorem cert_197 : ExponentCertificate 197 86 85 := by decide
private theorem cert_198 : ExponentCertificate 198 86 86 := by decide
private theorem cert_199 : ExponentCertificate 199 87 86 := by decide
private theorem cert_200 : ExponentCertificate 200 87 86 := by decide
private theorem cert_201 : ExponentCertificate 201 87 87 := by decide
private theorem cert_202 : ExponentCertificate 202 88 87 := by decide
private theorem cert_203 : ExponentCertificate 203 88 87 := by decide
private theorem cert_204 : ExponentCertificate 204 88 88 := by decide
private theorem cert_205 : ExponentCertificate 205 89 88 := by decide
private theorem cert_206 : ExponentCertificate 206 89 89 := by decide
private theorem cert_207 : ExponentCertificate 207 89 89 := by decide
private theorem cert_208 : ExponentCertificate 208 90 89 := by decide
private theorem cert_209 : ExponentCertificate 209 90 90 := by decide
private theorem cert_210 : ExponentCertificate 210 91 90 := by decide
private theorem cert_211 : ExponentCertificate 211 91 90 := by decide
private theorem cert_212 : ExponentCertificate 212 91 91 := by decide
private theorem cert_213 : ExponentCertificate 213 92 91 := by decide
private theorem cert_214 : ExponentCertificate 214 92 91 := by decide
private theorem cert_215 : ExponentCertificate 215 92 92 := by decide
private theorem cert_216 : ExponentCertificate 216 93 92 := by decide
private theorem cert_217 : ExponentCertificate 217 93 92 := by decide
private theorem cert_218 : ExponentCertificate 218 93 93 := by decide
private theorem cert_219 : ExponentCertificate 219 94 93 := by decide
private theorem cert_220 : ExponentCertificate 220 94 93 := by decide
private theorem cert_221 : ExponentCertificate 221 94 94 := by decide
private theorem cert_222 : ExponentCertificate 222 95 94 := by decide
private theorem cert_223 : ExponentCertificate 223 95 94 := by decide
private theorem cert_224 : ExponentCertificate 224 95 95 := by decide
private theorem cert_225 : ExponentCertificate 225 96 95 := by decide
private theorem cert_226 : ExponentCertificate 226 96 96 := by decide
private theorem cert_227 : ExponentCertificate 227 96 96 := by decide
private theorem cert_228 : ExponentCertificate 228 97 96 := by decide
private theorem cert_229 : ExponentCertificate 229 97 97 := by decide
private theorem cert_230 : ExponentCertificate 230 97 97 := by decide
private theorem cert_231 : ExponentCertificate 231 98 97 := by decide
private theorem cert_232 : ExponentCertificate 232 98 98 := by decide
private theorem cert_233 : ExponentCertificate 233 98 98 := by decide
private theorem cert_234 : ExponentCertificate 234 99 98 := by decide
private theorem cert_235 : ExponentCertificate 235 99 99 := by decide
private theorem cert_236 : ExponentCertificate 236 100 99 := by decide
private theorem cert_237 : ExponentCertificate 237 100 99 := by decide
private theorem cert_238 : ExponentCertificate 238 100 100 := by decide
private theorem cert_239 : ExponentCertificate 239 101 100 := by decide
private theorem cert_240 : ExponentCertificate 240 101 100 := by decide
private theorem cert_241 : ExponentCertificate 241 101 101 := by decide
private theorem cert_242 : ExponentCertificate 242 102 101 := by decide
private theorem cert_243 : ExponentCertificate 243 102 101 := by decide
private theorem cert_244 : ExponentCertificate 244 102 102 := by decide
private theorem cert_245 : ExponentCertificate 245 103 102 := by decide
private theorem cert_246 : ExponentCertificate 246 103 102 := by decide
private theorem cert_247 : ExponentCertificate 247 103 103 := by decide
private theorem cert_248 : ExponentCertificate 248 104 103 := by decide
private theorem cert_249 : ExponentCertificate 249 104 103 := by decide
private theorem cert_250 : ExponentCertificate 250 104 104 := by decide
private theorem cert_251 : ExponentCertificate 251 105 104 := by decide
private theorem cert_252 : ExponentCertificate 252 105 104 := by decide
private theorem cert_253 : ExponentCertificate 253 105 105 := by decide
private theorem cert_254 : ExponentCertificate 254 106 105 := by decide
private theorem cert_255 : ExponentCertificate 255 106 105 := by decide
private theorem cert_256 : ExponentCertificate 256 106 106 := by decide
private theorem cert_257 : ExponentCertificate 257 107 106 := by decide
private theorem cert_258 : ExponentCertificate 258 107 106 := by decide
private theorem cert_259 : ExponentCertificate 259 107 107 := by decide
private theorem cert_260 : ExponentCertificate 260 108 107 := by decide
private theorem cert_261 : ExponentCertificate 261 108 108 := by decide
private theorem cert_262 : ExponentCertificate 262 108 108 := by decide
private theorem cert_263 : ExponentCertificate 263 109 108 := by decide
private theorem cert_264 : ExponentCertificate 264 109 109 := by decide
private theorem cert_265 : ExponentCertificate 265 109 109 := by decide
private theorem cert_266 : ExponentCertificate 266 110 109 := by decide
private theorem cert_267 : ExponentCertificate 267 110 110 := by decide
private theorem cert_268 : ExponentCertificate 268 110 110 := by decide
private theorem cert_269 : ExponentCertificate 269 111 110 := by decide
private theorem cert_270 : ExponentCertificate 270 111 111 := by decide
private theorem cert_271 : ExponentCertificate 271 111 111 := by decide
private theorem cert_272 : ExponentCertificate 272 112 111 := by decide
private theorem cert_273 : ExponentCertificate 273 112 112 := by decide
private theorem cert_274 : ExponentCertificate 274 112 112 := by decide
private theorem cert_275 : ExponentCertificate 275 113 112 := by decide
private theorem cert_276 : ExponentCertificate 276 113 113 := by decide
private theorem cert_277 : ExponentCertificate 277 113 113 := by decide
private theorem cert_278 : ExponentCertificate 278 114 113 := by decide
private theorem cert_279 : ExponentCertificate 279 114 114 := by decide
private theorem cert_280 : ExponentCertificate 280 115 114 := by decide
private theorem cert_281 : ExponentCertificate 281 115 114 := by decide
private theorem cert_282 : ExponentCertificate 282 115 115 := by decide
private theorem cert_283 : ExponentCertificate 283 116 115 := by decide
private theorem cert_284 : ExponentCertificate 284 116 115 := by decide
private theorem cert_285 : ExponentCertificate 285 116 116 := by decide
private theorem cert_286 : ExponentCertificate 286 117 116 := by decide
private theorem cert_287 : ExponentCertificate 287 117 116 := by decide
private theorem cert_288 : ExponentCertificate 288 117 117 := by decide
private theorem cert_289 : ExponentCertificate 289 118 117 := by decide
private theorem cert_290 : ExponentCertificate 290 118 117 := by decide
private theorem cert_291 : ExponentCertificate 291 118 118 := by decide
private theorem cert_292 : ExponentCertificate 292 119 118 := by decide
private theorem cert_293 : ExponentCertificate 293 119 118 := by decide
private theorem cert_294 : ExponentCertificate 294 119 119 := by decide
private theorem cert_295 : ExponentCertificate 295 120 119 := by decide
private theorem cert_296 : ExponentCertificate 296 120 119 := by decide
private theorem cert_297 : ExponentCertificate 297 120 120 := by decide
private theorem cert_298 : ExponentCertificate 298 121 120 := by decide
private theorem cert_299 : ExponentCertificate 299 121 120 := by decide
private theorem cert_300 : ExponentCertificate 300 121 121 := by decide
private theorem cert_301 : ExponentCertificate 301 122 121 := by decide
private theorem cert_302 : ExponentCertificate 302 122 121 := by decide
private theorem cert_303 : ExponentCertificate 303 122 122 := by decide
private theorem cert_304 : ExponentCertificate 304 123 122 := by decide
private theorem cert_305 : ExponentCertificate 305 123 122 := by decide
private theorem cert_306 : ExponentCertificate 306 123 123 := by decide
private theorem cert_307 : ExponentCertificate 307 124 123 := by decide
private theorem cert_308 : ExponentCertificate 308 124 123 := by decide
private theorem cert_309 : ExponentCertificate 309 124 124 := by decide
private theorem cert_310 : ExponentCertificate 310 125 124 := by decide
private theorem cert_311 : ExponentCertificate 311 125 124 := by decide
private theorem cert_312 : ExponentCertificate 312 125 125 := by decide
private theorem cert_313 : ExponentCertificate 313 126 125 := by decide
private theorem cert_314 : ExponentCertificate 314 126 125 := by decide
private theorem cert_315 : ExponentCertificate 315 126 126 := by decide
private theorem cert_316 : ExponentCertificate 316 127 126 := by decide
private theorem cert_317 : ExponentCertificate 317 127 126 := by decide
private theorem cert_318 : ExponentCertificate 318 127 127 := by decide
private theorem cert_319 : ExponentCertificate 319 128 127 := by decide
private theorem cert_320 : ExponentCertificate 320 128 127 := by decide
private theorem cert_321 : ExponentCertificate 321 128 128 := by decide
private theorem cert_322 : ExponentCertificate 322 128 128 := by decide
private theorem cert_323 : ExponentCertificate 323 129 128 := by decide
private theorem cert_324 : ExponentCertificate 324 129 129 := by decide
private theorem cert_325 : ExponentCertificate 325 129 129 := by decide
private theorem cert_326 : ExponentCertificate 326 130 129 := by decide
private theorem cert_327 : ExponentCertificate 327 130 130 := by decide
private theorem cert_328 : ExponentCertificate 328 130 130 := by decide
private theorem cert_329 : ExponentCertificate 329 131 130 := by decide
private theorem cert_330 : ExponentCertificate 330 131 131 := by decide
private theorem cert_331 : ExponentCertificate 331 131 131 := by decide
private theorem cert_332 : ExponentCertificate 332 132 131 := by decide
private theorem cert_333 : ExponentCertificate 333 132 132 := by decide
private theorem cert_334 : ExponentCertificate 334 132 132 := by decide
private theorem cert_335 : ExponentCertificate 335 133 132 := by decide
private theorem cert_336 : ExponentCertificate 336 133 132 := by decide
private theorem cert_337 : ExponentCertificate 337 133 133 := by decide
private theorem cert_338 : ExponentCertificate 338 134 133 := by decide
private theorem cert_339 : ExponentCertificate 339 134 133 := by decide
private theorem cert_340 : ExponentCertificate 340 134 134 := by decide
private theorem cert_341 : ExponentCertificate 341 135 134 := by decide
private theorem cert_342 : ExponentCertificate 342 135 134 := by decide
private theorem cert_343 : ExponentCertificate 343 135 135 := by decide
private theorem cert_344 : ExponentCertificate 344 136 135 := by decide
private theorem cert_345 : ExponentCertificate 345 136 135 := by decide
private theorem cert_346 : ExponentCertificate 346 136 136 := by decide
private theorem cert_347 : ExponentCertificate 347 137 136 := by decide
private theorem cert_348 : ExponentCertificate 348 137 136 := by decide
private theorem cert_349 : ExponentCertificate 349 137 137 := by decide
private theorem cert_350 : ExponentCertificate 350 138 137 := by decide
private theorem cert_351 : ExponentCertificate 351 138 137 := by decide
private theorem cert_352 : ExponentCertificate 352 138 138 := by decide
private theorem cert_353 : ExponentCertificate 353 139 138 := by decide
private theorem cert_354 : ExponentCertificate 354 139 138 := by decide
private theorem cert_355 : ExponentCertificate 355 139 139 := by decide
private theorem cert_356 : ExponentCertificate 356 140 139 := by decide
private theorem cert_357 : ExponentCertificate 357 140 139 := by decide
private theorem cert_358 : ExponentCertificate 358 140 140 := by decide
private theorem cert_359 : ExponentCertificate 359 141 140 := by decide
private theorem cert_360 : ExponentCertificate 360 141 140 := by decide
private theorem cert_361 : ExponentCertificate 361 141 141 := by decide
private theorem cert_362 : ExponentCertificate 362 142 141 := by decide
private theorem cert_363 : ExponentCertificate 363 142 141 := by decide
private theorem cert_364 : ExponentCertificate 364 142 142 := by decide
private theorem cert_365 : ExponentCertificate 365 143 142 := by decide
private theorem cert_366 : ExponentCertificate 366 143 142 := by decide
private theorem cert_367 : ExponentCertificate 367 143 143 := by decide
private theorem cert_368 : ExponentCertificate 368 144 143 := by decide
private theorem cert_369 : ExponentCertificate 369 144 143 := by decide
private theorem cert_370 : ExponentCertificate 370 144 144 := by decide
private theorem cert_371 : ExponentCertificate 371 145 144 := by decide
private theorem cert_372 : ExponentCertificate 372 145 144 := by decide
private theorem cert_373 : ExponentCertificate 373 145 145 := by decide
private theorem cert_374 : ExponentCertificate 374 145 145 := by decide
private theorem cert_375 : ExponentCertificate 375 146 145 := by decide
private theorem cert_376 : ExponentCertificate 376 146 146 := by decide
private theorem cert_377 : ExponentCertificate 377 146 146 := by decide
private theorem cert_378 : ExponentCertificate 378 147 146 := by decide
private theorem cert_379 : ExponentCertificate 379 147 146 := by decide
private theorem cert_380 : ExponentCertificate 380 147 147 := by decide
private theorem cert_381 : ExponentCertificate 381 148 147 := by decide
private theorem cert_382 : ExponentCertificate 382 148 147 := by decide
private theorem cert_383 : ExponentCertificate 383 148 148 := by decide
private theorem cert_384 : ExponentCertificate 384 149 148 := by decide
private theorem cert_385 : ExponentCertificate 385 149 148 := by decide
private theorem cert_386 : ExponentCertificate 386 149 149 := by decide
private theorem cert_387 : ExponentCertificate 387 150 149 := by decide
private theorem cert_388 : ExponentCertificate 388 150 149 := by decide
private theorem cert_389 : ExponentCertificate 389 150 150 := by decide
private theorem cert_390 : ExponentCertificate 390 151 150 := by decide
private theorem cert_391 : ExponentCertificate 391 151 150 := by decide
private theorem cert_392 : ExponentCertificate 392 151 151 := by decide
private theorem cert_393 : ExponentCertificate 393 152 151 := by decide
private theorem cert_394 : ExponentCertificate 394 152 151 := by decide
private theorem cert_395 : ExponentCertificate 395 152 152 := by decide
private theorem cert_396 : ExponentCertificate 396 153 152 := by decide
private theorem cert_397 : ExponentCertificate 397 153 152 := by decide
private theorem cert_398 : ExponentCertificate 398 153 153 := by decide
private theorem cert_399 : ExponentCertificate 399 154 153 := by decide
private theorem cert_400 : ExponentCertificate 400 154 153 := by decide
private theorem cert_401 : ExponentCertificate 401 154 154 := by decide
private theorem cert_402 : ExponentCertificate 402 154 154 := by decide
private theorem cert_403 : ExponentCertificate 403 155 154 := by decide
private theorem cert_404 : ExponentCertificate 404 155 155 := by decide
private theorem cert_405 : ExponentCertificate 405 155 155 := by decide
private theorem cert_406 : ExponentCertificate 406 156 155 := by decide
private theorem cert_407 : ExponentCertificate 407 156 155 := by decide
private theorem cert_408 : ExponentCertificate 408 156 156 := by decide
private theorem cert_409 : ExponentCertificate 409 157 156 := by decide
private theorem cert_410 : ExponentCertificate 410 157 156 := by decide
private theorem cert_411 : ExponentCertificate 411 157 157 := by decide
private theorem cert_412 : ExponentCertificate 412 158 157 := by decide
private theorem cert_413 : ExponentCertificate 413 158 157 := by decide
private theorem cert_414 : ExponentCertificate 414 158 158 := by decide
private theorem cert_415 : ExponentCertificate 415 159 158 := by decide
private theorem cert_416 : ExponentCertificate 416 159 158 := by decide
private theorem cert_417 : ExponentCertificate 417 159 159 := by decide
private theorem cert_418 : ExponentCertificate 418 160 159 := by decide
private theorem cert_419 : ExponentCertificate 419 160 159 := by decide
private theorem cert_420 : ExponentCertificate 420 160 160 := by decide
private theorem cert_421 : ExponentCertificate 421 161 160 := by decide
private theorem cert_422 : ExponentCertificate 422 161 160 := by decide
private theorem cert_423 : ExponentCertificate 423 161 161 := by decide
private theorem cert_424 : ExponentCertificate 424 161 161 := by decide
private theorem cert_425 : ExponentCertificate 425 162 161 := by decide
private theorem cert_426 : ExponentCertificate 426 162 162 := by decide
private theorem cert_427 : ExponentCertificate 427 162 162 := by decide
private theorem cert_428 : ExponentCertificate 428 163 162 := by decide
private theorem cert_429 : ExponentCertificate 429 163 162 := by decide
private theorem cert_430 : ExponentCertificate 430 163 163 := by decide
private theorem cert_431 : ExponentCertificate 431 164 163 := by decide
private theorem cert_432 : ExponentCertificate 432 164 163 := by decide
private theorem cert_433 : ExponentCertificate 433 164 164 := by decide
private theorem cert_434 : ExponentCertificate 434 165 164 := by decide
private theorem cert_435 : ExponentCertificate 435 165 164 := by decide
private theorem cert_436 : ExponentCertificate 436 165 165 := by decide
private theorem cert_437 : ExponentCertificate 437 166 165 := by decide
private theorem cert_438 : ExponentCertificate 438 166 165 := by decide
private theorem cert_439 : ExponentCertificate 439 166 166 := by decide
private theorem cert_440 : ExponentCertificate 440 167 166 := by decide
private theorem cert_441 : ExponentCertificate 441 167 166 := by decide
private theorem cert_442 : ExponentCertificate 442 167 167 := by decide
private theorem cert_443 : ExponentCertificate 443 168 167 := by decide
private theorem cert_444 : ExponentCertificate 444 168 167 := by decide
private theorem cert_445 : ExponentCertificate 445 168 168 := by decide
private theorem cert_446 : ExponentCertificate 446 168 168 := by decide
private theorem cert_447 : ExponentCertificate 447 169 168 := by decide
private theorem cert_448 : ExponentCertificate 448 169 168 := by decide
private theorem cert_449 : ExponentCertificate 449 169 169 := by decide
private theorem cert_450 : ExponentCertificate 450 170 169 := by decide
private theorem cert_451 : ExponentCertificate 451 170 169 := by decide
private theorem cert_452 : ExponentCertificate 452 170 170 := by decide
private theorem cert_453 : ExponentCertificate 453 171 170 := by decide
private theorem cert_454 : ExponentCertificate 454 171 170 := by decide
private theorem cert_455 : ExponentCertificate 455 171 171 := by decide
private theorem cert_456 : ExponentCertificate 456 172 171 := by decide
private theorem cert_457 : ExponentCertificate 457 172 171 := by decide
private theorem cert_458 : ExponentCertificate 458 172 172 := by decide
private theorem cert_459 : ExponentCertificate 459 173 172 := by decide
private theorem cert_460 : ExponentCertificate 460 173 172 := by decide
private theorem cert_461 : ExponentCertificate 461 173 173 := by decide
private theorem cert_462 : ExponentCertificate 462 174 173 := by decide
private theorem cert_463 : ExponentCertificate 463 174 173 := by decide
private theorem cert_464 : ExponentCertificate 464 174 174 := by decide
private theorem cert_465 : ExponentCertificate 465 174 174 := by decide
private theorem cert_466 : ExponentCertificate 466 175 174 := by decide
private theorem cert_467 : ExponentCertificate 467 175 174 := by decide
private theorem cert_468 : ExponentCertificate 468 175 175 := by decide
private theorem cert_469 : ExponentCertificate 469 176 175 := by decide
private theorem cert_470 : ExponentCertificate 470 176 175 := by decide
private theorem cert_471 : ExponentCertificate 471 176 176 := by decide
private theorem cert_472 : ExponentCertificate 472 177 176 := by decide
private theorem cert_473 : ExponentCertificate 473 177 176 := by decide
private theorem cert_474 : ExponentCertificate 474 177 177 := by decide
private theorem cert_475 : ExponentCertificate 475 178 177 := by decide
private theorem cert_476 : ExponentCertificate 476 178 177 := by decide
private theorem cert_477 : ExponentCertificate 477 178 178 := by decide
private theorem cert_478 : ExponentCertificate 478 179 178 := by decide
private theorem cert_479 : ExponentCertificate 479 179 178 := by decide
private theorem cert_480 : ExponentCertificate 480 179 179 := by decide
private theorem cert_481 : ExponentCertificate 481 179 179 := by decide
private theorem cert_482 : ExponentCertificate 482 180 179 := by decide
private theorem cert_483 : ExponentCertificate 483 180 179 := by decide
private theorem cert_484 : ExponentCertificate 484 180 180 := by decide
private theorem cert_485 : ExponentCertificate 485 181 180 := by decide
private theorem cert_486 : ExponentCertificate 486 181 180 := by decide
private theorem cert_487 : ExponentCertificate 487 181 181 := by decide
private theorem cert_488 : ExponentCertificate 488 182 181 := by decide
private theorem cert_489 : ExponentCertificate 489 182 181 := by decide
private theorem cert_490 : ExponentCertificate 490 182 182 := by decide
private theorem cert_491 : ExponentCertificate 491 183 182 := by decide
private theorem cert_492 : ExponentCertificate 492 183 182 := by decide
private theorem cert_493 : ExponentCertificate 493 183 183 := by decide
private theorem cert_494 : ExponentCertificate 494 184 183 := by decide
private theorem cert_495 : ExponentCertificate 495 184 183 := by decide
private theorem cert_496 : ExponentCertificate 496 184 184 := by decide
private theorem cert_497 : ExponentCertificate 497 184 184 := by decide
private theorem cert_498 : ExponentCertificate 498 185 184 := by decide
private theorem cert_499 : ExponentCertificate 499 185 184 := by decide
private theorem cert_500 : ExponentCertificate 500 185 185 := by decide
private theorem cert_501 : ExponentCertificate 501 186 185 := by decide
private theorem cert_502 : ExponentCertificate 502 186 185 := by decide
private theorem cert_503 : ExponentCertificate 503 186 186 := by decide
private theorem cert_504 : ExponentCertificate 504 187 186 := by decide
private theorem cert_505 : ExponentCertificate 505 187 186 := by decide
private theorem cert_506 : ExponentCertificate 506 187 187 := by decide
private theorem cert_507 : ExponentCertificate 507 188 187 := by decide
private theorem cert_508 : ExponentCertificate 508 188 187 := by decide
private theorem cert_509 : ExponentCertificate 509 188 188 := by decide
private theorem cert_510 : ExponentCertificate 510 188 188 := by decide
private theorem cert_511 : ExponentCertificate 511 189 188 := by decide
private theorem cert_512 : ExponentCertificate 512 189 188 := by decide
private theorem cert_513 : ExponentCertificate 513 189 189 := by decide
private theorem cert_514 : ExponentCertificate 514 190 189 := by decide
private theorem cert_515 : ExponentCertificate 515 190 189 := by decide
private theorem cert_516 : ExponentCertificate 516 190 190 := by decide
private theorem cert_517 : ExponentCertificate 517 191 190 := by decide
private theorem cert_518 : ExponentCertificate 518 191 190 := by decide
private theorem cert_519 : ExponentCertificate 519 191 191 := by decide
private theorem cert_520 : ExponentCertificate 520 192 191 := by decide
private theorem cert_521 : ExponentCertificate 521 192 191 := by decide
private theorem cert_522 : ExponentCertificate 522 192 192 := by decide
private theorem cert_523 : ExponentCertificate 523 193 192 := by decide
private theorem cert_524 : ExponentCertificate 524 193 192 := by decide
private theorem cert_525 : ExponentCertificate 525 193 193 := by decide
private theorem cert_526 : ExponentCertificate 526 193 193 := by decide
private theorem cert_527 : ExponentCertificate 527 194 193 := by decide
private theorem cert_528 : ExponentCertificate 528 194 193 := by decide
private theorem cert_529 : ExponentCertificate 529 194 194 := by decide
private theorem cert_530 : ExponentCertificate 530 195 194 := by decide
private theorem cert_531 : ExponentCertificate 531 195 194 := by decide
private theorem cert_532 : ExponentCertificate 532 195 195 := by decide
private theorem cert_533 : ExponentCertificate 533 196 195 := by decide
private theorem cert_534 : ExponentCertificate 534 196 195 := by decide
private theorem cert_535 : ExponentCertificate 535 196 196 := by decide
private theorem cert_536 : ExponentCertificate 536 197 196 := by decide
private theorem cert_537 : ExponentCertificate 537 197 196 := by decide
private theorem cert_538 : ExponentCertificate 538 197 197 := by decide
private theorem cert_539 : ExponentCertificate 539 197 197 := by decide
private theorem cert_540 : ExponentCertificate 540 198 197 := by decide
private theorem cert_541 : ExponentCertificate 541 198 197 := by decide
private theorem cert_542 : ExponentCertificate 542 198 198 := by decide
private theorem cert_543 : ExponentCertificate 543 199 198 := by decide
private theorem cert_544 : ExponentCertificate 544 199 198 := by decide
private theorem cert_545 : ExponentCertificate 545 199 199 := by decide
private theorem cert_546 : ExponentCertificate 546 200 199 := by decide
private theorem cert_547 : ExponentCertificate 547 200 199 := by decide
private theorem cert_548 : ExponentCertificate 548 200 200 := by decide
private theorem cert_549 : ExponentCertificate 549 201 200 := by decide
private theorem cert_550 : ExponentCertificate 550 201 200 := by decide
private theorem cert_551 : ExponentCertificate 551 201 201 := by decide
private theorem cert_552 : ExponentCertificate 552 201 201 := by decide
private theorem cert_553 : ExponentCertificate 553 202 201 := by decide
private theorem cert_554 : ExponentCertificate 554 202 201 := by decide
private theorem cert_555 : ExponentCertificate 555 202 202 := by decide
private theorem cert_556 : ExponentCertificate 556 203 202 := by decide
private theorem cert_557 : ExponentCertificate 557 203 202 := by decide
private theorem cert_558 : ExponentCertificate 558 203 203 := by decide
private theorem cert_559 : ExponentCertificate 559 204 203 := by decide
private theorem cert_560 : ExponentCertificate 560 204 203 := by decide
private theorem cert_561 : ExponentCertificate 561 204 204 := by decide
private theorem cert_562 : ExponentCertificate 562 205 204 := by decide
private theorem cert_563 : ExponentCertificate 563 205 204 := by decide
private theorem cert_564 : ExponentCertificate 564 205 204 := by decide
private theorem cert_565 : ExponentCertificate 565 205 205 := by decide
private theorem cert_566 : ExponentCertificate 566 206 205 := by decide
private theorem cert_567 : ExponentCertificate 567 206 205 := by decide
private theorem cert_568 : ExponentCertificate 568 206 206 := by decide
private theorem cert_569 : ExponentCertificate 569 207 206 := by decide
private theorem cert_570 : ExponentCertificate 570 207 206 := by decide
private theorem cert_571 : ExponentCertificate 571 207 207 := by decide
private theorem cert_572 : ExponentCertificate 572 208 207 := by decide
private theorem cert_573 : ExponentCertificate 573 208 207 := by decide
private theorem cert_574 : ExponentCertificate 574 208 208 := by decide
private theorem cert_575 : ExponentCertificate 575 208 208 := by decide
private theorem cert_576 : ExponentCertificate 576 209 208 := by decide
private theorem cert_577 : ExponentCertificate 577 209 208 := by decide
private theorem cert_578 : ExponentCertificate 578 209 209 := by decide
private theorem cert_579 : ExponentCertificate 579 210 209 := by decide
private theorem cert_580 : ExponentCertificate 580 210 209 := by decide
private theorem cert_581 : ExponentCertificate 581 210 210 := by decide
private theorem cert_582 : ExponentCertificate 582 211 210 := by decide
private theorem cert_583 : ExponentCertificate 583 211 210 := by decide
private theorem cert_584 : ExponentCertificate 584 211 211 := by decide
private theorem cert_585 : ExponentCertificate 585 212 211 := by decide
private theorem cert_586 : ExponentCertificate 586 212 211 := by decide
private theorem cert_587 : ExponentCertificate 587 212 212 := by decide
private theorem cert_588 : ExponentCertificate 588 212 212 := by decide
private theorem cert_589 : ExponentCertificate 589 213 212 := by decide
private theorem cert_590 : ExponentCertificate 590 213 212 := by decide
private theorem cert_591 : ExponentCertificate 591 213 213 := by decide
private theorem cert_592 : ExponentCertificate 592 214 213 := by decide
private theorem cert_593 : ExponentCertificate 593 214 213 := by decide
private theorem cert_594 : ExponentCertificate 594 214 214 := by decide
private theorem cert_595 : ExponentCertificate 595 215 214 := by decide
private theorem cert_596 : ExponentCertificate 596 215 214 := by decide
private theorem cert_597 : ExponentCertificate 597 215 215 := by decide
private theorem cert_598 : ExponentCertificate 598 216 215 := by decide
private theorem cert_599 : ExponentCertificate 599 216 215 := by decide
private theorem cert_600 : ExponentCertificate 600 216 215 := by decide
private theorem cert_601 : ExponentCertificate 601 216 216 := by decide
private theorem cert_602 : ExponentCertificate 602 217 216 := by decide
private theorem cert_603 : ExponentCertificate 603 217 216 := by decide
private theorem cert_604 : ExponentCertificate 604 217 217 := by decide
private theorem cert_605 : ExponentCertificate 605 218 217 := by decide
private theorem cert_606 : ExponentCertificate 606 218 217 := by decide
private theorem cert_607 : ExponentCertificate 607 218 218 := by decide
private theorem cert_608 : ExponentCertificate 608 219 218 := by decide
private theorem cert_609 : ExponentCertificate 609 219 218 := by decide
private theorem cert_610 : ExponentCertificate 610 219 219 := by decide
private theorem cert_611 : ExponentCertificate 611 219 219 := by decide
private theorem cert_612 : ExponentCertificate 612 220 219 := by decide
private theorem cert_613 : ExponentCertificate 613 220 219 := by decide
private theorem cert_614 : ExponentCertificate 614 220 220 := by decide
private theorem cert_615 : ExponentCertificate 615 221 220 := by decide
private theorem cert_616 : ExponentCertificate 616 221 220 := by decide
private theorem cert_617 : ExponentCertificate 617 221 221 := by decide
private theorem cert_618 : ExponentCertificate 618 222 221 := by decide
private theorem cert_619 : ExponentCertificate 619 222 221 := by decide
private theorem cert_620 : ExponentCertificate 620 222 222 := by decide
private theorem cert_621 : ExponentCertificate 621 222 222 := by decide
private theorem cert_622 : ExponentCertificate 622 223 222 := by decide
private theorem cert_623 : ExponentCertificate 623 223 222 := by decide
private theorem cert_624 : ExponentCertificate 624 223 223 := by decide
private theorem cert_625 : ExponentCertificate 625 224 223 := by decide
private theorem cert_626 : ExponentCertificate 626 224 223 := by decide
private theorem cert_627 : ExponentCertificate 627 224 224 := by decide
private theorem cert_628 : ExponentCertificate 628 225 224 := by decide
private theorem cert_629 : ExponentCertificate 629 225 224 := by decide
private theorem cert_630 : ExponentCertificate 630 225 225 := by decide
private theorem cert_631 : ExponentCertificate 631 225 225 := by decide
private theorem cert_632 : ExponentCertificate 632 226 225 := by decide
private theorem cert_633 : ExponentCertificate 633 226 225 := by decide
private theorem cert_634 : ExponentCertificate 634 226 226 := by decide
private theorem cert_635 : ExponentCertificate 635 227 226 := by decide
private theorem cert_636 : ExponentCertificate 636 227 226 := by decide
private theorem cert_637 : ExponentCertificate 637 227 227 := by decide
private theorem cert_638 : ExponentCertificate 638 228 227 := by decide
private theorem cert_639 : ExponentCertificate 639 228 227 := by decide
private theorem cert_640 : ExponentCertificate 640 228 228 := by decide
private theorem cert_641 : ExponentCertificate 641 229 228 := by decide
private theorem cert_642 : ExponentCertificate 642 229 228 := by decide
private theorem cert_643 : ExponentCertificate 643 229 228 := by decide
private theorem cert_644 : ExponentCertificate 644 229 229 := by decide
private theorem cert_645 : ExponentCertificate 645 230 229 := by decide
private theorem cert_646 : ExponentCertificate 646 230 229 := by decide
private theorem cert_647 : ExponentCertificate 647 230 230 := by decide
private theorem cert_648 : ExponentCertificate 648 231 230 := by decide
private theorem cert_649 : ExponentCertificate 649 231 230 := by decide
private theorem cert_650 : ExponentCertificate 650 231 231 := by decide
private theorem cert_651 : ExponentCertificate 651 232 231 := by decide
private theorem cert_652 : ExponentCertificate 652 232 231 := by decide
private theorem cert_653 : ExponentCertificate 653 232 231 := by decide
private theorem cert_654 : ExponentCertificate 654 232 232 := by decide
private theorem cert_655 : ExponentCertificate 655 233 232 := by decide
private theorem cert_656 : ExponentCertificate 656 233 232 := by decide
private theorem cert_657 : ExponentCertificate 657 233 233 := by decide
private theorem cert_658 : ExponentCertificate 658 234 233 := by decide
private theorem cert_659 : ExponentCertificate 659 234 233 := by decide
private theorem cert_660 : ExponentCertificate 660 234 234 := by decide
private theorem cert_661 : ExponentCertificate 661 235 234 := by decide
private theorem cert_662 : ExponentCertificate 662 235 234 := by decide
private theorem cert_663 : ExponentCertificate 663 235 234 := by decide
private theorem cert_664 : ExponentCertificate 664 235 235 := by decide
private theorem cert_665 : ExponentCertificate 665 236 235 := by decide
private theorem cert_666 : ExponentCertificate 666 236 235 := by decide
private theorem cert_667 : ExponentCertificate 667 236 236 := by decide
private theorem cert_668 : ExponentCertificate 668 237 236 := by decide
private theorem cert_669 : ExponentCertificate 669 237 236 := by decide
private theorem cert_670 : ExponentCertificate 670 237 237 := by decide
private theorem cert_671 : ExponentCertificate 671 238 237 := by decide
private theorem cert_672 : ExponentCertificate 672 238 237 := by decide
private theorem cert_673 : ExponentCertificate 673 238 237 := by decide
private theorem cert_674 : ExponentCertificate 674 238 238 := by decide
private theorem cert_675 : ExponentCertificate 675 239 238 := by decide
private theorem cert_676 : ExponentCertificate 676 239 238 := by decide
private theorem cert_677 : ExponentCertificate 677 239 239 := by decide
private theorem cert_678 : ExponentCertificate 678 240 239 := by decide
private theorem cert_679 : ExponentCertificate 679 240 239 := by decide
private theorem cert_680 : ExponentCertificate 680 240 240 := by decide
private theorem cert_681 : ExponentCertificate 681 241 240 := by decide
private theorem cert_682 : ExponentCertificate 682 241 240 := by decide
private theorem cert_683 : ExponentCertificate 683 241 240 := by decide
private theorem cert_684 : ExponentCertificate 684 241 241 := by decide
private theorem cert_685 : ExponentCertificate 685 242 241 := by decide
private theorem cert_686 : ExponentCertificate 686 242 241 := by decide
private theorem cert_687 : ExponentCertificate 687 242 242 := by decide
private theorem cert_688 : ExponentCertificate 688 243 242 := by decide
private theorem cert_689 : ExponentCertificate 689 243 242 := by decide
private theorem cert_690 : ExponentCertificate 690 243 243 := by decide
private theorem cert_691 : ExponentCertificate 691 244 243 := by decide
private theorem cert_692 : ExponentCertificate 692 244 243 := by decide
private theorem cert_693 : ExponentCertificate 693 244 243 := by decide
private theorem cert_694 : ExponentCertificate 694 244 244 := by decide
private theorem cert_695 : ExponentCertificate 695 245 244 := by decide
private theorem cert_696 : ExponentCertificate 696 245 244 := by decide
private theorem cert_697 : ExponentCertificate 697 245 245 := by decide
private theorem cert_698 : ExponentCertificate 698 246 245 := by decide
private theorem cert_699 : ExponentCertificate 699 246 245 := by decide
private theorem cert_700 : ExponentCertificate 700 246 246 := by decide
private theorem cert_701 : ExponentCertificate 701 246 246 := by decide
private theorem cert_702 : ExponentCertificate 702 247 246 := by decide
private theorem cert_703 : ExponentCertificate 703 247 246 := by decide
private theorem cert_704 : ExponentCertificate 704 247 247 := by decide
private theorem cert_705 : ExponentCertificate 705 248 247 := by decide
private theorem cert_706 : ExponentCertificate 706 248 247 := by decide
private theorem cert_707 : ExponentCertificate 707 248 248 := by decide
private theorem cert_708 : ExponentCertificate 708 249 248 := by decide
private theorem cert_709 : ExponentCertificate 709 249 248 := by decide
private theorem cert_710 : ExponentCertificate 710 249 249 := by decide
private theorem cert_711 : ExponentCertificate 711 249 249 := by decide
private theorem cert_712 : ExponentCertificate 712 250 249 := by decide
private theorem cert_713 : ExponentCertificate 713 250 249 := by decide
private theorem cert_714 : ExponentCertificate 714 250 250 := by decide
private theorem cert_715 : ExponentCertificate 715 251 250 := by decide
private theorem cert_716 : ExponentCertificate 716 251 250 := by decide
private theorem cert_717 : ExponentCertificate 717 251 251 := by decide
private theorem cert_718 : ExponentCertificate 718 252 251 := by decide
private theorem cert_719 : ExponentCertificate 719 252 251 := by decide
private theorem cert_720 : ExponentCertificate 720 252 251 := by decide
private theorem cert_721 : ExponentCertificate 721 252 252 := by decide
private theorem cert_722 : ExponentCertificate 722 253 252 := by decide
private theorem cert_723 : ExponentCertificate 723 253 252 := by decide
private theorem cert_724 : ExponentCertificate 724 253 253 := by decide
private theorem cert_725 : ExponentCertificate 725 254 253 := by decide
private theorem cert_726 : ExponentCertificate 726 254 253 := by decide
private theorem cert_727 : ExponentCertificate 727 254 254 := by decide
private theorem cert_728 : ExponentCertificate 728 255 254 := by decide
private theorem cert_729 : ExponentCertificate 729 255 254 := by decide
private theorem cert_730 : ExponentCertificate 730 255 254 := by decide
private theorem cert_731 : ExponentCertificate 731 255 255 := by decide
private theorem cert_732 : ExponentCertificate 732 256 255 := by decide
private theorem cert_733 : ExponentCertificate 733 256 255 := by decide
private theorem cert_734 : ExponentCertificate 734 256 256 := by decide
private theorem cert_735 : ExponentCertificate 735 257 256 := by decide
private theorem cert_736 : ExponentCertificate 736 257 256 := by decide
private theorem cert_737 : ExponentCertificate 737 257 257 := by decide
private theorem cert_738 : ExponentCertificate 738 257 257 := by decide
private theorem cert_739 : ExponentCertificate 739 258 257 := by decide
private theorem cert_740 : ExponentCertificate 740 258 257 := by decide
private theorem cert_741 : ExponentCertificate 741 258 258 := by decide
private theorem cert_742 : ExponentCertificate 742 259 258 := by decide
private theorem cert_743 : ExponentCertificate 743 259 258 := by decide
private theorem cert_744 : ExponentCertificate 744 259 259 := by decide
private theorem cert_745 : ExponentCertificate 745 260 259 := by decide
private theorem cert_746 : ExponentCertificate 746 260 259 := by decide
private theorem cert_747 : ExponentCertificate 747 260 259 := by decide
private theorem cert_748 : ExponentCertificate 748 260 260 := by decide
private theorem cert_749 : ExponentCertificate 749 261 260 := by decide
private theorem cert_750 : ExponentCertificate 750 261 260 := by decide
private theorem cert_751 : ExponentCertificate 751 261 261 := by decide
private theorem cert_752 : ExponentCertificate 752 262 261 := by decide
private theorem cert_753 : ExponentCertificate 753 262 261 := by decide
private theorem cert_754 : ExponentCertificate 754 262 262 := by decide
private theorem cert_755 : ExponentCertificate 755 262 262 := by decide
private theorem cert_756 : ExponentCertificate 756 263 262 := by decide
private theorem cert_757 : ExponentCertificate 757 263 262 := by decide
private theorem cert_758 : ExponentCertificate 758 263 263 := by decide
private theorem cert_759 : ExponentCertificate 759 264 263 := by decide
private theorem cert_760 : ExponentCertificate 760 264 263 := by decide
private theorem cert_761 : ExponentCertificate 761 264 264 := by decide
private theorem cert_762 : ExponentCertificate 762 265 264 := by decide
private theorem cert_763 : ExponentCertificate 763 265 264 := by decide
private theorem cert_764 : ExponentCertificate 764 265 264 := by decide
private theorem cert_765 : ExponentCertificate 765 265 265 := by decide
private theorem cert_766 : ExponentCertificate 766 266 265 := by decide
private theorem cert_767 : ExponentCertificate 767 266 265 := by decide
private theorem cert_768 : ExponentCertificate 768 266 266 := by decide
private theorem cert_769 : ExponentCertificate 769 267 266 := by decide
private theorem cert_770 : ExponentCertificate 770 267 266 := by decide
private theorem cert_771 : ExponentCertificate 771 267 267 := by decide
private theorem cert_772 : ExponentCertificate 772 268 267 := by decide
private theorem cert_773 : ExponentCertificate 773 268 267 := by decide
private theorem cert_774 : ExponentCertificate 774 268 267 := by decide
private theorem cert_775 : ExponentCertificate 775 268 268 := by decide
private theorem cert_776 : ExponentCertificate 776 269 268 := by decide
private theorem cert_777 : ExponentCertificate 777 269 268 := by decide
private theorem cert_778 : ExponentCertificate 778 269 269 := by decide
private theorem cert_779 : ExponentCertificate 779 270 269 := by decide
private theorem cert_780 : ExponentCertificate 780 270 269 := by decide
private theorem cert_781 : ExponentCertificate 781 270 269 := by decide
private theorem cert_782 : ExponentCertificate 782 270 270 := by decide
private theorem cert_783 : ExponentCertificate 783 271 270 := by decide
private theorem cert_784 : ExponentCertificate 784 271 270 := by decide
private theorem cert_785 : ExponentCertificate 785 271 271 := by decide
private theorem cert_786 : ExponentCertificate 786 272 271 := by decide
private theorem cert_787 : ExponentCertificate 787 272 271 := by decide
private theorem cert_788 : ExponentCertificate 788 272 272 := by decide
private theorem cert_789 : ExponentCertificate 789 272 272 := by decide
private theorem cert_790 : ExponentCertificate 790 273 272 := by decide
private theorem cert_791 : ExponentCertificate 791 273 272 := by decide
private theorem cert_792 : ExponentCertificate 792 273 273 := by decide
private theorem cert_793 : ExponentCertificate 793 274 273 := by decide
private theorem cert_794 : ExponentCertificate 794 274 273 := by decide
private theorem cert_795 : ExponentCertificate 795 274 274 := by decide
private theorem cert_796 : ExponentCertificate 796 275 274 := by decide
private theorem cert_797 : ExponentCertificate 797 275 274 := by decide
private theorem cert_798 : ExponentCertificate 798 275 274 := by decide
private theorem cert_799 : ExponentCertificate 799 275 275 := by decide
private theorem cert_800 : ExponentCertificate 800 276 275 := by decide
private theorem cert_801 : ExponentCertificate 801 276 275 := by decide
private theorem cert_802 : ExponentCertificate 802 276 276 := by decide
private theorem cert_803 : ExponentCertificate 803 277 276 := by decide
private theorem cert_804 : ExponentCertificate 804 277 276 := by decide
private theorem cert_805 : ExponentCertificate 805 277 277 := by decide
private theorem cert_806 : ExponentCertificate 806 277 277 := by decide
private theorem cert_807 : ExponentCertificate 807 278 277 := by decide
private theorem cert_808 : ExponentCertificate 808 278 277 := by decide
private theorem cert_809 : ExponentCertificate 809 278 278 := by decide
private theorem cert_810 : ExponentCertificate 810 279 278 := by decide
private theorem cert_811 : ExponentCertificate 811 279 278 := by decide
private theorem cert_812 : ExponentCertificate 812 279 279 := by decide
private theorem cert_813 : ExponentCertificate 813 280 279 := by decide
private theorem cert_814 : ExponentCertificate 814 280 279 := by decide
private theorem cert_815 : ExponentCertificate 815 280 279 := by decide
private theorem cert_816 : ExponentCertificate 816 280 280 := by decide
private theorem cert_817 : ExponentCertificate 817 281 280 := by decide
private theorem cert_818 : ExponentCertificate 818 281 280 := by decide
private theorem cert_819 : ExponentCertificate 819 281 281 := by decide
private theorem cert_820 : ExponentCertificate 820 282 281 := by decide
private theorem cert_821 : ExponentCertificate 821 282 281 := by decide
private theorem cert_822 : ExponentCertificate 822 282 282 := by decide
private theorem cert_823 : ExponentCertificate 823 282 282 := by decide
private theorem cert_824 : ExponentCertificate 824 283 282 := by decide
private theorem cert_825 : ExponentCertificate 825 283 282 := by decide
private theorem cert_826 : ExponentCertificate 826 283 283 := by decide
private theorem cert_827 : ExponentCertificate 827 284 283 := by decide
private theorem cert_828 : ExponentCertificate 828 284 283 := by decide
private theorem cert_829 : ExponentCertificate 829 284 284 := by decide
private theorem cert_830 : ExponentCertificate 830 284 284 := by decide
private theorem cert_831 : ExponentCertificate 831 285 284 := by decide
private theorem cert_832 : ExponentCertificate 832 285 284 := by decide
private theorem cert_833 : ExponentCertificate 833 285 285 := by decide
private theorem cert_834 : ExponentCertificate 834 286 285 := by decide
private theorem cert_835 : ExponentCertificate 835 286 285 := by decide
private theorem cert_836 : ExponentCertificate 836 286 286 := by decide
private theorem cert_837 : ExponentCertificate 837 287 286 := by decide
private theorem cert_838 : ExponentCertificate 838 287 286 := by decide
private theorem cert_839 : ExponentCertificate 839 287 286 := by decide
private theorem cert_840 : ExponentCertificate 840 287 287 := by decide
private theorem cert_841 : ExponentCertificate 841 288 287 := by decide
private theorem cert_842 : ExponentCertificate 842 288 287 := by decide
private theorem cert_843 : ExponentCertificate 843 288 288 := by decide
private theorem cert_844 : ExponentCertificate 844 289 288 := by decide
private theorem cert_845 : ExponentCertificate 845 289 288 := by decide
private theorem cert_846 : ExponentCertificate 846 289 288 := by decide
private theorem cert_847 : ExponentCertificate 847 289 289 := by decide
private theorem cert_848 : ExponentCertificate 848 290 289 := by decide
private theorem cert_849 : ExponentCertificate 849 290 289 := by decide
private theorem cert_850 : ExponentCertificate 850 290 290 := by decide
private theorem cert_851 : ExponentCertificate 851 291 290 := by decide
private theorem cert_852 : ExponentCertificate 852 291 290 := by decide
private theorem cert_853 : ExponentCertificate 853 291 291 := by decide
private theorem cert_854 : ExponentCertificate 854 291 291 := by decide
private theorem cert_855 : ExponentCertificate 855 292 291 := by decide
private theorem cert_856 : ExponentCertificate 856 292 291 := by decide
private theorem cert_857 : ExponentCertificate 857 292 292 := by decide
private theorem cert_858 : ExponentCertificate 858 293 292 := by decide
private theorem cert_859 : ExponentCertificate 859 293 292 := by decide
private theorem cert_860 : ExponentCertificate 860 293 293 := by decide
private theorem cert_861 : ExponentCertificate 861 294 293 := by decide
private theorem cert_862 : ExponentCertificate 862 294 293 := by decide
private theorem cert_863 : ExponentCertificate 863 294 293 := by decide
private theorem cert_864 : ExponentCertificate 864 294 294 := by decide
private theorem cert_865 : ExponentCertificate 865 295 294 := by decide
private theorem cert_866 : ExponentCertificate 866 295 294 := by decide
private theorem cert_867 : ExponentCertificate 867 295 295 := by decide
private theorem cert_868 : ExponentCertificate 868 296 295 := by decide
private theorem cert_869 : ExponentCertificate 869 296 295 := by decide
private theorem cert_870 : ExponentCertificate 870 296 295 := by decide
private theorem cert_871 : ExponentCertificate 871 296 296 := by decide
private theorem cert_872 : ExponentCertificate 872 297 296 := by decide
private theorem cert_873 : ExponentCertificate 873 297 296 := by decide
private theorem cert_874 : ExponentCertificate 874 297 297 := by decide
private theorem cert_875 : ExponentCertificate 875 298 297 := by decide
private theorem cert_876 : ExponentCertificate 876 298 297 := by decide
private theorem cert_877 : ExponentCertificate 877 298 297 := by decide
private theorem cert_878 : ExponentCertificate 878 298 298 := by decide
private theorem cert_879 : ExponentCertificate 879 299 298 := by decide
private theorem cert_880 : ExponentCertificate 880 299 298 := by decide
private theorem cert_881 : ExponentCertificate 881 299 299 := by decide
private theorem cert_882 : ExponentCertificate 882 300 299 := by decide
private theorem cert_883 : ExponentCertificate 883 300 299 := by decide
private theorem cert_884 : ExponentCertificate 884 300 300 := by decide
private theorem cert_885 : ExponentCertificate 885 300 300 := by decide
private theorem cert_886 : ExponentCertificate 886 301 300 := by decide
private theorem cert_887 : ExponentCertificate 887 301 300 := by decide
private theorem cert_888 : ExponentCertificate 888 301 301 := by decide
private theorem cert_889 : ExponentCertificate 889 302 301 := by decide
private theorem cert_890 : ExponentCertificate 890 302 301 := by decide
private theorem cert_891 : ExponentCertificate 891 302 302 := by decide
private theorem cert_892 : ExponentCertificate 892 302 302 := by decide
private theorem cert_893 : ExponentCertificate 893 303 302 := by decide
private theorem cert_894 : ExponentCertificate 894 303 302 := by decide
private theorem cert_895 : ExponentCertificate 895 303 303 := by decide
private theorem cert_896 : ExponentCertificate 896 304 303 := by decide
private theorem cert_897 : ExponentCertificate 897 304 303 := by decide
private theorem cert_898 : ExponentCertificate 898 304 304 := by decide
private theorem cert_899 : ExponentCertificate 899 305 304 := by decide
private theorem cert_900 : ExponentCertificate 900 305 304 := by decide
private theorem cert_901 : ExponentCertificate 901 305 304 := by decide
private theorem cert_902 : ExponentCertificate 902 305 305 := by decide
private theorem cert_903 : ExponentCertificate 903 306 305 := by decide
private theorem cert_904 : ExponentCertificate 904 306 305 := by decide
private theorem cert_905 : ExponentCertificate 905 306 306 := by decide
private theorem cert_906 : ExponentCertificate 906 307 306 := by decide
private theorem cert_907 : ExponentCertificate 907 307 306 := by decide
private theorem cert_908 : ExponentCertificate 908 307 306 := by decide
private theorem cert_909 : ExponentCertificate 909 307 307 := by decide
private theorem cert_910 : ExponentCertificate 910 308 307 := by decide
private theorem cert_911 : ExponentCertificate 911 308 307 := by decide
private theorem cert_912 : ExponentCertificate 912 308 308 := by decide
private theorem cert_913 : ExponentCertificate 913 309 308 := by decide
private theorem cert_914 : ExponentCertificate 914 309 308 := by decide
private theorem cert_915 : ExponentCertificate 915 309 308 := by decide
private theorem cert_916 : ExponentCertificate 916 309 309 := by decide
private theorem cert_917 : ExponentCertificate 917 310 309 := by decide
private theorem cert_918 : ExponentCertificate 918 310 309 := by decide
private theorem cert_919 : ExponentCertificate 919 310 310 := by decide
private theorem cert_920 : ExponentCertificate 920 311 310 := by decide
private theorem cert_921 : ExponentCertificate 921 311 310 := by decide
private theorem cert_922 : ExponentCertificate 922 311 310 := by decide
private theorem cert_923 : ExponentCertificate 923 311 311 := by decide
private theorem cert_924 : ExponentCertificate 924 312 311 := by decide
private theorem cert_925 : ExponentCertificate 925 312 311 := by decide
private theorem cert_926 : ExponentCertificate 926 312 312 := by decide
private theorem cert_927 : ExponentCertificate 927 313 312 := by decide
private theorem cert_928 : ExponentCertificate 928 313 312 := by decide
private theorem cert_929 : ExponentCertificate 929 313 313 := by decide
private theorem cert_930 : ExponentCertificate 930 313 313 := by decide
private theorem cert_931 : ExponentCertificate 931 314 313 := by decide
private theorem cert_932 : ExponentCertificate 932 314 313 := by decide
private theorem cert_933 : ExponentCertificate 933 314 314 := by decide
private theorem cert_934 : ExponentCertificate 934 315 314 := by decide
private theorem cert_935 : ExponentCertificate 935 315 314 := by decide
private theorem cert_936 : ExponentCertificate 936 315 315 := by decide
private theorem cert_937 : ExponentCertificate 937 315 315 := by decide
private theorem cert_938 : ExponentCertificate 938 316 315 := by decide
private theorem cert_939 : ExponentCertificate 939 316 315 := by decide
private theorem cert_940 : ExponentCertificate 940 316 316 := by decide
private theorem cert_941 : ExponentCertificate 941 317 316 := by decide
private theorem cert_942 : ExponentCertificate 942 317 316 := by decide
private theorem cert_943 : ExponentCertificate 943 317 317 := by decide
private theorem cert_944 : ExponentCertificate 944 317 317 := by decide
private theorem cert_945 : ExponentCertificate 945 318 317 := by decide
private theorem cert_946 : ExponentCertificate 946 318 317 := by decide
private theorem cert_947 : ExponentCertificate 947 318 318 := by decide
private theorem cert_948 : ExponentCertificate 948 319 318 := by decide
private theorem cert_949 : ExponentCertificate 949 319 318 := by decide
private theorem cert_950 : ExponentCertificate 950 319 319 := by decide
private theorem cert_951 : ExponentCertificate 951 319 319 := by decide
private theorem cert_952 : ExponentCertificate 952 320 319 := by decide
private theorem cert_953 : ExponentCertificate 953 320 319 := by decide
private theorem cert_954 : ExponentCertificate 954 320 320 := by decide
private theorem cert_955 : ExponentCertificate 955 321 320 := by decide
private theorem cert_956 : ExponentCertificate 956 321 320 := by decide
private theorem cert_957 : ExponentCertificate 957 321 321 := by decide
private theorem cert_958 : ExponentCertificate 958 321 321 := by decide
private theorem cert_959 : ExponentCertificate 959 322 321 := by decide
private theorem cert_960 : ExponentCertificate 960 322 321 := by decide
private theorem cert_961 : ExponentCertificate 961 322 322 := by decide
private theorem cert_962 : ExponentCertificate 962 323 322 := by decide
private theorem cert_963 : ExponentCertificate 963 323 322 := by decide
private theorem cert_964 : ExponentCertificate 964 323 323 := by decide
private theorem cert_965 : ExponentCertificate 965 323 323 := by decide
private theorem cert_966 : ExponentCertificate 966 324 323 := by decide
private theorem cert_967 : ExponentCertificate 967 324 323 := by decide
private theorem cert_968 : ExponentCertificate 968 324 324 := by decide
private theorem cert_969 : ExponentCertificate 969 325 324 := by decide
private theorem cert_970 : ExponentCertificate 970 325 324 := by decide
private theorem cert_971 : ExponentCertificate 971 325 325 := by decide
private theorem cert_972 : ExponentCertificate 972 326 325 := by decide
private theorem cert_973 : ExponentCertificate 973 326 325 := by decide
private theorem cert_974 : ExponentCertificate 974 326 325 := by decide
private theorem cert_975 : ExponentCertificate 975 326 326 := by decide
private theorem cert_976 : ExponentCertificate 976 327 326 := by decide
private theorem cert_977 : ExponentCertificate 977 327 326 := by decide
private theorem cert_978 : ExponentCertificate 978 327 327 := by decide
private theorem cert_979 : ExponentCertificate 979 328 327 := by decide
private theorem cert_980 : ExponentCertificate 980 328 327 := by decide
private theorem cert_981 : ExponentCertificate 981 328 327 := by decide
private theorem cert_982 : ExponentCertificate 982 328 328 := by decide
private theorem cert_983 : ExponentCertificate 983 329 328 := by decide
private theorem cert_984 : ExponentCertificate 984 329 328 := by decide
private theorem cert_985 : ExponentCertificate 985 329 329 := by decide
private theorem cert_986 : ExponentCertificate 986 330 329 := by decide
private theorem cert_987 : ExponentCertificate 987 330 329 := by decide
private theorem cert_988 : ExponentCertificate 988 330 329 := by decide
private theorem cert_989 : ExponentCertificate 989 330 330 := by decide
private theorem cert_990 : ExponentCertificate 990 331 330 := by decide
private theorem cert_991 : ExponentCertificate 991 331 330 := by decide
private theorem cert_992 : ExponentCertificate 992 331 331 := by decide
private theorem cert_993 : ExponentCertificate 993 332 331 := by decide
private theorem cert_994 : ExponentCertificate 994 332 331 := by decide
private theorem cert_995 : ExponentCertificate 995 332 331 := by decide
private theorem cert_996 : ExponentCertificate 996 332 332 := by decide
private theorem cert_997 : ExponentCertificate 997 333 332 := by decide
private theorem cert_998 : ExponentCertificate 998 333 332 := by decide
private theorem cert_999 : ExponentCertificate 999 333 333 := by decide
private theorem cert_1000 : ExponentCertificate 1000 333 333 := by decide

private theorem certificate_up_to_1000 {k : ℕ} (hlo : 3 ≤ k) (hhi : k ≤ 1000) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨5, 6, cert_3⟩
  · exact ⟨5, 6, cert_4⟩
  · exact ⟨6, 7, cert_5⟩
  · exact ⟨7, 7, cert_6⟩
  · exact ⟨8, 8, cert_7⟩
  · exact ⟨8, 8, cert_8⟩
  · exact ⟨9, 9, cert_9⟩
  · exact ⟨9, 9, cert_10⟩
  · exact ⟨10, 10, cert_11⟩
  · exact ⟨11, 11, cert_12⟩
  · exact ⟨11, 11, cert_13⟩
  · exact ⟨12, 12, cert_14⟩
  · exact ⟨12, 12, cert_15⟩
  · exact ⟨13, 13, cert_16⟩
  · exact ⟨14, 13, cert_17⟩
  · exact ⟨14, 14, cert_18⟩
  · exact ⟨15, 14, cert_19⟩
  · exact ⟨15, 15, cert_20⟩
  · exact ⟨16, 15, cert_21⟩
  · exact ⟨16, 16, cert_22⟩
  · exact ⟨17, 16, cert_23⟩
  · exact ⟨17, 17, cert_24⟩
  · exact ⟨18, 17, cert_25⟩
  · exact ⟨18, 18, cert_26⟩
  · exact ⟨19, 18, cert_27⟩
  · exact ⟨19, 19, cert_28⟩
  · exact ⟨20, 19, cert_29⟩
  · exact ⟨20, 20, cert_30⟩
  · exact ⟨21, 20, cert_31⟩
  · exact ⟨21, 21, cert_32⟩
  · exact ⟨22, 21, cert_33⟩
  · exact ⟨22, 22, cert_34⟩
  · exact ⟨23, 22, cert_35⟩
  · exact ⟨23, 23, cert_36⟩
  · exact ⟨23, 23, cert_37⟩
  · exact ⟨24, 24, cert_38⟩
  · exact ⟨24, 24, cert_39⟩
  · exact ⟨25, 24, cert_40⟩
  · exact ⟨25, 25, cert_41⟩
  · exact ⟨26, 25, cert_42⟩
  · exact ⟨26, 26, cert_43⟩
  · exact ⟨27, 26, cert_44⟩
  · exact ⟨27, 27, cert_45⟩
  · exact ⟨28, 27, cert_46⟩
  · exact ⟨28, 28, cert_47⟩
  · exact ⟨28, 28, cert_48⟩
  · exact ⟨29, 28, cert_49⟩
  · exact ⟨29, 29, cert_50⟩
  · exact ⟨30, 29, cert_51⟩
  · exact ⟨30, 30, cert_52⟩
  · exact ⟨31, 30, cert_53⟩
  · exact ⟨31, 31, cert_54⟩
  · exact ⟨32, 31, cert_55⟩
  · exact ⟨32, 32, cert_56⟩
  · exact ⟨32, 32, cert_57⟩
  · exact ⟨33, 32, cert_58⟩
  · exact ⟨33, 33, cert_59⟩
  · exact ⟨34, 33, cert_60⟩
  · exact ⟨34, 34, cert_61⟩
  · exact ⟨35, 34, cert_62⟩
  · exact ⟨35, 35, cert_63⟩
  · exact ⟨35, 35, cert_64⟩
  · exact ⟨36, 35, cert_65⟩
  · exact ⟨36, 36, cert_66⟩
  · exact ⟨37, 36, cert_67⟩
  · exact ⟨37, 37, cert_68⟩
  · exact ⟨37, 37, cert_69⟩
  · exact ⟨38, 37, cert_70⟩
  · exact ⟨38, 38, cert_71⟩
  · exact ⟨39, 38, cert_72⟩
  · exact ⟨39, 39, cert_73⟩
  · exact ⟨40, 39, cert_74⟩
  · exact ⟨40, 39, cert_75⟩
  · exact ⟨40, 40, cert_76⟩
  · exact ⟨41, 40, cert_77⟩
  · exact ⟨41, 41, cert_78⟩
  · exact ⟨42, 41, cert_79⟩
  · exact ⟨42, 42, cert_80⟩
  · exact ⟨42, 42, cert_81⟩
  · exact ⟨43, 42, cert_82⟩
  · exact ⟨43, 43, cert_83⟩
  · exact ⟨44, 43, cert_84⟩
  · exact ⟨44, 44, cert_85⟩
  · exact ⟨44, 44, cert_86⟩
  · exact ⟨45, 44, cert_87⟩
  · exact ⟨45, 45, cert_88⟩
  · exact ⟨46, 45, cert_89⟩
  · exact ⟨46, 46, cert_90⟩
  · exact ⟨46, 46, cert_91⟩
  · exact ⟨47, 46, cert_92⟩
  · exact ⟨47, 47, cert_93⟩
  · exact ⟨48, 47, cert_94⟩
  · exact ⟨48, 48, cert_95⟩
  · exact ⟨48, 48, cert_96⟩
  · exact ⟨49, 48, cert_97⟩
  · exact ⟨49, 49, cert_98⟩
  · exact ⟨50, 49, cert_99⟩
  · exact ⟨50, 49, cert_100⟩
  · exact ⟨50, 50, cert_101⟩
  · exact ⟨51, 50, cert_102⟩
  · exact ⟨51, 51, cert_103⟩
  · exact ⟨52, 51, cert_104⟩
  · exact ⟨52, 51, cert_105⟩
  · exact ⟨52, 52, cert_106⟩
  · exact ⟨53, 52, cert_107⟩
  · exact ⟨53, 53, cert_108⟩
  · exact ⟨54, 53, cert_109⟩
  · exact ⟨54, 53, cert_110⟩
  · exact ⟨54, 54, cert_111⟩
  · exact ⟨55, 54, cert_112⟩
  · exact ⟨55, 55, cert_113⟩
  · exact ⟨55, 55, cert_114⟩
  · exact ⟨56, 55, cert_115⟩
  · exact ⟨56, 56, cert_116⟩
  · exact ⟨57, 56, cert_117⟩
  · exact ⟨57, 56, cert_118⟩
  · exact ⟨57, 57, cert_119⟩
  · exact ⟨58, 57, cert_120⟩
  · exact ⟨58, 58, cert_121⟩
  · exact ⟨58, 58, cert_122⟩
  · exact ⟨59, 58, cert_123⟩
  · exact ⟨59, 59, cert_124⟩
  · exact ⟨60, 59, cert_125⟩
  · exact ⟨60, 59, cert_126⟩
  · exact ⟨60, 60, cert_127⟩
  · exact ⟨61, 60, cert_128⟩
  · exact ⟨61, 61, cert_129⟩
  · exact ⟨62, 61, cert_130⟩
  · exact ⟨62, 61, cert_131⟩
  · exact ⟨62, 62, cert_132⟩
  · exact ⟨63, 62, cert_133⟩
  · exact ⟨63, 62, cert_134⟩
  · exact ⟨63, 63, cert_135⟩
  · exact ⟨64, 63, cert_136⟩
  · exact ⟨64, 64, cert_137⟩
  · exact ⟨65, 64, cert_138⟩
  · exact ⟨65, 64, cert_139⟩
  · exact ⟨65, 65, cert_140⟩
  · exact ⟨66, 65, cert_141⟩
  · exact ⟨66, 65, cert_142⟩
  · exact ⟨66, 66, cert_143⟩
  · exact ⟨67, 66, cert_144⟩
  · exact ⟨67, 67, cert_145⟩
  · exact ⟨67, 67, cert_146⟩
  · exact ⟨68, 67, cert_147⟩
  · exact ⟨68, 68, cert_148⟩
  · exact ⟨69, 68, cert_149⟩
  · exact ⟨69, 68, cert_150⟩
  · exact ⟨69, 69, cert_151⟩
  · exact ⟨70, 69, cert_152⟩
  · exact ⟨70, 70, cert_153⟩
  · exact ⟨70, 70, cert_154⟩
  · exact ⟨71, 70, cert_155⟩
  · exact ⟨71, 71, cert_156⟩
  · exact ⟨72, 71, cert_157⟩
  · exact ⟨72, 71, cert_158⟩
  · exact ⟨72, 72, cert_159⟩
  · exact ⟨73, 72, cert_160⟩
  · exact ⟨73, 72, cert_161⟩
  · exact ⟨73, 73, cert_162⟩
  · exact ⟨74, 73, cert_163⟩
  · exact ⟨74, 74, cert_164⟩
  · exact ⟨74, 74, cert_165⟩
  · exact ⟨75, 74, cert_166⟩
  · exact ⟨75, 75, cert_167⟩
  · exact ⟨76, 75, cert_168⟩
  · exact ⟨76, 75, cert_169⟩
  · exact ⟨76, 76, cert_170⟩
  · exact ⟨77, 76, cert_171⟩
  · exact ⟨77, 76, cert_172⟩
  · exact ⟨77, 77, cert_173⟩
  · exact ⟨78, 77, cert_174⟩
  · exact ⟨78, 78, cert_175⟩
  · exact ⟨78, 78, cert_176⟩
  · exact ⟨79, 78, cert_177⟩
  · exact ⟨79, 79, cert_178⟩
  · exact ⟨80, 79, cert_179⟩
  · exact ⟨80, 79, cert_180⟩
  · exact ⟨80, 80, cert_181⟩
  · exact ⟨81, 80, cert_182⟩
  · exact ⟨81, 80, cert_183⟩
  · exact ⟨81, 81, cert_184⟩
  · exact ⟨82, 81, cert_185⟩
  · exact ⟨82, 81, cert_186⟩
  · exact ⟨82, 82, cert_187⟩
  · exact ⟨83, 82, cert_188⟩
  · exact ⟨83, 83, cert_189⟩
  · exact ⟨83, 83, cert_190⟩
  · exact ⟨84, 83, cert_191⟩
  · exact ⟨84, 84, cert_192⟩
  · exact ⟨85, 84, cert_193⟩
  · exact ⟨85, 84, cert_194⟩
  · exact ⟨85, 85, cert_195⟩
  · exact ⟨86, 85, cert_196⟩
  · exact ⟨86, 85, cert_197⟩
  · exact ⟨86, 86, cert_198⟩
  · exact ⟨87, 86, cert_199⟩
  · exact ⟨87, 86, cert_200⟩
  · exact ⟨87, 87, cert_201⟩
  · exact ⟨88, 87, cert_202⟩
  · exact ⟨88, 87, cert_203⟩
  · exact ⟨88, 88, cert_204⟩
  · exact ⟨89, 88, cert_205⟩
  · exact ⟨89, 89, cert_206⟩
  · exact ⟨89, 89, cert_207⟩
  · exact ⟨90, 89, cert_208⟩
  · exact ⟨90, 90, cert_209⟩
  · exact ⟨91, 90, cert_210⟩
  · exact ⟨91, 90, cert_211⟩
  · exact ⟨91, 91, cert_212⟩
  · exact ⟨92, 91, cert_213⟩
  · exact ⟨92, 91, cert_214⟩
  · exact ⟨92, 92, cert_215⟩
  · exact ⟨93, 92, cert_216⟩
  · exact ⟨93, 92, cert_217⟩
  · exact ⟨93, 93, cert_218⟩
  · exact ⟨94, 93, cert_219⟩
  · exact ⟨94, 93, cert_220⟩
  · exact ⟨94, 94, cert_221⟩
  · exact ⟨95, 94, cert_222⟩
  · exact ⟨95, 94, cert_223⟩
  · exact ⟨95, 95, cert_224⟩
  · exact ⟨96, 95, cert_225⟩
  · exact ⟨96, 96, cert_226⟩
  · exact ⟨96, 96, cert_227⟩
  · exact ⟨97, 96, cert_228⟩
  · exact ⟨97, 97, cert_229⟩
  · exact ⟨97, 97, cert_230⟩
  · exact ⟨98, 97, cert_231⟩
  · exact ⟨98, 98, cert_232⟩
  · exact ⟨98, 98, cert_233⟩
  · exact ⟨99, 98, cert_234⟩
  · exact ⟨99, 99, cert_235⟩
  · exact ⟨100, 99, cert_236⟩
  · exact ⟨100, 99, cert_237⟩
  · exact ⟨100, 100, cert_238⟩
  · exact ⟨101, 100, cert_239⟩
  · exact ⟨101, 100, cert_240⟩
  · exact ⟨101, 101, cert_241⟩
  · exact ⟨102, 101, cert_242⟩
  · exact ⟨102, 101, cert_243⟩
  · exact ⟨102, 102, cert_244⟩
  · exact ⟨103, 102, cert_245⟩
  · exact ⟨103, 102, cert_246⟩
  · exact ⟨103, 103, cert_247⟩
  · exact ⟨104, 103, cert_248⟩
  · exact ⟨104, 103, cert_249⟩
  · exact ⟨104, 104, cert_250⟩
  · exact ⟨105, 104, cert_251⟩
  · exact ⟨105, 104, cert_252⟩
  · exact ⟨105, 105, cert_253⟩
  · exact ⟨106, 105, cert_254⟩
  · exact ⟨106, 105, cert_255⟩
  · exact ⟨106, 106, cert_256⟩
  · exact ⟨107, 106, cert_257⟩
  · exact ⟨107, 106, cert_258⟩
  · exact ⟨107, 107, cert_259⟩
  · exact ⟨108, 107, cert_260⟩
  · exact ⟨108, 108, cert_261⟩
  · exact ⟨108, 108, cert_262⟩
  · exact ⟨109, 108, cert_263⟩
  · exact ⟨109, 109, cert_264⟩
  · exact ⟨109, 109, cert_265⟩
  · exact ⟨110, 109, cert_266⟩
  · exact ⟨110, 110, cert_267⟩
  · exact ⟨110, 110, cert_268⟩
  · exact ⟨111, 110, cert_269⟩
  · exact ⟨111, 111, cert_270⟩
  · exact ⟨111, 111, cert_271⟩
  · exact ⟨112, 111, cert_272⟩
  · exact ⟨112, 112, cert_273⟩
  · exact ⟨112, 112, cert_274⟩
  · exact ⟨113, 112, cert_275⟩
  · exact ⟨113, 113, cert_276⟩
  · exact ⟨113, 113, cert_277⟩
  · exact ⟨114, 113, cert_278⟩
  · exact ⟨114, 114, cert_279⟩
  · exact ⟨115, 114, cert_280⟩
  · exact ⟨115, 114, cert_281⟩
  · exact ⟨115, 115, cert_282⟩
  · exact ⟨116, 115, cert_283⟩
  · exact ⟨116, 115, cert_284⟩
  · exact ⟨116, 116, cert_285⟩
  · exact ⟨117, 116, cert_286⟩
  · exact ⟨117, 116, cert_287⟩
  · exact ⟨117, 117, cert_288⟩
  · exact ⟨118, 117, cert_289⟩
  · exact ⟨118, 117, cert_290⟩
  · exact ⟨118, 118, cert_291⟩
  · exact ⟨119, 118, cert_292⟩
  · exact ⟨119, 118, cert_293⟩
  · exact ⟨119, 119, cert_294⟩
  · exact ⟨120, 119, cert_295⟩
  · exact ⟨120, 119, cert_296⟩
  · exact ⟨120, 120, cert_297⟩
  · exact ⟨121, 120, cert_298⟩
  · exact ⟨121, 120, cert_299⟩
  · exact ⟨121, 121, cert_300⟩
  · exact ⟨122, 121, cert_301⟩
  · exact ⟨122, 121, cert_302⟩
  · exact ⟨122, 122, cert_303⟩
  · exact ⟨123, 122, cert_304⟩
  · exact ⟨123, 122, cert_305⟩
  · exact ⟨123, 123, cert_306⟩
  · exact ⟨124, 123, cert_307⟩
  · exact ⟨124, 123, cert_308⟩
  · exact ⟨124, 124, cert_309⟩
  · exact ⟨125, 124, cert_310⟩
  · exact ⟨125, 124, cert_311⟩
  · exact ⟨125, 125, cert_312⟩
  · exact ⟨126, 125, cert_313⟩
  · exact ⟨126, 125, cert_314⟩
  · exact ⟨126, 126, cert_315⟩
  · exact ⟨127, 126, cert_316⟩
  · exact ⟨127, 126, cert_317⟩
  · exact ⟨127, 127, cert_318⟩
  · exact ⟨128, 127, cert_319⟩
  · exact ⟨128, 127, cert_320⟩
  · exact ⟨128, 128, cert_321⟩
  · exact ⟨128, 128, cert_322⟩
  · exact ⟨129, 128, cert_323⟩
  · exact ⟨129, 129, cert_324⟩
  · exact ⟨129, 129, cert_325⟩
  · exact ⟨130, 129, cert_326⟩
  · exact ⟨130, 130, cert_327⟩
  · exact ⟨130, 130, cert_328⟩
  · exact ⟨131, 130, cert_329⟩
  · exact ⟨131, 131, cert_330⟩
  · exact ⟨131, 131, cert_331⟩
  · exact ⟨132, 131, cert_332⟩
  · exact ⟨132, 132, cert_333⟩
  · exact ⟨132, 132, cert_334⟩
  · exact ⟨133, 132, cert_335⟩
  · exact ⟨133, 132, cert_336⟩
  · exact ⟨133, 133, cert_337⟩
  · exact ⟨134, 133, cert_338⟩
  · exact ⟨134, 133, cert_339⟩
  · exact ⟨134, 134, cert_340⟩
  · exact ⟨135, 134, cert_341⟩
  · exact ⟨135, 134, cert_342⟩
  · exact ⟨135, 135, cert_343⟩
  · exact ⟨136, 135, cert_344⟩
  · exact ⟨136, 135, cert_345⟩
  · exact ⟨136, 136, cert_346⟩
  · exact ⟨137, 136, cert_347⟩
  · exact ⟨137, 136, cert_348⟩
  · exact ⟨137, 137, cert_349⟩
  · exact ⟨138, 137, cert_350⟩
  · exact ⟨138, 137, cert_351⟩
  · exact ⟨138, 138, cert_352⟩
  · exact ⟨139, 138, cert_353⟩
  · exact ⟨139, 138, cert_354⟩
  · exact ⟨139, 139, cert_355⟩
  · exact ⟨140, 139, cert_356⟩
  · exact ⟨140, 139, cert_357⟩
  · exact ⟨140, 140, cert_358⟩
  · exact ⟨141, 140, cert_359⟩
  · exact ⟨141, 140, cert_360⟩
  · exact ⟨141, 141, cert_361⟩
  · exact ⟨142, 141, cert_362⟩
  · exact ⟨142, 141, cert_363⟩
  · exact ⟨142, 142, cert_364⟩
  · exact ⟨143, 142, cert_365⟩
  · exact ⟨143, 142, cert_366⟩
  · exact ⟨143, 143, cert_367⟩
  · exact ⟨144, 143, cert_368⟩
  · exact ⟨144, 143, cert_369⟩
  · exact ⟨144, 144, cert_370⟩
  · exact ⟨145, 144, cert_371⟩
  · exact ⟨145, 144, cert_372⟩
  · exact ⟨145, 145, cert_373⟩
  · exact ⟨145, 145, cert_374⟩
  · exact ⟨146, 145, cert_375⟩
  · exact ⟨146, 146, cert_376⟩
  · exact ⟨146, 146, cert_377⟩
  · exact ⟨147, 146, cert_378⟩
  · exact ⟨147, 146, cert_379⟩
  · exact ⟨147, 147, cert_380⟩
  · exact ⟨148, 147, cert_381⟩
  · exact ⟨148, 147, cert_382⟩
  · exact ⟨148, 148, cert_383⟩
  · exact ⟨149, 148, cert_384⟩
  · exact ⟨149, 148, cert_385⟩
  · exact ⟨149, 149, cert_386⟩
  · exact ⟨150, 149, cert_387⟩
  · exact ⟨150, 149, cert_388⟩
  · exact ⟨150, 150, cert_389⟩
  · exact ⟨151, 150, cert_390⟩
  · exact ⟨151, 150, cert_391⟩
  · exact ⟨151, 151, cert_392⟩
  · exact ⟨152, 151, cert_393⟩
  · exact ⟨152, 151, cert_394⟩
  · exact ⟨152, 152, cert_395⟩
  · exact ⟨153, 152, cert_396⟩
  · exact ⟨153, 152, cert_397⟩
  · exact ⟨153, 153, cert_398⟩
  · exact ⟨154, 153, cert_399⟩
  · exact ⟨154, 153, cert_400⟩
  · exact ⟨154, 154, cert_401⟩
  · exact ⟨154, 154, cert_402⟩
  · exact ⟨155, 154, cert_403⟩
  · exact ⟨155, 155, cert_404⟩
  · exact ⟨155, 155, cert_405⟩
  · exact ⟨156, 155, cert_406⟩
  · exact ⟨156, 155, cert_407⟩
  · exact ⟨156, 156, cert_408⟩
  · exact ⟨157, 156, cert_409⟩
  · exact ⟨157, 156, cert_410⟩
  · exact ⟨157, 157, cert_411⟩
  · exact ⟨158, 157, cert_412⟩
  · exact ⟨158, 157, cert_413⟩
  · exact ⟨158, 158, cert_414⟩
  · exact ⟨159, 158, cert_415⟩
  · exact ⟨159, 158, cert_416⟩
  · exact ⟨159, 159, cert_417⟩
  · exact ⟨160, 159, cert_418⟩
  · exact ⟨160, 159, cert_419⟩
  · exact ⟨160, 160, cert_420⟩
  · exact ⟨161, 160, cert_421⟩
  · exact ⟨161, 160, cert_422⟩
  · exact ⟨161, 161, cert_423⟩
  · exact ⟨161, 161, cert_424⟩
  · exact ⟨162, 161, cert_425⟩
  · exact ⟨162, 162, cert_426⟩
  · exact ⟨162, 162, cert_427⟩
  · exact ⟨163, 162, cert_428⟩
  · exact ⟨163, 162, cert_429⟩
  · exact ⟨163, 163, cert_430⟩
  · exact ⟨164, 163, cert_431⟩
  · exact ⟨164, 163, cert_432⟩
  · exact ⟨164, 164, cert_433⟩
  · exact ⟨165, 164, cert_434⟩
  · exact ⟨165, 164, cert_435⟩
  · exact ⟨165, 165, cert_436⟩
  · exact ⟨166, 165, cert_437⟩
  · exact ⟨166, 165, cert_438⟩
  · exact ⟨166, 166, cert_439⟩
  · exact ⟨167, 166, cert_440⟩
  · exact ⟨167, 166, cert_441⟩
  · exact ⟨167, 167, cert_442⟩
  · exact ⟨168, 167, cert_443⟩
  · exact ⟨168, 167, cert_444⟩
  · exact ⟨168, 168, cert_445⟩
  · exact ⟨168, 168, cert_446⟩
  · exact ⟨169, 168, cert_447⟩
  · exact ⟨169, 168, cert_448⟩
  · exact ⟨169, 169, cert_449⟩
  · exact ⟨170, 169, cert_450⟩
  · exact ⟨170, 169, cert_451⟩
  · exact ⟨170, 170, cert_452⟩
  · exact ⟨171, 170, cert_453⟩
  · exact ⟨171, 170, cert_454⟩
  · exact ⟨171, 171, cert_455⟩
  · exact ⟨172, 171, cert_456⟩
  · exact ⟨172, 171, cert_457⟩
  · exact ⟨172, 172, cert_458⟩
  · exact ⟨173, 172, cert_459⟩
  · exact ⟨173, 172, cert_460⟩
  · exact ⟨173, 173, cert_461⟩
  · exact ⟨174, 173, cert_462⟩
  · exact ⟨174, 173, cert_463⟩
  · exact ⟨174, 174, cert_464⟩
  · exact ⟨174, 174, cert_465⟩
  · exact ⟨175, 174, cert_466⟩
  · exact ⟨175, 174, cert_467⟩
  · exact ⟨175, 175, cert_468⟩
  · exact ⟨176, 175, cert_469⟩
  · exact ⟨176, 175, cert_470⟩
  · exact ⟨176, 176, cert_471⟩
  · exact ⟨177, 176, cert_472⟩
  · exact ⟨177, 176, cert_473⟩
  · exact ⟨177, 177, cert_474⟩
  · exact ⟨178, 177, cert_475⟩
  · exact ⟨178, 177, cert_476⟩
  · exact ⟨178, 178, cert_477⟩
  · exact ⟨179, 178, cert_478⟩
  · exact ⟨179, 178, cert_479⟩
  · exact ⟨179, 179, cert_480⟩
  · exact ⟨179, 179, cert_481⟩
  · exact ⟨180, 179, cert_482⟩
  · exact ⟨180, 179, cert_483⟩
  · exact ⟨180, 180, cert_484⟩
  · exact ⟨181, 180, cert_485⟩
  · exact ⟨181, 180, cert_486⟩
  · exact ⟨181, 181, cert_487⟩
  · exact ⟨182, 181, cert_488⟩
  · exact ⟨182, 181, cert_489⟩
  · exact ⟨182, 182, cert_490⟩
  · exact ⟨183, 182, cert_491⟩
  · exact ⟨183, 182, cert_492⟩
  · exact ⟨183, 183, cert_493⟩
  · exact ⟨184, 183, cert_494⟩
  · exact ⟨184, 183, cert_495⟩
  · exact ⟨184, 184, cert_496⟩
  · exact ⟨184, 184, cert_497⟩
  · exact ⟨185, 184, cert_498⟩
  · exact ⟨185, 184, cert_499⟩
  · exact ⟨185, 185, cert_500⟩
  · exact ⟨186, 185, cert_501⟩
  · exact ⟨186, 185, cert_502⟩
  · exact ⟨186, 186, cert_503⟩
  · exact ⟨187, 186, cert_504⟩
  · exact ⟨187, 186, cert_505⟩
  · exact ⟨187, 187, cert_506⟩
  · exact ⟨188, 187, cert_507⟩
  · exact ⟨188, 187, cert_508⟩
  · exact ⟨188, 188, cert_509⟩
  · exact ⟨188, 188, cert_510⟩
  · exact ⟨189, 188, cert_511⟩
  · exact ⟨189, 188, cert_512⟩
  · exact ⟨189, 189, cert_513⟩
  · exact ⟨190, 189, cert_514⟩
  · exact ⟨190, 189, cert_515⟩
  · exact ⟨190, 190, cert_516⟩
  · exact ⟨191, 190, cert_517⟩
  · exact ⟨191, 190, cert_518⟩
  · exact ⟨191, 191, cert_519⟩
  · exact ⟨192, 191, cert_520⟩
  · exact ⟨192, 191, cert_521⟩
  · exact ⟨192, 192, cert_522⟩
  · exact ⟨193, 192, cert_523⟩
  · exact ⟨193, 192, cert_524⟩
  · exact ⟨193, 193, cert_525⟩
  · exact ⟨193, 193, cert_526⟩
  · exact ⟨194, 193, cert_527⟩
  · exact ⟨194, 193, cert_528⟩
  · exact ⟨194, 194, cert_529⟩
  · exact ⟨195, 194, cert_530⟩
  · exact ⟨195, 194, cert_531⟩
  · exact ⟨195, 195, cert_532⟩
  · exact ⟨196, 195, cert_533⟩
  · exact ⟨196, 195, cert_534⟩
  · exact ⟨196, 196, cert_535⟩
  · exact ⟨197, 196, cert_536⟩
  · exact ⟨197, 196, cert_537⟩
  · exact ⟨197, 197, cert_538⟩
  · exact ⟨197, 197, cert_539⟩
  · exact ⟨198, 197, cert_540⟩
  · exact ⟨198, 197, cert_541⟩
  · exact ⟨198, 198, cert_542⟩
  · exact ⟨199, 198, cert_543⟩
  · exact ⟨199, 198, cert_544⟩
  · exact ⟨199, 199, cert_545⟩
  · exact ⟨200, 199, cert_546⟩
  · exact ⟨200, 199, cert_547⟩
  · exact ⟨200, 200, cert_548⟩
  · exact ⟨201, 200, cert_549⟩
  · exact ⟨201, 200, cert_550⟩
  · exact ⟨201, 201, cert_551⟩
  · exact ⟨201, 201, cert_552⟩
  · exact ⟨202, 201, cert_553⟩
  · exact ⟨202, 201, cert_554⟩
  · exact ⟨202, 202, cert_555⟩
  · exact ⟨203, 202, cert_556⟩
  · exact ⟨203, 202, cert_557⟩
  · exact ⟨203, 203, cert_558⟩
  · exact ⟨204, 203, cert_559⟩
  · exact ⟨204, 203, cert_560⟩
  · exact ⟨204, 204, cert_561⟩
  · exact ⟨205, 204, cert_562⟩
  · exact ⟨205, 204, cert_563⟩
  · exact ⟨205, 204, cert_564⟩
  · exact ⟨205, 205, cert_565⟩
  · exact ⟨206, 205, cert_566⟩
  · exact ⟨206, 205, cert_567⟩
  · exact ⟨206, 206, cert_568⟩
  · exact ⟨207, 206, cert_569⟩
  · exact ⟨207, 206, cert_570⟩
  · exact ⟨207, 207, cert_571⟩
  · exact ⟨208, 207, cert_572⟩
  · exact ⟨208, 207, cert_573⟩
  · exact ⟨208, 208, cert_574⟩
  · exact ⟨208, 208, cert_575⟩
  · exact ⟨209, 208, cert_576⟩
  · exact ⟨209, 208, cert_577⟩
  · exact ⟨209, 209, cert_578⟩
  · exact ⟨210, 209, cert_579⟩
  · exact ⟨210, 209, cert_580⟩
  · exact ⟨210, 210, cert_581⟩
  · exact ⟨211, 210, cert_582⟩
  · exact ⟨211, 210, cert_583⟩
  · exact ⟨211, 211, cert_584⟩
  · exact ⟨212, 211, cert_585⟩
  · exact ⟨212, 211, cert_586⟩
  · exact ⟨212, 212, cert_587⟩
  · exact ⟨212, 212, cert_588⟩
  · exact ⟨213, 212, cert_589⟩
  · exact ⟨213, 212, cert_590⟩
  · exact ⟨213, 213, cert_591⟩
  · exact ⟨214, 213, cert_592⟩
  · exact ⟨214, 213, cert_593⟩
  · exact ⟨214, 214, cert_594⟩
  · exact ⟨215, 214, cert_595⟩
  · exact ⟨215, 214, cert_596⟩
  · exact ⟨215, 215, cert_597⟩
  · exact ⟨216, 215, cert_598⟩
  · exact ⟨216, 215, cert_599⟩
  · exact ⟨216, 215, cert_600⟩
  · exact ⟨216, 216, cert_601⟩
  · exact ⟨217, 216, cert_602⟩
  · exact ⟨217, 216, cert_603⟩
  · exact ⟨217, 217, cert_604⟩
  · exact ⟨218, 217, cert_605⟩
  · exact ⟨218, 217, cert_606⟩
  · exact ⟨218, 218, cert_607⟩
  · exact ⟨219, 218, cert_608⟩
  · exact ⟨219, 218, cert_609⟩
  · exact ⟨219, 219, cert_610⟩
  · exact ⟨219, 219, cert_611⟩
  · exact ⟨220, 219, cert_612⟩
  · exact ⟨220, 219, cert_613⟩
  · exact ⟨220, 220, cert_614⟩
  · exact ⟨221, 220, cert_615⟩
  · exact ⟨221, 220, cert_616⟩
  · exact ⟨221, 221, cert_617⟩
  · exact ⟨222, 221, cert_618⟩
  · exact ⟨222, 221, cert_619⟩
  · exact ⟨222, 222, cert_620⟩
  · exact ⟨222, 222, cert_621⟩
  · exact ⟨223, 222, cert_622⟩
  · exact ⟨223, 222, cert_623⟩
  · exact ⟨223, 223, cert_624⟩
  · exact ⟨224, 223, cert_625⟩
  · exact ⟨224, 223, cert_626⟩
  · exact ⟨224, 224, cert_627⟩
  · exact ⟨225, 224, cert_628⟩
  · exact ⟨225, 224, cert_629⟩
  · exact ⟨225, 225, cert_630⟩
  · exact ⟨225, 225, cert_631⟩
  · exact ⟨226, 225, cert_632⟩
  · exact ⟨226, 225, cert_633⟩
  · exact ⟨226, 226, cert_634⟩
  · exact ⟨227, 226, cert_635⟩
  · exact ⟨227, 226, cert_636⟩
  · exact ⟨227, 227, cert_637⟩
  · exact ⟨228, 227, cert_638⟩
  · exact ⟨228, 227, cert_639⟩
  · exact ⟨228, 228, cert_640⟩
  · exact ⟨229, 228, cert_641⟩
  · exact ⟨229, 228, cert_642⟩
  · exact ⟨229, 228, cert_643⟩
  · exact ⟨229, 229, cert_644⟩
  · exact ⟨230, 229, cert_645⟩
  · exact ⟨230, 229, cert_646⟩
  · exact ⟨230, 230, cert_647⟩
  · exact ⟨231, 230, cert_648⟩
  · exact ⟨231, 230, cert_649⟩
  · exact ⟨231, 231, cert_650⟩
  · exact ⟨232, 231, cert_651⟩
  · exact ⟨232, 231, cert_652⟩
  · exact ⟨232, 231, cert_653⟩
  · exact ⟨232, 232, cert_654⟩
  · exact ⟨233, 232, cert_655⟩
  · exact ⟨233, 232, cert_656⟩
  · exact ⟨233, 233, cert_657⟩
  · exact ⟨234, 233, cert_658⟩
  · exact ⟨234, 233, cert_659⟩
  · exact ⟨234, 234, cert_660⟩
  · exact ⟨235, 234, cert_661⟩
  · exact ⟨235, 234, cert_662⟩
  · exact ⟨235, 234, cert_663⟩
  · exact ⟨235, 235, cert_664⟩
  · exact ⟨236, 235, cert_665⟩
  · exact ⟨236, 235, cert_666⟩
  · exact ⟨236, 236, cert_667⟩
  · exact ⟨237, 236, cert_668⟩
  · exact ⟨237, 236, cert_669⟩
  · exact ⟨237, 237, cert_670⟩
  · exact ⟨238, 237, cert_671⟩
  · exact ⟨238, 237, cert_672⟩
  · exact ⟨238, 237, cert_673⟩
  · exact ⟨238, 238, cert_674⟩
  · exact ⟨239, 238, cert_675⟩
  · exact ⟨239, 238, cert_676⟩
  · exact ⟨239, 239, cert_677⟩
  · exact ⟨240, 239, cert_678⟩
  · exact ⟨240, 239, cert_679⟩
  · exact ⟨240, 240, cert_680⟩
  · exact ⟨241, 240, cert_681⟩
  · exact ⟨241, 240, cert_682⟩
  · exact ⟨241, 240, cert_683⟩
  · exact ⟨241, 241, cert_684⟩
  · exact ⟨242, 241, cert_685⟩
  · exact ⟨242, 241, cert_686⟩
  · exact ⟨242, 242, cert_687⟩
  · exact ⟨243, 242, cert_688⟩
  · exact ⟨243, 242, cert_689⟩
  · exact ⟨243, 243, cert_690⟩
  · exact ⟨244, 243, cert_691⟩
  · exact ⟨244, 243, cert_692⟩
  · exact ⟨244, 243, cert_693⟩
  · exact ⟨244, 244, cert_694⟩
  · exact ⟨245, 244, cert_695⟩
  · exact ⟨245, 244, cert_696⟩
  · exact ⟨245, 245, cert_697⟩
  · exact ⟨246, 245, cert_698⟩
  · exact ⟨246, 245, cert_699⟩
  · exact ⟨246, 246, cert_700⟩
  · exact ⟨246, 246, cert_701⟩
  · exact ⟨247, 246, cert_702⟩
  · exact ⟨247, 246, cert_703⟩
  · exact ⟨247, 247, cert_704⟩
  · exact ⟨248, 247, cert_705⟩
  · exact ⟨248, 247, cert_706⟩
  · exact ⟨248, 248, cert_707⟩
  · exact ⟨249, 248, cert_708⟩
  · exact ⟨249, 248, cert_709⟩
  · exact ⟨249, 249, cert_710⟩
  · exact ⟨249, 249, cert_711⟩
  · exact ⟨250, 249, cert_712⟩
  · exact ⟨250, 249, cert_713⟩
  · exact ⟨250, 250, cert_714⟩
  · exact ⟨251, 250, cert_715⟩
  · exact ⟨251, 250, cert_716⟩
  · exact ⟨251, 251, cert_717⟩
  · exact ⟨252, 251, cert_718⟩
  · exact ⟨252, 251, cert_719⟩
  · exact ⟨252, 251, cert_720⟩
  · exact ⟨252, 252, cert_721⟩
  · exact ⟨253, 252, cert_722⟩
  · exact ⟨253, 252, cert_723⟩
  · exact ⟨253, 253, cert_724⟩
  · exact ⟨254, 253, cert_725⟩
  · exact ⟨254, 253, cert_726⟩
  · exact ⟨254, 254, cert_727⟩
  · exact ⟨255, 254, cert_728⟩
  · exact ⟨255, 254, cert_729⟩
  · exact ⟨255, 254, cert_730⟩
  · exact ⟨255, 255, cert_731⟩
  · exact ⟨256, 255, cert_732⟩
  · exact ⟨256, 255, cert_733⟩
  · exact ⟨256, 256, cert_734⟩
  · exact ⟨257, 256, cert_735⟩
  · exact ⟨257, 256, cert_736⟩
  · exact ⟨257, 257, cert_737⟩
  · exact ⟨257, 257, cert_738⟩
  · exact ⟨258, 257, cert_739⟩
  · exact ⟨258, 257, cert_740⟩
  · exact ⟨258, 258, cert_741⟩
  · exact ⟨259, 258, cert_742⟩
  · exact ⟨259, 258, cert_743⟩
  · exact ⟨259, 259, cert_744⟩
  · exact ⟨260, 259, cert_745⟩
  · exact ⟨260, 259, cert_746⟩
  · exact ⟨260, 259, cert_747⟩
  · exact ⟨260, 260, cert_748⟩
  · exact ⟨261, 260, cert_749⟩
  · exact ⟨261, 260, cert_750⟩
  · exact ⟨261, 261, cert_751⟩
  · exact ⟨262, 261, cert_752⟩
  · exact ⟨262, 261, cert_753⟩
  · exact ⟨262, 262, cert_754⟩
  · exact ⟨262, 262, cert_755⟩
  · exact ⟨263, 262, cert_756⟩
  · exact ⟨263, 262, cert_757⟩
  · exact ⟨263, 263, cert_758⟩
  · exact ⟨264, 263, cert_759⟩
  · exact ⟨264, 263, cert_760⟩
  · exact ⟨264, 264, cert_761⟩
  · exact ⟨265, 264, cert_762⟩
  · exact ⟨265, 264, cert_763⟩
  · exact ⟨265, 264, cert_764⟩
  · exact ⟨265, 265, cert_765⟩
  · exact ⟨266, 265, cert_766⟩
  · exact ⟨266, 265, cert_767⟩
  · exact ⟨266, 266, cert_768⟩
  · exact ⟨267, 266, cert_769⟩
  · exact ⟨267, 266, cert_770⟩
  · exact ⟨267, 267, cert_771⟩
  · exact ⟨268, 267, cert_772⟩
  · exact ⟨268, 267, cert_773⟩
  · exact ⟨268, 267, cert_774⟩
  · exact ⟨268, 268, cert_775⟩
  · exact ⟨269, 268, cert_776⟩
  · exact ⟨269, 268, cert_777⟩
  · exact ⟨269, 269, cert_778⟩
  · exact ⟨270, 269, cert_779⟩
  · exact ⟨270, 269, cert_780⟩
  · exact ⟨270, 269, cert_781⟩
  · exact ⟨270, 270, cert_782⟩
  · exact ⟨271, 270, cert_783⟩
  · exact ⟨271, 270, cert_784⟩
  · exact ⟨271, 271, cert_785⟩
  · exact ⟨272, 271, cert_786⟩
  · exact ⟨272, 271, cert_787⟩
  · exact ⟨272, 272, cert_788⟩
  · exact ⟨272, 272, cert_789⟩
  · exact ⟨273, 272, cert_790⟩
  · exact ⟨273, 272, cert_791⟩
  · exact ⟨273, 273, cert_792⟩
  · exact ⟨274, 273, cert_793⟩
  · exact ⟨274, 273, cert_794⟩
  · exact ⟨274, 274, cert_795⟩
  · exact ⟨275, 274, cert_796⟩
  · exact ⟨275, 274, cert_797⟩
  · exact ⟨275, 274, cert_798⟩
  · exact ⟨275, 275, cert_799⟩
  · exact ⟨276, 275, cert_800⟩
  · exact ⟨276, 275, cert_801⟩
  · exact ⟨276, 276, cert_802⟩
  · exact ⟨277, 276, cert_803⟩
  · exact ⟨277, 276, cert_804⟩
  · exact ⟨277, 277, cert_805⟩
  · exact ⟨277, 277, cert_806⟩
  · exact ⟨278, 277, cert_807⟩
  · exact ⟨278, 277, cert_808⟩
  · exact ⟨278, 278, cert_809⟩
  · exact ⟨279, 278, cert_810⟩
  · exact ⟨279, 278, cert_811⟩
  · exact ⟨279, 279, cert_812⟩
  · exact ⟨280, 279, cert_813⟩
  · exact ⟨280, 279, cert_814⟩
  · exact ⟨280, 279, cert_815⟩
  · exact ⟨280, 280, cert_816⟩
  · exact ⟨281, 280, cert_817⟩
  · exact ⟨281, 280, cert_818⟩
  · exact ⟨281, 281, cert_819⟩
  · exact ⟨282, 281, cert_820⟩
  · exact ⟨282, 281, cert_821⟩
  · exact ⟨282, 282, cert_822⟩
  · exact ⟨282, 282, cert_823⟩
  · exact ⟨283, 282, cert_824⟩
  · exact ⟨283, 282, cert_825⟩
  · exact ⟨283, 283, cert_826⟩
  · exact ⟨284, 283, cert_827⟩
  · exact ⟨284, 283, cert_828⟩
  · exact ⟨284, 284, cert_829⟩
  · exact ⟨284, 284, cert_830⟩
  · exact ⟨285, 284, cert_831⟩
  · exact ⟨285, 284, cert_832⟩
  · exact ⟨285, 285, cert_833⟩
  · exact ⟨286, 285, cert_834⟩
  · exact ⟨286, 285, cert_835⟩
  · exact ⟨286, 286, cert_836⟩
  · exact ⟨287, 286, cert_837⟩
  · exact ⟨287, 286, cert_838⟩
  · exact ⟨287, 286, cert_839⟩
  · exact ⟨287, 287, cert_840⟩
  · exact ⟨288, 287, cert_841⟩
  · exact ⟨288, 287, cert_842⟩
  · exact ⟨288, 288, cert_843⟩
  · exact ⟨289, 288, cert_844⟩
  · exact ⟨289, 288, cert_845⟩
  · exact ⟨289, 288, cert_846⟩
  · exact ⟨289, 289, cert_847⟩
  · exact ⟨290, 289, cert_848⟩
  · exact ⟨290, 289, cert_849⟩
  · exact ⟨290, 290, cert_850⟩
  · exact ⟨291, 290, cert_851⟩
  · exact ⟨291, 290, cert_852⟩
  · exact ⟨291, 291, cert_853⟩
  · exact ⟨291, 291, cert_854⟩
  · exact ⟨292, 291, cert_855⟩
  · exact ⟨292, 291, cert_856⟩
  · exact ⟨292, 292, cert_857⟩
  · exact ⟨293, 292, cert_858⟩
  · exact ⟨293, 292, cert_859⟩
  · exact ⟨293, 293, cert_860⟩
  · exact ⟨294, 293, cert_861⟩
  · exact ⟨294, 293, cert_862⟩
  · exact ⟨294, 293, cert_863⟩
  · exact ⟨294, 294, cert_864⟩
  · exact ⟨295, 294, cert_865⟩
  · exact ⟨295, 294, cert_866⟩
  · exact ⟨295, 295, cert_867⟩
  · exact ⟨296, 295, cert_868⟩
  · exact ⟨296, 295, cert_869⟩
  · exact ⟨296, 295, cert_870⟩
  · exact ⟨296, 296, cert_871⟩
  · exact ⟨297, 296, cert_872⟩
  · exact ⟨297, 296, cert_873⟩
  · exact ⟨297, 297, cert_874⟩
  · exact ⟨298, 297, cert_875⟩
  · exact ⟨298, 297, cert_876⟩
  · exact ⟨298, 297, cert_877⟩
  · exact ⟨298, 298, cert_878⟩
  · exact ⟨299, 298, cert_879⟩
  · exact ⟨299, 298, cert_880⟩
  · exact ⟨299, 299, cert_881⟩
  · exact ⟨300, 299, cert_882⟩
  · exact ⟨300, 299, cert_883⟩
  · exact ⟨300, 300, cert_884⟩
  · exact ⟨300, 300, cert_885⟩
  · exact ⟨301, 300, cert_886⟩
  · exact ⟨301, 300, cert_887⟩
  · exact ⟨301, 301, cert_888⟩
  · exact ⟨302, 301, cert_889⟩
  · exact ⟨302, 301, cert_890⟩
  · exact ⟨302, 302, cert_891⟩
  · exact ⟨302, 302, cert_892⟩
  · exact ⟨303, 302, cert_893⟩
  · exact ⟨303, 302, cert_894⟩
  · exact ⟨303, 303, cert_895⟩
  · exact ⟨304, 303, cert_896⟩
  · exact ⟨304, 303, cert_897⟩
  · exact ⟨304, 304, cert_898⟩
  · exact ⟨305, 304, cert_899⟩
  · exact ⟨305, 304, cert_900⟩
  · exact ⟨305, 304, cert_901⟩
  · exact ⟨305, 305, cert_902⟩
  · exact ⟨306, 305, cert_903⟩
  · exact ⟨306, 305, cert_904⟩
  · exact ⟨306, 306, cert_905⟩
  · exact ⟨307, 306, cert_906⟩
  · exact ⟨307, 306, cert_907⟩
  · exact ⟨307, 306, cert_908⟩
  · exact ⟨307, 307, cert_909⟩
  · exact ⟨308, 307, cert_910⟩
  · exact ⟨308, 307, cert_911⟩
  · exact ⟨308, 308, cert_912⟩
  · exact ⟨309, 308, cert_913⟩
  · exact ⟨309, 308, cert_914⟩
  · exact ⟨309, 308, cert_915⟩
  · exact ⟨309, 309, cert_916⟩
  · exact ⟨310, 309, cert_917⟩
  · exact ⟨310, 309, cert_918⟩
  · exact ⟨310, 310, cert_919⟩
  · exact ⟨311, 310, cert_920⟩
  · exact ⟨311, 310, cert_921⟩
  · exact ⟨311, 310, cert_922⟩
  · exact ⟨311, 311, cert_923⟩
  · exact ⟨312, 311, cert_924⟩
  · exact ⟨312, 311, cert_925⟩
  · exact ⟨312, 312, cert_926⟩
  · exact ⟨313, 312, cert_927⟩
  · exact ⟨313, 312, cert_928⟩
  · exact ⟨313, 313, cert_929⟩
  · exact ⟨313, 313, cert_930⟩
  · exact ⟨314, 313, cert_931⟩
  · exact ⟨314, 313, cert_932⟩
  · exact ⟨314, 314, cert_933⟩
  · exact ⟨315, 314, cert_934⟩
  · exact ⟨315, 314, cert_935⟩
  · exact ⟨315, 315, cert_936⟩
  · exact ⟨315, 315, cert_937⟩
  · exact ⟨316, 315, cert_938⟩
  · exact ⟨316, 315, cert_939⟩
  · exact ⟨316, 316, cert_940⟩
  · exact ⟨317, 316, cert_941⟩
  · exact ⟨317, 316, cert_942⟩
  · exact ⟨317, 317, cert_943⟩
  · exact ⟨317, 317, cert_944⟩
  · exact ⟨318, 317, cert_945⟩
  · exact ⟨318, 317, cert_946⟩
  · exact ⟨318, 318, cert_947⟩
  · exact ⟨319, 318, cert_948⟩
  · exact ⟨319, 318, cert_949⟩
  · exact ⟨319, 319, cert_950⟩
  · exact ⟨319, 319, cert_951⟩
  · exact ⟨320, 319, cert_952⟩
  · exact ⟨320, 319, cert_953⟩
  · exact ⟨320, 320, cert_954⟩
  · exact ⟨321, 320, cert_955⟩
  · exact ⟨321, 320, cert_956⟩
  · exact ⟨321, 321, cert_957⟩
  · exact ⟨321, 321, cert_958⟩
  · exact ⟨322, 321, cert_959⟩
  · exact ⟨322, 321, cert_960⟩
  · exact ⟨322, 322, cert_961⟩
  · exact ⟨323, 322, cert_962⟩
  · exact ⟨323, 322, cert_963⟩
  · exact ⟨323, 323, cert_964⟩
  · exact ⟨323, 323, cert_965⟩
  · exact ⟨324, 323, cert_966⟩
  · exact ⟨324, 323, cert_967⟩
  · exact ⟨324, 324, cert_968⟩
  · exact ⟨325, 324, cert_969⟩
  · exact ⟨325, 324, cert_970⟩
  · exact ⟨325, 325, cert_971⟩
  · exact ⟨326, 325, cert_972⟩
  · exact ⟨326, 325, cert_973⟩
  · exact ⟨326, 325, cert_974⟩
  · exact ⟨326, 326, cert_975⟩
  · exact ⟨327, 326, cert_976⟩
  · exact ⟨327, 326, cert_977⟩
  · exact ⟨327, 327, cert_978⟩
  · exact ⟨328, 327, cert_979⟩
  · exact ⟨328, 327, cert_980⟩
  · exact ⟨328, 327, cert_981⟩
  · exact ⟨328, 328, cert_982⟩
  · exact ⟨329, 328, cert_983⟩
  · exact ⟨329, 328, cert_984⟩
  · exact ⟨329, 329, cert_985⟩
  · exact ⟨330, 329, cert_986⟩
  · exact ⟨330, 329, cert_987⟩
  · exact ⟨330, 329, cert_988⟩
  · exact ⟨330, 330, cert_989⟩
  · exact ⟨331, 330, cert_990⟩
  · exact ⟨331, 330, cert_991⟩
  · exact ⟨331, 331, cert_992⟩
  · exact ⟨332, 331, cert_993⟩
  · exact ⟨332, 331, cert_994⟩
  · exact ⟨332, 331, cert_995⟩
  · exact ⟨332, 332, cert_996⟩
  · exact ⟨333, 332, cert_997⟩
  · exact ⟨333, 332, cert_998⟩
  · exact ⟨333, 333, cert_999⟩
  · exact ⟨333, 333, cert_1000⟩

/-- Formal reproduction of a bounded exclusion, not an all-length theorem. -/
theorem fixed_of_digitCount_le_1000 {n : ℕ} (hn : a n = n)
    (hk : digitCount n ≤ 1000) : n = 1 ∨ n = 32 := by
  by_cases hsmall : digitCount n ≤ 2
  · exact fixed_of_digitCount_le_two hn hsmall
  · obtain ⟨lo, hi, hc⟩ := certificate_up_to_1000 (by omega : 3 ≤ digitCount n) hk
    exact (no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl).elim

theorem fixed_below_ten_pow_1000 {n : ℕ} (hn : a n = n)
    (hbound : n < 10 ^ 1000) : n = 1 ∨ n = 32 := by
  apply fixed_of_digitCount_le_1000 hn
  exact (Nat.digits_length_le_iff (by decide : 1 < 10) n).mpr hbound

theorem additional_fixedPoint_ge_ten_pow_1000 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ 1000 ≤ n := by
  by_contra hbound
  rcases fixed_below_ten_pow_1000 hn (by omega) with hh | hh
  · exact h1 hh
  · exact h32 hh

#print axioms fixed_of_digitCount_le_1000
#print axioms fixed_below_ten_pow_1000
end OeisA113010
