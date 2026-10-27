import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2901
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_2801 : ExponentCertificate 2801 813 812 := by decide
private theorem cert_2802 : ExponentCertificate 2802 813 812 := by decide
private theorem cert_2803 : ExponentCertificate 2803 813 813 := by decide
private theorem cert_2804 : ExponentCertificate 2804 813 813 := by decide
private theorem cert_2805 : ExponentCertificate 2805 814 813 := by decide
private theorem cert_2806 : ExponentCertificate 2806 814 813 := by decide
private theorem cert_2807 : ExponentCertificate 2807 814 814 := by decide
private theorem cert_2808 : ExponentCertificate 2808 815 814 := by decide
private theorem cert_2809 : ExponentCertificate 2809 815 814 := by decide
private theorem cert_2810 : ExponentCertificate 2810 815 814 := by decide
private theorem cert_2811 : ExponentCertificate 2811 815 815 := by decide
private theorem cert_2812 : ExponentCertificate 2812 816 815 := by decide
private theorem cert_2813 : ExponentCertificate 2813 816 815 := by decide
private theorem cert_2814 : ExponentCertificate 2814 816 815 := by decide
private theorem cert_2815 : ExponentCertificate 2815 816 816 := by decide
private theorem cert_2816 : ExponentCertificate 2816 817 816 := by decide
private theorem cert_2817 : ExponentCertificate 2817 817 816 := by decide
private theorem cert_2818 : ExponentCertificate 2818 817 816 := by decide
private theorem cert_2819 : ExponentCertificate 2819 817 817 := by decide
private theorem cert_2820 : ExponentCertificate 2820 818 817 := by decide
private theorem cert_2821 : ExponentCertificate 2821 818 817 := by decide
private theorem cert_2822 : ExponentCertificate 2822 818 817 := by decide
private theorem cert_2823 : ExponentCertificate 2823 818 818 := by decide
private theorem cert_2824 : ExponentCertificate 2824 819 818 := by decide
private theorem cert_2825 : ExponentCertificate 2825 819 818 := by decide
private theorem cert_2826 : ExponentCertificate 2826 819 818 := by decide
private theorem cert_2827 : ExponentCertificate 2827 819 819 := by decide
private theorem cert_2828 : ExponentCertificate 2828 820 819 := by decide
private theorem cert_2829 : ExponentCertificate 2829 820 819 := by decide
private theorem cert_2830 : ExponentCertificate 2830 820 819 := by decide
private theorem cert_2831 : ExponentCertificate 2831 820 820 := by decide
private theorem cert_2832 : ExponentCertificate 2832 821 820 := by decide
private theorem cert_2833 : ExponentCertificate 2833 821 820 := by decide
private theorem cert_2834 : ExponentCertificate 2834 821 820 := by decide
private theorem cert_2835 : ExponentCertificate 2835 821 821 := by decide
private theorem cert_2836 : ExponentCertificate 2836 822 821 := by decide
private theorem cert_2837 : ExponentCertificate 2837 822 821 := by decide
private theorem cert_2838 : ExponentCertificate 2838 822 821 := by decide
private theorem cert_2839 : ExponentCertificate 2839 822 822 := by decide
private theorem cert_2840 : ExponentCertificate 2840 823 822 := by decide
private theorem cert_2841 : ExponentCertificate 2841 823 822 := by decide
private theorem cert_2842 : ExponentCertificate 2842 823 822 := by decide
private theorem cert_2843 : ExponentCertificate 2843 823 823 := by decide
private theorem cert_2844 : ExponentCertificate 2844 824 823 := by decide
private theorem cert_2845 : ExponentCertificate 2845 824 823 := by decide
private theorem cert_2846 : ExponentCertificate 2846 824 823 := by decide
private theorem cert_2847 : ExponentCertificate 2847 824 824 := by decide
private theorem cert_2848 : ExponentCertificate 2848 825 824 := by decide
private theorem cert_2849 : ExponentCertificate 2849 825 824 := by decide
private theorem cert_2850 : ExponentCertificate 2850 825 824 := by decide
private theorem cert_2851 : ExponentCertificate 2851 825 825 := by decide
private theorem cert_2852 : ExponentCertificate 2852 826 825 := by decide
private theorem cert_2853 : ExponentCertificate 2853 826 825 := by decide
private theorem cert_2854 : ExponentCertificate 2854 826 825 := by decide
private theorem suffix_2855 : 826 < digitSum ((2855 : ℕ) ^ 826 % 10 ^ 207) := by
  have hmod : (2855 : ℕ) ^ 826 % 10 ^ 207 = 205196965141349560329272790502028135389171594147830190508804115894835302051458413544971190680029875836122283504424806904626874614382574078030124221213944120975779445738285122757815770455636084079742431640625 := by
    have h1 : (2855 : ℕ) ^ 1 % 10 ^ 207 = 2855 := by decide
    have h3 : (2855 : ℕ) ^ 3 % 10 ^ 207 = 23271176375 := by
      have step := pow_mod_double_add_one (k := 2855) (e := 1) (m := 10 ^ 207) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (2855 : ℕ) ^ 6 % 10 ^ 207 = 541547649876358140625 := by
      have step := pow_mod_double (k := 2855) (e := 3) (m := 10 ^ 207) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (2855 : ℕ) ^ 12 % 10 ^ 207 = 293273857086606583242963871889707275390625 := by
      have step := pow_mod_double (k := 2855) (e := 6) (m := 10 ^ 207) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h25 : (2855 : ℕ) ^ 25 % 10 ^ 207 = 245557280240050002626263877151686300635496970323359237236482026840523183345794677734375 := by
      have step := pow_mod_double_add_one (k := 2855) (e := 12) (m := 10 ^ 207) h12
      have he : 2 * 12 + 1 = 25 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h51 : (2855 : ℕ) ^ 51 % 10 ^ 207 = 172151868844232238962325334022684799395948708738151167038951641758557272060942272804201830450215493623786607964937752873907386480353815861464195080543504445813596248626708984375 := by
      have step := pow_mod_double_add_one (k := 2855) (e := 25) (m := 10 ^ 207) h25
      have he : 2 * 25 + 1 = 51 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h103 : (2855 : ℕ) ^ 103 % 10 ^ 207 = 623464548302857364369708557835798749322151066813194825682060764769809167814639433437430349200372612419439971639011722530959291666946369691697332828933000149569781923007683044346549650072120130062103271484375 := by
      have step := pow_mod_double_add_one (k := 2855) (e := 51) (m := 10 ^ 207) h51
      have he : 2 * 51 + 1 = 103 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h206 : (2855 : ℕ) ^ 206 % 10 ^ 207 = 591931213117818484725836649803722070935890736206469520565056302166873353567436414854319095734615440105141691700648754543720501856329445005857548683339475881139908120844028704965467113652266561985015869140625 := by
      have step := pow_mod_double (k := 2855) (e := 103) (m := 10 ^ 207) h103
      have he : 2 * 103 = 206 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h413 : (2855 : ℕ) ^ 413 % 10 ^ 207 = 866135695983262761058104754353675857212324735722028833155142156987885111914363541530386869972456795655759581821253548838882264747143669846050481015123275726951411110886291933042002710863016545772552490234375 := by
      have step := pow_mod_double_add_one (k := 2855) (e := 206) (m := 10 ^ 207) h206
      have he : 2 * 206 + 1 = 413 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h826 : (2855 : ℕ) ^ 826 % 10 ^ 207 = 205196965141349560329272790502028135389171594147830190508804115894835302051458413544971190680029875836122283504424806904626874614382574078030124221213944120975779445738285122757815770455636084079742431640625 := by
      have step := pow_mod_double (k := 2855) (e := 413) (m := 10 ^ 207) h413
      have he : 2 * 413 = 826 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h826
  rw [hmod]
  decide
private theorem cert_2855 : ExponentCertificate 2855 826 826 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2855) (by decide) (by decide) (by decide) suffix_2855
private theorem cert_2856 : ExponentCertificate 2856 827 826 := by decide
private theorem cert_2857 : ExponentCertificate 2857 827 826 := by decide
private theorem cert_2858 : ExponentCertificate 2858 827 826 := by decide
private theorem cert_2859 : ExponentCertificate 2859 827 827 := by decide
private theorem cert_2860 : ExponentCertificate 2860 828 827 := by decide
private theorem cert_2861 : ExponentCertificate 2861 828 827 := by decide
private theorem cert_2862 : ExponentCertificate 2862 828 827 := by decide
private theorem cert_2863 : ExponentCertificate 2863 828 828 := by decide
private theorem cert_2864 : ExponentCertificate 2864 829 828 := by decide
private theorem cert_2865 : ExponentCertificate 2865 829 828 := by decide
private theorem cert_2866 : ExponentCertificate 2866 829 828 := by decide
private theorem cert_2867 : ExponentCertificate 2867 829 829 := by decide
private theorem cert_2868 : ExponentCertificate 2868 830 829 := by decide
private theorem cert_2869 : ExponentCertificate 2869 830 829 := by decide
private theorem cert_2870 : ExponentCertificate 2870 830 829 := by decide
private theorem cert_2871 : ExponentCertificate 2871 830 830 := by decide
private theorem cert_2872 : ExponentCertificate 2872 831 830 := by decide
private theorem cert_2873 : ExponentCertificate 2873 831 830 := by decide
private theorem cert_2874 : ExponentCertificate 2874 831 830 := by decide
private theorem cert_2875 : ExponentCertificate 2875 831 831 := by decide
private theorem cert_2876 : ExponentCertificate 2876 832 831 := by decide
private theorem cert_2877 : ExponentCertificate 2877 832 831 := by decide
private theorem cert_2878 : ExponentCertificate 2878 832 832 := by decide
private theorem cert_2879 : ExponentCertificate 2879 832 832 := by decide
private theorem cert_2880 : ExponentCertificate 2880 833 832 := by decide
private theorem cert_2881 : ExponentCertificate 2881 833 832 := by decide
private theorem suffix_2882 : 833 < digitSum ((2882 : ℕ) ^ 833 % 10 ^ 209) := by
  have hmod : (2882 : ℕ) ^ 833 % 10 ^ 209 = 82102248202030616103218388764690262985291238949385602040642680873235197725619108354764046327211121841169667087162375153601232165092099597957244265750652826626232629959517523620297290943315284394054772202668032 := by
    have h1 : (2882 : ℕ) ^ 1 % 10 ^ 209 = 2882 := by decide
    have h3 : (2882 : ℕ) ^ 3 % 10 ^ 209 = 23937672968 := by
      have step := pow_mod_double_add_one (k := 2882) (e := 1) (m := 10 ^ 209) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (2882 : ℕ) ^ 6 % 10 ^ 209 = 573012187122917929024 := by
      have step := pow_mod_double (k := 2882) (e := 3) (m := 10 ^ 209) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h13 : (2882 : ℕ) ^ 13 % 10 ^ 209 = 946284429716385725456615192660964510789804032 := by
      have step := pow_mod_double_add_one (k := 2882) (e := 6) (m := 10 ^ 209) h6
      have he : 2 * 6 + 1 = 13 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h26 : (2882 : ℕ) ^ 26 % 10 ^ 209 = 895454221923665355828136251357812422253365009577693362580305363951713258637599048963457024 := by
      have step := pow_mod_double (k := 2882) (e := 13) (m := 10 ^ 209) h13
      have he : 2 * 13 = 26 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h52 : (2882 : ℕ) ^ 52 % 10 ^ 209 = 801838263560916925188700803240057784549395795421200357945043930748089223811097102826231856575890033235284352051797555574530369478118368455134280874398385747153251510875741094936576 := by
      have step := pow_mod_double (k := 2882) (e := 26) (m := 10 ^ 209) h26
      have he : 2 * 26 = 52 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h104 : (2882 : ℕ) ^ 104 % 10 ^ 209 = 41506452084894542771034965716986119629017544836945642874721912176433348041079217147778749121910163597762300268710647724265126448683347979864093248597306409242131773468305850356885867633717820233018585462603776 := by
      have step := pow_mod_double (k := 2882) (e := 52) (m := 10 ^ 209) h52
      have he : 2 * 52 = 104 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h208 : (2882 : ℕ) ^ 208 % 10 ^ 209 = 11819938939647813397839602312168065575936695179802240714758088923351592163390742583462161248334750253723817544606285242980383651829691715814854900390238813236494540546537549402455158071969419812356173569458176 := by
      have step := pow_mod_double (k := 2882) (e := 104) (m := 10 ^ 209) h104
      have he : 2 * 104 = 208 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h416 : (2882 : ℕ) ^ 416 % 10 ^ 209 = 75516019995235312894186313956357106678675054405697459730666044753666579430474378999535999477556887589979038511462486427124725558273372264108533201352836773248738451298571841718580290879451146402123510213246976 := by
      have step := pow_mod_double (k := 2882) (e := 208) (m := 10 ^ 209) h208
      have he : 2 * 208 = 416 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h833 : (2882 : ℕ) ^ 833 % 10 ^ 209 = 82102248202030616103218388764690262985291238949385602040642680873235197725619108354764046327211121841169667087162375153601232165092099597957244265750652826626232629959517523620297290943315284394054772202668032 := by
      have step := pow_mod_double_add_one (k := 2882) (e := 416) (m := 10 ^ 209) h416
      have he : 2 * 416 + 1 = 833 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h833
  rw [hmod]
  decide
private theorem cert_2882 : ExponentCertificate 2882 833 833 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2882) (by decide) (by decide) (by decide) suffix_2882
private theorem cert_2883 : ExponentCertificate 2883 833 833 := by decide
private theorem cert_2884 : ExponentCertificate 2884 834 833 := by decide
private theorem cert_2885 : ExponentCertificate 2885 834 833 := by decide
private theorem cert_2886 : ExponentCertificate 2886 834 834 := by decide
private theorem cert_2887 : ExponentCertificate 2887 834 834 := by decide
private theorem cert_2888 : ExponentCertificate 2888 835 834 := by decide
private theorem cert_2889 : ExponentCertificate 2889 835 834 := by decide
private theorem cert_2890 : ExponentCertificate 2890 835 835 := by decide
private theorem cert_2891 : ExponentCertificate 2891 836 835 := by decide
private theorem cert_2892 : ExponentCertificate 2892 836 835 := by decide
private theorem cert_2893 : ExponentCertificate 2893 836 835 := by decide
private theorem cert_2894 : ExponentCertificate 2894 836 836 := by decide
private theorem cert_2895 : ExponentCertificate 2895 837 836 := by decide
private theorem cert_2896 : ExponentCertificate 2896 837 836 := by decide
private theorem cert_2897 : ExponentCertificate 2897 837 836 := by decide
private theorem suffix_2898 : 837 < digitSum ((2898 : ℕ) ^ 837 % 10 ^ 210) := by
  have hmod : (2898 : ℕ) ^ 837 % 10 ^ 210 = 157822826890098515003938070837327868828873130629506750043572563714792905810825435935253449074803953016061674277866535164764138609805504489843763715170832275334429976156057055298509358810014236243741036488163328 := by
    have h1 : (2898 : ℕ) ^ 1 % 10 ^ 210 = 2898 := by decide
    have h3 : (2898 : ℕ) ^ 3 % 10 ^ 210 = 24338574792 := by
      have step := pow_mod_double_add_one (k := 2898) (e := 1) (m := 10 ^ 210) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (2898 : ℕ) ^ 6 % 10 ^ 210 = 592366222905777843264 := by
      have step := pow_mod_double (k := 2898) (e := 3) (m := 10 ^ 210) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h13 : (2898 : ℕ) ^ 13 % 10 ^ 210 = 1016901656430927964730176077518423748803371008 := by
      have step := pow_mod_double_add_one (k := 2898) (e := 6) (m := 10 ^ 210) h6
      have he : 2 * 6 + 1 = 13 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h26 : (2898 : ℕ) ^ 26 % 10 ^ 210 = 1034088978851965058087350203586630838761950134137537873146656381317291954649200944494936064 := by
      have step := pow_mod_double (k := 2898) (e := 13) (m := 10 ^ 210) h13
      have he : 2 * 13 = 26 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h52 : (2898 : ℕ) ^ 52 % 10 ^ 210 = 1069340016183099837144361673711764043574877158201951744852198517864460417318040493342441162660197521359026856765937450569179515362524337635032724801598248036375168181850539447812096 := by
      have step := pow_mod_double (k := 2898) (e := 26) (m := 10 ^ 210) h26
      have he : 2 * 26 = 52 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h104 : (2898 : ℕ) ^ 104 % 10 ^ 210 = 21943866099348996529096998218543060767484441114152274601882341980419470240086485363576630896487409093173733466285330619858447140298881139577249937245591129430664474824759047053294819146324519257175161323913216 := by
      have step := pow_mod_double (k := 2898) (e := 52) (m := 10 ^ 210) h52
      have he : 2 * 52 = 104 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h209 : (2898 : ℕ) ^ 209 % 10 ^ 210 = 935583707702720826811237497644109776519431414398035113952909931241638945167863934821009999273460961109358744470108425042819058931954159110846409076432168022621044574952230801481488152294554566159287501442777088 := by
      have step := pow_mod_double_add_one (k := 2898) (e := 104) (m := 10 ^ 210) h104
      have he : 2 * 104 + 1 = 209 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h418 : (2898 : ℕ) ^ 418 % 10 ^ 210 = 664254635610578185209811080976995682555629839026675424802308492296032316452873129808368302858212050322579386591601021322912987538859972261926832867314023469697286134199421201436898418097050328891205725657759744 := by
      have step := pow_mod_double (k := 2898) (e := 209) (m := 10 ^ 210) h209
      have he : 2 * 209 = 418 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h837 : (2898 : ℕ) ^ 837 % 10 ^ 210 = 157822826890098515003938070837327868828873130629506750043572563714792905810825435935253449074803953016061674277866535164764138609805504489843763715170832275334429976156057055298509358810014236243741036488163328 := by
      have step := pow_mod_double_add_one (k := 2898) (e := 418) (m := 10 ^ 210) h418
      have he : 2 * 418 + 1 = 837 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h837
  rw [hmod]
  decide
private theorem cert_2898 : ExponentCertificate 2898 837 837 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2898) (by decide) (by decide) (by decide) suffix_2898
private theorem cert_2899 : ExponentCertificate 2899 838 837 := by decide
private theorem cert_2900 : ExponentCertificate 2900 838 837 := by decide

private theorem certificates_2801_2900 {k : ℕ} (hlo : 2801 ≤ k) (hhi : k ≤ 2900) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨813, 812, cert_2801⟩
  · exact ⟨813, 812, cert_2802⟩
  · exact ⟨813, 813, cert_2803⟩
  · exact ⟨813, 813, cert_2804⟩
  · exact ⟨814, 813, cert_2805⟩
  · exact ⟨814, 813, cert_2806⟩
  · exact ⟨814, 814, cert_2807⟩
  · exact ⟨815, 814, cert_2808⟩
  · exact ⟨815, 814, cert_2809⟩
  · exact ⟨815, 814, cert_2810⟩
  · exact ⟨815, 815, cert_2811⟩
  · exact ⟨816, 815, cert_2812⟩
  · exact ⟨816, 815, cert_2813⟩
  · exact ⟨816, 815, cert_2814⟩
  · exact ⟨816, 816, cert_2815⟩
  · exact ⟨817, 816, cert_2816⟩
  · exact ⟨817, 816, cert_2817⟩
  · exact ⟨817, 816, cert_2818⟩
  · exact ⟨817, 817, cert_2819⟩
  · exact ⟨818, 817, cert_2820⟩
  · exact ⟨818, 817, cert_2821⟩
  · exact ⟨818, 817, cert_2822⟩
  · exact ⟨818, 818, cert_2823⟩
  · exact ⟨819, 818, cert_2824⟩
  · exact ⟨819, 818, cert_2825⟩
  · exact ⟨819, 818, cert_2826⟩
  · exact ⟨819, 819, cert_2827⟩
  · exact ⟨820, 819, cert_2828⟩
  · exact ⟨820, 819, cert_2829⟩
  · exact ⟨820, 819, cert_2830⟩
  · exact ⟨820, 820, cert_2831⟩
  · exact ⟨821, 820, cert_2832⟩
  · exact ⟨821, 820, cert_2833⟩
  · exact ⟨821, 820, cert_2834⟩
  · exact ⟨821, 821, cert_2835⟩
  · exact ⟨822, 821, cert_2836⟩
  · exact ⟨822, 821, cert_2837⟩
  · exact ⟨822, 821, cert_2838⟩
  · exact ⟨822, 822, cert_2839⟩
  · exact ⟨823, 822, cert_2840⟩
  · exact ⟨823, 822, cert_2841⟩
  · exact ⟨823, 822, cert_2842⟩
  · exact ⟨823, 823, cert_2843⟩
  · exact ⟨824, 823, cert_2844⟩
  · exact ⟨824, 823, cert_2845⟩
  · exact ⟨824, 823, cert_2846⟩
  · exact ⟨824, 824, cert_2847⟩
  · exact ⟨825, 824, cert_2848⟩
  · exact ⟨825, 824, cert_2849⟩
  · exact ⟨825, 824, cert_2850⟩
  · exact ⟨825, 825, cert_2851⟩
  · exact ⟨826, 825, cert_2852⟩
  · exact ⟨826, 825, cert_2853⟩
  · exact ⟨826, 825, cert_2854⟩
  · exact ⟨826, 826, cert_2855⟩
  · exact ⟨827, 826, cert_2856⟩
  · exact ⟨827, 826, cert_2857⟩
  · exact ⟨827, 826, cert_2858⟩
  · exact ⟨827, 827, cert_2859⟩
  · exact ⟨828, 827, cert_2860⟩
  · exact ⟨828, 827, cert_2861⟩
  · exact ⟨828, 827, cert_2862⟩
  · exact ⟨828, 828, cert_2863⟩
  · exact ⟨829, 828, cert_2864⟩
  · exact ⟨829, 828, cert_2865⟩
  · exact ⟨829, 828, cert_2866⟩
  · exact ⟨829, 829, cert_2867⟩
  · exact ⟨830, 829, cert_2868⟩
  · exact ⟨830, 829, cert_2869⟩
  · exact ⟨830, 829, cert_2870⟩
  · exact ⟨830, 830, cert_2871⟩
  · exact ⟨831, 830, cert_2872⟩
  · exact ⟨831, 830, cert_2873⟩
  · exact ⟨831, 830, cert_2874⟩
  · exact ⟨831, 831, cert_2875⟩
  · exact ⟨832, 831, cert_2876⟩
  · exact ⟨832, 831, cert_2877⟩
  · exact ⟨832, 832, cert_2878⟩
  · exact ⟨832, 832, cert_2879⟩
  · exact ⟨833, 832, cert_2880⟩
  · exact ⟨833, 832, cert_2881⟩
  · exact ⟨833, 833, cert_2882⟩
  · exact ⟨833, 833, cert_2883⟩
  · exact ⟨834, 833, cert_2884⟩
  · exact ⟨834, 833, cert_2885⟩
  · exact ⟨834, 834, cert_2886⟩
  · exact ⟨834, 834, cert_2887⟩
  · exact ⟨835, 834, cert_2888⟩
  · exact ⟨835, 834, cert_2889⟩
  · exact ⟨835, 835, cert_2890⟩
  · exact ⟨836, 835, cert_2891⟩
  · exact ⟨836, 835, cert_2892⟩
  · exact ⟨836, 835, cert_2893⟩
  · exact ⟨836, 836, cert_2894⟩
  · exact ⟨837, 836, cert_2895⟩
  · exact ⟨837, 836, cert_2896⟩
  · exact ⟨837, 836, cert_2897⟩
  · exact ⟨837, 837, cert_2898⟩
  · exact ⟨838, 837, cert_2899⟩
  · exact ⟨838, 837, cert_2900⟩

theorem no_fixed_digitCount_2801_2900 {n : ℕ} (hn : a n = n)
    (hlo : 2801 ≤ digitCount n) (hhi : digitCount n ≤ 2900) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_2801_2900 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_2801_2900
end OeisA113010
