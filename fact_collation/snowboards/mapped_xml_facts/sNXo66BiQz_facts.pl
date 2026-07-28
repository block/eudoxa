0.15::indep(s3).
0.20::indep(s4).
0.18::indep(s17).
0.15::indep(s21).
0.20::indep(s23).
0.15::indep(s24).
0.20::indep(s25).
0.20::indep(s27).
0.20::indep(s28).
0.10::indep(s16).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values rome=Rome unk_brand=Unknown
% @importance 0.75

0.93::acc(s1, brand).
0.92::acc(s2, brand).

0.97::true_val(brand, rome); 0.03::true_val(brand, unk_brand).

measured(s1, brand, rome).
measured(s2, brand, rome).

all_consistent(brand) :- consistent(s1, brand), consistent(s2, brand).

evidence(all_consistent(brand)).
query(true_val(brand, rome)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values warden=Warden unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).

0.87::true_val(model_name, warden); 0.13::true_val(model_name, unk_model_name).

measured(s1, model_name, warden).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, warden)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 1.0

0.80::acc(s3, model_year).

0.71::true_val(model_year, y2027); 0.29::true_val(model_year, unk_model_year).

measured(s3, model_year, y2027).

all_consistent(model_year) :- consistent(s3, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.87::true_val(product_type, snowboard); 0.13::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All-Mountain unk_board_category=Unknown
% @importance 0.95

0.94::acc(s1, board_category).
0.85::acc(s4, board_category).

0.95::true_val(board_category, all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain).
measured(s4, board_category, all_mountain).

all_consistent(board_category) :-
    consistent(s1, board_category),
    (indep(s4), consistent(s4, board_category) ; \+indep(s4)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.95::acc(s1, gender).

0.87::true_val(gender, mens); 0.13::true_val(gender, unk_gender).

measured(s1, gender, mens).

all_consistent(gender) :- consistent(s1, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y2001=2001 unk_manufacturer_founded=Unknown
% @importance 0.4

0.93::acc(s5, manufacturer_founded).

0.90::true_val(manufacturer_founded, y2001); 0.10::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s5, manufacturer_founded, y2001).

all_consistent(manufacturer_founded) :- consistent(s5, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y2001)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr founders
% @type categorical
% @canonical false
% @original_name Founders
% @values reid_maravetz=Josh_Reid_and_Paul_Maravetz unk_founders=Unknown
% @importance 0.35

0.65::acc(s6, founders).

0.57::true_val(founders, reid_maravetz); 0.43::true_val(founders, unk_founders).

measured(s6, founders, reid_maravetz).

all_consistent(founders) :- consistent(s6, founders).

evidence(all_consistent(founders)).
query(true_val(founders, reid_maravetz)).
query(true_val(founders, unk_founders)).

% @attr headquarters
% @type categorical
% @canonical false
% @original_name Headquarters
% @values waterbury_vt=1_Derby_Lane_Suite_4_Waterbury_Vermont unk_headquarters=Unknown
% @importance 0.25

0.70::acc(s7, headquarters).

0.63::true_val(headquarters, waterbury_vt); 0.37::true_val(headquarters, unk_headquarters).

measured(s7, headquarters, waterbury_vt).

all_consistent(headquarters) :- consistent(s7, headquarters).

evidence(all_consistent(headquarters)).
query(true_val(headquarters, waterbury_vt)).
query(true_val(headquarters, unk_headquarters)).

% @attr design_location
% @type categorical
% @canonical false
% @original_name Design location
% @values waterbury_vermont=Designed_in_Waterbury_Vermont unk_design_location=Unknown
% @importance 0.3

0.65::acc(s8, design_location).

0.54::true_val(design_location, waterbury_vermont); 0.46::true_val(design_location, unk_design_location).

measured(s8, design_location, waterbury_vermont).

all_consistent(design_location) :- consistent(s8, design_location).

evidence(all_consistent(design_location)).
query(true_val(design_location, waterbury_vermont)).
query(true_val(design_location, unk_design_location)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values lps_nidecker=LPS_Nidecker_Group_since_2018 unk_parent_company=Unknown
% @importance 0.4

0.75::acc(s9, parent_company).

0.68::true_val(parent_company, lps_nidecker); 0.32::true_val(parent_company, unk_parent_company).

measured(s9, parent_company, lps_nidecker).

all_consistent(parent_company) :- consistent(s9, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, lps_nidecker)).
query(true_val(parent_company, unk_parent_company)).

% @attr company_size
% @type categorical
% @canonical false
% @original_name Company size
% @values approx_20=Approximately_20_employees unk_company_size=Unknown
% @importance 0.3

0.78::acc(s10, company_size).

0.68::true_val(company_size, approx_20); 0.32::true_val(company_size, unk_company_size).

measured(s10, company_size, approx_20).

all_consistent(company_size) :- consistent(s10, company_size).

evidence(all_consistent(company_size)).
query(true_val(company_size, approx_20)).
query(true_val(company_size, unk_company_size)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_plus_one_year=2yr_limited_extendable_to_3yr unk_warranty=Unknown
% @importance 0.75

0.95::acc(s11, warranty).
0.95::acc(s12, warranty).

0.95::true_val(warranty, two_plus_one_year); 0.05::true_val(warranty, unk_warranty).

measured(s11, warranty, two_plus_one_year).
measured(s12, warranty, two_plus_one_year).

all_consistent(warranty) :- consistent(s11, warranty), consistent(s12, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_plus_one_year)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty
% @values delam_inserts_topsheet=Delamination_inserts_cracked_topsheet unk_warranty_coverage=Unknown
% @importance 0.7

0.94::acc(s13, warranty_coverage).

0.90::true_val(warranty_coverage, delam_inserts_topsheet); 0.10::true_val(warranty_coverage, unk_warranty_coverage).

measured(s13, warranty_coverage, delam_inserts_topsheet).

all_consistent(warranty_coverage) :- consistent(s13, warranty_coverage).

evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, delam_inserts_topsheet)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values d45=45_day_return_period unk_return_policy_terms=Unknown
% @importance 0.6

0.94::acc(s14, return_policy_terms).

0.90::true_val(return_policy_terms, d45); 0.10::true_val(return_policy_terms, unk_return_policy_terms).

measured(s14, return_policy_terms, d45).

all_consistent(return_policy_terms) :- consistent(s14, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, d45)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr model_first_available_year
% @type categorical
% @canonical false
% @original_name model_first_available_year
% @values season_2019_2020=2019_2020_season unk_model_first_available_year=Unknown
% @importance 0.5

0.80::acc(s15, model_first_available_year).

0.72::true_val(model_first_available_year, season_2019_2020); 0.28::true_val(model_first_available_year, unk_model_first_available_year).

measured(s15, model_first_available_year, season_2019_2020).

all_consistent(model_first_available_year) :- consistent(s15, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2019_2020)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biax_biax=Biax_Upper_Biax_Lower triax_biax=Triax_Upper_Biax_Lower
% @importance 0.88

0.78::acc(s3, laminate).
0.93::acc(s16, laminate).
0.75::acc(s17, laminate).

0.35::true_val(laminate, biax_biax); 0.65::true_val(laminate, triax_biax).

measured(s3, laminate, biax_biax).
measured(s16, laminate, triax_biax).
measured(s17, laminate, triax_biax).

all_consistent(laminate) :-
    (indep(s3), consistent(s3, laminate) ; \+indep(s3)),
    consistent(s16, laminate),
    (indep(s17), consistent(s17, laminate) ; \+indep(s17)).

evidence(all_consistent(laminate)).
query(true_val(laminate, biax_biax)).
query(true_val(laminate, triax_biax)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values twin_single_bamboo_hotrod=Twin_Single_Bamboo_HotRod unk_construction_material_innovation=Unknown
% @importance 0.85

0.78::acc(s3, construction_material_innovation).
0.93::acc(s16, construction_material_innovation).

0.95::true_val(construction_material_innovation, twin_single_bamboo_hotrod); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s3, construction_material_innovation, twin_single_bamboo_hotrod).
measured(s16, construction_material_innovation, twin_single_bamboo_hotrod).

all_consistent(construction_material_innovation) :-
    (indep(s3), consistent(s3, construction_material_innovation) ; \+indep(s3)),
    consistent(s16, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, twin_single_bamboo_hotrod)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_2024
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values directional_triple_bamboo_hotrod=Directional_Triple_Bamboo_HotRod unk_cmi_2024=Unknown
% @importance 0.7

0.70::acc(s18, construction_material_innovation_2024).
0.65::acc(s19, construction_material_innovation_2024).

0.95::true_val(construction_material_innovation_2024, directional_triple_bamboo_hotrod); 0.05::true_val(construction_material_innovation_2024, unk_cmi_2024).

measured(s18, construction_material_innovation_2024, directional_triple_bamboo_hotrod).
measured(s19, construction_material_innovation_2024, directional_triple_bamboo_hotrod).

all_consistent(construction_material_innovation_2024) :-
    consistent(s18, construction_material_innovation_2024),
    consistent(s19, construction_material_innovation_2024).

evidence(all_consistent(construction_material_innovation_2024)).
query(true_val(construction_material_innovation_2024, directional_triple_bamboo_hotrod)).
query(true_val(construction_material_innovation_2024, unk_cmi_2024)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values four_sizes=154_157_158W_161W six_sizes=151_154_157_158W_160_161W
% @importance 0.93

0.72::acc(s3, available_sizes).
0.78::acc(s21, available_sizes).
0.82::acc(s22, available_sizes).

0.15::true_val(available_sizes, four_sizes); 0.85::true_val(available_sizes, six_sizes).

measured(s3, available_sizes, four_sizes).
measured(s21, available_sizes, six_sizes).
measured(s22, available_sizes, six_sizes).

all_consistent(available_sizes) :-
    (indep(s3), consistent(s3, available_sizes) ; \+indep(s3)),
    (indep(s21), consistent(s21, available_sizes) ; \+indep(s21)),
    consistent(s22, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, four_sizes)).
query(true_val(available_sizes, six_sizes)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.93

0.94::acc(s1, shape).
0.85::acc(s4, shape).

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).

measured(s1, shape, directional_twin).
measured(s4, shape, directional_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s4), consistent(s4, shape) ; \+indep(s4)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape
% @values twin_longer_nose=Twin_contact_to_contact_longer_nose unk_shape_description=Unknown
% @importance 0.8

0.72::acc(s23, shape_description).

0.63::true_val(shape_description, twin_longer_nose); 0.37::true_val(shape_description, unk_shape_description).

measured(s23, shape_description, twin_longer_nose).

all_consistent(shape_description) :-
    (indep(s23), consistent(s23, shape_description) ; \+indep(s23)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, twin_longer_nose)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values fusion_camber=Fusion_Camber unk_camber_type=Unknown
% @importance 0.95

0.94::acc(s1, camber_type).
0.85::acc(s4, camber_type).

0.95::true_val(camber_type, fusion_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, fusion_camber).
measured(s4, camber_type, fusion_camber).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s4), consistent(s4, camber_type) ; \+indep(s4)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, fusion_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values positive_camber_rocker_tips=Positive_camber_with_rocker_nose_tail unk_camber_description=Unknown
% @importance 0.9

0.72::acc(s24, camber_description).

0.67::true_val(camber_description, positive_camber_rocker_tips); 0.33::true_val(camber_description, unk_camber_description).

measured(s24, camber_description, positive_camber_rocker_tips).

all_consistent(camber_description) :-
    (indep(s24), consistent(s24, camber_description) ; \+indep(s24)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, positive_camber_rocker_tips)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v5=5.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.95

0.94::acc(s1, flex_rating_10_manufacturer).
0.85::acc(s4, flex_rating_10_manufacturer).

0.95::true_val(flex_rating_10_manufacturer, v5); 0.05::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s1, flex_rating_10_manufacturer, v5).
measured(s4, flex_rating_10_manufacturer, v5).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s1, flex_rating_10_manufacturer),
    (indep(s4), consistent(s4, flex_rating_10_manufacturer) ; \+indep(s4)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v5)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values medium=Medium unk_flex_rating_10_evo=Unknown
% @importance 0.7

0.82::acc(s25, flex_rating_10_evo).

0.72::true_val(flex_rating_10_evo, medium); 0.28::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s25, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :-
    (indep(s25), consistent(s25, flex_rating_10_evo) ; \+indep(s25)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type numeric
% @canonical false
% @original_name flex_feel
% @unit /10
% @values v5_5=5.5 unk_flex_feel=Unknown
% @importance 0.95

0.85::acc(s22, flex_feel).

0.72::true_val(flex_feel, v5_5); 0.28::true_val(flex_feel, unk_flex_feel).

measured(s22, flex_feel, v5_5).

all_consistent(flex_feel) :- consistent(s22, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, v5_5)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr sidecut_type
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values radial=Radial_Sidecut unk_sidecut_type=Unknown
% @importance 0.93

0.94::acc(s1, sidecut_type).
0.93::acc(s16, sidecut_type).

0.95::true_val(sidecut_type, radial); 0.05::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, radial).
measured(s16, sidecut_type, radial).

all_consistent(sidecut_type) :-
    consistent(s1, sidecut_type),
    (indep(s16), consistent(s16, sidecut_type) ; \+indep(s16)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.80::acc(s3, mounting_pattern).

0.71::true_val(mounting_pattern, inserts_2x4); 0.29::true_val(mounting_pattern, unk_mounting_pattern).

measured(s3, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s3), consistent(s3, mounting_pattern) ; \+indep(s3)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values stomp_core_poplar=Stomp_Core_100pct_Poplar unk_core_material=Unknown
% @importance 0.9

0.94::acc(s1, core_material).
0.93::acc(s16, core_material).

0.95::true_val(core_material, stomp_core_poplar); 0.05::true_val(core_material, unk_core_material).

measured(s1, core_material, stomp_core_poplar).
measured(s16, core_material, stomp_core_poplar).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s16), consistent(s16, core_material) ; \+indep(s16)).

evidence(all_consistent(core_material)).
query(true_val(core_material, stomp_core_poplar)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_description
% @type categorical
% @canonical false
% @original_name core_material
% @values most_stable_predictable=Most_stable_predictable_core unk_core_material_description=Unknown
% @importance 0.8

0.70::acc(s26, core_material_description).

0.67::true_val(core_material_description, most_stable_predictable); 0.33::true_val(core_material_description, unk_core_material_description).

measured(s26, core_material_description, most_stable_predictable).

all_consistent(core_material_description) :- consistent(s26, core_material_description).

evidence(all_consistent(core_material_description)).
query(true_val(core_material_description, most_stable_predictable)).
query(true_val(core_material_description, unk_core_material_description)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values powerslide_extruded=PowerSlide_Base_extruded unk_base_type=Unknown
% @importance 0.93

0.94::acc(s1, base_type).
0.93::acc(s16, base_type).

0.95::true_val(base_type, powerslide_extruded); 0.05::true_val(base_type, unk_base_type).

measured(s1, base_type, powerslide_extruded).
measured(s16, base_type, powerslide_extruded).

all_consistent(base_type) :-
    consistent(s1, base_type),
    (indep(s16), consistent(s16, base_type) ; \+indep(s16)).

evidence(all_consistent(base_type)).
query(true_val(base_type, powerslide_extruded)).
query(true_val(base_type, unk_base_type)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values high_end_extruded=High_end_durable_extruded_base unk_base_material=Unknown
% @importance 0.75

0.84::acc(s27, base_material).

0.81::true_val(base_material, high_end_extruded); 0.19::true_val(base_material, unk_base_material).

measured(s27, base_material, high_end_extruded).

all_consistent(base_material) :-
    (indep(s27), consistent(s27, base_material) ; \+indep(s27)).

evidence(all_consistent(base_material)).
query(true_val(base_material, high_end_extruded)).
query(true_val(base_material, unk_base_material)).

% @attr base_material_properties
% @type categorical
% @canonical false
% @original_name base_material
% @values improved_wax_durability=Improved_wax_absorption_durability unk_base_material_properties=Unknown
% @importance 0.65

0.72::acc(s28, base_material_properties).

0.63::true_val(base_material_properties, improved_wax_durability); 0.37::true_val(base_material_properties, unk_base_material_properties).

measured(s28, base_material_properties, improved_wax_durability).

all_consistent(base_material_properties) :-
    (indep(s28), consistent(s28, base_material_properties) ; \+indep(s28)).

evidence(all_consistent(base_material_properties)).
query(true_val(base_material_properties, improved_wax_durability)).
query(true_val(base_material_properties, unk_base_material_properties)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 1.0

0.80::acc(s3, width_options).

0.71::true_val(width_options, standard_and_wide); 0.29::true_val(width_options, unk_width_options).

measured(s3, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(s3), consistent(s3, width_options) ; \+indep(s3)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr effective_edge_154
% @type numeric
% @canonical false
% @original_name Effective edge 154cm
% @unit cm
% @values v117_8=117.8 unk_effective_edge_154=Unknown
% @importance 1.0

0.80::acc(s3, effective_edge_154).

0.71::true_val(effective_edge_154, v117_8); 0.29::true_val(effective_edge_154, unk_effective_edge_154).

measured(s3, effective_edge_154, v117_8).

all_consistent(effective_edge_154) :-
    (indep(s3), consistent(s3, effective_edge_154) ; \+indep(s3)).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v117_8)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr effective_edge_157
% @type numeric
% @canonical false
% @original_name Effective edge 157cm
% @unit cm
% @values v120_4=120.4 unk_effective_edge_157=Unknown
% @importance 1.0

0.80::acc(s3, effective_edge_157).

0.71::true_val(effective_edge_157, v120_4); 0.29::true_val(effective_edge_157, unk_effective_edge_157).

measured(s3, effective_edge_157, v120_4).

all_consistent(effective_edge_157) :-
    (indep(s3), consistent(s3, effective_edge_157) ; \+indep(s3)).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v120_4)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr effective_edge_158w
% @type numeric
% @canonical false
% @original_name Effective edge 158W
% @unit cm
% @values v121_2=121.2 unk_effective_edge_158w=Unknown
% @importance 1.0

0.80::acc(s3, effective_edge_158w).

0.71::true_val(effective_edge_158w, v121_2); 0.29::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(s3, effective_edge_158w, v121_2).

all_consistent(effective_edge_158w) :-
    (indep(s3), consistent(s3, effective_edge_158w) ; \+indep(s3)).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v121_2)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr effective_edge_161w
% @type numeric
% @canonical false
% @original_name Effective edge 161W
% @unit cm
% @values v123_9=123.9 unk_effective_edge_161w=Unknown
% @importance 1.0

0.80::acc(s3, effective_edge_161w).

0.71::true_val(effective_edge_161w, v123_9); 0.29::true_val(effective_edge_161w, unk_effective_edge_161w).

measured(s3, effective_edge_161w, v123_9).

all_consistent(effective_edge_161w) :-
    (indep(s3), consistent(s3, effective_edge_161w) ; \+indep(s3)).

evidence(all_consistent(effective_edge_161w)).
query(true_val(effective_edge_161w, v123_9)).
query(true_val(effective_edge_161w, unk_effective_edge_161w)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width 154cm
% @unit cm
% @values v25_0=25.0 unk_waist_width_154=Unknown
% @importance 1.0

0.80::acc(s3, waist_width_154).

0.71::true_val(waist_width_154, v25_0); 0.29::true_val(waist_width_154, unk_waist_width_154).

measured(s3, waist_width_154, v25_0).

all_consistent(waist_width_154) :-
    (indep(s3), consistent(s3, waist_width_154) ; \+indep(s3)).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_0)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr waist_width_157
% @type numeric
% @canonical false
% @original_name Waist width 157cm
% @unit cm
% @values v25_2=25.2 unk_waist_width_157=Unknown
% @importance 1.0

0.80::acc(s3, waist_width_157).

0.71::true_val(waist_width_157, v25_2); 0.29::true_val(waist_width_157, unk_waist_width_157).

measured(s3, waist_width_157, v25_2).

all_consistent(waist_width_157) :-
    (indep(s3), consistent(s3, waist_width_157) ; \+indep(s3)).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_2)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr waist_width_158w
% @type numeric
% @canonical false
% @original_name Waist width 158W
% @unit cm
% @values v26_3=26.3 unk_waist_width_158w=Unknown
% @importance 1.0

0.80::acc(s3, waist_width_158w).

0.71::true_val(waist_width_158w, v26_3); 0.29::true_val(waist_width_158w, unk_waist_width_158w).

measured(s3, waist_width_158w, v26_3).

all_consistent(waist_width_158w) :-
    (indep(s3), consistent(s3, waist_width_158w) ; \+indep(s3)).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_3)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr waist_width_161w
% @type numeric
% @canonical false
% @original_name Waist width 161W
% @unit cm
% @values v26_4=26.4 unk_waist_width_161w=Unknown
% @importance 1.0

0.80::acc(s3, waist_width_161w).

0.71::true_val(waist_width_161w, v26_4); 0.29::true_val(waist_width_161w, unk_waist_width_161w).

measured(s3, waist_width_161w, v26_4).

all_consistent(waist_width_161w) :-
    (indep(s3), consistent(s3, waist_width_161w) ; \+indep(s3)).

evidence(all_consistent(waist_width_161w)).
query(true_val(waist_width_161w, v26_4)).
query(true_val(waist_width_161w, unk_waist_width_161w)).

% @attr taper
% @type numeric
% @canonical false
% @original_name taper
% @unit cm
% @values v0=0.0 unk_taper=Unknown
% @importance 1.0

0.80::acc(s3, taper).

0.71::true_val(taper, v0); 0.29::true_val(taper, unk_taper).

measured(s3, taper, v0).

all_consistent(taper) :-
    (indep(s3), consistent(s3, taper) ; \+indep(s3)).

evidence(all_consistent(taper)).
query(true_val(taper, v0)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type categorical
% @canonical false
% @original_name setback
% @values centered=Centered_reference_stance unk_setback=Unknown
% @importance 0.95

0.85::acc(s22, setback).

0.72::true_val(setback, centered); 0.28::true_val(setback, unk_setback).

measured(s22, setback, centered).

all_consistent(setback) :- consistent(s22, setback).

evidence(all_consistent(setback)).
query(true_val(setback, centered)).
query(true_val(setback, unk_setback)).

% @attr stance_width_range_size_154
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v49_3_61_3=49.3-61.3 unk_stance_width_range_size_154=Unknown
% @importance 1.0

0.80::acc(s3, stance_width_range_size_154).

0.71::true_val(stance_width_range_size_154, v49_3_61_3); 0.29::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).

measured(s3, stance_width_range_size_154, v49_3_61_3).

all_consistent(stance_width_range_size_154) :-
    (indep(s3), consistent(s3, stance_width_range_size_154) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v49_3_61_3)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values v49_3_61_3=49.3-61.3 unk_stance_width_range_size=Unknown
% @importance 1.0

0.80::acc(s3, stance_width_range_size).

0.71::true_val(stance_width_range_size, v49_3_61_3); 0.29::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s3, stance_width_range_size, v49_3_61_3).

all_consistent(stance_width_range_size) :-
    (indep(s3), consistent(s3, stance_width_range_size) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v49_3_61_3)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_158w
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v51_9_63_9=51.9-63.9 unk_stance_width_range_size_158w=Unknown
% @importance 1.0

0.80::acc(s3, stance_width_range_size_158w).

0.71::true_val(stance_width_range_size_158w, v51_9_63_9); 0.29::true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w).

measured(s3, stance_width_range_size_158w, v51_9_63_9).

all_consistent(stance_width_range_size_158w) :-
    (indep(s3), consistent(s3, stance_width_range_size_158w) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_158w)).
query(true_val(stance_width_range_size_158w, v51_9_63_9)).
query(true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w)).

% @attr stance_width_range_size_161w
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v51_9_63_9=51.9-63.9 unk_stance_width_range_size_161w=Unknown
% @importance 1.0

0.80::acc(s3, stance_width_range_size_161w).

0.71::true_val(stance_width_range_size_161w, v51_9_63_9); 0.29::true_val(stance_width_range_size_161w, unk_stance_width_range_size_161w).

measured(s3, stance_width_range_size_161w, v51_9_63_9).

all_consistent(stance_width_range_size_161w) :-
    (indep(s3), consistent(s3, stance_width_range_size_161w) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_161w)).
query(true_val(stance_width_range_size_161w, v51_9_63_9)).
query(true_val(stance_width_range_size_161w, unk_stance_width_range_size_161w)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v57_5_75_5=57.5-75.5 unk_recommended_weight_range_size_154=Unknown
% @importance 1.0

0.80::acc(s3, recommended_weight_range_size_154).

0.71::true_val(recommended_weight_range_size_154, v57_5_75_5); 0.29::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(s3, recommended_weight_range_size_154, v57_5_75_5).

all_consistent(recommended_weight_range_size_154) :-
    (indep(s3), consistent(s3, recommended_weight_range_size_154) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, v57_5_75_5)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values v62_5_81=62.5-81.0 unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.80::acc(s3, recommended_weight_range_size).

0.71::true_val(recommended_weight_range_size, v62_5_81); 0.29::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s3, recommended_weight_range_size, v62_5_81).

all_consistent(recommended_weight_range_size) :-
    (indep(s3), consistent(s3, recommended_weight_range_size) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v62_5_81)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v68_86_5=68.0-86.5 unk_recommended_weight_range_size_158w=Unknown
% @importance 1.0

0.80::acc(s3, recommended_weight_range_size_158w).

0.71::true_val(recommended_weight_range_size_158w, v68_86_5); 0.29::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s3, recommended_weight_range_size_158w, v68_86_5).

all_consistent(recommended_weight_range_size_158w) :-
    (indep(s3), consistent(s3, recommended_weight_range_size_158w) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, v68_86_5)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

% @attr recommended_weight_range_size_161w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values v76_5_94_5=76.5-94.5 unk_recommended_weight_range_size_161w=Unknown
% @importance 1.0

0.80::acc(s3, recommended_weight_range_size_161w).

0.71::true_val(recommended_weight_range_size_161w, v76_5_94_5); 0.29::true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w).

measured(s3, recommended_weight_range_size_161w, v76_5_94_5).

all_consistent(recommended_weight_range_size_161w) :-
    (indep(s3), consistent(s3, recommended_weight_range_size_161w) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_161w)).
query(true_val(recommended_weight_range_size_161w, v76_5_94_5)).
query(true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w)).

% @attr terrain_suitability_groomed
% @type numeric
% @canonical false
% @original_name terrain_suitability
% @unit /10
% @values v7=7.0 unk_terrain_suitability_groomed=Unknown
% @importance 1.0

0.80::acc(s3, terrain_suitability_groomed).

0.71::true_val(terrain_suitability_groomed, v7); 0.29::true_val(terrain_suitability_groomed, unk_terrain_suitability_groomed).

measured(s3, terrain_suitability_groomed, v7).

all_consistent(terrain_suitability_groomed) :-
    (indep(s3), consistent(s3, terrain_suitability_groomed) ; \+indep(s3)).

evidence(all_consistent(terrain_suitability_groomed)).
query(true_val(terrain_suitability_groomed, v7)).
query(true_val(terrain_suitability_groomed, unk_terrain_suitability_groomed)).

% @attr terrain_suitability_offpiste
% @type numeric
% @canonical false
% @original_name terrain_suitability
% @unit /10
% @values v6=6.0 unk_terrain_suitability_offpiste=Unknown
% @importance 1.0

0.80::acc(s3, terrain_suitability_offpiste).

0.71::true_val(terrain_suitability_offpiste, v6); 0.29::true_val(terrain_suitability_offpiste, unk_terrain_suitability_offpiste).

measured(s3, terrain_suitability_offpiste, v6).

all_consistent(terrain_suitability_offpiste) :-
    (indep(s3), consistent(s3, terrain_suitability_offpiste) ; \+indep(s3)).

evidence(all_consistent(terrain_suitability_offpiste)).
query(true_val(terrain_suitability_offpiste, v6)).
query(true_val(terrain_suitability_offpiste, unk_terrain_suitability_offpiste)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability
% @unit /10
% @values v5=5.0 unk_terrain_suitability_park=Unknown
% @importance 1.0

0.80::acc(s3, terrain_suitability_park).

0.71::true_val(terrain_suitability_park, v5); 0.29::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s3, terrain_suitability_park, v5).

all_consistent(terrain_suitability_park) :-
    (indep(s3), consistent(s3, terrain_suitability_park) ; \+indep(s3)).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v5)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v829_99=829.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.80::acc(s3, price_aud_merchant).

0.71::true_val(price_aud_merchant, v829_99); 0.29::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s3, price_aud_merchant, v829_99).

all_consistent(price_aud_merchant) :- consistent(s3, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v829_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values preorder_may_2026=Pre_order_estimated_May_2026 unk_estimated_availability_date=Unknown
% @importance 1.0

0.78::acc(s3, estimated_availability_date).

0.71::true_val(estimated_availability_date, preorder_may_2026); 0.29::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s3, estimated_availability_date, preorder_may_2026).

all_consistent(estimated_availability_date) :- consistent(s3, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, preorder_may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v469_95=469.95 v469=469.0
% @importance 0.93

0.85::acc(s29, price_usd_msrp).
0.82::acc(s22, price_usd_msrp).

0.55::true_val(price_usd_msrp, v469_95); 0.45::true_val(price_usd_msrp, v469).

measured(s29, price_usd_msrp, v469_95).
measured(s22, price_usd_msrp, v469).

all_consistent(price_usd_msrp) :-
    consistent(s29, price_usd_msrp),
    consistent(s22, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v469_95)).
query(true_val(price_usd_msrp, v469)).

% @attr price_usd_evo
% @type numeric
% @canonical false
% @original_name price_usd_evo
% @unit USD
% @values v328_96=328.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.88::acc(s30, price_usd_evo).

0.81::true_val(price_usd_evo, v328_96); 0.19::true_val(price_usd_evo, unk_price_usd_evo).

measured(s30, price_usd_evo, v328_96).

all_consistent(price_usd_evo) :- consistent(s30, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v328_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_skatepro
% @type numeric
% @canonical false
% @original_name USD price (SkatePro, 2026 model)
% @unit USD
% @values v429_95=429.95 unk_price_usd_skatepro=Unknown
% @importance 0.9

0.75::acc(s31, price_usd_skatepro).

0.63::true_val(price_usd_skatepro, v429_95); 0.37::true_val(price_usd_skatepro, unk_price_usd_skatepro).

measured(s31, price_usd_skatepro, v429_95).

all_consistent(price_usd_skatepro) :- consistent(s31, price_usd_skatepro).

evidence(all_consistent(price_usd_skatepro)).
query(true_val(price_usd_skatepro, v429_95)).
query(true_val(price_usd_skatepro, unk_price_usd_skatepro)).

% @attr availability_status_rome_direct
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out=All_sizes_sold_out unk_availability_status_rome_direct=Unknown
% @importance 0.7

0.88::acc(s32, availability_status_rome_direct).

0.78::true_val(availability_status_rome_direct, sold_out); 0.22::true_val(availability_status_rome_direct, unk_availability_status_rome_direct).

measured(s32, availability_status_rome_direct, sold_out).

all_consistent(availability_status_rome_direct) :- consistent(s32, availability_status_rome_direct).

evidence(all_consistent(availability_status_rome_direct)).
query(true_val(availability_status_rome_direct, sold_out)).
query(true_val(availability_status_rome_direct, unk_availability_status_rome_direct)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock=In_stock unk_availability_status=Unknown
% @importance 0.85

0.85::acc(s33, availability_status).

0.77::true_val(availability_status, in_stock); 0.23::true_val(availability_status, unk_availability_status).

measured(s33, availability_status, in_stock).

all_consistent(availability_status) :- consistent(s33, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available unk_availability_status_blauer=Unknown
% @importance 0.7

0.72::acc(s34, availability_status_blauer).

0.56::true_val(availability_status_blauer, available); 0.44::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s34, availability_status_blauer, available).

all_consistent(availability_status_blauer) :- consistent(s34, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr price_eur_blue_tomato
% @type categorical
% @canonical false
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v300_90_429_90=300.90-429.90 unk_price_eur_blue_tomato=Unknown
% @importance 0.7

0.65::acc(s35, price_eur_blue_tomato).

0.46::true_val(price_eur_blue_tomato, v300_90_429_90); 0.54::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s35, price_eur_blue_tomato, v300_90_429_90).

all_consistent(price_eur_blue_tomato) :- consistent(s35, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v300_90_429_90)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr available_colors
% @type categorical
% @canonical false
% @original_name available_colors
% @values random_base=Base_colours_random unk_available_colors=Unknown
% @importance 0.3

0.70::acc(s36, available_colors).

0.63::true_val(available_colors, random_base); 0.37::true_val(available_colors, unk_available_colors).

measured(s36, available_colors, random_base).

all_consistent(available_colors) :- consistent(s36, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, random_base)).
query(true_val(available_colors, unk_available_colors)).

% @attr factory_tuning
% @type categorical
% @canonical false
% @original_name Factory tuning
% @values factory_waxed_tuned=Factory_waxed_and_tuned unk_factory_tuning=Unknown
% @importance 0.35

0.65::acc(s37, factory_tuning).

0.52::true_val(factory_tuning, factory_waxed_tuned); 0.48::true_val(factory_tuning, unk_factory_tuning).

measured(s37, factory_tuning, factory_waxed_tuned).

all_consistent(factory_tuning) :- consistent(s37, factory_tuning).

evidence(all_consistent(factory_tuning)).
query(true_val(factory_tuning, factory_waxed_tuned)).
query(true_val(factory_tuning, unk_factory_tuning)).

% @attr retailer_auski
% @type categorical
% @canonical false
% @original_name Retailer
% @values auski_au=Auski_Australia unk_retailer_auski=Unknown
% @importance 1.0

0.80::acc(s3, retailer_auski).

0.71::true_val(retailer_auski, auski_au); 0.29::true_val(retailer_auski, unk_retailer_auski).

measured(s3, retailer_auski, auski_au).

all_consistent(retailer_auski) :- consistent(s3, retailer_auski).

evidence(all_consistent(retailer_auski)).
query(true_val(retailer_auski, auski_au)).
query(true_val(retailer_auski, unk_retailer_auski)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name Retailer
% @values evo_com=evo_com unk_retailer_evo=Unknown
% @importance 0.9

0.86::acc(s29, retailer_evo).
0.85::acc(s33, retailer_evo).

0.95::true_val(retailer_evo, evo_com); 0.05::true_val(retailer_evo, unk_retailer_evo).

measured(s29, retailer_evo, evo_com).
measured(s33, retailer_evo, evo_com).

all_consistent(retailer_evo) :- consistent(s29, retailer_evo), consistent(s33, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, evo_com)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_blauer
% @type categorical
% @canonical false
% @original_name Retailer
% @values blauer_board_shop=Blauer_Board_Shop unk_retailer_blauer=Unknown
% @importance 0.7

0.72::acc(s34, retailer_blauer).

0.56::true_val(retailer_blauer, blauer_board_shop); 0.44::true_val(retailer_blauer, unk_retailer_blauer).

measured(s34, retailer_blauer, blauer_board_shop).

all_consistent(retailer_blauer) :- consistent(s34, retailer_blauer).

evidence(all_consistent(retailer_blauer)).
query(true_val(retailer_blauer, blauer_board_shop)).
query(true_val(retailer_blauer, unk_retailer_blauer)).

% @attr retailer_ridge_and_river
% @type categorical
% @canonical false
% @original_name Retailer
% @values ridge_river=Ridge_and_River unk_retailer_ridge_and_river=Unknown
% @importance 0.4

0.68::acc(s38, retailer_ridge_and_river).

0.55::true_val(retailer_ridge_and_river, ridge_river); 0.45::true_val(retailer_ridge_and_river, unk_retailer_ridge_and_river).

measured(s38, retailer_ridge_and_river, ridge_river).

all_consistent(retailer_ridge_and_river) :- consistent(s38, retailer_ridge_and_river).

evidence(all_consistent(retailer_ridge_and_river)).
query(true_val(retailer_ridge_and_river, ridge_river)).
query(true_val(retailer_ridge_and_river, unk_retailer_ridge_and_river)).

% @attr retailer_skatepro
% @type categorical
% @canonical false
% @original_name Retailer
% @values skatepro=SkatePro unk_retailer_skatepro=Unknown
% @importance 0.9

0.75::acc(s31, retailer_skatepro).

0.63::true_val(retailer_skatepro, skatepro); 0.37::true_val(retailer_skatepro, unk_retailer_skatepro).

measured(s31, retailer_skatepro, skatepro).

all_consistent(retailer_skatepro) :- consistent(s31, retailer_skatepro).

evidence(all_consistent(retailer_skatepro)).
query(true_val(retailer_skatepro, skatepro)).
query(true_val(retailer_skatepro, unk_retailer_skatepro)).

% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Retailer
% @values melb_snowboard=Melbourne_Snowboard_Centre unk_retailer_melbourne_snowboard=Unknown
% @importance 0.45

0.68::acc(s39, retailer_melbourne_snowboard).

0.55::true_val(retailer_melbourne_snowboard, melb_snowboard); 0.45::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).

measured(s39, retailer_melbourne_snowboard, melb_snowboard).

all_consistent(retailer_melbourne_snowboard) :- consistent(s39, retailer_melbourne_snowboard).

evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, melb_snowboard)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

% @attr retailer_glisshop
% @type categorical
% @canonical false
% @original_name Retailer
% @values glisshop_uk=Glisshop_UK unk_retailer_glisshop=Unknown
% @importance 0.7

0.65::acc(s35, retailer_glisshop).

0.46::true_val(retailer_glisshop, glisshop_uk); 0.54::true_val(retailer_glisshop, unk_retailer_glisshop).

measured(s35, retailer_glisshop, glisshop_uk).

all_consistent(retailer_glisshop) :- consistent(s35, retailer_glisshop).

evidence(all_consistent(retailer_glisshop)).
query(true_val(retailer_glisshop, glisshop_uk)).
query(true_val(retailer_glisshop, unk_retailer_glisshop)).

% @attr retailer_amazon
% @type categorical
% @canonical false
% @original_name Retailer
% @values amazon_rome_store=Amazon_Rome_Snowboards_Store unk_retailer_amazon=Unknown
% @importance 0.5

0.72::acc(s40, retailer_amazon).

0.53::true_val(retailer_amazon, amazon_rome_store); 0.47::true_val(retailer_amazon, unk_retailer_amazon).

measured(s40, retailer_amazon, amazon_rome_store).

all_consistent(retailer_amazon) :- consistent(s40, retailer_amazon).

evidence(all_consistent(retailer_amazon)).
query(true_val(retailer_amazon, amazon_rome_store)).
query(true_val(retailer_amazon, unk_retailer_amazon)).

% @attr retailer_willis
% @type categorical
% @canonical false
% @original_name Retailer
% @values willis_ski=Willis_Ski_and_Board unk_retailer_willis=Unknown
% @importance 0.4

0.62::acc(s41, retailer_willis).

0.42::true_val(retailer_willis, willis_ski); 0.58::true_val(retailer_willis, unk_retailer_willis).

measured(s41, retailer_willis, willis_ski).

all_consistent(retailer_willis) :- consistent(s41, retailer_willis).

evidence(all_consistent(retailer_willis)).
query(true_val(retailer_willis, willis_ski)).
query(true_val(retailer_willis, unk_retailer_willis)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v87_3=87.3 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.95

0.87::acc(s22, overall_rating_snowboardingprofiles).

0.72::true_val(overall_rating_snowboardingprofiles, v87_3); 0.28::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s22, overall_rating_snowboardingprofiles, v87_3).

all_consistent(overall_rating_snowboardingprofiles) :- consistent(s22, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v87_3)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_ranking
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values tied_10th_of_32=Tied_10th_out_of_32_all_mountain_boards unk_ro_sp_ranking=Unknown
% @importance 0.9

0.85::acc(s42, reviewer_opinion_snowboardingprofiles_ranking).

0.76::true_val(reviewer_opinion_snowboardingprofiles_ranking, tied_10th_of_32); 0.24::true_val(reviewer_opinion_snowboardingprofiles_ranking, unk_ro_sp_ranking).

measured(s42, reviewer_opinion_snowboardingprofiles_ranking, tied_10th_of_32).

all_consistent(reviewer_opinion_snowboardingprofiles_ranking) :- consistent(s42, reviewer_opinion_snowboardingprofiles_ranking).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_ranking)).
query(true_val(reviewer_opinion_snowboardingprofiles_ranking, tied_10th_of_32)).
query(true_val(reviewer_opinion_snowboardingprofiles_ranking, unk_ro_sp_ranking)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_mercury_ns_trooper_lt_tw=CAPiTA_Mercury_NS_Trooper_LT_Terrain_Wrecker unk_comparable_board_cross_brand=Unknown
% @importance 0.9

0.85::acc(s42, comparable_board_cross_brand).

0.76::true_val(comparable_board_cross_brand, capita_mercury_ns_trooper_lt_tw); 0.24::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s42, comparable_board_cross_brand, capita_mercury_ns_trooper_lt_tw).

all_consistent(comparable_board_cross_brand) :- consistent(s42, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_mercury_ns_trooper_lt_tw)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr avg_am_board_score
% @type numeric
% @canonical false
% @original_name Average all-mountain board score
% @unit /100
% @values v84_6=84.6 unk_avg_am_board_score=Unknown
% @importance 0.95

0.85::acc(s22, avg_am_board_score).

0.72::true_val(avg_am_board_score, v84_6); 0.28::true_val(avg_am_board_score, unk_avg_am_board_score).

measured(s22, avg_am_board_score, v84_6).

all_consistent(avg_am_board_score) :- consistent(s22, avg_am_board_score).

evidence(all_consistent(avg_am_board_score)).
query(true_val(avg_am_board_score, v84_6)).
query(true_val(avg_am_board_score, unk_avg_am_board_score)).

% @attr avg_am_board_price
% @type numeric
% @canonical false
% @original_name Average all-mountain board price
% @unit USD
% @values v572=572.0 unk_avg_am_board_price=Unknown
% @importance 0.95

0.85::acc(s22, avg_am_board_price).

0.72::true_val(avg_am_board_price, v572); 0.28::true_val(avg_am_board_price, unk_avg_am_board_price).

measured(s22, avg_am_board_price, v572).

all_consistent(avg_am_board_price) :- consistent(s22, avg_am_board_price).

evidence(all_consistent(avg_am_board_price)).
query(true_val(avg_am_board_price, v572)).
query(true_val(avg_am_board_price, unk_avg_am_board_price)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values predictable_confidence_inspiring=Easy_going_predictable_confidence_inspiring unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.85

0.85::acc(s43, reviewer_opinion_snowboardingprofiles).

0.76::true_val(reviewer_opinion_snowboardingprofiles, predictable_confidence_inspiring); 0.24::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s43, reviewer_opinion_snowboardingprofiles, predictable_confidence_inspiring).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s43, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, predictable_confidence_inspiring)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr powder_rating_tgr
% @type categorical
% @canonical false
% @original_name powder_rating_tgr
% @values nightmare_low_angle=Low_angle_powder_nightmare unk_powder_rating_tgr=Unknown
% @importance 0.85

0.78::acc(s44, powder_rating_tgr).

0.64::true_val(powder_rating_tgr, nightmare_low_angle); 0.36::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s44, powder_rating_tgr, nightmare_low_angle).

all_consistent(powder_rating_tgr) :- consistent(s44, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, nightmare_low_angle)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values really_competent=Really_competent_good_edge_hold unk_edge_hold=Unknown
% @importance 0.85

0.82::acc(s45, edge_hold).
0.85::acc(s75, edge_hold).

0.95::true_val(edge_hold, really_competent); 0.05::true_val(edge_hold, unk_edge_hold).

measured(s45, edge_hold, really_competent).
measured(s75, edge_hold, really_competent).

all_consistent(edge_hold) :- consistent(s45, edge_hold), consistent(s75, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, really_competent)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values legit_ollie_power=Pops_way_harder_than_expected_legit_ollie unk_pop=Unknown
% @importance 0.75

0.78::acc(s46, pop).

0.68::true_val(pop, legit_ollie_power); 0.32::true_val(pop, unk_pop).

measured(s46, pop, legit_ollie_power).

all_consistent(pop) :- consistent(s46, pop).

evidence(all_consistent(pop)).
query(true_val(pop, legit_ollie_power)).
query(true_val(pop, unk_pop)).

% @attr speed_rating_tgr
% @type categorical
% @canonical false
% @original_name speed_rating_tgr
% @values stable_no_chatter_slow_glide=Stable_at_speed_no_chatter_base_lacks_glide unk_speed_rating_tgr=Unknown
% @importance 0.8

0.78::acc(s47, speed_rating_tgr).

0.68::true_val(speed_rating_tgr, stable_no_chatter_slow_glide); 0.32::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s47, speed_rating_tgr, stable_no_chatter_slow_glide).

all_consistent(speed_rating_tgr) :- consistent(s47, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, stable_no_chatter_slow_glide)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values quick_comes_alive=Quick_turn_initiation_comes_alive_on_edge unk_turn_initiation_performance=Unknown
% @importance 0.83

0.80::acc(s48, turn_initiation_performance).
0.85::acc(s50, turn_initiation_performance).

0.95::true_val(turn_initiation_performance, quick_comes_alive); 0.05::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s48, turn_initiation_performance, quick_comes_alive).
measured(s50, turn_initiation_performance, quick_comes_alive).

all_consistent(turn_initiation_performance) :-
    consistent(s48, turn_initiation_performance),
    consistent(s50, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, quick_comes_alive)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values fun_rides_above_price=Fun_board_rides_better_than_price_suggests unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.80::acc(s49, reviewer_opinion_the_good_ride).

0.68::true_val(reviewer_opinion_the_good_ride, fun_rides_above_price); 0.32::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s49, reviewer_opinion_the_good_ride, fun_rides_above_price).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s49, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, fun_rides_above_price)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_snowboardingprofiles_catch_risk
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values very_little=Very_little_catch_risk unk_ro_sp_catch_risk=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_catch_risk).

0.72::true_val(reviewer_opinion_snowboardingprofiles_catch_risk, very_little); 0.28::true_val(reviewer_opinion_snowboardingprofiles_catch_risk, unk_ro_sp_catch_risk).

measured(s22, reviewer_opinion_snowboardingprofiles_catch_risk, very_little).

all_consistent(reviewer_opinion_snowboardingprofiles_catch_risk) :- consistent(s22, reviewer_opinion_snowboardingprofiles_catch_risk).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_catch_risk)).
query(true_val(reviewer_opinion_snowboardingprofiles_catch_risk, very_little)).
query(true_val(reviewer_opinion_snowboardingprofiles_catch_risk, unk_ro_sp_catch_risk)).

% @attr carving_score_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name carving_score_snowboardingprofiles
% @values decent_great_to_learn=Decent_carver_great_to_learn_carving unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.95

0.85::acc(s22, carving_score_snowboardingprofiles).

0.72::true_val(carving_score_snowboardingprofiles, decent_great_to_learn); 0.28::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s22, carving_score_snowboardingprofiles, decent_great_to_learn).

all_consistent(carving_score_snowboardingprofiles) :- consistent(s22, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, decent_great_to_learn)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_speed
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values better_mod_fast=Better_at_moderately_fast_than_really_fast unk_ro_sp_speed=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_speed).

0.72::true_val(reviewer_opinion_snowboardingprofiles_speed, better_mod_fast); 0.28::true_val(reviewer_opinion_snowboardingprofiles_speed, unk_ro_sp_speed).

measured(s22, reviewer_opinion_snowboardingprofiles_speed, better_mod_fast).

all_consistent(reviewer_opinion_snowboardingprofiles_speed) :- consistent(s22, reviewer_opinion_snowboardingprofiles_speed).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_speed)).
query(true_val(reviewer_opinion_snowboardingprofiles_speed, better_mod_fast)).
query(true_val(reviewer_opinion_snowboardingprofiles_speed, unk_ro_sp_speed)).

% @attr reviewer_opinion_snowboardingprofiles_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values heavier_than_normal=Felt_heavier_than_normal unk_ro_sp_weight=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_weight).

0.72::true_val(reviewer_opinion_snowboardingprofiles_weight, heavier_than_normal); 0.28::true_val(reviewer_opinion_snowboardingprofiles_weight, unk_ro_sp_weight).

measured(s22, reviewer_opinion_snowboardingprofiles_weight, heavier_than_normal).

all_consistent(reviewer_opinion_snowboardingprofiles_weight) :- consistent(s22, reviewer_opinion_snowboardingprofiles_weight).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_weight)).
query(true_val(reviewer_opinion_snowboardingprofiles_weight, heavier_than_normal)).
query(true_val(reviewer_opinion_snowboardingprofiles_weight, unk_ro_sp_weight)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit g
% @values v3240=3240.0 unk_board_weight_grams=Unknown
% @importance 0.95

0.88::acc(s22, board_weight_grams).

0.72::true_val(board_weight_grams, v3240); 0.28::true_val(board_weight_grams, unk_board_weight_grams).

measured(s22, board_weight_grams, v3240).

all_consistent(board_weight_grams) :- consistent(s22, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3240)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @canonical false
% @original_name weight_per_cm
% @unit g/cm
% @values v20_51=20.51 unk_weight_per_cm=Unknown
% @importance 0.95

0.87::acc(s22, weight_per_cm).

0.72::true_val(weight_per_cm, v20_51); 0.28::true_val(weight_per_cm, unk_weight_per_cm).

measured(s22, weight_per_cm, v20_51).

all_consistent(weight_per_cm) :- consistent(s22, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v20_51)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr reviewer_opinion_snowboardingprofiles_dampness
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @unit /10
% @values v6=6.0 unk_ro_sp_dampness=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_dampness).

0.72::true_val(reviewer_opinion_snowboardingprofiles_dampness, v6); 0.28::true_val(reviewer_opinion_snowboardingprofiles_dampness, unk_ro_sp_dampness).

measured(s22, reviewer_opinion_snowboardingprofiles_dampness, v6).

all_consistent(reviewer_opinion_snowboardingprofiles_dampness) :- consistent(s22, reviewer_opinion_snowboardingprofiles_dampness).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_dampness)).
query(true_val(reviewer_opinion_snowboardingprofiles_dampness, v6)).
query(true_val(reviewer_opinion_snowboardingprofiles_dampness, unk_ro_sp_dampness)).

% @attr reviewer_opinion_snowboardingprofiles_responsiveness
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @unit /10
% @values v5=5.0 unk_ro_sp_responsiveness=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_responsiveness).

0.72::true_val(reviewer_opinion_snowboardingprofiles_responsiveness, v5); 0.28::true_val(reviewer_opinion_snowboardingprofiles_responsiveness, unk_ro_sp_responsiveness).

measured(s22, reviewer_opinion_snowboardingprofiles_responsiveness, v5).

all_consistent(reviewer_opinion_snowboardingprofiles_responsiveness) :- consistent(s22, reviewer_opinion_snowboardingprofiles_responsiveness).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_responsiveness)).
query(true_val(reviewer_opinion_snowboardingprofiles_responsiveness, v5)).
query(true_val(reviewer_opinion_snowboardingprofiles_responsiveness, unk_ro_sp_responsiveness)).

% @attr reviewer_opinion_snowboardingprofiles_playfulness
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @unit /10
% @values v5=5.0 unk_ro_sp_playfulness=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_playfulness).

0.72::true_val(reviewer_opinion_snowboardingprofiles_playfulness, v5); 0.28::true_val(reviewer_opinion_snowboardingprofiles_playfulness, unk_ro_sp_playfulness).

measured(s22, reviewer_opinion_snowboardingprofiles_playfulness, v5).

all_consistent(reviewer_opinion_snowboardingprofiles_playfulness) :- consistent(s22, reviewer_opinion_snowboardingprofiles_playfulness).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_playfulness)).
query(true_val(reviewer_opinion_snowboardingprofiles_playfulness, v5)).
query(true_val(reviewer_opinion_snowboardingprofiles_playfulness, unk_ro_sp_playfulness)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values bang_for_buck=Unbelievable_bang_for_buck unk_reviewer_opinion_whitelines=Unknown
% @importance 0.8

0.82::acc(s51, reviewer_opinion_whitelines).

0.68::true_val(reviewer_opinion_whitelines, bang_for_buck); 0.32::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s51, reviewer_opinion_whitelines, bang_for_buck).

all_consistent(reviewer_opinion_whitelines) :- consistent(s51, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, bang_for_buck)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr comparable_board_cross_brand_whitelines
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_custom_capita_osl=Burton_Custom_Capita_Outerspace_Living unk_comparable_whitelines=Unknown
% @importance 0.85

0.82::acc(s52, comparable_board_cross_brand_whitelines).

0.68::true_val(comparable_board_cross_brand_whitelines, burton_custom_capita_osl); 0.32::true_val(comparable_board_cross_brand_whitelines, unk_comparable_whitelines).

measured(s52, comparable_board_cross_brand_whitelines, burton_custom_capita_osl).

all_consistent(comparable_board_cross_brand_whitelines) :- consistent(s52, comparable_board_cross_brand_whitelines).

evidence(all_consistent(comparable_board_cross_brand_whitelines)).
query(true_val(comparable_board_cross_brand_whitelines, burton_custom_capita_osl)).
query(true_val(comparable_board_cross_brand_whitelines, unk_comparable_whitelines)).

% @attr reviewer_opinion_whitelines_recommendation
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values beginners_intermediates_consider=Beginners_intermediates_should_consider unk_ro_wl_rec=Unknown
% @importance 0.85

0.82::acc(s53, reviewer_opinion_whitelines_recommendation).

0.72::true_val(reviewer_opinion_whitelines_recommendation, beginners_intermediates_consider); 0.28::true_val(reviewer_opinion_whitelines_recommendation, unk_ro_wl_rec).

measured(s53, reviewer_opinion_whitelines_recommendation, beginners_intermediates_consider).

all_consistent(reviewer_opinion_whitelines_recommendation) :- consistent(s53, reviewer_opinion_whitelines_recommendation).

evidence(all_consistent(reviewer_opinion_whitelines_recommendation)).
query(true_val(reviewer_opinion_whitelines_recommendation, beginners_intermediates_consider)).
query(true_val(reviewer_opinion_whitelines_recommendation, unk_ro_wl_rec)).

% @attr manufacturer_site_review_count
% @type numeric
% @canonical false
% @original_name Manufacturer site review count
% @values v19=19.0 unk_manufacturer_site_review_count=Unknown
% @importance 0.7

0.70::acc(s54, manufacturer_site_review_count).

0.54::true_val(manufacturer_site_review_count, v19); 0.46::true_val(manufacturer_site_review_count, unk_manufacturer_site_review_count).

measured(s54, manufacturer_site_review_count, v19).

all_consistent(manufacturer_site_review_count) :- consistent(s54, manufacturer_site_review_count).

evidence(all_consistent(manufacturer_site_review_count)).
query(true_val(manufacturer_site_review_count, v19)).
query(true_val(manufacturer_site_review_count, unk_manufacturer_site_review_count)).

% @attr manufacturer_site_5star_pct
% @type numeric
% @canonical false
% @original_name Manufacturer site 5-star percentage
% @unit %
% @values v89=89.0 unk_manufacturer_site_5star_pct=Unknown
% @importance 0.7

0.70::acc(s54, manufacturer_site_5star_pct).

0.54::true_val(manufacturer_site_5star_pct, v89); 0.46::true_val(manufacturer_site_5star_pct, unk_manufacturer_site_5star_pct).

measured(s54, manufacturer_site_5star_pct, v89).

all_consistent(manufacturer_site_5star_pct) :- consistent(s54, manufacturer_site_5star_pct).

evidence(all_consistent(manufacturer_site_5star_pct)).
query(true_val(manufacturer_site_5star_pct, v89)).
query(true_val(manufacturer_site_5star_pct, unk_manufacturer_site_5star_pct)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values versatility=Versatile_responsive_playful_great_pop unk_positive_aspect=Unknown
% @importance 0.65

0.70::acc(s55, positive_aspect).

0.38::true_val(positive_aspect, versatility); 0.62::true_val(positive_aspect, unk_positive_aspect).

measured(s55, positive_aspect, versatility).

all_consistent(positive_aspect) :- consistent(s55, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, versatility)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_progression
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values progression=Awesome_for_intermediate_looking_to_progress unk_positive_aspect_progression=Unknown
% @importance 0.65

0.70::acc(s56, positive_aspect_progression).

0.38::true_val(positive_aspect_progression, progression); 0.62::true_val(positive_aspect_progression, unk_positive_aspect_progression).

measured(s56, positive_aspect_progression, progression).

all_consistent(positive_aspect_progression) :- consistent(s56, positive_aspect_progression).

evidence(all_consistent(positive_aspect_progression)).
query(true_val(positive_aspect_progression, progression)).
query(true_val(positive_aspect_progression, unk_positive_aspect_progression)).

% @attr positive_aspect_catch
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values not_catchy=Not_catchy_despite_camber unk_positive_aspect_catch=Unknown
% @importance 0.75

0.70::acc(s57, positive_aspect_catch).

0.38::true_val(positive_aspect_catch, not_catchy); 0.62::true_val(positive_aspect_catch, unk_positive_aspect_catch).

measured(s57, positive_aspect_catch, not_catchy).

all_consistent(positive_aspect_catch) :- consistent(s57, positive_aspect_catch).

evidence(all_consistent(positive_aspect_catch)).
query(true_val(positive_aspect_catch, not_catchy)).
query(true_val(positive_aspect_catch, unk_positive_aspect_catch)).

% @attr positive_aspect_low_speed
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values great_low_speed=Great_at_low_speed unk_positive_aspect_low_speed=Unknown
% @importance 0.55

0.70::acc(s58, positive_aspect_low_speed).

0.38::true_val(positive_aspect_low_speed, great_low_speed); 0.62::true_val(positive_aspect_low_speed, unk_positive_aspect_low_speed).

measured(s58, positive_aspect_low_speed, great_low_speed).

all_consistent(positive_aspect_low_speed) :- consistent(s58, positive_aspect_low_speed).

evidence(all_consistent(positive_aspect_low_speed)).
query(true_val(positive_aspect_low_speed, great_low_speed)).
query(true_val(positive_aspect_low_speed, unk_positive_aspect_low_speed)).

% @attr positive_aspect_conditions
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values poppy_various_conditions=Poppy_great_in_various_snow_conditions unk_positive_aspect_conditions=Unknown
% @importance 0.7

0.70::acc(s59, positive_aspect_conditions).

0.38::true_val(positive_aspect_conditions, poppy_various_conditions); 0.62::true_val(positive_aspect_conditions, unk_positive_aspect_conditions).

measured(s59, positive_aspect_conditions, poppy_various_conditions).

all_consistent(positive_aspect_conditions) :- consistent(s59, positive_aspect_conditions).

evidence(all_consistent(positive_aspect_conditions)).
query(true_val(positive_aspect_conditions, poppy_various_conditions)).
query(true_val(positive_aspect_conditions, unk_positive_aspect_conditions)).

% @attr negative_aspect_cosmetic
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values topsheet_peeling=Topsheet_graphics_peeling_edges unk_negative_aspect_cosmetic=Unknown
% @importance 0.55

0.70::acc(s60, negative_aspect_cosmetic).

0.41::true_val(negative_aspect_cosmetic, topsheet_peeling); 0.59::true_val(negative_aspect_cosmetic, unk_negative_aspect_cosmetic).

measured(s60, negative_aspect_cosmetic, topsheet_peeling).

all_consistent(negative_aspect_cosmetic) :- consistent(s60, negative_aspect_cosmetic).

evidence(all_consistent(negative_aspect_cosmetic)).
query(true_val(negative_aspect_cosmetic, topsheet_peeling)).
query(true_val(negative_aspect_cosmetic, unk_negative_aspect_cosmetic)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values delamination_2024=Delamination_on_2024_model_warranty_replaced unk_negative_aspect=Unknown
% @importance 0.8

0.70::acc(s61, negative_aspect).

0.41::true_val(negative_aspect, delamination_2024); 0.59::true_val(negative_aspect, unk_negative_aspect).

measured(s61, negative_aspect, delamination_2024).

all_consistent(negative_aspect) :- consistent(s61, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, delamination_2024)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr positive_aspect_customer_service
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values awesome_cs=Awesome_customer_service_warranty_replacement unk_positive_aspect_customer_service=Unknown
% @importance 0.65

0.70::acc(s62, positive_aspect_customer_service).

0.38::true_val(positive_aspect_customer_service, awesome_cs); 0.62::true_val(positive_aspect_customer_service, unk_positive_aspect_customer_service).

measured(s62, positive_aspect_customer_service, awesome_cs).

all_consistent(positive_aspect_customer_service) :- consistent(s62, positive_aspect_customer_service).

evidence(all_consistent(positive_aspect_customer_service)).
query(true_val(positive_aspect_customer_service, awesome_cs)).
query(true_val(positive_aspect_customer_service, unk_positive_aspect_customer_service)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values warden_downgraded_freaker=Warden_is_downgraded_Freaker_same_shape_softer unk_user_review_forum=Unknown
% @importance 0.6

0.62::acc(s63, user_review_forum).

0.32::true_val(user_review_forum, warden_downgraded_freaker); 0.68::true_val(user_review_forum, unk_user_review_forum).

measured(s63, user_review_forum, warden_downgraded_freaker).

all_consistent(user_review_forum) :- consistent(s63, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, warden_downgraded_freaker)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_durability
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values elite_durability=Rome_durability_elite_vs_other_brands unk_user_review_forum_durability=Unknown
% @importance 0.7

0.55::acc(s64, user_review_forum_durability).

0.26::true_val(user_review_forum_durability, elite_durability); 0.74::true_val(user_review_forum_durability, unk_user_review_forum_durability).

measured(s64, user_review_forum_durability, elite_durability).

all_consistent(user_review_forum_durability) :- consistent(s64, user_review_forum_durability).

evidence(all_consistent(user_review_forum_durability)).
query(true_val(user_review_forum_durability, elite_durability)).
query(true_val(user_review_forum_durability, unk_user_review_forum_durability)).

% @attr user_review_forum_unforgiving
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values unforgiving_slow=Unforgiving_at_slow_speeds_camber_torsion unk_user_review_forum_unforgiving=Unknown
% @importance 0.75

0.55::acc(s65, user_review_forum_unforgiving).

0.28::true_val(user_review_forum_unforgiving, unforgiving_slow); 0.72::true_val(user_review_forum_unforgiving, unk_user_review_forum_unforgiving).

measured(s65, user_review_forum_unforgiving, unforgiving_slow).

all_consistent(user_review_forum_unforgiving) :- consistent(s65, user_review_forum_unforgiving).

evidence(all_consistent(user_review_forum_unforgiving)).
query(true_val(user_review_forum_unforgiving, unforgiving_slow)).
query(true_val(user_review_forum_unforgiving, unk_user_review_forum_unforgiving)).

% @attr user_review_forum_quiver
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values pair_with_service_dog=Warden_AM_plus_Service_Dog_powder_quiver unk_user_review_forum_quiver=Unknown
% @importance 0.65

0.68::acc(s55, user_review_forum_quiver).

0.38::true_val(user_review_forum_quiver, pair_with_service_dog); 0.62::true_val(user_review_forum_quiver, unk_user_review_forum_quiver).

measured(s55, user_review_forum_quiver, pair_with_service_dog).

all_consistent(user_review_forum_quiver) :- consistent(s55, user_review_forum_quiver).

evidence(all_consistent(user_review_forum_quiver)).
query(true_val(user_review_forum_quiver, pair_with_service_dog)).
query(true_val(user_review_forum_quiver, unk_user_review_forum_quiver)).

% @attr comparable_board_cross_brand_tgr
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values korua_otto_endeavor_pioneer=Korua_Otto_Endeavor_Pioneer unk_comparable_tgr=Unknown
% @importance 0.8

0.78::acc(s66, comparable_board_cross_brand_tgr).

0.68::true_val(comparable_board_cross_brand_tgr, korua_otto_endeavor_pioneer); 0.32::true_val(comparable_board_cross_brand_tgr, unk_comparable_tgr).

measured(s66, comparable_board_cross_brand_tgr, korua_otto_endeavor_pioneer).

all_consistent(comparable_board_cross_brand_tgr) :- consistent(s66, comparable_board_cross_brand_tgr).

evidence(all_consistent(comparable_board_cross_brand_tgr)).
query(true_val(comparable_board_cross_brand_tgr, korua_otto_endeavor_pioneer)).
query(true_val(comparable_board_cross_brand_tgr, unk_comparable_tgr)).

% @attr comparable_board_cross_brand_tgr_alt
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values yes_typo_jones_frontier_ride_wildlife=Yes_Typo_Jones_Frontier_Ride_Wild_Life unk_comparable_tgr_alt=Unknown
% @importance 0.8

0.76::acc(s67, comparable_board_cross_brand_tgr_alt).

0.64::true_val(comparable_board_cross_brand_tgr_alt, yes_typo_jones_frontier_ride_wildlife); 0.36::true_val(comparable_board_cross_brand_tgr_alt, unk_comparable_tgr_alt).

measured(s67, comparable_board_cross_brand_tgr_alt, yes_typo_jones_frontier_ride_wildlife).

all_consistent(comparable_board_cross_brand_tgr_alt) :- consistent(s67, comparable_board_cross_brand_tgr_alt).

evidence(all_consistent(comparable_board_cross_brand_tgr_alt)).
query(true_val(comparable_board_cross_brand_tgr_alt, yes_typo_jones_frontier_ride_wildlife)).
query(true_val(comparable_board_cross_brand_tgr_alt, unk_comparable_tgr_alt)).

% @attr comparable_board_cross_brand_top_ranked_1_4
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values slash_atv_yes_standard_gnu_fb_burton_custom=Slash_ATV_Yes_Standard_GNU_FB_4x4_Burton_Custom unk_comparable_top14=Unknown
% @importance 0.9

0.85::acc(s42, comparable_board_cross_brand_top_ranked_1_4).

0.76::true_val(comparable_board_cross_brand_top_ranked_1_4, slash_atv_yes_standard_gnu_fb_burton_custom); 0.24::true_val(comparable_board_cross_brand_top_ranked_1_4, unk_comparable_top14).

measured(s42, comparable_board_cross_brand_top_ranked_1_4, slash_atv_yes_standard_gnu_fb_burton_custom).

all_consistent(comparable_board_cross_brand_top_ranked_1_4) :- consistent(s42, comparable_board_cross_brand_top_ranked_1_4).

evidence(all_consistent(comparable_board_cross_brand_top_ranked_1_4)).
query(true_val(comparable_board_cross_brand_top_ranked_1_4, slash_atv_yes_standard_gnu_fb_burton_custom)).
query(true_val(comparable_board_cross_brand_top_ranked_1_4, unk_comparable_top14)).

% @attr comparable_board_cross_brand_top_ranked_5_6
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_mt_twin_bataleon_goliath=Jones_Mountain_Twin_Bataleon_Goliath_Plus unk_comparable_top56=Unknown
% @importance 0.9

0.85::acc(s42, comparable_board_cross_brand_top_ranked_5_6).

0.76::true_val(comparable_board_cross_brand_top_ranked_5_6, jones_mt_twin_bataleon_goliath); 0.24::true_val(comparable_board_cross_brand_top_ranked_5_6, unk_comparable_top56).

measured(s42, comparable_board_cross_brand_top_ranked_5_6, jones_mt_twin_bataleon_goliath).

all_consistent(comparable_board_cross_brand_top_ranked_5_6) :- consistent(s42, comparable_board_cross_brand_top_ranked_5_6).

evidence(all_consistent(comparable_board_cross_brand_top_ranked_5_6)).
query(true_val(comparable_board_cross_brand_top_ranked_5_6, jones_mt_twin_bataleon_goliath)).
query(true_val(comparable_board_cross_brand_top_ranked_5_6, unk_comparable_top56)).

% @attr comparable_board_cross_brand_burton_process
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_process_fv=Burton_Process_Flying_V_softer_more_playful unk_comparable_bp=Unknown
% @importance 0.65

0.72::acc(s68, comparable_board_cross_brand_burton_process).

0.53::true_val(comparable_board_cross_brand_burton_process, burton_process_fv); 0.47::true_val(comparable_board_cross_brand_burton_process, unk_comparable_bp).

measured(s68, comparable_board_cross_brand_burton_process, burton_process_fv).

all_consistent(comparable_board_cross_brand_burton_process) :- consistent(s68, comparable_board_cross_brand_burton_process).

evidence(all_consistent(comparable_board_cross_brand_burton_process)).
query(true_val(comparable_board_cross_brand_burton_process, burton_process_fv)).
query(true_val(comparable_board_cross_brand_burton_process, unk_comparable_bp)).

% @attr reviewer_opinion_snowboardingprofiles_value
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values cheapest_top10=Cheapest_on_SP_top10_well_below_avg_price unk_ro_sp_value=Unknown
% @importance 0.93

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_value).
0.85::acc(s42, reviewer_opinion_snowboardingprofiles_value).

0.95::true_val(reviewer_opinion_snowboardingprofiles_value, cheapest_top10); 0.05::true_val(reviewer_opinion_snowboardingprofiles_value, unk_ro_sp_value).

measured(s22, reviewer_opinion_snowboardingprofiles_value, cheapest_top10).
measured(s42, reviewer_opinion_snowboardingprofiles_value, cheapest_top10).

all_consistent(reviewer_opinion_snowboardingprofiles_value) :-
    consistent(s22, reviewer_opinion_snowboardingprofiles_value),
    consistent(s42, reviewer_opinion_snowboardingprofiles_value).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_value)).
query(true_val(reviewer_opinion_snowboardingprofiles_value, cheapest_top10)).
query(true_val(reviewer_opinion_snowboardingprofiles_value, unk_ro_sp_value)).

% @attr reviewer_opinion_snowboardingprofiles_progression
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values grow_progress=Something_to_grow_and_progress_with unk_ro_sp_progression=Unknown
% @importance 0.85

0.85::acc(s69, reviewer_opinion_snowboardingprofiles_progression).

0.72::true_val(reviewer_opinion_snowboardingprofiles_progression, grow_progress); 0.28::true_val(reviewer_opinion_snowboardingprofiles_progression, unk_ro_sp_progression).

measured(s69, reviewer_opinion_snowboardingprofiles_progression, grow_progress).

all_consistent(reviewer_opinion_snowboardingprofiles_progression) :- consistent(s69, reviewer_opinion_snowboardingprofiles_progression).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_progression)).
query(true_val(reviewer_opinion_snowboardingprofiles_progression, grow_progress)).
query(true_val(reviewer_opinion_snowboardingprofiles_progression, unk_ro_sp_progression)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_to_advanced_quiver_killer unk_skill_level_recommendation=Unknown
% @importance 0.9

0.85::acc(s70, skill_level_recommendation).

0.76::true_val(skill_level_recommendation, intermediate_advanced); 0.24::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s70, skill_level_recommendation, intermediate_advanced).

all_consistent(skill_level_recommendation) :- consistent(s70, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr skill_level_recommendation_blauer
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values intermediate_past_beginner=Intermediate_past_beginner_versatile_AM unk_skill_level_recommendation_blauer=Unknown
% @importance 0.85

0.72::acc(s71, skill_level_recommendation_blauer).

0.63::true_val(skill_level_recommendation_blauer, intermediate_past_beginner); 0.37::true_val(skill_level_recommendation_blauer, unk_skill_level_recommendation_blauer).

measured(s71, skill_level_recommendation_blauer, intermediate_past_beginner).

all_consistent(skill_level_recommendation_blauer) :- consistent(s71, skill_level_recommendation_blauer).

evidence(all_consistent(skill_level_recommendation_blauer)).
query(true_val(skill_level_recommendation_blauer, intermediate_past_beginner)).
query(true_val(skill_level_recommendation_blauer, unk_skill_level_recommendation_blauer)).

% @attr redesign_year_2026
% @type categorical
% @canonical false
% @original_name redesign_year
% @values graphics_only=Only_graphics_changed_2025_to_2026 unk_redesign_year_2026=Unknown
% @importance 0.7

0.75::acc(s72, redesign_year_2026).

0.67::true_val(redesign_year_2026, graphics_only); 0.33::true_val(redesign_year_2026, unk_redesign_year_2026).

measured(s72, redesign_year_2026, graphics_only).

all_consistent(redesign_year_2026) :- consistent(s72, redesign_year_2026).

evidence(all_consistent(redesign_year_2026)).
query(true_val(redesign_year_2026, graphics_only)).
query(true_val(redesign_year_2026, unk_redesign_year_2026)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values shape_change_2025=New_shape_Twin_Single_HotRod_2025 unk_redesign_year=Unknown
% @importance 0.65

0.68::acc(s20, redesign_year).
0.70::acc(s73, redesign_year).

0.95::true_val(redesign_year, shape_change_2025); 0.05::true_val(redesign_year, unk_redesign_year).

measured(s20, redesign_year, shape_change_2025).
measured(s73, redesign_year, shape_change_2025).

all_consistent(redesign_year) :-
    consistent(s20, redesign_year),
    consistent(s73, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, shape_change_2025)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values all_mountain_versatile=All_mountain_versatile unk_riding_style=Unknown
% @importance 1.0

0.80::acc(s3, riding_style).

0.71::true_val(riding_style, all_mountain_versatile); 0.29::true_val(riding_style, unk_riding_style).

measured(s3, riding_style, all_mountain_versatile).

all_consistent(riding_style) :-
    (indep(s3), consistent(s3, riding_style) ; \+indep(s3)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mountain_versatile)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values groomed_offpiste_am=Groomed_runs_off_piste_all_mountain unk_terrain_suitability=Unknown
% @importance 1.0

0.80::acc(s3, terrain_suitability).

0.71::true_val(terrain_suitability, groomed_offpiste_am); 0.29::true_val(terrain_suitability, unk_terrain_suitability).

measured(s3, terrain_suitability, groomed_offpiste_am).

all_consistent(terrain_suitability) :-
    (indep(s3), consistent(s3, terrain_suitability) ; \+indep(s3)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, groomed_offpiste_am)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr skill_level_recommendation_manufacturer
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values smooth_ride_push_comfort=Riders_wanting_smooth_ride_push_comfort_zones unk_skill_level_recommendation_manufacturer=Unknown
% @importance 0.7

0.78::acc(s74, skill_level_recommendation_manufacturer).

0.63::true_val(skill_level_recommendation_manufacturer, smooth_ride_push_comfort); 0.37::true_val(skill_level_recommendation_manufacturer, unk_skill_level_recommendation_manufacturer).

measured(s74, skill_level_recommendation_manufacturer, smooth_ride_push_comfort).

all_consistent(skill_level_recommendation_manufacturer) :- consistent(s74, skill_level_recommendation_manufacturer).

evidence(all_consistent(skill_level_recommendation_manufacturer)).
query(true_val(skill_level_recommendation_manufacturer, smooth_ride_push_comfort)).
query(true_val(skill_level_recommendation_manufacturer, unk_skill_level_recommendation_manufacturer)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values good_centered=Good_centered_stance_easy_transitions unk_switch_riding=Unknown
% @importance 0.95

0.85::acc(s22, switch_riding).

0.72::true_val(switch_riding, good_centered); 0.28::true_val(switch_riding, unk_switch_riding).

measured(s22, switch_riding, good_centered).

all_consistent(switch_riding) :- consistent(s22, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, good_centered)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr reviewer_opinion_snowboardingprofiles_flex_feel
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values easy_with_resistance=Nice_easy_some_resistance_locked_in unk_ro_sp_flex_feel=Unknown
% @importance 0.95

0.85::acc(s22, reviewer_opinion_snowboardingprofiles_flex_feel).

0.72::true_val(reviewer_opinion_snowboardingprofiles_flex_feel, easy_with_resistance); 0.28::true_val(reviewer_opinion_snowboardingprofiles_flex_feel, unk_ro_sp_flex_feel).

measured(s22, reviewer_opinion_snowboardingprofiles_flex_feel, easy_with_resistance).

all_consistent(reviewer_opinion_snowboardingprofiles_flex_feel) :- consistent(s22, reviewer_opinion_snowboardingprofiles_flex_feel).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_flex_feel)).
query(true_val(reviewer_opinion_snowboardingprofiles_flex_feel, easy_with_resistance)).
query(true_val(reviewer_opinion_snowboardingprofiles_flex_feel, unk_ro_sp_flex_feel)).

% @attr freestyle_park_rating
% @type categorical
% @canonical false
% @original_name freestyle_park_rating
% @values rails3_5_jumps3_5_spins4_butters4=Rails_3.5_Jumps_3.5_Spins_4_Butters_4_out_of_5 unk_freestyle_park_rating=Unknown
% @importance 0.95

0.85::acc(s22, freestyle_park_rating).

0.72::true_val(freestyle_park_rating, rails3_5_jumps3_5_spins4_butters4); 0.28::true_val(freestyle_park_rating, unk_freestyle_park_rating).

measured(s22, freestyle_park_rating, rails3_5_jumps3_5_spins4_butters4).

all_consistent(freestyle_park_rating) :- consistent(s22, freestyle_park_rating).

evidence(all_consistent(freestyle_park_rating)).
query(true_val(freestyle_park_rating, rails3_5_jumps3_5_spins4_butters4)).
query(true_val(freestyle_park_rating, unk_freestyle_park_rating)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name powder_score_snowboardingprofiles
% @unit /5
% @values v3=3.0 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.95

0.85::acc(s22, powder_score_snowboardingprofiles).

0.72::true_val(powder_score_snowboardingprofiles, v3); 0.28::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s22, powder_score_snowboardingprofiles, v3).

all_consistent(powder_score_snowboardingprofiles) :- consistent(s22, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v3)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).