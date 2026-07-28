0.15::indep(s1).
0.15::indep(s3).
0.15::indep(s4).
0.15::indep(s5).
0.20::indep(s6).
0.15::indep(s8).
0.15::indep(s10).
0.20::indep(s16).
0.25::indep(s17).
0.20::indep(s18).
0.15::indep(s20).
0.15::indep(s21).
0.15::indep(s22).
0.15::indep(s23).
0.15::indep(s24).
0.15::indep(s25).
0.15::indep(s26).
0.20::indep(s30).
0.15::indep(s31).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.93::acc(s2, brand).
0.80::acc(s1, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, salomon); 0.05::true_val(brand, unk_brand).

measured(s2, brand, salomon).
measured(s1, brand, salomon).

all_consistent(brand) :-
    consistent(s2, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

0.93::acc(s2, model_name).
0.80::acc(s1, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values assassin_pro=Assassin_Pro unk_model_name=Unknown
% @importance 1.0

0.95::true_val(model_name, assassin_pro); 0.05::true_val(model_name, unk_model_name).

measured(s2, model_name, assassin_pro).
measured(s1, model_name, assassin_pro).

all_consistent(model_name) :-
    consistent(s2, model_name),
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).

evidence(all_consistent(model_name)).
query(true_val(model_name, assassin_pro)).
query(true_val(model_name, unk_model_name)).

0.93::acc(s2, model_year).
0.80::acc(s1, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025=2025 unk_model_year=Unknown
% @importance 1.0

0.95::true_val(model_year, y2025); 0.05::true_val(model_year, unk_model_year).

measured(s2, model_year, y2025).
measured(s1, model_year, y2025).

all_consistent(model_year) :-
    consistent(s2, model_year),
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2025)).
query(true_val(model_year, unk_model_year)).

0.93::acc(s2, product_type).
0.80::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s2, product_type, snowboard).
measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s2, product_type),
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.72::acc(s3, gender).
0.60::acc(s4, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.6

0.92::true_val(gender, mens); 0.08::true_val(gender, unk_gender).

measured(s3, gender, mens).
measured(s4, gender, mens).

all_consistent(gender) :-
    (indep(s3), consistent(s3, gender) ; \+indep(s3)),
    (indep(s4), consistent(s4, gender) ; \+indep(s4)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.62::acc(s5, manufacturer).
0.60::acc(s6, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values annecy_france_1947=Annecy_France_founded_1947 unk_manufacturer=Unknown
% @importance 0.4

0.80::true_val(manufacturer, annecy_france_1947); 0.20::true_val(manufacturer, unk_manufacturer).

measured(s5, manufacturer, annecy_france_1947).
measured(s6, manufacturer, annecy_france_1947).

all_consistent(manufacturer) :-
    (indep(s5), consistent(s5, manufacturer) ; \+indep(s5)),
    (indep(s6), consistent(s6, manufacturer) ; \+indep(s6)).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, annecy_france_1947)).
query(true_val(manufacturer, unk_manufacturer)).

0.85::acc(s7, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values china=China unk_manufacturing_location=Unknown
% @importance 0.95

0.74::true_val(manufacturing_location, china); 0.26::true_val(manufacturing_location, unk_manufacturing_location).

measured(s7, manufacturing_location, china).

all_consistent(manufacturing_location) :- consistent(s7, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, china)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.58::acc(s6, manufacturer_reputation).

% @attr manufacturer_reputation
% @type categorical
% @canonical false
% @original_name Manufacturer reputation
% @values leading_outdoor_brand=Leading_outdoor_adventure_sports_brand unk_manufacturer_reputation=Unknown
% @importance 0.35

0.46::true_val(manufacturer_reputation, leading_outdoor_brand); 0.54::true_val(manufacturer_reputation, unk_manufacturer_reputation).

measured(s6, manufacturer_reputation, leading_outdoor_brand).

all_consistent(manufacturer_reputation) :-
    (indep(s6), consistent(s6, manufacturer_reputation) ; \+indep(s6)).

evidence(all_consistent(manufacturer_reputation)).
query(true_val(manufacturer_reputation, leading_outdoor_brand)).
query(true_val(manufacturer_reputation, unk_manufacturer_reputation)).

0.60::acc(s5, parent_company).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports=Amer_Sports unk_parent_company=Unknown
% @importance 0.4

0.54::true_val(parent_company, amer_sports); 0.46::true_val(parent_company, unk_parent_company).

measured(s5, parent_company, amer_sports).

all_consistent(parent_company) :-
    (indep(s5), consistent(s5, parent_company) ; \+indep(s5)).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports)).
query(true_val(parent_company, unk_parent_company)).

0.72::acc(s8, sku_article_ref).
0.93::acc(s9, sku_article_ref).

% @attr sku_article_ref
% @type categorical
% @canonical false
% @original_name SKU / Article ref (2025 model)
% @values l47663000_l47348100=L47663000_L47348100 unk_sku_article_ref=Unknown
% @importance 0.825

0.95::true_val(sku_article_ref, l47663000_l47348100); 0.05::true_val(sku_article_ref, unk_sku_article_ref).

measured(s8, sku_article_ref, l47663000_l47348100).
measured(s9, sku_article_ref, l47663000_l47348100).

all_consistent(sku_article_ref) :-
    consistent(s9, sku_article_ref),
    (indep(s8), consistent(s8, sku_article_ref) ; \+indep(s8)).

evidence(all_consistent(sku_article_ref)).
query(true_val(sku_article_ref, l47663000_l47348100)).
query(true_val(sku_article_ref, unk_sku_article_ref)).

0.72::acc(s10, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_year_mfg_defects=2yr_warranty_manufacturer_defects unk_warranty=Unknown
% @importance 0.7

0.71::true_val(warranty, two_year_mfg_defects); 0.29::true_val(warranty, unk_warranty).

measured(s10, warranty, two_year_mfg_defects).

all_consistent(warranty) :-
    (indep(s10), consistent(s10, warranty) ; \+indep(s10)).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_year_mfg_defects)).
query(true_val(warranty, unk_warranty)).

0.72::acc(s10, warranty_exclusions).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty
% @values no_wear_abuse_cosmetic=No_coverage_wear_abuse_cosmetic_mods unk_warranty_exclusions=Unknown
% @importance 0.7

0.71::true_val(warranty_exclusions, no_wear_abuse_cosmetic); 0.29::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s10, warranty_exclusions, no_wear_abuse_cosmetic).

all_consistent(warranty_exclusions) :-
    (indep(s10), consistent(s10, warranty_exclusions) ; \+indep(s10)).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, no_wear_abuse_cosmetic)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

0.85::acc(s7, model_first_available_year).
0.70::acc(s11, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2018_2019=2018_2019_season unk_model_first_available_year=Unknown
% @importance 0.825

0.93::true_val(model_first_available_year, season_2018_2019); 0.07::true_val(model_first_available_year, unk_model_first_available_year).

measured(s7, model_first_available_year, season_2018_2019).
measured(s11, model_first_available_year, season_2018_2019).

all_consistent(model_first_available_year) :-
    consistent(s7, model_first_available_year),
    consistent(s11, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2018_2019)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.85::acc(s12, redesign_year).
0.68::acc(s13, redesign_year).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values y2025_retool=2025_significant_retool_recycled_ABS unk_redesign_year=Unknown
% @importance 0.75

0.93::true_val(redesign_year, y2025_retool); 0.07::true_val(redesign_year, unk_redesign_year).

measured(s12, redesign_year, y2025_retool).
measured(s13, redesign_year, y2025_retool).

all_consistent(redesign_year) :-
    consistent(s12, redesign_year),
    consistent(s13, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, y2025_retool)).
query(true_val(redesign_year, unk_redesign_year)).

0.93::acc(s2, shape).
0.82::acc(s1, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 1.0

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).

measured(s2, shape, directional_twin).
measured(s1, shape, directional_twin).

all_consistent(shape) :-
    consistent(s2, shape),
    (indep(s1), consistent(s1, shape) ; \+indep(s1)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

0.82::acc(s1, shape_ride_feel).

% @attr shape_ride_feel
% @type categorical
% @canonical false
% @original_name shape
% @values true_twin_floaty_nose=Rides_like_true_twin_floatier_nose unk_shape_ride_feel=Unknown
% @importance 1.0

0.78::true_val(shape_ride_feel, true_twin_floaty_nose); 0.22::true_val(shape_ride_feel, unk_shape_ride_feel).

measured(s1, shape_ride_feel, true_twin_floaty_nose).

all_consistent(shape_ride_feel) :-
    (indep(s1), consistent(s1, shape_ride_feel) ; \+indep(s1)).

evidence(all_consistent(shape_ride_feel)).
query(true_val(shape_ride_feel, true_twin_floaty_nose)).
query(true_val(shape_ride_feel, unk_shape_ride_feel)).

0.93::acc(s2, camber_type).
0.82::acc(s1, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rock_out_camber=Rock_Out_Camber unk_camber_type=Unknown
% @importance 1.0

0.95::true_val(camber_type, rock_out_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s2, camber_type, rock_out_camber).
measured(s1, camber_type, rock_out_camber).

all_consistent(camber_type) :-
    consistent(s2, camber_type),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, rock_out_camber)).
query(true_val(camber_type, unk_camber_type)).

0.88::acc(s14, camber_description).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values mostly_camber_forgiving=Mostly_camber_little_early_rise_forgiving unk_camber_description=Unknown
% @importance 0.85

0.72::true_val(camber_description, mostly_camber_forgiving); 0.28::true_val(camber_description, unk_camber_description).

measured(s14, camber_description, mostly_camber_forgiving).

all_consistent(camber_description) :- consistent(s14, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, mostly_camber_forgiving)).
query(true_val(camber_description, unk_camber_description)).

0.90::acc(s1, setback).
0.88::acc(s9, setback).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v20=20.0 unk_setback=Unknown
% @importance 0.95

0.95::true_val(setback, v20); 0.05::true_val(setback, unk_setback).

measured(s1, setback, v20).
measured(s9, setback, v20).

all_consistent(setback) :-
    consistent(s9, setback),
    (indep(s1), consistent(s1, setback) ; \+indep(s1)).

evidence(all_consistent(setback)).
query(true_val(setback, v20)).
query(true_val(setback, unk_setback)).

0.88::acc(s14, setback_ride_feel).

% @attr setback_ride_feel
% @type categorical
% @canonical false
% @original_name setback
% @values feels_true_twin=Feels_almost_true_twin_minus20mm unk_setback_ride_feel=Unknown
% @importance 0.85

0.72::true_val(setback_ride_feel, feels_true_twin); 0.28::true_val(setback_ride_feel, unk_setback_ride_feel).

measured(s14, setback_ride_feel, feels_true_twin).

all_consistent(setback_ride_feel) :- consistent(s14, setback_ride_feel).

evidence(all_consistent(setback_ride_feel)).
query(true_val(setback_ride_feel, feels_true_twin)).
query(true_val(setback_ride_feel, unk_setback_ride_feel)).

0.93::acc(s2, sidecut_type).
0.82::acc(s1, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values quadralizer=Quadralizer unk_sidecut_type=Unknown
% @importance 1.0

0.95::true_val(sidecut_type, quadralizer); 0.05::true_val(sidecut_type, unk_sidecut_type).

measured(s2, sidecut_type, quadralizer).
measured(s1, sidecut_type, quadralizer).

all_consistent(sidecut_type) :-
    consistent(s2, sidecut_type),
    (indep(s1), consistent(s1, sidecut_type) ; \+indep(s1)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, quadralizer)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.90::acc(s15, sidecut_type_performance).

% @attr sidecut_type_performance
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values redistributes_pressure=Redistributes_pressure_superior_control unk_sidecut_type_performance=Unknown
% @importance 0.75

0.81::true_val(sidecut_type_performance, redistributes_pressure); 0.19::true_val(sidecut_type_performance, unk_sidecut_type_performance).

measured(s15, sidecut_type_performance, redistributes_pressure).

all_consistent(sidecut_type_performance) :- consistent(s15, sidecut_type_performance).

evidence(all_consistent(sidecut_type_performance)).
query(true_val(sidecut_type_performance, redistributes_pressure)).
query(true_val(sidecut_type_performance, unk_sidecut_type_performance)).

0.88::acc(s14, sidecut_type_review).

% @attr sidecut_type_review
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values four_pronounced_sidecuts=Four_pronounced_opposing_sidecuts_helps_grip unk_sidecut_type_review=Unknown
% @importance 0.85

0.72::true_val(sidecut_type_review, four_pronounced_sidecuts); 0.28::true_val(sidecut_type_review, unk_sidecut_type_review).

measured(s14, sidecut_type_review, four_pronounced_sidecuts).

all_consistent(sidecut_type_review) :- consistent(s14, sidecut_type_review).

evidence(all_consistent(sidecut_type_review)).
query(true_val(sidecut_type_review, four_pronounced_sidecuts)).
query(true_val(sidecut_type_review, unk_sidecut_type_review)).

0.93::acc(s9, edge_bevel_spec).
0.75::acc(s8, edge_bevel_spec).
0.50::acc(s16, edge_bevel_spec).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values freestyle_eb_2_3=Freestyle_EB_2deg_nose_tail_3deg_feet all_mountain_eb_1_2=All_Mountain_EB_1deg_2deg
% @importance 0.725

0.70::true_val(edge_bevel_spec, freestyle_eb_2_3); 0.30::true_val(edge_bevel_spec, all_mountain_eb_1_2).

measured(s9, edge_bevel_spec, freestyle_eb_2_3).
measured(s8, edge_bevel_spec, freestyle_eb_2_3).
measured(s16, edge_bevel_spec, all_mountain_eb_1_2).

all_consistent(edge_bevel_spec) :-
    consistent(s9, edge_bevel_spec),
    (indep(s8), consistent(s8, edge_bevel_spec) ; \+indep(s8)),
    (indep(s16), consistent(s16, edge_bevel_spec) ; \+indep(s16)).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, freestyle_eb_2_3)).
query(true_val(edge_bevel_spec, all_mountain_eb_1_2)).

0.78::acc(s17, edge_bevel_spec_2026).

% @attr edge_bevel_spec_2026
% @type categorical
% @canonical false
% @original_name edge_bevel_spec
% @values all_mountain_eb_1_5=All_Mountain_EB_1_5deg_base_1_5deg_side unk_edge_bevel_spec_2026=Unknown
% @importance 0.8

0.68::true_val(edge_bevel_spec_2026, all_mountain_eb_1_5); 0.32::true_val(edge_bevel_spec_2026, unk_edge_bevel_spec_2026).

measured(s17, edge_bevel_spec_2026, all_mountain_eb_1_5).

all_consistent(edge_bevel_spec_2026) :-
    (indep(s17), consistent(s17, edge_bevel_spec_2026) ; \+indep(s17)).

evidence(all_consistent(edge_bevel_spec_2026)).
query(true_val(edge_bevel_spec_2026, all_mountain_eb_1_5)).
query(true_val(edge_bevel_spec_2026, unk_edge_bevel_spec_2026)).

0.72::acc(s18, flex_rating_5).

% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical true
% @original_name flex_rating_5
% @values v5=5.0 unk_flex_rating_5=Unknown
% @importance 0.85

0.60::true_val(flex_rating_5, v5); 0.40::true_val(flex_rating_5, unk_flex_rating_5).

measured(s18, flex_rating_5, v5).

all_consistent(flex_rating_5) :-
    (indep(s18), consistent(s18, flex_rating_5) ; \+indep(s18)).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v5)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

0.93::acc(s2, flex_rating_10_manufacturer).

% @attr flex_rating_10_manufacturer
% @type categorical
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values stiff=Stiff unk_flex_rating_10_manufacturer=Unknown
% @importance 1.0

0.90::true_val(flex_rating_10_manufacturer, stiff); 0.10::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s2, flex_rating_10_manufacturer, stiff).

all_consistent(flex_rating_10_manufacturer) :- consistent(s2, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, stiff)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

0.88::acc(s14, flex_feel).
0.75::acc(s19, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_stiff=Medium_Stiff unk_flex_feel=Unknown
% @importance 0.80

0.93::true_val(flex_feel, medium_stiff); 0.07::true_val(flex_feel, unk_flex_feel).

measured(s14, flex_feel, medium_stiff).
measured(s19, flex_feel, medium_stiff).

all_consistent(flex_feel) :-
    consistent(s14, flex_feel),
    consistent(s19, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_stiff)).
query(true_val(flex_feel, unk_flex_feel)).

0.78::acc(s17, flex_rating_10_evo).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values very_stiff=Very_Stiff unk_flex_rating_10_evo=Unknown
% @importance 0.8

0.68::true_val(flex_rating_10_evo, very_stiff); 0.32::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s17, flex_rating_10_evo, very_stiff).

all_consistent(flex_rating_10_evo) :-
    (indep(s17), consistent(s17, flex_rating_10_evo) ; \+indep(s17)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, very_stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

0.72::acc(s18, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional=Directional_flex_for_power_at_high_speed unk_flex_direction=Unknown
% @importance 0.85

0.60::true_val(flex_direction, directional); 0.40::true_val(flex_direction, unk_flex_direction).

measured(s18, flex_direction, directional).

all_consistent(flex_direction) :-
    (indep(s18), consistent(s18, flex_direction) ; \+indep(s18)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional)).
query(true_val(flex_direction, unk_flex_direction)).

0.85::acc(s7, reviewer_opinion_the_good_ride_buttering).

% @attr reviewer_opinion_the_good_ride_buttering
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values semi_hard=Semi_Hard_not_easy_to_butter_pops_well unk_reviewer_opinion_the_good_ride_buttering=Unknown
% @importance 0.95

0.74::true_val(reviewer_opinion_the_good_ride_buttering, semi_hard); 0.26::true_val(reviewer_opinion_the_good_ride_buttering, unk_reviewer_opinion_the_good_ride_buttering).

measured(s7, reviewer_opinion_the_good_ride_buttering, semi_hard).

all_consistent(reviewer_opinion_the_good_ride_buttering) :- consistent(s7, reviewer_opinion_the_good_ride_buttering).

evidence(all_consistent(reviewer_opinion_the_good_ride_buttering)).
query(true_val(reviewer_opinion_the_good_ride_buttering, semi_hard)).
query(true_val(reviewer_opinion_the_good_ride_buttering, unk_reviewer_opinion_the_good_ride_buttering)).

0.93::acc(s2, core_material).
0.82::acc(s1, core_material).
0.93::acc(s9, core_material).
0.62::acc(s20, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values ghost_green_core_paulownia=Ghost_Green_Core_Paulownia unk_core_material=Unknown
% @importance 0.85

0.95::true_val(core_material, ghost_green_core_paulownia); 0.05::true_val(core_material, unk_core_material).

measured(s2, core_material, ghost_green_core_paulownia).
measured(s1, core_material, ghost_green_core_paulownia).
measured(s9, core_material, ghost_green_core_paulownia).
measured(s20, core_material, ghost_green_core_paulownia).

all_consistent(core_material) :-
    consistent(s2, core_material),
    consistent(s9, core_material),
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)),
    (indep(s20), consistent(s20, core_material) ; \+indep(s20)).

evidence(all_consistent(core_material)).
query(true_val(core_material, ghost_green_core_paulownia)).
query(true_val(core_material, unk_core_material)).

0.82::acc(s1, core_material_popster).

% @attr core_material_popster
% @type categorical
% @canonical false
% @original_name core_material
% @values popster=Popster_thickness_variations_skate_snap unk_core_material_popster=Unknown
% @importance 1.0

0.78::true_val(core_material_popster, popster); 0.22::true_val(core_material_popster, unk_core_material_popster).

measured(s1, core_material_popster, popster).

all_consistent(core_material_popster) :-
    (indep(s1), consistent(s1, core_material_popster) ; \+indep(s1)).

evidence(all_consistent(core_material_popster)).
query(true_val(core_material_popster, popster)).
query(true_val(core_material_popster, unk_core_material_popster)).

0.72::acc(s18, core_material_eco_booster).

% @attr core_material_eco_booster
% @type categorical
% @canonical false
% @original_name core_material
% @values popster_eco_booster=Popster_Eco_Booster_bamboo_carbon_rods unk_core_material_eco_booster=Unknown
% @importance 0.85

0.60::true_val(core_material_eco_booster, popster_eco_booster); 0.40::true_val(core_material_eco_booster, unk_core_material_eco_booster).

measured(s18, core_material_eco_booster, popster_eco_booster).

all_consistent(core_material_eco_booster) :-
    (indep(s18), consistent(s18, core_material_eco_booster) ; \+indep(s18)).

evidence(all_consistent(core_material_eco_booster)).
query(true_val(core_material_eco_booster, popster_eco_booster)).
query(true_val(core_material_eco_booster, unk_core_material_eco_booster)).

0.93::acc(s2, construction_material_innovation).
0.82::acc(s1, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values ghost_carbon_beam=Ghost_Carbon_Beam_two_carbon_beams_tip_tail unk_construction_material_innovation=Unknown
% @importance 1.0

0.95::true_val(construction_material_innovation, ghost_carbon_beam); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s2, construction_material_innovation, ghost_carbon_beam).
measured(s1, construction_material_innovation, ghost_carbon_beam).

all_consistent(construction_material_innovation) :-
    consistent(s2, construction_material_innovation),
    (indep(s1), consistent(s1, construction_material_innovation) ; \+indep(s1)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, ghost_carbon_beam)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.93::acc(s2, construction_material_innovation_gunslinger).
0.82::acc(s1, construction_material_innovation_gunslinger).

% @attr construction_material_innovation_gunslinger
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values gunslinger_sidewalls=Gunslinger_Sidewalls_carbon_inlays_full_length unk_construction_material_innovation_gunslinger=Unknown
% @importance 1.0

0.95::true_val(construction_material_innovation_gunslinger, gunslinger_sidewalls); 0.05::true_val(construction_material_innovation_gunslinger, unk_construction_material_innovation_gunslinger).

measured(s2, construction_material_innovation_gunslinger, gunslinger_sidewalls).
measured(s1, construction_material_innovation_gunslinger, gunslinger_sidewalls).

all_consistent(construction_material_innovation_gunslinger) :-
    consistent(s2, construction_material_innovation_gunslinger),
    (indep(s1), consistent(s1, construction_material_innovation_gunslinger) ; \+indep(s1)).

evidence(all_consistent(construction_material_innovation_gunslinger)).
query(true_val(construction_material_innovation_gunslinger, gunslinger_sidewalls)).
query(true_val(construction_material_innovation_gunslinger, unk_construction_material_innovation_gunslinger)).

0.93::acc(s9, pro_rider_name).
0.72::acc(s10, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values bode_merrill=Bode_Merrill unk_pro_rider_name=Unknown
% @importance 0.80

0.95::true_val(pro_rider_name, bode_merrill); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s9, pro_rider_name, bode_merrill).
measured(s10, pro_rider_name, bode_merrill).

all_consistent(pro_rider_name) :-
    consistent(s9, pro_rider_name),
    (indep(s10), consistent(s10, pro_rider_name) ; \+indep(s10)).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, bode_merrill)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.85::acc(s7, sidewall_material).
0.85::acc(s12, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs_2025=Recycled_ABS_2025_reduced_chatter unk_sidewall_material=Unknown
% @importance 0.925

0.95::true_val(sidewall_material, recycled_abs_2025); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s7, sidewall_material, recycled_abs_2025).
measured(s12, sidewall_material, recycled_abs_2025).

all_consistent(sidewall_material) :-
    consistent(s7, sidewall_material),
    consistent(s12, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs_2025)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.82::acc(s1, laminate).
0.72::acc(s18, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values ba_md_glass=BA_MD_Glass_Biaxial_Medium_Density_Fiberglass unk_laminate=Unknown
% @importance 0.925

0.93::true_val(laminate, ba_md_glass); 0.07::true_val(laminate, unk_laminate).

measured(s1, laminate, ba_md_glass).
measured(s18, laminate, ba_md_glass).

all_consistent(laminate) :-
    (indep(s1), consistent(s1, laminate) ; \+indep(s1)),
    (indep(s18), consistent(s18, laminate) ; \+indep(s18)).

evidence(all_consistent(laminate)).
query(true_val(laminate, ba_md_glass)).
query(true_val(laminate, unk_laminate)).

0.80::acc(s1, resin).
0.93::acc(s9, resin).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values greenpoxy_30pct=Greenpoxy_30pct_bio_epoxy greenpoxy_28pct=Greenpoxy_28pct_bio_epoxy
% @importance 0.95

0.60::true_val(resin, greenpoxy_30pct); 0.40::true_val(resin, greenpoxy_28pct).

measured(s9, resin, greenpoxy_30pct).
measured(s1, resin, greenpoxy_28pct).

all_consistent(resin) :-
    consistent(s9, resin),
    (indep(s1), consistent(s1, resin) ; \+indep(s1)).

evidence(all_consistent(resin)).
query(true_val(resin, greenpoxy_30pct)).
query(true_val(resin, greenpoxy_28pct)).

0.72::acc(s18, topsheet).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values abc_wrapper=ABC_Wrapper_bamboo_veneers_reduce_40pct unk_topsheet=Unknown
% @importance 0.85

0.60::true_val(topsheet, abc_wrapper); 0.40::true_val(topsheet, unk_topsheet).

measured(s18, topsheet, abc_wrapper).

all_consistent(topsheet) :-
    (indep(s18), consistent(s18, topsheet) ; \+indep(s18)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, abc_wrapper)).
query(true_val(topsheet, unk_topsheet)).

0.93::acc(s2, base_material).
0.82::acc(s1, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_eg=Sintered_EG_Electra_Gallium unk_base_material=Unknown
% @importance 1.0

0.95::true_val(base_material, sintered_eg); 0.05::true_val(base_material, unk_base_material).

measured(s2, base_material, sintered_eg).
measured(s1, base_material, sintered_eg).

all_consistent(base_material) :-
    consistent(s2, base_material),
    (indep(s1), consistent(s1, base_material) ; \+indep(s1)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_eg)).
query(true_val(base_material, unk_base_material)).

0.93::acc(s2, base_type).
0.82::acc(s1, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values fine_stone_finish=Fine_Stone_Finish_extra_glide unk_base_type=Unknown
% @importance 1.0

0.95::true_val(base_type, fine_stone_finish); 0.05::true_val(base_type, unk_base_type).

measured(s2, base_type, fine_stone_finish).
measured(s1, base_type, fine_stone_finish).

all_consistent(base_type) :-
    consistent(s2, base_type),
    (indep(s1), consistent(s1, base_type) ; \+indep(s1)).

evidence(all_consistent(base_type)).
query(true_val(base_type, fine_stone_finish)).
query(true_val(base_type, unk_base_type)).

0.82::acc(s1, factory_wax).
0.72::acc(s10, factory_wax).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values natural_wax=Natural_Wax_paraffin_free unk_factory_wax=Unknown
% @importance 0.85

0.93::true_val(factory_wax, natural_wax); 0.07::true_val(factory_wax, unk_factory_wax).

measured(s1, factory_wax, natural_wax).
measured(s10, factory_wax, natural_wax).

all_consistent(factory_wax) :-
    (indep(s1), consistent(s1, factory_wax) ; \+indep(s1)),
    (indep(s10), consistent(s10, factory_wax) ; \+indep(s10)).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, natural_wax)).
query(true_val(factory_wax, unk_factory_wax)).

0.82::acc(s1, available_colors).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values random_base=Base_colours_are_random unk_available_colors=Unknown
% @importance 1.0

0.78::true_val(available_colors, random_base); 0.22::true_val(available_colors, unk_available_colors).

measured(s1, available_colors, random_base).

all_consistent(available_colors) :-
    (indep(s1), consistent(s1, available_colors) ; \+indep(s1)).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, random_base)).
query(true_val(available_colors, unk_available_colors)).

0.88::acc(s7, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values great=Great unk_base_glide_performance=Unknown
% @importance 0.95

0.74::true_val(base_glide_performance, great); 0.26::true_val(base_glide_performance, unk_base_glide_performance).

measured(s7, base_glide_performance, great).

all_consistent(base_glide_performance) :- consistent(s7, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, great)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.82::acc(s1, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.78::true_val(mounting_pattern, inserts_2x4); 0.22::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.88::acc(s14, mounting_pattern_count).

% @attr mounting_pattern_count
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values six_by_two=6x2_inserts_per_foot unk_mounting_pattern_count=Unknown
% @importance 0.85

0.72::true_val(mounting_pattern_count, six_by_two); 0.28::true_val(mounting_pattern_count, unk_mounting_pattern_count).

measured(s14, mounting_pattern_count, six_by_two).

all_consistent(mounting_pattern_count) :- consistent(s14, mounting_pattern_count).

evidence(all_consistent(mounting_pattern_count)).
query(true_val(mounting_pattern_count, six_by_two)).
query(true_val(mounting_pattern_count, unk_mounting_pattern_count)).

0.85::acc(s1, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values seven_sizes=150_153_156_159_162_158W_163W unk_available_sizes=Unknown
% @importance 1.0

0.81::true_val(available_sizes, seven_sizes); 0.19::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, seven_sizes).

all_consistent(available_sizes) :-
    (indep(s1), consistent(s1, available_sizes) ; \+indep(s1)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, seven_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

0.85::acc(s1, waist_width_150).

% @attr waist_width_150
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 150cm
% @values v248=248.0 unk_waist_width_150=Unknown
% @importance 1.0

0.81::true_val(waist_width_150, v248); 0.19::true_val(waist_width_150, unk_waist_width_150).

measured(s1, waist_width_150, v248).

all_consistent(waist_width_150) :-
    (indep(s1), consistent(s1, waist_width_150) ; \+indep(s1)).

evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v248)).
query(true_val(waist_width_150, unk_waist_width_150)).

0.85::acc(s1, waist_width_153).

% @attr waist_width_153
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 153cm
% @values v251=251.0 unk_waist_width_153=Unknown
% @importance 1.0

0.81::true_val(waist_width_153, v251); 0.19::true_val(waist_width_153, unk_waist_width_153).

measured(s1, waist_width_153, v251).

all_consistent(waist_width_153) :-
    (indep(s1), consistent(s1, waist_width_153) ; \+indep(s1)).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v251)).
query(true_val(waist_width_153, unk_waist_width_153)).

0.85::acc(s1, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 156cm
% @values v253=253.0 unk_waist_width_156=Unknown
% @importance 1.0

0.81::true_val(waist_width_156, v253); 0.19::true_val(waist_width_156, unk_waist_width_156).

measured(s1, waist_width_156, v253).

all_consistent(waist_width_156) :-
    (indep(s1), consistent(s1, waist_width_156) ; \+indep(s1)).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v253)).
query(true_val(waist_width_156, unk_waist_width_156)).

0.85::acc(s1, waist_width_159).

% @attr waist_width_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 159cm
% @values v255=255.0 unk_waist_width_159=Unknown
% @importance 1.0

0.81::true_val(waist_width_159, v255); 0.19::true_val(waist_width_159, unk_waist_width_159).

measured(s1, waist_width_159, v255).

all_consistent(waist_width_159) :-
    (indep(s1), consistent(s1, waist_width_159) ; \+indep(s1)).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v255)).
query(true_val(waist_width_159, unk_waist_width_159)).

0.85::acc(s1, waist_width_162).

% @attr waist_width_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 162cm
% @values v260=260.0 unk_waist_width_162=Unknown
% @importance 1.0

0.81::true_val(waist_width_162, v260); 0.19::true_val(waist_width_162, unk_waist_width_162).

measured(s1, waist_width_162, v260).

all_consistent(waist_width_162) :-
    (indep(s1), consistent(s1, waist_width_162) ; \+indep(s1)).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v260)).
query(true_val(waist_width_162, unk_waist_width_162)).

0.85::acc(s1, waist_width_158w).

% @attr waist_width_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 158cm Wide
% @values v263=263.0 unk_waist_width_158w=Unknown
% @importance 1.0

0.81::true_val(waist_width_158w, v263); 0.19::true_val(waist_width_158w, unk_waist_width_158w).

measured(s1, waist_width_158w, v263).

all_consistent(waist_width_158w) :-
    (indep(s1), consistent(s1, waist_width_158w) ; \+indep(s1)).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v263)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

0.85::acc(s1, waist_width_163w).

% @attr waist_width_163w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 163cm Wide
% @values v266=266.0 unk_waist_width_163w=Unknown
% @importance 1.0

0.81::true_val(waist_width_163w, v266); 0.19::true_val(waist_width_163w, unk_waist_width_163w).

measured(s1, waist_width_163w, v266).

all_consistent(waist_width_163w) :-
    (indep(s1), consistent(s1, waist_width_163w) ; \+indep(s1)).

evidence(all_consistent(waist_width_163w)).
query(true_val(waist_width_163w, v266)).
query(true_val(waist_width_163w, unk_waist_width_163w)).

0.85::acc(s1, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v298=298.0 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.81::true_val(tip_tail_width_size, v298); 0.19::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v298).

all_consistent(tip_tail_width_size) :-
    (indep(s1), consistent(s1, tip_tail_width_size) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v298)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.85::acc(s1, tip_tail_width_size_150).

% @attr tip_tail_width_size_150
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v291=291.0 unk_tip_tail_width_size_150=Unknown
% @importance 1.0

0.81::true_val(tip_tail_width_size_150, v291); 0.19::true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150).

measured(s1, tip_tail_width_size_150, v291).

all_consistent(tip_tail_width_size_150) :-
    (indep(s1), consistent(s1, tip_tail_width_size_150) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_150)).
query(true_val(tip_tail_width_size_150, v291)).
query(true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150)).

0.85::acc(s1, tip_tail_width_size_153).

% @attr tip_tail_width_size_153
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v295=295.0 unk_tip_tail_width_size_153=Unknown
% @importance 1.0

0.81::true_val(tip_tail_width_size_153, v295); 0.19::true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153).

measured(s1, tip_tail_width_size_153, v295).

all_consistent(tip_tail_width_size_153) :-
    (indep(s1), consistent(s1, tip_tail_width_size_153) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v295)).
query(true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153)).

0.85::acc(s1, tip_tail_width_size_159).

% @attr tip_tail_width_size_159
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v301=301.0 unk_tip_tail_width_size_159=Unknown
% @importance 1.0

0.81::true_val(tip_tail_width_size_159, v301); 0.19::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s1, tip_tail_width_size_159, v301).

all_consistent(tip_tail_width_size_159) :-
    (indep(s1), consistent(s1, tip_tail_width_size_159) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v301)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

0.85::acc(s1, tip_tail_width_size_162).

% @attr tip_tail_width_size_162
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v305=305.0 unk_tip_tail_width_size_162=Unknown
% @importance 1.0

0.81::true_val(tip_tail_width_size_162, v305); 0.19::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).

measured(s1, tip_tail_width_size_162, v305).

all_consistent(tip_tail_width_size_162) :-
    (indep(s1), consistent(s1, tip_tail_width_size_162) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v305)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

0.85::acc(s1, tip_tail_width_size_158w).

% @attr tip_tail_width_size_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v309=309.0 unk_tip_tail_width_size_158w=Unknown
% @importance 1.0

0.81::true_val(tip_tail_width_size_158w, v309); 0.19::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).

measured(s1, tip_tail_width_size_158w, v309).

all_consistent(tip_tail_width_size_158w) :-
    (indep(s1), consistent(s1, tip_tail_width_size_158w) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v309)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

0.85::acc(s1, tip_tail_width_size_163w).

% @attr tip_tail_width_size_163w
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v313=313.0 unk_tip_tail_width_size_163w=Unknown
% @importance 1.0

0.81::true_val(tip_tail_width_size_163w, v313); 0.19::true_val(tip_tail_width_size_163w, unk_tip_tail_width_size_163w).

measured(s1, tip_tail_width_size_163w, v313).

all_consistent(tip_tail_width_size_163w) :-
    (indep(s1), consistent(s1, tip_tail_width_size_163w) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_163w)).
query(true_val(tip_tail_width_size_163w, v313)).
query(true_val(tip_tail_width_size_163w, unk_tip_tail_width_size_163w)).

0.85::acc(s1, effective_edge_150).

% @attr effective_edge_150
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 150cm
% @values v1130=1130.0 unk_effective_edge_150=Unknown
% @importance 1.0

0.81::true_val(effective_edge_150, v1130); 0.19::true_val(effective_edge_150, unk_effective_edge_150).

measured(s1, effective_edge_150, v1130).

all_consistent(effective_edge_150) :-
    (indep(s1), consistent(s1, effective_edge_150) ; \+indep(s1)).

evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v1130)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

0.85::acc(s1, effective_edge_153).

% @attr effective_edge_153
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 153cm
% @values v1155=1155.0 unk_effective_edge_153=Unknown
% @importance 1.0

0.81::true_val(effective_edge_153, v1155); 0.19::true_val(effective_edge_153, unk_effective_edge_153).

measured(s1, effective_edge_153, v1155).

all_consistent(effective_edge_153) :-
    (indep(s1), consistent(s1, effective_edge_153) ; \+indep(s1)).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v1155)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

0.85::acc(s1, effective_edge_156).

% @attr effective_edge_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 156cm
% @values v1180=1180.0 unk_effective_edge_156=Unknown
% @importance 1.0

0.81::true_val(effective_edge_156, v1180); 0.19::true_val(effective_edge_156, unk_effective_edge_156).

measured(s1, effective_edge_156, v1180).

all_consistent(effective_edge_156) :-
    (indep(s1), consistent(s1, effective_edge_156) ; \+indep(s1)).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1180)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

0.85::acc(s1, effective_edge_159).

% @attr effective_edge_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 159cm
% @values v1205=1205.0 unk_effective_edge_159=Unknown
% @importance 1.0

0.81::true_val(effective_edge_159, v1205); 0.19::true_val(effective_edge_159, unk_effective_edge_159).

measured(s1, effective_edge_159, v1205).

all_consistent(effective_edge_159) :-
    (indep(s1), consistent(s1, effective_edge_159) ; \+indep(s1)).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1205)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

0.85::acc(s1, effective_edge_162).

% @attr effective_edge_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 162cm
% @values v1230=1230.0 unk_effective_edge_162=Unknown
% @importance 1.0

0.81::true_val(effective_edge_162, v1230); 0.19::true_val(effective_edge_162, unk_effective_edge_162).

measured(s1, effective_edge_162, v1230).

all_consistent(effective_edge_162) :-
    (indep(s1), consistent(s1, effective_edge_162) ; \+indep(s1)).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1230)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

0.85::acc(s1, effective_edge_158w).

% @attr effective_edge_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 158cm Wide
% @values v1195=1195.0 unk_effective_edge_158w=Unknown
% @importance 1.0

0.81::true_val(effective_edge_158w, v1195); 0.19::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(s1, effective_edge_158w, v1195).

all_consistent(effective_edge_158w) :-
    (indep(s1), consistent(s1, effective_edge_158w) ; \+indep(s1)).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v1195)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

0.85::acc(s1, effective_edge_163w).

% @attr effective_edge_163w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 163cm Wide
% @values v1240=1240.0 unk_effective_edge_163w=Unknown
% @importance 1.0

0.81::true_val(effective_edge_163w, v1240); 0.19::true_val(effective_edge_163w, unk_effective_edge_163w).

measured(s1, effective_edge_163w, v1240).

all_consistent(effective_edge_163w) :-
    (indep(s1), consistent(s1, effective_edge_163w) ; \+indep(s1)).

evidence(all_consistent(effective_edge_163w)).
query(true_val(effective_edge_163w, v1240)).
query(true_val(effective_edge_163w, unk_effective_edge_163w)).

0.85::acc(s1, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w55_85kg=55-85kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.81::true_val(recommended_weight_range_size, w55_85kg); 0.19::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, w55_85kg).

all_consistent(recommended_weight_range_size) :-
    (indep(s1), consistent(s1, recommended_weight_range_size) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w55_85kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.85::acc(s1, recommended_weight_range_size_150).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w50_70kg=50-70kg unk_recommended_weight_range_size_150=Unknown
% @importance 1.0

0.81::true_val(recommended_weight_range_size_150, w50_70kg); 0.19::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).

measured(s1, recommended_weight_range_size_150, w50_70kg).

all_consistent(recommended_weight_range_size_150) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_150) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, w50_70kg)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

0.85::acc(s1, recommended_weight_range_size_153).

% @attr recommended_weight_range_size_153
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w55_75kg=55-75kg unk_recommended_weight_range_size_153=Unknown
% @importance 1.0

0.81::true_val(recommended_weight_range_size_153, w55_75kg); 0.19::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).

measured(s1, recommended_weight_range_size_153, w55_75kg).

all_consistent(recommended_weight_range_size_153) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_153) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w55_75kg)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

0.85::acc(s1, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w65_90kg=65-90kg unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.81::true_val(recommended_weight_range_size_159, w65_90kg); 0.19::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s1, recommended_weight_range_size_159, w65_90kg).

all_consistent(recommended_weight_range_size_159) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_159) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w65_90kg)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

0.85::acc(s1, recommended_weight_range_size_162).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w70_105kg=70-105kg unk_recommended_weight_range_size_162=Unknown
% @importance 1.0

0.81::true_val(recommended_weight_range_size_162, w70_105kg); 0.19::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).

measured(s1, recommended_weight_range_size_162, w70_105kg).

all_consistent(recommended_weight_range_size_162) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_162) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w70_105kg)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

0.85::acc(s1, recommended_weight_range_size_158w).

% @attr recommended_weight_range_size_158w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w65_95kg=65-95kg unk_recommended_weight_range_size_158w=Unknown
% @importance 1.0

0.81::true_val(recommended_weight_range_size_158w, w65_95kg); 0.19::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s1, recommended_weight_range_size_158w, w65_95kg).

all_consistent(recommended_weight_range_size_158w) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_158w) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, w65_95kg)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

0.85::acc(s1, recommended_weight_range_size_163w).

% @attr recommended_weight_range_size_163w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w70_105kg=70-105kg unk_recommended_weight_range_size_163w=Unknown
% @importance 1.0

0.81::true_val(recommended_weight_range_size_163w, w70_105kg); 0.19::true_val(recommended_weight_range_size_163w, unk_recommended_weight_range_size_163w).

measured(s1, recommended_weight_range_size_163w, w70_105kg).

all_consistent(recommended_weight_range_size_163w) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_163w) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_163w)).
query(true_val(recommended_weight_range_size_163w, w70_105kg)).
query(true_val(recommended_weight_range_size_163w, unk_recommended_weight_range_size_163w)).

0.93::acc(s2, rider_level).
0.58::acc(s4, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_expert=Advanced_to_Expert unk_rider_level=Unknown
% @importance 0.925

0.95::true_val(rider_level, advanced_expert); 0.05::true_val(rider_level, unk_rider_level).

measured(s2, rider_level, advanced_expert).
measured(s4, rider_level, advanced_expert).

all_consistent(rider_level) :-
    consistent(s2, rider_level),
    (indep(s4), consistent(s4, rider_level) ; \+indep(s4)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

0.82::acc(s1, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freestyle=All_Mountain_Freestyle unk_board_category=Unknown
% @importance 1.0

0.78::true_val(board_category, all_mountain_freestyle); 0.22::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain_freestyle).

all_consistent(board_category) :-
    (indep(s1), consistent(s1, board_category) ; \+indep(s1)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freestyle)).
query(true_val(board_category, unk_board_category)).

0.82::acc(s1, terrain_suitability).
0.93::acc(s2, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_to_powder=Park_to_Powder all_mtn_freestyle=All_Mountain_Freestyle
% @importance 1.0

0.45::true_val(terrain_suitability, park_to_powder); 0.55::true_val(terrain_suitability, all_mtn_freestyle).

measured(s1, terrain_suitability, park_to_powder).
measured(s2, terrain_suitability, all_mtn_freestyle).

all_consistent(terrain_suitability) :-
    consistent(s2, terrain_suitability),
    (indep(s1), consistent(s1, terrain_suitability) ; \+indep(s1)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_to_powder)).
query(true_val(terrain_suitability, all_mtn_freestyle)).

0.60::acc(s20, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert_versatile=Advanced_expert_demanding_versatility_power_precision unk_skill_level_recommendation=Unknown
% @importance 0.7

0.57::true_val(skill_level_recommendation, advanced_expert_versatile); 0.43::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s20, skill_level_recommendation, advanced_expert_versatile).

all_consistent(skill_level_recommendation) :-
    (indep(s20), consistent(s20, skill_level_recommendation) ; \+indep(s20)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert_versatile)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.85::acc(s7, ideal_boot_size_150).

% @attr ideal_boot_size_150
% @type categorical
% @canonical false
% @original_name Ideal boot size 150cm (reviewer recommendation)
% @values us7_5_8_5=US_7_5_to_8_5 unk_ideal_boot_size_150=Unknown
% @importance 0.95

0.74::true_val(ideal_boot_size_150, us7_5_8_5); 0.26::true_val(ideal_boot_size_150, unk_ideal_boot_size_150).

measured(s7, ideal_boot_size_150, us7_5_8_5).

all_consistent(ideal_boot_size_150) :- consistent(s7, ideal_boot_size_150).

evidence(all_consistent(ideal_boot_size_150)).
query(true_val(ideal_boot_size_150, us7_5_8_5)).
query(true_val(ideal_boot_size_150, unk_ideal_boot_size_150)).

0.85::acc(s7, ideal_boot_size_153).

% @attr ideal_boot_size_153
% @type categorical
% @canonical false
% @original_name Ideal boot size 153cm (reviewer recommendation)
% @values us8_9=US_8_to_9 unk_ideal_boot_size_153=Unknown
% @importance 0.95

0.74::true_val(ideal_boot_size_153, us8_9); 0.26::true_val(ideal_boot_size_153, unk_ideal_boot_size_153).

measured(s7, ideal_boot_size_153, us8_9).

all_consistent(ideal_boot_size_153) :- consistent(s7, ideal_boot_size_153).

evidence(all_consistent(ideal_boot_size_153)).
query(true_val(ideal_boot_size_153, us8_9)).
query(true_val(ideal_boot_size_153, unk_ideal_boot_size_153)).

0.85::acc(s7, ideal_boot_size_156).

% @attr ideal_boot_size_156
% @type categorical
% @canonical false
% @original_name Ideal boot size 156cm (reviewer recommendation)
% @values us8_5_9_5=US_8_5_to_9_5 unk_ideal_boot_size_156=Unknown
% @importance 0.95

0.74::true_val(ideal_boot_size_156, us8_5_9_5); 0.26::true_val(ideal_boot_size_156, unk_ideal_boot_size_156).

measured(s7, ideal_boot_size_156, us8_5_9_5).

all_consistent(ideal_boot_size_156) :- consistent(s7, ideal_boot_size_156).

evidence(all_consistent(ideal_boot_size_156)).
query(true_val(ideal_boot_size_156, us8_5_9_5)).
query(true_val(ideal_boot_size_156, unk_ideal_boot_size_156)).

0.85::acc(s7, ideal_boot_size_159).

% @attr ideal_boot_size_159
% @type categorical
% @canonical false
% @original_name Ideal boot size 159cm (reviewer recommendation)
% @values us9_10=US_9_to_10 unk_ideal_boot_size_159=Unknown
% @importance 0.95

0.74::true_val(ideal_boot_size_159, us9_10); 0.26::true_val(ideal_boot_size_159, unk_ideal_boot_size_159).

measured(s7, ideal_boot_size_159, us9_10).

all_consistent(ideal_boot_size_159) :- consistent(s7, ideal_boot_size_159).

evidence(all_consistent(ideal_boot_size_159)).
query(true_val(ideal_boot_size_159, us9_10)).
query(true_val(ideal_boot_size_159, unk_ideal_boot_size_159)).

0.85::acc(s7, ideal_boot_size_162).

% @attr ideal_boot_size_162
% @type categorical
% @canonical false
% @original_name Ideal boot size 162cm (reviewer recommendation)
% @values us9_5_10_5=US_9_5_to_10_5 unk_ideal_boot_size_162=Unknown
% @importance 0.95

0.74::true_val(ideal_boot_size_162, us9_5_10_5); 0.26::true_val(ideal_boot_size_162, unk_ideal_boot_size_162).

measured(s7, ideal_boot_size_162, us9_5_10_5).

all_consistent(ideal_boot_size_162) :- consistent(s7, ideal_boot_size_162).

evidence(all_consistent(ideal_boot_size_162)).
query(true_val(ideal_boot_size_162, us9_5_10_5)).
query(true_val(ideal_boot_size_162, unk_ideal_boot_size_162)).

0.85::acc(s7, ideal_boot_size_163w).

% @attr ideal_boot_size_163w
% @type categorical
% @canonical false
% @original_name Ideal boot size 163W (reviewer recommendation)
% @values us11_12=US_11_to_12 unk_ideal_boot_size_163w=Unknown
% @importance 0.95

0.74::true_val(ideal_boot_size_163w, us11_12); 0.26::true_val(ideal_boot_size_163w, unk_ideal_boot_size_163w).

measured(s7, ideal_boot_size_163w, us11_12).

all_consistent(ideal_boot_size_163w) :- consistent(s7, ideal_boot_size_163w).

evidence(all_consistent(ideal_boot_size_163w)).
query(true_val(ideal_boot_size_163w, us11_12)).
query(true_val(ideal_boot_size_163w, unk_ideal_boot_size_163w)).

0.70::acc(s21, price_usd_msrp).
0.72::acc(s22, price_usd_msrp).
0.80::acc(s7, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v649_95=649.95 v629=629.0
% @importance 0.9

0.65::true_val(price_usd_msrp, v649_95); 0.35::true_val(price_usd_msrp, v629).

measured(s21, price_usd_msrp, v649_95).
measured(s22, price_usd_msrp, v649_95).
measured(s7, price_usd_msrp, v629).

all_consistent(price_usd_msrp) :-
    (indep(s21), consistent(s21, price_usd_msrp) ; \+indep(s21)),
    (indep(s22), consistent(s22, price_usd_msrp) ; \+indep(s22)),
    consistent(s7, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v649_95)).
query(true_val(price_usd_msrp, v629)).

0.85::acc(s1, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v692_99=692.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.81::true_val(price_aud_merchant, v692_99); 0.19::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s1, price_aud_merchant, v692_99).

all_consistent(price_aud_merchant) :-
    (indep(s1), consistent(s1, price_aud_merchant) ; \+indep(s1)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v692_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.85::acc(s1, price_aud_merchant_rrp).

% @attr price_aud_merchant_rrp
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v989_99=989.99 unk_price_aud_merchant_rrp=Unknown
% @importance 1.0

0.81::true_val(price_aud_merchant_rrp, v989_99); 0.19::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s1, price_aud_merchant_rrp, v989_99).

all_consistent(price_aud_merchant_rrp) :-
    (indep(s1), consistent(s1, price_aud_merchant_rrp) ; \+indep(s1)).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v989_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

0.85::acc(s1, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values sold_out=Sold_out unk_availability_status=Unknown
% @importance 1.0

0.81::true_val(availability_status, sold_out); 0.19::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, sold_out).

all_consistent(availability_status) :-
    (indep(s1), consistent(s1, availability_status) ; \+indep(s1)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, sold_out)).
query(true_val(availability_status, unk_availability_status)).

0.88::acc(s7, price_usd_sun_ski).

% @attr price_usd_sun_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Sun & Ski Sports (sale)
% @values v559_93=559.93 unk_price_usd_sun_ski=Unknown
% @importance 0.95

0.74::true_val(price_usd_sun_ski, v559_93); 0.26::true_val(price_usd_sun_ski, unk_price_usd_sun_ski).

measured(s7, price_usd_sun_ski, v559_93).

all_consistent(price_usd_sun_ski) :- consistent(s7, price_usd_sun_ski).

evidence(all_consistent(price_usd_sun_ski)).
query(true_val(price_usd_sun_ski, v559_93)).
query(true_val(price_usd_sun_ski, unk_price_usd_sun_ski)).

0.88::acc(s7, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v559_96=559.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.74::true_val(price_usd_evo, v559_96); 0.26::true_val(price_usd_evo, unk_price_usd_evo).

measured(s7, price_usd_evo, v559_96).

all_consistent(price_usd_evo) :- consistent(s7, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v559_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.88::acc(s7, price_usd_christy).

% @attr price_usd_christy
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Christy Sports (sale)
% @values v559_96=559.96 unk_price_usd_christy=Unknown
% @importance 0.95

0.74::true_val(price_usd_christy, v559_96); 0.26::true_val(price_usd_christy, unk_price_usd_christy).

measured(s7, price_usd_christy, v559_96).

all_consistent(price_usd_christy) :- consistent(s7, price_usd_christy).

evidence(all_consistent(price_usd_christy)).
query(true_val(price_usd_christy, v559_96)).
query(true_val(price_usd_christy, unk_price_usd_christy)).

0.88::acc(s7, price_usd_gravity_coalition).

% @attr price_usd_gravity_coalition
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Gravity Coalition (sale)
% @values v489_97=489.97 unk_price_usd_gravity_coalition=Unknown
% @importance 0.95

0.74::true_val(price_usd_gravity_coalition, v489_97); 0.26::true_val(price_usd_gravity_coalition, unk_price_usd_gravity_coalition).

measured(s7, price_usd_gravity_coalition, v489_97).

all_consistent(price_usd_gravity_coalition) :- consistent(s7, price_usd_gravity_coalition).

evidence(all_consistent(price_usd_gravity_coalition)).
query(true_val(price_usd_gravity_coalition, v489_97)).
query(true_val(price_usd_gravity_coalition, unk_price_usd_gravity_coalition)).

0.88::acc(s7, price_eur_blue_tomato).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v569=569.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.95

0.74::true_val(price_eur_blue_tomato, v569); 0.26::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s7, price_eur_blue_tomato, v569).

all_consistent(price_eur_blue_tomato) :- consistent(s7, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v569)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

0.72::acc(s22, price_usd_snowboards_com).

% @attr price_usd_snowboards_com
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at snowboards.com (sale)
% @values v519_96=519.96 unk_price_usd_snowboards_com=Unknown
% @importance 0.9

0.68::true_val(price_usd_snowboards_com, v519_96); 0.32::true_val(price_usd_snowboards_com, unk_price_usd_snowboards_com).

measured(s22, price_usd_snowboards_com, v519_96).

all_consistent(price_usd_snowboards_com) :-
    (indep(s22), consistent(s22, price_usd_snowboards_com) ; \+indep(s22)).

evidence(all_consistent(price_usd_snowboards_com)).
query(true_val(price_usd_snowboards_com, v519_96)).
query(true_val(price_usd_snowboards_com, unk_price_usd_snowboards_com)).

0.65::acc(s21, price_usd_cbs).

% @attr price_usd_cbs
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at CBS Boardshop (sale)
% @values v519_95=519.95 unk_price_usd_cbs=Unknown
% @importance 0.9

0.62::true_val(price_usd_cbs, v519_95); 0.38::true_val(price_usd_cbs, unk_price_usd_cbs).

measured(s21, price_usd_cbs, v519_95).

all_consistent(price_usd_cbs) :-
    (indep(s21), consistent(s21, price_usd_cbs) ; \+indep(s21)).

evidence(all_consistent(price_usd_cbs)).
query(true_val(price_usd_cbs, v519_95)).
query(true_val(price_usd_cbs, unk_price_usd_cbs)).

0.60::acc(s23, price_usd_ski_barn).

% @attr price_usd_ski_barn
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Ski Barn Durango (sale)
% @values v440_97=440.97 unk_price_usd_ski_barn=Unknown
% @importance 0.85

0.54::true_val(price_usd_ski_barn, v440_97); 0.46::true_val(price_usd_ski_barn, unk_price_usd_ski_barn).

measured(s23, price_usd_ski_barn, v440_97).

all_consistent(price_usd_ski_barn) :-
    (indep(s23), consistent(s23, price_usd_ski_barn) ; \+indep(s23)).

evidence(all_consistent(price_usd_ski_barn)).
query(true_val(price_usd_ski_barn, v440_97)).
query(true_val(price_usd_ski_barn, unk_price_usd_ski_barn)).

0.55::acc(s24, price_usd_pto_ski).

% @attr price_usd_pto_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at PTO Ski
% @values v649=649.0 unk_price_usd_pto_ski=Unknown
% @importance 0.75

0.50::true_val(price_usd_pto_ski, v649); 0.50::true_val(price_usd_pto_ski, unk_price_usd_pto_ski).

measured(s24, price_usd_pto_ski, v649).

all_consistent(price_usd_pto_ski) :-
    (indep(s24), consistent(s24, price_usd_pto_ski) ; \+indep(s24)).

evidence(all_consistent(price_usd_pto_ski)).
query(true_val(price_usd_pto_ski, v649)).
query(true_val(price_usd_pto_ski, unk_price_usd_pto_ski)).

0.60::acc(s25, price_usd_ski_pro_az).

% @attr price_usd_ski_pro_az
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Ski Pro AZ (sale)
% @values v519_95=519.95 unk_price_usd_ski_pro_az=Unknown
% @importance 0.8

0.54::true_val(price_usd_ski_pro_az, v519_95); 0.46::true_val(price_usd_ski_pro_az, unk_price_usd_ski_pro_az).

measured(s25, price_usd_ski_pro_az, v519_95).

all_consistent(price_usd_ski_pro_az) :-
    (indep(s25), consistent(s25, price_usd_ski_pro_az) ; \+indep(s25)).

evidence(all_consistent(price_usd_ski_pro_az)).
query(true_val(price_usd_ski_pro_az, v519_95)).
query(true_val(price_usd_ski_pro_az, unk_price_usd_ski_pro_az)).

0.60::acc(s26, price_usd_ski_haus).

% @attr price_usd_ski_haus
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Ski Haus (sale)
% @values v519_96=519.96 unk_price_usd_ski_haus=Unknown
% @importance 0.8

0.57::true_val(price_usd_ski_haus, v519_96); 0.43::true_val(price_usd_ski_haus, unk_price_usd_ski_haus).

measured(s26, price_usd_ski_haus, v519_96).

all_consistent(price_usd_ski_haus) :-
    (indep(s26), consistent(s26, price_usd_ski_haus) ; \+indep(s26)).

evidence(all_consistent(price_usd_ski_haus)).
query(true_val(price_usd_ski_haus, v519_96)).
query(true_val(price_usd_ski_haus, unk_price_usd_ski_haus)).

0.82::acc(s1, pro_rider_name_team).

% @attr pro_rider_name_team
% @type categorical
% @canonical false
% @original_name pro_rider_name
% @values multiple_pro_am=Multiple_Salomon_pro_and_am_riders unk_pro_rider_name_team=Unknown
% @importance 1.0

0.78::true_val(pro_rider_name_team, multiple_pro_am); 0.22::true_val(pro_rider_name_team, unk_pro_rider_name_team).

measured(s1, pro_rider_name_team, multiple_pro_am).

all_consistent(pro_rider_name_team) :-
    (indep(s1), consistent(s1, pro_rider_name_team) ; \+indep(s1)).

evidence(all_consistent(pro_rider_name_team)).
query(true_val(pro_rider_name_team, multiple_pro_am)).
query(true_val(pro_rider_name_team, unk_pro_rider_name_team)).

0.50::acc(s27, pro_rider_name_natural_selections).

% @attr pro_rider_name_natural_selections
% @type categorical
% @canonical false
% @original_name pro_rider_name
% @values nils_mindnich_natural_selections=Used_at_last_two_Natural_Selections_including_switch unk_pro_rider_name_natural_selections=Unknown
% @importance 0.7

0.32::true_val(pro_rider_name_natural_selections, nils_mindnich_natural_selections); 0.68::true_val(pro_rider_name_natural_selections, unk_pro_rider_name_natural_selections).

measured(s27, pro_rider_name_natural_selections, nils_mindnich_natural_selections).

all_consistent(pro_rider_name_natural_selections) :- consistent(s27, pro_rider_name_natural_selections).

evidence(all_consistent(pro_rider_name_natural_selections)).
query(true_val(pro_rider_name_natural_selections, nils_mindnich_natural_selections)).
query(true_val(pro_rider_name_natural_selections, unk_pro_rider_name_natural_selections)).

0.88::acc(s7, powder_rating_tgr).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values average=Average unk_powder_rating_tgr=Unknown
% @importance 0.95

0.74::true_val(powder_rating_tgr, average); 0.26::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s7, powder_rating_tgr, average).

all_consistent(powder_rating_tgr) :- consistent(s7, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, average)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.88::acc(s7, carving_rating_tgr).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.95

0.74::true_val(carving_rating_tgr, great); 0.26::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s7, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :- consistent(s7, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

0.88::acc(s7, speed_rating_tgr).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.95

0.74::true_val(speed_rating_tgr, good); 0.26::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s7, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :- consistent(s7, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

0.88::acc(s7, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values average=Average unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.74::true_val(reviewer_opinion_the_good_ride, average); 0.26::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s7, reviewer_opinion_the_good_ride, average).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s7, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, average)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.88::acc(s7, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values great=Great unk_switch_riding=Unknown
% @importance 0.95

0.74::true_val(switch_riding, great); 0.26::true_val(switch_riding, unk_switch_riding).

measured(s7, switch_riding, great).

all_consistent(switch_riding) :- consistent(s7, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, great)).
query(true_val(switch_riding, unk_switch_riding)).

0.88::acc(s7, jumps_rating_tgr).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.74::true_val(jumps_rating_tgr, great); 0.26::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s7, jumps_rating_tgr, great).

all_consistent(jumps_rating_tgr) :- consistent(s7, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

0.88::acc(s7, jibbing_rating_tgr).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.74::true_val(jibbing_rating_tgr, average); 0.26::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s7, jibbing_rating_tgr, average).

all_consistent(jibbing_rating_tgr) :- consistent(s7, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

0.88::acc(s7, pipe_rating_tgr).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values great=Great unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.74::true_val(pipe_rating_tgr, great); 0.26::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

measured(s7, pipe_rating_tgr, great).

all_consistent(pipe_rating_tgr) :- consistent(s7, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, great)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

0.88::acc(s7, on_snow_feel_tgr).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.74::true_val(on_snow_feel_tgr, stable); 0.26::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s7, on_snow_feel_tgr, stable).

all_consistent(on_snow_feel_tgr) :- consistent(s7, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

0.88::acc(s7, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.74::true_val(turn_initiation_performance, medium_fast); 0.26::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s7, turn_initiation_performance, medium_fast).

all_consistent(turn_initiation_performance) :- consistent(s7, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.88::acc(s7, reviewer_opinion_the_good_ride_flex).

% @attr reviewer_opinion_the_good_ride_flex
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values moderate=Moderate unk_reviewer_opinion_the_good_ride_flex=Unknown
% @importance 0.95

0.74::true_val(reviewer_opinion_the_good_ride_flex, moderate); 0.26::true_val(reviewer_opinion_the_good_ride_flex, unk_reviewer_opinion_the_good_ride_flex).

measured(s7, reviewer_opinion_the_good_ride_flex, moderate).

all_consistent(reviewer_opinion_the_good_ride_flex) :- consistent(s7, reviewer_opinion_the_good_ride_flex).

evidence(all_consistent(reviewer_opinion_the_good_ride_flex)).
query(true_val(reviewer_opinion_the_good_ride_flex, moderate)).
query(true_val(reviewer_opinion_the_good_ride_flex, unk_reviewer_opinion_the_good_ride_flex)).

0.88::acc(s7, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow=Hard_Snow unk_edge_hold=Unknown
% @importance 0.95

0.74::true_val(edge_hold, hard_snow); 0.26::true_val(edge_hold, unk_edge_hold).

measured(s7, edge_hold, hard_snow).

all_consistent(edge_hold) :- consistent(s7, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow)).
query(true_val(edge_hold, unk_edge_hold)).

0.88::acc(s7, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values exceptional_pop=Exceptional_pop unk_positive_aspect=Unknown
% @importance 0.95

0.74::true_val(positive_aspect, exceptional_pop); 0.26::true_val(positive_aspect, unk_positive_aspect).

measured(s7, positive_aspect, exceptional_pop).

all_consistent(positive_aspect) :- consistent(s7, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, exceptional_pop)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.88::acc(s7, positive_aspect_fast_base).

% @attr positive_aspect_fast_base
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values fast_base=Fast_base unk_positive_aspect_fast_base=Unknown
% @importance 0.95

0.74::true_val(positive_aspect_fast_base, fast_base); 0.26::true_val(positive_aspect_fast_base, unk_positive_aspect_fast_base).

measured(s7, positive_aspect_fast_base, fast_base).

all_consistent(positive_aspect_fast_base) :- consistent(s7, positive_aspect_fast_base).

evidence(all_consistent(positive_aspect_fast_base)).
query(true_val(positive_aspect_fast_base, fast_base)).
query(true_val(positive_aspect_fast_base, unk_positive_aspect_fast_base)).

0.88::acc(s7, positive_aspect_grip).

% @attr positive_aspect_grip
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values competent_grip=Competent_grip_in_good_snow unk_positive_aspect_grip=Unknown
% @importance 0.95

0.74::true_val(positive_aspect_grip, competent_grip); 0.26::true_val(positive_aspect_grip, unk_positive_aspect_grip).

measured(s7, positive_aspect_grip, competent_grip).

all_consistent(positive_aspect_grip) :- consistent(s7, positive_aspect_grip).

evidence(all_consistent(positive_aspect_grip)).
query(true_val(positive_aspect_grip, competent_grip)).
query(true_val(positive_aspect_grip, unk_positive_aspect_grip)).

0.88::acc(s7, positive_aspect_abs_redesign).
0.85::acc(s12, positive_aspect_abs_redesign).

% @attr positive_aspect_abs_redesign
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values abs_less_chatter=2025_recycled_ABS_sidewalls_much_less_chatter unk_positive_aspect_abs_redesign=Unknown
% @importance 0.925

0.95::true_val(positive_aspect_abs_redesign, abs_less_chatter); 0.05::true_val(positive_aspect_abs_redesign, unk_positive_aspect_abs_redesign).

measured(s7, positive_aspect_abs_redesign, abs_less_chatter).
measured(s12, positive_aspect_abs_redesign, abs_less_chatter).

all_consistent(positive_aspect_abs_redesign) :-
    consistent(s7, positive_aspect_abs_redesign),
    consistent(s12, positive_aspect_abs_redesign).

evidence(all_consistent(positive_aspect_abs_redesign)).
query(true_val(positive_aspect_abs_redesign, abs_less_chatter)).
query(true_val(positive_aspect_abs_redesign, unk_positive_aspect_abs_redesign)).

0.68::acc(s28, positive_aspect_carving).

% @attr positive_aspect_carving
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values fun_springy_carving=Fun_springy_carving_springs_out_of_turns unk_positive_aspect_carving=Unknown
% @importance 0.65

0.49::true_val(positive_aspect_carving, fun_springy_carving); 0.51::true_val(positive_aspect_carving, unk_positive_aspect_carving).

measured(s28, positive_aspect_carving, fun_springy_carving).

all_consistent(positive_aspect_carving) :- consistent(s28, positive_aspect_carving).

evidence(all_consistent(positive_aspect_carving)).
query(true_val(positive_aspect_carving, fun_springy_carving)).
query(true_val(positive_aspect_carving, unk_positive_aspect_carving)).

0.70::acc(s11, positive_aspect_light).

% @attr positive_aspect_light
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values light_feel=Light_feel_one_of_lightest_boards unk_positive_aspect_light=Unknown
% @importance 0.7

0.55::true_val(positive_aspect_light, light_feel); 0.45::true_val(positive_aspect_light, unk_positive_aspect_light).

measured(s11, positive_aspect_light, light_feel).

all_consistent(positive_aspect_light) :- consistent(s11, positive_aspect_light).

evidence(all_consistent(positive_aspect_light)).
query(true_val(positive_aspect_light, light_feel)).
query(true_val(positive_aspect_light, unk_positive_aspect_light)).

0.88::acc(s7, positive_aspect_versatility).

% @attr positive_aspect_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values good_switch_pipe_kicker=Very_good_switch_pipe_kicker_performance unk_positive_aspect_versatility=Unknown
% @importance 0.95

0.74::true_val(positive_aspect_versatility, good_switch_pipe_kicker); 0.26::true_val(positive_aspect_versatility, unk_positive_aspect_versatility).

measured(s7, positive_aspect_versatility, good_switch_pipe_kicker).

all_consistent(positive_aspect_versatility) :- consistent(s7, positive_aspect_versatility).

evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, good_switch_pipe_kicker)).
query(true_val(positive_aspect_versatility, unk_positive_aspect_versatility)).

0.72::acc(s19, positive_aspect_edge_hold).

% @attr positive_aspect_edge_hold
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values edge_hold_reliable=Edge_hold_reliable_once_engaged_grips_well unk_positive_aspect_edge_hold=Unknown
% @importance 0.75

0.48::true_val(positive_aspect_edge_hold, edge_hold_reliable); 0.52::true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold).

measured(s19, positive_aspect_edge_hold, edge_hold_reliable).

all_consistent(positive_aspect_edge_hold) :- consistent(s19, positive_aspect_edge_hold).

evidence(all_consistent(positive_aspect_edge_hold)).
query(true_val(positive_aspect_edge_hold, edge_hold_reliable)).
query(true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold)).

0.50::acc(s27, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values killed_it_redesign=Absolutely_killed_it_with_redesign_daily_driver unk_user_review_forum=Unknown
% @importance 0.7

0.32::true_val(user_review_forum, killed_it_redesign); 0.68::true_val(user_review_forum, unk_user_review_forum).

measured(s27, user_review_forum, killed_it_redesign).

all_consistent(user_review_forum) :- consistent(s27, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, killed_it_redesign)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.68::acc(s29, reviewer_opinion_whitelines).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values light_nimble_powerful=Light_nimble_plenty_of_power_lightning_fast unk_reviewer_opinion_whitelines=Unknown
% @importance 0.6

0.53::true_val(reviewer_opinion_whitelines, light_nimble_powerful); 0.47::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s29, reviewer_opinion_whitelines, light_nimble_powerful).

all_consistent(reviewer_opinion_whitelines) :- consistent(s29, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, light_nimble_powerful)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

0.88::acc(s7, negative_aspect).
0.85::acc(s14, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values pre_2025_chatter=Pre_2025_models_severe_chatter_jarring_fatiguing unk_negative_aspect=Unknown
% @importance 0.925

0.93::true_val(negative_aspect, pre_2025_chatter); 0.07::true_val(negative_aspect, unk_negative_aspect).

measured(s7, negative_aspect, pre_2025_chatter).
measured(s14, negative_aspect, pre_2025_chatter).

all_consistent(negative_aspect) :-
    consistent(s7, negative_aspect),
    consistent(s14, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, pre_2025_chatter)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.88::acc(s7, negative_aspect_uneven_snow).

% @attr negative_aspect_uneven_snow
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values worse_uneven_than_assassin=Not_as_good_in_uneven_snow_as_regular_Assassin unk_negative_aspect_uneven_snow=Unknown
% @importance 0.95

0.74::true_val(negative_aspect_uneven_snow, worse_uneven_than_assassin); 0.26::true_val(negative_aspect_uneven_snow, unk_negative_aspect_uneven_snow).

measured(s7, negative_aspect_uneven_snow, worse_uneven_than_assassin).

all_consistent(negative_aspect_uneven_snow) :- consistent(s7, negative_aspect_uneven_snow).

evidence(all_consistent(negative_aspect_uneven_snow)).
query(true_val(negative_aspect_uneven_snow, worse_uneven_than_assassin)).
query(true_val(negative_aspect_uneven_snow, unk_negative_aspect_uneven_snow)).

0.88::acc(s7, negative_aspect_float).

% @attr negative_aspect_float
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values better_than_assassin_not_peers=Better_float_than_Assassin_but_not_as_good_as_peers unk_negative_aspect_float=Unknown
% @importance 0.95

0.74::true_val(negative_aspect_float, better_than_assassin_not_peers); 0.26::true_val(negative_aspect_float, unk_negative_aspect_float).

measured(s7, negative_aspect_float, better_than_assassin_not_peers).

all_consistent(negative_aspect_float) :- consistent(s7, negative_aspect_float).

evidence(all_consistent(negative_aspect_float)).
query(true_val(negative_aspect_float, better_than_assassin_not_peers)).
query(true_val(negative_aspect_float, unk_negative_aspect_float)).

0.88::acc(s7, negative_aspect_jibbing).

% @attr negative_aspect_jibbing
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_ideal_jibbing=Not_ideal_for_jibbing unk_negative_aspect_jibbing=Unknown
% @importance 0.95

0.74::true_val(negative_aspect_jibbing, not_ideal_jibbing); 0.26::true_val(negative_aspect_jibbing, unk_negative_aspect_jibbing).

measured(s7, negative_aspect_jibbing, not_ideal_jibbing).

all_consistent(negative_aspect_jibbing) :- consistent(s7, negative_aspect_jibbing).

evidence(all_consistent(negative_aspect_jibbing)).
query(true_val(negative_aspect_jibbing, not_ideal_jibbing)).
query(true_val(negative_aspect_jibbing, unk_negative_aspect_jibbing)).

0.72::acc(s19, negative_aspect_boring).

% @attr negative_aspect_boring
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values does_everything_well_boring=Does_everything_well_but_doesnt_stand_out_a_bit_boring unk_negative_aspect_boring=Unknown
% @importance 0.75

0.48::true_val(negative_aspect_boring, does_everything_well_boring); 0.52::true_val(negative_aspect_boring, unk_negative_aspect_boring).

measured(s19, negative_aspect_boring, does_everything_well_boring).

all_consistent(negative_aspect_boring) :- consistent(s19, negative_aspect_boring).

evidence(all_consistent(negative_aspect_boring)).
query(true_val(negative_aspect_boring, does_everything_well_boring)).
query(true_val(negative_aspect_boring, unk_negative_aspect_boring)).

0.88::acc(s7, negative_aspect_powder).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values powder_only_average=Powder_float_only_average_dozen_boards_float_better unk_negative_aspect_powder=Unknown
% @importance 0.95

0.74::true_val(negative_aspect_powder, powder_only_average); 0.26::true_val(negative_aspect_powder, unk_negative_aspect_powder).

measured(s7, negative_aspect_powder, powder_only_average).

all_consistent(negative_aspect_powder) :- consistent(s7, negative_aspect_powder).

evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, powder_only_average)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

0.88::acc(s7, negative_aspect_buttering).

% @attr negative_aspect_buttering
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values buttering_semi_hard=Buttering_semi_hard_not_easy_to_press unk_negative_aspect_buttering=Unknown
% @importance 0.95

0.74::true_val(negative_aspect_buttering, buttering_semi_hard); 0.26::true_val(negative_aspect_buttering, unk_negative_aspect_buttering).

measured(s7, negative_aspect_buttering, buttering_semi_hard).

all_consistent(negative_aspect_buttering) :- consistent(s7, negative_aspect_buttering).

evidence(all_consistent(negative_aspect_buttering)).
query(true_val(negative_aspect_buttering, buttering_semi_hard)).
query(true_val(negative_aspect_buttering, unk_negative_aspect_buttering)).

0.93::acc(s9, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values bio_epoxy_30pct=Bio_epoxy_resin_30pct_molecular_from_plants unk_sustainability_certification=Unknown
% @importance 0.9

0.88::true_val(sustainability_certification, bio_epoxy_30pct); 0.12::true_val(sustainability_certification, unk_sustainability_certification).

measured(s9, sustainability_certification, bio_epoxy_30pct).

all_consistent(sustainability_certification) :- consistent(s9, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, bio_epoxy_30pct)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.60::acc(s20, sustainability_certification_wood).

% @attr sustainability_certification_wood
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values paulownia_sustainable=Paulownia_wood_sustainably_sourced unk_sustainability_certification_wood=Unknown
% @importance 0.7

0.57::true_val(sustainability_certification_wood, paulownia_sustainable); 0.43::true_val(sustainability_certification_wood, unk_sustainability_certification_wood).

measured(s20, sustainability_certification_wood, paulownia_sustainable).

all_consistent(sustainability_certification_wood) :-
    (indep(s20), consistent(s20, sustainability_certification_wood) ; \+indep(s20)).

evidence(all_consistent(sustainability_certification_wood)).
query(true_val(sustainability_certification_wood, paulownia_sustainable)).
query(true_val(sustainability_certification_wood, unk_sustainability_certification_wood)).

0.72::acc(s10, sustainability_certification_wax).

% @attr sustainability_certification_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values natural_wax_paraffin_free=Natural_wax_paraffin_free_non_pollutant unk_sustainability_certification_wax=Unknown
% @importance 0.7

0.71::true_val(sustainability_certification_wax, natural_wax_paraffin_free); 0.29::true_val(sustainability_certification_wax, unk_sustainability_certification_wax).

measured(s10, sustainability_certification_wax, natural_wax_paraffin_free).

all_consistent(sustainability_certification_wax) :-
    (indep(s10), consistent(s10, sustainability_certification_wax) ; \+indep(s10)).

evidence(all_consistent(sustainability_certification_wax)).
query(true_val(sustainability_certification_wax, natural_wax_paraffin_free)).
query(true_val(sustainability_certification_wax, unk_sustainability_certification_wax)).

0.85::acc(s12, sustainability_certification_abs).

% @attr sustainability_certification_abs
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_abs_2025=Recycled_ABS_material_2025_model unk_sustainability_certification_abs=Unknown
% @importance 0.9

0.76::true_val(sustainability_certification_abs, recycled_abs_2025); 0.24::true_val(sustainability_certification_abs, unk_sustainability_certification_abs).

measured(s12, sustainability_certification_abs, recycled_abs_2025).

all_consistent(sustainability_certification_abs) :- consistent(s12, sustainability_certification_abs).

evidence(all_consistent(sustainability_certification_abs)).
query(true_val(sustainability_certification_abs, recycled_abs_2025)).
query(true_val(sustainability_certification_abs, unk_sustainability_certification_abs)).

0.72::acc(s18, sustainability_certification_bamboo).

% @attr sustainability_certification_bamboo
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values bamboo_veneers_40pct_reduction=Bamboo_veneers_reduce_fiberglass_resin_40pct unk_sustainability_certification_bamboo=Unknown
% @importance 0.85

0.60::true_val(sustainability_certification_bamboo, bamboo_veneers_40pct_reduction); 0.40::true_val(sustainability_certification_bamboo, unk_sustainability_certification_bamboo).

measured(s18, sustainability_certification_bamboo, bamboo_veneers_40pct_reduction).

all_consistent(sustainability_certification_bamboo) :-
    (indep(s18), consistent(s18, sustainability_certification_bamboo) ; \+indep(s18)).

evidence(all_consistent(sustainability_certification_bamboo)).
query(true_val(sustainability_certification_bamboo, bamboo_veneers_40pct_reduction)).
query(true_val(sustainability_certification_bamboo, unk_sustainability_certification_bamboo)).

0.72::acc(s18, sustainability_certification_fsc).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified_wood=FSC_certified_wood_Aspen_Select_Core unk_sustainability_certification_fsc=Unknown
% @importance 0.85

0.60::true_val(sustainability_certification_fsc, fsc_certified_wood); 0.40::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s18, sustainability_certification_fsc, fsc_certified_wood).

all_consistent(sustainability_certification_fsc) :-
    (indep(s18), consistent(s18, sustainability_certification_fsc) ; \+indep(s18)).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified_wood)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

0.72::acc(s30, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values flex_4_vs_5=Regular_Assassin_flex_4_5_vs_Pro_5_5 unk_comparable_board_same_brand=Unknown
% @importance 0.7

0.67::true_val(comparable_board_same_brand, flex_4_vs_5); 0.33::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s30, comparable_board_same_brand, flex_4_vs_5).

all_consistent(comparable_board_same_brand) :-
    (indep(s30), consistent(s30, comparable_board_same_brand) ; \+indep(s30)).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, flex_4_vs_5)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.58::acc(s31, comparable_board_same_brand_price).

% @attr comparable_board_same_brand_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand
% @values v599_95=599.95 unk_comparable_board_same_brand_price=Unknown
% @importance 0.75

0.54::true_val(comparable_board_same_brand_price, v599_95); 0.46::true_val(comparable_board_same_brand_price, unk_comparable_board_same_brand_price).

measured(s31, comparable_board_same_brand_price, v599_95).

all_consistent(comparable_board_same_brand_price) :-
    (indep(s31), consistent(s31, comparable_board_same_brand_price) ; \+indep(s31)).

evidence(all_consistent(comparable_board_same_brand_price)).
query(true_val(comparable_board_same_brand_price, v599_95)).
query(true_val(comparable_board_same_brand_price, unk_comparable_board_same_brand_price)).

0.88::acc(s14, comparable_board_same_brand_inserts).

% @attr comparable_board_same_brand_inserts
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values inserts_5x2_vs_6x2=Regular_5x2_inserts_vs_Pro_6x2 unk_comparable_board_same_brand_inserts=Unknown
% @importance 0.85

0.72::true_val(comparable_board_same_brand_inserts, inserts_5x2_vs_6x2); 0.28::true_val(comparable_board_same_brand_inserts, unk_comparable_board_same_brand_inserts).

measured(s14, comparable_board_same_brand_inserts, inserts_5x2_vs_6x2).

all_consistent(comparable_board_same_brand_inserts) :- consistent(s14, comparable_board_same_brand_inserts).

evidence(all_consistent(comparable_board_same_brand_inserts)).
query(true_val(comparable_board_same_brand_inserts, inserts_5x2_vs_6x2)).
query(true_val(comparable_board_same_brand_inserts, unk_comparable_board_same_brand_inserts)).

0.85::acc(s32, comparable_board_same_brand_dampening).

% @attr comparable_board_same_brand_dampening
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values regular_more_damp=Regular_Assassin_more_damp_chatter_resistant unk_comparable_board_same_brand_dampening=Unknown
% @importance 0.75

0.68::true_val(comparable_board_same_brand_dampening, regular_more_damp); 0.32::true_val(comparable_board_same_brand_dampening, unk_comparable_board_same_brand_dampening).

measured(s32, comparable_board_same_brand_dampening, regular_more_damp).

all_consistent(comparable_board_same_brand_dampening) :- consistent(s32, comparable_board_same_brand_dampening).

evidence(all_consistent(comparable_board_same_brand_dampening)).
query(true_val(comparable_board_same_brand_dampening, regular_more_damp)).
query(true_val(comparable_board_same_brand_dampening, unk_comparable_board_same_brand_dampening)).

0.88::acc(s7, comparable_board_same_brand_rails).

% @attr comparable_board_same_brand_rails
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values cork_rails_vs_abs=Regular_has_Royal_Cork_Rails_Pro_2025_added_ABS unk_comparable_board_same_brand_rails=Unknown
% @importance 0.95

0.74::true_val(comparable_board_same_brand_rails, cork_rails_vs_abs); 0.26::true_val(comparable_board_same_brand_rails, unk_comparable_board_same_brand_rails).

measured(s7, comparable_board_same_brand_rails, cork_rails_vs_abs).

all_consistent(comparable_board_same_brand_rails) :- consistent(s7, comparable_board_same_brand_rails).

evidence(all_consistent(comparable_board_same_brand_rails)).
query(true_val(comparable_board_same_brand_rails, cork_rails_vs_abs)).
query(true_val(comparable_board_same_brand_rails, unk_comparable_board_same_brand_rails)).

0.72::acc(s18, comparable_board_same_brand_core).
0.60::acc(s20, comparable_board_same_brand_core).

% @attr comparable_board_same_brand_core
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values aspen_vs_ghost_green=Regular_Aspen_Select_Core_vs_Pro_Ghost_Green_Paulownia unk_comparable_board_same_brand_core=Unknown
% @importance 0.775

0.90::true_val(comparable_board_same_brand_core, aspen_vs_ghost_green); 0.10::true_val(comparable_board_same_brand_core, unk_comparable_board_same_brand_core).

measured(s18, comparable_board_same_brand_core, aspen_vs_ghost_green).
measured(s20, comparable_board_same_brand_core, aspen_vs_ghost_green).

all_consistent(comparable_board_same_brand_core) :-
    (indep(s18), consistent(s18, comparable_board_same_brand_core) ; \+indep(s18)),
    (indep(s20), consistent(s20, comparable_board_same_brand_core) ; \+indep(s20)).

evidence(all_consistent(comparable_board_same_brand_core)).
query(true_val(comparable_board_same_brand_core, aspen_vs_ghost_green)).
query(true_val(comparable_board_same_brand_core, unk_comparable_board_same_brand_core)).

0.88::acc(s7, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values tgr_list=Korua_Otto_Ride_Algorythm_Shadowban_Salomon_Highpath_Yes_Standard_Uninc_Yes_Basic_Uninc_Capita_BSOD_Jones_Rally_Cat_Cardiff_Crane_Lynx unk_comparable_board_cross_brand=Unknown
% @importance 0.95

0.74::true_val(comparable_board_cross_brand, tgr_list); 0.26::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s7, comparable_board_cross_brand, tgr_list).

all_consistent(comparable_board_cross_brand) :- consistent(s7, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, tgr_list)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.85::acc(s32, comparable_board_cross_brand_mtn_freestyle).

% @attr comparable_board_cross_brand_mtn_freestyle
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values mtn_freestyle_list=NS_Photosynthesis_Yes_Greats_Stone_Message_Yes_Basic_Ride_TwinPig_Burton_Good_Company_Yes_Typo unk_comparable_board_cross_brand_mtn_freestyle=Unknown
% @importance 0.75

0.68::true_val(comparable_board_cross_brand_mtn_freestyle, mtn_freestyle_list); 0.32::true_val(comparable_board_cross_brand_mtn_freestyle, unk_comparable_board_cross_brand_mtn_freestyle).

measured(s32, comparable_board_cross_brand_mtn_freestyle, mtn_freestyle_list).

all_consistent(comparable_board_cross_brand_mtn_freestyle) :- consistent(s32, comparable_board_cross_brand_mtn_freestyle).

evidence(all_consistent(comparable_board_cross_brand_mtn_freestyle)).
query(true_val(comparable_board_cross_brand_mtn_freestyle, mtn_freestyle_list)).
query(true_val(comparable_board_cross_brand_mtn_freestyle, unk_comparable_board_cross_brand_mtn_freestyle)).

0.40::acc(s33, comparable_board_cross_brand_doa).

% @attr comparable_board_cross_brand_doa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_doa=CAPiTA_DOA_similar_freestyle_all_mountain unk_comparable_board_cross_brand_doa=Unknown
% @importance 0.55

0.18::true_val(comparable_board_cross_brand_doa, capita_doa); 0.82::true_val(comparable_board_cross_brand_doa, unk_comparable_board_cross_brand_doa).

measured(s33, comparable_board_cross_brand_doa, capita_doa).

all_consistent(comparable_board_cross_brand_doa) :- consistent(s33, comparable_board_cross_brand_doa).

evidence(all_consistent(comparable_board_cross_brand_doa)).
query(true_val(comparable_board_cross_brand_doa, capita_doa)).
query(true_val(comparable_board_cross_brand_doa, unk_comparable_board_cross_brand_doa)).

0.50::acc(s27, comparable_board_cross_brand_kazu).

% @attr comparable_board_cross_brand_kazu
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_kazu=CAPiTA_Kazu_preferred_for_freeride_groomer unk_comparable_board_cross_brand_kazu=Unknown
% @importance 0.7

0.32::true_val(comparable_board_cross_brand_kazu, capita_kazu); 0.68::true_val(comparable_board_cross_brand_kazu, unk_comparable_board_cross_brand_kazu).

measured(s27, comparable_board_cross_brand_kazu, capita_kazu).

all_consistent(comparable_board_cross_brand_kazu) :- consistent(s27, comparable_board_cross_brand_kazu).

evidence(all_consistent(comparable_board_cross_brand_kazu)).
query(true_val(comparable_board_cross_brand_kazu, capita_kazu)).
query(true_val(comparable_board_cross_brand_kazu, unk_comparable_board_cross_brand_kazu)).

0.72::acc(s34, comparable_board_cross_brand_custom).
0.45::acc(s35, comparable_board_cross_brand_custom).

% @attr comparable_board_cross_brand_custom
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_custom=Assassin_compared_to_Burton_Custom_do_anything_board unk_comparable_board_cross_brand_custom=Unknown
% @importance 0.575

0.85::true_val(comparable_board_cross_brand_custom, burton_custom); 0.15::true_val(comparable_board_cross_brand_custom, unk_comparable_board_cross_brand_custom).

measured(s34, comparable_board_cross_brand_custom, burton_custom).
measured(s35, comparable_board_cross_brand_custom, burton_custom).

all_consistent(comparable_board_cross_brand_custom) :-
    consistent(s34, comparable_board_cross_brand_custom),
    consistent(s35, comparable_board_cross_brand_custom).

evidence(all_consistent(comparable_board_cross_brand_custom)).
query(true_val(comparable_board_cross_brand_custom, burton_custom)).
query(true_val(comparable_board_cross_brand_custom, unk_comparable_board_cross_brand_custom)).

0.72::acc(s19, comparable_board_cross_brand_comparison).

% @attr comparable_board_cross_brand_comparison
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values similar_profile_lighter=Similar_profile_flex_lighter_premium_higher_price unk_comparable_board_cross_brand_comparison=Unknown
% @importance 0.75

0.48::true_val(comparable_board_cross_brand_comparison, similar_profile_lighter); 0.52::true_val(comparable_board_cross_brand_comparison, unk_comparable_board_cross_brand_comparison).

measured(s19, comparable_board_cross_brand_comparison, similar_profile_lighter).

all_consistent(comparable_board_cross_brand_comparison) :- consistent(s19, comparable_board_cross_brand_comparison).

evidence(all_consistent(comparable_board_cross_brand_comparison)).
query(true_val(comparable_board_cross_brand_comparison, similar_profile_lighter)).
query(true_val(comparable_board_cross_brand_comparison, unk_comparable_board_cross_brand_comparison)).

0.78::acc(s17, retailer_info_evo).

% @attr retailer_info_evo
% @type categorical
% @canonical false
% @original_name evo
% @values major_us_retailer=Major_US_retailer_price_match_1yr_return unk_retailer_info_evo=Unknown
% @importance 0.8

0.68::true_val(retailer_info_evo, major_us_retailer); 0.32::true_val(retailer_info_evo, unk_retailer_info_evo).

measured(s17, retailer_info_evo, major_us_retailer).

all_consistent(retailer_info_evo) :-
    (indep(s17), consistent(s17, retailer_info_evo) ; \+indep(s17)).

evidence(all_consistent(retailer_info_evo)).
query(true_val(retailer_info_evo, major_us_retailer)).
query(true_val(retailer_info_evo, unk_retailer_info_evo)).

0.72::acc(s22, retailer_info_snowboards_com).

% @attr retailer_info_snowboards_com
% @type categorical
% @canonical false
% @original_name Snowboards.com
% @values authorized_dealer=Authorized_Salomon_dealer_carries_2025 unk_retailer_info_snowboards_com=Unknown
% @importance 0.9

0.68::true_val(retailer_info_snowboards_com, authorized_dealer); 0.32::true_val(retailer_info_snowboards_com, unk_retailer_info_snowboards_com).

measured(s22, retailer_info_snowboards_com, authorized_dealer).

all_consistent(retailer_info_snowboards_com) :-
    (indep(s22), consistent(s22, retailer_info_snowboards_com) ; \+indep(s22)).

evidence(all_consistent(retailer_info_snowboards_com)).
query(true_val(retailer_info_snowboards_com, authorized_dealer)).
query(true_val(retailer_info_snowboards_com, unk_retailer_info_snowboards_com)).

0.88::acc(s7, retailer_info_sun_ski).

% @attr retailer_info_sun_ski
% @type categorical
% @canonical false
% @original_name Sun & Ski Sports
% @values authorized_clearance=Authorized_dealer_wide_clearance_sales unk_retailer_info_sun_ski=Unknown
% @importance 0.95

0.74::true_val(retailer_info_sun_ski, authorized_clearance); 0.26::true_val(retailer_info_sun_ski, unk_retailer_info_sun_ski).

measured(s7, retailer_info_sun_ski, authorized_clearance).

all_consistent(retailer_info_sun_ski) :- consistent(s7, retailer_info_sun_ski).

evidence(all_consistent(retailer_info_sun_ski)).
query(true_val(retailer_info_sun_ski, authorized_clearance)).
query(true_val(retailer_info_sun_ski, unk_retailer_info_sun_ski)).

0.88::acc(s7, retailer_info_christy).

% @attr retailer_info_christy
% @type categorical
% @canonical false
% @original_name Christy Sports
% @values authorized_colorado=Authorized_dealer_well_known_Colorado unk_retailer_info_christy=Unknown
% @importance 0.95

0.74::true_val(retailer_info_christy, authorized_colorado); 0.26::true_val(retailer_info_christy, unk_retailer_info_christy).

measured(s7, retailer_info_christy, authorized_colorado).

all_consistent(retailer_info_christy) :- consistent(s7, retailer_info_christy).

evidence(all_consistent(retailer_info_christy)).
query(true_val(retailer_info_christy, authorized_colorado)).
query(true_val(retailer_info_christy, unk_retailer_info_christy)).

0.88::acc(s7, retailer_info_gravity_coalition).

% @attr retailer_info_gravity_coalition
% @type categorical
% @canonical false
% @original_name Gravity Coalition
% @values discount_focused=Discount_focused_retailer_lower_price unk_retailer_info_gravity_coalition=Unknown
% @importance 0.95

0.74::true_val(retailer_info_gravity_coalition, discount_focused); 0.26::true_val(retailer_info_gravity_coalition, unk_retailer_info_gravity_coalition).

measured(s7, retailer_info_gravity_coalition, discount_focused).

all_consistent(retailer_info_gravity_coalition) :- consistent(s7, retailer_info_gravity_coalition).

evidence(all_consistent(retailer_info_gravity_coalition)).
query(true_val(retailer_info_gravity_coalition, discount_focused)).
query(true_val(retailer_info_gravity_coalition, unk_retailer_info_gravity_coalition)).

0.72::acc(s18, retailer_info_blauer).

% @attr retailer_info_blauer
% @type categorical
% @canonical false
% @original_name Blauer Board Shop
% @values specialist_detailed=Specialist_board_shop_detailed_descriptions unk_retailer_info_blauer=Unknown
% @importance 0.85

0.60::true_val(retailer_info_blauer, specialist_detailed); 0.40::true_val(retailer_info_blauer, unk_retailer_info_blauer).

measured(s18, retailer_info_blauer, specialist_detailed).

all_consistent(retailer_info_blauer) :-
    (indep(s18), consistent(s18, retailer_info_blauer) ; \+indep(s18)).

evidence(all_consistent(retailer_info_blauer)).
query(true_val(retailer_info_blauer, specialist_detailed)).
query(true_val(retailer_info_blauer, unk_retailer_info_blauer)).

0.58::acc(s16, retailer_info_absolute_snow).

% @attr retailer_info_absolute_snow
% @type categorical
% @canonical false
% @original_name Absolute-Snow
% @values uk_authorized=UK_based_retailer_authorized_dealer unk_retailer_info_absolute_snow=Unknown
% @importance 0.7

0.42::true_val(retailer_info_absolute_snow, uk_authorized); 0.58::true_val(retailer_info_absolute_snow, unk_retailer_info_absolute_snow).

measured(s16, retailer_info_absolute_snow, uk_authorized).

all_consistent(retailer_info_absolute_snow) :-
    (indep(s16), consistent(s16, retailer_info_absolute_snow) ; \+indep(s16)).

evidence(all_consistent(retailer_info_absolute_snow)).
query(true_val(retailer_info_absolute_snow, uk_authorized)).
query(true_val(retailer_info_absolute_snow, unk_retailer_info_absolute_snow)).

0.60::acc(s23, return_policy_terms).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values days_365_new_unused=Small_local_shop_365_day_return_new_unused unk_return_policy_terms=Unknown
% @importance 0.85

0.54::true_val(return_policy_terms, days_365_new_unused); 0.46::true_val(return_policy_terms, unk_return_policy_terms).

measured(s23, return_policy_terms, days_365_new_unused).

all_consistent(return_policy_terms) :-
    (indep(s23), consistent(s23, return_policy_terms) ; \+indep(s23)).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, days_365_new_unused)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

0.85::acc(s7, board_weight_grams).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values not_published=Not_published_wood_cores_inconsistent_weight unk_board_weight_grams=Unknown
% @importance 0.95

0.74::true_val(board_weight_grams, not_published); 0.26::true_val(board_weight_grams, unk_board_weight_grams).

measured(s7, board_weight_grams, not_published).

all_consistent(board_weight_grams) :- consistent(s7, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, not_published)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.72::acc(s10, factory_tuning).

% @attr factory_tuning
% @type categorical
% @canonical false
% @original_name Factory tuning
% @values waxed_ready=Board_comes_waxed_ready_for_mountain unk_factory_tuning=Unknown
% @importance 0.7

0.71::true_val(factory_tuning, waxed_ready); 0.29::true_val(factory_tuning, unk_factory_tuning).

measured(s10, factory_tuning, waxed_ready).

all_consistent(factory_tuning) :-
    (indep(s10), consistent(s10, factory_tuning) ; \+indep(s10)).

evidence(all_consistent(factory_tuning)).
query(true_val(factory_tuning, waxed_ready)).
query(true_val(factory_tuning, unk_factory_tuning)).

0.70::acc(s11, predecessor_model_name).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values true_twin_to_directional_2019=Changed_True_Twin_to_Directional_Twin_2019 unk_predecessor_model_name=Unknown
% @importance 0.7

0.55::true_val(predecessor_model_name, true_twin_to_directional_2019); 0.45::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s11, predecessor_model_name, true_twin_to_directional_2019).

all_consistent(predecessor_model_name) :- consistent(s11, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, true_twin_to_directional_2019)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

0.30::acc(s33, user_review_forum_durability).

% @attr user_review_forum_durability
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values topsheet_cracking_reports=Some_reports_topsheet_cracking_other_Salomon_models unk_user_review_forum_durability=Unknown
% @importance 0.55

0.18::true_val(user_review_forum_durability, topsheet_cracking_reports); 0.82::true_val(user_review_forum_durability, unk_user_review_forum_durability).

measured(s33, user_review_forum_durability, topsheet_cracking_reports).

all_consistent(user_review_forum_durability) :- consistent(s33, user_review_forum_durability).

evidence(all_consistent(user_review_forum_durability)).
query(true_val(user_review_forum_durability, topsheet_cracking_reports)).
query(true_val(user_review_forum_durability, unk_user_review_forum_durability)).