0.15::indep(sM).
0.12::indep(s1).
0.12::indep(s2).
0.12::indep(s3).
0.12::indep(s4).
0.10::indep(s8).
0.25::indep(s9).
0.12::indep(s10).
0.12::indep(s12).
0.12::indep(s15).
0.25::indep(s16).
0.20::indep(s17).
0.15::indep(s19).
0.12::indep(s21).
0.10::indep(s22).
0.20::indep(s25).
0.12::indep(s28).
0.12::indep(s30).
0.20::indep(s49).
0.15::indep(s75).
0.12::indep(s102).
0.12::indep(s105).
0.12::indep(s106).
0.15::indep(s108).
0.12::indep(s109).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.85

0.97::true_val(brand, salomon); 0.03::true_val(brand, unk_brand).
0.95::acc(s32, brand).
0.82::acc(s1, brand).
measured(s32, brand, salomon).
measured(s1, brand, salomon).
all_consistent(brand) :- consistent(s32, brand), (indep(s1), consistent(s1, brand) ; \+indep(s1)).
evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values sight=Sight unk_model_name=Unknown
% @importance 0.85

0.97::true_val(model_name, sight); 0.03::true_val(model_name, unk_model_name).
0.95::acc(s32, model_name).
0.82::acc(s1, model_name).
measured(s32, model_name, sight).
measured(s1, model_name, sight).
all_consistent(model_name) :- consistent(s32, model_name), (indep(s1), consistent(s1, model_name) ; \+indep(s1)).
evidence(all_consistent(model_name)).
query(true_val(model_name, sight)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025=2025 unk_model_year=Unknown
% @importance 0.85

0.95::true_val(model_year, y2025); 0.05::true_val(model_year, unk_model_year).
0.90::acc(s9, model_year).
0.85::acc(s21, model_year).
measured(s9, model_year, y2025).
measured(s21, model_year, y2025).
all_consistent(model_year) :- consistent(s9, model_year), (indep(s21), consistent(s21, model_year) ; \+indep(s21)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2025)).
query(true_val(model_year, unk_model_year)).

% @attr sku
% @type categorical
% @canonical true
% @original_name SKU
% @values l47661700=L47661700 unk_sku=Unknown
% @importance 0.875

0.95::true_val(sku, l47661700); 0.05::true_val(sku, unk_sku).
0.90::acc(s21, sku).
0.95::acc(sM, sku).
measured(s21, sku, l47661700).
measured(sM, sku, l47661700).
all_consistent(sku) :- consistent(s21, sku), (indep(sM), consistent(sM, sku) ; \+indep(sM)).
evidence(all_consistent(sku)).
query(true_val(sku, l47661700)).
query(true_val(sku, unk_sku)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.85

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).
0.95::acc(s32, product_type).
0.82::acc(s1, product_type).
measured(s32, product_type, snowboard).
measured(s1, product_type, snowboard).
all_consistent(product_type) :- consistent(s32, product_type), (indep(s1), consistent(s1, product_type) ; \+indep(s1)).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.75

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).
0.88::acc(s9, gender).
0.90::acc(s75, gender).
measured(s9, gender, mens).
measured(s75, gender, mens).
all_consistent(gender) :- consistent(s9, gender), (indep(s75), consistent(s75, gender) ; \+indep(s75)).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values salomon_sas_france=Salomon_SAS_Annecy_France unk_manufacturer=Unknown
% @importance 0.60

0.90::true_val(manufacturer, salomon_sas_france); 0.10::true_val(manufacturer, unk_manufacturer).
0.90::acc(s82, manufacturer).
measured(s82, manufacturer, salomon_sas_france).
all_consistent(manufacturer) :- consistent(s82, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas_france)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports_helsinki=Amer_Sports_Helsinki_Finland unk_parent_company=Unknown
% @importance 0.60

0.90::true_val(parent_company, amer_sports_helsinki); 0.10::true_val(parent_company, unk_parent_company).
0.90::acc(s82, parent_company).
measured(s82, parent_company, amer_sports_helsinki).
all_consistent(parent_company) :- consistent(s82, parent_company).
evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports_helsinki)).
query(true_val(parent_company, unk_parent_company)).

% @attr amer_sports_ownership
% @type categorical
% @canonical false
% @original_name Amer Sports ownership
% @values anta_consortium=ANTA_consortium unk_amer_sports_ownership=Unknown
% @importance 0.45

0.88::true_val(amer_sports_ownership, anta_consortium); 0.12::true_val(amer_sports_ownership, unk_amer_sports_ownership).
0.88::acc(s83, amer_sports_ownership).
measured(s83, amer_sports_ownership, anta_consortium).
all_consistent(amer_sports_ownership) :- consistent(s83, amer_sports_ownership).
evidence(all_consistent(amer_sports_ownership)).
query(true_val(amer_sports_ownership, anta_consortium)).
query(true_val(amer_sports_ownership, unk_amer_sports_ownership)).

% @attr salomon_founded
% @type categorical
% @canonical false
% @original_name Salomon founded
% @values y1947_annecy=1947_Annecy_French_Alps unk_salomon_founded=Unknown
% @importance 0.60

0.90::true_val(salomon_founded, y1947_annecy); 0.10::true_val(salomon_founded, unk_salomon_founded).
0.90::acc(s82, salomon_founded).
measured(s82, salomon_founded, y1947_annecy).
all_consistent(salomon_founded) :- consistent(s82, salomon_founded).
evidence(all_consistent(salomon_founded)).
query(true_val(salomon_founded, y1947_annecy)).
query(true_val(salomon_founded, unk_salomon_founded)).

% @attr salomon_us_operations
% @type categorical
% @canonical false
% @original_name Salomon US operations
% @values ogden_utah=Ogden_Utah unk_salomon_us_operations=Unknown
% @importance 0.60

0.90::true_val(salomon_us_operations, ogden_utah); 0.10::true_val(salomon_us_operations, unk_salomon_us_operations).
0.90::acc(s82, salomon_us_operations).
measured(s82, salomon_us_operations, ogden_utah).
all_consistent(salomon_us_operations) :- consistent(s82, salomon_us_operations).
evidence(all_consistent(salomon_us_operations)).
query(true_val(salomon_us_operations, ogden_utah)).
query(true_val(salomon_us_operations, unk_salomon_us_operations)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values global_france_bulgaria_asia=Global_France_Bulgaria_Asia unk_manufacturing_location=Unknown
% @importance 0.50

0.72::true_val(manufacturing_location, global_france_bulgaria_asia); 0.28::true_val(manufacturing_location, unk_manufacturing_location).
0.70::acc(s116, manufacturing_location).
0.55::acc(s114, manufacturing_location).
0.78::acc(s87, manufacturing_location).
measured(s116, manufacturing_location, global_france_bulgaria_asia).
measured(s114, manufacturing_location, global_france_bulgaria_asia).
measured(s87, manufacturing_location, global_france_bulgaria_asia).
all_consistent(manufacturing_location) :- consistent(s116, manufacturing_location), consistent(s114, manufacturing_location), consistent(s87, manufacturing_location).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, global_france_bulgaria_asia)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_year_mfr=2_year_manufacturer_defects unk_warranty=Unknown
% @importance 0.70

0.93::true_val(warranty, two_year_mfr); 0.07::true_val(warranty, unk_warranty).
0.90::acc(s75, warranty).
0.85::acc(s108, warranty).
measured(s75, warranty, two_year_mfr).
measured(s108, warranty, two_year_mfr).
all_consistent(warranty) :- consistent(s75, warranty), (indep(s108), consistent(s108, warranty) ; \+indep(s108)).
evidence(all_consistent(warranty)).
query(true_val(warranty, two_year_mfr)).
query(true_val(warranty, unk_warranty)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values salomon_ace=Salomon_Ace unk_predecessor_model_name=Unknown
% @importance 0.90

0.85::true_val(predecessor_model_name, salomon_ace); 0.15::true_val(predecessor_model_name, unk_predecessor_model_name).
0.88::acc(s41, predecessor_model_name).
measured(s41, predecessor_model_name, salomon_ace).
all_consistent(predecessor_model_name) :- consistent(s41, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, salomon_ace)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2012_2013=2012_2013_season unk_model_first_available_year=Unknown
% @importance 0.90

0.82::true_val(model_first_available_year, y2012_2013); 0.18::true_val(model_first_available_year, unk_model_first_available_year).
0.80::acc(s61, model_first_available_year).
measured(s61, model_first_available_year, y2012_2013).
all_consistent(model_first_available_year) :- consistent(s61, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2012_2013)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values salomon_effect=Salomon_Effect_bigger_brother unk_comparable_board_same_brand=Unknown
% @importance 0.90

0.85::true_val(comparable_board_same_brand, salomon_effect); 0.15::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
0.88::acc(s41, comparable_board_same_brand).
measured(s41, comparable_board_same_brand, salomon_effect).
all_consistent(comparable_board_same_brand) :- consistent(s41, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, salomon_effect)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values salomon_highpath=Salomon_Highpath_freeride unk_design_inspiration=Unknown
% @importance 0.85

0.83::true_val(design_inspiration, salomon_highpath); 0.17::true_val(design_inspiration, unk_design_inspiration).
0.85::acc(s42, design_inspiration).
measured(s42, design_inspiration, salomon_highpath).
all_consistent(design_inspiration) :- consistent(s42, design_inspiration).
evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, salomon_highpath)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr variant
% @type categorical
% @canonical false
% @original_name Variant
% @values sight_x_evo_exclusive=Sight_X_evo_exclusive_graphic unk_variant=Unknown
% @importance 0.45

0.82::true_val(variant, sight_x_evo_exclusive); 0.18::true_val(variant, unk_variant).
0.83::acc(s46, variant).
measured(s46, variant, sight_x_evo_exclusive).
all_consistent(variant) :- consistent(s46, variant).
evidence(all_consistent(variant)).
query(true_val(variant, sight_x_evo_exclusive)).
query(true_val(variant, unk_variant)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain all_mountain_freeride=All_Mountain_freeride_inspired unk_board_category=Unknown
% @importance 0.88

0.50::true_val(board_category, all_mountain); 0.47::true_val(board_category, all_mountain_freeride); 0.03::true_val(board_category, unk_board_category).
0.93::acc(s32, board_category).
0.82::acc(s1, board_category).
0.88::acc(s21, board_category).
0.85::acc(s2, board_category).
measured(s32, board_category, all_mountain).
measured(s1, board_category, all_mountain).
measured(s21, board_category, all_mountain).
measured(s2, board_category, all_mountain_freeride).
measured(s32, board_category, all_mountain_freeride).
all_consistent(board_category) :- consistent(s32, board_category), (indep(s1), consistent(s1, board_category) ; \+indep(s1)), (indep(s21), consistent(s21, board_category) ; \+indep(s21)), (indep(s2), consistent(s2, board_category) ; \+indep(s2)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mtn_freeride_powder=All_mountain_freeride_powder unk_terrain_suitability=Unknown
% @importance 0.88

0.93::true_val(terrain_suitability, all_mtn_freeride_powder); 0.07::true_val(terrain_suitability, unk_terrain_suitability).
0.90::acc(s1, terrain_suitability).
0.85::acc(s42, terrain_suitability).
measured(s1, terrain_suitability, all_mtn_freeride_powder).
measured(s42, terrain_suitability, all_mtn_freeride_powder).
all_consistent(terrain_suitability) :- (indep(s1), consistent(s1, terrain_suitability) ; \+indep(s1)), consistent(s42, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mtn_freeride_powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner_intermediate=Beginner_Intermediate beginner_advanced=Beginner_Advanced intermediate_advanced=Intermediate_Advanced
% @importance 0.71

0.50::true_val(rider_level, beginner_intermediate); 0.20::true_val(rider_level, beginner_advanced); 0.30::true_val(rider_level, intermediate_advanced).
0.90::acc(sM, rider_level).
0.80::acc(s12, rider_level).
0.82::acc(s61, rider_level).
0.72::acc(s16, rider_level).
0.55::acc(s19, rider_level).
measured(sM, rider_level, beginner_intermediate).
measured(s12, rider_level, beginner_intermediate).
measured(s61, rider_level, beginner_advanced).
measured(s16, rider_level, intermediate_advanced).
measured(s19, rider_level, intermediate_advanced).
all_consistent(rider_level) :- (indep(sM), consistent(sM, rider_level) ; \+indep(sM)), (indep(s12), consistent(s12, rider_level) ; \+indep(s12)), consistent(s61, rider_level), (indep(s16), consistent(s16, rider_level) ; \+indep(s16)), (indep(s19), consistent(s19, rider_level) ; \+indep(s19)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_intermediate)).
query(true_val(rider_level, beginner_advanced)).
query(true_val(rider_level, intermediate_advanced)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values all_mountain_freeride_lean=All_mountain_freeride_lean unk_riding_style=Unknown
% @importance 0.85

0.90::true_val(riding_style, all_mountain_freeride_lean); 0.10::true_val(riding_style, unk_riding_style).
0.88::acc(s2, riding_style).
0.85::acc(s42, riding_style).
measured(s2, riding_style, all_mountain_freeride_lean).
measured(s42, riding_style, all_mountain_freeride_lean).
all_consistent(riding_style) :- (indep(s2), consistent(s2, riding_style) ; \+indep(s2)), consistent(s42, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mountain_freeride_lean)).
query(true_val(riding_style, unk_riding_style)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_first_freeride=Beginner_first_freeride_progression unk_skill_level_recommendation=Unknown
% @importance 0.88

0.88::true_val(skill_level_recommendation, beginner_first_freeride); 0.12::true_val(skill_level_recommendation, unk_skill_level_recommendation).
0.85::acc(s42, skill_level_recommendation).
0.80::acc(s53, skill_level_recommendation).
measured(s42, skill_level_recommendation, beginner_first_freeride).
measured(s53, skill_level_recommendation, beginner_first_freeride).
all_consistent(skill_level_recommendation) :- consistent(s42, skill_level_recommendation), consistent(s53, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_first_freeride)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr terrain_suitability_groomed
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values groomers_powder_trees=Groomers_powder_fields_tree_runs unk_terrain_suitability_groomed=Unknown
% @importance 0.85

0.85::true_val(terrain_suitability_groomed, groomers_powder_trees); 0.15::true_val(terrain_suitability_groomed, unk_terrain_suitability_groomed).
0.85::acc(s42, terrain_suitability_groomed).
measured(s42, terrain_suitability_groomed, groomers_powder_trees).
all_consistent(terrain_suitability_groomed) :- consistent(s42, terrain_suitability_groomed).
evidence(all_consistent(terrain_suitability_groomed)).
query(true_val(terrain_suitability_groomed, groomers_powder_trees)).
query(true_val(terrain_suitability_groomed, unk_terrain_suitability_groomed)).

% @attr terrain_suitability_steep
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values steep_technical_aggressive=Steep_technical_descents_aggressive_carving unk_terrain_suitability_steep=Unknown
% @importance 0.85

0.85::true_val(terrain_suitability_steep, steep_technical_aggressive); 0.15::true_val(terrain_suitability_steep, unk_terrain_suitability_steep).
0.85::acc(s42, terrain_suitability_steep).
measured(s42, terrain_suitability_steep, steep_technical_aggressive).
all_consistent(terrain_suitability_steep) :- consistent(s42, terrain_suitability_steep).
evidence(all_consistent(terrain_suitability_steep)).
query(true_val(terrain_suitability_steep, steep_technical_aggressive)).
query(true_val(terrain_suitability_steep, unk_terrain_suitability_steep)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.88

0.97::true_val(shape, tapered_directional); 0.03::true_val(shape, unk_shape).
0.95::acc(s32, shape).
0.82::acc(s1, shape).
0.90::acc(sM, shape).
measured(s32, shape, tapered_directional).
measured(s1, shape, tapered_directional).
measured(sM, shape, tapered_directional).
all_consistent(shape) :- consistent(s32, shape), (indep(s1), consistent(s1, shape) ; \+indep(s1)), (indep(sM), consistent(sM, shape) ; \+indep(sM)).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr taper
% @type categorical
% @canonical true
% @original_name taper
% @values tapered_2_20mm=Tapered_2_to_20mm unk_taper=Unknown
% @importance 0.83

0.93::true_val(taper, tapered_2_20mm); 0.07::true_val(taper, unk_taper).
0.88::acc(s4, taper).
0.88::acc(s9, taper).
measured(s4, taper, tapered_2_20mm).
measured(s9, taper, tapered_2_20mm).
all_consistent(taper) :- (indep(s4), consistent(s4, taper) ; \+indep(s4)), (indep(s9), consistent(s9, taper) ; \+indep(s9)).
evidence(all_consistent(taper)).
query(true_val(taper, tapered_2_20mm)).
query(true_val(taper, unk_taper)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values cross_profile_rcr=Cross_Profile_Rocker_Camber_Rocker unk_camber_type=Unknown
% @importance 0.88

0.97::true_val(camber_type, cross_profile_rcr); 0.03::true_val(camber_type, unk_camber_type).
0.95::acc(s32, camber_type).
0.82::acc(s1, camber_type).
0.90::acc(sM, camber_type).
measured(s32, camber_type, cross_profile_rcr).
measured(s1, camber_type, cross_profile_rcr).
measured(sM, camber_type, cross_profile_rcr).
all_consistent(camber_type) :- consistent(s32, camber_type), (indep(s1), consistent(s1, camber_type) ; \+indep(s1)), (indep(sM), consistent(sM, camber_type) ; \+indep(sM)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, cross_profile_rcr)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values camber_feet_rocker_tips=Camber_between_feet_rocker_tip_tail unk_camber_description=Unknown
% @importance 0.83

0.93::true_val(camber_description, camber_feet_rocker_tips); 0.07::true_val(camber_description, unk_camber_description).
0.88::acc(s2, camber_description).
0.88::acc(s9, camber_description).
measured(s2, camber_description, camber_feet_rocker_tips).
measured(s9, camber_description, camber_feet_rocker_tips).
all_consistent(camber_description) :- (indep(s2), consistent(s2, camber_description) ; \+indep(s2)), (indep(s9), consistent(s9, camber_description) ; \+indep(s9)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, camber_feet_rocker_tips)).
query(true_val(camber_description, unk_camber_description)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values vm10=_10.0 unk_setback=Unknown
% @importance 0.90

0.82::true_val(setback, vm10); 0.18::true_val(setback, unk_setback).
0.85::acc(s61, setback).
measured(s61, setback, vm10).
all_consistent(setback) :- consistent(s61, setback).
evidence(all_consistent(setback)).
query(true_val(setback, vm10)).
query(true_val(setback, unk_setback)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v4=4.0 v5=5.0
% @importance 0.83

0.45::true_val(flex_rating_10, v4); 0.55::true_val(flex_rating_10, v5).
0.88::acc(sM, flex_rating_10).
0.78::acc(s131, flex_rating_10).
0.80::acc(s4, flex_rating_10).
0.80::acc(s15, flex_rating_10).
measured(sM, flex_rating_10, v4).
measured(s131, flex_rating_10, v5).
measured(s4, flex_rating_10, v5).
measured(s15, flex_rating_10, v5).
all_consistent(flex_rating_10) :- (indep(sM), consistent(sM, flex_rating_10) ; \+indep(sM)), consistent(s131, flex_rating_10), (indep(s4), consistent(s4, flex_rating_10) ; \+indep(s4)), (indep(s15), consistent(s15, flex_rating_10) ; \+indep(s15)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4)).
query(true_val(flex_rating_10, v5)).

% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical true
% @original_name flex_rating_5
% @values v2_5=2.5 unk_flex_rating_5=Unknown
% @importance 0.85

0.93::true_val(flex_rating_5, v2_5); 0.07::true_val(flex_rating_5, unk_flex_rating_5).
0.85::acc(s15, flex_rating_5).
0.85::acc(s4, flex_rating_5).
measured(s15, flex_rating_5, v2_5).
measured(s4, flex_rating_5, v2_5).
all_consistent(flex_rating_5) :- (indep(s15), consistent(s15, flex_rating_5) ; \+indep(s15)), (indep(s4), consistent(s4, flex_rating_5) ; \+indep(s4)).
evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v2_5)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical false
% @original_name flex_rating_10_the_good_ride
% @values medium_soft=Medium_Soft unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.90

0.82::true_val(flex_rating_10_the_good_ride, medium_soft); 0.18::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).
0.85::acc(s61, flex_rating_10_the_good_ride).
measured(s61, flex_rating_10_the_good_ride, medium_soft).
all_consistent(flex_rating_10_the_good_ride) :- consistent(s61, flex_rating_10_the_good_ride).
evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium_soft)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium=Medium unk_flex_rating_10_evo=Unknown
% @importance 0.80

0.80::true_val(flex_rating_10_evo, medium); 0.20::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).
0.80::acc(s16, flex_rating_10_evo).
measured(s16, flex_rating_10_evo, medium).
all_consistent(flex_rating_10_evo) :- (indep(s16), consistent(s16, flex_rating_10_evo) ; \+indep(s16)).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values forgiving_playful=Forgiving_playful_soft_medium unk_flex_feel=Unknown
% @importance 0.90

0.90::true_val(flex_feel, forgiving_playful); 0.10::true_val(flex_feel, unk_flex_feel).
0.88::acc(s41, flex_feel).
0.85::acc(s61, flex_feel).
measured(s41, flex_feel, forgiving_playful).
measured(s61, flex_feel, forgiving_playful).
all_consistent(flex_feel) :- consistent(s41, flex_feel), consistent(s61, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, forgiving_playful)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr buttering
% @type categorical
% @canonical false
% @original_name Buttering
% @values semi_easy=Semi_Easy unk_buttering=Unknown
% @importance 0.90

0.82::true_val(buttering, semi_easy); 0.18::true_val(buttering, unk_buttering).
0.85::acc(s61, buttering).
measured(s61, buttering, semi_easy).
all_consistent(buttering) :- consistent(s61, buttering).
evidence(all_consistent(buttering)).
query(true_val(buttering, semi_easy)).
query(true_val(buttering, unk_buttering)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values quadratic=Quadratic_Sidecut unk_sidecut_type=Unknown
% @importance 0.85

0.95::true_val(sidecut_type, quadratic); 0.05::true_val(sidecut_type, unk_sidecut_type).
0.92::acc(s2, sidecut_type).
0.88::acc(s9, sidecut_type).
0.90::acc(sM, sidecut_type).
0.85::acc(s4, sidecut_type).
measured(s2, sidecut_type, quadratic).
measured(s9, sidecut_type, quadratic).
measured(sM, sidecut_type, quadratic).
measured(s4, sidecut_type, quadratic).
all_consistent(sidecut_type) :- (indep(s2), consistent(s2, sidecut_type) ; \+indep(s2)), (indep(s9), consistent(s9, sidecut_type) ; \+indep(s9)), (indep(sM), consistent(sM, sidecut_type) ; \+indep(sM)), (indep(s4), consistent(s4, sidecut_type) ; \+indep(s4)).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, quadratic)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_147_150_153_156_159=147_150_153_156_159cm unk_available_sizes=Unknown
% @importance 0.80

0.95::true_val(available_sizes, sizes_147_150_153_156_159); 0.05::true_val(available_sizes, unk_available_sizes).
0.92::acc(sM, available_sizes).
0.85::acc(s30, available_sizes).
measured(sM, available_sizes, sizes_147_150_153_156_159).
measured(s30, available_sizes, sizes_147_150_153_156_159).
all_consistent(available_sizes) :- (indep(sM), consistent(sM, available_sizes) ; \+indep(sM)), (indep(s30), consistent(s30, available_sizes) ; \+indep(s30)).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_147_150_153_156_159)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_wide
% @type categorical
% @canonical false
% @original_name available_sizes
% @values sizes_155w_158w_162w_166w=155W_158W_162W_166W unk_available_sizes_wide=Unknown
% @importance 0.80

0.95::true_val(available_sizes_wide, sizes_155w_158w_162w_166w); 0.05::true_val(available_sizes_wide, unk_available_sizes_wide).
0.92::acc(sM, available_sizes_wide).
0.85::acc(s30, available_sizes_wide).
measured(sM, available_sizes_wide, sizes_155w_158w_162w_166w).
measured(s30, available_sizes_wide, sizes_155w_158w_162w_166w).
all_consistent(available_sizes_wide) :- (indep(sM), consistent(sM, available_sizes_wide) ; \+indep(sM)), (indep(s30), consistent(s30, available_sizes_wide) ; \+indep(s30)).
evidence(all_consistent(available_sizes_wide)).
query(true_val(available_sizes_wide, sizes_155w_158w_162w_166w)).
query(true_val(available_sizes_wide, unk_available_sizes_wide)).

% @attr waist_width_147
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 147cm
% @values v244=244.0 unk_waist_width_147=Unknown
% @importance 0.85

0.93::true_val(waist_width_147, v244); 0.07::true_val(waist_width_147, unk_waist_width_147).
0.92::acc(sM, waist_width_147).
measured(sM, waist_width_147, v244).
all_consistent(waist_width_147) :- (indep(sM), consistent(sM, waist_width_147) ; \+indep(sM)).
evidence(all_consistent(waist_width_147)).
query(true_val(waist_width_147, v244)).
query(true_val(waist_width_147, unk_waist_width_147)).

% @attr waist_width_150
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 150cm
% @values v247=247.0 unk_waist_width_150=Unknown
% @importance 0.85

0.93::true_val(waist_width_150, v247); 0.07::true_val(waist_width_150, unk_waist_width_150).
0.92::acc(sM, waist_width_150).
measured(sM, waist_width_150, v247).
all_consistent(waist_width_150) :- (indep(sM), consistent(sM, waist_width_150) ; \+indep(sM)).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v247)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr waist_width_153
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 153cm
% @values v250=250.0 unk_waist_width_153=Unknown
% @importance 0.85

0.93::true_val(waist_width_153, v250); 0.07::true_val(waist_width_153, unk_waist_width_153).
0.92::acc(sM, waist_width_153).
measured(sM, waist_width_153, v250).
all_consistent(waist_width_153) :- (indep(sM), consistent(sM, waist_width_153) ; \+indep(sM)).
evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v250)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr waist_width_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 156cm
% @values v252=252.0 unk_waist_width_156=Unknown
% @importance 0.85

0.93::true_val(waist_width_156, v252); 0.07::true_val(waist_width_156, unk_waist_width_156).
0.92::acc(sM, waist_width_156).
measured(sM, waist_width_156, v252).
all_consistent(waist_width_156) :- (indep(sM), consistent(sM, waist_width_156) ; \+indep(sM)).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v252)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr waist_width_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 159cm
% @values v256=256.0 unk_waist_width_159=Unknown
% @importance 0.85

0.93::true_val(waist_width_159, v256); 0.07::true_val(waist_width_159, unk_waist_width_159).
0.92::acc(sM, waist_width_159).
measured(sM, waist_width_159, v256).
all_consistent(waist_width_159) :- (indep(sM), consistent(sM, waist_width_159) ; \+indep(sM)).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v256)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr waist_width_155w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 155cm W
% @values v262=262.0 unk_waist_width_155w=Unknown
% @importance 0.85

0.93::true_val(waist_width_155w, v262); 0.07::true_val(waist_width_155w, unk_waist_width_155w).
0.92::acc(sM, waist_width_155w).
measured(sM, waist_width_155w, v262).
all_consistent(waist_width_155w) :- (indep(sM), consistent(sM, waist_width_155w) ; \+indep(sM)).
evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v262)).
query(true_val(waist_width_155w, unk_waist_width_155w)).

% @attr waist_width_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 158cm W
% @values v264=264.0 unk_waist_width_158w=Unknown
% @importance 0.85

0.93::true_val(waist_width_158w, v264); 0.07::true_val(waist_width_158w, unk_waist_width_158w).
0.92::acc(sM, waist_width_158w).
measured(sM, waist_width_158w, v264).
all_consistent(waist_width_158w) :- (indep(sM), consistent(sM, waist_width_158w) ; \+indep(sM)).
evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v264)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr waist_width_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 162cm W
% @values v271=271.0 unk_waist_width_162w=Unknown
% @importance 0.85

0.93::true_val(waist_width_162w, v271); 0.07::true_val(waist_width_162w, unk_waist_width_162w).
0.92::acc(sM, waist_width_162w).
measured(sM, waist_width_162w, v271).
all_consistent(waist_width_162w) :- (indep(sM), consistent(sM, waist_width_162w) ; \+indep(sM)).
evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v271)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

% @attr waist_width_166w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 166cm W
% @values v275=275.0 unk_waist_width_166w=Unknown
% @importance 0.85

0.93::true_val(waist_width_166w, v275); 0.07::true_val(waist_width_166w, unk_waist_width_166w).
0.92::acc(sM, waist_width_166w).
measured(sM, waist_width_166w, v275).
all_consistent(waist_width_166w) :- (indep(sM), consistent(sM, waist_width_166w) ; \+indep(sM)).
evidence(all_consistent(waist_width_166w)).
query(true_val(waist_width_166w, v275)).
query(true_val(waist_width_166w, unk_waist_width_166w)).

% @attr effective_edge_147
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 147cm
% @values v111_0=111.0 unk_effective_edge_147=Unknown
% @importance 0.85

0.93::true_val(effective_edge_147, v111_0); 0.07::true_val(effective_edge_147, unk_effective_edge_147).
0.92::acc(sM, effective_edge_147).
measured(sM, effective_edge_147, v111_0).
all_consistent(effective_edge_147) :- (indep(sM), consistent(sM, effective_edge_147) ; \+indep(sM)).
evidence(all_consistent(effective_edge_147)).
query(true_val(effective_edge_147, v111_0)).
query(true_val(effective_edge_147, unk_effective_edge_147)).

% @attr effective_edge_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 150cm
% @values v113_5=113.5 unk_effective_edge_150=Unknown
% @importance 0.85

0.93::true_val(effective_edge_150, v113_5); 0.07::true_val(effective_edge_150, unk_effective_edge_150).
0.92::acc(sM, effective_edge_150).
measured(sM, effective_edge_150, v113_5).
all_consistent(effective_edge_150) :- (indep(sM), consistent(sM, effective_edge_150) ; \+indep(sM)).
evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v113_5)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

% @attr effective_edge_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 153cm
% @values v116_0=116.0 unk_effective_edge_153=Unknown
% @importance 0.85

0.93::true_val(effective_edge_153, v116_0); 0.07::true_val(effective_edge_153, unk_effective_edge_153).
0.92::acc(sM, effective_edge_153).
measured(sM, effective_edge_153, v116_0).
all_consistent(effective_edge_153) :- (indep(sM), consistent(sM, effective_edge_153) ; \+indep(sM)).
evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v116_0)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 156cm
% @values v118_0=118.0 unk_effective_edge_156=Unknown
% @importance 0.85

0.93::true_val(effective_edge_156, v118_0); 0.07::true_val(effective_edge_156, unk_effective_edge_156).
0.92::acc(sM, effective_edge_156).
measured(sM, effective_edge_156, v118_0).
all_consistent(effective_edge_156) :- (indep(sM), consistent(sM, effective_edge_156) ; \+indep(sM)).
evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v118_0)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr effective_edge_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 159cm
% @values v120_0=120.0 unk_effective_edge_159=Unknown
% @importance 0.85

0.93::true_val(effective_edge_159, v120_0); 0.07::true_val(effective_edge_159, unk_effective_edge_159).
0.92::acc(sM, effective_edge_159).
measured(sM, effective_edge_159, v120_0).
all_consistent(effective_edge_159) :- (indep(sM), consistent(sM, effective_edge_159) ; \+indep(sM)).
evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v120_0)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr effective_edge_155w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 155cm W
% @values v115_5=115.5 unk_effective_edge_155w=Unknown
% @importance 0.85

0.93::true_val(effective_edge_155w, v115_5); 0.07::true_val(effective_edge_155w, unk_effective_edge_155w).
0.92::acc(sM, effective_edge_155w).
measured(sM, effective_edge_155w, v115_5).
all_consistent(effective_edge_155w) :- (indep(sM), consistent(sM, effective_edge_155w) ; \+indep(sM)).
evidence(all_consistent(effective_edge_155w)).
query(true_val(effective_edge_155w, v115_5)).
query(true_val(effective_edge_155w, unk_effective_edge_155w)).

% @attr effective_edge_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 158cm W
% @values v118_5=118.5 unk_effective_edge_158w=Unknown
% @importance 0.85

0.93::true_val(effective_edge_158w, v118_5); 0.07::true_val(effective_edge_158w, unk_effective_edge_158w).
0.92::acc(sM, effective_edge_158w).
measured(sM, effective_edge_158w, v118_5).
all_consistent(effective_edge_158w) :- (indep(sM), consistent(sM, effective_edge_158w) ; \+indep(sM)).
evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v118_5)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr effective_edge_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 162cm W
% @values v121_5=121.5 unk_effective_edge_162w=Unknown
% @importance 0.85

0.93::true_val(effective_edge_162w, v121_5); 0.07::true_val(effective_edge_162w, unk_effective_edge_162w).
0.92::acc(sM, effective_edge_162w).
measured(sM, effective_edge_162w, v121_5).
all_consistent(effective_edge_162w) :- (indep(sM), consistent(sM, effective_edge_162w) ; \+indep(sM)).
evidence(all_consistent(effective_edge_162w)).
query(true_val(effective_edge_162w, v121_5)).
query(true_val(effective_edge_162w, unk_effective_edge_162w)).

% @attr effective_edge_166w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 166cm W
% @values v124_5=124.5 unk_effective_edge_166w=Unknown
% @importance 0.85

0.93::true_val(effective_edge_166w, v124_5); 0.07::true_val(effective_edge_166w, unk_effective_edge_166w).
0.92::acc(sM, effective_edge_166w).
measured(sM, effective_edge_166w, v124_5).
all_consistent(effective_edge_166w) :- (indep(sM), consistent(sM, effective_edge_166w) ; \+indep(sM)).
evidence(all_consistent(effective_edge_166w)).
query(true_val(effective_edge_166w, v124_5)).
query(true_val(effective_edge_166w, unk_effective_edge_166w)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @values v29_9_29_6=29.9/29.6cm unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size, v29_9_29_6); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.92::acc(sM, tip_tail_width_size).
measured(sM, tip_tail_width_size, v29_9_29_6).
all_consistent(tip_tail_width_size) :- (indep(sM), consistent(sM, tip_tail_width_size) ; \+indep(sM)).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_9_29_6)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_alt
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @values v30_4_30_1=30.4/30.1cm unk_tip_tail_width_size_alt=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_alt, v30_4_30_1); 0.07::true_val(tip_tail_width_size_alt, unk_tip_tail_width_size_alt).
0.92::acc(sM, tip_tail_width_size_alt).
measured(sM, tip_tail_width_size_alt, v30_4_30_1).
all_consistent(tip_tail_width_size_alt) :- (indep(sM), consistent(sM, tip_tail_width_size_alt) ; \+indep(sM)).
evidence(all_consistent(tip_tail_width_size_alt)).
query(true_val(tip_tail_width_size_alt, v30_4_30_1)).
query(true_val(tip_tail_width_size_alt, unk_tip_tail_width_size_alt)).

% @attr recommended_weight_range_size_147
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w50_70=50_70kg unk_rwr_147=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_147, w50_70); 0.07::true_val(recommended_weight_range_size_147, unk_rwr_147).
0.92::acc(sM, recommended_weight_range_size_147).
measured(sM, recommended_weight_range_size_147, w50_70).
all_consistent(recommended_weight_range_size_147) :- (indep(sM), consistent(sM, recommended_weight_range_size_147) ; \+indep(sM)).
evidence(all_consistent(recommended_weight_range_size_147)).
query(true_val(recommended_weight_range_size_147, w50_70)).
query(true_val(recommended_weight_range_size_147, unk_rwr_147)).

% @attr recommended_weight_range_size_150
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w55_75=55_75kg unk_rwr_150=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_150, w55_75); 0.07::true_val(recommended_weight_range_size_150, unk_rwr_150).
0.92::acc(sM, recommended_weight_range_size_150).
measured(sM, recommended_weight_range_size_150, w55_75).
all_consistent(recommended_weight_range_size_150) :- (indep(sM), consistent(sM, recommended_weight_range_size_150) ; \+indep(sM)).
evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, w55_75)).
query(true_val(recommended_weight_range_size_150, unk_rwr_150)).

% @attr recommended_weight_range_size_153
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w55_85=55_85kg unk_rwr_153=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_153, w55_85); 0.07::true_val(recommended_weight_range_size_153, unk_rwr_153).
0.92::acc(sM, recommended_weight_range_size_153).
measured(sM, recommended_weight_range_size_153, w55_85).
all_consistent(recommended_weight_range_size_153) :- (indep(sM), consistent(sM, recommended_weight_range_size_153) ; \+indep(sM)).
evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w55_85)).
query(true_val(recommended_weight_range_size_153, unk_rwr_153)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values w65_90=65_90kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size, w65_90); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.92::acc(sM, recommended_weight_range_size).
measured(sM, recommended_weight_range_size, w65_90).
all_consistent(recommended_weight_range_size) :- (indep(sM), consistent(sM, recommended_weight_range_size) ; \+indep(sM)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w65_90)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w65_90=65_90kg unk_rwr_159=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_159, w65_90r); 0.07::true_val(recommended_weight_range_size_159, unk_rwr_159).
0.92::acc(sM, recommended_weight_range_size_159).
measured(sM, recommended_weight_range_size_159, w65_90r).
all_consistent(recommended_weight_range_size_159) :- (indep(sM), consistent(sM, recommended_weight_range_size_159) ; \+indep(sM)).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w65_90r)).
query(true_val(recommended_weight_range_size_159, unk_rwr_159)).

% @attr recommended_weight_range_size_155w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w70_85=70_85kg unk_rwr_155w=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_155w, w70_85); 0.07::true_val(recommended_weight_range_size_155w, unk_rwr_155w).
0.92::acc(sM, recommended_weight_range_size_155w).
measured(sM, recommended_weight_range_size_155w, w70_85).
all_consistent(recommended_weight_range_size_155w) :- (indep(sM), consistent(sM, recommended_weight_range_size_155w) ; \+indep(sM)).
evidence(all_consistent(recommended_weight_range_size_155w)).
query(true_val(recommended_weight_range_size_155w, w70_85)).
query(true_val(recommended_weight_range_size_155w, unk_rwr_155w)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w70_90=70_90kg unk_rwr_158w=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_158w, w70_90); 0.07::true_val(recommended_weight_range_size_158w, unk_rwr_158w).
0.92::acc(sM, recommended_weight_range_size_158w).
measured(sM, recommended_weight_range_size_158w, w70_90).
all_consistent(recommended_weight_range_size_158w) :- (indep(sM), consistent(sM, recommended_weight_range_size_158w) ; \+indep(sM)).
evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, w70_90)).
query(true_val(recommended_weight_range_size_158w, unk_rwr_158w)).

% @attr recommended_weight_range_size_162w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w70_105=70_105kg unk_rwr_162w=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_162w, w70_105); 0.07::true_val(recommended_weight_range_size_162w, unk_rwr_162w).
0.92::acc(sM, recommended_weight_range_size_162w).
measured(sM, recommended_weight_range_size_162w, w70_105).
all_consistent(recommended_weight_range_size_162w) :- (indep(sM), consistent(sM, recommended_weight_range_size_162w) ; \+indep(sM)).
evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, w70_105)).
query(true_val(recommended_weight_range_size_162w, unk_rwr_162w)).

% @attr recommended_weight_range_size_166w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w75_plus=75_plus_kg unk_rwr_166w=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_166w, w75_plus); 0.07::true_val(recommended_weight_range_size_166w, unk_rwr_166w).
0.92::acc(sM, recommended_weight_range_size_166w).
measured(sM, recommended_weight_range_size_166w, w75_plus).
all_consistent(recommended_weight_range_size_166w) :- (indep(sM), consistent(sM, recommended_weight_range_size_166w) ; \+indep(sM)).
evidence(all_consistent(recommended_weight_range_size_166w)).
query(true_val(recommended_weight_range_size_166w, w75_plus)).
query(true_val(recommended_weight_range_size_166w, unk_rwr_166w)).

% @attr boot_size_fit
% @type categorical
% @canonical false
% @original_name Boot size fit
% @values us8_10_and_10_12=US_8_10_and_10_12 unk_boot_size_fit=Unknown
% @importance 0.90

0.82::true_val(boot_size_fit, us8_10_and_10_12); 0.18::true_val(boot_size_fit, unk_boot_size_fit).
0.85::acc(s61, boot_size_fit).
measured(s61, boot_size_fit, us8_10_and_10_12).
all_consistent(boot_size_fit) :- consistent(s61, boot_size_fit).
evidence(all_consistent(boot_size_fit)).
query(true_val(boot_size_fit, us8_10_and_10_12)).
query(true_val(boot_size_fit, unk_boot_size_fit)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_strong=Aspen_Strong_FSC_wood unk_core_material=Unknown
% @importance 0.83

0.95::true_val(core_material, aspen_strong); 0.05::true_val(core_material, unk_core_material).
0.90::acc(s2, core_material).
0.88::acc(s25, core_material).
measured(s2, core_material, aspen_strong).
measured(s25, core_material, aspen_strong).
all_consistent(core_material) :- (indep(s2), consistent(s2, core_material) ; \+indep(s2)), (indep(s25), consistent(s25, core_material) ; \+indep(s25)).
evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_strong)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_profile
% @type categorical
% @canonical false
% @original_name core_material
% @values popster=Popster_shaped_core_profile unk_core_material_profile=Unknown
% @importance 0.83

0.93::true_val(core_material_profile, popster); 0.07::true_val(core_material_profile, unk_core_material_profile).
0.90::acc(s2, core_material_profile).
0.88::acc(s25, core_material_profile).
measured(s2, core_material_profile, popster).
measured(s25, core_material_profile, popster).
all_consistent(core_material_profile) :- (indep(s2), consistent(s2, core_material_profile) ; \+indep(s2)), (indep(s25), consistent(s25, core_material_profile) ; \+indep(s25)).
evidence(all_consistent(core_material_profile)).
query(true_val(core_material_profile, popster)).
query(true_val(core_material_profile, unk_core_material_profile)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_wood=FSC_certified_wood_strips unk_sustainability_certification=Unknown
% @importance 0.83

0.93::true_val(sustainability_certification, fsc_certified_wood); 0.07::true_val(sustainability_certification, unk_sustainability_certification).
0.90::acc(s2, sustainability_certification).
0.88::acc(s25, sustainability_certification).
measured(s2, sustainability_certification, fsc_certified_wood).
measured(s25, sustainability_certification, fsc_certified_wood).
all_consistent(sustainability_certification) :- (indep(s2), consistent(s2, sustainability_certification) ; \+indep(s2)), (indep(s25), consistent(s25, sustainability_certification) ; \+indep(s25)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_wood)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values ba_ld=BA_LD_low_density_fiberglass ba_md=BA_MD_medium_density_fiberglass
% @importance 0.80

0.65::true_val(laminate, ba_ld); 0.35::true_val(laminate, ba_md).
0.85::acc(s1, laminate).
0.85::acc(s15, laminate).
0.88::acc(sM, laminate).
0.82::acc(s25, laminate).
0.82::acc(s49, laminate).
measured(s1, laminate, ba_ld).
measured(s15, laminate, ba_ld).
measured(sM, laminate, ba_ld).
measured(s25, laminate, ba_md).
measured(s49, laminate, ba_md).
all_consistent(laminate) :- (indep(s1), consistent(s1, laminate) ; \+indep(s1)), (indep(s15), consistent(s15, laminate) ; \+indep(s15)), (indep(sM), consistent(sM, laminate) ; \+indep(sM)), (indep(s25), consistent(s25, laminate) ; \+indep(s25)), (indep(s49), consistent(s49, laminate) ; \+indep(s49)).
evidence(all_consistent(laminate)).
query(true_val(laminate, ba_ld)).
query(true_val(laminate, ba_md)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values extruded_eg=Extruded_EG unk_base_material=Unknown
% @importance 0.78

0.95::true_val(base_material, extruded_eg); 0.05::true_val(base_material, unk_base_material).
0.88::acc(s3, base_material).
0.85::acc(s4, base_material).
0.82::acc(s16, base_material).
measured(s3, base_material, extruded_eg).
measured(s4, base_material, extruded_eg).
measured(s16, base_material, extruded_eg).
all_consistent(base_material) :- (indep(s3), consistent(s3, base_material) ; \+indep(s3)), (indep(s4), consistent(s4, base_material) ; \+indep(s4)), (indep(s16), consistent(s16, base_material) ; \+indep(s16)).
evidence(all_consistent(base_material)).
query(true_val(base_material, extruded_eg)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values standard_stone=Standard_Stone_Finish medium_stone=Medium_Stone_Finish
% @importance 0.78

0.45::true_val(base_type, standard_stone); 0.55::true_val(base_type, medium_stone).
0.82::acc(s15, base_type).
0.80::acc(s10, base_type).
0.85::acc(s3, base_type).
measured(s15, base_type, standard_stone).
measured(s10, base_type, standard_stone).
measured(s3, base_type, medium_stone).
all_consistent(base_type) :- (indep(s15), consistent(s15, base_type) ; \+indep(s15)), (indep(s10), consistent(s10, base_type) ; \+indep(s10)), (indep(s3), consistent(s3, base_type) ; \+indep(s3)).
evidence(all_consistent(base_type)).
query(true_val(base_type, standard_stone)).
query(true_val(base_type, medium_stone)).

% @attr sustainability_certification_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values natural_wax_paraffin_free=Natural_wax_paraffin_free unk_sustainability_certification_wax=Unknown
% @importance 0.68

0.90::true_val(sustainability_certification_wax, natural_wax_paraffin_free); 0.10::true_val(sustainability_certification_wax, unk_sustainability_certification_wax).
0.82::acc(s10, sustainability_certification_wax).
0.80::acc(s12, sustainability_certification_wax).
measured(s10, sustainability_certification_wax, natural_wax_paraffin_free).
measured(s12, sustainability_certification_wax, natural_wax_paraffin_free).
all_consistent(sustainability_certification_wax) :- (indep(s10), consistent(s10, sustainability_certification_wax) ; \+indep(s10)), (indep(s12), consistent(s12, sustainability_certification_wax) ; \+indep(s12)).
evidence(all_consistent(sustainability_certification_wax)).
query(true_val(sustainability_certification_wax, natural_wax_paraffin_free)).
query(true_val(sustainability_certification_wax, unk_sustainability_certification_wax)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_royal_cork_rails=ABS_sidewalls_Royal_Cork_Rails unk_sidewall_material=Unknown
% @importance 0.80

0.93::true_val(sidewall_material, abs_royal_cork_rails); 0.07::true_val(sidewall_material, unk_sidewall_material).
0.82::acc(s19, sidewall_material).
0.88::acc(s25, sidewall_material).
0.88::acc(s49, sidewall_material).
measured(s19, sidewall_material, abs_royal_cork_rails).
measured(s25, sidewall_material, abs_royal_cork_rails).
measured(s49, sidewall_material, abs_royal_cork_rails).
all_consistent(sidewall_material) :- (indep(s19), consistent(s19, sidewall_material) ; \+indep(s19)), (indep(s25), consistent(s25, sidewall_material) ; \+indep(s25)), (indep(s49), consistent(s49, sidewall_material) ; \+indep(s49)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_royal_cork_rails)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sustainability_certification_cork
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values cork_replaces_petroleum=Cork_pads_replace_petroleum_rubber unk_sustainability_certification_cork=Unknown
% @importance 0.70

0.90::true_val(sustainability_certification_cork, cork_replaces_petroleum); 0.10::true_val(sustainability_certification_cork, unk_sustainability_certification_cork).
0.88::acc(s2, sustainability_certification_cork).
0.82::acc(s28, sustainability_certification_cork).
measured(s2, sustainability_certification_cork, cork_replaces_petroleum).
measured(s28, sustainability_certification_cork, cork_replaces_petroleum).
all_consistent(sustainability_certification_cork) :- (indep(s2), consistent(s2, sustainability_certification_cork) ; \+indep(s2)), (indep(s28), consistent(s28, sustainability_certification_cork) ; \+indep(s28)).
evidence(all_consistent(sustainability_certification_cork)).
query(true_val(sustainability_certification_cork, cork_replaces_petroleum)).
query(true_val(sustainability_certification_cork, unk_sustainability_certification_cork)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.80

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
0.90::acc(sM, mounting_pattern).
0.88::acc(s108, mounting_pattern).
measured(sM, mounting_pattern, inserts_2x4).
measured(s108, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- (indep(sM), consistent(sM, mounting_pattern) ; \+indep(sM)), (indep(s108), consistent(s108, mounting_pattern) ; \+indep(s108)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values bevel_1_2=1_deg_sidecut_2_deg_between_feet bevel_1_5_1_5=1_5_deg_base_1_5_deg_side
% @importance 0.80

0.70::true_val(edge_bevel_spec, bevel_1_2); 0.30::true_val(edge_bevel_spec, bevel_1_5_1_5).
0.85::acc(s4, edge_bevel_spec).
0.85::acc(s15, edge_bevel_spec).
0.88::acc(sM, edge_bevel_spec).
0.82::acc(s10, edge_bevel_spec).
0.75::acc(s16, edge_bevel_spec).
measured(s4, edge_bevel_spec, bevel_1_2).
measured(s15, edge_bevel_spec, bevel_1_2).
measured(sM, edge_bevel_spec, bevel_1_2).
measured(s10, edge_bevel_spec, bevel_1_2).
measured(s16, edge_bevel_spec, bevel_1_5_1_5).
all_consistent(edge_bevel_spec) :- (indep(s4), consistent(s4, edge_bevel_spec) ; \+indep(s4)), (indep(s15), consistent(s15, edge_bevel_spec) ; \+indep(s15)), (indep(sM), consistent(sM, edge_bevel_spec) ; \+indep(sM)), (indep(s10), consistent(s10, edge_bevel_spec) ; \+indep(s10)), (indep(s16), consistent(s16, edge_bevel_spec) ; \+indep(s16)).
evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, bevel_1_2)).
query(true_val(edge_bevel_spec, bevel_1_5_1_5)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v419_95=419.95 unk_price_usd_msrp=Unknown
% @importance 0.85

0.97::true_val(price_usd_msrp, v419_95); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).
0.92::acc(s21, price_usd_msrp).
0.90::acc(s102, price_usd_msrp).
0.90::acc(s108, price_usd_msrp).
measured(s21, price_usd_msrp, v419_95).
measured(s102, price_usd_msrp, v419_95).
measured(s108, price_usd_msrp, v419_95).
all_consistent(price_usd_msrp) :- (indep(s21), consistent(s21, price_usd_msrp) ; \+indep(s21)), (indep(s102), consistent(s102, price_usd_msrp) ; \+indep(s102)), (indep(s108), consistent(s108, price_usd_msrp) ; \+indep(s108)).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v419_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v649_99=649.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v649_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
0.95::acc(sM, price_aud_merchant).
measured(sM, price_aud_merchant, v649_99).
all_consistent(price_aud_merchant) :- (indep(sM), consistent(sM, price_aud_merchant) ; \+indep(sM)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v649_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_ski_bum
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price — The Ski Bum
% @values v293_97=293.97 unk_price_usd_ski_bum=Unknown
% @importance 0.90

0.90::true_val(price_usd_ski_bum, v293_97); 0.10::true_val(price_usd_ski_bum, unk_price_usd_ski_bum).
0.90::acc(s21, price_usd_ski_bum).
measured(s21, price_usd_ski_bum, v293_97).
all_consistent(price_usd_ski_bum) :- (indep(s21), consistent(s21, price_usd_ski_bum) ; \+indep(s21)).
evidence(all_consistent(price_usd_ski_bum)).
query(true_val(price_usd_ski_bum, v293_97)).
query(true_val(price_usd_ski_bum, unk_price_usd_ski_bum)).

% @attr price_usd_potter_brothers
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price — Potter Brothers
% @values v289_95=289.95 unk_price_usd_potter_brothers=Unknown
% @importance 0.75

0.88::true_val(price_usd_potter_brothers, v289_95); 0.12::true_val(price_usd_potter_brothers, unk_price_usd_potter_brothers).
0.85::acc(s30, price_usd_potter_brothers).
measured(s30, price_usd_potter_brothers, v289_95).
all_consistent(price_usd_potter_brothers) :- (indep(s30), consistent(s30, price_usd_potter_brothers) ; \+indep(s30)).
evidence(all_consistent(price_usd_potter_brothers)).
query(true_val(price_usd_potter_brothers, v289_95)).
query(true_val(price_usd_potter_brothers, unk_price_usd_potter_brothers)).

% @attr price_usd_winter_is_calling
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price — Winter Is Calling
% @values v299_98=299.98 unk_price_usd_winter_is_calling=Unknown
% @importance 0.85

0.87::true_val(price_usd_winter_is_calling, v299_98); 0.13::true_val(price_usd_winter_is_calling, unk_price_usd_winter_is_calling).
0.88::acc(s22, price_usd_winter_is_calling).
measured(s22, price_usd_winter_is_calling, v299_98).
all_consistent(price_usd_winter_is_calling) :- (indep(s22), consistent(s22, price_usd_winter_is_calling) ; \+indep(s22)).
evidence(all_consistent(price_usd_winter_is_calling)).
query(true_val(price_usd_winter_is_calling, v299_98)).
query(true_val(price_usd_winter_is_calling, unk_price_usd_winter_is_calling)).

% @attr price_usd_ski_pro_az
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price — Ski Pro AZ
% @values v299_95=299.95 unk_price_usd_ski_pro_az=Unknown
% @importance 0.75

0.85::true_val(price_usd_ski_pro_az, v299_95); 0.15::true_val(price_usd_ski_pro_az, unk_price_usd_ski_pro_az).
0.85::acc(s105, price_usd_ski_pro_az).
measured(s105, price_usd_ski_pro_az, v299_95).
all_consistent(price_usd_ski_pro_az) :- (indep(s105), consistent(s105, price_usd_ski_pro_az) ; \+indep(s105)).
evidence(all_consistent(price_usd_ski_pro_az)).
query(true_val(price_usd_ski_pro_az, v299_95)).
query(true_val(price_usd_ski_pro_az, unk_price_usd_ski_pro_az)).

% @attr price_usd_utahskis
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price — UtahSkis
% @values v304_99=304.99 unk_price_usd_utahskis=Unknown
% @importance 0.80

0.87::true_val(price_usd_utahskis, v304_99); 0.13::true_val(price_usd_utahskis, unk_price_usd_utahskis).
0.88::acc(s102, price_usd_utahskis).
measured(s102, price_usd_utahskis, v304_99).
all_consistent(price_usd_utahskis) :- (indep(s102), consistent(s102, price_usd_utahskis) ; \+indep(s102)).
evidence(all_consistent(price_usd_utahskis)).
query(true_val(price_usd_utahskis, v304_99)).
query(true_val(price_usd_utahskis, unk_price_usd_utahskis)).

% @attr price_usd_the_house
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at The House (2026 model via Good Ride)
% @values v359_95=359.95 unk_price_usd_the_house=Unknown
% @importance 0.90

0.82::true_val(price_usd_the_house, v359_95); 0.18::true_val(price_usd_the_house, unk_price_usd_the_house).
0.83::acc(s61, price_usd_the_house).
measured(s61, price_usd_the_house, v359_95).
all_consistent(price_usd_the_house) :- consistent(s61, price_usd_the_house).
evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v359_95)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v314_96=314.96 unk_price_usd_evo=Unknown
% @importance 0.90

0.82::true_val(price_usd_evo, v314_96); 0.18::true_val(price_usd_evo, unk_price_usd_evo).
0.83::acc(s61, price_usd_evo).
measured(s61, price_usd_evo, v314_96).
all_consistent(price_usd_evo) :- consistent(s61, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v314_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v359_96=359.96 unk_price_usd_backcountry=Unknown
% @importance 0.90

0.82::true_val(price_usd_backcountry, v359_96); 0.18::true_val(price_usd_backcountry, unk_price_usd_backcountry).
0.83::acc(s61, price_usd_backcountry).
measured(s61, price_usd_backcountry, v359_96).
all_consistent(price_usd_backcountry) :- consistent(s61, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v359_96)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v359_95t=359.95 unk_price_usd_tactics=Unknown
% @importance 0.90

0.82::true_val(price_usd_tactics, v359_95t); 0.18::true_val(price_usd_tactics, unk_price_usd_tactics).
0.83::acc(s61, price_usd_tactics).
measured(s61, price_usd_tactics, v359_95t).
all_consistent(price_usd_tactics) :- consistent(s61, price_usd_tactics).
evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v359_95t)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_the_good_ride
% @type numeric
% @unit USD
% @canonical false
% @original_name The Good Ride list price (model-generic)
% @values v299=299.0 unk_price_usd_the_good_ride=Unknown
% @importance 0.90

0.78::true_val(price_usd_the_good_ride, v299); 0.22::true_val(price_usd_the_good_ride, unk_price_usd_the_good_ride).
0.80::acc(s61, price_usd_the_good_ride).
measured(s61, price_usd_the_good_ride, v299).
all_consistent(price_usd_the_good_ride) :- consistent(s61, price_usd_the_good_ride).
evidence(all_consistent(price_usd_the_good_ride)).
query(true_val(price_usd_the_good_ride, v299)).
query(true_val(price_usd_the_good_ride, unk_price_usd_the_good_ride)).

% @attr reviewer_opinion_whitelines_value
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values bargain_400=All_for_400_bucks_bargain unk_reviewer_opinion_whitelines_value=Unknown
% @importance 0.85

0.83::true_val(reviewer_opinion_whitelines_value, bargain_400); 0.17::true_val(reviewer_opinion_whitelines_value, unk_reviewer_opinion_whitelines_value).
0.85::acc(s42, reviewer_opinion_whitelines_value).
measured(s42, reviewer_opinion_whitelines_value, bargain_400).
all_consistent(reviewer_opinion_whitelines_value) :- consistent(s42, reviewer_opinion_whitelines_value).
evidence(all_consistent(reviewer_opinion_whitelines_value)).
query(true_val(reviewer_opinion_whitelines_value, bargain_400)).
query(true_val(reviewer_opinion_whitelines_value, unk_reviewer_opinion_whitelines_value)).

% @attr price_category
% @type categorical
% @canonical false
% @original_name Price category
% @values budget_entry_level=Budget_entry_level_all_mountain unk_price_category=Unknown
% @importance 0.85

0.88::true_val(price_category, budget_entry_level); 0.12::true_val(price_category, unk_price_category).
0.85::acc(s42, price_category).
0.85::acc(s41, price_category).
measured(s42, price_category, budget_entry_level).
measured(s41, price_category, budget_entry_level).
all_consistent(price_category) :- consistent(s42, price_category), consistent(s41, price_category).
evidence(all_consistent(price_category)).
query(true_val(price_category, budget_entry_level)).
query(true_val(price_category, unk_price_category)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2024_2025=Listed_2024_2025 unk_availability_status_rei=Unknown
% @importance 0.80

0.90::true_val(availability_status_rei, listed_2024_2025); 0.10::true_val(availability_status_rei, unk_availability_status_rei).
0.88::acc(s9, availability_status_rei).
measured(s9, availability_status_rei, listed_2024_2025).
all_consistent(availability_status_rei) :- (indep(s9), consistent(s9, availability_status_rei) ; \+indep(s9)).
evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, listed_2024_2025)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_2026=2026_model_in_stock unk_availability_status_evo=Unknown
% @importance 0.80

0.88::true_val(availability_status_evo, in_stock_2026); 0.12::true_val(availability_status_evo, unk_availability_status_evo).
0.85::acc(s16, availability_status_evo).
measured(s16, availability_status_evo, in_stock_2026).
all_consistent(availability_status_evo) :- (indep(s16), consistent(s16, availability_status_evo) ; \+indep(s16)).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_2026)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status
% @values closeout_2025_in_stock_2026=2025_closeout_2026_in_stock unk_availability_status_tactics=Unknown
% @importance 0.80

0.90::true_val(availability_status_tactics, closeout_2025_in_stock_2026); 0.10::true_val(availability_status_tactics, unk_availability_status_tactics).
0.85::acc(s25, availability_status_tactics).
0.85::acc(s49, availability_status_tactics).
measured(s25, availability_status_tactics, closeout_2025_in_stock_2026).
measured(s49, availability_status_tactics, closeout_2025_in_stock_2026).
all_consistent(availability_status_tactics) :- (indep(s25), consistent(s25, availability_status_tactics) ; \+indep(s25)), (indep(s49), consistent(s49, availability_status_tactics) ; \+indep(s49)).
evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, closeout_2025_in_stock_2026)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2025=2025_listed unk_availability_status_backcountry=Unknown
% @importance 0.60

0.87::true_val(availability_status_backcountry, listed_2025); 0.13::true_val(availability_status_backcountry, unk_availability_status_backcountry).
0.85::acc(s17, availability_status_backcountry).
measured(s17, availability_status_backcountry, listed_2025).
all_consistent(availability_status_backcountry) :- (indep(s17), consistent(s17, availability_status_backcountry) ; \+indep(s17)).
evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, listed_2025)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_ski_bum
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_limited=In_stock_limited_quantities unk_availability_status_ski_bum=Unknown
% @importance 0.90

0.88::true_val(availability_status_ski_bum, in_stock_limited); 0.12::true_val(availability_status_ski_bum, unk_availability_status_ski_bum).
0.88::acc(s21, availability_status_ski_bum).
measured(s21, availability_status_ski_bum, in_stock_limited).
all_consistent(availability_status_ski_bum) :- (indep(s21), consistent(s21, availability_status_ski_bum) ; \+indep(s21)).
evidence(all_consistent(availability_status_ski_bum)).
query(true_val(availability_status_ski_bum, in_stock_limited)).
query(true_val(availability_status_ski_bum, unk_availability_status_ski_bum)).

% @attr availability_status_potter
% @type categorical
% @canonical false
% @original_name availability_status
% @values sale_sold_out=Sale_sold_out unk_availability_status_potter=Unknown
% @importance 0.75

0.87::true_val(availability_status_potter, sale_sold_out); 0.13::true_val(availability_status_potter, unk_availability_status_potter).
0.85::acc(s30, availability_status_potter).
measured(s30, availability_status_potter, sale_sold_out).
all_consistent(availability_status_potter) :- (indep(s30), consistent(s30, availability_status_potter) ; \+indep(s30)).
evidence(all_consistent(availability_status_potter)).
query(true_val(availability_status_potter, sale_sold_out)).
query(true_val(availability_status_potter, unk_availability_status_potter)).

% @attr availability_status_ski_barn
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_multiple=In_stock_multiple_sizes unk_availability_status_ski_barn=Unknown
% @importance 0.80

0.85::true_val(availability_status_ski_barn, in_stock_multiple); 0.15::true_val(availability_status_ski_barn, unk_availability_status_ski_barn).
0.82::acc(s106, availability_status_ski_barn).
measured(s106, availability_status_ski_barn, in_stock_multiple).
all_consistent(availability_status_ski_barn) :- (indep(s106), consistent(s106, availability_status_ski_barn) ; \+indep(s106)).
evidence(all_consistent(availability_status_ski_barn)).
query(true_val(availability_status_ski_barn, in_stock_multiple)).
query(true_val(availability_status_ski_barn, unk_availability_status_ski_barn)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2025b=2025_listed unk_availability_status_blauer=Unknown
% @importance 0.85

0.88::true_val(availability_status_blauer, listed_2025b); 0.12::true_val(availability_status_blauer, unk_availability_status_blauer).
0.85::acc(s15, availability_status_blauer).
measured(s15, availability_status_blauer, listed_2025b).
all_consistent(availability_status_blauer) :- (indep(s15), consistent(s15, availability_status_blauer) ; \+indep(s15)).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, listed_2025b)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_utahskis
% @type categorical
% @canonical false
% @original_name availability_status
% @values out_of_stock=Out_of_stock unk_availability_status_utahskis=Unknown
% @importance 0.80

0.87::true_val(availability_status_utahskis, out_of_stock); 0.13::true_val(availability_status_utahskis, unk_availability_status_utahskis).
0.85::acc(s102, availability_status_utahskis).
measured(s102, availability_status_utahskis, out_of_stock).
all_consistent(availability_status_utahskis) :- (indep(s102), consistent(s102, availability_status_utahskis) ; \+indep(s102)).
evidence(all_consistent(availability_status_utahskis)).
query(true_val(availability_status_utahskis, out_of_stock)).
query(true_val(availability_status_utahskis, unk_availability_status_utahskis)).

% @attr availability_status_snowboards_com
% @type categorical
% @canonical false
% @original_name availability_status
% @values discount_20pct=20_percent_off unk_availability_status_snowboards_com=Unknown
% @importance 0.75

0.87::true_val(availability_status_snowboards_com, discount_20pct); 0.13::true_val(availability_status_snowboards_com, unk_availability_status_snowboards_com).
0.85::acc(s108, availability_status_snowboards_com).
measured(s108, availability_status_snowboards_com, discount_20pct).
all_consistent(availability_status_snowboards_com) :- (indep(s108), consistent(s108, availability_status_snowboards_com) ; \+indep(s108)).
evidence(all_consistent(availability_status_snowboards_com)).
query(true_val(availability_status_snowboards_com, discount_20pct)).
query(true_val(availability_status_snowboards_com, unk_availability_status_snowboards_com)).

% @attr availability_status_ski_pro
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out_all=Sold_out_all_sizes unk_availability_status_ski_pro=Unknown
% @importance 0.75

0.85::true_val(availability_status_ski_pro, sold_out_all); 0.15::true_val(availability_status_ski_pro, unk_availability_status_ski_pro).
0.83::acc(s105, availability_status_ski_pro).
measured(s105, availability_status_ski_pro, sold_out_all).
all_consistent(availability_status_ski_pro) :- (indep(s105), consistent(s105, availability_status_ski_pro) ; \+indep(s105)).
evidence(all_consistent(availability_status_ski_pro)).
query(true_val(availability_status_ski_pro, sold_out_all)).
query(true_val(availability_status_ski_pro, unk_availability_status_ski_pro)).

% @attr availability_status_shred_shop
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out_all_ss=Sold_out_all_sizes_419_95 unk_availability_status_shred_shop=Unknown
% @importance 0.70

0.84::true_val(availability_status_shred_shop, sold_out_all_ss); 0.16::true_val(availability_status_shred_shop, unk_availability_status_shred_shop).
0.82::acc(s109, availability_status_shred_shop).
measured(s109, availability_status_shred_shop, sold_out_all_ss).
all_consistent(availability_status_shred_shop) :- (indep(s109), consistent(s109, availability_status_shred_shop) ; \+indep(s109)).
evidence(all_consistent(availability_status_shred_shop)).
query(true_val(availability_status_shred_shop, sold_out_all_ss)).
query(true_val(availability_status_shred_shop, unk_availability_status_shred_shop)).

% @attr availability_status_winter_calling
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out_299_98=Sold_out_at_299_98 unk_availability_status_winter_calling=Unknown
% @importance 0.85

0.87::true_val(availability_status_winter_calling, sold_out_299_98); 0.13::true_val(availability_status_winter_calling, unk_availability_status_winter_calling).
0.85::acc(s22, availability_status_winter_calling).
measured(s22, availability_status_winter_calling, sold_out_299_98).
all_consistent(availability_status_winter_calling) :- (indep(s22), consistent(s22, availability_status_winter_calling) ; \+indep(s22)).
evidence(all_consistent(availability_status_winter_calling)).
query(true_val(availability_status_winter_calling, sold_out_299_98)).
query(true_val(availability_status_winter_calling, unk_availability_status_winter_calling)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values listed_official=Listed_on_salomon_com unk_availability_status=Unknown
% @importance 1.00

0.95::true_val(availability_status, listed_official); 0.05::true_val(availability_status, unk_availability_status).
0.93::acc(s32, availability_status).
measured(s32, availability_status, listed_official).
all_consistent(availability_status) :- consistent(s32, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, listed_official)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_absolute_snow
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2025_uk=Listed_2025_UK unk_availability_status_absolute_snow=Unknown
% @importance 0.70

0.87::true_val(availability_status_absolute_snow, listed_2025_uk); 0.13::true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow).
0.82::acc(s1, availability_status_absolute_snow).
measured(s1, availability_status_absolute_snow, listed_2025_uk).
all_consistent(availability_status_absolute_snow) :- (indep(s1), consistent(s1, availability_status_absolute_snow) ; \+indep(s1)).
evidence(all_consistent(availability_status_absolute_snow)).
query(true_val(availability_status_absolute_snow, listed_2025_uk)).
query(true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow)).

% @attr availability_status_summary
% @type categorical
% @canonical false
% @original_name availability_status
% @values closeout_2025_current_2026=2025_closeout_sold_out_2026_current unk_availability_status_summary=Unknown
% @importance 0.80

0.88::true_val(availability_status_summary, closeout_2025_current_2026); 0.12::true_val(availability_status_summary, unk_availability_status_summary).
0.83::acc(s16, availability_status_summary).
0.83::acc(s25, availability_status_summary).
measured(s16, availability_status_summary, closeout_2025_current_2026).
measured(s25, availability_status_summary, closeout_2025_current_2026).
all_consistent(availability_status_summary) :- (indep(s16), consistent(s16, availability_status_summary) ; \+indep(s16)), (indep(s25), consistent(s25, availability_status_summary) ; \+indep(s25)).
evidence(all_consistent(availability_status_summary)).
query(true_val(availability_status_summary, closeout_2025_current_2026)).
query(true_val(availability_status_summary, unk_availability_status_summary)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values all_mountain_tgr=All_Mountain unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.90

0.82::true_val(reviewer_opinion_the_good_ride, all_mountain_tgr); 0.18::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.85::acc(s61, reviewer_opinion_the_good_ride).
measured(s61, reviewer_opinion_the_good_ride, all_mountain_tgr).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s61, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, all_mountain_tgr)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.90

0.82::true_val(on_snow_feel_tgr, stable); 0.18::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
0.85::acc(s61, on_snow_feel_tgr).
measured(s61, on_snow_feel_tgr, stable).
all_consistent(on_snow_feel_tgr) :- consistent(s61, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.90

0.82::true_val(turn_initiation_performance, medium_fast); 0.18::true_val(turn_initiation_performance, unk_turn_initiation_performance).
0.85::acc(s61, turn_initiation_performance).
measured(s61, turn_initiation_performance, medium_fast).
all_consistent(turn_initiation_performance) :- consistent(s61, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_the_good_ride_flex
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values moderate=Moderate unk_reviewer_opinion_the_good_ride_flex=Unknown
% @importance 0.90

0.82::true_val(reviewer_opinion_the_good_ride_flex, moderate); 0.18::true_val(reviewer_opinion_the_good_ride_flex, unk_reviewer_opinion_the_good_ride_flex).
0.85::acc(s61, reviewer_opinion_the_good_ride_flex).
measured(s61, reviewer_opinion_the_good_ride_flex, moderate).
all_consistent(reviewer_opinion_the_good_ride_flex) :- consistent(s61, reviewer_opinion_the_good_ride_flex).
evidence(all_consistent(reviewer_opinion_the_good_ride_flex)).
query(true_val(reviewer_opinion_the_good_ride_flex, moderate)).
query(true_val(reviewer_opinion_the_good_ride_flex, unk_reviewer_opinion_the_good_ride_flex)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values poor=Poor_needs_back_leg_work unk_powder_rating_tgr=Unknown
% @importance 0.90

0.82::true_val(powder_rating_tgr, poor); 0.18::true_val(powder_rating_tgr, unk_powder_rating_tgr).
0.85::acc(s61, powder_rating_tgr).
measured(s61, powder_rating_tgr, poor).
all_consistent(powder_rating_tgr) :- consistent(s61, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, poor)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values below_average=Below_average_extruded unk_base_glide_performance=Unknown
% @importance 0.90

0.82::true_val(base_glide_performance, below_average); 0.18::true_val(base_glide_performance, unk_base_glide_performance).
0.85::acc(s61, base_glide_performance).
measured(s61, base_glide_performance, below_average).
all_consistent(base_glide_performance) :- consistent(s61, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, below_average)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values good=Good unk_carving_rating_tgr=Unknown
% @importance 0.90

0.82::true_val(carving_rating_tgr, good); 0.18::true_val(carving_rating_tgr, unk_carving_rating_tgr).
0.85::acc(s61, carving_rating_tgr).
measured(s61, carving_rating_tgr, good).
all_consistent(carving_rating_tgr) :- consistent(s61, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, good)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values poor_limited=Poor_limited_by_base_and_flex unk_speed_rating_tgr=Unknown
% @importance 0.90

0.82::true_val(speed_rating_tgr, poor_limited); 0.18::true_val(speed_rating_tgr, unk_speed_rating_tgr).
0.85::acc(s61, speed_rating_tgr).
measured(s61, speed_rating_tgr, poor_limited).
all_consistent(speed_rating_tgr) :- consistent(s61, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, poor_limited)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values good_chewed_groomers=Good_handles_chewed_groomers unk_chatter_performance=Unknown
% @importance 0.90

0.82::true_val(chatter_performance, good_chewed_groomers); 0.18::true_val(chatter_performance, unk_chatter_performance).
0.85::acc(s61, chatter_performance).
measured(s61, chatter_performance, good_chewed_groomers).
all_consistent(chatter_performance) :- consistent(s61, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, good_chewed_groomers)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values good_centered=Good_centered_stance_achievable unk_switch_riding=Unknown
% @importance 0.90

0.82::true_val(switch_riding, good_centered); 0.18::true_val(switch_riding, unk_switch_riding).
0.85::acc(s61, switch_riding).
measured(s61, switch_riding, good_centered).
all_consistent(switch_riding) :- consistent(s61, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, good_centered)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values good_pop=Good_pop_for_ollies_stable unk_jumps_rating_tgr=Unknown
% @importance 0.90

0.82::true_val(jumps_rating_tgr, good_pop); 0.18::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
0.85::acc(s61, jumps_rating_tgr).
measured(s61, jumps_rating_tgr, good_pop).
all_consistent(jumps_rating_tgr) :- consistent(s61, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good_pop)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average_not_best_rail_jib unk_jibbing_rating_tgr=Unknown
% @importance 0.90

0.82::true_val(jibbing_rating_tgr, average); 0.18::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
0.85::acc(s61, jibbing_rating_tgr).
measured(s61, jibbing_rating_tgr, average).
all_consistent(jibbing_rating_tgr) :- consistent(s61, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values good_beginner=Good_beginner_pipe_board unk_pipe_rating_tgr=Unknown
% @importance 0.90

0.82::true_val(pipe_rating_tgr, good_beginner); 0.18::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
0.85::acc(s61, pipe_rating_tgr).
measured(s61, pipe_rating_tgr, good_beginner).
all_consistent(pipe_rating_tgr) :- consistent(s61, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good_beginner)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values medium_snow=Medium_Snow unk_edge_hold=Unknown
% @importance 0.90

0.82::true_val(edge_hold, medium_snow); 0.18::true_val(edge_hold, unk_edge_hold).
0.85::acc(s61, edge_hold).
measured(s61, edge_hold, medium_snow).
all_consistent(edge_hold) :- consistent(s61, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, medium_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr reviewer_opinion_the_good_ride_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values feels_normal=Feels_Normal unk_reviewer_opinion_the_good_ride_weight=Unknown
% @importance 0.90

0.82::true_val(reviewer_opinion_the_good_ride_weight, feels_normal); 0.18::true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight).
0.85::acc(s61, reviewer_opinion_the_good_ride_weight).
measured(s61, reviewer_opinion_the_good_ride_weight, feels_normal).
all_consistent(reviewer_opinion_the_good_ride_weight) :- consistent(s61, reviewer_opinion_the_good_ride_weight).
evidence(all_consistent(reviewer_opinion_the_good_ride_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, feels_normal)).
query(true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values top_100_award=Top_100_snowboard_products_award unk_reviewer_opinion_whitelines=Unknown
% @importance 0.78

0.88::true_val(reviewer_opinion_whitelines, top_100_award); 0.12::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).
0.85::acc(s42, reviewer_opinion_whitelines).
0.85::acc(s44, reviewer_opinion_whitelines).
measured(s42, reviewer_opinion_whitelines, top_100_award).
measured(s44, reviewer_opinion_whitelines, top_100_award).
all_consistent(reviewer_opinion_whitelines) :- consistent(s42, reviewer_opinion_whitelines), consistent(s44, reviewer_opinion_whitelines).
evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, top_100_award)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_assessment
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values good_choice_budget=Genuinely_good_choice_budget_freeride unk_reviewer_opinion_whitelines_assessment=Unknown
% @importance 0.85

0.83::true_val(reviewer_opinion_whitelines_assessment, good_choice_budget); 0.17::true_val(reviewer_opinion_whitelines_assessment, unk_reviewer_opinion_whitelines_assessment).
0.85::acc(s42, reviewer_opinion_whitelines_assessment).
measured(s42, reviewer_opinion_whitelines_assessment, good_choice_budget).
all_consistent(reviewer_opinion_whitelines_assessment) :- consistent(s42, reviewer_opinion_whitelines_assessment).
evidence(all_consistent(reviewer_opinion_whitelines_assessment)).
query(true_val(reviewer_opinion_whitelines_assessment, good_choice_budget)).
query(true_val(reviewer_opinion_whitelines_assessment, unk_reviewer_opinion_whitelines_assessment)).

% @attr reviewer_opinion_whitelines_terrain
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values steer_clear_steep=Steer_clear_steep_lean_powder_trees unk_reviewer_opinion_whitelines_terrain=Unknown
% @importance 0.85

0.83::true_val(reviewer_opinion_whitelines_terrain, steer_clear_steep); 0.17::true_val(reviewer_opinion_whitelines_terrain, unk_reviewer_opinion_whitelines_terrain).
0.85::acc(s42, reviewer_opinion_whitelines_terrain).
measured(s42, reviewer_opinion_whitelines_terrain, steer_clear_steep).
all_consistent(reviewer_opinion_whitelines_terrain) :- consistent(s42, reviewer_opinion_whitelines_terrain).
evidence(all_consistent(reviewer_opinion_whitelines_terrain)).
query(true_val(reviewer_opinion_whitelines_terrain, steer_clear_steep)).
query(true_val(reviewer_opinion_whitelines_terrain, unk_reviewer_opinion_whitelines_terrain)).

% @attr reviewer_opinion_the_good_ride_summary
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values mellow_brother_effect=Mellow_little_brother_to_Effect unk_reviewer_opinion_the_good_ride_summary=Unknown
% @importance 0.90

0.85::true_val(reviewer_opinion_the_good_ride_summary, mellow_brother_effect); 0.15::true_val(reviewer_opinion_the_good_ride_summary, unk_reviewer_opinion_the_good_ride_summary).
0.88::acc(s41, reviewer_opinion_the_good_ride_summary).
measured(s41, reviewer_opinion_the_good_ride_summary, mellow_brother_effect).
all_consistent(reviewer_opinion_the_good_ride_summary) :- consistent(s41, reviewer_opinion_the_good_ride_summary).
evidence(all_consistent(reviewer_opinion_the_good_ride_summary)).
query(true_val(reviewer_opinion_the_good_ride_summary, mellow_brother_effect)).
query(true_val(reviewer_opinion_the_good_ride_summary, unk_reviewer_opinion_the_good_ride_summary)).

% @attr reviewer_opinion_the_good_ride_powder
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values not_ideal_deep_powder=Not_ideal_deep_powder_back_leg_effort unk_reviewer_opinion_the_good_ride_powder=Unknown
% @importance 0.90

0.82::true_val(reviewer_opinion_the_good_ride_powder, not_ideal_deep_powder); 0.18::true_val(reviewer_opinion_the_good_ride_powder, unk_reviewer_opinion_the_good_ride_powder).
0.85::acc(s61, reviewer_opinion_the_good_ride_powder).
measured(s61, reviewer_opinion_the_good_ride_powder, not_ideal_deep_powder).
all_consistent(reviewer_opinion_the_good_ride_powder) :- consistent(s61, reviewer_opinion_the_good_ride_powder).
evidence(all_consistent(reviewer_opinion_the_good_ride_powder)).
query(true_val(reviewer_opinion_the_good_ride_powder, not_ideal_deep_powder)).
query(true_val(reviewer_opinion_the_good_ride_powder, unk_reviewer_opinion_the_good_ride_powder)).

% @attr snow_magazine_review
% @type categorical
% @canonical false
% @original_name Snow Magazine review (2019-20)
% @values good_solid_beginner=Good_solid_snowboard_beginners_progress unk_snow_magazine_review=Unknown
% @importance 0.75

0.80::true_val(snow_magazine_review, good_solid_beginner); 0.20::true_val(snow_magazine_review, unk_snow_magazine_review).
0.80::acc(s48, snow_magazine_review).
measured(s48, snow_magazine_review, good_solid_beginner).
all_consistent(snow_magazine_review) :- consistent(s48, snow_magazine_review).
evidence(all_consistent(snow_magazine_review)).
query(true_val(snow_magazine_review, good_solid_beginner)).
query(true_val(snow_magazine_review, unk_snow_magazine_review)).

% @attr snow_magazine_limitation
% @type categorical
% @canonical false
% @original_name Snow Magazine limitation
% @values wash_out_high_speed=Washes_out_higher_speeds_long_carves unk_snow_magazine_limitation=Unknown
% @importance 0.75

0.80::true_val(snow_magazine_limitation, wash_out_high_speed); 0.20::true_val(snow_magazine_limitation, unk_snow_magazine_limitation).
0.80::acc(s48, snow_magazine_limitation).
measured(s48, snow_magazine_limitation, wash_out_high_speed).
all_consistent(snow_magazine_limitation) :- consistent(s48, snow_magazine_limitation).
evidence(all_consistent(snow_magazine_limitation)).
query(true_val(snow_magazine_limitation, wash_out_high_speed)).
query(true_val(snow_magazine_limitation, unk_snow_magazine_limitation)).

% @attr reviewer_opinion_whitelines_quality
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values low_price_not_low_quality=Low_price_not_low_quality unk_reviewer_opinion_whitelines_quality=Unknown
% @importance 0.60

0.80::true_val(reviewer_opinion_whitelines_quality, low_price_not_low_quality); 0.20::true_val(reviewer_opinion_whitelines_quality, unk_reviewer_opinion_whitelines_quality).
0.78::acc(s45, reviewer_opinion_whitelines_quality).
measured(s45, reviewer_opinion_whitelines_quality, low_price_not_low_quality).
all_consistent(reviewer_opinion_whitelines_quality) :- consistent(s45, reviewer_opinion_whitelines_quality).
evidence(all_consistent(reviewer_opinion_whitelines_quality)).
query(true_val(reviewer_opinion_whitelines_quality, low_price_not_low_quality)).
query(true_val(reviewer_opinion_whitelines_quality, unk_reviewer_opinion_whitelines_quality)).

% @attr snowboardingdays_review
% @type categorical
% @canonical false
% @original_name SnowboardingDays review
% @values best_freeride_beginner=Best_freeride_snowboard_beginners unk_snowboardingdays_review=Unknown
% @importance 0.80

0.82::true_val(snowboardingdays_review, best_freeride_beginner); 0.18::true_val(snowboardingdays_review, unk_snowboardingdays_review).
0.80::acc(s131, snowboardingdays_review).
measured(s131, snowboardingdays_review, best_freeride_beginner).
all_consistent(snowboardingdays_review) :- consistent(s131, snowboardingdays_review).
evidence(all_consistent(snowboardingdays_review)).
query(true_val(snowboardingdays_review, best_freeride_beginner)).
query(true_val(snowboardingdays_review, unk_snowboardingdays_review)).

% @attr merchant_customer_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Merchant customer rating
% @values v5_0=5.0 unk_merchant_customer_rating=Unknown
% @importance 0.85

0.90::true_val(merchant_customer_rating, v5_0); 0.10::true_val(merchant_customer_rating, unk_merchant_customer_rating).
0.88::acc(sM, merchant_customer_rating).
measured(sM, merchant_customer_rating, v5_0).
all_consistent(merchant_customer_rating) :- (indep(sM), consistent(sM, merchant_customer_rating) ; \+indep(sM)).
evidence(all_consistent(merchant_customer_rating)).
query(true_val(merchant_customer_rating, v5_0)).
query(true_val(merchant_customer_rating, unk_merchant_customer_rating)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values top_10_beginner_directional=Top_10_beginner_most_directional unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.75

0.80::true_val(reviewer_opinion_snowboardingprofiles, top_10_beginner_directional); 0.20::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
0.78::acc(s53, reviewer_opinion_snowboardingprofiles).
measured(s53, reviewer_opinion_snowboardingprofiles, top_10_beginner_directional).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s53, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, top_10_beginner_directional)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values good_first_board_camber=Good_first_board_camber_progression unk_user_review_forum=Unknown
% @importance 0.70

0.75::true_val(user_review_forum, good_first_board_camber); 0.25::true_val(user_review_forum, unk_user_review_forum).
0.70::acc(s122, user_review_forum).
measured(s122, user_review_forum, good_first_board_camber).
all_consistent(user_review_forum) :- consistent(s122, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, good_first_board_camber)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_edges
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values edges_sharp_12_plus=Edges_sharp_after_12_plus_outings_ice unk_user_review_forum_edges=Unknown
% @importance 0.75

0.72::true_val(user_review_forum_edges, edges_sharp_12_plus); 0.28::true_val(user_review_forum_edges, unk_user_review_forum_edges).
0.68::acc(s92, user_review_forum_edges).
measured(s92, user_review_forum_edges, edges_sharp_12_plus).
all_consistent(user_review_forum_edges) :- consistent(s92, user_review_forum_edges).
evidence(all_consistent(user_review_forum_edges)).
query(true_val(user_review_forum_edges, edges_sharp_12_plus)).
query(true_val(user_review_forum_edges, unk_user_review_forum_edges)).

% @attr user_review_forum_wax
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values does_not_hold_wax=Does_not_hold_wax_well_extruded unk_user_review_forum_wax=Unknown
% @importance 0.75

0.72::true_val(user_review_forum_wax, does_not_hold_wax); 0.28::true_val(user_review_forum_wax, unk_user_review_forum_wax).
0.68::acc(s92, user_review_forum_wax).
measured(s92, user_review_forum_wax, does_not_hold_wax).
all_consistent(user_review_forum_wax) :- consistent(s92, user_review_forum_wax).
evidence(all_consistent(user_review_forum_wax)).
query(true_val(user_review_forum_wax, does_not_hold_wax)).
query(true_val(user_review_forum_wax, unk_user_review_forum_wax)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values nidecker_amplid_burton=Nidecker_Escape_Amplid_Singular_Burton_Instigator unk_comparable_board_cross_brand=Unknown
% @importance 0.65

0.73::true_val(comparable_board_cross_brand, nidecker_amplid_burton); 0.27::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
0.70::acc(s94, comparable_board_cross_brand).
0.75::acc(s53, comparable_board_cross_brand).
measured(s94, comparable_board_cross_brand, nidecker_amplid_burton).
measured(s53, comparable_board_cross_brand, nidecker_amplid_burton).
all_consistent(comparable_board_cross_brand) :- consistent(s94, comparable_board_cross_brand), consistent(s53, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, nidecker_amplid_burton)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr user_review_forum_value
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values good_price_performance=Good_price_performance_ratio unk_user_review_forum_value=Unknown
% @importance 0.65

0.70::true_val(user_review_forum_value, good_price_performance); 0.30::true_val(user_review_forum_value, unk_user_review_forum_value).
0.65::acc(s94, user_review_forum_value).
measured(s94, user_review_forum_value, good_price_performance).
all_consistent(user_review_forum_value) :- consistent(s94, user_review_forum_value).
evidence(all_consistent(user_review_forum_value)).
query(true_val(user_review_forum_value, good_price_performance)).
query(true_val(user_review_forum_value, unk_user_review_forum_value)).

% @attr comparable_board_cross_brand_burton
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_instigator_cultivator=Burton_Instigator_Cultivator_flat_softer unk_comparable_board_cross_brand_burton=Unknown
% @importance 0.78

0.80::true_val(comparable_board_cross_brand_burton, burton_instigator_cultivator); 0.20::true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton).
0.78::acc(s131, comparable_board_cross_brand_burton).
0.75::acc(s53, comparable_board_cross_brand_burton).
measured(s131, comparable_board_cross_brand_burton, burton_instigator_cultivator).
measured(s53, comparable_board_cross_brand_burton, burton_instigator_cultivator).
all_consistent(comparable_board_cross_brand_burton) :- consistent(s131, comparable_board_cross_brand_burton), consistent(s53, comparable_board_cross_brand_burton).
evidence(all_consistent(comparable_board_cross_brand_burton)).
query(true_val(comparable_board_cross_brand_burton, burton_instigator_cultivator)).
query(true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton)).

% @attr comparable_board_cross_brand_nitro
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values nitro_prime=Nitro_Prime_cheapest_beginner unk_comparable_board_cross_brand_nitro=Unknown
% @importance 0.75

0.78::true_val(comparable_board_cross_brand_nitro, nitro_prime); 0.22::true_val(comparable_board_cross_brand_nitro, unk_comparable_board_cross_brand_nitro).
0.75::acc(s53, comparable_board_cross_brand_nitro).
measured(s53, comparable_board_cross_brand_nitro, nitro_prime).
all_consistent(comparable_board_cross_brand_nitro) :- consistent(s53, comparable_board_cross_brand_nitro).
evidence(all_consistent(comparable_board_cross_brand_nitro)).
query(true_val(comparable_board_cross_brand_nitro, nitro_prime)).
query(true_val(comparable_board_cross_brand_nitro, unk_comparable_board_cross_brand_nitro)).

% @attr comparable_board_cross_brand_nidecker
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values nidecker_play=Nidecker_Play_versatile_beginner unk_comparable_board_cross_brand_nidecker=Unknown
% @importance 0.75

0.78::true_val(comparable_board_cross_brand_nidecker, nidecker_play); 0.22::true_val(comparable_board_cross_brand_nidecker, unk_comparable_board_cross_brand_nidecker).
0.75::acc(s53, comparable_board_cross_brand_nidecker).
measured(s53, comparable_board_cross_brand_nidecker, nidecker_play).
all_consistent(comparable_board_cross_brand_nidecker) :- consistent(s53, comparable_board_cross_brand_nidecker).
evidence(all_consistent(comparable_board_cross_brand_nidecker)).
query(true_val(comparable_board_cross_brand_nidecker, nidecker_play)).
query(true_val(comparable_board_cross_brand_nidecker, unk_comparable_board_cross_brand_nidecker)).

% @attr comparable_board_cross_brand_k2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values k2_gateway=K2_Gateway_easy_versatile unk_comparable_board_cross_brand_k2=Unknown
% @importance 0.75

0.78::true_val(comparable_board_cross_brand_k2, k2_gateway); 0.22::true_val(comparable_board_cross_brand_k2, unk_comparable_board_cross_brand_k2).
0.75::acc(s53, comparable_board_cross_brand_k2).
measured(s53, comparable_board_cross_brand_k2, k2_gateway).
all_consistent(comparable_board_cross_brand_k2) :- consistent(s53, comparable_board_cross_brand_k2).
evidence(all_consistent(comparable_board_cross_brand_k2)).
query(true_val(comparable_board_cross_brand_k2, k2_gateway)).
query(true_val(comparable_board_cross_brand_k2, unk_comparable_board_cross_brand_k2)).

% @attr comparable_board_cross_brand_rossignol
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values rossignol_ampage=Rossignol_Ampage_freestyle_beginner unk_comparable_board_cross_brand_rossignol=Unknown
% @importance 0.75

0.78::true_val(comparable_board_cross_brand_rossignol, rossignol_ampage); 0.22::true_val(comparable_board_cross_brand_rossignol, unk_comparable_board_cross_brand_rossignol).
0.75::acc(s53, comparable_board_cross_brand_rossignol).
measured(s53, comparable_board_cross_brand_rossignol, rossignol_ampage).
all_consistent(comparable_board_cross_brand_rossignol) :- consistent(s53, comparable_board_cross_brand_rossignol).
evidence(all_consistent(comparable_board_cross_brand_rossignol)).
query(true_val(comparable_board_cross_brand_rossignol, rossignol_ampage)).
query(true_val(comparable_board_cross_brand_rossignol, unk_comparable_board_cross_brand_rossignol)).

% @attr comparable_board_cross_brand_ripcord
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values sight_camber_vs_ripcord_flat=Sight_camber_better_progression_vs_Ripcord_flat unk_comparable_board_cross_brand_ripcord=Unknown
% @importance 0.70

0.73::true_val(comparable_board_cross_brand_ripcord, sight_camber_vs_ripcord_flat); 0.27::true_val(comparable_board_cross_brand_ripcord, unk_comparable_board_cross_brand_ripcord).
0.70::acc(s122, comparable_board_cross_brand_ripcord).
measured(s122, comparable_board_cross_brand_ripcord, sight_camber_vs_ripcord_flat).
all_consistent(comparable_board_cross_brand_ripcord) :- consistent(s122, comparable_board_cross_brand_ripcord).
evidence(all_consistent(comparable_board_cross_brand_ripcord)).
query(true_val(comparable_board_cross_brand_ripcord, sight_camber_vs_ripcord_flat)).
query(true_val(comparable_board_cross_brand_ripcord, unk_comparable_board_cross_brand_ripcord)).

% @attr comparable_board_same_brand_effect
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values effect_stiffer_brother=Effect_stiffer_bigger_brother_similar_camber unk_comparable_board_same_brand_effect=Unknown
% @importance 0.90

0.85::true_val(comparable_board_same_brand_effect, effect_stiffer_brother); 0.15::true_val(comparable_board_same_brand_effect, unk_comparable_board_same_brand_effect).
0.88::acc(s41, comparable_board_same_brand_effect).
measured(s41, comparable_board_same_brand_effect, effect_stiffer_brother).
all_consistent(comparable_board_same_brand_effect) :- consistent(s41, comparable_board_same_brand_effect).
evidence(all_consistent(comparable_board_same_brand_effect)).
query(true_val(comparable_board_same_brand_effect, effect_stiffer_brother)).
query(true_val(comparable_board_same_brand_effect, unk_comparable_board_same_brand_effect)).

% @attr sustainability_certification_bio
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values bio_sourced_materials=Accessible_board_bio_sourced_materials unk_sustainability_certification_bio=Unknown
% @importance 0.50

0.78::true_val(sustainability_certification_bio, bio_sourced_materials); 0.22::true_val(sustainability_certification_bio, unk_sustainability_certification_bio).
0.75::acc(s8, sustainability_certification_bio).
measured(s8, sustainability_certification_bio, bio_sourced_materials).
all_consistent(sustainability_certification_bio) :- (indep(s8), consistent(s8, sustainability_certification_bio) ; \+indep(s8)).
evidence(all_consistent(sustainability_certification_bio)).
query(true_val(sustainability_certification_bio, bio_sourced_materials)).
query(true_val(sustainability_certification_bio, unk_sustainability_certification_bio)).

% @attr salomon_brand_reputation
% @type categorical
% @canonical false
% @original_name Salomon brand reputation
% @values major_global_75yr=Major_global_brand_75_plus_year_heritage unk_salomon_brand_reputation=Unknown
% @importance 0.50

0.72::true_val(salomon_brand_reputation, major_global_75yr); 0.28::true_val(salomon_brand_reputation, unk_salomon_brand_reputation).
0.70::acc(s124, salomon_brand_reputation).
measured(s124, salomon_brand_reputation, major_global_75yr).
all_consistent(salomon_brand_reputation) :- consistent(s124, salomon_brand_reputation).
evidence(all_consistent(salomon_brand_reputation)).
query(true_val(salomon_brand_reputation, major_global_75yr)).
query(true_val(salomon_brand_reputation, unk_salomon_brand_reputation)).

% @attr comparable_board_same_brand_lineup
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values entry_to_mid_below_assassin_highpath=Entry_to_mid_range_below_Assassin_Highpath unk_comparable_board_same_brand_lineup=Unknown
% @importance 0.70

0.80::true_val(comparable_board_same_brand_lineup, entry_to_mid_below_assassin_highpath); 0.20::true_val(comparable_board_same_brand_lineup, unk_comparable_board_same_brand_lineup).
0.80::acc(s66, comparable_board_same_brand_lineup).
measured(s66, comparable_board_same_brand_lineup, entry_to_mid_below_assassin_highpath).
all_consistent(comparable_board_same_brand_lineup) :- consistent(s66, comparable_board_same_brand_lineup).
evidence(all_consistent(comparable_board_same_brand_lineup)).
query(true_val(comparable_board_same_brand_lineup, entry_to_mid_below_assassin_highpath)).
query(true_val(comparable_board_same_brand_lineup, unk_comparable_board_same_brand_lineup)).

% @attr amer_sports_financial_health
% @type categorical
% @canonical false
% @original_name Amer Sports financial health
% @values ipo_feb_2024_6_5b=IPO_Feb_2024_NYSE_valued_6_5_billion unk_amer_sports_financial_health=Unknown
% @importance 0.45

0.85::true_val(amer_sports_financial_health, ipo_feb_2024_6_5b); 0.15::true_val(amer_sports_financial_health, unk_amer_sports_financial_health).
0.85::acc(s83, amer_sports_financial_health).
measured(s83, amer_sports_financial_health, ipo_feb_2024_6_5b).
all_consistent(amer_sports_financial_health) :- consistent(s83, amer_sports_financial_health).
evidence(all_consistent(amer_sports_financial_health)).
query(true_val(amer_sports_financial_health, ipo_feb_2024_6_5b)).
query(true_val(amer_sports_financial_health, unk_amer_sports_financial_health)).

% @attr salomon_sneaker_revenue
% @type categorical
% @canonical false
% @original_name Salomon sneaker revenue
% @values over_1b_2024=Over_1_billion_sneaker_sales_2024 unk_salomon_sneaker_revenue=Unknown
% @importance 0.35

0.78::true_val(salomon_sneaker_revenue, over_1b_2024); 0.22::true_val(salomon_sneaker_revenue, unk_salomon_sneaker_revenue).
0.75::acc(s91, salomon_sneaker_revenue).
measured(s91, salomon_sneaker_revenue, over_1b_2024).
all_consistent(salomon_sneaker_revenue) :- consistent(s91, salomon_sneaker_revenue).
evidence(all_consistent(salomon_sneaker_revenue)).
query(true_val(salomon_sneaker_revenue, over_1b_2024)).
query(true_val(salomon_sneaker_revenue, unk_salomon_sneaker_revenue)).