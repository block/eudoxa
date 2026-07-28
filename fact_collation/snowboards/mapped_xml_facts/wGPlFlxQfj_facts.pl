0.15::indep(s23).
0.15::indep(s29).
0.15::indep(s31).
0.25::indep(s32).
0.15::indep(s33).
0.15::indep(s34).
0.15::indep(s35).
0.15::indep(s36).
0.15::indep(s37).
0.15::indep(s38).
0.20::indep(s_merchant_derived).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.93::acc(s1, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values k2=K2 unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, k2); 0.05::true_val(brand, unk_brand).

measured(s1, brand, k2).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, k2)).
query(true_val(brand, unk_brand)).

0.93::acc(s1, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values geometric=Geometric unk_model_name=Unknown
% @importance 1.0

0.95::true_val(model_name, geometric); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, geometric).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, geometric)).
query(true_val(model_name, unk_model_name)).

0.93::acc(s1, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2024=2024 unk_model_year=Unknown
% @importance 1.0

0.95::true_val(model_year, y2024); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2024).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2024)).
query(true_val(model_year, unk_model_year)).

0.93::acc(s1, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values mens_freestyle_snowboard=Mens_freestyle_snowboard unk_product_type=Unknown
% @importance 1.0

0.95::true_val(product_type, mens_freestyle_snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, mens_freestyle_snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, mens_freestyle_snowboard)).
query(true_val(product_type, unk_product_type)).

0.70::acc(s2, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2022=2022_replacing_K2_WWW unk_model_first_available_year=Unknown
% @importance 0.5

0.68::true_val(model_first_available_year, y2022); 0.32::true_val(model_first_available_year, unk_model_first_available_year).

measured(s2, model_first_available_year, y2022).

all_consistent(model_first_available_year) :- consistent(s2, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2022)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.78::acc(s3, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values k2_sports_llc=K2_Sports_LLC_Seattle_WA unk_manufacturer=Unknown
% @importance 0.5

0.76::true_val(manufacturer, k2_sports_llc); 0.24::true_val(manufacturer, unk_manufacturer).

measured(s3, manufacturer, k2_sports_llc).

all_consistent(manufacturer) :- consistent(s3, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, k2_sports_llc)).
query(true_val(manufacturer, unk_manufacturer)).

0.78::acc(s4, parent_company).
0.78::acc(s5, parent_company).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values elevate_outdoor_kohlberg=Elevate_Outdoor_Collective_Kohlberg unk_parent_company=Unknown
% @importance 0.325

0.95::true_val(parent_company, elevate_outdoor_kohlberg); 0.05::true_val(parent_company, unk_parent_company).

measured(s4, parent_company, elevate_outdoor_kohlberg).
measured(s5, parent_company, elevate_outdoor_kohlberg).

all_consistent(parent_company) :- consistent(s4, parent_company), consistent(s5, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, elevate_outdoor_kohlberg)).
query(true_val(parent_company, unk_parent_company)).

0.78::acc(s3, k2_brand_founded).

% @attr k2_brand_founded
% @type categorical
% @canonical false
% @original_name K2 brand founded
% @values y1962_vashon=1962_Vashon_Island_WA unk_k2_brand_founded=Unknown
% @importance 0.5

0.76::true_val(k2_brand_founded, y1962_vashon); 0.24::true_val(k2_brand_founded, unk_k2_brand_founded).

measured(s3, k2_brand_founded, y1962_vashon).

all_consistent(k2_brand_founded) :- consistent(s3, k2_brand_founded).

evidence(all_consistent(k2_brand_founded)).
query(true_val(k2_brand_founded, y1962_vashon)).
query(true_val(k2_brand_founded, unk_k2_brand_founded)).

0.68::acc(s6, k2_snowboard_division_founded).

% @attr k2_snowboard_division_founded
% @type categorical
% @canonical false
% @original_name K2 snowboard division founded
% @values y1987=1987 unk_k2_snowboard_division_founded=Unknown
% @importance 0.4

0.68::true_val(k2_snowboard_division_founded, y1987); 0.32::true_val(k2_snowboard_division_founded, unk_k2_snowboard_division_founded).

measured(s6, k2_snowboard_division_founded, y1987).

all_consistent(k2_snowboard_division_founded) :- consistent(s6, k2_snowboard_division_founded).

evidence(all_consistent(k2_snowboard_division_founded)).
query(true_val(k2_snowboard_division_founded, y1987)).
query(true_val(k2_snowboard_division_founded, unk_k2_snowboard_division_founded)).

0.78::acc(s7, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values china_guangdong_2001=China_Guangdong_since_2001 unk_manufacturing_location=Unknown
% @importance 0.5

0.76::true_val(manufacturing_location, china_guangdong_2001); 0.24::true_val(manufacturing_location, unk_manufacturing_location).

measured(s7, manufacturing_location, china_guangdong_2001).

all_consistent(manufacturing_location) :- consistent(s7, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, china_guangdong_2001)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.66::acc(s8, manufacturing_location_current).

% @attr manufacturing_location_current
% @type categorical
% @canonical false
% @original_name manufacturing_location_current
% @values weihai_china=Weihai_northern_China unk_manufacturing_location_current=Unknown
% @importance 0.35

0.64::true_val(manufacturing_location_current, weihai_china); 0.36::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s8, manufacturing_location_current, weihai_china).

all_consistent(manufacturing_location_current) :- consistent(s8, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, weihai_china)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

0.62::acc(s9, board_tagline).

% @attr board_tagline
% @type categorical
% @canonical false
% @original_name Board tagline
% @values entry_level_freestyle_clean=Entry_Level_Freestyle_with_a_Clean_Approach unk_board_tagline=Unknown
% @importance 0.2

0.62::true_val(board_tagline, entry_level_freestyle_clean); 0.38::true_val(board_tagline, unk_board_tagline).

measured(s9, board_tagline, entry_level_freestyle_clean).

all_consistent(board_tagline) :- consistent(s9, board_tagline).

evidence(all_consistent(board_tagline)).
query(true_val(board_tagline, entry_level_freestyle_clean)).
query(true_val(board_tagline, unk_board_tagline)).

0.45::acc(s10, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.6

0.45::true_val(gender, mens); 0.55::true_val(gender, unk_gender).

measured(s10, gender, mens).

all_consistent(gender) :- consistent(s10, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.52::acc(s11, successor_model).

% @attr successor_model
% @type categorical
% @canonical false
% @original_name Successor model
% @values geometric_2025=K2_Geometric_2025_similar_construction unk_successor_model=Unknown
% @importance 0.8

0.51::true_val(successor_model, geometric_2025); 0.49::true_val(successor_model, unk_successor_model).

measured(s11, successor_model, geometric_2025).

all_consistent(successor_model) :- consistent(s11, successor_model).

evidence(all_consistent(successor_model)).
query(true_val(successor_model, geometric_2025)).
query(true_val(successor_model, unk_successor_model)).

0.70::acc(s12, predecessor_model_name).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values k2_www=K2_WWW_World_Wide_Weapon unk_predecessor_model_name=Unknown
% @importance 0.4

0.68::true_val(predecessor_model_name, k2_www); 0.32::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s12, predecessor_model_name, k2_www).

all_consistent(predecessor_model_name) :- consistent(s12, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, k2_www)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

0.65::acc(s13, price_usd_msrp).
0.72::acc(s14, price_usd_msrp).
0.68::acc(s15, price_usd_msrp).
0.68::acc(s16, price_usd_msrp).
0.63::acc(s17, price_usd_msrp).
0.65::acc(s18, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v429_95=429.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.97::true_val(price_usd_msrp, v429_95); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s13, price_usd_msrp, v429_95).
measured(s14, price_usd_msrp, v429_95).
measured(s15, price_usd_msrp, v429_95).
measured(s16, price_usd_msrp, v429_95).
measured(s17, price_usd_msrp, v429_95).
measured(s18, price_usd_msrp, v429_95).

all_consistent(price_usd_msrp) :-
    consistent(s13, price_usd_msrp),
    consistent(s14, price_usd_msrp),
    consistent(s15, price_usd_msrp),
    consistent(s16, price_usd_msrp),
    consistent(s17, price_usd_msrp),
    consistent(s18, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v429_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.93::acc(s_merchant, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v455_99=455.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v455_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v455_99).

all_consistent(price_aud_merchant) :- consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v455_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.72::acc(s14, sale_price_milosport).

% @attr sale_price_milosport
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price at Milosport (USD)
% @values v300_00=300.0 unk_sale_price_milosport=Unknown
% @importance 0.9

0.71::true_val(sale_price_milosport, v300_00); 0.29::true_val(sale_price_milosport, unk_sale_price_milosport).

measured(s14, sale_price_milosport, v300_00).

all_consistent(sale_price_milosport) :- consistent(s14, sale_price_milosport).

evidence(all_consistent(sale_price_milosport)).
query(true_val(sale_price_milosport, v300_00)).
query(true_val(sale_price_milosport, unk_sale_price_milosport)).

0.68::acc(s15, sale_price_level_nine).

% @attr sale_price_level_nine
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price at Level Nine Sports (USD)
% @values v300_97=300.97 unk_sale_price_level_nine=Unknown
% @importance 0.9

0.67::true_val(sale_price_level_nine, v300_97); 0.33::true_val(sale_price_level_nine, unk_sale_price_level_nine).

measured(s15, sale_price_level_nine, v300_97).

all_consistent(sale_price_level_nine) :- consistent(s15, sale_price_level_nine).

evidence(all_consistent(sale_price_level_nine)).
query(true_val(sale_price_level_nine, v300_97)).
query(true_val(sale_price_level_nine, unk_sale_price_level_nine)).

0.68::acc(s16, sale_price_the_house).

% @attr sale_price_the_house
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price at The House (USD)
% @values v299_95=299.95 unk_sale_price_the_house=Unknown
% @importance 0.9

0.67::true_val(sale_price_the_house, v299_95); 0.33::true_val(sale_price_the_house, unk_sale_price_the_house).

measured(s16, sale_price_the_house, v299_95).

all_consistent(sale_price_the_house) :- consistent(s16, sale_price_the_house).

evidence(all_consistent(sale_price_the_house)).
query(true_val(sale_price_the_house, v299_95)).
query(true_val(sale_price_the_house, unk_sale_price_the_house)).

0.63::acc(s17, sale_price_ski_haus).

% @attr sale_price_ski_haus
% @type numeric
% @unit USD
% @canonical false
% @original_name Sale price at Ski Haus (USD)
% @values v300_97=300.97 unk_sale_price_ski_haus=Unknown
% @importance 0.9

0.62::true_val(sale_price_ski_haus, v300_97); 0.38::true_val(sale_price_ski_haus, unk_sale_price_ski_haus).

measured(s17, sale_price_ski_haus, v300_97).

all_consistent(sale_price_ski_haus) :- consistent(s17, sale_price_ski_haus).

evidence(all_consistent(sale_price_ski_haus)).
query(true_val(sale_price_ski_haus, v300_97)).
query(true_val(sale_price_ski_haus, unk_sale_price_ski_haus)).

0.62::acc(s18, price_usd_backcountry).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v279_47=279.47 unk_price_usd_backcountry=Unknown
% @importance 0.85

0.60::true_val(price_usd_backcountry, v279_47); 0.40::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s18, price_usd_backcountry, v279_47).

all_consistent(price_usd_backcountry) :- consistent(s18, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v279_47)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

0.52::acc(s19, price_eur_montaz).

% @attr price_eur_montaz
% @type numeric
% @unit EUR
% @canonical false
% @original_name Price at Montaz (EUR, 2025 model)
% @values v274_99=274.99 unk_price_eur_montaz=Unknown
% @importance 0.7

0.51::true_val(price_eur_montaz, v274_99); 0.49::true_val(price_eur_montaz, unk_price_eur_montaz).

measured(s19, price_eur_montaz, v274_99).

all_consistent(price_eur_montaz) :- consistent(s19, price_eur_montaz).

evidence(all_consistent(price_eur_montaz)).
query(true_val(price_eur_montaz, v274_99)).
query(true_val(price_eur_montaz, unk_price_eur_montaz)).

0.80::acc(s_merchant, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values widely_available=Widely_available_multiple_retailers unk_availability_status=Unknown
% @importance 0.85

0.95::true_val(availability_status, widely_available); 0.05::true_val(availability_status, unk_availability_status).

measured(s_merchant, availability_status, widely_available).

all_consistent(availability_status) :- consistent(s_merchant, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, widely_available)).
query(true_val(availability_status, unk_availability_status)).

0.65::acc(s13, availability_status_clearance).
0.72::acc(s14, availability_status_clearance).

% @attr availability_status_clearance
% @type categorical
% @canonical false
% @original_name availability_status
% @values on_clearance=2024_model_widely_on_clearance unk_availability_status_clearance=Unknown
% @importance 0.925

0.95::true_val(availability_status_clearance, on_clearance); 0.05::true_val(availability_status_clearance, unk_availability_status_clearance).

measured(s13, availability_status_clearance, on_clearance).
measured(s14, availability_status_clearance, on_clearance).

all_consistent(availability_status_clearance) :-
    consistent(s13, availability_status_clearance),
    consistent(s14, availability_status_clearance).

evidence(all_consistent(availability_status_clearance)).
query(true_val(availability_status_clearance, on_clearance)).
query(true_val(availability_status_clearance, unk_availability_status_clearance)).

0.65::acc(s20, available_sizes).
0.88::acc(s_merchant, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values seven_sizes=144_148_151W_152_154W_156_157W five_sizes=148_152_154W_156_157W
% @importance 0.85

0.55::true_val(available_sizes, seven_sizes); 0.45::true_val(available_sizes, five_sizes).

measured(s20, available_sizes, seven_sizes).
measured(s_merchant, available_sizes, five_sizes).

all_consistent(available_sizes) :-
    consistent(s20, available_sizes),
    consistent(s_merchant, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, seven_sizes)).
query(true_val(available_sizes, five_sizes)).

0.65::acc(s20, available_sizes_note).
0.88::acc(s_merchant, available_sizes_note).

% @attr available_sizes_note
% @type categorical
% @canonical false
% @original_name available_sizes
% @values note_144_151w_extra=144_and_151W_appear_in_multiple_US_retailers unk_available_sizes_note=Unknown
% @importance 0.85

0.80::true_val(available_sizes_note, note_144_151w_extra); 0.20::true_val(available_sizes_note, unk_available_sizes_note).

measured(s20, available_sizes_note, note_144_151w_extra).
measured(s_merchant, available_sizes_note, note_144_151w_extra).

all_consistent(available_sizes_note) :-
    consistent(s20, available_sizes_note),
    consistent(s_merchant, available_sizes_note).

evidence(all_consistent(available_sizes_note)).
query(true_val(available_sizes_note, note_144_151w_extra)).
query(true_val(available_sizes_note, unk_available_sizes_note)).

0.93::acc(s21, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 1.0

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).

measured(s21, shape, true_twin).

all_consistent(shape) :- consistent(s21, shape).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

0.93::acc(s21, shape_description).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape
% @values symmetrical_regular_switch=Completely_symmetrical_same_regular_and_switch unk_shape_description=Unknown
% @importance 1.0

0.95::true_val(shape_description, symmetrical_regular_switch); 0.05::true_val(shape_description, unk_shape_description).

measured(s21, shape_description, symmetrical_regular_switch).

all_consistent(shape_description) :- consistent(s21, shape_description).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, symmetrical_regular_switch)).
query(true_val(shape_description, unk_shape_description)).

0.93::acc(s22, camber_type).
0.35::acc(s24, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values combination_camber=Twin_Combination_Camber_RCR flat_to_rocker=Flat_to_Rocker_Profile
% @importance 0.9

0.90::true_val(camber_type, combination_camber); 0.10::true_val(camber_type, flat_to_rocker).

measured(s22, camber_type, combination_camber).
measured(s24, camber_type, flat_to_rocker).

all_consistent(camber_type) :-
    consistent(s22, camber_type),
    consistent(s24, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, combination_camber)).
query(true_val(camber_type, flat_to_rocker)).

0.93::acc(s21, camber_description).
0.75::acc(s23, camber_description).
0.80::acc(s25, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values camber_rocker_blend=Camber_between_feet_rockered_tip_tail unk_camber_description=Unknown
% @importance 0.867

0.95::true_val(camber_description, camber_rocker_blend); 0.05::true_val(camber_description, unk_camber_description).

measured(s21, camber_description, camber_rocker_blend).
measured(s23, camber_description, camber_rocker_blend).
measured(s25, camber_description, camber_rocker_blend).

all_consistent(camber_description) :-
    consistent(s21, camber_description),
    (indep(s23), consistent(s23, camber_description) ; \+indep(s23)),
    consistent(s25, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, camber_rocker_blend)).
query(true_val(camber_description, unk_camber_description)).

0.90::acc(s_merchant, setback).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 0.85

0.95::true_val(setback, v0); 0.05::true_val(setback, unk_setback).

measured(s_merchant, setback, v0).

all_consistent(setback) :- consistent(s_merchant, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

0.88::acc(s_merchant, taper).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v0=0.0 unk_taper=Unknown
% @importance 0.85

0.95::true_val(taper, v0); 0.05::true_val(taper, unk_taper).

measured(s_merchant, taper, v0).

all_consistent(taper) :- consistent(s_merchant, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v0)).
query(true_val(taper, unk_taper)).

0.88::acc(s_merchant, flex_rating_10).
0.55::acc(s26, flex_rating_10).
0.45::acc(s27, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6=6.0 v3=3.0
% @importance 0.917

0.55::true_val(flex_rating_10, v6); 0.45::true_val(flex_rating_10, v3).

measured(s_merchant, flex_rating_10, v6).
measured(s26, flex_rating_10, v3).
measured(s27, flex_rating_10, v3).

all_consistent(flex_rating_10) :-
    consistent(s_merchant, flex_rating_10),
    consistent(s26, flex_rating_10),
    consistent(s27, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, v3)).

0.65::acc(s28, flex_rating_10_evo).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium=Medium_evo_classifies_3to5 unk_flex_rating_10_evo=Unknown
% @importance 0.7

0.60::true_val(flex_rating_10_evo, medium); 0.40::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s28, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :- consistent(s28, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

0.93::acc(s21, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values soft_predictable_pressable=Softer_flexing_twin_predictable_and_pressable unk_flex_feel=Unknown
% @importance 1.0

0.95::true_val(flex_feel, soft_predictable_pressable); 0.05::true_val(flex_feel, unk_flex_feel).

measured(s21, flex_feel, soft_predictable_pressable).

all_consistent(flex_feel) :- consistent(s21, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, soft_predictable_pressable)).
query(true_val(flex_feel, unk_flex_feel)).

0.68::acc(s29, flex_feel_consistency).

% @attr flex_feel_consistency
% @type categorical
% @canonical false
% @original_name flex_feel
% @values consistent_single_species=Consistent_flex_from_single_species_wood unk_flex_feel_consistency=Unknown
% @importance 0.85

0.67::true_val(flex_feel_consistency, consistent_single_species); 0.33::true_val(flex_feel_consistency, unk_flex_feel_consistency).

measured(s29, flex_feel_consistency, consistent_single_species).

all_consistent(flex_feel_consistency) :- consistent(s29, flex_feel_consistency).

evidence(all_consistent(flex_feel_consistency)).
query(true_val(flex_feel_consistency, consistent_single_species)).
query(true_val(flex_feel_consistency, unk_flex_feel_consistency)).

0.93::acc(s21, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values twin_symmetrical=Twin_symmetrical_flex unk_flex_direction=Unknown
% @importance 1.0

0.95::true_val(flex_direction, twin_symmetrical); 0.05::true_val(flex_direction, unk_flex_direction).

measured(s21, flex_direction, twin_symmetrical).

all_consistent(flex_direction) :- consistent(s21, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

0.93::acc(s30, core_material).
0.65::acc(s31, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_single_species=Aspen_single_species_wood_core unk_core_material=Unknown
% @importance 0.833

0.95::true_val(core_material, aspen_single_species); 0.05::true_val(core_material, unk_core_material).

measured(s30, core_material, aspen_single_species).
measured(s31, core_material, aspen_single_species).

all_consistent(core_material) :-
    consistent(s30, core_material),
    (indep(s31), consistent(s31, core_material) ; \+indep(s31)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_single_species)).
query(true_val(core_material, unk_core_material)).

0.72::acc(s32, laminate).
0.65::acc(s33, laminate).
0.60::acc(s34, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biax_glass=Biaxial_fiberglass_0_and_90_degrees unk_laminate=Unknown
% @importance 0.7

0.95::true_val(laminate, biax_glass); 0.05::true_val(laminate, unk_laminate).

measured(s32, laminate, biax_glass).
measured(s33, laminate, biax_glass).
measured(s34, laminate, biax_glass).

all_consistent(laminate) :-
    (indep(s32), consistent(s32, laminate) ; \+indep(s32)),
    (indep(s33), consistent(s33, laminate) ; \+indep(s33)),
    (indep(s34), consistent(s34, laminate) ; \+indep(s34)).

evidence(all_consistent(laminate)).
query(true_val(laminate, biax_glass)).
query(true_val(laminate, unk_laminate)).

0.65::acc(s35, sidewall_material).
0.55::acc(s36, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values hybritech=Hybritech_sidewall_ptex_to_capped unk_sidewall_material=Unknown
% @importance 0.625

0.95::true_val(sidewall_material, hybritech); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s35, sidewall_material, hybritech).
measured(s36, sidewall_material, hybritech).

all_consistent(sidewall_material) :-
    (indep(s35), consistent(s35, sidewall_material) ; \+indep(s35)),
    (indep(s36), consistent(s36, sidewall_material) ; \+indep(s36)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, hybritech)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.93::acc(s21, base_material).
0.65::acc(s37, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values extruded_2000=Extruded_2000_low_maintenance unk_base_material=Unknown
% @importance 0.817

0.95::true_val(base_material, extruded_2000); 0.05::true_val(base_material, unk_base_material).

measured(s21, base_material, extruded_2000).
measured(s37, base_material, extruded_2000).

all_consistent(base_material) :-
    consistent(s21, base_material),
    (indep(s37), consistent(s37, base_material) ; \+indep(s37)).

evidence(all_consistent(base_material)).
query(true_val(base_material, extruded_2000)).
query(true_val(base_material, unk_base_material)).

0.88::acc(s_merchant, mounting_pattern).
0.58::acc(s38, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values pattern_2x4=2x4_insert_pattern unk_mounting_pattern=Unknown
% @importance 0.75

0.95::true_val(mounting_pattern, pattern_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_merchant, mounting_pattern, pattern_2x4).
measured(s38, mounting_pattern, pattern_2x4).

all_consistent(mounting_pattern) :-
    consistent(s_merchant, mounting_pattern),
    (indep(s38), consistent(s38, mounting_pattern) ; \+indep(s38)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, pattern_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.58::acc(s38, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values standard_2x4_non_est=Standard_2x4_all_non_Burton_EST unk_binding_compatibility=Unknown
% @importance 0.65

0.57::true_val(binding_compatibility, standard_2x4_non_est); 0.43::true_val(binding_compatibility, unk_binding_compatibility).

measured(s38, binding_compatibility, standard_2x4_non_est).

all_consistent(binding_compatibility) :- consistent(s38, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_2x4_non_est)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.90::acc(s_merchant, effective_edge_148).

% @attr effective_edge_148
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 148cm
% @values v110=110.0 unk_effective_edge_148=Unknown
% @importance 0.85

0.95::true_val(effective_edge_148, v110); 0.05::true_val(effective_edge_148, unk_effective_edge_148).

measured(s_merchant, effective_edge_148, v110).

all_consistent(effective_edge_148) :- consistent(s_merchant, effective_edge_148).

evidence(all_consistent(effective_edge_148)).
query(true_val(effective_edge_148, v110)).
query(true_val(effective_edge_148, unk_effective_edge_148)).

0.90::acc(s_merchant, effective_edge_152).

% @attr effective_edge_152
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 152cm
% @values v114=114.0 unk_effective_edge_152=Unknown
% @importance 0.85

0.95::true_val(effective_edge_152, v114); 0.05::true_val(effective_edge_152, unk_effective_edge_152).

measured(s_merchant, effective_edge_152, v114).

all_consistent(effective_edge_152) :- consistent(s_merchant, effective_edge_152).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v114)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

0.90::acc(s_merchant, effective_edge_156).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 156cm
% @values v118=118.0 unk_effective_edge_156=Unknown
% @importance 0.85

0.95::true_val(effective_edge_156, v118); 0.05::true_val(effective_edge_156, unk_effective_edge_156).

measured(s_merchant, effective_edge_156, v118).

all_consistent(effective_edge_156) :- consistent(s_merchant, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v118)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

0.90::acc(s_merchant, effective_edge_154w).

% @attr effective_edge_154w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 154W
% @values v116=116.0 unk_effective_edge_154w=Unknown
% @importance 0.85

0.95::true_val(effective_edge_154w, v116); 0.05::true_val(effective_edge_154w, unk_effective_edge_154w).

measured(s_merchant, effective_edge_154w, v116).

all_consistent(effective_edge_154w) :- consistent(s_merchant, effective_edge_154w).

evidence(all_consistent(effective_edge_154w)).
query(true_val(effective_edge_154w, v116)).
query(true_val(effective_edge_154w, unk_effective_edge_154w)).

0.90::acc(s_merchant, effective_edge_157w).

% @attr effective_edge_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 157W
% @values v119=119.0 unk_effective_edge_157w=Unknown
% @importance 0.85

0.95::true_val(effective_edge_157w, v119); 0.05::true_val(effective_edge_157w, unk_effective_edge_157w).

measured(s_merchant, effective_edge_157w, v119).

all_consistent(effective_edge_157w) :- consistent(s_merchant, effective_edge_157w).

evidence(all_consistent(effective_edge_157w)).
query(true_val(effective_edge_157w, v119)).
query(true_val(effective_edge_157w, unk_effective_edge_157w)).

0.90::acc(s_merchant, tip_tail_width_size_148).

% @attr tip_tail_width_size_148
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v286=286.0 unk_tip_tail_width_size_148=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_148, v286); 0.05::true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148).

measured(s_merchant, tip_tail_width_size_148, v286).

all_consistent(tip_tail_width_size_148) :- consistent(s_merchant, tip_tail_width_size_148).

evidence(all_consistent(tip_tail_width_size_148)).
query(true_val(tip_tail_width_size_148, v286)).
query(true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148)).

0.90::acc(s_merchant, waist_width_148).

% @attr waist_width_148
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 148cm
% @values v247=247.0 unk_waist_width_148=Unknown
% @importance 0.85

0.95::true_val(waist_width_148, v247); 0.05::true_val(waist_width_148, unk_waist_width_148).

measured(s_merchant, waist_width_148, v247).

all_consistent(waist_width_148) :- consistent(s_merchant, waist_width_148).

evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v247)).
query(true_val(waist_width_148, unk_waist_width_148)).

0.90::acc(s_merchant, tip_tail_width_size_152).

% @attr tip_tail_width_size_152
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v290=290.0 unk_tip_tail_width_size_152=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_152, v290); 0.05::true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152).

measured(s_merchant, tip_tail_width_size_152, v290).

all_consistent(tip_tail_width_size_152) :- consistent(s_merchant, tip_tail_width_size_152).

evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, v290)).
query(true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152)).

0.90::acc(s_merchant, waist_width_152).

% @attr waist_width_152
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 152cm
% @values v249=249.0 unk_waist_width_152=Unknown
% @importance 0.85

0.95::true_val(waist_width_152, v249); 0.05::true_val(waist_width_152, unk_waist_width_152).

measured(s_merchant, waist_width_152, v249).

all_consistent(waist_width_152) :- consistent(s_merchant, waist_width_152).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v249)).
query(true_val(waist_width_152, unk_waist_width_152)).

0.90::acc(s_merchant, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size
% @values v294=294.0 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size, v294); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_merchant, tip_tail_width_size, v294).

all_consistent(tip_tail_width_size) :- consistent(s_merchant, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v294)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.90::acc(s_merchant, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 156cm
% @values v251=251.0 unk_waist_width_156=Unknown
% @importance 0.85

0.95::true_val(waist_width_156, v251); 0.05::true_val(waist_width_156, unk_waist_width_156).

measured(s_merchant, waist_width_156, v251).

all_consistent(waist_width_156) :- consistent(s_merchant, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v251)).
query(true_val(waist_width_156, unk_waist_width_156)).

0.90::acc(s_merchant, tip_tail_width_size_154w).

% @attr tip_tail_width_size_154w
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v304=304.0 unk_tip_tail_width_size_154w=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_154w, v304); 0.05::true_val(tip_tail_width_size_154w, unk_tip_tail_width_size_154w).

measured(s_merchant, tip_tail_width_size_154w, v304).

all_consistent(tip_tail_width_size_154w) :- consistent(s_merchant, tip_tail_width_size_154w).

evidence(all_consistent(tip_tail_width_size_154w)).
query(true_val(tip_tail_width_size_154w, v304)).
query(true_val(tip_tail_width_size_154w, unk_tip_tail_width_size_154w)).

0.90::acc(s_merchant, waist_width_154w).

% @attr waist_width_154w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 154W
% @values v262=262.0 unk_waist_width_154w=Unknown
% @importance 0.85

0.95::true_val(waist_width_154w, v262); 0.05::true_val(waist_width_154w, unk_waist_width_154w).

measured(s_merchant, waist_width_154w, v262).

all_consistent(waist_width_154w) :- consistent(s_merchant, waist_width_154w).

evidence(all_consistent(waist_width_154w)).
query(true_val(waist_width_154w, v262)).
query(true_val(waist_width_154w, unk_waist_width_154w)).

0.90::acc(s_merchant, tip_tail_width_size_157w).

% @attr tip_tail_width_size_157w
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size
% @values v307=307.0 unk_tip_tail_width_size_157w=Unknown
% @importance 0.85

0.95::true_val(tip_tail_width_size_157w, v307); 0.05::true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w).

measured(s_merchant, tip_tail_width_size_157w, v307).

all_consistent(tip_tail_width_size_157w) :- consistent(s_merchant, tip_tail_width_size_157w).

evidence(all_consistent(tip_tail_width_size_157w)).
query(true_val(tip_tail_width_size_157w, v307)).
query(true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w)).

0.90::acc(s_merchant, waist_width_157w).

% @attr waist_width_157w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 157W
% @values v264=264.0 unk_waist_width_157w=Unknown
% @importance 0.85

0.95::true_val(waist_width_157w, v264); 0.05::true_val(waist_width_157w, unk_waist_width_157w).

measured(s_merchant, waist_width_157w, v264).

all_consistent(waist_width_157w) :- consistent(s_merchant, waist_width_157w).

evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v264)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

0.90::acc(s_merchant, sidecut_radius_size_148).

% @attr sidecut_radius_size_148
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_6=7.6 unk_sidecut_radius_size_148=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_148, v7_6); 0.05::true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148).

measured(s_merchant, sidecut_radius_size_148, v7_6).

all_consistent(sidecut_radius_size_148) :- consistent(s_merchant, sidecut_radius_size_148).

evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v7_6)).
query(true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148)).

0.90::acc(s_merchant, sidecut_radius_size_152).

% @attr sidecut_radius_size_152
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_7=7.7 unk_sidecut_radius_size_152=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_152, v7_7); 0.05::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

measured(s_merchant, sidecut_radius_size_152, v7_7).

all_consistent(sidecut_radius_size_152) :- consistent(s_merchant, sidecut_radius_size_152).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v7_7)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

0.90::acc(s_merchant, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_8=7.8 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size, v7_8); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_merchant, sidecut_radius_size, v7_8).

all_consistent(sidecut_radius_size) :- consistent(s_merchant, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_8)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.90::acc(s_merchant, sidecut_radius_size_154w).

% @attr sidecut_radius_size_154w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_8=7.8 unk_sidecut_radius_size_154w=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_154w, v7_8_w); 0.05::true_val(sidecut_radius_size_154w, unk_sidecut_radius_size_154w).

measured(s_merchant, sidecut_radius_size_154w, v7_8_w).

all_consistent(sidecut_radius_size_154w) :- consistent(s_merchant, sidecut_radius_size_154w).

evidence(all_consistent(sidecut_radius_size_154w)).
query(true_val(sidecut_radius_size_154w, v7_8_w)).
query(true_val(sidecut_radius_size_154w, unk_sidecut_radius_size_154w)).

0.90::acc(s_merchant, sidecut_radius_size_157w).

% @attr sidecut_radius_size_157w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_9=7.9 unk_sidecut_radius_size_157w=Unknown
% @importance 0.85

0.95::true_val(sidecut_radius_size_157w, v7_9); 0.05::true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w).

measured(s_merchant, sidecut_radius_size_157w, v7_9).

all_consistent(sidecut_radius_size_157w) :- consistent(s_merchant, sidecut_radius_size_157w).

evidence(all_consistent(sidecut_radius_size_157w)).
query(true_val(sidecut_radius_size_157w, v7_9)).
query(true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w)).

0.90::acc(s_merchant, stance_width_range_size_148).

% @attr stance_width_range_size_148
% @type numeric
% @unit in
% @canonical false
% @original_name stance_width_range_size
% @values v20=20.0 unk_stance_width_range_size_148=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_148, v20); 0.05::true_val(stance_width_range_size_148, unk_stance_width_range_size_148).

measured(s_merchant, stance_width_range_size_148, v20).

all_consistent(stance_width_range_size_148) :- consistent(s_merchant, stance_width_range_size_148).

evidence(all_consistent(stance_width_range_size_148)).
query(true_val(stance_width_range_size_148, v20)).
query(true_val(stance_width_range_size_148, unk_stance_width_range_size_148)).

0.90::acc(s_merchant, stance_width_range_size_152).

% @attr stance_width_range_size_152
% @type numeric
% @unit in
% @canonical false
% @original_name stance_width_range_size
% @values v21=21.0 unk_stance_width_range_size_152=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_152, v21); 0.05::true_val(stance_width_range_size_152, unk_stance_width_range_size_152).

measured(s_merchant, stance_width_range_size_152, v21).

all_consistent(stance_width_range_size_152) :- consistent(s_merchant, stance_width_range_size_152).

evidence(all_consistent(stance_width_range_size_152)).
query(true_val(stance_width_range_size_152, v21)).
query(true_val(stance_width_range_size_152, unk_stance_width_range_size_152)).

0.90::acc(s_merchant, stance_width_range_size).

% @attr stance_width_range_size
% @type numeric
% @unit in
% @canonical true
% @original_name stance_width_range_size
% @values v22=22.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size, v22); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_merchant, stance_width_range_size, v22).

all_consistent(stance_width_range_size) :- consistent(s_merchant, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v22)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.90::acc(s_merchant, stance_width_range_size_154w).

% @attr stance_width_range_size_154w
% @type numeric
% @unit in
% @canonical false
% @original_name stance_width_range_size
% @values v21=21.0 unk_stance_width_range_size_154w=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_154w, v21_w); 0.05::true_val(stance_width_range_size_154w, unk_stance_width_range_size_154w).

measured(s_merchant, stance_width_range_size_154w, v21_w).

all_consistent(stance_width_range_size_154w) :- consistent(s_merchant, stance_width_range_size_154w).

evidence(all_consistent(stance_width_range_size_154w)).
query(true_val(stance_width_range_size_154w, v21_w)).
query(true_val(stance_width_range_size_154w, unk_stance_width_range_size_154w)).

0.90::acc(s_merchant, stance_width_range_size_157w).

% @attr stance_width_range_size_157w
% @type numeric
% @unit in
% @canonical false
% @original_name stance_width_range_size
% @values v21=21.0 unk_stance_width_range_size_157w=Unknown
% @importance 0.85

0.95::true_val(stance_width_range_size_157w, v21_w2); 0.05::true_val(stance_width_range_size_157w, unk_stance_width_range_size_157w).

measured(s_merchant, stance_width_range_size_157w, v21_w2).

all_consistent(stance_width_range_size_157w) :- consistent(s_merchant, stance_width_range_size_157w).

evidence(all_consistent(stance_width_range_size_157w)).
query(true_val(stance_width_range_size_157w, v21_w2)).
query(true_val(stance_width_range_size_157w, unk_stance_width_range_size_157w)).

0.90::acc(s_merchant, recommended_weight_range_size_148).

% @attr recommended_weight_range_size_148
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r54_86=54-86kg unk_recommended_weight_range_size_148=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_148, r54_86); 0.05::true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148).

measured(s_merchant, recommended_weight_range_size_148, r54_86).

all_consistent(recommended_weight_range_size_148) :- consistent(s_merchant, recommended_weight_range_size_148).

evidence(all_consistent(recommended_weight_range_size_148)).
query(true_val(recommended_weight_range_size_148, r54_86)).
query(true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148)).

0.90::acc(s_merchant, recommended_weight_range_size_152).

% @attr recommended_weight_range_size_152
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r41_73=41-73kg unk_recommended_weight_range_size_152=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_152, r41_73); 0.05::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(s_merchant, recommended_weight_range_size_152, r41_73).

all_consistent(recommended_weight_range_size_152) :- consistent(s_merchant, recommended_weight_range_size_152).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, r41_73)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

0.90::acc(s_merchant, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values r54_86=54-86kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size, r54_86_main); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_merchant, recommended_weight_range_size, r54_86_main).

all_consistent(recommended_weight_range_size) :- consistent(s_merchant, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r54_86_main)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.90::acc(s_merchant, recommended_weight_range_size_154w).

% @attr recommended_weight_range_size_154w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r59_95=59-95kg unk_recommended_weight_range_size_154w=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_154w, r59_95); 0.05::true_val(recommended_weight_range_size_154w, unk_recommended_weight_range_size_154w).

measured(s_merchant, recommended_weight_range_size_154w, r59_95).

all_consistent(recommended_weight_range_size_154w) :- consistent(s_merchant, recommended_weight_range_size_154w).

evidence(all_consistent(recommended_weight_range_size_154w)).
query(true_val(recommended_weight_range_size_154w, r59_95)).
query(true_val(recommended_weight_range_size_154w, unk_recommended_weight_range_size_154w)).

0.90::acc(s_merchant, recommended_weight_range_size_157w).

% @attr recommended_weight_range_size_157w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r59_95=59-95kg unk_recommended_weight_range_size_157w=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_157w, r59_95_w); 0.05::true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w).

measured(s_merchant, recommended_weight_range_size_157w, r59_95_w).

all_consistent(recommended_weight_range_size_157w) :- consistent(s_merchant, recommended_weight_range_size_157w).

evidence(all_consistent(recommended_weight_range_size_157w)).
query(true_val(recommended_weight_range_size_157w, r59_95_w)).
query(true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w)).

0.93::acc(s21, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner_to_intermediate=Beginner_to_Intermediate unk_rider_level=Unknown
% @importance 1.0

0.95::true_val(rider_level, beginner_to_intermediate); 0.05::true_val(rider_level, unk_rider_level).

measured(s21, rider_level, beginner_to_intermediate).

all_consistent(rider_level) :- consistent(s21, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_to_intermediate)).
query(true_val(rider_level, unk_rider_level)).

0.88::acc(s_merchant, board_category).

% @attr board_category
% @type categorical
% @canonical false
% @original_name board_category
% @values freestyle=Freestyle unk_board_category=Unknown
% @importance 0.85

0.95::true_val(board_category, freestyle); 0.05::true_val(board_category, unk_board_category).

measured(s_merchant, board_category, freestyle).

all_consistent(board_category) :- consistent(s_merchant, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle)).
query(true_val(board_category, unk_board_category)).

0.88::acc(s_merchant, terrain_suitability).
0.68::acc(s29, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_jib_small_medium=Park_Jib_Small_to_Medium_Freestyle_Features unk_terrain_suitability=Unknown
% @importance 0.85

0.95::true_val(terrain_suitability, park_jib_small_medium); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_merchant, terrain_suitability, park_jib_small_medium).
measured(s29, terrain_suitability, park_jib_small_medium).

all_consistent(terrain_suitability) :-
    consistent(s_merchant, terrain_suitability),
    (indep(s29), consistent(s29, terrain_suitability) ; \+indep(s29)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_jib_small_medium)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.88::acc(s_merchant, riding_style).
0.68::acc(s29, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_jib_switch=Freestyle_Jib_Switch_Butters_Presses unk_riding_style=Unknown
% @importance 0.85

0.95::true_val(riding_style, freestyle_jib_switch); 0.05::true_val(riding_style, unk_riding_style).

measured(s_merchant, riding_style, freestyle_jib_switch).
measured(s29, riding_style, freestyle_jib_switch).

all_consistent(riding_style) :-
    consistent(s_merchant, riding_style),
    (indep(s29), consistent(s29, riding_style) ; \+indep(s29)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_jib_switch)).
query(true_val(riding_style, unk_riding_style)).

0.93::acc(s21, pop).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values camber_pop_energy=Camber_between_feet_provides_pop_and_energy unk_pop=Unknown
% @importance 1.0

0.95::true_val(pop, camber_pop_energy); 0.05::true_val(pop, unk_pop).

measured(s21, pop, camber_pop_energy).

all_consistent(pop) :- consistent(s21, pop).

evidence(all_consistent(pop)).
query(true_val(pop, camber_pop_energy)).
query(true_val(pop, unk_pop)).

0.72::acc(s25, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values camber_contact_improves=Camber_underfoot_increases_contact_improves_edge_hold unk_edge_hold=Unknown
% @importance 0.75

0.68::true_val(edge_hold, camber_contact_improves); 0.32::true_val(edge_hold, unk_edge_hold).

measured(s25, edge_hold, camber_contact_improves).

all_consistent(edge_hold) :- consistent(s25, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, camber_contact_improves)).
query(true_val(edge_hold, unk_edge_hold)).

0.93::acc(s21, catch_free_ride).

% @attr catch_free_ride
% @type categorical
% @canonical false
% @original_name Catch-free ride
% @values rocker_catch_free=Rockered_tip_tail_catch_free_easy_press unk_catch_free_ride=Unknown
% @importance 1.0

0.95::true_val(catch_free_ride, rocker_catch_free); 0.05::true_val(catch_free_ride, unk_catch_free_ride).

measured(s21, catch_free_ride, rocker_catch_free).

all_consistent(catch_free_ride) :- consistent(s21, catch_free_ride).

evidence(all_consistent(catch_free_ride)).
query(true_val(catch_free_ride, rocker_catch_free)).
query(true_val(catch_free_ride, unk_catch_free_ride)).

0.93::acc(s21, switch_riding).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values true_twin_same_feel=True_twin_same_feel_regular_and_switch unk_switch_riding=Unknown
% @importance 1.0

0.95::true_val(switch_riding, true_twin_same_feel); 0.05::true_val(switch_riding, unk_switch_riding).

measured(s21, switch_riding, true_twin_same_feel).

all_consistent(switch_riding) :- consistent(s21, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, true_twin_same_feel)).
query(true_val(switch_riding, unk_switch_riding)).

0.85::acc(s21, responsiveness).

% @attr responsiveness
% @type categorical
% @canonical false
% @original_name Responsiveness
% @values predictable_pressable=Predictable_and_pressable_not_highly_responsive unk_responsiveness=Unknown
% @importance 1.0

0.95::true_val(responsiveness, predictable_pressable); 0.05::true_val(responsiveness, unk_responsiveness).

measured(s21, responsiveness, predictable_pressable).

all_consistent(responsiveness) :- consistent(s21, responsiveness).

evidence(all_consistent(responsiveness)).
query(true_val(responsiveness, predictable_pressable)).
query(true_val(responsiveness, unk_responsiveness)).

0.55::acc(s39, stability).

% @attr stability
% @type categorical
% @canonical false
% @original_name Stability
% @values stable_balanced_both_ways=Stable_and_balanced_regular_or_switch unk_stability=Unknown
% @importance 0.7

0.51::true_val(stability, stable_balanced_both_ways); 0.49::true_val(stability, unk_stability).

measured(s39, stability, stable_balanced_both_ways).

all_consistent(stability) :- consistent(s39, stability).

evidence(all_consistent(stability)).
query(true_val(stability, stable_balanced_both_ways)).
query(true_val(stability, unk_stability)).

0.93::acc(s21, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values affordable_entry_freestyle=Perfect_for_affordable_twin_softer_freestyle_or_first_setup unk_skill_level_recommendation=Unknown
% @importance 1.0

0.95::true_val(skill_level_recommendation, affordable_entry_freestyle); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s21, skill_level_recommendation, affordable_entry_freestyle).

all_consistent(skill_level_recommendation) :- consistent(s21, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, affordable_entry_freestyle)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.72::acc(s40, reviewer_opinion_whitelines).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values high_perf_affordable=High_performance_freestyle_at_affordable_price unk_reviewer_opinion_whitelines=Unknown
% @importance 0.8

0.68::true_val(reviewer_opinion_whitelines, high_perf_affordable); 0.32::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s40, reviewer_opinion_whitelines, high_perf_affordable).

all_consistent(reviewer_opinion_whitelines) :- consistent(s40, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, high_perf_affordable)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

0.72::acc(s40, reviewer_opinion_whitelines_2).

% @attr reviewer_opinion_whitelines_2
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values great_first_board=Great_first_snowboard_long_to_outgrow unk_reviewer_opinion_whitelines_2=Unknown
% @importance 0.8

0.68::true_val(reviewer_opinion_whitelines_2, great_first_board); 0.32::true_val(reviewer_opinion_whitelines_2, unk_reviewer_opinion_whitelines_2).

measured(s40, reviewer_opinion_whitelines_2, great_first_board).

all_consistent(reviewer_opinion_whitelines_2) :- consistent(s40, reviewer_opinion_whitelines_2).

evidence(all_consistent(reviewer_opinion_whitelines_2)).
query(true_val(reviewer_opinion_whitelines_2, great_first_board)).
query(true_val(reviewer_opinion_whitelines_2, unk_reviewer_opinion_whitelines_2)).

0.72::acc(s40, reviewer_opinion_whitelines_3).

% @attr reviewer_opinion_whitelines_3
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values forgiving_ideal_learning=Forgiving_flex_ideal_learning_tricks_in_out_park unk_reviewer_opinion_whitelines_3=Unknown
% @importance 0.8

0.68::true_val(reviewer_opinion_whitelines_3, forgiving_ideal_learning); 0.32::true_val(reviewer_opinion_whitelines_3, unk_reviewer_opinion_whitelines_3).

measured(s40, reviewer_opinion_whitelines_3, forgiving_ideal_learning).

all_consistent(reviewer_opinion_whitelines_3) :- consistent(s40, reviewer_opinion_whitelines_3).

evidence(all_consistent(reviewer_opinion_whitelines_3)).
query(true_val(reviewer_opinion_whitelines_3, forgiving_ideal_learning)).
query(true_val(reviewer_opinion_whitelines_3, unk_reviewer_opinion_whitelines_3)).

0.72::acc(s41, reviewer_opinion_whitelines_4).

% @attr reviewer_opinion_whitelines_4
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values simple_effective=Simple_yet_highly_effective_freestyle_board unk_reviewer_opinion_whitelines_4=Unknown
% @importance 0.65

0.68::true_val(reviewer_opinion_whitelines_4, simple_effective); 0.32::true_val(reviewer_opinion_whitelines_4, unk_reviewer_opinion_whitelines_4).

measured(s41, reviewer_opinion_whitelines_4, simple_effective).

all_consistent(reviewer_opinion_whitelines_4) :- consistent(s41, reviewer_opinion_whitelines_4).

evidence(all_consistent(reviewer_opinion_whitelines_4)).
query(true_val(reviewer_opinion_whitelines_4, simple_effective)).
query(true_val(reviewer_opinion_whitelines_4, unk_reviewer_opinion_whitelines_4)).

0.62::acc(s42, backcountry_review).

% @attr backcountry_review
% @type categorical
% @canonical false
% @original_name Backcountry/Steep&Cheap review
% @values best_starter_freestyle=Best_starter_freestyle_easy_press_poppy_stable unk_backcountry_review=Unknown
% @importance 0.75

0.60::true_val(backcountry_review, best_starter_freestyle); 0.40::true_val(backcountry_review, unk_backcountry_review).

measured(s42, backcountry_review, best_starter_freestyle).

all_consistent(backcountry_review) :- consistent(s42, backcountry_review).

evidence(all_consistent(backcountry_review)).
query(true_val(backcountry_review, best_starter_freestyle)).
query(true_val(backcountry_review, unk_backcountry_review)).

0.45::acc(s43, looria_aggregate_rating).

% @attr looria_aggregate_rating
% @type categorical
% @canonical false
% @original_name Looria aggregate rating
% @values grade_c=C_grade_based_on_2_reviews unk_looria_aggregate_rating=Unknown
% @importance 0.65

0.41::true_val(looria_aggregate_rating, grade_c); 0.59::true_val(looria_aggregate_rating, unk_looria_aggregate_rating).

measured(s43, looria_aggregate_rating, grade_c).

all_consistent(looria_aggregate_rating) :- consistent(s43, looria_aggregate_rating).

evidence(all_consistent(looria_aggregate_rating)).
query(true_val(looria_aggregate_rating, grade_c)).
query(true_val(looria_aggregate_rating, unk_looria_aggregate_rating)).

0.45::acc(s43, looria_sentiment_summary).

% @attr looria_sentiment_summary
% @type categorical
% @canonical false
% @original_name Looria sentiment summary
% @values flat_tricks_soft_value=Great_flat_ground_tricks_soft_playful_good_value unk_looria_sentiment_summary=Unknown
% @importance 0.65

0.41::true_val(looria_sentiment_summary, flat_tricks_soft_value); 0.59::true_val(looria_sentiment_summary, unk_looria_sentiment_summary).

measured(s43, looria_sentiment_summary, flat_tricks_soft_value).

all_consistent(looria_sentiment_summary) :- consistent(s43, looria_sentiment_summary).

evidence(all_consistent(looria_sentiment_summary)).
query(true_val(looria_sentiment_summary, flat_tricks_soft_value)).
query(true_val(looria_sentiment_summary, unk_looria_sentiment_summary)).

0.50::acc(s43, k2_official_review_youtube).

% @attr k2_official_review_youtube
% @type categorical
% @canonical false
% @original_name K2 official review (YouTube)
% @values amazing_entry_beginner_park=Amazing_board_entry_beginner_intermediate_park_soft_flex unk_k2_official_review_youtube=Unknown
% @importance 0.65

0.41::true_val(k2_official_review_youtube, amazing_entry_beginner_park); 0.59::true_val(k2_official_review_youtube, unk_k2_official_review_youtube).

measured(s43, k2_official_review_youtube, amazing_entry_beginner_park).

all_consistent(k2_official_review_youtube) :- consistent(s43, k2_official_review_youtube).

evidence(all_consistent(k2_official_review_youtube)).
query(true_val(k2_official_review_youtube, amazing_entry_beginner_park)).
query(true_val(k2_official_review_youtube, unk_k2_official_review_youtube)).

0.65::acc(s44, backcountry_editorial).

% @attr backcountry_editorial
% @type categorical
% @canonical false
% @original_name Backcountry editorial
% @values affordable_reliable_fun=Affordable_reliable_fun_keeps_coming_back unk_backcountry_editorial=Unknown
% @importance 0.6

0.60::true_val(backcountry_editorial, affordable_reliable_fun); 0.40::true_val(backcountry_editorial, unk_backcountry_editorial).

measured(s44, backcountry_editorial, affordable_reliable_fun).

all_consistent(backcountry_editorial) :- consistent(s44, backcountry_editorial).

evidence(all_consistent(backcountry_editorial)).
query(true_val(backcountry_editorial, affordable_reliable_fun)).
query(true_val(backcountry_editorial, unk_backcountry_editorial)).

0.72::acc(s23, evo_description).

% @attr evo_description
% @type categorical
% @canonical false
% @original_name evo description
% @values softer_aspiring_park=Softer_flexing_aimed_at_aspiring_park_riders unk_evo_description=Unknown
% @importance 0.9

0.72::true_val(evo_description, softer_aspiring_park); 0.28::true_val(evo_description, unk_evo_description).

measured(s23, evo_description, softer_aspiring_park).

all_consistent(evo_description) :- consistent(s23, evo_description).

evidence(all_consistent(evo_description)).
query(true_val(evo_description, softer_aspiring_park)).
query(true_val(evo_description, unk_evo_description)).

0.62::acc(s18, level_nine_gearhead_review).

% @attr level_nine_gearhead_review
% @type categorical
% @canonical false
% @original_name Level Nine Sports Gearhead review
% @values true_twin_standout_playful=True_twin_flex_camber_standout_playful_park unk_level_nine_gearhead_review=Unknown
% @importance 0.85

0.60::true_val(level_nine_gearhead_review, true_twin_standout_playful); 0.40::true_val(level_nine_gearhead_review, unk_level_nine_gearhead_review).

measured(s18, level_nine_gearhead_review, true_twin_standout_playful).

all_consistent(level_nine_gearhead_review) :- consistent(s18, level_nine_gearhead_review).

evidence(all_consistent(level_nine_gearhead_review)).
query(true_val(level_nine_gearhead_review, true_twin_standout_playful)).
query(true_val(level_nine_gearhead_review, unk_level_nine_gearhead_review)).

0.93::acc(s45, warranty_period_years).
0.60::acc(s46, warranty_period_years).
0.25::acc(s47, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v2=2.0 v3=3.0
% @importance 0.7

0.70::true_val(warranty_period_years, v2); 0.30::true_val(warranty_period_years, v3).

measured(s45, warranty_period_years, v2).
measured(s46, warranty_period_years, v3).
measured(s47, warranty_period_years, v2).

all_consistent(warranty_period_years) :-
    consistent(s45, warranty_period_years),
    consistent(s46, warranty_period_years),
    consistent(s47, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, v3)).

0.93::acc(s45, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values covers_defects=Covers_structural_cracks_delamination_manufacturing_defects unk_warranty=Unknown
% @importance 0.8

0.95::true_val(warranty, covers_defects); 0.05::true_val(warranty, unk_warranty).

measured(s45, warranty, covers_defects).

all_consistent(warranty) :- consistent(s45, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, covers_defects)).
query(true_val(warranty, unk_warranty)).

0.93::acc(s45, warranty_exclusions).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty
% @values excludes_impact_misuse=Excludes_impact_misuse_boxes_rails_rock_damage unk_warranty_exclusions=Unknown
% @importance 0.8

0.95::true_val(warranty_exclusions, excludes_impact_misuse); 0.05::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s45, warranty_exclusions, excludes_impact_misuse).

all_consistent(warranty_exclusions) :- consistent(s45, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, excludes_impact_misuse)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

0.55::acc(s48, warranty_transferability).

% @attr warranty_transferability
% @type categorical
% @canonical false
% @original_name warranty
% @values original_purchaser_only=Original_purchaser_only unk_warranty_transferability=Unknown
% @importance 0.6

0.54::true_val(warranty_transferability, original_purchaser_only); 0.46::true_val(warranty_transferability, unk_warranty_transferability).

measured(s48, warranty_transferability, original_purchaser_only).

all_consistent(warranty_transferability) :- consistent(s48, warranty_transferability).

evidence(all_consistent(warranty_transferability)).
query(true_val(warranty_transferability, original_purchaser_only)).
query(true_val(warranty_transferability, unk_warranty_transferability)).

0.68::acc(s6, k2_brand_heritage).

% @attr k2_brand_heritage
% @type categorical
% @canonical false
% @original_name K2 brand heritage
% @values original_american_1962=Original_American_Ski_Snowboard_Brand_1962_WA unk_k2_brand_heritage=Unknown
% @importance 0.4

0.68::true_val(k2_brand_heritage, original_american_1962); 0.32::true_val(k2_brand_heritage, unk_k2_brand_heritage).

measured(s6, k2_brand_heritage, original_american_1962).

all_consistent(k2_brand_heritage) :- consistent(s6, k2_brand_heritage).

evidence(all_consistent(k2_brand_heritage)).
query(true_val(k2_brand_heritage, original_american_1962)).
query(true_val(k2_brand_heritage, unk_k2_brand_heritage)).

0.68::acc(s6, k2_snowboard_start).

% @attr k2_snowboard_start
% @type categorical
% @canonical false
% @original_name K2 snowboard start
% @values expanded_1987=Expanded_into_snowboards_1987 unk_k2_snowboard_start=Unknown
% @importance 0.4

0.68::true_val(k2_snowboard_start, expanded_1987); 0.32::true_val(k2_snowboard_start, unk_k2_snowboard_start).

measured(s6, k2_snowboard_start, expanded_1987).

all_consistent(k2_snowboard_start) :- consistent(s6, k2_snowboard_start).

evidence(all_consistent(k2_snowboard_start)).
query(true_val(k2_snowboard_start, expanded_1987)).
query(true_val(k2_snowboard_start, unk_k2_snowboard_start)).

0.68::acc(s6, k2_womens_innovation).

% @attr k2_womens_innovation
% @type categorical
% @canonical false
% @original_name K2 women's innovation
% @values first_women_specific_1999=First_brand_to_engineer_women_specific_1999 unk_k2_womens_innovation=Unknown
% @importance 0.4

0.68::true_val(k2_womens_innovation, first_women_specific_1999); 0.32::true_val(k2_womens_innovation, unk_k2_womens_innovation).

measured(s6, k2_womens_innovation, first_women_specific_1999).

all_consistent(k2_womens_innovation) :- consistent(s6, k2_womens_innovation).

evidence(all_consistent(k2_womens_innovation)).
query(true_val(k2_womens_innovation, first_women_specific_1999)).
query(true_val(k2_womens_innovation, unk_k2_womens_innovation)).

0.78::acc(s4, k2_sister_brands).

% @attr k2_sister_brands
% @type categorical
% @canonical false
% @original_name K2 parent company sister brands
% @values elevate_portfolio=K2_Marker_Dalbello_Volkl_RIDE_LINE_others unk_k2_sister_brands=Unknown
% @importance 0.35

0.76::true_val(k2_sister_brands, elevate_portfolio); 0.24::true_val(k2_sister_brands, unk_k2_sister_brands).

measured(s4, k2_sister_brands, elevate_portfolio).

all_consistent(k2_sister_brands) :- consistent(s4, k2_sister_brands).

evidence(all_consistent(k2_sister_brands)).
query(true_val(k2_sister_brands, elevate_portfolio)).
query(true_val(k2_sister_brands, unk_k2_sister_brands)).

0.78::acc(s5, k2_ownership_history).
0.82::acc(s49, k2_ownership_history).

% @attr k2_ownership_history
% @type categorical
% @canonical false
% @original_name K2 ownership history
% @values vashon_jarden_newell_kohlberg=Vashon_Jarden_Newell_Kohlberg_Elevate unk_k2_ownership_history=Unknown
% @importance 0.3

0.95::true_val(k2_ownership_history, vashon_jarden_newell_kohlberg); 0.05::true_val(k2_ownership_history, unk_k2_ownership_history).

measured(s5, k2_ownership_history, vashon_jarden_newell_kohlberg).
measured(s49, k2_ownership_history, vashon_jarden_newell_kohlberg).

all_consistent(k2_ownership_history) :-
    consistent(s5, k2_ownership_history),
    consistent(s49, k2_ownership_history).

evidence(all_consistent(k2_ownership_history)).
query(true_val(k2_ownership_history, vashon_jarden_newell_kohlberg)).
query(true_val(k2_ownership_history, unk_k2_ownership_history)).

0.45::acc(s50, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values eco_commitment=Dedicated_reducing_footprint_eco_friendly_materials unk_sustainability_certification=Unknown
% @importance 0.3

0.41::true_val(sustainability_certification, eco_commitment); 0.59::true_val(sustainability_certification, unk_sustainability_certification).

measured(s50, sustainability_certification, eco_commitment).

all_consistent(sustainability_certification) :- consistent(s50, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, eco_commitment)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.68::acc(s51, k2_lineup_positioning).

% @attr k2_lineup_positioning
% @type categorical
% @canonical false
% @original_name K2 lineup positioning
% @values beginner_freestyle_category=Beginner_freestyle_alongside_Standard_FirstLite_WorldPeace_LimeLite unk_k2_lineup_positioning=Unknown
% @importance 0.65

0.64::true_val(k2_lineup_positioning, beginner_freestyle_category); 0.36::true_val(k2_lineup_positioning, unk_k2_lineup_positioning).

measured(s51, k2_lineup_positioning, beginner_freestyle_category).

all_consistent(k2_lineup_positioning) :- consistent(s51, k2_lineup_positioning).

evidence(all_consistent(k2_lineup_positioning)).
query(true_val(k2_lineup_positioning, beginner_freestyle_category)).
query(true_val(k2_lineup_positioning, unk_k2_lineup_positioning)).

0.58::acc(s52, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values k2_gateway=K2_Gateway_easy_riding_versatile unk_comparable_board_same_brand=Unknown
% @importance 0.7

0.53::true_val(comparable_board_same_brand, k2_gateway); 0.47::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s52, comparable_board_same_brand, k2_gateway).

all_consistent(comparable_board_same_brand) :- consistent(s52, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, k2_gateway)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.42::acc(s53, comparable_board_same_brand_2).

% @attr comparable_board_same_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values k2_afterblack=K2_Afterblack_advanced_freestyle_durable unk_comparable_board_same_brand_2=Unknown
% @importance 0.55

0.36::true_val(comparable_board_same_brand_2, k2_afterblack); 0.64::true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2).

measured(s53, comparable_board_same_brand_2, k2_afterblack).

all_consistent(comparable_board_same_brand_2) :- consistent(s53, comparable_board_same_brand_2).

evidence(all_consistent(comparable_board_same_brand_2)).
query(true_val(comparable_board_same_brand_2, k2_afterblack)).
query(true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2)).

0.60::acc(s54, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values yes_basic=YES_Basic_great_freestyle_beginner_forgiving unk_comparable_board_cross_brand=Unknown
% @importance 0.7

0.56::true_val(comparable_board_cross_brand, yes_basic); 0.44::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s54, comparable_board_cross_brand, yes_basic).

all_consistent(comparable_board_cross_brand) :- consistent(s54, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, yes_basic)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.55::acc(s55, comparable_board_cross_brand_2).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values rome_mechanic=Rome_Mechanic_freestyle_beginner_planted unk_comparable_board_cross_brand_2=Unknown
% @importance 0.6

0.49::true_val(comparable_board_cross_brand_2, rome_mechanic); 0.51::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).

measured(s55, comparable_board_cross_brand_2, rome_mechanic).

all_consistent(comparable_board_cross_brand_2) :- consistent(s55, comparable_board_cross_brand_2).

evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, rome_mechanic)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

0.52::acc(s56, comparable_board_cross_brand_3).

% @attr comparable_board_cross_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_instigator_cultivator=Burton_Instigator_Cultivator_beginner unk_comparable_board_cross_brand_3=Unknown
% @importance 0.6

0.49::true_val(comparable_board_cross_brand_3, burton_instigator_cultivator); 0.51::true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3).

measured(s56, comparable_board_cross_brand_3, burton_instigator_cultivator).

all_consistent(comparable_board_cross_brand_3) :- consistent(s56, comparable_board_cross_brand_3).

evidence(all_consistent(comparable_board_cross_brand_3)).
query(true_val(comparable_board_cross_brand_3, burton_instigator_cultivator)).
query(true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3)).

0.52::acc(s56, comparable_board_cross_brand_4).

% @attr comparable_board_cross_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values nitro_prime=Nitro_Prime_budget_beginner unk_comparable_board_cross_brand_4=Unknown
% @importance 0.6

0.49::true_val(comparable_board_cross_brand_4, nitro_prime); 0.51::true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4).

measured(s56, comparable_board_cross_brand_4, nitro_prime).

all_consistent(comparable_board_cross_brand_4) :- consistent(s56, comparable_board_cross_brand_4).

evidence(all_consistent(comparable_board_cross_brand_4)).
query(true_val(comparable_board_cross_brand_4, nitro_prime)).
query(true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4)).

0.58::acc(s52, comparable_board_cross_brand_5).

% @attr comparable_board_cross_brand_5
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values ride_agenda=Ride_Agenda_freestyle_hybrid_camber_soft unk_comparable_board_cross_brand_5=Unknown
% @importance 0.7

0.53::true_val(comparable_board_cross_brand_5, ride_agenda); 0.47::true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5).

measured(s52, comparable_board_cross_brand_5, ride_agenda).

all_consistent(comparable_board_cross_brand_5) :- consistent(s52, comparable_board_cross_brand_5).

evidence(all_consistent(comparable_board_cross_brand_5)).
query(true_val(comparable_board_cross_brand_5, ride_agenda)).
query(true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5)).

0.72::acc(s23, source_evo).

% @attr source_evo
% @type categorical
% @canonical false
% @original_name evo
% @values established_us_retailer=Established_major_US_online_retailer_expert_advice unk_source_evo=Unknown
% @importance 0.9

0.72::true_val(source_evo, established_us_retailer); 0.28::true_val(source_evo, unk_source_evo).

measured(s23, source_evo, established_us_retailer).

all_consistent(source_evo) :- consistent(s23, source_evo).

evidence(all_consistent(source_evo)).
query(true_val(source_evo, established_us_retailer)).
query(true_val(source_evo, unk_source_evo)).

0.62::acc(s42, source_backcountry).

% @attr source_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry/Steep&Cheap
% @values major_us_outdoor=Major_US_outdoor_retailer_editorial_reviews unk_source_backcountry=Unknown
% @importance 0.75

0.60::true_val(source_backcountry, major_us_outdoor); 0.40::true_val(source_backcountry, unk_source_backcountry).

measured(s42, source_backcountry, major_us_outdoor).

all_consistent(source_backcountry) :- consistent(s42, source_backcountry).

evidence(all_consistent(source_backcountry)).
query(true_val(source_backcountry, major_us_outdoor)).
query(true_val(source_backcountry, unk_source_backcountry)).

0.68::acc(s15, source_level_nine).

% @attr source_level_nine
% @type categorical
% @canonical false
% @original_name Level Nine Sports
% @values reputable_us_retailer=Reputable_US_retailer_lowest_price_guarantee unk_source_level_nine=Unknown
% @importance 0.9

0.67::true_val(source_level_nine, reputable_us_retailer); 0.33::true_val(source_level_nine, unk_source_level_nine).

measured(s15, source_level_nine, reputable_us_retailer).

all_consistent(source_level_nine) :- consistent(s15, source_level_nine).

evidence(all_consistent(source_level_nine)).
query(true_val(source_level_nine, reputable_us_retailer)).
query(true_val(source_level_nine, unk_source_level_nine)).

0.68::acc(s16, source_the_house).

% @attr source_the_house
% @type categorical
% @canonical false
% @original_name The House
% @values established_us_action_sports=Established_US_retailer_long_history_action_sports unk_source_the_house=Unknown
% @importance 0.9

0.67::true_val(source_the_house, established_us_action_sports); 0.33::true_val(source_the_house, unk_source_the_house).

measured(s16, source_the_house, established_us_action_sports).

all_consistent(source_the_house) :- consistent(s16, source_the_house).

evidence(all_consistent(source_the_house)).
query(true_val(source_the_house, established_us_action_sports)).
query(true_val(source_the_house, unk_source_the_house)).

0.72::acc(s14, source_milosport).

% @attr source_milosport
% @type categorical
% @canonical false
% @original_name Milosport
% @values specialty_slc_shop=Specialty_snowboard_shop_SLC_strong_reputation unk_source_milosport=Unknown
% @importance 0.9

0.71::true_val(source_milosport, specialty_slc_shop); 0.29::true_val(source_milosport, unk_source_milosport).

measured(s14, source_milosport, specialty_slc_shop).

all_consistent(source_milosport) :- consistent(s14, source_milosport).

evidence(all_consistent(source_milosport)).
query(true_val(source_milosport, specialty_slc_shop)).
query(true_val(source_milosport, unk_source_milosport)).

0.68::acc(s6, source_amazon).

% @attr source_amazon
% @type categorical
% @canonical false
% @original_name Amazon
% @values major_marketplace=Major_marketplace_K2_listed_directly unk_source_amazon=Unknown
% @importance 0.4

0.68::true_val(source_amazon, major_marketplace); 0.32::true_val(source_amazon, unk_source_amazon).

measured(s6, source_amazon, major_marketplace).

all_consistent(source_amazon) :- consistent(s6, source_amazon).

evidence(all_consistent(source_amazon)).
query(true_val(source_amazon, major_marketplace)).
query(true_val(source_amazon, unk_source_amazon)).

0.52::acc(s39, source_basenz).

% @attr source_basenz
% @type categorical
% @canonical false
% @original_name BaseNZ
% @values nz_specialty=New_Zealand_specialty_retailer unk_source_basenz=Unknown
% @importance 0.7

0.51::true_val(source_basenz, nz_specialty); 0.49::true_val(source_basenz, unk_source_basenz).

measured(s39, source_basenz, nz_specialty).

all_consistent(source_basenz) :- consistent(s39, source_basenz).

evidence(all_consistent(source_basenz)).
query(true_val(source_basenz, nz_specialty)).
query(true_val(source_basenz, unk_source_basenz)).

0.45::acc(s50, source_snowtrax).

% @attr source_snowtrax
% @type categorical
% @canonical false
% @original_name Snowtrax
% @values uk_specialty=UK_specialty_snowboard_store unk_source_snowtrax=Unknown
% @importance 0.3

0.41::true_val(source_snowtrax, uk_specialty); 0.59::true_val(source_snowtrax, unk_source_snowtrax).

measured(s50, source_snowtrax, uk_specialty).

all_consistent(source_snowtrax) :- consistent(s50, source_snowtrax).

evidence(all_consistent(source_snowtrax)).
query(true_val(source_snowtrax, uk_specialty)).
query(true_val(source_snowtrax, unk_source_snowtrax)).

0.93::acc(s21, value_positioning).

% @attr value_positioning
% @type categorical
% @canonical false
% @original_name Value positioning
% @values affordable_entry_freestyle=Affordable_entry_level_freestyle_lower_price_in_K2 unk_value_positioning=Unknown
% @importance 1.0

0.95::true_val(value_positioning, affordable_entry_freestyle_val); 0.05::true_val(value_positioning, unk_value_positioning).

measured(s21, value_positioning, affordable_entry_freestyle_val).

all_consistent(value_positioning) :- consistent(s21, value_positioning).

evidence(all_consistent(value_positioning)).
query(true_val(value_positioning, affordable_entry_freestyle_val)).
query(true_val(value_positioning, unk_value_positioning)).

0.72::acc(s41, construction_simplicity).

% @attr construction_simplicity
% @type categorical
% @canonical false
% @original_name Construction simplicity
% @values basic_no_premium=No_carbon_no_sintered_no_advanced_core_keeps_cost_down unk_construction_simplicity=Unknown
% @importance 0.65

0.68::true_val(construction_simplicity, basic_no_premium); 0.32::true_val(construction_simplicity, unk_construction_simplicity).

measured(s41, construction_simplicity, basic_no_premium).

all_consistent(construction_simplicity) :- consistent(s41, construction_simplicity).

evidence(all_consistent(construction_simplicity)).
query(true_val(construction_simplicity, basic_no_premium)).
query(true_val(construction_simplicity, unk_construction_simplicity)).

0.68::acc(s37, base_type).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values extruded_slower_durable=Extruded_slower_but_durable_easy_repair_entry_level unk_base_type=Unknown
% @importance 0.8

0.67::true_val(base_type, extruded_slower_durable); 0.33::true_val(base_type, unk_base_type).

measured(s37, base_type, extruded_slower_durable).

all_consistent(base_type) :- consistent(s37, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, extruded_slower_durable)).
query(true_val(base_type, unk_base_type)).

0.72::acc(s40, progression_potential).

% @attr progression_potential
% @type categorical
% @canonical false
% @original_name Progression potential
% @values long_to_outgrow=Suitable_beginners_long_time_to_outgrow unk_progression_potential=Unknown
% @importance 0.8

0.68::true_val(progression_potential, long_to_outgrow); 0.32::true_val(progression_potential, unk_progression_potential).

measured(s40, progression_potential, long_to_outgrow).

all_consistent(progression_potential) :- consistent(s40, progression_potential).

evidence(all_consistent(progression_potential)).
query(true_val(progression_potential, long_to_outgrow)).
query(true_val(progression_potential, unk_progression_potential)).

0.62::acc(s9, design_philosophy).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values clean_geometric_aesthetic=Clean_geometric_inspired_aesthetic unk_design_philosophy=Unknown
% @importance 0.2

0.62::true_val(design_philosophy, clean_geometric_aesthetic); 0.38::true_val(design_philosophy, unk_design_philosophy).

measured(s9, design_philosophy, clean_geometric_aesthetic).

all_consistent(design_philosophy) :- consistent(s9, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, clean_geometric_aesthetic)).
query(true_val(design_philosophy, unk_design_philosophy)).

0.65::acc(s35, topsheet).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values standard_hybritech_capped=Standard_topsheet_with_Hybritech_capped_tip_tail unk_topsheet=Unknown
% @importance 0.7

0.65::true_val(topsheet, standard_hybritech_capped); 0.35::true_val(topsheet, unk_topsheet).

measured(s35, topsheet, standard_hybritech_capped).

all_consistent(topsheet) :- consistent(s35, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, standard_hybritech_capped)).
query(true_val(topsheet, unk_topsheet)).