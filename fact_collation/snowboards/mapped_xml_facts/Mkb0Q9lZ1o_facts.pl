0.20::indep(s3).
0.15::indep(s5).
0.20::indep(s6).
0.15::indep(s8).
0.15::indep(s9).
0.15::indep(s10).
0.15::indep(s11).
0.10::indep(s13).
0.15::indep(s14).
0.40::indep(s12).
0.20::indep(s28).
0.25::indep(s29).
0.15::indep(s31).
0.20::indep(s34).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values capita=CAPiTA unk_brand=Unknown
% @importance 1.0

0.95::acc(s1, brand).

0.96::true_val(brand, capita); 0.04::true_val(brand, unk_brand).

measured(s1, brand, capita).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, capita)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values outerspace_living=Outerspace_Living unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).

0.96::true_val(model_name, outerspace_living); 0.04::true_val(model_name, unk_model_name).

measured(s1, model_name, outerspace_living).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, outerspace_living)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2026=2026 unk_model_year=Unknown
% @importance 1.0

0.95::acc(s1, model_year).

0.96::true_val(model_year, v2026); 0.04::true_val(model_year, unk_model_year).

measured(s1, model_year, v2026).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2026)).
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

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 1.0

0.95::acc(s1, board_category).

0.96::true_val(board_category, all_mountain_freeride); 0.04::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain_freeride).

all_consistent(board_category) :- consistent(s1, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.9

0.90::acc(s1, gender).
0.80::acc(s3, gender).

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).

measured(s1, gender, mens).
measured(s3, gender, mens).

all_consistent(gender) :-
    consistent(s1, gender),
    (indep(s3), consistent(s3, gender) ; \+indep(s3)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr model_first_available_year
% @type numeric
% @canonical true
% @original_name model_first_available_year
% @values v2017=2017 unk_model_first_available_year=Unknown
% @importance 0.85

0.82::acc(s2, model_first_available_year).

0.75::true_val(model_first_available_year, v2017); 0.25::true_val(model_first_available_year, unk_model_first_available_year).

measured(s2, model_first_available_year, v2017).

all_consistent(model_first_available_year) :- consistent(s2, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, v2017)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values redesigned_2026=Redesigned_for_2026 unk_redesign_year=Unknown
% @importance 0.7

0.72::acc(s5, redesign_year).

0.70::true_val(redesign_year, redesigned_2026); 0.30::true_val(redesign_year, unk_redesign_year).

measured(s5, redesign_year, redesigned_2026).

all_consistent(redesign_year) :-
    (indep(s5), consistent(s5, redesign_year) ; \+indep(s5)).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, redesigned_2026)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr redesign_year_2025
% @type categorical
% @canonical false
% @original_name 2025 model was reshaped with notable changes to personality
% @values reshaped_2025=Reshaped_2025_notable_changes unk_redesign_year_2025=Unknown
% @importance 0.6

0.55::acc(s12, redesign_year_2025).

0.50::true_val(redesign_year_2025, reshaped_2025); 0.50::true_val(redesign_year_2025, unk_redesign_year_2025).

measured(s12, redesign_year_2025, reshaped_2025).

all_consistent(redesign_year_2025) :-
    (indep(s12), consistent(s12, redesign_year_2025) ; \+indep(s12)).

evidence(all_consistent(redesign_year_2025)).
query(true_val(redesign_year_2025, reshaped_2025)).
query(true_val(redesign_year_2025, unk_redesign_year_2025)).

% @attr capita_founded
% @type categorical
% @canonical false
% @original_name CAPiTA founded
% @values seattle_2000=Seattle_in_2000 unk_capita_founded=Unknown
% @importance 0.55

0.90::acc(s21, capita_founded).

0.88::true_val(capita_founded, seattle_2000); 0.12::true_val(capita_founded, unk_capita_founded).

measured(s21, capita_founded, seattle_2000).

all_consistent(capita_founded) :- consistent(s21, capita_founded).

evidence(all_consistent(capita_founded)).
query(true_val(capita_founded, seattle_2000)).
query(true_val(capita_founded, unk_capita_founded)).

% @attr capita_company_motto
% @type categorical
% @canonical false
% @original_name CAPiTA company motto
% @values everything_is_possible=EVERYTHING_IS_POSSIBLE unk_capita_company_motto=Unknown
% @importance 0.15

0.55::acc(s22, capita_company_motto).

0.50::true_val(capita_company_motto, everything_is_possible); 0.50::true_val(capita_company_motto, unk_capita_company_motto).

measured(s22, capita_company_motto, everything_is_possible).

all_consistent(capita_company_motto) :- consistent(s22, capita_company_motto).

evidence(all_consistent(capita_company_motto)).
query(true_val(capita_company_motto, everything_is_possible)).
query(true_val(capita_company_motto, unk_capita_company_motto)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corp=Certified_B_Corporation unk_sustainability_certification=Unknown
% @importance 0.55

0.90::acc(s21, sustainability_certification).

0.88::true_val(sustainability_certification, b_corp); 0.12::true_val(sustainability_certification, unk_sustainability_certification).

measured(s21, sustainability_certification, b_corp).

all_consistent(sustainability_certification) :- consistent(s21, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corp)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_b_impact_score
% @type numeric
% @canonical false
% @original_name sustainability_certification B Impact Score
% @values v98_9=98.9 unk_sustainability_certification_b_impact_score=Unknown
% @importance 0.55

0.90::acc(s21, sustainability_certification_b_impact_score).

0.88::true_val(sustainability_certification_b_impact_score, v98_9); 0.12::true_val(sustainability_certification_b_impact_score, unk_sustainability_certification_b_impact_score).

measured(s21, sustainability_certification_b_impact_score, v98_9).

all_consistent(sustainability_certification_b_impact_score) :- consistent(s21, sustainability_certification_b_impact_score).

evidence(all_consistent(sustainability_certification_b_impact_score)).
query(true_val(sustainability_certification_b_impact_score, v98_9)).
query(true_val(sustainability_certification_b_impact_score, unk_sustainability_certification_b_impact_score)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values feistritz_austria=Feistritz_Carinthia_Austria unk_manufacturing_location=Unknown
% @importance 0.5

0.70::acc(s23, manufacturing_location).

0.65::true_val(manufacturing_location, feistritz_austria); 0.35::true_val(manufacturing_location, unk_manufacturing_location).

measured(s23, manufacturing_location, feistritz_austria).

all_consistent(manufacturing_location) :- consistent(s23, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, feistritz_austria)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr factory_name
% @type categorical
% @canonical false
% @original_name Factory name
% @values the_mothership=The_MotherShip unk_factory_name=Unknown
% @importance 1.0

0.95::acc(s1, factory_name).

0.96::true_val(factory_name, the_mothership); 0.04::true_val(factory_name, unk_factory_name).

measured(s1, factory_name, the_mothership).

all_consistent(factory_name) :- consistent(s1, factory_name).

evidence(all_consistent(factory_name)).
query(true_val(factory_name, the_mothership)).
query(true_val(factory_name, unk_factory_name)).

% @attr sustainability_certification_clean_energy
% @type categorical
% @canonical false
% @original_name sustainability_certification clean energy
% @values clean_energy_100=100pct_clean_energy_hydro_solar unk_sustainability_certification_clean_energy=Unknown
% @importance 1.0

0.93::acc(s1, sustainability_certification_clean_energy).

0.95::true_val(sustainability_certification_clean_energy, clean_energy_100); 0.05::true_val(sustainability_certification_clean_energy, unk_sustainability_certification_clean_energy).

measured(s1, sustainability_certification_clean_energy, clean_energy_100).

all_consistent(sustainability_certification_clean_energy) :- consistent(s1, sustainability_certification_clean_energy).

evidence(all_consistent(sustainability_certification_clean_energy)).
query(true_val(sustainability_certification_clean_energy, clean_energy_100)).
query(true_val(sustainability_certification_clean_energy, unk_sustainability_certification_clean_energy)).

% @attr sustainability_certification_energy_globe
% @type categorical
% @canonical false
% @original_name sustainability_certification Energy Globe Award
% @values won_austria_2017=Won_for_Austria_2017 unk_sustainability_certification_energy_globe=Unknown
% @importance 0.4

0.72::acc(s24, sustainability_certification_energy_globe).

0.65::true_val(sustainability_certification_energy_globe, won_austria_2017); 0.35::true_val(sustainability_certification_energy_globe, unk_sustainability_certification_energy_globe).

measured(s24, sustainability_certification_energy_globe, won_austria_2017).

all_consistent(sustainability_certification_energy_globe) :- consistent(s24, sustainability_certification_energy_globe).

evidence(all_consistent(sustainability_certification_energy_globe)).
query(true_val(sustainability_certification_energy_globe, won_austria_2017)).
query(true_val(sustainability_certification_energy_globe, unk_sustainability_certification_energy_globe)).

% @attr sustainability_certification_local_sourcing
% @type categorical
% @canonical false
% @original_name sustainability_certification local sourcing
% @values pct98_local=98pct_locally_sourced unk_sustainability_certification_local_sourcing=Unknown
% @importance 0.35

0.60::acc(s23, sustainability_certification_local_sourcing).

0.52::true_val(sustainability_certification_local_sourcing, pct98_local); 0.48::true_val(sustainability_certification_local_sourcing, unk_sustainability_certification_local_sourcing).

measured(s23, sustainability_certification_local_sourcing, pct98_local).

all_consistent(sustainability_certification_local_sourcing) :- consistent(s23, sustainability_certification_local_sourcing).

evidence(all_consistent(sustainability_certification_local_sourcing)).
query(true_val(sustainability_certification_local_sourcing, pct98_local)).
query(true_val(sustainability_certification_local_sourcing, unk_sustainability_certification_local_sourcing)).

% @attr sustainability_certification_inks
% @type categorical
% @canonical false
% @original_name sustainability_certification inks
% @values water_based_uv_solventless=Water_based_UV_curable_solventless_inks unk_sustainability_certification_inks=Unknown
% @importance 0.5

0.88::acc(s26, sustainability_certification_inks).

0.83::true_val(sustainability_certification_inks, water_based_uv_solventless); 0.17::true_val(sustainability_certification_inks, unk_sustainability_certification_inks).

measured(s26, sustainability_certification_inks, water_based_uv_solventless).

all_consistent(sustainability_certification_inks) :- consistent(s26, sustainability_certification_inks).

evidence(all_consistent(sustainability_certification_inks)).
query(true_val(sustainability_certification_inks, water_based_uv_solventless)).
query(true_val(sustainability_certification_inks, unk_sustainability_certification_inks)).

% @attr sustainability_certification_plt
% @type categorical
% @canonical false
% @original_name sustainability_certification PLT zero toxic lacquers
% @values zero_toxic_lacquers=Zero_toxic_lacquers_PLT unk_sustainability_certification_plt=Unknown
% @importance 1.0

0.93::acc(s1, sustainability_certification_plt).

0.95::true_val(sustainability_certification_plt, zero_toxic_lacquers); 0.05::true_val(sustainability_certification_plt, unk_sustainability_certification_plt).

measured(s1, sustainability_certification_plt, zero_toxic_lacquers).

all_consistent(sustainability_certification_plt) :- consistent(s1, sustainability_certification_plt).

evidence(all_consistent(sustainability_certification_plt)).
query(true_val(sustainability_certification_plt, zero_toxic_lacquers)).
query(true_val(sustainability_certification_plt, unk_sustainability_certification_plt)).

% @attr sustainability_certification_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification production scraps recyclable
% @values all_scraps_recyclable=All_production_scraps_recyclable unk_sustainability_certification_recycling=Unknown
% @importance 0.5

0.88::acc(s26, sustainability_certification_recycling).

0.83::true_val(sustainability_certification_recycling, all_scraps_recyclable); 0.17::true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling).

measured(s26, sustainability_certification_recycling, all_scraps_recyclable).

all_consistent(sustainability_certification_recycling) :- consistent(s26, sustainability_certification_recycling).

evidence(all_consistent(sustainability_certification_recycling)).
query(true_val(sustainability_certification_recycling, all_scraps_recyclable)).
query(true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling)).

% @attr sustainability_certification_shrink_wrap
% @type categorical
% @canonical false
% @original_name sustainability_certification recyclable shrink wrap
% @values recyclable_100=100pct_recyclable_shrink_wrap unk_sustainability_certification_shrink_wrap=Unknown
% @importance 0.5

0.88::acc(s26, sustainability_certification_shrink_wrap).

0.83::true_val(sustainability_certification_shrink_wrap, recyclable_100); 0.17::true_val(sustainability_certification_shrink_wrap, unk_sustainability_certification_shrink_wrap).

measured(s26, sustainability_certification_shrink_wrap, recyclable_100).

all_consistent(sustainability_certification_shrink_wrap) :- consistent(s26, sustainability_certification_shrink_wrap).

evidence(all_consistent(sustainability_certification_shrink_wrap)).
query(true_val(sustainability_certification_shrink_wrap, recyclable_100)).
query(true_val(sustainability_certification_shrink_wrap, unk_sustainability_certification_shrink_wrap)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification FSC certified wood cores
% @values fsc_certified=FSC_certified_wood_cores unk_sustainability_certification_fsc=Unknown
% @importance 0.55

0.90::acc(s27, sustainability_certification_fsc).

0.88::true_val(sustainability_certification_fsc, fsc_certified); 0.12::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s27, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :- consistent(s27, sustainability_certification_fsc).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr nfc_chip
% @type categorical
% @canonical false
% @original_name NFC chip
% @values embedded_since_2020=Embedded_NFC_since_2020 unk_nfc_chip=Unknown
% @importance 1.0

0.93::acc(s1, nfc_chip).

0.95::true_val(nfc_chip, embedded_since_2020); 0.05::true_val(nfc_chip, unk_nfc_chip).

measured(s1, nfc_chip, embedded_since_2020).

all_consistent(nfc_chip) :- consistent(s1, nfc_chip).

evidence(all_consistent(nfc_chip)).
query(true_val(nfc_chip, embedded_since_2020)).
query(true_val(nfc_chip, unk_nfc_chip)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values waxed_ready=Waxed_and_ready_from_factory unk_factory_wax=Unknown
% @importance 0.7

0.75::acc(s28, factory_wax).

0.72::true_val(factory_wax, waxed_ready); 0.28::true_val(factory_wax, unk_factory_wax).

measured(s28, factory_wax, waxed_ready).

all_consistent(factory_wax) :-
    (indep(s28), consistent(s28, factory_wax) ; \+indep(s28)).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, waxed_ready)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.9

0.95::acc(s1, shape).
0.72::acc(s5, shape).
0.80::acc(s6, shape).
0.75::acc(s9, shape).

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).

measured(s1, shape, directional_twin).
measured(s5, shape, directional_twin).
measured(s6, shape, directional_twin).
measured(s9, shape, directional_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s5), consistent(s5, shape) ; \+indep(s5)),
    (indep(s6), consistent(s6, shape) ; \+indep(s6)),
    (indep(s9), consistent(s9, shape) ; \+indep(s9)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v12_7=12.7 unk_setback=Unknown
% @importance 0.825

0.85::acc(s6, setback).
0.80::acc(s7, setback).

0.95::true_val(setback, v12_7); 0.05::true_val(setback, unk_setback).

measured(s6, setback, v12_7).
measured(s7, setback, v12_7).

all_consistent(setback) :-
    (indep(s6), consistent(s6, setback) ; \+indep(s6)),
    consistent(s7, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v12_7)).
query(true_val(setback, unk_setback)).

% @attr mounting_flexibility
% @type categorical
% @canonical false
% @original_name mounting_pattern option to mount centered
% @values centered_option=Can_mount_centered_as_true_twin unk_mounting_flexibility=Unknown
% @importance 0.75

0.75::acc(s8, mounting_flexibility).

0.70::true_val(mounting_flexibility, centered_option); 0.30::true_val(mounting_flexibility, unk_mounting_flexibility).

measured(s8, mounting_flexibility, centered_option).

all_consistent(mounting_flexibility) :-
    (indep(s8), consistent(s8, mounting_flexibility) ; \+indep(s8)).

evidence(all_consistent(mounting_flexibility)).
query(true_val(mounting_flexibility, centered_option)).
query(true_val(mounting_flexibility, unk_mounting_flexibility)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values resort_v3=Resort_V3_Profile rcr=Rocker_Camber_Rocker
% @importance 0.9

0.93::acc(s1, camber_type).
0.70::acc(s9, camber_type).

0.65::true_val(camber_type, resort_v3); 0.35::true_val(camber_type, rcr).

measured(s1, camber_type, resort_v3).
measured(s9, camber_type, rcr).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s9), consistent(s9, camber_type) ; \+indep(s9)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, resort_v3)).
query(true_val(camber_type, rcr)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values raised_camber_traditional_tips=Raised_camber_platform_elevated_contacts_traditional_arcs unk_camber_description=Unknown
% @importance 0.925

0.93::acc(s1, camber_description).
0.82::acc(s7, camber_description).

0.95::true_val(camber_description, raised_camber_traditional_tips); 0.05::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, raised_camber_traditional_tips).
measured(s7, camber_description, raised_camber_traditional_tips).

all_consistent(camber_description) :-
    consistent(s1, camber_description),
    consistent(s7, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, raised_camber_traditional_tips)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v5=5.0 unk_flex_rating_10=Unknown
% @importance 1.0

0.95::acc(s1, flex_rating_10).
0.72::acc(s5, flex_rating_10).

0.96::true_val(flex_rating_10, v5); 0.04::true_val(flex_rating_10, unk_flex_rating_10).

measured(s1, flex_rating_10, v5).
measured(s5, flex_rating_10, v5).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    (indep(s5), consistent(s5, flex_rating_10) ; \+indep(s5)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium=Medium unk_flex_rating_10_evo=Unknown
% @importance 0.9

0.80::acc(s3, flex_rating_10_evo).

0.78::true_val(flex_rating_10_evo, medium); 0.22::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s3, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :-
    (indep(s3), consistent(s3, flex_rating_10_evo) ; \+indep(s3)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_soft=Medium_soft unk_flex_feel=Unknown
% @importance 0.865

0.82::acc(s7, flex_feel).
0.78::acc(s35, flex_feel).

0.90::true_val(flex_feel, medium_soft); 0.10::true_val(flex_feel, unk_flex_feel).

measured(s7, flex_feel, medium_soft).
measured(s35, flex_feel, medium_soft).

all_consistent(flex_feel) :-
    consistent(s7, flex_feel),
    consistent(s35, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_soft)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values tapered_forgiving=Core_tapered_between_inserts_forgiving_flex unk_flex_direction=Unknown
% @importance 0.9

0.80::acc(s3, flex_direction).

0.78::true_val(flex_direction, tapered_forgiving); 0.22::true_val(flex_direction, unk_flex_direction).

measured(s3, flex_direction, tapered_forgiving).

all_consistent(flex_direction) :-
    (indep(s3), consistent(s3, flex_direction) ; \+indep(s3)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, tapered_forgiving)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values easy_press_butter=Easy_to_press_twist_and_butter unk_positive_aspect=Unknown
% @importance 0.875

0.82::acc(s7, positive_aspect).
0.85::acc(s17, positive_aspect).

0.95::true_val(positive_aspect, easy_press_butter); 0.05::true_val(positive_aspect, unk_positive_aspect).

measured(s7, positive_aspect, easy_press_butter).
measured(s17, positive_aspect, easy_press_butter).

all_consistent(positive_aspect) :-
    consistent(s7, positive_aspect),
    consistent(s17, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, easy_press_butter)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values poplar_beech_dual=Multizone_Dual_Core_Poplar_Beech unk_core_material=Unknown
% @importance 0.95

0.95::acc(s1, core_material).
0.82::acc(s3, core_material).

0.96::true_val(core_material, poplar_beech_dual); 0.04::true_val(core_material, unk_core_material).

measured(s1, core_material, poplar_beech_dual).
measured(s3, core_material, poplar_beech_dual).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s3), consistent(s3, core_material) ; \+indep(s3)).

evidence(all_consistent(core_material)).
query(true_val(core_material, poplar_beech_dual)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_re_engineered
% @type categorical
% @canonical false
% @original_name core_material re-engineered
% @values re_engineered_tapered=Re_engineered_taper_between_inserts unk_core_material_re_engineered=Unknown
% @importance 0.9

0.80::acc(s3, core_material_re_engineered).

0.78::true_val(core_material_re_engineered, re_engineered_tapered); 0.22::true_val(core_material_re_engineered, unk_core_material_re_engineered).

measured(s3, core_material_re_engineered, re_engineered_tapered).

all_consistent(core_material_re_engineered) :-
    (indep(s3), consistent(s3, core_material_re_engineered) ; \+indep(s3)).

evidence(all_consistent(core_material_re_engineered)).
query(true_val(core_material_re_engineered, re_engineered_tapered)).
query(true_val(core_material_re_engineered, unk_core_material_re_engineered)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biaxial_special_blend=Special_Blend_Biaxial_Fiberglass_626g_m2 unk_laminate=Unknown
% @importance 0.87

0.85::acc(s6, laminate).
0.82::acc(s3, laminate).

0.95::true_val(laminate, biaxial_special_blend); 0.05::true_val(laminate, unk_laminate).

measured(s6, laminate, biaxial_special_blend).
measured(s3, laminate, biaxial_special_blend).

all_consistent(laminate) :-
    (indep(s6), consistent(s6, laminate) ; \+indep(s6)),
    (indep(s3), consistent(s3, laminate) ; \+indep(s3)).

evidence(all_consistent(laminate)).
query(true_val(laminate, biaxial_special_blend)).
query(true_val(laminate, unk_laminate)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values magic_bean=Magic_Bean_Resin unk_resin=Unknown
% @importance 0.95

0.95::acc(s1, resin).
0.82::acc(s3, resin).
0.85::acc(s29, resin).

0.96::true_val(resin, magic_bean); 0.04::true_val(resin, unk_resin).

measured(s1, resin, magic_bean).
measured(s3, resin, magic_bean).
measured(s29, resin, magic_bean).

all_consistent(resin) :-
    consistent(s1, resin),
    (indep(s3), consistent(s3, resin) ; \+indep(s3)),
    (indep(s29), consistent(s29, resin) ; \+indep(s29)).

evidence(all_consistent(resin)).
query(true_val(resin, magic_bean)).
query(true_val(resin, unk_resin)).

% @attr sustainability_certification_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification resin bio-content
% @values pct60_renewable_plant=60pct_renewable_plant_based_no_waste unk_sustainability_certification_resin=Unknown
% @importance 0.9

0.82::acc(s3, sustainability_certification_resin).

0.80::true_val(sustainability_certification_resin, pct60_renewable_plant); 0.20::true_val(sustainability_certification_resin, unk_sustainability_certification_resin).

measured(s3, sustainability_certification_resin, pct60_renewable_plant).

all_consistent(sustainability_certification_resin) :-
    (indep(s3), consistent(s3, sustainability_certification_resin) ; \+indep(s3)).

evidence(all_consistent(sustainability_certification_resin)).
query(true_val(sustainability_certification_resin, pct60_renewable_plant)).
query(true_val(sustainability_certification_resin, unk_sustainability_certification_resin)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_boosters_4x30=4x30mm_Carbon_Boosters_tip_tail unk_construction_material_innovation=Unknown
% @importance 0.8

0.85::acc(s3, construction_material_innovation).
0.82::acc(s6, construction_material_innovation).
0.78::acc(s10, construction_material_innovation).

0.95::true_val(construction_material_innovation, carbon_boosters_4x30); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s3, construction_material_innovation, carbon_boosters_4x30).
measured(s6, construction_material_innovation, carbon_boosters_4x30).
measured(s10, construction_material_innovation, carbon_boosters_4x30).

all_consistent(construction_material_innovation) :-
    (indep(s3), consistent(s3, construction_material_innovation) ; \+indep(s3)),
    (indep(s6), consistent(s6, construction_material_innovation) ; \+indep(s6)),
    (indep(s10), consistent(s10, construction_material_innovation) ; \+indep(s10)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_boosters_4x30)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values superdrive_adv=Superdrive_ADV_sintruded unk_base_material=Unknown
% @importance 0.9

0.85::acc(s3, base_material).

0.83::true_val(base_material, superdrive_adv); 0.17::true_val(base_material, unk_base_material).

measured(s3, base_material, superdrive_adv).

all_consistent(base_material) :-
    (indep(s3), consistent(s3, base_material) ; \+indep(s3)).

evidence(all_consistent(base_material)).
query(true_val(base_material, superdrive_adv)).
query(true_val(base_material, unk_base_material)).

% @attr base_material_graphics
% @type categorical
% @canonical false
% @original_name base_material digital print die-cut
% @values digital_print_diecut=Digital_print_die_cut_two_colors unk_base_material_graphics=Unknown
% @importance 1.0

0.93::acc(s1, base_material_graphics).

0.95::true_val(base_material_graphics, digital_print_diecut); 0.05::true_val(base_material_graphics, unk_base_material_graphics).

measured(s1, base_material_graphics, digital_print_diecut).

all_consistent(base_material_graphics) :- consistent(s1, base_material_graphics).

evidence(all_consistent(base_material_graphics)).
query(true_val(base_material_graphics, digital_print_diecut)).
query(true_val(base_material_graphics, unk_base_material_graphics)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintruded=Sintruded_low_maintenance unk_base_type=Unknown
% @importance 0.9

0.85::acc(s3, base_type).

0.83::true_val(base_type, sintruded); 0.17::true_val(base_type, unk_base_type).

measured(s3, base_type, sintruded).

all_consistent(base_type) :-
    (indep(s3), consistent(s3, base_type) ; \+indep(s3)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintruded)).
query(true_val(base_type, unk_base_type)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values plt_technology=PLT_Technology_digital_screen_print_metallic unk_topsheet=Unknown
% @importance 1.0

0.95::acc(s1, topsheet).

0.96::true_val(topsheet, plt_technology); 0.04::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, plt_technology).

all_consistent(topsheet) :- consistent(s1, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, plt_technology)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_printing
% @type categorical
% @canonical false
% @original_name topsheet PAM16000 printing
% @values pam16000=PAM16000_16000_nozzles_plus_screen unk_topsheet_printing=Unknown
% @importance 0.45

0.68::acc(s11, topsheet_printing).

0.62::true_val(topsheet_printing, pam16000); 0.38::true_val(topsheet_printing, unk_topsheet_printing).

measured(s11, topsheet_printing, pam16000).

all_consistent(topsheet_printing) :-
    (indep(s11), consistent(s11, topsheet_printing) ; \+indep(s11)).

evidence(all_consistent(topsheet_printing)).
query(true_val(topsheet_printing, pam16000)).
query(true_val(topsheet_printing, unk_topsheet_printing)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radial=Radial_single_radius unk_sidecut_type=Unknown
% @importance 0.825

0.85::acc(s6, sidecut_type).
0.82::acc(s7, sidecut_type).

0.95::true_val(sidecut_type, radial); 0.05::true_val(sidecut_type, unk_sidecut_type).

measured(s6, sidecut_type, radial).
measured(s7, sidecut_type, radial).

all_consistent(sidecut_type) :-
    (indep(s6), consistent(s6, sidecut_type) ; \+indep(s6)),
    consistent(s7, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.8

0.75::acc(s9, mounting_pattern).

0.70::true_val(mounting_pattern, inserts_2x4); 0.30::true_val(mounting_pattern, unk_mounting_pattern).

measured(s9, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s9), consistent(s9, mounting_pattern) ; \+indep(s9)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr sidewall_material
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values full_abs=Full_ABS_Sidewalls unk_sidewall_material=Unknown
% @importance 0.6

0.55::acc(s12, sidewall_material).

0.48::true_val(sidewall_material, full_abs); 0.52::true_val(sidewall_material, unk_sidewall_material).

measured(s12, sidewall_material, full_abs).

all_consistent(sidewall_material) :-
    (indep(s12), consistent(s12, sidewall_material) ; \+indep(s12)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, full_abs)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values steel_360=360_Degree_Steel_Edges unk_edge_technology=Unknown
% @importance 0.6

0.55::acc(s12, edge_technology).

0.48::true_val(edge_technology, steel_360); 0.52::true_val(edge_technology, unk_edge_technology).

measured(s12, edge_technology, steel_360).

all_consistent(edge_technology) :-
    (indep(s12), consistent(s12, edge_technology) ; \+indep(s12)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, steel_360)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values full_range=150_152_154_156_158_160_155W_157W_159W_161W unk_available_sizes=Unknown
% @importance 0.9

0.93::acc(s1, available_sizes).

0.95::true_val(available_sizes, full_range); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, full_range).

all_consistent(available_sizes) :- consistent(s1, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, full_range)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_limited
% @type categorical
% @canonical false
% @original_name available_sizes limited availability
% @values limited_availability=Limited_availability_some_retailers unk_available_sizes_limited=Unknown
% @importance 0.5

0.60::acc(s13, available_sizes_limited).

0.55::true_val(available_sizes_limited, limited_availability); 0.45::true_val(available_sizes_limited, unk_available_sizes_limited).

measured(s13, available_sizes_limited, limited_availability).

all_consistent(available_sizes_limited) :-
    (indep(s13), consistent(s13, available_sizes_limited) ; \+indep(s13)).

evidence(all_consistent(available_sizes_limited)).
query(true_val(available_sizes_limited, limited_availability)).
query(true_val(available_sizes_limited, unk_available_sizes_limited)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide_11_5_plus unk_width_options=Unknown
% @importance 0.8

0.85::acc(s1, width_options).
0.75::acc(s14, width_options).
0.78::acc(s35, width_options).

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).

measured(s1, width_options, standard_and_wide).
measured(s14, width_options, standard_and_wide).
measured(s35, width_options, standard_and_wide).

all_consistent(width_options) :-
    consistent(s1, width_options),
    (indep(s14), consistent(s14, width_options) ; \+indep(s14)),
    consistent(s35, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v529_95=529.95 unk_price_usd_msrp=Unknown
% @importance 0.88

0.90::acc(s15, price_usd_msrp).
0.85::acc(s18, price_usd_msrp).
0.80::acc(s20, price_usd_msrp).

0.95::true_val(price_usd_msrp, v529_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s15, price_usd_msrp, v529_95).
measured(s18, price_usd_msrp, v529_95).
measured(s20, price_usd_msrp, v529_95).

all_consistent(price_usd_msrp) :-
    consistent(s15, price_usd_msrp),
    consistent(s18, price_usd_msrp),
    consistent(s20, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v529_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v423_96=423.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.90::acc(s16, price_usd_evo).

0.88::true_val(price_usd_evo, v423_96); 0.12::true_val(price_usd_evo, unk_price_usd_evo).

measured(s16, price_usd_evo, v423_96).

all_consistent(price_usd_evo) :- consistent(s16, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v423_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v423_96=423.96 unk_price_usd_backcountry=Unknown
% @importance 0.9

0.88::acc(s17, price_usd_backcountry).

0.82::true_val(price_usd_backcountry, v423_96); 0.18::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s17, price_usd_backcountry, v423_96).

all_consistent(price_usd_backcountry) :- consistent(s17, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v423_96)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_rei
% @type numeric
% @canonical true
% @original_name price_usd_rei
% @unit USD
% @values v423_93=423.93 unk_price_usd_rei=Unknown
% @importance 0.9

0.88::acc(s17, price_usd_rei).

0.82::true_val(price_usd_rei, v423_93); 0.18::true_val(price_usd_rei, unk_price_usd_rei).

measured(s17, price_usd_rei, v423_93).

all_consistent(price_usd_rei) :- consistent(s17, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v423_93)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_park2peak
% @type numeric
% @canonical false
% @original_name Sale price at Park2Peak
% @unit USD
% @values v423_95=423.95 unk_price_park2peak=Unknown
% @importance 0.9

0.88::acc(s18, price_park2peak).

0.82::true_val(price_park2peak, v423_95); 0.18::true_val(price_park2peak, unk_price_park2peak).

measured(s18, price_park2peak, v423_95).

all_consistent(price_park2peak) :- consistent(s18, price_park2peak).

evidence(all_consistent(price_park2peak)).
query(true_val(price_park2peak, v423_95)).
query(true_val(price_park2peak, unk_price_park2peak)).

% @attr price_spokex
% @type numeric
% @canonical false
% @original_name Price at SpokeX
% @unit USD
% @values v529_95=529.95 unk_price_spokex=Unknown
% @importance 0.7

0.80::acc(s19, price_spokex).

0.72::true_val(price_spokex, v529_95); 0.28::true_val(price_spokex, unk_price_spokex).

measured(s19, price_spokex, v529_95).

all_consistent(price_spokex) :- consistent(s19, price_spokex).

evidence(all_consistent(price_spokex)).
query(true_val(price_spokex, v529_95)).
query(true_val(price_spokex, unk_price_spokex)).

% @attr price_rocky_mountain
% @type numeric
% @canonical false
% @original_name Price at Rocky Mountain Ski and Board
% @unit USD
% @values v529_95=529.95 unk_price_rocky_mountain=Unknown
% @importance 0.7

0.80::acc(s20, price_rocky_mountain).

0.72::true_val(price_rocky_mountain, v529_95); 0.28::true_val(price_rocky_mountain, unk_price_rocky_mountain).

measured(s20, price_rocky_mountain, v529_95).

all_consistent(price_rocky_mountain) :- consistent(s20, price_rocky_mountain).

evidence(all_consistent(price_rocky_mountain)).
query(true_val(price_rocky_mountain, v529_95)).
query(true_val(price_rocky_mountain, unk_price_rocky_mountain)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v719_99=719.99 unk_price_aud_merchant=Unknown
% @importance 0.45

0.70::acc(s11, price_aud_merchant).

0.62::true_val(price_aud_merchant, v719_99); 0.38::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s11, price_aud_merchant, v719_99).

all_consistent(price_aud_merchant) :- consistent(s11, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v719_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr comparable_board_same_brand_price
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand Mercury price comparison
% @values mercury_more_expensive=Mercury_630_vs_OSL_480_about_50_cheaper unk_comparable_board_same_brand_price=Unknown
% @importance 0.85

0.80::acc(s7, comparable_board_same_brand_price).

0.72::true_val(comparable_board_same_brand_price, mercury_more_expensive); 0.28::true_val(comparable_board_same_brand_price, unk_comparable_board_same_brand_price).

measured(s7, comparable_board_same_brand_price, mercury_more_expensive).

all_consistent(comparable_board_same_brand_price) :- consistent(s7, comparable_board_same_brand_price).

evidence(all_consistent(comparable_board_same_brand_price)).
query(true_val(comparable_board_same_brand_price, mercury_more_expensive)).
query(true_val(comparable_board_same_brand_price, unk_comparable_board_same_brand_price)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_capita_direct=Available_CAPiTA_direct unk_availability_status=Unknown
% @importance 1.0

0.95::acc(s1, availability_status).

0.96::true_val(availability_status, available_capita_direct); 0.04::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, available_capita_direct).

all_consistent(availability_status) :- consistent(s1, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_capita_direct)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status evo.com
% @values in_stock=In_stock_free_shipping_price_match unk_availability_status_evo=Unknown
% @importance 0.95

0.90::acc(s16, availability_status_evo).

0.88::true_val(availability_status_evo, in_stock); 0.12::true_val(availability_status_evo, unk_availability_status_evo).

measured(s16, availability_status_evo, in_stock).

all_consistent(availability_status_evo) :- consistent(s16, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status Backcountry.com
% @values available=Available unk_availability_status_backcountry=Unknown
% @importance 0.9

0.85::acc(s17, availability_status_backcountry).

0.82::true_val(availability_status_backcountry, available); 0.18::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s17, availability_status_backcountry, available).

all_consistent(availability_status_backcountry) :- consistent(s17, availability_status_backcountry).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status REI Co-op
% @values available=Available unk_availability_status_rei=Unknown
% @importance 0.75

0.88::acc(s29, availability_status_rei).

0.82::true_val(availability_status_rei, available); 0.18::true_val(availability_status_rei, unk_availability_status_rei).

measured(s29, availability_status_rei, available).

all_consistent(availability_status_rei) :- consistent(s29, availability_status_rei).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, available)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_peter_glenn
% @type categorical
% @canonical false
% @original_name availability_status Peter Glenn
% @values available=Available unk_availability_status_peter_glenn=Unknown
% @importance 0.8

0.82::acc(s6, availability_status_peter_glenn).

0.78::true_val(availability_status_peter_glenn, available); 0.22::true_val(availability_status_peter_glenn, unk_availability_status_peter_glenn).

measured(s6, availability_status_peter_glenn, available).

all_consistent(availability_status_peter_glenn) :- consistent(s6, availability_status_peter_glenn).

evidence(all_consistent(availability_status_peter_glenn)).
query(true_val(availability_status_peter_glenn, available)).
query(true_val(availability_status_peter_glenn, unk_availability_status_peter_glenn)).

% @attr availability_status_zumiez
% @type categorical
% @canonical false
% @original_name availability_status Zumiez
% @values available=Available unk_availability_status_zumiez=Unknown
% @importance 0.7

0.78::acc(s5, availability_status_zumiez).

0.72::true_val(availability_status_zumiez, available); 0.28::true_val(availability_status_zumiez, unk_availability_status_zumiez).

measured(s5, availability_status_zumiez, available).

all_consistent(availability_status_zumiez) :- consistent(s5, availability_status_zumiez).

evidence(all_consistent(availability_status_zumiez)).
query(true_val(availability_status_zumiez, available)).
query(true_val(availability_status_zumiez, unk_availability_status_zumiez)).

% @attr availability_status_pacific_boarder
% @type categorical
% @canonical false
% @original_name availability_status Pacific Boarder
% @values available=Available unk_availability_status_pacific_boarder=Unknown
% @importance 0.4

0.75::acc(s30, availability_status_pacific_boarder).

0.68::true_val(availability_status_pacific_boarder, available); 0.32::true_val(availability_status_pacific_boarder, unk_availability_status_pacific_boarder).

measured(s30, availability_status_pacific_boarder, available).

all_consistent(availability_status_pacific_boarder) :- consistent(s30, availability_status_pacific_boarder).

evidence(all_consistent(availability_status_pacific_boarder)).
query(true_val(availability_status_pacific_boarder, available)).
query(true_val(availability_status_pacific_boarder, unk_availability_status_pacific_boarder)).

% @attr availability_status_the_source
% @type categorical
% @canonical false
% @original_name availability_status The Source Snowboard
% @values available=Available unk_availability_status_the_source=Unknown
% @importance 0.75

0.78::acc(s14, availability_status_the_source).

0.72::true_val(availability_status_the_source, available); 0.28::true_val(availability_status_the_source, unk_availability_status_the_source).

measured(s14, availability_status_the_source, available).

all_consistent(availability_status_the_source) :- consistent(s14, availability_status_the_source).

evidence(all_consistent(availability_status_the_source)).
query(true_val(availability_status_the_source, available)).
query(true_val(availability_status_the_source, unk_availability_status_the_source)).

% @attr availability_status_rude_boys
% @type categorical
% @canonical false
% @original_name availability_status Rude Boys
% @values available=Available unk_availability_status_rude_boys=Unknown
% @importance 0.65

0.72::acc(s31, availability_status_rude_boys).

0.65::true_val(availability_status_rude_boys, available); 0.35::true_val(availability_status_rude_boys, unk_availability_status_rude_boys).

measured(s31, availability_status_rude_boys, available).

all_consistent(availability_status_rude_boys) :- consistent(s31, availability_status_rude_boys).

evidence(all_consistent(availability_status_rude_boys)).
query(true_val(availability_status_rude_boys, available)).
query(true_val(availability_status_rude_boys, unk_availability_status_rude_boys)).

% @attr availability_status_park2peak
% @type categorical
% @canonical false
% @original_name availability_status Park2Peak
% @values available=Available unk_availability_status_park2peak=Unknown
% @importance 0.9

0.82::acc(s18, availability_status_park2peak).

0.78::true_val(availability_status_park2peak, available); 0.22::true_val(availability_status_park2peak, unk_availability_status_park2peak).

measured(s18, availability_status_park2peak, available).

all_consistent(availability_status_park2peak) :- consistent(s18, availability_status_park2peak).

evidence(all_consistent(availability_status_park2peak)).
query(true_val(availability_status_park2peak, available)).
query(true_val(availability_status_park2peak, unk_availability_status_park2peak)).

% @attr availability_status_colorado_ski_shop
% @type categorical
% @canonical false
% @original_name availability_status Colorado Ski Shop
% @values available=Available unk_availability_status_colorado_ski_shop=Unknown
% @importance 0.5

0.70::acc(s32, availability_status_colorado_ski_shop).

0.60::true_val(availability_status_colorado_ski_shop, available); 0.40::true_val(availability_status_colorado_ski_shop, unk_availability_status_colorado_ski_shop).

measured(s32, availability_status_colorado_ski_shop, available).

all_consistent(availability_status_colorado_ski_shop) :- consistent(s32, availability_status_colorado_ski_shop).

evidence(all_consistent(availability_status_colorado_ski_shop)).
query(true_val(availability_status_colorado_ski_shop, available)).
query(true_val(availability_status_colorado_ski_shop, unk_availability_status_colorado_ski_shop)).

% @attr availability_status_spokex
% @type categorical
% @canonical false
% @original_name availability_status SpokeX Bike Co
% @values available=Available unk_availability_status_spokex=Unknown
% @importance 0.7

0.75::acc(s19, availability_status_spokex).

0.68::true_val(availability_status_spokex, available); 0.32::true_val(availability_status_spokex, unk_availability_status_spokex).

measured(s19, availability_status_spokex, available).

all_consistent(availability_status_spokex) :- consistent(s19, availability_status_spokex).

evidence(all_consistent(availability_status_spokex)).
query(true_val(availability_status_spokex, available)).
query(true_val(availability_status_spokex, unk_availability_status_spokex)).

% @attr availability_status_rocky_mountain
% @type categorical
% @canonical false
% @original_name availability_status Rocky Mountain Ski and Board
% @values available=Available unk_availability_status_rocky_mountain=Unknown
% @importance 0.7

0.75::acc(s20, availability_status_rocky_mountain).

0.68::true_val(availability_status_rocky_mountain, available); 0.32::true_val(availability_status_rocky_mountain, unk_availability_status_rocky_mountain).

measured(s20, availability_status_rocky_mountain, available).

all_consistent(availability_status_rocky_mountain) :- consistent(s20, availability_status_rocky_mountain).

evidence(all_consistent(availability_status_rocky_mountain)).
query(true_val(availability_status_rocky_mountain, available)).
query(true_val(availability_status_rocky_mountain, unk_availability_status_rocky_mountain)).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status The House
% @values available=Available unk_availability_status_the_house=Unknown
% @importance 0.4

0.75::acc(s33, availability_status_the_house).

0.68::true_val(availability_status_the_house, available); 0.32::true_val(availability_status_the_house, unk_availability_status_the_house).

measured(s33, availability_status_the_house, available).

all_consistent(availability_status_the_house) :- consistent(s33, availability_status_the_house).

evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, available)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status Amazon
% @values available=Available unk_availability_status_amazon=Unknown
% @importance 0.5

0.65::acc(s13, availability_status_amazon).

0.55::true_val(availability_status_amazon, available); 0.45::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s13, availability_status_amazon, available).

all_consistent(availability_status_amazon) :- consistent(s13, availability_status_amazon).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, available)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr availability_status_snowboards_com
% @type categorical
% @canonical false
% @original_name availability_status Snowboards.com
% @values available=Available unk_availability_status_snowboards_com=Unknown
% @importance 0.7

0.78::acc(s28, availability_status_snowboards_com).

0.72::true_val(availability_status_snowboards_com, available); 0.28::true_val(availability_status_snowboards_com, unk_availability_status_snowboards_com).

measured(s28, availability_status_snowboards_com, available).

all_consistent(availability_status_snowboards_com) :- consistent(s28, availability_status_snowboards_com).

evidence(all_consistent(availability_status_snowboards_com)).
query(true_val(availability_status_snowboards_com, available)).
query(true_val(availability_status_snowboards_com, unk_availability_status_snowboards_com)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status Melbourne Snowboard Australia 2027
% @values available_au_2027=Available_Australia_listed_2027 unk_availability_status_melbourne=Unknown
% @importance 0.45

0.70::acc(s11, availability_status_melbourne).

0.62::true_val(availability_status_melbourne, available_au_2027); 0.38::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s11, availability_status_melbourne, available_au_2027).

all_consistent(availability_status_melbourne) :- consistent(s11, availability_status_melbourne).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available_au_2027)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_limited_stock
% @type categorical
% @canonical false
% @original_name Some sizes showing limited stock backordered
% @values limited_stock=Limited_stock_backordered_multiple_retailers unk_availability_status_limited_stock=Unknown
% @importance 0.5

0.65::acc(s32, availability_status_limited_stock).

0.55::true_val(availability_status_limited_stock, limited_stock); 0.45::true_val(availability_status_limited_stock, unk_availability_status_limited_stock).

measured(s32, availability_status_limited_stock, limited_stock).

all_consistent(availability_status_limited_stock) :- consistent(s32, availability_status_limited_stock).

evidence(all_consistent(availability_status_limited_stock)).
query(true_val(availability_status_limited_stock, limited_stock)).
query(true_val(availability_status_limited_stock, unk_availability_status_limited_stock)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.72

0.82::acc(s34, warranty_period_years).
0.78::acc(s28, warranty_period_years).
0.72::acc(s31, warranty_period_years).

0.95::true_val(warranty_period_years, v2); 0.05::true_val(warranty_period_years, unk_warranty_period_years).

measured(s34, warranty_period_years, v2).
measured(s28, warranty_period_years, v2).
measured(s31, warranty_period_years, v2).

all_consistent(warranty_period_years) :-
    (indep(s34), consistent(s34, warranty_period_years) ; \+indep(s34)),
    (indep(s28), consistent(s28, warranty_period_years) ; \+indep(s28)),
    (indep(s31), consistent(s31, warranty_period_years) ; \+indep(s31)).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty_terms
% @type categorical
% @canonical false
% @original_name warranty terms repair or replacement
% @values repair_replace_no_misuse=Repair_or_replacement_no_misuse_coverage unk_warranty_terms=Unknown
% @importance 0.75

0.82::acc(s34, warranty_terms).

0.78::true_val(warranty_terms, repair_replace_no_misuse); 0.22::true_val(warranty_terms, unk_warranty_terms).

measured(s34, warranty_terms, repair_replace_no_misuse).

all_consistent(warranty_terms) :-
    (indep(s34), consistent(s34, warranty_terms) ; \+indep(s34)).

evidence(all_consistent(warranty_terms)).
query(true_val(warranty_terms, repair_replace_no_misuse)).
query(true_val(warranty_terms, unk_warranty_terms)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate=Intermediate unk_rider_level=Unknown
% @importance 1.0

0.95::acc(s1, rider_level).

0.96::true_val(rider_level, intermediate); 0.04::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, intermediate).

all_consistent(rider_level) :- consistent(s1, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate=Intermediate intermediate_advanced=Intermediate_Advanced
% @importance 0.87

0.93::acc(s1, skill_level_recommendation).
0.82::acc(s16, skill_level_recommendation).
0.72::acc(s20, skill_level_recommendation).
0.80::acc(s35, skill_level_recommendation).

0.55::true_val(skill_level_recommendation, intermediate); 0.45::true_val(skill_level_recommendation, intermediate_advanced).

measured(s1, skill_level_recommendation, intermediate).
measured(s16, skill_level_recommendation, intermediate_advanced).
measured(s20, skill_level_recommendation, intermediate_advanced).
measured(s35, skill_level_recommendation, intermediate).

all_consistent(skill_level_recommendation) :-
    consistent(s1, skill_level_recommendation),
    consistent(s16, skill_level_recommendation),
    consistent(s20, skill_level_recommendation),
    consistent(s35, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate)).
query(true_val(skill_level_recommendation, intermediate_advanced)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mountain_freeride=All_Mountain_Freeride_powder_park unk_terrain_suitability=Unknown
% @importance 1.0

0.95::acc(s1, terrain_suitability).

0.96::true_val(terrain_suitability, all_mountain_freeride); 0.04::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, all_mountain_freeride).

all_consistent(terrain_suitability) :- consistent(s1, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mountain_freeride)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values freeride_versatile=Freeriding_versatile_all_terrain unk_riding_style=Unknown
% @importance 1.0

0.93::acc(s1, riding_style).

0.95::true_val(riding_style, freeride_versatile); 0.05::true_val(riding_style, unk_riding_style).

measured(s1, riding_style, freeride_versatile).

all_consistent(riding_style) :- consistent(s1, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freeride_versatile)).
query(true_val(riding_style, unk_riding_style)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values great_pop=Great_pop_lively_ollie unk_pop=Unknown
% @importance 0.9

0.85::acc(s17, pop).

0.82::true_val(pop, great_pop); 0.18::true_val(pop, unk_pop).

measured(s17, pop, great_pop).

all_consistent(pop) :- consistent(s17, pop).

evidence(all_consistent(pop)).
query(true_val(pop, great_pop)).
query(true_val(pop, unk_pop)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values quick_lively_balanced=Very_quick_lively_balanced_any_radius unk_turn_initiation_performance=Unknown
% @importance 0.9

0.85::acc(s17, turn_initiation_performance).

0.82::true_val(turn_initiation_performance, quick_lively_balanced); 0.18::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s17, turn_initiation_performance, quick_lively_balanced).

all_consistent(turn_initiation_performance) :- consistent(s17, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, quick_lively_balanced)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical false
% @original_name carving_rating_tgr
% @values decent_for_camber=Carves_not_bad_for_little_camber unk_carving_rating_tgr=Unknown
% @importance 0.9

0.85::acc(s17, carving_rating_tgr).

0.82::true_val(carving_rating_tgr, decent_for_camber); 0.18::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s17, carving_rating_tgr, decent_for_camber).

all_consistent(carving_rating_tgr) :- consistent(s17, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, decent_for_camber)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values almost_perfect=Almost_perfect_switch unk_switch_riding=Unknown
% @importance 0.9

0.85::acc(s17, switch_riding).

0.82::true_val(switch_riding, almost_perfect); 0.18::true_val(switch_riding, unk_switch_riding).

measured(s17, switch_riding, almost_perfect).

all_consistent(switch_riding) :- consistent(s17, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, almost_perfect)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values very_good_price_point=Very_good_for_price_improving_yearly unk_base_glide_performance=Unknown
% @importance 0.9

0.85::acc(s17, base_glide_performance).

0.82::true_val(base_glide_performance, very_good_price_point); 0.18::true_val(base_glide_performance, unk_base_glide_performance).

measured(s17, base_glide_performance, very_good_price_point).

all_consistent(base_glide_performance) :- consistent(s17, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, very_good_price_point)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values weak_hard_snow=Less_edge_hold_harder_snow_not_ideal_icy grippy_for_softness=Not_bad_for_soft_board_grippy_camber
% @importance 0.87

0.82::acc(s17, edge_hold).
0.80::acc(s2, edge_hold).
0.78::acc(s7, edge_hold).

0.40::true_val(edge_hold, weak_hard_snow); 0.60::true_val(edge_hold, grippy_for_softness).

measured(s17, edge_hold, weak_hard_snow).
measured(s2, edge_hold, weak_hard_snow).
measured(s7, edge_hold, grippy_for_softness).

all_consistent(edge_hold) :-
    consistent(s17, edge_hold),
    consistent(s2, edge_hold),
    consistent(s7, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, weak_hard_snow)).
query(true_val(edge_hold, grippy_for_softness)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values poor_wet_uneven_snow=Bucky_in_wet_thick_uneven_snow unk_negative_aspect=Unknown
% @importance 0.88

0.82::acc(s17, negative_aspect).
0.80::acc(s2, negative_aspect).

0.95::true_val(negative_aspect, poor_wet_uneven_snow); 0.05::true_val(negative_aspect, unk_negative_aspect).

measured(s17, negative_aspect, poor_wet_uneven_snow).
measured(s2, negative_aspect, poor_wet_uneven_snow).

all_consistent(negative_aspect) :-
    consistent(s17, negative_aspect),
    consistent(s2, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, poor_wet_uneven_snow)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values floats_well=Floats_well_better_than_expected unk_powder_rating_tgr=Unknown
% @importance 0.8

0.85::acc(s17, powder_rating_tgr).
0.60::acc(s36, powder_rating_tgr).

0.90::true_val(powder_rating_tgr, floats_well); 0.10::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s17, powder_rating_tgr, floats_well).
measured(s36, powder_rating_tgr, floats_well).

all_consistent(powder_rating_tgr) :-
    consistent(s17, powder_rating_tgr),
    consistent(s36, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, floats_well)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr terrain_suitability_park
% @type categorical
% @canonical false
% @original_name terrain_suitability park focus
% @values rails_boxes_not_jumps=Fun_park_board_rails_boxes_not_large_jumps unk_terrain_suitability_park=Unknown
% @importance 0.85

0.78::acc(s7, terrain_suitability_park).

0.72::true_val(terrain_suitability_park, rails_boxes_not_jumps); 0.28::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s7, terrain_suitability_park, rails_boxes_not_jumps).

all_consistent(terrain_suitability_park) :- consistent(s7, terrain_suitability_park).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, rails_boxes_not_jumps)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr negative_aspect_high_speed
% @type categorical
% @canonical false
% @original_name negative_aspect high speed chunky snow
% @values soft_flex_hard_turns=Soft_flex_hard_turns_high_speed_chunky_snow unk_negative_aspect_high_speed=Unknown
% @importance 0.85

0.78::acc(s7, negative_aspect_high_speed).

0.72::true_val(negative_aspect_high_speed, soft_flex_hard_turns); 0.28::true_val(negative_aspect_high_speed, unk_negative_aspect_high_speed).

measured(s7, negative_aspect_high_speed, soft_flex_hard_turns).

all_consistent(negative_aspect_high_speed) :- consistent(s7, negative_aspect_high_speed).

evidence(all_consistent(negative_aspect_high_speed)).
query(true_val(negative_aspect_high_speed, soft_flex_hard_turns)).
query(true_val(negative_aspect_high_speed, unk_negative_aspect_high_speed)).

% @attr positive_aspect_forgiving
% @type categorical
% @canonical false
% @original_name positive_aspect stable forgiving ride
% @values stable_forgiving=Stable_forgiving_easy_one_foot_flat_base unk_positive_aspect_forgiving=Unknown
% @importance 0.9

0.85::acc(s17, positive_aspect_forgiving).

0.82::true_val(positive_aspect_forgiving, stable_forgiving); 0.18::true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving).

measured(s17, positive_aspect_forgiving, stable_forgiving).

all_consistent(positive_aspect_forgiving) :- consistent(s17, positive_aspect_forgiving).

evidence(all_consistent(positive_aspect_forgiving)).
query(true_val(positive_aspect_forgiving, stable_forgiving)).
query(true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values light=Light_on_scales_felt_light unk_board_weight_grams=Unknown
% @importance 0.88

0.80::acc(s35, board_weight_grams).

0.72::true_val(board_weight_grams, light); 0.28::true_val(board_weight_grams, unk_board_weight_grams).

measured(s35, board_weight_grams, light).

all_consistent(board_weight_grams) :- consistent(s35, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, light)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values great_for_price=Great_board_for_price_softer_conditions unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.85::acc(s17, reviewer_opinion_the_good_ride).

0.82::true_val(reviewer_opinion_the_good_ride, great_for_price); 0.18::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s17, reviewer_opinion_the_good_ride, great_for_price).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s17, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, great_for_price)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_the_good_ride_fun
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride fun ride
% @values fun_am_freestyle=Fun_all_mountain_freestyle_ride unk_reviewer_opinion_the_good_ride_fun=Unknown
% @importance 0.9

0.85::acc(s17, reviewer_opinion_the_good_ride_fun).

0.82::true_val(reviewer_opinion_the_good_ride_fun, fun_am_freestyle); 0.18::true_val(reviewer_opinion_the_good_ride_fun, unk_reviewer_opinion_the_good_ride_fun).

measured(s17, reviewer_opinion_the_good_ride_fun, fun_am_freestyle).

all_consistent(reviewer_opinion_the_good_ride_fun) :- consistent(s17, reviewer_opinion_the_good_ride_fun).

evidence(all_consistent(reviewer_opinion_the_good_ride_fun)).
query(true_val(reviewer_opinion_the_good_ride_fun, fun_am_freestyle)).
query(true_val(reviewer_opinion_the_good_ride_fun, unk_reviewer_opinion_the_good_ride_fun)).

% @attr reviewer_opinion_the_good_ride_edge_hold
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride edge hold wish
% @values want_more_edge_hold=Only_wish_more_edge_hold unk_reviewer_opinion_the_good_ride_edge_hold=Unknown
% @importance 0.9

0.85::acc(s17, reviewer_opinion_the_good_ride_edge_hold).

0.82::true_val(reviewer_opinion_the_good_ride_edge_hold, want_more_edge_hold); 0.18::true_val(reviewer_opinion_the_good_ride_edge_hold, unk_reviewer_opinion_the_good_ride_edge_hold).

measured(s17, reviewer_opinion_the_good_ride_edge_hold, want_more_edge_hold).

all_consistent(reviewer_opinion_the_good_ride_edge_hold) :- consistent(s17, reviewer_opinion_the_good_ride_edge_hold).

evidence(all_consistent(reviewer_opinion_the_good_ride_edge_hold)).
query(true_val(reviewer_opinion_the_good_ride_edge_hold, want_more_edge_hold)).
query(true_val(reviewer_opinion_the_good_ride_edge_hold, unk_reviewer_opinion_the_good_ride_edge_hold)).

% @attr snowboard_robot_summary
% @type categorical
% @canonical false
% @original_name Snowboard Robot summary
% @values softer_cheaper_mercury=Close_to_softer_cheaper_Mercury unk_snowboard_robot_summary=Unknown
% @importance 0.85

0.78::acc(s7, snowboard_robot_summary).

0.72::true_val(snowboard_robot_summary, softer_cheaper_mercury); 0.28::true_val(snowboard_robot_summary, unk_snowboard_robot_summary).

measured(s7, snowboard_robot_summary, softer_cheaper_mercury).

all_consistent(snowboard_robot_summary) :- consistent(s7, snowboard_robot_summary).

evidence(all_consistent(snowboard_robot_summary)).
query(true_val(snowboard_robot_summary, softer_cheaper_mercury)).
query(true_val(snowboard_robot_summary, unk_snowboard_robot_summary)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values versatile_reasonable_light=Versatile_all_mountain_reasonable_price_lightweight unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.88

0.80::acc(s35, reviewer_opinion_snowboardingprofiles).

0.72::true_val(reviewer_opinion_snowboardingprofiles, versatile_reasonable_light); 0.28::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s35, reviewer_opinion_snowboardingprofiles, versatile_reasonable_light).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s35, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, versatile_reasonable_light)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_beefier
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles beefier carver
% @values beefier_better_carver=Got_beefier_better_carver_less_easy unk_reviewer_opinion_snowboardingprofiles_beefier=Unknown
% @importance 0.88

0.80::acc(s35, reviewer_opinion_snowboardingprofiles_beefier).

0.72::true_val(reviewer_opinion_snowboardingprofiles_beefier, beefier_better_carver); 0.28::true_val(reviewer_opinion_snowboardingprofiles_beefier, unk_reviewer_opinion_snowboardingprofiles_beefier).

measured(s35, reviewer_opinion_snowboardingprofiles_beefier, beefier_better_carver).

all_consistent(reviewer_opinion_snowboardingprofiles_beefier) :- consistent(s35, reviewer_opinion_snowboardingprofiles_beefier).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_beefier)).
query(true_val(reviewer_opinion_snowboardingprofiles_beefier, beefier_better_carver)).
query(true_val(reviewer_opinion_snowboardingprofiles_beefier, unk_reviewer_opinion_snowboardingprofiles_beefier)).

% @attr reviewer_opinion_snowboardingprofiles_softer
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles hope softer 2026
% @values hope_softer_2026=Hope_softer_easier_for_2026 unk_reviewer_opinion_snowboardingprofiles_softer=Unknown
% @importance 0.88

0.80::acc(s35, reviewer_opinion_snowboardingprofiles_softer).

0.72::true_val(reviewer_opinion_snowboardingprofiles_softer, hope_softer_2026); 0.28::true_val(reviewer_opinion_snowboardingprofiles_softer, unk_reviewer_opinion_snowboardingprofiles_softer).

measured(s35, reviewer_opinion_snowboardingprofiles_softer, hope_softer_2026).

all_consistent(reviewer_opinion_snowboardingprofiles_softer) :- consistent(s35, reviewer_opinion_snowboardingprofiles_softer).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_softer)).
query(true_val(reviewer_opinion_snowboardingprofiles_softer, hope_softer_2026)).
query(true_val(reviewer_opinion_snowboardingprofiles_softer, unk_reviewer_opinion_snowboardingprofiles_softer)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values confidence_booster=Major_confidence_booster_facilitates_progression unk_reviewer_opinion_whitelines=Unknown
% @importance 0.7

0.75::acc(s37, reviewer_opinion_whitelines).

0.65::true_val(reviewer_opinion_whitelines, confidence_booster); 0.35::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s37, reviewer_opinion_whitelines, confidence_booster).

all_consistent(reviewer_opinion_whitelines) :- consistent(s37, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, confidence_booster)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_carving
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines carving
% @values carved_better_expected=Carved_much_better_than_expected unk_reviewer_opinion_whitelines_carving=Unknown
% @importance 0.7

0.75::acc(s37, reviewer_opinion_whitelines_carving).

0.65::true_val(reviewer_opinion_whitelines_carving, carved_better_expected); 0.35::true_val(reviewer_opinion_whitelines_carving, unk_reviewer_opinion_whitelines_carving).

measured(s37, reviewer_opinion_whitelines_carving, carved_better_expected).

all_consistent(reviewer_opinion_whitelines_carving) :- consistent(s37, reviewer_opinion_whitelines_carving).

evidence(all_consistent(reviewer_opinion_whitelines_carving)).
query(true_val(reviewer_opinion_whitelines_carving, carved_better_expected)).
query(true_val(reviewer_opinion_whitelines_carving, unk_reviewer_opinion_whitelines_carving)).

% @attr user_review_forum_underrated
% @type categorical
% @canonical false
% @original_name user_review_forum underrated board
% @values super_underrated=Super_underrated_forgiving_freestyle_progression unk_user_review_forum_underrated=Unknown
% @importance 0.75

0.55::acc(s38, user_review_forum_underrated).

0.45::true_val(user_review_forum_underrated, super_underrated); 0.55::true_val(user_review_forum_underrated, unk_user_review_forum_underrated).

measured(s38, user_review_forum_underrated, super_underrated).

all_consistent(user_review_forum_underrated) :- consistent(s38, user_review_forum_underrated).

evidence(all_consistent(user_review_forum_underrated)).
query(true_val(user_review_forum_underrated, super_underrated)).
query(true_val(user_review_forum_underrated, unk_user_review_forum_underrated)).

% @attr user_review_forum_versatile
% @type categorical
% @canonical false
% @original_name user_review_forum rigid and playful
% @values rigid_playful=Rigid_enough_rough_terrain_playful_ollies unk_user_review_forum_versatile=Unknown
% @importance 0.7

0.50::acc(s36, user_review_forum_versatile).

0.42::true_val(user_review_forum_versatile, rigid_playful); 0.58::true_val(user_review_forum_versatile, unk_user_review_forum_versatile).

measured(s36, user_review_forum_versatile, rigid_playful).

all_consistent(user_review_forum_versatile) :- consistent(s36, user_review_forum_versatile).

evidence(all_consistent(user_review_forum_versatile)).
query(true_val(user_review_forum_versatile, rigid_playful)).
query(true_val(user_review_forum_versatile, unk_user_review_forum_versatile)).

% @attr user_review_forum
% @type numeric
% @canonical true
% @original_name user_review_forum
% @unit /5
% @values v5_0=5.0 unk_user_review_forum=Unknown
% @importance 0.75

0.55::acc(s11, user_review_forum).

0.45::true_val(user_review_forum, v5_0); 0.55::true_val(user_review_forum, unk_user_review_forum).

measured(s11, user_review_forum, v5_0).

all_consistent(user_review_forum) :-
    (indep(s11), consistent(s11, user_review_forum) ; \+indep(s11)).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, v5_0)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values mercury_inspired=Inspired_by_Mercury_stiffer_sintered_sidecut_bump unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.80::acc(s7, comparable_board_same_brand).

0.72::true_val(comparable_board_same_brand, mercury_inspired); 0.28::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s7, comparable_board_same_brand, mercury_inspired).

all_consistent(comparable_board_same_brand) :- consistent(s7, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, mercury_inspired)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_flex
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand Mercury flex
% @values mercury_6_5_osl_5=Mercury_6_5_vs_OSL_5_out_of_10 unk_comparable_board_same_brand_flex=Unknown
% @importance 0.75

0.55::acc(s38, comparable_board_same_brand_flex).

0.45::true_val(comparable_board_same_brand_flex, mercury_6_5_osl_5); 0.55::true_val(comparable_board_same_brand_flex, unk_comparable_board_same_brand_flex).

measured(s38, comparable_board_same_brand_flex, mercury_6_5_osl_5).

all_consistent(comparable_board_same_brand_flex) :- consistent(s38, comparable_board_same_brand_flex).

evidence(all_consistent(comparable_board_same_brand_flex)).
query(true_val(comparable_board_same_brand_flex, mercury_6_5_osl_5)).
query(true_val(comparable_board_same_brand_flex, unk_comparable_board_same_brand_flex)).

% @attr comparable_board_same_brand_doa
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand DOA comparison
% @values doa_jumps_osl_powder=DOA_better_jumps_pop_highspeed_OSL_better_powder_trees unk_comparable_board_same_brand_doa=Unknown
% @importance 0.88

0.80::acc(s35, comparable_board_same_brand_doa).

0.72::true_val(comparable_board_same_brand_doa, doa_jumps_osl_powder); 0.28::true_val(comparable_board_same_brand_doa, unk_comparable_board_same_brand_doa).

measured(s35, comparable_board_same_brand_doa, doa_jumps_osl_powder).

all_consistent(comparable_board_same_brand_doa) :- consistent(s35, comparable_board_same_brand_doa).

evidence(all_consistent(comparable_board_same_brand_doa)).
query(true_val(comparable_board_same_brand_doa, doa_jumps_osl_powder)).
query(true_val(comparable_board_same_brand_doa, unk_comparable_board_same_brand_doa)).

% @attr comparable_board_same_brand_carving
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand better carving
% @values better_carving_full_camber=Better_for_carving_almost_full_camber unk_comparable_board_same_brand_carving=Unknown
% @importance 0.9

0.85::acc(s17, comparable_board_same_brand_carving).

0.82::true_val(comparable_board_same_brand_carving, better_carving_full_camber); 0.18::true_val(comparable_board_same_brand_carving, unk_comparable_board_same_brand_carving).

measured(s17, comparable_board_same_brand_carving, better_carving_full_camber).

all_consistent(comparable_board_same_brand_carving) :- consistent(s17, comparable_board_same_brand_carving).

evidence(all_consistent(comparable_board_same_brand_carving)).
query(true_val(comparable_board_same_brand_carving, better_carving_full_camber)).
query(true_val(comparable_board_same_brand_carving, unk_comparable_board_same_brand_carving)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values tgr_list=Outsiders_DOA_NS_ProtoTwo_NitroFury_YesGreats_Jibsaw_BoxK unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.82::acc(s2, comparable_board_cross_brand).

0.75::true_val(comparable_board_cross_brand, tgr_list); 0.25::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s2, comparable_board_cross_brand, tgr_list).

all_consistent(comparable_board_cross_brand) :- consistent(s2, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, tgr_list)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand SnowboardingProfiles list
% @values sbp_list=Bataleon_Goliath_LibTech_Terrain_Wrecker_YES_Typo unk_comparable_board_cross_brand_2=Unknown
% @importance 0.88

0.80::acc(s35, comparable_board_cross_brand_2).

0.72::true_val(comparable_board_cross_brand_2, sbp_list); 0.28::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).

measured(s35, comparable_board_cross_brand_2, sbp_list).

all_consistent(comparable_board_cross_brand_2) :- consistent(s35, comparable_board_cross_brand_2).

evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, sbp_list)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

% @attr comparable_board_cross_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand Looria list
% @values looria_list=Salomon_Assassin_Jones_Mountain_Twin unk_comparable_board_cross_brand_3=Unknown
% @importance 0.7

0.50::acc(s36, comparable_board_cross_brand_3).

0.42::true_val(comparable_board_cross_brand_3, looria_list); 0.58::true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3).

measured(s36, comparable_board_cross_brand_3, looria_list).

all_consistent(comparable_board_cross_brand_3) :- consistent(s36, comparable_board_cross_brand_3).

evidence(all_consistent(comparable_board_cross_brand_3)).
query(true_val(comparable_board_cross_brand_3, looria_list)).
query(true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3)).

% @attr comparable_board_cross_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand forum Yes Basic
% @values yes_basic_vs_osl=Yes_Basic_vs_Outerspace_Living unk_comparable_board_cross_brand_4=Unknown
% @importance 0.75

0.55::acc(s38, comparable_board_cross_brand_4).

0.45::true_val(comparable_board_cross_brand_4, yes_basic_vs_osl); 0.55::true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4).

measured(s38, comparable_board_cross_brand_4, yes_basic_vs_osl).

all_consistent(comparable_board_cross_brand_4) :- consistent(s38, comparable_board_cross_brand_4).

evidence(all_consistent(comparable_board_cross_brand_4)).
query(true_val(comparable_board_cross_brand_4, yes_basic_vs_osl)).
query(true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width 154cm
% @unit cm
% @values v25_0=25.0 unk_waist_width_154=Unknown
% @importance 0.9

0.90::acc(s1, waist_width_154).

0.92::true_val(waist_width_154, v25_0); 0.08::true_val(waist_width_154, unk_waist_width_154).

measured(s1, waist_width_154, v25_0).

all_consistent(waist_width_154) :- consistent(s1, waist_width_154).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_0)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name Waist width 156cm
% @unit cm
% @values v25_2=25.2 unk_waist_width_156=Unknown
% @importance 0.9

0.90::acc(s1, waist_width_156).

0.92::true_val(waist_width_156, v25_2); 0.08::true_val(waist_width_156, unk_waist_width_156).

measured(s1, waist_width_156, v25_2).

all_consistent(waist_width_156) :- consistent(s1, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_2)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr waist_width_155w
% @type numeric
% @canonical false
% @original_name Waist width 155W
% @unit cm
% @values v26_0=26.0 unk_waist_width_155w=Unknown
% @importance 0.9

0.90::acc(s1, waist_width_155w).

0.92::true_val(waist_width_155w, v26_0); 0.08::true_val(waist_width_155w, unk_waist_width_155w).

measured(s1, waist_width_155w, v26_0).

all_consistent(waist_width_155w) :- consistent(s1, waist_width_155w).

evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v26_0)).
query(true_val(waist_width_155w, unk_waist_width_155w)).

% @attr sidecut_radius_size
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_9=7.9 unk_sidecut_radius_size=Unknown
% @importance 0.9

0.90::acc(s1, sidecut_radius_size).

0.92::true_val(sidecut_radius_size, v7_9); 0.08::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v7_9).

all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_9)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr effective_edge_156
% @type numeric
% @canonical false
% @original_name Effective edge 156cm
% @unit mm
% @values v1184=1184.0 unk_effective_edge_156=Unknown
% @importance 0.9

0.90::acc(s1, effective_edge_156).

0.92::true_val(effective_edge_156, v1184); 0.08::true_val(effective_edge_156, unk_effective_edge_156).

measured(s1, effective_edge_156, v1184).

all_consistent(effective_edge_156) :- consistent(s1, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1184)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr stance_width_range_size
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit cm
% @values v55_9=55.9 unk_stance_width_range_size=Unknown
% @importance 0.9

0.90::acc(s1, stance_width_range_size).

0.92::true_val(stance_width_range_size, v55_9); 0.08::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, v55_9).

all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v55_9)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values r59_86=59_to_86kg unk_recommended_weight_range_size=Unknown
% @importance 0.9

0.90::acc(s1, recommended_weight_range_size).

0.92::true_val(recommended_weight_range_size, r59_86); 0.08::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, r59_86).

all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r59_86)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_boot_size_156
% @type categorical
% @canonical false
% @original_name Recommended boot size 156
% @values us_8_5_9_5=US_8_5_to_9_5 unk_recommended_boot_size_156=Unknown
% @importance 0.9

0.85::acc(s17, recommended_boot_size_156).

0.82::true_val(recommended_boot_size_156, us_8_5_9_5); 0.18::true_val(recommended_boot_size_156, unk_recommended_boot_size_156).

measured(s17, recommended_boot_size_156, us_8_5_9_5).

all_consistent(recommended_boot_size_156) :- consistent(s17, recommended_boot_size_156).

evidence(all_consistent(recommended_boot_size_156)).
query(true_val(recommended_boot_size_156, us_8_5_9_5)).
query(true_val(recommended_boot_size_156, unk_recommended_boot_size_156)).

% @attr reviewer_opinion_snowboardingprofiles_price
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles lower price
% @values lower_price_typical=Lower_price_than_typical_for_type unk_reviewer_opinion_snowboardingprofiles_price=Unknown
% @importance 0.88

0.80::acc(s35, reviewer_opinion_snowboardingprofiles_price).

0.72::true_val(reviewer_opinion_snowboardingprofiles_price, lower_price_typical); 0.28::true_val(reviewer_opinion_snowboardingprofiles_price, unk_reviewer_opinion_snowboardingprofiles_price).

measured(s35, reviewer_opinion_snowboardingprofiles_price, lower_price_typical).

all_consistent(reviewer_opinion_snowboardingprofiles_price) :- consistent(s35, reviewer_opinion_snowboardingprofiles_price).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_price)).
query(true_val(reviewer_opinion_snowboardingprofiles_price, lower_price_typical)).
query(true_val(reviewer_opinion_snowboardingprofiles_price, unk_reviewer_opinion_snowboardingprofiles_price)).

% @attr positive_aspect_versatile
% @type categorical
% @canonical false
% @original_name positive_aspect versatile terrain
% @values handles_all=Handles_powder_park_groomers_trees unk_positive_aspect_versatile=Unknown
% @importance 1.0

0.90::acc(s1, positive_aspect_versatile).

0.92::true_val(positive_aspect_versatile, handles_all); 0.08::true_val(positive_aspect_versatile, unk_positive_aspect_versatile).

measured(s1, positive_aspect_versatile, handles_all).

all_consistent(positive_aspect_versatile) :- consistent(s1, positive_aspect_versatile).

evidence(all_consistent(positive_aspect_versatile)).
query(true_val(positive_aspect_versatile, handles_all)).
query(true_val(positive_aspect_versatile, unk_positive_aspect_versatile)).

% @attr core_material_flexibility
% @type categorical
% @canonical false
% @original_name core_material flexibility observation
% @values bend_half_no_break=Can_almost_bend_in_half_without_breaking unk_core_material_flexibility=Unknown
% @importance 0.9

0.82::acc(s17, core_material_flexibility).

0.78::true_val(core_material_flexibility, bend_half_no_break); 0.22::true_val(core_material_flexibility, unk_core_material_flexibility).

measured(s17, core_material_flexibility, bend_half_no_break).

all_consistent(core_material_flexibility) :- consistent(s17, core_material_flexibility).

evidence(all_consistent(core_material_flexibility)).
query(true_val(core_material_flexibility, bend_half_no_break)).
query(true_val(core_material_flexibility, unk_core_material_flexibility)).

% @attr negative_aspect_hard_snow
% @type categorical
% @canonical false
% @original_name negative_aspect hard snow conditions
% @values poor_icy_hardpack=Poor_in_icy_hard_snow_east_coast_midwest unk_negative_aspect_hard_snow=Unknown
% @importance 0.9

0.85::acc(s17, negative_aspect_hard_snow).

0.82::true_val(negative_aspect_hard_snow, poor_icy_hardpack); 0.18::true_val(negative_aspect_hard_snow, unk_negative_aspect_hard_snow).

measured(s17, negative_aspect_hard_snow, poor_icy_hardpack).

all_consistent(negative_aspect_hard_snow) :- consistent(s17, negative_aspect_hard_snow).

evidence(all_consistent(negative_aspect_hard_snow)).
query(true_val(negative_aspect_hard_snow, poor_icy_hardpack)).
query(true_val(negative_aspect_hard_snow, unk_negative_aspect_hard_snow)).

% @attr negative_aspect_large_jumps
% @type categorical
% @canonical false
% @original_name negative_aspect large jumps
% @values not_for_large_jumps=Not_recommended_for_large_jumps unk_negative_aspect_large_jumps=Unknown
% @importance 0.85

0.78::acc(s7, negative_aspect_large_jumps).

0.72::true_val(negative_aspect_large_jumps, not_for_large_jumps); 0.28::true_val(negative_aspect_large_jumps, unk_negative_aspect_large_jumps).

measured(s7, negative_aspect_large_jumps, not_for_large_jumps).

all_consistent(negative_aspect_large_jumps) :- consistent(s7, negative_aspect_large_jumps).

evidence(all_consistent(negative_aspect_large_jumps)).
query(true_val(negative_aspect_large_jumps, not_for_large_jumps)).
query(true_val(negative_aspect_large_jumps, unk_negative_aspect_large_jumps)).

% @attr terrain_suitability_conditions
% @type categorical
% @canonical false
% @original_name terrain_suitability optimal conditions
% @values soft_resort_moderate=Softer_conditions_resort_moderate_carving_casual_park unk_terrain_suitability_conditions=Unknown
% @importance 0.9

0.85::acc(s17, terrain_suitability_conditions).

0.82::true_val(terrain_suitability_conditions, soft_resort_moderate); 0.18::true_val(terrain_suitability_conditions, unk_terrain_suitability_conditions).

measured(s17, terrain_suitability_conditions, soft_resort_moderate).

all_consistent(terrain_suitability_conditions) :- consistent(s17, terrain_suitability_conditions).

evidence(all_consistent(terrain_suitability_conditions)).
query(true_val(terrain_suitability_conditions, soft_resort_moderate)).
query(true_val(terrain_suitability_conditions, unk_terrain_suitability_conditions)).