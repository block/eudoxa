0.15::indep(s_merchant).
0.15::indep(s_s2as).
0.12::indep(s_blauer).
0.15::indep(s_snowboards_eu).
0.15::indep(s_boardertown).
0.15::indep(s_snowleader).
0.15::indep(s_supershop).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.95::acc(s_s2as, brand).
0.93::acc(s_merchant, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values bataleon=Bataleon unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, bataleon); 0.05::true_val(brand, unk_brand).

measured(s_s2as, brand, bataleon).
measured(s_merchant, brand, bataleon).

all_consistent(brand) :-
    consistent(s_s2as, brand),
    (indep(s_merchant), consistent(s_merchant, brand) ; \+indep(s_merchant)).

evidence(all_consistent(brand)).
query(true_val(brand, bataleon)).
query(true_val(brand, unk_brand)).

0.95::acc(s_s2as, model_name).
0.93::acc(s_merchant, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values placebo=Placebo unk_model_name=Unknown
% @importance 1.0

0.95::true_val(model_name, placebo); 0.05::true_val(model_name, unk_model_name).

measured(s_s2as, model_name, placebo).
measured(s_merchant, model_name, placebo).

all_consistent(model_name) :-
    consistent(s_s2as, model_name),
    (indep(s_merchant), consistent(s_merchant, model_name) ; \+indep(s_merchant)).

evidence(all_consistent(model_name)).
query(true_val(model_name, placebo)).
query(true_val(model_name, unk_model_name)).

0.90::acc(s_merchant, model_year).
0.88::acc(s_bss, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.975

0.95::true_val(model_year, y2027); 0.05::true_val(model_year, unk_model_year).

measured(s_merchant, model_year, y2027).
measured(s_bss, model_year, y2027).

all_consistent(model_year) :-
    consistent(s_merchant, model_year),
    consistent(s_bss, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.90::acc(s_merchant, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2027_new=2027_first_year unk_model_first_available_year=Unknown
% @importance 1.0

0.90::true_val(model_first_available_year, y2027_new); 0.10::true_val(model_first_available_year, unk_model_first_available_year).

measured(s_merchant, model_first_available_year, y2027_new).

all_consistent(model_first_available_year) :-
    consistent(s_merchant, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2027_new)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.93::acc(s_s2as, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.93::true_val(product_type, snowboard); 0.07::true_val(product_type, unk_product_type).

measured(s_s2as, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s_s2as, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.90::acc(s_merchant, board_category).
0.88::acc(s_s2as, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 0.975

0.95::true_val(board_category, freestyle_all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(s_merchant, board_category, freestyle_all_mountain).
measured(s_s2as, board_category, freestyle_all_mountain).

all_consistent(board_category) :-
    consistent(s_merchant, board_category),
    (indep(s_s2as), consistent(s_s2as, board_category) ; \+indep(s_s2as)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

0.85::acc(s_blauer, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.5

0.85::true_val(gender, mens); 0.15::true_val(gender, unk_gender).

measured(s_blauer, gender, mens).

all_consistent(gender) :-
    consistent(s_blauer, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.90::acc(s_merchant, design_note).
0.87::acc(s_bss, design_note).

% @attr design_note
% @type categorical
% @canonical false
% @original_name Design note
% @values no_3bt_traditional_feel=No_3BT_traditional_feel unk_design_note=Unknown
% @importance 0.975

0.95::true_val(design_note, no_3bt_traditional_feel); 0.05::true_val(design_note, unk_design_note).

measured(s_merchant, design_note, no_3bt_traditional_feel).
measured(s_bss, design_note, no_3bt_traditional_feel).

all_consistent(design_note) :-
    consistent(s_merchant, design_note),
    consistent(s_bss, design_note).

evidence(all_consistent(design_note)).
query(true_val(design_note, no_3bt_traditional_feel)).
query(true_val(design_note, unk_design_note)).

0.87::acc(s_bss, design_philosophy).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values second_dimension=Second_Dimension_first_without_3BT unk_design_philosophy=Unknown
% @importance 0.875

0.87::true_val(design_philosophy, second_dimension); 0.13::true_val(design_philosophy, unk_design_philosophy).

measured(s_bss, design_philosophy, second_dimension).

all_consistent(design_philosophy) :-
    consistent(s_bss, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, second_dimension)).
query(true_val(design_philosophy, unk_design_philosophy)).

0.88::acc(s_merchant, predecessor_model_name).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values goliath_progression=Goliath_redesign_progression unk_predecessor_model_name=Unknown
% @importance 1.0

0.88::true_val(predecessor_model_name, goliath_progression); 0.12::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s_merchant, predecessor_model_name, goliath_progression).

all_consistent(predecessor_model_name) :-
    consistent(s_merchant, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, goliath_progression)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

0.92::acc(s_bat, manufacturer_company).
0.82::acc(s_wiki, manufacturer_company).

% @attr manufacturer_company
% @type categorical
% @canonical false
% @original_name manufacturer
% @values lps_amsterdam=Low_Pressure_Studio_Amsterdam_Nidecker unk_manufacturer_company=Unknown
% @importance 0.5

0.95::true_val(manufacturer_company, lps_amsterdam); 0.05::true_val(manufacturer_company, unk_manufacturer_company).

measured(s_bat, manufacturer_company, lps_amsterdam).
measured(s_wiki, manufacturer_company, lps_amsterdam).

all_consistent(manufacturer_company) :-
    consistent(s_bat, manufacturer_company),
    consistent(s_wiki, manufacturer_company).

evidence(all_consistent(manufacturer_company)).
query(true_val(manufacturer_company, lps_amsterdam)).
query(true_val(manufacturer_company, unk_manufacturer_company)).

0.78::acc(s_onboard, brand_founding_year).
0.70::acc(s_supershop, brand_founding_year).
0.55::acc(s_fanblog, brand_founding_year).
0.60::acc(s_boardertown, brand_founding_year).
0.55::acc(s_snowleader, brand_founding_year).

% @attr brand_founding_year
% @type categorical
% @canonical false
% @original_name Brand founding year
% @values y2000=2000 y2001=2001 late_1990s=Late_1990s
% @importance 0.4

0.70::true_val(brand_founding_year, y2000); 0.15::true_val(brand_founding_year, y2001); 0.15::true_val(brand_founding_year, late_1990s).

measured(s_onboard, brand_founding_year, y2000).
measured(s_supershop, brand_founding_year, y2000).
measured(s_fanblog, brand_founding_year, y2000).
measured(s_boardertown, brand_founding_year, y2001).
measured(s_snowleader, brand_founding_year, late_1990s).

all_consistent(brand_founding_year) :-
    consistent(s_onboard, brand_founding_year),
    (indep(s_supershop), consistent(s_supershop, brand_founding_year) ; \+indep(s_supershop)),
    consistent(s_fanblog, brand_founding_year),
    (indep(s_boardertown), consistent(s_boardertown, brand_founding_year) ; \+indep(s_boardertown)),
    (indep(s_snowleader), consistent(s_snowleader, brand_founding_year) ; \+indep(s_snowleader)).

evidence(all_consistent(brand_founding_year)).
query(true_val(brand_founding_year, y2000)).
query(true_val(brand_founding_year, y2001)).
query(true_val(brand_founding_year, late_1990s)).

0.92::acc(s_bat, brand_headquarters).
0.85::acc(s_bss, brand_headquarters).

% @attr brand_headquarters
% @type categorical
% @canonical false
% @original_name Brand headquarters
% @values amsterdam_netherlands=Amsterdam_Netherlands unk_brand_headquarters=Unknown
% @importance 0.6

0.95::true_val(brand_headquarters, amsterdam_netherlands); 0.05::true_val(brand_headquarters, unk_brand_headquarters).

measured(s_bat, brand_headquarters, amsterdam_netherlands).
measured(s_bss, brand_headquarters, amsterdam_netherlands).

all_consistent(brand_headquarters) :-
    consistent(s_bat, brand_headquarters),
    consistent(s_bss, brand_headquarters).

evidence(all_consistent(brand_headquarters)).
query(true_val(brand_headquarters, amsterdam_netherlands)).
query(true_val(brand_headquarters, unk_brand_headquarters)).

0.72::acc(s_snowprof, design_studio).

% @attr design_studio
% @type categorical
% @canonical false
% @original_name Design studio
% @values lps_amsterdam=Low_Pressure_Studio_Amsterdam unk_design_studio=Unknown
% @importance 0.5

0.72::true_val(design_studio, lps_amsterdam); 0.28::true_val(design_studio, unk_design_studio).

measured(s_snowprof, design_studio, lps_amsterdam).

all_consistent(design_studio) :-
    consistent(s_snowprof, design_studio).

evidence(all_consistent(design_studio)).
query(true_val(design_studio, lps_amsterdam)).
query(true_val(design_studio, unk_design_studio)).

0.88::acc(s_whitelines, manufacturing_location_current).
0.87::acc(s_snowboarder, manufacturing_location_current).
0.78::acc(s_snowdays, manufacturing_location_current).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_capita_mothership=Austria_CAPiTA_Mothership unk_manufacturing_location_current=Unknown
% @importance 0.55

0.95::true_val(manufacturing_location_current, austria_capita_mothership); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s_whitelines, manufacturing_location_current, austria_capita_mothership).
measured(s_snowboarder, manufacturing_location_current, austria_capita_mothership).
measured(s_snowdays, manufacturing_location_current, austria_capita_mothership).

all_consistent(manufacturing_location_current) :-
    consistent(s_whitelines, manufacturing_location_current),
    consistent(s_snowboarder, manufacturing_location_current),
    consistent(s_snowdays, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_capita_mothership)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

0.65::acc(s_fanblog, manufacturing_location_prior).
0.78::acc(s_onboard, manufacturing_location_prior).
0.72::acc(s_snowprof, manufacturing_location_prior).

% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name manufacturing_location_prior
% @values elan_austria_then_asia=Elan_Austria_then_temp_Asia unk_manufacturing_location_prior=Unknown
% @importance 0.4

0.95::true_val(manufacturing_location_prior, elan_austria_then_asia); 0.05::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

measured(s_fanblog, manufacturing_location_prior, elan_austria_then_asia).
measured(s_onboard, manufacturing_location_prior, elan_austria_then_asia).
measured(s_snowprof, manufacturing_location_prior, elan_austria_then_asia).

all_consistent(manufacturing_location_prior) :-
    consistent(s_fanblog, manufacturing_location_prior),
    consistent(s_onboard, manufacturing_location_prior),
    consistent(s_snowprof, manufacturing_location_prior).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, elan_austria_then_asia)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

0.85::acc(s_snowboarder, manufacturing_location_prior_announced).

% @attr manufacturing_location_prior_announced
% @type categorical
% @canonical false
% @original_name manufacturing_location_prior (announced year)
% @values y2014=2014 unk_manufacturing_location_prior_announced=Unknown
% @importance 0.55

0.85::true_val(manufacturing_location_prior_announced, y2014); 0.15::true_val(manufacturing_location_prior_announced, unk_manufacturing_location_prior_announced).

measured(s_snowboarder, manufacturing_location_prior_announced, y2014).

all_consistent(manufacturing_location_prior_announced) :-
    consistent(s_snowboarder, manufacturing_location_prior_announced).

evidence(all_consistent(manufacturing_location_prior_announced)).
query(true_val(manufacturing_location_prior_announced, y2014)).
query(true_val(manufacturing_location_prior_announced, unk_manufacturing_location_prior_announced)).

0.80::acc(s_wiki, nidecker_group_rank).

% @attr nidecker_group_rank
% @type categorical
% @canonical false
% @original_name Nidecker Group rank
% @values second_biggest=Second_biggest_snowboard_company unk_nidecker_group_rank=Unknown
% @importance 0.5

0.80::true_val(nidecker_group_rank, second_biggest); 0.20::true_val(nidecker_group_rank, unk_nidecker_group_rank).

measured(s_wiki, nidecker_group_rank, second_biggest).

all_consistent(nidecker_group_rank) :-
    consistent(s_wiki, nidecker_group_rank).

evidence(all_consistent(nidecker_group_rank)).
query(true_val(nidecker_group_rank, second_biggest)).
query(true_val(nidecker_group_rank, unk_nidecker_group_rank)).

0.87::acc(s_bss, brand_usp).
0.85::acc(s_bat_founders, brand_usp).

% @attr brand_usp
% @type categorical
% @canonical false
% @original_name Brand USP
% @values triple_base_tech_3bt=3BT_but_Placebo_first_without unk_brand_usp=Unknown
% @importance 0.825

0.95::true_val(brand_usp, triple_base_tech_3bt); 0.05::true_val(brand_usp, unk_brand_usp).

measured(s_bss, brand_usp, triple_base_tech_3bt).
measured(s_bat_founders, brand_usp, triple_base_tech_3bt).

all_consistent(brand_usp) :-
    consistent(s_bss, brand_usp),
    consistent(s_bat_founders, brand_usp).

evidence(all_consistent(brand_usp)).
query(true_val(brand_usp, triple_base_tech_3bt)).
query(true_val(brand_usp, unk_brand_usp)).

0.95::acc(s_bat, warranty_description).

% @attr warranty_description
% @type categorical
% @canonical false
% @original_name warranty
% @values two_year_limited_mfg_defects=2yr_limited_manufacturing_defects unk_warranty_description=Unknown
% @importance 0.8

0.93::true_val(warranty_description, two_year_limited_mfg_defects); 0.07::true_val(warranty_description, unk_warranty_description).

measured(s_bat, warranty_description, two_year_limited_mfg_defects).

all_consistent(warranty_description) :-
    consistent(s_bat, warranty_description).

evidence(all_consistent(warranty_description)).
query(true_val(warranty_description, two_year_limited_mfg_defects)).
query(true_val(warranty_description, unk_warranty_description)).

0.93::acc(s_bat_reg, warranty_period_years).
0.70::acc(s_snowboards_eu, warranty_period_years).
0.60::acc(s_forum91, warranty_period_years).

% @attr warranty_period_years
% @type categorical
% @canonical true
% @original_name warranty_period_years
% @values v2_plus_1=2+1_years_with_registration v2=2_years
% @importance 0.75

0.55::true_val(warranty_period_years, v2_plus_1); 0.45::true_val(warranty_period_years, v2).

measured(s_bat_reg, warranty_period_years, v2_plus_1).
measured(s_snowboards_eu, warranty_period_years, v2).
measured(s_forum91, warranty_period_years, v2).

all_consistent(warranty_period_years) :-
    consistent(s_bat_reg, warranty_period_years),
    (indep(s_snowboards_eu), consistent(s_snowboards_eu, warranty_period_years) ; \+indep(s_snowboards_eu)),
    consistent(s_forum91, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2_plus_1)).
query(true_val(warranty_period_years, v2)).

0.95::acc(s_bat, return_policy_terms).
0.93::acc(s_bat_returns, return_policy_terms).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values days_45=45_day_returns unk_return_policy_terms=Unknown
% @importance 0.75

0.95::true_val(return_policy_terms, days_45); 0.05::true_val(return_policy_terms, unk_return_policy_terms).

measured(s_bat, return_policy_terms, days_45).
measured(s_bat_returns, return_policy_terms, days_45).

all_consistent(return_policy_terms) :-
    consistent(s_bat, return_policy_terms),
    consistent(s_bat_returns, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, days_45)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

0.90::acc(s_merchant, shape).
0.88::acc(s_s2as, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.975

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).

measured(s_merchant, shape, directional_twin).
measured(s_s2as, shape, directional_twin).

all_consistent(shape) :-
    consistent(s_merchant, shape),
    (indep(s_s2as), consistent(s_s2as, shape) ; \+indep(s_s2as)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

0.88::acc(s_merchant, shape_description).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values symmetrical_shifted_stance=Symmetrical_shape_slightly_shifted_stance unk_shape_description=Unknown
% @importance 1.0

0.88::true_val(shape_description, symmetrical_shifted_stance); 0.12::true_val(shape_description, unk_shape_description).

measured(s_merchant, shape_description, symmetrical_shifted_stance).

all_consistent(shape_description) :-
    consistent(s_merchant, shape_description).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, symmetrical_shifted_stance)).
query(true_val(shape_description, unk_shape_description)).

0.90::acc(s_merchant, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values medium_camber=Medium_Camber_nose_to_tail unk_camber_type=Unknown
% @importance 1.0

0.90::true_val(camber_type, medium_camber); 0.10::true_val(camber_type, unk_camber_type).

measured(s_merchant, camber_type, medium_camber).

all_consistent(camber_type) :-
    consistent(s_merchant, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, medium_camber)).
query(true_val(camber_type, unk_camber_type)).

0.90::acc(s_merchant, base_technology_3d).
0.87::acc(s_bss, base_technology_3d).

% @attr base_technology_3d
% @type categorical
% @canonical false
% @original_name 3D base technology
% @values none_flat=None_flat_base_no_3BT unk_base_technology_3d=Unknown
% @importance 0.975

0.95::true_val(base_technology_3d, none_flat); 0.05::true_val(base_technology_3d, unk_base_technology_3d).

measured(s_merchant, base_technology_3d, none_flat).
measured(s_bss, base_technology_3d, none_flat).

all_consistent(base_technology_3d) :-
    consistent(s_merchant, base_technology_3d),
    consistent(s_bss, base_technology_3d).

evidence(all_consistent(base_technology_3d)).
query(true_val(base_technology_3d, none_flat)).
query(true_val(base_technology_3d, unk_base_technology_3d)).

0.80::acc(s_s2as, nose_tail_uplift).

% @attr nose_tail_uplift
% @type categorical
% @canonical false
% @original_name Nose & tail uplift
% @values none=None unk_nose_tail_uplift=Unknown
% @importance 0.95

0.80::true_val(nose_tail_uplift, none); 0.20::true_val(nose_tail_uplift, unk_nose_tail_uplift).

measured(s_s2as, nose_tail_uplift, none).

all_consistent(nose_tail_uplift) :-
    consistent(s_s2as, nose_tail_uplift).

evidence(all_consistent(nose_tail_uplift)).
query(true_val(nose_tail_uplift, none)).
query(true_val(nose_tail_uplift, unk_nose_tail_uplift)).

0.80::acc(s_s2as, insert_location).

% @attr insert_location
% @type categorical
% @canonical false
% @original_name Insert location
% @values centered=Centered unk_insert_location=Unknown
% @importance 0.95

0.80::true_val(insert_location, centered); 0.20::true_val(insert_location, unk_insert_location).

measured(s_s2as, insert_location, centered).

all_consistent(insert_location) :-
    consistent(s_s2as, insert_location).

evidence(all_consistent(insert_location)).
query(true_val(insert_location, centered)).
query(true_val(insert_location, unk_insert_location)).

0.92::acc(s_merchant, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.92::true_val(mounting_pattern, inserts_2x4); 0.08::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_merchant, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(s_merchant, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.90::acc(s_merchant, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values tri_radial=Tri_radial_size_specific unk_sidecut_type=Unknown
% @importance 0.85

0.90::true_val(sidecut_type, tri_radial); 0.10::true_val(sidecut_type, unk_sidecut_type).

measured(s_merchant, sidecut_type, tri_radial).

all_consistent(sidecut_type) :-
    consistent(s_merchant, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, tri_radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.88::acc(s_s2as, flex_rating_10).
0.92::acc(s_merchant, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v8=8.0 unk_flex_rating_10=Unknown
% @importance 0.9

0.95::true_val(flex_rating_10, v8); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s_s2as, flex_rating_10, v8).
measured(s_merchant, flex_rating_10, v8).

all_consistent(flex_rating_10) :-
    consistent(s_s2as, flex_rating_10),
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v8)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.82::acc(s_s2as, flex_feel).
0.88::acc(s_bss, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff_aggressive=Stiff_powerful_responsive mid_stiff=Mid_stiff
% @importance 0.95

0.45::true_val(flex_feel, stiff_aggressive); 0.55::true_val(flex_feel, mid_stiff).

measured(s_s2as, flex_feel, stiff_aggressive).
measured(s_bss, flex_feel, mid_stiff).

all_consistent(flex_feel) :-
    consistent(s_s2as, flex_feel),
    consistent(s_bss, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff_aggressive)).
query(true_val(flex_feel, mid_stiff)).

0.92::acc(s_merchant, core_material).
0.88::acc(s_s2as, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values light_core_poplar_paulownia=Light_Core_50_50_Poplar_Paulownia unk_core_material=Unknown
% @importance 0.9

0.95::true_val(core_material, light_core_poplar_paulownia); 0.05::true_val(core_material, unk_core_material).

measured(s_merchant, core_material, light_core_poplar_paulownia).
measured(s_s2as, core_material, light_core_poplar_paulownia).

all_consistent(core_material) :-
    consistent(s_merchant, core_material),
    (indep(s_s2as), consistent(s_s2as, core_material) ; \+indep(s_s2as)).

evidence(all_consistent(core_material)).
query(true_val(core_material, light_core_poplar_paulownia)).
query(true_val(core_material, unk_core_material)).

0.88::acc(s_s2as, laminate).
0.90::acc(s_merchant, laminate).
0.82::acc(s_bat, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values tri_ax=Tri_Ax_laminate two_way_weave=Traditional_two_way_weave
% @importance 0.87

0.60::true_val(laminate, tri_ax); 0.40::true_val(laminate, two_way_weave).

measured(s_s2as, laminate, tri_ax).
measured(s_merchant, laminate, tri_ax).
measured(s_bat, laminate, two_way_weave).

all_consistent(laminate) :-
    (indep(s_s2as), consistent(s_s2as, laminate) ; \+indep(s_s2as)),
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)),
    consistent(s_bat, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax)).
query(true_val(laminate, two_way_weave)).

0.80::acc(s_bat, fiberglass_description).

% @attr fiberglass_description
% @type categorical
% @canonical false
% @original_name Fiberglass description
% @values light_strong_playful=Light_strong_playful_two_way_weave unk_fiberglass_description=Unknown
% @importance 0.8

0.80::true_val(fiberglass_description, light_strong_playful); 0.20::true_val(fiberglass_description, unk_fiberglass_description).

measured(s_bat, fiberglass_description, light_strong_playful).

all_consistent(fiberglass_description) :-
    consistent(s_bat, fiberglass_description).

evidence(all_consistent(fiberglass_description)).
query(true_val(fiberglass_description, light_strong_playful)).
query(true_val(fiberglass_description, unk_fiberglass_description)).

0.90::acc(s_merchant, carbon_stringers).
0.88::acc(s_s2as, carbon_stringers).

% @attr carbon_stringers
% @type categorical
% @canonical false
% @original_name Carbon Stringers
% @values carbon_layups_flex_response=Carbon_stringers_fine_tune_flex_response unk_carbon_stringers=Unknown
% @importance 0.9

0.95::true_val(carbon_stringers, carbon_layups_flex_response); 0.05::true_val(carbon_stringers, unk_carbon_stringers).

measured(s_merchant, carbon_stringers, carbon_layups_flex_response).
measured(s_s2as, carbon_stringers, carbon_layups_flex_response).

all_consistent(carbon_stringers) :-
    consistent(s_merchant, carbon_stringers),
    (indep(s_s2as), consistent(s_s2as, carbon_stringers) ; \+indep(s_s2as)).

evidence(all_consistent(carbon_stringers)).
query(true_val(carbon_stringers, carbon_layups_flex_response)).
query(true_val(carbon_stringers, unk_carbon_stringers)).

0.90::acc(s_merchant, construction_material_innovation).
0.85::acc(s_bat, construction_material_innovation).
0.87::acc(s_bss, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values central_supertube=Central_SuperTube_hollow_carbon_pop unk_construction_material_innovation=Unknown
% @importance 0.85

0.95::true_val(construction_material_innovation, central_supertube); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s_merchant, construction_material_innovation, central_supertube).
measured(s_bat, construction_material_innovation, central_supertube).
measured(s_bss, construction_material_innovation, central_supertube).

all_consistent(construction_material_innovation) :-
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation) ; \+indep(s_merchant)),
    consistent(s_bat, construction_material_innovation),
    consistent(s_bss, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, central_supertube)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.90::acc(s_merchant, impact_plates).
0.88::acc(s_s2as, impact_plates).
0.78::acc(s_blauer, impact_plates).

% @attr impact_plates
% @type categorical
% @canonical false
% @original_name Impact Plates
% @values reinforced_underfoot_inserts=Reinforced_zones_underfoot_binding_inserts unk_impact_plates=Unknown
% @importance 0.8

0.95::true_val(impact_plates, reinforced_underfoot_inserts); 0.05::true_val(impact_plates, unk_impact_plates).

measured(s_merchant, impact_plates, reinforced_underfoot_inserts).
measured(s_s2as, impact_plates, reinforced_underfoot_inserts).
measured(s_blauer, impact_plates, reinforced_underfoot_inserts).

all_consistent(impact_plates) :-
    (indep(s_merchant), consistent(s_merchant, impact_plates) ; \+indep(s_merchant)),
    (indep(s_s2as), consistent(s_s2as, impact_plates) ; \+indep(s_s2as)),
    (indep(s_blauer), consistent(s_blauer, impact_plates) ; \+indep(s_blauer)).

evidence(all_consistent(impact_plates)).
query(true_val(impact_plates, reinforced_underfoot_inserts)).
query(true_val(impact_plates, unk_impact_plates)).

0.90::acc(s_merchant, sidewall_material).
0.85::acc(s_bat, sidewall_material).
0.78::acc(s_blauer, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values flex_walls_urethane=FlexWalls_urethane_sidewalls unk_sidewall_material=Unknown
% @importance 0.68

0.95::true_val(sidewall_material, flex_walls_urethane); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s_merchant, sidewall_material, flex_walls_urethane).
measured(s_bat, sidewall_material, flex_walls_urethane).
measured(s_blauer, sidewall_material, flex_walls_urethane).

all_consistent(sidewall_material) :-
    (indep(s_merchant), consistent(s_merchant, sidewall_material) ; \+indep(s_merchant)),
    consistent(s_bat, sidewall_material),
    (indep(s_blauer), consistent(s_blauer, sidewall_material) ; \+indep(s_blauer)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, flex_walls_urethane)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.90::acc(s_merchant, base_material).
0.88::acc(s_s2as, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values ultra_glide_s_7000=Ultra_Glide_S_7000_grade_sintered unk_base_material=Unknown
% @importance 0.9

0.95::true_val(base_material, ultra_glide_s_7000); 0.05::true_val(base_material, unk_base_material).

measured(s_merchant, base_material, ultra_glide_s_7000).
measured(s_s2as, base_material, ultra_glide_s_7000).

all_consistent(base_material) :-
    consistent(s_merchant, base_material),
    (indep(s_s2as), consistent(s_s2as, base_material) ; \+indep(s_s2as)).

evidence(all_consistent(base_material)).
query(true_val(base_material, ultra_glide_s_7000)).
query(true_val(base_material, unk_base_material)).

0.85::acc(s_bat, base_type).
0.82::acc(s_merchant, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values premium_sintered=Premium_sintered_high_end unk_base_type=Unknown
% @importance 0.8

0.95::true_val(base_type, premium_sintered); 0.05::true_val(base_type, unk_base_type).

measured(s_bat, base_type, premium_sintered).
measured(s_merchant, base_type, premium_sintered).

all_consistent(base_type) :-
    consistent(s_bat, base_type),
    (indep(s_merchant), consistent(s_merchant, base_type) ; \+indep(s_merchant)).

evidence(all_consistent(base_type)).
query(true_val(base_type, premium_sintered)).
query(true_val(base_type, unk_base_type)).

0.85::acc(s_bat, insert_material).

% @attr insert_material
% @type categorical
% @canonical false
% @original_name Insert material
% @values german_stainless_steel=A_grade_German_stainless_steel unk_insert_material=Unknown
% @importance 0.5

0.85::true_val(insert_material, german_stainless_steel); 0.15::true_val(insert_material, unk_insert_material).

measured(s_bat, insert_material, german_stainless_steel).

all_consistent(insert_material) :-
    consistent(s_bat, insert_material).

evidence(all_consistent(insert_material)).
query(true_val(insert_material, german_stainless_steel)).
query(true_val(insert_material, unk_insert_material)).

0.90::acc(s_merchant, available_sizes).
0.82::acc(s_s2as, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values seven_sizes=149_153_156_159_160W_162_164W six_merchant=153_156_159_162_160W_164W five_s2as=149_153_159_160W_164W
% @importance 0.9

0.50::true_val(available_sizes, seven_sizes); 0.30::true_val(available_sizes, six_merchant); 0.20::true_val(available_sizes, five_s2as).

measured(s_merchant, available_sizes, six_merchant).
measured(s_s2as, available_sizes, five_s2as).

all_consistent(available_sizes) :-
    consistent(s_merchant, available_sizes),
    consistent(s_s2as, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, seven_sizes)).
query(true_val(available_sizes, six_merchant)).
query(true_val(available_sizes, five_s2as)).

0.93::acc(s_merchant, effective_edge_153).

% @attr effective_edge_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 153cm
% @values v116_7=116.7 unk_effective_edge_153=Unknown
% @importance 0.85

0.93::true_val(effective_edge_153, v116_7); 0.07::true_val(effective_edge_153, unk_effective_edge_153).

measured(s_merchant, effective_edge_153, v116_7).

all_consistent(effective_edge_153) :- consistent(s_merchant, effective_edge_153).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v116_7)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

0.93::acc(s_merchant, tip_tail_width_size_153).

% @attr tip_tail_width_size_153
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 153cm
% @values v29_3=29.3 unk_tip_tail_width_size_153=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_153, v29_3); 0.07::true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153).

measured(s_merchant, tip_tail_width_size_153, v29_3).

all_consistent(tip_tail_width_size_153) :- consistent(s_merchant, tip_tail_width_size_153).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v29_3)).
query(true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153)).

0.93::acc(s_merchant, waist_width_153).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 153cm
% @values v24_8=24.8 unk_waist_width_153=Unknown
% @importance 0.85

0.93::true_val(waist_width_153, v24_8); 0.07::true_val(waist_width_153, unk_waist_width_153).

measured(s_merchant, waist_width_153, v24_8).

all_consistent(waist_width_153) :- consistent(s_merchant, waist_width_153).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v24_8)).
query(true_val(waist_width_153, unk_waist_width_153)).

0.93::acc(s_merchant, sidecut_radius_size_153).

% @attr sidecut_radius_size_153
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 153cm
% @values v8_8_6_8_8_8=8.8/6.8/8.8 unk_sidecut_radius_size_153=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_153, v8_8_6_8_8_8); 0.07::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(s_merchant, sidecut_radius_size_153, v8_8_6_8_8_8).

all_consistent(sidecut_radius_size_153) :- consistent(s_merchant, sidecut_radius_size_153).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v8_8_6_8_8_8)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

0.93::acc(s_merchant, stance_width_range_size_153).

% @attr stance_width_range_size_153
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 153cm
% @values v53_0=53.0 unk_stance_width_range_size_153=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_153, v53_0); 0.07::true_val(stance_width_range_size_153, unk_stance_width_range_size_153).

measured(s_merchant, stance_width_range_size_153, v53_0).

all_consistent(stance_width_range_size_153) :- consistent(s_merchant, stance_width_range_size_153).

evidence(all_consistent(stance_width_range_size_153)).
query(true_val(stance_width_range_size_153, v53_0)).
query(true_val(stance_width_range_size_153, unk_stance_width_range_size_153)).

0.92::acc(s_merchant, recommended_weight_range_size_153).
0.82::acc(s_s2as, recommended_weight_range_size_153).

% @attr recommended_weight_range_size_153
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 153cm
% @values v59_79=59-79kg v60_80=60-80kg
% @importance 0.875

0.50::true_val(recommended_weight_range_size_153, v59_79); 0.50::true_val(recommended_weight_range_size_153, v60_80).

measured(s_merchant, recommended_weight_range_size_153, v59_79).
measured(s_s2as, recommended_weight_range_size_153, v60_80).

all_consistent(recommended_weight_range_size_153) :-
    consistent(s_merchant, recommended_weight_range_size_153),
    consistent(s_s2as, recommended_weight_range_size_153).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, v59_79)).
query(true_val(recommended_weight_range_size_153, v60_80)).

0.93::acc(s_merchant, effective_edge_156).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 156cm
% @values v118_9=118.9 unk_effective_edge_156=Unknown
% @importance 0.85

0.93::true_val(effective_edge_156, v118_9); 0.07::true_val(effective_edge_156, unk_effective_edge_156).

measured(s_merchant, effective_edge_156, v118_9).

all_consistent(effective_edge_156) :- consistent(s_merchant, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v118_9)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

0.93::acc(s_merchant, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v29_7=29.7 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size, v29_7); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_merchant, tip_tail_width_size, v29_7).

all_consistent(tip_tail_width_size) :- consistent(s_merchant, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_7)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.93::acc(s_merchant, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v25_1=25.1 unk_waist_width_156=Unknown
% @importance 0.85

0.93::true_val(waist_width_156, v25_1); 0.07::true_val(waist_width_156, unk_waist_width_156).

measured(s_merchant, waist_width_156, v25_1).

all_consistent(waist_width_156) :- consistent(s_merchant, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_1)).
query(true_val(waist_width_156, unk_waist_width_156)).

0.93::acc(s_merchant, sidecut_radius_size).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v8_9_6_9_8_9=8.9/6.9/8.9 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size, v8_9_6_9_8_9); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_merchant, sidecut_radius_size, v8_9_6_9_8_9).

all_consistent(sidecut_radius_size) :- consistent(s_merchant, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_9_6_9_8_9)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.93::acc(s_merchant, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v55_0=55.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size, v55_0); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_merchant, stance_width_range_size, v55_0).

all_consistent(stance_width_range_size) :- consistent(s_merchant, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v55_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.93::acc(s_merchant, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values v65_85=65-85kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size, v65_85); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_merchant, recommended_weight_range_size, v65_85).

all_consistent(recommended_weight_range_size) :- consistent(s_merchant, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v65_85)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.93::acc(s_merchant, effective_edge_159).

% @attr effective_edge_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 159cm
% @values v121_0=121.0 unk_effective_edge_159=Unknown
% @importance 0.85

0.93::true_val(effective_edge_159, v121_0); 0.07::true_val(effective_edge_159, unk_effective_edge_159).

measured(s_merchant, effective_edge_159, v121_0).

all_consistent(effective_edge_159) :- consistent(s_merchant, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v121_0)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

0.93::acc(s_merchant, tip_tail_width_size_159).

% @attr tip_tail_width_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 159cm
% @values v30_1=30.1 unk_tip_tail_width_size_159=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_159, v30_1); 0.07::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s_merchant, tip_tail_width_size_159, v30_1).

all_consistent(tip_tail_width_size_159) :- consistent(s_merchant, tip_tail_width_size_159).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v30_1)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

0.93::acc(s_merchant, waist_width_159).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm
% @values v25_4=25.4 unk_waist_width_159=Unknown
% @importance 0.85

0.93::true_val(waist_width_159, v25_4); 0.07::true_val(waist_width_159, unk_waist_width_159).

measured(s_merchant, waist_width_159, v25_4).

all_consistent(waist_width_159) :- consistent(s_merchant, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_4)).
query(true_val(waist_width_159, unk_waist_width_159)).

0.93::acc(s_merchant, sidecut_radius_size_159).

% @attr sidecut_radius_size_159
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 159cm
% @values v9_1_7_1_9_1=9.1/7.1/9.1 unk_sidecut_radius_size_159=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_159, v9_1_7_1_9_1); 0.07::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s_merchant, sidecut_radius_size_159, v9_1_7_1_9_1).

all_consistent(sidecut_radius_size_159) :- consistent(s_merchant, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v9_1_7_1_9_1)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

0.93::acc(s_merchant, stance_width_range_size_159).

% @attr stance_width_range_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 159cm
% @values v56_0=56.0 unk_stance_width_range_size_159=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_159, v56_0); 0.07::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).

measured(s_merchant, stance_width_range_size_159, v56_0).

all_consistent(stance_width_range_size_159) :- consistent(s_merchant, stance_width_range_size_159).

evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v56_0)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

0.93::acc(s_merchant, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 159cm
% @values v71_91=71-91kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_159, v71_91); 0.07::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s_merchant, recommended_weight_range_size_159, v71_91).

all_consistent(recommended_weight_range_size_159) :- consistent(s_merchant, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, v71_91)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

0.93::acc(s_merchant, effective_edge_162).

% @attr effective_edge_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 162cm
% @values v123_1=123.1 unk_effective_edge_162=Unknown
% @importance 0.85

0.93::true_val(effective_edge_162, v123_1); 0.07::true_val(effective_edge_162, unk_effective_edge_162).

measured(s_merchant, effective_edge_162, v123_1).

all_consistent(effective_edge_162) :- consistent(s_merchant, effective_edge_162).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v123_1)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

0.93::acc(s_merchant, tip_tail_width_size_162).

% @attr tip_tail_width_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 162cm
% @values v30_5=30.5 unk_tip_tail_width_size_162=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_162, v30_5); 0.07::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).

measured(s_merchant, tip_tail_width_size_162, v30_5).

all_consistent(tip_tail_width_size_162) :- consistent(s_merchant, tip_tail_width_size_162).

evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v30_5)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

0.93::acc(s_merchant, waist_width_162).

% @attr waist_width_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162cm
% @values v25_7=25.7 unk_waist_width_162=Unknown
% @importance 0.85

0.93::true_val(waist_width_162, v25_7); 0.07::true_val(waist_width_162, unk_waist_width_162).

measured(s_merchant, waist_width_162, v25_7).

all_consistent(waist_width_162) :- consistent(s_merchant, waist_width_162).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v25_7)).
query(true_val(waist_width_162, unk_waist_width_162)).

0.93::acc(s_merchant, sidecut_radius_size_162).

% @attr sidecut_radius_size_162
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 162cm
% @values v9_2_7_2_9_2=9.2/7.2/9.2 unk_sidecut_radius_size_162=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_162, v9_2_7_2_9_2); 0.07::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).

measured(s_merchant, sidecut_radius_size_162, v9_2_7_2_9_2).

all_consistent(sidecut_radius_size_162) :- consistent(s_merchant, sidecut_radius_size_162).

evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v9_2_7_2_9_2)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

0.93::acc(s_merchant, stance_width_range_size_162).

% @attr stance_width_range_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 162cm
% @values v57_0=57.0 unk_stance_width_range_size_162=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_162, v57_0); 0.07::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).

measured(s_merchant, stance_width_range_size_162, v57_0).

all_consistent(stance_width_range_size_162) :- consistent(s_merchant, stance_width_range_size_162).

evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v57_0)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

0.93::acc(s_merchant, recommended_weight_range_size_162).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 162cm
% @values v77_97=77-97kg unk_recommended_weight_range_size_162=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_162, v77_97); 0.07::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).

measured(s_merchant, recommended_weight_range_size_162, v77_97).

all_consistent(recommended_weight_range_size_162) :- consistent(s_merchant, recommended_weight_range_size_162).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, v77_97)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

0.93::acc(s_merchant, effective_edge_160w).

% @attr effective_edge_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 160W
% @values v121_7=121.7 unk_effective_edge_160w=Unknown
% @importance 0.85

0.93::true_val(effective_edge_160w, v121_7); 0.07::true_val(effective_edge_160w, unk_effective_edge_160w).

measured(s_merchant, effective_edge_160w, v121_7).

all_consistent(effective_edge_160w) :- consistent(s_merchant, effective_edge_160w).

evidence(all_consistent(effective_edge_160w)).
query(true_val(effective_edge_160w, v121_7)).
query(true_val(effective_edge_160w, unk_effective_edge_160w)).

0.93::acc(s_merchant, tip_tail_width_size_160w).

% @attr tip_tail_width_size_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 160W
% @values v31_2=31.2 unk_tip_tail_width_size_160w=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_160w, v31_2); 0.07::true_val(tip_tail_width_size_160w, unk_tip_tail_width_size_160w).

measured(s_merchant, tip_tail_width_size_160w, v31_2).

all_consistent(tip_tail_width_size_160w) :- consistent(s_merchant, tip_tail_width_size_160w).

evidence(all_consistent(tip_tail_width_size_160w)).
query(true_val(tip_tail_width_size_160w, v31_2)).
query(true_val(tip_tail_width_size_160w, unk_tip_tail_width_size_160w)).

0.93::acc(s_merchant, waist_width_160w).

% @attr waist_width_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 160W
% @values v26_5=26.5 unk_waist_width_160w=Unknown
% @importance 0.85

0.93::true_val(waist_width_160w, v26_5); 0.07::true_val(waist_width_160w, unk_waist_width_160w).

measured(s_merchant, waist_width_160w, v26_5).

all_consistent(waist_width_160w) :- consistent(s_merchant, waist_width_160w).

evidence(all_consistent(waist_width_160w)).
query(true_val(waist_width_160w, v26_5)).
query(true_val(waist_width_160w, unk_waist_width_160w)).

0.93::acc(s_merchant, sidecut_radius_size_160w).

% @attr sidecut_radius_size_160w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 160W
% @values v9_1_7_1_9_1=9.1/7.1/9.1 unk_sidecut_radius_size_160w=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_160w, v9_1_7_1_9_1); 0.07::true_val(sidecut_radius_size_160w, unk_sidecut_radius_size_160w).

measured(s_merchant, sidecut_radius_size_160w, v9_1_7_1_9_1).

all_consistent(sidecut_radius_size_160w) :- consistent(s_merchant, sidecut_radius_size_160w).

evidence(all_consistent(sidecut_radius_size_160w)).
query(true_val(sidecut_radius_size_160w, v9_1_7_1_9_1)).
query(true_val(sidecut_radius_size_160w, unk_sidecut_radius_size_160w)).

0.93::acc(s_merchant, stance_width_range_size_160w).

% @attr stance_width_range_size_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 160W
% @values v56_0=56.0 unk_stance_width_range_size_160w=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_160w, v56_0); 0.07::true_val(stance_width_range_size_160w, unk_stance_width_range_size_160w).

measured(s_merchant, stance_width_range_size_160w, v56_0).

all_consistent(stance_width_range_size_160w) :- consistent(s_merchant, stance_width_range_size_160w).

evidence(all_consistent(stance_width_range_size_160w)).
query(true_val(stance_width_range_size_160w, v56_0)).
query(true_val(stance_width_range_size_160w, unk_stance_width_range_size_160w)).

0.93::acc(s_merchant, recommended_weight_range_size_160w).

% @attr recommended_weight_range_size_160w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 160W
% @values v80_100=80-100kg unk_recommended_weight_range_size_160w=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_160w, v80_100); 0.07::true_val(recommended_weight_range_size_160w, unk_recommended_weight_range_size_160w).

measured(s_merchant, recommended_weight_range_size_160w, v80_100).

all_consistent(recommended_weight_range_size_160w) :- consistent(s_merchant, recommended_weight_range_size_160w).

evidence(all_consistent(recommended_weight_range_size_160w)).
query(true_val(recommended_weight_range_size_160w, v80_100)).
query(true_val(recommended_weight_range_size_160w, unk_recommended_weight_range_size_160w)).

0.93::acc(s_merchant, effective_edge_164w).

% @attr effective_edge_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 164W
% @values v124_6=124.6 unk_effective_edge_164w=Unknown
% @importance 0.85

0.93::true_val(effective_edge_164w, v124_6); 0.07::true_val(effective_edge_164w, unk_effective_edge_164w).

measured(s_merchant, effective_edge_164w, v124_6).

all_consistent(effective_edge_164w) :- consistent(s_merchant, effective_edge_164w).

evidence(all_consistent(effective_edge_164w)).
query(true_val(effective_edge_164w, v124_6)).
query(true_val(effective_edge_164w, unk_effective_edge_164w)).

0.93::acc(s_merchant, tip_tail_width_size_164w).

% @attr tip_tail_width_size_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size 164W
% @values v31_7=31.7 unk_tip_tail_width_size_164w=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_164w, v31_7); 0.07::true_val(tip_tail_width_size_164w, unk_tip_tail_width_size_164w).

measured(s_merchant, tip_tail_width_size_164w, v31_7).

all_consistent(tip_tail_width_size_164w) :- consistent(s_merchant, tip_tail_width_size_164w).

evidence(all_consistent(tip_tail_width_size_164w)).
query(true_val(tip_tail_width_size_164w, v31_7)).
query(true_val(tip_tail_width_size_164w, unk_tip_tail_width_size_164w)).

0.93::acc(s_merchant, waist_width_164w).

% @attr waist_width_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 164W
% @values v26_9=26.9 unk_waist_width_164w=Unknown
% @importance 0.85

0.93::true_val(waist_width_164w, v26_9); 0.07::true_val(waist_width_164w, unk_waist_width_164w).

measured(s_merchant, waist_width_164w, v26_9).

all_consistent(waist_width_164w) :- consistent(s_merchant, waist_width_164w).

evidence(all_consistent(waist_width_164w)).
query(true_val(waist_width_164w, v26_9)).
query(true_val(waist_width_164w, unk_waist_width_164w)).

0.93::acc(s_merchant, sidecut_radius_size_164w).

% @attr sidecut_radius_size_164w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size 164W
% @values v9_3_7_3_9_3=9.3/7.3/9.3 unk_sidecut_radius_size_164w=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_164w, v9_3_7_3_9_3); 0.07::true_val(sidecut_radius_size_164w, unk_sidecut_radius_size_164w).

measured(s_merchant, sidecut_radius_size_164w, v9_3_7_3_9_3).

all_consistent(sidecut_radius_size_164w) :- consistent(s_merchant, sidecut_radius_size_164w).

evidence(all_consistent(sidecut_radius_size_164w)).
query(true_val(sidecut_radius_size_164w, v9_3_7_3_9_3)).
query(true_val(sidecut_radius_size_164w, unk_sidecut_radius_size_164w)).

0.93::acc(s_merchant, stance_width_range_size_164w).

% @attr stance_width_range_size_164w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size 164W
% @values v57_0=57.0 unk_stance_width_range_size_164w=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_164w, v57_0); 0.07::true_val(stance_width_range_size_164w, unk_stance_width_range_size_164w).

measured(s_merchant, stance_width_range_size_164w, v57_0).

all_consistent(stance_width_range_size_164w) :- consistent(s_merchant, stance_width_range_size_164w).

evidence(all_consistent(stance_width_range_size_164w)).
query(true_val(stance_width_range_size_164w, v57_0)).
query(true_val(stance_width_range_size_164w, unk_stance_width_range_size_164w)).

0.93::acc(s_merchant, recommended_weight_range_size_164w).

% @attr recommended_weight_range_size_164w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 164W
% @values v88_108=88-108kg unk_recommended_weight_range_size_164w=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_164w, v88_108); 0.07::true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w).

measured(s_merchant, recommended_weight_range_size_164w, v88_108).

all_consistent(recommended_weight_range_size_164w) :- consistent(s_merchant, recommended_weight_range_size_164w).

evidence(all_consistent(recommended_weight_range_size_164w)).
query(true_val(recommended_weight_range_size_164w, v88_108)).
query(true_val(recommended_weight_range_size_164w, unk_recommended_weight_range_size_164w)).

0.82::acc(s_s2as, recommended_weight_range_size_149).

% @attr recommended_weight_range_size_149
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size 149cm
% @values v55_72=55-72kg unk_recommended_weight_range_size_149=Unknown
% @importance 0.95

0.82::true_val(recommended_weight_range_size_149, v55_72); 0.18::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).

measured(s_s2as, recommended_weight_range_size_149, v55_72).

all_consistent(recommended_weight_range_size_149) :- consistent(s_s2as, recommended_weight_range_size_149).

evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, v55_72)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

0.88::acc(s_merchant, terrain_suitability).
0.82::acc(s_s2as, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_am_powder_freeride=Park_AllMountain_Powder_Freeride park_resort_powder=Park_Resort_Powder
% @importance 0.9

0.55::true_val(terrain_suitability, park_am_powder_freeride); 0.45::true_val(terrain_suitability, park_resort_powder).

measured(s_merchant, terrain_suitability, park_am_powder_freeride).
measured(s_s2as, terrain_suitability, park_resort_powder).

all_consistent(terrain_suitability) :-
    consistent(s_merchant, terrain_suitability),
    consistent(s_s2as, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_am_powder_freeride)).
query(true_val(terrain_suitability, park_resort_powder)).

0.85::acc(s_merchant, skill_level_recommendation).
0.82::acc(s_s2as, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_to_advanced=Beginners_to_advanced advanced_only=Advanced_riders_only
% @importance 0.9

0.50::true_val(skill_level_recommendation, beginner_to_advanced); 0.50::true_val(skill_level_recommendation, advanced_only).

measured(s_merchant, skill_level_recommendation, beginner_to_advanced).
measured(s_s2as, skill_level_recommendation, advanced_only).

all_consistent(skill_level_recommendation) :-
    consistent(s_merchant, skill_level_recommendation),
    consistent(s_s2as, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_to_advanced)).
query(true_val(skill_level_recommendation, advanced_only)).

0.88::acc(s_s2as, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values aggressive_park_technical=Aggressive_park_riding_technical_resort unk_riding_style=Unknown
% @importance 0.95

0.88::true_val(riding_style, aggressive_park_technical); 0.12::true_val(riding_style, unk_riding_style).

measured(s_s2as, riding_style, aggressive_park_technical).

all_consistent(riding_style) :- consistent(s_s2as, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, aggressive_park_technical)).
query(true_val(riding_style, unk_riding_style)).

0.90::acc(s_merchant, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced unk_rider_level=Unknown
% @importance 0.85

0.90::true_val(rider_level, intermediate_advanced); 0.10::true_val(rider_level, unk_rider_level).

measured(s_merchant, rider_level, intermediate_advanced).

all_consistent(rider_level) :- consistent(s_merchant, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

0.90::acc(s_merchant, width_options).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.90::true_val(width_options, standard_wide); 0.10::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, standard_wide).

all_consistent(width_options) :- consistent(s_merchant, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_wide)).
query(true_val(width_options, unk_width_options)).

0.95::acc(s_merchant, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name Price AUD Melbourne Snowboard Centre
% @values v959_99=959.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v959_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v959_99).

all_consistent(price_aud_merchant) :- consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v959_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.90::acc(s_merchant, estimated_availability_date).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values preorder_may_2026=Preorder_est_May_1_2026_AU_only unk_estimated_availability_date=Unknown
% @importance 0.725

0.90::true_val(estimated_availability_date, preorder_may_2026); 0.10::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s_merchant, estimated_availability_date, preorder_may_2026).

all_consistent(estimated_availability_date) :- consistent(s_merchant, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, preorder_may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.88::acc(s_s2as, price_usd_s2as).

% @attr price_usd_s2as
% @type numeric
% @unit USD
% @canonical false
% @original_name Price USD S2AS
% @values v549=549.0 v558=558.0 v563=563.0
% @importance 0.9

0.40::true_val(price_usd_s2as, v549); 0.35::true_val(price_usd_s2as, v558); 0.25::true_val(price_usd_s2as, v563).

measured(s_s2as, price_usd_s2as, v549).

all_consistent(price_usd_s2as) :- consistent(s_s2as, price_usd_s2as).

evidence(all_consistent(price_usd_s2as)).
query(true_val(price_usd_s2as, v549)).
query(true_val(price_usd_s2as, v558)).
query(true_val(price_usd_s2as, v563)).

0.88::acc(s_blauer, price_usd_blauer).

% @attr price_usd_blauer
% @type numeric
% @unit USD
% @canonical false
% @original_name Price USD Blauer Board Shop
% @values v559_95=559.95 unk_price_usd_blauer=Unknown
% @importance 0.5

0.88::true_val(price_usd_blauer, v559_95); 0.12::true_val(price_usd_blauer, unk_price_usd_blauer).

measured(s_blauer, price_usd_blauer, v559_95).

all_consistent(price_usd_blauer) :- consistent(s_blauer, price_usd_blauer).

evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v559_95)).
query(true_val(price_usd_blauer, unk_price_usd_blauer)).

0.70::acc(s_boardertown, price_usd_boardertown).

% @attr price_usd_boardertown
% @type categorical
% @canonical false
% @original_name Price USD Boardertown
% @values not_shown=Listed_price_not_shown unk_price_usd_boardertown=Unknown
% @importance 0.5

0.70::true_val(price_usd_boardertown, not_shown); 0.30::true_val(price_usd_boardertown, unk_price_usd_boardertown).

measured(s_boardertown, price_usd_boardertown, not_shown).

all_consistent(price_usd_boardertown) :- consistent(s_boardertown, price_usd_boardertown).

evidence(all_consistent(price_usd_boardertown)).
query(true_val(price_usd_boardertown, not_shown)).
query(true_val(price_usd_boardertown, unk_price_usd_boardertown)).

0.82::acc(s_s2as, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values ships_uk_to_usa=Ships_UK_to_USA_3_5_days unk_availability_status=Unknown
% @importance 0.95

0.82::true_val(availability_status, ships_uk_to_usa); 0.18::true_val(availability_status, unk_availability_status).

measured(s_s2as, availability_status, ships_uk_to_usa).

all_consistent(availability_status) :- consistent(s_s2as, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, ships_uk_to_usa)).
query(true_val(availability_status, unk_availability_status)).

0.80::acc(s_blauer, availability_status_blauer).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status Blauer
% @values restocking_soon=Restocking_soon_out_of_stock unk_availability_status_blauer=Unknown
% @importance 0.5

0.80::true_val(availability_status_blauer, restocking_soon); 0.20::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s_blauer, availability_status_blauer, restocking_soon).

all_consistent(availability_status_blauer) :- consistent(s_blauer, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, restocking_soon)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

0.82::acc(s_bat, availability_status_bataleon).

% @attr availability_status_bataleon
% @type categorical
% @canonical false
% @original_name availability_status Bataleon.com
% @values sold_out_restock_fall_2026=Sold_out_restock_Fall_2026 unk_availability_status_bataleon=Unknown
% @importance 0.8

0.82::true_val(availability_status_bataleon, sold_out_restock_fall_2026); 0.18::true_val(availability_status_bataleon, unk_availability_status_bataleon).

measured(s_bat, availability_status_bataleon, sold_out_restock_fall_2026).

all_consistent(availability_status_bataleon) :- consistent(s_bat, availability_status_bataleon).

evidence(all_consistent(availability_status_bataleon)).
query(true_val(availability_status_bataleon, sold_out_restock_fall_2026)).
query(true_val(availability_status_bataleon, unk_availability_status_bataleon)).

0.85::acc(s_merchant, shipping_restriction_melbourne).

% @attr shipping_restriction_melbourne
% @type categorical
% @canonical false
% @original_name Shipping restriction Melbourne Snowboard Centre
% @values australia_only=Only_ships_within_Australia unk_shipping_restriction_melbourne=Unknown
% @importance 0.6

0.85::true_val(shipping_restriction_melbourne, australia_only); 0.15::true_val(shipping_restriction_melbourne, unk_shipping_restriction_melbourne).

measured(s_merchant, shipping_restriction_melbourne, australia_only).

all_consistent(shipping_restriction_melbourne) :- consistent(s_merchant, shipping_restriction_melbourne).

evidence(all_consistent(shipping_restriction_melbourne)).
query(true_val(shipping_restriction_melbourne, australia_only)).
query(true_val(shipping_restriction_melbourne, unk_shipping_restriction_melbourne)).

0.82::acc(s_s2as, retailer_s2as).

% @attr retailer_s2as
% @type categorical
% @canonical false
% @original_name Retailer S2AS
% @values uk_authorized_intl_ship=UK_authorized_retailer_ships_internationally unk_retailer_s2as=Unknown
% @importance 0.95

0.82::true_val(retailer_s2as, uk_authorized_intl_ship); 0.18::true_val(retailer_s2as, unk_retailer_s2as).

measured(s_s2as, retailer_s2as, uk_authorized_intl_ship).

all_consistent(retailer_s2as) :- consistent(s_s2as, retailer_s2as).

evidence(all_consistent(retailer_s2as)).
query(true_val(retailer_s2as, uk_authorized_intl_ship)).
query(true_val(retailer_s2as, unk_retailer_s2as)).

0.80::acc(s_blauer, retailer_blauer).

% @attr retailer_blauer
% @type categorical
% @canonical false
% @original_name Retailer Blauer Board Shop
% @values big_bear_ca_est_1975=Big_Bear_Lake_CA_established_1975 unk_retailer_blauer=Unknown
% @importance 0.5

0.80::true_val(retailer_blauer, big_bear_ca_est_1975); 0.20::true_val(retailer_blauer, unk_retailer_blauer).

measured(s_blauer, retailer_blauer, big_bear_ca_est_1975).

all_consistent(retailer_blauer) :- consistent(s_blauer, retailer_blauer).

evidence(all_consistent(retailer_blauer)).
query(true_val(retailer_blauer, big_bear_ca_est_1975)).
query(true_val(retailer_blauer, unk_retailer_blauer)).

0.88::acc(s_merchant, retailer_melbourne).

% @attr retailer_melbourne
% @type categorical
% @canonical false
% @original_name Retailer Melbourne Snowboard Centre
% @values local_independent_au=Local_independently_owned_Australian_store unk_retailer_melbourne=Unknown
% @importance 1.0

0.88::true_val(retailer_melbourne, local_independent_au); 0.12::true_val(retailer_melbourne, unk_retailer_melbourne).

measured(s_merchant, retailer_melbourne, local_independent_au).

all_consistent(retailer_melbourne) :- consistent(s_merchant, retailer_melbourne).

evidence(all_consistent(retailer_melbourne)).
query(true_val(retailer_melbourne, local_independent_au)).
query(true_val(retailer_melbourne, unk_retailer_melbourne)).

0.78::acc(s_boardertown, retailer_boardertown).

% @attr retailer_boardertown
% @type categorical
% @canonical false
% @original_name Retailer Boardertown
% @values nz_au_physical_stores=NZ_AU_retailer_physical_stores_90day_returns unk_retailer_boardertown=Unknown
% @importance 0.5

0.78::true_val(retailer_boardertown, nz_au_physical_stores); 0.22::true_val(retailer_boardertown, unk_retailer_boardertown).

measured(s_boardertown, retailer_boardertown, nz_au_physical_stores).

all_consistent(retailer_boardertown) :- consistent(s_boardertown, retailer_boardertown).

evidence(all_consistent(retailer_boardertown)).
query(true_val(retailer_boardertown, nz_au_physical_stores)).
query(true_val(retailer_boardertown, unk_retailer_boardertown)).

0.65::acc(s_darkside, retailer_darkside).

% @attr retailer_darkside
% @type categorical
% @canonical false
% @original_name Retailer Darkside Snowboards
% @values killington_vt_usa=Killington_VT_USA unk_retailer_darkside=Unknown
% @importance 0.5

0.65::true_val(retailer_darkside, killington_vt_usa); 0.35::true_val(retailer_darkside, unk_retailer_darkside).

measured(s_darkside, retailer_darkside, killington_vt_usa).

all_consistent(retailer_darkside) :- consistent(s_darkside, retailer_darkside).

evidence(all_consistent(retailer_darkside)).
query(true_val(retailer_darkside, killington_vt_usa)).
query(true_val(retailer_darkside, unk_retailer_darkside)).

0.70::acc(s_snowboards_eu, retailer_snowboards_eu).

% @attr retailer_snowboards_eu
% @type categorical
% @canonical false
% @original_name Retailer Snowboards.eu
% @values nl_specialist_bataleon_dealer=Netherlands_specialist_Bataleon_dealer unk_retailer_snowboards_eu=Unknown
% @importance 0.7

0.70::true_val(retailer_snowboards_eu, nl_specialist_bataleon_dealer); 0.30::true_val(retailer_snowboards_eu, unk_retailer_snowboards_eu).

measured(s_snowboards_eu, retailer_snowboards_eu, nl_specialist_bataleon_dealer).

all_consistent(retailer_snowboards_eu) :- consistent(s_snowboards_eu, retailer_snowboards_eu).

evidence(all_consistent(retailer_snowboards_eu)).
query(true_val(retailer_snowboards_eu, nl_specialist_bataleon_dealer)).
query(true_val(retailer_snowboards_eu, unk_retailer_snowboards_eu)).

0.60::acc(s_ski_pro, retailer_ski_pro_az).

% @attr retailer_ski_pro_az
% @type categorical
% @canonical false
% @original_name Retailer Ski Pro AZ
% @values does_not_stock_placebo=Does_not_appear_to_stock_Placebo unk_retailer_ski_pro_az=Unknown
% @importance 0.5

0.60::true_val(retailer_ski_pro_az, does_not_stock_placebo); 0.40::true_val(retailer_ski_pro_az, unk_retailer_ski_pro_az).

measured(s_ski_pro, retailer_ski_pro_az, does_not_stock_placebo).

all_consistent(retailer_ski_pro_az) :- consistent(s_ski_pro, retailer_ski_pro_az).

evidence(all_consistent(retailer_ski_pro_az)).
query(true_val(retailer_ski_pro_az, does_not_stock_placebo)).
query(true_val(retailer_ski_pro_az, unk_retailer_ski_pro_az)).

0.92::acc(s_bat, manufacturer_direct).

% @attr manufacturer_direct
% @type categorical
% @canonical false
% @original_name Manufacturer direct
% @values bataleon_com_free_ship_45day=Bataleon_com_US_EU_CA_free_ship_gt50_45day_returns unk_manufacturer_direct=Unknown
% @importance 0.8

0.92::true_val(manufacturer_direct, bataleon_com_free_ship_45day); 0.08::true_val(manufacturer_direct, unk_manufacturer_direct).

measured(s_bat, manufacturer_direct, bataleon_com_free_ship_45day).

all_consistent(manufacturer_direct) :- consistent(s_bat, manufacturer_direct).

evidence(all_consistent(manufacturer_direct)).
query(true_val(manufacturer_direct, bataleon_com_free_ship_45day)).
query(true_val(manufacturer_direct, unk_manufacturer_direct)).

0.85::acc(s_bss, brand_reputation_press).

% @attr brand_reputation_press
% @type categorical
% @canonical false
% @original_name Brand reputation specialist press
% @values steady_healthy_growth=Steady_healthy_growth unk_brand_reputation_press=Unknown
% @importance 0.85

0.85::true_val(brand_reputation_press, steady_healthy_growth); 0.15::true_val(brand_reputation_press, unk_brand_reputation_press).

measured(s_bss, brand_reputation_press, steady_healthy_growth).

all_consistent(brand_reputation_press) :- consistent(s_bss, brand_reputation_press).

evidence(all_consistent(brand_reputation_press)).
query(true_val(brand_reputation_press, steady_healthy_growth)).
query(true_val(brand_reputation_press, unk_brand_reputation_press)).

0.78::acc(s_s2as, brand_reputation_retailer).

% @attr brand_reputation_retailer
% @type categorical
% @canonical false
% @original_name Brand reputation retailer
% @values some_of_the_best=S2AS_endorses_as_some_of_the_best unk_brand_reputation_retailer=Unknown
% @importance 0.9

0.78::true_val(brand_reputation_retailer, some_of_the_best); 0.22::true_val(brand_reputation_retailer, unk_brand_reputation_retailer).

measured(s_s2as, brand_reputation_retailer, some_of_the_best).

all_consistent(brand_reputation_retailer) :- consistent(s_s2as, brand_reputation_retailer).

evidence(all_consistent(brand_reputation_retailer)).
query(true_val(brand_reputation_retailer, some_of_the_best)).
query(true_val(brand_reputation_retailer, unk_brand_reputation_retailer)).

0.70::acc(s_snowboards_eu, brand_reputation_specialist).

% @attr brand_reputation_specialist
% @type categorical
% @canonical false
% @original_name Brand reputation specialist store
% @values own_thing_since_2003=Doing_own_thing_since_2003_handmade unk_brand_reputation_specialist=Unknown
% @importance 0.7

0.70::true_val(brand_reputation_specialist, own_thing_since_2003); 0.30::true_val(brand_reputation_specialist, unk_brand_reputation_specialist).

measured(s_snowboards_eu, brand_reputation_specialist, own_thing_since_2003).

all_consistent(brand_reputation_specialist) :- consistent(s_snowboards_eu, brand_reputation_specialist).

evidence(all_consistent(brand_reputation_specialist)).
query(true_val(brand_reputation_specialist, own_thing_since_2003)).
query(true_val(brand_reputation_specialist, unk_brand_reputation_specialist)).

0.70::acc(s_forum68, brand_reputation_community).

% @attr brand_reputation_community
% @type categorical
% @canonical false
% @original_name Brand reputation snowboarding community
% @values marmite_love_or_hate=Like_marmite_love_or_hate unk_brand_reputation_community=Unknown
% @importance 0.6

0.70::true_val(brand_reputation_community, marmite_love_or_hate); 0.30::true_val(brand_reputation_community, unk_brand_reputation_community).

measured(s_forum68, brand_reputation_community, marmite_love_or_hate).

all_consistent(brand_reputation_community) :- consistent(s_forum68, brand_reputation_community).

evidence(all_consistent(brand_reputation_community)).
query(true_val(brand_reputation_community, marmite_love_or_hate)).
query(true_val(brand_reputation_community, unk_brand_reputation_community)).

0.60::acc(s_forum69, brand_market_trend).

% @attr brand_market_trend
% @type categorical
% @canonical false
% @original_name Brand market trend
% @values trending_copied_3bt=Trending_manufacturers_copying_3BT unk_brand_market_trend=Unknown
% @importance 0.4

0.60::true_val(brand_market_trend, trending_copied_3bt); 0.40::true_val(brand_market_trend, unk_brand_market_trend).

measured(s_forum69, brand_market_trend, trending_copied_3bt).

all_consistent(brand_market_trend) :- consistent(s_forum69, brand_market_trend).

evidence(all_consistent(brand_market_trend)).
query(true_val(brand_market_trend, trending_copied_3bt)).
query(true_val(brand_market_trend, unk_brand_market_trend)).

0.80::acc(s_wiki, brand_reputation_industry).

% @attr brand_reputation_industry
% @type categorical
% @canonical false
% @original_name Brand reputation industry
% @values nidecker_second_biggest=Nidecker_second_biggest_snowboard_company unk_brand_reputation_industry=Unknown
% @importance 0.5

0.80::true_val(brand_reputation_industry, nidecker_second_biggest); 0.20::true_val(brand_reputation_industry, unk_brand_reputation_industry).

measured(s_wiki, brand_reputation_industry, nidecker_second_biggest).

all_consistent(brand_reputation_industry) :- consistent(s_wiki, brand_reputation_industry).

evidence(all_consistent(brand_reputation_industry)).
query(true_val(brand_reputation_industry, nidecker_second_biggest)).
query(true_val(brand_reputation_industry, unk_brand_reputation_industry)).

0.90::acc(s_merchant, key_differentiator).
0.87::acc(s_bss, key_differentiator).

% @attr key_differentiator
% @type categorical
% @canonical false
% @original_name Key differentiator
% @values first_no_3d_base=First_Bataleon_without_3D_base_technology unk_key_differentiator=Unknown
% @importance 0.9

0.95::true_val(key_differentiator, first_no_3d_base); 0.05::true_val(key_differentiator, unk_key_differentiator).

measured(s_merchant, key_differentiator, first_no_3d_base).
measured(s_bss, key_differentiator, first_no_3d_base).

all_consistent(key_differentiator) :-
    consistent(s_merchant, key_differentiator),
    consistent(s_bss, key_differentiator).

evidence(all_consistent(key_differentiator)).
query(true_val(key_differentiator, first_no_3d_base)).
query(true_val(key_differentiator, unk_key_differentiator)).

0.85::acc(s_bss, no_3bt_significance).

% @attr no_3bt_significance
% @type categorical
% @canonical false
% @original_name No 3BT significance
% @values breaks_tradition_never_without_3d=Breaks_tradition_Bataleon_never_made_board_without_3D unk_no_3bt_significance=Unknown
% @importance 0.7

0.85::true_val(no_3bt_significance, breaks_tradition_never_without_3d); 0.15::true_val(no_3bt_significance, unk_no_3bt_significance).

measured(s_bss, no_3bt_significance, breaks_tradition_never_without_3d).

all_consistent(no_3bt_significance) :- consistent(s_bss, no_3bt_significance).

evidence(all_consistent(no_3bt_significance)).
query(true_val(no_3bt_significance, breaks_tradition_never_without_3d)).
query(true_val(no_3bt_significance, unk_no_3bt_significance)).

0.88::acc(s_merchant, appeal).

% @attr appeal
% @type categorical
% @canonical false
% @original_name Appeal
% @values traditional_camber_edge_feel=Opens_to_riders_preferring_traditional_camber_edge unk_appeal=Unknown
% @importance 0.9

0.88::true_val(appeal, traditional_camber_edge_feel); 0.12::true_val(appeal, unk_appeal).

measured(s_merchant, appeal, traditional_camber_edge_feel).

all_consistent(appeal) :- consistent(s_merchant, appeal).

evidence(all_consistent(appeal)).
query(true_val(appeal, traditional_camber_edge_feel)).
query(true_val(appeal, unk_appeal)).

0.85::acc(s_bss, industry_context).

% @attr industry_context
% @type categorical
% @canonical false
% @original_name Industry context
% @values in_tune_freestyle_expanded=Leading_focus_freestyle_audience_expanded_twins_directional unk_industry_context=Unknown
% @importance 0.95

0.85::true_val(industry_context, in_tune_freestyle_expanded); 0.15::true_val(industry_context, unk_industry_context).

measured(s_bss, industry_context, in_tune_freestyle_expanded).

all_consistent(industry_context) :- consistent(s_bss, industry_context).

evidence(all_consistent(industry_context)).
query(true_val(industry_context, in_tune_freestyle_expanded)).
query(true_val(industry_context, unk_industry_context)).

0.72::acc(s_snowdays, comparable_board_cross_brand).
0.65::acc(s_forum96, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_doa=CAPiTA_DOA_hybrid_camber_best_am_freestyle unk_comparable_board_cross_brand=Unknown
% @importance 0.6

0.80::true_val(comparable_board_cross_brand, capita_doa); 0.20::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s_snowdays, comparable_board_cross_brand, capita_doa).
measured(s_forum96, comparable_board_cross_brand, capita_doa).

all_consistent(comparable_board_cross_brand) :-
    consistent(s_snowdays, comparable_board_cross_brand),
    consistent(s_forum96, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.65::acc(s_forum94, user_review_forum_doa).

% @attr user_review_forum_doa
% @type categorical
% @canonical false
% @original_name user_review_forum DOA vs Bataleon
% @values doa_carving_bataleon_buttering=DOA_carving_charging_Bataleon_buttering_forgiveness unk_user_review_forum_doa=Unknown
% @importance 0.65

0.65::true_val(user_review_forum_doa, doa_carving_bataleon_buttering); 0.35::true_val(user_review_forum_doa, unk_user_review_forum_doa).

measured(s_forum94, user_review_forum_doa, doa_carving_bataleon_buttering).

all_consistent(user_review_forum_doa) :- consistent(s_forum94, user_review_forum_doa).

evidence(all_consistent(user_review_forum_doa)).
query(true_val(user_review_forum_doa, doa_carving_bataleon_buttering)).
query(true_val(user_review_forum_doa, unk_user_review_forum_doa)).

0.82::acc(s_s2as, comparable_board_same_brand).
0.78::acc(s_s2as_tornado, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values tornado_2027=Tornado_2027_8_10_flex_3BT_628usd unk_comparable_board_same_brand=Unknown
% @importance 0.6

0.82::true_val(comparable_board_same_brand, tornado_2027); 0.18::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s_s2as, comparable_board_same_brand, tornado_2027).

all_consistent(comparable_board_same_brand) :- consistent(s_s2as, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, tornado_2027)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.80::acc(s_s2as, comparable_board_same_brand_2).

% @attr comparable_board_same_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand Whatever
% @values whatever_2027=Whatever_2027_5_10_flex_3BT_538usd unk_comparable_board_same_brand_2=Unknown
% @importance 0.6

0.80::true_val(comparable_board_same_brand_2, whatever_2027); 0.20::true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2).

measured(s_s2as, comparable_board_same_brand_2, whatever_2027).

all_consistent(comparable_board_same_brand_2) :- consistent(s_s2as, comparable_board_same_brand_2).

evidence(all_consistent(comparable_board_same_brand_2)).
query(true_val(comparable_board_same_brand_2, whatever_2027)).
query(true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2)).

0.78::acc(s_blauer, comparable_board_same_brand_3).

% @attr comparable_board_same_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand Stereo Team
% @values stereo_team_2027=Stereo_Team_2027_6_10_flex_3BT_SideKick_630usd unk_comparable_board_same_brand_3=Unknown
% @importance 0.6

0.78::true_val(comparable_board_same_brand_3, stereo_team_2027); 0.22::true_val(comparable_board_same_brand_3, unk_comparable_board_same_brand_3).

measured(s_blauer, comparable_board_same_brand_3, stereo_team_2027).

all_consistent(comparable_board_same_brand_3) :- consistent(s_blauer, comparable_board_same_brand_3).

evidence(all_consistent(comparable_board_same_brand_3)).
query(true_val(comparable_board_same_brand_3, stereo_team_2027)).
query(true_val(comparable_board_same_brand_3, unk_comparable_board_same_brand_3)).

0.70::acc(s_snowdays, comparable_board_cross_brand_2).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand directional twin
% @values directional_twin_am=Popular_directional_twin_all_mountain_competitor unk_comparable_board_cross_brand_2=Unknown
% @importance 0.6

0.70::true_val(comparable_board_cross_brand_2, directional_twin_am); 0.30::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).

measured(s_snowdays, comparable_board_cross_brand_2, directional_twin_am).

all_consistent(comparable_board_cross_brand_2) :- consistent(s_snowdays, comparable_board_cross_brand_2).

evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, directional_twin_am)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

0.70::acc(s_snowdays, comparable_board_cross_brand_3).

% @attr comparable_board_cross_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand best overall
% @values rated_best_overall_am=Rated_best_overall_all_mountain_snowboard unk_comparable_board_cross_brand_3=Unknown
% @importance 0.6

0.70::true_val(comparable_board_cross_brand_3, rated_best_overall_am); 0.30::true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3).

measured(s_snowdays, comparable_board_cross_brand_3, rated_best_overall_am).

all_consistent(comparable_board_cross_brand_3) :- consistent(s_snowdays, comparable_board_cross_brand_3).

evidence(all_consistent(comparable_board_cross_brand_3)).
query(true_val(comparable_board_cross_brand_3, rated_best_overall_am)).
query(true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3)).

0.65::acc(s_general, comparable_board_cross_brand_4).

% @attr comparable_board_cross_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand conventional camber
% @values conventional_camber_competitors=Direct_competition_conventional_camber_Capita_Burton_Salomon unk_comparable_board_cross_brand_4=Unknown
% @importance 0.6

0.65::true_val(comparable_board_cross_brand_4, conventional_camber_competitors); 0.35::true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4).

measured(s_general, comparable_board_cross_brand_4, conventional_camber_competitors).

all_consistent(comparable_board_cross_brand_4) :- consistent(s_general, comparable_board_cross_brand_4).

evidence(all_consistent(comparable_board_cross_brand_4)).
query(true_val(comparable_board_cross_brand_4, conventional_camber_competitors)).
query(true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4)).

0.65::acc(s_forum63, user_review_forum_3bt_ice).

% @attr user_review_forum_3bt_ice
% @type categorical
% @canonical false
% @original_name user_review_forum 3BT ice complaint
% @values reduced_edge_hold_ice=Frequent_complaint_reduced_edge_hold_on_ice_not_applicable_to_Placebo unk_user_review_forum_3bt_ice=Unknown
% @importance 0.8

0.65::true_val(user_review_forum_3bt_ice, reduced_edge_hold_ice); 0.35::true_val(user_review_forum_3bt_ice, unk_user_review_forum_3bt_ice).

measured(s_forum63, user_review_forum_3bt_ice, reduced_edge_hold_ice).

all_consistent(user_review_forum_3bt_ice) :- consistent(s_forum63, user_review_forum_3bt_ice).

evidence(all_consistent(user_review_forum_3bt_ice)).
query(true_val(user_review_forum_3bt_ice, reduced_edge_hold_ice)).
query(true_val(user_review_forum_3bt_ice, unk_user_review_forum_3bt_ice)).

0.65::acc(s_forum63b, user_review_forum_3bt_edge).

% @attr user_review_forum_3bt_edge
% @type categorical
% @canonical false
% @original_name user_review_forum 3BT edge hold
% @values hold_edge_like_camber=Experienced_riders_say_3BT_holds_edge_like_camber unk_user_review_forum_3bt_edge=Unknown
% @importance 0.8

0.65::true_val(user_review_forum_3bt_edge, hold_edge_like_camber); 0.35::true_val(user_review_forum_3bt_edge, unk_user_review_forum_3bt_edge).

measured(s_forum63b, user_review_forum_3bt_edge, hold_edge_like_camber).

all_consistent(user_review_forum_3bt_edge) :- consistent(s_forum63b, user_review_forum_3bt_edge).

evidence(all_consistent(user_review_forum_3bt_edge)).
query(true_val(user_review_forum_3bt_edge, hold_edge_like_camber)).
query(true_val(user_review_forum_3bt_edge, unk_user_review_forum_3bt_edge)).

0.78::acc(s_merchant, placebo_advantage).

% @attr placebo_advantage
% @type categorical
% @canonical false
% @original_name Placebo advantage
% @values addresses_edge_hold_complaint=Removing_3BT_addresses_main_complaint_suitable_icy unk_placebo_advantage=Unknown
% @importance 0.8

0.78::true_val(placebo_advantage, addresses_edge_hold_complaint); 0.22::true_val(placebo_advantage, unk_placebo_advantage).

measured(s_merchant, placebo_advantage, addresses_edge_hold_complaint).

all_consistent(placebo_advantage) :- consistent(s_merchant, placebo_advantage).

evidence(all_consistent(placebo_advantage)).
query(true_val(placebo_advantage, addresses_edge_hold_complaint)).
query(true_val(placebo_advantage, unk_placebo_advantage)).

0.70::acc(s_forum68b, learning_curve).

% @attr learning_curve
% @type categorical
% @canonical false
% @original_name Learning curve
% @values no_adaptation_needed=3BT_requires_adaptation_Placebo_does_not unk_learning_curve=Unknown
% @importance 0.6

0.70::true_val(learning_curve, no_adaptation_needed); 0.30::true_val(learning_curve, unk_learning_curve).

measured(s_forum68b, learning_curve, no_adaptation_needed).

all_consistent(learning_curve) :- consistent(s_forum68b, learning_curve).

evidence(all_consistent(learning_curve)).
query(true_val(learning_curve, no_adaptation_needed)).
query(true_val(learning_curve, unk_learning_curve)).

0.62::acc(s_forum70, user_review_forum_3bt_mixed).
0.60::acc(s_forum64, user_review_forum_3bt_mixed).

% @attr user_review_forum_3bt_mixed
% @type categorical
% @canonical false
% @original_name user_review_forum 3BT mixed
% @values love_catch_free_dislike_speed=Some_love_catch_free_others_dislike_at_speed unk_user_review_forum_3bt_mixed=Unknown
% @importance 0.625

0.68::true_val(user_review_forum_3bt_mixed, love_catch_free_dislike_speed); 0.32::true_val(user_review_forum_3bt_mixed, unk_user_review_forum_3bt_mixed).

measured(s_forum70, user_review_forum_3bt_mixed, love_catch_free_dislike_speed).
measured(s_forum64, user_review_forum_3bt_mixed, love_catch_free_dislike_speed).

all_consistent(user_review_forum_3bt_mixed) :-
    consistent(s_forum70, user_review_forum_3bt_mixed),
    consistent(s_forum64, user_review_forum_3bt_mixed).

evidence(all_consistent(user_review_forum_3bt_mixed)).
query(true_val(user_review_forum_3bt_mixed, love_catch_free_dislike_speed)).
query(true_val(user_review_forum_3bt_mixed, unk_user_review_forum_3bt_mixed)).

0.60::acc(s_forum91, user_review_forum_bases).

% @attr user_review_forum_bases
% @type categorical
% @canonical false
% @original_name user_review_forum bases scratch
% @values bases_scratch_easily=Forum_notes_bases_can_scratch_up_easily unk_user_review_forum_bases=Unknown
% @importance 0.75

0.60::true_val(user_review_forum_bases, bases_scratch_easily); 0.40::true_val(user_review_forum_bases, unk_user_review_forum_bases).

measured(s_forum91, user_review_forum_bases, bases_scratch_easily).

all_consistent(user_review_forum_bases) :- consistent(s_forum91, user_review_forum_bases).

evidence(all_consistent(user_review_forum_bases)).
query(true_val(user_review_forum_bases, bases_scratch_easily)).
query(true_val(user_review_forum_bases, unk_user_review_forum_bases)).

0.55::acc(s_bat_reviews, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values catch_free_edge_hold_playful=Catch_free_riding_edge_hold_playful_feel unk_positive_aspect=Unknown
% @importance 0.65

0.55::true_val(positive_aspect, catch_free_edge_hold_playful); 0.45::true_val(positive_aspect, unk_positive_aspect).

measured(s_bat_reviews, positive_aspect, catch_free_edge_hold_playful).

all_consistent(positive_aspect) :- consistent(s_bat_reviews, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, catch_free_edge_hold_playful)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.60::acc(s_forum_delam, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values delamination_reported=One_user_reported_delamination_prior_model unk_negative_aspect=Unknown
% @importance 0.75

0.60::true_val(negative_aspect, delamination_reported); 0.40::true_val(negative_aspect, unk_negative_aspect).

measured(s_forum_delam, negative_aspect, delamination_reported).

all_consistent(negative_aspect) :- consistent(s_forum_delam, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, delamination_reported)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.60::acc(s_forum91b, user_review_forum_quality_dispute).

% @attr user_review_forum_quality_dispute
% @type categorical
% @canonical false
% @original_name user_review_forum quality dispute
% @values shop_says_break_users_dispute=Shop_said_they_break_others_dispute_quality_high unk_user_review_forum_quality_dispute=Unknown
% @importance 0.75

0.60::true_val(user_review_forum_quality_dispute, shop_says_break_users_dispute); 0.40::true_val(user_review_forum_quality_dispute, unk_user_review_forum_quality_dispute).

measured(s_forum91b, user_review_forum_quality_dispute, shop_says_break_users_dispute).

all_consistent(user_review_forum_quality_dispute) :- consistent(s_forum91b, user_review_forum_quality_dispute).

evidence(all_consistent(user_review_forum_quality_dispute)).
query(true_val(user_review_forum_quality_dispute, shop_says_break_users_dispute)).
query(true_val(user_review_forum_quality_dispute, unk_user_review_forum_quality_dispute)).

0.65::acc(s_forum91c, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values high_quality_first_hand=Pretty_high_quality_experienced_first_hand unk_user_review_forum=Unknown
% @importance 0.75

0.65::true_val(user_review_forum, high_quality_first_hand); 0.35::true_val(user_review_forum, unk_user_review_forum).

measured(s_forum91c, user_review_forum, high_quality_first_hand).

all_consistent(user_review_forum) :- consistent(s_forum91c, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, high_quality_first_hand)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.78::acc(s_blauer, flex_walls_innovation).

% @attr flex_walls_innovation
% @type categorical
% @canonical false
% @original_name Flex Walls innovation
% @values smoother_turns_chatter_cold=Smoother_turn_entry_chatter_absorption_cold_durability unk_flex_walls_innovation=Unknown
% @importance 0.75

0.78::true_val(flex_walls_innovation, smoother_turns_chatter_cold); 0.22::true_val(flex_walls_innovation, unk_flex_walls_innovation).

measured(s_blauer, flex_walls_innovation, smoother_turns_chatter_cold).

all_consistent(flex_walls_innovation) :- consistent(s_blauer, flex_walls_innovation).

evidence(all_consistent(flex_walls_innovation)).
query(true_val(flex_walls_innovation, smoother_turns_chatter_cold)).
query(true_val(flex_walls_innovation, unk_flex_walls_innovation)).

0.72::acc(s_fanblog, materials_summary).

% @attr materials_summary
% @type categorical
% @canonical false
% @original_name Materials summary
% @values wood_sintered_triax_carbon=Wood_core_sintered_PTex_triaxial_fiberglass_carbon unk_materials_summary=Unknown
% @importance 0.4

0.72::true_val(materials_summary, wood_sintered_triax_carbon); 0.28::true_val(materials_summary, unk_materials_summary).

measured(s_fanblog, materials_summary, wood_sintered_triax_carbon).

all_consistent(materials_summary) :- consistent(s_fanblog, materials_summary).

evidence(all_consistent(materials_summary)).
query(true_val(materials_summary, wood_sintered_triax_carbon)).
query(true_val(materials_summary, unk_materials_summary)).

0.85::acc(s_s2as, market_segment).

% @attr market_segment
% @type categorical
% @canonical false
% @original_name Market segment
% @values high_end_freestyle_am=High_end_performance_freestyle_all_mountain unk_market_segment=Unknown
% @importance 0.95

0.85::true_val(market_segment, high_end_freestyle_am); 0.15::true_val(market_segment, unk_market_segment).

measured(s_s2as, market_segment, high_end_freestyle_am).

all_consistent(market_segment) :- consistent(s_s2as, market_segment).

evidence(all_consistent(market_segment)).
query(true_val(market_segment, high_end_freestyle_am)).
query(true_val(market_segment, unk_market_segment)).

0.82::acc(s_s2as, price_position).

% @attr price_position
% @type categorical
% @canonical false
% @original_name Price position
% @values above_mid_range=Above_mid_range_cheaper_than_Tornado_more_than_Whatever unk_price_position=Unknown
% @importance 0.9

0.82::true_val(price_position, above_mid_range); 0.18::true_val(price_position, unk_price_position).

measured(s_s2as, price_position, above_mid_range).

all_consistent(price_position) :- consistent(s_s2as, price_position).

evidence(all_consistent(price_position)).
query(true_val(price_position, above_mid_range)).
query(true_val(price_position, unk_price_position)).

0.87::acc(s_merchant, market_innovation).
0.85::acc(s_bss, market_innovation).

% @attr market_innovation
% @type categorical
% @canonical false
% @original_name Market innovation
% @values expanding_beyond_3bt=First_time_expanding_beyond_3BT_broadening_customer_base unk_market_innovation=Unknown
% @importance 0.875

0.95::true_val(market_innovation, expanding_beyond_3bt); 0.05::true_val(market_innovation, unk_market_innovation).

measured(s_merchant, market_innovation, expanding_beyond_3bt).
measured(s_bss, market_innovation, expanding_beyond_3bt).

all_consistent(market_innovation) :-
    consistent(s_merchant, market_innovation),
    consistent(s_bss, market_innovation).

evidence(all_consistent(market_innovation)).
query(true_val(market_innovation, expanding_beyond_3bt)).
query(true_val(market_innovation, unk_market_innovation)).

0.82::acc(s_bss, season_trend).

% @attr season_trend
% @type categorical
% @canonical false
% @original_name Season trend
% @values strong_demand_twin_freestyle=Strong_demand_twin_freestyle_driven_younger_riders unk_season_trend=Unknown
% @importance 0.85

0.82::true_val(season_trend, strong_demand_twin_freestyle); 0.18::true_val(season_trend, unk_season_trend).

measured(s_bss, season_trend, strong_demand_twin_freestyle).

all_consistent(season_trend) :- consistent(s_bss, season_trend).

evidence(all_consistent(season_trend)).
query(true_val(season_trend, strong_demand_twin_freestyle)).
query(true_val(season_trend, unk_season_trend)).

0.85::acc(s_bss, brand_strategy).

% @attr brand_strategy
% @type categorical
% @canonical false
% @original_name Brand strategy
% @values first_foray_second_dimension=First_ever_foray_into_second_dimension unk_brand_strategy=Unknown
% @importance 0.85

0.85::true_val(brand_strategy, first_foray_second_dimension); 0.15::true_val(brand_strategy, unk_brand_strategy).

measured(s_bss, brand_strategy, first_foray_second_dimension).

all_consistent(brand_strategy) :- consistent(s_bss, brand_strategy).

evidence(all_consistent(brand_strategy)).
query(true_val(brand_strategy, first_foray_second_dimension)).
query(true_val(brand_strategy, unk_brand_strategy)).

0.90::acc(s_merchant, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values standard_2x4_all_brands=Standard_2x4_inserts_compatible_all_major_brands unk_binding_compatibility=Unknown
% @importance 0.85

0.90::true_val(binding_compatibility, standard_2x4_all_brands); 0.10::true_val(binding_compatibility, unk_binding_compatibility).

measured(s_merchant, binding_compatibility, standard_2x4_all_brands).

all_consistent(binding_compatibility) :- consistent(s_merchant, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_2x4_all_brands)).
query(true_val(binding_compatibility, unk_binding_compatibility)).