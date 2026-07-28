0.15::indep(s2).
0.20::indep(s6).
0.25::indep(s3).
0.15::indep(s7).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.90::acc(s1, brand).
0.88::acc(s6, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values rossignol=Rossignol unk_brand=Unknown
% @importance 0.975

0.95::true_val(brand, rossignol); 0.05::true_val(brand, unk_brand).

measured(s1, brand, rossignol).
measured(s6, brand, rossignol).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s6), consistent(s6, brand) ; \+indep(s6)).

evidence(all_consistent(brand)).
query(true_val(brand, rossignol)).
query(true_val(brand, unk_brand)).

0.90::acc(s1, model_name).
0.88::acc(s6, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values district=District unk_model_name=Unknown
% @importance 0.975

0.95::true_val(model_name, district); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, district).
measured(s6, model_name, district).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s6), consistent(s6, model_name) ; \+indep(s6)).

evidence(all_consistent(model_name)).
query(true_val(model_name, district)).
query(true_val(model_name, unk_model_name)).

0.90::acc(s1, model_year).
0.88::acc(s6, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2020=2020 unk_model_year=Unknown
% @importance 0.975

0.95::true_val(model_year, y2020); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2020).
measured(s6, model_year, y2020).

all_consistent(model_year) :-
    consistent(s1, model_year),
    (indep(s6), consistent(s6, model_year) ; \+indep(s6)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2020)).
query(true_val(model_year, unk_model_year)).

0.90::acc(s1, product_type).
0.88::acc(s6, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.975

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s6, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type),
    (indep(s6), consistent(s6, product_type) ; \+indep(s6)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.88::acc(s8, board_category).
0.75::acc(s6, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle=Freestyle all_mountain=All_Mountain
% @importance 0.975

0.55::true_val(board_category, freestyle); 0.45::true_val(board_category, all_mountain).

measured(s8, board_category, freestyle).
measured(s6, board_category, all_mountain).

all_consistent(board_category) :-
    consistent(s8, board_category),
    consistent(s6, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle)).
query(true_val(board_category, all_mountain)).

0.88::acc(s3, gender).
0.93::acc(s8, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.975

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).

measured(s3, gender, mens).
measured(s8, gender, mens).

all_consistent(gender) :-
    consistent(s8, gender),
    (indep(s3), consistent(s3, gender) ; \+indep(s3)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.78::acc(s11, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values rossignol_sa=Rossignol_Skis_Rossignol_SA unk_manufacturer=Unknown
% @importance 0.4

0.85::true_val(manufacturer, rossignol_sa); 0.15::true_val(manufacturer, unk_manufacturer).

measured(s11, manufacturer, rossignol_sa).

all_consistent(manufacturer) :-
    consistent(s11, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, rossignol_sa)).
query(true_val(manufacturer, unk_manufacturer)).

0.93::acc(s12, manufacturer_founded).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y1907=1907 unk_manufacturer_founded=Unknown
% @importance 0.4

0.93::true_val(manufacturer_founded, y1907); 0.07::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s12, manufacturer_founded, y1907).

all_consistent(manufacturer_founded) :-
    consistent(s12, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y1907)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

0.80::acc(s13, manufacturer_headquarters).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values saint_jean_de_moirans=Saint_Jean_De_Moirans_Isere_France unk_manufacturer_headquarters=Unknown
% @importance 0.25

0.82::true_val(manufacturer_headquarters, saint_jean_de_moirans); 0.18::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s13, manufacturer_headquarters, saint_jean_de_moirans).

all_consistent(manufacturer_headquarters) :-
    consistent(s13, manufacturer_headquarters).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, saint_jean_de_moirans)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

0.88::acc(s14, manufacturer_first_snowboards).

% @attr manufacturer_first_snowboards
% @type categorical
% @canonical false
% @original_name Manufacturer first snowboards
% @values y1987=1987 unk_manufacturer_first_snowboards=Unknown
% @importance 0.3

0.88::true_val(manufacturer_first_snowboards, y1987); 0.12::true_val(manufacturer_first_snowboards, unk_manufacturer_first_snowboards).

measured(s14, manufacturer_first_snowboards, y1987).

all_consistent(manufacturer_first_snowboards) :-
    consistent(s14, manufacturer_first_snowboards).

evidence(all_consistent(manufacturer_first_snowboards)).
query(true_val(manufacturer_first_snowboards, y1987)).
query(true_val(manufacturer_first_snowboards, unk_manufacturer_first_snowboards)).

0.75::acc(s15, manufacturer_company_type).

% @attr manufacturer_company_type
% @type categorical
% @canonical false
% @original_name Manufacturer company type
% @values private_altor_boixvives=Private_Altor_Equity_BoixVives unk_manufacturer_company_type=Unknown
% @importance 0.2

0.78::true_val(manufacturer_company_type, private_altor_boixvives); 0.22::true_val(manufacturer_company_type, unk_manufacturer_company_type).

measured(s15, manufacturer_company_type, private_altor_boixvives).

all_consistent(manufacturer_company_type) :-
    consistent(s15, manufacturer_company_type).

evidence(all_consistent(manufacturer_company_type)).
query(true_val(manufacturer_company_type, private_altor_boixvives)).
query(true_val(manufacturer_company_type, unk_manufacturer_company_type)).

0.78::acc(s13, manufacturer_total_employees).

% @attr manufacturer_total_employees
% @type numeric
% @canonical false
% @original_name Manufacturer total employees
% @values v1300=1300
% @importance 0.25

0.80::true_val(manufacturer_total_employees, v1300); 0.20::true_val(manufacturer_total_employees, unk_manufacturer_total_employees).

measured(s13, manufacturer_total_employees, v1300).

all_consistent(manufacturer_total_employees) :-
    consistent(s13, manufacturer_total_employees).

evidence(all_consistent(manufacturer_total_employees)).
query(true_val(manufacturer_total_employees, v1300)).
query(true_val(manufacturer_total_employees, unk_manufacturer_total_employees)).

0.60::acc(s16, manufacturer_brand_name_meaning).

% @attr manufacturer_brand_name_meaning
% @type categorical
% @canonical false
% @original_name Manufacturer brand name meaning
% @values nightingale=Nightingale_French_for_surname unk_manufacturer_brand_name_meaning=Unknown
% @importance 0.1

0.55::true_val(manufacturer_brand_name_meaning, nightingale); 0.45::true_val(manufacturer_brand_name_meaning, unk_manufacturer_brand_name_meaning).

measured(s16, manufacturer_brand_name_meaning, nightingale).

all_consistent(manufacturer_brand_name_meaning) :-
    consistent(s16, manufacturer_brand_name_meaning).

evidence(all_consistent(manufacturer_brand_name_meaning)).
query(true_val(manufacturer_brand_name_meaning, nightingale)).
query(true_val(manufacturer_brand_name_meaning, unk_manufacturer_brand_name_meaning)).

0.70::acc(s17, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2011_2012=2011_2012_season unk_model_first_available_year=Unknown
% @importance 0.5

0.68::true_val(model_first_available_year, y2011_2012); 0.32::true_val(model_first_available_year, unk_model_first_available_year).

measured(s17, model_first_available_year, y2011_2012).

all_consistent(model_first_available_year) :-
    consistent(s17, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2011_2012)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.93::acc(s8, current_model_sku_regular).

% @attr current_model_sku_regular
% @type categorical
% @canonical false
% @original_name Current model SKU (Color regular)
% @values remx101000=REMX101000 unk_current_model_sku_regular=Unknown
% @importance 1.0

0.93::true_val(current_model_sku_regular, remx101000); 0.07::true_val(current_model_sku_regular, unk_current_model_sku_regular).

measured(s8, current_model_sku_regular, remx101000).

all_consistent(current_model_sku_regular) :-
    consistent(s8, current_model_sku_regular).

evidence(all_consistent(current_model_sku_regular)).
query(true_val(current_model_sku_regular, remx101000)).
query(true_val(current_model_sku_regular, unk_current_model_sku_regular)).

0.90::acc(s9, current_model_sku_wide).

% @attr current_model_sku_wide
% @type categorical
% @canonical false
% @original_name Current model SKU (Color wide)
% @values remx102000=REMX102000 unk_current_model_sku_wide=Unknown
% @importance 0.6

0.88::true_val(current_model_sku_wide, remx102000); 0.12::true_val(current_model_sku_wide, unk_current_model_sku_wide).

measured(s9, current_model_sku_wide, remx102000).

all_consistent(current_model_sku_wide) :-
    consistent(s9, current_model_sku_wide).

evidence(all_consistent(current_model_sku_wide)).
query(true_val(current_model_sku_wide, remx102000)).
query(true_val(current_model_sku_wide, unk_current_model_sku_wide)).

0.90::acc(s8, flex_rating_10_manufacturer).
0.85::acc(s3, flex_rating_10_manufacturer).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v3=3.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.975

0.93::true_val(flex_rating_10_manufacturer, v3); 0.07::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s8, flex_rating_10_manufacturer, v3).
measured(s3, flex_rating_10_manufacturer, v3).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s8, flex_rating_10_manufacturer),
    (indep(s3), consistent(s3, flex_rating_10_manufacturer) ; \+indep(s3)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v3)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

0.85::acc(s1, flex_rating_10_evo).

% @attr flex_rating_10_evo
% @type numeric
% @canonical false
% @original_name flex_rating_10_evo
% @unit /10
% @values v5=5.0 unk_flex_rating_10_evo=Unknown
% @importance 1.0

0.85::true_val(flex_rating_10_evo, v5); 0.15::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s1, flex_rating_10_evo, v5).

all_consistent(flex_rating_10_evo) :-
    consistent(s1, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, v5)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

0.82::acc(s6, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v5=5.0 unk_flex_rating_10=Unknown
% @importance 0.95

0.83::true_val(flex_rating_10, v5); 0.17::true_val(flex_rating_10, unk_flex_rating_10).

measured(s6, flex_rating_10, v5).

all_consistent(flex_rating_10) :-
    consistent(s6, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.90::acc(s8, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values twin_freestyle=Twin_Freestyle_stiffer_underfoot_softer_waist unk_flex_feel=Unknown
% @importance 1.0

0.90::true_val(flex_feel, twin_freestyle); 0.10::true_val(flex_feel, unk_flex_feel).

measured(s8, flex_feel, twin_freestyle).

all_consistent(flex_feel) :-
    consistent(s8, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, twin_freestyle)).
query(true_val(flex_feel, unk_flex_feel)).

0.80::acc(s6, flex_feel_overall).

% @attr flex_feel_overall
% @type categorical
% @canonical false
% @original_name flex_feel
% @values medium_soft=Medium_soft_beginner_to_intermediate unk_flex_feel_overall=Unknown
% @importance 0.95

0.80::true_val(flex_feel_overall, medium_soft); 0.20::true_val(flex_feel_overall, unk_flex_feel_overall).

measured(s6, flex_feel_overall, medium_soft).

all_consistent(flex_feel_overall) :-
    consistent(s6, flex_feel_overall).

evidence(all_consistent(flex_feel_overall)).
query(true_val(flex_feel_overall, medium_soft)).
query(true_val(flex_feel_overall, unk_flex_feel_overall)).

0.88::acc(s1, shape).
0.82::acc(s6, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.975

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).

measured(s1, shape, true_twin).
measured(s6, shape, true_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s6), consistent(s6, shape) ; \+indep(s6)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

0.87::acc(s1, camber_type).
0.82::acc(s6, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values amptek_auto_turn_rocker=AmpTek_Auto_Turn_Rocker_Camber_Rocker unk_camber_type=Unknown
% @importance 0.975

0.95::true_val(camber_type, amptek_auto_turn_rocker); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, amptek_auto_turn_rocker).
measured(s6, camber_type, amptek_auto_turn_rocker).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s6), consistent(s6, camber_type) ; \+indep(s6)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, amptek_auto_turn_rocker)).
query(true_val(camber_type, unk_camber_type)).

0.85::acc(s1, camber_description).
0.90::acc(s8, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values blend_80_20=80_20_rocker_camber blend_70_30=70_30_rocker_camber
% @importance 1.0

0.45::true_val(camber_description, blend_80_20); 0.55::true_val(camber_description, blend_70_30).

measured(s1, camber_description, blend_80_20).
measured(s8, camber_description, blend_70_30).

all_consistent(camber_description) :-
    consistent(s1, camber_description),
    consistent(s8, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, blend_80_20)).
query(true_val(camber_description, blend_70_30)).

0.87::acc(s1, core_material).
0.82::acc(s3, core_material).
0.50::acc(s2, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values wood_5620=Wood_5620 wood_6420=Wood_6420
% @importance 0.93

0.70::true_val(core_material, wood_5620); 0.30::true_val(core_material, wood_6420).

measured(s1, core_material, wood_5620).
measured(s3, core_material, wood_5620).
measured(s2, core_material, wood_6420).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s3), consistent(s3, core_material) ; \+indep(s3)),
    (indep(s2), consistent(s2, core_material) ; \+indep(s2)).

evidence(all_consistent(core_material)).
query(true_val(core_material, wood_5620)).
query(true_val(core_material, wood_6420)).

0.85::acc(s1, core_material_construction).

% @attr core_material_construction
% @type categorical
% @canonical false
% @original_name core_material
% @values single_species_vertical=Single_species_wood_vertically_laminated unk_core_material_construction=Unknown
% @importance 1.0

0.85::true_val(core_material_construction, single_species_vertical); 0.15::true_val(core_material_construction, unk_core_material_construction).

measured(s1, core_material_construction, single_species_vertical).

all_consistent(core_material_construction) :-
    consistent(s1, core_material_construction).

evidence(all_consistent(core_material_construction)).
query(true_val(core_material_construction, single_species_vertical)).
query(true_val(core_material_construction, unk_core_material_construction)).

0.85::acc(s1, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified_wood_core unk_sustainability_certification=Unknown
% @importance 1.0

0.85::true_val(sustainability_certification, fsc_certified); 0.15::true_val(sustainability_certification, unk_sustainability_certification).

measured(s1, sustainability_certification, fsc_certified).

all_consistent(sustainability_certification) :-
    consistent(s1, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.85::acc(s1, sustainability_certification_forests).

% @attr sustainability_certification_forests
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values sustainably_harvested=100pct_sustainably_harvested_forests unk_sustainability_certification_forests=Unknown
% @importance 1.0

0.85::true_val(sustainability_certification_forests, sustainably_harvested); 0.15::true_val(sustainability_certification_forests, unk_sustainability_certification_forests).

measured(s1, sustainability_certification_forests, sustainably_harvested).

all_consistent(sustainability_certification_forests) :-
    consistent(s1, sustainability_certification_forests).

evidence(all_consistent(sustainability_certification_forests)).
query(true_val(sustainability_certification_forests, sustainably_harvested)).
query(true_val(sustainability_certification_forests, unk_sustainability_certification_forests)).

0.85::acc(s1, laminate).
0.90::acc(s8, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values glass_fiber=Glass_Fiber unk_laminate=Unknown
% @importance 1.0

0.95::true_val(laminate, glass_fiber); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, glass_fiber).
measured(s8, laminate, glass_fiber).

all_consistent(laminate) :-
    consistent(s1, laminate),
    consistent(s8, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, glass_fiber)).
query(true_val(laminate, unk_laminate)).

0.50::acc(s0, laminate_weave).

% @attr laminate_weave
% @type categorical
% @canonical false
% @original_name laminate
% @values biaxial_glass=Biaxial_glass_fiber unk_laminate_weave=Unknown
% @importance 0.5

0.50::true_val(laminate_weave, biaxial_glass); 0.50::true_val(laminate_weave, unk_laminate_weave).

measured(s0, laminate_weave, biaxial_glass).

all_consistent(laminate_weave) :-
    consistent(s0, laminate_weave).

evidence(all_consistent(laminate_weave)).
query(true_val(laminate_weave, biaxial_glass)).
query(true_val(laminate_weave, unk_laminate_weave)).

0.87::acc(s1, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs=ABS unk_sidewall_material=Unknown
% @importance 1.0

0.90::true_val(sidewall_material, abs); 0.10::true_val(sidewall_material, unk_sidewall_material).

measured(s1, sidewall_material, abs).

all_consistent(sidewall_material) :-
    consistent(s1, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.87::acc(s1, base_material).
0.82::acc(s3, base_material).
0.48::acc(s2, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values extruded_4400=4400_Extruded extruded_4800=Extruded_4800
% @importance 0.93

0.72::true_val(base_material, extruded_4400); 0.28::true_val(base_material, extruded_4800).

measured(s1, base_material, extruded_4400).
measured(s3, base_material, extruded_4400).
measured(s2, base_material, extruded_4800).

all_consistent(base_material) :-
    consistent(s1, base_material),
    (indep(s3), consistent(s3, base_material) ; \+indep(s3)),
    (indep(s2), consistent(s2, base_material) ; \+indep(s2)).

evidence(all_consistent(base_material)).
query(true_val(base_material, extruded_4400)).
query(true_val(base_material, extruded_4800)).

0.82::acc(s6, base_type).
0.85::acc(s1, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values low_maintenance_extruded=Low_maintenance_extruded_base unk_base_type=Unknown
% @importance 0.975

0.95::true_val(base_type, low_maintenance_extruded); 0.05::true_val(base_type, unk_base_type).

measured(s6, base_type, low_maintenance_extruded).
measured(s1, base_type, low_maintenance_extruded).

all_consistent(base_type) :-
    consistent(s1, base_type),
    (indep(s6), consistent(s6, base_type) ; \+indep(s6)).

evidence(all_consistent(base_type)).
query(true_val(base_type, low_maintenance_extruded)).
query(true_val(base_type, unk_base_type)).

0.85::acc(s1, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values insert_4x4=4x4_insert_pattern unk_mounting_pattern=Unknown
% @importance 1.0

0.88::true_val(mounting_pattern, insert_4x4); 0.12::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, insert_4x4).

all_consistent(mounting_pattern) :-
    consistent(s1, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, insert_4x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.85::acc(s3, setback).
0.90::acc(s8, setback).
0.80::acc(s6, setback).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v0=0.0 unk_setback=Unknown
% @importance 0.97

0.97::true_val(setback, v0); 0.03::true_val(setback, unk_setback).

measured(s3, setback, v0).
measured(s8, setback, v0).
measured(s6, setback, v0).

all_consistent(setback) :-
    consistent(s8, setback),
    (indep(s3), consistent(s3, setback) ; \+indep(s3)),
    (indep(s6), consistent(s6, setback) ; \+indep(s6)).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

0.55::acc(s2, sidecut_type).
0.82::acc(s3, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values deep_progressive=Deep_progressive unk_sidecut_type=Unknown
% @importance 0.875

0.90::true_val(sidecut_type, deep_progressive); 0.10::true_val(sidecut_type, unk_sidecut_type).

measured(s2, sidecut_type, deep_progressive).
measured(s3, sidecut_type, deep_progressive).

all_consistent(sidecut_type) :-
    (indep(s2), consistent(s2, sidecut_type) ; \+indep(s2)),
    (indep(s3), consistent(s3, sidecut_type) ; \+indep(s3)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, deep_progressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.55::acc(s2, sidecut_radius_range).
0.90::acc(s8, sidecut_radius_range).

% @attr sidecut_radius_range
% @type categorical
% @canonical false
% @original_name Sidecut radius range
% @values r6_6_to_7_9=6.6m_to_7.9m unk_sidecut_radius_range=Unknown
% @importance 0.9

0.90::true_val(sidecut_radius_range, r6_6_to_7_9); 0.10::true_val(sidecut_radius_range, unk_sidecut_radius_range).

measured(s2, sidecut_radius_range, r6_6_to_7_9).
measured(s8, sidecut_radius_range, r6_6_to_7_9).

all_consistent(sidecut_radius_range) :-
    consistent(s8, sidecut_radius_range),
    (indep(s2), consistent(s2, sidecut_radius_range) ; \+indep(s2)).

evidence(all_consistent(sidecut_radius_range)).
query(true_val(sidecut_radius_range, r6_6_to_7_9)).
query(true_val(sidecut_radius_range, unk_sidecut_radius_range)).

0.82::acc(s6, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_146_151_155_156w_159_161w=146_151_155_156W_159_161W unk_available_sizes=Unknown
% @importance 0.95

0.82::true_val(available_sizes, sizes_146_151_155_156w_159_161w); 0.18::true_val(available_sizes, unk_available_sizes).

measured(s6, available_sizes, sizes_146_151_155_156w_159_161w).

all_consistent(available_sizes) :-
    consistent(s6, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_146_151_155_156w_159_161w)).
query(true_val(available_sizes, unk_available_sizes)).

0.80::acc(s6, waist_width_146).

% @attr waist_width_146
% @type numeric
% @canonical false
% @original_name Waist width 146
% @unit mm
% @values v246=246.0 unk_waist_width_146=Unknown
% @importance 0.95

0.80::true_val(waist_width_146, v246); 0.20::true_val(waist_width_146, unk_waist_width_146).

measured(s6, waist_width_146, v246).

all_consistent(waist_width_146) :-
    consistent(s6, waist_width_146).

evidence(all_consistent(waist_width_146)).
query(true_val(waist_width_146, v246)).
query(true_val(waist_width_146, unk_waist_width_146)).

0.80::acc(s6, waist_width_151).

% @attr waist_width_151
% @type numeric
% @canonical false
% @original_name Waist width 151
% @unit mm
% @values v248=248.0 unk_waist_width_151=Unknown
% @importance 0.95

0.80::true_val(waist_width_151, v248); 0.20::true_val(waist_width_151, unk_waist_width_151).

measured(s6, waist_width_151, v248).

all_consistent(waist_width_151) :-
    consistent(s6, waist_width_151).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v248)).
query(true_val(waist_width_151, unk_waist_width_151)).

0.80::acc(s6, waist_width_155).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name Waist width 155
% @unit mm
% @values v250=250.0 unk_waist_width_155=Unknown
% @importance 0.95

0.80::true_val(waist_width_155, v250); 0.20::true_val(waist_width_155, unk_waist_width_155).

measured(s6, waist_width_155, v250).

all_consistent(waist_width_155) :-
    consistent(s6, waist_width_155).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v250)).
query(true_val(waist_width_155, unk_waist_width_155)).

0.80::acc(s6, waist_width_156w).

% @attr waist_width_156w
% @type numeric
% @canonical false
% @original_name Waist width 156 Wide
% @unit mm
% @values v262=262.0 unk_waist_width_156w=Unknown
% @importance 0.95

0.80::true_val(waist_width_156w, v262); 0.20::true_val(waist_width_156w, unk_waist_width_156w).

measured(s6, waist_width_156w, v262).

all_consistent(waist_width_156w) :-
    consistent(s6, waist_width_156w).

evidence(all_consistent(waist_width_156w)).
query(true_val(waist_width_156w, v262)).
query(true_val(waist_width_156w, unk_waist_width_156w)).

0.80::acc(s6, waist_width_159).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name Waist width 159
% @unit mm
% @values v252=252.0 unk_waist_width_159=Unknown
% @importance 0.95

0.80::true_val(waist_width_159, v252); 0.20::true_val(waist_width_159, unk_waist_width_159).

measured(s6, waist_width_159, v252).

all_consistent(waist_width_159) :-
    consistent(s6, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v252)).
query(true_val(waist_width_159, unk_waist_width_159)).

0.80::acc(s6, waist_width_161w).

% @attr waist_width_161w
% @type numeric
% @canonical false
% @original_name Waist width 161 Wide
% @unit mm
% @values v264=264.0 unk_waist_width_161w=Unknown
% @importance 0.95

0.80::true_val(waist_width_161w, v264); 0.20::true_val(waist_width_161w, unk_waist_width_161w).

measured(s6, waist_width_161w, v264).

all_consistent(waist_width_161w) :-
    consistent(s6, waist_width_161w).

evidence(all_consistent(waist_width_161w)).
query(true_val(waist_width_161w, v264)).
query(true_val(waist_width_161w, unk_waist_width_161w)).

0.80::acc(s6, tip_tail_width_size_146).

% @attr tip_tail_width_size_146
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values d289_246_289=289_246_289mm unk_tip_tail_width_size_146=Unknown
% @importance 0.95

0.80::true_val(tip_tail_width_size_146, d289_246_289); 0.20::true_val(tip_tail_width_size_146, unk_tip_tail_width_size_146).

measured(s6, tip_tail_width_size_146, d289_246_289).

all_consistent(tip_tail_width_size_146) :-
    consistent(s6, tip_tail_width_size_146).

evidence(all_consistent(tip_tail_width_size_146)).
query(true_val(tip_tail_width_size_146, d289_246_289)).
query(true_val(tip_tail_width_size_146, unk_tip_tail_width_size_146)).

0.80::acc(s6, tip_tail_width_size_151).

% @attr tip_tail_width_size_151
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values d291_248_291=291_248_291mm unk_tip_tail_width_size_151=Unknown
% @importance 0.95

0.80::true_val(tip_tail_width_size_151, d291_248_291); 0.20::true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151).

measured(s6, tip_tail_width_size_151, d291_248_291).

all_consistent(tip_tail_width_size_151) :-
    consistent(s6, tip_tail_width_size_151).

evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, d291_248_291)).
query(true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151)).

0.80::acc(s6, tip_tail_width_size).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit mm
% @values d294_250_294=294_250_294mm unk_tip_tail_width_size=Unknown
% @importance 0.95

0.80::true_val(tip_tail_width_size, d294_250_294); 0.20::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s6, tip_tail_width_size, d294_250_294).

all_consistent(tip_tail_width_size) :-
    consistent(s6, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, d294_250_294)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.80::acc(s6, tip_tail_width_size_156w).

% @attr tip_tail_width_size_156w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values d306_262_306=306_262_306mm unk_tip_tail_width_size_156w=Unknown
% @importance 0.95

0.80::true_val(tip_tail_width_size_156w, d306_262_306); 0.20::true_val(tip_tail_width_size_156w, unk_tip_tail_width_size_156w).

measured(s6, tip_tail_width_size_156w, d306_262_306).

all_consistent(tip_tail_width_size_156w) :-
    consistent(s6, tip_tail_width_size_156w).

evidence(all_consistent(tip_tail_width_size_156w)).
query(true_val(tip_tail_width_size_156w, d306_262_306)).
query(true_val(tip_tail_width_size_156w, unk_tip_tail_width_size_156w)).

0.80::acc(s6, tip_tail_width_size_159).

% @attr tip_tail_width_size_159
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values d297_252_297=297_252_297mm unk_tip_tail_width_size_159=Unknown
% @importance 0.95

0.80::true_val(tip_tail_width_size_159, d297_252_297); 0.20::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s6, tip_tail_width_size_159, d297_252_297).

all_consistent(tip_tail_width_size_159) :-
    consistent(s6, tip_tail_width_size_159).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, d297_252_297)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

0.80::acc(s6, tip_tail_width_size_161w).

% @attr tip_tail_width_size_161w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values d309_264_309=309_264_309mm unk_tip_tail_width_size_161w=Unknown
% @importance 0.95

0.80::true_val(tip_tail_width_size_161w, d309_264_309); 0.20::true_val(tip_tail_width_size_161w, unk_tip_tail_width_size_161w).

measured(s6, tip_tail_width_size_161w, d309_264_309).

all_consistent(tip_tail_width_size_161w) :-
    consistent(s6, tip_tail_width_size_161w).

evidence(all_consistent(tip_tail_width_size_161w)).
query(true_val(tip_tail_width_size_161w, d309_264_309)).
query(true_val(tip_tail_width_size_161w, unk_tip_tail_width_size_161w)).

0.80::acc(s6, effective_edge_146).

% @attr effective_edge_146
% @type numeric
% @canonical false
% @original_name Effective edge 146
% @unit mm
% @values v1090=1090.0 unk_effective_edge_146=Unknown
% @importance 0.95

0.80::true_val(effective_edge_146, v1090); 0.20::true_val(effective_edge_146, unk_effective_edge_146).

measured(s6, effective_edge_146, v1090).

all_consistent(effective_edge_146) :-
    consistent(s6, effective_edge_146).

evidence(all_consistent(effective_edge_146)).
query(true_val(effective_edge_146, v1090)).
query(true_val(effective_edge_146, unk_effective_edge_146)).

0.80::acc(s6, effective_edge_151).

% @attr effective_edge_151
% @type numeric
% @canonical false
% @original_name Effective edge 151
% @unit mm
% @values v1130=1130.0 unk_effective_edge_151=Unknown
% @importance 0.95

0.80::true_val(effective_edge_151, v1130); 0.20::true_val(effective_edge_151, unk_effective_edge_151).

measured(s6, effective_edge_151, v1130).

all_consistent(effective_edge_151) :-
    consistent(s6, effective_edge_151).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v1130)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

0.80::acc(s6, effective_edge_155).

% @attr effective_edge_155
% @type numeric
% @canonical false
% @original_name Effective edge 155
% @unit mm
% @values v1170=1170.0 unk_effective_edge_155=Unknown
% @importance 0.95

0.80::true_val(effective_edge_155, v1170); 0.20::true_val(effective_edge_155, unk_effective_edge_155).

measured(s6, effective_edge_155, v1170).

all_consistent(effective_edge_155) :-
    consistent(s6, effective_edge_155).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v1170)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

0.80::acc(s6, effective_edge_156w).

% @attr effective_edge_156w
% @type numeric
% @canonical false
% @original_name Effective edge 156 Wide
% @unit mm
% @values v1090w=1090.0 unk_effective_edge_156w=Unknown
% @importance 0.95

0.80::true_val(effective_edge_156w, v1090w); 0.20::true_val(effective_edge_156w, unk_effective_edge_156w).

measured(s6, effective_edge_156w, v1090w).

all_consistent(effective_edge_156w) :-
    consistent(s6, effective_edge_156w).

evidence(all_consistent(effective_edge_156w)).
query(true_val(effective_edge_156w, v1090w)).
query(true_val(effective_edge_156w, unk_effective_edge_156w)).

0.80::acc(s6, effective_edge_159).

% @attr effective_edge_159
% @type numeric
% @canonical false
% @original_name Effective edge 159
% @unit mm
% @values v1210=1210.0 unk_effective_edge_159=Unknown
% @importance 0.95

0.80::true_val(effective_edge_159, v1210); 0.20::true_val(effective_edge_159, unk_effective_edge_159).

measured(s6, effective_edge_159, v1210).

all_consistent(effective_edge_159) :-
    consistent(s6, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1210)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

0.80::acc(s6, effective_edge_161w).

% @attr effective_edge_161w
% @type numeric
% @canonical false
% @original_name Effective edge 161 Wide
% @unit mm
% @values v1230=1230.0 unk_effective_edge_161w=Unknown
% @importance 0.95

0.80::true_val(effective_edge_161w, v1230); 0.20::true_val(effective_edge_161w, unk_effective_edge_161w).

measured(s6, effective_edge_161w, v1230).

all_consistent(effective_edge_161w) :-
    consistent(s6, effective_edge_161w).

evidence(all_consistent(effective_edge_161w)).
query(true_val(effective_edge_161w, v1230)).
query(true_val(effective_edge_161w, unk_effective_edge_161w)).

0.90::acc(s8, sidecut_radius_size_146).

% @attr sidecut_radius_size_146
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v6_6=6.6 unk_sidecut_radius_size_146=Unknown
% @importance 1.0

0.90::true_val(sidecut_radius_size_146, v6_6); 0.10::true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146).

measured(s8, sidecut_radius_size_146, v6_6).

all_consistent(sidecut_radius_size_146) :-
    consistent(s8, sidecut_radius_size_146).

evidence(all_consistent(sidecut_radius_size_146)).
query(true_val(sidecut_radius_size_146, v6_6)).
query(true_val(sidecut_radius_size_146, unk_sidecut_radius_size_146)).

0.90::acc(s8, sidecut_radius_size_151).

% @attr sidecut_radius_size_151
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_1=7.1 unk_sidecut_radius_size_151=Unknown
% @importance 1.0

0.90::true_val(sidecut_radius_size_151, v7_1); 0.10::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).

measured(s8, sidecut_radius_size_151, v7_1).

all_consistent(sidecut_radius_size_151) :-
    consistent(s8, sidecut_radius_size_151).

evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v7_1)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

0.90::acc(s8, sidecut_radius_size).
0.82::acc(s3, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_5=7.5 unk_sidecut_radius_size=Unknown
% @importance 0.975

0.95::true_val(sidecut_radius_size, v7_5); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s8, sidecut_radius_size, v7_5).
measured(s3, sidecut_radius_size, v7_5).

all_consistent(sidecut_radius_size) :-
    consistent(s8, sidecut_radius_size),
    (indep(s3), consistent(s3, sidecut_radius_size) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_5)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.90::acc(s8, sidecut_radius_size_159).
0.82::acc(s3, sidecut_radius_size_159).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_9=7.9 v7_8=7.8
% @importance 0.975

0.55::true_val(sidecut_radius_size_159, v7_9); 0.45::true_val(sidecut_radius_size_159, v7_8).

measured(s8, sidecut_radius_size_159, v7_9).
measured(s3, sidecut_radius_size_159, v7_8).

all_consistent(sidecut_radius_size_159) :-
    consistent(s8, sidecut_radius_size_159),
    (indep(s3), consistent(s3, sidecut_radius_size_159) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v7_9)).
query(true_val(sidecut_radius_size_159, v7_8)).

0.82::acc(s3, sidecut_radius_size_156w).

% @attr sidecut_radius_size_156w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_5w=7.5 unk_sidecut_radius_size_156w=Unknown
% @importance 0.95

0.82::true_val(sidecut_radius_size_156w, v7_5w); 0.18::true_val(sidecut_radius_size_156w, unk_sidecut_radius_size_156w).

measured(s3, sidecut_radius_size_156w, v7_5w).

all_consistent(sidecut_radius_size_156w) :-
    consistent(s3, sidecut_radius_size_156w).

evidence(all_consistent(sidecut_radius_size_156w)).
query(true_val(sidecut_radius_size_156w, v7_5w)).
query(true_val(sidecut_radius_size_156w, unk_sidecut_radius_size_156w)).

0.82::acc(s3, sidecut_radius_size_161w).

% @attr sidecut_radius_size_161w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_8w=7.8 unk_sidecut_radius_size_161w=Unknown
% @importance 0.95

0.82::true_val(sidecut_radius_size_161w, v7_8w); 0.18::true_val(sidecut_radius_size_161w, unk_sidecut_radius_size_161w).

measured(s3, sidecut_radius_size_161w, v7_8w).

all_consistent(sidecut_radius_size_161w) :-
    consistent(s3, sidecut_radius_size_161w).

evidence(all_consistent(sidecut_radius_size_161w)).
query(true_val(sidecut_radius_size_161w, v7_8w)).
query(true_val(sidecut_radius_size_161w, unk_sidecut_radius_size_161w)).

0.82::acc(s3, base_length_per_size).

% @attr base_length_per_size
% @type categorical
% @canonical false
% @original_name Base details (length per size)
% @unit mm
% @values lengths_3718_3874_4029_4196_4246_4414=3718_3874_4029_4196_4246_4414 unk_base_length_per_size=Unknown
% @importance 0.95

0.82::true_val(base_length_per_size, lengths_3718_3874_4029_4196_4246_4414); 0.18::true_val(base_length_per_size, unk_base_length_per_size).

measured(s3, base_length_per_size, lengths_3718_3874_4029_4196_4246_4414).

all_consistent(base_length_per_size) :-
    consistent(s3, base_length_per_size).

evidence(all_consistent(base_length_per_size)).
query(true_val(base_length_per_size, lengths_3718_3874_4029_4196_4246_4414)).
query(true_val(base_length_per_size, unk_base_length_per_size)).

0.85::acc(s3, stance_width_range_size_146).
0.90::acc(s8, stance_width_range_size_146).

% @attr stance_width_range_size_146
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values r52_to_60=52_to_60cm unk_stance_width_range_size_146=Unknown
% @importance 0.975

0.95::true_val(stance_width_range_size_146, r52_to_60); 0.05::true_val(stance_width_range_size_146, unk_stance_width_range_size_146).

measured(s3, stance_width_range_size_146, r52_to_60).
measured(s8, stance_width_range_size_146, r52_to_60).

all_consistent(stance_width_range_size_146) :-
    consistent(s8, stance_width_range_size_146),
    (indep(s3), consistent(s3, stance_width_range_size_146) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_146)).
query(true_val(stance_width_range_size_146, r52_to_60)).
query(true_val(stance_width_range_size_146, unk_stance_width_range_size_146)).

0.85::acc(s3, stance_width_range_size_151).
0.90::acc(s8, stance_width_range_size_151).

% @attr stance_width_range_size_151
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values r54_to_62=54_to_62cm unk_stance_width_range_size_151=Unknown
% @importance 0.975

0.95::true_val(stance_width_range_size_151, r54_to_62); 0.05::true_val(stance_width_range_size_151, unk_stance_width_range_size_151).

measured(s3, stance_width_range_size_151, r54_to_62).
measured(s8, stance_width_range_size_151, r54_to_62).

all_consistent(stance_width_range_size_151) :-
    consistent(s8, stance_width_range_size_151),
    (indep(s3), consistent(s3, stance_width_range_size_151) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_151)).
query(true_val(stance_width_range_size_151, r54_to_62)).
query(true_val(stance_width_range_size_151, unk_stance_width_range_size_151)).

0.85::acc(s3, stance_width_range_size).
0.90::acc(s8, stance_width_range_size).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values r54_to_62=54_to_62cm unk_stance_width_range_size=Unknown
% @importance 0.975

0.95::true_val(stance_width_range_size, r54_to_62); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s3, stance_width_range_size, r54_to_62).
measured(s8, stance_width_range_size, r54_to_62).

all_consistent(stance_width_range_size) :-
    consistent(s8, stance_width_range_size),
    (indep(s3), consistent(s3, stance_width_range_size) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r54_to_62)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.85::acc(s3, stance_width_range_size_156w).
0.90::acc(s8, stance_width_range_size_156w).

% @attr stance_width_range_size_156w
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values r54_to_62w=54_to_62cm unk_stance_width_range_size_156w=Unknown
% @importance 0.975

0.95::true_val(stance_width_range_size_156w, r54_to_62w); 0.05::true_val(stance_width_range_size_156w, unk_stance_width_range_size_156w).

measured(s3, stance_width_range_size_156w, r54_to_62w).
measured(s8, stance_width_range_size_156w, r54_to_62w).

all_consistent(stance_width_range_size_156w) :-
    consistent(s8, stance_width_range_size_156w),
    (indep(s3), consistent(s3, stance_width_range_size_156w) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_156w)).
query(true_val(stance_width_range_size_156w, r54_to_62w)).
query(true_val(stance_width_range_size_156w, unk_stance_width_range_size_156w)).

0.82::acc(s3, stance_width_range_size_159).

% @attr stance_width_range_size_159
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values r54_to_62_159=54_to_62cm unk_stance_width_range_size_159=Unknown
% @importance 0.95

0.85::true_val(stance_width_range_size_159, r54_to_62_159); 0.15::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).

measured(s3, stance_width_range_size_159, r54_to_62_159).

all_consistent(stance_width_range_size_159) :-
    consistent(s3, stance_width_range_size_159).

evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, r54_to_62_159)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

0.82::acc(s3, stance_width_range_size_161w).

% @attr stance_width_range_size_161w
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values r54_to_62_161w=54_to_62cm unk_stance_width_range_size_161w=Unknown
% @importance 0.95

0.85::true_val(stance_width_range_size_161w, r54_to_62_161w); 0.15::true_val(stance_width_range_size_161w, unk_stance_width_range_size_161w).

measured(s3, stance_width_range_size_161w, r54_to_62_161w).

all_consistent(stance_width_range_size_161w) :-
    consistent(s3, stance_width_range_size_161w).

evidence(all_consistent(stance_width_range_size_161w)).
query(true_val(stance_width_range_size_161w, r54_to_62_161w)).
query(true_val(stance_width_range_size_161w, unk_stance_width_range_size_161w)).

0.92::acc(s8, board_weight_grams).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit g
% @values v2800=2800.0 unk_board_weight_grams=Unknown
% @importance 1.0

0.92::true_val(board_weight_grams, v2800); 0.08::true_val(board_weight_grams, unk_board_weight_grams).

measured(s8, board_weight_grams, v2800).

all_consistent(board_weight_grams) :-
    consistent(s8, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2800)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.88::acc(s8, boot_size_max).

% @attr boot_size_max
% @type categorical
% @canonical false
% @original_name Boot size max
% @unit cm
% @values v29_to_29_5=29_to_29_5cm unk_boot_size_max=Unknown
% @importance 1.0

0.88::true_val(boot_size_max, v29_to_29_5); 0.12::true_val(boot_size_max, unk_boot_size_max).

measured(s8, boot_size_max, v29_to_29_5).

all_consistent(boot_size_max) :-
    consistent(s8, boot_size_max).

evidence(all_consistent(boot_size_max)).
query(true_val(boot_size_max, v29_to_29_5)).
query(true_val(boot_size_max, unk_boot_size_max)).

0.80::acc(s6, recommended_weight_range_size_146).

% @attr recommended_weight_range_size_146
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values r45_65=45_to_65kg unk_recommended_weight_range_size_146=Unknown
% @importance 0.95

0.80::true_val(recommended_weight_range_size_146, r45_65); 0.20::true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146).

measured(s6, recommended_weight_range_size_146, r45_65).

all_consistent(recommended_weight_range_size_146) :-
    consistent(s6, recommended_weight_range_size_146).

evidence(all_consistent(recommended_weight_range_size_146)).
query(true_val(recommended_weight_range_size_146, r45_65)).
query(true_val(recommended_weight_range_size_146, unk_recommended_weight_range_size_146)).

0.80::acc(s6, recommended_weight_range_size_151).

% @attr recommended_weight_range_size_151
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values r50_70=50_to_70kg unk_recommended_weight_range_size_151=Unknown
% @importance 0.95

0.80::true_val(recommended_weight_range_size_151, r50_70); 0.20::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).

measured(s6, recommended_weight_range_size_151, r50_70).

all_consistent(recommended_weight_range_size_151) :-
    consistent(s6, recommended_weight_range_size_151).

evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, r50_70)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

0.80::acc(s6, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values r60_85=60_to_85kg unk_recommended_weight_range_size=Unknown
% @importance 0.95

0.80::true_val(recommended_weight_range_size, r60_85); 0.20::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s6, recommended_weight_range_size, r60_85).

all_consistent(recommended_weight_range_size) :-
    consistent(s6, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r60_85)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.80::acc(s6, recommended_weight_range_size_156w).

% @attr recommended_weight_range_size_156w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values r55_90=55_to_90kg unk_recommended_weight_range_size_156w=Unknown
% @importance 0.95

0.80::true_val(recommended_weight_range_size_156w, r55_90); 0.20::true_val(recommended_weight_range_size_156w, unk_recommended_weight_range_size_156w).

measured(s6, recommended_weight_range_size_156w, r55_90).

all_consistent(recommended_weight_range_size_156w) :-
    consistent(s6, recommended_weight_range_size_156w).

evidence(all_consistent(recommended_weight_range_size_156w)).
query(true_val(recommended_weight_range_size_156w, r55_90)).
query(true_val(recommended_weight_range_size_156w, unk_recommended_weight_range_size_156w)).

0.80::acc(s6, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values r75_100plus=75_to_100plus_kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.95

0.80::true_val(recommended_weight_range_size_159, r75_100plus); 0.20::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s6, recommended_weight_range_size_159, r75_100plus).

all_consistent(recommended_weight_range_size_159) :-
    consistent(s6, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, r75_100plus)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

0.80::acc(s6, recommended_weight_range_size_161w).

% @attr recommended_weight_range_size_161w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values r75_100plus_w=75_to_100plus_kg unk_recommended_weight_range_size_161w=Unknown
% @importance 0.95

0.80::true_val(recommended_weight_range_size_161w, r75_100plus_w); 0.20::true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w).

measured(s6, recommended_weight_range_size_161w, r75_100plus_w).

all_consistent(recommended_weight_range_size_161w) :-
    consistent(s6, recommended_weight_range_size_161w).

evidence(all_consistent(recommended_weight_range_size_161w)).
query(true_val(recommended_weight_range_size_161w, r75_100plus_w)).
query(true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w)).

0.78::acc(s3, recommended_weight_range_size_thehouse_regular).

% @attr recommended_weight_range_size_thehouse_regular
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values r40_80=40_to_80kg unk_recommended_weight_range_size_thehouse_regular=Unknown
% @importance 0.95

0.78::true_val(recommended_weight_range_size_thehouse_regular, r40_80); 0.22::true_val(recommended_weight_range_size_thehouse_regular, unk_recommended_weight_range_size_thehouse_regular).

measured(s3, recommended_weight_range_size_thehouse_regular, r40_80).

all_consistent(recommended_weight_range_size_thehouse_regular) :-
    consistent(s3, recommended_weight_range_size_thehouse_regular).

evidence(all_consistent(recommended_weight_range_size_thehouse_regular)).
query(true_val(recommended_weight_range_size_thehouse_regular, r40_80)).
query(true_val(recommended_weight_range_size_thehouse_regular, unk_recommended_weight_range_size_thehouse_regular)).

0.78::acc(s3, recommended_weight_range_size_thehouse_wide).

% @attr recommended_weight_range_size_thehouse_wide
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values r50_80=50_to_80kg unk_recommended_weight_range_size_thehouse_wide=Unknown
% @importance 0.95

0.78::true_val(recommended_weight_range_size_thehouse_wide, r50_80); 0.22::true_val(recommended_weight_range_size_thehouse_wide, unk_recommended_weight_range_size_thehouse_wide).

measured(s3, recommended_weight_range_size_thehouse_wide, r50_80).

all_consistent(recommended_weight_range_size_thehouse_wide) :-
    consistent(s3, recommended_weight_range_size_thehouse_wide).

evidence(all_consistent(recommended_weight_range_size_thehouse_wide)).
query(true_val(recommended_weight_range_size_thehouse_wide, r50_80)).
query(true_val(recommended_weight_range_size_thehouse_wide, unk_recommended_weight_range_size_thehouse_wide)).

0.88::acc(s8, recommended_weight_range_size_rossignol_regular).

% @attr recommended_weight_range_size_rossignol_regular
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values r40_80_rossi=40_to_80kg unk_recommended_weight_range_size_rossignol_regular=Unknown
% @importance 1.0

0.88::true_val(recommended_weight_range_size_rossignol_regular, r40_80_rossi); 0.12::true_val(recommended_weight_range_size_rossignol_regular, unk_recommended_weight_range_size_rossignol_regular).

measured(s8, recommended_weight_range_size_rossignol_regular, r40_80_rossi).

all_consistent(recommended_weight_range_size_rossignol_regular) :-
    consistent(s8, recommended_weight_range_size_rossignol_regular).

evidence(all_consistent(recommended_weight_range_size_rossignol_regular)).
query(true_val(recommended_weight_range_size_rossignol_regular, r40_80_rossi)).
query(true_val(recommended_weight_range_size_rossignol_regular, unk_recommended_weight_range_size_rossignol_regular)).

0.85::acc(s1, rider_level).
0.80::acc(s6, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner_intermediate=Beginner_to_Intermediate unk_rider_level=Unknown
% @importance 0.975

0.95::true_val(rider_level, beginner_intermediate); 0.05::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, beginner_intermediate).
measured(s6, rider_level, beginner_intermediate).

all_consistent(rider_level) :-
    consistent(s1, rider_level),
    (indep(s6), consistent(s6, rider_level) ; \+indep(s6)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_intermediate)).
query(true_val(rider_level, unk_rider_level)).

0.75::acc(s3, skill_level_recommendation).
0.80::acc(s23, skill_level_recommendation).
0.72::acc(s28, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_advanced=Beginner_Advanced beginner_to_intermediate_outgrow=Beginner_to_Intermediate_outgrow_beyond
% @importance 0.88

0.35::true_val(skill_level_recommendation, beginner_advanced); 0.65::true_val(skill_level_recommendation, beginner_to_intermediate_outgrow).

measured(s3, skill_level_recommendation, beginner_advanced).
measured(s23, skill_level_recommendation, beginner_to_intermediate_outgrow).
measured(s28, skill_level_recommendation, beginner_to_intermediate_outgrow).

all_consistent(skill_level_recommendation) :-
    (indep(s3), consistent(s3, skill_level_recommendation) ; \+indep(s3)),
    consistent(s23, skill_level_recommendation),
    consistent(s28, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_advanced)).
query(true_val(skill_level_recommendation, beginner_to_intermediate_outgrow)).

0.80::acc(s6, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mountain_freestyle=All_Mountain_Freestyle unk_terrain_suitability=Unknown
% @importance 0.95

0.82::true_val(terrain_suitability, all_mountain_freestyle); 0.18::true_val(terrain_suitability, unk_terrain_suitability).

measured(s6, terrain_suitability, all_mountain_freestyle).

all_consistent(terrain_suitability) :-
    consistent(s6, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mountain_freestyle)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.83::acc(s1, riding_style).
0.80::acc(s6, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values beginner_freestyle_progression=Learning_first_turns_park_features_switch_riding unk_riding_style=Unknown
% @importance 0.975

0.90::true_val(riding_style, beginner_freestyle_progression); 0.10::true_val(riding_style, unk_riding_style).

measured(s1, riding_style, beginner_freestyle_progression).
measured(s6, riding_style, beginner_freestyle_progression).

all_consistent(riding_style) :-
    consistent(s1, riding_style),
    (indep(s6), consistent(s6, riding_style) ; \+indep(s6)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, beginner_freestyle_progression)).
query(true_val(riding_style, unk_riding_style)).

0.90::acc(s8, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v349_95=349.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.90::true_val(price_usd_msrp, v349_95); 0.10::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s8, price_usd_msrp, v349_95).

all_consistent(price_usd_msrp) :-
    consistent(s8, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v349_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.85::acc(s6, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v299_99=299.99 unk_price_aud_merchant=Unknown
% @importance 0.95

0.85::true_val(price_aud_merchant, v299_99); 0.15::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s6, price_aud_merchant, v299_99).

all_consistent(price_aud_merchant) :-
    consistent(s6, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v299_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.85::acc(s6, price_aud_merchant_rrp).

% @attr price_aud_merchant_rrp
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v599_99=599.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.95

0.85::true_val(price_aud_merchant_rrp, v599_99); 0.15::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s6, price_aud_merchant_rrp, v599_99).

all_consistent(price_aud_merchant_rrp) :-
    consistent(s6, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v599_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

0.85::acc(s6, discount_melbourne).

% @attr discount_melbourne
% @type numeric
% @canonical false
% @original_name Discount at Melbourne Snowboard Centre
% @unit percent
% @values v50=50.0 unk_discount_melbourne=Unknown
% @importance 0.95

0.85::true_val(discount_melbourne, v50); 0.15::true_val(discount_melbourne, unk_discount_melbourne).

measured(s6, discount_melbourne, v50).

all_consistent(discount_melbourne) :-
    consistent(s6, discount_melbourne).

evidence(all_consistent(discount_melbourne)).
query(true_val(discount_melbourne, v50)).
query(true_val(discount_melbourne, unk_discount_melbourne)).

0.82::acc(s3, price_usd_thehouse).

% @attr price_usd_thehouse
% @type numeric
% @canonical false
% @original_name Price at The-House (USD, sale)
% @unit USD
% @values v269_95=269.95 unk_price_usd_thehouse=Unknown
% @importance 0.95

0.82::true_val(price_usd_thehouse, v269_95); 0.18::true_val(price_usd_thehouse, unk_price_usd_thehouse).

measured(s3, price_usd_thehouse, v269_95).

all_consistent(price_usd_thehouse) :-
    consistent(s3, price_usd_thehouse).

evidence(all_consistent(price_usd_thehouse)).
query(true_val(price_usd_thehouse, v269_95)).
query(true_val(price_usd_thehouse, unk_price_usd_thehouse)).

0.55::acc(s18, price_usd_ebay).

% @attr price_usd_ebay
% @type numeric
% @canonical false
% @original_name Price at eBay (USD, listing)
% @unit USD
% @values v314_99=314.99 unk_price_usd_ebay=Unknown
% @importance 0.6

0.55::true_val(price_usd_ebay, v314_99); 0.45::true_val(price_usd_ebay, unk_price_usd_ebay).

measured(s18, price_usd_ebay, v314_99).

all_consistent(price_usd_ebay) :-
    consistent(s18, price_usd_ebay).

evidence(all_consistent(price_usd_ebay)).
query(true_val(price_usd_ebay, v314_99)).
query(true_val(price_usd_ebay, unk_price_usd_ebay)).

0.80::acc(s6, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_au=Available_Australian_retailer unk_availability_status=Unknown
% @importance 0.95

0.82::true_val(availability_status, available_au); 0.18::true_val(availability_status, unk_availability_status).

measured(s6, availability_status, available_au).

all_consistent(availability_status) :-
    consistent(s6, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_au)).
query(true_val(availability_status, unk_availability_status)).

0.80::acc(s3, availability_status_thehouse).

% @attr availability_status_thehouse
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_us=Available_US_retailer unk_availability_status_thehouse=Unknown
% @importance 0.95

0.80::true_val(availability_status_thehouse, available_us); 0.20::true_val(availability_status_thehouse, unk_availability_status_thehouse).

measured(s3, availability_status_thehouse, available_us).

all_consistent(availability_status_thehouse) :-
    consistent(s3, availability_status_thehouse).

evidence(all_consistent(availability_status_thehouse)).
query(true_val(availability_status_thehouse, available_us)).
query(true_val(availability_status_thehouse, unk_availability_status_thehouse)).

0.82::acc(s1, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values outlet=Listed_in_outlet_section unk_availability_status_evo=Unknown
% @importance 1.0

0.82::true_val(availability_status_evo, outlet); 0.18::true_val(availability_status_evo, unk_availability_status_evo).

measured(s1, availability_status_evo, outlet).

all_consistent(availability_status_evo) :-
    consistent(s1, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, outlet)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.50::acc(s2, availability_status_sunnfun).

% @attr availability_status_sunnfun
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out=Sold_out unk_availability_status_sunnfun=Unknown
% @importance 0.8

0.50::true_val(availability_status_sunnfun, sold_out); 0.50::true_val(availability_status_sunnfun, unk_availability_status_sunnfun).

measured(s2, availability_status_sunnfun, sold_out).

all_consistent(availability_status_sunnfun) :-
    consistent(s2, availability_status_sunnfun).

evidence(all_consistent(availability_status_sunnfun)).
query(true_val(availability_status_sunnfun, sold_out)).
query(true_val(availability_status_sunnfun, unk_availability_status_sunnfun)).

0.90::acc(s8, availability_status_rossignol).

% @attr availability_status_rossignol
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_146_151_155_159=Available_in_146_151_155_159 unk_availability_status_rossignol=Unknown
% @importance 1.0

0.90::true_val(availability_status_rossignol, available_146_151_155_159); 0.10::true_val(availability_status_rossignol, unk_availability_status_rossignol).

measured(s8, availability_status_rossignol, available_146_151_155_159).

all_consistent(availability_status_rossignol) :-
    consistent(s8, availability_status_rossignol).

evidence(all_consistent(availability_status_rossignol)).
query(true_val(availability_status_rossignol, available_146_151_155_159)).
query(true_val(availability_status_rossignol, unk_availability_status_rossignol)).

0.88::acc(s9, availability_status_rossignol_wide).

% @attr availability_status_rossignol_wide
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_wide=Available unk_availability_status_rossignol_wide=Unknown
% @importance 0.6

0.88::true_val(availability_status_rossignol_wide, available_wide); 0.12::true_val(availability_status_rossignol_wide, unk_availability_status_rossignol_wide).

measured(s9, availability_status_rossignol_wide, available_wide).

all_consistent(availability_status_rossignol_wide) :-
    consistent(s9, availability_status_rossignol_wide).

evidence(all_consistent(availability_status_rossignol_wide)).
query(true_val(availability_status_rossignol_wide, available_wide)).
query(true_val(availability_status_rossignol_wide, unk_availability_status_rossignol_wide)).

0.82::acc(s1, retailer_evo).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name Retailer — evo
% @values major_us_specialty=Major_US_specialty_retailer_price_match_1yr_return unk_retailer_evo=Unknown
% @importance 1.0

0.82::true_val(retailer_evo, major_us_specialty); 0.18::true_val(retailer_evo, unk_retailer_evo).

measured(s1, retailer_evo, major_us_specialty).

all_consistent(retailer_evo) :-
    consistent(s1, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_us_specialty)).
query(true_val(retailer_evo, unk_retailer_evo)).

0.78::acc(s3, retailer_thehouse).

% @attr retailer_thehouse
% @type categorical
% @canonical false
% @original_name Retailer — The-House
% @values us_retailer_90day=US_retailer_90day_return unk_retailer_thehouse=Unknown
% @importance 0.95

0.78::true_val(retailer_thehouse, us_retailer_90day); 0.22::true_val(retailer_thehouse, unk_retailer_thehouse).

measured(s3, retailer_thehouse, us_retailer_90day).

all_consistent(retailer_thehouse) :-
    consistent(s3, retailer_thehouse).

evidence(all_consistent(retailer_thehouse)).
query(true_val(retailer_thehouse, us_retailer_90day)).
query(true_val(retailer_thehouse, unk_retailer_thehouse)).

0.80::acc(s6, retailer_melbourne).

% @attr retailer_melbourne
% @type categorical
% @canonical false
% @original_name Retailer — Melbourne Snowboard Centre
% @values au_specialty_30day=Australian_specialty_30day_return unk_retailer_melbourne=Unknown
% @importance 0.95

0.80::true_val(retailer_melbourne, au_specialty_30day); 0.20::true_val(retailer_melbourne, unk_retailer_melbourne).

measured(s6, retailer_melbourne, au_specialty_30day).

all_consistent(retailer_melbourne) :-
    consistent(s6, retailer_melbourne).

evidence(all_consistent(retailer_melbourne)).
query(true_val(retailer_melbourne, au_specialty_30day)).
query(true_val(retailer_melbourne, unk_retailer_melbourne)).

0.55::acc(s7, retailer_everysportforless).

% @attr retailer_everysportforless
% @type categorical
% @canonical false
% @original_name Retailer — Everysportforless
% @values us_online_60day=US_online_60day_moneyback unk_retailer_everysportforless=Unknown
% @importance 0.5

0.55::true_val(retailer_everysportforless, us_online_60day); 0.45::true_val(retailer_everysportforless, unk_retailer_everysportforless).

measured(s7, retailer_everysportforless, us_online_60day).

all_consistent(retailer_everysportforless) :-
    consistent(s7, retailer_everysportforless).

evidence(all_consistent(retailer_everysportforless)).
query(true_val(retailer_everysportforless, us_online_60day)).
query(true_val(retailer_everysportforless, unk_retailer_everysportforless)).

0.90::acc(s12, manufacturer_brand_reputation).

% @attr manufacturer_brand_reputation
% @type categorical
% @canonical false
% @original_name Manufacturer (Rossignol) brand reputation
% @values well_established_since_1907=Well_established_French_winter_sports_brand_since_1907 unk_manufacturer_brand_reputation=Unknown
% @importance 0.4

0.90::true_val(manufacturer_brand_reputation, well_established_since_1907); 0.10::true_val(manufacturer_brand_reputation, unk_manufacturer_brand_reputation).

measured(s12, manufacturer_brand_reputation, well_established_since_1907).

all_consistent(manufacturer_brand_reputation) :-
    consistent(s12, manufacturer_brand_reputation).

evidence(all_consistent(manufacturer_brand_reputation)).
query(true_val(manufacturer_brand_reputation, well_established_since_1907)).
query(true_val(manufacturer_brand_reputation, unk_manufacturer_brand_reputation)).

0.65::acc(s19, warranty_period_years).
0.85::acc(s20, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v1=1.0 unk_warranty_period_years=Unknown
% @importance 0.7

0.92::true_val(warranty_period_years, v1); 0.08::true_val(warranty_period_years, unk_warranty_period_years).

measured(s19, warranty_period_years, v1).
measured(s20, warranty_period_years, v1).

all_consistent(warranty_period_years) :-
    consistent(s19, warranty_period_years),
    consistent(s20, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.65::acc(s19, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values defects_workmanship_materials=Defects_in_workmanship_and_materials unk_warranty=Unknown
% @importance 0.7

0.65::true_val(warranty, defects_workmanship_materials); 0.35::true_val(warranty, unk_warranty).

measured(s19, warranty, defects_workmanship_materials).

all_consistent(warranty) :-
    consistent(s19, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, defects_workmanship_materials)).
query(true_val(warranty, unk_warranty)).

0.65::acc(s19, warranty_exclusions).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty
% @values normal_wear_impact_abuse=Normal_wear_impact_abuse_misuse_faulty_mounting unk_warranty_exclusions=Unknown
% @importance 0.7

0.65::true_val(warranty_exclusions, normal_wear_impact_abuse); 0.35::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s19, warranty_exclusions, normal_wear_impact_abuse).

all_consistent(warranty_exclusions) :-
    consistent(s19, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, normal_wear_impact_abuse)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

0.85::acc(s20, warranty_process).

% @attr warranty_process
% @type categorical
% @canonical false
% @original_name warranty
% @values submit_via_dealer_or_website=Submit_through_authorized_dealer_or_website unk_warranty_process=Unknown
% @importance 0.7

0.85::true_val(warranty_process, submit_via_dealer_or_website); 0.15::true_val(warranty_process, unk_warranty_process).

measured(s20, warranty_process, submit_via_dealer_or_website).

all_consistent(warranty_process) :-
    consistent(s20, warranty_process).

evidence(all_consistent(warranty_process)).
query(true_val(warranty_process, submit_via_dealer_or_website)).
query(true_val(warranty_process, unk_warranty_process)).

0.55::acc(s21, user_review_forum_warranty).

% @attr user_review_forum_warranty
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values nine_weeks_to_resolution=9_weeks_contact_to_resolution_6_weeks_board_to_replacement unk_user_review_forum_warranty=Unknown
% @importance 0.6

0.50::true_val(user_review_forum_warranty, nine_weeks_to_resolution); 0.50::true_val(user_review_forum_warranty, unk_user_review_forum_warranty).

measured(s21, user_review_forum_warranty, nine_weeks_to_resolution).

all_consistent(user_review_forum_warranty) :-
    consistent(s21, user_review_forum_warranty).

evidence(all_consistent(user_review_forum_warranty)).
query(true_val(user_review_forum_warranty, nine_weeks_to_resolution)).
query(true_val(user_review_forum_warranty, unk_user_review_forum_warranty)).

0.87::acc(s1, turn_initiation_performance).
0.90::acc(s8, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values effortless=Effortless_AmpTek_maneuverability unk_turn_initiation_performance=Unknown
% @importance 1.0

0.95::true_val(turn_initiation_performance, effortless); 0.05::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s1, turn_initiation_performance, effortless).
measured(s8, turn_initiation_performance, effortless).

all_consistent(turn_initiation_performance) :-
    consistent(s1, turn_initiation_performance),
    consistent(s8, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, effortless)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.87::acc(s1, positive_aspect_edge_catch).
0.90::acc(s8, positive_aspect_edge_catch).

% @attr positive_aspect_edge_catch
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values minimizes_edge_catches=Minimizes_edge_catches_for_confidence unk_positive_aspect_edge_catch=Unknown
% @importance 1.0

0.93::true_val(positive_aspect_edge_catch, minimizes_edge_catches); 0.07::true_val(positive_aspect_edge_catch, unk_positive_aspect_edge_catch).

measured(s1, positive_aspect_edge_catch, minimizes_edge_catches).
measured(s8, positive_aspect_edge_catch, minimizes_edge_catches).

all_consistent(positive_aspect_edge_catch) :-
    consistent(s1, positive_aspect_edge_catch),
    consistent(s8, positive_aspect_edge_catch).

evidence(all_consistent(positive_aspect_edge_catch)).
query(true_val(positive_aspect_edge_catch, minimizes_edge_catches)).
query(true_val(positive_aspect_edge_catch, unk_positive_aspect_edge_catch)).

0.88::acc(s8, pop).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values lively_pop=Lively_pop_twin_freestyle_flex unk_pop=Unknown
% @importance 1.0

0.88::true_val(pop, lively_pop); 0.12::true_val(pop, unk_pop).

measured(s8, pop, lively_pop).

all_consistent(pop) :-
    consistent(s8, pop).

evidence(all_consistent(pop)).
query(true_val(pop, lively_pop)).
query(true_val(pop, unk_pop)).

0.88::acc(s8, positive_aspect_manipulation).

% @attr positive_aspect_manipulation
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values easy_manipulation=Softer_symmetrical_flex_easy_manipulation unk_positive_aspect_manipulation=Unknown
% @importance 1.0

0.88::true_val(positive_aspect_manipulation, easy_manipulation); 0.12::true_val(positive_aspect_manipulation, unk_positive_aspect_manipulation).

measured(s8, positive_aspect_manipulation, easy_manipulation).

all_consistent(positive_aspect_manipulation) :-
    consistent(s8, positive_aspect_manipulation).

evidence(all_consistent(positive_aspect_manipulation)).
query(true_val(positive_aspect_manipulation, easy_manipulation)).
query(true_val(positive_aspect_manipulation, unk_positive_aspect_manipulation)).

0.80::acc(s6, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values identical_both_directions=True_twin_identical_both_directions unk_switch_riding=Unknown
% @importance 0.95

0.82::true_val(switch_riding, identical_both_directions); 0.18::true_val(switch_riding, unk_switch_riding).

measured(s6, switch_riding, identical_both_directions).

all_consistent(switch_riding) :-
    consistent(s6, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, identical_both_directions)).
query(true_val(switch_riding, unk_switch_riding)).

0.78::acc(s6, customer_review_melbourne).

% @attr customer_review_melbourne
% @type categorical
% @canonical false
% @original_name Customer review — Melbourne Snowboard Centre
% @values nice_beginner_4of5=Rated_4_of_5_nice_beginner_snowboard unk_customer_review_melbourne=Unknown
% @importance 0.95

0.78::true_val(customer_review_melbourne, nice_beginner_4of5); 0.22::true_val(customer_review_melbourne, unk_customer_review_melbourne).

measured(s6, customer_review_melbourne, nice_beginner_4of5).

all_consistent(customer_review_melbourne) :-
    consistent(s6, customer_review_melbourne).

evidence(all_consistent(customer_review_melbourne)).
query(true_val(customer_review_melbourne, nice_beginner_4of5)).
query(true_val(customer_review_melbourne, unk_customer_review_melbourne)).

0.75::acc(s6, negative_aspect_color).

% @attr negative_aspect_color
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values base_color_mismatch=Base_colour_did_not_match_product_image unk_negative_aspect_color=Unknown
% @importance 0.95

0.75::true_val(negative_aspect_color, base_color_mismatch); 0.25::true_val(negative_aspect_color, unk_negative_aspect_color).

measured(s6, negative_aspect_color, base_color_mismatch).

all_consistent(negative_aspect_color) :-
    consistent(s6, negative_aspect_color).

evidence(all_consistent(negative_aspect_color)).
query(true_val(negative_aspect_color, base_color_mismatch)).
query(true_val(negative_aspect_color, unk_negative_aspect_color)).

0.78::acc(s3, customer_rating_thehouse).

% @attr customer_rating_thehouse
% @type numeric
% @canonical false
% @original_name Customer rating (The-House)
% @unit out_of_5
% @values v4_6=4.6 unk_customer_rating_thehouse=Unknown
% @importance 0.95

0.78::true_val(customer_rating_thehouse, v4_6); 0.22::true_val(customer_rating_thehouse, unk_customer_rating_thehouse).

measured(s3, customer_rating_thehouse, v4_6).

all_consistent(customer_rating_thehouse) :-
    consistent(s3, customer_rating_thehouse).

evidence(all_consistent(customer_rating_thehouse)).
query(true_val(customer_rating_thehouse, v4_6)).
query(true_val(customer_rating_thehouse, unk_customer_rating_thehouse)).

0.78::acc(s6, customer_rating_melbourne).

% @attr customer_rating_melbourne
% @type numeric
% @canonical false
% @original_name Customer rating (merchant verified)
% @unit out_of_5
% @values v4_0=4.0 unk_customer_rating_melbourne=Unknown
% @importance 0.95

0.78::true_val(customer_rating_melbourne, v4_0); 0.22::true_val(customer_rating_melbourne, unk_customer_rating_melbourne).

measured(s6, customer_rating_melbourne, v4_0).

all_consistent(customer_rating_melbourne) :-
    consistent(s6, customer_rating_melbourne).

evidence(all_consistent(customer_rating_melbourne)).
query(true_val(customer_rating_melbourne, v4_0)).
query(true_val(customer_rating_melbourne, unk_customer_rating_melbourne)).

0.78::acc(s6, number_of_reviews_melbourne).

% @attr number_of_reviews_melbourne
% @type numeric
% @canonical false
% @original_name Number of reviews (merchant verified)
% @values v1_review=1 unk_number_of_reviews_melbourne=Unknown
% @importance 0.95

0.78::true_val(number_of_reviews_melbourne, v1_review); 0.22::true_val(number_of_reviews_melbourne, unk_number_of_reviews_melbourne).

measured(s6, number_of_reviews_melbourne, v1_review).

all_consistent(number_of_reviews_melbourne) :-
    consistent(s6, number_of_reviews_melbourne).

evidence(all_consistent(number_of_reviews_melbourne)).
query(true_val(number_of_reviews_melbourne, v1_review)).
query(true_val(number_of_reviews_melbourne, unk_number_of_reviews_melbourne)).

0.78::acc(s6, recommendation_rate_melbourne).

% @attr recommendation_rate_melbourne
% @type numeric
% @canonical false
% @original_name Recommendation rate (merchant verified)
% @unit percent
% @values v100=100.0 unk_recommendation_rate_melbourne=Unknown
% @importance 0.95

0.78::true_val(recommendation_rate_melbourne, v100); 0.22::true_val(recommendation_rate_melbourne, unk_recommendation_rate_melbourne).

measured(s6, recommendation_rate_melbourne, v100).

all_consistent(recommendation_rate_melbourne) :-
    consistent(s6, recommendation_rate_melbourne).

evidence(all_consistent(recommendation_rate_melbourne)).
query(true_val(recommendation_rate_melbourne, v100)).
query(true_val(recommendation_rate_melbourne, unk_recommendation_rate_melbourne)).

0.75::acc(s22, review_snowboardingdays).

% @attr review_snowboardingdays
% @type categorical
% @canonical false
% @original_name SnowboardingDays.com review
% @values fun_perfect_turn_initiation=Fun_board_perfect_turn_initiation_soft_lively_flex unk_review_snowboardingdays=Unknown
% @importance 0.8

0.75::true_val(review_snowboardingdays, fun_perfect_turn_initiation); 0.25::true_val(review_snowboardingdays, unk_review_snowboardingdays).

measured(s22, review_snowboardingdays, fun_perfect_turn_initiation).

all_consistent(review_snowboardingdays) :-
    consistent(s22, review_snowboardingdays).

evidence(all_consistent(review_snowboardingdays)).
query(true_val(review_snowboardingdays, fun_perfect_turn_initiation)).
query(true_val(review_snowboardingdays, unk_review_snowboardingdays)).

0.75::acc(s22, classification_snowboardingdays).

% @attr classification_snowboardingdays
% @type categorical
% @canonical false
% @original_name SnowboardingDays.com classification
% @values flex3_amptek_extruded_twin=Flex_3_10_Amptek_AutoTurn_extruded_true_twin unk_classification_snowboardingdays=Unknown
% @importance 0.8

0.75::true_val(classification_snowboardingdays, flex3_amptek_extruded_twin); 0.25::true_val(classification_snowboardingdays, unk_classification_snowboardingdays).

measured(s22, classification_snowboardingdays, flex3_amptek_extruded_twin).

all_consistent(classification_snowboardingdays) :-
    consistent(s22, classification_snowboardingdays).

evidence(all_consistent(classification_snowboardingdays)).
query(true_val(classification_snowboardingdays, flex3_amptek_extruded_twin)).
query(true_val(classification_snowboardingdays, unk_classification_snowboardingdays)).

0.80::acc(s23, reviewer_opinion_snowboardingprofiles).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values perfect_score_easiest=Perfect_score_beginner_ease_easiest_board_lowest_priced unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.85

0.80::true_val(reviewer_opinion_snowboardingprofiles, perfect_score_easiest); 0.20::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s23, reviewer_opinion_snowboardingprofiles, perfect_score_easiest).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s23, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, perfect_score_easiest)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

0.75::acc(s24, review_curated).

% @attr review_curated
% @type categorical
% @canonical false
% @original_name Curated.com review
% @values great_first_turns_butters=Great_for_first_turns_butters_predictable_forgiving unk_review_curated=Unknown
% @importance 0.8

0.75::true_val(review_curated, great_first_turns_butters); 0.25::true_val(review_curated, unk_review_curated).

measured(s24, review_curated, great_first_turns_butters).

all_consistent(review_curated) :-
    consistent(s24, review_curated).

evidence(all_consistent(review_curated)).
query(true_val(review_curated, great_first_turns_butters)).
query(true_val(review_curated, unk_review_curated)).

0.65::acc(s25, review_thehouse_video).

% @attr review_thehouse_video
% @type categorical
% @canonical false
% @original_name The-House video review (2011 model)
% @values recreational_intermediate_twin=Recreational_to_intermediate_true_twin_medium_flex unk_review_thehouse_video=Unknown
% @importance 0.5

0.60::true_val(review_thehouse_video, recreational_intermediate_twin); 0.40::true_val(review_thehouse_video, unk_review_thehouse_video).

measured(s25, review_thehouse_video, recreational_intermediate_twin).

all_consistent(review_thehouse_video) :-
    consistent(s25, review_thehouse_video).

evidence(all_consistent(review_thehouse_video)).
query(true_val(review_thehouse_video, recreational_intermediate_twin)).
query(true_val(review_thehouse_video, unk_review_thehouse_video)).

0.65::acc(s26, review_action_advisor).

% @attr review_action_advisor
% @type categorical
% @canonical false
% @original_name The Action Advisor review
% @values best_freestyle_to_learn=Best_freestyle_board_to_learn_simple_inexpensive unk_review_action_advisor=Unknown
% @importance 0.7

0.62::true_val(review_action_advisor, best_freestyle_to_learn); 0.38::true_val(review_action_advisor, unk_review_action_advisor).

measured(s26, review_action_advisor, best_freestyle_to_learn).

all_consistent(review_action_advisor) :-
    consistent(s26, review_action_advisor).

evidence(all_consistent(review_action_advisor)).
query(true_val(review_action_advisor, best_freestyle_to_learn)).
query(true_val(review_action_advisor, unk_review_action_advisor)).

0.58::acc(s27, review_outside_pursuits).

% @attr review_outside_pursuits
% @type categorical
% @canonical false
% @original_name Outside Pursuits review
% @values endorsed_brand_quality=Endorsed_Rossignol_as_quality_beginner_board_maker unk_review_outside_pursuits=Unknown
% @importance 0.4

0.55::true_val(review_outside_pursuits, endorsed_brand_quality); 0.45::true_val(review_outside_pursuits, unk_review_outside_pursuits).

measured(s27, review_outside_pursuits, endorsed_brand_quality).

all_consistent(review_outside_pursuits) :-
    consistent(s27, review_outside_pursuits).

evidence(all_consistent(review_outside_pursuits)).
query(true_val(review_outside_pursuits, endorsed_brand_quality)).
query(true_val(review_outside_pursuits, unk_review_outside_pursuits)).

0.68::acc(s28, user_review_forum_grip).

% @attr user_review_forum_grip
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values rocker_less_grip=Rocker_dominant_does_not_grip_as_well_as_camber unk_user_review_forum_grip=Unknown
% @importance 0.85

0.65::true_val(user_review_forum_grip, rocker_less_grip); 0.35::true_val(user_review_forum_grip, unk_user_review_forum_grip).

measured(s28, user_review_forum_grip, rocker_less_grip).

all_consistent(user_review_forum_grip) :-
    consistent(s28, user_review_forum_grip).

evidence(all_consistent(user_review_forum_grip)).
query(true_val(user_review_forum_grip, rocker_less_grip)).
query(true_val(user_review_forum_grip, unk_user_review_forum_grip)).

0.68::acc(s28, user_review_forum_compared).

% @attr user_review_forum_compared
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values grouped_k2_salomon=Grouped_with_K2_Standard_Salomon_Pulse unk_user_review_forum_compared=Unknown
% @importance 0.85

0.65::true_val(user_review_forum_compared, grouped_k2_salomon); 0.35::true_val(user_review_forum_compared, unk_user_review_forum_compared).

measured(s28, user_review_forum_compared, grouped_k2_salomon).

all_consistent(user_review_forum_compared) :-
    consistent(s28, user_review_forum_compared).

evidence(all_consistent(user_review_forum_compared)).
query(true_val(user_review_forum_compared, grouped_k2_salomon)).
query(true_val(user_review_forum_compared, unk_user_review_forum_compared)).

0.68::acc(s28, user_review_forum_feel).

% @attr user_review_forum_feel
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values looser_underfoot_more_turny=Rocker_looser_underfoot_more_turny_less_grip_ice unk_user_review_forum_feel=Unknown
% @importance 0.85

0.65::true_val(user_review_forum_feel, looser_underfoot_more_turny); 0.35::true_val(user_review_forum_feel, unk_user_review_forum_feel).

measured(s28, user_review_forum_feel, looser_underfoot_more_turny).

all_consistent(user_review_forum_feel) :-
    consistent(s28, user_review_forum_feel).

evidence(all_consistent(user_review_forum_feel)).
query(true_val(user_review_forum_feel, looser_underfoot_more_turny)).
query(true_val(user_review_forum_feel, unk_user_review_forum_feel)).

0.75::acc(s23, user_review_forum).
0.68::acc(s28, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values outgrow_past_intermediate=Riders_will_outgrow_past_intermediate unk_user_review_forum=Unknown
% @importance 0.85

0.85::true_val(user_review_forum, outgrow_past_intermediate); 0.15::true_val(user_review_forum, unk_user_review_forum).

measured(s23, user_review_forum, outgrow_past_intermediate).
measured(s28, user_review_forum, outgrow_past_intermediate).

all_consistent(user_review_forum) :-
    consistent(s23, user_review_forum),
    consistent(s28, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, outgrow_past_intermediate)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.50::acc(s10, review_snowboard_review_com).

% @attr review_snowboard_review_com
% @type categorical
% @canonical false
% @original_name Snowboard-Review.com
% @values listing_limited_reviews=Listing_pages_exist_limited_user_reviews unk_review_snowboard_review_com=Unknown
% @importance 0.3

0.45::true_val(review_snowboard_review_com, listing_limited_reviews); 0.55::true_val(review_snowboard_review_com, unk_review_snowboard_review_com).

measured(s10, review_snowboard_review_com, listing_limited_reviews).

all_consistent(review_snowboard_review_com) :-
    consistent(s10, review_snowboard_review_com).

evidence(all_consistent(review_snowboard_review_com)).
query(true_val(review_snowboard_review_com, listing_limited_reviews)).
query(true_val(review_snowboard_review_com, unk_review_snowboard_review_com)).

0.75::acc(s24, comparable_board_cross_brand).
0.68::acc(s28, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values k2_standard=K2_Standard_similar_rocker_soft_twin_beginner unk_comparable_board_cross_brand=Unknown
% @importance 0.825

0.82::true_val(comparable_board_cross_brand, k2_standard); 0.18::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s24, comparable_board_cross_brand, k2_standard).
measured(s28, comparable_board_cross_brand, k2_standard).

all_consistent(comparable_board_cross_brand) :-
    consistent(s24, comparable_board_cross_brand),
    consistent(s28, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, k2_standard)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.75::acc(s24, comparable_board_cross_brand_camber).
0.68::acc(s28, comparable_board_cross_brand_camber).

% @attr comparable_board_cross_brand_camber
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values salomon_pulse=Salomon_Pulse_camber_dominant_stiffer_better_edge unk_comparable_board_cross_brand_camber=Unknown
% @importance 0.825

0.82::true_val(comparable_board_cross_brand_camber, salomon_pulse); 0.18::true_val(comparable_board_cross_brand_camber, unk_comparable_board_cross_brand_camber).

measured(s24, comparable_board_cross_brand_camber, salomon_pulse).
measured(s28, comparable_board_cross_brand_camber, salomon_pulse).

all_consistent(comparable_board_cross_brand_camber) :-
    consistent(s24, comparable_board_cross_brand_camber),
    consistent(s28, comparable_board_cross_brand_camber).

evidence(all_consistent(comparable_board_cross_brand_camber)).
query(true_val(comparable_board_cross_brand_camber, salomon_pulse)).
query(true_val(comparable_board_cross_brand_camber, unk_comparable_board_cross_brand_camber)).

0.75::acc(s23, comparable_board_cross_brand_allmt).

% @attr comparable_board_cross_brand_allmt
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values nidecker_micron=All_mountain_beginner_budget_friendly unk_comparable_board_cross_brand_allmt=Unknown
% @importance 0.85

0.75::true_val(comparable_board_cross_brand_allmt, nidecker_micron); 0.25::true_val(comparable_board_cross_brand_allmt, unk_comparable_board_cross_brand_allmt).

measured(s23, comparable_board_cross_brand_allmt, nidecker_micron).

all_consistent(comparable_board_cross_brand_allmt) :-
    consistent(s23, comparable_board_cross_brand_allmt).

evidence(all_consistent(comparable_board_cross_brand_allmt)).
query(true_val(comparable_board_cross_brand_allmt, nidecker_micron)).
query(true_val(comparable_board_cross_brand_allmt, unk_comparable_board_cross_brand_allmt)).

0.75::acc(s23, comparable_board_cross_brand_burton).

% @attr comparable_board_cross_brand_burton
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_beginner=Burton_beginner_options_channel_system_different_ecosystem unk_comparable_board_cross_brand_burton=Unknown
% @importance 0.85

0.75::true_val(comparable_board_cross_brand_burton, burton_beginner); 0.25::true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton).

measured(s23, comparable_board_cross_brand_burton, burton_beginner).

all_consistent(comparable_board_cross_brand_burton) :-
    consistent(s23, comparable_board_cross_brand_burton).

evidence(all_consistent(comparable_board_cross_brand_burton)).
query(true_val(comparable_board_cross_brand_burton, burton_beginner)).
query(true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton)).

0.70::acc(s29, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values rossignol_circuit=Rossignol_Circuit_all_mountain_directional_flex unk_comparable_board_same_brand=Unknown
% @importance 0.6

0.70::true_val(comparable_board_same_brand, rossignol_circuit); 0.30::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s29, comparable_board_same_brand, rossignol_circuit).

all_consistent(comparable_board_same_brand) :-
    consistent(s29, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, rossignol_circuit)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.72::acc(s30, comparable_board_same_brand_evader).

% @attr comparable_board_same_brand_evader
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values rossignol_evader=Rossignol_Evader_more_versatile_higher_tier unk_comparable_board_same_brand_evader=Unknown
% @importance 0.7

0.70::true_val(comparable_board_same_brand_evader, rossignol_evader); 0.30::true_val(comparable_board_same_brand_evader, unk_comparable_board_same_brand_evader).

measured(s30, comparable_board_same_brand_evader, rossignol_evader).

all_consistent(comparable_board_same_brand_evader) :-
    consistent(s30, comparable_board_same_brand_evader).

evidence(all_consistent(comparable_board_same_brand_evader)).
query(true_val(comparable_board_same_brand_evader, rossignol_evader)).
query(true_val(comparable_board_same_brand_evader, unk_comparable_board_same_brand_evader)).

0.75::acc(s23, comparable_board_cross_brand_flat).

% @attr comparable_board_cross_brand_flat
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values flat_rocker_freestyle=Flat_rocker_camber_freestyle_beginner_option unk_comparable_board_cross_brand_flat=Unknown
% @importance 0.85

0.75::true_val(comparable_board_cross_brand_flat, flat_rocker_freestyle); 0.25::true_val(comparable_board_cross_brand_flat, unk_comparable_board_cross_brand_flat).

measured(s23, comparable_board_cross_brand_flat, flat_rocker_freestyle).

all_consistent(comparable_board_cross_brand_flat) :-
    consistent(s23, comparable_board_cross_brand_flat).

evidence(all_consistent(comparable_board_cross_brand_flat)).
query(true_val(comparable_board_cross_brand_flat, flat_rocker_freestyle)).
query(true_val(comparable_board_cross_brand_flat, unk_comparable_board_cross_brand_flat)).

0.72::acc(s22, comparable_board_cross_brand_brands).

% @attr comparable_board_cross_brand_brands
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values top_beginner_brands=Nitro_Salomon_Burton_Rossignol_K2_top_beginner_brands unk_comparable_board_cross_brand_brands=Unknown
% @importance 0.8

0.72::true_val(comparable_board_cross_brand_brands, top_beginner_brands); 0.28::true_val(comparable_board_cross_brand_brands, unk_comparable_board_cross_brand_brands).

measured(s22, comparable_board_cross_brand_brands, top_beginner_brands).

all_consistent(comparable_board_cross_brand_brands) :-
    consistent(s22, comparable_board_cross_brand_brands).

evidence(all_consistent(comparable_board_cross_brand_brands)).
query(true_val(comparable_board_cross_brand_brands, top_beginner_brands)).
query(true_val(comparable_board_cross_brand_brands, unk_comparable_board_cross_brand_brands)).

0.50::acc(s0, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values none_entry_level=None_not_listed_entry_level_board unk_construction_material_innovation=Unknown
% @importance 0.3

0.50::true_val(construction_material_innovation, none_entry_level); 0.50::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s0, construction_material_innovation, none_entry_level).

all_consistent(construction_material_innovation) :-
    consistent(s0, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, none_entry_level)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.62::acc(s25, topsheet).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values silkscreened_graphics=Silkscreened_graphics unk_topsheet=Unknown
% @importance 0.5

0.60::true_val(topsheet, silkscreened_graphics); 0.40::true_val(topsheet, unk_topsheet).

measured(s25, topsheet, silkscreened_graphics).

all_consistent(topsheet) :-
    consistent(s25, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, silkscreened_graphics)).
query(true_val(topsheet, unk_topsheet)).

0.78::acc(s6, available_colors).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values orange=Orange unk_available_colors=Unknown
% @importance 0.95

0.78::true_val(available_colors, orange); 0.22::true_val(available_colors, unk_available_colors).

measured(s6, available_colors, orange).

all_consistent(available_colors) :-
    consistent(s6, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, orange)).
query(true_val(available_colors, unk_available_colors)).

0.88::acc(s8, camber_description_general).

% @attr camber_description_general
% @type categorical
% @canonical false
% @original_name camber_description
% @values three_patented_blends=Three_patented_rocker_camber_blends_per_riding_style unk_camber_description_general=Unknown
% @importance 1.0

0.88::true_val(camber_description_general, three_patented_blends); 0.12::true_val(camber_description_general, unk_camber_description_general).

measured(s8, camber_description_general, three_patented_blends).

all_consistent(camber_description_general) :-
    consistent(s8, camber_description_general).

evidence(all_consistent(camber_description_general)).
query(true_val(camber_description_general, three_patented_blends)).
query(true_val(camber_description_general, unk_camber_description_general)).

0.85::acc(s3, wood_core_tiers).
0.90::acc(s8, wood_core_tiers).

% @attr wood_core_tiers
% @type categorical
% @canonical false
% @original_name Wood core tiers available from Rossignol
% @values tiers_3510_4515_5620_6420=3510_4515_5620_6420_District_uses_5620 unk_wood_core_tiers=Unknown
% @importance 0.975

0.92::true_val(wood_core_tiers, tiers_3510_4515_5620_6420); 0.08::true_val(wood_core_tiers, unk_wood_core_tiers).

measured(s3, wood_core_tiers, tiers_3510_4515_5620_6420).
measured(s8, wood_core_tiers, tiers_3510_4515_5620_6420).

all_consistent(wood_core_tiers) :-
    consistent(s8, wood_core_tiers),
    (indep(s3), consistent(s3, wood_core_tiers) ; \+indep(s3)).

evidence(all_consistent(wood_core_tiers)).
query(true_val(wood_core_tiers, tiers_3510_4515_5620_6420)).
query(true_val(wood_core_tiers, unk_wood_core_tiers)).

0.85::acc(s1, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_symmetrical=Twin_symmetrical_flex_front_and_back unk_flex_direction=Unknown
% @importance 1.0

0.85::true_val(flex_direction, twin_symmetrical); 0.15::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, twin_symmetrical).

all_consistent(flex_direction) :-
    consistent(s1, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

0.85::acc(s1, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values standard_4x4=Standard_4x4_insert_compatible_with_most_bindings unk_binding_compatibility=Unknown
% @importance 1.0

0.85::true_val(binding_compatibility, standard_4x4); 0.15::true_val(binding_compatibility, unk_binding_compatibility).

measured(s1, binding_compatibility, standard_4x4).

all_consistent(binding_compatibility) :-
    consistent(s1, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_4x4)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.88::acc(s8, budget_positioning).

% @attr budget_positioning
% @type categorical
% @canonical false
% @original_name Budget positioning
% @values budget_friendly=Budget_friendly_per_manufacturer unk_budget_positioning=Unknown
% @importance 1.0

0.88::true_val(budget_positioning, budget_friendly); 0.12::true_val(budget_positioning, unk_budget_positioning).

measured(s8, budget_positioning, budget_friendly).

all_consistent(budget_positioning) :-
    consistent(s8, budget_positioning).

evidence(all_consistent(budget_positioning)).
query(true_val(budget_positioning, budget_friendly)).
query(true_val(budget_positioning, unk_budget_positioning)).

0.78::acc(s23, price_relative_to_competitors).

% @attr price_relative_to_competitors
% @type categorical
% @canonical false
% @original_name Price relative to competitors
% @values among_lowest_priced=Among_the_lowest_priced_beginner_snowboards unk_price_relative_to_competitors=Unknown
% @importance 0.85

0.78::true_val(price_relative_to_competitors, among_lowest_priced); 0.22::true_val(price_relative_to_competitors, unk_price_relative_to_competitors).

measured(s23, price_relative_to_competitors, among_lowest_priced).

all_consistent(price_relative_to_competitors) :-
    consistent(s23, price_relative_to_competitors).

evidence(all_consistent(price_relative_to_competitors)).
query(true_val(price_relative_to_competitors, among_lowest_priced)).
query(true_val(price_relative_to_competitors, unk_price_relative_to_competitors)).

0.83::acc(s1, positive_aspect).
0.78::acc(s23, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values strong_value=Strong_value_cheapest_beginner_board_reasonable_construction unk_positive_aspect=Unknown
% @importance 0.925

0.88::true_val(positive_aspect, strong_value); 0.12::true_val(positive_aspect, unk_positive_aspect).

measured(s1, positive_aspect, strong_value).
measured(s23, positive_aspect, strong_value).

all_consistent(positive_aspect) :-
    consistent(s1, positive_aspect),
    consistent(s23, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, strong_value)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.83::acc(s1, positive_aspect_durability).

% @attr positive_aspect_durability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values abs_extruded_durable=ABS_sidewalls_extruded_base_tough_durable_for_beginners unk_positive_aspect_durability=Unknown
% @importance 1.0

0.83::true_val(positive_aspect_durability, abs_extruded_durable); 0.17::true_val(positive_aspect_durability, unk_positive_aspect_durability).

measured(s1, positive_aspect_durability, abs_extruded_durable).

all_consistent(positive_aspect_durability) :-
    consistent(s1, positive_aspect_durability).

evidence(all_consistent(positive_aspect_durability)).
query(true_val(positive_aspect_durability, abs_extruded_durable)).
query(true_val(positive_aspect_durability, unk_positive_aspect_durability)).

0.68::acc(s28, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values reduced_rocker=Rocker_dominant_reduces_edge_grip_less_suitable_icy unk_edge_hold=Unknown
% @importance 0.85

0.65::true_val(edge_hold, reduced_rocker); 0.35::true_val(edge_hold, unk_edge_hold).

measured(s28, edge_hold, reduced_rocker).

all_consistent(edge_hold) :-
    consistent(s28, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, reduced_rocker)).
query(true_val(edge_hold, unk_edge_hold)).

0.68::acc(s28, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values soft_flex_low_stability=Soft_flex_rocker_reduces_high_speed_stability unk_negative_aspect=Unknown
% @importance 0.85

0.65::true_val(negative_aspect, soft_flex_low_stability); 0.35::true_val(negative_aspect, unk_negative_aspect).

measured(s28, negative_aspect, soft_flex_low_stability).

all_consistent(negative_aspect) :-
    consistent(s28, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, soft_flex_low_stability)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.68::acc(s28, negative_aspect_not_advanced).

% @attr negative_aspect_not_advanced
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_for_advanced=Not_suitable_for_advanced_aggressive_carving_freeride unk_negative_aspect_not_advanced=Unknown
% @importance 0.85

0.65::true_val(negative_aspect_not_advanced, not_for_advanced); 0.35::true_val(negative_aspect_not_advanced, unk_negative_aspect_not_advanced).

measured(s28, negative_aspect_not_advanced, not_for_advanced).

all_consistent(negative_aspect_not_advanced) :-
    consistent(s28, negative_aspect_not_advanced).

evidence(all_consistent(negative_aspect_not_advanced)).
query(true_val(negative_aspect_not_advanced, not_for_advanced)).
query(true_val(negative_aspect_not_advanced, unk_negative_aspect_not_advanced)).

0.50::acc(s0, not_foldable).

% @attr not_foldable
% @type categorical
% @canonical false
% @original_name Not foldable for travel
% @values standard_dimensions=Standard_snowboard_dimensions_requires_board_bag unk_not_foldable=Unknown
% @importance 0.3

0.50::true_val(not_foldable, standard_dimensions); 0.50::true_val(not_foldable, unk_not_foldable).

measured(s0, not_foldable, standard_dimensions).

all_consistent(not_foldable) :-
    consistent(s0, not_foldable).

evidence(all_consistent(not_foldable)).
query(true_val(not_foldable, standard_dimensions)).
query(true_val(not_foldable, unk_not_foldable)).