0.15::indep(sm).
0.20::indep(s2).
0.20::indep(s10).
0.15::indep(s11).
0.20::indep(s13).
0.20::indep(s14).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values gnu=GNU unk_brand=Unknown
% @importance 1.0

0.97::acc(s1, brand).
0.95::true_val(brand, gnu); 0.05::true_val(brand, unk_brand).
measured(s1, brand, gnu).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, gnu)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values gremlin=Gremlin unk_model_name=Unknown
% @importance 1.0

0.97::acc(s1, model_name).
0.95::true_val(model_name, gremlin); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, gremlin).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, gremlin)).
query(true_val(model_name, unk_model_name)).

% @attr full_product_name
% @type categorical
% @canonical false
% @original_name Full product name
% @values gnu_gremlin_c3_2026=GNU_Gremlin_C3_Snowboard_2026 unk_full_product_name=Unknown
% @importance 0.9

0.85::acc(s2, full_product_name).
0.78::true_val(full_product_name, gnu_gremlin_c3_2026); 0.22::true_val(full_product_name, unk_full_product_name).
measured(s2, full_product_name, gnu_gremlin_c3_2026).
all_consistent(full_product_name) :- consistent(s2, full_product_name).
evidence(all_consistent(full_product_name)).
query(true_val(full_product_name, gnu_gremlin_c3_2026)).
query(true_val(full_product_name, unk_full_product_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 1.0

0.97::acc(s1, model_year).
0.95::true_val(model_year, y2026); 0.05::true_val(model_year, unk_model_year).
measured(s1, model_year, y2026).
all_consistent(model_year) :- consistent(s1, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2021=2021 unk_model_first_available_year=Unknown
% @importance 0.5

0.55::acc(s3, model_first_available_year).
0.52::true_val(model_first_available_year, y2021); 0.48::true_val(model_first_available_year, unk_model_first_available_year).
measured(s3, model_first_available_year, y2021).
all_consistent(model_first_available_year) :- consistent(s3, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2021)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr specs_unchanged_2026
% @type categorical
% @canonical false
% @original_name 2026 model specs unchanged
% @values same_as_2025=Same_specs_teal_topsheet unk_specs_unchanged_2026=Unknown
% @importance 0.8

0.68::acc(s4, specs_unchanged_2026).
0.53::true_val(specs_unchanged_2026, same_as_2025); 0.47::true_val(specs_unchanged_2026, unk_specs_unchanged_2026).
measured(s4, specs_unchanged_2026, same_as_2025).
all_consistent(specs_unchanged_2026) :- consistent(s4, specs_unchanged_2026).
evidence(all_consistent(specs_unchanged_2026)).
query(true_val(specs_unchanged_2026, same_as_2025)).
query(true_val(specs_unchanged_2026, unk_specs_unchanged_2026)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.6

0.75::acc(s5, manufacturer).
0.71::true_val(manufacturer, mervin_manufacturing); 0.29::true_val(manufacturer, unk_manufacturer).
measured(s5, manufacturer, mervin_manufacturing).
all_consistent(manufacturer) :- consistent(s5, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr mervin_founded
% @type categorical
% @canonical false
% @original_name Mervin Manufacturing founded
% @values y1977_olson_saari=1977_Mike_Olson_Pete_Saari unk_mervin_founded=Unknown
% @importance 0.5

0.85::acc(s6, mervin_founded).
0.81::true_val(mervin_founded, y1977_olson_saari); 0.19::true_val(mervin_founded, unk_mervin_founded).
measured(s6, mervin_founded, y1977_olson_saari).
all_consistent(mervin_founded) :- consistent(s6, mervin_founded).
evidence(all_consistent(mervin_founded)).
query(true_val(mervin_founded, y1977_olson_saari)).
query(true_val(mervin_founded, unk_mervin_founded)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values usa_sequim_wa=Handbuilt_USA_Sequim_Washington unk_manufacturing_location=Unknown
% @importance 0.45

0.92::acc(s7, manufacturing_location).
0.85::acc(s8, manufacturing_location).
0.95::true_val(manufacturing_location, usa_sequim_wa); 0.05::true_val(manufacturing_location, unk_manufacturing_location).
measured(s7, manufacturing_location, usa_sequim_wa).
measured(s8, manufacturing_location, usa_sequim_wa).
all_consistent(manufacturing_location) :- consistent(s7, manufacturing_location), consistent(s8, manufacturing_location).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, usa_sequim_wa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr manufacturing_distinction
% @type categorical
% @canonical false
% @original_name Manufacturing distinction
% @values longest_running_usa=Longest_running_last_major_USA_factory unk_manufacturing_distinction=Unknown
% @importance 0.5

0.85::acc(s6, manufacturing_distinction).
0.81::true_val(manufacturing_distinction, longest_running_usa); 0.19::true_val(manufacturing_distinction, unk_manufacturing_distinction).
measured(s6, manufacturing_distinction, longest_running_usa).
all_consistent(manufacturing_distinction) :- consistent(s6, manufacturing_distinction).
evidence(all_consistent(manufacturing_distinction)).
query(true_val(manufacturing_distinction, longest_running_usa)).
query(true_val(manufacturing_distinction, unk_manufacturing_distinction)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_hazardous_waste=Zero_hazardous_waste_manufacturing unk_sustainability_certification=Unknown
% @importance 0.45

0.82::acc(s9, sustainability_certification).
0.72::true_val(sustainability_certification, zero_hazardous_waste); 0.28::true_val(sustainability_certification, unk_sustainability_certification).
measured(s9, sustainability_certification, zero_hazardous_waste).
all_consistent(sustainability_certification) :- consistent(s9, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_hazardous_waste)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_solvents
% @type categorical
% @canonical false
% @original_name sustainability_certification (water-based solvents)
% @values water_based_solvents=Water_based_solvents unk_sustainability_certification_solvents=Unknown
% @importance 0.4

0.78::acc(s10, sustainability_certification_solvents).
0.68::true_val(sustainability_certification_solvents, water_based_solvents); 0.32::true_val(sustainability_certification_solvents, unk_sustainability_certification_solvents).
measured(s10, sustainability_certification_solvents, water_based_solvents).
all_consistent(sustainability_certification_solvents) :- consistent(s10, sustainability_certification_solvents).
evidence(all_consistent(sustainability_certification_solvents)).
query(true_val(sustainability_certification_solvents, water_based_solvents)).
query(true_val(sustainability_certification_solvents, unk_sustainability_certification_solvents)).

% @attr sustainability_certification_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification (wood recycling)
% @values sawdust_recycled=Wood_sawdust_recycled_scrap_donated unk_sustainability_certification_recycling=Unknown
% @importance 0.4

0.78::acc(s10, sustainability_certification_recycling).
0.68::true_val(sustainability_certification_recycling, sawdust_recycled); 0.32::true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling).
measured(s10, sustainability_certification_recycling, sawdust_recycled).
all_consistent(sustainability_certification_recycling) :- consistent(s10, sustainability_certification_recycling).
evidence(all_consistent(sustainability_certification_recycling)).
query(true_val(sustainability_certification_recycling, sawdust_recycled)).
query(true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_certified_cores=FSC_certified_wood_cores unk_sustainability_certification_fsc=Unknown
% @importance 0.5

0.65::acc(s11, sustainability_certification_fsc).
0.54::true_val(sustainability_certification_fsc, fsc_certified_cores); 0.46::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).
measured(s11, sustainability_certification_fsc, fsc_certified_cores).
all_consistent(sustainability_certification_fsc) :- consistent(s11, sustainability_certification_fsc).
evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified_cores)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values gnu_gift_shop=Gnu_Gift_Shop unk_graphic_designer_artist=Unknown
% @importance 1.0

0.95::acc(s1, graphic_designer_artist).
0.92::true_val(graphic_designer_artist, gnu_gift_shop); 0.08::true_val(graphic_designer_artist, unk_graphic_designer_artist).
measured(s1, graphic_designer_artist, gnu_gift_shop).
all_consistent(graphic_designer_artist) :- consistent(s1, graphic_designer_artist).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, gnu_gift_shop)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values amc_gremlin_1970s=Inspired_by_1970s_AMC_Gremlin_car unk_design_inspiration=Unknown
% @importance 0.7

0.65::acc(s12, design_inspiration).
0.45::true_val(design_inspiration, amc_gremlin_1970s); 0.55::true_val(design_inspiration, unk_design_inspiration).
measured(s12, design_inspiration, amc_gremlin_1970s).
all_consistent(design_inspiration) :- consistent(s12, design_inspiration).
evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, amc_gremlin_1970s)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values sku_25sn011=25SN011 unk_sku=Unknown
% @importance 0.85

0.95::acc(sm, sku).
0.95::true_val(sku, sku_25sn011); 0.05::true_val(sku, unk_sku).
measured(sm, sku, sku_25sn011).
all_consistent(sku) :- consistent(sm, sku).
evidence(all_consistent(sku)).
query(true_val(sku, sku_25sn011)).
query(true_val(sku, unk_sku)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.97::acc(s1, product_type).
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
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.925

0.95::acc(s1, board_category).
0.90::acc(sm, board_category).
0.95::true_val(board_category, all_mountain_freeride); 0.05::true_val(board_category, unk_board_category).
measured(s1, board_category, all_mountain_freeride).
measured(sm, board_category, all_mountain_freeride).
all_consistent(board_category) :- consistent(s1, board_category), (indep(sm), consistent(sm, board_category) ; \+indep(sm)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr board_category_volume_shifted
% @type categorical
% @canonical false
% @original_name board_category (volume-shifted)
% @values volume_shifted_all_mountain=Volume_shifted_all_mountain unk_board_category_volume_shifted=Unknown
% @importance 0.9

0.82::acc(s2, board_category_volume_shifted).
0.78::true_val(board_category_volume_shifted, volume_shifted_all_mountain); 0.22::true_val(board_category_volume_shifted, unk_board_category_volume_shifted).
measured(s2, board_category_volume_shifted, volume_shifted_all_mountain).
all_consistent(board_category_volume_shifted) :- consistent(s2, board_category_volume_shifted).
evidence(all_consistent(board_category_volume_shifted)).
query(true_val(board_category_volume_shifted, volume_shifted_all_mountain)).
query(true_val(board_category_volume_shifted, unk_board_category_volume_shifted)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.925

0.95::acc(s1, shape).
0.90::acc(sm, shape).
0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).
measured(s1, shape, tapered_directional).
measured(sm, shape, tapered_directional).
all_consistent(shape) :- consistent(s1, shape), (indep(sm), consistent(sm, shape) ; \+indep(sm)).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values am_freeride_powder=All_Mountain_Freeride_Powder unk_riding_style=Unknown
% @importance 0.85

0.90::acc(sm, riding_style).
0.95::true_val(riding_style, am_freeride_powder); 0.05::true_val(riding_style, unk_riding_style).
measured(sm, riding_style, am_freeride_powder).
all_consistent(riding_style) :- consistent(sm, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, am_freeride_powder)).
query(true_val(riding_style, unk_riding_style)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_to_Expert unk_skill_level_recommendation=Unknown
% @importance 0.875

0.82::acc(s2, skill_level_recommendation).
0.82::acc(s13, skill_level_recommendation).
0.95::true_val(skill_level_recommendation, advanced_expert); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).
measured(s2, skill_level_recommendation, advanced_expert).
measured(s13, skill_level_recommendation, advanced_expert).
all_consistent(skill_level_recommendation) :- consistent(s2, skill_level_recommendation), consistent(s13, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.4

0.80::acc(s14, gender).
0.68::true_val(gender, mens); 0.32::true_val(gender, unk_gender).
measured(s14, gender, mens).
all_consistent(gender) :- consistent(s14, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr one_board_quiver
% @type categorical
% @canonical false
% @original_name One-board quiver
% @values yes=Yes_one_board_quiver_for_advanced unk_one_board_quiver=Unknown
% @importance 1.0

0.93::acc(s1, one_board_quiver).
0.92::true_val(one_board_quiver, yes); 0.08::true_val(one_board_quiver, unk_one_board_quiver).
measured(s1, one_board_quiver, yes).
all_consistent(one_board_quiver) :- consistent(s1, one_board_quiver).
evidence(all_consistent(one_board_quiver)).
query(true_val(one_board_quiver, yes)).
query(true_val(one_board_quiver, unk_one_board_quiver)).

% @attr one_board_quiver_caveat
% @type categorical
% @canonical false
% @original_name One-board quiver caveat
% @values no_rails=Works_unless_rails_park_jibbers_need_twin unk_one_board_quiver_caveat=Unknown
% @importance 0.8

0.68::acc(s4, one_board_quiver_caveat).
0.53::true_val(one_board_quiver_caveat, no_rails); 0.47::true_val(one_board_quiver_caveat, unk_one_board_quiver_caveat).
measured(s4, one_board_quiver_caveat, no_rails).
all_consistent(one_board_quiver_caveat) :- consistent(s4, one_board_quiver_caveat).
evidence(all_consistent(one_board_quiver_caveat)).
query(true_val(one_board_quiver_caveat, no_rails)).
query(true_val(one_board_quiver_caveat, unk_one_board_quiver_caveat)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_hardpack_ice_am=Powder_hardpack_icy_groomers_all_mountain unk_terrain_suitability=Unknown
% @importance 0.85

0.90::acc(sm, terrain_suitability).
0.95::true_val(terrain_suitability, powder_hardpack_ice_am); 0.05::true_val(terrain_suitability, unk_terrain_suitability).
measured(sm, terrain_suitability, powder_hardpack_ice_am).
all_consistent(terrain_suitability) :- consistent(sm, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_hardpack_ice_am)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c3=C3 unk_camber_type=Unknown
% @importance 0.925

0.97::acc(s1, camber_type).
0.90::acc(sm, camber_type).
0.95::true_val(camber_type, c3); 0.05::true_val(camber_type, unk_camber_type).
measured(s1, camber_type, c3).
measured(sm, camber_type, c3).
all_consistent(camber_type) :- consistent(s1, camber_type), (indep(sm), consistent(sm, camber_type) ; \+indep(sm)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, c3)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values mild_rocker_powerful_camber=Mild_rocker_between_feet_powerful_camber_to_tips unk_camber_description=Unknown
% @importance 0.9

0.92::acc(s15, camber_description).
0.82::acc(s2, camber_description).
0.90::acc(s16, camber_description).
0.95::true_val(camber_description, mild_rocker_powerful_camber); 0.05::true_val(camber_description, unk_camber_description).
measured(s15, camber_description, mild_rocker_powerful_camber).
measured(s2, camber_description, mild_rocker_powerful_camber).
measured(s16, camber_description, mild_rocker_powerful_camber).
all_consistent(camber_description) :- consistent(s15, camber_description), (indep(s2), consistent(s2, camber_description) ; \+indep(s2)), consistent(s16, camber_description).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, mild_rocker_powerful_camber)).
query(true_val(camber_description, unk_camber_description)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_locked_in_tracks_well unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.90::acc(s16, on_snow_feel_tgr).
0.86::true_val(on_snow_feel_tgr, semi_locked_in); 0.14::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
measured(s16, on_snow_feel_tgr, semi_locked_in).
all_consistent(on_snow_feel_tgr) :- consistent(s16, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v6=6.0 v7=7.0
% @importance 0.925

0.95::acc(s1, flex_rating_10).
0.75::acc(sm, flex_rating_10).
0.70::true_val(flex_rating_10, v6); 0.30::true_val(flex_rating_10, v7).
measured(s1, flex_rating_10, v6).
measured(sm, flex_rating_10, v7).
all_consistent(flex_rating_10) :- consistent(s1, flex_rating_10), (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, v7)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values stiff=Stiff_6_to_8_range unk_flex_rating_10_evo=Unknown
% @importance 0.9

0.82::acc(s2, flex_rating_10_evo).
0.78::true_val(flex_rating_10_evo, stiff); 0.22::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).
measured(s2, flex_rating_10_evo, stiff).
all_consistent(flex_rating_10_evo) :- consistent(s2, flex_rating_10_evo).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_to_medium_stiff_poppy=Medium_to_medium_stiff_with_pop unk_flex_feel=Unknown
% @importance 0.95

0.90::acc(s16, flex_feel).
0.86::true_val(flex_feel, medium_to_medium_stiff_poppy); 0.14::true_val(flex_feel, unk_flex_feel).
measured(s16, flex_feel, medium_to_medium_stiff_poppy).
all_consistent(flex_feel) :- consistent(s16, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_to_medium_stiff_poppy)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_soft_nose_stiff_tail=Directional_softer_nose_stiffer_tail unk_flex_direction=Unknown
% @importance 0.825

0.88::acc(s16, flex_direction).
0.72::acc(s17, flex_direction).
0.95::true_val(flex_direction, directional_soft_nose_stiff_tail); 0.05::true_val(flex_direction, unk_flex_direction).
measured(s16, flex_direction, directional_soft_nose_stiff_tail).
measured(s17, flex_direction, directional_soft_nose_stiff_tail).
all_consistent(flex_direction) :- consistent(s16, flex_direction), consistent(s17, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_soft_nose_stiff_tail)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values g_lite_2=G_Lite_2_Core unk_core_material=Unknown
% @importance 0.875

0.90::acc(sm, core_material).
0.82::acc(s2, core_material).
0.95::true_val(core_material, g_lite_2); 0.05::true_val(core_material, unk_core_material).
measured(sm, core_material, g_lite_2).
measured(s2, core_material, g_lite_2).
all_consistent(core_material) :- (indep(sm), consistent(sm, core_material) ; \+indep(sm)), (indep(s2), consistent(s2, core_material) ; \+indep(s2)).
evidence(all_consistent(core_material)).
query(true_val(core_material, g_lite_2)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_composition
% @type categorical
% @canonical false
% @original_name core_material (composition)
% @values fsc_aspen_paulownia=FSC_Certified_Aspen_Paulownia unk_core_material_composition=Unknown
% @importance 0.725

0.82::acc(s2, core_material_composition).
0.90::acc(sm, core_material_composition).
0.72::acc(s33, core_material_composition).
0.95::true_val(core_material_composition, fsc_aspen_paulownia); 0.05::true_val(core_material_composition, unk_core_material_composition).
measured(s2, core_material_composition, fsc_aspen_paulownia).
measured(sm, core_material_composition, fsc_aspen_paulownia).
measured(s33, core_material_composition, fsc_aspen_paulownia).
all_consistent(core_material_composition) :- (indep(s2), consistent(s2, core_material_composition) ; \+indep(s2)), (indep(sm), consistent(sm, core_material_composition) ; \+indep(sm)), consistent(s33, core_material_composition).
evidence(all_consistent(core_material_composition)).
query(true_val(core_material_composition, fsc_aspen_paulownia)).
query(true_val(core_material_composition, unk_core_material_composition)).

% @attr core_material_feel
% @type categorical
% @canonical false
% @original_name core_material (feel)
% @values light_strong_poppy=Light_strong_and_poppy unk_core_material_feel=Unknown
% @importance 0.9

0.82::acc(s2, core_material_feel).
0.78::true_val(core_material_feel, light_strong_poppy); 0.22::true_val(core_material_feel, unk_core_material_feel).
measured(s2, core_material_feel, light_strong_poppy).
all_consistent(core_material_feel) :- consistent(s2, core_material_feel).
evidence(all_consistent(core_material_feel)).
query(true_val(core_material_feel, light_strong_poppy)).
query(true_val(core_material_feel, unk_core_material_feel)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values triax_biax_fiberglass=Triaxial_Biaxial_Fiberglass unk_laminate=Unknown
% @importance 0.875

0.82::acc(s2, laminate).
0.90::acc(sm, laminate).
0.95::true_val(laminate, triax_biax_fiberglass); 0.05::true_val(laminate, unk_laminate).
measured(s2, laminate, triax_biax_fiberglass).
measured(sm, laminate, triax_biax_fiberglass).
all_consistent(laminate) :- (indep(s2), consistent(s2, laminate) ; \+indep(s2)), (indep(sm), consistent(sm, laminate) ; \+indep(sm)).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Texture_Topsheet unk_topsheet=Unknown
% @importance 0.85

0.90::acc(sm, topsheet).
0.95::true_val(topsheet, eco_sublimated_poly); 0.05::true_val(topsheet, unk_topsheet).
measured(sm, topsheet, eco_sublimated_poly).
all_consistent(topsheet) :- consistent(sm, topsheet).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values eco_textured_snow_resistant=Eco_friendly_textured_for_strength_snow_resistance unk_topsheet_appearance_description=Unknown
% @importance 0.85

0.88::acc(sm, topsheet_appearance_description).
0.95::true_val(topsheet_appearance_description, eco_textured_snow_resistant); 0.05::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).
measured(sm, topsheet_appearance_description, eco_textured_snow_resistant).
all_consistent(topsheet_appearance_description) :- consistent(sm, topsheet_appearance_description).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, eco_textured_snow_resistant)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_knife_cut=Sintered_Knife_Cut_Base unk_base_type=Unknown
% @importance 0.875

0.82::acc(s2, base_type).
0.90::acc(sm, base_type).
0.95::true_val(base_type, sintered_knife_cut); 0.05::true_val(base_type, unk_base_type).
measured(s2, base_type, sintered_knife_cut).
measured(sm, base_type, sintered_knife_cut).
all_consistent(base_type) :- (indep(s2), consistent(s2, base_type) ; \+indep(s2)), (indep(sm), consistent(sm, base_type) ; \+indep(sm)).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_knife_cut)).
query(true_val(base_type, unk_base_type)).

% @attr base_material
% @type categorical
% @canonical false
% @original_name base_material
% @values fast_sintered_die_cut=Fast_sintered_die_cut_to_reduce_waste unk_base_material=Unknown
% @importance 0.85

0.88::acc(sm, base_material).
0.95::true_val(base_material, fast_sintered_die_cut); 0.05::true_val(base_material, unk_base_material).
measured(sm, base_material, fast_sintered_die_cut).
all_consistent(base_material) :- consistent(sm, base_material).
evidence(all_consistent(base_material)).
query(true_val(base_material, fast_sintered_die_cut)).
query(true_val(base_material, unk_base_material)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values uhmw=UHMW_Polyethylene unk_sidewall_material=Unknown
% @importance 0.85

0.90::acc(sm, sidewall_material).
0.95::true_val(sidewall_material, uhmw); 0.05::true_val(sidewall_material, unk_sidewall_material).
measured(sm, sidewall_material, uhmw).
all_consistent(sidewall_material) :- consistent(sm, sidewall_material).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, uhmw)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_properties
% @type categorical
% @canonical false
% @original_name sidewall_material (properties)
% @values strong_durable_abrasion_resistant=Strong_durable_abrasion_chemical_impact_resistant unk_sidewall_material_properties=Unknown
% @importance 0.85

0.86::acc(sm, sidewall_material_properties).
0.95::true_val(sidewall_material_properties, strong_durable_abrasion_resistant); 0.05::true_val(sidewall_material_properties, unk_sidewall_material_properties).
measured(sm, sidewall_material_properties, strong_durable_abrasion_resistant).
all_consistent(sidewall_material_properties) :- consistent(sm, sidewall_material_properties).
evidence(all_consistent(sidewall_material_properties)).
query(true_val(sidewall_material_properties, strong_durable_abrasion_resistant)).
query(true_val(sidewall_material_properties, unk_sidewall_material_properties)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction=Magne_Traction unk_edge_technology=Unknown
% @importance 0.925

0.97::acc(s1, edge_technology).
0.90::acc(sm, edge_technology).
0.95::true_val(edge_technology, magne_traction); 0.05::true_val(edge_technology, unk_edge_technology).
measured(s1, edge_technology, magne_traction).
measured(sm, edge_technology, magne_traction).
all_consistent(edge_technology) :- consistent(s1, edge_technology), (indep(sm), consistent(sm, edge_technology) ; \+indep(sm)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_technology_detail
% @type categorical
% @canonical false
% @original_name edge_technology (detail)
% @values seven_serrations=7_serrations_along_edges unk_edge_technology_detail=Unknown
% @importance 0.8

0.72::acc(s18, edge_technology_detail).
0.68::acc(s4, edge_technology_detail).
0.95::true_val(edge_technology_detail, seven_serrations); 0.05::true_val(edge_technology_detail, unk_edge_technology_detail).
measured(s18, edge_technology_detail, seven_serrations).
measured(s4, edge_technology_detail, seven_serrations).
all_consistent(edge_technology_detail) :- consistent(s18, edge_technology_detail), consistent(s4, edge_technology_detail).
evidence(all_consistent(edge_technology_detail)).
query(true_val(edge_technology_detail, seven_serrations)).
query(true_val(edge_technology_detail, unk_edge_technology_detail)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.90::acc(sm, mounting_pattern).
0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
measured(sm, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(sm, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard=Standard unk_width_options=Unknown
% @importance 0.85

0.90::acc(sm, width_options).
0.95::true_val(width_options, standard); 0.05::true_val(width_options, unk_width_options).
measured(sm, width_options, standard).
all_consistent(width_options) :- consistent(sm, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

% @attr volume_shift
% @type categorical
% @canonical false
% @original_name Volume shift
% @values mild_2cm_shorter=Mild_volume_shift_ride_2cm_shorter unk_volume_shift=Unknown
% @importance 0.95

0.95::acc(s1, volume_shift).
0.82::acc(s2, volume_shift).
0.95::true_val(volume_shift, mild_2cm_shorter); 0.05::true_val(volume_shift, unk_volume_shift).
measured(s1, volume_shift, mild_2cm_shorter).
measured(s2, volume_shift, mild_2cm_shorter).
all_consistent(volume_shift) :- consistent(s1, volume_shift), (indep(s2), consistent(s2, volume_shift) ; \+indep(s2)).
evidence(all_consistent(volume_shift)).
query(true_val(volume_shift, mild_2cm_shorter)).
query(true_val(volume_shift, unk_volume_shift)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s144_148_152_155_158_161=144_148_152_155_158_161cm unk_available_sizes=Unknown
% @importance 1.0

0.97::acc(s1, available_sizes).
0.95::true_val(available_sizes, s144_148_152_155_158_161); 0.05::true_val(available_sizes, unk_available_sizes).
measured(s1, available_sizes, s144_148_152_155_158_161).
all_consistent(available_sizes) :- consistent(s1, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s144_148_152_155_158_161)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr taper
% @type numeric
% @canonical false
% @original_name taper
% @unit mm
% @values v12=12.0
% @importance 0.95

0.92::acc(s16, taper).
0.86::true_val(taper, v12); 0.14::true_val(taper, unk_taper).
measured(s16, taper, v12).
all_consistent(taper) :- consistent(s16, taper).
evidence(all_consistent(taper)).
query(true_val(taper, v12)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit inches
% @values v2=2.0 unk_setback=Unknown
% @importance 1.0

0.95::acc(s1, setback).
0.92::true_val(setback, v2); 0.08::true_val(setback, unk_setback).
measured(s1, setback, v2).
all_consistent(setback) :- consistent(s1, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v2)).
query(true_val(setback, unk_setback)).

% @attr specs_148cm
% @type categorical
% @canonical false
% @original_name 148cm specs
% @values specs_148_full=CL104_SC6_8_NTW30_3_29_1_W25_8_F6 unk_specs_148cm=Unknown
% @importance 1.0

0.97::acc(s1, specs_148cm).
0.95::true_val(specs_148cm, specs_148_full); 0.05::true_val(specs_148cm, unk_specs_148cm).
measured(s1, specs_148cm, specs_148_full).
all_consistent(specs_148cm) :- consistent(s1, specs_148cm).
evidence(all_consistent(specs_148cm)).
query(true_val(specs_148cm, specs_148_full)).
query(true_val(specs_148cm, unk_specs_148cm)).

% @attr specs_152cm
% @type categorical
% @canonical false
% @original_name 152cm specs
% @values specs_152_full=CL106_SC7_0_NTW30_9_29_7_W26_1_F6 unk_specs_152cm=Unknown
% @importance 1.0

0.97::acc(s1, specs_152cm).
0.95::true_val(specs_152cm, specs_152_full); 0.05::true_val(specs_152cm, unk_specs_152cm).
measured(s1, specs_152cm, specs_152_full).
all_consistent(specs_152cm) :- consistent(s1, specs_152cm).
evidence(all_consistent(specs_152cm)).
query(true_val(specs_152cm, specs_152_full)).
query(true_val(specs_152cm, unk_specs_152cm)).

% @attr specs_155cm
% @type categorical
% @canonical false
% @original_name 155cm specs
% @values specs_155_full=CL108_SC7_2_NTW31_3_30_1_W26_4_F6 unk_specs_155cm=Unknown
% @importance 1.0

0.97::acc(s1, specs_155cm).
0.95::true_val(specs_155cm, specs_155_full); 0.05::true_val(specs_155cm, unk_specs_155cm).
measured(s1, specs_155cm, specs_155_full).
all_consistent(specs_155cm) :- consistent(s1, specs_155cm).
evidence(all_consistent(specs_155cm)).
query(true_val(specs_155cm, specs_155_full)).
query(true_val(specs_155cm, unk_specs_155cm)).

% @attr specs_158cm
% @type categorical
% @canonical false
% @original_name 158cm specs
% @values specs_158_full=CL110_SC7_5_NTW32_1_30_8_W27_0_F6 unk_specs_158cm=Unknown
% @importance 1.0

0.97::acc(s1, specs_158cm).
0.95::true_val(specs_158cm, specs_158_full); 0.05::true_val(specs_158cm, unk_specs_158cm).
measured(s1, specs_158cm, specs_158_full).
all_consistent(specs_158cm) :- consistent(s1, specs_158cm).
evidence(all_consistent(specs_158cm)).
query(true_val(specs_158cm, specs_158_full)).
query(true_val(specs_158cm, unk_specs_158cm)).

% @attr specs_161cm
% @type categorical
% @canonical false
% @original_name 161cm specs
% @values specs_161_full=CL112_SC7_7_NTW32_6_31_3_W27_5_F6 unk_specs_161cm=Unknown
% @importance 1.0

0.97::acc(s1, specs_161cm).
0.95::true_val(specs_161cm, specs_161_full); 0.05::true_val(specs_161cm, unk_specs_161cm).
measured(s1, specs_161cm, specs_161_full).
all_consistent(specs_161cm) :- consistent(s1, specs_161cm).
evidence(all_consistent(specs_161cm)).
query(true_val(specs_161cm, specs_161_full)).
query(true_val(specs_161cm, unk_specs_161cm)).

% @attr specs_144cm
% @type categorical
% @canonical false
% @original_name 144cm specs
% @values specs_144_full=CL102_SC6_6_NTW30_0_28_8_W25_5_F6 unk_specs_144cm=Unknown
% @importance 1.0

0.97::acc(s1, specs_144cm).
0.95::true_val(specs_144cm, specs_144_full); 0.05::true_val(specs_144cm, unk_specs_144cm).
measured(s1, specs_144cm, specs_144_full).
all_consistent(specs_144cm) :- consistent(s1, specs_144cm).
evidence(all_consistent(specs_144cm)).
query(true_val(specs_144cm, specs_144_full)).
query(true_val(specs_144cm, unk_specs_144cm)).

% @attr recommended_boot_sizes
% @type categorical
% @canonical false
% @original_name Recommended boot sizes
% @values tgr_boot_sizes=s148_8_9_s152_9_10_s155_10_11_s158_11_12 unk_recommended_boot_sizes=Unknown
% @importance 0.95

0.88::acc(s16, recommended_boot_sizes).
0.86::true_val(recommended_boot_sizes, tgr_boot_sizes); 0.14::true_val(recommended_boot_sizes, unk_recommended_boot_sizes).
measured(s16, recommended_boot_sizes, tgr_boot_sizes).
all_consistent(recommended_boot_sizes) :- consistent(s16, recommended_boot_sizes).
evidence(all_consistent(recommended_boot_sizes)).
query(true_val(recommended_boot_sizes, tgr_boot_sizes)).
query(true_val(recommended_boot_sizes, unk_recommended_boot_sizes)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v579_99=579.99 unk_price_usd_msrp=Unknown
% @importance 0.95

0.97::acc(s1, price_usd_msrp).
0.85::acc(s2, price_usd_msrp).
0.95::true_val(price_usd_msrp, v579_99); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s1, price_usd_msrp, v579_99).
measured(s2, price_usd_msrp, v579_99).
all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp), (indep(s2), consistent(s2, price_usd_msrp) ; \+indep(s2)).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v579_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_gnu_direct
% @type numeric
% @canonical false
% @original_name Sale price at GNU direct
% @unit USD
% @values v405_99=405.99 unk_price_usd_gnu_direct=Unknown
% @importance 1.0

0.97::acc(s1, price_usd_gnu_direct).
0.95::true_val(price_usd_gnu_direct, v405_99); 0.05::true_val(price_usd_gnu_direct, unk_price_usd_gnu_direct).
measured(s1, price_usd_gnu_direct, v405_99).
all_consistent(price_usd_gnu_direct) :- consistent(s1, price_usd_gnu_direct).
evidence(all_consistent(price_usd_gnu_direct)).
query(true_val(price_usd_gnu_direct, v405_99)).
query(true_val(price_usd_gnu_direct, unk_price_usd_gnu_direct)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v405_99=405.99 unk_price_usd_evo=Unknown
% @importance 0.9

0.90::acc(s19, price_usd_evo).
0.78::true_val(price_usd_evo, v405_99); 0.22::true_val(price_usd_evo, unk_price_usd_evo).
measured(s19, price_usd_evo, v405_99).
all_consistent(price_usd_evo) :- consistent(s19, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v405_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_tactics
% @type numeric
% @canonical true
% @original_name price_usd_tactics
% @unit USD
% @values v463_99=463.99 unk_price_usd_tactics=Unknown
% @importance 0.9

0.88::acc(s20, price_usd_tactics).
0.74::true_val(price_usd_tactics, v463_99); 0.26::true_val(price_usd_tactics, unk_price_usd_tactics).
measured(s20, price_usd_tactics, v463_99).
all_consistent(price_usd_tactics) :- consistent(s20, price_usd_tactics).
evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v463_99)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v463_99=463.99 unk_price_usd_backcountry=Unknown
% @importance 0.9

0.80::acc(s21, price_usd_backcountry).
0.64::true_val(price_usd_backcountry, v463_99); 0.36::true_val(price_usd_backcountry, unk_price_usd_backcountry).
measured(s21, price_usd_backcountry, v463_99).
all_consistent(price_usd_backcountry) :- consistent(s21, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v463_99)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_christy_sports
% @type numeric
% @canonical false
% @original_name Sale price at Christy Sports
% @unit USD
% @values v463_99=463.99 unk_price_usd_christy_sports=Unknown
% @importance 0.9

0.80::acc(s21, price_usd_christy_sports).
0.64::true_val(price_usd_christy_sports, v463_99); 0.36::true_val(price_usd_christy_sports, unk_price_usd_christy_sports).
measured(s21, price_usd_christy_sports, v463_99).
all_consistent(price_usd_christy_sports) :- consistent(s21, price_usd_christy_sports).
evidence(all_consistent(price_usd_christy_sports)).
query(true_val(price_usd_christy_sports, v463_99)).
query(true_val(price_usd_christy_sports, unk_price_usd_christy_sports)).

% @attr price_usd_the_house
% @type numeric
% @canonical false
% @original_name Sale price at The House
% @unit USD
% @values v463_99=463.99 unk_price_usd_the_house=Unknown
% @importance 0.9

0.80::acc(s21, price_usd_the_house).
0.64::true_val(price_usd_the_house, v463_99); 0.36::true_val(price_usd_the_house, unk_price_usd_the_house).
measured(s21, price_usd_the_house, v463_99).
all_consistent(price_usd_the_house) :- consistent(s21, price_usd_the_house).
evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v463_99)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

% @attr price_usd_blauer_board
% @type numeric
% @canonical false
% @original_name Sale price at Blauer Board Shop
% @unit USD
% @values v463_99=463.99 unk_price_usd_blauer_board=Unknown
% @importance 0.9

0.80::acc(s21, price_usd_blauer_board).
0.64::true_val(price_usd_blauer_board, v463_99); 0.36::true_val(price_usd_blauer_board, unk_price_usd_blauer_board).
measured(s21, price_usd_blauer_board, v463_99).
all_consistent(price_usd_blauer_board) :- consistent(s21, price_usd_blauer_board).
evidence(all_consistent(price_usd_blauer_board)).
query(true_val(price_usd_blauer_board, v463_99)).
query(true_val(price_usd_blauer_board, unk_price_usd_blauer_board)).

% @attr price_usd_salty_peaks
% @type numeric
% @canonical false
% @original_name Price at Salty Peaks
% @unit USD
% @values v495_00=495.0 unk_price_usd_salty_peaks=Unknown
% @importance 0.8

0.78::acc(s22, price_usd_salty_peaks).
0.60::true_val(price_usd_salty_peaks, v495_00); 0.40::true_val(price_usd_salty_peaks, unk_price_usd_salty_peaks).
measured(s22, price_usd_salty_peaks, v495_00).
all_consistent(price_usd_salty_peaks) :- consistent(s22, price_usd_salty_peaks).
evidence(all_consistent(price_usd_salty_peaks)).
query(true_val(price_usd_salty_peaks, v495_00)).
query(true_val(price_usd_salty_peaks, unk_price_usd_salty_peaks)).

% @attr price_usd_wws_boardshop
% @type numeric
% @canonical false
% @original_name Price at WWS Boardshop
% @unit USD
% @values v579_99=579.99 unk_price_usd_wws_boardshop=Unknown
% @importance 0.7

0.68::acc(s23, price_usd_wws_boardshop).
0.51::true_val(price_usd_wws_boardshop, v579_99); 0.49::true_val(price_usd_wws_boardshop, unk_price_usd_wws_boardshop).
measured(s23, price_usd_wws_boardshop, v579_99).
all_consistent(price_usd_wws_boardshop) :- consistent(s23, price_usd_wws_boardshop).
evidence(all_consistent(price_usd_wws_boardshop)).
query(true_val(price_usd_wws_boardshop, v579_99)).
query(true_val(price_usd_wws_boardshop, unk_price_usd_wws_boardshop)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v479_00=479.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.9

0.80::acc(s21, price_eur_blue_tomato).
0.64::true_val(price_eur_blue_tomato, v479_00); 0.36::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
measured(s21, price_eur_blue_tomato, v479_00).
all_consistent(price_eur_blue_tomato) :- consistent(s21, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v479_00)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v969_99=969.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(sm, price_aud_merchant).
0.95::true_val(price_aud_merchant, v969_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(sm, price_aud_merchant, v969_99).
all_consistent(price_aud_merchant) :- consistent(sm, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v969_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_vs_average
% @type categorical
% @canonical false
% @original_name Price vs average
% @values below_avg_4_02=Minus_4_02_from_avg_468_01 unk_price_vs_average=Unknown
% @importance 0.8

0.65::acc(s4, price_vs_average).
0.53::true_val(price_vs_average, below_avg_4_02); 0.47::true_val(price_vs_average, unk_price_vs_average).
measured(s4, price_vs_average, below_avg_4_02).
all_consistent(price_vs_average) :- consistent(s4, price_vs_average).
evidence(all_consistent(price_vs_average)).
query(true_val(price_vs_average, below_avg_4_02)).
query(true_val(price_vs_average, unk_price_vs_average)).

% @attr competitor_price_comparison
% @type categorical
% @canonical false
% @original_name Competitor price comparison
% @values orca_120_more=Lib_Tech_Orca_120_more_expensive unk_competitor_price_comparison=Unknown
% @importance 0.8

0.65::acc(s4, competitor_price_comparison).
0.53::true_val(competitor_price_comparison, orca_120_more); 0.47::true_val(competitor_price_comparison, unk_competitor_price_comparison).
measured(s4, competitor_price_comparison, orca_120_more).
all_consistent(competitor_price_comparison) :- consistent(s4, competitor_price_comparison).
evidence(all_consistent(competitor_price_comparison)).
query(true_val(competitor_price_comparison, orca_120_more)).
query(true_val(competitor_price_comparison, unk_competitor_price_comparison)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock_30_off=In_stock_30pct_off unk_availability_status=Unknown
% @importance 1.0

0.95::acc(s1, availability_status).
0.92::true_val(availability_status, in_stock_30_off); 0.08::true_val(availability_status, unk_availability_status).
measured(s1, availability_status, in_stock_30_off).
all_consistent(availability_status) :- consistent(s1, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_30_off)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values in_stock=In_stock unk_availability_status_evo=Unknown
% @importance 0.9

0.88::acc(s19, availability_status_evo).
0.78::true_val(availability_status_evo, in_stock); 0.22::true_val(availability_status_evo, unk_availability_status_evo).
measured(s19, availability_status_evo, in_stock).
all_consistent(availability_status_evo) :- consistent(s19, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (tactics)
% @values in_stock=In_stock unk_availability_status_tactics=Unknown
% @importance 0.9

0.85::acc(s20, availability_status_tactics).
0.74::true_val(availability_status_tactics, in_stock); 0.26::true_val(availability_status_tactics, unk_availability_status_tactics).
measured(s20, availability_status_tactics, in_stock).
all_consistent(availability_status_tactics) :- consistent(s20, availability_status_tactics).
evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, in_stock)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (backcountry)
% @values available=Available unk_availability_status_backcountry=Unknown
% @importance 0.9

0.80::acc(s21, availability_status_backcountry).
0.64::true_val(availability_status_backcountry, available); 0.36::true_val(availability_status_backcountry, unk_availability_status_backcountry).
measured(s21, availability_status_backcountry, available).
all_consistent(availability_status_backcountry) :- consistent(s21, availability_status_backcountry).
evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_christy
% @type categorical
% @canonical false
% @original_name availability_status (christy sports)
% @values available=Available unk_availability_status_christy=Unknown
% @importance 0.9

0.80::acc(s21, availability_status_christy).
0.64::true_val(availability_status_christy, available); 0.36::true_val(availability_status_christy, unk_availability_status_christy).
measured(s21, availability_status_christy, available).
all_consistent(availability_status_christy) :- consistent(s21, availability_status_christy).
evidence(all_consistent(availability_status_christy)).
query(true_val(availability_status_christy, available)).
query(true_val(availability_status_christy, unk_availability_status_christy)).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status (the house)
% @values available=Available unk_availability_status_the_house=Unknown
% @importance 0.9

0.80::acc(s21, availability_status_the_house).
0.64::true_val(availability_status_the_house, available); 0.36::true_val(availability_status_the_house, unk_availability_status_the_house).
measured(s21, availability_status_the_house, available).
all_consistent(availability_status_the_house) :- consistent(s21, availability_status_the_house).
evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, available)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (blauer board shop)
% @values available=Available unk_availability_status_blauer=Unknown
% @importance 0.9

0.80::acc(s21, availability_status_blauer).
0.64::true_val(availability_status_blauer, available); 0.36::true_val(availability_status_blauer, unk_availability_status_blauer).
measured(s21, availability_status_blauer, available).
all_consistent(availability_status_blauer) :- consistent(s21, availability_status_blauer).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_salty_peaks
% @type categorical
% @canonical false
% @original_name availability_status (salty peaks)
% @values available=Available unk_availability_status_salty_peaks=Unknown
% @importance 0.8

0.78::acc(s22, availability_status_salty_peaks).
0.60::true_val(availability_status_salty_peaks, available); 0.40::true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks).
measured(s22, availability_status_salty_peaks, available).
all_consistent(availability_status_salty_peaks) :- consistent(s22, availability_status_salty_peaks).
evidence(all_consistent(availability_status_salty_peaks)).
query(true_val(availability_status_salty_peaks, available)).
query(true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (melbourne)
% @values available=Available unk_availability_status_melbourne=Unknown
% @importance 0.5

0.65::acc(s24, availability_status_melbourne).
0.45::true_val(availability_status_melbourne, available); 0.55::true_val(availability_status_melbourne, unk_availability_status_melbourne).
measured(s24, availability_status_melbourne, available).
all_consistent(availability_status_melbourne) :- consistent(s24, availability_status_melbourne).
evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr sold_at_retailers
% @type categorical
% @canonical false
% @original_name Sold at Amazon Evo Steep and Cheap
% @values amazon_evo_steepandcheap=Amazon_Evo_Steep_and_Cheap unk_sold_at_retailers=Unknown
% @importance 0.8

0.65::acc(s4, sold_at_retailers).
0.53::true_val(sold_at_retailers, amazon_evo_steepandcheap); 0.47::true_val(sold_at_retailers, unk_sold_at_retailers).
measured(s4, sold_at_retailers, amazon_evo_steepandcheap).
all_consistent(sold_at_retailers) :- consistent(s4, sold_at_retailers).
evidence(all_consistent(sold_at_retailers)).
query(true_val(sold_at_retailers, amazon_evo_steepandcheap)).
query(true_val(sold_at_retailers, unk_sold_at_retailers)).

% @attr availability_status_mcu
% @type categorical
% @canonical false
% @original_name availability_status (mcu sports)
% @values available=Available unk_availability_status_mcu=Unknown
% @importance 0.5

0.62::acc(s25, availability_status_mcu).
0.44::true_val(availability_status_mcu, available); 0.56::true_val(availability_status_mcu, unk_availability_status_mcu).
measured(s25, availability_status_mcu, available).
all_consistent(availability_status_mcu) :- consistent(s25, availability_status_mcu).
evidence(all_consistent(availability_status_mcu)).
query(true_val(availability_status_mcu, available)).
query(true_val(availability_status_mcu, unk_availability_status_mcu)).

% @attr availability_status_wws
% @type categorical
% @canonical false
% @original_name availability_status (wws boardshop)
% @values sold_out=Sold_out_all_sizes unk_availability_status_wws=Unknown
% @importance 0.7

0.68::acc(s23, availability_status_wws).
0.51::true_val(availability_status_wws, sold_out); 0.49::true_val(availability_status_wws, unk_availability_status_wws).
measured(s23, availability_status_wws, sold_out).
all_consistent(availability_status_wws) :- consistent(s23, availability_status_wws).
evidence(all_consistent(availability_status_wws)).
query(true_val(availability_status_wws, sold_out)).
query(true_val(availability_status_wws, unk_availability_status_wws)).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status (ski pro)
% @values sold_out=Sold_out_all_sizes unk_availability_status_skipro=Unknown
% @importance 0.5

0.60::acc(s26, availability_status_skipro).
0.47::true_val(availability_status_skipro, sold_out); 0.53::true_val(availability_status_skipro, unk_availability_status_skipro).
measured(s26, availability_status_skipro, sold_out).
all_consistent(availability_status_skipro) :- consistent(s26, availability_status_skipro).
evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, sold_out)).
query(true_val(availability_status_skipro, unk_availability_status_skipro)).

% @attr availability_status_proctor
% @type categorical
% @canonical false
% @original_name availability_status (proctor ski)
% @values backordered_155=155_backordered unk_availability_status_proctor=Unknown
% @importance 0.6

0.65::acc(s27, availability_status_proctor).
0.47::true_val(availability_status_proctor, backordered_155); 0.53::true_val(availability_status_proctor, unk_availability_status_proctor).
measured(s27, availability_status_proctor, backordered_155).
all_consistent(availability_status_proctor) :- consistent(s27, availability_status_proctor).
evidence(all_consistent(availability_status_proctor)).
query(true_val(availability_status_proctor, backordered_155)).
query(true_val(availability_status_proctor, unk_availability_status_proctor)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values sept_13_2025=September_13_2025 unk_estimated_availability_date=Unknown
% @importance 0.8

0.65::acc(s4, estimated_availability_date).
0.53::true_val(estimated_availability_date, sept_13_2025); 0.47::true_val(estimated_availability_date, unk_estimated_availability_date).
measured(s4, estimated_availability_date, sept_13_2025).
all_consistent(estimated_availability_date) :- consistent(s4, estimated_availability_date).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, sept_13_2025)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values teal=Teal_2026 unk_available_colors=Unknown
% @importance 0.8

0.68::acc(s4, available_colors).
0.53::true_val(available_colors, teal); 0.47::true_val(available_colors, unk_available_colors).
measured(s4, available_colors, teal).
all_consistent(available_colors) :- consistent(s4, available_colors).
evidence(all_consistent(available_colors)).
query(true_val(available_colors, teal)).
query(true_val(available_colors, unk_available_colors)).

% @attr available_colors_2025
% @type categorical
% @canonical false
% @original_name available_colors (2025)
% @values purple_topsheet_black_base=Purple_topsheet_black_base unk_available_colors_2025=Unknown
% @importance 0.8

0.68::acc(s4, available_colors_2025).
0.53::true_val(available_colors_2025, purple_topsheet_black_base); 0.47::true_val(available_colors_2025, unk_available_colors_2025).
measured(s4, available_colors_2025, purple_topsheet_black_base).
all_consistent(available_colors_2025) :- consistent(s4, available_colors_2025).
evidence(all_consistent(available_colors_2025)).
query(true_val(available_colors_2025, purple_topsheet_black_base)).
query(true_val(available_colors_2025, unk_available_colors_2025)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v1=1.0 unk_warranty_period_years=Unknown
% @importance 0.75

0.85::acc(s28, warranty_period_years).
0.78::true_val(warranty_period_years, v1); 0.22::true_val(warranty_period_years, unk_warranty_period_years).
measured(s28, warranty_period_years, v1).
all_consistent(warranty_period_years) :- consistent(s28, warranty_period_years).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values structural_defects_only=Structural_defects_only_no_impact_abuse unk_warranty=Unknown
% @importance 0.75

0.85::acc(s28, warranty).
0.78::true_val(warranty, structural_defects_only); 0.22::true_val(warranty, unk_warranty).
measured(s28, warranty, structural_defects_only).
all_consistent(warranty) :- consistent(s28, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, structural_defects_only)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_conditions
% @type categorical
% @canonical false
% @original_name warranty (conditions)
% @values receipt_authorized_dealer=Must_have_receipt_from_authorized_dealer unk_warranty_conditions=Unknown
% @importance 0.75

0.92::acc(s29, warranty_conditions).
0.90::true_val(warranty_conditions, receipt_authorized_dealer); 0.10::true_val(warranty_conditions, unk_warranty_conditions).
measured(s29, warranty_conditions, receipt_authorized_dealer).
all_consistent(warranty_conditions) :- consistent(s29, warranty_conditions).
evidence(all_consistent(warranty_conditions)).
query(true_val(warranty_conditions, receipt_authorized_dealer)).
query(true_val(warranty_conditions, unk_warranty_conditions)).

% @attr gnu_com_rating
% @type categorical
% @canonical false
% @original_name GNU.com rating
% @values pct99_43_reviews=99pct_43_reviews unk_gnu_com_rating=Unknown
% @importance 1.0

0.93::acc(s1, gnu_com_rating).
0.92::true_val(gnu_com_rating, pct99_43_reviews); 0.08::true_val(gnu_com_rating, unk_gnu_com_rating).
measured(s1, gnu_com_rating, pct99_43_reviews).
all_consistent(gnu_com_rating) :- consistent(s1, gnu_com_rating).
evidence(all_consistent(gnu_com_rating)).
query(true_val(gnu_com_rating, pct99_43_reviews)).
query(true_val(gnu_com_rating, unk_gnu_com_rating)).

% @attr tactics_rating
% @type categorical
% @canonical false
% @original_name Tactics rating
% @values v5_0_of_5=5_0_out_of_5_1_review unk_tactics_rating=Unknown
% @importance 0.55

0.60::acc(s30, tactics_rating).
0.40::true_val(tactics_rating, v5_0_of_5); 0.60::true_val(tactics_rating, unk_tactics_rating).
measured(s30, tactics_rating, v5_0_of_5).
all_consistent(tactics_rating) :- consistent(s30, tactics_rating).
evidence(all_consistent(tactics_rating)).
query(true_val(tactics_rating, v5_0_of_5)).
query(true_val(tactics_rating, unk_tactics_rating)).

% @attr merchant_rating
% @type categorical
% @canonical false
% @original_name Merchant rating
% @values v5_0_of_5=5_0_out_of_5_great_board unk_merchant_rating=Unknown
% @importance 0.85

0.90::acc(sm, merchant_rating).
0.95::true_val(merchant_rating, v5_0_of_5); 0.05::true_val(merchant_rating, unk_merchant_rating).
measured(sm, merchant_rating, v5_0_of_5).
all_consistent(merchant_rating) :- consistent(sm, merchant_rating).
evidence(all_consistent(merchant_rating)).
query(true_val(merchant_rating, v5_0_of_5)).
query(true_val(merchant_rating, unk_merchant_rating)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values exceptional_edge_hold=Exceptional_edge_hold_icy_conditions_MagneTraction_C3 unk_positive_aspect=Unknown
% @importance 0.875

0.90::acc(s16, positive_aspect).
0.72::acc(s4, positive_aspect).
0.95::true_val(positive_aspect, exceptional_edge_hold); 0.05::true_val(positive_aspect, unk_positive_aspect).
measured(s16, positive_aspect, exceptional_edge_hold).
measured(s4, positive_aspect, exceptional_edge_hold).
all_consistent(positive_aspect) :- consistent(s16, positive_aspect), consistent(s4, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, exceptional_edge_hold)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values base_glide_below_avg=Base_glide_below_average_especially_soft_snow unk_negative_aspect=Unknown
% @importance 0.9

0.90::acc(s16, negative_aspect).
0.72::acc(s31, negative_aspect).
0.95::true_val(negative_aspect, base_glide_below_avg); 0.05::true_val(negative_aspect, unk_negative_aspect).
measured(s16, negative_aspect, base_glide_below_avg).
measured(s31, negative_aspect, base_glide_below_avg).
all_consistent(negative_aspect) :- consistent(s16, negative_aspect), consistent(s31, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, base_glide_below_avg)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr reviewer_opinion_tgr_category
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (category)
% @values alternative_freeride=Alternative_Freeride unk_reviewer_opinion_tgr_category=Unknown
% @importance 0.95

0.90::acc(s16, reviewer_opinion_tgr_category).
0.86::true_val(reviewer_opinion_tgr_category, alternative_freeride); 0.14::true_val(reviewer_opinion_tgr_category, unk_reviewer_opinion_tgr_category).
measured(s16, reviewer_opinion_tgr_category, alternative_freeride).
all_consistent(reviewer_opinion_tgr_category) :- consistent(s16, reviewer_opinion_tgr_category).
evidence(all_consistent(reviewer_opinion_tgr_category)).
query(true_val(reviewer_opinion_tgr_category, alternative_freeride)).
query(true_val(reviewer_opinion_tgr_category, unk_reviewer_opinion_tgr_category)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values good=Good unk_powder_rating_tgr=Unknown
% @importance 0.95

0.90::acc(s16, powder_rating_tgr).
0.86::true_val(powder_rating_tgr, good); 0.14::true_val(powder_rating_tgr, unk_powder_rating_tgr).
measured(s16, powder_rating_tgr, good).
all_consistent(powder_rating_tgr) :- consistent(s16, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values excellent=Excellent unk_carving_rating_tgr=Unknown
% @importance 0.95

0.90::acc(s16, carving_rating_tgr).
0.86::true_val(carving_rating_tgr, excellent); 0.14::true_val(carving_rating_tgr, unk_carving_rating_tgr).
measured(s16, carving_rating_tgr, excellent).
all_consistent(carving_rating_tgr) :- consistent(s16, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, excellent)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values icy_snow_top_tier=Icy_Snow_top_tier unk_edge_hold=Unknown
% @importance 0.95

0.90::acc(s16, edge_hold).
0.86::true_val(edge_hold, icy_snow_top_tier); 0.14::true_val(edge_hold, unk_edge_hold).
measured(s16, edge_hold, icy_snow_top_tier).
all_consistent(edge_hold) :- consistent(s16, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, icy_snow_top_tier)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values below_average=Good_but_below_average_for_peers fast_consistent=Fast_base_nice_consistent_glide
% @importance 0.875

0.90::acc(s16, base_glide_performance).
0.70::acc(s4, base_glide_performance).
0.60::true_val(base_glide_performance, below_average); 0.40::true_val(base_glide_performance, fast_consistent).
measured(s16, base_glide_performance, below_average).
measured(s4, base_glide_performance, fast_consistent).
all_consistent(base_glide_performance) :- consistent(s16, base_glide_performance), consistent(s4, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, below_average)).
query(true_val(base_glide_performance, fast_consistent)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values good=Good unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.90::acc(s16, reviewer_opinion_the_good_ride).
0.86::true_val(reviewer_opinion_the_good_ride, good); 0.14::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s16, reviewer_opinion_the_good_ride, good).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s16, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, good)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values average=Average unk_switch_riding=Unknown
% @importance 0.95

0.90::acc(s16, switch_riding).
0.86::true_val(switch_riding, average); 0.14::true_val(switch_riding, unk_switch_riding).
measured(s16, switch_riding, average).
all_consistent(switch_riding) :- consistent(s16, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, average)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.90::acc(s16, jumps_rating_tgr).
0.86::true_val(jumps_rating_tgr, good); 0.14::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
measured(s16, jumps_rating_tgr, good).
all_consistent(jumps_rating_tgr) :- consistent(s16, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.90::acc(s16, jibbing_rating_tgr).
0.86::true_val(jibbing_rating_tgr, average); 0.14::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
measured(s16, jibbing_rating_tgr, average).
all_consistent(jibbing_rating_tgr) :- consistent(s16, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.95

0.90::acc(s16, speed_rating_tgr).
0.86::true_val(speed_rating_tgr, good); 0.14::true_val(speed_rating_tgr, unk_speed_rating_tgr).
measured(s16, speed_rating_tgr, good).
all_consistent(speed_rating_tgr) :- consistent(s16, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium=Medium unk_turn_initiation_performance=Unknown
% @importance 0.95

0.90::acc(s16, turn_initiation_performance).
0.86::true_val(turn_initiation_performance, medium); 0.14::true_val(turn_initiation_performance, unk_turn_initiation_performance).
measured(s16, turn_initiation_performance, medium).
all_consistent(turn_initiation_performance) :- consistent(s16, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_tgr_effort
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (effort level)
% @values moderate=Moderate unk_reviewer_opinion_tgr_effort=Unknown
% @importance 0.95

0.88::acc(s16, reviewer_opinion_tgr_effort).
0.86::true_val(reviewer_opinion_tgr_effort, moderate); 0.14::true_val(reviewer_opinion_tgr_effort, unk_reviewer_opinion_tgr_effort).
measured(s16, reviewer_opinion_tgr_effort, moderate).
all_consistent(reviewer_opinion_tgr_effort) :- consistent(s16, reviewer_opinion_tgr_effort).
evidence(all_consistent(reviewer_opinion_tgr_effort)).
query(true_val(reviewer_opinion_tgr_effort, moderate)).
query(true_val(reviewer_opinion_tgr_effort, unk_reviewer_opinion_tgr_effort)).

% @attr reviewer_opinion_tgr_quote
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (user quote)
% @values go_to_hard_snow_base_not_great=Go_to_for_hard_snow_but_base_glide_not_great unk_reviewer_opinion_tgr_quote=Unknown
% @importance 0.85

0.72::acc(s31, reviewer_opinion_tgr_quote).
0.54::true_val(reviewer_opinion_tgr_quote, go_to_hard_snow_base_not_great); 0.46::true_val(reviewer_opinion_tgr_quote, unk_reviewer_opinion_tgr_quote).
measured(s31, reviewer_opinion_tgr_quote, go_to_hard_snow_base_not_great).
all_consistent(reviewer_opinion_tgr_quote) :- consistent(s31, reviewer_opinion_tgr_quote).
evidence(all_consistent(reviewer_opinion_tgr_quote)).
query(true_val(reviewer_opinion_tgr_quote, go_to_hard_snow_base_not_great)).
query(true_val(reviewer_opinion_tgr_quote, unk_reviewer_opinion_tgr_quote)).

% @attr reviewer_opinion_tgr_designation
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (designation)
% @values hard_snow_favorite_short_wide=Hard_Snow_Favorite_Short_Wide unk_reviewer_opinion_tgr_designation=Unknown
% @importance 0.95

0.90::acc(s16, reviewer_opinion_tgr_designation).
0.86::true_val(reviewer_opinion_tgr_designation, hard_snow_favorite_short_wide); 0.14::true_val(reviewer_opinion_tgr_designation, unk_reviewer_opinion_tgr_designation).
measured(s16, reviewer_opinion_tgr_designation, hard_snow_favorite_short_wide).
all_consistent(reviewer_opinion_tgr_designation) :- consistent(s16, reviewer_opinion_tgr_designation).
evidence(all_consistent(reviewer_opinion_tgr_designation)).
query(true_val(reviewer_opinion_tgr_designation, hard_snow_favorite_short_wide)).
query(true_val(reviewer_opinion_tgr_designation, unk_reviewer_opinion_tgr_designation)).

% @attr botw_overall
% @type categorical
% @canonical false
% @original_name Board of the World overall
% @values badass_volume_shifted_freeride=Badass_volume_shifted_all_mountain_freeride unk_botw_overall=Unknown
% @importance 0.8

0.68::acc(s4, botw_overall).
0.53::true_val(botw_overall, badass_volume_shifted_freeride); 0.47::true_val(botw_overall, unk_botw_overall).
measured(s4, botw_overall, badass_volume_shifted_freeride).
all_consistent(botw_overall) :- consistent(s4, botw_overall).
evidence(all_consistent(botw_overall)).
query(true_val(botw_overall, badass_volume_shifted_freeride)).
query(true_val(botw_overall, unk_botw_overall)).

% @attr botw_ranking
% @type categorical
% @canonical false
% @original_name Board of the World ranking
% @values rank_14_of_38=14th_of_38_all_mountain unk_botw_ranking=Unknown
% @importance 0.8

0.68::acc(s4, botw_ranking).
0.53::true_val(botw_ranking, rank_14_of_38); 0.47::true_val(botw_ranking, unk_botw_ranking).
measured(s4, botw_ranking, rank_14_of_38).
all_consistent(botw_ranking) :- consistent(s4, botw_ranking).
evidence(all_consistent(botw_ranking)).
query(true_val(botw_ranking, rank_14_of_38)).
query(true_val(botw_ranking, unk_botw_ranking)).

% @attr botw_ice_performance
% @type categorical
% @canonical false
% @original_name Board of the World ice performance
% @values powered_through_ice_chunder=Powered_through_icy_terrain_and_chunder unk_botw_ice_performance=Unknown
% @importance 0.8

0.68::acc(s4, botw_ice_performance).
0.53::true_val(botw_ice_performance, powered_through_ice_chunder); 0.47::true_val(botw_ice_performance, unk_botw_ice_performance).
measured(s4, botw_ice_performance, powered_through_ice_chunder).
all_consistent(botw_ice_performance) :- consistent(s4, botw_ice_performance).
evidence(all_consistent(botw_ice_performance)).
query(true_val(botw_ice_performance, powered_through_ice_chunder)).
query(true_val(botw_ice_performance, unk_botw_ice_performance)).

% @attr botw_ride_feel
% @type categorical
% @canonical false
% @original_name Board of the World ride feel
% @values damp_smooth_carves_well=Damp_smooth_carves_phenomenally unk_botw_ride_feel=Unknown
% @importance 0.8

0.68::acc(s4, botw_ride_feel).
0.53::true_val(botw_ride_feel, damp_smooth_carves_well); 0.47::true_val(botw_ride_feel, unk_botw_ride_feel).
measured(s4, botw_ride_feel, damp_smooth_carves_well).
all_consistent(botw_ride_feel) :- consistent(s4, botw_ride_feel).
evidence(all_consistent(botw_ride_feel)).
query(true_val(botw_ride_feel, damp_smooth_carves_well)).
query(true_val(botw_ride_feel, unk_botw_ride_feel)).

% @attr negative_aspect_not_beginner
% @type categorical
% @canonical false
% @original_name negative_aspect (not beginner friendly)
% @values not_beginner_friendly=Not_beginner_or_intermediate_friendly_aggressive_catchy unk_negative_aspect_not_beginner=Unknown
% @importance 0.75

0.70::acc(s4, negative_aspect_not_beginner).
0.55::acc(s37, negative_aspect_not_beginner).
0.95::true_val(negative_aspect_not_beginner, not_beginner_friendly); 0.05::true_val(negative_aspect_not_beginner, unk_negative_aspect_not_beginner).
measured(s4, negative_aspect_not_beginner, not_beginner_friendly).
measured(s37, negative_aspect_not_beginner, not_beginner_friendly).
all_consistent(negative_aspect_not_beginner) :- consistent(s4, negative_aspect_not_beginner), consistent(s37, negative_aspect_not_beginner).
evidence(all_consistent(negative_aspect_not_beginner)).
query(true_val(negative_aspect_not_beginner, not_beginner_friendly)).
query(true_val(negative_aspect_not_beginner, unk_negative_aspect_not_beginner)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values heavier_than_avg=Heavier_than_average_for_length_contributes_damping unk_board_weight_grams=Unknown
% @importance 0.75

0.80::acc(s32, board_weight_grams).
0.57::true_val(board_weight_grams, heavier_than_avg); 0.43::true_val(board_weight_grams, unk_board_weight_grams).
measured(s32, board_weight_grams, heavier_than_avg).
all_consistent(board_weight_grams) :- consistent(s32, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, heavier_than_avg)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr reviewer_opinion_snowboardingprofiles_damping
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (damping)
% @values quite_damp=Quite_damp_much_damper_than_control unk_reviewer_opinion_snowboardingprofiles_damping=Unknown
% @importance 0.75

0.78::acc(s32, reviewer_opinion_snowboardingprofiles_damping).
0.57::true_val(reviewer_opinion_snowboardingprofiles_damping, quite_damp); 0.43::true_val(reviewer_opinion_snowboardingprofiles_damping, unk_reviewer_opinion_snowboardingprofiles_damping).
measured(s32, reviewer_opinion_snowboardingprofiles_damping, quite_damp).
all_consistent(reviewer_opinion_snowboardingprofiles_damping) :- consistent(s32, reviewer_opinion_snowboardingprofiles_damping).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_damping)).
query(true_val(reviewer_opinion_snowboardingprofiles_damping, quite_damp)).
query(true_val(reviewer_opinion_snowboardingprofiles_damping, unk_reviewer_opinion_snowboardingprofiles_damping)).

% @attr flex_feel_snap
% @type categorical
% @canonical false
% @original_name flex_feel (snap character)
% @values smooth_not_snappy=More_smooth_than_snappy_not_without_snap unk_flex_feel_snap=Unknown
% @importance 0.75

0.78::acc(s32, flex_feel_snap).
0.57::true_val(flex_feel_snap, smooth_not_snappy); 0.43::true_val(flex_feel_snap, unk_flex_feel_snap).
measured(s32, flex_feel_snap, smooth_not_snappy).
all_consistent(flex_feel_snap) :- consistent(s32, flex_feel_snap).
evidence(all_consistent(flex_feel_snap)).
query(true_val(flex_feel_snap, smooth_not_snappy)).
query(true_val(flex_feel_snap, unk_flex_feel_snap)).

% @attr reviewer_opinion_snowboardingprofiles_powder
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (powder)
% @values no_rocker_limits_powder=Only_thing_stopping_elite_powder_is_no_rocker unk_reviewer_opinion_snowboardingprofiles_powder=Unknown
% @importance 0.75

0.78::acc(s32, reviewer_opinion_snowboardingprofiles_powder).
0.57::true_val(reviewer_opinion_snowboardingprofiles_powder, no_rocker_limits_powder); 0.43::true_val(reviewer_opinion_snowboardingprofiles_powder, unk_reviewer_opinion_snowboardingprofiles_powder).
measured(s32, reviewer_opinion_snowboardingprofiles_powder, no_rocker_limits_powder).
all_consistent(reviewer_opinion_snowboardingprofiles_powder) :- consistent(s32, reviewer_opinion_snowboardingprofiles_powder).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_powder)).
query(true_val(reviewer_opinion_snowboardingprofiles_powder, no_rocker_limits_powder)).
query(true_val(reviewer_opinion_snowboardingprofiles_powder, unk_reviewer_opinion_snowboardingprofiles_powder)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values great_volume_shifted_option=Great_option_volume_shifted_powder_with_groomer_life unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.75

0.78::acc(s32, reviewer_opinion_snowboardingprofiles).
0.57::true_val(reviewer_opinion_snowboardingprofiles, great_volume_shifted_option); 0.43::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
measured(s32, reviewer_opinion_snowboardingprofiles, great_volume_shifted_option).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s32, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, great_volume_shifted_option)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr ogrt_powder
% @type categorical
% @canonical false
% @original_name Old Guys Rip Too powder performance
% @values excellent_float_surfboard=Excellent_float_felt_like_surfboard unk_ogrt_powder=Unknown
% @importance 0.7

0.65::acc(s12, ogrt_powder).
0.45::true_val(ogrt_powder, excellent_float_surfboard); 0.55::true_val(ogrt_powder, unk_ogrt_powder).
measured(s12, ogrt_powder, excellent_float_surfboard).
all_consistent(ogrt_powder) :- consistent(s12, ogrt_powder).
evidence(all_consistent(ogrt_powder)).
query(true_val(ogrt_powder, excellent_float_surfboard)).
query(true_val(ogrt_powder, unk_ogrt_powder)).

% @attr ogrt_waxing
% @type categorical
% @canonical false
% @original_name Old Guys Rip Too waxing caveat
% @values frequent_waxing_needed=MagneTraction_boards_need_very_frequent_waxing unk_ogrt_waxing=Unknown
% @importance 0.7

0.65::acc(s12, ogrt_waxing).
0.45::true_val(ogrt_waxing, frequent_waxing_needed); 0.55::true_val(ogrt_waxing, unk_ogrt_waxing).
measured(s12, ogrt_waxing, frequent_waxing_needed).
all_consistent(ogrt_waxing) :- consistent(s12, ogrt_waxing).
evidence(all_consistent(ogrt_waxing)).
query(true_val(ogrt_waxing, frequent_waxing_needed)).
query(true_val(ogrt_waxing, unk_ogrt_waxing)).

% @attr ogrt_overall
% @type categorical
% @canonical false
% @original_name Old Guys Rip Too overall
% @values handles_groomers_ice_ease=Rides_great_handles_groomers_and_ice_with_ease unk_ogrt_overall=Unknown
% @importance 0.7

0.65::acc(s12, ogrt_overall).
0.45::true_val(ogrt_overall, handles_groomers_ice_ease); 0.55::true_val(ogrt_overall, unk_ogrt_overall).
measured(s12, ogrt_overall, handles_groomers_ice_ease).
all_consistent(ogrt_overall) :- consistent(s12, ogrt_overall).
evidence(all_consistent(ogrt_overall)).
query(true_val(ogrt_overall, handles_groomers_ice_ease)).
query(true_val(ogrt_overall, unk_ogrt_overall)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values launch_155_only=Came_in_155_only_for_2020_2021 unk_reviewer_opinion_whitelines=Unknown
% @importance 0.55

0.72::acc(s33, reviewer_opinion_whitelines).
0.64::true_val(reviewer_opinion_whitelines, launch_155_only); 0.36::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).
measured(s33, reviewer_opinion_whitelines, launch_155_only).
all_consistent(reviewer_opinion_whitelines) :- consistent(s33, reviewer_opinion_whitelines).
evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, launch_155_only)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr flex_feel_whitelines
% @type categorical
% @canonical false
% @original_name flex_feel (whitelines)
% @values poppy_medium_stiff=Poppy_medium_stiff_flex unk_flex_feel_whitelines=Unknown
% @importance 0.55

0.72::acc(s33, flex_feel_whitelines).
0.64::true_val(flex_feel_whitelines, poppy_medium_stiff); 0.36::true_val(flex_feel_whitelines, unk_flex_feel_whitelines).
measured(s33, flex_feel_whitelines, poppy_medium_stiff).
all_consistent(flex_feel_whitelines) :- consistent(s33, flex_feel_whitelines).
evidence(all_consistent(flex_feel_whitelines)).
query(true_val(flex_feel_whitelines, poppy_medium_stiff)).
query(true_val(flex_feel_whitelines, unk_flex_feel_whitelines)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values all_terrain_crusher=Board_rips_in_all_conditions_all_terrain_crusher unk_user_review_forum=Unknown
% @importance 0.7

0.58::acc(s34, user_review_forum).
0.37::true_val(user_review_forum, all_terrain_crusher); 0.63::true_val(user_review_forum, unk_user_review_forum).
measured(s34, user_review_forum, all_terrain_crusher).
all_consistent(user_review_forum) :- consistent(s34, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, all_terrain_crusher)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_dampness
% @type categorical
% @canonical false
% @original_name user_review_forum (dampness)
% @values right_dampness_snap_torsion=Just_right_dampness_snappiness_torsional_flex unk_user_review_forum_dampness=Unknown
% @importance 0.7

0.58::acc(s34, user_review_forum_dampness).
0.37::true_val(user_review_forum_dampness, right_dampness_snap_torsion); 0.63::true_val(user_review_forum_dampness, unk_user_review_forum_dampness).
measured(s34, user_review_forum_dampness, right_dampness_snap_torsion).
all_consistent(user_review_forum_dampness) :- consistent(s34, user_review_forum_dampness).
evidence(all_consistent(user_review_forum_dampness)).
query(true_val(user_review_forum_dampness, right_dampness_snap_torsion)).
query(true_val(user_review_forum_dampness, unk_user_review_forum_dampness)).

% @attr user_review_forum_variable_terrain
% @type categorical
% @canonical false
% @original_name user_review_forum (variable terrain)
% @values best_for_ice_chop_chunder=Best_board_for_ice_chop_death_cookies_chunder unk_user_review_forum_variable_terrain=Unknown
% @importance 0.7

0.58::acc(s34, user_review_forum_variable_terrain).
0.37::true_val(user_review_forum_variable_terrain, best_for_ice_chop_chunder); 0.63::true_val(user_review_forum_variable_terrain, unk_user_review_forum_variable_terrain).
measured(s34, user_review_forum_variable_terrain, best_for_ice_chop_chunder).
all_consistent(user_review_forum_variable_terrain) :- consistent(s34, user_review_forum_variable_terrain).
evidence(all_consistent(user_review_forum_variable_terrain)).
query(true_val(user_review_forum_variable_terrain, best_for_ice_chop_chunder)).
query(true_val(user_review_forum_variable_terrain, unk_user_review_forum_variable_terrain)).

% @attr user_review_forum_ice_grip
% @type categorical
% @canonical false
% @original_name user_review_forum (ice grip)
% @values best_grip_ice_firm_snow=Best_grip_on_ice_firm_snow_of_all_boards unk_user_review_forum_ice_grip=Unknown
% @importance 0.7

0.58::acc(s34, user_review_forum_ice_grip).
0.37::true_val(user_review_forum_ice_grip, best_grip_ice_firm_snow); 0.63::true_val(user_review_forum_ice_grip, unk_user_review_forum_ice_grip).
measured(s34, user_review_forum_ice_grip, best_grip_ice_firm_snow).
all_consistent(user_review_forum_ice_grip) :- consistent(s34, user_review_forum_ice_grip).
evidence(all_consistent(user_review_forum_ice_grip)).
query(true_val(user_review_forum_ice_grip, best_grip_ice_firm_snow)).
query(true_val(user_review_forum_ice_grip, unk_user_review_forum_ice_grip)).

% @attr user_review_forum_sizing
% @type categorical
% @canonical false
% @original_name user_review_forum (sizing)
% @values fifty_fifty_148_152=50_50_on_148_and_152_for_66kg unk_user_review_forum_sizing=Unknown
% @importance 0.75

0.52::acc(s35, user_review_forum_sizing).
0.31::true_val(user_review_forum_sizing, fifty_fifty_148_152); 0.69::true_val(user_review_forum_sizing, unk_user_review_forum_sizing).
measured(s35, user_review_forum_sizing, fifty_fifty_148_152).
all_consistent(user_review_forum_sizing) :- consistent(s35, user_review_forum_sizing).
evidence(all_consistent(user_review_forum_sizing)).
query(true_val(user_review_forum_sizing, fifty_fifty_148_152)).
query(true_val(user_review_forum_sizing, unk_user_review_forum_sizing)).

% @attr user_review_forum_edge_hold
% @type categorical
% @canonical false
% @original_name user_review_forum (edge hold)
% @values excellent_go_to_hard_icy=Excellent_edge_hold_go_to_for_hard_icy unk_user_review_forum_edge_hold=Unknown
% @importance 0.75

0.52::acc(s35, user_review_forum_edge_hold).
0.31::true_val(user_review_forum_edge_hold, excellent_go_to_hard_icy); 0.69::true_val(user_review_forum_edge_hold, unk_user_review_forum_edge_hold).
measured(s35, user_review_forum_edge_hold, excellent_go_to_hard_icy).
all_consistent(user_review_forum_edge_hold) :- consistent(s35, user_review_forum_edge_hold).
evidence(all_consistent(user_review_forum_edge_hold)).
query(true_val(user_review_forum_edge_hold, excellent_go_to_hard_icy)).
query(true_val(user_review_forum_edge_hold, unk_user_review_forum_edge_hold)).

% @attr user_review_forum_nose
% @type categorical
% @canonical false
% @original_name user_review_forum (nose behavior)
% @values nose_weird_hard_to_turn=Nose_weird_doesnt_want_to_turn_some_conditions unk_user_review_forum_nose=Unknown
% @importance 0.65

0.45::acc(s36, user_review_forum_nose).
0.25::true_val(user_review_forum_nose, nose_weird_hard_to_turn); 0.75::true_val(user_review_forum_nose, unk_user_review_forum_nose).
measured(s36, user_review_forum_nose, nose_weird_hard_to_turn).
all_consistent(user_review_forum_nose) :- consistent(s36, user_review_forum_nose).
evidence(all_consistent(user_review_forum_nose)).
query(true_val(user_review_forum_nose, nose_weird_hard_to_turn)).
query(true_val(user_review_forum_nose, unk_user_review_forum_nose)).

% @attr user_review_forum_heavy
% @type categorical
% @canonical false
% @original_name user_review_forum (heavy/hard to turn)
% @values heavy_hard_to_turn=Heavy_hard_to_turn_for_intermediate_160_165lbs_152 unk_user_review_forum_heavy=Unknown
% @importance 0.7

0.45::acc(s37, user_review_forum_heavy).
0.26::true_val(user_review_forum_heavy, heavy_hard_to_turn); 0.74::true_val(user_review_forum_heavy, unk_user_review_forum_heavy).
measured(s37, user_review_forum_heavy, heavy_hard_to_turn).
all_consistent(user_review_forum_heavy) :- consistent(s37, user_review_forum_heavy).
evidence(all_consistent(user_review_forum_heavy)).
query(true_val(user_review_forum_heavy, heavy_hard_to_turn)).
query(true_val(user_review_forum_heavy, unk_user_review_forum_heavy)).

% @attr user_review_forum_beginner
% @type categorical
% @canonical false
% @original_name user_review_forum (beginner suitability)
% @values not_for_beginners=Not_suitable_for_beginners_catchy_C3 unk_user_review_forum_beginner=Unknown
% @importance 0.7

0.45::acc(s37, user_review_forum_beginner).
0.26::true_val(user_review_forum_beginner, not_for_beginners); 0.74::true_val(user_review_forum_beginner, unk_user_review_forum_beginner).
measured(s37, user_review_forum_beginner, not_for_beginners).
all_consistent(user_review_forum_beginner) :- consistent(s37, user_review_forum_beginner).
evidence(all_consistent(user_review_forum_beginner)).
query(true_val(user_review_forum_beginner, not_for_beginners)).
query(true_val(user_review_forum_beginner, unk_user_review_forum_beginner)).

% @attr comparable_board_cross_brand_vs_dinghy
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (vs Nitro Dinghy)
% @values stiffer_better_hard_icy=Noticeably_stiffer_better_in_hard_icy_conditions unk_comparable_board_cross_brand_vs_dinghy=Unknown
% @importance 0.7

0.52::acc(s38, comparable_board_cross_brand_vs_dinghy).
0.32::true_val(comparable_board_cross_brand_vs_dinghy, stiffer_better_hard_icy); 0.68::true_val(comparable_board_cross_brand_vs_dinghy, unk_comparable_board_cross_brand_vs_dinghy).
measured(s38, comparable_board_cross_brand_vs_dinghy, stiffer_better_hard_icy).
all_consistent(comparable_board_cross_brand_vs_dinghy) :- consistent(s38, comparable_board_cross_brand_vs_dinghy).
evidence(all_consistent(comparable_board_cross_brand_vs_dinghy)).
query(true_val(comparable_board_cross_brand_vs_dinghy, stiffer_better_hard_icy)).
query(true_val(comparable_board_cross_brand_vs_dinghy, unk_comparable_board_cross_brand_vs_dinghy)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values orca_hovercraft_scout_etc=Lib_Tech_Orca_Jones_Hovercraft_Endeavor_Scout_etc unk_comparable_board_cross_brand=Unknown
% @importance 0.95

0.88::acc(s16, comparable_board_cross_brand).
0.86::true_val(comparable_board_cross_brand, orca_hovercraft_scout_etc); 0.14::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s16, comparable_board_cross_brand, orca_hovercraft_scout_etc).
all_consistent(comparable_board_cross_brand) :- consistent(s16, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, orca_hovercraft_scout_etc)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_vs_orca_stability
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (vs Orca stability)
% @values more_stable_precise=Gremlin_more_stable_precise_Orca_more_versatile unk_comparable_board_cross_brand_vs_orca_stability=Unknown
% @importance 0.85

0.68::acc(s39, comparable_board_cross_brand_vs_orca_stability).
0.53::true_val(comparable_board_cross_brand_vs_orca_stability, more_stable_precise); 0.47::true_val(comparable_board_cross_brand_vs_orca_stability, unk_comparable_board_cross_brand_vs_orca_stability).
measured(s39, comparable_board_cross_brand_vs_orca_stability, more_stable_precise).
all_consistent(comparable_board_cross_brand_vs_orca_stability) :- consistent(s39, comparable_board_cross_brand_vs_orca_stability).
evidence(all_consistent(comparable_board_cross_brand_vs_orca_stability)).
query(true_val(comparable_board_cross_brand_vs_orca_stability, more_stable_precise)).
query(true_val(comparable_board_cross_brand_vs_orca_stability, unk_comparable_board_cross_brand_vs_orca_stability)).

% @attr comparable_board_cross_brand_vs_orca_camber
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (vs Orca camber)
% @values c3_vs_c2x=Gremlin_C3_camber_dominant_vs_Orca_C2X_rocker_hybrid unk_comparable_board_cross_brand_vs_orca_camber=Unknown
% @importance 0.85

0.68::acc(s39, comparable_board_cross_brand_vs_orca_camber).
0.53::true_val(comparable_board_cross_brand_vs_orca_camber, c3_vs_c2x); 0.47::true_val(comparable_board_cross_brand_vs_orca_camber, unk_comparable_board_cross_brand_vs_orca_camber).
measured(s39, comparable_board_cross_brand_vs_orca_camber, c3_vs_c2x).
all_consistent(comparable_board_cross_brand_vs_orca_camber) :- consistent(s39, comparable_board_cross_brand_vs_orca_camber).
evidence(all_consistent(comparable_board_cross_brand_vs_orca_camber)).
query(true_val(comparable_board_cross_brand_vs_orca_camber, c3_vs_c2x)).
query(true_val(comparable_board_cross_brand_vs_orca_camber, unk_comparable_board_cross_brand_vs_orca_camber)).

% @attr comparable_board_cross_brand_vs_orca_price
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (vs Orca price)
% @values gremlin_120_cheaper=Gremlin_approximately_120_cheaper_than_Orca unk_comparable_board_cross_brand_vs_orca_price=Unknown
% @importance 0.85

0.68::acc(s39, comparable_board_cross_brand_vs_orca_price).
0.53::true_val(comparable_board_cross_brand_vs_orca_price, gremlin_120_cheaper); 0.47::true_val(comparable_board_cross_brand_vs_orca_price, unk_comparable_board_cross_brand_vs_orca_price).
measured(s39, comparable_board_cross_brand_vs_orca_price, gremlin_120_cheaper).
all_consistent(comparable_board_cross_brand_vs_orca_price) :- consistent(s39, comparable_board_cross_brand_vs_orca_price).
evidence(all_consistent(comparable_board_cross_brand_vs_orca_price)).
query(true_val(comparable_board_cross_brand_vs_orca_price, gremlin_120_cheaper)).
query(true_val(comparable_board_cross_brand_vs_orca_price, unk_comparable_board_cross_brand_vs_orca_price)).

% @attr comparable_board_cross_brand_vs_orca_performance
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (vs Orca performance)
% @values higher_caliber_stiff_aggressive=Higher_caliber_performance_stiffness_aggressive_turning unk_comparable_board_cross_brand_vs_orca_performance=Unknown
% @importance 0.75

0.60::acc(s40, comparable_board_cross_brand_vs_orca_performance).
0.41::true_val(comparable_board_cross_brand_vs_orca_performance, higher_caliber_stiff_aggressive); 0.59::true_val(comparable_board_cross_brand_vs_orca_performance, unk_comparable_board_cross_brand_vs_orca_performance).
measured(s40, comparable_board_cross_brand_vs_orca_performance, higher_caliber_stiff_aggressive).
all_consistent(comparable_board_cross_brand_vs_orca_performance) :- consistent(s40, comparable_board_cross_brand_vs_orca_performance).
evidence(all_consistent(comparable_board_cross_brand_vs_orca_performance)).
query(true_val(comparable_board_cross_brand_vs_orca_performance, higher_caliber_stiff_aggressive)).
query(true_val(comparable_board_cross_brand_vs_orca_performance, unk_comparable_board_cross_brand_vs_orca_performance)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values turbo_gremlin_629_99=Turbo_Gremlin_carbon_enhanced_629_99_narrower unk_comparable_board_same_brand=Unknown
% @importance 0.65

0.88::acc(s41, comparable_board_same_brand).
0.79::true_val(comparable_board_same_brand, turbo_gremlin_629_99); 0.21::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s41, comparable_board_same_brand, turbo_gremlin_629_99).
all_consistent(comparable_board_same_brand) :- consistent(s41, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, turbo_gremlin_629_99)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values bent_metal_axtion=Bent_Metal_Axtion_matching_teal_2026 unk_binding_compatibility=Unknown
% @importance 0.8

0.68::acc(s4, binding_compatibility).
0.53::true_val(binding_compatibility, bent_metal_axtion); 0.47::true_val(binding_compatibility, unk_binding_compatibility).
measured(s4, binding_compatibility, bent_metal_axtion).
all_consistent(binding_compatibility) :- consistent(s4, binding_compatibility).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, bent_metal_axtion)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr binding_compatibility_additional
% @type categorical
% @canonical false
% @original_name binding_compatibility (additional)
% @values bent_metal_transfer_union_ultra=Bent_Metal_Transfer_Union_Ultra unk_binding_compatibility_additional=Unknown
% @importance 0.8

0.68::acc(s4, binding_compatibility_additional).
0.53::true_val(binding_compatibility_additional, bent_metal_transfer_union_ultra); 0.47::true_val(binding_compatibility_additional, unk_binding_compatibility_additional).
measured(s4, binding_compatibility_additional, bent_metal_transfer_union_ultra).
all_consistent(binding_compatibility_additional) :- consistent(s4, binding_compatibility_additional).
evidence(all_consistent(binding_compatibility_additional)).
query(true_val(binding_compatibility_additional, bent_metal_transfer_union_ultra)).
query(true_val(binding_compatibility_additional, unk_binding_compatibility_additional)).

% @attr binding_compatibility_forum
% @type categorical
% @canonical false
% @original_name binding_compatibility (forum recommendations)
% @values union_strata_force=Union_Strata_Union_Force unk_binding_compatibility_forum=Unknown
% @importance 0.55

0.45::acc(s42, binding_compatibility_forum).
0.25::true_val(binding_compatibility_forum, union_strata_force); 0.75::true_val(binding_compatibility_forum, unk_binding_compatibility_forum).
measured(s42, binding_compatibility_forum, union_strata_force).
all_consistent(binding_compatibility_forum) :- consistent(s42, binding_compatibility_forum).
evidence(all_consistent(binding_compatibility_forum)).
query(true_val(binding_compatibility_forum, union_strata_force)).
query(true_val(binding_compatibility_forum, unk_binding_compatibility_forum)).

% @attr terrain_suitability_hardpack
% @type categorical
% @canonical false
% @original_name terrain_suitability (hardpack/ice)
% @values aggressive_carving_hardpack_ice=Aggressive_carving_on_hardpack_and_ice unk_terrain_suitability_hardpack=Unknown
% @importance 0.875

0.90::acc(s16, terrain_suitability_hardpack).
0.72::acc(s4, terrain_suitability_hardpack).
0.95::true_val(terrain_suitability_hardpack, aggressive_carving_hardpack_ice); 0.05::true_val(terrain_suitability_hardpack, unk_terrain_suitability_hardpack).
measured(s16, terrain_suitability_hardpack, aggressive_carving_hardpack_ice).
measured(s4, terrain_suitability_hardpack, aggressive_carving_hardpack_ice).
all_consistent(terrain_suitability_hardpack) :- consistent(s16, terrain_suitability_hardpack), consistent(s4, terrain_suitability_hardpack).
evidence(all_consistent(terrain_suitability_hardpack)).
query(true_val(terrain_suitability_hardpack, aggressive_carving_hardpack_ice)).
query(true_val(terrain_suitability_hardpack, unk_terrain_suitability_hardpack)).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name positive_aspect (pop)
% @values excellent_pop_spring=Excellent_pop_and_spring_out_of_turns unk_positive_aspect_pop=Unknown
% @importance 0.95

0.90::acc(s16, positive_aspect_pop).
0.86::true_val(positive_aspect_pop, excellent_pop_spring); 0.14::true_val(positive_aspect_pop, unk_positive_aspect_pop).
measured(s16, positive_aspect_pop, excellent_pop_spring).
all_consistent(positive_aspect_pop) :- consistent(s16, positive_aspect_pop).
evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, excellent_pop_spring)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

% @attr positive_aspect_stability
% @type categorical
% @canonical false
% @original_name positive_aspect (stability)
% @values stable_high_speed=Stable_at_high_speed_for_short_wide_board unk_positive_aspect_stability=Unknown
% @importance 0.8

0.68::acc(s4, positive_aspect_stability).
0.53::true_val(positive_aspect_stability, stable_high_speed); 0.47::true_val(positive_aspect_stability, unk_positive_aspect_stability).
measured(s4, positive_aspect_stability, stable_high_speed).
all_consistent(positive_aspect_stability) :- consistent(s4, positive_aspect_stability).
evidence(all_consistent(positive_aspect_stability)).
query(true_val(positive_aspect_stability, stable_high_speed)).
query(true_val(positive_aspect_stability, unk_positive_aspect_stability)).

% @attr negative_aspect_powder_float
% @type categorical
% @canonical false
% @original_name negative_aspect (powder float)
% @values powder_float_below_peers=Powder_float_below_peers_in_volume_shifted_category unk_negative_aspect_powder_float=Unknown
% @importance 0.95

0.90::acc(s16, negative_aspect_powder_float).
0.86::true_val(negative_aspect_powder_float, powder_float_below_peers); 0.14::true_val(negative_aspect_powder_float, unk_negative_aspect_powder_float).
measured(s16, negative_aspect_powder_float, powder_float_below_peers).
all_consistent(negative_aspect_powder_float) :- consistent(s16, negative_aspect_powder_float).
evidence(all_consistent(negative_aspect_powder_float)).
query(true_val(negative_aspect_powder_float, powder_float_below_peers)).
query(true_val(negative_aspect_powder_float, unk_negative_aspect_powder_float)).

% @attr negative_aspect_edge_initiation
% @type categorical
% @canonical false
% @original_name negative_aspect (edge initiation)
% @values wider_slower_initiation_small_boots=Wider_width_slower_edge_initiation_under_10US unk_negative_aspect_edge_initiation=Unknown
% @importance 0.95

0.88::acc(s16, negative_aspect_edge_initiation).
0.86::true_val(negative_aspect_edge_initiation, wider_slower_initiation_small_boots); 0.14::true_val(negative_aspect_edge_initiation, unk_negative_aspect_edge_initiation).
measured(s16, negative_aspect_edge_initiation, wider_slower_initiation_small_boots).
all_consistent(negative_aspect_edge_initiation) :- consistent(s16, negative_aspect_edge_initiation).
evidence(all_consistent(negative_aspect_edge_initiation)).
query(true_val(negative_aspect_edge_initiation, wider_slower_initiation_small_boots)).
query(true_val(negative_aspect_edge_initiation, unk_negative_aspect_edge_initiation)).

% @attr negative_aspect_waxing
% @type categorical
% @canonical false
% @original_name negative_aspect (waxing)
% @values frequent_waxing_magnatraction=May_need_more_frequent_waxing_MagneTraction unk_negative_aspect_waxing=Unknown
% @importance 0.7

0.65::acc(s12, negative_aspect_waxing).
0.45::true_val(negative_aspect_waxing, frequent_waxing_magnatraction); 0.55::true_val(negative_aspect_waxing, unk_negative_aspect_waxing).
measured(s12, negative_aspect_waxing, frequent_waxing_magnatraction).
all_consistent(negative_aspect_waxing) :- consistent(s12, negative_aspect_waxing).
evidence(all_consistent(negative_aspect_waxing)).
query(true_val(negative_aspect_waxing, frequent_waxing_magnatraction)).
query(true_val(negative_aspect_waxing, unk_negative_aspect_waxing)).

% @attr value_proposition
% @type categorical
% @canonical false
% @original_name Value proposition
% @values competitive_frequently_on_sale=Competitively_priced_frequently_20_30pct_off unk_value_proposition=Unknown
% @importance 0.95

0.90::acc(s1, value_proposition).
0.82::acc(s20, value_proposition).
0.95::true_val(value_proposition, competitive_frequently_on_sale); 0.05::true_val(value_proposition, unk_value_proposition).
measured(s1, value_proposition, competitive_frequently_on_sale).
measured(s20, value_proposition, competitive_frequently_on_sale).
all_consistent(value_proposition) :- consistent(s1, value_proposition), consistent(s20, value_proposition).
evidence(all_consistent(value_proposition)).
query(true_val(value_proposition, competitive_frequently_on_sale)).
query(true_val(value_proposition, unk_value_proposition)).