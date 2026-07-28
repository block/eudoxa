0.80::indep(s5).
0.15::indep(s19).
0.15::indep(s20).
0.15::indep(s22).
0.15::indep(s24).
0.15::indep(s28).
0.25::indep(s30).
0.12::indep(s31).
0.15::indep(s37).
0.12::indep(s38).
0.12::indep(s40).
0.12::indep(s41).
0.25::indep(s18).
0.25::indep(s23).
0.25::indep(s33).
0.25::indep(s34).
0.20::indep(s46).
0.12::indep(s47).
0.12::indep(s48).
0.80::indep(s27).
0.80::indep(s29).
0.80::indep(s52).
0.25::indep(s44).
0.25::indep(s112).
0.15::indep(s111).
0.15::indep(s115).
0.12::indep(s50).
0.15::indep(s39).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.93::acc(s1, brand).
0.88::acc(s5, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nitro_snowboards=Nitro_Snowboards unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, nitro_snowboards); 0.05::true_val(brand, unk_brand).

measured(s1, brand, nitro_snowboards).
measured(s5, brand, nitro_snowboards).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s5), consistent(s5, brand) ; \+indep(s5)).

evidence(all_consistent(brand)).
query(true_val(brand, nitro_snowboards)).
query(true_val(brand, unk_brand)).

0.93::acc(s2, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values nitro_ag_switzerland=Nitro_AG_Hunenberg_Switzerland unk_manufacturer=Unknown
% @importance 0.6

0.90::true_val(manufacturer, nitro_ag_switzerland); 0.10::true_val(manufacturer, unk_manufacturer).

measured(s2, manufacturer, nitro_ag_switzerland).

all_consistent(manufacturer) :- consistent(s2, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, nitro_ag_switzerland)).
query(true_val(manufacturer, unk_manufacturer)).

0.93::acc(s3, eu_representative).

% @attr eu_representative
% @type categorical
% @canonical false
% @original_name EU representative
% @values nitro_dist_italia=Nitro_Distribution_Italia_Arco unk_eu_representative=Unknown
% @importance 0.3

0.90::true_val(eu_representative, nitro_dist_italia); 0.10::true_val(eu_representative, unk_eu_representative).

measured(s3, eu_representative, nitro_dist_italia).

all_consistent(eu_representative) :- consistent(s3, eu_representative).

evidence(all_consistent(eu_representative)).
query(true_val(eu_representative, nitro_dist_italia)).
query(true_val(eu_representative, unk_eu_representative)).

0.93::acc(s4, brand_founded).

% @attr brand_founded
% @type categorical
% @canonical false
% @original_name Brand founded
% @values y1990_jan6_seattle=1990_January_6_Ballard_Seattle unk_brand_founded=Unknown
% @importance 0.4

0.90::true_val(brand_founded, y1990_jan6_seattle); 0.10::true_val(brand_founded, unk_brand_founded).

measured(s4, brand_founded, y1990_jan6_seattle).

all_consistent(brand_founded) :- consistent(s4, brand_founded).

evidence(all_consistent(brand_founded)).
query(true_val(brand_founded, y1990_jan6_seattle)).
query(true_val(brand_founded, unk_brand_founded)).

0.88::acc(s5, founders).

% @attr founders
% @type categorical
% @canonical false
% @original_name Founders
% @values delago_ardelt=Thomas_Delago_and_Sepp_Ardelt unk_founders=Unknown
% @importance 0.4

0.86::true_val(founders, delago_ardelt); 0.14::true_val(founders, unk_founders).

measured(s5, founders, delago_ardelt).

all_consistent(founders) :- consistent(s5, founders).

evidence(all_consistent(founders)).
query(true_val(founders, delago_ardelt)).
query(true_val(founders, unk_founders)).

0.65::acc(s6, brand_ethos).

% @attr brand_ethos
% @type categorical
% @canonical false
% @original_name Brand ethos
% @values rider_owned_operated=Rider_owned_and_rider_operated_since_founding unk_brand_ethos=Unknown
% @importance 0.5

0.63::true_val(brand_ethos, rider_owned_operated); 0.37::true_val(brand_ethos, unk_brand_ethos).

measured(s6, brand_ethos, rider_owned_operated).

all_consistent(brand_ethos) :- consistent(s6, brand_ethos).

evidence(all_consistent(brand_ethos)).
query(true_val(brand_ethos, rider_owned_operated)).
query(true_val(brand_ethos, unk_brand_ethos)).

0.65::acc(s7, hardgood_development_location).

% @attr hardgood_development_location
% @type categorical
% @canonical false
% @original_name Hardgood development location
% @values oberammergau_germany=Oberammergau_Germany unk_hardgood_development_location=Unknown
% @importance 0.4

0.63::true_val(hardgood_development_location, oberammergau_germany); 0.37::true_val(hardgood_development_location, unk_hardgood_development_location).

measured(s7, hardgood_development_location, oberammergau_germany).

all_consistent(hardgood_development_location) :- consistent(s7, hardgood_development_location).

evidence(all_consistent(hardgood_development_location)).
query(true_val(hardgood_development_location, oberammergau_germany)).
query(true_val(hardgood_development_location, unk_hardgood_development_location)).

0.60::acc(s8, graphics_binding_design_office).

% @attr graphics_binding_design_office
% @type categorical
% @canonical false
% @original_name Graphics/binding design office
% @values slc_utah=Salt_Lake_City_UT unk_graphics_binding_design_office=Unknown
% @importance 0.3

0.60::true_val(graphics_binding_design_office, slc_utah); 0.40::true_val(graphics_binding_design_office, unk_graphics_binding_design_office).

measured(s8, graphics_binding_design_office, slc_utah).

all_consistent(graphics_binding_design_office) :- consistent(s8, graphics_binding_design_office).

evidence(all_consistent(graphics_binding_design_office)).
query(true_val(graphics_binding_design_office, slc_utah)).
query(true_val(graphics_binding_design_office, unk_graphics_binding_design_office)).

0.65::acc(s9, global_offices).

% @attr global_offices
% @type categorical
% @canonical false
% @original_name Global offices
% @values six_countries=Switzerland_Germany_Italy_Norway_Canada_US unk_global_offices=Unknown
% @importance 0.3

0.63::true_val(global_offices, six_countries); 0.37::true_val(global_offices, unk_global_offices).

measured(s9, global_offices, six_countries).

all_consistent(global_offices) :- consistent(s9, global_offices).

evidence(all_consistent(global_offices)).
query(true_val(global_offices, six_countries)).
query(true_val(global_offices, unk_global_offices)).

0.58::acc(s10, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values taiwan_playmaker=Taiwan_Playmaker_factory unk_manufacturing_location=Unknown
% @importance 0.55

0.55::true_val(manufacturing_location, taiwan_playmaker); 0.45::true_val(manufacturing_location, unk_manufacturing_location).

measured(s10, manufacturing_location, taiwan_playmaker).

all_consistent(manufacturing_location) :- consistent(s10, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, taiwan_playmaker)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.88::acc(s11, sustainability_certification_solar).
0.88::acc(s49, sustainability_certification_solar).

% @attr sustainability_certification_solar
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values solar_100_pct=100_pct_solar_power_700KW unk_sustainability_certification_solar=Unknown
% @importance 0.425

0.95::true_val(sustainability_certification_solar, solar_100_pct); 0.05::true_val(sustainability_certification_solar, unk_sustainability_certification_solar).

measured(s11, sustainability_certification_solar, solar_100_pct).
measured(s49, sustainability_certification_solar, solar_100_pct).

all_consistent(sustainability_certification_solar) :-
    consistent(s11, sustainability_certification_solar),
    consistent(s49, sustainability_certification_solar).

evidence(all_consistent(sustainability_certification_solar)).
query(true_val(sustainability_certification_solar, solar_100_pct)).
query(true_val(sustainability_certification_solar, unk_sustainability_certification_solar)).

0.42::acc(s12, approximate_company_size).

% @attr approximate_company_size
% @type categorical
% @canonical false
% @original_name Approximate company size
% @values about_81_employees=About_81_employees_4_continents unk_approximate_company_size=Unknown
% @importance 0.25

0.40::true_val(approximate_company_size, about_81_employees); 0.60::true_val(approximate_company_size, unk_approximate_company_size).

measured(s12, approximate_company_size, about_81_employees).

all_consistent(approximate_company_size) :- consistent(s12, approximate_company_size).

evidence(all_consistent(approximate_company_size)).
query(true_val(approximate_company_size, about_81_employees)).
query(true_val(approximate_company_size, unk_approximate_company_size)).

0.93::acc(s13, model_name).
0.93::acc(s14, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values prime_chroma_cam_out=Prime_Chroma_Cam_Out unk_model_name=Unknown
% @importance 0.95

0.95::true_val(model_name, prime_chroma_cam_out); 0.05::true_val(model_name, unk_model_name).

measured(s13, model_name, prime_chroma_cam_out).
measured(s14, model_name, prime_chroma_cam_out).

all_consistent(model_name) :-
    consistent(s13, model_name),
    consistent(s14, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, prime_chroma_cam_out)).
query(true_val(model_name, unk_model_name)).

0.80::acc(s15, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026_season_2025_2026 unk_model_year=Unknown
% @importance 0.8

0.77::true_val(model_year, y2026); 0.23::true_val(model_year, unk_model_year).

measured(s15, model_year, y2026).

all_consistent(model_year) :- consistent(s15, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

0.93::acc(s16, width_options).
0.68::acc(s41, width_options).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_149_152_155_158_and_Wide_156W_160W_164W unk_width_options=Unknown
% @importance 0.775

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).

measured(s16, width_options, standard_and_wide).
measured(s41, width_options, standard_and_wide).

all_consistent(width_options) :-
    consistent(s16, width_options),
    (indep(s41), consistent(s41, width_options) ; \+indep(s41)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.80::acc(s17, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values prime_raw=Prime_Raw_directional_same_core unk_comparable_board_same_brand=Unknown
% @importance 0.5

0.76::true_val(comparable_board_same_brand, prime_raw); 0.24::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s17, comparable_board_same_brand, prime_raw).

all_consistent(comparable_board_same_brand) :- consistent(s17, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, prime_raw)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.72::acc(s18, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.9

0.68::true_val(product_type, snowboard); 0.32::true_val(product_type, unk_product_type).

measured(s18, product_type, snowboard).

all_consistent(product_type) :- consistent(s18, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.72::acc(s19, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 0.9

0.68::true_val(board_category, all_mountain); 0.32::true_val(board_category, unk_board_category).

measured(s19, board_category, all_mountain).

all_consistent(board_category) :- consistent(s19, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

0.68::acc(s20, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.7

0.63::true_val(gender, mens); 0.37::true_val(gender, unk_gender).

measured(s20, gender, mens).

all_consistent(gender) :- consistent(s20, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.48::acc(s21, predecessor_model_name).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values nitro_prime_flat_out=Nitro_Prime_with_Flat_Out_Rocker unk_predecessor_model_name=Unknown
% @importance 0.6

0.45::true_val(predecessor_model_name, nitro_prime_flat_out); 0.55::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s21, predecessor_model_name, nitro_prime_flat_out).

all_consistent(predecessor_model_name) :- consistent(s21, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, nitro_prime_flat_out)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

0.60::acc(s22, redesign_year).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values new_for_2026=Cam_Out_Camber_and_Directional_Twin_new_this_season unk_redesign_year=Unknown
% @importance 0.7

0.56::true_val(redesign_year, new_for_2026); 0.44::true_val(redesign_year, unk_redesign_year).

measured(s22, redesign_year, new_for_2026).

all_consistent(redesign_year) :- consistent(s22, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, new_for_2026)).
query(true_val(redesign_year, unk_redesign_year)).

0.80::acc(s23, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values cam_out_camber=Cam_Out_Camber_true_camber_early_rise unk_camber_type=Unknown
% @importance 0.95

0.76::true_val(camber_type, cam_out_camber); 0.24::true_val(camber_type, unk_camber_type).

measured(s23, camber_type, cam_out_camber).

all_consistent(camber_type) :- consistent(s23, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, cam_out_camber)).
query(true_val(camber_type, unk_camber_type)).

0.70::acc(s24, flex_rating_10_manufacturer).
0.88::acc(s52, flex_rating_10_manufacturer).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v5=5.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.9

0.95::true_val(flex_rating_10_manufacturer, v5); 0.05::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s24, flex_rating_10_manufacturer, v5).
measured(s52, flex_rating_10_manufacturer, v5).

all_consistent(flex_rating_10_manufacturer) :-
    (indep(s24), consistent(s24, flex_rating_10_manufacturer) ; \+indep(s24)),
    (indep(s52), consistent(s52, flex_rating_10_manufacturer) ; \+indep(s52)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v5)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

0.75::acc(s25, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values all_terrain=All_Terrain_most_versatile_flex_pattern unk_flex_direction=Unknown
% @importance 0.8

0.72::true_val(flex_direction, all_terrain); 0.28::true_val(flex_direction, unk_flex_direction).

measured(s25, flex_direction, all_terrain).

all_consistent(flex_direction) :- consistent(s25, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, all_terrain)).
query(true_val(flex_direction, unk_flex_direction)).

0.72::acc(s26, flex_rating_10_evo).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values medium=Medium_3_to_5 unk_flex_rating_10_evo=Unknown
% @importance 0.7

0.68::true_val(flex_rating_10_evo, medium); 0.32::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s26, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :- consistent(s26, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

0.90::acc(s27, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.9

0.86::true_val(shape, directional_twin); 0.14::true_val(shape, unk_shape).

measured(s27, shape, directional_twin).

all_consistent(shape) :- consistent(s27, shape).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

0.65::acc(s28, shape_description).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values twin_setback_stance=True_twin_with_setback_stance unk_shape_description=Unknown
% @importance 0.8

0.63::true_val(shape_description, twin_setback_stance); 0.37::true_val(shape_description, unk_shape_description).

measured(s28, shape_description, twin_setback_stance).

all_consistent(shape_description) :- consistent(s28, shape_description).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, twin_setback_stance)).
query(true_val(shape_description, unk_shape_description)).

0.90::acc(s29, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radial=Radial_Sidecut_single_radius unk_sidecut_type=Unknown
% @importance 0.7

0.86::true_val(sidecut_type, radial); 0.14::true_val(sidecut_type, unk_sidecut_type).

measured(s29, sidecut_type, radial).

all_consistent(sidecut_type) :- consistent(s29, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.82::acc(s30, core_material).
0.65::acc(s31, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values powercore_poplar=PowerCore_tip_to_tail_poplar_wood unk_core_material=Unknown
% @importance 0.825

0.95::true_val(core_material, powercore_poplar); 0.05::true_val(core_material, unk_core_material).

measured(s30, core_material, powercore_poplar).
measured(s31, core_material, powercore_poplar).

all_consistent(core_material) :-
    (indep(s30), consistent(s30, core_material) ; \+indep(s30)),
    (indep(s31), consistent(s31, core_material) ; \+indep(s31)).

evidence(all_consistent(core_material)).
query(true_val(core_material, powercore_poplar)).
query(true_val(core_material, unk_core_material)).

0.82::acc(s32, core_profile).
0.55::acc(s111, core_profile).

% @attr core_profile
% @type categorical
% @canonical false
% @original_name Core profile
% @values standard_core_profile=Standard_Core_Profile_even_flex unk_core_profile=Unknown
% @importance 0.625

0.95::true_val(core_profile, standard_core_profile); 0.05::true_val(core_profile, unk_core_profile).

measured(s32, core_profile, standard_core_profile).
measured(s111, core_profile, standard_core_profile).

all_consistent(core_profile) :-
    (indep(s30), consistent(s32, core_profile) ; \+indep(s30)),
    (indep(s111), consistent(s111, core_profile) ; \+indep(s111)).

evidence(all_consistent(core_profile)).
query(true_val(core_profile, standard_core_profile)).
query(true_val(core_profile, unk_core_profile)).

0.75::acc(s33, laminate).
0.75::acc(s112, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values bi_lite=Bi_Lite_biaxial_fiberglass unk_laminate=Unknown
% @importance 0.65

0.95::true_val(laminate, bi_lite); 0.05::true_val(laminate, unk_laminate).

measured(s33, laminate, bi_lite).
measured(s112, laminate, bi_lite).

all_consistent(laminate) :-
    (indep(s33), consistent(s33, laminate) ; \+indep(s33)),
    (indep(s112), consistent(s112, laminate) ; \+indep(s112)).

evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite)).
query(true_val(laminate, unk_laminate)).

0.80::acc(s34, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values premium_extruded_fh=Premium_Extruded_FH_Base unk_base_type=Unknown
% @importance 0.75

0.76::true_val(base_type, premium_extruded_fh); 0.24::true_val(base_type, unk_base_type).

measured(s34, base_type, premium_extruded_fh).

all_consistent(base_type) :- consistent(s34, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, premium_extruded_fh)).
query(true_val(base_type, unk_base_type)).

0.58::acc(s35, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_sidewalls=ABS_Sidewalls_flexible_impact_resistant unk_sidewall_material=Unknown
% @importance 0.6

0.56::true_val(sidewall_material, abs_sidewalls); 0.44::true_val(sidewall_material, unk_sidewall_material).

measured(s35, sidewall_material, abs_sidewalls).

all_consistent(sidewall_material) :- consistent(s35, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_sidewalls)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.85::acc(s36, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values recycled_steel_50pct=Recycled_Steel_Edges_50pct unk_edge_technology=Unknown
% @importance 0.5

0.81::true_val(edge_technology, recycled_steel_50pct); 0.19::true_val(edge_technology, unk_edge_technology).

measured(s36, edge_technology, recycled_steel_50pct).

all_consistent(edge_technology) :- consistent(s36, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_steel_50pct)).
query(true_val(edge_technology, unk_edge_technology)).

0.62::acc(s37, mounting_pattern).
0.50::acc(s38, mounting_pattern).
0.48::acc(s115, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values insert_2x4=2x4_insert_pattern unk_mounting_pattern=Unknown
% @importance 0.7

0.95::true_val(mounting_pattern, insert_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s37, mounting_pattern, insert_2x4).
measured(s38, mounting_pattern, insert_2x4).
measured(s115, mounting_pattern, insert_2x4).

all_consistent(mounting_pattern) :-
    (indep(s37), consistent(s37, mounting_pattern) ; \+indep(s37)),
    (indep(s38), consistent(s38, mounting_pattern) ; \+indep(s38)),
    (indep(s115), consistent(s115, mounting_pattern) ; \+indep(s115)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, insert_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.50::acc(s38, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values compat_2x4_channel=Compatible_2x4_and_channel_via_mini_disc unk_binding_compatibility=Unknown
% @importance 0.65

0.47::true_val(binding_compatibility, compat_2x4_channel); 0.53::true_val(binding_compatibility, unk_binding_compatibility).

measured(s38, binding_compatibility, compat_2x4_channel).

all_consistent(binding_compatibility) :- consistent(s38, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, compat_2x4_channel)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.65::acc(s39, factory_wax).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values kandahars_natural=Kandahars_100pct_Natural_Speed_Wax_biodegradable unk_factory_wax=Unknown
% @importance 0.4

0.63::true_val(factory_wax, kandahars_natural); 0.37::true_val(factory_wax, unk_factory_wax).

measured(s39, factory_wax, kandahars_natural).

all_consistent(factory_wax) :- consistent(s39, factory_wax).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, kandahars_natural)).
query(true_val(factory_wax, unk_factory_wax)).

0.68::acc(s40, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s149_152_155_158=149cm_152cm_155cm_158cm unk_available_sizes=Unknown
% @importance 0.85

0.63::true_val(available_sizes, s149_152_155_158); 0.37::true_val(available_sizes, unk_available_sizes).

measured(s40, available_sizes, s149_152_155_158).

all_consistent(available_sizes) :- consistent(s40, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s149_152_155_158)).
query(true_val(available_sizes, unk_available_sizes)).

0.68::acc(s42, wide_version_recommended_for).

% @attr wide_version_recommended_for
% @type categorical
% @canonical false
% @original_name Wide version recommended for
% @values boot_11_5_plus=Boot_sizes_11_5_plus unk_wide_version_recommended_for=Unknown
% @importance 0.7

0.63::true_val(wide_version_recommended_for, boot_11_5_plus); 0.37::true_val(wide_version_recommended_for, unk_wide_version_recommended_for).

measured(s42, wide_version_recommended_for, boot_11_5_plus).

all_consistent(wide_version_recommended_for) :- consistent(s42, wide_version_recommended_for).

evidence(all_consistent(wide_version_recommended_for)).
query(true_val(wide_version_recommended_for, boot_11_5_plus)).
query(true_val(wide_version_recommended_for, unk_wide_version_recommended_for)).

0.85::acc(s43, setback).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit cm
% @values v_neg1_5=-1.5 unk_setback=Unknown
% @importance 0.95

0.81::true_val(setback, v_neg1_5); 0.19::true_val(setback, unk_setback).

measured(s43, setback, v_neg1_5).

all_consistent(setback) :- consistent(s43, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v_neg1_5)).
query(true_val(setback, unk_setback)).

0.85::acc(s43, specs_149).

% @attr specs_149
% @type categorical
% @canonical false
% @original_name 149cm specs
% @values confirmed_149=RL102_0cm_NT30_2cm_WW23_9cm_SR6_8m_Wt50_70kg unk_specs_149=Unknown
% @importance 0.95

0.81::true_val(specs_149, confirmed_149); 0.19::true_val(specs_149, unk_specs_149).

measured(s43, specs_149, confirmed_149).

all_consistent(specs_149) :- consistent(s43, specs_149).

evidence(all_consistent(specs_149)).
query(true_val(specs_149, confirmed_149)).
query(true_val(specs_149, unk_specs_149)).

0.85::acc(s43, specs_152).

% @attr specs_152
% @type categorical
% @canonical false
% @original_name 152cm specs
% @values confirmed_152=RL104_0cm_NT29_6cm_WW25_0cm_SR7_2m_Wt50_70kg unk_specs_152=Unknown
% @importance 0.95

0.81::true_val(specs_152, confirmed_152); 0.19::true_val(specs_152, unk_specs_152).

measured(s43, specs_152, confirmed_152).

all_consistent(specs_152) :- consistent(s43, specs_152).

evidence(all_consistent(specs_152)).
query(true_val(specs_152, confirmed_152)).
query(true_val(specs_152, unk_specs_152)).

0.85::acc(s43, specs_155).

% @attr specs_155
% @type categorical
% @canonical false
% @original_name 155cm specs
% @values confirmed_155=RL106_0cm_NT30_0cm_WW25_4cm_SR7_4m_Wt55_75kg unk_specs_155=Unknown
% @importance 0.95

0.81::true_val(specs_155, confirmed_155); 0.19::true_val(specs_155, unk_specs_155).

measured(s43, specs_155, confirmed_155).

all_consistent(specs_155) :- consistent(s43, specs_155).

evidence(all_consistent(specs_155)).
query(true_val(specs_155, confirmed_155)).
query(true_val(specs_155, unk_specs_155)).

0.85::acc(s43, specs_158).

% @attr specs_158
% @type categorical
% @canonical false
% @original_name 158cm specs
% @values confirmed_158=RL109_0cm_NT30_2cm_WW25_6cm_SR7_8m_Wt65_85kg unk_specs_158=Unknown
% @importance 0.95

0.81::true_val(specs_158, confirmed_158); 0.19::true_val(specs_158, unk_specs_158).

measured(s43, specs_158, confirmed_158).

all_consistent(specs_158) :- consistent(s43, specs_158).

evidence(all_consistent(specs_158)).
query(true_val(specs_158, confirmed_158)).
query(true_val(specs_158, unk_specs_158)).

0.85::acc(s43, specs_156w).

% @attr specs_156w
% @type categorical
% @canonical false
% @original_name 156W specs
% @values confirmed_156w=RL107_0cm_NT31_2cm_WW26_6cm_SR7_4m_Wt60_80kg unk_specs_156w=Unknown
% @importance 0.95

0.81::true_val(specs_156w, confirmed_156w); 0.19::true_val(specs_156w, unk_specs_156w).

measured(s43, specs_156w, confirmed_156w).

all_consistent(specs_156w) :- consistent(s43, specs_156w).

evidence(all_consistent(specs_156w)).
query(true_val(specs_156w, confirmed_156w)).
query(true_val(specs_156w, unk_specs_156w)).

0.85::acc(s43, specs_160w).

% @attr specs_160w
% @type categorical
% @canonical false
% @original_name 160W specs
% @values confirmed_160w=RL112_0cm_NT31_6cm_WW27_0cm_SR7_8m_Wt65_85kg unk_specs_160w=Unknown
% @importance 0.95

0.81::true_val(specs_160w, confirmed_160w); 0.19::true_val(specs_160w, unk_specs_160w).

measured(s43, specs_160w, confirmed_160w).

all_consistent(specs_160w) :- consistent(s43, specs_160w).

evidence(all_consistent(specs_160w)).
query(true_val(specs_160w, confirmed_160w)).
query(true_val(specs_160w, unk_specs_160w)).

0.85::acc(s43, specs_164w).

% @attr specs_164w
% @type categorical
% @canonical false
% @original_name 164W specs
% @values confirmed_164w=RL115_0cm_NT31_8cm_WW27_2cm_SR8_2m_Wt70plus_kg unk_specs_164w=Unknown
% @importance 0.95

0.81::true_val(specs_164w, confirmed_164w); 0.19::true_val(specs_164w, unk_specs_164w).

measured(s43, specs_164w, confirmed_164w).

all_consistent(specs_164w) :- consistent(s43, specs_164w).

evidence(all_consistent(specs_164w)).
query(true_val(specs_164w, confirmed_164w)).
query(true_val(specs_164w, unk_specs_164w)).

0.78::acc(s44, running_lengths_backcountry).

% @attr running_lengths_backcountry
% @type categorical
% @canonical false
% @original_name Running lengths (Backcountry)
% @values confirmed_all=All_running_lengths_match_merchant_data unk_running_lengths_backcountry=Unknown
% @importance 0.7

0.76::true_val(running_lengths_backcountry, confirmed_all); 0.24::true_val(running_lengths_backcountry, unk_running_lengths_backcountry).

measured(s44, running_lengths_backcountry, confirmed_all).

all_consistent(running_lengths_backcountry) :- consistent(s44, running_lengths_backcountry).

evidence(all_consistent(running_lengths_backcountry)).
query(true_val(running_lengths_backcountry, confirmed_all)).
query(true_val(running_lengths_backcountry, unk_running_lengths_backcountry)).

0.62::acc(s45, sustainability_certification_climate).

% @attr sustainability_certification_climate
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values climate_partner=ClimatePartner_carbon_footprint_measurement unk_sustainability_certification_climate=Unknown
% @importance 0.45

0.60::true_val(sustainability_certification_climate, climate_partner); 0.40::true_val(sustainability_certification_climate, unk_sustainability_certification_climate).

measured(s45, sustainability_certification_climate, climate_partner).

all_consistent(sustainability_certification_climate) :- consistent(s45, sustainability_certification_climate).

evidence(all_consistent(sustainability_certification_climate)).
query(true_val(sustainability_certification_climate, climate_partner)).
query(true_val(sustainability_certification_climate, unk_sustainability_certification_climate)).

0.70::acc(s46, sustainability_certification_fsc).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_core=FSC_certified_Powercore_wood_core unk_sustainability_certification_fsc=Unknown
% @importance 0.45

0.68::true_val(sustainability_certification_fsc, fsc_certified_core); 0.32::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s46, sustainability_certification_fsc, fsc_certified_core).

all_consistent(sustainability_certification_fsc) :- consistent(s46, sustainability_certification_fsc).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified_core)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

0.65::acc(s47, sustainability_certification_inks).

% @attr sustainability_certification_inks
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values water_based_inks=Water_based_inks unk_sustainability_certification_inks=Unknown
% @importance 0.35

0.63::true_val(sustainability_certification_inks, water_based_inks); 0.37::true_val(sustainability_certification_inks, unk_sustainability_certification_inks).

measured(s47, sustainability_certification_inks, water_based_inks).

all_consistent(sustainability_certification_inks) :- consistent(s47, sustainability_certification_inks).

evidence(all_consistent(sustainability_certification_inks)).
query(true_val(sustainability_certification_inks, water_based_inks)).
query(true_val(sustainability_certification_inks, unk_sustainability_certification_inks)).

0.62::acc(s48, sustainability_certification_recycled).

% @attr sustainability_certification_recycled
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values recycled_materials_edges=Recycled_raw_materials_and_recycled_steel_edges unk_sustainability_certification_recycled=Unknown
% @importance 0.4

0.60::true_val(sustainability_certification_recycled, recycled_materials_edges); 0.40::true_val(sustainability_certification_recycled, unk_sustainability_certification_recycled).

measured(s48, sustainability_certification_recycled, recycled_materials_edges).

all_consistent(sustainability_certification_recycled) :- consistent(s48, sustainability_certification_recycled).

evidence(all_consistent(sustainability_certification_recycled)).
query(true_val(sustainability_certification_recycled, recycled_materials_edges)).
query(true_val(sustainability_certification_recycled, unk_sustainability_certification_recycled)).

0.70::acc(s50, price_usd_msrp).
0.88::acc(s52, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v349_95=349.95 unk_price_usd_msrp=Unknown
% @importance 0.925

0.95::true_val(price_usd_msrp, v349_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s50, price_usd_msrp, v349_95).
measured(s52, price_usd_msrp, v349_95).

all_consistent(price_usd_msrp) :-
    (indep(s50), consistent(s50, price_usd_msrp) ; \+indep(s50)),
    (indep(s52), consistent(s52, price_usd_msrp) ; \+indep(s52)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v349_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.50::acc(s51, price_usd_glacier).

% @attr price_usd_glacier
% @type numeric
% @canonical false
% @original_name Price at Glacier Ski Shop
% @unit USD
% @values v349_00=349.00 unk_price_usd_glacier=Unknown
% @importance 0.8

0.46::true_val(price_usd_glacier, v349_00); 0.54::true_val(price_usd_glacier, unk_price_usd_glacier).

measured(s51, price_usd_glacier, v349_00).

all_consistent(price_usd_glacier) :- consistent(s51, price_usd_glacier).

evidence(all_consistent(price_usd_glacier)).
query(true_val(price_usd_glacier, v349_00)).
query(true_val(price_usd_glacier, unk_price_usd_glacier)).

0.82::acc(s43, price_aud_merchant_sale).

% @attr price_aud_merchant_sale
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v519_99=519.99 unk_price_aud_merchant_sale=Unknown
% @importance 0.95

0.81::true_val(price_aud_merchant_sale, v519_99); 0.19::true_val(price_aud_merchant_sale, unk_price_aud_merchant_sale).

measured(s43, price_aud_merchant_sale, v519_99).

all_consistent(price_aud_merchant_sale) :- consistent(s43, price_aud_merchant_sale).

evidence(all_consistent(price_aud_merchant_sale)).
query(true_val(price_aud_merchant_sale, v519_99)).
query(true_val(price_aud_merchant_sale, unk_price_aud_merchant_sale)).

0.82::acc(s43, price_aud_merchant_rrp).

% @attr price_aud_merchant_rrp
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v649_99=649.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.95

0.81::true_val(price_aud_merchant_rrp, v649_99); 0.19::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s43, price_aud_merchant_rrp, v649_99).

all_consistent(price_aud_merchant_rrp) :- consistent(s43, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v649_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

0.82::acc(s43, discount).

% @attr discount
% @type categorical
% @canonical false
% @original_name Discount
% @values pct_20_off=20_pct_off_RRP unk_discount=Unknown
% @importance 0.95

0.81::true_val(discount, pct_20_off); 0.19::true_val(discount, unk_discount).

measured(s43, discount, pct_20_off).

all_consistent(discount) :- consistent(s43, discount).

evidence(all_consistent(discount)).
query(true_val(discount, pct_20_off)).
query(true_val(discount, unk_discount)).

0.82::acc(s43, availability_status_merchant).

% @attr availability_status_merchant
% @type categorical
% @canonical true
% @original_name availability_status
% @values sold_out=Sold_Out unk_availability_status_merchant=Unknown
% @importance 0.95

0.81::true_val(availability_status_merchant, sold_out); 0.19::true_val(availability_status_merchant, unk_availability_status_merchant).

measured(s43, availability_status_merchant, sold_out).

all_consistent(availability_status_merchant) :- consistent(s43, availability_status_merchant).

evidence(all_consistent(availability_status_merchant)).
query(true_val(availability_status_merchant, sold_out)).
query(true_val(availability_status_merchant, unk_availability_status_merchant)).

0.70::acc(s53, price_gbp_blue_tomato_sale).

% @attr price_gbp_blue_tomato_sale
% @type numeric
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @unit GBP
% @values v281_51=281.51 unk_price_gbp_blue_tomato_sale=Unknown
% @importance 0.9

0.68::true_val(price_gbp_blue_tomato_sale, v281_51); 0.32::true_val(price_gbp_blue_tomato_sale, unk_price_gbp_blue_tomato_sale).

measured(s53, price_gbp_blue_tomato_sale, v281_51).

all_consistent(price_gbp_blue_tomato_sale) :- consistent(s53, price_gbp_blue_tomato_sale).

evidence(all_consistent(price_gbp_blue_tomato_sale)).
query(true_val(price_gbp_blue_tomato_sale, v281_51)).
query(true_val(price_gbp_blue_tomato_sale, unk_price_gbp_blue_tomato_sale)).

0.62::acc(s54, price_gbp_blue_tomato_from).

% @attr price_gbp_blue_tomato_from
% @type numeric
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @unit GBP
% @values v250_99=250.99 unk_price_gbp_blue_tomato_from=Unknown
% @importance 0.85

0.60::true_val(price_gbp_blue_tomato_from, v250_99); 0.40::true_val(price_gbp_blue_tomato_from, unk_price_gbp_blue_tomato_from).

measured(s54, price_gbp_blue_tomato_from, v250_99).

all_consistent(price_gbp_blue_tomato_from) :- consistent(s54, price_gbp_blue_tomato_from).

evidence(all_consistent(price_gbp_blue_tomato_from)).
query(true_val(price_gbp_blue_tomato_from, v250_99)).
query(true_val(price_gbp_blue_tomato_from, unk_price_gbp_blue_tomato_from)).

0.70::acc(s53, price_eur_blue_tomato).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v319_90=319.90 unk_price_eur_blue_tomato=Unknown
% @importance 0.9

0.68::true_val(price_eur_blue_tomato, v319_90); 0.32::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s53, price_eur_blue_tomato, v319_90).

all_consistent(price_eur_blue_tomato) :- consistent(s53, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v319_90)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

0.55::acc(s55, price_usd_evo).

% @attr price_usd_evo
% @type categorical
% @canonical true
% @original_name price_usd_evo
% @values listed_spring_sale=Listed_Spring_Send_Sale_up_to_60pct_off unk_price_usd_evo=Unknown
% @importance 0.7

0.48::true_val(price_usd_evo, listed_spring_sale); 0.52::true_val(price_usd_evo, unk_price_usd_evo).

measured(s55, price_usd_evo, listed_spring_sale).

all_consistent(price_usd_evo) :- consistent(s55, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, listed_spring_sale)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.65::acc(s56, price_usd_rei).

% @attr price_usd_rei
% @type categorical
% @canonical true
% @original_name price_usd_rei
% @values listed_limited=Listed_limited_availability unk_price_usd_rei=Unknown
% @importance 0.75

0.60::true_val(price_usd_rei, listed_limited); 0.40::true_val(price_usd_rei, unk_price_usd_rei).

measured(s56, price_usd_rei, listed_limited).

all_consistent(price_usd_rei) :- consistent(s56, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, listed_limited)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

0.68::acc(s57, price_usd_backcountry).

% @attr price_usd_backcountry
% @type categorical
% @canonical true
% @original_name price_usd_backcountry
% @values listed_2025=Listed_for_2025_model_year unk_price_usd_backcountry=Unknown
% @importance 0.7

0.64::true_val(price_usd_backcountry, listed_2025); 0.36::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s57, price_usd_backcountry, listed_2025).

all_consistent(price_usd_backcountry) :- consistent(s57, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, listed_2025)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

0.68::acc(s58, availability_status_amazon).

% @attr availability_status_amazon
% @type categorical
% @canonical true
% @original_name availability_status
% @values currently_unavailable=Currently_Unavailable unk_availability_status_amazon=Unknown
% @importance 0.65

0.64::true_val(availability_status_amazon, currently_unavailable); 0.36::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s58, availability_status_amazon, currently_unavailable).

all_consistent(availability_status_amazon) :- consistent(s58, availability_status_amazon).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, currently_unavailable)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

0.62::acc(s59, availability_status_blauer).

% @attr availability_status_blauer
% @type categorical
% @canonical true
% @original_name availability_status
% @values listed_full_specs=Listed_with_full_specifications unk_availability_status_blauer=Unknown
% @importance 0.6

0.60::true_val(availability_status_blauer, listed_full_specs); 0.40::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s59, availability_status_blauer, listed_full_specs).

all_consistent(availability_status_blauer) :- consistent(s59, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, listed_full_specs)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

0.68::acc(s60, availability_status_absolute_snow).

% @attr availability_status_absolute_snow
% @type categorical
% @canonical true
% @original_name availability_status
% @values listed_2026_varies=Listed_2026_availability_varies_by_size unk_availability_status_absolute_snow=Unknown
% @importance 0.6

0.64::true_val(availability_status_absolute_snow, listed_2026_varies); 0.36::true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow).

measured(s60, availability_status_absolute_snow, listed_2026_varies).

all_consistent(availability_status_absolute_snow) :- consistent(s60, availability_status_absolute_snow).

evidence(all_consistent(availability_status_absolute_snow)).
query(true_val(availability_status_absolute_snow, listed_2026_varies)).
query(true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow)).

0.55::acc(s61, availability_status_drop_rideshop).

% @attr availability_status_drop_rideshop
% @type categorical
% @canonical true
% @original_name availability_status
% @values listed=Listed unk_availability_status_drop_rideshop=Unknown
% @importance 0.5

0.52::true_val(availability_status_drop_rideshop, listed); 0.48::true_val(availability_status_drop_rideshop, unk_availability_status_drop_rideshop).

measured(s61, availability_status_drop_rideshop, listed).

all_consistent(availability_status_drop_rideshop) :- consistent(s61, availability_status_drop_rideshop).

evidence(all_consistent(availability_status_drop_rideshop)).
query(true_val(availability_status_drop_rideshop, listed)).
query(true_val(availability_status_drop_rideshop, unk_availability_status_drop_rideshop)).

0.50::acc(s62, availability_status_ridge_river).

% @attr availability_status_ridge_river
% @type categorical
% @canonical true
% @original_name availability_status
% @values listed_152=Listed_152cm unk_availability_status_ridge_river=Unknown
% @importance 0.5

0.48::true_val(availability_status_ridge_river, listed_152); 0.52::true_val(availability_status_ridge_river, unk_availability_status_ridge_river).

measured(s62, availability_status_ridge_river, listed_152).

all_consistent(availability_status_ridge_river) :- consistent(s62, availability_status_ridge_river).

evidence(all_consistent(availability_status_ridge_river)).
query(true_val(availability_status_ridge_river, listed_152)).
query(true_val(availability_status_ridge_river, unk_availability_status_ridge_river)).

0.62::acc(s63, availability_status_alpinstore).

% @attr availability_status_alpinstore
% @type categorical
% @canonical true
% @original_name availability_status
% @values listed_155=Listed_for_155cm unk_availability_status_alpinstore=Unknown
% @importance 0.5

0.60::true_val(availability_status_alpinstore, listed_155); 0.40::true_val(availability_status_alpinstore, unk_availability_status_alpinstore).

measured(s63, availability_status_alpinstore, listed_155).

all_consistent(availability_status_alpinstore) :- consistent(s63, availability_status_alpinstore).

evidence(all_consistent(availability_status_alpinstore)).
query(true_val(availability_status_alpinstore, listed_155)).
query(true_val(availability_status_alpinstore, unk_availability_status_alpinstore)).

0.70::acc(s53, availability_status_glisshop).

% @attr availability_status_glisshop
% @type categorical
% @canonical true
% @original_name availability_status
% @values avail_149_in_stock=Available_149cm_in_stock_others_out unk_availability_status_glisshop=Unknown
% @importance 0.9

0.68::true_val(availability_status_glisshop, avail_149_in_stock); 0.32::true_val(availability_status_glisshop, unk_availability_status_glisshop).

measured(s53, availability_status_glisshop, avail_149_in_stock).

all_consistent(availability_status_glisshop) :- consistent(s53, availability_status_glisshop).

evidence(all_consistent(availability_status_glisshop)).
query(true_val(availability_status_glisshop, avail_149_in_stock)).
query(true_val(availability_status_glisshop, unk_availability_status_glisshop)).

0.50::acc(s64, availability_status_curated).

% @attr availability_status_curated
% @type categorical
% @canonical true
% @original_name availability_status
% @values listed=Listed unk_availability_status_curated=Unknown
% @importance 0.5

0.46::true_val(availability_status_curated, listed); 0.54::true_val(availability_status_curated, unk_availability_status_curated).

measured(s64, availability_status_curated, listed).

all_consistent(availability_status_curated) :- consistent(s64, availability_status_curated).

evidence(all_consistent(availability_status_curated)).
query(true_val(availability_status_curated, listed)).
query(true_val(availability_status_curated, unk_availability_status_curated)).

0.52::acc(s65, availability_status_milo).

% @attr availability_status_milo
% @type categorical
% @canonical true
% @original_name availability_status
% @values listed=Listed unk_availability_status_milo=Unknown
% @importance 0.6

0.48::true_val(availability_status_milo, listed); 0.52::true_val(availability_status_milo, unk_availability_status_milo).

measured(s65, availability_status_milo, listed).

all_consistent(availability_status_milo) :- consistent(s65, availability_status_milo).

evidence(all_consistent(availability_status_milo)).
query(true_val(availability_status_milo, listed)).
query(true_val(availability_status_milo, unk_availability_status_milo)).

0.42::acc(s66, availability_status_ebay).

% @attr availability_status_ebay
% @type categorical
% @canonical true
% @original_name availability_status
% @values used_new_listings=Used_new_listings_available unk_availability_status_ebay=Unknown
% @importance 0.5

0.38::true_val(availability_status_ebay, used_new_listings); 0.62::true_val(availability_status_ebay, unk_availability_status_ebay).

measured(s66, availability_status_ebay, used_new_listings).

all_consistent(availability_status_ebay) :- consistent(s66, availability_status_ebay).

evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, used_new_listings)).
query(true_val(availability_status_ebay, unk_availability_status_ebay)).

0.93::acc(s67, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.8

0.90::true_val(warranty_period_years, v2); 0.10::true_val(warranty_period_years, unk_warranty_period_years).

measured(s67, warranty_period_years, v2).

all_consistent(warranty_period_years) :- consistent(s67, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.93::acc(s68, warranty_coverage).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty
% @values defects_material_workmanship=Defects_in_material_and_workmanship_under_normal_use unk_warranty_coverage=Unknown
% @importance 0.75

0.90::true_val(warranty_coverage, defects_material_workmanship); 0.10::true_val(warranty_coverage, unk_warranty_coverage).

measured(s68, warranty_coverage, defects_material_workmanship).

all_consistent(warranty_coverage) :- consistent(s68, warranty_coverage).

evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, defects_material_workmanship)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

0.93::acc(s69, warranty_remedy).

% @attr warranty_remedy
% @type categorical
% @canonical false
% @original_name warranty
% @values repair_or_replace=Limited_to_repair_or_replacement unk_warranty_remedy=Unknown
% @importance 0.7

0.90::true_val(warranty_remedy, repair_or_replace); 0.10::true_val(warranty_remedy, unk_warranty_remedy).

measured(s69, warranty_remedy, repair_or_replace).

all_consistent(warranty_remedy) :- consistent(s69, warranty_remedy).

evidence(all_consistent(warranty_remedy)).
query(true_val(warranty_remedy, repair_or_replace)).
query(true_val(warranty_remedy, unk_warranty_remedy)).

0.93::acc(s70, warranty_transferability).

% @attr warranty_transferability
% @type categorical
% @canonical false
% @original_name warranty
% @values original_purchaser_only=Original_purchaser_through_authorized_dealer_only unk_warranty_transferability=Unknown
% @importance 0.7

0.90::true_val(warranty_transferability, original_purchaser_only); 0.10::true_val(warranty_transferability, unk_warranty_transferability).

measured(s70, warranty_transferability, original_purchaser_only).

all_consistent(warranty_transferability) :- consistent(s70, warranty_transferability).

evidence(all_consistent(warranty_transferability)).
query(true_val(warranty_transferability, original_purchaser_only)).
query(true_val(warranty_transferability, unk_warranty_transferability)).

0.90::acc(s71, warranty_exclusions).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty
% @values impact_abuse_etc=Impact_abuse_bad_landings_negligence_wear_and_tear unk_warranty_exclusions=Unknown
% @importance 0.65

0.86::true_val(warranty_exclusions, impact_abuse_etc); 0.14::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s71, warranty_exclusions, impact_abuse_etc).

all_consistent(warranty_exclusions) :- consistent(s71, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, impact_abuse_etc)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

0.85::acc(s72, return_policy_terms).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values cust_pays_ship_to_nitro=Customer_pays_shipping_to_Nitro_Nitro_pays_return unk_return_policy_terms=Unknown
% @importance 0.55

0.81::true_val(return_policy_terms, cust_pays_ship_to_nitro); 0.19::true_val(return_policy_terms, unk_return_policy_terms).

measured(s72, return_policy_terms, cust_pays_ship_to_nitro).

all_consistent(return_policy_terms) :- consistent(s72, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, cust_pays_ship_to_nitro)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

0.78::acc(s73, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner_intermediate=Beginner_Intermediate unk_rider_level=Unknown
% @importance 0.9

0.72::true_val(rider_level, beginner_intermediate); 0.28::true_val(rider_level, unk_rider_level).

measured(s73, rider_level, beginner_intermediate).

all_consistent(rider_level) :- consistent(s73, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_intermediate)).
query(true_val(rider_level, unk_rider_level)).

0.90::acc(s74, skill_level_recommendation).
0.80::acc(s75, skill_level_recommendation).
0.72::acc(s76, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_to_intermediate=New_to_intermediate_progression_ready unk_skill_level_recommendation=Unknown
% @importance 0.783

0.95::true_val(skill_level_recommendation, beginner_to_intermediate); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s74, skill_level_recommendation, beginner_to_intermediate).
measured(s75, skill_level_recommendation, beginner_to_intermediate).
measured(s76, skill_level_recommendation, beginner_to_intermediate).

all_consistent(skill_level_recommendation) :-
    consistent(s74, skill_level_recommendation),
    consistent(s75, skill_level_recommendation),
    (indep(s76), consistent(s76, skill_level_recommendation) ; \+indep(s76)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_to_intermediate)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.68::acc(s77, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values resort_park_powder=Greens_to_park_jumps_and_powder_stashes unk_terrain_suitability=Unknown
% @importance 0.7

0.64::true_val(terrain_suitability, resort_park_powder); 0.36::true_val(terrain_suitability, unk_terrain_suitability).

measured(s77, terrain_suitability, resort_park_powder).

all_consistent(terrain_suitability) :- consistent(s77, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, resort_park_powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.72::acc(s78, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values fun_responsive_forgiving=Fun_and_responsive_turns_on_spot_forgiving unk_flex_feel=Unknown
% @importance 0.85

0.68::true_val(flex_feel, fun_responsive_forgiving); 0.32::true_val(flex_feel, unk_flex_feel).

measured(s78, flex_feel, fun_responsive_forgiving).

all_consistent(flex_feel) :- consistent(s78, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, fun_responsive_forgiving)).
query(true_val(flex_feel, unk_flex_feel)).

0.72::acc(s79, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values easy_smooth=Easy_smooth_turn_initiation_early_rise_tips unk_turn_initiation_performance=Unknown
% @importance 0.8

0.68::true_val(turn_initiation_performance, easy_smooth); 0.32::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s79, turn_initiation_performance, easy_smooth).

all_consistent(turn_initiation_performance) :- consistent(s79, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, easy_smooth)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.72::acc(s80, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good_from_camber=Good_stability_and_edge_hold_from_camber_underfoot unk_edge_hold=Unknown
% @importance 0.8

0.68::true_val(edge_hold, good_from_camber); 0.32::true_val(edge_hold, unk_edge_hold).

measured(s80, edge_hold, good_from_camber).

all_consistent(edge_hold) :- consistent(s80, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good_from_camber)).
query(true_val(edge_hold, unk_edge_hold)).

0.68::acc(s81, catch_free_performance).

% @attr catch_free_performance
% @type categorical
% @canonical false
% @original_name Catch-free performance
% @values minimizes_edge_catch=Designed_to_minimize_edge_catching_for_beginners unk_catch_free_performance=Unknown
% @importance 0.8

0.64::true_val(catch_free_performance, minimizes_edge_catch); 0.36::true_val(catch_free_performance, unk_catch_free_performance).

measured(s81, catch_free_performance, minimizes_edge_catch).

all_consistent(catch_free_performance) :- consistent(s81, catch_free_performance).

evidence(all_consistent(catch_free_performance)).
query(true_val(catch_free_performance, minimizes_edge_catch)).
query(true_val(catch_free_performance, unk_catch_free_performance)).

0.75::acc(s82, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values rides_well_switch=Rides_well_switch_directional_twin unk_switch_riding=Unknown
% @importance 0.7

0.72::true_val(switch_riding, rides_well_switch); 0.28::true_val(switch_riding, unk_switch_riding).

measured(s82, switch_riding, rides_well_switch).

all_consistent(switch_riding) :- consistent(s82, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, rides_well_switch)).
query(true_val(switch_riding, unk_switch_riding)).

0.68::acc(s83, pop).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values good_pop=Good_pop_from_camber_and_poplar_core unk_pop=Unknown
% @importance 0.7

0.64::true_val(pop, good_pop); 0.36::true_val(pop, unk_pop).

measured(s83, pop, good_pop).

all_consistent(pop) :- consistent(s83, pop).

evidence(all_consistent(pop)).
query(true_val(pop, good_pop)).
query(true_val(pop, unk_pop)).

0.60::acc(s84, stability).

% @attr stability
% @type categorical
% @canonical false
% @original_name Stability
% @values stable_ride=Stable_ride_across_multiple_sources unk_stability=Unknown
% @importance 0.75

0.56::true_val(stability, stable_ride); 0.44::true_val(stability, unk_stability).

measured(s84, stability, stable_ride).

all_consistent(stability) :- consistent(s84, stability).

evidence(all_consistent(stability)).
query(true_val(stability, stable_ride)).
query(true_val(stability, unk_stability)).

0.65::acc(s85, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values highly_forgiving=Highly_forgiving_designed_for_error_tolerance unk_positive_aspect=Unknown
% @importance 0.7

0.60::true_val(positive_aspect, highly_forgiving); 0.40::true_val(positive_aspect, unk_positive_aspect).

measured(s85, positive_aspect, highly_forgiving).

all_consistent(positive_aspect) :- consistent(s85, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, highly_forgiving)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.70::acc(s86, review_snow_chasers).

% @attr review_snow_chasers
% @type categorical
% @canonical false
% @original_name The Snow Chasers review
% @values best_beginner_board=Best_snowboard_for_beginners unk_review_snow_chasers=Unknown
% @importance 0.9

0.67::true_val(review_snow_chasers, best_beginner_board); 0.33::true_val(review_snow_chasers, unk_review_snow_chasers).

measured(s86, review_snow_chasers, best_beginner_board).

all_consistent(review_snow_chasers) :- consistent(s86, review_snow_chasers).

evidence(all_consistent(review_snow_chasers)).
query(true_val(review_snow_chasers, best_beginner_board)).
query(true_val(review_snow_chasers, unk_review_snow_chasers)).

0.68::acc(s87, review_snow_chasers_ride_quality).

% @attr review_snow_chasers_ride_quality
% @type categorical
% @canonical false
% @original_name The Snow Chasers ride quality
% @values smooth_holds_edge_forgiving=Rides_smooth_holds_edge_never_fights_you unk_review_snow_chasers_ride_quality=Unknown
% @importance 0.85

0.63::true_val(review_snow_chasers_ride_quality, smooth_holds_edge_forgiving); 0.37::true_val(review_snow_chasers_ride_quality, unk_review_snow_chasers_ride_quality).

measured(s87, review_snow_chasers_ride_quality, smooth_holds_edge_forgiving).

all_consistent(review_snow_chasers_ride_quality) :- consistent(s87, review_snow_chasers_ride_quality).

evidence(all_consistent(review_snow_chasers_ride_quality)).
query(true_val(review_snow_chasers_ride_quality, smooth_holds_edge_forgiving)).
query(true_val(review_snow_chasers_ride_quality, unk_review_snow_chasers_ride_quality)).

0.62::acc(s88, review_snow_chasers_value).

% @attr review_snow_chasers_value
% @type categorical
% @canonical false
% @original_name The Snow Chasers value
% @values hard_to_beat_price=Hard_to_beat_at_this_price unk_review_snow_chasers_value=Unknown
% @importance 0.9

0.60::true_val(review_snow_chasers_value, hard_to_beat_price); 0.40::true_val(review_snow_chasers_value, unk_review_snow_chasers_value).

measured(s88, review_snow_chasers_value, hard_to_beat_price).

all_consistent(review_snow_chasers_value) :- consistent(s88, review_snow_chasers_value).

evidence(all_consistent(review_snow_chasers_value)).
query(true_val(review_snow_chasers_value, hard_to_beat_price)).
query(true_val(review_snow_chasers_value, unk_review_snow_chasers_value)).

0.62::acc(s89, reviewer_opinion_snowboardingprofiles).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values num4_cheapest=Ranked_4_best_beginner_board_2026_cheapest_on_list unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.85

0.59::true_val(reviewer_opinion_snowboardingprofiles, num4_cheapest); 0.41::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s89, reviewer_opinion_snowboardingprofiles, num4_cheapest).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s89, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, num4_cheapest)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

0.70::acc(s90, review_absolute_snow).

% @attr review_absolute_snow
% @type categorical
% @canonical false
% @original_name Absolute-Snow review
% @values progression_with_power=Progression_with_power_forgiving_yet_responsive unk_review_absolute_snow=Unknown
% @importance 0.85

0.68::true_val(review_absolute_snow, progression_with_power); 0.32::true_val(review_absolute_snow, unk_review_absolute_snow).

measured(s90, review_absolute_snow, progression_with_power).

all_consistent(review_absolute_snow) :- consistent(s90, review_absolute_snow).

evidence(all_consistent(review_absolute_snow)).
query(true_val(review_absolute_snow, progression_with_power)).
query(true_val(review_absolute_snow, unk_review_absolute_snow)).

0.50::acc(s91, review_wobble_snow).

% @attr review_wobble_snow
% @type categorical
% @canonical false
% @original_name Wobble Snow review
% @values does_what_asked_forgiving=Does_what_you_ask_without_punishing unk_review_wobble_snow=Unknown
% @importance 0.75

0.45::true_val(review_wobble_snow, does_what_asked_forgiving); 0.55::true_val(review_wobble_snow, unk_review_wobble_snow).

measured(s91, review_wobble_snow, does_what_asked_forgiving).

all_consistent(review_wobble_snow) :- consistent(s91, review_wobble_snow).

evidence(all_consistent(review_wobble_snow)).
query(true_val(review_wobble_snow, does_what_asked_forgiving)).
query(true_val(review_wobble_snow, unk_review_wobble_snow)).

0.50::acc(s92, review_wobble_snow_value).

% @attr review_wobble_snow_value
% @type categorical
% @canonical false
% @original_name Wobble Snow value assessment
% @values impressive_for_money=Honestly_impressive_how_sorted_for_the_money unk_review_wobble_snow_value=Unknown
% @importance 0.85

0.45::true_val(review_wobble_snow_value, impressive_for_money); 0.55::true_val(review_wobble_snow_value, unk_review_wobble_snow_value).

measured(s92, review_wobble_snow_value, impressive_for_money).

all_consistent(review_wobble_snow_value) :- consistent(s92, review_wobble_snow_value).

evidence(all_consistent(review_wobble_snow_value)).
query(true_val(review_wobble_snow_value, impressive_for_money)).
query(true_val(review_wobble_snow_value, unk_review_wobble_snow_value)).

0.42::acc(s93, user_review_forum_rec).

% @attr user_review_forum_rec
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values on_right_track=Recommended_for_beginner_progressing_to_intermediate unk_user_review_forum_rec=Unknown
% @importance 0.7

0.38::true_val(user_review_forum_rec, on_right_track); 0.62::true_val(user_review_forum_rec, unk_user_review_forum_rec).

measured(s93, user_review_forum_rec, on_right_track).

all_consistent(user_review_forum_rec) :- consistent(s93, user_review_forum_rec).

evidence(all_consistent(user_review_forum_rec)).
query(true_val(user_review_forum_rec, on_right_track)).
query(true_val(user_review_forum_rec, unk_user_review_forum_rec)).

0.36::acc(s94, user_review_forum_user).

% @attr user_review_forum_user
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values highly_recommended=Highly_recommended_beginner_intermediate_178cm_72kg unk_user_review_forum_user=Unknown
% @importance 0.7

0.32::true_val(user_review_forum_user, highly_recommended); 0.68::true_val(user_review_forum_user, unk_user_review_forum_user).

measured(s94, user_review_forum_user, highly_recommended).

all_consistent(user_review_forum_user) :- consistent(s94, user_review_forum_user).

evidence(all_consistent(user_review_forum_user)).
query(true_val(user_review_forum_user, highly_recommended)).
query(true_val(user_review_forum_user, unk_user_review_forum_user)).

0.70::acc(s53, glisshop_customer_rating).

% @attr glisshop_customer_rating
% @type numeric
% @canonical false
% @original_name Glisshop customer rating
% @unit /5
% @values v5=5.0 unk_glisshop_customer_rating=Unknown
% @importance 0.9

0.68::true_val(glisshop_customer_rating, v5); 0.32::true_val(glisshop_customer_rating, unk_glisshop_customer_rating).

measured(s53, glisshop_customer_rating, v5).

all_consistent(glisshop_customer_rating) :- consistent(s53, glisshop_customer_rating).

evidence(all_consistent(glisshop_customer_rating)).
query(true_val(glisshop_customer_rating, v5)).
query(true_val(glisshop_customer_rating, unk_glisshop_customer_rating)).

0.82::acc(s43, merchant_customer_rating).

% @attr merchant_customer_rating
% @type numeric
% @canonical false
% @original_name Merchant customer rating
% @unit /5
% @values v5_0=5.0 unk_merchant_customer_rating=Unknown
% @importance 0.95

0.81::true_val(merchant_customer_rating, v5_0); 0.19::true_val(merchant_customer_rating, unk_merchant_customer_rating).

measured(s43, merchant_customer_rating, v5_0).

all_consistent(merchant_customer_rating) :- consistent(s43, merchant_customer_rating).

evidence(all_consistent(merchant_customer_rating)).
query(true_val(merchant_customer_rating, v5_0)).
query(true_val(merchant_customer_rating, unk_merchant_customer_rating)).

0.68::acc(s95, backcountry_description).

% @attr backcountry_description
% @type categorical
% @canonical false
% @original_name Backcountry description
% @values shred_ready_progression=Shred_ready_designed_for_skill_progression unk_backcountry_description=Unknown
% @importance 0.7

0.64::true_val(backcountry_description, shred_ready_progression); 0.36::true_val(backcountry_description, unk_backcountry_description).

measured(s95, backcountry_description, shred_ready_progression).

all_consistent(backcountry_description) :- consistent(s95, backcountry_description).

evidence(all_consistent(backcountry_description)).
query(true_val(backcountry_description, shred_ready_progression)).
query(true_val(backcountry_description, unk_backcountry_description)).

0.72::acc(s96, negative_aspect_base_speed).

% @attr negative_aspect_base_speed
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values extruded_not_fastest=Extruded_base_not_as_fast_as_sintered unk_negative_aspect_base_speed=Unknown
% @importance 0.7

0.68::true_val(negative_aspect_base_speed, extruded_not_fastest); 0.32::true_val(negative_aspect_base_speed, unk_negative_aspect_base_speed).

measured(s96, negative_aspect_base_speed, extruded_not_fastest).

all_consistent(negative_aspect_base_speed) :- consistent(s96, negative_aspect_base_speed).

evidence(all_consistent(negative_aspect_base_speed)).
query(true_val(negative_aspect_base_speed, extruded_not_fastest)).
query(true_val(negative_aspect_base_speed, unk_negative_aspect_base_speed)).

0.55::acc(s97, negative_aspect_entry_level).

% @attr negative_aspect_entry_level
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values outgrown_by_advanced=Entry_level_advanced_riders_will_want_to_upgrade unk_negative_aspect_entry_level=Unknown
% @importance 0.7

0.49::true_val(negative_aspect_entry_level, outgrown_by_advanced); 0.51::true_val(negative_aspect_entry_level, unk_negative_aspect_entry_level).

measured(s97, negative_aspect_entry_level, outgrown_by_advanced).

all_consistent(negative_aspect_entry_level) :- consistent(s97, negative_aspect_entry_level).

evidence(all_consistent(negative_aspect_entry_level)).
query(true_val(negative_aspect_entry_level, outgrown_by_advanced)).
query(true_val(negative_aspect_entry_level, unk_negative_aspect_entry_level)).

0.60::acc(s98, negative_aspect_versatility).

% @attr negative_aspect_versatility
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values jack_of_all_trades=Jack_of_all_trades_not_purpose_built unk_negative_aspect_versatility=Unknown
% @importance 0.65

0.56::true_val(negative_aspect_versatility, jack_of_all_trades); 0.44::true_val(negative_aspect_versatility, unk_negative_aspect_versatility).

measured(s98, negative_aspect_versatility, jack_of_all_trades).

all_consistent(negative_aspect_versatility) :- consistent(s98, negative_aspect_versatility).

evidence(all_consistent(negative_aspect_versatility)).
query(true_val(negative_aspect_versatility, jack_of_all_trades)).
query(true_val(negative_aspect_versatility, unk_negative_aspect_versatility)).

0.68::acc(s99, comp_burton_instigator).

% @attr comp_burton_instigator
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values softer_less_snap=Instigator_softer_laid_back_less_snap unk_comp_burton_instigator=Unknown
% @importance 0.8

0.63::true_val(comp_burton_instigator, softer_less_snap); 0.37::true_val(comp_burton_instigator, unk_comp_burton_instigator).

measured(s99, comp_burton_instigator, softer_less_snap).

all_consistent(comp_burton_instigator) :- consistent(s99, comp_burton_instigator).

evidence(all_consistent(comp_burton_instigator)).
query(true_val(comp_burton_instigator, softer_less_snap)).
query(true_val(comp_burton_instigator, unk_comp_burton_instigator)).

0.58::acc(s100, comp_k2_standard).

% @attr comp_k2_standard
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values softer_more_twin=K2_Standard_softer_more_twinned_better_freestyle unk_comp_k2_standard=Unknown
% @importance 0.75

0.55::true_val(comp_k2_standard, softer_more_twin); 0.45::true_val(comp_k2_standard, unk_comp_k2_standard).

measured(s100, comp_k2_standard, softer_more_twin).

all_consistent(comp_k2_standard) :- consistent(s100, comp_k2_standard).

evidence(all_consistent(comp_k2_standard)).
query(true_val(comp_k2_standard, softer_more_twin)).
query(true_val(comp_k2_standard, unk_comp_k2_standard)).

0.62::acc(s101, comp_lib_tech_banana).

% @attr comp_lib_tech_banana
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values more_expensive=Lib_Tech_Skate_Banana_more_expensive_Nitro_smarter_on_budget unk_comp_lib_tech_banana=Unknown
% @importance 0.8

0.60::true_val(comp_lib_tech_banana, more_expensive); 0.40::true_val(comp_lib_tech_banana, unk_comp_lib_tech_banana).

measured(s101, comp_lib_tech_banana, more_expensive).

all_consistent(comp_lib_tech_banana) :- consistent(s101, comp_lib_tech_banana).

evidence(all_consistent(comp_lib_tech_banana)).
query(true_val(comp_lib_tech_banana, more_expensive)).
query(true_val(comp_lib_tech_banana, unk_comp_lib_tech_banana)).

0.55::acc(s102, comp_rossignol_evader).

% @attr comp_rossignol_evader
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values ranked_higher_price_increase=Evader_ranked_higher_but_price_increase_in_2026 unk_comp_rossignol_evader=Unknown
% @importance 0.7

0.52::true_val(comp_rossignol_evader, ranked_higher_price_increase); 0.48::true_val(comp_rossignol_evader, unk_comp_rossignol_evader).

measured(s102, comp_rossignol_evader, ranked_higher_price_increase).

all_consistent(comp_rossignol_evader) :- consistent(s102, comp_rossignol_evader).

evidence(all_consistent(comp_rossignol_evader)).
query(true_val(comp_rossignol_evader, ranked_higher_price_increase)).
query(true_val(comp_rossignol_evader, unk_comp_rossignol_evader)).

0.55::acc(s103, comp_burton_cultivator).

% @attr comp_burton_cultivator
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values new_2026_num1=Burton_Cultivator_new_2026_took_num1_direct_competitor unk_comp_burton_cultivator=Unknown
% @importance 0.7

0.52::true_val(comp_burton_cultivator, new_2026_num1); 0.48::true_val(comp_burton_cultivator, unk_comp_burton_cultivator).

measured(s103, comp_burton_cultivator, new_2026_num1).

all_consistent(comp_burton_cultivator) :- consistent(s103, comp_burton_cultivator).

evidence(all_consistent(comp_burton_cultivator)).
query(true_val(comp_burton_cultivator, new_2026_num1)).
query(true_val(comp_burton_cultivator, unk_comp_burton_cultivator)).

0.55::acc(s104, comp_nidecker_play).

% @attr comp_nidecker_play
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values similar_price_more_freestyle=Nidecker_Play_similar_price_more_freestyle_rocker unk_comp_nidecker_play=Unknown
% @importance 0.65

0.52::true_val(comp_nidecker_play, similar_price_more_freestyle); 0.48::true_val(comp_nidecker_play, unk_comp_nidecker_play).

measured(s104, comp_nidecker_play, similar_price_more_freestyle).

all_consistent(comp_nidecker_play) :- consistent(s104, comp_nidecker_play).

evidence(all_consistent(comp_nidecker_play)).
query(true_val(comp_nidecker_play, similar_price_more_freestyle)).
query(true_val(comp_nidecker_play, unk_comp_nidecker_play)).

0.58::acc(s105, comp_brands_general).

% @attr comp_brands_general
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values burton_k2_rossignol_etc=Burton_K2_Rossignol_Nidecker_Arbor_Lib_Tech_GNU unk_comp_brands_general=Unknown
% @importance 0.7

0.55::true_val(comp_brands_general, burton_k2_rossignol_etc); 0.45::true_val(comp_brands_general, unk_comp_brands_general).

measured(s105, comp_brands_general, burton_k2_rossignol_etc).

all_consistent(comp_brands_general) :- consistent(s105, comp_brands_general).

evidence(all_consistent(comp_brands_general)).
query(true_val(comp_brands_general, burton_k2_rossignol_etc)).
query(true_val(comp_brands_general, unk_comp_brands_general)).

0.62::acc(s106, nitro_brand_reputation).

% @attr nitro_brand_reputation
% @type categorical
% @canonical false
% @original_name Nitro brand reputation (The Snow Chasers)
% @values proven_name_gear_lasts=Listed_among_proven_names_with_gear_that_lasts unk_nitro_brand_reputation=Unknown
% @importance 0.6

0.60::true_val(nitro_brand_reputation, proven_name_gear_lasts); 0.40::true_val(nitro_brand_reputation, unk_nitro_brand_reputation).

measured(s106, nitro_brand_reputation, proven_name_gear_lasts).

all_consistent(nitro_brand_reputation) :- consistent(s106, nitro_brand_reputation).

evidence(all_consistent(nitro_brand_reputation)).
query(true_val(nitro_brand_reputation, proven_name_gear_lasts)).
query(true_val(nitro_brand_reputation, unk_nitro_brand_reputation)).

0.65::acc(s107, nitro_beginner_reputation).

% @attr nitro_beginner_reputation
% @type categorical
% @canonical false
% @original_name Nitro beginner board reputation
% @values good_value_forgiving_stable=Good_value_forgiving_stable_like_K2 unk_nitro_beginner_reputation=Unknown
% @importance 0.7

0.63::true_val(nitro_beginner_reputation, good_value_forgiving_stable); 0.37::true_val(nitro_beginner_reputation, unk_nitro_beginner_reputation).

measured(s107, nitro_beginner_reputation, good_value_forgiving_stable).

all_consistent(nitro_beginner_reputation) :- consistent(s107, nitro_beginner_reputation).

evidence(all_consistent(nitro_beginner_reputation)).
query(true_val(nitro_beginner_reputation, good_value_forgiving_stable)).
query(true_val(nitro_beginner_reputation, unk_nitro_beginner_reputation)).

0.50::acc(s108, nitro_full_line_manufacturer).

% @attr nitro_full_line_manufacturer
% @type categorical
% @canonical false
% @original_name Nitro as full-line manufacturer
% @values competitive_all_categories=One_of_few_brands_competitive_in_boards_bindings_boots unk_nitro_full_line_manufacturer=Unknown
% @importance 0.5

0.47::true_val(nitro_full_line_manufacturer, competitive_all_categories); 0.53::true_val(nitro_full_line_manufacturer, unk_nitro_full_line_manufacturer).

measured(s108, nitro_full_line_manufacturer, competitive_all_categories).

all_consistent(nitro_full_line_manufacturer) :- consistent(s108, nitro_full_line_manufacturer).

evidence(all_consistent(nitro_full_line_manufacturer)).
query(true_val(nitro_full_line_manufacturer, competitive_all_categories)).
query(true_val(nitro_full_line_manufacturer, unk_nitro_full_line_manufacturer)).

0.48::acc(s109, nitro_team_authenticity).

% @attr nitro_team_authenticity
% @type categorical
% @canonical false
% @original_name Nitro team authenticity
% @values team_rides_same_boards=Team_riders_ride_same_boards_you_buy unk_nitro_team_authenticity=Unknown
% @importance 0.45

0.44::true_val(nitro_team_authenticity, team_rides_same_boards); 0.56::true_val(nitro_team_authenticity, unk_nitro_team_authenticity).

measured(s109, nitro_team_authenticity, team_rides_same_boards).

all_consistent(nitro_team_authenticity) :- consistent(s109, nitro_team_authenticity).

evidence(all_consistent(nitro_team_authenticity)).
query(true_val(nitro_team_authenticity, team_rides_same_boards)).
query(true_val(nitro_team_authenticity, unk_nitro_team_authenticity)).

0.72::acc(s110, nose_tail_profile).

% @attr nose_tail_profile
% @type categorical
% @canonical false
% @original_name Nose/tail profile
% @values nose_slightly_longer=Nose_slightly_longer_than_tail_directional_twin unk_nose_tail_profile=Unknown
% @importance 0.55

0.68::true_val(nose_tail_profile, nose_slightly_longer); 0.32::true_val(nose_tail_profile, unk_nose_tail_profile).

measured(s110, nose_tail_profile, nose_slightly_longer).

all_consistent(nose_tail_profile) :- consistent(s110, nose_tail_profile).

evidence(all_consistent(nose_tail_profile)).
query(true_val(nose_tail_profile, nose_slightly_longer)).
query(true_val(nose_tail_profile, unk_nose_tail_profile)).

0.62::acc(s113, available_colors).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values black_red=Black_Red unk_available_colors=Unknown
% @importance 0.3

0.60::true_val(available_colors, black_red); 0.40::true_val(available_colors, unk_available_colors).

measured(s113, available_colors, black_red).

all_consistent(available_colors) :- consistent(s113, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, black_red)).
query(true_val(available_colors, unk_available_colors)).

0.52::acc(s114, sku).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values mpn_833121_001=833121_001 unk_sku=Unknown
% @importance 0.35

0.50::true_val(sku, mpn_833121_001); 0.50::true_val(sku, unk_sku).

measured(s114, sku, mpn_833121_001).

all_consistent(sku) :- consistent(s114, sku).

evidence(all_consistent(sku)).
query(true_val(sku, mpn_833121_001)).
query(true_val(sku, unk_sku)).