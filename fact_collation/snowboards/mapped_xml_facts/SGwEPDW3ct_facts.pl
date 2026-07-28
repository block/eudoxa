0.15::indep(s13).
0.15::indep(s15).
0.15::indep(s16).
0.15::indep(s17).
0.15::indep(s18).
0.20::indep(s19).
0.15::indep(s25).
0.15::indep(s26).
0.15::indep(s27).
0.20::indep(s28).
0.12::indep(s29).
0.12::indep(s30).
0.20::indep(s31).
0.15::indep(s34).
0.15::indep(s37).
0.25::indep(s38).
0.12::indep(s43).
0.10::indep(s44).
0.10::indep(s45).
0.10::indep(s46).
0.12::indep(s47).
0.12::indep(s48).
0.10::indep(s49).
0.15::indep(s11).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.95::acc(s1, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 1.0

0.85::true_val(brand, salomon); 0.15::true_val(brand, unk_brand).

measured(s1, brand, salomon).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

0.95::acc(s1, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values dancehaul=Dancehaul unk_model_name=Unknown
% @importance 1.0

0.85::true_val(model_name, dancehaul); 0.15::true_val(model_name, unk_model_name).

measured(s1, model_name, dancehaul).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, dancehaul)).
query(true_val(model_name, unk_model_name)).

0.95::acc(s1, model_year).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2026=2026 unk_model_year=Unknown
% @importance 1.0

0.85::true_val(model_year, v2026); 0.15::true_val(model_year, unk_model_year).

measured(s1, model_year, v2026).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2026)).
query(true_val(model_year, unk_model_year)).

0.88::acc(s2, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.4

0.81::true_val(product_type, snowboard); 0.19::true_val(product_type, unk_product_type).

measured(s2, product_type, snowboard).

all_consistent(product_type) :- consistent(s2, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.90::acc(s3, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values salomon_sas_annecy=Salomon_SAS_Annecy_France unk_manufacturer=Unknown
% @importance 0.5

0.78::true_val(manufacturer, salomon_sas_annecy); 0.22::true_val(manufacturer, unk_manufacturer).

measured(s3, manufacturer, salomon_sas_annecy).

all_consistent(manufacturer) :- consistent(s3, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas_annecy)).
query(true_val(manufacturer, unk_manufacturer)).

0.90::acc(s4, parent_company).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports_helsinki=Amer_Sports_Helsinki_Finland unk_parent_company=Unknown
% @importance 0.4

0.78::true_val(parent_company, amer_sports_helsinki); 0.22::true_val(parent_company, unk_parent_company).

measured(s4, parent_company, amer_sports_helsinki).

all_consistent(parent_company) :- consistent(s4, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports_helsinki)).
query(true_val(parent_company, unk_parent_company)).

0.90::acc(s5, amer_sports_ownership).

% @attr amer_sports_ownership
% @type categorical
% @canonical false
% @original_name Amer Sports ownership
% @values anta_sports_since_2018=Anta_Sports_since_2018 unk_amer_sports_ownership=Unknown
% @importance 0.35

0.78::true_val(amer_sports_ownership, anta_sports_since_2018); 0.22::true_val(amer_sports_ownership, unk_amer_sports_ownership).

measured(s5, amer_sports_ownership, anta_sports_since_2018).

all_consistent(amer_sports_ownership) :- consistent(s5, amer_sports_ownership).

evidence(all_consistent(amer_sports_ownership)).
query(true_val(amer_sports_ownership, anta_sports_since_2018)).
query(true_val(amer_sports_ownership, unk_amer_sports_ownership)).

0.90::acc(s6, salomon_founded).

% @attr salomon_founded
% @type categorical
% @canonical false
% @original_name Salomon founded
% @values founded_1947_french_alps=1947_French_Alps unk_salomon_founded=Unknown
% @importance 0.3

0.78::true_val(salomon_founded, founded_1947_french_alps); 0.22::true_val(salomon_founded, unk_salomon_founded).

measured(s6, salomon_founded, founded_1947_french_alps).

all_consistent(salomon_founded) :- consistent(s6, salomon_founded).

evidence(all_consistent(salomon_founded)).
query(true_val(salomon_founded, founded_1947_french_alps)).
query(true_val(salomon_founded, unk_salomon_founded)).

0.75::acc(s7, design_inspiration).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values max_buri_pro=Based_on_Max_Buri_Pro unk_design_inspiration=Unknown
% @importance 0.45

0.60::true_val(design_inspiration, max_buri_pro); 0.40::true_val(design_inspiration, unk_design_inspiration).

measured(s7, design_inspiration, max_buri_pro).

all_consistent(design_inspiration) :- consistent(s7, design_inspiration).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, max_buri_pro)).
query(true_val(design_inspiration, unk_design_inspiration)).

0.78::acc(s8, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values max_buri=Max_Buri_Swiss_Salomon_pro unk_pro_rider_name=Unknown
% @importance 0.3

0.64::true_val(pro_rider_name, max_buri); 0.36::true_val(pro_rider_name, unk_pro_rider_name).

measured(s8, pro_rider_name, max_buri).

all_consistent(pro_rider_name) :- consistent(s8, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, max_buri)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.85::acc(s9, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2020_21=2020_2021_season unk_model_first_available_year=Unknown
% @importance 0.65

0.74::true_val(model_first_available_year, season_2020_21); 0.26::true_val(model_first_available_year, unk_model_first_available_year).

measured(s9, model_first_available_year, season_2020_21).

all_consistent(model_first_available_year) :- consistent(s9, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2020_21)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.78::acc(s10, redesign_year).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values graphics_construction_refinements=Graphics_and_construction_refinements unk_redesign_year=Unknown
% @importance 0.6

0.64::true_val(redesign_year, graphics_construction_refinements); 0.36::true_val(redesign_year, unk_redesign_year).

measured(s10, redesign_year, graphics_construction_refinements).

all_consistent(redesign_year) :- consistent(s10, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, graphics_construction_refinements)).
query(true_val(redesign_year, unk_redesign_year)).

0.80::acc(s11, sku).
0.88::acc(s1, sku).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values l47944800=L47944800 unk_sku=Unknown
% @importance 0.2

0.95::true_val(sku, l47944800); 0.05::true_val(sku, unk_sku).

measured(s11, sku, l47944800).
measured(s1, sku, l47944800).

all_consistent(sku) :-
    consistent(s1, sku),
    (indep(s11), consistent(s11, sku) ; \+indep(s11)).

evidence(all_consistent(sku)).
query(true_val(sku, l47944800)).
query(true_val(sku, unk_sku)).

0.92::acc(s1, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 1.0

0.85::true_val(board_category, all_mountain); 0.15::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain).

all_consistent(board_category) :- consistent(s1, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

0.80::acc(s12, board_subtype_review).

% @attr board_subtype_review
% @type categorical
% @canonical false
% @original_name Board subtype (review classification)
% @values mellow_freeride=Mellow_Freeride unk_board_subtype_review=Unknown
% @importance 0.85

0.64::true_val(board_subtype_review, mellow_freeride); 0.36::true_val(board_subtype_review, unk_board_subtype_review).

measured(s12, board_subtype_review, mellow_freeride).

all_consistent(board_subtype_review) :- consistent(s12, board_subtype_review).

evidence(all_consistent(board_subtype_review)).
query(true_val(board_subtype_review, mellow_freeride)).
query(true_val(board_subtype_review, unk_board_subtype_review)).

0.75::acc(s13, board_subtype_retailer).

% @attr board_subtype_retailer
% @type categorical
% @canonical false
% @original_name Board subtype (retailer classification)
% @values am_freeride_freestyle=All_Mountain_Freeride_Freestyle unk_board_subtype_retailer=Unknown
% @importance 0.85

0.63::true_val(board_subtype_retailer, am_freeride_freestyle); 0.37::true_val(board_subtype_retailer, unk_board_subtype_retailer).

measured(s13, board_subtype_retailer, am_freeride_freestyle).

all_consistent(board_subtype_retailer) :- consistent(s13, board_subtype_retailer).

evidence(all_consistent(board_subtype_retailer)).
query(true_val(board_subtype_retailer, am_freeride_freestyle)).
query(true_val(board_subtype_retailer, unk_board_subtype_retailer)).

0.95::acc(s1, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 1.0

0.85::true_val(gender, unisex); 0.15::true_val(gender, unk_gender).

measured(s1, gender, unisex).

all_consistent(gender) :- consistent(s1, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

0.92::acc(s1, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate=Intermediate unk_rider_level=Unknown
% @importance 1.0

0.85::true_val(rider_level, intermediate); 0.15::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, intermediate).

all_consistent(rider_level) :- consistent(s1, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, unk_rider_level)).

0.78::acc(s13, skill_level_recommendation).
0.55::acc(s44, skill_level_recommendation).
0.82::acc(s62, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_to_advanced=Intermediate_to_Advanced beginner_to_advanced=Beginner_to_Advanced
% @importance 0.72

0.76::true_val(skill_level_recommendation, intermediate_to_advanced); 0.24::true_val(skill_level_recommendation, beginner_to_advanced).

measured(s13, skill_level_recommendation, intermediate_to_advanced).
measured(s44, skill_level_recommendation, beginner_to_advanced).
measured(s62, skill_level_recommendation, intermediate_to_advanced).

all_consistent(skill_level_recommendation) :-
    consistent(s13, skill_level_recommendation),
    (indep(s44), consistent(s44, skill_level_recommendation) ; \+indep(s44)),
    consistent(s62, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_to_advanced)).
query(true_val(skill_level_recommendation, beginner_to_advanced)).

0.80::acc(s14, volume_shift).

% @attr volume_shift
% @type categorical
% @canonical false
% @original_name Volume shift
% @values yes_size_down_5cm=Yes_size_down_5cm unk_volume_shift=Unknown
% @importance 0.8

0.68::true_val(volume_shift, yes_size_down_5cm); 0.32::true_val(volume_shift, unk_volume_shift).

measured(s14, volume_shift, yes_size_down_5cm).

all_consistent(volume_shift) :- consistent(s14, volume_shift).

evidence(all_consistent(volume_shift)).
query(true_val(volume_shift, yes_size_down_5cm)).
query(true_val(volume_shift, unk_volume_shift)).

0.78::acc(s15, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values playful_surfy_creative=Playful_surfy_creative_freestyle unk_riding_style=Unknown
% @importance 0.7

0.70::true_val(riding_style, playful_surfy_creative); 0.30::true_val(riding_style, unk_riding_style).

measured(s15, riding_style, playful_surfy_creative).

all_consistent(riding_style) :- consistent(s15, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, playful_surfy_creative)).
query(true_val(riding_style, unk_riding_style)).

0.75::acc(s16, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_groomers_trees_sidecountry=Powder_groomers_trees_sidecountry unk_terrain_suitability=Unknown
% @importance 0.75

0.60::true_val(terrain_suitability, powder_groomers_trees_sidecountry); 0.40::true_val(terrain_suitability, unk_terrain_suitability).

measured(s16, terrain_suitability, powder_groomers_trees_sidecountry).

all_consistent(terrain_suitability) :- consistent(s16, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_groomers_trees_sidecountry)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.75::acc(s17, skill_level_recommendation_target).

% @attr skill_level_recommendation_target
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (target rider)
% @values surfy_ride_tricks=Fun_surfy_ride_with_tricks unk_skill_level_recommendation_target=Unknown
% @importance 0.75

0.62::true_val(skill_level_recommendation_target, surfy_ride_tricks); 0.38::true_val(skill_level_recommendation_target, unk_skill_level_recommendation_target).

measured(s17, skill_level_recommendation_target, surfy_ride_tricks).

all_consistent(skill_level_recommendation_target) :- consistent(s17, skill_level_recommendation_target).

evidence(all_consistent(skill_level_recommendation_target)).
query(true_val(skill_level_recommendation_target, surfy_ride_tricks)).
query(true_val(skill_level_recommendation_target, unk_skill_level_recommendation_target)).

0.75::acc(s18, terrain_suitability_summary).

% @attr terrain_suitability_summary
% @type categorical
% @canonical false
% @original_name terrain_suitability (summary)
% @values am_powder_float_playful=All_mountain_powder_float_playful_freestyle unk_terrain_suitability_summary=Unknown
% @importance 0.7

0.63::true_val(terrain_suitability_summary, am_powder_float_playful); 0.37::true_val(terrain_suitability_summary, unk_terrain_suitability_summary).

measured(s18, terrain_suitability_summary, am_powder_float_playful).

all_consistent(terrain_suitability_summary) :- consistent(s18, terrain_suitability_summary).

evidence(all_consistent(terrain_suitability_summary)).
query(true_val(terrain_suitability_summary, am_powder_float_playful)).
query(true_val(terrain_suitability_summary, unk_terrain_suitability_summary)).

0.92::acc(s1, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 1.0

0.85::true_val(shape, tapered_directional); 0.15::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).

all_consistent(shape) :- consistent(s1, shape).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

0.82::acc(s19, shape_description).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values taper_2_20mm_loosens_turns=Tail_tapered_2_20mm_loosens_turning unk_shape_description=Unknown
% @importance 0.75

0.75::true_val(shape_description, taper_2_20mm_loosens_turns); 0.25::true_val(shape_description, unk_shape_description).

measured(s19, shape_description, taper_2_20mm_loosens_turns).

all_consistent(shape_description) :- consistent(s19, shape_description).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, taper_2_20mm_loosens_turns)).
query(true_val(shape_description, unk_shape_description)).

0.92::acc(s1, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rock_out_camber=Rock_Out_Camber_flat_camber_rocker unk_camber_type=Unknown
% @importance 1.0

0.85::true_val(camber_type, rock_out_camber); 0.15::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, rock_out_camber).

all_consistent(camber_type) :- consistent(s1, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, rock_out_camber)).
query(true_val(camber_type, unk_camber_type)).

0.92::acc(s1, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radial=Radial_Sidecut unk_sidecut_type=Unknown
% @importance 1.0

0.85::true_val(sidecut_type, radial); 0.15::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, radial).

all_consistent(sidecut_type) :- consistent(s1, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.92::acc(s1, width_category).

% @attr width_category
% @type categorical
% @canonical false
% @original_name Width category
% @values wide=Wide unk_width_category=Unknown
% @importance 1.0

0.85::true_val(width_category, wide); 0.15::true_val(width_category, unk_width_category).

measured(s1, width_category, wide).

all_consistent(width_category) :- consistent(s1, width_category).

evidence(all_consistent(width_category)).
query(true_val(width_category, wide)).
query(true_val(width_category, unk_width_category)).

0.82::acc(s20, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_progressive=Directional_progressive_nose_to_tail unk_flex_direction=Unknown
% @importance 0.7

0.70::true_val(flex_direction, directional_progressive); 0.30::true_val(flex_direction, unk_flex_direction).

measured(s20, flex_direction, directional_progressive).

all_consistent(flex_direction) :- consistent(s20, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_progressive)).
query(true_val(flex_direction, unk_flex_direction)).

0.82::acc(s21, taper).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v12=12.0
% @importance 0.65

0.64::true_val(taper, v12); 0.36::true_val(taper, unk_taper).

measured(s21, taper, v12).

all_consistent(taper) :- consistent(s21, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v12)).
query(true_val(taper, unk_taper)).

0.85::acc(s22, setback).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 0.7

0.74::true_val(setback, v0); 0.26::true_val(setback, unk_setback).

measured(s22, setback, v0).

all_consistent(setback) :- consistent(s22, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

0.88::acc(s1, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v5=5.0 unk_flex_rating_10=Unknown
% @importance 1.0

0.85::true_val(flex_rating_10, v5); 0.15::true_val(flex_rating_10, unk_flex_rating_10).

measured(s1, flex_rating_10, v5).

all_consistent(flex_rating_10) :- consistent(s1, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.75::acc(s13, flex_rating_5).

% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical true
% @original_name flex_rating_5
% @values v3=3.0 unk_flex_rating_5=Unknown
% @importance 0.85

0.63::true_val(flex_rating_5, v3); 0.37::true_val(flex_rating_5, unk_flex_rating_5).

measured(s13, flex_rating_5, v3).

all_consistent(flex_rating_5) :- consistent(s13, flex_rating_5).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v3)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

0.82::acc(s12, flex_feel).

% @attr flex_feel
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_feel
% @values v6=6.0 unk_flex_feel=Unknown
% @importance 0.85

0.64::true_val(flex_feel, v6); 0.36::true_val(flex_feel, unk_flex_feel).

measured(s12, flex_feel, v6).

all_consistent(flex_feel) :- consistent(s12, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, v6)).
query(true_val(flex_feel, unk_flex_feel)).

0.75::acc(s23, flex_feel_balanced).

% @attr flex_feel_balanced
% @type categorical
% @canonical false
% @original_name flex_feel (balanced description)
% @values balanced_power_playful=Balanced_power_carving_playful_freestyle unk_flex_feel_balanced=Unknown
% @importance 0.8

0.63::true_val(flex_feel_balanced, balanced_power_playful); 0.37::true_val(flex_feel_balanced, unk_flex_feel_balanced).

measured(s23, flex_feel_balanced, balanced_power_playful).

all_consistent(flex_feel_balanced) :- consistent(s23, flex_feel_balanced).

evidence(all_consistent(flex_feel_balanced)).
query(true_val(flex_feel_balanced, balanced_power_playful)).
query(true_val(flex_feel_balanced, unk_flex_feel_balanced)).

0.68::acc(s24, flex_feel_pattern).

% @attr flex_feel_pattern
% @type categorical
% @canonical false
% @original_name flex_feel (pattern)
% @values softer_nose_stiffer_tail=Softer_nose_stiffer_tail unk_flex_feel_pattern=Unknown
% @importance 0.65

0.38::true_val(flex_feel_pattern, softer_nose_stiffer_tail); 0.62::true_val(flex_feel_pattern, unk_flex_feel_pattern).

measured(s24, flex_feel_pattern, softer_nose_stiffer_tail).

all_consistent(flex_feel_pattern) :- consistent(s24, flex_feel_pattern).

evidence(all_consistent(flex_feel_pattern)).
query(true_val(flex_feel_pattern, softer_nose_stiffer_tail)).
query(true_val(flex_feel_pattern, unk_flex_feel_pattern)).

0.90::acc(s1, core_material).
0.80::acc(s25, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_slct_fsc=Aspen_SLCT_FSC_certified unk_core_material=Unknown
% @importance 0.85

0.95::true_val(core_material, aspen_slct_fsc); 0.05::true_val(core_material, unk_core_material).

measured(s1, core_material, aspen_slct_fsc).
measured(s25, core_material, aspen_slct_fsc).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s25), consistent(s25, core_material) ; \+indep(s25)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_slct_fsc)).
query(true_val(core_material, unk_core_material)).

0.90::acc(s1, core_profiling).

% @attr core_profiling
% @type categorical
% @canonical false
% @original_name Core profiling
% @values popster=Popster_milled_insert_packs unk_core_profiling=Unknown
% @importance 1.0

0.85::true_val(core_profiling, popster); 0.15::true_val(core_profiling, unk_core_profiling).

measured(s1, core_profiling, popster).

all_consistent(core_profiling) :- consistent(s1, core_profiling).

evidence(all_consistent(core_profiling)).
query(true_val(core_profiling, popster)).
query(true_val(core_profiling, unk_core_profiling)).

0.82::acc(s26, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values ba_md_fiberglass=BA_MD_Biaxial_Medium_Density_Fiberglass unk_laminate=Unknown
% @importance 0.6

0.78::true_val(laminate, ba_md_fiberglass); 0.22::true_val(laminate, unk_laminate).

measured(s26, laminate, ba_md_fiberglass).

all_consistent(laminate) :- consistent(s26, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, ba_md_fiberglass)).
query(true_val(laminate, unk_laminate)).

0.90::acc(s1, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values ghost_basalt_stringers=Ghost_Basalt_Stringers_triax unk_construction_material_innovation=Unknown
% @importance 1.0

0.85::true_val(construction_material_innovation, ghost_basalt_stringers); 0.15::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, ghost_basalt_stringers).

all_consistent(construction_material_innovation) :- consistent(s1, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, ghost_basalt_stringers)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.90::acc(s1, resin).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values bio_based_30pct=30pct_Bio_Based_Resin unk_resin=Unknown
% @importance 1.0

0.85::true_val(resin, bio_based_30pct); 0.15::true_val(resin, unk_resin).

measured(s1, resin, bio_based_30pct).

all_consistent(resin) :- consistent(s1, resin).

evidence(all_consistent(resin)).
query(true_val(resin, bio_based_30pct)).
query(true_val(resin, unk_resin)).

0.88::acc(s1, sidewall_material).
0.78::acc(s27, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs=Recycled_ABS_sidewall unk_sidewall_material=Unknown
% @importance 0.75

0.95::true_val(sidewall_material, recycled_abs); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s1, sidewall_material, recycled_abs).
measured(s27, sidewall_material, recycled_abs).

all_consistent(sidewall_material) :-
    consistent(s1, sidewall_material),
    (indep(s27), consistent(s27, sidewall_material) ; \+indep(s27)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.88::acc(s1, edge_bevel_spec).
0.82::acc(s28, edge_bevel_spec).
0.60::acc(s29, edge_bevel_spec).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values v1_5_base_and_side=1_5deg_base_and_side v1_nose_tail_2_feet=1deg_nose_tail_2deg_feet
% @importance 0.55

0.70::true_val(edge_bevel_spec, v1_5_base_and_side); 0.30::true_val(edge_bevel_spec, v1_nose_tail_2_feet).

measured(s1, edge_bevel_spec, v1_5_base_and_side).
measured(s28, edge_bevel_spec, v1_5_base_and_side).
measured(s29, edge_bevel_spec, v1_nose_tail_2_feet).

all_consistent(edge_bevel_spec) :-
    consistent(s1, edge_bevel_spec),
    (indep(s28), consistent(s28, edge_bevel_spec) ; \+indep(s28)),
    (indep(s29), consistent(s29, edge_bevel_spec) ; \+indep(s29)).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, v1_5_base_and_side)).
query(true_val(edge_bevel_spec, v1_nose_tail_2_feet)).

0.90::acc(s1, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered=Sintered_base unk_base_material=Unknown
% @importance 1.0

0.85::true_val(base_material, sintered); 0.15::true_val(base_material, unk_base_material).

measured(s1, base_material, sintered).

all_consistent(base_material) :- consistent(s1, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered)).
query(true_val(base_material, unk_base_material)).

0.88::acc(s1, base_finish).

% @attr base_finish
% @type categorical
% @canonical false
% @original_name Base finish
% @values fine_stone=Fine_Stone_Finish unk_base_finish=Unknown
% @importance 1.0

0.85::true_val(base_finish, fine_stone); 0.15::true_val(base_finish, unk_base_finish).

measured(s1, base_finish, fine_stone).

all_consistent(base_finish) :- consistent(s1, base_finish).

evidence(all_consistent(base_finish)).
query(true_val(base_finish, fine_stone)).
query(true_val(base_finish, unk_base_finish)).

0.72::acc(s30, factory_wax).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values natural_paraffin_free=Natural_paraffin_free_wax unk_factory_wax=Unknown
% @importance 0.4

0.55::true_val(factory_wax, natural_paraffin_free); 0.45::true_val(factory_wax, unk_factory_wax).

measured(s30, factory_wax, natural_paraffin_free).

all_consistent(factory_wax) :- consistent(s30, factory_wax).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, natural_paraffin_free)).
query(true_val(factory_wax, unk_factory_wax)).

0.90::acc(s1, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.85::true_val(mounting_pattern, inserts_2x4); 0.15::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.78::acc(s31, construction_type).

% @attr construction_type
% @type categorical
% @canonical false
% @original_name Construction
% @values sandwich_sidewall=Sandwich_sidewall_construction unk_construction_type=Unknown
% @importance 0.55

0.62::true_val(construction_type, sandwich_sidewall); 0.38::true_val(construction_type, unk_construction_type).

measured(s31, construction_type, sandwich_sidewall).

all_consistent(construction_type) :- consistent(s31, construction_type).

evidence(all_consistent(construction_type)).
query(true_val(construction_type, sandwich_sidewall)).
query(true_val(construction_type, unk_construction_type)).

0.85::acc(s25, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_wood=FSC_certified_wood_core unk_sustainability_certification=Unknown
% @importance 0.7

0.78::true_val(sustainability_certification, fsc_certified_wood); 0.22::true_val(sustainability_certification, unk_sustainability_certification).

measured(s25, sustainability_certification, fsc_certified_wood).

all_consistent(sustainability_certification) :- consistent(s25, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_wood)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.88::acc(s1, sustainability_certification_bio_resin).

% @attr sustainability_certification_bio_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification (bio resin)
% @values bio_resin_30pct=30pct_Bio_Based_Resin unk_sustainability_certification_bio_resin=Unknown
% @importance 1.0

0.85::true_val(sustainability_certification_bio_resin, bio_resin_30pct); 0.15::true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin).

measured(s1, sustainability_certification_bio_resin, bio_resin_30pct).

all_consistent(sustainability_certification_bio_resin) :- consistent(s1, sustainability_certification_bio_resin).

evidence(all_consistent(sustainability_certification_bio_resin)).
query(true_val(sustainability_certification_bio_resin, bio_resin_30pct)).
query(true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin)).

0.75::acc(s27, sustainability_certification_recycled_abs).

% @attr sustainability_certification_recycled_abs
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled ABS)
% @values recycled_abs_sidewalls=Recycled_ABS_sidewalls unk_sustainability_certification_recycled_abs=Unknown
% @importance 0.5

0.64::true_val(sustainability_certification_recycled_abs, recycled_abs_sidewalls); 0.36::true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs).

measured(s27, sustainability_certification_recycled_abs, recycled_abs_sidewalls).

all_consistent(sustainability_certification_recycled_abs) :- consistent(s27, sustainability_certification_recycled_abs).

evidence(all_consistent(sustainability_certification_recycled_abs)).
query(true_val(sustainability_certification_recycled_abs, recycled_abs_sidewalls)).
query(true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs)).

0.72::acc(s30, sustainability_certification_natural_wax).

% @attr sustainability_certification_natural_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification (natural wax)
% @values natural_wax_paraffin_free=Natural_paraffin_free_wax unk_sustainability_certification_natural_wax=Unknown
% @importance 0.4

0.55::true_val(sustainability_certification_natural_wax, natural_wax_paraffin_free); 0.45::true_val(sustainability_certification_natural_wax, unk_sustainability_certification_natural_wax).

measured(s30, sustainability_certification_natural_wax, natural_wax_paraffin_free).

all_consistent(sustainability_certification_natural_wax) :- consistent(s30, sustainability_certification_natural_wax).

evidence(all_consistent(sustainability_certification_natural_wax)).
query(true_val(sustainability_certification_natural_wax, natural_wax_paraffin_free)).
query(true_val(sustainability_certification_natural_wax, unk_sustainability_certification_natural_wax)).

0.88::acc(s1, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s143_147_152_154_157=143_147_152_154_157cm unk_available_sizes=Unknown
% @importance 1.0

0.85::true_val(available_sizes, s143_147_152_154_157); 0.15::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, s143_147_152_154_157).

all_consistent(available_sizes) :- consistent(s1, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s143_147_152_154_157)).
query(true_val(available_sizes, unk_available_sizes)).

0.80::acc(s32, available_sizes_2025).

% @attr available_sizes_2025
% @type categorical
% @canonical false
% @original_name available_sizes (2025 model 139cm)
% @values included_139cm=139cm_existed_in_2025 unk_available_sizes_2025=Unknown
% @importance 0.5

0.68::true_val(available_sizes_2025, included_139cm); 0.32::true_val(available_sizes_2025, unk_available_sizes_2025).

measured(s32, available_sizes_2025, included_139cm).

all_consistent(available_sizes_2025) :- consistent(s32, available_sizes_2025).

evidence(all_consistent(available_sizes_2025)).
query(true_val(available_sizes_2025, included_139cm)).
query(true_val(available_sizes_2025, unk_available_sizes_2025)).

0.88::acc(s1, effective_edge_143).

% @attr effective_edge_143
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (143cm)
% @values v107_5=107.5 unk_effective_edge_143=Unknown
% @importance 1.0

0.85::true_val(effective_edge_143, v107_5); 0.15::true_val(effective_edge_143, unk_effective_edge_143).

measured(s1, effective_edge_143, v107_5).

all_consistent(effective_edge_143) :- consistent(s1, effective_edge_143).

evidence(all_consistent(effective_edge_143)).
query(true_val(effective_edge_143, v107_5)).
query(true_val(effective_edge_143, unk_effective_edge_143)).

0.88::acc(s1, waist_width_143).

% @attr waist_width_143
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (143cm)
% @values v24_7=24.7 unk_waist_width_143=Unknown
% @importance 1.0

0.85::true_val(waist_width_143, v24_7); 0.15::true_val(waist_width_143, unk_waist_width_143).

measured(s1, waist_width_143, v24_7).

all_consistent(waist_width_143) :- consistent(s1, waist_width_143).

evidence(all_consistent(waist_width_143)).
query(true_val(waist_width_143, v24_7)).
query(true_val(waist_width_143, unk_waist_width_143)).

0.88::acc(s1, sidecut_radius_size_143).

% @attr sidecut_radius_size_143
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (143cm)
% @values v6_6=6.6 unk_sidecut_radius_size_143=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_143, v6_6); 0.15::true_val(sidecut_radius_size_143, unk_sidecut_radius_size_143).

measured(s1, sidecut_radius_size_143, v6_6).

all_consistent(sidecut_radius_size_143) :- consistent(s1, sidecut_radius_size_143).

evidence(all_consistent(sidecut_radius_size_143)).
query(true_val(sidecut_radius_size_143, v6_6)).
query(true_val(sidecut_radius_size_143, unk_sidecut_radius_size_143)).

0.88::acc(s1, tip_tail_width_size_143).

% @attr tip_tail_width_size_143
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (143cm)
% @values v29_4_24_7=29.4/24.7 unk_tip_tail_width_size_143=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size_143, v29_4_24_7); 0.15::true_val(tip_tail_width_size_143, unk_tip_tail_width_size_143).

measured(s1, tip_tail_width_size_143, v29_4_24_7).

all_consistent(tip_tail_width_size_143) :- consistent(s1, tip_tail_width_size_143).

evidence(all_consistent(tip_tail_width_size_143)).
query(true_val(tip_tail_width_size_143, v29_4_24_7)).
query(true_val(tip_tail_width_size_143, unk_tip_tail_width_size_143)).

0.88::acc(s1, stance_width_range_size_143).

% @attr stance_width_range_size_143
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (143cm)
% @values v52_0=52.0 unk_stance_width_range_size_143=Unknown
% @importance 1.0

0.85::true_val(stance_width_range_size_143, v52_0); 0.15::true_val(stance_width_range_size_143, unk_stance_width_range_size_143).

measured(s1, stance_width_range_size_143, v52_0).

all_consistent(stance_width_range_size_143) :- consistent(s1, stance_width_range_size_143).

evidence(all_consistent(stance_width_range_size_143)).
query(true_val(stance_width_range_size_143, v52_0)).
query(true_val(stance_width_range_size_143, unk_stance_width_range_size_143)).

0.88::acc(s1, recommended_weight_range_size_143).

% @attr recommended_weight_range_size_143
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (143cm)
% @values w50_70=50-70kg unk_recommended_weight_range_size_143=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_143, w50_70); 0.15::true_val(recommended_weight_range_size_143, unk_recommended_weight_range_size_143).

measured(s1, recommended_weight_range_size_143, w50_70).

all_consistent(recommended_weight_range_size_143) :- consistent(s1, recommended_weight_range_size_143).

evidence(all_consistent(recommended_weight_range_size_143)).
query(true_val(recommended_weight_range_size_143, w50_70)).
query(true_val(recommended_weight_range_size_143, unk_recommended_weight_range_size_143)).

0.88::acc(s1, effective_edge_147).

% @attr effective_edge_147
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (147cm)
% @values v110_0=110.0 unk_effective_edge_147=Unknown
% @importance 1.0

0.85::true_val(effective_edge_147, v110_0); 0.15::true_val(effective_edge_147, unk_effective_edge_147).

measured(s1, effective_edge_147, v110_0).

all_consistent(effective_edge_147) :- consistent(s1, effective_edge_147).

evidence(all_consistent(effective_edge_147)).
query(true_val(effective_edge_147, v110_0)).
query(true_val(effective_edge_147, unk_effective_edge_147)).

0.88::acc(s1, waist_width_147).

% @attr waist_width_147
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (147cm)
% @values v25_5=25.5 unk_waist_width_147=Unknown
% @importance 1.0

0.85::true_val(waist_width_147, v25_5); 0.15::true_val(waist_width_147, unk_waist_width_147).

measured(s1, waist_width_147, v25_5).

all_consistent(waist_width_147) :- consistent(s1, waist_width_147).

evidence(all_consistent(waist_width_147)).
query(true_val(waist_width_147, v25_5)).
query(true_val(waist_width_147, unk_waist_width_147)).

0.88::acc(s1, sidecut_radius_size_147).

% @attr sidecut_radius_size_147
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (147cm)
% @values v6_8=6.8 unk_sidecut_radius_size_147=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_147, v6_8); 0.15::true_val(sidecut_radius_size_147, unk_sidecut_radius_size_147).

measured(s1, sidecut_radius_size_147, v6_8).

all_consistent(sidecut_radius_size_147) :- consistent(s1, sidecut_radius_size_147).

evidence(all_consistent(sidecut_radius_size_147)).
query(true_val(sidecut_radius_size_147, v6_8)).
query(true_val(sidecut_radius_size_147, unk_sidecut_radius_size_147)).

0.88::acc(s1, tip_tail_width_size_147).

% @attr tip_tail_width_size_147
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (147cm)
% @values v30_2_29_0=30.2/29.0 unk_tip_tail_width_size_147=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size_147, v30_2_29_0); 0.15::true_val(tip_tail_width_size_147, unk_tip_tail_width_size_147).

measured(s1, tip_tail_width_size_147, v30_2_29_0).

all_consistent(tip_tail_width_size_147) :- consistent(s1, tip_tail_width_size_147).

evidence(all_consistent(tip_tail_width_size_147)).
query(true_val(tip_tail_width_size_147, v30_2_29_0)).
query(true_val(tip_tail_width_size_147, unk_tip_tail_width_size_147)).

0.88::acc(s1, stance_width_range_size_147).

% @attr stance_width_range_size_147
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (147cm)
% @values v53_5=53.5 unk_stance_width_range_size_147=Unknown
% @importance 1.0

0.85::true_val(stance_width_range_size_147, v53_5); 0.15::true_val(stance_width_range_size_147, unk_stance_width_range_size_147).

measured(s1, stance_width_range_size_147, v53_5).

all_consistent(stance_width_range_size_147) :- consistent(s1, stance_width_range_size_147).

evidence(all_consistent(stance_width_range_size_147)).
query(true_val(stance_width_range_size_147, v53_5)).
query(true_val(stance_width_range_size_147, unk_stance_width_range_size_147)).

0.88::acc(s1, recommended_weight_range_size_147).

% @attr recommended_weight_range_size_147
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (147cm)
% @values w60_85=60-85kg unk_recommended_weight_range_size_147=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_147, w60_85); 0.15::true_val(recommended_weight_range_size_147, unk_recommended_weight_range_size_147).

measured(s1, recommended_weight_range_size_147, w60_85).

all_consistent(recommended_weight_range_size_147) :- consistent(s1, recommended_weight_range_size_147).

evidence(all_consistent(recommended_weight_range_size_147)).
query(true_val(recommended_weight_range_size_147, w60_85)).
query(true_val(recommended_weight_range_size_147, unk_recommended_weight_range_size_147)).

0.88::acc(s1, effective_edge_152).

% @attr effective_edge_152
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (152cm)
% @values v113_5=113.5 unk_effective_edge_152=Unknown
% @importance 1.0

0.85::true_val(effective_edge_152, v113_5); 0.15::true_val(effective_edge_152, unk_effective_edge_152).

measured(s1, effective_edge_152, v113_5).

all_consistent(effective_edge_152) :- consistent(s1, effective_edge_152).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v113_5)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

0.88::acc(s1, waist_width_152).

% @attr waist_width_152
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (152cm)
% @values v26_4=26.4 unk_waist_width_152=Unknown
% @importance 1.0

0.85::true_val(waist_width_152, v26_4); 0.15::true_val(waist_width_152, unk_waist_width_152).

measured(s1, waist_width_152, v26_4).

all_consistent(waist_width_152) :- consistent(s1, waist_width_152).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v26_4)).
query(true_val(waist_width_152, unk_waist_width_152)).

0.88::acc(s1, sidecut_radius_size_152).

% @attr sidecut_radius_size_152
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (152cm)
% @values v7_0=7.0 unk_sidecut_radius_size_152=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_152, v7_0); 0.15::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

measured(s1, sidecut_radius_size_152, v7_0).

all_consistent(sidecut_radius_size_152) :- consistent(s1, sidecut_radius_size_152).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v7_0)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

0.88::acc(s1, tip_tail_width_size_152).

% @attr tip_tail_width_size_152
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (152cm)
% @values v31_2_30_0=31.2/30.0 unk_tip_tail_width_size_152=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size_152, v31_2_30_0); 0.15::true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152).

measured(s1, tip_tail_width_size_152, v31_2_30_0).

all_consistent(tip_tail_width_size_152) :- consistent(s1, tip_tail_width_size_152).

evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, v31_2_30_0)).
query(true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152)).

0.88::acc(s1, stance_width_range_size_152).

% @attr stance_width_range_size_152
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (152cm)
% @values v55_0=55.0 unk_stance_width_range_size_152=Unknown
% @importance 1.0

0.85::true_val(stance_width_range_size_152, v55_0); 0.15::true_val(stance_width_range_size_152, unk_stance_width_range_size_152).

measured(s1, stance_width_range_size_152, v55_0).

all_consistent(stance_width_range_size_152) :- consistent(s1, stance_width_range_size_152).

evidence(all_consistent(stance_width_range_size_152)).
query(true_val(stance_width_range_size_152, v55_0)).
query(true_val(stance_width_range_size_152, unk_stance_width_range_size_152)).

0.88::acc(s1, recommended_weight_range_size_152).

% @attr recommended_weight_range_size_152
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (152cm)
% @values w70_90=70-90kg unk_recommended_weight_range_size_152=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_152, w70_90); 0.15::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(s1, recommended_weight_range_size_152, w70_90).

all_consistent(recommended_weight_range_size_152) :- consistent(s1, recommended_weight_range_size_152).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, w70_90)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

0.88::acc(s1, effective_edge_154).

% @attr effective_edge_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (154cm)
% @values v115_0=115.0 unk_effective_edge_154=Unknown
% @importance 1.0

0.85::true_val(effective_edge_154, v115_0); 0.15::true_val(effective_edge_154, unk_effective_edge_154).

measured(s1, effective_edge_154, v115_0).

all_consistent(effective_edge_154) :- consistent(s1, effective_edge_154).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v115_0)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

0.88::acc(s1, waist_width_154).

% @attr waist_width_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (154cm)
% @values v26_6=26.6 unk_waist_width_154=Unknown
% @importance 1.0

0.85::true_val(waist_width_154, v26_6); 0.15::true_val(waist_width_154, unk_waist_width_154).

measured(s1, waist_width_154, v26_6).

all_consistent(waist_width_154) :- consistent(s1, waist_width_154).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v26_6)).
query(true_val(waist_width_154, unk_waist_width_154)).

0.88::acc(s1, sidecut_radius_size_154).

% @attr sidecut_radius_size_154
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (154cm)
% @values v7_1=7.1 unk_sidecut_radius_size_154=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_154, v7_1); 0.15::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).

measured(s1, sidecut_radius_size_154, v7_1).

all_consistent(sidecut_radius_size_154) :- consistent(s1, sidecut_radius_size_154).

evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_1)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

0.88::acc(s1, tip_tail_width_size_154).

% @attr tip_tail_width_size_154
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (154cm)
% @values v31_5_30_3=31.5/30.3 unk_tip_tail_width_size_154=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size_154, v31_5_30_3); 0.15::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).

measured(s1, tip_tail_width_size_154, v31_5_30_3).

all_consistent(tip_tail_width_size_154) :- consistent(s1, tip_tail_width_size_154).

evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v31_5_30_3)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

0.88::acc(s1, stance_width_range_size_154).

% @attr stance_width_range_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size (154cm)
% @values v55_5=55.5 unk_stance_width_range_size_154=Unknown
% @importance 1.0

0.85::true_val(stance_width_range_size_154, v55_5); 0.15::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).

measured(s1, stance_width_range_size_154, v55_5).

all_consistent(stance_width_range_size_154) :- consistent(s1, stance_width_range_size_154).

evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v55_5)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

0.88::acc(s1, recommended_weight_range_size_154).

% @attr recommended_weight_range_size_154
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (154cm)
% @values w70_100=70-100kg unk_recommended_weight_range_size_154=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size_154, w70_100); 0.15::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(s1, recommended_weight_range_size_154, w70_100).

all_consistent(recommended_weight_range_size_154) :- consistent(s1, recommended_weight_range_size_154).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, w70_100)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

0.88::acc(s1, effective_edge_157).

% @attr effective_edge_157
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (157cm)
% @values v117_0=117.0 unk_effective_edge_157=Unknown
% @importance 1.0

0.85::true_val(effective_edge_157, v117_0); 0.15::true_val(effective_edge_157, unk_effective_edge_157).

measured(s1, effective_edge_157, v117_0).

all_consistent(effective_edge_157) :- consistent(s1, effective_edge_157).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v117_0)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

0.88::acc(s1, waist_width_157).

% @attr waist_width_157
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (157cm)
% @values v26_9=26.9 unk_waist_width_157=Unknown
% @importance 1.0

0.85::true_val(waist_width_157, v26_9); 0.15::true_val(waist_width_157, unk_waist_width_157).

measured(s1, waist_width_157, v26_9).

all_consistent(waist_width_157) :- consistent(s1, waist_width_157).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v26_9)).
query(true_val(waist_width_157, unk_waist_width_157)).

0.88::acc(s1, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size (157cm)
% @values v7_2=7.2 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size, v7_2); 0.15::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v7_2).

all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_2)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.88::acc(s1, tip_tail_width_size).

% @attr tip_tail_width_size
% @type categorical
% @unit cm
% @canonical true
% @original_name tip_tail_width_size (157cm)
% @values v32_0_30_8=32.0/30.8 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size, v32_0_30_8); 0.15::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v32_0_30_8).

all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v32_0_30_8)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.88::acc(s1, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size (157cm)
% @values v56_5=56.5 unk_stance_width_range_size=Unknown
% @importance 1.0

0.85::true_val(stance_width_range_size, v56_5); 0.15::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, v56_5).

all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_5)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.88::acc(s1, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (157cm)
% @values w70_105=70-105kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.85::true_val(recommended_weight_range_size, w70_105); 0.15::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, w70_105).

all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w70_105)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.82::acc(s33, boot_sizes_152).

% @attr boot_sizes_152
% @type categorical
% @canonical false
% @original_name Recommended boot sizes 152
% @values us9_10=US_9_to_10 unk_boot_sizes_152=Unknown
% @importance 0.8

0.68::true_val(boot_sizes_152, us9_10); 0.32::true_val(boot_sizes_152, unk_boot_sizes_152).

measured(s33, boot_sizes_152, us9_10).

all_consistent(boot_sizes_152) :- consistent(s33, boot_sizes_152).

evidence(all_consistent(boot_sizes_152)).
query(true_val(boot_sizes_152, us9_10)).
query(true_val(boot_sizes_152, unk_boot_sizes_152)).

0.82::acc(s33, boot_sizes_154).

% @attr boot_sizes_154
% @type categorical
% @canonical false
% @original_name Recommended boot sizes 154
% @values us9_5_10_5=US_9_5_to_10_5 unk_boot_sizes_154=Unknown
% @importance 0.8

0.68::true_val(boot_sizes_154, us9_5_10_5); 0.32::true_val(boot_sizes_154, unk_boot_sizes_154).

measured(s33, boot_sizes_154, us9_5_10_5).

all_consistent(boot_sizes_154) :- consistent(s33, boot_sizes_154).

evidence(all_consistent(boot_sizes_154)).
query(true_val(boot_sizes_154, us9_5_10_5)).
query(true_val(boot_sizes_154, unk_boot_sizes_154)).

0.82::acc(s33, boot_sizes_157).

% @attr boot_sizes_157
% @type categorical
% @canonical false
% @original_name Recommended boot sizes 157
% @values us10_11=US_10_to_11 unk_boot_sizes_157=Unknown
% @importance 0.8

0.68::true_val(boot_sizes_157, us10_11); 0.32::true_val(boot_sizes_157, unk_boot_sizes_157).

measured(s33, boot_sizes_157, us10_11).

all_consistent(boot_sizes_157) :- consistent(s33, boot_sizes_157).

evidence(all_consistent(boot_sizes_157)).
query(true_val(boot_sizes_157, us10_11)).
query(true_val(boot_sizes_157, unk_boot_sizes_157)).

0.72::acc(s34, recommended_sizing).

% @attr recommended_sizing
% @type categorical
% @canonical false
% @original_name Recommended sizing approach
% @values size_down_4_5cm=Size_down_4_to_5cm unk_recommended_sizing=Unknown
% @importance 0.75

0.55::true_val(recommended_sizing, size_down_4_5cm); 0.45::true_val(recommended_sizing, unk_recommended_sizing).

measured(s34, recommended_sizing, size_down_4_5cm).

all_consistent(recommended_sizing) :- consistent(s34, recommended_sizing).

evidence(all_consistent(recommended_sizing)).
query(true_val(recommended_sizing, size_down_4_5cm)).
query(true_val(recommended_sizing, unk_recommended_sizing)).

0.78::acc(s35, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.75

0.67::true_val(warranty_period_years, v2); 0.33::true_val(warranty_period_years, unk_warranty_period_years).

measured(s35, warranty_period_years, v2).

all_consistent(warranty_period_years) :- consistent(s35, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.88::acc(s1, price_aud_merchant_rrp).

% @attr price_aud_merchant_rrp
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant (RRP)
% @values v849_99=849.99 unk_price_aud_merchant_rrp=Unknown
% @importance 1.0

0.85::true_val(price_aud_merchant_rrp, v849_99); 0.15::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s1, price_aud_merchant_rrp, v849_99).

all_consistent(price_aud_merchant_rrp) :- consistent(s1, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v849_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

0.88::acc(s1, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v679_99=679.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.85::true_val(price_aud_merchant, v679_99); 0.15::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s1, price_aud_merchant, v679_99).

all_consistent(price_aud_merchant) :- consistent(s1, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v679_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.88::acc(s1, availability_status_merchant).

% @attr availability_status_merchant
% @type categorical
% @canonical false
% @original_name availability_status (merchant)
% @values sold_out=Sold_out unk_availability_status_merchant=Unknown
% @importance 1.0

0.85::true_val(availability_status_merchant, sold_out); 0.15::true_val(availability_status_merchant, unk_availability_status_merchant).

measured(s1, availability_status_merchant, sold_out).

all_consistent(availability_status_merchant) :- consistent(s1, availability_status_merchant).

evidence(all_consistent(availability_status_merchant)).
query(true_val(availability_status_merchant, sold_out)).
query(true_val(availability_status_merchant, unk_availability_status_merchant)).

0.88::acc(s36, price_usd_msrp).
0.78::acc(s12, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v549_95=549.95 unk_price_usd_msrp=Unknown
% @importance 0.9

0.95::true_val(price_usd_msrp, v549_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s36, price_usd_msrp, v549_95).
measured(s12, price_usd_msrp, v549_95).

all_consistent(price_usd_msrp) :-
    consistent(s36, price_usd_msrp),
    consistent(s12, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v549_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.88::acc(s36, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v439_96=439.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.81::true_val(price_usd_evo, v439_96); 0.19::true_val(price_usd_evo, unk_price_usd_evo).

measured(s36, price_usd_evo, v439_96).

all_consistent(price_usd_evo) :- consistent(s36, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v439_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.88::acc(s37, price_usd_tactics).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v439_95=439.95 unk_price_usd_tactics=Unknown
% @importance 0.95

0.81::true_val(price_usd_tactics, v439_95); 0.19::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s37, price_usd_tactics, v439_95).

all_consistent(price_usd_tactics) :- consistent(s37, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v439_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

0.80::acc(s38, price_usd_powder7).

% @attr price_usd_powder7
% @type numeric
% @unit USD
% @canonical false
% @original_name USD sale price at Powder7
% @values v439_96=439.96 unk_price_usd_powder7=Unknown
% @importance 0.9

0.71::true_val(price_usd_powder7, v439_96); 0.29::true_val(price_usd_powder7, unk_price_usd_powder7).

measured(s38, price_usd_powder7, v439_96).

all_consistent(price_usd_powder7) :- consistent(s38, price_usd_powder7).

evidence(all_consistent(price_usd_powder7)).
query(true_val(price_usd_powder7, v439_96)).
query(true_val(price_usd_powder7, unk_price_usd_powder7)).

0.72::acc(s39, price_usd_sun_ski).

% @attr price_usd_sun_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name USD sale price at Sun & Ski Sports
% @values v299_84=299.84 unk_price_usd_sun_ski=Unknown
% @importance 0.85

0.49::true_val(price_usd_sun_ski, v299_84); 0.51::true_val(price_usd_sun_ski, unk_price_usd_sun_ski).

measured(s39, price_usd_sun_ski, v299_84).

all_consistent(price_usd_sun_ski) :- consistent(s39, price_usd_sun_ski).

evidence(all_consistent(price_usd_sun_ski)).
query(true_val(price_usd_sun_ski, v299_84)).
query(true_val(price_usd_sun_ski, unk_price_usd_sun_ski)).

0.78::acc(s40, price_gbp_glisshop).

% @attr price_gbp_glisshop
% @type numeric
% @unit GBP
% @canonical false
% @original_name GBP price at Glisshop
% @values v329_91=329.91 unk_price_gbp_glisshop=Unknown
% @importance 0.8

0.59::true_val(price_gbp_glisshop, v329_91); 0.41::true_val(price_gbp_glisshop, unk_price_gbp_glisshop).

measured(s40, price_gbp_glisshop, v329_91).

all_consistent(price_gbp_glisshop) :- consistent(s40, price_gbp_glisshop).

evidence(all_consistent(price_gbp_glisshop)).
query(true_val(price_gbp_glisshop, v329_91)).
query(true_val(price_gbp_glisshop, unk_price_gbp_glisshop)).

0.75::acc(s41, price_eur_blue_tomato).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v500=500.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.7

0.60::true_val(price_eur_blue_tomato, v500); 0.40::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s41, price_eur_blue_tomato, v500).

all_consistent(price_eur_blue_tomato) :- consistent(s41, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v500)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

0.88::acc(s36, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (evo)
% @values in_stock=In_stock_2026 unk_availability_status=Unknown
% @importance 0.95

0.81::true_val(availability_status, in_stock); 0.19::true_val(availability_status, unk_availability_status).

measured(s36, availability_status, in_stock).

all_consistent(availability_status) :- consistent(s36, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock)).
query(true_val(availability_status, unk_availability_status)).

0.85::acc(s37, availability_status_tactics).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (Tactics)
% @values in_stock_154=In_stock_154cm unk_availability_status_tactics=Unknown
% @importance 0.95

0.81::true_val(availability_status_tactics, in_stock_154); 0.19::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s37, availability_status_tactics, in_stock_154).

all_consistent(availability_status_tactics) :- consistent(s37, availability_status_tactics).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, in_stock_154)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

0.80::acc(s38, availability_status_powder7).

% @attr availability_status_powder7
% @type categorical
% @canonical false
% @original_name availability_status (Powder7)
% @values in_stock_143_147_154=In_stock_143_147_154cm unk_availability_status_powder7=Unknown
% @importance 0.9

0.71::true_val(availability_status_powder7, in_stock_143_147_154); 0.29::true_val(availability_status_powder7, unk_availability_status_powder7).

measured(s38, availability_status_powder7, in_stock_143_147_154).

all_consistent(availability_status_powder7) :- consistent(s38, availability_status_powder7).

evidence(all_consistent(availability_status_powder7)).
query(true_val(availability_status_powder7, in_stock_143_147_154)).
query(true_val(availability_status_powder7, unk_availability_status_powder7)).

0.78::acc(s40, availability_status_glisshop).

% @attr availability_status_glisshop
% @type categorical
% @canonical false
% @original_name availability_status (Glisshop)
% @values out_of_stock=Out_of_Stock unk_availability_status_glisshop=Unknown
% @importance 0.8

0.59::true_val(availability_status_glisshop, out_of_stock); 0.41::true_val(availability_status_glisshop, unk_availability_status_glisshop).

measured(s40, availability_status_glisshop, out_of_stock).

all_consistent(availability_status_glisshop) :- consistent(s40, availability_status_glisshop).

evidence(all_consistent(availability_status_glisshop)).
query(true_val(availability_status_glisshop, out_of_stock)).
query(true_val(availability_status_glisshop, unk_availability_status_glisshop)).

0.90::acc(s42, availability_status_salomon).

% @attr availability_status_salomon
% @type categorical
% @canonical false
% @original_name availability_status (salomon.com)
% @values listed=Listed unk_availability_status_salomon=Unknown
% @importance 0.9

0.87::true_val(availability_status_salomon, listed); 0.13::true_val(availability_status_salomon, unk_availability_status_salomon).

measured(s42, availability_status_salomon, listed).

all_consistent(availability_status_salomon) :- consistent(s42, availability_status_salomon).

evidence(all_consistent(availability_status_salomon)).
query(true_val(availability_status_salomon, listed)).
query(true_val(availability_status_salomon, unk_availability_status_salomon)).

0.72::acc(s43, availability_status_skiessentials).

% @attr availability_status_skiessentials
% @type categorical
% @canonical false
% @original_name availability_status (Ski Essentials)
% @values listed=Listed unk_availability_status_skiessentials=Unknown
% @importance 0.6

0.64::true_val(availability_status_skiessentials, listed); 0.36::true_val(availability_status_skiessentials, unk_availability_status_skiessentials).

measured(s43, availability_status_skiessentials, listed).

all_consistent(availability_status_skiessentials) :- consistent(s43, availability_status_skiessentials).

evidence(all_consistent(availability_status_skiessentials)).
query(true_val(availability_status_skiessentials, listed)).
query(true_val(availability_status_skiessentials, unk_availability_status_skiessentials)).

0.72::acc(s13, availability_status_blauer).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values listed=Listed unk_availability_status_blauer=Unknown
% @importance 0.85

0.63::true_val(availability_status_blauer, listed); 0.37::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s13, availability_status_blauer, listed).

all_consistent(availability_status_blauer) :- consistent(s13, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, listed)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

0.72::acc(s16, availability_status_absolutesnow).

% @attr availability_status_absolutesnow
% @type categorical
% @canonical false
% @original_name availability_status (Absolute-Snow)
% @values listed=Listed unk_availability_status_absolutesnow=Unknown
% @importance 0.75

0.60::true_val(availability_status_absolutesnow, listed); 0.40::true_val(availability_status_absolutesnow, unk_availability_status_absolutesnow).

measured(s16, availability_status_absolutesnow, listed).

all_consistent(availability_status_absolutesnow) :- consistent(s16, availability_status_absolutesnow).

evidence(all_consistent(availability_status_absolutesnow)).
query(true_val(availability_status_absolutesnow, listed)).
query(true_val(availability_status_absolutesnow, unk_availability_status_absolutesnow)).

0.60::acc(s44, availability_status_alpinesports).

% @attr availability_status_alpinesports
% @type categorical
% @canonical false
% @original_name availability_status (Alpine Sports Online)
% @values listed=Listed unk_availability_status_alpinesports=Unknown
% @importance 0.6

0.32::true_val(availability_status_alpinesports, listed); 0.68::true_val(availability_status_alpinesports, unk_availability_status_alpinesports).

measured(s44, availability_status_alpinesports, listed).

all_consistent(availability_status_alpinesports) :- consistent(s44, availability_status_alpinesports).

evidence(all_consistent(availability_status_alpinesports)).
query(true_val(availability_status_alpinesports, listed)).
query(true_val(availability_status_alpinesports, unk_availability_status_alpinesports)).

0.62::acc(s45, availability_status_mcu).

% @attr availability_status_mcu
% @type categorical
% @canonical false
% @original_name availability_status (McU Sports)
% @values listed=Listed unk_availability_status_mcu=Unknown
% @importance 0.5

0.47::true_val(availability_status_mcu, listed); 0.53::true_val(availability_status_mcu, unk_availability_status_mcu).

measured(s45, availability_status_mcu, listed).

all_consistent(availability_status_mcu) :- consistent(s45, availability_status_mcu).

evidence(all_consistent(availability_status_mcu)).
query(true_val(availability_status_mcu, listed)).
query(true_val(availability_status_mcu, unk_availability_status_mcu)).

0.58::acc(s46, availability_status_gorge).

% @attr availability_status_gorge
% @type categorical
% @canonical false
% @original_name availability_status (Gorge Performance)
% @values listed=Listed unk_availability_status_gorge=Unknown
% @importance 0.4

0.35::true_val(availability_status_gorge, listed); 0.65::true_val(availability_status_gorge, unk_availability_status_gorge).

measured(s46, availability_status_gorge, listed).

all_consistent(availability_status_gorge) :- consistent(s46, availability_status_gorge).

evidence(all_consistent(availability_status_gorge)).
query(true_val(availability_status_gorge, listed)).
query(true_val(availability_status_gorge, unk_availability_status_gorge)).

0.75::acc(s47, availability_status_snowrock).

% @attr availability_status_snowrock
% @type categorical
% @canonical false
% @original_name availability_status (Snow+Rock)
% @values listed=Listed unk_availability_status_snowrock=Unknown
% @importance 0.5

0.60::true_val(availability_status_snowrock, listed); 0.40::true_val(availability_status_snowrock, unk_availability_status_snowrock).

measured(s47, availability_status_snowrock, listed).

all_consistent(availability_status_snowrock) :- consistent(s47, availability_status_snowrock).

evidence(all_consistent(availability_status_snowrock)).
query(true_val(availability_status_snowrock, listed)).
query(true_val(availability_status_snowrock, unk_availability_status_snowrock)).

0.65::acc(s48, availability_status_snowtrax).

% @attr availability_status_snowtrax
% @type categorical
% @canonical false
% @original_name availability_status (Snowtrax)
% @values listed=Listed unk_availability_status_snowtrax=Unknown
% @importance 0.5

0.48::true_val(availability_status_snowtrax, listed); 0.52::true_val(availability_status_snowtrax, unk_availability_status_snowtrax).

measured(s48, availability_status_snowtrax, listed).

all_consistent(availability_status_snowtrax) :- consistent(s48, availability_status_snowtrax).

evidence(all_consistent(availability_status_snowtrax)).
query(true_val(availability_status_snowtrax, listed)).
query(true_val(availability_status_snowtrax, unk_availability_status_snowtrax)).

0.62::acc(s49, availability_status_shredshop).

% @attr availability_status_shredshop
% @type categorical
% @canonical false
% @original_name availability_status (Shred Shop)
% @values listed=Listed unk_availability_status_shredshop=Unknown
% @importance 0.4

0.44::true_val(availability_status_shredshop, listed); 0.56::true_val(availability_status_shredshop, unk_availability_status_shredshop).

measured(s49, availability_status_shredshop, listed).

all_consistent(availability_status_shredshop) :- consistent(s49, availability_status_shredshop).

evidence(all_consistent(availability_status_shredshop)).
query(true_val(availability_status_shredshop, listed)).
query(true_val(availability_status_shredshop, unk_availability_status_shredshop)).

0.82::acc(s12, overall_rating_snowboardingprofiles).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v86_1=86.1 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.85

0.64::true_val(overall_rating_snowboardingprofiles, v86_1); 0.36::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s12, overall_rating_snowboardingprofiles, v86_1).

all_consistent(overall_rating_snowboardingprofiles) :- consistent(s12, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v86_1)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

0.80::acc(s12, overall_rating_snowboardingprofiles_rank).

% @attr overall_rating_snowboardingprofiles_rank
% @type categorical
% @canonical false
% @original_name overall_rating_snowboardingprofiles (rank)
% @values rank_10th_of_28=10th_of_28_mellow_freeride unk_overall_rating_snowboardingprofiles_rank=Unknown
% @importance 0.85

0.64::true_val(overall_rating_snowboardingprofiles_rank, rank_10th_of_28); 0.36::true_val(overall_rating_snowboardingprofiles_rank, unk_overall_rating_snowboardingprofiles_rank).

measured(s12, overall_rating_snowboardingprofiles_rank, rank_10th_of_28).

all_consistent(overall_rating_snowboardingprofiles_rank) :- consistent(s12, overall_rating_snowboardingprofiles_rank).

evidence(all_consistent(overall_rating_snowboardingprofiles_rank)).
query(true_val(overall_rating_snowboardingprofiles_rank, rank_10th_of_28)).
query(true_val(overall_rating_snowboardingprofiles_rank, unk_overall_rating_snowboardingprofiles_rank)).

0.82::acc(s50, reviewer_opinion_whitelines).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values choice_award_best_am=Whitelines_Choice_Award_best_all_mountain unk_reviewer_opinion_whitelines=Unknown
% @importance 0.75

0.74::true_val(reviewer_opinion_whitelines, choice_award_best_am); 0.26::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s50, reviewer_opinion_whitelines, choice_award_best_am).

all_consistent(reviewer_opinion_whitelines) :- consistent(s50, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, choice_award_best_am)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

0.80::acc(s51, reviewer_opinion_whitelines_100).

% @attr reviewer_opinion_whitelines_100
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (Whitelines 100)
% @values whitelines_100_selection=Whitelines_100_best_gear_cemented_favourite unk_reviewer_opinion_whitelines_100=Unknown
% @importance 0.7

0.70::true_val(reviewer_opinion_whitelines_100, whitelines_100_selection); 0.30::true_val(reviewer_opinion_whitelines_100, unk_reviewer_opinion_whitelines_100).

measured(s51, reviewer_opinion_whitelines_100, whitelines_100_selection).

all_consistent(reviewer_opinion_whitelines_100) :- consistent(s51, reviewer_opinion_whitelines_100).

evidence(all_consistent(reviewer_opinion_whitelines_100)).
query(true_val(reviewer_opinion_whitelines_100, whitelines_100_selection)).
query(true_val(reviewer_opinion_whitelines_100, unk_reviewer_opinion_whitelines_100)).

0.75::acc(s52, tactics_top_10_feature).

% @attr tactics_top_10_feature
% @type categorical
% @canonical false
% @original_name Tactics Top 10 feature
% @values top_10_best_2026=Top_10_Best_Snowboards_2026 unk_tactics_top_10_feature=Unknown
% @importance 0.65

0.56::true_val(tactics_top_10_feature, top_10_best_2026); 0.44::true_val(tactics_top_10_feature, unk_tactics_top_10_feature).

measured(s52, tactics_top_10_feature, top_10_best_2026).

all_consistent(tactics_top_10_feature) :- consistent(s52, tactics_top_10_feature).

evidence(all_consistent(tactics_top_10_feature)).
query(true_val(tactics_top_10_feature, top_10_best_2026)).
query(true_val(tactics_top_10_feature, unk_tactics_top_10_feature)).

0.68::acc(s53, looria_aggregate_rating).

% @attr looria_aggregate_rating
% @type categorical
% @canonical false
% @original_name Looria aggregate
% @values rated_a_36_reviews=Rated_A_36_reviews unk_looria_aggregate_rating=Unknown
% @importance 0.65

0.47::true_val(looria_aggregate_rating, rated_a_36_reviews); 0.53::true_val(looria_aggregate_rating, unk_looria_aggregate_rating).

measured(s53, looria_aggregate_rating, rated_a_36_reviews).

all_consistent(looria_aggregate_rating) :- consistent(s53, looria_aggregate_rating).

evidence(all_consistent(looria_aggregate_rating)).
query(true_val(looria_aggregate_rating, rated_a_36_reviews)).
query(true_val(looria_aggregate_rating, unk_looria_aggregate_rating)).

0.68::acc(s54, user_review_forum).

% @attr user_review_forum
% @type numeric
% @unit /5
% @canonical true
% @original_name user_review_forum
% @values v5_0=5.0 unk_user_review_forum=Unknown
% @importance 0.6

0.47::true_val(user_review_forum, v5_0); 0.53::true_val(user_review_forum, unk_user_review_forum).

measured(s54, user_review_forum, v5_0).

all_consistent(user_review_forum) :- consistent(s54, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, v5_0)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.72::acc(s55, positive_aspect_accessible_carving).

% @attr positive_aspect_accessible_carving
% @type categorical
% @canonical false
% @original_name positive_aspect (accessible carving)
% @values accessible_carving=Accessible_carving_reach_optimal_capability unk_positive_aspect_accessible_carving=Unknown
% @importance 0.7

0.44::true_val(positive_aspect_accessible_carving, accessible_carving); 0.56::true_val(positive_aspect_accessible_carving, unk_positive_aspect_accessible_carving).

measured(s55, positive_aspect_accessible_carving, accessible_carving).

all_consistent(positive_aspect_accessible_carving) :- consistent(s55, positive_aspect_accessible_carving).

evidence(all_consistent(positive_aspect_accessible_carving)).
query(true_val(positive_aspect_accessible_carving, accessible_carving)).
query(true_val(positive_aspect_accessible_carving, unk_positive_aspect_accessible_carving)).

0.82::acc(s20, turn_initiation_performance).
0.80::acc(s56, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values easy_to_initiate=Easy_turn_initiation_despite_wide_waist unk_turn_initiation_performance=Unknown
% @importance 0.78

0.95::true_val(turn_initiation_performance, easy_to_initiate); 0.05::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s20, turn_initiation_performance, easy_to_initiate).
measured(s56, turn_initiation_performance, easy_to_initiate).

all_consistent(turn_initiation_performance) :-
    consistent(s20, turn_initiation_performance),
    consistent(s56, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, easy_to_initiate)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.78::acc(s57, positive_aspect_nimble_turns).

% @attr positive_aspect_nimble_turns
% @type categorical
% @canonical false
% @original_name positive_aspect (nimble turns)
% @values nimble_tight_turns=Pretty_nimble_tight_turns_slow_speeds unk_positive_aspect_nimble_turns=Unknown
% @importance 0.75

0.64::true_val(positive_aspect_nimble_turns, nimble_tight_turns); 0.36::true_val(positive_aspect_nimble_turns, unk_positive_aspect_nimble_turns).

measured(s57, positive_aspect_nimble_turns, nimble_tight_turns).

all_consistent(positive_aspect_nimble_turns) :- consistent(s57, positive_aspect_nimble_turns).

evidence(all_consistent(positive_aspect_nimble_turns)).
query(true_val(positive_aspect_nimble_turns, nimble_tight_turns)).
query(true_val(positive_aspect_nimble_turns, unk_positive_aspect_nimble_turns)).

0.78::acc(s58, positive_aspect_powder_float).

% @attr positive_aspect_powder_float
% @type categorical
% @canonical false
% @original_name positive_aspect (powder float)
% @values floats_well_powder=Floats_well_12mm_taper_rocker unk_positive_aspect_powder_float=Unknown
% @importance 0.8

0.59::true_val(positive_aspect_powder_float, floats_well_powder); 0.41::true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float).

measured(s58, positive_aspect_powder_float, floats_well_powder).

all_consistent(positive_aspect_powder_float) :- consistent(s58, positive_aspect_powder_float).

evidence(all_consistent(positive_aspect_powder_float)).
query(true_val(positive_aspect_powder_float, floats_well_powder)).
query(true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float)).

0.72::acc(s59, positive_aspect_wide_no_toe_drag).

% @attr positive_aspect_wide_no_toe_drag
% @type categorical
% @canonical false
% @original_name positive_aspect (wide no toe drag)
% @values eliminates_toe_drag=Wide_eliminates_toe_drag_large_feet unk_positive_aspect_wide_no_toe_drag=Unknown
% @importance 0.75

0.53::true_val(positive_aspect_wide_no_toe_drag, eliminates_toe_drag); 0.47::true_val(positive_aspect_wide_no_toe_drag, unk_positive_aspect_wide_no_toe_drag).

measured(s59, positive_aspect_wide_no_toe_drag, eliminates_toe_drag).

all_consistent(positive_aspect_wide_no_toe_drag) :- consistent(s59, positive_aspect_wide_no_toe_drag).

evidence(all_consistent(positive_aspect_wide_no_toe_drag)).
query(true_val(positive_aspect_wide_no_toe_drag, eliminates_toe_drag)).
query(true_val(positive_aspect_wide_no_toe_drag, unk_positive_aspect_wide_no_toe_drag)).

0.70::acc(s60, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect (fun and playful)
% @values extremely_fun_playful=Extremely_fun_and_playful_across_reviews unk_positive_aspect=Unknown
% @importance 0.7

0.38::true_val(positive_aspect, extremely_fun_playful); 0.62::true_val(positive_aspect, unk_positive_aspect).

measured(s60, positive_aspect, extremely_fun_playful).

all_consistent(positive_aspect) :- consistent(s60, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, extremely_fun_playful)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.85::acc(s61, positive_aspect_all_day_riding).

% @attr positive_aspect_all_day_riding
% @type categorical
% @canonical false
% @original_name positive_aspect (all-day riding)
% @values better_all_day_than_pro=Less_fatiguing_all_day_ride_than_Pro unk_positive_aspect_all_day_riding=Unknown
% @importance 0.8

0.75::true_val(positive_aspect_all_day_riding, better_all_day_than_pro); 0.25::true_val(positive_aspect_all_day_riding, unk_positive_aspect_all_day_riding).

measured(s61, positive_aspect_all_day_riding, better_all_day_than_pro).

all_consistent(positive_aspect_all_day_riding) :- consistent(s61, positive_aspect_all_day_riding).

evidence(all_consistent(positive_aspect_all_day_riding)).
query(true_val(positive_aspect_all_day_riding, better_all_day_than_pro)).
query(true_val(positive_aspect_all_day_riding, unk_positive_aspect_all_day_riding)).

0.80::acc(s62, positive_aspect_trees_powder).

% @attr positive_aspect_trees_powder
% @type categorical
% @canonical false
% @original_name positive_aspect (trees and powder)
% @values well_suited_trees_powder=Particularly_well_suited_trees_powder unk_positive_aspect_trees_powder=Unknown
% @importance 0.85

0.64::true_val(positive_aspect_trees_powder, well_suited_trees_powder); 0.36::true_val(positive_aspect_trees_powder, unk_positive_aspect_trees_powder).

measured(s62, positive_aspect_trees_powder, well_suited_trees_powder).

all_consistent(positive_aspect_trees_powder) :- consistent(s62, positive_aspect_trees_powder).

evidence(all_consistent(positive_aspect_trees_powder)).
query(true_val(positive_aspect_trees_powder, well_suited_trees_powder)).
query(true_val(positive_aspect_trees_powder, unk_positive_aspect_trees_powder)).

0.78::acc(s15, pop).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values snappy_ollies=Snappy_ollies_Popster_basalt unk_pop=Unknown
% @importance 0.7

0.70::true_val(pop, snappy_ollies); 0.30::true_val(pop, unk_pop).

measured(s15, pop, snappy_ollies).

all_consistent(pop) :- consistent(s15, pop).

evidence(all_consistent(pop)).
query(true_val(pop, snappy_ollies)).
query(true_val(pop, unk_pop)).

0.75::acc(s63, positive_aspect_easy_butter).

% @attr positive_aspect_easy_butter
% @type categorical
% @canonical false
% @original_name positive_aspect (easy butter)
% @values easy_butter_nose=Easy_to_butter_especially_nose unk_positive_aspect_easy_butter=Unknown
% @importance 0.6

0.48::true_val(positive_aspect_easy_butter, easy_butter_nose); 0.52::true_val(positive_aspect_easy_butter, unk_positive_aspect_easy_butter).

measured(s63, positive_aspect_easy_butter, easy_butter_nose).

all_consistent(positive_aspect_easy_butter) :- consistent(s63, positive_aspect_easy_butter).

evidence(all_consistent(positive_aspect_easy_butter)).
query(true_val(positive_aspect_easy_butter, easy_butter_nose)).
query(true_val(positive_aspect_easy_butter, unk_positive_aspect_easy_butter)).

0.65::acc(s64, positive_aspect_quiver_of_one).

% @attr positive_aspect_quiver_of_one
% @type categorical
% @canonical false
% @original_name positive_aspect (quiver of one)
% @values viable_quiver_of_one=Viable_quiver_of_one_for_intermediates unk_positive_aspect_quiver_of_one=Unknown
% @importance 0.7

0.34::true_val(positive_aspect_quiver_of_one, viable_quiver_of_one); 0.66::true_val(positive_aspect_quiver_of_one, unk_positive_aspect_quiver_of_one).

measured(s64, positive_aspect_quiver_of_one, viable_quiver_of_one).

all_consistent(positive_aspect_quiver_of_one) :- consistent(s64, positive_aspect_quiver_of_one).

evidence(all_consistent(positive_aspect_quiver_of_one)).
query(true_val(positive_aspect_quiver_of_one, viable_quiver_of_one)).
query(true_val(positive_aspect_quiver_of_one, unk_positive_aspect_quiver_of_one)).

0.82::acc(s65, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect (high speed instability)
% @values squirrelly_chattery_speed=Squirrelly_and_chattery_at_higher_speeds unk_negative_aspect=Unknown
% @importance 0.85

0.67::true_val(negative_aspect, squirrelly_chattery_speed); 0.33::true_val(negative_aspect, unk_negative_aspect).

measured(s65, negative_aspect, squirrelly_chattery_speed).

all_consistent(negative_aspect) :- consistent(s65, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, squirrelly_chattery_speed)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.80::acc(s56, negative_aspect_washy_carves).

% @attr negative_aspect_washy_carves
% @type categorical
% @canonical false
% @original_name negative_aspect (washy carves)
% @values washy_aggressive_carves=Feels_washy_aggressive_higher_speed_carves unk_negative_aspect_washy_carves=Unknown
% @importance 0.85

0.64::true_val(negative_aspect_washy_carves, washy_aggressive_carves); 0.36::true_val(negative_aspect_washy_carves, unk_negative_aspect_washy_carves).

measured(s56, negative_aspect_washy_carves, washy_aggressive_carves).

all_consistent(negative_aspect_washy_carves) :- consistent(s56, negative_aspect_washy_carves).

evidence(all_consistent(negative_aspect_washy_carves)).
query(true_val(negative_aspect_washy_carves, washy_aggressive_carves)).
query(true_val(negative_aspect_washy_carves, unk_negative_aspect_washy_carves)).

0.78::acc(s66, negative_aspect_catch_prone).

% @attr negative_aspect_catch_prone
% @type categorical
% @canonical false
% @original_name negative_aspect (catch prone)
% @values catch_prone_speed=More_catch_prone_at_faster_speeds unk_negative_aspect_catch_prone=Unknown
% @importance 0.7

0.63::true_val(negative_aspect_catch_prone, catch_prone_speed); 0.37::true_val(negative_aspect_catch_prone, unk_negative_aspect_catch_prone).

measured(s66, negative_aspect_catch_prone, catch_prone_speed).

all_consistent(negative_aspect_catch_prone) :- consistent(s66, negative_aspect_catch_prone).

evidence(all_consistent(negative_aspect_catch_prone)).
query(true_val(negative_aspect_catch_prone, catch_prone_speed)).
query(true_val(negative_aspect_catch_prone, unk_negative_aspect_catch_prone)).

0.78::acc(s67, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values relatively_fast_not_lightning=Relatively_fast_not_lightning_Pro_better unk_base_glide_performance=Unknown
% @importance 0.65

0.63::true_val(base_glide_performance, relatively_fast_not_lightning); 0.37::true_val(base_glide_performance, unk_base_glide_performance).

measured(s67, base_glide_performance, relatively_fast_not_lightning).

all_consistent(base_glide_performance) :- consistent(s67, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, relatively_fast_not_lightning)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.75::acc(s68, negative_aspect_crud_chop).

% @attr negative_aspect_crud_chop
% @type categorical
% @canonical false
% @original_name negative_aspect (crud/chop)
% @values not_chop_specialist=OK_in_crud_not_specialist_soft_flex unk_negative_aspect_crud_chop=Unknown
% @importance 0.8

0.50::true_val(negative_aspect_crud_chop, not_chop_specialist); 0.50::true_val(negative_aspect_crud_chop, unk_negative_aspect_crud_chop).

measured(s68, negative_aspect_crud_chop, not_chop_specialist).

all_consistent(negative_aspect_crud_chop) :- consistent(s68, negative_aspect_crud_chop).

evidence(all_consistent(negative_aspect_crud_chop)).
query(true_val(negative_aspect_crud_chop, not_chop_specialist)).
query(true_val(negative_aspect_crud_chop, unk_negative_aspect_crud_chop)).

0.80::acc(s69, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values not_ideal_but_doable=Not_ideal_directional_shape_but_doable unk_switch_riding=Unknown
% @importance 0.7

0.63::true_val(switch_riding, not_ideal_but_doable); 0.37::true_val(switch_riding, unk_switch_riding).

measured(s69, switch_riding, not_ideal_but_doable).

all_consistent(switch_riding) :- consistent(s69, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, not_ideal_but_doable)).
query(true_val(switch_riding, unk_switch_riding)).

0.78::acc(s70, board_weight_grams).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values heavier_than_avg_scales=Little_heavier_on_scales_lighter_per_area unk_board_weight_grams=Unknown
% @importance 0.6

0.62::true_val(board_weight_grams, heavier_than_avg_scales); 0.38::true_val(board_weight_grams, unk_board_weight_grams).

measured(s70, board_weight_grams, heavier_than_avg_scales).

all_consistent(board_weight_grams) :- consistent(s70, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, heavier_than_avg_scales)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.82::acc(s71, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand (TheGoodRide list)
% @values orca_hybrid_gremlin_psychocandy=Lib_Tech_Orca_YES_Hybrid_Gnu_Gremlin_Ride_Psychocandy_Korua_K2 unk_comparable_board_cross_brand=Unknown
% @importance 0.8

0.70::true_val(comparable_board_cross_brand, orca_hybrid_gremlin_psychocandy); 0.30::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s71, comparable_board_cross_brand, orca_hybrid_gremlin_psychocandy).

all_consistent(comparable_board_cross_brand) :- consistent(s71, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, orca_hybrid_gremlin_psychocandy)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.65::acc(s72, comparable_board_cross_brand_forum).

% @attr comparable_board_cross_brand_forum
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (forum alternatives)
% @values warpig_stalefish_etc=WarPig_Stalefish_ServiceDog_Backslash_CamelTwo unk_comparable_board_cross_brand_forum=Unknown
% @importance 0.75

0.34::true_val(comparable_board_cross_brand_forum, warpig_stalefish_etc); 0.66::true_val(comparable_board_cross_brand_forum, unk_comparable_board_cross_brand_forum).

measured(s72, comparable_board_cross_brand_forum, warpig_stalefish_etc).

all_consistent(comparable_board_cross_brand_forum) :- consistent(s72, comparable_board_cross_brand_forum).

evidence(all_consistent(comparable_board_cross_brand_forum)).
query(true_val(comparable_board_cross_brand_forum, warpig_stalefish_etc)).
query(true_val(comparable_board_cross_brand_forum, unk_comparable_board_cross_brand_forum)).

0.62::acc(s73, comparable_board_cross_brand_vs_orca).

% @attr comparable_board_cross_brand_vs_orca
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (vs Orca)
% @values more_fun_than_orca=Dancehaul_more_fun_than_Orca_in_147 unk_comparable_board_cross_brand_vs_orca=Unknown
% @importance 0.7

0.31::true_val(comparable_board_cross_brand_vs_orca, more_fun_than_orca); 0.69::true_val(comparable_board_cross_brand_vs_orca, unk_comparable_board_cross_brand_vs_orca).

measured(s73, comparable_board_cross_brand_vs_orca, more_fun_than_orca).

all_consistent(comparable_board_cross_brand_vs_orca) :- consistent(s73, comparable_board_cross_brand_vs_orca).

evidence(all_consistent(comparable_board_cross_brand_vs_orca)).
query(true_val(comparable_board_cross_brand_vs_orca, more_fun_than_orca)).
query(true_val(comparable_board_cross_brand_vs_orca, unk_comparable_board_cross_brand_vs_orca)).

0.85::acc(s74, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (Dancehaul Pro)
% @values dancehaul_pro=Dancehaul_Pro_stiffer_faster_more_pop unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.75::true_val(comparable_board_same_brand, dancehaul_pro); 0.25::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s74, comparable_board_same_brand, dancehaul_pro).

all_consistent(comparable_board_same_brand) :- consistent(s74, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, dancehaul_pro)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.68::acc(s75, comparable_board_cross_brand_vs_warpig).

% @attr comparable_board_cross_brand_vs_warpig
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (vs Warpig)
% @values better_for_intermediate=Dancehaul_better_for_intermediate unk_comparable_board_cross_brand_vs_warpig=Unknown
% @importance 0.65

0.39::true_val(comparable_board_cross_brand_vs_warpig, better_for_intermediate); 0.61::true_val(comparable_board_cross_brand_vs_warpig, unk_comparable_board_cross_brand_vs_warpig).

measured(s75, comparable_board_cross_brand_vs_warpig, better_for_intermediate).

all_consistent(comparable_board_cross_brand_vs_warpig) :- consistent(s75, comparable_board_cross_brand_vs_warpig).

evidence(all_consistent(comparable_board_cross_brand_vs_warpig)).
query(true_val(comparable_board_cross_brand_vs_warpig, better_for_intermediate)).
query(true_val(comparable_board_cross_brand_vs_warpig, unk_comparable_board_cross_brand_vs_warpig)).

0.60::acc(s76, comparable_board_same_brand_jetstream).

% @attr comparable_board_same_brand_jetstream
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Jetstream)
% @values jetstream_freeride_flavour=Salomon_Jetstream_Dancehaul_vibe_more_freeride unk_comparable_board_same_brand_jetstream=Unknown
% @importance 0.5

0.27::true_val(comparable_board_same_brand_jetstream, jetstream_freeride_flavour); 0.73::true_val(comparable_board_same_brand_jetstream, unk_comparable_board_same_brand_jetstream).

measured(s76, comparable_board_same_brand_jetstream, jetstream_freeride_flavour).

all_consistent(comparable_board_same_brand_jetstream) :- consistent(s76, comparable_board_same_brand_jetstream).

evidence(all_consistent(comparable_board_same_brand_jetstream)).
query(true_val(comparable_board_same_brand_jetstream, jetstream_freeride_flavour)).
query(true_val(comparable_board_same_brand_jetstream, unk_comparable_board_same_brand_jetstream)).

0.85::acc(s36, evo_retailer_info).

% @attr evo_retailer_info
% @type categorical
% @canonical false
% @original_name evo retailer info
% @values major_us_specialist=Major_US_online_retail_specialist_price_match unk_evo_retailer_info=Unknown
% @importance 0.95

0.81::true_val(evo_retailer_info, major_us_specialist); 0.19::true_val(evo_retailer_info, unk_evo_retailer_info).

measured(s36, evo_retailer_info, major_us_specialist).

all_consistent(evo_retailer_info) :- consistent(s36, evo_retailer_info).

evidence(all_consistent(evo_retailer_info)).
query(true_val(evo_retailer_info, major_us_specialist)).
query(true_val(evo_retailer_info, unk_evo_retailer_info)).

0.85::acc(s37, tactics_retailer_info).

% @attr tactics_retailer_info
% @type categorical
% @canonical false
% @original_name Tactics retailer info
% @values established_us_since_1999=Established_US_since_1999_low_price_guarantee unk_tactics_retailer_info=Unknown
% @importance 0.95

0.81::true_val(tactics_retailer_info, established_us_since_1999); 0.19::true_val(tactics_retailer_info, unk_tactics_retailer_info).

measured(s37, tactics_retailer_info, established_us_since_1999).

all_consistent(tactics_retailer_info) :- consistent(s37, tactics_retailer_info).

evidence(all_consistent(tactics_retailer_info)).
query(true_val(tactics_retailer_info, established_us_since_1999)).
query(true_val(tactics_retailer_info, unk_tactics_retailer_info)).

0.75::acc(s77, powder7_retailer_info).

% @attr powder7_retailer_info
% @type categorical
% @canonical false
% @original_name Powder7 retailer info
% @values colorado_shop_same_day=Colorado_shop_same_day_shipping_30day_returns unk_powder7_retailer_info=Unknown
% @importance 0.35

0.52::true_val(powder7_retailer_info, colorado_shop_same_day); 0.48::true_val(powder7_retailer_info, unk_powder7_retailer_info).

measured(s77, powder7_retailer_info, colorado_shop_same_day).

all_consistent(powder7_retailer_info) :- consistent(s77, powder7_retailer_info).

evidence(all_consistent(powder7_retailer_info)).
query(true_val(powder7_retailer_info, colorado_shop_same_day)).
query(true_val(powder7_retailer_info, unk_powder7_retailer_info)).

0.72::acc(s16, absolutesnow_retailer_info).

% @attr absolutesnow_retailer_info
% @type categorical
% @canonical false
% @original_name Absolute-Snow retailer info
% @values uk_based_established=UK_based_well_established unk_absolutesnow_retailer_info=Unknown
% @importance 0.75

0.60::true_val(absolutesnow_retailer_info, uk_based_established); 0.40::true_val(absolutesnow_retailer_info, unk_absolutesnow_retailer_info).

measured(s16, absolutesnow_retailer_info, uk_based_established).

all_consistent(absolutesnow_retailer_info) :- consistent(s16, absolutesnow_retailer_info).

evidence(all_consistent(absolutesnow_retailer_info)).
query(true_val(absolutesnow_retailer_info, uk_based_established)).
query(true_val(absolutesnow_retailer_info, unk_absolutesnow_retailer_info)).

0.75::acc(s47, snowrock_retailer_info).

% @attr snowrock_retailer_info
% @type categorical
% @canonical false
% @original_name Snow+Rock retailer info
% @values uk_3yr_warranty_pricematch=UK_retailer_3yr_warranty_price_match unk_snowrock_retailer_info=Unknown
% @importance 0.5

0.60::true_val(snowrock_retailer_info, uk_3yr_warranty_pricematch); 0.40::true_val(snowrock_retailer_info, unk_snowrock_retailer_info).

measured(s47, snowrock_retailer_info, uk_3yr_warranty_pricematch).

all_consistent(snowrock_retailer_info) :- consistent(s47, snowrock_retailer_info).

evidence(all_consistent(snowrock_retailer_info)).
query(true_val(snowrock_retailer_info, uk_3yr_warranty_pricematch)).
query(true_val(snowrock_retailer_info, unk_snowrock_retailer_info)).

0.72::acc(s13, blauer_retailer_info).

% @attr blauer_retailer_info
% @type categorical
% @canonical false
% @original_name Blauer Board Shop retailer info
% @values us_specialty_expert=US_specialty_snowboard_shop_expert_staff unk_blauer_retailer_info=Unknown
% @importance 0.85

0.63::true_val(blauer_retailer_info, us_specialty_expert); 0.37::true_val(blauer_retailer_info, unk_blauer_retailer_info).

measured(s13, blauer_retailer_info, us_specialty_expert).

all_consistent(blauer_retailer_info) :- consistent(s13, blauer_retailer_info).

evidence(all_consistent(blauer_retailer_info)).
query(true_val(blauer_retailer_info, us_specialty_expert)).
query(true_val(blauer_retailer_info, unk_blauer_retailer_info)).

0.82::acc(s37, available_colors).
0.72::acc(s78, available_colors).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values red=Red_bright_red unk_available_colors=Unknown
% @importance 0.6

0.95::true_val(available_colors, red); 0.05::true_val(available_colors, unk_available_colors).

measured(s37, available_colors, red).
measured(s78, available_colors, red).

all_consistent(available_colors) :-
    consistent(s78, available_colors),
    (indep(s37), consistent(s37, available_colors) ; \+indep(s37)).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, red)).
query(true_val(available_colors, unk_available_colors)).

0.72::acc(s79, graphics_change_annually).

% @attr graphics_change_annually
% @type categorical
% @canonical false
% @original_name Graphics change annually
% @values annual_change_2024_25_26=Graphics_change_annually_2024_2025_2026 unk_graphics_change_annually=Unknown
% @importance 0.2

0.55::true_val(graphics_change_annually, annual_change_2024_25_26); 0.45::true_val(graphics_change_annually, unk_graphics_change_annually).

measured(s79, graphics_change_annually, annual_change_2024_25_26).

all_consistent(graphics_change_annually) :- consistent(s79, graphics_change_annually).

evidence(all_consistent(graphics_change_annually)).
query(true_val(graphics_change_annually, annual_change_2024_25_26)).
query(true_val(graphics_change_annually, unk_graphics_change_annually)).

0.88::acc(s80, salomon_brand_heritage).

% @attr salomon_brand_heritage
% @type categorical
% @canonical false
% @original_name Salomon brand heritage
% @values heritage_75_plus_years=75_plus_years_outdoor_sports_manufacturing unk_salomon_brand_heritage=Unknown
% @importance 0.3

0.75::true_val(salomon_brand_heritage, heritage_75_plus_years); 0.25::true_val(salomon_brand_heritage, unk_salomon_brand_heritage).

measured(s80, salomon_brand_heritage, heritage_75_plus_years).

all_consistent(salomon_brand_heritage) :- consistent(s80, salomon_brand_heritage).

evidence(all_consistent(salomon_brand_heritage)).
query(true_val(salomon_brand_heritage, heritage_75_plus_years)).
query(true_val(salomon_brand_heritage, unk_salomon_brand_heritage)).

0.92::acc(s81, salomon_hq_location).

% @attr salomon_hq_location
% @type categorical
% @canonical false
% @original_name Salomon HQ location
% @values annecy_france=Annecy_France unk_salomon_hq_location=Unknown
% @importance 0.3

0.86::true_val(salomon_hq_location, annecy_france); 0.14::true_val(salomon_hq_location, unk_salomon_hq_location).

measured(s81, salomon_hq_location, annecy_france).

all_consistent(salomon_hq_location) :- consistent(s81, salomon_hq_location).

evidence(all_consistent(salomon_hq_location)).
query(true_val(salomon_hq_location, annecy_france)).
query(true_val(salomon_hq_location, unk_salomon_hq_location)).

0.85::acc(s82, salomon_us_operations).

% @attr salomon_us_operations
% @type categorical
% @canonical false
% @original_name Salomon US operations
% @values ogden_utah=Ogden_Utah unk_salomon_us_operations=Unknown
% @importance 0.25

0.72::true_val(salomon_us_operations, ogden_utah); 0.28::true_val(salomon_us_operations, unk_salomon_us_operations).

measured(s82, salomon_us_operations, ogden_utah).

all_consistent(salomon_us_operations) :- consistent(s82, salomon_us_operations).

evidence(all_consistent(salomon_us_operations)).
query(true_val(salomon_us_operations, ogden_utah)).
query(true_val(salomon_us_operations, unk_salomon_us_operations)).

0.78::acc(s83, manufacturing_location_current).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_bulgaria_france_etc=Austria_Bulgaria_France_Finland_Canada_US unk_manufacturing_location_current=Unknown
% @importance 0.35

0.64::true_val(manufacturing_location_current, austria_bulgaria_france_etc); 0.36::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s83, manufacturing_location_current, austria_bulgaria_france_etc).

all_consistent(manufacturing_location_current) :- consistent(s83, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_bulgaria_france_etc)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

0.72::acc(s84, sustainability_certification_2030_pledge).

% @attr sustainability_certification_2030_pledge
% @type categorical
% @canonical false
% @original_name sustainability_certification (2030 pledge)
% @values reduce_30pct_circular_100pct=By_2030_reduce_emissions_30pct_circular_economy_100pct unk_sustainability_certification_2030_pledge=Unknown
% @importance 0.4

0.57::true_val(sustainability_certification_2030_pledge, reduce_30pct_circular_100pct); 0.43::true_val(sustainability_certification_2030_pledge, unk_sustainability_certification_2030_pledge).

measured(s84, sustainability_certification_2030_pledge, reduce_30pct_circular_100pct).

all_consistent(sustainability_certification_2030_pledge) :- consistent(s84, sustainability_certification_2030_pledge).

evidence(all_consistent(sustainability_certification_2030_pledge)).
query(true_val(sustainability_certification_2030_pledge, reduce_30pct_circular_100pct)).
query(true_val(sustainability_certification_2030_pledge, unk_sustainability_certification_2030_pledge)).

0.88::acc(s1, topsheet_appearance_description).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values bright_red=Bright_red_top_sheet unk_topsheet_appearance_description=Unknown
% @importance 0.25

0.51::true_val(topsheet_appearance_description, bright_red); 0.49::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s78, topsheet_appearance_description, bright_red).

all_consistent(topsheet_appearance_description) :- consistent(s78, topsheet_appearance_description).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, bright_red)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).