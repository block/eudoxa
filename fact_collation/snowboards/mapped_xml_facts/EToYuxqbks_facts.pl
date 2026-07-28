0.15::indep(s1).
0.15::indep(s3).
0.15::indep(s6).
0.15::indep(s11).
0.15::indep(s13).
0.25::indep(s14).
0.15::indep(s16).
0.20::indep(s20).
0.15::indep(s22).
0.25::indep(s32).
0.20::indep(s34).
0.10::indep(s35).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.93::acc(s1, brand).
0.95::acc(s2, brand).
0.90::acc(smerch, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.87

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).

measured(s1, brand, burton).
measured(s2, brand, burton).
measured(smerch, brand, burton).

all_consistent(brand) :-
    consistent(s2, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)),
    (indep(smerch), consistent(smerch, brand) ; \+indep(smerch)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

0.93::acc(s1, model_name).
0.95::acc(s2, model_name).
0.90::acc(smerch, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values mystery_day_trader=Mystery_Day_Trader unk_model_name=Unknown
% @importance 0.87

0.97::true_val(model_name, mystery_day_trader); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, mystery_day_trader).
measured(s2, model_name, mystery_day_trader).
measured(smerch, model_name, mystery_day_trader).

all_consistent(model_name) :-
    consistent(s2, model_name),
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)),
    (indep(smerch), consistent(smerch, model_name) ; \+indep(smerch)).

evidence(all_consistent(model_name)).
query(true_val(model_name, mystery_day_trader)).
query(true_val(model_name, unk_model_name)).

0.93::acc(s1, model_year).
0.95::acc(s2, model_year).
0.90::acc(smerch, model_year).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2025=2025 unk_model_year=Unknown
% @importance 0.87

0.97::true_val(model_year, v2025); 0.03::true_val(model_year, unk_model_year).

measured(s1, model_year, v2025).
measured(s2, model_year, v2025).
measured(smerch, model_year, v2025).

all_consistent(model_year) :-
    consistent(s2, model_year),
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)),
    (indep(smerch), consistent(smerch, model_year) ; \+indep(smerch)).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2025)).
query(true_val(model_year, unk_model_year)).

0.93::acc(s1, series).
0.95::acc(s2, series).
0.90::acc(smerch, series).

% @attr series
% @type categorical
% @canonical false
% @original_name Series
% @values mystery_series=Mystery_Series unk_series=Unknown
% @importance 0.87

0.97::true_val(series, mystery_series); 0.03::true_val(series, unk_series).

measured(s1, series, mystery_series).
measured(s2, series, mystery_series).
measured(smerch, series, mystery_series).

all_consistent(series) :-
    consistent(s2, series),
    (indep(s1), consistent(s1, series) ; \+indep(s1)),
    (indep(smerch), consistent(smerch, series) ; \+indep(smerch)).

evidence(all_consistent(series)).
query(true_val(series, mystery_series)).
query(true_val(series, unk_series)).

0.88::acc(s2, sku).
0.90::acc(smerch, sku).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values w25_243751=W25-243751 unk_sku=Unknown
% @importance 0.87

0.93::true_val(sku, w25_243751); 0.07::true_val(sku, unk_sku).

measured(s2, sku, w25_243751).
measured(smerch, sku, w25_243751).

all_consistent(sku) :-
    consistent(s2, sku),
    (indep(smerch), consistent(smerch, sku) ; \+indep(smerch)).

evidence(all_consistent(sku)).
query(true_val(sku, w25_243751)).
query(true_val(sku, unk_sku)).

0.85::acc(s29, pro_model_rider).
0.90::acc(s30, pro_model_rider).

% @attr pro_model_rider
% @type categorical
% @canonical false
% @original_name Pro model rider (predecessor)
% @values kimmy_fasani=Kimmy_Fasani unk_pro_model_rider=Unknown
% @importance 0.52

0.90::true_val(pro_model_rider, kimmy_fasani); 0.10::true_val(pro_model_rider, unk_pro_model_rider).

measured(s29, pro_model_rider, kimmy_fasani).
measured(s30, pro_model_rider, kimmy_fasani).

all_consistent(pro_model_rider) :-
    consistent(s29, pro_model_rider),
    consistent(s30, pro_model_rider).

evidence(all_consistent(pro_model_rider)).
query(true_val(pro_model_rider, kimmy_fasani)).
query(true_val(pro_model_rider, unk_pro_model_rider)).

0.88::acc(s11, gender).
0.88::acc(s22, gender).
0.85::acc(s34, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.85

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s11, gender, unisex).
measured(s22, gender, unisex).
measured(s34, gender, unisex).

all_consistent(gender) :-
    (indep(s11), consistent(s11, gender) ; \+indep(s11)),
    (indep(s22), consistent(s22, gender) ; \+indep(s22)),
    (indep(s34), consistent(s34, gender) ; \+indep(s34)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

0.93::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.85

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.90::acc(smerch, board_category).
0.85::acc(s20, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_powder=All_Mountain_Powder unk_board_category=Unknown
% @importance 0.82

0.95::true_val(board_category, all_mountain_powder); 0.05::true_val(board_category, unk_board_category).

measured(smerch, board_category, all_mountain_powder).
measured(s20, board_category, all_mountain_powder).

all_consistent(board_category) :-
    (indep(smerch), consistent(smerch, board_category) ; \+indep(smerch)),
    (indep(s20), consistent(s20, board_category) ; \+indep(s20)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_powder)).
query(true_val(board_category, unk_board_category)).

0.85::acc(s22, board_subtype).

% @attr board_subtype
% @type categorical
% @canonical false
% @original_name Board subtype
% @values freeride_directional=Freeride_Directional unk_board_subtype=Unknown
% @importance 0.70

0.85::true_val(board_subtype, freeride_directional); 0.15::true_val(board_subtype, unk_board_subtype).

measured(s22, board_subtype, freeride_directional).

all_consistent(board_subtype) :-
    (indep(s22), consistent(s22, board_subtype) ; \+indep(s22)).

evidence(all_consistent(board_subtype)).
query(true_val(board_subtype, freeride_directional)).
query(true_val(board_subtype, unk_board_subtype)).

0.88::acc(s13, terrain_suitability_park).

% @attr terrain_suitability_park
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (Park)
% @values v3=3.0 unk_terrain_suitability_park=Unknown
% @importance 0.88

0.90::true_val(terrain_suitability_park, v3); 0.10::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s13, terrain_suitability_park, v3).

all_consistent(terrain_suitability_park) :-
    (indep(s13), consistent(s13, terrain_suitability_park) ; \+indep(s13)).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v3)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

0.88::acc(s13, terrain_suitability).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability (All-Mountain)
% @values v7=7.0 unk_terrain_suitability=Unknown
% @importance 0.88

0.90::true_val(terrain_suitability, v7); 0.10::true_val(terrain_suitability, unk_terrain_suitability).

measured(s13, terrain_suitability, v7).

all_consistent(terrain_suitability) :-
    (indep(s13), consistent(s13, terrain_suitability) ; \+indep(s13)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v7)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.88::acc(s13, terrain_suitability_powder).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (Powder)
% @values v10=10.0 unk_terrain_suitability_powder=Unknown
% @importance 0.88

0.90::true_val(terrain_suitability_powder, v10); 0.10::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s13, terrain_suitability_powder, v10).

all_consistent(terrain_suitability_powder) :-
    (indep(s13), consistent(s13, terrain_suitability_powder) ; \+indep(s13)).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v10)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

0.90::acc(smerch, rider_level).
0.85::acc(s20, rider_level).
0.83::acc(s14, rider_level).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name Rider level
% @values expert=Expert intermediate_expert=Intermediate_to_Expert
% @importance 0.83

0.40::true_val(rider_level, expert); 0.60::true_val(rider_level, intermediate_expert).

measured(smerch, rider_level, expert).
measured(s20, rider_level, intermediate_expert).
measured(s14, rider_level, intermediate_expert).

all_consistent(rider_level) :-
    (indep(smerch), consistent(smerch, rider_level) ; \+indep(smerch)),
    (indep(s20), consistent(s20, rider_level) ; \+indep(s20)),
    (indep(s14), consistent(s14, rider_level) ; \+indep(s14)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, expert)).
query(true_val(rider_level, intermediate_expert)).

0.88::acc(s1, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values am_powder_versatile=All_mountain_powder_float_groomer_versatility unk_skill_level_recommendation=Unknown
% @importance 0.85

0.88::true_val(skill_level_recommendation, am_powder_versatile); 0.12::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s1, skill_level_recommendation, am_powder_versatile).

all_consistent(skill_level_recommendation) :-
    (indep(s1), consistent(s1, skill_level_recommendation) ; \+indep(s1)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, am_powder_versatile)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.90::acc(smerch, shape).
0.88::acc(s16, shape).
0.85::acc(s22, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.88

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(smerch, shape, tapered_directional).
measured(s16, shape, tapered_directional).
measured(s22, shape, tapered_directional).

all_consistent(shape) :-
    (indep(smerch), consistent(smerch, shape) ; \+indep(smerch)),
    (indep(s16), consistent(s16, shape) ; \+indep(s16)),
    (indep(s22), consistent(s22, shape) ; \+indep(s22)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

0.88::acc(s1, shape_description).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values longer_nose_directional=Longer_nose_pop_in_tail_float_control unk_shape_description=Unknown
% @importance 0.85

0.88::true_val(shape_description, longer_nose_directional); 0.12::true_val(shape_description, unk_shape_description).

measured(s1, shape_description, longer_nose_directional).

all_consistent(shape_description) :-
    (indep(s1), consistent(s1, shape_description) ; \+indep(s1)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, longer_nose_directional)).
query(true_val(shape_description, unk_shape_description)).

0.88::acc(s22, shape_detail).

% @attr shape_detail
% @type categorical
% @canonical false
% @original_name Shape detail
% @values freeride_directional=Freeride_Directional unk_shape_detail=Unknown
% @importance 0.88

0.88::true_val(shape_detail, freeride_directional); 0.12::true_val(shape_detail, unk_shape_detail).

measured(s22, shape_detail, freeride_directional).

all_consistent(shape_detail) :-
    (indep(s22), consistent(s22, shape_detail) ; \+indep(s22)).

evidence(all_consistent(shape_detail)).
query(true_val(shape_detail, freeride_directional)).
query(true_val(shape_detail, unk_shape_detail)).

0.90::acc(smerch, camber_type).
0.88::acc(s1, camber_type).
0.88::acc(s3, camber_type).
0.85::acc(s16, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_flat_top=Directional_Flat_Top unk_camber_type=Unknown
% @importance 0.90

0.97::true_val(camber_type, directional_flat_top); 0.03::true_val(camber_type, unk_camber_type).

measured(smerch, camber_type, directional_flat_top).
measured(s1, camber_type, directional_flat_top).
measured(s3, camber_type, directional_flat_top).
measured(s16, camber_type, directional_flat_top).

all_consistent(camber_type) :-
    (indep(smerch), consistent(smerch, camber_type) ; \+indep(smerch)),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)),
    (indep(s3), consistent(s3, camber_type) ; \+indep(s3)),
    (indep(s16), consistent(s16, camber_type) ; \+indep(s16)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_flat_top)).
query(true_val(camber_type, unk_camber_type)).

0.90::acc(s1, camber_description).
0.88::acc(s3, camber_description).
0.85::acc(s6, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values flat_between_feet_rocker_tips=Flat_between_feet_rocker_nose_tail unk_camber_description=Unknown
% @importance 0.83

0.95::true_val(camber_description, flat_between_feet_rocker_tips); 0.05::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, flat_between_feet_rocker_tips).
measured(s3, camber_description, flat_between_feet_rocker_tips).
measured(s6, camber_description, flat_between_feet_rocker_tips).

all_consistent(camber_description) :-
    (indep(s1), consistent(s1, camber_description) ; \+indep(s1)),
    (indep(s3), consistent(s3, camber_description) ; \+indep(s3)),
    (indep(s6), consistent(s6, camber_description) ; \+indep(s6)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_between_feet_rocker_tips)).
query(true_val(camber_description, unk_camber_description)).

0.88::acc(s22, taper).
0.82::acc(s41, taper).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v12=12.0 unk_taper=Unknown
% @importance 0.86

0.95::true_val(taper, v12); 0.05::true_val(taper, unk_taper).

measured(s22, taper, v12).
measured(s41, taper, v12).

all_consistent(taper) :-
    (indep(s22), consistent(s22, taper) ; \+indep(s22)),
    consistent(s41, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v12)).
query(true_val(taper, unk_taper)).

0.90::acc(smerch, setback).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values vm37_5=-37.5 unk_setback=Unknown
% @importance 0.85

0.92::true_val(setback, vm37_5); 0.08::true_val(setback, unk_setback).

measured(smerch, setback, vm37_5).

all_consistent(setback) :-
    consistent(smerch, setback).

evidence(all_consistent(setback)).
query(true_val(setback, vm37_5)).
query(true_val(setback, unk_setback)).

0.88::acc(s3, balanced_freeride_geometry).

% @attr balanced_freeride_geometry
% @type categorical
% @canonical false
% @original_name Balanced Freeride Geometry
% @values bfg_setback_centered_sidecut=Setback_camber_centered_sidecut_twin_feel unk_balanced_freeride_geometry=Unknown
% @importance 0.90

0.88::true_val(balanced_freeride_geometry, bfg_setback_centered_sidecut); 0.12::true_val(balanced_freeride_geometry, unk_balanced_freeride_geometry).

measured(s3, balanced_freeride_geometry, bfg_setback_centered_sidecut).

all_consistent(balanced_freeride_geometry) :-
    (indep(s3), consistent(s3, balanced_freeride_geometry) ; \+indep(s3)).

evidence(all_consistent(balanced_freeride_geometry)).
query(true_val(balanced_freeride_geometry, bfg_setback_centered_sidecut)).
query(true_val(balanced_freeride_geometry, unk_balanced_freeride_geometry)).

0.90::acc(smerch, flex_rating_10).
0.85::acc(s6, flex_rating_10).
0.60::acc(s1, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6=6.0 v6_9=6.0-9.0
% @importance 0.85

0.80::true_val(flex_rating_10, v6); 0.20::true_val(flex_rating_10, v6_9).

measured(smerch, flex_rating_10, v6).
measured(s6, flex_rating_10, v6).
measured(s1, flex_rating_10, v6_9).

all_consistent(flex_rating_10) :-
    consistent(smerch, flex_rating_10),
    (indep(s6), consistent(s6, flex_rating_10) ; \+indep(s6)),
    (indep(s1), consistent(s1, flex_rating_10) ; \+indep(s1)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, v6_9)).

0.88::acc(s3, flex_direction).
0.88::acc(s22, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name Flex direction
% @values twin_flex=Twin_Flex unk_flex_direction=Unknown
% @importance 0.89

0.95::true_val(flex_direction, twin_flex); 0.05::true_val(flex_direction, unk_flex_direction).

measured(s3, flex_direction, twin_flex).
measured(s22, flex_direction, twin_flex).

all_consistent(flex_direction) :-
    (indep(s3), consistent(s3, flex_direction) ; \+indep(s3)),
    (indep(s22), consistent(s22, flex_direction) ; \+indep(s22)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

0.85::acc(s3, flex_feel).
0.85::acc(s16, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name Flex feel
% @values medium=Medium unk_flex_feel=Unknown
% @importance 0.92

0.92::true_val(flex_feel, medium); 0.08::true_val(flex_feel, unk_flex_feel).

measured(s3, flex_feel, medium).
measured(s16, flex_feel, medium).

all_consistent(flex_feel) :-
    (indep(s3), consistent(s3, flex_feel) ; \+indep(s3)),
    (indep(s16), consistent(s16, flex_feel) ; \+indep(s16)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, unk_flex_feel)).

0.90::acc(smerch, core_material).
0.85::acc(s6, core_material).
0.85::acc(s32, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values dragonfly_ii_500g=Dragonfly_II_500G unk_core_material=Unknown
% @importance 0.85

0.95::true_val(core_material, dragonfly_ii_500g); 0.05::true_val(core_material, unk_core_material).

measured(smerch, core_material, dragonfly_ii_500g).
measured(s6, core_material, dragonfly_ii_500g).
measured(s32, core_material, dragonfly_ii_500g).

all_consistent(core_material) :-
    (indep(smerch), consistent(smerch, core_material) ; \+indep(smerch)),
    (indep(s6), consistent(s6, core_material) ; \+indep(s6)),
    (indep(s32), consistent(s32, core_material) ; \+indep(s32)).

evidence(all_consistent(core_material)).
query(true_val(core_material, dragonfly_ii_500g)).
query(true_val(core_material, unk_core_material)).

0.88::acc(s31, core_description).
0.85::acc(s32, core_description).

% @attr core_description
% @type categorical
% @canonical false
% @original_name Core description
% @values lightest_core_carbon_laminations=Lightest_core_ever_carbon_laminations_pop_performance unk_core_description=Unknown
% @importance 0.81

0.90::true_val(core_description, lightest_core_carbon_laminations); 0.10::true_val(core_description, unk_core_description).

measured(s31, core_description, lightest_core_carbon_laminations).
measured(s32, core_description, lightest_core_carbon_laminations).

all_consistent(core_description) :-
    (indep(s32), consistent(s32, core_description) ; \+indep(s32)),
    consistent(s31, core_description).

evidence(all_consistent(core_description)).
query(true_val(core_description, lightest_core_carbon_laminations)).
query(true_val(core_description, unk_core_description)).

0.88::acc(s1, core_zones).

% @attr core_zones
% @type categorical
% @canonical false
% @original_name Core zones
% @values multizone_egd=Multizone_EGD unk_core_zones=Unknown
% @importance 0.85

0.88::true_val(core_zones, multizone_egd); 0.12::true_val(core_zones, unk_core_zones).

measured(s1, core_zones, multizone_egd).

all_consistent(core_zones) :-
    (indep(s1), consistent(s1, core_zones) ; \+indep(s1)).

evidence(all_consistent(core_zones)).
query(true_val(core_zones, multizone_egd)).
query(true_val(core_zones, unk_core_zones)).

0.88::acc(s3, core_profiling).

% @attr core_profiling
% @type categorical
% @canonical false
% @original_name Core profiling
% @values squeezebox=Squeezebox unk_core_profiling=Unknown
% @importance 0.90

0.88::true_val(core_profiling, squeezebox); 0.12::true_val(core_profiling, unk_core_profiling).

measured(s3, core_profiling, squeezebox).

all_consistent(core_profiling) :-
    (indep(s3), consistent(s3, core_profiling) ; \+indep(s3)).

evidence(all_consistent(core_profiling)).
query(true_val(core_profiling, squeezebox)).
query(true_val(core_profiling, unk_core_profiling)).

0.88::acc(s3, core_carbon_reinforcement).

% @attr core_carbon_reinforcement
% @type categorical
% @canonical false
% @original_name Core carbon reinforcement
% @values power_mystery_core=Power_Mystery_Core unk_core_carbon_reinforcement=Unknown
% @importance 0.90

0.88::true_val(core_carbon_reinforcement, power_mystery_core); 0.12::true_val(core_carbon_reinforcement, unk_core_carbon_reinforcement).

measured(s3, core_carbon_reinforcement, power_mystery_core).

all_consistent(core_carbon_reinforcement) :-
    (indep(s3), consistent(s3, core_carbon_reinforcement) ; \+indep(s3)).

evidence(all_consistent(core_carbon_reinforcement)).
query(true_val(core_carbon_reinforcement, power_mystery_core)).
query(true_val(core_carbon_reinforcement, unk_core_carbon_reinforcement)).

0.90::acc(smerch, laminate).
0.85::acc(s6, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values mystery_glass=Mystery_Glass unk_laminate=Unknown
% @importance 0.85

0.95::true_val(laminate, mystery_glass); 0.05::true_val(laminate, unk_laminate).

measured(smerch, laminate, mystery_glass).
measured(s6, laminate, mystery_glass).

all_consistent(laminate) :-
    (indep(smerch), consistent(smerch, laminate) ; \+indep(smerch)),
    (indep(s6), consistent(s6, laminate) ; \+indep(s6)).

evidence(all_consistent(laminate)).
query(true_val(laminate, mystery_glass)).
query(true_val(laminate, unk_laminate)).

0.85::acc(s6, mystery_glass_description).
0.82::acc(s32, mystery_glass_description).

% @attr mystery_glass_description
% @type categorical
% @canonical false
% @original_name Mystery Glass description
% @values custom_carbon_fiberglass=Custom_blend_fiberglass_carbon_fiber unk_mystery_glass_description=Unknown
% @importance 0.81

0.88::true_val(mystery_glass_description, custom_carbon_fiberglass); 0.12::true_val(mystery_glass_description, unk_mystery_glass_description).

measured(s6, mystery_glass_description, custom_carbon_fiberglass).
measured(s32, mystery_glass_description, custom_carbon_fiberglass).

all_consistent(mystery_glass_description) :-
    (indep(s6), consistent(s6, mystery_glass_description) ; \+indep(s6)),
    (indep(s32), consistent(s32, mystery_glass_description) ; \+indep(s32)).

evidence(all_consistent(mystery_glass_description)).
query(true_val(mystery_glass_description, custom_carbon_fiberglass)).
query(true_val(mystery_glass_description, unk_mystery_glass_description)).

0.90::acc(smerch, base_material).
0.88::acc(s13, base_material).
0.85::acc(s3, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values methlon=Methlon unk_base_material=Unknown
% @importance 0.87

0.95::true_val(base_material, methlon); 0.05::true_val(base_material, unk_base_material).

measured(smerch, base_material, methlon).
measured(s13, base_material, methlon).
measured(s3, base_material, methlon).

all_consistent(base_material) :-
    (indep(smerch), consistent(smerch, base_material) ; \+indep(smerch)),
    (indep(s13), consistent(s13, base_material) ; \+indep(s13)),
    (indep(s3), consistent(s3, base_material) ; \+indep(s3)).

evidence(all_consistent(base_material)).
query(true_val(base_material, methlon)).
query(true_val(base_material, unk_base_material)).

0.90::acc(smerch, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_highest=Sintered_highest_grade unk_base_type=Unknown
% @importance 0.85

0.92::true_val(base_type, sintered_highest); 0.08::true_val(base_type, unk_base_type).

measured(smerch, base_type, sintered_highest).

all_consistent(base_type) :-
    consistent(smerch, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_highest)).
query(true_val(base_type, unk_base_type)).

0.90::acc(s1, edge_technology).
0.88::acc(s41, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges unk_edge_technology=Unknown
% @importance 0.86

0.95::true_val(edge_technology, frostbite_edges); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, frostbite_edges).
measured(s41, edge_technology, frostbite_edges).

all_consistent(edge_technology) :-
    (indep(s1), consistent(s1, edge_technology) ; \+indep(s1)),
    consistent(s41, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_technology)).

0.90::acc(smerch, mounting_pattern).
0.90::acc(s33, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel unk_mounting_pattern=Unknown
% @importance 0.77

0.97::true_val(mounting_pattern, the_channel); 0.03::true_val(mounting_pattern, unk_mounting_pattern).

measured(smerch, mounting_pattern, the_channel).
measured(s33, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    consistent(smerch, mounting_pattern),
    consistent(s33, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.85::acc(s32, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_major_best_est=All_major_bindings_best_with_Burton_EST unk_binding_compatibility=Unknown
% @importance 0.78

0.88::true_val(binding_compatibility, all_major_best_est); 0.12::true_val(binding_compatibility, unk_binding_compatibility).

measured(s32, binding_compatibility, all_major_best_est).

all_consistent(binding_compatibility) :-
    (indep(s32), consistent(s32, binding_compatibility) ; \+indep(s32)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_major_best_est)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.90::acc(s33, channel_material).

% @attr channel_material
% @type categorical
% @canonical false
% @original_name Channel material
% @values aircraft_grade_aluminum=Aircraft_grade_aluminum unk_channel_material=Unknown
% @importance 0.70

0.90::true_val(channel_material, aircraft_grade_aluminum); 0.10::true_val(channel_material, unk_channel_material).

measured(s33, channel_material, aircraft_grade_aluminum).

all_consistent(channel_material) :-
    consistent(s33, channel_material).

evidence(all_consistent(channel_material)).
query(true_val(channel_material, aircraft_grade_aluminum)).
query(true_val(channel_material, unk_channel_material)).

0.90::acc(smerch, resin).
0.88::acc(s3, resin).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy unk_resin=Unknown
% @importance 0.87

0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).

measured(smerch, resin, super_sap_epoxy).
measured(s3, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(smerch), consistent(smerch, resin) ; \+indep(smerch)),
    (indep(s3), consistent(s3, resin) ; \+indep(s3)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

0.90::acc(smerch, flex_retention).
0.88::acc(s3, flex_retention).

% @attr flex_retention
% @type categorical
% @canonical false
% @original_name Flex retention
% @values infinite_ride=Infinite_Ride unk_flex_retention=Unknown
% @importance 0.87

0.95::true_val(flex_retention, infinite_ride); 0.05::true_val(flex_retention, unk_flex_retention).

measured(smerch, flex_retention, infinite_ride).
measured(s3, flex_retention, infinite_ride).

all_consistent(flex_retention) :-
    (indep(smerch), consistent(smerch, flex_retention) ; \+indep(smerch)),
    (indep(s3), consistent(s3, flex_retention) ; \+indep(s3)).

evidence(all_consistent(flex_retention)).
query(true_val(flex_retention, infinite_ride)).
query(true_val(flex_retention, unk_flex_retention)).

0.88::acc(s1, tip_tail_design).

% @attr tip_tail_design
% @type categorical
% @canonical false
% @original_name Tip/tail design
% @values pro_tip=Pro_Tip_tapered_reduces_swing_weight unk_tip_tail_design=Unknown
% @importance 0.85

0.88::true_val(tip_tail_design, pro_tip); 0.12::true_val(tip_tail_design, unk_tip_tail_design).

measured(s1, tip_tail_design, pro_tip).

all_consistent(tip_tail_design) :-
    (indep(s1), consistent(s1, tip_tail_design) ; \+indep(s1)).

evidence(all_consistent(tip_tail_design)).
query(true_val(tip_tail_design, pro_tip)).
query(true_val(tip_tail_design, unk_tip_tail_design)).

0.90::acc(s16, available_sizes).
0.88::acc(s1, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s145_150_155_160=145_150_155_160cm unk_available_sizes=Unknown
% @importance 0.90

0.95::true_val(available_sizes, s145_150_155_160); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s16, available_sizes, s145_150_155_160).
measured(s1, available_sizes, s145_150_155_160).

all_consistent(available_sizes) :-
    (indep(s16), consistent(s16, available_sizes) ; \+indep(s16)),
    (indep(s1), consistent(s1, available_sizes) ; \+indep(s1)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s145_150_155_160)).
query(true_val(available_sizes, unk_available_sizes)).

0.88::acc(s16, effective_edge_145).

% @attr effective_edge_145
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 145cm
% @values v1075=1075.0
% @importance 0.95

0.90::true_val(effective_edge_145, v1075); 0.10::true_val(effective_edge_145, unk_effective_edge_145).

measured(s16, effective_edge_145, v1075).

all_consistent(effective_edge_145) :-
    (indep(s16), consistent(s16, effective_edge_145) ; \+indep(s16)).

evidence(all_consistent(effective_edge_145)).
query(true_val(effective_edge_145, v1075)).
query(true_val(effective_edge_145, unk_effective_edge_145)).

0.88::acc(s16, effective_edge_150).

% @attr effective_edge_150
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 150cm
% @values v1125=1125.0
% @importance 0.95

0.90::true_val(effective_edge_150, v1125); 0.10::true_val(effective_edge_150, unk_effective_edge_150).

measured(s16, effective_edge_150, v1125).

all_consistent(effective_edge_150) :-
    (indep(s16), consistent(s16, effective_edge_150) ; \+indep(s16)).

evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v1125)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

0.88::acc(s16, effective_edge_155).

% @attr effective_edge_155
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 155cm
% @values v1175=1175.0
% @importance 0.95

0.90::true_val(effective_edge_155, v1175); 0.10::true_val(effective_edge_155, unk_effective_edge_155).

measured(s16, effective_edge_155, v1175).

all_consistent(effective_edge_155) :-
    (indep(s16), consistent(s16, effective_edge_155) ; \+indep(s16)).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v1175)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

0.88::acc(s16, effective_edge_160).

% @attr effective_edge_160
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 160cm
% @values v1225=1225.0
% @importance 0.95

0.90::true_val(effective_edge_160, v1225); 0.10::true_val(effective_edge_160, unk_effective_edge_160).

measured(s16, effective_edge_160, v1225).

all_consistent(effective_edge_160) :-
    (indep(s16), consistent(s16, effective_edge_160) ; \+indep(s16)).

evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v1225)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

0.88::acc(s16, sidecut_radius_size_145).

% @attr sidecut_radius_size_145
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 145cm
% @values v6_7=6.7
% @importance 0.95

0.90::true_val(sidecut_radius_size_145, v6_7); 0.10::true_val(sidecut_radius_size_145, unk_sidecut_radius_size_145).

measured(s16, sidecut_radius_size_145, v6_7).

all_consistent(sidecut_radius_size_145) :-
    (indep(s16), consistent(s16, sidecut_radius_size_145) ; \+indep(s16)).

evidence(all_consistent(sidecut_radius_size_145)).
query(true_val(sidecut_radius_size_145, v6_7)).
query(true_val(sidecut_radius_size_145, unk_sidecut_radius_size_145)).

0.88::acc(s16, sidecut_radius_size_150).

% @attr sidecut_radius_size_150
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 150cm
% @values v7_0=7.0
% @importance 0.95

0.90::true_val(sidecut_radius_size_150, v7_0); 0.10::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).

measured(s16, sidecut_radius_size_150, v7_0).

all_consistent(sidecut_radius_size_150) :-
    (indep(s16), consistent(s16, sidecut_radius_size_150) ; \+indep(s16)).

evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v7_0)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

0.88::acc(s16, sidecut_radius_size).
0.85::acc(s34, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size 155cm
% @values v7_4=7.4 unk_sidecut_radius_size=Unknown
% @importance 0.90

0.95::true_val(sidecut_radius_size, v7_4); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s16, sidecut_radius_size, v7_4).
measured(s34, sidecut_radius_size, v7_4).

all_consistent(sidecut_radius_size) :-
    (indep(s16), consistent(s16, sidecut_radius_size) ; \+indep(s16)),
    (indep(s34), consistent(s34, sidecut_radius_size) ; \+indep(s34)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_4)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.88::acc(s16, sidecut_radius_size_160).

% @attr sidecut_radius_size_160
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size 160cm
% @values v7_7=7.7
% @importance 0.95

0.90::true_val(sidecut_radius_size_160, v7_7); 0.10::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).

measured(s16, sidecut_radius_size_160, v7_7).

all_consistent(sidecut_radius_size_160) :-
    (indep(s16), consistent(s16, sidecut_radius_size_160) ; \+indep(s16)).

evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v7_7)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

0.88::acc(s16, waist_width_145).

% @attr waist_width_145
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 145cm
% @values v241=241.0
% @importance 0.95

0.90::true_val(waist_width_145, v241); 0.10::true_val(waist_width_145, unk_waist_width_145).

measured(s16, waist_width_145, v241).

all_consistent(waist_width_145) :-
    (indep(s16), consistent(s16, waist_width_145) ; \+indep(s16)).

evidence(all_consistent(waist_width_145)).
query(true_val(waist_width_145, v241)).
query(true_val(waist_width_145, unk_waist_width_145)).

0.88::acc(s16, waist_width_150).

% @attr waist_width_150
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 150cm
% @values v243=243.0
% @importance 0.95

0.90::true_val(waist_width_150, v243); 0.10::true_val(waist_width_150, unk_waist_width_150).

measured(s16, waist_width_150, v243).

all_consistent(waist_width_150) :-
    (indep(s16), consistent(s16, waist_width_150) ; \+indep(s16)).

evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v243)).
query(true_val(waist_width_150, unk_waist_width_150)).

0.88::acc(s16, waist_width_155).
0.85::acc(s34, waist_width_155).

% @attr waist_width_155
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 155cm
% @values v249=249.0 unk_waist_width_155=Unknown
% @importance 0.90

0.95::true_val(waist_width_155, v249); 0.05::true_val(waist_width_155, unk_waist_width_155).

measured(s16, waist_width_155, v249).
measured(s34, waist_width_155, v249).

all_consistent(waist_width_155) :-
    (indep(s16), consistent(s16, waist_width_155) ; \+indep(s16)),
    (indep(s34), consistent(s34, waist_width_155) ; \+indep(s34)).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v249)).
query(true_val(waist_width_155, unk_waist_width_155)).

0.88::acc(s16, waist_width_160).

% @attr waist_width_160
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 160cm
% @values v255=255.0
% @importance 0.95

0.90::true_val(waist_width_160, v255); 0.10::true_val(waist_width_160, unk_waist_width_160).

measured(s16, waist_width_160, v255).

all_consistent(waist_width_160) :-
    (indep(s16), consistent(s16, waist_width_160) ; \+indep(s16)).

evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v255)).
query(true_val(waist_width_160, unk_waist_width_160)).

0.88::acc(s16, tip_tail_width_size).
0.85::acc(s34, tip_tail_width_size).

% @attr tip_tail_width_size
% @type categorical
% @unit mm
% @canonical true
% @original_name tip_tail_width_size 155cm
% @values v298_3_286_3=298.3/286.3 unk_tip_tail_width_size=Unknown
% @importance 0.90

0.95::true_val(tip_tail_width_size, v298_3_286_3); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s16, tip_tail_width_size, v298_3_286_3).
measured(s34, tip_tail_width_size, v298_3_286_3).

all_consistent(tip_tail_width_size) :-
    (indep(s16), consistent(s16, tip_tail_width_size) ; \+indep(s16)),
    (indep(s34), consistent(s34, tip_tail_width_size) ; \+indep(s34)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v298_3_286_3)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.88::acc(s16, tip_tail_width_size_145).

% @attr tip_tail_width_size_145
% @type categorical
% @unit mm
% @canonical false
% @original_name tip_tail_width_size 145cm
% @values v286_5_274_5=286.5/274.5 unk_tip_tail_width_size_145=Unknown
% @importance 0.95

0.90::true_val(tip_tail_width_size_145, v286_5_274_5); 0.10::true_val(tip_tail_width_size_145, unk_tip_tail_width_size_145).

measured(s16, tip_tail_width_size_145, v286_5_274_5).

all_consistent(tip_tail_width_size_145) :-
    (indep(s16), consistent(s16, tip_tail_width_size_145) ; \+indep(s16)).

evidence(all_consistent(tip_tail_width_size_145)).
query(true_val(tip_tail_width_size_145, v286_5_274_5)).
query(true_val(tip_tail_width_size_145, unk_tip_tail_width_size_145)).

0.88::acc(s16, tip_tail_width_size_150).

% @attr tip_tail_width_size_150
% @type categorical
% @unit mm
% @canonical false
% @original_name tip_tail_width_size 150cm
% @values v290_4_278_4=290.4/278.4 unk_tip_tail_width_size_150=Unknown
% @importance 0.95

0.90::true_val(tip_tail_width_size_150, v290_4_278_4); 0.10::true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150).

measured(s16, tip_tail_width_size_150, v290_4_278_4).

all_consistent(tip_tail_width_size_150) :-
    (indep(s16), consistent(s16, tip_tail_width_size_150) ; \+indep(s16)).

evidence(all_consistent(tip_tail_width_size_150)).
query(true_val(tip_tail_width_size_150, v290_4_278_4)).
query(true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150)).

0.88::acc(s16, tip_tail_width_size_160).

% @attr tip_tail_width_size_160
% @type categorical
% @unit mm
% @canonical false
% @original_name tip_tail_width_size 160cm
% @values v306_2_294_2=306.2/294.2 unk_tip_tail_width_size_160=Unknown
% @importance 0.95

0.90::true_val(tip_tail_width_size_160, v306_2_294_2); 0.10::true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160).

measured(s16, tip_tail_width_size_160, v306_2_294_2).

all_consistent(tip_tail_width_size_160) :-
    (indep(s16), consistent(s16, tip_tail_width_size_160) ; \+indep(s16)).

evidence(all_consistent(tip_tail_width_size_160)).
query(true_val(tip_tail_width_size_160, v306_2_294_2)).
query(true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160)).

0.88::acc(s16, stance_width_range_size_145).

% @attr stance_width_range_size_145
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size 145cm
% @values v505=505.0 unk_stance_width_range_size_145=Unknown
% @importance 0.95

0.90::true_val(stance_width_range_size_145, v505); 0.10::true_val(stance_width_range_size_145, unk_stance_width_range_size_145).

measured(s16, stance_width_range_size_145, v505).

all_consistent(stance_width_range_size_145) :-
    (indep(s16), consistent(s16, stance_width_range_size_145) ; \+indep(s16)).

evidence(all_consistent(stance_width_range_size_145)).
query(true_val(stance_width_range_size_145, v505)).
query(true_val(stance_width_range_size_145, unk_stance_width_range_size_145)).

0.88::acc(s16, stance_width_range_size_150).

% @attr stance_width_range_size_150
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size 150cm
% @values v530=530.0 unk_stance_width_range_size_150=Unknown
% @importance 0.95

0.90::true_val(stance_width_range_size_150, v530); 0.10::true_val(stance_width_range_size_150, unk_stance_width_range_size_150).

measured(s16, stance_width_range_size_150, v530).

all_consistent(stance_width_range_size_150) :-
    (indep(s16), consistent(s16, stance_width_range_size_150) ; \+indep(s16)).

evidence(all_consistent(stance_width_range_size_150)).
query(true_val(stance_width_range_size_150, v530)).
query(true_val(stance_width_range_size_150, unk_stance_width_range_size_150)).

0.88::acc(s16, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit mm
% @canonical true
% @original_name stance_width_range_size 155cm
% @values v560=560.0 unk_stance_width_range_size=Unknown
% @importance 0.95

0.90::true_val(stance_width_range_size, v560); 0.10::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s16, stance_width_range_size, v560).

all_consistent(stance_width_range_size) :-
    (indep(s16), consistent(s16, stance_width_range_size) ; \+indep(s16)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v560)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.88::acc(s16, stance_width_range_size_160).

% @attr stance_width_range_size_160
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size 160cm
% @values v560=560.0 unk_stance_width_range_size_160=Unknown
% @importance 0.95

0.90::true_val(stance_width_range_size_160, v560); 0.10::true_val(stance_width_range_size_160, unk_stance_width_range_size_160).

measured(s16, stance_width_range_size_160, v560).

all_consistent(stance_width_range_size_160) :-
    (indep(s16), consistent(s16, stance_width_range_size_160) ; \+indep(s16)).

evidence(all_consistent(stance_width_range_size_160)).
query(true_val(stance_width_range_size_160, v560)).
query(true_val(stance_width_range_size_160, unk_stance_width_range_size_160)).

0.88::acc(s16, recommended_weight_range_size_145).

% @attr recommended_weight_range_size_145
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 145cm
% @values r45_68=45-68kg unk_recommended_weight_range_size_145=Unknown
% @importance 0.95

0.90::true_val(recommended_weight_range_size_145, r45_68); 0.10::true_val(recommended_weight_range_size_145, unk_recommended_weight_range_size_145).

measured(s16, recommended_weight_range_size_145, r45_68).

all_consistent(recommended_weight_range_size_145) :-
    (indep(s16), consistent(s16, recommended_weight_range_size_145) ; \+indep(s16)).

evidence(all_consistent(recommended_weight_range_size_145)).
query(true_val(recommended_weight_range_size_145, r45_68)).
query(true_val(recommended_weight_range_size_145, unk_recommended_weight_range_size_145)).

0.88::acc(s16, recommended_weight_range_size_150).

% @attr recommended_weight_range_size_150
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 150cm
% @values r54_82=54-82kg unk_recommended_weight_range_size_150=Unknown
% @importance 0.95

0.90::true_val(recommended_weight_range_size_150, r54_82); 0.10::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).

measured(s16, recommended_weight_range_size_150, r54_82).

all_consistent(recommended_weight_range_size_150) :-
    (indep(s16), consistent(s16, recommended_weight_range_size_150) ; \+indep(s16)).

evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, r54_82)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

0.88::acc(s16, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size 155cm
% @values r54_82=54-82kg unk_recommended_weight_range_size=Unknown
% @importance 0.95

0.90::true_val(recommended_weight_range_size, r54_82); 0.10::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s16, recommended_weight_range_size, r54_82).

all_consistent(recommended_weight_range_size) :-
    (indep(s16), consistent(s16, recommended_weight_range_size) ; \+indep(s16)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r54_82)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.88::acc(s16, recommended_weight_range_size_160).

% @attr recommended_weight_range_size_160
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size 160cm
% @values r82_118plus=82-118+kg unk_recommended_weight_range_size_160=Unknown
% @importance 0.95

0.90::true_val(recommended_weight_range_size_160, r82_118plus); 0.10::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).

measured(s16, recommended_weight_range_size_160, r82_118plus).

all_consistent(recommended_weight_range_size_160) :-
    (indep(s16), consistent(s16, recommended_weight_range_size_160) ; \+indep(s16)).

evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, r82_118plus)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

0.90::acc(s35, warranty_period_years).
0.88::acc(s16, warranty_period_years).
0.95::acc(s36, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v3=3 unk_warranty_period_years=Unknown
% @importance 0.81

0.97::true_val(warranty_period_years, v3); 0.03::true_val(warranty_period_years, unk_warranty_period_years).

measured(s35, warranty_period_years, v3).
measured(s16, warranty_period_years, v3).
measured(s36, warranty_period_years, v3).

all_consistent(warranty_period_years) :-
    (indep(s35), consistent(s35, warranty_period_years) ; \+indep(s35)),
    (indep(s16), consistent(s16, warranty_period_years) ; \+indep(s16)),
    consistent(s36, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v3)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.95::acc(s36, warranty_policy_detail).

% @attr warranty_policy_detail
% @type categorical
% @canonical false
% @original_name Warranty policy detail
% @values repair_replace_3yr=Repair_or_replace_3yr_from_purchase_authorized_dealer unk_warranty_policy_detail=Unknown
% @importance 0.75

0.95::true_val(warranty_policy_detail, repair_replace_3yr); 0.05::true_val(warranty_policy_detail, unk_warranty_policy_detail).

measured(s36, warranty_policy_detail, repair_replace_3yr).

all_consistent(warranty_policy_detail) :-
    consistent(s36, warranty_policy_detail).

evidence(all_consistent(warranty_policy_detail)).
query(true_val(warranty_policy_detail, repair_replace_3yr)).
query(true_val(warranty_policy_detail, unk_warranty_policy_detail)).

0.95::acc(s36, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values authorized_dealers_original_purchaser=Authorized_dealers_only_original_purchaser_no_eBay unk_warranty=Unknown
% @importance 0.75

0.95::true_val(warranty, authorized_dealers_original_purchaser); 0.05::true_val(warranty, unk_warranty).

measured(s36, warranty, authorized_dealers_original_purchaser).

all_consistent(warranty) :-
    consistent(s36, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, authorized_dealers_original_purchaser)).
query(true_val(warranty, unk_warranty)).

0.90::acc(smerch, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name Price AUD merchant
% @values v1539_99=1539.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.92::true_val(price_aud_merchant, v1539_99); 0.08::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(smerch, price_aud_merchant, v1539_99).

all_consistent(price_aud_merchant) :-
    consistent(smerch, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1539_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.88::acc(s22, price_cad_comor).

% @attr price_cad_comor
% @type numeric
% @unit CAD
% @canonical false
% @original_name Price (CAD, Comor Sports)
% @values v1415_99=1415.99 unk_price_cad_comor=Unknown
% @importance 0.88

0.88::true_val(price_cad_comor, v1415_99); 0.12::true_val(price_cad_comor, unk_price_cad_comor).

measured(s22, price_cad_comor, v1415_99).

all_consistent(price_cad_comor) :-
    consistent(s22, price_cad_comor).

evidence(all_consistent(price_cad_comor)).
query(true_val(price_cad_comor, v1415_99)).
query(true_val(price_cad_comor, unk_price_cad_comor)).

0.88::acc(s22, price_cad_rrp).
0.85::acc(s11, price_cad_rrp).

% @attr price_cad_rrp
% @type numeric
% @unit CAD
% @canonical false
% @original_name Price (CAD RRP)
% @values v2359_99=2359.99 unk_price_cad_rrp=Unknown
% @importance 0.86

0.93::true_val(price_cad_rrp, v2359_99); 0.07::true_val(price_cad_rrp, unk_price_cad_rrp).

measured(s22, price_cad_rrp, v2359_99).
measured(s11, price_cad_rrp, v2359_99).

all_consistent(price_cad_rrp) :-
    consistent(s22, price_cad_rrp),
    consistent(s11, price_cad_rrp).

evidence(all_consistent(price_cad_rrp)).
query(true_val(price_cad_rrp, v2359_99)).
query(true_val(price_cad_rrp, unk_price_cad_rrp)).

0.85::acc(s11, price_cad_pacific_boarder).

% @attr price_cad_pacific_boarder
% @type numeric
% @unit CAD
% @canonical false
% @original_name Price (CAD, Pacific Boarder)
% @values v1651_99=1651.99 unk_price_cad_pacific_boarder=Unknown
% @importance 0.85

0.85::true_val(price_cad_pacific_boarder, v1651_99); 0.15::true_val(price_cad_pacific_boarder, unk_price_cad_pacific_boarder).

measured(s11, price_cad_pacific_boarder, v1651_99).

all_consistent(price_cad_pacific_boarder) :-
    consistent(s11, price_cad_pacific_boarder).

evidence(all_consistent(price_cad_pacific_boarder)).
query(true_val(price_cad_pacific_boarder, v1651_99)).
query(true_val(price_cad_pacific_boarder, unk_price_cad_pacific_boarder)).

0.88::acc(s6, price_usd_the_source).

% @attr price_usd_the_source
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD, The Source)
% @values v1043=1043.0 unk_price_usd_the_source=Unknown
% @importance 0.93

0.88::true_val(price_usd_the_source, v1043); 0.12::true_val(price_usd_the_source, unk_price_usd_the_source).

measured(s6, price_usd_the_source, v1043).

all_consistent(price_usd_the_source) :-
    consistent(s6, price_usd_the_source).

evidence(all_consistent(price_usd_the_source)).
query(true_val(price_usd_the_source, v1043)).
query(true_val(price_usd_the_source, unk_price_usd_the_source)).

0.88::acc(s6, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v1738=1738.0 unk_price_usd_msrp=Unknown
% @importance 0.93

0.88::true_val(price_usd_msrp, v1738); 0.12::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s6, price_usd_msrp, v1738).

all_consistent(price_usd_msrp) :-
    consistent(s6, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v1738)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.90::acc(smerch, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values sold_out=Sold_out unk_availability_status=Unknown
% @importance 0.85

0.92::true_val(availability_status, sold_out); 0.08::true_val(availability_status, unk_availability_status).

measured(smerch, availability_status, sold_out).

all_consistent(availability_status) :-
    consistent(smerch, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, sold_out)).
query(true_val(availability_status, unk_availability_status)).

0.85::acc(s2, availability_status_burton).

% @attr availability_status_burton
% @type categorical
% @canonical false
% @original_name availability_status (Burton.com)
% @values sold_out=Sold_out unk_availability_status_burton=Unknown
% @importance 0.90

0.85::true_val(availability_status_burton, sold_out); 0.15::true_val(availability_status_burton, unk_availability_status_burton).

measured(s2, availability_status_burton, sold_out).

all_consistent(availability_status_burton) :-
    consistent(s2, availability_status_burton).

evidence(all_consistent(availability_status_burton)).
query(true_val(availability_status_burton, sold_out)).
query(true_val(availability_status_burton, unk_availability_status_burton)).

0.85::acc(s3, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values sold_out=Sold_out unk_availability_status_evo=Unknown
% @importance 0.90

0.85::true_val(availability_status_evo, sold_out); 0.15::true_val(availability_status_evo, unk_availability_status_evo).

measured(s3, availability_status_evo, sold_out).

all_consistent(availability_status_evo) :-
    consistent(s3, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, sold_out)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.88::acc(s16, availability_status_steep_and_cheap).

% @attr availability_status_steep_and_cheap
% @type categorical
% @canonical false
% @original_name availability_status (Steep and Cheap)
% @values sold_out=Sold_out unk_availability_status_steep_and_cheap=Unknown
% @importance 0.95

0.90::true_val(availability_status_steep_and_cheap, sold_out); 0.10::true_val(availability_status_steep_and_cheap, unk_availability_status_steep_and_cheap).

measured(s16, availability_status_steep_and_cheap, sold_out).

all_consistent(availability_status_steep_and_cheap) :-
    consistent(s16, availability_status_steep_and_cheap).

evidence(all_consistent(availability_status_steep_and_cheap)).
query(true_val(availability_status_steep_and_cheap, sold_out)).
query(true_val(availability_status_steep_and_cheap, unk_availability_status_steep_and_cheap)).

0.88::acc(s6, availability_status_the_source).

% @attr availability_status_the_source
% @type categorical
% @canonical false
% @original_name availability_status (The Source)
% @values all_sizes_sold_out=All_sizes_sold_out unk_availability_status_the_source=Unknown
% @importance 0.93

0.90::true_val(availability_status_the_source, all_sizes_sold_out); 0.10::true_val(availability_status_the_source, unk_availability_status_the_source).

measured(s6, availability_status_the_source, all_sizes_sold_out).

all_consistent(availability_status_the_source) :-
    consistent(s6, availability_status_the_source).

evidence(all_consistent(availability_status_the_source)).
query(true_val(availability_status_the_source, all_sizes_sold_out)).
query(true_val(availability_status_the_source, unk_availability_status_the_source)).

0.88::acc(s22, availability_status_comor).

% @attr availability_status_comor
% @type categorical
% @canonical false
% @original_name availability_status (Comor)
% @values sold_out=Sold_out unk_availability_status_comor=Unknown
% @importance 0.88

0.88::true_val(availability_status_comor, sold_out); 0.12::true_val(availability_status_comor, unk_availability_status_comor).

measured(s22, availability_status_comor, sold_out).

all_consistent(availability_status_comor) :-
    consistent(s22, availability_status_comor).

evidence(all_consistent(availability_status_comor)).
query(true_val(availability_status_comor, sold_out)).
query(true_val(availability_status_comor, unk_availability_status_comor)).

0.85::acc(s11, availability_status_pacific_boarder).

% @attr availability_status_pacific_boarder
% @type categorical
% @canonical false
% @original_name availability_status (Pacific Boarder)
% @values sold_out=Sold_out unk_availability_status_pacific_boarder=Unknown
% @importance 0.85

0.85::true_val(availability_status_pacific_boarder, sold_out); 0.15::true_val(availability_status_pacific_boarder, unk_availability_status_pacific_boarder).

measured(s11, availability_status_pacific_boarder, sold_out).

all_consistent(availability_status_pacific_boarder) :-
    consistent(s11, availability_status_pacific_boarder).

evidence(all_consistent(availability_status_pacific_boarder)).
query(true_val(availability_status_pacific_boarder, sold_out)).
query(true_val(availability_status_pacific_boarder, unk_availability_status_pacific_boarder)).

0.82::acc(s20, availability_status_balmoral).

% @attr availability_status_balmoral
% @type categorical
% @canonical false
% @original_name availability_status (Balmoral)
% @values listed_online=Listed_online unk_availability_status_balmoral=Unknown
% @importance 0.82

0.82::true_val(availability_status_balmoral, listed_online); 0.18::true_val(availability_status_balmoral, unk_availability_status_balmoral).

measured(s20, availability_status_balmoral, listed_online).

all_consistent(availability_status_balmoral) :-
    consistent(s20, availability_status_balmoral).

evidence(all_consistent(availability_status_balmoral)).
query(true_val(availability_status_balmoral, listed_online)).
query(true_val(availability_status_balmoral, unk_availability_status_balmoral)).

0.78::acc(s38, availability_status_auski).

% @attr availability_status_auski
% @type categorical
% @canonical false
% @original_name availability_status (Auski)
% @values listed_online=Listed_online unk_availability_status_auski=Unknown
% @importance 0.60

0.78::true_val(availability_status_auski, listed_online); 0.22::true_val(availability_status_auski, unk_availability_status_auski).

measured(s38, availability_status_auski, listed_online).

all_consistent(availability_status_auski) :-
    consistent(s38, availability_status_auski).

evidence(all_consistent(availability_status_auski)).
query(true_val(availability_status_auski, listed_online)).
query(true_val(availability_status_auski, unk_availability_status_auski)).

0.78::acc(s39, availability_status_paul_reader).

% @attr availability_status_paul_reader
% @type categorical
% @canonical false
% @original_name availability_status (Paul Reader)
% @values listed_online=Listed_online unk_availability_status_paul_reader=Unknown
% @importance 0.60

0.78::true_val(availability_status_paul_reader, listed_online); 0.22::true_val(availability_status_paul_reader, unk_availability_status_paul_reader).

measured(s39, availability_status_paul_reader, listed_online).

all_consistent(availability_status_paul_reader) :-
    consistent(s39, availability_status_paul_reader).

evidence(all_consistent(availability_status_paul_reader)).
query(true_val(availability_status_paul_reader, listed_online)).
query(true_val(availability_status_paul_reader, unk_availability_status_paul_reader)).

0.80::acc(s40, availability_status_rhythm).

% @attr availability_status_rhythm
% @type categorical
% @canonical false
% @original_name availability_status (Rhythm)
% @values listed_online=Listed_online unk_availability_status_rhythm=Unknown
% @importance 0.60

0.80::true_val(availability_status_rhythm, listed_online); 0.20::true_val(availability_status_rhythm, unk_availability_status_rhythm).

measured(s40, availability_status_rhythm, listed_online).

all_consistent(availability_status_rhythm) :-
    consistent(s40, availability_status_rhythm).

evidence(all_consistent(availability_status_rhythm)).
query(true_val(availability_status_rhythm, listed_online)).
query(true_val(availability_status_rhythm, unk_availability_status_rhythm)).

0.82::acc(s32, availability_status_melbourne).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard)
% @values listed_au_only=Listed_online_Australia_only unk_availability_status_melbourne=Unknown
% @importance 0.78

0.82::true_val(availability_status_melbourne, listed_au_only); 0.18::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s32, availability_status_melbourne, listed_au_only).

all_consistent(availability_status_melbourne) :-
    consistent(s32, availability_status_melbourne).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, listed_au_only)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

0.85::acc(s13, availability_status_boardertown).

% @attr availability_status_boardertown
% @type categorical
% @canonical false
% @original_name availability_status (Boardertown)
% @values listed_90day_returns=Listed_online_90day_returns unk_availability_status_boardertown=Unknown
% @importance 0.88

0.85::true_val(availability_status_boardertown, listed_90day_returns); 0.15::true_val(availability_status_boardertown, unk_availability_status_boardertown).

measured(s13, availability_status_boardertown, listed_90day_returns).

all_consistent(availability_status_boardertown) :-
    consistent(s13, availability_status_boardertown).

evidence(all_consistent(availability_status_boardertown)).
query(true_val(availability_status_boardertown, listed_90day_returns)).
query(true_val(availability_status_boardertown, unk_availability_status_boardertown)).

0.82::acc(s14, availability_status_absolute_snow).

% @attr availability_status_absolute_snow
% @type categorical
% @canonical false
% @original_name availability_status (Absolute-Snow)
% @values listed_online=Listed_online unk_availability_status_absolute_snow=Unknown
% @importance 0.82

0.82::true_val(availability_status_absolute_snow, listed_online); 0.18::true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow).

measured(s14, availability_status_absolute_snow, listed_online).

all_consistent(availability_status_absolute_snow) :-
    consistent(s14, availability_status_absolute_snow).

evidence(all_consistent(availability_status_absolute_snow)).
query(true_val(availability_status_absolute_snow, listed_online)).
query(true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow)).

0.85::acc(s1, availability_status_blauer).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values sold_out=Sold_out unk_availability_status_blauer=Unknown
% @importance 0.85

0.85::true_val(availability_status_blauer, sold_out); 0.15::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s1, availability_status_blauer, sold_out).

all_consistent(availability_status_blauer) :-
    consistent(s1, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, sold_out)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

0.82::acc(s34, availability_status_snowleader).

% @attr availability_status_snowleader
% @type categorical
% @canonical false
% @original_name availability_status (Snowleader)
% @values listed=Listed unk_availability_status_snowleader=Unknown
% @importance 0.85

0.82::true_val(availability_status_snowleader, listed); 0.18::true_val(availability_status_snowleader, unk_availability_status_snowleader).

measured(s34, availability_status_snowleader, listed).

all_consistent(availability_status_snowleader) :-
    consistent(s34, availability_status_snowleader).

evidence(all_consistent(availability_status_snowleader)).
query(true_val(availability_status_snowleader, listed)).
query(true_val(availability_status_snowleader, unk_availability_status_snowleader)).

0.88::acc(s41, ride_feel_speed).

% @attr ride_feel_speed
% @type categorical
% @canonical false
% @original_name Ride feel (speed)
% @values fast_stable_no_wobble=Fast_stable_no_speed_wobbles unk_ride_feel_speed=Unknown
% @importance 0.88

0.85::true_val(ride_feel_speed, fast_stable_no_wobble); 0.15::true_val(ride_feel_speed, unk_ride_feel_speed).

measured(s41, ride_feel_speed, fast_stable_no_wobble).

all_consistent(ride_feel_speed) :-
    consistent(s41, ride_feel_speed).

evidence(all_consistent(ride_feel_speed)).
query(true_val(ride_feel_speed, fast_stable_no_wobble)).
query(true_val(ride_feel_speed, unk_ride_feel_speed)).

0.85::acc(s41, ride_feel_carving).

% @attr ride_feel_carving
% @type categorical
% @canonical false
% @original_name Ride feel (carving)
% @values good_feel_flat_transition=Good_carving_feel_flat_section_noticeable unk_ride_feel_carving=Unknown
% @importance 0.88

0.85::true_val(ride_feel_carving, good_feel_flat_transition); 0.15::true_val(ride_feel_carving, unk_ride_feel_carving).

measured(s41, ride_feel_carving, good_feel_flat_transition).

all_consistent(ride_feel_carving) :-
    consistent(s41, ride_feel_carving).

evidence(all_consistent(ride_feel_carving)).
query(true_val(ride_feel_carving, good_feel_flat_transition)).
query(true_val(ride_feel_carving, unk_ride_feel_carving)).

0.85::acc(s41, ride_feel_chop_crud).

% @attr ride_feel_chop_crud
% @type categorical
% @canonical false
% @original_name Ride feel (chop/crud)
% @values cuts_through_freight_train=Cuts_through_crud_chop_freight_train unk_ride_feel_chop_crud=Unknown
% @importance 0.88

0.85::true_val(ride_feel_chop_crud, cuts_through_freight_train); 0.15::true_val(ride_feel_chop_crud, unk_ride_feel_chop_crud).

measured(s41, ride_feel_chop_crud, cuts_through_freight_train).

all_consistent(ride_feel_chop_crud) :-
    consistent(s41, ride_feel_chop_crud).

evidence(all_consistent(ride_feel_chop_crud)).
query(true_val(ride_feel_chop_crud, cuts_through_freight_train)).
query(true_val(ride_feel_chop_crud, unk_ride_feel_chop_crud)).

0.85::acc(s41, negative_aspect_short_turns).

% @attr negative_aspect_short_turns
% @type categorical
% @canonical false
% @original_name Ride feel (short turns negative)
% @values stiff_poor_short_turns=Stiff_poor_short_turns_dense_woods unk_negative_aspect_short_turns=Unknown
% @importance 0.88

0.85::true_val(negative_aspect_short_turns, stiff_poor_short_turns); 0.15::true_val(negative_aspect_short_turns, unk_negative_aspect_short_turns).

measured(s41, negative_aspect_short_turns, stiff_poor_short_turns).

all_consistent(negative_aspect_short_turns) :-
    consistent(s41, negative_aspect_short_turns).

evidence(all_consistent(negative_aspect_short_turns)).
query(true_val(negative_aspect_short_turns, stiff_poor_short_turns)).
query(true_val(negative_aspect_short_turns, unk_negative_aspect_short_turns)).

0.85::acc(s41, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (Playfulness)
% @values not_playful_no_park=Not_playful_no_park_awkward_switch unk_negative_aspect=Unknown
% @importance 0.88

0.85::true_val(negative_aspect, not_playful_no_park); 0.15::true_val(negative_aspect, unk_negative_aspect).

measured(s41, negative_aspect, not_playful_no_park).

all_consistent(negative_aspect) :-
    consistent(s41, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_playful_no_park)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.90::acc(s41, edge_hold_positive).

% @attr edge_hold_positive
% @type categorical
% @canonical false
% @original_name Edge hold (positive)
% @values frostbite_exceptional=Frostbite_exceptional_steep_icy unk_edge_hold_positive=Unknown
% @importance 0.88

0.88::true_val(edge_hold_positive, frostbite_exceptional); 0.12::true_val(edge_hold_positive, unk_edge_hold_positive).

measured(s41, edge_hold_positive, frostbite_exceptional).

all_consistent(edge_hold_positive) :-
    consistent(s41, edge_hold_positive).

evidence(all_consistent(edge_hold_positive)).
query(true_val(edge_hold_positive, frostbite_exceptional)).
query(true_val(edge_hold_positive, unk_edge_hold_positive)).

0.82::acc(s41, negative_aspect_edge_hold).

% @attr negative_aspect_edge_hold
% @type categorical
% @canonical false
% @original_name Edge hold (negative caveat)
% @values skid_turns_ice_patches=Predisposed_to_skidding_ice_patches unk_negative_aspect_edge_hold=Unknown
% @importance 0.88

0.82::true_val(negative_aspect_edge_hold, skid_turns_ice_patches); 0.18::true_val(negative_aspect_edge_hold, unk_negative_aspect_edge_hold).

measured(s41, negative_aspect_edge_hold, skid_turns_ice_patches).

all_consistent(negative_aspect_edge_hold) :-
    consistent(s41, negative_aspect_edge_hold).

evidence(all_consistent(negative_aspect_edge_hold)).
query(true_val(negative_aspect_edge_hold, skid_turns_ice_patches)).
query(true_val(negative_aspect_edge_hold, unk_negative_aspect_edge_hold)).

0.85::acc(s41, powder_performance).

% @attr powder_performance
% @type categorical
% @canonical false
% @original_name Powder performance
% @values directional_longer_nose_float=Directional_longer_nose_flat_rocker_12mm_taper_float unk_powder_performance=Unknown
% @importance 0.88

0.85::true_val(powder_performance, directional_longer_nose_float); 0.15::true_val(powder_performance, unk_powder_performance).

measured(s41, powder_performance, directional_longer_nose_float).

all_consistent(powder_performance) :-
    consistent(s41, powder_performance).

evidence(all_consistent(powder_performance)).
query(true_val(powder_performance, directional_longer_nose_float)).
query(true_val(powder_performance, unk_powder_performance)).

0.85::acc(s41, target_use_summary).

% @attr target_use_summary
% @type categorical
% @canonical false
% @original_name Target use summary
% @values stiff_stable_speed_powder=Stiff_stable_speed_float_powder unk_target_use_summary=Unknown
% @importance 0.88

0.85::true_val(target_use_summary, stiff_stable_speed_powder); 0.15::true_val(target_use_summary, unk_target_use_summary).

measured(s41, target_use_summary, stiff_stable_speed_powder).

all_consistent(target_use_summary) :-
    consistent(s41, target_use_summary).

evidence(all_consistent(target_use_summary)).
query(true_val(target_use_summary, stiff_stable_speed_powder)).
query(true_val(target_use_summary, unk_target_use_summary)).

0.82::acc(s50, reviewer_opinion_whitelines).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values fun_fast_good_edge_clumsy_turns=Super_fun_fast_good_edge_hold_clumsy_quick_turns unk_reviewer_opinion_whitelines=Unknown
% @importance 0.78

0.82::true_val(reviewer_opinion_whitelines, fun_fast_good_edge_clumsy_turns); 0.18::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s50, reviewer_opinion_whitelines, fun_fast_good_edge_clumsy_turns).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s50, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, fun_fast_good_edge_clumsy_turns)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

0.80::acc(s42, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values freeride_borders_all_mountain=Freeride_borders_all_mountain_not_super_aggressive unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.80::true_val(reviewer_opinion_the_good_ride, freeride_borders_all_mountain); 0.20::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s42, reviewer_opinion_the_good_ride, freeride_borders_all_mountain).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s42, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, freeride_borders_all_mountain)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.78::acc(s42, reviewer_opinion_tgr_edge_hold).

% @attr reviewer_opinion_tgr_edge_hold
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (edge hold)
% @values poor_hard_snow=Not_there_on_hard_snow_lets_go_easy unk_reviewer_opinion_tgr_edge_hold=Unknown
% @importance 0.85

0.75::true_val(reviewer_opinion_tgr_edge_hold, poor_hard_snow); 0.25::true_val(reviewer_opinion_tgr_edge_hold, unk_reviewer_opinion_tgr_edge_hold).

measured(s42, reviewer_opinion_tgr_edge_hold, poor_hard_snow).

all_consistent(reviewer_opinion_tgr_edge_hold) :-
    consistent(s42, reviewer_opinion_tgr_edge_hold).

evidence(all_consistent(reviewer_opinion_tgr_edge_hold)).
query(true_val(reviewer_opinion_tgr_edge_hold, poor_hard_snow)).
query(true_val(reviewer_opinion_tgr_edge_hold, unk_reviewer_opinion_tgr_edge_hold)).

0.65::acc(s43, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values good_am_piste_powder_want_longer=Good_all_mountain_piste_powder_wish_longer unk_user_review_forum=Unknown
% @importance 0.65

0.65::true_val(user_review_forum, good_am_piste_powder_want_longer); 0.35::true_val(user_review_forum, unk_user_review_forum).

measured(s43, user_review_forum, good_am_piste_powder_want_longer).

all_consistent(user_review_forum) :-
    consistent(s43, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, good_am_piste_powder_want_longer)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.82::acc(s41, value_assessment).

% @attr value_assessment
% @type categorical
% @canonical false
% @original_name Value assessment
% @values not_cheapest_less_than_some=Not_cheapest_but_less_than_some_directionals unk_value_assessment=Unknown
% @importance 0.88

0.80::true_val(value_assessment, not_cheapest_less_than_some); 0.20::true_val(value_assessment, unk_value_assessment).

measured(s41, value_assessment, not_cheapest_less_than_some).

all_consistent(value_assessment) :-
    consistent(s41, value_assessment).

evidence(all_consistent(value_assessment)).
query(true_val(value_assessment, not_cheapest_less_than_some)).
query(true_val(value_assessment, unk_value_assessment)).

0.82::acc(s44, weight_reduction_claim).

% @attr weight_reduction_claim
% @type categorical
% @canonical false
% @original_name Weight reduction claim
% @values lightest_core_carbon_pop=Lightest_core_ever_carbon_laminations_pop unk_weight_reduction_claim=Unknown
% @importance 0.82

0.82::true_val(weight_reduction_claim, lightest_core_carbon_pop); 0.18::true_val(weight_reduction_claim, unk_weight_reduction_claim).

measured(s44, weight_reduction_claim, lightest_core_carbon_pop).

all_consistent(weight_reduction_claim) :-
    consistent(s44, weight_reduction_claim).

evidence(all_consistent(weight_reduction_claim)).
query(true_val(weight_reduction_claim, lightest_core_carbon_pop)).
query(true_val(weight_reduction_claim, unk_weight_reduction_claim)).

0.82::acc(s44, mystery_weight_review).

% @attr mystery_weight_review
% @type categorical
% @canonical false
% @original_name Mystery Landlord reviewer on weight
% @values insanely_light_no_twitchiness=Insanely_light_no_twitchiness unk_mystery_weight_review=Unknown
% @importance 0.82

0.82::true_val(mystery_weight_review, insanely_light_no_twitchiness); 0.18::true_val(mystery_weight_review, unk_mystery_weight_review).

measured(s44, mystery_weight_review, insanely_light_no_twitchiness).

all_consistent(mystery_weight_review) :-
    consistent(s44, mystery_weight_review).

evidence(all_consistent(mystery_weight_review)).
query(true_val(mystery_weight_review, insanely_light_no_twitchiness)).
query(true_val(mystery_weight_review, unk_mystery_weight_review)).

0.82::acc(s44, mystery_price_concern).

% @attr mystery_price_concern
% @type categorical
% @canonical false
% @original_name Mystery Series price concern
% @values not_for_budget=Not_for_budget_buyers unk_mystery_price_concern=Unknown
% @importance 0.82

0.82::true_val(mystery_price_concern, not_for_budget); 0.18::true_val(mystery_price_concern, unk_mystery_price_concern).

measured(s44, mystery_price_concern, not_for_budget).

all_consistent(mystery_price_concern) :-
    consistent(s44, mystery_price_concern).

evidence(all_consistent(mystery_price_concern)).
query(true_val(mystery_price_concern, not_for_budget)).
query(true_val(mystery_price_concern, unk_mystery_price_concern)).

0.80::acc(s44, mystery_value_commentary).

% @attr mystery_value_commentary
% @type categorical
% @canonical false
% @original_name Mystery Series value commentary
% @values very_expensive_underwhelmed_risk=Very_expensive_may_underwhelm unk_mystery_value_commentary=Unknown
% @importance 0.82

0.80::true_val(mystery_value_commentary, very_expensive_underwhelmed_risk); 0.20::true_val(mystery_value_commentary, unk_mystery_value_commentary).

measured(s44, mystery_value_commentary, very_expensive_underwhelmed_risk).

all_consistent(mystery_value_commentary) :-
    consistent(s44, mystery_value_commentary).

evidence(all_consistent(mystery_value_commentary)).
query(true_val(mystery_value_commentary, very_expensive_underwhelmed_risk)).
query(true_val(mystery_value_commentary, unk_mystery_value_commentary)).

0.90::acc(s1, construction_summary).
0.88::acc(s3, construction_summary).
0.88::acc(s13, construction_summary).
0.85::acc(s6, construction_summary).

% @attr construction_summary
% @type categorical
% @canonical false
% @original_name Construction
% @values full_mystery_spec=Methlon_MysteryGlass_DragonflyII_Squeezebox_EGD_Frostbite_Channel_InfiniteRide_SuperSap_ProTip unk_construction_summary=Unknown
% @importance 0.88

0.97::true_val(construction_summary, full_mystery_spec); 0.03::true_val(construction_summary, unk_construction_summary).

measured(s1, construction_summary, full_mystery_spec).
measured(s3, construction_summary, full_mystery_spec).
measured(s13, construction_summary, full_mystery_spec).
measured(s6, construction_summary, full_mystery_spec).

all_consistent(construction_summary) :-
    (indep(s1), consistent(s1, construction_summary) ; \+indep(s1)),
    (indep(s3), consistent(s3, construction_summary) ; \+indep(s3)),
    (indep(s13), consistent(s13, construction_summary) ; \+indep(s13)),
    (indep(s6), consistent(s6, construction_summary) ; \+indep(s6)).

evidence(all_consistent(construction_summary)).
query(true_val(construction_summary, full_mystery_spec)).
query(true_val(construction_summary, unk_construction_summary)).

0.85::acc(s6, profile_summary).
0.88::acc(s3, profile_summary).

% @attr profile_summary
% @type categorical
% @canonical false
% @original_name Profile summary
% @values directional_flat_top_surfy=Directional_Flat_Top_surfy_zero_camber_rocker_nose_tail unk_profile_summary=Unknown
% @importance 0.82

0.90::true_val(profile_summary, directional_flat_top_surfy); 0.10::true_val(profile_summary, unk_profile_summary).

measured(s6, profile_summary, directional_flat_top_surfy).
measured(s3, profile_summary, directional_flat_top_surfy).

all_consistent(profile_summary) :-
    (indep(s6), consistent(s6, profile_summary) ; \+indep(s6)),
    (indep(s3), consistent(s3, profile_summary) ; \+indep(s3)).

evidence(all_consistent(profile_summary)).
query(true_val(profile_summary, directional_flat_top_surfy)).
query(true_val(profile_summary, unk_profile_summary)).

0.85::acc(s6, shape_detail_source).

% @attr shape_detail_source
% @type categorical
% @canonical false
% @original_name Shape detail (The Source)
% @values directional_tapered_pow_turns=Directional_Tapered_tail_sinks_pow_quicker_turns unk_shape_detail_source=Unknown
% @importance 0.75

0.82::true_val(shape_detail_source, directional_tapered_pow_turns); 0.18::true_val(shape_detail_source, unk_shape_detail_source).

measured(s6, shape_detail_source, directional_tapered_pow_turns).

all_consistent(shape_detail_source) :-
    consistent(s6, shape_detail_source).

evidence(all_consistent(shape_detail_source)).
query(true_val(shape_detail_source, directional_tapered_pow_turns)).
query(true_val(shape_detail_source, unk_shape_detail_source)).

0.85::acc(s6, pro_tip_benefit).

% @attr pro_tip_benefit
% @type categorical
% @canonical false
% @original_name Pro-Tip benefit (per The Source)
% @values enhanced_float_surfy_nimble=Enhanced_floatation_surfy_faster_turning_nimble_trees unk_pro_tip_benefit=Unknown
% @importance 0.75

0.82::true_val(pro_tip_benefit, enhanced_float_surfy_nimble); 0.18::true_val(pro_tip_benefit, unk_pro_tip_benefit).

measured(s6, pro_tip_benefit, enhanced_float_surfy_nimble).

all_consistent(pro_tip_benefit) :-
    consistent(s6, pro_tip_benefit).

evidence(all_consistent(pro_tip_benefit)).
query(true_val(pro_tip_benefit, enhanced_float_surfy_nimble)).
query(true_val(pro_tip_benefit, unk_pro_tip_benefit)).

0.85::acc(s25, manufacturing_location_current).
0.82::acc(s27, manufacturing_location_current).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_keil_factory=Austria_Keil_factory unk_manufacturing_location_current=Unknown
% @importance 0.47

0.90::true_val(manufacturing_location_current, austria_keil_factory); 0.10::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s25, manufacturing_location_current, austria_keil_factory).
measured(s27, manufacturing_location_current, austria_keil_factory).

all_consistent(manufacturing_location_current) :-
    consistent(s25, manufacturing_location_current),
    consistent(s27, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_keil_factory)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

0.78::acc(s47, customer_satisfaction).

% @attr customer_satisfaction
% @type numeric
% @unit /5
% @canonical false
% @original_name Customer satisfaction (Comparably)
% @values v4_4=4.4 unk_customer_satisfaction=Unknown
% @importance 0.55

0.75::true_val(customer_satisfaction, v4_4); 0.25::true_val(customer_satisfaction, unk_customer_satisfaction).

measured(s47, customer_satisfaction, v4_4).

all_consistent(customer_satisfaction) :-
    consistent(s47, customer_satisfaction).

evidence(all_consistent(customer_satisfaction)).
query(true_val(customer_satisfaction, v4_4)).
query(true_val(customer_satisfaction, unk_customer_satisfaction)).

0.82::acc(s10, comparable_board_same_brand).
0.85::acc(s3, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values ft_hero_cartographer_attendant=FT_Hometown_Hero_Cartographer_Flight_Attendant_Deep_Thinker unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.85::true_val(comparable_board_same_brand, ft_hero_cartographer_attendant); 0.15::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s10, comparable_board_same_brand, ft_hero_cartographer_attendant).
measured(s3, comparable_board_same_brand, ft_hero_cartographer_attendant).

all_consistent(comparable_board_same_brand) :-
    consistent(s10, comparable_board_same_brand),
    (indep(s3), consistent(s3, comparable_board_same_brand) ; \+indep(s3)).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, ft_hero_cartographer_attendant)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.78::acc(s42, good_ride_comparison).

% @attr good_ride_comparison
% @type categorical
% @canonical false
% @original_name The Good Ride comparison
% @values between_stick_shift_story_board=Between_Stick_Shift_and_Story_Board unk_good_ride_comparison=Unknown
% @importance 0.85

0.75::true_val(good_ride_comparison, between_stick_shift_story_board); 0.25::true_val(good_ride_comparison, unk_good_ride_comparison).

measured(s42, good_ride_comparison, between_stick_shift_story_board).

all_consistent(good_ride_comparison) :-
    consistent(s42, good_ride_comparison).

evidence(all_consistent(good_ride_comparison)).
query(true_val(good_ride_comparison, between_stick_shift_story_board)).
query(true_val(good_ride_comparison, unk_good_ride_comparison)).

0.75::acc(s47, brand_competitors).

% @attr brand_competitors
% @type categorical
% @canonical false
% @original_name Burton brand competitors in snowboards
% @values salomon_quiksilver_rossignol=Salomon_Quiksilver_Rossignol unk_brand_competitors=Unknown
% @importance 0.55

0.72::true_val(brand_competitors, salomon_quiksilver_rossignol); 0.28::true_val(brand_competitors, unk_brand_competitors).

measured(s47, brand_competitors, salomon_quiksilver_rossignol).

all_consistent(brand_competitors) :-
    consistent(s47, brand_competitors).

evidence(all_consistent(brand_competitors)).
query(true_val(brand_competitors, salomon_quiksilver_rossignol)).
query(true_val(brand_competitors, unk_brand_competitors)).

0.55::acc(s48, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_nitro_salomon_k2_yes_jones=Capita_Nitro_Salomon_K2_Yes_Jones unk_comparable_board_cross_brand=Unknown
% @importance 0.65

0.55::true_val(comparable_board_cross_brand, capita_nitro_salomon_k2_yes_jones); 0.45::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s48, comparable_board_cross_brand, capita_nitro_salomon_k2_yes_jones).

all_consistent(comparable_board_cross_brand) :-
    consistent(s48, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_nitro_salomon_k2_yes_jones)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.82::acc(s29, predecessor_model_name).
0.88::acc(s30, predecessor_model_name).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values day_trader_ft_day_trader=Day_Trader_2014_then_FT_Day_Trader_2016_2021 unk_predecessor_model_name=Unknown
% @importance 0.52

0.88::true_val(predecessor_model_name, day_trader_ft_day_trader); 0.12::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s29, predecessor_model_name, day_trader_ft_day_trader).
measured(s30, predecessor_model_name, day_trader_ft_day_trader).

all_consistent(predecessor_model_name) :-
    consistent(s29, predecessor_model_name),
    consistent(s30, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, day_trader_ft_day_trader)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

0.82::acc(s50, core_change).
0.85::acc(s49, core_change).

% @attr core_change
% @type categorical
% @canonical false
% @original_name Core change
% @values super_fly_700g_to_dragonfly_500g=SuperFly_II_700G_to_Dragonfly_II_500G unk_core_change=Unknown
% @importance 0.69

0.85::true_val(core_change, super_fly_700g_to_dragonfly_500g); 0.15::true_val(core_change, unk_core_change).

measured(s50, core_change, super_fly_700g_to_dragonfly_500g).
measured(s49, core_change, super_fly_700g_to_dragonfly_500g).

all_consistent(core_change) :-
    consistent(s50, core_change),
    consistent(s49, core_change).

evidence(all_consistent(core_change)).
query(true_val(core_change, super_fly_700g_to_dragonfly_500g)).
query(true_val(core_change, unk_core_change)).

0.82::acc(s49, glassing_change).
0.88::acc(s1, glassing_change).

% @attr glassing_change
% @type categorical
% @canonical false
% @original_name Glassing change
% @values triax_to_mystery_glass=Triax_Fiberglass_to_Mystery_Glass unk_glassing_change=Unknown
% @importance 0.72

0.85::true_val(glassing_change, triax_to_mystery_glass); 0.15::true_val(glassing_change, unk_glassing_change).

measured(s49, glassing_change, triax_to_mystery_glass).
measured(s1, glassing_change, triax_to_mystery_glass).

all_consistent(glassing_change) :-
    consistent(s49, glassing_change),
    (indep(s1), consistent(s1, glassing_change) ; \+indep(s1)).

evidence(all_consistent(glassing_change)).
query(true_val(glassing_change, triax_to_mystery_glass)).
query(true_val(glassing_change, unk_glassing_change)).

0.85::acc(smerch, riding_style).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values powder_groomed_versatile=Powder_float_groomed_runs_versatile_all_mountain unk_riding_style=Unknown
% @importance 0.85

0.88::true_val(riding_style, powder_groomed_versatile); 0.12::true_val(riding_style, unk_riding_style).

measured(smerch, riding_style, powder_groomed_versatile).

all_consistent(riding_style) :-
    consistent(smerch, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, powder_groomed_versatile)).
query(true_val(riding_style, unk_riding_style)).

0.85::acc(smerch, shipping_restriction).

% @attr shipping_restriction
% @type categorical
% @canonical false
% @original_name Shipping restriction (merchant)
% @values australia_only=Australia_only unk_shipping_restriction=Unknown
% @importance 0.85

0.88::true_val(shipping_restriction, australia_only); 0.12::true_val(shipping_restriction, unk_shipping_restriction).

measured(smerch, shipping_restriction, australia_only).

all_consistent(shipping_restriction) :-
    consistent(smerch, shipping_restriction).

evidence(all_consistent(shipping_restriction)).
query(true_val(shipping_restriction, australia_only)).
query(true_val(shipping_restriction, unk_shipping_restriction)).

0.85::acc(smerch, available_sizes_merchant).

% @attr available_sizes_merchant
% @type categorical
% @canonical false
% @original_name available_sizes (Merchant)
% @values s155_160=155_160cm unk_available_sizes_merchant=Unknown
% @importance 0.85

0.88::true_val(available_sizes_merchant, s155_160); 0.12::true_val(available_sizes_merchant, unk_available_sizes_merchant).

measured(smerch, available_sizes_merchant, s155_160).

all_consistent(available_sizes_merchant) :-
    consistent(smerch, available_sizes_merchant).

evidence(all_consistent(available_sizes_merchant)).
query(true_val(available_sizes_merchant, s155_160)).
query(true_val(available_sizes_merchant, unk_available_sizes_merchant)).

0.85::acc(s10, new_model_2025).

% @attr new_model_2025
% @type categorical
% @canonical false
% @original_name New model introduction
% @values new_for_2025=New_addition_2025_lineup unk_new_model_2025=Unknown
% @importance 0.80

0.85::true_val(new_model_2025, new_for_2025); 0.15::true_val(new_model_2025, unk_new_model_2025).

measured(s10, new_model_2025, new_for_2025).

all_consistent(new_model_2025) :-
    consistent(s10, new_model_2025).

evidence(all_consistent(new_model_2025)).
query(true_val(new_model_2025, new_for_2025)).
query(true_val(new_model_2025, unk_new_model_2025)).

0.85::acc(s29, original_day_trader_history).

% @attr original_day_trader_history
% @type categorical
% @canonical false
% @original_name Original Day Trader history
% @values womens_2014_kimmy_fasani=Womens_specific_2014_developed_with_Kimmy_Fasani unk_original_day_trader_history=Unknown
% @importance 0.55

0.80::true_val(original_day_trader_history, womens_2014_kimmy_fasani); 0.20::true_val(original_day_trader_history, unk_original_day_trader_history).

measured(s29, original_day_trader_history, womens_2014_kimmy_fasani).

all_consistent(original_day_trader_history) :-
    consistent(s29, original_day_trader_history).

evidence(all_consistent(original_day_trader_history)).
query(true_val(original_day_trader_history, womens_2014_kimmy_fasani)).
query(true_val(original_day_trader_history, unk_original_day_trader_history)).

0.88::acc(s11, gender_change_note).

% @attr gender_change_note
% @type categorical
% @canonical false
% @original_name Gender change to unisex
% @values changed_womens_to_unisex=Changed_from_womens_to_unisex_2025 unk_gender_change_note=Unknown
% @importance 0.85

0.85::true_val(gender_change_note, changed_womens_to_unisex); 0.15::true_val(gender_change_note, unk_gender_change_note).

measured(s11, gender_change_note, changed_womens_to_unisex).

all_consistent(gender_change_note) :-
    consistent(s11, gender_change_note).

evidence(all_consistent(gender_change_note)).
query(true_val(gender_change_note, changed_womens_to_unisex)).
query(true_val(gender_change_note, unk_gender_change_note)).

0.90::acc(s28, b_corp_certification).

% @attr b_corp_certification
% @type categorical
% @canonical false
% @original_name B Corp certification
% @values first_snowboard_b_corp=First_snowboard_company_B_Corp unk_b_corp_certification=Unknown
% @importance 0.40

0.90::true_val(b_corp_certification, first_snowboard_b_corp); 0.10::true_val(b_corp_certification, unk_b_corp_certification).

measured(s28, b_corp_certification, first_snowboard_b_corp).

all_consistent(b_corp_certification) :-
    consistent(s28, b_corp_certification).

evidence(all_consistent(b_corp_certification)).
query(true_val(b_corp_certification, first_snowboard_b_corp)).
query(true_val(b_corp_certification, unk_b_corp_certification)).

0.82::acc(s25, market_share).

% @attr market_share
% @type categorical
% @canonical false
% @original_name Market share
% @values pct_40_45=40_to_45_percent_2013 unk_market_share=Unknown
% @importance 0.50

0.80::true_val(market_share, pct_40_45); 0.20::true_val(market_share, unk_market_share).

measured(s25, market_share, pct_40_45).

all_consistent(market_share) :-
    consistent(s25, market_share).

evidence(all_consistent(market_share)).
query(true_val(market_share, pct_40_45)).
query(true_val(market_share, unk_market_share)).

0.88::acc(s26, headquarters).

% @attr headquarters
% @type categorical
% @canonical false
% @original_name Headquarters
% @values burlington_vt=Burlington_Vermont unk_headquarters=Unknown
% @importance 0.50

0.92::true_val(headquarters, burlington_vt); 0.08::true_val(headquarters, unk_headquarters).

measured(s26, headquarters, burlington_vt).

all_consistent(headquarters) :-
    consistent(s26, headquarters).

evidence(all_consistent(headquarters)).
query(true_val(headquarters, burlington_vt)).
query(true_val(headquarters, unk_headquarters)).

0.82::acc(s45, brand_reputation).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Brand reputation
% @values largest_manufacturer_excellent=Largest_snowboard_manufacturer_excellent_boards unk_brand_reputation=Unknown
% @importance 0.50

0.80::true_val(brand_reputation, largest_manufacturer_excellent); 0.20::true_val(brand_reputation, unk_brand_reputation).

measured(s45, brand_reputation, largest_manufacturer_excellent).

all_consistent(brand_reputation) :-
    consistent(s45, brand_reputation).

evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, largest_manufacturer_excellent)).
query(true_val(brand_reputation, unk_brand_reputation)).

0.82::acc(s46, founding_year).

% @attr founding_year
% @type numeric
% @canonical false
% @original_name Founding year
% @values v1977=1977 unk_founding_year=Unknown
% @importance 0.40

0.85::true_val(founding_year, v1977); 0.15::true_val(founding_year, unk_founding_year).

measured(s46, founding_year, v1977).

all_consistent(founding_year) :-
    consistent(s46, founding_year).

evidence(all_consistent(founding_year)).
query(true_val(founding_year, v1977)).
query(true_val(founding_year, unk_founding_year)).

0.90::acc(smerch, price_aud_rrp).

% @attr price_aud_rrp
% @type numeric
% @unit AUD
% @canonical false
% @original_name Price AUD RRP
% @values v2199_99=2199.99 unk_price_aud_rrp=Unknown
% @importance 0.85

0.92::true_val(price_aud_rrp, v2199_99); 0.08::true_val(price_aud_rrp, unk_price_aud_rrp).

measured(smerch, price_aud_rrp, v2199_99).

all_consistent(price_aud_rrp) :-
    consistent(smerch, price_aud_rrp).

evidence(all_consistent(price_aud_rrp)).
query(true_val(price_aud_rrp, v2199_99)).
query(true_val(price_aud_rrp, unk_price_aud_rrp)).

0.82::acc(s27, manufacturing_vermont).

% @attr manufacturing_vermont
% @type categorical
% @canonical false
% @original_name Manufacturing Vermont prototyping
% @values pct_1_2_vermont=Only_1_to_2_percent_made_Vermont_prototyping unk_manufacturing_vermont=Unknown
% @importance 0.45

0.80::true_val(manufacturing_vermont, pct_1_2_vermont); 0.20::true_val(manufacturing_vermont, unk_manufacturing_vermont).

measured(s27, manufacturing_vermont, pct_1_2_vermont).

all_consistent(manufacturing_vermont) :-
    consistent(s27, manufacturing_vermont).

evidence(all_consistent(manufacturing_vermont)).
query(true_val(manufacturing_vermont, pct_1_2_vermont)).
query(true_val(manufacturing_vermont, unk_manufacturing_vermont)).