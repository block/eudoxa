0.20::indep(s14).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values gnu=GNU unk_brand=Unknown
% @importance 1.0

0.93::acc(s1, brand).

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
% @values turbo_gremlin=Turbo_Gremlin unk_model_name=Unknown
% @importance 1.0

0.93::acc(s1, model_name).

0.95::true_val(model_name, turbo_gremlin); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, turbo_gremlin).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, turbo_gremlin)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026_2027=2026-2027_designated_2027 unk_model_year=Unknown
% @importance 1.0

0.93::acc(s1, model_year).

0.95::true_val(model_year, y2026_2027); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2026_2027).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026_2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.93::acc(s1, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.9

0.92::acc(s2, manufacturer).

0.90::true_val(manufacturer, mervin_manufacturing); 0.10::true_val(manufacturer, unk_manufacturer).

measured(s2, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :- consistent(s2, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y1977_olson_saari=1977_Mike_Olson_Pete_Saari unk_manufacturer_founded=Unknown
% @importance 0.4

0.90::acc(s3, manufacturer_founded).

0.90::true_val(manufacturer_founded, y1977_olson_saari); 0.10::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s3, manufacturer_founded, y1977_olson_saari).

all_consistent(manufacturer_founded) :- consistent(s3, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y1977_olson_saari)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values carlsborg_wa_usa=Carlsborg_Sequim_Washington_USA unk_manufacturing_location=Unknown
% @importance 0.5

0.92::acc(s4, manufacturing_location).

0.90::true_val(manufacturing_location, carlsborg_wa_usa); 0.10::true_val(manufacturing_location, unk_manufacturing_location).

measured(s4, manufacturing_location, carlsborg_wa_usa).

all_consistent(manufacturing_location) :- consistent(s4, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, carlsborg_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr manufacturing_claim
% @type categorical
% @canonical false
% @original_name Manufacturing claim
% @values handbuilt_usa_last_factory=Handbuilt_in_USA_last_major_factory unk_manufacturing_claim=Unknown
% @importance 0.6

0.78::acc(s5, manufacturing_claim).

0.77::true_val(manufacturing_claim, handbuilt_usa_last_factory); 0.23::true_val(manufacturing_claim, unk_manufacturing_claim).

measured(s5, manufacturing_claim, handbuilt_usa_last_factory).

all_consistent(manufacturing_claim) :- consistent(s5, manufacturing_claim).

evidence(all_consistent(manufacturing_claim)).
query(true_val(manufacturing_claim, handbuilt_usa_last_factory)).
query(true_val(manufacturing_claim, unk_manufacturing_claim)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_hazardous_waste=Zero_hazardous_waste_manufacturing unk_sustainability_certification=Unknown
% @importance 0.55

0.80::acc(s6, sustainability_certification).

0.77::true_val(sustainability_certification, zero_hazardous_waste); 0.23::true_val(sustainability_certification, unk_sustainability_certification).

measured(s6, sustainability_certification, zero_hazardous_waste).

all_consistent(sustainability_certification) :- consistent(s6, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_hazardous_waste)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_eco_materials
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values eco_materials=FSC_wood_bio_plastics_soy_sidewalls_low_VOC unk_sustainability_certification_eco_materials=Unknown
% @importance 0.5

0.78::acc(s7, sustainability_certification_eco_materials).

0.72::true_val(sustainability_certification_eco_materials, eco_materials); 0.28::true_val(sustainability_certification_eco_materials, unk_sustainability_certification_eco_materials).

measured(s7, sustainability_certification_eco_materials, eco_materials).

all_consistent(sustainability_certification_eco_materials) :- consistent(s7, sustainability_certification_eco_materials).

evidence(all_consistent(sustainability_certification_eco_materials)).
query(true_val(sustainability_certification_eco_materials, eco_materials)).
query(true_val(sustainability_certification_eco_materials, unk_sustainability_certification_eco_materials)).

% @attr sustainability_certification_hydro
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values hydro_89_6_pct=Factory_powered_89_6_pct_hydroelectricity unk_sustainability_certification_hydro=Unknown
% @importance 0.35

0.55::acc(s8, sustainability_certification_hydro).

0.51::true_val(sustainability_certification_hydro, hydro_89_6_pct); 0.49::true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro).

measured(s8, sustainability_certification_hydro, hydro_89_6_pct).

all_consistent(sustainability_certification_hydro) :- consistent(s8, sustainability_certification_hydro).

evidence(all_consistent(sustainability_certification_hydro)).
query(true_val(sustainability_certification_hydro, hydro_89_6_pct)).
query(true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro)).

% @attr parent_brands_under_mervin
% @type categorical
% @canonical false
% @original_name Parent brands under Mervin
% @values lib_gnu_roxy_bentmetal=Lib_Tech_GNU_Roxy_Bent_Metal unk_parent_brands_under_mervin=Unknown
% @importance 0.45

0.92::acc(s9, parent_brands_under_mervin).

0.90::true_val(parent_brands_under_mervin, lib_gnu_roxy_bentmetal); 0.10::true_val(parent_brands_under_mervin, unk_parent_brands_under_mervin).

measured(s9, parent_brands_under_mervin, lib_gnu_roxy_bentmetal).

all_consistent(parent_brands_under_mervin) :- consistent(s9, parent_brands_under_mervin).

evidence(all_consistent(parent_brands_under_mervin)).
query(true_val(parent_brands_under_mervin, lib_gnu_roxy_bentmetal)).
query(true_val(parent_brands_under_mervin, unk_parent_brands_under_mervin)).

% @attr mervin_ownership
% @type categorical
% @canonical false
% @original_name Mervin ownership
% @values quiksilver_1997_altamont_2013=Quiksilver_1997_Altamont_2013 unk_mervin_ownership=Unknown
% @importance 0.3

0.65::acc(s10, mervin_ownership).

0.63::true_val(mervin_ownership, quiksilver_1997_altamont_2013); 0.37::true_val(mervin_ownership, unk_mervin_ownership).

measured(s10, mervin_ownership, quiksilver_1997_altamont_2013).

all_consistent(mervin_ownership) :- consistent(s10, mervin_ownership).

evidence(all_consistent(mervin_ownership)).
query(true_val(mervin_ownership, quiksilver_1997_altamont_2013)).
query(true_val(mervin_ownership, unk_mervin_ownership)).

% @attr gnu_turbo_gremlin_rating
% @type categorical
% @canonical false
% @original_name GNU Turbo Gremlin rating on gnu.com
% @values rating_100pct_3rev=100pct_3_reviews unk_gnu_turbo_gremlin_rating=Unknown
% @importance 0.95

0.93::acc(s11, gnu_turbo_gremlin_rating).

0.90::true_val(gnu_turbo_gremlin_rating, rating_100pct_3rev); 0.10::true_val(gnu_turbo_gremlin_rating, unk_gnu_turbo_gremlin_rating).

measured(s11, gnu_turbo_gremlin_rating, rating_100pct_3rev).

all_consistent(gnu_turbo_gremlin_rating) :- consistent(s11, gnu_turbo_gremlin_rating).

evidence(all_consistent(gnu_turbo_gremlin_rating)).
query(true_val(gnu_turbo_gremlin_rating, rating_100pct_3rev)).
query(true_val(gnu_turbo_gremlin_rating, unk_gnu_turbo_gremlin_rating)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values gnu_gremlin_2021=GNU_Gremlin_first_released_2021 unk_predecessor_model_name=Unknown
% @importance 0.6

0.55::acc(s12, predecessor_model_name).

0.50::true_val(predecessor_model_name, gnu_gremlin_2021); 0.50::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s12, predecessor_model_name, gnu_gremlin_2021).

all_consistent(predecessor_model_name) :- consistent(s12, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, gnu_gremlin_2021)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr predecessor_rating
% @type categorical
% @canonical false
% @original_name Predecessor (OG Gremlin) rating on gnu.com
% @values rating_99pct_43rev=99pct_43_reviews unk_predecessor_rating=Unknown
% @importance 0.7

0.90::acc(s13, predecessor_rating).

0.86::true_val(predecessor_rating, rating_99pct_43rev); 0.14::true_val(predecessor_rating, unk_predecessor_rating).

measured(s13, predecessor_rating, rating_99pct_43rev).

all_consistent(predecessor_rating) :- consistent(s13, predecessor_rating).

evidence(all_consistent(predecessor_rating)).
query(true_val(predecessor_rating, rating_99pct_43rev)).
query(true_val(predecessor_rating, unk_predecessor_rating)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.9

0.80::acc(s14, board_category).

0.72::true_val(board_category, all_mountain_freeride); 0.28::true_val(board_category, unk_board_category).

measured(s14, board_category, all_mountain_freeride).

all_consistent(board_category) :- consistent(s14, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional_mvs=Tapered_Directional_Mild_Volume_Shift unk_shape=Unknown
% @importance 0.9

0.82::acc(s14, shape).

0.90::true_val(shape, tapered_directional_mvs); 0.10::true_val(shape, unk_shape).

measured(s14, shape, tapered_directional_mvs).

all_consistent(shape) :- consistent(s14, shape).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional_mvs)).
query(true_val(shape, unk_shape)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_expert=Advanced_to_Expert unk_rider_level=Unknown
% @importance 0.85

0.83::acc(s15, rider_level).

0.81::true_val(rider_level, advanced_expert); 0.19::true_val(rider_level, unk_rider_level).

measured(s15, rider_level, advanced_expert).

all_consistent(rider_level) :- consistent(s15, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values am_freeride_powder=All_Mountain_Freeride_Powder unk_riding_style=Unknown
% @importance 0.875

0.83::acc(s15, riding_style).
0.80::acc(s14, riding_style).

0.95::true_val(riding_style, am_freeride_powder); 0.05::true_val(riding_style, unk_riding_style).

measured(s15, riding_style, am_freeride_powder).
measured(s14, riding_style, am_freeride_powder).

all_consistent(riding_style) :-
    consistent(s15, riding_style),
    (indep(s14), consistent(s14, riding_style) ; \+indep(s14)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, am_freeride_powder)).
query(true_val(riding_style, unk_riding_style)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values aggressive_am_freeride=Aggressive_AM_freeride_camber_carving unk_skill_level_recommendation=Unknown
% @importance 0.8

0.80::acc(s16, skill_level_recommendation).

0.77::true_val(skill_level_recommendation, aggressive_am_freeride); 0.23::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s16, skill_level_recommendation, aggressive_am_freeride).

all_consistent(skill_level_recommendation) :- consistent(s16, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, aggressive_am_freeride)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values am_freeride_powder=All_Mountain_Freeride_Powder unk_terrain_suitability=Unknown
% @importance 0.9

0.82::acc(s14, terrain_suitability).

0.72::true_val(terrain_suitability, am_freeride_powder); 0.28::true_val(terrain_suitability, unk_terrain_suitability).

measured(s14, terrain_suitability, am_freeride_powder).

all_consistent(terrain_suitability) :- consistent(s14, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, am_freeride_powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.9

0.83::acc(s17, gender).

0.81::true_val(gender, mens); 0.19::true_val(gender, unk_gender).

measured(s17, gender, mens).

all_consistent(gender) :- consistent(s17, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values slimmed_souped_carbon=Slimmed_down_souped_up_carbon_enhanced unk_design_philosophy=Unknown
% @importance 0.7

0.88::acc(s18, design_philosophy).

0.81::true_val(design_philosophy, slimmed_souped_carbon); 0.19::true_val(design_philosophy, unk_design_philosophy).

measured(s18, design_philosophy, slimmed_souped_carbon).

all_consistent(design_philosophy) :- consistent(s18, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, slimmed_souped_carbon)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr width_difference_vs_gremlin
% @type categorical
% @canonical false
% @original_name Width difference vs. Gremlin
% @values narrower_quicker_edge=Narrower_profile_quicker_edge_to_edge unk_width_difference_vs_gremlin=Unknown
% @importance 0.8

0.82::acc(s19, width_difference_vs_gremlin).

0.72::true_val(width_difference_vs_gremlin, narrower_quicker_edge); 0.28::true_val(width_difference_vs_gremlin, unk_width_difference_vs_gremlin).

measured(s19, width_difference_vs_gremlin, narrower_quicker_edge).

all_consistent(width_difference_vs_gremlin) :- consistent(s19, width_difference_vs_gremlin).

evidence(all_consistent(width_difference_vs_gremlin)).
query(true_val(width_difference_vs_gremlin, narrower_quicker_edge)).
query(true_val(width_difference_vs_gremlin, unk_width_difference_vs_gremlin)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_power_bands=Carbon_Power_Bands_snap_energy_stability unk_construction_material_innovation=Unknown
% @importance 0.85

0.83::acc(s20, construction_material_innovation).
0.83::acc(s30, construction_material_innovation).

0.95::true_val(construction_material_innovation, carbon_power_bands); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s20, construction_material_innovation, carbon_power_bands).
measured(s30, construction_material_innovation, carbon_power_bands).

all_consistent(construction_material_innovation) :-
    consistent(s20, construction_material_innovation),
    consistent(s30, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_power_bands)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr core_upgrade
% @type categorical
% @canonical false
% @original_name Core upgrade
% @values g_lite_3=G_Lite_3_from_G_Lite_2 unk_core_upgrade=Unknown
% @importance 0.85

0.80::acc(s21, core_upgrade).

0.76::true_val(core_upgrade, g_lite_3); 0.24::true_val(core_upgrade, unk_core_upgrade).

measured(s21, core_upgrade, g_lite_3).

all_consistent(core_upgrade) :- consistent(s21, core_upgrade).

evidence(all_consistent(core_upgrade)).
query(true_val(core_upgrade, g_lite_3)).
query(true_val(core_upgrade, unk_core_upgrade)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values ride_normal_size=Ride_normal_size_do_not_size_down size_down_2cm=Ride_2cm_shorter
% @importance 0.9

0.85::acc(s22, reviewer_opinion_the_good_ride).
0.72::acc(s23, reviewer_opinion_the_good_ride).

0.70::true_val(reviewer_opinion_the_good_ride, ride_normal_size); 0.30::true_val(reviewer_opinion_the_good_ride, size_down_2cm).

measured(s22, reviewer_opinion_the_good_ride, ride_normal_size).
measured(s23, reviewer_opinion_the_good_ride, size_down_2cm).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s22, reviewer_opinion_the_good_ride),
    consistent(s23, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, ride_normal_size)).
query(true_val(reviewer_opinion_the_good_ride, size_down_2cm)).

% @attr manufacturer_sizing_guidance
% @type categorical
% @canonical false
% @original_name Manufacturer sizing guidance
% @values normal_freeride_length=Normal_freeride_length_not_volume_shifted unk_manufacturer_sizing_guidance=Unknown
% @importance 0.9

0.94::acc(s24, manufacturer_sizing_guidance).

0.90::true_val(manufacturer_sizing_guidance, normal_freeride_length); 0.10::true_val(manufacturer_sizing_guidance, unk_manufacturer_sizing_guidance).

measured(s24, manufacturer_sizing_guidance, normal_freeride_length).

all_consistent(manufacturer_sizing_guidance) :- consistent(s24, manufacturer_sizing_guidance).

evidence(all_consistent(manufacturer_sizing_guidance)).
query(true_val(manufacturer_sizing_guidance, normal_freeride_length)).
query(true_val(manufacturer_sizing_guidance, unk_manufacturer_sizing_guidance)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s155_158_161=155cm_158cm_161cm unk_available_sizes=Unknown
% @importance 1.0

0.95::acc(s25, available_sizes).

0.93::true_val(available_sizes, s155_158_161); 0.07::true_val(available_sizes, unk_available_sizes).

measured(s25, available_sizes, s155_158_161).

all_consistent(available_sizes) :- consistent(s25, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s155_158_161)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v8=8.0 v7=7.0
% @importance 0.95

0.94::acc(s25, flex_rating_10_manufacturer).
0.70::acc(s14, flex_rating_10_manufacturer).

0.72::true_val(flex_rating_10_manufacturer, v8); 0.28::true_val(flex_rating_10_manufacturer, v7).

measured(s25, flex_rating_10_manufacturer, v8).
measured(s14, flex_rating_10_manufacturer, v7).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s25, flex_rating_10_manufacturer),
    (indep(s14), consistent(s14, flex_rating_10_manufacturer) ; \+indep(s14)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v8)).
query(true_val(flex_rating_10_manufacturer, v7)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_firm=Medium_Firm unk_flex_feel=Unknown
% @importance 0.85

0.83::acc(s15, flex_feel).

0.81::true_val(flex_feel, medium_firm); 0.19::true_val(flex_feel, unk_flex_feel).

measured(s15, flex_feel, medium_firm).

all_consistent(flex_feel) :- consistent(s15, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_firm)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values stiff_6_8=Stiff_evo_classifies_6_to_8 unk_flex_rating_10_evo=Unknown
% @importance 0.75

0.75::acc(s26, flex_rating_10_evo).

0.68::true_val(flex_rating_10_evo, stiff_6_8); 0.32::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s26, flex_rating_10_evo, stiff_6_8).

all_consistent(flex_rating_10_evo) :- consistent(s26, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff_6_8)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c3_camber=C3_Camber unk_camber_type=Unknown
% @importance 1.0

0.95::acc(s25, camber_type).

0.93::true_val(camber_type, c3_camber); 0.07::true_val(camber_type, unk_camber_type).

measured(s25, camber_type, c3_camber).

all_consistent(camber_type) :- consistent(s25, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, c3_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values dominant_camber_mild_rocker=Aggressive_dominant_camber_mild_rocker_between_feet unk_camber_description=Unknown
% @importance 0.9

0.78::acc(s27, camber_description).

0.76::true_val(camber_description, dominant_camber_mild_rocker); 0.24::true_val(camber_description, unk_camber_description).

measured(s27, camber_description, dominant_camber_mild_rocker).

all_consistent(camber_description) :- consistent(s27, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, dominant_camber_mild_rocker)).
query(true_val(camber_description, unk_camber_description)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.83::acc(s15, mounting_pattern).

0.81::true_val(mounting_pattern, inserts_2x4); 0.19::true_val(mounting_pattern, unk_mounting_pattern).

measured(s15, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s15, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Texture_Topsheet unk_topsheet=Unknown
% @importance 0.9

0.82::acc(s14, topsheet).

0.72::true_val(topsheet, eco_sublimated_poly); 0.28::true_val(topsheet, unk_topsheet).

measured(s14, topsheet, eco_sublimated_poly).

all_consistent(topsheet) :- consistent(s14, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit cm
% @values v108_0=108.0 unk_contact_length_size=Unknown
% @importance 1.0

0.95::acc(s25, contact_length_size).

0.93::true_val(contact_length_size, v108_0); 0.07::true_val(contact_length_size, unk_contact_length_size).

measured(s25, contact_length_size, v108_0).

all_consistent(contact_length_size) :- consistent(s25, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v108_0)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_2=7.2 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.95::acc(s25, sidecut_radius_size).

0.93::true_val(sidecut_radius_size, v7_2); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s25, sidecut_radius_size, v7_2).

all_consistent(sidecut_radius_size) :- consistent(s25, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_2)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v30_5=30.5 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.95::acc(s25, tip_tail_width_size).

0.93::true_val(tip_tail_width_size, v30_5); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s25, tip_tail_width_size, v30_5).

all_consistent(tip_tail_width_size) :- consistent(s25, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_5)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_155_tail
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v29_2=29.2 unk_tip_tail_width_size_155_tail=Unknown
% @importance 1.0

0.95::acc(s25, tip_tail_width_size_155_tail).

0.93::true_val(tip_tail_width_size_155_tail, v29_2); 0.07::true_val(tip_tail_width_size_155_tail, unk_tip_tail_width_size_155_tail).

measured(s25, tip_tail_width_size_155_tail, v29_2).

all_consistent(tip_tail_width_size_155_tail) :- consistent(s25, tip_tail_width_size_155_tail).

evidence(all_consistent(tip_tail_width_size_155_tail)).
query(true_val(tip_tail_width_size_155_tail, v29_2)).
query(true_val(tip_tail_width_size_155_tail, unk_tip_tail_width_size_155_tail)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name Waist width 155cm
% @unit cm
% @values v25_5=25.5 unk_waist_width_155=Unknown
% @importance 1.0

0.95::acc(s25, waist_width_155).

0.93::true_val(waist_width_155, v25_5); 0.07::true_val(waist_width_155, unk_waist_width_155).

measured(s25, waist_width_155, v25_5).

all_consistent(waist_width_155) :- consistent(s25, waist_width_155).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_5)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @values r19_25_to_24=19.25in_to_24in unk_stance_width_range_size=Unknown
% @importance 1.0

0.95::acc(s25, stance_width_range_size).

0.93::true_val(stance_width_range_size, r19_25_to_24); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s25, stance_width_range_size, r19_25_to_24).

all_consistent(stance_width_range_size) :- consistent(s25, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r19_25_to_24)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit inches
% @values v2=2.0 v3=3.0
% @importance 0.95

0.94::acc(s25, setback).
0.68::acc(s14, setback).

0.72::true_val(setback, v2); 0.28::true_val(setback, v3).

measured(s25, setback, v2).
measured(s14, setback, v3).

all_consistent(setback) :-
    consistent(s25, setback),
    (indep(s14), consistent(s14, setback) ; \+indep(s14)).

evidence(all_consistent(setback)).
query(true_val(setback, v2)).
query(true_val(setback, v3)).

% @attr setback_cm
% @type numeric
% @canonical false
% @original_name setback
% @unit cm
% @values v5_1=5.1 unk_setback_cm=Unknown
% @importance 1.0

0.95::acc(s25, setback_cm).

0.93::true_val(setback_cm, v5_1); 0.07::true_val(setback_cm, unk_setback_cm).

measured(s25, setback_cm, v5_1).

all_consistent(setback_cm) :- consistent(s25, setback_cm).

evidence(all_consistent(setback_cm)).
query(true_val(setback_cm, v5_1)).
query(true_val(setback_cm, unk_setback_cm)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w140_plus=140_plus_lbs_65_plus_kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.95::acc(s25, recommended_weight_range_size).

0.93::true_val(recommended_weight_range_size, w140_plus); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s25, recommended_weight_range_size, w140_plus).

all_consistent(recommended_weight_range_size) :- consistent(s25, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w140_plus)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr contact_length_size_158
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v110_0=110.0 unk_contact_length_size_158=Unknown
% @importance 1.0

0.95::acc(s25, contact_length_size_158).

0.93::true_val(contact_length_size_158, v110_0); 0.07::true_val(contact_length_size_158, unk_contact_length_size_158).

measured(s25, contact_length_size_158, v110_0).

all_consistent(contact_length_size_158) :- consistent(s25, contact_length_size_158).

evidence(all_consistent(contact_length_size_158)).
query(true_val(contact_length_size_158, v110_0)).
query(true_val(contact_length_size_158, unk_contact_length_size_158)).

% @attr sidecut_radius_size_158
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_5=7.5 unk_sidecut_radius_size_158=Unknown
% @importance 1.0

0.95::acc(s25, sidecut_radius_size_158).

0.93::true_val(sidecut_radius_size_158, v7_5); 0.07::true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158).

measured(s25, sidecut_radius_size_158, v7_5).

all_consistent(sidecut_radius_size_158) :- consistent(s25, sidecut_radius_size_158).

evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v7_5)).
query(true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158)).

% @attr tip_tail_width_size_158_nose
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v31_1=31.1 unk_tip_tail_width_size_158_nose=Unknown
% @importance 1.0

0.95::acc(s25, tip_tail_width_size_158_nose).

0.93::true_val(tip_tail_width_size_158_nose, v31_1); 0.07::true_val(tip_tail_width_size_158_nose, unk_tip_tail_width_size_158_nose).

measured(s25, tip_tail_width_size_158_nose, v31_1).

all_consistent(tip_tail_width_size_158_nose) :- consistent(s25, tip_tail_width_size_158_nose).

evidence(all_consistent(tip_tail_width_size_158_nose)).
query(true_val(tip_tail_width_size_158_nose, v31_1)).
query(true_val(tip_tail_width_size_158_nose, unk_tip_tail_width_size_158_nose)).

% @attr tip_tail_width_size_158_tail
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v29_9=29.9 unk_tip_tail_width_size_158_tail=Unknown
% @importance 1.0

0.95::acc(s25, tip_tail_width_size_158_tail).

0.93::true_val(tip_tail_width_size_158_tail, v29_9); 0.07::true_val(tip_tail_width_size_158_tail, unk_tip_tail_width_size_158_tail).

measured(s25, tip_tail_width_size_158_tail, v29_9).

all_consistent(tip_tail_width_size_158_tail) :- consistent(s25, tip_tail_width_size_158_tail).

evidence(all_consistent(tip_tail_width_size_158_tail)).
query(true_val(tip_tail_width_size_158_tail, v29_9)).
query(true_val(tip_tail_width_size_158_tail, unk_tip_tail_width_size_158_tail)).

% @attr waist_width_158
% @type numeric
% @canonical false
% @original_name Waist width 158cm
% @unit cm
% @values v26_1=26.1 unk_waist_width_158=Unknown
% @importance 1.0

0.95::acc(s25, waist_width_158).

0.93::true_val(waist_width_158, v26_1); 0.07::true_val(waist_width_158, unk_waist_width_158).

measured(s25, waist_width_158, v26_1).

all_consistent(waist_width_158) :- consistent(s25, waist_width_158).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v26_1)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr stance_width_range_size_158
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @values r19_25_to_24=19.25in_to_24in unk_stance_width_range_size_158=Unknown
% @importance 1.0

0.95::acc(s25, stance_width_range_size_158).

0.93::true_val(stance_width_range_size_158, r19_25_to_24_158); 0.07::true_val(stance_width_range_size_158, unk_stance_width_range_size_158).

measured(s25, stance_width_range_size_158, r19_25_to_24_158).

all_consistent(stance_width_range_size_158) :- consistent(s25, stance_width_range_size_158).

evidence(all_consistent(stance_width_range_size_158)).
query(true_val(stance_width_range_size_158, r19_25_to_24_158)).
query(true_val(stance_width_range_size_158, unk_stance_width_range_size_158)).

% @attr setback_158
% @type numeric
% @canonical false
% @original_name setback
% @unit inches
% @values v2=2.0 unk_setback_158=Unknown
% @importance 1.0

0.95::acc(s25, setback_158).

0.93::true_val(setback_158, v2_158); 0.07::true_val(setback_158, unk_setback_158).

measured(s25, setback_158, v2_158).

all_consistent(setback_158) :- consistent(s25, setback_158).

evidence(all_consistent(setback_158)).
query(true_val(setback_158, v2_158)).
query(true_val(setback_158, unk_setback_158)).

% @attr recommended_weight_range_size_158
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w145_plus=145_plus_lbs_70_plus_kg unk_recommended_weight_range_size_158=Unknown
% @importance 1.0

0.95::acc(s25, recommended_weight_range_size_158).

0.93::true_val(recommended_weight_range_size_158, w145_plus); 0.07::true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158).

measured(s25, recommended_weight_range_size_158, w145_plus).

all_consistent(recommended_weight_range_size_158) :- consistent(s25, recommended_weight_range_size_158).

evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, w145_plus)).
query(true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158)).

% @attr contact_length_size_161
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v112_0=112.0 unk_contact_length_size_161=Unknown
% @importance 1.0

0.95::acc(s25, contact_length_size_161).

0.93::true_val(contact_length_size_161, v112_0); 0.07::true_val(contact_length_size_161, unk_contact_length_size_161).

measured(s25, contact_length_size_161, v112_0).

all_consistent(contact_length_size_161) :- consistent(s25, contact_length_size_161).

evidence(all_consistent(contact_length_size_161)).
query(true_val(contact_length_size_161, v112_0)).
query(true_val(contact_length_size_161, unk_contact_length_size_161)).

% @attr sidecut_radius_size_161
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_7=7.7 unk_sidecut_radius_size_161=Unknown
% @importance 1.0

0.95::acc(s25, sidecut_radius_size_161).

0.93::true_val(sidecut_radius_size_161, v7_7); 0.07::true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161).

measured(s25, sidecut_radius_size_161, v7_7).

all_consistent(sidecut_radius_size_161) :- consistent(s25, sidecut_radius_size_161).

evidence(all_consistent(sidecut_radius_size_161)).
query(true_val(sidecut_radius_size_161, v7_7)).
query(true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161)).

% @attr tip_tail_width_size_161_nose
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v31_5=31.5 unk_tip_tail_width_size_161_nose=Unknown
% @importance 1.0

0.95::acc(s25, tip_tail_width_size_161_nose).

0.93::true_val(tip_tail_width_size_161_nose, v31_5); 0.07::true_val(tip_tail_width_size_161_nose, unk_tip_tail_width_size_161_nose).

measured(s25, tip_tail_width_size_161_nose, v31_5).

all_consistent(tip_tail_width_size_161_nose) :- consistent(s25, tip_tail_width_size_161_nose).

evidence(all_consistent(tip_tail_width_size_161_nose)).
query(true_val(tip_tail_width_size_161_nose, v31_5)).
query(true_val(tip_tail_width_size_161_nose, unk_tip_tail_width_size_161_nose)).

% @attr tip_tail_width_size_161_tail
% @type numeric
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v30_2=30.2 unk_tip_tail_width_size_161_tail=Unknown
% @importance 1.0

0.95::acc(s25, tip_tail_width_size_161_tail).

0.93::true_val(tip_tail_width_size_161_tail, v30_2); 0.07::true_val(tip_tail_width_size_161_tail, unk_tip_tail_width_size_161_tail).

measured(s25, tip_tail_width_size_161_tail, v30_2).

all_consistent(tip_tail_width_size_161_tail) :- consistent(s25, tip_tail_width_size_161_tail).

evidence(all_consistent(tip_tail_width_size_161_tail)).
query(true_val(tip_tail_width_size_161_tail, v30_2)).
query(true_val(tip_tail_width_size_161_tail, unk_tip_tail_width_size_161_tail)).

% @attr waist_width_161
% @type numeric
% @canonical false
% @original_name Waist width 161cm
% @unit cm
% @values v26_3=26.3 unk_waist_width_161=Unknown
% @importance 1.0

0.95::acc(s25, waist_width_161).

0.93::true_val(waist_width_161, v26_3); 0.07::true_val(waist_width_161, unk_waist_width_161).

measured(s25, waist_width_161, v26_3).

all_consistent(waist_width_161) :- consistent(s25, waist_width_161).

evidence(all_consistent(waist_width_161)).
query(true_val(waist_width_161, v26_3)).
query(true_val(waist_width_161, unk_waist_width_161)).

% @attr stance_width_range_size_161
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @values r19_25_to_24_161=19.25in_to_24in unk_stance_width_range_size_161=Unknown
% @importance 1.0

0.95::acc(s25, stance_width_range_size_161).

0.93::true_val(stance_width_range_size_161, r19_25_to_24_161); 0.07::true_val(stance_width_range_size_161, unk_stance_width_range_size_161).

measured(s25, stance_width_range_size_161, r19_25_to_24_161).

all_consistent(stance_width_range_size_161) :- consistent(s25, stance_width_range_size_161).

evidence(all_consistent(stance_width_range_size_161)).
query(true_val(stance_width_range_size_161, r19_25_to_24_161)).
query(true_val(stance_width_range_size_161, unk_stance_width_range_size_161)).

% @attr setback_161
% @type numeric
% @canonical false
% @original_name setback
% @unit inches
% @values v2_161=2.0 unk_setback_161=Unknown
% @importance 1.0

0.95::acc(s25, setback_161).

0.93::true_val(setback_161, v2_161); 0.07::true_val(setback_161, unk_setback_161).

measured(s25, setback_161, v2_161).

all_consistent(setback_161) :- consistent(s25, setback_161).

evidence(all_consistent(setback_161)).
query(true_val(setback_161, v2_161)).
query(true_val(setback_161, unk_setback_161)).

% @attr recommended_weight_range_size_161
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w150_plus=150_plus_lbs_70_plus_kg unk_recommended_weight_range_size_161=Unknown
% @importance 1.0

0.95::acc(s25, recommended_weight_range_size_161).

0.93::true_val(recommended_weight_range_size_161, w150_plus); 0.07::true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161).

measured(s25, recommended_weight_range_size_161, w150_plus).

all_consistent(recommended_weight_range_size_161) :- consistent(s25, recommended_weight_range_size_161).

evidence(all_consistent(recommended_weight_range_size_161)).
query(true_val(recommended_weight_range_size_161, w150_plus)).
query(true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values g_lite_3_aspen_paulownia=G_Lite_3_FSC_Aspen_Paulownia unk_core_material=Unknown
% @importance 0.8

0.83::acc(s28, core_material).

0.81::true_val(core_material, g_lite_3_aspen_paulownia); 0.19::true_val(core_material, unk_core_material).

measured(s28, core_material, g_lite_3_aspen_paulownia).

all_consistent(core_material) :- consistent(s28, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, g_lite_3_aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified=FSC_Forest_Stewardship_Council_certified unk_sustainability_certification_fsc=Unknown
% @importance 0.8

0.83::acc(s28, sustainability_certification_fsc).

0.81::true_val(sustainability_certification_fsc, fsc_certified); 0.19::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s28, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :- consistent(s28, sustainability_certification_fsc).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_biax_fiberglass=Triax_Biax_fiberglass_torsional_smooth unk_laminate=Unknown
% @importance 0.75

0.83::acc(s29, laminate).

0.81::true_val(laminate, triax_biax_fiberglass); 0.19::true_val(laminate, unk_laminate).

measured(s29, laminate, triax_biax_fiberglass).

all_consistent(laminate) :- consistent(s29, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_knife_cut=Sintered_Knife_Cut_UHMW unk_base_material=Unknown
% @importance 0.8

0.83::acc(s31, base_material).

0.81::true_val(base_material, sintered_knife_cut); 0.19::true_val(base_material, unk_base_material).

measured(s31, base_material, sintered_knife_cut).

all_consistent(base_material) :- consistent(s31, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_knife_cut)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values die_cut_knife_cut=Die_cut_knife_cut_reduced_waste unk_base_type=Unknown
% @importance 0.9

0.82::acc(s14, base_type).

0.72::true_val(base_type, die_cut_knife_cut); 0.28::true_val(base_type, unk_base_type).

measured(s14, base_type, die_cut_knife_cut).

all_consistent(base_type) :- consistent(s14, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, die_cut_knife_cut)).
query(true_val(base_type, unk_base_type)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values uhmw=UHMW_Ultra_High_Molecular_Weight_PE unk_sidewall_material=Unknown
% @importance 0.85

0.83::acc(s15, sidewall_material).

0.81::true_val(sidewall_material, uhmw); 0.19::true_val(sidewall_material, unk_sidewall_material).

measured(s15, sidewall_material, uhmw).

all_consistent(sidewall_material) :- consistent(s15, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, uhmw)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction_7=Magne_Traction_seven_serrations unk_edge_technology=Unknown
% @importance 0.775

0.83::acc(s32, edge_technology).
0.78::acc(s33, edge_technology).

0.95::true_val(edge_technology, magne_traction_7); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s32, edge_technology, magne_traction_7).
measured(s33, edge_technology, magne_traction_7).

all_consistent(edge_technology) :-
    consistent(s32, edge_technology),
    consistent(s33, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v629_99=629.99 unk_price_usd_msrp=Unknown
% @importance 0.95

0.93::acc(s11, price_usd_msrp).

0.90::true_val(price_usd_msrp, v629_99); 0.10::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s11, price_usd_msrp, v629_99).

all_consistent(price_usd_msrp) :- consistent(s11, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v629_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_blauer
% @type numeric
% @canonical false
% @original_name Price at Blauer Board Shop (USD)
% @unit USD
% @values v629_99=629.99 unk_price_blauer=Unknown
% @importance 0.9

0.83::acc(s17, price_blauer).

0.81::true_val(price_blauer, v629_99_bl); 0.19::true_val(price_blauer, unk_price_blauer).

measured(s17, price_blauer, v629_99_bl).

all_consistent(price_blauer) :- consistent(s17, price_blauer).

evidence(all_consistent(price_blauer)).
query(true_val(price_blauer, v629_99_bl)).
query(true_val(price_blauer, unk_price_blauer)).

% @attr price_sports_ltd
% @type numeric
% @canonical false
% @original_name Price at Sports Ltd. LA (USD)
% @unit USD
% @values v649_99=649.99 unk_price_sports_ltd=Unknown
% @importance 0.85

0.65::acc(s34, price_sports_ltd).

0.59::true_val(price_sports_ltd, v649_99); 0.41::true_val(price_sports_ltd, unk_price_sports_ltd).

measured(s34, price_sports_ltd, v649_99).

all_consistent(price_sports_ltd) :- consistent(s34, price_sports_ltd).

evidence(all_consistent(price_sports_ltd)).
query(true_val(price_sports_ltd, v649_99)).
query(true_val(price_sports_ltd, unk_price_sports_ltd)).

% @attr price_one_boardshop_cad
% @type numeric
% @canonical false
% @original_name Price at ONE Boardshop (CAD)
% @unit CAD
% @values v819_99=819.99 unk_price_one_boardshop_cad=Unknown
% @importance 0.8

0.65::acc(s35, price_one_boardshop_cad).

0.59::true_val(price_one_boardshop_cad, v819_99); 0.41::true_val(price_one_boardshop_cad, unk_price_one_boardshop_cad).

measured(s35, price_one_boardshop_cad, v819_99).

all_consistent(price_one_boardshop_cad) :- consistent(s35, price_one_boardshop_cad).

evidence(all_consistent(price_one_boardshop_cad)).
query(true_val(price_one_boardshop_cad, v819_99)).
query(true_val(price_one_boardshop_cad, unk_price_one_boardshop_cad)).

% @attr price_salty_peaks
% @type numeric
% @canonical false
% @original_name Price at Salty Peaks (USD)
% @unit USD
% @values v339_00=339.0 unk_price_salty_peaks=Unknown
% @importance 0.7

0.45::acc(s36, price_salty_peaks).

0.33::true_val(price_salty_peaks, v339_00); 0.67::true_val(price_salty_peaks, unk_price_salty_peaks).

measured(s36, price_salty_peaks, v339_00).

all_consistent(price_salty_peaks) :- consistent(s36, price_salty_peaks).

evidence(all_consistent(price_salty_peaks)).
query(true_val(price_salty_peaks, v339_00)).
query(true_val(price_salty_peaks, unk_price_salty_peaks)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values listed_evo_2027=Listed_on_evo_2027_early_release unk_availability_status=Unknown
% @importance 0.8

0.82::acc(s37, availability_status).

0.77::true_val(availability_status, listed_evo_2027); 0.23::true_val(availability_status, unk_availability_status).

measured(s37, availability_status, listed_evo_2027).

all_consistent(availability_status) :- consistent(s37, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, listed_evo_2027)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out=All_sizes_sold_out_unavailable unk_availability_status_skipro=Unknown
% @importance 0.65

0.60::acc(s38, availability_status_skipro).

0.54::true_val(availability_status_skipro, sold_out); 0.46::true_val(availability_status_skipro, unk_availability_status_skipro).

measured(s38, availability_status_skipro, sold_out).

all_consistent(availability_status_skipro) :- consistent(s38, availability_status_skipro).

evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, sold_out)).
query(true_val(availability_status_skipro, unk_availability_status_skipro)).

% @attr availability_status_empire
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock=In_stock unk_availability_status_empire=Unknown
% @importance 0.65

0.62::acc(s39, availability_status_empire).

0.59::true_val(availability_status_empire, in_stock_empire); 0.41::true_val(availability_status_empire, unk_availability_status_empire).

measured(s39, availability_status_empire, in_stock_empire).

all_consistent(availability_status_empire) :- consistent(s39, availability_status_empire).

evidence(all_consistent(availability_status_empire)).
query(true_val(availability_status_empire, in_stock_empire)).
query(true_val(availability_status_empire, unk_availability_status_empire)).

% @attr availability_status_gorge
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_in_stock=Listed_in_stock unk_availability_status_gorge=Unknown
% @importance 0.5

0.55::acc(s40, availability_status_gorge).

0.48::true_val(availability_status_gorge, listed_in_stock_gorge); 0.52::true_val(availability_status_gorge, unk_availability_status_gorge).

measured(s40, availability_status_gorge, listed_in_stock_gorge).

all_consistent(availability_status_gorge) :- consistent(s40, availability_status_gorge).

evidence(all_consistent(availability_status_gorge)).
query(true_val(availability_status_gorge, listed_in_stock_gorge)).
query(true_val(availability_status_gorge, unk_availability_status_gorge)).

% @attr availability_status_funtastik
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_early_release=Listed_early_release unk_availability_status_funtastik=Unknown
% @importance 0.5

0.52::acc(s41, availability_status_funtastik).

0.47::true_val(availability_status_funtastik, listed_early_release_fun); 0.53::true_val(availability_status_funtastik, unk_availability_status_funtastik).

measured(s41, availability_status_funtastik, listed_early_release_fun).

all_consistent(availability_status_funtastik) :- consistent(s41, availability_status_funtastik).

evidence(all_consistent(availability_status_funtastik)).
query(true_val(availability_status_funtastik, listed_early_release_fun)).
query(true_val(availability_status_funtastik, unk_availability_status_funtastik)).

% @attr availability_status_rudeboys
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_early_2027=Listed_early_2027_release unk_availability_status_rudeboys=Unknown
% @importance 0.5

0.58::acc(s42, availability_status_rudeboys).

0.51::true_val(availability_status_rudeboys, listed_early_2027_rude); 0.49::true_val(availability_status_rudeboys, unk_availability_status_rudeboys).

measured(s42, availability_status_rudeboys, listed_early_2027_rude).

all_consistent(availability_status_rudeboys) :- consistent(s42, availability_status_rudeboys).

evidence(all_consistent(availability_status_rudeboys)).
query(true_val(availability_status_rudeboys, listed_early_2027_rude)).
query(true_val(availability_status_rudeboys, unk_availability_status_rudeboys)).

% @attr availability_status_splinters
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_splinters=Listed unk_availability_status_splinters=Unknown
% @importance 0.45

0.52::acc(s43, availability_status_splinters).

0.44::true_val(availability_status_splinters, listed_splinters); 0.56::true_val(availability_status_splinters, unk_availability_status_splinters).

measured(s43, availability_status_splinters, listed_splinters).

all_consistent(availability_status_splinters) :- consistent(s43, availability_status_splinters).

evidence(all_consistent(availability_status_splinters)).
query(true_val(availability_status_splinters, listed_splinters)).
query(true_val(availability_status_splinters, unk_availability_status_splinters)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v1099_99=1099.99 unk_price_aud_merchant=Unknown
% @importance 0.9

0.82::acc(s14, price_aud_merchant).

0.72::true_val(price_aud_merchant, v1099_99); 0.28::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s14, price_aud_merchant, v1099_99).

all_consistent(price_aud_merchant) :- consistent(s14, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1099_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr sku_161
% @type categorical
% @canonical false
% @original_name SKU (161cm)
% @values sku_26sn008_161=26SN008_161 unk_sku_161=Unknown
% @importance 0.9

0.82::acc(s14, sku_161).

0.72::true_val(sku_161, sku_26sn008_161); 0.28::true_val(sku_161, unk_sku_161).

measured(s14, sku_161, sku_26sn008_161).

all_consistent(sku_161) :- consistent(s14, sku_161).

evidence(all_consistent(sku_161)).
query(true_val(sku_161, sku_26sn008_161)).
query(true_val(sku_161, unk_sku_161)).

% @attr sku_158
% @type categorical
% @canonical false
% @original_name SKU (158cm)
% @values sku_26sn008_158=26SN008-158 unk_sku_158=Unknown
% @importance 0.8

0.65::acc(s35, sku_158).

0.59::true_val(sku_158, sku_26sn008_158); 0.41::true_val(sku_158, unk_sku_158).

measured(s35, sku_158, sku_26sn008_158).

all_consistent(sku_158) :- consistent(s35, sku_158).

evidence(all_consistent(sku_158)).
query(true_val(sku_158, sku_26sn008_158)).
query(true_val(sku_158, unk_sku_158)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v1=1.0 unk_warranty_period_years=Unknown
% @importance 0.8

0.93::acc(s44, warranty_period_years).

0.90::true_val(warranty_period_years, v1); 0.10::true_val(warranty_period_years, unk_warranty_period_years).

measured(s44, warranty_period_years, v1).

all_consistent(warranty_period_years) :- consistent(s44, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values mfg_defects_only=Manufacturers_defects_materials_workmanship unk_warranty=Unknown
% @importance 0.75

0.93::acc(s45, warranty).

0.90::true_val(warranty, mfg_defects_only); 0.10::true_val(warranty, unk_warranty).

measured(s45, warranty, mfg_defects_only).

all_consistent(warranty) :- consistent(s45, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, mfg_defects_only)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty
% @values no_wear_impact_abuse=Not_covering_wear_impact_abuse_cosmetic unk_warranty_exclusions=Unknown
% @importance 0.75

0.93::acc(s45, warranty_exclusions).

0.90::true_val(warranty_exclusions, no_wear_impact_abuse); 0.10::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s45, warranty_exclusions, no_wear_impact_abuse).

all_consistent(warranty_exclusions) :- consistent(s45, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, no_wear_impact_abuse)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr warranty_transferability
% @type categorical
% @canonical false
% @original_name warranty
% @values original_purchaser_receipt=Original_purchaser_only_retain_receipt unk_warranty_transferability=Unknown
% @importance 0.7

0.93::acc(s46, warranty_transferability).

0.90::true_val(warranty_transferability, original_purchaser_receipt); 0.10::true_val(warranty_transferability, unk_warranty_transferability).

measured(s46, warranty_transferability, original_purchaser_receipt).

all_consistent(warranty_transferability) :- consistent(s46, warranty_transferability).

evidence(all_consistent(warranty_transferability)).
query(true_val(warranty_transferability, original_purchaser_receipt)).
query(true_val(warranty_transferability, unk_warranty_transferability)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values fantastic=Fantastic_Magne_Traction_grip unk_edge_hold=Unknown
% @importance 0.85

0.72::acc(s47, edge_hold).

0.56::true_val(edge_hold, fantastic); 0.44::true_val(edge_hold, unk_edge_hold).

measured(s47, edge_hold, fantastic).

all_consistent(edge_hold) :- consistent(s47, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, fantastic)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr reviewer_opinion_the_good_ride_carving
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values carves_phenomenally=Carves_phenomenally_stable_all_conditions unk_reviewer_opinion_the_good_ride_carving=Unknown
% @importance 0.85

0.72::acc(s48, reviewer_opinion_the_good_ride_carving).

0.60::true_val(reviewer_opinion_the_good_ride_carving, carves_phenomenally); 0.40::true_val(reviewer_opinion_the_good_ride_carving, unk_reviewer_opinion_the_good_ride_carving).

measured(s48, reviewer_opinion_the_good_ride_carving, carves_phenomenally).

all_consistent(reviewer_opinion_the_good_ride_carving) :- consistent(s48, reviewer_opinion_the_good_ride_carving).

evidence(all_consistent(reviewer_opinion_the_good_ride_carving)).
query(true_val(reviewer_opinion_the_good_ride_carving, carves_phenomenally)).
query(true_val(reviewer_opinion_the_good_ride_carving, unk_reviewer_opinion_the_good_ride_carving)).

% @attr reviewer_opinion_the_good_ride_chunder
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values excels_chunder_crud=Excels_chunder_crud_variable_absorbs_bumps unk_reviewer_opinion_the_good_ride_chunder=Unknown
% @importance 0.75

0.55::acc(s49, reviewer_opinion_the_good_ride_chunder).

0.40::true_val(reviewer_opinion_the_good_ride_chunder, excels_chunder_crud); 0.60::true_val(reviewer_opinion_the_good_ride_chunder, unk_reviewer_opinion_the_good_ride_chunder).

measured(s49, reviewer_opinion_the_good_ride_chunder, excels_chunder_crud).

all_consistent(reviewer_opinion_the_good_ride_chunder) :- consistent(s49, reviewer_opinion_the_good_ride_chunder).

evidence(all_consistent(reviewer_opinion_the_good_ride_chunder)).
query(true_val(reviewer_opinion_the_good_ride_chunder, excels_chunder_crud)).
query(true_val(reviewer_opinion_the_good_ride_chunder, unk_reviewer_opinion_the_good_ride_chunder)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values strong_pop=Strong_pop_hard_surprisingly_easy unk_pop=Unknown
% @importance 0.8

0.80::acc(s50, pop).

0.68::true_val(pop, strong_pop); 0.32::true_val(pop, unk_pop).

measured(s50, pop, strong_pop).

all_consistent(pop) :- consistent(s50, pop).

evidence(all_consistent(pop)).
query(true_val(pop, strong_pop)).
query(true_val(pop, unk_pop)).

% @attr reviewer_opinion_the_good_ride_ice
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values powered_through_ice_chunder=Powered_through_icy_terrain_chunder_like_champ unk_reviewer_opinion_the_good_ride_ice=Unknown
% @importance 0.85

0.72::acc(s51, reviewer_opinion_the_good_ride_ice).

0.60::true_val(reviewer_opinion_the_good_ride_ice, powered_through_ice_chunder); 0.40::true_val(reviewer_opinion_the_good_ride_ice, unk_reviewer_opinion_the_good_ride_ice).

measured(s51, reviewer_opinion_the_good_ride_ice, powered_through_ice_chunder).

all_consistent(reviewer_opinion_the_good_ride_ice) :- consistent(s51, reviewer_opinion_the_good_ride_ice).

evidence(all_consistent(reviewer_opinion_the_good_ride_ice)).
query(true_val(reviewer_opinion_the_good_ride_ice, powered_through_ice_chunder)).
query(true_val(reviewer_opinion_the_good_ride_ice, unk_reviewer_opinion_the_good_ride_ice)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values one_board_quiver=Suitable_one_board_quiver_advanced unk_positive_aspect=Unknown
% @importance 0.7

0.78::acc(s52, positive_aspect).

0.64::true_val(positive_aspect, one_board_quiver); 0.36::true_val(positive_aspect, unk_positive_aspect).

measured(s52, positive_aspect, one_board_quiver).

all_consistent(positive_aspect) :- consistent(s52, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, one_board_quiver)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_speed
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values good_high_speed=Good_high_speed_composure_semi_short_wide unk_positive_aspect_speed=Unknown
% @importance 0.75

0.78::acc(s53, positive_aspect_speed).

0.64::true_val(positive_aspect_speed, good_high_speed); 0.36::true_val(positive_aspect_speed, unk_positive_aspect_speed).

measured(s53, positive_aspect_speed, good_high_speed).

all_consistent(positive_aspect_speed) :- consistent(s53, positive_aspect_speed).

evidence(all_consistent(positive_aspect_speed)).
query(true_val(positive_aspect_speed, good_high_speed)).
query(true_val(positive_aspect_speed, unk_positive_aspect_speed)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values narrower_quick_edge=Narrower_profile_quick_edge_to_edge unk_turn_initiation_performance=Unknown
% @importance 0.8

0.82::acc(s19, turn_initiation_performance).

0.72::true_val(turn_initiation_performance, narrower_quick_edge); 0.28::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s19, turn_initiation_performance, narrower_quick_edge).

all_consistent(turn_initiation_performance) :- consistent(s19, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, narrower_quick_edge)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values lively_pop_lightweight=Lively_powerful_pop_lightweight_nimble unk_positive_aspect_pop=Unknown
% @importance 0.75

0.72::acc(s54, positive_aspect_pop).

0.56::true_val(positive_aspect_pop, lively_pop_lightweight); 0.44::true_val(positive_aspect_pop, unk_positive_aspect_pop).

measured(s54, positive_aspect_pop, lively_pop_lightweight).

all_consistent(positive_aspect_pop) :- consistent(s54, positive_aspect_pop).

evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, lively_pop_lightweight)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values average_below_peers=Average_not_up_to_par_in_peer_group unk_base_glide_performance=Unknown
% @importance 0.8

0.80::acc(s55, base_glide_performance).

0.72::true_val(base_glide_performance, average_below_peers); 0.28::true_val(base_glide_performance, unk_base_glide_performance).

measured(s55, base_glide_performance, average_below_peers).

all_consistent(base_glide_performance) :- consistent(s55, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, average_below_peers)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_deep_pow=Not_as_good_deep_powder_vs_Orca_Hybrid_QK unk_negative_aspect=Unknown
% @importance 0.8

0.78::acc(s56, negative_aspect).

0.68::true_val(negative_aspect, not_deep_pow); 0.32::true_val(negative_aspect, unk_negative_aspect).

measured(s56, negative_aspect, not_deep_pow).

all_consistent(negative_aspect) :- consistent(s56, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_deep_pow)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_beginner
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values too_aggressive_beginners=Too_aggressive_catchy_for_beginners unk_negative_aspect_beginner=Unknown
% @importance 0.85

0.72::acc(s57, negative_aspect_beginner).

0.63::true_val(negative_aspect_beginner, too_aggressive_beginners); 0.37::true_val(negative_aspect_beginner, unk_negative_aspect_beginner).

measured(s57, negative_aspect_beginner, too_aggressive_beginners).

all_consistent(negative_aspect_beginner) :- consistent(s57, negative_aspect_beginner).

evidence(all_consistent(negative_aspect_beginner)).
query(true_val(negative_aspect_beginner, too_aggressive_beginners)).
query(true_val(negative_aspect_beginner, unk_negative_aspect_beginner)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values heavy_for_size=One_of_heavier_boards_even_vs_longer unk_board_weight_grams=Unknown
% @importance 0.7

0.65::acc(s58, board_weight_grams).

0.49::true_val(board_weight_grams, heavy_for_size); 0.51::true_val(board_weight_grams, unk_board_weight_grams).

measured(s58, board_weight_grams, heavy_for_size).

all_consistent(board_weight_grams) :- consistent(s58, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, heavy_for_size)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr negative_aspect_butter
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_easy_butter=Not_easy_to_butter_stiffer_flex unk_negative_aspect_butter=Unknown
% @importance 0.8

0.78::acc(s50, negative_aspect_butter).

0.68::true_val(negative_aspect_butter, not_easy_butter); 0.32::true_val(negative_aspect_butter, unk_negative_aspect_butter).

measured(s50, negative_aspect_butter, not_easy_butter).

all_consistent(negative_aspect_butter) :- consistent(s50, negative_aspect_butter).

evidence(all_consistent(negative_aspect_butter)).
query(true_val(negative_aspect_butter, not_easy_butter)).
query(true_val(negative_aspect_butter, unk_negative_aspect_butter)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values limited_directional=Directional_shape_limits_switch unk_switch_riding=Unknown
% @importance 0.65

0.75::acc(s59, switch_riding).

0.64::true_val(switch_riding, limited_directional); 0.36::true_val(switch_riding, unk_switch_riding).

measured(s59, switch_riding, limited_directional).

all_consistent(switch_riding) :- consistent(s59, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, limited_directional)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values plain=Plain unk_topsheet_appearance_description=Unknown
% @importance 0.25

0.55::acc(s60, topsheet_appearance_description).

0.39::true_val(topsheet_appearance_description, plain); 0.61::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s60, topsheet_appearance_description, plain).

all_consistent(topsheet_appearance_description) :- consistent(s60, topsheet_appearance_description).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, plain)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values turbo_narrower_carbon_g3=Turbo_narrower_carbon_G_Lite_3_normal_sizing unk_comparable_board_same_brand=Unknown
% @importance 0.9

0.83::acc(s22, comparable_board_same_brand).

0.81::true_val(comparable_board_same_brand, turbo_narrower_carbon_g3); 0.19::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s22, comparable_board_same_brand, turbo_narrower_carbon_g3).

all_consistent(comparable_board_same_brand) :- consistent(s22, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, turbo_narrower_carbon_g3)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values gremlin_vs_orca=Gremlin_better_edge_chunder_Orca_better_deep_pow unk_comparable_board_cross_brand=Unknown
% @importance 0.8

0.55::acc(s61, comparable_board_cross_brand).

0.40::true_val(comparable_board_cross_brand, gremlin_vs_orca); 0.60::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s61, comparable_board_cross_brand, gremlin_vs_orca).

all_consistent(comparable_board_cross_brand) :- consistent(s61, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, gremlin_vs_orca)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_dinghy
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values gremlin_vs_dinghy=Gremlin_stiffer_Dinghy_more_playful_forgiving unk_comparable_board_cross_brand_dinghy=Unknown
% @importance 0.7

0.50::acc(s62, comparable_board_cross_brand_dinghy).

0.36::true_val(comparable_board_cross_brand_dinghy, gremlin_vs_dinghy); 0.64::true_val(comparable_board_cross_brand_dinghy, unk_comparable_board_cross_brand_dinghy).

measured(s62, comparable_board_cross_brand_dinghy, gremlin_vs_dinghy).

all_consistent(comparable_board_cross_brand_dinghy) :- consistent(s62, comparable_board_cross_brand_dinghy).

evidence(all_consistent(comparable_board_cross_brand_dinghy)).
query(true_val(comparable_board_cross_brand_dinghy, gremlin_vs_dinghy)).
query(true_val(comparable_board_cross_brand_dinghy, unk_comparable_board_cross_brand_dinghy)).

% @attr comparable_board_cross_brand_list
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values tgr_similar_boards=Endeavor_Scout_Prior_Legacy_Jones_Hovercraft_etc unk_comparable_board_cross_brand_list=Unknown
% @importance 0.8

0.78::acc(s63, comparable_board_cross_brand_list).

0.68::true_val(comparable_board_cross_brand_list, tgr_similar_boards); 0.32::true_val(comparable_board_cross_brand_list, unk_comparable_board_cross_brand_list).

measured(s63, comparable_board_cross_brand_list, tgr_similar_boards).

all_consistent(comparable_board_cross_brand_list) :- consistent(s63, comparable_board_cross_brand_list).

evidence(all_consistent(comparable_board_cross_brand_list)).
query(true_val(comparable_board_cross_brand_list, tgr_similar_boards)).
query(true_val(comparable_board_cross_brand_list, unk_comparable_board_cross_brand_list)).

% @attr reviewer_opinion_the_good_ride_freeride
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values alt_freeride_fav=Alternative_freeride_favorite_longer_narrower_poppy unk_reviewer_opinion_the_good_ride_freeride=Unknown
% @importance 0.75

0.80::acc(s64, reviewer_opinion_the_good_ride_freeride).

0.72::true_val(reviewer_opinion_the_good_ride_freeride, alt_freeride_fav); 0.28::true_val(reviewer_opinion_the_good_ride_freeride, unk_reviewer_opinion_the_good_ride_freeride).

measured(s64, reviewer_opinion_the_good_ride_freeride, alt_freeride_fav).

all_consistent(reviewer_opinion_the_good_ride_freeride) :- consistent(s64, reviewer_opinion_the_good_ride_freeride).

evidence(all_consistent(reviewer_opinion_the_good_ride_freeride)).
query(true_val(reviewer_opinion_the_good_ride_freeride, alt_freeride_fav)).
query(true_val(reviewer_opinion_the_good_ride_freeride, unk_reviewer_opinion_the_good_ride_freeride)).

% @attr comparable_board_same_brand_banked
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values banked_country_629=Banked_Country_629_99_traditional_directional_freeride unk_comparable_board_same_brand_banked=Unknown
% @importance 0.6

0.75::acc(s65, comparable_board_same_brand_banked).

0.64::true_val(comparable_board_same_brand_banked, banked_country_629); 0.36::true_val(comparable_board_same_brand_banked, unk_comparable_board_same_brand_banked).

measured(s65, comparable_board_same_brand_banked, banked_country_629).

all_consistent(comparable_board_same_brand_banked) :- consistent(s65, comparable_board_same_brand_banked).

evidence(all_consistent(comparable_board_same_brand_banked)).
query(true_val(comparable_board_same_brand_banked, banked_country_629)).
query(true_val(comparable_board_same_brand_banked, unk_comparable_board_same_brand_banked)).

% @attr predecessor_price_comparison
% @type categorical
% @canonical false
% @original_name Predecessor price comparison
% @values gremlin_579_sale_405=Standard_Gremlin_MSRP_579_99_sale_405_99 unk_predecessor_price_comparison=Unknown
% @importance 0.75

0.88::acc(s66, predecessor_price_comparison).

0.81::true_val(predecessor_price_comparison, gremlin_579_sale_405); 0.19::true_val(predecessor_price_comparison, unk_predecessor_price_comparison).

measured(s66, predecessor_price_comparison, gremlin_579_sale_405).

all_consistent(predecessor_price_comparison) :- consistent(s66, predecessor_price_comparison).

evidence(all_consistent(predecessor_price_comparison)).
query(true_val(predecessor_price_comparison, gremlin_579_sale_405)).
query(true_val(predecessor_price_comparison, unk_predecessor_price_comparison)).

% @attr sustainability_certification_sublimation
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values eco_sublimated_zero_waste=Eco_sublimated_poly_zero_hazardous_waste unk_sustainability_certification_sublimation=Unknown
% @importance 0.85

0.83::acc(s15, sustainability_certification_sublimation).

0.81::true_val(sustainability_certification_sublimation, eco_sublimated_zero_waste); 0.19::true_val(sustainability_certification_sublimation, unk_sustainability_certification_sublimation).

measured(s15, sustainability_certification_sublimation, eco_sublimated_zero_waste).

all_consistent(sustainability_certification_sublimation) :- consistent(s15, sustainability_certification_sublimation).

evidence(all_consistent(sustainability_certification_sublimation)).
query(true_val(sustainability_certification_sublimation, eco_sublimated_zero_waste)).
query(true_val(sustainability_certification_sublimation, unk_sustainability_certification_sublimation)).

% @attr manufacturing_philosophy
% @type categorical
% @canonical false
% @original_name Manufacturing philosophy
% @values mervin_made_handbuilt_wa=Mervin_Made_handbuilt_Washington_State unk_manufacturing_philosophy=Unknown
% @importance 0.55

0.83::acc(s67, manufacturing_philosophy).

0.77::true_val(manufacturing_philosophy, mervin_made_handbuilt_wa); 0.23::true_val(manufacturing_philosophy, unk_manufacturing_philosophy).

measured(s67, manufacturing_philosophy, mervin_made_handbuilt_wa).

all_consistent(manufacturing_philosophy) :- consistent(s67, manufacturing_philosophy).

evidence(all_consistent(manufacturing_philosophy)).
query(true_val(manufacturing_philosophy, mervin_made_handbuilt_wa)).
query(true_val(manufacturing_philosophy, unk_manufacturing_philosophy)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_not_wide=Standard_not_Wide unk_width_options=Unknown
% @importance 0.9

0.82::acc(s14, width_options).

0.72::true_val(width_options, standard_not_wide); 0.28::true_val(width_options, unk_width_options).

measured(s14, width_options, standard_not_wide).

all_consistent(width_options) :- consistent(s14, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_not_wide)).
query(true_val(width_options, unk_width_options)).

% @attr board_description
% @type categorical
% @canonical false
% @original_name Board description
% @values slimmer_faster_carbon=Slimmer_faster_edge_to_edge_boosted_carbon unk_board_description=Unknown
% @importance 0.9

0.82::acc(s14, board_description).

0.72::true_val(board_description, slimmer_faster_carbon); 0.28::true_val(board_description, unk_board_description).

measured(s14, board_description, slimmer_faster_carbon).

all_consistent(board_description) :- consistent(s14, board_description).

evidence(all_consistent(board_description)).
query(true_val(board_description, slimmer_faster_carbon)).
query(true_val(board_description, unk_board_description)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2027_new=2027_new_model_2026_2027_season unk_model_first_available_year=Unknown
% @importance 0.95

0.93::acc(s11, model_first_available_year).

0.90::true_val(model_first_available_year, y2027_new); 0.10::true_val(model_first_available_year, unk_model_first_available_year).

measured(s11, model_first_available_year, y2027_new).

all_consistent(model_first_available_year) :- consistent(s11, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2027_new)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr original_gremlin_first_model_year
% @type categorical
% @canonical false
% @original_name Original Gremlin first model year
% @values y2021=2021_2020_2021_season unk_original_gremlin_first_model_year=Unknown
% @importance 0.6

0.55::acc(s12, original_gremlin_first_model_year).

0.50::true_val(original_gremlin_first_model_year, y2021); 0.50::true_val(original_gremlin_first_model_year, unk_original_gremlin_first_model_year).

measured(s12, original_gremlin_first_model_year, y2021).

all_consistent(original_gremlin_first_model_year) :- consistent(s12, original_gremlin_first_model_year).

evidence(all_consistent(original_gremlin_first_model_year)).
query(true_val(original_gremlin_first_model_year, y2021)).
query(true_val(original_gremlin_first_model_year, unk_original_gremlin_first_model_year)).

% @attr gremlin_original_sizing
% @type categorical
% @canonical false
% @original_name Gremlin was originally a single-size board
% @values single_155_first_year=Originally_155_only_later_expanded unk_gremlin_original_sizing=Unknown
% @importance 0.4

0.68::acc(s68, gremlin_original_sizing).

0.68::true_val(gremlin_original_sizing, single_155_first_year); 0.32::true_val(gremlin_original_sizing, unk_gremlin_original_sizing).

measured(s68, gremlin_original_sizing, single_155_first_year).

all_consistent(gremlin_original_sizing) :- consistent(s68, gremlin_original_sizing).

evidence(all_consistent(gremlin_original_sizing)).
query(true_val(gremlin_original_sizing, single_155_first_year)).
query(true_val(gremlin_original_sizing, unk_gremlin_original_sizing)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values early_release_preseason=Early_release_preseason_multiple_retailers unk_estimated_availability_date=Unknown
% @importance 0.5

0.58::acc(s42, estimated_availability_date).

0.51::true_val(estimated_availability_date, early_release_preseason); 0.49::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s42, estimated_availability_date, early_release_preseason).

all_consistent(estimated_availability_date) :- consistent(s42, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, early_release_preseason)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr board_of_world_gremlin_review
% @type numeric
% @canonical false
% @original_name Board of the World Gremlin review
% @unit /100
% @values v87_5=87.5 unk_board_of_world_gremlin_review=Unknown
% @importance 0.75

0.72::acc(s69, board_of_world_gremlin_review).

0.63::true_val(board_of_world_gremlin_review, v87_5); 0.37::true_val(board_of_world_gremlin_review, unk_board_of_world_gremlin_review).

measured(s69, board_of_world_gremlin_review, v87_5).

all_consistent(board_of_world_gremlin_review) :- consistent(s69, board_of_world_gremlin_review).

evidence(all_consistent(board_of_world_gremlin_review)).
query(true_val(board_of_world_gremlin_review, v87_5)).
query(true_val(board_of_world_gremlin_review, unk_board_of_world_gremlin_review)).

% @attr gremlin_ranking
% @type categorical
% @canonical false
% @original_name Gremlin ranking
% @values rank_14_of_38=14th_of_38_all_mountain_Board_of_World unk_gremlin_ranking=Unknown
% @importance 0.7

0.72::acc(s70, gremlin_ranking).

0.63::true_val(gremlin_ranking, rank_14_of_38); 0.37::true_val(gremlin_ranking, unk_gremlin_ranking).

measured(s70, gremlin_ranking, rank_14_of_38).

all_consistent(gremlin_ranking) :- consistent(s70, gremlin_ranking).

evidence(all_consistent(gremlin_ranking)).
query(true_val(gremlin_ranking, rank_14_of_38)).
query(true_val(gremlin_ranking, unk_gremlin_ranking)).

% @attr reviewer_opinion_the_good_ride_hard_snow
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values fav_harder_snow=One_of_favorite_boards_harder_snow_carving unk_reviewer_opinion_the_good_ride_hard_snow=Unknown
% @importance 0.8

0.78::acc(s71, reviewer_opinion_the_good_ride_hard_snow).

0.68::true_val(reviewer_opinion_the_good_ride_hard_snow, fav_harder_snow); 0.32::true_val(reviewer_opinion_the_good_ride_hard_snow, unk_reviewer_opinion_the_good_ride_hard_snow).

measured(s71, reviewer_opinion_the_good_ride_hard_snow, fav_harder_snow).

all_consistent(reviewer_opinion_the_good_ride_hard_snow) :- consistent(s71, reviewer_opinion_the_good_ride_hard_snow).

evidence(all_consistent(reviewer_opinion_the_good_ride_hard_snow)).
query(true_val(reviewer_opinion_the_good_ride_hard_snow, fav_harder_snow)).
query(true_val(reviewer_opinion_the_good_ride_hard_snow, unk_reviewer_opinion_the_good_ride_hard_snow)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values four_stars_base_glide_weak=4_of_5_stars_carving_edge_hold_good_base_glide_weak unk_user_review_forum=Unknown
% @importance 0.75

0.58::acc(s72, user_review_forum).

0.47::true_val(user_review_forum, four_stars_base_glide_weak); 0.53::true_val(user_review_forum, unk_user_review_forum).

measured(s72, user_review_forum, four_stars_base_glide_weak).

all_consistent(user_review_forum) :- consistent(s72, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, four_stars_base_glide_weak)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr medium_reviewer
% @type categorical
% @canonical false
% @original_name Medium reviewer (Jay Dutton)
% @values all_terrain_crusher=Truly_all_terrain_crusher_fast_stable_smooth unk_medium_reviewer=Unknown
% @importance 0.7

0.55::acc(s73, medium_reviewer).

0.40::true_val(medium_reviewer, all_terrain_crusher); 0.60::true_val(medium_reviewer, unk_medium_reviewer).

measured(s73, medium_reviewer, all_terrain_crusher).

all_consistent(medium_reviewer) :- consistent(s73, medium_reviewer).

evidence(all_consistent(medium_reviewer)).
query(true_val(medium_reviewer, all_terrain_crusher)).
query(true_val(medium_reviewer, unk_medium_reviewer)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values bent_axtion_transfer_union_ultra=Bent_Metal_Axtion_Transfer_Union_Ultra unk_binding_compatibility=Unknown
% @importance 0.65

0.72::acc(s74, binding_compatibility).

0.60::true_val(binding_compatibility, bent_axtion_transfer_union_ultra); 0.40::true_val(binding_compatibility, unk_binding_compatibility).

measured(s74, binding_compatibility, bent_axtion_transfer_union_ultra).

all_consistent(binding_compatibility) :- consistent(s74, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, bent_axtion_transfer_union_ultra)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr gnu_brand_reputation
% @type categorical
% @canonical false
% @original_name GNU brand reputation
% @values established_1977_innovative=Established_1977_Magne_Traction_Banana_Tech unk_gnu_brand_reputation=Unknown
% @importance 0.5

0.55::acc(s75, gnu_brand_reputation).

0.48::true_val(gnu_brand_reputation, established_1977_innovative); 0.52::true_val(gnu_brand_reputation, unk_gnu_brand_reputation).

measured(s75, gnu_brand_reputation, established_1977_innovative).

all_consistent(gnu_brand_reputation) :- consistent(s75, gnu_brand_reputation).

evidence(all_consistent(gnu_brand_reputation)).
query(true_val(gnu_brand_reputation, established_1977_innovative)).
query(true_val(gnu_brand_reputation, unk_gnu_brand_reputation)).

% @attr mervin_reputation
% @type categorical
% @canonical false
% @original_name Mervin reputation
% @values pioneer_sustainable_usa=Pioneer_sustainable_manufacturing_longest_USA_factory unk_mervin_reputation=Unknown
% @importance 0.6

0.78::acc(s5, mervin_reputation).

0.77::true_val(mervin_reputation, pioneer_sustainable_usa); 0.23::true_val(mervin_reputation, unk_mervin_reputation).

measured(s5, mervin_reputation, pioneer_sustainable_usa).

all_consistent(mervin_reputation) :- consistent(s5, mervin_reputation).

evidence(all_consistent(mervin_reputation)).
query(true_val(mervin_reputation, pioneer_sustainable_usa)).
query(true_val(mervin_reputation, unk_mervin_reputation)).

% @attr sustainability_certification_materials
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values bio_plastics_soy_basalt_fsc=Bio_plastics_soy_sidewalls_basalt_FSC_cores unk_sustainability_certification_materials=Unknown
% @importance 0.45

0.58::acc(s76, sustainability_certification_materials).

0.51::true_val(sustainability_certification_materials, bio_plastics_soy_basalt_fsc); 0.49::true_val(sustainability_certification_materials, unk_sustainability_certification_materials).

measured(s76, sustainability_certification_materials, bio_plastics_soy_basalt_fsc).

all_consistent(sustainability_certification_materials) :- consistent(s76, sustainability_certification_materials).

evidence(all_consistent(sustainability_certification_materials)).
query(true_val(sustainability_certification_materials, bio_plastics_soy_basalt_fsc)).
query(true_val(sustainability_certification_materials, unk_sustainability_certification_materials)).