0.15::indep(s4).
0.50::indep(s6).
0.20::indep(s11).
0.15::indep(s16).
0.20::indep(s21).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.95::acc(s1, model_name).
0.93::acc(s2, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values dynamo=Dynamo unk_model_name=Unknown
% @importance 0.93

0.97::true_val(model_name, dynamo); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, dynamo).
measured(s2, model_name, dynamo).

all_consistent(model_name) :-
    consistent(s1, model_name),
    consistent(s2, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, dynamo)).
query(true_val(model_name, unk_model_name)).

0.95::acc(s1, brand).
0.93::acc(s2, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 0.93

0.97::true_val(brand, lib_tech); 0.03::true_val(brand, unk_brand).

measured(s1, brand, lib_tech).
measured(s2, brand, lib_tech).

all_consistent(brand) :-
    consistent(s1, brand),
    consistent(s2, brand).

evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

0.92::acc(s2, manufacturer).
0.92::acc(s7, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.70

0.96::true_val(manufacturer, mervin_manufacturing); 0.04::true_val(manufacturer, unk_manufacturer).

measured(s2, manufacturer, mervin_manufacturing).
measured(s7, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :-
    consistent(s2, manufacturer),
    consistent(s7, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

0.92::acc(s7, manufacturing_location).
0.90::acc(s8, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values sequim_wa_usa=Sequim_Carlsborg_Washington_USA unk_manufacturing_location=Unknown
% @importance 0.53

0.95::true_val(manufacturing_location, sequim_wa_usa); 0.05::true_val(manufacturing_location, unk_manufacturing_location).

measured(s7, manufacturing_location, sequim_wa_usa).
measured(s8, manufacturing_location, sequim_wa_usa).

all_consistent(manufacturing_location) :-
    consistent(s7, manufacturing_location),
    consistent(s8, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, sequim_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.90::acc(s8, mervin_founded).
0.80::acc(s9, mervin_founded).

% @attr mervin_founded
% @type categorical
% @canonical false
% @original_name Mervin Manufacturing founded
% @values v1977_olson_saari=1977_by_Mike_Olson_and_Pete_Saari unk_mervin_founded=Unknown
% @importance 0.48

0.93::true_val(mervin_founded, v1977_olson_saari); 0.07::true_val(mervin_founded, unk_mervin_founded).

measured(s8, mervin_founded, v1977_olson_saari).
measured(s9, mervin_founded, v1977_olson_saari).

all_consistent(mervin_founded) :-
    consistent(s8, mervin_founded),
    consistent(s9, mervin_founded).

evidence(all_consistent(mervin_founded)).
query(true_val(mervin_founded, v1977_olson_saari)).
query(true_val(mervin_founded, unk_mervin_founded)).

0.78::acc(s9, parent_company).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company ownership
% @values altamont_capital=Altamont_Capital_Partners unk_parent_company=Unknown
% @importance 0.45

0.68::true_val(parent_company, altamont_capital); 0.32::true_val(parent_company, unk_parent_company).

measured(s9, parent_company, altamont_capital).

all_consistent(parent_company) :-
    consistent(s9, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, altamont_capital)).
query(true_val(parent_company, unk_parent_company)).

0.90::acc(s8, mervin_legacy).

% @attr mervin_legacy
% @type categorical
% @canonical false
% @original_name Mervin is the longest-running and last major board-building factory in the USA
% @values longest_running_us_factory=Longest_running_last_major_US_factory unk_mervin_legacy=Unknown
% @importance 0.50

0.86::true_val(mervin_legacy, longest_running_us_factory); 0.14::true_val(mervin_legacy, unk_mervin_legacy).

measured(s8, mervin_legacy, longest_running_us_factory).

all_consistent(mervin_legacy) :-
    consistent(s8, mervin_legacy).

evidence(all_consistent(mervin_legacy)).
query(true_val(mervin_legacy, longest_running_us_factory)).
query(true_val(mervin_legacy, unk_mervin_legacy)).

0.95::acc(s1, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values v2026_2027=2026-2027_Early_Release unk_model_year=Unknown
% @importance 1.0

0.92::true_val(model_year, v2026_2027); 0.08::true_val(model_year, unk_model_year).

measured(s1, model_year, v2026_2027).

all_consistent(model_year) :-
    consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2026_2027)).
query(true_val(model_year, unk_model_year)).

0.82::acc(s10, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values v2019_2020=2019_2020_winter_season unk_model_first_available_year=Unknown
% @importance 0.60

0.76::true_val(model_first_available_year, v2019_2020); 0.24::true_val(model_first_available_year, unk_model_first_available_year).

measured(s10, model_first_available_year, v2019_2020).

all_consistent(model_first_available_year) :-
    consistent(s10, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, v2019_2020)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.85::acc(s3, model_continuity).

% @attr model_continuity
% @type categorical
% @canonical false
% @original_name The Good Ride review title spans 2020-2026 confirming multi-year model continuity
% @values multi_year_2020_2026=Multi_year_model_continuity_2020_2026 unk_model_continuity=Unknown
% @importance 0.95

0.78::true_val(model_continuity, multi_year_2020_2026); 0.22::true_val(model_continuity, unk_model_continuity).

measured(s3, model_continuity, multi_year_2020_2026).

all_consistent(model_continuity) :-
    consistent(s3, model_continuity).

evidence(all_consistent(model_continuity)).
query(true_val(model_continuity, multi_year_2020_2026)).
query(true_val(model_continuity, unk_model_continuity)).

0.95::acc(s1, redesign_year).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values new_floatier_shape_2027=New_floatier_shape_for_2027 unk_redesign_year=Unknown
% @importance 1.0

0.92::true_val(redesign_year, new_floatier_shape_2027); 0.08::true_val(redesign_year, unk_redesign_year).

measured(s1, redesign_year, new_floatier_shape_2027).

all_consistent(redesign_year) :-
    consistent(s1, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, new_floatier_shape_2027)).
query(true_val(redesign_year, unk_redesign_year)).

0.95::acc(s1, tagline_2027).
0.93::acc(s2, tagline_2027).

% @attr tagline_2027
% @type categorical
% @canonical false
% @original_name 2027 model tagline change
% @values refined_aggressive_versatile=Refined_Aggressive_Versatile unk_tagline_2027=Unknown
% @importance 0.93

0.96::true_val(tagline_2027, refined_aggressive_versatile); 0.04::true_val(tagline_2027, unk_tagline_2027).

measured(s1, tagline_2027, refined_aggressive_versatile).
measured(s2, tagline_2027, refined_aggressive_versatile).

all_consistent(tagline_2027) :-
    consistent(s1, tagline_2027),
    consistent(s2, tagline_2027).

evidence(all_consistent(tagline_2027)).
query(true_val(tagline_2027, refined_aggressive_versatile)).
query(true_val(tagline_2027, unk_tagline_2027)).

0.87::acc(s3, model_unchanged_2026).

% @attr model_unchanged_2026
% @type categorical
% @canonical false
% @original_name 2025-2026 model unchanged from 2025 per The Good Ride
% @values unchanged_from_2025=Unchanged_from_2025 unk_model_unchanged_2026=Unknown
% @importance 0.95

0.80::true_val(model_unchanged_2026, unchanged_from_2025); 0.20::true_val(model_unchanged_2026, unk_model_unchanged_2026).

measured(s3, model_unchanged_2026, unchanged_from_2025).

all_consistent(model_unchanged_2026) :-
    consistent(s3, model_unchanged_2026).

evidence(all_consistent(model_unchanged_2026)).
query(true_val(model_unchanged_2026, unchanged_from_2025)).
query(true_val(model_unchanged_2026, unk_model_unchanged_2026)).

0.86::acc(s3, redesign_year_detail).

% @attr redesign_year_detail
% @type categorical
% @canonical false
% @original_name redesign_year (detail)
% @values blunted_nose_tail=More_blunted_nose_tail_same_sidecut unk_redesign_year_detail=Unknown
% @importance 0.95

0.79::true_val(redesign_year_detail, blunted_nose_tail); 0.21::true_val(redesign_year_detail, unk_redesign_year_detail).

measured(s3, redesign_year_detail, blunted_nose_tail).

all_consistent(redesign_year_detail) :-
    consistent(s3, redesign_year_detail).

evidence(all_consistent(redesign_year_detail)).
query(true_val(redesign_year_detail, blunted_nose_tail)).
query(true_val(redesign_year_detail, unk_redesign_year_detail)).

0.95::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.92::true_val(product_type, snowboard); 0.08::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.92::acc(s2, board_category).
0.80::acc(s4, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.88

0.95::true_val(board_category, all_mountain_freeride); 0.05::true_val(board_category, unk_board_category).

measured(s2, board_category, all_mountain_freeride).
measured(s4, board_category, all_mountain_freeride).

all_consistent(board_category) :-
    consistent(s2, board_category),
    (indep(s4), consistent(s4, board_category) ; \+indep(s4)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

0.86::acc(s3, reviewer_opinion_the_good_ride_terrain).

% @attr reviewer_opinion_the_good_ride_terrain
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (terrain)
% @values border_am_freeride=Sits_right_on_border_of_All_Mountain_and_Freeride unk_reviewer_opinion_the_good_ride_terrain=Unknown
% @importance 0.95

0.79::true_val(reviewer_opinion_the_good_ride_terrain, border_am_freeride); 0.21::true_val(reviewer_opinion_the_good_ride_terrain, unk_reviewer_opinion_the_good_ride_terrain).

measured(s3, reviewer_opinion_the_good_ride_terrain, border_am_freeride).

all_consistent(reviewer_opinion_the_good_ride_terrain) :-
    consistent(s3, reviewer_opinion_the_good_ride_terrain).

evidence(all_consistent(reviewer_opinion_the_good_ride_terrain)).
query(true_val(reviewer_opinion_the_good_ride_terrain, border_am_freeride)).
query(true_val(reviewer_opinion_the_good_ride_terrain, unk_reviewer_opinion_the_good_ride_terrain)).

0.82::acc(s5, reviewer_opinion_snowboardingprofiles).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values mellow_freeride=Mellow_Freeride unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.90

0.73::true_val(reviewer_opinion_snowboardingprofiles, mellow_freeride); 0.27::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s5, reviewer_opinion_snowboardingprofiles, mellow_freeride).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s5, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, mellow_freeride)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

0.80::acc(s4, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.90

0.76::true_val(gender, mens); 0.24::true_val(gender, unk_gender).

measured(s4, gender, mens).

all_consistent(gender) :-
    (indep(s4), consistent(s4, gender) ; \+indep(s4)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.95::acc(s1, graphic_designer_artist).
0.70::acc(s6, graphic_designer_artist).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values mike_parillo=Mike_Parillo unk_graphic_designer_artist=Unknown
% @importance 0.93

0.95::true_val(graphic_designer_artist, mike_parillo); 0.05::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s1, graphic_designer_artist, mike_parillo).
measured(s6, graphic_designer_artist, mike_parillo).

all_consistent(graphic_designer_artist) :-
    consistent(s1, graphic_designer_artist),
    (indep(s6), consistent(s6, graphic_designer_artist) ; \+indep(s6)).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, mike_parillo)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

0.95::acc(s1, available_sizes).
0.65::acc(s6, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values full_9_sizes=150_153_156_156W_159_159W_162_162W_165W partial_4_sizes=156_159_159W_162
% @importance 0.93

0.80::true_val(available_sizes, full_9_sizes); 0.20::true_val(available_sizes, partial_4_sizes).

measured(s1, available_sizes, full_9_sizes).
measured(s6, available_sizes, partial_4_sizes).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes),
    (indep(s6), consistent(s6, available_sizes) ; \+indep(s6)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, full_9_sizes)).
query(true_val(available_sizes, partial_4_sizes)).

0.95::acc(s1, shape).
0.80::acc(s4, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.95

0.96::true_val(shape, tapered_directional); 0.04::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).
measured(s4, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s4), consistent(s4, shape) ; \+indep(s4)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

0.88::acc(s3, taper).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v3=3.0 unk_taper=Unknown
% @importance 0.95

0.81::true_val(taper, v3); 0.19::true_val(taper, unk_taper).

measured(s3, taper, v3).

all_consistent(taper) :-
    consistent(s3, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v3)).
query(true_val(taper, unk_taper)).

0.95::acc(s1, camber_type).
0.80::acc(s4, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c3_camber_directional=C3_Camber_Directional unk_camber_type=Unknown
% @importance 0.95

0.96::true_val(camber_type, c3_camber_directional); 0.04::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, c3_camber_directional).
measured(s4, camber_type, c3_camber_directional).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s4), consistent(s4, camber_type) ; \+indep(s4)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, c3_camber_directional)).
query(true_val(camber_type, unk_camber_type)).

0.88::acc(s3, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values full_camber_passive_bend=Full_camber_with_passive_bend_in_middle unk_camber_description=Unknown
% @importance 0.95

0.81::true_val(camber_description, full_camber_passive_bend); 0.19::true_val(camber_description, unk_camber_description).

measured(s3, camber_description, full_camber_passive_bend).

all_consistent(camber_description) :-
    consistent(s3, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, full_camber_passive_bend)).
query(true_val(camber_description, unk_camber_description)).

0.94::acc(s1, flex_rating_10_manufacturer).
0.78::acc(s4, flex_rating_10_manufacturer).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v6=6.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.95

0.93::true_val(flex_rating_10_manufacturer, v6); 0.07::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s1, flex_rating_10_manufacturer, v6).
measured(s4, flex_rating_10_manufacturer, v6).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s1, flex_rating_10_manufacturer),
    (indep(s4), consistent(s4, flex_rating_10_manufacturer) ; \+indep(s4)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

0.94::acc(s1, flex_rating_10_manufacturer_150).

% @attr flex_rating_10_manufacturer_150
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer (150/153cm)
% @values v5=5.0 unk_flex_rating_10_manufacturer_150=Unknown
% @importance 1.0

0.92::true_val(flex_rating_10_manufacturer_150, v5); 0.08::true_val(flex_rating_10_manufacturer_150, unk_flex_rating_10_manufacturer_150).

measured(s1, flex_rating_10_manufacturer_150, v5).

all_consistent(flex_rating_10_manufacturer_150) :-
    consistent(s1, flex_rating_10_manufacturer_150).

evidence(all_consistent(flex_rating_10_manufacturer_150)).
query(true_val(flex_rating_10_manufacturer_150, v5)).
query(true_val(flex_rating_10_manufacturer_150, unk_flex_rating_10_manufacturer_150)).

0.94::acc(s1, flex_rating_10_manufacturer_162).

% @attr flex_rating_10_manufacturer_162
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer (162cm)
% @values v6_5=6.5 unk_flex_rating_10_manufacturer_162=Unknown
% @importance 1.0

0.92::true_val(flex_rating_10_manufacturer_162, v6_5); 0.08::true_val(flex_rating_10_manufacturer_162, unk_flex_rating_10_manufacturer_162).

measured(s1, flex_rating_10_manufacturer_162, v6_5).

all_consistent(flex_rating_10_manufacturer_162) :-
    consistent(s1, flex_rating_10_manufacturer_162).

evidence(all_consistent(flex_rating_10_manufacturer_162)).
query(true_val(flex_rating_10_manufacturer_162, v6_5)).
query(true_val(flex_rating_10_manufacturer_162, unk_flex_rating_10_manufacturer_162)).

0.94::acc(s1, flex_rating_10_manufacturer_165w).

% @attr flex_rating_10_manufacturer_165w
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer (162W/165W)
% @values v7=7.0 unk_flex_rating_10_manufacturer_165w=Unknown
% @importance 1.0

0.92::true_val(flex_rating_10_manufacturer_165w, v7); 0.08::true_val(flex_rating_10_manufacturer_165w, unk_flex_rating_10_manufacturer_165w).

measured(s1, flex_rating_10_manufacturer_165w, v7).

all_consistent(flex_rating_10_manufacturer_165w) :-
    consistent(s1, flex_rating_10_manufacturer_165w).

evidence(all_consistent(flex_rating_10_manufacturer_165w)).
query(true_val(flex_rating_10_manufacturer_165w, v7)).
query(true_val(flex_rating_10_manufacturer_165w, unk_flex_rating_10_manufacturer_165w)).

0.78::acc(s11, flex_rating_10_evo).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values medium_stiff=Medium_Stiff unk_flex_rating_10_evo=Unknown
% @importance 0.70

0.70::true_val(flex_rating_10_evo, medium_stiff); 0.30::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s11, flex_rating_10_evo, medium_stiff).

all_consistent(flex_rating_10_evo) :-
    (indep(s11), consistent(s11, flex_rating_10_evo) ; \+indep(s11)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium_stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

0.70::acc(s6, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v7=7.0 unk_flex_rating_10=Unknown
% @importance 0.85

0.60::true_val(flex_rating_10, v7); 0.40::true_val(flex_rating_10, unk_flex_rating_10).

measured(s6, flex_rating_10, v7).

all_consistent(flex_rating_10) :-
    (indep(s6), consistent(s6, flex_rating_10) ; \+indep(s6)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.82::acc(s5, flex_feel).
0.87::acc(s3, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_6_5=Medium_6_5_out_of_10 medium_stiff_on_snow=Medium_stiff_on_snow
% @importance 0.93

0.45::true_val(flex_feel, medium_6_5); 0.55::true_val(flex_feel, medium_stiff_on_snow).

measured(s5, flex_feel, medium_6_5).
measured(s3, flex_feel, medium_stiff_on_snow).

all_consistent(flex_feel) :-
    consistent(s5, flex_feel),
    consistent(s3, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_6_5)).
query(true_val(flex_feel, medium_stiff_on_snow)).

0.82::acc(s4, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values pattern_2x4=2x4 unk_mounting_pattern=Unknown
% @importance 0.90

0.76::true_val(mounting_pattern, pattern_2x4); 0.24::true_val(mounting_pattern, unk_mounting_pattern).

measured(s4, mounting_pattern, pattern_2x4).

all_consistent(mounting_pattern) :-
    (indep(s4), consistent(s4, mounting_pattern) ; \+indep(s4)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, pattern_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.94::acc(s1, setback).
0.80::acc(s4, setback).
0.65::acc(s6, setback).

% @attr setback
% @type numeric
% @unit inches
% @canonical true
% @original_name setback
% @values v1_0=1.0 v0_5=0.5
% @importance 0.93

0.70::true_val(setback, v1_0); 0.30::true_val(setback, v0_5).

measured(s1, setback, v1_0).
measured(s4, setback, v1_0).
measured(s6, setback, v0_5).

all_consistent(setback) :-
    consistent(s1, setback),
    (indep(s4), consistent(s4, setback) ; \+indep(s4)),
    (indep(s6), consistent(s6, setback) ; \+indep(s6)).

evidence(all_consistent(setback)).
query(true_val(setback, v1_0)).
query(true_val(setback, v0_5)).

0.95::acc(s1, specs_156).

% @attr specs_156
% @type categorical
% @canonical false
% @original_name 156cm size specs
% @values spec_156_full=Contact_111cm_Sidecut_8_0m_Nose_29_7_Tail_29_4_Waist_25_5_Stance_20_25to25 unk_specs_156=Unknown
% @importance 1.0

0.92::true_val(specs_156, spec_156_full); 0.08::true_val(specs_156, unk_specs_156).

measured(s1, specs_156, spec_156_full).

all_consistent(specs_156) :-
    consistent(s1, specs_156).

evidence(all_consistent(specs_156)).
query(true_val(specs_156, spec_156_full)).
query(true_val(specs_156, unk_specs_156)).

0.95::acc(s1, specs_159).

% @attr specs_159
% @type categorical
% @canonical false
% @original_name 159cm size specs
% @values spec_159_full=Contact_114cm_Sidecut_8_1m_Nose_30_0_Tail_29_7_Waist_25_7_Stance_20_25to25 unk_specs_159=Unknown
% @importance 1.0

0.92::true_val(specs_159, spec_159_full); 0.08::true_val(specs_159, unk_specs_159).

measured(s1, specs_159, spec_159_full).

all_consistent(specs_159) :-
    consistent(s1, specs_159).

evidence(all_consistent(specs_159)).
query(true_val(specs_159, spec_159_full)).
query(true_val(specs_159, unk_specs_159)).

0.95::acc(s1, specs_156w).

% @attr specs_156w
% @type categorical
% @canonical false
% @original_name 156W size specs
% @values spec_156w_full=Contact_111cm_Sidecut_8_0m_Nose_30_7_Tail_30_4_Waist_26_5_Stance_20_25to25 unk_specs_156w=Unknown
% @importance 1.0

0.92::true_val(specs_156w, spec_156w_full); 0.08::true_val(specs_156w, unk_specs_156w).

measured(s1, specs_156w, spec_156w_full).

all_consistent(specs_156w) :-
    consistent(s1, specs_156w).

evidence(all_consistent(specs_156w)).
query(true_val(specs_156w, spec_156w_full)).
query(true_val(specs_156w, unk_specs_156w)).

0.95::acc(s1, specs_159w).

% @attr specs_159w
% @type categorical
% @canonical false
% @original_name 159W size specs
% @values spec_159w_full=Contact_114cm_Sidecut_8_1m_Nose_31_0_Tail_30_7_Waist_26_7_Stance_20_25to25 unk_specs_159w=Unknown
% @importance 1.0

0.92::true_val(specs_159w, spec_159w_full); 0.08::true_val(specs_159w, unk_specs_159w).

measured(s1, specs_159w, spec_159w_full).

all_consistent(specs_159w) :-
    consistent(s1, specs_159w).

evidence(all_consistent(specs_159w)).
query(true_val(specs_159w, spec_159w_full)).
query(true_val(specs_159w, unk_specs_159w)).

0.95::acc(s1, specs_162w).

% @attr specs_162w
% @type categorical
% @canonical false
% @original_name 162W size specs
% @values spec_162w_full=Contact_116cm_Sidecut_8_2m_Nose_31_3_Tail_31_1_Waist_26_8_Stance_20_25to25 unk_specs_162w=Unknown
% @importance 1.0

0.92::true_val(specs_162w, spec_162w_full); 0.08::true_val(specs_162w, unk_specs_162w).

measured(s1, specs_162w, spec_162w_full).

all_consistent(specs_162w) :-
    consistent(s1, specs_162w).

evidence(all_consistent(specs_162w)).
query(true_val(specs_162w, spec_162w_full)).
query(true_val(specs_162w, unk_specs_162w)).

0.95::acc(s1, specs_165w).

% @attr specs_165w
% @type categorical
% @canonical false
% @original_name 165W size specs
% @values spec_165w_full=Contact_118cm_Sidecut_8_3m_Nose_31_4_Tail_31_2_Waist_26_8_Stance_20_25to25 unk_specs_165w=Unknown
% @importance 1.0

0.92::true_val(specs_165w, spec_165w_full); 0.08::true_val(specs_165w, unk_specs_165w).

measured(s1, specs_165w, spec_165w_full).

all_consistent(specs_165w) :-
    consistent(s1, specs_165w).

evidence(all_consistent(specs_165w)).
query(true_val(specs_165w, spec_165w_full)).
query(true_val(specs_165w, unk_specs_165w)).

0.95::acc(s1, specs_150).

% @attr specs_150
% @type categorical
% @canonical false
% @original_name 150cm size specs (NEW for 2027)
% @values spec_150_full=Contact_105cm_Sidecut_7_8m_Nose_28_2_Tail_27_8_Waist_24_3_Flex_5 unk_specs_150=Unknown
% @importance 1.0

0.92::true_val(specs_150, spec_150_full); 0.08::true_val(specs_150, unk_specs_150).

measured(s1, specs_150, spec_150_full).

all_consistent(specs_150) :-
    consistent(s1, specs_150).

evidence(all_consistent(specs_150)).
query(true_val(specs_150, spec_150_full)).
query(true_val(specs_150, unk_specs_150)).

0.95::acc(s1, specs_153).

% @attr specs_153
% @type categorical
% @canonical false
% @original_name 153cm size specs (NEW for 2027)
% @values spec_153_full=Contact_108cm_Sidecut_7_9m_Nose_29_3_Tail_29_0_Waist_25_2_Flex_5 unk_specs_153=Unknown
% @importance 1.0

0.92::true_val(specs_153, spec_153_full); 0.08::true_val(specs_153, unk_specs_153).

measured(s1, specs_153, spec_153_full).

all_consistent(specs_153) :-
    consistent(s1, specs_153).

evidence(all_consistent(specs_153)).
query(true_val(specs_153, spec_153_full)).
query(true_val(specs_153, unk_specs_153)).

0.95::acc(s1, specs_162).

% @attr specs_162
% @type categorical
% @canonical false
% @original_name 162cm standard size specs (NEW for 2027)
% @values spec_162_full=Contact_116cm_Sidecut_8_2m_Nose_30_3_Tail_30_0_Waist_25_8_Flex_6_5 unk_specs_162=Unknown
% @importance 1.0

0.92::true_val(specs_162, spec_162_full); 0.08::true_val(specs_162, unk_specs_162).

measured(s1, specs_162, spec_162_full).

all_consistent(specs_162) :-
    consistent(s1, specs_162).

evidence(all_consistent(specs_162)).
query(true_val(specs_162, spec_162_full)).
query(true_val(specs_162, unk_specs_162)).

0.94::acc(s1, contact_length_size).
0.68::acc(s6, contact_length_size).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size (156cm)
% @values v111=111.0 v115=115.0
% @importance 0.93

0.72::true_val(contact_length_size, v111); 0.28::true_val(contact_length_size, v115).

measured(s1, contact_length_size, v111).
measured(s6, contact_length_size, v115).

all_consistent(contact_length_size) :-
    consistent(s1, contact_length_size),
    (indep(s6), consistent(s6, contact_length_size) ; \+indep(s6)).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v111)).
query(true_val(contact_length_size, v115)).

0.94::acc(s1, contact_length_size_159).
0.68::acc(s6, contact_length_size_159).

% @attr contact_length_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (159cm)
% @values v114=114.0 v117=117.0
% @importance 0.93

0.72::true_val(contact_length_size_159, v114); 0.28::true_val(contact_length_size_159, v117).

measured(s1, contact_length_size_159, v114).
measured(s6, contact_length_size_159, v117).

all_consistent(contact_length_size_159) :-
    consistent(s1, contact_length_size_159),
    (indep(s6), consistent(s6, contact_length_size_159) ; \+indep(s6)).

evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v114)).
query(true_val(contact_length_size_159, v117)).

0.94::acc(s1, sidecut_radius_size).
0.68::acc(s6, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size (159cm)
% @values v8_1=8.1 v8_3=8.3
% @importance 0.93

0.72::true_val(sidecut_radius_size, v8_1); 0.28::true_val(sidecut_radius_size, v8_3).

measured(s1, sidecut_radius_size, v8_1).
measured(s6, sidecut_radius_size, v8_3).

all_consistent(sidecut_radius_size) :-
    consistent(s1, sidecut_radius_size),
    (indep(s6), consistent(s6, sidecut_radius_size) ; \+indep(s6)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_1)).
query(true_val(sidecut_radius_size, v8_3)).

0.94::acc(s1, tip_tail_width_size).
0.68::acc(s6, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size (156cm nose)
% @values v29_7=29.7 v29_9=29.9
% @importance 0.93

0.72::true_val(tip_tail_width_size, v29_7); 0.28::true_val(tip_tail_width_size, v29_9).

measured(s1, tip_tail_width_size, v29_7).
measured(s6, tip_tail_width_size, v29_9).

all_consistent(tip_tail_width_size) :-
    consistent(s1, tip_tail_width_size),
    (indep(s6), consistent(s6, tip_tail_width_size) ; \+indep(s6)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_7)).
query(true_val(tip_tail_width_size, v29_9)).

0.94::acc(s1, core_material).
0.80::acc(s4, core_material).
0.72::acc(s12, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values op_aspen_paulownia=OP_75pct_Aspen_25pct_Paulownia unk_core_material=Unknown
% @importance 0.87

0.96::true_val(core_material, op_aspen_paulownia); 0.04::true_val(core_material, unk_core_material).

measured(s1, core_material, op_aspen_paulownia).
measured(s4, core_material, op_aspen_paulownia).
measured(s12, core_material, op_aspen_paulownia).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s4), consistent(s4, core_material) ; \+indep(s4)),
    consistent(s12, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, op_aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

0.80::acc(s4, laminate).
0.68::acc(s6, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_biax_fiberglass=Tri_Ax_Bi_Ax_Fiberglass unk_laminate=Unknown
% @importance 0.88

0.90::true_val(laminate, triax_biax_fiberglass); 0.10::true_val(laminate, unk_laminate).

measured(s4, laminate, triax_biax_fiberglass).
measured(s6, laminate, triax_biax_fiberglass).

all_consistent(laminate) :-
    (indep(s4), consistent(s4, laminate) ; \+indep(s4)),
    (indep(s6), consistent(s6, laminate) ; \+indep(s6)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_fiberglass)).
query(true_val(laminate, unk_laminate)).

0.82::acc(s4, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values eco_sub_tnt=Eco_Sublimated_TNT_UHMW_dual_layer unk_base_material=Unknown
% @importance 0.90

0.76::true_val(base_material, eco_sub_tnt); 0.24::true_val(base_material, unk_base_material).

measured(s4, base_material, eco_sub_tnt).

all_consistent(base_material) :-
    (indep(s4), consistent(s4, base_material) ; \+indep(s4)).

evidence(all_consistent(base_material)).
query(true_val(base_material, eco_sub_tnt)).
query(true_val(base_material, unk_base_material)).

0.82::acc(s5, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values extruded=Extruded unk_base_type=Unknown
% @importance 0.90

0.73::true_val(base_type, extruded); 0.27::true_val(base_type, unk_base_type).

measured(s5, base_type, extruded).

all_consistent(base_type) :-
    consistent(s5, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, extruded)).
query(true_val(base_type, unk_base_type)).

0.82::acc(s4, topsheet).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values eco_sub_poly=Eco_Sublimated_Poly_Topsheet unk_topsheet=Unknown
% @importance 0.90

0.76::true_val(topsheet, eco_sub_poly); 0.24::true_val(topsheet, unk_topsheet).

measured(s4, topsheet, eco_sub_poly).

all_consistent(topsheet) :-
    (indep(s4), consistent(s4, topsheet) ; \+indep(s4)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sub_poly)).
query(true_val(topsheet, unk_topsheet)).

0.82::acc(s4, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch=Birch unk_sidewall_material=Unknown
% @importance 0.90

0.76::true_val(sidewall_material, birch); 0.24::true_val(sidewall_material, unk_sidewall_material).

measured(s4, sidewall_material, birch).

all_consistent(sidewall_material) :-
    (indep(s4), consistent(s4, sidewall_material) ; \+indep(s4)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.82::acc(s4, sidewall_material_uhmw).

% @attr sidewall_material_uhmw
% @type categorical
% @canonical false
% @original_name sidewall_material (UHMW sintered)
% @values uhmw_sintered=UHMW_Sintered_Polyethylene unk_sidewall_material_uhmw=Unknown
% @importance 0.90

0.76::true_val(sidewall_material_uhmw, uhmw_sintered); 0.24::true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw).

measured(s4, sidewall_material_uhmw, uhmw_sintered).

all_consistent(sidewall_material_uhmw) :-
    (indep(s4), consistent(s4, sidewall_material_uhmw) ; \+indep(s4)).

evidence(all_consistent(sidewall_material_uhmw)).
query(true_val(sidewall_material_uhmw, uhmw_sintered)).
query(true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw)).

0.95::acc(s1, edge_technology).
0.82::acc(s4, edge_technology).
0.80::acc(s13, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction_7=Magne_Traction_7_serrations unk_edge_technology=Unknown
% @importance 0.92

0.97::true_val(edge_technology, magne_traction_7); 0.03::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, magne_traction_7).
measured(s4, edge_technology, magne_traction_7).
measured(s13, edge_technology, magne_traction_7).

all_consistent(edge_technology) :-
    consistent(s1, edge_technology),
    (indep(s4), consistent(s4, edge_technology) ; \+indep(s4)),
    consistent(s13, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7)).
query(true_val(edge_technology, unk_edge_technology)).

0.88::acc(s3, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values medium_mag_grips_well=Seven_medium_Magnetraction_bumps_grips_very_well unk_edge_hold=Unknown
% @importance 0.95

0.81::true_val(edge_hold, medium_mag_grips_well); 0.19::true_val(edge_hold, unk_edge_hold).

measured(s3, edge_hold, medium_mag_grips_well).

all_consistent(edge_hold) :-
    consistent(s3, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, medium_mag_grips_well)).
query(true_val(edge_hold, unk_edge_hold)).

0.82::acc(s4, tip_tail_protection).

% @attr tip_tail_protection
% @type categorical
% @canonical false
% @original_name Tip/tail protection
% @values uhmw_deflection=UHMW_Tip_Tail_Impact_Deflection unk_tip_tail_protection=Unknown
% @importance 0.90

0.76::true_val(tip_tail_protection, uhmw_deflection); 0.24::true_val(tip_tail_protection, unk_tip_tail_protection).

measured(s4, tip_tail_protection, uhmw_deflection).

all_consistent(tip_tail_protection) :-
    (indep(s4), consistent(s4, tip_tail_protection) ; \+indep(s4)).

evidence(all_consistent(tip_tail_protection)).
query(true_val(tip_tail_protection, uhmw_deflection)).
query(true_val(tip_tail_protection, unk_tip_tail_protection)).

0.60::acc(s14, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values solid_durable_superficial_scuffs=Solid_boards_durable_construction_superficial_topsheet_scuffs unk_user_review_forum=Unknown
% @importance 0.70

0.50::true_val(user_review_forum, solid_durable_superficial_scuffs); 0.50::true_val(user_review_forum, unk_user_review_forum).

measured(s14, user_review_forum, solid_durable_superficial_scuffs).

all_consistent(user_review_forum) :-
    consistent(s14, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, solid_durable_superficial_scuffs)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.60::acc(s14, uhmw_durability_note).

% @attr uhmw_durability_note
% @type categorical
% @canonical false
% @original_name UHMW tip/tail durability note
% @values better_than_steel_wrap=Better_more_durable_than_steel_wrapped_nose_tail unk_uhmw_durability_note=Unknown
% @importance 0.70

0.50::true_val(uhmw_durability_note, better_than_steel_wrap); 0.50::true_val(uhmw_durability_note, unk_uhmw_durability_note).

measured(s14, uhmw_durability_note, better_than_steel_wrap).

all_consistent(uhmw_durability_note) :-
    consistent(s14, uhmw_durability_note).

evidence(all_consistent(uhmw_durability_note)).
query(true_val(uhmw_durability_note, better_than_steel_wrap)).
query(true_val(uhmw_durability_note, unk_uhmw_durability_note)).

0.90::acc(s7, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_wood=FSC_certified_wood_cores unk_sustainability_certification=Unknown
% @importance 0.55

0.86::true_val(sustainability_certification, fsc_certified_wood); 0.14::true_val(sustainability_certification, unk_sustainability_certification).

measured(s7, sustainability_certification, fsc_certified_wood).

all_consistent(sustainability_certification) :-
    consistent(s7, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_wood)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.90::acc(s7, sustainability_certification_hydro).

% @attr sustainability_certification_hydro
% @type categorical
% @canonical false
% @original_name sustainability_certification (hydroelectric)
% @values hydro_89_6_pct=Factory_powered_89_6pct_hydroelectric unk_sustainability_certification_hydro=Unknown
% @importance 0.55

0.86::true_val(sustainability_certification_hydro, hydro_89_6_pct); 0.14::true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro).

measured(s7, sustainability_certification_hydro, hydro_89_6_pct).

all_consistent(sustainability_certification_hydro) :-
    consistent(s7, sustainability_certification_hydro).

evidence(all_consistent(sustainability_certification_hydro)).
query(true_val(sustainability_certification_hydro, hydro_89_6_pct)).
query(true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro)).

0.90::acc(s7, sustainability_certification_biodiesel).

% @attr sustainability_certification_biodiesel
% @type categorical
% @canonical false
% @original_name sustainability_certification (biodiesel heating)
% @values renewable_biodiesel=Factory_heating_from_renewable_biodiesel unk_sustainability_certification_biodiesel=Unknown
% @importance 0.55

0.86::true_val(sustainability_certification_biodiesel, renewable_biodiesel); 0.14::true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel).

measured(s7, sustainability_certification_biodiesel, renewable_biodiesel).

all_consistent(sustainability_certification_biodiesel) :-
    consistent(s7, sustainability_certification_biodiesel).

evidence(all_consistent(sustainability_certification_biodiesel)).
query(true_val(sustainability_certification_biodiesel, renewable_biodiesel)).
query(true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel)).

0.88::acc(s8, sustainability_certification_waste).

% @attr sustainability_certification_waste
% @type categorical
% @canonical false
% @original_name sustainability_certification (zero hazardous waste)
% @values zero_hazardous_waste=Zero_hazardous_waste_production unk_sustainability_certification_waste=Unknown
% @importance 0.50

0.84::true_val(sustainability_certification_waste, zero_hazardous_waste); 0.16::true_val(sustainability_certification_waste, unk_sustainability_certification_waste).

measured(s8, sustainability_certification_waste, zero_hazardous_waste).

all_consistent(sustainability_certification_waste) :-
    consistent(s8, sustainability_certification_waste).

evidence(all_consistent(sustainability_certification_waste)).
query(true_val(sustainability_certification_waste, zero_hazardous_waste)).
query(true_val(sustainability_certification_waste, unk_sustainability_certification_waste)).

0.82::acc(s4, sustainability_certification_printing).

% @attr sustainability_certification_printing
% @type categorical
% @canonical false
% @original_name sustainability_certification (eco-sublimated printing)
% @values eco_sublimated=Eco_sublimated_printing_on_base_and_topsheet unk_sustainability_certification_printing=Unknown
% @importance 0.90

0.76::true_val(sustainability_certification_printing, eco_sublimated); 0.24::true_val(sustainability_certification_printing, unk_sustainability_certification_printing).

measured(s4, sustainability_certification_printing, eco_sublimated).

all_consistent(sustainability_certification_printing) :-
    (indep(s4), consistent(s4, sustainability_certification_printing) ; \+indep(s4)).

evidence(all_consistent(sustainability_certification_printing)).
query(true_val(sustainability_certification_printing, eco_sublimated)).
query(true_val(sustainability_certification_printing, unk_sustainability_certification_printing)).

0.95::acc(s1, price_usd_msrp).
0.93::acc(s2, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v579_99=579.99 unk_price_usd_msrp=Unknown
% @importance 0.93

0.97::true_val(price_usd_msrp, v579_99); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s1, price_usd_msrp, v579_99).
measured(s2, price_usd_msrp, v579_99).

all_consistent(price_usd_msrp) :-
    consistent(s1, price_usd_msrp),
    consistent(s2, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v579_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.70::acc(s6, price_aud_merchant).
0.80::acc(s4, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v969_99=969.99 unk_price_aud_merchant=Unknown
% @importance 0.88

0.93::true_val(price_aud_merchant, v969_99); 0.07::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s6, price_aud_merchant, v969_99).
measured(s4, price_aud_merchant, v969_99).

all_consistent(price_aud_merchant) :-
    (indep(s6), consistent(s6, price_aud_merchant) ; \+indep(s6)),
    (indep(s4), consistent(s4, price_aud_merchant) ; \+indep(s4)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v969_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.90::acc(s2, price_usd_libtech_sale).

% @attr price_usd_libtech_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name Lib Tech direct (2025-2026 model on sale)
% @values v405_99=405.99 unk_price_usd_libtech_sale=Unknown
% @importance 0.85

0.87::true_val(price_usd_libtech_sale, v405_99); 0.13::true_val(price_usd_libtech_sale, unk_price_usd_libtech_sale).

measured(s2, price_usd_libtech_sale, v405_99).

all_consistent(price_usd_libtech_sale) :-
    consistent(s2, price_usd_libtech_sale).

evidence(all_consistent(price_usd_libtech_sale)).
query(true_val(price_usd_libtech_sale, v405_99)).
query(true_val(price_usd_libtech_sale, unk_price_usd_libtech_sale)).

0.85::acc(s3, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v463_99=463.99 unk_price_usd_evo=Unknown
% @importance 0.95

0.78::true_val(price_usd_evo, v463_99); 0.22::true_val(price_usd_evo, unk_price_usd_evo).

measured(s3, price_usd_evo, v463_99).

all_consistent(price_usd_evo) :-
    consistent(s3, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v463_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.85::acc(s3, price_usd_evo_full).

% @attr price_usd_evo_full
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo (full price)
% @values v579_99=579.99 unk_price_usd_evo_full=Unknown
% @importance 0.95

0.78::true_val(price_usd_evo_full, v579_99); 0.22::true_val(price_usd_evo_full, unk_price_usd_evo_full).

measured(s3, price_usd_evo_full, v579_99).

all_consistent(price_usd_evo_full) :-
    consistent(s3, price_usd_evo_full).

evidence(all_consistent(price_usd_evo_full)).
query(true_val(price_usd_evo_full, v579_99)).
query(true_val(price_usd_evo_full, unk_price_usd_evo_full)).

0.85::acc(s3, price_usd_sun_ski).

% @attr price_usd_sun_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name Sun and Ski Sports price
% @values v579_99=579.99 unk_price_usd_sun_ski=Unknown
% @importance 0.95

0.78::true_val(price_usd_sun_ski, v579_99); 0.22::true_val(price_usd_sun_ski, unk_price_usd_sun_ski).

measured(s3, price_usd_sun_ski, v579_99).

all_consistent(price_usd_sun_ski) :-
    consistent(s3, price_usd_sun_ski).

evidence(all_consistent(price_usd_sun_ski)).
query(true_val(price_usd_sun_ski, v579_99)).
query(true_val(price_usd_sun_ski, unk_price_usd_sun_ski)).

0.85::acc(s3, price_usd_tactics).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v579_99=579.99 unk_price_usd_tactics=Unknown
% @importance 0.95

0.78::true_val(price_usd_tactics, v579_99); 0.22::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s3, price_usd_tactics, v579_99).

all_consistent(price_usd_tactics) :-
    consistent(s3, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v579_99)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

0.85::acc(s3, price_usd_backcountry).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v579_99=579.99 unk_price_usd_backcountry=Unknown
% @importance 0.95

0.78::true_val(price_usd_backcountry, v579_99); 0.22::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s3, price_usd_backcountry, v579_99).

all_consistent(price_usd_backcountry) :-
    consistent(s3, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v579_99)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

0.85::acc(s3, price_usd_the_house).

% @attr price_usd_the_house
% @type numeric
% @unit USD
% @canonical false
% @original_name The House price
% @values v579_99=579.99 unk_price_usd_the_house=Unknown
% @importance 0.95

0.78::true_val(price_usd_the_house, v579_99); 0.22::true_val(price_usd_the_house, unk_price_usd_the_house).

measured(s3, price_usd_the_house, v579_99).

all_consistent(price_usd_the_house) :-
    consistent(s3, price_usd_the_house).

evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v579_99)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

0.85::acc(s3, price_usd_blauer).

% @attr price_usd_blauer
% @type numeric
% @unit USD
% @canonical false
% @original_name Blauer Board Shop price
% @values v579_99=579.99 unk_price_usd_blauer=Unknown
% @importance 0.95

0.78::true_val(price_usd_blauer, v579_99); 0.22::true_val(price_usd_blauer, unk_price_usd_blauer).

measured(s3, price_usd_blauer, v579_99).

all_consistent(price_usd_blauer) :-
    consistent(s3, price_usd_blauer).

evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v579_99)).
query(true_val(price_usd_blauer, unk_price_usd_blauer)).

0.72::acc(s15, price_usd_701cycle).

% @attr price_usd_701cycle
% @type numeric
% @unit USD
% @canonical false
% @original_name 701 Cycle and Sport price (2025-2026 on sale)
% @values v434_99=434.99 unk_price_usd_701cycle=Unknown
% @importance 0.75

0.54::true_val(price_usd_701cycle, v434_99); 0.46::true_val(price_usd_701cycle, unk_price_usd_701cycle).

measured(s15, price_usd_701cycle, v434_99).

all_consistent(price_usd_701cycle) :-
    consistent(s15, price_usd_701cycle).

evidence(all_consistent(price_usd_701cycle)).
query(true_val(price_usd_701cycle, v434_99)).
query(true_val(price_usd_701cycle, unk_price_usd_701cycle)).

0.85::acc(s3, price_eur_stoked).

% @attr price_eur_stoked
% @type numeric
% @unit EUR
% @canonical false
% @original_name Stoked Board Shop EU price (prior year)
% @values v412_95=412.95 unk_price_eur_stoked=Unknown
% @importance 0.95

0.78::true_val(price_eur_stoked, v412_95); 0.22::true_val(price_eur_stoked, unk_price_eur_stoked).

measured(s3, price_eur_stoked, v412_95).

all_consistent(price_eur_stoked) :-
    consistent(s3, price_eur_stoked).

evidence(all_consistent(price_eur_stoked)).
query(true_val(price_eur_stoked, v412_95)).
query(true_val(price_eur_stoked, unk_price_eur_stoked)).

0.85::acc(s3, price_eur_snowcountry).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name SnowCountry EU price
% @values v501_46=501.46 unk_price_eur_snowcountry=Unknown
% @importance 0.95

0.78::true_val(price_eur_snowcountry, v501_46); 0.22::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s3, price_eur_snowcountry, v501_46).

all_consistent(price_eur_snowcountry) :-
    consistent(s3, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v501_46)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

0.85::acc(s3, price_cad_prfo).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v510_99=510.99 unk_price_cad_prfo=Unknown
% @importance 0.95

0.78::true_val(price_cad_prfo, v510_99); 0.22::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s3, price_cad_prfo, v510_99).

all_consistent(price_cad_prfo) :-
    consistent(s3, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v510_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

0.72::acc(s16, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_preorder_2027=Available_2027_preorder unk_availability_status=Unknown
% @importance 0.60

0.60::true_val(availability_status, available_preorder_2027); 0.40::true_val(availability_status, unk_availability_status).

measured(s16, availability_status, available_preorder_2027).

all_consistent(availability_status) :-
    (indep(s16), consistent(s16, availability_status) ; \+indep(s16)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_preorder_2027)).
query(true_val(availability_status, unk_availability_status)).

0.80::acc(s4, estimated_availability_date).
0.68::acc(s6, estimated_availability_date).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_2026=Preorder_estimated_May_2026_delivery unk_estimated_availability_date=Unknown
% @importance 0.88

0.90::true_val(estimated_availability_date, may_2026); 0.10::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s4, estimated_availability_date, may_2026).
measured(s6, estimated_availability_date, may_2026).

all_consistent(estimated_availability_date) :-
    (indep(s4), consistent(s4, estimated_availability_date) ; \+indep(s4)),
    (indep(s6), consistent(s6, estimated_availability_date) ; \+indep(s6)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.95::acc(s1, availability_status_early_release).

% @attr availability_status_early_release
% @type categorical
% @canonical false
% @original_name availability_status (early release)
% @values early_release_2027=Early_release_in_stock_preorder unk_availability_status_early_release=Unknown
% @importance 1.0

0.92::true_val(availability_status_early_release, early_release_2027); 0.08::true_val(availability_status_early_release, unk_availability_status_early_release).

measured(s1, availability_status_early_release, early_release_2027).

all_consistent(availability_status_early_release) :-
    consistent(s1, availability_status_early_release).

evidence(all_consistent(availability_status_early_release)).
query(true_val(availability_status_early_release, early_release_2027)).
query(true_val(availability_status_early_release, unk_availability_status_early_release)).

0.80::acc(s4, rider_level).
0.82::acc(s5, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_to_Advanced unk_rider_level=Unknown
% @importance 0.90

0.93::true_val(rider_level, intermediate_advanced); 0.07::true_val(rider_level, unk_rider_level).

measured(s4, rider_level, intermediate_advanced).
measured(s5, rider_level, intermediate_advanced).

all_consistent(rider_level) :-
    (indep(s4), consistent(s4, rider_level) ; \+indep(s4)),
    consistent(s5, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

0.88::acc(s3, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_Expert unk_skill_level_recommendation=Unknown
% @importance 0.95

0.81::true_val(skill_level_recommendation, advanced_expert); 0.19::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s3, skill_level_recommendation, advanced_expert).

all_consistent(skill_level_recommendation) :-
    consistent(s3, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.95::acc(s1, terrain_suitability).
0.80::acc(s4, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mtn_freeride_varied=All_mountain_freeride_varied_conditions unk_terrain_suitability=Unknown
% @importance 0.95

0.96::true_val(terrain_suitability, all_mtn_freeride_varied); 0.04::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, all_mtn_freeride_varied).
measured(s4, terrain_suitability, all_mtn_freeride_varied).

all_consistent(terrain_suitability) :-
    consistent(s1, terrain_suitability),
    (indep(s4), consistent(s4, terrain_suitability) ; \+indep(s4)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mtn_freeride_varied)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.82::acc(s4, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freeride_carving_cruising=Freeride_carving_cruising unk_riding_style=Unknown
% @importance 0.90

0.76::true_val(riding_style, freeride_carving_cruising); 0.24::true_val(riding_style, unk_riding_style).

measured(s4, riding_style, freeride_carving_cruising).

all_consistent(riding_style) :-
    (indep(s4), consistent(s4, riding_style) ; \+indep(s4)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freeride_carving_cruising)).
query(true_val(riding_style, unk_riding_style)).

0.88::acc(s3, terrain_suitability_hard_snow).

% @attr terrain_suitability_hard_snow
% @type categorical
% @canonical false
% @original_name terrain_suitability (hard snow and groomers)
% @values shines_hard_snow_groomers=Really_shines_on_groomers_great_for_hard_snow unk_terrain_suitability_hard_snow=Unknown
% @importance 0.95

0.81::true_val(terrain_suitability_hard_snow, shines_hard_snow_groomers); 0.19::true_val(terrain_suitability_hard_snow, unk_terrain_suitability_hard_snow).

measured(s3, terrain_suitability_hard_snow, shines_hard_snow_groomers).

all_consistent(terrain_suitability_hard_snow) :-
    consistent(s3, terrain_suitability_hard_snow).

evidence(all_consistent(terrain_suitability_hard_snow)).
query(true_val(terrain_suitability_hard_snow, shines_hard_snow_groomers)).
query(true_val(terrain_suitability_hard_snow, unk_terrain_suitability_hard_snow)).

0.80::acc(s5, reviewer_opinion_snowboardingprofiles_technique).

% @attr reviewer_opinion_snowboardingprofiles_technique
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (technique)
% @values catch_feel_difficult=Catch_feel_and_effort_to_initiate_turns_makes_focusing_on_technique_difficult unk_reviewer_opinion_snowboardingprofiles_technique=Unknown
% @importance 0.90

0.73::true_val(reviewer_opinion_snowboardingprofiles_technique, catch_feel_difficult); 0.27::true_val(reviewer_opinion_snowboardingprofiles_technique, unk_reviewer_opinion_snowboardingprofiles_technique).

measured(s5, reviewer_opinion_snowboardingprofiles_technique, catch_feel_difficult).

all_consistent(reviewer_opinion_snowboardingprofiles_technique) :-
    consistent(s5, reviewer_opinion_snowboardingprofiles_technique).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_technique)).
query(true_val(reviewer_opinion_snowboardingprofiles_technique, catch_feel_difficult)).
query(true_val(reviewer_opinion_snowboardingprofiles_technique, unk_reviewer_opinion_snowboardingprofiles_technique)).

0.80::acc(s5, reviewer_opinion_snowboardingprofiles_positioning).

% @attr reviewer_opinion_snowboardingprofiles_positioning
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (positioning)
% @values freeride_not_too_directional=Wants_freeride_side_not_too_directional_not_too_stiff unk_reviewer_opinion_snowboardingprofiles_positioning=Unknown
% @importance 0.90

0.73::true_val(reviewer_opinion_snowboardingprofiles_positioning, freeride_not_too_directional); 0.27::true_val(reviewer_opinion_snowboardingprofiles_positioning, unk_reviewer_opinion_snowboardingprofiles_positioning).

measured(s5, reviewer_opinion_snowboardingprofiles_positioning, freeride_not_too_directional).

all_consistent(reviewer_opinion_snowboardingprofiles_positioning) :-
    consistent(s5, reviewer_opinion_snowboardingprofiles_positioning).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_positioning)).
query(true_val(reviewer_opinion_snowboardingprofiles_positioning, freeride_not_too_directional)).
query(true_val(reviewer_opinion_snowboardingprofiles_positioning, unk_reviewer_opinion_snowboardingprofiles_positioning)).

0.93::acc(s1, pro_rider_name).
0.90::acc(s2, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values sweetin_hansen=Austen_Sweetin_and_Phil_Hansen unk_pro_rider_name=Unknown
% @importance 0.93

0.96::true_val(pro_rider_name, sweetin_hansen); 0.04::true_val(pro_rider_name, unk_pro_rider_name).

measured(s1, pro_rider_name, sweetin_hansen).
measured(s2, pro_rider_name, sweetin_hansen).

all_consistent(pro_rider_name) :-
    consistent(s1, pro_rider_name),
    consistent(s2, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, sweetin_hansen)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.88::acc(s3, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values excellent_pop_grip_fun=Excellent_pop_near_excellent_grip_very_fun unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.81::true_val(reviewer_opinion_the_good_ride, excellent_pop_grip_fun); 0.19::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s3, reviewer_opinion_the_good_ride, excellent_pop_grip_fun).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s3, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, excellent_pop_grip_fun)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.87::acc(s3, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values powder_weak_base_slow=Not_great_in_powder_base_loses_wax_feels_slow unk_negative_aspect=Unknown
% @importance 0.95

0.80::true_val(negative_aspect, powder_weak_base_slow); 0.20::true_val(negative_aspect, unk_negative_aspect).

measured(s3, negative_aspect, powder_weak_base_slow).

all_consistent(negative_aspect) :-
    consistent(s3, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, powder_weak_base_slow)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.88::acc(s3, carving_rating_tgr).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(carving_rating_tgr, great); 0.19::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s3, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :-
    consistent(s3, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

0.88::acc(s3, speed_rating_tgr).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values great=Great unk_speed_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(speed_rating_tgr, great); 0.19::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s3, speed_rating_tgr, great).

all_consistent(speed_rating_tgr) :-
    consistent(s3, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, great)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

0.88::acc(s3, chatter_performance).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values great=Great unk_chatter_performance=Unknown
% @importance 0.95

0.81::true_val(chatter_performance, great); 0.19::true_val(chatter_performance, unk_chatter_performance).

measured(s3, chatter_performance, great).

all_consistent(chatter_performance) :-
    consistent(s3, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, great)).
query(true_val(chatter_performance, unk_chatter_performance)).

0.88::acc(s3, jumps_rating_tgr).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(jumps_rating_tgr, great); 0.19::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s3, jumps_rating_tgr, great).

all_consistent(jumps_rating_tgr) :-
    consistent(s3, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

0.88::acc(s3, powder_rating_tgr).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values average=Average unk_powder_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(powder_rating_tgr, average); 0.19::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s3, powder_rating_tgr, average).

all_consistent(powder_rating_tgr) :-
    consistent(s3, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, average)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.88::acc(s3, jibbing_rating_tgr).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(jibbing_rating_tgr, average); 0.19::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s3, jibbing_rating_tgr, average).

all_consistent(jibbing_rating_tgr) :-
    consistent(s3, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

0.88::acc(s3, switch_rating_tgr).

% @attr switch_rating_tgr
% @type categorical
% @canonical false
% @original_name The Good Ride switch rating
% @values good=Good unk_switch_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(switch_rating_tgr, good); 0.19::true_val(switch_rating_tgr, unk_switch_rating_tgr).

measured(s3, switch_rating_tgr, good).

all_consistent(switch_rating_tgr) :-
    consistent(s3, switch_rating_tgr).

evidence(all_consistent(switch_rating_tgr)).
query(true_val(switch_rating_tgr, good)).
query(true_val(switch_rating_tgr, unk_switch_rating_tgr)).

0.88::acc(s3, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good_loses_wax=Good_but_bases_lose_wax_quickly_feel_dry unk_base_glide_performance=Unknown
% @importance 0.95

0.81::true_val(base_glide_performance, good_loses_wax); 0.19::true_val(base_glide_performance, unk_base_glide_performance).

measured(s3, base_glide_performance, good_loses_wax).

all_consistent(base_glide_performance) :-
    consistent(s3, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good_loses_wax)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.87::acc(s3, edge_hold_icy).

% @attr edge_hold_icy
% @type categorical
% @canonical false
% @original_name edge_hold (icy snow)
% @values icy_snow_capable=Icy_Snow_capable unk_edge_hold_icy=Unknown
% @importance 0.95

0.80::true_val(edge_hold_icy, icy_snow_capable); 0.20::true_val(edge_hold_icy, unk_edge_hold_icy).

measured(s3, edge_hold_icy, icy_snow_capable).

all_consistent(edge_hold_icy) :-
    consistent(s3, edge_hold_icy).

evidence(all_consistent(edge_hold_icy)).
query(true_val(edge_hold_icy, icy_snow_capable)).
query(true_val(edge_hold_icy, unk_edge_hold_icy)).

0.88::acc(s3, on_snow_feel_tgr).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values locked_in=Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.81::true_val(on_snow_feel_tgr, locked_in); 0.19::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s3, on_snow_feel_tgr, locked_in).

all_consistent(on_snow_feel_tgr) :-
    consistent(s3, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

0.88::acc(s3, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.81::true_val(turn_initiation_performance, medium_fast); 0.19::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s3, turn_initiation_performance, medium_fast).

all_consistent(turn_initiation_performance) :-
    consistent(s3, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.87::acc(s3, buttering_tgr).

% @attr buttering_tgr
% @type categorical
% @canonical false
% @original_name The Good Ride buttering
% @values semi_hard=Semi_Hard unk_buttering_tgr=Unknown
% @importance 0.95

0.80::true_val(buttering_tgr, semi_hard); 0.20::true_val(buttering_tgr, unk_buttering_tgr).

measured(s3, buttering_tgr, semi_hard).

all_consistent(buttering_tgr) :-
    consistent(s3, buttering_tgr).

evidence(all_consistent(buttering_tgr)).
query(true_val(buttering_tgr, semi_hard)).
query(true_val(buttering_tgr, unk_buttering_tgr)).

0.87::acc(s3, weight_feel_tgr).

% @attr weight_feel_tgr
% @type categorical
% @canonical false
% @original_name The Good Ride approx weight feel
% @values feels_normal=Feels_Normal_not_heavy_or_light unk_weight_feel_tgr=Unknown
% @importance 0.95

0.80::true_val(weight_feel_tgr, feels_normal); 0.20::true_val(weight_feel_tgr, unk_weight_feel_tgr).

measured(s3, weight_feel_tgr, feels_normal).

all_consistent(weight_feel_tgr) :-
    consistent(s3, weight_feel_tgr).

evidence(all_consistent(weight_feel_tgr)).
query(true_val(weight_feel_tgr, feels_normal)).
query(true_val(weight_feel_tgr, unk_weight_feel_tgr)).

0.82::acc(s5, overall_rating_snowboardingprofiles).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v82_2=82.2 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.90

0.73::true_val(overall_rating_snowboardingprofiles, v82_2); 0.27::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s5, overall_rating_snowboardingprofiles, v82_2).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s5, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v82_2)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

0.82::acc(s5, reviewer_opinion_snowboardingprofiles_ranking).

% @attr reviewer_opinion_snowboardingprofiles_ranking
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (ranking)
% @values rank_25_of_28=25th_out_of_28_mellow_freeride_boards unk_reviewer_opinion_snowboardingprofiles_ranking=Unknown
% @importance 0.90

0.73::true_val(reviewer_opinion_snowboardingprofiles_ranking, rank_25_of_28); 0.27::true_val(reviewer_opinion_snowboardingprofiles_ranking, unk_reviewer_opinion_snowboardingprofiles_ranking).

measured(s5, reviewer_opinion_snowboardingprofiles_ranking, rank_25_of_28).

all_consistent(reviewer_opinion_snowboardingprofiles_ranking) :-
    consistent(s5, reviewer_opinion_snowboardingprofiles_ranking).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_ranking)).
query(true_val(reviewer_opinion_snowboardingprofiles_ranking, rank_25_of_28)).
query(true_val(reviewer_opinion_snowboardingprofiles_ranking, unk_reviewer_opinion_snowboardingprofiles_ranking)).

0.80::acc(s5, category_avg_snowboardingprofiles).

% @attr category_avg_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical false
% @original_name SnowboardingProfiles average score in category
% @values v85_7=85.7 unk_category_avg_snowboardingprofiles=Unknown
% @importance 0.90

0.73::true_val(category_avg_snowboardingprofiles, v85_7); 0.27::true_val(category_avg_snowboardingprofiles, unk_category_avg_snowboardingprofiles).

measured(s5, category_avg_snowboardingprofiles, v85_7).

all_consistent(category_avg_snowboardingprofiles) :-
    consistent(s5, category_avg_snowboardingprofiles).

evidence(all_consistent(category_avg_snowboardingprofiles)).
query(true_val(category_avg_snowboardingprofiles, v85_7)).
query(true_val(category_avg_snowboardingprofiles, unk_category_avg_snowboardingprofiles)).

0.88::acc(s5, board_weight_grams).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2880=2880.0 unk_board_weight_grams=Unknown
% @importance 0.90

0.82::true_val(board_weight_grams, v2880); 0.18::true_val(board_weight_grams, unk_board_weight_grams).

measured(s5, board_weight_grams, v2880).

all_consistent(board_weight_grams) :-
    consistent(s5, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2880)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.86::acc(s5, weight_per_cm).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical true
% @original_name weight_per_cm
% @values v18_46=18.46 unk_weight_per_cm=Unknown
% @importance 0.90

0.80::true_val(weight_per_cm, v18_46); 0.20::true_val(weight_per_cm, unk_weight_per_cm).

measured(s5, weight_per_cm, v18_46).

all_consistent(weight_per_cm) :-
    consistent(s5, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v18_46)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

0.88::acc(s5, camber_height_mm).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v7=7.0 unk_camber_height_mm=Unknown
% @importance 0.90

0.82::true_val(camber_height_mm, v7); 0.18::true_val(camber_height_mm, unk_camber_height_mm).

measured(s5, camber_height_mm, v7).

all_consistent(camber_height_mm) :-
    consistent(s5, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v7)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

0.82::acc(s5, carving_score_snowboardingprofiles).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v3_5=3.5 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.90

0.73::true_val(carving_score_snowboardingprofiles, v3_5); 0.27::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s5, carving_score_snowboardingprofiles, v3_5).

all_consistent(carving_score_snowboardingprofiles) :-
    consistent(s5, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v3_5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

0.82::acc(s5, powder_score_snowboardingprofiles).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v4=4.0 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.90

0.73::true_val(powder_score_snowboardingprofiles, v4); 0.27::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s5, powder_score_snowboardingprofiles, v4).

all_consistent(powder_score_snowboardingprofiles) :-
    consistent(s5, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v4)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

0.82::acc(s5, turns_score_snowboardingprofiles).

% @attr turns_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles turns score
% @values v3_5=3.5 unk_turns_score_snowboardingprofiles=Unknown
% @importance 0.90

0.73::true_val(turns_score_snowboardingprofiles, v3_5); 0.27::true_val(turns_score_snowboardingprofiles, unk_turns_score_snowboardingprofiles).

measured(s5, turns_score_snowboardingprofiles, v3_5).

all_consistent(turns_score_snowboardingprofiles) :-
    consistent(s5, turns_score_snowboardingprofiles).

evidence(all_consistent(turns_score_snowboardingprofiles)).
query(true_val(turns_score_snowboardingprofiles, v3_5)).
query(true_val(turns_score_snowboardingprofiles, unk_turns_score_snowboardingprofiles)).

0.82::acc(s5, trees_score_snowboardingprofiles).

% @attr trees_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles trees score
% @values v4=4.0 unk_trees_score_snowboardingprofiles=Unknown
% @importance 0.90

0.73::true_val(trees_score_snowboardingprofiles, v4); 0.27::true_val(trees_score_snowboardingprofiles, unk_trees_score_snowboardingprofiles).

measured(s5, trees_score_snowboardingprofiles, v4).

all_consistent(trees_score_snowboardingprofiles) :-
    consistent(s5, trees_score_snowboardingprofiles).

evidence(all_consistent(trees_score_snowboardingprofiles)).
query(true_val(trees_score_snowboardingprofiles, v4)).
query(true_val(trees_score_snowboardingprofiles, unk_trees_score_snowboardingprofiles)).

0.82::acc(s5, crud_score_snowboardingprofiles).

% @attr crud_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles crud score
% @values v3_5=3.5 unk_crud_score_snowboardingprofiles=Unknown
% @importance 0.90

0.73::true_val(crud_score_snowboardingprofiles, v3_5); 0.27::true_val(crud_score_snowboardingprofiles, unk_crud_score_snowboardingprofiles).

measured(s5, crud_score_snowboardingprofiles, v3_5).

all_consistent(crud_score_snowboardingprofiles) :-
    consistent(s5, crud_score_snowboardingprofiles).

evidence(all_consistent(crud_score_snowboardingprofiles)).
query(true_val(crud_score_snowboardingprofiles, v3_5)).
query(true_val(crud_score_snowboardingprofiles, unk_crud_score_snowboardingprofiles)).

0.82::acc(s5, speed_score_snowboardingprofiles).

% @attr speed_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles speed score
% @values v3_5=3.5 unk_speed_score_snowboardingprofiles=Unknown
% @importance 0.90

0.73::true_val(speed_score_snowboardingprofiles, v3_5); 0.27::true_val(speed_score_snowboardingprofiles, unk_speed_score_snowboardingprofiles).

measured(s5, speed_score_snowboardingprofiles, v3_5).

all_consistent(speed_score_snowboardingprofiles) :-
    consistent(s5, speed_score_snowboardingprofiles).

evidence(all_consistent(speed_score_snowboardingprofiles)).
query(true_val(speed_score_snowboardingprofiles, v3_5)).
query(true_val(speed_score_snowboardingprofiles, unk_speed_score_snowboardingprofiles)).

0.82::acc(s5, switch_score_snowboardingprofiles).

% @attr switch_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical false
% @original_name SnowboardingProfiles switch score
% @values v3=3.0 unk_switch_score_snowboardingprofiles=Unknown
% @importance 0.90

0.73::true_val(switch_score_snowboardingprofiles, v3); 0.27::true_val(switch_score_snowboardingprofiles, unk_switch_score_snowboardingprofiles).

measured(s5, switch_score_snowboardingprofiles, v3).

all_consistent(switch_score_snowboardingprofiles) :-
    consistent(s5, switch_score_snowboardingprofiles).

evidence(all_consistent(switch_score_snowboardingprofiles)).
query(true_val(switch_score_snowboardingprofiles, v3)).
query(true_val(switch_score_snowboardingprofiles, unk_switch_score_snowboardingprofiles)).

0.82::acc(s5, dampness_snowboardingprofiles).

% @attr dampness_snowboardingprofiles
% @type numeric
% @unit /10
% @canonical false
% @original_name SnowboardingProfiles dampness
% @values v6=6.0 unk_dampness_snowboardingprofiles=Unknown
% @importance 0.90

0.73::true_val(dampness_snowboardingprofiles, v6); 0.27::true_val(dampness_snowboardingprofiles, unk_dampness_snowboardingprofiles).

measured(s5, dampness_snowboardingprofiles, v6).

all_consistent(dampness_snowboardingprofiles) :-
    consistent(s5, dampness_snowboardingprofiles).

evidence(all_consistent(dampness_snowboardingprofiles)).
query(true_val(dampness_snowboardingprofiles, v6)).
query(true_val(dampness_snowboardingprofiles, unk_dampness_snowboardingprofiles)).

0.80::acc(s5, reviewer_opinion_snowboardingprofiles_feel).

% @attr reviewer_opinion_snowboardingprofiles_feel
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (feel)
% @values semi_locked_in=Semi_Locked_In unk_reviewer_opinion_snowboardingprofiles_feel=Unknown
% @importance 0.90

0.73::true_val(reviewer_opinion_snowboardingprofiles_feel, semi_locked_in); 0.27::true_val(reviewer_opinion_snowboardingprofiles_feel, unk_reviewer_opinion_snowboardingprofiles_feel).

measured(s5, reviewer_opinion_snowboardingprofiles_feel, semi_locked_in).

all_consistent(reviewer_opinion_snowboardingprofiles_feel) :-
    consistent(s5, reviewer_opinion_snowboardingprofiles_feel).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_feel)).
query(true_val(reviewer_opinion_snowboardingprofiles_feel, semi_locked_in)).
query(true_val(reviewer_opinion_snowboardingprofiles_feel, unk_reviewer_opinion_snowboardingprofiles_feel)).

0.80::acc(s5, reviewer_opinion_snowboardingprofiles_verdict).

% @attr reviewer_opinion_snowboardingprofiles_verdict
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (verdict)
% @values no_mans_land=Stuck_in_no_mans_land_not_burly_enough_not_playful_enough unk_reviewer_opinion_snowboardingprofiles_verdict=Unknown
% @importance 0.90

0.73::true_val(reviewer_opinion_snowboardingprofiles_verdict, no_mans_land); 0.27::true_val(reviewer_opinion_snowboardingprofiles_verdict, unk_reviewer_opinion_snowboardingprofiles_verdict).

measured(s5, reviewer_opinion_snowboardingprofiles_verdict, no_mans_land).

all_consistent(reviewer_opinion_snowboardingprofiles_verdict) :-
    consistent(s5, reviewer_opinion_snowboardingprofiles_verdict).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_verdict)).
query(true_val(reviewer_opinion_snowboardingprofiles_verdict, no_mans_land)).
query(true_val(reviewer_opinion_snowboardingprofiles_verdict, unk_reviewer_opinion_snowboardingprofiles_verdict)).

0.90::acc(s2, libtech_user_rating).

% @attr libtech_user_rating
% @type categorical
% @canonical false
% @original_name Lib Tech.com user rating (2025-2026 model)
% @values v98_pct_56_reviews=98pct_of_100_from_56_reviews unk_libtech_user_rating=Unknown
% @importance 0.85

0.87::true_val(libtech_user_rating, v98_pct_56_reviews); 0.13::true_val(libtech_user_rating, unk_libtech_user_rating).

measured(s2, libtech_user_rating, v98_pct_56_reviews).

all_consistent(libtech_user_rating) :-
    consistent(s2, libtech_user_rating).

evidence(all_consistent(libtech_user_rating)).
query(true_val(libtech_user_rating, v98_pct_56_reviews)).
query(true_val(libtech_user_rating, unk_libtech_user_rating)).

0.82::acc(s10, reviewer_opinion_whitelines).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values great_float_smooth_turns=Great_float_smooth_turns_solid_carves unk_reviewer_opinion_whitelines=Unknown
% @importance 0.60

0.76::true_val(reviewer_opinion_whitelines, great_float_smooth_turns); 0.24::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s10, reviewer_opinion_whitelines, great_float_smooth_turns).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s10, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, great_float_smooth_turns)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

0.80::acc(s10, reviewer_opinion_whitelines_debut).

% @attr reviewer_opinion_whitelines_debut
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (debut)
% @values all_new_2019_20=All_new_for_2019_20_winter_season unk_reviewer_opinion_whitelines_debut=Unknown
% @importance 0.60

0.76::true_val(reviewer_opinion_whitelines_debut, all_new_2019_20); 0.24::true_val(reviewer_opinion_whitelines_debut, unk_reviewer_opinion_whitelines_debut).

measured(s10, reviewer_opinion_whitelines_debut, all_new_2019_20).

all_consistent(reviewer_opinion_whitelines_debut) :-
    consistent(s10, reviewer_opinion_whitelines_debut).

evidence(all_consistent(reviewer_opinion_whitelines_debut)).
query(true_val(reviewer_opinion_whitelines_debut, all_new_2019_20)).
query(true_val(reviewer_opinion_whitelines_debut, unk_reviewer_opinion_whitelines_debut)).

0.72::acc(s17, review_old_guys_rip_too).

% @attr review_old_guys_rip_too
% @type categorical
% @canonical false
% @original_name Old Guys Rip Too review
% @values rec_int_adv_am_freeride=Recommended_for_intermediate_to_advanced_AM_freeride unk_review_old_guys_rip_too=Unknown
% @importance 0.60

0.49::true_val(review_old_guys_rip_too, rec_int_adv_am_freeride); 0.51::true_val(review_old_guys_rip_too, unk_review_old_guys_rip_too).

measured(s17, review_old_guys_rip_too, rec_int_adv_am_freeride).

all_consistent(review_old_guys_rip_too) :-
    consistent(s17, review_old_guys_rip_too).

evidence(all_consistent(review_old_guys_rip_too)).
query(true_val(review_old_guys_rip_too, rec_int_adv_am_freeride)).
query(true_val(review_old_guys_rip_too, unk_review_old_guys_rip_too)).

0.75::acc(s18, review_curated_stability).

% @attr review_curated_stability
% @type categorical
% @canonical false
% @original_name Curated.com expert review stability
% @values one_of_most_stable=One_of_the_more_stable_Lib_Tech_boards unk_review_curated_stability=Unknown
% @importance 0.75

0.60::true_val(review_curated_stability, one_of_most_stable); 0.40::true_val(review_curated_stability, unk_review_curated_stability).

measured(s18, review_curated_stability, one_of_most_stable).

all_consistent(review_curated_stability) :-
    consistent(s18, review_curated_stability).

evidence(all_consistent(review_curated_stability)).
query(true_val(review_curated_stability, one_of_most_stable)).
query(true_val(review_curated_stability, unk_review_curated_stability)).

0.75::acc(s18, review_curated_durability).

% @attr review_curated_durability
% @type categorical
% @canonical false
% @original_name Curated.com on durability
% @values sintered_sidewalls_durable=Sintered_sidewalls_take_beating_without_blowing_edge unk_review_curated_durability=Unknown
% @importance 0.75

0.60::true_val(review_curated_durability, sintered_sidewalls_durable); 0.40::true_val(review_curated_durability, unk_review_curated_durability).

measured(s18, review_curated_durability, sintered_sidewalls_durable).

all_consistent(review_curated_durability) :-
    consistent(s18, review_curated_durability).

evidence(all_consistent(review_curated_durability)).
query(true_val(review_curated_durability, sintered_sidewalls_durable)).
query(true_val(review_curated_durability, unk_review_curated_durability)).

0.75::acc(s18, review_curated_moguls).

% @attr review_curated_moguls
% @type categorical
% @canonical false
% @original_name Curated.com on moguls weakness
% @values moguls_only_weakness=Moguls_only_terrain_Dynamo_doesnt_excel unk_review_curated_moguls=Unknown
% @importance 0.75

0.60::true_val(review_curated_moguls, moguls_only_weakness); 0.40::true_val(review_curated_moguls, unk_review_curated_moguls).

measured(s18, review_curated_moguls, moguls_only_weakness).

all_consistent(review_curated_moguls) :-
    consistent(s18, review_curated_moguls).

evidence(all_consistent(review_curated_moguls)).
query(true_val(review_curated_moguls, moguls_only_weakness)).
query(true_val(review_curated_moguls, unk_review_curated_moguls)).

0.55::acc(s19, user_review_forum_grip).

% @attr user_review_forum_grip
% @type categorical
% @canonical false
% @original_name user_review_forum (grip)
% @values camber_lots_grip_not_stiff=Wanted_camber_with_grip_not_too_stiff_works unk_user_review_forum_grip=Unknown
% @importance 0.70

0.34::true_val(user_review_forum_grip, camber_lots_grip_not_stiff); 0.66::true_val(user_review_forum_grip, unk_user_review_forum_grip).

measured(s19, user_review_forum_grip, camber_lots_grip_not_stiff).

all_consistent(user_review_forum_grip) :-
    consistent(s19, user_review_forum_grip).

evidence(all_consistent(user_review_forum_grip)).
query(true_val(user_review_forum_grip, camber_lots_grip_not_stiff)).
query(true_val(user_review_forum_grip, unk_user_review_forum_grip)).

0.55::acc(s19, magne_traction_sharpness).

% @attr magne_traction_sharpness
% @type categorical
% @canonical false
% @original_name Forum user noted Magne-Traction edges come very sharp
% @values very_sharp_from_factory=Magne_Traction_edges_very_sharp_from_factory unk_magne_traction_sharpness=Unknown
% @importance 0.70

0.34::true_val(magne_traction_sharpness, very_sharp_from_factory); 0.66::true_val(magne_traction_sharpness, unk_magne_traction_sharpness).

measured(s19, magne_traction_sharpness, very_sharp_from_factory).

all_consistent(magne_traction_sharpness) :-
    consistent(s19, magne_traction_sharpness).

evidence(all_consistent(magne_traction_sharpness)).
query(true_val(magne_traction_sharpness, very_sharp_from_factory)).
query(true_val(magne_traction_sharpness, unk_magne_traction_sharpness)).

0.85::acc(s3, user_review_forum_speed).

% @attr user_review_forum_speed
% @type categorical
% @canonical false
% @original_name user_review_forum (speed)
% @values excelled_medium_high_speed=Excelled_at_medium_to_high_speeds_laid_back_style unk_user_review_forum_speed=Unknown
% @importance 0.95

0.78::true_val(user_review_forum_speed, excelled_medium_high_speed); 0.22::true_val(user_review_forum_speed, unk_user_review_forum_speed).

measured(s3, user_review_forum_speed, excelled_medium_high_speed).

all_consistent(user_review_forum_speed) :-
    consistent(s3, user_review_forum_speed).

evidence(all_consistent(user_review_forum_speed)).
query(true_val(user_review_forum_speed, excelled_medium_high_speed)).
query(true_val(user_review_forum_speed, unk_user_review_forum_speed)).

0.85::acc(s3, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values korua_otto_jones_frontier_etc=Korua_Otto_Jones_Frontier_Ride_Shadowban_Yes_Standard_Capita_BSOD_etc unk_comparable_board_cross_brand=Unknown
% @importance 0.95

0.78::true_val(comparable_board_cross_brand, korua_otto_jones_frontier_etc); 0.22::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s3, comparable_board_cross_brand, korua_otto_jones_frontier_etc).

all_consistent(comparable_board_cross_brand) :-
    consistent(s3, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, korua_otto_jones_frontier_etc)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.78::acc(s5, comparable_jamie_lynn).

% @attr comparable_jamie_lynn
% @type categorical
% @canonical false
% @original_name Compared unfavorably to Lib Tech Jamie Lynn
% @values unfavorable_stability_carving=Jamie_Lynn_better_for_stability_at_speed_and_carving unk_comparable_jamie_lynn=Unknown
% @importance 0.90

0.73::true_val(comparable_jamie_lynn, unfavorable_stability_carving); 0.27::true_val(comparable_jamie_lynn, unk_comparable_jamie_lynn).

measured(s5, comparable_jamie_lynn, unfavorable_stability_carving).

all_consistent(comparable_jamie_lynn) :-
    consistent(s5, comparable_jamie_lynn).

evidence(all_consistent(comparable_jamie_lynn)).
query(true_val(comparable_jamie_lynn, unfavorable_stability_carving)).
query(true_val(comparable_jamie_lynn, unk_comparable_jamie_lynn)).

0.55::acc(s19, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values gnu_antigravity=Gnu_Antigravity_same_on_paper_but_cheaper unk_comparable_board_same_brand=Unknown
% @importance 0.70

0.34::true_val(comparable_board_same_brand, gnu_antigravity); 0.66::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s19, comparable_board_same_brand, gnu_antigravity).

all_consistent(comparable_board_same_brand) :-
    consistent(s19, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, gnu_antigravity)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.60::acc(s14, comparable_board_same_brand_brd).

% @attr comparable_board_same_brand_brd
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Austen Sweetin BRD)
% @values sweetin_brd=Austen_Sweetin_BRD_more_directional_early_rise_nose unk_comparable_board_same_brand_brd=Unknown
% @importance 0.70

0.50::true_val(comparable_board_same_brand_brd, sweetin_brd); 0.50::true_val(comparable_board_same_brand_brd, unk_comparable_board_same_brand_brd).

measured(s14, comparable_board_same_brand_brd, sweetin_brd).

all_consistent(comparable_board_same_brand_brd) :-
    consistent(s14, comparable_board_same_brand_brd).

evidence(all_consistent(comparable_board_same_brand_brd)).
query(true_val(comparable_board_same_brand_brd, sweetin_brd)).
query(true_val(comparable_board_same_brand_brd, unk_comparable_board_same_brand_brd)).

0.85::acc(s3, comparable_board_cross_brand_bsod).

% @attr comparable_board_cross_brand_bsod
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (BSOD base glide)
% @values bsod_better_base_glide=Capita_BSOD_kept_speed_much_better unk_comparable_board_cross_brand_bsod=Unknown
% @importance 0.95

0.78::true_val(comparable_board_cross_brand_bsod, bsod_better_base_glide); 0.22::true_val(comparable_board_cross_brand_bsod, unk_comparable_board_cross_brand_bsod).

measured(s3, comparable_board_cross_brand_bsod, bsod_better_base_glide).

all_consistent(comparable_board_cross_brand_bsod) :-
    consistent(s3, comparable_board_cross_brand_bsod).

evidence(all_consistent(comparable_board_cross_brand_bsod)).
query(true_val(comparable_board_cross_brand_bsod, bsod_better_base_glide)).
query(true_val(comparable_board_cross_brand_bsod, unk_comparable_board_cross_brand_bsod)).

0.95::acc(s20, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v1=1.0 unk_warranty_period_years=Unknown
% @importance 0.80

0.92::true_val(warranty_period_years, v1); 0.08::true_val(warranty_period_years, unk_warranty_period_years).

measured(s20, warranty_period_years, v1).

all_consistent(warranty_period_years) :-
    consistent(s20, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.95::acc(s20, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values defects_materials_workmanship=Defects_in_materials_and_workmanship_only unk_warranty=Unknown
% @importance 0.80

0.92::true_val(warranty, defects_materials_workmanship); 0.08::true_val(warranty, unk_warranty).

measured(s20, warranty, defects_materials_workmanship).

all_consistent(warranty) :-
    consistent(s20, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, defects_materials_workmanship)).
query(true_val(warranty, unk_warranty)).

0.82::acc(s21, warranty_exclusions).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty (exclusions)
% @values no_impact_abuse_wear=Does_not_cover_impact_abuse_misuse_normal_wear unk_warranty_exclusions=Unknown
% @importance 0.70

0.74::true_val(warranty_exclusions, no_impact_abuse_wear); 0.26::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s21, warranty_exclusions, no_impact_abuse_wear).

all_consistent(warranty_exclusions) :-
    (indep(s21), consistent(s21, warranty_exclusions) ; \+indep(s21)).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, no_impact_abuse_wear)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

0.95::acc(s20, warranty_shipping).

% @attr warranty_shipping
% @type categorical
% @canonical false
% @original_name Customer pays to ship board to Mervin; Mervin pays return
% @values customer_ships_mervin_returns=Customer_pays_shipping_to_Mervin_Mervin_pays_return unk_warranty_shipping=Unknown
% @importance 0.80

0.92::true_val(warranty_shipping, customer_ships_mervin_returns); 0.08::true_val(warranty_shipping, unk_warranty_shipping).

measured(s20, warranty_shipping, customer_ships_mervin_returns).

all_consistent(warranty_shipping) :-
    consistent(s20, warranty_shipping).

evidence(all_consistent(warranty_shipping)).
query(true_val(warranty_shipping, customer_ships_mervin_returns)).
query(true_val(warranty_shipping, unk_warranty_shipping)).

0.90::acc(s22, warranty_bgrade).

% @attr warranty_bgrade
% @type categorical
% @canonical false
% @original_name B-Grade boards carry full factory warranty
% @values full_factory_warranty=B_Grade_boards_carry_full_factory_warranty unk_warranty_bgrade=Unknown
% @importance 0.50

0.81::true_val(warranty_bgrade, full_factory_warranty); 0.19::true_val(warranty_bgrade, unk_warranty_bgrade).

measured(s22, warranty_bgrade, full_factory_warranty).

all_consistent(warranty_bgrade) :-
    consistent(s22, warranty_bgrade).

evidence(all_consistent(warranty_bgrade)).
query(true_val(warranty_bgrade, full_factory_warranty)).
query(true_val(warranty_bgrade, unk_warranty_bgrade)).

0.45::acc(s23, warranty_reputation).

% @attr warranty_reputation
% @type categorical
% @canonical false
% @original_name warranty (reputation)
% @values very_positive_generous=Generally_very_positive_generous_replacements unk_warranty_reputation=Unknown
% @importance 0.65

0.28::true_val(warranty_reputation, very_positive_generous); 0.72::true_val(warranty_reputation, unk_warranty_reputation).

measured(s23, warranty_reputation, very_positive_generous).

all_consistent(warranty_reputation) :-
    consistent(s23, warranty_reputation).

evidence(all_consistent(warranty_reputation)).
query(true_val(warranty_reputation, very_positive_generous)).
query(true_val(warranty_reputation, unk_warranty_reputation)).

0.88::acc(s8, brand_reputation).
0.78::acc(s9, brand_reputation).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Lib Tech / Mervin Manufacturing brand reputation
% @values highly_regarded_30yr_us=Highly_regarded_over_30_years_last_major_US_factory unk_brand_reputation=Unknown
% @importance 0.48

0.93::true_val(brand_reputation, highly_regarded_30yr_us); 0.07::true_val(brand_reputation, unk_brand_reputation).

measured(s8, brand_reputation, highly_regarded_30yr_us).
measured(s9, brand_reputation, highly_regarded_30yr_us).

all_consistent(brand_reputation) :-
    consistent(s8, brand_reputation),
    consistent(s9, brand_reputation).

evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, highly_regarded_30yr_us)).
query(true_val(brand_reputation, unk_brand_reputation)).

0.78::acc(s11, retailer_evo).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name evo retailer description
% @values major_us_price_match_rewards=Major_US_retailer_price_match_1yr_return_loyalty unk_retailer_evo=Unknown
% @importance 0.70

0.70::true_val(retailer_evo, major_us_price_match_rewards); 0.30::true_val(retailer_evo, unk_retailer_evo).

measured(s11, retailer_evo, major_us_price_match_rewards).

all_consistent(retailer_evo) :-
    (indep(s11), consistent(s11, retailer_evo) ; \+indep(s11)).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_us_price_match_rewards)).
query(true_val(retailer_evo, unk_retailer_evo)).

0.82::acc(s21, retailer_tactics).

% @attr retailer_tactics
% @type categorical
% @canonical false
% @original_name Tactics retailer description
% @values major_us_low_price_free_ship=Major_US_retailer_low_price_guarantee_free_shipping unk_retailer_tactics=Unknown
% @importance 0.70

0.74::true_val(retailer_tactics, major_us_low_price_free_ship); 0.26::true_val(retailer_tactics, unk_retailer_tactics).

measured(s21, retailer_tactics, major_us_low_price_free_ship).

all_consistent(retailer_tactics) :-
    (indep(s21), consistent(s21, retailer_tactics) ; \+indep(s21)).

evidence(all_consistent(retailer_tactics)).
query(true_val(retailer_tactics, major_us_low_price_free_ship)).
query(true_val(retailer_tactics, unk_retailer_tactics)).

0.85::acc(s3, retailer_backcountry).

% @attr retailer_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry retailer description
% @values major_us_outdoor=Major_US_outdoor_retailer unk_retailer_backcountry=Unknown
% @importance 0.95

0.78::true_val(retailer_backcountry, major_us_outdoor); 0.22::true_val(retailer_backcountry, unk_retailer_backcountry).

measured(s3, retailer_backcountry, major_us_outdoor).

all_consistent(retailer_backcountry) :-
    consistent(s3, retailer_backcountry).

evidence(all_consistent(retailer_backcountry)).
query(true_val(retailer_backcountry, major_us_outdoor)).
query(true_val(retailer_backcountry, unk_retailer_backcountry)).

0.85::acc(s3, retailer_the_house).

% @attr retailer_the_house
% @type categorical
% @canonical false
% @original_name The House retailer description
% @values established_us_retailer=Established_US_snowboard_retailer unk_retailer_the_house=Unknown
% @importance 0.95

0.78::true_val(retailer_the_house, established_us_retailer); 0.22::true_val(retailer_the_house, unk_retailer_the_house).

measured(s3, retailer_the_house, established_us_retailer).

all_consistent(retailer_the_house) :-
    consistent(s3, retailer_the_house).

evidence(all_consistent(retailer_the_house)).
query(true_val(retailer_the_house, established_us_retailer)).
query(true_val(retailer_the_house, unk_retailer_the_house)).

0.85::acc(s3, retailer_blauer).

% @attr retailer_blauer
% @type categorical
% @canonical false
% @original_name Blauer Board Shop retailer description
% @values specialty_shop_tgr_fav=Specialty_snowboard_shop_TGR_favorite_store unk_retailer_blauer=Unknown
% @importance 0.95

0.78::true_val(retailer_blauer, specialty_shop_tgr_fav); 0.22::true_val(retailer_blauer, unk_retailer_blauer).

measured(s3, retailer_blauer, specialty_shop_tgr_fav).

all_consistent(retailer_blauer) :-
    consistent(s3, retailer_blauer).

evidence(all_consistent(retailer_blauer)).
query(true_val(retailer_blauer, specialty_shop_tgr_fav)).
query(true_val(retailer_blauer, unk_retailer_blauer)).

0.70::acc(s6, retailer_ballistyx).

% @attr retailer_ballistyx
% @type categorical
% @canonical false
% @original_name Ballistyx retailer description
% @values melbourne_est_1991=Melbourne_based_Australian_store_established_1991 unk_retailer_ballistyx=Unknown
% @importance 0.85

0.60::true_val(retailer_ballistyx, melbourne_est_1991); 0.40::true_val(retailer_ballistyx, unk_retailer_ballistyx).

measured(s6, retailer_ballistyx, melbourne_est_1991).

all_consistent(retailer_ballistyx) :-
    (indep(s6), consistent(s6, retailer_ballistyx) ; \+indep(s6)).

evidence(all_consistent(retailer_ballistyx)).
query(true_val(retailer_ballistyx, melbourne_est_1991)).
query(true_val(retailer_ballistyx, unk_retailer_ballistyx)).

0.72::acc(s16, retailer_melbourne_sc).

% @attr retailer_melbourne_sc
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre retailer description
% @values au_specialist=Australian_retailer_specializing_in_snowboards unk_retailer_melbourne_sc=Unknown
% @importance 0.60

0.60::true_val(retailer_melbourne_sc, au_specialist); 0.40::true_val(retailer_melbourne_sc, unk_retailer_melbourne_sc).

measured(s16, retailer_melbourne_sc, au_specialist).

all_consistent(retailer_melbourne_sc) :-
    (indep(s16), consistent(s16, retailer_melbourne_sc) ; \+indep(s16)).

evidence(all_consistent(retailer_melbourne_sc)).
query(true_val(retailer_melbourne_sc, au_specialist)).
query(true_val(retailer_melbourne_sc, unk_retailer_melbourne_sc)).

0.85::acc(s3, boot_size_150).

% @attr boot_size_150
% @type categorical
% @canonical false
% @original_name 150cm recommended boot size
% @values us_6_7=US_6_7 unk_boot_size_150=Unknown
% @importance 0.95

0.78::true_val(boot_size_150, us_6_7); 0.22::true_val(boot_size_150, unk_boot_size_150).

measured(s3, boot_size_150, us_6_7).

all_consistent(boot_size_150) :-
    consistent(s3, boot_size_150).

evidence(all_consistent(boot_size_150)).
query(true_val(boot_size_150, us_6_7)).
query(true_val(boot_size_150, unk_boot_size_150)).

0.85::acc(s3, boot_size_153).

% @attr boot_size_153
% @type categorical
% @canonical false
% @original_name 153cm recommended boot size
% @values us_8_9=US_8_9 unk_boot_size_153=Unknown
% @importance 0.95

0.78::true_val(boot_size_153, us_8_9); 0.22::true_val(boot_size_153, unk_boot_size_153).

measured(s3, boot_size_153, us_8_9).

all_consistent(boot_size_153) :-
    consistent(s3, boot_size_153).

evidence(all_consistent(boot_size_153)).
query(true_val(boot_size_153, us_8_9)).
query(true_val(boot_size_153, unk_boot_size_153)).

0.85::acc(s3, boot_size_156).

% @attr boot_size_156
% @type categorical
% @canonical false
% @original_name 156cm recommended boot size
% @values us_8_5_9_5=US_8_5_9_5 unk_boot_size_156=Unknown
% @importance 0.95

0.78::true_val(boot_size_156, us_8_5_9_5); 0.22::true_val(boot_size_156, unk_boot_size_156).

measured(s3, boot_size_156, us_8_5_9_5).

all_consistent(boot_size_156) :-
    consistent(s3, boot_size_156).

evidence(all_consistent(boot_size_156)).
query(true_val(boot_size_156, us_8_5_9_5)).
query(true_val(boot_size_156, unk_boot_size_156)).

0.85::acc(s3, boot_size_159).

% @attr boot_size_159
% @type categorical
% @canonical false
% @original_name 159cm recommended boot size
% @values us_10_11=US_10_11 unk_boot_size_159=Unknown
% @importance 0.95

0.78::true_val(boot_size_159, us_10_11); 0.22::true_val(boot_size_159, unk_boot_size_159).

measured(s3, boot_size_159, us_10_11).

all_consistent(boot_size_159) :-
    consistent(s3, boot_size_159).

evidence(all_consistent(boot_size_159)).
query(true_val(boot_size_159, us_10_11)).
query(true_val(boot_size_159, unk_boot_size_159)).

0.85::acc(s3, boot_size_162).

% @attr boot_size_162
% @type categorical
% @canonical false
% @original_name 162cm recommended boot size
% @values us_10_5_11_5=US_10_5_11_5 unk_boot_size_162=Unknown
% @importance 0.95

0.78::true_val(boot_size_162, us_10_5_11_5); 0.22::true_val(boot_size_162, unk_boot_size_162).

measured(s3, boot_size_162, us_10_5_11_5).

all_consistent(boot_size_162) :-
    consistent(s3, boot_size_162).

evidence(all_consistent(boot_size_162)).
query(true_val(boot_size_162, us_10_5_11_5)).
query(true_val(boot_size_162, unk_boot_size_162)).

0.85::acc(s3, boot_size_156w).

% @attr boot_size_156w
% @type categorical
% @canonical false
% @original_name 156W recommended boot size
% @values us_10_5_11_5=US_10_5_11_5 unk_boot_size_156w=Unknown
% @importance 0.95

0.78::true_val(boot_size_156w, us_10_5_11_5); 0.22::true_val(boot_size_156w, unk_boot_size_156w).

measured(s3, boot_size_156w, us_10_5_11_5).

all_consistent(boot_size_156w) :-
    consistent(s3, boot_size_156w).

evidence(all_consistent(boot_size_156w)).
query(true_val(boot_size_156w, us_10_5_11_5)).
query(true_val(boot_size_156w, unk_boot_size_156w)).

0.85::acc(s3, boot_size_162w).

% @attr boot_size_162w
% @type categorical
% @canonical false
% @original_name 162W recommended boot size
% @values us_11_12=US_11_12 unk_boot_size_162w=Unknown
% @importance 0.95

0.78::true_val(boot_size_162w, us_11_12); 0.22::true_val(boot_size_162w, unk_boot_size_162w).

measured(s3, boot_size_162w, us_11_12).

all_consistent(boot_size_162w) :-
    consistent(s3, boot_size_162w).

evidence(all_consistent(boot_size_162w)).
query(true_val(boot_size_162w, us_11_12)).
query(true_val(boot_size_162w, unk_boot_size_162w)).

0.85::acc(s3, recommended_boot_size_165).

% @attr recommended_boot_size_165
% @type categorical
% @canonical true
% @original_name recommended_boot_size_165
% @values us_11_5_12_5=US_11_5_12_5 unk_recommended_boot_size_165=Unknown
% @importance 0.95

0.78::true_val(recommended_boot_size_165, us_11_5_12_5); 0.22::true_val(recommended_boot_size_165, unk_recommended_boot_size_165).

measured(s3, recommended_boot_size_165, us_11_5_12_5).

all_consistent(recommended_boot_size_165) :-
    consistent(s3, recommended_boot_size_165).

evidence(all_consistent(recommended_boot_size_165)).
query(true_val(recommended_boot_size_165, us_11_5_12_5)).
query(true_val(recommended_boot_size_165, unk_recommended_boot_size_165)).