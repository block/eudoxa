0.15::indep(sMERCHANT).
0.25::indep(s7).
0.30::indep(s9).
0.20::indep(s10).
0.30::indep(s11).
0.15::indep(s13).
0.15::indep(s14).
0.15::indep(s32).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 0.90

0.95::acc(s1, brand).
0.90::acc(s2, brand).

0.96::true_val(brand, lib_tech); 0.04::true_val(brand, unk_brand).

measured(s1, brand, lib_tech).
measured(s2, brand, lib_tech).

all_consistent(brand) :-
    consistent(s1, brand),
    consistent(s2, brand).

evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values doughboy=Doughboy unk_model_name=Unknown
% @importance 0.90

0.95::acc(s1, model_name).
0.90::acc(s2, model_name).

0.96::true_val(model_name, doughboy); 0.04::true_val(model_name, unk_model_name).

measured(s1, model_name, doughboy).
measured(s2, model_name, doughboy).

all_consistent(model_name) :-
    consistent(s1, model_name),
    consistent(s2, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, doughboy)).
query(true_val(model_name, unk_model_name)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.60

0.93::acc(s3, manufacturer).
0.93::acc(s4, manufacturer).

0.96::true_val(manufacturer, mervin_manufacturing); 0.04::true_val(manufacturer, unk_manufacturer).

measured(s3, manufacturer, mervin_manufacturing).
measured(s4, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :-
    consistent(s3, manufacturer),
    consistent(s4, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values season_2025_2026=2025_2026_season unk_model_year=Unknown
% @importance 1.0

0.95::acc(s1, model_year).

0.95::true_val(model_year, season_2025_2026); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, season_2025_2026).

all_consistent(model_year) :-
    consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, season_2025_2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_variant_next_season
% @type categorical
% @canonical false
% @original_name Model variant (next season early release)
% @values doughboy_185_2627=Doughboy_185_2026_2027_Early_Release unk_model_variant_next_season=Unknown
% @importance 0.90

0.95::acc(s5, model_variant_next_season).

0.92::true_val(model_variant_next_season, doughboy_185_2627); 0.08::true_val(model_variant_next_season, unk_model_variant_next_season).

measured(s5, model_variant_next_season, doughboy_185_2627).

all_consistent(model_variant_next_season) :-
    consistent(s5, model_variant_next_season).

evidence(all_consistent(model_variant_next_season)).
query(true_val(model_variant_next_season, doughboy_185_2627)).
query(true_val(model_variant_next_season, unk_model_variant_next_season)).

% @attr sku_manufacturer
% @type categorical
% @canonical false
% @original_name SKU (manufacturer)
% @values sku_doughboy=doughboy unk_sku_manufacturer=Unknown
% @importance 1.0

0.95::acc(s1, sku_manufacturer).

0.95::true_val(sku_manufacturer, sku_doughboy); 0.05::true_val(sku_manufacturer, unk_sku_manufacturer).

measured(s1, sku_manufacturer, sku_doughboy).

all_consistent(sku_manufacturer) :-
    consistent(s1, sku_manufacturer).

evidence(all_consistent(sku_manufacturer)).
query(true_val(sku_manufacturer, sku_doughboy)).
query(true_val(sku_manufacturer, unk_sku_manufacturer)).

% @attr sku_merchant
% @type categorical
% @canonical false
% @original_name SKU (merchant)
% @values sku_25sn051_195=25SN051_195 unk_sku_merchant=Unknown
% @importance 0.85

0.88::acc(sMERCHANT, sku_merchant).

0.88::true_val(sku_merchant, sku_25sn051_195); 0.12::true_val(sku_merchant, unk_sku_merchant).

measured(sMERCHANT, sku_merchant, sku_25sn051_195).

all_consistent(sku_merchant) :-
    consistent(sMERCHANT, sku_merchant).

evidence(all_consistent(sku_merchant)).
query(true_val(sku_merchant, sku_25sn051_195)).
query(true_val(sku_merchant, unk_sku_merchant)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values am_directional_twin=All_Mountain_Directional_Twin am_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.93

0.93::acc(s1, board_category).
0.88::acc(s2, board_category).
0.78::acc(sMERCHANT, board_category).

0.60::true_val(board_category, am_directional_twin); 0.35::true_val(board_category, am_freeride); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, am_directional_twin).
measured(s2, board_category, am_directional_twin).
measured(sMERCHANT, board_category, am_freeride).

all_consistent(board_category) :-
    consistent(s1, board_category),
    consistent(s2, board_category),
    (indep(sMERCHANT), consistent(sMERCHANT, board_category) ; \+indep(sMERCHANT)).

evidence(all_consistent(board_category)).
query(true_val(board_category, am_directional_twin)).
query(true_val(board_category, am_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.50

0.88::acc(s6, gender).

0.85::true_val(gender, mens); 0.15::true_val(gender, unk_gender).

measured(s6, gender, mens).

all_consistent(gender) :-
    consistent(s6, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values mike_olson=Mike_Olson unk_graphic_designer_artist=Unknown
% @importance 0.90

0.93::acc(s1, graphic_designer_artist).
0.88::acc(s2, graphic_designer_artist).

0.94::true_val(graphic_designer_artist, mike_olson); 0.06::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s1, graphic_designer_artist, mike_olson).
measured(s2, graphic_designer_artist, mike_olson).

all_consistent(graphic_designer_artist) :-
    consistent(s1, graphic_designer_artist),
    consistent(s2, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, mike_olson)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr graphic_designer_artist_art
% @type categorical
% @canonical false
% @original_name graphic_designer_artist (board art)
% @values mark_gale=Mark_Gale unk_graphic_designer_artist_art=Unknown
% @importance 0.93

0.93::acc(s1, graphic_designer_artist_art).
0.82::acc(s7, graphic_designer_artist_art).

0.95::true_val(graphic_designer_artist_art, mark_gale); 0.05::true_val(graphic_designer_artist_art, unk_graphic_designer_artist_art).

measured(s1, graphic_designer_artist_art, mark_gale).
measured(s7, graphic_designer_artist_art, mark_gale).

all_consistent(graphic_designer_artist_art) :-
    consistent(s1, graphic_designer_artist_art),
    (indep(s7), consistent(s7, graphic_designer_artist_art) ; \+indep(s7)).

evidence(all_consistent(graphic_designer_artist_art)).
query(true_val(graphic_designer_artist_art, mark_gale)).
query(true_val(graphic_designer_artist_art, unk_graphic_designer_artist_art)).

% @attr design_origin
% @type categorical
% @canonical false
% @original_name Design origin
% @values olson_late_1980s=Originally_created_late_1980s_by_Mike_Olson unk_design_origin=Unknown
% @importance 0.90

0.93::acc(s1, design_origin).
0.88::acc(s2, design_origin).

0.94::true_val(design_origin, olson_late_1980s); 0.06::true_val(design_origin, unk_design_origin).

measured(s1, design_origin, olson_late_1980s).
measured(s2, design_origin, olson_late_1980s).

all_consistent(design_origin) :-
    consistent(s1, design_origin),
    consistent(s2, design_origin).

evidence(all_consistent(design_origin)).
query(true_val(design_origin, olson_late_1980s)).
query(true_val(design_origin, unk_design_origin)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values long_camber_fixed_stance=Longer_camber_fixed_width_stance_smoother_ride unk_design_philosophy=Unknown
% @importance 0.80

0.90::acc(s1, design_philosophy).

0.90::true_val(design_philosophy, long_camber_fixed_stance); 0.10::true_val(design_philosophy, unk_design_philosophy).

measured(s1, design_philosophy, long_camber_fixed_stance).

all_consistent(design_philosophy) :-
    consistent(s1, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, long_camber_fixed_stance)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values late_1980s=Late_1980s unk_model_first_available_year=Unknown
% @importance 1.0

0.90::acc(s1, model_first_available_year).

0.90::true_val(model_first_available_year, late_1980s); 0.10::true_val(model_first_available_year, unk_model_first_available_year).

measured(s1, model_first_available_year, late_1980s).

all_consistent(model_first_available_year) :-
    consistent(s1, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, late_1980s)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values season_2018_2019=2018_2019_re_release_195cm unk_redesign_year=Unknown
% @importance 0.58

0.82::acc(s8, redesign_year).

0.80::true_val(redesign_year, season_2018_2019); 0.20::true_val(redesign_year, unk_redesign_year).

measured(s8, redesign_year, season_2018_2019).

all_consistent(redesign_year) :-
    consistent(s8, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, season_2018_2019)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr product_tagline
% @type categorical
% @canonical false
% @original_name Product tagline
% @values long_and_shreddy=LONG_AND_SHREDDY_MODERN_CLASSIC_RESORT_FREESTYLE_ATV unk_product_tagline=Unknown
% @importance 1.0

0.93::acc(s1, product_tagline).

0.93::true_val(product_tagline, long_and_shreddy); 0.07::true_val(product_tagline, unk_product_tagline).

measured(s1, product_tagline, long_and_shreddy).

all_consistent(product_tagline) :-
    consistent(s1, product_tagline).

evidence(all_consistent(product_tagline)).
query(true_val(product_tagline, long_and_shreddy)).
query(true_val(product_tagline, unk_product_tagline)).

% @attr overall_length
% @type numeric
% @unit cm
% @canonical false
% @original_name Overall length
% @values v195=195.0 unk_overall_length=Unknown
% @importance 0.98

0.95::acc(s1, overall_length).
0.82::acc(s7, overall_length).

0.97::true_val(overall_length, v195); 0.03::true_val(overall_length, unk_overall_length).

measured(s1, overall_length, v195).
measured(s7, overall_length, v195).

all_consistent(overall_length) :-
    consistent(s1, overall_length),
    (indep(s7), consistent(s7, overall_length) ; \+indep(s7)).

evidence(all_consistent(overall_length)).
query(true_val(overall_length, v195)).
query(true_val(overall_length, unk_overall_length)).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size
% @values v152=152.0 v135=135.0
% @importance 0.93

0.95::acc(s1, contact_length_size).
0.82::acc(s7, contact_length_size).
0.70::acc(sMERCHANT, contact_length_size).

0.70::true_val(contact_length_size, v152); 0.30::true_val(contact_length_size, v135).

measured(s1, contact_length_size, v152).
measured(s7, contact_length_size, v152).
measured(sMERCHANT, contact_length_size, v135).

all_consistent(contact_length_size) :-
    consistent(s1, contact_length_size),
    (indep(s7), consistent(s7, contact_length_size) ; \+indep(s7)),
    (indep(sMERCHANT), consistent(sMERCHANT, contact_length_size) ; \+indep(sMERCHANT)).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v152)).
query(true_val(contact_length_size, v135)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v9_0=9.0 unk_sidecut_radius_size=Unknown
% @importance 0.98

0.95::acc(s1, sidecut_radius_size).
0.82::acc(s7, sidecut_radius_size).

0.97::true_val(sidecut_radius_size, v9_0); 0.03::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v9_0).
measured(s7, sidecut_radius_size, v9_0).

all_consistent(sidecut_radius_size) :-
    consistent(s1, sidecut_radius_size),
    (indep(s7), consistent(s7, sidecut_radius_size) ; \+indep(s7)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v9_0)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v32_2=32.2 v31_6=31.6
% @importance 0.93

0.95::acc(s1, tip_tail_width_size).
0.82::acc(s7, tip_tail_width_size).
0.65::acc(sMERCHANT, tip_tail_width_size).

0.70::true_val(tip_tail_width_size, v32_2); 0.30::true_val(tip_tail_width_size, v31_6).

measured(s1, tip_tail_width_size, v32_2).
measured(s7, tip_tail_width_size, v32_2).
measured(sMERCHANT, tip_tail_width_size, v31_6).

all_consistent(tip_tail_width_size) :-
    consistent(s1, tip_tail_width_size),
    (indep(s7), consistent(s7, tip_tail_width_size) ; \+indep(s7)),
    (indep(sMERCHANT), consistent(sMERCHANT, tip_tail_width_size) ; \+indep(sMERCHANT)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v32_2)).
query(true_val(tip_tail_width_size, v31_6)).

% @attr waist_width
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (195cm)
% @values v26_1=26.1 unk_waist_width=Unknown
% @importance 0.98

0.95::acc(s1, waist_width).
0.82::acc(s7, waist_width).
0.85::acc(sMERCHANT, waist_width).

0.97::true_val(waist_width, v26_1); 0.03::true_val(waist_width, unk_waist_width).

measured(s1, waist_width, v26_1).
measured(s7, waist_width, v26_1).
measured(sMERCHANT, waist_width, v26_1).

all_consistent(waist_width) :-
    consistent(s1, waist_width),
    (indep(s7), consistent(s7, waist_width) ; \+indep(s7)),
    (indep(sMERCHANT), consistent(sMERCHANT, waist_width) ; \+indep(sMERCHANT)).

evidence(all_consistent(waist_width)).
query(true_val(waist_width, v26_1)).
query(true_val(waist_width, unk_waist_width)).

% @attr surface_area
% @type numeric
% @unit sq_inches
% @canonical false
% @original_name Surface area (195cm)
% @values v840=840.0 unk_surface_area=Unknown
% @importance 0.88

0.95::acc(s1, surface_area).
0.75::acc(s9, surface_area).

0.95::true_val(surface_area, v840); 0.05::true_val(surface_area, unk_surface_area).

measured(s1, surface_area, v840).
measured(s9, surface_area, v840).

all_consistent(surface_area) :-
    consistent(s1, surface_area),
    (indep(s9), consistent(s9, surface_area) ; \+indep(s9)).

evidence(all_consistent(surface_area)).
query(true_val(surface_area, v840)).
query(true_val(surface_area, unk_surface_area)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @values range_20_25_to_25_0=20_25in_to_25_0in_0in_setback unk_stance_width_range_size=Unknown
% @importance 0.98

0.95::acc(s1, stance_width_range_size).
0.82::acc(s7, stance_width_range_size).
0.85::acc(sMERCHANT, stance_width_range_size).

0.97::true_val(stance_width_range_size, range_20_25_to_25_0); 0.03::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, range_20_25_to_25_0).
measured(s7, stance_width_range_size, range_20_25_to_25_0).
measured(sMERCHANT, stance_width_range_size, range_20_25_to_25_0).

all_consistent(stance_width_range_size) :-
    consistent(s1, stance_width_range_size),
    (indep(s7), consistent(s7, stance_width_range_size) ; \+indep(s7)),
    (indep(sMERCHANT), consistent(sMERCHANT, stance_width_range_size) ; \+indep(sMERCHANT)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, range_20_25_to_25_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr setback
% @type numeric
% @unit inches
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 0.93

0.95::acc(s1, setback).
0.85::acc(sMERCHANT, setback).

0.97::true_val(setback, v0); 0.03::true_val(setback, unk_setback).

measured(s1, setback, v0).
measured(sMERCHANT, setback, v0).

all_consistent(setback) :-
    consistent(s1, setback),
    (indep(sMERCHANT), consistent(sMERCHANT, setback) ; \+indep(sMERCHANT)).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v7=7.0 v6=6.0
% @importance 0.93

0.95::acc(s1, flex_rating_10_manufacturer).
0.70::acc(sMERCHANT, flex_rating_10_manufacturer).

0.65::true_val(flex_rating_10_manufacturer, v7); 0.35::true_val(flex_rating_10_manufacturer, v6).

measured(s1, flex_rating_10_manufacturer, v7).
measured(sMERCHANT, flex_rating_10_manufacturer, v6).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s1, flex_rating_10_manufacturer),
    (indep(sMERCHANT), consistent(sMERCHANT, flex_rating_10_manufacturer) ; \+indep(sMERCHANT)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v7)).
query(true_val(flex_rating_10_manufacturer, v6)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_flex=Mid_flex_balanced medium_stiff=Medium_Stiff unk_flex_feel=Unknown
% @importance 0.90

0.75::acc(sMERCHANT, flex_feel).
0.82::acc(s7, flex_feel).

0.40::true_val(flex_feel, mid_flex); 0.55::true_val(flex_feel, medium_stiff); 0.05::true_val(flex_feel, unk_flex_feel).

measured(sMERCHANT, flex_feel, mid_flex).
measured(s7, flex_feel, medium_stiff).

all_consistent(flex_feel) :-
    (indep(sMERCHANT), consistent(sMERCHANT, flex_feel) ; \+indep(sMERCHANT)),
    (indep(s7), consistent(s7, flex_feel) ; \+indep(s7)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_flex)).
query(true_val(flex_feel, medium_stiff)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium=Medium unk_flex_rating_10_evo=Unknown
% @importance 0.85

0.78::acc(s10, flex_rating_10_evo).

0.78::true_val(flex_rating_10_evo, medium); 0.22::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s10, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :-
    (indep(s10), consistent(s10, flex_rating_10_evo) ; \+indep(s10)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values v150_plus_lbs=150_plus_lbs_70_plus_kg unk_recommended_weight_range_size=Unknown
% @importance 0.93

0.95::acc(s1, recommended_weight_range_size).
0.85::acc(sMERCHANT, recommended_weight_range_size).

0.97::true_val(recommended_weight_range_size, v150_plus_lbs); 0.03::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, v150_plus_lbs).
measured(sMERCHANT, recommended_weight_range_size, v150_plus_lbs).

all_consistent(recommended_weight_range_size) :-
    consistent(s1, recommended_weight_range_size),
    (indep(sMERCHANT), consistent(sMERCHANT, recommended_weight_range_size) ; \+indep(sMERCHANT)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v150_plus_lbs)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard=Standard wide=Wide unk_width_options=Unknown
% @importance 0.90

0.78::acc(sMERCHANT, width_options).
0.80::acc(s7, width_options).

0.40::true_val(width_options, standard); 0.50::true_val(width_options, wide); 0.10::true_val(width_options, unk_width_options).

measured(sMERCHANT, width_options, standard).
measured(s7, width_options, wide).

all_consistent(width_options) :-
    (indep(sMERCHANT), consistent(sMERCHANT, width_options) ; \+indep(sMERCHANT)),
    (indep(s7), consistent(s7, width_options) ; \+indep(s7)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, wide)).
query(true_val(width_options, unk_width_options)).

% @attr overall_length_185
% @type numeric
% @unit cm
% @canonical false
% @original_name Overall length (185cm variant)
% @values v185=185.0 unk_overall_length_185=Unknown
% @importance 0.90

0.95::acc(s5, overall_length_185).

0.92::true_val(overall_length_185, v185); 0.08::true_val(overall_length_185, unk_overall_length_185).

measured(s5, overall_length_185, v185).

all_consistent(overall_length_185) :-
    consistent(s5, overall_length_185).

evidence(all_consistent(overall_length_185)).
query(true_val(overall_length_185, v185)).
query(true_val(overall_length_185, unk_overall_length_185)).

% @attr contact_length_size_185
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (185cm)
% @values v135=135.0 unk_contact_length_size_185=Unknown
% @importance 0.90

0.95::acc(s5, contact_length_size_185).

0.92::true_val(contact_length_size_185, v135); 0.08::true_val(contact_length_size_185, unk_contact_length_size_185).

measured(s5, contact_length_size_185, v135).

all_consistent(contact_length_size_185) :-
    consistent(s5, contact_length_size_185).

evidence(all_consistent(contact_length_size_185)).
query(true_val(contact_length_size_185, v135)).
query(true_val(contact_length_size_185, unk_contact_length_size_185)).

% @attr sidecut_radius_size_185
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (185cm)
% @values v9_0=9.0 unk_sidecut_radius_size_185=Unknown
% @importance 0.90

0.95::acc(s5, sidecut_radius_size_185).

0.92::true_val(sidecut_radius_size_185, v9_0); 0.08::true_val(sidecut_radius_size_185, unk_sidecut_radius_size_185).

measured(s5, sidecut_radius_size_185, v9_0).

all_consistent(sidecut_radius_size_185) :-
    consistent(s5, sidecut_radius_size_185).

evidence(all_consistent(sidecut_radius_size_185)).
query(true_val(sidecut_radius_size_185, v9_0)).
query(true_val(sidecut_radius_size_185, unk_sidecut_radius_size_185)).

% @attr tip_tail_width_size_185
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (185cm)
% @values v31_6=31.6 unk_tip_tail_width_size_185=Unknown
% @importance 0.90

0.95::acc(s5, tip_tail_width_size_185).

0.92::true_val(tip_tail_width_size_185, v31_6); 0.08::true_val(tip_tail_width_size_185, unk_tip_tail_width_size_185).

measured(s5, tip_tail_width_size_185, v31_6).

all_consistent(tip_tail_width_size_185) :-
    consistent(s5, tip_tail_width_size_185).

evidence(all_consistent(tip_tail_width_size_185)).
query(true_val(tip_tail_width_size_185, v31_6)).
query(true_val(tip_tail_width_size_185, unk_tip_tail_width_size_185)).

% @attr waist_width_185
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (185cm)
% @values v26_1=26.1 unk_waist_width_185=Unknown
% @importance 0.90

0.95::acc(s5, waist_width_185).

0.92::true_val(waist_width_185, v26_1); 0.08::true_val(waist_width_185, unk_waist_width_185).

measured(s5, waist_width_185, v26_1).

all_consistent(waist_width_185) :-
    consistent(s5, waist_width_185).

evidence(all_consistent(waist_width_185)).
query(true_val(waist_width_185, v26_1)).
query(true_val(waist_width_185, unk_waist_width_185)).

% @attr surface_area_185
% @type numeric
% @unit sq_inches
% @canonical false
% @original_name Surface area (185cm)
% @values v790=790.0 unk_surface_area_185=Unknown
% @importance 0.90

0.95::acc(s5, surface_area_185).

0.92::true_val(surface_area_185, v790); 0.08::true_val(surface_area_185, unk_surface_area_185).

measured(s5, surface_area_185, v790).

all_consistent(surface_area_185) :-
    consistent(s5, surface_area_185).

evidence(all_consistent(surface_area_185)).
query(true_val(surface_area_185, v790)).
query(true_val(surface_area_185, unk_surface_area_185)).

% @attr stance_width_range_size_185
% @type categorical
% @canonical false
% @original_name stance_width_range_size (185cm)
% @values range_20_25_to_25_0_1in=20_25in_to_25_0in_1in_setback unk_stance_width_range_size_185=Unknown
% @importance 0.90

0.95::acc(s5, stance_width_range_size_185).

0.92::true_val(stance_width_range_size_185, range_20_25_to_25_0_1in); 0.08::true_val(stance_width_range_size_185, unk_stance_width_range_size_185).

measured(s5, stance_width_range_size_185, range_20_25_to_25_0_1in).

all_consistent(stance_width_range_size_185) :-
    consistent(s5, stance_width_range_size_185).

evidence(all_consistent(stance_width_range_size_185)).
query(true_val(stance_width_range_size_185, range_20_25_to_25_0_1in)).
query(true_val(stance_width_range_size_185, unk_stance_width_range_size_185)).

% @attr setback_185
% @type numeric
% @unit inches
% @canonical false
% @original_name setback (185cm)
% @values v1=1.0 unk_setback_185=Unknown
% @importance 0.90

0.95::acc(s5, setback_185).

0.92::true_val(setback_185, v1); 0.08::true_val(setback_185, unk_setback_185).

measured(s5, setback_185, v1).

all_consistent(setback_185) :-
    consistent(s5, setback_185).

evidence(all_consistent(setback_185)).
query(true_val(setback_185, v1)).
query(true_val(setback_185, unk_setback_185)).

% @attr flex_rating_10_manufacturer_185
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer (185cm)
% @values v7=7.0 unk_flex_rating_10_manufacturer_185=Unknown
% @importance 0.90

0.95::acc(s5, flex_rating_10_manufacturer_185).

0.92::true_val(flex_rating_10_manufacturer_185, v7); 0.08::true_val(flex_rating_10_manufacturer_185, unk_flex_rating_10_manufacturer_185).

measured(s5, flex_rating_10_manufacturer_185, v7).

all_consistent(flex_rating_10_manufacturer_185) :-
    consistent(s5, flex_rating_10_manufacturer_185).

evidence(all_consistent(flex_rating_10_manufacturer_185)).
query(true_val(flex_rating_10_manufacturer_185, v7)).
query(true_val(flex_rating_10_manufacturer_185, unk_flex_rating_10_manufacturer_185)).

% @attr recommended_weight_range_size_185
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (185cm)
% @values v150_plus_lbs=150_plus_lbs_70_plus_kg unk_recommended_weight_range_size_185=Unknown
% @importance 0.90

0.95::acc(s5, recommended_weight_range_size_185).

0.92::true_val(recommended_weight_range_size_185, v150_plus_lbs); 0.08::true_val(recommended_weight_range_size_185, unk_recommended_weight_range_size_185).

measured(s5, recommended_weight_range_size_185, v150_plus_lbs).

all_consistent(recommended_weight_range_size_185) :-
    consistent(s5, recommended_weight_range_size_185).

evidence(all_consistent(recommended_weight_range_size_185)).
query(true_val(recommended_weight_range_size_185, v150_plus_lbs)).
query(true_val(recommended_weight_range_size_185, unk_recommended_weight_range_size_185)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.98

0.95::acc(s1, shape).
0.82::acc(s7, shape).
0.80::acc(sMERCHANT, shape).

0.97::true_val(shape, directional_twin); 0.03::true_val(shape, unk_shape).

measured(s1, shape, directional_twin).
measured(s7, shape, directional_twin).
measured(sMERCHANT, shape, directional_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s7), consistent(s7, shape) ; \+indep(s7)),
    (indep(sMERCHANT), consistent(sMERCHANT, shape) ; \+indep(sMERCHANT)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c3_camber=C3_Camber unk_camber_type=Unknown
% @importance 0.83

0.80::acc(s10, camber_type).
0.72::acc(s11, camber_type).

0.95::true_val(camber_type, c3_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s10, camber_type, c3_camber).
measured(s11, camber_type, c3_camber).

all_consistent(camber_type) :-
    (indep(s10), consistent(s10, camber_type) ; \+indep(s10)),
    (indep(s11), consistent(s11, camber_type) ; \+indep(s11)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, c3_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values aggressive_camber_zones=Aggressive_dominant_camber_zones_to_contacts_mild_rocker_between_feet unk_camber_description=Unknown
% @importance 0.85

0.82::acc(s10, camber_description).

0.82::true_val(camber_description, aggressive_camber_zones); 0.18::true_val(camber_description, unk_camber_description).

measured(s10, camber_description, aggressive_camber_zones).

all_consistent(camber_description) :-
    (indep(s10), consistent(s10, camber_description) ; \+indep(s10)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, aggressive_camber_zones)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_rocker
% @type categorical
% @canonical false
% @original_name camber_description (rocker element)
% @values subtle_banana=Subtle_Banana_rocker_freestyle_freedom_max_stability unk_camber_description_rocker=Unknown
% @importance 0.85

0.82::acc(s10, camber_description_rocker).

0.82::true_val(camber_description_rocker, subtle_banana); 0.18::true_val(camber_description_rocker, unk_camber_description_rocker).

measured(s10, camber_description_rocker, subtle_banana).

all_consistent(camber_description_rocker) :-
    (indep(s10), consistent(s10, camber_description_rocker) ; \+indep(s10)).

evidence(all_consistent(camber_description_rocker)).
query(true_val(camber_description_rocker, subtle_banana)).
query(true_val(camber_description_rocker, unk_camber_description_rocker)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values aggressive_skilled=Aggressive_skilled_expert_riders unk_skill_level_recommendation=Unknown
% @importance 0.80

0.80::acc(s10, skill_level_recommendation).
0.75::acc(s9, skill_level_recommendation).

0.92::true_val(skill_level_recommendation, aggressive_skilled); 0.08::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s10, skill_level_recommendation, aggressive_skilled).
measured(s9, skill_level_recommendation, aggressive_skilled).

all_consistent(skill_level_recommendation) :-
    (indep(s10), consistent(s10, skill_level_recommendation) ; \+indep(s10)),
    (indep(s9), consistent(s9, skill_level_recommendation) ; \+indep(s9)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, aggressive_skilled)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr pro_rider_name
% @type categorical
% @canonical false
% @original_name pro_rider_name
% @values ejack_jamie_fredi=EJack_Jamie_Lynn_Fredi_K unk_pro_rider_name=Unknown
% @importance 0.85

0.80::acc(s10, pro_rider_name).

0.80::true_val(pro_rider_name, ejack_jamie_fredi); 0.20::true_val(pro_rider_name, unk_pro_rider_name).

measured(s10, pro_rider_name, ejack_jamie_fredi).

all_consistent(pro_rider_name) :-
    (indep(s10), consistent(s10, pro_rider_name) ; \+indep(s10)).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, ejack_jamie_fredi)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_paulownia=Aspen_and_Paulownia_wood unk_core_material=Unknown
% @importance 0.98

0.95::acc(s1, core_material).
0.82::acc(s7, core_material).

0.97::true_val(core_material, aspen_paulownia); 0.03::true_val(core_material, unk_core_material).

measured(s1, core_material, aspen_paulownia).
measured(s7, core_material, aspen_paulownia).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s7), consistent(s7, core_material) ; \+indep(s7)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_blend_ratio
% @type categorical
% @canonical true
% @original_name core_material_blend_ratio
% @values v75_25=75pct_Aspen_25pct_Paulownia v60_40=60pct_Aspen_40pct_Paulownia
% @importance 0.78

0.82::acc(s7, core_material_blend_ratio).
0.78::acc(sMERCHANT, core_material_blend_ratio).
0.78::acc(s12, core_material_blend_ratio).

0.65::true_val(core_material_blend_ratio, v75_25); 0.35::true_val(core_material_blend_ratio, v60_40).

measured(s7, core_material_blend_ratio, v75_25).
measured(sMERCHANT, core_material_blend_ratio, v75_25).
measured(s12, core_material_blend_ratio, v60_40).

all_consistent(core_material_blend_ratio) :-
    (indep(s7), consistent(s7, core_material_blend_ratio) ; \+indep(s7)),
    (indep(sMERCHANT), consistent(sMERCHANT, core_material_blend_ratio) ; \+indep(sMERCHANT)),
    (indep(s12), consistent(s12, core_material_blend_ratio) ; \+indep(s12)).

evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, v75_25)).
query(true_val(core_material_blend_ratio, v60_40)).

0.20::indep(s12).

% @attr core_construction_name
% @type categorical
% @canonical false
% @original_name Core construction name
% @values opp=Original_Power_Pop_Construction unk_core_construction_name=Unknown
% @importance 0.95

0.82::acc(s7, core_construction_name).

0.82::true_val(core_construction_name, opp); 0.18::true_val(core_construction_name, unk_core_construction_name).

measured(s7, core_construction_name, opp).

all_consistent(core_construction_name) :-
    (indep(s7), consistent(s7, core_construction_name) ; \+indep(s7)).

evidence(all_consistent(core_construction_name)).
query(true_val(core_construction_name, opp)).
query(true_val(core_construction_name, unk_core_construction_name)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_mag_carbon=Tri_Ax_Glass_Magnesium_Techno_Fiber_Bands_and_Carbon unk_laminate=Unknown
% @importance 0.85

0.82::acc(s7, laminate).
0.80::acc(sMERCHANT, laminate).

0.94::true_val(laminate, triax_mag_carbon); 0.06::true_val(laminate, unk_laminate).

measured(s7, laminate, triax_mag_carbon).
measured(sMERCHANT, laminate, triax_mag_carbon).

all_consistent(laminate) :-
    (indep(s7), consistent(s7, laminate) ; \+indep(s7)),
    (indep(sMERCHANT), consistent(sMERCHANT, laminate) ; \+indep(sMERCHANT)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_mag_carbon)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_angles
% @type categorical
% @canonical false
% @original_name laminate (angles)
% @values triax_0_45_neg45=0_45_neg45_Tri_Ax unk_laminate_angles=Unknown
% @importance 0.85

0.80::acc(sMERCHANT, laminate_angles).

0.80::true_val(laminate_angles, triax_0_45_neg45); 0.20::true_val(laminate_angles, unk_laminate_angles).

measured(sMERCHANT, laminate_angles, triax_0_45_neg45).

all_consistent(laminate_angles) :-
    (indep(sMERCHANT), consistent(sMERCHANT, laminate_angles) ; \+indep(sMERCHANT)).

evidence(all_consistent(laminate_angles)).
query(true_val(laminate_angles, triax_0_45_neg45)).
query(true_val(laminate_angles, unk_laminate_angles)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values mag_techno_fiber=High_magnesium_glass_fiber_high_tensile_strength unk_construction_material_innovation=Unknown
% @importance 0.75

0.72::acc(s13, construction_material_innovation).

0.72::true_val(construction_material_innovation, mag_techno_fiber); 0.28::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s13, construction_material_innovation, mag_techno_fiber).

all_consistent(construction_material_innovation) :-
    (indep(s13), consistent(s13, construction_material_innovation) ; \+indep(s13)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, mag_techno_fiber)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_carbon
% @type categorical
% @canonical false
% @original_name construction_material_innovation (carbon additives)
% @values carbon_with_mag=Carbon_additives_with_magnesium_fiber_bands unk_construction_material_innovation_carbon=Unknown
% @importance 0.90

0.93::acc(s1, construction_material_innovation_carbon).
0.82::acc(s7, construction_material_innovation_carbon).
0.80::acc(sMERCHANT, construction_material_innovation_carbon).

0.96::true_val(construction_material_innovation_carbon, carbon_with_mag); 0.04::true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon).

measured(s1, construction_material_innovation_carbon, carbon_with_mag).
measured(s7, construction_material_innovation_carbon, carbon_with_mag).
measured(sMERCHANT, construction_material_innovation_carbon, carbon_with_mag).

all_consistent(construction_material_innovation_carbon) :-
    consistent(s1, construction_material_innovation_carbon),
    (indep(s7), consistent(s7, construction_material_innovation_carbon) ; \+indep(s7)),
    (indep(sMERCHANT), consistent(sMERCHANT, construction_material_innovation_carbon) ; \+indep(sMERCHANT)).

evidence(all_consistent(construction_material_innovation_carbon)).
query(true_val(construction_material_innovation_carbon, carbon_with_mag)).
query(true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch_internal=Birch_Internal_Sidewalls_vertical_end_grain_pop_durability unk_sidewall_material=Unknown
% @importance 0.95

0.82::acc(s7, sidewall_material).

0.82::true_val(sidewall_material, birch_internal); 0.18::true_val(sidewall_material, unk_sidewall_material).

measured(s7, sidewall_material, birch_internal).

all_consistent(sidewall_material) :-
    (indep(s7), consistent(s7, sidewall_material) ; \+indep(s7)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_internal)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_reinforcement
% @type categorical
% @canonical false
% @original_name sidewall_material (reinforcement)
% @values six_ply=Extremely_rugged_high_impact_6_ply_sidewall_reinforcement unk_sidewall_material_reinforcement=Unknown
% @importance 0.75

0.72::acc(s13, sidewall_material_reinforcement).

0.72::true_val(sidewall_material_reinforcement, six_ply); 0.28::true_val(sidewall_material_reinforcement, unk_sidewall_material_reinforcement).

measured(s13, sidewall_material_reinforcement, six_ply).

all_consistent(sidewall_material_reinforcement) :-
    (indep(s13), consistent(s13, sidewall_material_reinforcement) ; \+indep(s13)).

evidence(all_consistent(sidewall_material_reinforcement)).
query(true_val(sidewall_material_reinforcement, six_ply)).
query(true_val(sidewall_material_reinforcement, unk_sidewall_material_reinforcement)).

% @attr sidewall_material_uhmw
% @type categorical
% @canonical false
% @original_name sidewall_material (UHMW sintered)
% @values uhmw_sintered=UHMW_Sintered_Sidewalls unk_sidewall_material_uhmw=Unknown
% @importance 0.90

0.82::acc(s7, sidewall_material_uhmw).
0.80::acc(sMERCHANT, sidewall_material_uhmw).

0.94::true_val(sidewall_material_uhmw, uhmw_sintered); 0.06::true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw).

measured(s7, sidewall_material_uhmw, uhmw_sintered).
measured(sMERCHANT, sidewall_material_uhmw, uhmw_sintered).

all_consistent(sidewall_material_uhmw) :-
    (indep(s7), consistent(s7, sidewall_material_uhmw) ; \+indep(s7)),
    (indep(sMERCHANT), consistent(sMERCHANT, sidewall_material_uhmw) ; \+indep(sMERCHANT)).

evidence(all_consistent(sidewall_material_uhmw)).
query(true_val(sidewall_material_uhmw, uhmw_sintered)).
query(true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw)).

% @attr sidewall_material_sintered_desc
% @type categorical
% @canonical false
% @original_name sidewall_material (sintered description)
% @values twice_sintered=Twice_as_sintered_as_most_industry_sidewalls unk_sidewall_material_sintered_desc=Unknown
% @importance 0.95

0.80::acc(s7, sidewall_material_sintered_desc).

0.80::true_val(sidewall_material_sintered_desc, twice_sintered); 0.20::true_val(sidewall_material_sintered_desc, unk_sidewall_material_sintered_desc).

measured(s7, sidewall_material_sintered_desc, twice_sintered).

all_consistent(sidewall_material_sintered_desc) :-
    (indep(s7), consistent(s7, sidewall_material_sintered_desc) ; \+indep(s7)).

evidence(all_consistent(sidewall_material_sintered_desc)).
query(true_val(sidewall_material_sintered_desc, twice_sintered)).
query(true_val(sidewall_material_sintered_desc, unk_sidewall_material_sintered_desc)).

% @attr sidewall_material_molecular
% @type categorical
% @canonical false
% @original_name sidewall_material (molecular description)
% @values long_molecular_chains=Long_molecular_chains_impact_resistance_smooth_damp unk_sidewall_material_molecular=Unknown
% @importance 0.75

0.72::acc(s13, sidewall_material_molecular).

0.72::true_val(sidewall_material_molecular, long_molecular_chains); 0.28::true_val(sidewall_material_molecular, unk_sidewall_material_molecular).

measured(s13, sidewall_material_molecular, long_molecular_chains).

all_consistent(sidewall_material_molecular) :-
    (indep(s13), consistent(s13, sidewall_material_molecular) ; \+indep(s13)).

evidence(all_consistent(sidewall_material_molecular)).
query(true_val(sidewall_material_molecular, long_molecular_chains)).
query(true_val(sidewall_material_molecular, unk_sidewall_material_molecular)).

% @attr construction_material_innovation_tiptail
% @type categorical
% @canonical false
% @original_name construction_material_innovation (UHMW tip/tail)
% @values uhmw_tiptail=UHMW_Tip_Tail_Impact_Deflection unk_construction_material_innovation_tiptail=Unknown
% @importance 0.80

0.82::acc(s7, construction_material_innovation_tiptail).
0.72::acc(s13, construction_material_innovation_tiptail).
0.80::acc(sMERCHANT, construction_material_innovation_tiptail).

0.95::true_val(construction_material_innovation_tiptail, uhmw_tiptail); 0.05::true_val(construction_material_innovation_tiptail, unk_construction_material_innovation_tiptail).

measured(s7, construction_material_innovation_tiptail, uhmw_tiptail).
measured(s13, construction_material_innovation_tiptail, uhmw_tiptail).
measured(sMERCHANT, construction_material_innovation_tiptail, uhmw_tiptail).

all_consistent(construction_material_innovation_tiptail) :-
    (indep(s7), consistent(s7, construction_material_innovation_tiptail) ; \+indep(s7)),
    (indep(s13), consistent(s13, construction_material_innovation_tiptail) ; \+indep(s13)),
    (indep(sMERCHANT), consistent(sMERCHANT, construction_material_innovation_tiptail) ; \+indep(sMERCHANT)).

evidence(all_consistent(construction_material_innovation_tiptail)).
query(true_val(construction_material_innovation_tiptail, uhmw_tiptail)).
query(true_val(construction_material_innovation_tiptail, unk_construction_material_innovation_tiptail)).

% @attr construction_material_innovation_spinweight
% @type categorical
% @canonical false
% @original_name construction_material_innovation (spin weight)
% @values minimize_spin_weight=Minimize_tip_and_tail_spin_weight unk_construction_material_innovation_spinweight=Unknown
% @importance 0.75

0.72::acc(s13, construction_material_innovation_spinweight).

0.72::true_val(construction_material_innovation_spinweight, minimize_spin_weight); 0.28::true_val(construction_material_innovation_spinweight, unk_construction_material_innovation_spinweight).

measured(s13, construction_material_innovation_spinweight, minimize_spin_weight).

all_consistent(construction_material_innovation_spinweight) :-
    (indep(s13), consistent(s13, construction_material_innovation_spinweight) ; \+indep(s13)).

evidence(all_consistent(construction_material_innovation_spinweight)).
query(true_val(construction_material_innovation_spinweight, minimize_spin_weight)).
query(true_val(construction_material_innovation_spinweight, unk_construction_material_innovation_spinweight)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Top_Sheet unk_topsheet=Unknown
% @importance 0.90

0.82::acc(s7, topsheet).
0.80::acc(sMERCHANT, topsheet).

0.94::true_val(topsheet, eco_sublimated_poly); 0.06::true_val(topsheet, unk_topsheet).

measured(s7, topsheet, eco_sublimated_poly).
measured(sMERCHANT, topsheet, eco_sublimated_poly).

all_consistent(topsheet) :-
    (indep(s7), consistent(s7, topsheet) ; \+indep(s7)),
    (indep(sMERCHANT), consistent(sMERCHANT, topsheet) ; \+indep(sMERCHANT)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values sublimated_polyester_vibrant=Sublimated_polyester_vibrant_durable_graphics unk_topsheet_appearance_description=Unknown
% @importance 0.95

0.80::acc(s7, topsheet_appearance_description).

0.80::true_val(topsheet_appearance_description, sublimated_polyester_vibrant); 0.20::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s7, topsheet_appearance_description, sublimated_polyester_vibrant).

all_consistent(topsheet_appearance_description) :-
    (indep(s7), consistent(s7, topsheet_appearance_description) ; \+indep(s7)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, sublimated_polyester_vibrant)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values eco_sublimated_tnt=Eco_Sublimated_TNT_Base unk_base_material=Unknown
% @importance 0.93

0.93::acc(s1, base_material).
0.80::acc(sMERCHANT, base_material).

0.95::true_val(base_material, eco_sublimated_tnt); 0.05::true_val(base_material, unk_base_material).

measured(s1, base_material, eco_sublimated_tnt).
measured(sMERCHANT, base_material, eco_sublimated_tnt).

all_consistent(base_material) :-
    consistent(s1, base_material),
    (indep(sMERCHANT), consistent(sMERCHANT, base_material) ; \+indep(sMERCHANT)).

evidence(all_consistent(base_material)).
query(true_val(base_material, eco_sublimated_tnt)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values uhmw_dual_layer_titanium=UHMW_dual_layer_thermal_fusion_titanium unk_base_type=Unknown
% @importance 0.85

0.80::acc(sMERCHANT, base_type).

0.80::true_val(base_type, uhmw_dual_layer_titanium); 0.20::true_val(base_type, unk_base_type).

measured(sMERCHANT, base_type, uhmw_dual_layer_titanium).

all_consistent(base_type) :-
    (indep(sMERCHANT), consistent(sMERCHANT, base_type) ; \+indep(sMERCHANT)).

evidence(all_consistent(base_type)).
query(true_val(base_type, uhmw_dual_layer_titanium)).
query(true_val(base_type, unk_base_type)).

% @attr base_material_density
% @type categorical
% @canonical false
% @original_name base_material (density claim)
% @values highest_density_uhmw=Highest_density_UHMW_fastest_base_without_wax unk_base_material_density=Unknown
% @importance 0.75

0.72::acc(s13, base_material_density).

0.72::true_val(base_material_density, highest_density_uhmw); 0.28::true_val(base_material_density, unk_base_material_density).

measured(s13, base_material_density, highest_density_uhmw).

all_consistent(base_material_density) :-
    (indep(s13), consistent(s13, base_material_density) ; \+indep(s13)).

evidence(all_consistent(base_material_density)).
query(true_val(base_material_density, highest_density_uhmw)).
query(true_val(base_material_density, unk_base_material_density)).

% @attr base_material_process
% @type categorical
% @canonical false
% @original_name base_material (process)
% @values dual_layer_thermal_fusion=Dual_layer_thermal_fusion_phase_alteration_crystalline unk_base_material_process=Unknown
% @importance 0.75

0.72::acc(s13, base_material_process).

0.72::true_val(base_material_process, dual_layer_thermal_fusion); 0.28::true_val(base_material_process, unk_base_material_process).

measured(s13, base_material_process, dual_layer_thermal_fusion).

all_consistent(base_material_process) :-
    (indep(s13), consistent(s13, base_material_process) ; \+indep(s13)).

evidence(all_consistent(base_material_process)).
query(true_val(base_material_process, dual_layer_thermal_fusion)).
query(true_val(base_material_process, unk_base_material_process)).

% @attr base_material_thermal
% @type categorical
% @canonical false
% @original_name base_material (thermal properties)
% @values reflects_light_heat=Reflects_light_heat_keeps_base_near_snow_temp unk_base_material_thermal=Unknown
% @importance 0.65

0.70::acc(s14, base_material_thermal).

0.68::true_val(base_material_thermal, reflects_light_heat); 0.32::true_val(base_material_thermal, unk_base_material_thermal).

measured(s14, base_material_thermal, reflects_light_heat).

all_consistent(base_material_thermal) :-
    (indep(s14), consistent(s14, base_material_thermal) ; \+indep(s14)).

evidence(all_consistent(base_material_thermal)).
query(true_val(base_material_thermal, reflects_light_heat)).
query(true_val(base_material_thermal, unk_base_material_thermal)).

% @attr base_wax_requirement
% @type categorical
% @canonical false
% @original_name Base wax requirement
% @values wax_normal_stays_fast=Wax_to_conditions_remains_fast_as_wax_wears unk_base_wax_requirement=Unknown
% @importance 0.65

0.70::acc(s14, base_wax_requirement).

0.68::true_val(base_wax_requirement, wax_normal_stays_fast); 0.32::true_val(base_wax_requirement, unk_base_wax_requirement).

measured(s14, base_wax_requirement, wax_normal_stays_fast).

all_consistent(base_wax_requirement) :-
    (indep(s14), consistent(s14, base_wax_requirement) ; \+indep(s14)).

evidence(all_consistent(base_wax_requirement)).
query(true_val(base_wax_requirement, wax_normal_stays_fast)).
query(true_val(base_wax_requirement, unk_base_wax_requirement)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction=Magne_Traction_serrated_edges unk_edge_technology=Unknown
% @importance 0.90

0.82::acc(s7, edge_technology).
0.80::acc(sMERCHANT, edge_technology).

0.94::true_val(edge_technology, magne_traction); 0.06::true_val(edge_technology, unk_edge_technology).

measured(s7, edge_technology, magne_traction).
measured(sMERCHANT, edge_technology, magne_traction).

all_consistent(edge_technology) :-
    (indep(s7), consistent(s7, edge_technology) ; \+indep(s7)),
    (indep(sMERCHANT), consistent(sMERCHANT, edge_technology) ; \+indep(sMERCHANT)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_technology_description
% @type categorical
% @canonical false
% @original_name edge_technology (description)
% @values strategic_bumps_grip=Strategically_placed_bumps_added_contact_points_grip unk_edge_technology_description=Unknown
% @importance 0.95

0.80::acc(s7, edge_technology_description).

0.80::true_val(edge_technology_description, strategic_bumps_grip); 0.20::true_val(edge_technology_description, unk_edge_technology_description).

measured(s7, edge_technology_description, strategic_bumps_grip).

all_consistent(edge_technology_description) :-
    (indep(s7), consistent(s7, edge_technology_description) ; \+indep(s7)).

evidence(all_consistent(edge_technology_description)).
query(true_val(edge_technology_description, strategic_bumps_grip)).
query(true_val(edge_technology_description, unk_edge_technology_description)).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.80::acc(sMERCHANT, mounting_pattern).

0.80::true_val(mounting_pattern, inserts_2x4); 0.20::true_val(mounting_pattern, unk_mounting_pattern).

measured(sMERCHANT, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(sMERCHANT), consistent(sMERCHANT, mounting_pattern) ; \+indep(sMERCHANT)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values handbuilt_usa=Handbuilt_in_the_USA unk_manufacturing_location_current=Unknown
% @importance 0.83

0.82::acc(s7, manufacturing_location_current).
0.90::acc(s15, manufacturing_location_current).

0.95::true_val(manufacturing_location_current, handbuilt_usa); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s7, manufacturing_location_current, handbuilt_usa).
measured(s15, manufacturing_location_current, handbuilt_usa).

all_consistent(manufacturing_location_current) :-
    (indep(s7), consistent(s7, manufacturing_location_current) ; \+indep(s7)),
    consistent(s15, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, handbuilt_usa)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturing_location_current_specific
% @type categorical
% @canonical false
% @original_name manufacturing_location_current (specific)
% @values carlsborg_sequim_wa=Carlsborg_Sequim_Washington_USA unk_manufacturing_location_current_specific=Unknown
% @importance 0.70

0.90::acc(s15, manufacturing_location_current_specific).

0.90::true_val(manufacturing_location_current_specific, carlsborg_sequim_wa); 0.10::true_val(manufacturing_location_current_specific, unk_manufacturing_location_current_specific).

measured(s15, manufacturing_location_current_specific, carlsborg_sequim_wa).

all_consistent(manufacturing_location_current_specific) :-
    consistent(s15, manufacturing_location_current_specific).

evidence(all_consistent(manufacturing_location_current_specific)).
query(true_val(manufacturing_location_current_specific, carlsborg_sequim_wa)).
query(true_val(manufacturing_location_current_specific, unk_manufacturing_location_current_specific)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_hazardous_waste=Zero_hazardous_waste_producing_factory unk_sustainability_certification=Unknown
% @importance 0.58

0.90::acc(s15, sustainability_certification).
0.86::acc(s16, sustainability_certification).
0.83::acc(s17, sustainability_certification).

0.96::true_val(sustainability_certification, zero_hazardous_waste); 0.04::true_val(sustainability_certification, unk_sustainability_certification).

measured(s15, sustainability_certification, zero_hazardous_waste).
measured(s16, sustainability_certification, zero_hazardous_waste).
measured(s17, sustainability_certification, zero_hazardous_waste).

all_consistent(sustainability_certification) :-
    consistent(s15, sustainability_certification),
    consistent(s16, sustainability_certification),
    consistent(s17, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_hazardous_waste)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_materials
% @type categorical
% @canonical false
% @original_name sustainability_certification (materials)
% @values safest_epoxy_citrus_farmed_wood=Safest_epoxy_no_solvents_citrus_cleaners_farmed_wood unk_sustainability_certification_materials=Unknown
% @importance 0.50

0.83::acc(s17, sustainability_certification_materials).

0.83::true_val(sustainability_certification_materials, safest_epoxy_citrus_farmed_wood); 0.17::true_val(sustainability_certification_materials, unk_sustainability_certification_materials).

measured(s17, sustainability_certification_materials, safest_epoxy_citrus_farmed_wood).

all_consistent(sustainability_certification_materials) :-
    consistent(s17, sustainability_certification_materials).

evidence(all_consistent(sustainability_certification_materials)).
query(true_val(sustainability_certification_materials, safest_epoxy_citrus_farmed_wood)).
query(true_val(sustainability_certification_materials, unk_sustainability_certification_materials)).

% @attr sustainability_certification_topsheet
% @type categorical
% @canonical false
% @original_name sustainability_certification (topsheet)
% @values no_toxic_lacquer=Eliminates_toxic_automotive_lacquer_gloss_coats unk_sustainability_certification_topsheet=Unknown
% @importance 0.50

0.83::acc(s17, sustainability_certification_topsheet).

0.83::true_val(sustainability_certification_topsheet, no_toxic_lacquer); 0.17::true_val(sustainability_certification_topsheet, unk_sustainability_certification_topsheet).

measured(s17, sustainability_certification_topsheet, no_toxic_lacquer).

all_consistent(sustainability_certification_topsheet) :-
    consistent(s17, sustainability_certification_topsheet).

evidence(all_consistent(sustainability_certification_topsheet)).
query(true_val(sustainability_certification_topsheet, no_toxic_lacquer)).
query(true_val(sustainability_certification_topsheet, unk_sustainability_certification_topsheet)).

% @attr sustainability_certification_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycling)
% @values recycle_scrap=Recycle_all_scrap_wood_sawdust_plastic_base unk_sustainability_certification_recycling=Unknown
% @importance 0.50

0.83::acc(s17, sustainability_certification_recycling).

0.83::true_val(sustainability_certification_recycling, recycle_scrap); 0.17::true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling).

measured(s17, sustainability_certification_recycling, recycle_scrap).

all_consistent(sustainability_certification_recycling) :-
    consistent(s17, sustainability_certification_recycling).

evidence(all_consistent(sustainability_certification_recycling)).
query(true_val(sustainability_certification_recycling, recycle_scrap)).
query(true_val(sustainability_certification_recycling, unk_sustainability_certification_recycling)).

% @attr sustainability_certification_energy
% @type categorical
% @canonical false
% @original_name sustainability_certification (energy)
% @values green_power_pud=Green_power_contracted_from_local_PUD unk_sustainability_certification_energy=Unknown
% @importance 0.50

0.83::acc(s17, sustainability_certification_energy).

0.83::true_val(sustainability_certification_energy, green_power_pud); 0.17::true_val(sustainability_certification_energy, unk_sustainability_certification_energy).

measured(s17, sustainability_certification_energy, green_power_pud).

all_consistent(sustainability_certification_energy) :-
    consistent(s17, sustainability_certification_energy).

evidence(all_consistent(sustainability_certification_energy)).
query(true_val(sustainability_certification_energy, green_power_pud)).
query(true_val(sustainability_certification_energy, unk_sustainability_certification_energy)).

% @attr factory_heritage
% @type categorical
% @canonical false
% @original_name Factory heritage
% @values founded_1977_olson_saari=Founded_by_Mike_Olson_and_Pete_Saari_1977 unk_factory_heritage=Unknown
% @importance 0.70

0.90::acc(s15, factory_heritage).

0.90::true_val(factory_heritage, founded_1977_olson_saari); 0.10::true_val(factory_heritage, unk_factory_heritage).

measured(s15, factory_heritage, founded_1977_olson_saari).

all_consistent(factory_heritage) :-
    consistent(s15, factory_heritage).

evidence(all_consistent(factory_heritage)).
query(true_val(factory_heritage, founded_1977_olson_saari)).
query(true_val(factory_heritage, unk_factory_heritage)).

% @attr factory_distinction
% @type categorical
% @canonical false
% @original_name Factory distinction
% @values longest_running_last_major_usa=Longest_running_last_major_board_factory_USA unk_factory_distinction=Unknown
% @importance 0.70

0.90::acc(s15, factory_distinction).

0.90::true_val(factory_distinction, longest_running_last_major_usa); 0.10::true_val(factory_distinction, unk_factory_distinction).

measured(s15, factory_distinction, longest_running_last_major_usa).

all_consistent(factory_distinction) :-
    consistent(s15, factory_distinction).

evidence(all_consistent(factory_distinction)).
query(true_val(factory_distinction, longest_running_last_major_usa)).
query(true_val(factory_distinction, unk_factory_distinction)).

% @attr current_ownership
% @type categorical
% @canonical false
% @original_name Current ownership
% @values altamont_capital=Altamont_Capital_Partners_acquired_2013 unk_current_ownership=Unknown
% @importance 0.30

0.90::acc(s18, current_ownership).

0.90::true_val(current_ownership, altamont_capital); 0.10::true_val(current_ownership, unk_current_ownership).

measured(s18, current_ownership, altamont_capital).

all_consistent(current_ownership) :-
    consistent(s18, current_ownership).

evidence(all_consistent(current_ownership)).
query(true_val(current_ownership, altamont_capital)).
query(true_val(current_ownership, unk_current_ownership)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values one_year_structural=1_year_manufacturer_warranty_structural_defects unk_warranty=Unknown
% @importance 0.95

0.82::acc(s7, warranty).

0.82::true_val(warranty, one_year_structural); 0.18::true_val(warranty, unk_warranty).

measured(s7, warranty, one_year_structural).

all_consistent(warranty) :-
    (indep(s7), consistent(s7, warranty) ; \+indep(s7)).

evidence(all_consistent(warranty)).
query(true_val(warranty, one_year_structural)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty (exclusions)
% @values no_impact_abuse_wear=Does_not_cover_impact_abuse_misuse_normal_wear unk_warranty_exclusions=Unknown
% @importance 0.95

0.82::acc(s7, warranty_exclusions).

0.82::true_val(warranty_exclusions, no_impact_abuse_wear); 0.18::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s7, warranty_exclusions, no_impact_abuse_wear).

all_consistent(warranty_exclusions) :-
    (indep(s7), consistent(s7, warranty_exclusions) ; \+indep(s7)).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, no_impact_abuse_wear)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v799_99=799.99 unk_price_usd_msrp=Unknown
% @importance 1.0

0.95::acc(s1, price_usd_msrp).

0.95::true_val(price_usd_msrp, v799_99); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s1, price_usd_msrp, v799_99).

all_consistent(price_usd_msrp) :-
    consistent(s1, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v799_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_msrp_implied
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (implied/discounted)
% @values v559_99=559.99 unk_price_usd_msrp_implied=Unknown
% @importance 1.0

0.70::acc(s1, price_usd_msrp_implied).

0.70::true_val(price_usd_msrp_implied, v559_99); 0.30::true_val(price_usd_msrp_implied, unk_price_usd_msrp_implied).

measured(s1, price_usd_msrp_implied, v559_99).

all_consistent(price_usd_msrp_implied) :-
    consistent(s1, price_usd_msrp_implied).

evidence(all_consistent(price_usd_msrp_implied)).
query(true_val(price_usd_msrp_implied, v559_99)).
query(true_val(price_usd_msrp_implied, unk_price_usd_msrp_implied)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v1349_99=1349.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.90::acc(sMERCHANT, price_aud_merchant).

0.90::true_val(price_aud_merchant, v1349_99); 0.10::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(sMERCHANT, price_aud_merchant, v1349_99).

all_consistent(price_aud_merchant) :-
    consistent(sMERCHANT, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1349_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical false
% @original_name price_eur_blue_tomato
% @values v799_99=799.99 unk_price_eur_blue_tomato=Unknown
% @importance 0.80

0.92::acc(s19, price_eur_blue_tomato).

0.92::true_val(price_eur_blue_tomato, v799_99); 0.08::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s19, price_eur_blue_tomato, v799_99).

all_consistent(price_eur_blue_tomato) :-
    consistent(s19, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v799_99)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @values v694_99=694.99 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.75

0.92::acc(s20, price_gbp_blue_tomato_uk).

0.92::true_val(price_gbp_blue_tomato_uk, v694_99); 0.08::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

measured(s20, price_gbp_blue_tomato_uk, v694_99).

all_consistent(price_gbp_blue_tomato_uk) :-
    consistent(s20, price_gbp_blue_tomato_uk).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v694_99)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_usd_msrp_185
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (185cm)
% @values v849_99=849.99 unk_price_usd_msrp_185=Unknown
% @importance 0.90

0.95::acc(s5, price_usd_msrp_185).

0.92::true_val(price_usd_msrp_185, v849_99); 0.08::true_val(price_usd_msrp_185, unk_price_usd_msrp_185).

measured(s5, price_usd_msrp_185, v849_99).

all_consistent(price_usd_msrp_185) :-
    consistent(s5, price_usd_msrp_185).

evidence(all_consistent(price_usd_msrp_185)).
query(true_val(price_usd_msrp_185, v849_99)).
query(true_val(price_usd_msrp_185, unk_price_usd_msrp_185)).

% @attr price_gbp_blue_tomato_uk_185
% @type numeric
% @unit GBP
% @canonical false
% @original_name price_gbp_blue_tomato_uk (185cm)
% @values v714_99=714.99 unk_price_gbp_blue_tomato_uk_185=Unknown
% @importance 0.75

0.92::acc(s20, price_gbp_blue_tomato_uk_185).

0.92::true_val(price_gbp_blue_tomato_uk_185, v714_99); 0.08::true_val(price_gbp_blue_tomato_uk_185, unk_price_gbp_blue_tomato_uk_185).

measured(s20, price_gbp_blue_tomato_uk_185, v714_99).

all_consistent(price_gbp_blue_tomato_uk_185) :-
    consistent(s20, price_gbp_blue_tomato_uk_185).

evidence(all_consistent(price_gbp_blue_tomato_uk_185)).
query(true_val(price_gbp_blue_tomato_uk_185, v714_99)).
query(true_val(price_gbp_blue_tomato_uk_185, unk_price_gbp_blue_tomato_uk_185)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values notify_me_oos=Notify_me_sold_out unk_availability_status=Unknown
% @importance 1.0

0.90::acc(s1, availability_status).

0.90::true_val(availability_status, notify_me_oos); 0.10::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, notify_me_oos).

all_consistent(availability_status) :-
    consistent(s1, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, notify_me_oos)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values listed_2026_oos=Listed_2026_out_of_stock unk_availability_status_evo=Unknown
% @importance 0.85

0.80::acc(s10, availability_status_evo).

0.80::true_val(availability_status_evo, listed_2026_oos); 0.20::true_val(availability_status_evo, unk_availability_status_evo).

measured(s10, availability_status_evo, listed_2026_oos).

all_consistent(availability_status_evo) :-
    (indep(s10), consistent(s10, availability_status_evo) ; \+indep(s10)).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, listed_2026_oos)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (Tactics)
% @values listed_2026_oos=Listed_2026_out_of_stock unk_availability_status_tactics=Unknown
% @importance 0.95

0.80::acc(s7, availability_status_tactics).

0.80::true_val(availability_status_tactics, listed_2026_oos); 0.20::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s7, availability_status_tactics, listed_2026_oos).

all_consistent(availability_status_tactics) :-
    (indep(s7), consistent(s7, availability_status_tactics) ; \+indep(s7)).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, listed_2026_oos)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_arlberg
% @type categorical
% @canonical false
% @original_name availability_status (Arlberg)
% @values in_stock_2=In_stock_799_99_2_units unk_availability_status_arlberg=Unknown
% @importance 0.80

0.70::acc(s21, availability_status_arlberg).

0.70::true_val(availability_status_arlberg, in_stock_2); 0.30::true_val(availability_status_arlberg, unk_availability_status_arlberg).

measured(s21, availability_status_arlberg, in_stock_2).

all_consistent(availability_status_arlberg) :-
    consistent(s21, availability_status_arlberg).

evidence(all_consistent(availability_status_arlberg)).
query(true_val(availability_status_arlberg, in_stock_2)).
query(true_val(availability_status_arlberg, unk_availability_status_arlberg)).

% @attr availability_status_missoula
% @type categorical
% @canonical false
% @original_name availability_status (Board of Missoula)
% @values sale_640=Regular_800_sale_640 unk_availability_status_missoula=Unknown
% @importance 0.85

0.70::acc(s22, availability_status_missoula).

0.70::true_val(availability_status_missoula, sale_640); 0.30::true_val(availability_status_missoula, unk_availability_status_missoula).

measured(s22, availability_status_missoula, sale_640).

all_consistent(availability_status_missoula) :-
    consistent(s22, availability_status_missoula).

evidence(all_consistent(availability_status_missoula)).
query(true_val(availability_status_missoula, sale_640)).
query(true_val(availability_status_missoula, unk_availability_status_missoula)).

% @attr availability_status_wws
% @type categorical
% @canonical false
% @original_name availability_status (WWS Boardshop)
% @values sold_out_799=Sold_out_799_99 unk_availability_status_wws=Unknown
% @importance 0.70

0.65::acc(s23, availability_status_wws).

0.65::true_val(availability_status_wws, sold_out_799); 0.35::true_val(availability_status_wws, unk_availability_status_wws).

measured(s23, availability_status_wws, sold_out_799).

all_consistent(availability_status_wws) :-
    consistent(s23, availability_status_wws).

evidence(all_consistent(availability_status_wws)).
query(true_val(availability_status_wws, sold_out_799)).
query(true_val(availability_status_wws, unk_availability_status_wws)).

% @attr availability_status_rude_boys
% @type categorical
% @canonical false
% @original_name availability_status (Rude Boys)
% @values listed_195=Listed_195cm unk_availability_status_rude_boys=Unknown
% @importance 0.60

0.65::acc(s24, availability_status_rude_boys).

0.65::true_val(availability_status_rude_boys, listed_195); 0.35::true_val(availability_status_rude_boys, unk_availability_status_rude_boys).

measured(s24, availability_status_rude_boys, listed_195).

all_consistent(availability_status_rude_boys) :-
    consistent(s24, availability_status_rude_boys).

evidence(all_consistent(availability_status_rude_boys)).
query(true_val(availability_status_rude_boys, listed_195)).
query(true_val(availability_status_rude_boys, unk_availability_status_rude_boys)).

% @attr availability_status_gorge
% @type categorical
% @canonical false
% @original_name availability_status (Gorge Performance)
% @values listed=Listed unk_availability_status_gorge=Unknown
% @importance 0.50

0.60::acc(s25, availability_status_gorge).

0.60::true_val(availability_status_gorge, listed); 0.40::true_val(availability_status_gorge, unk_availability_status_gorge).

measured(s25, availability_status_gorge, listed).

all_consistent(availability_status_gorge) :-
    consistent(s25, availability_status_gorge).

evidence(all_consistent(availability_status_gorge)).
query(true_val(availability_status_gorge, listed)).
query(true_val(availability_status_gorge, unk_availability_status_gorge)).

% @attr availability_status_glacier
% @type categorical
% @canonical false
% @original_name availability_status (Glacier Ski Shop)
% @values sale_639_2025=Sale_639_regular_800_2025_model unk_availability_status_glacier=Unknown
% @importance 0.80

0.70::acc(s26, availability_status_glacier).

0.70::true_val(availability_status_glacier, sale_639_2025); 0.30::true_val(availability_status_glacier, unk_availability_status_glacier).

measured(s26, availability_status_glacier, sale_639_2025).

all_consistent(availability_status_glacier) :-
    consistent(s26, availability_status_glacier).

evidence(all_consistent(availability_status_glacier)).
query(true_val(availability_status_glacier, sale_639_2025)).
query(true_val(availability_status_glacier, unk_availability_status_glacier)).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status (The House)
% @values listed_195=Listed_195cm unk_availability_status_the_house=Unknown
% @importance 0.60

0.72::acc(s27, availability_status_the_house).

0.72::true_val(availability_status_the_house, listed_195); 0.28::true_val(availability_status_the_house, unk_availability_status_the_house).

measured(s27, availability_status_the_house, listed_195).

all_consistent(availability_status_the_house) :-
    consistent(s27, availability_status_the_house).

evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, listed_195)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status (Amazon)
% @values listed_195=Listed_195cm unk_availability_status_amazon=Unknown
% @importance 0.65

0.72::acc(s28, availability_status_amazon).

0.72::true_val(availability_status_amazon, listed_195); 0.28::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s28, availability_status_amazon, listed_195).

all_consistent(availability_status_amazon) :-
    consistent(s28, availability_status_amazon).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, listed_195)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr availability_status_salty_peaks
% @type categorical
% @canonical false
% @original_name availability_status (Salty Peaks)
% @values listed=Listed unk_availability_status_salty_peaks=Unknown
% @importance 0.75

0.72::acc(s9, availability_status_salty_peaks).

0.72::true_val(availability_status_salty_peaks, listed); 0.28::true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks).

measured(s9, availability_status_salty_peaks, listed).

all_consistent(availability_status_salty_peaks) :-
    (indep(s9), consistent(s9, availability_status_salty_peaks) ; \+indep(s9)).

evidence(all_consistent(availability_status_salty_peaks)).
query(true_val(availability_status_salty_peaks, listed)).
query(true_val(availability_status_salty_peaks, unk_availability_status_salty_peaks)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values listed_2025=Listed_2025_model unk_availability_status_blauer=Unknown
% @importance 0.75

0.72::acc(s13, availability_status_blauer).

0.72::true_val(availability_status_blauer, listed_2025); 0.28::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s13, availability_status_blauer, listed_2025).

all_consistent(availability_status_blauer) :-
    (indep(s13), consistent(s13, availability_status_blauer) ; \+indep(s13)).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, listed_2025)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_alpine
% @type categorical
% @canonical false
% @original_name availability_status (Alpine Ski Shop)
% @values listed_2025=Listed_2025_model unk_availability_status_alpine=Unknown
% @importance 0.50

0.65::acc(s29, availability_status_alpine).

0.65::true_val(availability_status_alpine, listed_2025); 0.35::true_val(availability_status_alpine, unk_availability_status_alpine).

measured(s29, availability_status_alpine, listed_2025).

all_consistent(availability_status_alpine) :-
    consistent(s29, availability_status_alpine).

evidence(all_consistent(availability_status_alpine)).
query(true_val(availability_status_alpine, listed_2025)).
query(true_val(availability_status_alpine, unk_availability_status_alpine)).

% @attr availability_status_winteriscalling
% @type categorical
% @canonical false
% @original_name availability_status (WinterIsCalling)
% @values preorder_799=Pre_order_799_99 unk_availability_status_winteriscalling=Unknown
% @importance 0.60

0.60::acc(s30, availability_status_winteriscalling).

0.60::true_val(availability_status_winteriscalling, preorder_799); 0.40::true_val(availability_status_winteriscalling, unk_availability_status_winteriscalling).

measured(s30, availability_status_winteriscalling, preorder_799).

all_consistent(availability_status_winteriscalling) :-
    consistent(s30, availability_status_winteriscalling).

evidence(all_consistent(availability_status_winteriscalling)).
query(true_val(availability_status_winteriscalling, preorder_799)).
query(true_val(availability_status_winteriscalling, unk_availability_status_winteriscalling)).

% @attr availability_status_alternative113
% @type categorical
% @canonical false
% @original_name availability_status (Alternative113)
% @values low_557_reg_929=As_low_as_557_99_regular_929_99 unk_availability_status_alternative113=Unknown
% @importance 0.70

0.55::acc(s31, availability_status_alternative113).

0.55::true_val(availability_status_alternative113, low_557_reg_929); 0.45::true_val(availability_status_alternative113, unk_availability_status_alternative113).

measured(s31, availability_status_alternative113, low_557_reg_929).

all_consistent(availability_status_alternative113) :-
    consistent(s31, availability_status_alternative113).

evidence(all_consistent(availability_status_alternative113)).
query(true_val(availability_status_alternative113, low_557_reg_929)).
query(true_val(availability_status_alternative113, unk_availability_status_alternative113)).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status (SnowCountry.eu)
% @values listed_eu=Listed_Europe unk_availability_status_snowcountry=Unknown
% @importance 0.65

0.60::acc(s32, availability_status_snowcountry).

0.60::true_val(availability_status_snowcountry, listed_eu); 0.40::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).

measured(s32, availability_status_snowcountry, listed_eu).

all_consistent(availability_status_snowcountry) :-
    (indep(s32), consistent(s32, availability_status_snowcountry) ; \+indep(s32)).

evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, listed_eu)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values exceptional_stability=Exceptionally_stable_testament_to_stability unk_reviewer_opinion_whitelines=Unknown
% @importance 0.85

0.85::acc(s8, reviewer_opinion_whitelines).

0.82::true_val(reviewer_opinion_whitelines, exceptional_stability); 0.18::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s8, reviewer_opinion_whitelines, exceptional_stability).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s8, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, exceptional_stability)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr chatter_performance
% @type categorical
% @canonical false
% @original_name chatter_performance
% @values little_to_no_chatter=Little_to_no_gnarly_chatter unk_chatter_performance=Unknown
% @importance 0.85

0.85::acc(s8, chatter_performance).

0.82::true_val(chatter_performance, little_to_no_chatter); 0.18::true_val(chatter_performance, unk_chatter_performance).

measured(s8, chatter_performance, little_to_no_chatter).

all_consistent(chatter_performance) :-
    consistent(s8, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, little_to_no_chatter)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values oil_tanker=Turns_like_oil_tanker_requires_big_open_terrain unk_turn_initiation_performance=Unknown
% @importance 0.85

0.85::acc(s8, turn_initiation_performance).

0.82::true_val(turn_initiation_performance, oil_tanker); 0.18::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s8, turn_initiation_performance, oil_tanker).

all_consistent(turn_initiation_performance) :-
    consistent(s8, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, oil_tanker)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values only_long_turns=Only_long_turns_are_an_option unk_user_review_forum=Unknown
% @importance 0.80

0.72::acc(s33, user_review_forum).

0.68::true_val(user_review_forum, only_long_turns); 0.32::true_val(user_review_forum, unk_user_review_forum).

measured(s33, user_review_forum, only_long_turns).

all_consistent(user_review_forum) :-
    consistent(s33, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, only_long_turns)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_feel
% @type categorical
% @canonical false
% @original_name user_review_forum (feel)
% @values doesnt_feel_as_long=Doesnt_nearly_feel_as_long_as_it_is unk_user_review_forum_feel=Unknown
% @importance 0.80

0.72::acc(s33, user_review_forum_feel).

0.68::true_val(user_review_forum_feel, doesnt_feel_as_long); 0.32::true_val(user_review_forum_feel, unk_user_review_forum_feel).

measured(s33, user_review_forum_feel, doesnt_feel_as_long).

all_consistent(user_review_forum_feel) :-
    consistent(s33, user_review_forum_feel).

evidence(all_consistent(user_review_forum_feel)).
query(true_val(user_review_forum_feel, doesnt_feel_as_long)).
query(true_val(user_review_forum_feel, unk_user_review_forum_feel)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values blast_on_groomers=A_blast_on_big_cord_groomers unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.80::acc(s34, reviewer_opinion_the_good_ride).

0.75::true_val(reviewer_opinion_the_good_ride, blast_on_groomers); 0.25::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s34, reviewer_opinion_the_good_ride, blast_on_groomers).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s34, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, blast_on_groomers)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr user_review_forum_frequency
% @type categorical
% @canonical false
% @original_name user_review_forum (frequency)
% @values fun_every_5th_day=Fun_every_5th_day_not_every_day unk_user_review_forum_frequency=Unknown
% @importance 0.85

0.72::acc(s34, user_review_forum_frequency).

0.68::true_val(user_review_forum_frequency, fun_every_5th_day); 0.32::true_val(user_review_forum_frequency, unk_user_review_forum_frequency).

measured(s34, user_review_forum_frequency, fun_every_5th_day).

all_consistent(user_review_forum_frequency) :-
    consistent(s34, user_review_forum_frequency).

evidence(all_consistent(user_review_forum_frequency)).
query(true_val(user_review_forum_frequency, fun_every_5th_day)).
query(true_val(user_review_forum_frequency, unk_user_review_forum_frequency)).

% @attr reviewer_opinion_the_good_ride_daily
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (daily use)
% @values few_runs_not_all_day=Board_for_few_runs_a_day_not_all_day unk_reviewer_opinion_the_good_ride_daily=Unknown
% @importance 0.85

0.82::acc(s35, reviewer_opinion_the_good_ride_daily).

0.78::true_val(reviewer_opinion_the_good_ride_daily, few_runs_not_all_day); 0.22::true_val(reviewer_opinion_the_good_ride_daily, unk_reviewer_opinion_the_good_ride_daily).

measured(s35, reviewer_opinion_the_good_ride_daily, few_runs_not_all_day).

all_consistent(reviewer_opinion_the_good_ride_daily) :-
    consistent(s35, reviewer_opinion_the_good_ride_daily).

evidence(all_consistent(reviewer_opinion_the_good_ride_daily)).
query(true_val(reviewer_opinion_the_good_ride_daily, few_runs_not_all_day)).
query(true_val(reviewer_opinion_the_good_ride_daily, unk_reviewer_opinion_the_good_ride_daily)).

% @attr carving_rating_tgr
% @type categorical
% @canonical false
% @original_name carving_rating_tgr
% @values beautiful_arcs=Big_tips_tails_carve_beautiful_arcs_hardpack_ice unk_carving_rating_tgr=Unknown
% @importance 1.0

0.88::acc(s1, carving_rating_tgr).

0.88::true_val(carving_rating_tgr, beautiful_arcs); 0.12::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s1, carving_rating_tgr, beautiful_arcs).

all_consistent(carving_rating_tgr) :-
    consistent(s1, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, beautiful_arcs)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr powder_rating_tgr
% @type categorical
% @canonical false
% @original_name powder_rating_tgr
% @values float_incredibly=Float_incredibly_in_powder unk_powder_rating_tgr=Unknown
% @importance 1.0

0.88::acc(s1, powder_rating_tgr).

0.88::true_val(powder_rating_tgr, float_incredibly); 0.12::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s1, powder_rating_tgr, float_incredibly).

all_consistent(powder_rating_tgr) :-
    consistent(s1, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, float_incredibly)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr rough_terrain_performance
% @type categorical
% @canonical false
% @original_name Rough terrain performance
% @values smoother_ride=Smoother_ride_through_rough_terrain unk_rough_terrain_performance=Unknown
% @importance 1.0

0.88::acc(s1, rough_terrain_performance).

0.88::true_val(rough_terrain_performance, smoother_ride); 0.12::true_val(rough_terrain_performance, unk_rough_terrain_performance).

measured(s1, rough_terrain_performance, smoother_ride).

all_consistent(rough_terrain_performance) :-
    consistent(s1, rough_terrain_performance).

evidence(all_consistent(rough_terrain_performance)).
query(true_val(rough_terrain_performance, smoother_ride)).
query(true_val(rough_terrain_performance, unk_rough_terrain_performance)).

% @attr dampening_quality
% @type categorical
% @canonical false
% @original_name Dampening quality
% @values incredibly_damp=Turns_chopped_snow_into_smooth_incredibly_damp_ride unk_dampening_quality=Unknown
% @importance 0.75

0.75::acc(s9, dampening_quality).

0.72::true_val(dampening_quality, incredibly_damp); 0.28::true_val(dampening_quality, unk_dampening_quality).

measured(s9, dampening_quality, incredibly_damp).

all_consistent(dampening_quality) :-
    (indep(s9), consistent(s9, dampening_quality) ; \+indep(s9)).

evidence(all_consistent(dampening_quality)).
query(true_val(dampening_quality, incredibly_damp)).
query(true_val(dampening_quality, unk_dampening_quality)).

% @attr speed_capability
% @type categorical
% @canonical false
% @original_name Speed capability
% @values flying=Get_on_a_straight_youll_be_flying unk_speed_capability=Unknown
% @importance 0.85

0.85::acc(s8, speed_capability).

0.82::true_val(speed_capability, flying); 0.18::true_val(speed_capability, unk_speed_capability).

measured(s8, speed_capability, flying).

all_consistent(speed_capability) :-
    consistent(s8, speed_capability).

evidence(all_consistent(speed_capability)).
query(true_val(speed_capability, flying)).
query(true_val(speed_capability, unk_speed_capability)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values carbon_camber_pop=Carbon_reinforcement_and_camber_keep_it_poppin unk_pop=Unknown
% @importance 1.0

0.88::acc(s1, pop).

0.88::true_val(pop, carbon_camber_pop); 0.12::true_val(pop, unk_pop).

measured(s1, pop, carbon_camber_pop).

all_consistent(pop) :-
    consistent(s1, pop).

evidence(all_consistent(pop)).
query(true_val(pop, carbon_camber_pop)).
query(true_val(pop, unk_pop)).

% @attr freestyle_park_rating
% @type categorical
% @canonical false
% @original_name freestyle_park_rating
% @values progressive_spins=Launches_progressive_spin_missions_daily unk_freestyle_park_rating=Unknown
% @importance 1.0

0.85::acc(s1, freestyle_park_rating).

0.85::true_val(freestyle_park_rating, progressive_spins); 0.15::true_val(freestyle_park_rating, unk_freestyle_park_rating).

measured(s1, freestyle_park_rating, progressive_spins).

all_consistent(freestyle_park_rating) :-
    consistent(s1, freestyle_park_rating).

evidence(all_consistent(freestyle_park_rating)).
query(true_val(freestyle_park_rating, progressive_spins)).
query(true_val(freestyle_park_rating, unk_freestyle_park_rating)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values unreal_edge_hold=Unreal_edge_hold_all_conditions_ice_to_carvable unk_edge_hold=Unknown
% @importance 0.85

0.82::acc(s7, edge_hold).
0.75::acc(s9, edge_hold).

0.92::true_val(edge_hold, unreal_edge_hold); 0.08::true_val(edge_hold, unk_edge_hold).

measured(s7, edge_hold, unreal_edge_hold).
measured(s9, edge_hold, unreal_edge_hold).

all_consistent(edge_hold) :-
    (indep(s7), consistent(s7, edge_hold) ; \+indep(s7)),
    (indep(s9), consistent(s9, edge_hold) ; \+indep(s9)).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, unreal_edge_hold)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values nippy_surface_area_helps=Base_nippy_but_sheer_surface_area_does_the_job unk_base_glide_performance=Unknown
% @importance 0.85

0.85::acc(s8, base_glide_performance).

0.82::true_val(base_glide_performance, nippy_surface_area_helps); 0.18::true_val(base_glide_performance, unk_base_glide_performance).

measured(s8, base_glide_performance, nippy_surface_area_helps).

all_consistent(base_glide_performance) :-
    consistent(s8, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, nippy_surface_area_helps)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr manufacturer_rating_195
% @type categorical
% @canonical false
% @original_name Manufacturer rating (195cm)
% @values pct100_18reviews=100_pct_18_reviews unk_manufacturer_rating_195=Unknown
% @importance 1.0

0.88::acc(s1, manufacturer_rating_195).

0.85::true_val(manufacturer_rating_195, pct100_18reviews); 0.15::true_val(manufacturer_rating_195, unk_manufacturer_rating_195).

measured(s1, manufacturer_rating_195, pct100_18reviews).

all_consistent(manufacturer_rating_195) :-
    consistent(s1, manufacturer_rating_195).

evidence(all_consistent(manufacturer_rating_195)).
query(true_val(manufacturer_rating_195, pct100_18reviews)).
query(true_val(manufacturer_rating_195, unk_manufacturer_rating_195)).

% @attr manufacturer_rating_185
% @type categorical
% @canonical false
% @original_name Manufacturer rating (185cm)
% @values pct100_2reviews=100_pct_2_reviews unk_manufacturer_rating_185=Unknown
% @importance 0.90

0.88::acc(s5, manufacturer_rating_185).

0.85::true_val(manufacturer_rating_185, pct100_2reviews); 0.15::true_val(manufacturer_rating_185, unk_manufacturer_rating_185).

measured(s5, manufacturer_rating_185, pct100_2reviews).

all_consistent(manufacturer_rating_185) :-
    consistent(s5, manufacturer_rating_185).

evidence(all_consistent(manufacturer_rating_185)).
query(true_val(manufacturer_rating_185, pct100_2reviews)).
query(true_val(manufacturer_rating_185, unk_manufacturer_rating_185)).

% @attr reviewer_opinion_the_good_ride_value
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (value/uniqueness)
% @values expensive_quiver_unique=Super_long_full_camber_expensive_quiver_ride unk_reviewer_opinion_the_good_ride_value=Unknown
% @importance 0.85

0.82::acc(s35, reviewer_opinion_the_good_ride_value).

0.78::true_val(reviewer_opinion_the_good_ride_value, expensive_quiver_unique); 0.22::true_val(reviewer_opinion_the_good_ride_value, unk_reviewer_opinion_the_good_ride_value).

measured(s35, reviewer_opinion_the_good_ride_value, expensive_quiver_unique).

all_consistent(reviewer_opinion_the_good_ride_value) :-
    consistent(s35, reviewer_opinion_the_good_ride_value).

evidence(all_consistent(reviewer_opinion_the_good_ride_value)).
query(true_val(reviewer_opinion_the_good_ride_value, expensive_quiver_unique)).
query(true_val(reviewer_opinion_the_good_ride_value, unk_reviewer_opinion_the_good_ride_value)).

% @attr reviewer_opinion_whitelines_buy
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (buy decision)
% @values joy_but_wouldnt_buy=Joy_to_ride_but_wouldnt_buy_novelty_wears_off unk_reviewer_opinion_whitelines_buy=Unknown
% @importance 0.85

0.85::acc(s36, reviewer_opinion_whitelines_buy).

0.82::true_val(reviewer_opinion_whitelines_buy, joy_but_wouldnt_buy); 0.18::true_val(reviewer_opinion_whitelines_buy, unk_reviewer_opinion_whitelines_buy).

measured(s36, reviewer_opinion_whitelines_buy, joy_but_wouldnt_buy).

all_consistent(reviewer_opinion_whitelines_buy) :-
    consistent(s36, reviewer_opinion_whitelines_buy).

evidence(all_consistent(reviewer_opinion_whitelines_buy)).
query(true_val(reviewer_opinion_whitelines_buy, joy_but_wouldnt_buy)).
query(true_val(reviewer_opinion_whitelines_buy, unk_reviewer_opinion_whitelines_buy)).

% @attr reviewer_opinion_whitelines_edges
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (edges)
% @values wavy_edges_confidence=Wavy_Magne_traction_edges_give_confidence_big_turns unk_reviewer_opinion_whitelines_edges=Unknown
% @importance 0.85

0.85::acc(s8, reviewer_opinion_whitelines_edges).

0.82::true_val(reviewer_opinion_whitelines_edges, wavy_edges_confidence); 0.18::true_val(reviewer_opinion_whitelines_edges, unk_reviewer_opinion_whitelines_edges).

measured(s8, reviewer_opinion_whitelines_edges, wavy_edges_confidence).

all_consistent(reviewer_opinion_whitelines_edges) :-
    consistent(s8, reviewer_opinion_whitelines_edges).

evidence(all_consistent(reviewer_opinion_whitelines_edges)).
query(true_val(reviewer_opinion_whitelines_edges, wavy_edges_confidence)).
query(true_val(reviewer_opinion_whitelines_edges, unk_reviewer_opinion_whitelines_edges)).

% @attr user_review_forum_love
% @type categorical
% @canonical false
% @original_name user_review_forum (love)
% @values fell_in_love_again=Made_me_fall_in_love_with_snowboarding_again unk_user_review_forum_love=Unknown
% @importance 0.70

0.72::acc(s37, user_review_forum_love).

0.68::true_val(user_review_forum_love, fell_in_love_again); 0.32::true_val(user_review_forum_love, unk_user_review_forum_love).

measured(s37, user_review_forum_love, fell_in_love_again).

all_consistent(user_review_forum_love) :-
    consistent(s37, user_review_forum_love).

evidence(all_consistent(user_review_forum_love)).
query(true_val(user_review_forum_love, fell_in_love_again)).
query(true_val(user_review_forum_love, unk_user_review_forum_love)).

% @attr user_review_forum_novelty
% @type categorical
% @canonical false
% @original_name user_review_forum (novelty question)
% @values novelty_or_rider=Complete_novelty_wall_hanger_or_occasional_rider unk_user_review_forum_novelty=Unknown
% @importance 0.80

0.72::acc(s33, user_review_forum_novelty).

0.68::true_val(user_review_forum_novelty, novelty_or_rider); 0.32::true_val(user_review_forum_novelty, unk_user_review_forum_novelty).

measured(s33, user_review_forum_novelty, novelty_or_rider).

all_consistent(user_review_forum_novelty) :-
    consistent(s33, user_review_forum_novelty).

evidence(all_consistent(user_review_forum_novelty)).
query(true_val(user_review_forum_novelty, novelty_or_rider)).
query(true_val(user_review_forum_novelty, unk_user_review_forum_novelty)).

% @attr user_review_forum_powder
% @type categorical
% @canonical false
% @original_name user_review_forum (powder skepticism)
% @values not_good_powder_giant_am=Not_good_powder_board_just_giant_all_mountain unk_user_review_forum_powder=Unknown
% @importance 0.80

0.72::acc(s33, user_review_forum_powder).

0.68::true_val(user_review_forum_powder, not_good_powder_giant_am); 0.32::true_val(user_review_forum_powder, unk_user_review_forum_powder).

measured(s33, user_review_forum_powder, not_good_powder_giant_am).

all_consistent(user_review_forum_powder) :-
    consistent(s33, user_review_forum_powder).

evidence(all_consistent(user_review_forum_powder)).
query(true_val(user_review_forum_powder, not_good_powder_giant_am)).
query(true_val(user_review_forum_powder, unk_user_review_forum_powder)).

% @attr user_review_forum_comedic
% @type categorical
% @canonical false
% @original_name user_review_forum (comedic)
% @values comedic_not_serious=Nice_for_comedic_purposes_not_serious unk_user_review_forum_comedic=Unknown
% @importance 0.80

0.72::acc(s33, user_review_forum_comedic).

0.68::true_val(user_review_forum_comedic, comedic_not_serious); 0.32::true_val(user_review_forum_comedic, unk_user_review_forum_comedic).

measured(s33, user_review_forum_comedic, comedic_not_serious).

all_consistent(user_review_forum_comedic) :-
    consistent(s33, user_review_forum_comedic).

evidence(all_consistent(user_review_forum_comedic)).
query(true_val(user_review_forum_comedic, comedic_not_serious)).
query(true_val(user_review_forum_comedic, unk_user_review_forum_comedic)).

% @attr user_review_forum_long_fat
% @type categorical
% @canonical false
% @original_name user_review_forum (long fat preference)
% @values over_short_fat=Over_the_short_fat_thing_long_fat_way_to_go_except_trees unk_user_review_forum_long_fat=Unknown
% @importance 0.70

0.68::acc(s38, user_review_forum_long_fat).

0.65::true_val(user_review_forum_long_fat, over_short_fat); 0.35::true_val(user_review_forum_long_fat, unk_user_review_forum_long_fat).

measured(s38, user_review_forum_long_fat, over_short_fat).

all_consistent(user_review_forum_long_fat) :-
    consistent(s38, user_review_forum_long_fat).

evidence(all_consistent(user_review_forum_long_fat)).
query(true_val(user_review_forum_long_fat, over_short_fat)).
query(true_val(user_review_forum_long_fat, unk_user_review_forum_long_fat)).

% @attr user_review_forum_quiver
% @type categorical
% @canonical false
% @original_name user_review_forum (quiver board)
% @values completely_unique_quiver=Completely_unique_definitely_a_quiver_board unk_user_review_forum_quiver=Unknown
% @importance 0.70

0.68::acc(s39, user_review_forum_quiver).

0.65::true_val(user_review_forum_quiver, completely_unique_quiver); 0.35::true_val(user_review_forum_quiver, unk_user_review_forum_quiver).

measured(s39, user_review_forum_quiver, completely_unique_quiver).

all_consistent(user_review_forum_quiver) :-
    consistent(s39, user_review_forum_quiver).

evidence(all_consistent(user_review_forum_quiver)).
query(true_val(user_review_forum_quiver, completely_unique_quiver)).
query(true_val(user_review_forum_quiver, unk_user_review_forum_quiver)).

% @attr reviewer_opinion_the_good_ride_construction
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (construction durability)
% @values solid_durable=Pretty_solid_boards_durable_topsheet_scuffs_superficial unk_reviewer_opinion_the_good_ride_construction=Unknown
% @importance 0.70

0.78::acc(s40, reviewer_opinion_the_good_ride_construction).

0.75::true_val(reviewer_opinion_the_good_ride_construction, solid_durable); 0.25::true_val(reviewer_opinion_the_good_ride_construction, unk_reviewer_opinion_the_good_ride_construction).

measured(s40, reviewer_opinion_the_good_ride_construction, solid_durable).

all_consistent(reviewer_opinion_the_good_ride_construction) :-
    consistent(s40, reviewer_opinion_the_good_ride_construction).

evidence(all_consistent(reviewer_opinion_the_good_ride_construction)).
query(true_val(reviewer_opinion_the_good_ride_construction, solid_durable)).
query(true_val(reviewer_opinion_the_good_ride_construction, unk_reviewer_opinion_the_good_ride_construction)).

% @attr user_review_forum_damp
% @type categorical
% @canonical false
% @original_name user_review_forum (damp ride)
% @values smooth_damp_variable=Smooth_damp_rides_variable_resort_conditions_fast_hard unk_user_review_forum_damp=Unknown
% @importance 0.70

0.68::acc(s39, user_review_forum_damp).

0.65::true_val(user_review_forum_damp, smooth_damp_variable); 0.35::true_val(user_review_forum_damp, unk_user_review_forum_damp).

measured(s39, user_review_forum_damp, smooth_damp_variable).

all_consistent(user_review_forum_damp) :-
    consistent(s39, user_review_forum_damp).

evidence(all_consistent(user_review_forum_damp)).
query(true_val(user_review_forum_damp, smooth_damp_variable)).
query(true_val(user_review_forum_damp, unk_user_review_forum_damp)).

% @attr user_review_forum_mag_criticism
% @type categorical
% @canonical false
% @original_name user_review_forum (magne-traction criticism)
% @values wish_no_mag_plain_camber=Wish_Mervin_made_boards_without_mag_plain_camber unk_user_review_forum_mag_criticism=Unknown
% @importance 0.70

0.68::acc(s39, user_review_forum_mag_criticism).

0.65::true_val(user_review_forum_mag_criticism, wish_no_mag_plain_camber); 0.35::true_val(user_review_forum_mag_criticism, unk_user_review_forum_mag_criticism).

measured(s39, user_review_forum_mag_criticism, wish_no_mag_plain_camber).

all_consistent(user_review_forum_mag_criticism) :-
    consistent(s39, user_review_forum_mag_criticism).

evidence(all_consistent(user_review_forum_mag_criticism)).
query(true_val(user_review_forum_mag_criticism, wish_no_mag_plain_camber)).
query(true_val(user_review_forum_mag_criticism, unk_user_review_forum_mag_criticism)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mountain_freeride=All_Mountain_Freeride unk_terrain_suitability=Unknown
% @importance 0.85

0.80::acc(sMERCHANT, terrain_suitability).

0.80::true_val(terrain_suitability, all_mountain_freeride); 0.20::true_val(terrain_suitability, unk_terrain_suitability).

measured(sMERCHANT, terrain_suitability, all_mountain_freeride).

all_consistent(terrain_suitability) :-
    (indep(sMERCHANT), consistent(sMERCHANT, terrain_suitability) ; \+indep(sMERCHANT)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mountain_freeride)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values carving_offpiste_steep=Carving_off_piste_steep_terrain unk_riding_style=Unknown
% @importance 0.85

0.80::acc(sMERCHANT, riding_style).

0.80::true_val(riding_style, carving_offpiste_steep); 0.20::true_val(riding_style, unk_riding_style).

measured(sMERCHANT, riding_style, carving_offpiste_steep).

all_consistent(riding_style) :-
    (indep(sMERCHANT), consistent(sMERCHANT, riding_style) ; \+indep(sMERCHANT)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, carving_offpiste_steep)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_conditions
% @type categorical
% @canonical false
% @original_name terrain_suitability (conditions)
% @values groomed_powder_variable=Groomed_hardpack_deep_powder_variable_conditions unk_terrain_suitability_conditions=Unknown
% @importance 0.93

0.90::acc(s1, terrain_suitability_conditions).
0.82::acc(s8, terrain_suitability_conditions).

0.94::true_val(terrain_suitability_conditions, groomed_powder_variable); 0.06::true_val(terrain_suitability_conditions, unk_terrain_suitability_conditions).

measured(s1, terrain_suitability_conditions, groomed_powder_variable).
measured(s8, terrain_suitability_conditions, groomed_powder_variable).

all_consistent(terrain_suitability_conditions) :-
    consistent(s1, terrain_suitability_conditions),
    consistent(s8, terrain_suitability_conditions).

evidence(all_consistent(terrain_suitability_conditions)).
query(true_val(terrain_suitability_conditions, groomed_powder_variable)).
query(true_val(terrain_suitability_conditions, unk_terrain_suitability_conditions)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values advanced=Advanced advanced_expert=Advanced_Expert unk_rider_level=Unknown
% @importance 0.85

0.78::acc(sMERCHANT, rider_level).
0.80::acc(s10, rider_level).

0.40::true_val(rider_level, advanced); 0.55::true_val(rider_level, advanced_expert); 0.05::true_val(rider_level, unk_rider_level).

measured(sMERCHANT, rider_level, advanced).
measured(s10, rider_level, advanced_expert).

all_consistent(rider_level) :-
    (indep(sMERCHANT), consistent(sMERCHANT, rider_level) ; \+indep(sMERCHANT)),
    (indep(s10), consistent(s10, rider_level) ; \+indep(s10)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr volume_shifted
% @type categorical
% @canonical false
% @original_name Volume shifted
% @values yes_oversized=Yes_oversized_840_sq_in_more_manageable unk_volume_shifted=Unknown
% @importance 0.75

0.75::acc(s9, volume_shifted).

0.72::true_val(volume_shifted, yes_oversized); 0.28::true_val(volume_shifted, unk_volume_shifted).

measured(s9, volume_shifted, yes_oversized).

all_consistent(volume_shifted) :-
    (indep(s9), consistent(s9, volume_shifted) ; \+indep(s9)).

evidence(all_consistent(volume_shifted)).
query(true_val(volume_shifted, yes_oversized)).
query(true_val(volume_shifted, unk_volume_shifted)).

% @attr insert_positioning
% @type categorical
% @canonical false
% @original_name Insert positioning
% @values like_155_160_region=Inserts_where_youd_expect_155_160_region unk_insert_positioning=Unknown
% @importance 0.85

0.85::acc(s8, insert_positioning).

0.82::true_val(insert_positioning, like_155_160_region); 0.18::true_val(insert_positioning, unk_insert_positioning).

measured(s8, insert_positioning, like_155_160_region).

all_consistent(insert_positioning) :-
    consistent(s8, insert_positioning).

evidence(all_consistent(insert_positioning)).
query(true_val(insert_positioning, like_155_160_region)).
query(true_val(insert_positioning, unk_insert_positioning)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values requires_big_terrain=Requires_big_open_terrain_not_tight_trees unk_negative_aspect=Unknown
% @importance 0.75

0.72::acc(s33, negative_aspect).
0.68::acc(s38, negative_aspect).

0.88::true_val(negative_aspect, requires_big_terrain); 0.12::true_val(negative_aspect, unk_negative_aspect).

measured(s33, negative_aspect, requires_big_terrain).
measured(s38, negative_aspect, requires_big_terrain).

all_consistent(negative_aspect) :-
    consistent(s33, negative_aspect),
    consistent(s38, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, requires_big_terrain)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_daily_driver
% @type categorical
% @canonical false
% @original_name negative_aspect (daily driver)
% @values quiver_not_daily=Generally_quiver_fun_board_not_daily_driver unk_negative_aspect_daily_driver=Unknown
% @importance 0.85

0.75::acc(s34, negative_aspect_daily_driver).
0.82::acc(s35, negative_aspect_daily_driver).
0.82::acc(s36, negative_aspect_daily_driver).

0.95::true_val(negative_aspect_daily_driver, quiver_not_daily); 0.05::true_val(negative_aspect_daily_driver, unk_negative_aspect_daily_driver).

measured(s34, negative_aspect_daily_driver, quiver_not_daily).
measured(s35, negative_aspect_daily_driver, quiver_not_daily).
measured(s36, negative_aspect_daily_driver, quiver_not_daily).

all_consistent(negative_aspect_daily_driver) :-
    consistent(s34, negative_aspect_daily_driver),
    consistent(s35, negative_aspect_daily_driver),
    consistent(s36, negative_aspect_daily_driver).

evidence(all_consistent(negative_aspect_daily_driver)).
query(true_val(negative_aspect_daily_driver, quiver_not_daily)).
query(true_val(negative_aspect_daily_driver, unk_negative_aspect_daily_driver)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values son_of_birdman=Son_of_Birdman_749_99 unk_comparable_board_same_brand=Unknown
% @importance 1.0

0.88::acc(s1, comparable_board_same_brand).

0.88::true_val(comparable_board_same_brand, son_of_birdman); 0.12::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s1, comparable_board_same_brand, son_of_birdman).

all_consistent(comparable_board_same_brand) :-
    consistent(s1, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, son_of_birdman)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_185
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (185cm variant)
% @values doughboy_185=Doughboy_185_849_99_2627 unk_comparable_board_same_brand_185=Unknown
% @importance 0.90

0.90::acc(s5, comparable_board_same_brand_185).

0.88::true_val(comparable_board_same_brand_185, doughboy_185); 0.12::true_val(comparable_board_same_brand_185, unk_comparable_board_same_brand_185).

measured(s5, comparable_board_same_brand_185, doughboy_185).

all_consistent(comparable_board_same_brand_185) :-
    consistent(s5, comparable_board_same_brand_185).

evidence(all_consistent(comparable_board_same_brand_185)).
query(true_val(comparable_board_same_brand_185, doughboy_185)).
query(true_val(comparable_board_same_brand_185, unk_comparable_board_same_brand_185)).

% @attr comparable_board_same_brand_am
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (all mountain alternatives)
% @values dynamo_lib_rig_ejack=Dynamo_Lib_Rig_EJack unk_comparable_board_same_brand_am=Unknown
% @importance 0.70

0.68::acc(s39, comparable_board_same_brand_am).
0.72::acc(s40, comparable_board_same_brand_am).

0.85::true_val(comparable_board_same_brand_am, dynamo_lib_rig_ejack); 0.15::true_val(comparable_board_same_brand_am, unk_comparable_board_same_brand_am).

measured(s39, comparable_board_same_brand_am, dynamo_lib_rig_ejack).
measured(s40, comparable_board_same_brand_am, dynamo_lib_rig_ejack).

all_consistent(comparable_board_same_brand_am) :-
    consistent(s39, comparable_board_same_brand_am),
    consistent(s40, comparable_board_same_brand_am).

evidence(all_consistent(comparable_board_same_brand_am)).
query(true_val(comparable_board_same_brand_am, dynamo_lib_rig_ejack)).
query(true_val(comparable_board_same_brand_am, unk_comparable_board_same_brand_am)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_rome_yes=Jones_Storm_Chaser_Rome_PD_Yes_420 unk_comparable_board_cross_brand=Unknown
% @importance 0.70

0.68::acc(s38, comparable_board_cross_brand).

0.65::true_val(comparable_board_cross_brand, jones_rome_yes); 0.35::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s38, comparable_board_cross_brand, jones_rome_yes).

all_consistent(comparable_board_cross_brand) :-
    consistent(s38, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_rome_yes)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr predecessor_model_name
% @type categorical
% @canonical false
% @original_name predecessor_model_name
% @values original_doughboy_shredder=Original_Doughboy_Shredder_late_1980s_196cm_plus unk_predecessor_model_name=Unknown
% @importance 0.58

0.78::acc(s8, predecessor_model_name).
0.55::acc(s41, predecessor_model_name).

0.85::true_val(predecessor_model_name, original_doughboy_shredder); 0.15::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s8, predecessor_model_name, original_doughboy_shredder).
measured(s41, predecessor_model_name, original_doughboy_shredder).

all_consistent(predecessor_model_name) :-
    consistent(s8, predecessor_model_name),
    consistent(s41, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, original_doughboy_shredder)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr msrp_positioning
% @type categorical
% @canonical false
% @original_name MSRP positioning
% @values above_average_libtech=Above_average_for_Lib_Tech_comparable_Orca_749_849 unk_msrp_positioning=Unknown
% @importance 0.75

0.85::acc(s42, msrp_positioning).

0.82::true_val(msrp_positioning, above_average_libtech); 0.18::true_val(msrp_positioning, unk_msrp_positioning).

measured(s42, msrp_positioning, above_average_libtech).

all_consistent(msrp_positioning) :-
    consistent(s42, msrp_positioning).

evidence(all_consistent(msrp_positioning)).
query(true_val(msrp_positioning, above_average_libtech)).
query(true_val(msrp_positioning, unk_msrp_positioning)).

% @attr discounted_pricing_observed
% @type categorical
% @canonical false
% @original_name Discounted pricing observed
% @values range_557_to_640=557_99_to_640_end_of_season unk_discounted_pricing_observed=Unknown
% @importance 0.78

0.70::acc(s22, discounted_pricing_observed).
0.70::acc(s26, discounted_pricing_observed).
0.55::acc(s31, discounted_pricing_observed).

0.92::true_val(discounted_pricing_observed, range_557_to_640); 0.08::true_val(discounted_pricing_observed, unk_discounted_pricing_observed).

measured(s22, discounted_pricing_observed, range_557_to_640).
measured(s26, discounted_pricing_observed, range_557_to_640).
measured(s31, discounted_pricing_observed, range_557_to_640).

all_consistent(discounted_pricing_observed) :-
    consistent(s22, discounted_pricing_observed),
    consistent(s26, discounted_pricing_observed),
    consistent(s31, discounted_pricing_observed).

evidence(all_consistent(discounted_pricing_observed)).
query(true_val(discounted_pricing_observed, range_557_to_640)).
query(true_val(discounted_pricing_observed, unk_discounted_pricing_observed)).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Lib Tech brand reputation
% @values well_established_since_1977=Well_established_pioneering_brand_since_1977 unk_brand_reputation=Unknown
% @importance 0.70

0.90::acc(s15, brand_reputation).

0.90::true_val(brand_reputation, well_established_since_1977); 0.10::true_val(brand_reputation, unk_brand_reputation).

measured(s15, brand_reputation, well_established_since_1977).

all_consistent(brand_reputation) :-
    consistent(s15, brand_reputation).

evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, well_established_since_1977)).
query(true_val(brand_reputation, unk_brand_reputation)).

% @attr mervin_reputation
% @type categorical
% @canonical false
% @original_name Mervin Manufacturing reputation
% @values longest_running_usa_factory=Longest_running_last_major_board_factory_USA unk_mervin_reputation=Unknown
% @importance 0.70

0.90::acc(s15, mervin_reputation).

0.90::true_val(mervin_reputation, longest_running_usa_factory); 0.10::true_val(mervin_reputation, unk_mervin_reputation).

measured(s15, mervin_reputation, longest_running_usa_factory).

all_consistent(mervin_reputation) :-
    consistent(s15, mervin_reputation).

evidence(all_consistent(mervin_reputation)).
query(true_val(mervin_reputation, longest_running_usa_factory)).
query(true_val(mervin_reputation, unk_mervin_reputation)).

% @attr employee_culture
% @type categorical
% @canonical false
% @original_name Employee culture
% @values handmade_snowboarders_usa=Handmade_by_snowboarders_with_jobs_in_USA unk_employee_culture=Unknown
% @importance 0.95

0.80::acc(s7, employee_culture).

0.80::true_val(employee_culture, handmade_snowboarders_usa); 0.20::true_val(employee_culture, unk_employee_culture).

measured(s7, employee_culture, handmade_snowboarders_usa).

all_consistent(employee_culture) :-
    (indep(s7), consistent(s7, employee_culture) ; \+indep(s7)).

evidence(all_consistent(employee_culture)).
query(true_val(employee_culture, handmade_snowboarders_usa)).
query(true_val(employee_culture, unk_employee_culture)).