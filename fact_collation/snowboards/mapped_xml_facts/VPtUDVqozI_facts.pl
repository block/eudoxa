0.12::indep(s_m).
0.15::indep(s1).
0.15::indep(s3).
0.12::indep(s7).
0.15::indep(s9).
0.15::indep(s13).
0.12::indep(s15).
0.15::indep(s16).
0.12::indep(s18).
0.15::indep(s20).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.95

0.97::true_val(brand, salomon); 0.03::true_val(brand, unk_brand).
0.93::acc(s1, brand).
0.90::acc(s2, brand).
measured(s1, brand, salomon).
measured(s2, brand, salomon).
all_consistent(brand) :- consistent(s1, brand), (indep(s1), consistent(s1, brand) ; \+indep(s1)).
evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values highpath=Highpath unk_model_name=Unknown
% @importance 0.95

0.97::true_val(model_name, highpath); 0.03::true_val(model_name, unk_model_name).
0.93::acc(s1, model_name).
0.90::acc(s2, model_name).
measured(s1, model_name, highpath).
measured(s2, model_name, highpath).
all_consistent(model_name) :- consistent(s1, model_name), consistent(s2, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, highpath)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 0.93

0.97::true_val(model_year, y2026); 0.03::true_val(model_year, unk_model_year).
0.93::acc(s1, model_year).
0.90::acc(s3, model_year).
measured(s1, model_year, y2026).
measured(s3, model_year, y2026).
all_consistent(model_year) :- consistent(s1, model_year), (indep(s1), consistent(s1, model_year) ; \+indep(s1)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2023=2023 unk_model_first_available_year=Unknown
% @importance 0.85

0.85::true_val(model_first_available_year, y2023); 0.15::true_val(model_first_available_year, unk_model_first_available_year).
0.85::acc(s5, model_first_available_year).
measured(s5, model_first_available_year, y2023).
all_consistent(model_first_available_year) :- consistent(s5, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2023)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.95

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).
0.93::acc(s1, product_type).
0.90::acc(s2, product_type).
measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type), consistent(s2, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.78

0.88::true_val(gender, unisex); 0.12::true_val(gender, unk_gender).
0.80::acc(s6, gender).
0.82::acc(s7, gender).
measured(s6, gender, unisex).
measured(s7, gender, unisex).
all_consistent(gender) :- consistent(s6, gender), (indep(s7), consistent(s7, gender) ; \+indep(s7)).
evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name Manufacturer
% @values salomon_sas=Salomon_SAS_Amer_Sports unk_manufacturer=Unknown
% @importance 0.85

0.90::true_val(manufacturer, salomon_sas); 0.10::true_val(manufacturer, unk_manufacturer).
0.90::acc(s10, manufacturer).
measured(s10, manufacturer, salomon_sas).
all_consistent(manufacturer) :- consistent(s10, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location
% @type categorical
% @canonical false
% @original_name Manufacturing location
% @values china=China unk_manufacturing_location=Unknown
% @importance 0.75

0.75::true_val(manufacturing_location, china); 0.25::true_val(manufacturing_location, unk_manufacturing_location).
0.72::acc(s9, manufacturing_location).
measured(s9, manufacturing_location, china).
all_consistent(manufacturing_location) :- consistent(s9, manufacturing_location).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, china)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr manufacturer_product_description
% @type categorical
% @canonical false
% @original_name Manufacturer product description
% @values high_perf_recycled=High_performance_all_mountain_recycled_bio_sourced unk_manufacturer_product_description=Unknown
% @importance 1.0

0.92::true_val(manufacturer_product_description, high_perf_recycled); 0.08::true_val(manufacturer_product_description, unk_manufacturer_product_description).
0.95::acc(s10, manufacturer_product_description).
measured(s10, manufacturer_product_description, high_perf_recycled).
all_consistent(manufacturer_product_description) :- consistent(s10, manufacturer_product_description).
evidence(all_consistent(manufacturer_product_description)).
query(true_val(manufacturer_product_description, high_perf_recycled)).
query(true_val(manufacturer_product_description, unk_manufacturer_product_description)).

% @attr sku_156cm
% @type categorical
% @canonical false
% @original_name SKU (156cm)
% @values l47925200=L47925200 unk_sku_156cm=Unknown
% @importance 0.85

0.92::true_val(sku_156cm, l47925200); 0.08::true_val(sku_156cm, unk_sku_156cm).
0.93::acc(s_m, sku_156cm).
measured(s_m, sku_156cm, l47925200).
all_consistent(sku_156cm) :- consistent(s_m, sku_156cm).
evidence(all_consistent(sku_156cm)).
query(true_val(sku_156cm, l47925200)).
query(true_val(sku_156cm, unk_sku_156cm)).

% @attr splitboard_variant_exists
% @type categorical
% @canonical false
% @original_name Splitboard variant exists
% @values yes=Yes unk_splitboard_variant_exists=Unknown
% @importance 0.40

0.88::true_val(splitboard_variant_exists, yes); 0.12::true_val(splitboard_variant_exists, unk_splitboard_variant_exists).
0.92::acc(s11, splitboard_variant_exists).
measured(s11, splitboard_variant_exists, yes).
all_consistent(splitboard_variant_exists) :- consistent(s11, splitboard_variant_exists).
evidence(all_consistent(splitboard_variant_exists)).
query(true_val(splitboard_variant_exists, yes)).
query(true_val(splitboard_variant_exists, unk_splitboard_variant_exists)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain all_mountain_freeride=All_Mountain_Freeride
% @importance 0.87

0.55::true_val(board_category, all_mountain); 0.45::true_val(board_category, all_mountain_freeride).
0.90::acc(s_m, board_category).
0.88::acc(s1, board_category).
0.87::acc(s3, board_category).
0.78::acc(s9, board_category).
measured(s_m, board_category, all_mountain).
measured(s1, board_category, all_mountain).
measured(s3, board_category, all_mountain).
measured(s9, board_category, all_mountain_freeride).
all_consistent(board_category) :-
    consistent(s1, board_category),
    consistent(s3, board_category),
    consistent(s9, board_category),
    (indep(s_m), consistent(s_m, board_category) ; \+indep(s_m)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, all_mountain_freeride)).

% @attr board_style_sbp
% @type categorical
% @canonical false
% @original_name Board style (SnowboardingProfiles)
% @values freeride_bordering_am=Freeride_bordering_on_all_mountain unk_board_style_sbp=Unknown
% @importance 0.90

0.82::true_val(board_style_sbp, freeride_bordering_am); 0.18::true_val(board_style_sbp, unk_board_style_sbp).
0.82::acc(s12, board_style_sbp).
measured(s12, board_style_sbp, freeride_bordering_am).
all_consistent(board_style_sbp) :- consistent(s12, board_style_sbp).
evidence(all_consistent(board_style_sbp)).
query(true_val(board_style_sbp, freeride_bordering_am)).
query(true_val(board_style_sbp, unk_board_style_sbp)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values am_groomed_offpiste_powder=All_Mountain_Groomed_Offpiste_Powder unk_terrain_suitability=Unknown
% @importance 0.85

0.92::true_val(terrain_suitability, am_groomed_offpiste_powder); 0.08::true_val(terrain_suitability, unk_terrain_suitability).
0.90::acc(s_m, terrain_suitability).
measured(s_m, terrain_suitability, am_groomed_offpiste_powder).
all_consistent(terrain_suitability) :- consistent(s_m, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, am_groomed_offpiste_powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values all_mountain_freeride=All_Mountain_Freeride unk_riding_style=Unknown
% @importance 0.83

0.90::true_val(riding_style, all_mountain_freeride); 0.10::true_val(riding_style, unk_riding_style).
0.88::acc(s1, riding_style).
0.75::acc(s9, riding_style).
measured(s1, riding_style, all_mountain_freeride).
measured(s9, riding_style, all_mountain_freeride).
all_consistent(riding_style) :-
    consistent(s1, riding_style),
    (indep(s9), consistent(s9, riding_style) ; \+indep(s9)).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mountain_freeride)).
query(true_val(riding_style, unk_riding_style)).

% @attr ideal_conditions
% @type categorical
% @canonical false
% @original_name Ideal conditions
% @values all_season_versatile=Versatile_all_seasons_powder_to_slush unk_ideal_conditions=Unknown
% @importance 0.70

0.80::true_val(ideal_conditions, all_season_versatile); 0.20::true_val(ideal_conditions, unk_ideal_conditions).
0.80::acc(s13, ideal_conditions).
measured(s13, ideal_conditions, all_season_versatile).
all_consistent(ideal_conditions) :- consistent(s13, ideal_conditions).
evidence(all_consistent(ideal_conditions)).
query(true_val(ideal_conditions, all_season_versatile)).
query(true_val(ideal_conditions, unk_ideal_conditions)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced=Advanced unk_rider_level=Unknown
% @importance 1.0

0.92::true_val(rider_level, advanced); 0.08::true_val(rider_level, unk_rider_level).
0.94::acc(s10, rider_level).
measured(s10, rider_level, advanced).
all_consistent(rider_level) :- consistent(s10, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_Expert intermediate_expert=Intermediate_Expert
% @importance 0.93

0.55::true_val(skill_level_recommendation, advanced_expert); 0.45::true_val(skill_level_recommendation, intermediate_expert).
0.88::acc(s1, skill_level_recommendation).
0.83::acc(s14, skill_level_recommendation).
measured(s1, skill_level_recommendation, advanced_expert).
measured(s14, skill_level_recommendation, intermediate_expert).
all_consistent(skill_level_recommendation) :-
    consistent(s1, skill_level_recommendation),
    consistent(s14, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, intermediate_expert)).

% @attr rider_level_absolute_snow
% @type categorical
% @canonical false
% @original_name Rider level (Absolute Snow)
% @values intermediate_to_expert=Intermediate_to_expert unk_rider_level_absolute_snow=Unknown
% @importance 0.70

0.78::true_val(rider_level_absolute_snow, intermediate_to_expert); 0.22::true_val(rider_level_absolute_snow, unk_rider_level_absolute_snow).
0.78::acc(s13, rider_level_absolute_snow).
measured(s13, rider_level_absolute_snow, intermediate_to_expert).
all_consistent(rider_level_absolute_snow) :- consistent(s13, rider_level_absolute_snow).
evidence(all_consistent(rider_level_absolute_snow)).
query(true_val(rider_level_absolute_snow, intermediate_to_expert)).
query(true_val(rider_level_absolute_snow, unk_rider_level_absolute_snow)).

% @attr rider_level_sbp
% @type categorical
% @canonical false
% @original_name Rider level (SnowboardingProfiles)
% @values solid_intermediate_to_advanced_expert=Solid_intermediate_to_advanced_expert unk_rider_level_sbp=Unknown
% @importance 0.90

0.82::true_val(rider_level_sbp, solid_intermediate_to_advanced_expert); 0.18::true_val(rider_level_sbp, unk_rider_level_sbp).
0.83::acc(s12, rider_level_sbp).
measured(s12, rider_level_sbp, solid_intermediate_to_advanced_expert).
all_consistent(rider_level_sbp) :- consistent(s12, rider_level_sbp).
evidence(all_consistent(rider_level_sbp)).
query(true_val(rider_level_sbp, solid_intermediate_to_advanced_expert)).
query(true_val(rider_level_sbp, unk_rider_level_sbp)).

% @attr not_suitable_for_beginners
% @type categorical
% @canonical false
% @original_name Not suitable for beginners
% @values yes=Yes unk_not_suitable_for_beginners=Unknown
% @importance 0.90

0.85::true_val(not_suitable_for_beginners, yes); 0.15::true_val(not_suitable_for_beginners, unk_not_suitable_for_beginners).
0.85::acc(s12, not_suitable_for_beginners).
measured(s12, not_suitable_for_beginners, yes).
all_consistent(not_suitable_for_beginners) :- consistent(s12, not_suitable_for_beginners).
evidence(all_consistent(not_suitable_for_beginners)).
query(true_val(not_suitable_for_beginners, yes)).
query(true_val(not_suitable_for_beginners, unk_not_suitable_for_beginners)).

% @attr target_rider
% @type categorical
% @canonical false
% @original_name Target rider
% @values speed_carving_no_park=Speed_and_carving_focused_no_park unk_target_rider=Unknown
% @importance 0.90

0.83::true_val(target_rider, speed_carving_no_park); 0.17::true_val(target_rider, unk_target_rider).
0.83::acc(s14, target_rider).
measured(s14, target_rider, speed_carving_no_park).
all_consistent(target_rider) :- consistent(s14, target_rider).
evidence(all_consistent(target_rider)).
query(true_val(target_rider, speed_carving_no_park)).
query(true_val(target_rider, unk_target_rider)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.93

0.97::true_val(shape, tapered_directional); 0.03::true_val(shape, unk_shape).
0.92::acc(s_m, shape).
0.90::acc(s1, shape).
0.94::acc(s10, shape).
measured(s_m, shape, tapered_directional).
measured(s1, shape, tapered_directional).
measured(s10, shape, tapered_directional).
all_consistent(shape) :-
    consistent(s10, shape),
    (indep(s_m), consistent(s_m, shape) ; \+indep(s_m)),
    (indep(s1), consistent(s1, shape) ; \+indep(s1)).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values tail_tapered_2_20mm=Tail_tapered_2_to_20mm unk_shape_description=Unknown
% @importance 0.65

0.78::true_val(shape_description, tail_tapered_2_20mm); 0.22::true_val(shape_description, unk_shape_description).
0.75::acc(s15, shape_description).
measured(s15, shape_description, tail_tapered_2_20mm).
all_consistent(shape_description) :- consistent(s15, shape_description).
evidence(all_consistent(shape_description)).
query(true_val(shape_description, tail_tapered_2_20mm)).
query(true_val(shape_description, unk_shape_description)).

% @attr taper_amount
% @type numeric
% @canonical false
% @original_name Taper amount
% @unit mm
% @values v3=3.0 unk_taper_amount=Unknown
% @importance 0.90

0.82::true_val(taper_amount, v3); 0.18::true_val(taper_amount, unk_taper_amount).
0.85::acc(s14, taper_amount).
measured(s14, taper_amount, v3).
all_consistent(taper_amount) :- consistent(s14, taper_amount).
evidence(all_consistent(taper_amount)).
query(true_val(taper_amount, v3)).
query(true_val(taper_amount, unk_taper_amount)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rock_out_camber=Rock_Out_Camber rocker_flat_rocker=Rocker_Flat_Rocker
% @importance 0.93

0.70::true_val(camber_type, rock_out_camber); 0.30::true_val(camber_type, rocker_flat_rocker).
0.92::acc(s_m, camber_type).
0.90::acc(s1, camber_type).
0.94::acc(s10, camber_type).
0.72::acc(s14, camber_type).
measured(s_m, camber_type, rock_out_camber).
measured(s1, camber_type, rock_out_camber).
measured(s10, camber_type, rock_out_camber).
measured(s14, camber_type, rocker_flat_rocker).
all_consistent(camber_type) :-
    consistent(s10, camber_type),
    consistent(s14, camber_type),
    (indep(s_m), consistent(s_m, camber_type) ; \+indep(s_m)),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, rock_out_camber)).
query(true_val(camber_type, rocker_flat_rocker)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name Camber description
% @values flat_camber_rocker=Flat_between_bindings_camber_near_feet_rocker_tips unk_camber_description=Unknown
% @importance 0.93

0.93::true_val(camber_description, flat_camber_rocker); 0.07::true_val(camber_description, unk_camber_description).
0.90::acc(s1, camber_description).
0.85::acc(s14, camber_description).
measured(s1, camber_description, flat_camber_rocker).
measured(s14, camber_description, flat_camber_rocker).
all_consistent(camber_description) :-
    consistent(s1, camber_description),
    consistent(s14, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_camber_rocker)).
query(true_val(camber_description, unk_camber_description)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v20=20.0 unk_setback=Unknown
% @importance 0.85

0.92::true_val(setback, v20); 0.08::true_val(setback, unk_setback).
0.92::acc(s_m, setback).
measured(s_m, setback, v20).
all_consistent(setback) :- consistent(s_m, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v20)).
query(true_val(setback, unk_setback)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional=Directional_flex unk_flex_direction=Unknown
% @importance 0.85

0.92::true_val(flex_direction, directional); 0.08::true_val(flex_direction, unk_flex_direction).
0.90::acc(s_m, flex_direction).
measured(s_m, flex_direction, directional).
all_consistent(flex_direction) :- consistent(s_m, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values quadratic=Quadratic_Sidecut unk_sidecut_type=Unknown
% @importance 0.85

0.92::true_val(sidecut_type, quadratic); 0.08::true_val(sidecut_type, unk_sidecut_type).
0.92::acc(s_m, sidecut_type).
measured(s_m, sidecut_type, quadratic).
all_consistent(sidecut_type) :- consistent(s_m, sidecut_type).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, quadratic)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values elliptic_blend=Blend_of_elliptic_curves_easy_turn_initiation unk_sidecut_description=Unknown
% @importance 0.95

0.90::true_val(sidecut_description, elliptic_blend); 0.10::true_val(sidecut_description, unk_sidecut_description).
0.90::acc(s1, sidecut_description).
measured(s1, sidecut_description, elliptic_blend).
all_consistent(sidecut_description) :- consistent(s1, sidecut_description).
evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, elliptic_blend)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v8=8.0 v7=7.0
% @importance 0.90

0.55::true_val(flex_rating_10, v8); 0.45::true_val(flex_rating_10, v7).
0.88::acc(s_m, flex_rating_10).
0.83::acc(s12, flex_rating_10).
measured(s_m, flex_rating_10, v8).
measured(s12, flex_rating_10, v7).
all_consistent(flex_rating_10) :-
    consistent(s12, flex_rating_10),
    (indep(s_m), consistent(s_m, flex_rating_10) ; \+indep(s_m)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v8)).
query(true_val(flex_rating_10, v7)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff=Stiff medium_medium_soft=Medium_bordering_medium_soft
% @importance 0.83

0.50::true_val(flex_feel, stiff); 0.50::true_val(flex_feel, medium_medium_soft).
0.78::acc(s9, flex_feel).
0.85::acc(s14, flex_feel).
measured(s9, flex_feel, stiff).
measured(s14, flex_feel, medium_medium_soft).
all_consistent(flex_feel) :-
    consistent(s14, flex_feel),
    (indep(s9), consistent(s9, flex_feel) ; \+indep(s9)).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff)).
query(true_val(flex_feel, medium_medium_soft)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values stiff=Stiff unk_flex_rating_10_evo=Unknown
% @importance 0.95

0.88::true_val(flex_rating_10_evo, stiff); 0.12::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).
0.85::acc(s1, flex_rating_10_evo).
measured(s1, flex_rating_10_evo, stiff).
all_consistent(flex_rating_10_evo) :- consistent(s1, flex_rating_10_evo).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_description_shred_shop
% @type categorical
% @canonical false
% @original_name Flex description (Shred Shop)
% @values stiff_power_stability=Stiff_flex_more_power_stability_confidence unk_flex_description_shred_shop=Unknown
% @importance 0.60

0.75::true_val(flex_description_shred_shop, stiff_power_stability); 0.25::true_val(flex_description_shred_shop, unk_flex_description_shred_shop).
0.72::acc(s16, flex_description_shred_shop).
measured(s16, flex_description_shred_shop, stiff_power_stability).
all_consistent(flex_description_shred_shop) :- consistent(s16, flex_description_shred_shop).
evidence(all_consistent(flex_description_shred_shop)).
query(true_val(flex_description_shred_shop, stiff_power_stability)).
query(true_val(flex_description_shred_shop, unk_flex_description_shred_shop)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_slct=Aspen_SLCT_Core paulownia=Paulownia_wood
% @importance 0.89

0.85::true_val(core_material, aspen_slct); 0.15::true_val(core_material, paulownia).
0.93::acc(s_m, core_material).
0.94::acc(s10, core_material).
0.62::acc(s17, core_material).
measured(s_m, core_material, aspen_slct).
measured(s10, core_material, aspen_slct).
measured(s17, core_material, paulownia).
all_consistent(core_material) :-
    consistent(s10, core_material),
    consistent(s17, core_material),
    (indep(s_m), consistent(s_m, core_material) ; \+indep(s_m)).
evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_slct)).
query(true_val(core_material, paulownia)).

% @attr core_description
% @type categorical
% @canonical false
% @original_name Core description
% @values hand_selected_light=Hand_selected_wood_strips_unparalleled_quality_lightness unk_core_description=Unknown
% @importance 0.85

0.92::true_val(core_description, hand_selected_light); 0.08::true_val(core_description, unk_core_description).
0.90::acc(s_m, core_description).
measured(s_m, core_description, hand_selected_light).
all_consistent(core_description) :- consistent(s_m, core_description).
evidence(all_consistent(core_description)).
query(true_val(core_description, hand_selected_light)).
query(true_val(core_description, unk_core_description)).

% @attr core_profile
% @type categorical
% @canonical false
% @original_name Core profile
% @values popster=Popster unk_core_profile=Unknown
% @importance 0.85

0.92::true_val(core_profile, popster); 0.08::true_val(core_profile, unk_core_profile).
0.92::acc(s_m, core_profile).
measured(s_m, core_profile, popster).
all_consistent(core_profile) :- consistent(s_m, core_profile).
evidence(all_consistent(core_profile)).
query(true_val(core_profile, popster)).
query(true_val(core_profile, unk_core_profile)).

% @attr core_profile_description
% @type categorical
% @canonical false
% @original_name Core profile description
% @values mills_core_inside_inserts=Mills_core_inside_inserts_natural_flex_extra_pop unk_core_profile_description=Unknown
% @importance 0.85

0.92::true_val(core_profile_description, mills_core_inside_inserts); 0.08::true_val(core_profile_description, unk_core_profile_description).
0.90::acc(s_m, core_profile_description).
measured(s_m, core_profile_description, mills_core_inside_inserts).
all_consistent(core_profile_description) :- consistent(s_m, core_profile_description).
evidence(all_consistent(core_profile_description)).
query(true_val(core_profile_description, mills_core_inside_inserts)).
query(true_val(core_profile_description, unk_core_profile_description)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values abc_wrapper=ABC_Wrapper_Topsheet unk_topsheet=Unknown
% @importance 0.85

0.92::true_val(topsheet, abc_wrapper); 0.08::true_val(topsheet, unk_topsheet).
0.92::acc(s_m, topsheet).
measured(s_m, topsheet, abc_wrapper).
all_consistent(topsheet) :- consistent(s_m, topsheet).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, abc_wrapper)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_description
% @type categorical
% @canonical false
% @original_name Topsheet description
% @values wood_veneer_less_fiberglass=More_dampening_less_plastic_wood_veneer unk_topsheet_description=Unknown
% @importance 0.70

0.85::true_val(topsheet_description, wood_veneer_less_fiberglass); 0.15::true_val(topsheet_description, unk_topsheet_description).
0.85::acc(s7, topsheet_description).
measured(s7, topsheet_description, wood_veneer_less_fiberglass).
all_consistent(topsheet_description) :- consistent(s7, topsheet_description).
evidence(all_consistent(topsheet_description)).
query(true_val(topsheet_description, wood_veneer_less_fiberglass)).
query(true_val(topsheet_description, unk_topsheet_description)).

% @attr topsheet_weight_reduction
% @type categorical
% @canonical false
% @original_name Topsheet weight reduction
% @values wood_veneer_reduces_weight=Wood_veneer_reduces_weight_less_fiberglass unk_topsheet_weight_reduction=Unknown
% @importance 0.70

0.83::true_val(topsheet_weight_reduction, wood_veneer_reduces_weight); 0.17::true_val(topsheet_weight_reduction, unk_topsheet_weight_reduction).
0.82::acc(s7, topsheet_weight_reduction).
measured(s7, topsheet_weight_reduction, wood_veneer_reduces_weight).
all_consistent(topsheet_weight_reduction) :- consistent(s7, topsheet_weight_reduction).
evidence(all_consistent(topsheet_weight_reduction)).
query(true_val(topsheet_weight_reduction, wood_veneer_reduces_weight)).
query(true_val(topsheet_weight_reduction, unk_topsheet_weight_reduction)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values ba_md_fiberglass=BA_MD_Fiberglass unk_laminate=Unknown
% @importance 0.85

0.92::true_val(laminate, ba_md_fiberglass); 0.08::true_val(laminate, unk_laminate).
0.92::acc(s_m, laminate).
measured(s_m, laminate, ba_md_fiberglass).
all_consistent(laminate) :- consistent(s_m, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, ba_md_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr fiberglass_description
% @type categorical
% @canonical false
% @original_name Fiberglass description
% @values medium_density_european=Medium_density_European_fiberglass_consistent_quality unk_fiberglass_description=Unknown
% @importance 0.65

0.78::true_val(fiberglass_description, medium_density_european); 0.22::true_val(fiberglass_description, unk_fiberglass_description).
0.75::acc(s15, fiberglass_description).
measured(s15, fiberglass_description, medium_density_european).
all_consistent(fiberglass_description) :- consistent(s15, fiberglass_description).
evidence(all_consistent(fiberglass_description)).
query(true_val(fiberglass_description, medium_density_european)).
query(true_val(fiberglass_description, unk_fiberglass_description)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values bfx_basalt=BFX_Basalt unk_construction_material_innovation=Unknown
% @importance 0.85

0.92::true_val(construction_material_innovation, bfx_basalt); 0.08::true_val(construction_material_innovation, unk_construction_material_innovation).
0.92::acc(s_m, construction_material_innovation).
measured(s_m, construction_material_innovation, bfx_basalt).
all_consistent(construction_material_innovation) :- consistent(s_m, construction_material_innovation).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, bfx_basalt)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr basalt_description
% @type categorical
% @canonical false
% @original_name Basalt description
% @values fiberglass_basalt_optimal_ratio=Fiberglass_and_basalt_optimal_weight_power_dampening unk_basalt_description=Unknown
% @importance 0.78

0.85::true_val(basalt_description, fiberglass_basalt_optimal_ratio); 0.15::true_val(basalt_description, unk_basalt_description).
0.85::acc(s7, basalt_description).
0.87::acc(s3, basalt_description).
measured(s7, basalt_description, fiberglass_basalt_optimal_ratio).
measured(s3, basalt_description, fiberglass_basalt_optimal_ratio).
all_consistent(basalt_description) :-
    (indep(s7), consistent(s7, basalt_description) ; \+indep(s7)),
    (indep(s3), consistent(s3, basalt_description) ; \+indep(s3)).
evidence(all_consistent(basalt_description)).
query(true_val(basalt_description, fiberglass_basalt_optimal_ratio)).
query(true_val(basalt_description, unk_basalt_description)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values bio_based_30pct=30pct_Bio_Based_Resin unk_resin=Unknown
% @importance 0.85

0.92::true_val(resin, bio_based_30pct); 0.08::true_val(resin, unk_resin).
0.92::acc(s_m, resin).
measured(s_m, resin, bio_based_30pct).
all_consistent(resin) :- consistent(s_m, resin).
evidence(all_consistent(resin)).
query(true_val(resin, bio_based_30pct)).
query(true_val(resin, unk_resin)).

% @attr resin_description
% @type categorical
% @canonical false
% @original_name Resin description
% @values bio_epoxy_plant_derived=Bio_epoxy_resin_30pct_molecular_structure_from_plants unk_resin_description=Unknown
% @importance 0.65

0.78::true_val(resin_description, bio_epoxy_plant_derived); 0.22::true_val(resin_description, unk_resin_description).
0.75::acc(s15, resin_description).
measured(s15, resin_description, bio_epoxy_plant_derived).
all_consistent(resin_description) :- consistent(s15, resin_description).
evidence(all_consistent(resin_description)).
query(true_val(resin_description, bio_epoxy_plant_derived)).
query(true_val(resin_description, unk_resin_description)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs=Recycled_ABS unk_sidewall_material=Unknown
% @importance 0.85

0.92::true_val(sidewall_material, recycled_abs); 0.08::true_val(sidewall_material, unk_sidewall_material).
0.92::acc(s_m, sidewall_material).
measured(s_m, sidewall_material, recycled_abs).
all_consistent(sidewall_material) :- consistent(s_m, sidewall_material).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_recycled_content
% @type categorical
% @canonical false
% @original_name Sidewall recycled content
% @values pct_100=100pct_recycled pct_66=66pct_recycled
% @importance 0.80

0.60::true_val(sidewall_recycled_content, pct_100); 0.40::true_val(sidewall_recycled_content, pct_66).
0.94::acc(s10, sidewall_recycled_content).
0.88::acc(s3, sidewall_recycled_content).
0.72::acc(s13, sidewall_recycled_content).
0.70::acc(s18, sidewall_recycled_content).
measured(s10, sidewall_recycled_content, pct_100).
measured(s3, sidewall_recycled_content, pct_100).
measured(s13, sidewall_recycled_content, pct_66).
measured(s18, sidewall_recycled_content, pct_66).
all_consistent(sidewall_recycled_content) :-
    consistent(s10, sidewall_recycled_content),
    consistent(s13, sidewall_recycled_content),
    (indep(s3), consistent(s3, sidewall_recycled_content) ; \+indep(s3)),
    (indep(s18), consistent(s18, sidewall_recycled_content) ; \+indep(s18)).
evidence(all_consistent(sidewall_recycled_content)).
query(true_val(sidewall_recycled_content, pct_100)).
query(true_val(sidewall_recycled_content, pct_66)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values recycled_sintered_50pct=50pct_Recycled_Sintered_Base unk_base_material=Unknown
% @importance 0.93

0.95::true_val(base_material, recycled_sintered_50pct); 0.05::true_val(base_material, unk_base_material).
0.92::acc(s_m, base_material).
0.94::acc(s10, base_material).
measured(s_m, base_material, recycled_sintered_50pct).
measured(s10, base_material, recycled_sintered_50pct).
all_consistent(base_material) :-
    consistent(s10, base_material),
    (indep(s_m), consistent(s_m, base_material) ; \+indep(s_m)).
evidence(all_consistent(base_material)).
query(true_val(base_material, recycled_sintered_50pct)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered unk_base_type=Unknown
% @importance 0.85

0.95::true_val(base_type, sintered); 0.05::true_val(base_type, unk_base_type).
0.92::acc(s_m, base_type).
0.94::acc(s10, base_type).
measured(s_m, base_type, sintered).
measured(s10, base_type, sintered).
all_consistent(base_type) :-
    consistent(s10, base_type),
    (indep(s_m), consistent(s_m, base_type) ; \+indep(s_m)).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

% @attr base_finish
% @type categorical
% @canonical false
% @original_name base_type (Fine Stone Finish)
% @values fine_stone=Fine_Stone_Finish unk_base_finish=Unknown
% @importance 0.85

0.92::true_val(base_finish, fine_stone); 0.08::true_val(base_finish, unk_base_finish).
0.92::acc(s_m, base_finish).
measured(s_m, base_finish, fine_stone).
all_consistent(base_finish) :- consistent(s_m, base_finish).
evidence(all_consistent(base_finish)).
query(true_val(base_finish, fine_stone)).
query(true_val(base_finish, unk_base_finish)).

% @attr base_finish_description
% @type categorical
% @canonical false
% @original_name Base finish description
% @values fine_stone_sintered_eg=Fine_stone_finish_efficient_on_Sintered_EG_base unk_base_finish_description=Unknown
% @importance 1.0

0.92::true_val(base_finish_description, fine_stone_sintered_eg); 0.08::true_val(base_finish_description, unk_base_finish_description).
0.94::acc(s10, base_finish_description).
measured(s10, base_finish_description, fine_stone_sintered_eg).
all_consistent(base_finish_description) :- consistent(s10, base_finish_description).
evidence(all_consistent(base_finish_description)).
query(true_val(base_finish_description, fine_stone_sintered_eg)).
query(true_val(base_finish_description, unk_base_finish_description)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values natural_wax=Natural_Wax unk_factory_wax=Unknown
% @importance 0.85

0.92::true_val(factory_wax, natural_wax); 0.08::true_val(factory_wax, unk_factory_wax).
0.90::acc(s_m, factory_wax).
measured(s_m, factory_wax, natural_wax).
all_consistent(factory_wax) :- consistent(s_m, factory_wax).
evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, natural_wax)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr wax_description
% @type categorical
% @canonical false
% @original_name Wax description
% @values paraffin_free_natural=Paraffin_free_natural_ingredients_non_pollutant unk_wax_description=Unknown
% @importance 0.65

0.78::true_val(wax_description, paraffin_free_natural); 0.22::true_val(wax_description, unk_wax_description).
0.75::acc(s15, wax_description).
measured(s15, wax_description, paraffin_free_natural).
all_consistent(wax_description) :- consistent(s15, wax_description).
evidence(all_consistent(wax_description)).
query(true_val(wax_description, paraffin_free_natural)).
query(true_val(wax_description, unk_wax_description)).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values v1_5_1_5=1_5deg_base_and_side v1_0_2_0=1deg_nose_tail_2deg_between_feet
% @importance 0.82

0.65::true_val(edge_bevel_spec, v1_5_1_5); 0.35::true_val(edge_bevel_spec, v1_0_2_0).
0.88::acc(s_m, edge_bevel_spec).
0.88::acc(s1, edge_bevel_spec).
0.62::acc(s15, edge_bevel_spec).
measured(s_m, edge_bevel_spec, v1_5_1_5).
measured(s1, edge_bevel_spec, v1_5_1_5).
measured(s15, edge_bevel_spec, v1_0_2_0).
all_consistent(edge_bevel_spec) :-
    consistent(s15, edge_bevel_spec),
    (indep(s_m), consistent(s_m, edge_bevel_spec) ; \+indep(s_m)),
    (indep(s1), consistent(s1, edge_bevel_spec) ; \+indep(s1)).
evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, v1_5_1_5)).
query(true_val(edge_bevel_spec, v1_0_2_0)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values yes=Yes unk_sustainability_certification=Unknown
% @importance 0.78

0.93::true_val(sustainability_certification, yes); 0.07::true_val(sustainability_certification, unk_sustainability_certification).
0.92::acc(s_m, sustainability_certification).
0.85::acc(s7, sustainability_certification).
measured(s_m, sustainability_certification, yes).
measured(s7, sustainability_certification, yes).
all_consistent(sustainability_certification) :-
    (indep(s_m), consistent(s_m, sustainability_certification) ; \+indep(s_m)),
    (indep(s7), consistent(s7, sustainability_certification) ; \+indep(s7)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, yes)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_cert_recycled_edges
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled aluminum edges)
% @values min_20pct_recycled_aluminum=At_least_20pct_recycled_aluminum_in_edges unk_sustainability_cert_recycled_edges=Unknown
% @importance 0.93

0.95::true_val(sustainability_cert_recycled_edges, min_20pct_recycled_aluminum); 0.05::true_val(sustainability_cert_recycled_edges, unk_sustainability_cert_recycled_edges).
0.92::acc(s_m, sustainability_cert_recycled_edges).
0.94::acc(s10, sustainability_cert_recycled_edges).
measured(s_m, sustainability_cert_recycled_edges, min_20pct_recycled_aluminum).
measured(s10, sustainability_cert_recycled_edges, min_20pct_recycled_aluminum).
all_consistent(sustainability_cert_recycled_edges) :-
    consistent(s10, sustainability_cert_recycled_edges),
    (indep(s_m), consistent(s_m, sustainability_cert_recycled_edges) ; \+indep(s_m)).
evidence(all_consistent(sustainability_cert_recycled_edges)).
query(true_val(sustainability_cert_recycled_edges, min_20pct_recycled_aluminum)).
query(true_val(sustainability_cert_recycled_edges, unk_sustainability_cert_recycled_edges)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.92::true_val(mounting_pattern, inserts_2x4); 0.08::true_val(mounting_pattern, unk_mounting_pattern).
0.92::acc(s_m, mounting_pattern).
measured(s_m, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(s_m, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr mounting_description
% @type categorical
% @canonical false
% @original_name Mounting description
% @values tighter_pattern_precise=Tighter_hole_pattern_more_precise_stance_adjustments unk_mounting_description=Unknown
% @importance 0.85

0.90::true_val(mounting_description, tighter_pattern_precise); 0.10::true_val(mounting_description, unk_mounting_description).
0.90::acc(s_m, mounting_description).
measured(s_m, mounting_description, tighter_pattern_precise).
all_consistent(mounting_description) :- consistent(s_m, mounting_description).
evidence(all_consistent(mounting_description)).
query(true_val(mounting_description, tighter_pattern_precise)).
query(true_val(mounting_description, unk_mounting_description)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values random=Random_base_graphics unk_available_colors=Unknown
% @importance 0.70

0.82::true_val(available_colors, random); 0.18::true_val(available_colors, unk_available_colors).
0.82::acc(s7, available_colors).
measured(s7, available_colors, random).
all_consistent(available_colors) :- consistent(s7, available_colors).
evidence(all_consistent(available_colors)).
query(true_val(available_colors, random)).
query(true_val(available_colors, unk_available_colors)).

% @attr sustainability_summary
% @type categorical
% @canonical false
% @original_name Sustainability summary (manufacturer)
% @values recycled_bio_sourced_new_standard=Recycled_and_bio_sourced_materials_new_standard unk_sustainability_summary=Unknown
% @importance 0.40

0.80::true_val(sustainability_summary, recycled_bio_sourced_new_standard); 0.20::true_val(sustainability_summary, unk_sustainability_summary).
0.82::acc(s19, sustainability_summary).
measured(s19, sustainability_summary, recycled_bio_sourced_new_standard).
all_consistent(sustainability_summary) :- consistent(s19, sustainability_summary).
evidence(all_consistent(sustainability_summary)).
query(true_val(sustainability_summary, recycled_bio_sourced_new_standard)).
query(true_val(sustainability_summary, unk_sustainability_summary)).

% @attr bio_based_materials_pct
% @type numeric
% @canonical false
% @original_name Bio-based materials percentage
% @unit percent
% @values v28=28.0 unk_bio_based_materials_pct=Unknown
% @importance 0.70

0.80::true_val(bio_based_materials_pct, v28); 0.20::true_val(bio_based_materials_pct, unk_bio_based_materials_pct).
0.82::acc(s10, bio_based_materials_pct).
measured(s10, bio_based_materials_pct, v28).
all_consistent(bio_based_materials_pct) :- consistent(s10, bio_based_materials_pct).
evidence(all_consistent(bio_based_materials_pct)).
query(true_val(bio_based_materials_pct, v28)).
query(true_val(bio_based_materials_pct, unk_bio_based_materials_pct)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=153_156_159_159W_162_162W unk_available_sizes=Unknown
% @importance 0.85

0.92::true_val(available_sizes, six_sizes); 0.08::true_val(available_sizes, unk_available_sizes).
0.92::acc(s_m, available_sizes).
measured(s_m, available_sizes, six_sizes).
all_consistent(available_sizes) :- consistent(s_m, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_extended
% @type categorical
% @canonical false
% @original_name available_sizes (extended range)
% @values extended_146_150_165w=146_150_165W_in_broader_range unk_available_sizes_extended=Unknown
% @importance 0.90

0.80::true_val(available_sizes_extended, extended_146_150_165w); 0.20::true_val(available_sizes_extended, unk_available_sizes_extended).
0.78::acc(s12, available_sizes_extended).
0.80::acc(s14, available_sizes_extended).
measured(s12, available_sizes_extended, extended_146_150_165w).
measured(s14, available_sizes_extended, extended_146_150_165w).
all_consistent(available_sizes_extended) :-
    consistent(s12, available_sizes_extended),
    consistent(s14, available_sizes_extended).
evidence(all_consistent(available_sizes_extended)).
query(true_val(available_sizes_extended, extended_146_150_165w)).
query(true_val(available_sizes_extended, unk_available_sizes_extended)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.92::true_val(width_options, standard_wide); 0.08::true_val(width_options, unk_width_options).
0.92::acc(s_m, width_options).
measured(s_m, width_options, standard_wide).
all_consistent(width_options) :- consistent(s_m, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_wide)).
query(true_val(width_options, unk_width_options)).

% @attr effective_edge_153
% @type numeric
% @canonical false
% @original_name Effective edge 153cm
% @unit cm
% @values v117_0=117.0 unk_effective_edge_153=Unknown
% @importance 0.85

0.92::true_val(effective_edge_153, v117_0); 0.08::true_val(effective_edge_153, unk_effective_edge_153).
0.92::acc(s_m, effective_edge_153).
measured(s_m, effective_edge_153, v117_0).
all_consistent(effective_edge_153) :- consistent(s_m, effective_edge_153).
evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v117_0)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

% @attr effective_edge_156
% @type numeric
% @canonical false
% @original_name Effective edge 156cm
% @unit cm
% @values v118_5=118.5 unk_effective_edge_156=Unknown
% @importance 0.85

0.92::true_val(effective_edge_156, v118_5); 0.08::true_val(effective_edge_156, unk_effective_edge_156).
0.92::acc(s_m, effective_edge_156).
measured(s_m, effective_edge_156, v118_5).
all_consistent(effective_edge_156) :- consistent(s_m, effective_edge_156).
evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v118_5)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr effective_edge_159
% @type numeric
% @canonical false
% @original_name Effective edge 159cm
% @unit cm
% @values v121_0=121.0 unk_effective_edge_159=Unknown
% @importance 0.85

0.92::true_val(effective_edge_159, v121_0); 0.08::true_val(effective_edge_159, unk_effective_edge_159).
0.92::acc(s_m, effective_edge_159).
measured(s_m, effective_edge_159, v121_0).
all_consistent(effective_edge_159) :- consistent(s_m, effective_edge_159).
evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v121_0)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr effective_edge_159w
% @type numeric
% @canonical false
% @original_name Effective edge 159W
% @unit cm
% @values v121_0=121.0 unk_effective_edge_159w=Unknown
% @importance 0.85

0.92::true_val(effective_edge_159w, v121_0); 0.08::true_val(effective_edge_159w, unk_effective_edge_159w).
0.92::acc(s_m, effective_edge_159w).
measured(s_m, effective_edge_159w, v121_0).
all_consistent(effective_edge_159w) :- consistent(s_m, effective_edge_159w).
evidence(all_consistent(effective_edge_159w)).
query(true_val(effective_edge_159w, v121_0)).
query(true_val(effective_edge_159w, unk_effective_edge_159w)).

% @attr effective_edge_162
% @type numeric
% @canonical false
% @original_name Effective edge 162cm
% @unit cm
% @values v123_0=123.0 unk_effective_edge_162=Unknown
% @importance 0.85

0.92::true_val(effective_edge_162, v123_0); 0.08::true_val(effective_edge_162, unk_effective_edge_162).
0.92::acc(s_m, effective_edge_162).
measured(s_m, effective_edge_162, v123_0).
all_consistent(effective_edge_162) :- consistent(s_m, effective_edge_162).
evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v123_0)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr effective_edge_162w
% @type numeric
% @canonical false
% @original_name Effective edge 162W
% @unit cm
% @values v123_0=123.0 unk_effective_edge_162w=Unknown
% @importance 0.85

0.92::true_val(effective_edge_162w, v123_0); 0.08::true_val(effective_edge_162w, unk_effective_edge_162w).
0.92::acc(s_m, effective_edge_162w).
measured(s_m, effective_edge_162w, v123_0).
all_consistent(effective_edge_162w) :- consistent(s_m, effective_edge_162w).
evidence(all_consistent(effective_edge_162w)).
query(true_val(effective_edge_162w, v123_0)).
query(true_val(effective_edge_162w, unk_effective_edge_162w)).

% @attr waist_width_153
% @type numeric
% @canonical false
% @original_name Waist width 153cm
% @unit cm
% @values v25_2=25.2 unk_waist_width_153=Unknown
% @importance 0.85

0.92::true_val(waist_width_153, v25_2); 0.08::true_val(waist_width_153, unk_waist_width_153).
0.92::acc(s_m, waist_width_153).
measured(s_m, waist_width_153, v25_2).
all_consistent(waist_width_153) :- consistent(s_m, waist_width_153).
evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_2)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name Waist width 156cm
% @unit cm
% @values v25_5=25.5 unk_waist_width_156=Unknown
% @importance 0.85

0.92::true_val(waist_width_156, v25_5); 0.08::true_val(waist_width_156, unk_waist_width_156).
0.92::acc(s_m, waist_width_156).
measured(s_m, waist_width_156, v25_5).
all_consistent(waist_width_156) :- consistent(s_m, waist_width_156).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_5)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name Waist width 159cm
% @unit cm
% @values v25_7=25.7 unk_waist_width_159=Unknown
% @importance 0.85

0.92::true_val(waist_width_159, v25_7); 0.08::true_val(waist_width_159, unk_waist_width_159).
0.92::acc(s_m, waist_width_159).
measured(s_m, waist_width_159, v25_7).
all_consistent(waist_width_159) :- consistent(s_m, waist_width_159).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_7)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr waist_width_159w
% @type numeric
% @canonical false
% @original_name Waist width 159W
% @unit cm
% @values v26_5=26.5 unk_waist_width_159w=Unknown
% @importance 0.85

0.92::true_val(waist_width_159w, v26_5); 0.08::true_val(waist_width_159w, unk_waist_width_159w).
0.92::acc(s_m, waist_width_159w).
measured(s_m, waist_width_159w, v26_5).
all_consistent(waist_width_159w) :- consistent(s_m, waist_width_159w).
evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_5)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

% @attr waist_width_162
% @type numeric
% @canonical false
% @original_name Waist width 162cm
% @unit cm
% @values v26_0=26.0 unk_waist_width_162=Unknown
% @importance 0.85

0.92::true_val(waist_width_162, v26_0); 0.08::true_val(waist_width_162, unk_waist_width_162).
0.92::acc(s_m, waist_width_162).
measured(s_m, waist_width_162, v26_0).
all_consistent(waist_width_162) :- consistent(s_m, waist_width_162).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v26_0)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr waist_width_162w
% @type numeric
% @canonical false
% @original_name Waist width 162W
% @unit cm
% @values v26_7=26.7 unk_waist_width_162w=Unknown
% @importance 0.85

0.92::true_val(waist_width_162w, v26_7); 0.08::true_val(waist_width_162w, unk_waist_width_162w).
0.92::acc(s_m, waist_width_162w).
measured(s_m, waist_width_162w, v26_7).
all_consistent(waist_width_162w) :- consistent(s_m, waist_width_162w).
evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v26_7)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size (156cm)
% @unit cm
% @values v30_1_29_8=30.1/29.8 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.92::true_val(tip_tail_width_size, v30_1_29_8); 0.08::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.92::acc(s_m, tip_tail_width_size).
measured(s_m, tip_tail_width_size, v30_1_29_8).
all_consistent(tip_tail_width_size) :- consistent(s_m, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_1_29_8)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_153
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (153cm)
% @unit cm
% @values v29_8_29_5=29.8/29.5 unk_tip_tail_width_size_153=Unknown
% @importance 0.85

0.92::true_val(tip_tail_width_size_153, v29_8_29_5); 0.08::true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153).
0.92::acc(s_m, tip_tail_width_size_153).
measured(s_m, tip_tail_width_size_153, v29_8_29_5).
all_consistent(tip_tail_width_size_153) :- consistent(s_m, tip_tail_width_size_153).
evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v29_8_29_5)).
query(true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153)).

% @attr tip_tail_width_size_159
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (159cm)
% @unit cm
% @values v30_4_30_1=30.4/30.1 unk_tip_tail_width_size_159=Unknown
% @importance 0.85

0.92::true_val(tip_tail_width_size_159, v30_4_30_1); 0.08::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).
0.92::acc(s_m, tip_tail_width_size_159).
measured(s_m, tip_tail_width_size_159, v30_4_30_1).
all_consistent(tip_tail_width_size_159) :- consistent(s_m, tip_tail_width_size_159).
evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v30_4_30_1)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

% @attr tip_tail_width_size_159w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (159W)
% @unit cm
% @values v31_2_30_9=31.2/30.9 unk_tip_tail_width_size_159w=Unknown
% @importance 0.85

0.92::true_val(tip_tail_width_size_159w, v31_2_30_9); 0.08::true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w).
0.92::acc(s_m, tip_tail_width_size_159w).
measured(s_m, tip_tail_width_size_159w, v31_2_30_9).
all_consistent(tip_tail_width_size_159w) :- consistent(s_m, tip_tail_width_size_159w).
evidence(all_consistent(tip_tail_width_size_159w)).
query(true_val(tip_tail_width_size_159w, v31_2_30_9)).
query(true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w)).

% @attr tip_tail_width_size_162
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (162cm)
% @unit cm
% @values v30_7_30_4=30.7/30.4 unk_tip_tail_width_size_162=Unknown
% @importance 0.85

0.92::true_val(tip_tail_width_size_162, v30_7_30_4); 0.08::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).
0.92::acc(s_m, tip_tail_width_size_162).
measured(s_m, tip_tail_width_size_162, v30_7_30_4).
all_consistent(tip_tail_width_size_162) :- consistent(s_m, tip_tail_width_size_162).
evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v30_7_30_4)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

% @attr tip_tail_width_size_162w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (162W)
% @unit cm
% @values v31_5_31_2=31.5/31.2 unk_tip_tail_width_size_162w=Unknown
% @importance 0.85

0.92::true_val(tip_tail_width_size_162w, v31_5_31_2); 0.08::true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w).
0.92::acc(s_m, tip_tail_width_size_162w).
measured(s_m, tip_tail_width_size_162w, v31_5_31_2).
all_consistent(tip_tail_width_size_162w) :- consistent(s_m, tip_tail_width_size_162w).
evidence(all_consistent(tip_tail_width_size_162w)).
query(true_val(tip_tail_width_size_162w, v31_5_31_2)).
query(true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size (156cm)
% @unit m
% @values v7_3=7.3 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.92::true_val(sidecut_radius_size, v7_3); 0.08::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.92::acc(s_m, sidecut_radius_size).
measured(s_m, sidecut_radius_size, v7_3).
all_consistent(sidecut_radius_size) :- consistent(s_m, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_3)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_153
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (153cm)
% @unit m
% @values v6_9=6.9 unk_sidecut_radius_size_153=Unknown
% @importance 0.85

0.92::true_val(sidecut_radius_size_153, v6_9); 0.08::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).
0.92::acc(s_m, sidecut_radius_size_153).
measured(s_m, sidecut_radius_size_153, v6_9).
all_consistent(sidecut_radius_size_153) :- consistent(s_m, sidecut_radius_size_153).
evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v6_9)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @unit m
% @values v7_7=7.7 unk_sidecut_radius_size_159=Unknown
% @importance 0.85

0.92::true_val(sidecut_radius_size_159, v7_7); 0.08::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).
0.92::acc(s_m, sidecut_radius_size_159).
measured(s_m, sidecut_radius_size_159, v7_7).
all_consistent(sidecut_radius_size_159) :- consistent(s_m, sidecut_radius_size_159).
evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v7_7)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr sidecut_radius_size_159w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (159W)
% @unit m
% @values v7_7=7.7 unk_sidecut_radius_size_159w=Unknown
% @importance 0.85

0.92::true_val(sidecut_radius_size_159w, v7_7); 0.08::true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w).
0.92::acc(s_m, sidecut_radius_size_159w).
measured(s_m, sidecut_radius_size_159w, v7_7).
all_consistent(sidecut_radius_size_159w) :- consistent(s_m, sidecut_radius_size_159w).
evidence(all_consistent(sidecut_radius_size_159w)).
query(true_val(sidecut_radius_size_159w, v7_7)).
query(true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w)).

% @attr sidecut_radius_size_162
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @unit m
% @values v8_1=8.1 unk_sidecut_radius_size_162=Unknown
% @importance 0.85

0.92::true_val(sidecut_radius_size_162, v8_1); 0.08::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).
0.92::acc(s_m, sidecut_radius_size_162).
measured(s_m, sidecut_radius_size_162, v8_1).
all_consistent(sidecut_radius_size_162) :- consistent(s_m, sidecut_radius_size_162).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_1)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr sidecut_radius_size_162w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (162W)
% @unit m
% @values v8_1=8.1 unk_sidecut_radius_size_162w=Unknown
% @importance 0.85

0.92::true_val(sidecut_radius_size_162w, v8_1); 0.08::true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w).
0.92::acc(s_m, sidecut_radius_size_162w).
measured(s_m, sidecut_radius_size_162w, v8_1).
all_consistent(sidecut_radius_size_162w) :- consistent(s_m, sidecut_radius_size_162w).
evidence(all_consistent(sidecut_radius_size_162w)).
query(true_val(sidecut_radius_size_162w, v8_1)).
query(true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size (156cm)
% @unit cm
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.92::true_val(stance_width_range_size, v56_0); 0.08::true_val(stance_width_range_size, unk_stance_width_range_size).
0.92::acc(s_m, stance_width_range_size).
measured(s_m, stance_width_range_size, v56_0).
all_consistent(stance_width_range_size) :- consistent(s_m, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_153
% @type numeric
% @canonical false
% @original_name stance_width_range_size (153cm)
% @unit cm
% @values v55_0=55.0 unk_stance_width_range_size_153=Unknown
% @importance 0.85

0.92::true_val(stance_width_range_size_153, v55_0); 0.08::true_val(stance_width_range_size_153, unk_stance_width_range_size_153).
0.92::acc(s_m, stance_width_range_size_153).
measured(s_m, stance_width_range_size_153, v55_0).
all_consistent(stance_width_range_size_153) :- consistent(s_m, stance_width_range_size_153).
evidence(all_consistent(stance_width_range_size_153)).
query(true_val(stance_width_range_size_153, v55_0)).
query(true_val(stance_width_range_size_153, unk_stance_width_range_size_153)).

% @attr stance_width_range_size_159
% @type numeric
% @canonical false
% @original_name stance_width_range_size (159cm)
% @unit cm
% @values v57_0=57.0 unk_stance_width_range_size_159=Unknown
% @importance 0.85

0.92::true_val(stance_width_range_size_159, v57_0); 0.08::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).
0.92::acc(s_m, stance_width_range_size_159).
measured(s_m, stance_width_range_size_159, v57_0).
all_consistent(stance_width_range_size_159) :- consistent(s_m, stance_width_range_size_159).
evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v57_0)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

% @attr stance_width_range_size_159w
% @type numeric
% @canonical false
% @original_name stance_width_range_size (159W)
% @unit cm
% @values v57_0=57.0 unk_stance_width_range_size_159w=Unknown
% @importance 0.85

0.92::true_val(stance_width_range_size_159w, v57_0); 0.08::true_val(stance_width_range_size_159w, unk_stance_width_range_size_159w).
0.92::acc(s_m, stance_width_range_size_159w).
measured(s_m, stance_width_range_size_159w, v57_0).
all_consistent(stance_width_range_size_159w) :- consistent(s_m, stance_width_range_size_159w).
evidence(all_consistent(stance_width_range_size_159w)).
query(true_val(stance_width_range_size_159w, v57_0)).
query(true_val(stance_width_range_size_159w, unk_stance_width_range_size_159w)).

% @attr stance_width_range_size_162
% @type numeric
% @canonical false
% @original_name stance_width_range_size (162cm)
% @unit cm
% @values v58_0=58.0 unk_stance_width_range_size_162=Unknown
% @importance 0.85

0.92::true_val(stance_width_range_size_162, v58_0); 0.08::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).
0.92::acc(s_m, stance_width_range_size_162).
measured(s_m, stance_width_range_size_162, v58_0).
all_consistent(stance_width_range_size_162) :- consistent(s_m, stance_width_range_size_162).
evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v58_0)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

% @attr stance_width_range_size_162w
% @type numeric
% @canonical false
% @original_name stance_width_range_size (162W)
% @unit cm
% @values v58_0=58.0 unk_stance_width_range_size_162w=Unknown
% @importance 0.85

0.92::true_val(stance_width_range_size_162w, v58_0); 0.08::true_val(stance_width_range_size_162w, unk_stance_width_range_size_162w).
0.92::acc(s_m, stance_width_range_size_162w).
measured(s_m, stance_width_range_size_162w, v58_0).
all_consistent(stance_width_range_size_162w) :- consistent(s_m, stance_width_range_size_162w).
evidence(all_consistent(stance_width_range_size_162w)).
query(true_val(stance_width_range_size_162w, v58_0)).
query(true_val(stance_width_range_size_162w, unk_stance_width_range_size_162w)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (156cm)
% @unit kg
% @values w60_95=60-95kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.92::true_val(recommended_weight_range_size, w60_95); 0.08::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.92::acc(s_m, recommended_weight_range_size).
measured(s_m, recommended_weight_range_size, w60_95).
all_consistent(recommended_weight_range_size) :- consistent(s_m, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w60_95)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_153
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (153cm)
% @unit kg
% @values w60_90=60-90kg unk_recommended_weight_range_size_153=Unknown
% @importance 0.85

0.92::true_val(recommended_weight_range_size_153, w60_90); 0.08::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).
0.92::acc(s_m, recommended_weight_range_size_153).
measured(s_m, recommended_weight_range_size_153, w60_90).
all_consistent(recommended_weight_range_size_153) :- consistent(s_m, recommended_weight_range_size_153).
evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w60_90)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @unit kg
% @values w70_100=70-100kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.85

0.92::true_val(recommended_weight_range_size_159, w70_100); 0.08::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).
0.92::acc(s_m, recommended_weight_range_size_159).
measured(s_m, recommended_weight_range_size_159, w70_100).
all_consistent(recommended_weight_range_size_159) :- consistent(s_m, recommended_weight_range_size_159).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w70_100)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr recommended_weight_range_size_159w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159W)
% @unit kg
% @values w70_105=70-105kg unk_recommended_weight_range_size_159w=Unknown
% @importance 0.85

0.92::true_val(recommended_weight_range_size_159w, w70_105); 0.08::true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w).
0.92::acc(s_m, recommended_weight_range_size_159w).
measured(s_m, recommended_weight_range_size_159w, w70_105).
all_consistent(recommended_weight_range_size_159w) :- consistent(s_m, recommended_weight_range_size_159w).
evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, w70_105)).
query(true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w)).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @unit kg
% @values w70_100=70-100kg unk_recommended_weight_range_size_162=Unknown
% @importance 0.85

0.92::true_val(recommended_weight_range_size_162, w70_100); 0.08::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).
0.92::acc(s_m, recommended_weight_range_size_162).
measured(s_m, recommended_weight_range_size_162, w70_100).
all_consistent(recommended_weight_range_size_162) :- consistent(s_m, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w70_100)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr recommended_weight_range_size_162w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (162W)
% @unit kg
% @values w70_105=70-105kg unk_recommended_weight_range_size_162w=Unknown
% @importance 0.85

0.92::true_val(recommended_weight_range_size_162w, w70_105); 0.08::true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w).
0.92::acc(s_m, recommended_weight_range_size_162w).
measured(s_m, recommended_weight_range_size_162w, w70_105).
all_consistent(recommended_weight_range_size_162w) :- consistent(s_m, recommended_weight_range_size_162w).
evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, w70_105)).
query(true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w)).

% @attr boot_size_recommendations
% @type categorical
% @canonical false
% @original_name Boot size recommendations
% @values full_range=146_6to7_150_7to8_153_8p5to9_156_9to9p5_159_9p5to10p5_162_10to10p5_159w_10p5to11p5_162w_11to12_165w_12to13 unk_boot_size_recommendations=Unknown
% @importance 0.85

0.90::true_val(boot_size_recommendations, full_range); 0.10::true_val(boot_size_recommendations, unk_boot_size_recommendations).
0.90::acc(s_m, boot_size_recommendations).
measured(s_m, boot_size_recommendations, full_range).
all_consistent(boot_size_recommendations) :- consistent(s_m, boot_size_recommendations).
evidence(all_consistent(boot_size_recommendations)).
query(true_val(boot_size_recommendations, full_range)).
query(true_val(boot_size_recommendations, unk_boot_size_recommendations)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values heavier_than_normal=Heavier_than_normal feels_normal=Feels_Normal very_lightweight=Very_lightweight
% @importance 0.87

0.25::true_val(board_weight_grams, heavier_than_normal); 0.40::true_val(board_weight_grams, feels_normal); 0.35::true_val(board_weight_grams, very_lightweight).
0.78::acc(s12, board_weight_grams).
0.80::acc(s14, board_weight_grams).
0.75::acc(s17, board_weight_grams).
measured(s12, board_weight_grams, heavier_than_normal).
measured(s14, board_weight_grams, feels_normal).
measured(s17, board_weight_grams, very_lightweight).
all_consistent(board_weight_grams) :-
    consistent(s12, board_weight_grams),
    consistent(s14, board_weight_grams),
    consistent(s17, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, heavier_than_normal)).
query(true_val(board_weight_grams, feels_normal)).
query(true_val(board_weight_grams, very_lightweight)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v699_95=699.95 v649=649.0
% @importance 0.91

0.75::true_val(price_usd_msrp, v699_95); 0.25::true_val(price_usd_msrp, v649).
0.93::acc(s1, price_usd_msrp).
0.82::acc(s12, price_usd_msrp).
0.72::acc(s14, price_usd_msrp).
measured(s1, price_usd_msrp, v699_95).
measured(s12, price_usd_msrp, v699_95).
measured(s14, price_usd_msrp, v649).
all_consistent(price_usd_msrp) :-
    consistent(s1, price_usd_msrp),
    consistent(s12, price_usd_msrp),
    consistent(s14, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v699_95)).
query(true_val(price_usd_msrp, v649)).

% @attr price_usd_msrp_historical
% @type numeric
% @canonical false
% @original_name USD MSRP historical
% @unit USD
% @values v650=650.0 unk_price_usd_msrp_historical=Unknown
% @importance 0.85

0.82::true_val(price_usd_msrp_historical, v650); 0.18::true_val(price_usd_msrp_historical, unk_price_usd_msrp_historical).
0.80::acc(s5, price_usd_msrp_historical).
measured(s5, price_usd_msrp_historical, v650).
all_consistent(price_usd_msrp_historical) :- consistent(s5, price_usd_msrp_historical).
evidence(all_consistent(price_usd_msrp_historical)).
query(true_val(price_usd_msrp_historical, v650)).
query(true_val(price_usd_msrp_historical, unk_price_usd_msrp_historical)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant (discounted)
% @unit AUD
% @values v759_99=759.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.92::true_val(price_aud_merchant, v759_99); 0.08::true_val(price_aud_merchant, unk_price_aud_merchant).
0.94::acc(s_m, price_aud_merchant).
measured(s_m, price_aud_merchant, v759_99).
all_consistent(price_aud_merchant) :- consistent(s_m, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v759_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_aud_merchant_rrp
% @type numeric
% @canonical false
% @original_name price_aud_merchant (RRP)
% @unit AUD
% @values v949_99=949.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.85

0.92::true_val(price_aud_merchant_rrp, v949_99); 0.08::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).
0.94::acc(s_m, price_aud_merchant_rrp).
measured(s_m, price_aud_merchant_rrp, v949_99).
all_consistent(price_aud_merchant_rrp) :- consistent(s_m, price_aud_merchant_rrp).
evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v949_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v699_95=699.95 unk_price_usd_evo=Unknown
% @importance 0.93

0.93::true_val(price_usd_evo, v699_95); 0.07::true_val(price_usd_evo, unk_price_usd_evo).
0.93::acc(s1, price_usd_evo).
0.88::acc(s14, price_usd_evo).
measured(s1, price_usd_evo, v699_95).
measured(s14, price_usd_evo, v699_95).
all_consistent(price_usd_evo) :-
    consistent(s1, price_usd_evo),
    consistent(s14, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v699_95)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_rei
% @type numeric
% @canonical true
% @original_name price_usd_rei
% @unit USD
% @values v699_95=699.95 unk_price_usd_rei=Unknown
% @importance 0.90

0.93::true_val(price_usd_rei, v699_95); 0.07::true_val(price_usd_rei, unk_price_usd_rei).
0.90::acc(s3, price_usd_rei).
0.88::acc(s14, price_usd_rei).
measured(s3, price_usd_rei, v699_95).
measured(s14, price_usd_rei, v699_95).
all_consistent(price_usd_rei) :-
    consistent(s3, price_usd_rei),
    consistent(s14, price_usd_rei).
evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v699_95)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v699_95=699.95 unk_price_usd_backcountry=Unknown
% @importance 0.90

0.88::true_val(price_usd_backcountry, v699_95); 0.12::true_val(price_usd_backcountry, unk_price_usd_backcountry).
0.88::acc(s14, price_usd_backcountry).
measured(s14, price_usd_backcountry, v699_95).
all_consistent(price_usd_backcountry) :- consistent(s14, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v699_95)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_the_house_sale
% @type numeric
% @canonical false
% @original_name Price at The House (USD, older model on sale)
% @unit USD
% @values v489_95=489.95 unk_price_usd_the_house_sale=Unknown
% @importance 0.75

0.75::true_val(price_usd_the_house_sale, v489_95); 0.25::true_val(price_usd_the_house_sale, unk_price_usd_the_house_sale).
0.75::acc(s9, price_usd_the_house_sale).
measured(s9, price_usd_the_house_sale, v489_95).
all_consistent(price_usd_the_house_sale) :- consistent(s9, price_usd_the_house_sale).
evidence(all_consistent(price_usd_the_house_sale)).
query(true_val(price_usd_the_house_sale, v489_95)).
query(true_val(price_usd_the_house_sale, unk_price_usd_the_house_sale)).

% @attr price_usd_the_house_2026
% @type numeric
% @canonical false
% @original_name Price at The House (USD, 2026)
% @unit USD
% @values v699_95=699.95 unk_price_usd_the_house_2026=Unknown
% @importance 0.90

0.82::true_val(price_usd_the_house_2026, v699_95); 0.18::true_val(price_usd_the_house_2026, unk_price_usd_the_house_2026).
0.82::acc(s14, price_usd_the_house_2026).
measured(s14, price_usd_the_house_2026, v699_95).
all_consistent(price_usd_the_house_2026) :- consistent(s14, price_usd_the_house_2026).
evidence(all_consistent(price_usd_the_house_2026)).
query(true_val(price_usd_the_house_2026, v699_95)).
query(true_val(price_usd_the_house_2026, unk_price_usd_the_house_2026)).

% @attr price_usd_boone
% @type numeric
% @canonical false
% @original_name Price at Boone Mountain Sports (USD)
% @unit USD
% @values v699_95=699.95 unk_price_usd_boone=Unknown
% @importance 0.55

0.78::true_val(price_usd_boone, v699_95); 0.22::true_val(price_usd_boone, unk_price_usd_boone).
0.78::acc(s20, price_usd_boone).
measured(s20, price_usd_boone, v699_95).
all_consistent(price_usd_boone) :- consistent(s20, price_usd_boone).
evidence(all_consistent(price_usd_boone)).
query(true_val(price_usd_boone, v699_95)).
query(true_val(price_usd_boone, unk_price_usd_boone)).

% @attr price_usd_shred_shop
% @type numeric
% @canonical false
% @original_name Price at Shred Shop (USD)
% @unit USD
% @values v699_95=699.95 unk_price_usd_shred_shop=Unknown
% @importance 0.60

0.80::true_val(price_usd_shred_shop, v699_95); 0.20::true_val(price_usd_shred_shop, unk_price_usd_shred_shop).
0.80::acc(s16, price_usd_shred_shop).
measured(s16, price_usd_shred_shop, v699_95).
all_consistent(price_usd_shred_shop) :- consistent(s16, price_usd_shred_shop).
evidence(all_consistent(price_usd_shred_shop)).
query(true_val(price_usd_shred_shop, v699_95)).
query(true_val(price_usd_shred_shop, unk_price_usd_shred_shop)).

% @attr price_usd_oge_split
% @type numeric
% @canonical false
% @original_name Price at Outdoor Gear Exchange (USD, 2026 split)
% @unit USD
% @values v999_95=999.95 unk_price_usd_oge_split=Unknown
% @importance 0.90

0.85::true_val(price_usd_oge_split, v999_95); 0.15::true_val(price_usd_oge_split, unk_price_usd_oge_split).
0.85::acc(s14, price_usd_oge_split).
measured(s14, price_usd_oge_split, v999_95).
all_consistent(price_usd_oge_split) :- consistent(s14, price_usd_oge_split).
evidence(all_consistent(price_usd_oge_split)).
query(true_val(price_usd_oge_split, v999_95)).
query(true_val(price_usd_oge_split, unk_price_usd_oge_split)).

% @attr price_usd_oge_sale
% @type numeric
% @canonical false
% @original_name Price at Outdoor Gear Exchange (USD, sale on older model)
% @unit USD
% @values v454_97=454.97 unk_price_usd_oge_sale=Unknown
% @importance 0.90

0.85::true_val(price_usd_oge_sale, v454_97); 0.15::true_val(price_usd_oge_sale, unk_price_usd_oge_sale).
0.85::acc(s14, price_usd_oge_sale).
measured(s14, price_usd_oge_sale, v454_97).
all_consistent(price_usd_oge_sale) :- consistent(s14, price_usd_oge_sale).
evidence(all_consistent(price_usd_oge_sale)).
query(true_val(price_usd_oge_sale, v454_97)).
query(true_val(price_usd_oge_sale, unk_price_usd_oge_sale)).

% @attr price_cad_prfo
% @type numeric
% @canonical true
% @original_name price_cad_prfo (sale)
% @unit CAD
% @values v489_99=489.99 unk_price_cad_prfo=Unknown
% @importance 0.90

0.85::true_val(price_cad_prfo, v489_99); 0.15::true_val(price_cad_prfo, unk_price_cad_prfo).
0.85::acc(s14, price_cad_prfo).
measured(s14, price_cad_prfo, v489_99).
all_consistent(price_cad_prfo) :- consistent(s14, price_cad_prfo).
evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v489_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_cad_prfo_full
% @type numeric
% @canonical false
% @original_name price_cad_prfo (full price)
% @unit CAD
% @values v769_99=769.99 unk_price_cad_prfo_full=Unknown
% @importance 0.90

0.85::true_val(price_cad_prfo_full, v769_99); 0.15::true_val(price_cad_prfo_full, unk_price_cad_prfo_full).
0.85::acc(s14, price_cad_prfo_full).
measured(s14, price_cad_prfo_full, v769_99).
all_consistent(price_cad_prfo_full) :- consistent(s14, price_cad_prfo_full).
evidence(all_consistent(price_cad_prfo_full)).
query(true_val(price_cad_prfo_full, v769_99)).
query(true_val(price_cad_prfo_full, unk_price_cad_prfo_full)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v429=429.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.90

0.85::true_val(price_eur_blue_tomato, v429); 0.15::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
0.85::acc(s14, price_eur_blue_tomato).
measured(s14, price_eur_blue_tomato, v429).
all_consistent(price_eur_blue_tomato) :- consistent(s14, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v429)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @unit GBP
% @values v385=385.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.90

0.85::true_val(price_gbp_blue_tomato_uk, v385); 0.15::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).
0.85::acc(s14, price_gbp_blue_tomato_uk).
measured(s14, price_gbp_blue_tomato_uk, v385).
all_consistent(price_gbp_blue_tomato_uk) :- consistent(s14, price_gbp_blue_tomato_uk).
evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v385)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_eur_snowcountry
% @type numeric
% @canonical false
% @original_name Price at SnowCountry EU (EUR)
% @unit EUR
% @values v449=449.0 unk_price_eur_snowcountry=Unknown
% @importance 0.90

0.85::true_val(price_eur_snowcountry, v449); 0.15::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).
0.85::acc(s14, price_eur_snowcountry).
measured(s14, price_eur_snowcountry, v449).
all_consistent(price_eur_snowcountry) :- consistent(s14, price_eur_snowcountry).
evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v449)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (evo)
% @values in_stock=In_stock unk_availability_status=Unknown
% @importance 0.95

0.90::true_val(availability_status, in_stock); 0.10::true_val(availability_status, unk_availability_status).
0.90::acc(s1, availability_status).
measured(s1, availability_status, in_stock).
all_consistent(availability_status) :- consistent(s1, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_rei
% @type categorical
% @canonical false
% @original_name Availability at REI
% @values not_available=Not_available_at_time_of_check unk_availability_rei=Unknown
% @importance 0.90

0.83::true_val(availability_rei, not_available); 0.17::true_val(availability_rei, unk_availability_rei).
0.82::acc(s3, availability_rei).
measured(s3, availability_rei, not_available).
all_consistent(availability_rei) :- consistent(s3, availability_rei).
evidence(all_consistent(availability_rei)).
query(true_val(availability_rei, not_available)).
query(true_val(availability_rei, unk_availability_rei)).

% @attr availability_shred_shop
% @type categorical
% @canonical false
% @original_name Availability at Shred Shop
% @values closeout_some_sold_out=Closeout_some_sizes_sold_out unk_availability_shred_shop=Unknown
% @importance 0.60

0.78::true_val(availability_shred_shop, closeout_some_sold_out); 0.22::true_val(availability_shred_shop, unk_availability_shred_shop).
0.78::acc(s16, availability_shred_shop).
measured(s16, availability_shred_shop, closeout_some_sold_out).
all_consistent(availability_shred_shop) :- consistent(s16, availability_shred_shop).
evidence(all_consistent(availability_shred_shop)).
query(true_val(availability_shred_shop, closeout_some_sold_out)).
query(true_val(availability_shred_shop, unk_availability_shred_shop)).

% @attr availability_general
% @type categorical
% @canonical false
% @original_name availability_status (general)
% @values available_at_shops=Available_at_core_shops_and_salomon_com unk_availability_general=Unknown
% @importance 0.85

0.82::true_val(availability_general, available_at_shops); 0.18::true_val(availability_general, unk_availability_general).
0.82::acc(s5, availability_general).
measured(s5, availability_general, available_at_shops).
all_consistent(availability_general) :- consistent(s5, availability_general).
evidence(all_consistent(availability_general)).
query(true_val(availability_general, available_at_shops)).
query(true_val(availability_general, unk_availability_general)).

% @attr snowboard_mag_platinum_pick
% @type categorical
% @canonical false
% @original_name Snowboard Magazine Platinum Pick 2026
% @values a_plus_platinum=A_plus_2026_Platinum_Pick unk_snowboard_mag_platinum_pick=Unknown
% @importance 0.88

0.88::true_val(snowboard_mag_platinum_pick, a_plus_platinum); 0.12::true_val(snowboard_mag_platinum_pick, unk_snowboard_mag_platinum_pick).
0.88::acc(s21, snowboard_mag_platinum_pick).
measured(s21, snowboard_mag_platinum_pick, a_plus_platinum).
all_consistent(snowboard_mag_platinum_pick) :- consistent(s21, snowboard_mag_platinum_pick).
evidence(all_consistent(snowboard_mag_platinum_pick)).
query(true_val(snowboard_mag_platinum_pick, a_plus_platinum)).
query(true_val(snowboard_mag_platinum_pick, unk_snowboard_mag_platinum_pick)).

% @attr snowboard_mag_update
% @type categorical
% @canonical false
% @original_name Snowboard Magazine update
% @values beefed_up_balanced=Beefed_up_powerfully_playful_incredibly_balanced unk_snowboard_mag_update=Unknown
% @importance 0.88

0.85::true_val(snowboard_mag_update, beefed_up_balanced); 0.15::true_val(snowboard_mag_update, unk_snowboard_mag_update).
0.85::acc(s21, snowboard_mag_update).
measured(s21, snowboard_mag_update, beefed_up_balanced).
all_consistent(snowboard_mag_update) :- consistent(s21, snowboard_mag_update).
evidence(all_consistent(snowboard_mag_update)).
query(true_val(snowboard_mag_update, beefed_up_balanced)).
query(true_val(snowboard_mag_update, unk_snowboard_mag_update)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name SnowboardingProfiles rating
% @unit /100
% @values v87_2=87.2 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.90

0.82::true_val(overall_rating_snowboardingprofiles, v87_2); 0.18::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).
0.83::acc(s12, overall_rating_snowboardingprofiles).
measured(s12, overall_rating_snowboardingprofiles, v87_2).
all_consistent(overall_rating_snowboardingprofiles) :- consistent(s12, overall_rating_snowboardingprofiles).
evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v87_2)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr ranking_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name SnowboardingProfiles ranking
% @values third_of_16=3rd_equal_out_of_16_freeride unk_ranking_snowboardingprofiles=Unknown
% @importance 0.90

0.82::true_val(ranking_snowboardingprofiles, third_of_16); 0.18::true_val(ranking_snowboardingprofiles, unk_ranking_snowboardingprofiles).
0.83::acc(s12, ranking_snowboardingprofiles).
measured(s12, ranking_snowboardingprofiles, third_of_16).
all_consistent(ranking_snowboardingprofiles) :- consistent(s12, ranking_snowboardingprofiles).
evidence(all_consistent(ranking_snowboardingprofiles)).
query(true_val(ranking_snowboardingprofiles, third_of_16)).
query(true_val(ranking_snowboardingprofiles, unk_ranking_snowboardingprofiles)).

% @attr user_review_forum
% @type numeric
% @canonical true
% @original_name user_review_forum (REI)
% @unit /5
% @values v1_0=1.0 unk_user_review_forum=Unknown
% @importance 0.90

0.60::true_val(user_review_forum, v1_0); 0.40::true_val(user_review_forum, unk_user_review_forum).
0.55::acc(s3, user_review_forum).
measured(s3, user_review_forum, v1_0).
all_consistent(user_review_forum) :- consistent(s3, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, v1_0)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_rating_the_house
% @type numeric
% @canonical false
% @original_name The House user rating
% @unit /5
% @values v5_0=5.0 unk_user_rating_the_house=Unknown
% @importance 0.75

0.72::true_val(user_rating_the_house, v5_0); 0.28::true_val(user_rating_the_house, unk_user_rating_the_house).
0.70::acc(s9, user_rating_the_house).
measured(s9, user_rating_the_house, v5_0).
all_consistent(user_rating_the_house) :- consistent(s9, user_rating_the_house).
evidence(all_consistent(user_rating_the_house)).
query(true_val(user_rating_the_house, v5_0)).
query(true_val(user_rating_the_house, unk_user_rating_the_house)).

% @attr carving_performance
% @type categorical
% @canonical false
% @original_name Carving
% @values good_locked_in=Good_locked_in_holds_carve_high_speeds unk_carving_performance=Unknown
% @importance 0.86

0.88::true_val(carving_performance, good_locked_in); 0.12::true_val(carving_performance, unk_carving_performance).
0.83::acc(s12, carving_performance).
0.78::acc(s17, carving_performance).
measured(s12, carving_performance, good_locked_in).
measured(s17, carving_performance, good_locked_in).
all_consistent(carving_performance) :-
    consistent(s12, carving_performance),
    consistent(s17, carving_performance).
evidence(all_consistent(carving_performance)).
query(true_val(carving_performance, good_locked_in)).
query(true_val(carving_performance, unk_carving_performance)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good=Good_edge_hold unk_edge_hold=Unknown
% @importance 0.90

0.88::true_val(edge_hold, good); 0.12::true_val(edge_hold, unk_edge_hold).
0.83::acc(s14, edge_hold).
0.82::acc(s12, edge_hold).
measured(s14, edge_hold, good).
measured(s12, edge_hold, good).
all_consistent(edge_hold) :-
    consistent(s14, edge_hold),
    consistent(s12, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr speed_stability
% @type categorical
% @canonical false
% @original_name Speed/stability
% @values fast_stable=Fast_stable_glides_nicely unk_speed_stability=Unknown
% @importance 0.90

0.83::true_val(speed_stability, fast_stable); 0.17::true_val(speed_stability, unk_speed_stability).
0.83::acc(s12, speed_stability).
measured(s12, speed_stability, fast_stable).
all_consistent(speed_stability) :- consistent(s12, speed_stability).
evidence(all_consistent(speed_stability)).
query(true_val(speed_stability, fast_stable)).
query(true_val(speed_stability, unk_speed_stability)).

% @attr speed_preference
% @type categorical
% @canonical false
% @original_name Speed preference
% @values best_at_moderate_plus=Best_at_moderate_plus_speeds unk_speed_preference=Unknown
% @importance 0.90

0.83::true_val(speed_preference, best_at_moderate_plus); 0.17::true_val(speed_preference, unk_speed_preference).
0.83::acc(s12, speed_preference).
measured(s12, speed_preference, best_at_moderate_plus).
all_consistent(speed_preference) :- consistent(s12, speed_preference).
evidence(all_consistent(speed_preference)).
query(true_val(speed_preference, best_at_moderate_plus)).
query(true_val(speed_preference, unk_speed_preference)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values damp_8_10=8_of_10_damp not_dampest=Not_the_dampest pretty_damp=Pretty_damp_locked_in
% @importance 0.87

0.35::true_val(chatter_performance, damp_8_10); 0.30::true_val(chatter_performance, not_dampest); 0.35::true_val(chatter_performance, pretty_damp).
0.82::acc(s12, chatter_performance).
0.80::acc(s14, chatter_performance).
0.75::acc(s17, chatter_performance).
measured(s12, chatter_performance, damp_8_10).
measured(s14, chatter_performance, not_dampest).
measured(s17, chatter_performance, pretty_damp).
all_consistent(chatter_performance) :-
    consistent(s12, chatter_performance),
    consistent(s14, chatter_performance),
    consistent(s17, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, damp_8_10)).
query(true_val(chatter_performance, not_dampest)).
query(true_val(chatter_performance, pretty_damp)).

% @attr crud_performance
% @type categorical
% @canonical false
% @original_name Crud performance
% @values smooth_damp=Smashed_through_crud_smoothly_damp unk_crud_performance=Unknown
% @importance 0.90

0.83::true_val(crud_performance, smooth_damp); 0.17::true_val(crud_performance, unk_crud_performance).
0.83::acc(s12, crud_performance).
measured(s12, crud_performance, smooth_damp).
all_consistent(crud_performance) :- consistent(s12, crud_performance).
evidence(all_consistent(crud_performance)).
query(true_val(crud_performance, smooth_damp)).
query(true_val(crud_performance, unk_crud_performance)).

% @attr powder_performance
% @type categorical
% @canonical false
% @original_name Powder performance
% @values floats_well=Tapered_design_floats_well_loosens_turning unk_powder_performance=Unknown
% @importance 0.88

0.88::true_val(powder_performance, floats_well); 0.12::true_val(powder_performance, unk_powder_performance).
0.83::acc(s12, powder_performance).
0.82::acc(s5, powder_performance).
measured(s12, powder_performance, floats_well).
measured(s5, powder_performance, floats_well).
all_consistent(powder_performance) :-
    consistent(s12, powder_performance),
    consistent(s5, powder_performance).
evidence(all_consistent(powder_performance)).
query(true_val(powder_performance, floats_well)).
query(true_val(powder_performance, unk_powder_performance)).

% @attr pop
% @type categorical
% @canonical true
% @original_name Pop
% @values decent_good_accessible=Decent_good_accessible_pop unk_pop=Unknown
% @importance 0.90

0.87::true_val(pop, decent_good_accessible); 0.13::true_val(pop, unk_pop).
0.82::acc(s12, pop).
0.83::acc(s14, pop).
measured(s12, pop, decent_good_accessible).
measured(s14, pop, decent_good_accessible).
all_consistent(pop) :-
    consistent(s12, pop),
    consistent(s14, pop).
evidence(all_consistent(pop)).
query(true_val(pop, decent_good_accessible)).
query(true_val(pop, unk_pop)).

% @attr buttering
% @type categorical
% @canonical false
% @original_name Buttering
% @values easy_butter=Board_you_can_easily_butter unk_buttering=Unknown
% @importance 0.90

0.82::true_val(buttering, easy_butter); 0.18::true_val(buttering, unk_buttering).
0.83::acc(s14, buttering).
measured(s14, buttering, easy_butter).
all_consistent(buttering) :- consistent(s14, buttering).
evidence(all_consistent(buttering)).
query(true_val(buttering, easy_butter)).
query(true_val(buttering, unk_buttering)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast_great_initiation unk_turn_initiation_performance=Unknown
% @importance 0.86

0.87::true_val(turn_initiation_performance, medium_fast); 0.13::true_val(turn_initiation_performance, unk_turn_initiation_performance).
0.83::acc(s14, turn_initiation_performance).
0.78::acc(s17, turn_initiation_performance).
measured(s14, turn_initiation_performance, medium_fast).
measured(s17, turn_initiation_performance, medium_fast).
all_consistent(turn_initiation_performance) :-
    consistent(s14, turn_initiation_performance),
    consistent(s17, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.90

0.87::true_val(on_snow_feel_tgr, semi_locked_in); 0.13::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
0.82::acc(s12, on_snow_feel_tgr).
0.83::acc(s14, on_snow_feel_tgr).
measured(s12, on_snow_feel_tgr, semi_locked_in).
measured(s14, on_snow_feel_tgr, semi_locked_in).
all_consistent(on_snow_feel_tgr) :-
    consistent(s12, on_snow_feel_tgr),
    consistent(s14, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values good_for_directional=Good_centered_feel_rides_switch_well_for_directional unk_switch_riding=Unknown
% @importance 0.90

0.85::true_val(switch_riding, good_for_directional); 0.15::true_val(switch_riding, unk_switch_riding).
0.82::acc(s14, switch_riding).
0.80::acc(s12, switch_riding).
measured(s14, switch_riding, good_for_directional).
measured(s12, switch_riding, good_for_directional).
all_consistent(switch_riding) :-
    consistent(s14, switch_riding),
    consistent(s12, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, good_for_directional)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_performance
% @type categorical
% @canonical false
% @original_name Jumps
% @values ok_not_first_choice=OK_for_jumps_not_first_choice unk_jumps_performance=Unknown
% @importance 0.90

0.82::true_val(jumps_performance, ok_not_first_choice); 0.18::true_val(jumps_performance, unk_jumps_performance).
0.82::acc(s12, jumps_performance).
measured(s12, jumps_performance, ok_not_first_choice).
all_consistent(jumps_performance) :- consistent(s12, jumps_performance).
evidence(all_consistent(jumps_performance)).
query(true_val(jumps_performance, ok_not_first_choice)).
query(true_val(jumps_performance, unk_jumps_performance)).

% @attr park_performance
% @type categorical
% @canonical false
% @original_name Park performance (Curated)
% @values possible_not_strength=Possible_but_not_its_strength unk_park_performance=Unknown
% @importance 0.82

0.75::true_val(park_performance, possible_not_strength); 0.25::true_val(park_performance, unk_park_performance).
0.75::acc(s17, park_performance).
measured(s17, park_performance, possible_not_strength).
all_consistent(park_performance) :- consistent(s17, park_performance).
evidence(all_consistent(park_performance)).
query(true_val(park_performance, possible_not_strength)).
query(true_val(park_performance, unk_park_performance)).

% @attr moguls_performance
% @type categorical
% @canonical false
% @original_name Moguls (Curated)
% @values not_favorite_too_stiff=Not_favorite_felt_stiff_for_moguls unk_moguls_performance=Unknown
% @importance 0.82

0.75::true_val(moguls_performance, not_favorite_too_stiff); 0.25::true_val(moguls_performance, unk_moguls_performance).
0.75::acc(s17, moguls_performance).
measured(s17, moguls_performance, not_favorite_too_stiff).
all_consistent(moguls_performance) :- consistent(s17, moguls_performance).
evidence(all_consistent(moguls_performance)).
query(true_val(moguls_performance, not_favorite_too_stiff)).
query(true_val(moguls_performance, unk_moguls_performance)).

% @attr versatility
% @type categorical
% @canonical false
% @original_name Versatility
% @values very_versatile=Very_versatile_directional_float_edge_hold_pop unk_versatility=Unknown
% @importance 0.90

0.85::true_val(versatility, very_versatile); 0.15::true_val(versatility, unk_versatility).
0.83::acc(s14, versatility).
measured(s14, versatility, very_versatile).
all_consistent(versatility) :- consistent(s14, versatility).
evidence(all_consistent(versatility)).
query(true_val(versatility, very_versatile)).
query(true_val(versatility, unk_versatility)).

% @attr comfort
% @type categorical
% @canonical false
% @original_name Comfort
% @values comfortable_easy=Comfortable_easy_to_ride_berms_to_big_mountain unk_comfort=Unknown
% @importance 0.85

0.82::true_val(comfort, comfortable_easy); 0.18::true_val(comfort, unk_comfort).
0.82::acc(s5, comfort).
measured(s5, comfort, comfortable_easy).
all_consistent(comfort) :- consistent(s5, comfort).
evidence(all_consistent(comfort)).
query(true_val(comfort, comfortable_easy)).
query(true_val(comfort, unk_comfort)).

% @attr one_board_quiver
% @type categorical
% @canonical false
% @original_name One-board quiver potential
% @values good_quiver=Good_one_board_quiver unk_one_board_quiver=Unknown
% @importance 0.90

0.82::true_val(one_board_quiver, good_quiver); 0.18::true_val(one_board_quiver, unk_one_board_quiver).
0.83::acc(s14, one_board_quiver).
measured(s14, one_board_quiver, good_quiver).
all_consistent(one_board_quiver) :- consistent(s14, one_board_quiver).
evidence(all_consistent(one_board_quiver)).
query(true_val(one_board_quiver, good_quiver)).
query(true_val(one_board_quiver, unk_one_board_quiver)).

% @attr eco_friendliness
% @type categorical
% @canonical false
% @original_name Eco-friendliness
% @values modicum_sustainability=Built_with_modicum_of_sustainability_bio_recycled unk_eco_friendliness=Unknown
% @importance 0.85

0.82::true_val(eco_friendliness, modicum_sustainability); 0.18::true_val(eco_friendliness, unk_eco_friendliness).
0.82::acc(s5, eco_friendliness).
measured(s5, eco_friendliness, modicum_sustainability).
all_consistent(eco_friendliness) :- consistent(s5, eco_friendliness).
evidence(all_consistent(eco_friendliness)).
query(true_val(eco_friendliness, modicum_sustainability)).
query(true_val(eco_friendliness, unk_eco_friendliness)).

% @attr banked_slalom_performance
% @type categorical
% @canonical false
% @original_name Banked slalom performance
% @values excellent=Raced_three_banked_slaloms_placed_better_than_ever unk_banked_slalom_performance=Unknown
% @importance 0.85

0.82::true_val(banked_slalom_performance, excellent); 0.18::true_val(banked_slalom_performance, unk_banked_slalom_performance).
0.82::acc(s5, banked_slalom_performance).
measured(s5, banked_slalom_performance, excellent).
all_consistent(banked_slalom_performance) :- consistent(s5, banked_slalom_performance).
evidence(all_consistent(banked_slalom_performance)).
query(true_val(banked_slalom_performance, excellent)).
query(true_val(banked_slalom_performance, unk_banked_slalom_performance)).

% @attr slow_speed_weakness
% @type categorical
% @canonical false
% @original_name Slow speed weakness
% @values aggressive_not_playful=More_aggressive_than_playful_not_good_slow_speeds unk_slow_speed_weakness=Unknown
% @importance 0.90

0.83::true_val(slow_speed_weakness, aggressive_not_playful); 0.17::true_val(slow_speed_weakness, unk_slow_speed_weakness).
0.83::acc(s14, slow_speed_weakness).
measured(s14, slow_speed_weakness, aggressive_not_playful).
all_consistent(slow_speed_weakness) :- consistent(s14, slow_speed_weakness).
evidence(all_consistent(slow_speed_weakness)).
query(true_val(slow_speed_weakness, aggressive_not_playful)).
query(true_val(slow_speed_weakness, unk_slow_speed_weakness)).

% @attr uneven_terrain_bounce
% @type categorical
% @canonical false
% @original_name Uneven terrain bounce (The Good Ride)
% @values bucks_in_soft_uneven=Bucks_you_around_in_soft_uneven_snow unk_uneven_terrain_bounce=Unknown
% @importance 0.90

0.82::true_val(uneven_terrain_bounce, bucks_in_soft_uneven); 0.18::true_val(uneven_terrain_bounce, unk_uneven_terrain_bounce).
0.83::acc(s14, uneven_terrain_bounce).
measured(s14, uneven_terrain_bounce, bucks_in_soft_uneven).
all_consistent(uneven_terrain_bounce) :- consistent(s14, uneven_terrain_bounce).
evidence(all_consistent(uneven_terrain_bounce)).
query(true_val(uneven_terrain_bounce, bucks_in_soft_uneven)).
query(true_val(uneven_terrain_bounce, unk_uneven_terrain_bounce)).

% @attr not_ideal_xxl_jumps
% @type categorical
% @canonical false
% @original_name Not ideal for XXL jumps
% @values need_more_stiffness=Might_want_more_stiffness_for_XXL_features unk_not_ideal_xxl_jumps=Unknown
% @importance 0.88

0.85::true_val(not_ideal_xxl_jumps, need_more_stiffness); 0.15::true_val(not_ideal_xxl_jumps, unk_not_ideal_xxl_jumps).
0.85::acc(s21, not_ideal_xxl_jumps).
measured(s21, not_ideal_xxl_jumps, need_more_stiffness).
all_consistent(not_ideal_xxl_jumps) :- consistent(s21, not_ideal_xxl_jumps).
evidence(all_consistent(not_ideal_xxl_jumps)).
query(true_val(not_ideal_xxl_jumps, need_more_stiffness)).
query(true_val(not_ideal_xxl_jumps, unk_not_ideal_xxl_jumps)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values hard_approach_sidehits=Board_feels_hard_on_approach_for_impromptu_sidehits unk_negative_aspect=Unknown
% @importance 0.90

0.82::true_val(negative_aspect, hard_approach_sidehits); 0.18::true_val(negative_aspect, unk_negative_aspect).
0.82::acc(s12, negative_aspect).
measured(s12, negative_aspect, hard_approach_sidehits).
all_consistent(negative_aspect) :- consistent(s12, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, hard_approach_sidehits)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values dancehaul_softer=Similar_to_Dancehaul_softer_flex_more_AM huck_knife_pro=Closest_to_Ultimate_Ride_is_Huck_Knife_Pro
% @importance 0.87

0.55::true_val(comparable_board_same_brand, dancehaul_softer); 0.45::true_val(comparable_board_same_brand, huck_knife_pro).
0.83::acc(s14, comparable_board_same_brand).
0.78::acc(s17, comparable_board_same_brand).
measured(s14, comparable_board_same_brand, dancehaul_softer).
measured(s17, comparable_board_same_brand, huck_knife_pro).
all_consistent(comparable_board_same_brand) :-
    consistent(s14, comparable_board_same_brand),
    consistent(s17, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, dancehaul_softer)).
query(true_val(comparable_board_same_brand, huck_knife_pro)).

% @attr comparable_jones
% @type categorical
% @canonical false
% @original_name Comparison to Jones boards (Curated)
% @values between_flagship_stratos=Between_Jones_Flagship_and_Stratos unk_comparable_jones=Unknown
% @importance 0.82

0.75::true_val(comparable_jones, between_flagship_stratos); 0.25::true_val(comparable_jones, unk_comparable_jones).
0.75::acc(s17, comparable_jones).
measured(s17, comparable_jones, between_flagship_stratos).
all_consistent(comparable_jones) :- consistent(s17, comparable_jones).
evidence(all_consistent(comparable_jones)).
query(true_val(comparable_jones, between_flagship_stratos)).
query(true_val(comparable_jones, unk_comparable_jones)).

% @attr comparable_k2_excavator
% @type categorical
% @canonical false
% @original_name Price comparison to K2 Excavator (Curated)
% @values similar_more_aggressive=Similar_to_K2_Excavator_more_aggressive_more_expensive unk_comparable_k2_excavator=Unknown
% @importance 0.82

0.75::true_val(comparable_k2_excavator, similar_more_aggressive); 0.25::true_val(comparable_k2_excavator, unk_comparable_k2_excavator).
0.75::acc(s17, comparable_k2_excavator).
measured(s17, comparable_k2_excavator, similar_more_aggressive).
all_consistent(comparable_k2_excavator) :- consistent(s17, comparable_k2_excavator).
evidence(all_consistent(comparable_k2_excavator)).
query(true_val(comparable_k2_excavator, similar_more_aggressive)).
query(true_val(comparable_k2_excavator, unk_comparable_k2_excavator)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values tgr_list=Burton_Instigator_NS_Hammer_Korua_Otto_Tahoe_DT_Yes_Basic_Cardiff_Lynx unk_comparable_board_cross_brand=Unknown
% @importance 0.90

0.82::true_val(comparable_board_cross_brand, tgr_list); 0.18::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
0.83::acc(s14, comparable_board_cross_brand).
measured(s14, comparable_board_cross_brand, tgr_list).
all_consistent(comparable_board_cross_brand) :- consistent(s14, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, tgr_list)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values nils_mindnich=Nils_Mindnich unk_pro_rider_name=Unknown
% @importance 0.85

0.82::true_val(pro_rider_name, nils_mindnich); 0.18::true_val(pro_rider_name, unk_pro_rider_name).
0.82::acc(s5, pro_rider_name).
measured(s5, pro_rider_name, nils_mindnich).
all_consistent(pro_rider_name) :- consistent(s5, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, nils_mindnich)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.70

0.92::true_val(warranty_period_years, v2); 0.08::true_val(warranty_period_years, unk_warranty_period_years).
0.94::acc(s8, warranty_period_years).
measured(s8, warranty_period_years, v2).
all_consistent(warranty_period_years) :- consistent(s8, warranty_period_years).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name evo.com retailer description
% @values major_specialty_price_match=Major_specialty_retailer_price_match_1yr_returns unk_retailer_evo=Unknown
% @importance 0.95

0.90::true_val(retailer_evo, major_specialty_price_match); 0.10::true_val(retailer_evo, unk_retailer_evo).
0.88::acc(s1, retailer_evo).
measured(s1, retailer_evo, major_specialty_price_match).
all_consistent(retailer_evo) :- consistent(s1, retailer_evo).
evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_specialty_price_match)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_rei
% @type categorical
% @canonical false
% @original_name REI retailer description
% @values major_outdoor_coop=Major_US_outdoor_coop_retailer unk_retailer_rei=Unknown
% @importance 0.90

0.90::true_val(retailer_rei, major_outdoor_coop); 0.10::true_val(retailer_rei, unk_retailer_rei).
0.88::acc(s3, retailer_rei).
measured(s3, retailer_rei, major_outdoor_coop).
all_consistent(retailer_rei) :- consistent(s3, retailer_rei).
evidence(all_consistent(retailer_rei)).
query(true_val(retailer_rei, major_outdoor_coop)).
query(true_val(retailer_rei, unk_retailer_rei)).

% @attr retailer_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry.com retailer description
% @values major_online_snow=Major_US_online_snow_outdoor_retailer unk_retailer_backcountry=Unknown
% @importance 0.90

0.88::true_val(retailer_backcountry, major_online_snow); 0.12::true_val(retailer_backcountry, unk_retailer_backcountry).
0.85::acc(s14, retailer_backcountry).
measured(s14, retailer_backcountry, major_online_snow).
all_consistent(retailer_backcountry) :- consistent(s14, retailer_backcountry).
evidence(all_consistent(retailer_backcountry)).
query(true_val(retailer_backcountry, major_online_snow)).
query(true_val(retailer_backcountry, unk_retailer_backcountry)).

% @attr retailer_the_house
% @type categorical
% @canonical false
% @original_name The House retailer description
% @values established_online_snow=Established_online_snow_sports_retailer unk_retailer_the_house=Unknown
% @importance 0.75

0.75::true_val(retailer_the_house, established_online_snow); 0.25::true_val(retailer_the_house, unk_retailer_the_house).
0.72::acc(s9, retailer_the_house).
measured(s9, retailer_the_house, established_online_snow).
all_consistent(retailer_the_house) :- consistent(s9, retailer_the_house).
evidence(all_consistent(retailer_the_house)).
query(true_val(retailer_the_house, established_online_snow)).
query(true_val(retailer_the_house, unk_retailer_the_house)).

% @attr retailer_boone
% @type categorical
% @canonical false
% @original_name Boone Mountain Sports retailer description
% @values local_specialty=Local_specialty_shop_Evergreen_CO unk_retailer_boone=Unknown
% @importance 0.55

0.72::true_val(retailer_boone, local_specialty); 0.28::true_val(retailer_boone, unk_retailer_boone).
0.70::acc(s20, retailer_boone).
measured(s20, retailer_boone, local_specialty).
all_consistent(retailer_boone) :- consistent(s20, retailer_boone).
evidence(all_consistent(retailer_boone)).
query(true_val(retailer_boone, local_specialty)).
query(true_val(retailer_boone, unk_retailer_boone)).

% @attr retailer_shred_shop
% @type categorical
% @canonical false
% @original_name Shred Shop retailer description
% @values specialty_snowboard=Specialty_snowboard_shop unk_retailer_shred_shop=Unknown
% @importance 0.60

0.75::true_val(retailer_shred_shop, specialty_snowboard); 0.25::true_val(retailer_shred_shop, unk_retailer_shred_shop).
0.72::acc(s16, retailer_shred_shop).
measured(s16, retailer_shred_shop, specialty_snowboard).
all_consistent(retailer_shred_shop) :- consistent(s16, retailer_shred_shop).
evidence(all_consistent(retailer_shred_shop)).
query(true_val(retailer_shred_shop, specialty_snowboard)).
query(true_val(retailer_shred_shop, unk_retailer_shred_shop)).

% @attr retailer_corbetts
% @type categorical
% @canonical false
% @original_name Corbetts retailer description
% @values specialty_ski_snowboard=Specialty_ski_and_snowboard_retailer unk_retailer_corbetts=Unknown
% @importance 0.50

0.72::true_val(retailer_corbetts, specialty_ski_snowboard); 0.28::true_val(retailer_corbetts, unk_retailer_corbetts).
0.70::acc(s18, retailer_corbetts).
measured(s18, retailer_corbetts, specialty_ski_snowboard).
all_consistent(retailer_corbetts) :- consistent(s18, retailer_corbetts).
evidence(all_consistent(retailer_corbetts)).
query(true_val(retailer_corbetts, specialty_ski_snowboard)).
query(true_val(retailer_corbetts, unk_retailer_corbetts)).

% @attr retailer_absolute_snow
% @type categorical
% @canonical false
% @original_name Absolute-Snow retailer description
% @values uk_snow_specialist=UK_based_snow_specialist unk_retailer_absolute_snow=Unknown
% @importance 0.70

0.75::true_val(retailer_absolute_snow, uk_snow_specialist); 0.25::true_val(retailer_absolute_snow, unk_retailer_absolute_snow).
0.75::acc(s13, retailer_absolute_snow).
measured(s13, retailer_absolute_snow, uk_snow_specialist).
all_consistent(retailer_absolute_snow) :- consistent(s13, retailer_absolute_snow).
evidence(all_consistent(retailer_absolute_snow)).
query(true_val(retailer_absolute_snow, uk_snow_specialist)).
query(true_val(retailer_absolute_snow, unk_retailer_absolute_snow)).

% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre retailer description
% @values australian_specialist=Australian_specialist_retailer unk_retailer_melbourne_snowboard=Unknown
% @importance 0.70

0.80::true_val(retailer_melbourne_snowboard, australian_specialist); 0.20::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).
0.80::acc(s7, retailer_melbourne_snowboard).
measured(s7, retailer_melbourne_snowboard, australian_specialist).
all_consistent(retailer_melbourne_snowboard) :- consistent(s7, retailer_melbourne_snowboard).
evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, australian_specialist)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

% @attr retailer_blue_tomato
% @type categorical
% @canonical false
% @original_name Blue Tomato retailer description
% @values european_online_snow_surf=European_online_snow_surf_retailer unk_retailer_blue_tomato=Unknown
% @importance 0.90

0.85::true_val(retailer_blue_tomato, european_online_snow_surf); 0.15::true_val(retailer_blue_tomato, unk_retailer_blue_tomato).
0.85::acc(s14, retailer_blue_tomato).
measured(s14, retailer_blue_tomato, european_online_snow_surf).
all_consistent(retailer_blue_tomato) :- consistent(s14, retailer_blue_tomato).
evidence(all_consistent(retailer_blue_tomato)).
query(true_val(retailer_blue_tomato, european_online_snow_surf)).
query(true_val(retailer_blue_tomato, unk_retailer_blue_tomato)).