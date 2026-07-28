0.20::indep(s2).
0.25::indep(s9).
0.15::indep(s10).
0.15::indep(s18).
0.15::indep(s20).
0.20::indep(s24).
0.20::indep(s25).
0.20::indep(s26).
0.15::indep(s29).
0.25::indep(s36).
0.15::indep(sm).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 1.0

0.97::acc(s1, brand).
0.90::acc(s2, brand).
0.95::true_val(brand, burton); 0.05::true_val(brand, unk_brand).
measured(s1, brand, burton).
measured(s2, brand, burton).
all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).
evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values custom_x=Custom_X unk_model_name=Unknown
% @importance 1.0

0.97::acc(s1, model_name).
0.90::acc(s2, model_name).
0.95::true_val(model_name, custom_x); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, custom_x).
measured(s2, model_name, custom_x).
all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).
evidence(all_consistent(model_name)).
query(true_val(model_name, custom_x)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 1.0

0.97::acc(s1, model_year).
0.90::acc(s2, model_year).
0.95::true_val(model_year, y2026); 0.05::true_val(model_year, unk_model_year).
measured(s1, model_year, y2026).
measured(s2, model_year, y2026).
all_consistent(model_year) :-
    consistent(s1, model_year),
    (indep(s2), consistent(s2, model_year) ; \+indep(s2)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.97::acc(s1, product_type).
0.90::acc(s2, product_type).
0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).
measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).
all_consistent(product_type) :-
    consistent(s1, product_type),
    (indep(s2), consistent(s2, product_type) ; \+indep(s2)).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.97::acc(s1, gender).
0.90::acc(s2, gender).
0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).
measured(s1, gender, mens).
measured(s2, gender, mens).
all_consistent(gender) :-
    consistent(s1, gender),
    (indep(s2), consistent(s2, gender) ; \+indep(s2)).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values w26_106891=W26-106891 unk_sku=Unknown
% @importance 0.925

0.95::acc(s1, sku).
0.93::acc(sm, sku).
0.95::true_val(sku, w26_106891); 0.05::true_val(sku, unk_sku).
measured(s1, sku, w26_106891).
measured(sm, sku, w26_106891).
all_consistent(sku) :-
    consistent(s1, sku),
    (indep(sm), consistent(sm, sku) ; \+indep(sm)).
evidence(all_consistent(sku)).
query(true_val(sku, w26_106891)).
query(true_val(sku, unk_sku)).

% @attr custom_series_origin
% @type categorical
% @canonical false
% @original_name Custom series origin
% @values launched_1996=Launched_1995_96_season unk_custom_series_origin=Unknown
% @importance 0.45

0.75::acc(s6, custom_series_origin).
0.93::acc(s7, custom_series_origin).
0.95::true_val(custom_series_origin, launched_1996); 0.05::true_val(custom_series_origin, unk_custom_series_origin).
measured(s6, custom_series_origin, launched_1996).
measured(s7, custom_series_origin, launched_1996).
all_consistent(custom_series_origin) :-
    consistent(s6, custom_series_origin),
    consistent(s7, custom_series_origin).
evidence(all_consistent(custom_series_origin)).
query(true_val(custom_series_origin, launched_1996)).
query(true_val(custom_series_origin, unk_custom_series_origin)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2004=2004 unk_model_first_available_year=Unknown
% @importance 0.7

0.95::acc(s8, model_first_available_year).
0.90::true_val(model_first_available_year, y2004); 0.10::true_val(model_first_available_year, unk_model_first_available_year).
measured(s8, model_first_available_year, y2004).
all_consistent(model_first_available_year) :-
    consistent(s8, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2004)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr model_changes_2026
% @type categorical
% @canonical false
% @original_name 2026 model changes
% @values graphics_only=Graphics_only_no_construction_changes unk_model_changes_2026=Unknown
% @importance 0.8

0.80::acc(s9, model_changes_2026).
0.82::true_val(model_changes_2026, graphics_only); 0.18::true_val(model_changes_2026, unk_model_changes_2026).
measured(s9, model_changes_2026, graphics_only).
all_consistent(model_changes_2026) :-
    (indep(s9), consistent(s9, model_changes_2026) ; \+indep(s9)).
evidence(all_consistent(model_changes_2026)).
query(true_val(model_changes_2026, graphics_only)).
query(true_val(model_changes_2026, unk_model_changes_2026)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values skull_lenticular=Skull_inspired_lenticular_effect unk_topsheet_appearance_description=Unknown
% @importance 0.225

0.72::acc(s10, topsheet_appearance_description).
0.72::acc(s11, topsheet_appearance_description).
0.90::true_val(topsheet_appearance_description, skull_lenticular); 0.10::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).
measured(s10, topsheet_appearance_description, skull_lenticular).
measured(s11, topsheet_appearance_description, skull_lenticular).
all_consistent(topsheet_appearance_description) :-
    consistent(s10, topsheet_appearance_description),
    consistent(s11, topsheet_appearance_description).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, skull_lenticular)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards_founded_1977 unk_manufacturer=Unknown
% @importance 0.6

0.85::acc(s12, manufacturer).
0.82::true_val(manufacturer, burton_snowboards); 0.18::true_val(manufacturer, unk_manufacturer).
measured(s12, manufacturer, burton_snowboards).
all_consistent(manufacturer) :-
    consistent(s12, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr headquarters
% @type categorical
% @canonical false
% @original_name Headquarters
% @values burlington_vt=Burlington_Vermont_USA unk_headquarters=Unknown
% @importance 0.5

0.85::acc(s12, headquarters).
0.90::acc(s13, headquarters).
0.95::true_val(headquarters, burlington_vt); 0.05::true_val(headquarters, unk_headquarters).
measured(s12, headquarters, burlington_vt).
measured(s13, headquarters, burlington_vt).
all_consistent(headquarters) :-
    consistent(s12, headquarters),
    consistent(s13, headquarters).
evidence(all_consistent(headquarters)).
query(true_val(headquarters, burlington_vt)).
query(true_val(headquarters, unk_headquarters)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values keil_austria=Keil_factory_Austria unk_manufacturing_location=Unknown
% @importance 0.5

0.85::acc(s14, manufacturing_location).
0.78::acc(s15, manufacturing_location).
0.95::true_val(manufacturing_location, keil_austria); 0.05::true_val(manufacturing_location, unk_manufacturing_location).
measured(s14, manufacturing_location, keil_austria).
measured(s15, manufacturing_location, keil_austria).
all_consistent(manufacturing_location) :-
    consistent(s14, manufacturing_location),
    consistent(s15, manufacturing_location).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, keil_austria)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr b_corp_certified
% @type categorical
% @canonical false
% @original_name Burton Snowboards is a B-Corp certified company
% @values affirmed=Yes_B_Corp_certified unk_b_corp_certified=Unknown
% @importance 0.35

0.90::acc(s16, b_corp_certified).
0.75::true_val(b_corp_certified, affirmed); 0.25::true_val(b_corp_certified, unk_b_corp_certified).
measured(s16, b_corp_certified, affirmed).
all_consistent(b_corp_certified) :-
    consistent(s16, b_corp_certified).
evidence(all_consistent(b_corp_certified)).
query(true_val(b_corp_certified, affirmed)).
query(true_val(b_corp_certified, unk_b_corp_certified)).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v3=3.0 v2=2.0
% @importance 0.75

0.88::acc(s17, warranty_period_years).
0.70::acc(s18, warranty_period_years).
0.65::acc(s25, warranty_period_years).
0.80::true_val(warranty_period_years, v3); 0.20::true_val(warranty_period_years, v2).
measured(s17, warranty_period_years, v3).
measured(s18, warranty_period_years, v3).
measured(s25, warranty_period_years, v2).
all_consistent(warranty_period_years) :-
    consistent(s17, warranty_period_years),
    (indep(s18), consistent(s18, warranty_period_years) ; \+indep(s18)),
    (indep(s25), consistent(s25, warranty_period_years) ; \+indep(s25)).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v3)).
query(true_val(warranty_period_years, v2)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain aggressive_am_freeride=Aggressive_All_Mountain_Freeride
% @importance 0.9

0.90::acc(s1, board_category).
0.90::acc(sm, board_category).
0.82::acc(s9, board_category).
0.80::acc(s19, board_category).
0.40::true_val(board_category, all_mountain); 0.60::true_val(board_category, aggressive_am_freeride).
measured(s1, board_category, all_mountain).
measured(sm, board_category, all_mountain).
measured(s9, board_category, aggressive_am_freeride).
measured(s19, board_category, aggressive_am_freeride).
all_consistent(board_category) :-
    consistent(s1, board_category),
    (indep(sm), consistent(sm, board_category) ; \+indep(sm)),
    (indep(s9), consistent(s9, board_category) ; \+indep(s9)),
    consistent(s19, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, aggressive_am_freeride)).

% @attr position_in_lineup
% @type categorical
% @canonical false
% @original_name Position in lineup
% @values most_aggressive=Most_aggressive_in_Burton_lineup unk_position_in_lineup=Unknown
% @importance 0.9

0.88::acc(s2, position_in_lineup).
0.80::acc(s19, position_in_lineup).
0.95::true_val(position_in_lineup, most_aggressive); 0.05::true_val(position_in_lineup, unk_position_in_lineup).
measured(s2, position_in_lineup, most_aggressive).
measured(s19, position_in_lineup, most_aggressive).
all_consistent(position_in_lineup) :-
    (indep(s2), consistent(s2, position_in_lineup) ; \+indep(s2)),
    consistent(s19, position_in_lineup).
evidence(all_consistent(position_in_lineup)).
query(true_val(position_in_lineup, most_aggressive)).
query(true_val(position_in_lineup, unk_position_in_lineup)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_expert=Advanced_to_Expert unk_rider_level=Unknown
% @importance 0.825

0.80::acc(s9, rider_level).
0.80::acc(s19, rider_level).
0.95::true_val(rider_level, advanced_expert); 0.05::true_val(rider_level, unk_rider_level).
measured(s9, rider_level, advanced_expert).
measured(s19, rider_level, advanced_expert).
all_consistent(rider_level) :-
    (indep(s9), consistent(s9, rider_level) ; \+indep(s9)),
    consistent(s19, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mtn_backcountry_comp=All_mountain_steep_backcountry_competition unk_terrain_suitability=Unknown
% @importance 0.85

0.90::acc(sm, terrain_suitability).
0.90::true_val(terrain_suitability, all_mtn_backcountry_comp); 0.10::true_val(terrain_suitability, unk_terrain_suitability).
measured(sm, terrain_suitability, all_mtn_backcountry_comp).
all_consistent(terrain_suitability) :-
    consistent(sm, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mtn_backcountry_comp)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values aggressive_carving_precision=Aggressive_high_speed_carving_precision unk_riding_style=Unknown
% @importance 0.85

0.90::acc(sm, riding_style).
0.90::true_val(riding_style, aggressive_carving_precision); 0.10::true_val(riding_style, unk_riding_style).
measured(sm, riding_style, aggressive_carving_precision).
all_consistent(riding_style) :-
    consistent(sm, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, aggressive_carving_precision)).
query(true_val(riding_style, unk_riding_style)).

% @attr use_case
% @type categorical
% @canonical false
% @original_name Use case
% @values competition_olympics=Burton_team_riders_world_class_competitions_Olympics unk_use_case=Unknown
% @importance 0.7

0.70::acc(s20, use_case).
0.65::true_val(use_case, competition_olympics); 0.35::true_val(use_case, unk_use_case).
measured(s20, use_case, competition_olympics).
all_consistent(use_case) :-
    (indep(s20), consistent(s20, use_case) ; \+indep(s20)).
evidence(all_consistent(use_case)).
query(true_val(use_case, competition_olympics)).
query(true_val(use_case, unk_use_case)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.925

0.93::acc(s2, shape).
0.93::acc(sm, shape).
0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).
measured(s2, shape, directional_twin).
measured(sm, shape, directional_twin).
all_consistent(shape) :-
    (indep(s2), consistent(s2, shape) ; \+indep(s2)),
    (indep(sm), consistent(sm, shape) ; \+indep(sm)).
evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_detail
% @type categorical
% @canonical false
% @original_name shape (detail)
% @values longer_nose=Classic_directional_slightly_longer_nose_than_tail unk_shape_detail=Unknown
% @importance 0.95

0.88::acc(s2, shape_detail).
0.85::true_val(shape_detail, longer_nose); 0.15::true_val(shape_detail, unk_shape_detail).
measured(s2, shape_detail, longer_nose).
all_consistent(shape_detail) :-
    (indep(s2), consistent(s2, shape_detail) ; \+indep(s2)).
evidence(all_consistent(shape_detail)).
query(true_val(shape_detail, longer_nose)).
query(true_val(shape_detail, unk_shape_detail)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values twin_flex=Twin_Flex_symmetrical_tip_to_tail unk_flex_direction=Unknown
% @importance 0.925

0.90::acc(s2, flex_direction).
0.90::acc(sm, flex_direction).
0.95::true_val(flex_direction, twin_flex); 0.05::true_val(flex_direction, unk_flex_direction).
measured(s2, flex_direction, twin_flex).
measured(sm, flex_direction, twin_flex).
all_consistent(flex_direction) :-
    (indep(s2), consistent(s2, flex_direction) ; \+indep(s2)),
    (indep(sm), consistent(sm, flex_direction) ; \+indep(sm)).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values traditional_camber=Traditional_Camber_full_camber unk_camber_type=Unknown
% @importance 0.925

0.93::acc(s2, camber_type).
0.93::acc(sm, camber_type).
0.95::true_val(camber_type, traditional_camber); 0.05::true_val(camber_type, unk_camber_type).
measured(s2, camber_type, traditional_camber).
measured(sm, camber_type, traditional_camber).
all_consistent(camber_type) :-
    (indep(s2), consistent(s2, camber_type) ; \+indep(s2)),
    (indep(sm), consistent(sm, camber_type) ; \+indep(sm)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, traditional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v12=12.0 unk_camber_height_mm=Unknown
% @importance 0.65

0.92::acc(s21, camber_height_mm).
0.82::true_val(camber_height_mm, v12); 0.18::true_val(camber_height_mm, unk_camber_height_mm).
measured(s21, camber_height_mm, v12).
all_consistent(camber_height_mm) :-
    consistent(s21, camber_height_mm).
evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v12)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr setback
% @type numeric
% @unit mm
% @canonical false
% @original_name setback
% @values vm12_5=-12.5 unk_setback=Unknown
% @importance 0.85

0.93::acc(sm, setback).
0.90::true_val(setback, vm12_5); 0.10::true_val(setback, unk_setback).
measured(sm, setback, vm12_5).
all_consistent(setback) :-
    consistent(sm, setback).
evidence(all_consistent(setback)).
query(true_val(setback, vm12_5)).
query(true_val(setback, unk_setback)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v8=8.0 v6_9_range=6-9_range
% @importance 0.9

0.85::acc(sm, flex_rating_10).
0.88::acc(s22, flex_rating_10).
0.78::acc(s2, flex_rating_10).
0.78::acc(s23, flex_rating_10).
0.55::true_val(flex_rating_10, v8); 0.45::true_val(flex_rating_10, v6_9_range).
measured(sm, flex_rating_10, v8).
measured(s22, flex_rating_10, v8).
measured(s2, flex_rating_10, v6_9_range).
measured(s23, flex_rating_10, v6_9_range).
all_consistent(flex_rating_10) :-
    (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)),
    consistent(s22, flex_rating_10),
    (indep(s2), consistent(s2, flex_rating_10) ; \+indep(s2)),
    (indep(s23), consistent(s23, flex_rating_10) ; \+indep(s23)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v8)).
query(true_val(flex_rating_10, v6_9_range)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff=Stiff unk_flex_feel=Unknown
% @importance 0.9

0.88::acc(sm, flex_feel).
0.85::acc(s22, flex_feel).
0.95::true_val(flex_feel, stiff); 0.05::true_val(flex_feel, unk_flex_feel).
measured(sm, flex_feel, stiff).
measured(s22, flex_feel, stiff).
all_consistent(flex_feel) :-
    (indep(sm), consistent(sm, flex_feel) ; \+indep(sm)),
    consistent(s22, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr playful_aggressive_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name Playful/aggressive rating (reviewer)
% @values v8_aggressive=8.0 unk_playful_aggressive_rating=Unknown
% @importance 0.95

0.88::acc(s22, playful_aggressive_rating).
0.82::true_val(playful_aggressive_rating, v8_aggressive); 0.18::true_val(playful_aggressive_rating, unk_playful_aggressive_rating).
measured(s22, playful_aggressive_rating, v8_aggressive).
all_consistent(playful_aggressive_rating) :-
    consistent(s22, playful_aggressive_rating).
evidence(all_consistent(playful_aggressive_rating)).
query(true_val(playful_aggressive_rating, v8_aggressive)).
query(true_val(playful_aggressive_rating, unk_playful_aggressive_rating)).

% @attr terrain_park_10
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (Park)
% @values v6=6.0 v8=8.0
% @importance 0.825

0.82::acc(sm, terrain_park_10).
0.75::acc(s24, terrain_park_10).
0.55::true_val(terrain_park_10, v6); 0.45::true_val(terrain_park_10, v8).
measured(sm, terrain_park_10, v6).
measured(s24, terrain_park_10, v8).
all_consistent(terrain_park_10) :-
    consistent(sm, terrain_park_10),
    (indep(s24), consistent(s24, terrain_park_10) ; \+indep(s24)).
evidence(all_consistent(terrain_park_10)).
query(true_val(terrain_park_10, v6)).
query(true_val(terrain_park_10, v8)).

% @attr terrain_all_mountain_10
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (All-Mountain)
% @values v9=9.0 v8=8.0
% @importance 0.825

0.82::acc(sm, terrain_all_mountain_10).
0.75::acc(s24, terrain_all_mountain_10).
0.55::true_val(terrain_all_mountain_10, v9); 0.45::true_val(terrain_all_mountain_10, v8).
measured(sm, terrain_all_mountain_10, v9).
measured(s24, terrain_all_mountain_10, v8).
all_consistent(terrain_all_mountain_10) :-
    consistent(sm, terrain_all_mountain_10),
    (indep(s24), consistent(s24, terrain_all_mountain_10) ; \+indep(s24)).
evidence(all_consistent(terrain_all_mountain_10)).
query(true_val(terrain_all_mountain_10, v9)).
query(true_val(terrain_all_mountain_10, v8)).

% @attr terrain_powder_10
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (Powder)
% @values v7=7.0 v6=6.0
% @importance 0.825

0.82::acc(sm, terrain_powder_10).
0.75::acc(s24, terrain_powder_10).
0.55::true_val(terrain_powder_10, v7); 0.45::true_val(terrain_powder_10, v6).
measured(sm, terrain_powder_10, v7).
measured(s24, terrain_powder_10, v6).
all_consistent(terrain_powder_10) :-
    consistent(sm, terrain_powder_10),
    (indep(s24), consistent(s24, terrain_powder_10) ; \+indep(s24)).
evidence(all_consistent(terrain_powder_10)).
query(true_val(terrain_powder_10, v7)).
query(true_val(terrain_powder_10, v6)).

% @attr terrain_ratings_snowleader
% @type categorical
% @canonical false
% @original_name terrain_suitability (Snowleader 5-point scale)
% @values rig4_free3_off3_on5_all5=Rigidity_4_5_Freestyle_3_5_Offpiste_3_5_Onpiste_5_5_Allsnow_5_5 unk_terrain_ratings_snowleader=Unknown
% @importance 0.7

0.72::acc(s25, terrain_ratings_snowleader).
0.68::true_val(terrain_ratings_snowleader, rig4_free3_off3_on5_all5); 0.32::true_val(terrain_ratings_snowleader, unk_terrain_ratings_snowleader).
measured(s25, terrain_ratings_snowleader, rig4_free3_off3_on5_all5).
all_consistent(terrain_ratings_snowleader) :-
    (indep(s25), consistent(s25, terrain_ratings_snowleader) ; \+indep(s25)).
evidence(all_consistent(terrain_ratings_snowleader)).
query(true_val(terrain_ratings_snowleader, rig4_free3_off3_on5_all5)).
query(true_val(terrain_ratings_snowleader, unk_terrain_ratings_snowleader)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values dragonfly_600g=Dragonfly_600G_Core_Multizone_EGD_Squeezebox unk_core_material=Unknown
% @importance 0.925

0.90::acc(s2, core_material).
0.90::acc(sm, core_material).
0.95::true_val(core_material, dragonfly_600g); 0.05::true_val(core_material, unk_core_material).
measured(s2, core_material, dragonfly_600g).
measured(sm, core_material, dragonfly_600g).
all_consistent(core_material) :-
    (indep(s2), consistent(s2, core_material) ; \+indep(s2)),
    (indep(sm), consistent(sm, core_material) ; \+indep(sm)).
evidence(all_consistent(core_material)).
query(true_val(core_material, dragonfly_600g)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_description
% @type categorical
% @canonical false
% @original_name core_material (description)
% @values strongest_lightest=Strongest_lightest_core_stronger_lighter_woods unk_core_material_description=Unknown
% @importance 0.95

0.88::acc(s2, core_material_description).
0.85::true_val(core_material_description, strongest_lightest); 0.15::true_val(core_material_description, unk_core_material_description).
measured(s2, core_material_description, strongest_lightest).
all_consistent(core_material_description) :-
    (indep(s2), consistent(s2, core_material_description) ; \+indep(s2)).
evidence(all_consistent(core_material_description)).
query(true_val(core_material_description, strongest_lightest)).
query(true_val(core_material_description, unk_core_material_description)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values egd_endgrain=End_grain_woods_in_impact_zones_lighter_elsewhere unk_construction_material_innovation=Unknown
% @importance 0.925

0.90::acc(s2, construction_material_innovation).
0.90::acc(sm, construction_material_innovation).
0.95::true_val(construction_material_innovation, egd_endgrain); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).
measured(s2, construction_material_innovation, egd_endgrain).
measured(sm, construction_material_innovation, egd_endgrain).
all_consistent(construction_material_innovation) :-
    (indep(s2), consistent(s2, construction_material_innovation) ; \+indep(s2)),
    (indep(sm), consistent(sm, construction_material_innovation) ; \+indep(sm)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, egd_endgrain)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_squeezebox
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Squeezebox)
% @values squeezebox=Thicker_thinner_core_sections_energy_transfer_snap_stability unk_construction_material_innovation_squeezebox=Unknown
% @importance 0.925

0.90::acc(s2, construction_material_innovation_squeezebox).
0.90::acc(sm, construction_material_innovation_squeezebox).
0.95::true_val(construction_material_innovation_squeezebox, squeezebox); 0.05::true_val(construction_material_innovation_squeezebox, unk_construction_material_innovation_squeezebox).
measured(s2, construction_material_innovation_squeezebox, squeezebox).
measured(sm, construction_material_innovation_squeezebox, squeezebox).
all_consistent(construction_material_innovation_squeezebox) :-
    (indep(s2), consistent(s2, construction_material_innovation_squeezebox) ; \+indep(s2)),
    (indep(sm), consistent(sm, construction_material_innovation_squeezebox) ; \+indep(sm)).
evidence(all_consistent(construction_material_innovation_squeezebox)).
query(true_val(construction_material_innovation_squeezebox, squeezebox)).
query(true_val(construction_material_innovation_squeezebox, unk_construction_material_innovation_squeezebox)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_carbon_ibeam=Triax_fiberglass_with_Carbon_I_Beam unk_laminate=Unknown
% @importance 0.85

0.88::acc(sm, laminate).
0.90::true_val(laminate, triax_carbon_ibeam); 0.10::true_val(laminate, unk_laminate).
measured(sm, laminate, triax_carbon_ibeam).
all_consistent(laminate) :-
    consistent(sm, laminate).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_carbon_ibeam)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation_carbon_hv
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Carbon Highlights HV)
% @values carbon_hv_45=45_degree_Carbon_Highlights_High_Voltage_stiffer_poppier unk_construction_material_innovation_carbon_hv=Unknown
% @importance 0.875

0.88::acc(s2, construction_material_innovation_carbon_hv).
0.80::acc(s23, construction_material_innovation_carbon_hv).
0.95::true_val(construction_material_innovation_carbon_hv, carbon_hv_45); 0.05::true_val(construction_material_innovation_carbon_hv, unk_construction_material_innovation_carbon_hv).
measured(s2, construction_material_innovation_carbon_hv, carbon_hv_45).
measured(s23, construction_material_innovation_carbon_hv, carbon_hv_45).
all_consistent(construction_material_innovation_carbon_hv) :-
    (indep(s2), consistent(s2, construction_material_innovation_carbon_hv) ; \+indep(s2)),
    (indep(s23), consistent(s23, construction_material_innovation_carbon_hv) ; \+indep(s23)).
evidence(all_consistent(construction_material_innovation_carbon_hv)).
query(true_val(construction_material_innovation_carbon_hv, carbon_hv_45)).
query(true_val(construction_material_innovation_carbon_hv, unk_construction_material_innovation_carbon_hv)).

% @attr laminate_detail
% @type categorical
% @canonical false
% @original_name laminate (detail)
% @values triax_above_below=Triax_fiberglass_layered_above_and_below_core unk_laminate_detail=Unknown
% @importance 0.7

0.70::acc(s20, laminate_detail).
0.65::true_val(laminate_detail, triax_above_below); 0.35::true_val(laminate_detail, unk_laminate_detail).
measured(s20, laminate_detail, triax_above_below).
all_consistent(laminate_detail) :-
    (indep(s20), consistent(s20, laminate_detail) ; \+indep(s20)).
evidence(all_consistent(laminate_detail)).
query(true_val(laminate_detail, triax_above_below)).
query(true_val(laminate_detail, unk_laminate_detail)).

% @attr construction_material_innovation_ibeam
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Carbon I-Beam)
% @values carbon_ibeam=Ultralight_carbon_backbone_on_bottom_Triax_increased_pop unk_construction_material_innovation_ibeam=Unknown
% @importance 0.7

0.70::acc(s20, construction_material_innovation_ibeam).
0.65::true_val(construction_material_innovation_ibeam, carbon_ibeam); 0.35::true_val(construction_material_innovation_ibeam, unk_construction_material_innovation_ibeam).
measured(s20, construction_material_innovation_ibeam, carbon_ibeam).
all_consistent(construction_material_innovation_ibeam) :-
    (indep(s20), consistent(s20, construction_material_innovation_ibeam) ; \+indep(s20)).
evidence(all_consistent(construction_material_innovation_ibeam)).
query(true_val(construction_material_innovation_ibeam, carbon_ibeam)).
query(true_val(construction_material_innovation_ibeam, unk_construction_material_innovation_ibeam)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO unk_base_material=Unknown
% @importance 0.925

0.90::acc(s2, base_material).
0.90::acc(sm, base_material).
0.95::true_val(base_material, sintered_wfo); 0.05::true_val(base_material, unk_base_material).
measured(s2, base_material, sintered_wfo).
measured(sm, base_material, sintered_wfo).
all_consistent(base_material) :-
    (indep(s2), consistent(s2, base_material) ; \+indep(s2)),
    (indep(sm), consistent(sm, base_material) ; \+indep(sm)).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr base_material_description
% @type categorical
% @canonical false
% @original_name base_material (description)
% @values high_density_wax=Extra_absorbent_high_density_sintered_wax_infused_ultra_durable unk_base_material_description=Unknown
% @importance 0.95

0.88::acc(s2, base_material_description).
0.85::true_val(base_material_description, high_density_wax); 0.15::true_val(base_material_description, unk_base_material_description).
measured(s2, base_material_description, high_density_wax).
all_consistent(base_material_description) :-
    (indep(s2), consistent(s2, base_material_description) ; \+indep(s2)).
evidence(all_consistent(base_material_description)).
query(true_val(base_material_description, high_density_wax)).
query(true_val(base_material_description, unk_base_material_description)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values sintered=Sintered_harder_more_durable_faster unk_base_type=Unknown
% @importance 0.7

0.72::acc(s26, base_type).
0.68::true_val(base_type, sintered); 0.32::true_val(base_type, unk_base_type).
measured(s26, base_type, sintered).
all_consistent(base_type) :-
    (indep(s26), consistent(s26, base_type) ; \+indep(s26)).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based_50pct_less_carbon unk_resin=Unknown
% @importance 0.925

0.90::acc(s2, resin).
0.90::acc(sm, resin).
0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).
measured(s2, resin, super_sap_epoxy).
measured(sm, resin, super_sap_epoxy).
all_consistent(resin) :-
    (indep(s2), consistent(s2, resin) ; \+indep(s2)),
    (indep(sm), consistent(sm, resin) ; \+indep(sm)).
evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values frostbite=Frostbite_Edges_extended_under_bindings_hardpack_ice unk_edge_technology=Unknown
% @importance 0.825

0.88::acc(sm, edge_technology).
0.80::acc(s23, edge_technology).
0.95::true_val(edge_technology, frostbite); 0.05::true_val(edge_technology, unk_edge_technology).
measured(sm, edge_technology, frostbite).
measured(s23, edge_technology, frostbite).
all_consistent(edge_technology) :-
    (indep(sm), consistent(sm, edge_technology) ; \+indep(sm)),
    (indep(s23), consistent(s23, edge_technology) ; \+indep(s23)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr construction_material_innovation_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Infinite Ride)
% @values infinite_ride=Overbuilt_broken_down_consistent_flex_pop_day1_to_100 unk_construction_material_innovation_infinite_ride=Unknown
% @importance 0.925

0.90::acc(s2, construction_material_innovation_infinite_ride).
0.90::acc(sm, construction_material_innovation_infinite_ride).
0.95::true_val(construction_material_innovation_infinite_ride, infinite_ride); 0.05::true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride).
measured(s2, construction_material_innovation_infinite_ride, infinite_ride).
measured(sm, construction_material_innovation_infinite_ride, infinite_ride).
all_consistent(construction_material_innovation_infinite_ride) :-
    (indep(s2), consistent(s2, construction_material_innovation_infinite_ride) ; \+indep(s2)),
    (indep(sm), consistent(sm, construction_material_innovation_infinite_ride) ; \+indep(sm)).
evidence(all_consistent(construction_material_innovation_infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride)).

% @attr construction_material_innovation_protip
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Pro-Tip)
% @values protip=Pro_Tip_tapered_tips_reduce_swing_weight_promote_mobility unk_construction_material_innovation_protip=Unknown
% @importance 0.925

0.90::acc(s2, construction_material_innovation_protip).
0.90::acc(sm, construction_material_innovation_protip).
0.95::true_val(construction_material_innovation_protip, protip); 0.05::true_val(construction_material_innovation_protip, unk_construction_material_innovation_protip).
measured(s2, construction_material_innovation_protip, protip).
measured(sm, construction_material_innovation_protip, protip).
all_consistent(construction_material_innovation_protip) :-
    (indep(s2), consistent(s2, construction_material_innovation_protip) ; \+indep(s2)),
    (indep(sm), consistent(sm, construction_material_innovation_protip) ; \+indep(sm)).
evidence(all_consistent(construction_material_innovation_protip)).
query(true_val(construction_material_innovation_protip, protip)).
query(true_val(construction_material_innovation_protip, unk_construction_material_innovation_protip)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_all_major_bindings_best_Burton_EST unk_mounting_pattern=Unknown
% @importance 0.925

0.90::acc(s2, mounting_pattern).
0.90::acc(sm, mounting_pattern).
0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
measured(s2, mounting_pattern, the_channel).
measured(sm, mounting_pattern, the_channel).
all_consistent(mounting_pattern) :-
    (indep(s2), consistent(s2, mounting_pattern) ; \+indep(s2)),
    (indep(sm), consistent(sm, mounting_pattern) ; \+indep(sm)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr channel_inserts
% @type categorical
% @canonical false
% @original_name Channel inserts required and included
% @values required_included=Channel_inserts_required_and_included unk_channel_inserts=Unknown
% @importance 0.95

0.88::acc(s2, channel_inserts).
0.85::true_val(channel_inserts, required_included); 0.15::true_val(channel_inserts, unk_channel_inserts).
measured(s2, channel_inserts, required_included).
all_consistent(channel_inserts) :-
    (indep(s2), consistent(s2, channel_inserts) ; \+indep(s2)).
evidence(all_consistent(channel_inserts)).
query(true_val(channel_inserts, required_included)).
query(true_val(channel_inserts, unk_channel_inserts)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values std_150_154_156_158_162=150_154_156_158_162cm unk_available_sizes=Unknown
% @importance 0.85

0.93::acc(sm, available_sizes).
0.90::true_val(available_sizes, std_150_154_156_158_162); 0.10::true_val(available_sizes, unk_available_sizes).
measured(sm, available_sizes, std_150_154_156_158_162).
all_consistent(available_sizes) :-
    consistent(sm, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, std_150_154_156_158_162)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_wide
% @type categorical
% @canonical false
% @original_name available_sizes (Wide)
% @values wide_158_162_166=158W_162W_166W unk_available_sizes_wide=Unknown
% @importance 0.85

0.93::acc(sm, available_sizes_wide).
0.90::true_val(available_sizes_wide, wide_158_162_166); 0.10::true_val(available_sizes_wide, unk_available_sizes_wide).
measured(sm, available_sizes_wide, wide_158_162_166).
all_consistent(available_sizes_wide) :-
    consistent(sm, available_sizes_wide).
evidence(all_consistent(available_sizes_wide)).
query(true_val(available_sizes_wide, wide_158_162_166)).
query(true_val(available_sizes_wide, unk_available_sizes_wide)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.93::acc(sm, width_options).
0.90::true_val(width_options, standard_and_wide); 0.10::true_val(width_options, unk_width_options).
measured(sm, width_options, standard_and_wide).
all_consistent(width_options) :-
    consistent(sm, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr effective_edge_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 150cm
% @values v113_5=113.5 unk_effective_edge_150=Unknown
% @importance 0.85

0.95::acc(sm, effective_edge_150).
0.93::true_val(effective_edge_150, v113_5); 0.07::true_val(effective_edge_150, unk_effective_edge_150).
measured(sm, effective_edge_150, v113_5).
all_consistent(effective_edge_150) :-
    consistent(sm, effective_edge_150).
evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v113_5)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

% @attr sidecut_radius_size_150
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (150cm)
% @values v7_4=7.4 unk_sidecut_radius_size_150=Unknown
% @importance 0.85

0.95::acc(sm, sidecut_radius_size_150).
0.93::true_val(sidecut_radius_size_150, v7_4); 0.07::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).
measured(sm, sidecut_radius_size_150, v7_4).
all_consistent(sidecut_radius_size_150) :-
    consistent(sm, sidecut_radius_size_150).
evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v7_4)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

% @attr tip_tail_width_size_150
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (150cm)
% @values v28_81=28.81 unk_tip_tail_width_size_150=Unknown
% @importance 0.85

0.95::acc(sm, tip_tail_width_size_150).
0.93::true_val(tip_tail_width_size_150, v28_81); 0.07::true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150).
measured(sm, tip_tail_width_size_150, v28_81).
all_consistent(tip_tail_width_size_150) :-
    consistent(sm, tip_tail_width_size_150).
evidence(all_consistent(tip_tail_width_size_150)).
query(true_val(tip_tail_width_size_150, v28_81)).
query(true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150)).

% @attr waist_width_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 150cm
% @values v24_8=24.8 unk_waist_width_150=Unknown
% @importance 0.85

0.95::acc(sm, waist_width_150).
0.93::true_val(waist_width_150, v24_8); 0.07::true_val(waist_width_150, unk_waist_width_150).
measured(sm, waist_width_150, v24_8).
all_consistent(waist_width_150) :-
    consistent(sm, waist_width_150).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v24_8)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr stance_width_range_size_150
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (150cm)
% @values v50_5=50.5 unk_stance_width_range_size_150=Unknown
% @importance 0.85

0.95::acc(sm, stance_width_range_size_150).
0.93::true_val(stance_width_range_size_150, v50_5); 0.07::true_val(stance_width_range_size_150, unk_stance_width_range_size_150).
measured(sm, stance_width_range_size_150, v50_5).
all_consistent(stance_width_range_size_150) :-
    consistent(sm, stance_width_range_size_150).
evidence(all_consistent(stance_width_range_size_150)).
query(true_val(stance_width_range_size_150, v50_5)).
query(true_val(stance_width_range_size_150, unk_stance_width_range_size_150)).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (150cm)
% @values r54_82kg=54-82kg_120-180lbs unk_recommended_weight_range_size_150=Unknown
% @importance 0.85

0.95::acc(sm, recommended_weight_range_size_150).
0.93::true_val(recommended_weight_range_size_150, r54_82kg); 0.07::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).
measured(sm, recommended_weight_range_size_150, r54_82kg).
all_consistent(recommended_weight_range_size_150) :-
    consistent(sm, recommended_weight_range_size_150).
evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, r54_82kg)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

% @attr effective_edge_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 154cm
% @values v117_5=117.5 unk_effective_edge_154=Unknown
% @importance 0.85

0.95::acc(sm, effective_edge_154).
0.93::true_val(effective_edge_154, v117_5); 0.07::true_val(effective_edge_154, unk_effective_edge_154).
measured(sm, effective_edge_154, v117_5).
all_consistent(effective_edge_154) :-
    consistent(sm, effective_edge_154).
evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v117_5)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr sidecut_radius_size_154
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (154cm)
% @values v7_6=7.6 unk_sidecut_radius_size_154=Unknown
% @importance 0.85

0.95::acc(sm, sidecut_radius_size_154).
0.93::true_val(sidecut_radius_size_154, v7_6); 0.07::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).
measured(sm, sidecut_radius_size_154, v7_6).
all_consistent(sidecut_radius_size_154) :-
    consistent(sm, sidecut_radius_size_154).
evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_6)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

% @attr tip_tail_width_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (154cm)
% @values v29_15=29.15 unk_tip_tail_width_size_154=Unknown
% @importance 0.85

0.95::acc(sm, tip_tail_width_size_154).
0.93::true_val(tip_tail_width_size_154, v29_15); 0.07::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).
measured(sm, tip_tail_width_size_154, v29_15).
all_consistent(tip_tail_width_size_154) :-
    consistent(sm, tip_tail_width_size_154).
evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v29_15)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

% @attr waist_width_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 154cm
% @values v25_0=25.0 unk_waist_width_154=Unknown
% @importance 0.85

0.95::acc(sm, waist_width_154).
0.93::true_val(waist_width_154, v25_0); 0.07::true_val(waist_width_154, unk_waist_width_154).
measured(sm, waist_width_154, v25_0).
all_consistent(waist_width_154) :-
    consistent(sm, waist_width_154).
evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_0)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr stance_width_range_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (154cm)
% @values v53_0=53.0 unk_stance_width_range_size_154=Unknown
% @importance 0.85

0.95::acc(sm, stance_width_range_size_154).
0.93::true_val(stance_width_range_size_154, v53_0); 0.07::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).
measured(sm, stance_width_range_size_154, v53_0).
all_consistent(stance_width_range_size_154) :-
    consistent(sm, stance_width_range_size_154).
evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v53_0)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (154cm)
% @values r54_82kg=54-82kg unk_recommended_weight_range_size_154=Unknown
% @importance 0.85

0.95::acc(sm, recommended_weight_range_size_154).
0.93::true_val(recommended_weight_range_size_154, r54_82kg); 0.07::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).
measured(sm, recommended_weight_range_size_154, r54_82kg).
all_consistent(recommended_weight_range_size_154) :-
    consistent(sm, recommended_weight_range_size_154).
evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, r54_82kg)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr effective_edge_158
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 158cm
% @values v121_5=121.5 unk_effective_edge_158=Unknown
% @importance 0.85

0.95::acc(sm, effective_edge_158).
0.93::true_val(effective_edge_158, v121_5); 0.07::true_val(effective_edge_158, unk_effective_edge_158).
measured(sm, effective_edge_158, v121_5).
all_consistent(effective_edge_158) :-
    consistent(sm, effective_edge_158).
evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v121_5)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_9=7.9 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.95::acc(sm, sidecut_radius_size).
0.93::true_val(sidecut_radius_size, v7_9); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(sm, sidecut_radius_size, v7_9).
all_consistent(sidecut_radius_size) :-
    consistent(sm, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_9)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v29_7=29.7 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.95::acc(sm, tip_tail_width_size).
0.93::true_val(tip_tail_width_size, v29_7); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(sm, tip_tail_width_size, v29_7).
all_consistent(tip_tail_width_size) :-
    consistent(sm, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_7)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_158
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 158cm
% @values v25_4=25.4 unk_waist_width_158=Unknown
% @importance 0.85

0.95::acc(sm, waist_width_158).
0.93::true_val(waist_width_158, v25_4); 0.07::true_val(waist_width_158, unk_waist_width_158).
measured(sm, waist_width_158, v25_4).
all_consistent(waist_width_158) :-
    consistent(sm, waist_width_158).
evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v25_4)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.95::acc(sm, stance_width_range_size).
0.93::true_val(stance_width_range_size, v56_0); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(sm, stance_width_range_size, v56_0).
all_consistent(stance_width_range_size) :-
    consistent(sm, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values r68_91kg=68-91kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.95::acc(sm, recommended_weight_range_size).
0.93::true_val(recommended_weight_range_size, r68_91kg); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(sm, recommended_weight_range_size, r68_91kg).
all_consistent(recommended_weight_range_size) :-
    consistent(sm, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r68_91kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 162cm
% @values v125_5=125.5 unk_effective_edge_162=Unknown
% @importance 0.85

0.95::acc(sm, effective_edge_162).
0.93::true_val(effective_edge_162, v125_5); 0.07::true_val(effective_edge_162, unk_effective_edge_162).
measured(sm, effective_edge_162, v125_5).
all_consistent(effective_edge_162) :-
    consistent(sm, effective_edge_162).
evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v125_5)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @values v8_2=8.2 unk_sidecut_radius_size_162=Unknown
% @importance 0.85

0.95::acc(sm, sidecut_radius_size_162).
0.93::true_val(sidecut_radius_size_162, v8_2); 0.07::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).
measured(sm, sidecut_radius_size_162, v8_2).
all_consistent(sidecut_radius_size_162) :-
    consistent(sm, sidecut_radius_size_162).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_2)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr tip_tail_width_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (162cm)
% @values v30_05=30.05 unk_tip_tail_width_size_162=Unknown
% @importance 0.85

0.95::acc(sm, tip_tail_width_size_162).
0.93::true_val(tip_tail_width_size_162, v30_05); 0.07::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).
measured(sm, tip_tail_width_size_162, v30_05).
all_consistent(tip_tail_width_size_162) :-
    consistent(sm, tip_tail_width_size_162).
evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v30_05)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

% @attr waist_width_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162cm
% @values v25_6=25.6 unk_waist_width_162=Unknown
% @importance 0.85

0.95::acc(sm, waist_width_162).
0.93::true_val(waist_width_162, v25_6); 0.07::true_val(waist_width_162, unk_waist_width_162).
measured(sm, waist_width_162, v25_6).
all_consistent(waist_width_162) :-
    consistent(sm, waist_width_162).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v25_6)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr stance_width_range_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (162cm)
% @values v56_0=56.0 unk_stance_width_range_size_162=Unknown
% @importance 0.85

0.95::acc(sm, stance_width_range_size_162).
0.93::true_val(stance_width_range_size_162, v56_0); 0.07::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).
measured(sm, stance_width_range_size_162, v56_0).
all_consistent(stance_width_range_size_162) :-
    consistent(sm, stance_width_range_size_162).
evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v56_0)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @values r82_118plus=82-118+kg unk_recommended_weight_range_size_162=Unknown
% @importance 0.85

0.95::acc(sm, recommended_weight_range_size_162).
0.93::true_val(recommended_weight_range_size_162, r82_118plus); 0.07::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).
measured(sm, recommended_weight_range_size_162, r82_118plus).
all_consistent(recommended_weight_range_size_162) :-
    consistent(sm, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, r82_118plus)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr effective_edge_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 158cm Wide
% @values v121_5=121.5 unk_effective_edge_158w=Unknown
% @importance 0.85

0.95::acc(sm, effective_edge_158w).
0.93::true_val(effective_edge_158w, v121_5); 0.07::true_val(effective_edge_158w, unk_effective_edge_158w).
measured(sm, effective_edge_158w, v121_5).
all_consistent(effective_edge_158w) :-
    consistent(sm, effective_edge_158w).
evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v121_5)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr sidecut_radius_size_158w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (158cm Wide)
% @values v7_9=7.9 unk_sidecut_radius_size_158w=Unknown
% @importance 0.85

0.95::acc(sm, sidecut_radius_size_158w).
0.93::true_val(sidecut_radius_size_158w, v7_9); 0.07::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).
measured(sm, sidecut_radius_size_158w, v7_9).
all_consistent(sidecut_radius_size_158w) :-
    consistent(sm, sidecut_radius_size_158w).
evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, v7_9)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

% @attr tip_tail_width_size_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (158cm Wide)
% @values v30_5=30.5 unk_tip_tail_width_size_158w=Unknown
% @importance 0.85

0.95::acc(sm, tip_tail_width_size_158w).
0.93::true_val(tip_tail_width_size_158w, v30_5); 0.07::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).
measured(sm, tip_tail_width_size_158w, v30_5).
all_consistent(tip_tail_width_size_158w) :-
    consistent(sm, tip_tail_width_size_158w).
evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v30_5)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

% @attr waist_width_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 158cm Wide
% @values v26_2=26.2 unk_waist_width_158w=Unknown
% @importance 0.85

0.95::acc(sm, waist_width_158w).
0.93::true_val(waist_width_158w, v26_2); 0.07::true_val(waist_width_158w, unk_waist_width_158w).
measured(sm, waist_width_158w, v26_2).
all_consistent(waist_width_158w) :-
    consistent(sm, waist_width_158w).
evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_2)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (158cm Wide)
% @values r68_91kg=68-91kg unk_recommended_weight_range_size_158w=Unknown
% @importance 0.85

0.95::acc(sm, recommended_weight_range_size_158w).
0.93::true_val(recommended_weight_range_size_158w, r68_91kg); 0.07::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).
measured(sm, recommended_weight_range_size_158w, r68_91kg).
all_consistent(recommended_weight_range_size_158w) :-
    consistent(sm, recommended_weight_range_size_158w).
evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, r68_91kg)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

% @attr effective_edge_166w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 166cm Wide
% @values v129_5=129.5 unk_effective_edge_166w=Unknown
% @importance 0.85

0.95::acc(sm, effective_edge_166w).
0.93::true_val(effective_edge_166w, v129_5); 0.07::true_val(effective_edge_166w, unk_effective_edge_166w).
measured(sm, effective_edge_166w, v129_5).
all_consistent(effective_edge_166w) :-
    consistent(sm, effective_edge_166w).
evidence(all_consistent(effective_edge_166w)).
query(true_val(effective_edge_166w, v129_5)).
query(true_val(effective_edge_166w, unk_effective_edge_166w)).

% @attr sidecut_radius_size_166w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (166cm Wide)
% @values v8_4=8.4 unk_sidecut_radius_size_166w=Unknown
% @importance 0.85

0.95::acc(sm, sidecut_radius_size_166w).
0.93::true_val(sidecut_radius_size_166w, v8_4); 0.07::true_val(sidecut_radius_size_166w, unk_sidecut_radius_size_166w).
measured(sm, sidecut_radius_size_166w, v8_4).
all_consistent(sidecut_radius_size_166w) :-
    consistent(sm, sidecut_radius_size_166w).
evidence(all_consistent(sidecut_radius_size_166w)).
query(true_val(sidecut_radius_size_166w, v8_4)).
query(true_val(sidecut_radius_size_166w, unk_sidecut_radius_size_166w)).

% @attr tip_tail_width_size_166w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (166cm Wide)
% @values v31_2=31.2 unk_tip_tail_width_size_166w=Unknown
% @importance 0.85

0.95::acc(sm, tip_tail_width_size_166w).
0.93::true_val(tip_tail_width_size_166w, v31_2); 0.07::true_val(tip_tail_width_size_166w, unk_tip_tail_width_size_166w).
measured(sm, tip_tail_width_size_166w, v31_2).
all_consistent(tip_tail_width_size_166w) :-
    consistent(sm, tip_tail_width_size_166w).
evidence(all_consistent(tip_tail_width_size_166w)).
query(true_val(tip_tail_width_size_166w, v31_2)).
query(true_val(tip_tail_width_size_166w, unk_tip_tail_width_size_166w)).

% @attr waist_width_166w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 166cm Wide
% @values v26_6=26.6 unk_waist_width_166w=Unknown
% @importance 0.85

0.95::acc(sm, waist_width_166w).
0.93::true_val(waist_width_166w, v26_6); 0.07::true_val(waist_width_166w, unk_waist_width_166w).
measured(sm, waist_width_166w, v26_6).
all_consistent(waist_width_166w) :-
    consistent(sm, waist_width_166w).
evidence(all_consistent(waist_width_166w)).
query(true_val(waist_width_166w, v26_6)).
query(true_val(waist_width_166w, unk_waist_width_166w)).

% @attr recommended_weight_range_size_166w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (166cm Wide)
% @values r82_118plus=82-118+kg unk_recommended_weight_range_size_166w=Unknown
% @importance 0.85

0.95::acc(sm, recommended_weight_range_size_166w).
0.93::true_val(recommended_weight_range_size_166w, r82_118plus); 0.07::true_val(recommended_weight_range_size_166w, unk_recommended_weight_range_size_166w).
measured(sm, recommended_weight_range_size_166w, r82_118plus).
all_consistent(recommended_weight_range_size_166w) :-
    consistent(sm, recommended_weight_range_size_166w).
evidence(all_consistent(recommended_weight_range_size_166w)).
query(true_val(recommended_weight_range_size_166w, r82_118plus)).
query(true_val(recommended_weight_range_size_166w, unk_recommended_weight_range_size_166w)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2720=2720.0 v3002=3002.0 v3520=3520.0
% @importance 0.77

0.92::acc(s22, board_weight_grams).
0.72::acc(s25, board_weight_grams).
0.55::acc(s28, board_weight_grams).
0.50::true_val(board_weight_grams, v2720); 0.30::true_val(board_weight_grams, v3002); 0.20::true_val(board_weight_grams, v3520).
measured(s22, board_weight_grams, v2720).
measured(s25, board_weight_grams, v3002).
measured(s28, board_weight_grams, v3520).
all_consistent(board_weight_grams) :-
    consistent(s22, board_weight_grams),
    (indep(s25), consistent(s25, board_weight_grams) ; \+indep(s25)),
    consistent(s28, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2720)).
query(true_val(board_weight_grams, v3002)).
query(true_val(board_weight_grams, v3520)).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical false
% @original_name weight_per_cm
% @values v16_79=16.79 unk_weight_per_cm=Unknown
% @importance 0.8

0.90::acc(s27, weight_per_cm).
0.82::true_val(weight_per_cm, v16_79); 0.18::true_val(weight_per_cm, unk_weight_per_cm).
measured(s27, weight_per_cm, v16_79).
all_consistent(weight_per_cm) :-
    consistent(s27, weight_per_cm).
evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v16_79)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr weight_feel
% @type categorical
% @canonical false
% @original_name DISAGREEMENT — weight feel
% @values lighter_than_normal=Lighter_than_normal unk_weight_feel=Unknown
% @importance 0.775

0.85::acc(s27, weight_feel).
0.78::acc(s20, weight_feel).
0.90::true_val(weight_feel, lighter_than_normal); 0.10::true_val(weight_feel, unk_weight_feel).
measured(s27, weight_feel, lighter_than_normal).
measured(s20, weight_feel, lighter_than_normal).
all_consistent(weight_feel) :-
    consistent(s27, weight_feel),
    (indep(s20), consistent(s20, weight_feel) ; \+indep(s20)).
evidence(all_consistent(weight_feel)).
query(true_val(weight_feel, lighter_than_normal)).
query(true_val(weight_feel, unk_weight_feel)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v899_95=899.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.92::acc(s29, price_usd_msrp).
0.90::acc(s30, price_usd_msrp).
0.95::true_val(price_usd_msrp, v899_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s29, price_usd_msrp, v899_95).
measured(s30, price_usd_msrp, v899_95).
all_consistent(price_usd_msrp) :-
    (indep(s29), consistent(s29, price_usd_msrp) ; \+indep(s29)),
    consistent(s30, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v899_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo
% @values v899_95=899.95 unk_price_usd_evo=Unknown
% @importance 0.95

0.93::acc(s2, price_usd_evo).
0.90::true_val(price_usd_evo, v899_95); 0.10::true_val(price_usd_evo, unk_price_usd_evo).
measured(s2, price_usd_evo, v899_95).
all_consistent(price_usd_evo) :-
    consistent(s2, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v899_95)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_aspen
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (Aspen Ski and Board)
% @values v899_95=899.95 unk_price_aspen=Unknown
% @importance 0.95

0.92::acc(s30, price_aspen).
0.90::true_val(price_aspen, v899_95); 0.10::true_val(price_aspen, unk_price_aspen).
measured(s30, price_aspen, v899_95).
all_consistent(price_aspen) :-
    consistent(s30, price_aspen).
evidence(all_consistent(price_aspen)).
query(true_val(price_aspen, v899_95)).
query(true_val(price_aspen, unk_price_aspen)).

% @attr price_source_snowboard
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (The Source Snowboard)
% @values v815=815.0 v652=652.0
% @importance 0.9

0.85::acc(s31, price_source_snowboard).
0.50::true_val(price_source_snowboard, v815); 0.50::true_val(price_source_snowboard, v652).
measured(s31, price_source_snowboard, v652).
all_consistent(price_source_snowboard) :-
    (indep(s26), consistent(s26, price_source_snowboard) ; \+indep(s26)).
evidence(all_consistent(price_source_snowboard)).
query(true_val(price_source_snowboard, v815)).
query(true_val(price_source_snowboard, v652)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v879_99=879.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(sm, price_aud_merchant).
0.93::true_val(price_aud_merchant, v879_99); 0.07::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(sm, price_aud_merchant, v879_99).
all_consistent(price_aud_merchant) :-
    consistent(sm, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v879_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v1099_99=1099.99 unk_price_cad_prfo=Unknown
% @importance 0.85

0.85::acc(s32, price_cad_prfo).
0.78::true_val(price_cad_prfo, v1099_99); 0.22::true_val(price_cad_prfo, unk_price_cad_prfo).
measured(s32, price_cad_prfo, v1099_99).
all_consistent(price_cad_prfo) :-
    consistent(s32, price_cad_prfo).
evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v1099_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v879_95=879.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.85

0.85::acc(s32, price_eur_blue_tomato).
0.78::true_val(price_eur_blue_tomato, v879_95); 0.22::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
measured(s32, price_eur_blue_tomato, v879_95).
all_consistent(price_eur_blue_tomato) :-
    consistent(s32, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v879_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr warranty_period_years_eu
% @type numeric
% @unit years
% @canonical false
% @original_name warranty_period_years (EU)
% @values v2=2.0 unk_warranty_period_years_eu=Unknown
% @importance 0.7

0.72::acc(s25, warranty_period_years_eu).
0.68::true_val(warranty_period_years_eu, v2); 0.32::true_val(warranty_period_years_eu, unk_warranty_period_years_eu).
measured(s25, warranty_period_years_eu, v2).
all_consistent(warranty_period_years_eu) :-
    (indep(s25), consistent(s25, warranty_period_years_eu) ; \+indep(s25)).
evidence(all_consistent(warranty_period_years_eu)).
query(true_val(warranty_period_years_eu, v2)).
query(true_val(warranty_period_years_eu, unk_warranty_period_years_eu)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values widely_available=Widely_available_multiple_retailers unk_availability_status=Unknown
% @importance 0.7

0.85::acc(s2, availability_status).
0.90::true_val(availability_status, widely_available); 0.10::true_val(availability_status, unk_availability_status).
measured(s2, availability_status, widely_available).
all_consistent(availability_status) :-
    consistent(s2, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, widely_available)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI)
% @values not_available=Listed_but_not_available_sold_out unk_availability_status_rei=Unknown
% @importance 0.7

0.88::acc(s33, availability_status_rei).
0.82::true_val(availability_status_rei, not_available); 0.18::true_val(availability_status_rei, unk_availability_status_rei).
measured(s33, availability_status_rei, not_available).
all_consistent(availability_status_rei) :-
    consistent(s33, availability_status_rei).
evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, not_available)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_burton
% @type categorical
% @canonical false
% @original_name availability_status (Burton.com)
% @values partial_sizes=Product_page_exists_some_sizes_no_results unk_availability_status_burton=Unknown
% @importance 0.7

0.85::acc(s1, availability_status_burton).
0.82::true_val(availability_status_burton, partial_sizes); 0.18::true_val(availability_status_burton, unk_availability_status_burton).
measured(s1, availability_status_burton, partial_sizes).
all_consistent(availability_status_burton) :-
    consistent(s1, availability_status_burton).
evidence(all_consistent(availability_status_burton)).
query(true_val(availability_status_burton, partial_sizes)).
query(true_val(availability_status_burton, unk_availability_status_burton)).

% @attr evo_reputation
% @type categorical
% @canonical false
% @original_name Evo.com reputation
% @values major_retailer_price_match=Major_retailer_price_match_1yr_return unk_evo_reputation=Unknown
% @importance 0.95

0.85::acc(s2, evo_reputation).
0.82::true_val(evo_reputation, major_retailer_price_match); 0.18::true_val(evo_reputation, unk_evo_reputation).
measured(s2, evo_reputation, major_retailer_price_match).
all_consistent(evo_reputation) :-
    consistent(s2, evo_reputation).
evidence(all_consistent(evo_reputation)).
query(true_val(evo_reputation, major_retailer_price_match)).
query(true_val(evo_reputation, unk_evo_reputation)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v91_5=91.5 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.95

0.90::acc(s22, overall_rating_snowboardingprofiles).
0.82::true_val(overall_rating_snowboardingprofiles, v91_5); 0.18::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).
measured(s22, overall_rating_snowboardingprofiles, v91_5).
all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s22, overall_rating_snowboardingprofiles).
evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v91_5)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values no1_of_19=Number_1_of_19_aggressive_AM_boards_2025_2026 unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.925

0.90::acc(s22, reviewer_opinion_snowboardingprofiles).
0.88::acc(s34, reviewer_opinion_snowboardingprofiles).
0.95::true_val(reviewer_opinion_snowboardingprofiles, no1_of_19); 0.05::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
measured(s22, reviewer_opinion_snowboardingprofiles, no1_of_19).
measured(s34, reviewer_opinion_snowboardingprofiles, no1_of_19).
all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s22, reviewer_opinion_snowboardingprofiles),
    consistent(s34, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, no1_of_19)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr avg_score_aggressive_am
% @type numeric
% @unit /100
% @canonical false
% @original_name Average score for aggressive AM boards
% @values v85_5=85.5 unk_avg_score_aggressive_am=Unknown
% @importance 0.95

0.88::acc(s22, avg_score_aggressive_am).
0.82::true_val(avg_score_aggressive_am, v85_5); 0.18::true_val(avg_score_aggressive_am, unk_avg_score_aggressive_am).
measured(s22, avg_score_aggressive_am, v85_5).
all_consistent(avg_score_aggressive_am) :-
    consistent(s22, avg_score_aggressive_am).
evidence(all_consistent(avg_score_aggressive_am)).
query(true_val(avg_score_aggressive_am, v85_5)).
query(true_val(avg_score_aggressive_am, unk_avg_score_aggressive_am)).

% @attr avg_price_aggressive_am
% @type numeric
% @unit USD
% @canonical false
% @original_name Average price for aggressive AM boards tested
% @values v655=655.0 unk_avg_price_aggressive_am=Unknown
% @importance 0.95

0.88::acc(s22, avg_price_aggressive_am).
0.82::true_val(avg_price_aggressive_am, v655); 0.18::true_val(avg_price_aggressive_am, unk_avg_price_aggressive_am).
measured(s22, avg_price_aggressive_am, v655).
all_consistent(avg_price_aggressive_am) :-
    consistent(s22, avg_price_aggressive_am).
evidence(all_consistent(avg_price_aggressive_am)).
query(true_val(avg_price_aggressive_am, v655)).
query(true_val(avg_price_aggressive_am, unk_avg_price_aggressive_am)).

% @attr the_inertia_review
% @type categorical
% @canonical false
% @original_name The Inertia
% @values former_top_pick_worthy=Former_top_pick_still_worthy_of_consideration unk_the_inertia_review=Unknown
% @importance 0.85

0.80::acc(s35, the_inertia_review).
0.72::true_val(the_inertia_review, former_top_pick_worthy); 0.28::true_val(the_inertia_review, unk_the_inertia_review).
measured(s35, the_inertia_review, former_top_pick_worthy).
all_consistent(the_inertia_review) :-
    consistent(s35, the_inertia_review).
evidence(all_consistent(the_inertia_review)).
query(true_val(the_inertia_review, former_top_pick_worthy)).
query(true_val(the_inertia_review, unk_the_inertia_review)).

% @attr merchant_user_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Merchant user rating
% @values v5_0=5.0 unk_merchant_user_rating=Unknown
% @importance 0.85

0.80::acc(sm, merchant_user_rating).
0.78::true_val(merchant_user_rating, v5_0); 0.22::true_val(merchant_user_rating, unk_merchant_user_rating).
measured(sm, merchant_user_rating, v5_0).
all_consistent(merchant_user_rating) :-
    consistent(sm, merchant_user_rating).
evidence(all_consistent(merchant_user_rating)).
query(true_val(merchant_user_rating, v5_0)).
query(true_val(merchant_user_rating, unk_merchant_user_rating)).

% @attr speed_rating_tgr
% @type numeric
% @unit /5
% @canonical true
% @original_name speed_rating_tgr
% @values v4_5=4.5 unk_speed_rating_tgr=Unknown
% @importance 0.95

0.88::acc(s22, speed_rating_tgr).
0.82::true_val(speed_rating_tgr, v4_5); 0.18::true_val(speed_rating_tgr, unk_speed_rating_tgr).
measured(s22, speed_rating_tgr, v4_5).
all_consistent(speed_rating_tgr) :-
    consistent(s22, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, v4_5)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v5=5.0 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.95

0.90::acc(s22, carving_score_snowboardingprofiles).
0.82::true_val(carving_score_snowboardingprofiles, v5); 0.18::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).
measured(s22, carving_score_snowboardingprofiles, v5).
all_consistent(carving_score_snowboardingprofiles) :-
    consistent(s22, carving_score_snowboardingprofiles).
evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr turns_score
% @type numeric
% @unit /5
% @canonical false
% @original_name Turns score
% @values v3_5=3.5 unk_turns_score=Unknown
% @importance 0.95

0.88::acc(s22, turns_score).
0.82::true_val(turns_score, v3_5); 0.18::true_val(turns_score, unk_turns_score).
measured(s22, turns_score, v3_5).
all_consistent(turns_score) :-
    consistent(s22, turns_score).
evidence(all_consistent(turns_score)).
query(true_val(turns_score, v3_5)).
query(true_val(turns_score, unk_turns_score)).

% @attr jumps_score
% @type numeric
% @unit /5
% @canonical false
% @original_name Jumps score
% @values v4=4.0 unk_jumps_score=Unknown
% @importance 0.95

0.88::acc(s22, jumps_score).
0.82::true_val(jumps_score, v4); 0.18::true_val(jumps_score, unk_jumps_score).
measured(s22, jumps_score, v4).
all_consistent(jumps_score) :-
    consistent(s22, jumps_score).
evidence(all_consistent(jumps_score)).
query(true_val(jumps_score, v4)).
query(true_val(jumps_score, unk_jumps_score)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v2_5=2.5 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.95

0.88::acc(s22, powder_score_snowboardingprofiles).
0.82::true_val(powder_score_snowboardingprofiles, v2_5); 0.18::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).
measured(s22, powder_score_snowboardingprofiles, v2_5).
all_consistent(powder_score_snowboardingprofiles) :-
    consistent(s22, powder_score_snowboardingprofiles).
evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v2_5)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr crud_score
% @type numeric
% @unit /5
% @canonical false
% @original_name Crud score
% @values v4=4.0 unk_crud_score=Unknown
% @importance 0.95

0.88::acc(s22, crud_score).
0.82::true_val(crud_score, v4); 0.18::true_val(crud_score, unk_crud_score).
measured(s22, crud_score, v4).
all_consistent(crud_score) :-
    consistent(s22, crud_score).
evidence(all_consistent(crud_score)).
query(true_val(crud_score, v4)).
query(true_val(crud_score, unk_crud_score)).

% @attr trees_bumps_score
% @type numeric
% @unit /5
% @canonical false
% @original_name Trees/bumps score
% @values v3_5=3.5 unk_trees_bumps_score=Unknown
% @importance 0.95

0.88::acc(s22, trees_bumps_score).
0.82::true_val(trees_bumps_score, v3_5); 0.18::true_val(trees_bumps_score, unk_trees_bumps_score).
measured(s22, trees_bumps_score, v3_5).
all_consistent(trees_bumps_score) :-
    consistent(s22, trees_bumps_score).
evidence(all_consistent(trees_bumps_score)).
query(true_val(trees_bumps_score, v3_5)).
query(true_val(trees_bumps_score, unk_trees_bumps_score)).

% @attr switch_riding
% @type numeric
% @unit /5
% @canonical true
% @original_name switch_riding
% @values v3_5=3.5 unk_switch_riding=Unknown
% @importance 0.95

0.88::acc(s22, switch_riding).
0.82::true_val(switch_riding, v3_5); 0.18::true_val(switch_riding, unk_switch_riding).
measured(s22, switch_riding, v3_5).
all_consistent(switch_riding) :-
    consistent(s22, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, v3_5)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr spins_score
% @type numeric
% @unit /5
% @canonical false
% @original_name Spins score
% @values v3_5=3.5 unk_spins_score=Unknown
% @importance 0.95

0.88::acc(s22, spins_score).
0.82::true_val(spins_score, v3_5); 0.18::true_val(spins_score, unk_spins_score).
measured(s22, spins_score, v3_5).
all_consistent(spins_score) :-
    consistent(s22, spins_score).
evidence(all_consistent(spins_score)).
query(true_val(spins_score, v3_5)).
query(true_val(spins_score, unk_spins_score)).

% @attr dampness_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name Dampness rating (reviewer)
% @values v6=6.0 unk_dampness_rating=Unknown
% @importance 0.95

0.85::acc(s22, dampness_rating).
0.82::true_val(dampness_rating, v6); 0.18::true_val(dampness_rating, unk_dampness_rating).
measured(s22, dampness_rating, v6).
all_consistent(dampness_rating) :-
    consistent(s22, dampness_rating).
evidence(all_consistent(dampness_rating)).
query(true_val(dampness_rating, v6)).
query(true_val(dampness_rating, unk_dampness_rating)).

% @attr smooth_snappy_rating
% @type numeric
% @unit /10
% @canonical false
% @original_name Smooth/snappy rating (reviewer)
% @values v5=5.0 unk_smooth_snappy_rating=Unknown
% @importance 0.95

0.85::acc(s22, smooth_snappy_rating).
0.82::true_val(smooth_snappy_rating, v5); 0.18::true_val(smooth_snappy_rating, unk_smooth_snappy_rating).
measured(s22, smooth_snappy_rating, v5).
all_consistent(smooth_snappy_rating) :-
    consistent(s22, smooth_snappy_rating).
evidence(all_consistent(smooth_snappy_rating)).
query(true_val(smooth_snappy_rating, v5)).
query(true_val(smooth_snappy_rating, unk_smooth_snappy_rating)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good_hard_snow=Good_on_hard_snow unk_edge_hold=Unknown
% @importance 0.95

0.85::acc(s22, edge_hold).
0.82::true_val(edge_hold, good_hard_snow); 0.18::true_val(edge_hold, unk_edge_hold).
measured(s22, edge_hold, good_hard_snow).
all_consistent(edge_hold) :-
    consistent(s22, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good_hard_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values oodles_requires_effort=Oodles_of_pop_requires_effort_to_access unk_pop=Unknown
% @importance 0.95

0.85::acc(s22, pop).
0.82::true_val(pop, oodles_requires_effort); 0.18::true_val(pop, unk_pop).
measured(s22, pop, oodles_requires_effort).
all_consistent(pop) :-
    consistent(s22, pop).
evidence(all_consistent(pop)).
query(true_val(pop, oodles_requires_effort)).
query(true_val(pop, unk_pop)).

% @attr reviewer_opinion_snowboardingprofiles_catchiness
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (catchiness)
% @values most_catchy_slow=Most_catchy_at_slow_speeds_improved_over_older unk_reviewer_opinion_snowboardingprofiles_catchiness=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_catchiness).
0.82::true_val(reviewer_opinion_snowboardingprofiles_catchiness, most_catchy_slow); 0.18::true_val(reviewer_opinion_snowboardingprofiles_catchiness, unk_reviewer_opinion_snowboardingprofiles_catchiness).
measured(s22, reviewer_opinion_snowboardingprofiles_catchiness, most_catchy_slow).
all_consistent(reviewer_opinion_snowboardingprofiles_catchiness) :-
    consistent(s22, reviewer_opinion_snowboardingprofiles_catchiness).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_catchiness)).
query(true_val(reviewer_opinion_snowboardingprofiles_catchiness, most_catchy_slow)).
query(true_val(reviewer_opinion_snowboardingprofiles_catchiness, unk_reviewer_opinion_snowboardingprofiles_catchiness)).

% @attr reviewer_opinion_snowboardingprofiles_slow_speed
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (slow speed)
% @values not_agile_slow=Not_agile_at_slow_speeds unk_reviewer_opinion_snowboardingprofiles_slow_speed=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_slow_speed).
0.82::true_val(reviewer_opinion_snowboardingprofiles_slow_speed, not_agile_slow); 0.18::true_val(reviewer_opinion_snowboardingprofiles_slow_speed, unk_reviewer_opinion_snowboardingprofiles_slow_speed).
measured(s22, reviewer_opinion_snowboardingprofiles_slow_speed, not_agile_slow).
all_consistent(reviewer_opinion_snowboardingprofiles_slow_speed) :-
    consistent(s22, reviewer_opinion_snowboardingprofiles_slow_speed).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_slow_speed)).
query(true_val(reviewer_opinion_snowboardingprofiles_slow_speed, not_agile_slow)).
query(true_val(reviewer_opinion_snowboardingprofiles_slow_speed, unk_reviewer_opinion_snowboardingprofiles_slow_speed)).

% @attr reviewer_opinion_snowboardingprofiles_press
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (press)
% @values requires_muscling=Requires_muscling_to_press_difficult_to_overflex unk_reviewer_opinion_snowboardingprofiles_press=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_press).
0.82::true_val(reviewer_opinion_snowboardingprofiles_press, requires_muscling); 0.18::true_val(reviewer_opinion_snowboardingprofiles_press, unk_reviewer_opinion_snowboardingprofiles_press).
measured(s22, reviewer_opinion_snowboardingprofiles_press, requires_muscling).
all_consistent(reviewer_opinion_snowboardingprofiles_press) :-
    consistent(s22, reviewer_opinion_snowboardingprofiles_press).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_press)).
query(true_val(reviewer_opinion_snowboardingprofiles_press, requires_muscling)).
query(true_val(reviewer_opinion_snowboardingprofiles_press, unk_reviewer_opinion_snowboardingprofiles_press)).

% @attr reviewer_opinion_snowboardingprofiles_jib
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (jib)
% @values not_recommended_jib=Not_recommended_for_jib_line unk_reviewer_opinion_snowboardingprofiles_jib=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_jib).
0.82::true_val(reviewer_opinion_snowboardingprofiles_jib, not_recommended_jib); 0.18::true_val(reviewer_opinion_snowboardingprofiles_jib, unk_reviewer_opinion_snowboardingprofiles_jib).
measured(s22, reviewer_opinion_snowboardingprofiles_jib, not_recommended_jib).
all_consistent(reviewer_opinion_snowboardingprofiles_jib) :-
    consistent(s22, reviewer_opinion_snowboardingprofiles_jib).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_jib)).
query(true_val(reviewer_opinion_snowboardingprofiles_jib, not_recommended_jib)).
query(true_val(reviewer_opinion_snowboardingprofiles_jib, unk_reviewer_opinion_snowboardingprofiles_jib)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name Exceptional carving performance
% @values exceptional_carving=Exceptional_carving_performance unk_positive_aspect=Unknown
% @importance 0.85

0.88::acc(s22, positive_aspect).
0.82::acc(s36, positive_aspect).
0.78::acc(s37, positive_aspect).
0.95::true_val(positive_aspect, exceptional_carving); 0.05::true_val(positive_aspect, unk_positive_aspect).
measured(s22, positive_aspect, exceptional_carving).
measured(s36, positive_aspect, exceptional_carving).
measured(s37, positive_aspect, exceptional_carving).
all_consistent(positive_aspect) :-
    consistent(s22, positive_aspect),
    (indep(s36), consistent(s36, positive_aspect) ; \+indep(s36)),
    consistent(s37, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, exceptional_carving)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name Outstanding pop and snap out of turns
% @values outstanding_pop=Outstanding_pop_and_snap unk_positive_aspect_pop=Unknown
% @importance 0.75

0.80::acc(s36, positive_aspect_pop).
0.78::acc(s37, positive_aspect_pop).
0.90::true_val(positive_aspect_pop, outstanding_pop); 0.10::true_val(positive_aspect_pop, unk_positive_aspect_pop).
measured(s36, positive_aspect_pop, outstanding_pop).
measured(s37, positive_aspect_pop, outstanding_pop).
all_consistent(positive_aspect_pop) :-
    (indep(s36), consistent(s36, positive_aspect_pop) ; \+indep(s36)),
    consistent(s37, positive_aspect_pop).
evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, outstanding_pop)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

% @attr positive_aspect_weight
% @type categorical
% @canonical false
% @original_name Very light weight for its stiffness
% @values very_light=Very_light_weight_for_stiffness unk_positive_aspect_weight=Unknown
% @importance 0.75

0.78::acc(s20, positive_aspect_weight).
0.88::acc(s27, positive_aspect_weight).
0.90::true_val(positive_aspect_weight, very_light); 0.10::true_val(positive_aspect_weight, unk_positive_aspect_weight).
measured(s20, positive_aspect_weight, very_light).
measured(s27, positive_aspect_weight, very_light).
all_consistent(positive_aspect_weight) :-
    (indep(s20), consistent(s20, positive_aspect_weight) ; \+indep(s20)),
    consistent(s27, positive_aspect_weight).
evidence(all_consistent(positive_aspect_weight)).
query(true_val(positive_aspect_weight, very_light)).
query(true_val(positive_aspect_weight, unk_positive_aspect_weight)).

% @attr positive_aspect_flex_retention
% @type categorical
% @canonical false
% @original_name Consistent flex retention over time due to Infinite Ride
% @values consistent_flex=Consistent_flex_retention_Infinite_Ride unk_positive_aspect_flex_retention=Unknown
% @importance 0.95

0.85::acc(s2, positive_aspect_flex_retention).
0.82::true_val(positive_aspect_flex_retention, consistent_flex); 0.18::true_val(positive_aspect_flex_retention, unk_positive_aspect_flex_retention).
measured(s2, positive_aspect_flex_retention, consistent_flex).
all_consistent(positive_aspect_flex_retention) :-
    (indep(s2), consistent(s2, positive_aspect_flex_retention) ; \+indep(s2)).
evidence(all_consistent(positive_aspect_flex_retention)).
query(true_val(positive_aspect_flex_retention, consistent_flex)).
query(true_val(positive_aspect_flex_retention, unk_positive_aspect_flex_retention)).

% @attr positive_aspect_forgiveness
% @type categorical
% @canonical false
% @original_name Improved forgiveness compared to older Custom X models
% @values improved_forgiveness=Improved_forgiveness_vs_older_models unk_positive_aspect_forgiveness=Unknown
% @importance 0.95

0.85::acc(s22, positive_aspect_forgiveness).
0.82::true_val(positive_aspect_forgiveness, improved_forgiveness); 0.18::true_val(positive_aspect_forgiveness, unk_positive_aspect_forgiveness).
measured(s22, positive_aspect_forgiveness, improved_forgiveness).
all_consistent(positive_aspect_forgiveness) :-
    consistent(s22, positive_aspect_forgiveness).
evidence(all_consistent(positive_aspect_forgiveness)).
query(true_val(positive_aspect_forgiveness, improved_forgiveness)).
query(true_val(positive_aspect_forgiveness, unk_positive_aspect_forgiveness)).

% @attr positive_aspect_edge_transitions
% @type categorical
% @canonical false
% @original_name Excellent edge-to-edge transitions and edge hold on groomed/hard snow
% @values excellent_edge_transitions=Excellent_edge_transitions_and_hold unk_positive_aspect_edge_transitions=Unknown
% @importance 0.85

0.88::acc(s22, positive_aspect_edge_transitions).
0.80::acc(s36, positive_aspect_edge_transitions).
0.95::true_val(positive_aspect_edge_transitions, excellent_edge_transitions); 0.05::true_val(positive_aspect_edge_transitions, unk_positive_aspect_edge_transitions).
measured(s22, positive_aspect_edge_transitions, excellent_edge_transitions).
measured(s36, positive_aspect_edge_transitions, excellent_edge_transitions).
all_consistent(positive_aspect_edge_transitions) :-
    consistent(s22, positive_aspect_edge_transitions),
    (indep(s36), consistent(s36, positive_aspect_edge_transitions) ; \+indep(s36)).
evidence(all_consistent(positive_aspect_edge_transitions)).
query(true_val(positive_aspect_edge_transitions, excellent_edge_transitions)).
query(true_val(positive_aspect_edge_transitions, unk_positive_aspect_edge_transitions)).

% @attr positive_aspect_quiver
% @type categorical
% @canonical false
% @original_name Good quiver board for aggressive riders
% @values no1_quiver=Good_quiver_board_no1_aggressive_AM unk_positive_aspect_quiver=Unknown
% @importance 0.9

0.88::acc(s34, positive_aspect_quiver).
0.82::true_val(positive_aspect_quiver, no1_quiver); 0.18::true_val(positive_aspect_quiver, unk_positive_aspect_quiver).
measured(s34, positive_aspect_quiver, no1_quiver).
all_consistent(positive_aspect_quiver) :-
    consistent(s34, positive_aspect_quiver).
evidence(all_consistent(positive_aspect_quiver)).
query(true_val(positive_aspect_quiver, no1_quiver)).
query(true_val(positive_aspect_quiver, unk_positive_aspect_quiver)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name Not suitable for beginners or intermediates
% @values not_for_beginners=Not_suitable_for_beginners_or_intermediates unk_negative_aspect=Unknown
% @importance 0.85

0.88::acc(s22, negative_aspect).
0.80::acc(s36, negative_aspect).
0.95::true_val(negative_aspect, not_for_beginners); 0.05::true_val(negative_aspect, unk_negative_aspect).
measured(s22, negative_aspect, not_for_beginners).
measured(s36, negative_aspect, not_for_beginners).
all_consistent(negative_aspect) :-
    consistent(s22, negative_aspect),
    (indep(s36), consistent(s36, negative_aspect) ; \+indep(s36)).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_for_beginners)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name Below average in deep powder
% @values below_avg_powder=Below_average_deep_powder_minimal_float unk_negative_aspect_powder=Unknown
% @importance 0.95

0.85::acc(s22, negative_aspect_powder).
0.82::true_val(negative_aspect_powder, below_avg_powder); 0.18::true_val(negative_aspect_powder, unk_negative_aspect_powder).
measured(s22, negative_aspect_powder, below_avg_powder).
all_consistent(negative_aspect_powder) :-
    consistent(s22, negative_aspect_powder).
evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, below_avg_powder)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

% @attr negative_aspect_edge_catch
% @type categorical
% @canonical false
% @original_name Catches edge more easily than hybrid/rocker boards
% @values catches_edge=Catches_edge_more_easily_especially_slow_speeds unk_negative_aspect_edge_catch=Unknown
% @importance 0.85

0.85::acc(s22, negative_aspect_edge_catch).
0.80::acc(s36, negative_aspect_edge_catch).
0.90::true_val(negative_aspect_edge_catch, catches_edge); 0.10::true_val(negative_aspect_edge_catch, unk_negative_aspect_edge_catch).
measured(s22, negative_aspect_edge_catch, catches_edge).
measured(s36, negative_aspect_edge_catch, catches_edge).
all_consistent(negative_aspect_edge_catch) :-
    consistent(s22, negative_aspect_edge_catch),
    (indep(s36), consistent(s36, negative_aspect_edge_catch) ; \+indep(s36)).
evidence(all_consistent(negative_aspect_edge_catch)).
query(true_val(negative_aspect_edge_catch, catches_edge)).
query(true_val(negative_aspect_edge_catch, unk_negative_aspect_edge_catch)).

% @attr negative_aspect_slow_speed
% @type categorical
% @canonical false
% @original_name Slow-speed maneuverability is weak
% @values weak_slow_speed=Slow_speed_maneuverability_weak unk_negative_aspect_slow_speed=Unknown
% @importance 0.95

0.85::acc(s22, negative_aspect_slow_speed).
0.82::true_val(negative_aspect_slow_speed, weak_slow_speed); 0.18::true_val(negative_aspect_slow_speed, unk_negative_aspect_slow_speed).
measured(s22, negative_aspect_slow_speed, weak_slow_speed).
all_consistent(negative_aspect_slow_speed) :-
    consistent(s22, negative_aspect_slow_speed).
evidence(all_consistent(negative_aspect_slow_speed)).
query(true_val(negative_aspect_slow_speed, weak_slow_speed)).
query(true_val(negative_aspect_slow_speed, unk_negative_aspect_slow_speed)).

% @attr negative_aspect_park_jib
% @type categorical
% @canonical false
% @original_name Not ideal for park jibbing or buttering
% @values not_ideal_park_jib=Not_ideal_for_park_jibbing_or_buttering unk_negative_aspect_park_jib=Unknown
% @importance 0.95

0.85::acc(s22, negative_aspect_park_jib).
0.82::true_val(negative_aspect_park_jib, not_ideal_park_jib); 0.18::true_val(negative_aspect_park_jib, unk_negative_aspect_park_jib).
measured(s22, negative_aspect_park_jib, not_ideal_park_jib).
all_consistent(negative_aspect_park_jib) :-
    consistent(s22, negative_aspect_park_jib).
evidence(all_consistent(negative_aspect_park_jib)).
query(true_val(negative_aspect_park_jib, not_ideal_park_jib)).
query(true_val(negative_aspect_park_jib, unk_negative_aspect_park_jib)).

% @attr negative_aspect_chatter
% @type categorical
% @canonical false
% @original_name Can feel chattery at extremely high speeds on the 156
% @values chattery_156=Can_feel_chattery_high_speeds_on_156_suggests_sizing_up unk_negative_aspect_chatter=Unknown
% @importance 0.95

0.82::acc(s22, negative_aspect_chatter).
0.78::true_val(negative_aspect_chatter, chattery_156); 0.22::true_val(negative_aspect_chatter, unk_negative_aspect_chatter).
measured(s22, negative_aspect_chatter, chattery_156).
all_consistent(negative_aspect_chatter) :-
    consistent(s22, negative_aspect_chatter).
evidence(all_consistent(negative_aspect_chatter)).
query(true_val(negative_aspect_chatter, chattery_156)).
query(true_val(negative_aspect_chatter, unk_negative_aspect_chatter)).

% @attr negative_aspect_heavy_vs_vapor
% @type categorical
% @canonical false
% @original_name Heavy compared to Burton Vapor and Mystery models
% @values heavier_than_vapor=Heavy_compared_to_Vapor_and_Mystery unk_negative_aspect_heavy_vs_vapor=Unknown
% @importance 0.75

0.65::acc(s37, negative_aspect_heavy_vs_vapor).
0.60::true_val(negative_aspect_heavy_vs_vapor, heavier_than_vapor); 0.40::true_val(negative_aspect_heavy_vs_vapor, unk_negative_aspect_heavy_vs_vapor).
measured(s37, negative_aspect_heavy_vs_vapor, heavier_than_vapor).
all_consistent(negative_aspect_heavy_vs_vapor) :-
    consistent(s37, negative_aspect_heavy_vs_vapor).
evidence(all_consistent(negative_aspect_heavy_vs_vapor)).
query(true_val(negative_aspect_heavy_vs_vapor, heavier_than_vapor)).
query(true_val(negative_aspect_heavy_vs_vapor, unk_negative_aspect_heavy_vs_vapor)).

% @attr negative_aspect_edge_corrosion
% @type categorical
% @canonical false
% @original_name Non-stainless steel edges may corrode after one year
% @values edge_corrosion_risk=Non_stainless_edges_may_corrode_1yr unk_negative_aspect_edge_corrosion=Unknown
% @importance 0.75

0.60::acc(s37, negative_aspect_edge_corrosion).
0.55::true_val(negative_aspect_edge_corrosion, edge_corrosion_risk); 0.45::true_val(negative_aspect_edge_corrosion, unk_negative_aspect_edge_corrosion).
measured(s37, negative_aspect_edge_corrosion, edge_corrosion_risk).
all_consistent(negative_aspect_edge_corrosion) :-
    consistent(s37, negative_aspect_edge_corrosion).
evidence(all_consistent(negative_aspect_edge_corrosion)).
query(true_val(negative_aspect_edge_corrosion, edge_corrosion_risk)).
query(true_val(negative_aspect_edge_corrosion, unk_negative_aspect_edge_corrosion)).

% @attr negative_aspect_price
% @type categorical
% @canonical false
% @original_name Price is high
% @values price_above_avg=Price_899_vs_655_avg_for_category unk_negative_aspect_price=Unknown
% @importance 0.95

0.88::acc(s22, negative_aspect_price).
0.82::true_val(negative_aspect_price, price_above_avg); 0.18::true_val(negative_aspect_price, unk_negative_aspect_price).
measured(s22, negative_aspect_price, price_above_avg).
all_consistent(negative_aspect_price) :-
    consistent(s22, negative_aspect_price).
evidence(all_consistent(negative_aspect_price)).
query(true_val(negative_aspect_price, price_above_avg)).
query(true_val(negative_aspect_price, unk_negative_aspect_price)).

% @attr negative_aspect_channel_lockin
% @type categorical
% @canonical false
% @original_name The Channel system requires specific inserts
% @values channel_lockin=Channel_requires_inserts_best_with_Burton_EST unk_negative_aspect_channel_lockin=Unknown
% @importance 0.825

0.85::acc(s2, negative_aspect_channel_lockin).
0.75::acc(s20, negative_aspect_channel_lockin).
0.90::true_val(negative_aspect_channel_lockin, channel_lockin); 0.10::true_val(negative_aspect_channel_lockin, unk_negative_aspect_channel_lockin).
measured(s2, negative_aspect_channel_lockin, channel_lockin).
measured(s20, negative_aspect_channel_lockin, channel_lockin).
all_consistent(negative_aspect_channel_lockin) :-
    (indep(s2), consistent(s2, negative_aspect_channel_lockin) ; \+indep(s2)),
    (indep(s20), consistent(s20, negative_aspect_channel_lockin) ; \+indep(s20)).
evidence(all_consistent(negative_aspect_channel_lockin)).
query(true_val(negative_aspect_channel_lockin, channel_lockin)).
query(true_val(negative_aspect_channel_lockin, unk_negative_aspect_channel_lockin)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name Forum users describe it as
% @values precise_scalpel_carver=Precise_clinical_scalpel_like_carver unk_user_review_forum=Unknown
% @importance 0.8

0.72::acc(s38, user_review_forum).
0.65::true_val(user_review_forum, precise_scalpel_carver); 0.35::true_val(user_review_forum, unk_user_review_forum).
measured(s38, user_review_forum, precise_scalpel_carver).
all_consistent(user_review_forum) :-
    consistent(s38, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, precise_scalpel_carver)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_not_relaxed
% @type categorical
% @canonical false
% @original_name Not a board you can relax and clown around all day on
% @values not_relaxed=Not_a_board_to_relax_on unk_user_review_forum_not_relaxed=Unknown
% @importance 0.8

0.72::acc(s38, user_review_forum_not_relaxed).
0.65::true_val(user_review_forum_not_relaxed, not_relaxed); 0.35::true_val(user_review_forum_not_relaxed, unk_user_review_forum_not_relaxed).
measured(s38, user_review_forum_not_relaxed, not_relaxed).
all_consistent(user_review_forum_not_relaxed) :-
    consistent(s38, user_review_forum_not_relaxed).
evidence(all_consistent(user_review_forum_not_relaxed)).
query(true_val(user_review_forum_not_relaxed, not_relaxed)).
query(true_val(user_review_forum_not_relaxed, unk_user_review_forum_not_relaxed)).

% @attr user_review_forum_speed
% @type categorical
% @canonical false
% @original_name Becomes much more enjoyable the faster you go
% @values better_at_speed=More_enjoyable_the_faster_you_go unk_user_review_forum_speed=Unknown
% @importance 0.8

0.72::acc(s38, user_review_forum_speed).
0.65::true_val(user_review_forum_speed, better_at_speed); 0.35::true_val(user_review_forum_speed, unk_user_review_forum_speed).
measured(s38, user_review_forum_speed, better_at_speed).
all_consistent(user_review_forum_speed) :-
    consistent(s38, user_review_forum_speed).
evidence(all_consistent(user_review_forum_speed)).
query(true_val(user_review_forum_speed, better_at_speed)).
query(true_val(user_review_forum_speed, unk_user_review_forum_speed)).

% @attr user_review_forum_cult
% @type categorical
% @canonical false
% @original_name Core of the Custom X has a cult-ish following
% @values cult_following=Cultish_following_hard_to_transition_away unk_user_review_forum_cult=Unknown
% @importance 0.75

0.65::acc(s39, user_review_forum_cult).
0.55::true_val(user_review_forum_cult, cult_following); 0.45::true_val(user_review_forum_cult, unk_user_review_forum_cult).
measured(s39, user_review_forum_cult, cult_following).
all_consistent(user_review_forum_cult) :-
    consistent(s39, user_review_forum_cult).
evidence(all_consistent(user_review_forum_cult)).
query(true_val(user_review_forum_cult, cult_following)).
query(true_val(user_review_forum_cult, unk_user_review_forum_cult)).

% @attr user_review_forum_wide_stiffer
% @type categorical
% @canonical false
% @original_name Wide versions feel stiffer than standard width
% @values wide_stiffer=Wide_boards_feel_stiffer_than_standard unk_user_review_forum_wide_stiffer=Unknown
% @importance 0.8

0.70::acc(s38, user_review_forum_wide_stiffer).
0.60::true_val(user_review_forum_wide_stiffer, wide_stiffer); 0.40::true_val(user_review_forum_wide_stiffer, unk_user_review_forum_wide_stiffer).
measured(s38, user_review_forum_wide_stiffer, wide_stiffer).
all_consistent(user_review_forum_wide_stiffer) :-
    consistent(s38, user_review_forum_wide_stiffer).
evidence(all_consistent(user_review_forum_wide_stiffer)).
query(true_val(user_review_forum_wide_stiffer, wide_stiffer)).
query(true_val(user_review_forum_wide_stiffer, unk_user_review_forum_wide_stiffer)).

% @attr user_review_forum_bindings
% @type categorical
% @canonical false
% @original_name Forum users recommend stiff bindings to match
% @values stiff_bindings_rec=Recommend_stiff_bindings_Genesis_Cartels unk_user_review_forum_bindings=Unknown
% @importance 0.75

0.65::acc(s28, user_review_forum_bindings).
0.70::acc(s38, user_review_forum_bindings).
0.80::true_val(user_review_forum_bindings, stiff_bindings_rec); 0.20::true_val(user_review_forum_bindings, unk_user_review_forum_bindings).
measured(s28, user_review_forum_bindings, stiff_bindings_rec).
measured(s38, user_review_forum_bindings, stiff_bindings_rec).
all_consistent(user_review_forum_bindings) :-
    consistent(s28, user_review_forum_bindings),
    consistent(s38, user_review_forum_bindings).
evidence(all_consistent(user_review_forum_bindings)).
query(true_val(user_review_forum_bindings, stiff_bindings_rec)).
query(true_val(user_review_forum_bindings, unk_user_review_forum_bindings)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values custom_vs_custom_x=Custom_X_stiffer_Custom_more_versatile_at_669 unk_comparable_board_same_brand=Unknown
% @importance 0.775

0.78::acc(s35, comparable_board_same_brand).
0.72::acc(s40, comparable_board_same_brand).
0.90::true_val(comparable_board_same_brand, custom_vs_custom_x); 0.10::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s35, comparable_board_same_brand, custom_vs_custom_x).
measured(s40, comparable_board_same_brand, custom_vs_custom_x).
all_consistent(comparable_board_same_brand) :-
    consistent(s35, comparable_board_same_brand),
    consistent(s40, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, custom_vs_custom_x)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_mt=Jones_Mountain_Twin_more_forgiving_better_ice_Custom_X_better_carver unk_comparable_board_cross_brand=Unknown
% @importance 0.7

0.68::acc(s40, comparable_board_cross_brand).
0.60::true_val(comparable_board_cross_brand, jones_mt); 0.40::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s40, comparable_board_cross_brand, jones_mt).
all_consistent(comparable_board_cross_brand) :-
    consistent(s40, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_mt)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_flagship
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Flagship)
% @values jones_flagship=Jones_Flagship_more_directional_freeride_Custom_X_all_mtn_charger unk_comparable_board_cross_brand_flagship=Unknown
% @importance 0.7

0.55::acc(s41, comparable_board_cross_brand_flagship).
0.50::true_val(comparable_board_cross_brand_flagship, jones_flagship); 0.50::true_val(comparable_board_cross_brand_flagship, unk_comparable_board_cross_brand_flagship).
measured(s41, comparable_board_cross_brand_flagship, jones_flagship).
all_consistent(comparable_board_cross_brand_flagship) :-
    consistent(s41, comparable_board_cross_brand_flagship).
evidence(all_consistent(comparable_board_cross_brand_flagship)).
query(true_val(comparable_board_cross_brand_flagship, jones_flagship)).
query(true_val(comparable_board_cross_brand_flagship, unk_comparable_board_cross_brand_flagship)).

% @attr comparable_board_cross_brand_alternatives
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (forum alternatives)
% @values capita_nitro_etc=CAPiTA_Mercury_Nitro_Team_Salomon_Assassin_K2_Broadcast unk_comparable_board_cross_brand_alternatives=Unknown
% @importance 0.75

0.60::acc(s39, comparable_board_cross_brand_alternatives).
0.52::true_val(comparable_board_cross_brand_alternatives, capita_nitro_etc); 0.48::true_val(comparable_board_cross_brand_alternatives, unk_comparable_board_cross_brand_alternatives).
measured(s39, comparable_board_cross_brand_alternatives, capita_nitro_etc).
all_consistent(comparable_board_cross_brand_alternatives) :-
    consistent(s39, comparable_board_cross_brand_alternatives).
evidence(all_consistent(comparable_board_cross_brand_alternatives)).
query(true_val(comparable_board_cross_brand_alternatives, capita_nitro_etc)).
query(true_val(comparable_board_cross_brand_alternatives, unk_comparable_board_cross_brand_alternatives)).

% @attr comparable_board_cross_brand_nidecker
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nidecker Alpha APX)
% @values nidecker_alpha_apx=Nidecker_Alpha_APX_2026_Best_Overall_The_Inertia unk_comparable_board_cross_brand_nidecker=Unknown
% @importance 0.85

0.78::acc(s35, comparable_board_cross_brand_nidecker).
0.72::true_val(comparable_board_cross_brand_nidecker, nidecker_alpha_apx); 0.28::true_val(comparable_board_cross_brand_nidecker, unk_comparable_board_cross_brand_nidecker).
measured(s35, comparable_board_cross_brand_nidecker, nidecker_alpha_apx).
all_consistent(comparable_board_cross_brand_nidecker) :-
    consistent(s35, comparable_board_cross_brand_nidecker).
evidence(all_consistent(comparable_board_cross_brand_nidecker)).
query(true_val(comparable_board_cross_brand_nidecker, nidecker_alpha_apx)).
query(true_val(comparable_board_cross_brand_nidecker, unk_comparable_board_cross_brand_nidecker)).

% @attr comparable_board_cross_brand_ranked
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (SnowboardingProfiles ranked)
% @values k2_jones_rome_gnu=K2_Antidote_Jones_Aviator_Rome_ReneGade_GNU_Wagyu unk_comparable_board_cross_brand_ranked=Unknown
% @importance 0.9

0.85::acc(s34, comparable_board_cross_brand_ranked).
0.80::true_val(comparable_board_cross_brand_ranked, k2_jones_rome_gnu); 0.20::true_val(comparable_board_cross_brand_ranked, unk_comparable_board_cross_brand_ranked).
measured(s34, comparable_board_cross_brand_ranked, k2_jones_rome_gnu).
all_consistent(comparable_board_cross_brand_ranked) :-
    consistent(s34, comparable_board_cross_brand_ranked).
evidence(all_consistent(comparable_board_cross_brand_ranked)).
query(true_val(comparable_board_cross_brand_ranked, k2_jones_rome_gnu)).
query(true_val(comparable_board_cross_brand_ranked, unk_comparable_board_cross_brand_ranked)).

% @attr comparable_board_same_brand_flying_v
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Flying V)
% @values flying_v=Flying_V_hybrid_rocker_less_catchy_better_powder_weaker_edge unk_comparable_board_same_brand_flying_v=Unknown
% @importance 0.65

0.72::acc(s42, comparable_board_same_brand_flying_v).
0.65::true_val(comparable_board_same_brand_flying_v, flying_v); 0.35::true_val(comparable_board_same_brand_flying_v, unk_comparable_board_same_brand_flying_v).
measured(s42, comparable_board_same_brand_flying_v, flying_v).
all_consistent(comparable_board_same_brand_flying_v) :-
    consistent(s42, comparable_board_same_brand_flying_v).
evidence(all_consistent(comparable_board_same_brand_flying_v)).
query(true_val(comparable_board_same_brand_flying_v, flying_v)).
query(true_val(comparable_board_same_brand_flying_v, unk_comparable_board_same_brand_flying_v)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values bio_resin_50pct=Bio_based_resin_reducing_carbon_footprint_50pct unk_sustainability_certification=Unknown
% @importance 0.925

0.88::acc(s2, sustainability_certification).
0.88::acc(sm, sustainability_certification).
0.95::true_val(sustainability_certification, bio_resin_50pct); 0.05::true_val(sustainability_certification, unk_sustainability_certification).
measured(s2, sustainability_certification, bio_resin_50pct).
measured(sm, sustainability_certification, bio_resin_50pct).
all_consistent(sustainability_certification) :-
    (indep(s2), consistent(s2, sustainability_certification) ; \+indep(s2)),
    (indep(sm), consistent(sm, sustainability_certification) ; \+indep(sm)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, bio_resin_50pct)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_core_wood=Core_wood_historically_FSC_certified unk_sustainability_certification_fsc=Unknown
% @importance 0.7

0.55::acc(s28, sustainability_certification_fsc).
0.50::true_val(sustainability_certification_fsc, fsc_core_wood); 0.50::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).
measured(s28, sustainability_certification_fsc, fsc_core_wood).
all_consistent(sustainability_certification_fsc) :-
    consistent(s28, sustainability_certification_fsc).
evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_core_wood)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr burton_brand_info
% @type categorical
% @canonical false
% @original_name Burton brand info
% @values worlds_most_recognized=Worlds_most_recognized_snowboard_brand_founded_1977_4348_stores unk_burton_brand_info=Unknown
% @importance 0.6

0.82::acc(s12, burton_brand_info).
0.78::true_val(burton_brand_info, worlds_most_recognized); 0.22::true_val(burton_brand_info, unk_burton_brand_info).
measured(s12, burton_brand_info, worlds_most_recognized).
all_consistent(burton_brand_info) :-
    consistent(s12, burton_brand_info).
evidence(all_consistent(burton_brand_info)).
query(true_val(burton_brand_info, worlds_most_recognized)).
query(true_val(burton_brand_info, unk_burton_brand_info)).

% @attr evo_retailer_info
% @type categorical
% @canonical false
% @original_name evo.com retailer info
% @values major_action_sports=Major_online_action_sports_1yr_return_price_match unk_evo_retailer_info=Unknown
% @importance 0.95

0.85::acc(s2, evo_retailer_info).
0.82::true_val(evo_retailer_info, major_action_sports); 0.18::true_val(evo_retailer_info, unk_evo_retailer_info).
measured(s2, evo_retailer_info, major_action_sports).
all_consistent(evo_retailer_info) :-
    consistent(s2, evo_retailer_info).
evidence(all_consistent(evo_retailer_info)).
query(true_val(evo_retailer_info, major_action_sports)).
query(true_val(evo_retailer_info, unk_evo_retailer_info)).

% @attr rei_retailer_info
% @type categorical
% @canonical false
% @original_name REI Co-op retailer info
% @values major_us_outdoor=Major_US_outdoor_retailer_sold_out_Custom_X unk_rei_retailer_info=Unknown
% @importance 0.7

0.82::acc(s33, rei_retailer_info).
0.78::true_val(rei_retailer_info, major_us_outdoor); 0.22::true_val(rei_retailer_info, unk_rei_retailer_info).
measured(s33, rei_retailer_info, major_us_outdoor).
all_consistent(rei_retailer_info) :-
    consistent(s33, rei_retailer_info).
evidence(all_consistent(rei_retailer_info)).
query(true_val(rei_retailer_info, major_us_outdoor)).
query(true_val(rei_retailer_info, unk_rei_retailer_info)).

% @attr blauer_retailer_info
% @type categorical
% @canonical false
% @original_name Blauer Board Shop retailer info
% @values specialty_decades=Specialty_board_shop_decades_experience unk_blauer_retailer_info=Unknown
% @importance 0.8

0.78::acc(s9, blauer_retailer_info).
0.70::true_val(blauer_retailer_info, specialty_decades); 0.30::true_val(blauer_retailer_info, unk_blauer_retailer_info).
measured(s9, blauer_retailer_info, specialty_decades).
all_consistent(blauer_retailer_info) :-
    (indep(s9), consistent(s9, blauer_retailer_info) ; \+indep(s9)).
evidence(all_consistent(blauer_retailer_info)).
query(true_val(blauer_retailer_info, specialty_decades)).
query(true_val(blauer_retailer_info, unk_blauer_retailer_info)).

% @attr ski_monster_retailer_info
% @type categorical
% @canonical false
% @original_name The Ski Monster retailer info
% @values boston_tests_everything=Boston_based_staff_tests_everything_sold unk_ski_monster_retailer_info=Unknown
% @importance 0.3

0.65::acc(s43, ski_monster_retailer_info).
0.55::true_val(ski_monster_retailer_info, boston_tests_everything); 0.45::true_val(ski_monster_retailer_info, unk_ski_monster_retailer_info).
measured(s43, ski_monster_retailer_info, boston_tests_everything).
all_consistent(ski_monster_retailer_info) :-
    consistent(s43, ski_monster_retailer_info).
evidence(all_consistent(ski_monster_retailer_info)).
query(true_val(ski_monster_retailer_info, boston_tests_everything)).
query(true_val(ski_monster_retailer_info, unk_ski_monster_retailer_info)).

% @attr darkside_retailer_info
% @type categorical
% @canonical false
% @original_name Darkside Snowboards retailer info
% @values us_14day_return=US_based_14day_return_intl_paypal_only unk_darkside_retailer_info=Unknown
% @importance 0.4

0.65::acc(s44, darkside_retailer_info).
0.58::true_val(darkside_retailer_info, us_14day_return); 0.42::true_val(darkside_retailer_info, unk_darkside_retailer_info).
measured(s44, darkside_retailer_info, us_14day_return).
all_consistent(darkside_retailer_info) :-
    consistent(s44, darkside_retailer_info).
evidence(all_consistent(darkside_retailer_info)).
query(true_val(darkside_retailer_info, us_14day_return)).
query(true_val(darkside_retailer_info, unk_darkside_retailer_info)).