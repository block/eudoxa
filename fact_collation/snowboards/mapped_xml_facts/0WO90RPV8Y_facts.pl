0.15::indep(smv).
0.15::indep(s7).
0.15::indep(s8).
0.12::indep(s9).
0.15::indep(s10).
0.20::indep(s11).
0.20::indep(s13).
0.15::indep(s14).
0.15::indep(s15).
0.15::indep(s16).
0.15::indep(s19).
0.15::indep(s20).
0.12::indep(s21).
0.12::indep(s22).
0.15::indep(s23).
0.20::indep(s24).
0.20::indep(s27).
0.20::indep(s28).
0.15::indep(s29).
0.15::indep(s30).
0.15::indep(s31).
0.12::indep(s32).
0.15::indep(s33).
0.15::indep(s37).
0.15::indep(s38).
0.20::indep(s39).
0.15::indep(s40).
0.15::indep(s41).
0.15::indep(s42).
0.15::indep(s43).
0.15::indep(s44).
0.15::indep(s45).
0.12::indep(s46).
0.20::indep(s47).
0.15::indep(s48).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.95::acc(s1, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, burton); 0.05::true_val(brand, unk_brand).
measured(s1, brand, burton).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

0.95::acc(s1, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values cartographer=Cartographer unk_model_name=Unknown
% @importance 1.0

0.95::true_val(model_name, cartographer); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, cartographer).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, cartographer)).
query(true_val(model_name, unk_model_name)).

0.95::acc(s1, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 1.0

0.95::true_val(model_year, y2026); 0.05::true_val(model_year, unk_model_year).
measured(s1, model_year, y2026).
all_consistent(model_year) :- consistent(s1, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

0.95::acc(s1, product_type).

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

0.78::acc(s2, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2022=2022 unk_model_first_available_year=Unknown
% @importance 0.7

0.80::true_val(model_first_available_year, y2022); 0.20::true_val(model_first_available_year, unk_model_first_available_year).
measured(s2, model_first_available_year, y2022).
all_consistent(model_first_available_year) :- consistent(s2, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2022)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.75::acc(s3, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards_Burlington_VT unk_manufacturer=Unknown
% @importance 0.5

0.85::true_val(manufacturer, burton_snowboards); 0.15::true_val(manufacturer, unk_manufacturer).
measured(s3, manufacturer, burton_snowboards).
all_consistent(manufacturer) :- consistent(s3, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

0.75::acc(s3, manufacturer_corporate_structure).

% @attr manufacturer_corporate_structure
% @type categorical
% @canonical false
% @original_name Manufacturer corporate structure
% @values privately_owned=Privately_owned_Donna_Carpenter unk_manufacturer_corporate_structure=Unknown
% @importance 0.5

0.80::true_val(manufacturer_corporate_structure, privately_owned); 0.20::true_val(manufacturer_corporate_structure, unk_manufacturer_corporate_structure).
measured(s3, manufacturer_corporate_structure, privately_owned).
all_consistent(manufacturer_corporate_structure) :- consistent(s3, manufacturer_corporate_structure).
evidence(all_consistent(manufacturer_corporate_structure)).
query(true_val(manufacturer_corporate_structure, privately_owned)).
query(true_val(manufacturer_corporate_structure, unk_manufacturer_corporate_structure)).

0.93::acc(s1, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corp=Certified_B_Corporation unk_sustainability_certification=Unknown
% @importance 1.0

0.93::true_val(sustainability_certification, b_corp); 0.07::true_val(sustainability_certification, unk_sustainability_certification).
measured(s1, sustainability_certification, b_corp).
all_consistent(sustainability_certification) :- consistent(s1, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corp)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.80::acc(s4, manufacturing_location_current).
0.78::acc(s5, manufacturing_location_current).
0.88::acc(s6, manufacturing_location_current).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values china=China unk_manufacturing_location_current=Unknown
% @importance 0.45

0.95::true_val(manufacturing_location_current, china); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).
measured(s4, manufacturing_location_current, china).
measured(s5, manufacturing_location_current, china).
measured(s6, manufacturing_location_current, china).
all_consistent(manufacturing_location_current) :- consistent(s4, manufacturing_location_current), consistent(s5, manufacturing_location_current), consistent(s6, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, china)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

0.85::acc(s7, board_category).
0.90::acc(smv, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.8

0.95::true_val(board_category, all_mountain_freeride); 0.05::true_val(board_category, unk_board_category).
measured(s7, board_category, all_mountain_freeride).
measured(smv, board_category, all_mountain_freeride).
all_consistent(board_category) :- consistent(smv, board_category), (indep(s7), consistent(s7, board_category) ; \+indep(s7)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

0.82::acc(s8, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.7

0.85::true_val(gender, unisex); 0.15::true_val(gender, unk_gender).
measured(s8, gender, unisex).
all_consistent(gender) :- consistent(s8, gender).
evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

0.82::acc(s8, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_all_mountain=Powder_and_all_mountain_riding unk_terrain_suitability=Unknown
% @importance 0.7

0.85::true_val(terrain_suitability, powder_all_mountain); 0.15::true_val(terrain_suitability, unk_terrain_suitability).
measured(s8, terrain_suitability, powder_all_mountain).
all_consistent(terrain_suitability) :- consistent(s8, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_all_mountain)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.90::acc(smv, terrain_suitability_park).

% @attr terrain_suitability_park
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (park)
% @values v3=3.0 unk_terrain_suitability_park=Unknown
% @importance 0.70

0.88::true_val(terrain_suitability_park, v3); 0.12::true_val(terrain_suitability_park, unk_terrain_suitability_park).
measured(smv, terrain_suitability_park, v3).
all_consistent(terrain_suitability_park) :- consistent(smv, terrain_suitability_park).
evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v3)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

0.90::acc(smv, terrain_suitability_all_mountain).
0.88::acc(s9, terrain_suitability_all_mountain).

% @attr terrain_suitability_all_mountain
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (all-mountain)
% @values v7=7.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 0.80

0.92::true_val(terrain_suitability_all_mountain, v7); 0.08::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).
measured(smv, terrain_suitability_all_mountain, v7).
measured(s9, terrain_suitability_all_mountain, v7).
all_consistent(terrain_suitability_all_mountain) :- consistent(smv, terrain_suitability_all_mountain), (indep(s9), consistent(s9, terrain_suitability_all_mountain) ; \+indep(s9)).
evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v7)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

0.90::acc(smv, terrain_suitability_powder).
0.88::acc(s9, terrain_suitability_powder).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (powder)
% @values v8=8.0 unk_terrain_suitability_powder=Unknown
% @importance 0.80

0.92::true_val(terrain_suitability_powder, v8); 0.08::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).
measured(smv, terrain_suitability_powder, v8).
measured(s9, terrain_suitability_powder, v8).
all_consistent(terrain_suitability_powder) :- consistent(smv, terrain_suitability_powder), (indep(s9), consistent(s9, terrain_suitability_powder) ; \+indep(s9)).
evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v8)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

0.82::acc(s9, personality_descriptor).

% @attr personality_descriptor
% @type categorical
% @canonical false
% @original_name Personality descriptor
% @values happy_medium=Happy_Medium unk_personality_descriptor=Unknown
% @importance 0.9

0.85::true_val(personality_descriptor, happy_medium); 0.15::true_val(personality_descriptor, unk_personality_descriptor).
measured(s9, personality_descriptor, happy_medium).
all_consistent(personality_descriptor) :- consistent(s9, personality_descriptor).
evidence(all_consistent(personality_descriptor)).
query(true_val(personality_descriptor, happy_medium)).
query(true_val(personality_descriptor, unk_personality_descriptor)).

0.78::acc(s10, terrain_suitability_description).

% @attr terrain_suitability_description
% @type categorical
% @canonical false
% @original_name terrain_suitability (description)
% @values big_mtn_all_mtn_blend=Big_mountain_stability_all_mountain_maneuverability unk_terrain_suitability_description=Unknown
% @importance 0.6

0.75::true_val(terrain_suitability_description, big_mtn_all_mtn_blend); 0.25::true_val(terrain_suitability_description, unk_terrain_suitability_description).
measured(s10, terrain_suitability_description, big_mtn_all_mtn_blend).
all_consistent(terrain_suitability_description) :- consistent(s10, terrain_suitability_description).
evidence(all_consistent(terrain_suitability_description)).
query(true_val(terrain_suitability_description, big_mtn_all_mtn_blend)).
query(true_val(terrain_suitability_description, unk_terrain_suitability_description)).

0.88::acc(smv, skill_level_recommendation).
0.85::acc(s9, skill_level_recommendation).
0.82::acc(s11, skill_level_recommendation).
0.92::acc(s12, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate=Intermediate intermediate_advanced=Intermediate_Advanced advanced_expert=Advanced_to_Expert
% @importance 0.88

0.35::true_val(skill_level_recommendation, intermediate); 0.35::true_val(skill_level_recommendation, intermediate_advanced); 0.30::true_val(skill_level_recommendation, advanced_expert).
measured(smv, skill_level_recommendation, intermediate).
measured(s9, skill_level_recommendation, intermediate).
measured(s11, skill_level_recommendation, intermediate_advanced).
measured(s12, skill_level_recommendation, advanced_expert).
all_consistent(skill_level_recommendation) :- consistent(s12, skill_level_recommendation), consistent(s11, skill_level_recommendation), (indep(smv), consistent(smv, skill_level_recommendation) ; \+indep(smv)), (indep(s9), consistent(s9, skill_level_recommendation) ; \+indep(s9)).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, advanced_expert)).

0.88::acc(s9, shape).
0.82::acc(s7, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional=Directional unk_shape=Unknown
% @importance 0.85

0.95::true_val(shape, directional); 0.05::true_val(shape, unk_shape).
measured(s9, shape, directional).
measured(s7, shape, directional).
all_consistent(shape) :- (indep(s9), consistent(s9, shape) ; \+indep(s9)), (indep(s7), consistent(s7, shape) ; \+indep(s7)).
evidence(all_consistent(shape)).
query(true_val(shape, directional)).
query(true_val(shape, unk_shape)).

0.90::acc(s13, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_camber=Directional_Camber unk_camber_type=Unknown
% @importance 0.85

0.92::true_val(camber_type, directional_camber); 0.08::true_val(camber_type, unk_camber_type).
measured(s13, camber_type, directional_camber).
all_consistent(camber_type) :- consistent(s13, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_camber)).
query(true_val(camber_type, unk_camber_type)).

0.90::acc(s13, camber_description).
0.82::acc(s14, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values rocker_nose_camber_underfoot=Entry_rocker_nose_camber_underfoot unk_camber_description=Unknown
% @importance 0.83

0.95::true_val(camber_description, rocker_nose_camber_underfoot); 0.05::true_val(camber_description, unk_camber_description).
measured(s13, camber_description, rocker_nose_camber_underfoot).
measured(s14, camber_description, rocker_nose_camber_underfoot).
all_consistent(camber_description) :- (indep(s13), consistent(s13, camber_description) ; \+indep(s13)), (indep(s14), consistent(s14, camber_description) ; \+indep(s14)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, rocker_nose_camber_underfoot)).
query(true_val(camber_description, unk_camber_description)).

0.90::acc(s9, taper).
0.35::acc(s15, taper).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v5=5.0 v15=15.0
% @importance 0.70

0.85::true_val(taper, v5); 0.15::true_val(taper, v15).
measured(s9, taper, v5).
measured(s15, taper, v15).
all_consistent(taper) :- (indep(s9), consistent(s9, taper) ; \+indep(s9)), (indep(s15), consistent(s15, taper) ; \+indep(s15)).
evidence(all_consistent(taper)).
query(true_val(taper, v5)).
query(true_val(taper, v15)).

0.90::acc(smv, flex_rating_10).
0.82::acc(s16, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v5_5=5.5 v4_7=4-7_range
% @importance 0.85

0.65::true_val(flex_rating_10, v5_5); 0.35::true_val(flex_rating_10, v4_7).
measured(smv, flex_rating_10, v5_5).
measured(s16, flex_rating_10, v4_7).
all_consistent(flex_rating_10) :- consistent(smv, flex_rating_10), (indep(s16), consistent(s16, flex_rating_10) ; \+indep(s16)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5_5)).
query(true_val(flex_rating_10, v4_7)).

0.90::acc(smv, flex_direction).
0.88::acc(s13, flex_direction).
0.85::acc(s9, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_flex=Directional_Flex unk_flex_direction=Unknown
% @importance 0.87

0.95::true_val(flex_direction, directional_flex); 0.05::true_val(flex_direction, unk_flex_direction).
measured(smv, flex_direction, directional_flex).
measured(s13, flex_direction, directional_flex).
measured(s9, flex_direction, directional_flex).
all_consistent(flex_direction) :- consistent(smv, flex_direction), (indep(s13), consistent(s13, flex_direction) ; \+indep(s13)), (indep(s9), consistent(s9, flex_direction) ; \+indep(s9)).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

0.90::acc(s17, flex_feel_detail).

% @attr flex_feel_detail
% @type categorical
% @canonical false
% @original_name flex_feel (zonal detail)
% @values med_stiff_feet_med_nose_med_stiff_tail=Med_stiff_between_feet_med_nose_med_stiff_tail unk_flex_feel_detail=Unknown
% @importance 0.85

0.88::true_val(flex_feel_detail, med_stiff_feet_med_nose_med_stiff_tail); 0.12::true_val(flex_feel_detail, unk_flex_feel_detail).
measured(s17, flex_feel_detail, med_stiff_feet_med_nose_med_stiff_tail).
all_consistent(flex_feel_detail) :- consistent(s17, flex_feel_detail).
evidence(all_consistent(flex_feel_detail)).
query(true_val(flex_feel_detail, med_stiff_feet_med_nose_med_stiff_tail)).
query(true_val(flex_feel_detail, unk_flex_feel_detail)).

0.82::acc(s18, flex_feel_comparison).

% @attr flex_feel_comparison
% @type categorical
% @canonical false
% @original_name flex_feel (comparison)
% @values less_stiff_than_flight_attendant=Less_stiff_than_Flight_Attendant unk_flex_feel_comparison=Unknown
% @importance 0.8

0.80::true_val(flex_feel_comparison, less_stiff_than_flight_attendant); 0.20::true_val(flex_feel_comparison, unk_flex_feel_comparison).
measured(s18, flex_feel_comparison, less_stiff_than_flight_attendant).
all_consistent(flex_feel_comparison) :- consistent(s18, flex_feel_comparison).
evidence(all_consistent(flex_feel_comparison)).
query(true_val(flex_feel_comparison, less_stiff_than_flight_attendant)).
query(true_val(flex_feel_comparison, unk_flex_feel_comparison)).

0.90::acc(s9, core_material).
0.85::acc(s19, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values fsc_super_fly_800g=FSC_Certified_Super_Fly_800G_Core unk_core_material=Unknown
% @importance 0.80

0.95::true_val(core_material, fsc_super_fly_800g); 0.05::true_val(core_material, unk_core_material).
measured(s9, core_material, fsc_super_fly_800g).
measured(s19, core_material, fsc_super_fly_800g).
all_consistent(core_material) :- (indep(s9), consistent(s9, core_material) ; \+indep(s9)), (indep(s19), consistent(s19, core_material) ; \+indep(s19)).
evidence(all_consistent(core_material)).
query(true_val(core_material, fsc_super_fly_800g)).
query(true_val(core_material, unk_core_material)).

0.90::acc(smv, core_material_detail).
0.85::acc(s19, core_material_detail).

% @attr core_material_detail
% @type categorical
% @canonical false
% @original_name core_material (dual-density detail)
% @values dual_density_vertical_laminations=Dual_density_vertical_laminations_softwood_hardwood unk_core_material_detail=Unknown
% @importance 0.70

0.92::true_val(core_material_detail, dual_density_vertical_laminations); 0.08::true_val(core_material_detail, unk_core_material_detail).
measured(smv, core_material_detail, dual_density_vertical_laminations).
measured(s19, core_material_detail, dual_density_vertical_laminations).
all_consistent(core_material_detail) :- consistent(smv, core_material_detail), (indep(s19), consistent(s19, core_material_detail) ; \+indep(s19)).
evidence(all_consistent(core_material_detail)).
query(true_val(core_material_detail, dual_density_vertical_laminations)).
query(true_val(core_material_detail, unk_core_material_detail)).

0.85::acc(s20, core_material_squeezebox).

% @attr core_material_squeezebox
% @type categorical
% @canonical false
% @original_name core_material (Squeezebox)
% @values squeezebox_profile=Squeezebox_thick_thin_profiled_core unk_core_material_squeezebox=Unknown
% @importance 0.65

0.85::true_val(core_material_squeezebox, squeezebox_profile); 0.15::true_val(core_material_squeezebox, unk_core_material_squeezebox).
measured(s20, core_material_squeezebox, squeezebox_profile).
all_consistent(core_material_squeezebox) :- consistent(s20, core_material_squeezebox).
evidence(all_consistent(core_material_squeezebox)).
query(true_val(core_material_squeezebox, squeezebox_profile)).
query(true_val(core_material_squeezebox, unk_core_material_squeezebox)).

0.85::acc(s20, core_material_dualzone_egd).

% @attr core_material_dualzone_egd
% @type categorical
% @canonical false
% @original_name core_material (Dualzone EGD)
% @values dualzone_egd=Dualzone_EGD_perpendicular_grain_toe_heel unk_core_material_dualzone_egd=Unknown
% @importance 0.65

0.85::true_val(core_material_dualzone_egd, dualzone_egd); 0.15::true_val(core_material_dualzone_egd, unk_core_material_dualzone_egd).
measured(s20, core_material_dualzone_egd, dualzone_egd).
all_consistent(core_material_dualzone_egd) :- consistent(s20, core_material_dualzone_egd).
evidence(all_consistent(core_material_dualzone_egd)).
query(true_val(core_material_dualzone_egd, dualzone_egd)).
query(true_val(core_material_dualzone_egd, unk_core_material_dualzone_egd)).

0.85::acc(s9, sustainability_certification_core).

% @attr sustainability_certification_core
% @type categorical
% @canonical false
% @original_name sustainability_certification (core wood)
% @values fsc_certified_wood=FSC_Certified_core_wood unk_sustainability_certification_core=Unknown
% @importance 0.9

0.88::true_val(sustainability_certification_core, fsc_certified_wood); 0.12::true_val(sustainability_certification_core, unk_sustainability_certification_core).
measured(s9, sustainability_certification_core, fsc_certified_wood).
all_consistent(sustainability_certification_core) :- consistent(s9, sustainability_certification_core).
evidence(all_consistent(sustainability_certification_core)).
query(true_val(sustainability_certification_core, fsc_certified_wood)).
query(true_val(sustainability_certification_core, unk_sustainability_certification_core)).

0.90::acc(s9, laminate).
0.88::acc(s13, laminate).
0.90::acc(smv, laminate).
0.40::acc(s21, laminate).
0.82::acc(s45, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_fiberglass=Triax_Fiberglass mystery_glass=Mystery_Glass
% @importance 0.75

0.90::true_val(laminate, triax_fiberglass); 0.10::true_val(laminate, mystery_glass).
measured(s9, laminate, triax_fiberglass).
measured(s13, laminate, triax_fiberglass).
measured(smv, laminate, triax_fiberglass).
measured(s21, laminate, mystery_glass).
measured(s45, laminate, triax_fiberglass).
all_consistent(laminate) :- consistent(smv, laminate), (indep(s9), consistent(s9, laminate) ; \+indep(s9)), (indep(s13), consistent(s13, laminate) ; \+indep(s13)), (indep(s21), consistent(s21, laminate) ; \+indep(s21)), (indep(s45), consistent(s45, laminate) ; \+indep(s45)).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_fiberglass)).
query(true_val(laminate, mystery_glass)).

0.82::acc(s22, laminate_layup_detail).

% @attr laminate_layup_detail
% @type categorical
% @canonical false
% @original_name laminate (layup orientation)
% @values triax_stitched_45_0=Top_plus_minus_45_0_stitched_Bottom_0_plus_minus_45_stitched unk_laminate_layup_detail=Unknown
% @importance 0.5

0.80::true_val(laminate_layup_detail, triax_stitched_45_0); 0.20::true_val(laminate_layup_detail, unk_laminate_layup_detail).
measured(s22, laminate_layup_detail, triax_stitched_45_0).
all_consistent(laminate_layup_detail) :- consistent(s22, laminate_layup_detail).
evidence(all_consistent(laminate_layup_detail)).
query(true_val(laminate_layup_detail, triax_stitched_45_0)).
query(true_val(laminate_layup_detail, unk_laminate_layup_detail)).

0.90::acc(smv, base_material).
0.82::acc(s23, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO unk_base_material=Unknown
% @importance 0.65

0.95::true_val(base_material, sintered_wfo); 0.05::true_val(base_material, unk_base_material).
measured(smv, base_material, sintered_wfo).
measured(s23, base_material, sintered_wfo).
all_consistent(base_material) :- consistent(smv, base_material), (indep(s23), consistent(s23, base_material) ; \+indep(s23)).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

0.88::acc(s9, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered unk_base_type=Unknown
% @importance 0.9

0.90::true_val(base_type, sintered); 0.10::true_val(base_type, unk_base_type).
measured(s9, base_type, sintered).
all_consistent(base_type) :- consistent(s9, base_type).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

0.85::acc(s24, base_glide_description_official).

% @attr base_glide_description_official
% @type categorical
% @canonical false
% @original_name base_glide_performance (official description)
% @values durable_porous_wax_absorption=Durable_highly_porous_superior_wax_absorption unk_base_glide_description_official=Unknown
% @importance 0.65

0.85::true_val(base_glide_description_official, durable_porous_wax_absorption); 0.15::true_val(base_glide_description_official, unk_base_glide_description_official).
measured(s24, base_glide_description_official, durable_porous_wax_absorption).
all_consistent(base_glide_description_official) :- consistent(s24, base_glide_description_official).
evidence(all_consistent(base_glide_description_official)).
query(true_val(base_glide_description_official, durable_porous_wax_absorption)).
query(true_val(base_glide_description_official, unk_base_glide_description_official)).

0.90::acc(s25, base_glide_performance_tgr_detail).

% @attr base_glide_performance_tgr_detail
% @type categorical
% @canonical false
% @original_name base_glide_performance (TGR review detail)
% @values improved_2025_good_enough=Improved_for_2025_not_super_fast_good_enough_for_price unk_base_glide_performance_tgr_detail=Unknown
% @importance 0.7

0.88::true_val(base_glide_performance_tgr_detail, improved_2025_good_enough); 0.12::true_val(base_glide_performance_tgr_detail, unk_base_glide_performance_tgr_detail).
measured(s25, base_glide_performance_tgr_detail, improved_2025_good_enough).
all_consistent(base_glide_performance_tgr_detail) :- consistent(s25, base_glide_performance_tgr_detail).
evidence(all_consistent(base_glide_performance_tgr_detail)).
query(true_val(base_glide_performance_tgr_detail, improved_2025_good_enough)).
query(true_val(base_glide_performance_tgr_detail, unk_base_glide_performance_tgr_detail)).

0.88::acc(s26, base_glide_waxing_note).

% @attr base_glide_waxing_note
% @type categorical
% @canonical false
% @original_name base_glide_performance (waxing note)
% @values needs_consistent_waxing=Needs_consistent_waxing_for_optimal_glide unk_base_glide_waxing_note=Unknown
% @importance 0.85

0.88::true_val(base_glide_waxing_note, needs_consistent_waxing); 0.12::true_val(base_glide_waxing_note, unk_base_glide_waxing_note).
measured(s26, base_glide_waxing_note, needs_consistent_waxing).
all_consistent(base_glide_waxing_note) :- consistent(s26, base_glide_waxing_note).
evidence(all_consistent(base_glide_waxing_note)).
query(true_val(base_glide_waxing_note, needs_consistent_waxing)).
query(true_val(base_glide_waxing_note, unk_base_glide_waxing_note)).

0.90::acc(smv, resin).
0.88::acc(s27, resin).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_bio_based_epoxy_50pct_less_carbon unk_resin=Unknown
% @importance 0.4

0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).
measured(smv, resin, super_sap_epoxy).
measured(s27, resin, super_sap_epoxy).
all_consistent(resin) :- consistent(smv, resin), (indep(s27), consistent(s27, resin) ; \+indep(s27)).
evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

0.90::acc(s9, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel unk_mounting_pattern=Unknown
% @importance 0.9

0.92::true_val(mounting_pattern, the_channel); 0.08::true_val(mounting_pattern, unk_mounting_pattern).
measured(s9, mounting_pattern, the_channel).
all_consistent(mounting_pattern) :- consistent(s9, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.90::acc(smv, binding_compatibility).
0.88::acc(s28, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_major_best_est=Compatible_all_major_brands_best_with_Burton_EST unk_binding_compatibility=Unknown
% @importance 0.85

0.95::true_val(binding_compatibility, all_major_best_est); 0.05::true_val(binding_compatibility, unk_binding_compatibility).
measured(smv, binding_compatibility, all_major_best_est).
measured(s28, binding_compatibility, all_major_best_est).
all_consistent(binding_compatibility) :- consistent(smv, binding_compatibility), (indep(s28), consistent(s28, binding_compatibility) ; \+indep(s28)).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_major_best_est)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.82::acc(s29, durability_technology).

% @attr durability_technology
% @type categorical
% @canonical false
% @original_name Durability technology
% @values infinite_ride=Infinite_Ride_overbuilt_then_broken_in unk_durability_technology=Unknown
% @importance 0.6

0.82::true_val(durability_technology, infinite_ride); 0.18::true_val(durability_technology, unk_durability_technology).
measured(s29, durability_technology, infinite_ride).
all_consistent(durability_technology) :- consistent(s29, durability_technology).
evidence(all_consistent(durability_technology)).
query(true_val(durability_technology, infinite_ride)).
query(true_val(durability_technology, unk_durability_technology)).

0.88::acc(smv, tip_tail_technology).
0.80::acc(s30, tip_tail_technology).

% @attr tip_tail_technology
% @type categorical
% @canonical false
% @original_name Tip/tail technology
% @values pro_tip=Pro_Tip_reduced_swing_weight_mobility unk_tip_tail_technology=Unknown
% @importance 0.45

0.92::true_val(tip_tail_technology, pro_tip); 0.08::true_val(tip_tail_technology, unk_tip_tail_technology).
measured(smv, tip_tail_technology, pro_tip).
measured(s30, tip_tail_technology, pro_tip).
all_consistent(tip_tail_technology) :- consistent(smv, tip_tail_technology), (indep(s30), consistent(s30, tip_tail_technology) ; \+indep(s30)).
evidence(all_consistent(tip_tail_technology)).
query(true_val(tip_tail_technology, pro_tip)).
query(true_val(tip_tail_technology, unk_tip_tail_technology)).

0.88::acc(smv, geometry_balanced_freeride).
0.80::acc(s31, geometry_balanced_freeride).

% @attr geometry_balanced_freeride
% @type categorical
% @canonical false
% @original_name Geometry
% @values balanced_freeride=Balanced_Freeride_Geometry_setback_camber_stance_centred_sidecut unk_geometry_balanced_freeride=Unknown
% @importance 0.7

0.92::true_val(geometry_balanced_freeride, balanced_freeride); 0.08::true_val(geometry_balanced_freeride, unk_geometry_balanced_freeride).
measured(smv, geometry_balanced_freeride, balanced_freeride).
measured(s31, geometry_balanced_freeride, balanced_freeride).
all_consistent(geometry_balanced_freeride) :- consistent(smv, geometry_balanced_freeride), (indep(s31), consistent(s31, geometry_balanced_freeride) ; \+indep(s31)).
evidence(all_consistent(geometry_balanced_freeride)).
query(true_val(geometry_balanced_freeride, balanced_freeride)).
query(true_val(geometry_balanced_freeride, unk_geometry_balanced_freeride)).

0.85::acc(s32, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty_from_purchase unk_warranty=Unknown
% @importance 0.8

0.88::true_val(warranty, three_year); 0.12::true_val(warranty, unk_warranty).
measured(s32, warranty, three_year).
all_consistent(warranty) :- consistent(s32, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

0.92::acc(smv, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values seven_sizes=144_149_154_159_162_154W_159W unk_available_sizes=Unknown
% @importance 0.70

0.92::true_val(available_sizes, seven_sizes); 0.08::true_val(available_sizes, unk_available_sizes).
measured(smv, available_sizes, seven_sizes).
all_consistent(available_sizes) :- consistent(smv, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, seven_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

0.92::acc(smv, width_options).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.70

0.92::true_val(width_options, standard_and_wide); 0.08::true_val(width_options, unk_width_options).
measured(smv, width_options, standard_and_wide).
all_consistent(width_options) :- consistent(smv, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.92::acc(smv, effective_edge_144).
0.88::acc(s33, effective_edge_144).

% @attr effective_edge_144
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 144cm
% @values v1062=1062.0 unk_effective_edge_144=Unknown
% @importance 0.75

0.95::true_val(effective_edge_144, v1062); 0.05::true_val(effective_edge_144, unk_effective_edge_144).
measured(smv, effective_edge_144, v1062).
measured(s33, effective_edge_144, v1062).
all_consistent(effective_edge_144) :- consistent(smv, effective_edge_144), (indep(s33), consistent(s33, effective_edge_144) ; \+indep(s33)).
evidence(all_consistent(effective_edge_144)).
query(true_val(effective_edge_144, v1062)).
query(true_val(effective_edge_144, unk_effective_edge_144)).

0.92::acc(smv, effective_edge_149).
0.88::acc(s33, effective_edge_149).

% @attr effective_edge_149
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 149cm
% @values v1092=1092.0 unk_effective_edge_149=Unknown
% @importance 0.75

0.95::true_val(effective_edge_149, v1092); 0.05::true_val(effective_edge_149, unk_effective_edge_149).
measured(smv, effective_edge_149, v1092).
measured(s33, effective_edge_149, v1092).
all_consistent(effective_edge_149) :- consistent(smv, effective_edge_149), (indep(s33), consistent(s33, effective_edge_149) ; \+indep(s33)).
evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v1092)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

0.92::acc(smv, effective_edge_154).
0.88::acc(s33, effective_edge_154).

% @attr effective_edge_154
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 154cm
% @values v1142=1142.0 unk_effective_edge_154=Unknown
% @importance 0.75

0.95::true_val(effective_edge_154, v1142); 0.05::true_val(effective_edge_154, unk_effective_edge_154).
measured(smv, effective_edge_154, v1142).
measured(s33, effective_edge_154, v1142).
all_consistent(effective_edge_154) :- consistent(smv, effective_edge_154), (indep(s33), consistent(s33, effective_edge_154) ; \+indep(s33)).
evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v1142)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

0.92::acc(smv, effective_edge_159).
0.88::acc(s33, effective_edge_159).

% @attr effective_edge_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 159cm
% @values v1192=1192.0 unk_effective_edge_159=Unknown
% @importance 0.75

0.95::true_val(effective_edge_159, v1192); 0.05::true_val(effective_edge_159, unk_effective_edge_159).
measured(smv, effective_edge_159, v1192).
measured(s33, effective_edge_159, v1192).
all_consistent(effective_edge_159) :- consistent(smv, effective_edge_159), (indep(s33), consistent(s33, effective_edge_159) ; \+indep(s33)).
evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1192)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

0.92::acc(smv, effective_edge_162).
0.88::acc(s33, effective_edge_162).

% @attr effective_edge_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 162cm
% @values v1222=1222.0 unk_effective_edge_162=Unknown
% @importance 0.75

0.95::true_val(effective_edge_162, v1222); 0.05::true_val(effective_edge_162, unk_effective_edge_162).
measured(smv, effective_edge_162, v1222).
measured(s33, effective_edge_162, v1222).
all_consistent(effective_edge_162) :- consistent(smv, effective_edge_162), (indep(s33), consistent(s33, effective_edge_162) ; \+indep(s33)).
evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1222)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

0.92::acc(smv, effective_edge_154w).
0.88::acc(s33, effective_edge_154w).

% @attr effective_edge_154w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 154cm Wide
% @values v1142=1142.0 unk_effective_edge_154w=Unknown
% @importance 0.75

0.95::true_val(effective_edge_154w, v1142); 0.05::true_val(effective_edge_154w, unk_effective_edge_154w).
measured(smv, effective_edge_154w, v1142).
measured(s33, effective_edge_154w, v1142).
all_consistent(effective_edge_154w) :- consistent(smv, effective_edge_154w), (indep(s33), consistent(s33, effective_edge_154w) ; \+indep(s33)).
evidence(all_consistent(effective_edge_154w)).
query(true_val(effective_edge_154w, v1142)).
query(true_val(effective_edge_154w, unk_effective_edge_154w)).

0.92::acc(smv, effective_edge_159w).
0.88::acc(s33, effective_edge_159w).

% @attr effective_edge_159w
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 159cm Wide
% @values v1192=1192.0 unk_effective_edge_159w=Unknown
% @importance 0.75

0.95::true_val(effective_edge_159w, v1192); 0.05::true_val(effective_edge_159w, unk_effective_edge_159w).
measured(smv, effective_edge_159w, v1192).
measured(s33, effective_edge_159w, v1192).
all_consistent(effective_edge_159w) :- consistent(smv, effective_edge_159w), (indep(s33), consistent(s33, effective_edge_159w) ; \+indep(s33)).
evidence(all_consistent(effective_edge_159w)).
query(true_val(effective_edge_159w, v1192)).
query(true_val(effective_edge_159w, unk_effective_edge_159w)).

0.92::acc(smv, sidecut_radius_size_144).

% @attr sidecut_radius_size_144
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (144cm)
% @values v6_5=6.5 unk_sidecut_radius_size_144=Unknown
% @importance 0.70

0.90::true_val(sidecut_radius_size_144, v6_5); 0.10::true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144).
measured(smv, sidecut_radius_size_144, v6_5).
all_consistent(sidecut_radius_size_144) :- consistent(smv, sidecut_radius_size_144).
evidence(all_consistent(sidecut_radius_size_144)).
query(true_val(sidecut_radius_size_144, v6_5)).
query(true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144)).

0.92::acc(smv, sidecut_radius_size_149).

% @attr sidecut_radius_size_149
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (149cm)
% @values v6_7=6.7 unk_sidecut_radius_size_149=Unknown
% @importance 0.70

0.90::true_val(sidecut_radius_size_149, v6_7); 0.10::true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149).
measured(smv, sidecut_radius_size_149, v6_7).
all_consistent(sidecut_radius_size_149) :- consistent(smv, sidecut_radius_size_149).
evidence(all_consistent(sidecut_radius_size_149)).
query(true_val(sidecut_radius_size_149, v6_7)).
query(true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149)).

0.92::acc(smv, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size (154cm)
% @values v7_0=7.0 unk_sidecut_radius_size=Unknown
% @importance 0.70

0.90::true_val(sidecut_radius_size, v7_0); 0.10::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(smv, sidecut_radius_size, v7_0).
all_consistent(sidecut_radius_size) :- consistent(smv, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_0)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.92::acc(smv, sidecut_radius_size_159).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @values v7_3=7.3 unk_sidecut_radius_size_159=Unknown
% @importance 0.70

0.90::true_val(sidecut_radius_size_159, v7_3); 0.10::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).
measured(smv, sidecut_radius_size_159, v7_3).
all_consistent(sidecut_radius_size_159) :- consistent(smv, sidecut_radius_size_159).
evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v7_3)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

0.92::acc(smv, sidecut_radius_size_162).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @values v7_5=7.5 unk_sidecut_radius_size_162=Unknown
% @importance 0.70

0.90::true_val(sidecut_radius_size_162, v7_5); 0.10::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).
measured(smv, sidecut_radius_size_162, v7_5).
all_consistent(sidecut_radius_size_162) :- consistent(smv, sidecut_radius_size_162).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v7_5)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

0.92::acc(smv, sidecut_radius_size_154w).

% @attr sidecut_radius_size_154w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (154cm Wide)
% @values v7_0=7.0 unk_sidecut_radius_size_154w=Unknown
% @importance 0.70

0.90::true_val(sidecut_radius_size_154w, v7_0); 0.10::true_val(sidecut_radius_size_154w, unk_sidecut_radius_size_154w).
measured(smv, sidecut_radius_size_154w, v7_0).
all_consistent(sidecut_radius_size_154w) :- consistent(smv, sidecut_radius_size_154w).
evidence(all_consistent(sidecut_radius_size_154w)).
query(true_val(sidecut_radius_size_154w, v7_0)).
query(true_val(sidecut_radius_size_154w, unk_sidecut_radius_size_154w)).

0.92::acc(smv, sidecut_radius_size_159w).

% @attr sidecut_radius_size_159w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159cm Wide)
% @values v7_3=7.3 unk_sidecut_radius_size_159w=Unknown
% @importance 0.70

0.90::true_val(sidecut_radius_size_159w, v7_3); 0.10::true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w).
measured(smv, sidecut_radius_size_159w, v7_3).
all_consistent(sidecut_radius_size_159w) :- consistent(smv, sidecut_radius_size_159w).
evidence(all_consistent(sidecut_radius_size_159w)).
query(true_val(sidecut_radius_size_159w, v7_3)).
query(true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w)).

0.92::acc(smv, waist_width_144).

% @attr waist_width_144
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 144cm
% @values v24_5=24.5 unk_waist_width_144=Unknown
% @importance 0.70

0.90::true_val(waist_width_144, v24_5); 0.10::true_val(waist_width_144, unk_waist_width_144).
measured(smv, waist_width_144, v24_5).
all_consistent(waist_width_144) :- consistent(smv, waist_width_144).
evidence(all_consistent(waist_width_144)).
query(true_val(waist_width_144, v24_5)).
query(true_val(waist_width_144, unk_waist_width_144)).

0.92::acc(smv, waist_width_149).

% @attr waist_width_149
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 149cm
% @values v25_0=25.0 unk_waist_width_149=Unknown
% @importance 0.70

0.90::true_val(waist_width_149, v25_0); 0.10::true_val(waist_width_149, unk_waist_width_149).
measured(smv, waist_width_149, v25_0).
all_consistent(waist_width_149) :- consistent(smv, waist_width_149).
evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v25_0)).
query(true_val(waist_width_149, unk_waist_width_149)).

0.92::acc(smv, waist_width_154).

% @attr waist_width_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 154cm
% @values v25_5=25.5 unk_waist_width_154=Unknown
% @importance 0.70

0.90::true_val(waist_width_154, v25_5); 0.10::true_val(waist_width_154, unk_waist_width_154).
measured(smv, waist_width_154, v25_5).
all_consistent(waist_width_154) :- consistent(smv, waist_width_154).
evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_5)).
query(true_val(waist_width_154, unk_waist_width_154)).

0.92::acc(smv, waist_width_159).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm
% @values v25_8=25.8 unk_waist_width_159=Unknown
% @importance 0.70

0.90::true_val(waist_width_159, v25_8); 0.10::true_val(waist_width_159, unk_waist_width_159).
measured(smv, waist_width_159, v25_8).
all_consistent(waist_width_159) :- consistent(smv, waist_width_159).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_8)).
query(true_val(waist_width_159, unk_waist_width_159)).

0.92::acc(smv, waist_width_162).

% @attr waist_width_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162cm
% @values v26_0=26.0 unk_waist_width_162=Unknown
% @importance 0.70

0.90::true_val(waist_width_162, v26_0); 0.10::true_val(waist_width_162, unk_waist_width_162).
measured(smv, waist_width_162, v26_0).
all_consistent(waist_width_162) :- consistent(smv, waist_width_162).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v26_0)).
query(true_val(waist_width_162, unk_waist_width_162)).

0.92::acc(smv, waist_width_154w).

% @attr waist_width_154w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 154cm Wide
% @values v26_3=26.3 unk_waist_width_154w=Unknown
% @importance 0.70

0.90::true_val(waist_width_154w, v26_3); 0.10::true_val(waist_width_154w, unk_waist_width_154w).
measured(smv, waist_width_154w, v26_3).
all_consistent(waist_width_154w) :- consistent(smv, waist_width_154w).
evidence(all_consistent(waist_width_154w)).
query(true_val(waist_width_154w, v26_3)).
query(true_val(waist_width_154w, unk_waist_width_154w)).

0.92::acc(smv, waist_width_159w).

% @attr waist_width_159w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm Wide
% @values v26_6=26.6 unk_waist_width_159w=Unknown
% @importance 0.70

0.90::true_val(waist_width_159w, v26_6); 0.10::true_val(waist_width_159w, unk_waist_width_159w).
measured(smv, waist_width_159w, v26_6).
all_consistent(waist_width_159w) :- consistent(smv, waist_width_159w).
evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_6)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

0.92::acc(smv, tip_tail_width_size_144).

% @attr tip_tail_width_size_144
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (144cm)
% @values v28_7_28_2=28.7/28.2 unk_tip_tail_width_size_144=Unknown
% @importance 0.70

0.90::true_val(tip_tail_width_size_144, v28_7_28_2); 0.10::true_val(tip_tail_width_size_144, unk_tip_tail_width_size_144).
measured(smv, tip_tail_width_size_144, v28_7_28_2).
all_consistent(tip_tail_width_size_144) :- consistent(smv, tip_tail_width_size_144).
evidence(all_consistent(tip_tail_width_size_144)).
query(true_val(tip_tail_width_size_144, v28_7_28_2)).
query(true_val(tip_tail_width_size_144, unk_tip_tail_width_size_144)).

0.92::acc(smv, tip_tail_width_size_149).

% @attr tip_tail_width_size_149
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (149cm)
% @values v29_3_28_8=29.3/28.8 unk_tip_tail_width_size_149=Unknown
% @importance 0.70

0.90::true_val(tip_tail_width_size_149, v29_3_28_8); 0.10::true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149).
measured(smv, tip_tail_width_size_149, v29_3_28_8).
all_consistent(tip_tail_width_size_149) :- consistent(smv, tip_tail_width_size_149).
evidence(all_consistent(tip_tail_width_size_149)).
query(true_val(tip_tail_width_size_149, v29_3_28_8)).
query(true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149)).

0.92::acc(smv, tip_tail_width_size).

% @attr tip_tail_width_size
% @type categorical
% @unit cm
% @canonical true
% @original_name tip_tail_width_size (154cm)
% @values v30_0_29_5=30.0/29.5 unk_tip_tail_width_size=Unknown
% @importance 0.70

0.90::true_val(tip_tail_width_size, v30_0_29_5); 0.10::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(smv, tip_tail_width_size, v30_0_29_5).
all_consistent(tip_tail_width_size) :- consistent(smv, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_0_29_5)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.92::acc(smv, tip_tail_width_size_159).

% @attr tip_tail_width_size_159
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (159cm)
% @values v30_5_30_0=30.5/30.0 unk_tip_tail_width_size_159=Unknown
% @importance 0.70

0.90::true_val(tip_tail_width_size_159, v30_5_30_0); 0.10::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).
measured(smv, tip_tail_width_size_159, v30_5_30_0).
all_consistent(tip_tail_width_size_159) :- consistent(smv, tip_tail_width_size_159).
evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v30_5_30_0)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

0.92::acc(smv, tip_tail_width_size_162).

% @attr tip_tail_width_size_162
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (162cm)
% @values v30_8_30_3=30.8/30.3 unk_tip_tail_width_size_162=Unknown
% @importance 0.70

0.90::true_val(tip_tail_width_size_162, v30_8_30_3); 0.10::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).
measured(smv, tip_tail_width_size_162, v30_8_30_3).
all_consistent(tip_tail_width_size_162) :- consistent(smv, tip_tail_width_size_162).
evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v30_8_30_3)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

0.92::acc(smv, tip_tail_width_size_154w).

% @attr tip_tail_width_size_154w
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (154cm Wide)
% @values v30_8_30_3=30.8/30.3 unk_tip_tail_width_size_154w=Unknown
% @importance 0.70

0.90::true_val(tip_tail_width_size_154w, v30_8_30_3); 0.10::true_val(tip_tail_width_size_154w, unk_tip_tail_width_size_154w).
measured(smv, tip_tail_width_size_154w, v30_8_30_3).
all_consistent(tip_tail_width_size_154w) :- consistent(smv, tip_tail_width_size_154w).
evidence(all_consistent(tip_tail_width_size_154w)).
query(true_val(tip_tail_width_size_154w, v30_8_30_3)).
query(true_val(tip_tail_width_size_154w, unk_tip_tail_width_size_154w)).

0.92::acc(smv, tip_tail_width_size_159w).

% @attr tip_tail_width_size_159w
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (159cm Wide)
% @values v31_3_30_8=31.3/30.8 unk_tip_tail_width_size_159w=Unknown
% @importance 0.70

0.90::true_val(tip_tail_width_size_159w, v31_3_30_8); 0.10::true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w).
measured(smv, tip_tail_width_size_159w, v31_3_30_8).
all_consistent(tip_tail_width_size_159w) :- consistent(smv, tip_tail_width_size_159w).
evidence(all_consistent(tip_tail_width_size_159w)).
query(true_val(tip_tail_width_size_159w, v31_3_30_8)).
query(true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w)).

0.92::acc(smv, stance_width_range_size_144).

% @attr stance_width_range_size_144
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (small sizes)
% @values v50_5=50.5 unk_stance_width_range_size_144=Unknown
% @importance 0.70

0.90::true_val(stance_width_range_size_144, v50_5); 0.10::true_val(stance_width_range_size_144, unk_stance_width_range_size_144).
measured(smv, stance_width_range_size_144, v50_5).
all_consistent(stance_width_range_size_144) :- consistent(smv, stance_width_range_size_144).
evidence(all_consistent(stance_width_range_size_144)).
query(true_val(stance_width_range_size_144, v50_5)).
query(true_val(stance_width_range_size_144, unk_stance_width_range_size_144)).

0.92::acc(smv, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size (154cm)
% @values v53_0=53.0 unk_stance_width_range_size=Unknown
% @importance 0.70

0.90::true_val(stance_width_range_size, v53_0); 0.10::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(smv, stance_width_range_size, v53_0).
all_consistent(stance_width_range_size) :- consistent(smv, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v53_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.92::acc(smv, stance_width_range_size_159).

% @attr stance_width_range_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (large sizes)
% @values v56_0=56.0 unk_stance_width_range_size_159=Unknown
% @importance 0.70

0.90::true_val(stance_width_range_size_159, v56_0); 0.10::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).
measured(smv, stance_width_range_size_159, v56_0).
all_consistent(stance_width_range_size_159) :- consistent(smv, stance_width_range_size_159).
evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v56_0)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

0.92::acc(smv, setback).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v_neg2_5=-2.5 unk_setback=Unknown
% @importance 0.70

0.90::true_val(setback, v_neg2_5); 0.10::true_val(setback, unk_setback).
measured(smv, setback, v_neg2_5).
all_consistent(setback) :- consistent(smv, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v_neg2_5)).
query(true_val(setback, unk_setback)).

0.92::acc(smv, recommended_weight_range_size_144).

% @attr recommended_weight_range_size_144
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (144cm)
% @values w45_68=45-68kg unk_recommended_weight_range_size_144=Unknown
% @importance 0.70

0.90::true_val(recommended_weight_range_size_144, w45_68); 0.10::true_val(recommended_weight_range_size_144, unk_recommended_weight_range_size_144).
measured(smv, recommended_weight_range_size_144, w45_68).
all_consistent(recommended_weight_range_size_144) :- consistent(smv, recommended_weight_range_size_144).
evidence(all_consistent(recommended_weight_range_size_144)).
query(true_val(recommended_weight_range_size_144, w45_68)).
query(true_val(recommended_weight_range_size_144, unk_recommended_weight_range_size_144)).

0.92::acc(smv, recommended_weight_range_size_149).

% @attr recommended_weight_range_size_149
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (149cm)
% @values w45_68=45-68kg unk_recommended_weight_range_size_149=Unknown
% @importance 0.70

0.90::true_val(recommended_weight_range_size_149, w45_68); 0.10::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).
measured(smv, recommended_weight_range_size_149, w45_68).
all_consistent(recommended_weight_range_size_149) :- consistent(smv, recommended_weight_range_size_149).
evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, w45_68)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

0.92::acc(smv, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (154cm)
% @values w54_82=54-82kg unk_recommended_weight_range_size=Unknown
% @importance 0.70

0.90::true_val(recommended_weight_range_size, w54_82); 0.10::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(smv, recommended_weight_range_size, w54_82).
all_consistent(recommended_weight_range_size) :- consistent(smv, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w54_82)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.92::acc(smv, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @values w68_91=68-91kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.70

0.90::true_val(recommended_weight_range_size_159, w68_91); 0.10::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).
measured(smv, recommended_weight_range_size_159, w68_91).
all_consistent(recommended_weight_range_size_159) :- consistent(smv, recommended_weight_range_size_159).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w68_91)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

0.92::acc(smv, recommended_weight_range_size_162).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @values w82_118=82-118kg unk_recommended_weight_range_size_162=Unknown
% @importance 0.70

0.90::true_val(recommended_weight_range_size_162, w82_118); 0.10::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).
measured(smv, recommended_weight_range_size_162, w82_118).
all_consistent(recommended_weight_range_size_162) :- consistent(smv, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w82_118)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

0.92::acc(smv, recommended_weight_range_size_154w).

% @attr recommended_weight_range_size_154w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (154cm Wide)
% @values w54_82=54-82kg unk_recommended_weight_range_size_154w=Unknown
% @importance 0.70

0.90::true_val(recommended_weight_range_size_154w, w54_82); 0.10::true_val(recommended_weight_range_size_154w, unk_recommended_weight_range_size_154w).
measured(smv, recommended_weight_range_size_154w, w54_82).
all_consistent(recommended_weight_range_size_154w) :- consistent(smv, recommended_weight_range_size_154w).
evidence(all_consistent(recommended_weight_range_size_154w)).
query(true_val(recommended_weight_range_size_154w, w54_82)).
query(true_val(recommended_weight_range_size_154w, unk_recommended_weight_range_size_154w)).

0.92::acc(smv, recommended_weight_range_size_159w).

% @attr recommended_weight_range_size_159w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (159cm Wide)
% @values w68_91=68-91kg unk_recommended_weight_range_size_159w=Unknown
% @importance 0.70

0.90::true_val(recommended_weight_range_size_159w, w68_91); 0.10::true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w).
measured(smv, recommended_weight_range_size_159w, w68_91).
all_consistent(recommended_weight_range_size_159w) :- consistent(smv, recommended_weight_range_size_159w).
evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, w68_91)).
query(true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w)).

0.88::acc(s34, ideal_boot_size_149).

% @attr ideal_boot_size_149
% @type categorical
% @canonical false
% @original_name Ideal boot size 149cm
% @values us8_9=US_8-9 unk_ideal_boot_size_149=Unknown
% @importance 0.85

0.85::true_val(ideal_boot_size_149, us8_9); 0.15::true_val(ideal_boot_size_149, unk_ideal_boot_size_149).
measured(s34, ideal_boot_size_149, us8_9).
all_consistent(ideal_boot_size_149) :- consistent(s34, ideal_boot_size_149).
evidence(all_consistent(ideal_boot_size_149)).
query(true_val(ideal_boot_size_149, us8_9)).
query(true_val(ideal_boot_size_149, unk_ideal_boot_size_149)).

0.88::acc(s34, ideal_boot_size_154).

% @attr ideal_boot_size_154
% @type categorical
% @canonical false
% @original_name Ideal boot size 154cm
% @values us8_5_9_5=US_8.5-9.5 unk_ideal_boot_size_154=Unknown
% @importance 0.85

0.85::true_val(ideal_boot_size_154, us8_5_9_5); 0.15::true_val(ideal_boot_size_154, unk_ideal_boot_size_154).
measured(s34, ideal_boot_size_154, us8_5_9_5).
all_consistent(ideal_boot_size_154) :- consistent(s34, ideal_boot_size_154).
evidence(all_consistent(ideal_boot_size_154)).
query(true_val(ideal_boot_size_154, us8_5_9_5)).
query(true_val(ideal_boot_size_154, unk_ideal_boot_size_154)).

0.88::acc(s34, ideal_boot_size_159).

% @attr ideal_boot_size_159
% @type categorical
% @canonical false
% @original_name Ideal boot size 159cm
% @values us9_5_10_5=US_9.5-10.5 unk_ideal_boot_size_159=Unknown
% @importance 0.85

0.85::true_val(ideal_boot_size_159, us9_5_10_5); 0.15::true_val(ideal_boot_size_159, unk_ideal_boot_size_159).
measured(s34, ideal_boot_size_159, us9_5_10_5).
all_consistent(ideal_boot_size_159) :- consistent(s34, ideal_boot_size_159).
evidence(all_consistent(ideal_boot_size_159)).
query(true_val(ideal_boot_size_159, us9_5_10_5)).
query(true_val(ideal_boot_size_159, unk_ideal_boot_size_159)).

0.88::acc(s34, ideal_boot_size_162).

% @attr ideal_boot_size_162
% @type categorical
% @canonical false
% @original_name Ideal boot size 162cm
% @values us10_11=US_10-11 unk_ideal_boot_size_162=Unknown
% @importance 0.85

0.85::true_val(ideal_boot_size_162, us10_11); 0.15::true_val(ideal_boot_size_162, unk_ideal_boot_size_162).
measured(s34, ideal_boot_size_162, us10_11).
all_consistent(ideal_boot_size_162) :- consistent(s34, ideal_boot_size_162).
evidence(all_consistent(ideal_boot_size_162)).
query(true_val(ideal_boot_size_162, us10_11)).
query(true_val(ideal_boot_size_162, unk_ideal_boot_size_162)).

0.88::acc(s34, ideal_boot_size_154w).

% @attr ideal_boot_size_154w
% @type categorical
% @canonical false
% @original_name Ideal boot size 154W
% @values us10_11=US_10-11 unk_ideal_boot_size_154w=Unknown
% @importance 0.85

0.85::true_val(ideal_boot_size_154w, us10_11); 0.15::true_val(ideal_boot_size_154w, unk_ideal_boot_size_154w).
measured(s34, ideal_boot_size_154w, us10_11).
all_consistent(ideal_boot_size_154w) :- consistent(s34, ideal_boot_size_154w).
evidence(all_consistent(ideal_boot_size_154w)).
query(true_val(ideal_boot_size_154w, us10_11)).
query(true_val(ideal_boot_size_154w, unk_ideal_boot_size_154w)).

0.88::acc(s34, ideal_boot_size_159w).

% @attr ideal_boot_size_159w
% @type categorical
% @canonical false
% @original_name Ideal boot size 159W
% @values us11_12=US_11-12 unk_ideal_boot_size_159w=Unknown
% @importance 0.85

0.85::true_val(ideal_boot_size_159w, us11_12); 0.15::true_val(ideal_boot_size_159w, unk_ideal_boot_size_159w).
measured(s34, ideal_boot_size_159w, us11_12).
all_consistent(ideal_boot_size_159w) :- consistent(s34, ideal_boot_size_159w).
evidence(all_consistent(ideal_boot_size_159w)).
query(true_val(ideal_boot_size_159w, us11_12)).
query(true_val(ideal_boot_size_159w, unk_ideal_boot_size_159w)).

0.88::acc(s35, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v529_95=529.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.90::true_val(price_usd_msrp, v529_95); 0.10::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s35, price_usd_msrp, v529_95).
all_consistent(price_usd_msrp) :- consistent(s35, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v529_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.88::acc(s35, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo (sale)
% @values v370_96=370.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.88::true_val(price_usd_evo, v370_96); 0.12::true_val(price_usd_evo, unk_price_usd_evo).
measured(s35, price_usd_evo, v370_96).
all_consistent(price_usd_evo) :- consistent(s35, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v370_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.88::acc(s35, price_usd_evo_full).

% @attr price_usd_evo_full
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo (full/RRP)
% @values v529_95=529.95 unk_price_usd_evo_full=Unknown
% @importance 0.95

0.88::true_val(price_usd_evo_full, v529_95); 0.12::true_val(price_usd_evo_full, unk_price_usd_evo_full).
measured(s35, price_usd_evo_full, v529_95).
all_consistent(price_usd_evo_full) :- consistent(s35, price_usd_evo_full).
evidence(all_consistent(price_usd_evo_full)).
query(true_val(price_usd_evo_full, v529_95)).
query(true_val(price_usd_evo_full, unk_price_usd_evo_full)).

0.85::acc(s36, price_cad_burton_canada).

% @attr price_cad_burton_canada
% @type numeric
% @unit CAD
% @canonical false
% @original_name Price at Burton Canada
% @values v649_99=649.99 unk_price_cad_burton_canada=Unknown
% @importance 0.9

0.85::true_val(price_cad_burton_canada, v649_99); 0.15::true_val(price_cad_burton_canada, unk_price_cad_burton_canada).
measured(s36, price_cad_burton_canada, v649_99).
all_consistent(price_cad_burton_canada) :- consistent(s36, price_cad_burton_canada).
evidence(all_consistent(price_cad_burton_canada)).
query(true_val(price_cad_burton_canada, v649_99)).
query(true_val(price_cad_burton_canada, unk_price_cad_burton_canada)).

0.85::acc(s35, price_eur_snowcountry).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price at SnowCountry (EU)
% @values v412_46=412.46 unk_price_eur_snowcountry=Unknown
% @importance 0.95

0.85::true_val(price_eur_snowcountry, v412_46); 0.15::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).
measured(s35, price_eur_snowcountry, v412_46).
all_consistent(price_eur_snowcountry) :- consistent(s35, price_eur_snowcountry).
evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v412_46)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

0.78::acc(s37, price_usd_source_snowboard).

% @attr price_usd_source_snowboard
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price at The Source Snowboard & Skate
% @values v462_00=462.0 unk_price_usd_source_snowboard=Unknown
% @importance 0.85

0.80::true_val(price_usd_source_snowboard, v462_00); 0.20::true_val(price_usd_source_snowboard, unk_price_usd_source_snowboard).
measured(s37, price_usd_source_snowboard, v462_00).
all_consistent(price_usd_source_snowboard) :- consistent(s37, price_usd_source_snowboard).
evidence(all_consistent(price_usd_source_snowboard)).
query(true_val(price_usd_source_snowboard, v462_00)).
query(true_val(price_usd_source_snowboard, unk_price_usd_source_snowboard)).

0.80::acc(s38, price_eur_montaz).

% @attr price_eur_montaz
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price at Montaz (EU)
% @values v539_89=539.89 unk_price_eur_montaz=Unknown
% @importance 0.8

0.80::true_val(price_eur_montaz, v539_89); 0.20::true_val(price_eur_montaz, unk_price_eur_montaz).
measured(s38, price_eur_montaz, v539_89).
all_consistent(price_eur_montaz) :- consistent(s38, price_eur_montaz).
evidence(all_consistent(price_eur_montaz)).
query(true_val(price_eur_montaz, v539_89)).
query(true_val(price_eur_montaz, unk_price_eur_montaz)).

0.90::acc(smv, sku).

% @attr sku
% @type categorical
% @canonical true
% @original_name SKU
% @values sku_22942102000=22942102000_size_specific unk_sku=Unknown
% @importance 0.70

0.90::true_val(sku, sku_22942102000); 0.10::true_val(sku, unk_sku).
measured(smv, sku, sku_22942102000).
all_consistent(sku) :- consistent(smv, sku).
evidence(all_consistent(sku)).
query(true_val(sku, sku_22942102000)).
query(true_val(sku, unk_sku)).

0.95::acc(s1, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_w2026=Available_Winter_2026 unk_availability_status=Unknown
% @importance 1.0

0.95::true_val(availability_status, available_w2026); 0.05::true_val(availability_status, unk_availability_status).
measured(s1, availability_status, available_w2026).
all_consistent(availability_status) :- consistent(s1, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_w2026)).
query(true_val(availability_status, unk_availability_status)).

0.85::acc(s35, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo clearance)
% @values available_some_clearance=Available_some_sizes_on_clearance unk_availability_status_evo=Unknown
% @importance 0.95

0.85::true_val(availability_status_evo, available_some_clearance); 0.15::true_val(availability_status_evo, unk_availability_status_evo).
measured(s35, availability_status_evo, available_some_clearance).
all_consistent(availability_status_evo) :- consistent(s35, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available_some_clearance)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.85::acc(s33, availability_status_backcountry).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry)
% @values available_2026=Available_as_2026 unk_availability_status_backcountry=Unknown
% @importance 0.75

0.85::true_val(availability_status_backcountry, available_2026); 0.15::true_val(availability_status_backcountry, unk_availability_status_backcountry).
measured(s33, availability_status_backcountry, available_2026).
all_consistent(availability_status_backcountry) :- consistent(s33, availability_status_backcountry).
evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available_2026)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

0.78::acc(s39, availability_status_rei).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI)
% @values listed_2024_25=Listed_2024_2025_model unk_availability_status_rei=Unknown
% @importance 0.7

0.75::true_val(availability_status_rei, listed_2024_25); 0.25::true_val(availability_status_rei, unk_availability_status_rei).
measured(s39, availability_status_rei, listed_2024_25).
all_consistent(availability_status_rei) :- consistent(s39, availability_status_rei).
evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, listed_2024_25)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

0.82::acc(s8, availability_status_peterglenn).

% @attr availability_status_peterglenn
% @type categorical
% @canonical false
% @original_name availability_status (Peter Glenn)
% @values available_w2026=Available_2026_Winter unk_availability_status_peterglenn=Unknown
% @importance 0.7

0.82::true_val(availability_status_peterglenn, available_w2026); 0.18::true_val(availability_status_peterglenn, unk_availability_status_peterglenn).
measured(s8, availability_status_peterglenn, available_w2026).
all_consistent(availability_status_peterglenn) :- consistent(s8, availability_status_peterglenn).
evidence(all_consistent(availability_status_peterglenn)).
query(true_val(availability_status_peterglenn, available_w2026)).
query(true_val(availability_status_peterglenn, unk_availability_status_peterglenn)).

0.78::acc(s40, availability_status_focus).

% @attr availability_status_focus
% @type categorical
% @canonical false
% @original_name availability_status (Focus Boardshop)
% @values backordered_154=154_backordered unk_availability_status_focus=Unknown
% @importance 0.6

0.78::true_val(availability_status_focus, backordered_154); 0.22::true_val(availability_status_focus, unk_availability_status_focus).
measured(s40, availability_status_focus, backordered_154).
all_consistent(availability_status_focus) :- consistent(s40, availability_status_focus).
evidence(all_consistent(availability_status_focus)).
query(true_val(availability_status_focus, backordered_154)).
query(true_val(availability_status_focus, unk_availability_status_focus)).

0.78::acc(s41, availability_status_eriks).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status (Erik's)
% @values closeout=Listed_as_closeout_item unk_availability_status_eriks=Unknown
% @importance 0.7

0.78::true_val(availability_status_eriks, closeout); 0.22::true_val(availability_status_eriks, unk_availability_status_eriks).
measured(s41, availability_status_eriks, closeout).
all_consistent(availability_status_eriks) :- consistent(s41, availability_status_eriks).
evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, closeout)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

0.75::acc(s37, availability_status_source).

% @attr availability_status_source
% @type categorical
% @canonical false
% @original_name availability_status (The Source)
% @values sale_most_sold_out=Sale_most_sizes_sold_out unk_availability_status_source=Unknown
% @importance 0.85

0.75::true_val(availability_status_source, sale_most_sold_out); 0.25::true_val(availability_status_source, unk_availability_status_source).
measured(s37, availability_status_source, sale_most_sold_out).
all_consistent(availability_status_source) :- consistent(s37, availability_status_source).
evidence(all_consistent(availability_status_source)).
query(true_val(availability_status_source, sale_most_sold_out)).
query(true_val(availability_status_source, unk_availability_status_source)).

0.82::acc(s16, availability_status_blauer).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer)
% @values available=Available unk_availability_status_blauer=Unknown
% @importance 0.85

0.82::true_val(availability_status_blauer, available); 0.18::true_val(availability_status_blauer, unk_availability_status_blauer).
measured(s16, availability_status_blauer, available).
all_consistent(availability_status_blauer) :- consistent(s16, availability_status_blauer).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

0.78::acc(s42, availability_status_corbetts).

% @attr availability_status_corbetts
% @type categorical
% @canonical false
% @original_name availability_status (Corbetts)
% @values available=Available unk_availability_status_corbetts=Unknown
% @importance 0.5

0.78::true_val(availability_status_corbetts, available); 0.22::true_val(availability_status_corbetts, unk_availability_status_corbetts).
measured(s42, availability_status_corbetts, available).
all_consistent(availability_status_corbetts) :- consistent(s42, availability_status_corbetts).
evidence(all_consistent(availability_status_corbetts)).
query(true_val(availability_status_corbetts, available)).
query(true_val(availability_status_corbetts, unk_availability_status_corbetts)).

0.78::acc(s43, availability_status_thehouse).

% @attr availability_status_thehouse
% @type categorical
% @canonical false
% @original_name availability_status (The House)
% @values available=Available unk_availability_status_thehouse=Unknown
% @importance 0.5

0.78::true_val(availability_status_thehouse, available); 0.22::true_val(availability_status_thehouse, unk_availability_status_thehouse).
measured(s43, availability_status_thehouse, available).
all_consistent(availability_status_thehouse) :- consistent(s43, availability_status_thehouse).
evidence(all_consistent(availability_status_thehouse)).
query(true_val(availability_status_thehouse, available)).
query(true_val(availability_status_thehouse, unk_availability_status_thehouse)).

0.78::acc(s44, availability_status_skibum).

% @attr availability_status_skibum
% @type categorical
% @canonical false
% @original_name availability_status (The Ski Bum)
% @values available=Available unk_availability_status_skibum=Unknown
% @importance 0.5

0.78::true_val(availability_status_skibum, available); 0.22::true_val(availability_status_skibum, unk_availability_status_skibum).
measured(s44, availability_status_skibum, available).
all_consistent(availability_status_skibum) :- consistent(s44, availability_status_skibum).
evidence(all_consistent(availability_status_skibum)).
query(true_val(availability_status_skibum, available)).
query(true_val(availability_status_skibum, unk_availability_status_skibum)).

0.88::acc(s9, availability_status_tustablas).

% @attr availability_status_tustablas
% @type categorical
% @canonical false
% @original_name availability_status (TusTablas)
% @values available=Available unk_availability_status_tustablas=Unknown
% @importance 0.9

0.88::true_val(availability_status_tustablas, available); 0.12::true_val(availability_status_tustablas, unk_availability_status_tustablas).
measured(s9, availability_status_tustablas, available).
all_consistent(availability_status_tustablas) :- consistent(s9, availability_status_tustablas).
evidence(all_consistent(availability_status_tustablas)).
query(true_val(availability_status_tustablas, available)).
query(true_val(availability_status_tustablas, unk_availability_status_tustablas)).

0.85::acc(s35, availability_status_tgr_agg).

% @attr availability_status_tgr_agg
% @type categorical
% @canonical false
% @original_name availability_status (TGR aggregated)
% @values available=Available unk_availability_status_tgr_agg=Unknown
% @importance 0.95

0.85::true_val(availability_status_tgr_agg, available); 0.15::true_val(availability_status_tgr_agg, unk_availability_status_tgr_agg).
measured(s35, availability_status_tgr_agg, available).
all_consistent(availability_status_tgr_agg) :- consistent(s35, availability_status_tgr_agg).
evidence(all_consistent(availability_status_tgr_agg)).
query(true_val(availability_status_tgr_agg, available)).
query(true_val(availability_status_tgr_agg, unk_availability_status_tgr_agg)).

0.80::acc(s38, availability_status_montaz).

% @attr availability_status_montaz
% @type categorical
% @canonical false
% @original_name availability_status (Montaz)
% @values available_154_159_162=Available_in_154_159_162 unk_availability_status_montaz=Unknown
% @importance 0.8

0.80::true_val(availability_status_montaz, available_154_159_162); 0.20::true_val(availability_status_montaz, unk_availability_status_montaz).
measured(s38, availability_status_montaz, available_154_159_162).
all_consistent(availability_status_montaz) :- consistent(s38, availability_status_montaz).
evidence(all_consistent(availability_status_montaz)).
query(true_val(availability_status_montaz, available_154_159_162)).
query(true_val(availability_status_montaz, unk_availability_status_montaz)).

0.80::acc(s23, availability_status_melbourne).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne)
% @values available=Available unk_availability_status_melbourne=Unknown
% @importance 0.65

0.80::true_val(availability_status_melbourne, available); 0.20::true_val(availability_status_melbourne, unk_availability_status_melbourne).
measured(s23, availability_status_melbourne, available).
all_consistent(availability_status_melbourne) :- consistent(s23, availability_status_melbourne).
evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

0.78::acc(s45, availability_status_comor).

% @attr availability_status_comor
% @type categorical
% @canonical false
% @original_name availability_status (Comor)
% @values available=Available unk_availability_status_comor=Unknown
% @importance 0.6

0.78::true_val(availability_status_comor, available); 0.22::true_val(availability_status_comor, unk_availability_status_comor).
measured(s45, availability_status_comor, available).
all_consistent(availability_status_comor) :- consistent(s45, availability_status_comor).
evidence(all_consistent(availability_status_comor)).
query(true_val(availability_status_comor, available)).
query(true_val(availability_status_comor, unk_availability_status_comor)).

0.72::acc(s46, availability_status_pathfinder).

% @attr availability_status_pathfinder
% @type categorical
% @canonical false
% @original_name availability_status (Pathfinder)
% @values available=Available unk_availability_status_pathfinder=Unknown
% @importance 0.45

0.72::true_val(availability_status_pathfinder, available); 0.28::true_val(availability_status_pathfinder, unk_availability_status_pathfinder).
measured(s46, availability_status_pathfinder, available).
all_consistent(availability_status_pathfinder) :- consistent(s46, availability_status_pathfinder).
evidence(all_consistent(availability_status_pathfinder)).
query(true_val(availability_status_pathfinder, available)).
query(true_val(availability_status_pathfinder, unk_availability_status_pathfinder)).

0.88::acc(smv, availability_status_mv_au).

% @attr availability_status_mv_au
% @type categorical
% @canonical false
% @original_name availability_status (MV Australia)
% @values sold_out_20pct_au_only=Sold_out_20pct_discount_Australia_only unk_availability_status_mv_au=Unknown
% @importance 0.70

0.85::true_val(availability_status_mv_au, sold_out_20pct_au_only); 0.15::true_val(availability_status_mv_au, unk_availability_status_mv_au).
measured(smv, availability_status_mv_au, sold_out_20pct_au_only).
all_consistent(availability_status_mv_au) :- consistent(smv, availability_status_mv_au).
evidence(all_consistent(availability_status_mv_au)).
query(true_val(availability_status_mv_au, sold_out_20pct_au_only)).
query(true_val(availability_status_mv_au, unk_availability_status_mv_au)).

0.93::acc(s1, retailer_info_burton).

% @attr retailer_info_burton
% @type categorical
% @canonical false
% @original_name Burton.com
% @values official_manufacturer_direct=Official_manufacturer_direct_store unk_retailer_info_burton=Unknown
% @importance 1.0

0.93::true_val(retailer_info_burton, official_manufacturer_direct); 0.07::true_val(retailer_info_burton, unk_retailer_info_burton).
measured(s1, retailer_info_burton, official_manufacturer_direct).
all_consistent(retailer_info_burton) :- consistent(s1, retailer_info_burton).
evidence(all_consistent(retailer_info_burton)).
query(true_val(retailer_info_burton, official_manufacturer_direct)).
query(true_val(retailer_info_burton, unk_retailer_info_burton)).

0.85::acc(s47, retailer_info_evo).

% @attr retailer_info_evo
% @type categorical
% @canonical false
% @original_name evo.com
% @values major_specialty_retailer=Major_specialty_outdoor_retailer_price_match unk_retailer_info_evo=Unknown
% @importance 0.5

0.85::true_val(retailer_info_evo, major_specialty_retailer); 0.15::true_val(retailer_info_evo, unk_retailer_info_evo).
measured(s47, retailer_info_evo, major_specialty_retailer).
all_consistent(retailer_info_evo) :- consistent(s47, retailer_info_evo).
evidence(all_consistent(retailer_info_evo)).
query(true_val(retailer_info_evo, major_specialty_retailer)).
query(true_val(retailer_info_evo, unk_retailer_info_evo)).

0.82::acc(s39, retailer_info_rei).

% @attr retailer_info_rei
% @type categorical
% @canonical false
% @original_name REI
% @values major_outdoor_coop=Major_outdoor_coop_retailer unk_retailer_info_rei=Unknown
% @importance 0.7

0.82::true_val(retailer_info_rei, major_outdoor_coop); 0.18::true_val(retailer_info_rei, unk_retailer_info_rei).
measured(s39, retailer_info_rei, major_outdoor_coop).
all_consistent(retailer_info_rei) :- consistent(s39, retailer_info_rei).
evidence(all_consistent(retailer_info_rei)).
query(true_val(retailer_info_rei, major_outdoor_coop)).
query(true_val(retailer_info_rei, unk_retailer_info_rei)).

0.85::acc(s33, retailer_info_backcountry).

% @attr retailer_info_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry.com
% @values major_us_outdoor_retailer=Major_US_outdoor_retailer unk_retailer_info_backcountry=Unknown
% @importance 0.75

0.85::true_val(retailer_info_backcountry, major_us_outdoor_retailer); 0.15::true_val(retailer_info_backcountry, unk_retailer_info_backcountry).
measured(s33, retailer_info_backcountry, major_us_outdoor_retailer).
all_consistent(retailer_info_backcountry) :- consistent(s33, retailer_info_backcountry).
evidence(all_consistent(retailer_info_backcountry)).
query(true_val(retailer_info_backcountry, major_us_outdoor_retailer)).
query(true_val(retailer_info_backcountry, unk_retailer_info_backcountry)).

0.78::acc(s8, retailer_info_peterglenn).

% @attr retailer_info_peterglenn
% @type categorical
% @canonical false
% @original_name Peter Glenn
% @values established_us_ski_retailer=Established_US_ski_sports_retailer unk_retailer_info_peterglenn=Unknown
% @importance 0.7

0.78::true_val(retailer_info_peterglenn, established_us_ski_retailer); 0.22::true_val(retailer_info_peterglenn, unk_retailer_info_peterglenn).
measured(s8, retailer_info_peterglenn, established_us_ski_retailer).
all_consistent(retailer_info_peterglenn) :- consistent(s8, retailer_info_peterglenn).
evidence(all_consistent(retailer_info_peterglenn)).
query(true_val(retailer_info_peterglenn, established_us_ski_retailer)).
query(true_val(retailer_info_peterglenn, unk_retailer_info_peterglenn)).

0.78::acc(s40, retailer_info_focus).

% @attr retailer_info_focus
% @type categorical
% @canonical false
% @original_name Focus Boardshop
% @values rider_owned_independent=Rider_owned_independent_shop unk_retailer_info_focus=Unknown
% @importance 0.6

0.75::true_val(retailer_info_focus, rider_owned_independent); 0.25::true_val(retailer_info_focus, unk_retailer_info_focus).
measured(s40, retailer_info_focus, rider_owned_independent).
all_consistent(retailer_info_focus) :- consistent(s40, retailer_info_focus).
evidence(all_consistent(retailer_info_focus)).
query(true_val(retailer_info_focus, rider_owned_independent)).
query(true_val(retailer_info_focus, unk_retailer_info_focus)).

0.78::acc(s41, retailer_info_eriks).

% @attr retailer_info_eriks
% @type categorical
% @canonical false
% @original_name Erik's Bike Board & Ski
% @values regional_chain_midwest=Regional_chain_Midwest_US_price_matching unk_retailer_info_eriks=Unknown
% @importance 0.7

0.75::true_val(retailer_info_eriks, regional_chain_midwest); 0.25::true_val(retailer_info_eriks, unk_retailer_info_eriks).
measured(s41, retailer_info_eriks, regional_chain_midwest).
all_consistent(retailer_info_eriks) :- consistent(s41, retailer_info_eriks).
evidence(all_consistent(retailer_info_eriks)).
query(true_val(retailer_info_eriks, regional_chain_midwest)).
query(true_val(retailer_info_eriks, unk_retailer_info_eriks)).

0.78::acc(s48, graphic_designer_artist).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values julio_desmont=Vermont_artist_Julio_Desmont unk_graphic_designer_artist=Unknown
% @importance 0.25

0.75::true_val(graphic_designer_artist, julio_desmont); 0.25::true_val(graphic_designer_artist, unk_graphic_designer_artist).
measured(s48, graphic_designer_artist, julio_desmont).
all_consistent(graphic_designer_artist) :- consistent(s48, graphic_designer_artist).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, julio_desmont)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

0.78::acc(s48, topsheet_appearance_description).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values picasso_okeeffe_abstract=Picasso_to_OKeeffe_deep_lines_abstract_imagery unk_topsheet_appearance_description=Unknown
% @importance 0.25

0.75::true_val(topsheet_appearance_description, picasso_okeeffe_abstract); 0.25::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).
measured(s48, topsheet_appearance_description, picasso_okeeffe_abstract).
all_consistent(topsheet_appearance_description) :- consistent(s48, topsheet_appearance_description).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, picasso_okeeffe_abstract)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

0.88::acc(s6, carving_rating_tgr).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.9

0.88::true_val(carving_rating_tgr, great); 0.12::true_val(carving_rating_tgr, unk_carving_rating_tgr).
measured(s6, carving_rating_tgr, great).
all_consistent(carving_rating_tgr) :- consistent(s6, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

0.88::acc(s6, jumps_rating_tgr).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_rating_tgr=Unknown
% @importance 0.9

0.88::true_val(jumps_rating_tgr, great); 0.12::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
measured(s6, jumps_rating_tgr, great).
all_consistent(jumps_rating_tgr) :- consistent(s6, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

0.88::acc(s6, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride (overall)
% @values great=Great unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.88::true_val(reviewer_opinion_the_good_ride, great); 0.12::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s6, reviewer_opinion_the_good_ride, great).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s6, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, great)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.88::acc(s6, powder_rating_tgr).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values good=Good unk_powder_rating_tgr=Unknown
% @importance 0.9

0.88::true_val(powder_rating_tgr, good); 0.12::true_val(powder_rating_tgr, unk_powder_rating_tgr).
measured(s6, powder_rating_tgr, good).
all_consistent(powder_rating_tgr) :- consistent(s6, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.88::acc(s6, speed_rating_tgr).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.9

0.88::true_val(speed_rating_tgr, good); 0.12::true_val(speed_rating_tgr, unk_speed_rating_tgr).
measured(s6, speed_rating_tgr, good).
all_consistent(speed_rating_tgr) :- consistent(s6, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

0.88::acc(s6, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance (TGR rating)
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.9

0.88::true_val(base_glide_performance, good); 0.12::true_val(base_glide_performance, unk_base_glide_performance).
measured(s6, base_glide_performance, good).
all_consistent(base_glide_performance) :- consistent(s6, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.88::acc(s6, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values good=Good unk_switch_riding=Unknown
% @importance 0.9

0.88::true_val(switch_riding, good); 0.12::true_val(switch_riding, unk_switch_riding).
measured(s6, switch_riding, good).
all_consistent(switch_riding) :- consistent(s6, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, good)).
query(true_val(switch_riding, unk_switch_riding)).

0.88::acc(s6, jibbing_rating_tgr).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.9

0.88::true_val(jibbing_rating_tgr, average); 0.12::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
measured(s6, jibbing_rating_tgr, average).
all_consistent(jibbing_rating_tgr) :- consistent(s6, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

0.88::acc(s6, pipe_rating_tgr).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values good=Good unk_pipe_rating_tgr=Unknown
% @importance 0.9

0.88::true_val(pipe_rating_tgr, good); 0.12::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
measured(s6, pipe_rating_tgr, good).
all_consistent(pipe_rating_tgr) :- consistent(s6, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

0.88::acc(s6, on_snow_feel_tgr).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.9

0.88::true_val(on_snow_feel_tgr, semi_locked_in); 0.12::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
measured(s6, on_snow_feel_tgr, semi_locked_in).
all_consistent(on_snow_feel_tgr) :- consistent(s6, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

0.88::acc(s6, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.9

0.88::true_val(turn_initiation_performance, medium_fast); 0.12::true_val(turn_initiation_performance, unk_turn_initiation_performance).
measured(s6, turn_initiation_performance, medium_fast).
all_consistent(turn_initiation_performance) :- consistent(s6, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.85::acc(s6, reviewer_opinion_tgr_pop).

% @attr reviewer_opinion_tgr_pop
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (pop)
% @values moderate=Moderate unk_reviewer_opinion_tgr_pop=Unknown
% @importance 0.9

0.85::true_val(reviewer_opinion_tgr_pop, moderate); 0.15::true_val(reviewer_opinion_tgr_pop, unk_reviewer_opinion_tgr_pop).
measured(s6, reviewer_opinion_tgr_pop, moderate).
all_consistent(reviewer_opinion_tgr_pop) :- consistent(s6, reviewer_opinion_tgr_pop).
evidence(all_consistent(reviewer_opinion_tgr_pop)).
query(true_val(reviewer_opinion_tgr_pop, moderate)).
query(true_val(reviewer_opinion_tgr_pop, unk_reviewer_opinion_tgr_pop)).

0.88::acc(s6, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel (TGR summary)
% @values medium=Medium unk_flex_feel=Unknown
% @importance 0.9

0.88::true_val(flex_feel, medium); 0.12::true_val(flex_feel, unk_flex_feel).
measured(s6, flex_feel, medium).
all_consistent(flex_feel) :- consistent(s6, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium)).
query(true_val(flex_feel, unk_flex_feel)).

0.85::acc(s6, reviewer_opinion_tgr_buttering).

% @attr reviewer_opinion_tgr_buttering
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (buttering)
% @values moderate=Moderate unk_reviewer_opinion_tgr_buttering=Unknown
% @importance 0.9

0.85::true_val(reviewer_opinion_tgr_buttering, moderate); 0.15::true_val(reviewer_opinion_tgr_buttering, unk_reviewer_opinion_tgr_buttering).
measured(s6, reviewer_opinion_tgr_buttering, moderate).
all_consistent(reviewer_opinion_tgr_buttering) :- consistent(s6, reviewer_opinion_tgr_buttering).
evidence(all_consistent(reviewer_opinion_tgr_buttering)).
query(true_val(reviewer_opinion_tgr_buttering, moderate)).
query(true_val(reviewer_opinion_tgr_buttering, unk_reviewer_opinion_tgr_buttering)).

0.88::acc(s6, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values medium_snow=Medium_Snow unk_edge_hold=Unknown
% @importance 0.9

0.88::true_val(edge_hold, medium_snow); 0.12::true_val(edge_hold, unk_edge_hold).
measured(s6, edge_hold, medium_snow).
all_consistent(edge_hold) :- consistent(s6, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, medium_snow)).
query(true_val(edge_hold, unk_edge_hold)).

0.85::acc(s6, reviewer_opinion_tgr_weight).

% @attr reviewer_opinion_tgr_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (weight feel)
% @values feels_normal=Feels_Normal_right_in_middle_for_size unk_reviewer_opinion_tgr_weight=Unknown
% @importance 0.9

0.85::true_val(reviewer_opinion_tgr_weight, feels_normal); 0.15::true_val(reviewer_opinion_tgr_weight, unk_reviewer_opinion_tgr_weight).
measured(s6, reviewer_opinion_tgr_weight, feels_normal).
all_consistent(reviewer_opinion_tgr_weight) :- consistent(s6, reviewer_opinion_tgr_weight).
evidence(all_consistent(reviewer_opinion_tgr_weight)).
query(true_val(reviewer_opinion_tgr_weight, feels_normal)).
query(true_val(reviewer_opinion_tgr_weight, unk_reviewer_opinion_tgr_weight)).

0.88::acc(s6, stance_width_range_size_setback_tgr).

% @attr stance_width_range_size_setback_tgr
% @type categorical
% @canonical false
% @original_name stance_width_range_size (TGR setback)
% @values setback_over_20mm=Setback_over_20mm unk_stance_width_range_size_setback_tgr=Unknown
% @importance 0.9

0.88::true_val(stance_width_range_size_setback_tgr, setback_over_20mm); 0.12::true_val(stance_width_range_size_setback_tgr, unk_stance_width_range_size_setback_tgr).
measured(s6, stance_width_range_size_setback_tgr, setback_over_20mm).
all_consistent(stance_width_range_size_setback_tgr) :- consistent(s6, stance_width_range_size_setback_tgr).
evidence(all_consistent(stance_width_range_size_setback_tgr)).
query(true_val(stance_width_range_size_setback_tgr, setback_over_20mm)).
query(true_val(stance_width_range_size_setback_tgr, unk_stance_width_range_size_setback_tgr)).

0.88::acc(s6, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values great_pop_fun_turns_switch_versatile=Great_pop_fun_turning_rides_switch_well_versatile_quiver unk_positive_aspect=Unknown
% @importance 0.9

0.88::true_val(positive_aspect, great_pop_fun_turns_switch_versatile); 0.12::true_val(positive_aspect, unk_positive_aspect).
measured(s6, positive_aspect, great_pop_fun_turns_switch_versatile).
all_consistent(positive_aspect) :- consistent(s6, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, great_pop_fun_turns_switch_versatile)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.88::acc(s6, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (edge hold)
% @values edge_hold_behind_peers=Edge_hold_behind_some_peers unk_negative_aspect=Unknown
% @importance 0.9

0.88::true_val(negative_aspect, edge_hold_behind_peers); 0.12::true_val(negative_aspect, unk_negative_aspect).
measured(s6, negative_aspect, edge_hold_behind_peers).
all_consistent(negative_aspect) :- consistent(s6, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, edge_hold_behind_peers)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.88::acc(s6, reviewer_opinion_tgr_summary).

% @attr reviewer_opinion_tgr_summary
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (summary)
% @values fun_tapered_directional_daily_driver=Fun_tapered_directional_do_anything_daily_driver unk_reviewer_opinion_tgr_summary=Unknown
% @importance 0.9

0.88::true_val(reviewer_opinion_tgr_summary, fun_tapered_directional_daily_driver); 0.12::true_val(reviewer_opinion_tgr_summary, unk_reviewer_opinion_tgr_summary).
measured(s6, reviewer_opinion_tgr_summary, fun_tapered_directional_daily_driver).
all_consistent(reviewer_opinion_tgr_summary) :- consistent(s6, reviewer_opinion_tgr_summary).
evidence(all_consistent(reviewer_opinion_tgr_summary)).
query(true_val(reviewer_opinion_tgr_summary, fun_tapered_directional_daily_driver)).
query(true_val(reviewer_opinion_tgr_summary, unk_reviewer_opinion_tgr_summary)).

0.90::acc(s49, negative_aspect_detail_1).

% @attr negative_aspect_detail_1
% @type categorical
% @canonical false
% @original_name negative_aspect (hard snow detail)
% @values lets_go_in_harder_snow=Lets_go_too_easily_in_harder_snow unk_negative_aspect_detail_1=Unknown
% @importance 0.9

0.88::true_val(negative_aspect_detail_1, lets_go_in_harder_snow); 0.12::true_val(negative_aspect_detail_1, unk_negative_aspect_detail_1).
measured(s49, negative_aspect_detail_1, lets_go_in_harder_snow).
all_consistent(negative_aspect_detail_1) :- consistent(s49, negative_aspect_detail_1).
evidence(all_consistent(negative_aspect_detail_1)).
query(true_val(negative_aspect_detail_1, lets_go_in_harder_snow)).
query(true_val(negative_aspect_detail_1, unk_negative_aspect_detail_1)).

0.88::acc(s26, negative_aspect_detail_2).

% @attr negative_aspect_detail_2
% @type categorical
% @canonical false
% @original_name negative_aspect (washy carves)
% @values washy_deeper_carves=Washy_in_deeper_carves_not_ideal_harder_snow unk_negative_aspect_detail_2=Unknown
% @importance 0.85

0.88::true_val(negative_aspect_detail_2, washy_deeper_carves); 0.12::true_val(negative_aspect_detail_2, unk_negative_aspect_detail_2).
measured(s26, negative_aspect_detail_2, washy_deeper_carves).
all_consistent(negative_aspect_detail_2) :- consistent(s26, negative_aspect_detail_2).
evidence(all_consistent(negative_aspect_detail_2)).
query(true_val(negative_aspect_detail_2, washy_deeper_carves)).
query(true_val(negative_aspect_detail_2, unk_negative_aspect_detail_2)).

0.88::acc(s49, reviewer_opinion_tgr_turning).

% @attr reviewer_opinion_tgr_turning
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (turning)
% @values turns_quickly_good_pop_spring=Turns_quickly_good_pop_spring_out_of_carve unk_reviewer_opinion_tgr_turning=Unknown
% @importance 0.9

0.88::true_val(reviewer_opinion_tgr_turning, turns_quickly_good_pop_spring); 0.12::true_val(reviewer_opinion_tgr_turning, unk_reviewer_opinion_tgr_turning).
measured(s49, reviewer_opinion_tgr_turning, turns_quickly_good_pop_spring).
all_consistent(reviewer_opinion_tgr_turning) :- consistent(s49, reviewer_opinion_tgr_turning).
evidence(all_consistent(reviewer_opinion_tgr_turning)).
query(true_val(reviewer_opinion_tgr_turning, turns_quickly_good_pop_spring)).
query(true_val(reviewer_opinion_tgr_turning, unk_reviewer_opinion_tgr_turning)).

0.88::acc(s50, reviewer_opinion_tgr_damping).

% @attr reviewer_opinion_tgr_damping
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (damping)
% @values poppy_but_damp_handles_uneven=Poppy_but_damp_handles_uneven_snow_well unk_reviewer_opinion_tgr_damping=Unknown
% @importance 0.75

0.88::true_val(reviewer_opinion_tgr_damping, poppy_but_damp_handles_uneven); 0.12::true_val(reviewer_opinion_tgr_damping, unk_reviewer_opinion_tgr_damping).
measured(s50, reviewer_opinion_tgr_damping, poppy_but_damp_handles_uneven).
all_consistent(reviewer_opinion_tgr_damping) :- consistent(s50, reviewer_opinion_tgr_damping).
evidence(all_consistent(reviewer_opinion_tgr_damping)).
query(true_val(reviewer_opinion_tgr_damping, poppy_but_damp_handles_uneven)).
query(true_val(reviewer_opinion_tgr_damping, unk_reviewer_opinion_tgr_damping)).

0.85::acc(s50, reviewer_opinion_tgr_speed_damping).

% @attr reviewer_opinion_tgr_speed_damping
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (speed damping)
% @values pretty_damp_can_straight_line=Pretty_damp_can_handle_straight_lines unk_reviewer_opinion_tgr_speed_damping=Unknown
% @importance 0.75

0.85::true_val(reviewer_opinion_tgr_speed_damping, pretty_damp_can_straight_line); 0.15::true_val(reviewer_opinion_tgr_speed_damping, unk_reviewer_opinion_tgr_speed_damping).
measured(s50, reviewer_opinion_tgr_speed_damping, pretty_damp_can_straight_line).
all_consistent(reviewer_opinion_tgr_speed_damping) :- consistent(s50, reviewer_opinion_tgr_speed_damping).
evidence(all_consistent(reviewer_opinion_tgr_speed_damping)).
query(true_val(reviewer_opinion_tgr_speed_damping, pretty_damp_can_straight_line)).
query(true_val(reviewer_opinion_tgr_speed_damping, unk_reviewer_opinion_tgr_speed_damping)).

0.85::acc(s26, pop).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values good_pop_hard_engage_rewards=Good_pop_on_ollie_hard_to_engage_rewards_well unk_pop=Unknown
% @importance 0.85

0.85::true_val(pop, good_pop_hard_engage_rewards); 0.15::true_val(pop, unk_pop).
measured(s26, pop, good_pop_hard_engage_rewards).
all_consistent(pop) :- consistent(s26, pop).
evidence(all_consistent(pop)).
query(true_val(pop, good_pop_hard_engage_rewards)).
query(true_val(pop, unk_pop)).

0.85::acc(s26, reviewer_opinion_tgr_stability).

% @attr reviewer_opinion_tgr_stability
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (stability)
% @values stable_enjoyable_high_speed=Stable_and_enjoyable_at_high_speeds unk_reviewer_opinion_tgr_stability=Unknown
% @importance 0.85

0.85::true_val(reviewer_opinion_tgr_stability, stable_enjoyable_high_speed); 0.15::true_val(reviewer_opinion_tgr_stability, unk_reviewer_opinion_tgr_stability).
measured(s26, reviewer_opinion_tgr_stability, stable_enjoyable_high_speed).
all_consistent(reviewer_opinion_tgr_stability) :- consistent(s26, reviewer_opinion_tgr_stability).
evidence(all_consistent(reviewer_opinion_tgr_stability)).
query(true_val(reviewer_opinion_tgr_stability, stable_enjoyable_high_speed)).
query(true_val(reviewer_opinion_tgr_stability, unk_reviewer_opinion_tgr_stability)).

0.85::acc(s51, reviewer_opinion_tgr_terrain_transition).

% @attr reviewer_opinion_tgr_terrain_transition
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (terrain transition)
% @values damp_shock_absorbent_speed_transition=Damp_shock_absorbent_maintained_speed_hardpack_to_offpiste unk_reviewer_opinion_tgr_terrain_transition=Unknown
% @importance 0.7

0.85::true_val(reviewer_opinion_tgr_terrain_transition, damp_shock_absorbent_speed_transition); 0.15::true_val(reviewer_opinion_tgr_terrain_transition, unk_reviewer_opinion_tgr_terrain_transition).
measured(s51, reviewer_opinion_tgr_terrain_transition, damp_shock_absorbent_speed_transition).
all_consistent(reviewer_opinion_tgr_terrain_transition) :- consistent(s51, reviewer_opinion_tgr_terrain_transition).
evidence(all_consistent(reviewer_opinion_tgr_terrain_transition)).
query(true_val(reviewer_opinion_tgr_terrain_transition, damp_shock_absorbent_speed_transition)).
query(true_val(reviewer_opinion_tgr_terrain_transition, unk_reviewer_opinion_tgr_terrain_transition)).

0.88::acc(s6, switch_riding_detail).

% @attr switch_riding_detail
% @type categorical
% @canonical false
% @original_name switch_riding (detail)
% @values rides_switch_well_directional_bfg=Rides_switch_well_for_directional_due_to_BFG unk_switch_riding_detail=Unknown
% @importance 0.9

0.88::true_val(switch_riding_detail, rides_switch_well_directional_bfg); 0.12::true_val(switch_riding_detail, unk_switch_riding_detail).
measured(s6, switch_riding_detail, rides_switch_well_directional_bfg).
all_consistent(switch_riding_detail) :- consistent(s6, switch_riding_detail).
evidence(all_consistent(switch_riding_detail)).
query(true_val(switch_riding_detail, rides_switch_well_directional_bfg)).
query(true_val(switch_riding_detail, unk_switch_riding_detail)).

0.80::acc(s18, curated_impression_arielle).

% @attr curated_impression_arielle
% @type categorical
% @canonical false
% @original_name Curated overall impression (Arielle)
% @values do_it_all_power_playful=Do_it_all_board_power_directional_camber_playful_flex unk_curated_impression_arielle=Unknown
% @importance 0.8

0.80::true_val(curated_impression_arielle, do_it_all_power_playful); 0.20::true_val(curated_impression_arielle, unk_curated_impression_arielle).
measured(s18, curated_impression_arielle, do_it_all_power_playful).
all_consistent(curated_impression_arielle) :- consistent(s18, curated_impression_arielle).
evidence(all_consistent(curated_impression_arielle)).
query(true_val(curated_impression_arielle, do_it_all_power_playful)).
query(true_val(curated_impression_arielle, unk_curated_impression_arielle)).

0.80::acc(s18, curated_impression_yuri).

% @attr curated_impression_yuri
% @type categorical
% @canonical false
% @original_name Curated overall impression (Yuri)
% @values very_fun_party_board=Very_fun_snowboard_party_board_option unk_curated_impression_yuri=Unknown
% @importance 0.8

0.80::true_val(curated_impression_yuri, very_fun_party_board); 0.20::true_val(curated_impression_yuri, unk_curated_impression_yuri).
measured(s18, curated_impression_yuri, very_fun_party_board).
all_consistent(curated_impression_yuri) :- consistent(s18, curated_impression_yuri).
evidence(all_consistent(curated_impression_yuri)).
query(true_val(curated_impression_yuri, very_fun_party_board)).
query(true_val(curated_impression_yuri, unk_curated_impression_yuri)).

0.82::acc(s52, curated_who_should_avoid).

% @attr curated_who_should_avoid
% @type categorical
% @canonical false
% @original_name Curated who should avoid
% @values not_park_option=Definitely_not_a_park_option unk_curated_who_should_avoid=Unknown
% @importance 0.8

0.82::true_val(curated_who_should_avoid, not_park_option); 0.18::true_val(curated_who_should_avoid, unk_curated_who_should_avoid).
measured(s52, curated_who_should_avoid, not_park_option).
all_consistent(curated_who_should_avoid) :- consistent(s52, curated_who_should_avoid).
evidence(all_consistent(curated_who_should_avoid)).
query(true_val(curated_who_should_avoid, not_park_option)).
query(true_val(curated_who_should_avoid, unk_curated_who_should_avoid)).

0.78::acc(s18, comparable_board_same_brand_flex_note).

% @attr comparable_board_same_brand_flex_note
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (flex note)
% @values less_stiff_positive_playful=Less_stiff_than_FA_positive_for_playful_riding unk_comparable_board_same_brand_flex_note=Unknown
% @importance 0.8

0.78::true_val(comparable_board_same_brand_flex_note, less_stiff_positive_playful); 0.22::true_val(comparable_board_same_brand_flex_note, unk_comparable_board_same_brand_flex_note).
measured(s18, comparable_board_same_brand_flex_note, less_stiff_positive_playful).
all_consistent(comparable_board_same_brand_flex_note) :- consistent(s18, comparable_board_same_brand_flex_note).
evidence(all_consistent(comparable_board_same_brand_flex_note)).
query(true_val(comparable_board_same_brand_flex_note, less_stiff_positive_playful)).
query(true_val(comparable_board_same_brand_flex_note, unk_comparable_board_same_brand_flex_note)).

0.65::acc(s53, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum (general)
% @values good_for_progressing=Good_board_for_someone_who_can_turn_beyond_rental unk_user_review_forum=Unknown
% @importance 0.7

0.70::true_val(user_review_forum, good_for_progressing); 0.30::true_val(user_review_forum, unk_user_review_forum).
measured(s53, user_review_forum, good_for_progressing).
all_consistent(user_review_forum) :- consistent(s53, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, good_for_progressing)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.65::acc(s53, user_review_forum_setup).

% @attr user_review_forum_setup
% @type categorical
% @canonical false
% @original_name user_review_forum (setup weight)
% @values cartel_bindings_lighter_than_rental=Cartel_bindings_setup_significantly_lighter_than_rental unk_user_review_forum_setup=Unknown
% @importance 0.7

0.70::true_val(user_review_forum_setup, cartel_bindings_lighter_than_rental); 0.30::true_val(user_review_forum_setup, unk_user_review_forum_setup).
measured(s53, user_review_forum_setup, cartel_bindings_lighter_than_rental).
all_consistent(user_review_forum_setup) :- consistent(s53, user_review_forum_setup).
evidence(all_consistent(user_review_forum_setup)).
query(true_val(user_review_forum_setup, cartel_bindings_lighter_than_rental)).
query(true_val(user_review_forum_setup, unk_user_review_forum_setup)).

0.65::acc(s53, user_review_forum_camber_transition).

% @attr user_review_forum_camber_transition
% @type categorical
% @canonical false
% @original_name user_review_forum (camber transition)
% @values easy_transition_from_flat_rocker=Easy_transition_from_flat_rocker_turns_initiated_easily unk_user_review_forum_camber_transition=Unknown
% @importance 0.7

0.70::true_val(user_review_forum_camber_transition, easy_transition_from_flat_rocker); 0.30::true_val(user_review_forum_camber_transition, unk_user_review_forum_camber_transition).
measured(s53, user_review_forum_camber_transition, easy_transition_from_flat_rocker).
all_consistent(user_review_forum_camber_transition) :- consistent(s53, user_review_forum_camber_transition).
evidence(all_consistent(user_review_forum_camber_transition)).
query(true_val(user_review_forum_camber_transition, easy_transition_from_flat_rocker)).
query(true_val(user_review_forum_camber_transition, unk_user_review_forum_camber_transition)).

0.60::acc(s54, user_review_forum_recommendation).

% @attr user_review_forum_recommendation
% @type categorical
% @canonical false
% @original_name user_review_forum (comparison recommendation)
% @values better_than_sk_hh_for_intermediate=Better_bet_than_Skeleton_Key_or_Hometown_Hero_for_intermediate unk_user_review_forum_recommendation=Unknown
% @importance 0.65

0.65::true_val(user_review_forum_recommendation, better_than_sk_hh_for_intermediate); 0.35::true_val(user_review_forum_recommendation, unk_user_review_forum_recommendation).
measured(s54, user_review_forum_recommendation, better_than_sk_hh_for_intermediate).
all_consistent(user_review_forum_recommendation) :- consistent(s54, user_review_forum_recommendation).
evidence(all_consistent(user_review_forum_recommendation)).
query(true_val(user_review_forum_recommendation, better_than_sk_hh_for_intermediate)).
query(true_val(user_review_forum_recommendation, unk_user_review_forum_recommendation)).

0.60::acc(s55, factory_wax_note).

% @attr factory_wax_note
% @type categorical
% @canonical false
% @original_name Factory wax note
% @values factory_waxed_recommend_additional=Factory_waxed_recommend_additional_wax_before_first_use unk_factory_wax_note=Unknown
% @importance 0.45

0.65::true_val(factory_wax_note, factory_waxed_recommend_additional); 0.35::true_val(factory_wax_note, unk_factory_wax_note).
measured(s55, factory_wax_note, factory_waxed_recommend_additional).
all_consistent(factory_wax_note) :- consistent(s55, factory_wax_note).
evidence(all_consistent(factory_wax_note)).
query(true_val(factory_wax_note, factory_waxed_recommend_additional)).
query(true_val(factory_wax_note, unk_factory_wax_note)).

0.82::acc(s56, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (Jones Frontier)
% @values jones_frontier=Jones_Frontier_quiver_of_one_6_10_flex_directional unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.82::true_val(comparable_board_cross_brand, jones_frontier); 0.18::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s56, comparable_board_cross_brand, jones_frontier).
all_consistent(comparable_board_cross_brand) :- consistent(s56, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_frontier)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.75::acc(s57, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (Flight Attendant)
% @values burton_flight_attendant=Burton_Flight_Attendant_stiffer_more_aggressive_10mm_taper unk_comparable_board_same_brand=Unknown
% @importance 0.6

0.75::true_val(comparable_board_same_brand, burton_flight_attendant); 0.25::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s57, comparable_board_same_brand, burton_flight_attendant).
all_consistent(comparable_board_same_brand) :- consistent(s57, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, burton_flight_attendant)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.88::acc(s6, comparable_cross_brand_ride).

% @attr comparable_cross_brand_ride
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Ride Algorythm)
% @values ride_algorythm=Ride_Algorythm_similar_tapered_directional unk_comparable_cross_brand_ride=Unknown
% @importance 0.9

0.88::true_val(comparable_cross_brand_ride, ride_algorythm); 0.12::true_val(comparable_cross_brand_ride, unk_comparable_cross_brand_ride).
measured(s6, comparable_cross_brand_ride, ride_algorythm).
all_consistent(comparable_cross_brand_ride) :- consistent(s6, comparable_cross_brand_ride).
evidence(all_consistent(comparable_cross_brand_ride)).
query(true_val(comparable_cross_brand_ride, ride_algorythm)).
query(true_val(comparable_cross_brand_ride, unk_comparable_cross_brand_ride)).

0.88::acc(s6, comparable_cross_brand_salomon).

% @attr comparable_cross_brand_salomon
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Salomon Highpath)
% @values salomon_highpath=Salomon_Highpath_similar_category unk_comparable_cross_brand_salomon=Unknown
% @importance 0.9

0.88::true_val(comparable_cross_brand_salomon, salomon_highpath); 0.12::true_val(comparable_cross_brand_salomon, unk_comparable_cross_brand_salomon).
measured(s6, comparable_cross_brand_salomon, salomon_highpath).
all_consistent(comparable_cross_brand_salomon) :- consistent(s6, comparable_cross_brand_salomon).
evidence(all_consistent(comparable_cross_brand_salomon)).
query(true_val(comparable_cross_brand_salomon, salomon_highpath)).
query(true_val(comparable_cross_brand_salomon, unk_comparable_cross_brand_salomon)).

0.88::acc(s6, comparable_cross_brand_yes).

% @attr comparable_cross_brand_yes
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes Typo)
% @values yes_typo=Yes_Typo_similar_tapered_directional unk_comparable_cross_brand_yes=Unknown
% @importance 0.9

0.88::true_val(comparable_cross_brand_yes, yes_typo); 0.12::true_val(comparable_cross_brand_yes, unk_comparable_cross_brand_yes).
measured(s6, comparable_cross_brand_yes, yes_typo).
all_consistent(comparable_cross_brand_yes) :- consistent(s6, comparable_cross_brand_yes).
evidence(all_consistent(comparable_cross_brand_yes)).
query(true_val(comparable_cross_brand_yes, yes_typo)).
query(true_val(comparable_cross_brand_yes, unk_comparable_cross_brand_yes)).

0.88::acc(s6, comparable_cross_brand_korua).

% @attr comparable_cross_brand_korua
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Korua Otto)
% @values korua_otto=Korua_Otto_similar_directional unk_comparable_cross_brand_korua=Unknown
% @importance 0.9

0.88::true_val(comparable_cross_brand_korua, korua_otto); 0.12::true_val(comparable_cross_brand_korua, unk_comparable_cross_brand_korua).
measured(s6, comparable_cross_brand_korua, korua_otto).
all_consistent(comparable_cross_brand_korua) :- consistent(s6, comparable_cross_brand_korua).
evidence(all_consistent(comparable_cross_brand_korua)).
query(true_val(comparable_cross_brand_korua, korua_otto)).
query(true_val(comparable_cross_brand_korua, unk_comparable_cross_brand_korua)).

0.88::acc(s6, comparable_cross_brand_k2).

% @attr comparable_cross_brand_k2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 Manifest)
% @values k2_manifest=K2_Manifest_similar_directional_all_mountain unk_comparable_cross_brand_k2=Unknown
% @importance 0.9

0.88::true_val(comparable_cross_brand_k2, k2_manifest); 0.12::true_val(comparable_cross_brand_k2, unk_comparable_cross_brand_k2).
measured(s6, comparable_cross_brand_k2, k2_manifest).
all_consistent(comparable_cross_brand_k2) :- consistent(s6, comparable_cross_brand_k2).
evidence(all_consistent(comparable_cross_brand_k2)).
query(true_val(comparable_cross_brand_k2, k2_manifest)).
query(true_val(comparable_cross_brand_k2, unk_comparable_cross_brand_k2)).

0.88::acc(s6, comparable_cross_brand_nitro).

% @attr comparable_cross_brand_nitro
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nitro Alternator)
% @values nitro_alternator=Nitro_Alternator_similar_category unk_comparable_cross_brand_nitro=Unknown
% @importance 0.9

0.88::true_val(comparable_cross_brand_nitro, nitro_alternator); 0.12::true_val(comparable_cross_brand_nitro, unk_comparable_cross_brand_nitro).
measured(s6, comparable_cross_brand_nitro, nitro_alternator).
all_consistent(comparable_cross_brand_nitro) :- consistent(s6, comparable_cross_brand_nitro).
evidence(all_consistent(comparable_cross_brand_nitro)).
query(true_val(comparable_cross_brand_nitro, nitro_alternator)).
query(true_val(comparable_cross_brand_nitro, unk_comparable_cross_brand_nitro)).

0.88::acc(s6, comparable_cross_brand_cardiff).

% @attr comparable_cross_brand_cardiff
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Cardiff Crane/Lynx)
% @values cardiff_crane_lynx=Cardiff_Crane_Cardiff_Lynx unk_comparable_cross_brand_cardiff=Unknown
% @importance 0.9

0.88::true_val(comparable_cross_brand_cardiff, cardiff_crane_lynx); 0.12::true_val(comparable_cross_brand_cardiff, unk_comparable_cross_brand_cardiff).
measured(s6, comparable_cross_brand_cardiff, cardiff_crane_lynx).
all_consistent(comparable_cross_brand_cardiff) :- consistent(s6, comparable_cross_brand_cardiff).
evidence(all_consistent(comparable_cross_brand_cardiff)).
query(true_val(comparable_cross_brand_cardiff, cardiff_crane_lynx)).
query(true_val(comparable_cross_brand_cardiff, unk_comparable_cross_brand_cardiff)).

0.88::acc(s6, comparable_cross_brand_jones_rally).

% @attr comparable_cross_brand_jones_rally
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Rally Cat)
% @values jones_rally_cat=Jones_Rally_Cat unk_comparable_cross_brand_jones_rally=Unknown
% @importance 0.9

0.88::true_val(comparable_cross_brand_jones_rally, jones_rally_cat); 0.12::true_val(comparable_cross_brand_jones_rally, unk_comparable_cross_brand_jones_rally).
measured(s6, comparable_cross_brand_jones_rally, jones_rally_cat).
all_consistent(comparable_cross_brand_jones_rally) :- consistent(s6, comparable_cross_brand_jones_rally).
evidence(all_consistent(comparable_cross_brand_jones_rally)).
query(true_val(comparable_cross_brand_jones_rally, jones_rally_cat)).
query(true_val(comparable_cross_brand_jones_rally, unk_comparable_cross_brand_jones_rally)).

0.90::acc(s58, design_continuity).

% @attr design_continuity
% @type categorical
% @canonical false
% @original_name Design continuity
% @values unchanged_since_2022_improved_base=Unchanged_since_2022_except_slightly_improved_base unk_design_continuity=Unknown
% @importance 0.75

0.88::true_val(design_continuity, unchanged_since_2022_improved_base); 0.12::true_val(design_continuity, unk_design_continuity).
measured(s58, design_continuity, unchanged_since_2022_improved_base).
all_consistent(design_continuity) :- consistent(s58, design_continuity).
evidence(all_consistent(design_continuity)).
query(true_val(design_continuity, unchanged_since_2022_improved_base)).
query(true_val(design_continuity, unk_design_continuity)).

0.72::acc(s59, seasons_in_line).

% @attr seasons_in_line
% @type categorical
% @canonical false
% @original_name Seasons in the Burton line (as of 2025 article)
% @values third_season=Third_season_in_Burton_line unk_seasons_in_line=Unknown
% @importance 0.5

0.72::true_val(seasons_in_line, third_season); 0.28::true_val(seasons_in_line, unk_seasons_in_line).
measured(s59, seasons_in_line, third_season).
all_consistent(seasons_in_line) :- consistent(s59, seasons_in_line).
evidence(all_consistent(seasons_in_line)).
query(true_val(seasons_in_line, third_season)).
query(true_val(seasons_in_line, unk_seasons_in_line)).

0.88::acc(s6, splitboard_variant).

% @attr splitboard_variant
% @type categorical
% @canonical true
% @original_name Splitboard variant
% @values no=No unk_splitboard_variant=Unknown
% @importance 0.9

0.88::true_val(splitboard_variant, no); 0.12::true_val(splitboard_variant, unk_splitboard_variant).
measured(s6, splitboard_variant, no).
all_consistent(splitboard_variant) :- consistent(s6, splitboard_variant).
evidence(all_consistent(splitboard_variant)).
query(true_val(splitboard_variant, no)).
query(true_val(splitboard_variant, unk_splitboard_variant)).

0.72::acc(s57, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values none_standard_triax_only=None_standard_Triax_only_no_carbon unk_construction_material_innovation=Unknown
% @importance 0.6

0.72::true_val(construction_material_innovation, none_standard_triax_only); 0.28::true_val(construction_material_innovation, unk_construction_material_innovation).
measured(s57, construction_material_innovation, none_standard_triax_only).
all_consistent(construction_material_innovation) :- consistent(s57, construction_material_innovation).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, none_standard_triax_only)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.60::acc(s60, board_width_description_narrows).

% @attr board_width_description_narrows
% @type categorical
% @canonical false
% @original_name Board width description for narrows
% @values runs_narrow_us10_plus_wide=Burton_runs_slightly_narrow_US10_plus_consider_Wide unk_board_width_description_narrows=Unknown
% @importance 0.7

0.60::true_val(board_width_description_narrows, runs_narrow_us10_plus_wide); 0.40::true_val(board_width_description_narrows, unk_board_width_description_narrows).
measured(s60, board_width_description_narrows, runs_narrow_us10_plus_wide).
all_consistent(board_width_description_narrows) :- consistent(s60, board_width_description_narrows).
evidence(all_consistent(board_width_description_narrows)).
query(true_val(board_width_description_narrows, runs_narrow_us10_plus_wide)).
query(true_val(board_width_description_narrows, unk_board_width_description_narrows)).

0.85::acc(s24, mounting_pattern_inserts_included).

% @attr mounting_pattern_inserts_included
% @type categorical
% @canonical false
% @original_name mounting_pattern (inserts included)
% @values channel_inserts_included=Channel_inserts_included_required_for_bindings unk_mounting_pattern_inserts_included=Unknown
% @importance 0.65

0.85::true_val(mounting_pattern_inserts_included, channel_inserts_included); 0.15::true_val(mounting_pattern_inserts_included, unk_mounting_pattern_inserts_included).
measured(s24, mounting_pattern_inserts_included, channel_inserts_included).
all_consistent(mounting_pattern_inserts_included) :- consistent(s24, mounting_pattern_inserts_included).
evidence(all_consistent(mounting_pattern_inserts_included)).
query(true_val(mounting_pattern_inserts_included, channel_inserts_included)).
query(true_val(mounting_pattern_inserts_included, unk_mounting_pattern_inserts_included)).

0.85::acc(s6, stance_width_range_size_reference).

% @attr stance_width_range_size_reference
% @type categorical
% @canonical false
% @original_name stance_width_range_size (TGR reference stance detail)
% @values ref_22in_2back_3_5back_23wide=22in_ref_stance_2in_back_or_3_5in_all_way_back_at_23in unk_stance_width_range_size_reference=Unknown
% @importance 0.9

0.85::true_val(stance_width_range_size_reference, ref_22in_2back_3_5back_23wide); 0.15::true_val(stance_width_range_size_reference, unk_stance_width_range_size_reference).
measured(s6, stance_width_range_size_reference, ref_22in_2back_3_5back_23wide).
all_consistent(stance_width_range_size_reference) :- consistent(s6, stance_width_range_size_reference).
evidence(all_consistent(stance_width_range_size_reference)).
query(true_val(stance_width_range_size_reference, ref_22in_2back_3_5back_23wide)).
query(true_val(stance_width_range_size_reference, unk_stance_width_range_size_reference)).