0.15::indep(s_emp).
0.15::indep(s_bnz).
0.20::indep(s_eri).
0.20::indep(s_tac).
0.15::indep(s_rhy).
0.15::indep(s_bla).
0.20::indep(s_hou).
0.25::indep(s_evo).
0.25::indep(s_bac).
0.30::indep(s_rei).
0.15::indep(s_eas).
0.15::indep(s_skp).
0.15::indep(s_mel).
0.15::indep(s_spl).
0.15::indep(s_aus).
0.15::indep(s_sal).
0.15::indep(s_alp).
0.15::indep(s_amz).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.85

0.90::acc(s_emp, brand).
0.85::acc(s_bnz, brand).

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).

measured(s_emp, brand, burton).
measured(s_bnz, brand, burton).

all_consistent(brand) :-
    (indep(s_emp), consistent(s_emp, brand) ; \+indep(s_emp)),
    (indep(s_bnz), consistent(s_bnz, brand) ; \+indep(s_bnz)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values good_company=Good_Company unk_model_name=Unknown
% @importance 0.85

0.90::acc(s_emp, model_name).
0.85::acc(s_bnz, model_name).

0.97::true_val(model_name, good_company); 0.03::true_val(model_name, unk_model_name).

measured(s_emp, model_name, good_company).
measured(s_bnz, model_name, good_company).

all_consistent(model_name) :-
    (indep(s_emp), consistent(s_emp, model_name) ; \+indep(s_emp)),
    (indep(s_bnz), consistent(s_bnz, model_name) ; \+indep(s_bnz)).

evidence(all_consistent(model_name)).
query(true_val(model_name, good_company)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.85

0.90::acc(s_emp, model_year).
0.85::acc(s_bnz, model_year).

0.97::true_val(model_year, y2027); 0.03::true_val(model_year, unk_model_year).

measured(s_emp, model_year, y2027).
measured(s_bnz, model_year, y2027).

all_consistent(model_year) :-
    (indep(s_emp), consistent(s_emp, model_year) ; \+indep(s_emp)),
    (indep(s_bnz), consistent(s_bnz, model_year) ; \+indep(s_bnz)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr full_product_name
% @type categorical
% @canonical false
% @original_name Full product name on manufacturer site
% @values burton_good_company_camber_snowboard=Burton_Good_Company_Camber_Snowboard unk_full_product_name=Unknown
% @importance 1.0

0.95::acc(s_bur, full_product_name).

0.95::true_val(full_product_name, burton_good_company_camber_snowboard); 0.05::true_val(full_product_name, unk_full_product_name).

measured(s_bur, full_product_name, burton_good_company_camber_snowboard).

all_consistent(full_product_name) :- consistent(s_bur, full_product_name).

evidence(all_consistent(full_product_name)).
query(true_val(full_product_name, burton_good_company_camber_snowboard)).
query(true_val(full_product_name, unk_full_product_name)).

% @attr sku_merchant
% @type categorical
% @canonical false
% @original_name SKU (merchant)
% @values sku_2359513fafrg145=2359513FAFRG145 unk_sku_merchant=Unknown
% @importance 0.85

0.93::acc(s_mel, sku_merchant).

0.93::true_val(sku_merchant, sku_2359513fafrg145); 0.07::true_val(sku_merchant, unk_sku_merchant).

measured(s_mel, sku_merchant, sku_2359513fafrg145).

all_consistent(sku_merchant) :- consistent(s_mel, sku_merchant).

evidence(all_consistent(sku_merchant)).
query(true_val(sku_merchant, sku_2359513fafrg145)).
query(true_val(sku_merchant, unk_sku_merchant)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y1977_jake_burton_vermont=1977_Jake_Burton_Carpenter_Vermont unk_manufacturer_founded=Unknown
% @importance 0.4

0.85::acc(s_wik, manufacturer_founded).

0.76::true_val(manufacturer_founded, y1977_jake_burton_vermont); 0.24::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s_wik, manufacturer_founded, y1977_jake_burton_vermont).

all_consistent(manufacturer_founded) :- consistent(s_wik, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y1977_jake_burton_vermont)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values burlington_vt_usa=Burlington_Vermont_USA unk_manufacturer_headquarters=Unknown
% @importance 0.35

0.84::acc(s_wik, manufacturer_headquarters).

0.72::true_val(manufacturer_headquarters, burlington_vt_usa); 0.28::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s_wik, manufacturer_headquarters, burlington_vt_usa).

all_consistent(manufacturer_headquarters) :- consistent(s_wik, manufacturer_headquarters).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, burlington_vt_usa)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

% @attr manufacturer_global_offices
% @type categorical
% @canonical false
% @original_name Manufacturer global offices
% @values au_at_ca_cn_jp_us_kr=AU_AT_CA_CN_JP_US_KR unk_manufacturer_global_offices=Unknown
% @importance 0.3

0.95::acc(s_bur, manufacturer_global_offices).

0.90::true_val(manufacturer_global_offices, au_at_ca_cn_jp_us_kr); 0.10::true_val(manufacturer_global_offices, unk_manufacturer_global_offices).

measured(s_bur, manufacturer_global_offices, au_at_ca_cn_jp_us_kr).

all_consistent(manufacturer_global_offices) :- consistent(s_bur, manufacturer_global_offices).

evidence(all_consistent(manufacturer_global_offices)).
query(true_val(manufacturer_global_offices, au_at_ca_cn_jp_us_kr)).
query(true_val(manufacturer_global_offices, unk_manufacturer_global_offices)).

% @attr manufacturer_ownership
% @type categorical
% @canonical false
% @original_name Manufacturer ownership
% @values private_carpenter_family=Private_Donna_Carpenter_family unk_manufacturer_ownership=Unknown
% @importance 0.25

0.95::acc(s_bur, manufacturer_ownership).

0.90::true_val(manufacturer_ownership, private_carpenter_family); 0.10::true_val(manufacturer_ownership, unk_manufacturer_ownership).

measured(s_bur, manufacturer_ownership, private_carpenter_family).

all_consistent(manufacturer_ownership) :- consistent(s_bur, manufacturer_ownership).

evidence(all_consistent(manufacturer_ownership)).
query(true_val(manufacturer_ownership, private_carpenter_family)).
query(true_val(manufacturer_ownership, unk_manufacturer_ownership)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corp=B_Corp_certified unk_sustainability_certification=Unknown
% @importance 0.4

0.90::acc(s_bur, sustainability_certification).

0.71::true_val(sustainability_certification, b_corp); 0.29::true_val(sustainability_certification, unk_sustainability_certification).

measured(s_bur, sustainability_certification, b_corp).

all_consistent(sustainability_certification) :- consistent(s_bur, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corp)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.5

0.85::acc(s_eri, gender).

0.63::true_val(gender, unisex); 0.37::true_val(gender, unk_gender).

measured(s_eri, gender, unisex).

all_consistent(gender) :-
    (indep(s_eri), consistent(s_eri, gender) ; \+indep(s_eri)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr model_first_available_year
% @type categorical
% @canonical false
% @original_name model_first_available_year
% @values y2023=2023_season unk_model_first_available_year=Unknown
% @importance 0.6

0.93::acc(s_bur, model_first_available_year).

0.81::true_val(model_first_available_year, y2023); 0.19::true_val(model_first_available_year, unk_model_first_available_year).

measured(s_bur, model_first_available_year, y2023).

all_consistent(model_first_available_year) :- consistent(s_bur, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2023)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical true
% @original_name topsheet_appearance_description
% @values dog_themed_posie=Dog_themed_portrait_of_Posie unk_topsheet_appearance_description=Unknown
% @importance 0.2

0.80::acc(s_emp, topsheet_appearance_description).

0.67::true_val(topsheet_appearance_description, dog_themed_posie); 0.33::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s_emp, topsheet_appearance_description, dog_themed_posie).

all_consistent(topsheet_appearance_description) :-
    (indep(s_emp), consistent(s_emp, topsheet_appearance_description) ; \+indep(s_emp)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, dog_themed_posie)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values china_some_austria=China_with_some_Austria china_only=China_only unk_manufacturing_location_current=Unknown
% @importance 0.6

0.82::acc(s_sp, manufacturing_location_current).
0.80::acc(s_vtd, manufacturing_location_current).
0.88::acc(s_tgr, manufacturing_location_current).

0.40::true_val(manufacturing_location_current, china_some_austria); 0.55::true_val(manufacturing_location_current, china_only); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s_sp, manufacturing_location_current, china_some_austria).
measured(s_vtd, manufacturing_location_current, china_some_austria).
measured(s_tgr, manufacturing_location_current, china_only).

all_consistent(manufacturing_location_current) :-
    consistent(s_sp, manufacturing_location_current),
    consistent(s_vtd, manufacturing_location_current),
    consistent(s_tgr, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, china_some_austria)).
query(true_val(manufacturing_location_current, china_only)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr prototyping_facility
% @type categorical
% @canonical false
% @original_name Burton prototyping facility
% @values vermont_usa=Vermont_USA unk_prototyping_facility=Unknown
% @importance 0.35

0.82::acc(s_sp, prototyping_facility).

0.63::true_val(prototyping_facility, vermont_usa); 0.37::true_val(prototyping_facility, unk_prototyping_facility).

measured(s_sp, prototyping_facility, vermont_usa).

all_consistent(prototyping_facility) :- consistent(s_sp, prototyping_facility).

evidence(all_consistent(prototyping_facility)).
query(true_val(prototyping_facility, vermont_usa)).
query(true_val(prototyping_facility, unk_prototyping_facility)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical false
% @original_name manufacturing_location_prior
% @values vt_then_austria_then_china=Vermont_until_2010_then_Austria_then_China unk_manufacturing_location_prior=Unknown
% @importance 0.325

0.84::acc(s_wik, manufacturing_location_prior).
0.93::acc(s_bur, manufacturing_location_prior).

0.95::true_val(manufacturing_location_prior, vt_then_austria_then_china); 0.05::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

measured(s_wik, manufacturing_location_prior, vt_then_austria_then_china).
measured(s_bur, manufacturing_location_prior, vt_then_austria_then_china).

all_consistent(manufacturing_location_prior) :-
    consistent(s_wik, manufacturing_location_prior),
    consistent(s_bur, manufacturing_location_prior).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, vt_then_austria_then_china)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_c124994=FSC_C124994_certified unk_sustainability_certification_fsc=Unknown
% @importance 0.5

0.82::acc(s_tac, sustainability_certification_fsc).

0.71::true_val(sustainability_certification_fsc, fsc_c124994); 0.29::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s_tac, sustainability_certification_fsc, fsc_c124994).

all_consistent(sustainability_certification_fsc) :-
    (indep(s_tac), consistent(s_tac, sustainability_certification_fsc) ; \+indep(s_tac)).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_c124994)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr sustainability_certification_fla
% @type categorical
% @canonical false
% @original_name sustainability_certification (FLA)
% @values fla_accredited=FLA_accredited unk_sustainability_certification_fla=Unknown
% @importance 0.45

0.84::acc(s_vtd, sustainability_certification_fla).

0.72::true_val(sustainability_certification_fla, fla_accredited); 0.28::true_val(sustainability_certification_fla, unk_sustainability_certification_fla).

measured(s_vtd, sustainability_certification_fla, fla_accredited).

all_consistent(sustainability_certification_fla) :- consistent(s_vtd, sustainability_certification_fla).

evidence(all_consistent(sustainability_certification_fla)).
query(true_val(sustainability_certification_fla, fla_accredited)).
query(true_val(sustainability_certification_fla, unk_sustainability_certification_fla)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain park_freestyle=Park_and_Freestyle park_first_twin=Park_first_twin
% @importance 0.88

0.88::acc(s_mel, board_category).
0.93::acc(s_bur, board_category).
0.82::acc(s_rhy, board_category).

0.30::true_val(board_category, freestyle_all_mountain); 0.40::true_val(board_category, park_freestyle); 0.30::true_val(board_category, park_first_twin).

measured(s_mel, board_category, freestyle_all_mountain).
measured(s_bur, board_category, park_freestyle).
measured(s_rhy, board_category, park_first_twin).

all_consistent(board_category) :-
    (indep(s_mel), consistent(s_mel, board_category) ; \+indep(s_mel)),
    consistent(s_bur, board_category),
    (indep(s_rhy), consistent(s_rhy, board_category) ; \+indep(s_rhy)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, park_freestyle)).
query(true_val(board_category, park_first_twin)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values all_mountain_freestyle=All_Mountain_Freestyle unk_riding_style=Unknown
% @importance 0.85

0.88::acc(s_tgr, riding_style).

0.76::true_val(riding_style, all_mountain_freestyle); 0.24::true_val(riding_style, unk_riding_style).

measured(s_tgr, riding_style, all_mountain_freestyle).

all_consistent(riding_style) :- consistent(s_tgr, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mountain_freestyle)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_all_mtn_groomers=Park_all_mountain_groomed_runs unk_terrain_suitability=Unknown
% @importance 0.85

0.88::acc(s_mel, terrain_suitability).

0.90::true_val(terrain_suitability, park_all_mtn_groomers); 0.10::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_mel, terrain_suitability, park_all_mtn_groomers).

all_consistent(terrain_suitability) :-
    (indep(s_mel), consistent(s_mel, terrain_suitability) ; \+indep(s_mel)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_all_mtn_groomers)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin_symmetrical unk_shape=Unknown
% @importance 0.85

0.85::acc(s_eri, shape).

0.67::true_val(shape, true_twin); 0.33::true_val(shape, unk_shape).

measured(s_eri, shape, true_twin).

all_consistent(shape) :-
    (indep(s_eri), consistent(s_eri, shape) ; \+indep(s_eri)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values twin_flex=Twin_Flex_symmetrical unk_flex_direction=Unknown
% @importance 0.75

0.80::acc(s_bom, flex_direction).

0.59::true_val(flex_direction, twin_flex); 0.41::true_val(flex_direction, unk_flex_direction).

measured(s_bom, flex_direction, twin_flex).

all_consistent(flex_direction) :- consistent(s_bom, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values traditional_camber=Traditional_Camber unk_camber_type=Unknown
% @importance 0.9

0.82::acc(s_bom, camber_type).

0.59::true_val(camber_type, traditional_camber); 0.41::true_val(camber_type, unk_camber_type).

measured(s_bom, camber_type, traditional_camber).

all_consistent(camber_type) :- consistent(s_bom, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, traditional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v0=0.0 unk_setback=Unknown
% @importance 0.775

0.93::acc(s_mel, setback).
0.88::acc(s_tgr, setback).

0.97::true_val(setback, v0); 0.03::true_val(setback, unk_setback).

measured(s_mel, setback, v0).
measured(s_tgr, setback, v0).

all_consistent(setback) :-
    (indep(s_mel), consistent(s_mel, setback) ; \+indep(s_mel)),
    consistent(s_tgr, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v3_5=3.5 v4=4.0 v5_5=5.5
% @importance 0.9

0.85::acc(s_mel, flex_rating_10).
0.78::acc(s_btw, flex_rating_10).
0.85::acc(s_sp, flex_rating_10).

0.35::true_val(flex_rating_10, v3_5); 0.35::true_val(flex_rating_10, v4); 0.30::true_val(flex_rating_10, v5_5).

measured(s_mel, flex_rating_10, v3_5).
measured(s_btw, flex_rating_10, v5_5).
measured(s_sp, flex_rating_10, v4).

all_consistent(flex_rating_10) :-
    (indep(s_mel), consistent(s_mel, flex_rating_10) ; \+indep(s_mel)),
    consistent(s_btw, flex_rating_10),
    consistent(s_sp, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v3_5)).
query(true_val(flex_rating_10, v4)).
query(true_val(flex_rating_10, v5_5)).

% @attr flex_rating_10_manufacturer
% @type categorical
% @canonical false
% @original_name flex_rating_10_manufacturer
% @values range_2_to_5=2_to_5_out_of_10_Playful_to_Medium unk_flex_rating_10_manufacturer=Unknown
% @importance 0.9

0.80::acc(s_bla, flex_rating_10_manufacturer).

0.67::true_val(flex_rating_10_manufacturer, range_2_to_5); 0.33::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s_bla, flex_rating_10_manufacturer, range_2_to_5).

all_consistent(flex_rating_10_manufacturer) :-
    (indep(s_bla), consistent(s_bla, flex_rating_10_manufacturer) ; \+indep(s_bla)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, range_2_to_5)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values stiffer_than_catalog=Stiffer_than_catalog_suggests unk_flex_feel=Unknown
% @importance 0.8

0.80::acc(s_btw, flex_feel).

0.57::true_val(flex_feel, stiffer_than_catalog); 0.43::true_val(flex_feel, unk_flex_feel).

measured(s_btw, flex_feel, stiffer_than_catalog).

all_consistent(flex_feel) :- consistent(s_btw, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiffer_than_catalog)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax=Triax_Fiberglass biax=Biax_Fiberglass
% @importance 0.8

0.82::acc(s_hou, laminate).
0.84::acc(s_evo, laminate).
0.82::acc(s_bac, laminate).
0.86::acc(s_rei, laminate).
0.75::acc(s_bla, laminate).
0.72::acc(s_eas, laminate).
0.65::acc(s_skp, laminate).

0.70::true_val(laminate, triax); 0.30::true_val(laminate, biax).

measured(s_hou, laminate, triax).
measured(s_evo, laminate, triax).
measured(s_bac, laminate, triax).
measured(s_rei, laminate, triax).
measured(s_bla, laminate, biax).
measured(s_eas, laminate, biax).
measured(s_skp, laminate, biax).

all_consistent(laminate) :-
    (indep(s_hou), consistent(s_hou, laminate) ; \+indep(s_hou)),
    (indep(s_evo), consistent(s_evo, laminate) ; \+indep(s_evo)),
    (indep(s_bac), consistent(s_bac, laminate) ; \+indep(s_bac)),
    (indep(s_rei), consistent(s_rei, laminate) ; \+indep(s_rei)),
    (indep(s_bla), consistent(s_bla, laminate) ; \+indep(s_bla)),
    (indep(s_eas), consistent(s_eas, laminate) ; \+indep(s_eas)),
    (indep(s_skp), consistent(s_skp, laminate) ; \+indep(s_skp)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax)).
query(true_val(laminate, biax)).

% @attr construction_material_innovation
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values carbon_i_beam_triax=Carbon_I_Beam_backbone_on_Triax unk_construction_material_innovation=Unknown
% @importance 0.8

0.78::acc(s_mel, construction_material_innovation).

0.59::true_val(construction_material_innovation, carbon_i_beam_triax); 0.41::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s_mel, construction_material_innovation, carbon_i_beam_triax).

all_consistent(construction_material_innovation) :-
    (indep(s_mel), consistent(s_mel, construction_material_innovation) ; \+indep(s_mel)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_i_beam_triax)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_800g=FSC_Super_Fly_800G_dual_species unk_core_material=Unknown
% @importance 0.85

0.82::acc(s_bla, core_material).

0.67::true_val(core_material, super_fly_800g); 0.33::true_val(core_material, unk_core_material).

measured(s_bla, core_material, super_fly_800g).

all_consistent(core_material) :-
    (indep(s_bla), consistent(s_bla, core_material) ; \+indep(s_bla)).

evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_800g)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_egd
% @type categorical
% @canonical false
% @original_name core_material (Dualzone EGD)
% @values dualzone_egd=Dualzone_EGD_perpendicular_edge_grain unk_core_material_egd=Unknown
% @importance 0.75

0.82::acc(s_bla, core_material_egd).

0.67::true_val(core_material_egd, dualzone_egd); 0.33::true_val(core_material_egd, unk_core_material_egd).

measured(s_bla, core_material_egd, dualzone_egd).

all_consistent(core_material_egd) :-
    (indep(s_bla), consistent(s_bla, core_material_egd) ; \+indep(s_bla)).

evidence(all_consistent(core_material_egd)).
query(true_val(core_material_egd, dualzone_egd)).
query(true_val(core_material_egd, unk_core_material_egd)).

% @attr core_material_squeezebox
% @type categorical
% @canonical false
% @original_name core_material (Squeezebox Low)
% @values squeezebox_low=Squeezebox_Low_stiffer_outside_feet unk_core_material_squeezebox=Unknown
% @importance 0.75

0.82::acc(s_bla, core_material_squeezebox).

0.67::true_val(core_material_squeezebox, squeezebox_low); 0.33::true_val(core_material_squeezebox, unk_core_material_squeezebox).

measured(s_bla, core_material_squeezebox, squeezebox_low).

all_consistent(core_material_squeezebox) :-
    (indep(s_bla), consistent(s_bla, core_material_squeezebox) ; \+indep(s_bla)).

evidence(all_consistent(core_material_squeezebox)).
query(true_val(core_material_squeezebox, squeezebox_low)).
query(true_val(core_material_squeezebox, unk_core_material_squeezebox)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based_50pct_less_carbon unk_resin=Unknown
% @importance 0.5

0.82::acc(s_tac, resin).

0.71::true_val(resin, super_sap_epoxy); 0.29::true_val(resin, unk_resin).

measured(s_tac, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(s_tac), consistent(s_tac, resin) ; \+indep(s_tac)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered=Sintered_durable_porous unk_base_material=Unknown
% @importance 0.75

0.80::acc(s_bom, base_material).

0.62::true_val(base_material, sintered); 0.38::true_val(base_material, unk_base_material).

measured(s_bom, base_material, sintered).

all_consistent(base_material) :- consistent(s_bom, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered)).
query(true_val(base_material, unk_base_material)).

% @attr flex_conditioning
% @type categorical
% @canonical false
% @original_name Flex conditioning
% @values infinite_ride=Infinite_Ride_factory_broken_in unk_flex_conditioning=Unknown
% @importance 0.65

0.85::acc(s_evo, flex_conditioning).

0.76::true_val(flex_conditioning, infinite_ride); 0.24::true_val(flex_conditioning, unk_flex_conditioning).

measured(s_evo, flex_conditioning, infinite_ride).

all_consistent(flex_conditioning) :-
    (indep(s_evo), consistent(s_evo, flex_conditioning) ; \+indep(s_evo)).

evidence(all_consistent(flex_conditioning)).
query(true_val(flex_conditioning, infinite_ride)).
query(true_val(flex_conditioning, unk_flex_conditioning)).

% @attr tip_tail_technology
% @type categorical
% @canonical false
% @original_name Tip/tail technology
% @values pro_tip=Pro_Tip_tapered_reduced_swing_weight unk_tip_tail_technology=Unknown
% @importance 0.65

0.85::acc(s_evo, tip_tail_technology).

0.76::true_val(tip_tail_technology, pro_tip); 0.24::true_val(tip_tail_technology, unk_tip_tail_technology).

measured(s_evo, tip_tail_technology, pro_tip).

all_consistent(tip_tail_technology) :-
    (indep(s_evo), consistent(s_evo, tip_tail_technology) ; \+indep(s_evo)).

evidence(all_consistent(tip_tail_technology)).
query(true_val(tip_tail_technology, pro_tip)).
query(true_val(tip_tail_technology, unk_tip_tail_technology)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_all_bindings_compatible unk_mounting_pattern=Unknown
% @importance 0.85

0.85::acc(s_evo, mounting_pattern).

0.76::true_val(mounting_pattern, the_channel); 0.24::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_evo, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    (indep(s_evo), consistent(s_evo, mounting_pattern) ; \+indep(s_evo)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_145_148_152_155_159_155w_159w=145_148_152_155_159_155W_159W unk_available_sizes=Unknown
% @importance 0.85

0.93::acc(s_mel, available_sizes).

0.93::true_val(available_sizes, sizes_145_148_152_155_159_155w_159w); 0.07::true_val(available_sizes, unk_available_sizes).

measured(s_mel, available_sizes, sizes_145_148_152_155_159_155w_159w).

all_consistent(available_sizes) :-
    (indep(s_mel), consistent(s_mel, available_sizes) ; \+indep(s_mel)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_145_148_152_155_159_155w_159w)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_135
% @type categorical
% @canonical false
% @original_name available_sizes (135cm)
% @values includes_135=135cm_also_available unk_available_sizes_135=Unknown
% @importance 0.6

0.78::acc(s_eri, available_sizes_135).
0.75::acc(s_btw, available_sizes_135).

0.95::true_val(available_sizes_135, includes_135); 0.05::true_val(available_sizes_135, unk_available_sizes_135).

measured(s_eri, available_sizes_135, includes_135).
measured(s_btw, available_sizes_135, includes_135).

all_consistent(available_sizes_135) :-
    (indep(s_eri), consistent(s_eri, available_sizes_135) ; \+indep(s_eri)),
    consistent(s_btw, available_sizes_135).

evidence(all_consistent(available_sizes_135)).
query(true_val(available_sizes_135, includes_135)).
query(true_val(available_sizes_135, unk_available_sizes_135)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.93::acc(s_mel, width_options).

0.93::true_val(width_options, standard_wide); 0.07::true_val(width_options, unk_width_options).

measured(s_mel, width_options, standard_wide).

all_consistent(width_options) :-
    (indep(s_mel), consistent(s_mel, width_options) ; \+indep(s_mel)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_wide)).
query(true_val(width_options, unk_width_options)).

% @attr effective_edge_145
% @type numeric
% @canonical false
% @original_name Effective edge 145cm
% @unit cm
% @values v108_5=108.5 unk_effective_edge_145=Unknown
% @importance 0.85

0.93::acc(s_mel, effective_edge_145).

0.93::true_val(effective_edge_145, v108_5); 0.07::true_val(effective_edge_145, unk_effective_edge_145).

measured(s_mel, effective_edge_145, v108_5).

all_consistent(effective_edge_145) :-
    (indep(s_mel), consistent(s_mel, effective_edge_145) ; \+indep(s_mel)).

evidence(all_consistent(effective_edge_145)).
query(true_val(effective_edge_145, v108_5)).
query(true_val(effective_edge_145, unk_effective_edge_145)).

% @attr sidecut_radius_size_145
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (145cm)
% @unit m
% @values v7_1=7.1 unk_sidecut_radius_size_145=Unknown
% @importance 0.85

0.93::acc(s_mel, sidecut_radius_size_145).

0.93::true_val(sidecut_radius_size_145, v7_1); 0.07::true_val(sidecut_radius_size_145, unk_sidecut_radius_size_145).

measured(s_mel, sidecut_radius_size_145, v7_1).

all_consistent(sidecut_radius_size_145) :-
    (indep(s_mel), consistent(s_mel, sidecut_radius_size_145) ; \+indep(s_mel)).

evidence(all_consistent(sidecut_radius_size_145)).
query(true_val(sidecut_radius_size_145, v7_1)).
query(true_val(sidecut_radius_size_145, unk_sidecut_radius_size_145)).

% @attr tip_tail_width_size_145
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (145cm)
% @unit cm
% @values v28_3=28.3 unk_tip_tail_width_size_145=Unknown
% @importance 0.85

0.93::acc(s_mel, tip_tail_width_size_145).

0.93::true_val(tip_tail_width_size_145, v28_3); 0.07::true_val(tip_tail_width_size_145, unk_tip_tail_width_size_145).

measured(s_mel, tip_tail_width_size_145, v28_3).

all_consistent(tip_tail_width_size_145) :-
    (indep(s_mel), consistent(s_mel, tip_tail_width_size_145) ; \+indep(s_mel)).

evidence(all_consistent(tip_tail_width_size_145)).
query(true_val(tip_tail_width_size_145, v28_3)).
query(true_val(tip_tail_width_size_145, unk_tip_tail_width_size_145)).

% @attr waist_width_145
% @type numeric
% @canonical false
% @original_name Waist width 145cm
% @unit cm
% @values v24_5=24.5 unk_waist_width_145=Unknown
% @importance 0.85

0.93::acc(s_mel, waist_width_145).

0.93::true_val(waist_width_145, v24_5); 0.07::true_val(waist_width_145, unk_waist_width_145).

measured(s_mel, waist_width_145, v24_5).

all_consistent(waist_width_145) :-
    (indep(s_mel), consistent(s_mel, waist_width_145) ; \+indep(s_mel)).

evidence(all_consistent(waist_width_145)).
query(true_val(waist_width_145, v24_5)).
query(true_val(waist_width_145, unk_waist_width_145)).

% @attr stance_width_range_size_145
% @type numeric
% @canonical false
% @original_name stance_width_range_size (145cm)
% @unit cm
% @values v50_5=50.5 unk_stance_width_range_size_145=Unknown
% @importance 0.85

0.93::acc(s_mel, stance_width_range_size_145).

0.93::true_val(stance_width_range_size_145, v50_5); 0.07::true_val(stance_width_range_size_145, unk_stance_width_range_size_145).

measured(s_mel, stance_width_range_size_145, v50_5).

all_consistent(stance_width_range_size_145) :-
    (indep(s_mel), consistent(s_mel, stance_width_range_size_145) ; \+indep(s_mel)).

evidence(all_consistent(stance_width_range_size_145)).
query(true_val(stance_width_range_size_145, v50_5)).
query(true_val(stance_width_range_size_145, unk_stance_width_range_size_145)).

% @attr recommended_weight_range_size_145
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (145cm)
% @values w45_68kg=45_68kg_100_150lb unk_recommended_weight_range_size_145=Unknown
% @importance 0.85

0.93::acc(s_mel, recommended_weight_range_size_145).

0.93::true_val(recommended_weight_range_size_145, w45_68kg); 0.07::true_val(recommended_weight_range_size_145, unk_recommended_weight_range_size_145).

measured(s_mel, recommended_weight_range_size_145, w45_68kg).

all_consistent(recommended_weight_range_size_145) :-
    (indep(s_mel), consistent(s_mel, recommended_weight_range_size_145) ; \+indep(s_mel)).

evidence(all_consistent(recommended_weight_range_size_145)).
query(true_val(recommended_weight_range_size_145, w45_68kg)).
query(true_val(recommended_weight_range_size_145, unk_recommended_weight_range_size_145)).

% @attr effective_edge_148
% @type numeric
% @canonical false
% @original_name Effective edge 148cm
% @unit cm
% @values v111_5=111.5 unk_effective_edge_148=Unknown
% @importance 0.85

0.93::acc(s_mel, effective_edge_148).

0.93::true_val(effective_edge_148, v111_5); 0.07::true_val(effective_edge_148, unk_effective_edge_148).

measured(s_mel, effective_edge_148, v111_5).

all_consistent(effective_edge_148) :-
    (indep(s_mel), consistent(s_mel, effective_edge_148) ; \+indep(s_mel)).

evidence(all_consistent(effective_edge_148)).
query(true_val(effective_edge_148, v111_5)).
query(true_val(effective_edge_148, unk_effective_edge_148)).

% @attr sidecut_radius_size_148
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (148cm)
% @unit m
% @values v7_3=7.3 unk_sidecut_radius_size_148=Unknown
% @importance 0.85

0.93::acc(s_mel, sidecut_radius_size_148).

0.93::true_val(sidecut_radius_size_148, v7_3); 0.07::true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148).

measured(s_mel, sidecut_radius_size_148, v7_3).

all_consistent(sidecut_radius_size_148) :-
    (indep(s_mel), consistent(s_mel, sidecut_radius_size_148) ; \+indep(s_mel)).

evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v7_3)).
query(true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148)).

% @attr waist_width_148
% @type numeric
% @canonical false
% @original_name Waist width 148cm
% @unit cm
% @values v24_8=24.8 unk_waist_width_148=Unknown
% @importance 0.85

0.93::acc(s_mel, waist_width_148).

0.93::true_val(waist_width_148, v24_8); 0.07::true_val(waist_width_148, unk_waist_width_148).

measured(s_mel, waist_width_148, v24_8).

all_consistent(waist_width_148) :-
    (indep(s_mel), consistent(s_mel, waist_width_148) ; \+indep(s_mel)).

evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v24_8)).
query(true_val(waist_width_148, unk_waist_width_148)).

% @attr recommended_weight_range_size_148
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (148cm)
% @values w45_68kg=45_68kg unk_recommended_weight_range_size_148=Unknown
% @importance 0.85

0.93::acc(s_mel, recommended_weight_range_size_148).

0.93::true_val(recommended_weight_range_size_148, w45_68kg); 0.07::true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148).

measured(s_mel, recommended_weight_range_size_148, w45_68kg).

all_consistent(recommended_weight_range_size_148) :-
    (indep(s_mel), consistent(s_mel, recommended_weight_range_size_148) ; \+indep(s_mel)).

evidence(all_consistent(recommended_weight_range_size_148)).
query(true_val(recommended_weight_range_size_148, w45_68kg)).
query(true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148)).

% @attr effective_edge_152
% @type numeric
% @canonical false
% @original_name Effective edge 152cm
% @unit cm
% @values v115_5=115.5 unk_effective_edge_152=Unknown
% @importance 0.85

0.93::acc(s_mel, effective_edge_152).

0.93::true_val(effective_edge_152, v115_5); 0.07::true_val(effective_edge_152, unk_effective_edge_152).

measured(s_mel, effective_edge_152, v115_5).

all_consistent(effective_edge_152) :-
    (indep(s_mel), consistent(s_mel, effective_edge_152) ; \+indep(s_mel)).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v115_5)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

% @attr sidecut_radius_size_152
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (152cm)
% @unit m
% @values v7_6=7.6 unk_sidecut_radius_size_152=Unknown
% @importance 0.85

0.93::acc(s_mel, sidecut_radius_size_152).

0.93::true_val(sidecut_radius_size_152, v7_6); 0.07::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

measured(s_mel, sidecut_radius_size_152, v7_6).

all_consistent(sidecut_radius_size_152) :-
    (indep(s_mel), consistent(s_mel, sidecut_radius_size_152) ; \+indep(s_mel)).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v7_6)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

% @attr waist_width_152
% @type numeric
% @canonical false
% @original_name Waist width 152cm
% @unit cm
% @values v25_0=25.0 unk_waist_width_152=Unknown
% @importance 0.85

0.93::acc(s_mel, waist_width_152).

0.93::true_val(waist_width_152, v25_0); 0.07::true_val(waist_width_152, unk_waist_width_152).

measured(s_mel, waist_width_152, v25_0).

all_consistent(waist_width_152) :-
    (indep(s_mel), consistent(s_mel, waist_width_152) ; \+indep(s_mel)).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v25_0)).
query(true_val(waist_width_152, unk_waist_width_152)).

% @attr recommended_weight_range_size_152
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (152cm)
% @values w54_82kg=54_82kg unk_recommended_weight_range_size_152=Unknown
% @importance 0.85

0.93::acc(s_mel, recommended_weight_range_size_152).

0.93::true_val(recommended_weight_range_size_152, w54_82kg); 0.07::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(s_mel, recommended_weight_range_size_152, w54_82kg).

all_consistent(recommended_weight_range_size_152) :-
    (indep(s_mel), consistent(s_mel, recommended_weight_range_size_152) ; \+indep(s_mel)).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, w54_82kg)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

% @attr effective_edge_155
% @type numeric
% @canonical false
% @original_name Effective edge 155cm
% @unit cm
% @values v118_5=118.5 unk_effective_edge_155=Unknown
% @importance 0.85

0.93::acc(s_mel, effective_edge_155).

0.93::true_val(effective_edge_155, v118_5); 0.07::true_val(effective_edge_155, unk_effective_edge_155).

measured(s_mel, effective_edge_155, v118_5).

all_consistent(effective_edge_155) :-
    (indep(s_mel), consistent(s_mel, effective_edge_155) ; \+indep(s_mel)).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v118_5)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_8=7.8 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::acc(s_mel, sidecut_radius_size).

0.93::true_val(sidecut_radius_size, v7_8); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_mel, sidecut_radius_size, v7_8).

all_consistent(sidecut_radius_size) :-
    (indep(s_mel), consistent(s_mel, sidecut_radius_size) ; \+indep(s_mel)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name Waist width 155cm
% @unit cm
% @values v25_2=25.2 unk_waist_width_155=Unknown
% @importance 0.85

0.93::acc(s_mel, waist_width_155).

0.93::true_val(waist_width_155, v25_2); 0.07::true_val(waist_width_155, unk_waist_width_155).

measured(s_mel, waist_width_155, v25_2).

all_consistent(waist_width_155) :-
    (indep(s_mel), consistent(s_mel, waist_width_155) ; \+indep(s_mel)).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_2)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w54_82kg=54_82kg_120_180lb unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::acc(s_mel, recommended_weight_range_size).

0.93::true_val(recommended_weight_range_size, w54_82kg); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_mel, recommended_weight_range_size, w54_82kg).

all_consistent(recommended_weight_range_size) :-
    (indep(s_mel), consistent(s_mel, recommended_weight_range_size) ; \+indep(s_mel)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w54_82kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_159
% @type numeric
% @canonical false
% @original_name Effective edge 159cm
% @unit cm
% @values v122_5=122.5 unk_effective_edge_159=Unknown
% @importance 0.85

0.93::acc(s_mel, effective_edge_159).

0.93::true_val(effective_edge_159, v122_5); 0.07::true_val(effective_edge_159, unk_effective_edge_159).

measured(s_mel, effective_edge_159, v122_5).

all_consistent(effective_edge_159) :-
    (indep(s_mel), consistent(s_mel, effective_edge_159) ; \+indep(s_mel)).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v122_5)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @unit m
% @values v8_1=8.1 unk_sidecut_radius_size_159=Unknown
% @importance 0.85

0.93::acc(s_mel, sidecut_radius_size_159).

0.93::true_val(sidecut_radius_size_159, v8_1); 0.07::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s_mel, sidecut_radius_size_159, v8_1).

all_consistent(sidecut_radius_size_159) :-
    (indep(s_mel), consistent(s_mel, sidecut_radius_size_159) ; \+indep(s_mel)).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_1)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name Waist width 159cm
% @unit cm
% @values v25_5=25.5 unk_waist_width_159=Unknown
% @importance 0.85

0.93::acc(s_mel, waist_width_159).

0.93::true_val(waist_width_159, v25_5); 0.07::true_val(waist_width_159, unk_waist_width_159).

measured(s_mel, waist_width_159, v25_5).

all_consistent(waist_width_159) :-
    (indep(s_mel), consistent(s_mel, waist_width_159) ; \+indep(s_mel)).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_5)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @values w68_91kg=68_91kg_150_200lb unk_recommended_weight_range_size_159=Unknown
% @importance 0.85

0.93::acc(s_mel, recommended_weight_range_size_159).

0.93::true_val(recommended_weight_range_size_159, w68_91kg); 0.07::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s_mel, recommended_weight_range_size_159, w68_91kg).

all_consistent(recommended_weight_range_size_159) :-
    (indep(s_mel), consistent(s_mel, recommended_weight_range_size_159) ; \+indep(s_mel)).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w68_91kg)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr waist_width_155w
% @type numeric
% @canonical false
% @original_name Waist width 155W
% @unit cm
% @values v26_0=26.0 unk_waist_width_155w=Unknown
% @importance 0.85

0.93::acc(s_mel, waist_width_155w).

0.93::true_val(waist_width_155w, v26_0); 0.07::true_val(waist_width_155w, unk_waist_width_155w).

measured(s_mel, waist_width_155w, v26_0).

all_consistent(waist_width_155w) :-
    (indep(s_mel), consistent(s_mel, waist_width_155w) ; \+indep(s_mel)).

evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v26_0)).
query(true_val(waist_width_155w, unk_waist_width_155w)).

% @attr waist_width_159w
% @type numeric
% @canonical false
% @original_name Waist width 159W
% @unit cm
% @values v26_3=26.3 unk_waist_width_159w=Unknown
% @importance 0.85

0.93::acc(s_mel, waist_width_159w).

0.93::true_val(waist_width_159w, v26_3); 0.07::true_val(waist_width_159w, unk_waist_width_159w).

measured(s_mel, waist_width_159w, v26_3).

all_consistent(waist_width_159w) :-
    (indep(s_mel), consistent(s_mel, waist_width_159w) ; \+indep(s_mel)).

evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_3)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

% @attr recommended_weight_range_size_155w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (155W)
% @values w54_82kg=54_82kg unk_recommended_weight_range_size_155w=Unknown
% @importance 0.85

0.93::acc(s_mel, recommended_weight_range_size_155w).

0.93::true_val(recommended_weight_range_size_155w, w54_82kg); 0.07::true_val(recommended_weight_range_size_155w, unk_recommended_weight_range_size_155w).

measured(s_mel, recommended_weight_range_size_155w, w54_82kg).

all_consistent(recommended_weight_range_size_155w) :-
    (indep(s_mel), consistent(s_mel, recommended_weight_range_size_155w) ; \+indep(s_mel)).

evidence(all_consistent(recommended_weight_range_size_155w)).
query(true_val(recommended_weight_range_size_155w, w54_82kg)).
query(true_val(recommended_weight_range_size_155w, unk_recommended_weight_range_size_155w)).

% @attr recommended_weight_range_size_159w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159W)
% @values w68_91kg=68_91kg unk_recommended_weight_range_size_159w=Unknown
% @importance 0.85

0.93::acc(s_mel, recommended_weight_range_size_159w).

0.93::true_val(recommended_weight_range_size_159w, w68_91kg); 0.07::true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w).

measured(s_mel, recommended_weight_range_size_159w, w68_91kg).

all_consistent(recommended_weight_range_size_159w) :-
    (indep(s_mel), consistent(s_mel, recommended_weight_range_size_159w) ; \+indep(s_mel)).

evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, w68_91kg)).
query(true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit g
% @values v3000=3000.0 unk_board_weight_grams=Unknown
% @importance 0.65

0.88::acc(s_sp, board_weight_grams).

0.71::true_val(board_weight_grams, v3000); 0.29::true_val(board_weight_grams, unk_board_weight_grams).

measured(s_sp, board_weight_grams, v3000).

all_consistent(board_weight_grams) :- consistent(s_sp, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3000)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @canonical false
% @original_name weight_per_cm
% @unit g/cm
% @values v19_35=19.35 unk_weight_per_cm=Unknown
% @importance 0.55

0.85::acc(s_sp, weight_per_cm).

0.68::true_val(weight_per_cm, v19_35); 0.32::true_val(weight_per_cm, unk_weight_per_cm).

measured(s_sp, weight_per_cm, v19_35).

all_consistent(weight_per_cm) :- consistent(s_sp, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v19_35)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values normal_weight=Normal_weight_for_size_and_width unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.5

0.85::acc(s_tgr, reviewer_opinion_the_good_ride).

0.68::true_val(reviewer_opinion_the_good_ride, normal_weight); 0.32::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s_tgr, reviewer_opinion_the_good_ride, normal_weight).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s_tgr, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, normal_weight)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr camber_height_mm
% @type numeric
% @canonical true
% @original_name camber_height_mm
% @unit mm
% @values v9=9.0 unk_camber_height_mm=Unknown
% @importance 0.5

0.90::acc(s_sp, camber_height_mm).

0.71::true_val(camber_height_mm, v9); 0.29::true_val(camber_height_mm, unk_camber_height_mm).

measured(s_sp, camber_height_mm, v9).

all_consistent(camber_height_mm) :- consistent(s_sp, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v9)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values y3_year=3_year_warranty_from_purchase unk_warranty=Unknown
% @importance 0.7

0.88::acc(s_rei, warranty).

0.81::true_val(warranty, y3_year); 0.19::true_val(warranty, unk_warranty).

measured(s_rei, warranty, y3_year).

all_consistent(warranty) :-
    (indep(s_rei), consistent(s_rei, warranty) ; \+indep(s_rei)).

evidence(all_consistent(warranty)).
query(true_val(warranty, y3_year)).
query(true_val(warranty, unk_warranty)).

% @attr sustainability_certification_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification (resin carbon reduction)
% @values reduces_50pct=Reduces_carbon_footprint_50pct unk_sustainability_certification_resin=Unknown
% @importance 0.5

0.82::acc(s_tac, sustainability_certification_resin).

0.71::true_val(sustainability_certification_resin, reduces_50pct); 0.29::true_val(sustainability_certification_resin, unk_sustainability_certification_resin).

measured(s_tac, sustainability_certification_resin, reduces_50pct).

all_consistent(sustainability_certification_resin) :-
    (indep(s_tac), consistent(s_tac, sustainability_certification_resin) ; \+indep(s_tac)).

evidence(all_consistent(sustainability_certification_resin)).
query(true_val(sustainability_certification_resin, reduces_50pct)).
query(true_val(sustainability_certification_resin, unk_sustainability_certification_resin)).

% @attr sustainability_certification_mission
% @type categorical
% @canonical false
% @original_name sustainability_certification (mission)
% @values minimize_harm=Minimize_harm_positive_impact unk_sustainability_certification_mission=Unknown
% @importance 0.35

0.72::acc(s_amz, sustainability_certification_mission).

0.49::true_val(sustainability_certification_mission, minimize_harm); 0.51::true_val(sustainability_certification_mission, unk_sustainability_certification_mission).

measured(s_amz, sustainability_certification_mission, minimize_harm).

all_consistent(sustainability_certification_mission) :-
    (indep(s_amz), consistent(s_amz, sustainability_certification_mission) ; \+indep(s_amz)).

evidence(all_consistent(sustainability_certification_mission)).
query(true_val(sustainability_certification_mission, minimize_harm)).
query(true_val(sustainability_certification_mission, unk_sustainability_certification_mission)).

% @attr terrain_suitability_park_10
% @type numeric
% @canonical false
% @original_name terrain_suitability (park rating)
% @unit /10
% @values v10=10.0 unk_terrain_suitability_park_10=Unknown
% @importance 0.85

0.90::acc(s_mel, terrain_suitability_park_10).

0.93::true_val(terrain_suitability_park_10, v10); 0.07::true_val(terrain_suitability_park_10, unk_terrain_suitability_park_10).

measured(s_mel, terrain_suitability_park_10, v10).

all_consistent(terrain_suitability_park_10) :-
    (indep(s_mel), consistent(s_mel, terrain_suitability_park_10) ; \+indep(s_mel)).

evidence(all_consistent(terrain_suitability_park_10)).
query(true_val(terrain_suitability_park_10, v10)).
query(true_val(terrain_suitability_park_10, unk_terrain_suitability_park_10)).

% @attr terrain_suitability_all_mountain_10
% @type numeric
% @canonical false
% @original_name terrain_suitability (all-mountain rating)
% @unit /10
% @values v7=7.0 unk_terrain_suitability_all_mountain_10=Unknown
% @importance 0.85

0.90::acc(s_mel, terrain_suitability_all_mountain_10).

0.93::true_val(terrain_suitability_all_mountain_10, v7); 0.07::true_val(terrain_suitability_all_mountain_10, unk_terrain_suitability_all_mountain_10).

measured(s_mel, terrain_suitability_all_mountain_10, v7).

all_consistent(terrain_suitability_all_mountain_10) :-
    (indep(s_mel), consistent(s_mel, terrain_suitability_all_mountain_10) ; \+indep(s_mel)).

evidence(all_consistent(terrain_suitability_all_mountain_10)).
query(true_val(terrain_suitability_all_mountain_10, v7)).
query(true_val(terrain_suitability_all_mountain_10, unk_terrain_suitability_all_mountain_10)).

% @attr terrain_suitability_powder_10
% @type numeric
% @canonical false
% @original_name terrain_suitability (powder rating)
% @unit /10
% @values v3=3.0 unk_terrain_suitability_powder_10=Unknown
% @importance 0.85

0.90::acc(s_mel, terrain_suitability_powder_10).

0.93::true_val(terrain_suitability_powder_10, v3); 0.07::true_val(terrain_suitability_powder_10, unk_terrain_suitability_powder_10).

measured(s_mel, terrain_suitability_powder_10, v3).

all_consistent(terrain_suitability_powder_10) :-
    (indep(s_mel), consistent(s_mel, terrain_suitability_powder_10) ; \+indep(s_mel)).

evidence(all_consistent(terrain_suitability_powder_10)).
query(true_val(terrain_suitability_powder_10, v3)).
query(true_val(terrain_suitability_powder_10, unk_terrain_suitability_powder_10)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v85_9=85.9 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.8

0.88::acc(s_sp, overall_rating_snowboardingprofiles).

0.71::true_val(overall_rating_snowboardingprofiles, v85_9); 0.29::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s_sp, overall_rating_snowboardingprofiles, v85_9).

all_consistent(overall_rating_snowboardingprofiles) :- consistent(s_sp, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v85_9)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr rating_board_of_the_world
% @type numeric
% @canonical false
% @original_name Board of the World rating
% @unit /100
% @values v82_35=82.35 unk_rating_board_of_the_world=Unknown
% @importance 0.75

0.80::acc(s_btw, rating_board_of_the_world).

0.57::true_val(rating_board_of_the_world, v82_35); 0.43::true_val(rating_board_of_the_world, unk_rating_board_of_the_world).

measured(s_btw, rating_board_of_the_world, v82_35).

all_consistent(rating_board_of_the_world) :- consistent(s_btw, rating_board_of_the_world).

evidence(all_consistent(rating_board_of_the_world)).
query(true_val(rating_board_of_the_world, v82_35)).
query(true_val(rating_board_of_the_world, unk_rating_board_of_the_world)).

% @attr ranking_board_of_the_world
% @type categorical
% @canonical false
% @original_name Board of the World ranking
% @values rank_36_of_36=36th_of_36_park_boards unk_ranking_board_of_the_world=Unknown
% @importance 0.65

0.78::acc(s_btw, ranking_board_of_the_world).

0.52::true_val(ranking_board_of_the_world, rank_36_of_36); 0.48::true_val(ranking_board_of_the_world, unk_ranking_board_of_the_world).

measured(s_btw, ranking_board_of_the_world, rank_36_of_36).

all_consistent(ranking_board_of_the_world) :- consistent(s_btw, ranking_board_of_the_world).

evidence(all_consistent(ranking_board_of_the_world)).
query(true_val(ranking_board_of_the_world, rank_36_of_36)).
query(true_val(ranking_board_of_the_world, unk_ranking_board_of_the_world)).

% @attr jumps_score_5
% @type numeric
% @canonical false
% @original_name Jumps score
% @unit /5
% @values v4_5=4.5 unk_jumps_score_5=Unknown
% @importance 0.85

0.88::acc(s_sp, jumps_score_5).

0.71::true_val(jumps_score_5, v4_5); 0.29::true_val(jumps_score_5, unk_jumps_score_5).

measured(s_sp, jumps_score_5, v4_5).

all_consistent(jumps_score_5) :- consistent(s_sp, jumps_score_5).

evidence(all_consistent(jumps_score_5)).
query(true_val(jumps_score_5, v4_5)).
query(true_val(jumps_score_5, unk_jumps_score_5)).

% @attr jibbing_score_5
% @type numeric
% @canonical false
% @original_name Jibbing score
% @unit /5
% @values v3_5=3.5 unk_jibbing_score_5=Unknown
% @importance 0.85

0.88::acc(s_sp, jibbing_score_5).

0.71::true_val(jibbing_score_5, v3_5); 0.29::true_val(jibbing_score_5, unk_jibbing_score_5).

measured(s_sp, jibbing_score_5, v3_5).

all_consistent(jibbing_score_5) :- consistent(s_sp, jibbing_score_5).

evidence(all_consistent(jibbing_score_5)).
query(true_val(jibbing_score_5, v3_5)).
query(true_val(jibbing_score_5, unk_jibbing_score_5)).

% @attr spins_score_5
% @type numeric
% @canonical false
% @original_name Spins score
% @unit /5
% @values v4_5=4.5 unk_spins_score_5=Unknown
% @importance 0.85

0.88::acc(s_sp, spins_score_5).

0.71::true_val(spins_score_5, v4_5); 0.29::true_val(spins_score_5, unk_spins_score_5).

measured(s_sp, spins_score_5, v4_5).

all_consistent(spins_score_5) :- consistent(s_sp, spins_score_5).

evidence(all_consistent(spins_score_5)).
query(true_val(spins_score_5, v4_5)).
query(true_val(spins_score_5, unk_spins_score_5)).

% @attr switch_score_5
% @type numeric
% @canonical false
% @original_name Switch score
% @unit /5
% @values v4_5=4.5 unk_switch_score_5=Unknown
% @importance 0.85

0.88::acc(s_sp, switch_score_5).

0.71::true_val(switch_score_5, v4_5); 0.29::true_val(switch_score_5, unk_switch_score_5).

measured(s_sp, switch_score_5, v4_5).

all_consistent(switch_score_5) :- consistent(s_sp, switch_score_5).

evidence(all_consistent(switch_score_5)).
query(true_val(switch_score_5, v4_5)).
query(true_val(switch_score_5, unk_switch_score_5)).

% @attr buttering_score_5
% @type numeric
% @canonical false
% @original_name Buttering score
% @unit /5
% @values v4_0=4.0 unk_buttering_score_5=Unknown
% @importance 0.85

0.88::acc(s_sp, buttering_score_5).

0.71::true_val(buttering_score_5, v4_0); 0.29::true_val(buttering_score_5, unk_buttering_score_5).

measured(s_sp, buttering_score_5, v4_0).

all_consistent(buttering_score_5) :- consistent(s_sp, buttering_score_5).

evidence(all_consistent(buttering_score_5)).
query(true_val(buttering_score_5, v4_0)).
query(true_val(buttering_score_5, unk_buttering_score_5)).

% @attr uneven_terrain_score_5
% @type numeric
% @canonical false
% @original_name Uneven terrain score
% @unit /5
% @values v3_5=3.5 unk_uneven_terrain_score_5=Unknown
% @importance 0.85

0.88::acc(s_sp, uneven_terrain_score_5).

0.71::true_val(uneven_terrain_score_5, v3_5); 0.29::true_val(uneven_terrain_score_5, unk_uneven_terrain_score_5).

measured(s_sp, uneven_terrain_score_5, v3_5).

all_consistent(uneven_terrain_score_5) :- consistent(s_sp, uneven_terrain_score_5).

evidence(all_consistent(uneven_terrain_score_5)).
query(true_val(uneven_terrain_score_5, v3_5)).
query(true_val(uneven_terrain_score_5, unk_uneven_terrain_score_5)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @unit /5
% @values v2_0=2.0 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.85

0.88::acc(s_sp, powder_score_snowboardingprofiles).

0.71::true_val(powder_score_snowboardingprofiles, v2_0); 0.29::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s_sp, powder_score_snowboardingprofiles, v2_0).

all_consistent(powder_score_snowboardingprofiles) :- consistent(s_sp, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v2_0)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr speed_score_5
% @type numeric
% @canonical false
% @original_name Speed score
% @unit /5
% @values v3_0=3.0 unk_speed_score_5=Unknown
% @importance 0.85

0.88::acc(s_sp, speed_score_5).

0.71::true_val(speed_score_5, v3_0); 0.29::true_val(speed_score_5, unk_speed_score_5).

measured(s_sp, speed_score_5, v3_0).

all_consistent(speed_score_5) :- consistent(s_sp, speed_score_5).

evidence(all_consistent(speed_score_5)).
query(true_val(speed_score_5, v3_0)).
query(true_val(speed_score_5, unk_speed_score_5)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @unit /5
% @values v3_5=3.5 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.85

0.88::acc(s_sp, carving_score_snowboardingprofiles).

0.71::true_val(carving_score_snowboardingprofiles, v3_5); 0.29::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s_sp, carving_score_snowboardingprofiles, v3_5).

all_consistent(carving_score_snowboardingprofiles) :- consistent(s_sp, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v3_5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr turns_slashing_score_5
% @type numeric
% @canonical false
% @original_name Turns/slashing score
% @unit /5
% @values v4_5=4.5 unk_turns_slashing_score_5=Unknown
% @importance 0.85

0.88::acc(s_sp, turns_slashing_score_5).

0.71::true_val(turns_slashing_score_5, v4_5); 0.29::true_val(turns_slashing_score_5, unk_turns_slashing_score_5).

measured(s_sp, turns_slashing_score_5, v4_5).

all_consistent(turns_slashing_score_5) :- consistent(s_sp, turns_slashing_score_5).

evidence(all_consistent(turns_slashing_score_5)).
query(true_val(turns_slashing_score_5, v4_5)).
query(true_val(turns_slashing_score_5, unk_turns_slashing_score_5)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values poor=Poor unk_powder_rating_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, powder_rating_tgr).

0.76::true_val(powder_rating_tgr, poor); 0.24::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s_tgr, powder_rating_tgr, poor).

all_consistent(powder_rating_tgr) :- consistent(s_tgr, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, poor)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.85

0.88::acc(s_tgr, base_glide_performance).

0.76::true_val(base_glide_performance, good); 0.24::true_val(base_glide_performance, unk_base_glide_performance).

measured(s_tgr, base_glide_performance, good).

all_consistent(base_glide_performance) :- consistent(s_tgr, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, carving_rating_tgr).

0.76::true_val(carving_rating_tgr, great); 0.24::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s_tgr, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :- consistent(s_tgr, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, speed_rating_tgr).

0.76::true_val(speed_rating_tgr, good); 0.24::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s_tgr, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :- consistent(s_tgr, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values great=Great chattery_in_crud=Chattery_in_crud_chunder
% @importance 0.775

0.88::acc(s_tgr, chatter_performance).
0.85::acc(s_sp, chatter_performance).

0.50::true_val(chatter_performance, great); 0.50::true_val(chatter_performance, chattery_in_crud).

measured(s_tgr, chatter_performance, great).
measured(s_sp, chatter_performance, chattery_in_crud).

all_consistent(chatter_performance) :-
    consistent(s_tgr, chatter_performance),
    consistent(s_sp, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, great)).
query(true_val(chatter_performance, chattery_in_crud)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values great=Great excellent=Excellent
% @importance 0.775

0.88::acc(s_tgr, switch_riding).
0.85::acc(s_sp, switch_riding).

0.50::true_val(switch_riding, great); 0.50::true_val(switch_riding, excellent).

measured(s_tgr, switch_riding, great).
measured(s_sp, switch_riding, excellent).

all_consistent(switch_riding) :-
    consistent(s_tgr, switch_riding),
    consistent(s_sp, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, great)).
query(true_val(switch_riding, excellent)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values excellent=Excellent unk_jumps_rating_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, jumps_rating_tgr).

0.76::true_val(jumps_rating_tgr, excellent); 0.24::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s_tgr, jumps_rating_tgr, excellent).

all_consistent(jumps_rating_tgr) :- consistent(s_tgr, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, excellent)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values good=Good unk_jibbing_rating_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, jibbing_rating_tgr).

0.76::true_val(jibbing_rating_tgr, good); 0.24::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s_tgr, jibbing_rating_tgr, good).

all_consistent(jibbing_rating_tgr) :- consistent(s_tgr, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, good)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values great=Great unk_pipe_rating_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, pipe_rating_tgr).

0.76::true_val(pipe_rating_tgr, great); 0.24::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

measured(s_tgr, pipe_rating_tgr, great).

all_consistent(pipe_rating_tgr) :- consistent(s_tgr, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, great)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow=Hard_snow_not_ice surprisingly_strong=Surprisingly_strong_disrupted_sidecut
% @importance 0.8

0.86::acc(s_tgr, edge_hold).

0.50::true_val(edge_hold, hard_snow); 0.50::true_val(edge_hold, surprisingly_strong).

measured(s_tgr, edge_hold, hard_snow).
measured(s_tgr, edge_hold, surprisingly_strong).

all_consistent(edge_hold) :- consistent(s_tgr, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow)).
query(true_val(edge_hold, surprisingly_strong)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, on_snow_feel_tgr).

0.76::true_val(on_snow_feel_tgr, semi_locked_in); 0.24::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s_tgr, on_snow_feel_tgr, semi_locked_in).

all_consistent(on_snow_feel_tgr) :- consistent(s_tgr, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast quick_balanced=Quick_edge_to_edge_balanced
% @importance 0.775

0.88::acc(s_tgr, turn_initiation_performance).

0.50::true_val(turn_initiation_performance, medium_fast); 0.50::true_val(turn_initiation_performance, quick_balanced).

measured(s_tgr, turn_initiation_performance, medium_fast).
measured(s_tgr, turn_initiation_performance, quick_balanced).

all_consistent(turn_initiation_performance) :- consistent(s_tgr, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, quick_balanced)).

% @attr reviewer_opinion_the_good_ride_flex
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (flex feel)
% @values semi_hard=Semi_Hard unk_reviewer_opinion_the_good_ride_flex=Unknown
% @importance 0.85

0.88::acc(s_tgr, reviewer_opinion_the_good_ride_flex).

0.76::true_val(reviewer_opinion_the_good_ride_flex, semi_hard); 0.24::true_val(reviewer_opinion_the_good_ride_flex, unk_reviewer_opinion_the_good_ride_flex).

measured(s_tgr, reviewer_opinion_the_good_ride_flex, semi_hard).

all_consistent(reviewer_opinion_the_good_ride_flex) :- consistent(s_tgr, reviewer_opinion_the_good_ride_flex).

evidence(all_consistent(reviewer_opinion_the_good_ride_flex)).
query(true_val(reviewer_opinion_the_good_ride_flex, semi_hard)).
query(true_val(reviewer_opinion_the_good_ride_flex, unk_reviewer_opinion_the_good_ride_flex)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate=Intermediate advanced_expert=Advanced_Expert expert=Expert novice_expert=Novice_Expert intermediate_advanced=Intermediate_Advanced low_intermediate_up=Low_Intermediate_and_up
% @importance 0.82

0.85::acc(s_mel, skill_level_recommendation).
0.88::acc(s_tgr, skill_level_recommendation).
0.78::acc(s_hou, skill_level_recommendation).
0.72::acc(s_eas, skill_level_recommendation).
0.75::acc(s_bnz, skill_level_recommendation).
0.85::acc(s_sp, skill_level_recommendation).

0.10::true_val(skill_level_recommendation, intermediate); 0.25::true_val(skill_level_recommendation, advanced_expert); 0.10::true_val(skill_level_recommendation, expert); 0.10::true_val(skill_level_recommendation, novice_expert); 0.20::true_val(skill_level_recommendation, intermediate_advanced); 0.25::true_val(skill_level_recommendation, low_intermediate_up).

measured(s_mel, skill_level_recommendation, intermediate).
measured(s_tgr, skill_level_recommendation, advanced_expert).
measured(s_hou, skill_level_recommendation, expert).
measured(s_eas, skill_level_recommendation, novice_expert).
measured(s_bnz, skill_level_recommendation, intermediate_advanced).
measured(s_sp, skill_level_recommendation, low_intermediate_up).

all_consistent(skill_level_recommendation) :-
    (indep(s_mel), consistent(s_mel, skill_level_recommendation) ; \+indep(s_mel)),
    consistent(s_tgr, skill_level_recommendation),
    (indep(s_hou), consistent(s_hou, skill_level_recommendation) ; \+indep(s_hou)),
    (indep(s_eas), consistent(s_eas, skill_level_recommendation) ; \+indep(s_eas)),
    (indep(s_bnz), consistent(s_bnz, skill_level_recommendation) ; \+indep(s_bnz)),
    consistent(s_sp, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, expert)).
query(true_val(skill_level_recommendation, novice_expert)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, low_intermediate_up)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values easy_access_great=Easy_to_access_great_for_ollies_jumps unk_pop=Unknown
% @importance 0.85

0.85::acc(s_sp, pop).

0.68::true_val(pop, easy_access_great); 0.32::true_val(pop, unk_pop).

measured(s_sp, pop, easy_access_great).

all_consistent(pop) :- consistent(s_sp, pop).

evidence(all_consistent(pop)).
query(true_val(pop, easy_access_great)).
query(true_val(pop, unk_pop)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values great_value_specs=Lot_of_snowboard_for_price_Triax_sintered_under_500 unk_positive_aspect=Unknown
% @importance 0.85

0.82::acc(s_btw, positive_aspect).

0.54::true_val(positive_aspect, great_value_specs); 0.46::true_val(positive_aspect, unk_positive_aspect).

measured(s_btw, positive_aspect, great_value_specs).

all_consistent(positive_aspect) :- consistent(s_btw, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, great_value_specs)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_side_hits
% @type categorical
% @canonical false
% @original_name positive_aspect (side hits)
% @values highly_rated_side_hits=Highly_rated_for_side_hits unk_positive_aspect_side_hits=Unknown
% @importance 0.6

0.85::acc(s_sp, positive_aspect_side_hits).

0.68::true_val(positive_aspect_side_hits, highly_rated_side_hits); 0.32::true_val(positive_aspect_side_hits, unk_positive_aspect_side_hits).

measured(s_sp, positive_aspect_side_hits, highly_rated_side_hits).

all_consistent(positive_aspect_side_hits) :- consistent(s_sp, positive_aspect_side_hits).

evidence(all_consistent(positive_aspect_side_hits)).
query(true_val(positive_aspect_side_hits, highly_rated_side_hits)).
query(true_val(positive_aspect_side_hits, unk_positive_aspect_side_hits)).

% @attr positive_aspect_durability
% @type categorical
% @canonical false
% @original_name positive_aspect (durability)
% @values holds_up_in_chop=Does_not_fall_apart_in_chopped_conditions unk_positive_aspect_durability=Unknown
% @importance 0.65

0.85::acc(s_tgr, positive_aspect_durability).

0.68::true_val(positive_aspect_durability, holds_up_in_chop); 0.32::true_val(positive_aspect_durability, unk_positive_aspect_durability).

measured(s_tgr, positive_aspect_durability, holds_up_in_chop).

all_consistent(positive_aspect_durability) :- consistent(s_tgr, positive_aspect_durability).

evidence(all_consistent(positive_aspect_durability)).
query(true_val(positive_aspect_durability, holds_up_in_chop)).
query(true_val(positive_aspect_durability, unk_positive_aspect_durability)).

% @attr positive_aspect_camber_surprise
% @type categorical
% @canonical false
% @original_name positive_aspect (camber surprise)
% @values surprisingly_good_camber=Surprisingly_good_for_traditional_camber unk_positive_aspect_camber_surprise=Unknown
% @importance 0.7

0.85::acc(s_sp, positive_aspect_camber_surprise).

0.68::true_val(positive_aspect_camber_surprise, surprisingly_good_camber); 0.32::true_val(positive_aspect_camber_surprise, unk_positive_aspect_camber_surprise).

measured(s_sp, positive_aspect_camber_surprise, surprisingly_good_camber).

all_consistent(positive_aspect_camber_surprise) :- consistent(s_sp, positive_aspect_camber_surprise).

evidence(all_consistent(positive_aspect_camber_surprise)).
query(true_val(positive_aspect_camber_surprise, surprisingly_good_camber)).
query(true_val(positive_aspect_camber_surprise, unk_positive_aspect_camber_surprise)).

% @attr positive_aspect_jumps
% @type categorical
% @canonical false
% @original_name positive_aspect (jumps)
% @values sick_for_jumps=Board_is_sick_for_jumps unk_positive_aspect_jumps=Unknown
% @importance 0.85

0.83::acc(s_sp, positive_aspect_jumps).

0.64::true_val(positive_aspect_jumps, sick_for_jumps); 0.36::true_val(positive_aspect_jumps, unk_positive_aspect_jumps).

measured(s_sp, positive_aspect_jumps, sick_for_jumps).

all_consistent(positive_aspect_jumps) :- consistent(s_sp, positive_aspect_jumps).

evidence(all_consistent(positive_aspect_jumps)).
query(true_val(positive_aspect_jumps, sick_for_jumps)).
query(true_val(positive_aspect_jumps, unk_positive_aspect_jumps)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values poor_powder=Poor_twin_centered_sinks_not_for_powder unk_negative_aspect=Unknown
% @importance 0.8

0.88::acc(s_tgr, negative_aspect).

0.72::true_val(negative_aspect, poor_powder); 0.28::true_val(negative_aspect, unk_negative_aspect).

measured(s_tgr, negative_aspect, poor_powder).

all_consistent(negative_aspect) :- consistent(s_tgr, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, poor_powder)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_speed_wobble
% @type categorical
% @canonical false
% @original_name negative_aspect (speed wobble)
% @values wobbly_at_speed=Gets_wobbly_at_higher_speeds unk_negative_aspect_speed_wobble=Unknown
% @importance 0.8

0.85::acc(s_sp, negative_aspect_speed_wobble).

0.68::true_val(negative_aspect_speed_wobble, wobbly_at_speed); 0.32::true_val(negative_aspect_speed_wobble, unk_negative_aspect_speed_wobble).

measured(s_sp, negative_aspect_speed_wobble, wobbly_at_speed).

all_consistent(negative_aspect_speed_wobble) :- consistent(s_sp, negative_aspect_speed_wobble).

evidence(all_consistent(negative_aspect_speed_wobble)).
query(true_val(negative_aspect_speed_wobble, wobbly_at_speed)).
query(true_val(negative_aspect_speed_wobble, unk_negative_aspect_speed_wobble)).

% @attr negative_aspect_edge_catch
% @type categorical
% @canonical false
% @original_name negative_aspect (edge catch)
% @values easier_to_catch_edge=Full_camber_easier_to_catch_edge unk_negative_aspect_edge_catch=Unknown
% @importance 0.85

0.88::acc(s_tgr, negative_aspect_edge_catch).

0.72::true_val(negative_aspect_edge_catch, easier_to_catch_edge); 0.28::true_val(negative_aspect_edge_catch, unk_negative_aspect_edge_catch).

measured(s_tgr, negative_aspect_edge_catch, easier_to_catch_edge).

all_consistent(negative_aspect_edge_catch) :- consistent(s_tgr, negative_aspect_edge_catch).

evidence(all_consistent(negative_aspect_edge_catch)).
query(true_val(negative_aspect_edge_catch, easier_to_catch_edge)).
query(true_val(negative_aspect_edge_catch, unk_negative_aspect_edge_catch)).

% @attr negative_aspect_buttering
% @type categorical
% @canonical false
% @original_name negative_aspect (buttering)
% @values not_easiest_butter=Not_easiest_to_butter_camber_snaps_back unk_negative_aspect_buttering=Unknown
% @importance 0.7

0.88::acc(s_tgr, negative_aspect_buttering).

0.72::true_val(negative_aspect_buttering, not_easiest_butter); 0.28::true_val(negative_aspect_buttering, unk_negative_aspect_buttering).

measured(s_tgr, negative_aspect_buttering, not_easiest_butter).

all_consistent(negative_aspect_buttering) :- consistent(s_tgr, negative_aspect_buttering).

evidence(all_consistent(negative_aspect_buttering)).
query(true_val(negative_aspect_buttering, not_easiest_butter)).
query(true_val(negative_aspect_buttering, unk_negative_aspect_buttering)).

% @attr negative_aspect_base_speed
% @type categorical
% @canonical false
% @original_name negative_aspect (base speed)
% @values not_fastest_base=Not_as_fast_as_WFO_sintered_bases unk_negative_aspect_base_speed=Unknown
% @importance 0.65

0.80::acc(s_btw, negative_aspect_base_speed).

0.54::true_val(negative_aspect_base_speed, not_fastest_base); 0.46::true_val(negative_aspect_base_speed, unk_negative_aspect_base_speed).

measured(s_btw, negative_aspect_base_speed, not_fastest_base).

all_consistent(negative_aspect_base_speed) :- consistent(s_btw, negative_aspect_base_speed).

evidence(all_consistent(negative_aspect_base_speed)).
query(true_val(negative_aspect_base_speed, not_fastest_base)).
query(true_val(negative_aspect_base_speed, unk_negative_aspect_base_speed)).

% @attr negative_aspect_fast_approach
% @type categorical
% @canonical false
% @original_name negative_aspect (fast approach)
% @values not_suited_fast_approach=Not_well_suited_faster_approaches_bigger_jumps unk_negative_aspect_fast_approach=Unknown
% @importance 0.7

0.85::acc(s_sp, negative_aspect_fast_approach).

0.68::true_val(negative_aspect_fast_approach, not_suited_fast_approach); 0.32::true_val(negative_aspect_fast_approach, unk_negative_aspect_fast_approach).

measured(s_sp, negative_aspect_fast_approach, not_suited_fast_approach).

all_consistent(negative_aspect_fast_approach) :- consistent(s_sp, negative_aspect_fast_approach).

evidence(all_consistent(negative_aspect_fast_approach)).
query(true_val(negative_aspect_fast_approach, not_suited_fast_approach)).
query(true_val(negative_aspect_fast_approach, unk_negative_aspect_fast_approach)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v699_99=699.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::acc(s_mel, price_aud_merchant).

0.93::true_val(price_aud_merchant, v699_99); 0.07::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_mel, price_aud_merchant, v699_99).

all_consistent(price_aud_merchant) :-
    (indep(s_mel), consistent(s_mel, price_aud_merchant) ; \+indep(s_mel)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v699_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v439_95=439.95 v449_95=449.95
% @importance 0.88

0.88::acc(s_tgr, price_usd_msrp).
0.78::acc(s_btw, price_usd_msrp).
0.80::acc(s_alp, price_usd_msrp).
0.82::acc(s_evo, price_usd_msrp).

0.70::true_val(price_usd_msrp, v439_95); 0.30::true_val(price_usd_msrp, v449_95).

measured(s_tgr, price_usd_msrp, v439_95).
measured(s_btw, price_usd_msrp, v439_95).
measured(s_alp, price_usd_msrp, v439_95).
measured(s_evo, price_usd_msrp, v449_95).

all_consistent(price_usd_msrp) :-
    consistent(s_tgr, price_usd_msrp),
    consistent(s_btw, price_usd_msrp),
    (indep(s_alp), consistent(s_alp, price_usd_msrp) ; \+indep(s_alp)),
    (indep(s_evo), consistent(s_evo, price_usd_msrp) ; \+indep(s_evo)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v439_95)).
query(true_val(price_usd_msrp, v449_95)).

% @attr price_usd_evo
% @type numeric
% @canonical false
% @original_name price_usd_evo
% @unit USD
% @values v449_95=449.95 unk_price_usd_evo=Unknown
% @importance 0.9

0.85::acc(s_evo, price_usd_evo).

0.72::true_val(price_usd_evo, v449_95); 0.28::true_val(price_usd_evo, unk_price_usd_evo).

measured(s_evo, price_usd_evo, v449_95).

all_consistent(price_usd_evo) :-
    (indep(s_evo), consistent(s_evo, price_usd_evo) ; \+indep(s_evo)).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v449_95)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_salty_peaks
% @type numeric
% @canonical false
% @original_name Price USD (Salty Peaks, 2027)
% @unit USD
% @values v495=495.0 unk_price_usd_salty_peaks=Unknown
% @importance 0.9

0.82::acc(s_sal, price_usd_salty_peaks).

0.60::true_val(price_usd_salty_peaks, v495); 0.40::true_val(price_usd_salty_peaks, unk_price_usd_salty_peaks).

measured(s_sal, price_usd_salty_peaks, v495).

all_consistent(price_usd_salty_peaks) :-
    (indep(s_sal), consistent(s_sal, price_usd_salty_peaks) ; \+indep(s_sal)).

evidence(all_consistent(price_usd_salty_peaks)).
query(true_val(price_usd_salty_peaks, v495)).
query(true_val(price_usd_salty_peaks, unk_price_usd_salty_peaks)).

% @attr price_usd_sun_ski
% @type numeric
% @canonical false
% @original_name Price USD (Sun & Ski Sports, discounted 2025)
% @unit USD
% @values v359_93=359.93 unk_price_usd_sun_ski=Unknown
% @importance 0.85

0.82::acc(s_tgr, price_usd_sun_ski).

0.60::true_val(price_usd_sun_ski, v359_93); 0.40::true_val(price_usd_sun_ski, unk_price_usd_sun_ski).

measured(s_tgr, price_usd_sun_ski, v359_93).

all_consistent(price_usd_sun_ski) :- consistent(s_tgr, price_usd_sun_ski).

evidence(all_consistent(price_usd_sun_ski)).
query(true_val(price_usd_sun_ski, v359_93)).
query(true_val(price_usd_sun_ski, unk_price_usd_sun_ski)).

% @attr price_usd_the_house
% @type numeric
% @canonical false
% @original_name Price USD (The House, sale 2025)
% @unit USD
% @values v307_95=307.95 unk_price_usd_the_house=Unknown
% @importance 0.85

0.82::acc(s_hou, price_usd_the_house).

0.68::true_val(price_usd_the_house, v307_95); 0.32::true_val(price_usd_the_house, unk_price_usd_the_house).

measured(s_hou, price_usd_the_house, v307_95).

all_consistent(price_usd_the_house) :-
    (indep(s_hou), consistent(s_hou, price_usd_the_house) ; \+indep(s_hou)).

evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v307_95)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

% @attr price_usd_alpine
% @type numeric
% @canonical false
% @original_name Price USD (Alpine Ski Shop, sale 2025)
% @unit USD
% @values v351_96=351.96 unk_price_usd_alpine=Unknown
% @importance 0.85

0.78::acc(s_alp, price_usd_alpine).

0.62::true_val(price_usd_alpine, v351_96); 0.38::true_val(price_usd_alpine, unk_price_usd_alpine).

measured(s_alp, price_usd_alpine, v351_96).

all_consistent(price_usd_alpine) :-
    (indep(s_alp), consistent(s_alp, price_usd_alpine) ; \+indep(s_alp)).

evidence(all_consistent(price_usd_alpine)).
query(true_val(price_usd_alpine, v351_96)).
query(true_val(price_usd_alpine, unk_price_usd_alpine)).

% @attr price_cad_burton_canada
% @type categorical
% @canonical false
% @original_name Price CAD (Burton Canada, 2025)
% @unit CAD
% @values v564_to_580=564.27_to_579.99_CAD unk_price_cad_burton_canada=Unknown
% @importance 0.8

0.82::acc(s_tgr, price_cad_burton_canada).

0.64::true_val(price_cad_burton_canada, v564_to_580); 0.36::true_val(price_cad_burton_canada, unk_price_cad_burton_canada).

measured(s_tgr, price_cad_burton_canada, v564_to_580).

all_consistent(price_cad_burton_canada) :- consistent(s_tgr, price_cad_burton_canada).

evidence(all_consistent(price_cad_burton_canada)).
query(true_val(price_cad_burton_canada, v564_to_580)).
query(true_val(price_cad_burton_canada, unk_price_cad_burton_canada)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v429=429.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.8

0.82::acc(s_tgr, price_eur_blue_tomato).

0.64::true_val(price_eur_blue_tomato, v429); 0.36::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s_tgr, price_eur_blue_tomato, v429).

all_consistent(price_eur_blue_tomato) :- consistent(s_tgr, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v429)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values burton_com_w26=Burton_com_2026_model_page_exists unk_availability_status=Unknown
% @importance 0.75

0.90::acc(s_bur, availability_status).

0.76::true_val(availability_status, burton_com_w26); 0.24::true_val(availability_status, unk_availability_status).

measured(s_bur, availability_status, burton_com_w26).

all_consistent(availability_status) :- consistent(s_bur, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, burton_com_w26)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values evo_2026_oos=evo_2026_listed_out_of_stock unk_availability_status_evo=Unknown
% @importance 0.75

0.82::acc(s_evo, availability_status_evo).

0.72::true_val(availability_status_evo, evo_2026_oos); 0.28::true_val(availability_status_evo, unk_availability_status_evo).

measured(s_evo, availability_status_evo, evo_2026_oos).

all_consistent(availability_status_evo) :-
    (indep(s_evo), consistent(s_evo, availability_status_evo) ; \+indep(s_evo)).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, evo_2026_oos)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_empire
% @type categorical
% @canonical false
% @original_name availability_status (Empire)
% @values empire_2027_in_stock=Empire_2027_in_stock unk_availability_status_empire=Unknown
% @importance 0.75

0.82::acc(s_emp, availability_status_empire).

0.63::true_val(availability_status_empire, empire_2027_in_stock); 0.37::true_val(availability_status_empire, unk_availability_status_empire).

measured(s_emp, availability_status_empire, empire_2027_in_stock).

all_consistent(availability_status_empire) :-
    (indep(s_emp), consistent(s_emp, availability_status_empire) ; \+indep(s_emp)).

evidence(all_consistent(availability_status_empire)).
query(true_val(availability_status_empire, empire_2027_in_stock)).
query(true_val(availability_status_empire, unk_availability_status_empire)).

% @attr availability_status_rhythm
% @type categorical
% @canonical false
% @original_name availability_status (Rhythm)
% @values rhythm_2027=Rhythm_2027_model unk_availability_status_rhythm=Unknown
% @importance 0.7

0.82::acc(s_rhy, availability_status_rhythm).

0.63::true_val(availability_status_rhythm, rhythm_2027); 0.37::true_val(availability_status_rhythm, unk_availability_status_rhythm).

measured(s_rhy, availability_status_rhythm, rhythm_2027).

all_consistent(availability_status_rhythm) :-
    (indep(s_rhy), consistent(s_rhy, availability_status_rhythm) ; \+indep(s_rhy)).

evidence(all_consistent(availability_status_rhythm)).
query(true_val(availability_status_rhythm, rhythm_2027)).
query(true_val(availability_status_rhythm, unk_availability_status_rhythm)).

% @attr availability_status_basenz
% @type categorical
% @canonical false
% @original_name availability_status (BaseNZ)
% @values basenz_2027=BaseNZ_2027_model unk_availability_status_basenz=Unknown
% @importance 0.7

0.78::acc(s_bnz, availability_status_basenz).

0.55::true_val(availability_status_basenz, basenz_2027); 0.45::true_val(availability_status_basenz, unk_availability_status_basenz).

measured(s_bnz, availability_status_basenz, basenz_2027).

all_consistent(availability_status_basenz) :-
    (indep(s_bnz), consistent(s_bnz, availability_status_basenz) ; \+indep(s_bnz)).

evidence(all_consistent(availability_status_basenz)).
query(true_val(availability_status_basenz, basenz_2027)).
query(true_val(availability_status_basenz, unk_availability_status_basenz)).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status (The House)
% @values the_house_2025_sale=The_House_2025_on_sale unk_availability_status_the_house=Unknown
% @importance 0.75

0.82::acc(s_hou, availability_status_the_house).

0.68::true_val(availability_status_the_house, the_house_2025_sale); 0.32::true_val(availability_status_the_house, unk_availability_status_the_house).

measured(s_hou, availability_status_the_house, the_house_2025_sale).

all_consistent(availability_status_the_house) :-
    (indep(s_hou), consistent(s_hou, availability_status_the_house) ; \+indep(s_hou)).

evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, the_house_2025_sale)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

% @attr availability_status_salty_peaks
% @type categorical
% @canonical false
% @original_name availability_status (Salty Peaks)
% @values salty_peaks_2027=Salty_Peaks_2027_495 unk_availability_status_salty_peaks=Unknown
% @importance 0.75

0.80::acc(s_sal, availability_status_salty_peaks).

0.60::true_val(availability_status_salty_peaks, salty_peaks_2027); 0.40::true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks).

measured(s_sal, availability_status_salty_peaks, salty_peaks_2027).

all_consistent(availability_status_salty_peaks) :-
    (indep(s_sal), consistent(s_sal, availability_status_salty_peaks) ; \+indep(s_sal)).

evidence(all_consistent(availability_status_salty_peaks)).
query(true_val(availability_status_salty_peaks, salty_peaks_2027)).
query(true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (Tactics)
% @values tactics_2025=Tactics_2025_model unk_availability_status_tactics=Unknown
% @importance 0.7

0.82::acc(s_tac, availability_status_tactics).

0.64::true_val(availability_status_tactics, tactics_2025); 0.36::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s_tac, availability_status_tactics, tactics_2025).

all_consistent(availability_status_tactics) :-
    (indep(s_tac), consistent(s_tac, availability_status_tactics) ; \+indep(s_tac)).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, tactics_2025)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI)
% @values rei_2024_2025=REI_2024_2025_model unk_availability_status_rei=Unknown
% @importance 0.7

0.85::acc(s_rei, availability_status_rei).

0.72::true_val(availability_status_rei, rei_2024_2025); 0.28::true_val(availability_status_rei, unk_availability_status_rei).

measured(s_rei, availability_status_rei, rei_2024_2025).

all_consistent(availability_status_rei) :-
    (indep(s_rei), consistent(s_rei, availability_status_rei) ; \+indep(s_rei)).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, rei_2024_2025)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry)
% @values backcountry_2025=Backcountry_2025_model unk_availability_status_backcountry=Unknown
% @importance 0.7

0.84::acc(s_bac, availability_status_backcountry).

0.68::true_val(availability_status_backcountry, backcountry_2025); 0.32::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s_bac, availability_status_backcountry, backcountry_2025).

all_consistent(availability_status_backcountry) :-
    (indep(s_bac), consistent(s_bac, availability_status_backcountry) ; \+indep(s_bac)).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, backcountry_2025)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status (Amazon)
% @values amazon_listed=Amazon_listed unk_availability_status_amazon=Unknown
% @importance 0.65

0.78::acc(s_amz, availability_status_amazon).

0.56::true_val(availability_status_amazon, amazon_listed); 0.44::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s_amz, availability_status_amazon, amazon_listed).

all_consistent(availability_status_amazon) :-
    (indep(s_amz), consistent(s_amz, availability_status_amazon) ; \+indep(s_amz)).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, amazon_listed)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status (Erik's)
% @values eriks_2026=Eriks_2026_model unk_availability_status_eriks=Unknown
% @importance 0.7

0.80::acc(s_eri, availability_status_eriks).

0.60::true_val(availability_status_eriks, eriks_2026); 0.40::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s_eri, availability_status_eriks, eriks_2026).

all_consistent(availability_status_eriks) :-
    (indep(s_eri), consistent(s_eri, availability_status_eriks) ; \+indep(s_eri)).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, eriks_2026)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values blauer_2025=Blauer_2025 unk_availability_status_blauer=Unknown
% @importance 0.7

0.78::acc(s_bla, availability_status_blauer).

0.55::true_val(availability_status_blauer, blauer_2025); 0.45::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s_bla, availability_status_blauer, blauer_2025).

all_consistent(availability_status_blauer) :-
    (indep(s_bla), consistent(s_bla, availability_status_blauer) ; \+indep(s_bla)).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, blauer_2025)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_eastern_boarder
% @type categorical
% @canonical false
% @original_name availability_status (Eastern Boarder)
% @values eastern_boarder_listed=Eastern_Boarder_listed unk_availability_status_eastern_boarder=Unknown
% @importance 0.7

0.75::acc(s_eas, availability_status_eastern_boarder).

0.54::true_val(availability_status_eastern_boarder, eastern_boarder_listed); 0.46::true_val(availability_status_eastern_boarder, unk_availability_status_eastern_boarder).

measured(s_eas, availability_status_eastern_boarder, eastern_boarder_listed).

all_consistent(availability_status_eastern_boarder) :-
    (indep(s_eas), consistent(s_eas, availability_status_eastern_boarder) ; \+indep(s_eas)).

evidence(all_consistent(availability_status_eastern_boarder)).
query(true_val(availability_status_eastern_boarder, eastern_boarder_listed)).
query(true_val(availability_status_eastern_boarder, unk_availability_status_eastern_boarder)).

% @attr availability_status_sun_ski
% @type categorical
% @canonical false
% @original_name availability_status (Sun & Ski)
% @values sun_ski_discounted=Sun_Ski_discounted unk_availability_status_sun_ski=Unknown
% @importance 0.75

0.82::acc(s_tgr, availability_status_sun_ski).

0.60::true_val(availability_status_sun_ski, sun_ski_discounted); 0.40::true_val(availability_status_sun_ski, unk_availability_status_sun_ski).

measured(s_tgr, availability_status_sun_ski, sun_ski_discounted).

all_consistent(availability_status_sun_ski) :- consistent(s_tgr, availability_status_sun_ski).

evidence(all_consistent(availability_status_sun_ski)).
query(true_val(availability_status_sun_ski, sun_ski_discounted)).
query(true_val(availability_status_sun_ski, unk_availability_status_sun_ski)).

% @attr availability_status_blue_tomato
% @type categorical
% @canonical false
% @original_name availability_status (Blue Tomato EU)
% @values blue_tomato_eu=Blue_Tomato_EU_FR_SE_NL_ES unk_availability_status_blue_tomato=Unknown
% @importance 0.75

0.82::acc(s_tgr, availability_status_blue_tomato).

0.64::true_val(availability_status_blue_tomato, blue_tomato_eu); 0.36::true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato).

measured(s_tgr, availability_status_blue_tomato, blue_tomato_eu).

all_consistent(availability_status_blue_tomato) :- consistent(s_tgr, availability_status_blue_tomato).

evidence(all_consistent(availability_status_blue_tomato)).
query(true_val(availability_status_blue_tomato, blue_tomato_eu)).
query(true_val(availability_status_blue_tomato, unk_availability_status_blue_tomato)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard)
% @values melbourne_2026=Melbourne_Snowboard_AU_2026 unk_availability_status_melbourne=Unknown
% @importance 0.75

0.82::acc(s_mel, availability_status_melbourne).

0.59::true_val(availability_status_melbourne, melbourne_2026); 0.41::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s_mel, availability_status_melbourne, melbourne_2026).

all_consistent(availability_status_melbourne) :-
    (indep(s_mel), consistent(s_mel, availability_status_melbourne) ; \+indep(s_mel)).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, melbourne_2026)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_splinters
% @type categorical
% @canonical false
% @original_name availability_status (Splinters Boardshop)
% @values splinters_listed=Splinters_Boardshop_listed unk_availability_status_splinters=Unknown
% @importance 0.6

0.75::acc(s_spl, availability_status_splinters).

0.47::true_val(availability_status_splinters, splinters_listed); 0.53::true_val(availability_status_splinters, unk_availability_status_splinters).

measured(s_spl, availability_status_splinters, splinters_listed).

all_consistent(availability_status_splinters) :-
    (indep(s_spl), consistent(s_spl, availability_status_splinters) ; \+indep(s_spl)).

evidence(all_consistent(availability_status_splinters)).
query(true_val(availability_status_splinters, splinters_listed)).
query(true_val(availability_status_splinters, unk_availability_status_splinters)).

% @attr shipping_restriction
% @type categorical
% @canonical false
% @original_name Shipping restriction (merchant)
% @values au_only=Australia_only_shipping unk_shipping_restriction=Unknown
% @importance 0.85

0.90::acc(s_mel, shipping_restriction).

0.90::true_val(shipping_restriction, au_only); 0.10::true_val(shipping_restriction, unk_shipping_restriction).

measured(s_mel, shipping_restriction, au_only).

all_consistent(shipping_restriction) :-
    (indep(s_mel), consistent(s_mel, shipping_restriction) ; \+indep(s_mel)).

evidence(all_consistent(shipping_restriction)).
query(true_val(shipping_restriction, au_only)).
query(true_val(shipping_restriction, unk_shipping_restriction)).

% @attr variant_undefeated
% @type categorical
% @canonical false
% @original_name Variant
% @values burton_x_undefeated_2027=Burton_x_Undefeated_limited_edition_2027 unk_variant_undefeated=Unknown
% @importance 0.55

0.82::acc(s_rhy, variant_undefeated).

0.67::true_val(variant_undefeated, burton_x_undefeated_2027); 0.33::true_val(variant_undefeated, unk_variant_undefeated).

measured(s_rhy, variant_undefeated, burton_x_undefeated_2027).

all_consistent(variant_undefeated) :-
    (indep(s_rhy), consistent(s_rhy, variant_undefeated) ; \+indep(s_rhy)).

evidence(all_consistent(variant_undefeated)).
query(true_val(variant_undefeated, burton_x_undefeated_2027)).
query(true_val(variant_undefeated, unk_variant_undefeated)).

% @attr topsheet_appearance_description_undefeated
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description (Undefeated collab)
% @values street_camo=Street_inspired_camo_by_Undefeated unk_topsheet_appearance_description_undefeated=Unknown
% @importance 0.55

0.82::acc(s_rhy, topsheet_appearance_description_undefeated).

0.67::true_val(topsheet_appearance_description_undefeated, street_camo); 0.33::true_val(topsheet_appearance_description_undefeated, unk_topsheet_appearance_description_undefeated).

measured(s_rhy, topsheet_appearance_description_undefeated, street_camo).

all_consistent(topsheet_appearance_description_undefeated) :-
    (indep(s_rhy), consistent(s_rhy, topsheet_appearance_description_undefeated) ; \+indep(s_rhy)).

evidence(all_consistent(topsheet_appearance_description_undefeated)).
query(true_val(topsheet_appearance_description_undefeated, street_camo)).
query(true_val(topsheet_appearance_description_undefeated, unk_topsheet_appearance_description_undefeated)).

% @attr undefeated_collab_specs
% @type categorical
% @canonical false
% @original_name Undefeated collab specs
% @values same_specs=Same_core_specs_as_standard_different_topsheet unk_undefeated_collab_specs=Unknown
% @importance 0.5

0.80::acc(s_rhy, undefeated_collab_specs).

0.63::true_val(undefeated_collab_specs, same_specs); 0.37::true_val(undefeated_collab_specs, unk_undefeated_collab_specs).

measured(s_rhy, undefeated_collab_specs, same_specs).

all_consistent(undefeated_collab_specs) :-
    (indep(s_rhy), consistent(s_rhy, undefeated_collab_specs) ; \+indep(s_rhy)).

evidence(all_consistent(undefeated_collab_specs)).
query(true_val(undefeated_collab_specs, same_specs)).
query(true_val(undefeated_collab_specs, unk_undefeated_collab_specs)).

% @attr availability_status_undefeated
% @type categorical
% @canonical false
% @original_name availability_status (Undefeated variant)
% @values rhythm_auski_burton=Rhythm_AU_Auski_AU_Burton_com unk_availability_status_undefeated=Unknown
% @importance 0.525

0.82::acc(s_rhy, availability_status_undefeated).
0.75::acc(s_aus, availability_status_undefeated).

0.95::true_val(availability_status_undefeated, rhythm_auski_burton); 0.05::true_val(availability_status_undefeated, unk_availability_status_undefeated).

measured(s_rhy, availability_status_undefeated, rhythm_auski_burton).
measured(s_aus, availability_status_undefeated, rhythm_auski_burton).

all_consistent(availability_status_undefeated) :-
    (indep(s_rhy), consistent(s_rhy, availability_status_undefeated) ; \+indep(s_rhy)),
    (indep(s_aus), consistent(s_aus, availability_status_undefeated) ; \+indep(s_aus)).

evidence(all_consistent(availability_status_undefeated)).
query(true_val(availability_status_undefeated, rhythm_auski_burton)).
query(true_val(availability_status_undefeated, unk_availability_status_undefeated)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values vs_blossom=Good_Company_180_cheaper_Blossom_stiffer_faster_WFO unk_comparable_board_same_brand=Unknown
% @importance 0.9

0.82::acc(s_btw, comparable_board_same_brand).

0.57::true_val(comparable_board_same_brand, vs_blossom); 0.43::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s_btw, comparable_board_same_brand, vs_blossom).

all_consistent(comparable_board_same_brand) :- consistent(s_btw, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, vs_blossom)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_custom
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (vs Custom)
% @values vs_custom=Good_Company_230_cheaper_Custom_stiffer_faster_directional unk_comparable_board_same_brand_custom=Unknown
% @importance 0.85

0.80::acc(s_btw, comparable_board_same_brand_custom).

0.54::true_val(comparable_board_same_brand_custom, vs_custom); 0.46::true_val(comparable_board_same_brand_custom, unk_comparable_board_same_brand_custom).

measured(s_btw, comparable_board_same_brand_custom, vs_custom).

all_consistent(comparable_board_same_brand_custom) :- consistent(s_btw, comparable_board_same_brand_custom).

evidence(all_consistent(comparable_board_same_brand_custom)).
query(true_val(comparable_board_same_brand_custom, vs_custom)).
query(true_val(comparable_board_same_brand_custom, unk_comparable_board_same_brand_custom)).

% @attr custom_camber_manufacturing
% @type categorical
% @canonical false
% @original_name Custom Camber manufactured in
% @values austria_kiel_nindl=Austria_Kiel_Nindl_GMBH unk_custom_camber_manufacturing=Unknown
% @importance 0.6

0.82::acc(s_skm, custom_camber_manufacturing).

0.63::true_val(custom_camber_manufacturing, austria_kiel_nindl); 0.37::true_val(custom_camber_manufacturing, unk_custom_camber_manufacturing).

measured(s_skm, custom_camber_manufacturing, austria_kiel_nindl).

all_consistent(custom_camber_manufacturing) :- consistent(s_skm, custom_camber_manufacturing).

evidence(all_consistent(custom_camber_manufacturing)).
query(true_val(custom_camber_manufacturing, austria_kiel_nindl)).
query(true_val(custom_camber_manufacturing, unk_custom_camber_manufacturing)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values ns_photo_yes_greats_etc=NS_Photosynthesis_Yes_Greats_Stone_Message_LT_Box_Knife_Yes_Basic_Ride_TwinPig unk_comparable_board_cross_brand=Unknown
% @importance 0.8

0.88::acc(s_tgr, comparable_board_cross_brand).

0.72::true_val(comparable_board_cross_brand, ns_photo_yes_greats_etc); 0.28::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s_tgr, comparable_board_cross_brand, ns_photo_yes_greats_etc).

all_consistent(comparable_board_cross_brand) :- consistent(s_tgr, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, ns_photo_yes_greats_etc)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values nora_beck=Nora_Beck_stiff_enough_soft_enough unk_pro_rider_name=Unknown
% @importance 0.6

0.78::acc(s_bur, pro_rider_name).

0.63::true_val(pro_rider_name, nora_beck); 0.37::true_val(pro_rider_name, unk_pro_rider_name).

measured(s_bur, pro_rider_name, nora_beck).

all_consistent(pro_rider_name) :- consistent(s_bur, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, nora_beck)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr pro_rider_name_zoi
% @type categorical
% @canonical false
% @original_name pro_rider_name (Zoi)
% @values zoi_rides_blossom=Zoi_Sadowski_Synnott_rides_Blossom_for_slopestyle unk_pro_rider_name_zoi=Unknown
% @importance 0.55

0.78::acc(s_bur, pro_rider_name_zoi).

0.56::true_val(pro_rider_name_zoi, zoi_rides_blossom); 0.44::true_val(pro_rider_name_zoi, unk_pro_rider_name_zoi).

measured(s_bur, pro_rider_name_zoi, zoi_rides_blossom).

all_consistent(pro_rider_name_zoi) :- consistent(s_bur, pro_rider_name_zoi).

evidence(all_consistent(pro_rider_name_zoi)).
query(true_val(pro_rider_name_zoi, zoi_rides_blossom)).
query(true_val(pro_rider_name_zoi, unk_pro_rider_name_zoi)).

% @attr boot_size_145
% @type categorical
% @canonical false
% @original_name 145cm ideal boot size
% @values us6_5_to_7_5=US_6.5_to_7.5 unk_boot_size_145=Unknown
% @importance 0.75

0.88::acc(s_tgr, boot_size_145).

0.72::true_val(boot_size_145, us6_5_to_7_5); 0.28::true_val(boot_size_145, unk_boot_size_145).

measured(s_tgr, boot_size_145, us6_5_to_7_5).

all_consistent(boot_size_145) :- consistent(s_tgr, boot_size_145).

evidence(all_consistent(boot_size_145)).
query(true_val(boot_size_145, us6_5_to_7_5)).
query(true_val(boot_size_145, unk_boot_size_145)).

% @attr boot_size_148
% @type categorical
% @canonical false
% @original_name 148cm ideal boot size
% @values us7_to_8=US_7_to_8 unk_boot_size_148=Unknown
% @importance 0.75

0.88::acc(s_tgr, boot_size_148).

0.72::true_val(boot_size_148, us7_to_8); 0.28::true_val(boot_size_148, unk_boot_size_148).

measured(s_tgr, boot_size_148, us7_to_8).

all_consistent(boot_size_148) :- consistent(s_tgr, boot_size_148).

evidence(all_consistent(boot_size_148)).
query(true_val(boot_size_148, us7_to_8)).
query(true_val(boot_size_148, unk_boot_size_148)).

% @attr boot_size_152
% @type categorical
% @canonical false
% @original_name 152cm ideal boot size
% @values us7_5_to_8_5=US_7.5_to_8.5 unk_boot_size_152=Unknown
% @importance 0.75

0.88::acc(s_tgr, boot_size_152).

0.72::true_val(boot_size_152, us7_5_to_8_5); 0.28::true_val(boot_size_152, unk_boot_size_152).

measured(s_tgr, boot_size_152, us7_5_to_8_5).

all_consistent(boot_size_152) :- consistent(s_tgr, boot_size_152).

evidence(all_consistent(boot_size_152)).
query(true_val(boot_size_152, us7_5_to_8_5)).
query(true_val(boot_size_152, unk_boot_size_152)).

% @attr boot_size_155
% @type categorical
% @canonical false
% @original_name 155cm ideal boot size
% @values us8_to_9=US_8_to_9 unk_boot_size_155=Unknown
% @importance 0.75

0.88::acc(s_tgr, boot_size_155).

0.72::true_val(boot_size_155, us8_to_9); 0.28::true_val(boot_size_155, unk_boot_size_155).

measured(s_tgr, boot_size_155, us8_to_9).

all_consistent(boot_size_155) :- consistent(s_tgr, boot_size_155).

evidence(all_consistent(boot_size_155)).
query(true_val(boot_size_155, us8_to_9)).
query(true_val(boot_size_155, unk_boot_size_155)).

% @attr boot_size_159
% @type categorical
% @canonical false
% @original_name 159cm ideal boot size
% @values us9_to_10=US_9_to_10 unk_boot_size_159=Unknown
% @importance 0.75

0.88::acc(s_tgr, boot_size_159).

0.72::true_val(boot_size_159, us9_to_10); 0.28::true_val(boot_size_159, unk_boot_size_159).

measured(s_tgr, boot_size_159, us9_to_10).

all_consistent(boot_size_159) :- consistent(s_tgr, boot_size_159).

evidence(all_consistent(boot_size_159)).
query(true_val(boot_size_159, us9_to_10)).
query(true_val(boot_size_159, unk_boot_size_159)).

% @attr boot_size_155w
% @type categorical
% @canonical false
% @original_name 155W ideal boot size
% @values us10_to_11=US_10_to_11 unk_boot_size_155w=Unknown
% @importance 0.75

0.88::acc(s_tgr, boot_size_155w).

0.72::true_val(boot_size_155w, us10_to_11); 0.28::true_val(boot_size_155w, unk_boot_size_155w).

measured(s_tgr, boot_size_155w, us10_to_11).

all_consistent(boot_size_155w) :- consistent(s_tgr, boot_size_155w).

evidence(all_consistent(boot_size_155w)).
query(true_val(boot_size_155w, us10_to_11)).
query(true_val(boot_size_155w, unk_boot_size_155w)).

% @attr boot_size_159w
% @type categorical
% @canonical false
% @original_name 159W ideal boot size
% @values us10_5_to_11_5=US_10.5_to_11.5 unk_boot_size_159w=Unknown
% @importance 0.75

0.88::acc(s_tgr, boot_size_159w).

0.72::true_val(boot_size_159w, us10_5_to_11_5); 0.28::true_val(boot_size_159w, unk_boot_size_159w).

measured(s_tgr, boot_size_159w, us10_5_to_11_5).

all_consistent(boot_size_159w) :- consistent(s_tgr, boot_size_159w).

evidence(all_consistent(boot_size_159w)).
query(true_val(boot_size_159w, us10_5_to_11_5)).
query(true_val(boot_size_159w, unk_boot_size_159w)).

% @attr avg_snowboard_price_context
% @type numeric
% @canonical false
% @original_name Average snowboard price (per Board of the World)
% @unit USD
% @values v468_01=468.01 unk_avg_snowboard_price_context=Unknown
% @importance 0.7

0.78::acc(s_btw, avg_snowboard_price_context).

0.51::true_val(avg_snowboard_price_context, v468_01); 0.49::true_val(avg_snowboard_price_context, unk_avg_snowboard_price_context).

measured(s_btw, avg_snowboard_price_context, v468_01).

all_consistent(avg_snowboard_price_context) :- consistent(s_btw, avg_snowboard_price_context).

evidence(all_consistent(avg_snowboard_price_context)).
query(true_val(avg_snowboard_price_context, v468_01)).
query(true_val(avg_snowboard_price_context, unk_avg_snowboard_price_context)).

% @attr waxing_frequency
% @type categorical
% @canonical false
% @original_name Recommended waxing frequency
% @values every_3_4_days=Every_3_to_4_days_of_riding unk_waxing_frequency=Unknown
% @importance 0.55

0.78::acc(s_btw, waxing_frequency).

0.51::true_val(waxing_frequency, every_3_4_days); 0.49::true_val(waxing_frequency, unk_waxing_frequency).

measured(s_btw, waxing_frequency, every_3_4_days).

all_consistent(waxing_frequency) :- consistent(s_btw, waxing_frequency).

evidence(all_consistent(waxing_frequency)).
query(true_val(waxing_frequency, every_3_4_days)).
query(true_val(waxing_frequency, unk_waxing_frequency)).

% @attr terrain_suitability_park_detail
% @type categorical
% @canonical false
% @original_name terrain_suitability (park detail)
% @values park_jumps_rails_jibs_side_hits=Park_jumps_rails_jibs_side_hits unk_terrain_suitability_park_detail=Unknown
% @importance 0.85

0.85::acc(s_rhy, terrain_suitability_park_detail).
0.85::acc(s_sp, terrain_suitability_park_detail).

0.95::true_val(terrain_suitability_park_detail, park_jumps_rails_jibs_side_hits); 0.05::true_val(terrain_suitability_park_detail, unk_terrain_suitability_park_detail).

measured(s_rhy, terrain_suitability_park_detail, park_jumps_rails_jibs_side_hits).
measured(s_sp, terrain_suitability_park_detail, park_jumps_rails_jibs_side_hits).

all_consistent(terrain_suitability_park_detail) :-
    (indep(s_rhy), consistent(s_rhy, terrain_suitability_park_detail) ; \+indep(s_rhy)),
    consistent(s_sp, terrain_suitability_park_detail).

evidence(all_consistent(terrain_suitability_park_detail)).
query(true_val(terrain_suitability_park_detail, park_jumps_rails_jibs_side_hits)).
query(true_val(terrain_suitability_park_detail, unk_terrain_suitability_park_detail)).

% @attr terrain_suitability_all_mountain_detail
% @type categorical
% @canonical false
% @original_name terrain_suitability (all-mountain detail)
% @values all_mtn_groomers_butter_switch=All_mountain_groomers_buttering_switch unk_terrain_suitability_all_mountain_detail=Unknown
% @importance 0.75

0.85::acc(s_sp, terrain_suitability_all_mountain_detail).

0.68::true_val(terrain_suitability_all_mountain_detail, all_mtn_groomers_butter_switch); 0.32::true_val(terrain_suitability_all_mountain_detail, unk_terrain_suitability_all_mountain_detail).

measured(s_sp, terrain_suitability_all_mountain_detail, all_mtn_groomers_butter_switch).

all_consistent(terrain_suitability_all_mountain_detail) :- consistent(s_sp, terrain_suitability_all_mountain_detail).

evidence(all_consistent(terrain_suitability_all_mountain_detail)).
query(true_val(terrain_suitability_all_mountain_detail, all_mtn_groomers_butter_switch)).
query(true_val(terrain_suitability_all_mountain_detail, unk_terrain_suitability_all_mountain_detail)).

% @attr negative_aspect_unsuitable_terrain
% @type categorical
% @canonical false
% @original_name negative_aspect (unsuitable terrain)
% @values deep_powder_speed_freeride=Deep_powder_high_speed_charging_big_mountain_freeride unk_negative_aspect_unsuitable_terrain=Unknown
% @importance 0.8

0.88::acc(s_tgr, negative_aspect_unsuitable_terrain).
0.85::acc(s_sp, negative_aspect_unsuitable_terrain).

0.95::true_val(negative_aspect_unsuitable_terrain, deep_powder_speed_freeride); 0.05::true_val(negative_aspect_unsuitable_terrain, unk_negative_aspect_unsuitable_terrain).

measured(s_tgr, negative_aspect_unsuitable_terrain, deep_powder_speed_freeride).
measured(s_sp, negative_aspect_unsuitable_terrain, deep_powder_speed_freeride).

all_consistent(negative_aspect_unsuitable_terrain) :-
    consistent(s_tgr, negative_aspect_unsuitable_terrain),
    consistent(s_sp, negative_aspect_unsuitable_terrain).

evidence(all_consistent(negative_aspect_unsuitable_terrain)).
query(true_val(negative_aspect_unsuitable_terrain, deep_powder_speed_freeride)).
query(true_val(negative_aspect_unsuitable_terrain, unk_negative_aspect_unsuitable_terrain)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values burton_cartel=Burton_Cartel_bindings_paired_well unk_binding_compatibility=Unknown
% @importance 0.6

0.78::acc(s_btw, binding_compatibility).

0.51::true_val(binding_compatibility, burton_cartel); 0.49::true_val(binding_compatibility, unk_binding_compatibility).

measured(s_btw, binding_compatibility, burton_cartel).

all_consistent(binding_compatibility) :- consistent(s_btw, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, burton_cartel)).
query(true_val(binding_compatibility, unk_binding_compatibility)).