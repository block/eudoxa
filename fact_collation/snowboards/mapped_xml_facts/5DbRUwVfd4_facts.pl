0.15::indep(s1).
0.20::indep(s3).
0.25::indep(s4).
0.25::indep(s5).
0.15::indep(s8).
0.15::indep(s13).
0.12::indep(s16).
0.15::indep(s17).
0.15::indep(s18).
0.25::indep(s19).
0.15::indep(s20).
0.20::indep(s21).
0.20::indep(s22).
0.15::indep(s23).
0.20::indep(s24).
0.25::indep(s25).
0.12::indep(s26).
0.25::indep(s27).
0.15::indep(s28).
0.15::indep(s29).
0.15::indep(s31).
0.15::indep(s32).
0.15::indep(s33).
0.25::indep(s34).
0.20::indep(s35).
0.15::indep(s36).
0.15::indep(s37).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.95

0.93::acc(s1, brand).
0.97::acc(s2, brand).

0.97::true_val(brand, salomon); 0.03::true_val(brand, unk_brand).

measured(s1, brand, salomon).
measured(s2, brand, salomon).

all_consistent(brand) :-
    consistent(s2, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values fastlane=Fastlane unk_model_name=Unknown
% @importance 0.95

0.93::acc(s1, model_name).
0.97::acc(s2, model_name).

0.97::true_val(model_name, fastlane); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, fastlane).
measured(s2, model_name, fastlane).

all_consistent(model_name) :-
    consistent(s2, model_name),
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).

evidence(all_consistent(model_name)).
query(true_val(model_name, fastlane)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026_FW_2025_26 unk_model_year=Unknown
% @importance 0.95

0.90::acc(s1, model_year).
0.88::acc(s3, model_year).

0.95::true_val(model_year, y2026); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2026).
measured(s3, model_year, y2026).

all_consistent(model_year) :-
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)),
    (indep(s3), consistent(s3, model_year) ; \+indep(s3)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values new_2026=New_model_first_year_2026 unk_model_first_available_year=Unknown
% @importance 0.75

0.85::acc(s4, model_first_available_year).
0.80::acc(s5, model_first_available_year).

0.90::true_val(model_first_available_year, new_2026); 0.10::true_val(model_first_available_year, unk_model_first_available_year).

measured(s4, model_first_available_year, new_2026).
measured(s5, model_first_available_year, new_2026).

all_consistent(model_first_available_year) :-
    (indep(s4), consistent(s4, model_first_available_year) ; \+indep(s4)),
    (indep(s5), consistent(s5, model_first_available_year) ; \+indep(s5)).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, new_2026)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values super_8=Salomon_Super_8_discontinued_after_10_seasons unk_predecessor_model_name=Unknown
% @importance 0.725

0.80::acc(s6, predecessor_model_name).
0.78::acc(s7, predecessor_model_name).

0.85::true_val(predecessor_model_name, super_8); 0.15::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s6, predecessor_model_name, super_8).
measured(s7, predecessor_model_name, super_8).

all_consistent(predecessor_model_name) :-
    consistent(s6, predecessor_model_name),
    consistent(s7, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, super_8)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values l47947100=L47947100 unk_sku=Unknown
% @importance 0.50

0.85::acc(s8, sku).

0.82::true_val(sku, l47947100); 0.18::true_val(sku, unk_sku).

measured(s8, sku, l47947100).

all_consistent(sku) :-
    (indep(s8), consistent(s8, sku) ; \+indep(s8)).

evidence(all_consistent(sku)).
query(true_val(sku, l47947100)).
query(true_val(sku, unk_sku)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.60

0.95::acc(s9, gender).

0.93::true_val(gender, unisex); 0.07::true_val(gender, unk_gender).

measured(s9, gender, unisex).

all_consistent(gender) :-
    consistent(s9, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.90

0.93::acc(s1, product_type).

0.93::true_val(product_type, snowboard); 0.07::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values annecy_france=Annecy_France unk_manufacturer_headquarters=Unknown
% @importance 0.50

0.90::acc(s10, manufacturer_headquarters).

0.90::true_val(manufacturer_headquarters, annecy_france); 0.10::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s10, manufacturer_headquarters, annecy_france).

all_consistent(manufacturer_headquarters) :-
    consistent(s10, manufacturer_headquarters).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, annecy_france)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports=Amer_Sports_Helsinki_Finland unk_parent_company=Unknown
% @importance 0.40

0.90::acc(s11, parent_company).

0.90::true_val(parent_company, amer_sports); 0.10::true_val(parent_company, unk_parent_company).

measured(s11, parent_company, amer_sports).

all_consistent(parent_company) :-
    consistent(s11, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports)).
query(true_val(parent_company, unk_parent_company)).

% @attr amer_sports_ownership
% @type categorical
% @canonical false
% @original_name Amer Sports ownership
% @values anta_consortium=Anta_Sports_FountainVest_Anamered_Tencent unk_amer_sports_ownership=Unknown
% @importance 0.35

0.88::acc(s12, amer_sports_ownership).

0.87::true_val(amer_sports_ownership, anta_consortium); 0.13::true_val(amer_sports_ownership, unk_amer_sports_ownership).

measured(s12, amer_sports_ownership, anta_consortium).

all_consistent(amer_sports_ownership) :-
    consistent(s12, amer_sports_ownership).

evidence(all_consistent(amer_sports_ownership)).
query(true_val(amer_sports_ownership, anta_consortium)).
query(true_val(amer_sports_ownership, unk_amer_sports_ownership)).

% @attr salomon_founded
% @type categorical
% @canonical false
% @original_name Salomon founded
% @values y1947_annecy=1947_Francois_Salomon_Annecy unk_salomon_founded=Unknown
% @importance 0.40

0.90::acc(s10, salomon_founded).
0.75::acc(s13, salomon_founded).

0.95::true_val(salomon_founded, y1947_annecy); 0.05::true_val(salomon_founded, unk_salomon_founded).

measured(s10, salomon_founded, y1947_annecy).
measured(s13, salomon_founded, y1947_annecy).

all_consistent(salomon_founded) :-
    consistent(s10, salomon_founded),
    (indep(s13), consistent(s13, salomon_founded) ; \+indep(s13)).

evidence(all_consistent(salomon_founded)).
query(true_val(salomon_founded, y1947_annecy)).
query(true_val(salomon_founded, unk_salomon_founded)).

% @attr design_center
% @type categorical
% @canonical false
% @original_name Design center
% @values adc_annecy=Salomon_ADC_400k_sqft_750_employees unk_design_center=Unknown
% @importance 0.40

0.85::acc(s14, design_center).

0.82::true_val(design_center, adc_annecy); 0.18::true_val(design_center, unk_design_center).

measured(s14, design_center, adc_annecy).

all_consistent(design_center) :-
    consistent(s14, design_center).

evidence(all_consistent(design_center)).
query(true_val(design_center, adc_annecy)).
query(true_val(design_center, unk_design_center)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values china=Primarily_China unk_manufacturing_location_current=Unknown
% @importance 0.50

0.70::acc(s15, manufacturing_location_current).

0.65::true_val(manufacturing_location_current, china); 0.35::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s15, manufacturing_location_current, china).

all_consistent(manufacturing_location_current) :-
    consistent(s15, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, china)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr salomon_skis_manufactured_in
% @type categorical
% @canonical false
% @original_name Salomon skis manufactured in
% @values altenmarkt_austria=Amer_Sports_factory_Altenmarkt_Austria unk_salomon_skis_manufactured_in=Unknown
% @importance 0.40

0.85::acc(s14, salomon_skis_manufactured_in).

0.82::true_val(salomon_skis_manufactured_in, altenmarkt_austria); 0.18::true_val(salomon_skis_manufactured_in, unk_salomon_skis_manufactured_in).

measured(s14, salomon_skis_manufactured_in, altenmarkt_austria).

all_consistent(salomon_skis_manufactured_in) :-
    consistent(s14, salomon_skis_manufactured_in).

evidence(all_consistent(salomon_skis_manufactured_in)).
query(true_val(salomon_skis_manufactured_in, altenmarkt_austria)).
query(true_val(salomon_skis_manufactured_in, unk_salomon_skis_manufactured_in)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_year_limited=2_year_limited_materials_craftsmanship unk_warranty=Unknown
% @importance 0.70

0.85::acc(s4, warranty).

0.82::true_val(warranty, two_year_limited); 0.18::true_val(warranty, unk_warranty).

measured(s4, warranty, two_year_limited).

all_consistent(warranty) :-
    (indep(s4), consistent(s4, warranty) ; \+indep(s4)).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_year_limited)).
query(true_val(warranty, unk_warranty)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride_powder=Freeride_Powder all_mountain_carving=All_Mountain_Carving
% @importance 0.85

0.92::acc(s1, board_category).
0.70::acc(s5, board_category).

0.80::true_val(board_category, freeride_powder); 0.20::true_val(board_category, all_mountain_carving).

measured(s1, board_category, freeride_powder).
measured(s5, board_category, all_mountain_carving).

all_consistent(board_category) :-
    (indep(s1), consistent(s1, board_category) ; \+indep(s1)),
    (indep(s5), consistent(s5, board_category) ; \+indep(s5)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, all_mountain_carving)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values freeride_powder_steep=Freeride_Powder_Steep_Offpiste_Backcountry unk_terrain_suitability=Unknown
% @importance 0.90

0.90::acc(s1, terrain_suitability).

0.90::true_val(terrain_suitability, freeride_powder_steep); 0.10::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, freeride_powder_steep).

all_consistent(terrain_suitability) :-
    (indep(s1), consistent(s1, terrain_suitability) ; \+indep(s1)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, freeride_powder_steep)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values aggressive_highspeed_precision=Aggressive_highspeed_precision unk_riding_style=Unknown
% @importance 0.90

0.90::acc(s1, riding_style).

0.90::true_val(riding_style, aggressive_highspeed_precision); 0.10::true_val(riding_style, unk_riding_style).

measured(s1, riding_style, aggressive_highspeed_precision).

all_consistent(riding_style) :-
    (indep(s1), consistent(s1, riding_style) ; \+indep(s1)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, aggressive_highspeed_precision)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_expert=Advanced_to_Expert unk_rider_level=Unknown
% @importance 0.87

0.90::acc(s1, rider_level).
0.88::acc(s3, rider_level).
0.78::acc(s5, rider_level).

0.95::true_val(rider_level, advanced_expert); 0.05::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, advanced_expert).
measured(s3, rider_level, advanced_expert).
measured(s5, rider_level, advanced_expert).

all_consistent(rider_level) :-
    (indep(s1), consistent(s1, rider_level) ; \+indep(s1)),
    (indep(s3), consistent(s3, rider_level) ; \+indep(s3)),
    (indep(s5), consistent(s5, rider_level) ; \+indep(s5)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr use_case_description
% @type categorical
% @canonical false
% @original_name Use case description
% @values hard_charging_steep_deep=Hard_charging_freeride_steep_deep unk_use_case_description=Unknown
% @importance 0.95

0.95::acc(s2, use_case_description).
0.87::acc(s3, use_case_description).

0.95::true_val(use_case_description, hard_charging_steep_deep); 0.05::true_val(use_case_description, unk_use_case_description).

measured(s2, use_case_description, hard_charging_steep_deep).
measured(s3, use_case_description, hard_charging_steep_deep).

all_consistent(use_case_description) :-
    consistent(s2, use_case_description),
    (indep(s3), consistent(s3, use_case_description) ; \+indep(s3)).

evidence(all_consistent(use_case_description)).
query(true_val(use_case_description, hard_charging_steep_deep)).
query(true_val(use_case_description, unk_use_case_description)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.90

0.93::acc(s1, shape).

0.93::true_val(shape, tapered_directional); 0.07::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).

all_consistent(shape) :-
    (indep(s1), consistent(s1, shape) ; \+indep(s1)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr tail_shape
% @type categorical
% @canonical false
% @original_name Tail shape
% @values pin_tail=Pin_tail unk_tail_shape=Unknown
% @importance 0.95

0.93::acc(s1, tail_shape).
0.95::acc(s2, tail_shape).

0.97::true_val(tail_shape, pin_tail); 0.03::true_val(tail_shape, unk_tail_shape).

measured(s1, tail_shape, pin_tail).
measured(s2, tail_shape, pin_tail).

all_consistent(tail_shape) :-
    consistent(s2, tail_shape),
    (indep(s1), consistent(s1, tail_shape) ; \+indep(s1)).

evidence(all_consistent(tail_shape)).
query(true_val(tail_shape, pin_tail)).
query(true_val(tail_shape, unk_tail_shape)).

% @attr taper
% @type categorical
% @canonical true
% @original_name taper
% @values v2_to_20mm=Tail_tapered_2_to_20mm unk_taper=Unknown
% @importance 0.65

0.82::acc(s16, taper).
0.80::acc(s17, taper).

0.90::true_val(taper, v2_to_20mm); 0.10::true_val(taper, unk_taper).

measured(s16, taper, v2_to_20mm).
measured(s17, taper, v2_to_20mm).

all_consistent(taper) :-
    (indep(s16), consistent(s16, taper) ; \+indep(s16)),
    (indep(s17), consistent(s17, taper) ; \+indep(s17)).

evidence(all_consistent(taper)).
query(true_val(taper, v2_to_20mm)).
query(true_val(taper, unk_taper)).

% @attr taper_benefit
% @type categorical
% @canonical false
% @original_name Taper benefit
% @values loosens_turns_flotation=Loosens_turn_initiation_improves_flotation unk_taper_benefit=Unknown
% @importance 0.70

0.82::acc(s16, taper_benefit).

0.78::true_val(taper_benefit, loosens_turns_flotation); 0.22::true_val(taper_benefit, unk_taper_benefit).

measured(s16, taper_benefit, loosens_turns_flotation).

all_consistent(taper_benefit) :-
    (indep(s16), consistent(s16, taper_benefit) ; \+indep(s16)).

evidence(all_consistent(taper_benefit)).
query(true_val(taper_benefit, loosens_turns_flotation)).
query(true_val(taper_benefit, unk_taper_benefit)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values backseat_camber=Backseat_Camber unk_camber_type=Unknown
% @importance 0.95

0.93::acc(s1, camber_type).
0.97::acc(s2, camber_type).

0.97::true_val(camber_type, backseat_camber); 0.03::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, backseat_camber).
measured(s2, camber_type, backseat_camber).

all_consistent(camber_type) :-
    consistent(s2, camber_type),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, backseat_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values camber_back_flat_front=Camber_under_back_foot_flat_front_for_flotation unk_camber_description=Unknown
% @importance 0.95

0.95::acc(s2, camber_description).
0.87::acc(s3, camber_description).

0.95::true_val(camber_description, camber_back_flat_front); 0.05::true_val(camber_description, unk_camber_description).

measured(s2, camber_description, camber_back_flat_front).
measured(s3, camber_description, camber_back_flat_front).

all_consistent(camber_description) :-
    consistent(s2, camber_description),
    (indep(s3), consistent(s3, camber_description) ; \+indep(s3)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, camber_back_flat_front)).
query(true_val(camber_description, unk_camber_description)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values longer_rockered_nose=Longer_rockered_nose_for_turn_initiation_float unk_nose_design=Unknown
% @importance 0.75

0.78::acc(s5, nose_design).
0.82::acc(s18, nose_design).

0.90::true_val(nose_design, longer_rockered_nose); 0.10::true_val(nose_design, unk_nose_design).

measured(s5, nose_design, longer_rockered_nose).
measured(s18, nose_design, longer_rockered_nose).

all_consistent(nose_design) :-
    (indep(s5), consistent(s5, nose_design) ; \+indep(s5)),
    (indep(s18), consistent(s18, nose_design) ; \+indep(s18)).

evidence(all_consistent(nose_design)).
query(true_val(nose_design, longer_rockered_nose)).
query(true_val(nose_design, unk_nose_design)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values quadratic=Quadratic_Sidecut_mix_elliptic_curves unk_sidecut_type=Unknown
% @importance 0.95

0.93::acc(s1, sidecut_type).
0.97::acc(s2, sidecut_type).

0.97::true_val(sidecut_type, quadratic); 0.03::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, quadratic).
measured(s2, sidecut_type, quadratic).

all_consistent(sidecut_type) :-
    consistent(s2, sidecut_type),
    (indep(s1), consistent(s1, sidecut_type) ; \+indep(s1)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, quadratic)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values elliptic_curves_fluid_transitions=Blend_elliptic_curves_easy_initiation_fluid_transitions unk_sidecut_description=Unknown
% @importance 0.95

0.95::acc(s2, sidecut_description).
0.87::acc(s3, sidecut_description).

0.95::true_val(sidecut_description, elliptic_curves_fluid_transitions); 0.05::true_val(sidecut_description, unk_sidecut_description).

measured(s2, sidecut_description, elliptic_curves_fluid_transitions).
measured(s3, sidecut_description, elliptic_curves_fluid_transitions).

all_consistent(sidecut_description) :-
    consistent(s2, sidecut_description),
    (indep(s3), consistent(s3, sidecut_description) ; \+indep(s3)).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, elliptic_curves_fluid_transitions)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v9=9.0 unk_flex_rating_10=Unknown
% @importance 0.90

0.93::acc(s1, flex_rating_10).

0.90::true_val(flex_rating_10, v9); 0.10::true_val(flex_rating_10, unk_flex_rating_10).

measured(s1, flex_rating_10, v9).

all_consistent(flex_rating_10) :-
    (indep(s1), consistent(s1, flex_rating_10) ; \+indep(s1)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v9)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_rating_5
% @type numeric
% @canonical true
% @original_name flex_rating_5
% @unit /5
% @values v5=5.0 unk_flex_rating_5=Unknown
% @importance 0.80

0.78::acc(s5, flex_rating_5).

0.75::true_val(flex_rating_5, v5); 0.25::true_val(flex_rating_5, unk_flex_rating_5).

measured(s5, flex_rating_5, v5).

all_consistent(flex_rating_5) :-
    (indep(s5), consistent(s5, flex_rating_5) ; \+indep(s5)).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v5)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff=Stiff unk_flex_feel=Unknown
% @importance 0.90

0.93::acc(s1, flex_feel).

0.90::true_val(flex_feel, stiff); 0.10::true_val(flex_feel, unk_flex_feel).

measured(s1, flex_feel, stiff).

all_consistent(flex_feel) :-
    (indep(s1), consistent(s1, flex_feel) ; \+indep(s1)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values stiff_6_8=Stiff_evo_scale_6_to_8 unk_flex_rating_10_evo=Unknown
% @importance 0.60

0.80::acc(s19, flex_rating_10_evo).

0.78::true_val(flex_rating_10_evo, stiff_6_8); 0.22::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s19, flex_rating_10_evo, stiff_6_8).

all_consistent(flex_rating_10_evo) :-
    (indep(s19), consistent(s19, flex_rating_10_evo) ; \+indep(s19)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff_6_8)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard=Standard unk_width_options=Unknown
% @importance 0.90

0.90::acc(s1, width_options).

0.90::true_val(width_options, standard); 0.10::true_val(width_options, unk_width_options).

measured(s1, width_options, standard).

all_consistent(width_options) :-
    (indep(s1), consistent(s1, width_options) ; \+indep(s1)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_stiffer_tail=Directional_flex_stiffer_tail unk_flex_direction=Unknown
% @importance 0.75

0.78::acc(s5, flex_direction).
0.82::acc(s18, flex_direction).

0.90::true_val(flex_direction, directional_stiffer_tail); 0.10::true_val(flex_direction, unk_flex_direction).

measured(s5, flex_direction, directional_stiffer_tail).
measured(s18, flex_direction, directional_stiffer_tail).

all_consistent(flex_direction) :-
    (indep(s5), consistent(s5, flex_direction) ; \+indep(s5)),
    (indep(s18), consistent(s18, flex_direction) ; \+indep(s18)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_stiffer_tail)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_slct=Aspen_SLCT_Core aero_core=Aero_Core
% @importance 0.80

0.90::acc(s1, core_material).
0.68::acc(s5, core_material).

0.75::true_val(core_material, aspen_slct); 0.25::true_val(core_material, aero_core).

measured(s1, core_material, aspen_slct).
measured(s5, core_material, aero_core).

all_consistent(core_material) :-
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)),
    (indep(s5), consistent(s5, core_material) ; \+indep(s5)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_slct)).
query(true_val(core_material, aero_core)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_wood=FSC_Certified_wood_core unk_sustainability_certification=Unknown
% @importance 0.60

0.82::acc(s20, sustainability_certification).
0.85::acc(s21, sustainability_certification).
0.78::acc(s29, sustainability_certification).

0.95::true_val(sustainability_certification, fsc_certified_wood); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s20, sustainability_certification, fsc_certified_wood).
measured(s21, sustainability_certification, fsc_certified_wood).
measured(s29, sustainability_certification, fsc_certified_wood).

all_consistent(sustainability_certification) :-
    (indep(s20), consistent(s20, sustainability_certification) ; \+indep(s20)),
    (indep(s21), consistent(s21, sustainability_certification) ; \+indep(s21)),
    (indep(s29), consistent(s29, sustainability_certification) ; \+indep(s29)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_wood)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr core_description
% @type categorical
% @canonical false
% @original_name Core description
% @values ultralight_strong_hand_selected=Ultralight_strong_responsive_hand_selected_wood unk_core_description=Unknown
% @importance 0.90

0.88::acc(s3, core_description).

0.85::true_val(core_description, ultralight_strong_hand_selected); 0.15::true_val(core_description, unk_core_description).

measured(s3, core_description, ultralight_strong_hand_selected).

all_consistent(core_description) :-
    (indep(s3), consistent(s3, core_description) ; \+indep(s3)).

evidence(all_consistent(core_description)).
query(true_val(core_description, ultralight_strong_hand_selected)).
query(true_val(core_description, unk_core_description)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values popster=Popster_milled_core_inserts_natural_flex_pop unk_construction_material_innovation=Unknown
% @importance 0.90

0.93::acc(s1, construction_material_innovation).

0.90::true_val(construction_material_innovation, popster); 0.10::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, popster).

all_consistent(construction_material_innovation) :-
    (indep(s1), consistent(s1, construction_material_innovation) ; \+indep(s1)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, popster)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr popster_description
% @type categorical
% @canonical false
% @original_name Popster description
% @values milled_core_inserts_flex_pop=Core_milled_inside_inserts_natural_flex_energy_pop unk_popster_description=Unknown
% @importance 0.90

0.88::acc(s3, popster_description).

0.85::true_val(popster_description, milled_core_inserts_flex_pop); 0.15::true_val(popster_description, unk_popster_description).

measured(s3, popster_description, milled_core_inserts_flex_pop).

all_consistent(popster_description) :-
    (indep(s3), consistent(s3, popster_description) ; \+indep(s3)).

evidence(all_consistent(popster_description)).
query(true_val(popster_description, milled_core_inserts_flex_pop)).
query(true_val(popster_description, unk_popster_description)).

% @attr construction_material_innovation_damplifier
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values damplifier=Damplifier_ABS_cork_nose_vibration_absorber unk_construction_material_innovation_damplifier=Unknown
% @importance 0.90

0.90::acc(s1, construction_material_innovation_damplifier).

0.90::true_val(construction_material_innovation_damplifier, damplifier); 0.10::true_val(construction_material_innovation_damplifier, unk_construction_material_innovation_damplifier).

measured(s1, construction_material_innovation_damplifier, damplifier).

all_consistent(construction_material_innovation_damplifier) :-
    (indep(s1), consistent(s1, construction_material_innovation_damplifier) ; \+indep(s1)).

evidence(all_consistent(construction_material_innovation_damplifier)).
query(true_val(construction_material_innovation_damplifier, damplifier)).
query(true_val(construction_material_innovation_damplifier, unk_construction_material_innovation_damplifier)).

% @attr damplifier_description
% @type categorical
% @canonical false
% @original_name Damplifier description (Blue Tomato)
% @values reduced_swing_weight=Damplifier_insert_reduced_swing_weight unk_damplifier_description=Unknown
% @importance 0.65

0.82::acc(s22, damplifier_description).

0.78::true_val(damplifier_description, reduced_swing_weight); 0.22::true_val(damplifier_description, unk_damplifier_description).

measured(s22, damplifier_description, reduced_swing_weight).

all_consistent(damplifier_description) :-
    (indep(s22), consistent(s22, damplifier_description) ; \+indep(s22)).

evidence(all_consistent(damplifier_description)).
query(true_val(damplifier_description, reduced_swing_weight)).
query(true_val(damplifier_description, unk_damplifier_description)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values bfx_ultra_ba_md=BFX_Ultra_flax_carbon_BA_MD_Fiberglass unk_laminate=Unknown
% @importance 0.90

0.93::acc(s1, laminate).

0.90::true_val(laminate, bfx_ultra_ba_md); 0.10::true_val(laminate, unk_laminate).

measured(s1, laminate, bfx_ultra_ba_md).

all_consistent(laminate) :-
    (indep(s1), consistent(s1, laminate) ; \+indep(s1)).

evidence(all_consistent(laminate)).
query(true_val(laminate, bfx_ultra_ba_md)).
query(true_val(laminate, unk_laminate)).

% @attr bfx_ultra_description
% @type categorical
% @canonical false
% @original_name B/FX Ultra description
% @values basalt_flax_dampen_power_weight=Patented_basalt_flax_dampening_power_weight_reduction unk_bfx_ultra_description=Unknown
% @importance 0.70

0.82::acc(s16, bfx_ultra_description).
0.83::acc(s23, bfx_ultra_description).

0.90::true_val(bfx_ultra_description, basalt_flax_dampen_power_weight); 0.10::true_val(bfx_ultra_description, unk_bfx_ultra_description).

measured(s16, bfx_ultra_description, basalt_flax_dampen_power_weight).
measured(s23, bfx_ultra_description, basalt_flax_dampen_power_weight).

all_consistent(bfx_ultra_description) :-
    (indep(s16), consistent(s16, bfx_ultra_description) ; \+indep(s16)),
    (indep(s23), consistent(s23, bfx_ultra_description) ; \+indep(s23)).

evidence(all_consistent(bfx_ultra_description)).
query(true_val(bfx_ultra_description, basalt_flax_dampen_power_weight)).
query(true_val(bfx_ultra_description, unk_bfx_ultra_description)).

% @attr laminate_ghost_carbon
% @type categorical
% @canonical false
% @original_name laminate
% @values ghost_carbon_beams=Ghost_Carbon_Beams unk_laminate_ghost_carbon=Unknown
% @importance 0.80

0.60::acc(s5, laminate_ghost_carbon).

0.55::true_val(laminate_ghost_carbon, ghost_carbon_beams); 0.45::true_val(laminate_ghost_carbon, unk_laminate_ghost_carbon).

measured(s5, laminate_ghost_carbon, ghost_carbon_beams).

all_consistent(laminate_ghost_carbon) :-
    (indep(s5), consistent(s5, laminate_ghost_carbon) ; \+indep(s5)).

evidence(all_consistent(laminate_ghost_carbon)).
query(true_val(laminate_ghost_carbon, ghost_carbon_beams)).
query(true_val(laminate_ghost_carbon, unk_laminate_ghost_carbon)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs_66pct=66pct_Recycled_ABS recycled_abs_100pct=100pct_Recycled_ABS
% @importance 0.68

0.90::acc(s1, sidewall_material).
0.85::acc(s22, sidewall_material).
0.85::acc(s23, sidewall_material).
0.82::acc(s24, sidewall_material).

0.70::true_val(sidewall_material, recycled_abs_66pct); 0.30::true_val(sidewall_material, recycled_abs_100pct).

measured(s1, sidewall_material, recycled_abs_66pct).
measured(s22, sidewall_material, recycled_abs_66pct).
measured(s23, sidewall_material, recycled_abs_66pct).
measured(s24, sidewall_material, recycled_abs_100pct).

all_consistent(sidewall_material) :-
    (indep(s1), consistent(s1, sidewall_material) ; \+indep(s1)),
    (indep(s22), consistent(s22, sidewall_material) ; \+indep(s22)),
    (indep(s23), consistent(s23, sidewall_material) ; \+indep(s23)),
    (indep(s24), consistent(s24, sidewall_material) ; \+indep(s24)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs_66pct)).
query(true_val(sidewall_material, recycled_abs_100pct)).

% @attr sidewall_technology
% @type categorical
% @canonical false
% @original_name Sidewall technology
% @values abs_toughness_dampening=ABS_toughness_energy_transfer_dampening unk_sidewall_technology=Unknown
% @importance 0.40

0.80::acc(s25, sidewall_technology).

0.78::true_val(sidewall_technology, abs_toughness_dampening); 0.22::true_val(sidewall_technology, unk_sidewall_technology).

measured(s25, sidewall_technology, abs_toughness_dampening).

all_consistent(sidewall_technology) :-
    (indep(s25), consistent(s25, sidewall_technology) ; \+indep(s25)).

evidence(all_consistent(sidewall_technology)).
query(true_val(sidewall_technology, abs_toughness_dampening)).
query(true_val(sidewall_technology, unk_sidewall_technology)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values recycled_sintered_50pct=50pct_Recycled_Sintered_Base unk_base_material=Unknown
% @importance 0.90

0.93::acc(s1, base_material).

0.90::true_val(base_material, recycled_sintered_50pct); 0.10::true_val(base_material, unk_base_material).

measured(s1, base_material, recycled_sintered_50pct).

all_consistent(base_material) :-
    (indep(s1), consistent(s1, base_material) ; \+indep(s1)).

evidence(all_consistent(base_material)).
query(true_val(base_material, recycled_sintered_50pct)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_eg=Sintered_EG_base unk_base_type=Unknown
% @importance 0.70

0.82::acc(s16, base_type).

0.78::true_val(base_type, sintered_eg); 0.22::true_val(base_type, unk_base_type).

measured(s16, base_type, sintered_eg).

all_consistent(base_type) :-
    (indep(s16), consistent(s16, base_type) ; \+indep(s16)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_eg)).
query(true_val(base_type, unk_base_type)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values bio_based_30pct=30pct_Bio_Based_Resin unk_resin=Unknown
% @importance 0.90

0.93::acc(s1, resin).

0.90::true_val(resin, bio_based_30pct); 0.10::true_val(resin, unk_resin).

measured(s1, resin, bio_based_30pct).

all_consistent(resin) :-
    (indep(s1), consistent(s1, resin) ; \+indep(s1)).

evidence(all_consistent(resin)).
query(true_val(resin, bio_based_30pct)).
query(true_val(resin, unk_resin)).

% @attr resin_description
% @type categorical
% @canonical false
% @original_name Resin description
% @values bio_epoxy_30pct_plants=Bio_epoxy_resin_30pct_plant_derived unk_resin_description=Unknown
% @importance 0.70

0.82::acc(s16, resin_description).

0.78::true_val(resin_description, bio_epoxy_30pct_plants); 0.22::true_val(resin_description, unk_resin_description).

measured(s16, resin_description, bio_epoxy_30pct_plants).

all_consistent(resin_description) :-
    (indep(s16), consistent(s16, resin_description) ; \+indep(s16)).

evidence(all_consistent(resin_description)).
query(true_val(resin_description, bio_epoxy_30pct_plants)).
query(true_val(resin_description, unk_resin_description)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values recycled_steel_20pct=20pct_Recycled_Steel_Edges unk_edge_technology=Unknown
% @importance 0.675

0.85::acc(s22, edge_technology).
0.83::acc(s23, edge_technology).

0.90::true_val(edge_technology, recycled_steel_20pct); 0.10::true_val(edge_technology, unk_edge_technology).

measured(s22, edge_technology, recycled_steel_20pct).
measured(s23, edge_technology, recycled_steel_20pct).

all_consistent(edge_technology) :-
    (indep(s22), consistent(s22, edge_technology) ; \+indep(s22)),
    (indep(s23), consistent(s23, edge_technology) ; \+indep(s23)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_steel_20pct)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values olive_wood_veneer=Olive_wood_veneer unk_topsheet=Unknown
% @importance 0.675

0.85::acc(s22, topsheet).
0.83::acc(s23, topsheet).

0.90::true_val(topsheet, olive_wood_veneer); 0.10::true_val(topsheet, unk_topsheet).

measured(s22, topsheet, olive_wood_veneer).
measured(s23, topsheet, olive_wood_veneer).

all_consistent(topsheet) :-
    (indep(s22), consistent(s22, topsheet) ; \+indep(s22)),
    (indep(s23), consistent(s23, topsheet) ; \+indep(s23)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, olive_wood_veneer)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values premium_light_strong_stylish=Premium_light_strong_stylish unk_topsheet_appearance_description=Unknown
% @importance 0.35

0.70::acc(s26, topsheet_appearance_description).

0.63::true_val(topsheet_appearance_description, premium_light_strong_stylish); 0.37::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s26, topsheet_appearance_description, premium_light_strong_stylish).

all_consistent(topsheet_appearance_description) :-
    (indep(s26), consistent(s26, topsheet_appearance_description) ; \+indep(s26)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, premium_light_strong_stylish)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr base_finish
% @type categorical
% @canonical false
% @original_name Base finish (merchant verified)
% @values fine_stone_finish=Fine_Stone_Finish unk_base_finish=Unknown
% @importance 0.90

0.90::acc(s1, base_finish).

0.90::true_val(base_finish, fine_stone_finish); 0.10::true_val(base_finish, unk_base_finish).

measured(s1, base_finish, fine_stone_finish).

all_consistent(base_finish) :-
    (indep(s1), consistent(s1, base_finish) ; \+indep(s1)).

evidence(all_consistent(base_finish)).
query(true_val(base_finish, fine_stone_finish)).
query(true_val(base_finish, unk_base_finish)).

% @attr base_finish_description
% @type categorical
% @canonical false
% @original_name Base finish description
% @values efficient_sintered_powder=Efficient_on_Sintered_EG_speeds_up_powder unk_base_finish_description=Unknown
% @importance 0.70

0.82::acc(s16, base_finish_description).

0.78::true_val(base_finish_description, efficient_sintered_powder); 0.22::true_val(base_finish_description, unk_base_finish_description).

measured(s16, base_finish_description, efficient_sintered_powder).

all_consistent(base_finish_description) :-
    (indep(s16), consistent(s16, base_finish_description) ; \+indep(s16)).

evidence(all_consistent(base_finish_description)).
query(true_val(base_finish_description, efficient_sintered_powder)).
query(true_val(base_finish_description, unk_base_finish_description)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax (merchant verified)
% @values natural_wax=Natural_Wax unk_factory_wax=Unknown
% @importance 0.90

0.90::acc(s1, factory_wax).

0.90::true_val(factory_wax, natural_wax); 0.10::true_val(factory_wax, unk_factory_wax).

measured(s1, factory_wax, natural_wax).

all_consistent(factory_wax) :-
    (indep(s1), consistent(s1, factory_wax) ; \+indep(s1)).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, natural_wax)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr natural_wax_description
% @type categorical
% @canonical false
% @original_name Natural wax description
% @values paraffin_free_natural=Paraffin_free_natural_ingredients_highest_glide unk_natural_wax_description=Unknown
% @importance 0.70

0.82::acc(s16, natural_wax_description).

0.78::true_val(natural_wax_description, paraffin_free_natural); 0.22::true_val(natural_wax_description, unk_natural_wax_description).

measured(s16, natural_wax_description, paraffin_free_natural).

all_consistent(natural_wax_description) :-
    (indep(s16), consistent(s16, natural_wax_description) ; \+indep(s16)).

evidence(all_consistent(natural_wax_description)).
query(true_val(natural_wax_description, paraffin_free_natural)).
query(true_val(natural_wax_description, unk_natural_wax_description)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.90

0.90::acc(s1, mounting_pattern).

0.90::true_val(mounting_pattern, inserts_2x4); 0.10::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr mounting_pattern_description
% @type categorical
% @canonical false
% @original_name Mounting pattern description
% @values standard_wide_stance_options=Standard_pattern_wide_stance_most_bindings unk_mounting_pattern_description=Unknown
% @importance 0.70

0.85::acc(s4, mounting_pattern_description).

0.82::true_val(mounting_pattern_description, standard_wide_stance_options); 0.18::true_val(mounting_pattern_description, unk_mounting_pattern_description).

measured(s4, mounting_pattern_description, standard_wide_stance_options).

all_consistent(mounting_pattern_description) :-
    (indep(s4), consistent(s4, mounting_pattern_description) ; \+indep(s4)).

evidence(all_consistent(mounting_pattern_description)).
query(true_val(mounting_pattern_description, standard_wide_stance_options)).
query(true_val(mounting_pattern_description, unk_mounting_pattern_description)).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values all_mtn_1deg_sidecut_2deg_feet=All_Mountain_Edge_Bevel_1deg_sidecut_2deg_between_feet unk_edge_bevel_spec=Unknown
% @importance 0.60

0.78::acc(s27, edge_bevel_spec).
0.82::acc(s28, edge_bevel_spec).

0.90::true_val(edge_bevel_spec, all_mtn_1deg_sidecut_2deg_feet); 0.10::true_val(edge_bevel_spec, unk_edge_bevel_spec).

measured(s27, edge_bevel_spec, all_mtn_1deg_sidecut_2deg_feet).
measured(s28, edge_bevel_spec, all_mtn_1deg_sidecut_2deg_feet).

all_consistent(edge_bevel_spec) :-
    (indep(s27), consistent(s27, edge_bevel_spec) ; \+indep(s27)),
    (indep(s28), consistent(s28, edge_bevel_spec) ; \+indep(s28)).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, all_mtn_1deg_sidecut_2deg_feet)).
query(true_val(edge_bevel_spec, unk_edge_bevel_spec)).

% @attr sustainability_certification_materials
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_materials_summary=50pct_base_66pct_ABS_30pct_resin_20pct_edges unk_sustainability_certification_materials=Unknown
% @importance 0.65

0.83::acc(s23, sustainability_certification_materials).
0.82::acc(s24, sustainability_certification_materials).

0.90::true_val(sustainability_certification_materials, recycled_materials_summary); 0.10::true_val(sustainability_certification_materials, unk_sustainability_certification_materials).

measured(s23, sustainability_certification_materials, recycled_materials_summary).
measured(s24, sustainability_certification_materials, recycled_materials_summary).

all_consistent(sustainability_certification_materials) :-
    (indep(s23), consistent(s23, sustainability_certification_materials) ; \+indep(s23)),
    (indep(s24), consistent(s24, sustainability_certification_materials) ; \+indep(s24)).

evidence(all_consistent(sustainability_certification_materials)).
query(true_val(sustainability_certification_materials, recycled_materials_summary)).
query(true_val(sustainability_certification_materials, unk_sustainability_certification_materials)).

% @attr sustainability_certification_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values paraffin_free_wax=Paraffin_free_natural_wax unk_sustainability_certification_wax=Unknown
% @importance 0.70

0.82::acc(s16, sustainability_certification_wax).

0.78::true_val(sustainability_certification_wax, paraffin_free_wax); 0.22::true_val(sustainability_certification_wax, unk_sustainability_certification_wax).

measured(s16, sustainability_certification_wax, paraffin_free_wax).

all_consistent(sustainability_certification_wax) :-
    (indep(s16), consistent(s16, sustainability_certification_wax) ; \+indep(s16)).

evidence(all_consistent(sustainability_certification_wax)).
query(true_val(sustainability_certification_wax, paraffin_free_wax)).
query(true_val(sustainability_certification_wax, unk_sustainability_certification_wax)).

% @attr sustainability_certification_pledge
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values salomon_2030_pledge=30pct_emission_reduction_100pct_circular_economy_by_2030 unk_sustainability_certification_pledge=Unknown
% @importance 0.40

0.72::acc(s30, sustainability_certification_pledge).

0.68::true_val(sustainability_certification_pledge, salomon_2030_pledge); 0.32::true_val(sustainability_certification_pledge, unk_sustainability_certification_pledge).

measured(s30, sustainability_certification_pledge, salomon_2030_pledge).

all_consistent(sustainability_certification_pledge) :-
    consistent(s30, sustainability_certification_pledge).

evidence(all_consistent(sustainability_certification_pledge)).
query(true_val(sustainability_certification_pledge, salomon_2030_pledge)).
query(true_val(sustainability_certification_pledge, unk_sustainability_certification_pledge)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s153_157_160_163=153_157_160_163cm unk_available_sizes=Unknown
% @importance 0.90

0.93::acc(s1, available_sizes).

0.90::true_val(available_sizes, s153_157_160_163); 0.10::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, s153_157_160_163).

all_consistent(available_sizes) :-
    (indep(s1), consistent(s1, available_sizes) ; \+indep(s1)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s153_157_160_163)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_extended
% @type categorical
% @canonical false
% @original_name available_sizes
% @values s149_166_170=149_166_170cm unk_available_sizes_extended=Unknown
% @importance 0.70

0.78::acc(s31, available_sizes_extended).

0.75::true_val(available_sizes_extended, s149_166_170); 0.25::true_val(available_sizes_extended, unk_available_sizes_extended).

measured(s31, available_sizes_extended, s149_166_170).

all_consistent(available_sizes_extended) :-
    (indep(s31), consistent(s31, available_sizes_extended) ; \+indep(s31)).

evidence(all_consistent(available_sizes_extended)).
query(true_val(available_sizes_extended, s149_166_170)).
query(true_val(available_sizes_extended, unk_available_sizes_extended)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit cm
% @values v2_0=2.0 unk_setback=Unknown
% @importance 0.90

0.90::acc(s1, setback).

0.90::true_val(setback, v2_0); 0.10::true_val(setback, unk_setback).

measured(s1, setback, v2_0).

all_consistent(setback) :-
    (indep(s1), consistent(s1, setback) ; \+indep(s1)).

evidence(all_consistent(setback)).
query(true_val(setback, v2_0)).
query(true_val(setback, unk_setback)).

% @attr effective_edge_153
% @type numeric
% @canonical false
% @original_name Effective edge 153cm
% @unit cm
% @values v110_5=110.5 unk_effective_edge_153=Unknown
% @importance 0.90

0.90::acc(s1, effective_edge_153).

0.90::true_val(effective_edge_153, v110_5); 0.10::true_val(effective_edge_153, unk_effective_edge_153).

measured(s1, effective_edge_153, v110_5).

all_consistent(effective_edge_153) :-
    (indep(s1), consistent(s1, effective_edge_153) ; \+indep(s1)).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v110_5)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

% @attr waist_width_153
% @type numeric
% @canonical false
% @original_name Waist width 153cm
% @unit cm
% @values v25_4=25.4 unk_waist_width_153=Unknown
% @importance 0.90

0.90::acc(s1, waist_width_153).

0.90::true_val(waist_width_153, v25_4); 0.10::true_val(waist_width_153, unk_waist_width_153).

measured(s1, waist_width_153, v25_4).

all_consistent(waist_width_153) :-
    (indep(s1), consistent(s1, waist_width_153) ; \+indep(s1)).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_4)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr sidecut_radius_size_153
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v6_9=6.9 unk_sidecut_radius_size_153=Unknown
% @importance 0.90

0.90::acc(s1, sidecut_radius_size_153).

0.90::true_val(sidecut_radius_size_153, v6_9); 0.10::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(s1, sidecut_radius_size_153, v6_9).

all_consistent(sidecut_radius_size_153) :-
    (indep(s1), consistent(s1, sidecut_radius_size_153) ; \+indep(s1)).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v6_9)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values v54_0=54.0 unk_stance_width_range_size=Unknown
% @importance 0.90

0.90::acc(s1, stance_width_range_size).

0.90::true_val(stance_width_range_size, v54_0); 0.10::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, v54_0).

all_consistent(stance_width_range_size) :-
    (indep(s1), consistent(s1, stance_width_range_size) ; \+indep(s1)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v54_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size_153
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w60_75kg=60_to_75kg unk_recommended_weight_range_size_153=Unknown
% @importance 0.90

0.90::acc(s1, recommended_weight_range_size_153).

0.90::true_val(recommended_weight_range_size_153, w60_75kg); 0.10::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).

measured(s1, recommended_weight_range_size_153, w60_75kg).

all_consistent(recommended_weight_range_size_153) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_153) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w60_75kg)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

% @attr effective_edge_157
% @type numeric
% @canonical false
% @original_name Effective edge 157cm
% @unit cm
% @values v114_0=114.0 unk_effective_edge_157=Unknown
% @importance 0.90

0.90::acc(s1, effective_edge_157).

0.90::true_val(effective_edge_157, v114_0); 0.10::true_val(effective_edge_157, unk_effective_edge_157).

measured(s1, effective_edge_157, v114_0).

all_consistent(effective_edge_157) :-
    (indep(s1), consistent(s1, effective_edge_157) ; \+indep(s1)).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v114_0)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr waist_width_157
% @type numeric
% @canonical false
% @original_name Waist width 157cm
% @unit cm
% @values v25_8=25.8 unk_waist_width_157=Unknown
% @importance 0.90

0.90::acc(s1, waist_width_157).

0.90::true_val(waist_width_157, v25_8); 0.10::true_val(waist_width_157, unk_waist_width_157).

measured(s1, waist_width_157, v25_8).

all_consistent(waist_width_157) :-
    (indep(s1), consistent(s1, waist_width_157) ; \+indep(s1)).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_8)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_1=7.1 unk_sidecut_radius_size=Unknown
% @importance 0.90

0.90::acc(s1, sidecut_radius_size).

0.90::true_val(sidecut_radius_size, v7_1); 0.10::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v7_1).

all_consistent(sidecut_radius_size) :-
    (indep(s1), consistent(s1, sidecut_radius_size) ; \+indep(s1)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_1)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w60_85kg=60_to_85kg unk_recommended_weight_range_size=Unknown
% @importance 0.90

0.90::acc(s1, recommended_weight_range_size).

0.90::true_val(recommended_weight_range_size, w60_85kg); 0.10::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, w60_85kg).

all_consistent(recommended_weight_range_size) :-
    (indep(s1), consistent(s1, recommended_weight_range_size) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w60_85kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_160
% @type numeric
% @canonical false
% @original_name Effective edge 160cm
% @unit cm
% @values v116_0=116.0 unk_effective_edge_160=Unknown
% @importance 0.90

0.90::acc(s1, effective_edge_160).

0.90::true_val(effective_edge_160, v116_0); 0.10::true_val(effective_edge_160, unk_effective_edge_160).

measured(s1, effective_edge_160, v116_0).

all_consistent(effective_edge_160) :-
    (indep(s1), consistent(s1, effective_edge_160) ; \+indep(s1)).

evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v116_0)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

% @attr waist_width_160
% @type numeric
% @canonical false
% @original_name Waist width 160cm
% @unit cm
% @values v26_0=26.0 unk_waist_width_160=Unknown
% @importance 0.90

0.90::acc(s1, waist_width_160).

0.90::true_val(waist_width_160, v26_0); 0.10::true_val(waist_width_160, unk_waist_width_160).

measured(s1, waist_width_160, v26_0).

all_consistent(waist_width_160) :-
    (indep(s1), consistent(s1, waist_width_160) ; \+indep(s1)).

evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v26_0)).
query(true_val(waist_width_160, unk_waist_width_160)).

% @attr sidecut_radius_size_160
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_3=7.3 unk_sidecut_radius_size_160=Unknown
% @importance 0.90

0.90::acc(s1, sidecut_radius_size_160).

0.90::true_val(sidecut_radius_size_160, v7_3); 0.10::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).

measured(s1, sidecut_radius_size_160, v7_3).

all_consistent(sidecut_radius_size_160) :-
    (indep(s1), consistent(s1, sidecut_radius_size_160) ; \+indep(s1)).

evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v7_3)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

% @attr recommended_weight_range_size_160
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w70_90kg=70_to_90kg unk_recommended_weight_range_size_160=Unknown
% @importance 0.90

0.90::acc(s1, recommended_weight_range_size_160).

0.90::true_val(recommended_weight_range_size_160, w70_90kg); 0.10::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).

measured(s1, recommended_weight_range_size_160, w70_90kg).

all_consistent(recommended_weight_range_size_160) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_160) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, w70_90kg)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr effective_edge_163
% @type numeric
% @canonical false
% @original_name Effective edge 163cm
% @unit cm
% @values v118_0=118.0 unk_effective_edge_163=Unknown
% @importance 0.90

0.90::acc(s1, effective_edge_163).

0.90::true_val(effective_edge_163, v118_0); 0.10::true_val(effective_edge_163, unk_effective_edge_163).

measured(s1, effective_edge_163, v118_0).

all_consistent(effective_edge_163) :-
    (indep(s1), consistent(s1, effective_edge_163) ; \+indep(s1)).

evidence(all_consistent(effective_edge_163)).
query(true_val(effective_edge_163, v118_0)).
query(true_val(effective_edge_163, unk_effective_edge_163)).

% @attr waist_width_163
% @type numeric
% @canonical false
% @original_name Waist width 163cm
% @unit cm
% @values v26_4=26.4 unk_waist_width_163=Unknown
% @importance 0.90

0.90::acc(s1, waist_width_163).

0.90::true_val(waist_width_163, v26_4); 0.10::true_val(waist_width_163, unk_waist_width_163).

measured(s1, waist_width_163, v26_4).

all_consistent(waist_width_163) :-
    (indep(s1), consistent(s1, waist_width_163) ; \+indep(s1)).

evidence(all_consistent(waist_width_163)).
query(true_val(waist_width_163, v26_4)).
query(true_val(waist_width_163, unk_waist_width_163)).

% @attr sidecut_radius_size_163
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_8=7.8 unk_sidecut_radius_size_163=Unknown
% @importance 0.90

0.90::acc(s1, sidecut_radius_size_163).

0.90::true_val(sidecut_radius_size_163, v7_8); 0.10::true_val(sidecut_radius_size_163, unk_sidecut_radius_size_163).

measured(s1, sidecut_radius_size_163, v7_8).

all_consistent(sidecut_radius_size_163) :-
    (indep(s1), consistent(s1, sidecut_radius_size_163) ; \+indep(s1)).

evidence(all_consistent(sidecut_radius_size_163)).
query(true_val(sidecut_radius_size_163, v7_8)).
query(true_val(sidecut_radius_size_163, unk_sidecut_radius_size_163)).

% @attr recommended_weight_range_size_163
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w70_105kg=70_to_105kg unk_recommended_weight_range_size_163=Unknown
% @importance 0.90

0.90::acc(s1, recommended_weight_range_size_163).

0.90::true_val(recommended_weight_range_size_163, w70_105kg); 0.10::true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163).

measured(s1, recommended_weight_range_size_163, w70_105kg).

all_consistent(recommended_weight_range_size_163) :-
    (indep(s1), consistent(s1, recommended_weight_range_size_163) ; \+indep(s1)).

evidence(all_consistent(recommended_weight_range_size_163)).
query(true_val(recommended_weight_range_size_163, w70_105kg)).
query(true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v749_95=749.95 unk_price_usd_msrp=Unknown
% @importance 0.875

0.88::acc(s3, price_usd_msrp).
0.85::acc(s32, price_usd_msrp).

0.95::true_val(price_usd_msrp, v749_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s3, price_usd_msrp, v749_95).
measured(s32, price_usd_msrp, v749_95).

all_consistent(price_usd_msrp) :-
    (indep(s3), consistent(s3, price_usd_msrp) ; \+indep(s3)),
    (indep(s32), consistent(s32, price_usd_msrp) ; \+indep(s32)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v749_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v759_99=759.99 unk_price_aud_merchant=Unknown
% @importance 0.90

0.90::acc(s1, price_aud_merchant).

0.90::true_val(price_aud_merchant, v759_99); 0.10::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s1, price_aud_merchant, v759_99).

all_consistent(price_aud_merchant) :-
    (indep(s1), consistent(s1, price_aud_merchant) ; \+indep(s1)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v759_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_aud_merchant_rrp
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v949_99=949.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.90

0.90::acc(s1, price_aud_merchant_rrp).

0.90::true_val(price_aud_merchant_rrp, v949_99); 0.10::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s1, price_aud_merchant_rrp, v949_99).

all_consistent(price_aud_merchant_rrp) :-
    (indep(s1), consistent(s1, price_aud_merchant_rrp) ; \+indep(s1)).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v949_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v419_97=419.97 unk_price_eur_blue_tomato=Unknown
% @importance 0.80

0.85::acc(s33, price_eur_blue_tomato).

0.85::true_val(price_eur_blue_tomato, v419_97); 0.15::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s33, price_eur_blue_tomato, v419_97).

all_consistent(price_eur_blue_tomato) :-
    (indep(s33), consistent(s33, price_eur_blue_tomato) ; \+indep(s33)).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v419_97)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_eur_blue_tomato_rrp
% @type numeric
% @canonical false
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v599_95=599.95 unk_price_eur_blue_tomato_rrp=Unknown
% @importance 0.80

0.85::acc(s33, price_eur_blue_tomato_rrp).

0.85::true_val(price_eur_blue_tomato_rrp, v599_95); 0.15::true_val(price_eur_blue_tomato_rrp, unk_price_eur_blue_tomato_rrp).

measured(s33, price_eur_blue_tomato_rrp, v599_95).

all_consistent(price_eur_blue_tomato_rrp) :-
    (indep(s33), consistent(s33, price_eur_blue_tomato_rrp) ; \+indep(s33)).

evidence(all_consistent(price_eur_blue_tomato_rrp)).
query(true_val(price_eur_blue_tomato_rrp, v599_95)).
query(true_val(price_eur_blue_tomato_rrp, unk_price_eur_blue_tomato_rrp)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v599_96=599.96 unk_price_usd_evo=Unknown
% @importance 0.90

0.92::acc(s34, price_usd_evo).

0.92::true_val(price_usd_evo, v599_96); 0.08::true_val(price_usd_evo, unk_price_usd_evo).

measured(s34, price_usd_evo, v599_96).

all_consistent(price_usd_evo) :-
    (indep(s34), consistent(s34, price_usd_evo) ; \+indep(s34)).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v599_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_evo_full
% @type numeric
% @canonical false
% @original_name price_usd_evo
% @unit USD
% @values v749_95=749.95 unk_price_usd_evo_full=Unknown
% @importance 0.90

0.92::acc(s34, price_usd_evo_full).

0.92::true_val(price_usd_evo_full, v749_95); 0.08::true_val(price_usd_evo_full, unk_price_usd_evo_full).

measured(s34, price_usd_evo_full, v749_95).

all_consistent(price_usd_evo_full) :-
    (indep(s34), consistent(s34, price_usd_evo_full) ; \+indep(s34)).

evidence(all_consistent(price_usd_evo_full)).
query(true_val(price_usd_evo_full, v749_95)).
query(true_val(price_usd_evo_full, unk_price_usd_evo_full)).

% @attr price_usd_rei
% @type numeric
% @canonical true
% @original_name price_usd_rei
% @unit USD
% @values v524_83=524.83 unk_price_usd_rei=Unknown
% @importance 0.90

0.88::acc(s35, price_usd_rei).

0.88::true_val(price_usd_rei, v524_83); 0.12::true_val(price_usd_rei, unk_price_usd_rei).

measured(s35, price_usd_rei, v524_83).

all_consistent(price_usd_rei) :-
    (indep(s35), consistent(s35, price_usd_rei) ; \+indep(s35)).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v524_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_usd_rei_full
% @type numeric
% @canonical false
% @original_name price_usd_rei
% @unit USD
% @values v749_95=749.95 unk_price_usd_rei_full=Unknown
% @importance 0.90

0.88::acc(s3, price_usd_rei_full).

0.88::true_val(price_usd_rei_full, v749_95); 0.12::true_val(price_usd_rei_full, unk_price_usd_rei_full).

measured(s3, price_usd_rei_full, v749_95).

all_consistent(price_usd_rei_full) :-
    (indep(s3), consistent(s3, price_usd_rei_full) ; \+indep(s3)).

evidence(all_consistent(price_usd_rei_full)).
query(true_val(price_usd_rei_full, v749_95)).
query(true_val(price_usd_rei_full, unk_price_usd_rei_full)).

% @attr price_usd_shred_shop
% @type numeric
% @canonical false
% @original_name Shred Shop price
% @unit USD
% @values v599_96=599.96 unk_price_usd_shred_shop=Unknown
% @importance 0.75

0.82::acc(s36, price_usd_shred_shop).

0.82::true_val(price_usd_shred_shop, v599_96); 0.18::true_val(price_usd_shred_shop, unk_price_usd_shred_shop).

measured(s36, price_usd_shred_shop, v599_96).

all_consistent(price_usd_shred_shop) :-
    (indep(s36), consistent(s36, price_usd_shred_shop) ; \+indep(s36)).

evidence(all_consistent(price_usd_shred_shop)).
query(true_val(price_usd_shred_shop, v599_96)).
query(true_val(price_usd_shred_shop, unk_price_usd_shred_shop)).

% @attr price_usd_bluezone
% @type numeric
% @canonical false
% @original_name BlueZone Sports price
% @unit USD
% @values v749_95=749.95 unk_price_usd_bluezone=Unknown
% @importance 0.85

0.85::acc(s32, price_usd_bluezone).

0.82::true_val(price_usd_bluezone, v749_95); 0.18::true_val(price_usd_bluezone, unk_price_usd_bluezone).

measured(s32, price_usd_bluezone, v749_95).

all_consistent(price_usd_bluezone) :-
    (indep(s32), consistent(s32, price_usd_bluezone) ; \+indep(s32)).

evidence(all_consistent(price_usd_bluezone)).
query(true_val(price_usd_bluezone, v749_95)).
query(true_val(price_usd_bluezone, unk_price_usd_bluezone)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available=Available unk_availability_status=Unknown
% @importance 0.72

0.90::acc(s34, availability_status).
0.85::acc(s35, availability_status).
0.78::acc(s5, availability_status).
0.83::acc(s23, availability_status).
0.80::acc(s16, availability_status).
0.82::acc(s22, availability_status).
0.78::acc(s31, availability_status).
0.80::acc(s20, availability_status).
0.90::acc(s9, availability_status).

0.97::true_val(availability_status, available); 0.03::true_val(availability_status, unk_availability_status).

measured(s34, availability_status, available).
measured(s35, availability_status, available).
measured(s5, availability_status, available).
measured(s23, availability_status, available).
measured(s16, availability_status, available).
measured(s22, availability_status, available).
measured(s31, availability_status, available).
measured(s20, availability_status, available).
measured(s9, availability_status, available).

all_consistent(availability_status) :-
    consistent(s9, availability_status),
    (indep(s34), consistent(s34, availability_status) ; \+indep(s34)),
    (indep(s35), consistent(s35, availability_status) ; \+indep(s35)),
    (indep(s5), consistent(s5, availability_status) ; \+indep(s5)),
    (indep(s23), consistent(s23, availability_status) ; \+indep(s23)),
    (indep(s16), consistent(s16, availability_status) ; \+indep(s16)),
    (indep(s22), consistent(s22, availability_status) ; \+indep(s22)),
    (indep(s31), consistent(s31, availability_status) ; \+indep(s31)),
    (indep(s20), consistent(s20, availability_status) ; \+indep(s20)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_shred_shop
% @type categorical
% @canonical false
% @original_name availability_status
% @values sizes_limited=153_157_sold_out unk_availability_status_shred_shop=Unknown
% @importance 0.75

0.78::acc(s36, availability_status_shred_shop).

0.75::true_val(availability_status_shred_shop, sizes_limited); 0.25::true_val(availability_status_shred_shop, unk_availability_status_shred_shop).

measured(s36, availability_status_shred_shop, sizes_limited).

all_consistent(availability_status_shred_shop) :-
    (indep(s36), consistent(s36, availability_status_shred_shop) ; \+indep(s36)).

evidence(all_consistent(availability_status_shred_shop)).
query(true_val(availability_status_shred_shop, sizes_limited)).
query(true_val(availability_status_shred_shop, unk_availability_status_shred_shop)).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status
% @values sizes_limited_skipro=157_160_166_170_sold_out unk_availability_status_skipro=Unknown
% @importance 0.70

0.72::acc(s37, availability_status_skipro).

0.70::true_val(availability_status_skipro, sizes_limited_skipro); 0.30::true_val(availability_status_skipro, unk_availability_status_skipro).

measured(s37, availability_status_skipro, sizes_limited_skipro).

all_consistent(availability_status_skipro) :-
    (indep(s37), consistent(s37, availability_status_skipro) ; \+indep(s37)).

evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, sizes_limited_skipro)).
query(true_val(availability_status_skipro, unk_availability_status_skipro)).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out=Sold_out unk_availability_status_snowcountry=Unknown
% @importance 0.80

0.80::acc(s33, availability_status_snowcountry).

0.78::true_val(availability_status_snowcountry, sold_out); 0.22::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).

measured(s33, availability_status_snowcountry, sold_out).

all_consistent(availability_status_snowcountry) :-
    (indep(s33), consistent(s33, availability_status_snowcountry) ; \+indep(s33)).

evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, sold_out)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

% @attr availability_status_used
% @type categorical
% @canonical false
% @original_name availability_status
% @values used_good=Used_Good_Condition unk_availability_status_used=Unknown
% @importance 0.50

0.70::acc(s38, availability_status_used).

0.65::true_val(availability_status_used, used_good); 0.35::true_val(availability_status_used, unk_availability_status_used).

measured(s38, availability_status_used, used_good).

all_consistent(availability_status_used) :-
    consistent(s38, availability_status_used).

evidence(all_consistent(availability_status_used)).
query(true_val(availability_status_used, used_good)).
query(true_val(availability_status_used, unk_availability_status_used)).

% @attr evo_reputation
% @type categorical
% @canonical false
% @original_name evo.com reputation
% @values major_specialty_retailer=Major_US_specialty_retailer_lowest_price_guarantee unk_evo_reputation=Unknown
% @importance 0.90

0.88::acc(s34, evo_reputation).

0.88::true_val(evo_reputation, major_specialty_retailer); 0.12::true_val(evo_reputation, unk_evo_reputation).

measured(s34, evo_reputation, major_specialty_retailer).

all_consistent(evo_reputation) :-
    (indep(s34), consistent(s34, evo_reputation) ; \+indep(s34)).

evidence(all_consistent(evo_reputation)).
query(true_val(evo_reputation, major_specialty_retailer)).
query(true_val(evo_reputation, unk_evo_reputation)).

% @attr rei_reputation
% @type categorical
% @canonical false
% @original_name REI reputation
% @values major_outdoor_coop=Major_US_outdoor_coop_member_rewards_trusted unk_rei_reputation=Unknown
% @importance 0.90

0.88::acc(s3, rei_reputation).

0.88::true_val(rei_reputation, major_outdoor_coop); 0.12::true_val(rei_reputation, unk_rei_reputation).

measured(s3, rei_reputation, major_outdoor_coop).

all_consistent(rei_reputation) :-
    (indep(s3), consistent(s3, rei_reputation) ; \+indep(s3)).

evidence(all_consistent(rei_reputation)).
query(true_val(rei_reputation, major_outdoor_coop)).
query(true_val(rei_reputation, unk_rei_reputation)).

% @attr blue_tomato_reputation
% @type categorical
% @canonical false
% @original_name Blue Tomato reputation
% @values large_eu_retailer=Large_European_snowboard_ski_retailer unk_blue_tomato_reputation=Unknown
% @importance 0.65

0.82::acc(s22, blue_tomato_reputation).

0.78::true_val(blue_tomato_reputation, large_eu_retailer); 0.22::true_val(blue_tomato_reputation, unk_blue_tomato_reputation).

measured(s22, blue_tomato_reputation, large_eu_retailer).

all_consistent(blue_tomato_reputation) :-
    (indep(s22), consistent(s22, blue_tomato_reputation) ; \+indep(s22)).

evidence(all_consistent(blue_tomato_reputation)).
query(true_val(blue_tomato_reputation, large_eu_retailer)).
query(true_val(blue_tomato_reputation, unk_blue_tomato_reputation)).

% @attr salomon_direct_store
% @type categorical
% @canonical false
% @original_name Salomon direct (salomon.com)
% @values official_manufacturer_store=Official_manufacturer_store unk_salomon_direct_store=Unknown
% @importance 0.60

0.95::acc(s9, salomon_direct_store).

0.93::true_val(salomon_direct_store, official_manufacturer_store); 0.07::true_val(salomon_direct_store, unk_salomon_direct_store).

measured(s9, salomon_direct_store, official_manufacturer_store).

all_consistent(salomon_direct_store) :-
    consistent(s9, salomon_direct_store).

evidence(all_consistent(salomon_direct_store)).
query(true_val(salomon_direct_store, official_manufacturer_store)).
query(true_val(salomon_direct_store, unk_salomon_direct_store)).

% @attr rei_average_rating
% @type categorical
% @canonical false
% @original_name REI average rating
% @values rating_2_3_to_3_0=2_3_to_3_0_out_of_5_stars unk_rei_average_rating=Unknown
% @importance 0.875

0.78::acc(s39, rei_average_rating).
0.82::acc(s35, rei_average_rating).

0.85::true_val(rei_average_rating, rating_2_3_to_3_0); 0.15::true_val(rei_average_rating, unk_rei_average_rating).

measured(s39, rei_average_rating, rating_2_3_to_3_0).
measured(s35, rei_average_rating, rating_2_3_to_3_0).

all_consistent(rei_average_rating) :-
    consistent(s39, rei_average_rating),
    (indep(s35), consistent(s35, rei_average_rating) ; \+indep(s35)).

evidence(all_consistent(rei_average_rating)).
query(true_val(rei_average_rating, rating_2_3_to_3_0)).
query(true_val(rei_average_rating, unk_rei_average_rating)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values torsional_soft_spooky=Torsional_stiffness_very_soft_spooky_in_bumps unk_negative_aspect=Unknown
% @importance 0.85

0.80::acc(s39, negative_aspect).

0.75::true_val(negative_aspect, torsional_soft_spooky); 0.25::true_val(negative_aspect, unk_negative_aspect).

measured(s39, negative_aspect, torsional_soft_spooky).

all_consistent(negative_aspect) :-
    consistent(s39, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, torsional_soft_spooky)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_waist
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values narrow_waist_bindings_hang=Narrow_waist_width_bindings_hang_off unk_negative_aspect_waist=Unknown
% @importance 0.85

0.80::acc(s39, negative_aspect_waist).

0.75::true_val(negative_aspect_waist, narrow_waist_bindings_hang); 0.25::true_val(negative_aspect_waist, unk_negative_aspect_waist).

measured(s39, negative_aspect_waist, narrow_waist_bindings_hang).

all_consistent(negative_aspect_waist) :-
    consistent(s39, negative_aspect_waist).

evidence(all_consistent(negative_aspect_waist)).
query(true_val(negative_aspect_waist, narrow_waist_bindings_hang)).
query(true_val(negative_aspect_waist, unk_negative_aspect_waist)).

% @attr negative_aspect_chatter
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values chattering_not_corduroy=Chattering_on_anything_but_perfect_corduroy unk_negative_aspect_chatter=Unknown
% @importance 0.85

0.80::acc(s39, negative_aspect_chatter).

0.75::true_val(negative_aspect_chatter, chattering_not_corduroy); 0.25::true_val(negative_aspect_chatter, unk_negative_aspect_chatter).

measured(s39, negative_aspect_chatter, chattering_not_corduroy).

all_consistent(negative_aspect_chatter) :-
    consistent(s39, negative_aspect_chatter).

evidence(all_consistent(negative_aspect_chatter)).
query(true_val(negative_aspect_chatter, chattering_not_corduroy)).
query(true_val(negative_aspect_chatter, unk_negative_aspect_chatter)).

% @attr positive_aspect_edge
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values holds_edge_on_piste=Holds_edge_fairly_well_on_piste unk_positive_aspect_edge=Unknown
% @importance 0.85

0.80::acc(s39, positive_aspect_edge).

0.75::true_val(positive_aspect_edge, holds_edge_on_piste); 0.25::true_val(positive_aspect_edge, unk_positive_aspect_edge).

measured(s39, positive_aspect_edge, holds_edge_on_piste).

all_consistent(positive_aspect_edge) :-
    consistent(s39, positive_aspect_edge).

evidence(all_consistent(positive_aspect_edge)).
query(true_val(positive_aspect_edge, holds_edge_on_piste)).
query(true_val(positive_aspect_edge, unk_positive_aspect_edge)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values most_damp_riding=Most_damp_riding_board_from_Salomon unk_positive_aspect=Unknown
% @importance 0.80

0.80::acc(s40, positive_aspect).

0.75::true_val(positive_aspect, most_damp_riding); 0.25::true_val(positive_aspect, unk_positive_aspect).

measured(s40, positive_aspect, most_damp_riding).

all_consistent(positive_aspect) :-
    consistent(s40, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, most_damp_riding)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_carve
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values smooth_carve_groomer=Smooth_carve_on_groomer unk_positive_aspect_carve=Unknown
% @importance 0.80

0.80::acc(s40, positive_aspect_carve).

0.75::true_val(positive_aspect_carve, smooth_carve_groomer); 0.25::true_val(positive_aspect_carve, unk_positive_aspect_carve).

measured(s40, positive_aspect_carve, smooth_carve_groomer).

all_consistent(positive_aspect_carve) :-
    consistent(s40, positive_aspect_carve).

evidence(all_consistent(positive_aspect_carve)).
query(true_val(positive_aspect_carve, smooth_carve_groomer)).
query(true_val(positive_aspect_carve, unk_positive_aspect_carve)).

% @attr positive_aspect_slalom
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values sleeper_bank_slalom=Sleeper_board_for_faster_bigger_bank_slalom unk_positive_aspect_slalom=Unknown
% @importance 0.80

0.80::acc(s40, positive_aspect_slalom).

0.75::true_val(positive_aspect_slalom, sleeper_bank_slalom); 0.25::true_val(positive_aspect_slalom, unk_positive_aspect_slalom).

measured(s40, positive_aspect_slalom, sleeper_bank_slalom).

all_consistent(positive_aspect_slalom) :-
    consistent(s40, positive_aspect_slalom).

evidence(all_consistent(positive_aspect_slalom)).
query(true_val(positive_aspect_slalom, sleeper_bank_slalom)).
query(true_val(positive_aspect_slalom, unk_positive_aspect_slalom)).

% @attr negative_aspect_specs_missing
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values no_size_details_website=No_size_details_on_manufacturer_website unk_negative_aspect_specs_missing=Unknown
% @importance 0.60

0.78::acc(s41, negative_aspect_specs_missing).

0.72::true_val(negative_aspect_specs_missing, no_size_details_website); 0.28::true_val(negative_aspect_specs_missing, unk_negative_aspect_specs_missing).

measured(s41, negative_aspect_specs_missing, no_size_details_website).

all_consistent(negative_aspect_specs_missing) :-
    consistent(s41, negative_aspect_specs_missing).

evidence(all_consistent(negative_aspect_specs_missing)).
query(true_val(negative_aspect_specs_missing, no_size_details_website)).
query(true_val(negative_aspect_specs_missing, unk_negative_aspect_specs_missing)).

% @attr user_review_forum_bomb
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values bomb_no_turn=Want_to_not_turn_and_just_bomb_Fastlane unk_user_review_forum_bomb=Unknown
% @importance 0.75

0.78::acc(s6, user_review_forum_bomb).

0.72::true_val(user_review_forum_bomb, bomb_no_turn); 0.28::true_val(user_review_forum_bomb, unk_user_review_forum_bomb).

measured(s6, user_review_forum_bomb, bomb_no_turn).

all_consistent(user_review_forum_bomb) :-
    consistent(s6, user_review_forum_bomb).

evidence(all_consistent(user_review_forum_bomb)).
query(true_val(user_review_forum_bomb, bomb_no_turn)).
query(true_val(user_review_forum_bomb, unk_user_review_forum_bomb)).

% @attr user_review_forum_tail
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values tail_is_plank=Fastlanes_tail_is_a_plank_extremely_stiff unk_user_review_forum_tail=Unknown
% @importance 0.75

0.78::acc(s6, user_review_forum_tail).

0.72::true_val(user_review_forum_tail, tail_is_plank); 0.28::true_val(user_review_forum_tail, unk_user_review_forum_tail).

measured(s6, user_review_forum_tail, tail_is_plank).

all_consistent(user_review_forum_tail) :-
    consistent(s6, user_review_forum_tail).

evidence(all_consistent(user_review_forum_tail)).
query(true_val(user_review_forum_tail, tail_is_plank)).
query(true_val(user_review_forum_tail, unk_user_review_forum_tail)).

% @attr user_review_forum_specs_private
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values specs_private=Salomon_says_specs_private_not_public unk_user_review_forum_specs_private=Unknown
% @importance 0.70

0.78::acc(s42, user_review_forum_specs_private).

0.72::true_val(user_review_forum_specs_private, specs_private); 0.28::true_val(user_review_forum_specs_private, unk_user_review_forum_specs_private).

measured(s42, user_review_forum_specs_private, specs_private).

all_consistent(user_review_forum_specs_private) :-
    consistent(s42, user_review_forum_specs_private).

evidence(all_consistent(user_review_forum_specs_private)).
query(true_val(user_review_forum_specs_private, specs_private)).
query(true_val(user_review_forum_specs_private, unk_user_review_forum_specs_private)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values all_out_charger=Fastlane_is_all_out_charger unk_user_review_forum=Unknown
% @importance 0.70

0.75::acc(s43, user_review_forum).

0.72::true_val(user_review_forum, all_out_charger); 0.28::true_val(user_review_forum, unk_user_review_forum).

measured(s43, user_review_forum, all_out_charger).

all_consistent(user_review_forum) :-
    consistent(s43, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, all_out_charger)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_not_super8
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values different_from_super8=Expected_new_Super8_but_different_stiffer unk_user_review_forum_not_super8=Unknown
% @importance 0.65

0.72::acc(s44, user_review_forum_not_super8).

0.68::true_val(user_review_forum_not_super8, different_from_super8); 0.32::true_val(user_review_forum_not_super8, unk_user_review_forum_not_super8).

measured(s44, user_review_forum_not_super8, different_from_super8).

all_consistent(user_review_forum_not_super8) :-
    consistent(s44, user_review_forum_not_super8).

evidence(all_consistent(user_review_forum_not_super8)).
query(true_val(user_review_forum_not_super8, different_from_super8)).
query(true_val(user_review_forum_not_super8, unk_user_review_forum_not_super8)).

% @attr user_review_forum_super8_final
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values super8_final_year=Super_8_on_final_year_after_10_seasons unk_user_review_forum_super8_final=Unknown
% @importance 0.70

0.75::acc(s7, user_review_forum_super8_final).

0.70::true_val(user_review_forum_super8_final, super8_final_year); 0.30::true_val(user_review_forum_super8_final, unk_user_review_forum_super8_final).

measured(s7, user_review_forum_super8_final, super8_final_year).

all_consistent(user_review_forum_super8_final) :-
    consistent(s7, user_review_forum_super8_final).

evidence(all_consistent(user_review_forum_super8_final)).
query(true_val(user_review_forum_super8_final, super8_final_year)).
query(true_val(user_review_forum_super8_final, unk_user_review_forum_super8_final)).

% @attr user_review_forum_camber_genius
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values backseat_camber_genius=Backseat_camber_is_kind_of_genius unk_user_review_forum_camber_genius=Unknown
% @importance 0.60

0.72::acc(s45, user_review_forum_camber_genius).

0.68::true_val(user_review_forum_camber_genius, backseat_camber_genius); 0.32::true_val(user_review_forum_camber_genius, unk_user_review_forum_camber_genius).

measured(s45, user_review_forum_camber_genius, backseat_camber_genius).

all_consistent(user_review_forum_camber_genius) :-
    consistent(s45, user_review_forum_camber_genius).

evidence(all_consistent(user_review_forum_camber_genius)).
query(true_val(user_review_forum_camber_genius, backseat_camber_genius)).
query(true_val(user_review_forum_camber_genius, unk_user_review_forum_camber_genius)).

% @attr user_review_forum_base_great
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values base_great=50pct_recycled_sintered_base_GREAT unk_user_review_forum_base_great=Unknown
% @importance 0.55

0.72::acc(s46, user_review_forum_base_great).

0.68::true_val(user_review_forum_base_great, base_great); 0.32::true_val(user_review_forum_base_great, unk_user_review_forum_base_great).

measured(s46, user_review_forum_base_great, base_great).

all_consistent(user_review_forum_base_great) :-
    consistent(s46, user_review_forum_base_great).

evidence(all_consistent(user_review_forum_base_great)).
query(true_val(user_review_forum_base_great, base_great)).
query(true_val(user_review_forum_base_great, unk_user_review_forum_base_great)).

% @attr salomon_first_snowboard
% @type categorical
% @canonical false
% @original_name Salomon first snowboard
% @values late_1990s=Late_1990s_expanded_beyond_skiing unk_salomon_first_snowboard=Unknown
% @importance 0.30

0.88::acc(s47, salomon_first_snowboard).

0.85::true_val(salomon_first_snowboard, late_1990s); 0.15::true_val(salomon_first_snowboard, unk_salomon_first_snowboard).

measured(s47, salomon_first_snowboard, late_1990s).

all_consistent(salomon_first_snowboard) :-
    consistent(s47, salomon_first_snowboard).

evidence(all_consistent(salomon_first_snowboard)).
query(true_val(salomon_first_snowboard, late_1990s)).
query(true_val(salomon_first_snowboard, unk_salomon_first_snowboard)).

% @attr high_speed_stability
% @type categorical
% @canonical false
% @original_name High-speed stability
% @values backseat_camber_max_stability=Backseat_camber_responsive_flex_max_stability unk_high_speed_stability=Unknown
% @importance 0.70

0.83::acc(s23, high_speed_stability).

0.80::true_val(high_speed_stability, backseat_camber_max_stability); 0.20::true_val(high_speed_stability, unk_high_speed_stability).

measured(s23, high_speed_stability, backseat_camber_max_stability).

all_consistent(high_speed_stability) :-
    (indep(s23), consistent(s23, high_speed_stability) ; \+indep(s23)).

evidence(all_consistent(high_speed_stability)).
query(true_val(high_speed_stability, backseat_camber_max_stability)).
query(true_val(high_speed_stability, unk_high_speed_stability)).

% @attr powder_float
% @type categorical
% @canonical false
% @original_name Powder float
% @values setback_taper_rocker_float=Setback_tapered_directional_nose_rocker_superior_float unk_powder_float=Unknown
% @importance 0.70

0.83::acc(s23, powder_float).

0.80::true_val(powder_float, setback_taper_rocker_float); 0.20::true_val(powder_float, unk_powder_float).

measured(s23, powder_float, setback_taper_rocker_float).

all_consistent(powder_float) :-
    (indep(s23), consistent(s23, powder_float) ; \+indep(s23)).

evidence(all_consistent(powder_float)).
query(true_val(powder_float, setback_taper_rocker_float)).
query(true_val(powder_float, unk_powder_float)).

% @attr dampening
% @type categorical
% @canonical false
% @original_name Dampening
% @values bfx_ultra_enhanced=BFX_Ultra_basalt_flax_enhanced_stability_dampening unk_dampening=Unknown
% @importance 0.70

0.83::acc(s23, dampening).

0.80::true_val(dampening, bfx_ultra_enhanced); 0.20::true_val(dampening, unk_dampening).

measured(s23, dampening, bfx_ultra_enhanced).

all_consistent(dampening) :-
    (indep(s23), consistent(s23, dampening) ; \+indep(s23)).

evidence(all_consistent(dampening)).
query(true_val(dampening, bfx_ultra_enhanced)).
query(true_val(dampening, unk_dampening)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values popster_efficient_pop=Popster_core_channels_energy_for_pop unk_pop=Unknown
% @importance 0.80

0.82::acc(s18, pop).

0.80::true_val(pop, popster_efficient_pop); 0.20::true_val(pop, unk_pop).

measured(s18, pop, popster_efficient_pop).

all_consistent(pop) :-
    (indep(s18), consistent(s18, pop) ; \+indep(s18)).

evidence(all_consistent(pop)).
query(true_val(pop, popster_efficient_pop)).
query(true_val(pop, unk_pop)).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values quadratic_fluid=Quadratic_sidecut_fluid_edge_transitions unk_turn_initiation_performance=Unknown
% @importance 1.00

0.95::acc(s2, turn_initiation_performance).

0.93::true_val(turn_initiation_performance, quadratic_fluid); 0.07::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s2, turn_initiation_performance, quadratic_fluid).

all_consistent(turn_initiation_performance) :-
    consistent(s2, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, quadratic_fluid)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values fine_stone_sintered_powder=Fine_stone_finish_efficient_sintered_speeds_up_powder unk_base_glide_performance=Unknown
% @importance 0.70

0.82::acc(s16, base_glide_performance).

0.78::true_val(base_glide_performance, fine_stone_sintered_powder); 0.22::true_val(base_glide_performance, unk_base_glide_performance).

measured(s16, base_glide_performance, fine_stone_sintered_powder).

all_consistent(base_glide_performance) :-
    (indep(s16), consistent(s16, base_glide_performance) ; \+indep(s16)).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, fine_stone_sintered_powder)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values jetstream_softer_freeride=Softer_freeride_Japanese_powder_carving_649_95 unk_comparable_board_same_brand=Unknown
% @importance 0.725

0.78::acc(s6, comparable_board_same_brand).
0.85::acc(s48, comparable_board_same_brand).

0.88::true_val(comparable_board_same_brand, jetstream_softer_freeride); 0.12::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s6, comparable_board_same_brand, jetstream_softer_freeride).
measured(s48, comparable_board_same_brand, jetstream_softer_freeride).

all_consistent(comparable_board_same_brand) :-
    consistent(s6, comparable_board_same_brand),
    (indep(s48), consistent(s48, comparable_board_same_brand) ; \+indep(s48)).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, jetstream_softer_freeride)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_highpath
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values highpath=Highpath_all_mountain_freeride_Rock_Out_Camber_699_95 unk_comparable_board_same_brand_highpath=Unknown
% @importance 0.70

0.85::acc(s48, comparable_board_same_brand_highpath).

0.85::true_val(comparable_board_same_brand_highpath, highpath); 0.15::true_val(comparable_board_same_brand_highpath, unk_comparable_board_same_brand_highpath).

measured(s48, comparable_board_same_brand_highpath, highpath).

all_consistent(comparable_board_same_brand_highpath) :-
    (indep(s48), consistent(s48, comparable_board_same_brand_highpath) ; \+indep(s48)).

evidence(all_consistent(comparable_board_same_brand_highpath)).
query(true_val(comparable_board_same_brand_highpath, highpath)).
query(true_val(comparable_board_same_brand_highpath, unk_comparable_board_same_brand_highpath)).

% @attr comparable_board_same_brand_hps
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values hps_sickstick=HPS_Sickstick_freeride_powder_699_95 unk_comparable_board_same_brand_hps=Unknown
% @importance 0.70

0.85::acc(s48, comparable_board_same_brand_hps).

0.85::true_val(comparable_board_same_brand_hps, hps_sickstick); 0.15::true_val(comparable_board_same_brand_hps, unk_comparable_board_same_brand_hps).

measured(s48, comparable_board_same_brand_hps, hps_sickstick).

all_consistent(comparable_board_same_brand_hps) :-
    (indep(s48), consistent(s48, comparable_board_same_brand_hps) ; \+indep(s48)).

evidence(all_consistent(comparable_board_same_brand_hps)).
query(true_val(comparable_board_same_brand_hps, hps_sickstick)).
query(true_val(comparable_board_same_brand_hps, unk_comparable_board_same_brand_hps)).

% @attr comparable_board_same_brand_assassin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values assassin_pro=Assassin_Pro_all_mountain_freestyle_freeride_649_95 unk_comparable_board_same_brand_assassin=Unknown
% @importance 0.70

0.85::acc(s48, comparable_board_same_brand_assassin).

0.85::true_val(comparable_board_same_brand_assassin, assassin_pro); 0.15::true_val(comparable_board_same_brand_assassin, unk_comparable_board_same_brand_assassin).

measured(s48, comparable_board_same_brand_assassin, assassin_pro).

all_consistent(comparable_board_same_brand_assassin) :-
    (indep(s48), consistent(s48, comparable_board_same_brand_assassin) ; \+indep(s48)).

evidence(all_consistent(comparable_board_same_brand_assassin)).
query(true_val(comparable_board_same_brand_assassin, assassin_pro)).
query(true_val(comparable_board_same_brand_assassin, unk_comparable_board_same_brand_assassin)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_flagship=Jones_Flagship_perennial_1_freeride_directional_FSC unk_comparable_board_cross_brand=Unknown
% @importance 0.75

0.78::acc(s49, comparable_board_cross_brand).

0.75::true_val(comparable_board_cross_brand, jones_flagship); 0.25::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s49, comparable_board_cross_brand, jones_flagship).

all_consistent(comparable_board_cross_brand) :-
    consistent(s49, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_flagship)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_burton_sketch
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_sketch_artist=Burton_Family_Tree_Sketch_Artist_new_2025_26 unk_comparable_board_cross_brand_burton_sketch=Unknown
% @importance 0.65

0.75::acc(s50, comparable_board_cross_brand_burton_sketch).

0.72::true_val(comparable_board_cross_brand_burton_sketch, burton_sketch_artist); 0.28::true_val(comparable_board_cross_brand_burton_sketch, unk_comparable_board_cross_brand_burton_sketch).

measured(s50, comparable_board_cross_brand_burton_sketch, burton_sketch_artist).

all_consistent(comparable_board_cross_brand_burton_sketch) :-
    consistent(s50, comparable_board_cross_brand_burton_sketch).

evidence(all_consistent(comparable_board_cross_brand_burton_sketch)).
query(true_val(comparable_board_cross_brand_burton_sketch, burton_sketch_artist)).
query(true_val(comparable_board_cross_brand_burton_sketch, unk_comparable_board_cross_brand_burton_sketch)).

% @attr comparable_board_cross_brand_jones_howler
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_howler=Jones_Howler_new_2025_26_damp_powder_speed unk_comparable_board_cross_brand_jones_howler=Unknown
% @importance 0.65

0.75::acc(s50, comparable_board_cross_brand_jones_howler).

0.72::true_val(comparable_board_cross_brand_jones_howler, jones_howler); 0.28::true_val(comparable_board_cross_brand_jones_howler, unk_comparable_board_cross_brand_jones_howler).

measured(s50, comparable_board_cross_brand_jones_howler, jones_howler).

all_consistent(comparable_board_cross_brand_jones_howler) :-
    consistent(s50, comparable_board_cross_brand_jones_howler).

evidence(all_consistent(comparable_board_cross_brand_jones_howler)).
query(true_val(comparable_board_cross_brand_jones_howler, jones_howler)).
query(true_val(comparable_board_cross_brand_jones_howler, unk_comparable_board_cross_brand_jones_howler)).

% @attr comparable_board_cross_brand_other
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values notable_freeride_jumps=Notable_freeride_board_good_for_jumps unk_comparable_board_cross_brand_other=Unknown
% @importance 0.65

0.75::acc(s50, comparable_board_cross_brand_other).

0.72::true_val(comparable_board_cross_brand_other, notable_freeride_jumps); 0.28::true_val(comparable_board_cross_brand_other, unk_comparable_board_cross_brand_other).

measured(s50, comparable_board_cross_brand_other, notable_freeride_jumps).

all_consistent(comparable_board_cross_brand_other) :-
    consistent(s50, comparable_board_cross_brand_other).

evidence(all_consistent(comparable_board_cross_brand_other)).
query(true_val(comparable_board_cross_brand_other, notable_freeride_jumps)).
query(true_val(comparable_board_cross_brand_other, unk_comparable_board_cross_brand_other)).

% @attr competitive_segment_positioning
% @type categorical
% @canonical false
% @original_name Competitive segment positioning
% @values highest_priced_749_95=Salomon_highest_priced_snowboard_749_95 unk_competitive_segment_positioning=Unknown
% @importance 0.70

0.85::acc(s48, competitive_segment_positioning).

0.85::true_val(competitive_segment_positioning, highest_priced_749_95); 0.15::true_val(competitive_segment_positioning, unk_competitive_segment_positioning).

measured(s48, competitive_segment_positioning, highest_priced_749_95).

all_consistent(competitive_segment_positioning) :-
    (indep(s48), consistent(s48, competitive_segment_positioning) ; \+indep(s48)).

evidence(all_consistent(competitive_segment_positioning)).
query(true_val(competitive_segment_positioning, highest_priced_749_95)).
query(true_val(competitive_segment_positioning, unk_competitive_segment_positioning)).

% @attr founder
% @type categorical
% @canonical false
% @original_name Founder
% @values francois_salomon=Francois_Salomon unk_founder=Unknown
% @importance 0.50

0.90::acc(s10, founder).

0.90::true_val(founder, francois_salomon); 0.10::true_val(founder, unk_founder).

measured(s10, founder, francois_salomon).

all_consistent(founder) :-
    consistent(s10, founder).

evidence(all_consistent(founder)).
query(true_val(founder, francois_salomon)).
query(true_val(founder, unk_founder)).

% @attr acquisition_by_adidas
% @type categorical
% @canonical false
% @original_name Acquisition by Adidas
% @values y1997=1997 unk_acquisition_by_adidas=Unknown
% @importance 0.50

0.88::acc(s10, acquisition_by_adidas).

0.87::true_val(acquisition_by_adidas, y1997); 0.13::true_val(acquisition_by_adidas, unk_acquisition_by_adidas).

measured(s10, acquisition_by_adidas, y1997).

all_consistent(acquisition_by_adidas) :-
    consistent(s10, acquisition_by_adidas).

evidence(all_consistent(acquisition_by_adidas)).
query(true_val(acquisition_by_adidas, y1997)).
query(true_val(acquisition_by_adidas, unk_acquisition_by_adidas)).

% @attr acquisition_by_amer_sports
% @type categorical
% @canonical false
% @original_name Acquisition by Amer Sports
% @values y2005_485m_eur=2005_for_485_million_EUR unk_acquisition_by_amer_sports=Unknown
% @importance 0.35

0.88::acc(s12, acquisition_by_amer_sports).

0.87::true_val(acquisition_by_amer_sports, y2005_485m_eur); 0.13::true_val(acquisition_by_amer_sports, unk_acquisition_by_amer_sports).

measured(s12, acquisition_by_amer_sports, y2005_485m_eur).

all_consistent(acquisition_by_amer_sports) :-
    consistent(s12, acquisition_by_amer_sports).

evidence(all_consistent(acquisition_by_amer_sports)).
query(true_val(acquisition_by_amer_sports, y2005_485m_eur)).
query(true_val(acquisition_by_amer_sports, unk_acquisition_by_amer_sports)).

% @attr salomon_us_operations
% @type categorical
% @canonical false
% @original_name Salomon US operations
% @values ogden_utah=Ogden_Utah unk_salomon_us_operations=Unknown
% @importance 0.50

0.88::acc(s10, salomon_us_operations).

0.87::true_val(salomon_us_operations, ogden_utah); 0.13::true_val(salomon_us_operations, unk_salomon_us_operations).

measured(s10, salomon_us_operations, ogden_utah).

all_consistent(salomon_us_operations) :-
    consistent(s10, salomon_us_operations).

evidence(all_consistent(salomon_us_operations)).
query(true_val(salomon_us_operations, ogden_utah)).
query(true_val(salomon_us_operations, unk_salomon_us_operations)).

% @attr amer_sports_ipo
% @type categorical
% @canonical false
% @original_name Amer Sports IPO
% @values feb_2024_nyse_1_4b=February_2024_NYSE_raised_1_4_billion unk_amer_sports_ipo=Unknown
% @importance 0.35

0.88::acc(s12, amer_sports_ipo).

0.87::true_val(amer_sports_ipo, feb_2024_nyse_1_4b); 0.13::true_val(amer_sports_ipo, unk_amer_sports_ipo).

measured(s12, amer_sports_ipo, feb_2024_nyse_1_4b).

all_consistent(amer_sports_ipo) :-
    consistent(s12, amer_sports_ipo).

evidence(all_consistent(amer_sports_ipo)).
query(true_val(amer_sports_ipo, feb_2024_nyse_1_4b)).
query(true_val(amer_sports_ipo, unk_amer_sports_ipo)).

% @attr amer_sports_major_owner
% @type categorical
% @canonical false
% @original_name Amer Sports major owner
% @values anta_sports=Anta_Sports_China_largest_sportswear unk_amer_sports_major_owner=Unknown
% @importance 0.35

0.88::acc(s12, amer_sports_major_owner).

0.87::true_val(amer_sports_major_owner, anta_sports); 0.13::true_val(amer_sports_major_owner, unk_amer_sports_major_owner).

measured(s12, amer_sports_major_owner, anta_sports).

all_consistent(amer_sports_major_owner) :-
    consistent(s12, amer_sports_major_owner).

evidence(all_consistent(amer_sports_major_owner)).
query(true_val(amer_sports_major_owner, anta_sports)).
query(true_val(amer_sports_major_owner, unk_amer_sports_major_owner)).