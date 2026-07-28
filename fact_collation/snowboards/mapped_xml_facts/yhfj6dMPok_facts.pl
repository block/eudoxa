0.20::indep(s4).
0.15::indep(s6).
0.20::indep(s18).
0.20::indep(s22).
0.15::indep(s24).
0.15::indep(s_merchant).
0.15::indep(s40).
0.15::indep(s45).
0.15::indep(s34).
0.15::indep(s37).
0.15::indep(s95).
0.20::indep(s21).
0.15::indep(s26).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.95::acc(s1, brand).
0.90::acc(s24, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.975

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).

measured(s1, brand, burton).
measured(s24, brand, burton).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s24), consistent(s24, brand) ; \+indep(s24)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

0.95::acc(s1, model_name).
0.85::acc(s6, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values blossom_camber=Blossom_Camber_Snowboard unk_model_name=Unknown
% @importance 0.975

0.96::true_val(model_name, blossom_camber); 0.04::true_val(model_name, unk_model_name).

measured(s1, model_name, blossom_camber).
measured(s6, model_name, blossom_camber).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s6), consistent(s6, model_name) ; \+indep(s6)).

evidence(all_consistent(model_name)).
query(true_val(model_name, blossom_camber)).
query(true_val(model_name, unk_model_name)).

0.90::acc(s24, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025=2025 unk_model_year=Unknown
% @importance 0.95

0.92::true_val(model_year, y2025); 0.08::true_val(model_year, unk_model_year).

measured(s24, model_year, y2025).

all_consistent(model_year) :-
    (indep(s24), consistent(s24, model_year) ; \+indep(s24)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2025)).
query(true_val(model_year, unk_model_year)).

0.95::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.95::acc(s106, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_corporation=The_Burton_Corporation unk_manufacturer=Unknown
% @importance 0.6

0.95::true_val(manufacturer, burton_corporation); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s106, manufacturer, burton_corporation).

all_consistent(manufacturer) :-
    consistent(s106, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_corporation)).
query(true_val(manufacturer, unk_manufacturer)).

0.95::acc(s106, manufacturer_headquarters).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values burlington_vt_usa=Burlington_Vermont_USA unk_manufacturer_headquarters=Unknown
% @importance 0.6

0.95::true_val(manufacturer_headquarters, burlington_vt_usa); 0.05::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s106, manufacturer_headquarters, burlington_vt_usa).

all_consistent(manufacturer_headquarters) :-
    consistent(s106, manufacturer_headquarters).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, burlington_vt_usa)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

0.82::acc(s109, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values keil_factory_austria=Keil_factory_Austria unk_manufacturing_location=Unknown
% @importance 0.5

0.80::true_val(manufacturing_location, keil_factory_austria); 0.20::true_val(manufacturing_location, unk_manufacturing_location).

measured(s109, manufacturing_location, keil_factory_austria).

all_consistent(manufacturing_location) :-
    consistent(s109, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, keil_factory_austria)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.82::acc(s109, rd_location).

% @attr rd_location
% @type categorical
% @canonical false
% @original_name R&D location
% @values craigs_prototype_burlington=Craigs_Prototype_Facility_Burlington_VT unk_rd_location=Unknown
% @importance 0.5

0.80::true_val(rd_location, craigs_prototype_burlington); 0.20::true_val(rd_location, unk_rd_location).

measured(s109, rd_location, craigs_prototype_burlington).

all_consistent(rd_location) :-
    consistent(s109, rd_location).

evidence(all_consistent(rd_location)).
query(true_val(rd_location, craigs_prototype_burlington)).
query(true_val(rd_location, unk_rd_location)).

0.93::acc(s111, sustainability_certification).
0.95::acc(s106, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corporation=First_snowboard_company_certified_B_Corporation unk_sustainability_certification=Unknown
% @importance 0.525

0.95::true_val(sustainability_certification, b_corporation); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s111, sustainability_certification, b_corporation).
measured(s106, sustainability_certification, b_corporation).

all_consistent(sustainability_certification) :-
    consistent(s111, sustainability_certification),
    consistent(s106, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corporation)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.90::acc(s111, year_company_founded).

% @attr year_company_founded
% @type numeric
% @canonical false
% @original_name Year company founded
% @values y1977=1977
% @importance 0.45

0.93::true_val(year_company_founded, y1977); 0.07::true_val(year_company_founded, unk_year_company_founded).

measured(s111, year_company_founded, y1977).

all_consistent(year_company_founded) :-
    consistent(s111, year_company_founded).

evidence(all_consistent(year_company_founded)).
query(true_val(year_company_founded, y1977)).
query(true_val(year_company_founded, unk_year_company_founded)).

0.78::acc(s20, model_first_available_year).
0.80::acc(s74, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2022_2023=2022-2023_season unk_model_first_available_year=Unknown
% @importance 0.7

0.85::true_val(model_first_available_year, season_2022_2023); 0.15::true_val(model_first_available_year, unk_model_first_available_year).

measured(s20, model_first_available_year, season_2022_2023).
measured(s74, model_first_available_year, season_2022_2023).

all_consistent(model_first_available_year) :-
    consistent(s20, model_first_available_year),
    consistent(s74, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2022_2023)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.80::acc(s74, camber_description_2023).

% @attr camber_description_2023
% @type categorical
% @canonical false
% @original_name camber_description (2023 model)
% @values purepop_camber=PurePop_Camber_with_flat_zones unk_camber_description_2023=Unknown
% @importance 0.7

0.80::true_val(camber_description_2023, purepop_camber); 0.20::true_val(camber_description_2023, unk_camber_description_2023).

measured(s74, camber_description_2023, purepop_camber).

all_consistent(camber_description_2023) :-
    consistent(s74, camber_description_2023).

evidence(all_consistent(camber_description_2023)).
query(true_val(camber_description_2023, purepop_camber)).
query(true_val(camber_description_2023, unk_camber_description_2023)).

0.80::acc(s44, no_spec_upgrades_2025).

% @attr no_spec_upgrades_2025
% @type categorical
% @canonical false
% @original_name 2025 model spec changes
% @values no_upgrades=No_spec_upgrades_new_graphics_only unk_no_spec_upgrades_2025=Unknown
% @importance 0.7

0.82::true_val(no_spec_upgrades_2025, no_upgrades); 0.18::true_val(no_spec_upgrades_2025, unk_no_spec_upgrades_2025).

measured(s44, no_spec_upgrades_2025, no_upgrades).

all_consistent(no_spec_upgrades_2025) :-
    consistent(s44, no_spec_upgrades_2025).

evidence(all_consistent(no_spec_upgrades_2025)).
query(true_val(no_spec_upgrades_2025, no_upgrades)).
query(true_val(no_spec_upgrades_2025, unk_no_spec_upgrades_2025)).

0.82::acc(s66, absorbed_models).

% @attr absorbed_models
% @type categorical
% @canonical false
% @original_name Absorbed predecessor models
% @values free_thinker_talent_scout=Free_Thinker_and_Talent_Scout unk_absorbed_models=Unknown
% @importance 0.8

0.82::true_val(absorbed_models, free_thinker_talent_scout); 0.18::true_val(absorbed_models, unk_absorbed_models).

measured(s66, absorbed_models, free_thinker_talent_scout).

all_consistent(absorbed_models) :-
    consistent(s66, absorbed_models).

evidence(all_consistent(absorbed_models)).
query(true_val(absorbed_models, free_thinker_talent_scout)).
query(true_val(absorbed_models, unk_absorbed_models)).

0.93::acc(s_merchant, sku_162cm).

% @attr sku_162cm
% @type categorical
% @canonical false
% @original_name SKU (162cm)
% @values sku_22943103000_162=22943103000_162 unk_sku_162cm=Unknown
% @importance 0.85

0.93::true_val(sku_162cm, sku_22943103000_162); 0.07::true_val(sku_162cm, unk_sku_162cm).

measured(s_merchant, sku_162cm, sku_22943103000_162).

all_consistent(sku_162cm) :-
    (indep(s_merchant), consistent(s_merchant, sku_162cm) ; \+indep(s_merchant)).

evidence(all_consistent(sku_162cm)).
query(true_val(sku_162cm, sku_22943103000_162)).
query(true_val(sku_162cm, unk_sku_162cm)).

0.90::acc(s18, gender).
0.80::acc(s62, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.65

0.93::true_val(gender, unisex); 0.07::true_val(gender, unk_gender).

measured(s18, gender, unisex).
measured(s62, gender, unisex).

all_consistent(gender) :-
    (indep(s18), consistent(s18, gender) ; \+indep(s18)),
    consistent(s62, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

0.80::acc(s13, pro_rider_name).
0.85::acc(s9, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values zeb_powell_et_al=Zeb_Powell_Winkelmann_Crouch_Ciccarelli_Warner unk_pro_rider_name=Unknown
% @importance 0.675

0.85::true_val(pro_rider_name, zeb_powell_et_al); 0.15::true_val(pro_rider_name, unk_pro_rider_name).

measured(s13, pro_rider_name, zeb_powell_et_al).
measured(s9, pro_rider_name, zeb_powell_et_al).

all_consistent(pro_rider_name) :-
    consistent(s13, pro_rider_name),
    consistent(s9, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, zeb_powell_et_al)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.78::acc(s26, graphic_designer_artist).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values niels_schack=Niels_Schack unk_graphic_designer_artist=Unknown
% @importance 0.4

0.78::true_val(graphic_designer_artist, niels_schack); 0.22::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s26, graphic_designer_artist, niels_schack).

all_consistent(graphic_designer_artist) :-
    (indep(s26), consistent(s26, graphic_designer_artist) ; \+indep(s26)).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, niels_schack)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

0.80::acc(s26, topsheet_appearance_description).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values crystal_rock_color_shift=Eroded_rock_crystal_graphic_color_shifts_in_cold unk_topsheet_appearance_description=Unknown
% @importance 0.4

0.80::true_val(topsheet_appearance_description, crystal_rock_color_shift); 0.20::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s26, topsheet_appearance_description, crystal_rock_color_shift).

all_consistent(topsheet_appearance_description) :-
    (indep(s26), consistent(s26, topsheet_appearance_description) ; \+indep(s26)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, crystal_rock_color_shift)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

0.88::acc(s24, board_category).
0.82::acc(s4, board_category).
0.80::acc(s11, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_park=All_Mountain_Park freestyle_all_mountain=Freestyle_All_Mountain_Freestyle unk_board_category=Unknown
% @importance 0.9

0.45::true_val(board_category, all_mountain_park); 0.50::true_val(board_category, freestyle_all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(s24, board_category, all_mountain_park).
measured(s4, board_category, freestyle_all_mountain).
measured(s11, board_category, freestyle_all_mountain).

all_consistent(board_category) :-
    (indep(s24), consistent(s24, board_category) ; \+indep(s24)),
    (indep(s4), consistent(s4, board_category) ; \+indep(s4)),
    consistent(s11, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_park)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

0.78::acc(s56, riding_style).
0.82::acc(s4, riding_style).
0.80::acc(s11, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values park_freestyle_all_mountain=Park_focused_freestyle_jumps_spins_jibbing_switch unk_riding_style=Unknown
% @importance 0.87

0.90::true_val(riding_style, park_freestyle_all_mountain); 0.10::true_val(riding_style, unk_riding_style).

measured(s56, riding_style, park_freestyle_all_mountain).
measured(s4, riding_style, park_freestyle_all_mountain).
measured(s11, riding_style, park_freestyle_all_mountain).

all_consistent(riding_style) :-
    consistent(s56, riding_style),
    (indep(s4), consistent(s4, riding_style) ; \+indep(s4)),
    consistent(s11, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, park_freestyle_all_mountain)).
query(true_val(riding_style, unk_riding_style)).

0.82::acc(s54, terrain_suitability).
0.80::acc(s13, terrain_suitability).
0.82::acc(s11, terrain_suitability).
0.80::acc(s17, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_freestyle_all_mountain=Park_freestyle_also_all_mountain_groomed_hardpack unk_terrain_suitability=Unknown
% @importance 0.8

0.93::true_val(terrain_suitability, park_freestyle_all_mountain); 0.07::true_val(terrain_suitability, unk_terrain_suitability).

measured(s54, terrain_suitability, park_freestyle_all_mountain).
measured(s13, terrain_suitability, park_freestyle_all_mountain).
measured(s11, terrain_suitability, park_freestyle_all_mountain).
measured(s17, terrain_suitability, park_freestyle_all_mountain).

all_consistent(terrain_suitability) :-
    consistent(s54, terrain_suitability),
    consistent(s13, terrain_suitability),
    consistent(s11, terrain_suitability),
    consistent(s17, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_freestyle_all_mountain)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.82::acc(s11, powder_rating_tgr).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values not_suited=Not_suited_full_camber_twin_not_great_for_powder unk_powder_rating_tgr=Unknown
% @importance 0.9

0.82::true_val(powder_rating_tgr, not_suited); 0.18::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s11, powder_rating_tgr, not_suited).

all_consistent(powder_rating_tgr) :-
    consistent(s11, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, not_suited)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.88::acc(s24, rider_level).
0.80::acc(s6, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate=Intermediate unk_rider_level=Unknown
% @importance 0.925

0.88::true_val(rider_level, intermediate); 0.12::true_val(rider_level, unk_rider_level).

measured(s24, rider_level, intermediate).
measured(s6, rider_level, intermediate).

all_consistent(rider_level) :-
    (indep(s24), consistent(s24, rider_level) ; \+indep(s24)),
    (indep(s6), consistent(s6, rider_level) ; \+indep(s6)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, unk_rider_level)).

0.82::acc(s4, skill_level_recommendation).
0.80::acc(s27, skill_level_recommendation).
0.80::acc(s17, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_Advanced advanced_expert=Advanced_Expert unk_skill_level_recommendation=Unknown
% @importance 0.85

0.40::true_val(skill_level_recommendation, intermediate_advanced); 0.55::true_val(skill_level_recommendation, advanced_expert); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s4, skill_level_recommendation, intermediate_advanced).
measured(s27, skill_level_recommendation, advanced_expert).
measured(s17, skill_level_recommendation, advanced_expert).

all_consistent(skill_level_recommendation) :-
    (indep(s4), consistent(s4, skill_level_recommendation) ; \+indep(s4)),
    consistent(s27, skill_level_recommendation),
    consistent(s17, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.80::acc(s27, skill_level_recommendation_profile).

% @attr skill_level_recommendation_profile
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (target rider profile)
% @values aggressive_freestyle=Aggressive_freestyle_riders_big_jumps_tech_tricks unk_skill_level_recommendation_profile=Unknown
% @importance 0.85

0.80::true_val(skill_level_recommendation_profile, aggressive_freestyle); 0.20::true_val(skill_level_recommendation_profile, unk_skill_level_recommendation_profile).

measured(s27, skill_level_recommendation_profile, aggressive_freestyle).

all_consistent(skill_level_recommendation_profile) :-
    consistent(s27, skill_level_recommendation_profile).

evidence(all_consistent(skill_level_recommendation_profile)).
query(true_val(skill_level_recommendation_profile, aggressive_freestyle)).
query(true_val(skill_level_recommendation_profile, unk_skill_level_recommendation_profile)).

0.80::acc(s17, skill_level_recommendation_warning).

% @attr skill_level_recommendation_warning
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (beginner warning)
% @values not_for_beginners=Not_for_beginners_most_intermediates_too_much unk_skill_level_recommendation_warning=Unknown
% @importance 0.8

0.80::true_val(skill_level_recommendation_warning, not_for_beginners); 0.20::true_val(skill_level_recommendation_warning, unk_skill_level_recommendation_warning).

measured(s17, skill_level_recommendation_warning, not_for_beginners).

all_consistent(skill_level_recommendation_warning) :-
    consistent(s17, skill_level_recommendation_warning).

evidence(all_consistent(skill_level_recommendation_warning)).
query(true_val(skill_level_recommendation_warning, not_for_beginners)).
query(true_val(skill_level_recommendation_warning, unk_skill_level_recommendation_warning)).

0.82::acc(s66, sizes_below_150_stiffness).

% @attr sizes_below_150_stiffness
% @type categorical
% @canonical false
% @original_name Sizes below 150cm stiffness
% @values women_friendly_softer=Sizes_below_150_have_women_friendly_stiffness unk_sizes_below_150_stiffness=Unknown
% @importance 0.8

0.82::true_val(sizes_below_150_stiffness, women_friendly_softer); 0.18::true_val(sizes_below_150_stiffness, unk_sizes_below_150_stiffness).

measured(s66, sizes_below_150_stiffness, women_friendly_softer).

all_consistent(sizes_below_150_stiffness) :-
    consistent(s66, sizes_below_150_stiffness).

evidence(all_consistent(sizes_below_150_stiffness)).
query(true_val(sizes_below_150_stiffness, women_friendly_softer)).
query(true_val(sizes_below_150_stiffness, unk_sizes_below_150_stiffness)).

0.88::acc(s4, shape).
0.85::acc(s6, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.925

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).

measured(s4, shape, true_twin).
measured(s6, shape, true_twin).

all_consistent(shape) :-
    (indep(s4), consistent(s4, shape) ; \+indep(s4)),
    (indep(s6), consistent(s6, shape) ; \+indep(s6)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

0.90::acc(s6, camber_type).
0.82::acc(s53, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values traditional_camber=Traditional_Camber_full_length unk_camber_type=Unknown
% @importance 0.9

0.95::true_val(camber_type, traditional_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s6, camber_type, traditional_camber).
measured(s53, camber_type, traditional_camber).

all_consistent(camber_type) :-
    (indep(s6), consistent(s6, camber_type) ; \+indep(s6)),
    consistent(s53, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, traditional_camber)).
query(true_val(camber_type, unk_camber_type)).

0.88::acc(s24, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values most_aggressive=Most_aggressive_camber_unmatched_power_response_edge_control unk_camber_description=Unknown
% @importance 0.95

0.88::true_val(camber_description, most_aggressive); 0.12::true_val(camber_description, unk_camber_description).

measured(s24, camber_description, most_aggressive).

all_consistent(camber_description) :-
    (indep(s24), consistent(s24, camber_description) ; \+indep(s24)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, most_aggressive)).
query(true_val(camber_description, unk_camber_description)).

0.88::acc(s11, camber_height_mm).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v7=7.0 unk_camber_height_mm=Unknown
% @importance 0.9

0.82::true_val(camber_height_mm, v7); 0.18::true_val(camber_height_mm, unk_camber_height_mm).

measured(s11, camber_height_mm, v7).

all_consistent(camber_height_mm) :-
    consistent(s11, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v7)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

0.93::acc(s_merchant, setback).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 0.85

0.93::true_val(setback, v0); 0.07::true_val(setback, unk_setback).

measured(s_merchant, setback, v0).

all_consistent(setback) :-
    (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

0.88::acc(s24, flex_rating_10_manufacturer).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v4_5=4.5 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.95

0.90::true_val(flex_rating_10_manufacturer, v4_5); 0.10::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s24, flex_rating_10_manufacturer, v4_5).

all_consistent(flex_rating_10_manufacturer) :-
    (indep(s24), consistent(s24, flex_rating_10_manufacturer) ; \+indep(s24)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v4_5)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

0.85::acc(s22, flex_rating_10).
0.88::acc(s24, flex_rating_10).

% @attr flex_rating_10
% @type categorical
% @canonical true
% @original_name flex_rating_10
% @values v4_5=4.5 v3_to_6=3-6_range_varies_by_size unk_flex_rating_10=Unknown
% @importance 0.85

0.45::true_val(flex_rating_10, v4_5); 0.50::true_val(flex_rating_10, v3_to_6); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s24, flex_rating_10, v4_5).
measured(s22, flex_rating_10, v3_to_6).

all_consistent(flex_rating_10) :-
    (indep(s24), consistent(s24, flex_rating_10) ; \+indep(s24)),
    (indep(s22), consistent(s22, flex_rating_10) ; \+indep(s22)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4_5)).
query(true_val(flex_rating_10, v3_to_6)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.88::acc(s4, flex_direction).
0.90::acc(s_merchant, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_flex_symmetrical=Twin_Flex_Symmetrical unk_flex_direction=Unknown
% @importance 0.85

0.93::true_val(flex_direction, twin_flex_symmetrical); 0.07::true_val(flex_direction, unk_flex_direction).

measured(s4, flex_direction, twin_flex_symmetrical).
measured(s_merchant, flex_direction, twin_flex_symmetrical).

all_consistent(flex_direction) :-
    (indep(s4), consistent(s4, flex_direction) ; \+indep(s4)),
    (indep(s_merchant), consistent(s_merchant, flex_direction) ; \+indep(s_merchant)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex_symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

0.88::acc(s11, flex_feel).
0.80::acc(s27, flex_feel).
0.75::acc(s44, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_6_5=Medium_6_5_out_of_10 medium_stiff=Medium_Stiff unk_flex_feel=Unknown
% @importance 0.8

0.45::true_val(flex_feel, medium_6_5); 0.50::true_val(flex_feel, medium_stiff); 0.05::true_val(flex_feel, unk_flex_feel).

measured(s11, flex_feel, medium_6_5).
measured(s27, flex_feel, medium_stiff).
measured(s44, flex_feel, medium_6_5).

all_consistent(flex_feel) :-
    consistent(s11, flex_feel),
    consistent(s27, flex_feel),
    consistent(s44, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_6_5)).
query(true_val(flex_feel, medium_stiff)).
query(true_val(flex_feel, unk_flex_feel)).

0.88::acc(s6, core_material).
0.87::acc(s21, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G unk_core_material=Unknown
% @importance 0.95

0.95::true_val(core_material, super_fly_ii_700g); 0.05::true_val(core_material, unk_core_material).

measured(s6, core_material, super_fly_ii_700g).
measured(s21, core_material, super_fly_ii_700g).

all_consistent(core_material) :-
    (indep(s6), consistent(s6, core_material) ; \+indep(s6)),
    (indep(s21), consistent(s21, core_material) ; \+indep(s21)).

evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

0.87::acc(s21, core_material_dualzone_egd).

% @attr core_material_dualzone_egd
% @type categorical
% @canonical false
% @original_name core_material (Dualzone EGD)
% @values dualzone_egd=Dualzone_EGD_perpendicular_wood_grain_edge_hold unk_core_material_dualzone_egd=Unknown
% @importance 0.95

0.87::true_val(core_material_dualzone_egd, dualzone_egd); 0.13::true_val(core_material_dualzone_egd, unk_core_material_dualzone_egd).

measured(s21, core_material_dualzone_egd, dualzone_egd).

all_consistent(core_material_dualzone_egd) :-
    (indep(s21), consistent(s21, core_material_dualzone_egd) ; \+indep(s21)).

evidence(all_consistent(core_material_dualzone_egd)).
query(true_val(core_material_dualzone_egd, dualzone_egd)).
query(true_val(core_material_dualzone_egd, unk_core_material_dualzone_egd)).

0.87::acc(s21, core_material_squeezebox).

% @attr core_material_squeezebox
% @type categorical
% @canonical false
% @original_name core_material (Squeezebox)
% @values squeezebox=Squeezebox_variable_thickness_core_for_pop unk_core_material_squeezebox=Unknown
% @importance 0.95

0.87::true_val(core_material_squeezebox, squeezebox); 0.13::true_val(core_material_squeezebox, unk_core_material_squeezebox).

measured(s21, core_material_squeezebox, squeezebox).

all_consistent(core_material_squeezebox) :-
    (indep(s21), consistent(s21, core_material_squeezebox) ; \+indep(s21)).

evidence(all_consistent(core_material_squeezebox)).
query(true_val(core_material_squeezebox, squeezebox)).
query(true_val(core_material_squeezebox, unk_core_material_squeezebox)).

0.87::acc(s21, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_fiberglass=Triax_Fiberglass unk_laminate=Unknown
% @importance 0.95

0.87::true_val(laminate, triax_fiberglass); 0.13::true_val(laminate, unk_laminate).

measured(s21, laminate, triax_fiberglass).

all_consistent(laminate) :-
    (indep(s21), consistent(s21, laminate) ; \+indep(s21)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_fiberglass)).
query(true_val(laminate, unk_laminate)).

0.87::acc(s21, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_i_beam=Carbon_I_Beam_ultra_light_carbon_backbone unk_construction_material_innovation=Unknown
% @importance 0.95

0.87::true_val(construction_material_innovation, carbon_i_beam); 0.13::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s21, construction_material_innovation, carbon_i_beam).

all_consistent(construction_material_innovation) :-
    (indep(s21), consistent(s21, construction_material_innovation) ; \+indep(s21)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_i_beam)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.60::acc(s_inferred, construction_type).

% @attr construction_type
% @type categorical
% @canonical false
% @original_name Construction type
% @values sandwich=Sandwich unk_construction_type=Unknown
% @importance 0.7

0.60::true_val(construction_type, sandwich); 0.40::true_val(construction_type, unk_construction_type).

measured(s_inferred, construction_type, sandwich).

0.50::acc(s_inferred, construction_type).

all_consistent(construction_type) :-
    consistent(s_inferred, construction_type).

evidence(all_consistent(construction_type)).
query(true_val(construction_type, sandwich)).
query(true_val(construction_type, unk_construction_type)).

0.85::acc(s21, resin).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based_50pct_less_carbon unk_resin=Unknown
% @importance 0.95

0.87::true_val(resin, super_sap_epoxy); 0.13::true_val(resin, unk_resin).

measured(s21, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(s21), consistent(s21, resin) ; \+indep(s21)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

0.87::acc(s21, base_material).
0.82::acc(s18, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values recycled_sintered_wfo=Recycled_Sintered_WFO unk_base_material=Unknown
% @importance 0.925

0.95::true_val(base_material, recycled_sintered_wfo); 0.05::true_val(base_material, unk_base_material).

measured(s21, base_material, recycled_sintered_wfo).
measured(s18, base_material, recycled_sintered_wfo).

all_consistent(base_material) :-
    (indep(s21), consistent(s21, base_material) ; \+indep(s21)),
    (indep(s18), consistent(s18, base_material) ; \+indep(s18)).

evidence(all_consistent(base_material)).
query(true_val(base_material, recycled_sintered_wfo)).
query(true_val(base_material, unk_base_material)).

0.85::acc(s21, construction_material_innovation_infinite_ride).

% @attr construction_material_innovation_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Infinite Ride)
% @values infinite_ride=Infinite_Ride_pre_broken_in_consistent_performance unk_construction_material_innovation_infinite_ride=Unknown
% @importance 0.95

0.85::true_val(construction_material_innovation_infinite_ride, infinite_ride); 0.15::true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride).

measured(s21, construction_material_innovation_infinite_ride, infinite_ride).

all_consistent(construction_material_innovation_infinite_ride) :-
    (indep(s21), consistent(s21, construction_material_innovation_infinite_ride) ; \+indep(s21)).

evidence(all_consistent(construction_material_innovation_infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, unk_construction_material_innovation_infinite_ride)).

0.85::acc(s21, construction_material_innovation_pro_tip).

% @attr construction_material_innovation_pro_tip
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Pro-Tip)
% @values pro_tip=Pro_Tip_reduced_swing_weight_mobility unk_construction_material_innovation_pro_tip=Unknown
% @importance 0.95

0.85::true_val(construction_material_innovation_pro_tip, pro_tip); 0.15::true_val(construction_material_innovation_pro_tip, unk_construction_material_innovation_pro_tip).

measured(s21, construction_material_innovation_pro_tip, pro_tip).

all_consistent(construction_material_innovation_pro_tip) :-
    (indep(s21), consistent(s21, construction_material_innovation_pro_tip) ; \+indep(s21)).

evidence(all_consistent(construction_material_innovation_pro_tip)).
query(true_val(construction_material_innovation_pro_tip, pro_tip)).
query(true_val(construction_material_innovation_pro_tip, unk_construction_material_innovation_pro_tip)).

0.88::acc(s24, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges_enhanced_edge_hold_hardpack_ice unk_edge_technology=Unknown
% @importance 0.95

0.88::true_val(edge_technology, frostbite_edges); 0.12::true_val(edge_technology, unk_edge_technology).

measured(s24, edge_technology, frostbite_edges).

all_consistent(edge_technology) :-
    (indep(s24), consistent(s24, edge_technology) ; \+indep(s24)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_technology)).

0.88::acc(s4, mounting_pattern).
0.88::acc(s24, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_compatible_all_major_bindings unk_mounting_pattern=Unknown
% @importance 0.925

0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s4, mounting_pattern, the_channel).
measured(s24, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    (indep(s4), consistent(s4, mounting_pattern) ; \+indep(s4)),
    (indep(s24), consistent(s24, mounting_pattern) ; \+indep(s24)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.78::acc(s45, factory_tuning).

% @attr factory_tuning
% @type categorical
% @canonical false
% @original_name Factory tuning
% @values waxed_ready=Waxed_and_ready_from_factory unk_factory_tuning=Unknown
% @importance 0.5

0.78::true_val(factory_tuning, waxed_ready); 0.22::true_val(factory_tuning, unk_factory_tuning).

measured(s45, factory_tuning, waxed_ready).

all_consistent(factory_tuning) :-
    (indep(s45), consistent(s45, factory_tuning) ; \+indep(s45)).

evidence(all_consistent(factory_tuning)).
query(true_val(factory_tuning, waxed_ready)).
query(true_val(factory_tuning, unk_factory_tuning)).

0.85::acc(s21, sustainability_certification_materials).

% @attr sustainability_certification_materials
% @type categorical
% @canonical false
% @original_name sustainability_certification (materials)
% @values super_sap_recycled_base=Super_Sap_Epoxy_and_Recycled_Sintered_base unk_sustainability_certification_materials=Unknown
% @importance 0.95

0.85::true_val(sustainability_certification_materials, super_sap_recycled_base); 0.15::true_val(sustainability_certification_materials, unk_sustainability_certification_materials).

measured(s21, sustainability_certification_materials, super_sap_recycled_base).

all_consistent(sustainability_certification_materials) :-
    (indep(s21), consistent(s21, sustainability_certification_materials) ; \+indep(s21)).

evidence(all_consistent(sustainability_certification_materials)).
query(true_val(sustainability_certification_materials, super_sap_recycled_base)).
query(true_val(sustainability_certification_materials, unk_sustainability_certification_materials)).

0.93::acc(s_merchant, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=144_149_152_155_158_162cm unk_available_sizes=Unknown
% @importance 0.85

0.93::true_val(available_sizes, six_sizes); 0.07::true_val(available_sizes, unk_available_sizes).

measured(s_merchant, available_sizes, six_sizes).

all_consistent(available_sizes) :-
    (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

0.88::acc(s67, no_wide_version).

% @attr no_wide_version
% @type categorical
% @canonical false
% @original_name No wide version available
% @values confirmed=No_wide_version_available unk_no_wide_version=Unknown
% @importance 0.7

0.78::true_val(no_wide_version, confirmed); 0.22::true_val(no_wide_version, unk_no_wide_version).

measured(s67, no_wide_version, confirmed).

all_consistent(no_wide_version) :-
    consistent(s67, no_wide_version).

evidence(all_consistent(no_wide_version)).
query(true_val(no_wide_version, confirmed)).
query(true_val(no_wide_version, unk_no_wide_version)).

0.93::acc(s_merchant, effective_edge_144).

% @attr effective_edge_144
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 144cm
% @values v107_5=107.5 unk_effective_edge_144=Unknown
% @importance 0.85

0.93::true_val(effective_edge_144, v107_5); 0.07::true_val(effective_edge_144, unk_effective_edge_144).

measured(s_merchant, effective_edge_144, v107_5).

all_consistent(effective_edge_144) :- (indep(s_merchant), consistent(s_merchant, effective_edge_144) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_144)).
query(true_val(effective_edge_144, v107_5)).
query(true_val(effective_edge_144, unk_effective_edge_144)).

0.93::acc(s_merchant, sidecut_radius_size_144).

% @attr sidecut_radius_size_144
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (144cm)
% @values v7_0=7.0 unk_sidecut_radius_size_144=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_144, v7_0); 0.07::true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144).

measured(s_merchant, sidecut_radius_size_144, v7_0).

all_consistent(sidecut_radius_size_144) :- (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_144) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_144)).
query(true_val(sidecut_radius_size_144, v7_0)).
query(true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144)).

0.93::acc(s_merchant, tip_tail_width_size_144).

% @attr tip_tail_width_size_144
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (144cm)
% @values v27_8=27.8 unk_tip_tail_width_size_144=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_144, v27_8); 0.07::true_val(tip_tail_width_size_144, unk_tip_tail_width_size_144).

measured(s_merchant, tip_tail_width_size_144, v27_8).

all_consistent(tip_tail_width_size_144) :- (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_144) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_144)).
query(true_val(tip_tail_width_size_144, v27_8)).
query(true_val(tip_tail_width_size_144, unk_tip_tail_width_size_144)).

0.93::acc(s_merchant, waist_width_144).

% @attr waist_width_144
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 144cm
% @values v24_0=24.0 unk_waist_width_144=Unknown
% @importance 0.85

0.93::true_val(waist_width_144, v24_0); 0.07::true_val(waist_width_144, unk_waist_width_144).

measured(s_merchant, waist_width_144, v24_0).

all_consistent(waist_width_144) :- (indep(s_merchant), consistent(s_merchant, waist_width_144) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_144)).
query(true_val(waist_width_144, v24_0)).
query(true_val(waist_width_144, unk_waist_width_144)).

0.93::acc(s_merchant, stance_width_range_size_144).

% @attr stance_width_range_size_144
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (144cm)
% @values v50_5=50.5 unk_stance_width_range_size_144=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_144, v50_5); 0.07::true_val(stance_width_range_size_144, unk_stance_width_range_size_144).

measured(s_merchant, stance_width_range_size_144, v50_5).

all_consistent(stance_width_range_size_144) :- (indep(s_merchant), consistent(s_merchant, stance_width_range_size_144) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_144)).
query(true_val(stance_width_range_size_144, v50_5)).
query(true_val(stance_width_range_size_144, unk_stance_width_range_size_144)).

0.93::acc(s_merchant, recommended_weight_range_size_144).
0.85::acc(s11, recommended_weight_range_size_144).

% @attr recommended_weight_range_size_144
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (144cm)
% @values w45_68=45-68kg unk_recommended_weight_range_size_144=Unknown
% @importance 0.875

0.95::true_val(recommended_weight_range_size_144, w45_68); 0.05::true_val(recommended_weight_range_size_144, unk_recommended_weight_range_size_144).

measured(s_merchant, recommended_weight_range_size_144, w45_68).
measured(s11, recommended_weight_range_size_144, w45_68).

all_consistent(recommended_weight_range_size_144) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_144) ; \+indep(s_merchant)), consistent(s11, recommended_weight_range_size_144).

evidence(all_consistent(recommended_weight_range_size_144)).
query(true_val(recommended_weight_range_size_144, w45_68)).
query(true_val(recommended_weight_range_size_144, unk_recommended_weight_range_size_144)).

0.93::acc(s_merchant, effective_edge_149).

% @attr effective_edge_149
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 149cm
% @values v112_5=112.5 unk_effective_edge_149=Unknown
% @importance 0.85

0.93::true_val(effective_edge_149, v112_5); 0.07::true_val(effective_edge_149, unk_effective_edge_149).

measured(s_merchant, effective_edge_149, v112_5).

all_consistent(effective_edge_149) :- (indep(s_merchant), consistent(s_merchant, effective_edge_149) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v112_5)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

0.93::acc(s_merchant, sidecut_radius_size_149).

% @attr sidecut_radius_size_149
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (149cm)
% @values v7_3=7.3 unk_sidecut_radius_size_149=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_149, v7_3); 0.07::true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149).

measured(s_merchant, sidecut_radius_size_149, v7_3).

all_consistent(sidecut_radius_size_149) :- (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_149) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_149)).
query(true_val(sidecut_radius_size_149, v7_3)).
query(true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149)).

0.93::acc(s_merchant, tip_tail_width_size_149).

% @attr tip_tail_width_size_149
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (149cm)
% @values v28_4=28.4 unk_tip_tail_width_size_149=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_149, v28_4); 0.07::true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149).

measured(s_merchant, tip_tail_width_size_149, v28_4).

all_consistent(tip_tail_width_size_149) :- (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_149) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_149)).
query(true_val(tip_tail_width_size_149, v28_4)).
query(true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149)).

0.93::acc(s_merchant, waist_width_149).

% @attr waist_width_149
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 149cm
% @values v24_4=24.4 unk_waist_width_149=Unknown
% @importance 0.85

0.93::true_val(waist_width_149, v24_4); 0.07::true_val(waist_width_149, unk_waist_width_149).

measured(s_merchant, waist_width_149, v24_4).

all_consistent(waist_width_149) :- (indep(s_merchant), consistent(s_merchant, waist_width_149) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v24_4)).
query(true_val(waist_width_149, unk_waist_width_149)).

0.93::acc(s_merchant, stance_width_range_size_149).

% @attr stance_width_range_size_149
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (149cm)
% @values v53_0=53.0 unk_stance_width_range_size_149=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_149, v53_0); 0.07::true_val(stance_width_range_size_149, unk_stance_width_range_size_149).

measured(s_merchant, stance_width_range_size_149, v53_0).

all_consistent(stance_width_range_size_149) :- (indep(s_merchant), consistent(s_merchant, stance_width_range_size_149) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_149)).
query(true_val(stance_width_range_size_149, v53_0)).
query(true_val(stance_width_range_size_149, unk_stance_width_range_size_149)).

0.93::acc(s_merchant, recommended_weight_range_size_149).

% @attr recommended_weight_range_size_149
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (149cm)
% @values w45_68=45-68kg unk_recommended_weight_range_size_149=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_149, w45_68); 0.07::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).

measured(s_merchant, recommended_weight_range_size_149, w45_68).

all_consistent(recommended_weight_range_size_149) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_149) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, w45_68)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

0.93::acc(s_merchant, effective_edge_152).

% @attr effective_edge_152
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 152cm
% @values v115_5=115.5 unk_effective_edge_152=Unknown
% @importance 0.85

0.93::true_val(effective_edge_152, v115_5); 0.07::true_val(effective_edge_152, unk_effective_edge_152).

measured(s_merchant, effective_edge_152, v115_5).

all_consistent(effective_edge_152) :- (indep(s_merchant), consistent(s_merchant, effective_edge_152) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v115_5)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

0.93::acc(s_merchant, sidecut_radius_size_152).

% @attr sidecut_radius_size_152
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (152cm)
% @values v7_5=7.5 unk_sidecut_radius_size_152=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_152, v7_5); 0.07::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

measured(s_merchant, sidecut_radius_size_152, v7_5).

all_consistent(sidecut_radius_size_152) :- (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_152) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v7_5)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

0.93::acc(s_merchant, tip_tail_width_size_152).

% @attr tip_tail_width_size_152
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (152cm)
% @values v29_0=29.0 unk_tip_tail_width_size_152=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_152, v29_0); 0.07::true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152).

measured(s_merchant, tip_tail_width_size_152, v29_0).

all_consistent(tip_tail_width_size_152) :- (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_152) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, v29_0)).
query(true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152)).

0.93::acc(s_merchant, waist_width_152).

% @attr waist_width_152
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 152cm
% @values v24_9=24.9 unk_waist_width_152=Unknown
% @importance 0.85

0.93::true_val(waist_width_152, v24_9); 0.07::true_val(waist_width_152, unk_waist_width_152).

measured(s_merchant, waist_width_152, v24_9).

all_consistent(waist_width_152) :- (indep(s_merchant), consistent(s_merchant, waist_width_152) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v24_9)).
query(true_val(waist_width_152, unk_waist_width_152)).

0.93::acc(s_merchant, stance_width_range_size_152).

% @attr stance_width_range_size_152
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (152cm)
% @values v53_0=53.0 unk_stance_width_range_size_152=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_152, v53_0); 0.07::true_val(stance_width_range_size_152, unk_stance_width_range_size_152).

measured(s_merchant, stance_width_range_size_152, v53_0).

all_consistent(stance_width_range_size_152) :- (indep(s_merchant), consistent(s_merchant, stance_width_range_size_152) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_152)).
query(true_val(stance_width_range_size_152, v53_0)).
query(true_val(stance_width_range_size_152, unk_stance_width_range_size_152)).

0.93::acc(s_merchant, recommended_weight_range_size_152).

% @attr recommended_weight_range_size_152
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (152cm)
% @values w54_82=54-82kg unk_recommended_weight_range_size_152=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_152, w54_82); 0.07::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(s_merchant, recommended_weight_range_size_152, w54_82).

all_consistent(recommended_weight_range_size_152) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_152) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, w54_82)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

0.93::acc(s_merchant, effective_edge_155).

% @attr effective_edge_155
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 155cm
% @values v118_5=118.5 unk_effective_edge_155=Unknown
% @importance 0.85

0.93::true_val(effective_edge_155, v118_5); 0.07::true_val(effective_edge_155, unk_effective_edge_155).

measured(s_merchant, effective_edge_155, v118_5).

all_consistent(effective_edge_155) :- (indep(s_merchant), consistent(s_merchant, effective_edge_155) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v118_5)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

0.93::acc(s_merchant, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size (155cm)
% @values v7_7=7.7 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size, v7_7); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_merchant, sidecut_radius_size, v7_7).

all_consistent(sidecut_radius_size) :- (indep(s_merchant), consistent(s_merchant, sidecut_radius_size) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_7)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.93::acc(s_merchant, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size (155cm)
% @values v29_3=29.3 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size, v29_3); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_merchant, tip_tail_width_size, v29_3).

all_consistent(tip_tail_width_size) :- (indep(s_merchant), consistent(s_merchant, tip_tail_width_size) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_3)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.93::acc(s_merchant, waist_width_155).

% @attr waist_width_155
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 155cm
% @values v25_1=25.1 unk_waist_width_155=Unknown
% @importance 0.85

0.93::true_val(waist_width_155, v25_1); 0.07::true_val(waist_width_155, unk_waist_width_155).

measured(s_merchant, waist_width_155, v25_1).

all_consistent(waist_width_155) :- (indep(s_merchant), consistent(s_merchant, waist_width_155) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_1)).
query(true_val(waist_width_155, unk_waist_width_155)).

0.93::acc(s_merchant, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size (155cm)
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size, v56_0); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_merchant, stance_width_range_size, v56_0).

all_consistent(stance_width_range_size) :- (indep(s_merchant), consistent(s_merchant, stance_width_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.93::acc(s_merchant, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (155cm)
% @values w54_82=54-82kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size, w54_82); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_merchant, recommended_weight_range_size, w54_82).

all_consistent(recommended_weight_range_size) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w54_82)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.93::acc(s_merchant, effective_edge_158).

% @attr effective_edge_158
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 158cm
% @values v121_5=121.5 unk_effective_edge_158=Unknown
% @importance 0.85

0.93::true_val(effective_edge_158, v121_5); 0.07::true_val(effective_edge_158, unk_effective_edge_158).

measured(s_merchant, effective_edge_158, v121_5).

all_consistent(effective_edge_158) :- (indep(s_merchant), consistent(s_merchant, effective_edge_158) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v121_5)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

0.93::acc(s_merchant, sidecut_radius_size_158).

% @attr sidecut_radius_size_158
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (158cm)
% @values v7_9=7.9 unk_sidecut_radius_size_158=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_158, v7_9); 0.07::true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158).

measured(s_merchant, sidecut_radius_size_158, v7_9).

all_consistent(sidecut_radius_size_158) :- (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_158) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v7_9)).
query(true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158)).

0.93::acc(s_merchant, tip_tail_width_size_158).

% @attr tip_tail_width_size_158
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (158cm)
% @values v29_7=29.7 unk_tip_tail_width_size_158=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_158, v29_7); 0.07::true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158).

measured(s_merchant, tip_tail_width_size_158, v29_7).

all_consistent(tip_tail_width_size_158) :- (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_158) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_158)).
query(true_val(tip_tail_width_size_158, v29_7)).
query(true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158)).

0.93::acc(s_merchant, waist_width_158).

% @attr waist_width_158
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 158cm
% @values v25_4=25.4 unk_waist_width_158=Unknown
% @importance 0.85

0.93::true_val(waist_width_158, v25_4); 0.07::true_val(waist_width_158, unk_waist_width_158).

measured(s_merchant, waist_width_158, v25_4).

all_consistent(waist_width_158) :- (indep(s_merchant), consistent(s_merchant, waist_width_158) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v25_4)).
query(true_val(waist_width_158, unk_waist_width_158)).

0.93::acc(s_merchant, stance_width_range_size_158).

% @attr stance_width_range_size_158
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (158cm)
% @values v56_0=56.0 unk_stance_width_range_size_158=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_158, v56_0); 0.07::true_val(stance_width_range_size_158, unk_stance_width_range_size_158).

measured(s_merchant, stance_width_range_size_158, v56_0).

all_consistent(stance_width_range_size_158) :- (indep(s_merchant), consistent(s_merchant, stance_width_range_size_158) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_158)).
query(true_val(stance_width_range_size_158, v56_0)).
query(true_val(stance_width_range_size_158, unk_stance_width_range_size_158)).

0.93::acc(s_merchant, recommended_weight_range_size_158).

% @attr recommended_weight_range_size_158
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (158cm)
% @values w68_91=68-91kg unk_recommended_weight_range_size_158=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_158, w68_91); 0.07::true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158).

measured(s_merchant, recommended_weight_range_size_158, w68_91).

all_consistent(recommended_weight_range_size_158) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_158) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, w68_91)).
query(true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158)).

0.93::acc(s_merchant, effective_edge_162).

% @attr effective_edge_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 162cm
% @values v125_5=125.5 unk_effective_edge_162=Unknown
% @importance 0.85

0.93::true_val(effective_edge_162, v125_5); 0.07::true_val(effective_edge_162, unk_effective_edge_162).

measured(s_merchant, effective_edge_162, v125_5).

all_consistent(effective_edge_162) :- (indep(s_merchant), consistent(s_merchant, effective_edge_162) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v125_5)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

0.93::acc(s_merchant, sidecut_radius_size_162).

% @attr sidecut_radius_size_162
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @values v8_2=8.2 unk_sidecut_radius_size_162=Unknown
% @importance 0.85

0.93::true_val(sidecut_radius_size_162, v8_2); 0.07::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).

measured(s_merchant, sidecut_radius_size_162, v8_2).

all_consistent(sidecut_radius_size_162) :- (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_162) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_2)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

0.93::acc(s_merchant, tip_tail_width_size_162).

% @attr tip_tail_width_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (162cm)
% @values v30_3=30.3 unk_tip_tail_width_size_162=Unknown
% @importance 0.85

0.93::true_val(tip_tail_width_size_162, v30_3); 0.07::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).

measured(s_merchant, tip_tail_width_size_162, v30_3).

all_consistent(tip_tail_width_size_162) :- (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_162) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v30_3)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

0.93::acc(s_merchant, waist_width_162).

% @attr waist_width_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162cm
% @values v25_8=25.8 unk_waist_width_162=Unknown
% @importance 0.85

0.93::true_val(waist_width_162, v25_8); 0.07::true_val(waist_width_162, unk_waist_width_162).

measured(s_merchant, waist_width_162, v25_8).

all_consistent(waist_width_162) :- (indep(s_merchant), consistent(s_merchant, waist_width_162) ; \+indep(s_merchant)).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v25_8)).
query(true_val(waist_width_162, unk_waist_width_162)).

0.93::acc(s_merchant, stance_width_range_size_162).

% @attr stance_width_range_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (162cm)
% @values v56_0=56.0 unk_stance_width_range_size_162=Unknown
% @importance 0.85

0.93::true_val(stance_width_range_size_162, v56_0); 0.07::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).

measured(s_merchant, stance_width_range_size_162, v56_0).

all_consistent(stance_width_range_size_162) :- (indep(s_merchant), consistent(s_merchant, stance_width_range_size_162) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v56_0)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

0.93::acc(s_merchant, recommended_weight_range_size_162).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @values w82_118plus=82-118+kg unk_recommended_weight_range_size_162=Unknown
% @importance 0.85

0.93::true_val(recommended_weight_range_size_162, w82_118plus); 0.07::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).

measured(s_merchant, recommended_weight_range_size_162, w82_118plus).

all_consistent(recommended_weight_range_size_162) :- (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_162) ; \+indep(s_merchant)).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w82_118plus)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

0.90::acc(s11, board_weight_grams).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2900=2900.0 unk_board_weight_grams=Unknown
% @importance 0.9

0.82::true_val(board_weight_grams, v2900); 0.18::true_val(board_weight_grams, unk_board_weight_grams).

measured(s11, board_weight_grams, v2900).

all_consistent(board_weight_grams) :-
    consistent(s11, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2900)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.85::acc(s11, weight_per_cm).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical true
% @original_name weight_per_cm
% @values v18_35=18.35 v18_58=18.58 unk_weight_per_cm=Unknown
% @importance 0.9

0.45::true_val(weight_per_cm, v18_35); 0.50::true_val(weight_per_cm, v18_58); 0.05::true_val(weight_per_cm, unk_weight_per_cm).

measured(s11, weight_per_cm, v18_35).
measured(s11, weight_per_cm, v18_58).

all_consistent(weight_per_cm) :-
    consistent(s11, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v18_35)).
query(true_val(weight_per_cm, v18_58)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

0.80::acc(s11, board_weight_grams_prior).

% @attr board_weight_grams_prior
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams (prior model)
% @values v3020=3020.0 unk_board_weight_grams_prior=Unknown
% @importance 0.9

0.78::true_val(board_weight_grams_prior, v3020); 0.22::true_val(board_weight_grams_prior, unk_board_weight_grams_prior).

measured(s11, board_weight_grams_prior, v3020).

all_consistent(board_weight_grams_prior) :-
    consistent(s11, board_weight_grams_prior).

evidence(all_consistent(board_weight_grams_prior)).
query(true_val(board_weight_grams_prior, v3020)).
query(true_val(board_weight_grams_prior, unk_board_weight_grams_prior)).

0.75::acc(s17, reviewer_opinion_weight).

% @attr reviewer_opinion_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (weight)
% @values little_heavier_avg=A_little_heavier_than_average unk_reviewer_opinion_weight=Unknown
% @importance 0.8

0.75::true_val(reviewer_opinion_weight, little_heavier_avg); 0.25::true_val(reviewer_opinion_weight, unk_reviewer_opinion_weight).

measured(s17, reviewer_opinion_weight, little_heavier_avg).

all_consistent(reviewer_opinion_weight) :-
    consistent(s17, reviewer_opinion_weight).

evidence(all_consistent(reviewer_opinion_weight)).
query(true_val(reviewer_opinion_weight, little_heavier_avg)).
query(true_val(reviewer_opinion_weight, unk_reviewer_opinion_weight)).

0.80::acc(s11, board_weight_grams_comparison).

% @attr board_weight_grams_comparison
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams (Free Thinker comparison)
% @values v2680=2680.0 unk_board_weight_grams_comparison=Unknown
% @importance 0.9

0.78::true_val(board_weight_grams_comparison, v2680); 0.22::true_val(board_weight_grams_comparison, unk_board_weight_grams_comparison).

measured(s11, board_weight_grams_comparison, v2680).

all_consistent(board_weight_grams_comparison) :-
    consistent(s11, board_weight_grams_comparison).

evidence(all_consistent(board_weight_grams_comparison)).
query(true_val(board_weight_grams_comparison, v2680)).
query(true_val(board_weight_grams_comparison, unk_board_weight_grams_comparison)).

0.88::acc(s11, overall_rating_snowboardingprofiles).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v87_2=87.2 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.9

0.82::true_val(overall_rating_snowboardingprofiles, v87_2); 0.18::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s11, overall_rating_snowboardingprofiles, v87_2).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s11, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v87_2)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

0.85::acc(s11, reviewer_opinion_snowboardingprofiles).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name SnowboardingProfiles ranking
% @values rank_7_of_33=7th_out_of_33_all_mountain_freestyle unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.9

0.82::true_val(reviewer_opinion_snowboardingprofiles, rank_7_of_33); 0.18::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s11, reviewer_opinion_snowboardingprofiles, rank_7_of_33).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s11, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, rank_7_of_33)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

0.90::acc(s11, jumps_rating_tgr).

% @attr jumps_rating_tgr
% @type numeric
% @unit /5
% @canonical true
% @original_name jumps_rating_tgr
% @values v4_5=4.5 unk_jumps_rating_tgr=Unknown
% @importance 0.9

0.82::true_val(jumps_rating_tgr, v4_5); 0.18::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s11, jumps_rating_tgr, v4_5).

all_consistent(jumps_rating_tgr) :-
    consistent(s11, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, v4_5)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

0.90::acc(s11, carving_score_snowboardingprofiles).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v4=4.0 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.9

0.82::true_val(carving_score_snowboardingprofiles, v4); 0.18::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s11, carving_score_snowboardingprofiles, v4).

all_consistent(carving_score_snowboardingprofiles) :-
    consistent(s11, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v4)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

0.90::acc(s11, switch_rating_snowboardingprofiles).

% @attr switch_rating_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles switch rating
% @values v4_5=4.5 unk_switch_rating_snowboardingprofiles=Unknown
% @importance 0.9

0.82::true_val(switch_rating_snowboardingprofiles, v4_5); 0.18::true_val(switch_rating_snowboardingprofiles, unk_switch_rating_snowboardingprofiles).

measured(s11, switch_rating_snowboardingprofiles, v4_5).

all_consistent(switch_rating_snowboardingprofiles) :-
    consistent(s11, switch_rating_snowboardingprofiles).

evidence(all_consistent(switch_rating_snowboardingprofiles)).
query(true_val(switch_rating_snowboardingprofiles, v4_5)).
query(true_val(switch_rating_snowboardingprofiles, unk_switch_rating_snowboardingprofiles)).

0.90::acc(s11, speed_rating_snowboardingprofiles).

% @attr speed_rating_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles speed rating
% @values v4=4.0 unk_speed_rating_snowboardingprofiles=Unknown
% @importance 0.9

0.82::true_val(speed_rating_snowboardingprofiles, v4); 0.18::true_val(speed_rating_snowboardingprofiles, unk_speed_rating_snowboardingprofiles).

measured(s11, speed_rating_snowboardingprofiles, v4).

all_consistent(speed_rating_snowboardingprofiles) :-
    consistent(s11, speed_rating_snowboardingprofiles).

evidence(all_consistent(speed_rating_snowboardingprofiles)).
query(true_val(speed_rating_snowboardingprofiles, v4)).
query(true_val(speed_rating_snowboardingprofiles, unk_speed_rating_snowboardingprofiles)).

0.90::acc(s11, spins_rating_snowboardingprofiles).

% @attr spins_rating_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles spins rating
% @values v4=4.0 unk_spins_rating_snowboardingprofiles=Unknown
% @importance 0.9

0.82::true_val(spins_rating_snowboardingprofiles, v4); 0.18::true_val(spins_rating_snowboardingprofiles, unk_spins_rating_snowboardingprofiles).

measured(s11, spins_rating_snowboardingprofiles, v4).

all_consistent(spins_rating_snowboardingprofiles) :-
    consistent(s11, spins_rating_snowboardingprofiles).

evidence(all_consistent(spins_rating_snowboardingprofiles)).
query(true_val(spins_rating_snowboardingprofiles, v4)).
query(true_val(spins_rating_snowboardingprofiles, unk_spins_rating_snowboardingprofiles)).

0.90::acc(s11, butters_rating_snowboardingprofiles).

% @attr butters_rating_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles butters rating
% @values v3_5=3.5 unk_butters_rating_snowboardingprofiles=Unknown
% @importance 0.9

0.82::true_val(butters_rating_snowboardingprofiles, v3_5); 0.18::true_val(butters_rating_snowboardingprofiles, unk_butters_rating_snowboardingprofiles).

measured(s11, butters_rating_snowboardingprofiles, v3_5).

all_consistent(butters_rating_snowboardingprofiles) :-
    consistent(s11, butters_rating_snowboardingprofiles).

evidence(all_consistent(butters_rating_snowboardingprofiles)).
query(true_val(butters_rating_snowboardingprofiles, v3_5)).
query(true_val(butters_rating_snowboardingprofiles, unk_butters_rating_snowboardingprofiles)).

0.90::acc(s11, jibbing_rating_tgr).

% @attr jibbing_rating_tgr
% @type numeric
% @unit /5
% @canonical true
% @original_name jibbing_rating_tgr
% @values v3=3.0 unk_jibbing_rating_tgr=Unknown
% @importance 0.9

0.82::true_val(jibbing_rating_tgr, v3); 0.18::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s11, jibbing_rating_tgr, v3).

all_consistent(jibbing_rating_tgr) :-
    consistent(s11, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, v3)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

0.90::acc(s11, crud_rating_snowboardingprofiles).

% @attr crud_rating_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles crud rating
% @values v4=4.0 unk_crud_rating_snowboardingprofiles=Unknown
% @importance 0.9

0.82::true_val(crud_rating_snowboardingprofiles, v4); 0.18::true_val(crud_rating_snowboardingprofiles, unk_crud_rating_snowboardingprofiles).

measured(s11, crud_rating_snowboardingprofiles, v4).

all_consistent(crud_rating_snowboardingprofiles) :-
    consistent(s11, crud_rating_snowboardingprofiles).

evidence(all_consistent(crud_rating_snowboardingprofiles)).
query(true_val(crud_rating_snowboardingprofiles, v4)).
query(true_val(crud_rating_snowboardingprofiles, unk_crud_rating_snowboardingprofiles)).

0.90::acc(s11, trees_rating_snowboardingprofiles).

% @attr trees_rating_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles trees rating
% @values v3_5=3.5 unk_trees_rating_snowboardingprofiles=Unknown
% @importance 0.9

0.82::true_val(trees_rating_snowboardingprofiles, v3_5); 0.18::true_val(trees_rating_snowboardingprofiles, unk_trees_rating_snowboardingprofiles).

measured(s11, trees_rating_snowboardingprofiles, v3_5).

all_consistent(trees_rating_snowboardingprofiles) :-
    consistent(s11, trees_rating_snowboardingprofiles).

evidence(all_consistent(trees_rating_snowboardingprofiles)).
query(true_val(trees_rating_snowboardingprofiles, v3_5)).
query(true_val(trees_rating_snowboardingprofiles, unk_trees_rating_snowboardingprofiles)).

0.90::acc(s11, powder_score_snowboardingprofiles).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v2=2.0 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.9

0.82::true_val(powder_score_snowboardingprofiles, v2); 0.18::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s11, powder_score_snowboardingprofiles, v2).

all_consistent(powder_score_snowboardingprofiles) :-
    consistent(s11, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v2)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

0.78::acc(s12, overall_rating_snowboardingprofiles_park).

% @attr overall_rating_snowboardingprofiles_park
% @type categorical
% @canonical false
% @original_name overall_rating_snowboardingprofiles (park ranking)
% @values rank_2_of_36=Ranks_2nd_out_of_36_park_boards unk_overall_rating_snowboardingprofiles_park=Unknown
% @importance 0.8

0.75::true_val(overall_rating_snowboardingprofiles_park, rank_2_of_36); 0.25::true_val(overall_rating_snowboardingprofiles_park, unk_overall_rating_snowboardingprofiles_park).

measured(s12, overall_rating_snowboardingprofiles_park, rank_2_of_36).

all_consistent(overall_rating_snowboardingprofiles_park) :-
    consistent(s12, overall_rating_snowboardingprofiles_park).

evidence(all_consistent(overall_rating_snowboardingprofiles_park)).
query(true_val(overall_rating_snowboardingprofiles_park, rank_2_of_36)).
query(true_val(overall_rating_snowboardingprofiles_park, unk_overall_rating_snowboardingprofiles_park)).

0.85::acc(s9, snowboard_mag_award).

% @attr snowboard_mag_award
% @type categorical
% @canonical false
% @original_name Snowboard Magazine award
% @values platinum_pick_2025=2025_Platinum_Pick unk_snowboard_mag_award=Unknown
% @importance 0.85

0.85::true_val(snowboard_mag_award, platinum_pick_2025); 0.15::true_val(snowboard_mag_award, unk_snowboard_mag_award).

measured(s9, snowboard_mag_award, platinum_pick_2025).

all_consistent(snowboard_mag_award) :-
    consistent(s9, snowboard_mag_award).

evidence(all_consistent(snowboard_mag_award)).
query(true_val(snowboard_mag_award, platinum_pick_2025)).
query(true_val(snowboard_mag_award, unk_snowboard_mag_award)).

0.85::acc(s9, snowboard_mag_consecutive_years).

% @attr snowboard_mag_consecutive_years
% @type categorical
% @canonical false
% @original_name Snowboard Magazine consecutive Platinum Pick years
% @values four_consecutive=4_consecutive_years unk_snowboard_mag_consecutive_years=Unknown
% @importance 0.85

0.85::true_val(snowboard_mag_consecutive_years, four_consecutive); 0.15::true_val(snowboard_mag_consecutive_years, unk_snowboard_mag_consecutive_years).

measured(s9, snowboard_mag_consecutive_years, four_consecutive).

all_consistent(snowboard_mag_consecutive_years) :-
    consistent(s9, snowboard_mag_consecutive_years).

evidence(all_consistent(snowboard_mag_consecutive_years)).
query(true_val(snowboard_mag_consecutive_years, four_consecutive)).
query(true_val(snowboard_mag_consecutive_years, unk_snowboard_mag_consecutive_years)).

0.78::acc(s44, reviewer_opinion_whitelines).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values fast_stable_smooth=Fast_stable_flexible_smooth_ride unk_reviewer_opinion_whitelines=Unknown
% @importance 0.7

0.78::true_val(reviewer_opinion_whitelines, fast_stable_smooth); 0.22::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s44, reviewer_opinion_whitelines, fast_stable_smooth).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s44, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, fast_stable_smooth)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

0.78::acc(s13, reviewer_opinion_whitelines_killroy).

% @attr reviewer_opinion_whitelines_killroy
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (Killroy comparison)
% @values juiced_up_killroy=Bigger_juiced_up_jock_brother_to_Killroy_Twin unk_reviewer_opinion_whitelines_killroy=Unknown
% @importance 0.7

0.72::true_val(reviewer_opinion_whitelines_killroy, juiced_up_killroy); 0.28::true_val(reviewer_opinion_whitelines_killroy, unk_reviewer_opinion_whitelines_killroy).

measured(s13, reviewer_opinion_whitelines_killroy, juiced_up_killroy).

all_consistent(reviewer_opinion_whitelines_killroy) :-
    consistent(s13, reviewer_opinion_whitelines_killroy).

evidence(all_consistent(reviewer_opinion_whitelines_killroy)).
query(true_val(reviewer_opinion_whitelines_killroy, juiced_up_killroy)).
query(true_val(reviewer_opinion_whitelines_killroy, unk_reviewer_opinion_whitelines_killroy)).

0.75::acc(s14, bomb_hole_testing_location).

% @attr bomb_hole_testing_location
% @type categorical
% @canonical false
% @original_name Bomb Hole testing location
% @values woodward_park_city=Woodward_Park_City_by_Stevie_Bell unk_bomb_hole_testing_location=Unknown
% @importance 0.6

0.72::true_val(bomb_hole_testing_location, woodward_park_city); 0.28::true_val(bomb_hole_testing_location, unk_bomb_hole_testing_location).

measured(s14, bomb_hole_testing_location, woodward_park_city).

all_consistent(bomb_hole_testing_location) :-
    consistent(s14, bomb_hole_testing_location).

evidence(all_consistent(bomb_hole_testing_location)).
query(true_val(bomb_hole_testing_location, woodward_park_city)).
query(true_val(bomb_hole_testing_location, unk_bomb_hole_testing_location)).

0.82::acc(s63, pop).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values excellent=Excellent_springboard_level_comparable_DOA unk_pop=Unknown
% @importance 0.75

0.80::true_val(pop, excellent); 0.20::true_val(pop, unk_pop).

measured(s63, pop, excellent).

all_consistent(pop) :-
    consistent(s63, pop).

evidence(all_consistent(pop)).
query(true_val(pop, excellent)).
query(true_val(pop, unk_pop)).

0.85::acc(s11, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values carves_great=Carves_as_good_as_any_twin unk_positive_aspect=Unknown
% @importance 0.9

0.82::true_val(positive_aspect, carves_great); 0.18::true_val(positive_aspect, unk_positive_aspect).

measured(s11, positive_aspect, carves_great).

all_consistent(positive_aspect) :-
    consistent(s11, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, carves_great)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.85::acc(s11, positive_aspect_speed_stability).

% @attr positive_aspect_speed_stability
% @type categorical
% @canonical false
% @original_name positive_aspect (speed stability)
% @values good_stable_fast=Good_and_stable_at_speed_decently_fast unk_positive_aspect_speed_stability=Unknown
% @importance 0.9

0.82::true_val(positive_aspect_speed_stability, good_stable_fast); 0.18::true_val(positive_aspect_speed_stability, unk_positive_aspect_speed_stability).

measured(s11, positive_aspect_speed_stability, good_stable_fast).

all_consistent(positive_aspect_speed_stability) :-
    consistent(s11, positive_aspect_speed_stability).

evidence(all_consistent(positive_aspect_speed_stability)).
query(true_val(positive_aspect_speed_stability, good_stable_fast)).
query(true_val(positive_aspect_speed_stability, unk_positive_aspect_speed_stability)).

0.85::acc(s11, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow_quality=Hard_Snow_quality_edge_hold unk_edge_hold=Unknown
% @importance 0.9

0.82::true_val(edge_hold, hard_snow_quality); 0.18::true_val(edge_hold, unk_edge_hold).

measured(s11, edge_hold, hard_snow_quality).

all_consistent(edge_hold) :-
    consistent(s11, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow_quality)).
query(true_val(edge_hold, unk_edge_hold)).

0.85::acc(s11, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values naturally_good=Naturally_felt_good_riding_switch unk_switch_riding=Unknown
% @importance 0.9

0.82::true_val(switch_riding, naturally_good); 0.18::true_val(switch_riding, unk_switch_riding).

measured(s11, switch_riding, naturally_good).

all_consistent(switch_riding) :-
    consistent(s11, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, naturally_good)).
query(true_val(switch_riding, unk_switch_riding)).

0.85::acc(s11, positive_aspect_landing).

% @attr positive_aspect_landing
% @type categorical
% @canonical false
% @original_name positive_aspect (landing forgiveness)
% @values stomp_landings=Can_stomp_landings_forgiving_off_kilter unk_positive_aspect_landing=Unknown
% @importance 0.9

0.82::true_val(positive_aspect_landing, stomp_landings); 0.18::true_val(positive_aspect_landing, unk_positive_aspect_landing).

measured(s11, positive_aspect_landing, stomp_landings).

all_consistent(positive_aspect_landing) :-
    consistent(s11, positive_aspect_landing).

evidence(all_consistent(positive_aspect_landing)).
query(true_val(positive_aspect_landing, stomp_landings)).
query(true_val(positive_aspect_landing, unk_positive_aspect_landing)).

0.85::acc(s11, positive_aspect_versatility).

% @attr positive_aspect_versatility
% @type numeric
% @unit /10
% @canonical false
% @original_name positive_aspect (versatility rating)
% @values v6=6.0 unk_positive_aspect_versatility=Unknown
% @importance 0.9

0.82::true_val(positive_aspect_versatility, v6); 0.18::true_val(positive_aspect_versatility, unk_positive_aspect_versatility).

measured(s11, positive_aspect_versatility, v6).

all_consistent(positive_aspect_versatility) :-
    consistent(s11, positive_aspect_versatility).

evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, v6)).
query(true_val(positive_aspect_versatility, unk_positive_aspect_versatility)).

0.85::acc(s11, positive_aspect_fun).

% @attr positive_aspect_fun
% @type numeric
% @unit /10
% @canonical false
% @original_name positive_aspect (fun rating)
% @values v7=7.0 unk_positive_aspect_fun=Unknown
% @importance 0.9

0.82::true_val(positive_aspect_fun, v7); 0.18::true_val(positive_aspect_fun, unk_positive_aspect_fun).

measured(s11, positive_aspect_fun, v7).

all_consistent(positive_aspect_fun) :-
    consistent(s11, positive_aspect_fun).

evidence(all_consistent(positive_aspect_fun)).
query(true_val(positive_aspect_fun, v7)).
query(true_val(positive_aspect_fun, unk_positive_aspect_fun)).

0.85::acc(s11, positive_aspect_aggressive).

% @attr positive_aspect_aggressive
% @type numeric
% @unit /10
% @canonical false
% @original_name positive_aspect (aggressive rating)
% @values v7=7.0 unk_positive_aspect_aggressive=Unknown
% @importance 0.9

0.82::true_val(positive_aspect_aggressive, v7); 0.18::true_val(positive_aspect_aggressive, unk_positive_aspect_aggressive).

measured(s11, positive_aspect_aggressive, v7).

all_consistent(positive_aspect_aggressive) :-
    consistent(s11, positive_aspect_aggressive).

evidence(all_consistent(positive_aspect_aggressive)).
query(true_val(positive_aspect_aggressive, v7)).
query(true_val(positive_aspect_aggressive, unk_positive_aspect_aggressive)).

0.82::acc(s18, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values ultra_fast=Sintered_WFO_ultradurable_super_fast unk_base_glide_performance=Unknown
% @importance 0.7

0.80::true_val(base_glide_performance, ultra_fast); 0.20::true_val(base_glide_performance, unk_base_glide_performance).

measured(s18, base_glide_performance, ultra_fast).

all_consistent(base_glide_performance) :-
    (indep(s18), consistent(s18, base_glide_performance) ; \+indep(s18)).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, ultra_fast)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.75::acc(s44, construction_material_innovation_ready_to_ride).

% @attr construction_material_innovation_ready_to_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Ready to Ride)
% @values pre_broken_in=Ready_to_Ride_From_Day_1_Pre_Broken_In unk_construction_material_innovation_ready_to_ride=Unknown
% @importance 0.7

0.75::true_val(construction_material_innovation_ready_to_ride, pre_broken_in); 0.25::true_val(construction_material_innovation_ready_to_ride, unk_construction_material_innovation_ready_to_ride).

measured(s44, construction_material_innovation_ready_to_ride, pre_broken_in).

all_consistent(construction_material_innovation_ready_to_ride) :-
    consistent(s44, construction_material_innovation_ready_to_ride).

evidence(all_consistent(construction_material_innovation_ready_to_ride)).
query(true_val(construction_material_innovation_ready_to_ride, pre_broken_in)).
query(true_val(construction_material_innovation_ready_to_ride, unk_construction_material_innovation_ready_to_ride)).

0.82::acc(s11, positive_aspect_quiver).

% @attr positive_aspect_quiver
% @type categorical
% @canonical false
% @original_name positive_aspect (quiver potential)
% @values one_board_quiver=Could_be_one_board_quiver_for_right_rider unk_positive_aspect_quiver=Unknown
% @importance 0.9

0.80::true_val(positive_aspect_quiver, one_board_quiver); 0.20::true_val(positive_aspect_quiver, unk_positive_aspect_quiver).

measured(s11, positive_aspect_quiver, one_board_quiver).

all_consistent(positive_aspect_quiver) :-
    consistent(s11, positive_aspect_quiver).

evidence(all_consistent(positive_aspect_quiver)).
query(true_val(positive_aspect_quiver, one_board_quiver)).
query(true_val(positive_aspect_quiver, unk_positive_aspect_quiver)).

0.80::acc(s17, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values poor_powder=Not_great_powder_floater_centered_twin_camber unk_negative_aspect=Unknown
% @importance 0.8

0.80::true_val(negative_aspect, poor_powder); 0.20::true_val(negative_aspect, unk_negative_aspect).

measured(s17, negative_aspect, poor_powder).

all_consistent(negative_aspect) :-
    consistent(s17, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, poor_powder)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.85::acc(s11, negative_aspect_butters).

% @attr negative_aspect_butters
% @type categorical
% @canonical false
% @original_name negative_aspect (butters)
% @values not_ideal_butters=Still_not_ideal_for_butters_stiff_tip_tail unk_negative_aspect_butters=Unknown
% @importance 0.9

0.82::true_val(negative_aspect_butters, not_ideal_butters); 0.18::true_val(negative_aspect_butters, unk_negative_aspect_butters).

measured(s11, negative_aspect_butters, not_ideal_butters).

all_consistent(negative_aspect_butters) :-
    consistent(s11, negative_aspect_butters).

evidence(all_consistent(negative_aspect_butters)).
query(true_val(negative_aspect_butters, not_ideal_butters)).
query(true_val(negative_aspect_butters, unk_negative_aspect_butters)).

0.80::acc(s27, negative_aspect_difficulty).

% @attr negative_aspect_difficulty
% @type categorical
% @canonical false
% @original_name negative_aspect (difficulty level)
% @values too_advanced_beginners=Beginners_intermediates_may_find_too_advanced unk_negative_aspect_difficulty=Unknown
% @importance 0.85

0.80::true_val(negative_aspect_difficulty, too_advanced_beginners); 0.20::true_val(negative_aspect_difficulty, unk_negative_aspect_difficulty).

measured(s27, negative_aspect_difficulty, too_advanced_beginners).

all_consistent(negative_aspect_difficulty) :-
    consistent(s27, negative_aspect_difficulty).

evidence(all_consistent(negative_aspect_difficulty)).
query(true_val(negative_aspect_difficulty, too_advanced_beginners)).
query(true_val(negative_aspect_difficulty, unk_negative_aspect_difficulty)).

0.78::acc(s67, negative_aspect_no_wide).

% @attr negative_aspect_no_wide
% @type categorical
% @canonical false
% @original_name negative_aspect (no wide options)
% @values no_wide=No_wide_options_available unk_negative_aspect_no_wide=Unknown
% @importance 0.7

0.72::true_val(negative_aspect_no_wide, no_wide); 0.28::true_val(negative_aspect_no_wide, unk_negative_aspect_no_wide).

measured(s67, negative_aspect_no_wide, no_wide).

all_consistent(negative_aspect_no_wide) :-
    consistent(s67, negative_aspect_no_wide).

evidence(all_consistent(negative_aspect_no_wide)).
query(true_val(negative_aspect_no_wide, no_wide)).
query(true_val(negative_aspect_no_wide, unk_negative_aspect_no_wide)).

0.82::acc(s11, negative_aspect_size_reduction).

% @attr negative_aspect_size_reduction
% @type categorical
% @canonical false
% @original_name negative_aspect (size reduction)
% @values reduced_sizes=Retiring_Free_Thinker_Talent_Scout_reduced_sizes unk_negative_aspect_size_reduction=Unknown
% @importance 0.9

0.80::true_val(negative_aspect_size_reduction, reduced_sizes); 0.20::true_val(negative_aspect_size_reduction, unk_negative_aspect_size_reduction).

measured(s11, negative_aspect_size_reduction, reduced_sizes).

all_consistent(negative_aspect_size_reduction) :-
    consistent(s11, negative_aspect_size_reduction).

evidence(all_consistent(negative_aspect_size_reduction)).
query(true_val(negative_aspect_size_reduction, reduced_sizes)).
query(true_val(negative_aspect_size_reduction, unk_negative_aspect_size_reduction)).

0.82::acc(s11, negative_aspect_weight).

% @attr negative_aspect_weight
% @type categorical
% @canonical false
% @original_name negative_aspect (weight vs Free Thinker)
% @values heavier_than_ft=Heavier_than_Free_Thinker_it_replaced unk_negative_aspect_weight=Unknown
% @importance 0.9

0.80::true_val(negative_aspect_weight, heavier_than_ft); 0.20::true_val(negative_aspect_weight, unk_negative_aspect_weight).

measured(s11, negative_aspect_weight, heavier_than_ft).

all_consistent(negative_aspect_weight) :-
    consistent(s11, negative_aspect_weight).

evidence(all_consistent(negative_aspect_weight)).
query(true_val(negative_aspect_weight, heavier_than_ft)).
query(true_val(negative_aspect_weight, unk_negative_aspect_weight)).

0.82::acc(s11, negative_aspect_vs_freethinker).

% @attr negative_aspect_vs_freethinker
% @type categorical
% @canonical false
% @original_name negative_aspect (vs Free Thinker standard)
% @values doesnt_meet_ft=Still_doesnt_meet_Free_Thinker_standard unk_negative_aspect_vs_freethinker=Unknown
% @importance 0.9

0.80::true_val(negative_aspect_vs_freethinker, doesnt_meet_ft); 0.20::true_val(negative_aspect_vs_freethinker, unk_negative_aspect_vs_freethinker).

measured(s11, negative_aspect_vs_freethinker, doesnt_meet_ft).

all_consistent(negative_aspect_vs_freethinker) :-
    consistent(s11, negative_aspect_vs_freethinker).

evidence(all_consistent(negative_aspect_vs_freethinker)).
query(true_val(negative_aspect_vs_freethinker, doesnt_meet_ft)).
query(true_val(negative_aspect_vs_freethinker, unk_negative_aspect_vs_freethinker)).

0.80::acc(s53, negative_aspect_edge_catch).
0.80::acc(s54, negative_aspect_edge_catch).

% @attr negative_aspect_edge_catch
% @type categorical
% @canonical false
% @original_name negative_aspect (edge catch risk)
% @values higher_edge_catch=Higher_edge_catch_risk_vs_PurePop_camber unk_negative_aspect_edge_catch=Unknown
% @importance 0.825

0.82::true_val(negative_aspect_edge_catch, higher_edge_catch); 0.18::true_val(negative_aspect_edge_catch, unk_negative_aspect_edge_catch).

measured(s53, negative_aspect_edge_catch, higher_edge_catch).
measured(s54, negative_aspect_edge_catch, higher_edge_catch).

all_consistent(negative_aspect_edge_catch) :-
    consistent(s53, negative_aspect_edge_catch),
    consistent(s54, negative_aspect_edge_catch).

evidence(all_consistent(negative_aspect_edge_catch)).
query(true_val(negative_aspect_edge_catch, higher_edge_catch)).
query(true_val(negative_aspect_edge_catch, unk_negative_aspect_edge_catch)).

0.90::acc(s33, price_usd_msrp).
0.80::acc(s11, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v619_95=619.95 v599=599.0 unk_price_usd_msrp=Unknown
% @importance 0.925

0.60::true_val(price_usd_msrp, v619_95); 0.35::true_val(price_usd_msrp, v599); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s33, price_usd_msrp, v619_95).
measured(s11, price_usd_msrp, v599).

all_consistent(price_usd_msrp) :-
    consistent(s33, price_usd_msrp),
    consistent(s11, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v619_95)).
query(true_val(price_usd_msrp, v599)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.93::acc(s_merchant, price_aud_merchant_rrp).

% @attr price_aud_merchant_rrp
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant (RRP)
% @values v879_99=879.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.85

0.93::true_val(price_aud_merchant_rrp, v879_99); 0.07::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s_merchant, price_aud_merchant_rrp, v879_99).

all_consistent(price_aud_merchant_rrp) :- (indep(s_merchant), consistent(s_merchant, price_aud_merchant_rrp) ; \+indep(s_merchant)).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v879_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

0.93::acc(s_merchant, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v615_99=615.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::true_val(price_aud_merchant, v615_99); 0.07::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v615_99).

all_consistent(price_aud_merchant) :- (indep(s_merchant), consistent(s_merchant, price_aud_merchant) ; \+indep(s_merchant)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v615_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.90::acc(s33, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v399_99=399.99 unk_price_usd_evo=Unknown
% @importance 0.95

0.90::true_val(price_usd_evo, v399_99); 0.10::true_val(price_usd_evo, unk_price_usd_evo).

measured(s33, price_usd_evo, v399_99).

all_consistent(price_usd_evo) :-
    consistent(s33, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v399_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.88::acc(s96, price_usd_evo_2026).

% @attr price_usd_evo_2026
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo (2026 model)
% @values v419_96=419.96 unk_price_usd_evo_2026=Unknown
% @importance 0.85

0.88::true_val(price_usd_evo_2026, v419_96); 0.12::true_val(price_usd_evo_2026, unk_price_usd_evo_2026).

measured(s96, price_usd_evo_2026, v419_96).

all_consistent(price_usd_evo_2026) :-
    consistent(s96, price_usd_evo_2026).

evidence(all_consistent(price_usd_evo_2026)).
query(true_val(price_usd_evo_2026, v419_96)).
query(true_val(price_usd_evo_2026, unk_price_usd_evo_2026)).

0.82::acc(s34, price_usd_source_boards).

% @attr price_usd_source_boards
% @type numeric
% @unit USD
% @canonical false
% @original_name Source Boards price (2025)
% @values v460=460.0 unk_price_usd_source_boards=Unknown
% @importance 0.9

0.82::true_val(price_usd_source_boards, v460); 0.18::true_val(price_usd_source_boards, unk_price_usd_source_boards).

measured(s34, price_usd_source_boards, v460).

all_consistent(price_usd_source_boards) :- (indep(s34), consistent(s34, price_usd_source_boards) ; \+indep(s34)).

evidence(all_consistent(price_usd_source_boards)).
query(true_val(price_usd_source_boards, v460)).
query(true_val(price_usd_source_boards, unk_price_usd_source_boards)).

0.82::acc(s37, price_usd_ski_chalet).

% @attr price_usd_ski_chalet
% @type numeric
% @unit USD
% @canonical false
% @original_name Ski Chalet price (2025)
% @values v464_96=464.96 unk_price_usd_ski_chalet=Unknown
% @importance 0.85

0.82::true_val(price_usd_ski_chalet, v464_96); 0.18::true_val(price_usd_ski_chalet, unk_price_usd_ski_chalet).

measured(s37, price_usd_ski_chalet, v464_96).

all_consistent(price_usd_ski_chalet) :- (indep(s37), consistent(s37, price_usd_ski_chalet) ; \+indep(s37)).

evidence(all_consistent(price_usd_ski_chalet)).
query(true_val(price_usd_ski_chalet, v464_96)).
query(true_val(price_usd_ski_chalet, unk_price_usd_ski_chalet)).

0.75::acc(s12, price_comparison_avg).

% @attr price_comparison_avg
% @type categorical
% @canonical false
% @original_name Board of the World price comparison
% @values below_avg=Costs_48_less_than_average_snowboard_468 unk_price_comparison_avg=Unknown
% @importance 0.8

0.72::true_val(price_comparison_avg, below_avg); 0.28::true_val(price_comparison_avg, unk_price_comparison_avg).

measured(s12, price_comparison_avg, below_avg).

all_consistent(price_comparison_avg) :-
    consistent(s12, price_comparison_avg).

evidence(all_consistent(price_comparison_avg)).
query(true_val(price_comparison_avg, below_avg)).
query(true_val(price_comparison_avg, unk_price_comparison_avg)).

0.85::acc(s102, comparable_board_same_brand_custom_price).

% @attr comparable_board_same_brand_custom_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand (Custom MSRP)
% @values v669_95=669.95 unk_comparable_board_same_brand_custom_price=Unknown
% @importance 0.7

0.85::true_val(comparable_board_same_brand_custom_price, v669_95); 0.15::true_val(comparable_board_same_brand_custom_price, unk_comparable_board_same_brand_custom_price).

measured(s102, comparable_board_same_brand_custom_price, v669_95).

all_consistent(comparable_board_same_brand_custom_price) :-
    consistent(s102, comparable_board_same_brand_custom_price).

evidence(all_consistent(comparable_board_same_brand_custom_price)).
query(true_val(comparable_board_same_brand_custom_price, v669_95)).
query(true_val(comparable_board_same_brand_custom_price, unk_comparable_board_same_brand_custom_price)).

0.80::acc(s53, comparable_board_same_brand_process_note).

% @attr comparable_board_same_brand_process_note
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Process price note)
% @values process_cheaper=Process_is_lower_price_no_carbon unk_comparable_board_same_brand_process_note=Unknown
% @importance 0.85

0.78::true_val(comparable_board_same_brand_process_note, process_cheaper); 0.22::true_val(comparable_board_same_brand_process_note, unk_comparable_board_same_brand_process_note).

measured(s53, comparable_board_same_brand_process_note, process_cheaper).

all_consistent(comparable_board_same_brand_process_note) :-
    consistent(s53, comparable_board_same_brand_process_note).

evidence(all_consistent(comparable_board_same_brand_process_note)).
query(true_val(comparable_board_same_brand_process_note, process_cheaper)).
query(true_val(comparable_board_same_brand_process_note, unk_comparable_board_same_brand_process_note)).

0.75::acc(s55, comparable_board_same_brand_good_company_price).

% @attr comparable_board_same_brand_good_company_price
% @type numeric
% @unit USD
% @canonical false
% @original_name comparable_board_same_brand (Good Company price)
% @values v440=440.0 unk_comparable_board_same_brand_good_company_price=Unknown
% @importance 0.8

0.72::true_val(comparable_board_same_brand_good_company_price, v440); 0.28::true_val(comparable_board_same_brand_good_company_price, unk_comparable_board_same_brand_good_company_price).

measured(s55, comparable_board_same_brand_good_company_price, v440).

all_consistent(comparable_board_same_brand_good_company_price) :-
    consistent(s55, comparable_board_same_brand_good_company_price).

evidence(all_consistent(comparable_board_same_brand_good_company_price)).
query(true_val(comparable_board_same_brand_good_company_price, v440)).
query(true_val(comparable_board_same_brand_good_company_price, unk_comparable_board_same_brand_good_company_price)).

0.88::acc(s24, shipping_restriction_au).

% @attr shipping_restriction_au
% @type categorical
% @canonical false
% @original_name Shipping restriction (AU merchant)
% @values au_only=Only_available_shipping_within_Australia unk_shipping_restriction_au=Unknown
% @importance 0.95

0.88::true_val(shipping_restriction_au, au_only); 0.12::true_val(shipping_restriction_au, unk_shipping_restriction_au).

measured(s24, shipping_restriction_au, au_only).

all_consistent(shipping_restriction_au) :- (indep(s24), consistent(s24, shipping_restriction_au) ; \+indep(s24)).

evidence(all_consistent(shipping_restriction_au)).
query(true_val(shipping_restriction_au, au_only)).
query(true_val(shipping_restriction_au, unk_shipping_restriction_au)).

0.92::acc(s1, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values listed_2025=2025_model_listed unk_availability_status=Unknown
% @importance 0.95

0.92::true_val(availability_status, listed_2025); 0.08::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, listed_2025).

all_consistent(availability_status) :-
    consistent(s1, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, listed_2025)).
query(true_val(availability_status, unk_availability_status)).

0.88::acc(s33, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values in_stock_2025_2026=2025_in_store_only_2026_in_stock unk_availability_status_evo=Unknown
% @importance 0.95

0.88::true_val(availability_status_evo, in_stock_2025_2026); 0.12::true_val(availability_status_evo, unk_availability_status_evo).

measured(s33, availability_status_evo, in_stock_2025_2026).

all_consistent(availability_status_evo) :-
    consistent(s33, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_2025_2026)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.85::acc(s95, availability_status_backcountry).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry)
% @values listed_2025=2025_model_listed unk_availability_status_backcountry=Unknown
% @importance 0.7

0.85::true_val(availability_status_backcountry, listed_2025); 0.15::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s95, availability_status_backcountry, listed_2025).

all_consistent(availability_status_backcountry) :- (indep(s95), consistent(s95, availability_status_backcountry) ; \+indep(s95)).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, listed_2025)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

0.82::acc(s22, availability_status_blauer).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer)
% @values listed_2025=2025_model_listed unk_availability_status_blauer=Unknown
% @importance 0.75

0.82::true_val(availability_status_blauer, listed_2025); 0.18::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s22, availability_status_blauer, listed_2025).

all_consistent(availability_status_blauer) :- (indep(s22), consistent(s22, availability_status_blauer) ; \+indep(s22)).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, listed_2025)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

0.82::acc(s34, availability_status_sourceboards).

% @attr availability_status_sourceboards
% @type categorical
% @canonical false
% @original_name availability_status (Source Boards)
% @values limited_stock=2025_in_stock_only_2_left unk_availability_status_sourceboards=Unknown
% @importance 0.9

0.82::true_val(availability_status_sourceboards, limited_stock); 0.18::true_val(availability_status_sourceboards, unk_availability_status_sourceboards).

measured(s34, availability_status_sourceboards, limited_stock).

all_consistent(availability_status_sourceboards) :- (indep(s34), consistent(s34, availability_status_sourceboards) ; \+indep(s34)).

evidence(all_consistent(availability_status_sourceboards)).
query(true_val(availability_status_sourceboards, limited_stock)).
query(true_val(availability_status_sourceboards, unk_availability_status_sourceboards)).

0.80::acc(s6, availability_status_shoreline).

% @attr availability_status_shoreline
% @type categorical
% @canonical false
% @original_name availability_status (Shoreline of Tahoe)
% @values listed_2025=2025_model_listed unk_availability_status_shoreline=Unknown
% @importance 0.95

0.80::true_val(availability_status_shoreline, listed_2025); 0.20::true_val(availability_status_shoreline, unk_availability_status_shoreline).

measured(s6, availability_status_shoreline, listed_2025).

all_consistent(availability_status_shoreline) :- (indep(s6), consistent(s6, availability_status_shoreline) ; \+indep(s6)).

evidence(all_consistent(availability_status_shoreline)).
query(true_val(availability_status_shoreline, listed_2025)).
query(true_val(availability_status_shoreline, unk_availability_status_shoreline)).

0.78::acc(s18, availability_status_peterglenn).

% @attr availability_status_peterglenn
% @type categorical
% @canonical false
% @original_name availability_status (Peter Glenn)
% @values listed_2026=2026_model_listed unk_availability_status_peterglenn=Unknown
% @importance 0.7

0.78::true_val(availability_status_peterglenn, listed_2026); 0.22::true_val(availability_status_peterglenn, unk_availability_status_peterglenn).

measured(s18, availability_status_peterglenn, listed_2026).

all_consistent(availability_status_peterglenn) :- (indep(s18), consistent(s18, availability_status_peterglenn) ; \+indep(s18)).

evidence(all_consistent(availability_status_peterglenn)).
query(true_val(availability_status_peterglenn, listed_2026)).
query(true_val(availability_status_peterglenn, unk_availability_status_peterglenn)).

0.82::acc(s37, availability_status_skichalet).

% @attr availability_status_skichalet
% @type categorical
% @canonical false
% @original_name availability_status (Ski Chalet)
% @values listed_2025_sale=2025_model_on_sale unk_availability_status_skichalet=Unknown
% @importance 0.85

0.82::true_val(availability_status_skichalet, listed_2025_sale); 0.18::true_val(availability_status_skichalet, unk_availability_status_skichalet).

measured(s37, availability_status_skichalet, listed_2025_sale).

all_consistent(availability_status_skichalet) :- (indep(s37), consistent(s37, availability_status_skichalet) ; \+indep(s37)).

evidence(all_consistent(availability_status_skichalet)).
query(true_val(availability_status_skichalet, listed_2025_sale)).
query(true_val(availability_status_skichalet, unk_availability_status_skichalet)).

0.88::acc(s24, availability_status_merchant).

% @attr availability_status_merchant
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard)
% @values listed_2025=2025_model_listed unk_availability_status_merchant=Unknown
% @importance 0.95

0.88::true_val(availability_status_merchant, listed_2025); 0.12::true_val(availability_status_merchant, unk_availability_status_merchant).

measured(s24, availability_status_merchant, listed_2025).

all_consistent(availability_status_merchant) :- (indep(s24), consistent(s24, availability_status_merchant) ; \+indep(s24)).

evidence(all_consistent(availability_status_merchant)).
query(true_val(availability_status_merchant, listed_2025)).
query(true_val(availability_status_merchant, unk_availability_status_merchant)).

0.80::acc(s27, availability_status_kingsnow).

% @attr availability_status_kingsnow
% @type categorical
% @canonical false
% @original_name availability_status (King Snow)
% @values profiled_2025=2025_model_profiled unk_availability_status_kingsnow=Unknown
% @importance 0.85

0.80::true_val(availability_status_kingsnow, profiled_2025); 0.20::true_val(availability_status_kingsnow, unk_availability_status_kingsnow).

measured(s27, availability_status_kingsnow, profiled_2025).

all_consistent(availability_status_kingsnow) :-
    consistent(s27, availability_status_kingsnow).

evidence(all_consistent(availability_status_kingsnow)).
query(true_val(availability_status_kingsnow, profiled_2025)).
query(true_val(availability_status_kingsnow, unk_availability_status_kingsnow)).

0.78::acc(s45, availability_status_buckmans).

% @attr availability_status_buckmans
% @type categorical
% @canonical false
% @original_name availability_status (Buckmans)
% @values listed_2026=2026_model_listed unk_availability_status_buckmans=Unknown
% @importance 0.5

0.78::true_val(availability_status_buckmans, listed_2026); 0.22::true_val(availability_status_buckmans, unk_availability_status_buckmans).

measured(s45, availability_status_buckmans, listed_2026).

all_consistent(availability_status_buckmans) :- (indep(s45), consistent(s45, availability_status_buckmans) ; \+indep(s45)).

evidence(all_consistent(availability_status_buckmans)).
query(true_val(availability_status_buckmans, listed_2026)).
query(true_val(availability_status_buckmans, unk_availability_status_buckmans)).

0.85::acc(s6, warranty).
0.82::acc(s40, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_year_warranty_from_purchase unk_warranty=Unknown
% @importance 0.85

0.93::true_val(warranty, three_year); 0.07::true_val(warranty, unk_warranty).

measured(s6, warranty, three_year).
measured(s40, warranty, three_year).

all_consistent(warranty) :-
    (indep(s6), consistent(s6, warranty) ; \+indep(s6)),
    (indep(s40), consistent(s40, warranty) ; \+indep(s40)).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

0.82::acc(s53, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values vs_process=Blossom_more_pop_carbon_full_camber_vs_Process_softer_PurePop unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.82::true_val(comparable_board_same_brand, vs_process); 0.18::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s53, comparable_board_same_brand, vs_process).

all_consistent(comparable_board_same_brand) :-
    consistent(s53, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, vs_process)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.80::acc(s54, comparable_board_same_brand_custom).

% @attr comparable_board_same_brand_custom
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (vs Custom)
% @values vs_custom=Custom_stiffer_torsionally_directional_twin_more_all_mountain unk_comparable_board_same_brand_custom=Unknown
% @importance 0.8

0.78::true_val(comparable_board_same_brand_custom, vs_custom); 0.22::true_val(comparable_board_same_brand_custom, unk_comparable_board_same_brand_custom).

measured(s54, comparable_board_same_brand_custom, vs_custom).

all_consistent(comparable_board_same_brand_custom) :-
    consistent(s54, comparable_board_same_brand_custom).

evidence(all_consistent(comparable_board_same_brand_custom)).
query(true_val(comparable_board_same_brand_custom, vs_custom)).
query(true_val(comparable_board_same_brand_custom, unk_comparable_board_same_brand_custom)).

0.78::acc(s63, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_doa_pop=Comparable_pop_to_Capita_DOA unk_comparable_board_cross_brand=Unknown
% @importance 0.75

0.75::true_val(comparable_board_cross_brand, capita_doa_pop); 0.25::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s63, comparable_board_cross_brand, capita_doa_pop).

all_consistent(comparable_board_cross_brand) :-
    consistent(s63, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa_pop)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.65::acc(s64, comparable_board_cross_brand_list).

% @attr comparable_board_cross_brand_list
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (forum list)
% @values capita_yes_salomon_k2_rome=Capita_Outsiders_Yes_Dicey_Huck_Knife_K2_Afterblack_Rome_Agent unk_comparable_board_cross_brand_list=Unknown
% @importance 0.75

0.62::true_val(comparable_board_cross_brand_list, capita_yes_salomon_k2_rome); 0.38::true_val(comparable_board_cross_brand_list, unk_comparable_board_cross_brand_list).

measured(s64, comparable_board_cross_brand_list, capita_yes_salomon_k2_rome).

all_consistent(comparable_board_cross_brand_list) :-
    consistent(s64, comparable_board_cross_brand_list).

evidence(all_consistent(comparable_board_cross_brand_list)).
query(true_val(comparable_board_cross_brand_list, capita_yes_salomon_k2_rome)).
query(true_val(comparable_board_cross_brand_list, unk_comparable_board_cross_brand_list)).

0.75::acc(s55, comparable_board_same_brand_good_company).

% @attr comparable_board_same_brand_good_company
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Good Company comparison)
% @values good_company_cheaper_lower=Good_Company_440_vs_620_lower_performance_all_mountain_freestyle unk_comparable_board_same_brand_good_company=Unknown
% @importance 0.8

0.72::true_val(comparable_board_same_brand_good_company, good_company_cheaper_lower); 0.28::true_val(comparable_board_same_brand_good_company, unk_comparable_board_same_brand_good_company).

measured(s55, comparable_board_same_brand_good_company, good_company_cheaper_lower).

all_consistent(comparable_board_same_brand_good_company) :-
    consistent(s55, comparable_board_same_brand_good_company).

evidence(all_consistent(comparable_board_same_brand_good_company)).
query(true_val(comparable_board_same_brand_good_company, good_company_cheaper_lower)).
query(true_val(comparable_board_same_brand_good_company, unk_comparable_board_same_brand_good_company)).

0.75::acc(s11, special_variant_super_ultra).

% @attr special_variant_super_ultra
% @type categorical
% @canonical false
% @original_name Special variant
% @values super_ultra_blossom=Super_Ultra_Blossom_Zeb_Powell_signature_up_to_205cm unk_special_variant_super_ultra=Unknown
% @importance 0.9

0.75::true_val(special_variant_super_ultra, super_ultra_blossom); 0.25::true_val(special_variant_super_ultra, unk_special_variant_super_ultra).

measured(s11, special_variant_super_ultra, super_ultra_blossom).

all_consistent(special_variant_super_ultra) :-
    consistent(s11, special_variant_super_ultra).

evidence(all_consistent(special_variant_super_ultra)).
query(true_val(special_variant_super_ultra, super_ultra_blossom)).
query(true_val(special_variant_super_ultra, unk_special_variant_super_ultra)).

0.80::acc(s33, evo_retailer_reputation).

% @attr evo_retailer_reputation
% @type categorical
% @canonical false
% @original_name Evo retailer reputation
% @values reputable=Reputable_US_retailer_lowest_price_guarantee_1yr_return unk_evo_retailer_reputation=Unknown
% @importance 0.95

0.80::true_val(evo_retailer_reputation, reputable); 0.20::true_val(evo_retailer_reputation, unk_evo_retailer_reputation).

measured(s33, evo_retailer_reputation, reputable).

all_consistent(evo_retailer_reputation) :-
    consistent(s33, evo_retailer_reputation).

evidence(all_consistent(evo_retailer_reputation)).
query(true_val(evo_retailer_reputation, reputable)).
query(true_val(evo_retailer_reputation, unk_evo_retailer_reputation)).

0.75::acc(s107, burton_reputation).

% @attr burton_reputation
% @type categorical
% @canonical false
% @original_name Burton reputation
% @values pioneer_40_45pct_share=Pioneer_snowboarding_approx_40_45pct_market_share unk_burton_reputation=Unknown
% @importance 0.5

0.70::true_val(burton_reputation, pioneer_40_45pct_share); 0.30::true_val(burton_reputation, unk_burton_reputation).

measured(s107, burton_reputation, pioneer_40_45pct_share).

all_consistent(burton_reputation) :-
    consistent(s107, burton_reputation).

evidence(all_consistent(burton_reputation)).
query(true_val(burton_reputation, pioneer_40_45pct_share)).
query(true_val(burton_reputation, unk_burton_reputation)).

0.78::acc(s13, predecessor_model_name).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values killroy_twin=Burton_Killroy_Twin_discontinued unk_predecessor_model_name=Unknown
% @importance 0.7

0.72::true_val(predecessor_model_name, killroy_twin); 0.28::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s13, predecessor_model_name, killroy_twin).

all_consistent(predecessor_model_name) :-
    consistent(s13, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, killroy_twin)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).