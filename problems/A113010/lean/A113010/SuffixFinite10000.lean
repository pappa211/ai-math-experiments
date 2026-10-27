import A113010.SuffixFinite2000
import A113010.SuffixFinite2001_2100
import A113010.SuffixFinite2101_2200
import A113010.SuffixFinite2201_2300
import A113010.SuffixFinite2301_2400
import A113010.SuffixFinite2401_2500
import A113010.SuffixFinite2501_2600
import A113010.SuffixFinite2601_2700
import A113010.SuffixFinite2701_2800
import A113010.SuffixFinite2801_2900
import A113010.SuffixFinite2901_3000
import A113010.SuffixFinite3001_3100
import A113010.SuffixFinite3101_3200
import A113010.SuffixFinite3201_3300
import A113010.SuffixFinite3301_3400
import A113010.SuffixFinite3401_3500
import A113010.SuffixFinite3501_3600
import A113010.SuffixFinite3601_3700
import A113010.SuffixFinite3701_3800
import A113010.SuffixFinite3801_3900
import A113010.SuffixFinite3901_4000
import A113010.SuffixFinite4001_4100
import A113010.SuffixFinite4101_4200
import A113010.SuffixFinite4201_4300
import A113010.SuffixFinite4301_4400
import A113010.SuffixFinite4401_4500
import A113010.SuffixFinite4501_4600
import A113010.SuffixFinite4601_4700
import A113010.SuffixFinite4701_4800
import A113010.SuffixFinite4801_4900
import A113010.SuffixFinite4901_5000
import A113010.SuffixFinite5001_5100
import A113010.SuffixFinite5101_5200
import A113010.SuffixFinite5201_5300
import A113010.SuffixFinite5301_5400
import A113010.SuffixFinite5401_5500
import A113010.SuffixFinite5501_5600
import A113010.SuffixFinite5601_5700
import A113010.SuffixFinite5701_5800
import A113010.SuffixFinite5801_5900
import A113010.SuffixFinite5901_6000
import A113010.SuffixFinite6001_6100
import A113010.SuffixFinite6101_6200
import A113010.SuffixFinite6201_6300
import A113010.SuffixFinite6301_6400
import A113010.SuffixFinite6401_6500
import A113010.SuffixFinite6501_6600
import A113010.SuffixFinite6601_6700
import A113010.SuffixFinite6701_6800
import A113010.SuffixFinite6801_6900
import A113010.SuffixFinite6901_7000
import A113010.SuffixFinite7001_7100
import A113010.SuffixFinite7101_7200
import A113010.SuffixFinite7201_7300
import A113010.SuffixFinite7301_7400
import A113010.SuffixFinite7401_7500
import A113010.SuffixFinite7501_7600
import A113010.SuffixFinite7601_7700
import A113010.SuffixFinite7701_7800
import A113010.SuffixFinite7801_7900
import A113010.SuffixFinite7901_8000
import A113010.SuffixFinite8001_8100
import A113010.SuffixFinite8101_8200
import A113010.SuffixFinite8201_8300
import A113010.SuffixFinite8301_8400
import A113010.SuffixFinite8401_8500
import A113010.SuffixFinite8501_8600
import A113010.SuffixFinite8601_8700
import A113010.SuffixFinite8701_8800
import A113010.SuffixFinite8801_8900
import A113010.SuffixFinite8901_9000
import A113010.SuffixFinite9001_9100
import A113010.SuffixFinite9101_9200
import A113010.SuffixFinite9201_9300
import A113010.SuffixFinite9301_9400
import A113010.SuffixFinite9401_9500
import A113010.SuffixFinite9501_9600
import A113010.SuffixFinite9601_9700
import A113010.SuffixFinite9701_9800
import A113010.SuffixFinite9801_9900
import A113010.SuffixFinite9901_10000

namespace OeisA113010
set_option maxHeartbeats 4000000
set_option maxRecDepth 20000
theorem fixed_of_digitCount_le_10000 {n : ℕ} (hn : a n = n)
    (hk : digitCount n ≤ 10000) : n = 1 ∨ n = 32 := by
  by_cases hsmall : digitCount n ≤ 2000
  · exact fixed_of_digitCount_le_2000 hn hsmall
  by_cases h2100 : digitCount n ≤ 2100
  · exact (no_fixed_digitCount_2001_2100 hn (by omega) h2100).elim
  by_cases h2200 : digitCount n ≤ 2200
  · exact (no_fixed_digitCount_2101_2200 hn (by omega) h2200).elim
  by_cases h2300 : digitCount n ≤ 2300
  · exact (no_fixed_digitCount_2201_2300 hn (by omega) h2300).elim
  by_cases h2400 : digitCount n ≤ 2400
  · exact (no_fixed_digitCount_2301_2400 hn (by omega) h2400).elim
  by_cases h2500 : digitCount n ≤ 2500
  · exact (no_fixed_digitCount_2401_2500 hn (by omega) h2500).elim
  by_cases h2600 : digitCount n ≤ 2600
  · exact (no_fixed_digitCount_2501_2600 hn (by omega) h2600).elim
  by_cases h2700 : digitCount n ≤ 2700
  · exact (no_fixed_digitCount_2601_2700 hn (by omega) h2700).elim
  by_cases h2800 : digitCount n ≤ 2800
  · exact (no_fixed_digitCount_2701_2800 hn (by omega) h2800).elim
  by_cases h2900 : digitCount n ≤ 2900
  · exact (no_fixed_digitCount_2801_2900 hn (by omega) h2900).elim
  by_cases h3000 : digitCount n ≤ 3000
  · exact (no_fixed_digitCount_2901_3000 hn (by omega) h3000).elim
  by_cases h3100 : digitCount n ≤ 3100
  · exact (no_fixed_digitCount_3001_3100 hn (by omega) h3100).elim
  by_cases h3200 : digitCount n ≤ 3200
  · exact (no_fixed_digitCount_3101_3200 hn (by omega) h3200).elim
  by_cases h3300 : digitCount n ≤ 3300
  · exact (no_fixed_digitCount_3201_3300 hn (by omega) h3300).elim
  by_cases h3400 : digitCount n ≤ 3400
  · exact (no_fixed_digitCount_3301_3400 hn (by omega) h3400).elim
  by_cases h3500 : digitCount n ≤ 3500
  · exact (no_fixed_digitCount_3401_3500 hn (by omega) h3500).elim
  by_cases h3600 : digitCount n ≤ 3600
  · exact (no_fixed_digitCount_3501_3600 hn (by omega) h3600).elim
  by_cases h3700 : digitCount n ≤ 3700
  · exact (no_fixed_digitCount_3601_3700 hn (by omega) h3700).elim
  by_cases h3800 : digitCount n ≤ 3800
  · exact (no_fixed_digitCount_3701_3800 hn (by omega) h3800).elim
  by_cases h3900 : digitCount n ≤ 3900
  · exact (no_fixed_digitCount_3801_3900 hn (by omega) h3900).elim
  by_cases h4000 : digitCount n ≤ 4000
  · exact (no_fixed_digitCount_3901_4000 hn (by omega) h4000).elim
  by_cases h4100 : digitCount n ≤ 4100
  · exact (no_fixed_digitCount_4001_4100 hn (by omega) h4100).elim
  by_cases h4200 : digitCount n ≤ 4200
  · exact (no_fixed_digitCount_4101_4200 hn (by omega) h4200).elim
  by_cases h4300 : digitCount n ≤ 4300
  · exact (no_fixed_digitCount_4201_4300 hn (by omega) h4300).elim
  by_cases h4400 : digitCount n ≤ 4400
  · exact (no_fixed_digitCount_4301_4400 hn (by omega) h4400).elim
  by_cases h4500 : digitCount n ≤ 4500
  · exact (no_fixed_digitCount_4401_4500 hn (by omega) h4500).elim
  by_cases h4600 : digitCount n ≤ 4600
  · exact (no_fixed_digitCount_4501_4600 hn (by omega) h4600).elim
  by_cases h4700 : digitCount n ≤ 4700
  · exact (no_fixed_digitCount_4601_4700 hn (by omega) h4700).elim
  by_cases h4800 : digitCount n ≤ 4800
  · exact (no_fixed_digitCount_4701_4800 hn (by omega) h4800).elim
  by_cases h4900 : digitCount n ≤ 4900
  · exact (no_fixed_digitCount_4801_4900 hn (by omega) h4900).elim
  by_cases h5000 : digitCount n ≤ 5000
  · exact (no_fixed_digitCount_4901_5000 hn (by omega) h5000).elim
  by_cases h5100 : digitCount n ≤ 5100
  · exact (no_fixed_digitCount_5001_5100 hn (by omega) h5100).elim
  by_cases h5200 : digitCount n ≤ 5200
  · exact (no_fixed_digitCount_5101_5200 hn (by omega) h5200).elim
  by_cases h5300 : digitCount n ≤ 5300
  · exact (no_fixed_digitCount_5201_5300 hn (by omega) h5300).elim
  by_cases h5400 : digitCount n ≤ 5400
  · exact (no_fixed_digitCount_5301_5400 hn (by omega) h5400).elim
  by_cases h5500 : digitCount n ≤ 5500
  · exact (no_fixed_digitCount_5401_5500 hn (by omega) h5500).elim
  by_cases h5600 : digitCount n ≤ 5600
  · exact (no_fixed_digitCount_5501_5600 hn (by omega) h5600).elim
  by_cases h5700 : digitCount n ≤ 5700
  · exact (no_fixed_digitCount_5601_5700 hn (by omega) h5700).elim
  by_cases h5800 : digitCount n ≤ 5800
  · exact (no_fixed_digitCount_5701_5800 hn (by omega) h5800).elim
  by_cases h5900 : digitCount n ≤ 5900
  · exact (no_fixed_digitCount_5801_5900 hn (by omega) h5900).elim
  by_cases h6000 : digitCount n ≤ 6000
  · exact (no_fixed_digitCount_5901_6000 hn (by omega) h6000).elim
  by_cases h6100 : digitCount n ≤ 6100
  · exact (no_fixed_digitCount_6001_6100 hn (by omega) h6100).elim
  by_cases h6200 : digitCount n ≤ 6200
  · exact (no_fixed_digitCount_6101_6200 hn (by omega) h6200).elim
  by_cases h6300 : digitCount n ≤ 6300
  · exact (no_fixed_digitCount_6201_6300 hn (by omega) h6300).elim
  by_cases h6400 : digitCount n ≤ 6400
  · exact (no_fixed_digitCount_6301_6400 hn (by omega) h6400).elim
  by_cases h6500 : digitCount n ≤ 6500
  · exact (no_fixed_digitCount_6401_6500 hn (by omega) h6500).elim
  by_cases h6600 : digitCount n ≤ 6600
  · exact (no_fixed_digitCount_6501_6600 hn (by omega) h6600).elim
  by_cases h6700 : digitCount n ≤ 6700
  · exact (no_fixed_digitCount_6601_6700 hn (by omega) h6700).elim
  by_cases h6800 : digitCount n ≤ 6800
  · exact (no_fixed_digitCount_6701_6800 hn (by omega) h6800).elim
  by_cases h6900 : digitCount n ≤ 6900
  · exact (no_fixed_digitCount_6801_6900 hn (by omega) h6900).elim
  by_cases h7000 : digitCount n ≤ 7000
  · exact (no_fixed_digitCount_6901_7000 hn (by omega) h7000).elim
  by_cases h7100 : digitCount n ≤ 7100
  · exact (no_fixed_digitCount_7001_7100 hn (by omega) h7100).elim
  by_cases h7200 : digitCount n ≤ 7200
  · exact (no_fixed_digitCount_7101_7200 hn (by omega) h7200).elim
  by_cases h7300 : digitCount n ≤ 7300
  · exact (no_fixed_digitCount_7201_7300 hn (by omega) h7300).elim
  by_cases h7400 : digitCount n ≤ 7400
  · exact (no_fixed_digitCount_7301_7400 hn (by omega) h7400).elim
  by_cases h7500 : digitCount n ≤ 7500
  · exact (no_fixed_digitCount_7401_7500 hn (by omega) h7500).elim
  by_cases h7600 : digitCount n ≤ 7600
  · exact (no_fixed_digitCount_7501_7600 hn (by omega) h7600).elim
  by_cases h7700 : digitCount n ≤ 7700
  · exact (no_fixed_digitCount_7601_7700 hn (by omega) h7700).elim
  by_cases h7800 : digitCount n ≤ 7800
  · exact (no_fixed_digitCount_7701_7800 hn (by omega) h7800).elim
  by_cases h7900 : digitCount n ≤ 7900
  · exact (no_fixed_digitCount_7801_7900 hn (by omega) h7900).elim
  by_cases h8000 : digitCount n ≤ 8000
  · exact (no_fixed_digitCount_7901_8000 hn (by omega) h8000).elim
  by_cases h8100 : digitCount n ≤ 8100
  · exact (no_fixed_digitCount_8001_8100 hn (by omega) h8100).elim
  by_cases h8200 : digitCount n ≤ 8200
  · exact (no_fixed_digitCount_8101_8200 hn (by omega) h8200).elim
  by_cases h8300 : digitCount n ≤ 8300
  · exact (no_fixed_digitCount_8201_8300 hn (by omega) h8300).elim
  by_cases h8400 : digitCount n ≤ 8400
  · exact (no_fixed_digitCount_8301_8400 hn (by omega) h8400).elim
  by_cases h8500 : digitCount n ≤ 8500
  · exact (no_fixed_digitCount_8401_8500 hn (by omega) h8500).elim
  by_cases h8600 : digitCount n ≤ 8600
  · exact (no_fixed_digitCount_8501_8600 hn (by omega) h8600).elim
  by_cases h8700 : digitCount n ≤ 8700
  · exact (no_fixed_digitCount_8601_8700 hn (by omega) h8700).elim
  by_cases h8800 : digitCount n ≤ 8800
  · exact (no_fixed_digitCount_8701_8800 hn (by omega) h8800).elim
  by_cases h8900 : digitCount n ≤ 8900
  · exact (no_fixed_digitCount_8801_8900 hn (by omega) h8900).elim
  by_cases h9000 : digitCount n ≤ 9000
  · exact (no_fixed_digitCount_8901_9000 hn (by omega) h9000).elim
  by_cases h9100 : digitCount n ≤ 9100
  · exact (no_fixed_digitCount_9001_9100 hn (by omega) h9100).elim
  by_cases h9200 : digitCount n ≤ 9200
  · exact (no_fixed_digitCount_9101_9200 hn (by omega) h9200).elim
  by_cases h9300 : digitCount n ≤ 9300
  · exact (no_fixed_digitCount_9201_9300 hn (by omega) h9300).elim
  by_cases h9400 : digitCount n ≤ 9400
  · exact (no_fixed_digitCount_9301_9400 hn (by omega) h9400).elim
  by_cases h9500 : digitCount n ≤ 9500
  · exact (no_fixed_digitCount_9401_9500 hn (by omega) h9500).elim
  by_cases h9600 : digitCount n ≤ 9600
  · exact (no_fixed_digitCount_9501_9600 hn (by omega) h9600).elim
  by_cases h9700 : digitCount n ≤ 9700
  · exact (no_fixed_digitCount_9601_9700 hn (by omega) h9700).elim
  by_cases h9800 : digitCount n ≤ 9800
  · exact (no_fixed_digitCount_9701_9800 hn (by omega) h9800).elim
  by_cases h9900 : digitCount n ≤ 9900
  · exact (no_fixed_digitCount_9801_9900 hn (by omega) h9900).elim
  exact (no_fixed_digitCount_9901_10000 hn (by omega) hk).elim

theorem fixed_below_ten_pow_10000 {n : ℕ} (hn : a n = n)
    (hbound : n < 10 ^ 10000) : n = 1 ∨ n = 32 := by
  apply fixed_of_digitCount_le_10000 hn
  exact (Nat.digits_length_le_iff (by decide : 1 < 10) n).mpr hbound

theorem additional_fixedPoint_ge_ten_pow_10000 {n : ℕ} (hn : a n = n)
    (h1 : n ≠ 1) (h32 : n ≠ 32) : 10 ^ 10000 ≤ n := by
  by_contra hbound
  rcases fixed_below_ten_pow_10000 hn (by omega) with hh | hh
  · exact h1 hh
  · exact h32 hh

#print axioms fixed_of_digitCount_le_10000
#print axioms additional_fixedPoint_ge_ten_pow_10000
end OeisA113010
