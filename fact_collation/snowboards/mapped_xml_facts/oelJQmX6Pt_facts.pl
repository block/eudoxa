0.20::indep(s4).
0.15::indep(s8).
0.15::indep(s12).
0.15::indep(s14).
0.15::indep(s17).
0.15::indep(s19).
0.15::indep(s_merchant).
0.25::indep(s21).
0.15::indep(s27).
0.25::indep(s34).
0.15::indep(s43).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 0.95
0.94::acc(s1, brand).
0.80::acc(s4, brand).
0.95::true_val(brand, lib_tech); 0.05::true_val(brand, unk_brand).
measured(s1, brand, lib_tech).
measured(s4, brand, lib_tech).
all_consistent(brand) :- consistent(s1, brand), (indep(s4), consistent(s4, brand) ; \+indep(s4)).
evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values dynamo=Dynamo unk_model_name=Unknown
% @importance 1.0
0.95::acc(s1, model_name).
0.95::true_val(model_name, dynamo); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, dynamo).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, dynamo)).
query(true_val(model_name, unk_model_name)).

% @attr full_product_name
% @type categorical
% @canonical false
% @original_name full product name
% @values lt_dynamo_c3_2026=Lib_Tech_Dynamo_C3_Snowboard_2026 unk_full_product_name=Unknown
% @importance 0.90
0.88::acc(s4, full_product_name).
0.88::true_val(full_product_name, lt_dynamo_c3_2026); 0.12::true_val(full_product_name, unk_full_product_name).
measured(s4, full_product_name, lt_dynamo_c3_2026).
all_consistent(full_product_name) :- consistent(s4, full_product_name).
evidence(all_consistent(full_product_name)).
query(true_val(full_product_name, lt_dynamo_c3_2026)).
query(true_val(full_product_name, unk_full_product_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025_2026=2025-2026 unk_model_year=Unknown
% @importance 1.0
0.94::acc(s1, model_year).
0.95::true_val(model_year, y2025_2026); 0.05::true_val(model_year, unk_model_year).
measured(s1, model_year, y2025_2026).
all_consistent(model_year) :- consistent(s1, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2025_2026)).
query(true_val(model_year, unk_model_year)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.70
0.92::acc(s6, manufacturer).
0.92::true_val(manufacturer, mervin_manufacturing); 0.08::true_val(manufacturer, unk_manufacturer).
measured(s6, manufacturer, mervin_manufacturing).
all_consistent(manufacturer) :- consistent(s6, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name manufacturer founded
% @values y1977_olson_saari=1977_Mike_Olson_Pete_Saari unk_manufacturer_founded=Unknown
% @importance 0.70
0.90::acc(s6, manufacturer_founded).
0.90::true_val(manufacturer_founded, y1977_olson_saari); 0.10::true_val(manufacturer_founded, unk_manufacturer_founded).
measured(s6, manufacturer_founded, y1977_olson_saari).
all_consistent(manufacturer_founded) :- consistent(s6, manufacturer_founded).
evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y1977_olson_saari)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values carlsborg_sequim_wa_usa=Carlsborg_Sequim_WA_USA unk_manufacturing_location=Unknown
% @importance 0.60
0.90::acc(s6, manufacturing_location).
0.72::acc(s7, manufacturing_location).
0.95::true_val(manufacturing_location, carlsborg_sequim_wa_usa); 0.05::true_val(manufacturing_location, unk_manufacturing_location).
measured(s6, manufacturing_location, carlsborg_sequim_wa_usa).
measured(s7, manufacturing_location, carlsborg_sequim_wa_usa).
all_consistent(manufacturing_location) :- consistent(s6, manufacturing_location), consistent(s7, manufacturing_location).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, carlsborg_sequim_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr handbuilt_in_usa
% @type categorical
% @canonical false
% @original_name handbuilt in USA
% @values yes=Yes unk_handbuilt_in_usa=Unknown
% @importance 0.85
0.78::acc(s8, handbuilt_in_usa).
0.78::true_val(handbuilt_in_usa, yes); 0.22::true_val(handbuilt_in_usa, unk_handbuilt_in_usa).
measured(s8, handbuilt_in_usa, yes).
all_consistent(handbuilt_in_usa) :- (indep(s8), consistent(s8, handbuilt_in_usa) ; \+indep(s8)).
evidence(all_consistent(handbuilt_in_usa)).
query(true_val(handbuilt_in_usa, yes)).
query(true_val(handbuilt_in_usa, unk_handbuilt_in_usa)).

% @attr model_first_available_year
% @type categorical
% @canonical false
% @original_name model_first_available_year
% @values season_2019_20=2019_20_winter_season unk_model_first_available_year=Unknown
% @importance 0.75
0.78::acc(s9, model_first_available_year).
0.78::true_val(model_first_available_year, season_2019_20); 0.22::true_val(model_first_available_year, unk_model_first_available_year).
measured(s9, model_first_available_year, season_2019_20).
all_consistent(model_first_available_year) :- consistent(s9, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2019_20)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr model_continuity
% @type categorical
% @canonical false
% @original_name model continuity
% @values continuous_2020_2026=Continuously_produced_2020_2026 unk_model_continuity=Unknown
% @importance 0.95
0.86::acc(s10, model_continuity).
0.86::true_val(model_continuity, continuous_2020_2026); 0.14::true_val(model_continuity, unk_model_continuity).
measured(s10, model_continuity, continuous_2020_2026).
all_consistent(model_continuity) :- consistent(s10, model_continuity).
evidence(all_consistent(model_continuity)).
query(true_val(model_continuity, continuous_2020_2026)).
query(true_val(model_continuity, unk_model_continuity)).

% @attr successor_2026_2027
% @type categorical
% @canonical false
% @original_name 2026-2027 early release successor
% @values available_new_shape=Already_available_new_floatier_shape unk_successor_2026_2027=Unknown
% @importance 0.65
0.88::acc(s11, successor_2026_2027).
0.88::true_val(successor_2026_2027, available_new_shape); 0.12::true_val(successor_2026_2027, unk_successor_2026_2027).
measured(s11, successor_2026_2027, available_new_shape).
all_consistent(successor_2026_2027) :- consistent(s11, successor_2026_2027).
evidence(all_consistent(successor_2026_2027)).
query(true_val(successor_2026_2027, available_new_shape)).
query(true_val(successor_2026_2027, unk_successor_2026_2027)).

% @attr shape_change_2025_vs_2024
% @type categorical
% @canonical false
% @original_name 2025 vs 2024 shape change
% @values same_sidecut_more_blunted=Same_sidecut_contact_edge_with_more_blunted_nose_tail unk_shape_change_2025_vs_2024=Unknown
% @importance 0.95
0.87::acc(s10, shape_change_2025_vs_2024).
0.87::true_val(shape_change_2025_vs_2024, same_sidecut_more_blunted); 0.13::true_val(shape_change_2025_vs_2024, unk_shape_change_2025_vs_2024).
measured(s10, shape_change_2025_vs_2024, same_sidecut_more_blunted).
all_consistent(shape_change_2025_vs_2024) :- consistent(s10, shape_change_2025_vs_2024).
evidence(all_consistent(shape_change_2025_vs_2024)).
query(true_val(shape_change_2025_vs_2024, same_sidecut_more_blunted)).
query(true_val(shape_change_2025_vs_2024, unk_shape_change_2025_vs_2024)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values n25sn041=25SN041 unk_sku=Unknown
% @importance 0.85
0.92::acc(s_merchant, sku).
0.92::true_val(sku, n25sn041); 0.08::true_val(sku, unk_sku).
measured(s_merchant, sku, n25sn041).
all_consistent(sku) :- (indep(s_merchant), consistent(s_merchant, sku) ; \+indep(s_merchant)).
evidence(all_consistent(sku)).
query(true_val(sku, n25sn041)).
query(true_val(sku, unk_sku)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0
0.95::acc(s1, product_type).
0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).
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
% @importance 0.80
0.94::acc(s1, board_category).
0.70::acc(s12, board_category).
0.95::true_val(board_category, all_mountain_freeride); 0.05::true_val(board_category, unk_board_category).
measured(s1, board_category, all_mountain_freeride).
measured(s12, board_category, all_mountain_freeride).
all_consistent(board_category) :- consistent(s1, board_category), (indep(s12), consistent(s12, board_category) ; \+indep(s12)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.90
0.85::acc(s4, gender).
0.85::true_val(gender, mens); 0.15::true_val(gender, unk_gender).
measured(s4, gender, mens).
all_consistent(gender) :- (indep(s4), consistent(s4, gender) ; \+indep(s4)).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr graphic_designer_artist
% @type categorical
% @canonical false
% @original_name graphic_designer_artist
% @values mike_parillo=Mike_Parillo unk_graphic_designer_artist=Unknown
% @importance 1.0
0.93::acc(s1, graphic_designer_artist).
0.93::true_val(graphic_designer_artist, mike_parillo); 0.07::true_val(graphic_designer_artist, unk_graphic_designer_artist).
measured(s1, graphic_designer_artist, mike_parillo).
all_consistent(graphic_designer_artist) :- consistent(s1, graphic_designer_artist).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, mike_parillo)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr pro_rider_name
% @type categorical
% @canonical false
% @original_name pro_rider_name
% @values sweetin_hansen=Austen_Sweetin_and_Phil_Hansen unk_pro_rider_name=Unknown
% @importance 1.0
0.93::acc(s1, pro_rider_name).
0.93::true_val(pro_rider_name, sweetin_hansen); 0.07::true_val(pro_rider_name, unk_pro_rider_name).
measured(s1, pro_rider_name, sweetin_hansen).
all_consistent(pro_rider_name) :- consistent(s1, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, sweetin_hansen)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values dynamiss=Lib_Tech_Dynamiss unk_comparable_board_same_brand=Unknown
% @importance 0.40
0.90::acc(s13, comparable_board_same_brand).
0.90::true_val(comparable_board_same_brand, dynamiss); 0.10::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s13, comparable_board_same_brand, dynamiss).
all_consistent(comparable_board_same_brand) :- consistent(s13, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, dynamiss)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.90
0.94::acc(s1, shape).
0.72::acc(s14, shape).
0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).
measured(s1, shape, tapered_directional).
measured(s14, shape, tapered_directional).
all_consistent(shape) :- consistent(s1, shape), (indep(s14), consistent(s14, shape) ; \+indep(s14)).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr taper
% @type numeric
% @unit mm
% @canonical false
% @original_name taper
% @values v3=3.0 unk_taper=Unknown
% @importance 0.95
0.88::acc(s10, taper).
0.88::true_val(taper, v3); 0.12::true_val(taper, unk_taper).
measured(s10, taper, v3).
all_consistent(taper) :- consistent(s10, taper).
evidence(all_consistent(taper)).
query(true_val(taper, v3)).
query(true_val(taper, unk_taper)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c3_directional=C3_Directional crc_hybrid=Camber_Rocker_Camber_Hybrid
% @importance 0.86
0.93::acc(s1, camber_type).
0.72::acc(s14, camber_type).
0.85::acc(s10, camber_type).
0.78::acc(s4, camber_type).
0.62::acc(s17, camber_type).
0.60::true_val(camber_type, c3_directional); 0.40::true_val(camber_type, crc_hybrid).
measured(s1, camber_type, c3_directional).
measured(s14, camber_type, c3_directional).
measured(s10, camber_type, c3_directional).
measured(s4, camber_type, crc_hybrid).
measured(s17, camber_type, crc_hybrid).
all_consistent(camber_type) :- consistent(s1, camber_type), consistent(s10, camber_type), (indep(s14), consistent(s14, camber_type) ; \+indep(s14)), (indep(s4), consistent(s4, camber_type) ; \+indep(s4)), (indep(s17), consistent(s17, camber_type) ; \+indep(s17)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, c3_directional)).
query(true_val(camber_type, crc_hybrid)).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v7=7.0 unk_camber_height_mm=Unknown
% @importance 0.95
0.90::acc(s16, camber_height_mm).
0.90::true_val(camber_height_mm, v7); 0.10::true_val(camber_height_mm, unk_camber_height_mm).
measured(s16, camber_height_mm, v7).
all_consistent(camber_height_mm) :- consistent(s16, camber_height_mm).
evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v7)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name nose design
% @values relaxed_entry_squared=Relaxed_entry_directional_newly_squared_off unk_nose_design=Unknown
% @importance 0.85
0.93::acc(s1, nose_design).
0.78::acc(s8, nose_design).
0.93::true_val(nose_design, relaxed_entry_squared); 0.07::true_val(nose_design, unk_nose_design).
measured(s1, nose_design, relaxed_entry_squared).
measured(s8, nose_design, relaxed_entry_squared).
all_consistent(nose_design) :- consistent(s1, nose_design), (indep(s8), consistent(s8, nose_design) ; \+indep(s8)).
evidence(all_consistent(nose_design)).
query(true_val(nose_design, relaxed_entry_squared)).
query(true_val(nose_design, unk_nose_design)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v6=6.0 v6_5=6.5
% @importance 0.88
0.93::acc(s1, flex_rating_10_manufacturer).
0.70::acc(s12, flex_rating_10_manufacturer).
0.80::acc(s_merchant, flex_rating_10_manufacturer).
0.90::acc(s16, flex_rating_10_manufacturer).
0.40::true_val(flex_rating_10_manufacturer, v6); 0.60::true_val(flex_rating_10_manufacturer, v6_5).
measured(s1, flex_rating_10_manufacturer, v6_5).
measured(s12, flex_rating_10_manufacturer, v6).
measured(s_merchant, flex_rating_10_manufacturer, v6).
measured(s16, flex_rating_10_manufacturer, v6_5).
all_consistent(flex_rating_10_manufacturer) :- consistent(s1, flex_rating_10_manufacturer), consistent(s16, flex_rating_10_manufacturer), (indep(s12), consistent(s12, flex_rating_10_manufacturer) ; \+indep(s12)), (indep(s_merchant), consistent(s_merchant, flex_rating_10_manufacturer) ; \+indep(s_merchant)).
evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6)).
query(true_val(flex_rating_10_manufacturer, v6_5)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium_stiff=Medium_Stiff unk_flex_rating_10_evo=Unknown
% @importance 0.90
0.82::acc(s4, flex_rating_10_evo).
0.82::true_val(flex_rating_10_evo, medium_stiff); 0.18::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).
measured(s4, flex_rating_10_evo, medium_stiff).
all_consistent(flex_rating_10_evo) :- (indep(s4), consistent(s4, flex_rating_10_evo) ; \+indep(s4)).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium_stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_6_5=Medium_6_5_out_of_10 medium_stiff_on_snow=Medium_stiff_on_snow
% @importance 0.87
0.88::acc(s16, flex_feel).
0.86::acc(s10, flex_feel).
0.72::acc(s4, flex_feel).
0.68::acc(s19, flex_feel).
0.55::true_val(flex_feel, medium_6_5); 0.45::true_val(flex_feel, medium_stiff_on_snow).
measured(s16, flex_feel, medium_6_5).
measured(s10, flex_feel, medium_stiff_on_snow).
measured(s4, flex_feel, medium_stiff_on_snow).
measured(s19, flex_feel, medium_stiff_on_snow).
all_consistent(flex_feel) :- consistent(s16, flex_feel), consistent(s10, flex_feel), (indep(s4), consistent(s4, flex_feel) ; \+indep(s4)), (indep(s19), consistent(s19, flex_feel) ; \+indep(s19)).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_6_5)).
query(true_val(flex_feel, medium_stiff_on_snow)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_consistent=Directional_consistent_tip_to_tail unk_flex_direction=Unknown
% @importance 0.95
0.86::acc(s10, flex_direction).
0.86::true_val(flex_direction, directional_consistent); 0.14::true_val(flex_direction, unk_flex_direction).
measured(s10, flex_direction, directional_consistent).
all_consistent(flex_direction) :- consistent(s10, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_consistent)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr construction
% @type categorical
% @canonical false
% @original_name construction
% @values op_original_power=OP_Original_Power_Construction unk_construction=Unknown
% @importance 0.80
0.94::acc(s1, construction).
0.45::acc(s20, construction).
0.95::true_val(construction, op_original_power); 0.05::true_val(construction, unk_construction).
measured(s1, construction, op_original_power).
measured(s20, construction, op_original_power).
all_consistent(construction) :- consistent(s1, construction), consistent(s20, construction).
evidence(all_consistent(construction)).
query(true_val(construction, op_original_power)).
query(true_val(construction, unk_construction)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_75_paulownia_25=Aspen_75pct_Paulownia_25pct unk_core_material=Unknown
% @importance 1.0
0.94::acc(s1, core_material).
0.95::true_val(core_material, aspen_75_paulownia_25); 0.05::true_val(core_material, unk_core_material).
measured(s1, core_material, aspen_75_paulownia_25).
all_consistent(core_material) :- consistent(s1, core_material).
evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_75_paulownia_25)).
query(true_val(core_material, unk_core_material)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values tri_ax_bi_ax=Tri_Ax_Bi_Ax_Fiber unk_laminate=Unknown
% @importance 0.85
0.88::acc(s_merchant, laminate).
0.88::true_val(laminate, tri_ax_bi_ax); 0.12::true_val(laminate, unk_laminate).
measured(s_merchant, laminate, tri_ax_bi_ax).
all_consistent(laminate) :- (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)).
evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax_bi_ax)).
query(true_val(laminate, unk_laminate)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values eco_sub_poly=Eco_Sublimated_Poly_Topsheet unk_topsheet=Unknown
% @importance 0.70
0.78::acc(s8, topsheet).
0.78::true_val(topsheet, eco_sub_poly); 0.22::true_val(topsheet, unk_topsheet).
measured(s8, topsheet, eco_sub_poly).
all_consistent(topsheet) :- (indep(s8), consistent(s8, topsheet) ; \+indep(s8)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sub_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch_internal=Birch_Internal_Sidewalls unk_sidewall_material=Unknown
% @importance 0.85
0.78::acc(s8, sidewall_material).
0.78::true_val(sidewall_material, birch_internal); 0.22::true_val(sidewall_material, unk_sidewall_material).
measured(s8, sidewall_material, birch_internal).
all_consistent(sidewall_material) :- (indep(s8), consistent(s8, sidewall_material) ; \+indep(s8)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_internal)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_surface
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values uhmw_sintered=UHMW_Sintered_Sidewalls unk_sidewall_material_surface=Unknown
% @importance 0.85
0.78::acc(s8, sidewall_material_surface).
0.78::true_val(sidewall_material_surface, uhmw_sintered); 0.22::true_val(sidewall_material_surface, unk_sidewall_material_surface).
measured(s8, sidewall_material_surface, uhmw_sintered).
all_consistent(sidewall_material_surface) :- (indep(s8), consistent(s8, sidewall_material_surface) ; \+indep(s8)).
evidence(all_consistent(sidewall_material_surface)).
query(true_val(sidewall_material_surface, uhmw_sintered)).
query(true_val(sidewall_material_surface, unk_sidewall_material_surface)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values eco_sub_tnt=Eco_Sublimated_TNT_Base unk_base_material=Unknown
% @importance 0.90
0.82::acc(s4, base_material).
0.82::true_val(base_material, eco_sub_tnt); 0.18::true_val(base_material, unk_base_material).
measured(s4, base_material, eco_sub_tnt).
all_consistent(base_material) :- (indep(s4), consistent(s4, base_material) ; \+indep(s4)).
evidence(all_consistent(base_material)).
query(true_val(base_material, eco_sub_tnt)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values extruded=Extruded unk_base_type=Unknown
% @importance 0.95
0.88::acc(s16, base_type).
0.88::true_val(base_type, extruded); 0.12::true_val(base_type, unk_base_type).
measured(s16, base_type, extruded).
all_consistent(base_type) :- consistent(s16, base_type).
evidence(all_consistent(base_type)).
query(true_val(base_type, extruded)).
query(true_val(base_type, unk_base_type)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction_7pt=Magne_Traction_7_bumps unk_edge_technology=Unknown
% @importance 0.86
0.93::acc(s1, edge_technology).
0.86::acc(s10, edge_technology).
0.76::acc(s21, edge_technology).
0.72::acc(s34, edge_technology).
0.95::true_val(edge_technology, magne_traction_7pt); 0.05::true_val(edge_technology, unk_edge_technology).
measured(s1, edge_technology, magne_traction_7pt).
measured(s10, edge_technology, magne_traction_7pt).
measured(s21, edge_technology, magne_traction_7pt).
measured(s34, edge_technology, magne_traction_7pt).
all_consistent(edge_technology) :- consistent(s1, edge_technology), consistent(s10, edge_technology), (indep(s21), consistent(s21, edge_technology) ; \+indep(s21)), (indep(s34), consistent(s34, edge_technology) ; \+indep(s34)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7pt)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr tip_tail_protection
% @type categorical
% @canonical false
% @original_name tip/tail protection
% @values uhmw_impact_deflection=UHMW_Tip_Tail_Impact_Deflection unk_tip_tail_protection=Unknown
% @importance 0.85
0.88::acc(s_merchant, tip_tail_protection).
0.88::true_val(tip_tail_protection, uhmw_impact_deflection); 0.12::true_val(tip_tail_protection, unk_tip_tail_protection).
measured(s_merchant, tip_tail_protection, uhmw_impact_deflection).
all_consistent(tip_tail_protection) :- (indep(s_merchant), consistent(s_merchant, tip_tail_protection) ; \+indep(s_merchant)).
evidence(all_consistent(tip_tail_protection)).
query(true_val(tip_tail_protection, uhmw_impact_deflection)).
query(true_val(tip_tail_protection, unk_tip_tail_protection)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.70
0.65::acc(s17, mounting_pattern).
0.65::true_val(mounting_pattern, inserts_2x4); 0.35::true_val(mounting_pattern, unk_mounting_pattern).
measured(s17, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- (indep(s17), consistent(s17, mounting_pattern) ; \+indep(s17)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values renewable_core_water_solvents=Renewable_core_water_based_solvents unk_sustainability_certification=Unknown
% @importance 0.70
0.78::acc(s8, sustainability_certification).
0.78::true_val(sustainability_certification, renewable_core_water_solvents); 0.22::true_val(sustainability_certification, unk_sustainability_certification).
measured(s8, sustainability_certification, renewable_core_water_solvents).
all_consistent(sustainability_certification) :- (indep(s8), consistent(s8, sustainability_certification) ; \+indep(s8)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, renewable_core_water_solvents)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_zero_hazardous
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values zero_hazardous_waste=Zero_hazardous_waste_factory unk_sustainability_zero_hazardous=Unknown
% @importance 0.60
0.75::acc(s22, sustainability_zero_hazardous).
0.75::true_val(sustainability_zero_hazardous, zero_hazardous_waste); 0.25::true_val(sustainability_zero_hazardous, unk_sustainability_zero_hazardous).
measured(s22, sustainability_zero_hazardous, zero_hazardous_waste).
all_consistent(sustainability_zero_hazardous) :- consistent(s22, sustainability_zero_hazardous).
evidence(all_consistent(sustainability_zero_hazardous)).
query(true_val(sustainability_zero_hazardous, zero_hazardous_waste)).
query(true_val(sustainability_zero_hazardous, unk_sustainability_zero_hazardous)).

% @attr sustainability_sawdust_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values sawdust_recycled_scrap_donated=Sawdust_recycled_scrap_donated unk_sustainability_sawdust_recycling=Unknown
% @importance 0.70
0.78::acc(s8, sustainability_sawdust_recycling).
0.78::true_val(sustainability_sawdust_recycling, sawdust_recycled_scrap_donated); 0.22::true_val(sustainability_sawdust_recycling, unk_sustainability_sawdust_recycling).
measured(s8, sustainability_sawdust_recycling, sawdust_recycled_scrap_donated).
all_consistent(sustainability_sawdust_recycling) :- (indep(s8), consistent(s8, sustainability_sawdust_recycling) ; \+indep(s8)).
evidence(all_consistent(sustainability_sawdust_recycling)).
query(true_val(sustainability_sawdust_recycling, sawdust_recycled_scrap_donated)).
query(true_val(sustainability_sawdust_recycling, unk_sustainability_sawdust_recycling)).

% @attr sustainability_sublimation
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values eco_sublimation_no_toxic_coats=Eco_sublimation_eliminates_toxic_coats unk_sustainability_sublimation=Unknown
% @importance 0.45
0.82::acc(s23, sustainability_sublimation).
0.82::true_val(sustainability_sublimation, eco_sublimation_no_toxic_coats); 0.18::true_val(sustainability_sublimation, unk_sustainability_sublimation).
measured(s23, sustainability_sublimation, eco_sublimation_no_toxic_coats).
all_consistent(sustainability_sublimation) :- consistent(s23, sustainability_sublimation).
evidence(all_consistent(sustainability_sublimation)).
query(true_val(sustainability_sublimation, eco_sublimation_no_toxic_coats)).
query(true_val(sustainability_sublimation, unk_sustainability_sublimation)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s150_153_156_159_162=150_153_156_159_162cm unk_available_sizes=Unknown
% @importance 1.0
0.94::acc(s1, available_sizes).
0.94::true_val(available_sizes, s150_153_156_159_162); 0.06::true_val(available_sizes, unk_available_sizes).
measured(s1, available_sizes, s150_153_156_159_162).
all_consistent(available_sizes) :- consistent(s1, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s150_153_156_159_162)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_wide
% @type categorical
% @canonical false
% @original_name available_sizes
% @values s156w_159w_162w_165w=156W_159W_162W_165W unk_available_sizes_wide=Unknown
% @importance 1.0
0.94::acc(s1, available_sizes_wide).
0.94::true_val(available_sizes_wide, s156w_159w_162w_165w); 0.06::true_val(available_sizes_wide, unk_available_sizes_wide).
measured(s1, available_sizes_wide, s156w_159w_162w_165w).
all_consistent(available_sizes_wide) :- consistent(s1, available_sizes_wide).
evidence(all_consistent(available_sizes_wide)).
query(true_val(available_sizes_wide, s156w_159w_162w_165w)).
query(true_val(available_sizes_wide, unk_available_sizes_wide)).

% @attr contact_length_size_150
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size
% @values v105=105.0 unk_contact_length_size_150=Unknown
% @importance 1.0
0.94::acc(s1, contact_length_size_150).
0.94::true_val(contact_length_size_150, v105); 0.06::true_val(contact_length_size_150, unk_contact_length_size_150).
measured(s1, contact_length_size_150, v105).
all_consistent(contact_length_size_150) :- consistent(s1, contact_length_size_150).
evidence(all_consistent(contact_length_size_150)).
query(true_val(contact_length_size_150, v105)).
query(true_val(contact_length_size_150, unk_contact_length_size_150)).

% @attr sidecut_radius_size_150
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_8=7.8 unk_sidecut_radius_size_150=Unknown
% @importance 1.0
0.94::acc(s1, sidecut_radius_size_150).
0.94::true_val(sidecut_radius_size_150, v7_8); 0.06::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).
measured(s1, sidecut_radius_size_150, v7_8).
all_consistent(sidecut_radius_size_150) :- consistent(s1, sidecut_radius_size_150).
evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v7_8)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

% @attr tip_tail_width_size_150
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values w28_2_27_8=28.2_27.8cm unk_tip_tail_width_size_150=Unknown
% @importance 1.0
0.94::acc(s1, tip_tail_width_size_150).
0.94::true_val(tip_tail_width_size_150, w28_2_27_8); 0.06::true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150).
measured(s1, tip_tail_width_size_150, w28_2_27_8).
all_consistent(tip_tail_width_size_150) :- consistent(s1, tip_tail_width_size_150).
evidence(all_consistent(tip_tail_width_size_150)).
query(true_val(tip_tail_width_size_150, w28_2_27_8)).
query(true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150)).

% @attr waist_width_150
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 150cm
% @values v24_3=24.3 unk_waist_width_150=Unknown
% @importance 1.0
0.94::acc(s1, waist_width_150).
0.94::true_val(waist_width_150, v24_3); 0.06::true_val(waist_width_150, unk_waist_width_150).
measured(s1, waist_width_150, v24_3).
all_consistent(waist_width_150) :- consistent(s1, waist_width_150).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v24_3)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr stance_width_range_size_150
% @type categorical
% @unit inches
% @canonical false
% @original_name stance_width_range_size
% @values r18_5_23_5=18.5_to_23.5in unk_stance_width_range_size_150=Unknown
% @importance 1.0
0.94::acc(s1, stance_width_range_size_150).
0.94::true_val(stance_width_range_size_150, r18_5_23_5); 0.06::true_val(stance_width_range_size_150, unk_stance_width_range_size_150).
measured(s1, stance_width_range_size_150, r18_5_23_5).
all_consistent(stance_width_range_size_150) :- consistent(s1, stance_width_range_size_150).
evidence(all_consistent(stance_width_range_size_150)).
query(true_val(stance_width_range_size_150, r18_5_23_5)).
query(true_val(stance_width_range_size_150, unk_stance_width_range_size_150)).

% @attr recommended_weight_range_size_150
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size
% @values r80_plus_lbs=80_plus_lbs unk_recommended_weight_range_size_150=Unknown
% @importance 1.0
0.94::acc(s1, recommended_weight_range_size_150).
0.94::true_val(recommended_weight_range_size_150, r80_plus_lbs); 0.06::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).
measured(s1, recommended_weight_range_size_150, r80_plus_lbs).
all_consistent(recommended_weight_range_size_150) :- consistent(s1, recommended_weight_range_size_150).
evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, r80_plus_lbs)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

% @attr contact_length_size_153
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size
% @values v108=108.0 unk_contact_length_size_153=Unknown
% @importance 1.0
0.94::acc(s1, contact_length_size_153).
0.94::true_val(contact_length_size_153, v108); 0.06::true_val(contact_length_size_153, unk_contact_length_size_153).
measured(s1, contact_length_size_153, v108).
all_consistent(contact_length_size_153) :- consistent(s1, contact_length_size_153).
evidence(all_consistent(contact_length_size_153)).
query(true_val(contact_length_size_153, v108)).
query(true_val(contact_length_size_153, unk_contact_length_size_153)).

% @attr sidecut_radius_size_153
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_9=7.9 unk_sidecut_radius_size_153=Unknown
% @importance 1.0
0.94::acc(s1, sidecut_radius_size_153).
0.94::true_val(sidecut_radius_size_153, v7_9); 0.06::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).
measured(s1, sidecut_radius_size_153, v7_9).
all_consistent(sidecut_radius_size_153) :- consistent(s1, sidecut_radius_size_153).
evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v7_9)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 153cm
% @values v25_2=25.2 unk_waist_width_153=Unknown
% @importance 1.0
0.94::acc(s1, waist_width_153).
0.94::true_val(waist_width_153, v25_2); 0.06::true_val(waist_width_153, unk_waist_width_153).
measured(s1, waist_width_153, v25_2).
all_consistent(waist_width_153) :- consistent(s1, waist_width_153).
evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_2)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr recommended_weight_range_size_153
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size
% @values r95_plus_lbs=95_plus_lbs unk_recommended_weight_range_size_153=Unknown
% @importance 1.0
0.94::acc(s1, recommended_weight_range_size_153).
0.94::true_val(recommended_weight_range_size_153, r95_plus_lbs); 0.06::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).
measured(s1, recommended_weight_range_size_153, r95_plus_lbs).
all_consistent(recommended_weight_range_size_153) :- consistent(s1, recommended_weight_range_size_153).
evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, r95_plus_lbs)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size
% @values v111=111.0 unk_contact_length_size=Unknown
% @importance 1.0
0.94::acc(s1, contact_length_size).
0.94::true_val(contact_length_size, v111); 0.06::true_val(contact_length_size, unk_contact_length_size).
measured(s1, contact_length_size, v111).
all_consistent(contact_length_size) :- consistent(s1, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v111)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v8_0=8.0 unk_sidecut_radius_size=Unknown
% @importance 1.0
0.94::acc(s1, sidecut_radius_size).
0.94::true_val(sidecut_radius_size, v8_0); 0.06::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s1, sidecut_radius_size, v8_0).
all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_0)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type categorical
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values w29_7_29_4=29.7_29.4cm unk_tip_tail_width_size=Unknown
% @importance 1.0
0.94::acc(s1, tip_tail_width_size).
0.94::true_val(tip_tail_width_size, w29_7_29_4); 0.06::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(s1, tip_tail_width_size, w29_7_29_4).
all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, w29_7_29_4)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 156cm
% @values v25_5=25.5 unk_waist_width_156=Unknown
% @importance 1.0
0.94::acc(s1, waist_width_156).
0.94::true_val(waist_width_156, v25_5); 0.06::true_val(waist_width_156, unk_waist_width_156).
measured(s1, waist_width_156, v25_5).
all_consistent(waist_width_156) :- consistent(s1, waist_width_156).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_5)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr stance_width_range_size
% @type categorical
% @unit inches
% @canonical true
% @original_name stance_width_range_size
% @values r20_25_25_0=20.25_to_25.0in unk_stance_width_range_size=Unknown
% @importance 1.0
0.94::acc(s1, stance_width_range_size).
0.94::true_val(stance_width_range_size, r20_25_25_0); 0.06::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(s1, stance_width_range_size, r20_25_25_0).
all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r20_25_25_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @unit lbs
% @canonical true
% @original_name recommended_weight_range_size
% @values r110_plus_lbs=110_plus_lbs unk_recommended_weight_range_size=Unknown
% @importance 1.0
0.94::acc(s1, recommended_weight_range_size).
0.94::true_val(recommended_weight_range_size, r110_plus_lbs); 0.06::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s1, recommended_weight_range_size, r110_plus_lbs).
all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r110_plus_lbs)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr contact_length_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size
% @values v114=114.0 unk_contact_length_size_159=Unknown
% @importance 1.0
0.94::acc(s1, contact_length_size_159).
0.94::true_val(contact_length_size_159, v114); 0.06::true_val(contact_length_size_159, unk_contact_length_size_159).
measured(s1, contact_length_size_159, v114).
all_consistent(contact_length_size_159) :- consistent(s1, contact_length_size_159).
evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v114)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_1=8.1 unk_sidecut_radius_size_159=Unknown
% @importance 1.0
0.94::acc(s1, sidecut_radius_size_159).
0.94::true_val(sidecut_radius_size_159, v8_1); 0.06::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).
measured(s1, sidecut_radius_size_159, v8_1).
all_consistent(sidecut_radius_size_159) :- consistent(s1, sidecut_radius_size_159).
evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_1)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 159cm
% @values v25_7=25.7 unk_waist_width_159=Unknown
% @importance 1.0
0.94::acc(s1, waist_width_159).
0.94::true_val(waist_width_159, v25_7); 0.06::true_val(waist_width_159, unk_waist_width_159).
measured(s1, waist_width_159, v25_7).
all_consistent(waist_width_159) :- consistent(s1, waist_width_159).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_7)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size
% @values r130_plus_lbs=130_plus_lbs unk_recommended_weight_range_size_159=Unknown
% @importance 1.0
0.94::acc(s1, recommended_weight_range_size_159).
0.94::true_val(recommended_weight_range_size_159, r130_plus_lbs); 0.06::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).
measured(s1, recommended_weight_range_size_159, r130_plus_lbs).
all_consistent(recommended_weight_range_size_159) :- consistent(s1, recommended_weight_range_size_159).
evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, r130_plus_lbs)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr contact_length_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size
% @values v116=116.0 unk_contact_length_size_162=Unknown
% @importance 1.0
0.94::acc(s1, contact_length_size_162).
0.94::true_val(contact_length_size_162, v116); 0.06::true_val(contact_length_size_162, unk_contact_length_size_162).
measured(s1, contact_length_size_162, v116).
all_consistent(contact_length_size_162) :- consistent(s1, contact_length_size_162).
evidence(all_consistent(contact_length_size_162)).
query(true_val(contact_length_size_162, v116)).
query(true_val(contact_length_size_162, unk_contact_length_size_162)).

% @attr waist_width_162
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 162cm
% @values v25_8=25.8 unk_waist_width_162=Unknown
% @importance 1.0
0.94::acc(s1, waist_width_162).
0.94::true_val(waist_width_162, v25_8); 0.06::true_val(waist_width_162, unk_waist_width_162).
measured(s1, waist_width_162, v25_8).
all_consistent(waist_width_162) :- consistent(s1, waist_width_162).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v25_8)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size
% @values r150_plus_lbs=150_plus_lbs unk_recommended_weight_range_size_162=Unknown
% @importance 1.0
0.94::acc(s1, recommended_weight_range_size_162).
0.94::true_val(recommended_weight_range_size_162, r150_plus_lbs); 0.06::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).
measured(s1, recommended_weight_range_size_162, r150_plus_lbs).
all_consistent(recommended_weight_range_size_162) :- consistent(s1, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, r150_plus_lbs)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr waist_width_156w
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 156W
% @values v26_5=26.5 unk_waist_width_156w=Unknown
% @importance 1.0
0.94::acc(s1, waist_width_156w).
0.94::true_val(waist_width_156w, v26_5); 0.06::true_val(waist_width_156w, unk_waist_width_156w).
measured(s1, waist_width_156w, v26_5).
all_consistent(waist_width_156w) :- consistent(s1, waist_width_156w).
evidence(all_consistent(waist_width_156w)).
query(true_val(waist_width_156w, v26_5)).
query(true_val(waist_width_156w, unk_waist_width_156w)).

% @attr waist_width_159w
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 159W
% @values v26_7=26.7 unk_waist_width_159w=Unknown
% @importance 1.0
0.94::acc(s1, waist_width_159w).
0.94::true_val(waist_width_159w, v26_7); 0.06::true_val(waist_width_159w, unk_waist_width_159w).
measured(s1, waist_width_159w, v26_7).
all_consistent(waist_width_159w) :- consistent(s1, waist_width_159w).
evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_7)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

% @attr waist_width_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name waist width 162W
% @values v26_8=26.8 unk_waist_width_162w=Unknown
% @importance 1.0
0.94::acc(s1, waist_width_162w).
0.94::true_val(waist_width_162w, v26_8); 0.06::true_val(waist_width_162w, unk_waist_width_162w).
measured(s1, waist_width_162w, v26_8).
all_consistent(waist_width_162w) :- consistent(s1, waist_width_162w).
evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v26_8)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

% @attr waist_width_165
% @type numeric
% @unit cm
% @canonical false
% @original_name waist_width_165
% @values v26_8w=26.8 unk_waist_width_165=Unknown
% @importance 1.0
0.94::acc(s1, waist_width_165).
0.94::true_val(waist_width_165, v26_8w); 0.06::true_val(waist_width_165, unk_waist_width_165).
measured(s1, waist_width_165, v26_8w).
all_consistent(waist_width_165) :- consistent(s1, waist_width_165).
evidence(all_consistent(waist_width_165)).
query(true_val(waist_width_165, v26_8w)).
query(true_val(waist_width_165, unk_waist_width_165)).

% @attr contact_length_size_165
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size
% @values v118=118.0 unk_contact_length_size_165=Unknown
% @importance 1.0
0.94::acc(s1, contact_length_size_165).
0.94::true_val(contact_length_size_165, v118); 0.06::true_val(contact_length_size_165, unk_contact_length_size_165).
measured(s1, contact_length_size_165, v118).
all_consistent(contact_length_size_165) :- consistent(s1, contact_length_size_165).
evidence(all_consistent(contact_length_size_165)).
query(true_val(contact_length_size_165, v118)).
query(true_val(contact_length_size_165, unk_contact_length_size_165)).

% @attr sidecut_radius_165
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_165
% @values v8_3=8.3 unk_sidecut_radius_165=Unknown
% @importance 1.0
0.94::acc(s1, sidecut_radius_165).
0.94::true_val(sidecut_radius_165, v8_3); 0.06::true_val(sidecut_radius_165, unk_sidecut_radius_165).
measured(s1, sidecut_radius_165, v8_3).
all_consistent(sidecut_radius_165) :- consistent(s1, sidecut_radius_165).
evidence(all_consistent(sidecut_radius_165)).
query(true_val(sidecut_radius_165, v8_3)).
query(true_val(sidecut_radius_165, unk_sidecut_radius_165)).

% @attr setback
% @type numeric
% @unit mm
% @canonical false
% @original_name setback
% @values v25=25.0 unk_setback=Unknown
% @importance 1.0
0.94::acc(s1, setback).
0.94::true_val(setback, v25); 0.06::true_val(setback, unk_setback).
measured(s1, setback, v25).
all_consistent(setback) :- consistent(s1, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v25)).
query(true_val(setback, unk_setback)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2880=2880.0 unk_board_weight_grams=Unknown
% @importance 0.95
0.92::acc(s16, board_weight_grams).
0.92::true_val(board_weight_grams, v2880); 0.08::true_val(board_weight_grams, unk_board_weight_grams).
measured(s16, board_weight_grams, v2880).
all_consistent(board_weight_grams) :- consistent(s16, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2880)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical false
% @original_name weight_per_cm
% @values v18_46=18.46 unk_weight_per_cm=Unknown
% @importance 0.95
0.90::acc(s16, weight_per_cm).
0.90::true_val(weight_per_cm, v18_46); 0.10::true_val(weight_per_cm, unk_weight_per_cm).
measured(s16, weight_per_cm, v18_46).
all_consistent(weight_per_cm) :- consistent(s16, weight_per_cm).
evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v18_46)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr reviewer_opinion_the_good_ride_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values normal_weight=Normal_not_heavy_or_light unk_reviewer_opinion_the_good_ride_weight=Unknown
% @importance 0.95
0.85::acc(s10, reviewer_opinion_the_good_ride_weight).
0.85::true_val(reviewer_opinion_the_good_ride_weight, normal_weight); 0.15::true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight).
measured(s10, reviewer_opinion_the_good_ride_weight, normal_weight).
all_consistent(reviewer_opinion_the_good_ride_weight) :- consistent(s10, reviewer_opinion_the_good_ride_weight).
evidence(all_consistent(reviewer_opinion_the_good_ride_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, normal_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight)).

% @attr recommended_boot_size_150
% @type categorical
% @unit US
% @canonical false
% @original_name recommended boot size 150cm
% @values us6_7=US_6_7 unk_recommended_boot_size_150=Unknown
% @importance 0.95
0.86::acc(s10, recommended_boot_size_150).
0.86::true_val(recommended_boot_size_150, us6_7); 0.14::true_val(recommended_boot_size_150, unk_recommended_boot_size_150).
measured(s10, recommended_boot_size_150, us6_7).
all_consistent(recommended_boot_size_150) :- consistent(s10, recommended_boot_size_150).
evidence(all_consistent(recommended_boot_size_150)).
query(true_val(recommended_boot_size_150, us6_7)).
query(true_val(recommended_boot_size_150, unk_recommended_boot_size_150)).

% @attr recommended_boot_size_153
% @type categorical
% @unit US
% @canonical false
% @original_name recommended boot size 153cm
% @values us8_9=US_8_9 unk_recommended_boot_size_153=Unknown
% @importance 0.95
0.86::acc(s10, recommended_boot_size_153).
0.86::true_val(recommended_boot_size_153, us8_9); 0.14::true_val(recommended_boot_size_153, unk_recommended_boot_size_153).
measured(s10, recommended_boot_size_153, us8_9).
all_consistent(recommended_boot_size_153) :- consistent(s10, recommended_boot_size_153).
evidence(all_consistent(recommended_boot_size_153)).
query(true_val(recommended_boot_size_153, us8_9)).
query(true_val(recommended_boot_size_153, unk_recommended_boot_size_153)).

% @attr recommended_boot_size_156
% @type categorical
% @unit US
% @canonical false
% @original_name recommended boot size 156cm
% @values us8_5_9_5=US_8_5_9_5 unk_recommended_boot_size_156=Unknown
% @importance 0.95
0.86::acc(s10, recommended_boot_size_156).
0.86::true_val(recommended_boot_size_156, us8_5_9_5); 0.14::true_val(recommended_boot_size_156, unk_recommended_boot_size_156).
measured(s10, recommended_boot_size_156, us8_5_9_5).
all_consistent(recommended_boot_size_156) :- consistent(s10, recommended_boot_size_156).
evidence(all_consistent(recommended_boot_size_156)).
query(true_val(recommended_boot_size_156, us8_5_9_5)).
query(true_val(recommended_boot_size_156, unk_recommended_boot_size_156)).

% @attr recommended_boot_size_159
% @type categorical
% @unit US
% @canonical false
% @original_name recommended boot size 159cm
% @values us10_11=US_10_11 unk_recommended_boot_size_159=Unknown
% @importance 0.95
0.86::acc(s10, recommended_boot_size_159).
0.86::true_val(recommended_boot_size_159, us10_11); 0.14::true_val(recommended_boot_size_159, unk_recommended_boot_size_159).
measured(s10, recommended_boot_size_159, us10_11).
all_consistent(recommended_boot_size_159) :- consistent(s10, recommended_boot_size_159).
evidence(all_consistent(recommended_boot_size_159)).
query(true_val(recommended_boot_size_159, us10_11)).
query(true_val(recommended_boot_size_159, unk_recommended_boot_size_159)).

% @attr recommended_boot_size_162
% @type categorical
% @unit US
% @canonical false
% @original_name recommended boot size 162cm
% @values us10_5_11_5=US_10_5_11_5 unk_recommended_boot_size_162=Unknown
% @importance 0.95
0.86::acc(s10, recommended_boot_size_162).
0.86::true_val(recommended_boot_size_162, us10_5_11_5); 0.14::true_val(recommended_boot_size_162, unk_recommended_boot_size_162).
measured(s10, recommended_boot_size_162, us10_5_11_5).
all_consistent(recommended_boot_size_162) :- consistent(s10, recommended_boot_size_162).
evidence(all_consistent(recommended_boot_size_162)).
query(true_val(recommended_boot_size_162, us10_5_11_5)).
query(true_val(recommended_boot_size_162, unk_recommended_boot_size_162)).

% @attr recommended_boot_size_156w
% @type categorical
% @unit US
% @canonical false
% @original_name recommended boot size 156W
% @values us10_5_11_5w=US_10_5_11_5 unk_recommended_boot_size_156w=Unknown
% @importance 0.95
0.86::acc(s10, recommended_boot_size_156w).
0.86::true_val(recommended_boot_size_156w, us10_5_11_5w); 0.14::true_val(recommended_boot_size_156w, unk_recommended_boot_size_156w).
measured(s10, recommended_boot_size_156w, us10_5_11_5w).
all_consistent(recommended_boot_size_156w) :- consistent(s10, recommended_boot_size_156w).
evidence(all_consistent(recommended_boot_size_156w)).
query(true_val(recommended_boot_size_156w, us10_5_11_5w)).
query(true_val(recommended_boot_size_156w, unk_recommended_boot_size_156w)).

% @attr recommended_boot_size_162w
% @type categorical
% @unit US
% @canonical false
% @original_name recommended boot size 162W
% @values us11_12=US_11_12 unk_recommended_boot_size_162w=Unknown
% @importance 0.95
0.86::acc(s10, recommended_boot_size_162w).
0.86::true_val(recommended_boot_size_162w, us11_12); 0.14::true_val(recommended_boot_size_162w, unk_recommended_boot_size_162w).
measured(s10, recommended_boot_size_162w, us11_12).
all_consistent(recommended_boot_size_162w) :- consistent(s10, recommended_boot_size_162w).
evidence(all_consistent(recommended_boot_size_162w)).
query(true_val(recommended_boot_size_162w, us11_12)).
query(true_val(recommended_boot_size_162w, unk_recommended_boot_size_162w)).

% @attr recommended_boot_size_165
% @type categorical
% @unit US
% @canonical false
% @original_name recommended_boot_size_165
% @values us11_5_12_5=US_11_5_12_5 unk_recommended_boot_size_165=Unknown
% @importance 0.95
0.86::acc(s10, recommended_boot_size_165).
0.86::true_val(recommended_boot_size_165, us11_5_12_5); 0.14::true_val(recommended_boot_size_165, unk_recommended_boot_size_165).
measured(s10, recommended_boot_size_165, us11_5_12_5).
all_consistent(recommended_boot_size_165) :- consistent(s10, recommended_boot_size_165).
evidence(all_consistent(recommended_boot_size_165)).
query(true_val(recommended_boot_size_165, us11_5_12_5)).
query(true_val(recommended_boot_size_165, unk_recommended_boot_size_165)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v579_99=579.99 unk_price_usd_msrp=Unknown
% @importance 1.0
0.94::acc(s1, price_usd_msrp).
0.94::true_val(price_usd_msrp, v579_99); 0.06::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s1, price_usd_msrp, v579_99).
all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v579_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_libtech_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name price at Lib Tech direct (sale)
% @values v405_99=405.99 unk_price_libtech_sale=Unknown
% @importance 1.0
0.92::acc(s1, price_libtech_sale).
0.92::true_val(price_libtech_sale, v405_99); 0.08::true_val(price_libtech_sale, unk_price_libtech_sale).
measured(s1, price_libtech_sale, v405_99).
all_consistent(price_libtech_sale) :- consistent(s1, price_libtech_sale).
evidence(all_consistent(price_libtech_sale)).
query(true_val(price_libtech_sale, v405_99)).
query(true_val(price_libtech_sale, unk_price_libtech_sale)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v405_99e=405.99 unk_price_usd_evo=Unknown
% @importance 0.90
0.88::acc(s4, price_usd_evo).
0.88::true_val(price_usd_evo, v405_99e); 0.12::true_val(price_usd_evo, unk_price_usd_evo).
measured(s4, price_usd_evo, v405_99e).
all_consistent(price_usd_evo) :- consistent(s4, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v405_99e)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v405_99t=405.99 unk_price_usd_tactics=Unknown
% @importance 0.90
0.82::acc(s24, price_usd_tactics).
0.82::true_val(price_usd_tactics, v405_99t); 0.18::true_val(price_usd_tactics, unk_price_usd_tactics).
measured(s24, price_usd_tactics, v405_99t).
all_consistent(price_usd_tactics) :- consistent(s24, price_usd_tactics).
evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v405_99t)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_the_house
% @type numeric
% @unit USD
% @canonical false
% @original_name price at The House (sale)
% @values v405_99h=405.99 unk_price_the_house=Unknown
% @importance 0.95
0.84::acc(s10, price_the_house).
0.84::true_val(price_the_house, v405_99h); 0.16::true_val(price_the_house, unk_price_the_house).
measured(s10, price_the_house, v405_99h).
all_consistent(price_the_house) :- consistent(s10, price_the_house).
evidence(all_consistent(price_the_house)).
query(true_val(price_the_house, v405_99h)).
query(true_val(price_the_house, unk_price_the_house)).

% @attr price_sun_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name price at Sun & Ski Sports
% @values v463_93=463.93 unk_price_sun_ski=Unknown
% @importance 0.95
0.82::acc(s10, price_sun_ski).
0.82::true_val(price_sun_ski, v463_93); 0.18::true_val(price_sun_ski, unk_price_sun_ski).
measured(s10, price_sun_ski, v463_93).
all_consistent(price_sun_ski) :- consistent(s10, price_sun_ski).
evidence(all_consistent(price_sun_ski)).
query(true_val(price_sun_ski, v463_93)).
query(true_val(price_sun_ski, unk_price_sun_ski)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v463_99=463.99 unk_price_usd_backcountry=Unknown
% @importance 0.95
0.82::acc(s10, price_usd_backcountry).
0.82::true_val(price_usd_backcountry, v463_99); 0.18::true_val(price_usd_backcountry, unk_price_usd_backcountry).
measured(s10, price_usd_backcountry, v463_99).
all_consistent(price_usd_backcountry) :- consistent(s10, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v463_99)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_milo
% @type numeric
% @unit USD
% @canonical false
% @original_name price at Milo Snow and Skate
% @values v439_99=439.99 unk_price_milo=Unknown
% @importance 0.85
0.72::acc(s25, price_milo).
0.72::true_val(price_milo, v439_99); 0.28::true_val(price_milo, unk_price_milo).
measured(s25, price_milo, v439_99).
all_consistent(price_milo) :- consistent(s25, price_milo).
evidence(all_consistent(price_milo)).
query(true_val(price_milo, v439_99)).
query(true_val(price_milo, unk_price_milo)).

% @attr price_ebay
% @type numeric
% @unit USD
% @canonical false
% @original_name price at eBay (new)
% @values v459_00=459.00 unk_price_ebay=Unknown
% @importance 0.80
0.65::acc(s26, price_ebay).
0.65::true_val(price_ebay, v459_00); 0.35::true_val(price_ebay, unk_price_ebay).
measured(s26, price_ebay, v459_00).
all_consistent(price_ebay) :- consistent(s26, price_ebay).
evidence(all_consistent(price_ebay)).
query(true_val(price_ebay, v459_00)).
query(true_val(price_ebay, unk_price_ebay)).

% @attr price_spokex
% @type numeric
% @unit USD
% @canonical false
% @original_name price at SpokeX
% @values v579_99s=579.99 unk_price_spokex=Unknown
% @importance 0.70
0.62::acc(s27, price_spokex).
0.62::true_val(price_spokex, v579_99s); 0.38::true_val(price_spokex, unk_price_spokex).
measured(s27, price_spokex, v579_99s).
all_consistent(price_spokex) :- (indep(s27), consistent(s27, price_spokex) ; \+indep(s27)).
evidence(all_consistent(price_spokex)).
query(true_val(price_spokex, v579_99s)).
query(true_val(price_spokex, unk_price_spokex)).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v510_99=510.99 unk_price_cad_prfo=Unknown
% @importance 0.95
0.82::acc(s10, price_cad_prfo).
0.82::true_val(price_cad_prfo, v510_99); 0.18::true_val(price_cad_prfo, unk_price_cad_prfo).
measured(s10, price_cad_prfo, v510_99).
all_consistent(price_cad_prfo) :- consistent(s10, price_cad_prfo).
evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v510_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_stoked_eur
% @type numeric
% @unit EUR
% @canonical false
% @original_name price at Stoked Board Shop (EUR)
% @values v353_95=353.95 unk_price_stoked_eur=Unknown
% @importance 0.95
0.82::acc(s10, price_stoked_eur).
0.82::true_val(price_stoked_eur, v353_95); 0.18::true_val(price_stoked_eur, unk_price_stoked_eur).
measured(s10, price_stoked_eur, v353_95).
all_consistent(price_stoked_eur) :- consistent(s10, price_stoked_eur).
evidence(all_consistent(price_stoked_eur)).
query(true_val(price_stoked_eur, v353_95)).
query(true_val(price_stoked_eur, unk_price_stoked_eur)).

% @attr price_snowcountry_eur
% @type numeric
% @unit EUR
% @canonical false
% @original_name price at SnowCountry (EUR)
% @values v471_96=471.96 unk_price_snowcountry_eur=Unknown
% @importance 0.95
0.82::acc(s10, price_snowcountry_eur).
0.82::true_val(price_snowcountry_eur, v471_96); 0.18::true_val(price_snowcountry_eur, unk_price_snowcountry_eur).
measured(s10, price_snowcountry_eur, v471_96).
all_consistent(price_snowcountry_eur) :- consistent(s10, price_snowcountry_eur).
evidence(all_consistent(price_snowcountry_eur)).
query(true_val(price_snowcountry_eur, v471_96)).
query(true_val(price_snowcountry_eur, unk_price_snowcountry_eur)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v969_99=969.99 unk_price_aud_merchant=Unknown
% @importance 0.85
0.90::acc(s_merchant, price_aud_merchant).
0.90::true_val(price_aud_merchant, v969_99); 0.10::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s_merchant, price_aud_merchant, v969_99).
all_consistent(price_aud_merchant) :- (indep(s_merchant), consistent(s_merchant, price_aud_merchant) ; \+indep(s_merchant)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v969_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_mcu
% @type numeric
% @unit USD
% @canonical false
% @original_name price at McU Sports
% @values v487_47=487.47 unk_price_mcu=Unknown
% @importance 0.70
0.68::acc(s28, price_mcu).
0.68::true_val(price_mcu, v487_47); 0.32::true_val(price_mcu, unk_price_mcu).
measured(s28, price_mcu, v487_47).
all_consistent(price_mcu) :- consistent(s28, price_mcu).
evidence(all_consistent(price_mcu)).
query(true_val(price_mcu, v487_47)).
query(true_val(price_mcu, unk_price_mcu)).

% @attr blem_available_evo
% @type categorical
% @canonical false
% @original_name Blem version available at evo
% @values yes_cosmetic_only=Yes_cosmetic_issues_only unk_blem_available_evo=Unknown
% @importance 0.60
0.82::acc(s29, blem_available_evo).
0.82::true_val(blem_available_evo, yes_cosmetic_only); 0.18::true_val(blem_available_evo, unk_blem_available_evo).
measured(s29, blem_available_evo, yes_cosmetic_only).
all_consistent(blem_available_evo) :- consistent(s29, blem_available_evo).
evidence(all_consistent(blem_available_evo)).
query(true_val(blem_available_evo, yes_cosmetic_only)).
query(true_val(blem_available_evo, unk_blem_available_evo)).

% @attr b_grade_libtech_price
% @type numeric
% @unit USD
% @canonical false
% @original_name B-Grade version at Lib Tech direct (2025 model)
% @values v521_99=521.99 unk_b_grade_libtech_price=Unknown
% @importance 0.55
0.88::acc(s30, b_grade_libtech_price).
0.88::true_val(b_grade_libtech_price, v521_99); 0.12::true_val(b_grade_libtech_price, unk_b_grade_libtech_price).
measured(s30, b_grade_libtech_price, v521_99).
all_consistent(b_grade_libtech_price) :- consistent(s30, b_grade_libtech_price).
evidence(all_consistent(b_grade_libtech_price)).
query(true_val(b_grade_libtech_price, v521_99)).
query(true_val(b_grade_libtech_price, unk_b_grade_libtech_price)).

% @attr warranty
% @type categorical
% @canonical false
% @original_name warranty
% @values one_year_structural=1_year_structural_defects_only unk_warranty=Unknown
% @importance 0.85
0.78::acc(s8, warranty).
0.78::true_val(warranty, one_year_structural); 0.22::true_val(warranty, unk_warranty).
measured(s8, warranty, one_year_structural).
all_consistent(warranty) :- (indep(s8), consistent(s8, warranty) ; \+indep(s8)).
evidence(all_consistent(warranty)).
query(true_val(warranty, one_year_structural)).
query(true_val(warranty, unk_warranty)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced advanced_expert=Advanced_to_Expert
% @importance 0.82
0.78::acc(s4, rider_level).
0.62::acc(s17, rider_level).
0.87::acc(s10, rider_level).
0.55::true_val(rider_level, intermediate_advanced); 0.45::true_val(rider_level, advanced_expert).
measured(s4, rider_level, intermediate_advanced).
measured(s17, rider_level, intermediate_advanced).
measured(s10, rider_level, advanced_expert).
all_consistent(rider_level) :- consistent(s10, rider_level), (indep(s4), consistent(s4, rider_level) ; \+indep(s4)), (indep(s17), consistent(s17, rider_level) ; \+indep(s17)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, advanced_expert)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values am_freeride=All_Mountain_Freeride freestyle_am_freeride=Freestyle_All_Mountain_Freeride hardsnow_groomers=Hard_snow_groomers
% @importance 0.88
0.93::acc(s1, terrain_suitability).
0.62::acc(s17, terrain_suitability).
0.86::acc(s10, terrain_suitability).
0.50::true_val(terrain_suitability, am_freeride); 0.30::true_val(terrain_suitability, freestyle_am_freeride); 0.20::true_val(terrain_suitability, hardsnow_groomers).
measured(s1, terrain_suitability, am_freeride).
measured(s17, terrain_suitability, freestyle_am_freeride).
measured(s10, terrain_suitability, hardsnow_groomers).
all_consistent(terrain_suitability) :- consistent(s1, terrain_suitability), consistent(s10, terrain_suitability), (indep(s17), consistent(s17, terrain_suitability) ; \+indep(s17)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, am_freeride)).
query(true_val(terrain_suitability, freestyle_am_freeride)).
query(true_val(terrain_suitability, hardsnow_groomers)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values freeride_am_cruising=Freeride_All_Mountain_Cruising unk_riding_style=Unknown
% @importance 0.85
0.85::acc(s_merchant, riding_style).
0.85::true_val(riding_style, freeride_am_cruising); 0.15::true_val(riding_style, unk_riding_style).
measured(s_merchant, riding_style, freeride_am_cruising).
all_consistent(riding_style) :- (indep(s_merchant), consistent(s_merchant, riding_style) ; \+indep(s_merchant)).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, freeride_am_cruising)).
query(true_val(riding_style, unk_riding_style)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values excellent_pop_grip_fun=Excellent_Pop_Near_Excellent_Grip_Very_Fun unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95
0.85::acc(s10, reviewer_opinion_the_good_ride).
0.85::true_val(reviewer_opinion_the_good_ride, excellent_pop_grip_fun); 0.15::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s10, reviewer_opinion_the_good_ride, excellent_pop_grip_fun).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s10, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, excellent_pop_grip_fun)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_great_powder=Not_as_good_as_peers_in_powder unk_negative_aspect=Unknown
% @importance 0.95
0.85::acc(s10, negative_aspect).
0.85::true_val(negative_aspect, not_great_powder); 0.15::true_val(negative_aspect, unk_negative_aspect).
measured(s10, negative_aspect, not_great_powder).
all_consistent(negative_aspect) :- consistent(s10, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_great_powder)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_base
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values base_loses_wax=Base_loses_wax_quickly_can_feel_slow unk_negative_aspect_base=Unknown
% @importance 0.95
0.85::acc(s10, negative_aspect_base).
0.85::true_val(negative_aspect_base, base_loses_wax); 0.15::true_val(negative_aspect_base, unk_negative_aspect_base).
measured(s10, negative_aspect_base, base_loses_wax).
all_consistent(negative_aspect_base) :- consistent(s10, negative_aspect_base).
evidence(all_consistent(negative_aspect_base)).
query(true_val(negative_aspect_base, base_loses_wax)).
query(true_val(negative_aspect_base, unk_negative_aspect_base)).

% @attr reviewer_opinion_the_good_ride_groomers
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values shines_groomers_hardsnow=Shines_on_groomers_great_for_hard_snow unk_reviewer_opinion_the_good_ride_groomers=Unknown
% @importance 0.95
0.85::acc(s10, reviewer_opinion_the_good_ride_groomers).
0.85::true_val(reviewer_opinion_the_good_ride_groomers, shines_groomers_hardsnow); 0.15::true_val(reviewer_opinion_the_good_ride_groomers, unk_reviewer_opinion_the_good_ride_groomers).
measured(s10, reviewer_opinion_the_good_ride_groomers, shines_groomers_hardsnow).
all_consistent(reviewer_opinion_the_good_ride_groomers) :- consistent(s10, reviewer_opinion_the_good_ride_groomers).
evidence(all_consistent(reviewer_opinion_the_good_ride_groomers)).
query(true_val(reviewer_opinion_the_good_ride_groomers, shines_groomers_hardsnow)).
query(true_val(reviewer_opinion_the_good_ride_groomers, unk_reviewer_opinion_the_good_ride_groomers)).

% @attr reviewer_opinion_the_good_ride_powder
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values decent_powder_better_options=Did_well_but_many_better_options unk_reviewer_opinion_the_good_ride_powder=Unknown
% @importance 0.95
0.85::acc(s10, reviewer_opinion_the_good_ride_powder).
0.85::true_val(reviewer_opinion_the_good_ride_powder, decent_powder_better_options); 0.15::true_val(reviewer_opinion_the_good_ride_powder, unk_reviewer_opinion_the_good_ride_powder).
measured(s10, reviewer_opinion_the_good_ride_powder, decent_powder_better_options).
all_consistent(reviewer_opinion_the_good_ride_powder) :- consistent(s10, reviewer_opinion_the_good_ride_powder).
evidence(all_consistent(reviewer_opinion_the_good_ride_powder)).
query(true_val(reviewer_opinion_the_good_ride_powder, decent_powder_better_options)).
query(true_val(reviewer_opinion_the_good_ride_powder, unk_reviewer_opinion_the_good_ride_powder)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values fun_switch_directional_turn=Fun_to_throw_switch_favors_directional unk_switch_riding=Unknown
% @importance 0.95
0.85::acc(s10, switch_riding).
0.85::true_val(switch_riding, fun_switch_directional_turn); 0.15::true_val(switch_riding, unk_switch_riding).
measured(s10, switch_riding, fun_switch_directional_turn).
all_consistent(switch_riding) :- consistent(s10, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, fun_switch_directional_turn)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr reviewer_opinion_the_good_ride_speed
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values good_straight_line=Can_point_straight_line_well unk_reviewer_opinion_the_good_ride_speed=Unknown
% @importance 0.95
0.85::acc(s10, reviewer_opinion_the_good_ride_speed).
0.85::true_val(reviewer_opinion_the_good_ride_speed, good_straight_line); 0.15::true_val(reviewer_opinion_the_good_ride_speed, unk_reviewer_opinion_the_good_ride_speed).
measured(s10, reviewer_opinion_the_good_ride_speed, good_straight_line).
all_consistent(reviewer_opinion_the_good_ride_speed) :- consistent(s10, reviewer_opinion_the_good_ride_speed).
evidence(all_consistent(reviewer_opinion_the_good_ride_speed)).
query(true_val(reviewer_opinion_the_good_ride_speed, good_straight_line)).
query(true_val(reviewer_opinion_the_good_ride_speed, unk_reviewer_opinion_the_good_ride_speed)).

% @attr reviewer_opinion_the_good_ride_jib
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values not_great_jib_great_jump_pipe=Not_great_jibber_great_jump_pipe unk_reviewer_opinion_the_good_ride_jib=Unknown
% @importance 0.95
0.85::acc(s10, reviewer_opinion_the_good_ride_jib).
0.85::true_val(reviewer_opinion_the_good_ride_jib, not_great_jib_great_jump_pipe); 0.15::true_val(reviewer_opinion_the_good_ride_jib, unk_reviewer_opinion_the_good_ride_jib).
measured(s10, reviewer_opinion_the_good_ride_jib, not_great_jib_great_jump_pipe).
all_consistent(reviewer_opinion_the_good_ride_jib) :- consistent(s10, reviewer_opinion_the_good_ride_jib).
evidence(all_consistent(reviewer_opinion_the_good_ride_jib)).
query(true_val(reviewer_opinion_the_good_ride_jib, not_great_jib_great_jump_pipe)).
query(true_val(reviewer_opinion_the_good_ride_jib, unk_reviewer_opinion_the_good_ride_jib)).

% @attr reviewer_opinion_the_good_ride_reliability
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values more_reliable_than_ultralight=More_reliable_than_ultralight_better_all_conditions unk_reviewer_opinion_the_good_ride_reliability=Unknown
% @importance 0.95
0.85::acc(s10, reviewer_opinion_the_good_ride_reliability).
0.85::true_val(reviewer_opinion_the_good_ride_reliability, more_reliable_than_ultralight); 0.15::true_val(reviewer_opinion_the_good_ride_reliability, unk_reviewer_opinion_the_good_ride_reliability).
measured(s10, reviewer_opinion_the_good_ride_reliability, more_reliable_than_ultralight).
all_consistent(reviewer_opinion_the_good_ride_reliability) :- consistent(s10, reviewer_opinion_the_good_ride_reliability).
evidence(all_consistent(reviewer_opinion_the_good_ride_reliability)).
query(true_val(reviewer_opinion_the_good_ride_reliability, more_reliable_than_ultralight)).
query(true_val(reviewer_opinion_the_good_ride_reliability, unk_reviewer_opinion_the_good_ride_reliability)).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values loses_wax_not_fast=Loses_wax_quickly_not_fast_vs_peers unk_base_glide_performance=Unknown
% @importance 0.95
0.86::acc(s10, base_glide_performance).
0.86::true_val(base_glide_performance, loses_wax_not_fast); 0.14::true_val(base_glide_performance, unk_base_glide_performance).
measured(s10, base_glide_performance, loses_wax_not_fast).
all_consistent(base_glide_performance) :- consistent(s10, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, loses_wax_not_fast)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values multi_board_list=Yes_Pick_Your_Line_Burton_FA_Gnu_Mullair_Jones_Flagship_etc unk_comparable_board_cross_brand=Unknown
% @importance 0.95
0.86::acc(s10, comparable_board_cross_brand).
0.86::true_val(comparable_board_cross_brand, multi_board_list); 0.14::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s10, comparable_board_cross_brand, multi_board_list).
all_consistent(comparable_board_cross_brand) :- consistent(s10, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, multi_board_list)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v82_2=82.2 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.95
0.88::acc(s16, overall_rating_snowboardingprofiles).
0.88::true_val(overall_rating_snowboardingprofiles, v82_2); 0.12::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).
measured(s16, overall_rating_snowboardingprofiles, v82_2).
all_consistent(overall_rating_snowboardingprofiles) :- consistent(s16, overall_rating_snowboardingprofiles).
evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v82_2)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr category_ranking
% @type categorical
% @canonical false
% @original_name category ranking
% @values r25_of_28=25th_out_of_28_mellow_freeride unk_category_ranking=Unknown
% @importance 0.95
0.88::acc(s16, category_ranking).
0.88::true_val(category_ranking, r25_of_28); 0.12::true_val(category_ranking, unk_category_ranking).
measured(s16, category_ranking, r25_of_28).
all_consistent(category_ranking) :- consistent(s16, category_ranking).
evidence(all_consistent(category_ranking)).
query(true_val(category_ranking, r25_of_28)).
query(true_val(category_ranking, unk_category_ranking)).

% @attr category_average_score
% @type numeric
% @unit /100
% @canonical false
% @original_name category average score
% @values v85_7=85.7 unk_category_average_score=Unknown
% @importance 0.95
0.88::acc(s16, category_average_score).
0.88::true_val(category_average_score, v85_7); 0.12::true_val(category_average_score, unk_category_average_score).
measured(s16, category_average_score, v85_7).
all_consistent(category_average_score) :- consistent(s16, category_average_score).
evidence(all_consistent(category_average_score)).
query(true_val(category_average_score, v85_7)).
query(true_val(category_average_score, unk_category_average_score)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name carving_score_snowboardingprofiles
% @values v3_5=3.5 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.95
0.88::acc(s16, carving_score_snowboardingprofiles).
0.88::true_val(carving_score_snowboardingprofiles, v3_5); 0.12::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).
measured(s16, carving_score_snowboardingprofiles, v3_5).
all_consistent(carving_score_snowboardingprofiles) :- consistent(s16, carving_score_snowboardingprofiles).
evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v3_5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values v3_5_of_5=3_5_out_of_5_some_effort fast_easy_eurocarves=Fast_easy_eurocarves
% @importance 0.85
0.86::acc(s16, turn_initiation_performance).
0.62::acc(s31, turn_initiation_performance).
0.55::true_val(turn_initiation_performance, v3_5_of_5); 0.45::true_val(turn_initiation_performance, fast_easy_eurocarves).
measured(s16, turn_initiation_performance, v3_5_of_5).
measured(s31, turn_initiation_performance, fast_easy_eurocarves).
all_consistent(turn_initiation_performance) :- consistent(s16, turn_initiation_performance), consistent(s31, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, v3_5_of_5)).
query(true_val(turn_initiation_performance, fast_easy_eurocarves)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name powder_score_snowboardingprofiles
% @values v4=4.0 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.95
0.86::acc(s16, powder_score_snowboardingprofiles).
0.86::true_val(powder_score_snowboardingprofiles, v4); 0.14::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).
measured(s16, powder_score_snowboardingprofiles, v4).
all_consistent(powder_score_snowboardingprofiles) :- consistent(s16, powder_score_snowboardingprofiles).
evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v4)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr trees_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name trees rating
% @values v4t=4.0 unk_trees_rating=Unknown
% @importance 0.95
0.86::acc(s16, trees_rating).
0.86::true_val(trees_rating, v4t); 0.14::true_val(trees_rating, unk_trees_rating).
measured(s16, trees_rating, v4t).
all_consistent(trees_rating) :- consistent(s16, trees_rating).
evidence(all_consistent(trees_rating)).
query(true_val(trees_rating, v4t)).
query(true_val(trees_rating, unk_trees_rating)).

% @attr crud_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name crud rating
% @values v3_5c=3.5 unk_crud_rating=Unknown
% @importance 0.95
0.86::acc(s16, crud_rating).
0.86::true_val(crud_rating, v3_5c); 0.14::true_val(crud_rating, unk_crud_rating).
measured(s16, crud_rating, v3_5c).
all_consistent(crud_rating) :- consistent(s16, crud_rating).
evidence(all_consistent(crud_rating)).
query(true_val(crud_rating, v3_5c)).
query(true_val(crud_rating, unk_crud_rating)).

% @attr speed_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name speed rating
% @values v3_5s=3.5 unk_speed_rating=Unknown
% @importance 0.95
0.86::acc(s16, speed_rating).
0.86::true_val(speed_rating, v3_5s); 0.14::true_val(speed_rating, unk_speed_rating).
measured(s16, speed_rating, v3_5s).
all_consistent(speed_rating) :- consistent(s16, speed_rating).
evidence(all_consistent(speed_rating)).
query(true_val(speed_rating, v3_5s)).
query(true_val(speed_rating, unk_speed_rating)).

% @attr jumps_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name jumps rating
% @values v3_5j=3.5 unk_jumps_rating=Unknown
% @importance 0.95
0.86::acc(s16, jumps_rating).
0.86::true_val(jumps_rating, v3_5j); 0.14::true_val(jumps_rating, unk_jumps_rating).
measured(s16, jumps_rating, v3_5j).
all_consistent(jumps_rating) :- consistent(s16, jumps_rating).
evidence(all_consistent(jumps_rating)).
query(true_val(jumps_rating, v3_5j)).
query(true_val(jumps_rating, unk_jumps_rating)).

% @attr switch_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name switch rating
% @values v3sw=3.0 unk_switch_rating=Unknown
% @importance 0.95
0.86::acc(s16, switch_rating).
0.86::true_val(switch_rating, v3sw); 0.14::true_val(switch_rating, unk_switch_rating).
measured(s16, switch_rating, v3sw).
all_consistent(switch_rating) :- consistent(s16, switch_rating).
evidence(all_consistent(switch_rating)).
query(true_val(switch_rating, v3sw)).
query(true_val(switch_rating, unk_switch_rating)).

% @attr dampness_feel
% @type numeric
% @unit /10
% @canonical false
% @original_name dampness feel
% @values v6d=6.0 unk_dampness_feel=Unknown
% @importance 0.95
0.86::acc(s16, dampness_feel).
0.86::true_val(dampness_feel, v6d); 0.14::true_val(dampness_feel, unk_dampness_feel).
measured(s16, dampness_feel, v6d).
all_consistent(dampness_feel) :- consistent(s16, dampness_feel).
evidence(all_consistent(dampness_feel)).
query(true_val(dampness_feel, v6d)).
query(true_val(dampness_feel, unk_dampness_feel)).

% @attr reviewer_opinion_snowboardingprofiles_catch
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values noticeable_catch_threat=Some_noticeable_catch_threat unk_reviewer_opinion_snowboardingprofiles_catch=Unknown
% @importance 0.95
0.82::acc(s16, reviewer_opinion_snowboardingprofiles_catch).
0.82::true_val(reviewer_opinion_snowboardingprofiles_catch, noticeable_catch_threat); 0.18::true_val(reviewer_opinion_snowboardingprofiles_catch, unk_reviewer_opinion_snowboardingprofiles_catch).
measured(s16, reviewer_opinion_snowboardingprofiles_catch, noticeable_catch_threat).
all_consistent(reviewer_opinion_snowboardingprofiles_catch) :- consistent(s16, reviewer_opinion_snowboardingprofiles_catch).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_catch)).
query(true_val(reviewer_opinion_snowboardingprofiles_catch, noticeable_catch_threat)).
query(true_val(reviewer_opinion_snowboardingprofiles_catch, unk_reviewer_opinion_snowboardingprofiles_catch)).

% @attr reviewer_opinion_snowboardingprofiles_overall
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values nothing_bad_nothing_great=Nothing_particularly_bad_or_good unk_reviewer_opinion_snowboardingprofiles_overall=Unknown
% @importance 0.95
0.82::acc(s16, reviewer_opinion_snowboardingprofiles_overall).
0.82::true_val(reviewer_opinion_snowboardingprofiles_overall, nothing_bad_nothing_great); 0.18::true_val(reviewer_opinion_snowboardingprofiles_overall, unk_reviewer_opinion_snowboardingprofiles_overall).
measured(s16, reviewer_opinion_snowboardingprofiles_overall, nothing_bad_nothing_great).
all_consistent(reviewer_opinion_snowboardingprofiles_overall) :- consistent(s16, reviewer_opinion_snowboardingprofiles_overall).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles_overall)).
query(true_val(reviewer_opinion_snowboardingprofiles_overall, nothing_bad_nothing_great)).
query(true_val(reviewer_opinion_snowboardingprofiles_overall, unk_reviewer_opinion_snowboardingprofiles_overall)).

% @attr comparable_board_same_brand_jamie_lynn
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values jamie_lynn_better_speed_carving=Jamie_Lynn_significantly_better_speed_carving unk_comparable_board_same_brand_jamie_lynn=Unknown
% @importance 0.95
0.84::acc(s16, comparable_board_same_brand_jamie_lynn).
0.84::true_val(comparable_board_same_brand_jamie_lynn, jamie_lynn_better_speed_carving); 0.16::true_val(comparable_board_same_brand_jamie_lynn, unk_comparable_board_same_brand_jamie_lynn).
measured(s16, comparable_board_same_brand_jamie_lynn, jamie_lynn_better_speed_carving).
all_consistent(comparable_board_same_brand_jamie_lynn) :- consistent(s16, comparable_board_same_brand_jamie_lynn).
evidence(all_consistent(comparable_board_same_brand_jamie_lynn)).
query(true_val(comparable_board_same_brand_jamie_lynn, jamie_lynn_better_speed_carving)).
query(true_val(comparable_board_same_brand_jamie_lynn, unk_comparable_board_same_brand_jamie_lynn)).

% @attr speed_stability
% @type categorical
% @canonical false
% @original_name speed stability
% @values damp_stable_high_speed=Damp_and_stable_at_high_speeds unk_speed_stability=Unknown
% @importance 0.75
0.60::acc(s31, speed_stability).
0.60::true_val(speed_stability, damp_stable_high_speed); 0.40::true_val(speed_stability, unk_speed_stability).
measured(s31, speed_stability, damp_stable_high_speed).
all_consistent(speed_stability) :- consistent(s31, speed_stability).
evidence(all_consistent(speed_stability)).
query(true_val(speed_stability, damp_stable_high_speed)).
query(true_val(speed_stability, unk_speed_stability)).

% @attr positive_aspect
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values nose_lifts_floaty_playful=Nose_lifts_floaty_and_playful unk_positive_aspect=Unknown
% @importance 0.75
0.58::acc(s31, positive_aspect).
0.58::true_val(positive_aspect, nose_lifts_floaty_playful); 0.42::true_val(positive_aspect, unk_positive_aspect).
measured(s31, positive_aspect, nose_lifts_floaty_playful).
all_consistent(positive_aspect) :- consistent(s31, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, nose_lifts_floaty_playful)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr overall_sentiment
% @type categorical
% @canonical false
% @original_name overall sentiment
% @values energetic_powerful_fun=Energetic_powerful_delivers_fun unk_overall_sentiment=Unknown
% @importance 0.75
0.58::acc(s31, overall_sentiment).
0.58::true_val(overall_sentiment, energetic_powerful_fun); 0.42::true_val(overall_sentiment, unk_overall_sentiment).
measured(s31, overall_sentiment, energetic_powerful_fun).
all_consistent(overall_sentiment) :- consistent(s31, overall_sentiment).
evidence(all_consistent(overall_sentiment)).
query(true_val(overall_sentiment, energetic_powerful_fun)).
query(true_val(overall_sentiment, unk_overall_sentiment)).

% @attr weight_feel
% @type categorical
% @canonical false
% @original_name weight feel
% @values surprisingly_light=Surprisingly_light_feel unk_weight_feel=Unknown
% @importance 0.75
0.72::acc(s9, weight_feel).
0.72::true_val(weight_feel, surprisingly_light); 0.28::true_val(weight_feel, unk_weight_feel).
measured(s9, weight_feel, surprisingly_light).
all_consistent(weight_feel) :- consistent(s9, weight_feel).
evidence(all_consistent(weight_feel)).
query(true_val(weight_feel, surprisingly_light)).
query(true_val(weight_feel, unk_weight_feel)).

% @attr control_feel
% @type categorical
% @canonical false
% @original_name control feel
% @values precise_control_heaps_of_pop=Precise_control_heaps_of_power_for_pop unk_control_feel=Unknown
% @importance 0.75
0.72::acc(s9, control_feel).
0.72::true_val(control_feel, precise_control_heaps_of_pop); 0.28::true_val(control_feel, unk_control_feel).
measured(s9, control_feel, precise_control_heaps_of_pop).
all_consistent(control_feel) :- consistent(s9, control_feel).
evidence(all_consistent(control_feel)).
query(true_val(control_feel, precise_control_heaps_of_pop)).
query(true_val(control_feel, unk_control_feel)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values confidence_giving_grip_icy=Confidence_giving_grip_on_icy unk_edge_hold=Unknown
% @importance 0.75
0.72::acc(s9, edge_hold).
0.72::true_val(edge_hold, confidence_giving_grip_icy); 0.28::true_val(edge_hold, unk_edge_hold).
measured(s9, edge_hold, confidence_giving_grip_icy).
all_consistent(edge_hold) :- consistent(s9, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, confidence_giving_grip_icy)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr user_review_forum_east_coast
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values love_east_coast_grip=Love_it_east_coast_camber_grip_not_too_stiff unk_user_review_forum_east_coast=Unknown
% @importance 0.75
0.50::acc(s32, user_review_forum_east_coast).
0.50::true_val(user_review_forum_east_coast, love_east_coast_grip); 0.50::true_val(user_review_forum_east_coast, unk_user_review_forum_east_coast).
measured(s32, user_review_forum_east_coast, love_east_coast_grip).
all_consistent(user_review_forum_east_coast) :- consistent(s32, user_review_forum_east_coast).
evidence(all_consistent(user_review_forum_east_coast)).
query(true_val(user_review_forum_east_coast, love_east_coast_grip)).
query(true_val(user_review_forum_east_coast, unk_user_review_forum_east_coast)).

% @attr user_review_forum_mag_east
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values mag_great_east_coast=Mag_great_on_east_coast unk_user_review_forum_mag_east=Unknown
% @importance 0.75
0.50::acc(s32, user_review_forum_mag_east).
0.50::true_val(user_review_forum_mag_east, mag_great_east_coast); 0.50::true_val(user_review_forum_mag_east, unk_user_review_forum_mag_east).
measured(s32, user_review_forum_mag_east, mag_great_east_coast).
all_consistent(user_review_forum_mag_east) :- consistent(s32, user_review_forum_mag_east).
evidence(all_consistent(user_review_forum_mag_east)).
query(true_val(user_review_forum_mag_east, mag_great_east_coast)).
query(true_val(user_review_forum_mag_east, unk_user_review_forum_mag_east)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values fantastic_quiver=Fantastic_one_board_directional_quiver_option unk_user_review_forum=Unknown
% @importance 0.75
0.50::acc(s32, user_review_forum).
0.50::true_val(user_review_forum, fantastic_quiver); 0.50::true_val(user_review_forum, unk_user_review_forum).
measured(s32, user_review_forum, fantastic_quiver).
all_consistent(user_review_forum) :- consistent(s32, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, fantastic_quiver)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_breakin
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values stiff_new_breaks_in_30_days=Stiff_new_breaks_in_after_30_days unk_user_review_forum_breakin=Unknown
% @importance 0.80
0.48::acc(s33, user_review_forum_breakin).
0.48::true_val(user_review_forum_breakin, stiff_new_breaks_in_30_days); 0.52::true_val(user_review_forum_breakin, unk_user_review_forum_breakin).
measured(s33, user_review_forum_breakin, stiff_new_breaks_in_30_days).
all_consistent(user_review_forum_breakin) :- consistent(s33, user_review_forum_breakin).
evidence(all_consistent(user_review_forum_breakin)).
query(true_val(user_review_forum_breakin, stiff_new_breaks_in_30_days)).
query(true_val(user_review_forum_breakin, unk_user_review_forum_breakin)).

% @attr user_review_forum_stiff_ootb
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values too_stiff_out_of_box=Initially_too_stiff_softens_after_break_in unk_user_review_forum_stiff_ootb=Unknown
% @importance 0.80
0.48::acc(s33, user_review_forum_stiff_ootb).
0.48::true_val(user_review_forum_stiff_ootb, too_stiff_out_of_box); 0.52::true_val(user_review_forum_stiff_ootb, unk_user_review_forum_stiff_ootb).
measured(s33, user_review_forum_stiff_ootb, too_stiff_out_of_box).
all_consistent(user_review_forum_stiff_ootb) :- consistent(s33, user_review_forum_stiff_ootb).
evidence(all_consistent(user_review_forum_stiff_ootb)).
query(true_val(user_review_forum_stiff_ootb, too_stiff_out_of_box)).
query(true_val(user_review_forum_stiff_ootb, unk_user_review_forum_stiff_ootb)).

% @attr user_review_forum_after_breakin
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values epic_pop_rips_groomers=Epic_pop_rips_groomers_love_stability unk_user_review_forum_after_breakin=Unknown
% @importance 0.80
0.48::acc(s33, user_review_forum_after_breakin).
0.48::true_val(user_review_forum_after_breakin, epic_pop_rips_groomers); 0.52::true_val(user_review_forum_after_breakin, unk_user_review_forum_after_breakin).
measured(s33, user_review_forum_after_breakin, epic_pop_rips_groomers).
all_consistent(user_review_forum_after_breakin) :- consistent(s33, user_review_forum_after_breakin).
evidence(all_consistent(user_review_forum_after_breakin)).
query(true_val(user_review_forum_after_breakin, epic_pop_rips_groomers)).
query(true_val(user_review_forum_after_breakin, unk_user_review_forum_after_breakin)).

% @attr manufacturer_site_rating
% @type categorical
% @canonical false
% @original_name manufacturer site rating
% @values pct98_56reviews=98pct_of_100_56_reviews unk_manufacturer_site_rating=Unknown
% @importance 1.0
0.90::acc(s1, manufacturer_site_rating).
0.90::true_val(manufacturer_site_rating, pct98_56reviews); 0.10::true_val(manufacturer_site_rating, unk_manufacturer_site_rating).
measured(s1, manufacturer_site_rating, pct98_56reviews).
all_consistent(manufacturer_site_rating) :- consistent(s1, manufacturer_site_rating).
evidence(all_consistent(manufacturer_site_rating)).
query(true_val(manufacturer_site_rating, pct98_56reviews)).
query(true_val(manufacturer_site_rating, unk_manufacturer_site_rating)).

% @attr merchant_customer_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name merchant customer rating
% @values v5_0=5.0 unk_merchant_customer_rating=Unknown
% @importance 0.85
0.85::acc(s_merchant, merchant_customer_rating).
0.85::true_val(merchant_customer_rating, v5_0); 0.15::true_val(merchant_customer_rating, unk_merchant_customer_rating).
measured(s_merchant, merchant_customer_rating, v5_0).
all_consistent(merchant_customer_rating) :- (indep(s_merchant), consistent(s_merchant, merchant_customer_rating) ; \+indep(s_merchant)).
evidence(all_consistent(merchant_customer_rating)).
query(true_val(merchant_customer_rating, v5_0)).
query(true_val(merchant_customer_rating, unk_merchant_customer_rating)).

% @attr mag_exclusive
% @type categorical
% @canonical false
% @original_name technology is Mervin exclusive
% @values lib_tech_gnu_roxy_only=Only_Lib_Tech_Gnu_Roxy unk_mag_exclusive=Unknown
% @importance 0.75
0.72::acc(s34, mag_exclusive).
0.72::true_val(mag_exclusive, lib_tech_gnu_roxy_only); 0.28::true_val(mag_exclusive, unk_mag_exclusive).
measured(s34, mag_exclusive, lib_tech_gnu_roxy_only).
all_consistent(mag_exclusive) :- (indep(s34), consistent(s34, mag_exclusive) ; \+indep(s34)).
evidence(all_consistent(mag_exclusive)).
query(true_val(mag_exclusive, lib_tech_gnu_roxy_only)).
query(true_val(mag_exclusive, unk_mag_exclusive)).

% @attr edge_technology_mellow_mag
% @type categorical
% @canonical false
% @original_name edge_technology
% @values mellow_mag=Mellow_mag_good_grip_not_full_mag unk_edge_technology_mellow_mag=Unknown
% @importance 0.95
0.85::acc(s10, edge_technology_mellow_mag).
0.85::true_val(edge_technology_mellow_mag, mellow_mag); 0.15::true_val(edge_technology_mellow_mag, unk_edge_technology_mellow_mag).
measured(s10, edge_technology_mellow_mag, mellow_mag).
all_consistent(edge_technology_mellow_mag) :- consistent(s10, edge_technology_mellow_mag).
evidence(all_consistent(edge_technology_mellow_mag)).
query(true_val(edge_technology_mellow_mag, mellow_mag)).
query(true_val(edge_technology_mellow_mag, unk_edge_technology_mellow_mag)).

% @attr user_review_forum_too_grippy
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values too_grabby_grippy=Too_grippy_for_some_riders unk_user_review_forum_too_grippy=Unknown
% @importance 0.75
0.50::acc(s35, user_review_forum_too_grippy).
0.50::true_val(user_review_forum_too_grippy, too_grabby_grippy); 0.50::true_val(user_review_forum_too_grippy, unk_user_review_forum_too_grippy).
measured(s35, user_review_forum_too_grippy, too_grabby_grippy).
all_consistent(user_review_forum_too_grippy) :- consistent(s35, user_review_forum_too_grippy).
evidence(all_consistent(user_review_forum_too_grippy)).
query(true_val(user_review_forum_too_grippy, too_grabby_grippy)).
query(true_val(user_review_forum_too_grippy, unk_user_review_forum_too_grippy)).

% @attr user_review_forum_mag_innovation
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values greatest_tech_innovation=Magnetraction_greatest_tech_innovation unk_user_review_forum_mag_innovation=Unknown
% @importance 0.75
0.50::acc(s35, user_review_forum_mag_innovation).
0.50::true_val(user_review_forum_mag_innovation, greatest_tech_innovation); 0.50::true_val(user_review_forum_mag_innovation, unk_user_review_forum_mag_innovation).
measured(s35, user_review_forum_mag_innovation, greatest_tech_innovation).
all_consistent(user_review_forum_mag_innovation) :- consistent(s35, user_review_forum_mag_innovation).
evidence(all_consistent(user_review_forum_mag_innovation)).
query(true_val(user_review_forum_mag_innovation, greatest_tech_innovation)).
query(true_val(user_review_forum_mag_innovation, unk_user_review_forum_mag_innovation)).

% @attr comparable_board_cross_brand_antigravity
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values gnu_antigravity_similar_cheaper=Gnu_Antigravity_same_on_paper_cheaper unk_comparable_board_cross_brand_antigravity=Unknown
% @importance 0.75
0.50::acc(s32, comparable_board_cross_brand_antigravity).
0.50::true_val(comparable_board_cross_brand_antigravity, gnu_antigravity_similar_cheaper); 0.50::true_val(comparable_board_cross_brand_antigravity, unk_comparable_board_cross_brand_antigravity).
measured(s32, comparable_board_cross_brand_antigravity, gnu_antigravity_similar_cheaper).
all_consistent(comparable_board_cross_brand_antigravity) :- consistent(s32, comparable_board_cross_brand_antigravity).
evidence(all_consistent(comparable_board_cross_brand_antigravity)).
query(true_val(comparable_board_cross_brand_antigravity, gnu_antigravity_similar_cheaper)).
query(true_val(comparable_board_cross_brand_antigravity, unk_comparable_board_cross_brand_antigravity)).

% @attr comparable_board_cross_brand_frontier
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values ns_frontier_more_forgiving=Never_Summer_Frontier_more_forgiving unk_comparable_board_cross_brand_frontier=Unknown
% @importance 0.60
0.50::acc(s36, comparable_board_cross_brand_frontier).
0.50::true_val(comparable_board_cross_brand_frontier, ns_frontier_more_forgiving); 0.50::true_val(comparable_board_cross_brand_frontier, unk_comparable_board_cross_brand_frontier).
measured(s36, comparable_board_cross_brand_frontier, ns_frontier_more_forgiving).
all_consistent(comparable_board_cross_brand_frontier) :- consistent(s36, comparable_board_cross_brand_frontier).
evidence(all_consistent(comparable_board_cross_brand_frontier)).
query(true_val(comparable_board_cross_brand_frontier, ns_frontier_more_forgiving)).
query(true_val(comparable_board_cross_brand_frontier, unk_comparable_board_cross_brand_frontier)).

% @attr comparable_board_cross_brand_tgr_listed
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values tgr_listed_comparable=Listed_comparable_by_TheGoodRide unk_comparable_board_cross_brand_tgr_listed=Unknown
% @importance 0.95
0.84::acc(s10, comparable_board_cross_brand_tgr_listed).
0.84::true_val(comparable_board_cross_brand_tgr_listed, tgr_listed_comparable); 0.16::true_val(comparable_board_cross_brand_tgr_listed, unk_comparable_board_cross_brand_tgr_listed).
measured(s10, comparable_board_cross_brand_tgr_listed, tgr_listed_comparable).
all_consistent(comparable_board_cross_brand_tgr_listed) :- consistent(s10, comparable_board_cross_brand_tgr_listed).
evidence(all_consistent(comparable_board_cross_brand_tgr_listed)).
query(true_val(comparable_board_cross_brand_tgr_listed, tgr_listed_comparable)).
query(true_val(comparable_board_cross_brand_tgr_listed, unk_comparable_board_cross_brand_tgr_listed)).

% @attr comparable_board_cross_brand_flagship
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_flagship_stiffer_freeride=Jones_Flagship_stiffer_more_freeride unk_comparable_board_cross_brand_flagship=Unknown
% @importance 0.95
0.84::acc(s10, comparable_board_cross_brand_flagship).
0.84::true_val(comparable_board_cross_brand_flagship, jones_flagship_stiffer_freeride); 0.16::true_val(comparable_board_cross_brand_flagship, unk_comparable_board_cross_brand_flagship).
measured(s10, comparable_board_cross_brand_flagship, jones_flagship_stiffer_freeride).
all_consistent(comparable_board_cross_brand_flagship) :- consistent(s10, comparable_board_cross_brand_flagship).
evidence(all_consistent(comparable_board_cross_brand_flagship)).
query(true_val(comparable_board_cross_brand_flagship, jones_flagship_stiffer_freeride)).
query(true_val(comparable_board_cross_brand_flagship, unk_comparable_board_cross_brand_flagship)).

% @attr comparable_board_same_brand_lib_rig
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values lib_rig_hybrid_camber=Lib_Rig_hybrid_camber_sister_model unk_comparable_board_same_brand_lib_rig=Unknown
% @importance 0.60
0.78::acc(s37, comparable_board_same_brand_lib_rig).
0.78::true_val(comparable_board_same_brand_lib_rig, lib_rig_hybrid_camber); 0.22::true_val(comparable_board_same_brand_lib_rig, unk_comparable_board_same_brand_lib_rig).
measured(s37, comparable_board_same_brand_lib_rig, lib_rig_hybrid_camber).
all_consistent(comparable_board_same_brand_lib_rig) :- consistent(s37, comparable_board_same_brand_lib_rig).
evidence(all_consistent(comparable_board_same_brand_lib_rig)).
query(true_val(comparable_board_same_brand_lib_rig, lib_rig_hybrid_camber)).
query(true_val(comparable_board_same_brand_lib_rig, unk_comparable_board_same_brand_lib_rig)).

% @attr comparable_board_cross_brand_wide
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values wide_options_k2_jones_ride=K2_Instrument_Jones_Hovercraft_Ride_Shadowban_etc unk_comparable_board_cross_brand_wide=Unknown
% @importance 0.55
0.45::acc(s38, comparable_board_cross_brand_wide).
0.45::true_val(comparable_board_cross_brand_wide, wide_options_k2_jones_ride); 0.55::true_val(comparable_board_cross_brand_wide, unk_comparable_board_cross_brand_wide).
measured(s38, comparable_board_cross_brand_wide, wide_options_k2_jones_ride).
all_consistent(comparable_board_cross_brand_wide) :- consistent(s38, comparable_board_cross_brand_wide).
evidence(all_consistent(comparable_board_cross_brand_wide)).
query(true_val(comparable_board_cross_brand_wide, wide_options_k2_jones_ride)).
query(true_val(comparable_board_cross_brand_wide, unk_comparable_board_cross_brand_wide)).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name brand reputation
% @values weird_functional_edges_grip=Weird_but_functional_edges_grip_insanely_well unk_brand_reputation=Unknown
% @importance 0.65
0.52::acc(s39, brand_reputation).
0.52::true_val(brand_reputation, weird_functional_edges_grip); 0.48::true_val(brand_reputation, unk_brand_reputation).
measured(s39, brand_reputation, weird_functional_edges_grip).
all_consistent(brand_reputation) :- consistent(s39, brand_reputation).
evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, weird_functional_edges_grip)).
query(true_val(brand_reputation, unk_brand_reputation)).

% @attr brand_reputation_general
% @type categorical
% @canonical false
% @original_name brand reputation (general)
% @values proven_name_gear_lasts=Proven_name_gear_that_lasts unk_brand_reputation_general=Unknown
% @importance 0.65
0.52::acc(s39, brand_reputation_general).
0.52::true_val(brand_reputation_general, proven_name_gear_lasts); 0.48::true_val(brand_reputation_general, unk_brand_reputation_general).
measured(s39, brand_reputation_general, proven_name_gear_lasts).
all_consistent(brand_reputation_general) :- consistent(s39, brand_reputation_general).
evidence(all_consistent(brand_reputation_general)).
query(true_val(brand_reputation_general, proven_name_gear_lasts)).
query(true_val(brand_reputation_general, unk_brand_reputation_general)).

% @attr manufacturing_uniqueness
% @type categorical
% @canonical false
% @original_name manufacturing uniqueness
% @values longest_running_last_major_usa=Longest_running_last_major_board_factory_USA unk_manufacturing_uniqueness=Unknown
% @importance 0.70
0.88::acc(s6, manufacturing_uniqueness).
0.88::true_val(manufacturing_uniqueness, longest_running_last_major_usa); 0.12::true_val(manufacturing_uniqueness, unk_manufacturing_uniqueness).
measured(s6, manufacturing_uniqueness, longest_running_last_major_usa).
all_consistent(manufacturing_uniqueness) :- consistent(s6, manufacturing_uniqueness).
evidence(all_consistent(manufacturing_uniqueness)).
query(true_val(manufacturing_uniqueness, longest_running_last_major_usa)).
query(true_val(manufacturing_uniqueness, unk_manufacturing_uniqueness)).

% @attr parent_company_ownership
% @type categorical
% @canonical false
% @original_name parent company ownership
% @values altamont_capital_2013=Altamont_Capital_Partners_from_2013 unk_parent_company_ownership=Unknown
% @importance 0.35
0.88::acc(s40, parent_company_ownership).
0.88::true_val(parent_company_ownership, altamont_capital_2013); 0.12::true_val(parent_company_ownership, unk_parent_company_ownership).
measured(s40, parent_company_ownership, altamont_capital_2013).
all_consistent(parent_company_ownership) :- consistent(s40, parent_company_ownership).
evidence(all_consistent(parent_company_ownership)).
query(true_val(parent_company_ownership, altamont_capital_2013)).
query(true_val(parent_company_ownership, unk_parent_company_ownership)).

% @attr mervin_employee_count
% @type numeric
% @unit employees
% @canonical false
% @original_name Mervin employee count
% @values v84=84 unk_mervin_employee_count=Unknown
% @importance 0.25
0.48::acc(s41, mervin_employee_count).
0.48::true_val(mervin_employee_count, v84); 0.52::true_val(mervin_employee_count, unk_mervin_employee_count).
measured(s41, mervin_employee_count, v84).
all_consistent(mervin_employee_count) :- consistent(s41, mervin_employee_count).
evidence(all_consistent(mervin_employee_count)).
query(true_val(mervin_employee_count, v84)).
query(true_val(mervin_employee_count, unk_mervin_employee_count)).

% @attr mervin_annual_revenue
% @type numeric
% @unit USD_millions
% @canonical false
% @original_name Mervin annual revenue
% @values v54_3m=54.3 unk_mervin_annual_revenue=Unknown
% @importance 0.25
0.48::acc(s41, mervin_annual_revenue).
0.48::true_val(mervin_annual_revenue, v54_3m); 0.52::true_val(mervin_annual_revenue, unk_mervin_annual_revenue).
measured(s41, mervin_annual_revenue, v54_3m).
all_consistent(mervin_annual_revenue) :- consistent(s41, mervin_annual_revenue).
evidence(all_consistent(mervin_annual_revenue)).
query(true_val(mervin_annual_revenue, v54_3m)).
query(true_val(mervin_annual_revenue, unk_mervin_annual_revenue)).

% @attr retailer_policy_evo
% @type categorical
% @canonical false
% @original_name evo.com
% @values price_guarantee_returns_rewards=Lowest_Price_Guarantee_1yr_returns_10pct_rewards unk_retailer_policy_evo=Unknown
% @importance 0.90
0.82::acc(s4, retailer_policy_evo).
0.82::true_val(retailer_policy_evo, price_guarantee_returns_rewards); 0.18::true_val(retailer_policy_evo, unk_retailer_policy_evo).
measured(s4, retailer_policy_evo, price_guarantee_returns_rewards).
all_consistent(retailer_policy_evo) :- (indep(s4), consistent(s4, retailer_policy_evo) ; \+indep(s4)).
evidence(all_consistent(retailer_policy_evo)).
query(true_val(retailer_policy_evo, price_guarantee_returns_rewards)).
query(true_val(retailer_policy_evo, unk_retailer_policy_evo)).

% @attr retailer_policy_tactics
% @type categorical
% @canonical false
% @original_name Tactics.com
% @values low_price_free_ship_rewards_bundle=Low_price_guarantee_free_shipping_rewards_bundle unk_retailer_policy_tactics=Unknown
% @importance 0.70
0.78::acc(s8, retailer_policy_tactics).
0.78::true_val(retailer_policy_tactics, low_price_free_ship_rewards_bundle); 0.22::true_val(retailer_policy_tactics, unk_retailer_policy_tactics).
measured(s8, retailer_policy_tactics, low_price_free_ship_rewards_bundle).
all_consistent(retailer_policy_tactics) :- (indep(s8), consistent(s8, retailer_policy_tactics) ; \+indep(s8)).
evidence(all_consistent(retailer_policy_tactics)).
query(true_val(retailer_policy_tactics, low_price_free_ship_rewards_bundle)).
query(true_val(retailer_policy_tactics, unk_retailer_policy_tactics)).

% @attr retailer_policy_salty_peaks
% @type categorical
% @canonical false
% @original_name Salty Peaks
% @values ten_day_price_match=10_Day_Price_Match_Guarantee unk_retailer_policy_salty_peaks=Unknown
% @importance 0.45
0.70::acc(s42, retailer_policy_salty_peaks).
0.70::true_val(retailer_policy_salty_peaks, ten_day_price_match); 0.30::true_val(retailer_policy_salty_peaks, unk_retailer_policy_salty_peaks).
measured(s42, retailer_policy_salty_peaks, ten_day_price_match).
all_consistent(retailer_policy_salty_peaks) :- consistent(s42, retailer_policy_salty_peaks).
evidence(all_consistent(retailer_policy_salty_peaks)).
query(true_val(retailer_policy_salty_peaks, ten_day_price_match)).
query(true_val(retailer_policy_salty_peaks, unk_retailer_policy_salty_peaks)).

% @attr retailer_policy_bluezone
% @type categorical
% @canonical false
% @original_name BlueZone Sports
% @values free_ship_50_return_24_99=Free_shipping_over_50_24_99_return_fee unk_retailer_policy_bluezone=Unknown
% @importance 0.40
0.65::acc(s43, retailer_policy_bluezone).
0.65::true_val(retailer_policy_bluezone, free_ship_50_return_24_99); 0.35::true_val(retailer_policy_bluezone, unk_retailer_policy_bluezone).
measured(s43, retailer_policy_bluezone, free_ship_50_return_24_99).
all_consistent(retailer_policy_bluezone) :- (indep(s43), consistent(s43, retailer_policy_bluezone) ; \+indep(s43)).
evidence(all_consistent(retailer_policy_bluezone)).
query(true_val(retailer_policy_bluezone, free_ship_50_return_24_99)).
query(true_val(retailer_policy_bluezone, unk_retailer_policy_bluezone)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values freeride_directional_not_too_stiff=Best_for_freeride_directional_not_too_stiff unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.95
0.82::acc(s16, reviewer_opinion_snowboardingprofiles).
0.82::true_val(reviewer_opinion_snowboardingprofiles, freeride_directional_not_too_stiff); 0.18::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
measured(s16, reviewer_opinion_snowboardingprofiles, freeride_directional_not_too_stiff).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s16, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, freeride_directional_not_too_stiff)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr negative_aspect_beginner
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_for_beginner=Not_for_beginner_catch_feel_turn_effort unk_negative_aspect_beginner=Unknown
% @importance 0.95
0.82::acc(s16, negative_aspect_beginner).
0.82::true_val(negative_aspect_beginner, not_for_beginner); 0.18::true_val(negative_aspect_beginner, unk_negative_aspect_beginner).
measured(s16, negative_aspect_beginner, not_for_beginner).
all_consistent(negative_aspect_beginner) :- consistent(s16, negative_aspect_beginner).
evidence(all_consistent(negative_aspect_beginner)).
query(true_val(negative_aspect_beginner, not_for_beginner)).
query(true_val(negative_aspect_beginner, unk_negative_aspect_beginner)).

% @attr negative_aspect_deep_powder
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values deep_powder_vs_dedicated=Deep_powder_compared_to_dedicated_freeride unk_negative_aspect_deep_powder=Unknown
% @importance 0.95
0.85::acc(s10, negative_aspect_deep_powder).
0.85::true_val(negative_aspect_deep_powder, deep_powder_vs_dedicated); 0.15::true_val(negative_aspect_deep_powder, unk_negative_aspect_deep_powder).
measured(s10, negative_aspect_deep_powder, deep_powder_vs_dedicated).
all_consistent(negative_aspect_deep_powder) :- consistent(s10, negative_aspect_deep_powder).
evidence(all_consistent(negative_aspect_deep_powder)).
query(true_val(negative_aspect_deep_powder, deep_powder_vs_dedicated)).
query(true_val(negative_aspect_deep_powder, unk_negative_aspect_deep_powder)).

% @attr skill_level_recommendation
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values advanced_expert_not_intermediate=For_advanced_expert_not_ideal_intermediate unk_skill_level_recommendation=Unknown
% @importance 0.95
0.86::acc(s10, skill_level_recommendation).
0.86::true_val(skill_level_recommendation, advanced_expert_not_intermediate); 0.14::true_val(skill_level_recommendation, unk_skill_level_recommendation).
measured(s10, skill_level_recommendation, advanced_expert_not_intermediate).
all_consistent(skill_level_recommendation) :- consistent(s10, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert_not_intermediate)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).