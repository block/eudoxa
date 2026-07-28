0.15::indep(sM).
0.20::indep(s1).
0.30::indep(s2).
0.15::indep(s6).
0.15::indep(s10).
0.20::indep(s20).
0.20::indep(s24).
0.20::indep(s25).
0.15::indep(s29).
0.15::indep(s31).
0.15::indep(s32).
0.15::indep(s33).
0.15::indep(s35).
0.15::indep(s37).
0.15::indep(s38).
0.15::indep(s40).
0.15::indep(s41).
0.15::indep(s42).
0.15::indep(s43).
0.15::indep(s47).
0.15::indep(s56).
0.15::indep(s22).
0.15::indep(s44).
0.15::indep(s45).
0.15::indep(s46).
0.15::indep(s48).
0.15::indep(s49).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.93

0.97::true_val(brand, salomon); 0.03::true_val(brand, unk_brand).

0.90::acc(s1, brand).
0.88::acc(s2, brand).
0.95::acc(sM, brand).

measured(s1, brand, salomon).
measured(s2, brand, salomon).
measured(sM, brand, salomon).

all_consistent(brand) :-
    (indep(s1), consistent(s1, brand) ; \+indep(s1)),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)),
    (indep(sM), consistent(sM, brand) ; \+indep(sM)).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values hps_louif_paradis=HPS_Louif_Paradis unk_model_name=Unknown
% @importance 0.93

0.97::true_val(model_name, hps_louif_paradis); 0.03::true_val(model_name, unk_model_name).

0.90::acc(s1, model_name).
0.88::acc(s2, model_name).
0.95::acc(sM, model_name).

measured(s1, model_name, hps_louif_paradis).
measured(s2, model_name, hps_louif_paradis).
measured(sM, model_name, hps_louif_paradis).

all_consistent(model_name) :-
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)),
    (indep(sM), consistent(sM, model_name) ; \+indep(sM)).

evidence(all_consistent(model_name)).
query(true_val(model_name, hps_louif_paradis)).
query(true_val(model_name, unk_model_name)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values hps=Hillside_Project_Series unk_model_series=Unknown
% @importance 0.55

0.90::true_val(model_series, hps); 0.10::true_val(model_series, unk_model_series).

0.93::acc(s3, model_series).
0.85::acc(s4, model_series).

measured(s3, model_series, hps).
measured(s4, model_series, hps).

all_consistent(model_series) :-
    consistent(s3, model_series),
    consistent(s4, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, hps)).
query(true_val(model_series, unk_model_series)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025=2025 unk_model_year=Unknown
% @importance 0.93

0.97::true_val(model_year, y2025); 0.03::true_val(model_year, unk_model_year).

0.90::acc(s1, model_year).
0.88::acc(s2, model_year).
0.95::acc(sM, model_year).

measured(s1, model_year, y2025).
measured(s2, model_year, y2025).
measured(sM, model_year, y2025).

all_consistent(model_year) :-
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)),
    (indep(s2), consistent(s2, model_year) ; \+indep(s2)),
    (indep(sM), consistent(sM, model_year) ; \+indep(sM)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2025)).
query(true_val(model_year, unk_model_year)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU (159cm)
% @values l47663100=L47663100 unk_sku=Unknown
% @importance 0.85

0.95::true_val(sku, l47663100); 0.05::true_val(sku, unk_sku).

0.95::acc(sM, sku).

measured(sM, sku, l47663100).

all_consistent(sku) :-
    consistent(sM, sku).

evidence(all_consistent(sku)).
query(true_val(sku, l47663100)).
query(true_val(sku, unk_sku)).

% @attr product_type
% @type categorical
% @canonical false
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.95

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

0.90::acc(s1, product_type).
0.88::acc(s2, product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)),
    (indep(s2), consistent(s2, product_type) ; \+indep(s2)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.93

0.97::true_val(board_category, all_mountain_freeride); 0.03::true_val(board_category, unk_board_category).

0.90::acc(s1, board_category).
0.88::acc(s2, board_category).
0.93::acc(sM, board_category).

measured(s1, board_category, all_mountain_freeride).
measured(s2, board_category, all_mountain_freeride).
measured(sM, board_category, all_mountain_freeride).

all_consistent(board_category) :-
    (indep(s1), consistent(s1, board_category) ; \+indep(s1)),
    (indep(s2), consistent(s2, board_category) ; \+indep(s2)),
    (indep(sM), consistent(sM, board_category) ; \+indep(sM)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical false
% @original_name gender
% @values unisex=Unisex mens=Mens
% @importance 0.93

0.55::true_val(gender, unisex); 0.45::true_val(gender, mens).

0.93::acc(s5, gender).
0.75::acc(s6, gender).

measured(s5, gender, unisex).
measured(s6, gender, mens).

all_consistent(gender) :-
    consistent(s5, gender),
    (indep(s6), consistent(s6, gender) ; \+indep(s6)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, mens)).

% @attr manufacturer
% @type categorical
% @canonical false
% @original_name manufacturer
% @values salomon_sas_annecy=Salomon_SAS_Annecy_France unk_manufacturer=Unknown
% @importance 0.43

0.92::true_val(manufacturer, salomon_sas_annecy); 0.08::true_val(manufacturer, unk_manufacturer).

0.88::acc(s7, manufacturer).
0.85::acc(s8, manufacturer).

measured(s7, manufacturer, salomon_sas_annecy).
measured(s8, manufacturer, salomon_sas_annecy).

all_consistent(manufacturer) :-
    consistent(s7, manufacturer),
    consistent(s8, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas_annecy)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports_helsinki=Amer_Sports_Helsinki_Finland unk_parent_company=Unknown
% @importance 0.50

0.88::true_val(parent_company, amer_sports_helsinki); 0.12::true_val(parent_company, unk_parent_company).

0.85::acc(s7, parent_company).

measured(s7, parent_company, amer_sports_helsinki).

all_consistent(parent_company) :-
    consistent(s7, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports_helsinki)).
query(true_val(parent_company, unk_parent_company)).

% @attr amer_sports_ownership
% @type categorical
% @canonical false
% @original_name Amer Sports ownership
% @values anta_sports_since_2018=ANTA_Sports_subsidiary_since_2018 unk_amer_sports_ownership=Unknown
% @importance 0.30

0.85::true_val(amer_sports_ownership, anta_sports_since_2018); 0.15::true_val(amer_sports_ownership, unk_amer_sports_ownership).

0.82::acc(s9, amer_sports_ownership).

measured(s9, amer_sports_ownership, anta_sports_since_2018).

all_consistent(amer_sports_ownership) :-
    consistent(s9, amer_sports_ownership).

evidence(all_consistent(amer_sports_ownership)).
query(true_val(amer_sports_ownership, anta_sports_since_2018)).
query(true_val(amer_sports_ownership, unk_amer_sports_ownership)).

% @attr salomon_founded
% @type categorical
% @canonical false
% @original_name Salomon founded
% @values y1947_french_alps=1947_French_Alps unk_salomon_founded=Unknown
% @importance 0.38

0.90::true_val(salomon_founded, y1947_french_alps); 0.10::true_val(salomon_founded, unk_salomon_founded).

0.85::acc(s7, salomon_founded).
0.70::acc(s10, salomon_founded).

measured(s7, salomon_founded, y1947_french_alps).
measured(s10, salomon_founded, y1947_french_alps).

all_consistent(salomon_founded) :-
    consistent(s7, salomon_founded),
    (indep(s10), consistent(s10, salomon_founded) ; \+indep(s10)).

evidence(all_consistent(salomon_founded)).
query(true_val(salomon_founded, y1947_french_alps)).
query(true_val(salomon_founded, unk_salomon_founded)).

% @attr design_center
% @type categorical
% @canonical false
% @original_name Design center
% @values annecy_france=Salomon_Annecy_Design_Center_France unk_design_center=Unknown
% @importance 0.30

0.88::true_val(design_center, annecy_france); 0.12::true_val(design_center, unk_design_center).

0.88::acc(s11, design_center).

measured(s11, design_center, annecy_france).

all_consistent(design_center) :-
    consistent(s11, design_center).

evidence(all_consistent(design_center)).
query(true_val(design_center, annecy_france)).
query(true_val(design_center, unk_design_center)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values wolle_nyvelt=Wolle_Nyvelt_Mayrhofen_Austria unk_graphic_designer_artist=Unknown
% @importance 0.52

0.92::true_val(graphic_designer_artist, wolle_nyvelt); 0.08::true_val(graphic_designer_artist, unk_graphic_designer_artist).

0.93::acc(s3, graphic_designer_artist).
0.85::acc(s4, graphic_designer_artist).
0.80::acc(s12, graphic_designer_artist).

measured(s3, graphic_designer_artist, wolle_nyvelt).
measured(s4, graphic_designer_artist, wolle_nyvelt).
measured(s12, graphic_designer_artist, wolle_nyvelt).

all_consistent(graphic_designer_artist) :-
    consistent(s3, graphic_designer_artist),
    consistent(s4, graphic_designer_artist),
    consistent(s12, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, wolle_nyvelt)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values louif_paradis=Louif_Paradis unk_pro_rider_name=Unknown
% @importance 0.93

0.97::true_val(pro_rider_name, louif_paradis); 0.03::true_val(pro_rider_name, unk_pro_rider_name).

0.90::acc(s1, pro_rider_name).
0.93::acc(s5, pro_rider_name).
0.93::acc(sM, pro_rider_name).

measured(s1, pro_rider_name, louif_paradis).
measured(s5, pro_rider_name, louif_paradis).
measured(sM, pro_rider_name, louif_paradis).

all_consistent(pro_rider_name) :-
    (indep(s1), consistent(s1, pro_rider_name) ; \+indep(s1)),
    consistent(s5, pro_rider_name),
    (indep(sM), consistent(sM, pro_rider_name) ; \+indep(sM)).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, louif_paradis)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr louif_paradis_nationality
% @type categorical
% @canonical false
% @original_name Louif Paradis nationality
% @values canadian_quebec=Canadian_Quebec_City unk_louif_paradis_nationality=Unknown
% @importance 0.50

0.91::true_val(louif_paradis_nationality, canadian_quebec); 0.09::true_val(louif_paradis_nationality, unk_louif_paradis_nationality).

0.92::acc(s13, louif_paradis_nationality).

measured(s13, louif_paradis_nationality, canadian_quebec).

all_consistent(louif_paradis_nationality) :-
    consistent(s13, louif_paradis_nationality).

evidence(all_consistent(louif_paradis_nationality)).
query(true_val(louif_paradis_nationality, canadian_quebec)).
query(true_val(louif_paradis_nationality, unk_louif_paradis_nationality)).

% @attr louif_paradis_dob
% @type categorical
% @canonical false
% @original_name Louif Paradis date of birth
% @values sep22_1986=Sep_22_1986 born_1987=Born_1987
% @importance 0.35

0.65::true_val(louif_paradis_dob, sep22_1986); 0.35::true_val(louif_paradis_dob, born_1987).

0.92::acc(s13, louif_paradis_dob).
0.65::acc(s14, louif_paradis_dob).

measured(s13, louif_paradis_dob, sep22_1986).
measured(s14, louif_paradis_dob, born_1987).

all_consistent(louif_paradis_dob) :-
    consistent(s13, louif_paradis_dob),
    consistent(s14, louif_paradis_dob).

evidence(all_consistent(louif_paradis_dob)).
query(true_val(louif_paradis_dob, sep22_1986)).
query(true_val(louif_paradis_dob, born_1987)).

% @attr louif_paradis_with_salomon_since
% @type categorical
% @canonical false
% @original_name Louif Paradis with Salomon since
% @values y2009=2009 unk_louif_paradis_with_salomon_since=Unknown
% @importance 0.50

0.91::true_val(louif_paradis_with_salomon_since, y2009); 0.09::true_val(louif_paradis_with_salomon_since, unk_louif_paradis_with_salomon_since).

0.92::acc(s13, louif_paradis_with_salomon_since).

measured(s13, louif_paradis_with_salomon_since, y2009).

all_consistent(louif_paradis_with_salomon_since) :-
    consistent(s13, louif_paradis_with_salomon_since).

evidence(all_consistent(louif_paradis_with_salomon_since)).
query(true_val(louif_paradis_with_salomon_since, y2009)).
query(true_val(louif_paradis_with_salomon_since, unk_louif_paradis_with_salomon_since)).

% @attr louif_paradis_riding_style
% @type categorical
% @canonical false
% @original_name Louif Paradis riding style
% @values hybrid_street_freeride=Hybrid_street_freeride unk_louif_paradis_riding_style=Unknown
% @importance 0.68

0.88::true_val(louif_paradis_riding_style, hybrid_street_freeride); 0.12::true_val(louif_paradis_riding_style, unk_louif_paradis_riding_style).

0.93::acc(s5, louif_paradis_riding_style).
0.78::acc(s15, louif_paradis_riding_style).

measured(s5, louif_paradis_riding_style, hybrid_street_freeride).
measured(s15, louif_paradis_riding_style, hybrid_street_freeride).

all_consistent(louif_paradis_riding_style) :-
    consistent(s5, louif_paradis_riding_style),
    consistent(s15, louif_paradis_riding_style).

evidence(all_consistent(louif_paradis_riding_style)).
query(true_val(louif_paradis_riding_style, hybrid_street_freeride)).
query(true_val(louif_paradis_riding_style, unk_louif_paradis_riding_style)).

% @attr louif_paradis_accolades
% @type categorical
% @canonical false
% @original_name Louif Paradis accolades
% @values xgames_roty_jibber=XGames_Real_Snow_gold_ROTY_Jibber_VPOTY unk_louif_paradis_accolades=Unknown
% @importance 0.38

0.88::true_val(louif_paradis_accolades, xgames_roty_jibber); 0.12::true_val(louif_paradis_accolades, unk_louif_paradis_accolades).

0.82::acc(s16, louif_paradis_accolades).
0.88::acc(s17, louif_paradis_accolades).
0.78::acc(s18, louif_paradis_accolades).

measured(s16, louif_paradis_accolades, xgames_roty_jibber).
measured(s17, louif_paradis_accolades, xgames_roty_jibber).
measured(s18, louif_paradis_accolades, xgames_roty_jibber).

all_consistent(louif_paradis_accolades) :-
    consistent(s16, louif_paradis_accolades),
    consistent(s17, louif_paradis_accolades),
    consistent(s18, louif_paradis_accolades).

evidence(all_consistent(louif_paradis_accolades)).
query(true_val(louif_paradis_accolades, xgames_roty_jibber)).
query(true_val(louif_paradis_accolades, unk_louif_paradis_accolades)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2021_22=2021_2022_season unk_model_first_available_year=Unknown
% @importance 0.75

0.92::true_val(model_first_available_year, season_2021_22); 0.08::true_val(model_first_available_year, unk_model_first_available_year).

0.88::acc(s19, model_first_available_year).
0.85::acc(s20, model_first_available_year).

measured(s19, model_first_available_year, season_2021_22).
measured(s20, model_first_available_year, season_2021_22).

all_consistent(model_first_available_year) :-
    consistent(s19, model_first_available_year),
    (indep(s20), consistent(s20, model_first_available_year) ; \+indep(s20)).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2021_22)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr hps_line_first_available
% @type categorical
% @canonical false
% @original_name HPS line first available
% @values season_2017=2017_season unk_hps_line_first_available=Unknown
% @importance 0.40

0.90::true_val(hps_line_first_available, season_2017); 0.10::true_val(hps_line_first_available, unk_hps_line_first_available).

0.92::acc(s21, hps_line_first_available).

measured(s21, hps_line_first_available, season_2017).

all_consistent(hps_line_first_available) :-
    consistent(s21, hps_line_first_available).

evidence(all_consistent(hps_line_first_available)).
query(true_val(hps_line_first_available, season_2017)).
query(true_val(hps_line_first_available, unk_hps_line_first_available)).

% @attr successor_model
% @type categorical
% @canonical false
% @original_name Successor model
% @values y2026_dir_twin_basalt_flax=2026_Directional_Twin_basalt_flax unk_successor_model=Unknown
% @importance 0.75

0.80::true_val(successor_model, y2026_dir_twin_basalt_flax); 0.20::true_val(successor_model, unk_successor_model).

0.72::acc(s22, successor_model).

measured(s22, successor_model, y2026_dir_twin_basalt_flax).

all_consistent(successor_model) :-
    (indep(s22), consistent(s22, successor_model) ; \+indep(s22)).

evidence(all_consistent(successor_model)).
query(true_val(successor_model, y2026_dir_twin_basalt_flax)).
query(true_val(successor_model, unk_successor_model)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.95

0.97::true_val(shape, tapered_directional); 0.03::true_val(shape, unk_shape).

0.90::acc(s1, shape).
0.95::acc(s5, shape).
0.93::acc(sM, shape).

measured(s1, shape, tapered_directional).
measured(s5, shape, tapered_directional).
measured(sM, shape, tapered_directional).

all_consistent(shape) :-
    (indep(s1), consistent(s1, shape) ; \+indep(s1)),
    consistent(s5, shape),
    (indep(sM), consistent(sM, shape) ; \+indep(sM)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description (2025)
% @values blunt_nose_tail_tapered=Blunt_nose_tail_tapered_design unk_shape_description=Unknown
% @importance 1.00

0.93::true_val(shape_description, blunt_nose_tail_tapered); 0.07::true_val(shape_description, unk_shape_description).

0.90::acc(s1, shape_description).

measured(s1, shape_description, blunt_nose_tail_tapered).

all_consistent(shape_description) :-
    (indep(s1), consistent(s1, shape_description) ; \+indep(s1)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, blunt_nose_tail_tapered)).
query(true_val(shape_description, unk_shape_description)).

% @attr taper
% @type categorical
% @canonical false
% @original_name taper
% @values tapered_2_to_20mm=Tail_tapered_2_to_20mm unk_taper=Unknown
% @importance 1.00

0.93::true_val(taper, tapered_2_to_20mm); 0.07::true_val(taper, unk_taper).

0.90::acc(s1, taper).
0.93::acc(s5, taper).

measured(s1, taper, tapered_2_to_20mm).
measured(s5, taper, tapered_2_to_20mm).

all_consistent(taper) :-
    (indep(s1), consistent(s1, taper) ; \+indep(s1)),
    consistent(s5, taper).

evidence(all_consistent(taper)).
query(true_val(taper, tapered_2_to_20mm)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v20=20.0 unk_setback=Unknown
% @importance 0.85

0.95::true_val(setback, v20); 0.05::true_val(setback, unk_setback).

0.93::acc(sM, setback).

measured(sM, setback, v20).

all_consistent(setback) :-
    consistent(sM, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v20)).
query(true_val(setback, unk_setback)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rock_out_camber=Rock_Out_Camber powder_camber=Powder_Camber
% @importance 0.98

0.80::true_val(camber_type, rock_out_camber); 0.20::true_val(camber_type, powder_camber).

0.90::acc(s1, camber_type).
0.95::acc(s5, camber_type).
0.70::acc(sM, camber_type).

measured(s1, camber_type, rock_out_camber).
measured(s5, camber_type, rock_out_camber).
measured(sM, camber_type, powder_camber).

all_consistent(camber_type) :-
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)),
    consistent(s5, camber_type),
    (indep(sM), consistent(sM, camber_type) ; \+indep(sM)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, rock_out_camber)).
query(true_val(camber_type, powder_camber)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values flat_camber_rocker=Flat_between_bindings_camber_feet_rocker_tips rcr_seven_section=Rocker_Camber_Rocker_seven_section
% @importance 0.92

0.55::true_val(camber_description, flat_camber_rocker); 0.45::true_val(camber_description, rcr_seven_section).

0.92::acc(s1, camber_description).
0.93::acc(s5, camber_description).
0.85::acc(s23, camber_description).

measured(s1, camber_description, flat_camber_rocker).
measured(s5, camber_description, flat_camber_rocker).
measured(s23, camber_description, rcr_seven_section).

all_consistent(camber_description) :-
    (indep(s1), consistent(s1, camber_description) ; \+indep(s1)),
    consistent(s5, camber_description),
    consistent(s23, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_camber_rocker)).
query(true_val(camber_description, rcr_seven_section)).

% @attr nose_tail_design
% @type categorical
% @canonical false
% @original_name Nose/tail design
% @values blunt_nose_tail=Blunt_nose_and_tail unk_nose_tail_design=Unknown
% @importance 1.00

0.93::true_val(nose_tail_design, blunt_nose_tail); 0.07::true_val(nose_tail_design, unk_nose_tail_design).

0.90::acc(s1, nose_tail_design).

measured(s1, nose_tail_design, blunt_nose_tail).

all_consistent(nose_tail_design) :-
    (indep(s1), consistent(s1, nose_tail_design) ; \+indep(s1)).

evidence(all_consistent(nose_tail_design)).
query(true_val(nose_tail_design, blunt_nose_tail)).
query(true_val(nose_tail_design, unk_nose_tail_design)).

% @attr nose_wider_than_tail
% @type numeric
% @unit mm
% @canonical false
% @original_name Nose is approximately 5mm wider than tail across all sizes
% @values v5=5.0 unk_nose_wider_than_tail=Unknown
% @importance 0.83

0.88::true_val(nose_wider_than_tail, v5); 0.12::true_val(nose_wider_than_tail, unk_nose_wider_than_tail).

0.85::acc(s23, nose_wider_than_tail).
0.90::acc(sM, nose_wider_than_tail).

measured(s23, nose_wider_than_tail, v5).
measured(sM, nose_wider_than_tail, v5).

all_consistent(nose_wider_than_tail) :-
    consistent(s23, nose_wider_than_tail),
    (indep(sM), consistent(sM, nose_wider_than_tail) ; \+indep(sM)).

evidence(all_consistent(nose_wider_than_tail)).
query(true_val(nose_wider_than_tail, v5)).
query(true_val(nose_wider_than_tail, unk_nose_wider_than_tail)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values yes_switch=Yes unk_switch_riding=Unknown
% @importance 0.80

0.90::true_val(switch_riding, yes_switch); 0.10::true_val(switch_riding, unk_switch_riding).

0.85::acc(s23, switch_riding).

measured(s23, switch_riding, yes_switch).

all_consistent(switch_riding) :-
    consistent(s23, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, yes_switch)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr flex_rating_10
% @type categorical
% @canonical true
% @original_name flex_rating_10
% @values medium=Medium soft=Soft medium_stiff=Medium_Stiff stiff=Stiff
% @importance 0.90

0.45::true_val(flex_rating_10, medium); 0.15::true_val(flex_rating_10, soft); 0.25::true_val(flex_rating_10, medium_stiff); 0.15::true_val(flex_rating_10, stiff).

0.95::acc(s5, flex_rating_10).
0.65::acc(sM, flex_rating_10).
0.55::acc(s24, flex_rating_10).
0.50::acc(s25, flex_rating_10).

measured(s5, flex_rating_10, medium).
measured(sM, flex_rating_10, soft).
measured(s24, flex_rating_10, medium_stiff).
measured(s25, flex_rating_10, stiff).

all_consistent(flex_rating_10) :-
    consistent(s5, flex_rating_10),
    (indep(sM), consistent(sM, flex_rating_10) ; \+indep(sM)),
    (indep(s24), consistent(s24, flex_rating_10) ; \+indep(s24)),
    (indep(s25), consistent(s25, flex_rating_10) ; \+indep(s25)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, medium)).
query(true_val(flex_rating_10, soft)).
query(true_val(flex_rating_10, medium_stiff)).
query(true_val(flex_rating_10, stiff)).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values playful_underfoot=Playful_underfoot_despite_directional unk_flex_feel=Unknown
% @importance 0.85

0.87::true_val(flex_feel, playful_underfoot); 0.13::true_val(flex_feel, unk_flex_feel).

0.82::acc(s2, flex_feel).
0.82::acc(s26, flex_feel).

measured(s2, flex_feel, playful_underfoot).
measured(s26, flex_feel, playful_underfoot).

all_consistent(flex_feel) :-
    (indep(s2), consistent(s2, flex_feel) ; \+indep(s2)),
    consistent(s26, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, playful_underfoot)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values versatile_groomers_powder_trees=Versatile_great_groomers_powder_trees_perfect_stiffness unk_user_review_forum=Unknown
% @importance 0.85

0.80::true_val(user_review_forum, versatile_groomers_powder_trees); 0.20::true_val(user_review_forum, unk_user_review_forum).

0.70::acc(s27, user_review_forum).

measured(s27, user_review_forum, versatile_groomers_powder_trees).

all_consistent(user_review_forum) :-
    consistent(s27, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, versatile_groomers_powder_trees)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_stiff_playful
% @type categorical
% @canonical false
% @original_name user_review_forum (stiff but playful)
% @values stiff_but_playful=Stiff_but_still_playful_enough_to_butter unk_user_review_forum_stiff_playful=Unknown
% @importance 0.85

0.75::true_val(user_review_forum_stiff_playful, stiff_but_playful); 0.25::true_val(user_review_forum_stiff_playful, unk_user_review_forum_stiff_playful).

0.65::acc(s27, user_review_forum_stiff_playful).

measured(s27, user_review_forum_stiff_playful, stiff_but_playful).

all_consistent(user_review_forum_stiff_playful) :-
    consistent(s27, user_review_forum_stiff_playful).

evidence(all_consistent(user_review_forum_stiff_playful)).
query(true_val(user_review_forum_stiff_playful, stiff_but_playful)).
query(true_val(user_review_forum_stiff_playful, unk_user_review_forum_stiff_playful)).

% @attr user_review_forum_flex_confusion
% @type categorical
% @canonical false
% @original_name user_review_forum (flex confusion)
% @values flex_confusion_noted=Confusion_stiff_rating_vs_responsive_description unk_user_review_forum_flex_confusion=Unknown
% @importance 0.70

0.68::true_val(user_review_forum_flex_confusion, flex_confusion_noted); 0.32::true_val(user_review_forum_flex_confusion, unk_user_review_forum_flex_confusion).

0.55::acc(s28, user_review_forum_flex_confusion).

measured(s28, user_review_forum_flex_confusion, flex_confusion_noted).

all_consistent(user_review_forum_flex_confusion) :-
    consistent(s28, user_review_forum_flex_confusion).

evidence(all_consistent(user_review_forum_flex_confusion)).
query(true_val(user_review_forum_flex_confusion, flex_confusion_noted)).
query(true_val(user_review_forum_flex_confusion, unk_user_review_forum_flex_confusion)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values quadralizer=Quadralizer quadratic_sidecut=Quadratic_Sidecut
% @importance 0.93

0.75::true_val(sidecut_type, quadralizer); 0.25::true_val(sidecut_type, quadratic_sidecut).

0.90::acc(s1, sidecut_type).
0.95::acc(s5, sidecut_type).
0.70::acc(sM, sidecut_type).

measured(s1, sidecut_type, quadralizer).
measured(s5, sidecut_type, quadralizer).
measured(sM, sidecut_type, quadratic_sidecut).

all_consistent(sidecut_type) :-
    (indep(s1), consistent(s1, sidecut_type) ; \+indep(s1)),
    consistent(s5, sidecut_type),
    (indep(sM), consistent(sM, sidecut_type) ; \+indep(sM)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, quadralizer)).
query(true_val(sidecut_type, quadratic_sidecut)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values equalizer_quadratic_combo=Equalizer_Quadratic_combo_high_speed_carving unk_sidecut_description=Unknown
% @importance 1.00

0.93::true_val(sidecut_description, equalizer_quadratic_combo); 0.07::true_val(sidecut_description, unk_sidecut_description).

0.90::acc(s1, sidecut_description).
0.93::acc(s5, sidecut_description).

measured(s1, sidecut_description, equalizer_quadratic_combo).
measured(s5, sidecut_description, equalizer_quadratic_combo).

all_consistent(sidecut_description) :-
    (indep(s1), consistent(s1, sidecut_description) ; \+indep(s1)),
    consistent(s5, sidecut_description).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, equalizer_quadratic_combo)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr available_sizes
% @type categorical
% @canonical false
% @original_name available_sizes
% @values s155_159_163=155_159_163cm unk_available_sizes=Unknown
% @importance 0.93

0.95::true_val(available_sizes, s155_159_163); 0.05::true_val(available_sizes, unk_available_sizes).

0.90::acc(s1, available_sizes).
0.93::acc(sM, available_sizes).

measured(s1, available_sizes, s155_159_163).
measured(sM, available_sizes, s155_159_163).

all_consistent(available_sizes) :-
    (indep(s1), consistent(s1, available_sizes) ; \+indep(s1)),
    (indep(sM), consistent(sM, available_sizes) ; \+indep(sM)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s155_159_163)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr waist_width_155
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 155cm
% @values v255=255.0 unk_waist_width_155=Unknown
% @importance 0.85

0.95::true_val(waist_width_155, v255); 0.05::true_val(waist_width_155, unk_waist_width_155).

0.93::acc(sM, waist_width_155).

measured(sM, waist_width_155, v255).

all_consistent(waist_width_155) :-
    consistent(sM, waist_width_155).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v255)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr waist_width_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 159cm
% @values v258=258.0 unk_waist_width_159=Unknown
% @importance 0.85

0.95::true_val(waist_width_159, v258); 0.05::true_val(waist_width_159, unk_waist_width_159).

0.93::acc(sM, waist_width_159).

measured(sM, waist_width_159, v258).

all_consistent(waist_width_159) :-
    consistent(sM, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v258)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr waist_width_163
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 163cm
% @values v262=262.0 unk_waist_width_163=Unknown
% @importance 0.85

0.95::true_val(waist_width_163, v262); 0.05::true_val(waist_width_163, unk_waist_width_163).

0.93::acc(sM, waist_width_163).

measured(sM, waist_width_163, v262).

all_consistent(waist_width_163) :-
    consistent(sM, waist_width_163).

evidence(all_consistent(waist_width_163)).
query(true_val(waist_width_163, v262)).
query(true_val(waist_width_163, unk_waist_width_163)).

% @attr tip_tail_width_size
% @type categorical
% @unit mm
% @canonical true
% @original_name tip_tail_width_size (155cm)
% @values v302_297=302mm_297mm unk_tip_tail_width_size=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size, v302_297); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

0.93::acc(sM, tip_tail_width_size).

measured(sM, tip_tail_width_size, v302_297).

all_consistent(tip_tail_width_size) :-
    consistent(sM, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v302_297)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_159
% @type categorical
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (159cm)
% @values v307_302=307mm_302mm unk_tip_tail_width_size_159=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_159, v307_302); 0.05::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

0.93::acc(sM, tip_tail_width_size_159).

measured(sM, tip_tail_width_size_159, v307_302).

all_consistent(tip_tail_width_size_159) :-
    consistent(sM, tip_tail_width_size_159).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v307_302)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

% @attr tip_tail_width_size_163
% @type categorical
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (163cm)
% @values v311_306=311mm_306mm unk_tip_tail_width_size_163=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_163, v311_306); 0.05::true_val(tip_tail_width_size_163, unk_tip_tail_width_size_163).

0.93::acc(sM, tip_tail_width_size_163).

measured(sM, tip_tail_width_size_163, v311_306).

all_consistent(tip_tail_width_size_163) :-
    consistent(sM, tip_tail_width_size_163).

evidence(all_consistent(tip_tail_width_size_163)).
query(true_val(tip_tail_width_size_163, v311_306)).
query(true_val(tip_tail_width_size_163, unk_tip_tail_width_size_163)).

% @attr effective_edge_155
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 155cm
% @values v1180=1180.0 unk_effective_edge_155=Unknown
% @importance 0.85

0.95::true_val(effective_edge_155, v1180); 0.05::true_val(effective_edge_155, unk_effective_edge_155).

0.93::acc(sM, effective_edge_155).

measured(sM, effective_edge_155, v1180).

all_consistent(effective_edge_155) :-
    consistent(sM, effective_edge_155).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v1180)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

% @attr effective_edge_159
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 159cm
% @values v1210=1210.0 unk_effective_edge_159=Unknown
% @importance 0.85

0.95::true_val(effective_edge_159, v1210); 0.05::true_val(effective_edge_159, unk_effective_edge_159).

0.93::acc(sM, effective_edge_159).

measured(sM, effective_edge_159, v1210).

all_consistent(effective_edge_159) :-
    consistent(sM, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1210)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr effective_edge_163
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 163cm
% @values v1230=1230.0 unk_effective_edge_163=Unknown
% @importance 0.85

0.95::true_val(effective_edge_163, v1230); 0.05::true_val(effective_edge_163, unk_effective_edge_163).

0.93::acc(sM, effective_edge_163).

measured(sM, effective_edge_163, v1230).

all_consistent(effective_edge_163) :-
    consistent(sM, effective_edge_163).

evidence(all_consistent(effective_edge_163)).
query(true_val(effective_edge_163, v1230)).
query(true_val(effective_edge_163, unk_effective_edge_163)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (155cm)
% @values r60_95=60_to_95_kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size, r60_95); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

0.93::acc(sM, recommended_weight_range_size).

measured(sM, recommended_weight_range_size, r60_95).

all_consistent(recommended_weight_range_size) :-
    consistent(sM, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r60_95)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @values r70_100=70_to_100_kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_159, r70_100); 0.05::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

0.93::acc(sM, recommended_weight_range_size_159).

measured(sM, recommended_weight_range_size_159, r70_100).

all_consistent(recommended_weight_range_size_159) :-
    consistent(sM, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, r70_100)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr recommended_weight_range_size_163
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (163cm)
% @values r70_105=70_to_105_kg unk_recommended_weight_range_size_163=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_163, r70_105); 0.05::true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163).

0.93::acc(sM, recommended_weight_range_size_163).

measured(sM, recommended_weight_range_size_163, r70_105).

all_consistent(recommended_weight_range_size_163) :-
    consistent(sM, recommended_weight_range_size_163).

evidence(all_consistent(recommended_weight_range_size_163)).
query(true_val(recommended_weight_range_size_163, r70_105)).
query(true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values ghost_green_paulownia=Ghost_Green_Core_sustainable_Paulownia unk_core_material=Unknown
% @importance 0.93

0.97::true_val(core_material, ghost_green_paulownia); 0.03::true_val(core_material, unk_core_material).

0.90::acc(s1, core_material).
0.93::acc(s5, core_material).
0.85::acc(s29, core_material).
0.93::acc(sM, core_material).

measured(s1, core_material, ghost_green_paulownia).
measured(s5, core_material, ghost_green_paulownia).
measured(s29, core_material, ghost_green_paulownia).
measured(sM, core_material, ghost_green_paulownia).

all_consistent(core_material) :-
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)),
    consistent(s5, core_material),
    (indep(s29), consistent(s29, core_material) ; \+indep(s29)),
    (indep(sM), consistent(sM, core_material) ; \+indep(sM)).

evidence(all_consistent(core_material)).
query(true_val(core_material, ghost_green_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr core_profiling
% @type categorical
% @canonical false
% @original_name Core profiling
% @values popster=Popster_milled_for_natural_flex unk_core_profiling=Unknown
% @importance 0.85

0.95::true_val(core_profiling, popster); 0.05::true_val(core_profiling, unk_core_profiling).

0.93::acc(s5, core_profiling).
0.78::acc(s6, core_profiling).
0.92::acc(s30, core_profiling).
0.93::acc(sM, core_profiling).

measured(s5, core_profiling, popster).
measured(s6, core_profiling, popster).
measured(s30, core_profiling, popster).
measured(sM, core_profiling, popster).

all_consistent(core_profiling) :-
    consistent(s5, core_profiling),
    (indep(s6), consistent(s6, core_profiling) ; \+indep(s6)),
    consistent(s30, core_profiling),
    (indep(sM), consistent(sM, core_profiling) ; \+indep(sM)).

evidence(all_consistent(core_profiling)).
query(true_val(core_profiling, popster)).
query(true_val(core_profiling, unk_core_profiling)).

% @attr core_milling_description
% @type categorical
% @canonical false
% @original_name Core milling description
% @values thick_center_thin_underfoot_thick_ends=Thick_center_thin_underfoot_thick_nose_tail unk_core_milling_description=Unknown
% @importance 0.85

0.84::true_val(core_milling_description, thick_center_thin_underfoot_thick_ends); 0.16::true_val(core_milling_description, unk_core_milling_description).

0.78::acc(s31, core_milling_description).

measured(s31, core_milling_description, thick_center_thin_underfoot_thick_ends).

all_consistent(core_milling_description) :-
    (indep(s31), consistent(s31, core_milling_description) ; \+indep(s31)).

evidence(all_consistent(core_milling_description)).
query(true_val(core_milling_description, thick_center_thin_underfoot_thick_ends)).
query(true_val(core_milling_description, unk_core_milling_description)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values ba_md_glass=BA_MD_Glass_biaxial_medium_density unk_laminate=Unknown
% @importance 0.80

0.95::true_val(laminate, ba_md_glass); 0.05::true_val(laminate, unk_laminate).

0.78::acc(s6, laminate).
0.80::acc(s32, laminate).
0.93::acc(sM, laminate).

measured(s6, laminate, ba_md_glass).
measured(s32, laminate, ba_md_glass).
measured(sM, laminate, ba_md_glass).

all_consistent(laminate) :-
    (indep(s6), consistent(s6, laminate) ; \+indep(s6)),
    (indep(s32), consistent(s32, laminate) ; \+indep(s32)),
    (indep(sM), consistent(sM, laminate) ; \+indep(sM)).

evidence(all_consistent(laminate)).
query(true_val(laminate, ba_md_glass)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values ghost_carbon_stringers=Ghost_Carbon_Stringers_tip_to_tail unk_construction_material_innovation=Unknown
% @importance 0.85

0.84::true_val(construction_material_innovation, ghost_carbon_stringers); 0.16::true_val(construction_material_innovation, unk_construction_material_innovation).

0.78::acc(s31, construction_material_innovation).

measured(s31, construction_material_innovation, ghost_carbon_stringers).

all_consistent(construction_material_innovation) :-
    (indep(s31), consistent(s31, construction_material_innovation) ; \+indep(s31)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, ghost_carbon_stringers)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values bio_resin_30pct=30pct_Bio_based_Resin unk_resin=Unknown
% @importance 0.73

0.95::true_val(resin, bio_resin_30pct); 0.05::true_val(resin, unk_resin).

0.88::acc(s33, resin).
0.93::acc(sM, resin).

measured(s33, resin, bio_resin_30pct).
measured(sM, resin, bio_resin_30pct).

all_consistent(resin) :-
    (indep(s33), consistent(s33, resin) ; \+indep(s33)),
    (indep(sM), consistent(sM, resin) ; \+indep(sM)).

evidence(all_consistent(resin)).
query(true_val(resin, bio_resin_30pct)).
query(true_val(resin, unk_resin)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs=Recycled_ABS_Sidewalls unk_sidewall_material=Unknown
% @importance 0.85

0.95::true_val(sidewall_material, recycled_abs); 0.05::true_val(sidewall_material, unk_sidewall_material).

0.93::acc(sM, sidewall_material).

measured(sM, sidewall_material, recycled_abs).

all_consistent(sidewall_material) :-
    consistent(sM, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_wrapper
% @type categorical
% @canonical false
% @original_name Sidewall/topsheet wrapper
% @values abc_wrapper_bamboo=ABC_Wrapper_bamboo_veneers_40pct_less unk_sidewall_wrapper=Unknown
% @importance 0.90

0.95::true_val(sidewall_wrapper, abc_wrapper_bamboo); 0.05::true_val(sidewall_wrapper, unk_sidewall_wrapper).

0.93::acc(s5, sidewall_wrapper).
0.78::acc(s6, sidewall_wrapper).
0.95::acc(s34, sidewall_wrapper).
0.93::acc(sM, sidewall_wrapper).

measured(s5, sidewall_wrapper, abc_wrapper_bamboo).
measured(s6, sidewall_wrapper, abc_wrapper_bamboo).
measured(s34, sidewall_wrapper, abc_wrapper_bamboo).
measured(sM, sidewall_wrapper, abc_wrapper_bamboo).

all_consistent(sidewall_wrapper) :-
    consistent(s5, sidewall_wrapper),
    (indep(s6), consistent(s6, sidewall_wrapper) ; \+indep(s6)),
    consistent(s34, sidewall_wrapper),
    (indep(sM), consistent(sM, sidewall_wrapper) ; \+indep(sM)).

evidence(all_consistent(sidewall_wrapper)).
query(true_val(sidewall_wrapper, abc_wrapper_bamboo)).
query(true_val(sidewall_wrapper, unk_sidewall_wrapper)).

% @attr damping_material
% @type categorical
% @canonical false
% @original_name Damping material
% @values bamboo_cork_rails=Bamboo_Cork_Rails unk_damping_material=Unknown
% @importance 0.88

0.90::true_val(damping_material, bamboo_cork_rails); 0.10::true_val(damping_material, unk_damping_material).

0.85::acc(s2, damping_material).
0.85::acc(s35, damping_material).

measured(s2, damping_material, bamboo_cork_rails).
measured(s35, damping_material, bamboo_cork_rails).

all_consistent(damping_material) :-
    (indep(s2), consistent(s2, damping_material) ; \+indep(s2)),
    (indep(s35), consistent(s35, damping_material) ; \+indep(s35)).

evidence(all_consistent(damping_material)).
query(true_val(damping_material, bamboo_cork_rails)).
query(true_val(damping_material, unk_damping_material)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_eg=Sintered_EG_Electra_Gallium unk_base_material=Unknown
% @importance 0.88

0.95::true_val(base_material, sintered_eg); 0.05::true_val(base_material, unk_base_material).

0.85::acc(s2, base_material).
0.85::acc(s35, base_material).
0.93::acc(sM, base_material).

measured(s2, base_material, sintered_eg).
measured(s35, base_material, sintered_eg).
measured(sM, base_material, sintered_eg).

all_consistent(base_material) :-
    (indep(s2), consistent(s2, base_material) ; \+indep(s2)),
    (indep(s35), consistent(s35, base_material) ; \+indep(s35)),
    (indep(sM), consistent(sM, base_material) ; \+indep(sM)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_eg)).
query(true_val(base_material, unk_base_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values recycled_50pct_base=50pct_recycled_sintered_base unk_sustainability_certification=Unknown
% @importance 0.55

0.93::true_val(sustainability_certification, recycled_50pct_base); 0.07::true_val(sustainability_certification, unk_sustainability_certification).

0.93::acc(s36, sustainability_certification).

measured(s36, sustainability_certification, recycled_50pct_base).

all_consistent(sustainability_certification) :-
    consistent(s36, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, recycled_50pct_base)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values fine_stone_finish=Fine_Stone_Finish unk_base_type=Unknown
% @importance 0.83

0.95::true_val(base_type, fine_stone_finish); 0.05::true_val(base_type, unk_base_type).

0.93::acc(s5, base_type).
0.85::acc(s35, base_type).
0.93::acc(sM, base_type).

measured(s5, base_type, fine_stone_finish).
measured(s35, base_type, fine_stone_finish).
measured(sM, base_type, fine_stone_finish).

all_consistent(base_type) :-
    consistent(s5, base_type),
    (indep(s35), consistent(s35, base_type) ; \+indep(s35)),
    (indep(sM), consistent(sM, base_type) ; \+indep(sM)).

evidence(all_consistent(base_type)).
query(true_val(base_type, fine_stone_finish)).
query(true_val(base_type, unk_base_type)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values natural_paraffin_free=Natural_paraffin_free_wax unk_factory_wax=Unknown
% @importance 0.55

0.93::true_val(factory_wax, natural_paraffin_free); 0.07::true_val(factory_wax, unk_factory_wax).

0.93::acc(s36, factory_wax).

measured(s36, factory_wax, natural_paraffin_free).

all_consistent(factory_wax) :-
    consistent(s36, factory_wax).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, natural_paraffin_free)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values am_bevel_1deg_2deg=All_Mountain_1deg_nose_tail_2deg_between_feet unk_edge_bevel_spec=Unknown
% @importance 0.78

0.95::true_val(edge_bevel_spec, am_bevel_1deg_2deg); 0.05::true_val(edge_bevel_spec, unk_edge_bevel_spec).

0.85::acc(s35, edge_bevel_spec).
0.85::acc(s37, edge_bevel_spec).
0.93::acc(sM, edge_bevel_spec).

measured(s35, edge_bevel_spec, am_bevel_1deg_2deg).
measured(s37, edge_bevel_spec, am_bevel_1deg_2deg).
measured(sM, edge_bevel_spec, am_bevel_1deg_2deg).

all_consistent(edge_bevel_spec) :-
    (indep(s35), consistent(s35, edge_bevel_spec) ; \+indep(s35)),
    (indep(s37), consistent(s37, edge_bevel_spec) ; \+indep(s37)),
    (indep(sM), consistent(sM, edge_bevel_spec) ; \+indep(sM)).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, am_bevel_1deg_2deg)).
query(true_val(edge_bevel_spec, unk_edge_bevel_spec)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

0.93::acc(sM, mounting_pattern).

measured(sM, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(sM, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr sustainability_certification_paulownia
% @type categorical
% @canonical false
% @original_name sustainability_certification (paulownia)
% @values paulownia_sustainable=Paulownia_fast_growing_sustainable unk_sustainability_certification_paulownia=Unknown
% @importance 0.90

0.88::true_val(sustainability_certification_paulownia, paulownia_sustainable); 0.12::true_val(sustainability_certification_paulownia, unk_sustainability_certification_paulownia).

0.85::acc(s29, sustainability_certification_paulownia).

measured(s29, sustainability_certification_paulownia, paulownia_sustainable).

all_consistent(sustainability_certification_paulownia) :-
    (indep(s29), consistent(s29, sustainability_certification_paulownia) ; \+indep(s29)).

evidence(all_consistent(sustainability_certification_paulownia)).
query(true_val(sustainability_certification_paulownia, paulownia_sustainable)).
query(true_val(sustainability_certification_paulownia, unk_sustainability_certification_paulownia)).

% @attr sustainability_certification_bio_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification (bio resin)
% @values bio_30pct_plant=30pct_plant_derived_molecular_structure unk_sustainability_certification_bio_resin=Unknown
% @importance 0.60

0.88::true_val(sustainability_certification_bio_resin, bio_30pct_plant); 0.12::true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin).

0.85::acc(s33, sustainability_certification_bio_resin).

measured(s33, sustainability_certification_bio_resin, bio_30pct_plant).

all_consistent(sustainability_certification_bio_resin) :-
    (indep(s33), consistent(s33, sustainability_certification_bio_resin) ; \+indep(s33)).

evidence(all_consistent(sustainability_certification_bio_resin)).
query(true_val(sustainability_certification_bio_resin, bio_30pct_plant)).
query(true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin)).

% @attr sustainability_certification_abc_wrapper
% @type categorical
% @canonical false
% @original_name ABC Wrapper reduces fiberglass and resin by 40%
% @values abc_40pct_reduction=ABC_Wrapper_reduces_fiberglass_resin_40pct unk_sustainability_certification_abc_wrapper=Unknown
% @importance 0.75

0.93::true_val(sustainability_certification_abc_wrapper, abc_40pct_reduction); 0.07::true_val(sustainability_certification_abc_wrapper, unk_sustainability_certification_abc_wrapper).

0.93::acc(s34, sustainability_certification_abc_wrapper).

measured(s34, sustainability_certification_abc_wrapper, abc_40pct_reduction).

all_consistent(sustainability_certification_abc_wrapper) :-
    consistent(s34, sustainability_certification_abc_wrapper).

evidence(all_consistent(sustainability_certification_abc_wrapper)).
query(true_val(sustainability_certification_abc_wrapper, abc_40pct_reduction)).
query(true_val(sustainability_certification_abc_wrapper, unk_sustainability_certification_abc_wrapper)).

% @attr sustainability_certification_recycled_abs
% @type categorical
% @canonical false
% @original_name Recycled ABS sidewalls (sustainability)
% @values recycled_abs_sw=Recycled_ABS_sidewalls unk_sustainability_certification_recycled_abs=Unknown
% @importance 0.85

0.95::true_val(sustainability_certification_recycled_abs, recycled_abs_sw); 0.05::true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs).

0.93::acc(sM, sustainability_certification_recycled_abs).

measured(sM, sustainability_certification_recycled_abs, recycled_abs_sw).

all_consistent(sustainability_certification_recycled_abs) :-
    consistent(sM, sustainability_certification_recycled_abs).

evidence(all_consistent(sustainability_certification_recycled_abs)).
query(true_val(sustainability_certification_recycled_abs, recycled_abs_sw)).
query(true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs)).

% @attr sustainability_certification_natural_wax
% @type categorical
% @canonical false
% @original_name Natural (paraffin-free) factory wax (sustainability)
% @values nat_wax=Natural_paraffin_free_factory_wax unk_sustainability_certification_natural_wax=Unknown
% @importance 0.55

0.93::true_val(sustainability_certification_natural_wax, nat_wax); 0.07::true_val(sustainability_certification_natural_wax, unk_sustainability_certification_natural_wax).

0.93::acc(s36, sustainability_certification_natural_wax).

measured(s36, sustainability_certification_natural_wax, nat_wax).

all_consistent(sustainability_certification_natural_wax) :-
    consistent(s36, sustainability_certification_natural_wax).

evidence(all_consistent(sustainability_certification_natural_wax)).
query(true_val(sustainability_certification_natural_wax, nat_wax)).
query(true_val(sustainability_certification_natural_wax, unk_sustainability_certification_natural_wax)).

% @attr sustainability_certification_fsc_2026
% @type categorical
% @canonical false
% @original_name 2026 successor adds FSC-certified core
% @values fsc_certified_2026=FSC_certified_core_2026 unk_sustainability_certification_fsc_2026=Unknown
% @importance 0.75

0.78::true_val(sustainability_certification_fsc_2026, fsc_certified_2026); 0.22::true_val(sustainability_certification_fsc_2026, unk_sustainability_certification_fsc_2026).

0.72::acc(s22, sustainability_certification_fsc_2026).

measured(s22, sustainability_certification_fsc_2026, fsc_certified_2026).

all_consistent(sustainability_certification_fsc_2026) :-
    (indep(s22), consistent(s22, sustainability_certification_fsc_2026) ; \+indep(s22)).

evidence(all_consistent(sustainability_certification_fsc_2026)).
query(true_val(sustainability_certification_fsc_2026, fsc_certified_2026)).
query(true_val(sustainability_certification_fsc_2026, unk_sustainability_certification_fsc_2026)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_freeride_deep_freestyle=Powder_Freeride_Deep_Freestyle unk_terrain_suitability=Unknown
% @importance 0.85

0.95::true_val(terrain_suitability, powder_freeride_deep_freestyle); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

0.93::acc(sM, terrain_suitability).

measured(sM, terrain_suitability, powder_freeride_deep_freestyle).

all_consistent(terrain_suitability) :-
    consistent(sM, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_freeride_deep_freestyle)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_freeride_surfy=Freestyle_Freeride_hybrid_surfier unk_riding_style=Unknown
% @importance 0.93

0.95::true_val(riding_style, freestyle_freeride_surfy); 0.05::true_val(riding_style, unk_riding_style).

0.93::acc(s5, riding_style).
0.93::acc(sM, riding_style).

measured(s5, riding_style, freestyle_freeride_surfy).
measured(sM, riding_style, freestyle_freeride_surfy).

all_consistent(riding_style) :-
    consistent(s5, riding_style),
    (indep(sM), consistent(sM, riding_style) ; \+indep(sM)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_freeride_surfy)).
query(true_val(riding_style, unk_riding_style)).

% @attr board_designed_for
% @type categorical
% @canonical false
% @original_name Board designed for
% @values freestyle_tactics_deep_terrain=Freestyle_tactics_in_deep_terrain unk_board_designed_for=Unknown
% @importance 1.00

0.93::true_val(board_designed_for, freestyle_tactics_deep_terrain); 0.07::true_val(board_designed_for, unk_board_designed_for).

0.93::acc(s5, board_designed_for).

measured(s5, board_designed_for, freestyle_tactics_deep_terrain).

all_consistent(board_designed_for) :-
    consistent(s5, board_designed_for).

evidence(all_consistent(board_designed_for)).
query(true_val(board_designed_for, freestyle_tactics_deep_terrain)).
query(true_val(board_designed_for, unk_board_designed_for)).

% @attr float
% @type categorical
% @canonical false
% @original_name Float
% @values excellent=Excellent_float_deep_snow unk_float=Unknown
% @importance 0.95

0.92::true_val(float, excellent); 0.08::true_val(float, unk_float).

0.85::acc(s2, float).
0.93::acc(s5, float).

measured(s2, float, excellent).
measured(s5, float, excellent).

all_consistent(float) :-
    (indep(s2), consistent(s2, float) ; \+indep(s2)),
    consistent(s5, float).

evidence(all_consistent(float)).
query(true_val(float, excellent)).
query(true_val(float, unk_float)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values high=High_pop_explosive unk_pop=Unknown
% @importance 0.90

0.90::true_val(pop, high); 0.10::true_val(pop, unk_pop).

0.85::acc(s2, pop).
0.78::acc(s6, pop).

measured(s2, pop, high).
measured(s6, pop, high).

all_consistent(pop) :-
    (indep(s2), consistent(s2, pop) ; \+indep(s2)),
    (indep(s6), consistent(s6, pop) ; \+indep(s6)).

evidence(all_consistent(pop)).
query(true_val(pop, high)).
query(true_val(pop, unk_pop)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values strong=Strong_edge_hold unk_edge_hold=Unknown
% @importance 0.85

0.85::true_val(edge_hold, strong); 0.15::true_val(edge_hold, unk_edge_hold).

0.78::acc(s6, edge_hold).

measured(s6, edge_hold, strong).

all_consistent(edge_hold) :-
    (indep(s6), consistent(s6, edge_hold) ; \+indep(s6)).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, strong)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr dampening
% @type categorical
% @canonical false
% @original_name Dampening
% @values good_bamboo_cork=Good_bamboo_cork_absorb_chatter unk_dampening=Unknown
% @importance 0.90

0.87::true_val(dampening, good_bamboo_cork); 0.13::true_val(dampening, unk_dampening).

0.85::acc(s2, dampening).

measured(s2, dampening, good_bamboo_cork).

all_consistent(dampening) :-
    (indep(s2), consistent(s2, dampening) ; \+indep(s2)).

evidence(all_consistent(dampening)).
query(true_val(dampening, good_bamboo_cork)).
query(true_val(dampening, unk_dampening)).

% @attr stability
% @type categorical
% @canonical false
% @original_name Stability
% @values good_at_speed=Good_at_speed_camber_carbon unk_stability=Unknown
% @importance 0.85

0.85::true_val(stability, good_at_speed); 0.15::true_val(stability, unk_stability).

0.78::acc(s31, stability).
0.78::acc(s6, stability).

measured(s31, stability, good_at_speed).
measured(s6, stability, good_at_speed).

all_consistent(stability) :-
    (indep(s31), consistent(s31, stability) ; \+indep(s31)),
    (indep(s6), consistent(s6, stability) ; \+indep(s6)).

evidence(all_consistent(stability)).
query(true_val(stability, good_at_speed)).
query(true_val(stability, unk_stability)).

% @attr responsiveness
% @type categorical
% @canonical false
% @original_name Responsiveness
% @values hyper_responsive=Hyper_responsive_control unk_responsiveness=Unknown
% @importance 0.85

0.82::true_val(responsiveness, hyper_responsive); 0.18::true_val(responsiveness, unk_responsiveness).

0.78::acc(s6, responsiveness).

measured(s6, responsiveness, hyper_responsive).

all_consistent(responsiveness) :-
    (indep(s6), consistent(s6, responsiveness) ; \+indep(s6)).

evidence(all_consistent(responsiveness)).
query(true_val(responsiveness, hyper_responsive)).
query(true_val(responsiveness, unk_responsiveness)).

% @attr carving
% @type categorical
% @canonical false
% @original_name Carving
% @values high_speed_edge_control=High_speed_carving_edge_control_tight_spots unk_carving=Unknown
% @importance 1.00

0.93::true_val(carving, high_speed_edge_control); 0.07::true_val(carving, unk_carving).

0.90::acc(s1, carving).
0.93::acc(s5, carving).

measured(s1, carving, high_speed_edge_control).
measured(s5, carving, high_speed_edge_control).

all_consistent(carving) :-
    (indep(s1), consistent(s1, carving) ; \+indep(s1)),
    consistent(s5, carving).

evidence(all_consistent(carving)).
query(true_val(carving, high_speed_edge_control)).
query(true_val(carving, unk_carving)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values easy=Easy_turn_initiation unk_turn_initiation_performance=Unknown
% @importance 0.80

0.80::true_val(turn_initiation_performance, easy); 0.20::true_val(turn_initiation_performance, unk_turn_initiation_performance).

0.68::acc(s38, turn_initiation_performance).

measured(s38, turn_initiation_performance, easy).

all_consistent(turn_initiation_performance) :-
    (indep(s38), consistent(s38, turn_initiation_performance) ; \+indep(s38)).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, easy)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr versatility
% @type categorical
% @canonical false
% @original_name Versatility
% @values groomers_powder_trees=Performs_well_groomers_powder_trees unk_versatility=Unknown
% @importance 0.80

0.82::true_val(versatility, groomers_powder_trees); 0.18::true_val(versatility, unk_versatility).

0.72::acc(s39, versatility).

measured(s39, versatility, groomers_powder_trees).

all_consistent(versatility) :-
    consistent(s39, versatility).

evidence(all_consistent(versatility)).
query(true_val(versatility, groomers_powder_trees)).
query(true_val(versatility, unk_versatility)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values expert=Expert unk_rider_level=Unknown
% @importance 1.00

0.93::true_val(rider_level, expert); 0.07::true_val(rider_level, unk_rider_level).

0.95::acc(s5, rider_level).

measured(s5, rider_level, expert).

all_consistent(rider_level) :-
    consistent(s5, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_Expert intermediate_advanced=Intermediate_Advanced advanced_desc=Advanced_stability_precision_playful
% @importance 0.91

0.45::true_val(skill_level_recommendation, advanced_expert); 0.35::true_val(skill_level_recommendation, intermediate_advanced); 0.20::true_val(skill_level_recommendation, advanced_desc).

0.88::acc(s1, skill_level_recommendation).
0.70::acc(sM, skill_level_recommendation).
0.82::acc(s2, skill_level_recommendation).

measured(s1, skill_level_recommendation, advanced_expert).
measured(sM, skill_level_recommendation, intermediate_advanced).
measured(s2, skill_level_recommendation, advanced_desc).

all_consistent(skill_level_recommendation) :-
    (indep(s1), consistent(s1, skill_level_recommendation) ; \+indep(s1)),
    (indep(sM), consistent(sM, skill_level_recommendation) ; \+indep(sM)),
    (indep(s2), consistent(s2, skill_level_recommendation) ; \+indep(s2)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, advanced_desc)).

% @attr terrain_suitability_big_mountain
% @type categorical
% @canonical false
% @original_name terrain_suitability (big mountain)
% @values big_mountain_freestyle_street=Big_mountain_deep_snow_freestyle_street_hybrid unk_terrain_suitability_big_mountain=Unknown
% @importance 0.78

0.85::true_val(terrain_suitability_big_mountain, big_mountain_freestyle_street); 0.15::true_val(terrain_suitability_big_mountain, unk_terrain_suitability_big_mountain).

0.78::acc(s6, terrain_suitability_big_mountain).
0.78::acc(s15, terrain_suitability_big_mountain).

measured(s6, terrain_suitability_big_mountain, big_mountain_freestyle_street).
measured(s15, terrain_suitability_big_mountain, big_mountain_freestyle_street).

all_consistent(terrain_suitability_big_mountain) :-
    (indep(s6), consistent(s6, terrain_suitability_big_mountain) ; \+indep(s6)),
    consistent(s15, terrain_suitability_big_mountain).

evidence(all_consistent(terrain_suitability_big_mountain)).
query(true_val(terrain_suitability_big_mountain, big_mountain_freestyle_street)).
query(true_val(terrain_suitability_big_mountain, unk_terrain_suitability_big_mountain)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v664_99=664.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v664_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

0.95::acc(sM, price_aud_merchant).

measured(sM, price_aud_merchant, v664_99).

all_consistent(price_aud_merchant) :-
    consistent(sM, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v664_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_eur_milo_sport
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price at Milo Sport (SLC)
% @values v467_95=467.95 unk_price_eur_milo_sport=Unknown
% @importance 0.85

0.88::true_val(price_eur_milo_sport, v467_95); 0.12::true_val(price_eur_milo_sport, unk_price_eur_milo_sport).

0.80::acc(s40, price_eur_milo_sport).

measured(s40, price_eur_milo_sport, v467_95).

all_consistent(price_eur_milo_sport) :-
    (indep(s40), consistent(s40, price_eur_milo_sport) ; \+indep(s40)).

evidence(all_consistent(price_eur_milo_sport)).
query(true_val(price_eur_milo_sport, v467_95)).
query(true_val(price_eur_milo_sport, unk_price_eur_milo_sport)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @values v445_41=445.41 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.70

0.79::true_val(price_gbp_blue_tomato_uk, v445_41); 0.21::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

0.72::acc(s41, price_gbp_blue_tomato_uk).

measured(s41, price_gbp_blue_tomato_uk, v445_41).

all_consistent(price_gbp_blue_tomato_uk) :-
    (indep(s41), consistent(s41, price_gbp_blue_tomato_uk) ; \+indep(s41)).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v445_41)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values all_2025_sold_out=All_2025_sizes_sold_out unk_availability_status=Unknown
% @importance 0.70

0.82::true_val(availability_status, all_2025_sold_out); 0.18::true_val(availability_status, unk_availability_status).

0.72::acc(s42, availability_status).

measured(s42, availability_status, all_2025_sold_out).

all_consistent(availability_status) :-
    (indep(s42), consistent(s42, availability_status) ; \+indep(s42)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, all_2025_sold_out)).
query(true_val(availability_status, unk_availability_status)).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v631_96=631.96 unk_price_cad_prfo=Unknown
% @importance 0.80

0.82::true_val(price_cad_prfo, v631_96); 0.18::true_val(price_cad_prfo, unk_price_cad_prfo).

0.75::acc(s43, price_cad_prfo).

measured(s43, price_cad_prfo, v631_96).

all_consistent(price_cad_prfo) :-
    (indep(s43), consistent(s43, price_cad_prfo) ; \+indep(s43)).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v631_96)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo.com)
% @values available_evo=Available_evo unk_availability_status_evo=Unknown
% @importance 1.00

0.90::true_val(availability_status_evo, available_evo); 0.10::true_val(availability_status_evo, unk_availability_status_evo).

0.85::acc(s1, availability_status_evo).

measured(s1, availability_status_evo, available_evo).

all_consistent(availability_status_evo) :-
    (indep(s1), consistent(s1, availability_status_evo) ; \+indep(s1)).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available_evo)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status (Backcountry.com)
% @values available_backcountry=Available_Backcountry unk_availability_status_backcountry=Unknown
% @importance 0.90

0.87::true_val(availability_status_backcountry, available_backcountry); 0.13::true_val(availability_status_backcountry, unk_availability_status_backcountry).

0.82::acc(s2, availability_status_backcountry).

measured(s2, availability_status_backcountry, available_backcountry).

all_consistent(availability_status_backcountry) :-
    (indep(s2), consistent(s2, availability_status_backcountry) ; \+indep(s2)).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available_backcountry)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status_steep_cheap
% @type categorical
% @canonical false
% @original_name availability_status (Steep and Cheap)
% @values available_steep_cheap=Available_Steep_Cheap unk_availability_status_steep_cheap=Unknown
% @importance 0.65

0.80::true_val(availability_status_steep_cheap, available_steep_cheap); 0.20::true_val(availability_status_steep_cheap, unk_availability_status_steep_cheap).

0.75::acc(s44, availability_status_steep_cheap).

measured(s44, availability_status_steep_cheap, available_steep_cheap).

all_consistent(availability_status_steep_cheap) :-
    (indep(s44), consistent(s44, availability_status_steep_cheap) ; \+indep(s44)).

evidence(all_consistent(availability_status_steep_cheap)).
query(true_val(availability_status_steep_cheap, available_steep_cheap)).
query(true_val(availability_status_steep_cheap, unk_availability_status_steep_cheap)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (Tactics)
% @values no_longer_listed=2025_no_longer_listed_2026_available unk_availability_status_tactics=Unknown
% @importance 0.65

0.78::true_val(availability_status_tactics, no_longer_listed); 0.22::true_val(availability_status_tactics, unk_availability_status_tactics).

0.75::acc(s45, availability_status_tactics).

measured(s45, availability_status_tactics, no_longer_listed).

all_consistent(availability_status_tactics) :-
    (indep(s45), consistent(s45, availability_status_tactics) ; \+indep(s45)).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, no_longer_listed)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_milo_sport
% @type categorical
% @canonical false
% @original_name availability_status (Milo Sport)
% @values available_milo=Available_Milo_Sport unk_availability_status_milo_sport=Unknown
% @importance 0.85

0.83::true_val(availability_status_milo_sport, available_milo); 0.17::true_val(availability_status_milo_sport, unk_availability_status_milo_sport).

0.75::acc(s40, availability_status_milo_sport).

measured(s40, availability_status_milo_sport, available_milo).

all_consistent(availability_status_milo_sport) :-
    (indep(s40), consistent(s40, availability_status_milo_sport) ; \+indep(s40)).

evidence(all_consistent(availability_status_milo_sport)).
query(true_val(availability_status_milo_sport, available_milo)).
query(true_val(availability_status_milo_sport, unk_availability_status_milo_sport)).

% @attr availability_status_boyne_country
% @type categorical
% @canonical false
% @original_name availability_status (Boyne Country Sports)
% @values available_boyne=Available_Boyne_Country unk_availability_status_boyne_country=Unknown
% @importance 0.85

0.82::true_val(availability_status_boyne_country, available_boyne); 0.18::true_val(availability_status_boyne_country, unk_availability_status_boyne_country).

0.75::acc(s6, availability_status_boyne_country).

measured(s6, availability_status_boyne_country, available_boyne).

all_consistent(availability_status_boyne_country) :-
    (indep(s6), consistent(s6, availability_status_boyne_country) ; \+indep(s6)).

evidence(all_consistent(availability_status_boyne_country)).
query(true_val(availability_status_boyne_country, available_boyne)).
query(true_val(availability_status_boyne_country, unk_availability_status_boyne_country)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status (Amazon)
% @values available_amazon=Available_Amazon unk_availability_status_amazon=Unknown
% @importance 0.60

0.78::true_val(availability_status_amazon, available_amazon); 0.22::true_val(availability_status_amazon, unk_availability_status_amazon).

0.70::acc(s46, availability_status_amazon).

measured(s46, availability_status_amazon, available_amazon).

all_consistent(availability_status_amazon) :-
    (indep(s46), consistent(s46, availability_status_amazon) ; \+indep(s46)).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, available_amazon)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr availability_status_glisshop
% @type categorical
% @canonical false
% @original_name availability_status (Glisshop UK)
% @values available_glisshop=Available_Glisshop_UK unk_availability_status_glisshop=Unknown
% @importance 0.70

0.77::true_val(availability_status_glisshop, available_glisshop); 0.23::true_val(availability_status_glisshop, unk_availability_status_glisshop).

0.68::acc(s41, availability_status_glisshop).

measured(s41, availability_status_glisshop, available_glisshop).

all_consistent(availability_status_glisshop) :-
    (indep(s41), consistent(s41, availability_status_glisshop) ; \+indep(s41)).

evidence(all_consistent(availability_status_glisshop)).
query(true_val(availability_status_glisshop, available_glisshop)).
query(true_val(availability_status_glisshop, unk_availability_status_glisshop)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values available_blauer=Available_Blauer_Board_Shop unk_availability_status_blauer=Unknown
% @importance 0.85

0.78::true_val(availability_status_blauer, available_blauer); 0.22::true_val(availability_status_blauer, unk_availability_status_blauer).

0.70::acc(s24, availability_status_blauer).

measured(s24, availability_status_blauer, available_blauer).

all_consistent(availability_status_blauer) :-
    (indep(s24), consistent(s24, availability_status_blauer) ; \+indep(s24)).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_blauer)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_salomon
% @type categorical
% @canonical false
% @original_name availability_status (Salomon.com)
% @values available_salomon_direct=Available_Salomon_direct unk_availability_status_salomon=Unknown
% @importance 1.00

0.93::true_val(availability_status_salomon, available_salomon_direct); 0.07::true_val(availability_status_salomon, unk_availability_status_salomon).

0.93::acc(s5, availability_status_salomon).

measured(s5, availability_status_salomon, available_salomon_direct).

all_consistent(availability_status_salomon) :-
    consistent(s5, availability_status_salomon).

evidence(all_consistent(availability_status_salomon)).
query(true_val(availability_status_salomon, available_salomon_direct)).
query(true_val(availability_status_salomon, unk_availability_status_salomon)).

% @attr availability_status_christy
% @type categorical
% @canonical false
% @original_name availability_status (Christy Sports)
% @values available_christy=Available_Christy_Sports unk_availability_status_christy=Unknown
% @importance 0.65

0.80::true_val(availability_status_christy, available_christy); 0.20::true_val(availability_status_christy, unk_availability_status_christy).

0.75::acc(s47, availability_status_christy).

measured(s47, availability_status_christy, available_christy).

all_consistent(availability_status_christy) :-
    (indep(s47), consistent(s47, availability_status_christy) ; \+indep(s47)).

evidence(all_consistent(availability_status_christy)).
query(true_val(availability_status_christy, available_christy)).
query(true_val(availability_status_christy, unk_availability_status_christy)).

% @attr availability_status_bluezone
% @type categorical
% @canonical false
% @original_name availability_status (BlueZone Sports)
% @values available_bluezone=Available_BlueZone_Sports unk_availability_status_bluezone=Unknown
% @importance 0.55

0.76::true_val(availability_status_bluezone, available_bluezone); 0.24::true_val(availability_status_bluezone, unk_availability_status_bluezone).

0.68::acc(s48, availability_status_bluezone).

measured(s48, availability_status_bluezone, available_bluezone).

all_consistent(availability_status_bluezone) :-
    (indep(s48), consistent(s48, availability_status_bluezone) ; \+indep(s48)).

evidence(all_consistent(availability_status_bluezone)).
query(true_val(availability_status_bluezone, available_bluezone)).
query(true_val(availability_status_bluezone, unk_availability_status_bluezone)).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.70

0.80::true_val(warranty_period_years, v2); 0.20::true_val(warranty_period_years, unk_warranty_period_years).

0.68::acc(s49, warranty_period_years).

measured(s49, warranty_period_years, v2).

all_consistent(warranty_period_years) :-
    (indep(s49), consistent(s49, warranty_period_years) ; \+indep(s49)).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values top_100_selection=Selected_top_100_snowboard_products unk_reviewer_opinion_whitelines=Unknown
% @importance 0.80

0.88::true_val(reviewer_opinion_whitelines, top_100_selection); 0.12::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

0.85::acc(s19, reviewer_opinion_whitelines).

measured(s19, reviewer_opinion_whitelines, top_100_selection).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s19, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, top_100_selection)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_proof
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (powder proof)
% @values not_all_powder_pointy=Proof_not_all_powder_boards_pointy unk_reviewer_opinion_whitelines_proof=Unknown
% @importance 0.80

0.88::true_val(reviewer_opinion_whitelines_proof, not_all_powder_pointy); 0.12::true_val(reviewer_opinion_whitelines_proof, unk_reviewer_opinion_whitelines_proof).

0.85::acc(s19, reviewer_opinion_whitelines_proof).

measured(s19, reviewer_opinion_whitelines_proof, not_all_powder_pointy).

all_consistent(reviewer_opinion_whitelines_proof) :-
    consistent(s19, reviewer_opinion_whitelines_proof).

evidence(all_consistent(reviewer_opinion_whitelines_proof)).
query(true_val(reviewer_opinion_whitelines_proof, not_all_powder_pointy)).
query(true_val(reviewer_opinion_whitelines_proof, unk_reviewer_opinion_whitelines_proof)).

% @attr reviewer_opinion_whitelines_freestyle
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (freestyle focus)
% @values time_right_freestyle=Time_right_for_freestyle_focused_model unk_reviewer_opinion_whitelines_freestyle=Unknown
% @importance 0.80

0.88::true_val(reviewer_opinion_whitelines_freestyle, time_right_freestyle); 0.12::true_val(reviewer_opinion_whitelines_freestyle, unk_reviewer_opinion_whitelines_freestyle).

0.85::acc(s19, reviewer_opinion_whitelines_freestyle).

measured(s19, reviewer_opinion_whitelines_freestyle, time_right_freestyle).

all_consistent(reviewer_opinion_whitelines_freestyle) :-
    consistent(s19, reviewer_opinion_whitelines_freestyle).

evidence(all_consistent(reviewer_opinion_whitelines_freestyle)).
query(true_val(reviewer_opinion_whitelines_freestyle, time_right_freestyle)).
query(true_val(reviewer_opinion_whitelines_freestyle, unk_reviewer_opinion_whitelines_freestyle)).

% @attr user_review_forum_aggregate
% @type categorical
% @canonical false
% @original_name user_review_forum (aggregate praise)
% @values high_praise_versatile=High_praise_versatile_groomers_powder_trees unk_user_review_forum_aggregate=Unknown
% @importance 0.80

0.80::true_val(user_review_forum_aggregate, high_praise_versatile); 0.20::true_val(user_review_forum_aggregate, unk_user_review_forum_aggregate).

0.72::acc(s39, user_review_forum_aggregate).

measured(s39, user_review_forum_aggregate, high_praise_versatile).

all_consistent(user_review_forum_aggregate) :-
    consistent(s39, user_review_forum_aggregate).

evidence(all_consistent(user_review_forum_aggregate)).
query(true_val(user_review_forum_aggregate, high_praise_versatile)).
query(true_val(user_review_forum_aggregate, unk_user_review_forum_aggregate)).

% @attr user_review_forum_balanced
% @type categorical
% @canonical false
% @original_name user_review_forum (balanced dimensions)
% @values balanced_fun_strong=Dimension_ratios_flex_well_balanced_fun_strong unk_user_review_forum_balanced=Unknown
% @importance 0.80

0.80::true_val(user_review_forum_balanced, balanced_fun_strong); 0.20::true_val(user_review_forum_balanced, unk_user_review_forum_balanced).

0.72::acc(s39, user_review_forum_balanced).

measured(s39, user_review_forum_balanced, balanced_fun_strong).

all_consistent(user_review_forum_balanced) :-
    consistent(s39, user_review_forum_balanced).

evidence(all_consistent(user_review_forum_balanced)).
query(true_val(user_review_forum_balanced, balanced_fun_strong)).
query(true_val(user_review_forum_balanced, unk_user_review_forum_balanced)).

% @attr user_review_forum_design
% @type categorical
% @canonical false
% @original_name user_review_forum (design comments)
% @values understated_classy=Understated_classy_design_positive unk_user_review_forum_design=Unknown
% @importance 0.80

0.80::true_val(user_review_forum_design, understated_classy); 0.20::true_val(user_review_forum_design, unk_user_review_forum_design).

0.72::acc(s39, user_review_forum_design).

measured(s39, user_review_forum_design, understated_classy).

all_consistent(user_review_forum_design) :-
    consistent(s39, user_review_forum_design).

evidence(all_consistent(user_review_forum_design)).
query(true_val(user_review_forum_design, understated_classy)).
query(true_val(user_review_forum_design, unk_user_review_forum_design)).

% @attr user_review_forum_sickstick
% @type categorical
% @canonical false
% @original_name user_review_forum (Sickstick comparison)
% @values floats_better_sickstick_faster=Floats_better_than_Sickstick_Sickstick_faster_groomers unk_user_review_forum_sickstick=Unknown
% @importance 0.85

0.75::true_val(user_review_forum_sickstick, floats_better_sickstick_faster); 0.25::true_val(user_review_forum_sickstick, unk_user_review_forum_sickstick).

0.65::acc(s27, user_review_forum_sickstick).

measured(s27, user_review_forum_sickstick, floats_better_sickstick_faster).

all_consistent(user_review_forum_sickstick) :-
    consistent(s27, user_review_forum_sickstick).

evidence(all_consistent(user_review_forum_sickstick)).
query(true_val(user_review_forum_sickstick, floats_better_sickstick_faster)).
query(true_val(user_review_forum_sickstick, unk_user_review_forum_sickstick)).

% @attr backcountry_editorial
% @type categorical
% @canonical false
% @original_name Backcountry.com editorial
% @values freeride_stability_freestyle_creativity=Connects_freeride_stability_freestyle_creativity unk_backcountry_editorial=Unknown
% @importance 0.90

0.87::true_val(backcountry_editorial, freeride_stability_freestyle_creativity); 0.13::true_val(backcountry_editorial, unk_backcountry_editorial).

0.82::acc(s2, backcountry_editorial).

measured(s2, backcountry_editorial, freeride_stability_freestyle_creativity).

all_consistent(backcountry_editorial) :-
    (indep(s2), consistent(s2, backcountry_editorial) ; \+indep(s2)).

evidence(all_consistent(backcountry_editorial)).
query(true_val(backcountry_editorial, freeride_stability_freestyle_creativity)).
query(true_val(backcountry_editorial, unk_backcountry_editorial)).

% @attr user_review_forum_pow_jib
% @type categorical
% @canonical false
% @original_name user_review_forum (pow jib)
% @values pow_jib_board=The_Louif_is_a_pow_jib_board unk_user_review_forum_pow_jib=Unknown
% @importance 0.70

0.68::true_val(user_review_forum_pow_jib, pow_jib_board); 0.32::true_val(user_review_forum_pow_jib, unk_user_review_forum_pow_jib).

0.55::acc(s28, user_review_forum_pow_jib).

measured(s28, user_review_forum_pow_jib, pow_jib_board).

all_consistent(user_review_forum_pow_jib) :-
    consistent(s28, user_review_forum_pow_jib).

evidence(all_consistent(user_review_forum_pow_jib)).
query(true_val(user_review_forum_pow_jib, pow_jib_board)).
query(true_val(user_review_forum_pow_jib, unk_user_review_forum_pow_jib)).

% @attr recommended_binding_pairings
% @type categorical
% @canonical false
% @original_name Recommended binding pairings (Looria)
% @values alibi_transfer_dod=Salomon_Alibi_Bent_Metal_Transfer_Roam_DoD unk_recommended_binding_pairings=Unknown
% @importance 0.80

0.78::true_val(recommended_binding_pairings, alibi_transfer_dod); 0.22::true_val(recommended_binding_pairings, unk_recommended_binding_pairings).

0.68::acc(s39, recommended_binding_pairings).

measured(s39, recommended_binding_pairings, alibi_transfer_dod).

all_consistent(recommended_binding_pairings) :-
    consistent(s39, recommended_binding_pairings).

evidence(all_consistent(recommended_binding_pairings)).
query(true_val(recommended_binding_pairings, alibi_transfer_dod)).
query(true_val(recommended_binding_pairings, unk_recommended_binding_pairings)).

% @attr youtube_review_2026
% @type categorical
% @canonical false
% @original_name 2026 YouTube review description
% @values powder_jib_board_exists=Powder_oriented_jib_board_exists unk_youtube_review_2026=Unknown
% @importance 0.70

0.72::true_val(youtube_review_2026, powder_jib_board_exists); 0.28::true_val(youtube_review_2026, unk_youtube_review_2026).

0.60::acc(s50, youtube_review_2026).

measured(s50, youtube_review_2026, powder_jib_board_exists).

all_consistent(youtube_review_2026) :-
    consistent(s50, youtube_review_2026).

evidence(all_consistent(youtube_review_2026)).
query(true_val(youtube_review_2026, powder_jib_board_exists)).
query(true_val(youtube_review_2026, unk_youtube_review_2026)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_stratos_burton_custom_fv=Jones_Stratos_Burton_Custom_Flying_V unk_comparable_board_cross_brand=Unknown
% @importance 0.65

0.72::true_val(comparable_board_cross_brand, jones_stratos_burton_custom_fv); 0.28::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

0.65::acc(s52, comparable_board_cross_brand).

measured(s52, comparable_board_cross_brand, jones_stratos_burton_custom_fv).

all_consistent(comparable_board_cross_brand) :-
    consistent(s52, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_stratos_burton_custom_fv)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_moderator
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Ride Moderator)
% @values ride_moderator=Ride_Moderator unk_comparable_board_cross_brand_moderator=Unknown
% @importance 0.70

0.72::true_val(comparable_board_cross_brand_moderator, ride_moderator); 0.28::true_val(comparable_board_cross_brand_moderator, unk_comparable_board_cross_brand_moderator).

0.60::acc(s50, comparable_board_cross_brand_moderator).

measured(s50, comparable_board_cross_brand_moderator, ride_moderator).

all_consistent(comparable_board_cross_brand_moderator) :-
    consistent(s50, comparable_board_cross_brand_moderator).

evidence(all_consistent(comparable_board_cross_brand_moderator)).
query(true_val(comparable_board_cross_brand_moderator, ride_moderator)).
query(true_val(comparable_board_cross_brand_moderator, unk_comparable_board_cross_brand_moderator)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values hps_taka=HPS_Takaharu_Nakai_mid_flex_directional unk_comparable_board_same_brand=Unknown
% @importance 0.75

0.85::true_val(comparable_board_same_brand, hps_taka); 0.15::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

0.85::acc(s19, comparable_board_same_brand).
0.55::acc(s28, comparable_board_same_brand).

measured(s19, comparable_board_same_brand, hps_taka).
measured(s28, comparable_board_same_brand, hps_taka).

all_consistent(comparable_board_same_brand) :-
    consistent(s19, comparable_board_same_brand),
    consistent(s28, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, hps_taka)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_annie
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Annie Boulanger)
% @values hps_annie=HPS_Annie_Boulanger_womens unk_comparable_board_same_brand_annie=Unknown
% @importance 0.80

0.85::true_val(comparable_board_same_brand_annie, hps_annie); 0.15::true_val(comparable_board_same_brand_annie, unk_comparable_board_same_brand_annie).

0.85::acc(s19, comparable_board_same_brand_annie).

measured(s19, comparable_board_same_brand_annie, hps_annie).

all_consistent(comparable_board_same_brand_annie) :-
    consistent(s19, comparable_board_same_brand_annie).

evidence(all_consistent(comparable_board_same_brand_annie)).
query(true_val(comparable_board_same_brand_annie, hps_annie)).
query(true_val(comparable_board_same_brand_annie, unk_comparable_board_same_brand_annie)).

% @attr comparable_board_same_brand_wolle
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (HPS Wolle Nyvelt)
% @values hps_wolle=HPS_Wolle_Nyvelt_wider_stiffer_powder unk_comparable_board_same_brand_wolle=Unknown
% @importance 0.64

0.84::true_val(comparable_board_same_brand_wolle, hps_wolle); 0.16::true_val(comparable_board_same_brand_wolle, unk_comparable_board_same_brand_wolle).

0.82::acc(s51, comparable_board_same_brand_wolle).

measured(s51, comparable_board_same_brand_wolle, hps_wolle).

all_consistent(comparable_board_same_brand_wolle) :-
    consistent(s51, comparable_board_same_brand_wolle).

evidence(all_consistent(comparable_board_same_brand_wolle)).
query(true_val(comparable_board_same_brand_wolle, hps_wolle)).
query(true_val(comparable_board_same_brand_wolle, unk_comparable_board_same_brand_wolle)).

% @attr comparable_board_same_brand_sickstick
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Sickstick)
% @values salomon_sickstick=Salomon_Sickstick_since_2007 unk_comparable_board_same_brand_sickstick=Unknown
% @importance 0.78

0.84::true_val(comparable_board_same_brand_sickstick, salomon_sickstick); 0.16::true_val(comparable_board_same_brand_sickstick, unk_comparable_board_same_brand_sickstick).

0.82::acc(s25, comparable_board_same_brand_sickstick).
0.65::acc(s27, comparable_board_same_brand_sickstick).

measured(s25, comparable_board_same_brand_sickstick, salomon_sickstick).
measured(s27, comparable_board_same_brand_sickstick, salomon_sickstick).

all_consistent(comparable_board_same_brand_sickstick) :-
    (indep(s25), consistent(s25, comparable_board_same_brand_sickstick) ; \+indep(s25)),
    consistent(s27, comparable_board_same_brand_sickstick).

evidence(all_consistent(comparable_board_same_brand_sickstick)).
query(true_val(comparable_board_same_brand_sickstick, salomon_sickstick)).
query(true_val(comparable_board_same_brand_sickstick, unk_comparable_board_same_brand_sickstick)).

% @attr comparable_board_cross_brand_pyl
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes PYL)
% @values yes_pyl=Yes_Pick_Your_Line unk_comparable_board_cross_brand_pyl=Unknown
% @importance 0.70

0.68::true_val(comparable_board_cross_brand_pyl, yes_pyl); 0.32::true_val(comparable_board_cross_brand_pyl, unk_comparable_board_cross_brand_pyl).

0.55::acc(s28, comparable_board_cross_brand_pyl).

measured(s28, comparable_board_cross_brand_pyl, yes_pyl).

all_consistent(comparable_board_cross_brand_pyl) :-
    consistent(s28, comparable_board_cross_brand_pyl).

evidence(all_consistent(comparable_board_cross_brand_pyl)).
query(true_val(comparable_board_cross_brand_pyl, yes_pyl)).
query(true_val(comparable_board_cross_brand_pyl, unk_comparable_board_cross_brand_pyl)).

% @attr comparable_board_cross_brand_ravine
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Rome Ravine, Arbor Clovis, Lago Open Road)
% @values ravine_clovis_openroad=Rome_Ravine_Arbor_Clovis_Lago_Open_Road unk_comparable_board_cross_brand_ravine=Unknown
% @importance 0.70

0.68::true_val(comparable_board_cross_brand_ravine, ravine_clovis_openroad); 0.32::true_val(comparable_board_cross_brand_ravine, unk_comparable_board_cross_brand_ravine).

0.55::acc(s28, comparable_board_cross_brand_ravine).

measured(s28, comparable_board_cross_brand_ravine, ravine_clovis_openroad).

all_consistent(comparable_board_cross_brand_ravine) :-
    consistent(s28, comparable_board_cross_brand_ravine).

evidence(all_consistent(comparable_board_cross_brand_ravine)).
query(true_val(comparable_board_cross_brand_ravine, ravine_clovis_openroad)).
query(true_val(comparable_board_cross_brand_ravine, unk_comparable_board_cross_brand_ravine)).

% @attr comparable_board_cross_brand_excavator
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 Excavator, Burton Stale Fish, Lib Tech Orca)
% @values excavator_stalefish_orca=K2_Excavator_Burton_Stale_Fish_Lib_Tech_Orca unk_comparable_board_cross_brand_excavator=Unknown
% @importance 0.70

0.65::true_val(comparable_board_cross_brand_excavator, excavator_stalefish_orca); 0.35::true_val(comparable_board_cross_brand_excavator, unk_comparable_board_cross_brand_excavator).

0.50::acc(s53, comparable_board_cross_brand_excavator).

measured(s53, comparable_board_cross_brand_excavator, excavator_stalefish_orca).

all_consistent(comparable_board_cross_brand_excavator) :-
    consistent(s53, comparable_board_cross_brand_excavator).

evidence(all_consistent(comparable_board_cross_brand_excavator)).
query(true_val(comparable_board_cross_brand_excavator, excavator_stalefish_orca)).
query(true_val(comparable_board_cross_brand_excavator, unk_comparable_board_cross_brand_excavator)).

% @attr successor_shape_change
% @type categorical
% @canonical false
% @original_name 2026 successor shape change
% @values dir_twin_basalt_flax=Directional_Twin_basalt_flax_replacing_bamboo unk_successor_shape_change=Unknown
% @importance 0.75

0.78::true_val(successor_shape_change, dir_twin_basalt_flax); 0.22::true_val(successor_shape_change, unk_successor_shape_change).

0.72::acc(s22, successor_shape_change).

measured(s22, successor_shape_change, dir_twin_basalt_flax).

all_consistent(successor_shape_change) :-
    (indep(s22), consistent(s22, successor_shape_change) ; \+indep(s22)).

evidence(all_consistent(successor_shape_change)).
query(true_val(successor_shape_change, dir_twin_basalt_flax)).
query(true_val(successor_shape_change, unk_successor_shape_change)).

% @attr wolle_nyvelt_bio
% @type categorical
% @canonical false
% @original_name Wolle Nyvelt
% @values team_athlete_shaper_decades=Team_athlete_shaper_over_two_decades_Mayrhofen unk_wolle_nyvelt_bio=Unknown
% @importance 0.48

0.82::true_val(wolle_nyvelt_bio, team_athlete_shaper_decades); 0.18::true_val(wolle_nyvelt_bio, unk_wolle_nyvelt_bio).

0.80::acc(s4, wolle_nyvelt_bio).
0.75::acc(s12, wolle_nyvelt_bio).

measured(s4, wolle_nyvelt_bio, team_athlete_shaper_decades).
measured(s12, wolle_nyvelt_bio, team_athlete_shaper_decades).

all_consistent(wolle_nyvelt_bio) :-
    consistent(s4, wolle_nyvelt_bio),
    consistent(s12, wolle_nyvelt_bio).

evidence(all_consistent(wolle_nyvelt_bio)).
query(true_val(wolle_nyvelt_bio, team_athlete_shaper_decades)).
query(true_val(wolle_nyvelt_bio, unk_wolle_nyvelt_bio)).

% @attr wolle_independent_line
% @type categorical
% @canonical false
% @original_name Wolle's independent line
% @values aesmo=AESMO_bindingless_snowboards unk_wolle_independent_line=Unknown
% @importance 0.45

0.82::true_val(wolle_independent_line, aesmo); 0.18::true_val(wolle_independent_line, unk_wolle_independent_line).

0.82::acc(s51, wolle_independent_line).

measured(s51, wolle_independent_line, aesmo).

all_consistent(wolle_independent_line) :-
    consistent(s51, wolle_independent_line).

evidence(all_consistent(wolle_independent_line)).
query(true_val(wolle_independent_line, aesmo)).
query(true_val(wolle_independent_line, unk_wolle_independent_line)).

% @attr hps_design_process
% @type categorical
% @canonical false
% @original_name HPS design process
% @values hand_cut_5_15_protos=Hand_cut_shapes_5_to_15_prototypes unk_hps_design_process=Unknown
% @importance 0.40

0.87::true_val(hps_design_process, hand_cut_5_15_protos); 0.13::true_val(hps_design_process, unk_hps_design_process).

0.90::acc(s21, hps_design_process).

measured(s21, hps_design_process, hand_cut_5_15_protos).

all_consistent(hps_design_process) :-
    consistent(s21, hps_design_process).

evidence(all_consistent(hps_design_process)).
query(true_val(hps_design_process, hand_cut_5_15_protos)).
query(true_val(hps_design_process, unk_hps_design_process)).

% @attr hillside_project_purpose
% @type categorical
% @canonical false
% @original_name Hillside Project purpose
% @values authentic_powder_shapes=Continuous_pursuit_authentic_powder_shapes unk_hillside_project_purpose=Unknown
% @importance 0.40

0.84::true_val(hillside_project_purpose, authentic_powder_shapes); 0.16::true_val(hillside_project_purpose, unk_hillside_project_purpose).

0.80::acc(s54, hillside_project_purpose).

measured(s54, hillside_project_purpose, authentic_powder_shapes).

all_consistent(hillside_project_purpose) :-
    consistent(s54, hillside_project_purpose).

evidence(all_consistent(hillside_project_purpose)).
query(true_val(hillside_project_purpose, authentic_powder_shapes)).
query(true_val(hillside_project_purpose, unk_hillside_project_purpose)).

% @attr salomon_brand_reputation
% @type categorical
% @canonical false
% @original_name Salomon brand reputation
% @values durability_innovation=Reputation_rooted_durability_innovation unk_salomon_brand_reputation=Unknown
% @importance 0.60

0.78::true_val(salomon_brand_reputation, durability_innovation); 0.22::true_val(salomon_brand_reputation, unk_salomon_brand_reputation).

0.70::acc(s46, salomon_brand_reputation).

measured(s46, salomon_brand_reputation, durability_innovation).

all_consistent(salomon_brand_reputation) :-
    (indep(s46), consistent(s46, salomon_brand_reputation) ; \+indep(s46)).

evidence(all_consistent(salomon_brand_reputation)).
query(true_val(salomon_brand_reputation, durability_innovation)).
query(true_val(salomon_brand_reputation, unk_salomon_brand_reputation)).

% @attr salomon_approach
% @type categorical
% @canonical false
% @original_name Salomon's approach
% @values designed_by_snowboarders=Designed_by_snowboarders_approved_team unk_salomon_approach=Unknown
% @importance 0.60

0.78::true_val(salomon_approach, designed_by_snowboarders); 0.22::true_val(salomon_approach, unk_salomon_approach).

0.70::acc(s46, salomon_approach).

measured(s46, salomon_approach, designed_by_snowboarders).

all_consistent(salomon_approach) :-
    (indep(s46), consistent(s46, salomon_approach) ; \+indep(s46)).

evidence(all_consistent(salomon_approach)).
query(true_val(salomon_approach, designed_by_snowboarders)).
query(true_val(salomon_approach, unk_salomon_approach)).

% @attr manufacturing_location
% @type categorical
% @canonical false
% @original_name Manufacturing likely shared with Amer Sports facilities
% @values austria_france_shared=Likely_shared_Amer_Sports_Austria_France unk_manufacturing_location=Unknown
% @importance 0.30

0.55::true_val(manufacturing_location, austria_france_shared); 0.45::true_val(manufacturing_location, unk_manufacturing_location).

0.40::acc(s55, manufacturing_location).

measured(s55, manufacturing_location, austria_france_shared).

all_consistent(manufacturing_location) :-
    consistent(s55, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, austria_france_shared)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr model_2024
% @type categorical
% @canonical false
% @original_name 2024 model
% @values mens_freeride_unchanged=Mens_Freeride_unchanged_core_tech unk_model_2024=Unknown
% @importance 0.65

0.80::true_val(model_2024, mens_freeride_unchanged); 0.20::true_val(model_2024, unk_model_2024).

0.72::acc(s56, model_2024).

measured(s56, model_2024, mens_freeride_unchanged).

all_consistent(model_2024) :-
    (indep(s56), consistent(s56, model_2024) ; \+indep(s56)).

evidence(all_consistent(model_2024)).
query(true_val(model_2024, mens_freeride_unchanged)).
query(true_val(model_2024, unk_model_2024)).

% @attr model_2025
% @type categorical
% @canonical false
% @original_name 2025 model
% @values unisex_same_tech=Unisex_identical_Rock_Out_Quadralizer_Ghost_Green unk_model_2025=Unknown
% @importance 1.00

0.93::true_val(model_2025, unisex_same_tech); 0.07::true_val(model_2025, unk_model_2025).

0.93::acc(s5, model_2025).

measured(s5, model_2025, unisex_same_tech).

all_consistent(model_2025) :-
    consistent(s5, model_2025).

evidence(all_consistent(model_2025)).
query(true_val(model_2025, unisex_same_tech)).
query(true_val(model_2025, unk_model_2025)).

% @attr model_2026
% @type categorical
% @canonical false
% @original_name 2026 model
% @values dir_twin_basalt_flax_fsc=Directional_Twin_basalt_flax_FSC_certified unk_model_2026=Unknown
% @importance 0.75

0.78::true_val(model_2026, dir_twin_basalt_flax_fsc); 0.22::true_val(model_2026, unk_model_2026).

0.72::acc(s22, model_2026).

measured(s22, model_2026, dir_twin_basalt_flax_fsc).

all_consistent(model_2026) :-
    (indep(s22), consistent(s22, model_2026) ; \+indep(s22)).

evidence(all_consistent(model_2026)).
query(true_val(model_2026, dir_twin_basalt_flax_fsc)).
query(true_val(model_2026, unk_model_2026)).

% @attr price_aud_merchant_rrp
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant (RRP)
% @values v949_99=949.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant_rrp, v949_99); 0.05::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

0.95::acc(sM, price_aud_merchant_rrp).

measured(sM, price_aud_merchant_rrp, v949_99).

all_consistent(price_aud_merchant_rrp) :-
    consistent(sM, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v949_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

% @attr discount
% @type numeric
% @unit percent
% @canonical false
% @original_name Discount
% @values v30=30.0 unk_discount=Unknown
% @importance 0.85

0.95::true_val(discount, v30); 0.05::true_val(discount, unk_discount).

0.95::acc(sM, discount).

measured(sM, discount, v30).

all_consistent(discount) :-
    consistent(sM, discount).

evidence(all_consistent(discount)).
query(true_val(discount, v30)).
query(true_val(discount, unk_discount)).