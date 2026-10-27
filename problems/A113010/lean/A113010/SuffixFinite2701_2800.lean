import A113010.SuffixFiniteNormalizedCore

/-! Generated bounded exclusion certificates; no uniform conclusion. -/
namespace OeisA113010
set_option exponentiation.threshold 2801
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

private theorem cert_2701 : ExponentCertificate 2701 787 787 := by decide
private theorem cert_2702 : ExponentCertificate 2702 788 787 := by decide
private theorem cert_2703 : ExponentCertificate 2703 788 787 := by decide
private theorem cert_2704 : ExponentCertificate 2704 788 787 := by decide
private theorem cert_2705 : ExponentCertificate 2705 788 788 := by decide
private theorem cert_2706 : ExponentCertificate 2706 789 788 := by decide
private theorem cert_2707 : ExponentCertificate 2707 789 788 := by decide
private theorem cert_2708 : ExponentCertificate 2708 789 788 := by decide
private theorem cert_2709 : ExponentCertificate 2709 789 789 := by decide
private theorem cert_2710 : ExponentCertificate 2710 790 789 := by decide
private theorem cert_2711 : ExponentCertificate 2711 790 789 := by decide
private theorem cert_2712 : ExponentCertificate 2712 790 789 := by decide
private theorem cert_2713 : ExponentCertificate 2713 790 790 := by decide
private theorem cert_2714 : ExponentCertificate 2714 791 790 := by decide
private theorem cert_2715 : ExponentCertificate 2715 791 790 := by decide
private theorem cert_2716 : ExponentCertificate 2716 791 790 := by decide
private theorem suffix_2717 : 791 < digitSum ((2717 : ℕ) ^ 791 % 10 ^ 198) := by
  have hmod : (2717 : ℕ) ^ 791 % 10 ^ 198 = 51476104025827367388779891814573116805107060004321287713435315367646932838635742594537016261546152598946879900833657969447889131657420180547887711215881986621350540362438878263425809137855352186133 := by
    have h1 : (2717 : ℕ) ^ 1 % 10 ^ 198 = 2717 := by decide
    have h3 : (2717 : ℕ) ^ 3 % 10 ^ 198 = 20057135813 := by
      have step := pow_mod_double_add_one (k := 2717) (e := 1) (m := 10 ^ 198) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (2717 : ℕ) ^ 6 % 10 ^ 198 = 402288697021127170969 := by
      have step := pow_mod_double (k := 2717) (e := 3) (m := 10 ^ 198) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (2717 : ℕ) ^ 12 % 10 ^ 198 = 161836195750956253161276832139153356398961 := by
      have step := pow_mod_double (k := 2717) (e := 6) (m := 10 ^ 198) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h24 : (2717 : ℕ) ^ 24 % 10 ^ 198 = 26190954255141830810090821872132279586040875199105300290012372940200260285401879521 := by
      have step := pow_mod_double (k := 2717) (e := 12) (m := 10 ^ 198) h12
      have he : 2 * 12 = 24 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h49 : (2717 : ℕ) ^ 49 % 10 ^ 198 = 1863769852387830172116593821048946045130873891442567487644361329986409139785927679923239657856599101733757242255114372001947945024058347465051263661195859942407597711197 := by
      have step := pow_mod_double_add_one (k := 2717) (e := 24) (m := 10 ^ 198) h24
      have he : 2 * 24 + 1 = 49 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h98 : (2717 : ℕ) ^ 98 % 10 ^ 198 = 832559463102696794083939966952635560900572492721054763382005804051179593162931599036791689202138278382634121794763684487798947369542296552105082205868233030252780474032265316748890235321033019172809 := by
      have step := pow_mod_double (k := 2717) (e := 49) (m := 10 ^ 198) h49
      have he : 2 * 49 = 98 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h197 : (2717 : ℕ) ^ 197 % 10 ^ 198 = 793353018695524811845416166477681773674574777698876361211856946969014303910129774719274886188500259856948051619746935793412803617118665237454872714152396311568694605050720325795356173241473650456877 := by
      have step := pow_mod_double_add_one (k := 2717) (e := 98) (m := 10 ^ 198) h98
      have he : 2 * 98 + 1 = 197 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h395 : (2717 : ℕ) ^ 395 % 10 ^ 198 = 199270466435338811203857372863243913985340834987560122332613816944089815356019481705792481445749807540823893973272383916857425559690271330995566540943085839780917564574970871836975441469703023531493 := by
      have step := pow_mod_double_add_one (k := 2717) (e := 197) (m := 10 ^ 198) h197
      have he : 2 * 197 + 1 = 395 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h791 : (2717 : ℕ) ^ 791 % 10 ^ 198 = 51476104025827367388779891814573116805107060004321287713435315367646932838635742594537016261546152598946879900833657969447889131657420180547887711215881986621350540362438878263425809137855352186133 := by
      have step := pow_mod_double_add_one (k := 2717) (e := 395) (m := 10 ^ 198) h395
      have he : 2 * 395 + 1 = 791 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h791
  rw [hmod]
  decide
private theorem cert_2717 : ExponentCertificate 2717 791 791 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2717) (by decide) (by decide) (by decide) suffix_2717
private theorem cert_2718 : ExponentCertificate 2718 792 791 := by decide
private theorem cert_2719 : ExponentCertificate 2719 792 791 := by decide
private theorem cert_2720 : ExponentCertificate 2720 792 791 := by decide
private theorem suffix_2721 : 792 < digitSum ((2721 : ℕ) ^ 792 % 10 ^ 198) := by
  have hmod : (2721 : ℕ) ^ 792 % 10 ^ 198 = 405243972838355072862167831061101635037400485008254310564128653562623913757842662220166250628977424568591712253894146241092375581721794034512149942126567769644009932755162767825193900793132740816641 := by
    have h1 : (2721 : ℕ) ^ 1 % 10 ^ 198 = 2721 := by decide
    have h3 : (2721 : ℕ) ^ 3 % 10 ^ 198 = 20145851361 := by
      have step := pow_mod_double_add_one (k := 2721) (e := 1) (m := 10 ^ 198) h1
      have he : 2 * 1 + 1 = 3 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h6 : (2721 : ℕ) ^ 6 % 10 ^ 198 = 405855327059505552321 := by
      have step := pow_mod_double (k := 2721) (e := 3) (m := 10 ^ 198) h3
      have he : 2 * 3 = 6 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h12 : (2721 : ℕ) ^ 12 % 10 ^ 198 = 164718546502578219794651038691027268487041 := by
      have step := pow_mod_double (k := 2721) (e := 6) (m := 10 ^ 198) h6
      have he : 2 * 6 = 12 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h24 : (2721 : ℕ) ^ 24 % 10 ^ 198 = 27132199561922023484271542353112078958217451770804297576540326189777047505184935681 := by
      have step := pow_mod_double (k := 2721) (e := 12) (m := 10 ^ 198) h12
      have he : 2 * 12 = 24 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h49 : (2721 : ℕ) ^ 49 % 10 ^ 198 = 2003081164597923630799505697660251027618074190509807002195269058740929233220658195025530721667315516093743896414802896601609072635642656486688387040830575456826966763681 := by
      have step := pow_mod_double_add_one (k := 2721) (e := 24) (m := 10 ^ 198) h24
      have he : 2 * 24 + 1 = 49 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h99 : (2721 : ℕ) ^ 99 % 10 ^ 198 = 245696705928533538615775717770425580918924602522624964589704495394310732245783591972577155975085822866796639336935270068573608997074082426882822225255363549945695754717965980661638084978196722419681 := by
      have step := pow_mod_double_add_one (k := 2721) (e := 49) (m := 10 ^ 198) h49
      have he : 2 * 49 + 1 = 99 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h198 : (2721 : ℕ) ^ 198 % 10 ^ 198 = 742342029786086634796535491123698419311711509493059609681050064964950371317684847481187087146700149798645748956992723050850452118345639693778419536533764909387852231948255303989215014441147496141761 := by
      have step := pow_mod_double (k := 2721) (e := 99) (m := 10 ^ 198) h99
      have he : 2 * 99 = 198 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h396 : (2721 : ℕ) ^ 396 % 10 ^ 198 = 256090256123280469924499100777686293189808733575070681710515192224956625352731343883093161688186270384325286385922489964040671317190195222942076232948167415526276575465355651220551453036381008181121 := by
      have step := pow_mod_double (k := 2721) (e := 198) (m := 10 ^ 198) h198
      have he : 2 * 198 = 396 := by decide
      rw [he] at step
      exact step.trans (by decide)
    have h792 : (2721 : ℕ) ^ 792 % 10 ^ 198 = 405243972838355072862167831061101635037400485008254310564128653562623913757842662220166250628977424568591712253894146241092375581721794034512149942126567769644009932755162767825193900793132740816641 := by
      have step := pow_mod_double (k := 2721) (e := 396) (m := 10 ^ 198) h396
      have he : 2 * 396 = 792 := by decide
      rw [he] at step
      exact step.trans (by decide)
    exact h792
  rw [hmod]
  decide
private theorem cert_2721 : ExponentCertificate 2721 792 792 :=
  exponentCertificate_of_normalized_suffix (t := 0) (u := 2721) (by decide) (by decide) (by decide) suffix_2721
private theorem cert_2722 : ExponentCertificate 2722 793 792 := by decide
private theorem cert_2723 : ExponentCertificate 2723 793 792 := by decide
private theorem cert_2724 : ExponentCertificate 2724 793 792 := by decide
private theorem cert_2725 : ExponentCertificate 2725 793 793 := by decide
private theorem cert_2726 : ExponentCertificate 2726 794 793 := by decide
private theorem cert_2727 : ExponentCertificate 2727 794 793 := by decide
private theorem cert_2728 : ExponentCertificate 2728 794 793 := by decide
private theorem cert_2729 : ExponentCertificate 2729 794 794 := by decide
private theorem cert_2730 : ExponentCertificate 2730 795 794 := by decide
private theorem cert_2731 : ExponentCertificate 2731 795 794 := by decide
private theorem cert_2732 : ExponentCertificate 2732 795 794 := by decide
private theorem cert_2733 : ExponentCertificate 2733 795 795 := by decide
private theorem cert_2734 : ExponentCertificate 2734 796 795 := by decide
private theorem cert_2735 : ExponentCertificate 2735 796 795 := by decide
private theorem cert_2736 : ExponentCertificate 2736 796 796 := by decide
private theorem cert_2737 : ExponentCertificate 2737 796 796 := by decide
private theorem cert_2738 : ExponentCertificate 2738 797 796 := by decide
private theorem cert_2739 : ExponentCertificate 2739 797 796 := by decide
private theorem cert_2740 : ExponentCertificate 2740 797 797 := by decide
private theorem cert_2741 : ExponentCertificate 2741 797 797 := by decide
private theorem cert_2742 : ExponentCertificate 2742 798 797 := by decide
private theorem cert_2743 : ExponentCertificate 2743 798 797 := by decide
private theorem cert_2744 : ExponentCertificate 2744 798 798 := by decide
private theorem cert_2745 : ExponentCertificate 2745 799 798 := by decide
private theorem cert_2746 : ExponentCertificate 2746 799 798 := by decide
private theorem cert_2747 : ExponentCertificate 2747 799 798 := by decide
private theorem cert_2748 : ExponentCertificate 2748 799 799 := by decide
private theorem cert_2749 : ExponentCertificate 2749 800 799 := by decide
private theorem cert_2750 : ExponentCertificate 2750 800 799 := by decide
private theorem cert_2751 : ExponentCertificate 2751 800 799 := by decide
private theorem cert_2752 : ExponentCertificate 2752 800 800 := by decide
private theorem cert_2753 : ExponentCertificate 2753 801 800 := by decide
private theorem cert_2754 : ExponentCertificate 2754 801 800 := by decide
private theorem cert_2755 : ExponentCertificate 2755 801 800 := by decide
private theorem cert_2756 : ExponentCertificate 2756 801 801 := by decide
private theorem cert_2757 : ExponentCertificate 2757 802 801 := by decide
private theorem cert_2758 : ExponentCertificate 2758 802 801 := by decide
private theorem cert_2759 : ExponentCertificate 2759 802 801 := by decide
private theorem cert_2760 : ExponentCertificate 2760 802 802 := by decide
private theorem cert_2761 : ExponentCertificate 2761 803 802 := by decide
private theorem cert_2762 : ExponentCertificate 2762 803 802 := by decide
private theorem cert_2763 : ExponentCertificate 2763 803 802 := by decide
private theorem cert_2764 : ExponentCertificate 2764 803 803 := by decide
private theorem cert_2765 : ExponentCertificate 2765 804 803 := by decide
private theorem cert_2766 : ExponentCertificate 2766 804 803 := by decide
private theorem cert_2767 : ExponentCertificate 2767 804 803 := by decide
private theorem cert_2768 : ExponentCertificate 2768 804 804 := by decide
private theorem cert_2769 : ExponentCertificate 2769 805 804 := by decide
private theorem cert_2770 : ExponentCertificate 2770 805 804 := by decide
private theorem cert_2771 : ExponentCertificate 2771 805 804 := by decide
private theorem cert_2772 : ExponentCertificate 2772 805 805 := by decide
private theorem cert_2773 : ExponentCertificate 2773 806 805 := by decide
private theorem cert_2774 : ExponentCertificate 2774 806 805 := by decide
private theorem cert_2775 : ExponentCertificate 2775 806 805 := by decide
private theorem cert_2776 : ExponentCertificate 2776 806 806 := by decide
private theorem cert_2777 : ExponentCertificate 2777 807 806 := by decide
private theorem cert_2778 : ExponentCertificate 2778 807 806 := by decide
private theorem cert_2779 : ExponentCertificate 2779 807 806 := by decide
private theorem cert_2780 : ExponentCertificate 2780 807 807 := by decide
private theorem cert_2781 : ExponentCertificate 2781 808 807 := by decide
private theorem cert_2782 : ExponentCertificate 2782 808 807 := by decide
private theorem cert_2783 : ExponentCertificate 2783 808 807 := by decide
private theorem cert_2784 : ExponentCertificate 2784 808 808 := by decide
private theorem cert_2785 : ExponentCertificate 2785 809 808 := by decide
private theorem cert_2786 : ExponentCertificate 2786 809 808 := by decide
private theorem cert_2787 : ExponentCertificate 2787 809 808 := by decide
private theorem cert_2788 : ExponentCertificate 2788 809 809 := by decide
private theorem cert_2789 : ExponentCertificate 2789 810 809 := by decide
private theorem cert_2790 : ExponentCertificate 2790 810 809 := by decide
private theorem cert_2791 : ExponentCertificate 2791 810 809 := by decide
private theorem cert_2792 : ExponentCertificate 2792 810 810 := by decide
private theorem cert_2793 : ExponentCertificate 2793 811 810 := by decide
private theorem cert_2794 : ExponentCertificate 2794 811 810 := by decide
private theorem cert_2795 : ExponentCertificate 2795 811 810 := by decide
private theorem cert_2796 : ExponentCertificate 2796 811 811 := by decide
private theorem cert_2797 : ExponentCertificate 2797 812 811 := by decide
private theorem cert_2798 : ExponentCertificate 2798 812 811 := by decide
private theorem cert_2799 : ExponentCertificate 2799 812 812 := by decide
private theorem cert_2800 : ExponentCertificate 2800 812 812 := by decide

private theorem certificates_2701_2800 {k : ℕ} (hlo : 2701 ≤ k) (hhi : k ≤ 2800) :
    ∃ lo hi, ExponentCertificate k lo hi := by
  interval_cases k
  · exact ⟨787, 787, cert_2701⟩
  · exact ⟨788, 787, cert_2702⟩
  · exact ⟨788, 787, cert_2703⟩
  · exact ⟨788, 787, cert_2704⟩
  · exact ⟨788, 788, cert_2705⟩
  · exact ⟨789, 788, cert_2706⟩
  · exact ⟨789, 788, cert_2707⟩
  · exact ⟨789, 788, cert_2708⟩
  · exact ⟨789, 789, cert_2709⟩
  · exact ⟨790, 789, cert_2710⟩
  · exact ⟨790, 789, cert_2711⟩
  · exact ⟨790, 789, cert_2712⟩
  · exact ⟨790, 790, cert_2713⟩
  · exact ⟨791, 790, cert_2714⟩
  · exact ⟨791, 790, cert_2715⟩
  · exact ⟨791, 790, cert_2716⟩
  · exact ⟨791, 791, cert_2717⟩
  · exact ⟨792, 791, cert_2718⟩
  · exact ⟨792, 791, cert_2719⟩
  · exact ⟨792, 791, cert_2720⟩
  · exact ⟨792, 792, cert_2721⟩
  · exact ⟨793, 792, cert_2722⟩
  · exact ⟨793, 792, cert_2723⟩
  · exact ⟨793, 792, cert_2724⟩
  · exact ⟨793, 793, cert_2725⟩
  · exact ⟨794, 793, cert_2726⟩
  · exact ⟨794, 793, cert_2727⟩
  · exact ⟨794, 793, cert_2728⟩
  · exact ⟨794, 794, cert_2729⟩
  · exact ⟨795, 794, cert_2730⟩
  · exact ⟨795, 794, cert_2731⟩
  · exact ⟨795, 794, cert_2732⟩
  · exact ⟨795, 795, cert_2733⟩
  · exact ⟨796, 795, cert_2734⟩
  · exact ⟨796, 795, cert_2735⟩
  · exact ⟨796, 796, cert_2736⟩
  · exact ⟨796, 796, cert_2737⟩
  · exact ⟨797, 796, cert_2738⟩
  · exact ⟨797, 796, cert_2739⟩
  · exact ⟨797, 797, cert_2740⟩
  · exact ⟨797, 797, cert_2741⟩
  · exact ⟨798, 797, cert_2742⟩
  · exact ⟨798, 797, cert_2743⟩
  · exact ⟨798, 798, cert_2744⟩
  · exact ⟨799, 798, cert_2745⟩
  · exact ⟨799, 798, cert_2746⟩
  · exact ⟨799, 798, cert_2747⟩
  · exact ⟨799, 799, cert_2748⟩
  · exact ⟨800, 799, cert_2749⟩
  · exact ⟨800, 799, cert_2750⟩
  · exact ⟨800, 799, cert_2751⟩
  · exact ⟨800, 800, cert_2752⟩
  · exact ⟨801, 800, cert_2753⟩
  · exact ⟨801, 800, cert_2754⟩
  · exact ⟨801, 800, cert_2755⟩
  · exact ⟨801, 801, cert_2756⟩
  · exact ⟨802, 801, cert_2757⟩
  · exact ⟨802, 801, cert_2758⟩
  · exact ⟨802, 801, cert_2759⟩
  · exact ⟨802, 802, cert_2760⟩
  · exact ⟨803, 802, cert_2761⟩
  · exact ⟨803, 802, cert_2762⟩
  · exact ⟨803, 802, cert_2763⟩
  · exact ⟨803, 803, cert_2764⟩
  · exact ⟨804, 803, cert_2765⟩
  · exact ⟨804, 803, cert_2766⟩
  · exact ⟨804, 803, cert_2767⟩
  · exact ⟨804, 804, cert_2768⟩
  · exact ⟨805, 804, cert_2769⟩
  · exact ⟨805, 804, cert_2770⟩
  · exact ⟨805, 804, cert_2771⟩
  · exact ⟨805, 805, cert_2772⟩
  · exact ⟨806, 805, cert_2773⟩
  · exact ⟨806, 805, cert_2774⟩
  · exact ⟨806, 805, cert_2775⟩
  · exact ⟨806, 806, cert_2776⟩
  · exact ⟨807, 806, cert_2777⟩
  · exact ⟨807, 806, cert_2778⟩
  · exact ⟨807, 806, cert_2779⟩
  · exact ⟨807, 807, cert_2780⟩
  · exact ⟨808, 807, cert_2781⟩
  · exact ⟨808, 807, cert_2782⟩
  · exact ⟨808, 807, cert_2783⟩
  · exact ⟨808, 808, cert_2784⟩
  · exact ⟨809, 808, cert_2785⟩
  · exact ⟨809, 808, cert_2786⟩
  · exact ⟨809, 808, cert_2787⟩
  · exact ⟨809, 809, cert_2788⟩
  · exact ⟨810, 809, cert_2789⟩
  · exact ⟨810, 809, cert_2790⟩
  · exact ⟨810, 809, cert_2791⟩
  · exact ⟨810, 810, cert_2792⟩
  · exact ⟨811, 810, cert_2793⟩
  · exact ⟨811, 810, cert_2794⟩
  · exact ⟨811, 810, cert_2795⟩
  · exact ⟨811, 811, cert_2796⟩
  · exact ⟨812, 811, cert_2797⟩
  · exact ⟨812, 811, cert_2798⟩
  · exact ⟨812, 812, cert_2799⟩
  · exact ⟨812, 812, cert_2800⟩

theorem no_fixed_digitCount_2701_2800 {n : ℕ} (hn : a n = n)
    (hlo : 2701 ≤ digitCount n) (hhi : digitCount n ≤ 2800) : False := by
  obtain ⟨lo, hi, hc⟩ := certificates_2701_2800 hlo hhi
  exact no_fixed_of_certificate (digitCount_pos (fixed_pos hn)) hc hn rfl

#print axioms no_fixed_digitCount_2701_2800
end OeisA113010
