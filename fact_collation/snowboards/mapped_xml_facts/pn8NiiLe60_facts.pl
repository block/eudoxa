0.85::acc(s1, brand).
0.88::acc(s2, brand).
0.85::acc(s1, model_name).
0.85::acc(s1, full_product_name).
0.85::acc(s1, model_series).
0.70::acc(s3, model_series).
0.85::acc(s1, model_year).
0.82::acc(s4, model_first_available_year).
0.93::acc(s5, manufacturer).
0.93::acc(s5, eu_representative).
0.90::acc(s6, founding_year).
0.90::acc(s6, founders).
0.93::acc(s7, founding_location).
0.82::acc(s4, brand_philosophy).
0.82::acc(s8, company_type).
0.72::acc(s9, product_development_headquarters).
0.93::acc(s5, company_headquarters_registered).
0.60::acc(s10, company_headquarters_registered).
0.88::acc(s11, north_american_distribution).
0.93::acc(s12, australian_distribution).
0.55::acc(s13, canadian_distribution).
0.82::acc(s14, direct_to_consumer_policy).
0.70::acc(s15, brand_heritage).
0.82::acc(s4, design_inspiration).
0.70::acc(s16, predecessor_model_name).
0.90::acc(s17, quiver_series_season_count).
0.90::acc(s17, pro_rider_name).
0.85::acc(s1, riding_style).
0.85::acc(s1, terrain_suitability).
0.85::acc(s1, use_case).
0.85::acc(s1, overall_length).
0.85::acc(s1, available_sizes).
0.85::acc(s1, contact_length_size).
0.85::acc(s1, tip_tail_width_size).
0.85::acc(s1, tail_width_size).
0.85::acc(s1, waist_width_159).
0.85::acc(s1, sidecut_radius_size).
0.85::acc(s1, setback).
0.85::acc(s1, recommended_weight_range_size).
0.85::acc(s1, width_options).
0.85::acc(s1, shape).
0.85::acc(s1, camber_type).
0.85::acc(s1, flex_rating_10).
0.78::acc(s18, flex_rating_10).
0.85::acc(s1, rider_level).
0.85::acc(s1, board_category).
0.85::acc(s1, mounting_pattern).
0.85::acc(s1, gender).
0.85::acc(s1, core_material).
0.85::acc(s1, core_profile).
0.85::acc(s1, laminate).
0.85::acc(s1, sidewall_material).
0.85::acc(s1, base_material).
0.85::acc(s1, sustainability_certification).
0.85::acc(s1, edge_technology).
0.85::acc(s1, topsheet).
0.85::acc(s1, factory_wax).
0.85::acc(s1, resin).
0.85::acc(s1, sidecut_type).
0.85::acc(s1, ink_type).
0.82::acc(s19, ink_type).
0.85::acc(s1, sustainability_certification_fsc).
0.85::acc(s1, sustainability_certification_solar).
0.82::acc(s19, sustainability_certification_solar).
0.85::acc(s1, sustainability_certification_co2).
0.85::acc(s1, camber_description).
0.85::acc(s1, core_profile_benefits).
0.85::acc(s1, directional_shape_description).
0.85::acc(s1, directional_benefits).
0.85::acc(s1, progressive_sidecut_description).
0.85::acc(s1, responsive_torsional_flex).
0.75::acc(s20, standard_width_benefits).
0.85::acc(s1, flex_feel).
0.88::acc(s1, price_aud_merchant).
0.88::acc(s1, availability_status).
0.88::acc(s1, estimated_availability_date).
0.85::acc(s1, seller).
0.85::acc(s1, seller_reputation).
0.85::acc(s1, return_policy_terms).
0.40::acc(s_unverified, availability_other_retailers).
0.93::acc(s21, warranty_period_years).
0.93::acc(s21, warranty).
0.88::acc(s22, warranty_transferability).
0.88::acc(s22, warranty_claim_process).
0.82::acc(s19, recycled_materials).
0.82::acc(s23, base_upgrade_2627).
0.68::acc(s24, manufacturing_location_current).
0.50::acc(s25, manufacturing_location_current).
0.68::acc(s24, manufacturing_location_prior).
0.72::acc(s9, product_design_location).
0.55::acc(s26, product_design_location).
0.78::acc(s27, comparable_board_same_brand).
0.85::acc(s1, comparable_board_same_brand_comparison).
0.78::acc(s27, comparable_board_same_brand_comparison).
0.70::acc(s28, comparable_board_same_brand_others).
0.72::acc(s29, comparable_board_cross_brand).
0.55::acc(s30, comparable_board_cross_brand_korua_edge).
0.72::acc(s31, comparable_board_cross_brand_pencil).
0.72::acc(s32, comparable_board_cross_brand_trenchdigger).
0.62::acc(s33, comparable_board_cross_brand_flagship).
0.62::acc(s34, comparable_board_cross_brand_freecarver).
0.62::acc(s35, comparable_board_cross_brand_blade_plus).
0.55::acc(s36, comparable_board_cross_brand_cheater).
0.58::acc(s37, comparable_board_cross_brand_ns_west).
0.58::acc(s38, comparable_board_cross_brand_deep_daze).
0.58::acc(s38, comparable_board_cross_brand_lib_tech).
0.62::acc(s39, user_review_forum).
0.62::acc(s39, user_review_forum_switch).
0.70::acc(s16, reviewer_opinion_the_good_ride).
0.55::acc(s40, user_review_forum_eurocarving).
0.55::acc(s41, carving_board_advice_stranda).
0.60::acc(s42, carving_board_advice_general).
0.75::acc(s43, reviewer_opinion_whitelines).
0.48::acc(s44, user_review_forum_wide).
0.55::acc(s30, user_review_forum_korua).
0.85::acc(s1, mounting_pattern_benefits).
0.45::acc(s45, recommended_binding_stiffness).
0.85::acc(s1, specialization).
0.82::acc(s4, design_homage).
0.85::acc(s1, sustainability_certification_summary).
0.82::acc(s19, sustainability_certification_summary).

0.20::indep(s3).
0.15::indep(s10).
0.25::indep(s25).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nitro=Nitro unk_brand=Unknown
% @importance 0.70

0.95::true_val(brand, nitro); 0.05::true_val(brand, unk_brand).

measured(s1, brand, nitro).
measured(s2, brand, nitro).

all_consistent(brand) :-
    consistent(s1, brand),
    consistent(s2, brand).

evidence(all_consistent(brand)).
query(true_val(brand, nitro)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values mastercarve=Mastercarve unk_model_name=Unknown
% @importance 1.0

0.90::true_val(model_name, mastercarve); 0.10::true_val(model_name, unk_model_name).

measured(s1, model_name, mastercarve).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, mastercarve)).
query(true_val(model_name, unk_model_name)).

% @attr full_product_name
% @type categorical
% @canonical false
% @original_name Full product name
% @values nitro_quiver_mastercarve=Nitro_Quiver_Mastercarve unk_full_product_name=Unknown
% @importance 1.0

0.90::true_val(full_product_name, nitro_quiver_mastercarve); 0.10::true_val(full_product_name, unk_full_product_name).

measured(s1, full_product_name, nitro_quiver_mastercarve).

all_consistent(full_product_name) :- consistent(s1, full_product_name).

evidence(all_consistent(full_product_name)).
query(true_val(full_product_name, nitro_quiver_mastercarve)).
query(true_val(full_product_name, unk_full_product_name)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values quiver=Quiver unk_model_series=Unknown
% @importance 0.85

0.95::true_val(model_series, quiver); 0.05::true_val(model_series, unk_model_series).

measured(s1, model_series, quiver).
measured(s3, model_series, quiver).

all_consistent(model_series) :-
    consistent(s1, model_series),
    (indep(s3), consistent(s3, model_series) ; \+indep(s3)).

evidence(all_consistent(model_series)).
query(true_val(model_series, quiver)).
query(true_val(model_series, unk_model_series)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2027=2027 unk_model_year=Unknown
% @importance 1.0

0.90::true_val(model_year, v2027); 0.10::true_val(model_year, unk_model_year).

measured(s1, model_year, v2027).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, unk_model_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values new_fw_2026_27=New_FW_2026_27_first_year unk_model_first_available_year=Unknown
% @importance 0.85

0.85::true_val(model_first_available_year, new_fw_2026_27); 0.15::true_val(model_first_available_year, unk_model_first_available_year).

measured(s4, model_first_available_year, new_fw_2026_27).

all_consistent(model_first_available_year) :- consistent(s4, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, new_fw_2026_27)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values nitro_ag_hunenberg=Nitro_AG_Hunenberg_Switzerland unk_manufacturer=Unknown
% @importance 0.50

0.92::true_val(manufacturer, nitro_ag_hunenberg); 0.08::true_val(manufacturer, unk_manufacturer).

measured(s5, manufacturer, nitro_ag_hunenberg).

all_consistent(manufacturer) :- consistent(s5, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, nitro_ag_hunenberg)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr eu_representative
% @type categorical
% @canonical false
% @original_name EU representative
% @values nitro_dist_italia=Nitro_Distribution_Italia_Arco_TN unk_eu_representative=Unknown
% @importance 0.50

0.92::true_val(eu_representative, nitro_dist_italia); 0.08::true_val(eu_representative, unk_eu_representative).

measured(s5, eu_representative, nitro_dist_italia).

all_consistent(eu_representative) :- consistent(s5, eu_representative).

evidence(all_consistent(eu_representative)).
query(true_val(eu_representative, nitro_dist_italia)).
query(true_val(eu_representative, unk_eu_representative)).

% @attr founding_year
% @type numeric
% @canonical false
% @original_name Founding year
% @values v1990=1990 unk_founding_year=Unknown
% @importance 0.50

0.92::true_val(founding_year, v1990); 0.08::true_val(founding_year, unk_founding_year).

measured(s6, founding_year, v1990).

all_consistent(founding_year) :- consistent(s6, founding_year).

evidence(all_consistent(founding_year)).
query(true_val(founding_year, v1990)).
query(true_val(founding_year, unk_founding_year)).

% @attr founders
% @type categorical
% @canonical false
% @original_name Founders
% @values delago_ardelt=Thomas_Delago_and_Sepp_Ardelt unk_founders=Unknown
% @importance 0.50

0.92::true_val(founders, delago_ardelt); 0.08::true_val(founders, unk_founders).

measured(s6, founders, delago_ardelt).

all_consistent(founders) :- consistent(s6, founders).

evidence(all_consistent(founders)).
query(true_val(founders, delago_ardelt)).
query(true_val(founders, unk_founders)).

% @attr founding_location
% @type categorical
% @canonical false
% @original_name Founding location
% @values veras_cafe_ballard_seattle=Veras_Cafe_Ballard_Seattle_WA unk_founding_location=Unknown
% @importance 0.35

0.93::true_val(founding_location, veras_cafe_ballard_seattle); 0.07::true_val(founding_location, unk_founding_location).

measured(s7, founding_location, veras_cafe_ballard_seattle).

all_consistent(founding_location) :- consistent(s7, founding_location).

evidence(all_consistent(founding_location)).
query(true_val(founding_location, veras_cafe_ballard_seattle)).
query(true_val(founding_location, unk_founding_location)).

% @attr brand_philosophy
% @type categorical
% @canonical false
% @original_name Brand philosophy
% @values authenticity_riders_for_riders=Authenticity_and_independence_from_riders_for_riders unk_brand_philosophy=Unknown
% @importance 0.85

0.85::true_val(brand_philosophy, authenticity_riders_for_riders); 0.15::true_val(brand_philosophy, unk_brand_philosophy).

measured(s4, brand_philosophy, authenticity_riders_for_riders).

all_consistent(brand_philosophy) :- consistent(s4, brand_philosophy).

evidence(all_consistent(brand_philosophy)).
query(true_val(brand_philosophy, authenticity_riders_for_riders)).
query(true_val(brand_philosophy, unk_brand_philosophy)).

% @attr company_type
% @type categorical
% @canonical false
% @original_name Company type
% @values privately_owned_rider_operated=Privately_owned_rider_owner_operated unk_company_type=Unknown
% @importance 0.40

0.82::true_val(company_type, privately_owned_rider_operated); 0.18::true_val(company_type, unk_company_type).

measured(s8, company_type, privately_owned_rider_operated).

all_consistent(company_type) :- consistent(s8, company_type).

evidence(all_consistent(company_type)).
query(true_val(company_type, privately_owned_rider_operated)).
query(true_val(company_type, unk_company_type)).

% @attr product_development_headquarters
% @type categorical
% @canonical false
% @original_name Product development headquarters
% @values oberammergau_bavaria=Oberammergau_Bavaria_Germany unk_product_development_headquarters=Unknown
% @importance 0.35

0.78::true_val(product_development_headquarters, oberammergau_bavaria); 0.22::true_val(product_development_headquarters, unk_product_development_headquarters).

measured(s9, product_development_headquarters, oberammergau_bavaria).

all_consistent(product_development_headquarters) :- consistent(s9, product_development_headquarters).

evidence(all_consistent(product_development_headquarters)).
query(true_val(product_development_headquarters, oberammergau_bavaria)).
query(true_val(product_development_headquarters, unk_product_development_headquarters)).

% @attr company_headquarters_registered
% @type categorical
% @canonical false
% @original_name Company headquarters (registered)
% @values hunenberg_switzerland=Hunenberg_Switzerland unk_company_headquarters_registered=Unknown
% @importance 0.43

0.95::true_val(company_headquarters_registered, hunenberg_switzerland); 0.05::true_val(company_headquarters_registered, unk_company_headquarters_registered).

measured(s5, company_headquarters_registered, hunenberg_switzerland).
measured(s10, company_headquarters_registered, hunenberg_switzerland).

all_consistent(company_headquarters_registered) :-
    consistent(s5, company_headquarters_registered),
    (indep(s10), consistent(s10, company_headquarters_registered) ; \+indep(s10)).

evidence(all_consistent(company_headquarters_registered)).
query(true_val(company_headquarters_registered, hunenberg_switzerland)).
query(true_val(company_headquarters_registered, unk_company_headquarters_registered)).

% @attr north_american_distribution
% @type categorical
% @canonical false
% @original_name North American distribution
% @values foundry_slc=Foundry_Distribution_SLC_UT_84115 unk_north_american_distribution=Unknown
% @importance 0.30

0.88::true_val(north_american_distribution, foundry_slc); 0.12::true_val(north_american_distribution, unk_north_american_distribution).

measured(s11, north_american_distribution, foundry_slc).

all_consistent(north_american_distribution) :- consistent(s11, north_american_distribution).

evidence(all_consistent(north_american_distribution)).
query(true_val(north_american_distribution, foundry_slc)).
query(true_val(north_american_distribution, unk_north_american_distribution)).

% @attr australian_distribution
% @type categorical
% @canonical false
% @original_name Australian distribution
% @values blacklight_dingley=Blacklight_Distribution_Dingley_Village_VIC unk_australian_distribution=Unknown
% @importance 0.25

0.93::true_val(australian_distribution, blacklight_dingley); 0.07::true_val(australian_distribution, unk_australian_distribution).

measured(s12, australian_distribution, blacklight_dingley).

all_consistent(australian_distribution) :- consistent(s12, australian_distribution).

evidence(all_consistent(australian_distribution)).
query(true_val(australian_distribution, blacklight_dingley)).
query(true_val(australian_distribution, unk_australian_distribution)).

% @attr canadian_distribution
% @type categorical
% @canonical false
% @original_name Canadian distribution
% @values edmonton_alberta=Edmonton_Alberta unk_canadian_distribution=Unknown
% @importance 0.20

0.65::true_val(canadian_distribution, edmonton_alberta); 0.35::true_val(canadian_distribution, unk_canadian_distribution).

measured(s13, canadian_distribution, edmonton_alberta).

all_consistent(canadian_distribution) :- consistent(s13, canadian_distribution).

evidence(all_consistent(canadian_distribution)).
query(true_val(canadian_distribution, edmonton_alberta)).
query(true_val(canadian_distribution, unk_canadian_distribution)).

% @attr direct_to_consumer_policy
% @type categorical
% @canonical false
% @original_name Direct to consumer policy
% @values not_direct_authorized_only=Not_direct_authorized_retailers_only unk_direct_to_consumer_policy=Unknown
% @importance 0.60

0.82::true_val(direct_to_consumer_policy, not_direct_authorized_only); 0.18::true_val(direct_to_consumer_policy, unk_direct_to_consumer_policy).

measured(s14, direct_to_consumer_policy, not_direct_authorized_only).

all_consistent(direct_to_consumer_policy) :- consistent(s14, direct_to_consumer_policy).

evidence(all_consistent(direct_to_consumer_policy)).
query(true_val(direct_to_consumer_policy, not_direct_authorized_only)).
query(true_val(direct_to_consumer_policy, unk_direct_to_consumer_policy)).

% @attr brand_heritage
% @type categorical
% @canonical false
% @original_name Brand heritage
% @values over_35_years=Over_35_years_of_snowboard_design unk_brand_heritage=Unknown
% @importance 0.30

0.72::true_val(brand_heritage, over_35_years); 0.28::true_val(brand_heritage, unk_brand_heritage).

measured(s15, brand_heritage, over_35_years).

all_consistent(brand_heritage) :- consistent(s15, brand_heritage).

evidence(all_consistent(brand_heritage)).
query(true_val(brand_heritage, over_35_years)).
query(true_val(brand_heritage, unk_brand_heritage)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values late_80s_carving_pioneers=Late_80s_carving_pioneers_deep_sidecuts unk_design_inspiration=Unknown
% @importance 0.85

0.85::true_val(design_inspiration, late_80s_carving_pioneers); 0.15::true_val(design_inspiration, unk_design_inspiration).

measured(s4, design_inspiration, late_80s_carving_pioneers).

all_consistent(design_inspiration) :- consistent(s4, design_inspiration).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, late_80s_carving_pioneers)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values woodcarver_discontinued_2122=Woodcarver_discontinued_after_2021_22 unk_predecessor_model_name=Unknown
% @importance 0.60

0.75::true_val(predecessor_model_name, woodcarver_discontinued_2122); 0.25::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s16, predecessor_model_name, woodcarver_discontinued_2122).

all_consistent(predecessor_model_name) :- consistent(s16, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, woodcarver_discontinued_2122)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr quiver_series_season_count
% @type categorical
% @canonical false
% @original_name Quiver series season count
% @values tenth_season=10th_season unk_quiver_series_season_count=Unknown
% @importance 0.40

0.92::true_val(quiver_series_season_count, tenth_season); 0.08::true_val(quiver_series_season_count, unk_quiver_series_season_count).

measured(s17, quiver_series_season_count, tenth_season).

all_consistent(quiver_series_season_count) :- consistent(s17, quiver_series_season_count).

evidence(all_consistent(quiver_series_season_count)).
query(true_val(quiver_series_season_count, tenth_season)).
query(true_val(quiver_series_season_count, unk_quiver_series_season_count)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values bryan_fox=Bryan_Fox unk_pro_rider_name=Unknown
% @importance 0.40

0.92::true_val(pro_rider_name, bryan_fox); 0.08::true_val(pro_rider_name, unk_pro_rider_name).

measured(s17, pro_rider_name, bryan_fox).

all_consistent(pro_rider_name) :- consistent(s17, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, bryan_fox)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values carving=Carving unk_riding_style=Unknown
% @importance 1.0

0.90::true_val(riding_style, carving); 0.10::true_val(riding_style, unk_riding_style).

measured(s1, riding_style, carving).

all_consistent(riding_style) :- consistent(s1, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, carving)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values groomed_carving=Groomed_runs_carving unk_terrain_suitability=Unknown
% @importance 1.0

0.90::true_val(terrain_suitability, groomed_carving); 0.10::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, groomed_carving).

all_consistent(terrain_suitability) :- consistent(s1, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, groomed_carving)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr use_case
% @type categorical
% @canonical false
% @original_name Use case
% @values dedicated_carving=Dedicated_carving_board unk_use_case=Unknown
% @importance 1.0

0.90::true_val(use_case, dedicated_carving); 0.10::true_val(use_case, unk_use_case).

measured(s1, use_case, dedicated_carving).

all_consistent(use_case) :- consistent(s1, use_case).

evidence(all_consistent(use_case)).
query(true_val(use_case, dedicated_carving)).
query(true_val(use_case, unk_use_case)).

% @attr overall_length
% @type numeric
% @canonical false
% @unit cm
% @original_name Overall length
% @values v159=159.0
% @importance 1.0

0.90::true_val(overall_length, v159); 0.10::true_val(overall_length, unk_overall_length).

measured(s1, overall_length, v159).

all_consistent(overall_length) :- consistent(s1, overall_length).

evidence(all_consistent(overall_length)).
query(true_val(overall_length, v159)).
query(true_val(overall_length, unk_overall_length)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values v159_only=159cm_only_single_size unk_available_sizes=Unknown
% @importance 1.0

0.90::true_val(available_sizes, v159_only); 0.10::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, v159_only).

all_consistent(available_sizes) :- consistent(s1, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, v159_only)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @unit cm
% @original_name contact_length_size
% @values v123_0=123.0 unk_contact_length_size=Unknown
% @importance 1.0

0.90::true_val(contact_length_size, v123_0); 0.10::true_val(contact_length_size, unk_contact_length_size).

measured(s1, contact_length_size, v123_0).

all_consistent(contact_length_size) :- consistent(s1, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v123_0)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @unit cm
% @original_name tip_tail_width_size
% @values v31_7=31.7 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.90::true_val(tip_tail_width_size, v31_7); 0.10::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v31_7).

all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v31_7)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tail_width_size
% @type numeric
% @canonical false
% @unit cm
% @original_name tip_tail_width_size (tail)
% @values v31_5=31.5 unk_tail_width_size=Unknown
% @importance 1.0

0.90::true_val(tail_width_size, v31_5); 0.10::true_val(tail_width_size, unk_tail_width_size).

measured(s1, tail_width_size, v31_5).

all_consistent(tail_width_size) :- consistent(s1, tail_width_size).

evidence(all_consistent(tail_width_size)).
query(true_val(tail_width_size, v31_5)).
query(true_val(tail_width_size, unk_tail_width_size)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @unit cm
% @original_name Waist width (159cm)
% @values v25_5=25.5 unk_waist_width_159=Unknown
% @importance 1.0

0.90::true_val(waist_width_159, v25_5); 0.10::true_val(waist_width_159, unk_waist_width_159).

measured(s1, waist_width_159, v25_5).

all_consistent(waist_width_159) :- consistent(s1, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_5)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr sidecut_radius_size
% @type categorical
% @canonical true
% @unit m
% @original_name sidecut_radius_size
% @values v7_2_5_8=7.2m_nose_5.8m_tail_progressive unk_sidecut_radius_size=Unknown
% @importance 1.0

0.90::true_val(sidecut_radius_size, v7_2_5_8); 0.10::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v7_2_5_8).

all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_2_5_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr setback
% @type numeric
% @canonical true
% @unit cm
% @original_name setback
% @values v_neg1_5=-1.5 unk_setback=Unknown
% @importance 1.0

0.90::true_val(setback, v_neg1_5); 0.10::true_val(setback, unk_setback).

measured(s1, setback, v_neg1_5).

all_consistent(setback) :- consistent(s1, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v_neg1_5)).
query(true_val(setback, unk_setback)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @unit kg
% @original_name recommended_weight_range_size
% @values v60_plus=60+_kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.90::true_val(recommended_weight_range_size, v60_plus); 0.10::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, v60_plus).

all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v60_plus)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard=Standard unk_width_options=Unknown
% @importance 1.0

0.90::true_val(width_options, standard); 0.10::true_val(width_options, unk_width_options).

measured(s1, width_options, standard).

all_consistent(width_options) :- consistent(s1, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional=Directional unk_shape=Unknown
% @importance 1.0

0.90::true_val(shape, directional); 0.10::true_val(shape, unk_shape).

measured(s1, shape, directional).

all_consistent(shape) :- consistent(s1, shape).

evidence(all_consistent(shape)).
query(true_val(shape, directional)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values true_camber=True_Camber unk_camber_type=Unknown
% @importance 1.0

0.90::true_val(camber_type, true_camber); 0.10::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, true_camber).

all_consistent(camber_type) :- consistent(s1, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, true_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @unit /10
% @original_name flex_rating_10
% @values v9=9.0 unk_flex_rating_10=Unknown
% @importance 0.83

0.92::true_val(flex_rating_10, v9); 0.08::true_val(flex_rating_10, unk_flex_rating_10).

measured(s1, flex_rating_10, v9).
measured(s18, flex_rating_10, v9).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    consistent(s18, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v9)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced=Advanced unk_rider_level=Unknown
% @importance 1.0

0.90::true_val(rider_level, advanced); 0.10::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, advanced).

all_consistent(rider_level) :- consistent(s1, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr board_category
% @type categorical
% @canonical false
% @original_name board_category
% @values freeride_powder=Freeride_Powder_merchant_classification unk_board_category=Unknown
% @importance 1.0

0.90::true_val(board_category, freeride_powder); 0.10::true_val(board_category, unk_board_category).

measured(s1, board_category, freeride_powder).

all_consistent(board_category) :- consistent(s1, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, unk_board_category)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.90::true_val(mounting_pattern, inserts_2x4); 0.10::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.90::true_val(gender, mens); 0.10::true_val(gender, unk_gender).

measured(s1, gender, mens).

all_consistent(gender) :- consistent(s1, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values powercore_ii_poplar_beech=PowerCore_II_Poplar_Beech_stringers unk_core_material=Unknown
% @importance 1.0

0.90::true_val(core_material, powercore_ii_poplar_beech); 0.10::true_val(core_material, unk_core_material).

measured(s1, core_material, powercore_ii_poplar_beech).

all_consistent(core_material) :- consistent(s1, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, powercore_ii_poplar_beech)).
query(true_val(core_material, unk_core_material)).

% @attr core_profile
% @type categorical
% @canonical false
% @original_name Core profile
% @values standard_core_profile=Standard_Core_Profile_thicker_middle unk_core_profile=Unknown
% @importance 1.0

0.90::true_val(core_profile, standard_core_profile); 0.10::true_val(core_profile, unk_core_profile).

measured(s1, core_profile, standard_core_profile).

all_consistent(core_profile) :- consistent(s1, core_profile).

evidence(all_consistent(core_profile)).
query(true_val(core_profile, standard_core_profile)).
query(true_val(core_profile, unk_core_profile)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values tri_lite=Tri_Lite_Laminates_3_directions unk_laminate=Unknown
% @importance 1.0

0.90::true_val(laminate, tri_lite); 0.10::true_val(laminate, unk_laminate).

measured(s1, laminate, tri_lite).

all_consistent(laminate) :- consistent(s1, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_lite)).
query(true_val(laminate, unk_laminate)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_sidewall=ABS_Sidewall_flexible_impact_resistant unk_sidewall_material=Unknown
% @importance 1.0

0.90::true_val(sidewall_material, abs_sidewall); 0.10::true_val(sidewall_material, unk_sidewall_material).

measured(s1, sidewall_material, abs_sidewall).

all_consistent(sidewall_material) :- consistent(s1, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_sidewall)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_extruded_hd=Sintered_Extruded_HD_Base unk_base_material=Unknown
% @importance 1.0

0.90::true_val(base_material, sintered_extruded_hd); 0.10::true_val(base_material, unk_base_material).

measured(s1, base_material, sintered_extruded_hd).

all_consistent(base_material) :- consistent(s1, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_extruded_hd)).
query(true_val(base_material, unk_base_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values post_industrial_ptex_85=85_pct_post_industrial_Ptex unk_sustainability_certification=Unknown
% @importance 1.0

0.90::true_val(sustainability_certification, post_industrial_ptex_85); 0.10::true_val(sustainability_certification, unk_sustainability_certification).

measured(s1, sustainability_certification, post_industrial_ptex_85).

all_consistent(sustainability_certification) :- consistent(s1, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, post_industrial_ptex_85)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values recycled_steel_edge=Recycled_Steel_Edge unk_edge_technology=Unknown
% @importance 1.0

0.90::true_val(edge_technology, recycled_steel_edge); 0.10::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, recycled_steel_edge).

all_consistent(edge_technology) :- consistent(s1, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_steel_edge)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values ecoguard_90_recycled=EcoGuard_Topsheet_90pct_recycled unk_topsheet=Unknown
% @importance 1.0

0.90::true_val(topsheet, ecoguard_90_recycled); 0.10::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, ecoguard_90_recycled).

all_consistent(topsheet) :- consistent(s1, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, ecoguard_90_recycled)).
query(true_val(topsheet, unk_topsheet)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values green_speed_natural=Green_Speed_Natural_Wax_biodegradable unk_factory_wax=Unknown
% @importance 1.0

0.90::true_val(factory_wax, green_speed_natural); 0.10::true_val(factory_wax, unk_factory_wax).

measured(s1, factory_wax, green_speed_natural).

all_consistent(factory_wax) :- consistent(s1, factory_wax).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, green_speed_natural)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values ecopoxy_33=EcoPoxy_33_plant_vegetable_derived unk_resin=Unknown
% @importance 1.0

0.90::true_val(resin, ecopoxy_33); 0.10::true_val(resin, unk_resin).

measured(s1, resin, ecopoxy_33).

all_consistent(resin) :- consistent(s1, resin).

evidence(all_consistent(resin)).
query(true_val(resin, ecopoxy_33)).
query(true_val(resin, unk_resin)).

% @attr sidecut_type
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values progressive=Progressive_Sidecut unk_sidecut_type=Unknown
% @importance 1.0

0.90::true_val(sidecut_type, progressive); 0.10::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, progressive).

all_consistent(sidecut_type) :- consistent(s1, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr ink_type
% @type categorical
% @canonical false
% @original_name Ink type
% @values water_based=Water_based_inks unk_ink_type=Unknown
% @importance 0.78

0.93::true_val(ink_type, water_based); 0.07::true_val(ink_type, unk_ink_type).

measured(s1, ink_type, water_based).
measured(s19, ink_type, water_based).

all_consistent(ink_type) :-
    consistent(s1, ink_type),
    consistent(s19, ink_type).

evidence(all_consistent(ink_type)).
query(true_val(ink_type, water_based)).
query(true_val(ink_type, unk_ink_type)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_sourced=FSC_responsibly_sourced unk_sustainability_certification_fsc=Unknown
% @importance 1.0

0.90::true_val(sustainability_certification_fsc, fsc_sourced); 0.10::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s1, sustainability_certification_fsc, fsc_sourced).

all_consistent(sustainability_certification_fsc) :- consistent(s1, sustainability_certification_fsc).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_sourced)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr sustainability_certification_solar
% @type categorical
% @canonical false
% @original_name sustainability_certification (solar)
% @values solar_100=100pct_solar_energy_factory unk_sustainability_certification_solar=Unknown
% @importance 0.78

0.93::true_val(sustainability_certification_solar, solar_100); 0.07::true_val(sustainability_certification_solar, unk_sustainability_certification_solar).

measured(s1, sustainability_certification_solar, solar_100).
measured(s19, sustainability_certification_solar, solar_100).

all_consistent(sustainability_certification_solar) :-
    consistent(s1, sustainability_certification_solar),
    consistent(s19, sustainability_certification_solar).

evidence(all_consistent(sustainability_certification_solar)).
query(true_val(sustainability_certification_solar, solar_100)).
query(true_val(sustainability_certification_solar, unk_sustainability_certification_solar)).

% @attr sustainability_certification_co2
% @type numeric
% @canonical false
% @unit kg_CO2
% @original_name sustainability_certification (CO2)
% @values v32_2=32.2 unk_sustainability_certification_co2=Unknown
% @importance 1.0

0.90::true_val(sustainability_certification_co2, v32_2); 0.10::true_val(sustainability_certification_co2, unk_sustainability_certification_co2).

measured(s1, sustainability_certification_co2, v32_2).

all_consistent(sustainability_certification_co2) :- consistent(s1, sustainability_certification_co2).

evidence(all_consistent(sustainability_certification_co2)).
query(true_val(sustainability_certification_co2, v32_2)).
query(true_val(sustainability_certification_co2, unk_sustainability_certification_co2)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values original_camber_snap_response=Original_camber_strong_snap_powerful_response_terrain_tweaked unk_camber_description=Unknown
% @importance 1.0

0.90::true_val(camber_description, original_camber_snap_response); 0.10::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, original_camber_snap_response).

all_consistent(camber_description) :- consistent(s1, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, original_camber_snap_response)).
query(true_val(camber_description, unk_camber_description)).

% @attr core_profile_benefits
% @type categorical
% @canonical false
% @original_name Standard Core Profile delivers
% @values speed_stability_edge_control=Exceptional_speed_stability_edge_control unk_core_profile_benefits=Unknown
% @importance 1.0

0.90::true_val(core_profile_benefits, speed_stability_edge_control); 0.10::true_val(core_profile_benefits, unk_core_profile_benefits).

measured(s1, core_profile_benefits, speed_stability_edge_control).

all_consistent(core_profile_benefits) :- consistent(s1, core_profile_benefits).

evidence(all_consistent(core_profile_benefits)).
query(true_val(core_profile_benefits, speed_stability_edge_control)).
query(true_val(core_profile_benefits, unk_core_profile_benefits)).

% @attr directional_shape_description
% @type categorical
% @canonical false
% @original_name Directional shape description
% @values longer_nose_shorter_tail=Longer_nose_shorter_tail_one_direction unk_directional_shape_description=Unknown
% @importance 1.0

0.90::true_val(directional_shape_description, longer_nose_shorter_tail); 0.10::true_val(directional_shape_description, unk_directional_shape_description).

measured(s1, directional_shape_description, longer_nose_shorter_tail).

all_consistent(directional_shape_description) :- consistent(s1, directional_shape_description).

evidence(all_consistent(directional_shape_description)).
query(true_val(directional_shape_description, longer_nose_shorter_tail)).
query(true_val(directional_shape_description, unk_directional_shape_description)).

% @attr directional_benefits
% @type categorical
% @canonical false
% @original_name Directional benefits
% @values control_stability_float=Better_control_stability_float_powder_carving unk_directional_benefits=Unknown
% @importance 1.0

0.90::true_val(directional_benefits, control_stability_float); 0.10::true_val(directional_benefits, unk_directional_benefits).

measured(s1, directional_benefits, control_stability_float).

all_consistent(directional_benefits) :- consistent(s1, directional_benefits).

evidence(all_consistent(directional_benefits)).
query(true_val(directional_benefits, control_stability_float)).
query(true_val(directional_benefits, unk_directional_benefits)).

% @attr progressive_sidecut_description
% @type categorical
% @canonical false
% @original_name Progressive sidecut description
% @values larger_nose_tighter_tail=Larger_nose_catch_free_tighter_tail_accelerates unk_progressive_sidecut_description=Unknown
% @importance 1.0

0.90::true_val(progressive_sidecut_description, larger_nose_tighter_tail); 0.10::true_val(progressive_sidecut_description, unk_progressive_sidecut_description).

measured(s1, progressive_sidecut_description, larger_nose_tighter_tail).

all_consistent(progressive_sidecut_description) :- consistent(s1, progressive_sidecut_description).

evidence(all_consistent(progressive_sidecut_description)).
query(true_val(progressive_sidecut_description, larger_nose_tighter_tail)).
query(true_val(progressive_sidecut_description, unk_progressive_sidecut_description)).

% @attr responsive_torsional_flex
% @type categorical
% @canonical false
% @original_name Responsive torsional flex
% @values key_ride_characteristic=Key_ride_characteristic unk_responsive_torsional_flex=Unknown
% @importance 1.0

0.90::true_val(responsive_torsional_flex, key_ride_characteristic); 0.10::true_val(responsive_torsional_flex, unk_responsive_torsional_flex).

measured(s1, responsive_torsional_flex, key_ride_characteristic).

all_consistent(responsive_torsional_flex) :- consistent(s1, responsive_torsional_flex).

evidence(all_consistent(responsive_torsional_flex)).
query(true_val(responsive_torsional_flex, key_ride_characteristic)).
query(true_val(responsive_torsional_flex, unk_responsive_torsional_flex)).

% @attr standard_width_benefits
% @type categorical
% @canonical false
% @original_name Standard width boards deliver
% @values edge_quickness_responsiveness=Exceptional_edge_to_edge_quickness_responsiveness unk_standard_width_benefits=Unknown
% @importance 0.50

0.78::true_val(standard_width_benefits, edge_quickness_responsiveness); 0.22::true_val(standard_width_benefits, unk_standard_width_benefits).

measured(s20, standard_width_benefits, edge_quickness_responsiveness).

all_consistent(standard_width_benefits) :- consistent(s20, standard_width_benefits).

evidence(all_consistent(standard_width_benefits)).
query(true_val(standard_width_benefits, edge_quickness_responsiveness)).
query(true_val(standard_width_benefits, unk_standard_width_benefits)).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values precise_responsive_advanced=Precise_responsive_high_speed_steep_icy unk_flex_feel=Unknown
% @importance 1.0

0.90::true_val(flex_feel, precise_responsive_advanced); 0.10::true_val(flex_feel, unk_flex_feel).

measured(s1, flex_feel, precise_responsive_advanced).

all_consistent(flex_feel) :- consistent(s1, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, precise_responsive_advanced)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @unit AUD
% @original_name price_aud_merchant
% @values v999_99=999.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.88::true_val(price_aud_merchant, v999_99); 0.12::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s1, price_aud_merchant, v999_99).

all_consistent(price_aud_merchant) :- consistent(s1, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v999_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 1.0

0.88::true_val(availability_status, preorder); 0.12::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, preorder).

all_consistent(availability_status) :- consistent(s1, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values may_1_2026=May_1_2026 unk_estimated_availability_date=Unknown
% @importance 1.0

0.88::true_val(estimated_availability_date, may_1_2026); 0.12::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s1, estimated_availability_date, may_1_2026).

all_consistent(estimated_availability_date) :- consistent(s1, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr seller
% @type categorical
% @canonical false
% @original_name Seller
% @values melbourne_snowboard_centre=Melbourne_Snowboard_Centre_Preston_VIC unk_seller=Unknown
% @importance 1.0

0.90::true_val(seller, melbourne_snowboard_centre); 0.10::true_val(seller, unk_seller).

measured(s1, seller, melbourne_snowboard_centre).

all_consistent(seller) :- consistent(s1, seller).

evidence(all_consistent(seller)).
query(true_val(seller, melbourne_snowboard_centre)).
query(true_val(seller, unk_seller)).

% @attr seller_reputation
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre reputation
% @values established_independent=Established_independent_retailer_7days_free_shipping unk_seller_reputation=Unknown
% @importance 1.0

0.90::true_val(seller_reputation, established_independent); 0.10::true_val(seller_reputation, unk_seller_reputation).

measured(s1, seller_reputation, established_independent).

all_consistent(seller_reputation) :- consistent(s1, seller_reputation).

evidence(all_consistent(seller_reputation)).
query(true_val(seller_reputation, established_independent)).
query(true_val(seller_reputation, unk_seller_reputation)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values credit_exchange_30d_no_mounted=Store_credit_exchange_30d_no_refund_change_of_mind_no_mounted unk_return_policy_terms=Unknown
% @importance 1.0

0.90::true_val(return_policy_terms, credit_exchange_30d_no_mounted); 0.10::true_val(return_policy_terms, unk_return_policy_terms).

measured(s1, return_policy_terms, credit_exchange_30d_no_mounted).

all_consistent(return_policy_terms) :- consistent(s1, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, credit_exchange_30d_no_mounted)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr availability_other_retailers
% @type categorical
% @canonical false
% @original_name No other retailers currently found
% @values none_found_preorder_only=No_other_retailers_preorder_only unk_availability_other_retailers=Unknown
% @importance 0.30

0.50::true_val(availability_other_retailers, none_found_preorder_only); 0.50::true_val(availability_other_retailers, unk_availability_other_retailers).

measured(s_unverified, availability_other_retailers, none_found_preorder_only).

all_consistent(availability_other_retailers) :- consistent(s_unverified, availability_other_retailers).

evidence(all_consistent(availability_other_retailers)).
query(true_val(availability_other_retailers, none_found_preorder_only)).
query(true_val(availability_other_retailers, unk_availability_other_retailers)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @unit years
% @original_name warranty_period_years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.80

0.93::true_val(warranty_period_years, v2); 0.07::true_val(warranty_period_years, unk_warranty_period_years).

measured(s21, warranty_period_years, v2).

all_consistent(warranty_period_years) :- consistent(s21, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values defects_material_workmanship=Defects_material_workmanship_repair_or_replace unk_warranty=Unknown
% @importance 0.80

0.93::true_val(warranty, defects_material_workmanship); 0.07::true_val(warranty, unk_warranty).

measured(s21, warranty, defects_material_workmanship).

all_consistent(warranty) :- consistent(s21, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, defects_material_workmanship)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_transferability
% @type categorical
% @canonical false
% @original_name warranty (transferability)
% @values original_purchaser_only=Original_purchaser_not_transferable_not_ebay unk_warranty_transferability=Unknown
% @importance 0.75

0.88::true_val(warranty_transferability, original_purchaser_only); 0.12::true_val(warranty_transferability, unk_warranty_transferability).

measured(s22, warranty_transferability, original_purchaser_only).

all_consistent(warranty_transferability) :- consistent(s22, warranty_transferability).

evidence(all_consistent(warranty_transferability)).
query(true_val(warranty_transferability, original_purchaser_only)).
query(true_val(warranty_transferability, unk_warranty_transferability)).

% @attr warranty_claim_process
% @type categorical
% @canonical false
% @original_name warranty (claim process)
% @values through_authorized_retailer=Through_authorized_retailer unk_warranty_claim_process=Unknown
% @importance 0.75

0.88::true_val(warranty_claim_process, through_authorized_retailer); 0.12::true_val(warranty_claim_process, unk_warranty_claim_process).

measured(s22, warranty_claim_process, through_authorized_retailer).

all_consistent(warranty_claim_process) :- consistent(s22, warranty_claim_process).

evidence(all_consistent(warranty_claim_process)).
query(true_val(warranty_claim_process, through_authorized_retailer)).
query(true_val(warranty_claim_process, unk_warranty_claim_process)).

% @attr recycled_materials
% @type categorical
% @canonical false
% @original_name Recycled materials in topsheet base and edges
% @values recycled_top_base_edges=Recycled_materials_topsheet_base_edges unk_recycled_materials=Unknown
% @importance 0.55

0.82::true_val(recycled_materials, recycled_top_base_edges); 0.18::true_val(recycled_materials, unk_recycled_materials).

measured(s19, recycled_materials, recycled_top_base_edges).

all_consistent(recycled_materials) :- consistent(s19, recycled_materials).

evidence(all_consistent(recycled_materials)).
query(true_val(recycled_materials, recycled_top_base_edges)).
query(true_val(recycled_materials, unk_recycled_materials)).

% @attr base_upgrade_2627
% @type categorical
% @canonical false
% @original_name Speed Formula II base upgrade
% @values uhmw_polyethylene=UHMW_polyethylene_upgrade_26_27 unk_base_upgrade_2627=Unknown
% @importance 0.60

0.78::true_val(base_upgrade_2627, uhmw_polyethylene); 0.22::true_val(base_upgrade_2627, unk_base_upgrade_2627).

measured(s23, base_upgrade_2627, uhmw_polyethylene).

all_consistent(base_upgrade_2627) :- consistent(s23, base_upgrade_2627).

evidence(all_consistent(base_upgrade_2627)).
query(true_val(base_upgrade_2627, uhmw_polyethylene)).
query(true_val(base_upgrade_2627, unk_base_upgrade_2627)).

% @attr manufacturing_location_current
% @type categorical
% @canonical false
% @original_name manufacturing_location_current
% @values playmaker_taiwan=Playmaker_factory_Taiwan unk_manufacturing_location_current=Unknown
% @importance 0.53

0.90::true_val(manufacturing_location_current, playmaker_taiwan); 0.10::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s24, manufacturing_location_current, playmaker_taiwan).
measured(s25, manufacturing_location_current, playmaker_taiwan).

all_consistent(manufacturing_location_current) :-
    consistent(s24, manufacturing_location_current),
    (indep(s25), consistent(s25, manufacturing_location_current) ; \+indep(s25)).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, playmaker_taiwan)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical false
% @original_name manufacturing_location_prior
% @values elan_austria=Elan_factory_Austria unk_manufacturing_location_prior=Unknown
% @importance 0.55

0.72::true_val(manufacturing_location_prior, elan_austria); 0.28::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

measured(s24, manufacturing_location_prior, elan_austria).

all_consistent(manufacturing_location_prior) :- consistent(s24, manufacturing_location_prior).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, elan_austria)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr product_design_location
% @type categorical
% @canonical false
% @original_name Product design location
% @values oberammergau_and_seattle=Oberammergau_Germany_and_Seattle_USA unk_product_design_location=Unknown
% @importance 0.38

0.82::true_val(product_design_location, oberammergau_and_seattle); 0.18::true_val(product_design_location, unk_product_design_location).

measured(s9, product_design_location, oberammergau_and_seattle).
measured(s26, product_design_location, oberammergau_and_seattle).

all_consistent(product_design_location) :-
    consistent(s9, product_design_location),
    consistent(s26, product_design_location).

evidence(all_consistent(product_design_location)).
query(true_val(product_design_location, oberammergau_and_seattle)).
query(true_val(product_design_location, unk_product_design_location)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values woodcarver_specs=Woodcarver_flex7_camout_dual_degressive_midwide unk_comparable_board_same_brand=Unknown
% @importance 0.55

0.80::true_val(comparable_board_same_brand, woodcarver_specs); 0.20::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s27, comparable_board_same_brand, woodcarver_specs).

all_consistent(comparable_board_same_brand) :- consistent(s27, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, woodcarver_specs)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_comparison
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Mastercarve vs Woodcarver)
% @values mc_stiffer_true_camber_progressive=Mastercarve_9vs7_true_camber_progressive_trilite unk_comparable_board_same_brand_comparison=Unknown
% @importance 0.78

0.90::true_val(comparable_board_same_brand_comparison, mc_stiffer_true_camber_progressive); 0.10::true_val(comparable_board_same_brand_comparison, unk_comparable_board_same_brand_comparison).

measured(s1, comparable_board_same_brand_comparison, mc_stiffer_true_camber_progressive).
measured(s27, comparable_board_same_brand_comparison, mc_stiffer_true_camber_progressive).

all_consistent(comparable_board_same_brand_comparison) :-
    consistent(s1, comparable_board_same_brand_comparison),
    consistent(s27, comparable_board_same_brand_comparison).

evidence(all_consistent(comparable_board_same_brand_comparison)).
query(true_val(comparable_board_same_brand_comparison, mc_stiffer_true_camber_progressive)).
query(true_val(comparable_board_same_brand_comparison, unk_comparable_board_same_brand_comparison)).

% @attr comparable_board_same_brand_others
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (other Quiver models)
% @values banker_basher_dinghy_squash_santoku=Banker_Basher_Dinghy_Squash_Santoku unk_comparable_board_same_brand_others=Unknown
% @importance 0.45

0.72::true_val(comparable_board_same_brand_others, banker_basher_dinghy_squash_santoku); 0.28::true_val(comparable_board_same_brand_others, unk_comparable_board_same_brand_others).

measured(s28, comparable_board_same_brand_others, banker_basher_dinghy_squash_santoku).

all_consistent(comparable_board_same_brand_others) :- consistent(s28, comparable_board_same_brand_others).

evidence(all_consistent(comparable_board_same_brand_others)).
query(true_val(comparable_board_same_brand_others, banker_basher_dinghy_squash_santoku)).
query(true_val(comparable_board_same_brand_others, unk_comparable_board_same_brand_others)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values korua_cafe_racer=Korua_Cafe_Racer_flex7_directional_float_camber unk_comparable_board_cross_brand=Unknown
% @importance 0.70

0.75::true_val(comparable_board_cross_brand, korua_cafe_racer); 0.25::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s29, comparable_board_cross_brand, korua_cafe_racer).

all_consistent(comparable_board_cross_brand) :- consistent(s29, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, korua_cafe_racer)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_korua_edge
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Korua edge hold)
% @values korua_edge_hold_loss_icy=Korua_basic_biaxial_edge_hold_loss_icy unk_comparable_board_cross_brand_korua_edge=Unknown
% @importance 0.70

0.58::true_val(comparable_board_cross_brand_korua_edge, korua_edge_hold_loss_icy); 0.42::true_val(comparable_board_cross_brand_korua_edge, unk_comparable_board_cross_brand_korua_edge).

measured(s30, comparable_board_cross_brand_korua_edge, korua_edge_hold_loss_icy).

all_consistent(comparable_board_cross_brand_korua_edge) :- consistent(s30, comparable_board_cross_brand_korua_edge).

evidence(all_consistent(comparable_board_cross_brand_korua_edge)).
query(true_val(comparable_board_cross_brand_korua_edge, korua_edge_hold_loss_icy)).
query(true_val(comparable_board_cross_brand_korua_edge, unk_comparable_board_cross_brand_korua_edge)).

% @attr comparable_board_cross_brand_pencil
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Korua Pencil)
% @values korua_pencil_highspeed_groomers=Korua_Pencil_directional_full_camber_groomers unk_comparable_board_cross_brand_pencil=Unknown
% @importance 0.65

0.75::true_val(comparable_board_cross_brand_pencil, korua_pencil_highspeed_groomers); 0.25::true_val(comparable_board_cross_brand_pencil, unk_comparable_board_cross_brand_pencil).

measured(s31, comparable_board_cross_brand_pencil, korua_pencil_highspeed_groomers).

all_consistent(comparable_board_cross_brand_pencil) :- consistent(s31, comparable_board_cross_brand_pencil).

evidence(all_consistent(comparable_board_cross_brand_pencil)).
query(true_val(comparable_board_cross_brand_pencil, korua_pencil_highspeed_groomers)).
query(true_val(comparable_board_cross_brand_pencil, unk_comparable_board_cross_brand_pencil)).

% @attr comparable_board_cross_brand_trenchdigger
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Korua Trenchdigger)
% @values korua_trenchdigger_165_10m=Korua_Trenchdigger_165cm_10m_sidecut_full_camber unk_comparable_board_cross_brand_trenchdigger=Unknown
% @importance 0.55

0.72::true_val(comparable_board_cross_brand_trenchdigger, korua_trenchdigger_165_10m); 0.28::true_val(comparable_board_cross_brand_trenchdigger, unk_comparable_board_cross_brand_trenchdigger).

measured(s32, comparable_board_cross_brand_trenchdigger, korua_trenchdigger_165_10m).

all_consistent(comparable_board_cross_brand_trenchdigger) :- consistent(s32, comparable_board_cross_brand_trenchdigger).

evidence(all_consistent(comparable_board_cross_brand_trenchdigger)).
query(true_val(comparable_board_cross_brand_trenchdigger, korua_trenchdigger_165_10m)).
query(true_val(comparable_board_cross_brand_trenchdigger, unk_comparable_board_cross_brand_trenchdigger)).

% @attr comparable_board_cross_brand_flagship
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Flagship)
% @values jones_flagship_freeride_carving=Jones_Flagship_medium_stiff_sintered unk_comparable_board_cross_brand_flagship=Unknown
% @importance 0.55

0.62::true_val(comparable_board_cross_brand_flagship, jones_flagship_freeride_carving); 0.38::true_val(comparable_board_cross_brand_flagship, unk_comparable_board_cross_brand_flagship).

measured(s33, comparable_board_cross_brand_flagship, jones_flagship_freeride_carving).

all_consistent(comparable_board_cross_brand_flagship) :- consistent(s33, comparable_board_cross_brand_flagship).

evidence(all_consistent(comparable_board_cross_brand_flagship)).
query(true_val(comparable_board_cross_brand_flagship, jones_flagship_freeride_carving)).
query(true_val(comparable_board_cross_brand_flagship, unk_comparable_board_cross_brand_flagship)).

% @attr comparable_board_cross_brand_freecarver
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Freecarver)
% @values jones_freecarver_9000s=Jones_Freecarver_9000s_long_sidecut_full_camber unk_comparable_board_cross_brand_freecarver=Unknown
% @importance 0.55

0.62::true_val(comparable_board_cross_brand_freecarver, jones_freecarver_9000s); 0.38::true_val(comparable_board_cross_brand_freecarver, unk_comparable_board_cross_brand_freecarver).

measured(s34, comparable_board_cross_brand_freecarver, jones_freecarver_9000s).

all_consistent(comparable_board_cross_brand_freecarver) :- consistent(s34, comparable_board_cross_brand_freecarver).

evidence(all_consistent(comparable_board_cross_brand_freecarver)).
query(true_val(comparable_board_cross_brand_freecarver, jones_freecarver_9000s)).
query(true_val(comparable_board_cross_brand_freecarver, unk_comparable_board_cross_brand_freecarver)).

% @attr comparable_board_cross_brand_blade_plus
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nidecker Blade Plus)
% @values nidecker_blade_plus=Nidecker_Blade_Plus_triaxial_carbon_max_stiffness unk_comparable_board_cross_brand_blade_plus=Unknown
% @importance 0.55

0.62::true_val(comparable_board_cross_brand_blade_plus, nidecker_blade_plus); 0.38::true_val(comparable_board_cross_brand_blade_plus, unk_comparable_board_cross_brand_blade_plus).

measured(s35, comparable_board_cross_brand_blade_plus, nidecker_blade_plus).

all_consistent(comparable_board_cross_brand_blade_plus) :- consistent(s35, comparable_board_cross_brand_blade_plus).

evidence(all_consistent(comparable_board_cross_brand_blade_plus)).
query(true_val(comparable_board_cross_brand_blade_plus, nidecker_blade_plus)).
query(true_val(comparable_board_cross_brand_blade_plus, unk_comparable_board_cross_brand_blade_plus)).

% @attr comparable_board_cross_brand_cheater
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Stranda Cheater)
% @values stranda_cheater=Stranda_Cheater_variable_sidecut_torsional_eurocarving unk_comparable_board_cross_brand_cheater=Unknown
% @importance 0.55

0.55::true_val(comparable_board_cross_brand_cheater, stranda_cheater); 0.45::true_val(comparable_board_cross_brand_cheater, unk_comparable_board_cross_brand_cheater).

measured(s36, comparable_board_cross_brand_cheater, stranda_cheater).

all_consistent(comparable_board_cross_brand_cheater) :- consistent(s36, comparable_board_cross_brand_cheater).

evidence(all_consistent(comparable_board_cross_brand_cheater)).
query(true_val(comparable_board_cross_brand_cheater, stranda_cheater)).
query(true_val(comparable_board_cross_brand_cheater, unk_comparable_board_cross_brand_cheater)).

% @attr comparable_board_cross_brand_ns_west
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Never Summer West)
% @values never_summer_west=Never_Summer_West_carving_freeride_fusion_rocker unk_comparable_board_cross_brand_ns_west=Unknown
% @importance 0.50

0.58::true_val(comparable_board_cross_brand_ns_west, never_summer_west); 0.42::true_val(comparable_board_cross_brand_ns_west, unk_comparable_board_cross_brand_ns_west).

measured(s37, comparable_board_cross_brand_ns_west, never_summer_west).

all_consistent(comparable_board_cross_brand_ns_west) :- consistent(s37, comparable_board_cross_brand_ns_west).

evidence(all_consistent(comparable_board_cross_brand_ns_west)).
query(true_val(comparable_board_cross_brand_ns_west, never_summer_west)).
query(true_val(comparable_board_cross_brand_ns_west, unk_comparable_board_cross_brand_ns_west)).

% @attr comparable_board_cross_brand_deep_daze
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton FT 3D Deep Daze)
% @values burton_deep_daze=Burton_FT_3D_Deep_Daze_3d_shaping_directional unk_comparable_board_cross_brand_deep_daze=Unknown
% @importance 0.50

0.58::true_val(comparable_board_cross_brand_deep_daze, burton_deep_daze); 0.42::true_val(comparable_board_cross_brand_deep_daze, unk_comparable_board_cross_brand_deep_daze).

measured(s38, comparable_board_cross_brand_deep_daze, burton_deep_daze).

all_consistent(comparable_board_cross_brand_deep_daze) :- consistent(s38, comparable_board_cross_brand_deep_daze).

evidence(all_consistent(comparable_board_cross_brand_deep_daze)).
query(true_val(comparable_board_cross_brand_deep_daze, burton_deep_daze)).
query(true_val(comparable_board_cross_brand_deep_daze, unk_comparable_board_cross_brand_deep_daze)).

% @attr comparable_board_cross_brand_lib_tech
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Lib Tech)
% @values lib_tech_magne_traction_progressive=Lib_Tech_aggressive_carving_MagneTraction_progressive_sidecut unk_comparable_board_cross_brand_lib_tech=Unknown
% @importance 0.50

0.58::true_val(comparable_board_cross_brand_lib_tech, lib_tech_magne_traction_progressive); 0.42::true_val(comparable_board_cross_brand_lib_tech, unk_comparable_board_cross_brand_lib_tech).

measured(s38, comparable_board_cross_brand_lib_tech, lib_tech_magne_traction_progressive).

all_consistent(comparable_board_cross_brand_lib_tech) :- consistent(s38, comparable_board_cross_brand_lib_tech).

evidence(all_consistent(comparable_board_cross_brand_lib_tech)).
query(true_val(comparable_board_cross_brand_lib_tech, lib_tech_magne_traction_progressive)).
query(true_val(comparable_board_cross_brand_lib_tech, unk_comparable_board_cross_brand_lib_tech)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values carves_like_dream=Carves_like_a_dream_good_in_powder_except_super_deep unk_user_review_forum=Unknown
% @importance 0.60

0.62::true_val(user_review_forum, carves_like_dream); 0.38::true_val(user_review_forum, unk_user_review_forum).

measured(s39, user_review_forum, carves_like_dream).

all_consistent(user_review_forum) :- consistent(s39, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, carves_like_dream)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_switch
% @type categorical
% @canonical false
% @original_name user_review_forum (switch riding)
% @values hard_to_ride_switch=Hard_to_ride_switch_directional_expected unk_user_review_forum_switch=Unknown
% @importance 0.60

0.62::true_val(user_review_forum_switch, hard_to_ride_switch); 0.38::true_val(user_review_forum_switch, unk_user_review_forum_switch).

measured(s39, user_review_forum_switch, hard_to_ride_switch).

all_consistent(user_review_forum_switch) :- consistent(s39, user_review_forum_switch).

evidence(all_consistent(user_review_forum_switch)).
query(true_val(user_review_forum_switch, hard_to_ride_switch)).
query(true_val(user_review_forum_switch, unk_user_review_forum_switch)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values precise_locked_in_excellent=Precise_locked_in_easily_handled_excellent_intermediate_advanced unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.60

0.70::true_val(reviewer_opinion_the_good_ride, precise_locked_in_excellent); 0.30::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s16, reviewer_opinion_the_good_ride, precise_locked_in_excellent).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s16, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, precise_locked_in_excellent)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr user_review_forum_eurocarving
% @type categorical
% @canonical false
% @original_name user_review_forum (eurocarving)
% @values fun_carve_eurocarving=Very_fun_to_carve_suited_to_eurocarving unk_user_review_forum_eurocarving=Unknown
% @importance 0.50

0.55::true_val(user_review_forum_eurocarving, fun_carve_eurocarving); 0.45::true_val(user_review_forum_eurocarving, unk_user_review_forum_eurocarving).

measured(s40, user_review_forum_eurocarving, fun_carve_eurocarving).

all_consistent(user_review_forum_eurocarving) :- consistent(s40, user_review_forum_eurocarving).

evidence(all_consistent(user_review_forum_eurocarving)).
query(true_val(user_review_forum_eurocarving, fun_carve_eurocarving)).
query(true_val(user_review_forum_eurocarving, unk_user_review_forum_eurocarving)).

% @attr carving_board_advice_stranda
% @type categorical
% @canonical false
% @original_name General carving board advice (Stranda)
% @values camber_dominant_directional=Camber_dominant_directional_shape_best unk_carving_board_advice_stranda=Unknown
% @importance 0.65

0.58::true_val(carving_board_advice_stranda, camber_dominant_directional); 0.42::true_val(carving_board_advice_stranda, unk_carving_board_advice_stranda).

measured(s41, carving_board_advice_stranda, camber_dominant_directional).

all_consistent(carving_board_advice_stranda) :- consistent(s41, carving_board_advice_stranda).

evidence(all_consistent(carving_board_advice_stranda)).
query(true_val(carving_board_advice_stranda, camber_dominant_directional)).
query(true_val(carving_board_advice_stranda, unk_carving_board_advice_stranda)).

% @attr carving_board_advice_general
% @type categorical
% @canonical false
% @original_name General carving board advice
% @values stiff_camber_directional=Stiff_flex_traditional_camber_directional_shape unk_carving_board_advice_general=Unknown
% @importance 0.70

0.62::true_val(carving_board_advice_general, stiff_camber_directional); 0.38::true_val(carving_board_advice_general, unk_carving_board_advice_general).

measured(s42, carving_board_advice_general, stiff_camber_directional).

all_consistent(carving_board_advice_general) :- consistent(s42, carving_board_advice_general).

evidence(all_consistent(carving_board_advice_general)).
query(true_val(carving_board_advice_general, stiff_camber_directional)).
query(true_val(carving_board_advice_general, unk_carving_board_advice_general)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values carving_returned_centre_stage=Carving_returned_centre_stage_turn_n_burn unk_reviewer_opinion_whitelines=Unknown
% @importance 0.50

0.75::true_val(reviewer_opinion_whitelines, carving_returned_centre_stage); 0.25::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s43, reviewer_opinion_whitelines, carving_returned_centre_stage).

all_consistent(reviewer_opinion_whitelines) :- consistent(s43, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, carving_returned_centre_stage)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr user_review_forum_wide
% @type categorical
% @canonical false
% @original_name user_review_forum (wide recommendation)
% @values get_wide_for_deep_carving=Get_wide_version_for_deep_carving_prevent_bootout unk_user_review_forum_wide=Unknown
% @importance 0.60

0.50::true_val(user_review_forum_wide, get_wide_for_deep_carving); 0.50::true_val(user_review_forum_wide, unk_user_review_forum_wide).

measured(s44, user_review_forum_wide, get_wide_for_deep_carving).

all_consistent(user_review_forum_wide) :- consistent(s44, user_review_forum_wide).

evidence(all_consistent(user_review_forum_wide)).
query(true_val(user_review_forum_wide, get_wide_for_deep_carving)).
query(true_val(user_review_forum_wide, unk_user_review_forum_wide)).

% @attr user_review_forum_korua
% @type categorical
% @canonical false
% @original_name user_review_forum (Korua vs dedicated carving)
% @values korua_slashed_not_c_shape=Korua_designed_slashed_turns_not_perfect_C_carves unk_user_review_forum_korua=Unknown
% @importance 0.70

0.55::true_val(user_review_forum_korua, korua_slashed_not_c_shape); 0.45::true_val(user_review_forum_korua, unk_user_review_forum_korua).

measured(s30, user_review_forum_korua, korua_slashed_not_c_shape).

all_consistent(user_review_forum_korua) :- consistent(s30, user_review_forum_korua).

evidence(all_consistent(user_review_forum_korua)).
query(true_val(user_review_forum_korua, korua_slashed_not_c_shape)).
query(true_val(user_review_forum_korua, unk_user_review_forum_korua)).

% @attr mounting_pattern_benefits
% @type categorical
% @canonical false
% @original_name 2x4 inserts benefits
% @values precise_stance_compatible=Precise_stance_adjustments_compatible_standard_mini_disk unk_mounting_pattern_benefits=Unknown
% @importance 1.0

0.90::true_val(mounting_pattern_benefits, precise_stance_compatible); 0.10::true_val(mounting_pattern_benefits, unk_mounting_pattern_benefits).

measured(s1, mounting_pattern_benefits, precise_stance_compatible).

all_consistent(mounting_pattern_benefits) :- consistent(s1, mounting_pattern_benefits).

evidence(all_consistent(mounting_pattern_benefits)).
query(true_val(mounting_pattern_benefits, precise_stance_compatible)).
query(true_val(mounting_pattern_benefits, unk_mounting_pattern_benefits)).

% @attr recommended_binding_stiffness
% @type categorical
% @canonical false
% @original_name Recommended binding stiffness for carving boards
% @values stiff_to_medium_stiff=Stiff_to_medium_stiff_bindings unk_recommended_binding_stiffness=Unknown
% @importance 0.45

0.50::true_val(recommended_binding_stiffness, stiff_to_medium_stiff); 0.50::true_val(recommended_binding_stiffness, unk_recommended_binding_stiffness).

measured(s45, recommended_binding_stiffness, stiff_to_medium_stiff).

all_consistent(recommended_binding_stiffness) :- consistent(s45, recommended_binding_stiffness).

evidence(all_consistent(recommended_binding_stiffness)).
query(true_val(recommended_binding_stiffness, stiff_to_medium_stiff)).
query(true_val(recommended_binding_stiffness, unk_recommended_binding_stiffness)).

% @attr specialization
% @type categorical
% @canonical false
% @original_name Highly specialized
% @values single_purpose_carving_no_park=Single_purpose_carving_not_park_freestyle unk_specialization=Unknown
% @importance 1.0

0.90::true_val(specialization, single_purpose_carving_no_park); 0.10::true_val(specialization, unk_specialization).

measured(s1, specialization, single_purpose_carving_no_park).

all_consistent(specialization) :- consistent(s1, specialization).

evidence(all_consistent(specialization)).
query(true_val(specialization, single_purpose_carving_no_park)).
query(true_val(specialization, unk_specialization)).

% @attr design_homage
% @type categorical
% @canonical false
% @original_name Late 80s design homage
% @values modern_interpretation_late_80s=Modern_interpretation_early_snowboard_carving_era unk_design_homage=Unknown
% @importance 0.85

0.85::true_val(design_homage, modern_interpretation_late_80s); 0.15::true_val(design_homage, unk_design_homage).

measured(s4, design_homage, modern_interpretation_late_80s).

all_consistent(design_homage) :- consistent(s4, design_homage).

evidence(all_consistent(design_homage)).
query(true_val(design_homage, modern_interpretation_late_80s)).
query(true_val(design_homage, unk_design_homage)).

% @attr sustainability_certification_summary
% @type categorical
% @canonical false
% @original_name sustainability_certification (summary)
% @values solar_recycled_fsc_bioresin_co2=Solar_recycled_FSC_bioresin_CO2_disclosed unk_sustainability_certification_summary=Unknown
% @importance 0.78

0.93::true_val(sustainability_certification_summary, solar_recycled_fsc_bioresin_co2); 0.07::true_val(sustainability_certification_summary, unk_sustainability_certification_summary).

measured(s1, sustainability_certification_summary, solar_recycled_fsc_bioresin_co2).
measured(s19, sustainability_certification_summary, solar_recycled_fsc_bioresin_co2).

all_consistent(sustainability_certification_summary) :-
    consistent(s1, sustainability_certification_summary),
    consistent(s19, sustainability_certification_summary).

evidence(all_consistent(sustainability_certification_summary)).
query(true_val(sustainability_certification_summary, solar_recycled_fsc_bioresin_co2)).
query(true_val(sustainability_certification_summary, unk_sustainability_certification_summary)).