0.20::indep(s4).
0.15::indep(s13).
0.25::indep(s14).
0.15::indep(s17).
0.20::indep(s26).
0.15::indep(s30).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.93::acc(s1, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values k2=K2 unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, k2); 0.05::true_val(brand, unk_brand).
measured(s1, brand, k2).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, k2)).
query(true_val(brand, unk_brand)).

0.93::acc(s1, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values afterblack=Afterblack unk_model_name=Unknown
% @importance 1.0

0.95::true_val(model_name, afterblack); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, afterblack).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, afterblack)).
query(true_val(model_name, unk_model_name)).

0.55::acc(s2, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.85

0.54::true_val(model_year, y2027); 0.46::true_val(model_year, unk_model_year).
measured(s2, model_year, y2027).
all_consistent(model_year) :- consistent(s2, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.93::acc(s3, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values mens_snowboard=Mens_snowboard unk_product_type=Unknown
% @importance 1.0

0.95::true_val(product_type, mens_snowboard); 0.05::true_val(product_type, unk_product_type).
measured(s3, product_type, mens_snowboard).
all_consistent(product_type) :- consistent(s3, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, mens_snowboard)).
query(true_val(product_type, unk_product_type)).

0.82::acc(s4, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 1.0

0.82::true_val(board_category, freestyle_all_mountain); 0.18::true_val(board_category, unk_board_category).
measured(s4, board_category, freestyle_all_mountain).
all_consistent(board_category) :- consistent(s4, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

0.70::acc(s5, manufacturer_headquarters).

% @attr manufacturer_headquarters
% @type categorical
% @canonical true
% @original_name Manufacturer headquarters
% @values seattle_wa_usa=Seattle_Washington_USA unk_manufacturer_headquarters=Unknown
% @importance 0.5

0.71::true_val(manufacturer_headquarters, seattle_wa_usa); 0.29::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).
measured(s5, manufacturer_headquarters, seattle_wa_usa).
all_consistent(manufacturer_headquarters) :- consistent(s5, manufacturer_headquarters).
evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, seattle_wa_usa)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

0.70::acc(s6, k2_founded).

% @attr k2_founded
% @type categorical
% @canonical true
% @original_name K2 founded
% @values y1962_vashon=1962_Vashon_Island_WA unk_k2_founded=Unknown
% @importance 0.35

0.71::true_val(k2_founded, y1962_vashon); 0.29::true_val(k2_founded, unk_k2_founded).
measured(s6, k2_founded, y1962_vashon).
all_consistent(k2_founded) :- consistent(s6, k2_founded).
evidence(all_consistent(k2_founded)).
query(true_val(k2_founded, y1962_vashon)).
query(true_val(k2_founded, unk_k2_founded)).

0.63::acc(s7, k2_entered_snowboarding).

% @attr k2_entered_snowboarding
% @type categorical
% @canonical true
% @original_name K2 entered snowboarding
% @values y1987=1987 unk_k2_entered_snowboarding=Unknown
% @importance 0.3

0.63::true_val(k2_entered_snowboarding, y1987); 0.37::true_val(k2_entered_snowboarding, unk_k2_entered_snowboarding).
measured(s7, k2_entered_snowboarding, y1987).
all_consistent(k2_entered_snowboarding) :- consistent(s7, k2_entered_snowboarding).
evidence(all_consistent(k2_entered_snowboarding)).
query(true_val(k2_entered_snowboarding, y1987)).
query(true_val(k2_entered_snowboarding, unk_k2_entered_snowboarding)).

0.70::acc(s8, manufacturing_location).
0.50::acc(s9, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values guangzhou_china=Guangzhou_Province_China unk_manufacturing_location=Unknown
% @importance 0.55

0.95::true_val(manufacturing_location, guangzhou_china); 0.05::true_val(manufacturing_location, unk_manufacturing_location).
measured(s8, manufacturing_location, guangzhou_china).
measured(s9, manufacturing_location, guangzhou_china).
all_consistent(manufacturing_location) :- consistent(s8, manufacturing_location), consistent(s9, manufacturing_location).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, guangzhou_china)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.55::acc(s10, parent_company).

% @attr parent_company
% @type categorical
% @canonical true
% @original_name Parent company
% @values elevate_outdoor=Elevate_Outdoor_Collective unk_parent_company=Unknown
% @importance 0.3

0.53::true_val(parent_company, elevate_outdoor); 0.47::true_val(parent_company, unk_parent_company).
measured(s10, parent_company, elevate_outdoor).
all_consistent(parent_company) :- consistent(s10, parent_company).
evidence(all_consistent(parent_company)).
query(true_val(parent_company, elevate_outdoor)).
query(true_val(parent_company, unk_parent_company)).

0.80::acc(s11, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2019=2019_season unk_model_first_available_year=Unknown
% @importance 0.6

0.76::true_val(model_first_available_year, y2019); 0.24::true_val(model_first_available_year, unk_model_first_available_year).
measured(s11, model_first_available_year, y2019).
all_consistent(model_first_available_year) :- consistent(s11, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2019)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.90::acc(s3, current_iteration_description).

% @attr current_iteration_description
% @type categorical
% @canonical true
% @original_name Current iteration description
% @values second_incarnation=Second_incarnation_evolution unk_current_iteration_description=Unknown
% @importance 1.0

0.90::true_val(current_iteration_description, second_incarnation); 0.10::true_val(current_iteration_description, unk_current_iteration_description).
measured(s3, current_iteration_description, second_incarnation).
all_consistent(current_iteration_description) :- consistent(s3, current_iteration_description).
evidence(all_consistent(current_iteration_description)).
query(true_val(current_iteration_description, second_incarnation)).
query(true_val(current_iteration_description, unk_current_iteration_description)).

0.85::acc(s4, flex_rating_10).
0.60::acc(s2, flex_rating_10).
0.65::acc(s12, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v5=5.0 v6=6.0
% @importance 0.85

0.45::true_val(flex_rating_10, v5); 0.55::true_val(flex_rating_10, v6).
measured(s4, flex_rating_10, v5).
measured(s2, flex_rating_10, v6).
measured(s12, flex_rating_10, v6).
all_consistent(flex_rating_10) :- consistent(s4, flex_rating_10), (indep(s4), consistent(s4, flex_rating_10) ; \+indep(s4)), consistent(s2, flex_rating_10), consistent(s12, flex_rating_10).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, v6)).

0.82::acc(s4, flex_feel).
0.90::acc(s3, flex_feel).
0.75::acc(s45, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values balanced_mid=Balanced_mid_flex_versatile unk_flex_feel=Unknown
% @importance 0.82

0.95::true_val(flex_feel, balanced_mid); 0.05::true_val(flex_feel, unk_flex_feel).
measured(s4, flex_feel, balanced_mid).
measured(s3, flex_feel, balanced_mid).
measured(s45, flex_feel, balanced_mid).
all_consistent(flex_feel) :- (indep(s4), consistent(s4, flex_feel) ; \+indep(s4)), consistent(s3, flex_feel), consistent(s45, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, balanced_mid)).
query(true_val(flex_feel, unk_flex_feel)).

0.93::acc(s3, shape).
0.85::acc(s4, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 1.0

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).
measured(s3, shape, true_twin).
measured(s4, shape, true_twin).
all_consistent(shape) :- consistent(s3, shape), (indep(s4), consistent(s4, shape) ; \+indep(s4)).
evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

0.60::acc(s13, shape_notes).

% @attr shape_notes
% @type categorical
% @canonical false
% @original_name shape
% @values traditional_shape=Traditional_Shape unk_shape_notes=Unknown
% @importance 0.7

0.59::true_val(shape_notes, traditional_shape); 0.41::true_val(shape_notes, unk_shape_notes).
measured(s13, shape_notes, traditional_shape).
all_consistent(shape_notes) :- consistent(s13, shape_notes).
evidence(all_consistent(shape_notes)).
query(true_val(shape_notes, traditional_shape)).
query(true_val(shape_notes, unk_shape_notes)).

0.93::acc(s3, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values twin_combination_camber=Twin_Combination_Camber unk_camber_type=Unknown
% @importance 1.0

0.95::true_val(camber_type, twin_combination_camber); 0.05::true_val(camber_type, unk_camber_type).
measured(s3, camber_type, twin_combination_camber).
all_consistent(camber_type) :- consistent(s3, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, twin_combination_camber)).
query(true_val(camber_type, unk_camber_type)).

0.82::acc(s14, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values pop_precision_float=Pop_precision_float_predictability unk_camber_description=Unknown
% @importance 0.8

0.82::true_val(camber_description, pop_precision_float); 0.18::true_val(camber_description, unk_camber_description).
measured(s14, camber_description, pop_precision_float).
all_consistent(camber_description) :- (indep(s14), consistent(s14, camber_description) ; \+indep(s14)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, pop_precision_float)).
query(true_val(camber_description, unk_camber_description)).

0.80::acc(s15, blunted_tip_design).

% @attr blunted_tip_design
% @type categorical
% @canonical true
% @original_name Blunted tip design
% @values blunted_presses_rails=Blunted_tip_presses_rail_slides unk_blunted_tip_design=Unknown
% @importance 0.65

0.72::true_val(blunted_tip_design, blunted_presses_rails); 0.28::true_val(blunted_tip_design, unk_blunted_tip_design).
measured(s15, blunted_tip_design, blunted_presses_rails).
all_consistent(blunted_tip_design) :- (indep(s14), consistent(s15, blunted_tip_design) ; \+indep(s14)).
evidence(all_consistent(blunted_tip_design)).
query(true_val(blunted_tip_design, blunted_presses_rails)).
query(true_val(blunted_tip_design, unk_blunted_tip_design)).

0.93::acc(s3, setback).
0.85::acc(s4, setback).

% @attr setback
% @type categorical
% @canonical true
% @original_name setback
% @values centered=Centered unk_setback=Unknown
% @importance 1.0

0.95::true_val(setback, centered); 0.05::true_val(setback, unk_setback).
measured(s3, setback, centered).
measured(s4, setback, centered).
all_consistent(setback) :- consistent(s3, setback), (indep(s4), consistent(s4, setback) ; \+indep(s4)).
evidence(all_consistent(setback)).
query(true_val(setback, centered)).
query(true_val(setback, unk_setback)).

0.82::acc(s16, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values hybritech=Hybritech_construction unk_construction_material_innovation=Unknown
% @importance 0.75

0.82::true_val(construction_material_innovation, hybritech); 0.18::true_val(construction_material_innovation, unk_construction_material_innovation).
measured(s16, construction_material_innovation, hybritech).
all_consistent(construction_material_innovation) :- (indep(s14), consistent(s16, construction_material_innovation) ; \+indep(s14)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, hybritech)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.60::acc(s17, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values ptex_to_capped=P_Tex_sidewall_capped_tip_tail unk_sidewall_material=Unknown
% @importance 0.6

0.59::true_val(sidewall_material, ptex_to_capped); 0.41::true_val(sidewall_material, unk_sidewall_material).
measured(s17, sidewall_material, ptex_to_capped).
all_consistent(sidewall_material) :- (indep(s17), consistent(s17, sidewall_material) ; \+indep(s17)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, ptex_to_capped)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.93::acc(s3, core_material).
0.82::acc(s14, core_material).
0.60::acc(s18, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values bap_core=BAP_Core_Bamboo_Aspen_Paulownia unk_core_material=Unknown
% @importance 0.9

0.95::true_val(core_material, bap_core); 0.05::true_val(core_material, unk_core_material).
measured(s3, core_material, bap_core).
measured(s14, core_material, bap_core).
measured(s18, core_material, bap_core).
all_consistent(core_material) :- consistent(s3, core_material), (indep(s14), consistent(s14, core_material) ; \+indep(s14)), (indep(s17), consistent(s18, core_material) ; \+indep(s17)).
evidence(all_consistent(core_material)).
query(true_val(core_material, bap_core)).
query(true_val(core_material, unk_core_material)).

0.62::acc(s18, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values sustainably_harvested=Sustainably_harvested_timber unk_sustainability_certification=Unknown
% @importance 0.8

0.62::true_val(sustainability_certification, sustainably_harvested); 0.38::true_val(sustainability_certification, unk_sustainability_certification).
measured(s18, sustainability_certification, sustainably_harvested).
all_consistent(sustainability_certification) :- (indep(s17), consistent(s18, sustainability_certification) ; \+indep(s17)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, sustainably_harvested)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.93::acc(s3, laminate).
0.82::acc(s19, laminate).
0.85::acc(s4, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_glass_carbon_darkweb=Triax_Glass_plus_Carbon_DarkWeb unk_laminate=Unknown
% @importance 0.78

0.95::true_val(laminate, triax_glass_carbon_darkweb); 0.05::true_val(laminate, unk_laminate).
measured(s3, laminate, triax_glass_carbon_darkweb).
measured(s19, laminate, triax_glass_carbon_darkweb).
measured(s4, laminate, triax_glass_carbon_darkweb).
all_consistent(laminate) :- consistent(s3, laminate), (indep(s14), consistent(s19, laminate) ; \+indep(s14)), (indep(s4), consistent(s4, laminate) ; \+indep(s4)).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_glass_carbon_darkweb)).
query(true_val(laminate, unk_laminate)).

0.93::acc(s3, construction_material_innovation_carbon).
0.62::acc(s18, construction_material_innovation_carbon).
0.82::acc(s20, construction_material_innovation_carbon).

% @attr construction_material_innovation_carbon
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values carbon_darkweb=Carbon_DarkWeb_X_pattern unk_construction_material_innovation_carbon=Unknown
% @importance 0.73

0.95::true_val(construction_material_innovation_carbon, carbon_darkweb); 0.05::true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon).
measured(s3, construction_material_innovation_carbon, carbon_darkweb).
measured(s18, construction_material_innovation_carbon, carbon_darkweb).
measured(s20, construction_material_innovation_carbon, carbon_darkweb).
all_consistent(construction_material_innovation_carbon) :- consistent(s3, construction_material_innovation_carbon), (indep(s17), consistent(s18, construction_material_innovation_carbon) ; \+indep(s17)), (indep(s14), consistent(s20, construction_material_innovation_carbon) ; \+indep(s14)).
evidence(all_consistent(construction_material_innovation_carbon)).
query(true_val(construction_material_innovation_carbon, carbon_darkweb)).
query(true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon)).

0.93::acc(s3, base_material).
0.93::acc(s21, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_4000=Sintered_4000 unk_base_material=Unknown
% @importance 0.88

0.95::true_val(base_material, sintered_4000); 0.05::true_val(base_material, unk_base_material).
measured(s3, base_material, sintered_4000).
measured(s21, base_material, sintered_4000).
all_consistent(base_material) :- consistent(s3, base_material), consistent(s21, base_material).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_4000)).
query(true_val(base_material, unk_base_material)).

0.60::acc(s13, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_stone_finish=Sintered_Stone_Finish unk_base_type=Unknown
% @importance 0.7

0.59::true_val(base_type, sintered_stone_finish); 0.41::true_val(base_type, unk_base_type).
measured(s13, base_type, sintered_stone_finish).
all_consistent(base_type) :- (indep(s13), consistent(s13, base_type) ; \+indep(s13)).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_stone_finish)).
query(true_val(base_type, unk_base_type)).

0.85::acc(s4, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.85::true_val(mounting_pattern, inserts_2x4); 0.15::true_val(mounting_pattern, unk_mounting_pattern).
measured(s4, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- (indep(s4), consistent(s4, mounting_pattern) ; \+indep(s4)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.85::acc(s4, mounting_pattern_stance).

% @attr mounting_pattern_stance
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values centered_all=Centered_all_sizes unk_mounting_pattern_stance=Unknown
% @importance 1.0

0.85::true_val(mounting_pattern_stance, centered_all); 0.15::true_val(mounting_pattern_stance, unk_mounting_pattern_stance).
measured(s4, mounting_pattern_stance, centered_all).
all_consistent(mounting_pattern_stance) :- (indep(s4), consistent(s4, mounting_pattern_stance) ; \+indep(s4)).
evidence(all_consistent(mounting_pattern_stance)).
query(true_val(mounting_pattern_stance, centered_all)).
query(true_val(mounting_pattern_stance, unk_mounting_pattern_stance)).

0.93::acc(s3, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s149_151_154_156w_157_159w_160=149_151_154_156W_157_159W_160 unk_available_sizes=Unknown
% @importance 1.0

0.93::true_val(available_sizes, s149_151_154_156w_157_159w_160); 0.07::true_val(available_sizes, unk_available_sizes).
measured(s3, available_sizes, s149_151_154_156w_157_159w_160).
all_consistent(available_sizes) :- consistent(s3, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s149_151_154_156w_157_159w_160)).
query(true_val(available_sizes, unk_available_sizes)).

0.93::acc(s3, width_options).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 1.0

0.93::true_val(width_options, standard_and_wide); 0.07::true_val(width_options, unk_width_options).
measured(s3, width_options, standard_and_wide).
all_consistent(width_options) :- consistent(s3, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.85::acc(s4, effective_edge_154).

% @attr effective_edge_154
% @type numeric
% @canonical true
% @unit mm
% @original_name effective_edge_154
% @values v1190=1190.0
% @importance 1.0

0.85::true_val(effective_edge_154, v1190); 0.15::true_val(effective_edge_154, unk_effective_edge_154).
measured(s4, effective_edge_154, v1190).
all_consistent(effective_edge_154) :- (indep(s4), consistent(s4, effective_edge_154) ; \+indep(s4)).
evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v1190)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

0.85::acc(s4, tip_tail_width_size_154).

% @attr tip_tail_width_size_154
% @type categorical
% @canonical false
% @unit mm
% @original_name tip_tail_width_size
% @values v293_251_293=293/251/293 unk_tip_tail_width_size_154=Unknown
% @importance 1.0

0.85::true_val(tip_tail_width_size_154, v293_251_293); 0.15::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).
measured(s4, tip_tail_width_size_154, v293_251_293).
all_consistent(tip_tail_width_size_154) :- (indep(s4), consistent(s4, tip_tail_width_size_154) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v293_251_293)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

0.85::acc(s4, sidecut_radius_size_154).

% @attr sidecut_radius_size_154
% @type numeric
% @canonical false
% @unit m
% @original_name sidecut_radius_size
% @values v7_9=7.9 unk_sidecut_radius_size_154=Unknown
% @importance 1.0

0.85::true_val(sidecut_radius_size_154, v7_9); 0.15::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).
measured(s4, sidecut_radius_size_154, v7_9).
all_consistent(sidecut_radius_size_154) :- (indep(s4), consistent(s4, sidecut_radius_size_154) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_9)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

0.93::acc(s3, stance_width_range_size_154).
0.85::acc(s4, stance_width_range_size_154).

% @attr stance_width_range_size_154
% @type numeric
% @canonical false
% @unit mm
% @original_name stance_width_range_size
% @values v530=530.0 unk_stance_width_range_size_154=Unknown
% @importance 1.0

0.95::true_val(stance_width_range_size_154, v530); 0.05::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).
measured(s3, stance_width_range_size_154, v530).
measured(s4, stance_width_range_size_154, v530).
all_consistent(stance_width_range_size_154) :- consistent(s3, stance_width_range_size_154), (indep(s4), consistent(s4, stance_width_range_size_154) ; \+indep(s4)).
evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v530)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

0.85::acc(s4, stance_width_adjust_154).

% @attr stance_width_adjust_154
% @type categorical
% @canonical false
% @unit mm
% @original_name stance_width_range_size
% @values v430_670=430-670mm unk_stance_width_adjust_154=Unknown
% @importance 1.0

0.85::true_val(stance_width_adjust_154, v430_670); 0.15::true_val(stance_width_adjust_154, unk_stance_width_adjust_154).
measured(s4, stance_width_adjust_154, v430_670).
all_consistent(stance_width_adjust_154) :- (indep(s4), consistent(s4, stance_width_adjust_154) ; \+indep(s4)).
evidence(all_consistent(stance_width_adjust_154)).
query(true_val(stance_width_adjust_154, v430_670)).
query(true_val(stance_width_adjust_154, unk_stance_width_adjust_154)).

0.93::acc(s3, recommended_weight_range_size_154).
0.85::acc(s4, recommended_weight_range_size_154).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size
% @values v54_86=54-86kg unk_recommended_weight_range_size_154=Unknown
% @importance 1.0

0.95::true_val(recommended_weight_range_size_154, v54_86); 0.05::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).
measured(s3, recommended_weight_range_size_154, v54_86).
measured(s4, recommended_weight_range_size_154, v54_86).
all_consistent(recommended_weight_range_size_154) :- consistent(s3, recommended_weight_range_size_154), (indep(s4), consistent(s4, recommended_weight_range_size_154) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, v54_86)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

0.93::acc(s3, effective_edge_157).
0.85::acc(s4, effective_edge_157).

% @attr effective_edge_157
% @type numeric
% @canonical true
% @unit mm
% @original_name effective_edge_157
% @values v1220=1220.0 unk_effective_edge_157=Unknown
% @importance 1.0

0.95::true_val(effective_edge_157, v1220); 0.05::true_val(effective_edge_157, unk_effective_edge_157).
measured(s3, effective_edge_157, v1220).
measured(s4, effective_edge_157, v1220).
all_consistent(effective_edge_157) :- consistent(s3, effective_edge_157), (indep(s4), consistent(s4, effective_edge_157) ; \+indep(s4)).
evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v1220)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

0.93::acc(s3, tip_tail_width_size_157).
0.85::acc(s4, tip_tail_width_size_157).

% @attr tip_tail_width_size_157
% @type categorical
% @canonical false
% @unit mm
% @original_name tip_tail_width_size
% @values v297_254_297=297/254/297 unk_tip_tail_width_size_157=Unknown
% @importance 1.0

0.95::true_val(tip_tail_width_size_157, v297_254_297); 0.05::true_val(tip_tail_width_size_157, unk_tip_tail_width_size_157).
measured(s3, tip_tail_width_size_157, v297_254_297).
measured(s4, tip_tail_width_size_157, v297_254_297).
all_consistent(tip_tail_width_size_157) :- consistent(s3, tip_tail_width_size_157), (indep(s4), consistent(s4, tip_tail_width_size_157) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_157)).
query(true_val(tip_tail_width_size_157, v297_254_297)).
query(true_val(tip_tail_width_size_157, unk_tip_tail_width_size_157)).

0.93::acc(s3, sidecut_radius_size_157).
0.85::acc(s4, sidecut_radius_size_157).

% @attr sidecut_radius_size_157
% @type numeric
% @canonical false
% @unit m
% @original_name sidecut_radius_size
% @values v8_1=8.1 unk_sidecut_radius_size_157=Unknown
% @importance 1.0

0.95::true_val(sidecut_radius_size_157, v8_1); 0.05::true_val(sidecut_radius_size_157, unk_sidecut_radius_size_157).
measured(s3, sidecut_radius_size_157, v8_1).
measured(s4, sidecut_radius_size_157, v8_1).
all_consistent(sidecut_radius_size_157) :- consistent(s3, sidecut_radius_size_157), (indep(s4), consistent(s4, sidecut_radius_size_157) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_157)).
query(true_val(sidecut_radius_size_157, v8_1)).
query(true_val(sidecut_radius_size_157, unk_sidecut_radius_size_157)).

0.93::acc(s3, stance_width_range_size_157).
0.85::acc(s4, stance_width_range_size_157).

% @attr stance_width_range_size_157
% @type numeric
% @canonical false
% @unit mm
% @original_name stance_width_range_size
% @values v530=530.0 unk_stance_width_range_size_157=Unknown
% @importance 1.0

0.95::true_val(stance_width_range_size_157, v530); 0.05::true_val(stance_width_range_size_157, unk_stance_width_range_size_157).
measured(s3, stance_width_range_size_157, v530).
measured(s4, stance_width_range_size_157, v530).
all_consistent(stance_width_range_size_157) :- consistent(s3, stance_width_range_size_157), (indep(s4), consistent(s4, stance_width_range_size_157) ; \+indep(s4)).
evidence(all_consistent(stance_width_range_size_157)).
query(true_val(stance_width_range_size_157, v530)).
query(true_val(stance_width_range_size_157, unk_stance_width_range_size_157)).

0.85::acc(s4, stance_width_adjust_157).

% @attr stance_width_adjust_157
% @type categorical
% @canonical false
% @unit mm
% @original_name stance_width_range_size
% @values v430_670=430-670mm unk_stance_width_adjust_157=Unknown
% @importance 1.0

0.85::true_val(stance_width_adjust_157, v430_670); 0.15::true_val(stance_width_adjust_157, unk_stance_width_adjust_157).
measured(s4, stance_width_adjust_157, v430_670).
all_consistent(stance_width_adjust_157) :- (indep(s4), consistent(s4, stance_width_adjust_157) ; \+indep(s4)).
evidence(all_consistent(stance_width_adjust_157)).
query(true_val(stance_width_adjust_157, v430_670)).
query(true_val(stance_width_adjust_157, unk_stance_width_adjust_157)).

0.93::acc(s3, recommended_weight_range_size_157).
0.85::acc(s4, recommended_weight_range_size_157).

% @attr recommended_weight_range_size_157
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size
% @values v59_91=59-91kg unk_recommended_weight_range_size_157=Unknown
% @importance 1.0

0.95::true_val(recommended_weight_range_size_157, v59_91); 0.05::true_val(recommended_weight_range_size_157, unk_recommended_weight_range_size_157).
measured(s3, recommended_weight_range_size_157, v59_91).
measured(s4, recommended_weight_range_size_157, v59_91).
all_consistent(recommended_weight_range_size_157) :- consistent(s3, recommended_weight_range_size_157), (indep(s4), consistent(s4, recommended_weight_range_size_157) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_157)).
query(true_val(recommended_weight_range_size_157, v59_91)).
query(true_val(recommended_weight_range_size_157, unk_recommended_weight_range_size_157)).

0.93::acc(s3, effective_edge_149).
0.85::acc(s4, effective_edge_149).

% @attr effective_edge_149
% @type numeric
% @canonical true
% @unit mm
% @original_name effective_edge_149
% @values v1140=1140.0 unk_effective_edge_149=Unknown
% @importance 1.0

0.95::true_val(effective_edge_149, v1140); 0.05::true_val(effective_edge_149, unk_effective_edge_149).
measured(s3, effective_edge_149, v1140).
measured(s4, effective_edge_149, v1140).
all_consistent(effective_edge_149) :- consistent(s3, effective_edge_149), (indep(s4), consistent(s4, effective_edge_149) ; \+indep(s4)).
evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v1140)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

0.93::acc(s3, tip_tail_width_size_149).
0.85::acc(s4, tip_tail_width_size_149).

% @attr tip_tail_width_size_149
% @type categorical
% @canonical false
% @unit mm
% @original_name tip_tail_width_size
% @values v285_245_285=285/245/285 unk_tip_tail_width_size_149=Unknown
% @importance 1.0

0.95::true_val(tip_tail_width_size_149, v285_245_285); 0.05::true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149).
measured(s3, tip_tail_width_size_149, v285_245_285).
measured(s4, tip_tail_width_size_149, v285_245_285).
all_consistent(tip_tail_width_size_149) :- consistent(s3, tip_tail_width_size_149), (indep(s4), consistent(s4, tip_tail_width_size_149) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_149)).
query(true_val(tip_tail_width_size_149, v285_245_285)).
query(true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149)).

0.93::acc(s3, sidecut_radius_size_149).
0.85::acc(s4, sidecut_radius_size_149).

% @attr sidecut_radius_size_149
% @type numeric
% @canonical false
% @unit m
% @original_name sidecut_radius_size
% @values v7_5=7.5 unk_sidecut_radius_size_149=Unknown
% @importance 1.0

0.95::true_val(sidecut_radius_size_149, v7_5); 0.05::true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149).
measured(s3, sidecut_radius_size_149, v7_5).
measured(s4, sidecut_radius_size_149, v7_5).
all_consistent(sidecut_radius_size_149) :- consistent(s3, sidecut_radius_size_149), (indep(s4), consistent(s4, sidecut_radius_size_149) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_149)).
query(true_val(sidecut_radius_size_149, v7_5)).
query(true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149)).

0.93::acc(s3, stance_width_range_size_149).
0.85::acc(s4, stance_width_range_size_149).

% @attr stance_width_range_size_149
% @type numeric
% @canonical false
% @unit mm
% @original_name stance_width_range_size
% @values v480=480.0 unk_stance_width_range_size_149=Unknown
% @importance 1.0

0.95::true_val(stance_width_range_size_149, v480); 0.05::true_val(stance_width_range_size_149, unk_stance_width_range_size_149).
measured(s3, stance_width_range_size_149, v480).
measured(s4, stance_width_range_size_149, v480).
all_consistent(stance_width_range_size_149) :- consistent(s3, stance_width_range_size_149), (indep(s4), consistent(s4, stance_width_range_size_149) ; \+indep(s4)).
evidence(all_consistent(stance_width_range_size_149)).
query(true_val(stance_width_range_size_149, v480)).
query(true_val(stance_width_range_size_149, unk_stance_width_range_size_149)).

0.85::acc(s4, stance_width_adjust_149).

% @attr stance_width_adjust_149
% @type categorical
% @canonical false
% @unit mm
% @original_name stance_width_range_size
% @values v380_620=380-620mm unk_stance_width_adjust_149=Unknown
% @importance 1.0

0.85::true_val(stance_width_adjust_149, v380_620); 0.15::true_val(stance_width_adjust_149, unk_stance_width_adjust_149).
measured(s4, stance_width_adjust_149, v380_620).
all_consistent(stance_width_adjust_149) :- (indep(s4), consistent(s4, stance_width_adjust_149) ; \+indep(s4)).
evidence(all_consistent(stance_width_adjust_149)).
query(true_val(stance_width_adjust_149, v380_620)).
query(true_val(stance_width_adjust_149, unk_stance_width_adjust_149)).

0.93::acc(s3, recommended_weight_range_size_149).
0.85::acc(s4, recommended_weight_range_size_149).

% @attr recommended_weight_range_size_149
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size
% @values v50_82=50-82kg unk_recommended_weight_range_size_149=Unknown
% @importance 1.0

0.95::true_val(recommended_weight_range_size_149, v50_82); 0.05::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).
measured(s3, recommended_weight_range_size_149, v50_82).
measured(s4, recommended_weight_range_size_149, v50_82).
all_consistent(recommended_weight_range_size_149) :- consistent(s3, recommended_weight_range_size_149), (indep(s4), consistent(s4, recommended_weight_range_size_149) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, v50_82)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

0.93::acc(s3, effective_edge_151).
0.85::acc(s4, effective_edge_151).

% @attr effective_edge_151
% @type numeric
% @canonical true
% @unit mm
% @original_name effective_edge_151
% @values v1170=1170.0 unk_effective_edge_151=Unknown
% @importance 1.0

0.95::true_val(effective_edge_151, v1170); 0.05::true_val(effective_edge_151, unk_effective_edge_151).
measured(s3, effective_edge_151, v1170).
measured(s4, effective_edge_151, v1170).
all_consistent(effective_edge_151) :- consistent(s3, effective_edge_151), (indep(s4), consistent(s4, effective_edge_151) ; \+indep(s4)).
evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v1170)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

0.93::acc(s3, tip_tail_width_size_151).
0.85::acc(s4, tip_tail_width_size_151).

% @attr tip_tail_width_size_151
% @type categorical
% @canonical false
% @unit mm
% @original_name tip_tail_width_size
% @values v288_247_288=288/247/288 unk_tip_tail_width_size_151=Unknown
% @importance 1.0

0.95::true_val(tip_tail_width_size_151, v288_247_288); 0.05::true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151).
measured(s3, tip_tail_width_size_151, v288_247_288).
measured(s4, tip_tail_width_size_151, v288_247_288).
all_consistent(tip_tail_width_size_151) :- consistent(s3, tip_tail_width_size_151), (indep(s4), consistent(s4, tip_tail_width_size_151) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, v288_247_288)).
query(true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151)).

0.93::acc(s3, sidecut_radius_size_151).
0.85::acc(s4, sidecut_radius_size_151).

% @attr sidecut_radius_size_151
% @type numeric
% @canonical false
% @unit m
% @original_name sidecut_radius_size
% @values v7_7=7.7 unk_sidecut_radius_size_151=Unknown
% @importance 1.0

0.95::true_val(sidecut_radius_size_151, v7_7); 0.05::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).
measured(s3, sidecut_radius_size_151, v7_7).
measured(s4, sidecut_radius_size_151, v7_7).
all_consistent(sidecut_radius_size_151) :- consistent(s3, sidecut_radius_size_151), (indep(s4), consistent(s4, sidecut_radius_size_151) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v7_7)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

0.93::acc(s3, stance_width_range_size_151).
0.85::acc(s4, stance_width_range_size_151).

% @attr stance_width_range_size_151
% @type numeric
% @canonical false
% @unit mm
% @original_name stance_width_range_size
% @values v510=510.0 unk_stance_width_range_size_151=Unknown
% @importance 1.0

0.95::true_val(stance_width_range_size_151, v510); 0.05::true_val(stance_width_range_size_151, unk_stance_width_range_size_151).
measured(s3, stance_width_range_size_151, v510).
measured(s4, stance_width_range_size_151, v510).
all_consistent(stance_width_range_size_151) :- consistent(s3, stance_width_range_size_151), (indep(s4), consistent(s4, stance_width_range_size_151) ; \+indep(s4)).
evidence(all_consistent(stance_width_range_size_151)).
query(true_val(stance_width_range_size_151, v510)).
query(true_val(stance_width_range_size_151, unk_stance_width_range_size_151)).

0.85::acc(s4, stance_width_adjust_151).

% @attr stance_width_adjust_151
% @type categorical
% @canonical false
% @unit mm
% @original_name stance_width_range_size
% @values v410_650=410-650mm unk_stance_width_adjust_151=Unknown
% @importance 1.0

0.85::true_val(stance_width_adjust_151, v410_650); 0.15::true_val(stance_width_adjust_151, unk_stance_width_adjust_151).
measured(s4, stance_width_adjust_151, v410_650).
all_consistent(stance_width_adjust_151) :- (indep(s4), consistent(s4, stance_width_adjust_151) ; \+indep(s4)).
evidence(all_consistent(stance_width_adjust_151)).
query(true_val(stance_width_adjust_151, v410_650)).
query(true_val(stance_width_adjust_151, unk_stance_width_adjust_151)).

0.93::acc(s3, recommended_weight_range_size_151).
0.85::acc(s4, recommended_weight_range_size_151).

% @attr recommended_weight_range_size_151
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size
% @values v54_86=54-86kg unk_recommended_weight_range_size_151=Unknown
% @importance 1.0

0.95::true_val(recommended_weight_range_size_151, v54_86); 0.05::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).
measured(s3, recommended_weight_range_size_151, v54_86).
measured(s4, recommended_weight_range_size_151, v54_86).
all_consistent(recommended_weight_range_size_151) :- consistent(s3, recommended_weight_range_size_151), (indep(s4), consistent(s4, recommended_weight_range_size_151) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, v54_86)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

0.93::acc(s3, effective_edge_160).
0.85::acc(s4, effective_edge_160).

% @attr effective_edge_160
% @type numeric
% @canonical true
% @unit mm
% @original_name effective_edge_160
% @values v1240=1240.0 unk_effective_edge_160=Unknown
% @importance 1.0

0.95::true_val(effective_edge_160, v1240); 0.05::true_val(effective_edge_160, unk_effective_edge_160).
measured(s3, effective_edge_160, v1240).
measured(s4, effective_edge_160, v1240).
all_consistent(effective_edge_160) :- consistent(s3, effective_edge_160), (indep(s4), consistent(s4, effective_edge_160) ; \+indep(s4)).
evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v1240)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

0.93::acc(s3, tip_tail_width_size_160).
0.85::acc(s4, tip_tail_width_size_160).

% @attr tip_tail_width_size_160
% @type categorical
% @canonical false
% @unit mm
% @original_name tip_tail_width_size
% @values v300_257_300=300/257/300 unk_tip_tail_width_size_160=Unknown
% @importance 1.0

0.95::true_val(tip_tail_width_size_160, v300_257_300); 0.05::true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160).
measured(s3, tip_tail_width_size_160, v300_257_300).
measured(s4, tip_tail_width_size_160, v300_257_300).
all_consistent(tip_tail_width_size_160) :- consistent(s3, tip_tail_width_size_160), (indep(s4), consistent(s4, tip_tail_width_size_160) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_160)).
query(true_val(tip_tail_width_size_160, v300_257_300)).
query(true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160)).

0.93::acc(s3, sidecut_radius_size_160).
0.85::acc(s4, sidecut_radius_size_160).

% @attr sidecut_radius_size_160
% @type numeric
% @canonical false
% @unit m
% @original_name sidecut_radius_size
% @values v8_3=8.3 unk_sidecut_radius_size_160=Unknown
% @importance 1.0

0.95::true_val(sidecut_radius_size_160, v8_3); 0.05::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).
measured(s3, sidecut_radius_size_160, v8_3).
measured(s4, sidecut_radius_size_160, v8_3).
all_consistent(sidecut_radius_size_160) :- consistent(s3, sidecut_radius_size_160), (indep(s4), consistent(s4, sidecut_radius_size_160) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v8_3)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

0.93::acc(s3, stance_width_range_size_160).
0.85::acc(s4, stance_width_range_size_160).

% @attr stance_width_range_size_160
% @type numeric
% @canonical false
% @unit mm
% @original_name stance_width_range_size
% @values v560=560.0 unk_stance_width_range_size_160=Unknown
% @importance 1.0

0.95::true_val(stance_width_range_size_160, v560); 0.05::true_val(stance_width_range_size_160, unk_stance_width_range_size_160).
measured(s3, stance_width_range_size_160, v560).
measured(s4, stance_width_range_size_160, v560).
all_consistent(stance_width_range_size_160) :- consistent(s3, stance_width_range_size_160), (indep(s4), consistent(s4, stance_width_range_size_160) ; \+indep(s4)).
evidence(all_consistent(stance_width_range_size_160)).
query(true_val(stance_width_range_size_160, v560)).
query(true_val(stance_width_range_size_160, unk_stance_width_range_size_160)).

0.85::acc(s4, stance_width_adjust_160).

% @attr stance_width_adjust_160
% @type categorical
% @canonical false
% @unit mm
% @original_name stance_width_range_size
% @values v460_700=460-700mm unk_stance_width_adjust_160=Unknown
% @importance 1.0

0.85::true_val(stance_width_adjust_160, v460_700); 0.15::true_val(stance_width_adjust_160, unk_stance_width_adjust_160).
measured(s4, stance_width_adjust_160, v460_700).
all_consistent(stance_width_adjust_160) :- (indep(s4), consistent(s4, stance_width_adjust_160) ; \+indep(s4)).
evidence(all_consistent(stance_width_adjust_160)).
query(true_val(stance_width_adjust_160, v460_700)).
query(true_val(stance_width_adjust_160, unk_stance_width_adjust_160)).

0.93::acc(s3, recommended_weight_range_size_160).
0.85::acc(s4, recommended_weight_range_size_160).

% @attr recommended_weight_range_size_160
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size
% @values v59_100=59-100kg unk_recommended_weight_range_size_160=Unknown
% @importance 1.0

0.95::true_val(recommended_weight_range_size_160, v59_100); 0.05::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).
measured(s3, recommended_weight_range_size_160, v59_100).
measured(s4, recommended_weight_range_size_160, v59_100).
all_consistent(recommended_weight_range_size_160) :- consistent(s3, recommended_weight_range_size_160), (indep(s4), consistent(s4, recommended_weight_range_size_160) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, v59_100)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

0.93::acc(s3, effective_edge_156).
0.85::acc(s4, effective_edge_156).

% @attr effective_edge_156
% @type numeric
% @canonical true
% @unit mm
% @original_name effective_edge_156
% @values v1220=1220.0 unk_effective_edge_156=Unknown
% @importance 1.0

0.95::true_val(effective_edge_156, v1220); 0.05::true_val(effective_edge_156, unk_effective_edge_156).
measured(s3, effective_edge_156, v1220).
measured(s4, effective_edge_156, v1220).
all_consistent(effective_edge_156) :- consistent(s3, effective_edge_156), (indep(s4), consistent(s4, effective_edge_156) ; \+indep(s4)).
evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1220)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

0.93::acc(s3, tip_tail_width_size).
0.85::acc(s4, tip_tail_width_size).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @unit mm
% @original_name tip_tail_width_size
% @values v305_262_305=305/262/305 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.95::true_val(tip_tail_width_size, v305_262_305); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(s3, tip_tail_width_size, v305_262_305).
measured(s4, tip_tail_width_size, v305_262_305).
all_consistent(tip_tail_width_size) :- consistent(s3, tip_tail_width_size), (indep(s4), consistent(s4, tip_tail_width_size) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v305_262_305)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.93::acc(s3, sidecut_radius_size).
0.85::acc(s4, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @unit m
% @original_name sidecut_radius_size
% @values v8_1=8.1 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.95::true_val(sidecut_radius_size, v8_1); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s3, sidecut_radius_size, v8_1).
measured(s4, sidecut_radius_size, v8_1).
all_consistent(sidecut_radius_size) :- consistent(s3, sidecut_radius_size), (indep(s4), consistent(s4, sidecut_radius_size) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_1)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.93::acc(s3, stance_width_range_size).
0.85::acc(s4, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @unit mm
% @original_name stance_width_range_size
% @values v530=530.0 unk_stance_width_range_size=Unknown
% @importance 1.0

0.95::true_val(stance_width_range_size, v530); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).
measured(s3, stance_width_range_size, v530).
measured(s4, stance_width_range_size, v530).
all_consistent(stance_width_range_size) :- consistent(s3, stance_width_range_size), (indep(s4), consistent(s4, stance_width_range_size) ; \+indep(s4)).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v530)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.85::acc(s4, stance_width_adjust_156w).

% @attr stance_width_adjust_156w
% @type categorical
% @canonical false
% @unit mm
% @original_name stance_width_range_size
% @values v430_670=430-670mm unk_stance_width_adjust_156w=Unknown
% @importance 1.0

0.85::true_val(stance_width_adjust_156w, v430_670); 0.15::true_val(stance_width_adjust_156w, unk_stance_width_adjust_156w).
measured(s4, stance_width_adjust_156w, v430_670).
all_consistent(stance_width_adjust_156w) :- (indep(s4), consistent(s4, stance_width_adjust_156w) ; \+indep(s4)).
evidence(all_consistent(stance_width_adjust_156w)).
query(true_val(stance_width_adjust_156w, v430_670)).
query(true_val(stance_width_adjust_156w, unk_stance_width_adjust_156w)).

0.93::acc(s3, recommended_weight_range_size).
0.85::acc(s4, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @unit kg
% @original_name recommended_weight_range_size
% @values v59_100=59-100kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.95::true_val(recommended_weight_range_size, v59_100); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s3, recommended_weight_range_size, v59_100).
measured(s4, recommended_weight_range_size, v59_100).
all_consistent(recommended_weight_range_size) :- consistent(s3, recommended_weight_range_size), (indep(s4), consistent(s4, recommended_weight_range_size) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v59_100)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.93::acc(s3, effective_edge_159).
0.85::acc(s4, effective_edge_159).

% @attr effective_edge_159
% @type numeric
% @canonical true
% @unit mm
% @original_name effective_edge_159
% @values v1240=1240.0 unk_effective_edge_159=Unknown
% @importance 1.0

0.95::true_val(effective_edge_159, v1240); 0.05::true_val(effective_edge_159, unk_effective_edge_159).
measured(s3, effective_edge_159, v1240).
measured(s4, effective_edge_159, v1240).
all_consistent(effective_edge_159) :- consistent(s3, effective_edge_159), (indep(s4), consistent(s4, effective_edge_159) ; \+indep(s4)).
evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1240)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

0.70::acc(s4, tip_tail_width_size_159w).

% @attr tip_tail_width_size_159w
% @type categorical
% @canonical false
% @unit mm
% @original_name tip_tail_width_size
% @values v308_265_308=308/265/308 v308_265_208=308/265/208 unk_tip_tail_width_size_159w=Unknown
% @importance 1.0

0.70::true_val(tip_tail_width_size_159w, v308_265_308); 0.25::true_val(tip_tail_width_size_159w, v308_265_208); 0.05::true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w).
measured(s4, tip_tail_width_size_159w, v308_265_208).
all_consistent(tip_tail_width_size_159w) :- (indep(s4), consistent(s4, tip_tail_width_size_159w) ; \+indep(s4)).
evidence(all_consistent(tip_tail_width_size_159w)).
query(true_val(tip_tail_width_size_159w, v308_265_308)).
query(true_val(tip_tail_width_size_159w, v308_265_208)).
query(true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w)).

0.93::acc(s3, sidecut_radius_size_159w).
0.85::acc(s4, sidecut_radius_size_159w).

% @attr sidecut_radius_size_159w
% @type numeric
% @canonical false
% @unit m
% @original_name sidecut_radius_size
% @values v8_3=8.3 unk_sidecut_radius_size_159w=Unknown
% @importance 1.0

0.95::true_val(sidecut_radius_size_159w, v8_3); 0.05::true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w).
measured(s3, sidecut_radius_size_159w, v8_3).
measured(s4, sidecut_radius_size_159w, v8_3).
all_consistent(sidecut_radius_size_159w) :- consistent(s3, sidecut_radius_size_159w), (indep(s4), consistent(s4, sidecut_radius_size_159w) ; \+indep(s4)).
evidence(all_consistent(sidecut_radius_size_159w)).
query(true_val(sidecut_radius_size_159w, v8_3)).
query(true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w)).

0.93::acc(s3, stance_width_range_size_159w).
0.85::acc(s4, stance_width_range_size_159w).

% @attr stance_width_range_size_159w
% @type numeric
% @canonical false
% @unit mm
% @original_name stance_width_range_size
% @values v560=560.0 unk_stance_width_range_size_159w=Unknown
% @importance 1.0

0.95::true_val(stance_width_range_size_159w, v560); 0.05::true_val(stance_width_range_size_159w, unk_stance_width_range_size_159w).
measured(s3, stance_width_range_size_159w, v560).
measured(s4, stance_width_range_size_159w, v560).
all_consistent(stance_width_range_size_159w) :- consistent(s3, stance_width_range_size_159w), (indep(s4), consistent(s4, stance_width_range_size_159w) ; \+indep(s4)).
evidence(all_consistent(stance_width_range_size_159w)).
query(true_val(stance_width_range_size_159w, v560)).
query(true_val(stance_width_range_size_159w, unk_stance_width_range_size_159w)).

0.85::acc(s4, stance_width_adjust_159w).

% @attr stance_width_adjust_159w
% @type categorical
% @canonical false
% @unit mm
% @original_name stance_width_range_size
% @values v460_700=460-700mm unk_stance_width_adjust_159w=Unknown
% @importance 1.0

0.85::true_val(stance_width_adjust_159w, v460_700); 0.15::true_val(stance_width_adjust_159w, unk_stance_width_adjust_159w).
measured(s4, stance_width_adjust_159w, v460_700).
all_consistent(stance_width_adjust_159w) :- (indep(s4), consistent(s4, stance_width_adjust_159w) ; \+indep(s4)).
evidence(all_consistent(stance_width_adjust_159w)).
query(true_val(stance_width_adjust_159w, v460_700)).
query(true_val(stance_width_adjust_159w, unk_stance_width_adjust_159w)).

0.93::acc(s3, recommended_weight_range_size_159w).
0.85::acc(s4, recommended_weight_range_size_159w).

% @attr recommended_weight_range_size_159w
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size
% @values v59_104=59-104kg unk_recommended_weight_range_size_159w=Unknown
% @importance 1.0

0.95::true_val(recommended_weight_range_size_159w, v59_104); 0.05::true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w).
measured(s3, recommended_weight_range_size_159w, v59_104).
measured(s4, recommended_weight_range_size_159w, v59_104).
all_consistent(recommended_weight_range_size_159w) :- consistent(s3, recommended_weight_range_size_159w), (indep(s4), consistent(s4, recommended_weight_range_size_159w) ; \+indep(s4)).
evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, v59_104)).
query(true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w)).

0.85::acc(s4, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_all_mountain=Park_All_Mountain unk_terrain_suitability=Unknown
% @importance 1.0

0.85::true_val(terrain_suitability, park_all_mountain); 0.15::true_val(terrain_suitability, unk_terrain_suitability).
measured(s4, terrain_suitability, park_all_mountain).
all_consistent(terrain_suitability) :- (indep(s4), consistent(s4, terrain_suitability) ; \+indep(s4)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_all_mountain)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.85::acc(s4, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_riding_style=Unknown
% @importance 1.0

0.85::true_val(riding_style, freestyle_all_mountain); 0.15::true_val(riding_style, unk_riding_style).
measured(s4, riding_style, freestyle_all_mountain).
all_consistent(riding_style) :- (indep(s4), consistent(s4, riding_style) ; \+indep(s4)).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_all_mountain)).
query(true_val(riding_style, unk_riding_style)).

0.85::acc(s4, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_to_Advanced unk_rider_level=Unknown
% @importance 1.0

0.85::true_val(rider_level, intermediate_advanced); 0.15::true_val(rider_level, unk_rider_level).
measured(s4, rider_level, intermediate_advanced).
all_consistent(rider_level) :- (indep(s4), consistent(s4, rider_level) ; \+indep(s4)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

0.93::acc(s3, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values int_adv_expert=Intermediate_Advanced_Expert unk_skill_level_recommendation=Unknown
% @importance 1.0

0.93::true_val(skill_level_recommendation, int_adv_expert); 0.07::true_val(skill_level_recommendation, unk_skill_level_recommendation).
measured(s3, skill_level_recommendation, int_adv_expert).
all_consistent(skill_level_recommendation) :- consistent(s3, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, int_adv_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.93::acc(s3, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.93::true_val(gender, mens); 0.07::true_val(gender, unk_gender).
measured(s3, gender, mens).
all_consistent(gender) :- consistent(s3, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.90::acc(s3, terrain_suitability_detail).

% @attr terrain_suitability_detail
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values freestyle_park_rails_piste_speed=Freestyle_Park_Rails_Piste_Speed unk_terrain_suitability_detail=Unknown
% @importance 1.0

0.90::true_val(terrain_suitability_detail, freestyle_park_rails_piste_speed); 0.10::true_val(terrain_suitability_detail, unk_terrain_suitability_detail).
measured(s3, terrain_suitability_detail, freestyle_park_rails_piste_speed).
all_consistent(terrain_suitability_detail) :- consistent(s3, terrain_suitability_detail).
evidence(all_consistent(terrain_suitability_detail)).
query(true_val(terrain_suitability_detail, freestyle_park_rails_piste_speed)).
query(true_val(terrain_suitability_detail, unk_terrain_suitability_detail)).

0.55::acc(s22, terrain_suitability_marketing).

% @attr terrain_suitability_marketing
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values night_missions_wallrides_airs=Night_missions_wall_rides_huge_airs unk_terrain_suitability_marketing=Unknown
% @importance 0.5

0.55::true_val(terrain_suitability_marketing, night_missions_wallrides_airs); 0.45::true_val(terrain_suitability_marketing, unk_terrain_suitability_marketing).
measured(s22, terrain_suitability_marketing, night_missions_wallrides_airs).
all_consistent(terrain_suitability_marketing) :- (indep(s17), consistent(s22, terrain_suitability_marketing) ; \+indep(s17)).
evidence(all_consistent(terrain_suitability_marketing)).
query(true_val(terrain_suitability_marketing, night_missions_wallrides_airs)).
query(true_val(terrain_suitability_marketing, unk_terrain_suitability_marketing)).

0.85::acc(s4, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @unit AUD
% @original_name price_aud_merchant
% @values v879_99=879.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.85::true_val(price_aud_merchant, v879_99); 0.15::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s4, price_aud_merchant, v879_99).
all_consistent(price_aud_merchant) :- consistent(s4, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v879_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.93::acc(s3, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @unit USD
% @original_name price_usd_msrp
% @values v539_95=539.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.93::true_val(price_usd_msrp, v539_95); 0.07::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s3, price_usd_msrp, v539_95).
all_consistent(price_usd_msrp) :- consistent(s3, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v539_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.50::acc(s23, price_usd_snowinn).

% @attr price_usd_snowinn
% @type numeric
% @canonical false
% @unit USD
% @original_name USD price (Snowinn/Tradeinn, prior season 151cm)
% @values v360_99=360.99 unk_price_usd_snowinn=Unknown
% @importance 0.85

0.41::true_val(price_usd_snowinn, v360_99); 0.59::true_val(price_usd_snowinn, unk_price_usd_snowinn).
measured(s23, price_usd_snowinn, v360_99).
all_consistent(price_usd_snowinn) :- consistent(s23, price_usd_snowinn).
evidence(all_consistent(price_usd_snowinn)).
query(true_val(price_usd_snowinn, v360_99)).
query(true_val(price_usd_snowinn, unk_price_usd_snowinn)).

0.65::acc(s24, availability_status_amazon).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed=Listed unk_availability_status_amazon=Unknown
% @importance 0.7

0.60::true_val(availability_status_amazon, listed); 0.40::true_val(availability_status_amazon, unk_availability_status_amazon).
measured(s24, availability_status_amazon, listed).
all_consistent(availability_status_amazon) :- consistent(s24, availability_status_amazon).
evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, listed)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

0.93::acc(s3, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock_k2=In_stock_k2_official unk_availability_status=Unknown
% @importance 0.8

0.93::true_val(availability_status, in_stock_k2); 0.07::true_val(availability_status, unk_availability_status).
measured(s3, availability_status, in_stock_k2).
all_consistent(availability_status) :- consistent(s3, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_k2)).
query(true_val(availability_status, unk_availability_status)).

0.80::acc(s25, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock=In_stock_free_shipping unk_availability_status_evo=Unknown
% @importance 0.8

0.77::true_val(availability_status_evo, in_stock); 0.23::true_val(availability_status_evo, unk_availability_status_evo).
measured(s25, availability_status_evo, in_stock).
all_consistent(availability_status_evo) :- consistent(s25, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.70::acc(s26, availability_status_the_house).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available unk_availability_status_the_house=Unknown
% @importance 0.5

0.68::true_val(availability_status_the_house, available); 0.32::true_val(availability_status_the_house, unk_availability_status_the_house).
measured(s26, availability_status_the_house, available).
all_consistent(availability_status_the_house) :- consistent(s26, availability_status_the_house).
evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, available)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

0.65::acc(s27, availability_status_snowboards_com).

% @attr availability_status_snowboards_com
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available unk_availability_status_snowboards_com=Unknown
% @importance 0.65

0.60::true_val(availability_status_snowboards_com, available); 0.40::true_val(availability_status_snowboards_com, unk_availability_status_snowboards_com).
measured(s27, availability_status_snowboards_com, available).
all_consistent(availability_status_snowboards_com) :- consistent(s27, availability_status_snowboards_com).
evidence(all_consistent(availability_status_snowboards_com)).
query(true_val(availability_status_snowboards_com, available)).
query(true_val(availability_status_snowboards_com, unk_availability_status_snowboards_com)).

0.55::acc(s2, availability_status_basenz).

% @attr availability_status_basenz
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2027=Listed_as_2027_model unk_availability_status_basenz=Unknown
% @importance 0.85

0.54::true_val(availability_status_basenz, listed_2027); 0.46::true_val(availability_status_basenz, unk_availability_status_basenz).
measured(s2, availability_status_basenz, listed_2027).
all_consistent(availability_status_basenz) :- consistent(s2, availability_status_basenz).
evidence(all_consistent(availability_status_basenz)).
query(true_val(availability_status_basenz, listed_2027)).
query(true_val(availability_status_basenz, unk_availability_status_basenz)).

0.60::acc(s17, availability_status_comp_edge).

% @attr availability_status_comp_edge
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available unk_availability_status_comp_edge=Unknown
% @importance 0.6

0.59::true_val(availability_status_comp_edge, available); 0.41::true_val(availability_status_comp_edge, unk_availability_status_comp_edge).
measured(s17, availability_status_comp_edge, available).
all_consistent(availability_status_comp_edge) :- consistent(s17, availability_status_comp_edge).
evidence(all_consistent(availability_status_comp_edge)).
query(true_val(availability_status_comp_edge, available)).
query(true_val(availability_status_comp_edge, unk_availability_status_comp_edge)).

0.60::acc(s28, return_policy_terms).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values thirty_day_return=30_day_return_exchange_unworn unk_return_policy_terms=Unknown
% @importance 0.55

0.55::true_val(return_policy_terms, thirty_day_return); 0.45::true_val(return_policy_terms, unk_return_policy_terms).
measured(s28, return_policy_terms, thirty_day_return).
all_consistent(return_policy_terms) :- consistent(s28, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, thirty_day_return)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

0.55::acc(s29, availability_status_melbourne).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status
% @values available=Available unk_availability_status_melbourne=Unknown
% @importance 0.65

0.51::true_val(availability_status_melbourne, available); 0.49::true_val(availability_status_melbourne, unk_availability_status_melbourne).
measured(s29, availability_status_melbourne, available).
all_consistent(availability_status_melbourne) :- consistent(s29, availability_status_melbourne).
evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

0.55::acc(s30, availability_status_auski).

% @attr availability_status_auski
% @type categorical
% @canonical false
% @original_name availability_status
% @values stocked_2025=Stocked_2025_free_shipping unk_availability_status_auski=Unknown
% @importance 0.6

0.51::true_val(availability_status_auski, stocked_2025); 0.49::true_val(availability_status_auski, unk_availability_status_auski).
measured(s30, availability_status_auski, stocked_2025).
all_consistent(availability_status_auski) :- consistent(s30, availability_status_auski).
evidence(all_consistent(availability_status_auski)).
query(true_val(availability_status_auski, stocked_2025)).
query(true_val(availability_status_auski, unk_availability_status_auski)).

0.55::acc(s23, availability_status_snowinn).

% @attr availability_status_snowinn
% @type categorical
% @canonical false
% @original_name availability_status
% @values intl_delivery=International_delivery unk_availability_status_snowinn=Unknown
% @importance 0.85

0.41::true_val(availability_status_snowinn, intl_delivery); 0.59::true_val(availability_status_snowinn, unk_availability_status_snowinn).
measured(s23, availability_status_snowinn, intl_delivery).
all_consistent(availability_status_snowinn) :- consistent(s23, availability_status_snowinn).
evidence(all_consistent(availability_status_snowinn)).
query(true_val(availability_status_snowinn, intl_delivery)).
query(true_val(availability_status_snowinn, unk_availability_status_snowinn)).

0.55::acc(s31, availability_status_bluezone).

% @attr availability_status_bluezone
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_free_ship=Available_free_shipping_over_50 unk_availability_status_bluezone=Unknown
% @importance 0.5

0.48::true_val(availability_status_bluezone, available_free_ship); 0.52::true_val(availability_status_bluezone, unk_availability_status_bluezone).
measured(s31, availability_status_bluezone, available_free_ship).
all_consistent(availability_status_bluezone) :- consistent(s31, availability_status_bluezone).
evidence(all_consistent(availability_status_bluezone)).
query(true_val(availability_status_bluezone, available_free_ship)).
query(true_val(availability_status_bluezone, unk_availability_status_bluezone)).

0.55::acc(s32, availability_status_s2as).

% @attr availability_status_s2as
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_2025=In_stock_2025_free_delivery unk_availability_status_s2as=Unknown
% @importance 0.5

0.48::true_val(availability_status_s2as, in_stock_2025); 0.52::true_val(availability_status_s2as, unk_availability_status_s2as).
measured(s32, availability_status_s2as, in_stock_2025).
all_consistent(availability_status_s2as) :- consistent(s32, availability_status_s2as).
evidence(all_consistent(availability_status_s2as)).
query(true_val(availability_status_s2as, in_stock_2025)).
query(true_val(availability_status_s2as, unk_availability_status_s2as)).

0.50::acc(s33, availability_status_skipro).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out_2025=2025_model_all_sold_out unk_availability_status_skipro=Unknown
% @importance 0.6

0.44::true_val(availability_status_skipro, sold_out_2025); 0.56::true_val(availability_status_skipro, unk_availability_status_skipro).
measured(s33, availability_status_skipro, sold_out_2025).
all_consistent(availability_status_skipro) :- consistent(s33, availability_status_skipro).
evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, sold_out_2025)).
query(true_val(availability_status_skipro, unk_availability_status_skipro)).

0.55::acc(s34, availability_status_corbetts).

% @attr availability_status_corbetts
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_free_ship=Available_free_shipping_over_100 unk_availability_status_corbetts=Unknown
% @importance 0.5

0.48::true_val(availability_status_corbetts, available_free_ship); 0.52::true_val(availability_status_corbetts, unk_availability_status_corbetts).
measured(s34, availability_status_corbetts, available_free_ship).
all_consistent(availability_status_corbetts) :- consistent(s34, availability_status_corbetts).
evidence(all_consistent(availability_status_corbetts)).
query(true_val(availability_status_corbetts, available_free_ship)).
query(true_val(availability_status_corbetts, unk_availability_status_corbetts)).

0.45::acc(s35, availability_status_sidelineswap).

% @attr availability_status_sidelineswap
% @type categorical
% @canonical false
% @original_name availability_status
% @values used_closeout=Used_closeout_marketplace unk_availability_status_sidelineswap=Unknown
% @importance 0.55

0.35::true_val(availability_status_sidelineswap, used_closeout); 0.65::true_val(availability_status_sidelineswap, unk_availability_status_sidelineswap).
measured(s35, availability_status_sidelineswap, used_closeout).
all_consistent(availability_status_sidelineswap) :- consistent(s35, availability_status_sidelineswap).
evidence(all_consistent(availability_status_sidelineswap)).
query(true_val(availability_status_sidelineswap, used_closeout)).
query(true_val(availability_status_sidelineswap, unk_availability_status_sidelineswap)).

0.55::acc(s36, availability_status_comor).

% @attr availability_status_comor
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_canada=Available_free_shipping_Canada unk_availability_status_comor=Unknown
% @importance 0.5

0.45::true_val(availability_status_comor, available_canada); 0.55::true_val(availability_status_comor, unk_availability_status_comor).
measured(s36, availability_status_comor, available_canada).
all_consistent(availability_status_comor) :- consistent(s36, availability_status_comor).
evidence(all_consistent(availability_status_comor)).
query(true_val(availability_status_comor, available_canada)).
query(true_val(availability_status_comor, unk_availability_status_comor)).

0.50::acc(s37, availability_status_kenver).

% @attr availability_status_kenver
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_pickup=Available_in_store_pickup unk_availability_status_kenver=Unknown
% @importance 0.4

0.39::true_val(availability_status_kenver, available_pickup); 0.61::true_val(availability_status_kenver, unk_availability_status_kenver).
measured(s37, availability_status_kenver, available_pickup).
all_consistent(availability_status_kenver) :- consistent(s37, availability_status_kenver).
evidence(all_consistent(availability_status_kenver)).
query(true_val(availability_status_kenver, available_pickup)).
query(true_val(availability_status_kenver, unk_availability_status_kenver)).

0.50::acc(s38, availability_status_snow_country).

% @attr availability_status_snow_country
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_25_26=Listed_as_25_26_model unk_availability_status_snow_country=Unknown
% @importance 0.6

0.44::true_val(availability_status_snow_country, listed_25_26); 0.56::true_val(availability_status_snow_country, unk_availability_status_snow_country).
measured(s38, availability_status_snow_country, listed_25_26).
all_consistent(availability_status_snow_country) :- consistent(s38, availability_status_snow_country).
evidence(all_consistent(availability_status_snow_country)).
query(true_val(availability_status_snow_country, listed_25_26)).
query(true_val(availability_status_snow_country, unk_availability_status_snow_country)).

0.90::acc(s3, pro_rider_name).
0.70::acc(s26, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values mark_wilson=Mark_Wilson_design_input unk_pro_rider_name=Unknown
% @importance 0.75

0.95::true_val(pro_rider_name, mark_wilson); 0.05::true_val(pro_rider_name, unk_pro_rider_name).
measured(s3, pro_rider_name, mark_wilson).
measured(s26, pro_rider_name, mark_wilson).
all_consistent(pro_rider_name) :- consistent(s3, pro_rider_name), (indep(s26), consistent(s26, pro_rider_name) ; \+indep(s26)).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, mark_wilson)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.70::acc(s26, pro_rider_name_both).

% @attr pro_rider_name_both
% @type categorical
% @canonical false
% @original_name pro_rider_name
% @values wilson_and_phipps=Mark_Wilson_and_Justin_Phipps unk_pro_rider_name_both=Unknown
% @importance 0.5

0.68::true_val(pro_rider_name_both, wilson_and_phipps); 0.32::true_val(pro_rider_name_both, unk_pro_rider_name_both).
measured(s26, pro_rider_name_both, wilson_and_phipps).
all_consistent(pro_rider_name_both) :- (indep(s26), consistent(s26, pro_rider_name_both) ; \+indep(s26)).
evidence(all_consistent(pro_rider_name_both)).
query(true_val(pro_rider_name_both, wilson_and_phipps)).
query(true_val(pro_rider_name_both, unk_pro_rider_name_both)).

0.78::acc(s15, pro_rider_name_phipps).

% @attr pro_rider_name_phipps
% @type categorical
% @canonical false
% @original_name pro_rider_name
% @values justin_phipps=Justin_Phipps unk_pro_rider_name_phipps=Unknown
% @importance 0.65

0.72::true_val(pro_rider_name_phipps, justin_phipps); 0.28::true_val(pro_rider_name_phipps, unk_pro_rider_name_phipps).
measured(s15, pro_rider_name_phipps, justin_phipps).
all_consistent(pro_rider_name_phipps) :- (indep(s14), consistent(s15, pro_rider_name_phipps) ; \+indep(s14)).
evidence(all_consistent(pro_rider_name_phipps)).
query(true_val(pro_rider_name_phipps, justin_phipps)).
query(true_val(pro_rider_name_phipps, unk_pro_rider_name_phipps)).

0.90::acc(s3, pro_rider_name_peterson).

% @attr pro_rider_name_peterson
% @type categorical
% @canonical false
% @original_name pro_rider_name
% @values noah_peterson=Noah_Peterson unk_pro_rider_name_peterson=Unknown
% @importance 1.0

0.90::true_val(pro_rider_name_peterson, noah_peterson); 0.10::true_val(pro_rider_name_peterson, unk_pro_rider_name_peterson).
measured(s3, pro_rider_name_peterson, noah_peterson).
all_consistent(pro_rider_name_peterson) :- consistent(s3, pro_rider_name_peterson).
evidence(all_consistent(pro_rider_name_peterson)).
query(true_val(pro_rider_name_peterson, noah_peterson)).
query(true_val(pro_rider_name_peterson, unk_pro_rider_name_peterson)).

0.55::acc(s40, graphic_designer_artist).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values dane_nomellini=Dane_Nomellini_Seattle unk_graphic_designer_artist=Unknown
% @importance 0.2

0.54::true_val(graphic_designer_artist, dane_nomellini); 0.46::true_val(graphic_designer_artist, unk_graphic_designer_artist).
measured(s40, graphic_designer_artist, dane_nomellini).
all_consistent(graphic_designer_artist) :- consistent(s40, graphic_designer_artist).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, dane_nomellini)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

0.60::acc(s39, graphic_designer_artist_2024).

% @attr graphic_designer_artist_2024
% @type categorical
% @canonical false
% @original_name graphic_designer_artist
% @values marcus_dixon=Marcus_Dixon_Australian unk_graphic_designer_artist_2024=Unknown
% @importance 0.2

0.59::true_val(graphic_designer_artist_2024, marcus_dixon); 0.41::true_val(graphic_designer_artist_2024, unk_graphic_designer_artist_2024).
measured(s39, graphic_designer_artist_2024, marcus_dixon).
all_consistent(graphic_designer_artist_2024) :- consistent(s39, graphic_designer_artist_2024).
evidence(all_consistent(graphic_designer_artist_2024)).
query(true_val(graphic_designer_artist_2024, marcus_dixon)).
query(true_val(graphic_designer_artist_2024, unk_graphic_designer_artist_2024)).

0.50::acc(s2, topsheet_appearance_description).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values not_yet_detailed=Not_yet_detailed unk_topsheet_appearance_description=Unknown
% @importance 0.85

0.45::true_val(topsheet_appearance_description, not_yet_detailed); 0.55::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).
measured(s2, topsheet_appearance_description, not_yet_detailed).
all_consistent(topsheet_appearance_description) :- consistent(s2, topsheet_appearance_description).
evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, not_yet_detailed)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

0.93::acc(s3, available_colors).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values yellow_orange_red=Yellow_149_151_Orange_159W_160_Red_154_156W_157 unk_available_colors=Unknown
% @importance 1.0

0.93::true_val(available_colors, yellow_orange_red); 0.07::true_val(available_colors, unk_available_colors).
measured(s3, available_colors, yellow_orange_red).
all_consistent(available_colors) :- consistent(s3, available_colors).
evidence(all_consistent(available_colors)).
query(true_val(available_colors, yellow_orange_red)).
query(true_val(available_colors, unk_available_colors)).

0.93::acc(s41, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @unit years
% @original_name warranty_period_years
% @values v3=3.0 unk_warranty_period_years=Unknown
% @importance 0.85

0.93::true_val(warranty_period_years, v3); 0.07::true_val(warranty_period_years, unk_warranty_period_years).
measured(s41, warranty_period_years, v3).
all_consistent(warranty_period_years) :- consistent(s41, warranty_period_years).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v3)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.93::acc(s41, warranty_exclusions).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty
% @values rocks_rails_abuse=Damage_from_rocks_handrails_obstacles_voids unk_warranty_exclusions=Unknown
% @importance 0.85

0.90::true_val(warranty_exclusions, rocks_rails_abuse); 0.10::true_val(warranty_exclusions, unk_warranty_exclusions).
measured(s41, warranty_exclusions, rocks_rails_abuse).
all_consistent(warranty_exclusions) :- consistent(s41, warranty_exclusions).
evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, rocks_rails_abuse)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

0.93::acc(s41, warranty_owner_req).

% @attr warranty_owner_req
% @type categorical
% @canonical false
% @original_name warranty
% @values original_purchaser_proof=Original_purchaser_only_proof_required unk_warranty_owner_req=Unknown
% @importance 0.85

0.90::true_val(warranty_owner_req, original_purchaser_proof); 0.10::true_val(warranty_owner_req, unk_warranty_owner_req).
measured(s41, warranty_owner_req, original_purchaser_proof).
all_consistent(warranty_owner_req) :- consistent(s41, warranty_owner_req).
evidence(all_consistent(warranty_owner_req)).
query(true_val(warranty_owner_req, original_purchaser_proof)).
query(true_val(warranty_owner_req, unk_warranty_owner_req)).

0.93::acc(s41, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values structural_delam_defect=Structural_cracks_delamination_manufacturing_defect unk_warranty=Unknown
% @importance 0.85

0.90::true_val(warranty, structural_delam_defect); 0.10::true_val(warranty, unk_warranty).
measured(s41, warranty, structural_delam_defect).
all_consistent(warranty) :- consistent(s41, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, structural_delam_defect)).
query(true_val(warranty, unk_warranty)).

0.93::acc(s41, warranty_dealer_req).

% @attr warranty_dealer_req
% @type categorical
% @canonical false
% @original_name warranty
% @values authorized_dealer_only=No_warranty_unauthorized_dealer unk_warranty_dealer_req=Unknown
% @importance 0.85

0.90::true_val(warranty_dealer_req, authorized_dealer_only); 0.10::true_val(warranty_dealer_req, unk_warranty_dealer_req).
measured(s41, warranty_dealer_req, authorized_dealer_only).
all_consistent(warranty_dealer_req) :- consistent(s41, warranty_dealer_req).
evidence(all_consistent(warranty_dealer_req)).
query(true_val(warranty_dealer_req, authorized_dealer_only)).
query(true_val(warranty_dealer_req, unk_warranty_dealer_req)).

0.78::acc(s42, reviewer_opinion_whitelines_camber).

% @attr reviewer_opinion_whitelines_camber
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values camber_stability_pop=Camber_stability_serious_pop unk_reviewer_opinion_whitelines_camber=Unknown
% @importance 0.8

0.68::true_val(reviewer_opinion_whitelines_camber, camber_stability_pop); 0.32::true_val(reviewer_opinion_whitelines_camber, unk_reviewer_opinion_whitelines_camber).
measured(s42, reviewer_opinion_whitelines_camber, camber_stability_pop).
all_consistent(reviewer_opinion_whitelines_camber) :- consistent(s42, reviewer_opinion_whitelines_camber).
evidence(all_consistent(reviewer_opinion_whitelines_camber)).
query(true_val(reviewer_opinion_whitelines_camber, camber_stability_pop)).
query(true_val(reviewer_opinion_whitelines_camber, unk_reviewer_opinion_whitelines_camber)).

0.78::acc(s42, reviewer_opinion_whitelines).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values great_freestyle_addition=Great_addition_fixated_on_freestyle unk_reviewer_opinion_whitelines=Unknown
% @importance 0.8

0.68::true_val(reviewer_opinion_whitelines, great_freestyle_addition); 0.32::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).
measured(s42, reviewer_opinion_whitelines, great_freestyle_addition).
all_consistent(reviewer_opinion_whitelines) :- consistent(s42, reviewer_opinion_whitelines).
evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, great_freestyle_addition)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

0.78::acc(s42, reviewer_opinion_whitelines_torsion).

% @attr reviewer_opinion_whitelines_torsion
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values fierce_torsion_responsive=Fierce_torsion_responsive_less_playful unk_reviewer_opinion_whitelines_torsion=Unknown
% @importance 0.8

0.68::true_val(reviewer_opinion_whitelines_torsion, fierce_torsion_responsive); 0.32::true_val(reviewer_opinion_whitelines_torsion, unk_reviewer_opinion_whitelines_torsion).
measured(s42, reviewer_opinion_whitelines_torsion, fierce_torsion_responsive).
all_consistent(reviewer_opinion_whitelines_torsion) :- consistent(s42, reviewer_opinion_whitelines_torsion).
evidence(all_consistent(reviewer_opinion_whitelines_torsion)).
query(true_val(reviewer_opinion_whitelines_torsion, fierce_torsion_responsive)).
query(true_val(reviewer_opinion_whitelines_torsion, unk_reviewer_opinion_whitelines_torsion)).

0.75::acc(s42, reviewer_opinion_whitelines_negative).

% @attr reviewer_opinion_whitelines_negative
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values hardtail_feel=Hardtail_feel_rough_terrain_negative unk_reviewer_opinion_whitelines_negative=Unknown
% @importance 0.8

0.68::true_val(reviewer_opinion_whitelines_negative, hardtail_feel); 0.32::true_val(reviewer_opinion_whitelines_negative, unk_reviewer_opinion_whitelines_negative).
measured(s42, reviewer_opinion_whitelines_negative, hardtail_feel).
all_consistent(reviewer_opinion_whitelines_negative) :- consistent(s42, reviewer_opinion_whitelines_negative).
evidence(all_consistent(reviewer_opinion_whitelines_negative)).
query(true_val(reviewer_opinion_whitelines_negative, hardtail_feel)).
query(true_val(reviewer_opinion_whitelines_negative, unk_reviewer_opinion_whitelines_negative)).

0.75::acc(s43, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values stiff_camber_twin_aggressive=Stiff_camber_twin_technical_aggressive_riders unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.8

0.64::true_val(reviewer_opinion_the_good_ride, stiff_camber_twin_aggressive); 0.36::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s43, reviewer_opinion_the_good_ride, stiff_camber_twin_aggressive).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s43, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, stiff_camber_twin_aggressive)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.75::acc(s43, reviewer_opinion_the_good_ride_caveat).

% @attr reviewer_opinion_the_good_ride_caveat
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values not_for_soft_mellow=Not_for_softer_mellow_freestyle unk_reviewer_opinion_the_good_ride_caveat=Unknown
% @importance 0.8

0.64::true_val(reviewer_opinion_the_good_ride_caveat, not_for_soft_mellow); 0.36::true_val(reviewer_opinion_the_good_ride_caveat, unk_reviewer_opinion_the_good_ride_caveat).
measured(s43, reviewer_opinion_the_good_ride_caveat, not_for_soft_mellow).
all_consistent(reviewer_opinion_the_good_ride_caveat) :- consistent(s43, reviewer_opinion_the_good_ride_caveat).
evidence(all_consistent(reviewer_opinion_the_good_ride_caveat)).
query(true_val(reviewer_opinion_the_good_ride_caveat, not_for_soft_mellow)).
query(true_val(reviewer_opinion_the_good_ride_caveat, unk_reviewer_opinion_the_good_ride_caveat)).

0.78::acc(s44, reviewer_opinion_whitelines_forgiving).

% @attr reviewer_opinion_whitelines_forgiving
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values responsive_forgiving=Responsive_medium_flex_forgiving_confidence unk_reviewer_opinion_whitelines_forgiving=Unknown
% @importance 0.75

0.68::true_val(reviewer_opinion_whitelines_forgiving, responsive_forgiving); 0.32::true_val(reviewer_opinion_whitelines_forgiving, unk_reviewer_opinion_whitelines_forgiving).
measured(s44, reviewer_opinion_whitelines_forgiving, responsive_forgiving).
all_consistent(reviewer_opinion_whitelines_forgiving) :- consistent(s44, reviewer_opinion_whitelines_forgiving).
evidence(all_consistent(reviewer_opinion_whitelines_forgiving)).
query(true_val(reviewer_opinion_whitelines_forgiving, responsive_forgiving)).
query(true_val(reviewer_opinion_whitelines_forgiving, unk_reviewer_opinion_whitelines_forgiving)).

0.78::acc(s44, reviewer_opinion_whitelines_base).

% @attr reviewer_opinion_whitelines_base
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values sintered_speed_tough=Sintered_4000_speed_tough_durable unk_reviewer_opinion_whitelines_base=Unknown
% @importance 0.75

0.68::true_val(reviewer_opinion_whitelines_base, sintered_speed_tough); 0.32::true_val(reviewer_opinion_whitelines_base, unk_reviewer_opinion_whitelines_base).
measured(s44, reviewer_opinion_whitelines_base, sintered_speed_tough).
all_consistent(reviewer_opinion_whitelines_base) :- consistent(s44, reviewer_opinion_whitelines_base).
evidence(all_consistent(reviewer_opinion_whitelines_base)).
query(true_val(reviewer_opinion_whitelines_base, sintered_speed_tough)).
query(true_val(reviewer_opinion_whitelines_base, unk_reviewer_opinion_whitelines_base)).

0.75::acc(s46, evo_2025_description).

% @attr evo_2025_description
% @type categorical
% @canonical true
% @original_name evo 2025 description
% @values updated_shape_flex=Slightly_updated_shape_and_flex_pattern unk_evo_2025_description=Unknown
% @importance 0.55

0.68::true_val(evo_2025_description, updated_shape_flex); 0.32::true_val(evo_2025_description, unk_evo_2025_description).
measured(s46, evo_2025_description, updated_shape_flex).
all_consistent(evo_2025_description) :- consistent(s46, evo_2025_description).
evidence(all_consistent(evo_2025_description)).
query(true_val(evo_2025_description, updated_shape_flex)).
query(true_val(evo_2025_description, unk_evo_2025_description)).

0.55::acc(s29, melbourne_snowboard_assessment).

% @attr melbourne_snowboard_assessment
% @type categorical
% @canonical true
% @original_name Melbourne Snowboard assessment
% @values park_dominant=All_mountain_ripper_dominates_park unk_melbourne_snowboard_assessment=Unknown
% @importance 0.65

0.51::true_val(melbourne_snowboard_assessment, park_dominant); 0.49::true_val(melbourne_snowboard_assessment, unk_melbourne_snowboard_assessment).
measured(s29, melbourne_snowboard_assessment, park_dominant).
all_consistent(melbourne_snowboard_assessment) :- consistent(s29, melbourne_snowboard_assessment).
evidence(all_consistent(melbourne_snowboard_assessment)).
query(true_val(melbourne_snowboard_assessment, park_dominant)).
query(true_val(melbourne_snowboard_assessment, unk_melbourne_snowboard_assessment)).

0.55::acc(s30, auski_assessment).

% @attr auski_assessment
% @type categorical
% @canonical true
% @original_name Auski assessment
% @values carbon_response_pop=Carbon_DarkWeb_increases_response_stability_pop unk_auski_assessment=Unknown
% @importance 0.6

0.51::true_val(auski_assessment, carbon_response_pop); 0.49::true_val(auski_assessment, unk_auski_assessment).
measured(s30, auski_assessment, carbon_response_pop).
all_consistent(auski_assessment) :- (indep(s30), consistent(s30, auski_assessment) ; \+indep(s30)).
evidence(all_consistent(auski_assessment)).
query(true_val(auski_assessment, carbon_response_pop)).
query(true_val(auski_assessment, unk_auski_assessment)).

0.50::acc(s47, skipro_assessment).

% @attr skipro_assessment
% @type categorical
% @canonical true
% @original_name SkiPro AZ 2026 assessment
% @values forgiving_playful_freestyle=Forgiving_playful_freestyle_speed_pop unk_skipro_assessment=Unknown
% @importance 0.7

0.47::true_val(skipro_assessment, forgiving_playful_freestyle); 0.53::true_val(skipro_assessment, unk_skipro_assessment).
measured(s47, skipro_assessment, forgiving_playful_freestyle).
all_consistent(skipro_assessment) :- consistent(s47, skipro_assessment).
evidence(all_consistent(skipro_assessment)).
query(true_val(skipro_assessment, forgiving_playful_freestyle)).
query(true_val(skipro_assessment, unk_skipro_assessment)).

0.30::acc(s48, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values freestyle_good_pop=Freestyle_good_pop_handles_mountain unk_user_review_forum=Unknown
% @importance 0.55

0.25::true_val(user_review_forum, freestyle_good_pop); 0.75::true_val(user_review_forum, unk_user_review_forum).
measured(s48, user_review_forum, freestyle_good_pop).
all_consistent(user_review_forum) :- consistent(s48, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, freestyle_good_pop)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.35::acc(s49, comparable_board_cross_brand).
0.35::acc(s50, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_doa_yes_typo_ride_algo_nitro_team=Capita_DOA_YES_Typo_Ride_Algorythm_Nitro_Team unk_comparable_board_cross_brand=Unknown
% @importance 0.7

0.55::true_val(comparable_board_cross_brand, capita_doa_yes_typo_ride_algo_nitro_team); 0.45::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s49, comparable_board_cross_brand, capita_doa_yes_typo_ride_algo_nitro_team).
measured(s50, comparable_board_cross_brand, capita_doa_yes_typo_ride_algo_nitro_team).
all_consistent(comparable_board_cross_brand) :- consistent(s49, comparable_board_cross_brand), consistent(s50, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa_yes_typo_ride_algo_nitro_team)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.70::acc(s51, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values k2_broadcast_passport=K2_Broadcast_K2_Passport unk_comparable_board_same_brand=Unknown
% @importance 0.6

0.49::true_val(comparable_board_same_brand, k2_broadcast_passport); 0.51::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s51, comparable_board_same_brand, k2_broadcast_passport).
all_consistent(comparable_board_same_brand) :- consistent(s51, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, k2_broadcast_passport)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.30::acc(s52, comparable_board_cross_brand_burton).

% @attr comparable_board_cross_brand_burton
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_custom=Burton_Custom_directional_twin_benchmark unk_comparable_board_cross_brand_burton=Unknown
% @importance 0.55

0.24::true_val(comparable_board_cross_brand_burton, burton_custom); 0.76::true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton).
measured(s52, comparable_board_cross_brand_burton, burton_custom).
all_consistent(comparable_board_cross_brand_burton) :- consistent(s52, comparable_board_cross_brand_burton).
evidence(all_consistent(comparable_board_cross_brand_burton)).
query(true_val(comparable_board_cross_brand_burton, burton_custom)).
query(true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton)).

0.60::acc(s24, k2_brand_reputation).

% @attr k2_brand_reputation
% @type categorical
% @canonical true
% @original_name K2 brand reputation
% @values original_american_brand=Original_American_Ski_Snowboard_Brand unk_k2_brand_reputation=Unknown
% @importance 0.7

0.60::true_val(k2_brand_reputation, original_american_brand); 0.40::true_val(k2_brand_reputation, unk_k2_brand_reputation).
measured(s24, k2_brand_reputation, original_american_brand).
all_consistent(k2_brand_reputation) :- consistent(s24, k2_brand_reputation).
evidence(all_consistent(k2_brand_reputation)).
query(true_val(k2_brand_reputation, original_american_brand)).
query(true_val(k2_brand_reputation, unk_k2_brand_reputation)).

0.50::acc(s53, k2_snowboard_industry_rank).

% @attr k2_snowboard_industry_rank
% @type categorical
% @canonical true
% @original_name K2 snowboard industry rank (historical)
% @values top_five_us=Top_five_US_sales_volume unk_k2_snowboard_industry_rank=Unknown
% @importance 0.45

0.45::true_val(k2_snowboard_industry_rank, top_five_us); 0.55::true_val(k2_snowboard_industry_rank, unk_k2_snowboard_industry_rank).
measured(s53, k2_snowboard_industry_rank, top_five_us).
all_consistent(k2_snowboard_industry_rank) :- consistent(s53, k2_snowboard_industry_rank).
evidence(all_consistent(k2_snowboard_industry_rank)).
query(true_val(k2_snowboard_industry_rank, top_five_us)).
query(true_val(k2_snowboard_industry_rank, unk_k2_snowboard_industry_rank)).

0.60::acc(s24, k2_first_womens_snowboards).

% @attr k2_first_womens_snowboards
% @type categorical
% @canonical true
% @original_name K2 first women-specific snowboards
% @values y1999_womens_alliance=1999_Womens_Alliance unk_k2_first_womens_snowboards=Unknown
% @importance 0.7

0.60::true_val(k2_first_womens_snowboards, y1999_womens_alliance); 0.40::true_val(k2_first_womens_snowboards, unk_k2_first_womens_snowboards).
measured(s24, k2_first_womens_snowboards, y1999_womens_alliance).
all_consistent(k2_first_womens_snowboards) :- consistent(s24, k2_first_womens_snowboards).
evidence(all_consistent(k2_first_womens_snowboards)).
query(true_val(k2_first_womens_snowboards, y1999_womens_alliance)).
query(true_val(k2_first_womens_snowboards, unk_k2_first_womens_snowboards)).

0.30::acc(s54, k2_china_manufacturing_reputation).

% @attr k2_china_manufacturing_reputation
% @type categorical
% @canonical true
% @original_name K2 China manufacturing reputation
% @values accepted_quality=Accepted_quality_plenty_high_quality unk_k2_china_manufacturing_reputation=Unknown
% @importance 0.5

0.25::true_val(k2_china_manufacturing_reputation, accepted_quality); 0.75::true_val(k2_china_manufacturing_reputation, unk_k2_china_manufacturing_reputation).
measured(s54, k2_china_manufacturing_reputation, accepted_quality).
all_consistent(k2_china_manufacturing_reputation) :- consistent(s54, k2_china_manufacturing_reputation).
evidence(all_consistent(k2_china_manufacturing_reputation)).
query(true_val(k2_china_manufacturing_reputation, accepted_quality)).
query(true_val(k2_china_manufacturing_reputation, unk_k2_china_manufacturing_reputation)).

0.35::acc(s55, k2_factory_quality_control).

% @attr k2_factory_quality_control
% @type categorical
% @canonical true
% @original_name K2 factory quality control
% @values same_materials_constructions=Same_materials_constructions_as_prototypes unk_k2_factory_quality_control=Unknown
% @importance 0.5

0.30::true_val(k2_factory_quality_control, same_materials_constructions); 0.70::true_val(k2_factory_quality_control, unk_k2_factory_quality_control).
measured(s55, k2_factory_quality_control, same_materials_constructions).
all_consistent(k2_factory_quality_control) :- consistent(s55, k2_factory_quality_control).
evidence(all_consistent(k2_factory_quality_control)).
query(true_val(k2_factory_quality_control, same_materials_constructions)).
query(true_val(k2_factory_quality_control, unk_k2_factory_quality_control)).

0.65::acc(s56, sustainability_certification_factory).

% @attr sustainability_certification_factory
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values eco_advanced_factory=Most_eco_tech_advanced_factory_Weihai_2014 unk_sustainability_certification_factory=Unknown
% @importance 0.45

0.56::true_val(sustainability_certification_factory, eco_advanced_factory); 0.44::true_val(sustainability_certification_factory, unk_sustainability_certification_factory).
measured(s56, sustainability_certification_factory, eco_advanced_factory).
all_consistent(sustainability_certification_factory) :- consistent(s56, sustainability_certification_factory).
evidence(all_consistent(sustainability_certification_factory)).
query(true_val(sustainability_certification_factory, eco_advanced_factory)).
query(true_val(sustainability_certification_factory, unk_sustainability_certification_factory)).

0.60::acc(s17, sustainability_certification_hybritech).

% @attr sustainability_certification_hybritech
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values reduce_waste=Hybritech_reduce_waste_energy_transfer unk_sustainability_certification_hybritech=Unknown
% @importance 0.6

0.59::true_val(sustainability_certification_hybritech, reduce_waste); 0.41::true_val(sustainability_certification_hybritech, unk_sustainability_certification_hybritech).
measured(s17, sustainability_certification_hybritech, reduce_waste).
all_consistent(sustainability_certification_hybritech) :- (indep(s17), consistent(s17, sustainability_certification_hybritech) ; \+indep(s17)).
evidence(all_consistent(sustainability_certification_hybritech)).
query(true_val(sustainability_certification_hybritech, reduce_waste)).
query(true_val(sustainability_certification_hybritech, unk_sustainability_certification_hybritech)).

0.55::acc(s2, pop).
0.93::acc(s3, pop).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values high=High_BAP_Core_Carbon_DarkWeb_explosive unk_pop=Unknown
% @importance 1.0

0.95::true_val(pop, high); 0.05::true_val(pop, unk_pop).
measured(s2, pop, high).
measured(s3, pop, high).
all_consistent(pop) :- consistent(s2, pop), consistent(s3, pop).
evidence(all_consistent(pop)).
query(true_val(pop, high)).
query(true_val(pop, unk_pop)).

0.50::acc(s38, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good=Good_triax_torsion_carbon_edge_grip unk_edge_hold=Unknown
% @importance 0.6

0.44::true_val(edge_hold, good); 0.56::true_val(edge_hold, unk_edge_hold).
measured(s38, edge_hold, good).
all_consistent(edge_hold) :- consistent(s38, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good)).
query(true_val(edge_hold, unk_edge_hold)).

0.93::acc(s3, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values excellent=Excellent_true_twin_centered unk_switch_riding=Unknown
% @importance 1.0

0.93::true_val(switch_riding, excellent); 0.07::true_val(switch_riding, unk_switch_riding).
measured(s3, switch_riding, excellent).
all_consistent(switch_riding) :- consistent(s3, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, excellent)).
query(true_val(switch_riding, unk_switch_riding)).

0.50::acc(s47, terrain_suitability_assessment).

% @attr terrain_suitability_assessment
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values park_first_all_mtn=Park_first_all_mountain_capable unk_terrain_suitability_assessment=Unknown
% @importance 0.7

0.47::true_val(terrain_suitability_assessment, park_first_all_mtn); 0.53::true_val(terrain_suitability_assessment, unk_terrain_suitability_assessment).
measured(s47, terrain_suitability_assessment, park_first_all_mtn).
all_consistent(terrain_suitability_assessment) :- consistent(s47, terrain_suitability_assessment).
evidence(all_consistent(terrain_suitability_assessment)).
query(true_val(terrain_suitability_assessment, park_first_all_mtn)).
query(true_val(terrain_suitability_assessment, unk_terrain_suitability_assessment)).

0.75::acc(s16, durability).

% @attr durability
% @type categorical
% @canonical true
% @original_name Durability
% @values high_hybritech_sintered=High_Hybritech_Sintered_4000_durable unk_durability=Unknown
% @importance 0.75

0.76::true_val(durability, high_hybritech_sintered); 0.24::true_val(durability, unk_durability).
measured(s16, durability, high_hybritech_sintered).
all_consistent(durability) :- (indep(s14), consistent(s16, durability) ; \+indep(s14)).
evidence(all_consistent(durability)).
query(true_val(durability, high_hybritech_sintered)).
query(true_val(durability, unk_durability)).

0.90::acc(s21, base_glide_performance).
0.78::acc(s44, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good_sintered_wax=Sintered_4000_absorbs_wax_good_glide unk_base_glide_performance=Unknown
% @importance 0.75

0.95::true_val(base_glide_performance, good_sintered_wax); 0.05::true_val(base_glide_performance, unk_base_glide_performance).
measured(s21, base_glide_performance, good_sintered_wax).
measured(s44, base_glide_performance, good_sintered_wax).
all_consistent(base_glide_performance) :- consistent(s21, base_glide_performance), consistent(s44, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good_sintered_wax)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.90::acc(s3, chatter_performance).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values bap_dampens_vibration=BAP_Core_dampens_vibration_harsh_landings unk_chatter_performance=Unknown
% @importance 1.0

0.90::true_val(chatter_performance, bap_dampens_vibration); 0.10::true_val(chatter_performance, unk_chatter_performance).
measured(s3, chatter_performance, bap_dampens_vibration).
all_consistent(chatter_performance) :- consistent(s3, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, bap_dampens_vibration)).
query(true_val(chatter_performance, unk_chatter_performance)).

0.70::acc(s57, board_weight_grams).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values not_published=Not_published_wood_core_inconsistency unk_board_weight_grams=Unknown
% @importance 0.5

0.60::true_val(board_weight_grams, not_published); 0.40::true_val(board_weight_grams, unk_board_weight_grams).
measured(s57, board_weight_grams, not_published).
all_consistent(board_weight_grams) :- consistent(s57, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, not_published)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.78::acc(s16, swing_weight).

% @attr swing_weight
% @type categorical
% @canonical true
% @original_name Swing weight
% @values reduced_hybritech=Reduced_Hybritech_faster_spinning unk_swing_weight=Unknown
% @importance 0.75

0.76::true_val(swing_weight, reduced_hybritech); 0.24::true_val(swing_weight, unk_swing_weight).
measured(s16, swing_weight, reduced_hybritech).
all_consistent(swing_weight) :- (indep(s14), consistent(s16, swing_weight) ; \+indep(s14)).
evidence(all_consistent(swing_weight)).
query(true_val(swing_weight, reduced_hybritech)).
query(true_val(swing_weight, unk_swing_weight)).