0.12::indep(s4).
0.10::indep(s10).
0.15::indep(s12).
0.12::indep(s19).
0.12::indep(s23).
0.10::indep(s33).
0.10::indep(s34).
0.10::indep(s36).
0.15::indep(s42).
0.10::indep(s63).
0.10::indep(s66).
0.10::indep(s68).
0.10::indep(s120).
0.10::indep(s_merch).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton_snowboards=Burton_Snowboards unk_brand=Unknown
% @importance 0.70

0.93::acc(s1, brand).
0.80::acc(s12, brand).
0.95::true_val(brand, burton_snowboards); 0.05::true_val(brand, unk_brand).
measured(s1, brand, burton_snowboards).
measured(s12, brand, burton_snowboards).
all_consistent(brand) :- consistent(s1, brand), (indep(s12), consistent(s12, brand) ; \+indep(s12)).
evidence(all_consistent(brand)).
query(true_val(brand, burton_snowboards)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values instigator=Instigator unk_model_name=Unknown
% @importance 0.975

0.95::acc(s1, model_name).
0.85::acc(s4, model_name).
0.95::true_val(model_name, instigator); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, instigator).
measured(s4, model_name, instigator).
all_consistent(model_name) :- consistent(s1, model_name), (indep(s4), consistent(s4, model_name) ; \+indep(s4)).
evidence(all_consistent(model_name)).
query(true_val(model_name, instigator)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025=2025 unk_model_year=Unknown
% @importance 0.975

0.95::acc(s1, model_year).
0.85::acc(s4, model_year).
0.95::true_val(model_year, y2025); 0.05::true_val(model_year, unk_model_year).
measured(s1, model_year, y2025).
measured(s4, model_year, y2025).
all_consistent(model_year) :- consistent(s1, model_year), (indep(s4), consistent(s4, model_year) ; \+indep(s4)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2025)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.975

0.95::acc(s1, product_type).
0.85::acc(s4, product_type).
0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).
measured(s1, product_type, snowboard).
measured(s4, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type), (indep(s4), consistent(s4, product_type) ; \+indep(s4)).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values burton_corp=Burton_Corporation_Burlington_Vermont unk_manufacturer=Unknown
% @importance 0.40

0.82::acc(s12, manufacturer).
0.82::acc(s25, manufacturer).
0.92::true_val(manufacturer, burton_corp); 0.08::true_val(manufacturer, unk_manufacturer).
measured(s12, manufacturer, burton_corp).
measured(s25, manufacturer, burton_corp).
all_consistent(manufacturer) :- (indep(s12), consistent(s12, manufacturer) ; \+indep(s12)), consistent(s25, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_corp)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr burton_founded_year
% @type numeric
% @canonical false
% @original_name Burton founded year
% @values y1977=1977 unk_burton_founded_year=Unknown
% @importance 0.40

0.82::acc(s12, burton_founded_year).
0.90::true_val(burton_founded_year, y1977); 0.10::true_val(burton_founded_year, unk_burton_founded_year).
measured(s12, burton_founded_year, y1977).
all_consistent(burton_founded_year) :- (indep(s12), consistent(s12, burton_founded_year) ; \+indep(s12)).
evidence(all_consistent(burton_founded_year)).
query(true_val(burton_founded_year, y1977)).
query(true_val(burton_founded_year, unk_burton_founded_year)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corp=B_Corp_Certified unk_sustainability_certification=Unknown
% @importance 1.0

0.90::acc(s1, sustainability_certification).
0.85::true_val(sustainability_certification, b_corp); 0.15::true_val(sustainability_certification, unk_sustainability_certification).
measured(s1, sustainability_certification, b_corp).
all_consistent(sustainability_certification) :- consistent(s1, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corp)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr burton_ownership
% @type categorical
% @canonical false
% @original_name Burton ownership
% @values privately_held=Privately_held_Donna_Carpenter_family unk_burton_ownership=Unknown
% @importance 0.40

0.82::acc(s25, burton_ownership).
0.82::acc(s12, burton_ownership).
0.90::true_val(burton_ownership, privately_held); 0.10::true_val(burton_ownership, unk_burton_ownership).
measured(s25, burton_ownership, privately_held).
measured(s12, burton_ownership, privately_held).
all_consistent(burton_ownership) :- consistent(s25, burton_ownership), (indep(s12), consistent(s12, burton_ownership) ; \+indep(s12)).
evidence(all_consistent(burton_ownership)).
query(true_val(burton_ownership, privately_held)).
query(true_val(burton_ownership, unk_burton_ownership)).

% @attr model_first_available_year
% @type numeric
% @canonical false
% @original_name model_first_available_year
% @values y2018=2018 unk_model_first_available_year=Unknown
% @importance 0.55

0.60::acc(s30, model_first_available_year).
0.78::acc(s31, model_first_available_year).
0.85::true_val(model_first_available_year, y2018); 0.15::true_val(model_first_available_year, unk_model_first_available_year).
measured(s30, model_first_available_year, y2018).
measured(s31, model_first_available_year, y2018).
all_consistent(model_first_available_year) :- consistent(s30, model_first_available_year), consistent(s31, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2018)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values flat_top=Flat_Top_flat_between_feet_early_rise purepop_camber=PurePop_Camber_evolution_of_traditional_camber
% @importance 0.90

0.88::acc(s4, camber_type).
0.88::acc(s22, camber_type).
0.87::acc(s19, camber_type).
0.78::acc(s33, camber_type).
0.50::true_val(camber_type, flat_top); 0.50::true_val(camber_type, purepop_camber).
measured(s4, camber_type, flat_top).
measured(s22, camber_type, flat_top).
measured(s19, camber_type, purepop_camber).
measured(s33, camber_type, purepop_camber).
all_consistent(camber_type) :- (indep(s4), consistent(s4, camber_type) ; \+indep(s4)), (indep(s19), consistent(s19, camber_type) ; \+indep(s19)), (indep(s33), consistent(s33, camber_type) ; \+indep(s33)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, flat_top)).
query(true_val(camber_type, purepop_camber)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values flat_profile_stability=Flat_profile_between_feet_stability_balance_early_rise unk_camber_description=Unknown
% @importance 0.90

0.88::acc(s22, camber_description).
0.90::true_val(camber_description, flat_profile_stability); 0.10::true_val(camber_description, unk_camber_description).
measured(s22, camber_description, flat_profile_stability).
all_consistent(camber_description) :- consistent(s22, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_profile_stability)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_purepop
% @type categorical
% @canonical false
% @original_name camber_description
% @values purepop_flat_zones=Subtle_flat_zones_outside_feet_pop_playfulness_early_rise unk_camber_description_purepop=Unknown
% @importance 0.82

0.87::acc(s19, camber_description_purepop).
0.78::acc(s33, camber_description_purepop).
0.90::true_val(camber_description_purepop, purepop_flat_zones); 0.10::true_val(camber_description_purepop, unk_camber_description_purepop).
measured(s19, camber_description_purepop, purepop_flat_zones).
measured(s33, camber_description_purepop, purepop_flat_zones).
all_consistent(camber_description_purepop) :- (indep(s19), consistent(s19, camber_description_purepop) ; \+indep(s19)), (indep(s33), consistent(s33, camber_description_purepop) ; \+indep(s33)).
evidence(all_consistent(camber_description_purepop)).
query(true_val(camber_description_purepop, purepop_flat_zones)).
query(true_val(camber_description_purepop, unk_camber_description_purepop)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.95

0.88::acc(s_merch, width_options).
0.85::true_val(width_options, standard_and_wide); 0.15::true_val(width_options, unk_width_options).
measured(s_merch, width_options, standard_and_wide).
all_consistent(width_options) :- (indep(s_merch), consistent(s_merch, width_options) ; \+indep(s_merch)).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.95::acc(s1, gender).
0.90::true_val(gender, mens); 0.10::true_val(gender, unk_gender).
measured(s1, gender, mens).
all_consistent(gender) :- consistent(s1, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_7=145_150_155_160_155W_160W_165W sizes_8=140_145_150_155_160_155W_160W_165W
% @importance 0.95

0.88::acc(s_merch, available_sizes).
0.78::acc(s6, available_sizes).
0.60::true_val(available_sizes, sizes_7); 0.40::true_val(available_sizes, sizes_8).
measured(s_merch, available_sizes, sizes_7).
measured(s6, available_sizes, sizes_8).
all_consistent(available_sizes) :- (indep(s_merch), consistent(s_merch, available_sizes) ; \+indep(s_merch)), consistent(s6, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_7)).
query(true_val(available_sizes, sizes_8)).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v_neg2_5=-2.5 unk_setback=Unknown
% @importance 0.95

0.90::acc(s_merch, setback).
0.88::true_val(setback, v_neg2_5); 0.12::true_val(setback, unk_setback).
measured(s_merch, setback, v_neg2_5).
all_consistent(setback) :- (indep(s_merch), consistent(s_merch, setback) ; \+indep(s_merch)).
evidence(all_consistent(setback)).
query(true_val(setback, v_neg2_5)).
query(true_val(setback, unk_setback)).

% @attr effective_edge_145
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 145cm
% @values v107_5=107.5 unk_effective_edge_145=Unknown
% @importance 0.95

0.90::acc(s_merch, effective_edge_145).
0.88::true_val(effective_edge_145, v107_5); 0.12::true_val(effective_edge_145, unk_effective_edge_145).
measured(s_merch, effective_edge_145, v107_5).
all_consistent(effective_edge_145) :- (indep(s_merch), consistent(s_merch, effective_edge_145) ; \+indep(s_merch)).
evidence(all_consistent(effective_edge_145)).
query(true_val(effective_edge_145, v107_5)).
query(true_val(effective_edge_145, unk_effective_edge_145)).

% @attr effective_edge_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 150cm
% @values v112_0=112.0 unk_effective_edge_150=Unknown
% @importance 0.95

0.90::acc(s_merch, effective_edge_150).
0.88::true_val(effective_edge_150, v112_0); 0.12::true_val(effective_edge_150, unk_effective_edge_150).
measured(s_merch, effective_edge_150, v112_0).
all_consistent(effective_edge_150) :- (indep(s_merch), consistent(s_merch, effective_edge_150) ; \+indep(s_merch)).
evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v112_0)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

% @attr effective_edge_155
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 155cm
% @values v117_0=117.0 unk_effective_edge_155=Unknown
% @importance 0.95

0.90::acc(s_merch, effective_edge_155).
0.88::true_val(effective_edge_155, v117_0); 0.12::true_val(effective_edge_155, unk_effective_edge_155).
measured(s_merch, effective_edge_155, v117_0).
all_consistent(effective_edge_155) :- (indep(s_merch), consistent(s_merch, effective_edge_155) ; \+indep(s_merch)).
evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v117_0)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

% @attr effective_edge_160
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 160cm
% @values v122_0=122.0 unk_effective_edge_160=Unknown
% @importance 0.95

0.90::acc(s_merch, effective_edge_160).
0.88::true_val(effective_edge_160, v122_0); 0.12::true_val(effective_edge_160, unk_effective_edge_160).
measured(s_merch, effective_edge_160, v122_0).
all_consistent(effective_edge_160) :- (indep(s_merch), consistent(s_merch, effective_edge_160) ; \+indep(s_merch)).
evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v122_0)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

% @attr effective_edge_155w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 155cm Wide
% @values v117_0=117.0 unk_effective_edge_155w=Unknown
% @importance 0.95

0.90::acc(s_merch, effective_edge_155w).
0.88::true_val(effective_edge_155w, v117_0w); 0.12::true_val(effective_edge_155w, unk_effective_edge_155w).
measured(s_merch, effective_edge_155w, v117_0w).
all_consistent(effective_edge_155w) :- (indep(s_merch), consistent(s_merch, effective_edge_155w) ; \+indep(s_merch)).
evidence(all_consistent(effective_edge_155w)).
query(true_val(effective_edge_155w, v117_0w)).
query(true_val(effective_edge_155w, unk_effective_edge_155w)).

% @attr effective_edge_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 160cm Wide
% @values v122_0=122.0 unk_effective_edge_160w=Unknown
% @importance 0.95

0.90::acc(s_merch, effective_edge_160w).
0.88::true_val(effective_edge_160w, v122_0w); 0.12::true_val(effective_edge_160w, unk_effective_edge_160w).
measured(s_merch, effective_edge_160w, v122_0w).
all_consistent(effective_edge_160w) :- (indep(s_merch), consistent(s_merch, effective_edge_160w) ; \+indep(s_merch)).
evidence(all_consistent(effective_edge_160w)).
query(true_val(effective_edge_160w, v122_0w)).
query(true_val(effective_edge_160w, unk_effective_edge_160w)).

% @attr effective_edge_165w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 165cm Wide
% @values v127_0=127.0 unk_effective_edge_165w=Unknown
% @importance 0.95

0.90::acc(s_merch, effective_edge_165w).
0.88::true_val(effective_edge_165w, v127_0); 0.12::true_val(effective_edge_165w, unk_effective_edge_165w).
measured(s_merch, effective_edge_165w, v127_0).
all_consistent(effective_edge_165w) :- (indep(s_merch), consistent(s_merch, effective_edge_165w) ; \+indep(s_merch)).
evidence(all_consistent(effective_edge_165w)).
query(true_val(effective_edge_165w, v127_0)).
query(true_val(effective_edge_165w, unk_effective_edge_165w)).

% @attr sidecut_radius_145
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v6_5=6.5 unk_sidecut_radius_145=Unknown
% @importance 0.95

0.90::acc(s_merch, sidecut_radius_145).
0.88::true_val(sidecut_radius_145, v6_5); 0.12::true_val(sidecut_radius_145, unk_sidecut_radius_145).
measured(s_merch, sidecut_radius_145, v6_5).
all_consistent(sidecut_radius_145) :- (indep(s_merch), consistent(s_merch, sidecut_radius_145) ; \+indep(s_merch)).
evidence(all_consistent(sidecut_radius_145)).
query(true_val(sidecut_radius_145, v6_5)).
query(true_val(sidecut_radius_145, unk_sidecut_radius_145)).

% @attr sidecut_radius_150
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v6_8=6.8 unk_sidecut_radius_150=Unknown
% @importance 0.95

0.90::acc(s_merch, sidecut_radius_150).
0.88::true_val(sidecut_radius_150, v6_8); 0.12::true_val(sidecut_radius_150, unk_sidecut_radius_150).
measured(s_merch, sidecut_radius_150, v6_8).
all_consistent(sidecut_radius_150) :- (indep(s_merch), consistent(s_merch, sidecut_radius_150) ; \+indep(s_merch)).
evidence(all_consistent(sidecut_radius_150)).
query(true_val(sidecut_radius_150, v6_8)).
query(true_val(sidecut_radius_150, unk_sidecut_radius_150)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_1=7.1 unk_sidecut_radius_size=Unknown
% @importance 0.95

0.90::acc(s_merch, sidecut_radius_size).
0.88::true_val(sidecut_radius_size, v7_1); 0.12::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s_merch, sidecut_radius_size, v7_1).
all_consistent(sidecut_radius_size) :- (indep(s_merch), consistent(s_merch, sidecut_radius_size) ; \+indep(s_merch)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_1)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_160
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_4=7.4 unk_sidecut_radius_160=Unknown
% @importance 0.95

0.90::acc(s_merch, sidecut_radius_160).
0.88::true_val(sidecut_radius_160, v7_4); 0.12::true_val(sidecut_radius_160, unk_sidecut_radius_160).
measured(s_merch, sidecut_radius_160, v7_4).
all_consistent(sidecut_radius_160) :- (indep(s_merch), consistent(s_merch, sidecut_radius_160) ; \+indep(s_merch)).
evidence(all_consistent(sidecut_radius_160)).
query(true_val(sidecut_radius_160, v7_4)).
query(true_val(sidecut_radius_160, unk_sidecut_radius_160)).

% @attr sidecut_radius_155w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_1=7.1 unk_sidecut_radius_155w=Unknown
% @importance 0.95

0.90::acc(s_merch, sidecut_radius_155w).
0.88::true_val(sidecut_radius_155w, v7_1w); 0.12::true_val(sidecut_radius_155w, unk_sidecut_radius_155w).
measured(s_merch, sidecut_radius_155w, v7_1w).
all_consistent(sidecut_radius_155w) :- (indep(s_merch), consistent(s_merch, sidecut_radius_155w) ; \+indep(s_merch)).
evidence(all_consistent(sidecut_radius_155w)).
query(true_val(sidecut_radius_155w, v7_1w)).
query(true_val(sidecut_radius_155w, unk_sidecut_radius_155w)).

% @attr sidecut_radius_160w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_4=7.4 unk_sidecut_radius_160w=Unknown
% @importance 0.95

0.90::acc(s_merch, sidecut_radius_160w).
0.88::true_val(sidecut_radius_160w, v7_4w); 0.12::true_val(sidecut_radius_160w, unk_sidecut_radius_160w).
measured(s_merch, sidecut_radius_160w, v7_4w).
all_consistent(sidecut_radius_160w) :- (indep(s_merch), consistent(s_merch, sidecut_radius_160w) ; \+indep(s_merch)).
evidence(all_consistent(sidecut_radius_160w)).
query(true_val(sidecut_radius_160w, v7_4w)).
query(true_val(sidecut_radius_160w, unk_sidecut_radius_160w)).

% @attr sidecut_radius_165
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_165
% @values v7_8=7.8 unk_sidecut_radius_165=Unknown
% @importance 0.95

0.90::acc(s_merch, sidecut_radius_165).
0.88::true_val(sidecut_radius_165, v7_8); 0.12::true_val(sidecut_radius_165, unk_sidecut_radius_165).
measured(s_merch, sidecut_radius_165, v7_8).
all_consistent(sidecut_radius_165) :- (indep(s_merch), consistent(s_merch, sidecut_radius_165) ; \+indep(s_merch)).
evidence(all_consistent(sidecut_radius_165)).
query(true_val(sidecut_radius_165, v7_8)).
query(true_val(sidecut_radius_165, unk_sidecut_radius_165)).

% @attr waist_width_145
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 145cm
% @values v24_5=24.5 unk_waist_width_145=Unknown
% @importance 0.95

0.90::acc(s_merch, waist_width_145).
0.88::true_val(waist_width_145, v24_5); 0.12::true_val(waist_width_145, unk_waist_width_145).
measured(s_merch, waist_width_145, v24_5).
all_consistent(waist_width_145) :- (indep(s_merch), consistent(s_merch, waist_width_145) ; \+indep(s_merch)).
evidence(all_consistent(waist_width_145)).
query(true_val(waist_width_145, v24_5)).
query(true_val(waist_width_145, unk_waist_width_145)).

% @attr waist_width_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 150cm
% @values v24_8=24.8 unk_waist_width_150=Unknown
% @importance 0.95

0.90::acc(s_merch, waist_width_150).
0.88::true_val(waist_width_150, v24_8); 0.12::true_val(waist_width_150, unk_waist_width_150).
measured(s_merch, waist_width_150, v24_8).
all_consistent(waist_width_150) :- (indep(s_merch), consistent(s_merch, waist_width_150) ; \+indep(s_merch)).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v24_8)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr waist_width_155
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 155cm
% @values v25_2=25.2 unk_waist_width_155=Unknown
% @importance 0.95

0.90::acc(s_merch, waist_width_155).
0.88::true_val(waist_width_155, v25_2); 0.12::true_val(waist_width_155, unk_waist_width_155).
measured(s_merch, waist_width_155, v25_2).
all_consistent(waist_width_155) :- (indep(s_merch), consistent(s_merch, waist_width_155) ; \+indep(s_merch)).
evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_2)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr waist_width_160
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 160cm
% @values v25_6=25.6 unk_waist_width_160=Unknown
% @importance 0.95

0.90::acc(s_merch, waist_width_160).
0.88::true_val(waist_width_160, v25_6); 0.12::true_val(waist_width_160, unk_waist_width_160).
measured(s_merch, waist_width_160, v25_6).
all_consistent(waist_width_160) :- (indep(s_merch), consistent(s_merch, waist_width_160) ; \+indep(s_merch)).
evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v25_6)).
query(true_val(waist_width_160, unk_waist_width_160)).

% @attr waist_width_155w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 155cm Wide
% @values v26_0=26.0 unk_waist_width_155w=Unknown
% @importance 0.95

0.90::acc(s_merch, waist_width_155w).
0.88::true_val(waist_width_155w, v26_0); 0.12::true_val(waist_width_155w, unk_waist_width_155w).
measured(s_merch, waist_width_155w, v26_0).
all_consistent(waist_width_155w) :- (indep(s_merch), consistent(s_merch, waist_width_155w) ; \+indep(s_merch)).
evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v26_0)).
query(true_val(waist_width_155w, unk_waist_width_155w)).

% @attr waist_width_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 160cm Wide
% @values v26_5=26.5 unk_waist_width_160w=Unknown
% @importance 0.95

0.90::acc(s_merch, waist_width_160w).
0.88::true_val(waist_width_160w, v26_5); 0.12::true_val(waist_width_160w, unk_waist_width_160w).
measured(s_merch, waist_width_160w, v26_5).
all_consistent(waist_width_160w) :- (indep(s_merch), consistent(s_merch, waist_width_160w) ; \+indep(s_merch)).
evidence(all_consistent(waist_width_160w)).
query(true_val(waist_width_160w, v26_5)).
query(true_val(waist_width_160w, unk_waist_width_160w)).

% @attr waist_width_165
% @type numeric
% @unit cm
% @canonical false
% @original_name waist_width_165
% @values v27_0=27.0 unk_waist_width_165=Unknown
% @importance 0.95

0.90::acc(s_merch, waist_width_165).
0.88::true_val(waist_width_165, v27_0); 0.12::true_val(waist_width_165, unk_waist_width_165).
measured(s_merch, waist_width_165, v27_0).
all_consistent(waist_width_165) :- (indep(s_merch), consistent(s_merch, waist_width_165) ; \+indep(s_merch)).
evidence(all_consistent(waist_width_165)).
query(true_val(waist_width_165, v27_0)).
query(true_val(waist_width_165, unk_waist_width_165)).

% @attr tip_tail_width_size
% @type categorical
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v29_65_29_15=29.65/29.15 unk_tip_tail_width_size=Unknown
% @importance 0.95

0.90::acc(s_merch, tip_tail_width_size).
0.88::true_val(tip_tail_width_size, v29_65_29_15); 0.12::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(s_merch, tip_tail_width_size, v29_65_29_15).
all_consistent(tip_tail_width_size) :- (indep(s_merch), consistent(s_merch, tip_tail_width_size) ; \+indep(s_merch)).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_65_29_15)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 0.95

0.90::acc(s_merch, stance_width_range_size).
0.88::true_val(stance_width_range_size, v56_0); 0.12::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(s_merch, stance_width_range_size, v56_0).
all_consistent(stance_width_range_size) :- (indep(s_merch), consistent(s_merch, stance_width_range_size) ; \+indep(s_merch)).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_145
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w45_68=45-68kg unk_recommended_weight_range_145=Unknown
% @importance 0.95

0.90::acc(s_merch, recommended_weight_range_145).
0.88::true_val(recommended_weight_range_145, w45_68); 0.12::true_val(recommended_weight_range_145, unk_recommended_weight_range_145).
measured(s_merch, recommended_weight_range_145, w45_68).
all_consistent(recommended_weight_range_145) :- (indep(s_merch), consistent(s_merch, recommended_weight_range_145) ; \+indep(s_merch)).
evidence(all_consistent(recommended_weight_range_145)).
query(true_val(recommended_weight_range_145, w45_68)).
query(true_val(recommended_weight_range_145, unk_recommended_weight_range_145)).

% @attr recommended_weight_range_150
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w54_82=54-82kg unk_recommended_weight_range_150=Unknown
% @importance 0.95

0.90::acc(s_merch, recommended_weight_range_150).
0.88::true_val(recommended_weight_range_150, w54_82); 0.12::true_val(recommended_weight_range_150, unk_recommended_weight_range_150).
measured(s_merch, recommended_weight_range_150, w54_82).
all_consistent(recommended_weight_range_150) :- (indep(s_merch), consistent(s_merch, recommended_weight_range_150) ; \+indep(s_merch)).
evidence(all_consistent(recommended_weight_range_150)).
query(true_val(recommended_weight_range_150, w54_82)).
query(true_val(recommended_weight_range_150, unk_recommended_weight_range_150)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values w54_82=54-82kg unk_recommended_weight_range_size=Unknown
% @importance 0.95

0.90::acc(s_merch, recommended_weight_range_size).
0.88::true_val(recommended_weight_range_size, w54_82s); 0.12::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s_merch, recommended_weight_range_size, w54_82s).
all_consistent(recommended_weight_range_size) :- (indep(s_merch), consistent(s_merch, recommended_weight_range_size) ; \+indep(s_merch)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w54_82s)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_160
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w82_118p=82-118+kg unk_recommended_weight_range_160=Unknown
% @importance 0.95

0.90::acc(s_merch, recommended_weight_range_160).
0.88::true_val(recommended_weight_range_160, w82_118p); 0.12::true_val(recommended_weight_range_160, unk_recommended_weight_range_160).
measured(s_merch, recommended_weight_range_160, w82_118p).
all_consistent(recommended_weight_range_160) :- (indep(s_merch), consistent(s_merch, recommended_weight_range_160) ; \+indep(s_merch)).
evidence(all_consistent(recommended_weight_range_160)).
query(true_val(recommended_weight_range_160, w82_118p)).
query(true_val(recommended_weight_range_160, unk_recommended_weight_range_160)).

% @attr recommended_weight_range_155w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w54_82=54-82kg unk_recommended_weight_range_155w=Unknown
% @importance 0.95

0.90::acc(s_merch, recommended_weight_range_155w).
0.88::true_val(recommended_weight_range_155w, w54_82w); 0.12::true_val(recommended_weight_range_155w, unk_recommended_weight_range_155w).
measured(s_merch, recommended_weight_range_155w, w54_82w).
all_consistent(recommended_weight_range_155w) :- (indep(s_merch), consistent(s_merch, recommended_weight_range_155w) ; \+indep(s_merch)).
evidence(all_consistent(recommended_weight_range_155w)).
query(true_val(recommended_weight_range_155w, w54_82w)).
query(true_val(recommended_weight_range_155w, unk_recommended_weight_range_155w)).

% @attr recommended_weight_range_160w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w82_118pw=82-118+kg unk_recommended_weight_range_160w=Unknown
% @importance 0.95

0.90::acc(s_merch, recommended_weight_range_160w).
0.88::true_val(recommended_weight_range_160w, w82_118pw); 0.12::true_val(recommended_weight_range_160w, unk_recommended_weight_range_160w).
measured(s_merch, recommended_weight_range_160w, w82_118pw).
all_consistent(recommended_weight_range_160w) :- (indep(s_merch), consistent(s_merch, recommended_weight_range_160w) ; \+indep(s_merch)).
evidence(all_consistent(recommended_weight_range_160w)).
query(true_val(recommended_weight_range_160w, w82_118pw)).
query(true_val(recommended_weight_range_160w, unk_recommended_weight_range_160w)).

% @attr recommended_weight_165
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_165
% @values w82_118p165=82-118+kg unk_recommended_weight_165=Unknown
% @importance 0.95

0.90::acc(s_merch, recommended_weight_165).
0.88::true_val(recommended_weight_165, w82_118p165); 0.12::true_val(recommended_weight_165, unk_recommended_weight_165).
measured(s_merch, recommended_weight_165, w82_118p165).
all_consistent(recommended_weight_165) :- (indep(s_merch), consistent(s_merch, recommended_weight_165) ; \+indep(s_merch)).
evidence(all_consistent(recommended_weight_165)).
query(true_val(recommended_weight_165, w82_118p165)).
query(true_val(recommended_weight_165, unk_recommended_weight_165)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional=Directional unk_shape=Unknown
% @importance 0.83

0.88::acc(s4, shape).
0.82::acc(s10, shape).
0.95::true_val(shape, directional); 0.05::true_val(shape, unk_shape).
measured(s4, shape, directional).
measured(s10, shape, directional).
all_consistent(shape) :- (indep(s4), consistent(s4, shape) ; \+indep(s4)), (indep(s10), consistent(s10, shape) ; \+indep(s10)).
evidence(all_consistent(shape)).
query(true_val(shape, directional)).
query(true_val(shape, unk_shape)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v5=5.0 unk_taper=Unknown
% @importance 0.95

0.85::acc(s6, taper).
0.80::acc(s23, taper).
0.95::true_val(taper, v5); 0.05::true_val(taper, unk_taper).
measured(s6, taper, v5).
measured(s23, taper, v5).
all_consistent(taper) :- consistent(s6, taper), (indep(s23), consistent(s23, taper) ; \+indep(s23)).
evidence(all_consistent(taper)).
query(true_val(taper, v5)).
query(true_val(taper, unk_taper)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v1_3=1-3 unk_flex_rating_10=Unknown
% @importance 0.95

0.90::acc(s_merch, flex_rating_10).
0.88::true_val(flex_rating_10, v1_3); 0.12::true_val(flex_rating_10, unk_flex_rating_10).
measured(s_merch, flex_rating_10, v1_3).
all_consistent(flex_rating_10) :- (indep(s_merch), consistent(s_merch, flex_rating_10) ; \+indep(s_merch)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v1_3)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical false
% @original_name flex_rating_10_the_good_ride
% @values medium_medium_stiff=Medium_to_medium_stiff unk_flex_rating_10_tgr=Unknown
% @importance 0.925

0.82::acc(s6, flex_rating_10_the_good_ride).
0.78::true_val(flex_rating_10_the_good_ride, medium_medium_stiff); 0.22::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_tgr).
measured(s6, flex_rating_10_the_good_ride, medium_medium_stiff).
all_consistent(flex_rating_10_the_good_ride) :- consistent(s6, flex_rating_10_the_good_ride).
evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium_medium_stiff)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_tgr)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_flex=Twin_Flex_symmetrical unk_flex_direction=Unknown
% @importance 0.93

0.88::acc(s4, flex_direction).
0.88::acc(s22, flex_direction).
0.95::true_val(flex_direction, twin_flex); 0.05::true_val(flex_direction, unk_flex_direction).
measured(s4, flex_direction, twin_flex).
measured(s22, flex_direction, twin_flex).
all_consistent(flex_direction) :- (indep(s4), consistent(s4, flex_direction) ; \+indep(s4)).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 0.85

0.88::acc(s4, board_category).
0.85::acc(s13, board_category).
0.95::true_val(board_category, all_mountain); 0.05::true_val(board_category, unk_board_category).
measured(s4, board_category, all_mountain).
measured(s13, board_category, all_mountain).
all_consistent(board_category) :- (indep(s4), consistent(s4, board_category) ; \+indep(s4)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner=Beginner beginner_intermediate=Beginner_Intermediate
% @importance 0.95

0.88::acc(s_merch, rider_level).
0.85::acc(s4, rider_level).
0.45::true_val(rider_level, beginner); 0.55::true_val(rider_level, beginner_intermediate).
measured(s_merch, rider_level, beginner).
measured(s4, rider_level, beginner_intermediate).
all_consistent(rider_level) :- (indep(s_merch), consistent(s_merch, rider_level) ; \+indep(s_merch)), (indep(s4), consistent(s4, rider_level) ; \+indep(s4)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner)).
query(true_val(rider_level, beginner_intermediate)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_expert=Beginner_Expert beginner_intermediate_rec=Beginner_Intermediate beginner_only=Beginner
% @importance 0.87

0.82::acc(s6, skill_level_recommendation).
0.85::acc(s4, skill_level_recommendation).
0.88::acc(s_merch, skill_level_recommendation).
0.30::true_val(skill_level_recommendation, beginner_expert); 0.40::true_val(skill_level_recommendation, beginner_intermediate_rec); 0.30::true_val(skill_level_recommendation, beginner_only).
measured(s6, skill_level_recommendation, beginner_expert).
measured(s4, skill_level_recommendation, beginner_intermediate_rec).
measured(s_merch, skill_level_recommendation, beginner_only).
all_consistent(skill_level_recommendation) :- consistent(s6, skill_level_recommendation), (indep(s4), consistent(s4, skill_level_recommendation) ; \+indep(s4)), (indep(s_merch), consistent(s_merch, skill_level_recommendation) ; \+indep(s_merch)).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_expert)).
query(true_val(skill_level_recommendation, beginner_intermediate_rec)).
query(true_val(skill_level_recommendation, beginner_only)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_800g=FSC_Certified_Super_Fly_800G_dual_species_wood unk_core_material=Unknown
% @importance 0.88

0.82::acc(s23, core_material).
0.80::acc(s42, core_material).
0.95::true_val(core_material, super_fly_800g); 0.05::true_val(core_material, unk_core_material).
measured(s23, core_material, super_fly_800g).
measured(s42, core_material, super_fly_800g).
all_consistent(core_material) :- (indep(s23), consistent(s23, core_material) ; \+indep(s23)), (indep(s42), consistent(s42, core_material) ; \+indep(s42)).
evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_800g)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_squeezebox
% @type categorical
% @canonical false
% @original_name core_material
% @values squeezebox_low=Squeezebox_Low_thicker_outside_feet_thinner_tip_tail unk_core_material_squeezebox=Unknown
% @importance 0.90

0.82::acc(s23, core_material_squeezebox).
0.88::acc(s_merch, core_material_squeezebox).
0.92::true_val(core_material_squeezebox, squeezebox_low); 0.08::true_val(core_material_squeezebox, unk_core_material_squeezebox).
measured(s23, core_material_squeezebox, squeezebox_low).
measured(s_merch, core_material_squeezebox, squeezebox_low).
all_consistent(core_material_squeezebox) :- (indep(s23), consistent(s23, core_material_squeezebox) ; \+indep(s23)), (indep(s_merch), consistent(s_merch, core_material_squeezebox) ; \+indep(s_merch)).
evidence(all_consistent(core_material_squeezebox)).
query(true_val(core_material_squeezebox, squeezebox_low)).
query(true_val(core_material_squeezebox, unk_core_material_squeezebox)).

% @attr core_material_dualzone
% @type categorical
% @canonical false
% @original_name core_material
% @values dualzone_egd=Dualzone_EGD_wood_grain_heel_toe_edge unk_core_material_dualzone=Unknown
% @importance 0.80

0.82::acc(s10, core_material_dualzone).
0.82::acc(s23, core_material_dualzone).
0.92::true_val(core_material_dualzone, dualzone_egd); 0.08::true_val(core_material_dualzone, unk_core_material_dualzone).
measured(s10, core_material_dualzone, dualzone_egd).
measured(s23, core_material_dualzone, dualzone_egd).
all_consistent(core_material_dualzone) :- (indep(s10), consistent(s10, core_material_dualzone) ; \+indep(s10)), (indep(s23), consistent(s23, core_material_dualzone) ; \+indep(s23)).
evidence(all_consistent(core_material_dualzone)).
query(true_val(core_material_dualzone, dualzone_egd)).
query(true_val(core_material_dualzone, unk_core_material_dualzone)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biax_glass=Biax_Glass_biaxial_fibreglass_torsionally_soft unk_laminate=Unknown
% @importance 0.85

0.80::acc(s42, laminate).
0.80::true_val(laminate, biax_glass); 0.20::true_val(laminate, unk_laminate).
measured(s42, laminate, biax_glass).
all_consistent(laminate) :- (indep(s42), consistent(s42, laminate) ; \+indep(s42)).
evidence(all_consistent(laminate)).
query(true_val(laminate, biax_glass)).
query(true_val(laminate, unk_laminate)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values extruded=Extruded unk_base_material=Unknown
% @importance 0.93

0.85::acc(s6, base_material).
0.80::acc(s42, base_material).
0.95::true_val(base_material, extruded); 0.05::true_val(base_material, unk_base_material).
measured(s6, base_material, extruded).
measured(s42, base_material, extruded).
all_consistent(base_material) :- consistent(s6, base_material), (indep(s42), consistent(s42, base_material) ; \+indep(s42)).
evidence(all_consistent(base_material)).
query(true_val(base_material, extruded)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values low_maintenance=Low_maintenance_speed_strength unk_base_type=Unknown
% @importance 0.95

0.88::acc(s_merch, base_type).
0.85::true_val(base_type, low_maintenance); 0.15::true_val(base_type, unk_base_type).
measured(s_merch, base_type, low_maintenance).
all_consistent(base_type) :- (indep(s_merch), consistent(s_merch, base_type) ; \+indep(s_merch)).
evidence(all_consistent(base_type)).
query(true_val(base_type, low_maintenance)).
query(true_val(base_type, unk_base_type)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based_50pct_less_carbon unk_resin=Unknown
% @importance 0.70

0.80::acc(s36, resin).
0.85::acc(s114, resin).
0.92::true_val(resin, super_sap_epoxy); 0.08::true_val(resin, unk_resin).
measured(s36, resin, super_sap_epoxy).
measured(s114, resin, super_sap_epoxy).
all_consistent(resin) :- (indep(s36), consistent(s36, resin) ; \+indep(s36)), (indep(s114), consistent(s114, resin) ; \+indep(s114)).
evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr construction_material_innovation_protip
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values pro_tip=Pro_Tip_tapered_tip_tail_reduces_swing_weight unk_construction_material_innovation_protip=Unknown
% @importance 0.83

0.82::acc(s23, construction_material_innovation_protip).
0.93::acc(s113, construction_material_innovation_protip).
0.95::true_val(construction_material_innovation_protip, pro_tip); 0.05::true_val(construction_material_innovation_protip, unk_construction_material_innovation_protip).
measured(s23, construction_material_innovation_protip, pro_tip).
measured(s113, construction_material_innovation_protip, pro_tip).
all_consistent(construction_material_innovation_protip) :- (indep(s23), consistent(s23, construction_material_innovation_protip) ; \+indep(s23)), consistent(s113, construction_material_innovation_protip).
evidence(all_consistent(construction_material_innovation_protip)).
query(true_val(construction_material_innovation_protip, pro_tip)).
query(true_val(construction_material_innovation_protip, unk_construction_material_innovation_protip)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges_extend_beneath_bindings unk_edge_technology=Unknown
% @importance 0.80

0.87::acc(s19, edge_technology).
0.93::acc(s113, edge_technology).
0.95::true_val(edge_technology, frostbite_edges); 0.05::true_val(edge_technology, unk_edge_technology).
measured(s19, edge_technology, frostbite_edges).
measured(s113, edge_technology, frostbite_edges).
all_consistent(edge_technology) :- (indep(s19), consistent(s19, edge_technology) ; \+indep(s19)), consistent(s113, edge_technology).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values cruise_control=Cruise_Control_Tune_catch_free_mellower_bevel unk_edge_bevel_spec=Unknown
% @importance 0.83

0.82::acc(s23, edge_bevel_spec).
0.87::acc(s114, edge_bevel_spec).
0.92::true_val(edge_bevel_spec, cruise_control); 0.08::true_val(edge_bevel_spec, unk_edge_bevel_spec).
measured(s23, edge_bevel_spec, cruise_control).
measured(s114, edge_bevel_spec, cruise_control).
all_consistent(edge_bevel_spec) :- (indep(s23), consistent(s23, edge_bevel_spec) ; \+indep(s23)), (indep(s114), consistent(s114, edge_bevel_spec) ; \+indep(s114)).
evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, cruise_control)).
query(true_val(edge_bevel_spec, unk_edge_bevel_spec)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values infinite_ride=Infinite_Ride_overbuilt_machine_broken_in unk_construction_material_innovation=Unknown
% @importance 0.73

0.82::acc(s10, construction_material_innovation).
0.87::acc(s13, construction_material_innovation).
0.92::true_val(construction_material_innovation, infinite_ride); 0.08::true_val(construction_material_innovation, unk_construction_material_innovation).
measured(s10, construction_material_innovation, infinite_ride).
measured(s13, construction_material_innovation, infinite_ride).
all_consistent(construction_material_innovation) :- (indep(s10), consistent(s10, construction_material_innovation) ; \+indep(s10)), (indep(s13), consistent(s13, construction_material_innovation) ; \+indep(s13)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, infinite_ride)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_Mounting_System_all_major_bindings unk_mounting_pattern=Unknown
% @importance 0.83

0.88::acc(s4, mounting_pattern).
0.87::acc(s13, mounting_pattern).
0.75::acc(s17, mounting_pattern).
0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
measured(s4, mounting_pattern, the_channel).
measured(s13, mounting_pattern, the_channel).
measured(s17, mounting_pattern, the_channel).
all_consistent(mounting_pattern) :- (indep(s4), consistent(s4, mounting_pattern) ; \+indep(s4)), consistent(s17, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_major=All_major_brands_ReFlex_EST_disc unk_binding_compatibility=Unknown
% @importance 0.88

0.78::acc(s17, binding_compatibility).
0.88::acc(s4, binding_compatibility).
0.95::true_val(binding_compatibility, all_major); 0.05::true_val(binding_compatibility, unk_binding_compatibility).
measured(s17, binding_compatibility, all_major).
measured(s4, binding_compatibility, all_major).
all_consistent(binding_compatibility) :- consistent(s17, binding_compatibility), (indep(s4), consistent(s4, binding_compatibility) ; \+indep(s4)).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_major)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values five_layer=Five_layer_topsheet_glass_core_glass_base unk_sidewall_material=Unknown
% @importance 0.45

0.72::acc(s120, sidewall_material).
0.65::true_val(sidewall_material, five_layer); 0.35::true_val(sidewall_material, unk_sidewall_material).
measured(s120, sidewall_material, five_layer).
all_consistent(sidewall_material) :- (indep(s120), consistent(s120, sidewall_material) ; \+indep(s120)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, five_layer)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified_core_wood unk_sustainability_certification_fsc=Unknown
% @importance 0.95

0.88::acc(s_merch, sustainability_certification_fsc).
0.88::true_val(sustainability_certification_fsc, fsc_certified); 0.12::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).
measured(s_merch, sustainability_certification_fsc, fsc_certified).
all_consistent(sustainability_certification_fsc) :- (indep(s_merch), consistent(s_merch, sustainability_certification_fsc) ; \+indep(s_merch)).
evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr manufacturing_location_current
% @type categorical
% @canonical false
% @original_name manufacturing_location_current
% @values china=China unk_manufacturing_location_current=Unknown
% @importance 0.95

0.85::acc(s6, manufacturing_location_current).
0.82::true_val(manufacturing_location_current, china); 0.18::true_val(manufacturing_location_current, unk_manufacturing_location_current).
measured(s6, manufacturing_location_current, china).
all_consistent(manufacturing_location_current) :- consistent(s6, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, china)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values china_austria_vermont=China_Austria_Vermont unk_manufacturing_location=Unknown
% @importance 0.50

0.80::acc(s86, manufacturing_location).
0.78::acc(s90, manufacturing_location).
0.88::true_val(manufacturing_location, china_austria_vermont); 0.12::true_val(manufacturing_location, unk_manufacturing_location).
measured(s86, manufacturing_location, china_austria_vermont).
measured(s90, manufacturing_location, china_austria_vermont).
all_consistent(manufacturing_location) :- consistent(s86, manufacturing_location), consistent(s90, manufacturing_location).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, china_austria_vermont)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v629_99=629.99 unk_price_aud_merchant=Unknown
% @importance 0.95

0.88::acc(s_merch, price_aud_merchant).
0.88::true_val(price_aud_merchant, v629_99); 0.12::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s_merch, price_aud_merchant, v629_99).
all_consistent(price_aud_merchant) :- (indep(s_merch), consistent(s_merch, price_aud_merchant) ; \+indep(s_merch)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v629_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v439_95=439.95 v479=479.0
% @importance 0.88

0.85::acc(s23, price_usd_msrp).
0.82::acc(s63, price_usd_msrp).
0.80::acc(s6, price_usd_msrp).
0.72::acc(s17, price_usd_msrp).
0.78::acc(s66, price_usd_msrp).
0.70::true_val(price_usd_msrp, v439_95); 0.30::true_val(price_usd_msrp, v479).
measured(s23, price_usd_msrp, v439_95).
measured(s63, price_usd_msrp, v439_95).
measured(s17, price_usd_msrp, v439_95).
measured(s66, price_usd_msrp, v439_95).
measured(s6, price_usd_msrp, v479).
all_consistent(price_usd_msrp) :- (indep(s23), consistent(s23, price_usd_msrp) ; \+indep(s23)), (indep(s63), consistent(s63, price_usd_msrp) ; \+indep(s63)), consistent(s6, price_usd_msrp), consistent(s17, price_usd_msrp), (indep(s66), consistent(s66, price_usd_msrp) ; \+indep(s66)).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v439_95)).
query(true_val(price_usd_msrp, v479)).

% @attr price_usd_burton_com
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD) at Burton.com US
% @values v459_95=459.95 unk_price_usd_burton_com=Unknown
% @importance 0.95

0.78::acc(s6, price_usd_burton_com).
0.76::true_val(price_usd_burton_com, v459_95); 0.24::true_val(price_usd_burton_com, unk_price_usd_burton_com).
measured(s6, price_usd_burton_com, v459_95).
all_consistent(price_usd_burton_com) :- consistent(s6, price_usd_burton_com).
evidence(all_consistent(price_usd_burton_com)).
query(true_val(price_usd_burton_com, v459_95)).
query(true_val(price_usd_burton_com, unk_price_usd_burton_com)).

% @attr price_usd_eastern_boarder
% @type categorical
% @unit USD
% @canonical false
% @original_name Price (USD) at Eastern Boarder (sale)
% @values sale_351_96=Regular_439_95_sale_351_96 unk_price_usd_eastern_boarder=Unknown
% @importance 0.90

0.82::acc(s23, price_usd_eastern_boarder).
0.82::true_val(price_usd_eastern_boarder, sale_351_96); 0.18::true_val(price_usd_eastern_boarder, unk_price_usd_eastern_boarder).
measured(s23, price_usd_eastern_boarder, sale_351_96).
all_consistent(price_usd_eastern_boarder) :- (indep(s23), consistent(s23, price_usd_eastern_boarder) ; \+indep(s23)).
evidence(all_consistent(price_usd_eastern_boarder)).
query(true_val(price_usd_eastern_boarder, sale_351_96)).
query(true_val(price_usd_eastern_boarder, unk_price_usd_eastern_boarder)).

% @attr price_usd_boardomshop
% @type categorical
% @unit USD
% @canonical false
% @original_name Price (USD) at Boardomshop
% @values sale_346_22=Regular_431_85_sale_346_22_sold_out unk_price_usd_boardomshop=Unknown
% @importance 0.75

0.72::acc(s64, price_usd_boardomshop).
0.65::true_val(price_usd_boardomshop, sale_346_22); 0.35::true_val(price_usd_boardomshop, unk_price_usd_boardomshop).
measured(s64, price_usd_boardomshop, sale_346_22).
all_consistent(price_usd_boardomshop) :- (indep(s64), consistent(s64, price_usd_boardomshop) ; \+indep(s64)).
evidence(all_consistent(price_usd_boardomshop)).
query(true_val(price_usd_boardomshop, sale_346_22)).
query(true_val(price_usd_boardomshop, unk_price_usd_boardomshop)).

% @attr price_usd_aspen
% @type categorical
% @unit USD
% @canonical false
% @original_name Price (USD) at Aspen Ski and Board
% @values sale_263_97=Sale_263_97_MSRP_439_95 unk_price_usd_aspen=Unknown
% @importance 0.90

0.80::acc(s63, price_usd_aspen).
0.78::true_val(price_usd_aspen, sale_263_97); 0.22::true_val(price_usd_aspen, unk_price_usd_aspen).
measured(s63, price_usd_aspen, sale_263_97).
all_consistent(price_usd_aspen) :- (indep(s63), consistent(s63, price_usd_aspen) ; \+indep(s63)).
evidence(all_consistent(price_usd_aspen)).
query(true_val(price_usd_aspen, sale_263_97)).
query(true_val(price_usd_aspen, unk_price_usd_aspen)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v479_95=479.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.95

0.82::acc(s6, price_eur_blue_tomato).
0.78::true_val(price_eur_blue_tomato, v479_95eur); 0.22::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
measured(s6, price_eur_blue_tomato, v479_95eur).
all_consistent(price_eur_blue_tomato) :- consistent(s6, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v479_95eur)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @values v430_00=430.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.95

0.82::acc(s6, price_gbp_blue_tomato_uk).
0.78::true_val(price_gbp_blue_tomato_uk, v430_00); 0.22::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).
measured(s6, price_gbp_blue_tomato_uk, v430_00).
all_consistent(price_gbp_blue_tomato_uk) :- consistent(s6, price_gbp_blue_tomato_uk).
evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v430_00)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_cad_burton_canada
% @type numeric
% @unit CAD
% @canonical false
% @original_name Price (CAD) at Burton Canada
% @values v579_99=579.99 unk_price_cad_burton_canada=Unknown
% @importance 0.95

0.82::acc(s6, price_cad_burton_canada).
0.78::true_val(price_cad_burton_canada, v579_99); 0.22::true_val(price_cad_burton_canada, unk_price_cad_burton_canada).
measured(s6, price_cad_burton_canada, v579_99).
all_consistent(price_cad_burton_canada) :- consistent(s6, price_cad_burton_canada).
evidence(all_consistent(price_cad_burton_canada)).
query(true_val(price_cad_burton_canada, v579_99)).
query(true_val(price_cad_burton_canada, unk_price_cad_burton_canada)).

% @attr price_sek_blue_tomato
% @type numeric
% @unit SEK
% @canonical false
% @original_name Price (SEK) at Blue Tomato Sweden
% @values v5499=5499.0 unk_price_sek_blue_tomato=Unknown
% @importance 0.95

0.82::acc(s6, price_sek_blue_tomato).
0.78::true_val(price_sek_blue_tomato, v5499); 0.22::true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato).
measured(s6, price_sek_blue_tomato, v5499).
all_consistent(price_sek_blue_tomato) :- consistent(s6, price_sek_blue_tomato).
evidence(all_consistent(price_sek_blue_tomato)).
query(true_val(price_sek_blue_tomato, v5499)).
query(true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato)).

% @attr price_dkk_blue_tomato
% @type numeric
% @unit DKK
% @canonical false
% @original_name Price (DKK) at Blue Tomato Denmark
% @values v3599=3599.0 unk_price_dkk_blue_tomato=Unknown
% @importance 0.95

0.82::acc(s6, price_dkk_blue_tomato).
0.78::true_val(price_dkk_blue_tomato, v3599); 0.22::true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato).
measured(s6, price_dkk_blue_tomato, v3599).
all_consistent(price_dkk_blue_tomato) :- consistent(s6, price_dkk_blue_tomato).
evidence(all_consistent(price_dkk_blue_tomato)).
query(true_val(price_dkk_blue_tomato, v3599)).
query(true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato)).

% @attr price_usd_amazon
% @type categorical
% @unit USD
% @canonical false
% @original_name Price (USD) at Amazon
% @values available_purepop=Available_PurePop_Camber_variant unk_price_usd_amazon=Unknown
% @importance 0.85

0.75::acc(s42, price_usd_amazon).
0.72::true_val(price_usd_amazon, available_purepop); 0.28::true_val(price_usd_amazon, unk_price_usd_amazon).
measured(s42, price_usd_amazon, available_purepop).
all_consistent(price_usd_amazon) :- (indep(s42), consistent(s42, price_usd_amazon) ; \+indep(s42)).
evidence(all_consistent(price_usd_amazon)).
query(true_val(price_usd_amazon, available_purepop)).
query(true_val(price_usd_amazon, unk_price_usd_amazon)).

% @attr price_usd_sun_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD) at Sun & Ski Sports
% @values v459_95ss=459.95 unk_price_usd_sun_ski=Unknown
% @importance 0.95

0.78::acc(s6, price_usd_sun_ski).
0.76::true_val(price_usd_sun_ski, v459_95ss); 0.24::true_val(price_usd_sun_ski, unk_price_usd_sun_ski).
measured(s6, price_usd_sun_ski, v459_95ss).
all_consistent(price_usd_sun_ski) :- consistent(s6, price_usd_sun_ski).
evidence(all_consistent(price_usd_sun_ski)).
query(true_val(price_usd_sun_ski, v459_95ss)).
query(true_val(price_usd_sun_ski, unk_price_usd_sun_ski)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v459_95bc=459.95 unk_price_usd_backcountry=Unknown
% @importance 0.95

0.78::acc(s6, price_usd_backcountry).
0.76::true_val(price_usd_backcountry, v459_95bc); 0.24::true_val(price_usd_backcountry, unk_price_usd_backcountry).
measured(s6, price_usd_backcountry, v459_95bc).
all_consistent(price_usd_backcountry) :- consistent(s6, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v459_95bc)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values eu_wide=BE_FR_SE_DK_FI_IT_UK_NL_AT_ES unk_availability_status=Unknown
% @importance 0.95

0.82::acc(s6, availability_status).
0.78::true_val(availability_status, eu_wide); 0.22::true_val(availability_status, unk_availability_status).
measured(s6, availability_status, eu_wide).
all_consistent(availability_status) :- consistent(s6, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, eu_wide)).
query(true_val(availability_status, unk_availability_status)).

% @attr shipping_restriction_au
% @type categorical
% @canonical false
% @original_name Shipping restriction (AU merchant)
% @values au_only=Only_available_within_Australia unk_shipping_restriction_au=Unknown
% @importance 0.95

0.88::acc(s_merch, shipping_restriction_au).
0.85::true_val(shipping_restriction_au, au_only); 0.15::true_val(shipping_restriction_au, unk_shipping_restriction_au).
measured(s_merch, shipping_restriction_au, au_only).
all_consistent(shipping_restriction_au) :- (indep(s_merch), consistent(s_merch, shipping_restriction_au) ; \+indep(s_merch)).
evidence(all_consistent(shipping_restriction_au)).
query(true_val(shipping_restriction_au, au_only)).
query(true_val(shipping_restriction_au, unk_shipping_restriction_au)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty_Channel_mount_original_owner unk_warranty=Unknown
% @importance 0.85

0.80::acc(s42, warranty).
0.78::acc(s68, warranty).
0.93::acc(s74, warranty).
0.97::true_val(warranty, three_year); 0.03::true_val(warranty, unk_warranty).
measured(s42, warranty, three_year).
measured(s68, warranty, three_year).
measured(s74, warranty, three_year).
all_consistent(warranty) :- (indep(s42), consistent(s42, warranty) ; \+indep(s42)), (indep(s68), consistent(s68, warranty) ; \+indep(s68)), consistent(s74, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_processing_time
% @type categorical
% @canonical false
% @original_name warranty
% @values two_business_days=2_business_days_turnaround unk_warranty_processing_time=Unknown
% @importance 0.60

0.92::acc(s76, warranty_processing_time).
0.90::true_val(warranty_processing_time, two_business_days); 0.10::true_val(warranty_processing_time, unk_warranty_processing_time).
measured(s76, warranty_processing_time, two_business_days).
all_consistent(warranty_processing_time) :- consistent(s76, warranty_processing_time).
evidence(all_consistent(warranty_processing_time)).
query(true_val(warranty_processing_time, two_business_days)).
query(true_val(warranty_processing_time, unk_warranty_processing_time)).

% @attr review_rating_merchant
% @type numeric
% @canonical false
% @original_name Review rating (merchant)
% @values v5_0=5.0 unk_review_rating_merchant=Unknown
% @importance 0.95

0.82::acc(s_merch, review_rating_merchant).
0.82::true_val(review_rating_merchant, v5_0); 0.18::true_val(review_rating_merchant, unk_review_rating_merchant).
measured(s_merch, review_rating_merchant, v5_0).
all_consistent(review_rating_merchant) :- (indep(s_merch), consistent(s_merch, review_rating_merchant) ; \+indep(s_merch)).
evidence(all_consistent(review_rating_merchant)).
query(true_val(review_rating_merchant, v5_0)).
query(true_val(review_rating_merchant, unk_review_rating_merchant)).

% @attr review_recommendation_rate
% @type numeric
% @unit percent
% @canonical false
% @original_name Review recommendation rate (merchant)
% @values v100=100.0 unk_review_recommendation_rate=Unknown
% @importance 0.95

0.82::acc(s_merch, review_recommendation_rate).
0.82::true_val(review_recommendation_rate, v100); 0.18::true_val(review_recommendation_rate, unk_review_recommendation_rate).
measured(s_merch, review_recommendation_rate, v100).
all_consistent(review_recommendation_rate) :- (indep(s_merch), consistent(s_merch, review_recommendation_rate) ; \+indep(s_merch)).
evidence(all_consistent(review_recommendation_rate)).
query(true_val(review_recommendation_rate, v100)).
query(true_val(review_recommendation_rate, unk_review_recommendation_rate)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values stable_easy_forgiving=Stable_Easy_Turning_Forgiving_not_Boring unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.85::acc(s6, reviewer_opinion_the_good_ride).
0.80::true_val(reviewer_opinion_the_good_ride, stable_easy_forgiving); 0.20::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s6, reviewer_opinion_the_good_ride, stable_easy_forgiving).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s6, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, stable_easy_forgiving)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values pop_behind_most=Pop_Behind_Most_Burton_Boards unk_negative_aspect=Unknown
% @importance 0.95

0.85::acc(s6, negative_aspect).
0.80::true_val(negative_aspect, pop_behind_most); 0.20::true_val(negative_aspect, unk_negative_aspect).
measured(s6, negative_aspect, pop_behind_most).
all_consistent(negative_aspect) :- consistent(s6, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, pop_behind_most)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values all_mountain_rs=All_Mountain unk_riding_style=Unknown
% @importance 0.95

0.85::acc(s6, riding_style).
0.80::true_val(riding_style, all_mountain_rs); 0.20::true_val(riding_style, unk_riding_style).
measured(s6, riding_style, all_mountain_rs).
all_consistent(riding_style) :- consistent(s6, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mountain_rs)).
query(true_val(riding_style, unk_riding_style)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values good_to_great=Good_to_great_floats_well_with_setback unk_powder_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s6, powder_rating_tgr).
0.80::true_val(powder_rating_tgr, good_to_great); 0.20::true_val(powder_rating_tgr, unk_powder_rating_tgr).
measured(s6, powder_rating_tgr, good_to_great).
all_consistent(powder_rating_tgr) :- consistent(s6, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good_to_great)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values average=Average_nothing_to_write_home_about unk_base_glide_performance=Unknown
% @importance 0.90

0.85::acc(s6, base_glide_performance).
0.80::true_val(base_glide_performance, average); 0.20::true_val(base_glide_performance, unk_base_glide_performance).
measured(s6, base_glide_performance, average).
all_consistent(base_glide_performance) :- consistent(s6, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, average)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values average_carv=Average unk_carving_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s6, carving_rating_tgr).
0.80::true_val(carving_rating_tgr, average_carv); 0.20::true_val(carving_rating_tgr, unk_carving_rating_tgr).
measured(s6, carving_rating_tgr, average_carv).
all_consistent(carving_rating_tgr) :- consistent(s6, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, average_carv)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good_spd=Good unk_speed_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s6, speed_rating_tgr).
0.80::true_val(speed_rating_tgr, good_spd); 0.20::true_val(speed_rating_tgr, unk_speed_rating_tgr).
measured(s6, speed_rating_tgr, good_spd).
all_consistent(speed_rating_tgr) :- consistent(s6, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good_spd)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values great=Great_handles_bumpy_messy_snow unk_chatter_performance=Unknown
% @importance 0.90

0.85::acc(s6, chatter_performance).
0.82::acc(s11, chatter_performance).
0.82::true_val(chatter_performance, great); 0.18::true_val(chatter_performance, unk_chatter_performance).
measured(s6, chatter_performance, great).
measured(s11, chatter_performance, great).
all_consistent(chatter_performance) :- consistent(s6, chatter_performance), consistent(s11, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, great)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values good_sw=Good unk_switch_riding=Unknown
% @importance 0.95

0.85::acc(s6, switch_riding).
0.80::true_val(switch_riding, good_sw); 0.20::true_val(switch_riding, unk_switch_riding).
measured(s6, switch_riding, good_sw).
all_consistent(switch_riding) :- consistent(s6, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, good_sw)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values good_jmp=Good unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s6, jumps_rating_tgr).
0.80::true_val(jumps_rating_tgr, good_jmp); 0.20::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
measured(s6, jumps_rating_tgr, good_jmp).
all_consistent(jumps_rating_tgr) :- consistent(s6, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good_jmp)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average_jib=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s6, jibbing_rating_tgr).
0.80::true_val(jibbing_rating_tgr, average_jib); 0.20::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
measured(s6, jibbing_rating_tgr, average_jib).
all_consistent(jibbing_rating_tgr) :- consistent(s6, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average_jib)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values good_pipe=Good unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s6, pipe_rating_tgr).
0.80::true_val(pipe_rating_tgr, good_pipe); 0.20::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
measured(s6, pipe_rating_tgr, good_pipe).
all_consistent(pipe_rating_tgr) :- consistent(s6, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good_pipe)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values stable_feel=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.85::acc(s6, on_snow_feel_tgr).
0.80::true_val(on_snow_feel_tgr, stable_feel); 0.20::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
measured(s6, on_snow_feel_tgr, stable_feel).
all_consistent(on_snow_feel_tgr) :- consistent(s6, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable_feel)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.85::acc(s6, turn_initiation_performance).
0.80::true_val(turn_initiation_performance, medium_fast); 0.20::true_val(turn_initiation_performance, unk_turn_initiation_performance).
measured(s6, turn_initiation_performance, medium_fast).
all_consistent(turn_initiation_performance) :- consistent(s6, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_tgr_turn_ease
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values semi_easy=Semi_Easy unk_reviewer_opinion_tgr_turn_ease=Unknown
% @importance 0.95

0.85::acc(s6, reviewer_opinion_tgr_turn_ease).
0.80::true_val(reviewer_opinion_tgr_turn_ease, semi_easy); 0.20::true_val(reviewer_opinion_tgr_turn_ease, unk_reviewer_opinion_tgr_turn_ease).
measured(s6, reviewer_opinion_tgr_turn_ease, semi_easy).
all_consistent(reviewer_opinion_tgr_turn_ease) :- consistent(s6, reviewer_opinion_tgr_turn_ease).
evidence(all_consistent(reviewer_opinion_tgr_turn_ease)).
query(true_val(reviewer_opinion_tgr_turn_ease, semi_easy)).
query(true_val(reviewer_opinion_tgr_turn_ease, unk_reviewer_opinion_tgr_turn_ease)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_stiff=Medium_Stiff unk_flex_feel=Unknown
% @importance 0.95

0.85::acc(s6, flex_feel).
0.80::true_val(flex_feel, medium_stiff); 0.20::true_val(flex_feel, unk_flex_feel).
measured(s6, flex_feel, medium_stiff).
all_consistent(flex_feel) :- consistent(s6, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_stiff)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr reviewer_opinion_tgr_responsiveness
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values moderate=Moderate unk_reviewer_opinion_tgr_responsiveness=Unknown
% @importance 0.95

0.85::acc(s6, reviewer_opinion_tgr_responsiveness).
0.80::true_val(reviewer_opinion_tgr_responsiveness, moderate); 0.20::true_val(reviewer_opinion_tgr_responsiveness, unk_reviewer_opinion_tgr_responsiveness).
measured(s6, reviewer_opinion_tgr_responsiveness, moderate).
all_consistent(reviewer_opinion_tgr_responsiveness) :- consistent(s6, reviewer_opinion_tgr_responsiveness).
evidence(all_consistent(reviewer_opinion_tgr_responsiveness)).
query(true_val(reviewer_opinion_tgr_responsiveness, moderate)).
query(true_val(reviewer_opinion_tgr_responsiveness, unk_reviewer_opinion_tgr_responsiveness)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values surprisingly_excellent=Surprisingly_excellent_hard_snow_grip unk_edge_hold=Unknown
% @importance 0.90

0.85::acc(s6, edge_hold).
0.82::acc(s11, edge_hold).
0.82::true_val(edge_hold, surprisingly_excellent); 0.18::true_val(edge_hold, unk_edge_hold).
measured(s6, edge_hold, surprisingly_excellent).
measured(s11, edge_hold, surprisingly_excellent).
all_consistent(edge_hold) :- consistent(s6, edge_hold), consistent(s11, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, surprisingly_excellent)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values vs_jones_capita=Held_own_vs_Jones_Mountain_Twin_better_than_Capita_Mercury unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.82::acc(s11, comparable_board_cross_brand).
0.78::true_val(comparable_board_cross_brand, vs_jones_capita); 0.22::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s11, comparable_board_cross_brand, vs_jones_capita).
all_consistent(comparable_board_cross_brand) :- consistent(s11, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, vs_jones_capita)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr reviewer_opinion_tgr_unloading
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values very_easy_off_lift=Very_easy_off_the_chair_lift unk_reviewer_opinion_tgr_unloading=Unknown
% @importance 0.85

0.82::acc(s11, reviewer_opinion_tgr_unloading).
0.78::true_val(reviewer_opinion_tgr_unloading, very_easy_off_lift); 0.22::true_val(reviewer_opinion_tgr_unloading, unk_reviewer_opinion_tgr_unloading).
measured(s11, reviewer_opinion_tgr_unloading, very_easy_off_lift).
all_consistent(reviewer_opinion_tgr_unloading) :- consistent(s11, reviewer_opinion_tgr_unloading).
evidence(all_consistent(reviewer_opinion_tgr_unloading)).
query(true_val(reviewer_opinion_tgr_unloading, very_easy_off_lift)).
query(true_val(reviewer_opinion_tgr_unloading, unk_reviewer_opinion_tgr_unloading)).

% @attr reviewer_opinion_tgr_tracking
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values tracks_straight=Tracks_straight_easy_no_auto_spin unk_reviewer_opinion_tgr_tracking=Unknown
% @importance 0.85

0.82::acc(s11, reviewer_opinion_tgr_tracking).
0.78::true_val(reviewer_opinion_tgr_tracking, tracks_straight); 0.22::true_val(reviewer_opinion_tgr_tracking, unk_reviewer_opinion_tgr_tracking).
measured(s11, reviewer_opinion_tgr_tracking, tracks_straight).
all_consistent(reviewer_opinion_tgr_tracking) :- consistent(s11, reviewer_opinion_tgr_tracking).
evidence(all_consistent(reviewer_opinion_tgr_tracking)).
query(true_val(reviewer_opinion_tgr_tracking, tracks_straight)).
query(true_val(reviewer_opinion_tgr_tracking, unk_reviewer_opinion_tgr_tracking)).

% @attr reviewer_opinion_tgr_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values normal_heavy_side=Pretty_normal_bordering_heavy_side unk_reviewer_opinion_tgr_weight=Unknown
% @importance 0.85

0.82::acc(s11, reviewer_opinion_tgr_weight).
0.78::true_val(reviewer_opinion_tgr_weight, normal_heavy_side); 0.22::true_val(reviewer_opinion_tgr_weight, unk_reviewer_opinion_tgr_weight).
measured(s11, reviewer_opinion_tgr_weight, normal_heavy_side).
all_consistent(reviewer_opinion_tgr_weight) :- consistent(s11, reviewer_opinion_tgr_weight).
evidence(all_consistent(reviewer_opinion_tgr_weight)).
query(true_val(reviewer_opinion_tgr_weight, normal_heavy_side)).
query(true_val(reviewer_opinion_tgr_weight, unk_reviewer_opinion_tgr_weight)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values whitelines_100=Selected_Whitelines_100_Best_2021_22 unk_reviewer_opinion_whitelines=Unknown
% @importance 0.85

0.82::acc(s46, reviewer_opinion_whitelines).
0.80::true_val(reviewer_opinion_whitelines, whitelines_100); 0.20::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).
measured(s46, reviewer_opinion_whitelines, whitelines_100).
all_consistent(reviewer_opinion_whitelines) :- consistent(s46, reviewer_opinion_whitelines).
evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, whitelines_100)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_longevity
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values lasts_beyond_first_week=Beginner_board_lasts_beyond_first_week unk_reviewer_opinion_whitelines_longevity=Unknown
% @importance 0.85

0.82::acc(s46, reviewer_opinion_whitelines_longevity).
0.80::true_val(reviewer_opinion_whitelines_longevity, lasts_beyond_first_week); 0.20::true_val(reviewer_opinion_whitelines_longevity, unk_reviewer_opinion_whitelines_longevity).
measured(s46, reviewer_opinion_whitelines_longevity, lasts_beyond_first_week).
all_consistent(reviewer_opinion_whitelines_longevity) :- consistent(s46, reviewer_opinion_whitelines_longevity).
evidence(all_consistent(reviewer_opinion_whitelines_longevity)).
query(true_val(reviewer_opinion_whitelines_longevity, lasts_beyond_first_week)).
query(true_val(reviewer_opinion_whitelines_longevity, unk_reviewer_opinion_whitelines_longevity)).

% @attr reviewer_opinion_whitelines_expert_limit
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values too_soft_mellow_for_expert=Not_for_experts_too_soft_too_mellow unk_reviewer_opinion_whitelines_expert_limit=Unknown
% @importance 0.85

0.82::acc(s46, reviewer_opinion_whitelines_expert_limit).
0.80::true_val(reviewer_opinion_whitelines_expert_limit, too_soft_mellow_for_expert); 0.20::true_val(reviewer_opinion_whitelines_expert_limit, unk_reviewer_opinion_whitelines_expert_limit).
measured(s46, reviewer_opinion_whitelines_expert_limit, too_soft_mellow_for_expert).
all_consistent(reviewer_opinion_whitelines_expert_limit) :- consistent(s46, reviewer_opinion_whitelines_expert_limit).
evidence(all_consistent(reviewer_opinion_whitelines_expert_limit)).
query(true_val(reviewer_opinion_whitelines_expert_limit, too_soft_mellow_for_expert)).
query(true_val(reviewer_opinion_whitelines_expert_limit, unk_reviewer_opinion_whitelines_expert_limit)).

% @attr reviewer_opinion_whitelines_base
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values missing_sintered_base=Only_thing_missing_sintered_base unk_reviewer_opinion_whitelines_base=Unknown
% @importance 0.70

0.78::acc(s48, reviewer_opinion_whitelines_base).
0.75::true_val(reviewer_opinion_whitelines_base, missing_sintered_base); 0.25::true_val(reviewer_opinion_whitelines_base, unk_reviewer_opinion_whitelines_base).
measured(s48, reviewer_opinion_whitelines_base, missing_sintered_base).
all_consistent(reviewer_opinion_whitelines_base) :- consistent(s48, reviewer_opinion_whitelines_base).
evidence(all_consistent(reviewer_opinion_whitelines_base)).
query(true_val(reviewer_opinion_whitelines_base, missing_sintered_base)).
query(true_val(reviewer_opinion_whitelines_base, unk_reviewer_opinion_whitelines_base)).

% @attr reviewer_opinion_whitelines_setback
% @type numeric
% @unit mm
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values v25mm=25.0 unk_reviewer_opinion_whitelines_setback=Unknown
% @importance 0.85

0.80::acc(s46, reviewer_opinion_whitelines_setback).
0.78::true_val(reviewer_opinion_whitelines_setback, v25mm); 0.22::true_val(reviewer_opinion_whitelines_setback, unk_reviewer_opinion_whitelines_setback).
measured(s46, reviewer_opinion_whitelines_setback, v25mm).
all_consistent(reviewer_opinion_whitelines_setback) :- consistent(s46, reviewer_opinion_whitelines_setback).
evidence(all_consistent(reviewer_opinion_whitelines_setback)).
query(true_val(reviewer_opinion_whitelines_setback, v25mm)).
query(true_val(reviewer_opinion_whitelines_setback, unk_reviewer_opinion_whitelines_setback)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values consistently_ranked_top_beginner=Consistently_ranked_top_beginner_lists unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.70

0.78::acc(s109, reviewer_opinion_snowboardingprofiles).
0.75::true_val(reviewer_opinion_snowboardingprofiles, consistently_ranked_top_beginner); 0.25::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
measured(s109, reviewer_opinion_snowboardingprofiles, consistently_ranked_top_beginner).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s109, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, consistently_ranked_top_beginner)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr snowboarding_days_review
% @type categorical
% @canonical false
% @original_name Snowboarding Days review
% @values forgiving_flat_top_buttery=Forgiving_flat_top_mellow_directional_twin_buttery_flex unk_snowboarding_days_review=Unknown
% @importance 0.80

0.78::acc(s105, snowboarding_days_review).
0.75::true_val(snowboarding_days_review, forgiving_flat_top_buttery); 0.25::true_val(snowboarding_days_review, unk_snowboarding_days_review).
measured(s105, snowboarding_days_review, forgiving_flat_top_buttery).
all_consistent(snowboarding_days_review) :- consistent(s105, snowboarding_days_review).
evidence(all_consistent(snowboarding_days_review)).
query(true_val(snowboarding_days_review, forgiving_flat_top_buttery)).
query(true_val(snowboarding_days_review, unk_snowboarding_days_review)).

% @attr snowboarding_days_ft_vs_pp
% @type categorical
% @canonical false
% @original_name Snowboarding Days Flat Top vs PurePop Camber
% @values flat_top_better_beginner=PurePop_poppier_less_forgiving_Flat_Top_better_beginners unk_snowboarding_days_ft_vs_pp=Unknown
% @importance 0.80

0.78::acc(s105, snowboarding_days_ft_vs_pp).
0.75::true_val(snowboarding_days_ft_vs_pp, flat_top_better_beginner); 0.25::true_val(snowboarding_days_ft_vs_pp, unk_snowboarding_days_ft_vs_pp).
measured(s105, snowboarding_days_ft_vs_pp, flat_top_better_beginner).
all_consistent(snowboarding_days_ft_vs_pp) :- consistent(s105, snowboarding_days_ft_vs_pp).
evidence(all_consistent(snowboarding_days_ft_vs_pp)).
query(true_val(snowboarding_days_ft_vs_pp, flat_top_better_beginner)).
query(true_val(snowboarding_days_ft_vs_pp, unk_snowboarding_days_ft_vs_pp)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values good_beginner_outgrow_fast=Good_for_beginners_may_outgrow_past_low_intermediate unk_user_review_forum=Unknown
% @importance 0.70

0.55::acc(s43, user_review_forum).
0.50::true_val(user_review_forum, good_beginner_outgrow_fast); 0.50::true_val(user_review_forum, unk_user_review_forum).
measured(s43, user_review_forum, good_beginner_outgrow_fast).
all_consistent(user_review_forum) :- consistent(s43, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, good_beginner_outgrow_fast)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_control
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values flexible_melts_bumps=Very_flexible_melts_to_bumps_great_control unk_user_review_forum_control=Unknown
% @importance 0.70

0.55::acc(s44, user_review_forum_control).
0.50::true_val(user_review_forum_control, flexible_melts_bumps); 0.50::true_val(user_review_forum_control, unk_user_review_forum_control).
measured(s44, user_review_forum_control, flexible_melts_bumps).
all_consistent(user_review_forum_control) :- consistent(s44, user_review_forum_control).
evidence(all_consistent(user_review_forum_control)).
query(true_val(user_review_forum_control, flexible_melts_bumps)).
query(true_val(user_review_forum_control, unk_user_review_forum_control)).

% @attr user_review_forum_vs_custom
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values beginner_board_very_soft=More_beginner_board_very_soft_vs_Burton_Custom unk_user_review_forum_vs_custom=Unknown
% @importance 0.70

0.55::acc(s44, user_review_forum_vs_custom).
0.50::true_val(user_review_forum_vs_custom, beginner_board_very_soft); 0.50::true_val(user_review_forum_vs_custom, unk_user_review_forum_vs_custom).
measured(s44, user_review_forum_vs_custom, beginner_board_very_soft).
all_consistent(user_review_forum_vs_custom) :- consistent(s44, user_review_forum_vs_custom).
evidence(all_consistent(user_review_forum_vs_custom)).
query(true_val(user_review_forum_vs_custom, beginner_board_very_soft)).
query(true_val(user_review_forum_vs_custom, unk_user_review_forum_vs_custom)).

% @attr comparable_board_yes_typo
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values yes_typo=Yes_Typo_more_advanced_alternative unk_comparable_board_yes_typo=Unknown
% @importance 0.70

0.55::acc(s43, comparable_board_yes_typo).
0.50::true_val(comparable_board_yes_typo, yes_typo); 0.50::true_val(comparable_board_yes_typo, unk_comparable_board_yes_typo).
measured(s43, comparable_board_yes_typo, yes_typo).
all_consistent(comparable_board_yes_typo) :- consistent(s43, comparable_board_yes_typo).
evidence(all_consistent(comparable_board_yes_typo)).
query(true_val(comparable_board_yes_typo, yes_typo)).
query(true_val(comparable_board_yes_typo, unk_comparable_board_yes_typo)).

% @attr comparable_board_arbor_capita
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values arbor_capita=Arbor_Foundation_Capita_Pathfinder_flat_to_rocker unk_comparable_board_arbor_capita=Unknown
% @importance 0.55

0.50::acc(s52, comparable_board_arbor_capita).
0.45::true_val(comparable_board_arbor_capita, arbor_capita); 0.55::true_val(comparable_board_arbor_capita, unk_comparable_board_arbor_capita).
measured(s52, comparable_board_arbor_capita, arbor_capita).
all_consistent(comparable_board_arbor_capita) :- consistent(s52, comparable_board_arbor_capita).
evidence(all_consistent(comparable_board_arbor_capita)).
query(true_val(comparable_board_arbor_capita, arbor_capita)).
query(true_val(comparable_board_arbor_capita, unk_comparable_board_arbor_capita)).

% @attr comparable_board_k2_standard
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values k2_standard=K2_Standard_flat_to_rocker_soft_catch_free unk_comparable_board_k2_standard=Unknown
% @importance 0.73

0.78::acc(s105, comparable_board_k2_standard).
0.72::true_val(comparable_board_k2_standard, k2_standard); 0.28::true_val(comparable_board_k2_standard, unk_comparable_board_k2_standard).
measured(s105, comparable_board_k2_standard, k2_standard).
all_consistent(comparable_board_k2_standard) :- consistent(s105, comparable_board_k2_standard).
evidence(all_consistent(comparable_board_k2_standard)).
query(true_val(comparable_board_k2_standard, k2_standard)).
query(true_val(comparable_board_k2_standard, unk_comparable_board_k2_standard)).

% @attr comparable_board_nitro_prime
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values nitro_prime=Nitro_Prime_entry_level_budget unk_comparable_board_nitro_prime=Unknown
% @importance 0.70

0.72::acc(s103, comparable_board_nitro_prime).
0.68::true_val(comparable_board_nitro_prime, nitro_prime); 0.32::true_val(comparable_board_nitro_prime, unk_comparable_board_nitro_prime).
measured(s103, comparable_board_nitro_prime, nitro_prime).
all_consistent(comparable_board_nitro_prime) :- consistent(s103, comparable_board_nitro_prime).
evidence(all_consistent(comparable_board_nitro_prime)).
query(true_val(comparable_board_nitro_prime, nitro_prime)).
query(true_val(comparable_board_nitro_prime, unk_comparable_board_nitro_prime)).

% @attr comparable_board_rossignol_evader
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values rossignol_evader=Rossignol_Evader_affordable_friendly_camber unk_comparable_board_rossignol_evader=Unknown
% @importance 0.70

0.72::acc(s103, comparable_board_rossignol_evader).
0.68::true_val(comparable_board_rossignol_evader, rossignol_evader); 0.32::true_val(comparable_board_rossignol_evader, unk_comparable_board_rossignol_evader).
measured(s103, comparable_board_rossignol_evader, rossignol_evader).
all_consistent(comparable_board_rossignol_evader) :- consistent(s103, comparable_board_rossignol_evader).
evidence(all_consistent(comparable_board_rossignol_evader)).
query(true_val(comparable_board_rossignol_evader, rossignol_evader)).
query(true_val(comparable_board_rossignol_evader, unk_comparable_board_rossignol_evader)).

% @attr comparable_board_nidecker_play
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values nidecker_play=Nidecker_Play_flat_to_rocker_friendly_price unk_comparable_board_nidecker_play=Unknown
% @importance 0.70

0.72::acc(s103, comparable_board_nidecker_play).
0.68::true_val(comparable_board_nidecker_play, nidecker_play); 0.32::true_val(comparable_board_nidecker_play, unk_comparable_board_nidecker_play).
measured(s103, comparable_board_nidecker_play, nidecker_play).
all_consistent(comparable_board_nidecker_play) :- consistent(s103, comparable_board_nidecker_play).
evidence(all_consistent(comparable_board_nidecker_play)).
query(true_val(comparable_board_nidecker_play, nidecker_play)).
query(true_val(comparable_board_nidecker_play, unk_comparable_board_nidecker_play)).

% @attr comparable_board_arbor_foundation
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values arbor_foundation=Arbor_Foundation_flat_to_rocker_convex_base unk_comparable_board_arbor_foundation=Unknown
% @importance 0.63

0.65::acc(s52, comparable_board_arbor_foundation).
0.72::acc(s109, comparable_board_arbor_foundation).
0.70::true_val(comparable_board_arbor_foundation, arbor_foundation); 0.30::true_val(comparable_board_arbor_foundation, unk_comparable_board_arbor_foundation).
measured(s52, comparable_board_arbor_foundation, arbor_foundation).
measured(s109, comparable_board_arbor_foundation, arbor_foundation).
all_consistent(comparable_board_arbor_foundation) :- consistent(s52, comparable_board_arbor_foundation), consistent(s109, comparable_board_arbor_foundation).
evidence(all_consistent(comparable_board_arbor_foundation)).
query(true_val(comparable_board_arbor_foundation, arbor_foundation)).
query(true_val(comparable_board_arbor_foundation, unk_comparable_board_arbor_foundation)).

% @attr comparable_board_rome_mechanic
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values rome_mechanic=Rome_Mechanic_soft_loose_easy unk_comparable_board_rome_mechanic=Unknown
% @importance 0.65

0.75::acc(s104, comparable_board_rome_mechanic).
0.70::true_val(comparable_board_rome_mechanic, rome_mechanic); 0.30::true_val(comparable_board_rome_mechanic, unk_comparable_board_rome_mechanic).
measured(s104, comparable_board_rome_mechanic, rome_mechanic).
all_consistent(comparable_board_rome_mechanic) :- consistent(s104, comparable_board_rome_mechanic).
evidence(all_consistent(comparable_board_rome_mechanic)).
query(true_val(comparable_board_rome_mechanic, rome_mechanic)).
query(true_val(comparable_board_rome_mechanic, unk_comparable_board_rome_mechanic)).

% @attr comparable_board_salomon_sight
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values salomon_sight=Salomon_Sight_directional_rocker_taper unk_comparable_board_salomon_sight=Unknown
% @importance 0.80

0.78::acc(s105, comparable_board_salomon_sight).
0.72::true_val(comparable_board_salomon_sight, salomon_sight); 0.28::true_val(comparable_board_salomon_sight, unk_comparable_board_salomon_sight).
measured(s105, comparable_board_salomon_sight, salomon_sight).
all_consistent(comparable_board_salomon_sight) :- consistent(s105, comparable_board_salomon_sight).
evidence(all_consistent(comparable_board_salomon_sight)).
query(true_val(comparable_board_salomon_sight, salomon_sight)).
query(true_val(comparable_board_salomon_sight, unk_comparable_board_salomon_sight)).

% @attr comparable_board_extended_list
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values extended_list=Lib_Tech_LQK_Yes_PYL_Burton_FA_Jones_Flagship_MT_Capita_Mercury unk_comparable_board_extended_list=Unknown
% @importance 0.95

0.82::acc(s6, comparable_board_extended_list).
0.78::true_val(comparable_board_extended_list, extended_list); 0.22::true_val(comparable_board_extended_list, unk_comparable_board_extended_list).
measured(s6, comparable_board_extended_list, extended_list).
all_consistent(comparable_board_extended_list) :- consistent(s6, comparable_board_extended_list).
evidence(all_consistent(comparable_board_extended_list)).
query(true_val(comparable_board_extended_list, extended_list)).
query(true_val(comparable_board_extended_list, unk_comparable_board_extended_list)).

% @attr sustainability_certification_carbon
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values carbon_50pct_reduction=Reduces_carbon_footprint_50pct_per_board unk_sustainability_certification_carbon=Unknown
% @importance 0.70

0.80::acc(s36, sustainability_certification_carbon).
0.87::acc(s114, sustainability_certification_carbon).
0.88::true_val(sustainability_certification_carbon, carbon_50pct_reduction); 0.12::true_val(sustainability_certification_carbon, unk_sustainability_certification_carbon).
measured(s36, sustainability_certification_carbon, carbon_50pct_reduction).
measured(s114, sustainability_certification_carbon, carbon_50pct_reduction).
all_consistent(sustainability_certification_carbon) :- (indep(s36), consistent(s36, sustainability_certification_carbon) ; \+indep(s36)), (indep(s114), consistent(s114, sustainability_certification_carbon) ; \+indep(s114)).
evidence(all_consistent(sustainability_certification_carbon)).
query(true_val(sustainability_certification_carbon, carbon_50pct_reduction)).
query(true_val(sustainability_certification_carbon, unk_sustainability_certification_carbon)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values bold_lines_fleetingness=Bold_lines_fleetingness_of_life_soft_light_tones unk_topsheet_appearance_description=Unknown
% @importance 0.45

0.72::acc(s120, topsheet_appearance_description).
0.62::true_val(topsheet_appearance_description, bold_lines_fleetingness); 0.38::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).
measured(s120, topsheet_appearance_description, bold_lines_fleetingness).
all_consistent(topsheet_appearance_description) :- (indep(s120), consistent(s120, topsheet_appearance_description) ; \+indep(s120)).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, bold_lines_fleetingness)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).