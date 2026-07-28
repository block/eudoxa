0.15::indep(s2).
0.15::indep(s3).
0.20::indep(s18).
0.20::indep(s21).
0.20::indep(s22).
0.20::indep(s23).
0.15::indep(s24).
0.10::indep(s25).
0.15::indep(s26).
0.20::indep(s27).
0.15::indep(s28).
0.15::indep(s29).
0.15::indep(s43).
0.10::indep(s36).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values capita_mfg=CAPiTA_Snowboards_Capita_MFG_GmbH unk_manufacturer=Unknown
% @importance 0.85

0.95::acc(s1, manufacturer).

0.95::true_val(manufacturer, capita_mfg); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s1, manufacturer, capita_mfg).

all_consistent(manufacturer) :- consistent(s1, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, capita_mfg)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values capita=CAPiTA unk_brand=Unknown
% @importance 0.85

0.95::acc(s1, brand).

0.95::true_val(brand, capita); 0.05::true_val(brand, unk_brand).

measured(s1, brand, capita).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, capita)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values pathfinder=Pathfinder unk_model_name=Unknown
% @importance 1.0

0.88::acc(s2, model_name).

0.95::true_val(model_name, pathfinder); 0.05::true_val(model_name, unk_model_name).

measured(s2, model_name, pathfinder).

all_consistent(model_name) :-
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, pathfinder)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values v2027=2027 v2026=2026
% @importance 1.0

0.82::acc(s2, model_year).
0.82::acc(s3, model_year).

0.50::true_val(model_year, v2027); 0.50::true_val(model_year, v2026).

measured(s2, model_year, v2027).
measured(s3, model_year, v2026).

all_consistent(model_year) :-
    (indep(s2), consistent(s2, model_year) ; \+indep(s2)),
    (indep(s3), consistent(s3, model_year) ; \+indep(s3)).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, v2026)).

% @attr brand_founding_year
% @type numeric
% @canonical false
% @original_name Brand founding year
% @values v2000=2000 unk_brand_founding_year=Unknown
% @importance 0.50

0.92::acc(s4, brand_founding_year).

0.90::true_val(brand_founding_year, v2000); 0.10::true_val(brand_founding_year, unk_brand_founding_year).

measured(s4, brand_founding_year, v2000).

all_consistent(brand_founding_year) :- consistent(s4, brand_founding_year).

evidence(all_consistent(brand_founding_year)).
query(true_val(brand_founding_year, v2000)).
query(true_val(brand_founding_year, unk_brand_founding_year)).

% @attr brand_founders
% @type categorical
% @canonical false
% @original_name Brand founders
% @values brown_montgomery=Jason_Brown_and_Blue_Montgomery unk_brand_founders=Unknown
% @importance 0.30

0.85::acc(s5, brand_founders).

0.82::true_val(brand_founders, brown_montgomery); 0.18::true_val(brand_founders, unk_brand_founders).

measured(s5, brand_founders, brown_montgomery).

all_consistent(brand_founders) :- consistent(s5, brand_founders).

evidence(all_consistent(brand_founders)).
query(true_val(brand_founders, brown_montgomery)).
query(true_val(brand_founders, unk_brand_founders)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.88::acc(s2, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    (indep(s2), consistent(s2, product_type) ; \+indep(s2)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 1.0

0.85::acc(s2, board_category).

0.90::true_val(board_category, freestyle_all_mountain); 0.10::true_val(board_category, unk_board_category).

measured(s2, board_category, freestyle_all_mountain).

all_consistent(board_category) :-
    (indep(s2), consistent(s2, board_category) ; \+indep(s2)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr board_category_detail
% @type categorical
% @canonical false
% @original_name board_category (detail)
% @values freestyle_twin_reverse=Freestyle_True_Twin_Reverse_Camber unk_board_category_detail=Unknown
% @importance 0.95

0.95::acc(s6, board_category_detail).

0.95::true_val(board_category_detail, freestyle_twin_reverse); 0.05::true_val(board_category_detail, unk_board_category_detail).

measured(s6, board_category_detail, freestyle_twin_reverse).

all_consistent(board_category_detail) :- consistent(s6, board_category_detail).

evidence(all_consistent(board_category_detail)).
query(true_val(board_category_detail, freestyle_twin_reverse)).
query(true_val(board_category_detail, unk_board_category_detail)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unisex=Unisex
% @importance 1.0

0.80::acc(s2, gender).
0.80::acc(s3, gender).

0.55::true_val(gender, mens); 0.45::true_val(gender, unisex).

measured(s2, gender, mens).
measured(s3, gender, unisex).

all_consistent(gender) :-
    (indep(s2), consistent(s2, gender) ; \+indep(s2)),
    (indep(s3), consistent(s3, gender) ; \+indep(s3)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unisex)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values horrorscope=Horrorscope_series unk_predecessor_model_name=Unknown
% @importance 0.525

0.85::acc(s7, predecessor_model_name).
0.82::acc(s8, predecessor_model_name).

0.95::true_val(predecessor_model_name, horrorscope); 0.05::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s7, predecessor_model_name, horrorscope).
measured(s8, predecessor_model_name, horrorscope).

all_consistent(predecessor_model_name) :-
    consistent(s7, predecessor_model_name),
    consistent(s8, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, horrorscope)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr model_lineage_note
% @type categorical
% @canonical false
% @original_name Model lineage note
% @values camber_discontinued_2025=Last_Pathfinder_Camber_was_2025_only_reverse_continues unk_model_lineage_note=Unknown
% @importance 0.70

0.85::acc(s9, model_lineage_note).

0.80::true_val(model_lineage_note, camber_discontinued_2025); 0.20::true_val(model_lineage_note, unk_model_lineage_note).

measured(s9, model_lineage_note, camber_discontinued_2025).

all_consistent(model_lineage_note) :- consistent(s9, model_lineage_note).

evidence(all_consistent(model_lineage_note)).
query(true_val(model_lineage_note, camber_discontinued_2025)).
query(true_val(model_lineage_note, unk_model_lineage_note)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values austria_mothership=Handcrafted_in_Austria_at_The_MotherShip unk_manufacturing_location=Unknown
% @importance 0.85

0.95::acc(s1, manufacturing_location).

0.95::true_val(manufacturing_location, austria_mothership); 0.05::true_val(manufacturing_location, unk_manufacturing_location).

measured(s1, manufacturing_location, austria_mothership).

all_consistent(manufacturing_location) :- consistent(s1, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, austria_mothership)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr sust_cert_clean_energy
% @type categorical
% @canonical false
% @original_name sustainability_certification (clean energy)
% @values self_generated_clean_energy=100pct_self_generated_clean_energy unk_sust_cert_clean_energy=Unknown
% @importance 0.85

0.95::acc(s1, sust_cert_clean_energy).

0.95::true_val(sust_cert_clean_energy, self_generated_clean_energy); 0.05::true_val(sust_cert_clean_energy, unk_sust_cert_clean_energy).

measured(s1, sust_cert_clean_energy, self_generated_clean_energy).

all_consistent(sust_cert_clean_energy) :- consistent(s1, sust_cert_clean_energy).

evidence(all_consistent(sust_cert_clean_energy)).
query(true_val(sust_cert_clean_energy, self_generated_clean_energy)).
query(true_val(sust_cert_clean_energy, unk_sust_cert_clean_energy)).

% @attr sust_cert_energy_system
% @type categorical
% @canonical false
% @original_name sustainability_certification (energy system)
% @values hydro_nh3_solar=Hydro_NH3_thermal_plus_solar unk_sust_cert_energy_system=Unknown
% @importance 0.40

0.93::acc(s10, sust_cert_energy_system).

0.92::true_val(sust_cert_energy_system, hydro_nh3_solar); 0.08::true_val(sust_cert_energy_system, unk_sust_cert_energy_system).

measured(s10, sust_cert_energy_system, hydro_nh3_solar).

all_consistent(sust_cert_energy_system) :- consistent(s10, sust_cert_energy_system).

evidence(all_consistent(sust_cert_energy_system)).
query(true_val(sust_cert_energy_system, hydro_nh3_solar)).
query(true_val(sust_cert_energy_system, unk_sust_cert_energy_system)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values certified_b_corp=Certified_B_Corporation unk_sustainability_certification=Unknown
% @importance 0.45

0.93::acc(s11, sustainability_certification).

0.92::true_val(sustainability_certification, certified_b_corp); 0.08::true_val(sustainability_certification, unk_sustainability_certification).

measured(s11, sustainability_certification, certified_b_corp).

all_consistent(sustainability_certification) :- consistent(s11, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, certified_b_corp)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sust_cert_b_corp_score
% @type numeric
% @canonical false
% @original_name sustainability_certification (B Corp score)
% @values v98_9=98.9 unk_sust_cert_b_corp_score=Unknown
% @importance 0.40

0.95::acc(s12, sust_cert_b_corp_score).

0.95::true_val(sust_cert_b_corp_score, v98_9); 0.05::true_val(sust_cert_b_corp_score, unk_sust_cert_b_corp_score).

measured(s12, sust_cert_b_corp_score, v98_9).

all_consistent(sust_cert_b_corp_score) :- consistent(s12, sust_cert_b_corp_score).

evidence(all_consistent(sust_cert_b_corp_score)).
query(true_val(sust_cert_b_corp_score, v98_9)).
query(true_val(sust_cert_b_corp_score, unk_sust_cert_b_corp_score)).

% @attr sust_cert_energy_globe
% @type categorical
% @canonical false
% @original_name sustainability_certification (Energy Globe Award)
% @values energy_globe_austria_2017=Energy_Globe_Award_Austria_2017 unk_sust_cert_energy_globe=Unknown
% @importance 0.35

0.78::acc(s13, sust_cert_energy_globe).

0.75::true_val(sust_cert_energy_globe, energy_globe_austria_2017); 0.25::true_val(sust_cert_energy_globe, unk_sust_cert_energy_globe).

measured(s13, sust_cert_energy_globe, energy_globe_austria_2017).

all_consistent(sust_cert_energy_globe) :- consistent(s13, sust_cert_energy_globe).

evidence(all_consistent(sust_cert_energy_globe)).
query(true_val(sust_cert_energy_globe, energy_globe_austria_2017)).
query(true_val(sust_cert_energy_globe, unk_sust_cert_energy_globe)).

% @attr nfc_technology
% @type categorical
% @canonical false
% @original_name NFC technology
% @values embedded_nfc_nose=Embedded_NFC_chip_in_nose unk_nfc_technology=Unknown
% @importance 0.40

0.93::acc(s14, nfc_technology).

0.92::true_val(nfc_technology, embedded_nfc_nose); 0.08::true_val(nfc_technology, unk_nfc_technology).

measured(s14, nfc_technology, embedded_nfc_nose).

all_consistent(nfc_technology) :- consistent(s14, nfc_technology).

evidence(all_consistent(nfc_technology)).
query(true_val(nfc_technology, embedded_nfc_nose)).
query(true_val(nfc_technology, unk_nfc_technology)).

% @attr nfc_introduction_year
% @type numeric
% @canonical false
% @original_name NFC introduction year
% @values v2020=2020 unk_nfc_introduction_year=Unknown
% @importance 0.30

0.92::acc(s15, nfc_introduction_year).

0.90::true_val(nfc_introduction_year, v2020); 0.10::true_val(nfc_introduction_year, unk_nfc_introduction_year).

measured(s15, nfc_introduction_year, v2020).

all_consistent(nfc_introduction_year) :- consistent(s15, nfc_introduction_year).

evidence(all_consistent(nfc_introduction_year)).
query(true_val(nfc_introduction_year, v2020)).
query(true_val(nfc_introduction_year, unk_nfc_introduction_year)).

% @attr ink_type
% @type categorical
% @canonical false
% @original_name Ink type
% @values solventless_water_uv=Solventless_water_based_UV_ink unk_ink_type=Unknown
% @importance 0.25

0.85::acc(s16, ink_type).

0.82::true_val(ink_type, solventless_water_uv); 0.18::true_val(ink_type, unk_ink_type).

measured(s16, ink_type, solventless_water_uv).

all_consistent(ink_type) :-
    (indep(s16), consistent(s16, ink_type) ; \+indep(s16)).

evidence(all_consistent(ink_type)).
query(true_val(ink_type, solventless_water_uv)).
query(true_val(ink_type, unk_ink_type)).

% @attr topsheet_technology
% @type categorical
% @canonical false
% @original_name Topsheet technology
% @values pam16000=PAM16000_16000_nozzle_digital_plus_screen unk_topsheet_technology=Unknown
% @importance 0.25

0.85::acc(s16, topsheet_technology).

0.82::true_val(topsheet_technology, pam16000); 0.18::true_val(topsheet_technology, unk_topsheet_technology).

measured(s16, topsheet_technology, pam16000).

all_consistent(topsheet_technology) :-
    (indep(s16), consistent(s16, topsheet_technology) ; \+indep(s16)).

evidence(all_consistent(topsheet_technology)).
query(true_val(topsheet_technology, pam16000)).
query(true_val(topsheet_technology, unk_topsheet_technology)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values metallic_screen_gloss_matte=Metallic_Screen_and_Gloss_Matte_Print unk_topsheet=Unknown
% @importance 1.0

0.85::acc(s2, topsheet).

0.90::true_val(topsheet, metallic_screen_gloss_matte); 0.10::true_val(topsheet, unk_topsheet).

measured(s2, topsheet, metallic_screen_gloss_matte).

all_consistent(topsheet) :-
    (indep(s2), consistent(s2, topsheet) ; \+indep(s2)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, metallic_screen_gloss_matte)).
query(true_val(topsheet, unk_topsheet)).

% @attr edge_bevel_spec
% @type numeric
% @canonical true
% @original_name edge_bevel_spec
% @unit degree
% @values v1_degree=1.0 unk_edge_bevel_spec=Unknown
% @importance 0.50

0.90::acc(s17, edge_bevel_spec).

0.88::true_val(edge_bevel_spec, v1_degree); 0.12::true_val(edge_bevel_spec, unk_edge_bevel_spec).

measured(s17, edge_bevel_spec, v1_degree).

all_consistent(edge_bevel_spec) :- consistent(s17, edge_bevel_spec).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, v1_degree)).
query(true_val(edge_bevel_spec, unk_edge_bevel_spec)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin_symmetrical unk_shape=Unknown
% @importance 1.0

0.85::acc(s2, shape).

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).

measured(s2, shape, true_twin).

all_consistent(shape) :-
    (indep(s2), consistent(s2, shape) ; \+indep(s2)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values park_v2_flat_kick=Park_V2_Flat_Kick_dual_reverse_camber unk_camber_type=Unknown
% @importance 0.95

0.85::acc(s2, camber_type).
0.85::acc(s18, camber_type).

0.95::true_val(camber_type, park_v2_flat_kick); 0.05::true_val(camber_type, unk_camber_type).

measured(s2, camber_type, park_v2_flat_kick).
measured(s18, camber_type, park_v2_flat_kick).

all_consistent(camber_type) :-
    (indep(s2), consistent(s2, camber_type) ; \+indep(s2)),
    (indep(s18), consistent(s18, camber_type) ; \+indep(s18)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, park_v2_flat_kick)).
query(true_val(camber_type, unk_camber_type)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v4=4.0 unk_flex_rating_10=Unknown
% @importance 1.0

0.88::acc(s2, flex_rating_10).

0.90::true_val(flex_rating_10, v4); 0.10::true_val(flex_rating_10, unk_flex_rating_10).

measured(s2, flex_rating_10, v4).

all_consistent(flex_rating_10) :-
    (indep(s2), consistent(s2, flex_rating_10) ; \+indep(s2)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values medium=Medium_3to5 unk_flex_rating_10_evo=Unknown
% @importance 0.85

0.82::acc(s19, flex_rating_10_evo).

0.82::true_val(flex_rating_10_evo, medium); 0.18::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s19, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :- consistent(s19, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel_on_snow
% @type numeric
% @canonical false
% @original_name flex_feel (on-snow measurement)
% @unit /10
% @values v3_5=3.5 v4=4.0
% @importance 0.80

0.82::acc(s20, flex_feel_on_snow).

0.55::true_val(flex_feel_on_snow, v3_5); 0.45::true_val(flex_feel_on_snow, v4).

measured(s20, flex_feel_on_snow, v3_5).

all_consistent(flex_feel_on_snow) :- consistent(s20, flex_feel_on_snow).

evidence(all_consistent(flex_feel_on_snow)).
query(true_val(flex_feel_on_snow, v3_5)).
query(true_val(flex_feel_on_snow, v4)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_symmetrical=Twin_symmetrical_flex unk_flex_direction=Unknown
% @importance 1.0

0.82::acc(s3, flex_direction).

0.85::true_val(flex_direction, twin_symmetrical); 0.15::true_val(flex_direction, unk_flex_direction).

measured(s3, flex_direction, twin_symmetrical).

all_consistent(flex_direction) :-
    (indep(s3), consistent(s3, flex_direction) ; \+indep(s3)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radial=Radial_single_radius unk_sidecut_type=Unknown
% @importance 0.825

0.85::acc(s2, sidecut_type).
0.82::acc(s21, sidecut_type).

0.95::true_val(sidecut_type, radial); 0.05::true_val(sidecut_type, unk_sidecut_type).

measured(s2, sidecut_type, radial).
measured(s21, sidecut_type, radial).

all_consistent(sidecut_type) :-
    (indep(s2), consistent(s2, sidecut_type) ; \+indep(s2)),
    (indep(s21), consistent(s21, sidecut_type) ; \+indep(s21)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.85::acc(s2, mounting_pattern).

0.90::true_val(mounting_pattern, inserts_2x4); 0.10::true_val(mounting_pattern, unk_mounting_pattern).

measured(s2, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s2), consistent(s2, mounting_pattern) ; \+indep(s2)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit cm
% @values v0=0.0 unk_setback=Unknown
% @importance 1.0

0.85::acc(s2, setback).

0.90::true_val(setback, v0); 0.10::true_val(setback, unk_setback).

measured(s2, setback, v0).

all_consistent(setback) :-
    (indep(s2), consistent(s2, setback) ; \+indep(s2)).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v0=0.0 unk_taper=Unknown
% @importance 1.0

0.82::acc(s3, taper).

0.85::true_val(taper, v0); 0.15::true_val(taper, unk_taper).

measured(s3, taper, v0).

all_consistent(taper) :-
    (indep(s3), consistent(s3, taper) ; \+indep(s3)).

evidence(all_consistent(taper)).
query(true_val(taper, v0)).
query(true_val(taper, unk_taper)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 1.0

0.85::acc(s2, width_options).

0.90::true_val(width_options, standard_and_wide); 0.10::true_val(width_options, unk_width_options).

measured(s2, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(s2), consistent(s2, width_options) ; \+indep(s2)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values dual_core_poplar_beech=Dual_Core_Poplar_and_Beech unk_core_material=Unknown
% @importance 0.875

0.85::acc(s2, core_material).
0.82::acc(s22, core_material).

0.95::true_val(core_material, dual_core_poplar_beech); 0.05::true_val(core_material, unk_core_material).

measured(s2, core_material, dual_core_poplar_beech).
measured(s22, core_material, dual_core_poplar_beech).

all_consistent(core_material) :-
    (indep(s2), consistent(s2, core_material) ; \+indep(s2)),
    (indep(s22), consistent(s22, core_material) ; \+indep(s22)).

evidence(all_consistent(core_material)).
query(true_val(core_material, dual_core_poplar_beech)).
query(true_val(core_material, unk_core_material)).

% @attr sust_cert_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_certified_dual_core=FSC_Certified_Dual_Core unk_sust_cert_fsc=Unknown
% @importance 0.45

0.80::acc(s23, sust_cert_fsc).

0.78::true_val(sust_cert_fsc, fsc_certified_dual_core); 0.22::true_val(sust_cert_fsc, unk_sust_cert_fsc).

measured(s23, sust_cert_fsc, fsc_certified_dual_core).

all_consistent(sust_cert_fsc) :-
    (indep(s23), consistent(s23, sust_cert_fsc) ; \+indep(s23)).

evidence(all_consistent(sust_cert_fsc)).
query(true_val(sust_cert_fsc, fsc_certified_dual_core)).
query(true_val(sust_cert_fsc, unk_sust_cert_fsc)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values special_blend_biax=Special_Blend_Fiberglass_biaxial unk_laminate=Unknown
% @importance 0.625

0.85::acc(s2, laminate).
0.82::acc(s24, laminate).
0.78::acc(s25, laminate).

0.95::true_val(laminate, special_blend_biax); 0.05::true_val(laminate, unk_laminate).

measured(s2, laminate, special_blend_biax).
measured(s24, laminate, special_blend_biax).
measured(s25, laminate, special_blend_biax).

all_consistent(laminate) :-
    (indep(s2), consistent(s2, laminate) ; \+indep(s2)),
    (indep(s24), consistent(s24, laminate) ; \+indep(s24)),
    (indep(s25), consistent(s25, laminate) ; \+indep(s25)).

evidence(all_consistent(laminate)).
query(true_val(laminate, special_blend_biax)).
query(true_val(laminate, unk_laminate)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values magic_bean=Magic_Bean_Resin_plant_based unk_resin=Unknown
% @importance 0.45

0.85::acc(s2, resin).
0.82::acc(s26, resin).
0.82::acc(s27, resin).

0.95::true_val(resin, magic_bean); 0.05::true_val(resin, unk_resin).

measured(s2, resin, magic_bean).
measured(s26, resin, magic_bean).
measured(s27, resin, magic_bean).

all_consistent(resin) :-
    (indep(s2), consistent(s2, resin) ; \+indep(s2)),
    (indep(s26), consistent(s26, resin) ; \+indep(s26)),
    (indep(s27), consistent(s27, resin) ; \+indep(s27)).

evidence(all_consistent(resin)).
query(true_val(resin, magic_bean)).
query(true_val(resin, unk_resin)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values superdrive_screen_print=Superdrive_Base_Screen_Print unk_base_type=Unknown
% @importance 1.0

0.85::acc(s2, base_type).

0.90::true_val(base_type, superdrive_screen_print); 0.10::true_val(base_type, unk_base_type).

measured(s2, base_type, superdrive_screen_print).

all_consistent(base_type) :-
    (indep(s2), consistent(s2, base_type) ; \+indep(s2)).

evidence(all_consistent(base_type)).
query(true_val(base_type, superdrive_screen_print)).
query(true_val(base_type, unk_base_type)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintruded=Sintruded_sintered_extruded_hybrid unk_base_material=Unknown
% @importance 0.65

0.78::acc(s28, base_material).

0.75::true_val(base_material, sintruded); 0.25::true_val(base_material, unk_base_material).

measured(s28, base_material, sintruded).

all_consistent(base_material) :-
    (indep(s28), consistent(s28, base_material) ; \+indep(s28)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintruded)).
query(true_val(base_material, unk_base_material)).

% @attr nose_tail_design
% @type categorical
% @canonical false
% @original_name Nose and tail design
% @values shortened_blunt=Shortened_blunt_tip_nose_tail_reduced_swing_weight unk_nose_tail_design=Unknown
% @importance 1.0

0.85::acc(s2, nose_tail_design).

0.90::true_val(nose_tail_design, shortened_blunt); 0.10::true_val(nose_tail_design, unk_nose_tail_design).

measured(s2, nose_tail_design, shortened_blunt).

all_consistent(nose_tail_design) :-
    (indep(s2), consistent(s2, nose_tail_design) ; \+indep(s2)).

evidence(all_consistent(nose_tail_design)).
query(true_val(nose_tail_design, shortened_blunt)).
query(true_val(nose_tail_design, unk_nose_tail_design)).

% @attr nose_tail_reinforcement
% @type categorical
% @canonical false
% @original_name Nose and tail reinforcement
% @values reinforced_blocks=Reinforced_nose_tail_blocks_for_durability unk_nose_tail_reinforcement=Unknown
% @importance 1.0

0.85::acc(s2, nose_tail_reinforcement).

0.90::true_val(nose_tail_reinforcement, reinforced_blocks); 0.10::true_val(nose_tail_reinforcement, unk_nose_tail_reinforcement).

measured(s2, nose_tail_reinforcement, reinforced_blocks).

all_consistent(nose_tail_reinforcement) :-
    (indep(s2), consistent(s2, nose_tail_reinforcement) ; \+indep(s2)).

evidence(all_consistent(nose_tail_reinforcement)).
query(true_val(nose_tail_reinforcement, reinforced_blocks)).
query(true_val(nose_tail_reinforcement, unk_nose_tail_reinforcement)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values bitter_end_deflection=Bitter_End_Deflection_Tuning unk_edge_technology=Unknown
% @importance 0.60

0.80::acc(s29, edge_technology).

0.78::true_val(edge_technology, bitter_end_deflection); 0.22::true_val(edge_technology, unk_edge_technology).

measured(s29, edge_technology, bitter_end_deflection).

all_consistent(edge_technology) :-
    (indep(s29), consistent(s29, edge_technology) ; \+indep(s29)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, bitter_end_deflection)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s151_153_155_157=151_153_155_157cm unk_available_sizes=Unknown
% @importance 1.0

0.85::acc(s2, available_sizes).

0.90::true_val(available_sizes, s151_153_155_157); 0.10::true_val(available_sizes, unk_available_sizes).

measured(s2, available_sizes, s151_153_155_157).

all_consistent(available_sizes) :-
    (indep(s2), consistent(s2, available_sizes) ; \+indep(s2)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s151_153_155_157)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_wide
% @type categorical
% @canonical false
% @original_name available_sizes (wide)
% @values wide_157w_only=157W_only wide_5sizes=153W_155W_157W_159W_162W
% @importance 1.0

0.80::acc(s2, available_sizes_wide).
0.82::acc(s3, available_sizes_wide).

0.35::true_val(available_sizes_wide, wide_157w_only); 0.65::true_val(available_sizes_wide, wide_5sizes).

measured(s2, available_sizes_wide, wide_157w_only).
measured(s3, available_sizes_wide, wide_5sizes).

all_consistent(available_sizes_wide) :-
    (indep(s2), consistent(s2, available_sizes_wide) ; \+indep(s2)),
    (indep(s3), consistent(s3, available_sizes_wide) ; \+indep(s3)).

evidence(all_consistent(available_sizes_wide)).
query(true_val(available_sizes_wide, wide_157w_only)).
query(true_val(available_sizes_wide, wide_5sizes)).

% @attr available_sizes_full
% @type categorical
% @canonical false
% @original_name available_sizes (full list)
% @values full_list_the_house=145_147_149_153W_155W_157W_159W_162W unk_available_sizes_full=Unknown
% @importance 1.0

0.82::acc(s3, available_sizes_full).

0.85::true_val(available_sizes_full, full_list_the_house); 0.15::true_val(available_sizes_full, unk_available_sizes_full).

measured(s3, available_sizes_full, full_list_the_house).

all_consistent(available_sizes_full) :-
    (indep(s3), consistent(s3, available_sizes_full) ; \+indep(s3)).

evidence(all_consistent(available_sizes_full)).
query(true_val(available_sizes_full, full_list_the_house)).
query(true_val(available_sizes_full, unk_available_sizes_full)).

% @attr effective_edge_151
% @type numeric
% @canonical false
% @original_name Effective edge 151cm
% @unit mm
% @values v1202=1202.0 v1203=1203.0
% @importance 1.0

0.83::acc(s2, effective_edge_151).
0.83::acc(s3, effective_edge_151).

0.50::true_val(effective_edge_151, v1202); 0.50::true_val(effective_edge_151, v1203).

measured(s2, effective_edge_151, v1202).
measured(s3, effective_edge_151, v1203).

all_consistent(effective_edge_151) :-
    (indep(s2), consistent(s2, effective_edge_151) ; \+indep(s2)),
    (indep(s3), consistent(s3, effective_edge_151) ; \+indep(s3)).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v1202)).
query(true_val(effective_edge_151, v1203)).

% @attr effective_edge_153
% @type numeric
% @canonical false
% @original_name Effective edge 153cm
% @unit mm
% @values v1218=1218.0 unk_effective_edge_153=Unknown
% @importance 1.0

0.83::acc(s2, effective_edge_153).
0.83::acc(s3, effective_edge_153).

0.95::true_val(effective_edge_153, v1218); 0.05::true_val(effective_edge_153, unk_effective_edge_153).

measured(s2, effective_edge_153, v1218).
measured(s3, effective_edge_153, v1218).

all_consistent(effective_edge_153) :-
    (indep(s2), consistent(s2, effective_edge_153) ; \+indep(s2)),
    (indep(s3), consistent(s3, effective_edge_153) ; \+indep(s3)).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v1218)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

% @attr effective_edge_155
% @type numeric
% @canonical false
% @original_name Effective edge 155cm
% @unit mm
% @values v1234=1234.0 v1235=1235.0
% @importance 1.0

0.83::acc(s2, effective_edge_155).
0.83::acc(s3, effective_edge_155).

0.50::true_val(effective_edge_155, v1234); 0.50::true_val(effective_edge_155, v1235).

measured(s2, effective_edge_155, v1234).
measured(s3, effective_edge_155, v1235).

all_consistent(effective_edge_155) :-
    (indep(s2), consistent(s2, effective_edge_155) ; \+indep(s2)),
    (indep(s3), consistent(s3, effective_edge_155) ; \+indep(s3)).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v1234)).
query(true_val(effective_edge_155, v1235)).

% @attr effective_edge_157
% @type numeric
% @canonical false
% @original_name Effective edge 157cm
% @unit mm
% @values v1250=1250.0 v1251=1251.0
% @importance 1.0

0.83::acc(s2, effective_edge_157).
0.83::acc(s3, effective_edge_157).

0.50::true_val(effective_edge_157, v1250); 0.50::true_val(effective_edge_157, v1251).

measured(s2, effective_edge_157, v1250).
measured(s3, effective_edge_157, v1251).

all_consistent(effective_edge_157) :-
    (indep(s2), consistent(s2, effective_edge_157) ; \+indep(s2)),
    (indep(s3), consistent(s3, effective_edge_157) ; \+indep(s3)).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v1250)).
query(true_val(effective_edge_157, v1251)).

% @attr effective_edge_157w
% @type numeric
% @canonical false
% @original_name Effective edge 157W
% @unit mm
% @values v1250=1250.0 v1251=1251.0
% @importance 1.0

0.83::acc(s2, effective_edge_157w).
0.83::acc(s3, effective_edge_157w).

0.50::true_val(effective_edge_157w, v1250); 0.50::true_val(effective_edge_157w, v1251).

measured(s2, effective_edge_157w, v1250).
measured(s3, effective_edge_157w, v1251).

all_consistent(effective_edge_157w) :-
    (indep(s2), consistent(s2, effective_edge_157w) ; \+indep(s2)),
    (indep(s3), consistent(s3, effective_edge_157w) ; \+indep(s3)).

evidence(all_consistent(effective_edge_157w)).
query(true_val(effective_edge_157w, v1250)).
query(true_val(effective_edge_157w, v1251)).

% @attr sidecut_radius_size_151
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (151cm)
% @unit m
% @values v7_7=7.7 unk_sidecut_radius_size_151=Unknown
% @importance 1.0

0.83::acc(s2, sidecut_radius_size_151).
0.83::acc(s3, sidecut_radius_size_151).

0.95::true_val(sidecut_radius_size_151, v7_7); 0.05::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).

measured(s2, sidecut_radius_size_151, v7_7).
measured(s3, sidecut_radius_size_151, v7_7).

all_consistent(sidecut_radius_size_151) :-
    (indep(s2), consistent(s2, sidecut_radius_size_151) ; \+indep(s2)),
    (indep(s3), consistent(s3, sidecut_radius_size_151) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v7_7)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

% @attr sidecut_radius_size_153
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (153cm)
% @unit m
% @values v7_8=7.8 unk_sidecut_radius_size_153=Unknown
% @importance 1.0

0.83::acc(s2, sidecut_radius_size_153).
0.83::acc(s3, sidecut_radius_size_153).

0.95::true_val(sidecut_radius_size_153, v7_8); 0.05::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(s2, sidecut_radius_size_153, v7_8).
measured(s3, sidecut_radius_size_153, v7_8).

all_consistent(sidecut_radius_size_153) :-
    (indep(s2), consistent(s2, sidecut_radius_size_153) ; \+indep(s2)),
    (indep(s3), consistent(s3, sidecut_radius_size_153) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v7_8)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_9=7.9 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.83::acc(s2, sidecut_radius_size).
0.83::acc(s3, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v7_9); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s2, sidecut_radius_size, v7_9).
measured(s3, sidecut_radius_size, v7_9).

all_consistent(sidecut_radius_size) :-
    (indep(s2), consistent(s2, sidecut_radius_size) ; \+indep(s2)),
    (indep(s3), consistent(s3, sidecut_radius_size) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_9)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_157
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (157cm)
% @unit m
% @values v8_0=8.0 unk_sidecut_radius_size_157=Unknown
% @importance 1.0

0.83::acc(s2, sidecut_radius_size_157).
0.83::acc(s3, sidecut_radius_size_157).

0.95::true_val(sidecut_radius_size_157, v8_0); 0.05::true_val(sidecut_radius_size_157, unk_sidecut_radius_size_157).

measured(s2, sidecut_radius_size_157, v8_0).
measured(s3, sidecut_radius_size_157, v8_0).

all_consistent(sidecut_radius_size_157) :-
    (indep(s2), consistent(s2, sidecut_radius_size_157) ; \+indep(s2)),
    (indep(s3), consistent(s3, sidecut_radius_size_157) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_157)).
query(true_val(sidecut_radius_size_157, v8_0)).
query(true_val(sidecut_radius_size_157, unk_sidecut_radius_size_157)).

% @attr sidecut_radius_size_159w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (159W)
% @unit m
% @values v8_2=8.2 v8_3=8.3
% @importance 1.0

0.83::acc(s2, sidecut_radius_size_159w).
0.83::acc(s3, sidecut_radius_size_159w).

0.50::true_val(sidecut_radius_size_159w, v8_2); 0.50::true_val(sidecut_radius_size_159w, v8_3).

measured(s2, sidecut_radius_size_159w, v8_2).
measured(s3, sidecut_radius_size_159w, v8_3).

all_consistent(sidecut_radius_size_159w) :-
    (indep(s2), consistent(s2, sidecut_radius_size_159w) ; \+indep(s2)),
    (indep(s3), consistent(s3, sidecut_radius_size_159w) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_159w)).
query(true_val(sidecut_radius_size_159w, v8_2)).
query(true_val(sidecut_radius_size_159w, v8_3)).

% @attr sidecut_radius_size_162w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (162W)
% @unit m
% @values v8_2=8.2 v8_3=8.3
% @importance 1.0

0.83::acc(s2, sidecut_radius_size_162w).
0.83::acc(s3, sidecut_radius_size_162w).

0.50::true_val(sidecut_radius_size_162w, v8_2); 0.50::true_val(sidecut_radius_size_162w, v8_3).

measured(s2, sidecut_radius_size_162w, v8_2).
measured(s3, sidecut_radius_size_162w, v8_3).

all_consistent(sidecut_radius_size_162w) :-
    (indep(s2), consistent(s2, sidecut_radius_size_162w) ; \+indep(s2)),
    (indep(s3), consistent(s3, sidecut_radius_size_162w) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_162w)).
query(true_val(sidecut_radius_size_162w, v8_2)).
query(true_val(sidecut_radius_size_162w, v8_3)).

% @attr waist_width_151
% @type numeric
% @canonical false
% @original_name Waist width 151cm
% @unit cm
% @values v25_2=25.2 unk_waist_width_151=Unknown
% @importance 1.0

0.83::acc(s2, waist_width_151).
0.83::acc(s3, waist_width_151).

0.95::true_val(waist_width_151, v25_2); 0.05::true_val(waist_width_151, unk_waist_width_151).

measured(s2, waist_width_151, v25_2).
measured(s3, waist_width_151, v25_2).

all_consistent(waist_width_151) :-
    (indep(s2), consistent(s2, waist_width_151) ; \+indep(s2)),
    (indep(s3), consistent(s3, waist_width_151) ; \+indep(s3)).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v25_2)).
query(true_val(waist_width_151, unk_waist_width_151)).

% @attr waist_width_153
% @type numeric
% @canonical false
% @original_name Waist width 153cm
% @unit cm
% @values v25_4=25.4 unk_waist_width_153=Unknown
% @importance 1.0

0.83::acc(s2, waist_width_153).
0.83::acc(s3, waist_width_153).

0.95::true_val(waist_width_153, v25_4); 0.05::true_val(waist_width_153, unk_waist_width_153).

measured(s2, waist_width_153, v25_4).
measured(s3, waist_width_153, v25_4).

all_consistent(waist_width_153) :-
    (indep(s2), consistent(s2, waist_width_153) ; \+indep(s2)),
    (indep(s3), consistent(s3, waist_width_153) ; \+indep(s3)).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_4)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name Waist width 155cm
% @unit cm
% @values v25_6=25.6 unk_waist_width_155=Unknown
% @importance 1.0

0.83::acc(s2, waist_width_155).
0.83::acc(s3, waist_width_155).

0.95::true_val(waist_width_155, v25_6); 0.05::true_val(waist_width_155, unk_waist_width_155).

measured(s2, waist_width_155, v25_6).
measured(s3, waist_width_155, v25_6).

all_consistent(waist_width_155) :-
    (indep(s2), consistent(s2, waist_width_155) ; \+indep(s2)),
    (indep(s3), consistent(s3, waist_width_155) ; \+indep(s3)).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_6)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr waist_width_157
% @type numeric
% @canonical false
% @original_name Waist width 157cm
% @unit cm
% @values v25_8=25.8 unk_waist_width_157=Unknown
% @importance 1.0

0.83::acc(s2, waist_width_157).
0.83::acc(s3, waist_width_157).

0.95::true_val(waist_width_157, v25_8); 0.05::true_val(waist_width_157, unk_waist_width_157).

measured(s2, waist_width_157, v25_8).
measured(s3, waist_width_157, v25_8).

all_consistent(waist_width_157) :-
    (indep(s2), consistent(s2, waist_width_157) ; \+indep(s2)),
    (indep(s3), consistent(s3, waist_width_157) ; \+indep(s3)).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_8)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr waist_width_157w
% @type numeric
% @canonical false
% @original_name Waist width 157W
% @unit cm
% @values v26_3=26.3 unk_waist_width_157w=Unknown
% @importance 1.0

0.83::acc(s2, waist_width_157w).
0.83::acc(s3, waist_width_157w).

0.95::true_val(waist_width_157w, v26_3); 0.05::true_val(waist_width_157w, unk_waist_width_157w).

measured(s2, waist_width_157w, v26_3).
measured(s3, waist_width_157w, v26_3).

all_consistent(waist_width_157w) :-
    (indep(s2), consistent(s2, waist_width_157w) ; \+indep(s2)),
    (indep(s3), consistent(s3, waist_width_157w) ; \+indep(s3)).

evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_3)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

% @attr tip_tail_width_size_151
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (151cm)
% @unit cm
% @values v29_7=29.7 unk_tip_tail_width_size_151=Unknown
% @importance 1.0

0.83::acc(s2, tip_tail_width_size_151).
0.83::acc(s3, tip_tail_width_size_151).

0.95::true_val(tip_tail_width_size_151, v29_7); 0.05::true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151).

measured(s2, tip_tail_width_size_151, v29_7).
measured(s3, tip_tail_width_size_151, v29_7).

all_consistent(tip_tail_width_size_151) :-
    (indep(s2), consistent(s2, tip_tail_width_size_151) ; \+indep(s2)),
    (indep(s3), consistent(s3, tip_tail_width_size_151) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, v29_7)).
query(true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151)).

% @attr tip_tail_width_size_153
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (153cm)
% @unit cm
% @values v30_0=30.0 unk_tip_tail_width_size_153=Unknown
% @importance 1.0

0.83::acc(s2, tip_tail_width_size_153).
0.83::acc(s3, tip_tail_width_size_153).

0.95::true_val(tip_tail_width_size_153, v30_0); 0.05::true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153).

measured(s2, tip_tail_width_size_153, v30_0).
measured(s3, tip_tail_width_size_153, v30_0).

all_consistent(tip_tail_width_size_153) :-
    (indep(s2), consistent(s2, tip_tail_width_size_153) ; \+indep(s2)),
    (indep(s3), consistent(s3, tip_tail_width_size_153) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v30_0)).
query(true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v30_3=30.3 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.83::acc(s2, tip_tail_width_size).
0.83::acc(s3, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, v30_3); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s2, tip_tail_width_size, v30_3).
measured(s3, tip_tail_width_size, v30_3).

all_consistent(tip_tail_width_size) :-
    (indep(s2), consistent(s2, tip_tail_width_size) ; \+indep(s2)),
    (indep(s3), consistent(s3, tip_tail_width_size) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_3)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_157
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (157cm)
% @unit cm
% @values v30_5=30.5 unk_tip_tail_width_size_157=Unknown
% @importance 1.0

0.83::acc(s2, tip_tail_width_size_157).
0.83::acc(s3, tip_tail_width_size_157).

0.95::true_val(tip_tail_width_size_157, v30_5); 0.05::true_val(tip_tail_width_size_157, unk_tip_tail_width_size_157).

measured(s2, tip_tail_width_size_157, v30_5).
measured(s3, tip_tail_width_size_157, v30_5).

all_consistent(tip_tail_width_size_157) :-
    (indep(s2), consistent(s2, tip_tail_width_size_157) ; \+indep(s2)),
    (indep(s3), consistent(s3, tip_tail_width_size_157) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size_157)).
query(true_val(tip_tail_width_size_157, v30_5)).
query(true_val(tip_tail_width_size_157, unk_tip_tail_width_size_157)).

% @attr tip_tail_width_size_157w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (157W)
% @unit cm
% @values v31_0=31.0 unk_tip_tail_width_size_157w=Unknown
% @importance 1.0

0.83::acc(s2, tip_tail_width_size_157w).
0.83::acc(s3, tip_tail_width_size_157w).

0.95::true_val(tip_tail_width_size_157w, v31_0); 0.05::true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w).

measured(s2, tip_tail_width_size_157w, v31_0).
measured(s3, tip_tail_width_size_157w, v31_0).

all_consistent(tip_tail_width_size_157w) :-
    (indep(s2), consistent(s2, tip_tail_width_size_157w) ; \+indep(s2)),
    (indep(s3), consistent(s3, tip_tail_width_size_157w) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size_157w)).
query(true_val(tip_tail_width_size_157w, v31_0)).
query(true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w)).

% @attr stance_width_range_size_151
% @type numeric
% @canonical false
% @original_name stance_width_range_size (151cm)
% @unit cm
% @values v53_3=53.3 unk_stance_width_range_size_151=Unknown
% @importance 1.0

0.83::acc(s2, stance_width_range_size_151).
0.90::acc(s10, stance_width_range_size_151).

0.95::true_val(stance_width_range_size_151, v53_3); 0.05::true_val(stance_width_range_size_151, unk_stance_width_range_size_151).

measured(s2, stance_width_range_size_151, v53_3).
measured(s10, stance_width_range_size_151, v53_3).

all_consistent(stance_width_range_size_151) :-
    (indep(s2), consistent(s2, stance_width_range_size_151) ; \+indep(s2)),
    consistent(s10, stance_width_range_size_151).

evidence(all_consistent(stance_width_range_size_151)).
query(true_val(stance_width_range_size_151, v53_3)).
query(true_val(stance_width_range_size_151, unk_stance_width_range_size_151)).

% @attr stance_width_range_size_153
% @type numeric
% @canonical false
% @original_name stance_width_range_size (153cm)
% @unit cm
% @values v53_3=53.3 unk_stance_width_range_size_153=Unknown
% @importance 1.0

0.83::acc(s2, stance_width_range_size_153).
0.90::acc(s10, stance_width_range_size_153).

0.95::true_val(stance_width_range_size_153, v53_3); 0.05::true_val(stance_width_range_size_153, unk_stance_width_range_size_153).

measured(s2, stance_width_range_size_153, v53_3).
measured(s10, stance_width_range_size_153, v53_3).

all_consistent(stance_width_range_size_153) :-
    (indep(s2), consistent(s2, stance_width_range_size_153) ; \+indep(s2)),
    consistent(s10, stance_width_range_size_153).

evidence(all_consistent(stance_width_range_size_153)).
query(true_val(stance_width_range_size_153, v53_3)).
query(true_val(stance_width_range_size_153, unk_stance_width_range_size_153)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values v55_9=55.9 unk_stance_width_range_size=Unknown
% @importance 1.0

0.83::acc(s2, stance_width_range_size).
0.90::acc(s10, stance_width_range_size).

0.95::true_val(stance_width_range_size, v55_9); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s2, stance_width_range_size, v55_9).
measured(s10, stance_width_range_size, v55_9).

all_consistent(stance_width_range_size) :-
    (indep(s2), consistent(s2, stance_width_range_size) ; \+indep(s2)),
    consistent(s10, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v55_9)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_157
% @type numeric
% @canonical false
% @original_name stance_width_range_size (157cm)
% @unit cm
% @values v55_9=55.9 unk_stance_width_range_size_157=Unknown
% @importance 1.0

0.83::acc(s2, stance_width_range_size_157).
0.90::acc(s10, stance_width_range_size_157).

0.95::true_val(stance_width_range_size_157, v55_9); 0.05::true_val(stance_width_range_size_157, unk_stance_width_range_size_157).

measured(s2, stance_width_range_size_157, v55_9).
measured(s10, stance_width_range_size_157, v55_9).

all_consistent(stance_width_range_size_157) :-
    (indep(s2), consistent(s2, stance_width_range_size_157) ; \+indep(s2)),
    consistent(s10, stance_width_range_size_157).

evidence(all_consistent(stance_width_range_size_157)).
query(true_val(stance_width_range_size_157, v55_9)).
query(true_val(stance_width_range_size_157, unk_stance_width_range_size_157)).

% @attr stance_width_range_size_157w
% @type numeric
% @canonical false
% @original_name stance_width_range_size (157W)
% @unit cm
% @values v55_9=55.9 unk_stance_width_range_size_157w=Unknown
% @importance 1.0

0.83::acc(s2, stance_width_range_size_157w).
0.90::acc(s10, stance_width_range_size_157w).

0.95::true_val(stance_width_range_size_157w, v55_9); 0.05::true_val(stance_width_range_size_157w, unk_stance_width_range_size_157w).

measured(s2, stance_width_range_size_157w, v55_9).
measured(s10, stance_width_range_size_157w, v55_9).

all_consistent(stance_width_range_size_157w) :-
    (indep(s2), consistent(s2, stance_width_range_size_157w) ; \+indep(s2)),
    consistent(s10, stance_width_range_size_157w).

evidence(all_consistent(stance_width_range_size_157w)).
query(true_val(stance_width_range_size_157w, v55_9)).
query(true_val(stance_width_range_size_157w, unk_stance_width_range_size_157w)).

% @attr recommended_weight_range_size_151
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (151cm)
% @unit kg
% @values w45_70=45-70kg unk_recommended_weight_range_size_151=Unknown
% @importance 1.0

0.83::acc(s2, recommended_weight_range_size_151).
0.83::acc(s3, recommended_weight_range_size_151).

0.95::true_val(recommended_weight_range_size_151, w45_70); 0.05::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).

measured(s2, recommended_weight_range_size_151, w45_70).
measured(s3, recommended_weight_range_size_151, w45_70).

all_consistent(recommended_weight_range_size_151) :-
    (indep(s2), consistent(s2, recommended_weight_range_size_151) ; \+indep(s2)),
    (indep(s3), consistent(s3, recommended_weight_range_size_151) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, w45_70)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

% @attr recommended_weight_range_size_153
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (153cm)
% @unit kg
% @values w49_77=49-77kg w50_77=50-77kg
% @importance 1.0

0.83::acc(s2, recommended_weight_range_size_153).
0.83::acc(s3, recommended_weight_range_size_153).

0.50::true_val(recommended_weight_range_size_153, w49_77); 0.50::true_val(recommended_weight_range_size_153, w50_77).

measured(s2, recommended_weight_range_size_153, w49_77).
measured(s3, recommended_weight_range_size_153, w50_77).

all_consistent(recommended_weight_range_size_153) :-
    (indep(s2), consistent(s2, recommended_weight_range_size_153) ; \+indep(s2)),
    (indep(s3), consistent(s3, recommended_weight_range_size_153) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w49_77)).
query(true_val(recommended_weight_range_size_153, w50_77)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values w54_81=54-81kg w54_82=54-82kg
% @importance 1.0

0.83::acc(s2, recommended_weight_range_size).
0.83::acc(s3, recommended_weight_range_size).

0.50::true_val(recommended_weight_range_size, w54_81); 0.50::true_val(recommended_weight_range_size, w54_82).

measured(s2, recommended_weight_range_size, w54_81).
measured(s3, recommended_weight_range_size, w54_82).

all_consistent(recommended_weight_range_size) :-
    (indep(s2), consistent(s2, recommended_weight_range_size) ; \+indep(s2)),
    (indep(s3), consistent(s3, recommended_weight_range_size) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w54_81)).
query(true_val(recommended_weight_range_size, w54_82)).

% @attr recommended_weight_range_size_157
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (157cm)
% @unit kg
% @values w63_90=63-90kg w63_91=63-91kg
% @importance 1.0

0.83::acc(s2, recommended_weight_range_size_157).
0.83::acc(s3, recommended_weight_range_size_157).

0.50::true_val(recommended_weight_range_size_157, w63_90); 0.50::true_val(recommended_weight_range_size_157, w63_91).

measured(s2, recommended_weight_range_size_157, w63_90).
measured(s3, recommended_weight_range_size_157, w63_91).

all_consistent(recommended_weight_range_size_157) :-
    (indep(s2), consistent(s2, recommended_weight_range_size_157) ; \+indep(s2)),
    (indep(s3), consistent(s3, recommended_weight_range_size_157) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_157)).
query(true_val(recommended_weight_range_size_157, w63_90)).
query(true_val(recommended_weight_range_size_157, w63_91)).

% @attr recommended_weight_range_size_157w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (157W)
% @unit kg
% @values w64_91=64-91kg w63_91=63-91kg
% @importance 1.0

0.83::acc(s2, recommended_weight_range_size_157w).
0.83::acc(s3, recommended_weight_range_size_157w).

0.50::true_val(recommended_weight_range_size_157w, w64_91); 0.50::true_val(recommended_weight_range_size_157w, w63_91).

measured(s2, recommended_weight_range_size_157w, w64_91).
measured(s3, recommended_weight_range_size_157w, w63_91).

all_consistent(recommended_weight_range_size_157w) :-
    (indep(s2), consistent(s2, recommended_weight_range_size_157w) ; \+indep(s2)),
    (indep(s3), consistent(s3, recommended_weight_range_size_157w) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_157w)).
query(true_val(recommended_weight_range_size_157w, w64_91)).
query(true_val(recommended_weight_range_size_157w, w63_91)).

% @attr suggested_boot_size_standard
% @type categorical
% @canonical false
% @original_name Suggested boot size standard sizes
% @values us6_10=US_Mens_6to10_EU_39to43 unk_suggested_boot_size_standard=Unknown
% @importance 1.0

0.82::acc(s3, suggested_boot_size_standard).

0.85::true_val(suggested_boot_size_standard, us6_10); 0.15::true_val(suggested_boot_size_standard, unk_suggested_boot_size_standard).

measured(s3, suggested_boot_size_standard, us6_10).

all_consistent(suggested_boot_size_standard) :-
    (indep(s3), consistent(s3, suggested_boot_size_standard) ; \+indep(s3)).

evidence(all_consistent(suggested_boot_size_standard)).
query(true_val(suggested_boot_size_standard, us6_10)).
query(true_val(suggested_boot_size_standard, unk_suggested_boot_size_standard)).

% @attr suggested_boot_size_wide
% @type categorical
% @canonical false
% @original_name Suggested boot size wide sizes
% @values us10_plus=US_10_plus_EU_43_plus unk_suggested_boot_size_wide=Unknown
% @importance 1.0

0.82::acc(s3, suggested_boot_size_wide).

0.85::true_val(suggested_boot_size_wide, us10_plus); 0.15::true_val(suggested_boot_size_wide, unk_suggested_boot_size_wide).

measured(s3, suggested_boot_size_wide, us10_plus).

all_consistent(suggested_boot_size_wide) :-
    (indep(s3), consistent(s3, suggested_boot_size_wide) ; \+indep(s3)).

evidence(all_consistent(suggested_boot_size_wide)).
query(true_val(suggested_boot_size_wide, us10_plus)).
query(true_val(suggested_boot_size_wide, unk_suggested_boot_size_wide)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit lb
% @values v6_00=6.0 unk_board_weight_grams=Unknown
% @importance 1.0

0.82::acc(s3, board_weight_grams).

0.85::true_val(board_weight_grams, v6_00); 0.15::true_val(board_weight_grams, unk_board_weight_grams).

measured(s3, board_weight_grams, v6_00).

all_consistent(board_weight_grams) :-
    (indep(s3), consistent(s3, board_weight_grams) ; \+indep(s3)).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v6_00)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v799_99=799.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.85::acc(s2, price_aud_merchant).

0.90::true_val(price_aud_merchant, v799_99); 0.10::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s2, price_aud_merchant, v799_99).

all_consistent(price_aud_merchant) :-
    (indep(s2), consistent(s2, price_aud_merchant) ; \+indep(s2)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v799_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values preorder_may_2026=Preorder_estimated_May_1_2026 unk_estimated_availability_date=Unknown
% @importance 1.0

0.82::acc(s2, estimated_availability_date).

0.82::true_val(estimated_availability_date, preorder_may_2026); 0.18::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s2, estimated_availability_date, preorder_may_2026).

all_consistent(estimated_availability_date) :-
    (indep(s2), consistent(s2, estimated_availability_date) ; \+indep(s2)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, preorder_may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v449_95=449.95 unk_price_usd_msrp=Unknown
% @importance 0.975

0.95::acc(s6, price_usd_msrp).
0.85::acc(s3, price_usd_msrp).

0.97::true_val(price_usd_msrp, v449_95); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s6, price_usd_msrp, v449_95).
measured(s3, price_usd_msrp, v449_95).

all_consistent(price_usd_msrp) :-
    consistent(s6, price_usd_msrp),
    (indep(s3), consistent(s3, price_usd_msrp) ; \+indep(s3)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v449_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_the_house
% @type numeric
% @canonical false
% @original_name USD price (The-House, sale price)
% @unit USD
% @values v359_95=359.95 unk_price_usd_the_house=Unknown
% @importance 1.0

0.85::acc(s3, price_usd_the_house).

0.90::true_val(price_usd_the_house, v359_95); 0.10::true_val(price_usd_the_house, unk_price_usd_the_house).

measured(s3, price_usd_the_house, v359_95).

all_consistent(price_usd_the_house) :-
    (indep(s3), consistent(s3, price_usd_the_house) ; \+indep(s3)).

evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v359_95)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status (The-House)
% @values in_stock=In_Stock_multiple_sizes unk_availability_status_the_house=Unknown
% @importance 1.0

0.85::acc(s3, availability_status_the_house).

0.90::true_val(availability_status_the_house, in_stock); 0.10::true_val(availability_status_the_house, unk_availability_status_the_house).

measured(s3, availability_status_the_house, in_stock).

all_consistent(availability_status_the_house) :-
    (indep(s3), consistent(s3, availability_status_the_house) ; \+indep(s3)).

evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, in_stock)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer)
% @values listed_2027=Listed_for_2027_model unk_availability_status_blauer=Unknown
% @importance 0.70

0.70::acc(s30, availability_status_blauer).

0.62::true_val(availability_status_blauer, listed_2027); 0.38::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s30, availability_status_blauer, listed_2027).

all_consistent(availability_status_blauer) :- consistent(s30, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, listed_2027)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock=In_stock unk_availability_status=Unknown
% @importance 0.80

0.85::acc(s31, availability_status).

0.85::true_val(availability_status, in_stock); 0.15::true_val(availability_status, unk_availability_status).

measured(s31, availability_status, in_stock).

all_consistent(availability_status) :- consistent(s31, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_capita
% @type categorical
% @canonical false
% @original_name availability_status (CAPiTA)
% @values listed_449_95=Listed_at_449_95_USD unk_availability_status_capita=Unknown
% @importance 0.95

0.93::acc(s6, availability_status_capita).

0.93::true_val(availability_status_capita, listed_449_95); 0.07::true_val(availability_status_capita, unk_availability_status_capita).

measured(s6, availability_status_capita, listed_449_95).

all_consistent(availability_status_capita) :- consistent(s6, availability_status_capita).

evidence(all_consistent(availability_status_capita)).
query(true_val(availability_status_capita, listed_449_95)).
query(true_val(availability_status_capita, unk_availability_status_capita)).

% @attr price_usd_msrp_doa
% @type numeric
% @canonical false
% @original_name price_usd_msrp (DOA)
% @unit USD
% @values v579_95=579.95 unk_price_usd_msrp_doa=Unknown
% @importance 0.65

0.85::acc(s32, price_usd_msrp_doa).

0.85::true_val(price_usd_msrp_doa, v579_95); 0.15::true_val(price_usd_msrp_doa, unk_price_usd_msrp_doa).

measured(s32, price_usd_msrp_doa, v579_95).

all_consistent(price_usd_msrp_doa) :- consistent(s32, price_usd_msrp_doa).

evidence(all_consistent(price_usd_msrp_doa)).
query(true_val(price_usd_msrp_doa, v579_95)).
query(true_val(price_usd_msrp_doa, unk_price_usd_msrp_doa)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v439_96=439.96 unk_price_usd_evo=Unknown
% @importance 0.60

0.85::acc(s33, price_usd_evo).

0.85::true_val(price_usd_evo, v439_96); 0.15::true_val(price_usd_evo, unk_price_usd_evo).

measured(s33, price_usd_evo, v439_96).

all_consistent(price_usd_evo) :- consistent(s33, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v439_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr retailer_capita_direct
% @type categorical
% @canonical false
% @original_name Retailer CAPiTA Direct
% @values official_manufacturer_store=Official_manufacturer_store_Seattle_WA unk_retailer_capita_direct=Unknown
% @importance 0.50

0.93::acc(s1, retailer_capita_direct).

0.93::true_val(retailer_capita_direct, official_manufacturer_store); 0.07::true_val(retailer_capita_direct, unk_retailer_capita_direct).

measured(s1, retailer_capita_direct, official_manufacturer_store).

all_consistent(retailer_capita_direct) :- consistent(s1, retailer_capita_direct).

evidence(all_consistent(retailer_capita_direct)).
query(true_val(retailer_capita_direct, official_manufacturer_store)).
query(true_val(retailer_capita_direct, unk_retailer_capita_direct)).

% @attr retailer_c3_shop
% @type categorical
% @canonical false
% @original_name Retailer C3 Shop
% @values na_home_capita=North_American_home_of_CAPiTA unk_retailer_c3_shop=Unknown
% @importance 0.50

0.90::acc(s34, retailer_c3_shop).

0.90::true_val(retailer_c3_shop, na_home_capita); 0.10::true_val(retailer_c3_shop, unk_retailer_c3_shop).

measured(s34, retailer_c3_shop, na_home_capita).

all_consistent(retailer_c3_shop) :- consistent(s34, retailer_c3_shop).

evidence(all_consistent(retailer_c3_shop)).
query(true_val(retailer_c3_shop, na_home_capita)).
query(true_val(retailer_c3_shop, unk_retailer_c3_shop)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name Retailer evo
% @values major_outdoor_retailer=Major_online_outdoor_retailer unk_retailer_evo=Unknown
% @importance 0.80

0.85::acc(s31, retailer_evo).

0.85::true_val(retailer_evo, major_outdoor_retailer); 0.15::true_val(retailer_evo, unk_retailer_evo).

measured(s31, retailer_evo, major_outdoor_retailer).

all_consistent(retailer_evo) :- consistent(s31, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_outdoor_retailer)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_the_house
% @type categorical
% @canonical false
% @original_name Retailer The-House
% @values large_online_boardsports=Large_online_boardsports_retailer unk_retailer_the_house=Unknown
% @importance 1.0

0.82::acc(s3, retailer_the_house).

0.82::true_val(retailer_the_house, large_online_boardsports); 0.18::true_val(retailer_the_house, unk_retailer_the_house).

measured(s3, retailer_the_house, large_online_boardsports).

all_consistent(retailer_the_house) :-
    (indep(s3), consistent(s3, retailer_the_house) ; \+indep(s3)).

evidence(all_consistent(retailer_the_house)).
query(true_val(retailer_the_house, large_online_boardsports)).
query(true_val(retailer_the_house, unk_retailer_the_house)).

% @attr retailer_melbourne
% @type categorical
% @canonical false
% @original_name Retailer Melbourne Snowboard Centre
% @values au_specialty_retailer=Australian_specialty_snowboard_retailer unk_retailer_melbourne=Unknown
% @importance 1.0

0.82::acc(s2, retailer_melbourne).

0.82::true_val(retailer_melbourne, au_specialty_retailer); 0.18::true_val(retailer_melbourne, unk_retailer_melbourne).

measured(s2, retailer_melbourne, au_specialty_retailer).

all_consistent(retailer_melbourne) :-
    (indep(s2), consistent(s2, retailer_melbourne) ; \+indep(s2)).

evidence(all_consistent(retailer_melbourne)).
query(true_val(retailer_melbourne, au_specialty_retailer)).
query(true_val(retailer_melbourne, unk_retailer_melbourne)).

% @attr retailer_blauer
% @type categorical
% @canonical false
% @original_name Retailer Blauer Board Shop
% @values us_specialty_board_shop=US_specialty_board_shop unk_retailer_blauer=Unknown
% @importance 0.70

0.70::acc(s30, retailer_blauer).

0.70::true_val(retailer_blauer, us_specialty_board_shop); 0.30::true_val(retailer_blauer, unk_retailer_blauer).

measured(s30, retailer_blauer, us_specialty_board_shop).

all_consistent(retailer_blauer) :- consistent(s30, retailer_blauer).

evidence(all_consistent(retailer_blauer)).
query(true_val(retailer_blauer, us_specialty_board_shop)).
query(true_val(retailer_blauer, unk_retailer_blauer)).

% @attr retailer_tactics
% @type categorical
% @canonical false
% @original_name Retailer Tactics
% @values us_retailer_20pct_off=US_retailer_CAPiTA_boards_20pct_off unk_retailer_tactics=Unknown
% @importance 0.60

0.75::acc(s35, retailer_tactics).

0.70::true_val(retailer_tactics, us_retailer_20pct_off); 0.30::true_val(retailer_tactics, unk_retailer_tactics).

measured(s35, retailer_tactics, us_retailer_20pct_off).

all_consistent(retailer_tactics) :- consistent(s35, retailer_tactics).

evidence(all_consistent(retailer_tactics)).
query(true_val(retailer_tactics, us_retailer_20pct_off)).
query(true_val(retailer_tactics, unk_retailer_tactics)).

% @attr retailer_amazon
% @type categorical
% @canonical false
% @original_name Retailer Amazon
% @values pathfinder_listed=CAPiTA_Pathfinder_listed unk_retailer_amazon=Unknown
% @importance 0.65

0.72::acc(s36, retailer_amazon).

0.70::true_val(retailer_amazon, pathfinder_listed); 0.30::true_val(retailer_amazon, unk_retailer_amazon).

measured(s36, retailer_amazon, pathfinder_listed).

all_consistent(retailer_amazon) :-
    (indep(s36), consistent(s36, retailer_amazon) ; \+indep(s36)).

evidence(all_consistent(retailer_amazon)).
query(true_val(retailer_amazon, pathfinder_listed)).
query(true_val(retailer_amazon, unk_retailer_amazon)).

% @attr retailer_empire
% @type categorical
% @canonical false
% @original_name Retailer Empire
% @values largest_capita_quebec_canada=Largest_CAPiTA_retailer_Quebec_Canada unk_retailer_empire=Unknown
% @importance 0.35

0.65::acc(s37, retailer_empire).

0.60::true_val(retailer_empire, largest_capita_quebec_canada); 0.40::true_val(retailer_empire, unk_retailer_empire).

measured(s37, retailer_empire, largest_capita_quebec_canada).

all_consistent(retailer_empire) :- consistent(s37, retailer_empire).

evidence(all_consistent(retailer_empire)).
query(true_val(retailer_empire, largest_capita_quebec_canada)).
query(true_val(retailer_empire, unk_retailer_empire)).

% @attr au_distributor
% @type categorical
% @canonical false
% @original_name AU Distributor
% @values principle_distribution=Principle_Distribution unk_au_distributor=Unknown
% @importance 0.40

0.92::acc(s38, au_distributor).

0.90::true_val(au_distributor, principle_distribution); 0.10::true_val(au_distributor, unk_au_distributor).

measured(s38, au_distributor, principle_distribution).

all_consistent(au_distributor) :- consistent(s38, au_distributor).

evidence(all_consistent(au_distributor)).
query(true_val(au_distributor, principle_distribution)).
query(true_val(au_distributor, unk_au_distributor)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner=Beginner unk_rider_level=Unknown
% @importance 1.0

0.85::acc(s2, rider_level).

0.90::true_val(rider_level, beginner); 0.10::true_val(rider_level, unk_rider_level).

measured(s2, rider_level, beginner).

all_consistent(rider_level) :-
    (indep(s2), consistent(s2, rider_level) ; \+indep(s2)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_intermediate=Beginner_Intermediate unk_skill_level_recommendation=Unknown
% @importance 0.85

0.82::acc(s19, skill_level_recommendation).

0.82::true_val(skill_level_recommendation, beginner_intermediate); 0.18::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s19, skill_level_recommendation, beginner_intermediate).

all_consistent(skill_level_recommendation) :- consistent(s19, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_intermediate)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr skill_level_recommendation_capita
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (CAPiTA)
% @values wide_range_progress=Wide_range_riders_progress_minimal_cost unk_skill_level_recommendation_capita=Unknown
% @importance 0.75

0.90::acc(s39, skill_level_recommendation_capita).

0.88::true_val(skill_level_recommendation_capita, wide_range_progress); 0.12::true_val(skill_level_recommendation_capita, unk_skill_level_recommendation_capita).

measured(s39, skill_level_recommendation_capita, wide_range_progress).

all_consistent(skill_level_recommendation_capita) :- consistent(s39, skill_level_recommendation_capita).

evidence(all_consistent(skill_level_recommendation_capita)).
query(true_val(skill_level_recommendation_capita, wide_range_progress)).
query(true_val(skill_level_recommendation_capita, unk_skill_level_recommendation_capita)).

% @attr skill_level_recommendation_whitelines
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (Whitelines)
% @values beginner_to_strong_intermediate=Great_beginners_to_strong_intermediates_softer_flex unk_skill_level_recommendation_whitelines=Unknown
% @importance 0.75

0.82::acc(s40, skill_level_recommendation_whitelines).

0.80::true_val(skill_level_recommendation_whitelines, beginner_to_strong_intermediate); 0.20::true_val(skill_level_recommendation_whitelines, unk_skill_level_recommendation_whitelines).

measured(s40, skill_level_recommendation_whitelines, beginner_to_strong_intermediate).

all_consistent(skill_level_recommendation_whitelines) :- consistent(s40, skill_level_recommendation_whitelines).

evidence(all_consistent(skill_level_recommendation_whitelines)).
query(true_val(skill_level_recommendation_whitelines, beginner_to_strong_intermediate)).
query(true_val(skill_level_recommendation_whitelines, unk_skill_level_recommendation_whitelines)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_all_mountain=Park_All_Mountain unk_terrain_suitability=Unknown
% @importance 1.0

0.85::acc(s2, terrain_suitability).

0.90::true_val(terrain_suitability, park_all_mountain); 0.10::true_val(terrain_suitability, unk_terrain_suitability).

measured(s2, terrain_suitability, park_all_mountain).

all_consistent(terrain_suitability) :-
    (indep(s2), consistent(s2, terrain_suitability) ; \+indep(s2)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_all_mountain)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_park_resort=Freestyle_park_laps_all_mountain unk_riding_style=Unknown
% @importance 0.875

0.85::acc(s2, riding_style).
0.90::acc(s41, riding_style).

0.95::true_val(riding_style, freestyle_park_resort); 0.05::true_val(riding_style, unk_riding_style).

measured(s2, riding_style, freestyle_park_resort).
measured(s41, riding_style, freestyle_park_resort).

all_consistent(riding_style) :-
    (indep(s2), consistent(s2, riding_style) ; \+indep(s2)),
    consistent(s41, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_park_resort)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_detail
% @type categorical
% @canonical false
% @original_name terrain_suitability (detail)
% @values park_groomers_casual=Park_laps_groomed_runs_casual_cruising_not_deep_powder unk_terrain_suitability_detail=Unknown
% @importance 0.80

0.85::acc(s42, terrain_suitability_detail).

0.82::true_val(terrain_suitability_detail, park_groomers_casual); 0.18::true_val(terrain_suitability_detail, unk_terrain_suitability_detail).

measured(s42, terrain_suitability_detail, park_groomers_casual).

all_consistent(terrain_suitability_detail) :- consistent(s42, terrain_suitability_detail).

evidence(all_consistent(terrain_suitability_detail)).
query(true_val(terrain_suitability_detail, park_groomers_casual)).
query(true_val(terrain_suitability_detail, unk_terrain_suitability_detail)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values smooth_skate_like=Smooth_skate_like_feel unk_flex_feel=Unknown
% @importance 1.0

0.85::acc(s2, flex_feel).

0.90::true_val(flex_feel, smooth_skate_like); 0.10::true_val(flex_feel, unk_flex_feel).

measured(s2, flex_feel, smooth_skate_like).

all_consistent(flex_feel) :-
    (indep(s2), consistent(s2, flex_feel) ; \+indep(s2)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, smooth_skate_like)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values forgiving_easy=Forgiving_easy_to_ride_reduces_edge_catching unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.80

0.78::acc(s43, reviewer_opinion_the_good_ride).

0.75::true_val(reviewer_opinion_the_good_ride, forgiving_easy); 0.25::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s43, reviewer_opinion_the_good_ride, forgiving_easy).

all_consistent(reviewer_opinion_the_good_ride) :-
    (indep(s43), consistent(s43, reviewer_opinion_the_good_ride) ; \+indep(s43)).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, forgiving_easy)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values really_easy=Really_easy_to_initiate_turns unk_turn_initiation_performance=Unknown
% @importance 0.85

0.85::acc(s44, turn_initiation_performance).

0.82::true_val(turn_initiation_performance, really_easy); 0.18::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s44, turn_initiation_performance, really_easy).

all_consistent(turn_initiation_performance) :- consistent(s44, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, really_easy)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values really_snappy=Really_snappy_springs_well_easy_pop unk_pop=Unknown
% @importance 0.80

0.82::acc(s20, pop).

0.78::true_val(pop, really_snappy); 0.22::true_val(pop, unk_pop).

measured(s20, pop, really_snappy).

all_consistent(pop) :- consistent(s20, pop).

evidence(all_consistent(pop)).
query(true_val(pop, really_snappy)).
query(true_val(pop, unk_pop)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values wobbly_chattery=Wobbly_above_moderate_speed_quite_chattery unk_chatter_performance=Unknown
% @importance 0.80

0.85::acc(s45, chatter_performance).
0.82::acc(s20, chatter_performance).

0.95::true_val(chatter_performance, wobbly_chattery); 0.05::true_val(chatter_performance, unk_chatter_performance).

measured(s45, chatter_performance, wobbly_chattery).
measured(s20, chatter_performance, wobbly_chattery).

all_consistent(chatter_performance) :-
    consistent(s45, chatter_performance),
    consistent(s20, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, wobbly_chattery)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values not_ideal=Not_tool_for_deep_carves_washes_out unk_carving_rating_tgr=Unknown
% @importance 0.75

0.85::acc(s46, carving_rating_tgr).

0.82::true_val(carving_rating_tgr, not_ideal); 0.18::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s46, carving_rating_tgr, not_ideal).

all_consistent(carving_rating_tgr) :- consistent(s46, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, not_ideal)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values ok_shallow_not_deep=OK_shallow_powder_not_ideal_deep unk_powder_rating_tgr=Unknown
% @importance 0.70

0.85::acc(s47, powder_rating_tgr).

0.82::true_val(powder_rating_tgr, ok_shallow_not_deep); 0.18::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s47, powder_rating_tgr, ok_shallow_not_deep).

all_consistent(powder_rating_tgr) :- consistent(s47, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, ok_shallow_not_deep)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values perfect_true_twin=True_twin_perfect_for_switch unk_switch_riding=Unknown
% @importance 1.0

0.85::acc(s2, switch_riding).

0.90::true_val(switch_riding, perfect_true_twin); 0.10::true_val(switch_riding, unk_switch_riding).

measured(s2, switch_riding, perfect_true_twin).

all_consistent(switch_riding) :-
    (indep(s2), consistent(s2, switch_riding) ; \+indep(s2)).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, perfect_true_twin)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values easy_butter_press=Super_easy_to_butter_press_forgiving unk_positive_aspect=Unknown
% @importance 0.80

0.82::acc(s48, positive_aspect).

0.80::true_val(positive_aspect, easy_butter_press); 0.20::true_val(positive_aspect, unk_positive_aspect).

measured(s48, positive_aspect, easy_butter_press).

all_consistent(positive_aspect) :- consistent(s48, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, easy_butter_press)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr jumps_rating_tgr
% @type numeric
% @canonical true
% @original_name jumps_rating_tgr
% @unit /5
% @values v3_5=3.5 unk_jumps_rating_tgr=Unknown
% @importance 0.70

0.85::acc(s49, jumps_rating_tgr).

0.82::true_val(jumps_rating_tgr, v3_5); 0.18::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s49, jumps_rating_tgr, v3_5).

all_consistent(jumps_rating_tgr) :- consistent(s49, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, v3_5)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values great_forgiving=Great_for_jibbing_forgiving_playful unk_jibbing_rating_tgr=Unknown
% @importance 0.80

0.85::acc(s50, jibbing_rating_tgr).

0.82::true_val(jibbing_rating_tgr, great_forgiving); 0.18::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s50, jibbing_rating_tgr, great_forgiving).

all_consistent(jibbing_rating_tgr) :- consistent(s50, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, great_forgiving)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr terrain_suitability_trees
% @type categorical
% @canonical false
% @original_name terrain_suitability (trees and bumps)
% @values great_agile=Great_ride_weaving_bumps_trees_agile unk_terrain_suitability_trees=Unknown
% @importance 0.60

0.85::acc(s51, terrain_suitability_trees).

0.82::true_val(terrain_suitability_trees, great_agile); 0.18::true_val(terrain_suitability_trees, unk_terrain_suitability_trees).

measured(s51, terrain_suitability_trees, great_agile).

all_consistent(terrain_suitability_trees) :- consistent(s51, terrain_suitability_trees).

evidence(all_consistent(terrain_suitability_trees)).
query(true_val(terrain_suitability_trees, great_agile)).
query(true_val(terrain_suitability_trees, unk_terrain_suitability_trees)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values top_100_selected=Selected_top_100_snowboard_products unk_reviewer_opinion_whitelines=Unknown
% @importance 0.75

0.82::acc(s40, reviewer_opinion_whitelines).

0.80::true_val(reviewer_opinion_whitelines, top_100_selected); 0.20::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s40, reviewer_opinion_whitelines, top_100_selected).

all_consistent(reviewer_opinion_whitelines) :- consistent(s40, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, top_100_selected)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_quote
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (quote)
% @values lotta_board_little_cash=A_lotta_board_for_a_little_cash unk_reviewer_opinion_whitelines_quote=Unknown
% @importance 0.75

0.82::acc(s40, reviewer_opinion_whitelines_quote).

0.80::true_val(reviewer_opinion_whitelines_quote, lotta_board_little_cash); 0.20::true_val(reviewer_opinion_whitelines_quote, unk_reviewer_opinion_whitelines_quote).

measured(s40, reviewer_opinion_whitelines_quote, lotta_board_little_cash).

all_consistent(reviewer_opinion_whitelines_quote) :- consistent(s40, reviewer_opinion_whitelines_quote).

evidence(all_consistent(reviewer_opinion_whitelines_quote)).
query(true_val(reviewer_opinion_whitelines_quote, lotta_board_little_cash)).
query(true_val(reviewer_opinion_whitelines_quote, unk_reviewer_opinion_whitelines_quote)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values specs_am_feels_am_freestyle=Specs_all_mountain_but_feels_closer_to_all_mountain_freestyle unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.70

0.85::acc(s9, reviewer_opinion_snowboardingprofiles).

0.80::true_val(reviewer_opinion_snowboardingprofiles, specs_am_feels_am_freestyle); 0.20::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s9, reviewer_opinion_snowboardingprofiles, specs_am_feels_am_freestyle).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s9, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, specs_am_feels_am_freestyle)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_beginner
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (beginner)
% @values good_beginner_option=Considered_good_beginner_option unk_reviewer_opinion_snowboardingprofiles_beginner=Unknown
% @importance 0.85

0.82::acc(s52, reviewer_opinion_snowboardingprofiles_beginner).

0.80::true_val(reviewer_opinion_snowboardingprofiles_beginner, good_beginner_option); 0.20::true_val(reviewer_opinion_snowboardingprofiles_beginner, unk_reviewer_opinion_snowboardingprofiles_beginner).

measured(s52, reviewer_opinion_snowboardingprofiles_beginner, good_beginner_option).

all_consistent(reviewer_opinion_snowboardingprofiles_beginner) :- consistent(s52, reviewer_opinion_snowboardingprofiles_beginner).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_beginner)).
query(true_val(reviewer_opinion_snowboardingprofiles_beginner, good_beginner_option)).
query(true_val(reviewer_opinion_snowboardingprofiles_beginner, unk_reviewer_opinion_snowboardingprofiles_beginner)).

% @attr thesnowchasers_assessment
% @type categorical
% @canonical false
% @original_name TheSnowChasers assessment
% @values soft_pressy_forgiving_beginner_park=Soft_pressy_forgiving_most_beginner_friendly_park unk_thesnowchasers_assessment=Unknown
% @importance 0.80

0.82::acc(s48, thesnowchasers_assessment).

0.80::true_val(thesnowchasers_assessment, soft_pressy_forgiving_beginner_park); 0.20::true_val(thesnowchasers_assessment, unk_thesnowchasers_assessment).

measured(s48, thesnowchasers_assessment, soft_pressy_forgiving_beginner_park).

all_consistent(thesnowchasers_assessment) :- consistent(s48, thesnowchasers_assessment).

evidence(all_consistent(thesnowchasers_assessment)).
query(true_val(thesnowchasers_assessment, soft_pressy_forgiving_beginner_park)).
query(true_val(thesnowchasers_assessment, unk_thesnowchasers_assessment)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values great_beginner_freestyle=Great_beginner_board_freestyle_resort unk_user_review_forum=Unknown
% @importance 0.50

0.55::acc(s53, user_review_forum).

0.50::true_val(user_review_forum, great_beginner_freestyle); 0.50::true_val(user_review_forum, unk_user_review_forum).

measured(s53, user_review_forum, great_beginner_freestyle).

all_consistent(user_review_forum) :- consistent(s53, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, great_beginner_freestyle)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr negative_aspect_base_speed
% @type categorical
% @canonical false
% @original_name negative_aspect (base speed)
% @values slow_base=Superdrive_base_not_fast_low_maintenance unk_negative_aspect_base_speed=Unknown
% @importance 0.60

0.80::acc(s54, negative_aspect_base_speed).

0.78::true_val(negative_aspect_base_speed, slow_base); 0.22::true_val(negative_aspect_base_speed, unk_negative_aspect_base_speed).

measured(s54, negative_aspect_base_speed, slow_base).

all_consistent(negative_aspect_base_speed) :- consistent(s54, negative_aspect_base_speed).

evidence(all_consistent(negative_aspect_base_speed)).
query(true_val(negative_aspect_base_speed, slow_base)).
query(true_val(negative_aspect_base_speed, unk_negative_aspect_base_speed)).

% @attr negative_aspect_weight
% @type categorical
% @canonical false
% @original_name negative_aspect (weight/strength)
% @values not_lightest_strongest=Not_fastest_lightest_strongest_great_value unk_negative_aspect_weight=Unknown
% @importance 0.75

0.82::acc(s55, negative_aspect_weight).

0.80::true_val(negative_aspect_weight, not_lightest_strongest); 0.20::true_val(negative_aspect_weight, unk_negative_aspect_weight).

measured(s55, negative_aspect_weight, not_lightest_strongest).

all_consistent(negative_aspect_weight) :- consistent(s55, negative_aspect_weight).

evidence(all_consistent(negative_aspect_weight)).
query(true_val(negative_aspect_weight, not_lightest_strongest)).
query(true_val(negative_aspect_weight, unk_negative_aspect_weight)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values chattery_at_speed=Chattery_not_damp_uncomfortable_higher_speeds unk_negative_aspect=Unknown
% @importance 0.80

0.82::acc(s20, negative_aspect).

0.78::true_val(negative_aspect, chattery_at_speed); 0.22::true_val(negative_aspect, unk_negative_aspect).

measured(s20, negative_aspect, chattery_at_speed).

all_consistent(negative_aspect) :- consistent(s20, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, chattery_at_speed)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (powder)
% @values limited_deep_powder=Prone_to_sinking_in_deep_powder unk_negative_aspect_powder=Unknown
% @importance 0.70

0.85::acc(s47, negative_aspect_powder).

0.82::true_val(negative_aspect_powder, limited_deep_powder); 0.18::true_val(negative_aspect_powder, unk_negative_aspect_powder).

measured(s47, negative_aspect_powder, limited_deep_powder).

all_consistent(negative_aspect_powder) :- consistent(s47, negative_aspect_powder).

evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, limited_deep_powder)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

% @attr positive_aspect_value
% @type categorical
% @canonical false
% @original_name positive_aspect (value)
% @values budget_friendly_trusted_tech=Budget_friendly_price_trusted_tech unk_positive_aspect_value=Unknown
% @importance 0.75

0.82::acc(s40, positive_aspect_value).

0.80::true_val(positive_aspect_value, budget_friendly_trusted_tech); 0.20::true_val(positive_aspect_value, unk_positive_aspect_value).

measured(s40, positive_aspect_value, budget_friendly_trusted_tech).

all_consistent(positive_aspect_value) :- consistent(s40, positive_aspect_value).

evidence(all_consistent(positive_aspect_value)).
query(true_val(positive_aspect_value, budget_friendly_trusted_tech)).
query(true_val(positive_aspect_value, unk_positive_aspect_value)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.80

0.95::acc(s56, warranty_period_years).

0.95::true_val(warranty_period_years, v2); 0.05::true_val(warranty_period_years, unk_warranty_period_years).

measured(s56, warranty_period_years, v2).

all_consistent(warranty_period_years) :- consistent(s56, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values delam_cracking_inserts=Covers_delamination_cracking_inserts_defects unk_warranty=Unknown
% @importance 0.80

0.95::acc(s56, warranty).

0.95::true_val(warranty, delam_cracking_inserts); 0.05::true_val(warranty, unk_warranty).

measured(s56, warranty, delam_cracking_inserts).

all_consistent(warranty) :- consistent(s56, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, delam_cracking_inserts)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty (exclusions)
% @values impact_wear_secondhand=Impact_damage_normal_wear_secondhand_excluded unk_warranty_exclusions=Unknown
% @importance 0.80

0.95::acc(s56, warranty_exclusions).

0.95::true_val(warranty_exclusions, impact_wear_secondhand); 0.05::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s56, warranty_exclusions, impact_wear_secondhand).

all_consistent(warranty_exclusions) :- consistent(s56, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, impact_wear_secondhand)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr warranty_requirements
% @type categorical
% @canonical false
% @original_name warranty (requirements)
% @values proof_authorized_dealer=Proof_of_purchase_from_authorized_CAPiTA_dealer unk_warranty_requirements=Unknown
% @importance 0.80

0.95::acc(s56, warranty_requirements).

0.95::true_val(warranty_requirements, proof_authorized_dealer); 0.05::true_val(warranty_requirements, unk_warranty_requirements).

measured(s56, warranty_requirements, proof_authorized_dealer).

all_consistent(warranty_requirements) :- consistent(s56, warranty_requirements).

evidence(all_consistent(warranty_requirements)).
query(true_val(warranty_requirements, proof_authorized_dealer)).
query(true_val(warranty_requirements, unk_warranty_requirements)).

% @attr warranty_process
% @type categorical
% @canonical false
% @original_name warranty (process)
% @values nfc_scan_online_claim=Register_via_NFC_scan_submit_online_2to3_days unk_warranty_process=Unknown
% @importance 0.80

0.95::acc(s56, warranty_process).

0.95::true_val(warranty_process, nfc_scan_online_claim); 0.05::true_val(warranty_process, unk_warranty_process).

measured(s56, warranty_process, nfc_scan_online_claim).

all_consistent(warranty_process) :- consistent(s56, warranty_process).

evidence(all_consistent(warranty_process)).
query(true_val(warranty_process, nfc_scan_online_claim)).
query(true_val(warranty_process, unk_warranty_process)).

% @attr user_review_forum_warranty
% @type categorical
% @canonical false
% @original_name user_review_forum (warranty experience)
% @values mixed_marine_epoxy=Mixed_some_told_use_marine_epoxy_for_delam unk_user_review_forum_warranty=Unknown
% @importance 0.70

0.55::acc(s57, user_review_forum_warranty).

0.45::true_val(user_review_forum_warranty, mixed_marine_epoxy); 0.55::true_val(user_review_forum_warranty, unk_user_review_forum_warranty).

measured(s57, user_review_forum_warranty, mixed_marine_epoxy).

all_consistent(user_review_forum_warranty) :- consistent(s57, user_review_forum_warranty).

evidence(all_consistent(user_review_forum_warranty)).
query(true_val(user_review_forum_warranty, mixed_marine_epoxy)).
query(true_val(user_review_forum_warranty, unk_user_review_forum_warranty)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values rome_mechanic=Rome_Mechanic_more_planted_pathfinder_snappier unk_comparable_board_cross_brand=Unknown
% @importance 0.80

0.82::acc(s48, comparable_board_cross_brand).

0.80::true_val(comparable_board_cross_brand, rome_mechanic); 0.20::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s48, comparable_board_cross_brand, rome_mechanic).

all_consistent(comparable_board_cross_brand) :- consistent(s48, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, rome_mechanic)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_yes
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES Basic)
% @values yes_basic=YES_Basic_wont_outgrow unk_comparable_board_cross_brand_yes=Unknown
% @importance 0.60

0.78::acc(s58, comparable_board_cross_brand_yes).

0.72::true_val(comparable_board_cross_brand_yes, yes_basic); 0.28::true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes).

measured(s58, comparable_board_cross_brand_yes, yes_basic).

all_consistent(comparable_board_cross_brand_yes) :- consistent(s58, comparable_board_cross_brand_yes).

evidence(all_consistent(comparable_board_cross_brand_yes)).
query(true_val(comparable_board_cross_brand_yes, yes_basic)).
query(true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes)).

% @attr comparable_board_cross_brand_nitro
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nitro)
% @values nitro_prime_chroma=Nitro_Prime_Chroma_Cam_Out_best_beginner unk_comparable_board_cross_brand_nitro=Unknown
% @importance 0.60

0.78::acc(s59, comparable_board_cross_brand_nitro).

0.72::true_val(comparable_board_cross_brand_nitro, nitro_prime_chroma); 0.28::true_val(comparable_board_cross_brand_nitro, unk_comparable_board_cross_brand_nitro).

measured(s59, comparable_board_cross_brand_nitro, nitro_prime_chroma).

all_consistent(comparable_board_cross_brand_nitro) :- consistent(s59, comparable_board_cross_brand_nitro).

evidence(all_consistent(comparable_board_cross_brand_nitro)).
query(true_val(comparable_board_cross_brand_nitro, nitro_prime_chroma)).
query(true_val(comparable_board_cross_brand_nitro, unk_comparable_board_cross_brand_nitro)).

% @attr comparable_board_cross_brand_burton_process
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Process)
% @values burton_process_fv=Burton_Process_Flying_V_best_beginner unk_comparable_board_cross_brand_burton_process=Unknown
% @importance 0.60

0.78::acc(s60, comparable_board_cross_brand_burton_process).

0.72::true_val(comparable_board_cross_brand_burton_process, burton_process_fv); 0.28::true_val(comparable_board_cross_brand_burton_process, unk_comparable_board_cross_brand_burton_process).

measured(s60, comparable_board_cross_brand_burton_process, burton_process_fv).

all_consistent(comparable_board_cross_brand_burton_process) :- consistent(s60, comparable_board_cross_brand_burton_process).

evidence(all_consistent(comparable_board_cross_brand_burton_process)).
query(true_val(comparable_board_cross_brand_burton_process, burton_process_fv)).
query(true_val(comparable_board_cross_brand_burton_process, unk_comparable_board_cross_brand_burton_process)).

% @attr comparable_board_cross_brand_burton_custom
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Custom)
% @values burton_custom_fv=Burton_Custom_Flying_V_camber_progression unk_comparable_board_cross_brand_burton_custom=Unknown
% @importance 0.50

0.70::acc(s61, comparable_board_cross_brand_burton_custom).

0.65::true_val(comparable_board_cross_brand_burton_custom, burton_custom_fv); 0.35::true_val(comparable_board_cross_brand_burton_custom, unk_comparable_board_cross_brand_burton_custom).

measured(s61, comparable_board_cross_brand_burton_custom, burton_custom_fv).

all_consistent(comparable_board_cross_brand_burton_custom) :- consistent(s61, comparable_board_cross_brand_burton_custom).

evidence(all_consistent(comparable_board_cross_brand_burton_custom)).
query(true_val(comparable_board_cross_brand_burton_custom, burton_custom_fv)).
query(true_val(comparable_board_cross_brand_burton_custom, unk_comparable_board_cross_brand_burton_custom)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values capita_doa=CAPiTA_DOA_hybrid_camber_579_95 unk_comparable_board_same_brand=Unknown
% @importance 0.65

0.85::acc(s32, comparable_board_same_brand).

0.85::true_val(comparable_board_same_brand, capita_doa); 0.15::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s32, comparable_board_same_brand, capita_doa).

all_consistent(comparable_board_same_brand) :- consistent(s32, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, capita_doa)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_ultrafear
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Ultrafear)
% @values capita_ultrafear=CAPiTA_Ultrafear_jib_focused_549_95 unk_comparable_board_same_brand_ultrafear=Unknown
% @importance 0.60

0.85::acc(s33, comparable_board_same_brand_ultrafear).

0.85::true_val(comparable_board_same_brand_ultrafear, capita_ultrafear); 0.15::true_val(comparable_board_same_brand_ultrafear, unk_comparable_board_same_brand_ultrafear).

measured(s33, comparable_board_same_brand_ultrafear, capita_ultrafear).

all_consistent(comparable_board_same_brand_ultrafear) :- consistent(s33, comparable_board_same_brand_ultrafear).

evidence(all_consistent(comparable_board_same_brand_ultrafear)).
query(true_val(comparable_board_same_brand_ultrafear, capita_ultrafear)).
query(true_val(comparable_board_same_brand_ultrafear, unk_comparable_board_same_brand_ultrafear)).

% @attr comparable_board_same_brand_lineup
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (lineup position)
% @values entry_level_dual_purpose=Entry_level_beginner_or_jib_stick unk_comparable_board_same_brand_lineup=Unknown
% @importance 0.70

0.88::acc(s62, comparable_board_same_brand_lineup).

0.85::true_val(comparable_board_same_brand_lineup, entry_level_dual_purpose); 0.15::true_val(comparable_board_same_brand_lineup, unk_comparable_board_same_brand_lineup).

measured(s62, comparable_board_same_brand_lineup, entry_level_dual_purpose).

all_consistent(comparable_board_same_brand_lineup) :- consistent(s62, comparable_board_same_brand_lineup).

evidence(all_consistent(comparable_board_same_brand_lineup)).
query(true_val(comparable_board_same_brand_lineup, entry_level_dual_purpose)).
query(true_val(comparable_board_same_brand_lineup, unk_comparable_board_same_brand_lineup)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values two_base_colors_per_size=Die_cut_base_two_color_variations_per_size unk_available_colors=Unknown
% @importance 0.20

0.90::acc(s63, available_colors).

0.88::true_val(available_colors, two_base_colors_per_size); 0.12::true_val(available_colors, unk_available_colors).

measured(s63, available_colors, two_base_colors_per_size).

all_consistent(available_colors) :- consistent(s63, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, two_base_colors_per_size)).
query(true_val(available_colors, unk_available_colors)).

% @attr width_options_wide_benefit
% @type categorical
% @canonical false
% @original_name width_options (wide benefit)
% @values large_boot_flotation=For_large_boot_sizes_extra_flotation_reduced_drag unk_width_options_wide_benefit=Unknown
% @importance 1.0

0.85::acc(s2, width_options_wide_benefit).

0.90::true_val(width_options_wide_benefit, large_boot_flotation); 0.10::true_val(width_options_wide_benefit, unk_width_options_wide_benefit).

measured(s2, width_options_wide_benefit, large_boot_flotation).

all_consistent(width_options_wide_benefit) :-
    (indep(s2), consistent(s2, width_options_wide_benefit) ; \+indep(s2)).

evidence(all_consistent(width_options_wide_benefit)).
query(true_val(width_options_wide_benefit, large_boot_flotation)).
query(true_val(width_options_wide_benefit, unk_width_options_wide_benefit)).

% @attr width_options_standard_benefit
% @type categorical
% @canonical false
% @original_name width_options (standard benefit)
% @values edge_to_edge_quickness=Exceptional_edge_to_edge_quickness_average_boot unk_width_options_standard_benefit=Unknown
% @importance 1.0

0.85::acc(s2, width_options_standard_benefit).

0.90::true_val(width_options_standard_benefit, edge_to_edge_quickness); 0.10::true_val(width_options_standard_benefit, unk_width_options_standard_benefit).

measured(s2, width_options_standard_benefit, edge_to_edge_quickness).

all_consistent(width_options_standard_benefit) :-
    (indep(s2), consistent(s2, width_options_standard_benefit) ; \+indep(s2)).

evidence(all_consistent(width_options_standard_benefit)).
query(true_val(width_options_standard_benefit, edge_to_edge_quickness)).
query(true_val(width_options_standard_benefit, unk_width_options_standard_benefit)).

% @attr wide_sizing_recommendation
% @type categorical
% @canonical false
% @original_name Wide sizing recommendation
% @values us_m10_5_plus=Wide_for_US_M10_5_plus_or_US_W9_plus unk_wide_sizing_recommendation=Unknown
% @importance 0.60

0.92::acc(s64, wide_sizing_recommendation).

0.90::true_val(wide_sizing_recommendation, us_m10_5_plus); 0.10::true_val(wide_sizing_recommendation, unk_wide_sizing_recommendation).

measured(s64, wide_sizing_recommendation, us_m10_5_plus).

all_consistent(wide_sizing_recommendation) :- consistent(s64, wide_sizing_recommendation).

evidence(all_consistent(wide_sizing_recommendation)).
query(true_val(wide_sizing_recommendation, us_m10_5_plus)).
query(true_val(wide_sizing_recommendation, unk_wide_sizing_recommendation)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values factory_direct_wax_tune=All_boards_leave_with_factory_direct_wax_and_tune unk_factory_wax=Unknown
% @importance 0.60

0.92::acc(s64, factory_wax).

0.90::true_val(factory_wax, factory_direct_wax_tune); 0.10::true_val(factory_wax, unk_factory_wax).

measured(s64, factory_wax, factory_direct_wax_tune).

all_consistent(factory_wax) :- consistent(s64, factory_wax).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, factory_direct_wax_tune)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values inserts_2x4_most_bindings=2x4_insert_compatible_most_modern_bindings unk_binding_compatibility=Unknown
% @importance 1.0

0.85::acc(s2, binding_compatibility).

0.90::true_val(binding_compatibility, inserts_2x4_most_bindings); 0.10::true_val(binding_compatibility, unk_binding_compatibility).

measured(s2, binding_compatibility, inserts_2x4_most_bindings).

all_consistent(binding_compatibility) :-
    (indep(s2), consistent(s2, binding_compatibility) ; \+indep(s2)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, inserts_2x4_most_bindings)).
query(true_val(binding_compatibility, unk_binding_compatibility)).