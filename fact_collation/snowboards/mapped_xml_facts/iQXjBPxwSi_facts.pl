0.15::indep(sm).
0.15::indep(s5).
0.15::indep(s6).
0.20::indep(s69).
0.20::indep(s81).
0.25::indep(s49).
0.30::indep(s1).
0.25::indep(s63).
0.25::indep(s96).
0.25::indep(s100).
0.80::indep(s44).
0.80::indep(s35).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nitro=Nitro unk_brand=Unknown
% @importance 0.80

0.90::acc(s1, brand).
0.93::acc(s14, brand).

0.95::true_val(brand, nitro); 0.05::true_val(brand, unk_brand).

measured(s1, brand, nitro).
measured(s14, brand, nitro).

all_consistent(brand) :-
    consistent(s14, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).

evidence(all_consistent(brand)).
query(true_val(brand, nitro)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values og=OG unk_model_name=Unknown
% @importance 0.93

0.88::acc(s1, model_name).
0.85::acc(s5, model_name).

0.95::true_val(model_name, og); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, og).
measured(s5, model_name, og).

all_consistent(model_name) :-
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)),
    (indep(s5), consistent(s5, model_name) ; \+indep(s5)).

evidence(all_consistent(model_name)).
query(true_val(model_name, og)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2027=2027 unk_model_year=Unknown
% @importance 0.93

0.88::acc(s1, model_year).
0.85::acc(s5, model_year).

0.95::true_val(model_year, v2027); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, v2027).
measured(s5, model_year, v2027).

all_consistent(model_year) :-
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)),
    (indep(s5), consistent(s5, model_year) ; \+indep(s5)).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values guest_shaper_series=Guest_Shaper_Series unk_model_series=Unknown
% @importance 0.88

0.88::acc(s1, model_series).
0.90::acc(s4, model_series).

0.95::true_val(model_series, guest_shaper_series); 0.05::true_val(model_series, unk_model_series).

measured(s1, model_series, guest_shaper_series).
measured(s4, model_series, guest_shaper_series).

all_consistent(model_series) :-
    (indep(s1), consistent(s1, model_series) ; \+indep(s1)),
    consistent(s4, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, guest_shaper_series)).
query(true_val(model_series, unk_model_series)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values nitro_ag_hunenberg=Nitro_AG_Hunenberg_Switzerland unk_manufacturer=Unknown
% @importance 0.90

0.95::acc(s56, manufacturer).

0.93::true_val(manufacturer, nitro_ag_hunenberg); 0.07::true_val(manufacturer, unk_manufacturer).

measured(s56, manufacturer, nitro_ag_hunenberg).

all_consistent(manufacturer) :- consistent(s56, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, nitro_ag_hunenberg)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr eu_representative
% @type categorical
% @canonical false
% @original_name EU representative
% @values nitro_italia_arco=Nitro_Distribution_Italia_Arco unk_eu_representative=Unknown
% @importance 0.90

0.95::acc(s56, eu_representative).

0.93::true_val(eu_representative, nitro_italia_arco); 0.07::true_val(eu_representative, unk_eu_representative).

measured(s56, eu_representative, nitro_italia_arco).

all_consistent(eu_representative) :- consistent(s56, eu_representative).

evidence(all_consistent(eu_representative)).
query(true_val(eu_representative, nitro_italia_arco)).
query(true_val(eu_representative, unk_eu_representative)).

% @attr brand_founded
% @type categorical
% @canonical false
% @original_name Brand founded
% @values y1990_seattle=1990_Seattle_by_Delago_and_Ardelt y1989=1989
% @importance 0.53

0.95::acc(s14, brand_founded).
0.93::acc(s103, brand_founded).
0.55::acc(s100, brand_founded).

0.85::true_val(brand_founded, y1990_seattle); 0.15::true_val(brand_founded, y1989).

measured(s14, brand_founded, y1990_seattle).
measured(s103, brand_founded, y1990_seattle).
measured(s100, brand_founded, y1989).

all_consistent(brand_founded) :-
    consistent(s14, brand_founded),
    consistent(s103, brand_founded),
    (indep(s100), consistent(s100, brand_founded) ; \+indep(s100)).

evidence(all_consistent(brand_founded)).
query(true_val(brand_founded, y1990_seattle)).
query(true_val(brand_founded, y1989)).

% @attr brand_philosophy
% @type categorical
% @canonical false
% @original_name Brand philosophy
% @values authenticity_independence=Authenticity_and_independence_rider_owned unk_brand_philosophy=Unknown
% @importance 0.65

0.90::acc(s4, brand_philosophy).

0.88::true_val(brand_philosophy, authenticity_independence); 0.12::true_val(brand_philosophy, unk_brand_philosophy).

measured(s4, brand_philosophy, authenticity_independence).

all_consistent(brand_philosophy) :- consistent(s4, brand_philosophy).

evidence(all_consistent(brand_philosophy)).
query(true_val(brand_philosophy, authenticity_independence)).
query(true_val(brand_philosophy, unk_brand_philosophy)).

% @attr no_direct_sales
% @type categorical
% @canonical false
% @original_name Nitro does not sell direct to consumer online
% @values yes_retailer_only=Yes_supports_retailer_channel unk_no_direct_sales=Unknown
% @importance 0.70

0.93::acc(s14, no_direct_sales).

0.90::true_val(no_direct_sales, yes_retailer_only); 0.10::true_val(no_direct_sales, unk_no_direct_sales).

measured(s14, no_direct_sales, yes_retailer_only).

all_consistent(no_direct_sales) :- consistent(s14, no_direct_sales).

evidence(all_consistent(no_direct_sales)).
query(true_val(no_direct_sales, yes_retailer_only)).
query(true_val(no_direct_sales, unk_no_direct_sales)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.93

0.88::acc(s1, product_type).
0.85::acc(s5, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s5, product_type, snowboard).

all_consistent(product_type) :-
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)),
    (indep(s5), consistent(s5, product_type) ; \+indep(s5)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 0.90

0.82::acc(s6, board_category).
0.90::acc(sm, board_category).

0.95::true_val(board_category, freestyle_all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(s6, board_category, freestyle_all_mountain).
measured(sm, board_category, freestyle_all_mountain).

all_consistent(board_category) :-
    (indep(s6), consistent(s6, board_category) ; \+indep(s6)),
    (indep(sm), consistent(sm, board_category) ; \+indep(sm)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values jan_2026=January_2026 unk_model_first_available_year=Unknown
% @importance 0.93

0.85::acc(s1, model_first_available_year).
0.82::acc(s5, model_first_available_year).

0.95::true_val(model_first_available_year, jan_2026); 0.05::true_val(model_first_available_year, unk_model_first_available_year).

measured(s1, model_first_available_year, jan_2026).
measured(s5, model_first_available_year, jan_2026).

all_consistent(model_first_available_year) :-
    (indep(s1), consistent(s1, model_first_available_year) ; \+indep(s1)),
    (indep(s5), consistent(s5, model_first_available_year) ; \+indep(s5)).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, jan_2026)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_2026=May_2026 unk_estimated_availability_date=Unknown
% @importance 0.95

0.82::acc(s5, estimated_availability_date).

0.78::true_val(estimated_availability_date, may_2026); 0.22::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s5, estimated_availability_date, may_2026).

all_consistent(estimated_availability_date) :-
    (indep(s5), consistent(s5, estimated_availability_date) ; \+indep(s5)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr limited_availability
% @type categorical
% @canonical false
% @original_name Limited availability
% @values yes_single_season=Yes_single_season_graphics unk_limited_availability=Unknown
% @importance 0.83

0.85::acc(s1, limited_availability).

0.82::true_val(limited_availability, yes_single_season); 0.18::true_val(limited_availability, unk_limited_availability).

measured(s1, limited_availability, yes_single_season).

all_consistent(limited_availability) :-
    (indep(s1), consistent(s1, limited_availability) ; \+indep(s1)).

evidence(all_consistent(limited_availability)).
query(true_val(limited_availability, yes_single_season)).
query(true_val(limited_availability, unk_limited_availability)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values nitro_team=Nitro_Team unk_predecessor_model_name=Unknown
% @importance 0.83

0.85::acc(s1, predecessor_model_name).

0.82::true_val(predecessor_model_name, nitro_team); 0.18::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s1, predecessor_model_name, nitro_team).

all_consistent(predecessor_model_name) :-
    (indep(s1), consistent(s1, predecessor_model_name) ; \+indep(s1)).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, nitro_team)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values homage_og_riders=Homage_to_original_Nitro_team_riders unk_design_inspiration=Unknown
% @importance 0.93

0.85::acc(s1, design_inspiration).
0.85::acc(s5, design_inspiration).

0.95::true_val(design_inspiration, homage_og_riders); 0.05::true_val(design_inspiration, unk_design_inspiration).

measured(s1, design_inspiration, homage_og_riders).
measured(s5, design_inspiration, homage_og_riders).

all_consistent(design_inspiration) :-
    (indep(s1), consistent(s1, design_inspiration) ; \+indep(s1)),
    (indep(s5), consistent(s5, design_inspiration) ; \+indep(s5)).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, homage_og_riders)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values six_og_riders=Rohrer_Neary_Goller_Plotzeneder_Eberharter_Hagstrom unk_pro_rider_name=Unknown
% @importance 0.83

0.92::acc(s4, pro_rider_name).
0.80::acc(s5, pro_rider_name).
0.78::acc(s6, pro_rider_name).

0.95::true_val(pro_rider_name, six_og_riders); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s4, pro_rider_name, six_og_riders).
measured(s5, pro_rider_name, six_og_riders).
measured(s6, pro_rider_name, six_og_riders).

all_consistent(pro_rider_name) :-
    consistent(s4, pro_rider_name),
    (indep(s5), consistent(s5, pro_rider_name) ; \+indep(s5)),
    (indep(s6), consistent(s6, pro_rider_name) ; \+indep(s6)).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, six_og_riders)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr design_concept
% @type categorical
% @canonical false
% @original_name Design concept
% @values nineties_feel_modern_performance=90s_feel_2020s_performance unk_design_concept=Unknown
% @importance 0.85

0.92::acc(s4, design_concept).

0.88::true_val(design_concept, nineties_feel_modern_performance); 0.12::true_val(design_concept, unk_design_concept).

measured(s4, design_concept, nineties_feel_modern_performance).

all_consistent(design_concept) :- consistent(s4, design_concept).

evidence(all_consistent(design_concept)).
query(true_val(design_concept, nineties_feel_modern_performance)).
query(true_val(design_concept, unk_design_concept)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values throwback_modern_tech=Throwback_graphic_with_modern_tech unk_topsheet_appearance_description=Unknown
% @importance 0.88

0.85::acc(s1, topsheet_appearance_description).
0.88::acc(sm, topsheet_appearance_description).

0.95::true_val(topsheet_appearance_description, throwback_modern_tech); 0.05::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s1, topsheet_appearance_description, throwback_modern_tech).
measured(sm, topsheet_appearance_description, throwback_modern_tech).

all_consistent(topsheet_appearance_description) :-
    (indep(s1), consistent(s1, topsheet_appearance_description) ; \+indep(s1)),
    (indep(sm), consistent(sm, topsheet_appearance_description) ; \+indep(sm)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, throwback_modern_tech)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr riding_philosophy
% @type categorical
% @canonical false
% @original_name Riding philosophy
% @values old_school_pop_modern_materials=Old_school_pop_width_style_modern_materials unk_riding_philosophy=Unknown
% @importance 0.83

0.82::acc(s5, riding_philosophy).
0.80::acc(s6, riding_philosophy).

0.95::true_val(riding_philosophy, old_school_pop_modern_materials); 0.05::true_val(riding_philosophy, unk_riding_philosophy).

measured(s5, riding_philosophy, old_school_pop_modern_materials).
measured(s6, riding_philosophy, old_school_pop_modern_materials).

all_consistent(riding_philosophy) :-
    (indep(s5), consistent(s5, riding_philosophy) ; \+indep(s5)),
    (indep(s6), consistent(s6, riding_philosophy) ; \+indep(s6)).

evidence(all_consistent(riding_philosophy)).
query(true_val(riding_philosophy, old_school_pop_modern_materials)).
query(true_val(riding_philosophy, unk_riding_philosophy)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.92

0.85::acc(s5, shape).
0.82::acc(s6, shape).
0.90::acc(sm, shape).

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).

measured(s5, shape, directional_twin).
measured(s6, shape, directional_twin).
measured(sm, shape, directional_twin).

all_consistent(shape) :-
    (indep(s5), consistent(s5, shape) ; \+indep(s5)),
    (indep(s6), consistent(s6, shape) ; \+indep(s6)),
    (indep(sm), consistent(sm, shape) ; \+indep(sm)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values true_twin_setback_stance=True_twin_setback_stance_switch_capable unk_shape_description=Unknown
% @importance 0.78

0.80::acc(s49, shape_description).
0.88::acc(sm, shape_description).

0.95::true_val(shape_description, true_twin_setback_stance); 0.05::true_val(shape_description, unk_shape_description).

measured(s49, shape_description, true_twin_setback_stance).
measured(sm, shape_description, true_twin_setback_stance).

all_consistent(shape_description) :-
    (indep(s49), consistent(s49, shape_description) ; \+indep(s49)),
    (indep(sm), consistent(sm, shape_description) ; \+indep(sm)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, true_twin_setback_stance)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values true_camber=True_Camber unk_camber_type=Unknown
% @importance 0.92

0.85::acc(s5, camber_type).
0.82::acc(s6, camber_type).
0.90::acc(sm, camber_type).

0.95::true_val(camber_type, true_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s5, camber_type, true_camber).
measured(s6, camber_type, true_camber).
measured(sm, camber_type, true_camber).

all_consistent(camber_type) :-
    (indep(s5), consistent(s5, camber_type) ; \+indep(s5)),
    (indep(s6), consistent(s6, camber_type) ; \+indep(s6)),
    (indep(sm), consistent(sm, camber_type) ; \+indep(sm)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, true_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values original_camber_snap_response=Original_camber_strong_snap_powerful_response unk_camber_description=Unknown
% @importance 0.83

0.82::acc(s6, camber_description).
0.80::acc(s6, camber_description).

0.82::true_val(camber_description, original_camber_snap_response); 0.18::true_val(camber_description, unk_camber_description).

measured(s6, camber_description, original_camber_snap_response).

all_consistent(camber_description) :-
    (indep(s6), consistent(s6, camber_description) ; \+indep(s6)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, original_camber_snap_response)).
query(true_val(camber_description, unk_camber_description)).

% @attr core_profile
% @type categorical
% @canonical false
% @original_name Core profile
% @values reflex=Reflex_Core_Profile unk_core_profile=Unknown
% @importance 0.92

0.85::acc(s5, core_profile).
0.82::acc(s6, core_profile).
0.90::acc(sm, core_profile).

0.95::true_val(core_profile, reflex); 0.05::true_val(core_profile, unk_core_profile).

measured(s5, core_profile, reflex).
measured(s6, core_profile, reflex).
measured(sm, core_profile, reflex).

all_consistent(core_profile) :-
    (indep(s5), consistent(s5, core_profile) ; \+indep(s5)),
    (indep(s6), consistent(s6, core_profile) ; \+indep(s6)),
    (indep(sm), consistent(sm, core_profile) ; \+indep(sm)).

evidence(all_consistent(core_profile)).
query(true_val(core_profile, reflex)).
query(true_val(core_profile, unk_core_profile)).

% @attr core_profile_description
% @type categorical
% @canonical false
% @original_name Core profile description
% @values thinner_between_feet=Thinner_core_between_feet_torsional_flex unk_core_profile_description=Unknown
% @importance 0.83

0.82::acc(s6, core_profile_description).

0.82::true_val(core_profile_description, thinner_between_feet); 0.18::true_val(core_profile_description, unk_core_profile_description).

measured(s6, core_profile_description, thinner_between_feet).

all_consistent(core_profile_description) :-
    (indep(s6), consistent(s6, core_profile_description) ; \+indep(s6)).

evidence(all_consistent(core_profile_description)).
query(true_val(core_profile_description, thinner_between_feet)).
query(true_val(core_profile_description, unk_core_profile_description)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values dual_degressive=Dual_Degressive_Sidecut unk_sidecut_type=Unknown
% @importance 0.92

0.85::acc(s5, sidecut_type).
0.82::acc(s6, sidecut_type).
0.90::acc(sm, sidecut_type).

0.95::true_val(sidecut_type, dual_degressive); 0.05::true_val(sidecut_type, unk_sidecut_type).

measured(s5, sidecut_type, dual_degressive).
measured(s6, sidecut_type, dual_degressive).
measured(sm, sidecut_type, dual_degressive).

all_consistent(sidecut_type) :-
    (indep(s5), consistent(s5, sidecut_type) ; \+indep(s5)),
    (indep(s6), consistent(s6, sidecut_type) ; \+indep(s6)),
    (indep(sm), consistent(sm, sidecut_type) ; \+indep(sm)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, dual_degressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values smaller_centre_larger_tips=Smaller_centre_larger_tip_tail_loose_playful unk_sidecut_description=Unknown
% @importance 0.83

0.82::acc(s6, sidecut_description).

0.82::true_val(sidecut_description, smaller_centre_larger_tips); 0.18::true_val(sidecut_description, unk_sidecut_description).

measured(s6, sidecut_description, smaller_centre_larger_tips).

all_consistent(sidecut_description) :-
    (indep(s6), consistent(s6, sidecut_description) ; \+indep(s6)).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, smaller_centre_larger_tips)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v8=8.0 unk_flex_rating_10=Unknown
% @importance 0.90

0.85::acc(s5, flex_rating_10).
0.88::acc(sm, flex_rating_10).

0.95::true_val(flex_rating_10, v8); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s5, flex_rating_10, v8).
measured(sm, flex_rating_10, v8).

all_consistent(flex_rating_10) :-
    (indep(s5), consistent(s5, flex_rating_10) ; \+indep(s5)),
    (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v8)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_flex=Mid_flex_balanced unk_flex_feel=Unknown
% @importance 0.85

0.88::acc(sm, flex_feel).

0.85::true_val(flex_feel, mid_flex); 0.15::true_val(flex_feel, unk_flex_feel).

measured(sm, flex_feel, mid_flex).

all_consistent(flex_feel) :-
    (indep(sm), consistent(sm, flex_feel) ; \+indep(sm)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_flex)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values stiff_6_8=Evo_classifies_6_to_8_as_stiff unk_flex_rating_10_evo=Unknown
% @importance 0.75

0.82::acc(s44, flex_rating_10_evo).

0.80::true_val(flex_rating_10_evo, stiff_6_8); 0.20::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s44, flex_rating_10_evo, stiff_6_8).

all_consistent(flex_rating_10_evo) :-
    (indep(s44), consistent(s44, flex_rating_10_evo) ; \+indep(s44)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff_6_8)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate=Intermediate unk_rider_level=Unknown
% @importance 0.85

0.88::acc(sm, rider_level).

0.85::true_val(rider_level, intermediate); 0.15::true_val(rider_level, unk_rider_level).

measured(sm, rider_level, intermediate).

all_consistent(rider_level) :-
    (indep(sm), consistent(sm, rider_level) ; \+indep(sm)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens_unisex unk_gender=Unknown
% @importance 0.95

0.82::acc(s6, gender).

0.78::true_val(gender, mens); 0.22::true_val(gender, unk_gender).

measured(s6, gender, mens).

all_consistent(gender) :-
    (indep(s6), consistent(s6, gender) ; \+indep(s6)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr terrain_suitability
% @type numeric
% @canonical true
% @original_name terrain_suitability
% @unit /10
% @values v10=10.0 unk_terrain_suitability=Unknown
% @importance 0.95

0.78::acc(s6, terrain_suitability).

0.78::true_val(terrain_suitability, v10); 0.22::true_val(terrain_suitability, unk_terrain_suitability).

measured(s6, terrain_suitability, v10).

all_consistent(terrain_suitability) :-
    (indep(s6), consistent(s6, terrain_suitability) ; \+indep(s6)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_b
% @type numeric
% @canonical false
% @original_name terrain_suitability (second rating)
% @unit /10
% @values v10=10.0 unk_terrain_suitability_b=Unknown
% @importance 0.95

0.78::acc(s6, terrain_suitability_b).

0.78::true_val(terrain_suitability_b, v10); 0.22::true_val(terrain_suitability_b, unk_terrain_suitability_b).

measured(s6, terrain_suitability_b, v10).

all_consistent(terrain_suitability_b) :-
    (indep(s6), consistent(s6, terrain_suitability_b) ; \+indep(s6)).

evidence(all_consistent(terrain_suitability_b)).
query(true_val(terrain_suitability_b, v10)).
query(true_val(terrain_suitability_b, unk_terrain_suitability_b)).

% @attr terrain_suitability_c
% @type numeric
% @canonical false
% @original_name terrain_suitability (third rating)
% @unit /10
% @values v8=8.0 unk_terrain_suitability_c=Unknown
% @importance 0.95

0.78::acc(s6, terrain_suitability_c).

0.78::true_val(terrain_suitability_c, v8); 0.22::true_val(terrain_suitability_c, unk_terrain_suitability_c).

measured(s6, terrain_suitability_c, v8).

all_consistent(terrain_suitability_c) :-
    (indep(s6), consistent(s6, terrain_suitability_c) ; \+indep(s6)).

evidence(all_consistent(terrain_suitability_c)).
query(true_val(terrain_suitability_c, v8)).
query(true_val(terrain_suitability_c, unk_terrain_suitability_c)).

% @attr team_base_model_description
% @type categorical
% @canonical false
% @original_name Nitro Team as base model
% @values industry_benchmark=Industry_benchmark_versatility_reliability unk_team_base_model_description=Unknown
% @importance 0.83

0.82::acc(s6, team_base_model_description).

0.82::true_val(team_base_model_description, industry_benchmark); 0.18::true_val(team_base_model_description, unk_team_base_model_description).

measured(s6, team_base_model_description, industry_benchmark).

all_consistent(team_base_model_description) :-
    (indep(s6), consistent(s6, team_base_model_description) ; \+indep(s6)).

evidence(all_consistent(team_base_model_description)).
query(true_val(team_base_model_description, industry_benchmark)).
query(true_val(team_base_model_description, unk_team_base_model_description)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values bi_lite=Bi_Lite_Laminates unk_laminate=Unknown
% @importance 0.90

0.85::acc(s5, laminate).
0.88::acc(sm, laminate).

0.95::true_val(laminate, bi_lite); 0.05::true_val(laminate, unk_laminate).

measured(s5, laminate, bi_lite).
measured(sm, laminate, bi_lite).

all_consistent(laminate) :-
    (indep(s5), consistent(s5, laminate) ; \+indep(s5)),
    (indep(sm), consistent(sm, laminate) ; \+indep(sm)).

evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite)).
query(true_val(laminate, unk_laminate)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values powerlite_poplar=PowerLite_ultra_lightweight_poplar unk_core_material=Unknown
% @importance 0.90

0.95::acc(s56, core_material).
0.88::acc(sm, core_material).

0.95::true_val(core_material, powerlite_poplar); 0.05::true_val(core_material, unk_core_material).

measured(s56, core_material, powerlite_poplar).
measured(sm, core_material, powerlite_poplar).

all_consistent(core_material) :-
    consistent(s56, core_material),
    (indep(sm), consistent(sm, core_material) ; \+indep(sm)).

evidence(all_consistent(core_material)).
query(true_val(core_material, powerlite_poplar)).
query(true_val(core_material, unk_core_material)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_sidewall=ABS_Sidewall_flexible_impact_resistant unk_sidewall_material=Unknown
% @importance 0.90

0.85::acc(s5, sidewall_material).
0.88::acc(sm, sidewall_material).

0.95::true_val(sidewall_material, abs_sidewall); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s5, sidewall_material, abs_sidewall).
measured(sm, sidewall_material, abs_sidewall).

all_consistent(sidewall_material) :-
    (indep(s5), consistent(s5, sidewall_material) ; \+indep(s5)),
    (indep(sm), consistent(sm, sidewall_material) ; \+indep(sm)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_sidewall)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sustainability_certification_recycled_polymers
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled polymers)
% @values pct35_recycled=35_percent_recycled_polymers unk_sustainability_certification_recycled_polymers=Unknown
% @importance 0.70

0.95::acc(s56, sustainability_certification_recycled_polymers).

0.93::true_val(sustainability_certification_recycled_polymers, pct35_recycled); 0.07::true_val(sustainability_certification_recycled_polymers, unk_sustainability_certification_recycled_polymers).

measured(s56, sustainability_certification_recycled_polymers, pct35_recycled).

all_consistent(sustainability_certification_recycled_polymers) :-
    consistent(s56, sustainability_certification_recycled_polymers).

evidence(all_consistent(sustainability_certification_recycled_polymers)).
query(true_val(sustainability_certification_recycled_polymers, pct35_recycled)).
query(true_val(sustainability_certification_recycled_polymers, unk_sustainability_certification_recycled_polymers)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_ecospeed_hd=Sintered_EcoSpeed_HD sintered_speed_formula_ii=Sintered_Speed_Formula_II
% @importance 0.93

0.88::acc(s5, base_material).
0.90::acc(sm, base_material).
0.65::acc(s5q, base_material).

0.80::true_val(base_material, sintered_ecospeed_hd); 0.20::true_val(base_material, sintered_speed_formula_ii).

measured(s5, base_material, sintered_ecospeed_hd).
measured(sm, base_material, sintered_ecospeed_hd).
measured(s5q, base_material, sintered_speed_formula_ii).

all_consistent(base_material) :-
    (indep(s5), consistent(s5, base_material) ; \+indep(s5)),
    (indep(sm), consistent(sm, base_material) ; \+indep(sm)),
    consistent(s5q, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_ecospeed_hd)).
query(true_val(base_material, sintered_speed_formula_ii)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values recycled_steel=Recycled_Steel_Edge unk_edge_technology=Unknown
% @importance 0.90

0.85::acc(s5, edge_technology).
0.88::acc(sm, edge_technology).

0.95::true_val(edge_technology, recycled_steel); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s5, edge_technology, recycled_steel).
measured(sm, edge_technology, recycled_steel).

all_consistent(edge_technology) :-
    (indep(s5), consistent(s5, edge_technology) ; \+indep(s5)),
    (indep(sm), consistent(sm, edge_technology) ; \+indep(sm)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_steel)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr sustainability_certification_recycled_steel
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled steel)
% @values pct50_recycled_steel=50_percent_recycled_steel unk_sustainability_certification_recycled_steel=Unknown
% @importance 0.90

0.95::acc(s56, sustainability_certification_recycled_steel).

0.93::true_val(sustainability_certification_recycled_steel, pct50_recycled_steel); 0.07::true_val(sustainability_certification_recycled_steel, unk_sustainability_certification_recycled_steel).

measured(s56, sustainability_certification_recycled_steel, pct50_recycled_steel).

all_consistent(sustainability_certification_recycled_steel) :-
    consistent(s56, sustainability_certification_recycled_steel).

evidence(all_consistent(sustainability_certification_recycled_steel)).
query(true_val(sustainability_certification_recycled_steel, pct50_recycled_steel)).
query(true_val(sustainability_certification_recycled_steel, unk_sustainability_certification_recycled_steel)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.90

0.85::acc(s5, mounting_pattern).
0.88::acc(sm, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s5, mounting_pattern, inserts_2x4).
measured(sm, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s5), consistent(s5, mounting_pattern) ; \+indep(s5)),
    (indep(sm), consistent(sm, mounting_pattern) ; \+indep(sm)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_Wide unk_width_options=Unknown
% @importance 0.85

0.88::acc(sm, width_options).

0.85::true_val(width_options, standard_and_wide); 0.15::true_val(width_options, unk_width_options).

measured(sm, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(sm), consistent(sm, width_options) ; \+indep(sm)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr factory_wax_tuning
% @type categorical
% @canonical false
% @original_name Factory wax/tuning
% @values factory_tuned_waxed=Factory_tuned_and_waxed_ready_to_ride unk_factory_wax_tuning=Unknown
% @importance 0.50

0.70::acc(s81, factory_wax_tuning).

0.65::true_val(factory_wax_tuning, factory_tuned_waxed); 0.35::true_val(factory_wax_tuning, unk_factory_wax_tuning).

measured(s81, factory_wax_tuning, factory_tuned_waxed).

all_consistent(factory_wax_tuning) :-
    (indep(s81), consistent(s81, factory_wax_tuning) ; \+indep(s81)).

evidence(all_consistent(factory_wax_tuning)).
query(true_val(factory_wax_tuning, factory_tuned_waxed)).
query(true_val(factory_wax_tuning, unk_factory_wax_tuning)).

% @attr available_sizes_154
% @type categorical
% @canonical false
% @original_name available_sizes (154cm)
% @values v154cm=154cm unk_available_sizes_154=Unknown
% @importance 0.90

0.85::acc(s5, available_sizes_154).
0.88::acc(sm, available_sizes_154).

0.95::true_val(available_sizes_154, v154cm); 0.05::true_val(available_sizes_154, unk_available_sizes_154).

measured(s5, available_sizes_154, v154cm).
measured(sm, available_sizes_154, v154cm).

all_consistent(available_sizes_154) :-
    (indep(s5), consistent(s5, available_sizes_154) ; \+indep(s5)),
    (indep(sm), consistent(sm, available_sizes_154) ; \+indep(sm)).

evidence(all_consistent(available_sizes_154)).
query(true_val(available_sizes_154, v154cm)).
query(true_val(available_sizes_154, unk_available_sizes_154)).

% @attr contact_length_size_154
% @type numeric
% @canonical false
% @original_name contact_length_size (154cm)
% @unit cm
% @values v111_0=111.0 unk_contact_length_size_154=Unknown
% @importance 0.90

0.85::acc(s5, contact_length_size_154).
0.88::acc(sm, contact_length_size_154).

0.95::true_val(contact_length_size_154, v111_0); 0.05::true_val(contact_length_size_154, unk_contact_length_size_154).

measured(s5, contact_length_size_154, v111_0).
measured(sm, contact_length_size_154, v111_0).

all_consistent(contact_length_size_154) :-
    (indep(s5), consistent(s5, contact_length_size_154) ; \+indep(s5)),
    (indep(sm), consistent(sm, contact_length_size_154) ; \+indep(sm)).

evidence(all_consistent(contact_length_size_154)).
query(true_val(contact_length_size_154, v111_0)).
query(true_val(contact_length_size_154, unk_contact_length_size_154)).

% @attr tip_tail_width_size_154
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (154cm)
% @unit cm
% @values v30_4_30_1=30.4/30.1 unk_tip_tail_width_size_154=Unknown
% @importance 0.85

0.88::acc(sm, tip_tail_width_size_154).

0.85::true_val(tip_tail_width_size_154, v30_4_30_1); 0.15::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).

measured(sm, tip_tail_width_size_154, v30_4_30_1).

all_consistent(tip_tail_width_size_154) :-
    (indep(sm), consistent(sm, tip_tail_width_size_154) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v30_4_30_1)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width (154cm)
% @unit cm
% @values v25_4=25.4 unk_waist_width_154=Unknown
% @importance 0.90

0.85::acc(s5, waist_width_154).
0.88::acc(sm, waist_width_154).

0.95::true_val(waist_width_154, v25_4); 0.05::true_val(waist_width_154, unk_waist_width_154).

measured(s5, waist_width_154, v25_4).
measured(sm, waist_width_154, v25_4).

all_consistent(waist_width_154) :-
    (indep(s5), consistent(s5, waist_width_154) ; \+indep(s5)),
    (indep(sm), consistent(sm, waist_width_154) ; \+indep(sm)).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_4)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr sidecut_radius_size_154
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (154cm)
% @unit m
% @values v9_8_5_8_9_8=9.8/5.8/9.8 unk_sidecut_radius_size_154=Unknown
% @importance 0.90

0.85::acc(s5, sidecut_radius_size_154).
0.88::acc(sm, sidecut_radius_size_154).

0.95::true_val(sidecut_radius_size_154, v9_8_5_8_9_8); 0.05::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).

measured(s5, sidecut_radius_size_154, v9_8_5_8_9_8).
measured(sm, sidecut_radius_size_154, v9_8_5_8_9_8).

all_consistent(sidecut_radius_size_154) :-
    (indep(s5), consistent(s5, sidecut_radius_size_154) ; \+indep(s5)),
    (indep(sm), consistent(sm, sidecut_radius_size_154) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v9_8_5_8_9_8)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

% @attr setback_154
% @type numeric
% @canonical false
% @original_name setback (154cm)
% @unit cm
% @values vneg1_5=neg1.5 unk_setback_154=Unknown
% @importance 0.90

0.85::acc(s5, setback_154).
0.88::acc(sm, setback_154).

0.95::true_val(setback_154, vneg1_5); 0.05::true_val(setback_154, unk_setback_154).

measured(s5, setback_154, vneg1_5).
measured(sm, setback_154, vneg1_5).

all_consistent(setback_154) :-
    (indep(s5), consistent(s5, setback_154) ; \+indep(s5)),
    (indep(sm), consistent(sm, setback_154) ; \+indep(sm)).

evidence(all_consistent(setback_154)).
query(true_val(setback_154, vneg1_5)).
query(true_val(setback_154, unk_setback_154)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (154cm)
% @unit kg
% @values r55_75=55-75kg unk_recommended_weight_range_size_154=Unknown
% @importance 0.90

0.85::acc(s5, recommended_weight_range_size_154).
0.88::acc(sm, recommended_weight_range_size_154).

0.95::true_val(recommended_weight_range_size_154, r55_75); 0.05::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(s5, recommended_weight_range_size_154, r55_75).
measured(sm, recommended_weight_range_size_154, r55_75).

all_consistent(recommended_weight_range_size_154) :-
    (indep(s5), consistent(s5, recommended_weight_range_size_154) ; \+indep(s5)),
    (indep(sm), consistent(sm, recommended_weight_range_size_154) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, r55_75)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes (158cm)
% @values v158cm=158cm unk_available_sizes=Unknown
% @importance 0.90

0.85::acc(s5, available_sizes).
0.88::acc(sm, available_sizes).

0.95::true_val(available_sizes, v158cm); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s5, available_sizes, v158cm).
measured(sm, available_sizes, v158cm).

all_consistent(available_sizes) :-
    (indep(s5), consistent(s5, available_sizes) ; \+indep(s5)),
    (indep(sm), consistent(sm, available_sizes) ; \+indep(sm)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, v158cm)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size (158cm)
% @unit cm
% @values v113_0=113.0 unk_contact_length_size=Unknown
% @importance 0.90

0.85::acc(s5, contact_length_size).
0.88::acc(sm, contact_length_size).

0.95::true_val(contact_length_size, v113_0); 0.05::true_val(contact_length_size, unk_contact_length_size).

measured(s5, contact_length_size, v113_0).
measured(sm, contact_length_size, v113_0).

all_consistent(contact_length_size) :-
    (indep(s5), consistent(s5, contact_length_size) ; \+indep(s5)),
    (indep(sm), consistent(sm, contact_length_size) ; \+indep(sm)).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v113_0)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size (158cm)
% @unit cm
% @values v30_6_30_3=30.6/30.3 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.88::acc(sm, tip_tail_width_size).

0.85::true_val(tip_tail_width_size, v30_6_30_3); 0.15::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(sm, tip_tail_width_size, v30_6_30_3).

all_consistent(tip_tail_width_size) :-
    (indep(sm), consistent(sm, tip_tail_width_size) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_6_30_3)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_158
% @type numeric
% @canonical false
% @original_name Waist width (158cm)
% @unit cm
% @values v25_6=25.6 unk_waist_width_158=Unknown
% @importance 0.90

0.85::acc(s5, waist_width_158).
0.88::acc(sm, waist_width_158).

0.95::true_val(waist_width_158, v25_6); 0.05::true_val(waist_width_158, unk_waist_width_158).

measured(s5, waist_width_158, v25_6).
measured(sm, waist_width_158, v25_6).

all_consistent(waist_width_158) :-
    (indep(s5), consistent(s5, waist_width_158) ; \+indep(s5)),
    (indep(sm), consistent(sm, waist_width_158) ; \+indep(sm)).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v25_6)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr sidecut_radius_size
% @type categorical
% @canonical true
% @original_name sidecut_radius_size (158cm)
% @unit m
% @values v10_0_6_1_10_0=10.0/6.1/10.0 unk_sidecut_radius_size=Unknown
% @importance 0.90

0.85::acc(s5, sidecut_radius_size).
0.88::acc(sm, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v10_0_6_1_10_0); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s5, sidecut_radius_size, v10_0_6_1_10_0).
measured(sm, sidecut_radius_size, v10_0_6_1_10_0).

all_consistent(sidecut_radius_size) :-
    (indep(s5), consistent(s5, sidecut_radius_size) ; \+indep(s5)),
    (indep(sm), consistent(sm, sidecut_radius_size) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v10_0_6_1_10_0)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback (158cm)
% @unit cm
% @values vneg1_5=neg1.5 unk_setback=Unknown
% @importance 0.90

0.85::acc(s5, setback).
0.88::acc(sm, setback).

0.95::true_val(setback, vneg1_5); 0.05::true_val(setback, unk_setback).

measured(s5, setback, vneg1_5).
measured(sm, setback, vneg1_5).

all_consistent(setback) :-
    (indep(s5), consistent(s5, setback) ; \+indep(s5)),
    (indep(sm), consistent(sm, setback) ; \+indep(sm)).

evidence(all_consistent(setback)).
query(true_val(setback, vneg1_5)).
query(true_val(setback, unk_setback)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (158cm)
% @unit kg
% @values r60_80=60-80kg unk_recommended_weight_range_size=Unknown
% @importance 0.90

0.85::acc(s5, recommended_weight_range_size).
0.88::acc(sm, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, r60_80); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s5, recommended_weight_range_size, r60_80).
measured(sm, recommended_weight_range_size, r60_80).

all_consistent(recommended_weight_range_size) :-
    (indep(s5), consistent(s5, recommended_weight_range_size) ; \+indep(s5)),
    (indep(sm), consistent(sm, recommended_weight_range_size) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r60_80)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr available_sizes_158w
% @type categorical
% @canonical false
% @original_name available_sizes (158cm Wide)
% @values v158w=158cm_Wide unk_available_sizes_158w=Unknown
% @importance 0.90

0.85::acc(s5, available_sizes_158w).
0.88::acc(sm, available_sizes_158w).

0.95::true_val(available_sizes_158w, v158w); 0.05::true_val(available_sizes_158w, unk_available_sizes_158w).

measured(s5, available_sizes_158w, v158w).
measured(sm, available_sizes_158w, v158w).

all_consistent(available_sizes_158w) :-
    (indep(s5), consistent(s5, available_sizes_158w) ; \+indep(s5)),
    (indep(sm), consistent(sm, available_sizes_158w) ; \+indep(sm)).

evidence(all_consistent(available_sizes_158w)).
query(true_val(available_sizes_158w, v158w)).
query(true_val(available_sizes_158w, unk_available_sizes_158w)).

% @attr contact_length_size_158w
% @type numeric
% @canonical false
% @original_name contact_length_size (158cm Wide)
% @unit cm
% @values v113_0=113.0 unk_contact_length_size_158w=Unknown
% @importance 0.90

0.85::acc(s5, contact_length_size_158w).
0.88::acc(sm, contact_length_size_158w).

0.95::true_val(contact_length_size_158w, v113_0); 0.05::true_val(contact_length_size_158w, unk_contact_length_size_158w).

measured(s5, contact_length_size_158w, v113_0).
measured(sm, contact_length_size_158w, v113_0).

all_consistent(contact_length_size_158w) :-
    (indep(s5), consistent(s5, contact_length_size_158w) ; \+indep(s5)),
    (indep(sm), consistent(sm, contact_length_size_158w) ; \+indep(sm)).

evidence(all_consistent(contact_length_size_158w)).
query(true_val(contact_length_size_158w, v113_0)).
query(true_val(contact_length_size_158w, unk_contact_length_size_158w)).

% @attr tip_tail_width_size_158w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (158cm Wide)
% @unit cm
% @values v32_0_31_7=32.0/31.7 unk_tip_tail_width_size_158w=Unknown
% @importance 0.85

0.88::acc(sm, tip_tail_width_size_158w).

0.85::true_val(tip_tail_width_size_158w, v32_0_31_7); 0.15::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).

measured(sm, tip_tail_width_size_158w, v32_0_31_7).

all_consistent(tip_tail_width_size_158w) :-
    (indep(sm), consistent(sm, tip_tail_width_size_158w) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v32_0_31_7)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

% @attr waist_width_158w
% @type numeric
% @canonical false
% @original_name Waist width (158W)
% @unit cm
% @values v27_0=27.0 unk_waist_width_158w=Unknown
% @importance 0.90

0.85::acc(s5, waist_width_158w).
0.88::acc(sm, waist_width_158w).

0.95::true_val(waist_width_158w, v27_0); 0.05::true_val(waist_width_158w, unk_waist_width_158w).

measured(s5, waist_width_158w, v27_0).
measured(sm, waist_width_158w, v27_0).

all_consistent(waist_width_158w) :-
    (indep(s5), consistent(s5, waist_width_158w) ; \+indep(s5)),
    (indep(sm), consistent(sm, waist_width_158w) ; \+indep(sm)).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v27_0)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr sidecut_radius_size_158w
% @type categorical
% @canonical false
% @original_name sidecut_radius_size (158cm Wide)
% @unit m
% @values v10_0_6_1_10_0=10.0/6.1/10.0 unk_sidecut_radius_size_158w=Unknown
% @importance 0.90

0.85::acc(s5, sidecut_radius_size_158w).
0.88::acc(sm, sidecut_radius_size_158w).

0.95::true_val(sidecut_radius_size_158w, v10_0_6_1_10_0); 0.05::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).

measured(s5, sidecut_radius_size_158w, v10_0_6_1_10_0).
measured(sm, sidecut_radius_size_158w, v10_0_6_1_10_0).

all_consistent(sidecut_radius_size_158w) :-
    (indep(s5), consistent(s5, sidecut_radius_size_158w) ; \+indep(s5)),
    (indep(sm), consistent(sm, sidecut_radius_size_158w) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, v10_0_6_1_10_0)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

% @attr setback_158w
% @type numeric
% @canonical false
% @original_name setback (158cm Wide)
% @unit cm
% @values vneg1_5=neg1.5 unk_setback_158w=Unknown
% @importance 0.90

0.85::acc(s5, setback_158w).
0.88::acc(sm, setback_158w).

0.95::true_val(setback_158w, vneg1_5); 0.05::true_val(setback_158w, unk_setback_158w).

measured(s5, setback_158w, vneg1_5).
measured(sm, setback_158w, vneg1_5).

all_consistent(setback_158w) :-
    (indep(s5), consistent(s5, setback_158w) ; \+indep(s5)),
    (indep(sm), consistent(sm, setback_158w) ; \+indep(sm)).

evidence(all_consistent(setback_158w)).
query(true_val(setback_158w, vneg1_5)).
query(true_val(setback_158w, unk_setback_158w)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (158cm Wide)
% @unit kg
% @values r65_plus=65plus_kg unk_recommended_weight_range_size_158w=Unknown
% @importance 0.90

0.85::acc(s5, recommended_weight_range_size_158w).
0.88::acc(sm, recommended_weight_range_size_158w).

0.95::true_val(recommended_weight_range_size_158w, r65_plus); 0.05::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s5, recommended_weight_range_size_158w, r65_plus).
measured(sm, recommended_weight_range_size_158w, r65_plus).

all_consistent(recommended_weight_range_size_158w) :-
    (indep(s5), consistent(s5, recommended_weight_range_size_158w) ; \+indep(s5)),
    (indep(sm), consistent(sm, recommended_weight_range_size_158w) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, r65_plus)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification (carbon neutral)
% @values carbon_neutral_2021=Carbon_neutral_since_2021_ClimatePartner unk_sustainability_certification=Unknown
% @importance 0.55

0.92::acc(s55, sustainability_certification).
0.70::acc(s63, sustainability_certification).

0.95::true_val(sustainability_certification, carbon_neutral_2021); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s55, sustainability_certification, carbon_neutral_2021).
measured(s63, sustainability_certification, carbon_neutral_2021).

all_consistent(sustainability_certification) :-
    consistent(s55, sustainability_certification),
    (indep(s63), consistent(s63, sustainability_certification) ; \+indep(s63)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, carbon_neutral_2021)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_solar
% @type categorical
% @canonical false
% @original_name sustainability_certification (100% solar energy)
% @values pct100_solar=100_percent_solar_energy unk_sustainability_certification_solar=Unknown
% @importance 0.83

0.94::acc(s54, sustainability_certification_solar).
0.95::acc(s56, sustainability_certification_solar).
0.85::acc(sm, sustainability_certification_solar).

0.95::true_val(sustainability_certification_solar, pct100_solar); 0.05::true_val(sustainability_certification_solar, unk_sustainability_certification_solar).

measured(s54, sustainability_certification_solar, pct100_solar).
measured(s56, sustainability_certification_solar, pct100_solar).
measured(sm, sustainability_certification_solar, pct100_solar).

all_consistent(sustainability_certification_solar) :-
    consistent(s54, sustainability_certification_solar),
    consistent(s56, sustainability_certification_solar),
    (indep(sm), consistent(sm, sustainability_certification_solar) ; \+indep(sm)).

evidence(all_consistent(sustainability_certification_solar)).
query(true_val(sustainability_certification_solar, pct100_solar)).
query(true_val(sustainability_certification_solar, unk_sustainability_certification_solar)).

% @attr sustainability_certification_solar_capacity
% @type categorical
% @canonical false
% @original_name sustainability_certification (700 KW solar station)
% @values kw700_solar=700_KW_solar_power_station unk_sustainability_certification_solar_capacity=Unknown
% @importance 0.60

0.94::acc(s54, sustainability_certification_solar_capacity).
0.70::acc(s63, sustainability_certification_solar_capacity).

0.95::true_val(sustainability_certification_solar_capacity, kw700_solar); 0.05::true_val(sustainability_certification_solar_capacity, unk_sustainability_certification_solar_capacity).

measured(s54, sustainability_certification_solar_capacity, kw700_solar).
measured(s63, sustainability_certification_solar_capacity, kw700_solar).

all_consistent(sustainability_certification_solar_capacity) :-
    consistent(s54, sustainability_certification_solar_capacity),
    (indep(s63), consistent(s63, sustainability_certification_solar_capacity) ; \+indep(s63)).

evidence(all_consistent(sustainability_certification_solar_capacity)).
query(true_val(sustainability_certification_solar_capacity, kw700_solar)).
query(true_val(sustainability_certification_solar_capacity, unk_sustainability_certification_solar_capacity)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC certified)
% @values fsc_certified=FSC_responsibly_sourced_forestry unk_sustainability_certification_fsc=Unknown
% @importance 0.83

0.94::acc(s54, sustainability_certification_fsc).
0.95::acc(s56, sustainability_certification_fsc).
0.85::acc(sm, sustainability_certification_fsc).

0.95::true_val(sustainability_certification_fsc, fsc_certified); 0.05::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s54, sustainability_certification_fsc, fsc_certified).
measured(s56, sustainability_certification_fsc, fsc_certified).
measured(sm, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :-
    consistent(s54, sustainability_certification_fsc),
    consistent(s56, sustainability_certification_fsc),
    (indep(sm), consistent(sm, sustainability_certification_fsc) ; \+indep(sm)).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr sustainability_certification_water_inks
% @type categorical
% @canonical false
% @original_name sustainability_certification (water-based inks)
% @values water_based_inks=Water_based_inks unk_sustainability_certification_water_inks=Unknown
% @importance 0.83

0.94::acc(s54, sustainability_certification_water_inks).
0.95::acc(s56, sustainability_certification_water_inks).
0.85::acc(sm, sustainability_certification_water_inks).

0.95::true_val(sustainability_certification_water_inks, water_based_inks); 0.05::true_val(sustainability_certification_water_inks, unk_sustainability_certification_water_inks).

measured(s54, sustainability_certification_water_inks, water_based_inks).
measured(s56, sustainability_certification_water_inks, water_based_inks).
measured(sm, sustainability_certification_water_inks, water_based_inks).

all_consistent(sustainability_certification_water_inks) :-
    consistent(s54, sustainability_certification_water_inks),
    consistent(s56, sustainability_certification_water_inks),
    (indep(sm), consistent(sm, sustainability_certification_water_inks) ; \+indep(sm)).

evidence(all_consistent(sustainability_certification_water_inks)).
query(true_val(sustainability_certification_water_inks, water_based_inks)).
query(true_val(sustainability_certification_water_inks, unk_sustainability_certification_water_inks)).

% @attr sustainability_certification_recycled_raw
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled raw materials)
% @values yes_recycled_raw=Yes_recycled_raw_materials unk_sustainability_certification_recycled_raw=Unknown
% @importance 0.90

0.95::acc(s56, sustainability_certification_recycled_raw).
0.85::acc(sm, sustainability_certification_recycled_raw).

0.95::true_val(sustainability_certification_recycled_raw, yes_recycled_raw); 0.05::true_val(sustainability_certification_recycled_raw, unk_sustainability_certification_recycled_raw).

measured(s56, sustainability_certification_recycled_raw, yes_recycled_raw).
measured(sm, sustainability_certification_recycled_raw, yes_recycled_raw).

all_consistent(sustainability_certification_recycled_raw) :-
    consistent(s56, sustainability_certification_recycled_raw),
    (indep(sm), consistent(sm, sustainability_certification_recycled_raw) ; \+indep(sm)).

evidence(all_consistent(sustainability_certification_recycled_raw)).
query(true_val(sustainability_certification_recycled_raw, yes_recycled_raw)).
query(true_val(sustainability_certification_recycled_raw, unk_sustainability_certification_recycled_raw)).

% @attr sustainability_certification_recycled_edges
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled steel edges)
% @values yes_recycled_edges=Yes_recycled_steel_edges unk_sustainability_certification_recycled_edges=Unknown
% @importance 0.90

0.95::acc(s56, sustainability_certification_recycled_edges).
0.85::acc(sm, sustainability_certification_recycled_edges).

0.95::true_val(sustainability_certification_recycled_edges, yes_recycled_edges); 0.05::true_val(sustainability_certification_recycled_edges, unk_sustainability_certification_recycled_edges).

measured(s56, sustainability_certification_recycled_edges, yes_recycled_edges).
measured(sm, sustainability_certification_recycled_edges, yes_recycled_edges).

all_consistent(sustainability_certification_recycled_edges) :-
    consistent(s56, sustainability_certification_recycled_edges),
    (indep(sm), consistent(sm, sustainability_certification_recycled_edges) ; \+indep(sm)).

evidence(all_consistent(sustainability_certification_recycled_edges)).
query(true_val(sustainability_certification_recycled_edges, yes_recycled_edges)).
query(true_val(sustainability_certification_recycled_edges, unk_sustainability_certification_recycled_edges)).

% @attr sustainability_certification_carbon_footprint
% @type numeric
% @canonical false
% @original_name sustainability_certification (carbon footprint)
% @unit kg_co2
% @values v32_2=32.2 unk_sustainability_certification_carbon_footprint=Unknown
% @importance 0.90

0.95::acc(s56, sustainability_certification_carbon_footprint).
0.85::acc(sm, sustainability_certification_carbon_footprint).

0.95::true_val(sustainability_certification_carbon_footprint, v32_2); 0.05::true_val(sustainability_certification_carbon_footprint, unk_sustainability_certification_carbon_footprint).

measured(s56, sustainability_certification_carbon_footprint, v32_2).
measured(sm, sustainability_certification_carbon_footprint, v32_2).

all_consistent(sustainability_certification_carbon_footprint) :-
    consistent(s56, sustainability_certification_carbon_footprint),
    (indep(sm), consistent(sm, sustainability_certification_carbon_footprint) ; \+indep(sm)).

evidence(all_consistent(sustainability_certification_carbon_footprint)).
query(true_val(sustainability_certification_carbon_footprint, v32_2)).
query(true_val(sustainability_certification_carbon_footprint, unk_sustainability_certification_carbon_footprint)).

% @attr sustainability_certification_recycled_bases
% @type categorical
% @canonical false
% @original_name sustainability_certification (85% recycled bases)
% @values pct85_recycled_bases=Over_85_percent_bases_recycled unk_sustainability_certification_recycled_bases=Unknown
% @importance 0.55

0.70::acc(s63, sustainability_certification_recycled_bases).

0.65::true_val(sustainability_certification_recycled_bases, pct85_recycled_bases); 0.35::true_val(sustainability_certification_recycled_bases, unk_sustainability_certification_recycled_bases).

measured(s63, sustainability_certification_recycled_bases, pct85_recycled_bases).

all_consistent(sustainability_certification_recycled_bases) :-
    (indep(s63), consistent(s63, sustainability_certification_recycled_bases) ; \+indep(s63)).

evidence(all_consistent(sustainability_certification_recycled_bases)).
query(true_val(sustainability_certification_recycled_bases, pct85_recycled_bases)).
query(true_val(sustainability_certification_recycled_bases, unk_sustainability_certification_recycled_bases)).

% @attr sustainability_certification_topsheet_finish
% @type categorical
% @canonical false
% @original_name sustainability_certification (topsheet finish)
% @values pct70_solvent_free=Over_70_percent_unvarnished_or_solvent_free unk_sustainability_certification_topsheet_finish=Unknown
% @importance 0.55

0.70::acc(s63, sustainability_certification_topsheet_finish).

0.65::true_val(sustainability_certification_topsheet_finish, pct70_solvent_free); 0.35::true_val(sustainability_certification_topsheet_finish, unk_sustainability_certification_topsheet_finish).

measured(s63, sustainability_certification_topsheet_finish, pct70_solvent_free).

all_consistent(sustainability_certification_topsheet_finish) :-
    (indep(s63), consistent(s63, sustainability_certification_topsheet_finish) ; \+indep(s63)).

evidence(all_consistent(sustainability_certification_topsheet_finish)).
query(true_val(sustainability_certification_topsheet_finish, pct70_solvent_free)).
query(true_val(sustainability_certification_topsheet_finish, unk_sustainability_certification_topsheet_finish)).

% @attr sustainability_certification_energy_source
% @type categorical
% @canonical false
% @original_name sustainability_certification (energy source)
% @values not_oil_electricity=Not_oil_or_electricity unk_sustainability_certification_energy_source=Unknown
% @importance 0.55

0.70::acc(s63, sustainability_certification_energy_source).

0.65::true_val(sustainability_certification_energy_source, not_oil_electricity); 0.35::true_val(sustainability_certification_energy_source, unk_sustainability_certification_energy_source).

measured(s63, sustainability_certification_energy_source, not_oil_electricity).

all_consistent(sustainability_certification_energy_source) :-
    (indep(s63), consistent(s63, sustainability_certification_energy_source) ; \+indep(s63)).

evidence(all_consistent(sustainability_certification_energy_source)).
query(true_val(sustainability_certification_energy_source, not_oil_electricity)).
query(true_val(sustainability_certification_energy_source, unk_sustainability_certification_energy_source)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v999_99=999.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.92::acc(s6, price_aud_merchant).

0.90::true_val(price_aud_merchant, v999_99); 0.10::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s6, price_aud_merchant, v999_99).

all_consistent(price_aud_merchant) :-
    (indep(s6), consistent(s6, price_aud_merchant) ; \+indep(s6)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v999_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (ESS Board Store)
% @values available_in_stock=Available_in_stock unk_availability_status=Unknown
% @importance 0.95

0.82::acc(s6, availability_status).

0.82::true_val(availability_status, available_in_stock); 0.18::true_val(availability_status, unk_availability_status).

measured(s6, availability_status, available_in_stock).

all_consistent(availability_status) :-
    (indep(s6), consistent(s6, availability_status) ; \+indep(s6)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_in_stock)).
query(true_val(availability_status, unk_availability_status)).

% @attr ess_reputation
% @type categorical
% @canonical false
% @original_name ESS Board Store reputation
% @values family_run_30yr=Family_run_30plus_years_Jindabyne_Erina unk_ess_reputation=Unknown
% @importance 0.55

0.78::acc(s6, ess_reputation).

0.75::true_val(ess_reputation, family_run_30yr); 0.25::true_val(ess_reputation, unk_ess_reputation).

measured(s6, ess_reputation, family_run_30yr).

all_consistent(ess_reputation) :-
    (indep(s6), consistent(s6, ess_reputation) ; \+indep(s6)).

evidence(all_consistent(ess_reputation)).
query(true_val(ess_reputation, family_run_30yr)).
query(true_val(ess_reputation, unk_ess_reputation)).

% @attr price_nzd_quest
% @type numeric
% @canonical false
% @original_name Price at Quest Store NZ
% @unit NZD
% @values v1049_99=1049.99 unk_price_nzd_quest=Unknown
% @importance 0.95

0.85::acc(s5, price_nzd_quest).

0.80::true_val(price_nzd_quest, v1049_99); 0.20::true_val(price_nzd_quest, unk_price_nzd_quest).

measured(s5, price_nzd_quest, v1049_99).

all_consistent(price_nzd_quest) :-
    (indep(s5), consistent(s5, price_nzd_quest) ; \+indep(s5)).

evidence(all_consistent(price_nzd_quest)).
query(true_val(price_nzd_quest, v1049_99)).
query(true_val(price_nzd_quest, unk_price_nzd_quest)).

% @attr availability_status_quest
% @type categorical
% @canonical false
% @original_name availability_status (Quest Store)
% @values pre_order_may_2026=Pre_order_May_2026 unk_availability_status_quest=Unknown
% @importance 0.95

0.82::acc(s5, availability_status_quest).

0.78::true_val(availability_status_quest, pre_order_may_2026); 0.22::true_val(availability_status_quest, unk_availability_status_quest).

measured(s5, availability_status_quest, pre_order_may_2026).

all_consistent(availability_status_quest) :-
    (indep(s5), consistent(s5, availability_status_quest) ; \+indep(s5)).

evidence(all_consistent(availability_status_quest)).
query(true_val(availability_status_quest, pre_order_may_2026)).
query(true_val(availability_status_quest, unk_availability_status_quest)).

% @attr available_sizes_quest
% @type categorical
% @canonical false
% @original_name available_sizes (Quest Store)
% @values only_158cm=Only_158cm_shown unk_available_sizes_quest=Unknown
% @importance 0.95

0.78::acc(s5, available_sizes_quest).

0.75::true_val(available_sizes_quest, only_158cm); 0.25::true_val(available_sizes_quest, unk_available_sizes_quest).

measured(s5, available_sizes_quest, only_158cm).

all_consistent(available_sizes_quest) :-
    (indep(s5), consistent(s5, available_sizes_quest) ; \+indep(s5)).

evidence(all_consistent(available_sizes_quest)).
query(true_val(available_sizes_quest, only_158cm)).
query(true_val(available_sizes_quest, unk_available_sizes_quest)).

% @attr quest_store_location
% @type categorical
% @canonical false
% @original_name Quest Store location
% @values queenstown_nz=Queenstown_New_Zealand unk_quest_store_location=Unknown
% @importance 0.95

0.82::acc(s5, quest_store_location).

0.80::true_val(quest_store_location, queenstown_nz); 0.20::true_val(quest_store_location, unk_quest_store_location).

measured(s5, quest_store_location, queenstown_nz).

all_consistent(quest_store_location) :-
    (indep(s5), consistent(s5, quest_store_location) ; \+indep(s5)).

evidence(all_consistent(quest_store_location)).
query(true_val(quest_store_location, queenstown_nz)).
query(true_val(quest_store_location, unk_quest_store_location)).

% @attr quest_store_promo
% @type categorical
% @canonical false
% @original_name Quest Store promo
% @values pct10_off_quest10=10_percent_off_code_QUEST10 unk_quest_store_promo=Unknown
% @importance 0.95

0.78::acc(s5, quest_store_promo).

0.75::true_val(quest_store_promo, pct10_off_quest10); 0.25::true_val(quest_store_promo, unk_quest_store_promo).

measured(s5, quest_store_promo, pct10_off_quest10).

all_consistent(quest_store_promo) :-
    (indep(s5), consistent(s5, quest_store_promo) ; \+indep(s5)).

evidence(all_consistent(quest_store_promo)).
query(true_val(quest_store_promo, pct10_off_quest10)).
query(true_val(quest_store_promo, unk_quest_store_promo)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard Centre)
% @values carries_nitro_2027=Carries_Nitro_2027_collection unk_availability_status_melbourne=Unknown
% @importance 0.70

0.80::acc(s1, availability_status_melbourne).

0.75::true_val(availability_status_melbourne, carries_nitro_2027); 0.25::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s1, availability_status_melbourne, carries_nitro_2027).

all_consistent(availability_status_melbourne) :-
    (indep(s1), consistent(s1, availability_status_melbourne) ; \+indep(s1)).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, carries_nitro_2027)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr melbourne_sc_reputation
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre reputation
% @values est_1996_largest=Established_1996_largest_privately_owned unk_melbourne_sc_reputation=Unknown
% @importance 0.35

0.80::acc(s77, melbourne_sc_reputation).

0.75::true_val(melbourne_sc_reputation, est_1996_largest); 0.25::true_val(melbourne_sc_reputation, unk_melbourne_sc_reputation).

measured(s77, melbourne_sc_reputation, est_1996_largest).

all_consistent(melbourne_sc_reputation) :- consistent(s77, melbourne_sc_reputation).

evidence(all_consistent(melbourne_sc_reputation)).
query(true_val(melbourne_sc_reputation, est_1996_largest)).
query(true_val(melbourne_sc_reputation, unk_melbourne_sc_reputation)).

% @attr melbourne_sc_location
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre location
% @values preston_victoria=392_Plenty_Rd_Preston_Victoria unk_melbourne_sc_location=Unknown
% @importance 0.35

0.80::acc(s77, melbourne_sc_location).

0.75::true_val(melbourne_sc_location, preston_victoria); 0.25::true_val(melbourne_sc_location, unk_melbourne_sc_location).

measured(s77, melbourne_sc_location, preston_victoria).

all_consistent(melbourne_sc_location) :- consistent(s77, melbourne_sc_location).

evidence(all_consistent(melbourne_sc_location)).
query(true_val(melbourne_sc_location, preston_victoria)).
query(true_val(melbourne_sc_location, unk_melbourne_sc_location)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo.com)
% @values not_listed_2027=Does_NOT_list_OG_2027 unk_availability_status_evo=Unknown
% @importance 0.80

0.85::acc(s35, availability_status_evo).

0.82::true_val(availability_status_evo, not_listed_2027); 0.18::true_val(availability_status_evo, unk_availability_status_evo).

measured(s35, availability_status_evo, not_listed_2027).

all_consistent(availability_status_evo) :-
    (indep(s35), consistent(s35, availability_status_evo) ; \+indep(s35)).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, not_listed_2027)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_nitro
% @type categorical
% @canonical false
% @original_name availability_status (Nitro official site)
% @values not_listed_on_site=OG_not_listed_on_Nitro_site unk_availability_status_nitro=Unknown
% @importance 0.90

0.90::acc(s56, availability_status_nitro).

0.88::true_val(availability_status_nitro, not_listed_on_site); 0.12::true_val(availability_status_nitro, unk_availability_status_nitro).

measured(s56, availability_status_nitro, not_listed_on_site).

all_consistent(availability_status_nitro) :- consistent(s56, availability_status_nitro).

evidence(all_consistent(availability_status_nitro)).
query(true_val(availability_status_nitro, not_listed_on_site)).
query(true_val(availability_status_nitro, unk_availability_status_nitro)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values taiwan_playmaker=Taiwan_Playmaker_factory unk_manufacturing_location_current=Unknown
% @importance 0.58

0.82::acc(s94, manufacturing_location_current).
0.75::acc(s102, manufacturing_location_current).

0.95::true_val(manufacturing_location_current, taiwan_playmaker); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s94, manufacturing_location_current, taiwan_playmaker).
measured(s102, manufacturing_location_current, taiwan_playmaker).

all_consistent(manufacturing_location_current) :-
    consistent(s94, manufacturing_location_current),
    consistent(s102, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, taiwan_playmaker)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name manufacturing_location_prior
% @values austria_elan=Austria_Elan_factory unk_manufacturing_location_prior=Unknown
% @importance 0.60

0.80::acc(s94, manufacturing_location_prior).

0.72::true_val(manufacturing_location_prior, austria_elan); 0.28::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

measured(s94, manufacturing_location_prior, austria_elan).

all_consistent(manufacturing_location_prior) :- consistent(s94, manufacturing_location_prior).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, austria_elan)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr technical_development_location
% @type categorical
% @canonical false
% @original_name Technical development location
% @values oberammergau_germany=Oberammergau_Germany unk_technical_development_location=Unknown
% @importance 0.38

0.65::acc(s96, technical_development_location).

0.60::true_val(technical_development_location, oberammergau_germany); 0.40::true_val(technical_development_location, unk_technical_development_location).

measured(s96, technical_development_location, oberammergau_germany).

all_consistent(technical_development_location) :-
    (indep(s96), consistent(s96, technical_development_location) ; \+indep(s96)).

evidence(all_consistent(technical_development_location)).
query(true_val(technical_development_location, oberammergau_germany)).
query(true_val(technical_development_location, unk_technical_development_location)).

% @attr design_location
% @type categorical
% @canonical false
% @original_name Design location
% @values seattle_usa=Seattle_USA unk_design_location=Unknown
% @importance 0.45

0.65::acc(s96, design_location).
0.78::acc(s98, design_location).

0.95::true_val(design_location, seattle_usa); 0.05::true_val(design_location, unk_design_location).

measured(s96, design_location, seattle_usa).
measured(s98, design_location, seattle_usa).

all_consistent(design_location) :-
    (indep(s96), consistent(s96, design_location) ; \+indep(s96)),
    consistent(s98, design_location).

evidence(all_consistent(design_location)).
query(true_val(design_location, seattle_usa)).
query(true_val(design_location, unk_design_location)).

% @attr australian_distributor
% @type categorical
% @canonical false
% @original_name Australian distributor
% @values dingley_village_vic=Unit_15_42_44_Garden_Bvd_Dingley_Village_3172 unk_australian_distributor=Unknown
% @importance 0.40

0.95::acc(s97, australian_distributor).

0.93::true_val(australian_distributor, dingley_village_vic); 0.07::true_val(australian_distributor, unk_australian_distributor).

measured(s97, australian_distributor, dingley_village_vic).

all_consistent(australian_distributor) :- consistent(s97, australian_distributor).

evidence(all_consistent(australian_distributor)).
query(true_val(australian_distributor, dingley_village_vic)).
query(true_val(australian_distributor, unk_australian_distributor)).

% @attr brand_ownership
% @type categorical
% @canonical false
% @original_name Brand ownership
% @values privately_owned_delago=Privately_owned_Thomas_Delago unk_brand_ownership=Unknown
% @importance 0.85

0.90::acc(s4, brand_ownership).

0.88::true_val(brand_ownership, privately_owned_delago); 0.12::true_val(brand_ownership, unk_brand_ownership).

measured(s4, brand_ownership, privately_owned_delago).

all_consistent(brand_ownership) :- consistent(s4, brand_ownership).

evidence(all_consistent(brand_ownership)).
query(true_val(brand_ownership, privately_owned_delago)).
query(true_val(brand_ownership, unk_brand_ownership)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp (Team 2026)
% @unit USD
% @values v579_95=579.95 unk_price_usd_msrp=Unknown
% @importance 0.80

0.88::acc(s35, price_usd_msrp).

0.85::true_val(price_usd_msrp, v579_95); 0.15::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s35, price_usd_msrp, v579_95).

all_consistent(price_usd_msrp) :-
    (indep(s35), consistent(s35, price_usd_msrp) ; \+indep(s35)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v579_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_msrp_team_pro
% @type numeric
% @canonical false
% @original_name price_usd_msrp (Team Pro 2026)
% @unit USD
% @values v629_95=629.95 unk_price_usd_msrp_team_pro=Unknown
% @importance 0.80

0.88::acc(s35, price_usd_msrp_team_pro).

0.85::true_val(price_usd_msrp_team_pro, v629_95); 0.15::true_val(price_usd_msrp_team_pro, unk_price_usd_msrp_team_pro).

measured(s35, price_usd_msrp_team_pro, v629_95).

all_consistent(price_usd_msrp_team_pro) :-
    (indep(s35), consistent(s35, price_usd_msrp_team_pro) ; \+indep(s35)).

evidence(all_consistent(price_usd_msrp_team_pro)).
query(true_val(price_usd_msrp_team_pro, v629_95)).
query(true_val(price_usd_msrp_team_pro, unk_price_usd_msrp_team_pro)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (same construction as Team)
% @values same_as_team=OG_shares_Team_construction unk_comparable_board_same_brand=Unknown
% @importance 0.82

0.82::acc(s6, comparable_board_same_brand).
0.95::acc(s56, comparable_board_same_brand).

0.95::true_val(comparable_board_same_brand, same_as_team); 0.05::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s6, comparable_board_same_brand, same_as_team).
measured(s56, comparable_board_same_brand, same_as_team).

all_consistent(comparable_board_same_brand) :-
    (indep(s6), consistent(s6, comparable_board_same_brand) ; \+indep(s6)),
    consistent(s56, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, same_as_team)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_limited
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (limited edition)
% @values limited_guest_shaper=Limited_Guest_Shaper_exclusive_graphics unk_comparable_board_same_brand_limited=Unknown
% @importance 0.88

0.88::acc(s1, comparable_board_same_brand_limited).
0.90::acc(s4, comparable_board_same_brand_limited).

0.95::true_val(comparable_board_same_brand_limited, limited_guest_shaper); 0.05::true_val(comparable_board_same_brand_limited, unk_comparable_board_same_brand_limited).

measured(s1, comparable_board_same_brand_limited, limited_guest_shaper).
measured(s4, comparable_board_same_brand_limited, limited_guest_shaper).

all_consistent(comparable_board_same_brand_limited) :-
    (indep(s1), consistent(s1, comparable_board_same_brand_limited) ; \+indep(s1)),
    consistent(s4, comparable_board_same_brand_limited).

evidence(all_consistent(comparable_board_same_brand_limited)).
query(true_val(comparable_board_same_brand_limited, limited_guest_shaper)).
query(true_val(comparable_board_same_brand_limited, unk_comparable_board_same_brand_limited)).

% @attr team_longevity
% @type categorical
% @canonical false
% @original_name Nitro Team over two decades
% @values over_two_decades=Over_two_decades_availability unk_team_longevity=Unknown
% @importance 0.78

0.82::acc(s44, team_longevity).
0.93::acc(s56, team_longevity).

0.95::true_val(team_longevity, over_two_decades); 0.05::true_val(team_longevity, unk_team_longevity).

measured(s44, team_longevity, over_two_decades).
measured(s56, team_longevity, over_two_decades).

all_consistent(team_longevity) :-
    (indep(s44), consistent(s44, team_longevity) ; \+indep(s44)),
    consistent(s56, team_longevity).

evidence(all_consistent(team_longevity)).
query(true_val(team_longevity, over_two_decades)).
query(true_val(team_longevity, unk_team_longevity)).

% @attr team_daily_driver
% @type categorical
% @canonical false
% @original_name Nitro Team daily driver
% @values daily_driver_versatile=Daily_driver_versatile_all_terrain unk_team_daily_driver=Unknown
% @importance 0.83

0.85::acc(s1, team_daily_driver).

0.82::true_val(team_daily_driver, daily_driver_versatile); 0.18::true_val(team_daily_driver, unk_team_daily_driver).

measured(s1, team_daily_driver, daily_driver_versatile).

all_consistent(team_daily_driver) :-
    (indep(s1), consistent(s1, team_daily_driver) ; \+indep(s1)).

evidence(all_consistent(team_daily_driver)).
query(true_val(team_daily_driver, daily_driver_versatile)).
query(true_val(team_daily_driver, unk_team_daily_driver)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (list)
% @values custom_algorythm_frontier_bsod=Burton_Custom_Ride_Algorythm_Jones_Frontier_CAPiTA_BSOD unk_comparable_board_cross_brand=Unknown
% @importance 0.73

0.78::acc(s91, comparable_board_cross_brand).

0.72::true_val(comparable_board_cross_brand, custom_algorythm_frontier_bsod); 0.28::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s91, comparable_board_cross_brand, custom_algorythm_frontier_bsod).

all_consistent(comparable_board_cross_brand) :- consistent(s91, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, custom_algorythm_frontier_bsod)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_custom
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Custom comparison)
% @values custom_stiffer_reactive=Custom_stiffer_more_reactive_Team_more_forgiving unk_comparable_board_cross_brand_custom=Unknown
% @importance 0.80

0.78::acc(s91, comparable_board_cross_brand_custom).

0.72::true_val(comparable_board_cross_brand_custom, custom_stiffer_reactive); 0.28::true_val(comparable_board_cross_brand_custom, unk_comparable_board_cross_brand_custom).

measured(s91, comparable_board_cross_brand_custom, custom_stiffer_reactive).

all_consistent(comparable_board_cross_brand_custom) :- consistent(s91, comparable_board_cross_brand_custom).

evidence(all_consistent(comparable_board_cross_brand_custom)).
query(true_val(comparable_board_cross_brand_custom, custom_stiffer_reactive)).
query(true_val(comparable_board_cross_brand_custom, unk_comparable_board_cross_brand_custom)).

% @attr comparable_board_cross_brand_algorythm
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Algorythm comparison)
% @values algorythm_smoother_playful=Algorythm_smoother_more_playful unk_comparable_board_cross_brand_algorythm=Unknown
% @importance 0.70

0.72::acc(s90, comparable_board_cross_brand_algorythm).

0.65::true_val(comparable_board_cross_brand_algorythm, algorythm_smoother_playful); 0.35::true_val(comparable_board_cross_brand_algorythm, unk_comparable_board_cross_brand_algorythm).

measured(s90, comparable_board_cross_brand_algorythm, algorythm_smoother_playful).

all_consistent(comparable_board_cross_brand_algorythm) :- consistent(s90, comparable_board_cross_brand_algorythm).

evidence(all_consistent(comparable_board_cross_brand_algorythm)).
query(true_val(comparable_board_cross_brand_algorythm, algorythm_smoother_playful)).
query(true_val(comparable_board_cross_brand_algorythm, unk_comparable_board_cross_brand_algorythm)).

% @attr comparable_board_cross_brand_alternator
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Alternator comparison)
% @values alternator_more_speed=Similar_shape_Alternator_more_capable_speed unk_comparable_board_cross_brand_alternator=Unknown
% @importance 0.50

0.65::acc(s30, comparable_board_cross_brand_alternator).

0.58::true_val(comparable_board_cross_brand_alternator, alternator_more_speed); 0.42::true_val(comparable_board_cross_brand_alternator, unk_comparable_board_cross_brand_alternator).

measured(s30, comparable_board_cross_brand_alternator, alternator_more_speed).

all_consistent(comparable_board_cross_brand_alternator) :- consistent(s30, comparable_board_cross_brand_alternator).

evidence(all_consistent(comparable_board_cross_brand_alternator)).
query(true_val(comparable_board_cross_brand_alternator, alternator_more_speed)).
query(true_val(comparable_board_cross_brand_alternator, unk_comparable_board_cross_brand_alternator)).

% @attr comparable_board_same_brand_beast
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Beast)
% @values beast_park_tri_lite=Beast_park_focused_True_Twin_Tri_Lite unk_comparable_board_same_brand_beast=Unknown
% @importance 0.45

0.90::acc(s60, comparable_board_same_brand_beast).

0.88::true_val(comparable_board_same_brand_beast, beast_park_tri_lite); 0.12::true_val(comparable_board_same_brand_beast, unk_comparable_board_same_brand_beast).

measured(s60, comparable_board_same_brand_beast, beast_park_tri_lite).

all_consistent(comparable_board_same_brand_beast) :- consistent(s60, comparable_board_same_brand_beast).

evidence(all_consistent(comparable_board_same_brand_beast)).
query(true_val(comparable_board_same_brand_beast, beast_park_tri_lite)).
query(true_val(comparable_board_same_brand_beast, unk_comparable_board_same_brand_beast)).

% @attr comparable_board_same_brand_team_pro
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Team Pro)
% @values team_pro_stiffer_carbon=Team_Pro_stiffer_carbon_tape_Speed_Formula_II unk_comparable_board_same_brand_team_pro=Unknown
% @importance 0.63

0.88::acc(s42, comparable_board_same_brand_team_pro).
0.92::acc(s58, comparable_board_same_brand_team_pro).

0.95::true_val(comparable_board_same_brand_team_pro, team_pro_stiffer_carbon); 0.05::true_val(comparable_board_same_brand_team_pro, unk_comparable_board_same_brand_team_pro).

measured(s42, comparable_board_same_brand_team_pro, team_pro_stiffer_carbon).
measured(s58, comparable_board_same_brand_team_pro, team_pro_stiffer_carbon).

all_consistent(comparable_board_same_brand_team_pro) :-
    consistent(s58, comparable_board_same_brand_team_pro),
    consistent(s42, comparable_board_same_brand_team_pro).

evidence(all_consistent(comparable_board_same_brand_team_pro)).
query(true_val(comparable_board_same_brand_team_pro, team_pro_stiffer_carbon)).
query(true_val(comparable_board_same_brand_team_pro, unk_comparable_board_same_brand_team_pro)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum (great midflex camber)
% @values great_midflex_carving=Great_midflex_camber_fun_carving_popping unk_user_review_forum=Unknown
% @importance 0.80

0.82::acc(s91, user_review_forum).

0.72::true_val(user_review_forum, great_midflex_carving); 0.28::true_val(user_review_forum, unk_user_review_forum).

measured(s91, user_review_forum, great_midflex_carving).

all_consistent(user_review_forum) :- consistent(s91, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, great_midflex_carving)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_soft
% @type categorical
% @canonical false
% @original_name user_review_forum (surprisingly soft)
% @values surprisingly_soft=Surprisingly_soft_cant_push_hard unk_user_review_forum_soft=Unknown
% @importance 0.80

0.75::acc(s84, user_review_forum_soft).

0.65::true_val(user_review_forum_soft, surprisingly_soft); 0.35::true_val(user_review_forum_soft, unk_user_review_forum_soft).

measured(s84, user_review_forum_soft, surprisingly_soft).

all_consistent(user_review_forum_soft) :- consistent(s84, user_review_forum_soft).

evidence(all_consistent(user_review_forum_soft)).
query(true_val(user_review_forum_soft, surprisingly_soft)).
query(true_val(user_review_forum_soft, unk_user_review_forum_soft)).

% @attr user_review_forum_team_pro_stiff
% @type categorical
% @canonical false
% @original_name user_review_forum (Team Pro too stiff)
% @values team_pro_too_stiff=Team_Pro_too_stiff_especially_early_season unk_user_review_forum_team_pro_stiff=Unknown
% @importance 0.80

0.75::acc(s84, user_review_forum_team_pro_stiff).

0.65::true_val(user_review_forum_team_pro_stiff, team_pro_too_stiff); 0.35::true_val(user_review_forum_team_pro_stiff, unk_user_review_forum_team_pro_stiff).

measured(s84, user_review_forum_team_pro_stiff, team_pro_too_stiff).

all_consistent(user_review_forum_team_pro_stiff) :- consistent(s84, user_review_forum_team_pro_stiff).

evidence(all_consistent(user_review_forum_team_pro_stiff)).
query(true_val(user_review_forum_team_pro_stiff, team_pro_too_stiff)).
query(true_val(user_review_forum_team_pro_stiff, unk_user_review_forum_team_pro_stiff)).

% @attr user_review_forum_turn_initiation
% @type categorical
% @canonical false
% @original_name user_review_forum (forgiving turn initiation)
% @values more_forgiving_than_custom=Team_more_forgiving_turn_initiation_than_Custom unk_user_review_forum_turn_initiation=Unknown
% @importance 0.80

0.78::acc(s91, user_review_forum_turn_initiation).

0.72::true_val(user_review_forum_turn_initiation, more_forgiving_than_custom); 0.28::true_val(user_review_forum_turn_initiation, unk_user_review_forum_turn_initiation).

measured(s91, user_review_forum_turn_initiation, more_forgiving_than_custom).

all_consistent(user_review_forum_turn_initiation) :- consistent(s91, user_review_forum_turn_initiation).

evidence(all_consistent(user_review_forum_turn_initiation)).
query(true_val(user_review_forum_turn_initiation, more_forgiving_than_custom)).
query(true_val(user_review_forum_turn_initiation, unk_user_review_forum_turn_initiation)).

% @attr user_review_forum_sidecut
% @type categorical
% @canonical false
% @original_name user_review_forum (dual degressive sidecut)
% @values dual_degressive_fun=Dual_degressive_sidecut_super_fun_in_theory unk_user_review_forum_sidecut=Unknown
% @importance 0.70

0.72::acc(s90, user_review_forum_sidecut).

0.62::true_val(user_review_forum_sidecut, dual_degressive_fun); 0.38::true_val(user_review_forum_sidecut, unk_user_review_forum_sidecut).

measured(s90, user_review_forum_sidecut, dual_degressive_fun).

all_consistent(user_review_forum_sidecut) :- consistent(s90, user_review_forum_sidecut).

evidence(all_consistent(user_review_forum_sidecut)).
query(true_val(user_review_forum_sidecut, dual_degressive_fun)).
query(true_val(user_review_forum_sidecut, unk_user_review_forum_sidecut)).

% @attr reviewer_opinion_the_good_ride_powder
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (powder)
% @values not_ideal_powder=Not_ideal_powder_back_leg_burning unk_reviewer_opinion_the_good_ride_powder=Unknown
% @importance 0.85

0.80::acc(s50, reviewer_opinion_the_good_ride_powder).

0.72::true_val(reviewer_opinion_the_good_ride_powder, not_ideal_powder); 0.28::true_val(reviewer_opinion_the_good_ride_powder, unk_reviewer_opinion_the_good_ride_powder).

measured(s50, reviewer_opinion_the_good_ride_powder, not_ideal_powder).

all_consistent(reviewer_opinion_the_good_ride_powder) :- consistent(s50, reviewer_opinion_the_good_ride_powder).

evidence(all_consistent(reviewer_opinion_the_good_ride_powder)).
query(true_val(reviewer_opinion_the_good_ride_powder, not_ideal_powder)).
query(true_val(reviewer_opinion_the_good_ride_powder, unk_reviewer_opinion_the_good_ride_powder)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride (pop and spring)
% @values lot_of_pop_spring=A_lot_of_pop_and_spring_out_of_turn unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.80::acc(s50, reviewer_opinion_the_good_ride).

0.72::true_val(reviewer_opinion_the_good_ride, lot_of_pop_spring); 0.28::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s50, reviewer_opinion_the_good_ride, lot_of_pop_spring).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s50, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, lot_of_pop_spring)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_the_good_ride_speed
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (speed)
% @values good_glide_damp=Good_glide_good_dampness_at_speed unk_reviewer_opinion_the_good_ride_speed=Unknown
% @importance 0.85

0.80::acc(s50, reviewer_opinion_the_good_ride_speed).

0.72::true_val(reviewer_opinion_the_good_ride_speed, good_glide_damp); 0.28::true_val(reviewer_opinion_the_good_ride_speed, unk_reviewer_opinion_the_good_ride_speed).

measured(s50, reviewer_opinion_the_good_ride_speed, good_glide_damp).

all_consistent(reviewer_opinion_the_good_ride_speed) :- consistent(s50, reviewer_opinion_the_good_ride_speed).

evidence(all_consistent(reviewer_opinion_the_good_ride_speed)).
query(true_val(reviewer_opinion_the_good_ride_speed, good_glide_damp)).
query(true_val(reviewer_opinion_the_good_ride_speed, unk_reviewer_opinion_the_good_ride_speed)).

% @attr reviewer_opinion_the_good_ride_switch
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (switch)
% @values doable_centered=Very_doable_either_way_when_centered unk_reviewer_opinion_the_good_ride_switch=Unknown
% @importance 0.85

0.80::acc(s50, reviewer_opinion_the_good_ride_switch).

0.72::true_val(reviewer_opinion_the_good_ride_switch, doable_centered); 0.28::true_val(reviewer_opinion_the_good_ride_switch, unk_reviewer_opinion_the_good_ride_switch).

measured(s50, reviewer_opinion_the_good_ride_switch, doable_centered).

all_consistent(reviewer_opinion_the_good_ride_switch) :- consistent(s50, reviewer_opinion_the_good_ride_switch).

evidence(all_consistent(reviewer_opinion_the_good_ride_switch)).
query(true_val(reviewer_opinion_the_good_ride_switch, doable_centered)).
query(true_val(reviewer_opinion_the_good_ride_switch, unk_reviewer_opinion_the_good_ride_switch)).

% @attr reviewer_opinion_the_good_ride_park
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (park/pipe)
% @values shines_kicker_pipe=Shines_in_kicker_line_drives_well_pipe unk_reviewer_opinion_the_good_ride_park=Unknown
% @importance 0.85

0.80::acc(s50, reviewer_opinion_the_good_ride_park).

0.72::true_val(reviewer_opinion_the_good_ride_park, shines_kicker_pipe); 0.28::true_val(reviewer_opinion_the_good_ride_park, unk_reviewer_opinion_the_good_ride_park).

measured(s50, reviewer_opinion_the_good_ride_park, shines_kicker_pipe).

all_consistent(reviewer_opinion_the_good_ride_park) :- consistent(s50, reviewer_opinion_the_good_ride_park).

evidence(all_consistent(reviewer_opinion_the_good_ride_park)).
query(true_val(reviewer_opinion_the_good_ride_park, shines_kicker_pipe)).
query(true_val(reviewer_opinion_the_good_ride_park, unk_reviewer_opinion_the_good_ride_park)).

% @attr reviewer_opinion_the_good_ride_hard_snow
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (hard snow)
% @values borders_hanging=Borders_on_hanging_in_hard_snow unk_reviewer_opinion_the_good_ride_hard_snow=Unknown
% @importance 0.85

0.80::acc(s50, reviewer_opinion_the_good_ride_hard_snow).

0.72::true_val(reviewer_opinion_the_good_ride_hard_snow, borders_hanging); 0.28::true_val(reviewer_opinion_the_good_ride_hard_snow, unk_reviewer_opinion_the_good_ride_hard_snow).

measured(s50, reviewer_opinion_the_good_ride_hard_snow, borders_hanging).

all_consistent(reviewer_opinion_the_good_ride_hard_snow) :- consistent(s50, reviewer_opinion_the_good_ride_hard_snow).

evidence(all_consistent(reviewer_opinion_the_good_ride_hard_snow)).
query(true_val(reviewer_opinion_the_good_ride_hard_snow, borders_hanging)).
query(true_val(reviewer_opinion_the_good_ride_hard_snow, unk_reviewer_opinion_the_good_ride_hard_snow)).

% @attr reviewer_opinion_the_good_ride_skill
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (skill requirement)
% @values competent_rider_needed=Need_very_competent_rider_for_camber unk_reviewer_opinion_the_good_ride_skill=Unknown
% @importance 0.85

0.80::acc(s50, reviewer_opinion_the_good_ride_skill).

0.72::true_val(reviewer_opinion_the_good_ride_skill, competent_rider_needed); 0.28::true_val(reviewer_opinion_the_good_ride_skill, unk_reviewer_opinion_the_good_ride_skill).

measured(s50, reviewer_opinion_the_good_ride_skill, competent_rider_needed).

all_consistent(reviewer_opinion_the_good_ride_skill) :- consistent(s50, reviewer_opinion_the_good_ride_skill).

evidence(all_consistent(reviewer_opinion_the_good_ride_skill)).
query(true_val(reviewer_opinion_the_good_ride_skill, competent_rider_needed)).
query(true_val(reviewer_opinion_the_good_ride_skill, unk_reviewer_opinion_the_good_ride_skill)).

% @attr user_review_forum_all_arounder
% @type categorical
% @canonical false
% @original_name user_review_forum (all arounder)
% @values great_all_arounder=Great_all_arounder_serve_well_keep_happy unk_user_review_forum_all_arounder=Unknown
% @importance 0.80

0.75::acc(s84, user_review_forum_all_arounder).

0.65::true_val(user_review_forum_all_arounder, great_all_arounder); 0.35::true_val(user_review_forum_all_arounder, unk_user_review_forum_all_arounder).

measured(s84, user_review_forum_all_arounder, great_all_arounder).

all_consistent(user_review_forum_all_arounder) :- consistent(s84, user_review_forum_all_arounder).

evidence(all_consistent(user_review_forum_all_arounder)).
query(true_val(user_review_forum_all_arounder, great_all_arounder)).
query(true_val(user_review_forum_all_arounder, unk_user_review_forum_all_arounder)).

% @attr reviewer_opinion_the_good_ride_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (weight range)
% @values alt_157_handles_195lb=Alternator_157_easily_handled_190_195lb unk_reviewer_opinion_the_good_ride_weight=Unknown
% @importance 0.65

0.75::acc(s25, reviewer_opinion_the_good_ride_weight).

0.65::true_val(reviewer_opinion_the_good_ride_weight, alt_157_handles_195lb); 0.35::true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight).

measured(s25, reviewer_opinion_the_good_ride_weight, alt_157_handles_195lb).

all_consistent(reviewer_opinion_the_good_ride_weight) :- consistent(s25, reviewer_opinion_the_good_ride_weight).

evidence(all_consistent(reviewer_opinion_the_good_ride_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, alt_157_handles_195lb)).
query(true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight)).

% @attr user_review_forum_resale
% @type categorical
% @canonical false
% @original_name user_review_forum (resale value)
% @values lower_resale_than_burton=Nitro_lower_resale_value_than_Burton unk_user_review_forum_resale=Unknown
% @importance 0.80

0.75::acc(s91, user_review_forum_resale).

0.68::true_val(user_review_forum_resale, lower_resale_than_burton); 0.32::true_val(user_review_forum_resale, unk_user_review_forum_resale).

measured(s91, user_review_forum_resale, lower_resale_than_burton).

all_consistent(user_review_forum_resale) :- consistent(s91, user_review_forum_resale).

evidence(all_consistent(user_review_forum_resale)).
query(true_val(user_review_forum_resale, lower_resale_than_burton)).
query(true_val(user_review_forum_resale, unk_user_review_forum_resale)).

% @attr boardsport_source_description
% @type categorical
% @canonical false
% @original_name Boardsport SOURCE industry description
% @values authentic_independent_leader=Truly_authentic_independent_market_leader unk_boardsport_source_description=Unknown
% @importance 0.65

0.90::acc(s4, boardsport_source_description).

0.88::true_val(boardsport_source_description, authentic_independent_leader); 0.12::true_val(boardsport_source_description, unk_boardsport_source_description).

measured(s4, boardsport_source_description, authentic_independent_leader).

all_consistent(boardsport_source_description) :- consistent(s4, boardsport_source_description).

evidence(all_consistent(boardsport_source_description)).
query(true_val(boardsport_source_description, authentic_independent_leader)).
query(true_val(boardsport_source_description, unk_boardsport_source_description)).

% @attr industry_firsts
% @type categorical
% @canonical false
% @original_name Nitro industry firsts
% @values first_asym_twin_womens_pro=First_asymmetrical_twin_tip_first_womens_pro_model unk_industry_firsts=Unknown
% @importance 0.45

0.78::acc(s98, industry_firsts).

0.75::true_val(industry_firsts, first_asym_twin_womens_pro); 0.25::true_val(industry_firsts, unk_industry_firsts).

measured(s98, industry_firsts, first_asym_twin_womens_pro).

all_consistent(industry_firsts) :- consistent(s98, industry_firsts).

evidence(all_consistent(industry_firsts)).
query(true_val(industry_firsts, first_asym_twin_womens_pro)).
query(true_val(industry_firsts, unk_industry_firsts)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values designed_seattle_engineered_europe=Designed_Seattle_engineered_Europe_premium unk_reviewer_opinion_whitelines=Unknown
% @importance 0.45

0.78::acc(s98, reviewer_opinion_whitelines).

0.75::true_val(reviewer_opinion_whitelines, designed_seattle_engineered_europe); 0.25::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s98, reviewer_opinion_whitelines, designed_seattle_engineered_europe).

all_consistent(reviewer_opinion_whitelines) :- consistent(s98, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, designed_seattle_engineered_europe)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr twelve_board_store_description
% @type categorical
% @canonical false
% @original_name Twelve Board Store description
% @values global_reputation_quality=Global_reputation_quality_craftsmanship_innovative_tech unk_twelve_board_store_description=Unknown
% @importance 0.50

0.70::acc(s81, twelve_board_store_description).

0.65::true_val(twelve_board_store_description, global_reputation_quality); 0.35::true_val(twelve_board_store_description, unk_twelve_board_store_description).

measured(s81, twelve_board_store_description, global_reputation_quality).

all_consistent(twelve_board_store_description) :-
    (indep(s81), consistent(s81, twelve_board_store_description) ; \+indep(s81)).

evidence(all_consistent(twelve_board_store_description)).
query(true_val(twelve_board_store_description, global_reputation_quality)).
query(true_val(twelve_board_store_description, unk_twelve_board_store_description)).

% @attr auski_description
% @type categorical
% @canonical false
% @original_name Auski description
% @values design_ground_breaking_europe=Design_ground_breaking_made_Europe_note_outdated unk_auski_description=Unknown
% @importance 0.60

0.60::acc(s69, auski_description).

0.55::true_val(auski_description, design_ground_breaking_europe); 0.45::true_val(auski_description, unk_auski_description).

measured(s69, auski_description, design_ground_breaking_europe).

all_consistent(auski_description) :-
    (indep(s69), consistent(s69, auski_description) ; \+indep(s69)).

evidence(all_consistent(auski_description)).
query(true_val(auski_description, design_ground_breaking_europe)).
query(true_val(auski_description, unk_auski_description)).

% @attr slush_magazine_preview
% @type categorical
% @canonical false
% @original_name Slush Magazine 2027 preview
% @values praised_catalog_team_driven=Praised_extensive_catalog_team_driven_design unk_slush_magazine_preview=Unknown
% @importance 0.35

0.62::acc(s8, slush_magazine_preview).

0.55::true_val(slush_magazine_preview, praised_catalog_team_driven); 0.45::true_val(slush_magazine_preview, unk_slush_magazine_preview).

measured(s8, slush_magazine_preview, praised_catalog_team_driven).

all_consistent(slush_magazine_preview) :- consistent(s8, slush_magazine_preview).

evidence(all_consistent(slush_magazine_preview)).
query(true_val(slush_magazine_preview, praised_catalog_team_driven)).
query(true_val(slush_magazine_preview, unk_slush_magazine_preview)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms (ESS Board Store)
% @values hassle_free_30_day=Hassle_free_30_day_returns unk_return_policy_terms=Unknown
% @importance 0.95

0.82::acc(s6, return_policy_terms).

0.78::true_val(return_policy_terms, hassle_free_30_day); 0.22::true_val(return_policy_terms, unk_return_policy_terms).

measured(s6, return_policy_terms, hassle_free_30_day).

all_consistent(return_policy_terms) :-
    (indep(s6), consistent(s6, return_policy_terms) ; \+indep(s6)).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, hassle_free_30_day)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr return_policy_terms_quest
% @type categorical
% @canonical false
% @original_name return_policy_terms (Quest Store)
% @values exchange_credit_14_day=Full_price_returnable_14_days_exchange_credit_refund unk_return_policy_terms_quest=Unknown
% @importance 0.95

0.78::acc(s5, return_policy_terms_quest).

0.75::true_val(return_policy_terms_quest, exchange_credit_14_day); 0.25::true_val(return_policy_terms_quest, unk_return_policy_terms_quest).

measured(s5, return_policy_terms_quest, exchange_credit_14_day).

all_consistent(return_policy_terms_quest) :-
    (indep(s5), consistent(s5, return_policy_terms_quest) ; \+indep(s5)).

evidence(all_consistent(return_policy_terms_quest)).
query(true_val(return_policy_terms_quest, exchange_credit_14_day)).
query(true_val(return_policy_terms_quest, unk_return_policy_terms_quest)).

% @attr return_policy_terms_melbourne
% @type categorical
% @canonical false
% @original_name return_policy_terms (Melbourne Snowboard Centre)
% @values exchange_credit_30_day=30_day_exchange_store_credit_no_mounted unk_return_policy_terms_melbourne=Unknown
% @importance 0.50

0.78::acc(s1, return_policy_terms_melbourne).

0.72::true_val(return_policy_terms_melbourne, exchange_credit_30_day); 0.28::true_val(return_policy_terms_melbourne, unk_return_policy_terms_melbourne).

measured(s1, return_policy_terms_melbourne, exchange_credit_30_day).

all_consistent(return_policy_terms_melbourne) :-
    (indep(s1), consistent(s1, return_policy_terms_melbourne) ; \+indep(s1)).

evidence(all_consistent(return_policy_terms_melbourne)).
query(true_val(return_policy_terms_melbourne, exchange_credit_30_day)).
query(true_val(return_policy_terms_melbourne, unk_return_policy_terms_melbourne)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values standard_2x4_all_modern=Standard_2x4_compatible_all_modern_bindings unk_binding_compatibility=Unknown
% @importance 0.85

0.88::acc(sm, binding_compatibility).

0.85::true_val(binding_compatibility, standard_2x4_all_modern); 0.15::true_val(binding_compatibility, unk_binding_compatibility).

measured(sm, binding_compatibility, standard_2x4_all_modern).

all_consistent(binding_compatibility) :-
    (indep(sm), consistent(sm, binding_compatibility) ; \+indep(sm)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_2x4_all_modern)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr no_carbon_reinforcement
% @type categorical
% @canonical false
% @original_name Board does NOT include carbon reinforcement
% @values no_carbon=No_carbon_uses_Bi_Lite_like_standard_Team unk_no_carbon_reinforcement=Unknown
% @importance 0.78

0.92::acc(s58, no_carbon_reinforcement).
0.88::acc(sm, no_carbon_reinforcement).

0.95::true_val(no_carbon_reinforcement, no_carbon); 0.05::true_val(no_carbon_reinforcement, unk_no_carbon_reinforcement).

measured(s58, no_carbon_reinforcement, no_carbon).
measured(sm, no_carbon_reinforcement, no_carbon).

all_consistent(no_carbon_reinforcement) :-
    consistent(s58, no_carbon_reinforcement),
    (indep(sm), consistent(sm, no_carbon_reinforcement) ; \+indep(sm)).

evidence(all_consistent(no_carbon_reinforcement)).
query(true_val(no_carbon_reinforcement, no_carbon)).
query(true_val(no_carbon_reinforcement, unk_no_carbon_reinforcement)).

% @attr no_kevlar_reinforcement
% @type categorical
% @canonical false
% @original_name Board does NOT use Kevlar reinforcement
% @values no_kevlar=No_Kevlar_unlike_Beast unk_no_kevlar_reinforcement=Unknown
% @importance 0.45

0.90::acc(s60, no_kevlar_reinforcement).

0.88::true_val(no_kevlar_reinforcement, no_kevlar); 0.12::true_val(no_kevlar_reinforcement, unk_no_kevlar_reinforcement).

measured(s60, no_kevlar_reinforcement, no_kevlar).

all_consistent(no_kevlar_reinforcement) :- consistent(s60, no_kevlar_reinforcement).

evidence(all_consistent(no_kevlar_reinforcement)).
query(true_val(no_kevlar_reinforcement, no_kevlar)).
query(true_val(no_kevlar_reinforcement, unk_no_kevlar_reinforcement)).