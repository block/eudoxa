0.15::indep(s2).
0.20::indep(s5).
0.25::indep(s6).
0.20::indep(s9).
0.20::indep(s11).
0.25::indep(s12).
0.25::indep(s13).
0.15::indep(s15).
0.15::indep(s18).
0.20::indep(s21).
0.20::indep(s23).
0.70::indep(s32).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 0.95

0.95::acc(s1, brand).
0.73::acc(s2, brand).

0.97::true_val(brand, lib_tech); 0.03::true_val(brand, unk_brand).

measured(s1, brand, lib_tech).
measured(s2, brand, lib_tech).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.80

0.90::acc(s2, manufacturer).
0.93::acc(s3, manufacturer).

0.95::true_val(manufacturer, mervin_manufacturing); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s2, manufacturer, mervin_manufacturing).
measured(s3, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :-
    (indep(s2), consistent(s2, manufacturer) ; \+indep(s2)),
    consistent(s3, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values skunk_ape=Skunk_Ape unk_model_name=Unknown
% @importance 0.95

0.95::acc(s1, model_name).
0.73::acc(s2, model_name).

0.97::true_val(model_name, skunk_ape); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, skunk_ape).
measured(s2, model_name, skunk_ape).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, skunk_ape)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025=2025 unk_model_year=Unknown
% @importance 0.90

0.75::acc(s2, model_year).

0.68::true_val(model_year, y2025); 0.32::true_val(model_year, unk_model_year).

measured(s2, model_year, y2025).

all_consistent(model_year) :-
    consistent(s2, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2025)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values skunk_ape_experimental=Skunk_Ape_experiMENTAL_Division unk_model_series=Unknown
% @importance 1.0

0.93::acc(s1, model_series).

0.92::true_val(model_series, skunk_ape_experimental); 0.08::true_val(model_series, unk_model_series).

measured(s1, model_series, skunk_ape_experimental).

all_consistent(model_series) :- consistent(s1, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, skunk_ape_experimental)).
query(true_val(model_series, unk_model_series)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 0.925

0.95::acc(s1, board_category).
0.83::acc(s4, board_category).

0.95::true_val(board_category, all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain).
measured(s4, board_category, all_mountain).

all_consistent(board_category) :-
    consistent(s1, board_category),
    consistent(s4, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr board_subtype
% @type categorical
% @canonical false
% @original_name Board subtype
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_subtype=Unknown
% @importance 0.90

0.73::acc(s2, board_subtype).

0.68::true_val(board_subtype, all_mountain_freeride); 0.32::true_val(board_subtype, unk_board_subtype).

measured(s2, board_subtype, all_mountain_freeride).

all_consistent(board_subtype) :-
    consistent(s2, board_subtype).

evidence(all_consistent(board_subtype)).
query(true_val(board_subtype, all_mountain_freeride)).
query(true_val(board_subtype, unk_board_subtype)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.60

0.78::acc(s5, gender).

0.68::true_val(gender, mens); 0.32::true_val(gender, unk_gender).

measured(s5, gender, mens).

all_consistent(gender) :-
    (indep(s5), consistent(s5, gender) ; \+indep(s5)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values quincy_quigg=Quincy_Quigg unk_graphic_designer_artist=Unknown
% @importance 1.0

0.93::acc(s1, graphic_designer_artist).

0.92::true_val(graphic_designer_artist, quincy_quigg); 0.08::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s1, graphic_designer_artist, quincy_quigg).

all_consistent(graphic_designer_artist) :- consistent(s1, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, quincy_quigg)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced unk_rider_level=Unknown
% @importance 0.875

0.75::acc(s2, rider_level).
0.83::acc(s4, rider_level).

0.93::true_val(rider_level, intermediate_advanced); 0.07::true_val(rider_level, unk_rider_level).

measured(s2, rider_level, intermediate_advanced).
measured(s4, rider_level, intermediate_advanced).

all_consistent(rider_level) :-
    (indep(s2), consistent(s2, rider_level) ; \+indep(s2)),
    consistent(s4, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values big_riders_big_boots=Bigger_riders_big_boots_large_feet unk_skill_level_recommendation=Unknown
% @importance 0.825

0.73::acc(s2, skill_level_recommendation).
0.80::acc(s6, skill_level_recommendation).

0.90::true_val(skill_level_recommendation, big_riders_big_boots); 0.10::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s2, skill_level_recommendation, big_riders_big_boots).
measured(s6, skill_level_recommendation, big_riders_big_boots).

all_consistent(skill_level_recommendation) :-
    (indep(s2), consistent(s2, skill_level_recommendation) ; \+indep(s2)),
    (indep(s6), consistent(s6, skill_level_recommendation) ; \+indep(s6)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, big_riders_big_boots)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values am_freeride_powder=All_Mountain_Freeride_Powder unk_terrain_suitability=Unknown
% @importance 0.90

0.75::acc(s2, terrain_suitability).

0.68::true_val(terrain_suitability, am_freeride_powder); 0.32::true_val(terrain_suitability, unk_terrain_suitability).

measured(s2, terrain_suitability, am_freeride_powder).

all_consistent(terrain_suitability) :-
    consistent(s2, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, am_freeride_powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_resort
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values resort_sidecountry_powder=Resort_sidecountry_powder unk_terrain_suitability_resort=Unknown
% @importance 0.90

0.85::acc(s7, terrain_suitability_resort).

0.78::true_val(terrain_suitability_resort, resort_sidecountry_powder); 0.22::true_val(terrain_suitability_resort, unk_terrain_suitability_resort).

measured(s7, terrain_suitability_resort, resort_sidecountry_powder).

all_consistent(terrain_suitability_resort) :- consistent(s7, terrain_suitability_resort).

evidence(all_consistent(terrain_suitability_resort)).
query(true_val(terrain_suitability_resort, resort_sidecountry_powder)).
query(true_val(terrain_suitability_resort, unk_terrain_suitability_resort)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values am_power_freestyle=All_Mountain_power_freestyle unk_riding_style=Unknown
% @importance 1.0

0.93::acc(s1, riding_style).

0.92::true_val(riding_style, am_power_freestyle); 0.08::true_val(riding_style, unk_riding_style).

measured(s1, riding_style, am_power_freestyle).

all_consistent(riding_style) :- consistent(s1, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, am_power_freestyle)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_detail
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values am_resort_sidecountry_powder_not_park=All_mountain_excellent_resort_sidecountry_powder_less_ideal_park unk_terrain_suitability_detail=Unknown
% @importance 0.70

0.55::acc(s8, terrain_suitability_detail).

0.49::true_val(terrain_suitability_detail, am_resort_sidecountry_powder_not_park); 0.51::true_val(terrain_suitability_detail, unk_terrain_suitability_detail).

measured(s8, terrain_suitability_detail, am_resort_sidecountry_powder_not_park).

all_consistent(terrain_suitability_detail) :- consistent(s8, terrain_suitability_detail).

evidence(all_consistent(terrain_suitability_detail)).
query(true_val(terrain_suitability_detail, am_resort_sidecountry_powder_not_park)).
query(true_val(terrain_suitability_detail, unk_terrain_suitability_detail)).

% @attr terrain_suitability_quiver
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values quiver_killer_am_large_feet=Quiver_killer_all_mountain_large_footed_riders unk_terrain_suitability_quiver=Unknown
% @importance 0.70

0.73::acc(s9, terrain_suitability_quiver).

0.64::true_val(terrain_suitability_quiver, quiver_killer_am_large_feet); 0.36::true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver).

measured(s9, terrain_suitability_quiver, quiver_killer_am_large_feet).

all_consistent(terrain_suitability_quiver) :-
    (indep(s9), consistent(s9, terrain_suitability_quiver) ; \+indep(s9)).

evidence(all_consistent(terrain_suitability_quiver)).
query(true_val(terrain_suitability_quiver, quiver_killer_am_large_feet)).
query(true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver)).

% @attr recommended_boot_size
% @type categorical
% @canonical false
% @original_name Recommended boot size
% @values gt12_us=Greater_than_12_US unk_recommended_boot_size=Unknown
% @importance 0.95

0.85::acc(s10, recommended_boot_size).

0.79::true_val(recommended_boot_size, gt12_us); 0.21::true_val(recommended_boot_size, unk_recommended_boot_size).

measured(s10, recommended_boot_size, gt12_us).

all_consistent(recommended_boot_size) :- consistent(s10, recommended_boot_size).

evidence(all_consistent(recommended_boot_size)).
query(true_val(recommended_boot_size, gt12_us)).
query(true_val(recommended_boot_size, unk_recommended_boot_size)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.95

0.95::acc(s1, shape).
0.73::acc(s2, shape).

0.97::true_val(shape, directional_twin); 0.03::true_val(shape, unk_shape).

measured(s1, shape, directional_twin).
measured(s2, shape, directional_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s2), consistent(s2, shape) ; \+indep(s2)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values twin_slightly_directional=Rides_like_twin_slightly_directional unk_shape_description=Unknown
% @importance 0.90

0.73::acc(s2, shape_description).

0.68::true_val(shape_description, twin_slightly_directional); 0.32::true_val(shape_description, unk_shape_description).

measured(s2, shape_description, twin_slightly_directional).

all_consistent(shape_description) :- consistent(s2, shape_description).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, twin_slightly_directional)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values hybrid_c2x_directional=Hybrid_C2x_Directional unk_camber_type=Unknown
% @importance 0.90

0.75::acc(s2, camber_type).

0.68::true_val(camber_type, hybrid_c2x_directional); 0.32::true_val(camber_type, unk_camber_type).

measured(s2, camber_type, hybrid_c2x_directional).

all_consistent(camber_type) :- consistent(s2, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, hybrid_c2x_directional)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values mild_rocker_between_camber_tip_tail=Mild_rocker_between_feet_camber_to_tip_and_tail unk_camber_description=Unknown
% @importance 0.90

0.75::acc(s2, camber_description).

0.68::true_val(camber_description, mild_rocker_between_camber_tip_tail); 0.32::true_val(camber_description, unk_camber_description).

measured(s2, camber_description, mild_rocker_between_camber_tip_tail).

all_consistent(camber_description) :- consistent(s2, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, mild_rocker_between_camber_tip_tail)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_blauer
% @type categorical
% @canonical false
% @original_name camber_description
% @values shorter_aggressive_banana_camber_underfoot=Shorter_aggressive_banana_rocker_cambers_underfoot unk_camber_description_blauer=Unknown
% @importance 0.80

0.73::acc(s11, camber_description_blauer).

0.64::true_val(camber_description_blauer, shorter_aggressive_banana_camber_underfoot); 0.36::true_val(camber_description_blauer, unk_camber_description_blauer).

measured(s11, camber_description_blauer, shorter_aggressive_banana_camber_underfoot).

all_consistent(camber_description_blauer) :-
    (indep(s11), consistent(s11, camber_description_blauer) ; \+indep(s11)).

evidence(all_consistent(camber_description_blauer)).
query(true_val(camber_description_blauer, shorter_aggressive_banana_camber_underfoot)).
query(true_val(camber_description_blauer, unk_camber_description_blauer)).

% @attr camber_description_evo
% @type categorical
% @canonical false
% @original_name camber_description
% @values full_contact_control_rocker_carve_camber_pop=Full_contact_control_rocker_carve_float_camber_pop_stability unk_camber_description_evo=Unknown
% @importance 0.80

0.80::acc(s12, camber_description_evo).

0.70::true_val(camber_description_evo, full_contact_control_rocker_carve_camber_pop); 0.30::true_val(camber_description_evo, unk_camber_description_evo).

measured(s12, camber_description_evo, full_contact_control_rocker_carve_camber_pop).

all_consistent(camber_description_evo) :-
    (indep(s12), consistent(s12, camber_description_evo) ; \+indep(s12)).

evidence(all_consistent(camber_description_evo)).
query(true_val(camber_description_evo, full_contact_control_rocker_carve_camber_pop)).
query(true_val(camber_description_evo, unk_camber_description_evo)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values floaty_atv_longer_relaxed=Floaty_ATV_nose_longer_relaxed_for_pow_float unk_nose_design=Unknown
% @importance 1.0

0.93::acc(s1, nose_design).

0.92::true_val(nose_design, floaty_atv_longer_relaxed); 0.08::true_val(nose_design, unk_nose_design).

measured(s1, nose_design, floaty_atv_longer_relaxed).

all_consistent(nose_design) :- consistent(s1, nose_design).

evidence(all_consistent(nose_design)).
query(true_val(nose_design, floaty_atv_longer_relaxed)).
query(true_val(nose_design, unk_nose_design)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit inches
% @values v1=1.0 vminus2_125=-2.125
% @importance 0.975

0.95::acc(s1, setback).
0.73::acc(s2, setback).
0.82::acc(s10, setback).

0.60::true_val(setback, v1); 0.40::true_val(setback, vminus2_125).

measured(s1, setback, v1).
measured(s2, setback, v1).
measured(s10, setback, vminus2_125).

all_consistent(setback) :-
    consistent(s1, setback),
    (indep(s2), consistent(s2, setback) ; \+indep(s2)),
    consistent(s10, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v1)).
query(true_val(setback, vminus2_125)).

% @attr taper
% @type numeric
% @canonical false
% @original_name taper
% @unit mm
% @values v2=2.0 unk_taper=Unknown
% @importance 0.95

0.85::acc(s10, taper).

0.79::true_val(taper, v2); 0.21::true_val(taper, unk_taper).

measured(s10, taper, v2).

all_consistent(taper) :- consistent(s10, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v2)).
query(true_val(taper, unk_taper)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v7=7.0 v6=6.0
% @importance 0.95

0.95::acc(s1, flex_rating_10).
0.70::acc(s2, flex_rating_10).

0.70::true_val(flex_rating_10, v7); 0.30::true_val(flex_rating_10, v6).

measured(s1, flex_rating_10, v7).
measured(s2, flex_rating_10, v6).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    consistent(s2, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, v6)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium=Medium unk_flex_feel=Unknown
% @importance 0.80

0.80::acc(s12, flex_feel).

0.70::true_val(flex_feel, medium); 0.30::true_val(flex_feel, unk_flex_feel).

measured(s12, flex_feel, medium).

all_consistent(flex_feel) :-
    (indep(s12), consistent(s12, flex_feel) ; \+indep(s12)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_feel_blauer
% @type categorical
% @canonical false
% @original_name flex_feel
% @values medium_stiff=Medium_Stiff unk_flex_feel_blauer=Unknown
% @importance 0.80

0.73::acc(s11, flex_feel_blauer).

0.64::true_val(flex_feel_blauer, medium_stiff); 0.36::true_val(flex_feel_blauer, unk_flex_feel_blauer).

measured(s11, flex_feel_blauer, medium_stiff).

all_consistent(flex_feel_blauer) :-
    (indep(s11), consistent(s11, flex_feel_blauer) ; \+indep(s11)).

evidence(all_consistent(flex_feel_blauer)).
query(true_val(flex_feel_blauer, medium_stiff)).
query(true_val(flex_feel_blauer, unk_flex_feel_blauer)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values stiff=Stiff_6_to_8 unk_flex_rating_10_evo=Unknown
% @importance 0.60

0.78::acc(s13, flex_rating_10_evo).

0.70::true_val(flex_rating_10_evo, stiff); 0.30::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s13, flex_rating_10_evo, stiff).

all_consistent(flex_rating_10_evo) :-
    (indep(s13), consistent(s13, flex_rating_10_evo) ; \+indep(s13)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel_whitelines
% @type categorical
% @canonical false
% @original_name flex_feel
% @values biax_triax_solid_consistent=Bi_Ax_Tri_Ax_solid_consistent_torsional unk_flex_feel_whitelines=Unknown
% @importance 0.90

0.85::acc(s7, flex_feel_whitelines).

0.78::true_val(flex_feel_whitelines, biax_triax_solid_consistent); 0.22::true_val(flex_feel_whitelines, unk_flex_feel_whitelines).

measured(s7, flex_feel_whitelines, biax_triax_solid_consistent).

all_consistent(flex_feel_whitelines) :- consistent(s7, flex_feel_whitelines).

evidence(all_consistent(flex_feel_whitelines)).
query(true_val(flex_feel_whitelines, biax_triax_solid_consistent)).
query(true_val(flex_feel_whitelines, unk_flex_feel_whitelines)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_stiffer_tail_softer_nose=Directional_stiffer_tail_softer_nose unk_flex_direction=Unknown
% @importance 0.70

0.73::acc(s9, flex_direction).

0.64::true_val(flex_direction, directional_stiffer_tail_softer_nose); 0.36::true_val(flex_direction, unk_flex_direction).

measured(s9, flex_direction, directional_stiffer_tail_softer_nose).

all_consistent(flex_direction) :-
    (indep(s9), consistent(s9, flex_direction) ; \+indep(s9)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_stiffer_tail_softer_nose)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr construction_name
% @type categorical
% @canonical false
% @original_name Construction name
% @values hp_horsepower=HP_Horsepower unk_construction_name=Unknown
% @importance 0.95

0.95::acc(s1, construction_name).
0.73::acc(s2, construction_name).

0.97::true_val(construction_name, hp_horsepower); 0.03::true_val(construction_name, unk_construction_name).

measured(s1, construction_name, hp_horsepower).
measured(s2, construction_name, hp_horsepower).

all_consistent(construction_name) :-
    consistent(s1, construction_name),
    (indep(s2), consistent(s2, construction_name) ; \+indep(s2)).

evidence(all_consistent(construction_name)).
query(true_val(construction_name, hp_horsepower)).
query(true_val(construction_name, unk_construction_name)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen60_paulownia40=60pct_Aspen_40pct_Paulownia unk_core_material=Unknown
% @importance 0.95

0.95::acc(s1, core_material).
0.73::acc(s2, core_material).

0.97::true_val(core_material, aspen60_paulownia40); 0.03::true_val(core_material, unk_core_material).

measured(s1, core_material, aspen60_paulownia40).
measured(s2, core_material, aspen60_paulownia40).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s2), consistent(s2, core_material) ; \+indep(s2)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen60_paulownia40)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_certified unk_sustainability_certification=Unknown
% @importance 0.725

0.85::acc(s7, sustainability_certification).
0.85::acc(s14, sustainability_certification).

0.95::true_val(sustainability_certification, fsc_certified); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s7, sustainability_certification, fsc_certified).
measured(s14, sustainability_certification, fsc_certified).

all_consistent(sustainability_certification) :-
    consistent(s7, sustainability_certification),
    consistent(s14, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr core_material_feel
% @type categorical
% @canonical false
% @original_name core_material
% @values aspen_light_lively_paulownia_stable_damp=Aspen_light_lively_paulownia_stability_dampening unk_core_material_feel=Unknown
% @importance 0.90

0.85::acc(s7, core_material_feel).

0.78::true_val(core_material_feel, aspen_light_lively_paulownia_stable_damp); 0.22::true_val(core_material_feel, unk_core_material_feel).

measured(s7, core_material_feel, aspen_light_lively_paulownia_stable_damp).

all_consistent(core_material_feel) :- consistent(s7, core_material_feel).

evidence(all_consistent(core_material_feel)).
query(true_val(core_material_feel, aspen_light_lively_paulownia_stable_damp)).
query(true_val(core_material_feel, unk_core_material_feel)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_biax_basalt=Triax_Biax_Basalt_alloy_glass unk_laminate=Unknown
% @importance 0.90

0.75::acc(s2, laminate).

0.68::true_val(laminate, triax_biax_basalt); 0.32::true_val(laminate, unk_laminate).

measured(s2, laminate, triax_biax_basalt).

all_consistent(laminate) :- consistent(s2, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_basalt)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_biax
% @type categorical
% @canonical false
% @original_name laminate
% @values biax_fiberglass_2way=Bi_axial_Fiberglass_2way_snap_chatter unk_laminate_biax=Unknown
% @importance 0.85

0.80::acc(s15, laminate_biax).

0.74::true_val(laminate_biax, biax_fiberglass_2way); 0.26::true_val(laminate_biax, unk_laminate_biax).

measured(s15, laminate_biax, biax_fiberglass_2way).

all_consistent(laminate_biax) :-
    (indep(s15), consistent(s15, laminate_biax) ; \+indep(s15)).

evidence(all_consistent(laminate_biax)).
query(true_val(laminate_biax, biax_fiberglass_2way)).
query(true_val(laminate_biax, unk_laminate_biax)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_knife_cut=Sintered_Knife_Cut unk_base_material=Unknown
% @importance 0.90

0.75::acc(s2, base_material).

0.68::true_val(base_material, sintered_knife_cut); 0.32::true_val(base_material, unk_base_material).

measured(s2, base_material, sintered_knife_cut).

all_consistent(base_material) :- consistent(s2, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_knife_cut)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values high_density_sintered_wax_retention=High_density_sintered_porous_wax_retention unk_base_type=Unknown
% @importance 0.70

0.73::acc(s9, base_type).

0.64::true_val(base_type, high_density_sintered_wax_retention); 0.36::true_val(base_type, unk_base_type).

measured(s9, base_type, high_density_sintered_wax_retention).

all_consistent(base_type) :-
    (indep(s9), consistent(s9, base_type) ; \+indep(s9)).

evidence(all_consistent(base_type)).
query(true_val(base_type, high_density_sintered_wax_retention)).
query(true_val(base_type, unk_base_type)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values solid_am_big_foot=Solid_all_mountain_ride_big_foot_riders unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.85::acc(s10, reviewer_opinion_the_good_ride).

0.79::true_val(reviewer_opinion_the_good_ride, solid_am_big_foot); 0.21::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s10, reviewer_opinion_the_good_ride, solid_am_big_foot).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s10, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, solid_am_big_foot)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_tgr_base
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values base_thirsty_frequent_waxing=Base_thirsty_requires_frequent_waxing unk_reviewer_opinion_tgr_base=Unknown
% @importance 0.95

0.85::acc(s10, reviewer_opinion_tgr_base).

0.79::true_val(reviewer_opinion_tgr_base, base_thirsty_frequent_waxing); 0.21::true_val(reviewer_opinion_tgr_base, unk_reviewer_opinion_tgr_base).

measured(s10, reviewer_opinion_tgr_base, base_thirsty_frequent_waxing).

all_consistent(reviewer_opinion_tgr_base) :- consistent(s10, reviewer_opinion_tgr_base).

evidence(all_consistent(reviewer_opinion_tgr_base)).
query(true_val(reviewer_opinion_tgr_base, base_thirsty_frequent_waxing)).
query(true_val(reviewer_opinion_tgr_base, unk_reviewer_opinion_tgr_base)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch_internal_uhmw_sintered=Birch_Internal_UHMW_Sintered unk_sidewall_material=Unknown
% @importance 0.90

0.75::acc(s2, sidewall_material).

0.68::true_val(sidewall_material, birch_internal_uhmw_sintered); 0.32::true_val(sidewall_material, unk_sidewall_material).

measured(s2, sidewall_material, birch_internal_uhmw_sintered).

all_consistent(sidewall_material) :- consistent(s2, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_internal_uhmw_sintered)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_detail
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values birch_pop_durability_uhmw_response=Birch_pop_durability_UHMW_response_control unk_sidewall_material_detail=Unknown
% @importance 0.85

0.80::acc(s15, sidewall_material_detail).

0.74::true_val(sidewall_material_detail, birch_pop_durability_uhmw_response); 0.26::true_val(sidewall_material_detail, unk_sidewall_material_detail).

measured(s15, sidewall_material_detail, birch_pop_durability_uhmw_response).

all_consistent(sidewall_material_detail) :-
    (indep(s15), consistent(s15, sidewall_material_detail) ; \+indep(s15)).

evidence(all_consistent(sidewall_material_detail)).
query(true_val(sidewall_material_detail, birch_pop_durability_uhmw_response)).
query(true_val(sidewall_material_detail, unk_sidewall_material_detail)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magnetraction=Magnetraction unk_edge_technology=Unknown
% @importance 0.90

0.75::acc(s2, edge_technology).

0.68::true_val(edge_technology, magnetraction); 0.32::true_val(edge_technology, unk_edge_technology).

measured(s2, edge_technology, magnetraction).

all_consistent(edge_technology) :- consistent(s2, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magnetraction)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_technology_serrations
% @type categorical
% @canonical false
% @original_name edge_technology
% @values seven_serrations=7_strategic_serrations_per_edge unk_edge_technology_serrations=Unknown
% @importance 0.90

0.75::acc(s2, edge_technology_serrations).

0.68::true_val(edge_technology_serrations, seven_serrations); 0.32::true_val(edge_technology_serrations, unk_edge_technology_serrations).

measured(s2, edge_technology_serrations, seven_serrations).

all_consistent(edge_technology_serrations) :- consistent(s2, edge_technology_serrations).

evidence(all_consistent(edge_technology_serrations)).
query(true_val(edge_technology_serrations, seven_serrations)).
query(true_val(edge_technology_serrations, unk_edge_technology_serrations)).

% @attr edge_technology_desc
% @type categorical
% @canonical false
% @original_name edge_technology
% @values bumps_contact_points_grip=Strategic_bumps_added_contact_points_increased_grip unk_edge_technology_desc=Unknown
% @importance 0.85

0.80::acc(s15, edge_technology_desc).

0.74::true_val(edge_technology_desc, bumps_contact_points_grip); 0.26::true_val(edge_technology_desc, unk_edge_technology_desc).

measured(s15, edge_technology_desc, bumps_contact_points_grip).

all_consistent(edge_technology_desc) :-
    (indep(s15), consistent(s15, edge_technology_desc) ; \+indep(s15)).

evidence(all_consistent(edge_technology_desc)).
query(true_val(edge_technology_desc, bumps_contact_points_grip)).
query(true_val(edge_technology_desc, unk_edge_technology_desc)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values uhmw_tip_tail_impact_deflection=UHMW_Tip_Tail_Impact_Deflection unk_construction_material_innovation=Unknown
% @importance 0.90

0.75::acc(s2, construction_material_innovation).

0.68::true_val(construction_material_innovation, uhmw_tip_tail_impact_deflection); 0.32::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s2, construction_material_innovation, uhmw_tip_tail_impact_deflection).

all_consistent(construction_material_innovation) :- consistent(s2, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, uhmw_tip_tail_impact_deflection)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_detail
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values uhmw_lightweight_impact_resist_swing=UHMW_lightweight_impact_resistance_reduced_swing_weight unk_construction_material_innovation_detail=Unknown
% @importance 0.90

0.85::acc(s7, construction_material_innovation_detail).

0.78::true_val(construction_material_innovation_detail, uhmw_lightweight_impact_resist_swing); 0.22::true_val(construction_material_innovation_detail, unk_construction_material_innovation_detail).

measured(s7, construction_material_innovation_detail, uhmw_lightweight_impact_resist_swing).

all_consistent(construction_material_innovation_detail) :- consistent(s7, construction_material_innovation_detail).

evidence(all_consistent(construction_material_innovation_detail)).
query(true_val(construction_material_innovation_detail, uhmw_lightweight_impact_resist_swing)).
query(true_val(construction_material_innovation_detail, unk_construction_material_innovation_detail)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Topsheet unk_topsheet=Unknown
% @importance 0.90

0.75::acc(s2, topsheet).

0.68::true_val(topsheet, eco_sublimated_poly); 0.32::true_val(topsheet, unk_topsheet).

measured(s2, topsheet, eco_sublimated_poly).

all_consistent(topsheet) :- consistent(s2, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_process
% @type categorical
% @canonical false
% @original_name topsheet
% @values eco_water_based_no_toxic_inks=Eco_friendly_water_based_no_toxic_inks unk_topsheet_process=Unknown
% @importance 0.90

0.85::acc(s7, topsheet_process).

0.78::true_val(topsheet_process, eco_water_based_no_toxic_inks); 0.22::true_val(topsheet_process, unk_topsheet_process).

measured(s7, topsheet_process, eco_water_based_no_toxic_inks).

all_consistent(topsheet_process) :- consistent(s7, topsheet_process).

evidence(all_consistent(topsheet_process)).
query(true_val(topsheet_process, eco_water_based_no_toxic_inks)).
query(true_val(topsheet_process, unk_topsheet_process)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.90

0.75::acc(s2, mounting_pattern).

0.68::true_val(mounting_pattern, inserts_2x4); 0.32::true_val(mounting_pattern, unk_mounting_pattern).

measured(s2, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s2, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values w157_w161_uw163_w165_w169_uw170_uw173=157W_161W_163UW_165W_169W_170UW_173UW unk_available_sizes=Unknown
% @importance 1.0

0.95::acc(s1, available_sizes).

0.92::true_val(available_sizes, w157_w161_uw163_w165_w169_uw170_uw173); 0.08::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, w157_w161_uw163_w165_w169_uw170_uw173).

all_consistent(available_sizes) :- consistent(s1, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, w157_w161_uw163_w165_w169_uw170_uw173)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values wide_ultra_wide=Wide_Ultra_Wide unk_width_options=Unknown
% @importance 0.90

0.75::acc(s2, width_options).

0.68::true_val(width_options, wide_ultra_wide); 0.32::true_val(width_options, unk_width_options).

measured(s2, width_options, wide_ultra_wide).

all_consistent(width_options) :- consistent(s2, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, wide_ultra_wide)).
query(true_val(width_options, unk_width_options)).

% @attr waist_width_157w
% @type numeric
% @canonical false
% @original_name Minimum waist width (157W)
% @unit cm
% @values v26_8=26.8 unk_waist_width_157w=Unknown
% @importance 0.95

0.95::acc(s1, waist_width_157w).
0.73::acc(s2, waist_width_157w).

0.97::true_val(waist_width_157w, v26_8); 0.03::true_val(waist_width_157w, unk_waist_width_157w).

measured(s1, waist_width_157w, v26_8).
measured(s2, waist_width_157w, v26_8).

all_consistent(waist_width_157w) :-
    consistent(s1, waist_width_157w),
    (indep(s2), consistent(s2, waist_width_157w) ; \+indep(s2)).

evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_8)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

% @attr waist_width_161w
% @type numeric
% @canonical false
% @original_name Waist width 161W
% @unit cm
% @values v26_8=26.8 unk_waist_width_161w=Unknown
% @importance 1.0

0.95::acc(s1, waist_width_161w).

0.92::true_val(waist_width_161w, v26_8); 0.08::true_val(waist_width_161w, unk_waist_width_161w).

measured(s1, waist_width_161w, v26_8).

all_consistent(waist_width_161w) :- consistent(s1, waist_width_161w).

evidence(all_consistent(waist_width_161w)).
query(true_val(waist_width_161w, v26_8)).
query(true_val(waist_width_161w, unk_waist_width_161w)).

% @attr waist_width_163uw
% @type numeric
% @canonical false
% @original_name Waist width 163UW
% @unit cm
% @values v28_0=28.0 unk_waist_width_163uw=Unknown
% @importance 1.0

0.95::acc(s1, waist_width_163uw).

0.92::true_val(waist_width_163uw, v28_0); 0.08::true_val(waist_width_163uw, unk_waist_width_163uw).

measured(s1, waist_width_163uw, v28_0).

all_consistent(waist_width_163uw) :- consistent(s1, waist_width_163uw).

evidence(all_consistent(waist_width_163uw)).
query(true_val(waist_width_163uw, v28_0)).
query(true_val(waist_width_163uw, unk_waist_width_163uw)).

% @attr waist_width_165
% @type numeric
% @canonical true
% @original_name waist_width_165
% @unit cm
% @values v26_8=26.8 unk_waist_width_165=Unknown
% @importance 1.0

0.95::acc(s1, waist_width_165).

0.92::true_val(waist_width_165, v26_8); 0.08::true_val(waist_width_165, unk_waist_width_165).

measured(s1, waist_width_165, v26_8).

all_consistent(waist_width_165) :- consistent(s1, waist_width_165).

evidence(all_consistent(waist_width_165)).
query(true_val(waist_width_165, v26_8)).
query(true_val(waist_width_165, unk_waist_width_165)).

% @attr waist_width_169w
% @type numeric
% @canonical false
% @original_name Waist width 169W
% @unit cm
% @values v26_8=26.8 unk_waist_width_169w=Unknown
% @importance 1.0

0.95::acc(s1, waist_width_169w).

0.92::true_val(waist_width_169w, v26_8); 0.08::true_val(waist_width_169w, unk_waist_width_169w).

measured(s1, waist_width_169w, v26_8).

all_consistent(waist_width_169w) :- consistent(s1, waist_width_169w).

evidence(all_consistent(waist_width_169w)).
query(true_val(waist_width_169w, v26_8)).
query(true_val(waist_width_169w, unk_waist_width_169w)).

% @attr waist_width_170uw
% @type numeric
% @canonical false
% @original_name Waist width 170UW
% @unit cm
% @values v28_5=28.5 unk_waist_width_170uw=Unknown
% @importance 1.0

0.95::acc(s1, waist_width_170uw).

0.92::true_val(waist_width_170uw, v28_5); 0.08::true_val(waist_width_170uw, unk_waist_width_170uw).

measured(s1, waist_width_170uw, v28_5).

all_consistent(waist_width_170uw) :- consistent(s1, waist_width_170uw).

evidence(all_consistent(waist_width_170uw)).
query(true_val(waist_width_170uw, v28_5)).
query(true_val(waist_width_170uw, unk_waist_width_170uw)).

% @attr waist_width_173uw
% @type numeric
% @canonical false
% @original_name Waist width 173UW
% @unit cm
% @values v28_5=28.5 unk_waist_width_173uw=Unknown
% @importance 1.0

0.95::acc(s1, waist_width_173uw).

0.92::true_val(waist_width_173uw, v28_5); 0.08::true_val(waist_width_173uw, unk_waist_width_173uw).

measured(s1, waist_width_173uw, v28_5).

all_consistent(waist_width_173uw) :- consistent(s1, waist_width_173uw).

evidence(all_consistent(waist_width_173uw)).
query(true_val(waist_width_173uw, v28_5)).
query(true_val(waist_width_173uw, unk_waist_width_173uw)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit cm
% @values v115_0=115.0 unk_contact_length_size=Unknown
% @importance 1.0

0.95::acc(s1, contact_length_size).

0.92::true_val(contact_length_size, v115_0); 0.08::true_val(contact_length_size, unk_contact_length_size).

measured(s1, contact_length_size, v115_0).

all_consistent(contact_length_size) :- consistent(s1, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v115_0)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr contact_length_size_161
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v118_0=118.0 unk_contact_length_size_161=Unknown
% @importance 1.0

0.95::acc(s1, contact_length_size_161).

0.92::true_val(contact_length_size_161, v118_0); 0.08::true_val(contact_length_size_161, unk_contact_length_size_161).

measured(s1, contact_length_size_161, v118_0).

all_consistent(contact_length_size_161) :- consistent(s1, contact_length_size_161).

evidence(all_consistent(contact_length_size_161)).
query(true_val(contact_length_size_161, v118_0)).
query(true_val(contact_length_size_161, unk_contact_length_size_161)).

% @attr contact_length_size_163
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v121_0=121.0 unk_contact_length_size_163=Unknown
% @importance 1.0

0.95::acc(s1, contact_length_size_163).

0.92::true_val(contact_length_size_163, v121_0); 0.08::true_val(contact_length_size_163, unk_contact_length_size_163).

measured(s1, contact_length_size_163, v121_0).

all_consistent(contact_length_size_163) :- consistent(s1, contact_length_size_163).

evidence(all_consistent(contact_length_size_163)).
query(true_val(contact_length_size_163, v121_0)).
query(true_val(contact_length_size_163, unk_contact_length_size_163)).

% @attr contact_length_size_165
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v124_0=124.0 unk_contact_length_size_165=Unknown
% @importance 1.0

0.95::acc(s1, contact_length_size_165).

0.92::true_val(contact_length_size_165, v124_0); 0.08::true_val(contact_length_size_165, unk_contact_length_size_165).

measured(s1, contact_length_size_165, v124_0).

all_consistent(contact_length_size_165) :- consistent(s1, contact_length_size_165).

evidence(all_consistent(contact_length_size_165)).
query(true_val(contact_length_size_165, v124_0)).
query(true_val(contact_length_size_165, unk_contact_length_size_165)).

% @attr contact_length_size_169
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v120_0=120.0 unk_contact_length_size_169=Unknown
% @importance 1.0

0.95::acc(s1, contact_length_size_169).

0.92::true_val(contact_length_size_169, v120_0); 0.08::true_val(contact_length_size_169, unk_contact_length_size_169).

measured(s1, contact_length_size_169, v120_0).

all_consistent(contact_length_size_169) :- consistent(s1, contact_length_size_169).

evidence(all_consistent(contact_length_size_169)).
query(true_val(contact_length_size_169, v120_0)).
query(true_val(contact_length_size_169, unk_contact_length_size_169)).

% @attr contact_length_size_170
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v124_0=124.0 unk_contact_length_size_170=Unknown
% @importance 1.0

0.95::acc(s1, contact_length_size_170).

0.92::true_val(contact_length_size_170, v124_0); 0.08::true_val(contact_length_size_170, unk_contact_length_size_170).

measured(s1, contact_length_size_170, v124_0).

all_consistent(contact_length_size_170) :- consistent(s1, contact_length_size_170).

evidence(all_consistent(contact_length_size_170)).
query(true_val(contact_length_size_170, v124_0)).
query(true_val(contact_length_size_170, unk_contact_length_size_170)).

% @attr contact_length_size_173
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v127_0=127.0 unk_contact_length_size_173=Unknown
% @importance 1.0

0.95::acc(s1, contact_length_size_173).

0.92::true_val(contact_length_size_173, v127_0); 0.08::true_val(contact_length_size_173, unk_contact_length_size_173).

measured(s1, contact_length_size_173, v127_0).

all_consistent(contact_length_size_173) :- consistent(s1, contact_length_size_173).

evidence(all_consistent(contact_length_size_173)).
query(true_val(contact_length_size_173, v127_0)).
query(true_val(contact_length_size_173, unk_contact_length_size_173)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v8_5=8.5 unk_sidecut_radius_size=Unknown
% @importance 0.95

0.95::acc(s1, sidecut_radius_size).
0.73::acc(s2, sidecut_radius_size).

0.97::true_val(sidecut_radius_size, v8_5); 0.03::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v8_5).
measured(s2, sidecut_radius_size, v8_5).

all_consistent(sidecut_radius_size) :-
    consistent(s1, sidecut_radius_size),
    (indep(s2), consistent(s2, sidecut_radius_size) ; \+indep(s2)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_5)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_161
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_5=8.5 unk_sidecut_radius_size_161=Unknown
% @importance 1.0

0.95::acc(s1, sidecut_radius_size_161).

0.92::true_val(sidecut_radius_size_161, v8_5); 0.08::true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161).

measured(s1, sidecut_radius_size_161, v8_5).

all_consistent(sidecut_radius_size_161) :- consistent(s1, sidecut_radius_size_161).

evidence(all_consistent(sidecut_radius_size_161)).
query(true_val(sidecut_radius_size_161, v8_5)).
query(true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161)).

% @attr sidecut_radius_size_163
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_5=8.5 unk_sidecut_radius_size_163=Unknown
% @importance 1.0

0.95::acc(s1, sidecut_radius_size_163).

0.92::true_val(sidecut_radius_size_163, v8_5); 0.08::true_val(sidecut_radius_size_163, unk_sidecut_radius_size_163).

measured(s1, sidecut_radius_size_163, v8_5).

all_consistent(sidecut_radius_size_163) :- consistent(s1, sidecut_radius_size_163).

evidence(all_consistent(sidecut_radius_size_163)).
query(true_val(sidecut_radius_size_163, v8_5)).
query(true_val(sidecut_radius_size_163, unk_sidecut_radius_size_163)).

% @attr sidecut_radius_165
% @type numeric
% @canonical true
% @original_name sidecut_radius_165
% @unit m
% @values v8_6=8.6 unk_sidecut_radius_165=Unknown
% @importance 1.0

0.95::acc(s1, sidecut_radius_165).

0.92::true_val(sidecut_radius_165, v8_6); 0.08::true_val(sidecut_radius_165, unk_sidecut_radius_165).

measured(s1, sidecut_radius_165, v8_6).

all_consistent(sidecut_radius_165) :- consistent(s1, sidecut_radius_165).

evidence(all_consistent(sidecut_radius_165)).
query(true_val(sidecut_radius_165, v8_6)).
query(true_val(sidecut_radius_165, unk_sidecut_radius_165)).

% @attr sidecut_radius_size_169
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_6=8.6 unk_sidecut_radius_size_169=Unknown
% @importance 1.0

0.95::acc(s1, sidecut_radius_size_169).

0.92::true_val(sidecut_radius_size_169, v8_6); 0.08::true_val(sidecut_radius_size_169, unk_sidecut_radius_size_169).

measured(s1, sidecut_radius_size_169, v8_6).

all_consistent(sidecut_radius_size_169) :- consistent(s1, sidecut_radius_size_169).

evidence(all_consistent(sidecut_radius_size_169)).
query(true_val(sidecut_radius_size_169, v8_6)).
query(true_val(sidecut_radius_size_169, unk_sidecut_radius_size_169)).

% @attr sidecut_radius_size_170
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_75=8.75 unk_sidecut_radius_size_170=Unknown
% @importance 1.0

0.95::acc(s1, sidecut_radius_size_170).

0.92::true_val(sidecut_radius_size_170, v8_75); 0.08::true_val(sidecut_radius_size_170, unk_sidecut_radius_size_170).

measured(s1, sidecut_radius_size_170, v8_75).

all_consistent(sidecut_radius_size_170) :- consistent(s1, sidecut_radius_size_170).

evidence(all_consistent(sidecut_radius_size_170)).
query(true_val(sidecut_radius_size_170, v8_75)).
query(true_val(sidecut_radius_size_170, unk_sidecut_radius_size_170)).

% @attr sidecut_radius_size_173
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_75=8.75 unk_sidecut_radius_size_173=Unknown
% @importance 1.0

0.95::acc(s1, sidecut_radius_size_173).

0.92::true_val(sidecut_radius_size_173, v8_75); 0.08::true_val(sidecut_radius_size_173, unk_sidecut_radius_size_173).

measured(s1, sidecut_radius_size_173, v8_75).

all_consistent(sidecut_radius_size_173) :- consistent(s1, sidecut_radius_size_173).

evidence(all_consistent(sidecut_radius_size_173)).
query(true_val(sidecut_radius_size_173, v8_75)).
query(true_val(sidecut_radius_size_173, unk_sidecut_radius_size_173)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v30_5_30_3=30.5/30.3 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.95::acc(s1, tip_tail_width_size).

0.92::true_val(tip_tail_width_size, v30_5_30_3); 0.08::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v30_5_30_3).

all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_5_30_3)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_161
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v30_8_30_5=30.8/30.5 unk_tip_tail_width_size_161=Unknown
% @importance 1.0

0.95::acc(s1, tip_tail_width_size_161).

0.92::true_val(tip_tail_width_size_161, v30_8_30_5); 0.08::true_val(tip_tail_width_size_161, unk_tip_tail_width_size_161).

measured(s1, tip_tail_width_size_161, v30_8_30_5).

all_consistent(tip_tail_width_size_161) :- consistent(s1, tip_tail_width_size_161).

evidence(all_consistent(tip_tail_width_size_161)).
query(true_val(tip_tail_width_size_161, v30_8_30_5)).
query(true_val(tip_tail_width_size_161, unk_tip_tail_width_size_161)).

% @attr nose_tail_width_165
% @type categorical
% @canonical true
% @original_name nose_tail_width_165
% @unit cm
% @values v31_2_31_0=31.2/31.0 unk_nose_tail_width_165=Unknown
% @importance 1.0

0.95::acc(s1, nose_tail_width_165).

0.92::true_val(nose_tail_width_165, v31_2_31_0); 0.08::true_val(nose_tail_width_165, unk_nose_tail_width_165).

measured(s1, nose_tail_width_165, v31_2_31_0).

all_consistent(nose_tail_width_165) :- consistent(s1, nose_tail_width_165).

evidence(all_consistent(nose_tail_width_165)).
query(true_val(nose_tail_width_165, v31_2_31_0)).
query(true_val(nose_tail_width_165, unk_nose_tail_width_165)).

% @attr tip_tail_width_size_163
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v31_4_31_2=31.4/31.2 unk_tip_tail_width_size_163=Unknown
% @importance 1.0

0.95::acc(s1, tip_tail_width_size_163).

0.92::true_val(tip_tail_width_size_163, v31_4_31_2); 0.08::true_val(tip_tail_width_size_163, unk_tip_tail_width_size_163).

measured(s1, tip_tail_width_size_163, v31_4_31_2).

all_consistent(tip_tail_width_size_163) :- consistent(s1, tip_tail_width_size_163).

evidence(all_consistent(tip_tail_width_size_163)).
query(true_val(tip_tail_width_size_163, v31_4_31_2)).
query(true_val(tip_tail_width_size_163, unk_tip_tail_width_size_163)).

% @attr tip_tail_width_size_169
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v32_5_32_2=32.5/32.2 unk_tip_tail_width_size_169=Unknown
% @importance 1.0

0.95::acc(s1, tip_tail_width_size_169).

0.92::true_val(tip_tail_width_size_169, v32_5_32_2); 0.08::true_val(tip_tail_width_size_169, unk_tip_tail_width_size_169).

measured(s1, tip_tail_width_size_169, v32_5_32_2).

all_consistent(tip_tail_width_size_169) :- consistent(s1, tip_tail_width_size_169).

evidence(all_consistent(tip_tail_width_size_169)).
query(true_val(tip_tail_width_size_169, v32_5_32_2)).
query(true_val(tip_tail_width_size_169, unk_tip_tail_width_size_169)).

% @attr tip_tail_width_size_170
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v32_9_32_6=32.9/32.6 unk_tip_tail_width_size_170=Unknown
% @importance 0.95

0.95::acc(s1, tip_tail_width_size_170).
0.73::acc(s2, tip_tail_width_size_170).

0.97::true_val(tip_tail_width_size_170, v32_9_32_6); 0.03::true_val(tip_tail_width_size_170, unk_tip_tail_width_size_170).

measured(s1, tip_tail_width_size_170, v32_9_32_6).
measured(s2, tip_tail_width_size_170, v32_9_32_6).

all_consistent(tip_tail_width_size_170) :-
    consistent(s1, tip_tail_width_size_170),
    (indep(s2), consistent(s2, tip_tail_width_size_170) ; \+indep(s2)).

evidence(all_consistent(tip_tail_width_size_170)).
query(true_val(tip_tail_width_size_170, v32_9_32_6)).
query(true_val(tip_tail_width_size_170, unk_tip_tail_width_size_170)).

% @attr tip_tail_width_size_173
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v33_2_33_0=33.2/33.0 v32_2_33_0=32.2/33.0
% @importance 0.95

0.95::acc(s1, tip_tail_width_size_173).
0.70::acc(s2, tip_tail_width_size_173).

0.65::true_val(tip_tail_width_size_173, v33_2_33_0); 0.35::true_val(tip_tail_width_size_173, v32_2_33_0).

measured(s1, tip_tail_width_size_173, v33_2_33_0).
measured(s2, tip_tail_width_size_173, v32_2_33_0).

all_consistent(tip_tail_width_size_173) :-
    consistent(s1, tip_tail_width_size_173),
    consistent(s2, tip_tail_width_size_173).

evidence(all_consistent(tip_tail_width_size_173)).
query(true_val(tip_tail_width_size_173, v33_2_33_0)).
query(true_val(tip_tail_width_size_173, v32_2_33_0)).

% @attr surface_area_157w
% @type numeric
% @canonical false
% @original_name Surface area 157W
% @unit sqcm
% @values v662=662.0 unk_surface_area_157w=Unknown
% @importance 1.0

0.95::acc(s1, surface_area_157w).

0.92::true_val(surface_area_157w, v662); 0.08::true_val(surface_area_157w, unk_surface_area_157w).

measured(s1, surface_area_157w, v662).

all_consistent(surface_area_157w) :- consistent(s1, surface_area_157w).

evidence(all_consistent(surface_area_157w)).
query(true_val(surface_area_157w, v662)).
query(true_val(surface_area_157w, unk_surface_area_157w)).

% @attr surface_area_170uw
% @type numeric
% @canonical false
% @original_name Surface area 170UW
% @unit sqcm
% @values v766=766.0 unk_surface_area_170uw=Unknown
% @importance 1.0

0.95::acc(s1, surface_area_170uw).

0.92::true_val(surface_area_170uw, v766); 0.08::true_val(surface_area_170uw, unk_surface_area_170uw).

measured(s1, surface_area_170uw, v766).

all_consistent(surface_area_170uw) :- consistent(s1, surface_area_170uw).

evidence(all_consistent(surface_area_170uw)).
query(true_val(surface_area_170uw, v766)).
query(true_val(surface_area_170uw, unk_surface_area_170uw)).

% @attr surface_area_173uw
% @type numeric
% @canonical false
% @original_name Surface area 173UW
% @unit sqcm
% @values v784=784.0 unk_surface_area_173uw=Unknown
% @importance 1.0

0.95::acc(s1, surface_area_173uw).

0.92::true_val(surface_area_173uw, v784); 0.08::true_val(surface_area_173uw, unk_surface_area_173uw).

measured(s1, surface_area_173uw, v784).

all_consistent(surface_area_173uw) :- consistent(s1, surface_area_173uw).

evidence(all_consistent(surface_area_173uw)).
query(true_val(surface_area_173uw, v784)).
query(true_val(surface_area_173uw, unk_surface_area_173uw)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @unit inches
% @values v21_26=21.0-26.0_inches unk_stance_width_range_size=Unknown
% @importance 0.95

0.95::acc(s1, stance_width_range_size).
0.73::acc(s2, stance_width_range_size).

0.97::true_val(stance_width_range_size, v21_26); 0.03::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, v21_26).
measured(s2, stance_width_range_size, v21_26).

all_consistent(stance_width_range_size) :-
    consistent(s1, stance_width_range_size),
    (indep(s2), consistent(s2, stance_width_range_size) ; \+indep(s2)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v21_26)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values v140_65=140+lbs_65+kg v70kg=70+kg
% @importance 0.95

0.95::acc(s1, recommended_weight_range_size).
0.70::acc(s2, recommended_weight_range_size).

0.65::true_val(recommended_weight_range_size, v140_65); 0.35::true_val(recommended_weight_range_size, v70kg).

measured(s1, recommended_weight_range_size, v140_65).
measured(s2, recommended_weight_range_size, v70kg).

all_consistent(recommended_weight_range_size) :-
    consistent(s1, recommended_weight_range_size),
    consistent(s2, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v140_65)).
query(true_val(recommended_weight_range_size, v70kg)).

% @attr recommended_weight_range_size_161
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values v145_70=145+lbs_70+kg unk_recommended_weight_range_size_161=Unknown
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_161).

0.92::true_val(recommended_weight_range_size_161, v145_70); 0.08::true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161).

measured(s1, recommended_weight_range_size_161, v145_70).

all_consistent(recommended_weight_range_size_161) :- consistent(s1, recommended_weight_range_size_161).

evidence(all_consistent(recommended_weight_range_size_161)).
query(true_val(recommended_weight_range_size_161, v145_70)).
query(true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161)).

% @attr recommended_weight_165
% @type categorical
% @canonical true
% @original_name recommended_weight_165
% @values v145_70=145+lbs_70+kg unk_recommended_weight_165=Unknown
% @importance 0.95

0.95::acc(s1, recommended_weight_165).
0.73::acc(s2, recommended_weight_165).

0.97::true_val(recommended_weight_165, v145_70); 0.03::true_val(recommended_weight_165, unk_recommended_weight_165).

measured(s1, recommended_weight_165, v145_70).
measured(s2, recommended_weight_165, v145_70).

all_consistent(recommended_weight_165) :-
    consistent(s1, recommended_weight_165),
    (indep(s2), consistent(s2, recommended_weight_165) ; \+indep(s2)).

evidence(all_consistent(recommended_weight_165)).
query(true_val(recommended_weight_165, v145_70)).
query(true_val(recommended_weight_165, unk_recommended_weight_165)).

% @attr recommended_weight_range_size_163
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values v150_70=150+lbs_70+kg unk_recommended_weight_range_size_163=Unknown
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_163).

0.92::true_val(recommended_weight_range_size_163, v150_70); 0.08::true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163).

measured(s1, recommended_weight_range_size_163, v150_70).

all_consistent(recommended_weight_range_size_163) :- consistent(s1, recommended_weight_range_size_163).

evidence(all_consistent(recommended_weight_range_size_163)).
query(true_val(recommended_weight_range_size_163, v150_70)).
query(true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163)).

% @attr recommended_weight_range_size_169
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values v150_70=150+lbs_70+kg unk_recommended_weight_range_size_169=Unknown
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_169).

0.92::true_val(recommended_weight_range_size_169, v150_70); 0.08::true_val(recommended_weight_range_size_169, unk_recommended_weight_range_size_169).

measured(s1, recommended_weight_range_size_169, v150_70).

all_consistent(recommended_weight_range_size_169) :- consistent(s1, recommended_weight_range_size_169).

evidence(all_consistent(recommended_weight_range_size_169)).
query(true_val(recommended_weight_range_size_169, v150_70)).
query(true_val(recommended_weight_range_size_169, unk_recommended_weight_range_size_169)).

% @attr recommended_weight_range_size_170
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values v160_75=160+lbs_75+kg unk_recommended_weight_range_size_170=Unknown
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_170).

0.92::true_val(recommended_weight_range_size_170, v160_75); 0.08::true_val(recommended_weight_range_size_170, unk_recommended_weight_range_size_170).

measured(s1, recommended_weight_range_size_170, v160_75).

all_consistent(recommended_weight_range_size_170) :- consistent(s1, recommended_weight_range_size_170).

evidence(all_consistent(recommended_weight_range_size_170)).
query(true_val(recommended_weight_range_size_170, v160_75)).
query(true_val(recommended_weight_range_size_170, unk_recommended_weight_range_size_170)).

% @attr recommended_weight_range_size_173
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values v170_80=170+lbs_80+kg unk_recommended_weight_range_size_173=Unknown
% @importance 1.0

0.95::acc(s1, recommended_weight_range_size_173).

0.92::true_val(recommended_weight_range_size_173, v170_80); 0.08::true_val(recommended_weight_range_size_173, unk_recommended_weight_range_size_173).

measured(s1, recommended_weight_range_size_173, v170_80).

all_consistent(recommended_weight_range_size_173) :- consistent(s1, recommended_weight_range_size_173).

evidence(all_consistent(recommended_weight_range_size_173)).
query(true_val(recommended_weight_range_size_173, v170_80)).
query(true_val(recommended_weight_range_size_173, unk_recommended_weight_range_size_173)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values sequim_wa_usa=Sequim_Washington_USA unk_manufacturing_location_current=Unknown
% @importance 0.675

0.90::acc(s16, manufacturing_location_current).
0.90::acc(s17, manufacturing_location_current).
0.80::acc(s15, manufacturing_location_current).

0.97::true_val(manufacturing_location_current, sequim_wa_usa); 0.03::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s16, manufacturing_location_current, sequim_wa_usa).
measured(s17, manufacturing_location_current, sequim_wa_usa).
measured(s15, manufacturing_location_current, sequim_wa_usa).

all_consistent(manufacturing_location_current) :-
    consistent(s16, manufacturing_location_current),
    consistent(s17, manufacturing_location_current),
    (indep(s15), consistent(s15, manufacturing_location_current) ; \+indep(s15)).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, sequim_wa_usa)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr factory_production
% @type categorical
% @canonical false
% @original_name Factory production
% @values longest_running_last_major_us_factory=Longest_running_last_major_board_factory_USA unk_factory_production=Unknown
% @importance 0.50

0.90::acc(s17, factory_production).

0.86::true_val(factory_production, longest_running_last_major_us_factory); 0.14::true_val(factory_production, unk_factory_production).

measured(s17, factory_production, longest_running_last_major_us_factory).

all_consistent(factory_production) :- consistent(s17, factory_production).

evidence(all_consistent(factory_production)).
query(true_val(factory_production, longest_running_last_major_us_factory)).
query(true_val(factory_production, unk_factory_production)).

% @attr sustainability_certification_zero_waste
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values zero_hazardous_waste=Zero_hazardous_waste_factory unk_sustainability_certification_zero_waste=Unknown
% @importance 0.55

0.90::acc(s16, sustainability_certification_zero_waste).

0.86::true_val(sustainability_certification_zero_waste, zero_hazardous_waste); 0.14::true_val(sustainability_certification_zero_waste, unk_sustainability_certification_zero_waste).

measured(s16, sustainability_certification_zero_waste, zero_hazardous_waste).

all_consistent(sustainability_certification_zero_waste) :- consistent(s16, sustainability_certification_zero_waste).

evidence(all_consistent(sustainability_certification_zero_waste)).
query(true_val(sustainability_certification_zero_waste, zero_hazardous_waste)).
query(true_val(sustainability_certification_zero_waste, unk_sustainability_certification_zero_waste)).

% @attr sustainability_certification_solvents
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values water_based_solvents=Water_based_solvents_instead_of_petrochemical unk_sustainability_certification_solvents=Unknown
% @importance 0.40

0.76::acc(s18, sustainability_certification_solvents).

0.62::true_val(sustainability_certification_solvents, water_based_solvents); 0.38::true_val(sustainability_certification_solvents, unk_sustainability_certification_solvents).

measured(s18, sustainability_certification_solvents, water_based_solvents).

all_consistent(sustainability_certification_solvents) :-
    (indep(s18), consistent(s18, sustainability_certification_solvents) ; \+indep(s18)).

evidence(all_consistent(sustainability_certification_solvents)).
query(true_val(sustainability_certification_solvents, water_based_solvents)).
query(true_val(sustainability_certification_solvents, unk_sustainability_certification_solvents)).

% @attr sustainability_certification_materials
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values bio_plastics_soy_low_voc_basalt_fsc=Non_petroleum_bio_plastics_soy_elastomer_low_VOC_basalt_FSC unk_sustainability_certification_materials=Unknown
% @importance 0.55

0.90::acc(s16, sustainability_certification_materials).

0.86::true_val(sustainability_certification_materials, bio_plastics_soy_low_voc_basalt_fsc); 0.14::true_val(sustainability_certification_materials, unk_sustainability_certification_materials).

measured(s16, sustainability_certification_materials, bio_plastics_soy_low_voc_basalt_fsc).

all_consistent(sustainability_certification_materials) :- consistent(s16, sustainability_certification_materials).

evidence(all_consistent(sustainability_certification_materials)).
query(true_val(sustainability_certification_materials, bio_plastics_soy_low_voc_basalt_fsc)).
query(true_val(sustainability_certification_materials, unk_sustainability_certification_materials)).

% @attr sustainability_certification_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values sawdust_recycled_scrap_donated=All_sawdust_recycled_scrap_wood_donated unk_sustainability_certification_recycling=Unknown
% @importance 0.40

0.76::acc(s18, sustainability_certification_recycling).

0.62::true_val(sustainability_certification_recycling, sawdust_recycled_scrap_donated); 0.38::true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling).

measured(s18, sustainability_certification_recycling, sawdust_recycled_scrap_donated).

all_consistent(sustainability_certification_recycling) :-
    (indep(s18), consistent(s18, sustainability_certification_recycling) ; \+indep(s18)).

evidence(all_consistent(sustainability_certification_recycling)).
query(true_val(sustainability_certification_recycling, sawdust_recycled_scrap_donated)).
query(true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling)).

% @attr mervin_ownership_history
% @type categorical
% @canonical false
% @original_name Mervin ownership history
% @values quiksilver_1997_altamont_2013=Quiksilver_1997_Altamont_Capital_2013 unk_mervin_ownership_history=Unknown
% @importance 0.30

0.68::acc(s19, mervin_ownership_history).

0.63::true_val(mervin_ownership_history, quiksilver_1997_altamont_2013); 0.37::true_val(mervin_ownership_history, unk_mervin_ownership_history).

measured(s19, mervin_ownership_history, quiksilver_1997_altamont_2013).

all_consistent(mervin_ownership_history) :- consistent(s19, mervin_ownership_history).

evidence(all_consistent(mervin_ownership_history)).
query(true_val(mervin_ownership_history, quiksilver_1997_altamont_2013)).
query(true_val(mervin_ownership_history, unk_mervin_ownership_history)).

% @attr us_market_share
% @type categorical
% @canonical false
% @original_name US market share
% @values pct23_above_500=23pct_US_market_boards_above_500 unk_us_market_share=Unknown
% @importance 0.45

0.80::acc(s20, us_market_share).

0.74::true_val(us_market_share, pct23_above_500); 0.26::true_val(us_market_share, unk_us_market_share).

measured(s20, us_market_share, pct23_above_500).

all_consistent(us_market_share) :- consistent(s20, us_market_share).

evidence(all_consistent(us_market_share)).
query(true_val(us_market_share, pct23_above_500)).
query(true_val(us_market_share, unk_us_market_share)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v1=1.0 unk_warranty_period_years=Unknown
% @importance 0.775

0.80::acc(s15, warranty_period_years).
0.76::acc(s21, warranty_period_years).

0.93::true_val(warranty_period_years, v1); 0.07::true_val(warranty_period_years, unk_warranty_period_years).

measured(s15, warranty_period_years, v1).
measured(s21, warranty_period_years, v1).

all_consistent(warranty_period_years) :-
    (indep(s15), consistent(s15, warranty_period_years) ; \+indep(s15)),
    (indep(s21), consistent(s21, warranty_period_years) ; \+indep(s21)).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values structural_defects_only=Structural_defects_only_no_impact_abuse_wear unk_warranty=Unknown
% @importance 0.775

0.80::acc(s15, warranty).
0.76::acc(s21, warranty).

0.93::true_val(warranty, structural_defects_only); 0.07::true_val(warranty, unk_warranty).

measured(s15, warranty, structural_defects_only).
measured(s21, warranty, structural_defects_only).

all_consistent(warranty) :-
    (indep(s15), consistent(s15, warranty) ; \+indep(s15)),
    (indep(s21), consistent(s21, warranty) ; \+indep(s21)).

evidence(all_consistent(warranty)).
query(true_val(warranty, structural_defects_only)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_receipt
% @type categorical
% @canonical false
% @original_name warranty
% @values must_keep_receipt_authorized_dealer=Must_keep_receipt_Mervin_Authorized_Dealer unk_warranty_receipt=Unknown
% @importance 0.70

0.76::acc(s21, warranty_receipt).

0.74::true_val(warranty_receipt, must_keep_receipt_authorized_dealer); 0.26::true_val(warranty_receipt, unk_warranty_receipt).

measured(s21, warranty_receipt, must_keep_receipt_authorized_dealer).

all_consistent(warranty_receipt) :-
    (indep(s21), consistent(s21, warranty_receipt) ; \+indep(s21)).

evidence(all_consistent(warranty_receipt)).
query(true_val(warranty_receipt, must_keep_receipt_authorized_dealer)).
query(true_val(warranty_receipt, unk_warranty_receipt)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v699_99=699.99 unk_price_usd_msrp=Unknown
% @importance 0.975

0.95::acc(s1, price_usd_msrp).
0.85::acc(s10, price_usd_msrp).

0.97::true_val(price_usd_msrp, v699_99); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s1, price_usd_msrp, v699_99).
measured(s10, price_usd_msrp, v699_99).

all_consistent(price_usd_msrp) :-
    consistent(s1, price_usd_msrp),
    consistent(s10, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v699_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_libtech_sale
% @type categorical
% @canonical false
% @original_name Sale price on lib-tech.com (25/26 model, 30% off sale)
% @unit USD
% @values a_grade_440_99_b_grade_629_99=A_grade_440.99_B_grade_629.99 unk_price_usd_libtech_sale=Unknown
% @importance 1.0

0.93::acc(s1, price_usd_libtech_sale).

0.92::true_val(price_usd_libtech_sale, a_grade_440_99_b_grade_629_99); 0.08::true_val(price_usd_libtech_sale, unk_price_usd_libtech_sale).

measured(s1, price_usd_libtech_sale, a_grade_440_99_b_grade_629_99).

all_consistent(price_usd_libtech_sale) :- consistent(s1, price_usd_libtech_sale).

evidence(all_consistent(price_usd_libtech_sale)).
query(true_val(price_usd_libtech_sale, a_grade_440_99_b_grade_629_99)).
query(true_val(price_usd_libtech_sale, unk_price_usd_libtech_sale)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v818_99=818.99 unk_price_aud_merchant=Unknown
% @importance 0.90

0.88::acc(s2, price_aud_merchant).

0.68::true_val(price_aud_merchant, v818_99); 0.32::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s2, price_aud_merchant, v818_99).

all_consistent(price_aud_merchant) :- consistent(s2, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v818_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_aud_merchant_rrp
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v1169_99=1169.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.90

0.88::acc(s2, price_aud_merchant_rrp).

0.68::true_val(price_aud_merchant_rrp, v1169_99); 0.32::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s2, price_aud_merchant_rrp, v1169_99).

all_consistent(price_aud_merchant_rrp) :- consistent(s2, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v1169_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

% @attr merchant_discount
% @type categorical
% @canonical false
% @original_name Merchant discount
% @values pct30_off=30pct_off unk_merchant_discount=Unknown
% @importance 0.90

0.88::acc(s2, merchant_discount).

0.68::true_val(merchant_discount, pct30_off); 0.32::true_val(merchant_discount, unk_merchant_discount).

measured(s2, merchant_discount, pct30_off).

all_consistent(merchant_discount) :- consistent(s2, merchant_discount).

evidence(all_consistent(merchant_discount)).
query(true_val(merchant_discount, pct30_off)).
query(true_val(merchant_discount, unk_merchant_discount)).

% @attr merchant_condition
% @type categorical
% @canonical false
% @original_name Merchant condition
% @values b_grade=B_Grade_slight_cosmetic_defects unk_merchant_condition=Unknown
% @importance 0.90

0.88::acc(s2, merchant_condition).

0.68::true_val(merchant_condition, b_grade); 0.32::true_val(merchant_condition, unk_merchant_condition).

measured(s2, merchant_condition, b_grade).

all_consistent(merchant_condition) :- consistent(s2, merchant_condition).

evidence(all_consistent(merchant_condition)).
query(true_val(merchant_condition, b_grade)).
query(true_val(merchant_condition, unk_merchant_condition)).

% @attr availability_status_merchant
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out=Sold_out unk_availability_status_merchant=Unknown
% @importance 0.90

0.85::acc(s2, availability_status_merchant).

0.68::true_val(availability_status_merchant, sold_out); 0.32::true_val(availability_status_merchant, unk_availability_status_merchant).

measured(s2, availability_status_merchant, sold_out).

all_consistent(availability_status_merchant) :- consistent(s2, availability_status_merchant).

evidence(all_consistent(availability_status_merchant)).
query(true_val(availability_status_merchant, sold_out)).
query(true_val(availability_status_merchant, unk_availability_status_merchant)).

% @attr price_usd_blauer
% @type numeric
% @canonical false
% @original_name Price at Blauer Board Shop
% @unit USD
% @values v489_99=489.99 unk_price_usd_blauer=Unknown
% @importance 0.95

0.88::acc(s10, price_usd_blauer).

0.79::true_val(price_usd_blauer, v489_99); 0.21::true_val(price_usd_blauer, unk_price_usd_blauer).

measured(s10, price_usd_blauer, v489_99).

all_consistent(price_usd_blauer) :- consistent(s10, price_usd_blauer).

evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v489_99)).
query(true_val(price_usd_blauer, unk_price_usd_blauer)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v489_99=489.99 unk_price_usd_evo=Unknown
% @importance 0.95

0.88::acc(s10, price_usd_evo).

0.79::true_val(price_usd_evo, v489_99); 0.21::true_val(price_usd_evo, unk_price_usd_evo).

measured(s10, price_usd_evo, v489_99).

all_consistent(price_usd_evo) :- consistent(s10, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v489_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_the_house
% @type numeric
% @canonical false
% @original_name Price at The House
% @unit USD
% @values v489_99=489.99 unk_price_usd_the_house=Unknown
% @importance 0.95

0.88::acc(s10, price_usd_the_house).

0.79::true_val(price_usd_the_house, v489_99); 0.21::true_val(price_usd_the_house, unk_price_usd_the_house).

measured(s10, price_usd_the_house, v489_99).

all_consistent(price_usd_the_house) :- consistent(s10, price_usd_the_house).

evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v489_99)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v559_99=559.99 unk_price_usd_backcountry=Unknown
% @importance 0.95

0.88::acc(s10, price_usd_backcountry).

0.79::true_val(price_usd_backcountry, v559_99); 0.21::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s10, price_usd_backcountry, v559_99).

all_consistent(price_usd_backcountry) :- consistent(s10, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v559_99)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_sun_ski
% @type numeric
% @canonical false
% @original_name Price at Sun & Ski Sports
% @unit USD
% @values v559_93=559.93 unk_price_usd_sun_ski=Unknown
% @importance 0.95

0.88::acc(s10, price_usd_sun_ski).

0.79::true_val(price_usd_sun_ski, v559_93); 0.21::true_val(price_usd_sun_ski, unk_price_usd_sun_ski).

measured(s10, price_usd_sun_ski, v559_93).

all_consistent(price_usd_sun_ski) :- consistent(s10, price_usd_sun_ski).

evidence(all_consistent(price_usd_sun_ski)).
query(true_val(price_usd_sun_ski, v559_93)).
query(true_val(price_usd_sun_ski, unk_price_usd_sun_ski)).

% @attr price_usd_tactics
% @type numeric
% @canonical true
% @original_name price_usd_tactics
% @unit USD
% @values v489_99=489.99 unk_price_usd_tactics=Unknown
% @importance 0.95

0.88::acc(s10, price_usd_tactics).

0.79::true_val(price_usd_tactics, v489_99); 0.21::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s10, price_usd_tactics, v489_99).

all_consistent(price_usd_tactics) :- consistent(s10, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v489_99)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_tactics_full
% @type numeric
% @canonical false
% @original_name price_usd_tactics
% @unit USD
% @values v699_99=699.99 unk_price_usd_tactics_full=Unknown
% @importance 0.95

0.88::acc(s10, price_usd_tactics_full).

0.79::true_val(price_usd_tactics_full, v699_99); 0.21::true_val(price_usd_tactics_full, unk_price_usd_tactics_full).

measured(s10, price_usd_tactics_full, v699_99).

all_consistent(price_usd_tactics_full) :- consistent(s10, price_usd_tactics_full).

evidence(all_consistent(price_usd_tactics_full)).
query(true_val(price_usd_tactics_full, v699_99)).
query(true_val(price_usd_tactics_full, unk_price_usd_tactics_full)).

% @attr price_cad_prfo
% @type numeric
% @canonical true
% @original_name price_cad_prfo
% @unit CAD
% @values v608_99=608.99 unk_price_cad_prfo=Unknown
% @importance 0.95

0.88::acc(s10, price_cad_prfo).

0.79::true_val(price_cad_prfo, v608_99); 0.21::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s10, price_cad_prfo, v608_99).

all_consistent(price_cad_prfo) :- consistent(s10, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v608_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_usd_ebay
% @type numeric
% @canonical false
% @original_name Price at eBay (2026 model, 161W)
% @unit USD
% @values v699_95=699.95 unk_price_usd_ebay=Unknown
% @importance 0.60

0.53::acc(s22, price_usd_ebay).

0.41::true_val(price_usd_ebay, v699_95); 0.59::true_val(price_usd_ebay, unk_price_usd_ebay).

measured(s22, price_usd_ebay, v699_95).

all_consistent(price_usd_ebay) :- consistent(s22, price_usd_ebay).

evidence(all_consistent(price_usd_ebay)).
query(true_val(price_usd_ebay, v699_95)).
query(true_val(price_usd_ebay, unk_price_usd_ebay)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v569_00=569.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.95

0.88::acc(s10, price_eur_blue_tomato).

0.79::true_val(price_eur_blue_tomato, v569_00); 0.21::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s10, price_eur_blue_tomato, v569_00).

all_consistent(price_eur_blue_tomato) :- consistent(s10, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v569_00)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_eur_stoked
% @type numeric
% @canonical false
% @original_name Price in Europe at Stoked Board Shop
% @unit EUR
% @values v594_95=594.95 unk_price_eur_stoked=Unknown
% @importance 0.95

0.88::acc(s10, price_eur_stoked).

0.79::true_val(price_eur_stoked, v594_95); 0.21::true_val(price_eur_stoked, unk_price_eur_stoked).

measured(s10, price_eur_stoked, v594_95).

all_consistent(price_eur_stoked) :- consistent(s10, price_eur_stoked).

evidence(all_consistent(price_eur_stoked)).
query(true_val(price_eur_stoked, v594_95)).
query(true_val(price_eur_stoked, unk_price_eur_stoked)).

% @attr price_eur_snowcountry
% @type numeric
% @canonical false
% @original_name Price in Europe at SnowCountry
% @unit EUR
% @values v559_96=559.96 unk_price_eur_snowcountry=Unknown
% @importance 0.95

0.88::acc(s10, price_eur_snowcountry).

0.79::true_val(price_eur_snowcountry, v559_96); 0.21::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s10, price_eur_snowcountry, v559_96).

all_consistent(price_eur_snowcountry) :- consistent(s10, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v559_96)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock_multiple=In_stock_multiple_sizes_2025_blem_2026_new unk_availability_status=Unknown
% @importance 0.95

0.85::acc(s10, availability_status).

0.79::true_val(availability_status, in_stock_multiple); 0.21::true_val(availability_status, unk_availability_status).

measured(s10, availability_status, in_stock_multiple).

all_consistent(availability_status) :- consistent(s10, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_multiple)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status
% @values all_2025_sold_out=All_2025_sizes_sold_out unk_availability_status_skipro=Unknown
% @importance 0.55

0.63::acc(s23, availability_status_skipro).

0.55::true_val(availability_status_skipro, all_2025_sold_out); 0.45::true_val(availability_status_skipro, unk_availability_status_skipro).

measured(s23, availability_status_skipro, all_2025_sold_out).

all_consistent(availability_status_skipro) :-
    (indep(s23), consistent(s23, availability_status_skipro) ; \+indep(s23)).

evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, all_2025_sold_out)).
query(true_val(availability_status_skipro, unk_availability_status_skipro)).

% @attr price_usd_libtech_camber
% @type categorical
% @canonical false
% @original_name Price on lib-tech.com for Skunk Ape Camber variant
% @unit USD
% @values v699_99_sale_440_99=699.99_sale_440.99 unk_price_usd_libtech_camber=Unknown
% @importance 0.70

0.93::acc(s24, price_usd_libtech_camber).

0.87::true_val(price_usd_libtech_camber, v699_99_sale_440_99); 0.13::true_val(price_usd_libtech_camber, unk_price_usd_libtech_camber).

measured(s24, price_usd_libtech_camber, v699_99_sale_440_99).

all_consistent(price_usd_libtech_camber) :- consistent(s24, price_usd_libtech_camber).

evidence(all_consistent(price_usd_libtech_camber)).
query(true_val(price_usd_libtech_camber, v699_99_sale_440_99)).
query(true_val(price_usd_libtech_camber, unk_price_usd_libtech_camber)).

% @attr rating_libtech_website
% @type categorical
% @canonical false
% @original_name Lib Tech website review rating
% @values pct99_of_100_82_reviews=99pct_of_100_82_reviews unk_rating_libtech_website=Unknown
% @importance 1.0

0.93::acc(s1, rating_libtech_website).

0.92::true_val(rating_libtech_website, pct99_of_100_82_reviews); 0.08::true_val(rating_libtech_website, unk_rating_libtech_website).

measured(s1, rating_libtech_website, pct99_of_100_82_reviews).

all_consistent(rating_libtech_website) :- consistent(s1, rating_libtech_website).

evidence(all_consistent(rating_libtech_website)).
query(true_val(rating_libtech_website, pct99_of_100_82_reviews)).
query(true_val(rating_libtech_website, unk_rating_libtech_website)).

% @attr rating_libtech_camber
% @type categorical
% @canonical false
% @original_name Lib Tech Skunk Ape Camber website rating
% @values pct98_of_100_19_reviews=98pct_of_100_19_reviews unk_rating_libtech_camber=Unknown
% @importance 0.70

0.93::acc(s24, rating_libtech_camber).

0.87::true_val(rating_libtech_camber, pct98_of_100_19_reviews); 0.13::true_val(rating_libtech_camber, unk_rating_libtech_camber).

measured(s24, rating_libtech_camber, pct98_of_100_19_reviews).

all_consistent(rating_libtech_camber) :- consistent(s24, rating_libtech_camber).

evidence(all_consistent(rating_libtech_camber)).
query(true_val(rating_libtech_camber, pct98_of_100_19_reviews)).
query(true_val(rating_libtech_camber, unk_rating_libtech_camber)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values average=Average unk_powder_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s10, powder_rating_tgr).

0.79::true_val(powder_rating_tgr, average); 0.21::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s10, powder_rating_tgr, average).

all_consistent(powder_rating_tgr) :- consistent(s10, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, average)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.95

0.85::acc(s10, base_glide_performance).

0.79::true_val(base_glide_performance, good); 0.21::true_val(base_glide_performance, unk_base_glide_performance).

measured(s10, base_glide_performance, good).

all_consistent(base_glide_performance) :- consistent(s10, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values good=Good unk_carving_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s10, carving_rating_tgr).

0.79::true_val(carving_rating_tgr, good); 0.21::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s10, carving_rating_tgr, good).

all_consistent(carving_rating_tgr) :- consistent(s10, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, good)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s10, speed_rating_tgr).

0.79::true_val(speed_rating_tgr, good); 0.21::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s10, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :- consistent(s10, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr reviewer_opinion_tgr_switch
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values good=Good unk_reviewer_opinion_tgr_switch=Unknown
% @importance 0.95

0.82::acc(s10, reviewer_opinion_tgr_switch).

0.79::true_val(reviewer_opinion_tgr_switch, good); 0.21::true_val(reviewer_opinion_tgr_switch, unk_reviewer_opinion_tgr_switch).

measured(s10, reviewer_opinion_tgr_switch, good).

all_consistent(reviewer_opinion_tgr_switch) :- consistent(s10, reviewer_opinion_tgr_switch).

evidence(all_consistent(reviewer_opinion_tgr_switch)).
query(true_val(reviewer_opinion_tgr_switch, good)).
query(true_val(reviewer_opinion_tgr_switch, unk_reviewer_opinion_tgr_switch)).

% @attr reviewer_opinion_tgr_steeps
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values good=Good unk_reviewer_opinion_tgr_steeps=Unknown
% @importance 0.95

0.82::acc(s10, reviewer_opinion_tgr_steeps).

0.79::true_val(reviewer_opinion_tgr_steeps, good); 0.21::true_val(reviewer_opinion_tgr_steeps, unk_reviewer_opinion_tgr_steeps).

measured(s10, reviewer_opinion_tgr_steeps, good).

all_consistent(reviewer_opinion_tgr_steeps) :- consistent(s10, reviewer_opinion_tgr_steeps).

evidence(all_consistent(reviewer_opinion_tgr_steeps)).
query(true_val(reviewer_opinion_tgr_steeps, good)).
query(true_val(reviewer_opinion_tgr_steeps, unk_reviewer_opinion_tgr_steeps)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s10, jumps_rating_tgr).

0.79::true_val(jumps_rating_tgr, great); 0.21::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s10, jumps_rating_tgr, great).

all_consistent(jumps_rating_tgr) :- consistent(s10, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s10, jibbing_rating_tgr).

0.79::true_val(jibbing_rating_tgr, average); 0.21::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s10, jibbing_rating_tgr, average).

all_consistent(jibbing_rating_tgr) :- consistent(s10, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values great=Great unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s10, pipe_rating_tgr).

0.79::true_val(pipe_rating_tgr, great); 0.21::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

measured(s10, pipe_rating_tgr, great).

all_consistent(pipe_rating_tgr) :- consistent(s10, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, great)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_stable=Semi_Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.85::acc(s10, on_snow_feel_tgr).

0.79::true_val(on_snow_feel_tgr, semi_stable); 0.21::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s10, on_snow_feel_tgr, semi_stable).

all_consistent(on_snow_feel_tgr) :- consistent(s10, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.85::acc(s10, turn_initiation_performance).

0.79::true_val(turn_initiation_performance, medium_fast); 0.21::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s10, turn_initiation_performance, medium_fast).

all_consistent(turn_initiation_performance) :- consistent(s10, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values icy_snow=Icy_Snow_grips_even_ice unk_edge_hold=Unknown
% @importance 0.95

0.85::acc(s10, edge_hold).

0.79::true_val(edge_hold, icy_snow); 0.21::true_val(edge_hold, unk_edge_hold).

measured(s10, edge_hold, icy_snow).

all_consistent(edge_hold) :- consistent(s10, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, icy_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr ranking_snowboardhow
% @type categorical
% @canonical false
% @original_name snowboardhow.com ranking
% @values num1_all_mountain=Number_1_top_choice_all_mountain unk_ranking_snowboardhow=Unknown
% @importance 0.65

0.53::acc(s25, ranking_snowboardhow).

0.47::true_val(ranking_snowboardhow, num1_all_mountain); 0.53::true_val(ranking_snowboardhow, unk_ranking_snowboardhow).

measured(s25, ranking_snowboardhow, num1_all_mountain).

all_consistent(ranking_snowboardhow) :- consistent(s25, ranking_snowboardhow).

evidence(all_consistent(ranking_snowboardhow)).
query(true_val(ranking_snowboardhow, num1_all_mountain)).
query(true_val(ranking_snowboardhow, unk_ranking_snowboardhow)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values rocker_float_powder=Rocker_float_in_powder unk_positive_aspect=Unknown
% @importance 0.95

0.85::acc(s10, positive_aspect).

0.79::true_val(positive_aspect, rocker_float_powder); 0.21::true_val(positive_aspect, unk_positive_aspect).

measured(s10, positive_aspect, rocker_float_powder).

all_consistent(positive_aspect) :- consistent(s10, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, rocker_float_powder)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_sizes
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values big_sizes_wide_big_feet=Big_sizes_wide_sizes_big_feet unk_positive_aspect_sizes=Unknown
% @importance 0.95

0.85::acc(s10, positive_aspect_sizes).

0.79::true_val(positive_aspect_sizes, big_sizes_wide_big_feet); 0.21::true_val(positive_aspect_sizes, unk_positive_aspect_sizes).

measured(s10, positive_aspect_sizes, big_sizes_wide_big_feet).

all_consistent(positive_aspect_sizes) :- consistent(s10, positive_aspect_sizes).

evidence(all_consistent(positive_aspect_sizes)).
query(true_val(positive_aspect_sizes, big_sizes_wide_big_feet)).
query(true_val(positive_aspect_sizes, unk_positive_aspect_sizes)).

% @attr positive_aspect_heavy_riders
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values handles_heavy_riders=Handles_heavy_riders_well unk_positive_aspect_heavy_riders=Unknown
% @importance 0.95

0.85::acc(s10, positive_aspect_heavy_riders).

0.79::true_val(positive_aspect_heavy_riders, handles_heavy_riders); 0.21::true_val(positive_aspect_heavy_riders, unk_positive_aspect_heavy_riders).

measured(s10, positive_aspect_heavy_riders, handles_heavy_riders).

all_consistent(positive_aspect_heavy_riders) :- consistent(s10, positive_aspect_heavy_riders).

evidence(all_consistent(positive_aspect_heavy_riders)).
query(true_val(positive_aspect_heavy_riders, handles_heavy_riders)).
query(true_val(positive_aspect_heavy_riders, unk_positive_aspect_heavy_riders)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values snappy_edge_fantastic_grip_playful=Incredibly_snappy_edge_fantastic_grip_carving_playful_sidecountry unk_reviewer_opinion_whitelines=Unknown
% @importance 0.90

0.85::acc(s7, reviewer_opinion_whitelines).

0.78::true_val(reviewer_opinion_whitelines, snappy_edge_fantastic_grip_playful); 0.22::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s7, reviewer_opinion_whitelines, snappy_edge_fantastic_grip_playful).

all_consistent(reviewer_opinion_whitelines) :- consistent(s7, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, snappy_edge_fantastic_grip_playful)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr positive_aspect_stability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values very_stable_high_speed=Very_stable_at_high_speeds unk_positive_aspect_stability=Unknown
% @importance 0.95

0.85::acc(s10, positive_aspect_stability).

0.79::true_val(positive_aspect_stability, very_stable_high_speed); 0.21::true_val(positive_aspect_stability, unk_positive_aspect_stability).

measured(s10, positive_aspect_stability, very_stable_high_speed).

all_consistent(positive_aspect_stability) :- consistent(s10, positive_aspect_stability).

evidence(all_consistent(positive_aspect_stability)).
query(true_val(positive_aspect_stability, very_stable_high_speed)).
query(true_val(positive_aspect_stability, unk_positive_aspect_stability)).

% @attr positive_aspect_edge_hold
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values magne_traction_excellent_ice=Magne_traction_excellent_edge_hold_hard_ice unk_positive_aspect_edge_hold=Unknown
% @importance 0.925

0.85::acc(s10, positive_aspect_edge_hold).
0.85::acc(s7, positive_aspect_edge_hold).

0.95::true_val(positive_aspect_edge_hold, magne_traction_excellent_ice); 0.05::true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold).

measured(s10, positive_aspect_edge_hold, magne_traction_excellent_ice).
measured(s7, positive_aspect_edge_hold, magne_traction_excellent_ice).

all_consistent(positive_aspect_edge_hold) :-
    consistent(s10, positive_aspect_edge_hold),
    consistent(s7, positive_aspect_edge_hold).

evidence(all_consistent(positive_aspect_edge_hold)).
query(true_val(positive_aspect_edge_hold, magne_traction_excellent_ice)).
query(true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold)).

% @attr positive_aspect_comfort
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values few_turns_at_home_camber_edge_pop=Within_few_turns_at_home_camber_edge_control_pop unk_positive_aspect_comfort=Unknown
% @importance 0.70

0.58::acc(s26, positive_aspect_comfort).

0.48::true_val(positive_aspect_comfort, few_turns_at_home_camber_edge_pop); 0.52::true_val(positive_aspect_comfort, unk_positive_aspect_comfort).

measured(s26, positive_aspect_comfort, few_turns_at_home_camber_edge_pop).

all_consistent(positive_aspect_comfort) :- consistent(s26, positive_aspect_comfort).

evidence(all_consistent(positive_aspect_comfort)).
query(true_val(positive_aspect_comfort, few_turns_at_home_camber_edge_pop)).
query(true_val(positive_aspect_comfort, unk_positive_aspect_comfort)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values slays_entire_mountain=Board_slays_entire_mountain_trees_crud_jumps unk_user_review_forum=Unknown
% @importance 0.55

0.78::acc(s27, user_review_forum).

0.62::true_val(user_review_forum, slays_entire_mountain); 0.38::true_val(user_review_forum, unk_user_review_forum).

measured(s27, user_review_forum, slays_entire_mountain).

all_consistent(user_review_forum) :- consistent(s27, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, slays_entire_mountain)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr positive_aspect_lightweight
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values lightweight_hp_easy_chairlift=Lightweight_HP_construction_easy_front_foot_chairlift unk_positive_aspect_lightweight=Unknown
% @importance 1.0

0.90::acc(s1, positive_aspect_lightweight).

0.92::true_val(positive_aspect_lightweight, lightweight_hp_easy_chairlift); 0.08::true_val(positive_aspect_lightweight, unk_positive_aspect_lightweight).

measured(s1, positive_aspect_lightweight, lightweight_hp_easy_chairlift).

all_consistent(positive_aspect_lightweight) :- consistent(s1, positive_aspect_lightweight).

evidence(all_consistent(positive_aspect_lightweight)).
query(true_val(positive_aspect_lightweight, lightweight_hp_easy_chairlift)).
query(true_val(positive_aspect_lightweight, unk_positive_aspect_lightweight)).

% @attr positive_aspect_durability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values built_like_tank_big_guys=Durability_built_like_tank_designed_big_guys unk_positive_aspect_durability=Unknown
% @importance 0.55

0.78::acc(s28, positive_aspect_durability).

0.60::true_val(positive_aspect_durability, built_like_tank_big_guys); 0.40::true_val(positive_aspect_durability, unk_positive_aspect_durability).

measured(s28, positive_aspect_durability, built_like_tank_big_guys).

all_consistent(positive_aspect_durability) :- consistent(s28, positive_aspect_durability).

evidence(all_consistent(positive_aspect_durability)).
query(true_val(positive_aspect_durability, built_like_tank_big_guys)).
query(true_val(positive_aspect_durability, unk_positive_aspect_durability)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values base_frequent_waxing=Base_needs_frequent_waxing_sintered_thirsty unk_negative_aspect=Unknown
% @importance 0.95

0.85::acc(s10, negative_aspect).

0.79::true_val(negative_aspect, base_frequent_waxing); 0.21::true_val(negative_aspect, unk_negative_aspect).

measured(s10, negative_aspect, base_frequent_waxing).

all_consistent(negative_aspect) :- consistent(s10, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, base_frequent_waxing)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr reviewer_opinion_whitelines_negative
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values traditional_camber_fans_jarring_c2=Fans_traditional_camber_find_C2_jarring_slow_sliding_turns unk_reviewer_opinion_whitelines_negative=Unknown
% @importance 0.90

0.85::acc(s7, reviewer_opinion_whitelines_negative).

0.78::true_val(reviewer_opinion_whitelines_negative, traditional_camber_fans_jarring_c2); 0.22::true_val(reviewer_opinion_whitelines_negative, unk_reviewer_opinion_whitelines_negative).

measured(s7, reviewer_opinion_whitelines_negative, traditional_camber_fans_jarring_c2).

all_consistent(reviewer_opinion_whitelines_negative) :- consistent(s7, reviewer_opinion_whitelines_negative).

evidence(all_consistent(reviewer_opinion_whitelines_negative)).
query(true_val(reviewer_opinion_whitelines_negative, traditional_camber_fans_jarring_c2)).
query(true_val(reviewer_opinion_whitelines_negative, unk_reviewer_opinion_whitelines_negative)).

% @attr negative_aspect_beginners
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_good_beginners_aggressive=Not_good_for_beginners_too_aggressive unk_negative_aspect_beginners=Unknown
% @importance 0.65

0.53::acc(s25, negative_aspect_beginners).

0.47::true_val(negative_aspect_beginners, not_good_beginners_aggressive); 0.53::true_val(negative_aspect_beginners, unk_negative_aspect_beginners).

measured(s25, negative_aspect_beginners, not_good_beginners_aggressive).

all_consistent(negative_aspect_beginners) :- consistent(s25, negative_aspect_beginners).

evidence(all_consistent(negative_aspect_beginners)).
query(true_val(negative_aspect_beginners, not_good_beginners_aggressive)).
query(true_val(negative_aspect_beginners, unk_negative_aspect_beginners)).

% @attr user_review_forum_wide_turn
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values ultra_wide_turn_commitment=Turn_initiation_ultra_wide_more_commitment unk_user_review_forum_wide_turn=Unknown
% @importance 0.70

0.38::acc(s29, user_review_forum_wide_turn).

0.30::true_val(user_review_forum_wide_turn, ultra_wide_turn_commitment); 0.70::true_val(user_review_forum_wide_turn, unk_user_review_forum_wide_turn).

measured(s29, user_review_forum_wide_turn, ultra_wide_turn_commitment).

all_consistent(user_review_forum_wide_turn) :- consistent(s29, user_review_forum_wide_turn).

evidence(all_consistent(user_review_forum_wide_turn)).
query(true_val(user_review_forum_wide_turn, ultra_wide_turn_commitment)).
query(true_val(user_review_forum_wide_turn, unk_user_review_forum_wide_turn)).

% @attr user_review_forum_edge_change
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values edge_changes_slower_wide=Edge_changes_not_as_quick_on_wide_boards unk_user_review_forum_edge_change=Unknown
% @importance 0.60

0.78::acc(s30, user_review_forum_edge_change).

0.62::true_val(user_review_forum_edge_change, edge_changes_slower_wide); 0.38::true_val(user_review_forum_edge_change, unk_user_review_forum_edge_change).

measured(s30, user_review_forum_edge_change, edge_changes_slower_wide).

all_consistent(user_review_forum_edge_change) :- consistent(s30, user_review_forum_edge_change).

evidence(all_consistent(user_review_forum_edge_change)).
query(true_val(user_review_forum_edge_change, edge_changes_slower_wide)).
query(true_val(user_review_forum_edge_change, unk_user_review_forum_edge_change)).

% @attr reviewer_opinion_tgr_one_foot
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values looser_feel_auto_spinning_one_foot=Looser_feel_auto_spinning_one_footing unk_reviewer_opinion_tgr_one_foot=Unknown
% @importance 0.95

0.85::acc(s10, reviewer_opinion_tgr_one_foot).

0.79::true_val(reviewer_opinion_tgr_one_foot, looser_feel_auto_spinning_one_foot); 0.21::true_val(reviewer_opinion_tgr_one_foot, unk_reviewer_opinion_tgr_one_foot).

measured(s10, reviewer_opinion_tgr_one_foot, looser_feel_auto_spinning_one_foot).

all_consistent(reviewer_opinion_tgr_one_foot) :- consistent(s10, reviewer_opinion_tgr_one_foot).

evidence(all_consistent(reviewer_opinion_tgr_one_foot)).
query(true_val(reviewer_opinion_tgr_one_foot, looser_feel_auto_spinning_one_foot)).
query(true_val(reviewer_opinion_tgr_one_foot, unk_reviewer_opinion_tgr_one_foot)).

% @attr negative_aspect_weight
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_lightest_not_nimblest=Not_lightest_or_most_nimble_board unk_negative_aspect_weight=Unknown
% @importance 0.70

0.58::acc(s26, negative_aspect_weight).

0.48::true_val(negative_aspect_weight, not_lightest_not_nimblest); 0.52::true_val(negative_aspect_weight, unk_negative_aspect_weight).

measured(s26, negative_aspect_weight, not_lightest_not_nimblest).

all_consistent(negative_aspect_weight) :- consistent(s26, negative_aspect_weight).

evidence(all_consistent(negative_aspect_weight)).
query(true_val(negative_aspect_weight, not_lightest_not_nimblest)).
query(true_val(negative_aspect_weight, unk_negative_aspect_weight)).

% @attr user_review_forum_squirrely
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values squirrely_between_feet_firm_icy=Can_feel_squirrely_between_feet_firm_icy_rocker unk_user_review_forum_squirrely=Unknown
% @importance 0.95

0.82::acc(s10, user_review_forum_squirrely).

0.79::true_val(user_review_forum_squirrely, squirrely_between_feet_firm_icy); 0.21::true_val(user_review_forum_squirrely, unk_user_review_forum_squirrely).

measured(s10, user_review_forum_squirrely, squirrely_between_feet_firm_icy).

all_consistent(user_review_forum_squirrely) :- consistent(s10, user_review_forum_squirrely).

evidence(all_consistent(user_review_forum_squirrely)).
query(true_val(user_review_forum_squirrely, squirrely_between_feet_firm_icy)).
query(true_val(user_review_forum_squirrely, unk_user_review_forum_squirrely)).

% @attr reviewer_opinion_tgr_hardpack
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values twitchy_hardpack_vs_camber=Twitchy_hardpack_compared_to_camber_version unk_reviewer_opinion_tgr_hardpack=Unknown
% @importance 0.95

0.85::acc(s10, reviewer_opinion_tgr_hardpack).

0.79::true_val(reviewer_opinion_tgr_hardpack, twitchy_hardpack_vs_camber); 0.21::true_val(reviewer_opinion_tgr_hardpack, unk_reviewer_opinion_tgr_hardpack).

measured(s10, reviewer_opinion_tgr_hardpack, twitchy_hardpack_vs_camber).

all_consistent(reviewer_opinion_tgr_hardpack) :- consistent(s10, reviewer_opinion_tgr_hardpack).

evidence(all_consistent(reviewer_opinion_tgr_hardpack)).
query(true_val(reviewer_opinion_tgr_hardpack, twitchy_hardpack_vs_camber)).
query(true_val(reviewer_opinion_tgr_hardpack, unk_reviewer_opinion_tgr_hardpack)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values skunk_ape_camber_c3=Lib_Tech_Skunk_Ape_Camber_C3_true_camber_7_10 unk_comparable_board_same_brand=Unknown
% @importance 0.80

0.93::acc(s24, comparable_board_same_brand).
0.85::acc(s7, comparable_board_same_brand).

0.95::true_val(comparable_board_same_brand, skunk_ape_camber_c3); 0.05::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s24, comparable_board_same_brand, skunk_ape_camber_c3).
measured(s7, comparable_board_same_brand, skunk_ape_camber_c3).

all_consistent(comparable_board_same_brand) :-
    consistent(s24, comparable_board_same_brand),
    consistent(s7, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, skunk_ape_camber_c3)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_twin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values skunk_ape_twin=Lib_Tech_Skunk_Ape_Twin_true_twin_jib_friendly unk_comparable_board_same_brand_twin=Unknown
% @importance 0.55

0.78::acc(s28, comparable_board_same_brand_twin).

0.60::true_val(comparable_board_same_brand_twin, skunk_ape_twin); 0.40::true_val(comparable_board_same_brand_twin, unk_comparable_board_same_brand_twin).

measured(s28, comparable_board_same_brand_twin, skunk_ape_twin).

all_consistent(comparable_board_same_brand_twin) :- consistent(s28, comparable_board_same_brand_twin).

evidence(all_consistent(comparable_board_same_brand_twin)).
query(true_val(comparable_board_same_brand_twin, skunk_ape_twin)).
query(true_val(comparable_board_same_brand_twin, unk_comparable_board_same_brand_twin)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values k2_party_platter_157=K2_Party_Platter_157 unk_comparable_board_cross_brand=Unknown
% @importance 0.70

0.38::acc(s29, comparable_board_cross_brand).

0.30::true_val(comparable_board_cross_brand, k2_party_platter_157); 0.70::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s29, comparable_board_cross_brand, k2_party_platter_157).

all_consistent(comparable_board_cross_brand) :- consistent(s29, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, k2_party_platter_157)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_superpig
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values ride_superpig_158=Ride_Superpig_158 unk_comparable_board_cross_brand_superpig=Unknown
% @importance 0.70

0.38::acc(s29, comparable_board_cross_brand_superpig).

0.30::true_val(comparable_board_cross_brand_superpig, ride_superpig_158); 0.70::true_val(comparable_board_cross_brand_superpig, unk_comparable_board_cross_brand_superpig).

measured(s29, comparable_board_cross_brand_superpig, ride_superpig_158).

all_consistent(comparable_board_cross_brand_superpig) :- consistent(s29, comparable_board_cross_brand_superpig).

evidence(all_consistent(comparable_board_cross_brand_superpig)).
query(true_val(comparable_board_cross_brand_superpig, ride_superpig_158)).
query(true_val(comparable_board_cross_brand_superpig, unk_comparable_board_cross_brand_superpig)).

% @attr comparable_board_cross_brand_protosynthesis
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values never_summer_protosynthesis=Never_Summer_Protosynthesis unk_comparable_board_cross_brand_protosynthesis=Unknown
% @importance 0.70

0.38::acc(s29, comparable_board_cross_brand_protosynthesis).

0.30::true_val(comparable_board_cross_brand_protosynthesis, never_summer_protosynthesis); 0.70::true_val(comparable_board_cross_brand_protosynthesis, unk_comparable_board_cross_brand_protosynthesis).

measured(s29, comparable_board_cross_brand_protosynthesis, never_summer_protosynthesis).

all_consistent(comparable_board_cross_brand_protosynthesis) :- consistent(s29, comparable_board_cross_brand_protosynthesis).

evidence(all_consistent(comparable_board_cross_brand_protosynthesis)).
query(true_val(comparable_board_cross_brand_protosynthesis, never_summer_protosynthesis)).
query(true_val(comparable_board_cross_brand_protosynthesis, unk_comparable_board_cross_brand_protosynthesis)).

% @attr comparable_board_cross_brand_partywave
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values bataleon_party_wave_plus=Bataleon_Party_Wave_Plus unk_comparable_board_cross_brand_partywave=Unknown
% @importance 0.70

0.38::acc(s29, comparable_board_cross_brand_partywave).

0.30::true_val(comparable_board_cross_brand_partywave, bataleon_party_wave_plus); 0.70::true_val(comparable_board_cross_brand_partywave, unk_comparable_board_cross_brand_partywave).

measured(s29, comparable_board_cross_brand_partywave, bataleon_party_wave_plus).

all_consistent(comparable_board_cross_brand_partywave) :- consistent(s29, comparable_board_cross_brand_partywave).

evidence(all_consistent(comparable_board_cross_brand_partywave)).
query(true_val(comparable_board_cross_brand_partywave, bataleon_party_wave_plus)).
query(true_val(comparable_board_cross_brand_partywave, unk_comparable_board_cross_brand_partywave)).

% @attr comparable_board_cross_brand_backwoods
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values weston_backwoods_163w_167w=Weston_Backwoods_163W_167W unk_comparable_board_cross_brand_backwoods=Unknown
% @importance 0.70

0.38::acc(s29, comparable_board_cross_brand_backwoods).

0.30::true_val(comparable_board_cross_brand_backwoods, weston_backwoods_163w_167w); 0.70::true_val(comparable_board_cross_brand_backwoods, unk_comparable_board_cross_brand_backwoods).

measured(s29, comparable_board_cross_brand_backwoods, weston_backwoods_163w_167w).

all_consistent(comparable_board_cross_brand_backwoods) :- consistent(s29, comparable_board_cross_brand_backwoods).

evidence(all_consistent(comparable_board_cross_brand_backwoods)).
query(true_val(comparable_board_cross_brand_backwoods, weston_backwoods_163w_167w)).
query(true_val(comparable_board_cross_brand_backwoods, unk_comparable_board_cross_brand_backwoods)).

% @attr comparable_board_cross_brand_gnu
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values gnu_altered_genetics=Gnu_Altered_Genetics unk_comparable_board_cross_brand_gnu=Unknown
% @importance 0.45

0.33::acc(s31, comparable_board_cross_brand_gnu).

0.21::true_val(comparable_board_cross_brand_gnu, gnu_altered_genetics); 0.79::true_val(comparable_board_cross_brand_gnu, unk_comparable_board_cross_brand_gnu).

measured(s31, comparable_board_cross_brand_gnu, gnu_altered_genetics).

all_consistent(comparable_board_cross_brand_gnu) :- consistent(s31, comparable_board_cross_brand_gnu).

evidence(all_consistent(comparable_board_cross_brand_gnu)).
query(true_val(comparable_board_cross_brand_gnu, gnu_altered_genetics)).
query(true_val(comparable_board_cross_brand_gnu, unk_comparable_board_cross_brand_gnu)).

% @attr comparable_board_cross_brand_custom_x
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_custom_x_wide=Burton_Custom_X_Wide unk_comparable_board_cross_brand_custom_x=Unknown
% @importance 0.60

0.68::acc(s32, comparable_board_cross_brand_custom_x).

0.55::true_val(comparable_board_cross_brand_custom_x, burton_custom_x_wide); 0.45::true_val(comparable_board_cross_brand_custom_x, unk_comparable_board_cross_brand_custom_x).

measured(s32, comparable_board_cross_brand_custom_x, burton_custom_x_wide).

all_consistent(comparable_board_cross_brand_custom_x) :-
    (indep(s32), consistent(s32, comparable_board_cross_brand_custom_x) ; \+indep(s32)).

evidence(all_consistent(comparable_board_cross_brand_custom_x)).
query(true_val(comparable_board_cross_brand_custom_x, burton_custom_x_wide)).
query(true_val(comparable_board_cross_brand_custom_x, unk_comparable_board_cross_brand_custom_x)).

% @attr comparable_board_cross_brand_jones
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_mountain_twin=Jones_Mountain_Twin unk_comparable_board_cross_brand_jones=Unknown
% @importance 0.60

0.53::acc(s22, comparable_board_cross_brand_jones).

0.41::true_val(comparable_board_cross_brand_jones, jones_mountain_twin); 0.59::true_val(comparable_board_cross_brand_jones, unk_comparable_board_cross_brand_jones).

measured(s22, comparable_board_cross_brand_jones, jones_mountain_twin).

all_consistent(comparable_board_cross_brand_jones) :- consistent(s22, comparable_board_cross_brand_jones).

evidence(all_consistent(comparable_board_cross_brand_jones)).
query(true_val(comparable_board_cross_brand_jones, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand_jones, unk_comparable_board_cross_brand_jones)).

% @attr comparable_board_cross_brand_nitro
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values nitro_wide_options=Nitro_wide_options unk_comparable_board_cross_brand_nitro=Unknown
% @importance 0.60

0.68::acc(s32, comparable_board_cross_brand_nitro).

0.55::true_val(comparable_board_cross_brand_nitro, nitro_wide_options); 0.45::true_val(comparable_board_cross_brand_nitro, unk_comparable_board_cross_brand_nitro).

measured(s32, comparable_board_cross_brand_nitro, nitro_wide_options).

all_consistent(comparable_board_cross_brand_nitro) :-
    (indep(s32), consistent(s32, comparable_board_cross_brand_nitro) ; \+indep(s32)).

evidence(all_consistent(comparable_board_cross_brand_nitro)).
query(true_val(comparable_board_cross_brand_nitro, nitro_wide_options)).
query(true_val(comparable_board_cross_brand_nitro, unk_comparable_board_cross_brand_nitro)).

% @attr model_first_available_year
% @type numeric
% @canonical true
% @original_name model_first_available_year
% @values v2010=2010.0 unk_model_first_available_year=Unknown
% @importance 0.95

0.85::acc(s10, model_first_available_year).

0.79::true_val(model_first_available_year, v2010); 0.21::true_val(model_first_available_year, unk_model_first_available_year).

measured(s10, model_first_available_year, v2010).

all_consistent(model_first_available_year) :- consistent(s10, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, v2010)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr earliest_user_review_ref
% @type categorical
% @canonical false
% @original_name Earliest user review reference
% @values y2008_skunk_ape=2008_Skunk_Ape_mentioned unk_earliest_user_review_ref=Unknown
% @importance 0.55

0.78::acc(s27, earliest_user_review_ref).

0.62::true_val(earliest_user_review_ref, y2008_skunk_ape); 0.38::true_val(earliest_user_review_ref, unk_earliest_user_review_ref).

measured(s27, earliest_user_review_ref, y2008_skunk_ape).

all_consistent(earliest_user_review_ref) :- consistent(s27, earliest_user_review_ref).

evidence(all_consistent(earliest_user_review_ref)).
query(true_val(earliest_user_review_ref, y2008_skunk_ape)).
query(true_val(earliest_user_review_ref, unk_earliest_user_review_ref)).

% @attr version_2012_13
% @type categorical
% @canonical false
% @original_name 2012/13 version
% @values c2_btx_profile=Had_C2_BTX_profile unk_version_2012_13=Unknown
% @importance 0.45

0.38::acc(s33, version_2012_13).

0.29::true_val(version_2012_13, c2_btx_profile); 0.71::true_val(version_2012_13, unk_version_2012_13).

measured(s33, version_2012_13, c2_btx_profile).

all_consistent(version_2012_13) :- consistent(s33, version_2012_13).

evidence(all_consistent(version_2012_13)).
query(true_val(version_2012_13, c2_btx_profile)).
query(true_val(version_2012_13, unk_version_2012_13)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values significant_shape_redesign=Significant_shape_redesign_noted_by_TGR unk_redesign_year=Unknown
% @importance 0.55

0.78::acc(s27, redesign_year).

0.62::true_val(redesign_year, significant_shape_redesign); 0.38::true_val(redesign_year, unk_redesign_year).

measured(s27, redesign_year, significant_shape_redesign).

all_consistent(redesign_year) :- consistent(s27, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, significant_shape_redesign)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr season_2024_25_camber_intro
% @type categorical
% @canonical false
% @original_name 2024-2025 season
% @values first_year_camber_c3_alongside_c2x=First_year_Camber_C3_offered_alongside_C2X unk_season_2024_25_camber_intro=Unknown
% @importance 0.90

0.85::acc(s7, season_2024_25_camber_intro).

0.78::true_val(season_2024_25_camber_intro, first_year_camber_c3_alongside_c2x); 0.22::true_val(season_2024_25_camber_intro, unk_season_2024_25_camber_intro).

measured(s7, season_2024_25_camber_intro, first_year_camber_c3_alongside_c2x).

all_consistent(season_2024_25_camber_intro) :- consistent(s7, season_2024_25_camber_intro).

evidence(all_consistent(season_2024_25_camber_intro)).
query(true_val(season_2024_25_camber_intro, first_year_camber_c3_alongside_c2x)).
query(true_val(season_2024_25_camber_intro, unk_season_2024_25_camber_intro)).

% @attr model_2025_26_no_changes
% @type categorical
% @canonical false
% @original_name 2025-2026 model
% @values no_changes_from_2025=No_changes_from_2025_for_2026 unk_model_2025_26_no_changes=Unknown
% @importance 0.65

0.73::acc(s34, model_2025_26_no_changes).

0.64::true_val(model_2025_26_no_changes, no_changes_from_2025); 0.36::true_val(model_2025_26_no_changes, unk_model_2025_26_no_changes).

measured(s34, model_2025_26_no_changes, no_changes_from_2025).

all_consistent(model_2025_26_no_changes) :- consistent(s34, model_2025_26_no_changes).

evidence(all_consistent(model_2025_26_no_changes)).
query(true_val(model_2025_26_no_changes, no_changes_from_2025)).
query(true_val(model_2025_26_no_changes, unk_model_2025_26_no_changes)).

% @attr current_model_listing
% @type categorical
% @canonical false
% @original_name Current model on lib-tech.com
% @values listed_2025_2026=Listed_as_2025_2026 unk_current_model_listing=Unknown
% @importance 1.0

0.93::acc(s1, current_model_listing).

0.92::true_val(current_model_listing, listed_2025_2026); 0.08::true_val(current_model_listing, unk_current_model_listing).

measured(s1, current_model_listing, listed_2025_2026).

all_consistent(current_model_listing) :- consistent(s1, current_model_listing).

evidence(all_consistent(current_model_listing)).
query(true_val(current_model_listing, listed_2025_2026)).
query(true_val(current_model_listing, unk_current_model_listing)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values experimental_big_guy_dream_board=experiMENTAL_Division_big_guy_dream_board unk_design_philosophy=Unknown
% @importance 1.0

0.93::acc(s1, design_philosophy).

0.92::true_val(design_philosophy, experimental_big_guy_dream_board); 0.08::true_val(design_philosophy, unk_design_philosophy).

measured(s1, design_philosophy, experimental_big_guy_dream_board).

all_consistent(design_philosophy) :- consistent(s1, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, experimental_big_guy_dream_board)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values phillips_kulesza_green_jensen=Trevor_Phillips_Krush_Kulesza_Neil_Green_Kurt_Jensen unk_pro_rider_name=Unknown
% @importance 1.0

0.93::acc(s1, pro_rider_name).

0.92::true_val(pro_rider_name, phillips_kulesza_green_jensen); 0.08::true_val(pro_rider_name, unk_pro_rider_name).

measured(s1, pro_rider_name, phillips_kulesza_green_jensen).

all_consistent(pro_rider_name) :- consistent(s1, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, phillips_kulesza_green_jensen)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr kris_jamieson_historical
% @type categorical
% @canonical false
% @original_name Kris Jamieson (historical)
% @values devoted_skunk_ape_enthusiast=Devoted_Skunk_Ape_enthusiast_since_launch unk_kris_jamieson_historical=Unknown
% @importance 0.25

0.85::acc(s35, kris_jamieson_historical).

0.60::true_val(kris_jamieson_historical, devoted_skunk_ape_enthusiast); 0.40::true_val(kris_jamieson_historical, unk_kris_jamieson_historical).

measured(s35, kris_jamieson_historical, devoted_skunk_ape_enthusiast).

all_consistent(kris_jamieson_historical) :- consistent(s35, kris_jamieson_historical).

evidence(all_consistent(kris_jamieson_historical)).
query(true_val(kris_jamieson_historical, devoted_skunk_ape_enthusiast)).
query(true_val(kris_jamieson_historical, unk_kris_jamieson_historical)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values creature_nature_quincy_quigg=Creature_nature_themed_by_Quincy_Quigg unk_topsheet_appearance_description=Unknown
% @importance 1.0

0.93::acc(s1, topsheet_appearance_description).

0.92::true_val(topsheet_appearance_description, creature_nature_quincy_quigg); 0.08::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s1, topsheet_appearance_description, creature_nature_quincy_quigg).

all_consistent(topsheet_appearance_description) :- consistent(s1, topsheet_appearance_description).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, creature_nature_quincy_quigg)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr merchant_sku
% @type categorical
% @canonical false
% @original_name Merchant SKU
% @values sku_24sn041_157w=24SN041_157W unk_merchant_sku=Unknown
% @importance 0.90

0.88::acc(s2, merchant_sku).

0.68::true_val(merchant_sku, sku_24sn041_157w); 0.32::true_val(merchant_sku, unk_merchant_sku).

measured(s2, merchant_sku, sku_24sn041_157w).

all_consistent(merchant_sku) :- consistent(s2, merchant_sku).

evidence(all_consistent(merchant_sku)).
query(true_val(merchant_sku, sku_24sn041_157w)).
query(true_val(merchant_sku, unk_merchant_sku)).

% @attr merchant_selected_size
% @type categorical
% @canonical false
% @original_name Merchant selected size
% @values w157_wide=157cm_Wide unk_merchant_selected_size=Unknown
% @importance 0.90

0.88::acc(s2, merchant_selected_size).

0.68::true_val(merchant_selected_size, w157_wide); 0.32::true_val(merchant_selected_size, unk_merchant_selected_size).

measured(s2, merchant_selected_size, w157_wide).

all_consistent(merchant_selected_size) :- consistent(s2, merchant_selected_size).

evidence(all_consistent(merchant_selected_size)).
query(true_val(merchant_selected_size, w157_wide)).
query(true_val(merchant_selected_size, unk_merchant_selected_size)).