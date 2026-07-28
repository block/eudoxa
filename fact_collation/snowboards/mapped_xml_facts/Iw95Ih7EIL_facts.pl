0.15::indep(sm).
0.25::indep(s2).
0.15::indep(s5).
0.15::indep(s13).
0.20::indep(s16).
0.12::indep(s23).
0.15::indep(s24).
0.10::indep(s25).
0.25::indep(s26).
0.15::indep(s27).
0.10::indep(s28).
0.12::indep(s29).
0.80::indep(s6).
0.80::indep(s8).
0.75::indep(s12).
0.80::indep(s20).
0.80::indep(s34).
0.70::indep(s19).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 1.0

0.95::acc(s1, brand).
0.80::acc(s2, brand).

0.97::true_val(brand, lib_tech); 0.03::true_val(brand, unk_brand).

measured(s1, brand, lib_tech).
measured(s2, brand, lib_tech).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values t_rice_pro=T_Rice_Pro unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).

0.95::true_val(model_name, t_rice_pro); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, t_rice_pro).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, t_rice_pro)).
query(true_val(model_name, unk_model_name)).

% @attr full_product_name
% @type categorical
% @canonical false
% @original_name Full product name
% @values t_rice_pro_hp=Lib_Tech_T_Rice_Pro_HP unk_full_product_name=Unknown
% @importance 1.0

0.95::acc(s1, full_product_name).

0.95::true_val(full_product_name, t_rice_pro_hp); 0.05::true_val(full_product_name, unk_full_product_name).

measured(s1, full_product_name, t_rice_pro_hp).

all_consistent(full_product_name) :- consistent(s1, full_product_name).

evidence(all_consistent(full_product_name)).
query(true_val(full_product_name, t_rice_pro_hp)).
query(true_val(full_product_name, unk_full_product_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025_2026=2025-2026 unk_model_year=Unknown
% @importance 0.95

0.95::acc(s1, model_year).
0.82::acc(s2, model_year).

0.97::true_val(model_year, y2025_2026); 0.03::true_val(model_year, unk_model_year).

measured(s1, model_year, y2025_2026).
measured(s2, model_year, y2025_2026).

all_consistent(model_year) :-
    consistent(s1, model_year),
    (indep(s2), consistent(s2, model_year) ; \+indep(s2)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2025_2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_sku_manufacturer
% @type categorical
% @canonical false
% @original_name Model SKU (manufacturer)
% @values trice2=trice2 unk_model_sku_manufacturer=Unknown
% @importance 1.0

0.93::acc(s1, model_sku_manufacturer).

0.93::true_val(model_sku_manufacturer, trice2); 0.07::true_val(model_sku_manufacturer, unk_model_sku_manufacturer).

measured(s1, model_sku_manufacturer, trice2).

all_consistent(model_sku_manufacturer) :- consistent(s1, model_sku_manufacturer).

evidence(all_consistent(model_sku_manufacturer)).
query(true_val(model_sku_manufacturer, trice2)).
query(true_val(model_sku_manufacturer, unk_model_sku_manufacturer)).

% @attr model_sku_merchant
% @type categorical
% @canonical false
% @original_name Model SKU (merchant)
% @values sku_25sn035_159=25SN035_159 unk_model_sku_merchant=Unknown
% @importance 0.85

0.95::acc(sm, model_sku_merchant).

0.95::true_val(model_sku_merchant, sku_25sn035_159); 0.05::true_val(model_sku_merchant, unk_model_sku_merchant).

measured(sm, model_sku_merchant, sku_25sn035_159).

all_consistent(model_sku_merchant) :- consistent(sm, model_sku_merchant).

evidence(all_consistent(model_sku_merchant)).
query(true_val(model_sku_merchant, sku_25sn035_159)).
query(true_val(model_sku_merchant, unk_model_sku_merchant)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 0.9

0.93::acc(s1, board_category).
0.82::acc(s3, board_category).

0.95::true_val(board_category, freestyle_all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, freestyle_all_mountain).
measured(s3, board_category, freestyle_all_mountain).

all_consistent(board_category) :-
    consistent(s1, board_category),
    consistent(s3, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens_unisex unk_gender=Unknown
% @importance 0.775

0.82::acc(s2, gender).
0.80::acc(s5, gender).

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).

measured(s2, gender, mens).
measured(s5, gender, mens).

all_consistent(gender) :-
    (indep(s2), consistent(s2, gender) ; \+indep(s2)),
    (indep(s5), consistent(s5, gender) ; \+indep(s5)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr anniversary_edition
% @type categorical
% @canonical false
% @original_name 20th anniversary edition
% @values yes_20th=Yes_20th_anniversary unk_anniversary_edition=Unknown
% @importance 0.75

0.88::acc(s2, anniversary_edition).
0.90::acc(s6, anniversary_edition).

0.95::true_val(anniversary_edition, yes_20th); 0.05::true_val(anniversary_edition, unk_anniversary_edition).

measured(s2, anniversary_edition, yes_20th).
measured(s6, anniversary_edition, yes_20th).

all_consistent(anniversary_edition) :-
    (indep(s2), consistent(s2, anniversary_edition) ; \+indep(s2)),
    (indep(s6), consistent(s6, anniversary_edition) ; \+indep(s6)).

evidence(all_consistent(anniversary_edition)).
query(true_val(anniversary_edition, yes_20th)).
query(true_val(anniversary_edition, unk_anniversary_edition)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values travis_rice=Travis_Rice unk_pro_rider_name=Unknown
% @importance 0.85

0.95::acc(s1, pro_rider_name).

0.97::true_val(pro_rider_name, travis_rice); 0.03::true_val(pro_rider_name, unk_pro_rider_name).

measured(s1, pro_rider_name, travis_rice).

all_consistent(pro_rider_name) :- consistent(s1, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, travis_rice)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr design_origin
% @type categorical
% @canonical false
% @original_name Design origin
% @values jackson_hole_wy=Jackson_Hole_Wyoming unk_design_origin=Unknown
% @importance 0.85

0.93::acc(s1, design_origin).

0.93::true_val(design_origin, jackson_hole_wy); 0.07::true_val(design_origin, unk_design_origin).

measured(s1, design_origin, jackson_hole_wy).

all_consistent(design_origin) :- consistent(s1, design_origin).

evidence(all_consistent(design_origin)).
query(true_val(design_origin, jackson_hole_wy)).
query(true_val(design_origin, unk_design_origin)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.65

0.92::acc(s8, manufacturer).

0.95::true_val(manufacturer, mervin_manufacturing); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s8, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :- consistent(s8, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_founders
% @type categorical
% @canonical false
% @original_name Mervin Manufacturing founders
% @values olson_saari_1977=Mike_Olson_Pete_Saari_1977 unk_manufacturer_founders=Unknown
% @importance 0.575

0.90::acc(s8, manufacturer_founders).
0.75::acc(s9, manufacturer_founders).

0.95::true_val(manufacturer_founders, olson_saari_1977); 0.05::true_val(manufacturer_founders, unk_manufacturer_founders).

measured(s8, manufacturer_founders, olson_saari_1977).
measured(s9, manufacturer_founders, olson_saari_1977).

all_consistent(manufacturer_founders) :-
    (indep(s8), consistent(s8, manufacturer_founders) ; \+indep(s8)),
    consistent(s9, manufacturer_founders).

evidence(all_consistent(manufacturer_founders)).
query(true_val(manufacturer_founders, olson_saari_1977)).
query(true_val(manufacturer_founders, unk_manufacturer_founders)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values sequim_wa_usa=Sequim_Washington_USA unk_manufacturing_location=Unknown
% @importance 0.65

0.92::acc(s8, manufacturing_location).
0.78::acc(s13, manufacturing_location).

0.95::true_val(manufacturing_location, sequim_wa_usa); 0.05::true_val(manufacturing_location, unk_manufacturing_location).

measured(s8, manufacturing_location, sequim_wa_usa).
measured(s13, manufacturing_location, sequim_wa_usa).

all_consistent(manufacturing_location) :-
    (indep(s8), consistent(s8, manufacturing_location) ; \+indep(s8)),
    (indep(s13), consistent(s13, manufacturing_location) ; \+indep(s13)).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, sequim_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values last_us_factory_zero_waste=Last_major_US_factory_zero_hazardous_waste unk_sustainability_certification=Unknown
% @importance 0.55

0.90::acc(s8, sustainability_certification).
0.70::acc(s9, sustainability_certification).

0.93::true_val(sustainability_certification, last_us_factory_zero_waste); 0.07::true_val(sustainability_certification, unk_sustainability_certification).

measured(s8, sustainability_certification, last_us_factory_zero_waste).
measured(s9, sustainability_certification, last_us_factory_zero_waste).

all_consistent(sustainability_certification) :-
    (indep(s8), consistent(s8, sustainability_certification) ; \+indep(s8)),
    consistent(s9, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, last_us_factory_zero_waste)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_materials
% @type categorical
% @canonical false
% @original_name sustainability_certification (materials)
% @values eco_materials_process=Water_based_solvents_eco_inks_bio_plastic_basalt unk_sustainability_certification_materials=Unknown
% @importance 0.525

0.88::acc(s8, sustainability_certification_materials).
0.78::acc(s11, sustainability_certification_materials).
0.80::acc(s12, sustainability_certification_materials).
0.78::acc(s13, sustainability_certification_materials).

0.93::true_val(sustainability_certification_materials, eco_materials_process); 0.07::true_val(sustainability_certification_materials, unk_sustainability_certification_materials).

measured(s8, sustainability_certification_materials, eco_materials_process).
measured(s11, sustainability_certification_materials, eco_materials_process).
measured(s12, sustainability_certification_materials, eco_materials_process).
measured(s13, sustainability_certification_materials, eco_materials_process).

all_consistent(sustainability_certification_materials) :-
    (indep(s8), consistent(s8, sustainability_certification_materials) ; \+indep(s8)),
    consistent(s11, sustainability_certification_materials),
    (indep(s12), consistent(s12, sustainability_certification_materials) ; \+indep(s12)),
    (indep(s13), consistent(s13, sustainability_certification_materials) ; \+indep(s13)).

evidence(all_consistent(sustainability_certification_materials)).
query(true_val(sustainability_certification_materials, eco_materials_process)).
query(true_val(sustainability_certification_materials, unk_sustainability_certification_materials)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values one_year_structural=1_year_structural_defects_only unk_warranty=Unknown
% @importance 0.85

0.85::acc(s13, warranty).

0.85::true_val(warranty, one_year_structural); 0.15::true_val(warranty, unk_warranty).

measured(s13, warranty, one_year_structural).

all_consistent(warranty) :-
    (indep(s13), consistent(s13, warranty) ; \+indep(s13)).

evidence(all_consistent(warranty)).
query(true_val(warranty, one_year_structural)).
query(true_val(warranty, unk_warranty)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.95

0.95::acc(s1, shape).
0.82::acc(s2, shape).
0.90::acc(sm, shape).

0.97::true_val(shape, true_twin); 0.03::true_val(shape, unk_shape).

measured(s1, shape, true_twin).
measured(s2, shape, true_twin).
measured(sm, shape, true_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s2), consistent(s2, shape) ; \+indep(s2)),
    (indep(sm), consistent(sm, shape) ; \+indep(sm)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c2_hybrid=C2_Hybrid_Rocker_Camber unk_camber_type=Unknown
% @importance 0.95

0.95::acc(s1, camber_type).
0.85::acc(s2, camber_type).
0.90::acc(sm, camber_type).

0.97::true_val(camber_type, c2_hybrid); 0.03::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, c2_hybrid).
measured(s2, camber_type, c2_hybrid).
measured(sm, camber_type, c2_hybrid).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s2), consistent(s2, camber_type) ; \+indep(s2)),
    (indep(sm), consistent(sm, camber_type) ; \+indep(sm)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, c2_hybrid)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values central_rocker_tip_tail_camber=Central_rocker_carve_float_cambers_pop_stability unk_camber_description=Unknown
% @importance 0.9

0.85::acc(s2, camber_description).

0.88::true_val(camber_description, central_rocker_tip_tail_camber); 0.12::true_val(camber_description, unk_camber_description).

measured(s2, camber_description, central_rocker_tip_tail_camber).

all_consistent(camber_description) :-
    (indep(s2), consistent(s2, camber_description) ; \+indep(s2)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, central_rocker_tip_tail_camber)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_spec
% @type categorical
% @canonical false
% @original_name C2 profile tuned to Travis Rice specification
% @values tuned_to_travis_rice=C2_tuned_to_Travis_Rice_spec unk_camber_description_spec=Unknown
% @importance 0.85

0.80::acc(s13, camber_description_spec).

0.80::true_val(camber_description_spec, tuned_to_travis_rice); 0.20::true_val(camber_description_spec, unk_camber_description_spec).

measured(s13, camber_description_spec, tuned_to_travis_rice).

all_consistent(camber_description_spec) :-
    (indep(s13), consistent(s13, camber_description_spec) ; \+indep(s13)).

evidence(all_consistent(camber_description_spec)).
query(true_val(camber_description_spec, tuned_to_travis_rice)).
query(true_val(camber_description_spec, unk_camber_description_spec)).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v2=2.0 unk_camber_height_mm=Unknown
% @importance 0.95

0.90::acc(s15, camber_height_mm).

0.85::true_val(camber_height_mm, v2); 0.15::true_val(camber_height_mm, unk_camber_height_mm).

measured(s15, camber_height_mm, v2).

all_consistent(camber_height_mm) :- consistent(s15, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v2)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr setback
% @type numeric
% @unit inches
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 0.925

0.95::acc(s1, setback).
0.90::acc(sm, setback).

0.97::true_val(setback, v0); 0.03::true_val(setback, unk_setback).

measured(s1, setback, v0).
measured(sm, setback, v0).

all_consistent(setback) :-
    consistent(s1, setback),
    (indep(sm), consistent(sm, setback) ; \+indep(sm)).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_flex=Twin_flex_non_directional unk_flex_direction=Unknown
% @importance 0.9

0.85::acc(s2, flex_direction).

0.88::true_val(flex_direction, twin_flex); 0.12::true_val(flex_direction, unk_flex_direction).

measured(s2, flex_direction, twin_flex).

all_consistent(flex_direction) :-
    (indep(s2), consistent(s2, flex_direction) ; \+indep(s2)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v0=0.0 unk_taper=Unknown
% @importance 0.85

0.90::acc(sm, taper).

0.90::true_val(taper, v0); 0.10::true_val(taper, unk_taper).

measured(sm, taper, v0).

all_consistent(taper) :-
    (indep(sm), consistent(sm, taper) ; \+indep(sm)).

evidence(all_consistent(taper)).
query(true_val(taper, v0)).
query(true_val(taper, unk_taper)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6=6.0 v6_5=6.5 v7=7.0
% @importance 0.9

0.88::acc(s1, flex_rating_10).
0.70::acc(sm, flex_rating_10).
0.88::acc(s15, flex_rating_10).
0.65::acc(s16, flex_rating_10).

0.20::true_val(flex_rating_10, v6); 0.35::true_val(flex_rating_10, v6_5); 0.45::true_val(flex_rating_10, v7).

measured(s1, flex_rating_10, v7).
measured(sm, flex_rating_10, v6).
measured(s15, flex_rating_10, v7).
measured(s16, flex_rating_10, v6_5).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)),
    consistent(s15, flex_rating_10),
    (indep(s16), consistent(s16, flex_rating_10) ; \+indep(s16)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, v6_5)).
query(true_val(flex_rating_10, v7)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_stiff=Medium_Stiff_stout_enough_to_charge unk_flex_feel=Unknown
% @importance 0.9

0.82::acc(s2, flex_feel).

0.82::true_val(flex_feel, medium_stiff); 0.18::true_val(flex_feel, unk_flex_feel).

measured(s2, flex_feel, medium_stiff).

all_consistent(flex_feel) :-
    (indep(s2), consistent(s2, flex_feel) ; \+indep(s2)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_stiff)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values stiff=Stiff_evo_scale unk_flex_rating_10_evo=Unknown
% @importance 0.9

0.80::acc(s2, flex_rating_10_evo).

0.80::true_val(flex_rating_10_evo, stiff); 0.20::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s2, flex_rating_10_evo, stiff).

all_consistent(flex_rating_10_evo) :-
    (indep(s2), consistent(s2, flex_rating_10_evo) ; \+indep(s2)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values hp_aspen_paulownia=HP_60pct_Aspen_40pct_Paulownia unk_core_material=Unknown
% @importance 0.93

0.95::acc(s1, core_material).
0.82::acc(s13, core_material).
0.90::acc(sm, core_material).

0.97::true_val(core_material, hp_aspen_paulownia); 0.03::true_val(core_material, unk_core_material).

measured(s1, core_material, hp_aspen_paulownia).
measured(s13, core_material, hp_aspen_paulownia).
measured(sm, core_material, hp_aspen_paulownia).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s13), consistent(s13, core_material) ; \+indep(s13)),
    (indep(sm), consistent(sm, core_material) ; \+indep(sm)).

evidence(all_consistent(core_material)).
query(true_val(core_material, hp_aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_ride
% @type categorical
% @canonical false
% @original_name core_material (ride quality)
% @values lighter_smoother_damper=Lighter_smoother_damper_than_100pct_wood unk_core_material_ride=Unknown
% @importance 0.75

0.70::acc(s16, core_material_ride).

0.70::true_val(core_material_ride, lighter_smoother_damper); 0.30::true_val(core_material_ride, unk_core_material_ride).

measured(s16, core_material_ride, lighter_smoother_damper).

all_consistent(core_material_ride) :-
    (indep(s16), consistent(s16, core_material_ride) ; \+indep(s16)).

evidence(all_consistent(core_material_ride)).
query(true_val(core_material_ride, lighter_smoother_damper)).
query(true_val(core_material_ride, unk_core_material_ride)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_biax_basalt=TriAx_BiAx_Fiberglass_Basalt_Alloy unk_laminate=Unknown
% @importance 0.93

0.95::acc(s1, laminate).
0.82::acc(s2, laminate).
0.90::acc(sm, laminate).

0.97::true_val(laminate, triax_biax_basalt); 0.03::true_val(laminate, unk_laminate).

measured(s1, laminate, triax_biax_basalt).
measured(s2, laminate, triax_biax_basalt).
measured(sm, laminate, triax_biax_basalt).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(s2), consistent(s2, laminate) ; \+indep(s2)),
    (indep(sm), consistent(sm, laminate) ; \+indep(sm)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_basalt)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values basalt_volcanic_fiber=Volcanic_basalt_fiber_stronger_than_fiberglass unk_construction_material_innovation=Unknown
% @importance 0.65

0.82::acc(s13, construction_material_innovation).
0.80::acc(s2, construction_material_innovation).

0.90::true_val(construction_material_innovation, basalt_volcanic_fiber); 0.10::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s13, construction_material_innovation, basalt_volcanic_fiber).
measured(s2, construction_material_innovation, basalt_volcanic_fiber).

all_consistent(construction_material_innovation) :-
    (indep(s13), consistent(s13, construction_material_innovation) ; \+indep(s13)),
    (indep(s2), consistent(s2, construction_material_innovation) ; \+indep(s2)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, basalt_volcanic_fiber)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_triax
% @type categorical
% @canonical false
% @original_name construction_material_innovation (tri-ax orientation)
% @values triax_0_45_45=TriAx_0x45x45_torsional_responsiveness unk_construction_material_innovation_triax=Unknown
% @importance 0.55

0.75::acc(s19, construction_material_innovation_triax).

0.70::true_val(construction_material_innovation_triax, triax_0_45_45); 0.30::true_val(construction_material_innovation_triax, unk_construction_material_innovation_triax).

measured(s19, construction_material_innovation_triax, triax_0_45_45).

all_consistent(construction_material_innovation_triax) :-
    (indep(s19), consistent(s19, construction_material_innovation_triax) ; \+indep(s19)).

evidence(all_consistent(construction_material_innovation_triax)).
query(true_val(construction_material_innovation_triax, triax_0_45_45)).
query(true_val(construction_material_innovation_triax, unk_construction_material_innovation_triax)).

% @attr construction_material_innovation_biax
% @type categorical
% @canonical false
% @original_name construction_material_innovation (bi-ax orientation)
% @values biax_0_90=BiAx_0x90_pop_stability_control unk_construction_material_innovation_biax=Unknown
% @importance 0.55

0.75::acc(s19, construction_material_innovation_biax).

0.70::true_val(construction_material_innovation_biax, biax_0_90); 0.30::true_val(construction_material_innovation_biax, unk_construction_material_innovation_biax).

measured(s19, construction_material_innovation_biax, biax_0_90).

all_consistent(construction_material_innovation_biax) :-
    (indep(s19), consistent(s19, construction_material_innovation_biax) ; \+indep(s19)).

evidence(all_consistent(construction_material_innovation_biax)).
query(true_val(construction_material_innovation_biax, biax_0_90)).
query(true_val(construction_material_innovation_biax, unk_construction_material_innovation_biax)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values eco_sublimated_sintered=Eco_Sublimated_Sintered unk_base_material=Unknown
% @importance 0.85

0.85::acc(s13, base_material).
0.90::acc(sm, base_material).

0.95::true_val(base_material, eco_sublimated_sintered); 0.05::true_val(base_material, unk_base_material).

measured(s13, base_material, eco_sublimated_sintered).
measured(sm, base_material, eco_sublimated_sintered).

all_consistent(base_material) :-
    (indep(s13), consistent(s13, base_material) ; \+indep(s13)),
    (indep(sm), consistent(sm, base_material) ; \+indep(sm)).

evidence(all_consistent(base_material)).
query(true_val(base_material, eco_sublimated_sintered)).
query(true_val(base_material, unk_base_material)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly unk_topsheet=Unknown
% @importance 0.87

0.85::acc(s2, topsheet).
0.82::acc(s13, topsheet).
0.90::acc(sm, topsheet).

0.95::true_val(topsheet, eco_sublimated_poly); 0.05::true_val(topsheet, unk_topsheet).

measured(s2, topsheet, eco_sublimated_poly).
measured(s13, topsheet, eco_sublimated_poly).
measured(sm, topsheet, eco_sublimated_poly).

all_consistent(topsheet) :-
    (indep(s2), consistent(s2, topsheet) ; \+indep(s2)),
    (indep(s13), consistent(s13, topsheet) ; \+indep(s13)),
    (indep(sm), consistent(sm, topsheet) ; \+indep(sm)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch_internal=Birch_vertical_end_grain_pop_durability unk_sidewall_material=Unknown
% @importance 0.85

0.85::acc(s13, sidewall_material).
0.88::acc(sm, sidewall_material).

0.93::true_val(sidewall_material, birch_internal); 0.07::true_val(sidewall_material, unk_sidewall_material).

measured(s13, sidewall_material, birch_internal).
measured(sm, sidewall_material, birch_internal).

all_consistent(sidewall_material) :-
    (indep(s13), consistent(s13, sidewall_material) ; \+indep(s13)),
    (indep(sm), consistent(sm, sidewall_material) ; \+indep(sm)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_internal)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_uhmw
% @type categorical
% @canonical false
% @original_name sidewall_material (UHMW)
% @values uhmw_sintered=UHMW_Sintered_impact_resistant unk_sidewall_material_uhmw=Unknown
% @importance 0.85

0.85::acc(s13, sidewall_material_uhmw).
0.88::acc(sm, sidewall_material_uhmw).

0.93::true_val(sidewall_material_uhmw, uhmw_sintered); 0.07::true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw).

measured(s13, sidewall_material_uhmw, uhmw_sintered).
measured(sm, sidewall_material_uhmw, uhmw_sintered).

all_consistent(sidewall_material_uhmw) :-
    (indep(s13), consistent(s13, sidewall_material_uhmw) ; \+indep(s13)),
    (indep(sm), consistent(sm, sidewall_material_uhmw) ; \+indep(sm)).

evidence(all_consistent(sidewall_material_uhmw)).
query(true_val(sidewall_material_uhmw, uhmw_sintered)).
query(true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction=MagneTraction_7_serrations unk_edge_technology=Unknown
% @importance 0.88

0.95::acc(s1, edge_technology).
0.82::acc(s5, edge_technology).
0.82::acc(s13, edge_technology).
0.90::acc(sm, edge_technology).

0.97::true_val(edge_technology, magne_traction); 0.03::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, magne_traction).
measured(s5, edge_technology, magne_traction).
measured(s13, edge_technology, magne_traction).
measured(sm, edge_technology, magne_traction).

all_consistent(edge_technology) :-
    consistent(s1, edge_technology),
    (indep(s5), consistent(s5, edge_technology) ; \+indep(s5)),
    (indep(s13), consistent(s13, edge_technology) ; \+indep(s13)),
    (indep(sm), consistent(sm, edge_technology) ; \+indep(sm)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_technology_tip_tail
% @type categorical
% @canonical false
% @original_name edge_technology (UHMW tip/tail)
% @values uhmw_tip_tail_deflection=UHMW_Tip_Tail_Impact_Deflection unk_edge_technology_tip_tail=Unknown
% @importance 0.85

0.85::acc(s13, edge_technology_tip_tail).
0.88::acc(sm, edge_technology_tip_tail).

0.93::true_val(edge_technology_tip_tail, uhmw_tip_tail_deflection); 0.07::true_val(edge_technology_tip_tail, unk_edge_technology_tip_tail).

measured(s13, edge_technology_tip_tail, uhmw_tip_tail_deflection).
measured(sm, edge_technology_tip_tail, uhmw_tip_tail_deflection).

all_consistent(edge_technology_tip_tail) :-
    (indep(s13), consistent(s13, edge_technology_tip_tail) ; \+indep(s13)),
    (indep(sm), consistent(sm, edge_technology_tip_tail) ; \+indep(sm)).

evidence(all_consistent(edge_technology_tip_tail)).
query(true_val(edge_technology_tip_tail, uhmw_tip_tail_deflection)).
query(true_val(edge_technology_tip_tail, unk_edge_technology_tip_tail)).

% @attr tip_tail_design
% @type categorical
% @canonical false
% @original_name Tip/tail design
% @values slimmed_tips=Slimmed_down_tips_easier_rotations unk_tip_tail_design=Unknown
% @importance 0.7

0.80::acc(s13, tip_tail_design).

0.80::true_val(tip_tail_design, slimmed_tips); 0.20::true_val(tip_tail_design, unk_tip_tail_design).

measured(s13, tip_tail_design, slimmed_tips).

all_consistent(tip_tail_design) :-
    (indep(s13), consistent(s13, tip_tail_design) ; \+indep(s13)).

evidence(all_consistent(tip_tail_design)).
query(true_val(tip_tail_design, slimmed_tips)).
query(true_val(tip_tail_design, unk_tip_tail_design)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.92::acc(sm, mounting_pattern).

0.92::true_val(mounting_pattern, inserts_2x4); 0.08::true_val(mounting_pattern, unk_mounting_pattern).

measured(sm, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(sm), consistent(sm, mounting_pattern) ; \+indep(sm)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values low_voc_epoxy=Low_VOC_epoxy unk_resin=Unknown
% @importance 0.45

0.78::acc(s12, resin).

0.75::true_val(resin, low_voc_epoxy); 0.25::true_val(resin, unk_resin).

measured(s12, resin, low_voc_epoxy).

all_consistent(resin) :-
    (indep(s12), consistent(s12, resin) ; \+indep(s12)).

evidence(all_consistent(resin)).
query(true_val(resin, low_voc_epoxy)).
query(true_val(resin, unk_resin)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values full_10_sizes=148_153_155_157_157W_159_161_161W_164_164W partial_7_sizes=153_155_157_159_157W_161W_164W
% @importance 0.925

0.93::acc(s1, available_sizes).
0.85::acc(sm, available_sizes).

0.70::true_val(available_sizes, full_10_sizes); 0.30::true_val(available_sizes, partial_7_sizes).

measured(s1, available_sizes, full_10_sizes).
measured(sm, available_sizes, partial_7_sizes).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes),
    (indep(sm), consistent(sm, available_sizes) ; \+indep(sm)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, full_10_sizes)).
query(true_val(available_sizes, partial_7_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.90::acc(sm, width_options).

0.90::true_val(width_options, standard_and_wide); 0.10::true_val(width_options, unk_width_options).

measured(sm, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(sm), consistent(sm, width_options) ; \+indep(sm)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size (157cm)
% @values v121_0=121.0 unk_contact_length_size=Unknown
% @importance 0.925

0.94::acc(s1, contact_length_size).
0.90::acc(sm, contact_length_size).

0.95::true_val(contact_length_size, v121_0); 0.05::true_val(contact_length_size, unk_contact_length_size).

measured(s1, contact_length_size, v121_0).
measured(sm, contact_length_size, v121_0).

all_consistent(contact_length_size) :-
    consistent(s1, contact_length_size),
    (indep(sm), consistent(sm, contact_length_size) ; \+indep(sm)).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v121_0)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size (157cm)
% @values v8_2=8.2 unk_sidecut_radius_size=Unknown
% @importance 0.925

0.94::acc(s1, sidecut_radius_size).
0.90::acc(sm, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v8_2); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v8_2).
measured(sm, sidecut_radius_size, v8_2).

all_consistent(sidecut_radius_size) :-
    consistent(s1, sidecut_radius_size),
    (indep(sm), consistent(sm, sidecut_radius_size) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_2)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size (157cm)
% @values v30_1=30.1 unk_tip_tail_width_size=Unknown
% @importance 0.925

0.94::acc(s1, tip_tail_width_size).
0.90::acc(sm, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v30_1); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v30_1).
measured(sm, tip_tail_width_size, v30_1).

all_consistent(tip_tail_width_size) :-
    consistent(s1, tip_tail_width_size),
    (indep(sm), consistent(sm, tip_tail_width_size) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_1)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_157
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (157cm)
% @values v25_8=25.8 unk_waist_width_157=Unknown
% @importance 0.925

0.94::acc(s1, waist_width_157).
0.90::acc(sm, waist_width_157).

0.95::true_val(waist_width_157, v25_8); 0.05::true_val(waist_width_157, unk_waist_width_157).

measured(s1, waist_width_157, v25_8).
measured(sm, waist_width_157, v25_8).

all_consistent(waist_width_157) :-
    consistent(s1, waist_width_157),
    (indep(sm), consistent(sm, waist_width_157) ; \+indep(sm)).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_8)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr recommended_weight_range_size
% @type categorical
% @unit lbs
% @canonical true
% @original_name recommended_weight_range_size (157cm)
% @values w120_plus=120_plus_lbs unk_recommended_weight_range_size=Unknown
% @importance 0.925

0.94::acc(s1, recommended_weight_range_size).
0.90::acc(sm, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, w120_plus); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, w120_plus).
measured(sm, recommended_weight_range_size, w120_plus).

all_consistent(recommended_weight_range_size) :-
    consistent(s1, recommended_weight_range_size),
    (indep(sm), consistent(sm, recommended_weight_range_size) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w120_plus)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr contact_length_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (159cm)
% @values v122_0=122.0 unk_contact_length_size_159=Unknown
% @importance 0.925

0.94::acc(s1, contact_length_size_159).
0.90::acc(sm, contact_length_size_159).

0.95::true_val(contact_length_size_159, v122_0); 0.05::true_val(contact_length_size_159, unk_contact_length_size_159).

measured(s1, contact_length_size_159, v122_0).
measured(sm, contact_length_size_159, v122_0).

all_consistent(contact_length_size_159) :-
    consistent(s1, contact_length_size_159),
    (indep(sm), consistent(sm, contact_length_size_159) ; \+indep(sm)).

evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v122_0)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @values v8_3=8.3 unk_sidecut_radius_size_159=Unknown
% @importance 0.925

0.94::acc(s1, sidecut_radius_size_159).
0.90::acc(sm, sidecut_radius_size_159).

0.95::true_val(sidecut_radius_size_159, v8_3); 0.05::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s1, sidecut_radius_size_159, v8_3).
measured(sm, sidecut_radius_size_159, v8_3).

all_consistent(sidecut_radius_size_159) :-
    consistent(s1, sidecut_radius_size_159),
    (indep(sm), consistent(sm, sidecut_radius_size_159) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_3)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr tip_tail_width_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (159cm)
% @values v30_2=30.2 unk_tip_tail_width_size_159=Unknown
% @importance 0.925

0.94::acc(s1, tip_tail_width_size_159).
0.90::acc(sm, tip_tail_width_size_159).

0.95::true_val(tip_tail_width_size_159, v30_2); 0.05::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s1, tip_tail_width_size_159, v30_2).
measured(sm, tip_tail_width_size_159, v30_2).

all_consistent(tip_tail_width_size_159) :-
    consistent(s1, tip_tail_width_size_159),
    (indep(sm), consistent(sm, tip_tail_width_size_159) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v30_2)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (159cm)
% @values v25_9=25.9 unk_waist_width_159=Unknown
% @importance 0.925

0.94::acc(s1, waist_width_159).
0.90::acc(sm, waist_width_159).

0.95::true_val(waist_width_159, v25_9); 0.05::true_val(waist_width_159, unk_waist_width_159).

measured(s1, waist_width_159, v25_9).
measured(sm, waist_width_159, v25_9).

all_consistent(waist_width_159) :-
    consistent(s1, waist_width_159),
    (indep(sm), consistent(sm, waist_width_159) ; \+indep(sm)).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_9)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr stance_width_range_size
% @type categorical
% @unit inches
% @canonical false
% @original_name stance_width_range_size (159cm)
% @values r20_25_to_25_0=20.25in_to_25.0in unk_stance_width_range_size=Unknown
% @importance 0.925

0.94::acc(s1, stance_width_range_size).
0.90::acc(sm, stance_width_range_size).

0.95::true_val(stance_width_range_size, r20_25_to_25_0); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, r20_25_to_25_0).
measured(sm, stance_width_range_size, r20_25_to_25_0).

all_consistent(stance_width_range_size) :-
    consistent(s1, stance_width_range_size),
    (indep(sm), consistent(sm, stance_width_range_size) ; \+indep(sm)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r20_25_to_25_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @values w125_plus=125_plus_lbs unk_recommended_weight_range_size_159=Unknown
% @importance 0.925

0.94::acc(s1, recommended_weight_range_size_159).
0.90::acc(sm, recommended_weight_range_size_159).

0.95::true_val(recommended_weight_range_size_159, w125_plus); 0.05::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s1, recommended_weight_range_size_159, w125_plus).
measured(sm, recommended_weight_range_size_159, w125_plus).

all_consistent(recommended_weight_range_size_159) :-
    consistent(s1, recommended_weight_range_size_159),
    (indep(sm), consistent(sm, recommended_weight_range_size_159) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w125_plus)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v3000=3000.0 unk_board_weight_grams=Unknown
% @importance 0.95

0.92::acc(s15, board_weight_grams).

0.88::true_val(board_weight_grams, v3000); 0.12::true_val(board_weight_grams, unk_board_weight_grams).

measured(s15, board_weight_grams, v3000).

all_consistent(board_weight_grams) :- consistent(s15, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3000)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical true
% @original_name weight_per_cm (157cm actual)
% @values v19_11=19.11 unk_weight_per_cm=Unknown
% @importance 0.95

0.92::acc(s15, weight_per_cm).

0.88::true_val(weight_per_cm, v19_11); 0.12::true_val(weight_per_cm, unk_weight_per_cm).

measured(s15, weight_per_cm, v19_11).

all_consistent(weight_per_cm) :- consistent(s15, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v19_11)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr weight_per_cm_avg
% @type numeric
% @unit g/cm
% @canonical false
% @original_name weight_per_cm (category average)
% @values v18_58=18.58 unk_weight_per_cm_avg=Unknown
% @importance 0.95

0.85::acc(s15, weight_per_cm_avg).

0.85::true_val(weight_per_cm_avg, v18_58); 0.15::true_val(weight_per_cm_avg, unk_weight_per_cm_avg).

measured(s15, weight_per_cm_avg, v18_58).

all_consistent(weight_per_cm_avg) :- consistent(s15, weight_per_cm_avg).

evidence(all_consistent(weight_per_cm_avg)).
query(true_val(weight_per_cm_avg, v18_58)).
query(true_val(weight_per_cm_avg, unk_weight_per_cm_avg)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values damp_and_snappy=Board_feels_both_damp_and_snappy unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.95

0.85::acc(s15, reviewer_opinion_snowboardingprofiles).

0.85::true_val(reviewer_opinion_snowboardingprofiles, damp_and_snappy); 0.15::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s15, reviewer_opinion_snowboardingprofiles, damp_and_snappy).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s15, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, damp_and_snappy)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (weight feel)
% @values felt_normal=Felt_Normal unk_reviewer_opinion_snowboardingprofiles_weight=Unknown
% @importance 0.95

0.82::acc(s15, reviewer_opinion_snowboardingprofiles_weight).

0.82::true_val(reviewer_opinion_snowboardingprofiles_weight, felt_normal); 0.18::true_val(reviewer_opinion_snowboardingprofiles_weight, unk_reviewer_opinion_snowboardingprofiles_weight).

measured(s15, reviewer_opinion_snowboardingprofiles_weight, felt_normal).

all_consistent(reviewer_opinion_snowboardingprofiles_weight) :- consistent(s15, reviewer_opinion_snowboardingprofiles_weight).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_weight)).
query(true_val(reviewer_opinion_snowboardingprofiles_weight, felt_normal)).
query(true_val(reviewer_opinion_snowboardingprofiles_weight, unk_reviewer_opinion_snowboardingprofiles_weight)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v699_99=699.99 unk_price_usd_msrp=Unknown
% @importance 1.0

0.95::acc(s1, price_usd_msrp).

0.95::true_val(price_usd_msrp, v699_99); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s1, price_usd_msrp, v699_99).

all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v699_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical false
% @original_name price_eur_blue_tomato
% @values v699_99_eur=699.99 unk_price_eur_blue_tomato=Unknown
% @importance 0.7

0.90::acc(s20, price_eur_blue_tomato).

0.90::true_val(price_eur_blue_tomato, v699_99_eur); 0.10::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s20, price_eur_blue_tomato, v699_99_eur).

all_consistent(price_eur_blue_tomato) :-
    (indep(s20), consistent(s20, price_eur_blue_tomato) ; \+indep(s20)).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v699_99_eur)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1169_99=1169.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(sm, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1169_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(sm, price_aud_merchant, v1169_99).

all_consistent(price_aud_merchant) :- consistent(sm, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1169_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_libtech_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name Lib Tech direct sale price (current)
% @values v440_99=440.99 unk_price_usd_libtech_sale=Unknown
% @importance 1.0

0.93::acc(s1, price_usd_libtech_sale).

0.93::true_val(price_usd_libtech_sale, v440_99); 0.07::true_val(price_usd_libtech_sale, unk_price_usd_libtech_sale).

measured(s1, price_usd_libtech_sale, v440_99).

all_consistent(price_usd_libtech_sale) :- consistent(s1, price_usd_libtech_sale).

evidence(all_consistent(price_usd_libtech_sale)).
query(true_val(price_usd_libtech_sale, v440_99)).
query(true_val(price_usd_libtech_sale, unk_price_usd_libtech_sale)).

% @attr price_usd_evo
% @type categorical
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values msrp_699_99_sale_489_99_blem_419_99=MSRP_699.99_Sale_489.99_Blem_419.99 unk_price_usd_evo=Unknown
% @importance 0.85

0.90::acc(s2, price_usd_evo).

0.90::true_val(price_usd_evo, msrp_699_99_sale_489_99_blem_419_99); 0.10::true_val(price_usd_evo, unk_price_usd_evo).

measured(s2, price_usd_evo, msrp_699_99_sale_489_99_blem_419_99).

all_consistent(price_usd_evo) :-
    (indep(s2), consistent(s2, price_usd_evo) ; \+indep(s2)).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, msrp_699_99_sale_489_99_blem_419_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v489_99=489.99 unk_price_usd_tactics=Unknown
% @importance 0.85

0.88::acc(s13, price_usd_tactics).

0.88::true_val(price_usd_tactics, v489_99); 0.12::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s13, price_usd_tactics, v489_99).

all_consistent(price_usd_tactics) :-
    (indep(s13), consistent(s13, price_usd_tactics) ; \+indep(s13)).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v489_99)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available=Available unk_availability_status=Unknown
% @importance 0.59

0.75::acc(s23, availability_status).
0.72::acc(s24, availability_status).
0.60::acc(s25, availability_status).
0.72::acc(s26, availability_status).
0.62::acc(s27, availability_status).
0.55::acc(s28, availability_status).

0.95::true_val(availability_status, available); 0.05::true_val(availability_status, unk_availability_status).

measured(s23, availability_status, available).
measured(s24, availability_status, available).
measured(s25, availability_status, available).
measured(s26, availability_status, available).
measured(s27, availability_status, available).
measured(s28, availability_status, available).

all_consistent(availability_status) :-
    (indep(s23), consistent(s23, availability_status) ; \+indep(s23)),
    (indep(s24), consistent(s24, availability_status) ; \+indep(s24)),
    (indep(s25), consistent(s25, availability_status) ; \+indep(s25)),
    (indep(s26), consistent(s26, availability_status) ; \+indep(s26)),
    (indep(s27), consistent(s27, availability_status) ; \+indep(s27)),
    (indep(s28), consistent(s28, availability_status) ; \+indep(s28)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available)).
query(true_val(availability_status, unk_availability_status)).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_rei
% @values v699_99=699.99 unk_price_usd_rei=Unknown
% @importance 0.7

0.82::acc(s5, price_usd_rei).

0.82::true_val(price_usd_rei, v699_99); 0.18::true_val(price_usd_rei, unk_price_usd_rei).

measured(s5, price_usd_rei, v699_99).

all_consistent(price_usd_rei) :-
    (indep(s5), consistent(s5, price_usd_rei) ; \+indep(s5)).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v699_99)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status (Ski Pro)
% @values sold_out=Sold_out unk_availability_status_skipro=Unknown
% @importance 0.55

0.80::acc(s29, availability_status_skipro).

0.75::true_val(availability_status_skipro, sold_out); 0.25::true_val(availability_status_skipro, unk_availability_status_skipro).

measured(s29, availability_status_skipro, sold_out).

all_consistent(availability_status_skipro) :-
    (indep(s29), consistent(s29, availability_status_skipro) ; \+indep(s29)).

evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, sold_out)).
query(true_val(availability_status_skipro, unk_availability_status_skipro)).

% @attr price_usd_msrp_historical
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (historical)
% @values v599_95=599.95 unk_price_usd_msrp_historical=Unknown
% @importance 0.65

0.60::acc(s30, price_usd_msrp_historical).

0.55::true_val(price_usd_msrp_historical, v599_95); 0.45::true_val(price_usd_msrp_historical, unk_price_usd_msrp_historical).

measured(s30, price_usd_msrp_historical, v599_95).

all_consistent(price_usd_msrp_historical) :- consistent(s30, price_usd_msrp_historical).

evidence(all_consistent(price_usd_msrp_historical)).
query(true_val(price_usd_msrp_historical, v599_95)).
query(true_val(price_usd_msrp_historical, unk_price_usd_msrp_historical)).

% @attr rating_libtech
% @type numeric
% @unit percent
% @canonical false
% @original_name Lib Tech website rating
% @values v98=98.0 unk_rating_libtech=Unknown
% @importance 1.0

0.90::acc(s1, rating_libtech).

0.90::true_val(rating_libtech, v98); 0.10::true_val(rating_libtech, unk_rating_libtech).

measured(s1, rating_libtech, v98).

all_consistent(rating_libtech) :- consistent(s1, rating_libtech).

evidence(all_consistent(rating_libtech)).
query(true_val(rating_libtech, v98)).
query(true_val(rating_libtech, unk_rating_libtech)).

% @attr rating_merchant
% @type numeric
% @unit /5
% @canonical false
% @original_name Merchant customer rating
% @values v5_0=5.0 unk_rating_merchant=Unknown
% @importance 0.85

0.80::acc(sm, rating_merchant).

0.80::true_val(rating_merchant, v5_0); 0.20::true_val(rating_merchant, unk_rating_merchant).

measured(sm, rating_merchant, v5_0).

all_consistent(rating_merchant) :- consistent(sm, rating_merchant).

evidence(all_consistent(rating_merchant)).
query(true_val(rating_merchant, v5_0)).
query(true_val(rating_merchant, unk_rating_merchant)).

% @attr rating_libtech_eu
% @type numeric
% @unit percent
% @canonical false
% @original_name Lib Tech EU website rating
% @values v97=97.0 unk_rating_libtech_eu=Unknown
% @importance 0.7

0.88::acc(s20, rating_libtech_eu).

0.88::true_val(rating_libtech_eu, v97); 0.12::true_val(rating_libtech_eu, unk_rating_libtech_eu).

measured(s20, rating_libtech_eu, v97).

all_consistent(rating_libtech_eu) :-
    (indep(s20), consistent(s20, rating_libtech_eu) ; \+indep(s20)).

evidence(all_consistent(rating_libtech_eu)).
query(true_val(rating_libtech_eu, v97)).
query(true_val(rating_libtech_eu, unk_rating_libtech_eu)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v85_6=85.6 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.95

0.88::acc(s15, overall_rating_snowboardingprofiles).

0.88::true_val(overall_rating_snowboardingprofiles, v85_6); 0.12::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s15, overall_rating_snowboardingprofiles, v85_6).

all_consistent(overall_rating_snowboardingprofiles) :- consistent(s15, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v85_6)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr overall_rating_snowboardingprofiles_rank
% @type categorical
% @canonical false
% @original_name overall_rating_snowboardingprofiles (rank)
% @values rank_15_of_33=15th_of_33_AMF_boards unk_overall_rating_snowboardingprofiles_rank=Unknown
% @importance 0.95

0.85::acc(s15, overall_rating_snowboardingprofiles_rank).

0.85::true_val(overall_rating_snowboardingprofiles_rank, rank_15_of_33); 0.15::true_val(overall_rating_snowboardingprofiles_rank, unk_overall_rating_snowboardingprofiles_rank).

measured(s15, overall_rating_snowboardingprofiles_rank, rank_15_of_33).

all_consistent(overall_rating_snowboardingprofiles_rank) :- consistent(s15, overall_rating_snowboardingprofiles_rank).

evidence(all_consistent(overall_rating_snowboardingprofiles_rank)).
query(true_val(overall_rating_snowboardingprofiles_rank, rank_15_of_33)).
query(true_val(overall_rating_snowboardingprofiles_rank, unk_overall_rating_snowboardingprofiles_rank)).

% @attr overall_rating_snowboardingprofiles_avg
% @type numeric
% @unit /100
% @canonical false
% @original_name overall_rating_snowboardingprofiles (average comparison)
% @values v84_3=84.3 unk_overall_rating_snowboardingprofiles_avg=Unknown
% @importance 0.95

0.82::acc(s15, overall_rating_snowboardingprofiles_avg).

0.82::true_val(overall_rating_snowboardingprofiles_avg, v84_3); 0.18::true_val(overall_rating_snowboardingprofiles_avg, unk_overall_rating_snowboardingprofiles_avg).

measured(s15, overall_rating_snowboardingprofiles_avg, v84_3).

all_consistent(overall_rating_snowboardingprofiles_avg) :- consistent(s15, overall_rating_snowboardingprofiles_avg).

evidence(all_consistent(overall_rating_snowboardingprofiles_avg)).
query(true_val(overall_rating_snowboardingprofiles_avg, v84_3)).
query(true_val(overall_rating_snowboardingprofiles_avg, unk_overall_rating_snowboardingprofiles_avg)).

% @attr carving_score_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values scores_mixed=Edge4_Carving3_5_Turns4_Switch4_5_Speed3_5_Spins4_Butters4_Jibbing3_5_Crud4_Trees4_Powder2_5 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.95

0.88::acc(s15, carving_score_snowboardingprofiles).

0.88::true_val(carving_score_snowboardingprofiles, scores_mixed); 0.12::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s15, carving_score_snowboardingprofiles, scores_mixed).

all_consistent(carving_score_snowboardingprofiles) :- consistent(s15, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, scores_mixed)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values whitelines_100=Selected_for_Whitelines_100 unk_reviewer_opinion_whitelines=Unknown
% @importance 0.6

0.78::acc(s31, reviewer_opinion_whitelines).

0.75::true_val(reviewer_opinion_whitelines, whitelines_100); 0.25::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s31, reviewer_opinion_whitelines, whitelines_100).

all_consistent(reviewer_opinion_whitelines) :- consistent(s31, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, whitelines_100)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values aggressive_mtn_freestyle=Aggressive_mountain_freestyle_for_mid_wide_riders unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.8

0.78::acc(s32, reviewer_opinion_the_good_ride).

0.75::true_val(reviewer_opinion_the_good_ride, aggressive_mtn_freestyle); 0.25::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s32, reviewer_opinion_the_good_ride, aggressive_mtn_freestyle).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s32, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, aggressive_mtn_freestyle)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_snowboarders_journal
% @type categorical
% @canonical false
% @original_name The Snowboarder's Journal opinion
% @values all_mountain_killer=All_mountain_killer_poppy_playful_assertive unk_reviewer_opinion_snowboarders_journal=Unknown
% @importance 0.65

0.75::acc(s30, reviewer_opinion_snowboarders_journal).

0.70::true_val(reviewer_opinion_snowboarders_journal, all_mountain_killer); 0.30::true_val(reviewer_opinion_snowboarders_journal, unk_reviewer_opinion_snowboarders_journal).

measured(s30, reviewer_opinion_snowboarders_journal, all_mountain_killer).

all_consistent(reviewer_opinion_snowboarders_journal) :- consistent(s30, reviewer_opinion_snowboarders_journal).

evidence(all_consistent(reviewer_opinion_snowboarders_journal)).
query(true_val(reviewer_opinion_snowboarders_journal, all_mountain_killer)).
query(true_val(reviewer_opinion_snowboarders_journal, unk_reviewer_opinion_snowboarders_journal)).

% @attr reviewer_opinion_snowboardhow
% @type categorical
% @canonical false
% @original_name SnowboardHow.com opinion
% @values best_all_mountain=One_of_the_best_all_mountain_snowboards unk_reviewer_opinion_snowboardhow=Unknown
% @importance 0.75

0.70::acc(s33, reviewer_opinion_snowboardhow).

0.68::true_val(reviewer_opinion_snowboardhow, best_all_mountain); 0.32::true_val(reviewer_opinion_snowboardhow, unk_reviewer_opinion_snowboardhow).

measured(s33, reviewer_opinion_snowboardhow, best_all_mountain).

all_consistent(reviewer_opinion_snowboardhow) :- consistent(s33, reviewer_opinion_snowboardhow).

evidence(all_consistent(reviewer_opinion_snowboardhow)).
query(true_val(reviewer_opinion_snowboardhow, best_all_mountain)).
query(true_val(reviewer_opinion_snowboardhow, unk_reviewer_opinion_snowboardhow)).

% @attr value_assessment_snowboardhow
% @type categorical
% @canonical false
% @original_name SnowboardHow.com value assessment
% @values great_deal=High_end_performance_lower_price unk_value_assessment_snowboardhow=Unknown
% @importance 0.75

0.68::acc(s33, value_assessment_snowboardhow).

0.65::true_val(value_assessment_snowboardhow, great_deal); 0.35::true_val(value_assessment_snowboardhow, unk_value_assessment_snowboardhow).

measured(s33, value_assessment_snowboardhow, great_deal).

all_consistent(value_assessment_snowboardhow) :- consistent(s33, value_assessment_snowboardhow).

evidence(all_consistent(value_assessment_snowboardhow)).
query(true_val(value_assessment_snowboardhow, great_deal)).
query(true_val(value_assessment_snowboardhow, unk_value_assessment_snowboardhow)).

% @attr carving_score_snowboardingprofiles_qual
% @type categorical
% @canonical false
% @original_name carving_score_snowboardingprofiles (qualitative)
% @values decent_not_epic=Decent_carves_not_epic_carver unk_carving_score_snowboardingprofiles_qual=Unknown
% @importance 0.95

0.85::acc(s15, carving_score_snowboardingprofiles_qual).

0.85::true_val(carving_score_snowboardingprofiles_qual, decent_not_epic); 0.15::true_val(carving_score_snowboardingprofiles_qual, unk_carving_score_snowboardingprofiles_qual).

measured(s15, carving_score_snowboardingprofiles_qual, decent_not_epic).

all_consistent(carving_score_snowboardingprofiles_qual) :- consistent(s15, carving_score_snowboardingprofiles_qual).

evidence(all_consistent(carving_score_snowboardingprofiles_qual)).
query(true_val(carving_score_snowboardingprofiles_qual, decent_not_epic)).
query(true_val(carving_score_snowboardingprofiles_qual, unk_carving_score_snowboardingprofiles_qual)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good_with_magnatraction=MagneTraction_helps_firm_snow_C2_sacrifices_some_grip unk_edge_hold=Unknown
% @importance 0.8

0.78::acc(s26, edge_hold).

0.78::true_val(edge_hold, good_with_magnatraction); 0.22::true_val(edge_hold, unk_edge_hold).

measured(s26, edge_hold, good_with_magnatraction).

all_consistent(edge_hold) :-
    (indep(s26), consistent(s26, edge_hold) ; \+indep(s26)).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good_with_magnatraction)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values quick_easy=Quick_easy_edge_to_edge_really_good unk_turn_initiation_performance=Unknown
% @importance 0.95

0.85::acc(s15, turn_initiation_performance).

0.85::true_val(turn_initiation_performance, quick_easy); 0.15::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s15, turn_initiation_performance, quick_easy).

all_consistent(turn_initiation_performance) :- consistent(s15, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, quick_easy)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_snowboardingprofiles_catch
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (catch risk)
% @values low_catch=Decently_low_catch_risk unk_reviewer_opinion_snowboardingprofiles_catch=Unknown
% @importance 0.95

0.85::acc(s15, reviewer_opinion_snowboardingprofiles_catch).

0.85::true_val(reviewer_opinion_snowboardingprofiles_catch, low_catch); 0.15::true_val(reviewer_opinion_snowboardingprofiles_catch, unk_reviewer_opinion_snowboardingprofiles_catch).

measured(s15, reviewer_opinion_snowboardingprofiles_catch, low_catch).

all_consistent(reviewer_opinion_snowboardingprofiles_catch) :- consistent(s15, reviewer_opinion_snowboardingprofiles_catch).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_catch)).
query(true_val(reviewer_opinion_snowboardingprofiles_catch, low_catch)).
query(true_val(reviewer_opinion_snowboardingprofiles_catch, unk_reviewer_opinion_snowboardingprofiles_catch)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values stable_moderate=Stable_to_moderately_fast_wobbly_after unk_speed_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s15, speed_rating_tgr).

0.85::true_val(speed_rating_tgr, stable_moderate); 0.15::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s15, speed_rating_tgr, stable_moderate).

all_consistent(speed_rating_tgr) :- consistent(s15, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, stable_moderate)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr reviewer_opinion_snowboardingprofiles_crud
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (crud)
% @values handled_decently=Handled_crud_really_decently unk_reviewer_opinion_snowboardingprofiles_crud=Unknown
% @importance 0.95

0.85::acc(s15, reviewer_opinion_snowboardingprofiles_crud).

0.85::true_val(reviewer_opinion_snowboardingprofiles_crud, handled_decently); 0.15::true_val(reviewer_opinion_snowboardingprofiles_crud, unk_reviewer_opinion_snowboardingprofiles_crud).

measured(s15, reviewer_opinion_snowboardingprofiles_crud, handled_decently).

all_consistent(reviewer_opinion_snowboardingprofiles_crud) :- consistent(s15, reviewer_opinion_snowboardingprofiles_crud).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_crud)).
query(true_val(reviewer_opinion_snowboardingprofiles_crud, handled_decently)).
query(true_val(reviewer_opinion_snowboardingprofiles_crud, unk_reviewer_opinion_snowboardingprofiles_crud)).

% @attr powder_score_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values middling=Middling_shallow_ok_deep_not_epic unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.95

0.85::acc(s15, powder_score_snowboardingprofiles).

0.85::true_val(powder_score_snowboardingprofiles, middling); 0.15::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s15, powder_score_snowboardingprofiles, middling).

all_consistent(powder_score_snowboardingprofiles) :- consistent(s15, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, middling)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values really_good=Felt_really_good_switch_easy_transitions unk_switch_riding=Unknown
% @importance 0.95

0.85::acc(s15, switch_riding).

0.85::true_val(switch_riding, really_good); 0.15::true_val(switch_riding, unk_switch_riding).

measured(s15, switch_riding, really_good).

all_consistent(switch_riding) :- consistent(s15, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, really_good)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values decent_easy_access=Decent_total_pop_easy_to_access unk_pop=Unknown
% @importance 0.95

0.85::acc(s15, pop).

0.85::true_val(pop, decent_easy_access); 0.15::true_val(pop, unk_pop).

measured(s15, pop, decent_easy_access).

all_consistent(pop) :- consistent(s15, pop).

evidence(all_consistent(pop)).
query(true_val(pop, decent_easy_access)).
query(true_val(pop, unk_pop)).

% @attr reviewer_opinion_snowboardingprofiles_press
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (press/butter)
% @values decently_easy=Decently_easy_to_press_and_hold unk_reviewer_opinion_snowboardingprofiles_press=Unknown
% @importance 0.95

0.85::acc(s15, reviewer_opinion_snowboardingprofiles_press).

0.85::true_val(reviewer_opinion_snowboardingprofiles_press, decently_easy); 0.15::true_val(reviewer_opinion_snowboardingprofiles_press, unk_reviewer_opinion_snowboardingprofiles_press).

measured(s15, reviewer_opinion_snowboardingprofiles_press, decently_easy).

all_consistent(reviewer_opinion_snowboardingprofiles_press) :- consistent(s15, reviewer_opinion_snowboardingprofiles_press).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_press)).
query(true_val(reviewer_opinion_snowboardingprofiles_press, decently_easy)).
query(true_val(reviewer_opinion_snowboardingprofiles_press, unk_reviewer_opinion_snowboardingprofiles_press)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values decent_not_ideal=Decent_enough_not_ideal_jib_board unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s15, jibbing_rating_tgr).

0.85::true_val(jibbing_rating_tgr, decent_not_ideal); 0.15::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s15, jibbing_rating_tgr, decent_not_ideal).

all_consistent(jibbing_rating_tgr) :- consistent(s15, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, decent_not_ideal)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr reviewer_opinion_snowboardingprofiles_damp
% @type numeric
% @unit /10
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (dampness)
% @values v6=6.0 unk_reviewer_opinion_snowboardingprofiles_damp=Unknown
% @importance 0.95

0.85::acc(s15, reviewer_opinion_snowboardingprofiles_damp).

0.85::true_val(reviewer_opinion_snowboardingprofiles_damp, v6); 0.15::true_val(reviewer_opinion_snowboardingprofiles_damp, unk_reviewer_opinion_snowboardingprofiles_damp).

measured(s15, reviewer_opinion_snowboardingprofiles_damp, v6).

all_consistent(reviewer_opinion_snowboardingprofiles_damp) :- consistent(s15, reviewer_opinion_snowboardingprofiles_damp).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_damp)).
query(true_val(reviewer_opinion_snowboardingprofiles_damp, v6)).
query(true_val(reviewer_opinion_snowboardingprofiles_damp, unk_reviewer_opinion_snowboardingprofiles_damp)).

% @attr reviewer_opinion_snowboardingprofiles_snap
% @type numeric
% @unit /10
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (snap)
% @values v6_snap=6.0 unk_reviewer_opinion_snowboardingprofiles_snap=Unknown
% @importance 0.95

0.85::acc(s15, reviewer_opinion_snowboardingprofiles_snap).

0.85::true_val(reviewer_opinion_snowboardingprofiles_snap, v6_snap); 0.15::true_val(reviewer_opinion_snowboardingprofiles_snap, unk_reviewer_opinion_snowboardingprofiles_snap).

measured(s15, reviewer_opinion_snowboardingprofiles_snap, v6_snap).

all_consistent(reviewer_opinion_snowboardingprofiles_snap) :- consistent(s15, reviewer_opinion_snowboardingprofiles_snap).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_snap)).
query(true_val(reviewer_opinion_snowboardingprofiles_snap, v6_snap)).
query(true_val(reviewer_opinion_snowboardingprofiles_snap, unk_reviewer_opinion_snowboardingprofiles_snap)).

% @attr reviewer_opinion_snowboardingprofiles_aggro
% @type numeric
% @unit /10
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (aggressiveness)
% @values v6_aggro=6.0 unk_reviewer_opinion_snowboardingprofiles_aggro=Unknown
% @importance 0.95

0.85::acc(s15, reviewer_opinion_snowboardingprofiles_aggro).

0.85::true_val(reviewer_opinion_snowboardingprofiles_aggro, v6_aggro); 0.15::true_val(reviewer_opinion_snowboardingprofiles_aggro, unk_reviewer_opinion_snowboardingprofiles_aggro).

measured(s15, reviewer_opinion_snowboardingprofiles_aggro, v6_aggro).

all_consistent(reviewer_opinion_snowboardingprofiles_aggro) :- consistent(s15, reviewer_opinion_snowboardingprofiles_aggro).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_aggro)).
query(true_val(reviewer_opinion_snowboardingprofiles_aggro, v6_aggro)).
query(true_val(reviewer_opinion_snowboardingprofiles_aggro, unk_reviewer_opinion_snowboardingprofiles_aggro)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_to_Advanced unk_rider_level=Unknown
% @importance 0.87

0.85::acc(s2, rider_level).
0.82::acc(s5, rider_level).
0.90::acc(sm, rider_level).

0.95::true_val(rider_level, intermediate_advanced); 0.05::true_val(rider_level, unk_rider_level).

measured(s2, rider_level, intermediate_advanced).
measured(s5, rider_level, intermediate_advanced).
measured(sm, rider_level, intermediate_advanced).

all_consistent(rider_level) :-
    (indep(s2), consistent(s2, rider_level) ; \+indep(s2)),
    (indep(s5), consistent(s5, rider_level) ; \+indep(s5)),
    (indep(sm), consistent(sm, rider_level) ; \+indep(sm)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values not_for_beginners=Not_recommended_for_beginners unk_skill_level_recommendation=Unknown
% @importance 0.875

0.82::acc(s15, skill_level_recommendation).
0.72::acc(s32, skill_level_recommendation).

0.90::true_val(skill_level_recommendation, not_for_beginners); 0.10::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s15, skill_level_recommendation, not_for_beginners).
measured(s32, skill_level_recommendation, not_for_beginners).

all_consistent(skill_level_recommendation) :-
    consistent(s15, skill_level_recommendation),
    consistent(s32, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, not_for_beginners)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_for_carve_only_or_max_stability=Not_for_groomer_carvers_or_max_stability unk_negative_aspect=Unknown
% @importance 0.8

0.78::acc(s26, negative_aspect).

0.78::true_val(negative_aspect, not_for_carve_only_or_max_stability); 0.22::true_val(negative_aspect, unk_negative_aspect).

measured(s26, negative_aspect, not_for_carve_only_or_max_stability).

all_consistent(negative_aspect) :-
    (indep(s26), consistent(s26, negative_aspect) ; \+indep(s26)).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_for_carve_only_or_max_stability)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values playful_twin_all_mountain=Playful_twin_all_over_the_mountain unk_positive_aspect=Unknown
% @importance 0.8

0.78::acc(s26, positive_aspect).

0.78::true_val(positive_aspect, playful_twin_all_mountain); 0.22::true_val(positive_aspect, unk_positive_aspect).

measured(s26, positive_aspect, playful_twin_all_mountain).

all_consistent(positive_aspect) :-
    (indep(s26), consistent(s26, positive_aspect) ; \+indep(s26)).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, playful_twin_all_mountain)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_quiver
% @type categorical
% @canonical false
% @original_name positive_aspect (one-board quiver)
% @values good_one_board_quiver=Good_one_board_quiver_if_not_deep_powder unk_positive_aspect_quiver=Unknown
% @importance 0.95

0.82::acc(s15, positive_aspect_quiver).

0.82::true_val(positive_aspect_quiver, good_one_board_quiver); 0.18::true_val(positive_aspect_quiver, unk_positive_aspect_quiver).

measured(s15, positive_aspect_quiver, good_one_board_quiver).

all_consistent(positive_aspect_quiver) :- consistent(s15, positive_aspect_quiver).

evidence(all_consistent(positive_aspect_quiver)).
query(true_val(positive_aspect_quiver, good_one_board_quiver)).
query(true_val(positive_aspect_quiver, unk_positive_aspect_quiver)).

% @attr reviewer_opinion_snowboardingprofiles_pairing
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (board pairing)
% @values complements_powder_or_park=Complements_powder_board_or_softer_park_board unk_reviewer_opinion_snowboardingprofiles_pairing=Unknown
% @importance 0.95

0.82::acc(s15, reviewer_opinion_snowboardingprofiles_pairing).

0.82::true_val(reviewer_opinion_snowboardingprofiles_pairing, complements_powder_or_park); 0.18::true_val(reviewer_opinion_snowboardingprofiles_pairing, unk_reviewer_opinion_snowboardingprofiles_pairing).

measured(s15, reviewer_opinion_snowboardingprofiles_pairing, complements_powder_or_park).

all_consistent(reviewer_opinion_snowboardingprofiles_pairing) :- consistent(s15, reviewer_opinion_snowboardingprofiles_pairing).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_pairing)).
query(true_val(reviewer_opinion_snowboardingprofiles_pairing, complements_powder_or_park)).
query(true_val(reviewer_opinion_snowboardingprofiles_pairing, unk_reviewer_opinion_snowboardingprofiles_pairing)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_terrain=Park_all_mountain_freeride_big_mountain unk_terrain_suitability=Unknown
% @importance 0.9

0.88::acc(sm, terrain_suitability).
0.85::acc(s15, terrain_suitability).

0.95::true_val(terrain_suitability, all_terrain); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(sm, terrain_suitability, all_terrain).
measured(s15, terrain_suitability, all_terrain).

all_consistent(terrain_suitability) :-
    (indep(sm), consistent(sm, terrain_suitability) ; \+indep(sm)),
    consistent(s15, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_terrain)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values toby_grubb=Toby_Grubb unk_graphic_designer_artist=Unknown
% @importance 0.85

0.93::acc(s1, graphic_designer_artist).
0.80::acc(s5, graphic_designer_artist).

0.95::true_val(graphic_designer_artist, toby_grubb); 0.05::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s1, graphic_designer_artist, toby_grubb).
measured(s5, graphic_designer_artist, toby_grubb).

all_consistent(graphic_designer_artist) :-
    consistent(s1, graphic_designer_artist),
    (indep(s5), consistent(s5, graphic_designer_artist) ; \+indep(s5)).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, toby_grubb)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr graphic_designer_artist_historical
% @type categorical
% @canonical false
% @original_name graphic_designer_artist (historical)
% @values past_artists_12=Quincy_Quigg_Parillo_Draplin_Ryno_Smith_Schoultz_Peters_Friedman_Dunstan_Krans_Schoph_Dryden unk_graphic_designer_artist_historical=Unknown
% @importance 0.77

0.90::acc(s1, graphic_designer_artist_historical).
0.82::acc(s2, graphic_designer_artist_historical).

0.93::true_val(graphic_designer_artist_historical, past_artists_12); 0.07::true_val(graphic_designer_artist_historical, unk_graphic_designer_artist_historical).

measured(s1, graphic_designer_artist_historical, past_artists_12).
measured(s2, graphic_designer_artist_historical, past_artists_12).

all_consistent(graphic_designer_artist_historical) :-
    consistent(s1, graphic_designer_artist_historical),
    (indep(s2), consistent(s2, graphic_designer_artist_historical) ; \+indep(s2)).

evidence(all_consistent(graphic_designer_artist_historical)).
query(true_val(graphic_designer_artist_historical, past_artists_12)).
query(true_val(graphic_designer_artist_historical, unk_graphic_designer_artist_historical)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values snake_20yr_art=Snake_graphic_by_Toby_Grubb_with_20yr_art_parts unk_topsheet_appearance_description=Unknown
% @importance 0.6

0.88::acc(s6, topsheet_appearance_description).

0.85::true_val(topsheet_appearance_description, snake_20yr_art); 0.15::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s6, topsheet_appearance_description, snake_20yr_art).

all_consistent(topsheet_appearance_description) :-
    (indep(s6), consistent(s6, topsheet_appearance_description) ; \+indep(s6)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, snake_20yr_art)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values circa_2005_2006=Approximately_2005_2006 unk_model_first_available_year=Unknown
% @importance 0.625

0.88::acc(s6, model_first_available_year).
0.85::acc(s34, model_first_available_year).

0.92::true_val(model_first_available_year, circa_2005_2006); 0.08::true_val(model_first_available_year, unk_model_first_available_year).

measured(s6, model_first_available_year, circa_2005_2006).
measured(s34, model_first_available_year, circa_2005_2006).

all_consistent(model_first_available_year) :-
    (indep(s6), consistent(s6, model_first_available_year) ; \+indep(s6)),
    (indep(s34), consistent(s34, model_first_available_year) ; \+indep(s34)).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, circa_2005_2006)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values c2_introduction=First_year_C2_hybrid_contour unk_redesign_year=Unknown
% @importance 0.6

0.88::acc(s6, redesign_year).

0.85::true_val(redesign_year, c2_introduction); 0.15::true_val(redesign_year, unk_redesign_year).

measured(s6, redesign_year, c2_introduction).

all_consistent(redesign_year) :-
    (indep(s6), consistent(s6, redesign_year) ; \+indep(s6)).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, c2_introduction)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr redesign_year_recent
% @type categorical
% @canonical false
% @original_name redesign_year (recent evolution)
% @values subtle_upgrades_2026_balanced=Subtle_upgrades_20yrs_2026_more_balanced_than_2018 unk_redesign_year_recent=Unknown
% @importance 0.95

0.82::acc(s15, redesign_year_recent).

0.80::true_val(redesign_year_recent, subtle_upgrades_2026_balanced); 0.20::true_val(redesign_year_recent, unk_redesign_year_recent).

measured(s15, redesign_year_recent, subtle_upgrades_2026_balanced).

all_consistent(redesign_year_recent) :- consistent(s15, redesign_year_recent).

evidence(all_consistent(redesign_year_recent)).
query(true_val(redesign_year_recent, subtle_upgrades_2026_balanced)).
query(true_val(redesign_year_recent, unk_redesign_year_recent)).

% @attr camber_variant_exists
% @type categorical
% @canonical false
% @original_name T. Rice Pro Camber limited edition exists
% @values yes_camber_variant=Yes_limited_20th_anniversary_camber unk_camber_variant_exists=Unknown
% @importance 0.65

0.88::acc(s34, camber_variant_exists).

0.88::true_val(camber_variant_exists, yes_camber_variant); 0.12::true_val(camber_variant_exists, unk_camber_variant_exists).

measured(s34, camber_variant_exists, yes_camber_variant).

all_consistent(camber_variant_exists) :-
    (indep(s34), consistent(s34, camber_variant_exists) ; \+indep(s34)).

evidence(all_consistent(camber_variant_exists)).
query(true_val(camber_variant_exists, yes_camber_variant)).
query(true_val(camber_variant_exists, unk_camber_variant_exists)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values trice_pro_camber=T_Rice_Pro_Camber_traditional_camber_more_aggressive unk_comparable_board_same_brand=Unknown
% @importance 0.625

0.80::acc(s35, comparable_board_same_brand).
0.85::acc(s34, comparable_board_same_brand).

0.90::true_val(comparable_board_same_brand, trice_pro_camber); 0.10::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s35, comparable_board_same_brand, trice_pro_camber).
measured(s34, comparable_board_same_brand, trice_pro_camber).

all_consistent(comparable_board_same_brand) :-
    consistent(s35, comparable_board_same_brand),
    (indep(s34), consistent(s34, comparable_board_same_brand) ; \+indep(s34)).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, trice_pro_camber)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr camber_variant_separate
% @type categorical
% @canonical false
% @original_name T. Rice Pro Camber sold separately
% @values sold_separately=T_Rice_Pro_Camber_sold_separately unk_camber_variant_separate=Unknown
% @importance 0.65

0.88::acc(s34, camber_variant_separate).

0.88::true_val(camber_variant_separate, sold_separately); 0.12::true_val(camber_variant_separate, unk_camber_variant_separate).

measured(s34, camber_variant_separate, sold_separately).

all_consistent(camber_variant_separate) :-
    (indep(s34), consistent(s34, camber_variant_separate) ; \+indep(s34)).

evidence(all_consistent(camber_variant_separate)).
query(true_val(camber_variant_separate, sold_separately)).
query(true_val(camber_variant_separate, unk_camber_variant_separate)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_mountain_twin=Jones_Mountain_Twin_similar_twin_slightly_easier unk_comparable_board_cross_brand=Unknown
% @importance 0.725

0.55::acc(s36, comparable_board_cross_brand).
0.68::acc(s37, comparable_board_cross_brand).

0.80::true_val(comparable_board_cross_brand, jones_mountain_twin); 0.20::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s36, comparable_board_cross_brand, jones_mountain_twin).
measured(s37, comparable_board_cross_brand, jones_mountain_twin).

all_consistent(comparable_board_cross_brand) :-
    consistent(s36, comparable_board_cross_brand),
    consistent(s37, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_gnu
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (GNU Riders Choice)
% @values gnu_riders_choice=GNU_Riders_Choice_C2_less_aggressive_intermediate unk_comparable_board_cross_brand_gnu=Unknown
% @importance 0.75

0.68::acc(s33, comparable_board_cross_brand_gnu).

0.65::true_val(comparable_board_cross_brand_gnu, gnu_riders_choice); 0.35::true_val(comparable_board_cross_brand_gnu, unk_comparable_board_cross_brand_gnu).

measured(s33, comparable_board_cross_brand_gnu, gnu_riders_choice).

all_consistent(comparable_board_cross_brand_gnu) :- consistent(s33, comparable_board_cross_brand_gnu).

evidence(all_consistent(comparable_board_cross_brand_gnu)).
query(true_val(comparable_board_cross_brand_gnu, gnu_riders_choice)).
query(true_val(comparable_board_cross_brand_gnu, unk_comparable_board_cross_brand_gnu)).

% @attr comparable_board_cross_brand_burton
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Custom)
% @values burton_custom=Burton_Custom_679_95_30th_anniversary_camber unk_comparable_board_cross_brand_burton=Unknown
% @importance 0.75

0.65::acc(s37, comparable_board_cross_brand_burton).

0.62::true_val(comparable_board_cross_brand_burton, burton_custom); 0.38::true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton).

measured(s37, comparable_board_cross_brand_burton, burton_custom).

all_consistent(comparable_board_cross_brand_burton) :- consistent(s37, comparable_board_cross_brand_burton).

evidence(all_consistent(comparable_board_cross_brand_burton)).
query(true_val(comparable_board_cross_brand_burton, burton_custom)).
query(true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton)).

% @attr comparable_board_cross_brand_capita
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (CAPiTA DOA)
% @values capita_doa=CAPiTA_DOA_carbon_freestyle_carves_well unk_comparable_board_cross_brand_capita=Unknown
% @importance 0.75

0.65::acc(s37, comparable_board_cross_brand_capita).

0.62::true_val(comparable_board_cross_brand_capita, capita_doa); 0.38::true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita).

measured(s37, comparable_board_cross_brand_capita, capita_doa).

all_consistent(comparable_board_cross_brand_capita) :- consistent(s37, comparable_board_cross_brand_capita).

evidence(all_consistent(comparable_board_cross_brand_capita)).
query(true_val(comparable_board_cross_brand_capita, capita_doa)).
query(true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita)).

% @attr comparable_board_cross_brand_jones_dir
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones directional)
% @values jones_directional=Jones_directional_all_mountain_629_679 unk_comparable_board_cross_brand_jones_dir=Unknown
% @importance 0.75

0.65::acc(s37, comparable_board_cross_brand_jones_dir).

0.62::true_val(comparable_board_cross_brand_jones_dir, jones_directional); 0.38::true_val(comparable_board_cross_brand_jones_dir, unk_comparable_board_cross_brand_jones_dir).

measured(s37, comparable_board_cross_brand_jones_dir, jones_directional).

all_consistent(comparable_board_cross_brand_jones_dir) :- consistent(s37, comparable_board_cross_brand_jones_dir).

evidence(all_consistent(comparable_board_cross_brand_jones_dir)).
query(true_val(comparable_board_cross_brand_jones_dir, jones_directional)).
query(true_val(comparable_board_cross_brand_jones_dir, unk_comparable_board_cross_brand_jones_dir)).

% @attr comparable_board_cross_brand_ns
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Never Summer Proto Type 3)
% @values ns_proto_type_3=Never_Summer_Proto_Type_3_Ultra_699_99_triple_camber unk_comparable_board_cross_brand_ns=Unknown
% @importance 0.75

0.65::acc(s37, comparable_board_cross_brand_ns).

0.62::true_val(comparable_board_cross_brand_ns, ns_proto_type_3); 0.38::true_val(comparable_board_cross_brand_ns, unk_comparable_board_cross_brand_ns).

measured(s37, comparable_board_cross_brand_ns, ns_proto_type_3).

all_consistent(comparable_board_cross_brand_ns) :- consistent(s37, comparable_board_cross_brand_ns).

evidence(all_consistent(comparable_board_cross_brand_ns)).
query(true_val(comparable_board_cross_brand_ns, ns_proto_type_3)).
query(true_val(comparable_board_cross_brand_ns, unk_comparable_board_cross_brand_ns)).

% @attr comparable_board_same_brand_orca
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (T. Rice Orca)
% @values trice_orca=T_Rice_Orca_699_99_directional_freeride_volume_shifted unk_comparable_board_same_brand_orca=Unknown
% @importance 0.78

0.90::acc(s1, comparable_board_same_brand_orca).
0.65::acc(s37, comparable_board_same_brand_orca).
0.85::acc(s6, comparable_board_same_brand_orca).

0.90::true_val(comparable_board_same_brand_orca, trice_orca); 0.10::true_val(comparable_board_same_brand_orca, unk_comparable_board_same_brand_orca).

measured(s1, comparable_board_same_brand_orca, trice_orca).
measured(s37, comparable_board_same_brand_orca, trice_orca).
measured(s6, comparable_board_same_brand_orca, trice_orca).

all_consistent(comparable_board_same_brand_orca) :-
    consistent(s1, comparable_board_same_brand_orca),
    consistent(s37, comparable_board_same_brand_orca),
    (indep(s6), consistent(s6, comparable_board_same_brand_orca) ; \+indep(s6)).

evidence(all_consistent(comparable_board_same_brand_orca)).
query(true_val(comparable_board_same_brand_orca, trice_orca)).
query(true_val(comparable_board_same_brand_orca, unk_comparable_board_same_brand_orca)).

% @attr comparable_board_same_brand_orca_hp
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (T. Rice Orca HP C2)
% @values trice_orca_hp=T_Rice_Orca_HP_C2_849_99_blends_orca_and_pro unk_comparable_board_same_brand_orca_hp=Unknown
% @importance 1.0

0.90::acc(s1, comparable_board_same_brand_orca_hp).

0.90::true_val(comparable_board_same_brand_orca_hp, trice_orca_hp); 0.10::true_val(comparable_board_same_brand_orca_hp, unk_comparable_board_same_brand_orca_hp).

measured(s1, comparable_board_same_brand_orca_hp, trice_orca_hp).

all_consistent(comparable_board_same_brand_orca_hp) :- consistent(s1, comparable_board_same_brand_orca_hp).

evidence(all_consistent(comparable_board_same_brand_orca_hp)).
query(true_val(comparable_board_same_brand_orca_hp, trice_orca_hp)).
query(true_val(comparable_board_same_brand_orca_hp, unk_comparable_board_same_brand_orca_hp)).

% @attr avg_price_comparison
% @type numeric
% @unit USD
% @canonical false
% @original_name Average price of all-mountain-freestyle boards tested
% @values v608=608.0 unk_avg_price_comparison=Unknown
% @importance 0.95

0.82::acc(s15, avg_price_comparison).

0.82::true_val(avg_price_comparison, v608); 0.18::true_val(avg_price_comparison, unk_avg_price_comparison).

measured(s15, avg_price_comparison, v608).

all_consistent(avg_price_comparison) :- consistent(s15, avg_price_comparison).

evidence(all_consistent(avg_price_comparison)).
query(true_val(avg_price_comparison, v608)).
query(true_val(avg_price_comparison, unk_avg_price_comparison)).

% @attr sustainability_certification_energy
% @type categorical
% @canonical false
% @original_name sustainability_certification (energy)
% @values pct89_wind_water=89_percent_wind_or_water_power unk_sustainability_certification_energy=Unknown
% @importance 0.5

0.78::acc(s11, sustainability_certification_energy).

0.75::true_val(sustainability_certification_energy, pct89_wind_water); 0.25::true_val(sustainability_certification_energy, unk_sustainability_certification_energy).

measured(s11, sustainability_certification_energy, pct89_wind_water).

all_consistent(sustainability_certification_energy) :- consistent(s11, sustainability_certification_energy).

evidence(all_consistent(sustainability_certification_energy)).
query(true_val(sustainability_certification_energy, pct89_wind_water)).
query(true_val(sustainability_certification_energy, unk_sustainability_certification_energy)).

% @attr sustainability_certification_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycling)
% @values scrap_recycled=All_scrap_wood_sawdust_base_material_recycled unk_sustainability_certification_recycling=Unknown
% @importance 0.85

0.80::acc(s13, sustainability_certification_recycling).

0.78::true_val(sustainability_certification_recycling, scrap_recycled); 0.22::true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling).

measured(s13, sustainability_certification_recycling, scrap_recycled).

all_consistent(sustainability_certification_recycling) :-
    (indep(s13), consistent(s13, sustainability_certification_recycling) ; \+indep(s13)).

evidence(all_consistent(sustainability_certification_recycling)).
query(true_val(sustainability_certification_recycling, scrap_recycled)).
query(true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling)).

% @attr retailer_info_evo
% @type categorical
% @canonical false
% @original_name Evo.com retailer info
% @values major_specialty=Major_specialty_retailer_5pct_price_match_1yr_return unk_retailer_info_evo=Unknown
% @importance 0.9

0.82::acc(s2, retailer_info_evo).

0.80::true_val(retailer_info_evo, major_specialty); 0.20::true_val(retailer_info_evo, unk_retailer_info_evo).

measured(s2, retailer_info_evo, major_specialty).

all_consistent(retailer_info_evo) :-
    (indep(s2), consistent(s2, retailer_info_evo) ; \+indep(s2)).

evidence(all_consistent(retailer_info_evo)).
query(true_val(retailer_info_evo, major_specialty)).
query(true_val(retailer_info_evo, unk_retailer_info_evo)).

% @attr retailer_info_tactics
% @type categorical
% @canonical false
% @original_name Tactics retailer info
% @values specialty_boardshop=Specialty_boardshop_low_price_guarantee_free_shipping unk_retailer_info_tactics=Unknown
% @importance 0.85

0.78::acc(s13, retailer_info_tactics).

0.75::true_val(retailer_info_tactics, specialty_boardshop); 0.25::true_val(retailer_info_tactics, unk_retailer_info_tactics).

measured(s13, retailer_info_tactics, specialty_boardshop).

all_consistent(retailer_info_tactics) :-
    (indep(s13), consistent(s13, retailer_info_tactics) ; \+indep(s13)).

evidence(all_consistent(retailer_info_tactics)).
query(true_val(retailer_info_tactics, specialty_boardshop)).
query(true_val(retailer_info_tactics, unk_retailer_info_tactics)).

% @attr retailer_info_rei
% @type categorical
% @canonical false
% @original_name REI retailer info
% @values major_outdoor_coop=Major_outdoor_coop_member_rewards unk_retailer_info_rei=Unknown
% @importance 0.7

0.80::acc(s5, retailer_info_rei).

0.78::true_val(retailer_info_rei, major_outdoor_coop); 0.22::true_val(retailer_info_rei, unk_retailer_info_rei).

measured(s5, retailer_info_rei, major_outdoor_coop).

all_consistent(retailer_info_rei) :-
    (indep(s5), consistent(s5, retailer_info_rei) ; \+indep(s5)).

evidence(all_consistent(retailer_info_rei)).
query(true_val(retailer_info_rei, major_outdoor_coop)).
query(true_val(retailer_info_rei, unk_retailer_info_rei)).

% @attr retailer_info_dicks
% @type categorical
% @canonical false
% @original_name Dick's Sporting Goods retailer info
% @values large_chain=Large_sporting_goods_chain_best_price_guarantee unk_retailer_info_dicks=Unknown
% @importance 0.7

0.75::acc(s23, retailer_info_dicks).

0.72::true_val(retailer_info_dicks, large_chain); 0.28::true_val(retailer_info_dicks, unk_retailer_info_dicks).

measured(s23, retailer_info_dicks, large_chain).

all_consistent(retailer_info_dicks) :-
    (indep(s23), consistent(s23, retailer_info_dicks) ; \+indep(s23)).

evidence(all_consistent(retailer_info_dicks)).
query(true_val(retailer_info_dicks, large_chain)).
query(true_val(retailer_info_dicks, unk_retailer_info_dicks)).

% @attr retailer_info_salty_peaks
% @type categorical
% @canonical false
% @original_name Salty Peaks retailer info
% @values specialist_shop=Specialist_snowboard_shop_10day_price_match unk_retailer_info_salty_peaks=Unknown
% @importance 0.65

0.72::acc(s24, retailer_info_salty_peaks).

0.70::true_val(retailer_info_salty_peaks, specialist_shop); 0.30::true_val(retailer_info_salty_peaks, unk_retailer_info_salty_peaks).

measured(s24, retailer_info_salty_peaks, specialist_shop).

all_consistent(retailer_info_salty_peaks) :-
    (indep(s24), consistent(s24, retailer_info_salty_peaks) ; \+indep(s24)).

evidence(all_consistent(retailer_info_salty_peaks)).
query(true_val(retailer_info_salty_peaks, specialist_shop)).
query(true_val(retailer_info_salty_peaks, unk_retailer_info_salty_peaks)).

% @attr comparable_board_same_brand_gold_member
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Gold Member)
% @values gold_member=T_Rice_Gold_Member_premium_carbon_1299_99 unk_comparable_board_same_brand_gold_member=Unknown
% @importance 1.0

0.90::acc(s1, comparable_board_same_brand_gold_member).

0.90::true_val(comparable_board_same_brand_gold_member, gold_member); 0.10::true_val(comparable_board_same_brand_gold_member, unk_comparable_board_same_brand_gold_member).

measured(s1, comparable_board_same_brand_gold_member, gold_member).

all_consistent(comparable_board_same_brand_gold_member) :- consistent(s1, comparable_board_same_brand_gold_member).

evidence(all_consistent(comparable_board_same_brand_gold_member)).
query(true_val(comparable_board_same_brand_gold_member, gold_member)).
query(true_val(comparable_board_same_brand_gold_member, unk_comparable_board_same_brand_gold_member)).