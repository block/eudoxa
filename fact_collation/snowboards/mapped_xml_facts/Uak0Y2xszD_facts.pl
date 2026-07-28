0.15::indep(sm).
0.20::indep(s2).
0.15::indep(s5).
0.15::indep(s19).
0.20::indep(s29).
0.20::indep(s30).
0.15::indep(s27).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values bataleon=Bataleon unk_brand=Unknown
% @importance 1.0

0.93::acc(s1, brand).

0.95::true_val(brand, bataleon); 0.05::true_val(brand, unk_brand).

measured(s1, brand, bataleon).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, bataleon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values cameleon=Cameleon unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).

0.95::true_val(model_name, cameleon); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, cameleon).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, cameleon)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.85

0.92::acc(sm, model_year).

0.93::true_val(model_year, y2027); 0.07::true_val(model_year, unk_model_year).

measured(sm, model_year, y2027).

all_consistent(model_year) :- consistent(sm, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride_powder=Freeride-Powder all_mountain_directional_freeride=All-Mountain_Directional_Freeride
% @importance 0.825

0.88::acc(sm, board_category).
0.82::acc(s2, board_category).

0.45::true_val(board_category, freeride_powder); 0.55::true_val(board_category, all_mountain_directional_freeride).

measured(sm, board_category, freeride_powder).
measured(s2, board_category, all_mountain_directional_freeride).

all_consistent(board_category) :-
    (indep(sm), consistent(sm, board_category) ; \+indep(sm)),
    (indep(s2), consistent(s2, board_category) ; \+indep(s2)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, all_mountain_directional_freeride)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unisex=Unisex
% @importance 0.7

0.93::acc(s1, gender).
0.82::acc(s4, gender).
0.70::acc(s5, gender).

0.55::true_val(gender, mens); 0.45::true_val(gender, unisex).

measured(s1, gender, mens).
measured(s4, gender, unisex).
measured(s5, gender, unisex).

all_consistent(gender) :-
    consistent(s1, gender),
    consistent(s4, gender),
    (indep(s5), consistent(s5, gender) ; \+indep(s5)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unisex)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values lps_amsterdam=Bataleon_Low_Pressure_Studio_Amsterdam unk_manufacturer=Unknown
% @importance 0.45

0.90::acc(s6, manufacturer).
0.88::acc(s7, manufacturer).

0.95::true_val(manufacturer, lps_amsterdam); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s6, manufacturer, lps_amsterdam).
measured(s7, manufacturer, lps_amsterdam).

all_consistent(manufacturer) :-
    consistent(s6, manufacturer),
    consistent(s7, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, lps_amsterdam)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y2000_karlsen=2000_by_Jorgen_Karlsen unk_manufacturer_founded=Unknown
% @importance 0.4

0.65::acc(s8, manufacturer_founded).
0.65::acc(s9, manufacturer_founded).

0.90::true_val(manufacturer_founded, y2000_karlsen); 0.10::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s8, manufacturer_founded, y2000_karlsen).
measured(s9, manufacturer_founded, y2000_karlsen).

all_consistent(manufacturer_founded) :-
    consistent(s8, manufacturer_founded),
    consistent(s9, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y2000_karlsen)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values nidecker_group=Nidecker_Group_Swiss unk_parent_company=Unknown
% @importance 0.5

0.82::acc(s10, parent_company).

0.88::true_val(parent_company, nidecker_group); 0.12::true_val(parent_company, unk_parent_company).

measured(s10, parent_company, nidecker_group).

all_consistent(parent_company) :- consistent(s10, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

% @attr parent_company_acquired_bataleon
% @type categorical
% @canonical false
% @original_name Parent company acquired Bataleon
% @values y2018_lps=2018_via_Low_Pressure_Studio unk_parent_company_acquired_bataleon=Unknown
% @importance 0.5

0.82::acc(s10, parent_company_acquired_bataleon).

0.88::true_val(parent_company_acquired_bataleon, y2018_lps); 0.12::true_val(parent_company_acquired_bataleon, unk_parent_company_acquired_bataleon).

measured(s10, parent_company_acquired_bataleon, y2018_lps).

all_consistent(parent_company_acquired_bataleon) :- consistent(s10, parent_company_acquired_bataleon).

evidence(all_consistent(parent_company_acquired_bataleon)).
query(true_val(parent_company_acquired_bataleon, y2018_lps)).
query(true_val(parent_company_acquired_bataleon, unk_parent_company_acquired_bataleon)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_mothership=Austria_CAPiTA_Mothership sws_saudi=Saudi_Arabia_SWS
% @importance 0.5

0.72::acc(s11, manufacturing_location_current).
0.78::acc(s12, manufacturing_location_current).
0.50::acc(s13, manufacturing_location_current).
0.80::acc(s14, manufacturing_location_current).

0.75::true_val(manufacturing_location_current, austria_mothership); 0.25::true_val(manufacturing_location_current, sws_saudi).

measured(s11, manufacturing_location_current, austria_mothership).
measured(s12, manufacturing_location_current, austria_mothership).
measured(s13, manufacturing_location_current, sws_saudi).
measured(s14, manufacturing_location_current, austria_mothership).

all_consistent(manufacturing_location_current) :-
    consistent(s11, manufacturing_location_current),
    consistent(s12, manufacturing_location_current),
    consistent(s13, manufacturing_location_current),
    consistent(s14, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_mothership)).
query(true_val(manufacturing_location_current, sws_saudi)).

% @attr design_studio_location
% @type categorical
% @canonical false
% @original_name Design studio location
% @values lps_amsterdam=Low_Pressure_Studio_Amsterdam unk_design_studio_location=Unknown
% @importance 0.4

0.60::acc(s15, design_studio_location).

0.80::true_val(design_studio_location, lps_amsterdam); 0.20::true_val(design_studio_location, unk_design_studio_location).

measured(s15, design_studio_location, lps_amsterdam).

all_consistent(design_studio_location) :- consistent(s15, design_studio_location).

evidence(all_consistent(design_studio_location)).
query(true_val(design_studio_location, lps_amsterdam)).
query(true_val(design_studio_location, unk_design_studio_location)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values camel_two=Camel_Two unk_predecessor_model_name=Unknown
% @importance 0.5

0.72::acc(s5, predecessor_model_name).
0.80::acc(s16, predecessor_model_name).

0.93::true_val(predecessor_model_name, camel_two); 0.07::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s5, predecessor_model_name, camel_two).
measured(s16, predecessor_model_name, camel_two).

all_consistent(predecessor_model_name) :-
    (indep(s5), consistent(s5, predecessor_model_name) ; \+indep(s5)),
    consistent(s16, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, camel_two)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2024_2025=2024_2025_season unk_model_first_available_year=Unknown
% @importance 0.7

0.82::acc(s17, model_first_available_year).
0.85::acc(s18, model_first_available_year).

0.95::true_val(model_first_available_year, season_2024_2025); 0.05::true_val(model_first_available_year, unk_model_first_available_year).

measured(s17, model_first_available_year, season_2024_2025).
measured(s18, model_first_available_year, season_2024_2025).

all_consistent(model_first_available_year) :-
    consistent(s17, model_first_available_year),
    consistent(s18, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2024_2025)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values apr_may_2026=April_May_2026 unk_estimated_availability_date=Unknown
% @importance 0.85

0.75::acc(s19, estimated_availability_date).

0.85::true_val(estimated_availability_date, apr_may_2026); 0.15::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s19, estimated_availability_date, apr_may_2026).

all_consistent(estimated_availability_date) :-
    (indep(s19), consistent(s19, estimated_availability_date) ; \+indep(s19)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, apr_may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr model_change_2026_from_2025
% @type categorical
% @canonical false
% @original_name 2026 model change from 2025
% @values graphics_only=Graphics_only unk_model_change_2026_from_2025=Unknown
% @importance 0.65

0.78::acc(s20, model_change_2026_from_2025).
0.72::acc(s21, model_change_2026_from_2025).

0.93::true_val(model_change_2026_from_2025, graphics_only); 0.07::true_val(model_change_2026_from_2025, unk_model_change_2026_from_2025).

measured(s20, model_change_2026_from_2025, graphics_only).
measured(s21, model_change_2026_from_2025, graphics_only).

all_consistent(model_change_2026_from_2025) :-
    consistent(s20, model_change_2026_from_2025),
    consistent(s21, model_change_2026_from_2025).

evidence(all_consistent(model_change_2026_from_2025)).
query(true_val(model_change_2026_from_2025, graphics_only)).
query(true_val(model_change_2026_from_2025, unk_model_change_2026_from_2025)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1149_99=1149.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(sm, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1149_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(sm, price_aud_merchant, v1149_99).

all_consistent(price_aud_merchant) :- consistent(sm, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1149_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder_may_2026=Preorder_estimated_May_1_2026 unk_availability_status=Unknown
% @importance 0.85

0.95::acc(sm, availability_status).

0.95::true_val(availability_status, preorder_may_2026); 0.05::true_val(availability_status, unk_availability_status).

measured(sm, availability_status, preorder_may_2026).

all_consistent(availability_status) :- consistent(sm, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder_may_2026)).
query(true_val(availability_status, unk_availability_status)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v689_95=689.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.90::acc(s22, price_usd_msrp).

0.95::true_val(price_usd_msrp, v689_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s22, price_usd_msrp, v689_95).

all_consistent(price_usd_msrp) :- consistent(s22, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v689_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v482_96=482.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.92::acc(s22, price_usd_evo).

0.95::true_val(price_usd_evo, v482_96); 0.05::true_val(price_usd_evo, unk_price_usd_evo).

measured(s22, price_usd_evo, v482_96).

all_consistent(price_usd_evo) :- consistent(s22, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v482_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_bataleon_direct
% @type numeric
% @unit USD
% @canonical false
% @original_name USD sale price at Bataleon direct (2025/26 model)
% @values v482_95=482.95 unk_price_usd_bataleon_direct=Unknown
% @importance 1.0

0.93::acc(s1, price_usd_bataleon_direct).

0.95::true_val(price_usd_bataleon_direct, v482_95); 0.05::true_val(price_usd_bataleon_direct, unk_price_usd_bataleon_direct).

measured(s1, price_usd_bataleon_direct, v482_95).

all_consistent(price_usd_bataleon_direct) :- consistent(s1, price_usd_bataleon_direct).

evidence(all_consistent(price_usd_bataleon_direct)).
query(true_val(price_usd_bataleon_direct, v482_95)).
query(true_val(price_usd_bataleon_direct, unk_price_usd_bataleon_direct)).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_rei
% @values v482_83=482.83 unk_price_usd_rei=Unknown
% @importance 0.95

0.93::acc(s23, price_usd_rei).

0.95::true_val(price_usd_rei, v482_83); 0.05::true_val(price_usd_rei, unk_price_usd_rei).

measured(s23, price_usd_rei, v482_83).

all_consistent(price_usd_rei) :- consistent(s23, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v482_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v482_97=482.97 unk_price_usd_backcountry=Unknown
% @importance 0.9

0.75::acc(s24, price_usd_backcountry).

0.85::true_val(price_usd_backcountry, v482_97); 0.15::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s24, price_usd_backcountry, v482_97).

all_consistent(price_usd_backcountry) :- consistent(s24, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v482_97)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_freeride_boardshop
% @type numeric
% @unit USD
% @canonical false
% @original_name USD price at Freeride Boardshop
% @values v482_00=482.0 unk_price_usd_freeride_boardshop=Unknown
% @importance 0.85

0.75::acc(s25, price_usd_freeride_boardshop).

0.82::true_val(price_usd_freeride_boardshop, v482_00); 0.18::true_val(price_usd_freeride_boardshop, unk_price_usd_freeride_boardshop).

measured(s25, price_usd_freeride_boardshop, v482_00).

all_consistent(price_usd_freeride_boardshop) :- consistent(s25, price_usd_freeride_boardshop).

evidence(all_consistent(price_usd_freeride_boardshop)).
query(true_val(price_usd_freeride_boardshop, v482_00)).
query(true_val(price_usd_freeride_boardshop, unk_price_usd_freeride_boardshop)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v660=660.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.85

0.82::acc(s26, price_eur_blue_tomato).

0.88::true_val(price_eur_blue_tomato, v660); 0.12::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s26, price_eur_blue_tomato, v660).

all_consistent(price_eur_blue_tomato) :- consistent(s26, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v660)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_2026=In_stock_2026_model unk_availability_status_evo=Unknown
% @importance 0.95

0.92::acc(s22, availability_status_evo).

0.95::true_val(availability_status_evo, in_stock_2026); 0.05::true_val(availability_status_evo, unk_availability_status_evo).

measured(s22, availability_status_evo, in_stock_2026).

all_consistent(availability_status_evo) :- consistent(s22, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_2026)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_2025_26=In_stock_2025_2026 unk_availability_status_rei=Unknown
% @importance 0.95

0.93::acc(s23, availability_status_rei).

0.95::true_val(availability_status_rei, in_stock_2025_26); 0.05::true_val(availability_status_rei, unk_availability_status_rei).

measured(s23, availability_status_rei, in_stock_2025_26).

all_consistent(availability_status_rei) :- consistent(s23, availability_status_rei).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, in_stock_2025_26)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_bataleon_direct
% @type categorical
% @canonical false
% @original_name availability_status
% @values low_stock_4_left=Low_stock_4_left unk_availability_status_bataleon_direct=Unknown
% @importance 1.0

0.93::acc(s1, availability_status_bataleon_direct).

0.93::true_val(availability_status_bataleon_direct, low_stock_4_left); 0.07::true_val(availability_status_bataleon_direct, unk_availability_status_bataleon_direct).

measured(s1, availability_status_bataleon_direct, low_stock_4_left).

all_consistent(availability_status_bataleon_direct) :- consistent(s1, availability_status_bataleon_direct).

evidence(all_consistent(availability_status_bataleon_direct)).
query(true_val(availability_status_bataleon_direct, low_stock_4_left)).
query(true_val(availability_status_bataleon_direct, unk_availability_status_bataleon_direct)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed=Listed unk_availability_status_blauer=Unknown
% @importance 0.8

0.70::acc(s27, availability_status_blauer).

0.80::true_val(availability_status_blauer, listed); 0.20::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s27, availability_status_blauer, listed).

all_consistent(availability_status_blauer) :- consistent(s27, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, listed)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_balmoral
% @type categorical
% @canonical false
% @original_name availability_status
% @values preorder_apr_may_2026=Pre_order_April_May_2026 unk_availability_status_balmoral=Unknown
% @importance 0.85

0.75::acc(s19, availability_status_balmoral).

0.85::true_val(availability_status_balmoral, preorder_apr_may_2026); 0.15::true_val(availability_status_balmoral, unk_availability_status_balmoral).

measured(s19, availability_status_balmoral, preorder_apr_may_2026).

all_consistent(availability_status_balmoral) :-
    (indep(s19), consistent(s19, availability_status_balmoral) ; \+indep(s19)).

evidence(all_consistent(availability_status_balmoral)).
query(true_val(availability_status_balmoral, preorder_apr_may_2026)).
query(true_val(availability_status_balmoral, unk_availability_status_balmoral)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_melb=Listed unk_availability_status_melbourne=Unknown
% @importance 0.7

0.72::acc(s5, availability_status_melbourne).

0.82::true_val(availability_status_melbourne, listed_melb); 0.18::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s5, availability_status_melbourne, listed_melb).

all_consistent(availability_status_melbourne) :-
    (indep(s5), consistent(s5, availability_status_melbourne) ; \+indep(s5)).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, listed_melb)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr shipping_restriction_merchant
% @type categorical
% @canonical false
% @original_name Shipping restriction (merchant)
% @values australia_only=Only_available_for_shipping_within_Australia unk_shipping_restriction_merchant=Unknown
% @importance 0.85

0.93::acc(sm, shipping_restriction_merchant).

0.95::true_val(shipping_restriction_merchant, australia_only); 0.05::true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant).

measured(sm, shipping_restriction_merchant, australia_only).

all_consistent(shipping_restriction_merchant) :- consistent(sm, shipping_restriction_merchant).

evidence(all_consistent(shipping_restriction_merchant)).
query(true_val(shipping_restriction_merchant, australia_only)).
query(true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v5=5.0 unk_flex_rating_10=Unknown
% @importance 0.925

0.93::acc(s1, flex_rating_10).
0.88::acc(sm, flex_rating_10).

0.95::true_val(flex_rating_10, v5); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s1, flex_rating_10, v5).
measured(sm, flex_rating_10, v5).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.925

0.93::acc(s1, shape).
0.88::acc(sm, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).
measured(sm, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(sm), consistent(sm, shape) ; \+indep(sm)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values medium_camber_3bt_sidekick=Medium_Camber_with_3BT_and_SideKick unk_camber_type=Unknown
% @importance 0.925

0.93::acc(s1, camber_type).
0.88::acc(sm, camber_type).

0.95::true_val(camber_type, medium_camber_3bt_sidekick); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, medium_camber_3bt_sidekick).
measured(sm, camber_type, medium_camber_3bt_sidekick).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(sm), consistent(sm, camber_type) ; \+indep(sm)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, medium_camber_3bt_sidekick)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values tbt_3bt_reduces_edge_catch=3BT_reduces_edge_catch_maintains_ollie_and_carving unk_camber_description=Unknown
% @importance 0.925

0.93::acc(s1, camber_description).
0.88::acc(sm, camber_description).

0.95::true_val(camber_description, tbt_3bt_reduces_edge_catch); 0.05::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, tbt_3bt_reduces_edge_catch).
measured(sm, camber_description, tbt_3bt_reduces_edge_catch).

all_consistent(camber_description) :-
    consistent(s1, camber_description),
    (indep(sm), consistent(sm, camber_description) ; \+indep(sm)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, tbt_3bt_reduces_edge_catch)).
query(true_val(camber_description, unk_camber_description)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values sidekick_hull_float=SideKick_hull_like_shape_for_float unk_edge_technology=Unknown
% @importance 0.9

0.93::acc(s1, edge_technology).
0.88::acc(s28, edge_technology).

0.95::true_val(edge_technology, sidekick_hull_float); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, sidekick_hull_float).
measured(s28, edge_technology, sidekick_hull_float).

all_consistent(edge_technology) :-
    consistent(s1, edge_technology),
    consistent(s28, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, sidekick_hull_float)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard=Standard unk_width_options=Unknown
% @importance 0.85

0.90::acc(sm, width_options).

0.93::true_val(width_options, standard); 0.07::true_val(width_options, unk_width_options).

measured(sm, width_options, standard).

all_consistent(width_options) :-
    (indep(sm), consistent(sm, width_options) ; \+indep(sm)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.90::acc(sm, mounting_pattern).

0.93::true_val(mounting_pattern, inserts_2x4); 0.07::true_val(mounting_pattern, unk_mounting_pattern).

measured(sm, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(sm), consistent(sm, mounting_pattern) ; \+indep(sm)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr insert_count
% @type numeric
% @unit count
% @canonical false
% @original_name Insert count
% @values v24=24.0 unk_insert_count=Unknown
% @importance 1.0

0.93::acc(s1, insert_count).

0.93::true_val(insert_count, v24); 0.07::true_val(insert_count, unk_insert_count).

measured(s1, insert_count, v24).

all_consistent(insert_count) :- consistent(s1, insert_count).

evidence(all_consistent(insert_count)).
query(true_val(insert_count, v24)).
query(true_val(insert_count, unk_insert_count)).

% @attr nose_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Nose sidebase uplift
% @values medium=Medium high=High
% @importance 0.883

0.93::acc(s1, nose_sidebase_uplift).
0.88::acc(sm, nose_sidebase_uplift).
0.72::acc(s29, nose_sidebase_uplift).
0.70::acc(s19, nose_sidebase_uplift).

0.55::true_val(nose_sidebase_uplift, medium); 0.45::true_val(nose_sidebase_uplift, high).

measured(s1, nose_sidebase_uplift, medium).
measured(sm, nose_sidebase_uplift, medium).
measured(s29, nose_sidebase_uplift, high).
measured(s19, nose_sidebase_uplift, high).

all_consistent(nose_sidebase_uplift) :-
    consistent(s1, nose_sidebase_uplift),
    (indep(sm), consistent(sm, nose_sidebase_uplift) ; \+indep(sm)),
    (indep(s29), consistent(s29, nose_sidebase_uplift) ; \+indep(s29)),
    (indep(s19), consistent(s19, nose_sidebase_uplift) ; \+indep(s19)).

evidence(all_consistent(nose_sidebase_uplift)).
query(true_val(nose_sidebase_uplift, medium)).
query(true_val(nose_sidebase_uplift, high)).

% @attr tail_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Tail sidebase uplift
% @values medium=Medium unk_tail_sidebase_uplift=Unknown
% @importance 0.925

0.93::acc(s1, tail_sidebase_uplift).
0.88::acc(sm, tail_sidebase_uplift).

0.95::true_val(tail_sidebase_uplift, medium); 0.05::true_val(tail_sidebase_uplift, unk_tail_sidebase_uplift).

measured(s1, tail_sidebase_uplift, medium).
measured(sm, tail_sidebase_uplift, medium).

all_consistent(tail_sidebase_uplift) :-
    consistent(s1, tail_sidebase_uplift),
    (indep(sm), consistent(sm, tail_sidebase_uplift) ; \+indep(sm)).

evidence(all_consistent(tail_sidebase_uplift)).
query(true_val(tail_sidebase_uplift, medium)).
query(true_val(tail_sidebase_uplift, unk_tail_sidebase_uplift)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values ultra_glide_s_7000=Ultra_Glide_S_7000_grade_sintered unk_base_material=Unknown
% @importance 0.9

0.93::acc(s1, base_material).
0.85::acc(s30, base_material).

0.95::true_val(base_material, ultra_glide_s_7000); 0.05::true_val(base_material, unk_base_material).

measured(s1, base_material, ultra_glide_s_7000).
measured(s30, base_material, ultra_glide_s_7000).

all_consistent(base_material) :-
    consistent(s1, base_material),
    (indep(s30), consistent(s30, base_material) ; \+indep(s30)).

evidence(all_consistent(base_material)).
query(true_val(base_material, ultra_glide_s_7000)).
query(true_val(base_material, unk_base_material)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values paulownia_poplar_70_30=70_30_Paulownia_Poplar swiss_paulownia_poplar=Swiss_Paulownia_Poplar
% @importance 0.75

0.93::acc(s1, core_material).
0.82::acc(s31, core_material).
0.78::acc(s32, core_material).
0.72::acc(s29, core_material).

0.65::true_val(core_material, paulownia_poplar_70_30); 0.35::true_val(core_material, swiss_paulownia_poplar).

measured(s1, core_material, paulownia_poplar_70_30).
measured(s31, core_material, paulownia_poplar_70_30).
measured(s32, core_material, paulownia_poplar_70_30).
measured(s29, core_material, swiss_paulownia_poplar).

all_consistent(core_material) :-
    consistent(s1, core_material),
    consistent(s31, core_material),
    consistent(s32, core_material),
    (indep(s29), consistent(s29, core_material) ; \+indep(s29)).

evidence(all_consistent(core_material)).
query(true_val(core_material, paulownia_poplar_70_30)).
query(true_val(core_material, swiss_paulownia_poplar)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values tri_ax=Tri_Ax_fiberglass unk_laminate=Unknown
% @importance 0.9

0.93::acc(s1, laminate).
0.85::acc(s30, laminate).

0.95::true_val(laminate, tri_ax); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, tri_ax).
measured(s30, laminate, tri_ax).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(s30), consistent(s30, laminate) ; \+indep(s30)).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values drst_supertubes=DRST_SuperTubes_six_hollow_carbon_cylinders unk_construction_material_innovation=Unknown
% @importance 0.875

0.93::acc(s1, construction_material_innovation).
0.83::acc(s33, construction_material_innovation).

0.95::true_val(construction_material_innovation, drst_supertubes); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, drst_supertubes).
measured(s33, construction_material_innovation, drst_supertubes).

all_consistent(construction_material_innovation) :-
    consistent(s1, construction_material_innovation),
    consistent(s33, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, drst_supertubes)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_carbon
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values carbon_stringers=Additional_carbon_stringers_in_layup unk_construction_material_innovation_carbon=Unknown
% @importance 0.825

0.93::acc(s1, construction_material_innovation_carbon).
0.82::acc(s34, construction_material_innovation_carbon).

0.95::true_val(construction_material_innovation_carbon, carbon_stringers); 0.05::true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon).

measured(s1, construction_material_innovation_carbon, carbon_stringers).
measured(s34, construction_material_innovation_carbon, carbon_stringers).

all_consistent(construction_material_innovation_carbon) :-
    consistent(s1, construction_material_innovation_carbon),
    consistent(s34, construction_material_innovation_carbon).

evidence(all_consistent(construction_material_innovation_carbon)).
query(true_val(construction_material_innovation_carbon, carbon_stringers)).
query(true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values flex_walls_urethane=Flex_Walls_urethane_poured unk_sidewall_material=Unknown
% @importance 0.9

0.93::acc(s1, sidewall_material).
0.85::acc(s30, sidewall_material).

0.95::true_val(sidewall_material, flex_walls_urethane); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s1, sidewall_material, flex_walls_urethane).
measured(s30, sidewall_material, flex_walls_urethane).

all_consistent(sidewall_material) :-
    consistent(s1, sidewall_material),
    (indep(s30), consistent(s30, sidewall_material) ; \+indep(s30)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, flex_walls_urethane)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr tail_technology
% @type categorical
% @canonical false
% @original_name Tail technology
% @values flex_tail_urethane=Flex_Tail_urethane_strip_surf_like_feel unk_tail_technology=Unknown
% @importance 0.925

0.93::acc(s1, tail_technology).
0.88::acc(sm, tail_technology).

0.95::true_val(tail_technology, flex_tail_urethane); 0.05::true_val(tail_technology, unk_tail_technology).

measured(s1, tail_technology, flex_tail_urethane).
measured(sm, tail_technology, flex_tail_urethane).

all_consistent(tail_technology) :-
    consistent(s1, tail_technology),
    (indep(sm), consistent(sm, tail_technology) ; \+indep(sm)).

evidence(all_consistent(tail_technology)).
query(true_val(tail_technology, flex_tail_urethane)).
query(true_val(tail_technology, unk_tail_technology)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values step_down_rails_top_3d=Step_Down_Rails_Top_3D unk_topsheet=Unknown
% @importance 0.9

0.93::acc(s1, topsheet).
0.85::acc(s30, topsheet).

0.95::true_val(topsheet, step_down_rails_top_3d); 0.05::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, step_down_rails_top_3d).
measured(s30, topsheet, step_down_rails_top_3d).

all_consistent(topsheet) :-
    consistent(s1, topsheet),
    (indep(s30), consistent(s30, topsheet) ; \+indep(s30)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, step_down_rails_top_3d)).
query(true_val(topsheet, unk_topsheet)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v15=15.0 unk_taper=Unknown
% @importance 0.8

0.82::acc(s32, taper).

0.85::true_val(taper, v15); 0.15::true_val(taper, unk_taper).

measured(s32, taper, v15).

all_consistent(taper) :- consistent(s32, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v15)).
query(true_val(taper, unk_taper)).

% @attr volume_score
% @type numeric
% @unit /100
% @canonical false
% @original_name Volume score
% @values v79=79.0 unk_volume_score=Unknown
% @importance 0.7

0.72::acc(s29, volume_score).

0.78::true_val(volume_score, v79); 0.22::true_val(volume_score, unk_volume_score).

measured(s29, volume_score, v79).

all_consistent(volume_score) :-
    (indep(s29), consistent(s29, volume_score) ; \+indep(s29)).

evidence(all_consistent(volume_score)).
query(true_val(volume_score, v79)).
query(true_val(volume_score, unk_volume_score)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values black=Black unk_available_colors=Unknown
% @importance 0.8

0.78::acc(s32, available_colors).

0.83::true_val(available_colors, black); 0.17::true_val(available_colors, unk_available_colors).

measured(s32, available_colors, black).

all_consistent(available_colors) :- consistent(s32, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, black)).
query(true_val(available_colors, unk_available_colors)).

% @attr available_sizes_149
% @type categorical
% @canonical false
% @original_name available_sizes
% @values v149cm=149cm unk_available_sizes_149=Unknown
% @importance 0.925

0.93::acc(s1, available_sizes_149).
0.88::acc(sm, available_sizes_149).

0.95::true_val(available_sizes_149, v149cm); 0.05::true_val(available_sizes_149, unk_available_sizes_149).

measured(s1, available_sizes_149, v149cm).
measured(sm, available_sizes_149, v149cm).

all_consistent(available_sizes_149) :-
    consistent(s1, available_sizes_149),
    (indep(sm), consistent(sm, available_sizes_149) ; \+indep(sm)).

evidence(all_consistent(available_sizes_149)).
query(true_val(available_sizes_149, v149cm)).
query(true_val(available_sizes_149, unk_available_sizes_149)).

% @attr effective_edge_149
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (149cm)
% @values v111_5=111.5 unk_effective_edge_149=Unknown
% @importance 0.925

0.93::acc(s1, effective_edge_149).
0.88::acc(sm, effective_edge_149).

0.95::true_val(effective_edge_149, v111_5); 0.05::true_val(effective_edge_149, unk_effective_edge_149).

measured(s1, effective_edge_149, v111_5).
measured(sm, effective_edge_149, v111_5).

all_consistent(effective_edge_149) :-
    consistent(s1, effective_edge_149),
    (indep(sm), consistent(sm, effective_edge_149) ; \+indep(sm)).

evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v111_5)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

% @attr sidecut_radius_size_149
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v6_58=6.58 unk_sidecut_radius_size_149=Unknown
% @importance 0.925

0.93::acc(s1, sidecut_radius_size_149).
0.88::acc(sm, sidecut_radius_size_149).

0.95::true_val(sidecut_radius_size_149, v6_58); 0.05::true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149).

measured(s1, sidecut_radius_size_149, v6_58).
measured(sm, sidecut_radius_size_149, v6_58).

all_consistent(sidecut_radius_size_149) :-
    consistent(s1, sidecut_radius_size_149),
    (indep(sm), consistent(sm, sidecut_radius_size_149) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_149)).
query(true_val(sidecut_radius_size_149, v6_58)).
query(true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149)).

% @attr tip_tail_width_size_149
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @values w30_3_29_0=30.3_29.0cm unk_tip_tail_width_size_149=Unknown
% @importance 0.925

0.93::acc(s1, tip_tail_width_size_149).
0.88::acc(sm, tip_tail_width_size_149).

0.95::true_val(tip_tail_width_size_149, w30_3_29_0); 0.05::true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149).

measured(s1, tip_tail_width_size_149, w30_3_29_0).
measured(sm, tip_tail_width_size_149, w30_3_29_0).

all_consistent(tip_tail_width_size_149) :-
    consistent(s1, tip_tail_width_size_149),
    (indep(sm), consistent(sm, tip_tail_width_size_149) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size_149)).
query(true_val(tip_tail_width_size_149, w30_3_29_0)).
query(true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149)).

% @attr waist_width_149
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (149cm)
% @values v25_2=25.2 unk_waist_width_149=Unknown
% @importance 0.925

0.93::acc(s1, waist_width_149).
0.88::acc(sm, waist_width_149).

0.95::true_val(waist_width_149, v25_2); 0.05::true_val(waist_width_149, unk_waist_width_149).

measured(s1, waist_width_149, v25_2).
measured(sm, waist_width_149, v25_2).

all_consistent(waist_width_149) :-
    consistent(s1, waist_width_149),
    (indep(sm), consistent(sm, waist_width_149) ; \+indep(sm)).

evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v25_2)).
query(true_val(waist_width_149, unk_waist_width_149)).

% @attr stance_width_range_size_149
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values r46_0_58_0=46.0-58.0cm unk_stance_width_range_size_149=Unknown
% @importance 0.925

0.93::acc(s1, stance_width_range_size_149).
0.88::acc(sm, stance_width_range_size_149).

0.95::true_val(stance_width_range_size_149, r46_0_58_0); 0.05::true_val(stance_width_range_size_149, unk_stance_width_range_size_149).

measured(s1, stance_width_range_size_149, r46_0_58_0).
measured(sm, stance_width_range_size_149, r46_0_58_0).

all_consistent(stance_width_range_size_149) :-
    consistent(s1, stance_width_range_size_149),
    (indep(sm), consistent(sm, stance_width_range_size_149) ; \+indep(sm)).

evidence(all_consistent(stance_width_range_size_149)).
query(true_val(stance_width_range_size_149, r46_0_58_0)).
query(true_val(stance_width_range_size_149, unk_stance_width_range_size_149)).

% @attr recommended_weight_range_size_149
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r56_76=56-76kg unk_recommended_weight_range_size_149=Unknown
% @importance 0.925

0.93::acc(s1, recommended_weight_range_size_149).
0.88::acc(sm, recommended_weight_range_size_149).

0.95::true_val(recommended_weight_range_size_149, r56_76); 0.05::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).

measured(s1, recommended_weight_range_size_149, r56_76).
measured(sm, recommended_weight_range_size_149, r56_76).

all_consistent(recommended_weight_range_size_149) :-
    consistent(s1, recommended_weight_range_size_149),
    (indep(sm), consistent(sm, recommended_weight_range_size_149) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, r56_76)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

% @attr boot_size_eu_149
% @type categorical
% @canonical false
% @original_name Boot size EU (149cm)
% @values eu37_42=37-42 unk_boot_size_eu_149=Unknown
% @importance 1.0

0.93::acc(s1, boot_size_eu_149).

0.93::true_val(boot_size_eu_149, eu37_42); 0.07::true_val(boot_size_eu_149, unk_boot_size_eu_149).

measured(s1, boot_size_eu_149, eu37_42).

all_consistent(boot_size_eu_149) :- consistent(s1, boot_size_eu_149).

evidence(all_consistent(boot_size_eu_149)).
query(true_val(boot_size_eu_149, eu37_42)).
query(true_val(boot_size_eu_149, unk_boot_size_eu_149)).

% @attr boot_size_us_149
% @type categorical
% @canonical false
% @original_name Boot size US (149cm)
% @values us5_8=5-8 unk_boot_size_us_149=Unknown
% @importance 1.0

0.93::acc(s1, boot_size_us_149).

0.93::true_val(boot_size_us_149, us5_8); 0.07::true_val(boot_size_us_149, unk_boot_size_us_149).

measured(s1, boot_size_us_149, us5_8).

all_consistent(boot_size_us_149) :- consistent(s1, boot_size_us_149).

evidence(all_consistent(boot_size_us_149)).
query(true_val(boot_size_us_149, us5_8)).
query(true_val(boot_size_us_149, unk_boot_size_us_149)).

% @attr available_sizes_153
% @type categorical
% @canonical false
% @original_name available_sizes
% @values v153cm=153cm unk_available_sizes_153=Unknown
% @importance 0.925

0.93::acc(s1, available_sizes_153).
0.88::acc(sm, available_sizes_153).

0.95::true_val(available_sizes_153, v153cm); 0.05::true_val(available_sizes_153, unk_available_sizes_153).

measured(s1, available_sizes_153, v153cm).
measured(sm, available_sizes_153, v153cm).

all_consistent(available_sizes_153) :-
    consistent(s1, available_sizes_153),
    (indep(sm), consistent(sm, available_sizes_153) ; \+indep(sm)).

evidence(all_consistent(available_sizes_153)).
query(true_val(available_sizes_153, v153cm)).
query(true_val(available_sizes_153, unk_available_sizes_153)).

% @attr effective_edge_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (153cm)
% @values v114_9=114.9 unk_effective_edge_153=Unknown
% @importance 0.925

0.93::acc(s1, effective_edge_153).
0.88::acc(sm, effective_edge_153).

0.95::true_val(effective_edge_153, v114_9); 0.05::true_val(effective_edge_153, unk_effective_edge_153).

measured(s1, effective_edge_153, v114_9).
measured(sm, effective_edge_153, v114_9).

all_consistent(effective_edge_153) :-
    consistent(s1, effective_edge_153),
    (indep(sm), consistent(sm, effective_edge_153) ; \+indep(sm)).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v114_9)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

% @attr sidecut_radius_size_153
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v6_71=6.71 unk_sidecut_radius_size_153=Unknown
% @importance 0.925

0.93::acc(s1, sidecut_radius_size_153).
0.88::acc(sm, sidecut_radius_size_153).

0.95::true_val(sidecut_radius_size_153, v6_71); 0.05::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(s1, sidecut_radius_size_153, v6_71).
measured(sm, sidecut_radius_size_153, v6_71).

all_consistent(sidecut_radius_size_153) :-
    consistent(s1, sidecut_radius_size_153),
    (indep(sm), consistent(sm, sidecut_radius_size_153) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v6_71)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

% @attr tip_tail_width_size_153
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @values w30_9_29_5=30.9_29.5cm unk_tip_tail_width_size_153=Unknown
% @importance 0.925

0.93::acc(s1, tip_tail_width_size_153).
0.88::acc(sm, tip_tail_width_size_153).

0.95::true_val(tip_tail_width_size_153, w30_9_29_5); 0.05::true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153).

measured(s1, tip_tail_width_size_153, w30_9_29_5).
measured(sm, tip_tail_width_size_153, w30_9_29_5).

all_consistent(tip_tail_width_size_153) :-
    consistent(s1, tip_tail_width_size_153),
    (indep(sm), consistent(sm, tip_tail_width_size_153) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, w30_9_29_5)).
query(true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153)).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (153cm)
% @values v25_6=25.6 unk_waist_width_153=Unknown
% @importance 0.925

0.93::acc(s1, waist_width_153).
0.88::acc(sm, waist_width_153).

0.95::true_val(waist_width_153, v25_6); 0.05::true_val(waist_width_153, unk_waist_width_153).

measured(s1, waist_width_153, v25_6).
measured(sm, waist_width_153, v25_6).

all_consistent(waist_width_153) :-
    consistent(s1, waist_width_153),
    (indep(sm), consistent(sm, waist_width_153) ; \+indep(sm)).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_6)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr stance_width_range_size_153
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values r49_0_61_0=49.0-61.0cm unk_stance_width_range_size_153=Unknown
% @importance 0.925

0.93::acc(s1, stance_width_range_size_153).
0.88::acc(sm, stance_width_range_size_153).

0.95::true_val(stance_width_range_size_153, r49_0_61_0); 0.05::true_val(stance_width_range_size_153, unk_stance_width_range_size_153).

measured(s1, stance_width_range_size_153, r49_0_61_0).
measured(sm, stance_width_range_size_153, r49_0_61_0).

all_consistent(stance_width_range_size_153) :-
    consistent(s1, stance_width_range_size_153),
    (indep(sm), consistent(sm, stance_width_range_size_153) ; \+indep(sm)).

evidence(all_consistent(stance_width_range_size_153)).
query(true_val(stance_width_range_size_153, r49_0_61_0)).
query(true_val(stance_width_range_size_153, unk_stance_width_range_size_153)).

% @attr recommended_weight_range_size_153
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r63_83=63-83kg unk_recommended_weight_range_size_153=Unknown
% @importance 0.925

0.93::acc(s1, recommended_weight_range_size_153).
0.88::acc(sm, recommended_weight_range_size_153).

0.95::true_val(recommended_weight_range_size_153, r63_83); 0.05::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).

measured(s1, recommended_weight_range_size_153, r63_83).
measured(sm, recommended_weight_range_size_153, r63_83).

all_consistent(recommended_weight_range_size_153) :-
    consistent(s1, recommended_weight_range_size_153),
    (indep(sm), consistent(sm, recommended_weight_range_size_153) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, r63_83)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

% @attr boot_size_eu_153
% @type categorical
% @canonical false
% @original_name Boot size EU (153cm)
% @values eu39_44=39-44 unk_boot_size_eu_153=Unknown
% @importance 1.0

0.93::acc(s1, boot_size_eu_153).

0.93::true_val(boot_size_eu_153, eu39_44); 0.07::true_val(boot_size_eu_153, unk_boot_size_eu_153).

measured(s1, boot_size_eu_153, eu39_44).

all_consistent(boot_size_eu_153) :- consistent(s1, boot_size_eu_153).

evidence(all_consistent(boot_size_eu_153)).
query(true_val(boot_size_eu_153, eu39_44)).
query(true_val(boot_size_eu_153, unk_boot_size_eu_153)).

% @attr boot_size_us_153
% @type categorical
% @canonical false
% @original_name Boot size US (153cm)
% @values us7_10=7-10 unk_boot_size_us_153=Unknown
% @importance 1.0

0.93::acc(s1, boot_size_us_153).

0.93::true_val(boot_size_us_153, us7_10); 0.07::true_val(boot_size_us_153, unk_boot_size_us_153).

measured(s1, boot_size_us_153, us7_10).

all_consistent(boot_size_us_153) :- consistent(s1, boot_size_us_153).

evidence(all_consistent(boot_size_us_153)).
query(true_val(boot_size_us_153, us7_10)).
query(true_val(boot_size_us_153, unk_boot_size_us_153)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values v157cm=157cm unk_available_sizes=Unknown
% @importance 0.925

0.93::acc(s1, available_sizes).
0.88::acc(sm, available_sizes).

0.95::true_val(available_sizes, v157cm); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, v157cm).
measured(sm, available_sizes, v157cm).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes),
    (indep(sm), consistent(sm, available_sizes) ; \+indep(sm)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, v157cm)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr effective_edge_157
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (157cm)
% @values v118_3=118.3 unk_effective_edge_157=Unknown
% @importance 0.925

0.93::acc(s1, effective_edge_157).
0.88::acc(sm, effective_edge_157).

0.95::true_val(effective_edge_157, v118_3); 0.05::true_val(effective_edge_157, unk_effective_edge_157).

measured(s1, effective_edge_157, v118_3).
measured(sm, effective_edge_157, v118_3).

all_consistent(effective_edge_157) :-
    consistent(s1, effective_edge_157),
    (indep(sm), consistent(sm, effective_edge_157) ; \+indep(sm)).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v118_3)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v6_83=6.83 unk_sidecut_radius_size=Unknown
% @importance 0.925

0.93::acc(s1, sidecut_radius_size).
0.88::acc(sm, sidecut_radius_size).

0.95::true_val(sidecut_radius_size, v6_83); 0.05::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v6_83).
measured(sm, sidecut_radius_size, v6_83).

all_consistent(sidecut_radius_size) :-
    consistent(s1, sidecut_radius_size),
    (indep(sm), consistent(sm, sidecut_radius_size) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v6_83)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @values w31_5_30_1=31.5_30.1cm unk_tip_tail_width_size=Unknown
% @importance 0.925

0.93::acc(s1, tip_tail_width_size).
0.88::acc(sm, tip_tail_width_size).

0.95::true_val(tip_tail_width_size, w31_5_30_1); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, w31_5_30_1).
measured(sm, tip_tail_width_size, w31_5_30_1).

all_consistent(tip_tail_width_size) :-
    consistent(s1, tip_tail_width_size),
    (indep(sm), consistent(sm, tip_tail_width_size) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, w31_5_30_1)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_157
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (157cm)
% @values v26_0=26.0 unk_waist_width_157=Unknown
% @importance 0.925

0.93::acc(s1, waist_width_157).
0.88::acc(sm, waist_width_157).

0.95::true_val(waist_width_157, v26_0); 0.05::true_val(waist_width_157, unk_waist_width_157).

measured(s1, waist_width_157, v26_0).
measured(sm, waist_width_157, v26_0).

all_consistent(waist_width_157) :-
    consistent(s1, waist_width_157),
    (indep(sm), consistent(sm, waist_width_157) ; \+indep(sm)).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v26_0)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr stance_width_range_size
% @type categorical
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values r51_0_63_0=51.0-63.0cm unk_stance_width_range_size=Unknown
% @importance 0.925

0.93::acc(s1, stance_width_range_size).
0.88::acc(sm, stance_width_range_size).

0.95::true_val(stance_width_range_size, r51_0_63_0); 0.05::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, r51_0_63_0).
measured(sm, stance_width_range_size, r51_0_63_0).

all_consistent(stance_width_range_size) :-
    consistent(s1, stance_width_range_size),
    (indep(sm), consistent(sm, stance_width_range_size) ; \+indep(sm)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r51_0_63_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values r71_91=71-91kg unk_recommended_weight_range_size=Unknown
% @importance 0.925

0.93::acc(s1, recommended_weight_range_size).
0.88::acc(sm, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, r71_91); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, r71_91).
measured(sm, recommended_weight_range_size, r71_91).

all_consistent(recommended_weight_range_size) :-
    consistent(s1, recommended_weight_range_size),
    (indep(sm), consistent(sm, recommended_weight_range_size) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r71_91)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr boot_size_eu_157
% @type categorical
% @canonical false
% @original_name Boot size EU (157cm)
% @values eu42_46=42-46 unk_boot_size_eu_157=Unknown
% @importance 1.0

0.93::acc(s1, boot_size_eu_157).

0.93::true_val(boot_size_eu_157, eu42_46); 0.07::true_val(boot_size_eu_157, unk_boot_size_eu_157).

measured(s1, boot_size_eu_157, eu42_46).

all_consistent(boot_size_eu_157) :- consistent(s1, boot_size_eu_157).

evidence(all_consistent(boot_size_eu_157)).
query(true_val(boot_size_eu_157, eu42_46)).
query(true_val(boot_size_eu_157, unk_boot_size_eu_157)).

% @attr boot_size_us_157
% @type categorical
% @canonical false
% @original_name Boot size US (157cm)
% @values us8_12=8-12 unk_boot_size_us_157=Unknown
% @importance 1.0

0.93::acc(s1, boot_size_us_157).

0.93::true_val(boot_size_us_157, us8_12); 0.07::true_val(boot_size_us_157, unk_boot_size_us_157).

measured(s1, boot_size_us_157, us8_12).

all_consistent(boot_size_us_157) :- consistent(s1, boot_size_us_157).

evidence(all_consistent(boot_size_us_157)).
query(true_val(boot_size_us_157, us8_12)).
query(true_val(boot_size_us_157, unk_boot_size_us_157)).

% @attr available_sizes_161
% @type categorical
% @canonical false
% @original_name available_sizes
% @values v161cm=161cm unk_available_sizes_161=Unknown
% @importance 0.925

0.93::acc(s1, available_sizes_161).
0.88::acc(sm, available_sizes_161).

0.95::true_val(available_sizes_161, v161cm); 0.05::true_val(available_sizes_161, unk_available_sizes_161).

measured(s1, available_sizes_161, v161cm).
measured(sm, available_sizes_161, v161cm).

all_consistent(available_sizes_161) :-
    consistent(s1, available_sizes_161),
    (indep(sm), consistent(sm, available_sizes_161) ; \+indep(sm)).

evidence(all_consistent(available_sizes_161)).
query(true_val(available_sizes_161, v161cm)).
query(true_val(available_sizes_161, unk_available_sizes_161)).

% @attr effective_edge_161
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (161cm)
% @values v121_7=121.7 unk_effective_edge_161=Unknown
% @importance 0.925

0.93::acc(s1, effective_edge_161).
0.88::acc(sm, effective_edge_161).

0.95::true_val(effective_edge_161, v121_7); 0.05::true_val(effective_edge_161, unk_effective_edge_161).

measured(s1, effective_edge_161, v121_7).
measured(sm, effective_edge_161, v121_7).

all_consistent(effective_edge_161) :-
    consistent(s1, effective_edge_161),
    (indep(sm), consistent(sm, effective_edge_161) ; \+indep(sm)).

evidence(all_consistent(effective_edge_161)).
query(true_val(effective_edge_161, v121_7)).
query(true_val(effective_edge_161, unk_effective_edge_161)).

% @attr sidecut_radius_size_161
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v6_95=6.95 unk_sidecut_radius_size_161=Unknown
% @importance 0.925

0.93::acc(s1, sidecut_radius_size_161).
0.88::acc(sm, sidecut_radius_size_161).

0.95::true_val(sidecut_radius_size_161, v6_95); 0.05::true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161).

measured(s1, sidecut_radius_size_161, v6_95).
measured(sm, sidecut_radius_size_161, v6_95).

all_consistent(sidecut_radius_size_161) :-
    consistent(s1, sidecut_radius_size_161),
    (indep(sm), consistent(sm, sidecut_radius_size_161) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_161)).
query(true_val(sidecut_radius_size_161, v6_95)).
query(true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161)).

% @attr tip_tail_width_size_161
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @values w32_1_30_7=32.1_30.7cm unk_tip_tail_width_size_161=Unknown
% @importance 0.925

0.93::acc(s1, tip_tail_width_size_161).
0.88::acc(sm, tip_tail_width_size_161).

0.95::true_val(tip_tail_width_size_161, w32_1_30_7); 0.05::true_val(tip_tail_width_size_161, unk_tip_tail_width_size_161).

measured(s1, tip_tail_width_size_161, w32_1_30_7).
measured(sm, tip_tail_width_size_161, w32_1_30_7).

all_consistent(tip_tail_width_size_161) :-
    consistent(s1, tip_tail_width_size_161),
    (indep(sm), consistent(sm, tip_tail_width_size_161) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size_161)).
query(true_val(tip_tail_width_size_161, w32_1_30_7)).
query(true_val(tip_tail_width_size_161, unk_tip_tail_width_size_161)).

% @attr waist_width_161
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (161cm)
% @values v26_4=26.4 unk_waist_width_161=Unknown
% @importance 0.925

0.93::acc(s1, waist_width_161).
0.88::acc(sm, waist_width_161).

0.95::true_val(waist_width_161, v26_4); 0.05::true_val(waist_width_161, unk_waist_width_161).

measured(s1, waist_width_161, v26_4).
measured(sm, waist_width_161, v26_4).

all_consistent(waist_width_161) :-
    consistent(s1, waist_width_161),
    (indep(sm), consistent(sm, waist_width_161) ; \+indep(sm)).

evidence(all_consistent(waist_width_161)).
query(true_val(waist_width_161, v26_4)).
query(true_val(waist_width_161, unk_waist_width_161)).

% @attr stance_width_range_size_161
% @type categorical
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values r52_0_64_0=52.0-64.0cm unk_stance_width_range_size_161=Unknown
% @importance 0.925

0.93::acc(s1, stance_width_range_size_161).
0.88::acc(sm, stance_width_range_size_161).

0.95::true_val(stance_width_range_size_161, r52_0_64_0); 0.05::true_val(stance_width_range_size_161, unk_stance_width_range_size_161).

measured(s1, stance_width_range_size_161, r52_0_64_0).
measured(sm, stance_width_range_size_161, r52_0_64_0).

all_consistent(stance_width_range_size_161) :-
    consistent(s1, stance_width_range_size_161),
    (indep(sm), consistent(sm, stance_width_range_size_161) ; \+indep(sm)).

evidence(all_consistent(stance_width_range_size_161)).
query(true_val(stance_width_range_size_161, r52_0_64_0)).
query(true_val(stance_width_range_size_161, unk_stance_width_range_size_161)).

% @attr recommended_weight_range_size_161
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r81_101=81-101kg unk_recommended_weight_range_size_161=Unknown
% @importance 0.925

0.93::acc(s1, recommended_weight_range_size_161).
0.88::acc(sm, recommended_weight_range_size_161).

0.95::true_val(recommended_weight_range_size_161, r81_101); 0.05::true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161).

measured(s1, recommended_weight_range_size_161, r81_101).
measured(sm, recommended_weight_range_size_161, r81_101).

all_consistent(recommended_weight_range_size_161) :-
    consistent(s1, recommended_weight_range_size_161),
    (indep(sm), consistent(sm, recommended_weight_range_size_161) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size_161)).
query(true_val(recommended_weight_range_size_161, r81_101)).
query(true_val(recommended_weight_range_size_161, unk_recommended_weight_range_size_161)).

% @attr boot_size_eu_161
% @type categorical
% @canonical false
% @original_name Boot size EU (161cm)
% @values eu42_47=42-47 unk_boot_size_eu_161=Unknown
% @importance 1.0

0.93::acc(s1, boot_size_eu_161).

0.93::true_val(boot_size_eu_161, eu42_47); 0.07::true_val(boot_size_eu_161, unk_boot_size_eu_161).

measured(s1, boot_size_eu_161, eu42_47).

all_consistent(boot_size_eu_161) :- consistent(s1, boot_size_eu_161).

evidence(all_consistent(boot_size_eu_161)).
query(true_val(boot_size_eu_161, eu42_47)).
query(true_val(boot_size_eu_161, unk_boot_size_eu_161)).

% @attr boot_size_us_161
% @type categorical
% @canonical false
% @original_name Boot size US (161cm)
% @values us9_12=9-12 unk_boot_size_us_161=Unknown
% @importance 1.0

0.93::acc(s1, boot_size_us_161).

0.93::true_val(boot_size_us_161, us9_12); 0.07::true_val(boot_size_us_161, unk_boot_size_us_161).

measured(s1, boot_size_us_161, us9_12).

all_consistent(boot_size_us_161) :- consistent(s1, boot_size_us_161).

evidence(all_consistent(boot_size_us_161)).
query(true_val(boot_size_us_161, us9_12)).
query(true_val(boot_size_us_161, unk_boot_size_us_161)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values freeride_powder_am=Freeride_Powder_All_Mountain unk_terrain_suitability=Unknown
% @importance 0.825

0.88::acc(sm, terrain_suitability).
0.82::acc(s2, terrain_suitability).

0.95::true_val(terrain_suitability, freeride_powder_am); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(sm, terrain_suitability, freeride_powder_am).
measured(s2, terrain_suitability, freeride_powder_am).

all_consistent(terrain_suitability) :-
    (indep(sm), consistent(sm, terrain_suitability) ; \+indep(sm)),
    (indep(s2), consistent(s2, terrain_suitability) ; \+indep(s2)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, freeride_powder_am)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values directional_freeride_carving_powder=Directional_freeride_carving_powder unk_riding_style=Unknown
% @importance 0.85

0.88::acc(sm, riding_style).

0.93::true_val(riding_style, directional_freeride_carving_powder); 0.07::true_val(riding_style, unk_riding_style).

measured(sm, riding_style, directional_freeride_carving_powder).

all_consistent(riding_style) :-
    (indep(sm), consistent(sm, riding_style) ; \+indep(sm)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, directional_freeride_carving_powder)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_powder_focus
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values deep_powder_soft_snow=Deep_powder_and_soft_snow unk_terrain_suitability_powder_focus=Unknown
% @importance 0.875

0.82::acc(s35, terrain_suitability_powder_focus).
0.82::acc(s36, terrain_suitability_powder_focus).

0.95::true_val(terrain_suitability_powder_focus, deep_powder_soft_snow); 0.05::true_val(terrain_suitability_powder_focus, unk_terrain_suitability_powder_focus).

measured(s35, terrain_suitability_powder_focus, deep_powder_soft_snow).
measured(s36, terrain_suitability_powder_focus, deep_powder_soft_snow).

all_consistent(terrain_suitability_powder_focus) :-
    consistent(s35, terrain_suitability_powder_focus),
    consistent(s36, terrain_suitability_powder_focus).

evidence(all_consistent(terrain_suitability_powder_focus)).
query(true_val(terrain_suitability_powder_focus, deep_powder_soft_snow)).
query(true_val(terrain_suitability_powder_focus, unk_terrain_suitability_powder_focus)).

% @attr terrain_suitability_bataleon_rated
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values park_resort_pow=Park_Resort_Pow unk_terrain_suitability_bataleon_rated=Unknown
% @importance 1.0

0.90::acc(s1, terrain_suitability_bataleon_rated).

0.90::true_val(terrain_suitability_bataleon_rated, park_resort_pow); 0.10::true_val(terrain_suitability_bataleon_rated, unk_terrain_suitability_bataleon_rated).

measured(s1, terrain_suitability_bataleon_rated, park_resort_pow).

all_consistent(terrain_suitability_bataleon_rated) :- consistent(s1, terrain_suitability_bataleon_rated).

evidence(all_consistent(terrain_suitability_bataleon_rated)).
query(true_val(terrain_suitability_bataleon_rated, park_resort_pow)).
query(true_val(terrain_suitability_bataleon_rated, unk_terrain_suitability_bataleon_rated)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate-Advanced unk_rider_level=Unknown
% @importance 0.85

0.88::acc(sm, rider_level).

0.93::true_val(rider_level, intermediate_advanced); 0.07::true_val(rider_level, unk_rider_level).

measured(sm, rider_level, intermediate_advanced).

all_consistent(rider_level) :-
    (indep(sm), consistent(sm, rider_level) ; \+indep(sm)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced-Expert unk_skill_level_recommendation=Unknown
% @importance 0.8

0.78::acc(s37, skill_level_recommendation).

0.80::true_val(skill_level_recommendation, advanced_expert); 0.20::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s37, skill_level_recommendation, advanced_expert).

all_consistent(skill_level_recommendation) :- consistent(s37, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr reviewer_opinion_the_good_ride_one_quiver
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values ideal_one_quiver_pnw=Ideal_one_quiver_board_PNW unk_reviewer_opinion_the_good_ride_one_quiver=Unknown
% @importance 0.8

0.80::acc(s38, reviewer_opinion_the_good_ride_one_quiver).

0.83::true_val(reviewer_opinion_the_good_ride_one_quiver, ideal_one_quiver_pnw); 0.17::true_val(reviewer_opinion_the_good_ride_one_quiver, unk_reviewer_opinion_the_good_ride_one_quiver).

measured(s38, reviewer_opinion_the_good_ride_one_quiver, ideal_one_quiver_pnw).

all_consistent(reviewer_opinion_the_good_ride_one_quiver) :- consistent(s38, reviewer_opinion_the_good_ride_one_quiver).

evidence(all_consistent(reviewer_opinion_the_good_ride_one_quiver)).
query(true_val(reviewer_opinion_the_good_ride_one_quiver, ideal_one_quiver_pnw)).
query(true_val(reviewer_opinion_the_good_ride_one_quiver, unk_reviewer_opinion_the_good_ride_one_quiver)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values capable_enough_tail=Enough_tail_to_ride_switch unk_switch_riding=Unknown
% @importance 0.65

0.82::acc(s39, switch_riding).

0.85::true_val(switch_riding, capable_enough_tail); 0.15::true_val(switch_riding, unk_switch_riding).

measured(s39, switch_riding, capable_enough_tail).

all_consistent(switch_riding) :- consistent(s39, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, capable_enough_tail)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values exceptional_super_poppy=Exceptional_super_poppy unk_pop=Unknown
% @importance 0.9

0.82::acc(s35, pop).
0.80::acc(s40, pop).

0.95::true_val(pop, exceptional_super_poppy); 0.05::true_val(pop, unk_pop).

measured(s35, pop, exceptional_super_poppy).
measured(s40, pop, exceptional_super_poppy).

all_consistent(pop) :-
    consistent(s35, pop),
    consistent(s40, pop).

evidence(all_consistent(pop)).
query(true_val(pop, exceptional_super_poppy)).
query(true_val(pop, unk_pop)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values excellent_powder_float=Excellent_powder_float_surf_like unk_positive_aspect=Unknown
% @importance 0.85

0.82::acc(s35, positive_aspect).
0.82::acc(s41, positive_aspect).

0.95::true_val(positive_aspect, excellent_powder_float); 0.05::true_val(positive_aspect, unk_positive_aspect).

measured(s35, positive_aspect, excellent_powder_float).
measured(s41, positive_aspect, excellent_powder_float).

all_consistent(positive_aspect) :-
    consistent(s35, positive_aspect),
    consistent(s41, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, excellent_powder_float)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_forgiving
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values very_forgiving=Very_forgiving_hard_to_catch_edge unk_positive_aspect_forgiving=Unknown
% @importance 0.875

0.82::acc(s35, positive_aspect_forgiving).
0.80::acc(s42, positive_aspect_forgiving).

0.95::true_val(positive_aspect_forgiving, very_forgiving); 0.05::true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving).

measured(s35, positive_aspect_forgiving, very_forgiving).
measured(s42, positive_aspect_forgiving, very_forgiving).

all_consistent(positive_aspect_forgiving) :-
    consistent(s35, positive_aspect_forgiving),
    consistent(s42, positive_aspect_forgiving).

evidence(all_consistent(positive_aspect_forgiving)).
query(true_val(positive_aspect_forgiving, very_forgiving)).
query(true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving)).

% @attr positive_aspect_playful
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values very_playful_fun=Very_playful_and_fun_across_terrain unk_positive_aspect_playful=Unknown
% @importance 0.75

0.78::acc(s43, positive_aspect_playful).
0.75::acc(s44, positive_aspect_playful).

0.90::true_val(positive_aspect_playful, very_playful_fun); 0.10::true_val(positive_aspect_playful, unk_positive_aspect_playful).

measured(s43, positive_aspect_playful, very_playful_fun).
measured(s44, positive_aspect_playful, very_playful_fun).

all_consistent(positive_aspect_playful) :-
    consistent(s43, positive_aspect_playful),
    consistent(s44, positive_aspect_playful).

evidence(all_consistent(positive_aspect_playful)).
query(true_val(positive_aspect_playful, very_playful_fun)).
query(true_val(positive_aspect_playful, unk_positive_aspect_playful)).

% @attr positive_aspect_buttering
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values great_buttering_pop=Great_for_buttering_with_loads_of_pop unk_positive_aspect_buttering=Unknown
% @importance 0.8

0.75::acc(s44, positive_aspect_buttering).

0.78::true_val(positive_aspect_buttering, great_buttering_pop); 0.22::true_val(positive_aspect_buttering, unk_positive_aspect_buttering).

measured(s44, positive_aspect_buttering, great_buttering_pop).

all_consistent(positive_aspect_buttering) :- consistent(s44, positive_aspect_buttering).

evidence(all_consistent(positive_aspect_buttering)).
query(true_val(positive_aspect_buttering, great_buttering_pop)).
query(true_val(positive_aspect_buttering, unk_positive_aspect_buttering)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values quick_edge_to_edge_nimble=Quick_edge_to_edge_nimble_in_trees unk_turn_initiation_performance=Unknown
% @importance 0.8

0.75::acc(s44, turn_initiation_performance).

0.78::true_val(turn_initiation_performance, quick_edge_to_edge_nimble); 0.22::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s44, turn_initiation_performance, quick_edge_to_edge_nimble).

all_consistent(turn_initiation_performance) :- consistent(s44, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, quick_edge_to_edge_nimble)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values reduced_chatter_urethane=Urethane_reduces_chatter_in_micro_bumps unk_chatter_performance=Unknown
% @importance 0.7

0.80::acc(s45, chatter_performance).

0.82::true_val(chatter_performance, reduced_chatter_urethane); 0.18::true_val(chatter_performance, unk_chatter_performance).

measured(s45, chatter_performance, reduced_chatter_urethane).

all_consistent(chatter_performance) :- consistent(s45, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, reduced_chatter_urethane)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values fast_gliding_sintered=Fast_gliding_sintered_base unk_base_glide_performance=Unknown
% @importance 0.65

0.80::acc(s46, base_glide_performance).

0.82::true_val(base_glide_performance, fast_gliding_sintered); 0.18::true_val(base_glide_performance, unk_base_glide_performance).

measured(s46, base_glide_performance, fast_gliding_sintered).

all_consistent(base_glide_performance) :- consistent(s46, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, fast_gliding_sintered)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values relatively_light=Relatively_light_vs_Lib_Tech_Never_Summer unk_board_weight_grams=Unknown
% @importance 0.85

0.68::acc(s47, board_weight_grams).

0.72::true_val(board_weight_grams, relatively_light); 0.28::true_val(board_weight_grams, unk_board_weight_grams).

measured(s47, board_weight_grams, relatively_light).

all_consistent(board_weight_grams) :- consistent(s47, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, relatively_light)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr positive_aspect_surfy_turns
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values butter_smooth_surfy=Butter_smooth_turns_surf_like_feel unk_positive_aspect_surfy_turns=Unknown
% @importance 0.825

0.80::acc(s38, positive_aspect_surfy_turns).
0.78::acc(s40, positive_aspect_surfy_turns).

0.92::true_val(positive_aspect_surfy_turns, butter_smooth_surfy); 0.08::true_val(positive_aspect_surfy_turns, unk_positive_aspect_surfy_turns).

measured(s38, positive_aspect_surfy_turns, butter_smooth_surfy).
measured(s40, positive_aspect_surfy_turns, butter_smooth_surfy).

all_consistent(positive_aspect_surfy_turns) :-
    consistent(s38, positive_aspect_surfy_turns),
    consistent(s40, positive_aspect_surfy_turns).

evidence(all_consistent(positive_aspect_surfy_turns)).
query(true_val(positive_aspect_surfy_turns, butter_smooth_surfy)).
query(true_val(positive_aspect_surfy_turns, unk_positive_aspect_surfy_turns)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values washy_edgeless_hard_snow=Very_limited_washy_edgeless_in_medium_hard_snow unk_negative_aspect=Unknown
% @importance 0.95

0.85::acc(s35, negative_aspect).
0.82::acc(s48, negative_aspect).

0.95::true_val(negative_aspect, washy_edgeless_hard_snow); 0.05::true_val(negative_aspect, unk_negative_aspect).

measured(s35, negative_aspect, washy_edgeless_hard_snow).
measured(s48, negative_aspect, washy_edgeless_hard_snow).

all_consistent(negative_aspect) :-
    consistent(s35, negative_aspect),
    consistent(s48, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, washy_edgeless_hard_snow)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_carving
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_aggressive_carving=Not_recommended_for_aggressive_high_speed_carving unk_negative_aspect_carving=Unknown
% @importance 0.875

0.68::acc(s47, negative_aspect_carving).
0.78::acc(s49, negative_aspect_carving).

0.92::true_val(negative_aspect_carving, not_aggressive_carving); 0.08::true_val(negative_aspect_carving, unk_negative_aspect_carving).

measured(s47, negative_aspect_carving, not_aggressive_carving).
measured(s49, negative_aspect_carving, not_aggressive_carving).

all_consistent(negative_aspect_carving) :-
    consistent(s47, negative_aspect_carving),
    consistent(s49, negative_aspect_carving).

evidence(all_consistent(negative_aspect_carving)).
query(true_val(negative_aspect_carving, not_aggressive_carving)).
query(true_val(negative_aspect_carving, unk_negative_aspect_carving)).

% @attr negative_aspect_choppy_snow
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values bounced_choppy_snow=Gets_bounced_around_in_choppy_uneven_soft_snow unk_negative_aspect_choppy_snow=Unknown
% @importance 0.9

0.82::acc(s35, negative_aspect_choppy_snow).
0.68::acc(s47, negative_aspect_choppy_snow).

0.92::true_val(negative_aspect_choppy_snow, bounced_choppy_snow); 0.08::true_val(negative_aspect_choppy_snow, unk_negative_aspect_choppy_snow).

measured(s35, negative_aspect_choppy_snow, bounced_choppy_snow).
measured(s47, negative_aspect_choppy_snow, bounced_choppy_snow).

all_consistent(negative_aspect_choppy_snow) :-
    consistent(s35, negative_aspect_choppy_snow),
    consistent(s47, negative_aspect_choppy_snow).

evidence(all_consistent(negative_aspect_choppy_snow)).
query(true_val(negative_aspect_choppy_snow, bounced_choppy_snow)).
query(true_val(negative_aspect_choppy_snow, unk_negative_aspect_choppy_snow)).

% @attr negative_aspect_learning_curve
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values half_day_to_days_adjust=Takes_half_day_to_several_days_to_adjust unk_negative_aspect_learning_curve=Unknown
% @importance 0.95

0.82::acc(s35, negative_aspect_learning_curve).

0.85::true_val(negative_aspect_learning_curve, half_day_to_days_adjust); 0.15::true_val(negative_aspect_learning_curve, unk_negative_aspect_learning_curve).

measured(s35, negative_aspect_learning_curve, half_day_to_days_adjust).

all_consistent(negative_aspect_learning_curve) :- consistent(s35, negative_aspect_learning_curve).

evidence(all_consistent(negative_aspect_learning_curve)).
query(true_val(negative_aspect_learning_curve, half_day_to_days_adjust)).
query(true_val(negative_aspect_learning_curve, unk_negative_aspect_learning_curve)).

% @attr negative_aspect_icy
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values saps_confidence_hard_icy=Saps_confidence_in_hard_icy_conditions unk_negative_aspect_icy=Unknown
% @importance 0.9

0.85::acc(s48, negative_aspect_icy).

0.85::true_val(negative_aspect_icy, saps_confidence_hard_icy); 0.15::true_val(negative_aspect_icy, unk_negative_aspect_icy).

measured(s48, negative_aspect_icy, saps_confidence_hard_icy).

all_consistent(negative_aspect_icy) :- consistent(s48, negative_aspect_icy).

evidence(all_consistent(negative_aspect_icy)).
query(true_val(negative_aspect_icy, saps_confidence_hard_icy)).
query(true_val(negative_aspect_icy, unk_negative_aspect_icy)).

% @attr negative_aspect_slushy
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values slower_edge_to_edge_slush=Slower_edge_to_edge_in_slushy_conditions unk_negative_aspect_slushy=Unknown
% @importance 0.6

0.75::acc(s50, negative_aspect_slushy).

0.78::true_val(negative_aspect_slushy, slower_edge_to_edge_slush); 0.22::true_val(negative_aspect_slushy, unk_negative_aspect_slushy).

measured(s50, negative_aspect_slushy, slower_edge_to_edge_slush).

all_consistent(negative_aspect_slushy) :- consistent(s50, negative_aspect_slushy).

evidence(all_consistent(negative_aspect_slushy)).
query(true_val(negative_aspect_slushy, slower_edge_to_edge_slush)).
query(true_val(negative_aspect_slushy, unk_negative_aspect_slushy)).

% @attr negative_aspect_build
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_as_burly=Not_as_burly_build_vs_Lib_Tech_Never_Summer unk_negative_aspect_build=Unknown
% @importance 0.85

0.68::acc(s47, negative_aspect_build).

0.72::true_val(negative_aspect_build, not_as_burly); 0.28::true_val(negative_aspect_build, unk_negative_aspect_build).

measured(s47, negative_aspect_build, not_as_burly).

all_consistent(negative_aspect_build) :- consistent(s47, negative_aspect_build).

evidence(all_consistent(negative_aspect_build)).
query(true_val(negative_aspect_build, not_as_burly)).
query(true_val(negative_aspect_build, unk_negative_aspect_build)).

% @attr bataleon_user_review_rating
% @type categorical
% @canonical false
% @original_name Bataleon.com user review rating
% @values five_stars_14_reviews=5_of_5_stars_14_reviews_100pct unk_bataleon_user_review_rating=Unknown
% @importance 1.0

0.85::acc(s1, bataleon_user_review_rating).

0.90::true_val(bataleon_user_review_rating, five_stars_14_reviews); 0.10::true_val(bataleon_user_review_rating, unk_bataleon_user_review_rating).

measured(s1, bataleon_user_review_rating, five_stars_14_reviews).

all_consistent(bataleon_user_review_rating) :- consistent(s1, bataleon_user_review_rating).

evidence(all_consistent(bataleon_user_review_rating)).
query(true_val(bataleon_user_review_rating, five_stars_14_reviews)).
query(true_val(bataleon_user_review_rating, unk_bataleon_user_review_rating)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values whitelines_100_best=Selected_Whitelines_100_Best_Gear_Awards_2024_2025 unk_reviewer_opinion_whitelines=Unknown
% @importance 0.7

0.82::acc(s17, reviewer_opinion_whitelines).

0.85::true_val(reviewer_opinion_whitelines, whitelines_100_best); 0.15::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s17, reviewer_opinion_whitelines, whitelines_100_best).

all_consistent(reviewer_opinion_whitelines) :- consistent(s17, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, whitelines_100_best)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values hit_or_miss=Hit_or_miss_pop_float_vs_limited_edge_hold unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.85::acc(s35, reviewer_opinion_the_good_ride).

0.87::true_val(reviewer_opinion_the_good_ride, hit_or_miss); 0.13::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s35, reviewer_opinion_the_good_ride, hit_or_miss).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s35, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, hit_or_miss)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr evo_field_tested_review
% @type categorical
% @canonical false
% @original_name evo Field Tested review summary
% @values thoroughly_impressed=Thoroughly_impressed_dynamic_performance unk_evo_field_tested_review=Unknown
% @importance 0.85

0.80::acc(s40, evo_field_tested_review).

0.83::true_val(evo_field_tested_review, thoroughly_impressed); 0.17::true_val(evo_field_tested_review, unk_evo_field_tested_review).

measured(s40, evo_field_tested_review, thoroughly_impressed).

all_consistent(evo_field_tested_review) :- consistent(s40, evo_field_tested_review).

evidence(all_consistent(evo_field_tested_review)).
query(true_val(evo_field_tested_review, thoroughly_impressed)).
query(true_val(evo_field_tested_review, unk_evo_field_tested_review)).

% @attr snowboard_international_review
% @type categorical
% @canonical false
% @original_name Snowboard International review (25/26)
% @values playful_surfy_weak_edge=Playful_surfy_ride_weak_edge_hold_icy unk_snowboard_international_review=Unknown
% @importance 0.8

0.80::acc(s51, snowboard_international_review).

0.82::true_val(snowboard_international_review, playful_surfy_weak_edge); 0.18::true_val(snowboard_international_review, unk_snowboard_international_review).

measured(s51, snowboard_international_review, playful_surfy_weak_edge).

all_consistent(snowboard_international_review) :- consistent(s51, snowboard_international_review).

evidence(all_consistent(snowboard_international_review)).
query(true_val(snowboard_international_review, playful_surfy_weak_edge)).
query(true_val(snowboard_international_review, unk_snowboard_international_review)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_year_extendable_three=2yr_limited_extendable_to_3yr unk_warranty=Unknown
% @importance 0.75

0.93::acc(s52, warranty).
0.88::acc(s53, warranty).

0.95::true_val(warranty, two_year_extendable_three); 0.05::true_val(warranty, unk_warranty).

measured(s52, warranty, two_year_extendable_three).
measured(s53, warranty, two_year_extendable_three).

all_consistent(warranty) :-
    consistent(s52, warranty),
    consistent(s53, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_year_extendable_three)).
query(true_val(warranty, unk_warranty)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values days_45=45_day_return_period unk_return_policy_terms=Unknown
% @importance 1.0

0.90::acc(s1, return_policy_terms).

0.90::true_val(return_policy_terms, days_45); 0.10::true_val(return_policy_terms, unk_return_policy_terms).

measured(s1, return_policy_terms, days_45).

all_consistent(return_policy_terms) :- consistent(s1, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, days_45)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr return_policy_terms_evo
% @type categorical
% @canonical false
% @original_name return_policy_terms
% @values up_to_full_year=Up_to_a_full_year unk_return_policy_terms_evo=Unknown
% @importance 0.6

0.85::acc(s54, return_policy_terms_evo).

0.88::true_val(return_policy_terms_evo, up_to_full_year); 0.12::true_val(return_policy_terms_evo, unk_return_policy_terms_evo).

measured(s54, return_policy_terms_evo, up_to_full_year).

all_consistent(return_policy_terms_evo) :- consistent(s54, return_policy_terms_evo).

evidence(all_consistent(return_policy_terms_evo)).
query(true_val(return_policy_terms_evo, up_to_full_year)).
query(true_val(return_policy_terms_evo, unk_return_policy_terms_evo)).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Brand reputation
% @values innovative_3d_fast_growing=Innovative_3D_design_fastest_growing unk_brand_reputation=Unknown
% @importance 0.5

0.78::acc(s14, brand_reputation).

0.80::true_val(brand_reputation, innovative_3d_fast_growing); 0.20::true_val(brand_reputation, unk_brand_reputation).

measured(s14, brand_reputation, innovative_3d_fast_growing).

all_consistent(brand_reputation) :- consistent(s14, brand_reputation).

evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, innovative_3d_fast_growing)).
query(true_val(brand_reputation, unk_brand_reputation)).

% @attr tbt_technology_history
% @type categorical
% @canonical false
% @original_name 3BT technology history
% @values patented_over_20_years=Patented_in_use_over_20_years unk_tbt_technology_history=Unknown
% @importance 0.4

0.78::acc(s55, tbt_technology_history).

0.80::true_val(tbt_technology_history, patented_over_20_years); 0.20::true_val(tbt_technology_history, unk_tbt_technology_history).

measured(s55, tbt_technology_history, patented_over_20_years).

all_consistent(tbt_technology_history) :- consistent(s55, tbt_technology_history).

evidence(all_consistent(tbt_technology_history)).
query(true_val(tbt_technology_history, patented_over_20_years)).
query(true_val(tbt_technology_history, unk_tbt_technology_history)).

% @attr customer_service_reputation
% @type categorical
% @canonical false
% @original_name Customer service reputation
% @values mixed=Mixed_some_praise_some_frustrating unk_customer_service_reputation=Unknown
% @importance 0.683

0.55::acc(s56, customer_service_reputation).
0.50::acc(s57, customer_service_reputation).
0.50::acc(s58, customer_service_reputation).

0.80::true_val(customer_service_reputation, mixed); 0.20::true_val(customer_service_reputation, unk_customer_service_reputation).

measured(s56, customer_service_reputation, mixed).
measured(s57, customer_service_reputation, mixed).
measured(s58, customer_service_reputation, mixed).

all_consistent(customer_service_reputation) :-
    consistent(s56, customer_service_reputation),
    consistent(s57, customer_service_reputation),
    consistent(s58, customer_service_reputation).

evidence(all_consistent(customer_service_reputation)).
query(true_val(customer_service_reputation, mixed)).
query(true_val(customer_service_reputation, unk_customer_service_reputation)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values generally_positive_soft_base=Generally_positive_base_scratches_easily unk_user_review_forum=Unknown
% @importance 0.6

0.55::acc(s59, user_review_forum).

0.62::true_val(user_review_forum, generally_positive_soft_base); 0.38::true_val(user_review_forum, unk_user_review_forum).

measured(s59, user_review_forum, generally_positive_soft_base).

all_consistent(user_review_forum) :- consistent(s59, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, generally_positive_soft_base)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values goliath=Bataleon_Goliath_directional_twin_629_95 unk_comparable_board_same_brand=Unknown
% @importance 0.7

0.82::acc(s60, comparable_board_same_brand).

0.88::true_val(comparable_board_same_brand, goliath); 0.12::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s60, comparable_board_same_brand, goliath).

all_consistent(comparable_board_same_brand) :- consistent(s60, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, goliath)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_whatever
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values whatever=Bataleon_Whatever_softer_flex_579_95 unk_comparable_board_same_brand_whatever=Unknown
% @importance 0.7

0.82::acc(s61, comparable_board_same_brand_whatever).

0.88::true_val(comparable_board_same_brand_whatever, whatever); 0.12::true_val(comparable_board_same_brand_whatever, unk_comparable_board_same_brand_whatever).

measured(s61, comparable_board_same_brand_whatever, whatever).

all_consistent(comparable_board_same_brand_whatever) :- consistent(s61, comparable_board_same_brand_whatever).

evidence(all_consistent(comparable_board_same_brand_whatever)).
query(true_val(comparable_board_same_brand_whatever, whatever)).
query(true_val(comparable_board_same_brand_whatever, unk_comparable_board_same_brand_whatever)).

% @attr comparable_board_same_brand_thunderstorm
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values thunderstorm=Bataleon_Thunderstorm_freeride_589_95 unk_comparable_board_same_brand_thunderstorm=Unknown
% @importance 0.7

0.82::acc(s61, comparable_board_same_brand_thunderstorm).

0.88::true_val(comparable_board_same_brand_thunderstorm, thunderstorm); 0.12::true_val(comparable_board_same_brand_thunderstorm, unk_comparable_board_same_brand_thunderstorm).

measured(s61, comparable_board_same_brand_thunderstorm, thunderstorm).

all_consistent(comparable_board_same_brand_thunderstorm) :- consistent(s61, comparable_board_same_brand_thunderstorm).

evidence(all_consistent(comparable_board_same_brand_thunderstorm)).
query(true_val(comparable_board_same_brand_thunderstorm, thunderstorm)).
query(true_val(comparable_board_same_brand_thunderstorm, unk_comparable_board_same_brand_thunderstorm)).

% @attr comparable_board_same_brand_surfer
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values surfer=Bataleon_Surfer_premium_powder_1099_95 unk_comparable_board_same_brand_surfer=Unknown
% @importance 0.7

0.82::acc(s61, comparable_board_same_brand_surfer).

0.88::true_val(comparable_board_same_brand_surfer, surfer); 0.12::true_val(comparable_board_same_brand_surfer, unk_comparable_board_same_brand_surfer).

measured(s61, comparable_board_same_brand_surfer, surfer).

all_consistent(comparable_board_same_brand_surfer) :- consistent(s61, comparable_board_same_brand_surfer).

evidence(all_consistent(comparable_board_same_brand_surfer)).
query(true_val(comparable_board_same_brand_surfer, surfer)).
query(true_val(comparable_board_same_brand_surfer, unk_comparable_board_same_brand_surfer)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_navigator=CAPiTA_Navigator_preferred_Cameleon_in_powder unk_comparable_board_cross_brand=Unknown
% @importance 0.8

0.75::acc(s44, comparable_board_cross_brand).

0.78::true_val(comparable_board_cross_brand, capita_navigator); 0.22::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s44, comparable_board_cross_brand, capita_navigator).

all_consistent(comparable_board_cross_brand) :- consistent(s44, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_navigator)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_lib_tech_ns
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values lib_tech_ns_more_burly=Lib_Tech_Never_Summer_more_burly_build unk_comparable_board_cross_brand_lib_tech_ns=Unknown
% @importance 0.85

0.68::acc(s47, comparable_board_cross_brand_lib_tech_ns).

0.72::true_val(comparable_board_cross_brand_lib_tech_ns, lib_tech_ns_more_burly); 0.28::true_val(comparable_board_cross_brand_lib_tech_ns, unk_comparable_board_cross_brand_lib_tech_ns).

measured(s47, comparable_board_cross_brand_lib_tech_ns, lib_tech_ns_more_burly).

all_consistent(comparable_board_cross_brand_lib_tech_ns) :- consistent(s47, comparable_board_cross_brand_lib_tech_ns).

evidence(all_consistent(comparable_board_cross_brand_lib_tech_ns)).
query(true_val(comparable_board_cross_brand_lib_tech_ns, lib_tech_ns_more_burly)).
query(true_val(comparable_board_cross_brand_lib_tech_ns, unk_comparable_board_cross_brand_lib_tech_ns)).

% @attr comparable_board_cross_brand_alternatives
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values jones_mt_twin_yes_standard=Jones_Mountain_Twin_YES_Standard unk_comparable_board_cross_brand_alternatives=Unknown
% @importance 0.75

0.60::acc(s62, comparable_board_cross_brand_alternatives).

0.68::true_val(comparable_board_cross_brand_alternatives, jones_mt_twin_yes_standard); 0.32::true_val(comparable_board_cross_brand_alternatives, unk_comparable_board_cross_brand_alternatives).

measured(s62, comparable_board_cross_brand_alternatives, jones_mt_twin_yes_standard).

all_consistent(comparable_board_cross_brand_alternatives) :- consistent(s62, comparable_board_cross_brand_alternatives).

evidence(all_consistent(comparable_board_cross_brand_alternatives)).
query(true_val(comparable_board_cross_brand_alternatives, jones_mt_twin_yes_standard)).
query(true_val(comparable_board_cross_brand_alternatives, unk_comparable_board_cross_brand_alternatives)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values rubbery_super_poppy_medium=Very_rubbery_super_poppy_medium_flex unk_flex_feel=Unknown
% @importance 0.8

0.82::acc(s32, flex_feel).

0.85::true_val(flex_feel, rubbery_super_poppy_medium); 0.15::true_val(flex_feel, unk_flex_feel).

measured(s32, flex_feel, rubbery_super_poppy_medium).

all_consistent(flex_feel) :- consistent(s32, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, rubbery_super_poppy_medium)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr reviewer_opinion_the_good_ride_turny
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values very_turny_for_161=Very_turny_for_a_161 unk_reviewer_opinion_the_good_ride_turny=Unknown
% @importance 0.8

0.82::acc(s32, reviewer_opinion_the_good_ride_turny).

0.85::true_val(reviewer_opinion_the_good_ride_turny, very_turny_for_161); 0.15::true_val(reviewer_opinion_the_good_ride_turny, unk_reviewer_opinion_the_good_ride_turny).

measured(s32, reviewer_opinion_the_good_ride_turny, very_turny_for_161).

all_consistent(reviewer_opinion_the_good_ride_turny) :- consistent(s32, reviewer_opinion_the_good_ride_turny).

evidence(all_consistent(reviewer_opinion_the_good_ride_turny)).
query(true_val(reviewer_opinion_the_good_ride_turny, very_turny_for_161)).
query(true_val(reviewer_opinion_the_good_ride_turny, unk_reviewer_opinion_the_good_ride_turny)).

% @attr camber_description_reviewer
% @type categorical
% @canonical false
% @original_name camber_description
% @values ton_of_camber_medium_tbt=A_ton_of_camber_combined_with_medium_TBT unk_camber_description_reviewer=Unknown
% @importance 0.8

0.82::acc(s32, camber_description_reviewer).

0.85::true_val(camber_description_reviewer, ton_of_camber_medium_tbt); 0.15::true_val(camber_description_reviewer, unk_camber_description_reviewer).

measured(s32, camber_description_reviewer, ton_of_camber_medium_tbt).

all_consistent(camber_description_reviewer) :- consistent(s32, camber_description_reviewer).

evidence(all_consistent(camber_description_reviewer)).
query(true_val(camber_description_reviewer, ton_of_camber_medium_tbt)).
query(true_val(camber_description_reviewer, unk_camber_description_reviewer)).

% @attr reviewer_opinion_the_good_ride_sizing_boot
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values boot_size_priority=Boot_size_is_priority_weight_second_height_third unk_reviewer_opinion_the_good_ride_sizing_boot=Unknown
% @importance 0.8

0.82::acc(s32, reviewer_opinion_the_good_ride_sizing_boot).

0.85::true_val(reviewer_opinion_the_good_ride_sizing_boot, boot_size_priority); 0.15::true_val(reviewer_opinion_the_good_ride_sizing_boot, unk_reviewer_opinion_the_good_ride_sizing_boot).

measured(s32, reviewer_opinion_the_good_ride_sizing_boot, boot_size_priority).

all_consistent(reviewer_opinion_the_good_ride_sizing_boot) :- consistent(s32, reviewer_opinion_the_good_ride_sizing_boot).

evidence(all_consistent(reviewer_opinion_the_good_ride_sizing_boot)).
query(true_val(reviewer_opinion_the_good_ride_sizing_boot, boot_size_priority)).
query(true_val(reviewer_opinion_the_good_ride_sizing_boot, unk_reviewer_opinion_the_good_ride_sizing_boot)).

% @attr reviewer_opinion_the_good_ride_sizing_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values conservative_weight_liberal_boot=Bataleon_conservative_on_weight_liberal_on_boot_sizing unk_reviewer_opinion_the_good_ride_sizing_weight=Unknown
% @importance 0.8

0.82::acc(s32, reviewer_opinion_the_good_ride_sizing_weight).

0.85::true_val(reviewer_opinion_the_good_ride_sizing_weight, conservative_weight_liberal_boot); 0.15::true_val(reviewer_opinion_the_good_ride_sizing_weight, unk_reviewer_opinion_the_good_ride_sizing_weight).

measured(s32, reviewer_opinion_the_good_ride_sizing_weight, conservative_weight_liberal_boot).

all_consistent(reviewer_opinion_the_good_ride_sizing_weight) :- consistent(s32, reviewer_opinion_the_good_ride_sizing_weight).

evidence(all_consistent(reviewer_opinion_the_good_ride_sizing_weight)).
query(true_val(reviewer_opinion_the_good_ride_sizing_weight, conservative_weight_liberal_boot)).
query(true_val(reviewer_opinion_the_good_ride_sizing_weight, unk_reviewer_opinion_the_good_ride_sizing_weight)).