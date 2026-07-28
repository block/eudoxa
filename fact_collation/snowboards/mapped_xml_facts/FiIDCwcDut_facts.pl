0.15::indep(s1).
0.20::indep(s2).
0.25::indep(s5).
0.20::indep(s6).
0.20::indep(s7).
0.15::indep(s8).
0.15::indep(s10).
0.20::indep(s11).
0.15::indep(s12).
0.20::indep(s17).
0.20::indep(s18).
0.25::indep(s19).
0.20::indep(s20).
0.20::indep(s23).
0.15::indep(s24).
0.30::indep(smerchant).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.82::acc(s1, brand).
0.80::acc(s2, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.825

0.97::true_val(brand, salomon); 0.03::true_val(brand, unk_brand).

measured(s1, brand, salomon).
measured(s2, brand, salomon).

all_consistent(brand) :-
    consistent(s2, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

0.82::acc(s1, model_name).
0.80::acc(s2, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values reflect=Reflect unk_model_name=Unknown
% @importance 0.825

0.97::true_val(model_name, reflect); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, reflect).
measured(s2, model_name, reflect).

all_consistent(model_name) :-
    consistent(s2, model_name),
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).

evidence(all_consistent(model_name)).
query(true_val(model_name, reflect)).
query(true_val(model_name, unk_model_name)).

0.88::acc(s3, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values salomon_sas=Salomon_SAS_founded_1947_Annecy_France unk_manufacturer=Unknown
% @importance 0.5

0.78::true_val(manufacturer, salomon_sas); 0.22::true_val(manufacturer, unk_manufacturer).

measured(s3, manufacturer, salomon_sas).

all_consistent(manufacturer) :-
    consistent(s3, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas)).
query(true_val(manufacturer, unk_manufacturer)).

0.88::acc(s4, parent_company).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports=Amer_Sports_Corporation_Helsinki_Finland unk_parent_company=Unknown
% @importance 0.4

0.78::true_val(parent_company, amer_sports); 0.22::true_val(parent_company, unk_parent_company).

measured(s4, parent_company, amer_sports).

all_consistent(parent_company) :-
    consistent(s4, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports)).
query(true_val(parent_company, unk_parent_company)).

0.88::acc(s4, parent_company_ownership).

% @attr parent_company_ownership
% @type categorical
% @canonical false
% @original_name Parent company ownership
% @values anta_consortium=ANTA_Sports_FountainVest_Anamered_Tencent unk_parent_company_ownership=Unknown
% @importance 0.4

0.78::true_val(parent_company_ownership, anta_consortium); 0.22::true_val(parent_company_ownership, unk_parent_company_ownership).

measured(s4, parent_company_ownership, anta_consortium).

all_consistent(parent_company_ownership) :-
    consistent(s4, parent_company_ownership).

evidence(all_consistent(parent_company_ownership)).
query(true_val(parent_company_ownership, anta_consortium)).
query(true_val(parent_company_ownership, unk_parent_company_ownership)).

0.82::acc(s1, product_type).
0.80::acc(s2, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.825

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s2, product_type),
    (indep(s1), consistent(s1, product_type) ; \+indep(s1)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.82::acc(s1, board_category).
0.85::acc(s5, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 0.875

0.95::true_val(board_category, all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain).
measured(s5, board_category, all_mountain).

all_consistent(board_category) :-
    consistent(s5, board_category),
    (indep(s1), consistent(s1, board_category) ; \+indep(s1)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

0.85::acc(s6, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.6

0.76::true_val(gender, mens); 0.24::true_val(gender, unk_gender).

measured(s6, gender, mens).

all_consistent(gender) :-
    (indep(s6), consistent(s6, gender) ; \+indep(s6)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.82::acc(s7, gender_womens_available).
0.80::acc(s8, gender_womens_available).

% @attr gender_womens_available
% @type categorical
% @canonical false
% @original_name gender (Women's availability)
% @values yes_womens=Also_available_in_Womens_version unk_gender_womens_available=Unknown
% @importance 0.55

0.95::true_val(gender_womens_available, yes_womens); 0.05::true_val(gender_womens_available, unk_gender_womens_available).

measured(s7, gender_womens_available, yes_womens).
measured(s8, gender_womens_available, yes_womens).

all_consistent(gender_womens_available) :-
    (indep(s7), consistent(s7, gender_womens_available) ; \+indep(s7)),
    (indep(s8), consistent(s8, gender_womens_available) ; \+indep(s8)).

evidence(all_consistent(gender_womens_available)).
query(true_val(gender_womens_available, yes_womens)).
query(true_val(gender_womens_available, unk_gender_womens_available)).

0.60::acc(s9, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2023=2023 unk_model_first_available_year=Unknown
% @importance 0.7

0.47::true_val(model_first_available_year, y2023); 0.53::true_val(model_first_available_year, unk_model_first_available_year).

measured(s9, model_first_available_year, y2023).

all_consistent(model_first_available_year) :-
    consistent(s9, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2023)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.80::acc(s10, model_year).
0.80::acc(s11, model_year).
0.78::acc(s12, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2023_2026=2023_2024_2025_2026 unk_model_year=Unknown
% @importance 0.567

0.95::true_val(model_year, y2023_2026); 0.05::true_val(model_year, unk_model_year).

measured(s10, model_year, y2023_2026).
measured(s11, model_year, y2023_2026).
measured(s12, model_year, y2023_2026).

all_consistent(model_year) :-
    consistent(s11, model_year),
    (indep(s10), consistent(s10, model_year) ; \+indep(s10)),
    (indep(s12), consistent(s12, model_year) ; \+indep(s12)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2023_2026)).
query(true_val(model_year, unk_model_year)).

0.93::acc(smerchant, sku).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU (men's, merchant-provided)
% @values l47505500_145=L47505500_145 unk_sku=Unknown
% @importance 0.85

0.95::true_val(sku, l47505500_145); 0.05::true_val(sku, unk_sku).

measured(smerchant, sku, l47505500_145).

all_consistent(sku) :-
    consistent(smerchant, sku).

evidence(all_consistent(sku)).
query(true_val(sku, l47505500_145)).
query(true_val(sku, unk_sku)).

0.93::acc(s13, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_years=2_years_for_snowboards unk_warranty=Unknown
% @importance 0.75

0.87::true_val(warranty, two_years); 0.13::true_val(warranty, unk_warranty).

measured(s13, warranty, two_years).

all_consistent(warranty) :-
    consistent(s13, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_years)).
query(true_val(warranty, unk_warranty)).

0.95::acc(smerchant, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v599_99=599.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v599_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(smerchant, price_aud_merchant, v599_99).

all_consistent(price_aud_merchant) :-
    consistent(smerchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v599_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.90::acc(s14, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v350=350.0 unk_price_usd_msrp=Unknown
% @importance 1.0

0.76::true_val(price_usd_msrp, v350); 0.24::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s14, price_usd_msrp, v350).

all_consistent(price_usd_msrp) :-
    consistent(s14, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v350)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.90::acc(s14, price_usd_sale_the_house).

% @attr price_usd_sale_the_house
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD sale, The House)
% @values v239_95=239.95 unk_price_usd_sale_the_house=Unknown
% @importance 1.0

0.76::true_val(price_usd_sale_the_house, v239_95); 0.24::true_val(price_usd_sale_the_house, unk_price_usd_sale_the_house).

measured(s14, price_usd_sale_the_house, v239_95).

all_consistent(price_usd_sale_the_house) :-
    consistent(s14, price_usd_sale_the_house).

evidence(all_consistent(price_usd_sale_the_house)).
query(true_val(price_usd_sale_the_house, v239_95)).
query(true_val(price_usd_sale_the_house, unk_price_usd_sale_the_house)).

0.82::acc(s15, price_usd_evo).

% @attr price_usd_evo
% @type categorical
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v399_95_sale_319_96=399.95_MSRP_319.96_sale unk_price_usd_evo=Unknown
% @importance 0.7

0.68::true_val(price_usd_evo, v399_95_sale_319_96); 0.32::true_val(price_usd_evo, unk_price_usd_evo).

measured(s15, price_usd_evo, v399_95_sale_319_96).

all_consistent(price_usd_evo) :-
    consistent(s15, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v399_95_sale_319_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.55::acc(s16, price_usd_used_ebay_149).

% @attr price_usd_used_ebay_149
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD used, eBay 149cm)
% @values v165_71_plus_29_95=165.71_plus_29.95_shipping unk_price_usd_used_ebay_149=Unknown
% @importance 0.6

0.40::true_val(price_usd_used_ebay_149, v165_71_plus_29_95); 0.60::true_val(price_usd_used_ebay_149, unk_price_usd_used_ebay_149).

measured(s16, price_usd_used_ebay_149, v165_71_plus_29_95).

all_consistent(price_usd_used_ebay_149) :-
    consistent(s16, price_usd_used_ebay_149).

evidence(all_consistent(price_usd_used_ebay_149)).
query(true_val(price_usd_used_ebay_149, v165_71_plus_29_95)).
query(true_val(price_usd_used_ebay_149, unk_price_usd_used_ebay_149)).

0.88::acc(s14, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values the_house_online=The_House_online_multiple_sizes unk_availability_status=Unknown
% @importance 1.0

0.76::true_val(availability_status, the_house_online); 0.24::true_val(availability_status, unk_availability_status).

measured(s14, availability_status, the_house_online).

all_consistent(availability_status) :-
    consistent(s14, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, the_house_online)).
query(true_val(availability_status, unk_availability_status)).

0.80::acc(s10, availability_status_eriks).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status (ERIK'S)
% @values eriks_online_instore=ERIKS_online_and_instore_US_regional unk_availability_status_eriks=Unknown
% @importance 0.7

0.66::true_val(availability_status_eriks, eriks_online_instore); 0.34::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s10, availability_status_eriks, eriks_online_instore).

all_consistent(availability_status_eriks) :-
    (indep(s10), consistent(s10, availability_status_eriks) ; \+indep(s10)).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, eriks_online_instore)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

0.78::acc(s12, availability_status_shredshop).

% @attr availability_status_shredshop
% @type categorical
% @canonical false
% @original_name availability_status (Shred Shop)
% @values shredshop_online=Shred_Shop_online unk_availability_status_shredshop=Unknown
% @importance 0.5

0.63::true_val(availability_status_shredshop, shredshop_online); 0.37::true_val(availability_status_shredshop, unk_availability_status_shredshop).

measured(s12, availability_status_shredshop, shredshop_online).

all_consistent(availability_status_shredshop) :-
    (indep(s12), consistent(s12, availability_status_shredshop) ; \+indep(s12)).

evidence(all_consistent(availability_status_shredshop)).
query(true_val(availability_status_shredshop, shredshop_online)).
query(true_val(availability_status_shredshop, unk_availability_status_shredshop)).

0.85::acc(s5, availability_status_melbourne).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard Centre)
% @values melbourne_online_instore=Melbourne_Snowboard_Centre_Australia unk_availability_status_melbourne=Unknown
% @importance 0.9

0.71::true_val(availability_status_melbourne, melbourne_online_instore); 0.29::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s5, availability_status_melbourne, melbourne_online_instore).

all_consistent(availability_status_melbourne) :-
    consistent(s5, availability_status_melbourne).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, melbourne_online_instore)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

0.82::acc(s17, availability_status_sportinglife).

% @attr availability_status_sportinglife
% @type categorical
% @canonical false
% @original_name availability_status (Sporting Life)
% @values sportinglife_canada=Sporting_Life_Canada_online unk_availability_status_sportinglife=Unknown
% @importance 0.75

0.66::true_val(availability_status_sportinglife, sportinglife_canada); 0.34::true_val(availability_status_sportinglife, unk_availability_status_sportinglife).

measured(s17, availability_status_sportinglife, sportinglife_canada).

all_consistent(availability_status_sportinglife) :-
    (indep(s17), consistent(s17, availability_status_sportinglife) ; \+indep(s17)).

evidence(all_consistent(availability_status_sportinglife)).
query(true_val(availability_status_sportinglife, sportinglife_canada)).
query(true_val(availability_status_sportinglife, unk_availability_status_sportinglife)).

0.80::acc(s18, availability_status_skiessentials).

% @attr availability_status_skiessentials
% @type categorical
% @canonical false
% @original_name availability_status (Ski Essentials)
% @values skiessentials_us=Ski_Essentials_US_online unk_availability_status_skiessentials=Unknown
% @importance 0.6

0.64::true_val(availability_status_skiessentials, skiessentials_us); 0.36::true_val(availability_status_skiessentials, unk_availability_status_skiessentials).

measured(s18, availability_status_skiessentials, skiessentials_us).

all_consistent(availability_status_skiessentials) :-
    (indep(s18), consistent(s18, availability_status_skiessentials) ; \+indep(s18)).

evidence(all_consistent(availability_status_skiessentials)).
query(true_val(availability_status_skiessentials, skiessentials_us)).
query(true_val(availability_status_skiessentials, unk_availability_status_skiessentials)).

0.55::acc(s16, availability_status_ebay).

% @attr availability_status_ebay
% @type categorical
% @canonical false
% @original_name availability_status (eBay)
% @values ebay_secondary=eBay_used_secondary_market unk_availability_status_ebay=Unknown
% @importance 0.6

0.40::true_val(availability_status_ebay, ebay_secondary); 0.60::true_val(availability_status_ebay, unk_availability_status_ebay).

measured(s16, availability_status_ebay, ebay_secondary).

all_consistent(availability_status_ebay) :-
    consistent(s16, availability_status_ebay).

evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, ebay_secondary)).
query(true_val(availability_status_ebay, unk_availability_status_ebay)).

0.80::acc(s10, availability_status_soldout).

% @attr availability_status_soldout
% @type categorical
% @canonical false
% @original_name availability_status (sold out note)
% @values all_sold_out=All_sizes_sold_out_or_unavailable unk_availability_status_soldout=Unknown
% @importance 0.7

0.66::true_val(availability_status_soldout, all_sold_out); 0.34::true_val(availability_status_soldout, unk_availability_status_soldout).

measured(s10, availability_status_soldout, all_sold_out).

all_consistent(availability_status_soldout) :-
    (indep(s10), consistent(s10, availability_status_soldout) ; \+indep(s10)).

evidence(all_consistent(availability_status_soldout)).
query(true_val(availability_status_soldout, all_sold_out)).
query(true_val(availability_status_soldout, unk_availability_status_soldout)).

0.88::acc(s1, shape).
0.87::acc(s5, shape).
0.90::acc(s14, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.917

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).

measured(s1, shape, directional_twin).
measured(s5, shape, directional_twin).
measured(s14, shape, directional_twin).

all_consistent(shape) :-
    consistent(s14, shape),
    (indep(s1), consistent(s1, shape) ; \+indep(s1)),
    (indep(s5), consistent(s5, shape) ; \+indep(s5)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

0.87::acc(s5, shape_description).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape (ride description)
% @values true_twin_setback=Rides_like_true_twin_setback_stance_for_nose_float unk_shape_description=Unknown
% @importance 0.9

0.71::true_val(shape_description, true_twin_setback); 0.29::true_val(shape_description, unk_shape_description).

measured(s5, shape_description, true_twin_setback).

all_consistent(shape_description) :-
    consistent(s5, shape_description).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, true_twin_setback)).
query(true_val(shape_description, unk_shape_description)).

0.88::acc(s1, camber_type).
0.87::acc(s5, camber_type).
0.90::acc(s14, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values flat_out_camber=Flat_Out_Camber unk_camber_type=Unknown
% @importance 0.917

0.95::true_val(camber_type, flat_out_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, flat_out_camber).
measured(s5, camber_type, flat_out_camber).
measured(s14, camber_type, flat_out_camber).

all_consistent(camber_type) :-
    consistent(s14, camber_type),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)),
    (indep(s5), consistent(s5, camber_type) ; \+indep(s5)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, flat_out_camber)).
query(true_val(camber_type, unk_camber_type)).

0.87::acc(s5, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values flat_profile_loaded_camber=Flat_profile_contact_to_contact_loaded_camber_underfoot unk_camber_description=Unknown
% @importance 0.9

0.71::true_val(camber_description, flat_profile_loaded_camber); 0.29::true_val(camber_description, unk_camber_description).

measured(s5, camber_description, flat_profile_loaded_camber).

all_consistent(camber_description) :-
    consistent(s5, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_profile_loaded_camber)).
query(true_val(camber_description, unk_camber_description)).

0.88::acc(s1, sidecut_type).
0.87::acc(s5, sidecut_type).
0.90::acc(s14, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radial=Radial unk_sidecut_type=Unknown
% @importance 0.917

0.95::true_val(sidecut_type, radial); 0.05::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, radial).
measured(s5, sidecut_type, radial).
measured(s14, sidecut_type, radial).

all_consistent(sidecut_type) :-
    consistent(s14, sidecut_type),
    (indep(s1), consistent(s1, sidecut_type) ; \+indep(s1)),
    (indep(s5), consistent(s5, sidecut_type) ; \+indep(s5)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.87::acc(s5, sidecut_description).
0.85::acc(s19, sidecut_description).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values traditional_predictable=Traditional_curved_sidecut_predictable_consistent unk_sidecut_description=Unknown
% @importance 0.775

0.95::true_val(sidecut_description, traditional_predictable); 0.05::true_val(sidecut_description, unk_sidecut_description).

measured(s5, sidecut_description, traditional_predictable).
measured(s19, sidecut_description, traditional_predictable).

all_consistent(sidecut_description) :-
    consistent(s5, sidecut_description),
    (indep(s19), consistent(s19, sidecut_description) ; \+indep(s19)).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, traditional_predictable)).
query(true_val(sidecut_description, unk_sidecut_description)).

0.90::acc(s5, flex_rating_10).
0.93::acc(smerchant, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v2=2.0 unk_flex_rating_10=Unknown
% @importance 0.875

0.95::true_val(flex_rating_10, v2); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s5, flex_rating_10, v2).
measured(smerchant, flex_rating_10, v2).

all_consistent(flex_rating_10) :-
    consistent(s5, flex_rating_10),
    (indep(smerchant), consistent(smerchant, flex_rating_10) ; \+indep(smerchant)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v2)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.87::acc(s5, flex_feel).
0.90::acc(smerchant, flex_feel).
0.80::acc(s10, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values soft_forgiving=Soft_forgiving_flex unk_flex_feel=Unknown
% @importance 0.817

0.95::true_val(flex_feel, soft_forgiving); 0.05::true_val(flex_feel, unk_flex_feel).

measured(s5, flex_feel, soft_forgiving).
measured(smerchant, flex_feel, soft_forgiving).
measured(s10, flex_feel, soft_forgiving).

all_consistent(flex_feel) :-
    consistent(s5, flex_feel),
    (indep(smerchant), consistent(smerchant, flex_feel) ; \+indep(smerchant)),
    (indep(s10), consistent(s10, flex_feel) ; \+indep(s10)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, soft_forgiving)).
query(true_val(flex_feel, unk_flex_feel)).

0.92::acc(s14, setback).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v10=10.0 unk_setback=Unknown
% @importance 1.0

0.76::true_val(setback, v10); 0.24::true_val(setback, unk_setback).

measured(s14, setback, v10).

all_consistent(setback) :-
    consistent(s14, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v10)).
query(true_val(setback, unk_setback)).

0.90::acc(s14, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values regular_and_wide=Regular_and_Wide unk_width_options=Unknown
% @importance 1.0

0.76::true_val(width_options, regular_and_wide); 0.24::true_val(width_options, unk_width_options).

measured(s14, width_options, regular_and_wide).

all_consistent(width_options) :-
    consistent(s14, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, regular_and_wide)).
query(true_val(width_options, unk_width_options)).

0.88::acc(s1, core_material).
0.87::acc(s5, core_material).
0.90::acc(s14, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_wood=Aspen_wood unk_core_material=Unknown
% @importance 0.917

0.95::true_val(core_material, aspen_wood); 0.05::true_val(core_material, unk_core_material).

measured(s1, core_material, aspen_wood).
measured(s5, core_material, aspen_wood).
measured(s14, core_material, aspen_wood).

all_consistent(core_material) :-
    consistent(s14, core_material),
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)),
    (indep(s5), consistent(s5, core_material) ; \+indep(s5)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_wood)).
query(true_val(core_material, unk_core_material)).

0.90::acc(s14, sustainability_certification).
0.93::acc(smerchant, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified_wood_core unk_sustainability_certification=Unknown
% @importance 0.925

0.95::true_val(sustainability_certification, fsc_certified); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s14, sustainability_certification, fsc_certified).
measured(smerchant, sustainability_certification, fsc_certified).

all_consistent(sustainability_certification) :-
    consistent(s14, sustainability_certification),
    (indep(smerchant), consistent(smerchant, sustainability_certification) ; \+indep(smerchant)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.88::acc(s1, laminate).
0.90::acc(s14, laminate).
0.93::acc(smerchant, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values ba_ld_glass=BA_LD_Glass_low_density_fiberglass unk_laminate=Unknown
% @importance 0.9

0.95::true_val(laminate, ba_ld_glass); 0.05::true_val(laminate, unk_laminate).

measured(s1, laminate, ba_ld_glass).
measured(s14, laminate, ba_ld_glass).
measured(smerchant, laminate, ba_ld_glass).

all_consistent(laminate) :-
    consistent(s14, laminate),
    (indep(s1), consistent(s1, laminate) ; \+indep(s1)),
    (indep(smerchant), consistent(smerchant, laminate) ; \+indep(smerchant)).

evidence(all_consistent(laminate)).
query(true_val(laminate, ba_ld_glass)).
query(true_val(laminate, unk_laminate)).

0.90::acc(smerchant, laminate_description).

% @attr laminate_description
% @type categorical
% @canonical false
% @original_name laminate (description)
% @values low_density_playful=Low_density_fiberglass_playful_feel_more_torsional_flex unk_laminate_description=Unknown
% @importance 0.85

0.85::true_val(laminate_description, low_density_playful); 0.15::true_val(laminate_description, unk_laminate_description).

measured(smerchant, laminate_description, low_density_playful).

all_consistent(laminate_description) :-
    consistent(smerchant, laminate_description).

evidence(all_consistent(laminate_description)).
query(true_val(laminate_description, low_density_playful)).
query(true_val(laminate_description, unk_laminate_description)).

0.88::acc(s1, base_type).
0.87::acc(s5, base_type).
0.90::acc(s14, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values extruded=Extruded unk_base_type=Unknown
% @importance 0.917

0.95::true_val(base_type, extruded); 0.05::true_val(base_type, unk_base_type).

measured(s1, base_type, extruded).
measured(s5, base_type, extruded).
measured(s14, base_type, extruded).

all_consistent(base_type) :-
    consistent(s14, base_type),
    (indep(s1), consistent(s1, base_type) ; \+indep(s1)),
    (indep(s5), consistent(s5, base_type) ; \+indep(s5)).

evidence(all_consistent(base_type)).
query(true_val(base_type, extruded)).
query(true_val(base_type, unk_base_type)).

0.80::acc(s10, base_type_description).
0.90::acc(smerchant, base_type_description).

% @attr base_type_description
% @type categorical
% @canonical false
% @original_name base_type (description)
% @values durable_low_maintenance=Durable_low_maintenance_beginner_freestyle unk_base_type_description=Unknown
% @importance 0.775

0.95::true_val(base_type_description, durable_low_maintenance); 0.05::true_val(base_type_description, unk_base_type_description).

measured(s10, base_type_description, durable_low_maintenance).
measured(smerchant, base_type_description, durable_low_maintenance).

all_consistent(base_type_description) :-
    consistent(smerchant, base_type_description),
    (indep(s10), consistent(s10, base_type_description) ; \+indep(s10)).

evidence(all_consistent(base_type_description)).
query(true_val(base_type_description, durable_low_maintenance)).
query(true_val(base_type_description, unk_base_type_description)).

0.90::acc(s14, base_finish).

% @attr base_finish
% @type categorical
% @canonical false
% @original_name Base finish
% @values standard_stone=Standard_stone_finish unk_base_finish=Unknown
% @importance 1.0

0.76::true_val(base_finish, standard_stone); 0.24::true_val(base_finish, unk_base_finish).

measured(s14, base_finish, standard_stone).

all_consistent(base_finish) :-
    consistent(s14, base_finish).

evidence(all_consistent(base_finish)).
query(true_val(base_finish, standard_stone)).
query(true_val(base_finish, unk_base_finish)).

0.90::acc(s14, factory_wax).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values natural_wax=Natural_Wax unk_factory_wax=Unknown
% @importance 1.0

0.76::true_val(factory_wax, natural_wax); 0.24::true_val(factory_wax, unk_factory_wax).

measured(s14, factory_wax, natural_wax).

all_consistent(factory_wax) :-
    consistent(s14, factory_wax).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, natural_wax)).
query(true_val(factory_wax, unk_factory_wax)).

0.88::acc(s1, sidewall_material).
0.87::acc(s5, sidewall_material).
0.90::acc(s14, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs=ABS unk_sidewall_material=Unknown
% @importance 0.917

0.95::true_val(sidewall_material, abs); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s1, sidewall_material, abs).
measured(s5, sidewall_material, abs).
measured(s14, sidewall_material, abs).

all_consistent(sidewall_material) :-
    consistent(s14, sidewall_material),
    (indep(s1), consistent(s1, sidewall_material) ; \+indep(s1)),
    (indep(s5), consistent(s5, sidewall_material) ; \+indep(s5)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.85::acc(s1, sidewall_material_description).
0.90::acc(smerchant, sidewall_material_description).

% @attr sidewall_material_description
% @type categorical
% @canonical false
% @original_name sidewall_material (description)
% @values shock_absorbing_energy=Tough_shock_absorbing_energy_transfer unk_sidewall_material_description=Unknown
% @importance 0.85

0.95::true_val(sidewall_material_description, shock_absorbing_energy); 0.05::true_val(sidewall_material_description, unk_sidewall_material_description).

measured(s1, sidewall_material_description, shock_absorbing_energy).
measured(smerchant, sidewall_material_description, shock_absorbing_energy).

all_consistent(sidewall_material_description) :-
    consistent(smerchant, sidewall_material_description),
    (indep(s1), consistent(s1, sidewall_material_description) ; \+indep(s1)).

evidence(all_consistent(sidewall_material_description)).
query(true_val(sidewall_material_description, shock_absorbing_energy)).
query(true_val(sidewall_material_description, unk_sidewall_material_description)).

0.88::acc(s1, edge_technology).
0.87::acc(s5, edge_technology).
0.90::acc(s14, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values bite_free=Bite_Free_Edges unk_edge_technology=Unknown
% @importance 0.917

0.95::true_val(edge_technology, bite_free); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, bite_free).
measured(s5, edge_technology, bite_free).
measured(s14, edge_technology, bite_free).

all_consistent(edge_technology) :-
    consistent(s14, edge_technology),
    (indep(s1), consistent(s1, edge_technology) ; \+indep(s1)),
    (indep(s5), consistent(s5, edge_technology) ; \+indep(s5)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, bite_free)).
query(true_val(edge_technology, unk_edge_technology)).

0.82::acc(s17, edge_technology_description).
0.90::acc(smerchant, edge_technology_description).

% @attr edge_technology_description
% @type categorical
% @canonical false
% @original_name edge_technology (description)
% @values pretuned_detuned=Pre_tuned_minimum_catch_factory_detuned_tip_tail unk_edge_technology_description=Unknown
% @importance 0.8

0.95::true_val(edge_technology_description, pretuned_detuned); 0.05::true_val(edge_technology_description, unk_edge_technology_description).

measured(s17, edge_technology_description, pretuned_detuned).
measured(smerchant, edge_technology_description, pretuned_detuned).

all_consistent(edge_technology_description) :-
    consistent(smerchant, edge_technology_description),
    (indep(s17), consistent(s17, edge_technology_description) ; \+indep(s17)).

evidence(all_consistent(edge_technology_description)).
query(true_val(edge_technology_description, pretuned_detuned)).
query(true_val(edge_technology_description, unk_edge_technology_description)).

0.88::acc(s1, mounting_pattern).
0.90::acc(s14, mounting_pattern).
0.93::acc(smerchant, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_4x2=4x2_Inserts unk_mounting_pattern=Unknown
% @importance 0.9

0.95::true_val(mounting_pattern, inserts_4x2); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_4x2).
measured(s14, mounting_pattern, inserts_4x2).
measured(smerchant, mounting_pattern, inserts_4x2).

all_consistent(mounting_pattern) :-
    consistent(s14, mounting_pattern),
    (indep(s1), consistent(s1, mounting_pattern) ; \+indep(s1)),
    (indep(smerchant), consistent(smerchant, mounting_pattern) ; \+indep(smerchant)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_4x2)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.90::acc(s14, available_sizes).
0.88::acc(smerchant, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values nine_sizes=142_145_149_152_156_160_163_158W_162W seven_sizes=145_149_152_156_158W_160_162W
% @importance 0.925

0.55::true_val(available_sizes, nine_sizes); 0.45::true_val(available_sizes, seven_sizes).

measured(s14, available_sizes, nine_sizes).
measured(smerchant, available_sizes, seven_sizes).

all_consistent(available_sizes) :-
    consistent(s14, available_sizes),
    consistent(smerchant, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, nine_sizes)).
query(true_val(available_sizes, seven_sizes)).

0.92::acc(s14, waist_width_142).

% @attr waist_width_142
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 142cm
% @values v23_9=23.9 unk_waist_width_142=Unknown
% @importance 1.0

0.76::true_val(waist_width_142, v23_9); 0.24::true_val(waist_width_142, unk_waist_width_142).

measured(s14, waist_width_142, v23_9).

all_consistent(waist_width_142) :-
    consistent(s14, waist_width_142).

evidence(all_consistent(waist_width_142)).
query(true_val(waist_width_142, v23_9)).
query(true_val(waist_width_142, unk_waist_width_142)).

0.92::acc(s14, waist_width_145).

% @attr waist_width_145
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 145cm
% @values v24_3=24.3 unk_waist_width_145=Unknown
% @importance 1.0

0.76::true_val(waist_width_145, v24_3); 0.24::true_val(waist_width_145, unk_waist_width_145).

measured(s14, waist_width_145, v24_3).

all_consistent(waist_width_145) :-
    consistent(s14, waist_width_145).

evidence(all_consistent(waist_width_145)).
query(true_val(waist_width_145, v24_3)).
query(true_val(waist_width_145, unk_waist_width_145)).

0.92::acc(s14, waist_width_149).
0.93::acc(smerchant, waist_width_149).

% @attr waist_width_149
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 149cm
% @values v24_5=24.5 unk_waist_width_149=Unknown
% @importance 0.925

0.95::true_val(waist_width_149, v24_5); 0.05::true_val(waist_width_149, unk_waist_width_149).

measured(s14, waist_width_149, v24_5).
measured(smerchant, waist_width_149, v24_5).

all_consistent(waist_width_149) :-
    consistent(s14, waist_width_149),
    (indep(smerchant), consistent(smerchant, waist_width_149) ; \+indep(smerchant)).

evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v24_5)).
query(true_val(waist_width_149, unk_waist_width_149)).

0.92::acc(s14, waist_width_152).
0.93::acc(smerchant, waist_width_152).

% @attr waist_width_152
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 152cm
% @values v24_7=24.7 unk_waist_width_152=Unknown
% @importance 0.925

0.95::true_val(waist_width_152, v24_7); 0.05::true_val(waist_width_152, unk_waist_width_152).

measured(s14, waist_width_152, v24_7).
measured(smerchant, waist_width_152, v24_7).

all_consistent(waist_width_152) :-
    consistent(s14, waist_width_152),
    (indep(smerchant), consistent(smerchant, waist_width_152) ; \+indep(smerchant)).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v24_7)).
query(true_val(waist_width_152, unk_waist_width_152)).

0.92::acc(s14, waist_width_156).
0.93::acc(smerchant, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v25_1=25.1 unk_waist_width_156=Unknown
% @importance 0.925

0.95::true_val(waist_width_156, v25_1); 0.05::true_val(waist_width_156, unk_waist_width_156).

measured(s14, waist_width_156, v25_1).
measured(smerchant, waist_width_156, v25_1).

all_consistent(waist_width_156) :-
    consistent(s14, waist_width_156),
    (indep(smerchant), consistent(smerchant, waist_width_156) ; \+indep(smerchant)).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_1)).
query(true_val(waist_width_156, unk_waist_width_156)).

0.92::acc(s14, waist_width_160).
0.93::acc(smerchant, waist_width_160).

% @attr waist_width_160
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 160cm
% @values v25_6=25.6 unk_waist_width_160=Unknown
% @importance 0.925

0.95::true_val(waist_width_160, v25_6); 0.05::true_val(waist_width_160, unk_waist_width_160).

measured(s14, waist_width_160, v25_6).
measured(smerchant, waist_width_160, v25_6).

all_consistent(waist_width_160) :-
    consistent(s14, waist_width_160),
    (indep(smerchant), consistent(smerchant, waist_width_160) ; \+indep(smerchant)).

evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v25_6)).
query(true_val(waist_width_160, unk_waist_width_160)).

0.92::acc(s14, waist_width_163).

% @attr waist_width_163
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 163cm
% @values v25_9=25.9 unk_waist_width_163=Unknown
% @importance 1.0

0.76::true_val(waist_width_163, v25_9); 0.24::true_val(waist_width_163, unk_waist_width_163).

measured(s14, waist_width_163, v25_9).

all_consistent(waist_width_163) :-
    consistent(s14, waist_width_163).

evidence(all_consistent(waist_width_163)).
query(true_val(waist_width_163, v25_9)).
query(true_val(waist_width_163, unk_waist_width_163)).

0.92::acc(s14, waist_width_158w).
0.93::acc(smerchant, waist_width_158w).

% @attr waist_width_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 158W
% @values v26_0=26.0 unk_waist_width_158w=Unknown
% @importance 0.925

0.95::true_val(waist_width_158w, v26_0); 0.05::true_val(waist_width_158w, unk_waist_width_158w).

measured(s14, waist_width_158w, v26_0).
measured(smerchant, waist_width_158w, v26_0).

all_consistent(waist_width_158w) :-
    consistent(s14, waist_width_158w),
    (indep(smerchant), consistent(smerchant, waist_width_158w) ; \+indep(smerchant)).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_0)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

0.92::acc(s14, waist_width_162w).
0.93::acc(smerchant, waist_width_162w).

% @attr waist_width_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162W
% @values v26_5=26.5 unk_waist_width_162w=Unknown
% @importance 0.925

0.95::true_val(waist_width_162w, v26_5); 0.05::true_val(waist_width_162w, unk_waist_width_162w).

measured(s14, waist_width_162w, v26_5).
measured(smerchant, waist_width_162w, v26_5).

all_consistent(waist_width_162w) :-
    consistent(s14, waist_width_162w),
    (indep(smerchant), consistent(smerchant, waist_width_162w) ; \+indep(smerchant)).

evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v26_5)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

0.92::acc(s14, effective_edge_145).

% @attr effective_edge_145
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 145cm
% @values v110=110.0 unk_effective_edge_145=Unknown
% @importance 1.0

0.76::true_val(effective_edge_145, v110); 0.24::true_val(effective_edge_145, unk_effective_edge_145).

measured(s14, effective_edge_145, v110).

all_consistent(effective_edge_145) :-
    consistent(s14, effective_edge_145).

evidence(all_consistent(effective_edge_145)).
query(true_val(effective_edge_145, v110)).
query(true_val(effective_edge_145, unk_effective_edge_145)).

0.92::acc(s14, effective_edge_149).
0.93::acc(smerchant, effective_edge_149).

% @attr effective_edge_149
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 149cm
% @values v113=113.0 unk_effective_edge_149=Unknown
% @importance 0.925

0.95::true_val(effective_edge_149, v113); 0.05::true_val(effective_edge_149, unk_effective_edge_149).

measured(s14, effective_edge_149, v113).
measured(smerchant, effective_edge_149, v113).

all_consistent(effective_edge_149) :-
    consistent(s14, effective_edge_149),
    (indep(smerchant), consistent(smerchant, effective_edge_149) ; \+indep(smerchant)).

evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v113)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

0.92::acc(s14, effective_edge_152).
0.93::acc(smerchant, effective_edge_152).

% @attr effective_edge_152
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 152cm
% @values v114_5=114.5 unk_effective_edge_152=Unknown
% @importance 0.925

0.95::true_val(effective_edge_152, v114_5); 0.05::true_val(effective_edge_152, unk_effective_edge_152).

measured(s14, effective_edge_152, v114_5).
measured(smerchant, effective_edge_152, v114_5).

all_consistent(effective_edge_152) :-
    consistent(s14, effective_edge_152),
    (indep(smerchant), consistent(smerchant, effective_edge_152) ; \+indep(smerchant)).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v114_5)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

0.92::acc(s14, effective_edge_156).
0.93::acc(smerchant, effective_edge_156).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 156cm
% @values v117_5=117.5 unk_effective_edge_156=Unknown
% @importance 0.925

0.95::true_val(effective_edge_156, v117_5); 0.05::true_val(effective_edge_156, unk_effective_edge_156).

measured(s14, effective_edge_156, v117_5).
measured(smerchant, effective_edge_156, v117_5).

all_consistent(effective_edge_156) :-
    consistent(s14, effective_edge_156),
    (indep(smerchant), consistent(smerchant, effective_edge_156) ; \+indep(smerchant)).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v117_5)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

0.92::acc(s14, effective_edge_160).
0.93::acc(smerchant, effective_edge_160).

% @attr effective_edge_160
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 160cm
% @values v121=121.0 unk_effective_edge_160=Unknown
% @importance 0.925

0.95::true_val(effective_edge_160, v121); 0.05::true_val(effective_edge_160, unk_effective_edge_160).

measured(s14, effective_edge_160, v121).
measured(smerchant, effective_edge_160, v121).

all_consistent(effective_edge_160) :-
    consistent(s14, effective_edge_160),
    (indep(smerchant), consistent(smerchant, effective_edge_160) ; \+indep(smerchant)).

evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v121)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

0.92::acc(s14, effective_edge_158w).
0.93::acc(smerchant, effective_edge_158w).

% @attr effective_edge_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 158W
% @values v119_5=119.5 unk_effective_edge_158w=Unknown
% @importance 0.925

0.95::true_val(effective_edge_158w, v119_5); 0.05::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(s14, effective_edge_158w, v119_5).
measured(smerchant, effective_edge_158w, v119_5).

all_consistent(effective_edge_158w) :-
    consistent(s14, effective_edge_158w),
    (indep(smerchant), consistent(smerchant, effective_edge_158w) ; \+indep(smerchant)).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v119_5)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

0.92::acc(s14, effective_edge_162w).
0.93::acc(smerchant, effective_edge_162w).

% @attr effective_edge_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 162W
% @values v123_5=123.5 unk_effective_edge_162w=Unknown
% @importance 0.925

0.95::true_val(effective_edge_162w, v123_5); 0.05::true_val(effective_edge_162w, unk_effective_edge_162w).

measured(s14, effective_edge_162w, v123_5).
measured(smerchant, effective_edge_162w, v123_5).

all_consistent(effective_edge_162w) :-
    consistent(s14, effective_edge_162w),
    (indep(smerchant), consistent(smerchant, effective_edge_162w) ; \+indep(smerchant)).

evidence(all_consistent(effective_edge_162w)).
query(true_val(effective_edge_162w, v123_5)).
query(true_val(effective_edge_162w, unk_effective_edge_162w)).

0.92::acc(s14, tip_tail_width_size_149).
0.93::acc(smerchant, tip_tail_width_size_149).

% @attr tip_tail_width_size_149
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (149cm)
% @values v29_0=29.0/29.0 unk_tip_tail_width_size_149=Unknown
% @importance 0.925

0.95::true_val(tip_tail_width_size_149, v29_0); 0.05::true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149).

measured(s14, tip_tail_width_size_149, v29_0).
measured(smerchant, tip_tail_width_size_149, v29_0).

all_consistent(tip_tail_width_size_149) :-
    consistent(s14, tip_tail_width_size_149),
    (indep(smerchant), consistent(smerchant, tip_tail_width_size_149) ; \+indep(smerchant)).

evidence(all_consistent(tip_tail_width_size_149)).
query(true_val(tip_tail_width_size_149, v29_0)).
query(true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149)).

0.92::acc(s14, tip_tail_width_size_152).
0.93::acc(smerchant, tip_tail_width_size_152).

% @attr tip_tail_width_size_152
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (152cm)
% @values v29_2=29.2/29.2 unk_tip_tail_width_size_152=Unknown
% @importance 0.925

0.95::true_val(tip_tail_width_size_152, v29_2); 0.05::true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152).

measured(s14, tip_tail_width_size_152, v29_2).
measured(smerchant, tip_tail_width_size_152, v29_2).

all_consistent(tip_tail_width_size_152) :-
    consistent(s14, tip_tail_width_size_152),
    (indep(smerchant), consistent(smerchant, tip_tail_width_size_152) ; \+indep(smerchant)).

evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, v29_2)).
query(true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152)).

0.92::acc(s14, tip_tail_width_size).
0.93::acc(smerchant, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size (156cm)
% @values v29_6=29.6/29.6 unk_tip_tail_width_size=Unknown
% @importance 0.925

0.95::true_val(tip_tail_width_size, v29_6); 0.05::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s14, tip_tail_width_size, v29_6).
measured(smerchant, tip_tail_width_size, v29_6).

all_consistent(tip_tail_width_size) :-
    consistent(s14, tip_tail_width_size),
    (indep(smerchant), consistent(smerchant, tip_tail_width_size) ; \+indep(smerchant)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_6)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.92::acc(s14, tip_tail_width_size_160).
0.93::acc(smerchant, tip_tail_width_size_160).

% @attr tip_tail_width_size_160
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (160cm)
% @values v30_0=30.0/30.0 unk_tip_tail_width_size_160=Unknown
% @importance 0.925

0.95::true_val(tip_tail_width_size_160, v30_0); 0.05::true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160).

measured(s14, tip_tail_width_size_160, v30_0).
measured(smerchant, tip_tail_width_size_160, v30_0).

all_consistent(tip_tail_width_size_160) :-
    consistent(s14, tip_tail_width_size_160),
    (indep(smerchant), consistent(smerchant, tip_tail_width_size_160) ; \+indep(smerchant)).

evidence(all_consistent(tip_tail_width_size_160)).
query(true_val(tip_tail_width_size_160, v30_0)).
query(true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160)).

0.92::acc(s14, tip_tail_width_size_158w).
0.93::acc(smerchant, tip_tail_width_size_158w).

% @attr tip_tail_width_size_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (158W)
% @values v30_6=30.6/30.6 unk_tip_tail_width_size_158w=Unknown
% @importance 0.925

0.95::true_val(tip_tail_width_size_158w, v30_6); 0.05::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).

measured(s14, tip_tail_width_size_158w, v30_6).
measured(smerchant, tip_tail_width_size_158w, v30_6).

all_consistent(tip_tail_width_size_158w) :-
    consistent(s14, tip_tail_width_size_158w),
    (indep(smerchant), consistent(smerchant, tip_tail_width_size_158w) ; \+indep(smerchant)).

evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v30_6)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

0.92::acc(s14, tip_tail_width_size_162w).
0.93::acc(smerchant, tip_tail_width_size_162w).

% @attr tip_tail_width_size_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (162W)
% @values v30_9=30.9/30.9 unk_tip_tail_width_size_162w=Unknown
% @importance 0.925

0.95::true_val(tip_tail_width_size_162w, v30_9); 0.05::true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w).

measured(s14, tip_tail_width_size_162w, v30_9).
measured(smerchant, tip_tail_width_size_162w, v30_9).

all_consistent(tip_tail_width_size_162w) :-
    consistent(s14, tip_tail_width_size_162w),
    (indep(smerchant), consistent(smerchant, tip_tail_width_size_162w) ; \+indep(smerchant)).

evidence(all_consistent(tip_tail_width_size_162w)).
query(true_val(tip_tail_width_size_162w, v30_9)).
query(true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w)).

0.92::acc(s14, stance_width_range_size_145).

% @attr stance_width_range_size_145
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (145cm)
% @values v464_576=464/576mm unk_stance_width_range_size_145=Unknown
% @importance 1.0

0.76::true_val(stance_width_range_size_145, v464_576); 0.24::true_val(stance_width_range_size_145, unk_stance_width_range_size_145).

measured(s14, stance_width_range_size_145, v464_576).

all_consistent(stance_width_range_size_145) :-
    consistent(s14, stance_width_range_size_145).

evidence(all_consistent(stance_width_range_size_145)).
query(true_val(stance_width_range_size_145, v464_576)).
query(true_val(stance_width_range_size_145, unk_stance_width_range_size_145)).

0.92::acc(s14, stance_width_range_size_149).

% @attr stance_width_range_size_149
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (149cm)
% @values v474_586=474/586mm unk_stance_width_range_size_149=Unknown
% @importance 1.0

0.76::true_val(stance_width_range_size_149, v474_586); 0.24::true_val(stance_width_range_size_149, unk_stance_width_range_size_149).

measured(s14, stance_width_range_size_149, v474_586).

all_consistent(stance_width_range_size_149) :-
    consistent(s14, stance_width_range_size_149).

evidence(all_consistent(stance_width_range_size_149)).
query(true_val(stance_width_range_size_149, v474_586)).
query(true_val(stance_width_range_size_149, unk_stance_width_range_size_149)).

0.92::acc(s14, stance_width_range_size_152).

% @attr stance_width_range_size_152
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (152cm)
% @values v484_596=484/596mm unk_stance_width_range_size_152=Unknown
% @importance 1.0

0.76::true_val(stance_width_range_size_152, v484_596); 0.24::true_val(stance_width_range_size_152, unk_stance_width_range_size_152).

measured(s14, stance_width_range_size_152, v484_596).

all_consistent(stance_width_range_size_152) :-
    consistent(s14, stance_width_range_size_152).

evidence(all_consistent(stance_width_range_size_152)).
query(true_val(stance_width_range_size_152, v484_596)).
query(true_val(stance_width_range_size_152, unk_stance_width_range_size_152)).

0.92::acc(s14, stance_width_range_size).

% @attr stance_width_range_size
% @type categorical
% @unit mm
% @canonical true
% @original_name stance_width_range_size (156cm)
% @values v494_606=494/606mm unk_stance_width_range_size=Unknown
% @importance 1.0

0.76::true_val(stance_width_range_size, v494_606); 0.24::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s14, stance_width_range_size, v494_606).

all_consistent(stance_width_range_size) :-
    consistent(s14, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v494_606)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.92::acc(s14, stance_width_range_size_160).

% @attr stance_width_range_size_160
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (160cm)
% @values v504_616=504/616mm unk_stance_width_range_size_160=Unknown
% @importance 1.0

0.76::true_val(stance_width_range_size_160, v504_616); 0.24::true_val(stance_width_range_size_160, unk_stance_width_range_size_160).

measured(s14, stance_width_range_size_160, v504_616).

all_consistent(stance_width_range_size_160) :-
    consistent(s14, stance_width_range_size_160).

evidence(all_consistent(stance_width_range_size_160)).
query(true_val(stance_width_range_size_160, v504_616)).
query(true_val(stance_width_range_size_160, unk_stance_width_range_size_160)).

0.92::acc(s14, stance_width_range_size_158w).

% @attr stance_width_range_size_158w
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (158W)
% @values v504_616w=504/616mm unk_stance_width_range_size_158w=Unknown
% @importance 1.0

0.76::true_val(stance_width_range_size_158w, v504_616w); 0.24::true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w).

measured(s14, stance_width_range_size_158w, v504_616w).

all_consistent(stance_width_range_size_158w) :-
    consistent(s14, stance_width_range_size_158w).

evidence(all_consistent(stance_width_range_size_158w)).
query(true_val(stance_width_range_size_158w, v504_616w)).
query(true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w)).

0.92::acc(s14, stance_width_range_size_162w).

% @attr stance_width_range_size_162w
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (162W)
% @values v514_626=514/626mm unk_stance_width_range_size_162w=Unknown
% @importance 1.0

0.76::true_val(stance_width_range_size_162w, v514_626); 0.24::true_val(stance_width_range_size_162w, unk_stance_width_range_size_162w).

measured(s14, stance_width_range_size_162w, v514_626).

all_consistent(stance_width_range_size_162w) :-
    consistent(s14, stance_width_range_size_162w).

evidence(all_consistent(stance_width_range_size_162w)).
query(true_val(stance_width_range_size_162w, v514_626)).
query(true_val(stance_width_range_size_162w, unk_stance_width_range_size_162w)).

0.93::acc(smerchant, recommended_weight_range_size_145).

% @attr recommended_weight_range_size_145
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (145cm)
% @values v50_65=50-65kg unk_recommended_weight_range_size_145=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_145, v50_65); 0.05::true_val(recommended_weight_range_size_145, unk_recommended_weight_range_size_145).

measured(smerchant, recommended_weight_range_size_145, v50_65).

all_consistent(recommended_weight_range_size_145) :-
    consistent(smerchant, recommended_weight_range_size_145).

evidence(all_consistent(recommended_weight_range_size_145)).
query(true_val(recommended_weight_range_size_145, v50_65)).
query(true_val(recommended_weight_range_size_145, unk_recommended_weight_range_size_145)).

0.93::acc(smerchant, recommended_weight_range_size_149).

% @attr recommended_weight_range_size_149
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (149cm)
% @values v52_70=52-70kg unk_recommended_weight_range_size_149=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_149, v52_70); 0.05::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).

measured(smerchant, recommended_weight_range_size_149, v52_70).

all_consistent(recommended_weight_range_size_149) :-
    consistent(smerchant, recommended_weight_range_size_149).

evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, v52_70)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

0.93::acc(smerchant, recommended_weight_range_size_152).

% @attr recommended_weight_range_size_152
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (152cm)
% @values v55_75=55-75kg unk_recommended_weight_range_size_152=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_152, v55_75); 0.05::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(smerchant, recommended_weight_range_size_152, v55_75).

all_consistent(recommended_weight_range_size_152) :-
    consistent(smerchant, recommended_weight_range_size_152).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, v55_75)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

0.93::acc(smerchant, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (156cm)
% @values v60_90=60-90kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size, v60_90); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(smerchant, recommended_weight_range_size, v60_90).

all_consistent(recommended_weight_range_size) :-
    consistent(smerchant, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v60_90)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.93::acc(smerchant, recommended_weight_range_size_158w).

% @attr recommended_weight_range_size_158w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (158W)
% @values v60_plus=60+kg unk_recommended_weight_range_size_158w=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_158w, v60_plus); 0.05::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(smerchant, recommended_weight_range_size_158w, v60_plus).

all_consistent(recommended_weight_range_size_158w) :-
    consistent(smerchant, recommended_weight_range_size_158w).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, v60_plus)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

0.93::acc(smerchant, recommended_weight_range_size_162w).

% @attr recommended_weight_range_size_162w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (162W)
% @values v65_plus=65+kg unk_recommended_weight_range_size_162w=Unknown
% @importance 0.85

0.95::true_val(recommended_weight_range_size_162w, v65_plus); 0.05::true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w).

measured(smerchant, recommended_weight_range_size_162w, v65_plus).

all_consistent(recommended_weight_range_size_162w) :-
    consistent(smerchant, recommended_weight_range_size_162w).

evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, v65_plus)).
query(true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w)).

0.88::acc(s1, rider_level).
0.87::acc(s5, rider_level).
0.93::acc(smerchant, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner=Beginner unk_rider_level=Unknown
% @importance 0.867

0.95::true_val(rider_level, beginner); 0.05::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, beginner).
measured(s5, rider_level, beginner).
measured(smerchant, rider_level, beginner).

all_consistent(rider_level) :-
    consistent(s5, rider_level),
    (indep(s1), consistent(s1, rider_level) ; \+indep(s1)),
    (indep(smerchant), consistent(smerchant, rider_level) ; \+indep(smerchant)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner)).
query(true_val(rider_level, unk_rider_level)).

0.88::acc(s14, skill_level_recommendation).
0.82::acc(s5, skill_level_recommendation).
0.80::acc(s17, skill_level_recommendation).
0.90::acc(smerchant, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_intermediate=Beginner_Intermediate beginner_only=Beginner_only
% @importance 0.85

0.45::true_val(skill_level_recommendation, beginner_intermediate); 0.55::true_val(skill_level_recommendation, beginner_only).

measured(s14, skill_level_recommendation, beginner_intermediate).
measured(s17, skill_level_recommendation, beginner_intermediate).
measured(s5, skill_level_recommendation, beginner_only).
measured(smerchant, skill_level_recommendation, beginner_only).

all_consistent(skill_level_recommendation) :-
    consistent(s14, skill_level_recommendation),
    consistent(s5, skill_level_recommendation),
    (indep(s17), consistent(s17, skill_level_recommendation) ; \+indep(s17)),
    (indep(smerchant), consistent(smerchant, skill_level_recommendation) ; \+indep(smerchant)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_intermediate)).
query(true_val(skill_level_recommendation, beginner_only)).

0.85::acc(s5, skill_level_recommendation_usecase).
0.90::acc(smerchant, skill_level_recommendation_usecase).

% @attr skill_level_recommendation_usecase
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (use case)
% @values first_board_progression=First_board_for_progression_from_rentals unk_skill_level_recommendation_usecase=Unknown
% @importance 0.875

0.95::true_val(skill_level_recommendation_usecase, first_board_progression); 0.05::true_val(skill_level_recommendation_usecase, unk_skill_level_recommendation_usecase).

measured(s5, skill_level_recommendation_usecase, first_board_progression).
measured(smerchant, skill_level_recommendation_usecase, first_board_progression).

all_consistent(skill_level_recommendation_usecase) :-
    consistent(s5, skill_level_recommendation_usecase),
    (indep(smerchant), consistent(smerchant, skill_level_recommendation_usecase) ; \+indep(smerchant)).

evidence(all_consistent(skill_level_recommendation_usecase)).
query(true_val(skill_level_recommendation_usecase, first_board_progression)).
query(true_val(skill_level_recommendation_usecase, unk_skill_level_recommendation_usecase)).

0.85::acc(s1, terrain_suitability).
0.87::acc(s5, terrain_suitability).
0.90::acc(smerchant, terrain_suitability).
0.88::acc(s14, terrain_suitability).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mountain=All_Mountain park_freestyle_all_mountain=Park_Freestyle_All_Mountain
% @importance 0.888

0.55::true_val(terrain_suitability, all_mountain); 0.45::true_val(terrain_suitability, park_freestyle_all_mountain).

measured(s1, terrain_suitability, all_mountain).
measured(s5, terrain_suitability, all_mountain).
measured(smerchant, terrain_suitability, all_mountain).
measured(s14, terrain_suitability, park_freestyle_all_mountain).

all_consistent(terrain_suitability) :-
    consistent(s14, terrain_suitability),
    consistent(s5, terrain_suitability),
    (indep(s1), consistent(s1, terrain_suitability) ; \+indep(s1)),
    (indep(smerchant), consistent(smerchant, terrain_suitability) ; \+indep(smerchant)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mountain)).
query(true_val(terrain_suitability, park_freestyle_all_mountain)).

0.85::acc(s1, riding_style).
0.87::acc(s5, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values explore_mountain=Explore_entire_mountain_developing_skills unk_riding_style=Unknown
% @importance 0.875

0.95::true_val(riding_style, explore_mountain); 0.05::true_val(riding_style, unk_riding_style).

measured(s1, riding_style, explore_mountain).
measured(s5, riding_style, explore_mountain).

all_consistent(riding_style) :-
    consistent(s5, riding_style),
    (indep(s1), consistent(s1, riding_style) ; \+indep(s1)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, explore_mountain)).
query(true_val(riding_style, unk_riding_style)).

0.82::acc(s1, terrain_suitability_specific).

% @attr terrain_suitability_specific
% @type categorical
% @canonical false
% @original_name terrain_suitability (groomed runs)
% @values groomed_resort=Groomed_runs_general_resort_riding unk_terrain_suitability_specific=Unknown
% @importance 0.85

0.68::true_val(terrain_suitability_specific, groomed_resort); 0.32::true_val(terrain_suitability_specific, unk_terrain_suitability_specific).

measured(s1, terrain_suitability_specific, groomed_resort).

all_consistent(terrain_suitability_specific) :-
    (indep(s1), consistent(s1, terrain_suitability_specific) ; \+indep(s1)).

evidence(all_consistent(terrain_suitability_specific)).
query(true_val(terrain_suitability_specific, groomed_resort)).
query(true_val(terrain_suitability_specific, unk_terrain_suitability_specific)).

0.82::acc(s17, wide_board_recommendation).

% @attr wide_board_recommendation
% @type categorical
% @canonical false
% @original_name Wide board recommendation
% @values boot_11_5_plus=For_riders_US_Mens_11_5_plus_boot unk_wide_board_recommendation=Unknown
% @importance 0.75

0.66::true_val(wide_board_recommendation, boot_11_5_plus); 0.34::true_val(wide_board_recommendation, unk_wide_board_recommendation).

measured(s17, wide_board_recommendation, boot_11_5_plus).

all_consistent(wide_board_recommendation) :-
    (indep(s17), consistent(s17, wide_board_recommendation) ; \+indep(s17)).

evidence(all_consistent(wide_board_recommendation)).
query(true_val(wide_board_recommendation, boot_11_5_plus)).
query(true_val(wide_board_recommendation, unk_wide_board_recommendation)).

0.93::acc(smerchant, user_rating_merchant).

% @attr user_rating_merchant
% @type numeric
% @unit /5
% @canonical false
% @original_name User rating (merchant-provided)
% @values v5_0=5.0 unk_user_rating_merchant=Unknown
% @importance 0.85

0.95::true_val(user_rating_merchant, v5_0); 0.05::true_val(user_rating_merchant, unk_user_rating_merchant).

measured(smerchant, user_rating_merchant, v5_0).

all_consistent(user_rating_merchant) :-
    consistent(smerchant, user_rating_merchant).

evidence(all_consistent(user_rating_merchant)).
query(true_val(user_rating_merchant, v5_0)).
query(true_val(user_rating_merchant, unk_user_rating_merchant)).

0.88::acc(s14, user_rating_the_house).

% @attr user_rating_the_house
% @type numeric
% @unit /5
% @canonical false
% @original_name User rating (The House, Item 1117798)
% @values v4_1=4.1 unk_user_rating_the_house=Unknown
% @importance 1.0

0.76::true_val(user_rating_the_house, v4_1); 0.24::true_val(user_rating_the_house, unk_user_rating_the_house).

measured(s14, user_rating_the_house, v4_1).

all_consistent(user_rating_the_house) :-
    consistent(s14, user_rating_the_house).

evidence(all_consistent(user_rating_the_house)).
query(true_val(user_rating_the_house, v4_1)).
query(true_val(user_rating_the_house, unk_user_rating_the_house)).

0.82::acc(s20, user_rating_the_house_158w).

% @attr user_rating_the_house_158w
% @type numeric
% @unit /5
% @canonical false
% @original_name User rating (The House, 158W variant)
% @values v3_8=3.8 unk_user_rating_the_house_158w=Unknown
% @importance 0.8

0.68::true_val(user_rating_the_house_158w, v3_8); 0.32::true_val(user_rating_the_house_158w, unk_user_rating_the_house_158w).

measured(s20, user_rating_the_house_158w, v3_8).

all_consistent(user_rating_the_house_158w) :-
    (indep(s20), consistent(s20, user_rating_the_house_158w) ; \+indep(s20)).

evidence(all_consistent(user_rating_the_house_158w)).
query(true_val(user_rating_the_house_158w, v3_8)).
query(true_val(user_rating_the_house_158w, unk_user_rating_the_house_158w)).

0.70::acc(s21, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values awesome_happy=Awesome_board_rides_great_very_happy unk_user_review_forum=Unknown
% @importance 0.7

0.47::true_val(user_review_forum, awesome_happy); 0.53::true_val(user_review_forum, unk_user_review_forum).

measured(s21, user_review_forum, awesome_happy).

all_consistent(user_review_forum) :-
    consistent(s21, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, awesome_happy)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.50::acc(s22, user_review_forum_flex).

% @attr user_review_forum_flex
% @type categorical
% @canonical false
% @original_name user_review_forum (flex confirmation)
% @values very_flexible_camber=Confirmed_very_flexible_for_camber_board unk_user_review_forum_flex=Unknown
% @importance 0.55

0.26::true_val(user_review_forum_flex, very_flexible_camber); 0.74::true_val(user_review_forum_flex, unk_user_review_forum_flex).

measured(s22, user_review_forum_flex, very_flexible_camber).

all_consistent(user_review_forum_flex) :-
    consistent(s22, user_review_forum_flex).

evidence(all_consistent(user_review_forum_flex)).
query(true_val(user_review_forum_flex, very_flexible_camber)).
query(true_val(user_review_forum_flex, unk_user_review_forum_flex)).

0.85::acc(s1, positive_aspect).
0.87::acc(s5, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values catch_free=Catch_free_riding_Bite_Free_Edges_Flat_Out_Camber unk_positive_aspect=Unknown
% @importance 0.875

0.95::true_val(positive_aspect, catch_free); 0.05::true_val(positive_aspect, unk_positive_aspect).

measured(s1, positive_aspect, catch_free).
measured(s5, positive_aspect, catch_free).

all_consistent(positive_aspect) :-
    consistent(s5, positive_aspect),
    (indep(s1), consistent(s1, positive_aspect) ; \+indep(s1)).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, catch_free)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.78::acc(s23, positive_aspect_lightweight).

% @attr positive_aspect_lightweight
% @type categorical
% @canonical false
% @original_name positive_aspect (lightweight)
% @values lightweight_agile=Lightweight_construction_agile_ride unk_positive_aspect_lightweight=Unknown
% @importance 0.55

0.56::true_val(positive_aspect_lightweight, lightweight_agile); 0.44::true_val(positive_aspect_lightweight, unk_positive_aspect_lightweight).

measured(s23, positive_aspect_lightweight, lightweight_agile).

all_consistent(positive_aspect_lightweight) :-
    (indep(s23), consistent(s23, positive_aspect_lightweight) ; \+indep(s23)).

evidence(all_consistent(positive_aspect_lightweight)).
query(true_val(positive_aspect_lightweight, lightweight_agile)).
query(true_val(positive_aspect_lightweight, unk_positive_aspect_lightweight)).

0.78::acc(s24, positive_aspect_low_maintenance).

% @attr positive_aspect_low_maintenance
% @type categorical
% @canonical false
% @original_name positive_aspect (low maintenance)
% @values low_maintenance_base=Low_maintenance_extruded_base unk_positive_aspect_low_maintenance=Unknown
% @importance 0.7

0.60::true_val(positive_aspect_low_maintenance, low_maintenance_base); 0.40::true_val(positive_aspect_low_maintenance, unk_positive_aspect_low_maintenance).

measured(s24, positive_aspect_low_maintenance, low_maintenance_base).

all_consistent(positive_aspect_low_maintenance) :-
    (indep(s24), consistent(s24, positive_aspect_low_maintenance) ; \+indep(s24)).

evidence(all_consistent(positive_aspect_low_maintenance)).
query(true_val(positive_aspect_low_maintenance, low_maintenance_base)).
query(true_val(positive_aspect_low_maintenance, unk_positive_aspect_low_maintenance)).

0.75::acc(s25, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values soft_instability=Soft_flex_potential_instability_at_high_speeds unk_negative_aspect=Unknown
% @importance 0.75

0.56::true_val(negative_aspect, soft_instability); 0.44::true_val(negative_aspect, unk_negative_aspect).

measured(s25, negative_aspect, soft_instability).

all_consistent(negative_aspect) :-
    consistent(s25, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, soft_instability)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.75::acc(s25, negative_aspect_slow_base).

% @attr negative_aspect_slow_base
% @type categorical
% @canonical false
% @original_name negative_aspect (slow base)
% @values not_fastest_base=Extruded_base_not_fastest_on_hill unk_negative_aspect_slow_base=Unknown
% @importance 0.75

0.56::true_val(negative_aspect_slow_base, not_fastest_base); 0.44::true_val(negative_aspect_slow_base, unk_negative_aspect_slow_base).

measured(s25, negative_aspect_slow_base, not_fastest_base).

all_consistent(negative_aspect_slow_base) :-
    consistent(s25, negative_aspect_slow_base).

evidence(all_consistent(negative_aspect_slow_base)).
query(true_val(negative_aspect_slow_base, not_fastest_base)).
query(true_val(negative_aspect_slow_base, unk_negative_aspect_slow_base)).

0.55::acc(s26, negative_aspect_outgrow).

% @attr negative_aspect_outgrow
% @type categorical
% @canonical false
% @original_name negative_aspect (outgrow)
% @values outgrow_quickly=Riders_may_outgrow_quickly unk_negative_aspect_outgrow=Unknown
% @importance 0.8

0.26::true_val(negative_aspect_outgrow, outgrow_quickly); 0.74::true_val(negative_aspect_outgrow, unk_negative_aspect_outgrow).

measured(s26, negative_aspect_outgrow, outgrow_quickly).

all_consistent(negative_aspect_outgrow) :-
    consistent(s26, negative_aspect_outgrow).

evidence(all_consistent(negative_aspect_outgrow)).
query(true_val(negative_aspect_outgrow, outgrow_quickly)).
query(true_val(negative_aspect_outgrow, unk_negative_aspect_outgrow)).

0.50::acc(s27, user_review_forum_outgrown).

% @attr user_review_forum_outgrown
% @type categorical
% @canonical false
% @original_name user_review_forum (outgrown)
% @values outgrew_one_season=Only_Used_Twice_outgrew_in_one_season unk_user_review_forum_outgrown=Unknown
% @importance 0.75

0.30::true_val(user_review_forum_outgrown, outgrew_one_season); 0.70::true_val(user_review_forum_outgrown, unk_user_review_forum_outgrown).

measured(s27, user_review_forum_outgrown, outgrew_one_season).

all_consistent(user_review_forum_outgrown) :-
    consistent(s27, user_review_forum_outgrown).

evidence(all_consistent(user_review_forum_outgrown)).
query(true_val(user_review_forum_outgrown, outgrew_one_season)).
query(true_val(user_review_forum_outgrown, unk_user_review_forum_outgrown)).

0.72::acc(s25, durability_note).

% @attr durability_note
% @type categorical
% @canonical false
% @original_name Durability note
% @values aspen_heavier_durable=Aspen_core_heavier_but_improved_durability unk_durability_note=Unknown
% @importance 0.75

0.56::true_val(durability_note, aspen_heavier_durable); 0.44::true_val(durability_note, unk_durability_note).

measured(s25, durability_note, aspen_heavier_durable).

all_consistent(durability_note) :-
    consistent(s25, durability_note).

evidence(all_consistent(durability_note)).
query(true_val(durability_note, aspen_heavier_durable)).
query(true_val(durability_note, unk_durability_note)).

0.82::acc(s28, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values salomon_pulse=Salomon_Pulse_Flat_Out_Camber_Aspen_birchwood_inserts unk_comparable_board_same_brand=Unknown
% @importance 0.7

0.68::true_val(comparable_board_same_brand, salomon_pulse); 0.32::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s28, comparable_board_same_brand, salomon_pulse).

all_consistent(comparable_board_same_brand) :-
    consistent(s28, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, salomon_pulse)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.82::acc(s15, price_usd_evo_pulse).

% @attr price_usd_evo_pulse
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo (Pulse comparable)
% @values v399_95_319_96=399.95_MSRP_319.96_sale unk_price_usd_evo_pulse=Unknown
% @importance 0.7

0.68::true_val(price_usd_evo_pulse, v399_95_319_96); 0.32::true_val(price_usd_evo_pulse, unk_price_usd_evo_pulse).

measured(s15, price_usd_evo_pulse, v399_95_319_96).

all_consistent(price_usd_evo_pulse) :-
    consistent(s15, price_usd_evo_pulse).

evidence(all_consistent(price_usd_evo_pulse)).
query(true_val(price_usd_evo_pulse, v399_95_319_96)).
query(true_val(price_usd_evo_pulse, unk_price_usd_evo_pulse)).

0.75::acc(s29, comparable_board_same_brand_sight).

% @attr comparable_board_same_brand_sight
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Sight)
% @values salomon_sight=Salomon_Sight_tapered_directional_Cross_Profile_cork_rails unk_comparable_board_same_brand_sight=Unknown
% @importance 0.65

0.53::true_val(comparable_board_same_brand_sight, salomon_sight); 0.47::true_val(comparable_board_same_brand_sight, unk_comparable_board_same_brand_sight).

measured(s29, comparable_board_same_brand_sight, salomon_sight).

all_consistent(comparable_board_same_brand_sight) :-
    consistent(s29, comparable_board_same_brand_sight).

evidence(all_consistent(comparable_board_same_brand_sight)).
query(true_val(comparable_board_same_brand_sight, salomon_sight)).
query(true_val(comparable_board_same_brand_sight, unk_comparable_board_same_brand_sight)).

0.60::acc(s30, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values k2_raygun=K2_Raygun_popular_beginner unk_comparable_board_cross_brand=Unknown
% @importance 0.75

0.32::true_val(comparable_board_cross_brand, k2_raygun); 0.68::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s30, comparable_board_cross_brand, k2_raygun).

all_consistent(comparable_board_cross_brand) :-
    consistent(s30, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, k2_raygun)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.60::acc(s30, comparable_board_cross_brand_yes_basic).

% @attr comparable_board_cross_brand_yes_basic
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES Basic)
% @values yes_basic=YES_Basic_beginner unk_comparable_board_cross_brand_yes_basic=Unknown
% @importance 0.75

0.32::true_val(comparable_board_cross_brand_yes_basic, yes_basic); 0.68::true_val(comparable_board_cross_brand_yes_basic, unk_comparable_board_cross_brand_yes_basic).

measured(s30, comparable_board_cross_brand_yes_basic, yes_basic).

all_consistent(comparable_board_cross_brand_yes_basic) :-
    consistent(s30, comparable_board_cross_brand_yes_basic).

evidence(all_consistent(comparable_board_cross_brand_yes_basic)).
query(true_val(comparable_board_cross_brand_yes_basic, yes_basic)).
query(true_val(comparable_board_cross_brand_yes_basic, unk_comparable_board_cross_brand_yes_basic)).

0.60::acc(s30, comparable_board_cross_brand_rossignol).

% @attr comparable_board_cross_brand_rossignol
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Rossignol One LF)
% @values rossignol_one_lf=Rossignol_One_LF_beginner unk_comparable_board_cross_brand_rossignol=Unknown
% @importance 0.75

0.32::true_val(comparable_board_cross_brand_rossignol, rossignol_one_lf); 0.68::true_val(comparable_board_cross_brand_rossignol, unk_comparable_board_cross_brand_rossignol).

measured(s30, comparable_board_cross_brand_rossignol, rossignol_one_lf).

all_consistent(comparable_board_cross_brand_rossignol) :-
    consistent(s30, comparable_board_cross_brand_rossignol).

evidence(all_consistent(comparable_board_cross_brand_rossignol)).
query(true_val(comparable_board_cross_brand_rossignol, rossignol_one_lf)).
query(true_val(comparable_board_cross_brand_rossignol, unk_comparable_board_cross_brand_rossignol)).

0.60::acc(s30, comparable_board_cross_brand_ride_agenda).

% @attr comparable_board_cross_brand_ride_agenda
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Ride Agenda)
% @values ride_agenda=Ride_Agenda_beginner unk_comparable_board_cross_brand_ride_agenda=Unknown
% @importance 0.75

0.32::true_val(comparable_board_cross_brand_ride_agenda, ride_agenda); 0.68::true_val(comparable_board_cross_brand_ride_agenda, unk_comparable_board_cross_brand_ride_agenda).

measured(s30, comparable_board_cross_brand_ride_agenda, ride_agenda).

all_consistent(comparable_board_cross_brand_ride_agenda) :-
    consistent(s30, comparable_board_cross_brand_ride_agenda).

evidence(all_consistent(comparable_board_cross_brand_ride_agenda)).
query(true_val(comparable_board_cross_brand_ride_agenda, ride_agenda)).
query(true_val(comparable_board_cross_brand_ride_agenda, unk_comparable_board_cross_brand_ride_agenda)).

0.50::acc(s31, comparable_board_cross_brand_nidecker).

% @attr comparable_board_cross_brand_nidecker
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nidecker Cheat Code)
% @values nidecker_cheat_code=Nidecker_Cheat_Code_beginner_flat_rocker_soft unk_comparable_board_cross_brand_nidecker=Unknown
% @importance 0.65

0.25::true_val(comparable_board_cross_brand_nidecker, nidecker_cheat_code); 0.75::true_val(comparable_board_cross_brand_nidecker, unk_comparable_board_cross_brand_nidecker).

measured(s31, comparable_board_cross_brand_nidecker, nidecker_cheat_code).

all_consistent(comparable_board_cross_brand_nidecker) :-
    consistent(s31, comparable_board_cross_brand_nidecker).

evidence(all_consistent(comparable_board_cross_brand_nidecker)).
query(true_val(comparable_board_cross_brand_nidecker, nidecker_cheat_code)).
query(true_val(comparable_board_cross_brand_nidecker, unk_comparable_board_cross_brand_nidecker)).

0.50::acc(s31, comparable_board_cross_brand_capita).

% @attr comparable_board_cross_brand_capita
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (CAPiTA Pathfinder)
% @values capita_pathfinder=CAPiTA_Pathfinder_entry_level_soft_medium_durable unk_comparable_board_cross_brand_capita=Unknown
% @importance 0.65

0.25::true_val(comparable_board_cross_brand_capita, capita_pathfinder); 0.75::true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita).

measured(s31, comparable_board_cross_brand_capita, capita_pathfinder).

all_consistent(comparable_board_cross_brand_capita) :-
    consistent(s31, comparable_board_cross_brand_capita).

evidence(all_consistent(comparable_board_cross_brand_capita)).
query(true_val(comparable_board_cross_brand_capita, capita_pathfinder)).
query(true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita)).

0.75::acc(s32, comparable_board_same_brand_lotus).

% @attr comparable_board_same_brand_lotus
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Lotus)
% @values salomon_lotus=Salomon_Lotus_womens_soft_flex_Flat_Out_Camber unk_comparable_board_same_brand_lotus=Unknown
% @importance 0.5

0.53::true_val(comparable_board_same_brand_lotus, salomon_lotus); 0.47::true_val(comparable_board_same_brand_lotus, unk_comparable_board_same_brand_lotus).

measured(s32, comparable_board_same_brand_lotus, salomon_lotus).

all_consistent(comparable_board_same_brand_lotus) :-
    consistent(s32, comparable_board_same_brand_lotus).

evidence(all_consistent(comparable_board_same_brand_lotus)).
query(true_val(comparable_board_same_brand_lotus, salomon_lotus)).
query(true_val(comparable_board_same_brand_lotus, unk_comparable_board_same_brand_lotus)).

0.85::acc(s3, salomon_brand_heritage).
0.82::acc(s33, salomon_brand_heritage).

% @attr salomon_brand_heritage
% @type categorical
% @canonical false
% @original_name Salomon brand heritage
% @values founded_1947_annecy=Founded_1947_Annecy_French_Alps_75_years unk_salomon_brand_heritage=Unknown
% @importance 0.425

0.95::true_val(salomon_brand_heritage, founded_1947_annecy); 0.05::true_val(salomon_brand_heritage, unk_salomon_brand_heritage).

measured(s3, salomon_brand_heritage, founded_1947_annecy).
measured(s33, salomon_brand_heritage, founded_1947_annecy).

all_consistent(salomon_brand_heritage) :-
    consistent(s3, salomon_brand_heritage),
    consistent(s33, salomon_brand_heritage).

evidence(all_consistent(salomon_brand_heritage)).
query(true_val(salomon_brand_heritage, founded_1947_annecy)).
query(true_val(salomon_brand_heritage, unk_salomon_brand_heritage)).

0.88::acc(s3, salomon_product_range).

% @attr salomon_product_range
% @type categorical
% @canonical false
% @original_name Salomon product range
% @values multi_sport_40_countries=Trail_running_hiking_climbing_skiing_snowboarding_40_countries unk_salomon_product_range=Unknown
% @importance 0.5

0.78::true_val(salomon_product_range, multi_sport_40_countries); 0.22::true_val(salomon_product_range, unk_salomon_product_range).

measured(s3, salomon_product_range, multi_sport_40_countries).

all_consistent(salomon_product_range) :-
    consistent(s3, salomon_product_range).

evidence(all_consistent(salomon_product_range)).
query(true_val(salomon_product_range, multi_sport_40_countries)).
query(true_val(salomon_product_range, unk_salomon_product_range)).

0.80::acc(s34, salomon_revenue_scale).

% @attr salomon_revenue_scale
% @type numeric
% @unit USD_millions
% @canonical false
% @original_name Salomon revenue scale
% @values v949m=949.0 unk_salomon_revenue_scale=Unknown
% @importance 0.3

0.68::true_val(salomon_revenue_scale, v949m); 0.32::true_val(salomon_revenue_scale, unk_salomon_revenue_scale).

measured(s34, salomon_revenue_scale, v949m).

all_consistent(salomon_revenue_scale) :-
    consistent(s34, salomon_revenue_scale).

evidence(all_consistent(salomon_revenue_scale)).
query(true_val(salomon_revenue_scale, v949m)).
query(true_val(salomon_revenue_scale, unk_salomon_revenue_scale)).

0.88::acc(s14, the_house_reputation).

% @attr the_house_reputation
% @type categorical
% @canonical false
% @original_name The House reputation
% @values major_us_retailer=Major_US_online_retailer_90day_return_free_shipping unk_the_house_reputation=Unknown
% @importance 1.0

0.76::true_val(the_house_reputation, major_us_retailer); 0.24::true_val(the_house_reputation, unk_the_house_reputation).

measured(s14, the_house_reputation, major_us_retailer).

all_consistent(the_house_reputation) :-
    consistent(s14, the_house_reputation).

evidence(all_consistent(the_house_reputation)).
query(true_val(the_house_reputation, major_us_retailer)).
query(true_val(the_house_reputation, unk_the_house_reputation)).

0.80::acc(s10, eriks_reputation).

% @attr eriks_reputation
% @type categorical
% @canonical false
% @original_name ERIK'S reputation
% @values us_regional_chain=US_regional_chain_price_match_free_binding_install unk_eriks_reputation=Unknown
% @importance 0.7

0.66::true_val(eriks_reputation, us_regional_chain); 0.34::true_val(eriks_reputation, unk_eriks_reputation).

measured(s10, eriks_reputation, us_regional_chain).

all_consistent(eriks_reputation) :-
    (indep(s10), consistent(s10, eriks_reputation) ; \+indep(s10)).

evidence(all_consistent(eriks_reputation)).
query(true_val(eriks_reputation, us_regional_chain)).
query(true_val(eriks_reputation, unk_eriks_reputation)).

0.70::acc(s21, melbourne_snowboard_reputation).

% @attr melbourne_snowboard_reputation
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre reputation
% @values aus_specialist=Australian_specialist_independent_30day_exchange unk_melbourne_snowboard_reputation=Unknown
% @importance 0.7

0.47::true_val(melbourne_snowboard_reputation, aus_specialist); 0.53::true_val(melbourne_snowboard_reputation, unk_melbourne_snowboard_reputation).

measured(s21, melbourne_snowboard_reputation, aus_specialist).

all_consistent(melbourne_snowboard_reputation) :-
    consistent(s21, melbourne_snowboard_reputation).

evidence(all_consistent(melbourne_snowboard_reputation)).
query(true_val(melbourne_snowboard_reputation, aus_specialist)).
query(true_val(melbourne_snowboard_reputation, unk_melbourne_snowboard_reputation)).

0.82::acc(s17, sporting_life_reputation).

% @attr sporting_life_reputation
% @type categorical
% @canonical false
% @original_name Sporting Life reputation
% @values canadian_multi_sport=Canadian_multi_sport_retailer_online_instore unk_sporting_life_reputation=Unknown
% @importance 0.75

0.66::true_val(sporting_life_reputation, canadian_multi_sport); 0.34::true_val(sporting_life_reputation, unk_sporting_life_reputation).

measured(s17, sporting_life_reputation, canadian_multi_sport).

all_consistent(sporting_life_reputation) :-
    (indep(s17), consistent(s17, sporting_life_reputation) ; \+indep(s17)).

evidence(all_consistent(sporting_life_reputation)).
query(true_val(sporting_life_reputation, canadian_multi_sport)).
query(true_val(sporting_life_reputation, unk_sporting_life_reputation)).

0.93::acc(s13, warranty_terms).

% @attr warranty_terms
% @type categorical
% @canonical false
% @original_name warranty (terms)
% @values repair_or_replace=Repair_or_replace_at_no_charge_sole_discretion unk_warranty_terms=Unknown
% @importance 0.75

0.87::true_val(warranty_terms, repair_or_replace); 0.13::true_val(warranty_terms, unk_warranty_terms).

measured(s13, warranty_terms, repair_or_replace).

all_consistent(warranty_terms) :-
    consistent(s13, warranty_terms).

evidence(all_consistent(warranty_terms)).
query(true_val(warranty_terms, repair_or_replace)).
query(true_val(warranty_terms, unk_warranty_terms)).

0.90::acc(s14, nose_tail_profile).

% @attr nose_tail_profile
% @type categorical
% @canonical false
% @original_name Nose/tail profile
% @values equal_symmetrical=Equal_nose_tail_dimensions_symmetrical unk_nose_tail_profile=Unknown
% @importance 1.0

0.76::true_val(nose_tail_profile, equal_symmetrical); 0.24::true_val(nose_tail_profile, unk_nose_tail_profile).

measured(s14, nose_tail_profile, equal_symmetrical).

all_consistent(nose_tail_profile) :-
    consistent(s14, nose_tail_profile).

evidence(all_consistent(nose_tail_profile)).
query(true_val(nose_tail_profile, equal_symmetrical)).
query(true_val(nose_tail_profile, unk_nose_tail_profile)).

0.82::acc(s5, flex_direction).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_flex=Directional_flex_implied_by_setback unk_flex_direction=Unknown
% @importance 0.9

0.71::true_val(flex_direction, directional_flex); 0.29::true_val(flex_direction, unk_flex_direction).

measured(s5, flex_direction, directional_flex).

all_consistent(flex_direction) :-
    consistent(s5, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

0.90::acc(s14, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values standard_4x2=Standard_4x2_insert_all_major_binding_brands unk_binding_compatibility=Unknown
% @importance 1.0

0.76::true_val(binding_compatibility, standard_4x2); 0.24::true_val(binding_compatibility, unk_binding_compatibility).

measured(s14, binding_compatibility, standard_4x2).

all_consistent(binding_compatibility) :-
    consistent(s14, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_4x2)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.78::acc(s24, base_glide_performance).
0.75::acc(s25, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values moderate_glide=Extruded_moderate_glide_lower_speed_than_sintered unk_base_glide_performance=Unknown
% @importance 0.725

0.95::true_val(base_glide_performance, moderate_glide); 0.05::true_val(base_glide_performance, unk_base_glide_performance).

measured(s24, base_glide_performance, moderate_glide).
measured(s25, base_glide_performance, moderate_glide).

all_consistent(base_glide_performance) :-
    consistent(s25, base_glide_performance),
    (indep(s24), consistent(s24, base_glide_performance) ; \+indep(s24)).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, moderate_glide)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.90::acc(smerchant, torsional_flex).

% @attr torsional_flex
% @type categorical
% @canonical false
% @original_name Torsional flex
% @values more_torsional=More_torsional_flex_due_to_BA_LD_glass unk_torsional_flex=Unknown
% @importance 0.85

0.85::true_val(torsional_flex, more_torsional); 0.15::true_val(torsional_flex, unk_torsional_flex).

measured(smerchant, torsional_flex, more_torsional).

all_consistent(torsional_flex) :-
    consistent(smerchant, torsional_flex).

evidence(all_consistent(torsional_flex)).
query(true_val(torsional_flex, more_torsional)).
query(true_val(torsional_flex, unk_torsional_flex)).

0.85::acc(s14, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values none_listed=None_listed_entry_level_construction unk_construction_material_innovation=Unknown
% @importance 1.0

0.76::true_val(construction_material_innovation, none_listed); 0.24::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s14, construction_material_innovation, none_listed).

all_consistent(construction_material_innovation) :-
    consistent(s14, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, none_listed)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.85::acc(s1, damping_technology).

% @attr damping_technology
% @type categorical
% @canonical false
% @original_name Damping technology
% @values abs_sidewalls=ABS_sidewalls_primary_vibration_dampening unk_damping_technology=Unknown
% @importance 0.85

0.68::true_val(damping_technology, abs_sidewalls); 0.32::true_val(damping_technology, unk_damping_technology).

measured(s1, damping_technology, abs_sidewalls).

all_consistent(damping_technology) :-
    (indep(s1), consistent(s1, damping_technology) ; \+indep(s1)).

evidence(all_consistent(damping_technology)).
query(true_val(damping_technology, abs_sidewalls)).
query(true_val(damping_technology, unk_damping_technology)).

0.55::acc(s9, available_colors).

% @attr available_colors
% @type categorical
% @canonical false
% @original_name available_colors
% @values white_black=White_Black_2023_model unk_available_colors=Unknown
% @importance 0.7

0.47::true_val(available_colors, white_black); 0.53::true_val(available_colors, unk_available_colors).

measured(s9, available_colors, white_black).

all_consistent(available_colors) :-
    consistent(s9, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, white_black)).
query(true_val(available_colors, unk_available_colors)).