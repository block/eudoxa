0.15::indep(s1).
0.25::indep(s35).
0.20::indep(s25).
0.15::indep(s29).
0.80::indep(s44).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.90::acc(s1, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values nitro=Nitro unk_brand=Unknown
% @importance 0.95

0.95::true_val(brand, nitro); 0.05::true_val(brand, unk_brand).
measured(s1, brand, nitro).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, nitro)).
query(true_val(brand, unk_brand)).

0.88::acc(s2, model_name).
0.88::acc(s3, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values slash=Slash_Quiver_Slash unk_model_name=Unknown
% @importance 0.80

0.95::true_val(model_name, slash); 0.05::true_val(model_name, unk_model_name).
measured(s2, model_name, slash).
measured(s3, model_name, slash).
all_consistent(model_name) :- consistent(s2, model_name), consistent(s3, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, slash)).
query(true_val(model_name, unk_model_name)).

0.85::acc(s1, model_year).
0.88::acc(s2, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 0.93

0.95::true_val(model_year, y2026); 0.05::true_val(model_year, unk_model_year).
measured(s1, model_year, y2026).
measured(s2, model_year, y2026).
all_consistent(model_year) :-
    consistent(s2, model_year),
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

0.88::acc(s3, model_series).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values quiver_series=Quiver_Series unk_model_series=Unknown
% @importance 0.70

0.81::true_val(model_series, quiver_series); 0.19::true_val(model_series, unk_model_series).
measured(s3, model_series, quiver_series).
all_consistent(model_series) :- consistent(s3, model_series).
evidence(all_consistent(model_series)).
query(true_val(model_series, quiver_series)).
query(true_val(model_series, unk_model_series)).

0.85::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.95

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).
measured(s1, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.80::acc(s4, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride_powder=Freeride_Powder unk_board_category=Unknown
% @importance 0.85

0.71::true_val(board_category, freeride_powder); 0.29::true_val(board_category, unk_board_category).
measured(s4, board_category, freeride_powder).
all_consistent(board_category) :- consistent(s4, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, unk_board_category)).

0.82::acc(s5, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.50

0.77::true_val(gender, mens); 0.23::true_val(gender, unk_gender).
measured(s5, gender, mens).
all_consistent(gender) :- consistent(s5, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.95::acc(s6, manufacturer_address).

% @attr manufacturer_address
% @type categorical
% @canonical false
% @original_name manufacturer
% @values nitro_ag_hunenberg=Nitro_AG_Hunenberg_Switzerland unk_manufacturer_address=Unknown
% @importance 0.60

0.90::true_val(manufacturer_address, nitro_ag_hunenberg); 0.10::true_val(manufacturer_address, unk_manufacturer_address).
measured(s6, manufacturer_address, nitro_ag_hunenberg).
all_consistent(manufacturer_address) :- consistent(s6, manufacturer_address).
evidence(all_consistent(manufacturer_address)).
query(true_val(manufacturer_address, nitro_ag_hunenberg)).
query(true_val(manufacturer_address, unk_manufacturer_address)).

0.95::acc(s6, eu_representative).

% @attr eu_representative
% @type categorical
% @canonical false
% @original_name EU representative
% @values nitro_italia_arco=Nitro_Distribution_Italia_Arco unk_eu_representative=Unknown
% @importance 0.60

0.90::true_val(eu_representative, nitro_italia_arco); 0.10::true_val(eu_representative, unk_eu_representative).
measured(s6, eu_representative, nitro_italia_arco).
all_consistent(eu_representative) :- consistent(s6, eu_representative).
evidence(all_consistent(eu_representative)).
query(true_val(eu_representative, nitro_italia_arco)).
query(true_val(eu_representative, unk_eu_representative)).

0.90::acc(s7, brand_founded).

% @attr brand_founded
% @type categorical
% @canonical false
% @original_name Brand founded
% @values y1990_seattle=1990_Seattle_WA unk_brand_founded=Unknown
% @importance 0.50

0.86::true_val(brand_founded, y1990_seattle); 0.14::true_val(brand_founded, unk_brand_founded).
measured(s7, brand_founded, y1990_seattle).
all_consistent(brand_founded) :- consistent(s7, brand_founded).
evidence(all_consistent(brand_founded)).
query(true_val(brand_founded, y1990_seattle)).
query(true_val(brand_founded, unk_brand_founded)).

0.85::acc(s8, brand_history).

% @attr brand_history
% @type categorical
% @canonical false
% @original_name Brand history
% @values rider_owner_operated=Rider_owner_operated unk_brand_history=Unknown
% @importance 0.45

0.77::true_val(brand_history, rider_owner_operated); 0.23::true_val(brand_history, unk_brand_history).
measured(s8, brand_history, rider_owner_operated).
all_consistent(brand_history) :- consistent(s8, brand_history).
evidence(all_consistent(brand_history)).
query(true_val(brand_history, rider_owner_operated)).
query(true_val(brand_history, unk_brand_history)).

0.90::acc(s9, brand_distribution_policy).

% @attr brand_distribution_policy
% @type categorical
% @canonical false
% @original_name Brand does not sell direct online
% @values retailer_only=Retailer_only_no_direct_online unk_brand_distribution_policy=Unknown
% @importance 0.55

0.86::true_val(brand_distribution_policy, retailer_only); 0.14::true_val(brand_distribution_policy, unk_brand_distribution_policy).
measured(s9, brand_distribution_policy, retailer_only).
all_consistent(brand_distribution_policy) :- consistent(s9, brand_distribution_policy).
evidence(all_consistent(brand_distribution_policy)).
query(true_val(brand_distribution_policy, retailer_only)).
query(true_val(brand_distribution_policy, unk_brand_distribution_policy)).

0.70::acc(s10, product_development_hq).

% @attr product_development_hq
% @type categorical
% @canonical false
% @original_name Nitro product development headquarters
% @values oberammergau_germany=Oberammergau_Germany unk_product_development_hq=Unknown
% @importance 0.40

0.59::true_val(product_development_hq, oberammergau_germany); 0.41::true_val(product_development_hq, unk_product_development_hq).
measured(s10, product_development_hq, oberammergau_germany).
all_consistent(product_development_hq) :- consistent(s10, product_development_hq).
evidence(all_consistent(product_development_hq)).
query(true_val(product_development_hq, oberammergau_germany)).
query(true_val(product_development_hq, unk_product_development_hq)).

0.55::acc(s11, manufacturing_location_current).
0.75::acc(s12, manufacturing_location_current).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values playmaker_taiwan=Playmaker_factory_Taiwan unk_manufacturing_location_current=Unknown
% @importance 0.60

0.90::true_val(manufacturing_location_current, playmaker_taiwan); 0.10::true_val(manufacturing_location_current, unk_manufacturing_location_current).
measured(s11, manufacturing_location_current, playmaker_taiwan).
measured(s12, manufacturing_location_current, playmaker_taiwan).
all_consistent(manufacturing_location_current) :- consistent(s11, manufacturing_location_current), consistent(s12, manufacturing_location_current).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, playmaker_taiwan)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

0.70::acc(s13, manufacturing_location_prior).

% @attr manufacturing_location_prior
% @type categorical
% @canonical false
% @original_name manufacturing_location_prior
% @values elan_austria=Elan_factory_Austria unk_manufacturing_location_prior=Unknown
% @importance 0.40

0.54::true_val(manufacturing_location_prior, elan_austria); 0.46::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).
measured(s13, manufacturing_location_prior, elan_austria).
all_consistent(manufacturing_location_prior) :- consistent(s13, manufacturing_location_prior).
evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, elan_austria)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

0.78::acc(s1, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values solar_energy_100=Made_with_100pct_solar_energy unk_sustainability_certification=Unknown
% @importance 0.95

0.71::true_val(sustainability_certification, solar_energy_100); 0.29::true_val(sustainability_certification, unk_sustainability_certification).
measured(s1, sustainability_certification, solar_energy_100).
all_consistent(sustainability_certification) :- consistent(s1, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, solar_energy_100)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.50::acc(s14, model_first_available_year).
0.78::acc(s15, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical false
% @original_name model_first_available_year
% @values y2011=Since_at_least_2011 unk_model_first_available_year=Unknown
% @importance 0.50

0.80::true_val(model_first_available_year, y2011); 0.20::true_val(model_first_available_year, unk_model_first_available_year).
measured(s14, model_first_available_year, y2011).
measured(s15, model_first_available_year, y2011).
all_consistent(model_first_available_year) :- consistent(s14, model_first_available_year), consistent(s15, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2011)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.78::acc(s16, redesign_year).

% @attr redesign_year
% @type categorical
% @canonical false
% @original_name redesign_year
% @values y2021=2021 unk_redesign_year=Unknown
% @importance 0.60

0.67::true_val(redesign_year, y2021); 0.33::true_val(redesign_year, unk_redesign_year).
measured(s16, redesign_year, y2021).
all_consistent(redesign_year) :- consistent(s16, redesign_year).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, y2021)).
query(true_val(redesign_year, unk_redesign_year)).

0.80::acc(s17, camber_type).
0.55::acc(s18, camber_type).
0.95::acc(s19, camber_type).
0.85::acc(s1, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values true_camber=True_Camber cam_out_camber=Cam_Out_Camber
% @importance 0.79

0.85::true_val(camber_type, true_camber); 0.15::true_val(camber_type, cam_out_camber).
measured(s17, camber_type, true_camber).
measured(s19, camber_type, true_camber).
measured(s1, camber_type, true_camber).
measured(s18, camber_type, cam_out_camber).
all_consistent(camber_type) :-
    consistent(s17, camber_type),
    consistent(s19, camber_type),
    consistent(s18, camber_type),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, true_camber)).
query(true_val(camber_type, cam_out_camber)).

0.93::acc(s20, shape).
0.82::acc(s1, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.90

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).
measured(s20, shape, tapered_directional).
measured(s1, shape, tapered_directional).
all_consistent(shape) :-
    consistent(s20, shape),
    (indep(s1), consistent(s1, shape) ; \+indep(s1)).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

0.88::acc(s24, shape_3d).
0.82::acc(s1, shape_3d).

% @attr shape_3d
% @type categorical
% @canonical false
% @original_name shape (3D Surf Tech)
% @values surf_tech_3d=3D_Surf_Tech_convex_nose_concave_tail unk_shape_3d=Unknown
% @importance 0.93

0.95::true_val(shape_3d, surf_tech_3d); 0.05::true_val(shape_3d, unk_shape_3d).
measured(s24, shape_3d, surf_tech_3d).
measured(s1, shape_3d, surf_tech_3d).
all_consistent(shape_3d) :-
    consistent(s24, shape_3d),
    (indep(s1), consistent(s1, shape_3d) ; \+indep(s1)).
evidence(all_consistent(shape_3d)).
query(true_val(shape_3d, surf_tech_3d)).
query(true_val(shape_3d, unk_shape_3d)).

0.85::acc(s1, core_profile).
0.88::acc(s21, core_profile).

% @attr core_profile
% @type categorical
% @canonical false
% @original_name core_material (Reflex Core Profile)
% @values reflex_core=Reflex_Core_Profile unk_core_profile=Unknown
% @importance 0.83

0.95::true_val(core_profile, reflex_core); 0.05::true_val(core_profile, unk_core_profile).
measured(s1, core_profile, reflex_core).
measured(s21, core_profile, reflex_core).
all_consistent(core_profile) :-
    (indep(s1), consistent(s1, core_profile) ; \+indep(s1)),
    (indep(s35), consistent(s35, core_profile) ; \+indep(s35)).
evidence(all_consistent(core_profile)).
query(true_val(core_profile, reflex_core)).
query(true_val(core_profile, unk_core_profile)).

0.80::acc(s1, width_options).
0.75::acc(s22, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values wide=Wide unk_width_options=Unknown
% @importance 0.85

0.95::true_val(width_options, wide); 0.05::true_val(width_options, unk_width_options).
measured(s1, width_options, wide).
measured(s22, width_options, wide).
all_consistent(width_options) :-
    (indep(s1), consistent(s1, width_options) ; \+indep(s1)),
    consistent(s22, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, wide)).
query(true_val(width_options, unk_width_options)).

0.88::acc(s23, sidecut_type).
0.82::acc(s1, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values progressive=Progressive_Sidecut unk_sidecut_type=Unknown
% @importance 0.88

0.95::true_val(sidecut_type, progressive); 0.05::true_val(sidecut_type, unk_sidecut_type).
measured(s23, sidecut_type, progressive).
measured(s1, sidecut_type, progressive).
all_consistent(sidecut_type) :-
    consistent(s23, sidecut_type),
    (indep(s1), consistent(s1, sidecut_type) ; \+indep(s1)).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.82::acc(s1, flex_rating_10).
0.78::acc(s25, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v7=7.0 unk_flex_rating_10=Unknown
% @importance 0.90

0.95::true_val(flex_rating_10, v7); 0.05::true_val(flex_rating_10, unk_flex_rating_10).
measured(s1, flex_rating_10, v7).
measured(s25, flex_rating_10, v7).
all_consistent(flex_rating_10) :-
    (indep(s1), consistent(s1, flex_rating_10) ; \+indep(s1)),
    (indep(s25), consistent(s25, flex_rating_10) ; \+indep(s25)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.88::acc(s26, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_all_terrain=Directional_All_Terrain_Flex unk_flex_direction=Unknown
% @importance 0.70

0.81::true_val(flex_direction, directional_all_terrain); 0.19::true_val(flex_direction, unk_flex_direction).
measured(s26, flex_direction, directional_all_terrain).
all_consistent(flex_direction) :- consistent(s26, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_all_terrain)).
query(true_val(flex_direction, unk_flex_direction)).

0.82::acc(s1, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.95

0.71::true_val(mounting_pattern, inserts_2x4); 0.29::true_val(mounting_pattern, unk_mounting_pattern).
measured(s1, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.82::acc(s1, setback).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v_neg2_5=2.5 unk_setback=Unknown
% @importance 0.95

0.71::true_val(setback, v_neg2_5); 0.29::true_val(setback, unk_setback).
measured(s1, setback, v_neg2_5).
all_consistent(setback) :- consistent(s1, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v_neg2_5)).
query(true_val(setback, unk_setback)).

0.82::acc(s1, core_material).
0.88::acc(s27, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values powercore_ii=PowerCore_II_Poplar_Beech unk_core_material=Unknown
% @importance 0.85

0.95::true_val(core_material, powercore_ii); 0.05::true_val(core_material, unk_core_material).
measured(s1, core_material, powercore_ii).
measured(s27, core_material, powercore_ii).
all_consistent(core_material) :-
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)),
    (indep(s35), consistent(s35, core_material) ; \+indep(s35)).
evidence(all_consistent(core_material)).
query(true_val(core_material, powercore_ii)).
query(true_val(core_material, unk_core_material)).

0.82::acc(s1, laminate).
0.88::acc(s28, laminate).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values bi_lite=Bi_Lite_Laminates unk_laminate=Unknown
% @importance 0.80

0.95::true_val(laminate, bi_lite); 0.05::true_val(laminate, unk_laminate).
measured(s1, laminate, bi_lite).
measured(s28, laminate, bi_lite).
all_consistent(laminate) :-
    consistent(s28, laminate),
    (indep(s1), consistent(s1, laminate) ; \+indep(s1)).
evidence(all_consistent(laminate)).
query(true_val(laminate, bi_lite)).
query(true_val(laminate, unk_laminate)).

0.82::acc(s1, sidewall_material).
0.78::acc(s29, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values abs_sidewall=ABS_Sidewall unk_sidewall_material=Unknown
% @importance 0.78

0.95::true_val(sidewall_material, abs_sidewall); 0.05::true_val(sidewall_material, unk_sidewall_material).
measured(s1, sidewall_material, abs_sidewall).
measured(s29, sidewall_material, abs_sidewall).
all_consistent(sidewall_material) :-
    (indep(s1), consistent(s1, sidewall_material) ; \+indep(s1)),
    (indep(s29), consistent(s29, sidewall_material) ; \+indep(s29)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_sidewall)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.82::acc(s1, base_material).
0.88::acc(s30, base_material).

% @attr base_material
% @type categorical
% @canonical false
% @original_name base_material
% @values sintered_ecospeed_hd=Sintered_EcoSpeed_HD_Base unk_base_material=Unknown
% @importance 0.83

0.95::true_val(base_material, sintered_ecospeed_hd); 0.05::true_val(base_material, unk_base_material).
measured(s1, base_material, sintered_ecospeed_hd).
measured(s30, base_material, sintered_ecospeed_hd).
all_consistent(base_material) :-
    consistent(s30, base_material),
    (indep(s1), consistent(s1, base_material) ; \+indep(s1)).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_ecospeed_hd)).
query(true_val(base_material, unk_base_material)).

0.82::acc(s1, edge_technology).
0.78::acc(s29, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values recycled_steel=Recycled_Steel_Edge unk_edge_technology=Unknown
% @importance 0.78

0.95::true_val(edge_technology, recycled_steel); 0.05::true_val(edge_technology, unk_edge_technology).
measured(s1, edge_technology, recycled_steel).
measured(s29, edge_technology, recycled_steel).
all_consistent(edge_technology) :-
    (indep(s1), consistent(s1, edge_technology) ; \+indep(s1)),
    (indep(s29), consistent(s29, edge_technology) ; \+indep(s29)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, recycled_steel)).
query(true_val(edge_technology, unk_edge_technology)).

0.82::acc(s1, sustainability_certification_wax).
0.88::acc(s31, sustainability_certification_wax).

% @attr sustainability_certification_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification (Green Speed Natural Wax)
% @values green_speed_wax=Green_Speed_Natural_Wax_biodegradable unk_sustainability_certification_wax=Unknown
% @importance 0.70

0.95::true_val(sustainability_certification_wax, green_speed_wax); 0.05::true_val(sustainability_certification_wax, unk_sustainability_certification_wax).
measured(s1, sustainability_certification_wax, green_speed_wax).
measured(s31, sustainability_certification_wax, green_speed_wax).
all_consistent(sustainability_certification_wax) :-
    consistent(s31, sustainability_certification_wax),
    (indep(s1), consistent(s1, sustainability_certification_wax) ; \+indep(s1)).
evidence(all_consistent(sustainability_certification_wax)).
query(true_val(sustainability_certification_wax, green_speed_wax)).
query(true_val(sustainability_certification_wax, unk_sustainability_certification_wax)).

0.82::acc(s1, resin).
0.88::acc(s32, resin).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values ecopoxy_33=EcoPoxy_33_plant_based unk_resin=Unknown
% @importance 0.70

0.95::true_val(resin, ecopoxy_33); 0.05::true_val(resin, unk_resin).
measured(s1, resin, ecopoxy_33).
measured(s32, resin, ecopoxy_33).
all_consistent(resin) :-
    consistent(s32, resin),
    (indep(s1), consistent(s1, resin) ; \+indep(s1)).
evidence(all_consistent(resin)).
query(true_val(resin, ecopoxy_33)).
query(true_val(resin, unk_resin)).

0.82::acc(s1, topsheet).
0.88::acc(s33, topsheet).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values ecoguard=EcoGuard_Topsheet_90pct_recycled unk_topsheet=Unknown
% @importance 0.70

0.95::true_val(topsheet, ecoguard); 0.05::true_val(topsheet, unk_topsheet).
measured(s1, topsheet, ecoguard).
measured(s33, topsheet, ecoguard).
all_consistent(topsheet) :-
    consistent(s33, topsheet),
    (indep(s1), consistent(s1, topsheet) ; \+indep(s1)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, ecoguard)).
query(true_val(topsheet, unk_topsheet)).

0.78::acc(s1, sustainability_certification_base).

% @attr sustainability_certification_base
% @type categorical
% @canonical false
% @original_name sustainability_certification (EcoSpeed Base)
% @values ecospeed_85_recycled=EcoSpeed_Base_85pct_recycled_Ptex unk_sustainability_certification_base=Unknown
% @importance 0.95

0.71::true_val(sustainability_certification_base, ecospeed_85_recycled); 0.29::true_val(sustainability_certification_base, unk_sustainability_certification_base).
measured(s1, sustainability_certification_base, ecospeed_85_recycled).
all_consistent(sustainability_certification_base) :- consistent(s1, sustainability_certification_base).
evidence(all_consistent(sustainability_certification_base)).
query(true_val(sustainability_certification_base, ecospeed_85_recycled)).
query(true_val(sustainability_certification_base, unk_sustainability_certification_base)).

0.78::acc(s1, sustainability_certification_fsc).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_certified=FSC_responsibly_sourced unk_sustainability_certification_fsc=Unknown
% @importance 0.95

0.71::true_val(sustainability_certification_fsc, fsc_certified); 0.29::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).
measured(s1, sustainability_certification_fsc, fsc_certified).
all_consistent(sustainability_certification_fsc) :- consistent(s1, sustainability_certification_fsc).
evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

0.78::acc(s1, sustainability_certification_inks).

% @attr sustainability_certification_inks
% @type categorical
% @canonical false
% @original_name sustainability_certification (Water-based inks)
% @values water_based_inks=Water_based_inks unk_sustainability_certification_inks=Unknown
% @importance 0.95

0.71::true_val(sustainability_certification_inks, water_based_inks); 0.29::true_val(sustainability_certification_inks, unk_sustainability_certification_inks).
measured(s1, sustainability_certification_inks, water_based_inks).
all_consistent(sustainability_certification_inks) :- consistent(s1, sustainability_certification_inks).
evidence(all_consistent(sustainability_certification_inks)).
query(true_val(sustainability_certification_inks, water_based_inks)).
query(true_val(sustainability_certification_inks, unk_sustainability_certification_inks)).

0.78::acc(s1, sustainability_certification_recycled).

% @attr sustainability_certification_recycled
% @type categorical
% @canonical false
% @original_name sustainability_certification (Recycled raw materials)
% @values recycled_materials=Recycled_raw_materials unk_sustainability_certification_recycled=Unknown
% @importance 0.95

0.71::true_val(sustainability_certification_recycled, recycled_materials); 0.29::true_val(sustainability_certification_recycled, unk_sustainability_certification_recycled).
measured(s1, sustainability_certification_recycled, recycled_materials).
all_consistent(sustainability_certification_recycled) :- consistent(s1, sustainability_certification_recycled).
evidence(all_consistent(sustainability_certification_recycled)).
query(true_val(sustainability_certification_recycled, recycled_materials)).
query(true_val(sustainability_certification_recycled, unk_sustainability_certification_recycled)).

0.78::acc(s1, sustainability_certification_co2).

% @attr sustainability_certification_co2
% @type numeric
% @unit kg_CO2
% @canonical false
% @original_name sustainability_certification (CO2 footprint)
% @values v32_2=32.2 unk_sustainability_certification_co2=Unknown
% @importance 0.95

0.71::true_val(sustainability_certification_co2, v32_2); 0.29::true_val(sustainability_certification_co2, unk_sustainability_certification_co2).
measured(s1, sustainability_certification_co2, v32_2).
all_consistent(sustainability_certification_co2) :- consistent(s1, sustainability_certification_co2).
evidence(all_consistent(sustainability_certification_co2)).
query(true_val(sustainability_certification_co2, v32_2)).
query(true_val(sustainability_certification_co2, unk_sustainability_certification_co2)).

0.70::acc(s34, sustainability_certification_climate).

% @attr sustainability_certification_climate
% @type categorical
% @canonical false
% @original_name sustainability_certification (ClimatePartner)
% @values climate_neutral=Climate_neutral_ClimatePartner unk_sustainability_certification_climate=Unknown
% @importance 0.40

0.55::true_val(sustainability_certification_climate, climate_neutral); 0.45::true_val(sustainability_certification_climate, unk_sustainability_certification_climate).
measured(s34, sustainability_certification_climate, climate_neutral).
all_consistent(sustainability_certification_climate) :- consistent(s34, sustainability_certification_climate).
evidence(all_consistent(sustainability_certification_climate)).
query(true_val(sustainability_certification_climate, climate_neutral)).
query(true_val(sustainability_certification_climate, unk_sustainability_certification_climate)).

0.82::acc(s1, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_144_151_156_162=144_151_156_162cm unk_available_sizes=Unknown
% @importance 0.95

0.71::true_val(available_sizes, sizes_144_151_156_162); 0.29::true_val(available_sizes, unk_available_sizes).
measured(s1, available_sizes, sizes_144_151_156_162).
all_consistent(available_sizes) :- consistent(s1, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_144_151_156_162)).
query(true_val(available_sizes, unk_available_sizes)).

0.85::acc(s1, contact_length_size_144).

% @attr contact_length_size_144
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (144cm)
% @values v100_0=100.0 unk_contact_length_size_144=Unknown
% @importance 0.95

0.71::true_val(contact_length_size_144, v100_0); 0.29::true_val(contact_length_size_144, unk_contact_length_size_144).
measured(s1, contact_length_size_144, v100_0).
all_consistent(contact_length_size_144) :- consistent(s1, contact_length_size_144).
evidence(all_consistent(contact_length_size_144)).
query(true_val(contact_length_size_144, v100_0)).
query(true_val(contact_length_size_144, unk_contact_length_size_144)).

0.85::acc(s1, contact_length_size_151).

% @attr contact_length_size_151
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (151cm)
% @values v104_0=104.0 unk_contact_length_size_151=Unknown
% @importance 0.95

0.71::true_val(contact_length_size_151, v104_0); 0.29::true_val(contact_length_size_151, unk_contact_length_size_151).
measured(s1, contact_length_size_151, v104_0).
all_consistent(contact_length_size_151) :- consistent(s1, contact_length_size_151).
evidence(all_consistent(contact_length_size_151)).
query(true_val(contact_length_size_151, v104_0)).
query(true_val(contact_length_size_151, unk_contact_length_size_151)).

0.85::acc(s1, contact_length_size).
0.88::acc(s35, contact_length_size).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size (156cm)
% @values v107_0=107.0 unk_contact_length_size=Unknown
% @importance 0.93

0.95::true_val(contact_length_size, v107_0); 0.05::true_val(contact_length_size, unk_contact_length_size).
measured(s1, contact_length_size, v107_0).
measured(s35, contact_length_size, v107_0).
all_consistent(contact_length_size) :-
    (indep(s35), consistent(s35, contact_length_size) ; \+indep(s35)),
    (indep(s1), consistent(s1, contact_length_size) ; \+indep(s1)).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v107_0)).
query(true_val(contact_length_size, unk_contact_length_size)).

0.85::acc(s1, contact_length_size_162).

% @attr contact_length_size_162
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (162cm)
% @values v113_0=113.0 unk_contact_length_size_162=Unknown
% @importance 0.95

0.71::true_val(contact_length_size_162, v113_0); 0.29::true_val(contact_length_size_162, unk_contact_length_size_162).
measured(s1, contact_length_size_162, v113_0).
all_consistent(contact_length_size_162) :- consistent(s1, contact_length_size_162).
evidence(all_consistent(contact_length_size_162)).
query(true_val(contact_length_size_162, v113_0)).
query(true_val(contact_length_size_162, unk_contact_length_size_162)).

0.85::acc(s1, tip_tail_width_size_144).

% @attr tip_tail_width_size_144
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (144cm)
% @values v29_2_27_6=29.2_27.6 unk_tip_tail_width_size_144=Unknown
% @importance 0.95

0.71::true_val(tip_tail_width_size_144, v29_2_27_6); 0.29::true_val(tip_tail_width_size_144, unk_tip_tail_width_size_144).
measured(s1, tip_tail_width_size_144, v29_2_27_6).
all_consistent(tip_tail_width_size_144) :- consistent(s1, tip_tail_width_size_144).
evidence(all_consistent(tip_tail_width_size_144)).
query(true_val(tip_tail_width_size_144, v29_2_27_6)).
query(true_val(tip_tail_width_size_144, unk_tip_tail_width_size_144)).

0.85::acc(s1, tip_tail_width_size_151).

% @attr tip_tail_width_size_151
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (151cm)
% @values v30_6_29_0=30.6_29.0 unk_tip_tail_width_size_151=Unknown
% @importance 0.95

0.71::true_val(tip_tail_width_size_151, v30_6_29_0); 0.29::true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151).
measured(s1, tip_tail_width_size_151, v30_6_29_0).
all_consistent(tip_tail_width_size_151) :- consistent(s1, tip_tail_width_size_151).
evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, v30_6_29_0)).
query(true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151)).

0.85::acc(s1, tip_tail_width_size).
0.88::acc(s35, tip_tail_width_size).

% @attr tip_tail_width_size
% @type categorical
% @unit cm
% @canonical true
% @original_name tip_tail_width_size (156cm)
% @values v31_2_29_6=31.2_29.6 unk_tip_tail_width_size=Unknown
% @importance 0.93

0.95::true_val(tip_tail_width_size, v31_2_29_6); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).
measured(s1, tip_tail_width_size, v31_2_29_6).
measured(s35, tip_tail_width_size, v31_2_29_6).
all_consistent(tip_tail_width_size) :-
    (indep(s35), consistent(s35, tip_tail_width_size) ; \+indep(s35)),
    (indep(s1), consistent(s1, tip_tail_width_size) ; \+indep(s1)).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v31_2_29_6)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.85::acc(s1, tip_tail_width_size_162).

% @attr tip_tail_width_size_162
% @type categorical
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (162cm)
% @values v31_6_30_0=31.6_30.0 unk_tip_tail_width_size_162=Unknown
% @importance 0.95

0.71::true_val(tip_tail_width_size_162, v31_6_30_0); 0.29::true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162).
measured(s1, tip_tail_width_size_162, v31_6_30_0).
all_consistent(tip_tail_width_size_162) :- consistent(s1, tip_tail_width_size_162).
evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v31_6_30_0)).
query(true_val(tip_tail_width_size_162, unk_tip_tail_width_size_162)).

0.85::acc(s1, waist_width_144).

% @attr waist_width_144
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 144cm
% @values v24_7=24.7 unk_waist_width_144=Unknown
% @importance 0.95

0.71::true_val(waist_width_144, v24_7); 0.29::true_val(waist_width_144, unk_waist_width_144).
measured(s1, waist_width_144, v24_7).
all_consistent(waist_width_144) :- consistent(s1, waist_width_144).
evidence(all_consistent(waist_width_144)).
query(true_val(waist_width_144, v24_7)).
query(true_val(waist_width_144, unk_waist_width_144)).

0.85::acc(s1, waist_width_151).

% @attr waist_width_151
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 151cm
% @values v26_0=26.0 unk_waist_width_151=Unknown
% @importance 0.95

0.71::true_val(waist_width_151, v26_0); 0.29::true_val(waist_width_151, unk_waist_width_151).
measured(s1, waist_width_151, v26_0).
all_consistent(waist_width_151) :- consistent(s1, waist_width_151).
evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v26_0)).
query(true_val(waist_width_151, unk_waist_width_151)).

0.85::acc(s1, waist_width_156).
0.88::acc(s35, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v26_5=26.5 unk_waist_width_156=Unknown
% @importance 0.93

0.95::true_val(waist_width_156, v26_5); 0.05::true_val(waist_width_156, unk_waist_width_156).
measured(s1, waist_width_156, v26_5).
measured(s35, waist_width_156, v26_5).
all_consistent(waist_width_156) :-
    (indep(s35), consistent(s35, waist_width_156) ; \+indep(s35)),
    (indep(s1), consistent(s1, waist_width_156) ; \+indep(s1)).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v26_5)).
query(true_val(waist_width_156, unk_waist_width_156)).

0.85::acc(s1, waist_width_162).

% @attr waist_width_162
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162cm
% @values v26_6=26.6 unk_waist_width_162=Unknown
% @importance 0.95

0.71::true_val(waist_width_162, v26_6); 0.29::true_val(waist_width_162, unk_waist_width_162).
measured(s1, waist_width_162, v26_6).
all_consistent(waist_width_162) :- consistent(s1, waist_width_162).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v26_6)).
query(true_val(waist_width_162, unk_waist_width_162)).

0.85::acc(s1, sidecut_radius_size_144).

% @attr sidecut_radius_size_144
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (144cm)
% @values v7_1_5_1=7.1_5.1 unk_sidecut_radius_size_144=Unknown
% @importance 0.95

0.71::true_val(sidecut_radius_size_144, v7_1_5_1); 0.29::true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144).
measured(s1, sidecut_radius_size_144, v7_1_5_1).
all_consistent(sidecut_radius_size_144) :- consistent(s1, sidecut_radius_size_144).
evidence(all_consistent(sidecut_radius_size_144)).
query(true_val(sidecut_radius_size_144, v7_1_5_1)).
query(true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144)).

0.85::acc(s1, sidecut_radius_size_151).

% @attr sidecut_radius_size_151
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (151cm)
% @values v7_5_5_3=7.5_5.3 unk_sidecut_radius_size_151=Unknown
% @importance 0.95

0.71::true_val(sidecut_radius_size_151, v7_5_5_3); 0.29::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).
measured(s1, sidecut_radius_size_151, v7_5_5_3).
all_consistent(sidecut_radius_size_151) :- consistent(s1, sidecut_radius_size_151).
evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v7_5_5_3)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

0.85::acc(s1, sidecut_radius_size).
0.88::acc(s35, sidecut_radius_size).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size (156cm)
% @values v7_7_5_7=7.7_5.7 unk_sidecut_radius_size=Unknown
% @importance 0.93

0.95::true_val(sidecut_radius_size, v7_7_5_7); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s1, sidecut_radius_size, v7_7_5_7).
measured(s35, sidecut_radius_size, v7_7_5_7).
all_consistent(sidecut_radius_size) :-
    (indep(s35), consistent(s35, sidecut_radius_size) ; \+indep(s35)),
    (indep(s1), consistent(s1, sidecut_radius_size) ; \+indep(s1)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_7_5_7)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.85::acc(s1, sidecut_radius_size_162).

% @attr sidecut_radius_size_162
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @values v8_0_6_0=8.0_6.0 unk_sidecut_radius_size_162=Unknown
% @importance 0.95

0.71::true_val(sidecut_radius_size_162, v8_0_6_0); 0.29::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).
measured(s1, sidecut_radius_size_162, v8_0_6_0).
all_consistent(sidecut_radius_size_162) :- consistent(s1, sidecut_radius_size_162).
evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_0_6_0)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

0.85::acc(s1, recommended_weight_range_size_144).

% @attr recommended_weight_range_size_144
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (144cm)
% @values w40_plus=40_plus_kg unk_recommended_weight_range_size_144=Unknown
% @importance 0.95

0.71::true_val(recommended_weight_range_size_144, w40_plus); 0.29::true_val(recommended_weight_range_size_144, unk_recommended_weight_range_size_144).
measured(s1, recommended_weight_range_size_144, w40_plus).
all_consistent(recommended_weight_range_size_144) :- consistent(s1, recommended_weight_range_size_144).
evidence(all_consistent(recommended_weight_range_size_144)).
query(true_val(recommended_weight_range_size_144, w40_plus)).
query(true_val(recommended_weight_range_size_144, unk_recommended_weight_range_size_144)).

0.85::acc(s1, recommended_weight_range_size_151).

% @attr recommended_weight_range_size_151
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (151cm)
% @values w50_plus=50_plus_kg unk_recommended_weight_range_size_151=Unknown
% @importance 0.95

0.71::true_val(recommended_weight_range_size_151, w50_plus); 0.29::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).
measured(s1, recommended_weight_range_size_151, w50_plus).
all_consistent(recommended_weight_range_size_151) :- consistent(s1, recommended_weight_range_size_151).
evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, w50_plus)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

0.85::acc(s1, recommended_weight_range_size).
0.88::acc(s35, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (156cm)
% @values w60_plus=60_plus_kg_130_plus_lbs unk_recommended_weight_range_size=Unknown
% @importance 0.93

0.95::true_val(recommended_weight_range_size, w60_plus); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s1, recommended_weight_range_size, w60_plus).
measured(s35, recommended_weight_range_size, w60_plus).
all_consistent(recommended_weight_range_size) :-
    (indep(s35), consistent(s35, recommended_weight_range_size) ; \+indep(s35)),
    (indep(s1), consistent(s1, recommended_weight_range_size) ; \+indep(s1)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w60_plus)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.85::acc(s1, recommended_weight_range_size_162).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @values w70_plus=70_plus_kg unk_recommended_weight_range_size_162=Unknown
% @importance 0.95

0.71::true_val(recommended_weight_range_size_162, w70_plus); 0.29::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).
measured(s1, recommended_weight_range_size_162, w70_plus).
all_consistent(recommended_weight_range_size_162) :- consistent(s1, recommended_weight_range_size_162).
evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, w70_plus)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

0.88::acc(s35, stance_width_range_156).

% @attr stance_width_range_156
% @type numeric
% @unit inch
% @canonical false
% @original_name stance_width_range_size (156cm)
% @values v1_0=1.0 unk_stance_width_range_156=Unknown
% @importance 0.90

0.81::true_val(stance_width_range_156, v1_0); 0.19::true_val(stance_width_range_156, unk_stance_width_range_156).
measured(s35, stance_width_range_156, v1_0).
all_consistent(stance_width_range_156) :- consistent(s35, stance_width_range_156).
evidence(all_consistent(stance_width_range_156)).
query(true_val(stance_width_range_156, v1_0)).
query(true_val(stance_width_range_156, unk_stance_width_range_156)).

0.85::acc(s35, suggested_boot_size_156).

% @attr suggested_boot_size_156
% @type categorical
% @canonical false
% @original_name Suggested boot size (US) 156cm
% @values us_13_and_under=US_13_and_under unk_suggested_boot_size_156=Unknown
% @importance 0.90

0.81::true_val(suggested_boot_size_156, us_13_and_under); 0.19::true_val(suggested_boot_size_156, unk_suggested_boot_size_156).
measured(s35, suggested_boot_size_156, us_13_and_under).
all_consistent(suggested_boot_size_156) :- consistent(s35, suggested_boot_size_156).
evidence(all_consistent(suggested_boot_size_156)).
query(true_val(suggested_boot_size_156, us_13_and_under)).
query(true_val(suggested_boot_size_156, unk_suggested_boot_size_156)).

0.82::acc(s1, rider_level).
0.88::acc(s36, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_expert=Advanced_to_Expert unk_rider_level=Unknown
% @importance 0.90

0.95::true_val(rider_level, advanced_expert); 0.05::true_val(rider_level, unk_rider_level).
measured(s1, rider_level, advanced_expert).
measured(s36, rider_level, advanced_expert).
all_consistent(rider_level) :-
    consistent(s36, rider_level),
    (indep(s1), consistent(s1, rider_level) ; \+indep(s1)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

0.82::acc(s1, terrain_suitability).
0.90::acc(s37, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values freeride_powder_am=Freeride_Powder_All_Mountain unk_terrain_suitability=Unknown
% @importance 0.85

0.95::true_val(terrain_suitability, freeride_powder_am); 0.05::true_val(terrain_suitability, unk_terrain_suitability).
measured(s1, terrain_suitability, freeride_powder_am).
measured(s37, terrain_suitability, freeride_powder_am).
all_consistent(terrain_suitability) :-
    consistent(s37, terrain_suitability),
    (indep(s1), consistent(s1, terrain_suitability) ; \+indep(s1)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, freeride_powder_am)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.85::acc(s38, volume_shifted).

% @attr volume_shifted
% @type categorical
% @canonical false
% @original_name Volume-shifted board
% @values yes_ride_shorter=Volume_shifted_ride_one_step_shorter unk_volume_shifted=Unknown
% @importance 0.75

0.77::true_val(volume_shifted, yes_ride_shorter); 0.23::true_val(volume_shifted, unk_volume_shifted).
measured(s38, volume_shifted, yes_ride_shorter).
all_consistent(volume_shifted) :- consistent(s38, volume_shifted).
evidence(all_consistent(volume_shifted)).
query(true_val(volume_shifted, yes_ride_shorter)).
query(true_val(volume_shifted, unk_volume_shifted)).

0.88::acc(s37, riding_style).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values freeride_surf=Freeride_surf_inspired_feel unk_riding_style=Unknown
% @importance 0.75

0.77::true_val(riding_style, freeride_surf); 0.23::true_val(riding_style, unk_riding_style).
measured(s37, riding_style, freeride_surf).
all_consistent(riding_style) :- consistent(s37, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, freeride_surf)).
query(true_val(riding_style, unk_riding_style)).

0.82::acc(s38, terrain_suitability_secondary).

% @attr terrain_suitability_secondary
% @type categorical
% @canonical false
% @original_name terrain_suitability (secondary)
% @values powder_slush_groomers=Powder_slush_groomers unk_terrain_suitability_secondary=Unknown
% @importance 0.75

0.77::true_val(terrain_suitability_secondary, powder_slush_groomers); 0.23::true_val(terrain_suitability_secondary, unk_terrain_suitability_secondary).
measured(s38, terrain_suitability_secondary, powder_slush_groomers).
all_consistent(terrain_suitability_secondary) :- consistent(s38, terrain_suitability_secondary).
evidence(all_consistent(terrain_suitability_secondary)).
query(true_val(terrain_suitability_secondary, powder_slush_groomers)).
query(true_val(terrain_suitability_secondary, unk_terrain_suitability_secondary)).

0.92::acc(s39, price_usd_msrp).
0.90::acc(s44, price_usd_msrp).
0.80::acc(s58, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v599_95=599.95 unk_price_usd_msrp=Unknown
% @importance 0.92

0.97::true_val(price_usd_msrp, v599_95); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s39, price_usd_msrp, v599_95).
measured(s44, price_usd_msrp, v599_95).
measured(s58, price_usd_msrp, v599_95).
all_consistent(price_usd_msrp) :-
    consistent(s39, price_usd_msrp),
    (indep(s44), consistent(s44, price_usd_msrp) ; \+indep(s44)),
    consistent(s58, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v599_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.82::acc(s40, price_usd_evo).
0.82::acc(s78, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v479_96=479.96 v419_91=419.91
% @importance 0.88

0.45::true_val(price_usd_evo, v479_96); 0.55::true_val(price_usd_evo, v419_91).
measured(s40, price_usd_evo, v479_96).
measured(s78, price_usd_evo, v419_91).
all_consistent(price_usd_evo) :-
    consistent(s40, price_usd_evo),
    consistent(s78, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v479_96)).
query(true_val(price_usd_evo, v419_91)).

0.88::acc(s41, price_usd_tactics).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_tactics
% @values v419_95=419.95 unk_price_usd_tactics=Unknown
% @importance 0.90

0.77::true_val(price_usd_tactics, v419_95); 0.23::true_val(price_usd_tactics, unk_price_usd_tactics).
measured(s41, price_usd_tactics, v419_95).
all_consistent(price_usd_tactics) :- consistent(s41, price_usd_tactics).
evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v419_95)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

0.78::acc(s42, price_usd_backcountry).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_backcountry
% @values v599_95=599.95 unk_price_usd_backcountry=Unknown
% @importance 0.85

0.64::true_val(price_usd_backcountry, v599_95); 0.36::true_val(price_usd_backcountry, unk_price_usd_backcountry).
measured(s42, price_usd_backcountry, v599_95).
all_consistent(price_usd_backcountry) :- consistent(s42, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v599_95)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

0.78::acc(s43, price_usd_blauer).

% @attr price_usd_blauer
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at Blauer Board Shop
% @values v479_96=479.96 unk_price_usd_blauer=Unknown
% @importance 0.85

0.64::true_val(price_usd_blauer, v479_96); 0.36::true_val(price_usd_blauer, unk_price_usd_blauer).
measured(s43, price_usd_blauer, v479_96).
all_consistent(price_usd_blauer) :- consistent(s43, price_usd_blauer).
evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v479_96)).
query(true_val(price_usd_blauer, unk_price_usd_blauer)).

0.78::acc(s1, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v999_99=999.99 unk_price_aud_merchant=Unknown
% @importance 0.95

0.71::true_val(price_aud_merchant, v999_99); 0.29::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s1, price_aud_merchant, v999_99).
all_consistent(price_aud_merchant) :- consistent(s1, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v999_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.75::acc(s45, price_eur_blue_tomato).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical false
% @original_name price_eur_blue_tomato
% @values v649_95=649.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.85

0.60::true_val(price_eur_blue_tomato, v649_95); 0.40::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
measured(s45, price_eur_blue_tomato, v649_95).
all_consistent(price_eur_blue_tomato) :- consistent(s45, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v649_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

0.75::acc(s45, price_gbp_blue_tomato_uk).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical false
% @original_name price_gbp_blue_tomato_uk
% @values v580=580.00 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.85

0.60::true_val(price_gbp_blue_tomato_uk, v580); 0.40::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).
measured(s45, price_gbp_blue_tomato_uk, v580).
all_consistent(price_gbp_blue_tomato_uk) :- consistent(s45, price_gbp_blue_tomato_uk).
evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v580)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

0.75::acc(s45, price_sek_blue_tomato).

% @attr price_sek_blue_tomato
% @type numeric
% @unit SEK
% @canonical false
% @original_name Price SEK (BlueTomato Sweden)
% @values v6999=6999.00 unk_price_sek_blue_tomato=Unknown
% @importance 0.85

0.60::true_val(price_sek_blue_tomato, v6999); 0.40::true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato).
measured(s45, price_sek_blue_tomato, v6999).
all_consistent(price_sek_blue_tomato) :- consistent(s45, price_sek_blue_tomato).
evidence(all_consistent(price_sek_blue_tomato)).
query(true_val(price_sek_blue_tomato, v6999)).
query(true_val(price_sek_blue_tomato, unk_price_sek_blue_tomato)).

0.75::acc(s45, price_dkk_blue_tomato).

% @attr price_dkk_blue_tomato
% @type numeric
% @unit DKK
% @canonical false
% @original_name Price DKK (BlueTomato Denmark)
% @values v4850=4850.00 unk_price_dkk_blue_tomato=Unknown
% @importance 0.85

0.60::true_val(price_dkk_blue_tomato, v4850); 0.40::true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato).
measured(s45, price_dkk_blue_tomato, v4850).
all_consistent(price_dkk_blue_tomato) :- consistent(s45, price_dkk_blue_tomato).
evidence(all_consistent(price_dkk_blue_tomato)).
query(true_val(price_dkk_blue_tomato, v4850)).
query(true_val(price_dkk_blue_tomato, unk_price_dkk_blue_tomato)).

0.45::acc(s46, price_cad_prfo).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical false
% @original_name price_cad_prfo
% @values v143_99=143.99 unk_price_cad_prfo=Unknown
% @importance 0.70

0.30::true_val(price_cad_prfo, v143_99); 0.70::true_val(price_cad_prfo, unk_price_cad_prfo).
measured(s46, price_cad_prfo, v143_99).
all_consistent(price_cad_prfo) :- consistent(s46, price_cad_prfo).
evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v143_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

0.68::acc(s47, price_eur_snowcountry).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price EUR (SnowCountry EU)
% @values v487_46=487.46 unk_price_eur_snowcountry=Unknown
% @importance 0.80

0.52::true_val(price_eur_snowcountry, v487_46); 0.48::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).
measured(s47, price_eur_snowcountry, v487_46).
all_consistent(price_eur_snowcountry) :- consistent(s47, price_eur_snowcountry).
evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v487_46)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

0.88::acc(s9, availability_status_nitro).

% @attr availability_status_nitro
% @type categorical
% @canonical false
% @original_name availability_status (Nitro official site)
% @values no_direct_links_retailers=No_direct_sales_links_to_retailers unk_availability_status_nitro=Unknown
% @importance 0.55

0.86::true_val(availability_status_nitro, no_direct_links_retailers); 0.14::true_val(availability_status_nitro, unk_availability_status_nitro).
measured(s9, availability_status_nitro, no_direct_links_retailers).
all_consistent(availability_status_nitro) :- consistent(s9, availability_status_nitro).
evidence(all_consistent(availability_status_nitro)).
query(true_val(availability_status_nitro, no_direct_links_retailers)).
query(true_val(availability_status_nitro, unk_availability_status_nitro)).

0.85::acc(s40, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (evo.com)
% @values available_evo=Available_evo_com unk_availability_status=Unknown
% @importance 0.90

0.72::true_val(availability_status, available_evo); 0.28::true_val(availability_status, unk_availability_status).
measured(s40, availability_status, available_evo).
all_consistent(availability_status) :- consistent(s40, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_evo)).
query(true_val(availability_status, unk_availability_status)).

0.85::acc(s41, availability_status_tactics).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (Tactics.com)
% @values available_tactics=Available_Tactics unk_availability_status_tactics=Unknown
% @importance 0.90

0.77::true_val(availability_status_tactics, available_tactics); 0.23::true_val(availability_status_tactics, unk_availability_status_tactics).
measured(s41, availability_status_tactics, available_tactics).
all_consistent(availability_status_tactics) :- consistent(s41, availability_status_tactics).
evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, available_tactics)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

0.78::acc(s42, availability_status_backcountry).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry.com)
% @values available_backcountry=Available_Backcountry unk_availability_status_backcountry=Unknown
% @importance 0.85

0.64::true_val(availability_status_backcountry, available_backcountry); 0.36::true_val(availability_status_backcountry, unk_availability_status_backcountry).
measured(s42, availability_status_backcountry, available_backcountry).
all_consistent(availability_status_backcountry) :- consistent(s42, availability_status_backcountry).
evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available_backcountry)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

0.78::acc(s48, availability_status_eriks).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status (ERIK'S)
% @values available_eriks=Available_ERIKS_free_binding_install unk_availability_status_eriks=Unknown
% @importance 0.50

0.68::true_val(availability_status_eriks, available_eriks); 0.32::true_val(availability_status_eriks, unk_availability_status_eriks).
measured(s48, availability_status_eriks, available_eriks).
all_consistent(availability_status_eriks) :- consistent(s48, availability_status_eriks).
evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, available_eriks)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

0.75::acc(s49, availability_status_shredshop).

% @attr availability_status_shredshop
% @type categorical
% @canonical false
% @original_name availability_status (Shred Shop)
% @values sold_out_156_162=Sold_out_156_162 unk_availability_status_shredshop=Unknown
% @importance 0.60

0.63::true_val(availability_status_shredshop, sold_out_156_162); 0.37::true_val(availability_status_shredshop, unk_availability_status_shredshop).
measured(s49, availability_status_shredshop, sold_out_156_162).
all_consistent(availability_status_shredshop) :- consistent(s49, availability_status_shredshop).
evidence(all_consistent(availability_status_shredshop)).
query(true_val(availability_status_shredshop, sold_out_156_162)).
query(true_val(availability_status_shredshop, unk_availability_status_shredshop)).

0.72::acc(s50, availability_status_invasion).

% @attr availability_status_invasion
% @type categorical
% @canonical false
% @original_name availability_status (Invasion Snowboard Shop)
% @values available_invasion=Available_Invasion_VT unk_availability_status_invasion=Unknown
% @importance 0.50

0.60::true_val(availability_status_invasion, available_invasion); 0.40::true_val(availability_status_invasion, unk_availability_status_invasion).
measured(s50, availability_status_invasion, available_invasion).
all_consistent(availability_status_invasion) :- consistent(s50, availability_status_invasion).
evidence(all_consistent(availability_status_invasion)).
query(true_val(availability_status_invasion, available_invasion)).
query(true_val(availability_status_invasion, unk_availability_status_invasion)).

0.70::acc(s51, availability_status_rudeboys).

% @attr availability_status_rudeboys
% @type categorical
% @canonical false
% @original_name availability_status (Rude Boys)
% @values available_rudeboys=Available_Rude_Boys_Banff unk_availability_status_rudeboys=Unknown
% @importance 0.60

0.59::true_val(availability_status_rudeboys, available_rudeboys); 0.41::true_val(availability_status_rudeboys, unk_availability_status_rudeboys).
measured(s51, availability_status_rudeboys, available_rudeboys).
all_consistent(availability_status_rudeboys) :- consistent(s51, availability_status_rudeboys).
evidence(all_consistent(availability_status_rudeboys)).
query(true_val(availability_status_rudeboys, available_rudeboys)).
query(true_val(availability_status_rudeboys, unk_availability_status_rudeboys)).

0.72::acc(s52, availability_status_melbourne).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard Centre)
% @values available_melbourne=Available_Melbourne_AU unk_availability_status_melbourne=Unknown
% @importance 0.30

0.63::true_val(availability_status_melbourne, available_melbourne); 0.37::true_val(availability_status_melbourne, unk_availability_status_melbourne).
measured(s52, availability_status_melbourne, available_melbourne).
all_consistent(availability_status_melbourne) :- consistent(s52, availability_status_melbourne).
evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available_melbourne)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

0.75::acc(s45, availability_status_bluetomato).

% @attr availability_status_bluetomato
% @type categorical
% @canonical false
% @original_name availability_status (BlueTomato EU)
% @values available_bluetomato=Available_BlueTomato_EU unk_availability_status_bluetomato=Unknown
% @importance 0.85

0.60::true_val(availability_status_bluetomato, available_bluetomato); 0.40::true_val(availability_status_bluetomato, unk_availability_status_bluetomato).
measured(s45, availability_status_bluetomato, available_bluetomato).
all_consistent(availability_status_bluetomato) :- consistent(s45, availability_status_bluetomato).
evidence(all_consistent(availability_status_bluetomato)).
query(true_val(availability_status_bluetomato, available_bluetomato)).
query(true_val(availability_status_bluetomato, unk_availability_status_bluetomato)).

0.68::acc(s47, availability_status_snowcountry).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status (SnowCountry.eu)
% @values available_snowcountry=Available_SnowCountry_EU unk_availability_status_snowcountry=Unknown
% @importance 0.80

0.52::true_val(availability_status_snowcountry, available_snowcountry); 0.48::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).
measured(s47, availability_status_snowcountry, available_snowcountry).
all_consistent(availability_status_snowcountry) :- consistent(s47, availability_status_snowcountry).
evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, available_snowcountry)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

0.70::acc(s53, availability_status_getboards).

% @attr availability_status_getboards
% @type categorical
% @canonical false
% @original_name availability_status (Getboards.com)
% @values available_getboards=Available_Getboards unk_availability_status_getboards=Unknown
% @importance 0.50

0.59::true_val(availability_status_getboards, available_getboards); 0.41::true_val(availability_status_getboards, unk_availability_status_getboards).
measured(s53, availability_status_getboards, available_getboards).
all_consistent(availability_status_getboards) :- consistent(s53, availability_status_getboards).
evidence(all_consistent(availability_status_getboards)).
query(true_val(availability_status_getboards, available_getboards)).
query(true_val(availability_status_getboards, unk_availability_status_getboards)).

0.68::acc(s54, availability_status_milosport).

% @attr availability_status_milosport
% @type categorical
% @canonical false
% @original_name availability_status (Milosport)
% @values available_milosport=Available_Milosport unk_availability_status_milosport=Unknown
% @importance 0.50

0.55::true_val(availability_status_milosport, available_milosport); 0.45::true_val(availability_status_milosport, unk_availability_status_milosport).
measured(s54, availability_status_milosport, available_milosport).
all_consistent(availability_status_milosport) :- consistent(s54, availability_status_milosport).
evidence(all_consistent(availability_status_milosport)).
query(true_val(availability_status_milosport, available_milosport)).
query(true_val(availability_status_milosport, unk_availability_status_milosport)).

0.65::acc(s55, availability_status_one).

% @attr availability_status_one
% @type categorical
% @canonical false
% @original_name availability_status (ONE Boardshop)
% @values available_one=Available_ONE_Boardshop unk_availability_status_one=Unknown
% @importance 0.50

0.51::true_val(availability_status_one, available_one); 0.49::true_val(availability_status_one, unk_availability_status_one).
measured(s55, availability_status_one, available_one).
all_consistent(availability_status_one) :- consistent(s55, availability_status_one).
evidence(all_consistent(availability_status_one)).
query(true_val(availability_status_one, available_one)).
query(true_val(availability_status_one, unk_availability_status_one)).

0.68::acc(s56, availability_status_boardsports).

% @attr availability_status_boardsports
% @type categorical
% @canonical false
% @original_name availability_status (Boardsports.eu)
% @values available_boardsports=Available_Boardsports_EU unk_availability_status_boardsports=Unknown
% @importance 0.50

0.55::true_val(availability_status_boardsports, available_boardsports); 0.45::true_val(availability_status_boardsports, unk_availability_status_boardsports).
measured(s56, availability_status_boardsports, available_boardsports).
all_consistent(availability_status_boardsports) :- consistent(s56, availability_status_boardsports).
evidence(all_consistent(availability_status_boardsports)).
query(true_val(availability_status_boardsports, available_boardsports)).
query(true_val(availability_status_boardsports, unk_availability_status_boardsports)).

0.88::acc(s57, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.75

0.81::true_val(warranty_period_years, v2); 0.19::true_val(warranty_period_years, unk_warranty_period_years).
measured(s57, warranty_period_years, v2).
all_consistent(warranty_period_years) :- consistent(s57, warranty_period_years).
evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.82::acc(s58, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values independent_800_boards=Independent_unpaid_800_plus_boards_tested unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.72::true_val(reviewer_opinion_the_good_ride, independent_800_boards); 0.28::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s58, reviewer_opinion_the_good_ride, independent_800_boards).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s58, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, independent_800_boards)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.85::acc(s58, powder_rating_tgr).

% @attr powder_rating_tgr
% @type categorical
% @canonical false
% @original_name powder_rating_tgr
% @values good=Good unk_powder_rating_tgr=Unknown
% @importance 0.95

0.72::true_val(powder_rating_tgr, good); 0.28::true_val(powder_rating_tgr, unk_powder_rating_tgr).
measured(s58, powder_rating_tgr, good).
all_consistent(powder_rating_tgr) :- consistent(s58, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.85::acc(s58, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.95

0.72::true_val(base_glide_performance, good); 0.28::true_val(base_glide_performance, unk_base_glide_performance).
measured(s58, base_glide_performance, good).
all_consistent(base_glide_performance) :- consistent(s58, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.85::acc(s58, carving_rating_tgr).

% @attr carving_rating_tgr
% @type categorical
% @canonical false
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.95

0.72::true_val(carving_rating_tgr, great); 0.28::true_val(carving_rating_tgr, unk_carving_rating_tgr).
measured(s58, carving_rating_tgr, great).
all_consistent(carving_rating_tgr) :- consistent(s58, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

0.85::acc(s58, speed_rating_tgr).

% @attr speed_rating_tgr
% @type categorical
% @canonical false
% @original_name speed_rating_tgr
% @values great=Great unk_speed_rating_tgr=Unknown
% @importance 0.95

0.72::true_val(speed_rating_tgr, great); 0.28::true_val(speed_rating_tgr, unk_speed_rating_tgr).
measured(s58, speed_rating_tgr, great).
all_consistent(speed_rating_tgr) :- consistent(s58, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, great)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

0.85::acc(s58, chatter_performance).

% @attr chatter_performance
% @type categorical
% @canonical false
% @original_name chatter_performance
% @values good=Good unk_chatter_performance=Unknown
% @importance 0.95

0.72::true_val(chatter_performance, good); 0.28::true_val(chatter_performance, unk_chatter_performance).
measured(s58, chatter_performance, good).
all_consistent(chatter_performance) :- consistent(s58, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, good)).
query(true_val(chatter_performance, unk_chatter_performance)).

0.85::acc(s58, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values average=Average unk_switch_riding=Unknown
% @importance 0.95

0.72::true_val(switch_riding, average); 0.28::true_val(switch_riding, unk_switch_riding).
measured(s58, switch_riding, average).
all_consistent(switch_riding) :- consistent(s58, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, average)).
query(true_val(switch_riding, unk_switch_riding)).

0.85::acc(s58, jumps_rating_tgr).

% @attr jumps_rating_tgr
% @type categorical
% @canonical false
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.72::true_val(jumps_rating_tgr, good); 0.28::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
measured(s58, jumps_rating_tgr, good).
all_consistent(jumps_rating_tgr) :- consistent(s58, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

0.85::acc(s58, jibbing_rating_tgr).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical false
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.72::true_val(jibbing_rating_tgr, average); 0.28::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
measured(s58, jibbing_rating_tgr, average).
all_consistent(jibbing_rating_tgr) :- consistent(s58, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

0.85::acc(s58, pipe_rating_tgr).

% @attr pipe_rating_tgr
% @type categorical
% @canonical false
% @original_name pipe_rating_tgr
% @values good=Good unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.72::true_val(pipe_rating_tgr, good); 0.28::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
measured(s58, pipe_rating_tgr, good).
all_consistent(pipe_rating_tgr) :- consistent(s58, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

0.85::acc(s58, on_snow_feel_tgr).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical false
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_locked_in unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.72::true_val(on_snow_feel_tgr, semi_locked_in); 0.28::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
measured(s58, on_snow_feel_tgr, semi_locked_in).
all_consistent(on_snow_feel_tgr) :- consistent(s58, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

0.85::acc(s58, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.72::true_val(turn_initiation_performance, medium_fast); 0.28::true_val(turn_initiation_performance, unk_turn_initiation_performance).
measured(s58, turn_initiation_performance, medium_fast).
all_consistent(turn_initiation_performance) :- consistent(s58, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.82::acc(s58, stiffness_feel_tgr).

% @attr stiffness_feel_tgr
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (stiffness feel)
% @values semi_hard=Semi_Hard unk_stiffness_feel_tgr=Unknown
% @importance 0.95

0.72::true_val(stiffness_feel_tgr, semi_hard); 0.28::true_val(stiffness_feel_tgr, unk_stiffness_feel_tgr).
measured(s58, stiffness_feel_tgr, semi_hard).
all_consistent(stiffness_feel_tgr) :- consistent(s58, stiffness_feel_tgr).
evidence(all_consistent(stiffness_feel_tgr)).
query(true_val(stiffness_feel_tgr, semi_hard)).
query(true_val(stiffness_feel_tgr, unk_stiffness_feel_tgr)).

0.82::acc(s58, buttering_feel_tgr).

% @attr buttering_feel_tgr
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (buttering)
% @values moderate=Moderate unk_buttering_feel_tgr=Unknown
% @importance 0.95

0.72::true_val(buttering_feel_tgr, moderate); 0.28::true_val(buttering_feel_tgr, unk_buttering_feel_tgr).
measured(s58, buttering_feel_tgr, moderate).
all_consistent(buttering_feel_tgr) :- consistent(s58, buttering_feel_tgr).
evidence(all_consistent(buttering_feel_tgr)).
query(true_val(buttering_feel_tgr, moderate)).
query(true_val(buttering_feel_tgr, unk_buttering_feel_tgr)).

0.85::acc(s58, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values hard_snow_good=Hard_Snow_pretty_good unk_edge_hold=Unknown
% @importance 0.95

0.72::true_val(edge_hold, hard_snow_good); 0.28::true_val(edge_hold, unk_edge_hold).
measured(s58, edge_hold, hard_snow_good).
all_consistent(edge_hold) :- consistent(s58, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow_good)).
query(true_val(edge_hold, unk_edge_hold)).

0.82::acc(s59, board_weight_grams).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values normal=Normal_not_heavy_or_light unk_board_weight_grams=Unknown
% @importance 0.55

0.68::true_val(board_weight_grams, normal); 0.32::true_val(board_weight_grams, unk_board_weight_grams).
measured(s59, board_weight_grams, normal).
all_consistent(board_weight_grams) :- consistent(s59, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, normal)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.85::acc(s58, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values competent_powder_float=Very_competent_powder_float unk_positive_aspect=Unknown
% @importance 0.95

0.72::true_val(positive_aspect, competent_powder_float); 0.28::true_val(positive_aspect, unk_positive_aspect).
measured(s58, positive_aspect, competent_powder_float).
all_consistent(positive_aspect) :- consistent(s58, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, competent_powder_float)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.85::acc(s58, positive_aspect_2).

% @attr positive_aspect_2
% @type categorical
% @canonical false
% @original_name positive_aspect (easy poppy flex)
% @values easy_poppy_flex=Easy_to_access_poppy_flex unk_positive_aspect_2=Unknown
% @importance 0.95

0.72::true_val(positive_aspect_2, easy_poppy_flex); 0.28::true_val(positive_aspect_2, unk_positive_aspect_2).
measured(s58, positive_aspect_2, easy_poppy_flex).
all_consistent(positive_aspect_2) :- consistent(s58, positive_aspect_2).
evidence(all_consistent(positive_aspect_2)).
query(true_val(positive_aspect_2, easy_poppy_flex)).
query(true_val(positive_aspect_2, unk_positive_aspect_2)).

0.85::acc(s60, positive_aspect_3).

% @attr positive_aspect_3
% @type categorical
% @canonical false
% @original_name positive_aspect (smooth groomer feel)
% @values smooth_flowy_groomers=Smooth_flowy_easy_backfooted_groomers unk_positive_aspect_3=Unknown
% @importance 0.85

0.72::true_val(positive_aspect_3, smooth_flowy_groomers); 0.28::true_val(positive_aspect_3, unk_positive_aspect_3).
measured(s60, positive_aspect_3, smooth_flowy_groomers).
all_consistent(positive_aspect_3) :- consistent(s60, positive_aspect_3).
evidence(all_consistent(positive_aspect_3)).
query(true_val(positive_aspect_3, smooth_flowy_groomers)).
query(true_val(positive_aspect_3, unk_positive_aspect_3)).

0.72::acc(s50, positive_aspect_4).

% @attr positive_aspect_4
% @type categorical
% @canonical false
% @original_name positive_aspect (eco-minded build)
% @values eco_build_praised=Eco_minded_build_recycled_edges_bio_resins unk_positive_aspect_4=Unknown
% @importance 0.50

0.60::true_val(positive_aspect_4, eco_build_praised); 0.40::true_val(positive_aspect_4, unk_positive_aspect_4).
measured(s50, positive_aspect_4, eco_build_praised).
all_consistent(positive_aspect_4) :- consistent(s50, positive_aspect_4).
evidence(all_consistent(positive_aspect_4)).
query(true_val(positive_aspect_4, eco_build_praised)).
query(true_val(positive_aspect_4, unk_positive_aspect_4)).

0.85::acc(s58, positive_aspect_5).

% @attr positive_aspect_5
% @type categorical
% @canonical false
% @original_name positive_aspect (flexy but poppy balance)
% @values flexy_poppy_balance=Great_balance_flexy_rubbery_but_lively_poppy unk_positive_aspect_5=Unknown
% @importance 0.95

0.72::true_val(positive_aspect_5, flexy_poppy_balance); 0.28::true_val(positive_aspect_5, unk_positive_aspect_5).
measured(s58, positive_aspect_5, flexy_poppy_balance).
all_consistent(positive_aspect_5) :- consistent(s58, positive_aspect_5).
evidence(all_consistent(positive_aspect_5)).
query(true_val(positive_aspect_5, flexy_poppy_balance)).
query(true_val(positive_aspect_5, unk_positive_aspect_5)).

0.75::acc(s61, positive_aspect_6).

% @attr positive_aspect_6
% @type categorical
% @canonical false
% @original_name positive_aspect (3D nose surfy feel)
% @values surfy_3d_nose=3D_nose_ultimate_surfy_powder_feel unk_positive_aspect_6=Unknown
% @importance 0.80

0.63::true_val(positive_aspect_6, surfy_3d_nose); 0.37::true_val(positive_aspect_6, unk_positive_aspect_6).
measured(s61, positive_aspect_6, surfy_3d_nose).
all_consistent(positive_aspect_6) :- consistent(s61, positive_aspect_6).
evidence(all_consistent(positive_aspect_6)).
query(true_val(positive_aspect_6, surfy_3d_nose)).
query(true_val(positive_aspect_6, unk_positive_aspect_6)).

0.85::acc(s62, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values back_foot_turners_only=Only_suited_for_back_foot_weighted_turners unk_negative_aspect=Unknown
% @importance 0.85

0.76::true_val(negative_aspect, back_foot_turners_only); 0.24::true_val(negative_aspect, unk_negative_aspect).
measured(s62, negative_aspect, back_foot_turners_only).
all_consistent(negative_aspect) :- consistent(s62, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, back_foot_turners_only)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.83::acc(s63, negative_aspect_2).

% @attr negative_aspect_2
% @type categorical
% @canonical false
% @original_name negative_aspect (width fatiguing small boots)
% @values width_fatiguing_small_boots=Width_fatiguing_front_foot_small_boots unk_negative_aspect_2=Unknown
% @importance 0.80

0.72::true_val(negative_aspect_2, width_fatiguing_small_boots); 0.28::true_val(negative_aspect_2, unk_negative_aspect_2).
measured(s63, negative_aspect_2, width_fatiguing_small_boots).
all_consistent(negative_aspect_2) :- consistent(s63, negative_aspect_2).
evidence(all_consistent(negative_aspect_2)).
query(true_val(negative_aspect_2, width_fatiguing_small_boots)).
query(true_val(negative_aspect_2, unk_negative_aspect_2)).

0.85::acc(s58, negative_aspect_3).

% @attr negative_aspect_3
% @type categorical
% @canonical false
% @original_name negative_aspect (base burn)
% @values base_burn_wax_loss=Base_burn_lose_wax_faster unk_negative_aspect_3=Unknown
% @importance 0.95

0.72::true_val(negative_aspect_3, base_burn_wax_loss); 0.28::true_val(negative_aspect_3, unk_negative_aspect_3).
measured(s58, negative_aspect_3, base_burn_wax_loss).
all_consistent(negative_aspect_3) :- consistent(s58, negative_aspect_3).
evidence(all_consistent(negative_aspect_3)).
query(true_val(negative_aspect_3, base_burn_wax_loss)).
query(true_val(negative_aspect_3, unk_negative_aspect_3)).

0.85::acc(s58, negative_aspect_4).

% @attr negative_aspect_4
% @type categorical
% @canonical false
% @original_name negative_aspect (3D nose butter washout)
% @values nose_washout_butter=3D_spoon_nose_washout_buttering unk_negative_aspect_4=Unknown
% @importance 0.95

0.72::true_val(negative_aspect_4, nose_washout_butter); 0.28::true_val(negative_aspect_4, unk_negative_aspect_4).
measured(s58, negative_aspect_4, nose_washout_butter).
all_consistent(negative_aspect_4) :- consistent(s58, negative_aspect_4).
evidence(all_consistent(negative_aspect_4)).
query(true_val(negative_aspect_4, nose_washout_butter)).
query(true_val(negative_aspect_4, unk_negative_aspect_4)).

0.82::acc(s64, negative_aspect_5).

% @attr negative_aspect_5
% @type categorical
% @canonical false
% @original_name negative_aspect (not for beginners)
% @values not_for_beginners=Not_recommended_for_beginners unk_negative_aspect_5=Unknown
% @importance 0.70

0.72::true_val(negative_aspect_5, not_for_beginners); 0.28::true_val(negative_aspect_5, unk_negative_aspect_5).
measured(s64, negative_aspect_5, not_for_beginners).
all_consistent(negative_aspect_5) :- consistent(s64, negative_aspect_5).
evidence(all_consistent(negative_aspect_5)).
query(true_val(negative_aspect_5, not_for_beginners)).
query(true_val(negative_aspect_5, unk_negative_aspect_5)).

0.72::acc(s52, negative_aspect_6).

% @attr negative_aspect_6
% @type categorical
% @canonical false
% @original_name negative_aspect (size-dependent graphics)
% @values graphics_size_dependent=Graphics_size_dependent_cannot_change unk_negative_aspect_6=Unknown
% @importance 0.30

0.63::true_val(negative_aspect_6, graphics_size_dependent); 0.37::true_val(negative_aspect_6, unk_negative_aspect_6).
measured(s52, negative_aspect_6, graphics_size_dependent).
all_consistent(negative_aspect_6) :- consistent(s52, negative_aspect_6).
evidence(all_consistent(negative_aspect_6)).
query(true_val(negative_aspect_6, graphics_size_dependent)).
query(true_val(negative_aspect_6, unk_negative_aspect_6)).

0.83::acc(s58, flex_feel).
0.82::acc(s35, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_overall=Medium_overall medium_stiff=Medium_Stiff
% @importance 0.93

0.45::true_val(flex_feel, medium_overall); 0.55::true_val(flex_feel, medium_stiff).
measured(s58, flex_feel, medium_overall).
measured(s35, flex_feel, medium_stiff).
all_consistent(flex_feel) :-
    consistent(s58, flex_feel),
    consistent(s35, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_overall)).
query(true_val(flex_feel, medium_stiff)).

0.85::acc(s65, flex_rating_10_evo).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values stiff=Stiff_evo_scale_6_8_of_10 unk_flex_rating_10_evo=Unknown
% @importance 0.60

0.77::true_val(flex_rating_10_evo, stiff); 0.23::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).
measured(s65, flex_rating_10_evo, stiff).
all_consistent(flex_rating_10_evo) :- consistent(s65, flex_rating_10_evo).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

0.85::acc(s24, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values convex_nose_surf=Convex_nose_transitioning_into_front_binding unk_construction_material_innovation=Unknown
% @importance 0.90

0.81::true_val(construction_material_innovation, convex_nose_surf); 0.19::true_val(construction_material_innovation, unk_construction_material_innovation).
measured(s24, construction_material_innovation, convex_nose_surf).
all_consistent(construction_material_innovation) :- consistent(s24, construction_material_innovation).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, convex_nose_surf)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.85::acc(s24, construction_material_innovation_2).

% @attr construction_material_innovation_2
% @type categorical
% @canonical false
% @original_name construction_material_innovation (concave tail)
% @values concave_tail_control=Concave_tail_for_quick_control_carve unk_construction_material_innovation_2=Unknown
% @importance 0.90

0.81::true_val(construction_material_innovation_2, concave_tail_control); 0.19::true_val(construction_material_innovation_2, unk_construction_material_innovation_2).
measured(s24, construction_material_innovation_2, concave_tail_control).
all_consistent(construction_material_innovation_2) :- consistent(s24, construction_material_innovation_2).
evidence(all_consistent(construction_material_innovation_2)).
query(true_val(construction_material_innovation_2, concave_tail_control)).
query(true_val(construction_material_innovation_2, unk_construction_material_innovation_2)).

0.88::acc(s66, construction_material_innovation_3).

% @attr construction_material_innovation_3
% @type categorical
% @canonical false
% @original_name construction_material_innovation (thruster fin)
% @values thruster_fin_feel=Like_thruster_fin_setup_surfiest_feel unk_construction_material_innovation_3=Unknown
% @importance 0.60

0.79::true_val(construction_material_innovation_3, thruster_fin_feel); 0.21::true_val(construction_material_innovation_3, unk_construction_material_innovation_3).
measured(s66, construction_material_innovation_3, thruster_fin_feel).
all_consistent(construction_material_innovation_3) :- consistent(s66, construction_material_innovation_3).
evidence(all_consistent(construction_material_innovation_3)).
query(true_val(construction_material_innovation_3, thruster_fin_feel)).
query(true_val(construction_material_innovation_3, unk_construction_material_innovation_3)).

0.82::acc(s67, comparable_board_cross_brand).
0.80::acc(s68, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_hovercraft_2=Jones_Hovercraft_2_0_629_95_USD unk_comparable_board_cross_brand=Unknown
% @importance 0.73

0.90::true_val(comparable_board_cross_brand, jones_hovercraft_2); 0.10::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s67, comparable_board_cross_brand, jones_hovercraft_2).
measured(s68, comparable_board_cross_brand, jones_hovercraft_2).
all_consistent(comparable_board_cross_brand) :- consistent(s67, comparable_board_cross_brand), consistent(s68, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_hovercraft_2)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.82::acc(s58, comparable_board_cross_brand_2).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Korua Transition Finder)
% @values korua_transition_finder=Korua_Transition_Finder unk_comparable_board_cross_brand_2=Unknown
% @importance 0.95

0.72::true_val(comparable_board_cross_brand_2, korua_transition_finder); 0.28::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).
measured(s58, comparable_board_cross_brand_2, korua_transition_finder).
all_consistent(comparable_board_cross_brand_2) :- consistent(s58, comparable_board_cross_brand_2).
evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, korua_transition_finder)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

0.82::acc(s58, comparable_board_cross_brand_3).

% @attr comparable_board_cross_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Rome Stale Fish)
% @values rome_stale_fish=Rome_Stale_Fish unk_comparable_board_cross_brand_3=Unknown
% @importance 0.95

0.72::true_val(comparable_board_cross_brand_3, rome_stale_fish); 0.28::true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3).
measured(s58, comparable_board_cross_brand_3, rome_stale_fish).
all_consistent(comparable_board_cross_brand_3) :- consistent(s58, comparable_board_cross_brand_3).
evidence(all_consistent(comparable_board_cross_brand_3)).
query(true_val(comparable_board_cross_brand_3, rome_stale_fish)).
query(true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3)).

0.82::acc(s58, comparable_board_cross_brand_4).

% @attr comparable_board_cross_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Cardiff Powgoda)
% @values cardiff_powgoda=Cardiff_Powgoda unk_comparable_board_cross_brand_4=Unknown
% @importance 0.95

0.72::true_val(comparable_board_cross_brand_4, cardiff_powgoda); 0.28::true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4).
measured(s58, comparable_board_cross_brand_4, cardiff_powgoda).
all_consistent(comparable_board_cross_brand_4) :- consistent(s58, comparable_board_cross_brand_4).
evidence(all_consistent(comparable_board_cross_brand_4)).
query(true_val(comparable_board_cross_brand_4, cardiff_powgoda)).
query(true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4)).

0.82::acc(s58, comparable_board_cross_brand_5).

% @attr comparable_board_cross_brand_5
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mind Expander)
% @values jones_mind_expander=Jones_Mind_Expander_599_95_USD unk_comparable_board_cross_brand_5=Unknown
% @importance 0.95

0.72::true_val(comparable_board_cross_brand_5, jones_mind_expander); 0.28::true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5).
measured(s58, comparable_board_cross_brand_5, jones_mind_expander).
all_consistent(comparable_board_cross_brand_5) :- consistent(s58, comparable_board_cross_brand_5).
evidence(all_consistent(comparable_board_cross_brand_5)).
query(true_val(comparable_board_cross_brand_5, jones_mind_expander)).
query(true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5)).

0.82::acc(s58, comparable_board_cross_brand_6).

% @attr comparable_board_cross_brand_6
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes PYL Uninc)
% @values yes_pyl_uninc=Yes_PYL_Uninc unk_comparable_board_cross_brand_6=Unknown
% @importance 0.95

0.72::true_val(comparable_board_cross_brand_6, yes_pyl_uninc); 0.28::true_val(comparable_board_cross_brand_6, unk_comparable_board_cross_brand_6).
measured(s58, comparable_board_cross_brand_6, yes_pyl_uninc).
all_consistent(comparable_board_cross_brand_6) :- consistent(s58, comparable_board_cross_brand_6).
evidence(all_consistent(comparable_board_cross_brand_6)).
query(true_val(comparable_board_cross_brand_6, yes_pyl_uninc)).
query(true_val(comparable_board_cross_brand_6, unk_comparable_board_cross_brand_6)).

0.82::acc(s58, comparable_board_cross_brand_7).

% @attr comparable_board_cross_brand_7
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Gentemstick Mantaray)
% @values gentemstick_mantaray=Gentemstick_Mantaray unk_comparable_board_cross_brand_7=Unknown
% @importance 0.95

0.72::true_val(comparable_board_cross_brand_7, gentemstick_mantaray); 0.28::true_val(comparable_board_cross_brand_7, unk_comparable_board_cross_brand_7).
measured(s58, comparable_board_cross_brand_7, gentemstick_mantaray).
all_consistent(comparable_board_cross_brand_7) :- consistent(s58, comparable_board_cross_brand_7).
evidence(all_consistent(comparable_board_cross_brand_7)).
query(true_val(comparable_board_cross_brand_7, gentemstick_mantaray)).
query(true_val(comparable_board_cross_brand_7, unk_comparable_board_cross_brand_7)).

0.78::acc(s69, comparable_board_cross_brand_8).

% @attr comparable_board_cross_brand_8
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Bataleon Cameleon)
% @values bataleon_cameleon=Bataleon_Cameleon unk_comparable_board_cross_brand_8=Unknown
% @importance 0.65

0.56::true_val(comparable_board_cross_brand_8, bataleon_cameleon); 0.44::true_val(comparable_board_cross_brand_8, unk_comparable_board_cross_brand_8).
measured(s69, comparable_board_cross_brand_8, bataleon_cameleon).
all_consistent(comparable_board_cross_brand_8) :- consistent(s69, comparable_board_cross_brand_8).
evidence(all_consistent(comparable_board_cross_brand_8)).
query(true_val(comparable_board_cross_brand_8, bataleon_cameleon)).
query(true_val(comparable_board_cross_brand_8, unk_comparable_board_cross_brand_8)).

0.75::acc(s16, comparable_board_cross_brand_9).

% @attr comparable_board_cross_brand_9
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Amplid Surfari)
% @values amplid_surfari=Amplid_Surfari unk_comparable_board_cross_brand_9=Unknown
% @importance 0.60

0.67::true_val(comparable_board_cross_brand_9, amplid_surfari); 0.33::true_val(comparable_board_cross_brand_9, unk_comparable_board_cross_brand_9).
measured(s16, comparable_board_cross_brand_9, amplid_surfari).
all_consistent(comparable_board_cross_brand_9) :- consistent(s16, comparable_board_cross_brand_9).
evidence(all_consistent(comparable_board_cross_brand_9)).
query(true_val(comparable_board_cross_brand_9, amplid_surfari)).
query(true_val(comparable_board_cross_brand_9, unk_comparable_board_cross_brand_9)).

0.82::acc(s70, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values nitro_squash=Nitro_Squash_609_95_USD unk_comparable_board_same_brand=Unknown
% @importance 0.65

0.68::true_val(comparable_board_same_brand, nitro_squash); 0.32::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s70, comparable_board_same_brand, nitro_squash).
all_consistent(comparable_board_same_brand) :- consistent(s70, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, nitro_squash)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.82::acc(s71, comparable_board_same_brand_2).

% @attr comparable_board_same_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Nitro Dinghy)
% @values nitro_dinghy=Nitro_Dinghy_599_95_USD unk_comparable_board_same_brand_2=Unknown
% @importance 0.60

0.68::true_val(comparable_board_same_brand_2, nitro_dinghy); 0.32::true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2).
measured(s71, comparable_board_same_brand_2, nitro_dinghy).
all_consistent(comparable_board_same_brand_2) :- consistent(s71, comparable_board_same_brand_2).
evidence(all_consistent(comparable_board_same_brand_2)).
query(true_val(comparable_board_same_brand_2, nitro_dinghy)).
query(true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2)).

0.78::acc(s72, comparable_board_same_brand_3).

% @attr comparable_board_same_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Nitro Alternator)
% @values nitro_alternator=Nitro_Alternator_579_95_USD unk_comparable_board_same_brand_3=Unknown
% @importance 0.60

0.60::true_val(comparable_board_same_brand_3, nitro_alternator); 0.40::true_val(comparable_board_same_brand_3, unk_comparable_board_same_brand_3).
measured(s72, comparable_board_same_brand_3, nitro_alternator).
all_consistent(comparable_board_same_brand_3) :- consistent(s72, comparable_board_same_brand_3).
evidence(all_consistent(comparable_board_same_brand_3)).
query(true_val(comparable_board_same_brand_3, nitro_alternator)).
query(true_val(comparable_board_same_brand_3, unk_comparable_board_same_brand_3)).

0.45::acc(s73, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values fun_loose_powder_trees=Fun_loose_feel_great_powder_trees unk_user_review_forum=Unknown
% @importance 0.50

0.21::true_val(user_review_forum, fun_loose_powder_trees); 0.79::true_val(user_review_forum, unk_user_review_forum).
measured(s73, user_review_forum, fun_loose_powder_trees).
all_consistent(user_review_forum) :- consistent(s73, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, fun_loose_powder_trees)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.40::acc(s74, user_review_forum_2).

% @attr user_review_forum_2
% @type categorical
% @canonical false
% @original_name user_review_forum (gonna like regardless)
% @values like_regardless=Board_youre_gonna_like_regardless unk_user_review_forum_2=Unknown
% @importance 0.55

0.26::true_val(user_review_forum_2, like_regardless); 0.74::true_val(user_review_forum_2, unk_user_review_forum_2).
measured(s74, user_review_forum_2, like_regardless).
all_consistent(user_review_forum_2) :- consistent(s74, user_review_forum_2).
evidence(all_consistent(user_review_forum_2)).
query(true_val(user_review_forum_2, like_regardless)).
query(true_val(user_review_forum_2, unk_user_review_forum_2)).

0.72::acc(s75, reviewer_opinion_snowboardingprofiles).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values stable_poppy=More_stable_than_expected_camber_solid_poppy unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.70

0.56::true_val(reviewer_opinion_snowboardingprofiles, stable_poppy); 0.44::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).
measured(s75, reviewer_opinion_snowboardingprofiles, stable_poppy).
all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s75, reviewer_opinion_snowboardingprofiles).
evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, stable_poppy)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

0.65::acc(s75, user_review_forum_3).

% @attr user_review_forum_3
% @type categorical
% @canonical false
% @original_name user_review_forum (good short wide option)
% @values good_short_wide=Good_short_wide_option_without_extreme unk_user_review_forum_3=Unknown
% @importance 0.70

0.56::true_val(user_review_forum_3, good_short_wide); 0.44::true_val(user_review_forum_3, unk_user_review_forum_3).
measured(s75, user_review_forum_3, good_short_wide).
all_consistent(user_review_forum_3) :- consistent(s75, user_review_forum_3).
evidence(all_consistent(user_review_forum_3)).
query(true_val(user_review_forum_3, good_short_wide)).
query(true_val(user_review_forum_3, unk_user_review_forum_3)).

0.82::acc(s64, sizing_philosophy_tgr).

% @attr sizing_philosophy_tgr
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (sizing philosophy)
% @values boot_first_weight_height=Boot_size_most_important_weight_second_height_third unk_sizing_philosophy_tgr=Unknown
% @importance 0.70

0.72::true_val(sizing_philosophy_tgr, boot_first_weight_height); 0.28::true_val(sizing_philosophy_tgr, unk_sizing_philosophy_tgr).
measured(s64, sizing_philosophy_tgr, boot_first_weight_height).
all_consistent(sizing_philosophy_tgr) :- consistent(s64, sizing_philosophy_tgr).
evidence(all_consistent(sizing_philosophy_tgr)).
query(true_val(sizing_philosophy_tgr, boot_first_weight_height)).
query(true_val(sizing_philosophy_tgr, unk_sizing_philosophy_tgr)).

0.85::acc(s58, recommended_boot_size_156_tgr).

% @attr recommended_boot_size_156_tgr
% @type categorical
% @canonical false
% @original_name The Good Ride recommended boot sizes 156cm
% @values us_9_11=US_9_to_11 unk_recommended_boot_size_156_tgr=Unknown
% @importance 0.95

0.72::true_val(recommended_boot_size_156_tgr, us_9_11); 0.28::true_val(recommended_boot_size_156_tgr, unk_recommended_boot_size_156_tgr).
measured(s58, recommended_boot_size_156_tgr, us_9_11).
all_consistent(recommended_boot_size_156_tgr) :- consistent(s58, recommended_boot_size_156_tgr).
evidence(all_consistent(recommended_boot_size_156_tgr)).
query(true_val(recommended_boot_size_156_tgr, us_9_11)).
query(true_val(recommended_boot_size_156_tgr, unk_recommended_boot_size_156_tgr)).

0.75::acc(s76, angrysnowboarder_accolade).

% @attr angrysnowboarder_accolade
% @type categorical
% @canonical false
% @original_name Angrysnowboarder accolade
% @values top5_powder_2026=Top_5_Powder_Boards_2026_contender unk_angrysnowboarder_accolade=Unknown
% @importance 0.70

0.53::true_val(angrysnowboarder_accolade, top5_powder_2026); 0.47::true_val(angrysnowboarder_accolade, unk_angrysnowboarder_accolade).
measured(s76, angrysnowboarder_accolade, top5_powder_2026).
all_consistent(angrysnowboarder_accolade) :- consistent(s76, angrysnowboarder_accolade).
evidence(all_consistent(angrysnowboarder_accolade)).
query(true_val(angrysnowboarder_accolade, top5_powder_2026)).
query(true_val(angrysnowboarder_accolade, unk_angrysnowboarder_accolade)).

0.72::acc(s17, camber_type_note).
0.55::acc(s18, camber_type_note).
0.68::acc(s77, camber_type_note).

% @attr camber_type_note
% @type categorical
% @canonical false
% @original_name camber_type (historical note)
% @values change_2023_true_camber=Changed_to_True_Camber_2023_season unk_camber_type_note=Unknown
% @importance 0.65

0.80::true_val(camber_type_note, change_2023_true_camber); 0.20::true_val(camber_type_note, unk_camber_type_note).
measured(s17, camber_type_note, change_2023_true_camber).
measured(s77, camber_type_note, change_2023_true_camber).
measured(s18, camber_type_note, change_2023_true_camber).
all_consistent(camber_type_note) :- consistent(s17, camber_type_note), consistent(s77, camber_type_note), consistent(s18, camber_type_note).
evidence(all_consistent(camber_type_note)).
query(true_val(camber_type_note, change_2023_true_camber)).
query(true_val(camber_type_note, unk_camber_type_note)).

0.83::acc(s79, sizing_rec_156_tgr).

% @attr sizing_rec_156_tgr
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (156cm sizing)
% @values very_good_daily_driver=156cm_very_good_daily_driver_5ft10_185lbs unk_sizing_rec_156_tgr=Unknown
% @importance 0.80

0.72::true_val(sizing_rec_156_tgr, very_good_daily_driver); 0.28::true_val(sizing_rec_156_tgr, unk_sizing_rec_156_tgr).
measured(s79, sizing_rec_156_tgr, very_good_daily_driver).
all_consistent(sizing_rec_156_tgr) :- consistent(s79, sizing_rec_156_tgr).
evidence(all_consistent(sizing_rec_156_tgr)).
query(true_val(sizing_rec_156_tgr, very_good_daily_driver)).
query(true_val(sizing_rec_156_tgr, unk_sizing_rec_156_tgr)).

0.83::acc(s80, sizing_rec_162_tgr).

% @attr sizing_rec_162_tgr
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (162cm sizing)
% @values deep_pow_harder_uneven=162cm_for_deep_pow_harder_in_uneven unk_sizing_rec_162_tgr=Unknown
% @importance 0.75

0.72::true_val(sizing_rec_162_tgr, deep_pow_harder_uneven); 0.28::true_val(sizing_rec_162_tgr, unk_sizing_rec_162_tgr).
measured(s80, sizing_rec_162_tgr, deep_pow_harder_uneven).
all_consistent(sizing_rec_162_tgr) :- consistent(s80, sizing_rec_162_tgr).
evidence(all_consistent(sizing_rec_162_tgr)).
query(true_val(sizing_rec_162_tgr, deep_pow_harder_uneven)).
query(true_val(sizing_rec_162_tgr, unk_sizing_rec_162_tgr)).

0.82::acc(s64, nitro_no_boot_sizes).

% @attr nitro_no_boot_sizes
% @type categorical
% @canonical false
% @original_name Nitro does not publish recommended boot sizes
% @values no_boot_sizes_old_school=No_boot_sizes_old_school_per_TGR unk_nitro_no_boot_sizes=Unknown
% @importance 0.70

0.72::true_val(nitro_no_boot_sizes, no_boot_sizes_old_school); 0.28::true_val(nitro_no_boot_sizes, unk_nitro_no_boot_sizes).
measured(s64, nitro_no_boot_sizes, no_boot_sizes_old_school).
all_consistent(nitro_no_boot_sizes) :- consistent(s64, nitro_no_boot_sizes).
evidence(all_consistent(nitro_no_boot_sizes)).
query(true_val(nitro_no_boot_sizes, no_boot_sizes_old_school)).
query(true_val(nitro_no_boot_sizes, unk_nitro_no_boot_sizes)).

0.50::acc(s81, waist_width_156_concern).

% @attr waist_width_156_concern
% @type categorical
% @canonical false
% @original_name The 156cm at 26.5cm waist width concern
% @values wider_for_small_feet=May_be_wider_side_for_smaller_feet unk_waist_width_156_concern=Unknown
% @importance 0.65

0.32::true_val(waist_width_156_concern, wider_for_small_feet); 0.68::true_val(waist_width_156_concern, unk_waist_width_156_concern).
measured(s81, waist_width_156_concern, wider_for_small_feet).
all_consistent(waist_width_156_concern) :- consistent(s81, waist_width_156_concern).
evidence(all_consistent(waist_width_156_concern)).
query(true_val(waist_width_156_concern, wider_for_small_feet)).
query(true_val(waist_width_156_concern, unk_waist_width_156_concern)).

0.88::acc(s82, brand_heritage_surf).

% @attr brand_heritage_surf
% @type categorical
% @canonical false
% @original_name Nitro first board swallowtail heritage
% @values retro_swallowtail_day_one=First_board_swallowtail_Retro_surf_since_day_one unk_brand_heritage_surf=Unknown
% @importance 0.35

0.72::true_val(brand_heritage_surf, retro_swallowtail_day_one); 0.28::true_val(brand_heritage_surf, unk_brand_heritage_surf).
measured(s82, brand_heritage_surf, retro_swallowtail_day_one).
all_consistent(brand_heritage_surf) :- consistent(s82, brand_heritage_surf).
evidence(all_consistent(brand_heritage_surf)).
query(true_val(brand_heritage_surf, retro_swallowtail_day_one)).
query(true_val(brand_heritage_surf, unk_brand_heritage_surf)).

0.78::acc(s1, sku_151).

% @attr sku_151
% @type categorical
% @canonical false
% @original_name SKU (151cm)
% @values sku_833202_001_151=833202_001_151 unk_sku_151=Unknown
% @importance 0.95

0.71::true_val(sku_151, sku_833202_001_151); 0.29::true_val(sku_151, unk_sku_151).
measured(s1, sku_151, sku_833202_001_151).
all_consistent(sku_151) :- consistent(s1, sku_151).
evidence(all_consistent(sku_151)).
query(true_val(sku_151, sku_833202_001_151)).
query(true_val(sku_151, unk_sku_151)).