0.15::indep(s13).
0.15::indep(s16).
0.15::indep(s17).
0.15::indep(s18).
0.15::indep(s19).
0.15::indep(s23).
0.12::indep(s29).
0.12::indep(s30).
0.15::indep(s31).
0.10::indep(s32).
0.15::indep(s33).
0.12::indep(s34).
0.12::indep(s35).
0.12::indep(s36).
0.15::indep(s37).
0.12::indep(s26).
0.12::indep(s27).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 1.0

0.93::acc(s1, brand).

0.95::true_val(brand, salomon); 0.05::true_val(brand, unk_brand).

measured(s1, brand, salomon).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values dancehaul=Dancehaul unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).

0.96::true_val(model_name, dancehaul); 0.04::true_val(model_name, unk_model_name).

measured(s1, model_name, dancehaul).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, dancehaul)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2027=2027 unk_model_year=Unknown
% @importance 1.0

0.95::acc(s1, model_year).

0.96::true_val(model_year, v2027); 0.04::true_val(model_year, unk_model_year).

measured(s1, model_year, v2027).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.96::true_val(product_type, snowboard); 0.04::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name Manufacturer
% @values salomon_sas_annecy=Salomon_SAS_Annecy_France_founded_1947 unk_manufacturer=Unknown
% @importance 0.6

0.88::acc(s2, manufacturer).

0.81::true_val(manufacturer, salomon_sas_annecy); 0.19::true_val(manufacturer, unk_manufacturer).

measured(s2, manufacturer, salomon_sas_annecy).

all_consistent(manufacturer) :- consistent(s2, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas_annecy)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports=Amer_Sports unk_parent_company=Unknown
% @importance 0.6

0.88::acc(s2, parent_company).

0.81::true_val(parent_company, amer_sports); 0.19::true_val(parent_company, unk_parent_company).

measured(s2, parent_company, amer_sports).

all_consistent(parent_company) :- consistent(s2, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports)).
query(true_val(parent_company, unk_parent_company)).

% @attr design_development_location
% @type categorical
% @canonical false
% @original_name Design and development location
% @values annecy_france_portland_oregon=Annecy_France_design_Portland_Oregon_marketing unk_design_development_location=Unknown
% @importance 0.4

0.82::acc(s3, design_development_location).

0.72::true_val(design_development_location, annecy_france_portland_oregon); 0.28::true_val(design_development_location, unk_design_development_location).

measured(s3, design_development_location, annecy_france_portland_oregon).

all_consistent(design_development_location) :- consistent(s3, design_development_location).

evidence(all_consistent(design_development_location)).
query(true_val(design_development_location, annecy_france_portland_oregon)).
query(true_val(design_development_location, unk_design_development_location)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name Manufacturing location
% @values china=China global_multi=France_Bulgaria_Asia_depending_on_model
% @importance 0.375

0.72::acc(s4, manufacturing_location_current).
0.65::acc(s5, manufacturing_location_current).

0.55::true_val(manufacturing_location_current, china); 0.45::true_val(manufacturing_location_current, global_multi).

measured(s4, manufacturing_location_current, china).
measured(s5, manufacturing_location_current, global_multi).

all_consistent(manufacturing_location_current) :-
    consistent(s4, manufacturing_location_current),
    consistent(s5, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, china)).
query(true_val(manufacturing_location_current, global_multi)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name First available year
% @values season_2020_21=2020_21_season unk_model_first_available_year=Unknown
% @importance 0.75

0.90::acc(s6, model_first_available_year).

0.92::true_val(model_first_available_year, season_2020_21); 0.08::true_val(model_first_available_year, unk_model_first_available_year).

measured(s6, model_first_available_year, season_2020_21).

all_consistent(model_first_available_year) :- consistent(s6, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2020_21)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr design_origin
% @type categorical
% @canonical false
% @original_name Board design origin
% @values max_buri_pro=Based_on_Max_Buri_Pro_model unk_design_origin=Unknown
% @importance 0.7

0.78::acc(s7, design_origin).

0.64::true_val(design_origin, max_buri_pro); 0.36::true_val(design_origin, unk_design_origin).

measured(s7, design_origin, max_buri_pro).

all_consistent(design_origin) :- consistent(s7, design_origin).

evidence(all_consistent(design_origin)).
query(true_val(design_origin, max_buri_pro)).
query(true_val(design_origin, unk_design_origin)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 1.0

0.93::acc(s1, board_category).

0.95::true_val(board_category, all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain).

all_consistent(board_category) :- consistent(s1, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr board_description
% @type categorical
% @canonical false
% @original_name Board soul description
% @values mountain_freestyle_alt_freeride=Mountain_freestyle_soul_in_short_wide_alt_freeride_package unk_board_description=Unknown
% @importance 0.7

0.80::acc(s7, board_description).

0.64::true_val(board_description, mountain_freestyle_alt_freeride); 0.36::true_val(board_description, unk_board_description).

measured(s7, board_description, mountain_freestyle_alt_freeride).

all_consistent(board_description) :- consistent(s7, board_description).

evidence(all_consistent(board_description)).
query(true_val(board_description, mountain_freestyle_alt_freeride)).
query(true_val(board_description, unk_board_description)).

% @attr review_style_classification
% @type categorical
% @canonical false
% @original_name Review style classification
% @values mellow_freeride=Mellow_Freeride unk_review_style_classification=Unknown
% @importance 0.9

0.85::acc(s9, review_style_classification).

0.74::true_val(review_style_classification, mellow_freeride); 0.26::true_val(review_style_classification, unk_review_style_classification).

measured(s9, review_style_classification, mellow_freeride).

all_consistent(review_style_classification) :- consistent(s9, review_style_classification).

evidence(all_consistent(review_style_classification)).
query(true_val(review_style_classification, mellow_freeride)).
query(true_val(review_style_classification, unk_review_style_classification)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.875

0.95::acc(s1, gender).
0.85::acc(s6, gender).
0.82::acc(s29, gender).

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s1, gender, unisex).
measured(s6, gender, unisex).
measured(s29, gender, unisex).

all_consistent(gender) :-
    consistent(s1, gender),
    consistent(s6, gender),
    (indep(s29), consistent(s29, gender) ; \+indep(s29)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr youth_variant
% @type categorical
% @canonical false
% @original_name Youth variant
% @values dancehaul_grom=Dancehaul_Grom unk_youth_variant=Unknown
% @importance 0.35

0.78::acc(s11, youth_variant).

0.67::true_val(youth_variant, dancehaul_grom); 0.33::true_val(youth_variant, unk_youth_variant).

measured(s11, youth_variant, dancehaul_grom).

all_consistent(youth_variant) :- consistent(s11, youth_variant).

evidence(all_consistent(youth_variant)).
query(true_val(youth_variant, dancehaul_grom)).
query(true_val(youth_variant, unk_youth_variant)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values dancehaul_pro=Dancehaul_Pro unk_comparable_board_same_brand=Unknown
% @importance 0.75

0.90::acc(s12, comparable_board_same_brand).

0.87::true_val(comparable_board_same_brand, dancehaul_pro); 0.13::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s12, comparable_board_same_brand, dancehaul_pro).

all_consistent(comparable_board_same_brand) :- consistent(s12, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, dancehaul_pro)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 1.0

0.94::acc(s1, shape).
0.82::acc(s13, shape).

0.96::true_val(shape, tapered_directional); 0.04::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).
measured(s13, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s13), consistent(s13, shape) ; \+indep(s13)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr shape_tech_description
% @type categorical
% @canonical false
% @original_name Shape tech description
% @values taper_loosens_turning_improves_float=Tail_tapered_2_20mm_loosens_turning_improves_floatation unk_shape_tech_description=Unknown
% @importance 0.8

0.82::acc(s13, shape_tech_description).

0.78::true_val(shape_tech_description, taper_loosens_turning_improves_float); 0.22::true_val(shape_tech_description, unk_shape_tech_description).

measured(s13, shape_tech_description, taper_loosens_turning_improves_float).

all_consistent(shape_tech_description) :-
    (indep(s13), consistent(s13, shape_tech_description) ; \+indep(s13)).

evidence(all_consistent(shape_tech_description)).
query(true_val(shape_tech_description, taper_loosens_turning_improves_float)).
query(true_val(shape_tech_description, unk_shape_tech_description)).

% @attr taper_amount
% @type numeric
% @unit mm
% @canonical false
% @original_name Taper amount
% @values v12=12.0 unk_taper_amount=Unknown
% @importance 0.825

0.88::acc(s8, taper_amount).
0.80::acc(s14, taper_amount).

0.95::true_val(taper_amount, v12); 0.05::true_val(taper_amount, unk_taper_amount).

measured(s8, taper_amount, v12).
measured(s14, taper_amount, v12).

all_consistent(taper_amount) :-
    consistent(s8, taper_amount),
    consistent(s14, taper_amount).

evidence(all_consistent(taper_amount)).
query(true_val(taper_amount, v12)).
query(true_val(taper_amount, unk_taper_amount)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rock_out_camber=Rock_Out_Camber_flat_between_camber_near_feet_rocker_tip_tail unk_camber_type=Unknown
% @importance 1.0

0.94::acc(s1, camber_type).

0.95::true_val(camber_type, rock_out_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, rock_out_camber).

all_consistent(camber_type) :- consistent(s1, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, rock_out_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_on_snow_feel
% @type categorical
% @canonical false
% @original_name Camber on snow feel
% @values stable_forgiving_hybrid=Stable_and_forgiving_feels_like_hybrid_camber unk_camber_on_snow_feel=Unknown
% @importance 0.85

0.88::acc(s8, camber_on_snow_feel).

0.77::true_val(camber_on_snow_feel, stable_forgiving_hybrid); 0.23::true_val(camber_on_snow_feel, unk_camber_on_snow_feel).

measured(s8, camber_on_snow_feel, stable_forgiving_hybrid).

all_consistent(camber_on_snow_feel) :- consistent(s8, camber_on_snow_feel).

evidence(all_consistent(camber_on_snow_feel)).
query(true_val(camber_on_snow_feel, stable_forgiving_hybrid)).
query(true_val(camber_on_snow_feel, unk_camber_on_snow_feel)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radial=Radial_Sidecut unk_sidecut_type=Unknown
% @importance 1.0

0.94::acc(s1, sidecut_type).

0.95::true_val(sidecut_type, radial); 0.05::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, radial).

all_consistent(sidecut_type) :- consistent(s1, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_radius_152
% @type numeric
% @unit m
% @canonical false
% @original_name Sidecut radius 152cm
% @values v7_0=7.0 unk_sidecut_radius_152=Unknown
% @importance 0.8

0.82::acc(s14, sidecut_radius_152).
0.93::acc(s1, sidecut_radius_152).

0.95::true_val(sidecut_radius_152, v7_0); 0.05::true_val(sidecut_radius_152, unk_sidecut_radius_152).

measured(s14, sidecut_radius_152, v7_0).
measured(s1, sidecut_radius_152, v7_0).

all_consistent(sidecut_radius_152) :-
    consistent(s1, sidecut_radius_152),
    consistent(s14, sidecut_radius_152).

evidence(all_consistent(sidecut_radius_152)).
query(true_val(sidecut_radius_152, v7_0)).
query(true_val(sidecut_radius_152, unk_sidecut_radius_152)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values wide=Wide unk_width_options=Unknown
% @importance 1.0

0.94::acc(s1, width_options).

0.95::true_val(width_options, wide); 0.05::true_val(width_options, unk_width_options).

measured(s1, width_options, wide).

all_consistent(width_options) :- consistent(s1, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, wide)).
query(true_val(width_options, unk_width_options)).

% @attr wide_width_definition
% @type categorical
% @canonical false
% @original_name Wide width definition
% @values v260mm_plus=260mm_or_wider_waist unk_wide_width_definition=Unknown
% @importance 0.7

0.78::acc(s15, wide_width_definition).

0.64::true_val(wide_width_definition, v260mm_plus); 0.36::true_val(wide_width_definition, unk_wide_width_definition).

measured(s15, wide_width_definition, v260mm_plus).

all_consistent(wide_width_definition) :- consistent(s15, wide_width_definition).

evidence(all_consistent(wide_width_definition)).
query(true_val(wide_width_definition, v260mm_plus)).
query(true_val(wide_width_definition, unk_wide_width_definition)).

% @attr board_concept
% @type categorical
% @canonical false
% @original_name Board concept
% @values volume_shifted=Volume_shifted_design unk_board_concept=Unknown
% @importance 1.0

0.93::acc(s1, board_concept).

0.95::true_val(board_concept, volume_shifted); 0.05::true_val(board_concept, unk_board_concept).

measured(s1, board_concept, volume_shifted).

all_consistent(board_concept) :- consistent(s1, board_concept).

evidence(all_consistent(board_concept)).
query(true_val(board_concept, volume_shifted)).
query(true_val(board_concept, unk_board_concept)).

% @attr volume_shift_sizing
% @type categorical
% @canonical false
% @original_name Volume shift sizing benefit
% @values size_down_5cm=Size_down_approx_5cm_without_sacrificing_performance unk_volume_shift_sizing=Unknown
% @importance 0.825

0.85::acc(s16, volume_shift_sizing).
0.93::acc(s1, volume_shift_sizing).

0.95::true_val(volume_shift_sizing, size_down_5cm); 0.05::true_val(volume_shift_sizing, unk_volume_shift_sizing).

measured(s16, volume_shift_sizing, size_down_5cm).
measured(s1, volume_shift_sizing, size_down_5cm).

all_consistent(volume_shift_sizing) :-
    consistent(s1, volume_shift_sizing),
    (indep(s16), consistent(s16, volume_shift_sizing) ; \+indep(s16)).

evidence(all_consistent(volume_shift_sizing)).
query(true_val(volume_shift_sizing, size_down_5cm)).
query(true_val(volume_shift_sizing, unk_volume_shift_sizing)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name Flex rating
% @values v5=5.0 v6=6.0
% @importance 0.875

0.90::acc(s1, flex_rating_10).
0.88::acc(s9, flex_rating_10).
0.78::acc(s17, flex_rating_10).
0.72::acc(s18, flex_rating_10).

0.40::true_val(flex_rating_10, v5); 0.60::true_val(flex_rating_10, v6).

measured(s1, flex_rating_10, v5).
measured(s9, flex_rating_10, v6).
measured(s17, flex_rating_10, v6).
measured(s18, flex_rating_10, v6).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    consistent(s9, flex_rating_10),
    (indep(s17), consistent(s17, flex_rating_10) ; \+indep(s17)),
    (indep(s18), consistent(s18, flex_rating_10) ; \+indep(s18)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, v6)).

% @attr flex_description
% @type categorical
% @canonical false
% @original_name Flex description
% @values mid_flex_versatile=Mid_flex_support_for_fast_and_enough_flex_for_butter unk_flex_description=Unknown
% @importance 0.7

0.80::acc(s7, flex_description).

0.64::true_val(flex_description, mid_flex_versatile); 0.36::true_val(flex_description, unk_flex_description).

measured(s7, flex_description, mid_flex_versatile).

all_consistent(flex_description) :- consistent(s7, flex_description).

evidence(all_consistent(flex_description)).
query(true_val(flex_description, mid_flex_versatile)).
query(true_val(flex_description, unk_flex_description)).

% @attr flex_pattern
% @type categorical
% @canonical false
% @original_name Flex pattern
% @values directional_flex=Directional_flex_stiffer_tail_than_nose unk_flex_pattern=Unknown
% @importance 0.85

0.88::acc(s8, flex_pattern).

0.77::true_val(flex_pattern, directional_flex); 0.23::true_val(flex_pattern, unk_flex_pattern).

measured(s8, flex_pattern, directional_flex).

all_consistent(flex_pattern) :- consistent(s8, flex_pattern).

evidence(all_consistent(flex_pattern)).
query(true_val(flex_pattern, directional_flex)).
query(true_val(flex_pattern, unk_flex_pattern)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate=Intermediate unk_rider_level=Unknown
% @importance 1.0

0.93::acc(s1, rider_level).

0.95::true_val(rider_level, intermediate); 0.05::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, intermediate).

all_consistent(rider_level) :- consistent(s1, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name Skill level recommendation
% @values intermediate_plus=Intermediate_and_above_not_beginner unk_skill_level_recommendation=Unknown
% @importance 0.8

0.85::acc(s8, skill_level_recommendation).
0.80::acc(s9, skill_level_recommendation).
0.72::acc(s36, skill_level_recommendation).

0.95::true_val(skill_level_recommendation, intermediate_plus); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s8, skill_level_recommendation, intermediate_plus).
measured(s9, skill_level_recommendation, intermediate_plus).
measured(s36, skill_level_recommendation, intermediate_plus).

all_consistent(skill_level_recommendation) :-
    consistent(s8, skill_level_recommendation),
    consistent(s9, skill_level_recommendation),
    (indep(s36), consistent(s36, skill_level_recommendation) ; \+indep(s36)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_plus)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_slct=Aspen_SLCT_Core_hand_selected_FSC_certified unk_core_material=Unknown
% @importance 0.9

0.94::acc(s1, core_material).
0.82::acc(s13, core_material).
0.82::acc(s19, core_material).

0.96::true_val(core_material, aspen_slct); 0.04::true_val(core_material, unk_core_material).

measured(s1, core_material, aspen_slct).
measured(s13, core_material, aspen_slct).
measured(s19, core_material, aspen_slct).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s13), consistent(s13, core_material) ; \+indep(s13)),
    (indep(s19), consistent(s19, core_material) ; \+indep(s19)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_slct)).
query(true_val(core_material, unk_core_material)).

% @attr core_technology
% @type categorical
% @canonical false
% @original_name Core technology
% @values popster=Popster_mills_core_inside_inserts_skateboard_pop_feel unk_core_technology=Unknown
% @importance 0.825

0.93::acc(s1, core_technology).
0.85::acc(s20, core_technology).

0.95::true_val(core_technology, popster); 0.05::true_val(core_technology, unk_core_technology).

measured(s1, core_technology, popster).
measured(s20, core_technology, popster).

all_consistent(core_technology) :-
    consistent(s1, core_technology),
    consistent(s20, core_technology).

evidence(all_consistent(core_technology)).
query(true_val(core_technology, popster)).
query(true_val(core_technology, unk_core_technology)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values ba_md_fiberglass=BA_MD_Biaxial_Medium_Density_Fiberglass unk_laminate=Unknown
% @importance 0.75

0.93::acc(s1, laminate).
0.78::acc(s21, laminate).

0.95::true_val(laminate, ba_md_fiberglass); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, ba_md_fiberglass).
measured(s21, laminate, ba_md_fiberglass).

all_consistent(laminate) :-
    consistent(s1, laminate),
    consistent(s21, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, ba_md_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values ghost_basalt_stringers=Ghost_Basalt_Stringers_in_TriAx_fiberglass_tip_to_tail unk_construction_material_innovation=Unknown
% @importance 0.783

0.93::acc(s1, construction_material_innovation).
0.85::acc(s20, construction_material_innovation).
0.80::acc(s14, construction_material_innovation).

0.96::true_val(construction_material_innovation, ghost_basalt_stringers); 0.04::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, ghost_basalt_stringers).
measured(s20, construction_material_innovation, ghost_basalt_stringers).
measured(s14, construction_material_innovation, ghost_basalt_stringers).

all_consistent(construction_material_innovation) :-
    consistent(s1, construction_material_innovation),
    consistent(s20, construction_material_innovation),
    consistent(s14, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, ghost_basalt_stringers)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values pct30_bio=30_percent_bio_based_resin pct28_bio=28_percent_bio_based_Greenpoxy_28
% @importance 0.85

0.90::acc(s1, resin).
0.82::acc(s10, resin).

0.60::true_val(resin, pct30_bio); 0.40::true_val(resin, pct28_bio).

measured(s1, resin, pct30_bio).
measured(s10, resin, pct28_bio).

all_consistent(resin) :-
    consistent(s1, resin),
    consistent(s10, resin).

evidence(all_consistent(resin)).
query(true_val(resin, pct30_bio)).
query(true_val(resin, pct28_bio)).

% @attr resin_environmental_benefit
% @type categorical
% @canonical false
% @original_name Resin environmental benefit
% @values better_environment_no_quality_drop=Better_for_environment_no_quality_drop unk_resin_environmental_benefit=Unknown
% @importance 0.7

0.82::acc(s10, resin_environmental_benefit).

0.75::true_val(resin_environmental_benefit, better_environment_no_quality_drop); 0.25::true_val(resin_environmental_benefit, unk_resin_environmental_benefit).

measured(s10, resin_environmental_benefit, better_environment_no_quality_drop).

all_consistent(resin_environmental_benefit) :- consistent(s10, resin_environmental_benefit).

evidence(all_consistent(resin_environmental_benefit)).
query(true_val(resin_environmental_benefit, better_environment_no_quality_drop)).
query(true_val(resin_environmental_benefit, unk_resin_environmental_benefit)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_sidewall=ABS_Sidewall unk_sidewall_material=Unknown
% @importance 1.0

0.93::acc(s1, sidewall_material).

0.95::true_val(sidewall_material, abs_sidewall); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s1, sidewall_material, abs_sidewall).

all_consistent(sidewall_material) :- consistent(s1, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_sidewall)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_ride_feel
% @type categorical
% @canonical false
% @original_name Sidewall ride feel
% @values no_carbon_smooth_less_fatiguing=No_carbon_fiber_smoother_less_fatiguing_all_day_ride unk_sidewall_ride_feel=Unknown
% @importance 0.8

0.88::acc(s22, sidewall_ride_feel).

0.77::true_val(sidewall_ride_feel, no_carbon_smooth_less_fatiguing); 0.23::true_val(sidewall_ride_feel, unk_sidewall_ride_feel).

measured(s22, sidewall_ride_feel, no_carbon_smooth_less_fatiguing).

all_consistent(sidewall_ride_feel) :- consistent(s22, sidewall_ride_feel).

evidence(all_consistent(sidewall_ride_feel)).
query(true_val(sidewall_ride_feel, no_carbon_smooth_less_fatiguing)).
query(true_val(sidewall_ride_feel, unk_sidewall_ride_feel)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered_Base unk_base_type=Unknown
% @importance 1.0

0.94::acc(s1, base_type).

0.95::true_val(base_type, sintered); 0.05::true_val(base_type, unk_base_type).

measured(s1, base_type, sintered).

all_consistent(base_type) :- consistent(s1, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

% @attr base_finish
% @type categorical
% @canonical false
% @original_name Base finish
% @values fine_stone_finish=Fine_Stone_Finish_efficient_in_sintered_EG_base unk_base_finish=Unknown
% @importance 0.775

0.93::acc(s1, base_finish).
0.82::acc(s23, base_finish).

0.95::true_val(base_finish, fine_stone_finish); 0.05::true_val(base_finish, unk_base_finish).

measured(s1, base_finish, fine_stone_finish).
measured(s23, base_finish, fine_stone_finish).

all_consistent(base_finish) :-
    consistent(s1, base_finish),
    (indep(s23), consistent(s23, base_finish) ; \+indep(s23)).

evidence(all_consistent(base_finish)).
query(true_val(base_finish, fine_stone_finish)).
query(true_val(base_finish, unk_base_finish)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values natural_wax=Natural_Wax unk_factory_wax=Unknown
% @importance 1.0

0.93::acc(s1, factory_wax).

0.95::true_val(factory_wax, natural_wax); 0.05::true_val(factory_wax, unk_factory_wax).

measured(s1, factory_wax, natural_wax).

all_consistent(factory_wax) :- consistent(s1, factory_wax).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, natural_wax)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values uniform_1_5_deg=1_5_degree_base_and_side_bevel variable_bevel=Variable_1deg_tip_tail_2deg_between_feet
% @importance 0.775

0.88::acc(s1, edge_bevel_spec).
0.78::acc(s23, edge_bevel_spec).

0.55::true_val(edge_bevel_spec, uniform_1_5_deg); 0.45::true_val(edge_bevel_spec, variable_bevel).

measured(s1, edge_bevel_spec, uniform_1_5_deg).
measured(s23, edge_bevel_spec, variable_bevel).

all_consistent(edge_bevel_spec) :-
    consistent(s1, edge_bevel_spec),
    (indep(s23), consistent(s23, edge_bevel_spec) ; \+indep(s23)).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, uniform_1_5_deg)).
query(true_val(edge_bevel_spec, variable_bevel)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.94::acc(s1, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr mounting_insert_detail
% @type categorical
% @canonical false
% @original_name Mounting insert detail
% @values v7x2_front_extra=2025_added_7x2_inserts_extra_front_foot_setback unk_mounting_insert_detail=Unknown
% @importance 0.85

0.88::acc(s8, mounting_insert_detail).

0.77::true_val(mounting_insert_detail, v7x2_front_extra); 0.23::true_val(mounting_insert_detail, unk_mounting_insert_detail).

measured(s8, mounting_insert_detail, v7x2_front_extra).

all_consistent(mounting_insert_detail) :- consistent(s8, mounting_insert_detail).

evidence(all_consistent(mounting_insert_detail)).
query(true_val(mounting_insert_detail, v7x2_front_extra)).
query(true_val(mounting_insert_detail, unk_mounting_insert_detail)).

% @attr available_colors
% @type categorical
% @canonical false
% @original_name available_colors
% @values random_base=Random_base_graphics unk_available_colors=Unknown
% @importance 0.825

0.92::acc(s1, available_colors).
0.88::acc(s24, available_colors).

0.95::true_val(available_colors, random_base); 0.05::true_val(available_colors, unk_available_colors).

measured(s1, available_colors, random_base).
measured(s24, available_colors, random_base).

all_consistent(available_colors) :- consistent(s1, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, random_base)).
query(true_val(available_colors, unk_available_colors)).

% @attr warranty
% @type categorical
% @canonical false
% @original_name Warranty
% @values two_year_limited=2_year_limited_warranty_material_manufacturing_defects unk_warranty=Unknown
% @importance 0.7

0.80::acc(s17, warranty).

0.66::true_val(warranty, two_year_limited); 0.34::true_val(warranty, unk_warranty).

measured(s17, warranty, two_year_limited).

all_consistent(warranty) :-
    (indep(s17), consistent(s17, warranty) ; \+indep(s17)).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_year_limited)).
query(true_val(warranty, unk_warranty)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values v143_147_152_154_157=143cm_147cm_152cm_154cm_157cm unk_available_sizes=Unknown
% @importance 0.725

0.94::acc(s1, available_sizes).

0.95::true_val(available_sizes, v143_147_152_154_157); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, v143_147_152_154_157).

all_consistent(available_sizes) :- consistent(s1, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, v143_147_152_154_157)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr size_specs_143
% @type categorical
% @canonical false
% @original_name Size 143cm specs
% @values ee107_5_nw29_4_tw24_7_w24_7_sc6_6_st52_wt50_70=EE107_5cm_NW29_4_TW24_7_W24_7_SC6_6m_ST52cm_WT50_70kg unk_size_specs_143=Unknown
% @importance 1.0

0.93::acc(s1, size_specs_143).

0.95::true_val(size_specs_143, ee107_5_nw29_4_tw24_7_w24_7_sc6_6_st52_wt50_70); 0.05::true_val(size_specs_143, unk_size_specs_143).

measured(s1, size_specs_143, ee107_5_nw29_4_tw24_7_w24_7_sc6_6_st52_wt50_70).

all_consistent(size_specs_143) :- consistent(s1, size_specs_143).

evidence(all_consistent(size_specs_143)).
query(true_val(size_specs_143, ee107_5_nw29_4_tw24_7_w24_7_sc6_6_st52_wt50_70)).
query(true_val(size_specs_143, unk_size_specs_143)).

% @attr size_specs_147
% @type categorical
% @canonical false
% @original_name Size 147cm specs
% @values ee110_nw30_2_tw29_w25_5_sc6_8_st53_5_wt60_85=EE110cm_NW30_2_TW29_W25_5_SC6_8m_ST53_5cm_WT60_85kg unk_size_specs_147=Unknown
% @importance 1.0

0.93::acc(s1, size_specs_147).

0.95::true_val(size_specs_147, ee110_nw30_2_tw29_w25_5_sc6_8_st53_5_wt60_85); 0.05::true_val(size_specs_147, unk_size_specs_147).

measured(s1, size_specs_147, ee110_nw30_2_tw29_w25_5_sc6_8_st53_5_wt60_85).

all_consistent(size_specs_147) :- consistent(s1, size_specs_147).

evidence(all_consistent(size_specs_147)).
query(true_val(size_specs_147, ee110_nw30_2_tw29_w25_5_sc6_8_st53_5_wt60_85)).
query(true_val(size_specs_147, unk_size_specs_147)).

% @attr size_specs_152
% @type categorical
% @canonical false
% @original_name Size 152cm specs
% @values ee113_5_nw31_2_tw30_w26_4_sc7_st55_wt70_90=EE113_5cm_NW31_2_TW30_W26_4_SC7m_ST55cm_WT70_90kg unk_size_specs_152=Unknown
% @importance 1.0

0.93::acc(s1, size_specs_152).

0.95::true_val(size_specs_152, ee113_5_nw31_2_tw30_w26_4_sc7_st55_wt70_90); 0.05::true_val(size_specs_152, unk_size_specs_152).

measured(s1, size_specs_152, ee113_5_nw31_2_tw30_w26_4_sc7_st55_wt70_90).

all_consistent(size_specs_152) :- consistent(s1, size_specs_152).

evidence(all_consistent(size_specs_152)).
query(true_val(size_specs_152, ee113_5_nw31_2_tw30_w26_4_sc7_st55_wt70_90)).
query(true_val(size_specs_152, unk_size_specs_152)).

% @attr size_specs_154
% @type categorical
% @canonical false
% @original_name Size 154cm specs
% @values ee115_nw31_5_tw30_3_w26_6_sc7_1_st55_5_wt70_100=EE115cm_NW31_5_TW30_3_W26_6_SC7_1m_ST55_5cm_WT70_100kg unk_size_specs_154=Unknown
% @importance 1.0

0.93::acc(s1, size_specs_154).

0.95::true_val(size_specs_154, ee115_nw31_5_tw30_3_w26_6_sc7_1_st55_5_wt70_100); 0.05::true_val(size_specs_154, unk_size_specs_154).

measured(s1, size_specs_154, ee115_nw31_5_tw30_3_w26_6_sc7_1_st55_5_wt70_100).

all_consistent(size_specs_154) :- consistent(s1, size_specs_154).

evidence(all_consistent(size_specs_154)).
query(true_val(size_specs_154, ee115_nw31_5_tw30_3_w26_6_sc7_1_st55_5_wt70_100)).
query(true_val(size_specs_154, unk_size_specs_154)).

% @attr size_specs_157
% @type categorical
% @canonical false
% @original_name Size 157cm specs
% @values ee117_nw32_tw30_8_w26_9_sc7_2_st56_5_wt70_105=EE117cm_NW32_TW30_8_W26_9_SC7_2m_ST56_5cm_WT70_105kg unk_size_specs_157=Unknown
% @importance 1.0

0.93::acc(s1, size_specs_157).

0.95::true_val(size_specs_157, ee117_nw32_tw30_8_w26_9_sc7_2_st56_5_wt70_105); 0.05::true_val(size_specs_157, unk_size_specs_157).

measured(s1, size_specs_157, ee117_nw32_tw30_8_w26_9_sc7_2_st56_5_wt70_105).

all_consistent(size_specs_157) :- consistent(s1, size_specs_157).

evidence(all_consistent(size_specs_157)).
query(true_val(size_specs_157, ee117_nw32_tw30_8_w26_9_sc7_2_st56_5_wt70_105)).
query(true_val(size_specs_157, unk_size_specs_157)).

% @attr weight_note
% @type categorical
% @canonical false
% @original_name Weight note
% @values heavier_than_avg_but_lighter_per_area=Heavier_than_average_but_volume_shifted_so_lighter_per_surface_area unk_weight_note=Unknown
% @importance 0.9

0.85::acc(s9, weight_note).

0.74::true_val(weight_note, heavier_than_avg_but_lighter_per_area); 0.26::true_val(weight_note, unk_weight_note).

measured(s9, weight_note, heavier_than_avg_but_lighter_per_area).

all_consistent(weight_note) :- consistent(s9, weight_note).

evidence(all_consistent(weight_note)).
query(true_val(weight_note, heavier_than_avg_but_lighter_per_area)).
query(true_val(weight_note, unk_weight_note)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2900=2900.0 unk_board_weight_grams=Unknown
% @importance 0.9

0.87::acc(s9, board_weight_grams).

0.74::true_val(board_weight_grams, v2900); 0.26::true_val(board_weight_grams, unk_board_weight_grams).

measured(s9, board_weight_grams, v2900).

all_consistent(board_weight_grams) :- consistent(s9, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2900)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v939_99=939.99 unk_price_aud_merchant=Unknown
% @importance 0.925

0.95::acc(s1, price_aud_merchant).

0.95::true_val(price_aud_merchant, v939_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s1, price_aud_merchant, v939_99).

all_consistent(price_aud_merchant) :- consistent(s1, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v939_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values preorder_may_2026=Preorder_estimated_May_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.925

0.92::acc(s1, estimated_availability_date).

0.95::true_val(estimated_availability_date, preorder_may_2026); 0.05::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s1, estimated_availability_date, preorder_may_2026).

all_consistent(estimated_availability_date) :- consistent(s1, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, preorder_may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr price_msrp_usd
% @type numeric
% @unit USD
% @canonical false
% @original_name 2026 MSRP USD
% @values v549_95=549.95 unk_price_msrp_usd=Unknown
% @importance 0.82

0.90::acc(s25, price_msrp_usd).
0.85::acc(s26, price_msrp_usd).
0.82::acc(s27, price_msrp_usd).

0.96::true_val(price_msrp_usd, v549_95); 0.04::true_val(price_msrp_usd, unk_price_msrp_usd).

measured(s25, price_msrp_usd, v549_95).
measured(s26, price_msrp_usd, v549_95).
measured(s27, price_msrp_usd, v549_95).

all_consistent(price_msrp_usd) :-
    consistent(s25, price_msrp_usd),
    (indep(s26), consistent(s26, price_msrp_usd) ; \+indep(s26)),
    (indep(s27), consistent(s27, price_msrp_usd) ; \+indep(s27)).

evidence(all_consistent(price_msrp_usd)).
query(true_val(price_msrp_usd, v549_95)).
query(true_val(price_msrp_usd, unk_price_msrp_usd)).

% @attr price_sale_evo
% @type numeric
% @unit USD
% @canonical false
% @original_name 2026 sale price evo
% @values v439_96=439.96 unk_price_sale_evo=Unknown
% @importance 0.9

0.90::acc(s25, price_sale_evo).

0.85::true_val(price_sale_evo, v439_96); 0.15::true_val(price_sale_evo, unk_price_sale_evo).

measured(s25, price_sale_evo, v439_96).

all_consistent(price_sale_evo) :- consistent(s25, price_sale_evo).

evidence(all_consistent(price_sale_evo)).
query(true_val(price_sale_evo, v439_96)).
query(true_val(price_sale_evo, unk_price_sale_evo)).

% @attr price_powder7
% @type categorical
% @canonical false
% @original_name Powder7 price
% @values msrp_549_95_sale_439_96=MSRP_549_95_Sale_439_96_20pct_off unk_price_powder7=Unknown
% @importance 0.85

0.85::acc(s16, price_powder7).

0.68::true_val(price_powder7, msrp_549_95_sale_439_96); 0.32::true_val(price_powder7, unk_price_powder7).

measured(s16, price_powder7, msrp_549_95_sale_439_96).

all_consistent(price_powder7) :-
    (indep(s16), consistent(s16, price_powder7) ; \+indep(s16)).

evidence(all_consistent(price_powder7)).
query(true_val(price_powder7, msrp_549_95_sale_439_96)).
query(true_val(price_powder7, unk_price_powder7)).

% @attr price_aspen_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name Aspen Ski and Board price
% @values v549_95=549.95 unk_price_aspen_ski=Unknown
% @importance 0.7

0.82::acc(s26, price_aspen_ski).

0.62::true_val(price_aspen_ski, v549_95); 0.38::true_val(price_aspen_ski, unk_price_aspen_ski).

measured(s26, price_aspen_ski, v549_95).

all_consistent(price_aspen_ski) :-
    (indep(s26), consistent(s26, price_aspen_ski) ; \+indep(s26)).

evidence(all_consistent(price_aspen_ski)).
query(true_val(price_aspen_ski, v549_95)).
query(true_val(price_aspen_ski, unk_price_aspen_ski)).

% @attr price_backwoods
% @type numeric
% @unit USD
% @canonical false
% @original_name Backwoods price
% @values v549_95=549.95 unk_price_backwoods=Unknown
% @importance 0.7

0.80::acc(s27, price_backwoods).

0.59::true_val(price_backwoods, v549_95); 0.41::true_val(price_backwoods, unk_price_backwoods).

measured(s27, price_backwoods, v549_95).

all_consistent(price_backwoods) :-
    (indep(s27), consistent(s27, price_backwoods) ; \+indep(s27)).

evidence(all_consistent(price_backwoods)).
query(true_val(price_backwoods, v549_95)).
query(true_val(price_backwoods, unk_price_backwoods)).

% @attr price_sundance_prior
% @type categorical
% @canonical false
% @original_name Sundance prior year price
% @values reg_467_sale_382=Regular_467_Sale_382_USD_2025_model unk_price_sundance_prior=Unknown
% @importance 0.7

0.78::acc(s18, price_sundance_prior).

0.55::true_val(price_sundance_prior, reg_467_sale_382); 0.45::true_val(price_sundance_prior, unk_price_sundance_prior).

measured(s18, price_sundance_prior, reg_467_sale_382).

all_consistent(price_sundance_prior) :-
    (indep(s18), consistent(s18, price_sundance_prior) ; \+indep(s18)).

evidence(all_consistent(price_sundance_prior)).
query(true_val(price_sundance_prior, reg_467_sale_382)).
query(true_val(price_sundance_prior, unk_price_sundance_prior)).

% @attr price_clearance_sunski
% @type numeric
% @unit USD
% @canonical false
% @original_name Sun and Ski clearance price
% @values v299_84=299.84 unk_price_clearance_sunski=Unknown
% @importance 0.85

0.82::acc(s8, price_clearance_sunski).

0.77::true_val(price_clearance_sunski, v299_84); 0.23::true_val(price_clearance_sunski, unk_price_clearance_sunski).

measured(s8, price_clearance_sunski, v299_84).

all_consistent(price_clearance_sunski) :- consistent(s8, price_clearance_sunski).

evidence(all_consistent(price_clearance_sunski)).
query(true_val(price_clearance_sunski, v299_84)).
query(true_val(price_clearance_sunski, unk_price_clearance_sunski)).

% @attr price_uk_eu
% @type categorical
% @canonical false
% @original_name UK and EU price 2023/24
% @values gbp445_eur500=GBP_445_EUR_500_at_Blue_Tomato unk_price_uk_eu=Unknown
% @importance 0.7

0.80::acc(s10, price_uk_eu).

0.75::true_val(price_uk_eu, gbp445_eur500); 0.25::true_val(price_uk_eu, unk_price_uk_eu).

measured(s10, price_uk_eu, gbp445_eur500).

all_consistent(price_uk_eu) :- consistent(s10, price_uk_eu).

evidence(all_consistent(price_uk_eu)).
query(true_val(price_uk_eu, gbp445_eur500)).
query(true_val(price_uk_eu, unk_price_uk_eu)).

% @attr price_snowboardingprofiles
% @type numeric
% @unit USD
% @canonical false
% @original_name SnowboardingProfiles listed price
% @values v549=549.0 unk_price_snowboardingprofiles=Unknown
% @importance 0.9

0.85::acc(s9, price_snowboardingprofiles).

0.74::true_val(price_snowboardingprofiles, v549); 0.26::true_val(price_snowboardingprofiles, unk_price_snowboardingprofiles).

measured(s9, price_snowboardingprofiles, v549).

all_consistent(price_snowboardingprofiles) :- consistent(s9, price_snowboardingprofiles).

evidence(all_consistent(price_snowboardingprofiles)).
query(true_val(price_snowboardingprofiles, v549)).
query(true_val(price_snowboardingprofiles, unk_price_snowboardingprofiles)).

% @attr price_2022_msrp
% @type numeric
% @unit USD
% @canonical false
% @original_name 2022 model MSRP
% @values v450=450.0 unk_price_2022_msrp=Unknown
% @importance 0.6

0.78::acc(s28, price_2022_msrp).

0.60::true_val(price_2022_msrp, v450); 0.40::true_val(price_2022_msrp, unk_price_2022_msrp).

measured(s28, price_2022_msrp, v450).

all_consistent(price_2022_msrp) :- consistent(s28, price_2022_msrp).

evidence(all_consistent(price_2022_msrp)).
query(true_val(price_2022_msrp, v450)).
query(true_val(price_2022_msrp, unk_price_2022_msrp)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder_2027=2027_model_available_for_preorder unk_availability_status=Unknown
% @importance 0.575

0.88::acc(s24, availability_status).
0.82::acc(s29, availability_status).
0.80::acc(s30, availability_status).
0.80::acc(s31, availability_status).

0.95::true_val(availability_status, preorder_2027); 0.05::true_val(availability_status, unk_availability_status).

measured(s24, availability_status, preorder_2027).
measured(s29, availability_status, preorder_2027).
measured(s30, availability_status, preorder_2027).
measured(s31, availability_status, preorder_2027).

all_consistent(availability_status) :-
    consistent(s24, availability_status),
    (indep(s29), consistent(s29, availability_status) ; \+indep(s29)),
    (indep(s30), consistent(s30, availability_status) ; \+indep(s30)),
    (indep(s31), consistent(s31, availability_status) ; \+indep(s31)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder_2027)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_2026
% @type categorical
% @canonical false
% @original_name Availability status 2026
% @values in_stock_2026=2026_model_in_stock_at_multiple_retailers unk_availability_status_2026=Unknown
% @importance 0.6

0.88::acc(s25, availability_status_2026).
0.85::acc(s19, availability_status_2026).
0.78::acc(s16, availability_status_2026).
0.75::acc(s33, availability_status_2026).
0.72::acc(s34, availability_status_2026).
0.72::acc(s35, availability_status_2026).

0.96::true_val(availability_status_2026, in_stock_2026); 0.04::true_val(availability_status_2026, unk_availability_status_2026).

measured(s25, availability_status_2026, in_stock_2026).
measured(s19, availability_status_2026, in_stock_2026).
measured(s16, availability_status_2026, in_stock_2026).
measured(s33, availability_status_2026, in_stock_2026).
measured(s34, availability_status_2026, in_stock_2026).
measured(s35, availability_status_2026, in_stock_2026).

all_consistent(availability_status_2026) :-
    consistent(s25, availability_status_2026),
    (indep(s19), consistent(s19, availability_status_2026) ; \+indep(s19)),
    (indep(s16), consistent(s16, availability_status_2026) ; \+indep(s16)),
    (indep(s33), consistent(s33, availability_status_2026) ; \+indep(s33)),
    (indep(s34), consistent(s34, availability_status_2026) ; \+indep(s34)),
    (indep(s35), consistent(s35, availability_status_2026) ; \+indep(s35)).

evidence(all_consistent(availability_status_2026)).
query(true_val(availability_status_2026, in_stock_2026)).
query(true_val(availability_status_2026, unk_availability_status_2026)).

% @attr availability_source_sold_out
% @type categorical
% @canonical false
% @original_name Source Snowboard availability
% @values sold_out_2026=2026_model_listed_at_549_95_sold_out unk_availability_source_sold_out=Unknown
% @importance 0.5

0.75::acc(s32, availability_source_sold_out).

0.49::true_val(availability_source_sold_out, sold_out_2026); 0.51::true_val(availability_source_sold_out, unk_availability_source_sold_out).

measured(s32, availability_source_sold_out, sold_out_2026).

all_consistent(availability_source_sold_out) :-
    (indep(s32), consistent(s32, availability_source_sold_out) ; \+indep(s32)).

evidence(all_consistent(availability_source_sold_out)).
query(true_val(availability_source_sold_out, sold_out_2026)).
query(true_val(availability_source_sold_out, unk_availability_source_sold_out)).

% @attr availability_status_prior
% @type categorical
% @canonical false
% @original_name Availability status prior year
% @values available_prior=Prior_year_models_available unk_availability_status_prior=Unknown
% @importance 0.5

0.75::acc(s36, availability_status_prior).
0.78::acc(s37, availability_status_prior).
0.82::acc(s9, availability_status_prior).

0.95::true_val(availability_status_prior, available_prior); 0.05::true_val(availability_status_prior, unk_availability_status_prior).

measured(s36, availability_status_prior, available_prior).
measured(s37, availability_status_prior, available_prior).
measured(s9, availability_status_prior, available_prior).

all_consistent(availability_status_prior) :-
    (indep(s36), consistent(s36, availability_status_prior) ; \+indep(s36)),
    (indep(s37), consistent(s37, availability_status_prior) ; \+indep(s37)),
    consistent(s9, availability_status_prior).

evidence(all_consistent(availability_status_prior)).
query(true_val(availability_status_prior, available_prior)).
query(true_val(availability_status_prior, unk_availability_status_prior)).

% @attr model_maturity
% @type categorical
% @canonical false
% @original_name Model maturity
% @values fourth_year_favourite=By_2023_24_fourth_year_cemented_as_favourite unk_model_maturity=Unknown
% @importance 0.7

0.85::acc(s10, model_maturity).

0.75::true_val(model_maturity, fourth_year_favourite); 0.25::true_val(model_maturity, unk_model_maturity).

measured(s10, model_maturity, fourth_year_favourite).

all_consistent(model_maturity) :- consistent(s10, model_maturity).

evidence(all_consistent(model_maturity)).
query(true_val(model_maturity, fourth_year_favourite)).
query(true_val(model_maturity, unk_model_maturity)).

% @attr design_stability
% @type categorical
% @canonical false
% @original_name Design stability
% @values largely_unchanged=Remarkably_well_balanced_largely_unchanged_2023_24 unk_design_stability=Unknown
% @importance 0.7

0.85::acc(s10, design_stability).

0.75::true_val(design_stability, largely_unchanged); 0.25::true_val(design_stability, unk_design_stability).

measured(s10, design_stability, largely_unchanged).

all_consistent(design_stability) :- consistent(s10, design_stability).

evidence(all_consistent(design_stability)).
query(true_val(design_stability, largely_unchanged)).
query(true_val(design_stability, unk_design_stability)).

% @attr design_consistency
% @type categorical
% @canonical false
% @original_name Design consistency
% @values graphic_update_only=Only_graphic_updates_means_designers_got_it_right unk_design_consistency=Unknown
% @importance 0.7

0.78::acc(s15, design_consistency).

0.64::true_val(design_consistency, graphic_update_only); 0.36::true_val(design_consistency, unk_design_consistency).

measured(s15, design_consistency, graphic_update_only).

all_consistent(design_consistency) :- consistent(s15, design_consistency).

evidence(all_consistent(design_consistency)).
query(true_val(design_consistency, graphic_update_only)).
query(true_val(design_consistency, unk_design_consistency)).

% @attr model_year_2026_updates
% @type categorical
% @canonical false
% @original_name 2026 model updates
% @values graphics_construction_refinements=Graphics_and_updated_construction_refinements unk_model_year_2026_updates=Unknown
% @importance 0.7

0.80::acc(s17, model_year_2026_updates).

0.66::true_val(model_year_2026_updates, graphics_construction_refinements); 0.34::true_val(model_year_2026_updates, unk_model_year_2026_updates).

measured(s17, model_year_2026_updates, graphics_construction_refinements).

all_consistent(model_year_2026_updates) :-
    (indep(s17), consistent(s17, model_year_2026_updates) ; \+indep(s17)).

evidence(all_consistent(model_year_2026_updates)).
query(true_val(model_year_2026_updates, graphics_construction_refinements)).
query(true_val(model_year_2026_updates, unk_model_year_2026_updates)).

% @attr model_year_2025_addition
% @type categorical
% @canonical false
% @original_name 2025 model size addition
% @values new_139cm_size=All_new_139cm_size_added unk_model_year_2025_addition=Unknown
% @importance 0.45

0.85::acc(s38, model_year_2025_addition).

0.74::true_val(model_year_2025_addition, new_139cm_size); 0.26::true_val(model_year_2025_addition, unk_model_year_2025_addition).

measured(s38, model_year_2025_addition, new_139cm_size).

all_consistent(model_year_2025_addition) :- consistent(s38, model_year_2025_addition).

evidence(all_consistent(model_year_2025_addition)).
query(true_val(model_year_2025_addition, new_139cm_size)).
query(true_val(model_year_2025_addition, unk_model_year_2025_addition)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v86_1=86.1 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.9

0.88::acc(s9, overall_rating_snowboardingprofiles).

0.74::true_val(overall_rating_snowboardingprofiles, v86_1); 0.26::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s9, overall_rating_snowboardingprofiles, v86_1).

all_consistent(overall_rating_snowboardingprofiles) :- consistent(s9, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v86_1)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr whitelines_choice_award
% @type categorical
% @canonical false
% @original_name Whitelines Choice Award
% @values best_all_mountain_2020_21=Best_All_Mountain_Snowboard_2020_21 unk_whitelines_choice_award=Unknown
% @importance 0.7

0.92::acc(s39, whitelines_choice_award).
0.88::acc(s6, whitelines_choice_award).

0.95::true_val(whitelines_choice_award, best_all_mountain_2020_21); 0.05::true_val(whitelines_choice_award, unk_whitelines_choice_award).

measured(s39, whitelines_choice_award, best_all_mountain_2020_21).
measured(s6, whitelines_choice_award, best_all_mountain_2020_21).

all_consistent(whitelines_choice_award) :-
    consistent(s39, whitelines_choice_award),
    consistent(s6, whitelines_choice_award).

evidence(all_consistent(whitelines_choice_award)).
query(true_val(whitelines_choice_award, best_all_mountain_2020_21)).
query(true_val(whitelines_choice_award, unk_whitelines_choice_award)).

% @attr whitelines_100_selection
% @type categorical
% @canonical false
% @original_name Whitelines 100 selection
% @values selected_2023_24=Selected_Whitelines_100_Best_2023_24 unk_whitelines_100_selection=Unknown
% @importance 0.7

0.88::acc(s10, whitelines_100_selection).

0.75::true_val(whitelines_100_selection, selected_2023_24); 0.25::true_val(whitelines_100_selection, unk_whitelines_100_selection).

measured(s10, whitelines_100_selection, selected_2023_24).

all_consistent(whitelines_100_selection) :- consistent(s10, whitelines_100_selection).

evidence(all_consistent(whitelines_100_selection)).
query(true_val(whitelines_100_selection, selected_2023_24)).
query(true_val(whitelines_100_selection, unk_whitelines_100_selection)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values smoother_less_fatiguing_than_pro=Smoother_less_fatiguing_all_day_ride_vs_Pro unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.90::acc(s8, reviewer_opinion_the_good_ride).

0.77::true_val(reviewer_opinion_the_good_ride, smoother_less_fatiguing_than_pro); 0.23::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s8, reviewer_opinion_the_good_ride, smoother_less_fatiguing_than_pro).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s8, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, smoother_less_fatiguing_than_pro)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr user_review_the_good_ride
% @type numeric
% @unit /5
% @canonical false
% @original_name TheGoodRide user review
% @values v5_0=5.0 unk_user_review_the_good_ride=Unknown
% @importance 0.85

0.82::acc(s8, user_review_the_good_ride).

0.77::true_val(user_review_the_good_ride, v5_0); 0.23::true_val(user_review_the_good_ride, unk_user_review_the_good_ride).

measured(s8, user_review_the_good_ride, v5_0).

all_consistent(user_review_the_good_ride) :- consistent(s8, user_review_the_good_ride).

evidence(all_consistent(user_review_the_good_ride)).
query(true_val(user_review_the_good_ride, v5_0)).
query(true_val(user_review_the_good_ride, unk_user_review_the_good_ride)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values trees_powder_moderate_speed=Best_in_trees_powder_at_moderate_speeds unk_terrain_suitability=Unknown
% @importance 0.85

0.88::acc(s8, terrain_suitability).
0.85::acc(s9, terrain_suitability).

0.95::true_val(terrain_suitability, trees_powder_moderate_speed); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s8, terrain_suitability, trees_powder_moderate_speed).
measured(s9, terrain_suitability, trees_powder_moderate_speed).

all_consistent(terrain_suitability) :-
    consistent(s8, terrain_suitability),
    consistent(s9, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, trees_powder_moderate_speed)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values easy_nimble=Easy_to_initiate_nimble_tight_turns_balanced_turny unk_turn_initiation_performance=Unknown
% @importance 0.85

0.88::acc(s8, turn_initiation_performance).
0.85::acc(s9, turn_initiation_performance).

0.95::true_val(turn_initiation_performance, easy_nimble); 0.05::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s8, turn_initiation_performance, easy_nimble).
measured(s9, turn_initiation_performance, easy_nimble).

all_consistent(turn_initiation_performance) :-
    consistent(s8, turn_initiation_performance),
    consistent(s9, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, easy_nimble)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr slow_speed_catchiness
% @type categorical
% @canonical false
% @original_name Slow speed catchiness
% @values very_little=Very_little_catchiness_at_slower_speeds unk_slow_speed_catchiness=Unknown
% @importance 0.85

0.88::acc(s8, slow_speed_catchiness).

0.77::true_val(slow_speed_catchiness, very_little); 0.23::true_val(slow_speed_catchiness, unk_slow_speed_catchiness).

measured(s8, slow_speed_catchiness, very_little).

all_consistent(slow_speed_catchiness) :- consistent(s8, slow_speed_catchiness).

evidence(all_consistent(slow_speed_catchiness)).
query(true_val(slow_speed_catchiness, very_little)).
query(true_val(slow_speed_catchiness, unk_slow_speed_catchiness)).

% @attr powder_float_performance
% @type categorical
% @canonical false
% @original_name Powder float performance
% @values excellent_directional_float=Easy_directional_float_stays_on_top_in_knee_high_powder unk_powder_float_performance=Unknown
% @importance 0.85

0.88::acc(s8, powder_float_performance).

0.77::true_val(powder_float_performance, excellent_directional_float); 0.23::true_val(powder_float_performance, unk_powder_float_performance).

measured(s8, powder_float_performance, excellent_directional_float).

all_consistent(powder_float_performance) :- consistent(s8, powder_float_performance).

evidence(all_consistent(powder_float_performance)).
query(true_val(powder_float_performance, excellent_directional_float)).
query(true_val(powder_float_performance, unk_powder_float_performance)).

% @attr groomed_performance
% @type categorical
% @canonical false
% @original_name Groomed run performance
% @values good_turns_solid_edge_hold_playful=Good_turns_on_groomed_solid_edge_hold_while_playful unk_groomed_performance=Unknown
% @importance 0.9

0.85::acc(s9, groomed_performance).

0.74::true_val(groomed_performance, good_turns_solid_edge_hold_playful); 0.26::true_val(groomed_performance, unk_groomed_performance).

measured(s9, groomed_performance, good_turns_solid_edge_hold_playful).

all_consistent(groomed_performance) :- consistent(s9, groomed_performance).

evidence(all_consistent(groomed_performance)).
query(true_val(groomed_performance, good_turns_solid_edge_hold_playful)).
query(true_val(groomed_performance, unk_groomed_performance)).

% @attr edge_change_ease
% @type categorical
% @canonical false
% @original_name Edge change ease
% @values breeze_soft_torsional=Edge_changes_breeze_due_to_softer_torsional_flex unk_edge_change_ease=Unknown
% @importance 0.75

0.88::acc(s6, edge_change_ease).

0.77::true_val(edge_change_ease, breeze_soft_torsional); 0.23::true_val(edge_change_ease, unk_edge_change_ease).

measured(s6, edge_change_ease, breeze_soft_torsional).

all_consistent(edge_change_ease) :- consistent(s6, edge_change_ease).

evidence(all_consistent(edge_change_ease)).
query(true_val(edge_change_ease, breeze_soft_torsional)).
query(true_val(edge_change_ease, unk_edge_change_ease)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name User review forum
% @values super_fun_good_icy_grip=Super_fun_grips_better_than_expected_icy unk_user_review_forum=Unknown
% @importance 0.6

0.70::acc(s40, user_review_forum).

0.30::true_val(user_review_forum, super_fun_good_icy_grip); 0.70::true_val(user_review_forum, unk_user_review_forum).

measured(s40, user_review_forum, super_fun_good_icy_grip).

all_consistent(user_review_forum) :- consistent(s40, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, super_fun_good_icy_grip)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_versatile
% @type categorical
% @canonical false
% @original_name User review forum versatile
% @values incredibly_versatile=Incredibly_versatile_ride_anywhere_any_condition unk_user_review_forum_versatile=Unknown
% @importance 0.6

0.72::acc(s41, user_review_forum_versatile).

0.36::true_val(user_review_forum_versatile, incredibly_versatile); 0.64::true_val(user_review_forum_versatile, unk_user_review_forum_versatile).

measured(s41, user_review_forum_versatile, incredibly_versatile).

all_consistent(user_review_forum_versatile) :- consistent(s41, user_review_forum_versatile).

evidence(all_consistent(user_review_forum_versatile)).
query(true_val(user_review_forum_versatile, incredibly_versatile)).
query(true_val(user_review_forum_versatile, unk_user_review_forum_versatile)).

% @attr staff_review_powder7
% @type categorical
% @canonical false
% @original_name Powder7 staff review
% @values carving_master_feel=Felt_like_a_carving_master_first_run unk_staff_review_powder7=Unknown
% @importance 0.85

0.78::acc(s16, staff_review_powder7).

0.68::true_val(staff_review_powder7, carving_master_feel); 0.32::true_val(staff_review_powder7, unk_staff_review_powder7).

measured(s16, staff_review_powder7, carving_master_feel).

all_consistent(staff_review_powder7) :-
    (indep(s16), consistent(s16, staff_review_powder7) ; \+indep(s16)).

evidence(all_consistent(staff_review_powder7)).
query(true_val(staff_review_powder7, carving_master_feel)).
query(true_val(staff_review_powder7, unk_staff_review_powder7)).

% @attr carving_performance
% @type categorical
% @canonical false
% @original_name Carving performance
% @values decent_not_epic=Decent_carve_not_epic_washy_at_high_speed unk_carving_performance=Unknown
% @importance 0.9

0.87::acc(s9, carving_performance).

0.74::true_val(carving_performance, decent_not_epic); 0.26::true_val(carving_performance, unk_carving_performance).

measured(s9, carving_performance, decent_not_epic).

all_consistent(carving_performance) :- consistent(s9, carving_performance).

evidence(all_consistent(carving_performance)).
query(true_val(carving_performance, decent_not_epic)).
query(true_val(carving_performance, unk_carving_performance)).

% @attr speed_stability
% @type categorical
% @canonical false
% @original_name Speed stability
% @values good_moderate_squirrelly_high=Good_up_to_moderate_speed_squirrelly_chattery_at_high unk_speed_stability=Unknown
% @importance 0.9

0.87::acc(s9, speed_stability).

0.74::true_val(speed_stability, good_moderate_squirrelly_high); 0.26::true_val(speed_stability, unk_speed_stability).

measured(s9, speed_stability, good_moderate_squirrelly_high).

all_consistent(speed_stability) :- consistent(s9, speed_stability).

evidence(all_consistent(speed_stability)).
query(true_val(speed_stability, good_moderate_squirrelly_high)).
query(true_val(speed_stability, unk_speed_stability)).

% @attr high_speed_catchiness
% @type categorical
% @canonical false
% @original_name High speed catchiness
% @values more_catch_prone_fast=More_catch_prone_at_faster_speeds unk_high_speed_catchiness=Unknown
% @importance 0.9

0.85::acc(s9, high_speed_catchiness).

0.74::true_val(high_speed_catchiness, more_catch_prone_fast); 0.26::true_val(high_speed_catchiness, unk_high_speed_catchiness).

measured(s9, high_speed_catchiness, more_catch_prone_fast).

all_consistent(high_speed_catchiness) :- consistent(s9, high_speed_catchiness).

evidence(all_consistent(high_speed_catchiness)).
query(true_val(high_speed_catchiness, more_catch_prone_fast)).
query(true_val(high_speed_catchiness, unk_high_speed_catchiness)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values uncomfortable_chop_icy=Uncomfortable_chopped_snow_jarring_icy_patches unk_negative_aspect=Unknown
% @importance 0.625

0.78::acc(s8, negative_aspect).

0.62::true_val(negative_aspect, uncomfortable_chop_icy); 0.38::true_val(negative_aspect, unk_negative_aspect).

measured(s8, negative_aspect, uncomfortable_chop_icy).

all_consistent(negative_aspect) :- consistent(s8, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, uncomfortable_chop_icy)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_sluggish
% @type categorical
% @canonical false
% @original_name Negative aspect sluggish
% @values slow_sluggish=Felt_slow_sluggish_for_some_riders unk_negative_aspect_sluggish=Unknown
% @importance 0.65

0.68::acc(s42, negative_aspect_sluggish).

0.31::true_val(negative_aspect_sluggish, slow_sluggish); 0.69::true_val(negative_aspect_sluggish, unk_negative_aspect_sluggish).

measured(s42, negative_aspect_sluggish, slow_sluggish).

all_consistent(negative_aspect_sluggish) :- consistent(s42, negative_aspect_sluggish).

evidence(all_consistent(negative_aspect_sluggish)).
query(true_val(negative_aspect_sluggish, slow_sluggish)).
query(true_val(negative_aspect_sluggish, unk_negative_aspect_sluggish)).

% @attr negative_aspect_quiver
% @type categorical
% @canonical false
% @original_name Negative aspect quiver note
% @values quiver_of_one_easy_control=Quiver_of_one_emphasis_easy_control_not_aggressive_carver unk_negative_aspect_quiver=Unknown
% @importance 0.65

0.68::acc(s42, negative_aspect_quiver).

0.31::true_val(negative_aspect_quiver, quiver_of_one_easy_control); 0.69::true_val(negative_aspect_quiver, unk_negative_aspect_quiver).

measured(s42, negative_aspect_quiver, quiver_of_one_easy_control).

all_consistent(negative_aspect_quiver) :- consistent(s42, negative_aspect_quiver).

evidence(all_consistent(negative_aspect_quiver)).
query(true_val(negative_aspect_quiver, quiver_of_one_easy_control)).
query(true_val(negative_aspect_quiver, unk_negative_aspect_quiver)).

% @attr negative_aspect_squirrelly
% @type categorical
% @canonical false
% @original_name Negative aspect pro squirrelly
% @values pro_squirrelly_from_superpig=Coming_from_Superpig_the_Pro_felt_squirrelly unk_negative_aspect_squirrelly=Unknown
% @importance 0.6

0.65::acc(s40, negative_aspect_squirrelly).

0.30::true_val(negative_aspect_squirrelly, pro_squirrelly_from_superpig); 0.70::true_val(negative_aspect_squirrelly, unk_negative_aspect_squirrelly).

measured(s40, negative_aspect_squirrelly, pro_squirrelly_from_superpig).

all_consistent(negative_aspect_squirrelly) :- consistent(s40, negative_aspect_squirrelly).

evidence(all_consistent(negative_aspect_squirrelly)).
query(true_val(negative_aspect_squirrelly, pro_squirrelly_from_superpig)).
query(true_val(negative_aspect_squirrelly, unk_negative_aspect_squirrelly)).

% @attr jump_switch_capability
% @type categorical
% @canonical false
% @original_name Jump and switch capability
% @values not_ideal_doable=Not_ideal_for_jumps_or_switch_but_doable unk_jump_switch_capability=Unknown
% @importance 0.9

0.85::acc(s9, jump_switch_capability).

0.74::true_val(jump_switch_capability, not_ideal_doable); 0.26::true_val(jump_switch_capability, unk_jump_switch_capability).

measured(s9, jump_switch_capability, not_ideal_doable).

all_consistent(jump_switch_capability) :- consistent(s9, jump_switch_capability).

evidence(all_consistent(jump_switch_capability)).
query(true_val(jump_switch_capability, not_ideal_doable)).
query(true_val(jump_switch_capability, unk_jump_switch_capability)).

% @attr hardpack_grip
% @type categorical
% @canonical false
% @original_name Hardpack grip
% @values competent_not_specialist=Competent_grip_not_full_hard_snow_specialist unk_hardpack_grip=Unknown
% @importance 0.9

0.85::acc(s9, hardpack_grip).

0.74::true_val(hardpack_grip, competent_not_specialist); 0.26::true_val(hardpack_grip, unk_hardpack_grip).

measured(s9, hardpack_grip, competent_not_specialist).

all_consistent(hardpack_grip) :- consistent(s9, hardpack_grip).

evidence(all_consistent(hardpack_grip)).
query(true_val(hardpack_grip, competent_not_specialist)).
query(true_val(hardpack_grip, unk_hardpack_grip)).

% @attr sizing_recommendation_152
% @type categorical
% @canonical false
% @original_name Sizing recommendation 152cm
% @values suits_75_85kg=152cm_suits_riders_roughly_75_85kg unk_sizing_recommendation_152=Unknown
% @importance 0.65

0.80::acc(s29, sizing_recommendation_152).

0.62::true_val(sizing_recommendation_152, suits_75_85kg); 0.38::true_val(sizing_recommendation_152, unk_sizing_recommendation_152).

measured(s29, sizing_recommendation_152, suits_75_85kg).

all_consistent(sizing_recommendation_152) :-
    (indep(s29), consistent(s29, sizing_recommendation_152) ; \+indep(s29)).

evidence(all_consistent(sizing_recommendation_152)).
query(true_val(sizing_recommendation_152, suits_75_85kg)).
query(true_val(sizing_recommendation_152, unk_sizing_recommendation_152)).

% @attr ride_feel_directional
% @type categorical
% @canonical false
% @original_name Ride feel directional
% @values looks_directional_feels_centered=Looks_directional_tapered_but_feels_centered_on_sidecut unk_ride_feel_directional=Unknown
% @importance 0.85

0.88::acc(s8, ride_feel_directional).

0.77::true_val(ride_feel_directional, looks_directional_feels_centered); 0.23::true_val(ride_feel_directional, unk_ride_feel_directional).

measured(s8, ride_feel_directional, looks_directional_feels_centered).

all_consistent(ride_feel_directional) :- consistent(s8, ride_feel_directional).

evidence(all_consistent(ride_feel_directional)).
query(true_val(ride_feel_directional, looks_directional_feels_centered)).
query(true_val(ride_feel_directional, unk_ride_feel_directional)).

% @attr best_for_terrain
% @type categorical
% @canonical false
% @original_name Best for terrain
% @values park_allmtn_freeride=Park_Freestyle_All_Mountain_Freeride unk_best_for_terrain=Unknown
% @importance 0.5

0.75::acc(s36, best_for_terrain).

0.49::true_val(best_for_terrain, park_allmtn_freeride); 0.51::true_val(best_for_terrain, unk_best_for_terrain).

measured(s36, best_for_terrain, park_allmtn_freeride).

all_consistent(best_for_terrain) :-
    (indep(s36), consistent(s36, best_for_terrain) ; \+indep(s36)).

evidence(all_consistent(best_for_terrain)).
query(true_val(best_for_terrain, park_allmtn_freeride)).
query(true_val(best_for_terrain, unk_best_for_terrain)).

% @attr ideal_boot_sizes
% @type categorical
% @canonical false
% @original_name Ideal boot sizes
% @values sz152_9_10_sz154_9_5_10_5_sz157_10_11=US_152_9to10_154_9_5to10_5_157_10to11 unk_ideal_boot_sizes=Unknown
% @importance 0.85

0.85::acc(s8, ideal_boot_sizes).

0.77::true_val(ideal_boot_sizes, sz152_9_10_sz154_9_5_10_5_sz157_10_11); 0.23::true_val(ideal_boot_sizes, unk_ideal_boot_sizes).

measured(s8, ideal_boot_sizes, sz152_9_10_sz154_9_5_10_5_sz157_10_11).

all_consistent(ideal_boot_sizes) :- consistent(s8, ideal_boot_sizes).

evidence(all_consistent(ideal_boot_sizes)).
query(true_val(ideal_boot_sizes, sz152_9_10_sz154_9_5_10_5_sz157_10_11)).
query(true_val(ideal_boot_sizes, unk_ideal_boot_sizes)).

% @attr sizing_guidance
% @type categorical
% @canonical false
% @original_name Sizing guidance
% @values balance_boot_weight=Sizing_balances_boot_width_and_weight unk_sizing_guidance=Unknown
% @importance 0.85

0.85::acc(s8, sizing_guidance).

0.77::true_val(sizing_guidance, balance_boot_weight); 0.23::true_val(sizing_guidance, unk_sizing_guidance).

measured(s8, sizing_guidance, balance_boot_weight).

all_consistent(sizing_guidance) :- consistent(s8, sizing_guidance).

evidence(all_consistent(sizing_guidance)).
query(true_val(sizing_guidance, balance_boot_weight)).
query(true_val(sizing_guidance, unk_sizing_guidance)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values ride_warpig=Ride_Warpig_most_popular_volume_shift_comparison unk_comparable_board_cross_brand=Unknown
% @importance 0.775

0.82::acc(s14, comparable_board_cross_brand).
0.80::acc(s28, comparable_board_cross_brand).

0.95::true_val(comparable_board_cross_brand, ride_warpig); 0.05::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s14, comparable_board_cross_brand, ride_warpig).
measured(s28, comparable_board_cross_brand, ride_warpig).

all_consistent(comparable_board_cross_brand) :-
    consistent(s14, comparable_board_cross_brand),
    consistent(s28, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, ride_warpig)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_warpig_detail
% @type categorical
% @canonical false
% @original_name Warpig comparison detail
% @values warpig_quicker_edge_to_edge=Warpig_quicker_edge_to_edge_reviewer_would_pick_Warpig unk_comparable_board_cross_brand_warpig_detail=Unknown
% @importance 0.8

0.78::acc(s14, comparable_board_cross_brand_warpig_detail).

0.60::true_val(comparable_board_cross_brand_warpig_detail, warpig_quicker_edge_to_edge); 0.40::true_val(comparable_board_cross_brand_warpig_detail, unk_comparable_board_cross_brand_warpig_detail).

measured(s14, comparable_board_cross_brand_warpig_detail, warpig_quicker_edge_to_edge).

all_consistent(comparable_board_cross_brand_warpig_detail) :- consistent(s14, comparable_board_cross_brand_warpig_detail).

evidence(all_consistent(comparable_board_cross_brand_warpig_detail)).
query(true_val(comparable_board_cross_brand_warpig_detail, warpig_quicker_edge_to_edge)).
query(true_val(comparable_board_cross_brand_warpig_detail, unk_comparable_board_cross_brand_warpig_detail)).

% @attr comparable_board_cross_brand_orca
% @type categorical
% @canonical false
% @original_name Orca comparison
% @values challenger_to_orca_better_job=Positioned_as_Orca_challenger_Whitelines_says_better unk_comparable_board_cross_brand_orca=Unknown
% @importance 0.675

0.80::acc(s28, comparable_board_cross_brand_orca).
0.88::acc(s6, comparable_board_cross_brand_orca).

0.92::true_val(comparable_board_cross_brand_orca, challenger_to_orca_better_job); 0.08::true_val(comparable_board_cross_brand_orca, unk_comparable_board_cross_brand_orca).

measured(s28, comparable_board_cross_brand_orca, challenger_to_orca_better_job).
measured(s6, comparable_board_cross_brand_orca, challenger_to_orca_better_job).

all_consistent(comparable_board_cross_brand_orca) :-
    consistent(s28, comparable_board_cross_brand_orca),
    consistent(s6, comparable_board_cross_brand_orca).

evidence(all_consistent(comparable_board_cross_brand_orca)).
query(true_val(comparable_board_cross_brand_orca, challenger_to_orca_better_job)).
query(true_val(comparable_board_cross_brand_orca, unk_comparable_board_cross_brand_orca)).

% @attr forum_suggested_alternatives
% @type categorical
% @canonical false
% @original_name Forum suggested alternatives
% @values lib_orca_gnu_gremlin_warpig_etc=Lib_Orca_Gnu_Gremlin_Ride_WarPig_Telos_K2_Bataleon_Signal unk_forum_suggested_alternatives=Unknown
% @importance 0.7

0.70::acc(s43, forum_suggested_alternatives).

0.33::true_val(forum_suggested_alternatives, lib_orca_gnu_gremlin_warpig_etc); 0.67::true_val(forum_suggested_alternatives, unk_forum_suggested_alternatives).

measured(s43, forum_suggested_alternatives, lib_orca_gnu_gremlin_warpig_etc).

all_consistent(forum_suggested_alternatives) :- consistent(s43, forum_suggested_alternatives).

evidence(all_consistent(forum_suggested_alternatives)).
query(true_val(forum_suggested_alternatives, lib_orca_gnu_gremlin_warpig_etc)).
query(true_val(forum_suggested_alternatives, unk_forum_suggested_alternatives)).

% @attr vs_board_feel_152
% @type categorical
% @canonical false
% @original_name Volume shifted feel 152
% @values most_normal_vs_feel=152_most_normal_board_feeling_among_volume_shifted unk_vs_board_feel_152=Unknown
% @importance 0.55

0.68::acc(s44, vs_board_feel_152).

0.30::true_val(vs_board_feel_152, most_normal_vs_feel); 0.70::true_val(vs_board_feel_152, unk_vs_board_feel_152).

measured(s44, vs_board_feel_152, most_normal_vs_feel).

all_consistent(vs_board_feel_152) :- consistent(s44, vs_board_feel_152).

evidence(all_consistent(vs_board_feel_152)).
query(true_val(vs_board_feel_152, most_normal_vs_feel)).
query(true_val(vs_board_feel_152, unk_vs_board_feel_152)).

% @attr value_proposition
% @type categorical
% @canonical false
% @original_name Value proposition
% @values great_value_at_500=Great_value_real_bargain_at_500_dollars unk_value_proposition=Unknown
% @importance 0.7

0.78::acc(s15, value_proposition).

0.64::true_val(value_proposition, great_value_at_500); 0.36::true_val(value_proposition, unk_value_proposition).

measured(s15, value_proposition, great_value_at_500).

all_consistent(value_proposition) :- consistent(s15, value_proposition).

evidence(all_consistent(value_proposition)).
query(true_val(value_proposition, great_value_at_500)).
query(true_val(value_proposition, unk_value_proposition)).

% @attr comparable_board_same_brand_pop
% @type categorical
% @canonical false
% @original_name Dancehaul Pro comparison pop
% @values pro_more_pop_faster_base_dynamic=Pro_more_pop_faster_base_more_dynamic_but_worse_uneven_snow unk_comparable_board_same_brand_pop=Unknown
% @importance 0.8

0.88::acc(s12, comparable_board_same_brand_pop).

0.77::true_val(comparable_board_same_brand_pop, pro_more_pop_faster_base_dynamic); 0.23::true_val(comparable_board_same_brand_pop, unk_comparable_board_same_brand_pop).

measured(s12, comparable_board_same_brand_pop, pro_more_pop_faster_base_dynamic).

all_consistent(comparable_board_same_brand_pop) :- consistent(s12, comparable_board_same_brand_pop).

evidence(all_consistent(comparable_board_same_brand_pop)).
query(true_val(comparable_board_same_brand_pop, pro_more_pop_faster_base_dynamic)).
query(true_val(comparable_board_same_brand_pop, unk_comparable_board_same_brand_pop)).

% @attr comparable_board_same_brand_allday
% @type categorical
% @canonical false
% @original_name Dancehaul vs Pro all day ride
% @values regular_better_allday=Regular_better_all_day_no_carbon_less_jarring_less_fatiguing unk_comparable_board_same_brand_allday=Unknown
% @importance 0.8

0.88::acc(s22, comparable_board_same_brand_allday).

0.77::true_val(comparable_board_same_brand_allday, regular_better_allday); 0.23::true_val(comparable_board_same_brand_allday, unk_comparable_board_same_brand_allday).

measured(s22, comparable_board_same_brand_allday, regular_better_allday).

all_consistent(comparable_board_same_brand_allday) :- consistent(s22, comparable_board_same_brand_allday).

evidence(all_consistent(comparable_board_same_brand_allday)).
query(true_val(comparable_board_same_brand_allday, regular_better_allday)).
query(true_val(comparable_board_same_brand_allday, unk_comparable_board_same_brand_allday)).

% @attr comparable_board_same_brand_speed
% @type categorical
% @canonical false
% @original_name Dancehaul vs Pro speed comparison
% @values pro_faster_clean_reg_faster_uneven=Pro_faster_clean_conditions_regular_faster_uneven_snow unk_comparable_board_same_brand_speed=Unknown
% @importance 0.8

0.88::acc(s22, comparable_board_same_brand_speed).

0.77::true_val(comparable_board_same_brand_speed, pro_faster_clean_reg_faster_uneven); 0.23::true_val(comparable_board_same_brand_speed, unk_comparable_board_same_brand_speed).

measured(s22, comparable_board_same_brand_speed, pro_faster_clean_reg_faster_uneven).

all_consistent(comparable_board_same_brand_speed) :- consistent(s22, comparable_board_same_brand_speed).

evidence(all_consistent(comparable_board_same_brand_speed)).
query(true_val(comparable_board_same_brand_speed, pro_faster_clean_reg_faster_uneven)).
query(true_val(comparable_board_same_brand_speed, unk_comparable_board_same_brand_speed)).

% @attr comparable_board_same_brand_value
% @type categorical
% @canonical false
% @original_name Dancehaul vs Pro value
% @values extra_100_probably_worth_it=Extra_100_dollars_probably_worth_it_depending_on_style unk_comparable_board_same_brand_value=Unknown
% @importance 0.7

0.78::acc(s15, comparable_board_same_brand_value).

0.64::true_val(comparable_board_same_brand_value, extra_100_probably_worth_it); 0.36::true_val(comparable_board_same_brand_value, unk_comparable_board_same_brand_value).

measured(s15, comparable_board_same_brand_value, extra_100_probably_worth_it).

all_consistent(comparable_board_same_brand_value) :- consistent(s15, comparable_board_same_brand_value).

evidence(all_consistent(comparable_board_same_brand_value)).
query(true_val(comparable_board_same_brand_value, extra_100_probably_worth_it)).
query(true_val(comparable_board_same_brand_value, unk_comparable_board_same_brand_value)).

% @attr notable_achievement
% @type categorical
% @canonical false
% @original_name Notable achievement
% @values melancon_dirksen_derby_2021=Desiree_Melancon_won_Dirksen_Derby_banked_slalom_on_2021_Dancehaul unk_notable_achievement=Unknown
% @importance 0.6

0.80::acc(s28, notable_achievement).

0.60::true_val(notable_achievement, melancon_dirksen_derby_2021); 0.40::true_val(notable_achievement, unk_notable_achievement).

measured(s28, notable_achievement, melancon_dirksen_derby_2021).

all_consistent(notable_achievement) :- consistent(s28, notable_achievement).

evidence(all_consistent(notable_achievement)).
query(true_val(notable_achievement, melancon_dirksen_derby_2021)).
query(true_val(notable_achievement, unk_notable_achievement)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v4_5=4.5 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.9

0.87::acc(s9, powder_score_snowboardingprofiles).

0.74::true_val(powder_score_snowboardingprofiles, v4_5); 0.26::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s9, powder_score_snowboardingprofiles, v4_5).

all_consistent(powder_score_snowboardingprofiles) :- consistent(s9, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v4_5)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr turns_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name Turns score SnowboardingProfiles
% @values v4=4.0 unk_turns_score_snowboardingprofiles=Unknown
% @importance 0.9

0.87::acc(s9, turns_score_snowboardingprofiles).

0.74::true_val(turns_score_snowboardingprofiles, v4); 0.26::true_val(turns_score_snowboardingprofiles, unk_turns_score_snowboardingprofiles).

measured(s9, turns_score_snowboardingprofiles, v4).

all_consistent(turns_score_snowboardingprofiles) :- consistent(s9, turns_score_snowboardingprofiles).

evidence(all_consistent(turns_score_snowboardingprofiles)).
query(true_val(turns_score_snowboardingprofiles, v4)).
query(true_val(turns_score_snowboardingprofiles, unk_turns_score_snowboardingprofiles)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v3_5=3.5 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.9

0.87::acc(s9, carving_score_snowboardingprofiles).

0.74::true_val(carving_score_snowboardingprofiles, v3_5); 0.26::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s9, carving_score_snowboardingprofiles, v3_5).

all_consistent(carving_score_snowboardingprofiles) :- consistent(s9, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v3_5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr trees_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name Trees score SnowboardingProfiles
% @values v4_5=4.5 unk_trees_score_snowboardingprofiles=Unknown
% @importance 0.9

0.87::acc(s9, trees_score_snowboardingprofiles).

0.74::true_val(trees_score_snowboardingprofiles, v4_5); 0.26::true_val(trees_score_snowboardingprofiles, unk_trees_score_snowboardingprofiles).

measured(s9, trees_score_snowboardingprofiles, v4_5).

all_consistent(trees_score_snowboardingprofiles) :- consistent(s9, trees_score_snowboardingprofiles).

evidence(all_consistent(trees_score_snowboardingprofiles)).
query(true_val(trees_score_snowboardingprofiles, v4_5)).
query(true_val(trees_score_snowboardingprofiles, unk_trees_score_snowboardingprofiles)).

% @attr crud_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name Crud score SnowboardingProfiles
% @values v3_5=3.5 unk_crud_score_snowboardingprofiles=Unknown
% @importance 0.9

0.87::acc(s9, crud_score_snowboardingprofiles).

0.74::true_val(crud_score_snowboardingprofiles, v3_5); 0.26::true_val(crud_score_snowboardingprofiles, unk_crud_score_snowboardingprofiles).

measured(s9, crud_score_snowboardingprofiles, v3_5).

all_consistent(crud_score_snowboardingprofiles) :- consistent(s9, crud_score_snowboardingprofiles).

evidence(all_consistent(crud_score_snowboardingprofiles)).
query(true_val(crud_score_snowboardingprofiles, v3_5)).
query(true_val(crud_score_snowboardingprofiles, unk_crud_score_snowboardingprofiles)).

% @attr speed_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name Speed score SnowboardingProfiles
% @values v3=3.0 unk_speed_score_snowboardingprofiles=Unknown
% @importance 0.9

0.87::acc(s9, speed_score_snowboardingprofiles).

0.74::true_val(speed_score_snowboardingprofiles, v3); 0.26::true_val(speed_score_snowboardingprofiles, unk_speed_score_snowboardingprofiles).

measured(s9, speed_score_snowboardingprofiles, v3).

all_consistent(speed_score_snowboardingprofiles) :- consistent(s9, speed_score_snowboardingprofiles).

evidence(all_consistent(speed_score_snowboardingprofiles)).
query(true_val(speed_score_snowboardingprofiles, v3)).
query(true_val(speed_score_snowboardingprofiles, unk_speed_score_snowboardingprofiles)).

% @attr jumps_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name Jumps score SnowboardingProfiles
% @values v3=3.0 unk_jumps_score_snowboardingprofiles=Unknown
% @importance 0.9

0.87::acc(s9, jumps_score_snowboardingprofiles).

0.74::true_val(jumps_score_snowboardingprofiles, v3); 0.26::true_val(jumps_score_snowboardingprofiles, unk_jumps_score_snowboardingprofiles).

measured(s9, jumps_score_snowboardingprofiles, v3).

all_consistent(jumps_score_snowboardingprofiles) :- consistent(s9, jumps_score_snowboardingprofiles).

evidence(all_consistent(jumps_score_snowboardingprofiles)).
query(true_val(jumps_score_snowboardingprofiles, v3)).
query(true_val(jumps_score_snowboardingprofiles, unk_jumps_score_snowboardingprofiles)).

% @attr switch_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name Switch score SnowboardingProfiles
% @values v2=2.0 unk_switch_score_snowboardingprofiles=Unknown
% @importance 0.9

0.87::acc(s9, switch_score_snowboardingprofiles).

0.74::true_val(switch_score_snowboardingprofiles, v2); 0.26::true_val(switch_score_snowboardingprofiles, unk_switch_score_snowboardingprofiles).

measured(s9, switch_score_snowboardingprofiles, v2).

all_consistent(switch_score_snowboardingprofiles) :- consistent(s9, switch_score_snowboardingprofiles).

evidence(all_consistent(switch_score_snowboardingprofiles)).
query(true_val(switch_score_snowboardingprofiles, v2)).
query(true_val(switch_score_snowboardingprofiles, unk_switch_score_snowboardingprofiles)).