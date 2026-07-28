0.12::indep(s2).
0.15::indep(s5).
0.15::indep(s6).
0.12::indep(s7).
0.15::indep(s16).
0.12::indep(s20).
0.12::indep(s21).
0.20::indep(s25).
0.12::indep(s38).
0.18::indep(s40).
0.12::indep(s41).
0.15::indep(s42).
0.12::indep(s49).
0.30::indep(s50).
0.20::indep(s_merchant).
0.15::indep(s10).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.92

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).
0.95::acc(s1, brand).
0.70::acc(s2, brand).
0.78::acc(s3, brand).
measured(s1, brand, burton).
measured(s2, brand, burton).
measured(s3, brand, burton).
all_consistent(brand) :-
    consistent(s1, brand),
    consistent(s3, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).
evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values ft_gril_master=Family_Tree_Gril_Master unk_model_name=Unknown
% @importance 0.95

0.96::true_val(model_name, ft_gril_master); 0.04::true_val(model_name, unk_model_name).
0.95::acc(s1, model_name).
0.70::acc(s2, model_name).
measured(s1, model_name, ft_gril_master).
measured(s2, model_name, ft_gril_master).
all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).
evidence(all_consistent(model_name)).
query(true_val(model_name, ft_gril_master)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2024=2024_W24 unk_model_year=Unknown
% @importance 0.95

0.96::true_val(model_year, y2024); 0.04::true_val(model_year, unk_model_year).
0.95::acc(s1, model_year).
0.70::acc(s2, model_year).
measured(s1, model_year, y2024).
measured(s2, model_year, y2024).
all_consistent(model_year) :-
    consistent(s1, model_year),
    (indep(s2), consistent(s2, model_year) ; \+indep(s2)).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2024)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values family_tree_collection=Family_Tree_Collection unk_model_series=Unknown
% @importance 0.85

0.90::true_val(model_series, family_tree_collection); 0.10::true_val(model_series, unk_model_series).
0.72::acc(s2, model_series).
0.78::acc(s5, model_series).
measured(s2, model_series, family_tree_collection).
measured(s5, model_series, family_tree_collection).
all_consistent(model_series) :-
    (indep(s2), consistent(s2, model_series) ; \+indep(s2)),
    (indep(s5), consistent(s5, model_series) ; \+indep(s5)).
evidence(all_consistent(model_series)).
query(true_val(model_series, family_tree_collection)).
query(true_val(model_series, unk_model_series)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).
0.95::acc(s1, product_type).
measured(s1, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr sku_merchant
% @type categorical
% @canonical false
% @original_name SKU (merchant)
% @values sku_23898100000_145=23898100000_145 unk_sku_merchant=Unknown
% @importance 0.85

0.95::true_val(sku_merchant, sku_23898100000_145); 0.05::true_val(sku_merchant, unk_sku_merchant).
0.92::acc(s_merchant, sku_merchant).
measured(s_merchant, sku_merchant, sku_23898100000_145).
all_consistent(sku_merchant) :-
    (indep(s_merchant), consistent(s_merchant, sku_merchant) ; \+indep(s_merchant)).
evidence(all_consistent(sku_merchant)).
query(true_val(sku_merchant, sku_23898100000_145)).
query(true_val(sku_merchant, unk_sku_merchant)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values gril_master_ltd_2023=Gril_Master_LTD_2023 unk_predecessor_model_name=Unknown
% @importance 0.80

0.88::true_val(predecessor_model_name, gril_master_ltd_2023); 0.12::true_val(predecessor_model_name, unk_predecessor_model_name).
0.85::acc(s19, predecessor_model_name).
0.83::acc(s23, predecessor_model_name).
measured(s19, predecessor_model_name, gril_master_ltd_2023).
measured(s23, predecessor_model_name, gril_master_ltd_2023).
all_consistent(predecessor_model_name) :-
    consistent(s19, predecessor_model_name),
    consistent(s23, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, gril_master_ltd_2023)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values nov_23_2022=November_23_2022_limited_100_boards unk_model_first_available_year=Unknown
% @importance 0.70

0.81::true_val(model_first_available_year, nov_23_2022); 0.19::true_val(model_first_available_year, unk_model_first_available_year).
0.85::acc(s23, model_first_available_year).
measured(s23, model_first_available_year, nov_23_2022).
all_consistent(model_first_available_year) :- consistent(s23, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, nov_23_2022)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values season_2023_24_inline=First_Family_Tree_inline_2023_24 unk_redesign_year=Unknown
% @importance 0.75

0.85::true_val(redesign_year, season_2023_24_inline); 0.15::true_val(redesign_year, unk_redesign_year).
0.85::acc(s19, redesign_year).
0.82::acc(s11, redesign_year).
measured(s19, redesign_year, season_2023_24_inline).
measured(s11, redesign_year, season_2023_24_inline).
all_consistent(redesign_year) :-
    consistent(s19, redesign_year),
    consistent(s11, redesign_year).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, season_2023_24_inline)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values marko_grilo_grilc=Marko_Grilo_Grilc unk_pro_rider_name=Unknown
% @importance 0.75

0.93::true_val(pro_rider_name, marko_grilo_grilc); 0.07::true_val(pro_rider_name, unk_pro_rider_name).
0.88::acc(s4, pro_rider_name).
0.93::acc(s22, pro_rider_name).
measured(s4, pro_rider_name, marko_grilo_grilc).
measured(s22, pro_rider_name, marko_grilo_grilc).
all_consistent(pro_rider_name) :-
    consistent(s4, pro_rider_name),
    consistent(s22, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, marko_grilo_grilc)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr tribute_rider_nationality
% @type categorical
% @canonical false
% @original_name Tribute rider nationality
% @values slovenian=Slovenian unk_tribute_rider_nationality=Unknown
% @importance 0.50

0.93::true_val(tribute_rider_nationality, slovenian); 0.07::true_val(tribute_rider_nationality, unk_tribute_rider_nationality).
0.93::acc(s22, tribute_rider_nationality).
0.85::acc(s28, tribute_rider_nationality).
measured(s22, tribute_rider_nationality, slovenian).
measured(s28, tribute_rider_nationality, slovenian).
all_consistent(tribute_rider_nationality) :-
    consistent(s22, tribute_rider_nationality),
    consistent(s28, tribute_rider_nationality).
evidence(all_consistent(tribute_rider_nationality)).
query(true_val(tribute_rider_nationality, slovenian)).
query(true_val(tribute_rider_nationality, unk_tribute_rider_nationality)).

% @attr tribute_rider_cause_of_death
% @type categorical
% @canonical false
% @original_name Tribute rider cause of death
% @values fatal_accident_soelden=Fatal_snowboarding_accident_Soelden_2021 unk_tribute_rider_cause_of_death=Unknown
% @importance 0.60

0.93::true_val(tribute_rider_cause_of_death, fatal_accident_soelden); 0.07::true_val(tribute_rider_cause_of_death, unk_tribute_rider_cause_of_death).
0.90::acc(s28, tribute_rider_cause_of_death).
0.93::acc(s22, tribute_rider_cause_of_death).
measured(s28, tribute_rider_cause_of_death, fatal_accident_soelden).
measured(s22, tribute_rider_cause_of_death, fatal_accident_soelden).
all_consistent(tribute_rider_cause_of_death) :-
    consistent(s28, tribute_rider_cause_of_death),
    consistent(s22, tribute_rider_cause_of_death).
evidence(all_consistent(tribute_rider_cause_of_death)).
query(true_val(tribute_rider_cause_of_death, fatal_accident_soelden)).
query(true_val(tribute_rider_cause_of_death, unk_tribute_rider_cause_of_death)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values grilos_children=Hand_drawn_by_Grilos_children unk_graphic_designer_artist=Unknown
% @importance 0.60

0.88::true_val(graphic_designer_artist, grilos_children); 0.12::true_val(graphic_designer_artist, unk_graphic_designer_artist).
0.72::acc(s2, graphic_designer_artist).
0.68::acc(s20, graphic_designer_artist).
measured(s2, graphic_designer_artist, grilos_children).
measured(s20, graphic_designer_artist, grilos_children).
all_consistent(graphic_designer_artist) :-
    (indep(s2), consistent(s2, graphic_designer_artist) ; \+indep(s2)),
    (indep(s20), consistent(s20, graphic_designer_artist) ; \+indep(s20)).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, grilos_children)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr graphic_designer_artist_2
% @type categorical
% @canonical false
% @original_name graphic_designer_artist
% @values ryan_crotty=Ryan_Crotty_abstract_mountainscapes unk_graphic_designer_artist_2=Unknown
% @importance 0.85

0.78::true_val(graphic_designer_artist_2, ryan_crotty); 0.22::true_val(graphic_designer_artist_2, unk_graphic_designer_artist_2).
0.75::acc(s25, graphic_designer_artist_2).
measured(s25, graphic_designer_artist_2, ryan_crotty).
all_consistent(graphic_designer_artist_2) :-
    (indep(s25), consistent(s25, graphic_designer_artist_2) ; \+indep(s25)).
evidence(all_consistent(graphic_designer_artist_2)).
query(true_val(graphic_designer_artist_2, ryan_crotty)).
query(true_val(graphic_designer_artist_2, unk_graphic_designer_artist_2)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values cruise_family_charge_solo=Cruise_with_family_charge_solo unk_design_philosophy=Unknown
% @importance 0.73

0.90::true_val(design_philosophy, cruise_family_charge_solo); 0.10::true_val(design_philosophy, unk_design_philosophy).
0.93::acc(s22, design_philosophy).
0.80::acc(s3, design_philosophy).
measured(s22, design_philosophy, cruise_family_charge_solo).
measured(s3, design_philosophy, cruise_family_charge_solo).
all_consistent(design_philosophy) :-
    consistent(s22, design_philosophy),
    consistent(s3, design_philosophy).
evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, cruise_family_charge_solo)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr graphic_designer_artist_3
% @type categorical
% @canonical false
% @original_name graphic_designer_artist
% @values lesley_betts=Lesley_Betts_Burton_senior_PLM unk_graphic_designer_artist_3=Unknown
% @importance 0.70

0.81::true_val(graphic_designer_artist_3, lesley_betts); 0.19::true_val(graphic_designer_artist_3, unk_graphic_designer_artist_3).
0.85::acc(s23, graphic_designer_artist_3).
measured(s23, graphic_designer_artist_3, lesley_betts).
all_consistent(graphic_designer_artist_3) :- consistent(s23, graphic_designer_artist_3).
evidence(all_consistent(graphic_designer_artist_3)).
query(true_val(graphic_designer_artist_3, lesley_betts)).
query(true_val(graphic_designer_artist_3, unk_graphic_designer_artist_3)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values gender_neutral=Gender_neutral_sizing unk_gender=Unknown
% @importance 0.70

0.88::true_val(gender, gender_neutral); 0.12::true_val(gender, unk_gender).
0.78::acc(s5, gender).
0.82::acc(s11, gender).
measured(s5, gender, gender_neutral).
measured(s11, gender, gender_neutral).
all_consistent(gender) :-
    (indep(s5), consistent(s5, gender) ; \+indep(s5)),
    consistent(s11, gender).
evidence(all_consistent(gender)).
query(true_val(gender, gender_neutral)).
query(true_val(gender, unk_gender)).

% @attr collection_description
% @type categorical
% @canonical false
% @original_name Collection description
% @values tweaked_existing_shapes=Based_on_existing_shapes_tweaked unk_collection_description=Unknown
% @importance 0.80

0.76::true_val(collection_description, tweaked_existing_shapes); 0.24::true_val(collection_description, unk_collection_description).
0.75::acc(s5, collection_description).
measured(s5, collection_description, tweaked_existing_shapes).
all_consistent(collection_description) :-
    (indep(s5), consistent(s5, collection_description) ; \+indep(s5)).
evidence(all_consistent(collection_description)).
query(true_val(collection_description, tweaked_existing_shapes)).
query(true_val(collection_description, unk_collection_description)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values discontinued_2026=Discontinued_as_of_2026 unk_availability_status=Unknown
% @importance 0.90

0.80::true_val(availability_status, discontinued_2026); 0.20::true_val(availability_status, unk_availability_status).
0.82::acc(s_tgr, availability_status).
measured(s_tgr, availability_status, discontinued_2026).
all_consistent(availability_status) :- consistent(s_tgr, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, discontinued_2026)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_2
% @type categorical
% @canonical false
% @original_name availability_status
% @values out_of_stock=Out_of_stock unk_availability_status_2=Unknown
% @importance 1.0

0.85::true_val(availability_status_2, out_of_stock); 0.15::true_val(availability_status_2, unk_availability_status_2).
0.90::acc(s1, availability_status_2).
measured(s1, availability_status_2, out_of_stock).
all_consistent(availability_status_2) :- consistent(s1, availability_status_2).
evidence(all_consistent(availability_status_2)).
query(true_val(availability_status_2, out_of_stock)).
query(true_val(availability_status_2, unk_availability_status_2)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards_B_Corp unk_manufacturer=Unknown
% @importance 1.0

0.97::true_val(manufacturer, burton_snowboards); 0.03::true_val(manufacturer, unk_manufacturer).
0.95::acc(s1, manufacturer).
measured(s1, manufacturer, burton_snowboards).
all_consistent(manufacturer) :- consistent(s1, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values austria_kiel_nindl=Austria_Kiel_Nindl_GMBH unk_manufacturing_location=Unknown
% @importance 0.70

0.82::true_val(manufacturing_location, austria_kiel_nindl); 0.18::true_val(manufacturing_location, unk_manufacturing_location).
0.80::acc(s50, manufacturing_location).
measured(s50, manufacturing_location, austria_kiel_nindl).
all_consistent(manufacturing_location) :-
    (indep(s50), consistent(s50, manufacturing_location) ; \+indep(s50)).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, austria_kiel_nindl)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name manufacturing_location_prior
% @values craigs_vermont=Craigs_Vermont unk_manufacturing_location_prior=Unknown
% @importance 0.60

0.81::true_val(manufacturing_location_prior, craigs_vermont); 0.19::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).
0.85::acc(s28, manufacturing_location_prior).
measured(s28, manufacturing_location_prior, craigs_vermont).
all_consistent(manufacturing_location_prior) :- consistent(s28, manufacturing_location_prior).
evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, craigs_vermont)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_camber=Directional_Camber_rocker_nose_camber_back unk_camber_type=Unknown
% @importance 0.90

0.94::true_val(camber_type, directional_camber); 0.06::true_val(camber_type, unk_camber_type).
0.72::acc(s2, camber_type).
0.78::acc(s5, camber_type).
measured(s2, camber_type, directional_camber).
measured(s5, camber_type, directional_camber).
all_consistent(camber_type) :-
    (indep(s2), consistent(s2, camber_type) ; \+indep(s2)),
    (indep(s5), consistent(s5, camber_type) ; \+indep(s5)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values freeride_directional=Freeride_Directional unk_shape=Unknown
% @importance 0.88

0.93::true_val(shape, freeride_directional); 0.07::true_val(shape, unk_shape).
0.75::acc(s25, shape).
0.90::acc(s_merchant, shape).
measured(s25, shape, freeride_directional).
measured(s_merchant, shape, freeride_directional).
all_consistent(shape) :-
    (indep(s25), consistent(s25, shape) ; \+indep(s25)),
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)).
evidence(all_consistent(shape)).
query(true_val(shape, freeride_directional)).
query(true_val(shape, unk_shape)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v6_5=6.5 v4_7_range=4-7
% @importance 0.83

0.65::true_val(flex_rating_10, v6_5); 0.35::true_val(flex_rating_10, v4_7_range).
0.90::acc(s_merchant, flex_rating_10).
0.72::acc(s38, flex_rating_10).
0.65::acc(s40, flex_rating_10).
measured(s_merchant, flex_rating_10, v6_5).
measured(s38, flex_rating_10, v6_5).
measured(s40, flex_rating_10, v4_7_range).
all_consistent(flex_rating_10) :-
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    (indep(s38), consistent(s38, flex_rating_10) ; \+indep(s38)),
    (indep(s40), consistent(s40, flex_rating_10) ; \+indep(s40)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6_5)).
query(true_val(flex_rating_10, v4_7_range)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_flex=Directional_Flex_pop_tail_resilient_nose unk_flex_direction=Unknown
% @importance 0.90

0.93::true_val(flex_direction, directional_flex); 0.07::true_val(flex_direction, unk_flex_direction).
0.72::acc(s2, flex_direction).
0.78::acc(s5, flex_direction).
measured(s2, flex_direction, directional_flex).
measured(s5, flex_direction, directional_flex).
all_consistent(flex_direction) :-
    (indep(s2), consistent(s2, flex_direction) ; \+indep(s2)),
    (indep(s5), consistent(s5, flex_direction) ; \+indep(s5)).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values soft_for_ft_medium_stiff_underfoot=Pretty_soft_for_FT_medium_stiff_between_feet unk_flex_feel=Unknown
% @importance 0.85

0.80::true_val(flex_feel, soft_for_ft_medium_stiff_underfoot); 0.20::true_val(flex_feel, unk_flex_feel).
0.85::acc(s13, flex_feel).
measured(s13, flex_feel, soft_for_ft_medium_stiff_underfoot).
all_consistent(flex_feel) :- consistent(s13, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, soft_for_ft_medium_stiff_underfoot)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_feel_2
% @type categorical
% @canonical false
% @original_name flex_feel
% @values nose_soft_tail_mid_stiff_underfoot=Nose_softer_tail_inbetween_stiffer_underfoot unk_flex_feel_2=Unknown
% @importance 0.85

0.80::true_val(flex_feel_2, nose_soft_tail_mid_stiff_underfoot); 0.20::true_val(flex_feel_2, unk_flex_feel_2).
0.85::acc(s13, flex_feel_2).
0.78::acc(s9, flex_feel_2).
measured(s13, flex_feel_2, nose_soft_tail_mid_stiff_underfoot).
measured(s9, flex_feel_2, nose_soft_tail_mid_stiff_underfoot).
all_consistent(flex_feel_2) :-
    consistent(s13, flex_feel_2),
    consistent(s9, flex_feel_2).
evidence(all_consistent(flex_feel_2)).
query(true_val(flex_feel_2, nose_soft_tail_mid_stiff_underfoot)).
query(true_val(flex_feel_2, unk_flex_feel_2)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v15=15.0 unk_taper=Unknown
% @importance 0.88

0.93::true_val(taper, v15); 0.07::true_val(taper, unk_taper).
0.75::acc(s25, taper).
0.90::acc(s_merchant, taper).
measured(s25, taper, v15).
measured(s_merchant, taper, v15).
all_consistent(taper) :-
    (indep(s25), consistent(s25, taper) ; \+indep(s25)),
    (indep(s_merchant), consistent(s_merchant, taper) ; \+indep(s_merchant)).
evidence(all_consistent(taper)).
query(true_val(taper, v15)).
query(true_val(taper, unk_taper)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G_Core unk_core_material=Unknown
% @importance 0.80

0.92::true_val(core_material, super_fly_ii_700g); 0.08::true_val(core_material, unk_core_material).
0.78::acc(s6, core_material).
0.70::acc(s21, core_material).
measured(s6, core_material, super_fly_ii_700g).
measured(s21, core_material, super_fly_ii_700g).
all_consistent(core_material) :-
    (indep(s6), consistent(s6, core_material) ; \+indep(s6)),
    (indep(s21), consistent(s21, core_material) ; \+indep(s21)).
evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified unk_sustainability_certification=Unknown
% @importance 0.65

0.82::true_val(sustainability_certification, fsc_certified); 0.18::true_val(sustainability_certification, unk_sustainability_certification).
0.72::acc(s40, sustainability_certification).
0.68::acc(s49, sustainability_certification).
measured(s40, sustainability_certification, fsc_certified).
measured(s49, sustainability_certification, fsc_certified).
all_consistent(sustainability_certification) :-
    (indep(s40), consistent(s40, sustainability_certification) ; \+indep(s40)),
    (indep(s49), consistent(s49, sustainability_certification) ; \+indep(s49)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values squeezebox=Squeezebox_enhanced_energy_transfer unk_construction_material_innovation=Unknown
% @importance 0.88

0.90::true_val(construction_material_innovation, squeezebox); 0.10::true_val(construction_material_innovation, unk_construction_material_innovation).
0.72::acc(s2, construction_material_innovation).
0.78::acc(s6, construction_material_innovation).
measured(s2, construction_material_innovation, squeezebox).
measured(s6, construction_material_innovation, squeezebox).
all_consistent(construction_material_innovation) :-
    (indep(s2), consistent(s2, construction_material_innovation) ; \+indep(s2)),
    (indep(s6), consistent(s6, construction_material_innovation) ; \+indep(s6)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, squeezebox)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_2
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values dualzone_egd=Dualzone_EGD_perpendicular_wood_grain unk_construction_material_innovation_2=Unknown
% @importance 0.80

0.88::true_val(construction_material_innovation_2, dualzone_egd); 0.12::true_val(construction_material_innovation_2, unk_construction_material_innovation_2).
0.78::acc(s6, construction_material_innovation_2).
0.70::acc(s21, construction_material_innovation_2).
measured(s6, construction_material_innovation_2, dualzone_egd).
measured(s21, construction_material_innovation_2, dualzone_egd).
all_consistent(construction_material_innovation_2) :-
    (indep(s6), consistent(s6, construction_material_innovation_2) ; \+indep(s6)),
    (indep(s21), consistent(s21, construction_material_innovation_2) ; \+indep(s21)).
evidence(all_consistent(construction_material_innovation_2)).
query(true_val(construction_material_innovation_2, dualzone_egd)).
query(true_val(construction_material_innovation_2, unk_construction_material_innovation_2)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values carbon_highlights_45=45_degree_Carbon_Highlights_tip_to_tail unk_laminate=Unknown
% @importance 0.80

0.90::true_val(laminate, carbon_highlights_45); 0.10::true_val(laminate, unk_laminate).
0.72::acc(s2, laminate).
0.78::acc(s16, laminate).
measured(s2, laminate, carbon_highlights_45).
measured(s16, laminate, carbon_highlights_45).
all_consistent(laminate) :-
    (indep(s2), consistent(s2, laminate) ; \+indep(s2)),
    (indep(s16), consistent(s16, laminate) ; \+indep(s16)).
evidence(all_consistent(laminate)).
query(true_val(laminate, carbon_highlights_45)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_fibre_function
% @type categorical
% @canonical false
% @original_name Laminate fibre function
% @values angle_45_aggressive=45_degree_angle_aggressive_ride unk_laminate_fibre_function=Unknown
% @importance 0.70

0.78::true_val(laminate_fibre_function, angle_45_aggressive); 0.22::true_val(laminate_fibre_function, unk_laminate_fibre_function).
0.78::acc(s16, laminate_fibre_function).
measured(s16, laminate_fibre_function, angle_45_aggressive).
all_consistent(laminate_fibre_function) :-
    (indep(s16), consistent(s16, laminate_fibre_function) ; \+indep(s16)).
evidence(all_consistent(laminate_fibre_function)).
query(true_val(laminate_fibre_function, angle_45_aggressive)).
query(true_val(laminate_fibre_function, unk_laminate_fibre_function)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_wfo=Sintered_WFO unk_base_type=Unknown
% @importance 0.80

0.90::true_val(base_type, sintered_wfo); 0.10::true_val(base_type, unk_base_type).
0.72::acc(s2, base_type).
0.78::acc(s16, base_type).
measured(s2, base_type, sintered_wfo).
measured(s16, base_type, sintered_wfo).
all_consistent(base_type) :-
    (indep(s2), consistent(s2, base_type) ; \+indep(s2)),
    (indep(s16), consistent(s16, base_type) ; \+indep(s16)).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_wfo)).
query(true_val(base_type, unk_base_type)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values high_density_sintered_wax=Extra_absorbent_high_density_sintered_wax_infused unk_base_material=Unknown
% @importance 0.80

0.90::true_val(base_material, high_density_sintered_wax); 0.10::true_val(base_material, unk_base_material).
0.72::acc(s2, base_material).
0.78::acc(s16, base_material).
measured(s2, base_material, high_density_sintered_wax).
measured(s16, base_material, high_density_sintered_wax).
all_consistent(base_material) :-
    (indep(s2), consistent(s2, base_material) ; \+indep(s2)),
    (indep(s16), consistent(s16, base_material) ; \+indep(s16)).
evidence(all_consistent(base_material)).
query(true_val(base_material, high_density_sintered_wax)).
query(true_val(base_material, unk_base_material)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based unk_resin=Unknown
% @importance 0.80

0.90::true_val(resin, super_sap_epoxy); 0.10::true_val(resin, unk_resin).
0.72::acc(s2, resin).
0.68::acc(s7, resin).
measured(s2, resin, super_sap_epoxy).
measured(s7, resin, super_sap_epoxy).
all_consistent(resin) :-
    (indep(s2), consistent(s2, resin) ; \+indep(s2)),
    (indep(s7), consistent(s7, resin) ; \+indep(s7)).
evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr construction_material_innovation_3
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values pro_tip=Pro_Tip_reduced_swing_weight unk_construction_material_innovation_3=Unknown
% @importance 0.78

0.86::true_val(construction_material_innovation_3, pro_tip); 0.14::true_val(construction_material_innovation_3, unk_construction_material_innovation_3).
0.78::acc(s6, construction_material_innovation_3).
0.68::acc(s7, construction_material_innovation_3).
measured(s6, construction_material_innovation_3, pro_tip).
measured(s7, construction_material_innovation_3, pro_tip).
all_consistent(construction_material_innovation_3) :-
    (indep(s6), consistent(s6, construction_material_innovation_3) ; \+indep(s6)),
    (indep(s7), consistent(s7, construction_material_innovation_3) ; \+indep(s7)).
evidence(all_consistent(construction_material_innovation_3)).
query(true_val(construction_material_innovation_3, pro_tip)).
query(true_val(construction_material_innovation_3, unk_construction_material_innovation_3)).

% @attr construction_material_innovation_4
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values infinite_ride=Infinite_Ride_overbuilt_then_broken_in unk_construction_material_innovation_4=Unknown
% @importance 0.80

0.86::true_val(construction_material_innovation_4, infinite_ride); 0.14::true_val(construction_material_innovation_4, unk_construction_material_innovation_4).
0.72::acc(s2, construction_material_innovation_4).
0.68::acc(s7, construction_material_innovation_4).
measured(s2, construction_material_innovation_4, infinite_ride).
measured(s7, construction_material_innovation_4, infinite_ride).
all_consistent(construction_material_innovation_4) :-
    (indep(s2), consistent(s2, construction_material_innovation_4) ; \+indep(s2)),
    (indep(s7), consistent(s7, construction_material_innovation_4) ; \+indep(s7)).
evidence(all_consistent(construction_material_innovation_4)).
query(true_val(construction_material_innovation_4, infinite_ride)).
query(true_val(construction_material_innovation_4, unk_construction_material_innovation_4)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel unk_mounting_pattern=Unknown
% @importance 0.85

0.93::true_val(mounting_pattern, the_channel); 0.07::true_val(mounting_pattern, unk_mounting_pattern).
0.72::acc(s2, mounting_pattern).
0.78::acc(s5, mounting_pattern).
measured(s2, mounting_pattern, the_channel).
measured(s5, mounting_pattern, the_channel).
all_consistent(mounting_pattern) :-
    (indep(s2), consistent(s2, mounting_pattern) ; \+indep(s2)),
    (indep(s5), consistent(s5, mounting_pattern) ; \+indep(s5)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_major_bindings=Compatible_all_major_bindings unk_binding_compatibility=Unknown
% @importance 0.85

0.93::true_val(binding_compatibility, all_major_bindings); 0.07::true_val(binding_compatibility, unk_binding_compatibility).
0.72::acc(s2, binding_compatibility).
0.78::acc(s5, binding_compatibility).
measured(s2, binding_compatibility, all_major_bindings).
measured(s5, binding_compatibility, all_major_bindings).
all_consistent(binding_compatibility) :-
    (indep(s2), consistent(s2, binding_compatibility) ; \+indep(s2)),
    (indep(s5), consistent(s5, binding_compatibility) ; \+indep(s5)).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_major_bindings)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges unk_edge_technology=Unknown
% @importance 0.80

0.74::true_val(edge_technology, frostbite_edges); 0.26::true_val(edge_technology, unk_edge_technology).
0.72::acc(s40, edge_technology).
measured(s40, edge_technology, frostbite_edges).
all_consistent(edge_technology) :-
    (indep(s40), consistent(s40, edge_technology) ; \+indep(s40)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values balanced_freeride=Balanced_Freeride_Geometry unk_sidecut_type=Unknown
% @importance 0.78

0.88::true_val(sidecut_type, balanced_freeride); 0.12::true_val(sidecut_type, unk_sidecut_type).
0.78::acc(s5, sidecut_type).
0.68::acc(s41, sidecut_type).
measured(s5, sidecut_type, balanced_freeride).
measured(s41, sidecut_type, balanced_freeride).
all_consistent(sidecut_type) :-
    (indep(s5), consistent(s5, sidecut_type) ; \+indep(s5)),
    (indep(s41), consistent(s41, sidecut_type) ; \+indep(s41)).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, balanced_freeride)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr laminate_2
% @type categorical
% @canonical false
% @original_name laminate
% @values triax_45_carbon=Triax_Infused_with_45_Carbon_Highlights unk_laminate_2=Unknown
% @importance 0.70

0.76::true_val(laminate_2, triax_45_carbon); 0.24::true_val(laminate_2, unk_laminate_2).
0.75::acc(s50, laminate_2).
measured(s50, laminate_2, triax_45_carbon).
all_consistent(laminate_2) :-
    (indep(s50), consistent(s50, laminate_2) ; \+indep(s50)).
evidence(all_consistent(laminate_2)).
query(true_val(laminate_2, triax_45_carbon)).
query(true_val(laminate_2, unk_laminate_2)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values three_year=3_Year_Warranty unk_warranty=Unknown
% @importance 0.80

0.92::true_val(warranty, three_year); 0.08::true_val(warranty, unk_warranty).
0.75::acc(s25, warranty).
0.82::acc(s26, warranty).
measured(s25, warranty, three_year).
measured(s26, warranty, three_year).
all_consistent(warranty) :-
    (indep(s25), consistent(s25, warranty) ; \+indep(s25)),
    consistent(s26, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_130_to_165_155w=130_140_145_150_155_160_165_155W unk_available_sizes=Unknown
% @importance 0.90

0.93::true_val(available_sizes, sizes_130_to_165_155w); 0.07::true_val(available_sizes, unk_available_sizes).
0.85::acc(s19, available_sizes).
0.90::acc(s_merchant, available_sizes).
measured(s19, available_sizes, sizes_130_to_165_155w).
measured(s_merchant, available_sizes, sizes_130_to_165_155w).
all_consistent(available_sizes) :-
    consistent(s19, available_sizes),
    (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_130_to_165_155w)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_2
% @type categorical
% @canonical false
% @original_name available_sizes
% @values sizes_ltd_130_140_155=130_140_155_only_LTD unk_available_sizes_2=Unknown
% @importance 0.65

0.85::true_val(available_sizes_2, sizes_ltd_130_140_155); 0.15::true_val(available_sizes_2, unk_available_sizes_2).
0.83::acc(s23, available_sizes_2).
0.82::acc(s11, available_sizes_2).
measured(s23, available_sizes_2, sizes_ltd_130_140_155).
measured(s11, available_sizes_2, sizes_ltd_130_140_155).
all_consistent(available_sizes_2) :-
    consistent(s23, available_sizes_2),
    consistent(s11, available_sizes_2).
evidence(all_consistent(available_sizes_2)).
query(true_val(available_sizes_2, sizes_ltd_130_140_155)).
query(true_val(available_sizes_2, unk_available_sizes_2)).

% @attr effective_edge_155
% @type numeric
% @canonical false
% @original_name Effective edge (155cm)
% @unit mm
% @values v1146=1146.0 unk_effective_edge_155=Unknown
% @importance 0.85

0.95::true_val(effective_edge_155, v1146); 0.05::true_val(effective_edge_155, unk_effective_edge_155).
0.92::acc(s_merchant, effective_edge_155).
measured(s_merchant, effective_edge_155, v1146).
all_consistent(effective_edge_155) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_155) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v1146)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

% @attr effective_edge_160
% @type numeric
% @canonical false
% @original_name Effective edge (160cm)
% @unit mm
% @values v1246=1246.0 unk_effective_edge_160=Unknown
% @importance 0.85

0.95::true_val(effective_edge_160, v1246); 0.05::true_val(effective_edge_160, unk_effective_edge_160).
0.92::acc(s_merchant, effective_edge_160).
measured(s_merchant, effective_edge_160, v1246).
all_consistent(effective_edge_160) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_160) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v1246)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name Waist width (155cm)
% @unit mm
% @values v257=257.0 unk_waist_width_155=Unknown
% @importance 0.85

0.95::true_val(waist_width_155, v257); 0.05::true_val(waist_width_155, unk_waist_width_155).
0.92::acc(s_merchant, waist_width_155).
measured(s_merchant, waist_width_155, v257).
all_consistent(waist_width_155) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_155) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v257)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr waist_width_160
% @type numeric
% @canonical false
% @original_name Waist width (160cm)
% @unit mm
% @values v264=264.0 unk_waist_width_160=Unknown
% @importance 0.85

0.95::true_val(waist_width_160, v264); 0.05::true_val(waist_width_160, unk_waist_width_160).
0.92::acc(s_merchant, waist_width_160).
measured(s_merchant, waist_width_160, v264).
all_consistent(waist_width_160) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_160) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v264)).
query(true_val(waist_width_160, unk_waist_width_160)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit mm
% @values v305_290=305/290mm unk_tip_tail_width_size=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size, v305_290); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.92::acc(s_merchant, tip_tail_width_size).
measured(s_merchant, tip_tail_width_size, v305_290).
all_consistent(tip_tail_width_size) :-
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size) ; \+indep(s_merchant)).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v305_290)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_160
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values v313_8_298_8=313.8/298.8mm unk_tip_tail_width_size_160=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_160, v313_8_298_8); 0.05::true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160).
0.92::acc(s_merchant, tip_tail_width_size_160).
measured(s_merchant, tip_tail_width_size_160, v313_8_298_8).
all_consistent(tip_tail_width_size_160) :-
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_160) ; \+indep(s_merchant)).
evidence(all_consistent(tip_tail_width_size_160)).
query(true_val(tip_tail_width_size_160, v313_8_298_8)).
query(true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_5=7.5 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size, v7_5); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.92::acc(s_merchant, sidecut_radius_size).
measured(s_merchant, sidecut_radius_size, v7_5).
all_consistent(sidecut_radius_size) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_5)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_160
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v7_8=7.8 unk_sidecut_radius_size_160=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_160, v7_8); 0.05::true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160).
0.92::acc(s_merchant, sidecut_radius_size_160).
measured(s_merchant, sidecut_radius_size_160, v7_8).
all_consistent(sidecut_radius_size_160) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_160) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_radius_size_160)).
query(true_val(sidecut_radius_size_160, v7_8)).
query(true_val(sidecut_radius_size_160, unk_sidecut_radius_size_160)).

% @attr sidecut_depth_155
% @type numeric
% @canonical false
% @original_name Sidecut depth (155cm)
% @unit mm
% @values v20_2=20.2 unk_sidecut_depth_155=Unknown
% @importance 0.85

0.95::true_val(sidecut_depth_155, v20_2); 0.05::true_val(sidecut_depth_155, unk_sidecut_depth_155).
0.92::acc(s_merchant, sidecut_depth_155).
measured(s_merchant, sidecut_depth_155, v20_2).
all_consistent(sidecut_depth_155) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_depth_155) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_depth_155)).
query(true_val(sidecut_depth_155, v20_2)).
query(true_val(sidecut_depth_155, unk_sidecut_depth_155)).

% @attr sidecut_depth_160
% @type numeric
% @canonical false
% @original_name Sidecut depth (160cm)
% @unit mm
% @values v22_2=22.2 unk_sidecut_depth_160=Unknown
% @importance 0.85

0.95::true_val(sidecut_depth_160, v22_2); 0.05::true_val(sidecut_depth_160, unk_sidecut_depth_160).
0.92::acc(s_merchant, sidecut_depth_160).
measured(s_merchant, sidecut_depth_160, v22_2).
all_consistent(sidecut_depth_160) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_depth_160) ; \+indep(s_merchant)).
evidence(all_consistent(sidecut_depth_160)).
query(true_val(sidecut_depth_160, v22_2)).
query(true_val(sidecut_depth_160, unk_sidecut_depth_160)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v_neg25=25.0 unk_setback=Unknown
% @importance 0.85

0.95::true_val(setback, v_neg25); 0.05::true_val(setback, unk_setback).
0.92::acc(s_merchant, setback).
measured(s_merchant, setback, v_neg25).
all_consistent(setback) :-
    (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)).
evidence(all_consistent(setback)).
query(true_val(setback, v_neg25)).
query(true_val(setback, unk_setback)).

% @attr setback_160
% @type numeric
% @canonical false
% @original_name setback
% @unit mm
% @values v_neg25_160=25.0 unk_setback_160=Unknown
% @importance 0.85

0.95::true_val(setback_160, v_neg25_160); 0.05::true_val(setback_160, unk_setback_160).
0.92::acc(s_merchant, setback_160).
measured(s_merchant, setback_160, v_neg25_160).
all_consistent(setback_160) :-
    (indep(s_merchant), consistent(s_merchant, setback_160) ; \+indep(s_merchant)).
evidence(all_consistent(setback_160)).
query(true_val(setback_160, v_neg25_160)).
query(true_val(setback_160, unk_setback_160)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit mm
% @values v1100=1100.0 unk_contact_length_size=Unknown
% @importance 0.85

0.95::true_val(contact_length_size, v1100); 0.05::true_val(contact_length_size, unk_contact_length_size).
0.92::acc(s_merchant, contact_length_size).
measured(s_merchant, contact_length_size, v1100).
all_consistent(contact_length_size) :-
    (indep(s_merchant), consistent(s_merchant, contact_length_size) ; \+indep(s_merchant)).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1100)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr contact_length_size_160
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit mm
% @values v1110=1110.0 unk_contact_length_size_160=Unknown
% @importance 0.85

0.95::true_val(contact_length_size_160, v1110); 0.05::true_val(contact_length_size_160, unk_contact_length_size_160).
0.92::acc(s_merchant, contact_length_size_160).
measured(s_merchant, contact_length_size_160, v1110).
all_consistent(contact_length_size_160) :-
    (indep(s_merchant), consistent(s_merchant, contact_length_size_160) ; \+indep(s_merchant)).
evidence(all_consistent(contact_length_size_160)).
query(true_val(contact_length_size_160, v1110)).
query(true_val(contact_length_size_160, unk_contact_length_size_160)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit mm
% @values v560=560.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size, v560); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).
0.92::acc(s_merchant, stance_width_range_size).
measured(s_merchant, stance_width_range_size, v560).
all_consistent(stance_width_range_size) :-
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size) ; \+indep(s_merchant)).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v560)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_160
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit mm
% @values v560_160=560.0 unk_stance_width_range_size_160=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_160, v560_160); 0.05::true_val(stance_width_range_size_160, unk_stance_width_range_size_160).
0.92::acc(s_merchant, stance_width_range_size_160).
measured(s_merchant, stance_width_range_size_160, v560_160).
all_consistent(stance_width_range_size_160) :-
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_160) ; \+indep(s_merchant)).
evidence(all_consistent(stance_width_range_size_160)).
query(true_val(stance_width_range_size_160, v560_160)).
query(true_val(stance_width_range_size_160, unk_stance_width_range_size_160)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values w54_82=54-82kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size, w54_82); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.92::acc(s_merchant, recommended_weight_range_size).
measured(s_merchant, recommended_weight_range_size, w54_82).
all_consistent(recommended_weight_range_size) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w54_82)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_160
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w82_118=82-118kg unk_recommended_weight_range_size_160=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_160, w82_118); 0.05::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).
0.92::acc(s_merchant, recommended_weight_range_size_160).
measured(s_merchant, recommended_weight_range_size_160, w82_118).
all_consistent(recommended_weight_range_size_160) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_160) ; \+indep(s_merchant)).
evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, w82_118)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr boot_size_recommendation_155
% @type categorical
% @canonical false
% @original_name Boot size recommendation (155)
% @values us_9_5_10_5=US_9.5-10.5 unk_boot_size_recommendation_155=Unknown
% @importance 0.90

0.80::true_val(boot_size_recommendation_155, us_9_5_10_5); 0.20::true_val(boot_size_recommendation_155, unk_boot_size_recommendation_155).
0.82::acc(s_tgr, boot_size_recommendation_155).
measured(s_tgr, boot_size_recommendation_155, us_9_5_10_5).
all_consistent(boot_size_recommendation_155) :- consistent(s_tgr, boot_size_recommendation_155).
evidence(all_consistent(boot_size_recommendation_155)).
query(true_val(boot_size_recommendation_155, us_9_5_10_5)).
query(true_val(boot_size_recommendation_155, unk_boot_size_recommendation_155)).

% @attr boot_size_recommendation_160
% @type categorical
% @canonical false
% @original_name Boot size recommendation (160)
% @values us_11_12=US_11-12 unk_boot_size_recommendation_160=Unknown
% @importance 0.90

0.80::true_val(boot_size_recommendation_160, us_11_12); 0.20::true_val(boot_size_recommendation_160, unk_boot_size_recommendation_160).
0.82::acc(s_tgr, boot_size_recommendation_160).
measured(s_tgr, boot_size_recommendation_160, us_11_12).
all_consistent(boot_size_recommendation_160) :- consistent(s_tgr, boot_size_recommendation_160).
evidence(all_consistent(boot_size_recommendation_160)).
query(true_val(boot_size_recommendation_160, us_11_12)).
query(true_val(boot_size_recommendation_160, unk_boot_size_recommendation_160)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_powder=All_Mountain_Powder unk_board_category=Unknown
% @importance 0.85

0.93::true_val(board_category, all_mountain_powder); 0.07::true_val(board_category, unk_board_category).
0.90::acc(s_merchant, board_category).
measured(s_merchant, board_category, all_mountain_powder).
all_consistent(board_category) :-
    (indep(s_merchant), consistent(s_merchant, board_category) ; \+indep(s_merchant)).
evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_powder)).
query(true_val(board_category, unk_board_category)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability
% @unit /10
% @values v4=4.0 unk_terrain_suitability_park=Unknown
% @importance 0.83

0.90::true_val(terrain_suitability_park, v4); 0.10::true_val(terrain_suitability_park, unk_terrain_suitability_park).
0.88::acc(s_merchant, terrain_suitability_park).
0.72::acc(s40, terrain_suitability_park).
measured(s_merchant, terrain_suitability_park, v4).
measured(s40, terrain_suitability_park, v4).
all_consistent(terrain_suitability_park) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_park) ; \+indep(s_merchant)),
    (indep(s40), consistent(s40, terrain_suitability_park) ; \+indep(s40)).
evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v4)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @canonical false
% @original_name terrain_suitability
% @unit /10
% @values v7=7.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 0.83

0.90::true_val(terrain_suitability_all_mountain, v7); 0.10::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).
0.88::acc(s_merchant, terrain_suitability_all_mountain).
0.72::acc(s40, terrain_suitability_all_mountain).
measured(s_merchant, terrain_suitability_all_mountain, v7).
measured(s40, terrain_suitability_all_mountain, v7).
all_consistent(terrain_suitability_all_mountain) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_all_mountain) ; \+indep(s_merchant)),
    (indep(s40), consistent(s40, terrain_suitability_all_mountain) ; \+indep(s40)).
evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v7)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr terrain_suitability_powder
% @type numeric
% @canonical false
% @original_name terrain_suitability
% @unit /10
% @values v8=8.0 unk_terrain_suitability_powder=Unknown
% @importance 0.83

0.90::true_val(terrain_suitability_powder, v8); 0.10::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).
0.88::acc(s_merchant, terrain_suitability_powder).
0.72::acc(s40, terrain_suitability_powder).
measured(s_merchant, terrain_suitability_powder, v8).
measured(s40, terrain_suitability_powder, v8).
all_consistent(terrain_suitability_powder) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability_powder) ; \+indep(s_merchant)),
    (indep(s40), consistent(s40, terrain_suitability_powder) ; \+indep(s40)).
evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v8)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate=Intermediate intermediate_expert=Intermediate_Expert advanced_expert=Advanced_Expert
% @importance 0.88

0.30::true_val(skill_level_recommendation, intermediate); 0.35::true_val(skill_level_recommendation, intermediate_expert); 0.35::true_val(skill_level_recommendation, advanced_expert).
0.85::acc(s_merchant, skill_level_recommendation).
0.78::acc(s25, skill_level_recommendation).
0.82::acc(s_tgr, skill_level_recommendation).
measured(s_merchant, skill_level_recommendation, intermediate).
measured(s25, skill_level_recommendation, intermediate_expert).
measured(s_tgr, skill_level_recommendation, advanced_expert).
all_consistent(skill_level_recommendation) :-
    (indep(s_merchant), consistent(s_merchant, skill_level_recommendation) ; \+indep(s_merchant)),
    (indep(s25), consistent(s25, skill_level_recommendation) ; \+indep(s25)),
    consistent(s_tgr, skill_level_recommendation).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate)).
query(true_val(skill_level_recommendation, intermediate_expert)).
query(true_val(skill_level_recommendation, advanced_expert)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mountain_powder_summary=All_Mountain_Powder unk_terrain_suitability=Unknown
% @importance 0.85

0.90::true_val(terrain_suitability, all_mountain_powder_summary); 0.10::true_val(terrain_suitability, unk_terrain_suitability).
0.88::acc(s_merchant, terrain_suitability).
measured(s_merchant, terrain_suitability, all_mountain_powder_summary).
all_consistent(terrain_suitability) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability) ; \+indep(s_merchant)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mountain_powder_summary)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freeride_carving_cruising=Freeride_Carving_Cruising unk_riding_style=Unknown
% @importance 0.85

0.90::true_val(riding_style, freeride_carving_cruising); 0.10::true_val(riding_style, unk_riding_style).
0.88::acc(s_merchant, riding_style).
measured(s_merchant, riding_style, freeride_carving_cruising).
all_consistent(riding_style) :-
    (indep(s_merchant), consistent(s_merchant, riding_style) ; \+indep(s_merchant)).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, freeride_carving_cruising)).
query(true_val(riding_style, unk_riding_style)).

% @attr riding_style_2
% @type categorical
% @canonical false
% @original_name riding_style
% @values do_everything_sidehits_stashes=Do_everything_side_hits_stashes unk_riding_style_2=Unknown
% @importance 0.85

0.78::true_val(riding_style_2, do_everything_sidehits_stashes); 0.22::true_val(riding_style_2, unk_riding_style_2).
0.80::acc(s3, riding_style_2).
measured(s3, riding_style_2, do_everything_sidehits_stashes).
all_consistent(riding_style_2) :- consistent(s3, riding_style_2).
evidence(all_consistent(riding_style_2)).
query(true_val(riding_style_2, do_everything_sidehits_stashes)).
query(true_val(riding_style_2, unk_riding_style_2)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values great=Great unk_powder_rating_tgr=Unknown
% @importance 0.90

0.80::true_val(powder_rating_tgr, great); 0.20::true_val(powder_rating_tgr, unk_powder_rating_tgr).
0.85::acc(s_tgr, powder_rating_tgr).
measured(s_tgr, powder_rating_tgr, great).
all_consistent(powder_rating_tgr) :- consistent(s_tgr, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, great)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.90

0.80::true_val(base_glide_performance, good); 0.20::true_val(base_glide_performance, unk_base_glide_performance).
0.85::acc(s_tgr, base_glide_performance).
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
% @importance 0.90

0.80::true_val(carving_rating_tgr, great); 0.20::true_val(carving_rating_tgr, unk_carving_rating_tgr).
0.85::acc(s_tgr, carving_rating_tgr).
measured(s_tgr, carving_rating_tgr, great).
all_consistent(carving_rating_tgr) :- consistent(s_tgr, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values great=Great unk_speed_rating_tgr=Unknown
% @importance 0.90

0.80::true_val(speed_rating_tgr, great); 0.20::true_val(speed_rating_tgr, unk_speed_rating_tgr).
0.85::acc(s_tgr, speed_rating_tgr).
measured(s_tgr, speed_rating_tgr, great).
all_consistent(speed_rating_tgr) :- consistent(s_tgr, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, great)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values great=Great unk_chatter_performance=Unknown
% @importance 0.90

0.80::true_val(chatter_performance, great); 0.20::true_val(chatter_performance, unk_chatter_performance).
0.85::acc(s_tgr, chatter_performance).
measured(s_tgr, chatter_performance, great).
all_consistent(chatter_performance) :- consistent(s_tgr, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, great)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values good=Good unk_switch_riding=Unknown
% @importance 0.90

0.80::true_val(switch_riding, good); 0.20::true_val(switch_riding, unk_switch_riding).
0.85::acc(s_tgr, switch_riding).
measured(s_tgr, switch_riding, good).
all_consistent(switch_riding) :- consistent(s_tgr, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, good)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_rating_tgr=Unknown
% @importance 0.90

0.80::true_val(jumps_rating_tgr, great); 0.20::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
0.85::acc(s_tgr, jumps_rating_tgr).
measured(s_tgr, jumps_rating_tgr, great).
all_consistent(jumps_rating_tgr) :- consistent(s_tgr, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.90

0.80::true_val(jibbing_rating_tgr, average); 0.20::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
0.85::acc(s_tgr, jibbing_rating_tgr).
measured(s_tgr, jibbing_rating_tgr, average).
all_consistent(jibbing_rating_tgr) :- consistent(s_tgr, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values good=Good unk_pipe_rating_tgr=Unknown
% @importance 0.90

0.80::true_val(pipe_rating_tgr, good); 0.20::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
0.85::acc(s_tgr, pipe_rating_tgr).
measured(s_tgr, pipe_rating_tgr, good).
all_consistent(pipe_rating_tgr) :- consistent(s_tgr, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, good)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.90

0.80::true_val(on_snow_feel_tgr, semi_locked_in); 0.20::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).
0.85::acc(s_tgr, on_snow_feel_tgr).
measured(s_tgr, on_snow_feel_tgr, semi_locked_in).
all_consistent(on_snow_feel_tgr) :- consistent(s_tgr, on_snow_feel_tgr).
evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.90

0.80::true_val(turn_initiation_performance, medium_fast); 0.20::true_val(turn_initiation_performance, unk_turn_initiation_performance).
0.85::acc(s_tgr, turn_initiation_performance).
measured(s_tgr, turn_initiation_performance, medium_fast).
all_consistent(turn_initiation_performance) :- consistent(s_tgr, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr tgr_skidded_turns
% @type categorical
% @canonical false
% @original_name TGR skidded turns
% @values semi_hard=Semi_Hard unk_tgr_skidded_turns=Unknown
% @importance 0.90

0.80::true_val(tgr_skidded_turns, semi_hard); 0.20::true_val(tgr_skidded_turns, unk_tgr_skidded_turns).
0.85::acc(s_tgr, tgr_skidded_turns).
measured(s_tgr, tgr_skidded_turns, semi_hard).
all_consistent(tgr_skidded_turns) :- consistent(s_tgr, tgr_skidded_turns).
evidence(all_consistent(tgr_skidded_turns)).
query(true_val(tgr_skidded_turns, semi_hard)).
query(true_val(tgr_skidded_turns, unk_tgr_skidded_turns)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical false
% @original_name flex_rating_10_the_good_ride
% @values medium=Medium unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.90

0.80::true_val(flex_rating_10_the_good_ride, medium); 0.20::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).
0.85::acc(s_tgr, flex_rating_10_the_good_ride).
measured(s_tgr, flex_rating_10_the_good_ride, medium).
all_consistent(flex_rating_10_the_good_ride) :- consistent(s_tgr, flex_rating_10_the_good_ride).
evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

% @attr tgr_buttering
% @type categorical
% @canonical false
% @original_name TGR buttering
% @values moderate=Moderate unk_tgr_buttering=Unknown
% @importance 0.90

0.80::true_val(tgr_buttering, moderate); 0.20::true_val(tgr_buttering, unk_tgr_buttering).
0.85::acc(s_tgr, tgr_buttering).
measured(s_tgr, tgr_buttering, moderate).
all_consistent(tgr_buttering) :- consistent(s_tgr, tgr_buttering).
evidence(all_consistent(tgr_buttering)).
query(true_val(tgr_buttering, moderate)).
query(true_val(tgr_buttering, unk_tgr_buttering)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values medium_snow=Medium_Snow unk_edge_hold=Unknown
% @importance 0.90

0.80::true_val(edge_hold, medium_snow); 0.20::true_val(edge_hold, unk_edge_hold).
0.85::acc(s_tgr, edge_hold).
measured(s_tgr, edge_hold, medium_snow).
all_consistent(edge_hold) :- consistent(s_tgr, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, medium_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v659_95=659.95 v679=679.0 v699_95=699.95
% @importance 0.90

0.42::true_val(price_usd_msrp, v659_95); 0.35::true_val(price_usd_msrp, v679); 0.23::true_val(price_usd_msrp, v699_95).
0.88::acc(s19, price_usd_msrp).
0.80::acc(s_tgr, price_usd_msrp).
measured(s19, price_usd_msrp, v659_95).
measured(s_tgr, price_usd_msrp, v679).
all_consistent(price_usd_msrp) :-
    consistent(s19, price_usd_msrp),
    consistent(s_tgr, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v659_95)).
query(true_val(price_usd_msrp, v679)).
query(true_val(price_usd_msrp, v699_95)).

% @attr price_usd_msrp_2
% @type numeric
% @canonical false
% @original_name price_usd_msrp
% @unit USD
% @values v699_95b=699.95 unk_price_usd_msrp_2=Unknown
% @importance 0.90

0.75::true_val(price_usd_msrp_2, v699_95b); 0.25::true_val(price_usd_msrp_2, unk_price_usd_msrp_2).
0.78::acc(s_tgr, price_usd_msrp_2).
measured(s_tgr, price_usd_msrp_2, v699_95b).
all_consistent(price_usd_msrp_2) :- consistent(s_tgr, price_usd_msrp_2).
evidence(all_consistent(price_usd_msrp_2)).
query(true_val(price_usd_msrp_2, v699_95b)).
query(true_val(price_usd_msrp_2, unk_price_usd_msrp_2)).

% @attr burton_canada_price
% @type numeric
% @canonical false
% @original_name Burton Canada price
% @unit CAD
% @values v889_99=889.99 unk_burton_canada_price=Unknown
% @importance 0.90

0.80::true_val(burton_canada_price, v889_99); 0.20::true_val(burton_canada_price, unk_burton_canada_price).
0.82::acc(s_tgr, burton_canada_price).
measured(s_tgr, burton_canada_price, v889_99).
all_consistent(burton_canada_price) :- consistent(s_tgr, burton_canada_price).
evidence(all_consistent(burton_canada_price)).
query(true_val(burton_canada_price, v889_99)).
query(true_val(burton_canada_price, unk_burton_canada_price)).

% @attr price_aud_merchant_rrp
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v999_99=999.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant_rrp, v999_99); 0.05::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).
0.93::acc(s_merchant, price_aud_merchant_rrp).
measured(s_merchant, price_aud_merchant_rrp, v999_99).
all_consistent(price_aud_merchant_rrp) :-
    (indep(s_merchant), consistent(s_merchant, price_aud_merchant_rrp) ; \+indep(s_merchant)).
evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v999_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v699_99=699.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v699_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
0.93::acc(s_merchant, price_aud_merchant).
measured(s_merchant, price_aud_merchant, v699_99).
all_consistent(price_aud_merchant) :-
    (indep(s_merchant), consistent(s_merchant, price_aud_merchant) ; \+indep(s_merchant)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v699_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v629_96=629.96 unk_price_usd_evo=Unknown
% @importance 0.85

0.88::true_val(price_usd_evo, v629_96); 0.12::true_val(price_usd_evo, unk_price_usd_evo).
0.78::acc(s5, price_usd_evo).
0.82::acc(s_tgr, price_usd_evo).
measured(s5, price_usd_evo, v629_96).
measured(s_tgr, price_usd_evo, v629_96).
all_consistent(price_usd_evo) :-
    (indep(s5), consistent(s5, price_usd_evo) ; \+indep(s5)),
    consistent(s_tgr, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v629_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v524_96=524.96 unk_price_usd_backcountry=Unknown
% @importance 0.90

0.80::true_val(price_usd_backcountry, v524_96); 0.20::true_val(price_usd_backcountry, unk_price_usd_backcountry).
0.82::acc(s_tgr, price_usd_backcountry).
measured(s_tgr, price_usd_backcountry, v524_96).
all_consistent(price_usd_backcountry) :- consistent(s_tgr, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v524_96)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr the_house_sale_price
% @type numeric
% @canonical false
% @original_name The House sale price
% @unit USD
% @values v489_95=489.95 unk_the_house_sale_price=Unknown
% @importance 0.90

0.80::true_val(the_house_sale_price, v489_95); 0.20::true_val(the_house_sale_price, unk_the_house_sale_price).
0.82::acc(s_tgr, the_house_sale_price).
measured(s_tgr, the_house_sale_price, v489_95).
all_consistent(the_house_sale_price) :- consistent(s_tgr, the_house_sale_price).
evidence(all_consistent(the_house_sale_price)).
query(true_val(the_house_sale_price, v489_95)).
query(true_val(the_house_sale_price, unk_the_house_sale_price)).

% @attr the_house_sale_price_alt
% @type numeric
% @canonical false
% @original_name The House sale price (alternate listing)
% @unit USD
% @values v475_95=475.95 unk_the_house_sale_price_alt=Unknown
% @importance 0.90

0.80::true_val(the_house_sale_price_alt, v475_95); 0.20::true_val(the_house_sale_price_alt, unk_the_house_sale_price_alt).
0.82::acc(s_tgr, the_house_sale_price_alt).
measured(s_tgr, the_house_sale_price_alt, v475_95).
all_consistent(the_house_sale_price_alt) :- consistent(s_tgr, the_house_sale_price_alt).
evidence(all_consistent(the_house_sale_price_alt)).
query(true_val(the_house_sale_price_alt, v475_95)).
query(true_val(the_house_sale_price_alt, unk_the_house_sale_price_alt)).

% @attr availability_status_3
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_2025_2026=Available_2025_2026_model unk_availability_status_3=Unknown
% @importance 0.85

0.65::true_val(availability_status_3, available_2025_2026); 0.35::true_val(availability_status_3, unk_availability_status_3).
0.70::acc(s1, availability_status_3).
0.55::acc(s73, availability_status_3).
measured(s1, availability_status_3, available_2025_2026).
measured(s73, availability_status_3, available_2025_2026).
all_consistent(availability_status_3) :-
    consistent(s1, availability_status_3),
    consistent(s73, availability_status_3).
evidence(all_consistent(availability_status_3)).
query(true_val(availability_status_3, available_2025_2026)).
query(true_val(availability_status_3, unk_availability_status_3)).

% @attr availability_status_4
% @type categorical
% @canonical false
% @original_name availability_status
% @values evo_2024_oos_2025_used=2024_OOS_2025_used_629_96 unk_availability_status_4=Unknown
% @importance 0.85

0.78::true_val(availability_status_4, evo_2024_oos_2025_used); 0.22::true_val(availability_status_4, unk_availability_status_4).
0.78::acc(s5, availability_status_4).
measured(s5, availability_status_4, evo_2024_oos_2025_used).
all_consistent(availability_status_4) :-
    (indep(s5), consistent(s5, availability_status_4) ; \+indep(s5)).
evidence(all_consistent(availability_status_4)).
query(true_val(availability_status_4, evo_2024_oos_2025_used)).
query(true_val(availability_status_4, unk_availability_status_4)).

% @attr availability_status_5
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_on_sale=Available_on_sale unk_availability_status_5=Unknown
% @importance 0.90

0.80::true_val(availability_status_5, available_on_sale); 0.20::true_val(availability_status_5, unk_availability_status_5).
0.82::acc(s_tgr, availability_status_5).
measured(s_tgr, availability_status_5, available_on_sale).
all_consistent(availability_status_5) :- consistent(s_tgr, availability_status_5).
evidence(all_consistent(availability_status_5)).
query(true_val(availability_status_5, available_on_sale)).
query(true_val(availability_status_5, unk_availability_status_5)).

% @attr availability_status_6
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_tgr_house=Available unk_availability_status_6=Unknown
% @importance 0.88

0.84::true_val(availability_status_6, available_tgr_house); 0.16::true_val(availability_status_6, unk_availability_status_6).
0.82::acc(s_tgr, availability_status_6).
0.75::acc(s25, availability_status_6).
measured(s_tgr, availability_status_6, available_tgr_house).
measured(s25, availability_status_6, available_tgr_house).
all_consistent(availability_status_6) :-
    consistent(s_tgr, availability_status_6),
    (indep(s25), consistent(s25, availability_status_6) ; \+indep(s25)).
evidence(all_consistent(availability_status_6)).
query(true_val(availability_status_6, available_tgr_house)).
query(true_val(availability_status_6, unk_availability_status_6)).

% @attr availability_status_7
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out_2024_tactics=2024_listed_sold_out unk_availability_status_7=Unknown
% @importance 0.40

0.55::true_val(availability_status_7, sold_out_2024_tactics); 0.45::true_val(availability_status_7, unk_availability_status_7).
0.60::acc(s10, availability_status_7).
measured(s10, availability_status_7, sold_out_2024_tactics).
all_consistent(availability_status_7) :-
    (indep(s10), consistent(s10, availability_status_7) ; \+indep(s10)).
evidence(all_consistent(availability_status_7)).
query(true_val(availability_status_7, sold_out_2024_tactics)).
query(true_val(availability_status_7, unk_availability_status_7)).

% @attr availability_status_8
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_blauer=Listed unk_availability_status_8=Unknown
% @importance 0.90

0.72::true_val(availability_status_8, listed_blauer); 0.28::true_val(availability_status_8, unk_availability_status_8).
0.70::acc(s2, availability_status_8).
measured(s2, availability_status_8, listed_blauer).
all_consistent(availability_status_8) :-
    (indep(s2), consistent(s2, availability_status_8) ; \+indep(s2)).
evidence(all_consistent(availability_status_8)).
query(true_val(availability_status_8, listed_blauer)).
query(true_val(availability_status_8, unk_availability_status_8)).

% @attr availability_status_9
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_saltypeaks=Listed unk_availability_status_9=Unknown
% @importance 0.75

0.70::true_val(availability_status_9, listed_saltypeaks); 0.30::true_val(availability_status_9, unk_availability_status_9).
0.68::acc(s21, availability_status_9).
measured(s21, availability_status_9, listed_saltypeaks).
all_consistent(availability_status_9) :-
    (indep(s21), consistent(s21, availability_status_9) ; \+indep(s21)).
evidence(all_consistent(availability_status_9)).
query(true_val(availability_status_9, listed_saltypeaks)).
query(true_val(availability_status_9, unk_availability_status_9)).

% @attr availability_status_10
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_rudeboys=Listed unk_availability_status_10=Unknown
% @importance 0.70

0.68::true_val(availability_status_10, listed_rudeboys); 0.32::true_val(availability_status_10, unk_availability_status_10).
0.65::acc(s7, availability_status_10).
measured(s7, availability_status_10, listed_rudeboys).
all_consistent(availability_status_10) :-
    (indep(s7), consistent(s7, availability_status_10) ; \+indep(s7)).
evidence(all_consistent(availability_status_10)).
query(true_val(availability_status_10, listed_rudeboys)).
query(true_val(availability_status_10, unk_availability_status_10)).

% @attr availability_status_11
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_gravitee=Listed unk_availability_status_11=Unknown
% @importance 0.80

0.72::true_val(availability_status_11, listed_gravitee); 0.28::true_val(availability_status_11, unk_availability_status_11).
0.70::acc(s40, availability_status_11).
measured(s40, availability_status_11, listed_gravitee).
all_consistent(availability_status_11) :-
    (indep(s40), consistent(s40, availability_status_11) ; \+indep(s40)).
evidence(all_consistent(availability_status_11)).
query(true_val(availability_status_11, listed_gravitee)).
query(true_val(availability_status_11, unk_availability_status_11)).

% @attr availability_status_12
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_skimonster_2025=Listed_2025 unk_availability_status_12=Unknown
% @importance 0.70

0.76::true_val(availability_status_12, listed_skimonster_2025); 0.24::true_val(availability_status_12, unk_availability_status_12).
0.72::acc(s50, availability_status_12).
measured(s50, availability_status_12, listed_skimonster_2025).
all_consistent(availability_status_12) :-
    (indep(s50), consistent(s50, availability_status_12) ; \+indep(s50)).
evidence(all_consistent(availability_status_12)).
query(true_val(availability_status_12, listed_skimonster_2025)).
query(true_val(availability_status_12, unk_availability_status_12)).

% @attr availability_status_13
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_shredshop_2024=Listed_2024 unk_availability_status_13=Unknown
% @importance 0.30

0.48::true_val(availability_status_13, listed_shredshop_2024); 0.52::true_val(availability_status_13, unk_availability_status_13).
0.55::acc(s42, availability_status_13).
measured(s42, availability_status_13, listed_shredshop_2024).
all_consistent(availability_status_13) :-
    (indep(s42), consistent(s42, availability_status_13) ; \+indep(s42)).
evidence(all_consistent(availability_status_13)).
query(true_val(availability_status_13, listed_shredshop_2024)).
query(true_val(availability_status_13, unk_availability_status_13)).

% @attr availability_status_14
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out_merchant=Sold_out unk_availability_status_14=Unknown
% @importance 0.85

0.93::true_val(availability_status_14, sold_out_merchant); 0.07::true_val(availability_status_14, unk_availability_status_14).
0.92::acc(s_merchant, availability_status_14).
measured(s_merchant, availability_status_14, sold_out_merchant).
all_consistent(availability_status_14) :-
    (indep(s_merchant), consistent(s_merchant, availability_status_14) ; \+indep(s_merchant)).
evidence(all_consistent(availability_status_14)).
query(true_val(availability_status_14, sold_out_merchant)).
query(true_val(availability_status_14, unk_availability_status_14)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values whitelines_100=Selected_Whitelines_100_best_2023_24 unk_reviewer_opinion_whitelines=Unknown
% @importance 0.80

0.78::true_val(reviewer_opinion_whitelines, whitelines_100); 0.22::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).
0.82::acc(s15, reviewer_opinion_whitelines).
measured(s15, reviewer_opinion_whitelines, whitelines_100).
all_consistent(reviewer_opinion_whitelines) :- consistent(s15, reviewer_opinion_whitelines).
evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, whitelines_100)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr snowboard_mag_platinum_pick
% @type categorical
% @canonical false
% @original_name Snowboard Magazine Platinum Pick
% @values best_of_24=Named_Best_of_24 unk_snowboard_mag_platinum_pick=Unknown
% @importance 0.90

0.81::true_val(snowboard_mag_platinum_pick, best_of_24); 0.19::true_val(snowboard_mag_platinum_pick, unk_snowboard_mag_platinum_pick).
0.85::acc(s19, snowboard_mag_platinum_pick).
measured(s19, snowboard_mag_platinum_pick, best_of_24).
all_consistent(snowboard_mag_platinum_pick) :- consistent(s19, snowboard_mag_platinum_pick).
evidence(all_consistent(snowboard_mag_platinum_pick)).
query(true_val(snowboard_mag_platinum_pick, best_of_24)).
query(true_val(snowboard_mag_platinum_pick, unk_snowboard_mag_platinum_pick)).

% @attr curated_expert_rating
% @type numeric
% @canonical false
% @original_name Curated.com expert rating
% @unit /5
% @values v4_of_5=4.0 unk_curated_expert_rating=Unknown
% @importance 0.85

0.75::true_val(curated_expert_rating, v4_of_5); 0.25::true_val(curated_expert_rating, unk_curated_expert_rating).
0.80::acc(s12, curated_expert_rating).
measured(s12, curated_expert_rating, v4_of_5).
all_consistent(curated_expert_rating) :- consistent(s12, curated_expert_rating).
evidence(all_consistent(curated_expert_rating)).
query(true_val(curated_expert_rating, v4_of_5)).
query(true_val(curated_expert_rating, unk_curated_expert_rating)).

% @attr evo_field_test
% @type categorical
% @canonical false
% @original_name Evo field test
% @values easy_capable_great_time=Easy_to_ride_capable_great_time unk_evo_field_test=Unknown
% @importance 0.85

0.78::true_val(evo_field_test, easy_capable_great_time); 0.22::true_val(evo_field_test, unk_evo_field_test).
0.80::acc(s3, evo_field_test).
measured(s3, evo_field_test, easy_capable_great_time).
all_consistent(evo_field_test) :- consistent(s3, evo_field_test).
evidence(all_consistent(evo_field_test)).
query(true_val(evo_field_test, easy_capable_great_time)).
query(true_val(evo_field_test, unk_evo_field_test)).

% @attr curated_summary
% @type categorical
% @canonical false
% @original_name Curated.com summary
% @values ideal_powder_float_versatile=Ideal_powder_float_versatile_fun unk_curated_summary=Unknown
% @importance 0.85

0.75::true_val(curated_summary, ideal_powder_float_versatile); 0.25::true_val(curated_summary, unk_curated_summary).
0.78::acc(s9, curated_summary).
0.78::acc(s12, curated_summary).
measured(s9, curated_summary, ideal_powder_float_versatile).
measured(s12, curated_summary, ideal_powder_float_versatile).
all_consistent(curated_summary) :-
    consistent(s9, curated_summary),
    consistent(s12, curated_summary).
evidence(all_consistent(curated_summary)).
query(true_val(curated_summary, ideal_powder_float_versatile)).
query(true_val(curated_summary, unk_curated_summary)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values fun_lively_floaty=Very_fun_lively_floaty_easy_pop_directional_camber unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.90

0.80::true_val(reviewer_opinion_the_good_ride, fun_lively_floaty); 0.20::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.85::acc(s4, reviewer_opinion_the_good_ride).
measured(s4, reviewer_opinion_the_good_ride, fun_lively_floaty).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s4, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, fun_lively_floaty)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr skill_level_recommendation_2
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values progressing_wont_outgrow=Progressing_riders_approachable_wont_outgrow unk_skill_level_recommendation_2=Unknown
% @importance 0.70

0.76::true_val(skill_level_recommendation_2, progressing_wont_outgrow); 0.24::true_val(skill_level_recommendation_2, unk_skill_level_recommendation_2).
0.75::acc(s50, skill_level_recommendation_2).
measured(s50, skill_level_recommendation_2, progressing_wont_outgrow).
all_consistent(skill_level_recommendation_2) :-
    (indep(s50), consistent(s50, skill_level_recommendation_2) ; \+indep(s50)).
evidence(all_consistent(skill_level_recommendation_2)).
query(true_val(skill_level_recommendation_2, progressing_wont_outgrow)).
query(true_val(skill_level_recommendation_2, unk_skill_level_recommendation_2)).

% @attr reviewer_opinion_whitelines_2
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values bridges_gap_cruiser_shred=Bridges_gap_family_cruiser_serious_shred unk_reviewer_opinion_whitelines_2=Unknown
% @importance 0.75

0.76::true_val(reviewer_opinion_whitelines_2, bridges_gap_cruiser_shred); 0.24::true_val(reviewer_opinion_whitelines_2, unk_reviewer_opinion_whitelines_2).
0.80::acc(s26, reviewer_opinion_whitelines_2).
measured(s26, reviewer_opinion_whitelines_2, bridges_gap_cruiser_shred).
all_consistent(reviewer_opinion_whitelines_2) :- consistent(s26, reviewer_opinion_whitelines_2).
evidence(all_consistent(reviewer_opinion_whitelines_2)).
query(true_val(reviewer_opinion_whitelines_2, bridges_gap_cruiser_shred)).
query(true_val(reviewer_opinion_whitelines_2, unk_reviewer_opinion_whitelines_2)).

% @attr king_snow_review
% @type categorical
% @canonical false
% @original_name King Snow review
% @values stoked_fun_playful_all_conditions=Stoked_fun_playful_every_condition unk_king_snow_review=Unknown
% @importance 0.65

0.60::true_val(king_snow_review, stoked_fun_playful_all_conditions); 0.40::true_val(king_snow_review, unk_king_snow_review).
0.65::acc(s56, king_snow_review).
measured(s56, king_snow_review, stoked_fun_playful_all_conditions).
all_consistent(king_snow_review) :- consistent(s56, king_snow_review).
evidence(all_consistent(king_snow_review)).
query(true_val(king_snow_review, stoked_fun_playful_all_conditions)).
query(true_val(king_snow_review, unk_king_snow_review)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values super_fun_turning=Super_fun_turning_experience unk_positive_aspect=Unknown
% @importance 0.90

0.80::true_val(positive_aspect, super_fun_turning); 0.20::true_val(positive_aspect, unk_positive_aspect).
0.85::acc(s_tgr, positive_aspect).
measured(s_tgr, positive_aspect, super_fun_turning).
all_consistent(positive_aspect) :- consistent(s_tgr, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, super_fun_turning)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_2
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values great_pop_ollies_turns=Great_pop_on_ollies_and_turns unk_positive_aspect_2=Unknown
% @importance 0.90

0.80::true_val(positive_aspect_2, great_pop_ollies_turns); 0.20::true_val(positive_aspect_2, unk_positive_aspect_2).
0.85::acc(s_tgr, positive_aspect_2).
measured(s_tgr, positive_aspect_2, great_pop_ollies_turns).
all_consistent(positive_aspect_2) :- consistent(s_tgr, positive_aspect_2).
evidence(all_consistent(positive_aspect_2)).
query(true_val(positive_aspect_2, great_pop_ollies_turns)).
query(true_val(positive_aspect_2, unk_positive_aspect_2)).

% @attr positive_aspect_3
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values taper_doesnt_feel_overly_tapered=Despite_15mm_taper_not_overly_tapered unk_positive_aspect_3=Unknown
% @importance 0.90

0.80::true_val(positive_aspect_3, taper_doesnt_feel_overly_tapered); 0.20::true_val(positive_aspect_3, unk_positive_aspect_3).
0.85::acc(s_tgr, positive_aspect_3).
measured(s_tgr, positive_aspect_3, taper_doesnt_feel_overly_tapered).
all_consistent(positive_aspect_3) :- consistent(s_tgr, positive_aspect_3).
evidence(all_consistent(positive_aspect_3)).
query(true_val(positive_aspect_3, taper_doesnt_feel_overly_tapered)).
query(true_val(positive_aspect_3, unk_positive_aspect_3)).

% @attr positive_aspect_4
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values solid_powder_float=Solid_float_in_powder unk_positive_aspect_4=Unknown
% @importance 0.90

0.80::true_val(positive_aspect_4, solid_powder_float); 0.20::true_val(positive_aspect_4, unk_positive_aspect_4).
0.85::acc(s_tgr, positive_aspect_4).
measured(s_tgr, positive_aspect_4, solid_powder_float).
all_consistent(positive_aspect_4) :- consistent(s_tgr, positive_aspect_4).
evidence(all_consistent(positive_aspect_4)).
query(true_val(positive_aspect_4, solid_powder_float)).
query(true_val(positive_aspect_4, unk_positive_aspect_4)).

% @attr positive_aspect_5
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values soft_for_ft_accessible=Soft_for_Family_Tree_more_accessible unk_positive_aspect_5=Unknown
% @importance 0.90

0.80::true_val(positive_aspect_5, soft_for_ft_accessible); 0.20::true_val(positive_aspect_5, unk_positive_aspect_5).
0.85::acc(s_tgr, positive_aspect_5).
measured(s_tgr, positive_aspect_5, soft_for_ft_accessible).
all_consistent(positive_aspect_5) :- consistent(s_tgr, positive_aspect_5).
evidence(all_consistent(positive_aspect_5)).
query(true_val(positive_aspect_5, soft_for_ft_accessible)).
query(true_val(positive_aspect_5, unk_positive_aspect_5)).

% @attr positive_aspect_6
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values excelled_dry_powder_mellow=Excelled_dry_Utah_powder_mellow_terrain unk_positive_aspect_6=Unknown
% @importance 0.85

0.78::true_val(positive_aspect_6, excelled_dry_powder_mellow); 0.22::true_val(positive_aspect_6, unk_positive_aspect_6).
0.80::acc(s3, positive_aspect_6).
measured(s3, positive_aspect_6, excelled_dry_powder_mellow).
all_consistent(positive_aspect_6) :- consistent(s3, positive_aspect_6).
evidence(all_consistent(positive_aspect_6)).
query(true_val(positive_aspect_6, excelled_dry_powder_mellow)).
query(true_val(positive_aspect_6, unk_positive_aspect_6)).

% @attr positive_aspect_7
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values edge_to_edge_quick_trees=Moved_edge_to_edge_quickly_cruised_trees unk_positive_aspect_7=Unknown
% @importance 0.85

0.78::true_val(positive_aspect_7, edge_to_edge_quick_trees); 0.22::true_val(positive_aspect_7, unk_positive_aspect_7).
0.80::acc(s3, positive_aspect_7).
measured(s3, positive_aspect_7, edge_to_edge_quick_trees).
all_consistent(positive_aspect_7) :- consistent(s3, positive_aspect_7).
evidence(all_consistent(positive_aspect_7)).
query(true_val(positive_aspect_7, edge_to_edge_quick_trees)).
query(true_val(positive_aspect_7, unk_positive_aspect_7)).

% @attr positive_aspect_8
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values camber_stability_speed=Camber_provided_crucial_stability_at_speed unk_positive_aspect_8=Unknown
% @importance 0.85

0.78::true_val(positive_aspect_8, camber_stability_speed); 0.22::true_val(positive_aspect_8, unk_positive_aspect_8).
0.80::acc(s3, positive_aspect_8).
measured(s3, positive_aspect_8, camber_stability_speed).
all_consistent(positive_aspect_8) :- consistent(s3, positive_aspect_8).
evidence(all_consistent(positive_aspect_8)).
query(true_val(positive_aspect_8, camber_stability_speed)).
query(true_val(positive_aspect_8, unk_positive_aspect_8)).

% @attr positive_aspect_9
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values turning_instinctual_powder=Turning_almost_instinctual_in_powder unk_positive_aspect_9=Unknown
% @importance 0.85

0.75::true_val(positive_aspect_9, turning_instinctual_powder); 0.25::true_val(positive_aspect_9, unk_positive_aspect_9).
0.80::acc(s12, positive_aspect_9).
measured(s12, positive_aspect_9, turning_instinctual_powder).
all_consistent(positive_aspect_9) :- consistent(s12, positive_aspect_9).
evidence(all_consistent(positive_aspect_9)).
query(true_val(positive_aspect_9, turning_instinctual_powder)).
query(true_val(positive_aspect_9, unk_positive_aspect_9)).

% @attr positive_aspect_10
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values plows_hard_fast_lines=Unlike_surfier_boards_plows_hard_fast_lines unk_positive_aspect_10=Unknown
% @importance 0.85

0.73::true_val(positive_aspect_10, plows_hard_fast_lines); 0.27::true_val(positive_aspect_10, unk_positive_aspect_10).
0.78::acc(s9, positive_aspect_10).
measured(s9, positive_aspect_10, plows_hard_fast_lines).
all_consistent(positive_aspect_10) :- consistent(s9, positive_aspect_10).
evidence(all_consistent(positive_aspect_10)).
query(true_val(positive_aspect_10, plows_hard_fast_lines)).
query(true_val(positive_aspect_10, unk_positive_aspect_10)).

% @attr positive_aspect_11
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values groomers_grip_energetic=Grips_well_energetic_in_out_of_carve unk_positive_aspect_11=Unknown
% @importance 0.70

0.76::true_val(positive_aspect_11, groomers_grip_energetic); 0.24::true_val(positive_aspect_11, unk_positive_aspect_11).
0.75::acc(s50, positive_aspect_11).
measured(s50, positive_aspect_11, groomers_grip_energetic).
all_consistent(positive_aspect_11) :-
    (indep(s50), consistent(s50, positive_aspect_11) ; \+indep(s50)).
evidence(all_consistent(positive_aspect_11)).
query(true_val(positive_aspect_11, groomers_grip_energetic)).
query(true_val(positive_aspect_11, unk_positive_aspect_11)).

% @attr positive_aspect_12
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values trees_predictable_nimble=Predictable_nimble_compliant_in_trees_chutes unk_positive_aspect_12=Unknown
% @importance 0.70

0.76::true_val(positive_aspect_12, trees_predictable_nimble); 0.24::true_val(positive_aspect_12, unk_positive_aspect_12).
0.75::acc(s50, positive_aspect_12).
measured(s50, positive_aspect_12, trees_predictable_nimble).
all_consistent(positive_aspect_12) :-
    (indep(s50), consistent(s50, positive_aspect_12) ; \+indep(s50)).
evidence(all_consistent(positive_aspect_12)).
query(true_val(positive_aspect_12, trees_predictable_nimble)).
query(true_val(positive_aspect_12, unk_positive_aspect_12)).

% @attr positive_aspect_13
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values firm_edge_carving_not_stiff=Holds_firm_edge_carving_not_too_stiff unk_positive_aspect_13=Unknown
% @importance 0.90

0.81::true_val(positive_aspect_13, firm_edge_carving_not_stiff); 0.19::true_val(positive_aspect_13, unk_positive_aspect_13).
0.83::acc(s19, positive_aspect_13).
measured(s19, positive_aspect_13, firm_edge_carving_not_stiff).
all_consistent(positive_aspect_13) :- consistent(s19, positive_aspect_13).
evidence(all_consistent(positive_aspect_13)).
query(true_val(positive_aspect_13, firm_edge_carving_not_stiff)).
query(true_val(positive_aspect_13, unk_positive_aspect_13)).

% @attr positive_aspect_14
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values very_competent_high_speed=Very_competent_at_higher_speed unk_positive_aspect_14=Unknown
% @importance 0.90

0.80::true_val(positive_aspect_14, very_competent_high_speed); 0.20::true_val(positive_aspect_14, unk_positive_aspect_14).
0.85::acc(s_tgr, positive_aspect_14).
measured(s_tgr, positive_aspect_14, very_competent_high_speed).
all_consistent(positive_aspect_14) :- consistent(s_tgr, positive_aspect_14).
evidence(all_consistent(positive_aspect_14)).
query(true_val(positive_aspect_14, very_competent_high_speed)).
query(true_val(positive_aspect_14, unk_positive_aspect_14)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values base_glide_slow_for_price=Base_glide_slow_for_price unk_negative_aspect=Unknown
% @importance 0.90

0.80::true_val(negative_aspect, base_glide_slow_for_price); 0.20::true_val(negative_aspect, unk_negative_aspect).
0.85::acc(s_tgr, negative_aspect).
measured(s_tgr, negative_aspect, base_glide_slow_for_price).
all_consistent(negative_aspect) :- consistent(s_tgr, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, base_glide_slow_for_price)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_2
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values sizing_huge_jumps=Sizing_huge_jumps_width_weight unk_negative_aspect_2=Unknown
% @importance 0.88

0.82::true_val(negative_aspect_2, sizing_huge_jumps); 0.18::true_val(negative_aspect_2, unk_negative_aspect_2).
0.85::acc(s_tgr, negative_aspect_2).
0.83::acc(s13, negative_aspect_2).
measured(s_tgr, negative_aspect_2, sizing_huge_jumps).
measured(s13, negative_aspect_2, sizing_huge_jumps).
all_consistent(negative_aspect_2) :-
    consistent(s_tgr, negative_aspect_2),
    consistent(s13, negative_aspect_2).
evidence(all_consistent(negative_aspect_2)).
query(true_val(negative_aspect_2, sizing_huge_jumps)).
query(true_val(negative_aspect_2, unk_negative_aspect_2)).

% @attr negative_aspect_3
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values edge_hold_lacks_hard_snow=Edge_hold_lacks_in_hard_snow unk_negative_aspect_3=Unknown
% @importance 0.90

0.80::true_val(negative_aspect_3, edge_hold_lacks_hard_snow); 0.20::true_val(negative_aspect_3, unk_negative_aspect_3).
0.85::acc(s_tgr, negative_aspect_3).
measured(s_tgr, negative_aspect_3, edge_hold_lacks_hard_snow).
all_consistent(negative_aspect_3) :- consistent(s_tgr, negative_aspect_3).
evidence(all_consistent(negative_aspect_3)).
query(true_val(negative_aspect_3, edge_hold_lacks_hard_snow)).
query(true_val(negative_aspect_3, unk_negative_aspect_3)).

% @attr negative_aspect_4
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values bucked_chunder_tracked_out=Gets_bucked_chunder_tracked_out unk_negative_aspect_4=Unknown
% @importance 0.85

0.78::true_val(negative_aspect_4, bucked_chunder_tracked_out); 0.22::true_val(negative_aspect_4, unk_negative_aspect_4).
0.80::acc(s3, negative_aspect_4).
measured(s3, negative_aspect_4, bucked_chunder_tracked_out).
all_consistent(negative_aspect_4) :- consistent(s3, negative_aspect_4).
evidence(all_consistent(negative_aspect_4)).
query(true_val(negative_aspect_4, bucked_chunder_tracked_out)).
query(true_val(negative_aspect_4, unk_negative_aspect_4)).

% @attr negative_aspect_5
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values slower_gentle_slopes=Slower_pace_on_gentler_slopes unk_negative_aspect_5=Unknown
% @importance 0.85

0.73::true_val(negative_aspect_5, slower_gentle_slopes); 0.27::true_val(negative_aspect_5, unk_negative_aspect_5).
0.78::acc(s9, negative_aspect_5).
measured(s9, negative_aspect_5, slower_gentle_slopes).
all_consistent(negative_aspect_5) :- consistent(s9, negative_aspect_5).
evidence(all_consistent(negative_aspect_5)).
query(true_val(negative_aspect_5, slower_gentle_slopes)).
query(true_val(negative_aspect_5, unk_negative_aspect_5)).

% @attr negative_aspect_6
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values struggle_pop_deep_snow=Struggle_to_get_pop_softer_deeper_snow unk_negative_aspect_6=Unknown
% @importance 0.85

0.73::true_val(negative_aspect_6, struggle_pop_deep_snow); 0.27::true_val(negative_aspect_6, unk_negative_aspect_6).
0.78::acc(s9, negative_aspect_6).
measured(s9, negative_aspect_6, struggle_pop_deep_snow).
all_consistent(negative_aspect_6) :- consistent(s9, negative_aspect_6).
evidence(all_consistent(negative_aspect_6)).
query(true_val(negative_aspect_6, struggle_pop_deep_snow)).
query(true_val(negative_aspect_6, unk_negative_aspect_6)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values directional_planky=Felt_directional_and_planky unk_user_review_forum=Unknown
% @importance 0.70

0.50::true_val(user_review_forum, directional_planky); 0.50::true_val(user_review_forum, unk_user_review_forum).
0.55::acc(s54, user_review_forum).
measured(s54, user_review_forum, directional_planky).
all_consistent(user_review_forum) :- consistent(s54, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, directional_planky)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_2
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values too_stiff_beginners=Too_stiff_for_beginner_children unk_user_review_forum_2=Unknown
% @importance 0.65

0.45::true_val(user_review_forum_2, too_stiff_beginners); 0.55::true_val(user_review_forum_2, unk_user_review_forum_2).
0.50::acc(s53, user_review_forum_2).
measured(s53, user_review_forum_2, too_stiff_beginners).
all_consistent(user_review_forum_2) :- consistent(s53, user_review_forum_2).
evidence(all_consistent(user_review_forum_2)).
query(true_val(user_review_forum_2, too_stiff_beginners)).
query(true_val(user_review_forum_2, unk_user_review_forum_2)).

% @attr negative_aspect_7
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values initial_stiff_slow_edge=Initially_stiff_slow_edge_to_edge unk_negative_aspect_7=Unknown
% @importance 0.80

0.76::true_val(negative_aspect_7, initial_stiff_slow_edge); 0.24::true_val(negative_aspect_7, unk_negative_aspect_7).
0.78::acc(s15, negative_aspect_7).
measured(s15, negative_aspect_7, initial_stiff_slow_edge).
all_consistent(negative_aspect_7) :- consistent(s15, negative_aspect_7).
evidence(all_consistent(negative_aspect_7)).
query(true_val(negative_aspect_7, initial_stiff_slow_edge)).
query(true_val(negative_aspect_7, unk_negative_aspect_7)).

% @attr user_review_forum_3
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values factory_edge_bad=Factory_edge_tune_insanely_bad unk_user_review_forum_3=Unknown
% @importance 0.70

0.45::true_val(user_review_forum_3, factory_edge_bad); 0.55::true_val(user_review_forum_3, unk_user_review_forum_3).
0.50::acc(s54, user_review_forum_3).
measured(s54, user_review_forum_3, factory_edge_bad).
all_consistent(user_review_forum_3) :- consistent(s54, user_review_forum_3).
evidence(all_consistent(user_review_forum_3)).
query(true_val(user_review_forum_3, factory_edge_bad)).
query(true_val(user_review_forum_3, unk_user_review_forum_3)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values hometown_hero=Burton_Hometown_Hero_more_snappy_demanding unk_comparable_board_same_brand=Unknown
% @importance 0.78

0.80::true_val(comparable_board_same_brand, hometown_hero); 0.20::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
0.78::acc(s50, comparable_board_same_brand).
0.80::acc(s12, comparable_board_same_brand).
measured(s50, comparable_board_same_brand, hometown_hero).
measured(s12, comparable_board_same_brand, hometown_hero).
all_consistent(comparable_board_same_brand) :-
    (indep(s50), consistent(s50, comparable_board_same_brand) ; \+indep(s50)),
    consistent(s12, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, hometown_hero)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values skeleton_key=Burton_Skeleton_Key_similar_floaty_setback unk_comparable_board_same_brand_2=Unknown
% @importance 0.90

0.80::true_val(comparable_board_same_brand_2, skeleton_key); 0.20::true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2).
0.85::acc(s_tgr, comparable_board_same_brand_2).
measured(s_tgr, comparable_board_same_brand_2, skeleton_key).
all_consistent(comparable_board_same_brand_2) :- consistent(s_tgr, comparable_board_same_brand_2).
evidence(all_consistent(comparable_board_same_brand_2)).
query(true_val(comparable_board_same_brand_2, skeleton_key)).
query(true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2)).

% @attr comparable_board_same_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values custom=Burton_Custom_all_mountain_benchmark unk_comparable_board_same_brand_3=Unknown
% @importance 0.85

0.73::true_val(comparable_board_same_brand_3, custom); 0.27::true_val(comparable_board_same_brand_3, unk_comparable_board_same_brand_3).
0.78::acc(s9, comparable_board_same_brand_3).
measured(s9, comparable_board_same_brand_3, custom).
all_consistent(comparable_board_same_brand_3) :- consistent(s9, comparable_board_same_brand_3).
evidence(all_consistent(comparable_board_same_brand_3)).
query(true_val(comparable_board_same_brand_3, custom)).
query(true_val(comparable_board_same_brand_3, unk_comparable_board_same_brand_3)).

% @attr comparable_board_same_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values flight_attendant=Burton_Flight_Attendant_stiffer_directional unk_comparable_board_same_brand_4=Unknown
% @importance 0.90

0.80::true_val(comparable_board_same_brand_4, flight_attendant); 0.20::true_val(comparable_board_same_brand_4, unk_comparable_board_same_brand_4).
0.85::acc(s_tgr, comparable_board_same_brand_4).
measured(s_tgr, comparable_board_same_brand_4, flight_attendant).
all_consistent(comparable_board_same_brand_4) :- consistent(s_tgr, comparable_board_same_brand_4).
evidence(all_consistent(comparable_board_same_brand_4)).
query(true_val(comparable_board_same_brand_4, flight_attendant)).
query(true_val(comparable_board_same_brand_4, unk_comparable_board_same_brand_4)).

% @attr comparable_board_same_brand_5
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values power_wagon=Burton_Power_Wagon_similar_sizing_issues unk_comparable_board_same_brand_5=Unknown
% @importance 0.90

0.80::true_val(comparable_board_same_brand_5, power_wagon); 0.20::true_val(comparable_board_same_brand_5, unk_comparable_board_same_brand_5).
0.85::acc(s_tgr, comparable_board_same_brand_5).
measured(s_tgr, comparable_board_same_brand_5, power_wagon).
all_consistent(comparable_board_same_brand_5) :- consistent(s_tgr, comparable_board_same_brand_5).
evidence(all_consistent(comparable_board_same_brand_5)).
query(true_val(comparable_board_same_brand_5, power_wagon)).
query(true_val(comparable_board_same_brand_5, unk_comparable_board_same_brand_5)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_frontier=Jones_Frontier unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.73::true_val(comparable_board_cross_brand, jones_frontier); 0.27::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
0.78::acc(s9, comparable_board_cross_brand).
measured(s9, comparable_board_cross_brand, jones_frontier).
all_consistent(comparable_board_cross_brand) :- consistent(s9, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_frontier)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values lib_tech_dynamo=Lib_Tech_Dynamo unk_comparable_board_cross_brand_2=Unknown
% @importance 0.85

0.73::true_val(comparable_board_cross_brand_2, lib_tech_dynamo); 0.27::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).
0.78::acc(s9, comparable_board_cross_brand_2).
measured(s9, comparable_board_cross_brand_2, lib_tech_dynamo).
all_consistent(comparable_board_cross_brand_2) :- consistent(s9, comparable_board_cross_brand_2).
evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, lib_tech_dynamo)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

% @attr comparable_board_cross_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values k2_alchemist=K2_Alchemist unk_comparable_board_cross_brand_3=Unknown
% @importance 0.90

0.80::true_val(comparable_board_cross_brand_3, k2_alchemist); 0.20::true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3).
0.85::acc(s_tgr, comparable_board_cross_brand_3).
measured(s_tgr, comparable_board_cross_brand_3, k2_alchemist).
all_consistent(comparable_board_cross_brand_3) :- consistent(s_tgr, comparable_board_cross_brand_3).
evidence(all_consistent(comparable_board_cross_brand_3)).
query(true_val(comparable_board_cross_brand_3, k2_alchemist)).
query(true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3)).

% @attr comparable_board_cross_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values yes_pyl_uninc=YES_PYL_Uninc unk_comparable_board_cross_brand_4=Unknown
% @importance 0.90

0.80::true_val(comparable_board_cross_brand_4, yes_pyl_uninc); 0.20::true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4).
0.85::acc(s_tgr, comparable_board_cross_brand_4).
measured(s_tgr, comparable_board_cross_brand_4, yes_pyl_uninc).
all_consistent(comparable_board_cross_brand_4) :- consistent(s_tgr, comparable_board_cross_brand_4).
evidence(all_consistent(comparable_board_cross_brand_4)).
query(true_val(comparable_board_cross_brand_4, yes_pyl_uninc)).
query(true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4)).

% @attr sustainability_certification_2
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values super_sap_50_pct_reduction=Super_Sap_Epoxy_50pct_carbon_reduction unk_sustainability_certification_2=Unknown
% @importance 0.80

0.86::true_val(sustainability_certification_2, super_sap_50_pct_reduction); 0.14::true_val(sustainability_certification_2, unk_sustainability_certification_2).
0.72::acc(s2, sustainability_certification_2).
0.68::acc(s7, sustainability_certification_2).
measured(s2, sustainability_certification_2, super_sap_50_pct_reduction).
measured(s7, sustainability_certification_2, super_sap_50_pct_reduction).
all_consistent(sustainability_certification_2) :-
    (indep(s2), consistent(s2, sustainability_certification_2) ; \+indep(s2)),
    (indep(s7), consistent(s7, sustainability_certification_2) ; \+indep(s7)).
evidence(all_consistent(sustainability_certification_2)).
query(true_val(sustainability_certification_2, super_sap_50_pct_reduction)).
query(true_val(sustainability_certification_2, unk_sustainability_certification_2)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values feels_normal=Feels_normal_155cm unk_board_weight_grams=Unknown
% @importance 0.90

0.80::true_val(board_weight_grams, feels_normal); 0.20::true_val(board_weight_grams, unk_board_weight_grams).
0.82::acc(s_tgr, board_weight_grams).
measured(s_tgr, board_weight_grams, feels_normal).
all_consistent(board_weight_grams) :- consistent(s_tgr, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, feels_normal)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_note
% @type categorical
% @canonical false
% @original_name Weight note
% @values no_consistency_wood_cores=No_consistency_in_weight_with_wood_cores unk_weight_note=Unknown
% @importance 0.85

0.80::true_val(weight_note, no_consistency_wood_cores); 0.20::true_val(weight_note, unk_weight_note).
0.83::acc(s13, weight_note).
measured(s13, weight_note, no_consistency_wood_cores).
all_consistent(weight_note) :- consistent(s13, weight_note).
evidence(all_consistent(weight_note)).
query(true_val(weight_note, no_consistency_wood_cores)).
query(true_val(weight_note, unk_weight_note)).

% @attr nickname
% @type categorical
% @canonical false
% @original_name Nickname
% @values the_dad_board=The_Dad_Board unk_nickname=Unknown
% @importance 0.73

0.80::true_val(nickname, the_dad_board); 0.20::true_val(nickname, unk_nickname).
0.80::acc(s3, nickname).
0.82::acc(s11, nickname).
measured(s3, nickname, the_dad_board).
measured(s11, nickname, the_dad_board).
all_consistent(nickname) :-
    consistent(s3, nickname),
    consistent(s11, nickname).
evidence(all_consistent(nickname)).
query(true_val(nickname, the_dad_board)).
query(true_val(nickname, unk_nickname)).

% @attr grilos_quiver_context
% @type categorical
% @canonical false
% @original_name Grilo's quiver context
% @values custom_fish_hometown_hero=Rode_Custom_Fish_Hometown_Hero_wanted_gap_filler unk_grilos_quiver_context=Unknown
% @importance 0.70

0.81::true_val(grilos_quiver_context, custom_fish_hometown_hero); 0.19::true_val(grilos_quiver_context, unk_grilos_quiver_context).
0.85::acc(s23, grilos_quiver_context).
measured(s23, grilos_quiver_context, custom_fish_hometown_hero).
all_consistent(grilos_quiver_context) :- consistent(s23, grilos_quiver_context).
evidence(all_consistent(grilos_quiver_context)).
query(true_val(grilos_quiver_context, custom_fish_hometown_hero)).
query(true_val(grilos_quiver_context, unk_grilos_quiver_context)).