0.12::indep(s_merchant).
0.15::indep(s1).
0.15::indep(s4).
0.12::indep(s5).
0.12::indep(s7).
0.12::indep(s8).
0.15::indep(s14).
0.15::indep(s24).
0.20::indep(s28).
0.15::indep(s30).
0.12::indep(s39).
0.12::indep(s59).
0.20::indep(s92).
0.12::indep(s97).
0.93::indep(s_tgr).
0.92::indep(s_sp).
0.97::indep(s45).
0.97::indep(s67).
0.97::indep(s68).
0.97::indep(s71).
0.97::indep(s109).
0.85::indep(s75).
0.80::indep(s77).
0.88::indep(s83).
0.70::indep(s64).
0.50::indep(s89).
0.55::indep(s100).
0.15::indep(s37).
0.15::indep(s54).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.65

0.90::acc(s1, brand).
0.85::acc(s7, brand).

0.97::true_val(brand, burton); 0.03::true_val(brand, unk_brand).

measured(s1, brand, burton).
measured(s7, brand, burton).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s7), consistent(s7, brand) ; \+indep(s7)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values ft_3d_deep_daze=Family_Tree_3D_Deep_Daze unk_model_name=Unknown
% @importance 0.75

0.93::acc(s1, model_name).
0.88::acc(s4, model_name).

0.97::true_val(model_name, ft_3d_deep_daze); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, ft_3d_deep_daze).
measured(s4, model_name, ft_3d_deep_daze).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s4), consistent(s4, model_name) ; \+indep(s4)).

evidence(all_consistent(model_name)).
query(true_val(model_name, ft_3d_deep_daze)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2024=2024 unk_model_year=Unknown
% @importance 0.875

0.93::acc(s4, model_year).
0.92::acc(s1, model_year).

0.97::true_val(model_year, y2024); 0.03::true_val(model_year, unk_model_year).

measured(s4, model_year, y2024).
measured(s1, model_year, y2024).

all_consistent(model_year) :-
    consistent(s4, model_year),
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2024)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values family_tree_collection=Family_Tree_Collection unk_model_series=Unknown
% @importance 0.7

0.88::acc(s1, model_series).

0.85::true_val(model_series, family_tree_collection); 0.15::true_val(model_series, unk_model_series).

measured(s1, model_series, family_tree_collection).

all_consistent(model_series) :-
    (indep(s1), consistent(s1, model_series) ; \+indep(s1)).

evidence(all_consistent(model_series)).
query(true_val(model_series, family_tree_collection)).
query(true_val(model_series, unk_model_series)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.9

0.93::acc(s1, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values powder_freeride=Powder_Freeride unk_board_category=Unknown
% @importance 0.875

0.90::acc(s4, board_category).
0.93::acc(s20, board_category).

0.96::true_val(board_category, powder_freeride); 0.04::true_val(board_category, unk_board_category).

measured(s4, board_category, powder_freeride).
measured(s20, board_category, powder_freeride).

all_consistent(board_category) :-
    consistent(s20, board_category),
    (indep(s4), consistent(s4, board_category) ; \+indep(s4)).

evidence(all_consistent(board_category)).
query(true_val(board_category, powder_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr board_subtype
% @type categorical
% @canonical false
% @original_name Board subtype
% @values mellow_freeride_powder=Mellow_Freeride_Powder_Specialist unk_board_subtype=Unknown
% @importance 0.875

0.85::acc(s_sp, board_subtype).
0.82::acc(s_sp, board_subtype).

0.82::true_val(board_subtype, mellow_freeride_powder); 0.18::true_val(board_subtype, unk_board_subtype).

measured(s_sp, board_subtype, mellow_freeride_powder).

all_consistent(board_subtype) :-
    (indep(s_sp), consistent(s_sp, board_subtype) ; \+indep(s_sp)).

evidence(all_consistent(board_subtype)).
query(true_val(board_subtype, mellow_freeride_powder)).
query(true_val(board_subtype, unk_board_subtype)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values late_2021=Late_2021 unk_model_first_available_year=Unknown
% @importance 0.7

0.88::acc(s_sp, model_first_available_year).

0.73::true_val(model_first_available_year, late_2021); 0.27::true_val(model_first_available_year, unk_model_first_available_year).

measured(s_sp, model_first_available_year, late_2021).

all_consistent(model_first_available_year) :-
    (indep(s_sp), consistent(s_sp, model_first_available_year) ; \+indep(s_sp)).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, late_2021)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr final_model_year
% @type categorical
% @canonical false
% @original_name Final model year
% @values y2025=2025 unk_final_model_year=Unknown
% @importance 0.85

0.88::acc(s_sp, final_model_year).

0.73::true_val(final_model_year, y2025); 0.27::true_val(final_model_year, unk_final_model_year).

measured(s_sp, final_model_year, y2025).

all_consistent(final_model_year) :-
    (indep(s_sp), consistent(s_sp, final_model_year) ; \+indep(s_sp)).

evidence(all_consistent(final_model_year)).
query(true_val(final_model_year, y2025)).
query(true_val(final_model_year, unk_final_model_year)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Gender_neutral_unisex unk_gender=Unknown
% @importance 0.6

0.88::acc(s14, gender).

0.85::true_val(gender, unisex); 0.15::true_val(gender, unk_gender).

measured(s14, gender, unisex).

all_consistent(gender) :-
    (indep(s14), consistent(s14, gender) ; \+indep(s14)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards=Burton_Snowboards unk_manufacturer=Unknown
% @importance 0.5

0.90::acc(s75, manufacturer).

0.85::true_val(manufacturer, burton_snowboards); 0.15::true_val(manufacturer, unk_manufacturer).

measured(s75, manufacturer, burton_snowboards).

all_consistent(manufacturer) :-
    (indep(s75), consistent(s75, manufacturer) ; \+indep(s75)).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values burlington_vt_usa=Burlington_Vermont_USA unk_manufacturer_headquarters=Unknown
% @importance 0.5

0.90::acc(s75, manufacturer_headquarters).

0.85::true_val(manufacturer_headquarters, burlington_vt_usa); 0.15::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s75, manufacturer_headquarters, burlington_vt_usa).

all_consistent(manufacturer_headquarters) :-
    (indep(s75), consistent(s75, manufacturer_headquarters) ; \+indep(s75)).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, burlington_vt_usa)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values austria_keil=Austria_Keil_Factory unk_manufacturing_location=Unknown
% @importance 0.675

0.80::acc(s77, manufacturing_location).
0.85::acc(s_tgr, manufacturing_location).

0.92::true_val(manufacturing_location, austria_keil); 0.08::true_val(manufacturing_location, unk_manufacturing_location).

measured(s77, manufacturing_location, austria_keil).
measured(s_tgr, manufacturing_location, austria_keil).

all_consistent(manufacturing_location) :-
    (indep(s77), consistent(s77, manufacturing_location) ; \+indep(s77)),
    (indep(s_tgr), consistent(s_tgr, manufacturing_location) ; \+indep(s_tgr)).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, austria_keil)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values b_corp=B_Corp_Certified unk_sustainability_certification=Unknown
% @importance 0.35

0.85::acc(s83, sustainability_certification).
0.90::acc(s14, sustainability_certification).

0.93::true_val(sustainability_certification, b_corp); 0.07::true_val(sustainability_certification, unk_sustainability_certification).

measured(s83, sustainability_certification, b_corp).
measured(s14, sustainability_certification, b_corp).

all_consistent(sustainability_certification) :-
    (indep(s83), consistent(s83, sustainability_certification) ; \+indep(s83)),
    (indep(s14), consistent(s14, sustainability_certification) ; \+indep(s14)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, b_corp)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr manufacturer_market_position
% @type categorical
% @canonical false
% @original_name Manufacturer market position
% @values largest_global=Largest_global_manufacturer unk_manufacturer_market_position=Unknown
% @importance 0.5

0.85::acc(s75, manufacturer_market_position).

0.71::true_val(manufacturer_market_position, largest_global); 0.29::true_val(manufacturer_market_position, unk_manufacturer_market_position).

measured(s75, manufacturer_market_position, largest_global).

all_consistent(manufacturer_market_position) :-
    (indep(s75), consistent(s75, manufacturer_market_position) ; \+indep(s75)).

evidence(all_consistent(manufacturer_market_position)).
query(true_val(manufacturer_market_position, largest_global)).
query(true_val(manufacturer_market_position, unk_manufacturer_market_position)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values modern_surfboards=Modern_surfboards unk_design_inspiration=Unknown
% @importance 0.775

0.88::acc(s4, design_inspiration).
0.85::acc(s5, design_inspiration).

0.93::true_val(design_inspiration, modern_surfboards); 0.07::true_val(design_inspiration, unk_design_inspiration).

measured(s4, design_inspiration, modern_surfboards).
measured(s5, design_inspiration, modern_surfboards).

all_consistent(design_inspiration) :-
    (indep(s4), consistent(s4, design_inspiration) ; \+indep(s4)),
    (indep(s5), consistent(s5, design_inspiration) ; \+indep(s5)).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, modern_surfboards)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values freeride_directional=Freeride_Directional unk_shape=Unknown
% @importance 0.875

0.95::acc(s20, shape).
0.88::acc(s_merchant, shape).
0.85::acc(s_sp, shape).

0.96::true_val(shape, freeride_directional); 0.04::true_val(shape, unk_shape).

measured(s20, shape, freeride_directional).
measured(s_merchant, shape, freeride_directional).
measured(s_sp, shape, freeride_directional).

all_consistent(shape) :-
    consistent(s20, shape),
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)),
    (indep(s_sp), consistent(s_sp, shape) ; \+indep(s_sp)).

evidence(all_consistent(shape)).
query(true_val(shape, freeride_directional)).
query(true_val(shape, unk_shape)).

% @attr three_d_base_technology
% @type categorical
% @canonical false
% @original_name 3D base technology
% @values convex_tip_tail=Surfboard_inspired_convex_tip_tail unk_three_d_base_technology=Unknown
% @importance 0.825

0.93::acc(s30, three_d_base_technology).
0.90::acc(s20, three_d_base_technology).

0.93::true_val(three_d_base_technology, convex_tip_tail); 0.07::true_val(three_d_base_technology, unk_three_d_base_technology).

measured(s30, three_d_base_technology, convex_tip_tail).
measured(s20, three_d_base_technology, convex_tip_tail).

all_consistent(three_d_base_technology) :-
    consistent(s20, three_d_base_technology),
    (indep(s30), consistent(s30, three_d_base_technology) ; \+indep(s30)).

evidence(all_consistent(three_d_base_technology)).
query(true_val(three_d_base_technology, convex_tip_tail)).
query(true_val(three_d_base_technology, unk_three_d_base_technology)).

% @attr three_d_profiling
% @type categorical
% @canonical false
% @original_name 3D profiling
% @values nose_tail_contour=3D_contour_nose_tail_surf_dispersal unk_three_d_profiling=Unknown
% @importance 0.825

0.93::acc(s30, three_d_profiling).

0.80::true_val(three_d_profiling, nose_tail_contour); 0.20::true_val(three_d_profiling, unk_three_d_profiling).

measured(s30, three_d_profiling, nose_tail_contour).

all_consistent(three_d_profiling) :-
    (indep(s30), consistent(s30, three_d_profiling) ; \+indep(s30)).

evidence(all_consistent(three_d_profiling)).
query(true_val(three_d_profiling, nose_tail_contour)).
query(true_val(three_d_profiling, unk_three_d_profiling)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v20=20.0 unk_taper=Unknown
% @importance 0.875

0.95::acc(s20, taper).
0.90::acc(s_merchant, taper).

0.96::true_val(taper, v20); 0.04::true_val(taper, unk_taper).

measured(s20, taper, v20).
measured(s_merchant, taper, v20).

all_consistent(taper) :-
    consistent(s20, taper),
    (indep(s_merchant), consistent(s_merchant, taper) ; \+indep(s_merchant)).

evidence(all_consistent(taper)).
query(true_val(taper, v20)).
query(true_val(taper, unk_taper)).

% @attr taper_description
% @type categorical
% @canonical false
% @original_name taper
% @values promotes_float_turning=Promotes_floating_and_turning unk_taper_description=Unknown
% @importance 0.9

0.93::acc(s20, taper_description).

0.92::true_val(taper_description, promotes_float_turning); 0.08::true_val(taper_description, unk_taper_description).

measured(s20, taper_description, promotes_float_turning).

all_consistent(taper_description) :-
    consistent(s20, taper_description).

evidence(all_consistent(taper_description)).
query(true_val(taper_description, promotes_float_turning)).
query(true_val(taper_description, unk_taper_description)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values vneg25=neg25.0 unk_setback=Unknown
% @importance 0.875

0.93::acc(s_merchant, setback).

0.95::true_val(setback, vneg25); 0.05::true_val(setback, unk_setback).

measured(s_merchant, setback, vneg25).

all_consistent(setback) :-
    (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)).

evidence(all_consistent(setback)).
query(true_val(setback, vneg25)).
query(true_val(setback, unk_setback)).

% @attr setback_max_possible
% @type categorical
% @canonical false
% @original_name setback
% @values approx_neg5in=Approx_neg5in_from_center unk_setback_max_possible=Unknown
% @importance 0.85

0.82::acc(s_tgr, setback_max_possible).

0.76::true_val(setback_max_possible, approx_neg5in); 0.24::true_val(setback_max_possible, unk_setback_max_possible).

measured(s_tgr, setback_max_possible, approx_neg5in).

all_consistent(setback_max_possible) :-
    (indep(s_tgr), consistent(s_tgr, setback_max_possible) ; \+indep(s_tgr)).

evidence(all_consistent(setback_max_possible)).
query(true_val(setback_max_possible, approx_neg5in)).
query(true_val(setback_max_possible, unk_setback_max_possible)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_flat_top=Directional_Flat_Top flat_to_rocker=Flat_to_Rocker
% @importance 0.9

0.93::acc(s1, camber_type).
0.95::acc(s20, camber_type).
0.87::acc(s_sp, camber_type).
0.88::acc(s_tgr, camber_type).

0.55::true_val(camber_type, directional_flat_top); 0.45::true_val(camber_type, flat_to_rocker).

measured(s1, camber_type, directional_flat_top).
measured(s20, camber_type, directional_flat_top).
measured(s_sp, camber_type, flat_to_rocker).
measured(s_tgr, camber_type, flat_to_rocker).

all_consistent(camber_type) :-
    consistent(s20, camber_type),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)),
    (indep(s_sp), consistent(s_sp, camber_type) ; \+indep(s_sp)),
    (indep(s_tgr), consistent(s_tgr, camber_type) ; \+indep(s_tgr)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_flat_top)).
query(true_val(camber_type, flat_to_rocker)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values flat_rocker_nose_float=Flat_profile_rocker_nose_stability_float unk_camber_description=Unknown
% @importance 0.9

0.93::acc(s1, camber_description).
0.95::acc(s20, camber_description).

0.95::true_val(camber_description, flat_rocker_nose_float); 0.05::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, flat_rocker_nose_float).
measured(s20, camber_description, flat_rocker_nose_float).

all_consistent(camber_description) :-
    consistent(s20, camber_description),
    (indep(s1), consistent(s1, camber_description) ; \+indep(s1)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_rocker_nose_float)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v4_5=4.5 v5=5.0
% @importance 0.8

0.88::acc(s_merchant, flex_rating_10).
0.78::acc(s92, flex_rating_10).

0.55::true_val(flex_rating_10, v4_5); 0.45::true_val(flex_rating_10, v5).

measured(s_merchant, flex_rating_10, v4_5).
measured(s92, flex_rating_10, v5).

all_consistent(flex_rating_10) :-
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    (indep(s92), consistent(s92, flex_rating_10) ; \+indep(s92)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4_5)).
query(true_val(flex_rating_10, v5)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_flex=Directional_Flex_pop_tail_resilient_nose unk_flex_direction=Unknown
% @importance 0.9

0.93::acc(s1, flex_direction).
0.95::acc(s20, flex_direction).

0.95::true_val(flex_direction, directional_flex); 0.05::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, directional_flex).
measured(s20, flex_direction, directional_flex).

all_consistent(flex_direction) :-
    consistent(s20, flex_direction),
    (indep(s1), consistent(s1, flex_direction) ; \+indep(s1)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_feel
% @type numeric
% @canonical true
% @original_name flex_feel
% @unit /10
% @values v6=6.0 unk_flex_feel=Unknown
% @importance 0.85

0.84::acc(s_sp, flex_feel).

0.69::true_val(flex_feel, v6); 0.31::true_val(flex_feel, unk_flex_feel).

measured(s_sp, flex_feel, v6).

all_consistent(flex_feel) :-
    (indep(s_sp), consistent(s_sp, flex_feel) ; \+indep(s_sp)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, v6)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium=Medium unk_flex_rating_10_evo=Unknown
% @importance 0.9

0.88::acc(s1, flex_rating_10_evo).

0.81::true_val(flex_rating_10_evo, medium); 0.19::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s1, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :-
    (indep(s1), consistent(s1, flex_rating_10_evo) ; \+indep(s1)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel_qualitative
% @type categorical
% @canonical false
% @original_name flex_feel
% @values softer_than_freeride=Softer_flex_than_other_freeride_boards unk_flex_feel_qualitative=Unknown
% @importance 0.85

0.85::acc(s4, flex_feel_qualitative).

0.77::true_val(flex_feel_qualitative, softer_than_freeride); 0.23::true_val(flex_feel_qualitative, unk_flex_feel_qualitative).

measured(s4, flex_feel_qualitative, softer_than_freeride).

all_consistent(flex_feel_qualitative) :-
    (indep(s4), consistent(s4, flex_feel_qualitative) ; \+indep(s4)).

evidence(all_consistent(flex_feel_qualitative)).
query(true_val(flex_feel_qualitative, softer_than_freeride)).
query(true_val(flex_feel_qualitative, unk_flex_feel_qualitative)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical false
% @original_name flex_rating_10_the_good_ride
% @values middle_ground_butters_easy=Middle_ground_flex_butters_easy unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.85

0.85::acc(s_tgr, flex_rating_10_the_good_ride).

0.74::true_val(flex_rating_10_the_good_ride, middle_ground_butters_easy); 0.26::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).

measured(s_tgr, flex_rating_10_the_good_ride, middle_ground_butters_easy).

all_consistent(flex_rating_10_the_good_ride) :-
    (indep(s_tgr), consistent(s_tgr, flex_rating_10_the_good_ride) ; \+indep(s_tgr)).

evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, middle_ground_butters_easy)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G unk_core_material=Unknown
% @importance 0.875

0.95::acc(s20, core_material).
0.88::acc(s_merchant, core_material).

0.96::true_val(core_material, super_fly_ii_700g); 0.04::true_val(core_material, unk_core_material).

measured(s20, core_material, super_fly_ii_700g).
measured(s_merchant, core_material, super_fly_ii_700g).

all_consistent(core_material) :-
    consistent(s20, core_material),
    (indep(s_merchant), consistent(s_merchant, core_material) ; \+indep(s_merchant)).

evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified unk_sustainability_certification_fsc=Unknown
% @importance 0.475

0.82::acc(s59, sustainability_certification_fsc).
0.80::acc(s97, sustainability_certification_fsc).
0.85::acc(s100, sustainability_certification_fsc).

0.95::true_val(sustainability_certification_fsc, fsc_certified); 0.05::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s59, sustainability_certification_fsc, fsc_certified).
measured(s97, sustainability_certification_fsc, fsc_certified).
measured(s100, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :-
    (indep(s59), consistent(s59, sustainability_certification_fsc) ; \+indep(s59)),
    (indep(s97), consistent(s97, sustainability_certification_fsc) ; \+indep(s97)),
    (indep(s100), consistent(s100, sustainability_certification_fsc) ; \+indep(s100)).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr core_zones
% @type categorical
% @canonical false
% @original_name Core zones
% @values dualzone_egd=Dualzone_EGD unk_core_zones=Unknown
% @importance 0.775

0.95::acc(s20, core_zones).
0.88::acc(s14, core_zones).

0.96::true_val(core_zones, dualzone_egd); 0.04::true_val(core_zones, unk_core_zones).

measured(s20, core_zones, dualzone_egd).
measured(s14, core_zones, dualzone_egd).

all_consistent(core_zones) :-
    consistent(s20, core_zones),
    (indep(s14), consistent(s14, core_zones) ; \+indep(s14)).

evidence(all_consistent(core_zones)).
query(true_val(core_zones, dualzone_egd)).
query(true_val(core_zones, unk_core_zones)).

% @attr core_zones_description
% @type categorical
% @canonical false
% @original_name Core zones description
% @values egd_perpendicular_grain=Wood_grain_perpendicular_edges_consistent_edge_hold unk_core_zones_description=Unknown
% @importance 0.775

0.93::acc(s14, core_zones_description).
0.95::acc(s20, core_zones_description).

0.95::true_val(core_zones_description, egd_perpendicular_grain); 0.05::true_val(core_zones_description, unk_core_zones_description).

measured(s14, core_zones_description, egd_perpendicular_grain).
measured(s20, core_zones_description, egd_perpendicular_grain).

all_consistent(core_zones_description) :-
    consistent(s20, core_zones_description),
    (indep(s14), consistent(s14, core_zones_description) ; \+indep(s14)).

evidence(all_consistent(core_zones_description)).
query(true_val(core_zones_description, egd_perpendicular_grain)).
query(true_val(core_zones_description, unk_core_zones_description)).

% @attr core_profiling
% @type categorical
% @canonical false
% @original_name Core profiling
% @values squeezebox=Squeezebox unk_core_profiling=Unknown
% @importance 0.85

0.90::acc(s_merchant, core_profiling).

0.90::true_val(core_profiling, squeezebox); 0.10::true_val(core_profiling, unk_core_profiling).

measured(s_merchant, core_profiling, squeezebox).

all_consistent(core_profiling) :-
    (indep(s_merchant), consistent(s_merchant, core_profiling) ; \+indep(s_merchant)).

evidence(all_consistent(core_profiling)).
query(true_val(core_profiling, squeezebox)).
query(true_val(core_profiling, unk_core_profiling)).

% @attr core_profiling_description
% @type categorical
% @canonical false
% @original_name Core profiling description
% @values thick_thin_sections=Thick_powerful_thin_flexible_sections_energy_transfer unk_core_profiling_description=Unknown
% @importance 0.675

0.90::acc(s_merchant, core_profiling_description).
0.85::acc(s95, core_profiling_description).

0.92::true_val(core_profiling_description, thick_thin_sections); 0.08::true_val(core_profiling_description, unk_core_profiling_description).

measured(s_merchant, core_profiling_description, thick_thin_sections).
measured(s95, core_profiling_description, thick_thin_sections).

all_consistent(core_profiling_description) :-
    (indep(s_merchant), consistent(s_merchant, core_profiling_description) ; \+indep(s_merchant)),
    (indep(s95), consistent(s95, core_profiling_description) ; \+indep(s95)).

evidence(all_consistent(core_profiling_description)).
query(true_val(core_profiling_description, thick_thin_sections)).
query(true_val(core_profiling_description, unk_core_profiling_description)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values carbon_highlights_45=45_degree_Carbon_Highlights unk_laminate=Unknown
% @importance 0.775

0.95::acc(s20, laminate).
0.90::acc(s14, laminate).
0.88::acc(s_merchant, laminate).

0.96::true_val(laminate, carbon_highlights_45); 0.04::true_val(laminate, unk_laminate).

measured(s20, laminate, carbon_highlights_45).
measured(s14, laminate, carbon_highlights_45).
measured(s_merchant, laminate, carbon_highlights_45).

all_consistent(laminate) :-
    consistent(s20, laminate),
    (indep(s14), consistent(s14, laminate) ; \+indep(s14)),
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)).

evidence(all_consistent(laminate)).
query(true_val(laminate, carbon_highlights_45)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values fibre_angle_45_uni=45_degree_fibre_angle_uni_carbon_glass unk_construction_material_innovation=Unknown
% @importance 0.65

0.90::acc(s14, construction_material_innovation).

0.85::true_val(construction_material_innovation, fibre_angle_45_uni); 0.15::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s14, construction_material_innovation, fibre_angle_45_uni).

all_consistent(construction_material_innovation) :-
    (indep(s14), consistent(s14, construction_material_innovation) ; \+indep(s14)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, fibre_angle_45_uni)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO unk_base_material=Unknown
% @importance 0.75

0.95::acc(s20, base_material).
0.85::acc(s5, base_material).

0.96::true_val(base_material, sintered_wfo); 0.04::true_val(base_material, unk_base_material).

measured(s20, base_material, sintered_wfo).
measured(s5, base_material, sintered_wfo).

all_consistent(base_material) :-
    consistent(s20, base_material),
    (indep(s5), consistent(s5, base_material) ; \+indep(s5)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy unk_resin=Unknown
% @importance 0.6

0.90::acc(s14, resin).
0.88::acc(s_merchant, resin).

0.93::true_val(resin, super_sap_epoxy); 0.07::true_val(resin, unk_resin).

measured(s14, resin, super_sap_epoxy).
measured(s_merchant, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(s14), consistent(s14, resin) ; \+indep(s14)),
    (indep(s_merchant), consistent(s_merchant, resin) ; \+indep(s_merchant)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_recycled=ABS_Recycled unk_sidewall_material=Unknown
% @importance 0.625

0.90::acc(s14, sidewall_material).
0.88::acc(s_merchant, sidewall_material).

0.93::true_val(sidewall_material, abs_recycled); 0.07::true_val(sidewall_material, unk_sidewall_material).

measured(s14, sidewall_material, abs_recycled).
measured(s_merchant, sidewall_material, abs_recycled).

all_consistent(sidewall_material) :-
    (indep(s14), consistent(s14, sidewall_material) ; \+indep(s14)),
    (indep(s_merchant), consistent(s_merchant, sidewall_material) ; \+indep(s_merchant)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_recycled)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel unk_mounting_pattern=Unknown
% @importance 0.775

0.95::acc(s20, mounting_pattern).
0.88::acc(s1, mounting_pattern).
0.82::acc(s8, mounting_pattern).
0.85::acc(s92, mounting_pattern).

0.97::true_val(mounting_pattern, the_channel); 0.03::true_val(mounting_pattern, unk_mounting_pattern).

measured(s20, mounting_pattern, the_channel).
measured(s1, mounting_pattern, the_channel).
measured(s8, mounting_pattern, the_channel).
measured(s92, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    consistent(s20, mounting_pattern),
    (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)),
    (indep(s8), consistent(s8, mounting_pattern) ; \+indep(s8)),
    (indep(s92), consistent(s92, mounting_pattern) ; \+indep(s92)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values all_major_est_best=All_major_brands_best_with_EST unk_binding_compatibility=Unknown
% @importance 0.775

0.88::acc(s1, binding_compatibility).
0.90::acc(s_merchant, binding_compatibility).

0.92::true_val(binding_compatibility, all_major_est_best); 0.08::true_val(binding_compatibility, unk_binding_compatibility).

measured(s1, binding_compatibility, all_major_est_best).
measured(s_merchant, binding_compatibility, all_major_est_best).

all_consistent(binding_compatibility) :-
    (indep(s1), consistent(s1, binding_compatibility) ; \+indep(s1)),
    (indep(s_merchant), consistent(s_merchant, binding_compatibility) ; \+indep(s_merchant)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_major_est_best)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr channel_system_intro_year
% @type categorical
% @canonical false
% @original_name Channel system introduction year
% @values y2014=2014 unk_channel_system_intro_year=Unknown
% @importance 0.65

0.82::acc(s8, channel_system_intro_year).

0.72::true_val(channel_system_intro_year, y2014); 0.28::true_val(channel_system_intro_year, unk_channel_system_intro_year).

measured(s8, channel_system_intro_year, y2014).

all_consistent(channel_system_intro_year) :-
    (indep(s8), consistent(s8, channel_system_intro_year) ; \+indep(s8)).

evidence(all_consistent(channel_system_intro_year)).
query(true_val(channel_system_intro_year, y2014)).
query(true_val(channel_system_intro_year, unk_channel_system_intro_year)).

% @attr infinite_ride_technology
% @type categorical
% @canonical false
% @original_name Infinite Ride technology
% @values overbuilt_broken_down=Board_overbuilt_then_broken_down_consistent_ride unk_infinite_ride_technology=Unknown
% @importance 0.85

0.90::acc(s_merchant, infinite_ride_technology).

0.90::true_val(infinite_ride_technology, overbuilt_broken_down); 0.10::true_val(infinite_ride_technology, unk_infinite_ride_technology).

measured(s_merchant, infinite_ride_technology, overbuilt_broken_down).

all_consistent(infinite_ride_technology) :-
    (indep(s_merchant), consistent(s_merchant, infinite_ride_technology) ; \+indep(s_merchant)).

evidence(all_consistent(infinite_ride_technology)).
query(true_val(infinite_ride_technology, overbuilt_broken_down)).
query(true_val(infinite_ride_technology, unk_infinite_ride_technology)).

% @attr three_d_shaping_purpose
% @type categorical
% @canonical false
% @original_name 3D shaping purpose
% @values reduce_drag_responsive_turns=Reduces_drag_more_natural_sidecut unk_three_d_shaping_purpose=Unknown
% @importance 0.55

0.82::acc(s28, three_d_shaping_purpose).

0.70::true_val(three_d_shaping_purpose, reduce_drag_responsive_turns); 0.30::true_val(three_d_shaping_purpose, unk_three_d_shaping_purpose).

measured(s28, three_d_shaping_purpose, reduce_drag_responsive_turns).

all_consistent(three_d_shaping_purpose) :-
    (indep(s28), consistent(s28, three_d_shaping_purpose) ; \+indep(s28)).

evidence(all_consistent(three_d_shaping_purpose)).
query(true_val(three_d_shaping_purpose, reduce_drag_responsive_turns)).
query(true_val(three_d_shaping_purpose, unk_three_d_shaping_purpose)).

% @attr warranty
% @type categorical
% @canonical false
% @original_name warranty
% @values three_year=3_year_warranty unk_warranty=Unknown
% @importance 0.725

0.85::acc(s5, warranty).
0.82::acc(s92, warranty).

0.92::true_val(warranty, three_year); 0.08::true_val(warranty, unk_warranty).

measured(s5, warranty, three_year).
measured(s92, warranty, three_year).

all_consistent(warranty) :-
    (indep(s5), consistent(s5, warranty) ; \+indep(s5)),
    (indep(s92), consistent(s92, warranty) ; \+indep(s92)).

evidence(all_consistent(warranty)).
query(true_val(warranty, three_year)).
query(true_val(warranty, unk_warranty)).

% @attr available_sizes_149
% @type categorical
% @canonical false
% @original_name available_sizes
% @values yes=Yes unk_available_sizes_149=Unknown
% @importance 0.85

0.90::acc(s_merchant, available_sizes_149).

0.90::true_val(available_sizes_149, yes); 0.10::true_val(available_sizes_149, unk_available_sizes_149).

measured(s_merchant, available_sizes_149, yes).

all_consistent(available_sizes_149) :-
    (indep(s_merchant), consistent(s_merchant, available_sizes_149) ; \+indep(s_merchant)).

evidence(all_consistent(available_sizes_149)).
query(true_val(available_sizes_149, yes)).
query(true_val(available_sizes_149, unk_available_sizes_149)).

% @attr effective_edge_149
% @type numeric
% @canonical false
% @original_name Effective edge 149cm
% @unit mm
% @values v1025=1025.0 unk_effective_edge_149=Unknown
% @importance 0.85

0.90::acc(s_merchant, effective_edge_149).

0.90::true_val(effective_edge_149, v1025); 0.10::true_val(effective_edge_149, unk_effective_edge_149).

measured(s_merchant, effective_edge_149, v1025).

all_consistent(effective_edge_149) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_149) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v1025)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

% @attr contact_length_size_149
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit mm
% @values v950=950.0 unk_contact_length_size_149=Unknown
% @importance 0.85

0.90::acc(s_merchant, contact_length_size_149).

0.90::true_val(contact_length_size_149, v950); 0.10::true_val(contact_length_size_149, unk_contact_length_size_149).

measured(s_merchant, contact_length_size_149, v950).

all_consistent(contact_length_size_149) :-
    (indep(s_merchant), consistent(s_merchant, contact_length_size_149) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size_149)).
query(true_val(contact_length_size_149, v950)).
query(true_val(contact_length_size_149, unk_contact_length_size_149)).

% @attr sidecut_radius_size_149
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v5_9=5.9 unk_sidecut_radius_size_149=Unknown
% @importance 0.85

0.90::acc(s_merchant, sidecut_radius_size_149).

0.90::true_val(sidecut_radius_size_149, v5_9); 0.10::true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149).

measured(s_merchant, sidecut_radius_size_149, v5_9).

all_consistent(sidecut_radius_size_149) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_149) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_149)).
query(true_val(sidecut_radius_size_149, v5_9)).
query(true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149)).

% @attr sidecut_depth_149
% @type numeric
% @canonical false
% @original_name Sidecut depth 149cm
% @unit mm
% @values v19_2=19.2 unk_sidecut_depth_149=Unknown
% @importance 0.85

0.90::acc(s_merchant, sidecut_depth_149).

0.90::true_val(sidecut_depth_149, v19_2); 0.10::true_val(sidecut_depth_149, unk_sidecut_depth_149).

measured(s_merchant, sidecut_depth_149, v19_2).

all_consistent(sidecut_depth_149) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_depth_149) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_depth_149)).
query(true_val(sidecut_depth_149, v19_2)).
query(true_val(sidecut_depth_149, unk_sidecut_depth_149)).

% @attr waist_width_149
% @type numeric
% @canonical false
% @original_name Waist width 149cm
% @unit mm
% @values v250=250.0 unk_waist_width_149=Unknown
% @importance 0.85

0.90::acc(s_merchant, waist_width_149).
0.84::acc(s_sp, waist_width_149).

0.93::true_val(waist_width_149, v250); 0.07::true_val(waist_width_149, unk_waist_width_149).

measured(s_merchant, waist_width_149, v250).
measured(s_sp, waist_width_149, v250).

all_consistent(waist_width_149) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_149) ; \+indep(s_merchant)),
    (indep(s_sp), consistent(s_sp, waist_width_149) ; \+indep(s_sp)).

evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v250)).
query(true_val(waist_width_149, unk_waist_width_149)).

% @attr tip_tail_width_size_149
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values v298_4_278_4=298.4_278.4mm unk_tip_tail_width_size_149=Unknown
% @importance 0.85

0.90::acc(s_merchant, tip_tail_width_size_149).

0.90::true_val(tip_tail_width_size_149, v298_4_278_4); 0.10::true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149).

measured(s_merchant, tip_tail_width_size_149, v298_4_278_4).

all_consistent(tip_tail_width_size_149) :-
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_149) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_149)).
query(true_val(tip_tail_width_size_149, v298_4_278_4)).
query(true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149)).

% @attr stance_width_range_size_149
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit mm
% @values v505=505.0 unk_stance_width_range_size_149=Unknown
% @importance 0.85

0.90::acc(s_merchant, stance_width_range_size_149).

0.90::true_val(stance_width_range_size_149, v505); 0.10::true_val(stance_width_range_size_149, unk_stance_width_range_size_149).

measured(s_merchant, stance_width_range_size_149, v505).

all_consistent(stance_width_range_size_149) :-
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_149) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_149)).
query(true_val(stance_width_range_size_149, v505)).
query(true_val(stance_width_range_size_149, unk_stance_width_range_size_149)).

% @attr recommended_weight_range_size_149
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w45_68=45_68kg unk_recommended_weight_range_size_149=Unknown
% @importance 0.85

0.90::acc(s_merchant, recommended_weight_range_size_149).
0.84::acc(s_sp, recommended_weight_range_size_149).

0.93::true_val(recommended_weight_range_size_149, w45_68); 0.07::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).

measured(s_merchant, recommended_weight_range_size_149, w45_68).
measured(s_sp, recommended_weight_range_size_149, w45_68).

all_consistent(recommended_weight_range_size_149) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_149) ; \+indep(s_merchant)),
    (indep(s_sp), consistent(s_sp, recommended_weight_range_size_149) ; \+indep(s_sp)).

evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, w45_68)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

% @attr recommended_boot_size_149
% @type categorical
% @canonical false
% @original_name Recommended boot size 149cm
% @values us7_5_8_5=US_7_5_to_8_5 unk_recommended_boot_size_149=Unknown
% @importance 0.85

0.85::acc(s_tgr, recommended_boot_size_149).

0.74::true_val(recommended_boot_size_149, us7_5_8_5); 0.26::true_val(recommended_boot_size_149, unk_recommended_boot_size_149).

measured(s_tgr, recommended_boot_size_149, us7_5_8_5).

all_consistent(recommended_boot_size_149) :-
    (indep(s_tgr), consistent(s_tgr, recommended_boot_size_149) ; \+indep(s_tgr)).

evidence(all_consistent(recommended_boot_size_149)).
query(true_val(recommended_boot_size_149, us7_5_8_5)).
query(true_val(recommended_boot_size_149, unk_recommended_boot_size_149)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values yes=Yes unk_available_sizes=Unknown
% @importance 0.85

0.90::acc(s_merchant, available_sizes).

0.90::true_val(available_sizes, yes); 0.10::true_val(available_sizes, unk_available_sizes).

measured(s_merchant, available_sizes, yes).

all_consistent(available_sizes) :-
    (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, yes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr effective_edge_154
% @type numeric
% @canonical false
% @original_name Effective edge 154cm
% @unit mm
% @values v1075=1075.0 unk_effective_edge_154=Unknown
% @importance 0.85

0.90::acc(s_merchant, effective_edge_154).

0.90::true_val(effective_edge_154, v1075); 0.10::true_val(effective_edge_154, unk_effective_edge_154).

measured(s_merchant, effective_edge_154, v1075).

all_consistent(effective_edge_154) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_154) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v1075)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit mm
% @values v1000=1000.0 unk_contact_length_size=Unknown
% @importance 0.85

0.90::acc(s_merchant, contact_length_size).

0.90::true_val(contact_length_size, v1000); 0.10::true_val(contact_length_size, unk_contact_length_size).

measured(s_merchant, contact_length_size, v1000).

all_consistent(contact_length_size) :-
    (indep(s_merchant), consistent(s_merchant, contact_length_size) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1000)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v6_2=6.2 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.90::acc(s_merchant, sidecut_radius_size).

0.90::true_val(sidecut_radius_size, v6_2); 0.10::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_merchant, sidecut_radius_size, v6_2).

all_consistent(sidecut_radius_size) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v6_2)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_depth_154
% @type numeric
% @canonical false
% @original_name Sidecut depth 154cm
% @unit mm
% @values v20_2=20.2 unk_sidecut_depth_154=Unknown
% @importance 0.85

0.90::acc(s_merchant, sidecut_depth_154).

0.90::true_val(sidecut_depth_154, v20_2); 0.10::true_val(sidecut_depth_154, unk_sidecut_depth_154).

measured(s_merchant, sidecut_depth_154, v20_2).

all_consistent(sidecut_depth_154) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_depth_154) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_depth_154)).
query(true_val(sidecut_depth_154, v20_2)).
query(true_val(sidecut_depth_154, unk_sidecut_depth_154)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width 154cm
% @unit mm
% @values v255=255.0 unk_waist_width_154=Unknown
% @importance 0.85

0.90::acc(s_merchant, waist_width_154).
0.84::acc(s_sp, waist_width_154).

0.93::true_val(waist_width_154, v255); 0.07::true_val(waist_width_154, unk_waist_width_154).

measured(s_merchant, waist_width_154, v255).
measured(s_sp, waist_width_154, v255).

all_consistent(waist_width_154) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_154) ; \+indep(s_merchant)),
    (indep(s_sp), consistent(s_sp, waist_width_154) ; \+indep(s_sp)).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v255)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit mm
% @values v305_4_285_4=305.4_285.4mm unk_tip_tail_width_size=Unknown
% @importance 0.85

0.90::acc(s_merchant, tip_tail_width_size).

0.90::true_val(tip_tail_width_size, v305_4_285_4); 0.10::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_merchant, tip_tail_width_size, v305_4_285_4).

all_consistent(tip_tail_width_size) :-
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v305_4_285_4)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit mm
% @values v530=530.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.90::acc(s_merchant, stance_width_range_size).

0.90::true_val(stance_width_range_size, v530); 0.10::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_merchant, stance_width_range_size, v530).

all_consistent(stance_width_range_size) :-
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v530)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values w54_82=54_82kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.90::acc(s_merchant, recommended_weight_range_size).
0.84::acc(s_sp, recommended_weight_range_size).

0.93::true_val(recommended_weight_range_size, w54_82); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_merchant, recommended_weight_range_size, w54_82).
measured(s_sp, recommended_weight_range_size, w54_82).

all_consistent(recommended_weight_range_size) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size) ; \+indep(s_merchant)),
    (indep(s_sp), consistent(s_sp, recommended_weight_range_size) ; \+indep(s_sp)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w54_82)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_boot_size_154
% @type categorical
% @canonical false
% @original_name Recommended boot size 154cm
% @values us8_5_9_5=US_8_5_to_9_5 unk_recommended_boot_size_154=Unknown
% @importance 0.85

0.85::acc(s_tgr, recommended_boot_size_154).

0.74::true_val(recommended_boot_size_154, us8_5_9_5); 0.26::true_val(recommended_boot_size_154, unk_recommended_boot_size_154).

measured(s_tgr, recommended_boot_size_154, us8_5_9_5).

all_consistent(recommended_boot_size_154) :-
    (indep(s_tgr), consistent(s_tgr, recommended_boot_size_154) ; \+indep(s_tgr)).

evidence(all_consistent(recommended_boot_size_154)).
query(true_val(recommended_boot_size_154, us8_5_9_5)).
query(true_val(recommended_boot_size_154, unk_recommended_boot_size_154)).

% @attr available_sizes_159
% @type categorical
% @canonical false
% @original_name available_sizes
% @values yes=Yes unk_available_sizes_159=Unknown
% @importance 0.85

0.90::acc(s_merchant, available_sizes_159).

0.90::true_val(available_sizes_159, yes); 0.10::true_val(available_sizes_159, unk_available_sizes_159).

measured(s_merchant, available_sizes_159, yes).

all_consistent(available_sizes_159) :-
    (indep(s_merchant), consistent(s_merchant, available_sizes_159) ; \+indep(s_merchant)).

evidence(all_consistent(available_sizes_159)).
query(true_val(available_sizes_159, yes)).
query(true_val(available_sizes_159, unk_available_sizes_159)).

% @attr effective_edge_159
% @type numeric
% @canonical false
% @original_name Effective edge 159cm
% @unit mm
% @values v1125=1125.0 unk_effective_edge_159=Unknown
% @importance 0.85

0.90::acc(s_merchant, effective_edge_159).

0.90::true_val(effective_edge_159, v1125); 0.10::true_val(effective_edge_159, unk_effective_edge_159).

measured(s_merchant, effective_edge_159, v1125).

all_consistent(effective_edge_159) :-
    (indep(s_merchant), consistent(s_merchant, effective_edge_159) ; \+indep(s_merchant)).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1125)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr contact_length_size_159
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit mm
% @values v1050=1050.0 unk_contact_length_size_159=Unknown
% @importance 0.85

0.90::acc(s_merchant, contact_length_size_159).

0.90::true_val(contact_length_size_159, v1050); 0.10::true_val(contact_length_size_159, unk_contact_length_size_159).

measured(s_merchant, contact_length_size_159, v1050).

all_consistent(contact_length_size_159) :-
    (indep(s_merchant), consistent(s_merchant, contact_length_size_159) ; \+indep(s_merchant)).

evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v1050)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v6_5=6.5 unk_sidecut_radius_size_159=Unknown
% @importance 0.85

0.90::acc(s_merchant, sidecut_radius_size_159).

0.90::true_val(sidecut_radius_size_159, v6_5); 0.10::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s_merchant, sidecut_radius_size_159, v6_5).

all_consistent(sidecut_radius_size_159) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_radius_size_159) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v6_5)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr sidecut_depth_159
% @type numeric
% @canonical false
% @original_name Sidecut depth 159cm
% @unit mm
% @values v21_2=21.2 unk_sidecut_depth_159=Unknown
% @importance 0.85

0.90::acc(s_merchant, sidecut_depth_159).

0.90::true_val(sidecut_depth_159, v21_2); 0.10::true_val(sidecut_depth_159, unk_sidecut_depth_159).

measured(s_merchant, sidecut_depth_159, v21_2).

all_consistent(sidecut_depth_159) :-
    (indep(s_merchant), consistent(s_merchant, sidecut_depth_159) ; \+indep(s_merchant)).

evidence(all_consistent(sidecut_depth_159)).
query(true_val(sidecut_depth_159, v21_2)).
query(true_val(sidecut_depth_159, unk_sidecut_depth_159)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name Waist width 159cm
% @unit mm
% @values v260=260.0 unk_waist_width_159=Unknown
% @importance 0.85

0.90::acc(s_merchant, waist_width_159).
0.84::acc(s_sp, waist_width_159).

0.93::true_val(waist_width_159, v260); 0.07::true_val(waist_width_159, unk_waist_width_159).

measured(s_merchant, waist_width_159, v260).
measured(s_sp, waist_width_159, v260).

all_consistent(waist_width_159) :-
    (indep(s_merchant), consistent(s_merchant, waist_width_159) ; \+indep(s_merchant)),
    (indep(s_sp), consistent(s_sp, waist_width_159) ; \+indep(s_sp)).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v260)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr tip_tail_width_size_159
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit mm
% @values v312_4_292_4=312.4_292.4mm unk_tip_tail_width_size_159=Unknown
% @importance 0.85

0.90::acc(s_merchant, tip_tail_width_size_159).

0.90::true_val(tip_tail_width_size_159, v312_4_292_4); 0.10::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s_merchant, tip_tail_width_size_159, v312_4_292_4).

all_consistent(tip_tail_width_size_159) :-
    (indep(s_merchant), consistent(s_merchant, tip_tail_width_size_159) ; \+indep(s_merchant)).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v312_4_292_4)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

% @attr stance_width_range_size_159
% @type numeric
% @canonical false
% @original_name stance_width_range_size
% @unit mm
% @values v530=530.0 unk_stance_width_range_size_159=Unknown
% @importance 0.85

0.90::acc(s_merchant, stance_width_range_size_159).

0.90::true_val(stance_width_range_size_159, v530); 0.10::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).

measured(s_merchant, stance_width_range_size_159, v530).

all_consistent(stance_width_range_size_159) :-
    (indep(s_merchant), consistent(s_merchant, stance_width_range_size_159) ; \+indep(s_merchant)).

evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, v530)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @unit kg
% @values w68_91=68_91kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.85

0.90::acc(s_merchant, recommended_weight_range_size_159).
0.84::acc(s_sp, recommended_weight_range_size_159).

0.93::true_val(recommended_weight_range_size_159, w68_91); 0.07::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s_merchant, recommended_weight_range_size_159, w68_91).
measured(s_sp, recommended_weight_range_size_159, w68_91).

all_consistent(recommended_weight_range_size_159) :-
    (indep(s_merchant), consistent(s_merchant, recommended_weight_range_size_159) ; \+indep(s_merchant)),
    (indep(s_sp), consistent(s_sp, recommended_weight_range_size_159) ; \+indep(s_sp)).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w68_91)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr recommended_boot_size_159
% @type categorical
% @canonical false
% @original_name Recommended boot size 159cm
% @values us9_10=US_9_to_10 unk_recommended_boot_size_159=Unknown
% @importance 0.85

0.85::acc(s_tgr, recommended_boot_size_159).

0.74::true_val(recommended_boot_size_159, us9_10); 0.26::true_val(recommended_boot_size_159, unk_recommended_boot_size_159).

measured(s_tgr, recommended_boot_size_159, us9_10).

all_consistent(recommended_boot_size_159) :-
    (indep(s_tgr), consistent(s_tgr, recommended_boot_size_159) ; \+indep(s_tgr)).

evidence(all_consistent(recommended_boot_size_159)).
query(true_val(recommended_boot_size_159, us9_10)).
query(true_val(recommended_boot_size_159, unk_recommended_boot_size_159)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit grams
% @values v2760=2760.0 unk_board_weight_grams=Unknown
% @importance 0.85

0.87::acc(s_sp, board_weight_grams).

0.69::true_val(board_weight_grams, v2760); 0.31::true_val(board_weight_grams, unk_board_weight_grams).

measured(s_sp, board_weight_grams, v2760).

all_consistent(board_weight_grams) :-
    (indep(s_sp), consistent(s_sp, board_weight_grams) ; \+indep(s_sp)).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2760)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @canonical false
% @original_name weight_per_cm
% @unit grams/cm
% @values v17_92=17.92 unk_weight_per_cm=Unknown
% @importance 0.85

0.87::acc(s_sp, weight_per_cm).

0.69::true_val(weight_per_cm, v17_92); 0.31::true_val(weight_per_cm, unk_weight_per_cm).

measured(s_sp, weight_per_cm, v17_92).

all_consistent(weight_per_cm) :-
    (indep(s_sp), consistent(s_sp, weight_per_cm) ; \+indep(s_sp)).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v17_92)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr weight_feel_on_snow
% @type categorical
% @canonical false
% @original_name Weight feel on snow
% @values feels_normal=Feels_normal_despite_lighter unk_weight_feel_on_snow=Unknown
% @importance 0.85

0.84::acc(s_sp, weight_feel_on_snow).
0.82::acc(s_tgr, weight_feel_on_snow).

0.90::true_val(weight_feel_on_snow, feels_normal); 0.10::true_val(weight_feel_on_snow, unk_weight_feel_on_snow).

measured(s_sp, weight_feel_on_snow, feels_normal).
measured(s_tgr, weight_feel_on_snow, feels_normal).

all_consistent(weight_feel_on_snow) :-
    (indep(s_sp), consistent(s_sp, weight_feel_on_snow) ; \+indep(s_sp)),
    (indep(s_tgr), consistent(s_tgr, weight_feel_on_snow) ; \+indep(s_tgr)).

evidence(all_consistent(weight_feel_on_snow)).
query(true_val(weight_feel_on_snow, feels_normal)).
query(true_val(weight_feel_on_snow, unk_weight_feel_on_snow)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate=Intermediate unk_rider_level=Unknown
% @importance 0.85

0.88::acc(s_merchant, rider_level).

0.88::true_val(rider_level, intermediate); 0.12::true_val(rider_level, unk_rider_level).

measured(s_merchant, rider_level, intermediate).

all_consistent(rider_level) :-
    (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_Advanced intermediate_to_expert=Intermediate_to_Expert intermediate_expert=Intermediate_Expert
% @importance 0.75

0.85::acc(s1, skill_level_recommendation).
0.85::acc(s_tgr, skill_level_recommendation).
0.80::acc(s92, skill_level_recommendation).

0.40::true_val(skill_level_recommendation, intermediate_advanced); 0.30::true_val(skill_level_recommendation, intermediate_to_expert); 0.30::true_val(skill_level_recommendation, intermediate_expert).

measured(s1, skill_level_recommendation, intermediate_advanced).
measured(s_tgr, skill_level_recommendation, intermediate_to_expert).
measured(s92, skill_level_recommendation, intermediate_expert).

all_consistent(skill_level_recommendation) :-
    (indep(s1), consistent(s1, skill_level_recommendation) ; \+indep(s1)),
    (indep(s_tgr), consistent(s_tgr, skill_level_recommendation) ; \+indep(s_tgr)),
    (indep(s92), consistent(s92, skill_level_recommendation) ; \+indep(s92)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, intermediate_to_expert)).
query(true_val(skill_level_recommendation, intermediate_expert)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values excellent=Excellent unk_powder_rating_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, powder_rating_tgr).

0.74::true_val(powder_rating_tgr, excellent); 0.26::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s_tgr, powder_rating_tgr, excellent).

all_consistent(powder_rating_tgr) :-
    (indep(s_tgr), consistent(s_tgr, powder_rating_tgr) ; \+indep(s_tgr)).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, excellent)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good=Good unk_base_glide_performance=Unknown
% @importance 0.85

0.88::acc(s_tgr, base_glide_performance).

0.74::true_val(base_glide_performance, good); 0.26::true_val(base_glide_performance, unk_base_glide_performance).

measured(s_tgr, base_glide_performance, good).

all_consistent(base_glide_performance) :-
    (indep(s_tgr), consistent(s_tgr, base_glide_performance) ; \+indep(s_tgr)).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values average=Average unk_carving_rating_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, carving_rating_tgr).

0.74::true_val(carving_rating_tgr, average); 0.26::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s_tgr, carving_rating_tgr, average).

all_consistent(carving_rating_tgr) :-
    (indep(s_tgr), consistent(s_tgr, carving_rating_tgr) ; \+indep(s_tgr)).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, average)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, speed_rating_tgr).

0.74::true_val(speed_rating_tgr, good); 0.26::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s_tgr, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :-
    (indep(s_tgr), consistent(s_tgr, speed_rating_tgr) ; \+indep(s_tgr)).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values great=Great unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.88::acc(s_tgr, reviewer_opinion_the_good_ride).

0.74::true_val(reviewer_opinion_the_good_ride, great); 0.26::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s_tgr, reviewer_opinion_the_good_ride, great).

all_consistent(reviewer_opinion_the_good_ride) :-
    (indep(s_tgr), consistent(s_tgr, reviewer_opinion_the_good_ride) ; \+indep(s_tgr)).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, great)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values average=Average unk_switch_riding=Unknown
% @importance 0.85

0.88::acc(s_tgr, switch_riding).

0.74::true_val(switch_riding, average); 0.26::true_val(switch_riding, unk_switch_riding).

measured(s_tgr, switch_riding, average).

all_consistent(switch_riding) :-
    (indep(s_tgr), consistent(s_tgr, switch_riding) ; \+indep(s_tgr)).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, average)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values good=Good unk_jumps_rating_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, jumps_rating_tgr).

0.74::true_val(jumps_rating_tgr, good); 0.26::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s_tgr, jumps_rating_tgr, good).

all_consistent(jumps_rating_tgr) :-
    (indep(s_tgr), consistent(s_tgr, jumps_rating_tgr) ; \+indep(s_tgr)).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, good)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, jibbing_rating_tgr).

0.74::true_val(jibbing_rating_tgr, average); 0.26::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s_tgr, jibbing_rating_tgr, average).

all_consistent(jibbing_rating_tgr) :-
    (indep(s_tgr), consistent(s_tgr, jibbing_rating_tgr) ; \+indep(s_tgr)).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values average=Average unk_pipe_rating_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, pipe_rating_tgr).

0.74::true_val(pipe_rating_tgr, average); 0.26::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

measured(s_tgr, pipe_rating_tgr, average).

all_consistent(pipe_rating_tgr) :-
    (indep(s_tgr), consistent(s_tgr, pipe_rating_tgr) ; \+indep(s_tgr)).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, average)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow_feel_tgr=Unknown
% @importance 0.85

0.88::acc(s_tgr, on_snow_feel_tgr).

0.74::true_val(on_snow_feel_tgr, stable); 0.26::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s_tgr, on_snow_feel_tgr, stable).

all_consistent(on_snow_feel_tgr) :-
    (indep(s_tgr), consistent(s_tgr, on_snow_feel_tgr) ; \+indep(s_tgr)).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.85

0.88::acc(s_tgr, turn_initiation_performance).

0.74::true_val(turn_initiation_performance, medium_fast); 0.26::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s_tgr, turn_initiation_performance, medium_fast).

all_consistent(turn_initiation_performance) :-
    (indep(s_tgr), consistent(s_tgr, turn_initiation_performance) ; \+indep(s_tgr)).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_tgr_uneven_terrain
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values moderate=Moderate unk_reviewer_opinion_tgr_uneven_terrain=Unknown
% @importance 0.85

0.85::acc(s_tgr, reviewer_opinion_tgr_uneven_terrain).

0.74::true_val(reviewer_opinion_tgr_uneven_terrain, moderate); 0.26::true_val(reviewer_opinion_tgr_uneven_terrain, unk_reviewer_opinion_tgr_uneven_terrain).

measured(s_tgr, reviewer_opinion_tgr_uneven_terrain, moderate).

all_consistent(reviewer_opinion_tgr_uneven_terrain) :-
    (indep(s_tgr), consistent(s_tgr, reviewer_opinion_tgr_uneven_terrain) ; \+indep(s_tgr)).

evidence(all_consistent(reviewer_opinion_tgr_uneven_terrain)).
query(true_val(reviewer_opinion_tgr_uneven_terrain, moderate)).
query(true_val(reviewer_opinion_tgr_uneven_terrain, unk_reviewer_opinion_tgr_uneven_terrain)).

% @attr reviewer_opinion_tgr_butterability
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values semi_easy=Semi_Easy unk_reviewer_opinion_tgr_butterability=Unknown
% @importance 0.85

0.85::acc(s_tgr, reviewer_opinion_tgr_butterability).

0.74::true_val(reviewer_opinion_tgr_butterability, semi_easy); 0.26::true_val(reviewer_opinion_tgr_butterability, unk_reviewer_opinion_tgr_butterability).

measured(s_tgr, reviewer_opinion_tgr_butterability, semi_easy).

all_consistent(reviewer_opinion_tgr_butterability) :-
    (indep(s_tgr), consistent(s_tgr, reviewer_opinion_tgr_butterability) ; \+indep(s_tgr)).

evidence(all_consistent(reviewer_opinion_tgr_butterability)).
query(true_val(reviewer_opinion_tgr_butterability, semi_easy)).
query(true_val(reviewer_opinion_tgr_butterability, unk_reviewer_opinion_tgr_butterability)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values medium_snow=Medium_Snow unk_edge_hold=Unknown
% @importance 0.85

0.88::acc(s_tgr, edge_hold).

0.74::true_val(edge_hold, medium_snow); 0.26::true_val(edge_hold, unk_edge_hold).

measured(s_tgr, edge_hold, medium_snow).

all_consistent(edge_hold) :-
    (indep(s_tgr), consistent(s_tgr, edge_hold) ; \+indep(s_tgr)).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, medium_snow)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v83_1=83.1 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.85

0.87::acc(s_sp, overall_rating_snowboardingprofiles).

0.69::true_val(overall_rating_snowboardingprofiles, v83_1); 0.31::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s_sp, overall_rating_snowboardingprofiles, v83_1).

all_consistent(overall_rating_snowboardingprofiles) :-
    (indep(s_sp), consistent(s_sp, overall_rating_snowboardingprofiles) ; \+indep(s_sp)).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v83_1)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name powder_score_snowboardingprofiles
% @unit /5
% @values v5_0=5.0 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.85

0.87::acc(s_sp, powder_score_snowboardingprofiles).

0.69::true_val(powder_score_snowboardingprofiles, v5_0); 0.31::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s_sp, powder_score_snowboardingprofiles, v5_0).

all_consistent(powder_score_snowboardingprofiles) :-
    (indep(s_sp), consistent(s_sp, powder_score_snowboardingprofiles) ; \+indep(s_sp)).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v5_0)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @unit /5
% @values v3_0=3.0 unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.85

0.85::acc(s_sp, reviewer_opinion_snowboardingprofiles).

0.69::true_val(reviewer_opinion_snowboardingprofiles, v3_0); 0.31::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s_sp, reviewer_opinion_snowboardingprofiles, v3_0).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    (indep(s_sp), consistent(s_sp, reviewer_opinion_snowboardingprofiles) ; \+indep(s_sp)).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, v3_0)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @canonical false
% @original_name carving_score_snowboardingprofiles
% @unit /5
% @values v3_0=3.0 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.85

0.85::acc(s_sp, carving_score_snowboardingprofiles).

0.69::true_val(carving_score_snowboardingprofiles, v3_0c); 0.31::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s_sp, carving_score_snowboardingprofiles, v3_0c).

all_consistent(carving_score_snowboardingprofiles) :-
    (indep(s_sp), consistent(s_sp, carving_score_snowboardingprofiles) ; \+indep(s_sp)).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v3_0c)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr reviewer_opinion_sp_turning
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @unit /5
% @values v4_0=4.0 unk_reviewer_opinion_sp_turning=Unknown
% @importance 0.85

0.85::acc(s_sp, reviewer_opinion_sp_turning).

0.69::true_val(reviewer_opinion_sp_turning, v4_0); 0.31::true_val(reviewer_opinion_sp_turning, unk_reviewer_opinion_sp_turning).

measured(s_sp, reviewer_opinion_sp_turning, v4_0).

all_consistent(reviewer_opinion_sp_turning) :-
    (indep(s_sp), consistent(s_sp, reviewer_opinion_sp_turning) ; \+indep(s_sp)).

evidence(all_consistent(reviewer_opinion_sp_turning)).
query(true_val(reviewer_opinion_sp_turning, v4_0)).
query(true_val(reviewer_opinion_sp_turning, unk_reviewer_opinion_sp_turning)).

% @attr reviewer_opinion_sp_edge_hold
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @unit /5
% @values v3_5=3.5 unk_reviewer_opinion_sp_edge_hold=Unknown
% @importance 0.85

0.85::acc(s_sp, reviewer_opinion_sp_edge_hold).

0.69::true_val(reviewer_opinion_sp_edge_hold, v3_5); 0.31::true_val(reviewer_opinion_sp_edge_hold, unk_reviewer_opinion_sp_edge_hold).

measured(s_sp, reviewer_opinion_sp_edge_hold, v3_5).

all_consistent(reviewer_opinion_sp_edge_hold) :-
    (indep(s_sp), consistent(s_sp, reviewer_opinion_sp_edge_hold) ; \+indep(s_sp)).

evidence(all_consistent(reviewer_opinion_sp_edge_hold)).
query(true_val(reviewer_opinion_sp_edge_hold, v3_5)).
query(true_val(reviewer_opinion_sp_edge_hold, unk_reviewer_opinion_sp_edge_hold)).

% @attr reviewer_opinion_sp_playfulness
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @unit /5
% @values v3_0p=3.0 unk_reviewer_opinion_sp_playfulness=Unknown
% @importance 0.85

0.85::acc(s_sp, reviewer_opinion_sp_playfulness).

0.69::true_val(reviewer_opinion_sp_playfulness, v3_0p); 0.31::true_val(reviewer_opinion_sp_playfulness, unk_reviewer_opinion_sp_playfulness).

measured(s_sp, reviewer_opinion_sp_playfulness, v3_0p).

all_consistent(reviewer_opinion_sp_playfulness) :-
    (indep(s_sp), consistent(s_sp, reviewer_opinion_sp_playfulness) ; \+indep(s_sp)).

evidence(all_consistent(reviewer_opinion_sp_playfulness)).
query(true_val(reviewer_opinion_sp_playfulness, v3_0p)).
query(true_val(reviewer_opinion_sp_playfulness, unk_reviewer_opinion_sp_playfulness)).

% @attr reviewer_opinion_sp_switch
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @unit /5
% @values v2_5=2.5 unk_reviewer_opinion_sp_switch=Unknown
% @importance 0.85

0.85::acc(s_sp, reviewer_opinion_sp_switch).

0.69::true_val(reviewer_opinion_sp_switch, v2_5); 0.31::true_val(reviewer_opinion_sp_switch, unk_reviewer_opinion_sp_switch).

measured(s_sp, reviewer_opinion_sp_switch, v2_5).

all_consistent(reviewer_opinion_sp_switch) :-
    (indep(s_sp), consistent(s_sp, reviewer_opinion_sp_switch) ; \+indep(s_sp)).

evidence(all_consistent(reviewer_opinion_sp_switch)).
query(true_val(reviewer_opinion_sp_switch, v2_5)).
query(true_val(reviewer_opinion_sp_switch, unk_reviewer_opinion_sp_switch)).

% @attr reviewer_opinion_sp_park
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @unit /5
% @values v1_5=1.5 unk_reviewer_opinion_sp_park=Unknown
% @importance 0.85

0.85::acc(s_sp, reviewer_opinion_sp_park).

0.69::true_val(reviewer_opinion_sp_park, v1_5); 0.31::true_val(reviewer_opinion_sp_park, unk_reviewer_opinion_sp_park).

measured(s_sp, reviewer_opinion_sp_park, v1_5).

all_consistent(reviewer_opinion_sp_park) :-
    (indep(s_sp), consistent(s_sp, reviewer_opinion_sp_park) ; \+indep(s_sp)).

evidence(all_consistent(reviewer_opinion_sp_park)).
query(true_val(reviewer_opinion_sp_park, v1_5)).
query(true_val(reviewer_opinion_sp_park, unk_reviewer_opinion_sp_park)).

% @attr reviewer_opinion_sp_ranking
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values rank_24_of_30=24th_out_of_30 unk_reviewer_opinion_sp_ranking=Unknown
% @importance 0.85

0.85::acc(s_sp, reviewer_opinion_sp_ranking).

0.69::true_val(reviewer_opinion_sp_ranking, rank_24_of_30); 0.31::true_val(reviewer_opinion_sp_ranking, unk_reviewer_opinion_sp_ranking).

measured(s_sp, reviewer_opinion_sp_ranking, rank_24_of_30).

all_consistent(reviewer_opinion_sp_ranking) :-
    (indep(s_sp), consistent(s_sp, reviewer_opinion_sp_ranking) ; \+indep(s_sp)).

evidence(all_consistent(reviewer_opinion_sp_ranking)).
query(true_val(reviewer_opinion_sp_ranking, rank_24_of_30)).
query(true_val(reviewer_opinion_sp_ranking, unk_reviewer_opinion_sp_ranking)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values exceptional_powder_float=Exceptional_float_in_powder_effortless unk_positive_aspect=Unknown
% @importance 0.85

0.85::acc(s_tgr, positive_aspect).

0.74::true_val(positive_aspect, exceptional_powder_float); 0.26::true_val(positive_aspect, unk_positive_aspect).

measured(s_tgr, positive_aspect, exceptional_powder_float).

all_consistent(positive_aspect) :-
    (indep(s_tgr), consistent(s_tgr, positive_aspect) ; \+indep(s_tgr)).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, exceptional_powder_float)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_2
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values super_surfy_feel=Super_surfy_feel_board_does_work unk_positive_aspect_2=Unknown
% @importance 0.85

0.78::acc(s45, positive_aspect_2).

0.40::true_val(positive_aspect_2, super_surfy_feel); 0.60::true_val(positive_aspect_2, unk_positive_aspect_2).

measured(s45, positive_aspect_2, super_surfy_feel).

all_consistent(positive_aspect_2) :-
    (indep(s45), consistent(s45, positive_aspect_2) ; \+indep(s45)).

evidence(all_consistent(positive_aspect_2)).
query(true_val(positive_aspect_2, super_surfy_feel)).
query(true_val(positive_aspect_2, unk_positive_aspect_2)).

% @attr positive_aspect_3
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values nimble_powder_turns=Very_nimble_turns_easily_in_powder unk_positive_aspect_3=Unknown
% @importance 0.85

0.78::acc(s45, positive_aspect_3).

0.40::true_val(positive_aspect_3, nimble_powder_turns); 0.60::true_val(positive_aspect_3, unk_positive_aspect_3).

measured(s45, positive_aspect_3, nimble_powder_turns).

all_consistent(positive_aspect_3) :-
    (indep(s45), consistent(s45, positive_aspect_3) ; \+indep(s45)).

evidence(all_consistent(positive_aspect_3)).
query(true_val(positive_aspect_3, nimble_powder_turns)).
query(true_val(positive_aspect_3, unk_positive_aspect_3)).

% @attr positive_aspect_4
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values butters_easy=Butters_really_easy_with_rocker unk_positive_aspect_4=Unknown
% @importance 0.85

0.85::acc(s_tgr, positive_aspect_4).

0.74::true_val(positive_aspect_4, butters_easy); 0.26::true_val(positive_aspect_4, unk_positive_aspect_4).

measured(s_tgr, positive_aspect_4, butters_easy).

all_consistent(positive_aspect_4) :-
    (indep(s_tgr), consistent(s_tgr, positive_aspect_4) ; \+indep(s_tgr)).

evidence(all_consistent(positive_aspect_4)).
query(true_val(positive_aspect_4, butters_easy)).
query(true_val(positive_aspect_4, unk_positive_aspect_4)).

% @attr positive_aspect_5
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values nose_lifts_naturally=Nose_lifts_right_up_naturally unk_positive_aspect_5=Unknown
% @importance 0.85

0.78::acc(s45, positive_aspect_5).

0.40::true_val(positive_aspect_5, nose_lifts_naturally); 0.60::true_val(positive_aspect_5, unk_positive_aspect_5).

measured(s45, positive_aspect_5, nose_lifts_naturally).

all_consistent(positive_aspect_5) :-
    (indep(s45), consistent(s45, positive_aspect_5) ; \+indep(s45)).

evidence(all_consistent(positive_aspect_5)).
query(true_val(positive_aspect_5, nose_lifts_naturally)).
query(true_val(positive_aspect_5, unk_positive_aspect_5)).

% @attr positive_aspect_6
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values best_powder_board_ever=Rated_best_powder_board_ever_used unk_positive_aspect_6=Unknown
% @importance 0.85

0.78::acc(s45, positive_aspect_6).

0.40::true_val(positive_aspect_6, best_powder_board_ever); 0.60::true_val(positive_aspect_6, unk_positive_aspect_6).

measured(s45, positive_aspect_6, best_powder_board_ever).

all_consistent(positive_aspect_6) :-
    (indep(s45), consistent(s45, positive_aspect_6) ; \+indep(s45)).

evidence(all_consistent(positive_aspect_6)).
query(true_val(positive_aspect_6, best_powder_board_ever)).
query(true_val(positive_aspect_6, unk_positive_aspect_6)).

% @attr positive_aspect_7
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values best_dedicated_powder_burton=Best_dedicated_powder_board_Burton_makes unk_positive_aspect_7=Unknown
% @importance 0.85

0.78::acc(s45, positive_aspect_7).

0.40::true_val(positive_aspect_7, best_dedicated_powder_burton); 0.60::true_val(positive_aspect_7, unk_positive_aspect_7).

measured(s45, positive_aspect_7, best_dedicated_powder_burton).

all_consistent(positive_aspect_7) :-
    (indep(s45), consistent(s45, positive_aspect_7) ; \+indep(s45)).

evidence(all_consistent(positive_aspect_7)).
query(true_val(positive_aspect_7, best_dedicated_powder_burton)).
query(true_val(positive_aspect_7, unk_positive_aspect_7)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values channels_grab_thick_powder=3D_channels_grab_too_much_in_thick_powder unk_negative_aspect=Unknown
% @importance 0.85

0.87::acc(s_tgr, negative_aspect).
0.82::acc(s_sp, negative_aspect).

0.88::true_val(negative_aspect, channels_grab_thick_powder); 0.12::true_val(negative_aspect, unk_negative_aspect).

measured(s_tgr, negative_aspect, channels_grab_thick_powder).
measured(s_sp, negative_aspect, channels_grab_thick_powder).

all_consistent(negative_aspect) :-
    (indep(s_tgr), consistent(s_tgr, negative_aspect) ; \+indep(s_tgr)),
    (indep(s_sp), consistent(s_sp, negative_aspect) ; \+indep(s_sp)).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, channels_grab_thick_powder)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_2
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_great_firm_groomers=Not_amazing_in_firmer_snow_or_groomers unk_negative_aspect_2=Unknown
% @importance 0.85

0.78::acc(s45, negative_aspect_2).

0.40::true_val(negative_aspect_2, not_great_firm_groomers); 0.60::true_val(negative_aspect_2, unk_negative_aspect_2).

measured(s45, negative_aspect_2, not_great_firm_groomers).

all_consistent(negative_aspect_2) :-
    (indep(s45), consistent(s45, negative_aspect_2) ; \+indep(s45)).

evidence(all_consistent(negative_aspect_2)).
query(true_val(negative_aspect_2, not_great_firm_groomers)).
query(true_val(negative_aspect_2, unk_negative_aspect_2)).

% @attr negative_aspect_3
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values locked_in_hardpack=Semi_locked_in_feeling_on_hardpack unk_negative_aspect_3=Unknown
% @importance 0.85

0.82::acc(s_sp, negative_aspect_3).

0.69::true_val(negative_aspect_3, locked_in_hardpack); 0.31::true_val(negative_aspect_3, unk_negative_aspect_3).

measured(s_sp, negative_aspect_3, locked_in_hardpack).

all_consistent(negative_aspect_3) :-
    (indep(s_sp), consistent(s_sp, negative_aspect_3) ; \+indep(s_sp)).

evidence(all_consistent(negative_aspect_3)).
query(true_val(negative_aspect_3, locked_in_hardpack)).
query(true_val(negative_aspect_3, unk_negative_aspect_3)).

% @attr negative_aspect_4
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values catchy_skidded_turns=A_little_catchy_for_skidded_turns unk_negative_aspect_4=Unknown
% @importance 0.85

0.82::acc(s_sp, negative_aspect_4).

0.69::true_val(negative_aspect_4, catchy_skidded_turns); 0.31::true_val(negative_aspect_4, unk_negative_aspect_4).

measured(s_sp, negative_aspect_4, catchy_skidded_turns).

all_consistent(negative_aspect_4) :-
    (indep(s_sp), consistent(s_sp, negative_aspect_4) ; \+indep(s_sp)).

evidence(all_consistent(negative_aspect_4)).
query(true_val(negative_aspect_4, catchy_skidded_turns)).
query(true_val(negative_aspect_4, unk_negative_aspect_4)).

% @attr negative_aspect_5
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_great_switch=Not_great_for_switch_riding unk_negative_aspect_5=Unknown
% @importance 0.85

0.82::acc(s_sp, negative_aspect_5).

0.69::true_val(negative_aspect_5, not_great_switch); 0.31::true_val(negative_aspect_5, unk_negative_aspect_5).

measured(s_sp, negative_aspect_5, not_great_switch).

all_consistent(negative_aspect_5) :-
    (indep(s_sp), consistent(s_sp, negative_aspect_5) ; \+indep(s_sp)).

evidence(all_consistent(negative_aspect_5)).
query(true_val(negative_aspect_5, not_great_switch)).
query(true_val(negative_aspect_5, unk_negative_aspect_5)).

% @attr negative_aspect_6
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values less_than_average_pop=Less_than_average_pop unk_negative_aspect_6=Unknown
% @importance 0.85

0.82::acc(s_sp, negative_aspect_6).

0.69::true_val(negative_aspect_6, less_than_average_pop); 0.31::true_val(negative_aspect_6, unk_negative_aspect_6).

measured(s_sp, negative_aspect_6, less_than_average_pop).

all_consistent(negative_aspect_6) :-
    (indep(s_sp), consistent(s_sp, negative_aspect_6) ; \+indep(s_sp)).

evidence(all_consistent(negative_aspect_6)).
query(true_val(negative_aspect_6, less_than_average_pop)).
query(true_val(negative_aspect_6, unk_negative_aspect_6)).

% @attr negative_aspect_7
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values limited_3_sizes=Limited_to_3_sizes_159_max unk_negative_aspect_7=Unknown
% @importance 0.825

0.78::acc(s45, negative_aspect_7).
0.75::acc(s67, negative_aspect_7).

0.65::true_val(negative_aspect_7, limited_3_sizes); 0.35::true_val(negative_aspect_7, unk_negative_aspect_7).

measured(s45, negative_aspect_7, limited_3_sizes).
measured(s67, negative_aspect_7, limited_3_sizes).

all_consistent(negative_aspect_7) :-
    (indep(s45), consistent(s45, negative_aspect_7) ; \+indep(s45)),
    (indep(s67), consistent(s67, negative_aspect_7) ; \+indep(s67)).

evidence(all_consistent(negative_aspect_7)).
query(true_val(negative_aspect_7, limited_3_sizes)).
query(true_val(negative_aspect_7, unk_negative_aspect_7)).

% @attr negative_aspect_8
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values base_needed_waxing=Base_needed_few_waxes_initially unk_negative_aspect_8=Unknown
% @importance 0.85

0.78::acc(s45, negative_aspect_8).

0.40::true_val(negative_aspect_8, base_needed_waxing); 0.60::true_val(negative_aspect_8, unk_negative_aspect_8).

measured(s45, negative_aspect_8, base_needed_waxing).

all_consistent(negative_aspect_8) :-
    (indep(s45), consistent(s45, negative_aspect_8) ; \+indep(s45)).

evidence(all_consistent(negative_aspect_8)).
query(true_val(negative_aspect_8, base_needed_waxing)).
query(true_val(negative_aspect_8, unk_negative_aspect_8)).

% @attr negative_aspect_9
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_nimble_slow_groomers=Not_nimble_at_slow_speeds_on_groomers unk_negative_aspect_9=Unknown
% @importance 0.85

0.82::acc(s_sp, negative_aspect_9).

0.69::true_val(negative_aspect_9, not_nimble_slow_groomers); 0.31::true_val(negative_aspect_9, unk_negative_aspect_9).

measured(s_sp, negative_aspect_9, not_nimble_slow_groomers).

all_consistent(negative_aspect_9) :-
    (indep(s_sp), consistent(s_sp, negative_aspect_9) ; \+indep(s_sp)).

evidence(all_consistent(negative_aspect_9)).
query(true_val(negative_aspect_9, not_nimble_slow_groomers)).
query(true_val(negative_aspect_9, unk_negative_aspect_9)).

% @attr negative_aspect_10
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values twitchy_large_rider=159_twitchy_for_large_rider unk_negative_aspect_10=Unknown
% @importance 0.8

0.75::acc(s109, negative_aspect_10).

0.35::true_val(negative_aspect_10, twitchy_large_rider); 0.65::true_val(negative_aspect_10, unk_negative_aspect_10).

measured(s109, negative_aspect_10, twitchy_large_rider).

all_consistent(negative_aspect_10) :-
    (indep(s109), consistent(s109, negative_aspect_10) ; \+indep(s109)).

evidence(all_consistent(negative_aspect_10)).
query(true_val(negative_aspect_10, twitchy_large_rider)).
query(true_val(negative_aspect_10, unk_negative_aspect_10)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v659=659.0 v669=669.0 v670=670.0
% @importance 0.75

0.82::acc(s_tgr, price_usd_msrp).
0.80::acc(s_sp, price_usd_msrp).
0.55::acc(s89, price_usd_msrp).

0.40::true_val(price_usd_msrp, v659); 0.35::true_val(price_usd_msrp, v669); 0.25::true_val(price_usd_msrp, v670).

measured(s_tgr, price_usd_msrp, v659).
measured(s_sp, price_usd_msrp, v669).
measured(s89, price_usd_msrp, v670).

all_consistent(price_usd_msrp) :-
    (indep(s_tgr), consistent(s_tgr, price_usd_msrp) ; \+indep(s_tgr)),
    (indep(s_sp), consistent(s_sp, price_usd_msrp) ; \+indep(s_sp)),
    (indep(s89), consistent(s89, price_usd_msrp) ; \+indep(s89)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v659)).
query(true_val(price_usd_msrp, v669)).
query(true_val(price_usd_msrp, v670)).

% @attr price_usd_backcountry
% @type numeric
% @canonical false
% @original_name price_usd_backcountry
% @unit USD
% @values v334_98=334.98 unk_price_usd_backcountry=Unknown
% @importance 0.85

0.88::acc(s_tgr, price_usd_backcountry).

0.74::true_val(price_usd_backcountry, v334_98); 0.26::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s_tgr, price_usd_backcountry, v334_98).

all_consistent(price_usd_backcountry) :-
    (indep(s_tgr), consistent(s_tgr, price_usd_backcountry) ; \+indep(s_tgr)).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v334_98)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_cad_prfo
% @type numeric
% @canonical false
% @original_name price_cad_prfo
% @unit CAD
% @values v439_99=439.99 unk_price_cad_prfo=Unknown
% @importance 0.85

0.85::acc(s_tgr, price_cad_prfo).

0.74::true_val(price_cad_prfo, v439_99); 0.26::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s_tgr, price_cad_prfo, v439_99).

all_consistent(price_cad_prfo) :-
    (indep(s_tgr), consistent(s_tgr, price_cad_prfo) ; \+indep(s_tgr)).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v439_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_cad_burton_canada
% @type numeric
% @canonical false
% @original_name Price CAD at Burton Canada
% @unit CAD
% @values v879_99=879.99 unk_price_cad_burton_canada=Unknown
% @importance 0.85

0.85::acc(s_tgr, price_cad_burton_canada).

0.74::true_val(price_cad_burton_canada, v879_99); 0.26::true_val(price_cad_burton_canada, unk_price_cad_burton_canada).

measured(s_tgr, price_cad_burton_canada, v879_99).

all_consistent(price_cad_burton_canada) :-
    (indep(s_tgr), consistent(s_tgr, price_cad_burton_canada) ; \+indep(s_tgr)).

evidence(all_consistent(price_cad_burton_canada)).
query(true_val(price_cad_burton_canada, v879_99)).
query(true_val(price_cad_burton_canada, unk_price_cad_burton_canada)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v699_99=699.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::acc(s_merchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v699_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v699_99).

all_consistent(price_aud_merchant) :-
    (indep(s_merchant), consistent(s_merchant, price_aud_merchant) ; \+indep(s_merchant)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v699_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_skipro_package
% @type numeric
% @canonical false
% @original_name USD price at Ski Pro AZ (original)
% @unit USD
% @values v1079_90=1079.90 unk_price_usd_skipro_package=Unknown
% @importance 0.6

0.50::acc(s37, price_usd_skipro_package).

0.28::true_val(price_usd_skipro_package, v1079_90); 0.72::true_val(price_usd_skipro_package, unk_price_usd_skipro_package).

measured(s37, price_usd_skipro_package, v1079_90).

all_consistent(price_usd_skipro_package) :-
    (indep(s37), consistent(s37, price_usd_skipro_package) ; \+indep(s37)).

evidence(all_consistent(price_usd_skipro_package)).
query(true_val(price_usd_skipro_package, v1079_90)).
query(true_val(price_usd_skipro_package, unk_price_usd_skipro_package)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_sale=Available_on_sale unk_availability_status_backcountry=Unknown
% @importance 0.85

0.85::acc(s_tgr, availability_status_backcountry).

0.74::true_val(availability_status_backcountry, available_sale); 0.26::true_val(availability_status_backcountry, unk_availability_status_backcountry).

measured(s_tgr, availability_status_backcountry, available_sale).

all_consistent(availability_status_backcountry) :-
    (indep(s_tgr), consistent(s_tgr, availability_status_backcountry) ; \+indep(s_tgr)).

evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, available_sale)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values listed_2024=Listed_for_2024 unk_availability_status=Unknown
% @importance 0.9

0.88::acc(s1, availability_status).

0.81::true_val(availability_status, listed_2024); 0.19::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, listed_2024).

all_consistent(availability_status) :-
    (indep(s1), consistent(s1, availability_status) ; \+indep(s1)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, listed_2024)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed=Listed unk_availability_status_amazon=Unknown
% @importance 0.5

0.78::acc(s39, availability_status_amazon).

0.53::true_val(availability_status_amazon, listed); 0.47::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s39, availability_status_amazon, listed).

all_consistent(availability_status_amazon) :-
    (indep(s39), consistent(s39, availability_status_amazon) ; \+indep(s39)).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, listed)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr availability_status_burton
% @type categorical
% @canonical false
% @original_name availability_status
% @values page_exists_2nd_quality=2024_page_exists_2025_sold_out unk_availability_status_burton=Unknown
% @importance 0.5

0.90::acc(s3, availability_status_burton).

0.70::true_val(availability_status_burton, page_exists_2nd_quality); 0.30::true_val(availability_status_burton, unk_availability_status_burton).

measured(s3, availability_status_burton, page_exists_2nd_quality).

all_consistent(availability_status_burton) :-
    consistent(s3, availability_status_burton).

evidence(all_consistent(availability_status_burton)).
query(true_val(availability_status_burton, page_exists_2nd_quality)).
query(true_val(availability_status_burton, unk_availability_status_burton)).

% @attr availability_status_steep_cheap
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed=Listed unk_availability_status_steep_cheap=Unknown
% @importance 0.5

0.80::acc(s24, availability_status_steep_cheap).

0.68::true_val(availability_status_steep_cheap, listed); 0.32::true_val(availability_status_steep_cheap, unk_availability_status_steep_cheap).

measured(s24, availability_status_steep_cheap, listed).

all_consistent(availability_status_steep_cheap) :-
    (indep(s24), consistent(s24, availability_status_steep_cheap) ; \+indep(s24)).

evidence(all_consistent(availability_status_steep_cheap)).
query(true_val(availability_status_steep_cheap, listed)).
query(true_val(availability_status_steep_cheap, unk_availability_status_steep_cheap)).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed=Listed unk_availability_status_skipro=Unknown
% @importance 0.5

0.72::acc(s7, availability_status_skipro).

0.55::true_val(availability_status_skipro, listed); 0.45::true_val(availability_status_skipro, unk_availability_status_skipro).

measured(s7, availability_status_skipro, listed).

all_consistent(availability_status_skipro) :-
    (indep(s7), consistent(s7, availability_status_skipro) ; \+indep(s7)).

evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, listed)).
query(true_val(availability_status_skipro, unk_availability_status_skipro)).

% @attr availability_status_valsurf
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed=Listed unk_availability_status_valsurf=Unknown
% @importance 0.7

0.78::acc(s5, availability_status_valsurf).

0.63::true_val(availability_status_valsurf, listed); 0.37::true_val(availability_status_valsurf, unk_availability_status_valsurf).

measured(s5, availability_status_valsurf, listed).

all_consistent(availability_status_valsurf) :-
    (indep(s5), consistent(s5, availability_status_valsurf) ; \+indep(s5)).

evidence(all_consistent(availability_status_valsurf)).
query(true_val(availability_status_valsurf, listed)).
query(true_val(availability_status_valsurf, unk_availability_status_valsurf)).

% @attr availability_status_winterwomen
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed=Listed unk_availability_status_winterwomen=Unknown
% @importance 0.4

0.72::acc(s8, availability_status_winterwomen).

0.52::true_val(availability_status_winterwomen, listed); 0.48::true_val(availability_status_winterwomen, unk_availability_status_winterwomen).

measured(s8, availability_status_winterwomen, listed).

all_consistent(availability_status_winterwomen) :-
    (indep(s8), consistent(s8, availability_status_winterwomen) ; \+indep(s8)).

evidence(all_consistent(availability_status_winterwomen)).
query(true_val(availability_status_winterwomen, listed)).
query(true_val(availability_status_winterwomen, unk_availability_status_winterwomen)).

% @attr availability_status_rudeboys
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed=Listed unk_availability_status_rudeboys=Unknown
% @importance 0.4

0.68::acc(s2, availability_status_rudeboys).

0.48::true_val(availability_status_rudeboys, listed); 0.52::true_val(availability_status_rudeboys, unk_availability_status_rudeboys).

measured(s2, availability_status_rudeboys, listed).

all_consistent(availability_status_rudeboys) :-
    consistent(s2, availability_status_rudeboys).

evidence(all_consistent(availability_status_rudeboys)).
query(true_val(availability_status_rudeboys, listed)).
query(true_val(availability_status_rudeboys, unk_availability_status_rudeboys)).

% @attr availability_status_saltypeaks
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed=Listed unk_availability_status_saltypeaks=Unknown
% @importance 0.55

0.76::acc(s28, availability_status_saltypeaks).

0.62::true_val(availability_status_saltypeaks, listed); 0.38::true_val(availability_status_saltypeaks, unk_availability_status_saltypeaks).

measured(s28, availability_status_saltypeaks, listed).

all_consistent(availability_status_saltypeaks) :-
    (indep(s28), consistent(s28, availability_status_saltypeaks) ; \+indep(s28)).

evidence(all_consistent(availability_status_saltypeaks)).
query(true_val(availability_status_saltypeaks, listed)).
query(true_val(availability_status_saltypeaks, unk_availability_status_saltypeaks)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2023=Listed_2023_model unk_availability_status_blauer=Unknown
% @importance 0.5

0.70::acc(s54, availability_status_blauer).

0.51::true_val(availability_status_blauer, listed_2023); 0.49::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s54, availability_status_blauer, listed_2023).

all_consistent(availability_status_blauer) :-
    (indep(s54), consistent(s54, availability_status_blauer) ; \+indep(s54)).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, listed_2023)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_buckmans
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed=Listed unk_availability_status_buckmans=Unknown
% @importance 0.75

0.78::acc(s92, availability_status_buckmans).

0.55::true_val(availability_status_buckmans, listed); 0.45::true_val(availability_status_buckmans, unk_availability_status_buckmans).

measured(s92, availability_status_buckmans, listed).

all_consistent(availability_status_buckmans) :-
    (indep(s92), consistent(s92, availability_status_buckmans) ; \+indep(s92)).

evidence(all_consistent(availability_status_buckmans)).
query(true_val(availability_status_buckmans, listed)).
query(true_val(availability_status_buckmans, unk_availability_status_buckmans)).

% @attr availability_status_shoreline
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2025=Listed_as_2025_model unk_availability_status_shoreline=Unknown
% @importance 0.75

0.78::acc(s30, availability_status_shoreline).

0.62::true_val(availability_status_shoreline, listed_2025); 0.38::true_val(availability_status_shoreline, unk_availability_status_shoreline).

measured(s30, availability_status_shoreline, listed_2025).

all_consistent(availability_status_shoreline) :-
    (indep(s30), consistent(s30, availability_status_shoreline) ; \+indep(s30)).

evidence(all_consistent(availability_status_shoreline)).
query(true_val(availability_status_shoreline, listed_2025)).
query(true_val(availability_status_shoreline, unk_availability_status_shoreline)).

% @attr availability_status_prfo
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_cad_439_99=Listed_CAD_439_99 unk_availability_status_prfo=Unknown
% @importance 0.85

0.82::acc(s_tgr, availability_status_prfo).

0.74::true_val(availability_status_prfo, listed_cad_439_99); 0.26::true_val(availability_status_prfo, unk_availability_status_prfo).

measured(s_tgr, availability_status_prfo, listed_cad_439_99).

all_consistent(availability_status_prfo) :-
    (indep(s_tgr), consistent(s_tgr, availability_status_prfo) ; \+indep(s_tgr)).

evidence(all_consistent(availability_status_prfo)).
query(true_val(availability_status_prfo, listed_cad_439_99)).
query(true_val(availability_status_prfo, unk_availability_status_prfo)).

% @attr availability_status_burton_ca
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_cad_879_99=Listed_CAD_879_99 unk_availability_status_burton_ca=Unknown
% @importance 0.85

0.82::acc(s_tgr, availability_status_burton_ca).

0.74::true_val(availability_status_burton_ca, listed_cad_879_99); 0.26::true_val(availability_status_burton_ca, unk_availability_status_burton_ca).

measured(s_tgr, availability_status_burton_ca, listed_cad_879_99).

all_consistent(availability_status_burton_ca) :-
    (indep(s_tgr), consistent(s_tgr, availability_status_burton_ca) ; \+indep(s_tgr)).

evidence(all_consistent(availability_status_burton_ca)).
query(true_val(availability_status_burton_ca, listed_cad_879_99)).
query(true_val(availability_status_burton_ca, unk_availability_status_burton_ca)).

% @attr availability_status_snowcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values out_of_stock=Out_of_stock_discontinued unk_availability_status_snowcountry=Unknown
% @importance 0.65

0.85::acc(s14, availability_status_snowcountry).

0.67::true_val(availability_status_snowcountry, out_of_stock); 0.33::true_val(availability_status_snowcountry, unk_availability_status_snowcountry).

measured(s14, availability_status_snowcountry, out_of_stock).

all_consistent(availability_status_snowcountry) :-
    (indep(s14), consistent(s14, availability_status_snowcountry) ; \+indep(s14)).

evidence(all_consistent(availability_status_snowcountry)).
query(true_val(availability_status_snowcountry, out_of_stock)).
query(true_val(availability_status_snowcountry, unk_availability_status_snowcountry)).

% @attr shipping_restriction_merchant
% @type categorical
% @canonical false
% @original_name Shipping restriction (merchant)
% @values australia_only=Only_ships_within_Australia unk_shipping_restriction_merchant=Unknown
% @importance 0.85

0.93::acc(s_merchant, shipping_restriction_merchant).

0.95::true_val(shipping_restriction_merchant, australia_only); 0.05::true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant).

measured(s_merchant, shipping_restriction_merchant, australia_only).

all_consistent(shipping_restriction_merchant) :-
    (indep(s_merchant), consistent(s_merchant, shipping_restriction_merchant) ; \+indep(s_merchant)).

evidence(all_consistent(shipping_restriction_merchant)).
query(true_val(shipping_restriction_merchant, australia_only)).
query(true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant)).

% @attr burton_rentals_resale
% @type categorical
% @canonical false
% @original_name Burton Rentals & Resale
% @values available_rental=Available_through_Burton_Rentals unk_burton_rentals_resale=Unknown
% @importance 0.3

0.85::acc(s20, burton_rentals_resale).

0.76::true_val(burton_rentals_resale, available_rental); 0.24::true_val(burton_rentals_resale, unk_burton_rentals_resale).

measured(s20, burton_rentals_resale, available_rental).

all_consistent(burton_rentals_resale) :-
    consistent(s20, burton_rentals_resale).

evidence(all_consistent(burton_rentals_resale)).
query(true_val(burton_rentals_resale, available_rental)).
query(true_val(burton_rentals_resale, unk_burton_rentals_resale)).

% @attr burton_trade_in_program
% @type categorical
% @canonical false
% @original_name Burton trade-in program
% @values accepts_2013_plus=Accepts_gently_used_2013_plus unk_burton_trade_in_program=Unknown
% @importance 0.3

0.85::acc(s20, burton_trade_in_program).

0.76::true_val(burton_trade_in_program, accepts_2013_plus); 0.24::true_val(burton_trade_in_program, unk_burton_trade_in_program).

measured(s20, burton_trade_in_program, accepts_2013_plus).

all_consistent(burton_trade_in_program) :-
    consistent(s20, burton_trade_in_program).

evidence(all_consistent(burton_trade_in_program)).
query(true_val(burton_trade_in_program, accepts_2013_plus)).
query(true_val(burton_trade_in_program, unk_burton_trade_in_program)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values burton_3d_fish=Burton_3D_Fish unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.85::acc(s_tgr, comparable_board_same_brand).
0.78::acc(s45, comparable_board_same_brand).

0.82::true_val(comparable_board_same_brand, burton_3d_fish); 0.18::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s_tgr, comparable_board_same_brand, burton_3d_fish).
measured(s45, comparable_board_same_brand, burton_3d_fish).

all_consistent(comparable_board_same_brand) :-
    (indep(s_tgr), consistent(s_tgr, comparable_board_same_brand) ; \+indep(s_tgr)),
    (indep(s45), consistent(s45, comparable_board_same_brand) ; \+indep(s45)).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, burton_3d_fish)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_sb_powder_glider=Capita_Spring_Break_158_Powder_Glider unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.82::acc(s_tgr, comparable_board_cross_brand).

0.74::true_val(comparable_board_cross_brand, capita_sb_powder_glider); 0.26::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s_tgr, comparable_board_cross_brand, capita_sb_powder_glider).

all_consistent(comparable_board_cross_brand) :-
    (indep(s_tgr), consistent(s_tgr, comparable_board_cross_brand) ; \+indep(s_tgr)).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_sb_powder_glider)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_sb_tree_hunter=Capita_Spring_Break_161_Tree_Hunter unk_comparable_board_cross_brand_2=Unknown
% @importance 0.85

0.82::acc(s_tgr, comparable_board_cross_brand_2).

0.74::true_val(comparable_board_cross_brand_2, capita_sb_tree_hunter); 0.26::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).

measured(s_tgr, comparable_board_cross_brand_2, capita_sb_tree_hunter).

all_consistent(comparable_board_cross_brand_2) :-
    (indep(s_tgr), consistent(s_tgr, comparable_board_cross_brand_2) ; \+indep(s_tgr)).

evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, capita_sb_tree_hunter)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

% @attr comparable_board_cross_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values soul_blower=Soul_Blower unk_comparable_board_cross_brand_3=Unknown
% @importance 0.85

0.82::acc(s_tgr, comparable_board_cross_brand_3).

0.74::true_val(comparable_board_cross_brand_3, soul_blower); 0.26::true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3).

measured(s_tgr, comparable_board_cross_brand_3, soul_blower).

all_consistent(comparable_board_cross_brand_3) :-
    (indep(s_tgr), consistent(s_tgr, comparable_board_cross_brand_3) ; \+indep(s_tgr)).

evidence(all_consistent(comparable_board_cross_brand_3)).
query(true_val(comparable_board_cross_brand_3, soul_blower)).
query(true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3)).

% @attr comparable_board_cross_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values arbor_satori_capita_racers=Arbor_Satori_Capita_Powder_Racers unk_comparable_board_cross_brand_4=Unknown
% @importance 0.85

0.82::acc(s_tgr, comparable_board_cross_brand_4).

0.74::true_val(comparable_board_cross_brand_4, arbor_satori_capita_racers); 0.26::true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4).

measured(s_tgr, comparable_board_cross_brand_4, arbor_satori_capita_racers).

all_consistent(comparable_board_cross_brand_4) :-
    (indep(s_tgr), consistent(s_tgr, comparable_board_cross_brand_4) ; \+indep(s_tgr)).

evidence(all_consistent(comparable_board_cross_brand_4)).
query(true_val(comparable_board_cross_brand_4, arbor_satori_capita_racers)).
query(true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4)).

% @attr comparable_board_cross_brand_5
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_sc_orca_me_nitro_k2=Jones_Storm_Chaser_Orca_Mind_Expander_Nitro_K2 unk_comparable_board_cross_brand_5=Unknown
% @importance 0.7

0.70::acc(s68, comparable_board_cross_brand_5).
0.65::acc(s64, comparable_board_cross_brand_5).

0.55::true_val(comparable_board_cross_brand_5, jones_sc_orca_me_nitro_k2); 0.45::true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5).

measured(s68, comparable_board_cross_brand_5, jones_sc_orca_me_nitro_k2).
measured(s64, comparable_board_cross_brand_5, jones_sc_orca_me_nitro_k2).

all_consistent(comparable_board_cross_brand_5) :-
    (indep(s68), consistent(s68, comparable_board_cross_brand_5) ; \+indep(s68)),
    (indep(s64), consistent(s64, comparable_board_cross_brand_5) ; \+indep(s64)).

evidence(all_consistent(comparable_board_cross_brand_5)).
query(true_val(comparable_board_cross_brand_5, jones_sc_orca_me_nitro_k2)).
query(true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5)).

% @attr comparable_board_cross_brand_6
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values us_deep_reach=United_Shapes_Deep_Reach unk_comparable_board_cross_brand_6=Unknown
% @importance 0.8

0.72::acc(s67, comparable_board_cross_brand_6).

0.35::true_val(comparable_board_cross_brand_6, us_deep_reach); 0.65::true_val(comparable_board_cross_brand_6, unk_comparable_board_cross_brand_6).

measured(s67, comparable_board_cross_brand_6, us_deep_reach).

all_consistent(comparable_board_cross_brand_6) :-
    (indep(s67), consistent(s67, comparable_board_cross_brand_6) ; \+indep(s67)).

evidence(all_consistent(comparable_board_cross_brand_6)).
query(true_val(comparable_board_cross_brand_6, us_deep_reach)).
query(true_val(comparable_board_cross_brand_6, unk_comparable_board_cross_brand_6)).

% @attr comparable_board_same_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values burton_deep_thinker=Burton_Deep_Thinker unk_comparable_board_same_brand_2=Unknown
% @importance 0.7

0.70::acc(s64, comparable_board_same_brand_2).

0.33::true_val(comparable_board_same_brand_2, burton_deep_thinker); 0.67::true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2).

measured(s64, comparable_board_same_brand_2, burton_deep_thinker).

all_consistent(comparable_board_same_brand_2) :-
    (indep(s64), consistent(s64, comparable_board_same_brand_2) ; \+indep(s64)).

evidence(all_consistent(comparable_board_same_brand_2)).
query(true_val(comparable_board_same_brand_2, burton_deep_thinker)).
query(true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder=Powder unk_terrain_suitability=Unknown
% @importance 0.875

0.88::acc(s4, terrain_suitability).
0.85::acc(s_sp, terrain_suitability).

0.92::true_val(terrain_suitability, powder); 0.08::true_val(terrain_suitability, unk_terrain_suitability).

measured(s4, terrain_suitability, powder).
measured(s_sp, terrain_suitability, powder).

all_consistent(terrain_suitability) :-
    (indep(s4), consistent(s4, terrain_suitability) ; \+indep(s4)),
    (indep(s_sp), consistent(s_sp, terrain_suitability) ; \+indep(s_sp)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_freeride
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values freeride=Freeride unk_terrain_suitability_freeride=Unknown
% @importance 0.85

0.88::acc(s4, terrain_suitability_freeride).

0.77::true_val(terrain_suitability_freeride, freeride); 0.23::true_val(terrain_suitability_freeride, unk_terrain_suitability_freeride).

measured(s4, terrain_suitability_freeride, freeride).

all_consistent(terrain_suitability_freeride) :-
    (indep(s4), consistent(s4, terrain_suitability_freeride) ; \+indep(s4)).

evidence(all_consistent(terrain_suitability_freeride)).
query(true_val(terrain_suitability_freeride, freeride)).
query(true_val(terrain_suitability_freeride, unk_terrain_suitability_freeride)).

% @attr terrain_suitability_detailed
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values deep_powder_bc_offpiste_trees=Deep_powder_backcountry_offpiste_trees unk_terrain_suitability_detailed=Unknown
% @importance 0.85

0.85::acc(s4, terrain_suitability_detailed).
0.78::acc(s45, terrain_suitability_detailed).

0.82::true_val(terrain_suitability_detailed, deep_powder_bc_offpiste_trees); 0.18::true_val(terrain_suitability_detailed, unk_terrain_suitability_detailed).

measured(s4, terrain_suitability_detailed, deep_powder_bc_offpiste_trees).
measured(s45, terrain_suitability_detailed, deep_powder_bc_offpiste_trees).

all_consistent(terrain_suitability_detailed) :-
    (indep(s4), consistent(s4, terrain_suitability_detailed) ; \+indep(s4)),
    (indep(s45), consistent(s45, terrain_suitability_detailed) ; \+indep(s45)).

evidence(all_consistent(terrain_suitability_detailed)).
query(true_val(terrain_suitability_detailed, deep_powder_bc_offpiste_trees)).
query(true_val(terrain_suitability_detailed, unk_terrain_suitability_detailed)).

% @attr terrain_suitability_subjective
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values deep_powder_days_dream=Deep_powder_days_dream_to_ride unk_terrain_suitability_subjective=Unknown
% @importance 0.85

0.82::acc(s_sp, terrain_suitability_subjective).

0.69::true_val(terrain_suitability_subjective, deep_powder_days_dream); 0.31::true_val(terrain_suitability_subjective, unk_terrain_suitability_subjective).

measured(s_sp, terrain_suitability_subjective, deep_powder_days_dream).

all_consistent(terrain_suitability_subjective) :-
    (indep(s_sp), consistent(s_sp, terrain_suitability_subjective) ; \+indep(s_sp)).

evidence(all_consistent(terrain_suitability_subjective)).
query(true_val(terrain_suitability_subjective, deep_powder_days_dream)).
query(true_val(terrain_suitability_subjective, unk_terrain_suitability_subjective)).

% @attr use_case
% @type categorical
% @canonical false
% @original_name Use case
% @values quiver_board_powder=Quiver_board_for_powder_days unk_use_case=Unknown
% @importance 0.85

0.82::acc(s_sp, use_case).

0.69::true_val(use_case, quiver_board_powder); 0.31::true_val(use_case, unk_use_case).

measured(s_sp, use_case, quiver_board_powder).

all_consistent(use_case) :-
    (indep(s_sp), consistent(s_sp, use_case) ; \+indep(s_sp)).

evidence(all_consistent(use_case)).
query(true_val(use_case, quiver_board_powder)).
query(true_val(use_case, unk_use_case)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values surf_inspired_powder=Surf_inspired_powder_float_slash_carve unk_riding_style=Unknown
% @importance 0.7

0.80::acc(s5, riding_style).

0.63::true_val(riding_style, surf_inspired_powder); 0.37::true_val(riding_style, unk_riding_style).

measured(s5, riding_style, surf_inspired_powder).

all_consistent(riding_style) :-
    (indep(s5), consistent(s5, riding_style) ; \+indep(s5)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, surf_inspired_powder)).
query(true_val(riding_style, unk_riding_style)).

% @attr reviewer_opinion_tgr_test_terrain
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values canadian_rockies_trees_pillows=Canadian_Rockies_tight_trees_pillows_alpine unk_reviewer_opinion_tgr_test_terrain=Unknown
% @importance 0.85

0.82::acc(s45, reviewer_opinion_tgr_test_terrain).

0.40::true_val(reviewer_opinion_tgr_test_terrain, canadian_rockies_trees_pillows); 0.60::true_val(reviewer_opinion_tgr_test_terrain, unk_reviewer_opinion_tgr_test_terrain).

measured(s45, reviewer_opinion_tgr_test_terrain, canadian_rockies_trees_pillows).

all_consistent(reviewer_opinion_tgr_test_terrain) :-
    (indep(s45), consistent(s45, reviewer_opinion_tgr_test_terrain) ; \+indep(s45)).

evidence(all_consistent(reviewer_opinion_tgr_test_terrain)).
query(true_val(reviewer_opinion_tgr_test_terrain, canadian_rockies_trees_pillows)).
query(true_val(reviewer_opinion_tgr_test_terrain, unk_reviewer_opinion_tgr_test_terrain)).

% @attr reviewer_opinion_tgr_test_resort
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values northstar_palisades_tahoe=Northstar_and_Palisades_Tahoe unk_reviewer_opinion_tgr_test_resort=Unknown
% @importance 0.85

0.82::acc(s45, reviewer_opinion_tgr_test_resort).

0.40::true_val(reviewer_opinion_tgr_test_resort, northstar_palisades_tahoe); 0.60::true_val(reviewer_opinion_tgr_test_resort, unk_reviewer_opinion_tgr_test_resort).

measured(s45, reviewer_opinion_tgr_test_resort, northstar_palisades_tahoe).

all_consistent(reviewer_opinion_tgr_test_resort) :-
    (indep(s45), consistent(s45, reviewer_opinion_tgr_test_resort) ; \+indep(s45)).

evidence(all_consistent(reviewer_opinion_tgr_test_resort)).
query(true_val(reviewer_opinion_tgr_test_resort, northstar_palisades_tahoe)).
query(true_val(reviewer_opinion_tgr_test_resort, unk_reviewer_opinion_tgr_test_resort)).

% @attr sustainability_certification_super_sap
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values super_sap_bio_epoxy=Super_Sap_bio_epoxy_50pct_reduced_carbon unk_sustainability_certification_super_sap=Unknown
% @importance 0.6

0.88::acc(s14, sustainability_certification_super_sap).

0.67::true_val(sustainability_certification_super_sap, super_sap_bio_epoxy); 0.33::true_val(sustainability_certification_super_sap, unk_sustainability_certification_super_sap).

measured(s14, sustainability_certification_super_sap, super_sap_bio_epoxy).

all_consistent(sustainability_certification_super_sap) :-
    (indep(s14), consistent(s14, sustainability_certification_super_sap) ; \+indep(s14)).

evidence(all_consistent(sustainability_certification_super_sap)).
query(true_val(sustainability_certification_super_sap, super_sap_bio_epoxy)).
query(true_val(sustainability_certification_super_sap, unk_sustainability_certification_super_sap)).

% @attr sustainability_certification_recycled_abs
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_abs=Recycled_ABS_material unk_sustainability_certification_recycled_abs=Unknown
% @importance 0.6

0.88::acc(s14, sustainability_certification_recycled_abs).

0.67::true_val(sustainability_certification_recycled_abs, recycled_abs); 0.33::true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs).

measured(s14, sustainability_certification_recycled_abs, recycled_abs).

all_consistent(sustainability_certification_recycled_abs) :-
    (indep(s14), consistent(s14, sustainability_certification_recycled_abs) ; \+indep(s14)).

evidence(all_consistent(sustainability_certification_recycled_abs)).
query(true_val(sustainability_certification_recycled_abs, recycled_abs)).
query(true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs)).

% @attr sku_merchant
% @type categorical
% @canonical false
% @original_name SKU (merchant)
% @values sku_22248103000_149=22248103000_149 unk_sku_merchant=Unknown
% @importance 0.85

0.95::acc(s_merchant, sku_merchant).

0.95::true_val(sku_merchant, sku_22248103000_149); 0.05::true_val(sku_merchant, unk_sku_merchant).

measured(s_merchant, sku_merchant, sku_22248103000_149).

all_consistent(sku_merchant) :-
    (indep(s_merchant), consistent(s_merchant, sku_merchant) ; \+indep(s_merchant)).

evidence(all_consistent(sku_merchant)).
query(true_val(sku_merchant, sku_22248103000_149)).
query(true_val(sku_merchant, unk_sku_merchant)).

% @attr reference_stance_angles
% @type categorical
% @canonical false
% @original_name Reference stance angles (forum rider)
% @values pos15_neg5=plus15_minus5 unk_reference_stance_angles=Unknown
% @importance 0.85

0.75::acc(s45, reference_stance_angles).

0.40::true_val(reference_stance_angles, pos15_neg5); 0.60::true_val(reference_stance_angles, unk_reference_stance_angles).

measured(s45, reference_stance_angles, pos15_neg5).

all_consistent(reference_stance_angles) :-
    (indep(s45), consistent(s45, reference_stance_angles) ; \+indep(s45)).

evidence(all_consistent(reference_stance_angles)).
query(true_val(reference_stance_angles, pos15_neg5)).
query(true_val(reference_stance_angles, unk_reference_stance_angles)).

% @attr no_swallowtail
% @type categorical
% @canonical false
% @original_name Board does not have a swallowtail
% @values no_swallowtail_3d_channels=No_swallowtail_uses_3D_channels unk_no_swallowtail=Unknown
% @importance 0.55

0.80::acc(s28, no_swallowtail).

0.62::true_val(no_swallowtail, no_swallowtail_3d_channels); 0.38::true_val(no_swallowtail, unk_no_swallowtail).

measured(s28, no_swallowtail, no_swallowtail_3d_channels).

all_consistent(no_swallowtail) :-
    (indep(s28), consistent(s28, no_swallowtail) ; \+indep(s28)).

evidence(all_consistent(no_swallowtail)).
query(true_val(no_swallowtail, no_swallowtail_3d_channels)).
query(true_val(no_swallowtail, unk_no_swallowtail)).

% @attr three_d_channels
% @type categorical
% @canonical false
% @original_name 3D channels
% @values five_channels_tail_fins=5_channels_on_tail_like_fins unk_three_d_channels=Unknown
% @importance 0.85

0.85::acc(s_tgr, three_d_channels).

0.74::true_val(three_d_channels, five_channels_tail_fins); 0.26::true_val(three_d_channels, unk_three_d_channels).

measured(s_tgr, three_d_channels, five_channels_tail_fins).

all_consistent(three_d_channels) :-
    (indep(s_tgr), consistent(s_tgr, three_d_channels) ; \+indep(s_tgr)).

evidence(all_consistent(three_d_channels)).
query(true_val(three_d_channels, five_channels_tail_fins)).
query(true_val(three_d_channels, unk_three_d_channels)).

% @attr same_profile_as_3d_fish
% @type categorical
% @canonical false
% @original_name Same profile as 3D Fish
% @values same_flat_to_rocker=Same_flat_to_rocker_as_3D_Fish unk_same_profile_as_3d_fish=Unknown
% @importance 0.85

0.85::acc(s_tgr, same_profile_as_3d_fish).

0.74::true_val(same_profile_as_3d_fish, same_flat_to_rocker); 0.26::true_val(same_profile_as_3d_fish, unk_same_profile_as_3d_fish).

measured(s_tgr, same_profile_as_3d_fish, same_flat_to_rocker).

all_consistent(same_profile_as_3d_fish) :-
    (indep(s_tgr), consistent(s_tgr, same_profile_as_3d_fish) ; \+indep(s_tgr)).

evidence(all_consistent(same_profile_as_3d_fish)).
query(true_val(same_profile_as_3d_fish, same_flat_to_rocker)).
query(true_val(same_profile_as_3d_fish, unk_same_profile_as_3d_fish)).

% @attr board_development_process
% @type categorical
% @canonical false
% @original_name Board development process
% @values team_riders_prototypes=Developed_with_team_riders_extensive_prototypes unk_board_development_process=Unknown
% @importance 0.7

0.80::acc(s5, board_development_process).

0.63::true_val(board_development_process, team_riders_prototypes); 0.37::true_val(board_development_process, unk_board_development_process).

measured(s5, board_development_process, team_riders_prototypes).

all_consistent(board_development_process) :-
    (indep(s5), consistent(s5, board_development_process) ; \+indep(s5)).

evidence(all_consistent(board_development_process)).
query(true_val(board_development_process, team_riders_prototypes)).
query(true_val(board_development_process, unk_board_development_process)).