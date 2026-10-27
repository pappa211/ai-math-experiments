import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 8801
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_8701 : ExponentCertificate 8701 2209 2208 := by decide
private theorem cert_8702 : ExponentCertificate 8702 2209 2208 := by decide
private theorem cert_8703 : ExponentCertificate 8703 2209 2209 := by decide
private theorem cert_8704 : ExponentCertificate 8704 2210 2209 := by decide
private theorem cert_8705 : ExponentCertificate 8705 2210 2209 := by decide
private theorem cert_8706 : ExponentCertificate 8706 2210 2209 := by decide
private theorem cert_8707 : ExponentCertificate 8707 2210 2209 := by decide
private theorem cert_8708 : ExponentCertificate 8708 2210 2210 := by decide
private theorem cert_8709 : ExponentCertificate 8709 2211 2210 := by decide
private theorem cert_8710 : ExponentCertificate 8710 2211 2210 := by decide
private theorem cert_8711 : ExponentCertificate 8711 2211 2210 := by decide
private theorem cert_8712 : ExponentCertificate 8712 2211 2211 := by decide
private theorem cert_8713 : ExponentCertificate 8713 2212 2211 := by decide
private theorem cert_8714 : ExponentCertificate 8714 2212 2211 := by decide
private theorem cert_8715 : ExponentCertificate 8715 2212 2211 := by decide
private theorem cert_8716 : ExponentCertificate 8716 2212 2212 := by decide
private theorem cert_8717 : ExponentCertificate 8717 2212 2212 := by decide
private theorem cert_8718 : ExponentCertificate 8718 2213 2212 := by decide
private theorem cert_8719 : ExponentCertificate 8719 2213 2212 := by decide
private theorem cert_8720 : ExponentCertificate 8720 2213 2212 := by decide
private theorem cert_8721 : ExponentCertificate 8721 2213 2213 := by decide
private theorem cert_8722 : ExponentCertificate 8722 2214 2213 := by decide
private theorem cert_8723 : ExponentCertificate 8723 2214 2213 := by decide
private theorem cert_8724 : ExponentCertificate 8724 2214 2213 := by decide
private theorem cert_8725 : ExponentCertificate 8725 2214 2214 := by decide
private theorem cert_8726 : ExponentCertificate 8726 2215 2214 := by decide
private theorem cert_8727 : ExponentCertificate 8727 2215 2214 := by decide
private theorem cert_8728 : ExponentCertificate 8728 2215 2214 := by decide
private theorem cert_8729 : ExponentCertificate 8729 2215 2214 := by decide
private theorem cert_8730 : ExponentCertificate 8730 2215 2215 := by decide
private theorem cert_8731 : ExponentCertificate 8731 2216 2215 := by decide
private theorem cert_8732 : ExponentCertificate 8732 2216 2215 := by decide
private theorem cert_8733 : ExponentCertificate 8733 2216 2215 := by decide
private theorem cert_8734 : ExponentCertificate 8734 2216 2216 := by decide
private theorem cert_8735 : ExponentCertificate 8735 2217 2216 := by decide
private theorem cert_8736 : ExponentCertificate 8736 2217 2216 := by decide
private theorem cert_8737 : ExponentCertificate 8737 2217 2216 := by decide
private theorem cert_8738 : ExponentCertificate 8738 2217 2216 := by decide
private theorem cert_8739 : ExponentCertificate 8739 2217 2217 := by decide
private theorem cert_8740 : ExponentCertificate 8740 2218 2217 := by decide
private theorem cert_8741 : ExponentCertificate 8741 2218 2217 := by decide
private theorem cert_8742 : ExponentCertificate 8742 2218 2217 := by decide
private theorem suffix_8743 : 2218 < digitSum ((8743 : ℕ) ^ 2218 % 10 ^ 555) := by
  have hmod : (8743 : ℕ) ^ 2218 % 10 ^ 555 = 749489659829041440344711592870313205198715302255337612240920125408364929636722510377074560074331970604148579412782450345386686865622117222696635095001326194145374927912046244347783944110203570114700846215713095592458435264700211985670126773263684607844835656036882381536874222162080581213559228170448237429328221941493574181773594373238791223849075384331735645660885182975392466739709397821784796095667732028863745321811504541395951018560978452673704492619655517830495504811756833462634128233099258566237576660050194771240580992596439519729066029362550449 := by
    have h1 : (8743 : ℕ) ^ 1 % 10 ^ 555 = 8743 := by decide
    have h2 : (8743 : ℕ) ^ 2 % 10 ^ 555 = 76440049 := by
      have step := pow_mod_double (k := 8743) (e := 1) (m := 10 ^ 555) h1
      have he : 2 * 1 = 2 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h4 : (8743 : ℕ) ^ 4 % 10 ^ 555 = 5843081091122401 := by
      have step := pow_mod_double (k := 8743) (e := 2) (m := 10 ^ 555) h2
      have he : 2 * 2 = 4 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h8 : (8743 : ℕ) ^ 8 % 10 ^ 555 = 34141596637432148218253964004801 := by
      have step := pow_mod_double (k := 8743) (e := 4) (m := 10 ^ 555) h4
      have he : 2 * 4 = 8 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h17 : (8743 : ℕ) ^ 17 % 10 ^ 555 = 10191265892993112161002768313214027907138335205896157626635226661543 := by
      have step := pow_mod_double_add_one (k := 8743) (e := 8) (m := 10 ^ 555) h8
      have he : 2 * 8 + 1 = 17 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h34 : (8743 : ℕ) ^ 34 % 10 ^ 555 = 103861900501684695851702122220404579423946741703327586794427534124644786057651169518828174527388184933670515352994073665371065075140849 := by
      have step := pow_mod_double (k := 8743) (e := 17) (m := 10 ^ 555) h17
      have he : 2 * 17 = 34 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h69 : (8743 : ℕ) ^ 69 % 10 ^ 555 = 94313314727810449201933252943207724489573430650761703904639849594824831086906953599531767815469242724712249889461260788848075585807050071170709715306087930439598597080063100577990717909459430049170044971903852176480259479003486174398678992895353633411064574623778537923143 := by
      have step := pow_mod_double_add_one (k := 8743) (e := 34) (m := 10 ^ 555) h34
      have he : 2 * 34 + 1 = 69 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h138 : (8743 : ℕ) ^ 138 % 10 ^ 555 = 8895001334947027385834010551268212600051466948320005724909141630189571415082451033272387168408030910337013941749997221234737567653957400975585448274150150455393784826079415614863884084086496492048302547728777102391710093104912693635431724383638031578765164171381912768134691007604792342033678760285078929141790404946146404285885843145460626095046879246199080419970539823409341323111365020661341405314744125909428492951261835783562476157871154135745965104851924574784332395173448057165372864553973453602378168168713969576908445697949815774998449 := by
      have step := pow_mod_double (k := 8743) (e := 69) (m := 10 ^ 555) h69
      have he : 2 * 69 = 138 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h277 : (8743 : ℕ) ^ 277 % 10 ^ 555 = 509027136414548899131558682622690680095621919387671638261629709284817384101137479136531997516426705873888996405668374655039990304931453509945571275444017766640347706963071930731722663045478810987799976670222075114206816758553199452886222848401441349226574264223904343551911585664182358298150113289143192832532270636661047357927737275973652274659994041212879020644025714408177244516676325974014619391920166894978670623164808382672556269079649833520319828971884090744413324653147722836370377075415419282330055714681878207557992000488978153422001821882169543 := by
      have step := pow_mod_double_add_one (k := 8743) (e := 138) (m := 10 ^ 555) h138
      have he : 2 * 138 + 1 = 277 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h554 : (8743 : ℕ) ^ 554 % 10 ^ 555 = 983122081401316282822909381512446016427249010004822775745493893423953334988066588632601044463530494432219928409635881877513023464341178253109520195018296208298719680233010757694901893463268396103403423645576434650209118462992606334682002703280664809503163443017561620155470277218281956450173507040294425075740892181300037365387550014495830729128223852080268785576090710668535564978409375432234407667622146006185839826656392844518175253810276896958633701941144287488941067883330709561733909845216719665886930586217040649306554031209858506931698708596828849 := by
      have step := pow_mod_double (k := 8743) (e := 277) (m := 10 ^ 555) h277
      have he : 2 * 277 = 554 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h1109 : (8743 : ℕ) ^ 1109 % 10 ^ 555 = 731285153696215644167253827983262895835440801011909307198735515224999896695257422180839398274360968773903300117804763415561203284781089507109254183572155190934215376798542130232504156835295715624769141693860248177583326385344177307622959711257803293938344476033466473586109204416564143078364197037543680821618672802830568693996696056427682253557417406977203228986496947584907104058072401759885820033035066334148754356094712515274982974034918086221216596171446334673173032198936398706025863049847308823359980413487222772635199441979895037625604225326355143 := by
      have step := pow_mod_double_add_one (k := 8743) (e := 554) (m := 10 ^ 555) h554
      have he : 2 * 554 + 1 = 1109 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h2218 : (8743 : ℕ) ^ 2218 % 10 ^ 555 = 749489659829041440344711592870313205198715302255337612240920125408364929636722510377074560074331970604148579412782450345386686865622117222696635095001326194145374927912046244347783944110203570114700846215713095592458435264700211985670126773263684607844835656036882381536874222162080581213559228170448237429328221941493574181773594373238791223849075384331735645660885182975392466739709397821784796095667732028863745321811504541395951018560978452673704492619655517830495504811756833462634128233099258566237576660050194771240580992596439519729066029362550449 := by
      have step := pow_mod_double (k := 8743) (e := 1109) (m := 10 ^ 555) h1109
      have he : 2 * 1109 = 2218 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h2218
  rw [hmod]
  decide
private theorem cert_8743 : ExponentCertificate 8743 2218 2218 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 8743) (by decide) (by decide) (by decide) suffix_8743
private theorem cert_8744 : ExponentCertificate 8744 2219 2218 := by decide
private theorem cert_8745 : ExponentCertificate 8745 2219 2218 := by decide
private theorem cert_8746 : ExponentCertificate 8746 2219 2218 := by decide
private theorem cert_8747 : ExponentCertificate 8747 2219 2219 := by decide
private theorem cert_8748 : ExponentCertificate 8748 2219 2219 := by decide
private theorem cert_8749 : ExponentCertificate 8749 2220 2219 := by decide
private theorem cert_8750 : ExponentCertificate 8750 2220 2219 := by decide
private theorem cert_8751 : ExponentCertificate 8751 2220 2219 := by decide
private theorem cert_8752 : ExponentCertificate 8752 2220 2220 := by decide
private theorem cert_8753 : ExponentCertificate 8753 2221 2220 := by decide
private theorem cert_8754 : ExponentCertificate 8754 2221 2220 := by decide
private theorem cert_8755 : ExponentCertificate 8755 2221 2220 := by decide
private theorem cert_8756 : ExponentCertificate 8756 2221 2221 := by decide
private theorem cert_8757 : ExponentCertificate 8757 2222 2221 := by decide
private theorem cert_8758 : ExponentCertificate 8758 2222 2221 := by decide
private theorem cert_8759 : ExponentCertificate 8759 2222 2221 := by decide
private theorem cert_8760 : ExponentCertificate 8760 2222 2221 := by decide
private theorem cert_8761 : ExponentCertificate 8761 2222 2222 := by decide
private theorem cert_8762 : ExponentCertificate 8762 2223 2222 := by decide
private theorem cert_8763 : ExponentCertificate 8763 2223 2222 := by decide
private theorem cert_8764 : ExponentCertificate 8764 2223 2222 := by decide
private theorem cert_8765 : ExponentCertificate 8765 2223 2223 := by decide
private theorem cert_8766 : ExponentCertificate 8766 2224 2223 := by decide
private theorem cert_8767 : ExponentCertificate 8767 2224 2223 := by decide
private theorem cert_8768 : ExponentCertificate 8768 2224 2223 := by decide
private theorem cert_8769 : ExponentCertificate 8769 2224 2223 := by decide
private theorem cert_8770 : ExponentCertificate 8770 2224 2224 := by decide
private theorem cert_8771 : ExponentCertificate 8771 2225 2224 := by decide
private theorem cert_8772 : ExponentCertificate 8772 2225 2224 := by decide
private theorem cert_8773 : ExponentCertificate 8773 2225 2224 := by decide
private theorem cert_8774 : ExponentCertificate 8774 2225 2225 := by decide
private theorem cert_8775 : ExponentCertificate 8775 2226 2225 := by decide
private theorem cert_8776 : ExponentCertificate 8776 2226 2225 := by decide
private theorem cert_8777 : ExponentCertificate 8777 2226 2225 := by decide
private theorem cert_8778 : ExponentCertificate 8778 2226 2226 := by decide
private theorem cert_8779 : ExponentCertificate 8779 2226 2226 := by decide
private theorem cert_8780 : ExponentCertificate 8780 2227 2226 := by decide
private theorem cert_8781 : ExponentCertificate 8781 2227 2226 := by decide
private theorem cert_8782 : ExponentCertificate 8782 2227 2226 := by decide
private theorem cert_8783 : ExponentCertificate 8783 2227 2227 := by decide
private theorem cert_8784 : ExponentCertificate 8784 2228 2227 := by decide
private theorem cert_8785 : ExponentCertificate 8785 2228 2227 := by decide
private theorem cert_8786 : ExponentCertificate 8786 2228 2227 := by decide
private theorem cert_8787 : ExponentCertificate 8787 2228 2228 := by decide
private theorem cert_8788 : ExponentCertificate 8788 2229 2228 := by decide
private theorem cert_8789 : ExponentCertificate 8789 2229 2228 := by decide
private theorem cert_8790 : ExponentCertificate 8790 2229 2228 := by decide
private theorem cert_8791 : ExponentCertificate 8791 2229 2228 := by decide
private theorem cert_8792 : ExponentCertificate 8792 2229 2229 := by decide
private theorem cert_8793 : ExponentCertificate 8793 2230 2229 := by decide
private theorem cert_8794 : ExponentCertificate 8794 2230 2229 := by decide
private theorem cert_8795 : ExponentCertificate 8795 2230 2229 := by decide
private theorem cert_8796 : ExponentCertificate 8796 2230 2230 := by decide
private theorem cert_8797 : ExponentCertificate 8797 2231 2230 := by decide
private theorem cert_8798 : ExponentCertificate 8798 2231 2230 := by decide
private theorem cert_8799 : ExponentCertificate 8799 2231 2230 := by decide
private theorem cert_8800 : ExponentCertificate 8800 2231 2230 := by decide

private theorem certificates_8701_8800 {k : ℕ} (hlo : 8701 ≤ k) (hhi : k ≤ 8800) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨2209, 2208, cert_8701⟩
  · exact ⟨2209, 2208, cert_8702⟩
  · exact ⟨2209, 2209, cert_8703⟩
  · exact ⟨2210, 2209, cert_8704⟩
  · exact ⟨2210, 2209, cert_8705⟩
  · exact ⟨2210, 2209, cert_8706⟩
  · exact ⟨2210, 2209, cert_8707⟩
  · exact ⟨2210, 2210, cert_8708⟩
  · exact ⟨2211, 2210, cert_8709⟩
  · exact ⟨2211, 2210, cert_8710⟩
  · exact ⟨2211, 2210, cert_8711⟩
  · exact ⟨2211, 2211, cert_8712⟩
  · exact ⟨2212, 2211, cert_8713⟩
  · exact ⟨2212, 2211, cert_8714⟩
  · exact ⟨2212, 2211, cert_8715⟩
  · exact ⟨2212, 2212, cert_8716⟩
  · exact ⟨2212, 2212, cert_8717⟩
  · exact ⟨2213, 2212, cert_8718⟩
  · exact ⟨2213, 2212, cert_8719⟩
  · exact ⟨2213, 2212, cert_8720⟩
  · exact ⟨2213, 2213, cert_8721⟩
  · exact ⟨2214, 2213, cert_8722⟩
  · exact ⟨2214, 2213, cert_8723⟩
  · exact ⟨2214, 2213, cert_8724⟩
  · exact ⟨2214, 2214, cert_8725⟩
  · exact ⟨2215, 2214, cert_8726⟩
  · exact ⟨2215, 2214, cert_8727⟩
  · exact ⟨2215, 2214, cert_8728⟩
  · exact ⟨2215, 2214, cert_8729⟩
  · exact ⟨2215, 2215, cert_8730⟩
  · exact ⟨2216, 2215, cert_8731⟩
  · exact ⟨2216, 2215, cert_8732⟩
  · exact ⟨2216, 2215, cert_8733⟩
  · exact ⟨2216, 2216, cert_8734⟩
  · exact ⟨2217, 2216, cert_8735⟩
  · exact ⟨2217, 2216, cert_8736⟩
  · exact ⟨2217, 2216, cert_8737⟩
  · exact ⟨2217, 2216, cert_8738⟩
  · exact ⟨2217, 2217, cert_8739⟩
  · exact ⟨2218, 2217, cert_8740⟩
  · exact ⟨2218, 2217, cert_8741⟩
  · exact ⟨2218, 2217, cert_8742⟩
  · exact ⟨2218, 2218, cert_8743⟩
  · exact ⟨2219, 2218, cert_8744⟩
  · exact ⟨2219, 2218, cert_8745⟩
  · exact ⟨2219, 2218, cert_8746⟩
  · exact ⟨2219, 2219, cert_8747⟩
  · exact ⟨2219, 2219, cert_8748⟩
  · exact ⟨2220, 2219, cert_8749⟩
  · exact ⟨2220, 2219, cert_8750⟩
  · exact ⟨2220, 2219, cert_8751⟩
  · exact ⟨2220, 2220, cert_8752⟩
  · exact ⟨2221, 2220, cert_8753⟩
  · exact ⟨2221, 2220, cert_8754⟩
  · exact ⟨2221, 2220, cert_8755⟩
  · exact ⟨2221, 2221, cert_8756⟩
  · exact ⟨2222, 2221, cert_8757⟩
  · exact ⟨2222, 2221, cert_8758⟩
  · exact ⟨2222, 2221, cert_8759⟩
  · exact ⟨2222, 2221, cert_8760⟩
  · exact ⟨2222, 2222, cert_8761⟩
  · exact ⟨2223, 2222, cert_8762⟩
  · exact ⟨2223, 2222, cert_8763⟩
  · exact ⟨2223, 2222, cert_8764⟩
  · exact ⟨2223, 2223, cert_8765⟩
  · exact ⟨2224, 2223, cert_8766⟩
  · exact ⟨2224, 2223, cert_8767⟩
  · exact ⟨2224, 2223, cert_8768⟩
  · exact ⟨2224, 2223, cert_8769⟩
  · exact ⟨2224, 2224, cert_8770⟩
  · exact ⟨2225, 2224, cert_8771⟩
  · exact ⟨2225, 2224, cert_8772⟩
  · exact ⟨2225, 2224, cert_8773⟩
  · exact ⟨2225, 2225, cert_8774⟩
  · exact ⟨2226, 2225, cert_8775⟩
  · exact ⟨2226, 2225, cert_8776⟩
  · exact ⟨2226, 2225, cert_8777⟩
  · exact ⟨2226, 2226, cert_8778⟩
  · exact ⟨2226, 2226, cert_8779⟩
  · exact ⟨2227, 2226, cert_8780⟩
  · exact ⟨2227, 2226, cert_8781⟩
  · exact ⟨2227, 2226, cert_8782⟩
  · exact ⟨2227, 2227, cert_8783⟩
  · exact ⟨2228, 2227, cert_8784⟩
  · exact ⟨2228, 2227, cert_8785⟩
  · exact ⟨2228, 2227, cert_8786⟩
  · exact ⟨2228, 2228, cert_8787⟩
  · exact ⟨2229, 2228, cert_8788⟩
  · exact ⟨2229, 2228, cert_8789⟩
  · exact ⟨2229, 2228, cert_8790⟩
  · exact ⟨2229, 2228, cert_8791⟩
  · exact ⟨2229, 2229, cert_8792⟩
  · exact ⟨2230, 2229, cert_8793⟩
  · exact ⟨2230, 2229, cert_8794⟩
  · exact ⟨2230, 2229, cert_8795⟩
  · exact ⟨2230, 2230, cert_8796⟩
  · exact ⟨2231, 2230, cert_8797⟩
  · exact ⟨2231, 2230, cert_8798⟩
  · exact ⟨2231, 2230, cert_8799⟩
  · exact ⟨2231, 2230, cert_8800⟩

theorem no_fixed_digitCount_8701_8800 {n : ℕ} (hn : a n = n)
    (hlo : 8701 ≤ digitCount n) (hhi : digitCount n ≤ 8800) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_8701_8800 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_8701_8800
end OeisA113010
