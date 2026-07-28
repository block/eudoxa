0.25::indep(s1).
0.15::indep(s16).
0.15::indep(s17).
0.20::indep(s15).
0.15::indep(s23).
0.15::indep(s25).
0.20::indep(s27).
0.15::indep(s28).
0.20::indep(s35).
0.70::indep(s14).
0.80::indep(s21).
0.85::indep(s20).
0.20::indep(s24).
0.85::indep(s30).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical false
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 1.0

0.95::acc(s1, brand).

0.95::true_val(brand, salomon); 0.05::true_val(brand, unk_brand).

measured(s1, brand, salomon).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values salomon_sas=Salomon_SAS unk_manufacturer=Unknown
% @importance 0.55

0.90::acc(s2, manufacturer).

0.82::true_val(manufacturer, salomon_sas); 0.18::true_val(manufacturer, unk_manufacturer).

measured(s2, manufacturer, salomon_sas).

all_consistent(manufacturer) :- consistent(s2, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name manufacturer founded
% @values founded_1947=1947_Francois_Salomon_Annecy unk_manufacturer_founded=Unknown
% @importance 0.55

0.90::acc(s2, manufacturer_founded).

0.82::true_val(manufacturer_founded, founded_1947); 0.18::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s2, manufacturer_founded, founded_1947).

all_consistent(manufacturer_founded) :- consistent(s2, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, founded_1947)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr manufacturer_parent_company
% @type categorical
% @canonical false
% @original_name manufacturer parent company
% @values amer_sports=Amer_Sports unk_manufacturer_parent_company=Unknown
% @importance 0.42

0.90::acc(s3, manufacturer_parent_company).

0.82::true_val(manufacturer_parent_company, amer_sports); 0.18::true_val(manufacturer_parent_company, unk_manufacturer_parent_company).

measured(s3, manufacturer_parent_company, amer_sports).

all_consistent(manufacturer_parent_company) :- consistent(s3, manufacturer_parent_company).

evidence(all_consistent(manufacturer_parent_company)).
query(true_val(manufacturer_parent_company, amer_sports)).
query(true_val(manufacturer_parent_company, unk_manufacturer_parent_company)).

% @attr manufacturer_ownership_history
% @type categorical
% @canonical false
% @original_name manufacturer ownership history
% @values adidas_1997_amer_2005=Adidas_1997_then_Amer_Sports_2005 unk_manufacturer_ownership_history=Unknown
% @importance 0.42

0.90::acc(s3, manufacturer_ownership_history).

0.82::true_val(manufacturer_ownership_history, adidas_1997_amer_2005); 0.18::true_val(manufacturer_ownership_history, unk_manufacturer_ownership_history).

measured(s3, manufacturer_ownership_history, adidas_1997_amer_2005).

all_consistent(manufacturer_ownership_history) :- consistent(s3, manufacturer_ownership_history).

evidence(all_consistent(manufacturer_ownership_history)).
query(true_val(manufacturer_ownership_history, adidas_1997_amer_2005)).
query(true_val(manufacturer_ownership_history, unk_manufacturer_ownership_history)).

% @attr manufacturer_design_location
% @type categorical
% @canonical false
% @original_name manufacturer design & development location
% @values annecy_france=Annecy_Design_Center_France unk_manufacturer_design_location=Unknown
% @importance 0.38

0.82::acc(s4, manufacturer_design_location).

0.75::true_val(manufacturer_design_location, annecy_france); 0.25::true_val(manufacturer_design_location, unk_manufacturer_design_location).

measured(s4, manufacturer_design_location, annecy_france).

all_consistent(manufacturer_design_location) :- consistent(s4, manufacturer_design_location).

evidence(all_consistent(manufacturer_design_location)).
query(true_val(manufacturer_design_location, annecy_france)).
query(true_val(manufacturer_design_location, unk_manufacturer_design_location)).

% @attr manufacturer_marketing_location
% @type categorical
% @canonical false
% @original_name manufacturer marketing location (snowboards)
% @values portland_oregon=Portland_Oregon_near_Mount_Hood unk_manufacturer_marketing_location=Unknown
% @importance 0.48

0.85::acc(s5, manufacturer_marketing_location).

0.81::true_val(manufacturer_marketing_location, portland_oregon); 0.19::true_val(manufacturer_marketing_location, unk_manufacturer_marketing_location).

measured(s5, manufacturer_marketing_location, portland_oregon).

all_consistent(manufacturer_marketing_location) :- consistent(s5, manufacturer_marketing_location).

evidence(all_consistent(manufacturer_marketing_location)).
query(true_val(manufacturer_marketing_location, portland_oregon)).
query(true_val(manufacturer_marketing_location, unk_manufacturer_marketing_location)).

% @attr manufacturer_reputation_winter_sports
% @type categorical
% @canonical false
% @original_name manufacturer reputation (winter sports)
% @values highly_regarded_since_1997=Highly_regarded_snowboards_since_1997 unk_manufacturer_reputation_winter_sports=Unknown
% @importance 0.48

0.85::acc(s5, manufacturer_reputation_winter_sports).

0.81::true_val(manufacturer_reputation_winter_sports, highly_regarded_since_1997); 0.19::true_val(manufacturer_reputation_winter_sports, unk_manufacturer_reputation_winter_sports).

measured(s5, manufacturer_reputation_winter_sports, highly_regarded_since_1997).

all_consistent(manufacturer_reputation_winter_sports) :- consistent(s5, manufacturer_reputation_winter_sports).

evidence(all_consistent(manufacturer_reputation_winter_sports)).
query(true_val(manufacturer_reputation_winter_sports, highly_regarded_since_1997)).
query(true_val(manufacturer_reputation_winter_sports, unk_manufacturer_reputation_winter_sports)).

% @attr manufacturer_reputation_brand
% @type categorical
% @canonical false
% @original_name manufacturer reputation (brand)
% @values innovative_rd_quality=Known_for_RD_innovation_quality_Volvo_award_2008 unk_manufacturer_reputation_brand=Unknown
% @importance 0.48

0.85::acc(s5, manufacturer_reputation_brand).

0.81::true_val(manufacturer_reputation_brand, innovative_rd_quality); 0.19::true_val(manufacturer_reputation_brand, unk_manufacturer_reputation_brand).

measured(s5, manufacturer_reputation_brand, innovative_rd_quality).

all_consistent(manufacturer_reputation_brand) :- consistent(s5, manufacturer_reputation_brand).

evidence(all_consistent(manufacturer_reputation_brand)).
query(true_val(manufacturer_reputation_brand, innovative_rd_quality)).
query(true_val(manufacturer_reputation_brand, unk_manufacturer_reputation_brand)).

% @attr manufacturer_snowboard_first_release_year
% @type numeric
% @canonical false
% @original_name manufacturer snowboard first release year
% @values v1997=1997.0 unk_manufacturer_snowboard_first_release_year=Unknown
% @importance 0.48

0.88::acc(s5, manufacturer_snowboard_first_release_year).

0.81::true_val(manufacturer_snowboard_first_release_year, v1997); 0.19::true_val(manufacturer_snowboard_first_release_year, unk_manufacturer_snowboard_first_release_year).

measured(s5, manufacturer_snowboard_first_release_year, v1997).

all_consistent(manufacturer_snowboard_first_release_year) :- consistent(s5, manufacturer_snowboard_first_release_year).

evidence(all_consistent(manufacturer_snowboard_first_release_year)).
query(true_val(manufacturer_snowboard_first_release_year, v1997)).
query(true_val(manufacturer_snowboard_first_release_year, unk_manufacturer_snowboard_first_release_year)).

% @attr manufacturer_hps_series_origin_year
% @type categorical
% @canonical false
% @original_name manufacturer HPS series origin year
% @values sickstick_2008_nyvelt_2017=HPS_began_Sickstick_2008_Nyvelt_since_2017 unk_manufacturer_hps_series_origin_year=Unknown
% @importance 0.52

0.88::acc(s6, manufacturer_hps_series_origin_year).

0.86::true_val(manufacturer_hps_series_origin_year, sickstick_2008_nyvelt_2017); 0.14::true_val(manufacturer_hps_series_origin_year, unk_manufacturer_hps_series_origin_year).

measured(s6, manufacturer_hps_series_origin_year, sickstick_2008_nyvelt_2017).

all_consistent(manufacturer_hps_series_origin_year) :- consistent(s6, manufacturer_hps_series_origin_year).

evidence(all_consistent(manufacturer_hps_series_origin_year)).
query(true_val(manufacturer_hps_series_origin_year, sickstick_2008_nyvelt_2017)).
query(true_val(manufacturer_hps_series_origin_year, unk_manufacturer_hps_series_origin_year)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values hps_louif_paradis=HPS_Louif_Paradis unk_model_name=Unknown
% @importance 1.0

0.97::acc(s1, model_name).

0.95::true_val(model_name, hps_louif_paradis); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, hps_louif_paradis).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, hps_louif_paradis)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2024=2024.0 v2025=2025.0
% @importance 1.0

0.80::acc(s1_title, model_year).
0.60::acc(s1_desc, model_year).

0.75::true_val(model_year, v2024); 0.25::true_val(model_year, v2025).

measured(s1_title, model_year, v2024).
measured(s1_desc, model_year, v2025).

all_consistent(model_year) :- consistent(s1_title, model_year), consistent(s1_desc, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2024)).
query(true_val(model_year, v2025)).

% @attr model_sku
% @type categorical
% @canonical false
% @original_name model SKU
% @values l41514600=L41514600 unk_model_sku=Unknown
% @importance 1.0

0.95::acc(s1, model_sku).

0.88::true_val(model_sku, l41514600); 0.12::true_val(model_sku, unk_model_sku).

measured(s1, model_sku, l41514600).

all_consistent(model_sku) :- consistent(s1, model_sku).

evidence(all_consistent(model_sku)).
query(true_val(model_sku, l41514600)).
query(true_val(model_sku, unk_model_sku)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name model series
% @values hps=HPS_Hillside_Project_Series unk_model_series=Unknown
% @importance 0.55

0.88::acc(s7, model_series).

0.80::true_val(model_series, hps); 0.20::true_val(model_series, unk_model_series).

measured(s7, model_series, hps).

all_consistent(model_series) :- consistent(s7, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, hps)).
query(true_val(model_series, unk_model_series)).

% @attr series_description
% @type categorical
% @canonical false
% @original_name series description
% @values powder_vision_collab=Salomon_powder_riding_vision_Nyvelt_pro_rider_collab unk_series_description=Unknown
% @importance 0.55

0.86::acc(s7, series_description).

0.80::true_val(series_description, powder_vision_collab); 0.20::true_val(series_description, unk_series_description).

measured(s7, series_description, powder_vision_collab).

all_consistent(series_description) :- consistent(s7, series_description).

evidence(all_consistent(series_description)).
query(true_val(series_description, powder_vision_collab)).
query(true_val(series_description, unk_series_description)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values boulanger_nakai_hps=Annie_Boulanger_HPS_and_Takaharu_Nakai_HPS unk_predecessor_model_name=Unknown
% @importance 0.75

0.88::acc(s8, predecessor_model_name).

0.84::true_val(predecessor_model_name, boulanger_nakai_hps); 0.16::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s8, predecessor_model_name, boulanger_nakai_hps).

all_consistent(predecessor_model_name) :- consistent(s8, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, boulanger_nakai_hps)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr model_first_available_year
% @type numeric
% @canonical false
% @original_name model_first_available_year
% @values v2021=2021.0 unk_model_first_available_year=Unknown
% @importance 0.75

0.88::acc(s8, model_first_available_year).

0.84::true_val(model_first_available_year, v2021); 0.16::true_val(model_first_available_year, unk_model_first_available_year).

measured(s8, model_first_available_year, v2021).

all_consistent(model_first_available_year) :- consistent(s8, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, v2021)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr current_model_release_date
% @type numeric
% @canonical false
% @original_name current model release date
% @values v2023=2023.0 unk_current_model_release_date=Unknown
% @importance 1.0

0.88::acc(s1, current_model_release_date).

0.88::true_val(current_model_release_date, v2023); 0.12::true_val(current_model_release_date, unk_current_model_release_date).

measured(s1, current_model_release_date, v2023).

all_consistent(current_model_release_date) :- consistent(s1, current_model_release_date).

evidence(all_consistent(current_model_release_date)).
query(true_val(current_model_release_date, v2023)).
query(true_val(current_model_release_date, unk_current_model_release_date)).

% @attr successor_model_2026
% @type categorical
% @canonical false
% @original_name successor model (2026)
% @values sizes_156_160_164_msrp_699_95=Updated_sizing_156_160_164_MSRP_699_95_USD unk_successor_model_2026=Unknown
% @importance 0.72

0.88::acc(s9, successor_model_2026).

0.86::true_val(successor_model_2026, sizes_156_160_164_msrp_699_95); 0.14::true_val(successor_model_2026, unk_successor_model_2026).

measured(s9, successor_model_2026, sizes_156_160_164_msrp_699_95).

all_consistent(successor_model_2026) :- consistent(s9, successor_model_2026).

evidence(all_consistent(successor_model_2026)).
query(true_val(successor_model_2026, sizes_156_160_164_msrp_699_95)).
query(true_val(successor_model_2026, unk_successor_model_2026)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values louif_paradis=Louif_Paradis unk_pro_rider_name=Unknown
% @importance 1.0

0.97::acc(s1, pro_rider_name).

0.95::true_val(pro_rider_name, louif_paradis); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

measured(s1, pro_rider_name, louif_paradis).

all_consistent(pro_rider_name) :- consistent(s1, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, louif_paradis)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr rider_nationality
% @type categorical
% @canonical false
% @original_name rider nationality
% @values quebecois=Quebecois_Canadian unk_rider_nationality=Unknown
% @importance 0.41

0.70::acc(s10, rider_nationality).

0.57::true_val(rider_nationality, quebecois); 0.43::true_val(rider_nationality, unk_rider_nationality).

measured(s10, rider_nationality, quebecois).

all_consistent(rider_nationality) :- consistent(s10, rider_nationality).

evidence(all_consistent(rider_nationality)).
query(true_val(rider_nationality, quebecois)).
query(true_val(rider_nationality, unk_rider_nationality)).

% @attr rider_description
% @type categorical
% @canonical false
% @original_name rider description
% @values stylish_rail_to_freeride=Most_stylish_riders_accomplished_rail_rider_now_freerider unk_rider_description=Unknown
% @importance 0.75

0.88::acc(s8, rider_description).

0.84::true_val(rider_description, stylish_rail_to_freeride); 0.16::true_val(rider_description, unk_rider_description).

measured(s8, rider_description, stylish_rail_to_freeride).

all_consistent(rider_description) :- consistent(s8, rider_description).

evidence(all_consistent(rider_description)).
query(true_val(rider_description, stylish_rail_to_freeride)).
query(true_val(rider_description, unk_rider_description)).

% @attr rider_style_description
% @type categorical
% @canonical false
% @original_name rider style description
% @values hybrid_powder_street_freeride=Hybrid_powder_street_freeride unk_rider_style_description=Unknown
% @importance 0.78

0.95::acc(s11, rider_style_description).

0.95::true_val(rider_style_description, hybrid_powder_street_freeride); 0.05::true_val(rider_style_description, unk_rider_style_description).

measured(s11, rider_style_description, hybrid_powder_street_freeride).

all_consistent(rider_style_description) :- consistent(s11, rider_style_description).

evidence(all_consistent(rider_style_description)).
query(true_val(rider_style_description, hybrid_powder_street_freeride)).
query(true_val(rider_style_description, unk_rider_style_description)).

% @attr graphic_designer_artist
% @type categorical
% @canonical false
% @original_name graphic_designer_artist
% @values wolle_nyvelt=Wolfgang_Nyvelt_Austrian_freeride_shaper unk_graphic_designer_artist=Unknown
% @importance 0.55

0.86::acc(s7, graphic_designer_artist).

0.80::true_val(graphic_designer_artist, wolle_nyvelt); 0.20::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s7, graphic_designer_artist, wolle_nyvelt).

all_consistent(graphic_designer_artist) :- consistent(s7, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, wolle_nyvelt)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr collaboration_description
% @type categorical
% @canonical false
% @original_name collaboration description
% @values wolle_shaping_louif_feedback=Wolle_shaping_expertise_combined_with_Louif_feedback unk_collaboration_description=Unknown
% @importance 0.78

0.93::acc(s11, collaboration_description).

0.95::true_val(collaboration_description, wolle_shaping_louif_feedback); 0.05::true_val(collaboration_description, unk_collaboration_description).

measured(s11, collaboration_description, wolle_shaping_louif_feedback).

all_consistent(collaboration_description) :- consistent(s11, collaboration_description).

evidence(all_consistent(collaboration_description)).
query(true_val(collaboration_description, wolle_shaping_louif_feedback)).
query(true_val(collaboration_description, unk_collaboration_description)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name design philosophy
% @values listening_to_riders=Main_focus_purely_listening_to_riders_Nyvelt_quote unk_design_philosophy=Unknown
% @importance 0.72

0.88::acc(s12, design_philosophy).

0.79::true_val(design_philosophy, listening_to_riders); 0.21::true_val(design_philosophy, unk_design_philosophy).

measured(s12, design_philosophy, listening_to_riders).

all_consistent(design_philosophy) :- consistent(s12, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, listening_to_riders)).
query(true_val(design_philosophy, unk_design_philosophy)).

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
% @importance 1.0

0.90::acc(s1, board_category).

0.88::true_val(board_category, all_mountain_freeride); 0.12::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain_freeride).

all_consistent(board_category) :- consistent(s1, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr board_subtype
% @type categorical
% @canonical false
% @original_name board subtype
% @values powder_am_freeride_hybrid=Powder_All_Mountain_Freeride_hybrid unk_board_subtype=Unknown
% @importance 1.0

0.88::acc(s1, board_subtype).

0.88::true_val(board_subtype, powder_am_freeride_hybrid); 0.12::true_val(board_subtype, unk_board_subtype).

measured(s1, board_subtype, powder_am_freeride_hybrid).

all_consistent(board_subtype) :- consistent(s1, board_subtype).

evidence(all_consistent(board_subtype)).
query(true_val(board_subtype, powder_am_freeride_hybrid)).
query(true_val(board_subtype, unk_board_subtype)).

% @attr gender
% @type categorical
% @canonical false
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.92

0.90::acc(s13, gender).

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s13, gender, unisex).

all_consistent(gender) :- consistent(s13, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced expert=Expert
% @importance 0.96

0.78::acc(s1, rider_level).
0.93::acc(s13, rider_level).
0.72::acc(s35, rider_level).

0.40::true_val(rider_level, intermediate_advanced); 0.60::true_val(rider_level, expert).

measured(s1, rider_level, intermediate_advanced).
measured(s13, rider_level, expert).
measured(s35, rider_level, intermediate_advanced).

all_consistent(rider_level) :-
    consistent(s13, rider_level),
    (indep(s1), consistent(s1, rider_level) ; \+indep(s1)),
    (indep(s35), consistent(s35, rider_level) ; \+indep(s35)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, expert)).

% @attr skill_level_recommendation
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values advanced_expert_directional_freestyle=Advanced_expert_directional_freeride_freestyle unk_skill_level_recommendation=Unknown
% @importance 0.82

0.80::acc(s14, skill_level_recommendation).

0.67::true_val(skill_level_recommendation, advanced_expert_directional_freestyle); 0.33::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s14, skill_level_recommendation, advanced_expert_directional_freestyle).

all_consistent(skill_level_recommendation) :-
    (indep(s14), consistent(s14, skill_level_recommendation) ; \+indep(s14)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert_directional_freestyle)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values deep_powder_freeride_freestyle=Deep_terrain_powder_freeride_freestyle deep_powder_offpiste_versatile=Deep_powder_off_piste_backcountry_versatile_groomers
% @importance 0.93

0.82::acc(s1, terrain_suitability).
0.80::acc(s15, terrain_suitability).

0.55::true_val(terrain_suitability, deep_powder_freeride_freestyle); 0.45::true_val(terrain_suitability, deep_powder_offpiste_versatile).

measured(s1, terrain_suitability, deep_powder_freeride_freestyle).
measured(s15, terrain_suitability, deep_powder_offpiste_versatile).

all_consistent(terrain_suitability) :-
    (indep(s1), consistent(s1, terrain_suitability) ; \+indep(s1)),
    (indep(s15), consistent(s15, terrain_suitability) ; \+indep(s15)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, deep_powder_freeride_freestyle)).
query(true_val(terrain_suitability, deep_powder_offpiste_versatile)).

% @attr use_case
% @type categorical
% @canonical false
% @original_name use case
% @values freestyle_deep_terrain_hybrid=Freestyle_tactics_deep_terrain_street_meets_freeride unk_use_case=Unknown
% @importance 0.78

0.93::acc(s11, use_case).

0.95::true_val(use_case, freestyle_deep_terrain_hybrid); 0.05::true_val(use_case, unk_use_case).

measured(s11, use_case, freestyle_deep_terrain_hybrid).

all_consistent(use_case) :- consistent(s11, use_case).

evidence(all_consistent(use_case)).
query(true_val(use_case, freestyle_deep_terrain_hybrid)).
query(true_val(use_case, unk_use_case)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 1.0

0.90::acc(s1, shape).
0.92::acc(s16, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).
measured(s16, shape, tapered_directional).

all_consistent(shape) :-
    (indep(s1), consistent(s1, shape) ; \+indep(s1)),
    (indep(s16), consistent(s16, shape) ; \+indep(s16)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape description
% @values tapered_2_20mm_loosens_turns_float=Tail_tapered_2_20mm_loosens_turns_improves_float unk_shape_description=Unknown
% @importance 0.93

0.88::acc(s16, shape_description).

0.81::true_val(shape_description, tapered_2_20mm_loosens_turns_float); 0.19::true_val(shape_description, unk_shape_description).

measured(s16, shape_description, tapered_2_20mm_loosens_turns_float).

all_consistent(shape_description) :-
    (indep(s16), consistent(s16, shape_description) ; \+indep(s16)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, tapered_2_20mm_loosens_turns_float)).
query(true_val(shape_description, unk_shape_description)).

% @attr nose_tail_design
% @type categorical
% @canonical false
% @original_name nose/tail design
% @values distinctive_blunt=Distinctive_blunt_nose_and_tail unk_nose_tail_design=Unknown
% @importance 0.78

0.88::acc(s17, nose_tail_design).

0.83::true_val(nose_tail_design, distinctive_blunt); 0.17::true_val(nose_tail_design, unk_nose_tail_design).

measured(s17, nose_tail_design, distinctive_blunt).

all_consistent(nose_tail_design) :-
    (indep(s17), consistent(s17, nose_tail_design) ; \+indep(s17)).

evidence(all_consistent(nose_tail_design)).
query(true_val(nose_tail_design, distinctive_blunt)).
query(true_val(nose_tail_design, unk_nose_tail_design)).

% @attr taper
% @type categorical
% @canonical false
% @original_name taper
% @values nose_5mm_wider=Nose_approx_5mm_wider_than_tail unk_taper=Unknown
% @importance 0.72

0.86::acc(s18, taper).

0.80::true_val(taper, nose_5mm_wider); 0.20::true_val(taper, unk_taper).

measured(s18, taper, nose_5mm_wider).

all_consistent(taper) :- consistent(s18, taper).

evidence(all_consistent(taper)).
query(true_val(taper, nose_5mm_wider)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v20=20.0 unk_setback=Unknown
% @importance 1.0

0.88::acc(s1, setback).

0.95::true_val(setback, v20); 0.05::true_val(setback, unk_setback).

measured(s1, setback, v20).

all_consistent(setback) :-
    (indep(s1), consistent(s1, setback) ; \+indep(s1)).

evidence(all_consistent(setback)).
query(true_val(setback, v20)).
query(true_val(setback, unk_setback)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values powder_camber=Powder_Camber rock_out_camber=Rock_Out_Camber
% @importance 0.97

0.80::acc(s1, camber_type).
0.90::acc(s16, camber_type).

0.35::true_val(camber_type, powder_camber); 0.65::true_val(camber_type, rock_out_camber).

measured(s1, camber_type, powder_camber).
measured(s16, camber_type, rock_out_camber).

all_consistent(camber_type) :-
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)),
    (indep(s16), consistent(s16, camber_type) ; \+indep(s16)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, powder_camber)).
query(true_val(camber_type, rock_out_camber)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values camber_feet_rocker_ends=Camber_between_feet_rocker_at_ends_seven_section_profile unk_camber_description=Unknown
% @importance 0.92

0.82::acc(s1, camber_description).
0.88::acc(s16, camber_description).
0.86::acc(s19, camber_description).

0.95::true_val(camber_description, camber_feet_rocker_ends); 0.05::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, camber_feet_rocker_ends).
measured(s16, camber_description, camber_feet_rocker_ends).
measured(s19, camber_description, camber_feet_rocker_ends).

all_consistent(camber_description) :-
    (indep(s1), consistent(s1, camber_description) ; \+indep(s1)),
    (indep(s16), consistent(s16, camber_description) ; \+indep(s16)),
    consistent(s19, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, camber_feet_rocker_ends)).
query(true_val(camber_description, unk_camber_description)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values quadratic_sidecut=Quadratic_Sidecut quadralizer=Quadralizer
% @importance 0.97

0.78::acc(s1, sidecut_type).
0.90::acc(s16, sidecut_type).

0.30::true_val(sidecut_type, quadratic_sidecut); 0.70::true_val(sidecut_type, quadralizer).

measured(s1, sidecut_type, quadratic_sidecut).
measured(s16, sidecut_type, quadralizer).

all_consistent(sidecut_type) :-
    (indep(s1), consistent(s1, sidecut_type) ; \+indep(s1)),
    (indep(s16), consistent(s16, sidecut_type) ; \+indep(s16)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, quadratic_sidecut)).
query(true_val(sidecut_type, quadralizer)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name sidecut description
% @values equalizer_quadratic_combo=Explosive_Equalizer_Quadratic_combo_carving_edge_control unk_sidecut_description=Unknown
% @importance 0.93

0.90::acc(s16, sidecut_description).

0.81::true_val(sidecut_description, equalizer_quadratic_combo); 0.19::true_val(sidecut_description, unk_sidecut_description).

measured(s16, sidecut_description, equalizer_quadratic_combo).

all_consistent(sidecut_description) :-
    (indep(s16), consistent(s16, sidecut_description) ; \+indep(s16)).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, equalizer_quadratic_combo)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr reviewer_opinion_whitelines_sidecut
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values edge_hold_proprietary_blend=Proprietary_blend_straight_sections_curves_holds_edge unk_reviewer_opinion_whitelines_sidecut=Unknown
% @importance 0.82

0.86::acc(s19, reviewer_opinion_whitelines_sidecut).

0.77::true_val(reviewer_opinion_whitelines_sidecut, edge_hold_proprietary_blend); 0.23::true_val(reviewer_opinion_whitelines_sidecut, unk_reviewer_opinion_whitelines_sidecut).

measured(s19, reviewer_opinion_whitelines_sidecut, edge_hold_proprietary_blend).

all_consistent(reviewer_opinion_whitelines_sidecut) :- consistent(s19, reviewer_opinion_whitelines_sidecut).

evidence(all_consistent(reviewer_opinion_whitelines_sidecut)).
query(true_val(reviewer_opinion_whitelines_sidecut, edge_hold_proprietary_blend)).
query(true_val(reviewer_opinion_whitelines_sidecut, unk_reviewer_opinion_whitelines_sidecut)).

% @attr flex_rating_10
% @type categorical
% @canonical true
% @original_name flex_rating_10
% @values soft=Soft medium=Medium stiff=Stiff
% @importance 0.92

0.72::acc(s1, flex_rating_10).
0.93::acc(s13, flex_rating_10).
0.82::acc(s20, flex_rating_10).
0.68::acc(s35, flex_rating_10).

0.15::true_val(flex_rating_10, soft); 0.55::true_val(flex_rating_10, medium); 0.30::true_val(flex_rating_10, stiff).

measured(s1, flex_rating_10, soft).
measured(s13, flex_rating_10, medium).
measured(s20, flex_rating_10, stiff).
measured(s35, flex_rating_10, medium).

all_consistent(flex_rating_10) :-
    (indep(s1), consistent(s1, flex_rating_10) ; \+indep(s1)),
    consistent(s13, flex_rating_10),
    (indep(s20), consistent(s20, flex_rating_10) ; \+indep(s20)),
    (indep(s35), consistent(s35, flex_rating_10) ; \+indep(s35)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, soft)).
query(true_val(flex_rating_10, medium)).
query(true_val(flex_rating_10, stiff)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff_enough_off_piste=Stiff_enough_for_big_off_piste_jumps lively_poppy_bamboo=Lively_poppy_bamboo_enhanced_easy_manageable
% @importance 0.76

0.80::acc(s21, flex_feel).
0.85::acc(s12, flex_feel).

0.45::true_val(flex_feel, stiff_enough_off_piste); 0.55::true_val(flex_feel, lively_poppy_bamboo).

measured(s21, flex_feel, stiff_enough_off_piste).
measured(s12, flex_feel, lively_poppy_bamboo).

all_consistent(flex_feel) :-
    (indep(s21), consistent(s21, flex_feel) ; \+indep(s21)),
    consistent(s12, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff_enough_off_piste)).
query(true_val(flex_feel, lively_poppy_bamboo)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional=Directional unk_flex_direction=Unknown
% @importance 1.0

0.88::acc(s1, flex_direction).

0.88::true_val(flex_direction, directional); 0.12::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, directional).

all_consistent(flex_direction) :-
    (indep(s1), consistent(s1, flex_direction) ; \+indep(s1)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values ghost_green_core_paulownia=Ghost_Green_Core_Paulownia_super_light unk_core_material=Unknown
% @importance 0.96

0.88::acc(s1, core_material).
0.95::acc(s22, core_material).

0.95::true_val(core_material, ghost_green_core_paulownia); 0.05::true_val(core_material, unk_core_material).

measured(s1, core_material, ghost_green_core_paulownia).
measured(s22, core_material, ghost_green_core_paulownia).

all_consistent(core_material) :-
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)),
    consistent(s22, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, ghost_green_core_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr core_profiling
% @type categorical
% @canonical false
% @original_name core profiling
% @values popster=Popster unk_core_profiling=Unknown
% @importance 1.0

0.88::acc(s1, core_profiling).

0.88::true_val(core_profiling, popster); 0.12::true_val(core_profiling, unk_core_profiling).

measured(s1, core_profiling, popster).

all_consistent(core_profiling) :-
    (indep(s1), consistent(s1, core_profiling) ; \+indep(s1)).

evidence(all_consistent(core_profiling)).
query(true_val(core_profiling, popster)).
query(true_val(core_profiling, unk_core_profiling)).

% @attr core_profiling_description
% @type categorical
% @canonical false
% @original_name core profiling description
% @values milled_inserts_natural_flex_pop=Core_milled_inside_insert_packs_natural_flex_pop unk_core_profiling_description=Unknown
% @importance 0.88

0.95::acc(s22, core_profiling_description).

0.95::true_val(core_profiling_description, milled_inserts_natural_flex_pop); 0.05::true_val(core_profiling_description, unk_core_profiling_description).

measured(s22, core_profiling_description, milled_inserts_natural_flex_pop).

all_consistent(core_profiling_description) :- consistent(s22, core_profiling_description).

evidence(all_consistent(core_profiling_description)).
query(true_val(core_profiling_description, milled_inserts_natural_flex_pop)).
query(true_val(core_profiling_description, unk_core_profiling_description)).

% @attr core_profiling_detail
% @type categorical
% @canonical false
% @original_name core profiling detail (Absolute Snow)
% @values thicker_centre_tapers_thickens_nose_tail=Wood_core_thicker_centre_tapers_thickens_nose_tail_insane_pop unk_core_profiling_detail=Unknown
% @importance 0.72

0.55::acc(s23, core_profiling_detail).

0.39::true_val(core_profiling_detail, thicker_centre_tapers_thickens_nose_tail); 0.61::true_val(core_profiling_detail, unk_core_profiling_detail).

measured(s23, core_profiling_detail, thicker_centre_tapers_thickens_nose_tail).

all_consistent(core_profiling_detail) :-
    (indep(s23), consistent(s23, core_profiling_detail) ; \+indep(s23)).

evidence(all_consistent(core_profiling_detail)).
query(true_val(core_profiling_detail, thicker_centre_tapers_thickens_nose_tail)).
query(true_val(core_profiling_detail, unk_core_profiling_detail)).

% @attr core_feel
% @type categorical
% @canonical false
% @original_name core feel
% @values light_and_snappy=Light_and_snappy unk_core_feel=Unknown
% @importance 0.85

0.78::acc(s15, core_feel).

0.63::true_val(core_feel, light_and_snappy); 0.37::true_val(core_feel, unk_core_feel).

measured(s15, core_feel, light_and_snappy).

all_consistent(core_feel) :-
    (indep(s15), consistent(s15, core_feel) ; \+indep(s15)).

evidence(all_consistent(core_feel)).
query(true_val(core_feel, light_and_snappy)).
query(true_val(core_feel, unk_core_feel)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_woodcore=FSC_certified_woodcore unk_sustainability_certification=Unknown
% @importance 0.58

0.80::acc(s24, sustainability_certification).
0.85::acc(s1, sustainability_certification).

0.95::true_val(sustainability_certification, fsc_certified_woodcore); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s24, sustainability_certification, fsc_certified_woodcore).
measured(s1, sustainability_certification, fsc_certified_woodcore).

all_consistent(sustainability_certification) :-
    (indep(s24), consistent(s24, sustainability_certification) ; \+indep(s24)),
    (indep(s1), consistent(s1, sustainability_certification) ; \+indep(s1)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_woodcore)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values ba_md_glass=BA_MD_Glass_biaxial_medium_density_fiberglass unk_laminate=Unknown
% @importance 0.94

0.85::acc(s1, laminate).
0.90::acc(s25, laminate).

0.95::true_val(laminate, ba_md_glass); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, ba_md_glass).
measured(s25, laminate, ba_md_glass).

all_consistent(laminate) :-
    (indep(s1), consistent(s1, laminate) ; \+indep(s1)),
    (indep(s25), consistent(s25, laminate) ; \+indep(s25)).

evidence(all_consistent(laminate)).
query(true_val(laminate, ba_md_glass)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values bamboo_veneers_liveliness_pop=Bamboo_veneers_add_liveliness_explosive_pop unk_construction_material_innovation=Unknown
% @importance 0.85

0.78::acc(s15, construction_material_innovation).

0.63::true_val(construction_material_innovation, bamboo_veneers_liveliness_pop); 0.37::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s15, construction_material_innovation, bamboo_veneers_liveliness_pop).

all_consistent(construction_material_innovation) :-
    (indep(s15), consistent(s15, construction_material_innovation) ; \+indep(s15)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, bamboo_veneers_liveliness_pop)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_carbon
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values ghost_carbon_stringers=Ghost_Carbon_Stringers_tip_to_tail unk_construction_material_innovation_carbon=Unknown
% @importance 0.72

0.40::acc(s23, construction_material_innovation_carbon).

0.39::true_val(construction_material_innovation_carbon, ghost_carbon_stringers); 0.61::true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon).

measured(s23, construction_material_innovation_carbon, ghost_carbon_stringers).

all_consistent(construction_material_innovation_carbon) :-
    (indep(s23), consistent(s23, construction_material_innovation_carbon) ; \+indep(s23)).

evidence(all_consistent(construction_material_innovation_carbon)).
query(true_val(construction_material_innovation_carbon, ghost_carbon_stringers)).
query(true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values bio_resin_30pct=Bio_Resin_30pct_plant_derived unk_resin=Unknown
% @importance 0.94

0.85::acc(s1, resin).
0.90::acc(s25, resin).

0.95::true_val(resin, bio_resin_30pct); 0.05::true_val(resin, unk_resin).

measured(s1, resin, bio_resin_30pct).
measured(s25, resin, bio_resin_30pct).

all_consistent(resin) :-
    (indep(s1), consistent(s1, resin) ; \+indep(s1)),
    (indep(s25), consistent(s25, resin) ; \+indep(s25)).

evidence(all_consistent(resin)).
query(true_val(resin, bio_resin_30pct)).
query(true_val(resin, unk_resin)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values abc_wrapper_bamboo=ABC_Wrapper_bamboo_veneers_40pct_less_fiberglass_resin unk_topsheet=Unknown
% @importance 0.93

0.85::acc(s1, topsheet).
0.95::acc(s26, topsheet).

0.95::true_val(topsheet, abc_wrapper_bamboo); 0.05::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, abc_wrapper_bamboo).
measured(s26, topsheet, abc_wrapper_bamboo).

all_consistent(topsheet) :-
    (indep(s1), consistent(s1, topsheet) ; \+indep(s1)),
    consistent(s26, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, abc_wrapper_bamboo)).
query(true_val(topsheet, unk_topsheet)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs=Recycled_ABS_Sidewalls unk_sidewall_material=Unknown
% @importance 0.94

0.85::acc(s1, sidewall_material).
0.90::acc(s25, sidewall_material).

0.95::true_val(sidewall_material, recycled_abs); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s1, sidewall_material, recycled_abs).
measured(s25, sidewall_material, recycled_abs).

all_consistent(sidewall_material) :-
    (indep(s1), consistent(s1, sidewall_material) ; \+indep(s1)),
    (indep(s25), consistent(s25, sidewall_material) ; \+indep(s25)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_rails
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values bamboo_cork_rails=Bamboo_Cork_Rails_liveliness_dampening unk_sidewall_material_rails=Unknown
% @importance 0.78

0.78::acc(s27, sidewall_material_rails).

0.66::true_val(sidewall_material_rails, bamboo_cork_rails); 0.34::true_val(sidewall_material_rails, unk_sidewall_material_rails).

measured(s27, sidewall_material_rails, bamboo_cork_rails).

all_consistent(sidewall_material_rails) :-
    (indep(s27), consistent(s27, sidewall_material_rails) ; \+indep(s27)).

evidence(all_consistent(sidewall_material_rails)).
query(true_val(sidewall_material_rails, bamboo_cork_rails)).
query(true_val(sidewall_material_rails, unk_sidewall_material_rails)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_eg=Sintered_EG unk_base_material=Unknown
% @importance 1.0

0.88::acc(s1, base_material).

0.88::true_val(base_material, sintered_eg); 0.12::true_val(base_material, unk_base_material).

measured(s1, base_material, sintered_eg).

all_consistent(base_material) :-
    (indep(s1), consistent(s1, base_material) ; \+indep(s1)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_eg)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values sintered=Sintered_superior_wax_retention unk_base_type=Unknown
% @importance 0.82

0.82::acc(s28, base_type).

0.67::true_val(base_type, sintered); 0.33::true_val(base_type, unk_base_type).

measured(s28, base_type, sintered).

all_consistent(base_type) :-
    (indep(s28), consistent(s28, base_type) ; \+indep(s28)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

% @attr base_finish
% @type categorical
% @canonical false
% @original_name base finish
% @values fine_stone_electra_gallium=Fine_Stone_Finish_Electra_Gallium unk_base_finish=Unknown
% @importance 1.0

0.85::acc(s1, base_finish).

0.88::true_val(base_finish, fine_stone_electra_gallium); 0.12::true_val(base_finish, unk_base_finish).

measured(s1, base_finish, fine_stone_electra_gallium).

all_consistent(base_finish) :-
    (indep(s1), consistent(s1, base_finish) ; \+indep(s1)).

evidence(all_consistent(base_finish)).
query(true_val(base_finish, fine_stone_electra_gallium)).
query(true_val(base_finish, unk_base_finish)).

% @attr sustainability_certification_recycled_base
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_sintered_base_50pct=50pct_recycled_sintered_base_materials unk_sustainability_certification_recycled_base=Unknown
% @importance 0.88

0.90::acc(s25, sustainability_certification_recycled_base).

0.81::true_val(sustainability_certification_recycled_base, recycled_sintered_base_50pct); 0.19::true_val(sustainability_certification_recycled_base, unk_sustainability_certification_recycled_base).

measured(s25, sustainability_certification_recycled_base, recycled_sintered_base_50pct).

all_consistent(sustainability_certification_recycled_base) :-
    (indep(s25), consistent(s25, sustainability_certification_recycled_base) ; \+indep(s25)).

evidence(all_consistent(sustainability_certification_recycled_base)).
query(true_val(sustainability_certification_recycled_base, recycled_sintered_base_50pct)).
query(true_val(sustainability_certification_recycled_base, unk_sustainability_certification_recycled_base)).

% @attr sustainability_certification_natural_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values paraffin_free_natural_wax=Paraffin_free_natural_ingredient_wax unk_sustainability_certification_natural_wax=Unknown
% @importance 0.80

0.93::acc(s26, sustainability_certification_natural_wax).

0.95::true_val(sustainability_certification_natural_wax, paraffin_free_natural_wax); 0.05::true_val(sustainability_certification_natural_wax, unk_sustainability_certification_natural_wax).

measured(s26, sustainability_certification_natural_wax, paraffin_free_natural_wax).

all_consistent(sustainability_certification_natural_wax) :- consistent(s26, sustainability_certification_natural_wax).

evidence(all_consistent(sustainability_certification_natural_wax)).
query(true_val(sustainability_certification_natural_wax, paraffin_free_natural_wax)).
query(true_val(sustainability_certification_natural_wax, unk_sustainability_certification_natural_wax)).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values super_fast_all_conditions=Super_fast_glide_fresh_pow_to_spring_snow unk_base_glide_performance=Unknown
% @importance 0.82

0.80::acc(s28, base_glide_performance).

0.67::true_val(base_glide_performance, super_fast_all_conditions); 0.33::true_val(base_glide_performance, unk_base_glide_performance).

measured(s28, base_glide_performance, super_fast_all_conditions).

all_consistent(base_glide_performance) :-
    (indep(s28), consistent(s28, base_glide_performance) ; \+indep(s28)).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, super_fast_all_conditions)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values all_mountain_edge_bevel=All_Mountain_Edge_Bevel unk_edge_technology=Unknown
% @importance 1.0

0.88::acc(s1, edge_technology).

0.88::true_val(edge_technology, all_mountain_edge_bevel); 0.12::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, all_mountain_edge_bevel).

all_consistent(edge_technology) :-
    (indep(s1), consistent(s1, edge_technology) ; \+indep(s1)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, all_mountain_edge_bevel)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_bevel_spec
% @type categorical
% @canonical false
% @original_name edge_bevel_spec
% @values one_deg_sidecut_two_deg_feet=1deg_nose_tail_sidecut_2deg_between_feet unk_edge_bevel_spec=Unknown
% @importance 0.88

0.90::acc(s25, edge_bevel_spec).

0.81::true_val(edge_bevel_spec, one_deg_sidecut_two_deg_feet); 0.19::true_val(edge_bevel_spec, unk_edge_bevel_spec).

measured(s25, edge_bevel_spec, one_deg_sidecut_two_deg_feet).

all_consistent(edge_bevel_spec) :-
    (indep(s25), consistent(s25, edge_bevel_spec) ; \+indep(s25)).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, one_deg_sidecut_two_deg_feet)).
query(true_val(edge_bevel_spec, unk_edge_bevel_spec)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.88::acc(s1, mounting_pattern).

0.88::true_val(mounting_pattern, inserts_2x4); 0.12::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values standard_4x4_2x4=Standard_4x4_and_2x4_compatible unk_binding_compatibility=Unknown
% @importance 0.75

0.68::acc(s29, binding_compatibility).

0.52::true_val(binding_compatibility, standard_4x4_2x4); 0.48::true_val(binding_compatibility, unk_binding_compatibility).

measured(s29, binding_compatibility, standard_4x4_2x4).

all_consistent(binding_compatibility) :- consistent(s29, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_4x4_2x4)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_155_159_163=155cm_159cm_163cm unk_available_sizes=Unknown
% @importance 1.0

0.90::acc(s1, available_sizes).
0.85::acc(s30, available_sizes).

0.95::true_val(available_sizes, sizes_155_159_163); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, sizes_155_159_163).
measured(s30, available_sizes, sizes_155_159_163).

all_consistent(available_sizes) :-
    (indep(s1), consistent(s1, available_sizes) ; \+indep(s1)),
    (indep(s30), consistent(s30, available_sizes) ; \+indep(s30)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_155_159_163)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_2026
% @type categorical
% @canonical false
% @original_name available_sizes
% @values sizes_156_160_164=156cm_160cm_164cm unk_available_sizes_2026=Unknown
% @importance 0.72

0.88::acc(s9, available_sizes_2026).

0.86::true_val(available_sizes_2026, sizes_156_160_164); 0.14::true_val(available_sizes_2026, unk_available_sizes_2026).

measured(s9, available_sizes_2026, sizes_156_160_164).

all_consistent(available_sizes_2026) :- consistent(s9, available_sizes_2026).

evidence(all_consistent(available_sizes_2026)).
query(true_val(available_sizes_2026, sizes_156_160_164)).
query(true_val(available_sizes_2026, unk_available_sizes_2026)).

% @attr waist_width_155
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 155cm
% @values v255=255.0 unk_waist_width_155=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_155).

0.88::true_val(waist_width_155, v255); 0.12::true_val(waist_width_155, unk_waist_width_155).

measured(s1, waist_width_155, v255).

all_consistent(waist_width_155) :-
    (indep(s1), consistent(s1, waist_width_155) ; \+indep(s1)).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v255)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr waist_width_159
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 159cm
% @values v258=258.0 unk_waist_width_159=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_159).

0.88::true_val(waist_width_159, v258); 0.12::true_val(waist_width_159, unk_waist_width_159).

measured(s1, waist_width_159, v258).

all_consistent(waist_width_159) :-
    (indep(s1), consistent(s1, waist_width_159) ; \+indep(s1)).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v258)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr waist_width_163
% @type numeric
% @unit mm
% @canonical false
% @original_name waist width 163cm
% @values v262=262.0 unk_waist_width_163=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_163).

0.88::true_val(waist_width_163, v262); 0.12::true_val(waist_width_163, unk_waist_width_163).

measured(s1, waist_width_163, v262).

all_consistent(waist_width_163) :-
    (indep(s1), consistent(s1, waist_width_163) ; \+indep(s1)).

evidence(all_consistent(waist_width_163)).
query(true_val(waist_width_163, v262)).
query(true_val(waist_width_163, unk_waist_width_163)).

% @attr tip_tail_width_size
% @type categorical
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values n302_t297=Nose_302mm_Tail_297mm unk_tip_tail_width_size=Unknown
% @importance 1.0

0.90::acc(s1, tip_tail_width_size).

0.88::true_val(tip_tail_width_size, n302_t297); 0.12::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, n302_t297).

all_consistent(tip_tail_width_size) :-
    (indep(s1), consistent(s1, tip_tail_width_size) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, n302_t297)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_159
% @type categorical
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values n307_t302=Nose_307mm_Tail_302mm unk_tip_tail_width_size_159=Unknown
% @importance 1.0

0.90::acc(s1, tip_tail_width_size_159).

0.88::true_val(tip_tail_width_size_159, n307_t302); 0.12::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s1, tip_tail_width_size_159, n307_t302).

all_consistent(tip_tail_width_size_159) :-
    (indep(s1), consistent(s1, tip_tail_width_size_159) ; \+indep(s1)).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, n307_t302)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

% @attr tip_tail_width_size_163
% @type categorical
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values n311_t306=Nose_311mm_Tail_306mm unk_tip_tail_width_size_163=Unknown
% @importance 0.91

0.90::acc(s1, tip_tail_width_size_163).
0.82::acc(s30, tip_tail_width_size_163).

0.95::true_val(tip_tail_width_size_163, n311_t306); 0.05::true_val(tip_tail_width_size_163, unk_tip_tail_width_size_163).

measured(s1, tip_tail_width_size_163, n311_t306).
measured(s30, tip_tail_width_size_163, n311_t306).

all_consistent(tip_tail_width_size_163) :-
    (indep(s1), consistent(s1, tip_tail_width_size_163) ; \+indep(s1)),
    (indep(s30), consistent(s30, tip_tail_width_size_163) ; \+indep(s30)).

evidence(all_consistent(tip_tail_width_size_163)).
query(true_val(tip_tail_width_size_163, n311_t306)).
query(true_val(tip_tail_width_size_163, unk_tip_tail_width_size_163)).

% @attr effective_edge_155
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 155cm
% @values v1180=1180.0 unk_effective_edge_155=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_155).

0.88::true_val(effective_edge_155, v1180); 0.12::true_val(effective_edge_155, unk_effective_edge_155).

measured(s1, effective_edge_155, v1180).

all_consistent(effective_edge_155) :-
    (indep(s1), consistent(s1, effective_edge_155) ; \+indep(s1)).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v1180)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

% @attr effective_edge_159
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 159cm
% @values v1210=1210.0 unk_effective_edge_159=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_159).

0.88::true_val(effective_edge_159, v1210); 0.12::true_val(effective_edge_159, unk_effective_edge_159).

measured(s1, effective_edge_159, v1210).

all_consistent(effective_edge_159) :-
    (indep(s1), consistent(s1, effective_edge_159) ; \+indep(s1)).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1210)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr effective_edge_163
% @type numeric
% @unit mm
% @canonical false
% @original_name effective edge 163cm
% @values v1230=1230.0 unk_effective_edge_163=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_163).

0.88::true_val(effective_edge_163, v1230); 0.12::true_val(effective_edge_163, unk_effective_edge_163).

measured(s1, effective_edge_163, v1230).

all_consistent(effective_edge_163) :-
    (indep(s1), consistent(s1, effective_edge_163) ; \+indep(s1)).

evidence(all_consistent(effective_edge_163)).
query(true_val(effective_edge_163, v1230)).
query(true_val(effective_edge_163, unk_effective_edge_163)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values r60_95=60_95kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_size).

0.88::true_val(recommended_weight_range_size, r60_95); 0.12::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, r60_95).

all_consistent(recommended_weight_range_size) :-
    (indep(s1), consistent(s1, recommended_weight_range_size) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r60_95)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r70_100=70_100kg unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_size_159).

0.88::true_val(recommended_weight_range_size_159, r70_100); 0.12::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s1, recommended_weight_range_size_159, r70_100).

all_consistent(recommended_weight_range_size_159) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_159) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, r70_100)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr recommended_weight_range_size_163
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r70_105=70_105kg unk_recommended_weight_range_size_163=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_size_163).

0.88::true_val(recommended_weight_range_size_163, r70_105); 0.12::true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163).

measured(s1, recommended_weight_range_size_163, r70_105).

all_consistent(recommended_weight_range_size_163) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_163) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_163)).
query(true_val(recommended_weight_range_size_163, r70_105)).
query(true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163)).

% @attr sustainability_certification_recycled_abs
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_abs_sidewalls=Recycled_ABS_Sidewalls unk_sustainability_certification_recycled_abs=Unknown
% @importance 1.0

0.85::acc(s1, sustainability_certification_recycled_abs).

0.88::true_val(sustainability_certification_recycled_abs, recycled_abs_sidewalls); 0.12::true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs).

measured(s1, sustainability_certification_recycled_abs, recycled_abs_sidewalls).

all_consistent(sustainability_certification_recycled_abs) :-
    (indep(s1), consistent(s1, sustainability_certification_recycled_abs) ; \+indep(s1)).

evidence(all_consistent(sustainability_certification_recycled_abs)).
query(true_val(sustainability_certification_recycled_abs, recycled_abs_sidewalls)).
query(true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs)).

% @attr sustainability_certification_bio_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values bio_30pct_plant=30pct_bio_based_molecular_structure_from_plants unk_sustainability_certification_bio_resin=Unknown
% @importance 1.0

0.85::acc(s1, sustainability_certification_bio_resin).

0.88::true_val(sustainability_certification_bio_resin, bio_30pct_plant); 0.12::true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin).

measured(s1, sustainability_certification_bio_resin, bio_30pct_plant).

all_consistent(sustainability_certification_bio_resin) :-
    (indep(s1), consistent(s1, sustainability_certification_bio_resin) ; \+indep(s1)).

evidence(all_consistent(sustainability_certification_bio_resin)).
query(true_val(sustainability_certification_bio_resin, bio_30pct_plant)).
query(true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin)).

% @attr sustainability_certification_abc_wrapper
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values abc_reduces_40pct=ABC_Wrapper_reduces_fiberglass_resin_40pct unk_sustainability_certification_abc_wrapper=Unknown
% @importance 1.0

0.85::acc(s1, sustainability_certification_abc_wrapper).

0.88::true_val(sustainability_certification_abc_wrapper, abc_reduces_40pct); 0.12::true_val(sustainability_certification_abc_wrapper, unk_sustainability_certification_abc_wrapper).

measured(s1, sustainability_certification_abc_wrapper, abc_reduces_40pct).

all_consistent(sustainability_certification_abc_wrapper) :-
    (indep(s1), consistent(s1, sustainability_certification_abc_wrapper) ; \+indep(s1)).

evidence(all_consistent(sustainability_certification_abc_wrapper)).
query(true_val(sustainability_certification_abc_wrapper, abc_reduces_40pct)).
query(true_val(sustainability_certification_abc_wrapper, unk_sustainability_certification_abc_wrapper)).

% @attr ink_graphics_type
% @type categorical
% @canonical false
% @original_name ink/graphics type
% @values not_specified=Not_specified unk_ink_graphics_type=Unknown
% @importance 0.50

0.50::true_val(ink_graphics_type, not_specified); 0.50::true_val(ink_graphics_type, unk_ink_graphics_type).

all_consistent(ink_graphics_type).

evidence(all_consistent(ink_graphics_type)).
query(true_val(ink_graphics_type, not_specified)).
query(true_val(ink_graphics_type, unk_ink_graphics_type)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v569_99=569.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.95::acc(s1, price_aud_merchant).

0.88::true_val(price_aud_merchant, v569_99); 0.12::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s1, price_aud_merchant, v569_99).

all_consistent(price_aud_merchant) :- consistent(s1, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v569_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_aud_merchant_rrp
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v949_99=949.99 unk_price_aud_merchant_rrp=Unknown
% @importance 1.0

0.95::acc(s1, price_aud_merchant_rrp).

0.88::true_val(price_aud_merchant_rrp, v949_99); 0.12::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s1, price_aud_merchant_rrp, v949_99).

all_consistent(price_aud_merchant_rrp) :- consistent(s1, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v949_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

% @attr discount_merchant
% @type categorical
% @canonical false
% @original_name discount (merchant)
% @values pct40_off_rrp=40pct_off_RRP unk_discount_merchant=Unknown
% @importance 1.0

0.95::acc(s1, discount_merchant).

0.88::true_val(discount_merchant, pct40_off_rrp); 0.12::true_val(discount_merchant, unk_discount_merchant).

measured(s1, discount_merchant, pct40_off_rrp).

all_consistent(discount_merchant) :- consistent(s1, discount_merchant).

evidence(all_consistent(discount_merchant)).
query(true_val(discount_merchant, pct40_off_rrp)).
query(true_val(discount_merchant, unk_discount_merchant)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp
% @values v699_95=699.95 unk_price_usd_msrp=Unknown
% @importance 0.72

0.90::acc(s9, price_usd_msrp).

0.86::true_val(price_usd_msrp, v699_95); 0.14::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s9, price_usd_msrp, v699_95).

all_consistent(price_usd_msrp) :- consistent(s9, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v699_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_skipro
% @type categorical
% @canonical false
% @original_name price USD (2026 at Ski Pro AZ)
% @values listed=Listed_at_skipro unk_price_usd_skipro=Unknown
% @importance 0.70

0.65::acc(s31, price_usd_skipro).

0.47::true_val(price_usd_skipro, listed); 0.53::true_val(price_usd_skipro, unk_price_usd_skipro).

measured(s31, price_usd_skipro, listed).

all_consistent(price_usd_skipro) :- consistent(s31, price_usd_skipro).

evidence(all_consistent(price_usd_skipro)).
query(true_val(price_usd_skipro, listed)).
query(true_val(price_usd_skipro, unk_price_usd_skipro)).

% @attr price_usd_evo
% @type categorical
% @canonical true
% @original_name price_usd_evo
% @values listed=Listed_on_evo unk_price_usd_evo=Unknown
% @importance 0.85

0.78::acc(s20, price_usd_evo).

0.64::true_val(price_usd_evo, listed); 0.36::true_val(price_usd_evo, unk_price_usd_evo).

measured(s20, price_usd_evo, listed).

all_consistent(price_usd_evo) :- consistent(s20, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, listed)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_boyne
% @type categorical
% @canonical false
% @original_name price USD (2024 at Boyne Country Sports)
% @values listed=Listed_at_Boyne unk_price_usd_boyne=Unknown
% @importance 0.70

0.68::acc(s32, price_usd_boyne).

0.60::true_val(price_usd_boyne, listed); 0.40::true_val(price_usd_boyne, unk_price_usd_boyne).

measured(s32, price_usd_boyne, listed).

all_consistent(price_usd_boyne) :- consistent(s32, price_usd_boyne).

evidence(all_consistent(price_usd_boyne)).
query(true_val(price_usd_boyne, listed)).
query(true_val(price_usd_boyne, unk_price_usd_boyne)).

% @attr price_usd_backcountry
% @type categorical
% @canonical true
% @original_name price_usd_backcountry
% @values listed=Listed_on_backcountry unk_price_usd_backcountry=Unknown
% @importance 0.82

0.76::acc(s14, price_usd_backcountry).

0.67::true_val(price_usd_backcountry, listed); 0.33::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s14, price_usd_backcountry, listed).

all_consistent(price_usd_backcountry) :- consistent(s14, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, listed)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_tactics
% @type categorical
% @canonical true
% @original_name price_usd_tactics
% @values listed=Listed_on_tactics unk_price_usd_tactics=Unknown
% @importance 0.70

0.70::acc(s33, price_usd_tactics).

0.55::true_val(price_usd_tactics, listed); 0.45::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s33, price_usd_tactics, listed).

all_consistent(price_usd_tactics) :- consistent(s33, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, listed)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_ebay_secondhand
% @type categorical
% @canonical false
% @original_name price (eBay secondhand 159cm)
% @values listed=Listed_on_eBay_159cm unk_price_ebay_secondhand=Unknown
% @importance 0.65

0.62::acc(s34, price_ebay_secondhand).

0.56::true_val(price_ebay_secondhand, listed); 0.44::true_val(price_ebay_secondhand, unk_price_ebay_secondhand).

measured(s34, price_ebay_secondhand, listed).

all_consistent(price_ebay_secondhand) :- consistent(s34, price_ebay_secondhand).

evidence(all_consistent(price_ebay_secondhand)).
query(true_val(price_ebay_secondhand, listed)).
query(true_val(price_ebay_secondhand, unk_price_ebay_secondhand)).

% @attr price_bobs_sports_chalet
% @type categorical
% @canonical false
% @original_name price (Bob's Sports Chalet 2024)
% @values listed=Listed_155_159_in_stock unk_price_bobs_sports_chalet=Unknown
% @importance 0.80

0.66::acc(s35, price_bobs_sports_chalet).

0.61::true_val(price_bobs_sports_chalet, listed); 0.39::true_val(price_bobs_sports_chalet, unk_price_bobs_sports_chalet).

measured(s35, price_bobs_sports_chalet, listed).

all_consistent(price_bobs_sports_chalet) :- consistent(s35, price_bobs_sports_chalet).

evidence(all_consistent(price_bobs_sports_chalet)).
query(true_val(price_bobs_sports_chalet, listed)).
query(true_val(price_bobs_sports_chalet, unk_price_bobs_sports_chalet)).

% @attr price_comor_sports
% @type categorical
% @canonical false
% @original_name price (Comor Sports Canada 2024)
% @values listed=Listed_at_Comor_Sports_Canada unk_price_comor_sports=Unknown
% @importance 0.78

0.72::acc(s27, price_comor_sports).

0.66::true_val(price_comor_sports, listed); 0.34::true_val(price_comor_sports, unk_price_comor_sports).

measured(s27, price_comor_sports, listed).

all_consistent(price_comor_sports) :- consistent(s27, price_comor_sports).

evidence(all_consistent(price_comor_sports)).
query(true_val(price_comor_sports, listed)).
query(true_val(price_comor_sports, unk_price_comor_sports)).

% @attr price_absolute_snow_uk
% @type categorical
% @canonical false
% @original_name price (Absolute Snow UK 2024)
% @values listed=Listed_at_Absolute_Snow_UK unk_price_absolute_snow_uk=Unknown
% @importance 0.72

0.60::acc(s23, price_absolute_snow_uk).

0.39::true_val(price_absolute_snow_uk, listed); 0.61::true_val(price_absolute_snow_uk, unk_price_absolute_snow_uk).

measured(s23, price_absolute_snow_uk, listed).

all_consistent(price_absolute_snow_uk) :- consistent(s23, price_absolute_snow_uk).

evidence(all_consistent(price_absolute_snow_uk)).
query(true_val(price_absolute_snow_uk, listed)).
query(true_val(price_absolute_snow_uk, unk_price_absolute_snow_uk)).

% @attr price_snow_country_eu
% @type categorical
% @canonical false
% @original_name price (Snow Country EU 24/25)
% @values listed=Listed_at_Snow_Country_EU unk_price_snow_country_eu=Unknown
% @importance 0.60

0.65::acc(s36, price_snow_country_eu).

0.55::true_val(price_snow_country_eu, listed); 0.45::true_val(price_snow_country_eu, unk_price_snow_country_eu).

measured(s36, price_snow_country_eu, listed).

all_consistent(price_snow_country_eu) :- consistent(s36, price_snow_country_eu).

evidence(all_consistent(price_snow_country_eu)).
query(true_val(price_snow_country_eu, listed)).
query(true_val(price_snow_country_eu, unk_price_snow_country_eu)).

% @attr price_buckmans
% @type categorical
% @canonical false
% @original_name price (Buckmans 2025)
% @values listed=Listed_at_Buckmans unk_price_buckmans=Unknown
% @importance 0.60

0.62::acc(s37, price_buckmans).

0.43::true_val(price_buckmans, listed); 0.57::true_val(price_buckmans, unk_price_buckmans).

measured(s37, price_buckmans, listed).

all_consistent(price_buckmans) :- consistent(s37, price_buckmans).

evidence(all_consistent(price_buckmans)).
query(true_val(price_buckmans, listed)).
query(true_val(price_buckmans, unk_price_buckmans)).

% @attr bindings_included
% @type categorical
% @canonical false
% @original_name bindings included
% @values no=No unk_bindings_included=Unknown
% @importance 0.65

0.70::acc(s34, bindings_included).

0.56::true_val(bindings_included, no); 0.44::true_val(bindings_included, unk_bindings_included).

measured(s34, bindings_included, no).

all_consistent(bindings_included) :- consistent(s34, bindings_included).

evidence(all_consistent(bindings_included)).
query(true_val(bindings_included, no)).
query(true_val(bindings_included, unk_bindings_included)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name retailer
% @values evo_us_online=evo_established_US_online_retailer unk_retailer_evo=Unknown
% @importance 0.85

0.80::acc(s20, retailer_evo).

0.64::true_val(retailer_evo, evo_us_online); 0.36::true_val(retailer_evo, unk_retailer_evo).

measured(s20, retailer_evo, evo_us_online).

all_consistent(retailer_evo) :- consistent(s20, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, evo_us_online)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_backcountry
% @type categorical
% @canonical false
% @original_name retailer
% @values backcountry_us=backcountry_major_US_outdoor_retailer unk_retailer_backcountry=Unknown
% @importance 0.82

0.76::acc(s14, retailer_backcountry).

0.67::true_val(retailer_backcountry, backcountry_us); 0.33::true_val(retailer_backcountry, unk_retailer_backcountry).

measured(s14, retailer_backcountry, backcountry_us).

all_consistent(retailer_backcountry) :- consistent(s14, retailer_backcountry).

evidence(all_consistent(retailer_backcountry)).
query(true_val(retailer_backcountry, backcountry_us)).
query(true_val(retailer_backcountry, unk_retailer_backcountry)).

% @attr retailer_tactics
% @type categorical
% @canonical false
% @original_name retailer
% @values tactics_boardshop=tactics_authenticity_lowest_price_guarantee unk_retailer_tactics=Unknown
% @importance 0.70

0.70::acc(s33, retailer_tactics).

0.55::true_val(retailer_tactics, tactics_boardshop); 0.45::true_val(retailer_tactics, unk_retailer_tactics).

measured(s33, retailer_tactics, tactics_boardshop).

all_consistent(retailer_tactics) :- consistent(s33, retailer_tactics).

evidence(all_consistent(retailer_tactics)).
query(true_val(retailer_tactics, tactics_boardshop)).
query(true_val(retailer_tactics, unk_retailer_tactics)).

% @attr retailer_skipro
% @type categorical
% @canonical false
% @original_name retailer
% @values skipro_az=Ski_Pro_AZ_free_shipping_over_99 unk_retailer_skipro=Unknown
% @importance 0.70

0.65::acc(s31, retailer_skipro).

0.47::true_val(retailer_skipro, skipro_az); 0.53::true_val(retailer_skipro, unk_retailer_skipro).

measured(s31, retailer_skipro, skipro_az).

all_consistent(retailer_skipro) :- consistent(s31, retailer_skipro).

evidence(all_consistent(retailer_skipro)).
query(true_val(retailer_skipro, skipro_az)).
query(true_val(retailer_skipro, unk_retailer_skipro)).

% @attr retailer_boyne
% @type categorical
% @canonical false
% @original_name retailer
% @values boyne_country_sports=Boyne_Country_Sports_US_specialty unk_retailer_boyne=Unknown
% @importance 0.70

0.68::acc(s32, retailer_boyne).

0.60::true_val(retailer_boyne, boyne_country_sports); 0.40::true_val(retailer_boyne, unk_retailer_boyne).

measured(s32, retailer_boyne, boyne_country_sports).

all_consistent(retailer_boyne) :- consistent(s32, retailer_boyne).

evidence(all_consistent(retailer_boyne)).
query(true_val(retailer_boyne, boyne_country_sports)).
query(true_val(retailer_boyne, unk_retailer_boyne)).

% @attr retailer_comor
% @type categorical
% @canonical false
% @original_name retailer
% @values comor_canada=Comor_Sports_Canada_Whistler_Vancouver unk_retailer_comor=Unknown
% @importance 0.78

0.72::acc(s27, retailer_comor).

0.66::true_val(retailer_comor, comor_canada); 0.34::true_val(retailer_comor, unk_retailer_comor).

measured(s27, retailer_comor, comor_canada).

all_consistent(retailer_comor) :- consistent(s27, retailer_comor).

evidence(all_consistent(retailer_comor)).
query(true_val(retailer_comor, comor_canada)).
query(true_val(retailer_comor, unk_retailer_comor)).

% @attr retailer_absolute_snow
% @type categorical
% @canonical false
% @original_name retailer
% @values absolute_snow_uk=Absolute_Snow_UK_freeride_specialist unk_retailer_absolute_snow=Unknown
% @importance 0.72

0.60::acc(s23, retailer_absolute_snow).

0.39::true_val(retailer_absolute_snow, absolute_snow_uk); 0.61::true_val(retailer_absolute_snow, unk_retailer_absolute_snow).

measured(s23, retailer_absolute_snow, absolute_snow_uk).

all_consistent(retailer_absolute_snow) :- consistent(s23, retailer_absolute_snow).

evidence(all_consistent(retailer_absolute_snow)).
query(true_val(retailer_absolute_snow, absolute_snow_uk)).
query(true_val(retailer_absolute_snow, unk_retailer_absolute_snow)).

% @attr retailer_snow_country
% @type categorical
% @canonical false
% @original_name retailer
% @values snow_country_eu=Snow_Country_EU_UPS_Express unk_retailer_snow_country=Unknown
% @importance 0.60

0.65::acc(s36, retailer_snow_country).

0.55::true_val(retailer_snow_country, snow_country_eu); 0.45::true_val(retailer_snow_country, unk_retailer_snow_country).

measured(s36, retailer_snow_country, snow_country_eu).

all_consistent(retailer_snow_country) :- consistent(s36, retailer_snow_country).

evidence(all_consistent(retailer_snow_country)).
query(true_val(retailer_snow_country, snow_country_eu)).
query(true_val(retailer_snow_country, unk_retailer_snow_country)).

% @attr retailer_bobs
% @type categorical
% @canonical false
% @original_name retailer
% @values bobs_sports_chalet=Bobs_Sports_Chalet_US_specialty unk_retailer_bobs=Unknown
% @importance 0.80

0.66::acc(s35, retailer_bobs).

0.61::true_val(retailer_bobs, bobs_sports_chalet); 0.39::true_val(retailer_bobs, unk_retailer_bobs).

measured(s35, retailer_bobs, bobs_sports_chalet).

all_consistent(retailer_bobs) :- consistent(s35, retailer_bobs).

evidence(all_consistent(retailer_bobs)).
query(true_val(retailer_bobs, bobs_sports_chalet)).
query(true_val(retailer_bobs, unk_retailer_bobs)).

% @attr retailer_buckmans
% @type categorical
% @canonical false
% @original_name retailer
% @values buckmans_us=Buckmans_US_outdoor_snow unk_retailer_buckmans=Unknown
% @importance 0.60

0.62::acc(s37, retailer_buckmans).

0.43::true_val(retailer_buckmans, buckmans_us); 0.57::true_val(retailer_buckmans, unk_retailer_buckmans).

measured(s37, retailer_buckmans, buckmans_us).

all_consistent(retailer_buckmans) :- consistent(s37, retailer_buckmans).

evidence(all_consistent(retailer_buckmans)).
query(true_val(retailer_buckmans, buckmans_us)).
query(true_val(retailer_buckmans, unk_retailer_buckmans)).

% @attr retailer_ebay
% @type categorical
% @canonical false
% @original_name retailer
% @values ebay_secondary=eBay_secondary_market_returns_accepted unk_retailer_ebay=Unknown
% @importance 0.65

0.62::acc(s34, retailer_ebay).

0.56::true_val(retailer_ebay, ebay_secondary); 0.44::true_val(retailer_ebay, unk_retailer_ebay).

measured(s34, retailer_ebay, ebay_secondary).

all_consistent(retailer_ebay) :- consistent(s34, retailer_ebay).

evidence(all_consistent(retailer_ebay)).
query(true_val(retailer_ebay, ebay_secondary)).
query(true_val(retailer_ebay, unk_retailer_ebay)).

% @attr availability_status
% @type categorical
% @canonical false
% @original_name availability_status
% @values all_3_sizes_available=Available_155_159_163cm unk_availability_status=Unknown
% @importance 1.0

0.90::acc(s1, availability_status).

0.88::true_val(availability_status, all_3_sizes_available); 0.12::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, all_3_sizes_available).

all_consistent(availability_status) :-
    (indep(s1), consistent(s1, availability_status) ; \+indep(s1)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, all_3_sizes_available)).
query(true_val(availability_status, unk_availability_status)).

% @attr versatility
% @type categorical
% @canonical false
% @original_name versatility
% @values groomers_powder_trees_balanced=Performs_well_groomers_powder_trees_versatile_balanced unk_versatility=Unknown
% @importance 0.78

0.75::acc(s38, versatility).

0.55::true_val(versatility, groomers_powder_trees_balanced); 0.45::true_val(versatility, unk_versatility).

measured(s38, versatility, groomers_powder_trees_balanced).

all_consistent(versatility) :- consistent(s38, versatility).

evidence(all_consistent(versatility)).
query(true_val(versatility, groomers_powder_trees_balanced)).
query(true_val(versatility, unk_versatility)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values high_popster_abc=High_Popster_ABC_Wrapper_bamboo_explosive_ollies unk_pop=Unknown
% @importance 0.85

0.78::acc(s15, pop).

0.63::true_val(pop, high_popster_abc); 0.37::true_val(pop, unk_pop).

measured(s15, pop, high_popster_abc).

all_consistent(pop) :-
    (indep(s15), consistent(s15, pop) ; \+indep(s15)).

evidence(all_consistent(pop)).
query(true_val(pop, high_popster_abc)).
query(true_val(pop, unk_pop)).

% @attr float
% @type categorical
% @canonical false
% @original_name float
% @values excellent_tapered_setback_rocker=Excellent_deep_snow_tapered_directional_20mm_setback_rocker unk_float=Unknown
% @importance 0.78

0.86::acc(s17, float).

0.83::true_val(float, excellent_tapered_setback_rocker); 0.17::true_val(float, unk_float).

measured(s17, float, excellent_tapered_setback_rocker).

all_consistent(float) :-
    (indep(s17), consistent(s17, float) ; \+indep(s17)).

evidence(all_consistent(float)).
query(true_val(float, excellent_tapered_setback_rocker)).
query(true_val(float, unk_float)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values solid_quadralizer_am_bevel=Solid_Quadralizer_sidecut_AM_edge_bevel_reliable unk_edge_hold=Unknown
% @importance 0.88

0.88::acc(s25, edge_hold).

0.81::true_val(edge_hold, solid_quadralizer_am_bevel); 0.19::true_val(edge_hold, unk_edge_hold).

measured(s25, edge_hold, solid_quadralizer_am_bevel).

all_consistent(edge_hold) :-
    (indep(s25), consistent(s25, edge_hold) ; \+indep(s25)).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, solid_quadralizer_am_bevel)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr dampening
% @type categorical
% @canonical false
% @original_name dampening
% @values bamboo_cork_absorb_chatter=Bamboo_Cork_Rails_absorb_chatter_damp_at_speed unk_dampening=Unknown
% @importance 0.82

0.78::acc(s14, dampening).

0.67::true_val(dampening, bamboo_cork_absorb_chatter); 0.33::true_val(dampening, unk_dampening).

measured(s14, dampening, bamboo_cork_absorb_chatter).

all_consistent(dampening) :-
    (indep(s14), consistent(s14, dampening) ; \+indep(s14)).

evidence(all_consistent(dampening)).
query(true_val(dampening, bamboo_cork_absorb_chatter)).
query(true_val(dampening, unk_dampening)).

% @attr responsiveness
% @type categorical
% @canonical false
% @original_name responsiveness
% @values camber_underfoot_energy_return=Camber_underfoot_responsiveness_energy_return unk_responsiveness=Unknown
% @importance 0.82

0.84::acc(s19, responsiveness).

0.77::true_val(responsiveness, camber_underfoot_energy_return); 0.23::true_val(responsiveness, unk_responsiveness).

measured(s19, responsiveness, camber_underfoot_energy_return).

all_consistent(responsiveness) :- consistent(s19, responsiveness).

evidence(all_consistent(responsiveness)).
query(true_val(responsiveness, camber_underfoot_energy_return)).
query(true_val(responsiveness, unk_responsiveness)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values possible_not_primary=Possible_but_not_primary_purpose unk_switch_riding=Unknown
% @importance 0.82

0.82::acc(s19, switch_riding).

0.77::true_val(switch_riding, possible_not_primary); 0.23::true_val(switch_riding, unk_switch_riding).

measured(s19, switch_riding, possible_not_primary).

all_consistent(switch_riding) :- consistent(s19, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, possible_not_primary)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr ride_character_snowboard_mag
% @type categorical
% @canonical false
% @original_name ride character (Snowboard Magazine)
% @values responsive_poppy_flexible_forgiving_elegant=Responsive_poppy_flexible_forgiving_elegant unk_ride_character_snowboard_mag=Unknown
% @importance 0.72

0.86::acc(s12, ride_character_snowboard_mag).

0.79::true_val(ride_character_snowboard_mag, responsive_poppy_flexible_forgiving_elegant); 0.21::true_val(ride_character_snowboard_mag, unk_ride_character_snowboard_mag).

measured(s12, ride_character_snowboard_mag, responsive_poppy_flexible_forgiving_elegant).

all_consistent(ride_character_snowboard_mag) :- consistent(s12, ride_character_snowboard_mag).

evidence(all_consistent(ride_character_snowboard_mag)).
query(true_val(ride_character_snowboard_mag, responsive_poppy_flexible_forgiving_elegant)).
query(true_val(ride_character_snowboard_mag, unk_ride_character_snowboard_mag)).

% @attr ride_character_snowboard_mag_editorial
% @type categorical
% @canonical false
% @original_name ride character (Snowboard Magazine editorial)
% @values most_freestyle_centric_resort_street=Most_freestyle_centric_equally_resort_or_street unk_ride_character_snowboard_mag_editorial=Unknown
% @importance 0.80

0.88::acc(s39, ride_character_snowboard_mag_editorial).

0.80::true_val(ride_character_snowboard_mag_editorial, most_freestyle_centric_resort_street); 0.20::true_val(ride_character_snowboard_mag_editorial, unk_ride_character_snowboard_mag_editorial).

measured(s39, ride_character_snowboard_mag_editorial, most_freestyle_centric_resort_street).

all_consistent(ride_character_snowboard_mag_editorial) :- consistent(s39, ride_character_snowboard_mag_editorial).

evidence(all_consistent(ride_character_snowboard_mag_editorial)).
query(true_val(ride_character_snowboard_mag_editorial, most_freestyle_centric_resort_street)).
query(true_val(ride_character_snowboard_mag_editorial, unk_ride_character_snowboard_mag_editorial)).

% @attr ride_character_backcountry
% @type categorical
% @canonical false
% @original_name ride character (backcountry.com)
% @values freeride_stability_freestyle_creativity=Connects_freeride_stability_with_freestyle_creativity unk_ride_character_backcountry=Unknown
% @importance 0.82

0.78::acc(s14, ride_character_backcountry).

0.67::true_val(ride_character_backcountry, freeride_stability_freestyle_creativity); 0.33::true_val(ride_character_backcountry, unk_ride_character_backcountry).

measured(s14, ride_character_backcountry, freeride_stability_freestyle_creativity).

all_consistent(ride_character_backcountry) :-
    (indep(s14), consistent(s14, ride_character_backcountry) ; \+indep(s14)).

evidence(all_consistent(ride_character_backcountry)).
query(true_val(ride_character_backcountry, freeride_stability_freestyle_creativity)).
query(true_val(ride_character_backcountry, unk_ride_character_backcountry)).

% @attr ride_character_evo
% @type categorical
% @canonical false
% @original_name ride character (evo 2023)
% @values am_freestyle_hard_niche_excellent=All_mountain_freestyle_hard_niche_excellent_inspiration unk_ride_character_evo=Unknown
% @importance 0.80

0.78::acc(s21, ride_character_evo).

0.68::true_val(ride_character_evo, am_freestyle_hard_niche_excellent); 0.32::true_val(ride_character_evo, unk_ride_character_evo).

measured(s21, ride_character_evo, am_freestyle_hard_niche_excellent).

all_consistent(ride_character_evo) :-
    (indep(s21), consistent(s21, ride_character_evo) ; \+indep(s21)).

evidence(all_consistent(ride_character_evo)).
query(true_val(ride_character_evo, am_freestyle_hard_niche_excellent)).
query(true_val(ride_character_evo, unk_ride_character_evo)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values pow_jib_board=Pow_jib_board_aggressive_powder_freestyle unk_user_review_forum=Unknown
% @importance 0.78

0.60::acc(s40, user_review_forum).

0.42::true_val(user_review_forum, pow_jib_board); 0.58::true_val(user_review_forum, unk_user_review_forum).

measured(s40, user_review_forum, pow_jib_board).

all_consistent(user_review_forum) :- consistent(s40, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, pow_jib_board)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr binding_pairing_recommendation
% @type categorical
% @canonical false
% @original_name binding pairing recommendation (Looria aggregated reviews)
% @values alibi_transfer_dod=Salomon_Alibi_Bent_Metal_Transfer_Roam_DoD unk_binding_pairing_recommendation=Unknown
% @importance 0.78

0.70::acc(s38, binding_pairing_recommendation).

0.55::true_val(binding_pairing_recommendation, alibi_transfer_dod); 0.45::true_val(binding_pairing_recommendation, unk_binding_pairing_recommendation).

measured(s38, binding_pairing_recommendation, alibi_transfer_dod).

all_consistent(binding_pairing_recommendation) :- consistent(s38, binding_pairing_recommendation).

evidence(all_consistent(binding_pairing_recommendation)).
query(true_val(binding_pairing_recommendation, alibi_transfer_dod)).
query(true_val(binding_pairing_recommendation, unk_binding_pairing_recommendation)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values minimalist_bamboo_gloss=Clean_minimalist_bamboo_visible_gloss_stripe_recycled_flecks unk_topsheet_appearance_description=Unknown
% @importance 0.72

0.86::acc(s12, topsheet_appearance_description).

0.79::true_val(topsheet_appearance_description, minimalist_bamboo_gloss); 0.21::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s12, topsheet_appearance_description, minimalist_bamboo_gloss).

all_consistent(topsheet_appearance_description) :- consistent(s12, topsheet_appearance_description).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, minimalist_bamboo_gloss)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr user_sentiment_looria
% @type categorical
% @canonical false
% @original_name user sentiment (Looria)
% @values high_praise_versatile_fun_strong=High_praise_versatile_fun_strong_balanced unk_user_sentiment_looria=Unknown
% @importance 0.78

0.70::acc(s38, user_sentiment_looria).

0.55::true_val(user_sentiment_looria, high_praise_versatile_fun_strong); 0.45::true_val(user_sentiment_looria, unk_user_sentiment_looria).

measured(s38, user_sentiment_looria, high_praise_versatile_fun_strong).

all_consistent(user_sentiment_looria) :- consistent(s38, user_sentiment_looria).

evidence(all_consistent(user_sentiment_looria)).
query(true_val(user_sentiment_looria, high_praise_versatile_fun_strong)).
query(true_val(user_sentiment_looria, unk_user_sentiment_looria)).

% @attr award_whitelines
% @type categorical
% @canonical false
% @original_name award (Whitelines 2021/22)
% @values whitelines_100=Whitelines_100_top_100_snowboard_products unk_award_whitelines=Unknown
% @importance 0.75

0.88::acc(s8, award_whitelines).

0.84::true_val(award_whitelines, whitelines_100); 0.16::true_val(award_whitelines, unk_award_whitelines).

measured(s8, award_whitelines, whitelines_100).

all_consistent(award_whitelines) :- consistent(s8, award_whitelines).

evidence(all_consistent(award_whitelines)).
query(true_val(award_whitelines, whitelines_100)).
query(true_val(award_whitelines, unk_award_whitelines)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values not_all_pow_boards_pointy=Proof_not_all_powder_boards_have_to_be_pointy unk_reviewer_opinion_whitelines=Unknown
% @importance 0.75

0.88::acc(s8, reviewer_opinion_whitelines).

0.84::true_val(reviewer_opinion_whitelines, not_all_pow_boards_pointy); 0.16::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s8, reviewer_opinion_whitelines, not_all_pow_boards_pointy).

all_consistent(reviewer_opinion_whitelines) :- consistent(s8, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, not_all_pow_boards_pointy)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values yes_pyl_hovercraft_ravine_clovis_open_road=YES_PYL_Jones_Hovercraft_Rome_Ravine_Arbor_Clovis_Lago_Open_Road unk_comparable_board_cross_brand=Unknown
% @importance 0.78

0.60::acc(s40, comparable_board_cross_brand).

0.42::true_val(comparable_board_cross_brand, yes_pyl_hovercraft_ravine_clovis_open_road); 0.58::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s40, comparable_board_cross_brand, yes_pyl_hovercraft_ravine_clovis_open_road).

all_consistent(comparable_board_cross_brand) :- consistent(s40, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, yes_pyl_hovercraft_ravine_clovis_open_road)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values spring_break_marhar=Spring_Break_Powder_Twin_Marhar unk_comparable_board_cross_brand_2=Unknown
% @importance 0.68

0.68::acc(s41, comparable_board_cross_brand_2).

0.53::true_val(comparable_board_cross_brand_2, spring_break_marhar); 0.47::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).

measured(s41, comparable_board_cross_brand_2, spring_break_marhar).

all_consistent(comparable_board_cross_brand_2) :- consistent(s41, comparable_board_cross_brand_2).

evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, spring_break_marhar)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values most_freestyle_vs_catalyst_wolle=Most_freestyle_centric_vs_Catalyst_surfy_Wolle_Fish_speed unk_comparable_board_same_brand=Unknown
% @importance 0.80

0.88::acc(s39, comparable_board_same_brand).

0.80::true_val(comparable_board_same_brand, most_freestyle_vs_catalyst_wolle); 0.20::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s39, comparable_board_same_brand, most_freestyle_vs_catalyst_wolle).

all_consistent(comparable_board_same_brand) :- consistent(s39, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, most_freestyle_vs_catalyst_wolle)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_cross_brand_orca
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values orca_volume_shifted_pow_vs_louif_versatile=Orca_short_wide_pure_pow_vs_Louif_longer_tapered_AM_versatile unk_comparable_board_cross_brand_orca=Unknown
% @importance 0.62

0.50::acc(s42, comparable_board_cross_brand_orca).

0.29::true_val(comparable_board_cross_brand_orca, orca_volume_shifted_pow_vs_louif_versatile); 0.71::true_val(comparable_board_cross_brand_orca, unk_comparable_board_cross_brand_orca).

measured(s42, comparable_board_cross_brand_orca, orca_volume_shifted_pow_vs_louif_versatile).

all_consistent(comparable_board_cross_brand_orca) :- consistent(s42, comparable_board_cross_brand_orca).

evidence(all_consistent(comparable_board_cross_brand_orca)).
query(true_val(comparable_board_cross_brand_orca, orca_volume_shifted_pow_vs_louif_versatile)).
query(true_val(comparable_board_cross_brand_orca, unk_comparable_board_cross_brand_orca)).

% @attr comparable_board_cross_brand_hovercraft
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values hovercraft_straight_line_damp_vs_louif_agile_freestyle=Hovercraft_straight_lining_dampened_vs_Louif_agile_freestyle unk_comparable_board_cross_brand_hovercraft=Unknown
% @importance 0.65

0.78::acc(s43, comparable_board_cross_brand_hovercraft).

0.56::true_val(comparable_board_cross_brand_hovercraft, hovercraft_straight_line_damp_vs_louif_agile_freestyle); 0.44::true_val(comparable_board_cross_brand_hovercraft, unk_comparable_board_cross_brand_hovercraft).

measured(s43, comparable_board_cross_brand_hovercraft, hovercraft_straight_line_damp_vs_louif_agile_freestyle).

all_consistent(comparable_board_cross_brand_hovercraft) :- consistent(s43, comparable_board_cross_brand_hovercraft).

evidence(all_consistent(comparable_board_cross_brand_hovercraft)).
query(true_val(comparable_board_cross_brand_hovercraft, hovercraft_straight_line_damp_vs_louif_agile_freestyle)).
query(true_val(comparable_board_cross_brand_hovercraft, unk_comparable_board_cross_brand_hovercraft)).

% @attr comparable_board_cross_brand_pyl
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values pyl_conventional_freeride_vs_louif_freestyle_jib=PYL_conventional_freeride_vs_Louif_more_freestyle_jib unk_comparable_board_cross_brand_pyl=Unknown
% @importance 0.78

0.60::acc(s40, comparable_board_cross_brand_pyl).

0.42::true_val(comparable_board_cross_brand_pyl, pyl_conventional_freeride_vs_louif_freestyle_jib); 0.58::true_val(comparable_board_cross_brand_pyl, unk_comparable_board_cross_brand_pyl).

measured(s40, comparable_board_cross_brand_pyl, pyl_conventional_freeride_vs_louif_freestyle_jib).

all_consistent(comparable_board_cross_brand_pyl) :- consistent(s40, comparable_board_cross_brand_pyl).

evidence(all_consistent(comparable_board_cross_brand_pyl)).
query(true_val(comparable_board_cross_brand_pyl, pyl_conventional_freeride_vs_louif_freestyle_jib)).
query(true_val(comparable_board_cross_brand_pyl, unk_comparable_board_cross_brand_pyl)).

% @attr not_recommended_for
% @type categorical
% @canonical false
% @original_name not recommended for
% @values pure_park_carving_dominant=Pure_park_rail_or_carving_dominant_specialist_pow_jib unk_not_recommended_for=Unknown
% @importance 0.78

0.60::acc(s40, not_recommended_for).

0.42::true_val(not_recommended_for, pure_park_carving_dominant); 0.58::true_val(not_recommended_for, unk_not_recommended_for).

measured(s40, not_recommended_for, pure_park_carving_dominant).

all_consistent(not_recommended_for) :- consistent(s40, not_recommended_for).

evidence(all_consistent(not_recommended_for)).
query(true_val(not_recommended_for, pure_park_carving_dominant)).
query(true_val(not_recommended_for, unk_not_recommended_for)).