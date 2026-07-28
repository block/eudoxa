0.20::indep(s2).
0.15::indep(s3).
0.20::indep(s4).
0.25::indep(s5).
0.20::indep(s6).
0.15::indep(s8).
0.15::indep(s9).
0.15::indep(s19).
0.20::indep(s20).
0.15::indep(s21).
0.15::indep(s24).
0.20::indep(s25).
0.20::indep(s26).
0.15::indep(s27).
0.15::indep(s30).
0.15::indep(s32).
0.20::indep(s34).
0.15::indep(s36).
0.15::indep(s44).
0.15::indep(s45).
0.15::indep(s50).
0.15::indep(s51).
0.15::indep(s53).
0.15::indep(s57).
0.15::indep(s61).
0.15::indep(s64).
0.15::indep(s65).
0.15::indep(s66).
0.15::indep(s67).
0.15::indep(s68).
0.15::indep(s69).
0.15::indep(s70).
0.15::indep(s74).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, burton); 0.05::true_val(brand, unk_brand).

0.95::acc(s1, brand).
0.82::acc(s2, brand).

measured(s1, brand, burton).
measured(s2, brand, burton).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values process_recut=Process_Recut unk_model_name=Unknown
% @importance 0.875

0.92::true_val(model_name, process_recut); 0.08::true_val(model_name, unk_model_name).

0.82::acc(s3, model_name).
0.80::acc(s4, model_name).

measured(s3, model_name, process_recut).
measured(s4, model_name, process_recut).

all_consistent(model_name) :-
    consistent(s3, model_name),
    (indep(s4), consistent(s4, model_name) ; \+indep(s4)).

evidence(all_consistent(model_name)).
query(true_val(model_name, process_recut)).
query(true_val(model_name, unk_model_name)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values process_camber=Burton_Process_Camber unk_predecessor_model_name=Unknown
% @importance 0.875

0.90::true_val(predecessor_model_name, process_camber); 0.10::true_val(predecessor_model_name, unk_predecessor_model_name).

0.83::acc(s5, predecessor_model_name).
0.83::acc(s6, predecessor_model_name).

measured(s5, predecessor_model_name, process_camber).
measured(s6, predecessor_model_name, process_camber).

all_consistent(predecessor_model_name) :-
    consistent(s5, predecessor_model_name),
    (indep(s6), consistent(s6, predecessor_model_name) ; \+indep(s6)).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, process_camber)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr recut_description
% @type categorical
% @canonical false
% @original_name Recut description
% @values limited_rerelease_spaceman=Limited_re_release_of_2024_spaceman_holographic_graphic unk_recut_description=Unknown
% @importance 0.8

0.67::true_val(recut_description, limited_rerelease_spaceman); 0.33::true_val(recut_description, unk_recut_description).

0.80::acc(s7, recut_description).

measured(s7, recut_description, limited_rerelease_spaceman).

all_consistent(recut_description) :-
    consistent(s7, recut_description).

evidence(all_consistent(recut_description)).
query(true_val(recut_description, limited_rerelease_spaceman)).
query(true_val(recut_description, unk_recut_description)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values winter_2025_2026=Winter_2025_2026 unk_model_year=Unknown
% @importance 0.65

0.90::true_val(model_year, winter_2025_2026); 0.10::true_val(model_year, unk_model_year).

0.82::acc(s8, model_year).
0.78::acc(s9, model_year).

measured(s8, model_year, winter_2025_2026).
measured(s9, model_year, winter_2025_2026).

all_consistent(model_year) :-
    consistent(s8, model_year),
    (indep(s9), consistent(s9, model_year) ; \+indep(s9)).

evidence(all_consistent(model_year)).
query(true_val(model_year, winter_2025_2026)).
query(true_val(model_year, unk_model_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values since_2011=In_lineup_since_at_least_2011 unk_model_first_available_year=Unknown
% @importance 0.5

0.64::true_val(model_first_available_year, since_2011); 0.36::true_val(model_first_available_year, unk_model_first_available_year).

0.75::acc(s10, model_first_available_year).

measured(s10, model_first_available_year, since_2011).

all_consistent(model_first_available_year) :-
    consistent(s10, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, since_2011)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_us=Burton_Snowboards_Inc_Burlington_VT_USA unk_manufacturer=Unknown
% @importance 0.5

0.71::true_val(manufacturer, burton_us); 0.29::true_val(manufacturer, unk_manufacturer).

0.82::acc(s11, manufacturer).

measured(s11, manufacturer, burton_us).

all_consistent(manufacturer) :-
    consistent(s11, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_us)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_eu
% @type categorical
% @canonical false
% @original_name manufacturer (EU representative)
% @values burton_gmbh_austria=Burton_Snowboards_GmbH_Innsbruck_Austria unk_manufacturer_eu=Unknown
% @importance 0.4

0.71::true_val(manufacturer_eu, burton_gmbh_austria); 0.29::true_val(manufacturer_eu, unk_manufacturer_eu).

0.82::acc(s12, manufacturer_eu).

measured(s12, manufacturer_eu, burton_gmbh_austria).

all_consistent(manufacturer_eu) :-
    consistent(s12, manufacturer_eu).

evidence(all_consistent(manufacturer_eu)).
query(true_val(manufacturer_eu, burton_gmbh_austria)).
query(true_val(manufacturer_eu, unk_manufacturer_eu)).

% @attr burton_founded_year
% @type numeric
% @canonical false
% @original_name Burton Snowboards founded
% @unit year
% @values v1977=1977 unk_burton_founded_year=Unknown
% @importance 0.5

0.76::true_val(burton_founded_year, v1977); 0.24::true_val(burton_founded_year, unk_burton_founded_year).

0.85::acc(s13, burton_founded_year).

measured(s13, burton_founded_year, v1977).

all_consistent(burton_founded_year) :-
    consistent(s13, burton_founded_year).

evidence(all_consistent(burton_founded_year)).
query(true_val(burton_founded_year, v1977)).
query(true_val(burton_founded_year, unk_burton_founded_year)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values kiel_nindl_austria=Kiel_Nindl_GmbH_Austria unk_manufacturing_location_current=Unknown
% @importance 0.9

0.76::true_val(manufacturing_location_current, kiel_nindl_austria); 0.24::true_val(manufacturing_location_current, unk_manufacturing_location_current).

0.85::acc(s14, manufacturing_location_current).

measured(s14, manufacturing_location_current, kiel_nindl_austria).

all_consistent(manufacturing_location_current) :-
    consistent(s14, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, kiel_nindl_austria)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical false
% @original_name manufacturing_location_prior
% @values moved_2010=Production_moved_to_Austria_2010 unk_manufacturing_location_prior=Unknown
% @importance 0.4

0.76::true_val(manufacturing_location_prior, moved_2010); 0.24::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

0.85::acc(s15, manufacturing_location_prior).

measured(s15, manufacturing_location_prior, moved_2010).

all_consistent(manufacturing_location_prior) :-
    consistent(s15, manufacturing_location_prior).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, moved_2010)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr manufacturing_locations_additional
% @type categorical
% @canonical false
% @original_name Burton manufacturing also takes place in China and Austria
% @values china_and_austria=China_and_Austria unk_manufacturing_locations_additional=Unknown
% @importance 0.45

0.59::true_val(manufacturing_locations_additional, china_and_austria); 0.41::true_val(manufacturing_locations_additional, unk_manufacturing_locations_additional).

0.72::acc(s16, manufacturing_locations_additional).

measured(s16, manufacturing_locations_additional, china_and_austria).

all_consistent(manufacturing_locations_additional) :-
    consistent(s16, manufacturing_locations_additional).

evidence(all_consistent(manufacturing_locations_additional)).
query(true_val(manufacturing_locations_additional, china_and_austria)).
query(true_val(manufacturing_locations_additional, unk_manufacturing_locations_additional)).

% @attr austrian_factory_sourcing
% @type categorical
% @canonical false
% @original_name Austrian factory sources most materials within a 250-mile radius and makes their own cores from FSC Certified wood
% @values local_sourced_fsc=Materials_within_250_miles_FSC_cores unk_austrian_factory_sourcing=Unknown
% @importance 0.5

0.81::true_val(austrian_factory_sourcing, local_sourced_fsc); 0.19::true_val(austrian_factory_sourcing, unk_austrian_factory_sourcing).

0.88::acc(s17, austrian_factory_sourcing).

measured(s17, austrian_factory_sourcing, local_sourced_fsc).

all_consistent(austrian_factory_sourcing) :-
    consistent(s17, austrian_factory_sourcing).

evidence(all_consistent(austrian_factory_sourcing)).
query(true_val(austrian_factory_sourcing, local_sourced_fsc)).
query(true_val(austrian_factory_sourcing, unk_austrian_factory_sourcing)).

% @attr designed_by
% @type categorical
% @canonical false
% @original_name Designed by
% @values burton_snowboards=Burton_Snowboards unk_designed_by=Unknown
% @importance 0.9

0.76::true_val(designed_by, burton_snowboards); 0.24::true_val(designed_by, unk_designed_by).

0.85::acc(s14, designed_by).

measured(s14, designed_by, burton_snowboards).

all_consistent(designed_by) :-
    consistent(s14, designed_by).

evidence(all_consistent(designed_by)).
query(true_val(designed_by, burton_snowboards)).
query(true_val(designed_by, unk_designed_by)).

% @attr b_corporation_status
% @type categorical
% @canonical false
% @original_name Burton is a B Corporation
% @values b_corp_certified=B_Corporation unk_b_corporation_status=Unknown
% @importance 0.35

0.67::true_val(b_corporation_status, b_corp_certified); 0.33::true_val(b_corporation_status, unk_b_corporation_status).

0.88::acc(s18, b_corporation_status).

measured(s18, b_corporation_status, b_corp_certified).

all_consistent(b_corporation_status) :-
    consistent(s18, b_corporation_status).

evidence(all_consistent(b_corporation_status)).
query(true_val(b_corporation_status, b_corp_certified)).
query(true_val(b_corporation_status, unk_b_corporation_status)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v879_99=879.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.90::true_val(price_aud_merchant, v879_99); 0.10::true_val(price_aud_merchant, unk_price_aud_merchant).

0.93::acc(s19, price_aud_merchant).

measured(s19, price_aud_merchant, v879_99).

all_consistent(price_aud_merchant) :-
    consistent(s19, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v879_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v549_95=549.95 unk_price_usd_msrp=Unknown
% @importance 0.85

0.95::true_val(price_usd_msrp, v549_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

0.88::acc(s20, price_usd_msrp).
0.78::acc(s21, price_usd_msrp).
0.75::acc(s27, price_usd_msrp).

measured(s20, price_usd_msrp, v549_95).
measured(s21, price_usd_msrp, v549_95).
measured(s27, price_usd_msrp, v549_95).

all_consistent(price_usd_msrp) :-
    consistent(s20, price_usd_msrp),
    (indep(s21), consistent(s21, price_usd_msrp) ; \+indep(s21)),
    (indep(s27), consistent(s27, price_usd_msrp) ; \+indep(s27)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v549_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v439_96=439.96 unk_price_usd_evo=Unknown
% @importance 0.9

0.90::true_val(price_usd_evo, v439_96); 0.10::true_val(price_usd_evo, unk_price_usd_evo).

0.90::acc(s22, price_usd_evo).

measured(s22, price_usd_evo, v439_96).

all_consistent(price_usd_evo) :-
    consistent(s22, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v439_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_gbp_blue_tomato_uk
% @type categorical
% @canonical false
% @original_name price_gbp_blue_tomato_uk
% @unit GBP
% @values gbp416_sale=416.00_sale_from_520.00_RRP unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.9

0.76::true_val(price_gbp_blue_tomato_uk, gbp416_sale); 0.24::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

0.88::acc(s23, price_gbp_blue_tomato_uk).

measured(s23, price_gbp_blue_tomato_uk, gbp416_sale).

all_consistent(price_gbp_blue_tomato_uk) :-
    consistent(s23, price_gbp_blue_tomato_uk).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, gbp416_sale)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values sold_out=Sold_Out unk_availability_status=Unknown
% @importance 0.85

0.95::true_val(availability_status, sold_out); 0.05::true_val(availability_status, unk_availability_status).

0.88::acc(s24, availability_status).
0.85::acc(s23, availability_status).
0.80::acc(s7, availability_status).

measured(s24, availability_status, sold_out).
measured(s23, availability_status, sold_out).
measured(s7, availability_status, sold_out).

all_consistent(availability_status) :-
    consistent(s24, availability_status),
    consistent(s23, availability_status),
    consistent(s7, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, sold_out)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_listed_25_26
% @type categorical
% @canonical false
% @original_name availability_status (listed for 25/26 season)
% @values listed_25_26=Listed_for_25_26_season unk_availability_status_listed_25_26=Unknown
% @importance 0.8

0.67::true_val(availability_status_listed_25_26, listed_25_26); 0.33::true_val(availability_status_listed_25_26, unk_availability_status_listed_25_26).

0.78::acc(s7, availability_status_listed_25_26).

measured(s7, availability_status_listed_25_26, listed_25_26).

all_consistent(availability_status_listed_25_26) :-
    consistent(s7, availability_status_listed_25_26).

evidence(all_consistent(availability_status_listed_25_26)).
query(true_val(availability_status_listed_25_26, listed_25_26)).
query(true_val(availability_status_listed_25_26, unk_availability_status_listed_25_26)).

% @attr price_usd_evo_standard
% @type categorical
% @canonical false
% @original_name price_usd_evo (Standard Process pricing)
% @values evo_2025_sale_2026_full=2025_at_439_96_sale_2026_at_549_95 unk_price_usd_evo_standard=Unknown
% @importance 0.85

0.80::true_val(price_usd_evo_standard, evo_2025_sale_2026_full); 0.20::true_val(price_usd_evo_standard, unk_price_usd_evo_standard).

0.88::acc(s22, price_usd_evo_standard).
0.82::acc(s25, price_usd_evo_standard).

measured(s22, price_usd_evo_standard, evo_2025_sale_2026_full).
measured(s25, price_usd_evo_standard, evo_2025_sale_2026_full).

all_consistent(price_usd_evo_standard) :-
    consistent(s22, price_usd_evo_standard),
    (indep(s25), consistent(s25, price_usd_evo_standard) ; \+indep(s25)).

evidence(all_consistent(price_usd_evo_standard)).
query(true_val(price_usd_evo_standard, evo_2025_sale_2026_full)).
query(true_val(price_usd_evo_standard, unk_price_usd_evo_standard)).

% @attr availability_status_process_available
% @type categorical
% @canonical false
% @original_name availability_status (Process Camber 2025/2026 available)
% @values available=Available unk_availability_status_process_available=Unknown
% @importance 0.8

0.72::true_val(availability_status_process_available, available); 0.28::true_val(availability_status_process_available, unk_availability_status_process_available).

0.82::acc(s26, availability_status_process_available).

measured(s26, availability_status_process_available, available).

all_consistent(availability_status_process_available) :-
    consistent(s26, availability_status_process_available).

evidence(all_consistent(availability_status_process_available)).
query(true_val(availability_status_process_available, available)).
query(true_val(availability_status_process_available, unk_availability_status_process_available)).

% @attr availability_status_process_2026
% @type categorical
% @canonical false
% @original_name availability_status (Process 2026 at Ski Monster)
% @values out_of_stock=Out_of_stock_549_95 unk_availability_status_process_2026=Unknown
% @importance 0.85

0.72::true_val(availability_status_process_2026, out_of_stock); 0.28::true_val(availability_status_process_2026, unk_availability_status_process_2026).

0.85::acc(s28, availability_status_process_2026).

measured(s28, availability_status_process_2026, out_of_stock).

all_consistent(availability_status_process_2026) :-
    consistent(s28, availability_status_process_2026).

evidence(all_consistent(availability_status_process_2026)).
query(true_val(availability_status_process_2026, out_of_stock)).
query(true_val(availability_status_process_2026, unk_availability_status_process_2026)).

% @attr price_usd_701cycle
% @type numeric
% @canonical false
% @original_name 701 Cycle and Sport price
% @unit USD
% @values v384_96=384.96 unk_price_usd_701cycle=Unknown
% @importance 0.8

0.51::true_val(price_usd_701cycle, v384_96); 0.49::true_val(price_usd_701cycle, unk_price_usd_701cycle).

0.75::acc(s29, price_usd_701cycle).

measured(s29, price_usd_701cycle, v384_96).

all_consistent(price_usd_701cycle) :-
    consistent(s29, price_usd_701cycle).

evidence(all_consistent(price_usd_701cycle)).
query(true_val(price_usd_701cycle, v384_96)).
query(true_val(price_usd_701cycle, unk_price_usd_701cycle)).

% @attr price_usd_paragon
% @type numeric
% @canonical false
% @original_name Paragon Sports price
% @unit USD
% @values v439_96=439.96 unk_price_usd_paragon=Unknown
% @importance 0.8

0.63::true_val(price_usd_paragon, v439_96); 0.37::true_val(price_usd_paragon, unk_price_usd_paragon).

0.80::acc(s30, price_usd_paragon).

measured(s30, price_usd_paragon, v439_96).

all_consistent(price_usd_paragon) :-
    consistent(s30, price_usd_paragon).

evidence(all_consistent(price_usd_paragon)).
query(true_val(price_usd_paragon, v439_96)).
query(true_val(price_usd_paragon, unk_price_usd_paragon)).

% @attr price_usd_ebay
% @type categorical
% @canonical false
% @original_name eBay pricing
% @values new_439_96_used_199_300=New_from_439_96_preowned_199_to_300 unk_price_usd_ebay=Unknown
% @importance 0.7

0.40::true_val(price_usd_ebay, new_439_96_used_199_300); 0.60::true_val(price_usd_ebay, unk_price_usd_ebay).

0.60::acc(s31, price_usd_ebay).

measured(s31, price_usd_ebay, new_439_96_used_199_300).

all_consistent(price_usd_ebay) :-
    consistent(s31, price_usd_ebay).

evidence(all_consistent(price_usd_ebay)).
query(true_val(price_usd_ebay, new_439_96_used_199_300)).
query(true_val(price_usd_ebay, unk_price_usd_ebay)).

% @attr shipping_restriction_merchant
% @type categorical
% @canonical false
% @original_name Shipping restriction (merchant source)
% @values australia_only=Only_ships_within_Australia unk_shipping_restriction_merchant=Unknown
% @importance 0.85

0.90::true_val(shipping_restriction_merchant, australia_only); 0.10::true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant).

0.93::acc(s19, shipping_restriction_merchant).

measured(s19, shipping_restriction_merchant, australia_only).

all_consistent(shipping_restriction_merchant) :-
    consistent(s19, shipping_restriction_merchant).

evidence(all_consistent(shipping_restriction_merchant)).
query(true_val(shipping_restriction_merchant, australia_only)).
query(true_val(shipping_restriction_merchant, unk_shipping_restriction_merchant)).

% @attr availability_status_limited_release
% @type categorical
% @canonical false
% @original_name availability_status (exclusive limited release)
% @values exclusive_limited=Exclusive_limited_release_one_more_chance unk_availability_status_limited_release=Unknown
% @importance 0.8

0.67::true_val(availability_status_limited_release, exclusive_limited); 0.33::true_val(availability_status_limited_release, unk_availability_status_limited_release).

0.80::acc(s7, availability_status_limited_release).

measured(s7, availability_status_limited_release, exclusive_limited).

all_consistent(availability_status_limited_release) :-
    consistent(s7, availability_status_limited_release).

evidence(all_consistent(availability_status_limited_release)).
query(true_val(availability_status_limited_release, exclusive_limited)).
query(true_val(availability_status_limited_release, unk_availability_status_limited_release)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain all_mountain_freestyle=All_Mountain_Freestyle unk_board_category=Unknown
% @importance 0.86

0.40::true_val(board_category, all_mountain); 0.55::true_val(board_category, all_mountain_freestyle); 0.05::true_val(board_category, unk_board_category).

0.85::acc(s19, board_category).
0.82::acc(s32, board_category).
0.80::acc(s33, board_category).
0.78::acc(s34, board_category).

measured(s19, board_category, all_mountain).
measured(s32, board_category, all_mountain).
measured(s33, board_category, all_mountain_freestyle).
measured(s34, board_category, all_mountain_freestyle).

all_consistent(board_category) :-
    (indep(s19), consistent(s19, board_category) ; \+indep(s19)),
    (indep(s32), consistent(s32, board_category) ; \+indep(s32)),
    consistent(s33, board_category),
    (indep(s34), consistent(s34, board_category) ; \+indep(s34)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, all_mountain_freestyle)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.7

0.60::true_val(gender, mens); 0.40::true_val(gender, unk_gender).

0.78::acc(s35, gender).

measured(s35, gender, mens).

all_consistent(gender) :-
    consistent(s35, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard_deck=Snowboard_deck_bindings_not_included unk_product_type=Unknown
% @importance 0.85

0.67::true_val(product_type, snowboard_deck); 0.33::true_val(product_type, unk_product_type).

0.82::acc(s36, product_type).

measured(s36, product_type, snowboard_deck).

all_consistent(product_type) :-
    consistent(s36, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard_deck)).
query(true_val(product_type, unk_product_type)).

% @attr terrain_suitability
% @type numeric
% @canonical true
% @original_name terrain_suitability
% @unit /10
% @values v5=5.0 unk_terrain_suitability=Unknown
% @importance 1.0

0.81::true_val(terrain_suitability, v5); 0.19::true_val(terrain_suitability, unk_terrain_suitability).

0.82::acc(s19, terrain_suitability).

measured(s19, terrain_suitability, v5).

all_consistent(terrain_suitability) :-
    consistent(s19, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v5)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability (park/freestyle)
% @unit /10
% @values v10=10.0 unk_terrain_suitability_park=Unknown
% @importance 1.0

0.81::true_val(terrain_suitability_park, v10); 0.19::true_val(terrain_suitability_park, unk_terrain_suitability_park).

0.82::acc(s19, terrain_suitability_park).

measured(s19, terrain_suitability_park, v10).

all_consistent(terrain_suitability_park) :-
    consistent(s19, terrain_suitability_park).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v10)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability_powder
% @type numeric
% @canonical false
% @original_name terrain_suitability (powder)
% @unit /10
% @values v6=6.0 unk_terrain_suitability_powder=Unknown
% @importance 1.0

0.81::true_val(terrain_suitability_powder, v6); 0.19::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

0.82::acc(s19, terrain_suitability_powder).

measured(s19, terrain_suitability_powder, v6).

all_consistent(terrain_suitability_powder) :-
    consistent(s19, terrain_suitability_powder).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v6)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_intermediate=Beginner_Intermediate progressing_beginner_intermediate=Progressing_beginner_or_intermediate intermediate_expert=Intermediate_Expert intermediate_advanced=Intermediate_to_advanced
% @importance 0.86

0.20::true_val(skill_level_recommendation, beginner_intermediate); 0.25::true_val(skill_level_recommendation, progressing_beginner_intermediate); 0.20::true_val(skill_level_recommendation, intermediate_expert); 0.35::true_val(skill_level_recommendation, intermediate_advanced).

0.78::acc(s19, skill_level_recommendation).
0.88::acc(s37, skill_level_recommendation).
0.72::acc(s38, skill_level_recommendation).
0.85::acc(s39, skill_level_recommendation).

measured(s19, skill_level_recommendation, beginner_intermediate).
measured(s37, skill_level_recommendation, progressing_beginner_intermediate).
measured(s38, skill_level_recommendation, intermediate_expert).
measured(s39, skill_level_recommendation, intermediate_advanced).

all_consistent(skill_level_recommendation) :-
    (indep(s19), consistent(s19, skill_level_recommendation) ; \+indep(s19)),
    consistent(s37, skill_level_recommendation),
    consistent(s38, skill_level_recommendation),
    consistent(s39, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_intermediate)).
query(true_val(skill_level_recommendation, progressing_beginner_intermediate)).
query(true_val(skill_level_recommendation, intermediate_expert)).
query(true_val(skill_level_recommendation, intermediate_advanced)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values good_one_board_quiver=Good_one_board_quiver_for_intermediate_no_speed_no_powder unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.8

0.63::true_val(reviewer_opinion_snowboardingprofiles, good_one_board_quiver); 0.37::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

0.82::acc(s40, reviewer_opinion_snowboardingprofiles).

measured(s40, reviewer_opinion_snowboardingprofiles, good_one_board_quiver).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s40, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, good_one_board_quiver)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values mark_mcmorris=Mark_McMorris unk_pro_rider_name=Unknown
% @importance 0.57

0.95::true_val(pro_rider_name, mark_mcmorris); 0.05::true_val(pro_rider_name, unk_pro_rider_name).

0.88::acc(s41, pro_rider_name).
0.87::acc(s42, pro_rider_name).
0.70::acc(s43, pro_rider_name).

measured(s41, pro_rider_name, mark_mcmorris).
measured(s42, pro_rider_name, mark_mcmorris).
measured(s43, pro_rider_name, mark_mcmorris).

all_consistent(pro_rider_name) :-
    consistent(s41, pro_rider_name),
    consistent(s42, pro_rider_name),
    consistent(s43, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, mark_mcmorris)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr pro_rider_endorsement
% @type categorical
% @canonical false
% @original_name pro_rider_name (McMorris' pick quote)
% @values mcmorris_pick_twin_freestyle=McMorris_pick_for_twin_freestyle_playfulness_all_terrain unk_pro_rider_endorsement=Unknown
% @importance 0.6

0.81::true_val(pro_rider_endorsement, mcmorris_pick_twin_freestyle); 0.19::true_val(pro_rider_endorsement, unk_pro_rider_endorsement).

0.85::acc(s42, pro_rider_endorsement).

measured(s42, pro_rider_endorsement, mcmorris_pick_twin_freestyle).

all_consistent(pro_rider_endorsement) :-
    consistent(s42, pro_rider_endorsement).

evidence(all_consistent(pro_rider_endorsement)).
query(true_val(pro_rider_endorsement, mcmorris_pick_twin_freestyle)).
query(true_val(pro_rider_endorsement, unk_pro_rider_endorsement)).

% @attr pro_rider_olympic
% @type categorical
% @canonical false
% @original_name pro_rider_name (McMorris bronze medal 2022 Beijing)
% @values bronze_2022_beijing=Bronze_medal_2022_Beijing_Olympics_on_Process unk_pro_rider_olympic=Unknown
% @importance 0.5

0.52::true_val(pro_rider_olympic, bronze_2022_beijing); 0.48::true_val(pro_rider_olympic, unk_pro_rider_olympic).

0.70::acc(s43, pro_rider_olympic).

measured(s43, pro_rider_olympic, bronze_2022_beijing).

all_consistent(pro_rider_olympic) :-
    consistent(s43, pro_rider_olympic).

evidence(all_consistent(pro_rider_olympic)).
query(true_val(pro_rider_olympic, bronze_2022_beijing)).
query(true_val(pro_rider_olympic, unk_pro_rider_olympic)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin_symmetrical_tip_and_tail unk_shape=Unknown
% @importance 0.95

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).

0.90::acc(s19, shape).
0.90::acc(s44, shape).

measured(s19, shape, true_twin).
measured(s44, shape, true_twin).

all_consistent(shape) :-
    (indep(s19), consistent(s19, shape) ; \+indep(s19)),
    (indep(s44), consistent(s44, shape) ; \+indep(s44)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v3_5=3.5 v6=6.0 v4=4.0
% @importance 0.87

0.35::true_val(flex_rating_10, v3_5); 0.30::true_val(flex_rating_10, v6); 0.35::true_val(flex_rating_10, v4).

0.80::acc(s19, flex_rating_10).
0.88::acc(s14, flex_rating_10).
0.78::acc(s45, flex_rating_10).

measured(s19, flex_rating_10, v3_5).
measured(s14, flex_rating_10, v6).
measured(s45, flex_rating_10, v4).

all_consistent(flex_rating_10) :-
    (indep(s19), consistent(s19, flex_rating_10) ; \+indep(s19)),
    consistent(s14, flex_rating_10),
    (indep(s45), consistent(s45, flex_rating_10) ; \+indep(s45)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v3_5)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, v4)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values twin_flex=Twin_Flex_symmetrical_tip_to_tail unk_flex_direction=Unknown
% @importance 0.95

0.81::true_val(flex_direction, twin_flex); 0.19::true_val(flex_direction, unk_flex_direction).

0.88::acc(s44, flex_direction).

measured(s44, flex_direction, twin_flex).

all_consistent(flex_direction) :-
    consistent(s44, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values casual_energy=Super_casual_energy_in_tip_tail medium_playful=Nice_medium_playful_on_snow stiffer_than_rated=Closer_to_6_or_7_stiffer_side
% @importance 0.75

0.30::true_val(flex_feel, casual_energy); 0.35::true_val(flex_feel, medium_playful); 0.35::true_val(flex_feel, stiffer_than_rated).

0.80::acc(s46, flex_feel).
0.75::acc(s47, flex_feel).
0.82::acc(s48, flex_feel).

measured(s46, flex_feel, casual_energy).
measured(s47, flex_feel, medium_playful).
measured(s48, flex_feel, stiffer_than_rated).

all_consistent(flex_feel) :-
    consistent(s46, flex_feel),
    consistent(s47, flex_feel),
    consistent(s48, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, casual_energy)).
query(true_val(flex_feel, medium_playful)).
query(true_val(flex_feel, stiffer_than_rated)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v0=0.0 unk_setback=Unknown
% @importance 0.85

0.90::true_val(setback, v0); 0.10::true_val(setback, unk_setback).

0.90::acc(s19, setback).

measured(s19, setback, v0).

all_consistent(setback) :-
    consistent(s19, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values purepop_camber=PurePop_Camber unk_camber_type=Unknown
% @importance 0.95

0.95::true_val(camber_type, purepop_camber); 0.05::true_val(camber_type, unk_camber_type).

0.90::acc(s19, camber_type).
0.88::acc(s44, camber_type).

measured(s19, camber_type, purepop_camber).
measured(s44, camber_type, purepop_camber).

all_consistent(camber_type) :-
    (indep(s19), consistent(s19, camber_type) ; \+indep(s19)),
    (indep(s44), consistent(s44, camber_type) ; \+indep(s44)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, purepop_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values camber_flat_rocker=Camber_between_feet_flat_outside_early_rocker_tip_tail unk_camber_description=Unknown
% @importance 0.85

0.82::true_val(camber_description, camber_flat_rocker); 0.18::true_val(camber_description, unk_camber_description).

0.82::acc(s49, camber_description).

measured(s49, camber_description, camber_flat_rocker).

all_consistent(camber_description) :-
    consistent(s49, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, camber_flat_rocker)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_detail
% @type categorical
% @canonical false
% @original_name camber_description (detail)
% @values flat_zones_pop_early_rise=Flat_zones_amplify_pop_early_rise_reduce_catch unk_camber_description_detail=Unknown
% @importance 0.85

0.90::true_val(camber_description_detail, flat_zones_pop_early_rise); 0.10::true_val(camber_description_detail, unk_camber_description_detail).

0.88::acc(s44, camber_description_detail).
0.85::acc(s50, camber_description_detail).

measured(s44, camber_description_detail, flat_zones_pop_early_rise).
measured(s50, camber_description_detail, flat_zones_pop_early_rise).

all_consistent(camber_description_detail) :-
    (indep(s44), consistent(s44, camber_description_detail) ; \+indep(s44)),
    (indep(s50), consistent(s50, camber_description_detail) ; \+indep(s50)).

evidence(all_consistent(camber_description_detail)).
query(true_val(camber_description_detail, flat_zones_pop_early_rise)).
query(true_val(camber_description_detail, unk_camber_description_detail)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G_Core_Dualzone_EGD_Squeezebox unk_core_material=Unknown
% @importance 0.95

0.95::true_val(core_material, super_fly_ii_700g); 0.05::true_val(core_material, unk_core_material).

0.88::acc(s19, core_material).
0.90::acc(s51, core_material).

measured(s19, core_material, super_fly_ii_700g).
measured(s51, core_material, super_fly_ii_700g).

all_consistent(core_material) :-
    (indep(s19), consistent(s19, core_material) ; \+indep(s19)),
    (indep(s51), consistent(s51, core_material) ; \+indep(s51)).

evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_Certified unk_sustainability_certification=Unknown
% @importance 0.725

0.95::true_val(sustainability_certification, fsc_certified); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

0.85::acc(s14, sustainability_certification).
0.93::acc(s52, sustainability_certification).

measured(s14, sustainability_certification, fsc_certified).
measured(s52, sustainability_certification, fsc_certified).

all_consistent(sustainability_certification) :-
    consistent(s14, sustainability_certification),
    consistent(s52, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr core_material_wood_species
% @type categorical
% @canonical false
% @original_name core_material (dual-species wood)
% @values dual_species_softwood_hardwood=Dual_species_dual_density_vertical_laminations unk_core_material_wood_species=Unknown
% @importance 0.6

0.56::true_val(core_material_wood_species, dual_species_softwood_hardwood); 0.44::true_val(core_material_wood_species, unk_core_material_wood_species).

0.72::acc(s53, core_material_wood_species).

measured(s53, core_material_wood_species, dual_species_softwood_hardwood).

all_consistent(core_material_wood_species) :-
    consistent(s53, core_material_wood_species).

evidence(all_consistent(core_material_wood_species)).
query(true_val(core_material_wood_species, dual_species_softwood_hardwood)).
query(true_val(core_material_wood_species, unk_core_material_wood_species)).

% @attr core_material_egd_detail
% @type categorical
% @canonical false
% @original_name core_material (EGD wood grain detail)
% @values egd_perpendicular_edges=Wood_grain_along_edges_two_unbroken_zones_perpendicular unk_core_material_egd_detail=Unknown
% @importance 0.9

0.81::true_val(core_material_egd_detail, egd_perpendicular_edges); 0.19::true_val(core_material_egd_detail, unk_core_material_egd_detail).

0.88::acc(s51, core_material_egd_detail).

measured(s51, core_material_egd_detail, egd_perpendicular_edges).

all_consistent(core_material_egd_detail) :-
    consistent(s51, core_material_egd_detail).

evidence(all_consistent(core_material_egd_detail)).
query(true_val(core_material_egd_detail, egd_perpendicular_edges)).
query(true_val(core_material_egd_detail, unk_core_material_egd_detail)).

% @attr core_material_squeezebox
% @type categorical
% @canonical false
% @original_name core_material (Squeezebox profiling)
% @values thick_thin_profiled=Thicker_powerful_and_thinner_flexible_sections unk_core_material_squeezebox=Unknown
% @importance 0.7

0.81::true_val(core_material_squeezebox, thick_thin_profiled); 0.19::true_val(core_material_squeezebox, unk_core_material_squeezebox).

0.88::acc(s54, core_material_squeezebox).

measured(s54, core_material_squeezebox, thick_thin_profiled).

all_consistent(core_material_squeezebox) :-
    consistent(s54, core_material_squeezebox).

evidence(all_consistent(core_material_squeezebox)).
query(true_val(core_material_squeezebox, thick_thin_profiled)).
query(true_val(core_material_squeezebox, unk_core_material_squeezebox)).

% @attr core_material_squeezebox_detail
% @type categorical
% @canonical false
% @original_name core_material (Squeezebox underfoot detail)
% @values thinner_underfoot_thicker_outside=Thinner_underfoot_for_maneuverability_thicker_outside_for_pop unk_core_material_squeezebox_detail=Unknown
% @importance 0.65

0.63::true_val(core_material_squeezebox_detail, thinner_underfoot_thicker_outside); 0.37::true_val(core_material_squeezebox_detail, unk_core_material_squeezebox_detail).

0.78::acc(s55, core_material_squeezebox_detail).

measured(s55, core_material_squeezebox_detail, thinner_underfoot_thicker_outside).

all_consistent(core_material_squeezebox_detail) :-
    consistent(s55, core_material_squeezebox_detail).

evidence(all_consistent(core_material_squeezebox_detail)).
query(true_val(core_material_squeezebox_detail, thinner_underfoot_thicker_outside)).
query(true_val(core_material_squeezebox_detail, unk_core_material_squeezebox_detail)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_fiberglass=Triax_Fiberglass unk_laminate=Unknown
% @importance 0.95

0.95::true_val(laminate, triax_fiberglass); 0.05::true_val(laminate, unk_laminate).

0.88::acc(s19, laminate).
0.90::acc(s51, laminate).

measured(s19, laminate, triax_fiberglass).
measured(s51, laminate, triax_fiberglass).

all_consistent(laminate) :-
    (indep(s19), consistent(s19, laminate) ; \+indep(s19)),
    (indep(s51), consistent(s51, laminate) ; \+indep(s51)).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_detail
% @type categorical
% @canonical false
% @original_name laminate (three-direction weave detail)
% @values three_direction_weave=Glass_woven_three_directions_lengthwise_diagonally unk_laminate_detail=Unknown
% @importance 0.575

0.70::true_val(laminate_detail, three_direction_weave); 0.30::true_val(laminate_detail, unk_laminate_detail).

0.78::acc(s56, laminate_detail).
0.80::acc(s57, laminate_detail).

measured(s56, laminate_detail, three_direction_weave).
measured(s57, laminate_detail, three_direction_weave).

all_consistent(laminate_detail) :-
    consistent(s56, laminate_detail),
    (indep(s57), consistent(s57, laminate_detail) ; \+indep(s57)).

evidence(all_consistent(laminate_detail)).
query(true_val(laminate_detail, three_direction_weave)).
query(true_val(laminate_detail, unk_laminate_detail)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values triax_only_no_carbon=Process_uses_only_Triax_fiberglass_no_carbon unk_construction_material_innovation=Unknown
% @importance 0.825

0.85::true_val(construction_material_innovation, triax_only_no_carbon); 0.15::true_val(construction_material_innovation, unk_construction_material_innovation).

0.85::acc(s14, construction_material_innovation).
0.82::acc(s58, construction_material_innovation).

measured(s14, construction_material_innovation, triax_only_no_carbon).
measured(s58, construction_material_innovation, triax_only_no_carbon).

all_consistent(construction_material_innovation) :-
    consistent(s14, construction_material_innovation),
    consistent(s58, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, triax_only_no_carbon)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered unk_base_type=Unknown
% @importance 0.925

0.95::true_val(base_type, sintered); 0.05::true_val(base_type, unk_base_type).

0.88::acc(s19, base_type).
0.90::acc(s51, base_type).

measured(s19, base_type, sintered).
measured(s51, base_type, sintered).

all_consistent(base_type) :-
    (indep(s19), consistent(s19, base_type) ; \+indep(s19)),
    (indep(s51), consistent(s51, base_type) ; \+indep(s51)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values durable_porous_wax_absorbing=Durable_highly_porous_added_strength_wax_absorption unk_base_material=Unknown
% @importance 0.9

0.81::true_val(base_material, durable_porous_wax_absorbing); 0.19::true_val(base_material, unk_base_material).

0.88::acc(s51, base_material).

measured(s51, base_material, durable_porous_wax_absorbing).

all_consistent(base_material) :-
    consistent(s51, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, durable_porous_wax_absorbing)).
query(true_val(base_material, unk_base_material)).

% @attr base_material_waxing
% @type categorical
% @canonical false
% @original_name base_material (waxing maintenance)
% @values needs_frequent_initial_wax=Initially_releases_wax_needs_more_frequent_waxing unk_base_material_waxing=Unknown
% @importance 0.5

0.63::true_val(base_material_waxing, needs_frequent_initial_wax); 0.37::true_val(base_material_waxing, unk_base_material_waxing).

0.78::acc(s59, base_material_waxing).

measured(s59, base_material_waxing, needs_frequent_initial_wax).

all_consistent(base_material_waxing) :-
    consistent(s59, base_material_waxing).

evidence(all_consistent(base_material_waxing)).
query(true_val(base_material_waxing, needs_frequent_initial_wax)).
query(true_val(base_material_waxing, unk_base_material_waxing)).

% @attr factory_tuning
% @type categorical
% @canonical false
% @original_name Factory tuning
% @values waxed_ready=Board_comes_waxed_and_ready unk_factory_tuning=Unknown
% @importance 0.4

0.63::true_val(factory_tuning, waxed_ready); 0.37::true_val(factory_tuning, unk_factory_tuning).

0.78::acc(s60, factory_tuning).

measured(s60, factory_tuning, waxed_ready).

all_consistent(factory_tuning) :-
    consistent(s60, factory_tuning).

evidence(all_consistent(factory_tuning)).
query(true_val(factory_tuning, waxed_ready)).
query(true_val(factory_tuning, unk_factory_tuning)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges unk_edge_technology=Unknown
% @importance 0.925

0.95::true_val(edge_technology, frostbite_edges); 0.05::true_val(edge_technology, unk_edge_technology).

0.88::acc(s19, edge_technology).
0.90::acc(s51, edge_technology).

measured(s19, edge_technology, frostbite_edges).
measured(s51, edge_technology, frostbite_edges).

all_consistent(edge_technology) :-
    (indep(s19), consistent(s19, edge_technology) ; \+indep(s19)),
    (indep(s51), consistent(s51, edge_technology) ; \+indep(s51)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_technology_detail
% @type categorical
% @canonical false
% @original_name edge_technology (extend beneath bindings)
% @values extend_beneath_bindings=Edges_extend_beneath_bindings_for_edge_hold_on_ice unk_edge_technology_detail=Unknown
% @importance 0.75

0.67::true_val(edge_technology_detail, extend_beneath_bindings); 0.33::true_val(edge_technology_detail, unk_edge_technology_detail).

0.82::acc(s61, edge_technology_detail).

measured(s61, edge_technology_detail, extend_beneath_bindings).

all_consistent(edge_technology_detail) :-
    consistent(s61, edge_technology_detail).

evidence(all_consistent(edge_technology_detail)).
query(true_val(edge_technology_detail, extend_beneath_bindings)).
query(true_val(edge_technology_detail, unk_edge_technology_detail)).

% @attr edge_technology_comparison
% @type categorical
% @canonical false
% @original_name edge_technology (Magne-Traction comparison)
% @values variation_of_magnetraction=Described_as_variation_of_Magne_Traction unk_edge_technology_comparison=Unknown
% @importance 0.55

0.55::true_val(edge_technology_comparison, variation_of_magnetraction); 0.45::true_val(edge_technology_comparison, unk_edge_technology_comparison).

0.72::acc(s62, edge_technology_comparison).

measured(s62, edge_technology_comparison, variation_of_magnetraction).

all_consistent(edge_technology_comparison) :-
    consistent(s62, edge_technology_comparison).

evidence(all_consistent(edge_technology_comparison)).
query(true_val(edge_technology_comparison, variation_of_magnetraction)).
query(true_val(edge_technology_comparison, unk_edge_technology_comparison)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_recycled=ABS_recycled unk_sidewall_material=Unknown
% @importance 0.45

0.63::true_val(sidewall_material, abs_recycled); 0.37::true_val(sidewall_material, unk_sidewall_material).

0.80::acc(s63, sidewall_material).

measured(s63, sidewall_material, abs_recycled).

all_consistent(sidewall_material) :-
    consistent(s63, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_recycled)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sustainability_certification_recycled
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled sidewall)
% @values recycled_when_no_alternative=Recycled_material_when_plastic_alternative_unavailable unk_sustainability_certification_recycled=Unknown
% @importance 0.45

0.63::true_val(sustainability_certification_recycled, recycled_when_no_alternative); 0.37::true_val(sustainability_certification_recycled, unk_sustainability_certification_recycled).

0.80::acc(s63, sustainability_certification_recycled).

measured(s63, sustainability_certification_recycled, recycled_when_no_alternative).

all_consistent(sustainability_certification_recycled) :-
    consistent(s63, sustainability_certification_recycled).

evidence(all_consistent(sustainability_certification_recycled)).
query(true_val(sustainability_certification_recycled, recycled_when_no_alternative)).
query(true_val(sustainability_certification_recycled, unk_sustainability_certification_recycled)).

% @attr construction_material_innovation_protip
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Pro-Tip)
% @values pro_tip=Pro_Tip_tip_tail_taper_reduces_swing_weight unk_construction_material_innovation_protip=Unknown
% @importance 0.85

0.81::true_val(construction_material_innovation_protip, pro_tip); 0.19::true_val(construction_material_innovation_protip, unk_construction_material_innovation_protip).

0.88::acc(s19, construction_material_innovation_protip).

measured(s19, construction_material_innovation_protip, pro_tip).

all_consistent(construction_material_innovation_protip) :-
    consistent(s19, construction_material_innovation_protip).

evidence(all_consistent(construction_material_innovation_protip)).
query(true_val(construction_material_innovation_protip, pro_tip)).
query(true_val(construction_material_innovation_protip, unk_construction_material_innovation_protip)).

% @attr construction_material_innovation_ir
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Infinite Ride)
% @values infinite_ride=Infinite_Ride_overbuilt_then_broken_in unk_construction_material_innovation_ir=Unknown
% @importance 0.75

0.85::true_val(construction_material_innovation_ir, infinite_ride); 0.15::true_val(construction_material_innovation_ir, unk_construction_material_innovation_ir).

0.85::acc(s19, construction_material_innovation_ir).
0.82::acc(s64, construction_material_innovation_ir).

measured(s19, construction_material_innovation_ir, infinite_ride).
measured(s64, construction_material_innovation_ir, infinite_ride).

all_consistent(construction_material_innovation_ir) :-
    (indep(s19), consistent(s19, construction_material_innovation_ir) ; \+indep(s19)),
    (indep(s64), consistent(s64, construction_material_innovation_ir) ; \+indep(s64)).

evidence(all_consistent(construction_material_innovation_ir)).
query(true_val(construction_material_innovation_ir, infinite_ride)).
query(true_val(construction_material_innovation_ir, unk_construction_material_innovation_ir)).

% @attr construction_material_innovation_ir_detail
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Infinite Ride detail)
% @values overbuilt_broken_in=Overbuilt_in_factory_broken_down_by_machinery_for_consistency unk_construction_material_innovation_ir_detail=Unknown
% @importance 0.65

0.67::true_val(construction_material_innovation_ir_detail, overbuilt_broken_in); 0.33::true_val(construction_material_innovation_ir_detail, unk_construction_material_innovation_ir_detail).

0.82::acc(s64, construction_material_innovation_ir_detail).

measured(s64, construction_material_innovation_ir_detail, overbuilt_broken_in).

all_consistent(construction_material_innovation_ir_detail) :-
    consistent(s64, construction_material_innovation_ir_detail).

evidence(all_consistent(construction_material_innovation_ir_detail)).
query(true_val(construction_material_innovation_ir_detail, overbuilt_broken_in)).
query(true_val(construction_material_innovation_ir_detail, unk_construction_material_innovation_ir_detail)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy unk_resin=Unknown
% @importance 0.675

0.85::true_val(resin, super_sap_epoxy); 0.15::true_val(resin, unk_resin).

0.85::acc(s19, resin).
0.82::acc(s65, resin).

measured(s19, resin, super_sap_epoxy).
measured(s65, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(s19), consistent(s19, resin) ; \+indep(s19)),
    (indep(s65), consistent(s65, resin) ; \+indep(s65)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr sustainability_certification_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification (bio-based resin)
% @values bio_based_50pct_less_carbon=Bio_based_resin_50pct_carbon_reduction unk_sustainability_certification_resin=Unknown
% @importance 0.5

0.67::true_val(sustainability_certification_resin, bio_based_50pct_less_carbon); 0.33::true_val(sustainability_certification_resin, unk_sustainability_certification_resin).

0.82::acc(s65, sustainability_certification_resin).

measured(s65, sustainability_certification_resin, bio_based_50pct_less_carbon).

all_consistent(sustainability_certification_resin) :-
    consistent(s65, sustainability_certification_resin).

evidence(all_consistent(sustainability_certification_resin)).
query(true_val(sustainability_certification_resin, bio_based_50pct_less_carbon)).
query(true_val(sustainability_certification_resin, unk_sustainability_certification_resin)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel unk_mounting_pattern=Unknown
% @importance 0.925

0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

0.88::acc(s19, mounting_pattern).
0.90::acc(s51, mounting_pattern).

measured(s19, mounting_pattern, the_channel).
measured(s51, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    (indep(s19), consistent(s19, mounting_pattern) ; \+indep(s19)),
    (indep(s51), consistent(s51, mounting_pattern) ; \+indep(s51)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values all_major_brands=Compatible_with_all_major_binding_brands unk_binding_compatibility=Unknown
% @importance 0.85

0.81::true_val(binding_compatibility, all_major_brands); 0.19::true_val(binding_compatibility, unk_binding_compatibility).

0.88::acc(s66, binding_compatibility).

measured(s66, binding_compatibility, all_major_brands).

all_consistent(binding_compatibility) :-
    consistent(s66, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, all_major_brands)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr binding_compatibility_est
% @type categorical
% @canonical false
% @original_name binding_compatibility (EST bindings)
% @values est_best=Works_best_with_Burton_EST_bindings unk_binding_compatibility_est=Unknown
% @importance 0.8

0.63::true_val(binding_compatibility_est, est_best); 0.37::true_val(binding_compatibility_est, unk_binding_compatibility_est).

0.78::acc(s67, binding_compatibility_est).

measured(s67, binding_compatibility_est, est_best).

all_consistent(binding_compatibility_est) :-
    consistent(s67, binding_compatibility_est).

evidence(all_consistent(binding_compatibility_est)).
query(true_val(binding_compatibility_est, est_best)).
query(true_val(binding_compatibility_est, unk_binding_compatibility_est)).

% @attr mounting_pattern_detail
% @type categorical
% @canonical false
% @original_name mounting_pattern (Channel detail)
% @values two_slots_two_screws=Two_parallel_slots_infinite_mounting_two_screws_per_binding unk_mounting_pattern_detail=Unknown
% @importance 0.7

0.67::true_val(mounting_pattern_detail, two_slots_two_screws); 0.33::true_val(mounting_pattern_detail, unk_mounting_pattern_detail).

0.82::acc(s68, mounting_pattern_detail).

measured(s68, mounting_pattern_detail, two_slots_two_screws).

all_consistent(mounting_pattern_detail) :-
    consistent(s68, mounting_pattern_detail).

evidence(all_consistent(mounting_pattern_detail)).
query(true_val(mounting_pattern_detail, two_slots_two_screws)).
query(true_val(mounting_pattern_detail, unk_mounting_pattern_detail)).

% @attr mounting_pattern_history
% @type categorical
% @canonical false
% @original_name mounting_pattern (3D replaced in 2014)
% @values replaced_3d_2014=Burtons_3D_pattern_replaced_in_2014 unk_mounting_pattern_history=Unknown
% @importance 0.4

0.63::true_val(mounting_pattern_history, replaced_3d_2014); 0.37::true_val(mounting_pattern_history, unk_mounting_pattern_history).

0.78::acc(s69, mounting_pattern_history).

measured(s69, mounting_pattern_history, replaced_3d_2014).

all_consistent(mounting_pattern_history) :-
    consistent(s69, mounting_pattern_history).

evidence(all_consistent(mounting_pattern_history)).
query(true_val(mounting_pattern_history, replaced_3d_2014)).
query(true_val(mounting_pattern_history, unk_mounting_pattern_history)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values holographic_spaceman=Holographic_helmet_spaceman_re_release unk_available_colors=Unknown
% @importance 0.55

0.85::true_val(available_colors, holographic_spaceman); 0.15::true_val(available_colors, unk_available_colors).

0.88::acc(s19, available_colors).
0.80::acc(s7, available_colors).

measured(s19, available_colors, holographic_spaceman).
measured(s7, available_colors, holographic_spaceman).

all_consistent(available_colors) :-
    (indep(s19), consistent(s19, available_colors) ; \+indep(s19)),
    consistent(s7, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, holographic_spaceman)).
query(true_val(available_colors, unk_available_colors)).

% @attr availability_status_exclusive
% @type categorical
% @canonical false
% @original_name availability_status (exclusive limited release detail)
% @values exclusive_sold_out_instantly=Exclusive_limited_release_graphic_sold_out_instantly unk_availability_status_exclusive=Unknown
% @importance 0.8

0.67::true_val(availability_status_exclusive, exclusive_sold_out_instantly); 0.33::true_val(availability_status_exclusive, unk_availability_status_exclusive).

0.80::acc(s7, availability_status_exclusive).

measured(s7, availability_status_exclusive, exclusive_sold_out_instantly).

all_consistent(availability_status_exclusive) :-
    consistent(s7, availability_status_exclusive).

evidence(all_consistent(availability_status_exclusive)).
query(true_val(availability_status_exclusive, exclusive_sold_out_instantly)).
query(true_val(availability_status_exclusive, unk_availability_status_exclusive)).

% @attr available_colors_tiger
% @type categorical
% @canonical false
% @original_name available_colors (Tiger graphic)
% @values tiger_graphic=Tiger_graphic unk_available_colors_tiger=Unknown
% @importance 0.3

0.67::true_val(available_colors_tiger, tiger_graphic); 0.33::true_val(available_colors_tiger, unk_available_colors_tiger).

0.78::acc(s70, available_colors_tiger).

measured(s70, available_colors_tiger, tiger_graphic).

all_consistent(available_colors_tiger) :-
    consistent(s70, available_colors_tiger).

evidence(all_consistent(available_colors_tiger)).
query(true_val(available_colors_tiger, tiger_graphic)).
query(true_val(available_colors_tiger, unk_available_colors_tiger)).

% @attr panda_graphic_2024
% @type categorical
% @canonical false
% @original_name 2024/25 Process also featured a panda graphic
% @values panda_graphic=Panda_graphic unk_panda_graphic_2024=Unknown
% @importance 0.25

0.55::true_val(panda_graphic_2024, panda_graphic); 0.45::true_val(panda_graphic_2024, unk_panda_graphic_2024).

0.70::acc(s71, panda_graphic_2024).

measured(s71, panda_graphic_2024, panda_graphic).

all_consistent(panda_graphic_2024) :-
    consistent(s71, panda_graphic_2024).

evidence(all_consistent(panda_graphic_2024)).
query(true_val(panda_graphic_2024, panda_graphic)).
query(true_val(panda_graphic_2024, unk_panda_graphic_2024)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values eight_sizes=152_155_157_159_162_157W_159W_162W unk_available_sizes=Unknown
% @importance 0.85

0.90::true_val(available_sizes, eight_sizes); 0.10::true_val(available_sizes, unk_available_sizes).

0.90::acc(s19, available_sizes).

measured(s19, available_sizes, eight_sizes).

all_consistent(available_sizes) :-
    consistent(s19, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, eight_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.90::true_val(width_options, standard_and_wide); 0.10::true_val(width_options, unk_width_options).

0.90::acc(s19, width_options).

measured(s19, width_options, standard_and_wide).

all_consistent(width_options) :-
    consistent(s19, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr effective_edge_152
% @type numeric
% @canonical false
% @original_name Effective edge 152cm
% @unit mm
% @values v1165=1165.0 unk_effective_edge_152=Unknown
% @importance 1.0

0.81::true_val(effective_edge_152, v1165); 0.19::true_val(effective_edge_152, unk_effective_edge_152).

0.88::acc(s19, effective_edge_152).

measured(s19, effective_edge_152, v1165).

all_consistent(effective_edge_152) :-
    consistent(s19, effective_edge_152).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v1165)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

% @attr effective_edge_155
% @type numeric
% @canonical false
% @original_name Effective edge 155cm
% @unit mm
% @values v1195=1195.0 unk_effective_edge_155=Unknown
% @importance 1.0

0.81::true_val(effective_edge_155, v1195); 0.19::true_val(effective_edge_155, unk_effective_edge_155).

0.88::acc(s19, effective_edge_155).

measured(s19, effective_edge_155, v1195).

all_consistent(effective_edge_155) :-
    consistent(s19, effective_edge_155).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v1195)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

% @attr effective_edge_157
% @type numeric
% @canonical false
% @original_name Effective edge 157cm
% @unit mm
% @values v1215=1215.0 unk_effective_edge_157=Unknown
% @importance 1.0

0.81::true_val(effective_edge_157, v1215); 0.19::true_val(effective_edge_157, unk_effective_edge_157).

0.88::acc(s19, effective_edge_157).

measured(s19, effective_edge_157, v1215).

all_consistent(effective_edge_157) :-
    consistent(s19, effective_edge_157).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v1215)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr effective_edge_159
% @type numeric
% @canonical false
% @original_name Effective edge 159cm
% @unit mm
% @values v1235=1235.0 unk_effective_edge_159=Unknown
% @importance 1.0

0.81::true_val(effective_edge_159, v1235); 0.19::true_val(effective_edge_159, unk_effective_edge_159).

0.88::acc(s19, effective_edge_159).

measured(s19, effective_edge_159, v1235).

all_consistent(effective_edge_159) :-
    consistent(s19, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1235)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr effective_edge_162
% @type numeric
% @canonical false
% @original_name Effective edge 162cm
% @unit mm
% @values v1265=1265.0 unk_effective_edge_162=Unknown
% @importance 1.0

0.81::true_val(effective_edge_162, v1265); 0.19::true_val(effective_edge_162, unk_effective_edge_162).

0.88::acc(s19, effective_edge_162).

measured(s19, effective_edge_162, v1265).

all_consistent(effective_edge_162) :-
    consistent(s19, effective_edge_162).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1265)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr sidecut_radius_size_152
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (152cm)
% @unit m
% @values v7_7=7.7 unk_sidecut_radius_size_152=Unknown
% @importance 1.0

0.81::true_val(sidecut_radius_size_152, v7_7); 0.19::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

0.88::acc(s19, sidecut_radius_size_152).

measured(s19, sidecut_radius_size_152, v7_7).

all_consistent(sidecut_radius_size_152) :-
    consistent(s19, sidecut_radius_size_152).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v7_7)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

% @attr sidecut_radius_size_155
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (155cm)
% @unit m
% @values v7_9=7.9 unk_sidecut_radius_size_155=Unknown
% @importance 1.0

0.81::true_val(sidecut_radius_size_155, v7_9); 0.19::true_val(sidecut_radius_size_155, unk_sidecut_radius_size_155).

0.88::acc(s19, sidecut_radius_size_155).

measured(s19, sidecut_radius_size_155, v7_9).

all_consistent(sidecut_radius_size_155) :-
    consistent(s19, sidecut_radius_size_155).

evidence(all_consistent(sidecut_radius_size_155)).
query(true_val(sidecut_radius_size_155, v7_9)).
query(true_val(sidecut_radius_size_155, unk_sidecut_radius_size_155)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v8_1=8.1 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.81::true_val(sidecut_radius_size, v8_1); 0.19::true_val(sidecut_radius_size, unk_sidecut_radius_size).

0.88::acc(s19, sidecut_radius_size).

measured(s19, sidecut_radius_size, v8_1).

all_consistent(sidecut_radius_size) :-
    consistent(s19, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_1)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @unit m
% @values v8_2=8.2 unk_sidecut_radius_size_159=Unknown
% @importance 1.0

0.81::true_val(sidecut_radius_size_159, v8_2); 0.19::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

0.88::acc(s19, sidecut_radius_size_159).

measured(s19, sidecut_radius_size_159, v8_2).

all_consistent(sidecut_radius_size_159) :-
    consistent(s19, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_2)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr sidecut_radius_size_162
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (162cm)
% @unit m
% @values v8_4=8.4 unk_sidecut_radius_size_162=Unknown
% @importance 1.0

0.81::true_val(sidecut_radius_size_162, v8_4); 0.19::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).

0.88::acc(s19, sidecut_radius_size_162).

measured(s19, sidecut_radius_size_162, v8_4).

all_consistent(sidecut_radius_size_162) :-
    consistent(s19, sidecut_radius_size_162).

evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v8_4)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr waist_width_152
% @type numeric
% @canonical false
% @original_name Waist width 152cm
% @unit mm
% @values v249=249.0 unk_waist_width_152=Unknown
% @importance 1.0

0.81::true_val(waist_width_152, v249); 0.19::true_val(waist_width_152, unk_waist_width_152).

0.88::acc(s19, waist_width_152).

measured(s19, waist_width_152, v249).

all_consistent(waist_width_152) :-
    consistent(s19, waist_width_152).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v249)).
query(true_val(waist_width_152, unk_waist_width_152)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name Waist width 155cm
% @unit mm
% @values v251=251.0 unk_waist_width_155=Unknown
% @importance 1.0

0.81::true_val(waist_width_155, v251); 0.19::true_val(waist_width_155, unk_waist_width_155).

0.88::acc(s19, waist_width_155).

measured(s19, waist_width_155, v251).

all_consistent(waist_width_155) :-
    consistent(s19, waist_width_155).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v251)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr waist_width_157
% @type numeric
% @canonical false
% @original_name Waist width 157cm
% @unit mm
% @values v252=252.0 unk_waist_width_157=Unknown
% @importance 1.0

0.81::true_val(waist_width_157, v252); 0.19::true_val(waist_width_157, unk_waist_width_157).

0.88::acc(s19, waist_width_157).

measured(s19, waist_width_157, v252).

all_consistent(waist_width_157) :-
    consistent(s19, waist_width_157).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v252)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name Waist width 159cm
% @unit mm
% @values v255=255.0 unk_waist_width_159=Unknown
% @importance 1.0

0.81::true_val(waist_width_159, v255); 0.19::true_val(waist_width_159, unk_waist_width_159).

0.88::acc(s19, waist_width_159).

measured(s19, waist_width_159, v255).

all_consistent(waist_width_159) :-
    consistent(s19, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v255)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr waist_width_162
% @type numeric
% @canonical false
% @original_name Waist width 162cm
% @unit mm
% @values v257=257.0 unk_waist_width_162=Unknown
% @importance 1.0

0.81::true_val(waist_width_162, v257); 0.19::true_val(waist_width_162, unk_waist_width_162).

0.88::acc(s19, waist_width_162).

measured(s19, waist_width_162, v257).

all_consistent(waist_width_162) :-
    consistent(s19, waist_width_162).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v257)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr waist_width_155w
% @type numeric
% @canonical false
% @original_name Waist width 155cm Wide
% @unit mm
% @values v256=256.0 unk_waist_width_155w=Unknown
% @importance 1.0

0.81::true_val(waist_width_155w, v256); 0.19::true_val(waist_width_155w, unk_waist_width_155w).

0.88::acc(s19, waist_width_155w).

measured(s19, waist_width_155w, v256).

all_consistent(waist_width_155w) :-
    consistent(s19, waist_width_155w).

evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v256)).
query(true_val(waist_width_155w, unk_waist_width_155w)).

% @attr waist_width_157w
% @type numeric
% @canonical false
% @original_name Waist width 157cm Wide
% @unit mm
% @values v257w=257.0 unk_waist_width_157w=Unknown
% @importance 1.0

0.81::true_val(waist_width_157w, v257w); 0.19::true_val(waist_width_157w, unk_waist_width_157w).

0.88::acc(s19, waist_width_157w).

measured(s19, waist_width_157w, v257w).

all_consistent(waist_width_157w) :-
    consistent(s19, waist_width_157w).

evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v257w)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

% @attr waist_width_159w
% @type numeric
% @canonical false
% @original_name Waist width 159cm Wide
% @unit mm
% @values v260=260.0 unk_waist_width_159w=Unknown
% @importance 1.0

0.81::true_val(waist_width_159w, v260); 0.19::true_val(waist_width_159w, unk_waist_width_159w).

0.88::acc(s19, waist_width_159w).

measured(s19, waist_width_159w, v260).

all_consistent(waist_width_159w) :-
    consistent(s19, waist_width_159w).

evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v260)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

% @attr waist_width_162w
% @type numeric
% @canonical false
% @original_name Waist width 162cm Wide
% @unit mm
% @values v262=262.0 unk_waist_width_162w=Unknown
% @importance 1.0

0.81::true_val(waist_width_162w, v262); 0.19::true_val(waist_width_162w, unk_waist_width_162w).

0.88::acc(s19, waist_width_162w).

measured(s19, waist_width_162w, v262).

all_consistent(waist_width_162w) :-
    consistent(s19, waist_width_162w).

evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v262)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit mm
% @values v530=530.0 unk_stance_width_range_size=Unknown
% @importance 1.0

0.81::true_val(stance_width_range_size, v530); 0.19::true_val(stance_width_range_size, unk_stance_width_range_size).

0.88::acc(s19, stance_width_range_size).

measured(s19, stance_width_range_size, v530).

all_consistent(stance_width_range_size) :-
    consistent(s19, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v530)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_large
% @type numeric
% @canonical false
% @original_name stance_width_range_size (large sizes)
% @unit mm
% @values v560=560.0 unk_stance_width_range_size_large=Unknown
% @importance 1.0

0.81::true_val(stance_width_range_size_large, v560); 0.19::true_val(stance_width_range_size_large, unk_stance_width_range_size_large).

0.88::acc(s19, stance_width_range_size_large).

measured(s19, stance_width_range_size_large, v560).

all_consistent(stance_width_range_size_large) :-
    consistent(s19, stance_width_range_size_large).

evidence(all_consistent(stance_width_range_size_large)).
query(true_val(stance_width_range_size_large, v560)).
query(true_val(stance_width_range_size_large, unk_stance_width_range_size_large)).

% @attr recommended_weight_range_size_152
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (152cm)
% @unit kg
% @values kg54_82=54_to_82kg unk_recommended_weight_range_size_152=Unknown
% @importance 1.0

0.81::true_val(recommended_weight_range_size_152, kg54_82); 0.19::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

0.88::acc(s19, recommended_weight_range_size_152).

measured(s19, recommended_weight_range_size_152, kg54_82).

all_consistent(recommended_weight_range_size_152) :-
    consistent(s19, recommended_weight_range_size_152).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, kg54_82)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

% @attr recommended_weight_range_size_155
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (155cm)
% @unit kg
% @values kg54_82=54_to_82kg unk_recommended_weight_range_size_155=Unknown
% @importance 1.0

0.81::true_val(recommended_weight_range_size_155, kg54_82); 0.19::true_val(recommended_weight_range_size_155, unk_recommended_weight_range_size_155).

0.88::acc(s19, recommended_weight_range_size_155).

measured(s19, recommended_weight_range_size_155, kg54_82).

all_consistent(recommended_weight_range_size_155) :-
    consistent(s19, recommended_weight_range_size_155).

evidence(all_consistent(recommended_weight_range_size_155)).
query(true_val(recommended_weight_range_size_155, kg54_82)).
query(true_val(recommended_weight_range_size_155, unk_recommended_weight_range_size_155)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values kg68_91=68_to_91kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.81::true_val(recommended_weight_range_size, kg68_91); 0.19::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

0.88::acc(s19, recommended_weight_range_size).

measured(s19, recommended_weight_range_size, kg68_91).

all_consistent(recommended_weight_range_size) :-
    consistent(s19, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, kg68_91)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @unit kg
% @values kg68_91=68_to_91kg unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.81::true_val(recommended_weight_range_size_159, kg68_91); 0.19::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

0.88::acc(s19, recommended_weight_range_size_159).

measured(s19, recommended_weight_range_size_159, kg68_91).

all_consistent(recommended_weight_range_size_159) :-
    consistent(s19, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, kg68_91)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr recommended_weight_range_size_162
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (162cm)
% @unit kg
% @values kg82_118plus=82_to_118_plus_kg unk_recommended_weight_range_size_162=Unknown
% @importance 1.0

0.81::true_val(recommended_weight_range_size_162, kg82_118plus); 0.19::true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162).

0.88::acc(s19, recommended_weight_range_size_162).

measured(s19, recommended_weight_range_size_162, kg82_118plus).

all_consistent(recommended_weight_range_size_162) :-
    consistent(s19, recommended_weight_range_size_162).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, kg82_118plus)).
query(true_val(recommended_weight_range_size_162, unk_recommended_weight_range_size_162)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit lbs
% @values v6_62=6.62 unk_board_weight_grams=Unknown
% @importance 0.65

0.25::true_val(board_weight_grams, v6_62); 0.75::true_val(board_weight_grams, unk_board_weight_grams).

0.55::acc(s72, board_weight_grams).

measured(s72, board_weight_grams, v6_62).

all_consistent(board_weight_grams) :-
    consistent(s72, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v6_62)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values felt_normal=Approximate_Weight_Felt_Normal unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.7

0.56::true_val(reviewer_opinion_the_good_ride, felt_normal); 0.44::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

0.75::acc(s47, reviewer_opinion_the_good_ride).

measured(s47, reviewer_opinion_the_good_ride, felt_normal).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s47, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, felt_normal)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr weight_feel_reviewer
% @type categorical
% @canonical false
% @original_name Weight feel (reviewer)
% @values lightweight_easy_maneuver=Lightweight_construction_so_easy_to_maneuver unk_weight_feel_reviewer=Unknown
% @importance 0.7

0.64::true_val(weight_feel_reviewer, lightweight_easy_maneuver); 0.36::true_val(weight_feel_reviewer, unk_weight_feel_reviewer).

0.80::acc(s46, weight_feel_reviewer).

measured(s46, weight_feel_reviewer, lightweight_easy_maneuver).

all_consistent(weight_feel_reviewer) :-
    consistent(s46, weight_feel_reviewer).

evidence(all_consistent(weight_feel_reviewer)).
query(true_val(weight_feel_reviewer, lightweight_easy_maneuver)).
query(true_val(weight_feel_reviewer, unk_weight_feel_reviewer)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v3=3.0 unk_warranty_period_years=Unknown
% @importance 0.85

0.95::true_val(warranty_period_years, v3); 0.05::true_val(warranty_period_years, unk_warranty_period_years).

0.88::acc(s73, warranty_period_years).
0.82::acc(s74, warranty_period_years).

measured(s73, warranty_period_years, v3).
measured(s74, warranty_period_years, v3).

all_consistent(warranty_period_years) :-
    consistent(s73, warranty_period_years),
    (indep(s74), consistent(s74, warranty_period_years) ; \+indep(s74)).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v3)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values easy_low_effort=Nice_and_easy_to_initiate_low_effort unk_turn_initiation_performance=Unknown
% @importance 0.8

0.63::true_val(turn_initiation_performance, easy_low_effort); 0.37::true_val(turn_initiation_performance, unk_turn_initiation_performance).

0.82::acc(s75, turn_initiation_performance).

measured(s75, turn_initiation_performance, easy_low_effort).

all_consistent(turn_initiation_performance) :-
    consistent(s75, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, easy_low_effort)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr reviewer_opinion_snowboardingprofiles_speed
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (speed-dependent)
% @values confident_slow_shy_fast=Confident_decisive_at_slow_speed_shy_hesitant_at_fast unk_reviewer_opinion_snowboardingprofiles_speed=Unknown
% @importance 0.9

0.67::true_val(reviewer_opinion_snowboardingprofiles_speed, confident_slow_shy_fast); 0.33::true_val(reviewer_opinion_snowboardingprofiles_speed, unk_reviewer_opinion_snowboardingprofiles_speed).

0.82::acc(s76, reviewer_opinion_snowboardingprofiles_speed).

measured(s76, reviewer_opinion_snowboardingprofiles_speed, confident_slow_shy_fast).

all_consistent(reviewer_opinion_snowboardingprofiles_speed) :-
    consistent(s76, reviewer_opinion_snowboardingprofiles_speed).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_speed)).
query(true_val(reviewer_opinion_snowboardingprofiles_speed, confident_slow_shy_fast)).
query(true_val(reviewer_opinion_snowboardingprofiles_speed, unk_reviewer_opinion_snowboardingprofiles_speed)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values shy_at_speed=Becomes_shy_hesitant_awkward_past_moderately_fast_speeds unk_negative_aspect=Unknown
% @importance 0.9

0.67::true_val(negative_aspect, shy_at_speed); 0.33::true_val(negative_aspect, unk_negative_aspect).

0.82::acc(s76, negative_aspect).

measured(s76, negative_aspect, shy_at_speed).

all_consistent(negative_aspect) :-
    consistent(s76, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, shy_at_speed)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values nice_at_slow_speed=Nice_feel_on_carve_at_slower_speeds unk_carving_rating_tgr=Unknown
% @importance 0.85

0.67::true_val(carving_rating_tgr, nice_at_slow_speed); 0.33::true_val(carving_rating_tgr, unk_carving_rating_tgr).

0.82::acc(s77, carving_rating_tgr).

measured(s77, carving_rating_tgr, nice_at_slow_speed).

all_consistent(carving_rating_tgr) :-
    consistent(s77, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, nice_at_slow_speed)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr negative_aspect_carving
% @type categorical
% @canonical false
% @original_name negative_aspect (high speed carving)
% @values high_speed_carves_not_great=High_speed_low_angle_carves_not_great unk_negative_aspect_carving=Unknown
% @importance 0.85

0.67::true_val(negative_aspect_carving, high_speed_carves_not_great); 0.33::true_val(negative_aspect_carving, unk_negative_aspect_carving).

0.82::acc(s77, negative_aspect_carving).

measured(s77, negative_aspect_carving, high_speed_carves_not_great).

all_consistent(negative_aspect_carving) :-
    consistent(s77, negative_aspect_carving).

evidence(all_consistent(negative_aspect_carving)).
query(true_val(negative_aspect_carving, high_speed_carves_not_great)).
query(true_val(negative_aspect_carving, unk_negative_aspect_carving)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values significant_chatter=Got_bucked_around_a_lot_of_chatter_in_uneven_terrain unk_chatter_performance=Unknown
% @importance 0.8

0.63::true_val(chatter_performance, significant_chatter); 0.37::true_val(chatter_performance, unk_chatter_performance).

0.80::acc(s78, chatter_performance).

measured(s78, chatter_performance, significant_chatter).

all_consistent(chatter_performance) :-
    consistent(s78, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, significant_chatter)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values great_in_trees=Easy_quick_edge_to_edge_turns_performs_well_in_trees unk_positive_aspect=Unknown
% @importance 0.7

0.63::true_val(positive_aspect, great_in_trees); 0.37::true_val(positive_aspect, unk_positive_aspect).

0.80::acc(s79, positive_aspect).

measured(s79, positive_aspect, great_in_trees).

all_consistent(positive_aspect) :-
    consistent(s79, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, great_in_trees)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (powder performance)
% @values not_great_in_powder=Specs_and_experience_suggest_not_great_in_powder unk_negative_aspect_powder=Unknown
% @importance 0.85

0.60::true_val(negative_aspect_powder, not_great_in_powder); 0.40::true_val(negative_aspect_powder, unk_negative_aspect_powder).

0.78::acc(s80, negative_aspect_powder).

measured(s80, negative_aspect_powder, not_great_in_powder).

all_consistent(negative_aspect_powder) :-
    consistent(s80, negative_aspect_powder).

evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, not_great_in_powder)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values easy_access_limited_total=Easy_to_access_pop_more_limited_total_than_Custom unk_pop=Unknown
% @importance 0.85

0.67::true_val(pop, easy_access_limited_total); 0.33::true_val(pop, unk_pop).

0.82::acc(s81, pop).

measured(s81, pop, easy_access_limited_total).

all_consistent(pop) :-
    consistent(s81, pop).

evidence(all_consistent(pop)).
query(true_val(pop, easy_access_limited_total)).
query(true_val(pop, unk_pop)).

% @attr reviewer_opinion_the_good_ride_jumps
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (jump stability)
% @values stable_small_medium_jumps=Stable_for_small_to_medium_jumps_not_amazing_for_large unk_reviewer_opinion_the_good_ride_jumps=Unknown
% @importance 0.8

0.63::true_val(reviewer_opinion_the_good_ride_jumps, stable_small_medium_jumps); 0.37::true_val(reviewer_opinion_the_good_ride_jumps, unk_reviewer_opinion_the_good_ride_jumps).

0.80::acc(s82, reviewer_opinion_the_good_ride_jumps).

measured(s82, reviewer_opinion_the_good_ride_jumps, stable_small_medium_jumps).

all_consistent(reviewer_opinion_the_good_ride_jumps) :-
    consistent(s82, reviewer_opinion_the_good_ride_jumps).

evidence(all_consistent(reviewer_opinion_the_good_ride_jumps)).
query(true_val(reviewer_opinion_the_good_ride_jumps, stable_small_medium_jumps)).
query(true_val(reviewer_opinion_the_good_ride_jumps, unk_reviewer_opinion_the_good_ride_jumps)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values strong_stays_in_place=Every_time_railed_on_edge_could_feel_it_stay_in_place unk_edge_hold=Unknown
% @importance 0.75

0.60::true_val(edge_hold, strong_stays_in_place); 0.40::true_val(edge_hold, unk_edge_hold).

0.78::acc(s83, edge_hold).

measured(s83, edge_hold, strong_stays_in_place).

all_consistent(edge_hold) :-
    consistent(s83, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, strong_stays_in_place)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr positive_aspect_landings
% @type categorical
% @canonical false
% @original_name positive_aspect (stomp landings)
% @values stomps_landings=Board_wants_to_stomp_landings unk_positive_aspect_landings=Unknown
% @importance 0.7

0.60::true_val(positive_aspect_landings, stomps_landings); 0.40::true_val(positive_aspect_landings, unk_positive_aspect_landings).

0.78::acc(s84, positive_aspect_landings).

measured(s84, positive_aspect_landings, stomps_landings).

all_consistent(positive_aspect_landings) :-
    consistent(s84, positive_aspect_landings).

evidence(all_consistent(positive_aspect_landings)).
query(true_val(positive_aspect_landings, stomps_landings)).
query(true_val(positive_aspect_landings, unk_positive_aspect_landings)).

% @attr negative_aspect_beginners
% @type categorical
% @canonical false
% @original_name negative_aspect (stiff camber, not for beginners)
% @values camber_stiff_not_beginners=Camber_may_feel_stiff_not_suitable_for_beginners unk_negative_aspect_beginners=Unknown
% @importance 0.85

0.63::true_val(negative_aspect_beginners, camber_stiff_not_beginners); 0.37::true_val(negative_aspect_beginners, unk_negative_aspect_beginners).

0.80::acc(s85, negative_aspect_beginners).

measured(s85, negative_aspect_beginners, camber_stiff_not_beginners).

all_consistent(negative_aspect_beginners) :-
    consistent(s85, negative_aspect_beginners).

evidence(all_consistent(negative_aspect_beginners)).
query(true_val(negative_aspect_beginners, camber_stiff_not_beginners)).
query(true_val(negative_aspect_beginners, unk_negative_aspect_beginners)).

% @attr positive_aspect_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect (versatility)
% @values works_everywhere_well=If_you_want_something_that_works_everywhere_well_this_is_it unk_positive_aspect_versatility=Unknown
% @importance 0.75

0.64::true_val(positive_aspect_versatility, works_everywhere_well); 0.36::true_val(positive_aspect_versatility, unk_positive_aspect_versatility).

0.80::acc(s86, positive_aspect_versatility).

measured(s86, positive_aspect_versatility, works_everywhere_well).

all_consistent(positive_aspect_versatility) :-
    consistent(s86, positive_aspect_versatility).

evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, works_everywhere_well)).
query(true_val(positive_aspect_versatility, unk_positive_aspect_versatility)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values gets_around_with_ease=Gets_around_mountain_with_ease_challenge_anyone_to_have_bad_time unk_reviewer_opinion_whitelines=Unknown
% @importance 0.675

0.75::true_val(reviewer_opinion_whitelines, gets_around_with_ease); 0.25::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

0.82::acc(s87, reviewer_opinion_whitelines).
0.82::acc(s88, reviewer_opinion_whitelines).

measured(s87, reviewer_opinion_whitelines, gets_around_with_ease).
measured(s88, reviewer_opinion_whitelines, gets_around_with_ease).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s87, reviewer_opinion_whitelines),
    consistent(s88, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, gets_around_with_ease)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values process_twin_custom_directional=Process_true_twin_vs_Custom_directional_twin unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.62::true_val(comparable_board_same_brand, process_twin_custom_directional); 0.38::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

0.80::acc(s89, comparable_board_same_brand).

measured(s89, comparable_board_same_brand, process_twin_custom_directional).

all_consistent(comparable_board_same_brand) :-
    consistent(s89, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, process_twin_custom_directional)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_flex
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (flex comparison)
% @values custom_stiffer_carbon=Custom_stiffer_6_10_with_carbon_highlights_Process_softer unk_comparable_board_same_brand_flex=Unknown
% @importance 0.75

0.70::true_val(comparable_board_same_brand_flex, custom_stiffer_carbon); 0.30::true_val(comparable_board_same_brand_flex, unk_comparable_board_same_brand_flex).

0.80::acc(s58, comparable_board_same_brand_flex).
0.78::acc(s90, comparable_board_same_brand_flex).

measured(s58, comparable_board_same_brand_flex, custom_stiffer_carbon).
measured(s90, comparable_board_same_brand_flex, custom_stiffer_carbon).

all_consistent(comparable_board_same_brand_flex) :-
    consistent(s58, comparable_board_same_brand_flex),
    consistent(s90, comparable_board_same_brand_flex).

evidence(all_consistent(comparable_board_same_brand_flex)).
query(true_val(comparable_board_same_brand_flex, custom_stiffer_carbon)).
query(true_val(comparable_board_same_brand_flex, unk_comparable_board_same_brand_flex)).

% @attr comparable_board_same_brand_base
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (base comparison)
% @values custom_higher_grade_wfo=Custom_has_higher_grade_WFO_sintered_base unk_comparable_board_same_brand_base=Unknown
% @importance 0.7

0.59::true_val(comparable_board_same_brand_base, custom_higher_grade_wfo); 0.41::true_val(comparable_board_same_brand_base, unk_comparable_board_same_brand_base).

0.78::acc(s91, comparable_board_same_brand_base).

measured(s91, comparable_board_same_brand_base, custom_higher_grade_wfo).

all_consistent(comparable_board_same_brand_base) :-
    consistent(s91, comparable_board_same_brand_base).

evidence(all_consistent(comparable_board_same_brand_base)).
query(true_val(comparable_board_same_brand_base, custom_higher_grade_wfo)).
query(true_val(comparable_board_same_brand_base, unk_comparable_board_same_brand_base)).

% @attr comparable_board_same_brand_terrain
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (terrain orientation)
% @values process_park_custom_all_mountain=Process_more_park_Custom_more_all_mountain unk_comparable_board_same_brand_terrain=Unknown
% @importance 0.8

0.38::true_val(comparable_board_same_brand_terrain, process_park_custom_all_mountain); 0.62::true_val(comparable_board_same_brand_terrain, unk_comparable_board_same_brand_terrain).

0.65::acc(s92, comparable_board_same_brand_terrain).

measured(s92, comparable_board_same_brand_terrain, process_park_custom_all_mountain).

all_consistent(comparable_board_same_brand_terrain) :-
    consistent(s92, comparable_board_same_brand_terrain).

evidence(all_consistent(comparable_board_same_brand_terrain)).
query(true_val(comparable_board_same_brand_terrain, process_park_custom_all_mountain)).
query(true_val(comparable_board_same_brand_terrain, unk_comparable_board_same_brand_terrain)).

% @attr comparable_board_same_brand_resort
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (resort type)
% @values custom_bigger_steeper_process_smaller_flatter=Custom_bigger_steeper_Process_more_fun_smaller_flatter unk_comparable_board_same_brand_resort=Unknown
% @importance 0.8

0.59::true_val(comparable_board_same_brand_resort, custom_bigger_steeper_process_smaller_flatter); 0.41::true_val(comparable_board_same_brand_resort, unk_comparable_board_same_brand_resort).

0.78::acc(s93, comparable_board_same_brand_resort).

measured(s93, comparable_board_same_brand_resort, custom_bigger_steeper_process_smaller_flatter).

all_consistent(comparable_board_same_brand_resort) :-
    consistent(s93, comparable_board_same_brand_resort).

evidence(all_consistent(comparable_board_same_brand_resort)).
query(true_val(comparable_board_same_brand_resort, custom_bigger_steeper_process_smaller_flatter)).
query(true_val(comparable_board_same_brand_resort, unk_comparable_board_same_brand_resort)).

% @attr comparable_board_same_brand_flying_v
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Flying V variant)
% @values process_flying_v=Process_Flying_V_same_shape_rocker_camber_hybrid_softer unk_comparable_board_same_brand_flying_v=Unknown
% @importance 0.75

0.72::true_val(comparable_board_same_brand_flying_v, process_flying_v); 0.28::true_val(comparable_board_same_brand_flying_v, unk_comparable_board_same_brand_flying_v).

0.85::acc(s94, comparable_board_same_brand_flying_v).

measured(s94, comparable_board_same_brand_flying_v, process_flying_v).

all_consistent(comparable_board_same_brand_flying_v) :-
    consistent(s94, comparable_board_same_brand_flying_v).

evidence(all_consistent(comparable_board_same_brand_flying_v)).
query(true_val(comparable_board_same_brand_flying_v, process_flying_v)).
query(true_val(comparable_board_same_brand_flying_v, unk_comparable_board_same_brand_flying_v)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values bataleon_goliath_evil_twin=Bataleon_Goliath_Bataleon_Evil_Twin unk_comparable_board_cross_brand=Unknown
% @importance 0.7

0.32::true_val(comparable_board_cross_brand, bataleon_goliath_evil_twin); 0.68::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

0.60::acc(s95, comparable_board_cross_brand).

measured(s95, comparable_board_cross_brand, bataleon_goliath_evil_twin).

all_consistent(comparable_board_cross_brand) :-
    consistent(s95, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, bataleon_goliath_evil_twin)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_mainstream
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (mainstream competitors)
% @values capita_salomon_jones=CAPiTA_Super_DOA_Salomon_Assassin_Jones_Frontier unk_comparable_board_cross_brand_mainstream=Unknown
% @importance 0.7

0.49::true_val(comparable_board_cross_brand_mainstream, capita_salomon_jones); 0.51::true_val(comparable_board_cross_brand_mainstream, unk_comparable_board_cross_brand_mainstream).

0.68::acc(s96, comparable_board_cross_brand_mainstream).

measured(s96, comparable_board_cross_brand_mainstream, capita_salomon_jones).

all_consistent(comparable_board_cross_brand_mainstream) :-
    consistent(s96, comparable_board_cross_brand_mainstream).

evidence(all_consistent(comparable_board_cross_brand_mainstream)).
query(true_val(comparable_board_cross_brand_mainstream, capita_salomon_jones)).
query(true_val(comparable_board_cross_brand_mainstream, unk_comparable_board_cross_brand_mainstream)).

% @attr retailer_burton_com
% @type categorical
% @canonical false
% @original_name Burton.com retailer info
% @values official_store_3yr_warranty=Official_manufacturer_store_high_reputation_3yr_warranty unk_retailer_burton_com=Unknown
% @importance 0.85

0.81::true_val(retailer_burton_com, official_store_3yr_warranty); 0.19::true_val(retailer_burton_com, unk_retailer_burton_com).

0.85::acc(s73, retailer_burton_com).

measured(s73, retailer_burton_com, official_store_3yr_warranty).

all_consistent(retailer_burton_com) :-
    consistent(s73, retailer_burton_com).

evidence(all_consistent(retailer_burton_com)).
query(true_val(retailer_burton_com, official_store_3yr_warranty)).
query(true_val(retailer_burton_com, unk_retailer_burton_com)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name evo.com retailer info
% @values major_us_price_guarantee_returns=Major_US_retailer_lowest_price_guarantee_1yr_returns unk_retailer_evo=Unknown
% @importance 0.6

0.72::true_val(retailer_evo, major_us_price_guarantee_returns); 0.28::true_val(retailer_evo, unk_retailer_evo).

0.85::acc(s97, retailer_evo).

measured(s97, retailer_evo, major_us_price_guarantee_returns).

all_consistent(retailer_evo) :-
    consistent(s97, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_us_price_guarantee_returns)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_rei
% @type categorical
% @canonical false
% @original_name REI Co-op retailer info
% @values major_us_coop_trusted=Major_US_outdoor_coop_trusted_with_expert_staff unk_retailer_rei=Unknown
% @importance 0.8

0.72::true_val(retailer_rei, major_us_coop_trusted); 0.28::true_val(retailer_rei, unk_retailer_rei).

0.82::acc(s26, retailer_rei).

measured(s26, retailer_rei, major_us_coop_trusted).

all_consistent(retailer_rei) :-
    consistent(s26, retailer_rei).

evidence(all_consistent(retailer_rei)).
query(true_val(retailer_rei, major_us_coop_trusted)).
query(true_val(retailer_rei, unk_retailer_rei)).

% @attr retailer_snowboard_asylum
% @type categorical
% @canonical false
% @original_name Snowboard Asylum (UK) retailer info
% @values specialist_uk_retailer=Specialist_UK_snowboard_retailer_available_1_store unk_retailer_snowboard_asylum=Unknown
% @importance 0.9

0.76::true_val(retailer_snowboard_asylum, specialist_uk_retailer); 0.24::true_val(retailer_snowboard_asylum, unk_retailer_snowboard_asylum).

0.85::acc(s23, retailer_snowboard_asylum).

measured(s23, retailer_snowboard_asylum, specialist_uk_retailer).

all_consistent(retailer_snowboard_asylum) :-
    consistent(s23, retailer_snowboard_asylum).

evidence(all_consistent(retailer_snowboard_asylum)).
query(true_val(retailer_snowboard_asylum, specialist_uk_retailer)).
query(true_val(retailer_snowboard_asylum, unk_retailer_snowboard_asylum)).

% @attr retailer_ski_monster
% @type categorical
% @canonical false
% @original_name The Ski Monster retailer info
% @values expert_curated_firsthand_testing=Expert_curated_US_shop_firsthand_testing unk_retailer_ski_monster=Unknown
% @importance 0.45

0.53::true_val(retailer_ski_monster, expert_curated_firsthand_testing); 0.47::true_val(retailer_ski_monster, unk_retailer_ski_monster).

0.72::acc(s98, retailer_ski_monster).

measured(s98, retailer_ski_monster, expert_curated_firsthand_testing).

all_consistent(retailer_ski_monster) :-
    consistent(s98, retailer_ski_monster).

evidence(all_consistent(retailer_ski_monster)).
query(true_val(retailer_ski_monster, expert_curated_firsthand_testing)).
query(true_val(retailer_ski_monster, unk_retailer_ski_monster)).

% @attr retailer_twelve_board
% @type categorical
% @canonical false
% @original_name Twelve Board Store retailer info
% @values melbourne_official_burton_stockist=Melbournes_official_Burton_stockist unk_retailer_twelve_board=Unknown
% @importance 0.6

0.60::true_val(retailer_twelve_board, melbourne_official_burton_stockist); 0.40::true_val(retailer_twelve_board, unk_retailer_twelve_board).

0.75::acc(s99, retailer_twelve_board).

measured(s99, retailer_twelve_board, melbourne_official_burton_stockist).

all_consistent(retailer_twelve_board) :-
    consistent(s99, retailer_twelve_board).

evidence(all_consistent(retailer_twelve_board)).
query(true_val(retailer_twelve_board, melbourne_official_burton_stockist)).
query(true_val(retailer_twelve_board, unk_retailer_twelve_board)).

% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre retailer info
% @values independent_australian_retailer=Independent_Australian_retailer unk_retailer_melbourne_snowboard=Unknown
% @importance 0.6

0.52::true_val(retailer_melbourne_snowboard, independent_australian_retailer); 0.48::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).

0.72::acc(s100, retailer_melbourne_snowboard).

measured(s100, retailer_melbourne_snowboard, independent_australian_retailer).

all_consistent(retailer_melbourne_snowboard) :-
    consistent(s100, retailer_melbourne_snowboard).

evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, independent_australian_retailer)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

% @attr purepop_introduction_year
% @type numeric
% @canonical false
% @original_name The Burton Process Camber first appeared with PurePop Camber starting in 2019
% @unit year
% @values v2019=2019 unk_purepop_introduction_year=Unknown
% @importance 0.5

0.51::true_val(purepop_introduction_year, v2019); 0.49::true_val(purepop_introduction_year, unk_purepop_introduction_year).

0.70::acc(s101, purepop_introduction_year).

measured(s101, purepop_introduction_year, v2019).

all_consistent(purepop_introduction_year) :-
    consistent(s101, purepop_introduction_year).

evidence(all_consistent(purepop_introduction_year)).
query(true_val(purepop_introduction_year, v2019)).
query(true_val(purepop_introduction_year, unk_purepop_introduction_year)).

% @attr model_first_available_year_review
% @type categorical
% @canonical false
% @original_name model_first_available_year (Good Ride review 2011-2018)
% @values reviewed_2011_2018=Reviewed_with_2011_to_2018_designation_by_The_Good_Ride unk_model_first_available_year_review=Unknown
% @importance 0.5

0.51::true_val(model_first_available_year_review, reviewed_2011_2018); 0.49::true_val(model_first_available_year_review, unk_model_first_available_year_review).

0.70::acc(s10, model_first_available_year_review).

measured(s10, model_first_available_year_review, reviewed_2011_2018).

all_consistent(model_first_available_year_review) :-
    consistent(s10, model_first_available_year_review).

evidence(all_consistent(model_first_available_year_review)).
query(true_val(model_first_available_year_review, reviewed_2011_2018)).
query(true_val(model_first_available_year_review, unk_model_first_available_year_review)).

% @attr process_flying_v_variant
% @type categorical
% @canonical false
% @original_name Burton Process also exists as Process Flying V variant
% @values flying_v_variant_exists=Process_Flying_V_with_different_rocker_camber_blend unk_process_flying_v_variant=Unknown
% @importance 0.75

0.72::true_val(process_flying_v_variant, flying_v_variant_exists); 0.28::true_val(process_flying_v_variant, unk_process_flying_v_variant).

0.85::acc(s94, process_flying_v_variant).

measured(s94, process_flying_v_variant, flying_v_variant_exists).

all_consistent(process_flying_v_variant) :-
    consistent(s94, process_flying_v_variant).

evidence(all_consistent(process_flying_v_variant)).
query(true_val(process_flying_v_variant, flying_v_variant_exists)).
query(true_val(process_flying_v_variant, unk_process_flying_v_variant)).

% @attr process_off_axis_variant
% @type categorical
% @canonical false
% @original_name Burton Process Off-Axis was a variant
% @values off_axis_asymmetric_frostbite=Off_Axis_variant_with_asymmetric_Frostbite_edge_placement unk_process_off_axis_variant=Unknown
% @importance 0.35

0.64::true_val(process_off_axis_variant, off_axis_asymmetric_frostbite); 0.36::true_val(process_off_axis_variant, unk_process_off_axis_variant).

0.78::acc(s102, process_off_axis_variant).

measured(s102, process_off_axis_variant, off_axis_asymmetric_frostbite).

all_consistent(process_off_axis_variant) :-
    consistent(s102, process_off_axis_variant).

evidence(all_consistent(process_off_axis_variant)).
query(true_val(process_off_axis_variant, off_axis_asymmetric_frostbite)).
query(true_val(process_off_axis_variant, unk_process_off_axis_variant)).

% @attr comparable_board_same_brand_limited
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (limited editions)
% @values run_dmc_mystery=Burton_x_Run_DMC_Process_Limited_and_Process_Mystery unk_comparable_board_same_brand_limited=Unknown
% @importance 0.325

0.60::true_val(comparable_board_same_brand_limited, run_dmc_mystery); 0.40::true_val(comparable_board_same_brand_limited, unk_comparable_board_same_brand_limited).

0.72::acc(s103, comparable_board_same_brand_limited).
0.85::acc(s104, comparable_board_same_brand_limited).

measured(s103, comparable_board_same_brand_limited, run_dmc_mystery).
measured(s104, comparable_board_same_brand_limited, run_dmc_mystery).

all_consistent(comparable_board_same_brand_limited) :-
    consistent(s103, comparable_board_same_brand_limited),
    consistent(s104, comparable_board_same_brand_limited).

evidence(all_consistent(comparable_board_same_brand_limited)).
query(true_val(comparable_board_same_brand_limited, run_dmc_mystery)).
query(true_val(comparable_board_same_brand_limited, unk_comparable_board_same_brand_limited)).

% @attr flying_v_new_size_2025
% @type categorical
% @canonical false
% @original_name The 2025 Flying V introduced a new 155W size
% @values new_155w_size=155W_new_size_introduced_for_2025 unk_flying_v_new_size_2025=Unknown
% @importance 0.4

0.60::true_val(flying_v_new_size_2025, new_155w_size); 0.40::true_val(flying_v_new_size_2025, unk_flying_v_new_size_2025).

0.75::acc(s105, flying_v_new_size_2025).

measured(s105, flying_v_new_size_2025, new_155w_size).

all_consistent(flying_v_new_size_2025) :-
    consistent(s105, flying_v_new_size_2025).

evidence(all_consistent(flying_v_new_size_2025)).
query(true_val(flying_v_new_size_2025, new_155w_size)).
query(true_val(flying_v_new_size_2025, unk_flying_v_new_size_2025)).