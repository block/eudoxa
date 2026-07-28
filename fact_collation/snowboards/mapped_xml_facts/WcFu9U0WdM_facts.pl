0.20::indep(s3).
0.15::indep(s9).
0.20::indep(s10).
0.15::indep(s12).
0.12::indep(s13).
0.12::indep(s32).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.93::acc(s1, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nitro=Nitro unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, nitro); 0.05::true_val(brand, unk_brand).

measured(s1, brand, nitro).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, nitro)).
query(true_val(brand, unk_brand)).

0.93::acc(s1, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values phase=Phase unk_model_name=Unknown
% @importance 1.0

0.95::true_val(model_name, phase); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, phase).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, phase)).
query(true_val(model_name, unk_model_name)).

0.93::acc(s1, model_year).
0.55::acc(s2, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values season_2026_27=2027_Season_2026_27 unk_model_year=Unknown
% @importance 0.85

0.95::true_val(model_year, season_2026_27); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, season_2026_27).
measured(s2, model_year, season_2026_27).

all_consistent(model_year) :- consistent(s1, model_year), consistent(s2, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, season_2026_27)).
query(true_val(model_year, unk_model_year)).

0.93::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.58::acc(s2, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.7

0.80::true_val(gender, mens); 0.20::true_val(gender, unk_gender).

measured(s2, gender, mens).

all_consistent(gender) :- consistent(s2, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.93::acc(s1, board_category).
0.68::acc(s3, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain all_mountain_freeride=All_Mountain_Freeride
% @importance 0.975

0.70::true_val(board_category, all_mountain); 0.30::true_val(board_category, all_mountain_freeride).

measured(s1, board_category, all_mountain).
measured(s3, board_category, all_mountain_freeride).

all_consistent(board_category) :-
    consistent(s1, board_category),
    (indep(s3), consistent(s3, board_category) ; \+indep(s3)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, all_mountain_freeride)).

0.93::acc(s4, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values nitro_ag_hunenberg=Nitro_AG_Hunenberg_Switzerland unk_manufacturer=Unknown
% @importance 0.95

0.90::true_val(manufacturer, nitro_ag_hunenberg); 0.10::true_val(manufacturer, unk_manufacturer).

measured(s4, manufacturer, nitro_ag_hunenberg).

all_consistent(manufacturer) :- consistent(s4, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, nitro_ag_hunenberg)).
query(true_val(manufacturer, unk_manufacturer)).

0.93::acc(s4, eu_representative).

% @attr eu_representative
% @type categorical
% @canonical false
% @original_name EU representative
% @values nitro_italia_arco=Nitro_Distribution_Italia_Arco_TN unk_eu_representative=Unknown
% @importance 0.95

0.90::true_val(eu_representative, nitro_italia_arco); 0.10::true_val(eu_representative, unk_eu_representative).

measured(s4, eu_representative, nitro_italia_arco).

all_consistent(eu_representative) :- consistent(s4, eu_representative).

evidence(all_consistent(eu_representative)).
query(true_val(eu_representative, nitro_italia_arco)).
query(true_val(eu_representative, unk_eu_representative)).

0.88::acc(s5, usa_distribution).

% @attr usa_distribution
% @type categorical
% @canonical false
% @original_name USA distribution
% @values foundry_slc=Foundry_Distribution_SLC_UT unk_usa_distribution=Unknown
% @importance 0.4

0.86::true_val(usa_distribution, foundry_slc); 0.14::true_val(usa_distribution, unk_usa_distribution).

measured(s5, usa_distribution, foundry_slc).

all_consistent(usa_distribution) :- consistent(s5, usa_distribution).

evidence(all_consistent(usa_distribution)).
query(true_val(usa_distribution, foundry_slc)).
query(true_val(usa_distribution, unk_usa_distribution)).

0.88::acc(s6, brand_founding_year).

% @attr brand_founding_year
% @type numeric
% @canonical false
% @original_name Brand founding year
% @values v1990=1990 unk_brand_founding_year=Unknown
% @importance 0.5

0.86::true_val(brand_founding_year, v1990); 0.14::true_val(brand_founding_year, unk_brand_founding_year).

measured(s6, brand_founding_year, v1990).

all_consistent(brand_founding_year) :- consistent(s6, brand_founding_year).

evidence(all_consistent(brand_founding_year)).
query(true_val(brand_founding_year, v1990)).
query(true_val(brand_founding_year, unk_brand_founding_year)).

0.88::acc(s6, brand_founding_location).

% @attr brand_founding_location
% @type categorical
% @canonical false
% @original_name Brand founding location
% @values veras_cafe_seattle=Veras_Cafe_Seattle_Washington unk_brand_founding_location=Unknown
% @importance 0.5

0.86::true_val(brand_founding_location, veras_cafe_seattle); 0.14::true_val(brand_founding_location, unk_brand_founding_location).

measured(s6, brand_founding_location, veras_cafe_seattle).

all_consistent(brand_founding_location) :- consistent(s6, brand_founding_location).

evidence(all_consistent(brand_founding_location)).
query(true_val(brand_founding_location, veras_cafe_seattle)).
query(true_val(brand_founding_location, unk_brand_founding_location)).

0.88::acc(s6, brand_founders).

% @attr brand_founders
% @type categorical
% @canonical false
% @original_name Brand founders
% @values delago_ardelt=Thomas_Delago_and_Sepp_Ardelt unk_brand_founders=Unknown
% @importance 0.5

0.86::true_val(brand_founders, delago_ardelt); 0.14::true_val(brand_founders, unk_brand_founders).

measured(s6, brand_founders, delago_ardelt).

all_consistent(brand_founders) :- consistent(s6, brand_founders).

evidence(all_consistent(brand_founders)).
query(true_val(brand_founders, delago_ardelt)).
query(true_val(brand_founders, unk_brand_founders)).

0.75::acc(s7, brand_philosophy).

% @attr brand_philosophy
% @type categorical
% @canonical false
% @original_name Brand philosophy
% @values private_rider_driven=Privately_owned_rider_driven_authentic_independent unk_brand_philosophy=Unknown
% @importance 0.55

0.68::true_val(brand_philosophy, private_rider_driven); 0.32::true_val(brand_philosophy, unk_brand_philosophy).

measured(s7, brand_philosophy, private_rider_driven).

all_consistent(brand_philosophy) :- consistent(s7, brand_philosophy).

evidence(all_consistent(brand_philosophy)).
query(true_val(brand_philosophy, private_rider_driven)).
query(true_val(brand_philosophy, unk_brand_philosophy)).

0.88::acc(s6, brand_no_direct_online_sales).

% @attr brand_no_direct_online_sales
% @type categorical
% @canonical false
% @original_name Brand does NOT sell direct online
% @values confirmed=Does_not_sell_direct_online_USA unk_brand_no_direct_online_sales=Unknown
% @importance 0.5

0.86::true_val(brand_no_direct_online_sales, confirmed); 0.14::true_val(brand_no_direct_online_sales, unk_brand_no_direct_online_sales).

measured(s6, brand_no_direct_online_sales, confirmed).

all_consistent(brand_no_direct_online_sales) :- consistent(s6, brand_no_direct_online_sales).

evidence(all_consistent(brand_no_direct_online_sales)).
query(true_val(brand_no_direct_online_sales, confirmed)).
query(true_val(brand_no_direct_online_sales, unk_brand_no_direct_online_sales)).

0.78::acc(s8, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2025_26=2025_26_season_brand_new unk_model_first_available_year=Unknown
% @importance 0.85

0.72::true_val(model_first_available_year, season_2025_26); 0.28::true_val(model_first_available_year, unk_model_first_available_year).

measured(s8, model_first_available_year, season_2025_26).

all_consistent(model_first_available_year) :- consistent(s8, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2025_26)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.78::acc(s8, phase_alternator_relationship).

% @attr phase_alternator_relationship
% @type categorical
% @canonical false
% @original_name Phase described as bringing Alternator feel at lower price
% @values alternator_affordable=Feel_of_Alternator_at_more_affordable_price unk_phase_alternator_relationship=Unknown
% @importance 0.85

0.72::true_val(phase_alternator_relationship, alternator_affordable); 0.28::true_val(phase_alternator_relationship, unk_phase_alternator_relationship).

measured(s8, phase_alternator_relationship, alternator_affordable).

all_consistent(phase_alternator_relationship) :- consistent(s8, phase_alternator_relationship).

evidence(all_consistent(phase_alternator_relationship)).
query(true_val(phase_alternator_relationship, alternator_affordable)).
query(true_val(phase_alternator_relationship, unk_phase_alternator_relationship)).

0.95::acc(s1, shape).
0.68::acc(s3, shape).
0.55::acc(s9, shape).
0.48::acc(s10, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional=Directional directional_twin=Directional_Twin
% @importance 0.88

0.65::true_val(shape, directional); 0.35::true_val(shape, directional_twin).

measured(s1, shape, directional).
measured(s3, shape, directional).
measured(s9, shape, directional_twin).
measured(s10, shape, directional_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    consistent(s9, shape),
    consistent(s10, shape),
    (indep(s3), consistent(s3, shape) ; \+indep(s3)).

evidence(all_consistent(shape)).
query(true_val(shape, directional)).
query(true_val(shape, directional_twin)).

0.95::acc(s1, camber_type).
0.45::acc(s10, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values cam_out_camber=Cam_Out_Camber hybrid_camber=Hybrid_Camber
% @importance 0.85

0.72::true_val(camber_type, cam_out_camber); 0.28::true_val(camber_type, hybrid_camber).

measured(s1, camber_type, cam_out_camber).
measured(s10, camber_type, hybrid_camber).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    consistent(s10, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, cam_out_camber)).
query(true_val(camber_type, hybrid_camber)).

0.93::acc(s4, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values true_camber_smooth_transitions=True_Camber_with_smooth_tip_tail_transitions unk_camber_description=Unknown
% @importance 0.95

0.90::true_val(camber_description, true_camber_smooth_transitions); 0.10::true_val(camber_description, unk_camber_description).

measured(s4, camber_description, true_camber_smooth_transitions).

all_consistent(camber_description) :- consistent(s4, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, true_camber_smooth_transitions)).
query(true_val(camber_description, unk_camber_description)).

0.93::acc(s1, core_profile).

% @attr core_profile
% @type categorical
% @canonical false
% @original_name Core profile
% @values standard=Standard_Core_Profile unk_core_profile=Unknown
% @importance 1.0

0.93::true_val(core_profile, standard); 0.07::true_val(core_profile, unk_core_profile).

measured(s1, core_profile, standard).

all_consistent(core_profile) :- consistent(s1, core_profile).

evidence(all_consistent(core_profile)).
query(true_val(core_profile, standard)).
query(true_val(core_profile, unk_core_profile)).

0.93::acc(s4, core_profile_description).

% @attr core_profile_description
% @type categorical
% @canonical false
% @original_name Core profile description
% @values thick_center_thin_contact=Thicker_middle_thinning_to_contact_points unk_core_profile_description=Unknown
% @importance 0.95

0.90::true_val(core_profile_description, thick_center_thin_contact); 0.10::true_val(core_profile_description, unk_core_profile_description).

measured(s4, core_profile_description, thick_center_thin_contact).

all_consistent(core_profile_description) :- consistent(s4, core_profile_description).

evidence(all_consistent(core_profile_description)).
query(true_val(core_profile_description, thick_center_thin_contact)).
query(true_val(core_profile_description, unk_core_profile_description)).

0.95::acc(s1, flex_rating_10).
0.70::acc(s3, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6=6.0 unk_flex_rating_10=Unknown
% @importance 0.975

0.95::true_val(flex_rating_10, v6); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s1, flex_rating_10, v6).
measured(s3, flex_rating_10, v6).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    (indep(s3), consistent(s3, flex_rating_10) ; \+indep(s3)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.78::acc(s11, flex_feel).
0.55::acc(s12, flex_feel).
0.72::acc(s24, flex_feel).
0.65::acc(s17, flex_feel).
0.90::acc(s1, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium=Medium unk_flex_feel=Unknown
% @importance 0.82

0.95::true_val(flex_feel, medium); 0.05::true_val(flex_feel, unk_flex_feel).

measured(s11, flex_feel, medium).
measured(s12, flex_feel, medium).
measured(s24, flex_feel, medium).
measured(s17, flex_feel, medium).
measured(s1, flex_feel, medium).

all_consistent(flex_feel) :-
    consistent(s1, flex_feel),
    consistent(s11, flex_feel),
    consistent(s17, flex_feel),
    consistent(s24, flex_feel),
    (indep(s12), consistent(s12, flex_feel) ; \+indep(s12)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, unk_flex_feel)).

0.93::acc(s1, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values dual_degressive=Dual_Degressive unk_sidecut_type=Unknown
% @importance 1.0

0.95::true_val(sidecut_type, dual_degressive); 0.05::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, dual_degressive).

all_consistent(sidecut_type) :- consistent(s1, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, dual_degressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.95::acc(s1, core_material).
0.58::acc(s13, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values powercore_poplar=PowerCore_tip_to_tail_Poplar unk_core_material=Unknown
% @importance 0.85

0.95::true_val(core_material, powercore_poplar); 0.05::true_val(core_material, unk_core_material).

measured(s1, core_material, powercore_poplar).
measured(s13, core_material, powercore_poplar).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s13), consistent(s13, core_material) ; \+indep(s13)).

evidence(all_consistent(core_material)).
query(true_val(core_material, powercore_poplar)).
query(true_val(core_material, unk_core_material)).

0.93::acc(s1, laminate).
0.68::acc(s3, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values bi_lite_biaxial=Bi_Lite_Laminates_biaxial unk_laminate=Unknown
% @importance 0.975

0.95::true_val(laminate, bi_lite_biaxial); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, bi_lite_biaxial).
measured(s3, laminate, bi_lite_biaxial).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(s3), consistent(s3, laminate) ; \+indep(s3)).

evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite_biaxial)).
query(true_val(laminate, unk_laminate)).

0.95::acc(s1, base_type).
0.62::acc(s3, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values premium_extruded=Premium_Extruded_FH_Base sintered_extruded=Sintered_Extruded_FH_Base
% @importance 0.975

0.75::true_val(base_type, premium_extruded); 0.25::true_val(base_type, sintered_extruded).

measured(s1, base_type, premium_extruded).
measured(s3, base_type, sintered_extruded).

all_consistent(base_type) :-
    consistent(s1, base_type),
    (indep(s3), consistent(s3, base_type) ; \+indep(s3)).

evidence(all_consistent(base_type)).
query(true_val(base_type, premium_extruded)).
query(true_val(base_type, sintered_extruded)).

0.90::acc(s1, base_material_description).

% @attr base_material_description
% @type categorical
% @canonical false
% @original_name base_material
% @values durable_fast_low_maint=Durable_fast_low_maintenance_ultra_clear unk_base_material_description=Unknown
% @importance 1.0

0.90::true_val(base_material_description, durable_fast_low_maint); 0.10::true_val(base_material_description, unk_base_material_description).

measured(s1, base_material_description, durable_fast_low_maint).

all_consistent(base_material_description) :- consistent(s1, base_material_description).

evidence(all_consistent(base_material_description)).
query(true_val(base_material_description, durable_fast_low_maint)).
query(true_val(base_material_description, unk_base_material_description)).

0.93::acc(s1, sidewall_material).
0.88::acc(s14, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_recycled=ABS_Sidewall_35pct_recycled_polymers unk_sidewall_material=Unknown
% @importance 0.825

0.95::true_val(sidewall_material, abs_recycled); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s1, sidewall_material, abs_recycled).
measured(s14, sidewall_material, abs_recycled).

all_consistent(sidewall_material) :-
    consistent(s1, sidewall_material),
    consistent(s14, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_recycled)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.93::acc(s1, edge_technology).
0.85::acc(s15, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values recycled_steel_50pct=Recycled_Steel_Edge_50pct unk_edge_technology=Unknown
% @importance 0.8

0.95::true_val(edge_technology, recycled_steel_50pct); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, recycled_steel_50pct).
measured(s15, edge_technology, recycled_steel_50pct).

all_consistent(edge_technology) :-
    consistent(s1, edge_technology),
    consistent(s15, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_steel_50pct)).
query(true_val(edge_technology, unk_edge_technology)).

0.72::acc(s3, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.95

0.72::true_val(mounting_pattern, inserts_2x4); 0.28::true_val(mounting_pattern, unk_mounting_pattern).

measured(s3, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s3, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.90::acc(s1, width_options).
0.90::acc(s4, width_options).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values mid_wide_and_wide=Mid_Wide_and_Wide unk_width_options=Unknown
% @importance 0.975

0.93::true_val(width_options, mid_wide_and_wide); 0.07::true_val(width_options, unk_width_options).

measured(s1, width_options, mid_wide_and_wide).
measured(s4, width_options, mid_wide_and_wide).

all_consistent(width_options) :-
    consistent(s1, width_options),
    consistent(s4, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, mid_wide_and_wide)).
query(true_val(width_options, unk_width_options)).

0.95::acc(s1, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_152_155_159_162=152mw_155mw_159mw_162w unk_available_sizes=Unknown
% @importance 1.0

0.93::true_val(available_sizes, sizes_152_155_159_162); 0.07::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, sizes_152_155_159_162).

all_consistent(available_sizes) :- consistent(s1, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_152_155_159_162)).
query(true_val(available_sizes, unk_available_sizes)).

0.95::acc(s1, tip_tail_width_size_152mw).

% @attr tip_tail_width_size_152mw
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size 152mw
% @values v296_296=296.0/296.0 unk_tip_tail_width_size_152mw=Unknown
% @importance 1.0

0.93::true_val(tip_tail_width_size_152mw, v296_296); 0.07::true_val(tip_tail_width_size_152mw, unk_tip_tail_width_size_152mw).

measured(s1, tip_tail_width_size_152mw, v296_296).

all_consistent(tip_tail_width_size_152mw) :- consistent(s1, tip_tail_width_size_152mw).

evidence(all_consistent(tip_tail_width_size_152mw)).
query(true_val(tip_tail_width_size_152mw, v296_296)).
query(true_val(tip_tail_width_size_152mw, unk_tip_tail_width_size_152mw)).

0.95::acc(s1, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v298_298=298.0/298.0 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.93::true_val(tip_tail_width_size, v298_298); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v298_298).

all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v298_298)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.95::acc(s1, tip_tail_width_size_159mw).

% @attr tip_tail_width_size_159mw
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size 159mw
% @values v300_300=300.0/300.0 unk_tip_tail_width_size_159mw=Unknown
% @importance 1.0

0.93::true_val(tip_tail_width_size_159mw, v300_300); 0.07::true_val(tip_tail_width_size_159mw, unk_tip_tail_width_size_159mw).

measured(s1, tip_tail_width_size_159mw, v300_300).

all_consistent(tip_tail_width_size_159mw) :- consistent(s1, tip_tail_width_size_159mw).

evidence(all_consistent(tip_tail_width_size_159mw)).
query(true_val(tip_tail_width_size_159mw, v300_300)).
query(true_val(tip_tail_width_size_159mw, unk_tip_tail_width_size_159mw)).

0.95::acc(s1, tip_tail_width_size_162w).

% @attr tip_tail_width_size_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size 162w
% @values v312_312=312.0/312.0 unk_tip_tail_width_size_162w=Unknown
% @importance 1.0

0.93::true_val(tip_tail_width_size_162w, v312_312); 0.07::true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w).

measured(s1, tip_tail_width_size_162w, v312_312).

all_consistent(tip_tail_width_size_162w) :- consistent(s1, tip_tail_width_size_162w).

evidence(all_consistent(tip_tail_width_size_162w)).
query(true_val(tip_tail_width_size_162w, v312_312)).
query(true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w)).

0.95::acc(s1, waist_width_152mw).

% @attr waist_width_152mw
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 152mw
% @values v253=253.0 unk_waist_width_152mw=Unknown
% @importance 1.0

0.93::true_val(waist_width_152mw, v253); 0.07::true_val(waist_width_152mw, unk_waist_width_152mw).

measured(s1, waist_width_152mw, v253).

all_consistent(waist_width_152mw) :- consistent(s1, waist_width_152mw).

evidence(all_consistent(waist_width_152mw)).
query(true_val(waist_width_152mw, v253)).
query(true_val(waist_width_152mw, unk_waist_width_152mw)).

0.95::acc(s1, waist_width_155mw).

% @attr waist_width_155mw
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 155mw
% @values v255=255.0 unk_waist_width_155mw=Unknown
% @importance 1.0

0.93::true_val(waist_width_155mw, v255); 0.07::true_val(waist_width_155mw, unk_waist_width_155mw).

measured(s1, waist_width_155mw, v255).

all_consistent(waist_width_155mw) :- consistent(s1, waist_width_155mw).

evidence(all_consistent(waist_width_155mw)).
query(true_val(waist_width_155mw, v255)).
query(true_val(waist_width_155mw, unk_waist_width_155mw)).

0.95::acc(s1, waist_width_159mw).

% @attr waist_width_159mw
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 159mw
% @values v257=257.0 unk_waist_width_159mw=Unknown
% @importance 1.0

0.93::true_val(waist_width_159mw, v257); 0.07::true_val(waist_width_159mw, unk_waist_width_159mw).

measured(s1, waist_width_159mw, v257).

all_consistent(waist_width_159mw) :- consistent(s1, waist_width_159mw).

evidence(all_consistent(waist_width_159mw)).
query(true_val(waist_width_159mw, v257)).
query(true_val(waist_width_159mw, unk_waist_width_159mw)).

0.95::acc(s1, waist_width_162w).

% @attr waist_width_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 162w
% @values v269=269.0 unk_waist_width_162w=Unknown
% @importance 1.0

0.93::true_val(waist_width_162w, v269); 0.07::true_val(waist_width_162w, unk_waist_width_162w).

measured(s1, waist_width_162w, v269).

all_consistent(waist_width_162w) :- consistent(s1, waist_width_162w).

evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v269)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

0.95::acc(s1, contact_length_size_152mw).

% @attr contact_length_size_152mw
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size 152mw
% @values v1060=1060.0 unk_contact_length_size_152mw=Unknown
% @importance 1.0

0.93::true_val(contact_length_size_152mw, v1060); 0.07::true_val(contact_length_size_152mw, unk_contact_length_size_152mw).

measured(s1, contact_length_size_152mw, v1060).

all_consistent(contact_length_size_152mw) :- consistent(s1, contact_length_size_152mw).

evidence(all_consistent(contact_length_size_152mw)).
query(true_val(contact_length_size_152mw, v1060)).
query(true_val(contact_length_size_152mw, unk_contact_length_size_152mw)).

0.95::acc(s1, contact_length_size).

% @attr contact_length_size
% @type numeric
% @unit mm
% @canonical true
% @original_name contact_length_size
% @values v1090=1090.0 unk_contact_length_size=Unknown
% @importance 1.0

0.93::true_val(contact_length_size, v1090); 0.07::true_val(contact_length_size, unk_contact_length_size).

measured(s1, contact_length_size, v1090).

all_consistent(contact_length_size) :- consistent(s1, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1090)).
query(true_val(contact_length_size, unk_contact_length_size)).

0.95::acc(s1, contact_length_size_159mw).

% @attr contact_length_size_159mw
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size 159mw
% @values v1120=1120.0 unk_contact_length_size_159mw=Unknown
% @importance 1.0

0.93::true_val(contact_length_size_159mw, v1120); 0.07::true_val(contact_length_size_159mw, unk_contact_length_size_159mw).

measured(s1, contact_length_size_159mw, v1120).

all_consistent(contact_length_size_159mw) :- consistent(s1, contact_length_size_159mw).

evidence(all_consistent(contact_length_size_159mw)).
query(true_val(contact_length_size_159mw, v1120)).
query(true_val(contact_length_size_159mw, unk_contact_length_size_159mw)).

0.95::acc(s1, contact_length_size_162w).

% @attr contact_length_size_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size 162w
% @values v1150=1150.0 unk_contact_length_size_162w=Unknown
% @importance 1.0

0.93::true_val(contact_length_size_162w, v1150); 0.07::true_val(contact_length_size_162w, unk_contact_length_size_162w).

measured(s1, contact_length_size_162w, v1150).

all_consistent(contact_length_size_162w) :- consistent(s1, contact_length_size_162w).

evidence(all_consistent(contact_length_size_162w)).
query(true_val(contact_length_size_162w, v1150)).
query(true_val(contact_length_size_162w, unk_contact_length_size_162w)).

0.95::acc(s1, sidecut_radius_size_152mw).

% @attr sidecut_radius_size_152mw
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 152mw
% @values v9_4_6_1_9_4=9.4/6.1/9.4 unk_sidecut_radius_size_152mw=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_size_152mw, v9_4_6_1_9_4); 0.07::true_val(sidecut_radius_size_152mw, unk_sidecut_radius_size_152mw).

measured(s1, sidecut_radius_size_152mw, v9_4_6_1_9_4).

all_consistent(sidecut_radius_size_152mw) :- consistent(s1, sidecut_radius_size_152mw).

evidence(all_consistent(sidecut_radius_size_152mw)).
query(true_val(sidecut_radius_size_152mw, v9_4_6_1_9_4)).
query(true_val(sidecut_radius_size_152mw, unk_sidecut_radius_size_152mw)).

0.95::acc(s1, sidecut_radius_size).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v9_9_6_5_9_9=9.9/6.5/9.9 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_size, v9_9_6_5_9_9); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v9_9_6_5_9_9).

all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v9_9_6_5_9_9)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.95::acc(s1, sidecut_radius_size_159mw).

% @attr sidecut_radius_size_159mw
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 159mw
% @values v10_3_6_9_10_3=10.3/6.9/10.3 unk_sidecut_radius_size_159mw=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_size_159mw, v10_3_6_9_10_3); 0.07::true_val(sidecut_radius_size_159mw, unk_sidecut_radius_size_159mw).

measured(s1, sidecut_radius_size_159mw, v10_3_6_9_10_3).

all_consistent(sidecut_radius_size_159mw) :- consistent(s1, sidecut_radius_size_159mw).

evidence(all_consistent(sidecut_radius_size_159mw)).
query(true_val(sidecut_radius_size_159mw, v10_3_6_9_10_3)).
query(true_val(sidecut_radius_size_159mw, unk_sidecut_radius_size_159mw)).

0.95::acc(s1, sidecut_radius_size_162w).

% @attr sidecut_radius_size_162w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 162w
% @values v11_0_7_2_11_0=11.0/7.2/11.0 unk_sidecut_radius_size_162w=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_size_162w, v11_0_7_2_11_0); 0.07::true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w).

measured(s1, sidecut_radius_size_162w, v11_0_7_2_11_0).

all_consistent(sidecut_radius_size_162w) :- consistent(s1, sidecut_radius_size_162w).

evidence(all_consistent(sidecut_radius_size_162w)).
query(true_val(sidecut_radius_size_162w, v11_0_7_2_11_0)).
query(true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w)).

0.95::acc(s1, stance_width_range_size_152mw).

% @attr stance_width_range_size_152mw
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size 152mw
% @values v48_60=48-60 unk_stance_width_range_size_152mw=Unknown
% @importance 1.0

0.93::true_val(stance_width_range_size_152mw, v48_60); 0.07::true_val(stance_width_range_size_152mw, unk_stance_width_range_size_152mw).

measured(s1, stance_width_range_size_152mw, v48_60).

all_consistent(stance_width_range_size_152mw) :- consistent(s1, stance_width_range_size_152mw).

evidence(all_consistent(stance_width_range_size_152mw)).
query(true_val(stance_width_range_size_152mw, v48_60)).
query(true_val(stance_width_range_size_152mw, unk_stance_width_range_size_152mw)).

0.95::acc(s1, stance_width_range_size).

% @attr stance_width_range_size
% @type categorical
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v48_60=48-60 unk_stance_width_range_size=Unknown
% @importance 1.0

0.93::true_val(stance_width_range_size, v48_60); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, v48_60).

all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v48_60)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.95::acc(s1, stance_width_range_size_159mw).

% @attr stance_width_range_size_159mw
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size 159mw
% @values v50_62=50-62 unk_stance_width_range_size_159mw=Unknown
% @importance 1.0

0.93::true_val(stance_width_range_size_159mw, v50_62); 0.07::true_val(stance_width_range_size_159mw, unk_stance_width_range_size_159mw).

measured(s1, stance_width_range_size_159mw, v50_62).

all_consistent(stance_width_range_size_159mw) :- consistent(s1, stance_width_range_size_159mw).

evidence(all_consistent(stance_width_range_size_159mw)).
query(true_val(stance_width_range_size_159mw, v50_62)).
query(true_val(stance_width_range_size_159mw, unk_stance_width_range_size_159mw)).

0.95::acc(s1, stance_width_range_size_162w).

% @attr stance_width_range_size_162w
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size 162w
% @values v50_62=50-62 unk_stance_width_range_size_162w=Unknown
% @importance 1.0

0.93::true_val(stance_width_range_size_162w, v50_62); 0.07::true_val(stance_width_range_size_162w, unk_stance_width_range_size_162w).

measured(s1, stance_width_range_size_162w, v50_62).

all_consistent(stance_width_range_size_162w) :- consistent(s1, stance_width_range_size_162w).

evidence(all_consistent(stance_width_range_size_162w)).
query(true_val(stance_width_range_size_162w, v50_62)).
query(true_val(stance_width_range_size_162w, unk_stance_width_range_size_162w)).

0.95::acc(s1, recommended_weight_range_size_152mw).

% @attr recommended_weight_range_size_152mw
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 152mw
% @values v50_70=50-70kg_110-155lb unk_recommended_weight_range_size_152mw=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size_152mw, v50_70); 0.07::true_val(recommended_weight_range_size_152mw, unk_recommended_weight_range_size_152mw).

measured(s1, recommended_weight_range_size_152mw, v50_70).

all_consistent(recommended_weight_range_size_152mw) :- consistent(s1, recommended_weight_range_size_152mw).

evidence(all_consistent(recommended_weight_range_size_152mw)).
query(true_val(recommended_weight_range_size_152mw, v50_70)).
query(true_val(recommended_weight_range_size_152mw, unk_recommended_weight_range_size_152mw)).

0.95::acc(s1, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values v55_75=55-75kg_120-165lb unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size, v55_75); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, v55_75).

all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v55_75)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.95::acc(s1, recommended_weight_range_size_159mw).

% @attr recommended_weight_range_size_159mw
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 159mw
% @values v65_plus=65plus_kg_145plus_lb unk_recommended_weight_range_size_159mw=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size_159mw, v65_plus); 0.07::true_val(recommended_weight_range_size_159mw, unk_recommended_weight_range_size_159mw).

measured(s1, recommended_weight_range_size_159mw, v65_plus).

all_consistent(recommended_weight_range_size_159mw) :- consistent(s1, recommended_weight_range_size_159mw).

evidence(all_consistent(recommended_weight_range_size_159mw)).
query(true_val(recommended_weight_range_size_159mw, v65_plus)).
query(true_val(recommended_weight_range_size_159mw, unk_recommended_weight_range_size_159mw)).

0.95::acc(s1, recommended_weight_range_size_162w).

% @attr recommended_weight_range_size_162w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 162w
% @values v70_plus=70plus_kg_155plus_lb unk_recommended_weight_range_size_162w=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size_162w, v70_plus); 0.07::true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w).

measured(s1, recommended_weight_range_size_162w, v70_plus).

all_consistent(recommended_weight_range_size_162w) :- consistent(s1, recommended_weight_range_size_162w).

evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, v70_plus)).
query(true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w)).

0.95::acc(s1, setback).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v_neg15=neg15.0 unk_setback=Unknown
% @importance 1.0

0.93::true_val(setback, v_neg15); 0.07::true_val(setback, unk_setback).

measured(s1, setback, v_neg15).

all_consistent(setback) :- consistent(s1, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v_neg15)).
query(true_val(setback, unk_setback)).

0.95::acc(s1, terrain_suitability).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability All Mountain
% @values v10=10.0 unk_terrain_suitability=Unknown
% @importance 1.0

0.93::true_val(terrain_suitability, v10); 0.07::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, v10).

all_consistent(terrain_suitability) :- consistent(s1, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.95::acc(s1, terrain_suitability_park).

% @attr terrain_suitability_park
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability Park
% @values v6=6.0 unk_terrain_suitability_park=Unknown
% @importance 1.0

0.93::true_val(terrain_suitability_park, v6); 0.07::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s1, terrain_suitability_park, v6).

all_consistent(terrain_suitability_park) :- consistent(s1, terrain_suitability_park).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v6)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

0.95::acc(s1, terrain_suitability_backcountry).

% @attr terrain_suitability_backcountry
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability Backcountry
% @values v8=8.0 unk_terrain_suitability_backcountry=Unknown
% @importance 1.0

0.93::true_val(terrain_suitability_backcountry, v8); 0.07::true_val(terrain_suitability_backcountry, unk_terrain_suitability_backcountry).

measured(s1, terrain_suitability_backcountry, v8).

all_consistent(terrain_suitability_backcountry) :- consistent(s1, terrain_suitability_backcountry).

evidence(all_consistent(terrain_suitability_backcountry)).
query(true_val(terrain_suitability_backcountry, v8)).
query(true_val(terrain_suitability_backcountry, unk_terrain_suitability_backcountry)).

0.72::acc(s3, terrain_suitability_general).

% @attr terrain_suitability_general
% @type categorical
% @canonical false
% @original_name terrain_suitability general
% @values side_hits_trees_groomers_offpiste=Side_hits_tree_runs_groomers_off_piste unk_terrain_suitability_general=Unknown
% @importance 0.95

0.72::true_val(terrain_suitability_general, side_hits_trees_groomers_offpiste); 0.28::true_val(terrain_suitability_general, unk_terrain_suitability_general).

measured(s3, terrain_suitability_general, side_hits_trees_groomers_offpiste).

all_consistent(terrain_suitability_general) :- consistent(s3, terrain_suitability_general).

evidence(all_consistent(terrain_suitability_general)).
query(true_val(terrain_suitability_general, side_hits_trees_groomers_offpiste)).
query(true_val(terrain_suitability_general, unk_terrain_suitability_general)).

0.72::acc(s3, riding_style).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values carving_cruising_am_freeride=Carving_cruising_all_mountain_freeride unk_riding_style=Unknown
% @importance 0.95

0.72::true_val(riding_style, carving_cruising_am_freeride); 0.28::true_val(riding_style, unk_riding_style).

measured(s3, riding_style, carving_cruising_am_freeride).

all_consistent(riding_style) :- consistent(s3, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, carving_cruising_am_freeride)).
query(true_val(riding_style, unk_riding_style)).

0.93::acc(s1, sustainability_certification).
0.85::acc(s15, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values solar_power_100pct=Made_with_100pct_Solar_Power unk_sustainability_certification=Unknown
% @importance 0.8

0.95::true_val(sustainability_certification, solar_power_100pct); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s1, sustainability_certification, solar_power_100pct).
measured(s15, sustainability_certification, solar_power_100pct).

all_consistent(sustainability_certification) :-
    consistent(s1, sustainability_certification),
    consistent(s15, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, solar_power_100pct)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.85::acc(s15, sustainability_solar_detail).

% @attr sustainability_solar_detail
% @type categorical
% @canonical false
% @original_name sustainability_certification solar detail
% @values kw700_roof=700KW_solar_station_on_factory_roof unk_sustainability_solar_detail=Unknown
% @importance 0.6

0.77::true_val(sustainability_solar_detail, kw700_roof); 0.23::true_val(sustainability_solar_detail, unk_sustainability_solar_detail).

measured(s15, sustainability_solar_detail, kw700_roof).

all_consistent(sustainability_solar_detail) :- consistent(s15, sustainability_solar_detail).

evidence(all_consistent(sustainability_solar_detail)).
query(true_val(sustainability_solar_detail, kw700_roof)).
query(true_val(sustainability_solar_detail, unk_sustainability_solar_detail)).

0.93::acc(s1, sustainability_fsc_wood).

% @attr sustainability_fsc_wood
% @type categorical
% @canonical false
% @original_name sustainability_certification FSC
% @values fsc_certified=FSC_Certified_Wood_Core unk_sustainability_fsc_wood=Unknown
% @importance 0.8

0.93::true_val(sustainability_fsc_wood, fsc_certified); 0.07::true_val(sustainability_fsc_wood, unk_sustainability_fsc_wood).

measured(s1, sustainability_fsc_wood, fsc_certified).

all_consistent(sustainability_fsc_wood) :- consistent(s1, sustainability_fsc_wood).

evidence(all_consistent(sustainability_fsc_wood)).
query(true_val(sustainability_fsc_wood, fsc_certified)).
query(true_val(sustainability_fsc_wood, unk_sustainability_fsc_wood)).

0.93::acc(s1, sustainability_inks).

% @attr sustainability_inks
% @type categorical
% @canonical false
% @original_name sustainability_certification water-based inks
% @values water_based=Water_based_inks unk_sustainability_inks=Unknown
% @importance 0.8

0.93::true_val(sustainability_inks, water_based); 0.07::true_val(sustainability_inks, unk_sustainability_inks).

measured(s1, sustainability_inks, water_based).

all_consistent(sustainability_inks) :- consistent(s1, sustainability_inks).

evidence(all_consistent(sustainability_inks)).
query(true_val(sustainability_inks, water_based)).
query(true_val(sustainability_inks, unk_sustainability_inks)).

0.85::acc(s15, sustainability_inks_detail).

% @attr sustainability_inks_detail
% @type categorical
% @canonical false
% @original_name sustainability_certification ink coverage
% @values pct70_topsheets_30_bases=Over_70pct_topsheets_30pct_bases unk_sustainability_inks_detail=Unknown
% @importance 0.6

0.77::true_val(sustainability_inks_detail, pct70_topsheets_30_bases); 0.23::true_val(sustainability_inks_detail, unk_sustainability_inks_detail).

measured(s15, sustainability_inks_detail, pct70_topsheets_30_bases).

all_consistent(sustainability_inks_detail) :- consistent(s15, sustainability_inks_detail).

evidence(all_consistent(sustainability_inks_detail)).
query(true_val(sustainability_inks_detail, pct70_topsheets_30_bases)).
query(true_val(sustainability_inks_detail, unk_sustainability_inks_detail)).

0.85::acc(s15, sustainability_recycled_bases).

% @attr sustainability_recycled_bases
% @type categorical
% @canonical false
% @original_name sustainability_certification recycled bases
% @values pct85_recycled=Over_85pct_running_bases_recycled unk_sustainability_recycled_bases=Unknown
% @importance 0.6

0.77::true_val(sustainability_recycled_bases, pct85_recycled); 0.23::true_val(sustainability_recycled_bases, unk_sustainability_recycled_bases).

measured(s15, sustainability_recycled_bases, pct85_recycled).

all_consistent(sustainability_recycled_bases) :- consistent(s15, sustainability_recycled_bases).

evidence(all_consistent(sustainability_recycled_bases)).
query(true_val(sustainability_recycled_bases, pct85_recycled)).
query(true_val(sustainability_recycled_bases, unk_sustainability_recycled_bases)).

0.93::acc(s1, sustainability_recycled_steel).
0.85::acc(s15, sustainability_recycled_steel).

% @attr sustainability_recycled_steel
% @type categorical
% @canonical false
% @original_name sustainability_certification recycled steel
% @values pct50_recycled_steel=50pct_recycled_steel unk_sustainability_recycled_steel=Unknown
% @importance 0.8

0.95::true_val(sustainability_recycled_steel, pct50_recycled_steel); 0.05::true_val(sustainability_recycled_steel, unk_sustainability_recycled_steel).

measured(s1, sustainability_recycled_steel, pct50_recycled_steel).
measured(s15, sustainability_recycled_steel, pct50_recycled_steel).

all_consistent(sustainability_recycled_steel) :-
    consistent(s1, sustainability_recycled_steel),
    consistent(s15, sustainability_recycled_steel).

evidence(all_consistent(sustainability_recycled_steel)).
query(true_val(sustainability_recycled_steel, pct50_recycled_steel)).
query(true_val(sustainability_recycled_steel, unk_sustainability_recycled_steel)).

0.88::acc(s14, sustainability_recycled_sidewalls).

% @attr sustainability_recycled_sidewalls
% @type categorical
% @canonical false
% @original_name sustainability_certification recycled polymers
% @values pct35_recycled_polymers=35pct_recycled_polymers unk_sustainability_recycled_sidewalls=Unknown
% @importance 0.65

0.76::true_val(sustainability_recycled_sidewalls, pct35_recycled_polymers); 0.24::true_val(sustainability_recycled_sidewalls, unk_sustainability_recycled_sidewalls).

measured(s14, sustainability_recycled_sidewalls, pct35_recycled_polymers).

all_consistent(sustainability_recycled_sidewalls) :- consistent(s14, sustainability_recycled_sidewalls).

evidence(all_consistent(sustainability_recycled_sidewalls)).
query(true_val(sustainability_recycled_sidewalls, pct35_recycled_polymers)).
query(true_val(sustainability_recycled_sidewalls, unk_sustainability_recycled_sidewalls)).

0.93::acc(s1, sustainability_carbon_footprint).

% @attr sustainability_carbon_footprint
% @type numeric
% @unit kg_co2
% @canonical false
% @original_name sustainability_certification carbon footprint
% @values v32_2=32.2 unk_sustainability_carbon_footprint=Unknown
% @importance 0.8

0.93::true_val(sustainability_carbon_footprint, v32_2); 0.07::true_val(sustainability_carbon_footprint, unk_sustainability_carbon_footprint).

measured(s1, sustainability_carbon_footprint, v32_2).

all_consistent(sustainability_carbon_footprint) :- consistent(s1, sustainability_carbon_footprint).

evidence(all_consistent(sustainability_carbon_footprint)).
query(true_val(sustainability_carbon_footprint, v32_2)).
query(true_val(sustainability_carbon_footprint, unk_sustainability_carbon_footprint)).

0.72::acc(s16, sustainability_climate_partner).

% @attr sustainability_climate_partner
% @type categorical
% @canonical false
% @original_name sustainability_certification ClimatePartner
% @values climate_partner=ClimatePartner_carbon_calculation_offsetting unk_sustainability_climate_partner=Unknown
% @importance 0.5

0.60::true_val(sustainability_climate_partner, climate_partner); 0.40::true_val(sustainability_climate_partner, unk_sustainability_climate_partner).

measured(s16, sustainability_climate_partner, climate_partner).

all_consistent(sustainability_climate_partner) :- consistent(s16, sustainability_climate_partner).

evidence(all_consistent(sustainability_climate_partner)).
query(true_val(sustainability_climate_partner, climate_partner)).
query(true_val(sustainability_climate_partner, unk_sustainability_climate_partner)).

0.85::acc(s15, sustainability_voc_free).

% @attr sustainability_voc_free
% @type categorical
% @canonical false
% @original_name sustainability_certification VOC free coatings
% @values pct70_voc_zero=70pct_boards_uncoated_or_VOC_zero unk_sustainability_voc_free=Unknown
% @importance 0.6

0.77::true_val(sustainability_voc_free, pct70_voc_zero); 0.23::true_val(sustainability_voc_free, unk_sustainability_voc_free).

measured(s15, sustainability_voc_free, pct70_voc_zero).

all_consistent(sustainability_voc_free) :- consistent(s15, sustainability_voc_free).

evidence(all_consistent(sustainability_voc_free)).
query(true_val(sustainability_voc_free, pct70_voc_zero)).
query(true_val(sustainability_voc_free, unk_sustainability_voc_free)).

0.80::acc(s3, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v799_99=799.99 unk_price_aud_merchant=Unknown
% @importance 0.95

0.72::true_val(price_aud_merchant, v799_99); 0.28::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s3, price_aud_merchant, v799_99).

all_consistent(price_aud_merchant) :- consistent(s3, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v799_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.93::acc(s1, price_eur_nitro).

% @attr price_eur_nitro
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price EUR Nitro official
% @values v479_90=479.90 unk_price_eur_nitro=Unknown
% @importance 1.0

0.93::true_val(price_eur_nitro, v479_90); 0.07::true_val(price_eur_nitro, unk_price_eur_nitro).

measured(s1, price_eur_nitro, v479_90).

all_consistent(price_eur_nitro) :- consistent(s1, price_eur_nitro).

evidence(all_consistent(price_eur_nitro)).
query(true_val(price_eur_nitro, v479_90)).
query(true_val(price_eur_nitro, unk_price_eur_nitro)).

0.70::acc(s17, price_eur_snowcountry).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price EUR Snowcountry EU
% @values v479_95=479.95 unk_price_eur_snowcountry=Unknown
% @importance 0.75

0.60::true_val(price_eur_snowcountry, v479_95); 0.40::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s17, price_eur_snowcountry, v479_95).

all_consistent(price_eur_snowcountry) :- consistent(s17, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v479_95)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

0.85::acc(s18, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v321_92=321.92 unk_price_usd_evo=Unknown
% @importance 0.95

0.72::true_val(price_usd_evo, v321_92); 0.28::true_val(price_usd_evo, unk_price_usd_evo).

measured(s18, price_usd_evo, v321_92).

all_consistent(price_usd_evo) :- consistent(s18, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v321_92)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.85::acc(s18, price_usd_evo_regular).

% @attr price_usd_evo_regular
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo regular
% @values v459_95=459.95 unk_price_usd_evo_regular=Unknown
% @importance 0.95

0.72::true_val(price_usd_evo_regular, v459_95); 0.28::true_val(price_usd_evo_regular, unk_price_usd_evo_regular).

measured(s18, price_usd_evo_regular, v459_95).

all_consistent(price_usd_evo_regular) :- consistent(s18, price_usd_evo_regular).

evidence(all_consistent(price_usd_evo_regular)).
query(true_val(price_usd_evo_regular, v459_95)).
query(true_val(price_usd_evo_regular, unk_price_usd_evo_regular)).

0.85::acc(s19, price_usd_evo_cinelli_regular).

% @attr price_usd_evo_cinelli_regular
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo Cinelli regular
% @values v499_95=499.95 unk_price_usd_evo_cinelli_regular=Unknown
% @importance 0.8

0.77::true_val(price_usd_evo_cinelli_regular, v499_95); 0.23::true_val(price_usd_evo_cinelli_regular, unk_price_usd_evo_cinelli_regular).

measured(s19, price_usd_evo_cinelli_regular, v499_95).

all_consistent(price_usd_evo_cinelli_regular) :- consistent(s19, price_usd_evo_cinelli_regular).

evidence(all_consistent(price_usd_evo_cinelli_regular)).
query(true_val(price_usd_evo_cinelli_regular, v499_95)).
query(true_val(price_usd_evo_cinelli_regular, unk_price_usd_evo_cinelli_regular)).

0.85::acc(s19, price_usd_evo_cinelli_sale).

% @attr price_usd_evo_cinelli_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo Cinelli sale
% @values v349_92=349.92 unk_price_usd_evo_cinelli_sale=Unknown
% @importance 0.8

0.77::true_val(price_usd_evo_cinelli_sale, v349_92); 0.23::true_val(price_usd_evo_cinelli_sale, unk_price_usd_evo_cinelli_sale).

measured(s19, price_usd_evo_cinelli_sale, v349_92).

all_consistent(price_usd_evo_cinelli_sale) :- consistent(s19, price_usd_evo_cinelli_sale).

evidence(all_consistent(price_usd_evo_cinelli_sale)).
query(true_val(price_usd_evo_cinelli_sale, v349_92)).
query(true_val(price_usd_evo_cinelli_sale, unk_price_usd_evo_cinelli_sale)).

0.88::acc(s20, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v499_95=499.95 unk_price_usd_msrp=Unknown
% @importance 0.7

0.81::true_val(price_usd_msrp, v499_95); 0.19::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s20, price_usd_msrp, v499_95).

all_consistent(price_usd_msrp) :- consistent(s20, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v499_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.85::acc(s18, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values alternator_579_95=Nitro_Alternator_579_95 unk_comparable_board_same_brand=Unknown
% @importance 0.95

0.72::true_val(comparable_board_same_brand, alternator_579_95); 0.28::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s18, comparable_board_same_brand, alternator_579_95).

all_consistent(comparable_board_same_brand) :- consistent(s18, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, alternator_579_95)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.85::acc(s18, comparable_board_same_brand_team).

% @attr comparable_board_same_brand_team
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand Team
% @values team_579_95=Nitro_Team_579_95 unk_comparable_board_same_brand_team=Unknown
% @importance 0.95

0.72::true_val(comparable_board_same_brand_team, team_579_95); 0.28::true_val(comparable_board_same_brand_team, unk_comparable_board_same_brand_team).

measured(s18, comparable_board_same_brand_team, team_579_95).

all_consistent(comparable_board_same_brand_team) :- consistent(s18, comparable_board_same_brand_team).

evidence(all_consistent(comparable_board_same_brand_team)).
query(true_val(comparable_board_same_brand_team, team_579_95)).
query(true_val(comparable_board_same_brand_team, unk_comparable_board_same_brand_team)).

0.78::acc(s3, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 0.95

0.72::true_val(availability_status, preorder); 0.28::true_val(availability_status, unk_availability_status).

measured(s3, availability_status, preorder).

all_consistent(availability_status) :- consistent(s3, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

0.78::acc(s3, estimated_availability_date).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values may_1_2026=May_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.95

0.72::true_val(estimated_availability_date, may_1_2026); 0.28::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s3, estimated_availability_date, may_1_2026).

all_consistent(estimated_availability_date) :- consistent(s3, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.70::acc(s21, availability_status_melbourne).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name Available at Melbourne Snowboard Centre
% @values available=Available unk_availability_status_melbourne=Unknown
% @importance 0.6

0.60::true_val(availability_status_melbourne, available); 0.40::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s21, availability_status_melbourne, available).

all_consistent(availability_status_melbourne) :- consistent(s21, availability_status_melbourne).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

0.60::acc(s22, availability_status_blauer).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name Available at Blauer Board Shop
% @values available=Available unk_availability_status_blauer=Unknown
% @importance 0.5

0.46::true_val(availability_status_blauer, available); 0.54::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s22, availability_status_blauer, available).

all_consistent(availability_status_blauer) :- consistent(s22, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

0.85::acc(s18, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name Available at evo.com
% @values available=Available_2026_on_sale unk_availability_status_evo=Unknown
% @importance 0.95

0.72::true_val(availability_status_evo, available); 0.28::true_val(availability_status_evo, unk_availability_status_evo).

measured(s18, availability_status_evo, available).

all_consistent(availability_status_evo) :- consistent(s18, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.60::acc(s23, availability_status_eriks).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name Available at ERIKS Bike Board Ski
% @values available=Available unk_availability_status_eriks=Unknown
% @importance 0.5

0.49::true_val(availability_status_eriks, available); 0.51::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s23, availability_status_eriks, available).

all_consistent(availability_status_eriks) :- consistent(s23, availability_status_eriks).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, available)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

0.72::acc(s24, availability_status_milosport).

% @attr availability_status_milosport
% @type categorical
% @canonical false
% @original_name Available at Milosport
% @values available=Available unk_availability_status_milosport=Unknown
% @importance 0.8

0.68::true_val(availability_status_milosport, available); 0.32::true_val(availability_status_milosport, unk_availability_status_milosport).

measured(s24, availability_status_milosport, available).

all_consistent(availability_status_milosport) :- consistent(s24, availability_status_milosport).

evidence(all_consistent(availability_status_milosport)).
query(true_val(availability_status_milosport, available)).
query(true_val(availability_status_milosport, unk_availability_status_milosport)).

0.68::acc(s25, availability_status_peter_glenn).

% @attr availability_status_peter_glenn
% @type categorical
% @canonical false
% @original_name Available at Peter Glenn
% @values available=Available unk_availability_status_peter_glenn=Unknown
% @importance 0.5

0.56::true_val(availability_status_peter_glenn, available); 0.44::true_val(availability_status_peter_glenn, unk_availability_status_peter_glenn).

measured(s25, availability_status_peter_glenn, available).

all_consistent(availability_status_peter_glenn) :- consistent(s25, availability_status_peter_glenn).

evidence(all_consistent(availability_status_peter_glenn)).
query(true_val(availability_status_peter_glenn, available)).
query(true_val(availability_status_peter_glenn, unk_availability_status_peter_glenn)).

0.55::acc(s9, availability_status_source_boards).

% @attr availability_status_source_boards
% @type categorical
% @canonical false
% @original_name Available at The Source Snowboard Skate
% @values available=Available unk_availability_status_source_boards=Unknown
% @importance 0.8

0.51::true_val(availability_status_source_boards, available); 0.49::true_val(availability_status_source_boards, unk_availability_status_source_boards).

measured(s9, availability_status_source_boards, available).

all_consistent(availability_status_source_boards) :- consistent(s9, availability_status_source_boards).

evidence(all_consistent(availability_status_source_boards)).
query(true_val(availability_status_source_boards, available)).
query(true_val(availability_status_source_boards, unk_availability_status_source_boards)).

0.55::acc(s26, availability_status_shred_shop).

% @attr availability_status_shred_shop
% @type categorical
% @canonical false
% @original_name Available at Shred Shop
% @values available=Available unk_availability_status_shred_shop=Unknown
% @importance 0.4

0.42::true_val(availability_status_shred_shop, available); 0.58::true_val(availability_status_shred_shop, unk_availability_status_shred_shop).

measured(s26, availability_status_shred_shop, available).

all_consistent(availability_status_shred_shop) :- consistent(s26, availability_status_shred_shop).

evidence(all_consistent(availability_status_shred_shop)).
query(true_val(availability_status_shred_shop, available)).
query(true_val(availability_status_shred_shop, unk_availability_status_shred_shop)).

0.60::acc(s13, availability_status_mt_everest).

% @attr availability_status_mt_everest
% @type categorical
% @canonical false
% @original_name Available at Mt Everest
% @values available=Available unk_availability_status_mt_everest=Unknown
% @importance 0.7

0.55::true_val(availability_status_mt_everest, available); 0.45::true_val(availability_status_mt_everest, unk_availability_status_mt_everest).

measured(s13, availability_status_mt_everest, available).

all_consistent(availability_status_mt_everest) :- consistent(s13, availability_status_mt_everest).

evidence(all_consistent(availability_status_mt_everest)).
query(true_val(availability_status_mt_everest, available)).
query(true_val(availability_status_mt_everest, unk_availability_status_mt_everest)).

0.60::acc(s27, availability_status_corbetts).

% @attr availability_status_corbetts
% @type categorical
% @canonical false
% @original_name Available at Corbetts Ski Snowboard
% @values available=Available unk_availability_status_corbetts=Unknown
% @importance 0.4

0.46::true_val(availability_status_corbetts, available); 0.54::true_val(availability_status_corbetts, unk_availability_status_corbetts).

measured(s27, availability_status_corbetts, available).

all_consistent(availability_status_corbetts) :- consistent(s27, availability_status_corbetts).

evidence(all_consistent(availability_status_corbetts)).
query(true_val(availability_status_corbetts, available)).
query(true_val(availability_status_corbetts, unk_availability_status_corbetts)).

0.65::acc(s17, availability_status_snowcountry).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name Available at Snowcountry.eu
% @values available=Available unk_availability_status_snowcountry=Unknown
% @importance 0.75

0.60::true_val(availability_status_snowcountry, available); 0.40::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).

measured(s17, availability_status_snowcountry, available).

all_consistent(availability_status_snowcountry) :- consistent(s17, availability_status_snowcountry).

evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, available)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

0.55::acc(s28, availability_status_boardsports_eu).

% @attr availability_status_boardsports_eu
% @type categorical
% @canonical false
% @original_name Available at Boardsports.eu
% @values available=Available unk_availability_status_boardsports_eu=Unknown
% @importance 0.4

0.42::true_val(availability_status_boardsports_eu, available); 0.58::true_val(availability_status_boardsports_eu, unk_availability_status_boardsports_eu).

measured(s28, availability_status_boardsports_eu, available).

all_consistent(availability_status_boardsports_eu) :- consistent(s28, availability_status_boardsports_eu).

evidence(all_consistent(availability_status_boardsports_eu)).
query(true_val(availability_status_boardsports_eu, available)).
query(true_val(availability_status_boardsports_eu, unk_availability_status_boardsports_eu)).

0.72::acc(s29, availability_status_absolute_snow).

% @attr availability_status_absolute_snow
% @type categorical
% @canonical false
% @original_name Available at Absolute Snow UK
% @values available=Available unk_availability_status_absolute_snow=Unknown
% @importance 0.75

0.64::true_val(availability_status_absolute_snow, available); 0.36::true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow).

measured(s29, availability_status_absolute_snow, available).

all_consistent(availability_status_absolute_snow) :- consistent(s29, availability_status_absolute_snow).

evidence(all_consistent(availability_status_absolute_snow)).
query(true_val(availability_status_absolute_snow, available)).
query(true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow)).

0.68::acc(s30, availability_status_glisshop).

% @attr availability_status_glisshop
% @type categorical
% @canonical false
% @original_name Available at Glisshop
% @values available=Available unk_availability_status_glisshop=Unknown
% @importance 0.5

0.56::true_val(availability_status_glisshop, available); 0.44::true_val(availability_status_glisshop, unk_availability_status_glisshop).

measured(s30, availability_status_glisshop, available).

all_consistent(availability_status_glisshop) :- consistent(s30, availability_status_glisshop).

evidence(all_consistent(availability_status_glisshop)).
query(true_val(availability_status_glisshop, available)).
query(true_val(availability_status_glisshop, unk_availability_status_glisshop)).

0.55::acc(s12, availability_status_pf_powder).

% @attr availability_status_pf_powder
% @type categorical
% @canonical false
% @original_name Available at PF Powder
% @values available=Available unk_availability_status_pf_powder=Unknown
% @importance 0.75

0.51::true_val(availability_status_pf_powder, available); 0.49::true_val(availability_status_pf_powder, unk_availability_status_pf_powder).

measured(s12, availability_status_pf_powder, available).

all_consistent(availability_status_pf_powder) :- consistent(s12, availability_status_pf_powder).

evidence(all_consistent(availability_status_pf_powder)).
query(true_val(availability_status_pf_powder, available)).
query(true_val(availability_status_pf_powder, unk_availability_status_pf_powder)).

0.62::acc(s31, availability_status_alpin_haus).

% @attr availability_status_alpin_haus
% @type categorical
% @canonical false
% @original_name Available at Alpin Haus
% @values available=Available unk_availability_status_alpin_haus=Unknown
% @importance 0.7

0.55::true_val(availability_status_alpin_haus, available); 0.45::true_val(availability_status_alpin_haus, unk_availability_status_alpin_haus).

measured(s31, availability_status_alpin_haus, available).

all_consistent(availability_status_alpin_haus) :- consistent(s31, availability_status_alpin_haus).

evidence(all_consistent(availability_status_alpin_haus)).
query(true_val(availability_status_alpin_haus, available)).
query(true_val(availability_status_alpin_haus, unk_availability_status_alpin_haus)).

0.55::acc(s32, availability_status_action_ride).

% @attr availability_status_action_ride
% @type categorical
% @canonical false
% @original_name Available at Action Ride Shop
% @values available=Available unk_availability_status_action_ride=Unknown
% @importance 0.5

0.51::true_val(availability_status_action_ride, available); 0.49::true_val(availability_status_action_ride, unk_availability_status_action_ride).

measured(s32, availability_status_action_ride, available).

all_consistent(availability_status_action_ride) :- consistent(s32, availability_status_action_ride).

evidence(all_consistent(availability_status_action_ride)).
query(true_val(availability_status_action_ride, available)).
query(true_val(availability_status_action_ride, unk_availability_status_action_ride)).

0.50::acc(s10, availability_status_rhythm).

% @attr availability_status_rhythm
% @type categorical
% @canonical false
% @original_name Available at Rhythm Snowsports Australia
% @values available=Available unk_availability_status_rhythm=Unknown
% @importance 0.7

0.35::true_val(availability_status_rhythm, available); 0.65::true_val(availability_status_rhythm, unk_availability_status_rhythm).

measured(s10, availability_status_rhythm, available).

all_consistent(availability_status_rhythm) :- consistent(s10, availability_status_rhythm).

evidence(all_consistent(availability_status_rhythm)).
query(true_val(availability_status_rhythm, available)).
query(true_val(availability_status_rhythm, unk_availability_status_rhythm)).

0.93::acc(s33, available_colors).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values cinelli_collab=Phase_x_Cinelli_limited_edition unk_available_colors=Unknown
% @importance 0.5

0.90::true_val(available_colors, cinelli_collab); 0.10::true_val(available_colors, unk_available_colors).

measured(s33, available_colors, cinelli_collab).

all_consistent(available_colors) :- consistent(s33, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, cinelli_collab)).
query(true_val(available_colors, unk_available_colors)).

0.78::acc(s34, availability_status_cinelli).

% @attr availability_status_cinelli
% @type categorical
% @canonical false
% @original_name availability_status Cinelli limited
% @values limited_offering=Limited_offering unk_availability_status_cinelli=Unknown
% @importance 0.45

0.68::true_val(availability_status_cinelli, limited_offering); 0.32::true_val(availability_status_cinelli, unk_availability_status_cinelli).

measured(s34, availability_status_cinelli, limited_offering).

all_consistent(availability_status_cinelli) :- consistent(s34, availability_status_cinelli).

evidence(all_consistent(availability_status_cinelli)).
query(true_val(availability_status_cinelli, limited_offering)).
query(true_val(availability_status_cinelli, unk_availability_status_cinelli)).

0.78::acc(s35, available_colors_motorhead).
0.60::acc(s22, available_colors_motorhead).

% @attr available_colors_motorhead
% @type categorical
% @canonical false
% @original_name available_colors Motorhead
% @values motorhead_collab=Phase_x_Motorhead_2027_with_matching_bindings_boots unk_available_colors_motorhead=Unknown
% @importance 0.5

0.90::true_val(available_colors_motorhead, motorhead_collab); 0.10::true_val(available_colors_motorhead, unk_available_colors_motorhead).

measured(s35, available_colors_motorhead, motorhead_collab).
measured(s22, available_colors_motorhead, motorhead_collab).

all_consistent(available_colors_motorhead) :-
    consistent(s35, available_colors_motorhead),
    consistent(s22, available_colors_motorhead).

evidence(all_consistent(available_colors_motorhead)).
query(true_val(available_colors_motorhead, motorhead_collab)).
query(true_val(available_colors_motorhead, unk_available_colors_motorhead)).

0.90::acc(s36, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.8

0.86::true_val(warranty_period_years, v2); 0.14::true_val(warranty_period_years, unk_warranty_period_years).

measured(s36, warranty_period_years, v2).

all_consistent(warranty_period_years) :- consistent(s36, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.90::acc(s36, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values defects_material_workmanship=Defects_in_material_and_workmanship_original_purchaser unk_warranty=Unknown
% @importance 0.8

0.86::true_val(warranty, defects_material_workmanship); 0.14::true_val(warranty, unk_warranty).

measured(s36, warranty, defects_material_workmanship).

all_consistent(warranty) :- consistent(s36, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, defects_material_workmanship)).
query(true_val(warranty, unk_warranty)).

0.90::acc(s36, warranty_exclusion).

% @attr warranty_exclusion
% @type categorical
% @canonical false
% @original_name Warranty not valid for non-authorized dealers
% @values no_ebay_unauthorized=Not_valid_from_non_authorized_or_eBay unk_warranty_exclusion=Unknown
% @importance 0.8

0.86::true_val(warranty_exclusion, no_ebay_unauthorized); 0.14::true_val(warranty_exclusion, unk_warranty_exclusion).

measured(s36, warranty_exclusion, no_ebay_unauthorized).

all_consistent(warranty_exclusion) :- consistent(s36, warranty_exclusion).

evidence(all_consistent(warranty_exclusion)).
query(true_val(warranty_exclusion, no_ebay_unauthorized)).
query(true_val(warranty_exclusion, unk_warranty_exclusion)).

0.88::acc(s37, return_policy_terms).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values day14_unused_tagged=14_day_return_unused_tagged_from_Foundry unk_return_policy_terms=Unknown
% @importance 0.6

0.81::true_val(return_policy_terms, day14_unused_tagged); 0.19::true_val(return_policy_terms, unk_return_policy_terms).

measured(s37, return_policy_terms, day14_unused_tagged).

all_consistent(return_policy_terms) :- consistent(s37, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, day14_unused_tagged)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

0.72::acc(s3, skill_level_recommendation).
0.78::acc(s11, skill_level_recommendation).
0.72::acc(s29, skill_level_recommendation).
0.85::acc(s1, skill_level_recommendation).
0.72::acc(s24, skill_level_recommendation).
0.62::acc(s31, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate=Intermediate intermediate_advanced=Intermediate_Advanced
% @importance 0.78

0.35::true_val(skill_level_recommendation, intermediate); 0.65::true_val(skill_level_recommendation, intermediate_advanced).

measured(s3, skill_level_recommendation, intermediate).
measured(s11, skill_level_recommendation, intermediate_advanced).
measured(s29, skill_level_recommendation, intermediate_advanced).
measured(s1, skill_level_recommendation, intermediate_advanced).
measured(s24, skill_level_recommendation, intermediate_advanced).
measured(s31, skill_level_recommendation, intermediate_advanced).

all_consistent(skill_level_recommendation) :-
    consistent(s1, skill_level_recommendation),
    consistent(s11, skill_level_recommendation),
    consistent(s29, skill_level_recommendation),
    consistent(s24, skill_level_recommendation),
    consistent(s31, skill_level_recommendation),
    (indep(s3), consistent(s3, skill_level_recommendation) ; \+indep(s3)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate)).
query(true_val(skill_level_recommendation, intermediate_advanced)).

0.65::acc(s17, carving_rating_tgr).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values carves_clean_floats_pops=Carves_clean_floats_fresh_snow_pops_side_hits unk_carving_rating_tgr=Unknown
% @importance 0.75

0.60::true_val(carving_rating_tgr, carves_clean_floats_pops); 0.40::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s17, carving_rating_tgr, carves_clean_floats_pops).

all_consistent(carving_rating_tgr) :- consistent(s17, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, carves_clean_floats_pops)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

0.90::acc(s1, positive_aspect).
0.72::acc(s24, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values versatile_daily_snowboard=Versatile_daily_snowboard unk_positive_aspect=Unknown
% @importance 0.9

0.95::true_val(positive_aspect, versatile_daily_snowboard); 0.05::true_val(positive_aspect, unk_positive_aspect).

measured(s1, positive_aspect, versatile_daily_snowboard).
measured(s24, positive_aspect, versatile_daily_snowboard).

all_consistent(positive_aspect) :-
    consistent(s1, positive_aspect),
    consistent(s24, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, versatile_daily_snowboard)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.72::acc(s29, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values nitro_rambler=Nitro_Rambler_bindings unk_binding_compatibility=Unknown
% @importance 0.75

0.64::true_val(binding_compatibility, nitro_rambler); 0.36::true_val(binding_compatibility, unk_binding_compatibility).

measured(s29, binding_compatibility, nitro_rambler).

all_consistent(binding_compatibility) :- consistent(s29, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, nitro_rambler)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.55::acc(s38, bomb_hole_review).

% @attr bomb_hole_review
% @type categorical
% @canonical false
% @original_name Bomb Hole review
% @values seth_huot_tech_breakdown=Seth_Huot_full_tech_breakdown_2026 unk_bomb_hole_review=Unknown
% @importance 0.7

0.45::true_val(bomb_hole_review, seth_huot_tech_breakdown); 0.55::true_val(bomb_hole_review, unk_bomb_hole_review).

measured(s38, bomb_hole_review, seth_huot_tech_breakdown).

all_consistent(bomb_hole_review) :- consistent(s38, bomb_hole_review).

evidence(all_consistent(bomb_hole_review)).
query(true_val(bomb_hole_review, seth_huot_tech_breakdown)).
query(true_val(bomb_hole_review, unk_bomb_hole_review)).

0.72::acc(s29, absolute_snow_assessment).

% @attr absolute_snow_assessment
% @type categorical
% @canonical false
% @original_name Absolute Snow assessment
% @values reliable_versatile_great_price=Ideal_reliable_versatile_great_price_point unk_absolute_snow_assessment=Unknown
% @importance 0.75

0.64::true_val(absolute_snow_assessment, reliable_versatile_great_price); 0.36::true_val(absolute_snow_assessment, unk_absolute_snow_assessment).

measured(s29, absolute_snow_assessment, reliable_versatile_great_price).

all_consistent(absolute_snow_assessment) :- consistent(s29, absolute_snow_assessment).

evidence(all_consistent(absolute_snow_assessment)).
query(true_val(absolute_snow_assessment, reliable_versatile_great_price)).
query(true_val(absolute_snow_assessment, unk_absolute_snow_assessment)).

0.70::acc(s21, melbourne_snowboard_assessment).

% @attr melbourne_snowboard_assessment
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre assessment
% @values preorder_highlighted=2027_collection_preorder_Phase_highlighted unk_melbourne_snowboard_assessment=Unknown
% @importance 0.6

0.60::true_val(melbourne_snowboard_assessment, preorder_highlighted); 0.40::true_val(melbourne_snowboard_assessment, unk_melbourne_snowboard_assessment).

measured(s21, melbourne_snowboard_assessment, preorder_highlighted).

all_consistent(melbourne_snowboard_assessment) :- consistent(s21, melbourne_snowboard_assessment).

evidence(all_consistent(melbourne_snowboard_assessment)).
query(true_val(melbourne_snowboard_assessment, preorder_highlighted)).
query(true_val(melbourne_snowboard_assessment, unk_melbourne_snowboard_assessment)).

0.78::acc(s8, phase_vs_alternator_positioning).

% @attr phase_vs_alternator_positioning
% @type categorical
% @canonical false
% @original_name Phase positioned below Alternator
% @values affordable_cruiser_below_alternator=Phase_affordable_AM_cruiser_Alternator_higher_end unk_phase_vs_alternator_positioning=Unknown
% @importance 0.85

0.72::true_val(phase_vs_alternator_positioning, affordable_cruiser_below_alternator); 0.28::true_val(phase_vs_alternator_positioning, unk_phase_vs_alternator_positioning).

measured(s8, phase_vs_alternator_positioning, affordable_cruiser_below_alternator).

all_consistent(phase_vs_alternator_positioning) :- consistent(s8, phase_vs_alternator_positioning).

evidence(all_consistent(phase_vs_alternator_positioning)).
query(true_val(phase_vs_alternator_positioning, affordable_cruiser_below_alternator)).
query(true_val(phase_vs_alternator_positioning, unk_phase_vs_alternator_positioning)).

0.68::acc(s39, alternator_specs_comparison).

% @attr alternator_specs_comparison
% @type categorical
% @canonical false
% @original_name Nitro Alternator specs comparison
% @values true_camber_powerlite_carbon_sintered=True_Camber_PowerLite_Carbon_VTape_Sintered_SpeedII unk_alternator_specs_comparison=Unknown
% @importance 0.7

0.53::true_val(alternator_specs_comparison, true_camber_powerlite_carbon_sintered); 0.47::true_val(alternator_specs_comparison, unk_alternator_specs_comparison).

measured(s39, alternator_specs_comparison, true_camber_powerlite_carbon_sintered).

all_consistent(alternator_specs_comparison) :- consistent(s39, alternator_specs_comparison).

evidence(all_consistent(alternator_specs_comparison)).
query(true_val(alternator_specs_comparison, true_camber_powerlite_carbon_sintered)).
query(true_val(alternator_specs_comparison, unk_alternator_specs_comparison)).

0.85::acc(s18, nitro_team_comparison).

% @attr nitro_team_comparison
% @type categorical
% @canonical false
% @original_name Nitro Team comparison
% @values dir_twin_true_camber_579_95=Directional_Twin_True_Camber_Dual_Degressive_MSRP_579_95 unk_nitro_team_comparison=Unknown
% @importance 0.95

0.72::true_val(nitro_team_comparison, dir_twin_true_camber_579_95); 0.28::true_val(nitro_team_comparison, unk_nitro_team_comparison).

measured(s18, nitro_team_comparison, dir_twin_true_camber_579_95).

all_consistent(nitro_team_comparison) :- consistent(s18, nitro_team_comparison).

evidence(all_consistent(nitro_team_comparison)).
query(true_val(nitro_team_comparison, dir_twin_true_camber_579_95)).
query(true_val(nitro_team_comparison, unk_nitro_team_comparison)).

0.85::acc(s18, nitro_team_pro_comparison).

% @attr nitro_team_pro_comparison
% @type categorical
% @canonical false
% @original_name Nitro Team Pro comparison
% @values pro_caliber_629_95=Pro_caliber_more_pop_control_MSRP_629_95 unk_nitro_team_pro_comparison=Unknown
% @importance 0.95

0.72::true_val(nitro_team_pro_comparison, pro_caliber_629_95); 0.28::true_val(nitro_team_pro_comparison, unk_nitro_team_pro_comparison).

measured(s18, nitro_team_pro_comparison, pro_caliber_629_95).

all_consistent(nitro_team_pro_comparison) :- consistent(s18, nitro_team_pro_comparison).

evidence(all_consistent(nitro_team_pro_comparison)).
query(true_val(nitro_team_pro_comparison, pro_caliber_629_95)).
query(true_val(nitro_team_pro_comparison, unk_nitro_team_pro_comparison)).

0.58::acc(s40, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_mountain_twin=Jones_Mountain_Twin_best_for_most_resort_riders unk_comparable_board_cross_brand=Unknown
% @importance 0.65

0.39::true_val(comparable_board_cross_brand, jones_mountain_twin); 0.61::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s40, comparable_board_cross_brand, jones_mountain_twin).

all_consistent(comparable_board_cross_brand) :- consistent(s40, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.58::acc(s40, comparable_board_cross_brand_capita).

% @attr comparable_board_cross_brand_capita
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand CAPiTA DOA
% @values capita_doa=CAPiTA_DOA_463_96_hybrid_camber_AM_freestyle unk_comparable_board_cross_brand_capita=Unknown
% @importance 0.65

0.39::true_val(comparable_board_cross_brand_capita, capita_doa); 0.61::true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita).

measured(s40, comparable_board_cross_brand_capita, capita_doa).

all_consistent(comparable_board_cross_brand_capita) :- consistent(s40, comparable_board_cross_brand_capita).

evidence(all_consistent(comparable_board_cross_brand_capita)).
query(true_val(comparable_board_cross_brand_capita, capita_doa)).
query(true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita)).

0.58::acc(s40, comparable_board_cross_brand_libtech).

% @attr comparable_board_cross_brand_libtech
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand Lib Tech dPr
% @values libtech_dpr=Lib_Tech_dPr_best_performance_low_price_AM unk_comparable_board_cross_brand_libtech=Unknown
% @importance 0.65

0.39::true_val(comparable_board_cross_brand_libtech, libtech_dpr); 0.61::true_val(comparable_board_cross_brand_libtech, unk_comparable_board_cross_brand_libtech).

measured(s40, comparable_board_cross_brand_libtech, libtech_dpr).

all_consistent(comparable_board_cross_brand_libtech) :- consistent(s40, comparable_board_cross_brand_libtech).

evidence(all_consistent(comparable_board_cross_brand_libtech)).
query(true_val(comparable_board_cross_brand_libtech, libtech_dpr)).
query(true_val(comparable_board_cross_brand_libtech, unk_comparable_board_cross_brand_libtech)).

0.75::acc(s41, comparable_board_cross_brand_salomon).

% @attr comparable_board_cross_brand_salomon
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand Salomon Dancehaul
% @values salomon_dancehaul=Salomon_Dancehaul_549_95_all_mountain unk_comparable_board_cross_brand_salomon=Unknown
% @importance 0.7

0.56::true_val(comparable_board_cross_brand_salomon, salomon_dancehaul); 0.44::true_val(comparable_board_cross_brand_salomon, unk_comparable_board_cross_brand_salomon).

measured(s41, comparable_board_cross_brand_salomon, salomon_dancehaul).

all_consistent(comparable_board_cross_brand_salomon) :- consistent(s41, comparable_board_cross_brand_salomon).

evidence(all_consistent(comparable_board_cross_brand_salomon)).
query(true_val(comparable_board_cross_brand_salomon, salomon_dancehaul)).
query(true_val(comparable_board_cross_brand_salomon, unk_comparable_board_cross_brand_salomon)).

0.75::acc(s41, comparable_board_cross_brand_burton).

% @attr comparable_board_cross_brand_burton
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand Burton Counterbalance
% @values burton_counterbalance=Burton_Counterbalance_Camber_659_95_all_mountain unk_comparable_board_cross_brand_burton=Unknown
% @importance 0.7

0.56::true_val(comparable_board_cross_brand_burton, burton_counterbalance); 0.44::true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton).

measured(s41, comparable_board_cross_brand_burton, burton_counterbalance).

all_consistent(comparable_board_cross_brand_burton) :- consistent(s41, comparable_board_cross_brand_burton).

evidence(all_consistent(comparable_board_cross_brand_burton)).
query(true_val(comparable_board_cross_brand_burton, burton_counterbalance)).
query(true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton)).

0.82::acc(s18, phase_price_advantage).
0.75::acc(s41, phase_price_advantage).

% @attr phase_price_advantage
% @type categorical
% @canonical false
% @original_name Phase has lower price point than most competitors
% @values lower_than_competitors=Lower_price_than_most_named_AM_competitors unk_phase_price_advantage=Unknown
% @importance 0.825

0.95::true_val(phase_price_advantage, lower_than_competitors); 0.05::true_val(phase_price_advantage, unk_phase_price_advantage).

measured(s18, phase_price_advantage, lower_than_competitors).
measured(s41, phase_price_advantage, lower_than_competitors).

all_consistent(phase_price_advantage) :-
    consistent(s18, phase_price_advantage),
    consistent(s41, phase_price_advantage).

evidence(all_consistent(phase_price_advantage)).
query(true_val(phase_price_advantage, lower_than_competitors)).
query(true_val(phase_price_advantage, unk_phase_price_advantage)).

0.75::acc(s7, brand_reputation_source).

% @attr brand_reputation_source
% @type categorical
% @canonical false
% @original_name Brand reputation Boardsport SOURCE
% @values authentic_independent_market_leader=Authentic_independent_brand_market_leader unk_brand_reputation_source=Unknown
% @importance 0.55

0.68::true_val(brand_reputation_source, authentic_independent_market_leader); 0.32::true_val(brand_reputation_source, unk_brand_reputation_source).

measured(s7, brand_reputation_source, authentic_independent_market_leader).

all_consistent(brand_reputation_source) :- consistent(s7, brand_reputation_source).

evidence(all_consistent(brand_reputation_source)).
query(true_val(brand_reputation_source, authentic_independent_market_leader)).
query(true_val(brand_reputation_source, unk_brand_reputation_source)).

0.65::acc(s42, brand_reputation_bombhole).

% @attr brand_reputation_bombhole
% @type categorical
% @canonical false
% @original_name Brand reputation Bomb Hole sponsor
% @values sponsor_of_bombhole=Nitro_sponsors_Bomb_Hole_Podcast unk_brand_reputation_bombhole=Unknown
% @importance 0.4

0.49::true_val(brand_reputation_bombhole, sponsor_of_bombhole); 0.51::true_val(brand_reputation_bombhole, unk_brand_reputation_bombhole).

measured(s42, brand_reputation_bombhole, sponsor_of_bombhole).

all_consistent(brand_reputation_bombhole) :- consistent(s42, brand_reputation_bombhole).

evidence(all_consistent(brand_reputation_bombhole)).
query(true_val(brand_reputation_bombhole, sponsor_of_bombhole)).
query(true_val(brand_reputation_bombhole, unk_brand_reputation_bombhole)).

0.75::acc(s7, brand_market_position).

% @attr brand_market_position
% @type categorical
% @canonical false
% @original_name Brand market position
% @values growth_north_america=Experienced_growth_in_North_America_2024_25 unk_brand_market_position=Unknown
% @importance 0.55

0.68::true_val(brand_market_position, growth_north_america); 0.32::true_val(brand_market_position, unk_brand_market_position).

measured(s7, brand_market_position, growth_north_america).

all_consistent(brand_market_position) :- consistent(s7, brand_market_position).

evidence(all_consistent(brand_market_position)).
query(true_val(brand_market_position, growth_north_america)).
query(true_val(brand_market_position, unk_brand_market_position)).

0.68::acc(s43, brand_innovation_history).

% @attr brand_innovation_history
% @type categorical
% @canonical false
% @original_name Brand history of innovation
% @values first_asym_twin_first_womens_pro=First_asymmetrical_twin_tip_first_womens_pro_model unk_brand_innovation_history=Unknown
% @importance 0.4

0.56::true_val(brand_innovation_history, first_asym_twin_first_womens_pro); 0.44::true_val(brand_innovation_history, unk_brand_innovation_history).

measured(s43, brand_innovation_history, first_asym_twin_first_womens_pro).

all_consistent(brand_innovation_history) :- consistent(s43, brand_innovation_history).

evidence(all_consistent(brand_innovation_history)).
query(true_val(brand_innovation_history, first_asym_twin_first_womens_pro)).
query(true_val(brand_innovation_history, unk_brand_innovation_history)).

0.65::acc(s44, brand_design_years).

% @attr brand_design_years
% @type categorical
% @canonical false
% @original_name Nitro has over 35 years of snowboard design
% @values over_35_years=Over_35_years_of_snowboard_design unk_brand_design_years=Unknown
% @importance 0.35

0.49::true_val(brand_design_years, over_35_years); 0.51::true_val(brand_design_years, unk_brand_design_years).

measured(s44, brand_design_years, over_35_years).

all_consistent(brand_design_years) :- consistent(s44, brand_design_years).

evidence(all_consistent(brand_design_years)).
query(true_val(brand_design_years, over_35_years)).
query(true_val(brand_design_years, unk_brand_design_years)).

0.93::acc(s1, construction_material_innovation).
0.68::acc(s39, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values no_carbon_reinforcement=No_carbon_reinforcement_unlike_Alternator unk_construction_material_innovation=Unknown
% @importance 0.85

0.95::true_val(construction_material_innovation, no_carbon_reinforcement); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, no_carbon_reinforcement).
measured(s39, construction_material_innovation, no_carbon_reinforcement).

all_consistent(construction_material_innovation) :-
    consistent(s1, construction_material_innovation),
    consistent(s39, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, no_carbon_reinforcement)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.68::acc(s39, no_koroyd_damping).

% @attr no_koroyd_damping
% @type categorical
% @canonical false
% @original_name No Koroyd damping in Phase
% @values no_koroyd=No_Koroyd_damping_unlike_Alternator unk_no_koroyd_damping=Unknown
% @importance 0.7

0.53::true_val(no_koroyd_damping, no_koroyd); 0.47::true_val(no_koroyd_damping, unk_no_koroyd_damping).

measured(s39, no_koroyd_damping, no_koroyd).

all_consistent(no_koroyd_damping) :- consistent(s39, no_koroyd_damping).

evidence(all_consistent(no_koroyd_damping)).
query(true_val(no_koroyd_damping, no_koroyd)).
query(true_val(no_koroyd_damping, unk_no_koroyd_damping)).

0.93::acc(s1, core_grade_distinction).
0.88::acc(s14, core_grade_distinction).

% @attr core_grade_distinction
% @type categorical
% @canonical false
% @original_name Phase uses PowerCore not PowerLite
% @values powercore_standard_poplar=PowerCore_standard_poplar_not_PowerLite_ultra_lightweight unk_core_grade_distinction=Unknown
% @importance 0.825

0.95::true_val(core_grade_distinction, powercore_standard_poplar); 0.05::true_val(core_grade_distinction, unk_core_grade_distinction).

measured(s1, core_grade_distinction, powercore_standard_poplar).
measured(s14, core_grade_distinction, powercore_standard_poplar).

all_consistent(core_grade_distinction) :-
    consistent(s1, core_grade_distinction),
    consistent(s14, core_grade_distinction).

evidence(all_consistent(core_grade_distinction)).
query(true_val(core_grade_distinction, powercore_standard_poplar)).
query(true_val(core_grade_distinction, unk_core_grade_distinction)).

0.90::acc(s1, shape_description).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape description
% @values mother_of_all_shapes=The_mother_of_all_snowboard_shapes_purposeful_focused unk_shape_description=Unknown
% @importance 1.0

0.90::true_val(shape_description, mother_of_all_shapes); 0.10::true_val(shape_description, unk_shape_description).

measured(s1, shape_description, mother_of_all_shapes).

all_consistent(shape_description) :- consistent(s1, shape_description).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, mother_of_all_shapes)).
query(true_val(shape_description, unk_shape_description)).