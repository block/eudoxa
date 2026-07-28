0.15::indep(s_merch).
0.25::indep(s19).
0.25::indep(s33).
0.25::indep(s52).
0.25::indep(s58).
0.20::indep(s26).
0.20::indep(s105).
0.15::indep(s34).
0.15::indep(s9).
0.15::indep(s38).
0.15::indep(s5).
0.15::indep(s41).
0.15::indep(s27).
0.15::indep(s94).
0.15::indep(s97).
0.15::indep(s37).
0.15::indep(s30).
0.15::indep(s100).
0.15::indep(s101).
0.80::indep(s72).
0.75::indep(s73).
0.80::indep(s102).
0.80::indep(s111).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 1.0

0.95::acc(s1, brand).
0.95::true_val(brand, lib_tech); 0.05::true_val(brand, unk_brand).
measured(s1, brand, lib_tech).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values t_rice_orca_ii=T.Rice_Orca_II unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).
0.95::true_val(model_name, t_rice_orca_ii); 0.05::true_val(model_name, unk_model_name).
measured(s1, model_name, t_rice_orca_ii).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, t_rice_orca_ii)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027_2626_2627_Early_Release unk_model_year=Unknown
% @importance 1.0

0.95::acc(s1, model_year).
0.95::true_val(model_year, y2027); 0.05::true_val(model_year, unk_model_year).
measured(s1, model_year, y2027).
all_consistent(model_year) :- consistent(s1, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.7

0.88::acc(s24, manufacturer).
0.90::true_val(manufacturer, mervin_manufacturing); 0.10::true_val(manufacturer, unk_manufacturer).
measured(s24, manufacturer, mervin_manufacturing).
all_consistent(manufacturer) :- consistent(s24, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values sequim_wa_usa=Sequim_Washington_USA unk_manufacturing_location=Unknown
% @importance 0.85

0.88::acc(s24, manufacturing_location).
0.85::acc(s72, manufacturing_location).
0.95::true_val(manufacturing_location, sequim_wa_usa); 0.05::true_val(manufacturing_location, unk_manufacturing_location).
measured(s24, manufacturing_location, sequim_wa_usa).
measured(s72, manufacturing_location, sequim_wa_usa).
all_consistent(manufacturing_location) :-
    consistent(s24, manufacturing_location),
    (indep(s72), consistent(s72, manufacturing_location) ; \+indep(s72)).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, sequim_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_hazardous_waste=Hand_made_Mervin_Factory_zero_hazardous_waste unk_sustainability_certification=Unknown
% @importance 0.75

0.85::acc(s33, sustainability_certification).
0.92::true_val(sustainability_certification, zero_hazardous_waste); 0.08::true_val(sustainability_certification, unk_sustainability_certification).
measured(s33, sustainability_certification, zero_hazardous_waste).
all_consistent(sustainability_certification) :-
    (indep(s33), consistent(s33, sustainability_certification) ; \+indep(s33)).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_hazardous_waste)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr factory_description
% @type categorical
% @canonical false
% @original_name Factory description
% @values over_60k_sqft_sequim_since_1995=Over_60000_sqft_Sequim_industrial_park_since_1995 unk_factory_description=Unknown
% @importance 0.55

0.85::acc(s76, factory_description).
0.88::true_val(factory_description, over_60k_sqft_sequim_since_1995); 0.12::true_val(factory_description, unk_factory_description).
measured(s76, factory_description, over_60k_sqft_sequim_since_1995).
all_consistent(factory_description) :- consistent(s76, factory_description).
evidence(all_consistent(factory_description)).
query(true_val(factory_description, over_60k_sqft_sequim_since_1995)).
query(true_val(factory_description, unk_factory_description)).

% @attr manufacturer_status
% @type categorical
% @canonical false
% @original_name Manufacturer status
% @values longest_running_last_major_usa=Longest_running_last_major_board_factory_USA unk_manufacturer_status=Unknown
% @importance 0.7

0.85::acc(s72, manufacturer_status).
0.88::true_val(manufacturer_status, longest_running_last_major_usa); 0.12::true_val(manufacturer_status, unk_manufacturer_status).
measured(s72, manufacturer_status, longest_running_last_major_usa).
all_consistent(manufacturer_status) :-
    (indep(s72), consistent(s72, manufacturer_status) ; \+indep(s72)).
evidence(all_consistent(manufacturer_status)).
query(true_val(manufacturer_status, longest_running_last_major_usa)).
query(true_val(manufacturer_status, unk_manufacturer_status)).

% @attr manufacturer_ownership
% @type categorical
% @canonical false
% @original_name Manufacturer ownership
% @values spring_capital_group=Acquired_by_Spring_Capital_Group_Eugene_Oregon_April_2026 unk_manufacturer_ownership=Unknown
% @importance 0.5

0.82::acc(s75, manufacturer_ownership).
0.84::true_val(manufacturer_ownership, spring_capital_group); 0.16::true_val(manufacturer_ownership, unk_manufacturer_ownership).
measured(s75, manufacturer_ownership, spring_capital_group).
all_consistent(manufacturer_ownership) :- consistent(s75, manufacturer_ownership).
evidence(all_consistent(manufacturer_ownership)).
query(true_val(manufacturer_ownership, spring_capital_group)).
query(true_val(manufacturer_ownership, unk_manufacturer_ownership)).

% @attr prior_ownership
% @type categorical
% @canonical false
% @original_name Prior ownership
% @values quiksilver_1997_altamont_2013=Sold_Quiksilver_1997_then_Altamont_Capital_2013 unk_prior_ownership=Unknown
% @importance 0.4

0.78::acc(s74, prior_ownership).
0.80::true_val(prior_ownership, quiksilver_1997_altamont_2013); 0.20::true_val(prior_ownership, unk_prior_ownership).
measured(s74, prior_ownership, quiksilver_1997_altamont_2013).
all_consistent(prior_ownership) :- consistent(s74, prior_ownership).
evidence(all_consistent(prior_ownership)).
query(true_val(prior_ownership, quiksilver_1997_altamont_2013)).
query(true_val(prior_ownership, unk_prior_ownership)).

% @attr annual_production
% @type numeric
% @canonical false
% @original_name Annual production
% @unit units
% @values v100000=100000 unk_annual_production=Unknown
% @importance 0.55

0.85::acc(s76, annual_production).
0.88::true_val(annual_production, v100000); 0.12::true_val(annual_production, unk_annual_production).
measured(s76, annual_production, v100000).
all_consistent(annual_production) :- consistent(s76, annual_production).
evidence(all_consistent(annual_production)).
query(true_val(annual_production, v100000)).
query(true_val(annual_production, unk_annual_production)).

% @attr us_market_share
% @type numeric
% @canonical false
% @original_name US market share
% @unit percent
% @values v23=23.0 unk_us_market_share=Unknown
% @importance 0.55

0.85::acc(s76, us_market_share).
0.88::true_val(us_market_share, v23); 0.12::true_val(us_market_share, unk_us_market_share).
measured(s76, us_market_share, v23).
all_consistent(us_market_share) :- consistent(s76, us_market_share).
evidence(all_consistent(us_market_share)).
query(true_val(us_market_share, v23)).
query(true_val(us_market_share, unk_us_market_share)).

% @attr co_founders
% @type categorical
% @canonical false
% @original_name Co-founders
% @values olson_saari=Mike_Olson_Pete_Saari unk_co_founders=Unknown
% @importance 0.45

0.82::acc(s73, co_founders).
0.82::true_val(co_founders, olson_saari); 0.18::true_val(co_founders, unk_co_founders).
measured(s73, co_founders, olson_saari).
all_consistent(co_founders) :-
    (indep(s73), consistent(s73, co_founders) ; \+indep(s73)).
evidence(all_consistent(co_founders)).
query(true_val(co_founders, olson_saari)).
query(true_val(co_founders, unk_co_founders)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values travis_rice=Travis_Rice unk_pro_rider_name=Unknown
% @importance 1.0

0.95::acc(s1, pro_rider_name).
0.95::true_val(pro_rider_name, travis_rice); 0.05::true_val(pro_rider_name, unk_pro_rider_name).
measured(s1, pro_rider_name, travis_rice).
all_consistent(pro_rider_name) :- consistent(s1, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, travis_rice)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values dulk=DULK unk_graphic_designer_artist=Unknown
% @importance 1.0

0.93::acc(s1, graphic_designer_artist).
0.92::true_val(graphic_designer_artist, dulk); 0.08::true_val(graphic_designer_artist, unk_graphic_designer_artist).
measured(s1, graphic_designer_artist, dulk).
all_consistent(graphic_designer_artist) :- consistent(s1, graphic_designer_artist).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, dulk)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

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

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2018_2019=2018_for_2018_2019_season unk_model_first_available_year=Unknown
% @importance 0.6

0.88::acc(s45, model_first_available_year).
0.87::true_val(model_first_available_year, y2018_2019); 0.13::true_val(model_first_available_year, unk_model_first_available_year).
measured(s45, model_first_available_year, y2018_2019).
all_consistent(model_first_available_year) :- consistent(s45, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2018_2019)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr original_orca_initial_release
% @type categorical
% @canonical false
% @original_name Original Orca initial release
% @values only_153cm=Available_only_in_153cm_at_launch unk_original_orca_initial_release=Unknown
% @importance 0.4

0.82::acc(s48, original_orca_initial_release).
0.82::true_val(original_orca_initial_release, only_153cm); 0.18::true_val(original_orca_initial_release, unk_original_orca_initial_release).
measured(s48, original_orca_initial_release, only_153cm).
all_consistent(original_orca_initial_release) :- consistent(s48, original_orca_initial_release).
evidence(all_consistent(original_orca_initial_release)).
query(true_val(original_orca_initial_release, only_153cm)).
query(true_val(original_orca_initial_release, unk_original_orca_initial_release)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values feb_12_2026=February_12_2026 unk_estimated_availability_date=Unknown
% @importance 0.6

0.93::acc(s21, estimated_availability_date).
0.93::true_val(estimated_availability_date, feb_12_2026); 0.07::true_val(estimated_availability_date, unk_estimated_availability_date).
measured(s21, estimated_availability_date, feb_12_2026).
all_consistent(estimated_availability_date) :- consistent(s21, estimated_availability_date).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, feb_12_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr estimated_availability_date_early
% @type categorical
% @canonical false
% @original_name Orca II arrived seven months ahead of schedule
% @values seven_months_early=Arrived_shops_seven_months_ahead_of_schedule unk_estimated_availability_date_early=Unknown
% @importance 0.9

0.85::acc(s65, estimated_availability_date_early).
0.84::true_val(estimated_availability_date_early, seven_months_early); 0.16::true_val(estimated_availability_date_early, unk_estimated_availability_date_early).
measured(s65, estimated_availability_date_early, seven_months_early).
all_consistent(estimated_availability_date_early) :- consistent(s65, estimated_availability_date_early).
evidence(all_consistent(estimated_availability_date_early)).
query(true_val(estimated_availability_date_early, seven_months_early)).
query(true_val(estimated_availability_date_early, unk_estimated_availability_date_early)).

% @attr orca_ii_tradeshow_test
% @type categorical
% @canonical false
% @original_name Orca II tested at EWSRA on-snow tradeshow
% @values stratton_vt_feb_2026=Tested_EWSRA_Stratton_Vermont_Feb_3_4_2026 unk_orca_ii_tradeshow_test=Unknown
% @importance 0.85

0.85::acc(s42, orca_ii_tradeshow_test).
0.83::true_val(orca_ii_tradeshow_test, stratton_vt_feb_2026); 0.17::true_val(orca_ii_tradeshow_test, unk_orca_ii_tradeshow_test).
measured(s42, orca_ii_tradeshow_test, stratton_vt_feb_2026).
all_consistent(orca_ii_tradeshow_test) :- consistent(s42, orca_ii_tradeshow_test).
evidence(all_consistent(orca_ii_tradeshow_test)).
query(true_val(orca_ii_tradeshow_test, stratton_vt_feb_2026)).
query(true_val(orca_ii_tradeshow_test, unk_orca_ii_tradeshow_test)).

% @attr orca_volume_shift_impact
% @type categorical
% @canonical false
% @original_name Orca changed how riders thought about volume-shifted shapes
% @values changed_volume_shift_thinking=Changed_how_riders_thought_about_volume_shifted_shapes unk_orca_volume_shift_impact=Unknown
% @importance 0.45

0.72::acc(s27, orca_volume_shift_impact).
0.70::true_val(orca_volume_shift_impact, changed_volume_shift_thinking); 0.30::true_val(orca_volume_shift_impact, unk_orca_volume_shift_impact).
measured(s27, orca_volume_shift_impact, changed_volume_shift_thinking).
all_consistent(orca_volume_shift_impact) :-
    (indep(s27), consistent(s27, orca_volume_shift_impact) ; \+indep(s27)).
evidence(all_consistent(orca_volume_shift_impact)).
query(true_val(orca_volume_shift_impact, changed_volume_shift_thinking)).
query(true_val(orca_volume_shift_impact, unk_orca_volume_shift_impact)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values orca_2019_2026=Lib_Tech_T_Rice_Orca_2019_2026 unk_predecessor_model_name=Unknown
% @importance 0.65

0.82::acc(s49, predecessor_model_name).
0.82::true_val(predecessor_model_name, orca_2019_2026); 0.18::true_val(predecessor_model_name, unk_predecessor_model_name).
measured(s49, predecessor_model_name, orca_2019_2026).
all_consistent(predecessor_model_name) :- consistent(s49, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, orca_2019_2026)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v749_99=749.99 unk_price_usd_msrp=Unknown
% @importance 0.925

0.95::acc(s1, price_usd_msrp).
0.88::acc(s13, price_usd_msrp).
0.95::true_val(price_usd_msrp, v749_99); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).
measured(s1, price_usd_msrp, v749_99).
measured(s13, price_usd_msrp, v749_99).
all_consistent(price_usd_msrp) :-
    consistent(s1, price_usd_msrp),
    consistent(s13, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v749_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v1199_99=1199.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::acc(s_merch, price_aud_merchant).
0.93::true_val(price_aud_merchant, v1199_99); 0.07::true_val(price_aud_merchant, unk_price_aud_merchant).
measured(s_merch, price_aud_merchant, v1199_99).
all_consistent(price_aud_merchant) :-
    (indep(s_merch), consistent(s_merch, price_aud_merchant) ; \+indep(s_merch)).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1199_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_cad_prfo
% @type numeric
% @canonical true
% @original_name price_cad_prfo
% @unit CAD
% @values v959_99=959.99 unk_price_cad_prfo=Unknown
% @importance 0.7

0.80::acc(s100, price_cad_prfo).
0.80::true_val(price_cad_prfo, v959_99); 0.20::true_val(price_cad_prfo, unk_price_cad_prfo).
measured(s100, price_cad_prfo, v959_99).
all_consistent(price_cad_prfo) :-
    (indep(s100), consistent(s100, price_cad_prfo) ; \+indep(s100)).
evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v959_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr previous_model_price_usd
% @type numeric
% @canonical false
% @original_name Previous model price (USD, original Orca 2026)
% @unit USD
% @values v699_99=699.99 unk_previous_model_price_usd=Unknown
% @importance 0.7

0.85::acc(s58, previous_model_price_usd).
0.85::true_val(previous_model_price_usd, v699_99); 0.15::true_val(previous_model_price_usd, unk_previous_model_price_usd).
measured(s58, previous_model_price_usd, v699_99).
all_consistent(previous_model_price_usd) :-
    (indep(s58), consistent(s58, previous_model_price_usd) ; \+indep(s58)).
evidence(all_consistent(previous_model_price_usd)).
query(true_val(previous_model_price_usd, v699_99)).
query(true_val(previous_model_price_usd, unk_previous_model_price_usd)).

% @attr golden_orca_price_usd
% @type numeric
% @canonical false
% @original_name Golden Orca variant price (USD)
% @unit USD
% @values v849_99=849.99 unk_golden_orca_price_usd=Unknown
% @importance 0.85

0.90::acc(s13, golden_orca_price_usd).
0.90::true_val(golden_orca_price_usd, v849_99); 0.10::true_val(golden_orca_price_usd, unk_golden_orca_price_usd).
measured(s13, golden_orca_price_usd, v849_99).
all_consistent(golden_orca_price_usd) :- consistent(s13, golden_orca_price_usd).
evidence(all_consistent(golden_orca_price_usd)).
query(true_val(golden_orca_price_usd, v849_99)).
query(true_val(golden_orca_price_usd, unk_golden_orca_price_usd)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock_evo=In_stock_at_evo_com unk_availability_status=Unknown
% @importance 0.75

0.85::acc(s33, availability_status).
0.90::true_val(availability_status, in_stock_evo); 0.10::true_val(availability_status, unk_availability_status).
measured(s33, availability_status, in_stock_evo).
all_consistent(availability_status) :-
    (indep(s33), consistent(s33, availability_status) ; \+indep(s33)).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_evo)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_empire
% @type categorical
% @canonical false
% @original_name availability_status (EMPIRE)
% @values in_stock_empire=In_stock_EMPIRE unk_availability_status_empire=Unknown
% @importance 0.4

0.78::acc(s41, availability_status_empire).
0.78::true_val(availability_status_empire, in_stock_empire); 0.22::true_val(availability_status_empire, unk_availability_status_empire).
measured(s41, availability_status_empire, in_stock_empire).
all_consistent(availability_status_empire) :-
    (indep(s41), consistent(s41, availability_status_empire) ; \+indep(s41)).
evidence(all_consistent(availability_status_empire)).
query(true_val(availability_status_empire, in_stock_empire)).
query(true_val(availability_status_empire, unk_availability_status_empire)).

% @attr availability_status_ballistyx
% @type categorical
% @canonical false
% @original_name availability_status (Ballistyx Australia preorder)
% @values preorder_ballistyx=Preorder_Ballistyx_limited unk_availability_status_ballistyx=Unknown
% @importance 0.5

0.78::acc(s94, availability_status_ballistyx).
0.78::true_val(availability_status_ballistyx, preorder_ballistyx); 0.22::true_val(availability_status_ballistyx, unk_availability_status_ballistyx).
measured(s94, availability_status_ballistyx, preorder_ballistyx).
all_consistent(availability_status_ballistyx) :-
    (indep(s94), consistent(s94, availability_status_ballistyx) ; \+indep(s94)).
evidence(all_consistent(availability_status_ballistyx)).
query(true_val(availability_status_ballistyx, preorder_ballistyx)).
query(true_val(availability_status_ballistyx, unk_availability_status_ballistyx)).

% @attr availability_status_balmoral
% @type categorical
% @canonical false
% @original_name availability_status (Balmoral Boards Australia preorder)
% @values preorder_balmoral=Preorder_Balmoral_Apr_May_2026 unk_availability_status_balmoral=Unknown
% @importance 0.5

0.75::acc(s97, availability_status_balmoral).
0.75::true_val(availability_status_balmoral, preorder_balmoral); 0.25::true_val(availability_status_balmoral, unk_availability_status_balmoral).
measured(s97, availability_status_balmoral, preorder_balmoral).
all_consistent(availability_status_balmoral) :-
    (indep(s97), consistent(s97, availability_status_balmoral) ; \+indep(s97)).
evidence(all_consistent(availability_status_balmoral)).
query(true_val(availability_status_balmoral, preorder_balmoral)).
query(true_val(availability_status_balmoral, unk_availability_status_balmoral)).

% @attr availability_status_boardhouse
% @type categorical
% @canonical false
% @original_name availability_status (Boardhouse NZ preorder)
% @values preorder_boardhouse=Preorder_Boardhouse_NZ unk_availability_status_boardhouse=Unknown
% @importance 0.3

0.70::acc(s37, availability_status_boardhouse).
0.70::true_val(availability_status_boardhouse, preorder_boardhouse); 0.30::true_val(availability_status_boardhouse, unk_availability_status_boardhouse).
measured(s37, availability_status_boardhouse, preorder_boardhouse).
all_consistent(availability_status_boardhouse) :-
    (indep(s37), consistent(s37, availability_status_boardhouse) ; \+indep(s37)).
evidence(all_consistent(availability_status_boardhouse)).
query(true_val(availability_status_boardhouse, preorder_boardhouse)).
query(true_val(availability_status_boardhouse, unk_availability_status_boardhouse)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values available_blauer=Available_Blauer_Board_Shop unk_availability_status_blauer=Unknown
% @importance 0.8

0.80::acc(s34, availability_status_blauer).
0.80::true_val(availability_status_blauer, available_blauer); 0.20::true_val(availability_status_blauer, unk_availability_status_blauer).
measured(s34, availability_status_blauer, available_blauer).
all_consistent(availability_status_blauer) :-
    (indep(s34), consistent(s34, availability_status_blauer) ; \+indep(s34)).
evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, available_blauer)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_darkside
% @type categorical
% @canonical false
% @original_name availability_status (Darkside Snowboards)
% @values available_darkside=Available_Darkside_Snowboards unk_availability_status_darkside=Unknown
% @importance 0.35

0.72::acc(s9, availability_status_darkside).
0.72::true_val(availability_status_darkside, available_darkside); 0.28::true_val(availability_status_darkside, unk_availability_status_darkside).
measured(s9, availability_status_darkside, available_darkside).
all_consistent(availability_status_darkside) :-
    (indep(s9), consistent(s9, availability_status_darkside) ; \+indep(s9)).
evidence(all_consistent(availability_status_darkside)).
query(true_val(availability_status_darkside, available_darkside)).
query(true_val(availability_status_darkside, unk_availability_status_darkside)).

% @attr availability_status_rudeboys
% @type categorical
% @canonical false
% @original_name availability_status (Rude Boys Banff)
% @values available_rudeboys=Available_Rude_Boys_Banff unk_availability_status_rudeboys=Unknown
% @importance 0.4

0.70::acc(s5, availability_status_rudeboys).
0.70::true_val(availability_status_rudeboys, available_rudeboys); 0.30::true_val(availability_status_rudeboys, unk_availability_status_rudeboys).
measured(s5, availability_status_rudeboys, available_rudeboys).
all_consistent(availability_status_rudeboys) :-
    (indep(s5), consistent(s5, availability_status_rudeboys) ; \+indep(s5)).
evidence(all_consistent(availability_status_rudeboys)).
query(true_val(availability_status_rudeboys, available_rudeboys)).
query(true_val(availability_status_rudeboys, unk_availability_status_rudeboys)).

% @attr availability_status_libtech
% @type categorical
% @canonical false
% @original_name availability_status (lib-tech.com direct)
% @values available_libtech=Available_direct_lib_tech_com unk_availability_status_libtech=Unknown
% @importance 1.0

0.95::acc(s1, availability_status_libtech).
0.95::true_val(availability_status_libtech, available_libtech); 0.05::true_val(availability_status_libtech, unk_availability_status_libtech).
measured(s1, availability_status_libtech, available_libtech).
all_consistent(availability_status_libtech) :- consistent(s1, availability_status_libtech).
evidence(all_consistent(availability_status_libtech)).
query(true_val(availability_status_libtech, available_libtech)).
query(true_val(availability_status_libtech, unk_availability_status_libtech)).

% @attr price_comparison
% @type categorical
% @canonical false
% @original_name Price comparison
% @values above_avg_by_132=749_99_USD_above_avg_468 unk_price_comparison=Unknown
% @importance 0.85

0.82::acc(s66, price_comparison).
0.82::true_val(price_comparison, above_avg_by_132); 0.18::true_val(price_comparison, unk_price_comparison).
measured(s66, price_comparison, above_avg_by_132).
all_consistent(price_comparison) :- consistent(s66, price_comparison).
evidence(all_consistent(price_comparison)).
query(true_val(price_comparison, above_avg_by_132)).
query(true_val(price_comparison, unk_price_comparison)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values overpriced_hyped=Considered_overpriced_ridiculous_hype_and_price unk_user_review_forum=Unknown
% @importance 0.7

0.60::acc(s117, user_review_forum).
0.55::true_val(user_review_forum, overpriced_hyped); 0.45::true_val(user_review_forum, unk_user_review_forum).
measured(s117, user_review_forum, overpriced_hyped).
all_consistent(user_review_forum) :- consistent(s117, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, overpriced_hyped)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride_powder=Freeride_Powder all_mtn_directional=All_Mountain_Directional
% @importance 0.925

0.90::acc(s_merch, board_category).
0.93::acc(s1, board_category).
0.55::true_val(board_category, freeride_powder); 0.45::true_val(board_category, all_mtn_directional).
measured(s_merch, board_category, freeride_powder).
measured(s1, board_category, all_mtn_directional).
all_consistent(board_category) :-
    (indep(s_merch), consistent(s_merch, board_category) ; \+indep(s_merch)),
    consistent(s1, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, all_mtn_directional)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values powder_freeride_all_resort=Powder_Freeride_All_Resort unk_terrain_suitability=Unknown
% @importance 0.85

0.90::acc(s_merch, terrain_suitability).
0.95::true_val(terrain_suitability, powder_freeride_all_resort); 0.05::true_val(terrain_suitability, unk_terrain_suitability).
measured(s_merch, terrain_suitability, powder_freeride_all_resort).
all_consistent(terrain_suitability) :-
    (indep(s_merch), consistent(s_merch, terrain_suitability) ; \+indep(s_merch)).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, powder_freeride_all_resort)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate_advanced=Intermediate_to_Advanced unk_rider_level=Unknown
% @importance 0.85

0.90::acc(s_merch, rider_level).
0.90::true_val(rider_level, intermediate_advanced); 0.10::true_val(rider_level, unk_rider_level).
measured(s_merch, rider_level, intermediate_advanced).
all_consistent(rider_level) :-
    (indep(s_merch), consistent(s_merch, rider_level) ; \+indep(s_merch)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_Expert unk_skill_level_recommendation=Unknown
% @importance 0.85

0.85::acc(s19, skill_level_recommendation).
0.88::true_val(skill_level_recommendation, advanced_expert); 0.12::true_val(skill_level_recommendation, unk_skill_level_recommendation).
measured(s19, skill_level_recommendation, advanced_expert).
all_consistent(skill_level_recommendation) :-
    (indep(s19), consistent(s19, skill_level_recommendation) ; \+indep(s19)).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr skill_level_recommendation_detail
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (detailed)
% @values all_mtn_powder_switch=All_mountain_exceptional_powder_float_landing_switch unk_skill_level_recommendation_detail=Unknown
% @importance 0.9

0.82::acc(s16, skill_level_recommendation_detail).
0.82::true_val(skill_level_recommendation_detail, all_mtn_powder_switch); 0.18::true_val(skill_level_recommendation_detail, unk_skill_level_recommendation_detail).
measured(s16, skill_level_recommendation_detail, all_mtn_powder_switch).
all_consistent(skill_level_recommendation_detail) :- consistent(s16, skill_level_recommendation_detail).
evidence(all_consistent(skill_level_recommendation_detail)).
query(true_val(skill_level_recommendation_detail, all_mtn_powder_switch)).
query(true_val(skill_level_recommendation_detail, unk_skill_level_recommendation_detail)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 1.0

0.93::acc(s1, gender).
0.93::true_val(gender, unisex); 0.07::true_val(gender, unk_gender).
measured(s1, gender, unisex).
all_consistent(gender) :- consistent(s1, gender).
evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.925

0.90::acc(s_merch, shape).
0.93::acc(s1, shape).
0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).
measured(s_merch, shape, tapered_directional).
measured(s1, shape, tapered_directional).
all_consistent(shape) :-
    (indep(s_merch), consistent(s_merch, shape) ; \+indep(s_merch)),
    consistent(s1, shape).
evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr shape_taper_detail
% @type categorical
% @canonical false
% @original_name shape (taper detail)
% @values tail_narrower_than_nose=Tail_narrower_than_nose_enhanced_control_deep_snow unk_shape_taper_detail=Unknown
% @importance 0.85

0.88::acc(s_merch, shape_taper_detail).
0.88::true_val(shape_taper_detail, tail_narrower_than_nose); 0.12::true_val(shape_taper_detail, unk_shape_taper_detail).
measured(s_merch, shape_taper_detail, tail_narrower_than_nose).
all_consistent(shape_taper_detail) :-
    (indep(s_merch), consistent(s_merch, shape_taper_detail) ; \+indep(s_merch)).
evidence(all_consistent(shape_taper_detail)).
query(true_val(shape_taper_detail, tail_narrower_than_nose)).
query(true_val(shape_taper_detail, unk_shape_taper_detail)).

% @attr volume_shift
% @type categorical
% @canonical false
% @original_name Volume shift
% @values yes_3_6cm_shorter=Yes_ride_3_6cm_shorter unk_volume_shift=Unknown
% @importance 1.0

0.95::acc(s1, volume_shift).
0.95::true_val(volume_shift, yes_3_6cm_shorter); 0.05::true_val(volume_shift, unk_volume_shift).
measured(s1, volume_shift, yes_3_6cm_shorter).
all_consistent(volume_shift) :- consistent(s1, volume_shift).
evidence(all_consistent(volume_shift)).
query(true_val(volume_shift, yes_3_6cm_shorter)).
query(true_val(volume_shift, unk_volume_shift)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values eight_sizes=138_144_147_150_153_156_159_162cm unk_available_sizes=Unknown
% @importance 0.85

0.93::acc(s_merch, available_sizes).
0.93::true_val(available_sizes, eight_sizes); 0.07::true_val(available_sizes, unk_available_sizes).
measured(s_merch, available_sizes, eight_sizes).
all_consistent(available_sizes) :-
    (indep(s_merch), consistent(s_merch, available_sizes) ; \+indep(s_merch)).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, eight_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr taper_description
% @type categorical
% @canonical false
% @original_name taper (description)
% @values long_floaty_nose_shorter_narrower_tail=Long_floaty_nose_shorter_narrower_tail unk_taper_description=Unknown
% @importance 1.0

0.93::acc(s1, taper_description).
0.93::true_val(taper_description, long_floaty_nose_shorter_narrower_tail); 0.07::true_val(taper_description, unk_taper_description).
measured(s1, taper_description, long_floaty_nose_shorter_narrower_tail).
all_consistent(taper_description) :- consistent(s1, taper_description).
evidence(all_consistent(taper_description)).
query(true_val(taper_description, long_floaty_nose_shorter_narrower_tail)).
query(true_val(taper_description, unk_taper_description)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v10=10.0 v11=11.0
% @importance 0.675

0.85::acc(s15, taper).
0.78::acc(s71, taper).
0.50::true_val(taper, v10); 0.50::true_val(taper, v11).
measured(s15, taper, v10).
measured(s71, taper, v11).
all_consistent(taper) :-
    consistent(s15, taper),
    consistent(s71, taper).
evidence(all_consistent(taper)).
query(true_val(taper, v10)).
query(true_val(taper, v11)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values orca_c2x_directional=Orca_C2x_Directional unk_camber_type=Unknown
% @importance 0.85

0.92::acc(s_merch, camber_type).
0.92::true_val(camber_type, orca_c2x_directional); 0.08::true_val(camber_type, unk_camber_type).
measured(s_merch, camber_type, orca_c2x_directional).
all_consistent(camber_type) :-
    (indep(s_merch), consistent(s_merch, camber_type) ; \+indep(s_merch)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, orca_c2x_directional)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values lengthened_camber_nose_tail_shortened_rocker=Lengthened_camber_nose_tail_shortened_rocker_extreme_control_float unk_camber_description=Unknown
% @importance 0.85

0.90::acc(s_merch, camber_description).
0.90::true_val(camber_description, lengthened_camber_nose_tail_shortened_rocker); 0.10::true_val(camber_description, unk_camber_description).
measured(s_merch, camber_description, lengthened_camber_nose_tail_shortened_rocker).
all_consistent(camber_description) :-
    (indep(s_merch), consistent(s_merch, camber_description) ; \+indep(s_merch)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, lengthened_camber_nose_tail_shortened_rocker)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_2
% @type categorical
% @canonical false
% @original_name camber_description (evo)
% @values central_rocker_camber_pop=Central_rocker_carve_edge_hold_float_camber_pop_stability unk_camber_description_2=Unknown
% @importance 0.85

0.82::acc(s19, camber_description_2).
0.82::true_val(camber_description_2, central_rocker_camber_pop); 0.18::true_val(camber_description_2, unk_camber_description_2).
measured(s19, camber_description_2, central_rocker_camber_pop).
all_consistent(camber_description_2) :-
    (indep(s19), consistent(s19, camber_description_2) ; \+indep(s19)).
evidence(all_consistent(camber_description_2)).
query(true_val(camber_description_2, central_rocker_camber_pop)).
query(true_val(camber_description_2, unk_camber_description_2)).

% @attr camber_description_3
% @type categorical
% @canonical false
% @original_name camber_description (Blauer)
% @values aggressive_camber_underfoot_rocker_nose=Aggressive_camber_underfoot_rocker_between_feet_and_nose unk_camber_description_3=Unknown
% @importance 0.8

0.80::acc(s34, camber_description_3).
0.80::true_val(camber_description_3, aggressive_camber_underfoot_rocker_nose); 0.20::true_val(camber_description_3, unk_camber_description_3).
measured(s34, camber_description_3, aggressive_camber_underfoot_rocker_nose).
all_consistent(camber_description_3) :-
    (indep(s34), consistent(s34, camber_description_3) ; \+indep(s34)).
evidence(all_consistent(camber_description_3)).
query(true_val(camber_description_3, aggressive_camber_underfoot_rocker_nose)).
query(true_val(camber_description_3, unk_camber_description_3)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v7=7.0 unk_flex_rating_10=Unknown
% @importance 0.9

0.93::acc(s_merch, flex_rating_10).
0.88::acc(s34, flex_rating_10).
0.80::acc(s19, flex_rating_10).
0.85::acc(s35, flex_rating_10).
0.95::true_val(flex_rating_10, v7); 0.05::true_val(flex_rating_10, unk_flex_rating_10).
measured(s_merch, flex_rating_10, v7).
measured(s34, flex_rating_10, v7).
measured(s19, flex_rating_10, v7).
measured(s35, flex_rating_10, v7).
all_consistent(flex_rating_10) :-
    (indep(s_merch), consistent(s_merch, flex_rating_10) ; \+indep(s_merch)),
    (indep(s34), consistent(s34, flex_rating_10) ; \+indep(s34)),
    (indep(s19), consistent(s19, flex_rating_10) ; \+indep(s19)),
    consistent(s35, flex_rating_10).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values firm_responsive=Firm_responsive_flex_tuned_stability_drive_control unk_flex_feel=Unknown
% @importance 0.8

0.80::acc(s34, flex_feel).
0.80::true_val(flex_feel, firm_responsive); 0.20::true_val(flex_feel, unk_flex_feel).
measured(s34, flex_feel, firm_responsive).
all_consistent(flex_feel) :-
    (indep(s34), consistent(s34, flex_feel) ; \+indep(s34)).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, firm_responsive)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_feel_detail
% @type categorical
% @canonical false
% @original_name flex_feel (detail)
% @values middle_stiff_tail_stiffer_nose_play=Middle_stiff_tail_stiffer_nose_more_play unk_flex_feel_detail=Unknown
% @importance 0.95

0.85::acc(s35, flex_feel_detail).
0.85::true_val(flex_feel_detail, middle_stiff_tail_stiffer_nose_play); 0.15::true_val(flex_feel_detail, unk_flex_feel_detail).
measured(s35, flex_feel_detail, middle_stiff_tail_stiffer_nose_play).
all_consistent(flex_feel_detail) :- consistent(s35, flex_feel_detail).
evidence(all_consistent(flex_feel_detail)).
query(true_val(flex_feel_detail, middle_stiff_tail_stiffer_nose_play)).
query(true_val(flex_feel_detail, unk_flex_feel_detail)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values incredibly_stable=Incredibly_stable_in_control_regardless_of_conditions unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.82::acc(s66, reviewer_opinion_the_good_ride).
0.82::true_val(reviewer_opinion_the_good_ride, incredibly_stable); 0.18::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
measured(s66, reviewer_opinion_the_good_ride, incredibly_stable).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s66, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, incredibly_stable)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_tgr_butter
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (butter)
% @values easy_butter_despite_stiff=Easy_to_butter_despite_stiffness_thanks_to_rocker unk_reviewer_opinion_tgr_butter=Unknown
% @importance 0.95

0.82::acc(s35, reviewer_opinion_tgr_butter).
0.82::true_val(reviewer_opinion_tgr_butter, easy_butter_despite_stiff); 0.18::true_val(reviewer_opinion_tgr_butter, unk_reviewer_opinion_tgr_butter).
measured(s35, reviewer_opinion_tgr_butter, easy_butter_despite_stiff).
all_consistent(reviewer_opinion_tgr_butter) :- consistent(s35, reviewer_opinion_tgr_butter).
evidence(all_consistent(reviewer_opinion_tgr_butter)).
query(true_val(reviewer_opinion_tgr_butter, easy_butter_despite_stiff)).
query(true_val(reviewer_opinion_tgr_butter, unk_reviewer_opinion_tgr_butter)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values hponh=HPONH_Horsepower_Ocean_Bound_Native_Hemlock unk_core_material=Unknown
% @importance 0.85

0.93::acc(s_merch, core_material).
0.93::true_val(core_material, hponh); 0.07::true_val(core_material, unk_core_material).
measured(s_merch, core_material, hponh).
all_consistent(core_material) :-
    (indep(s_merch), consistent(s_merch, core_material) ; \+indep(s_merch)).
evidence(all_consistent(core_material)).
query(true_val(core_material, hponh)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_blend_ratio
% @type categorical
% @canonical false
% @original_name core_material_blend_ratio
% @values pct60_hemlock_40_paulownia=60pct_Makah_Hemlock_40pct_Paulownia unk_core_material_blend_ratio=Unknown
% @importance 0.85

0.90::acc(s_merch, core_material_blend_ratio).
0.90::true_val(core_material_blend_ratio, pct60_hemlock_40_paulownia); 0.10::true_val(core_material_blend_ratio, unk_core_material_blend_ratio).
measured(s_merch, core_material_blend_ratio, pct60_hemlock_40_paulownia).
all_consistent(core_material_blend_ratio) :-
    (indep(s_merch), consistent(s_merch, core_material_blend_ratio) ; \+indep(s_merch)).
evidence(all_consistent(core_material_blend_ratio)).
query(true_val(core_material_blend_ratio, pct60_hemlock_40_paulownia)).
query(true_val(core_material_blend_ratio, unk_core_material_blend_ratio)).

% @attr sustainability_certification_makah
% @type categorical
% @canonical false
% @original_name sustainability_certification (Makah hemlock)
% @values makah_sustainably_harvested=Sustainably_grown_harvested_Makah_tribe_Northwestern_USA unk_sustainability_certification_makah=Unknown
% @importance 0.925

0.90::acc(s_merch, sustainability_certification_makah).
0.93::acc(s1, sustainability_certification_makah).
0.95::true_val(sustainability_certification_makah, makah_sustainably_harvested); 0.05::true_val(sustainability_certification_makah, unk_sustainability_certification_makah).
measured(s_merch, sustainability_certification_makah, makah_sustainably_harvested).
measured(s1, sustainability_certification_makah, makah_sustainably_harvested).
all_consistent(sustainability_certification_makah) :-
    (indep(s_merch), consistent(s_merch, sustainability_certification_makah) ; \+indep(s_merch)),
    consistent(s1, sustainability_certification_makah).
evidence(all_consistent(sustainability_certification_makah)).
query(true_val(sustainability_certification_makah, makah_sustainably_harvested)).
query(true_val(sustainability_certification_makah, unk_sustainability_certification_makah)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_biax_basalt=Triaxial_Biaxial_Fiberglass_with_Basalt_Alloy unk_laminate=Unknown
% @importance 0.85

0.90::acc(s_merch, laminate).
0.85::acc(s19, laminate).
0.95::true_val(laminate, triax_biax_basalt); 0.05::true_val(laminate, unk_laminate).
measured(s_merch, laminate, triax_biax_basalt).
measured(s19, laminate, triax_biax_basalt).
all_consistent(laminate) :-
    (indep(s_merch), consistent(s_merch, laminate) ; \+indep(s_merch)),
    (indep(s19), consistent(s19, laminate) ; \+indep(s19)).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_basalt)).
query(true_val(laminate, unk_laminate)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch_internal_uhmw_sintered=Birch_Internal_UHMW_Sintered_Sidewall unk_sidewall_material=Unknown
% @importance 0.85

0.90::acc(s_merch, sidewall_material).
0.82::acc(s26, sidewall_material).
0.95::true_val(sidewall_material, birch_internal_uhmw_sintered); 0.05::true_val(sidewall_material, unk_sidewall_material).
measured(s_merch, sidewall_material, birch_internal_uhmw_sintered).
measured(s26, sidewall_material, birch_internal_uhmw_sintered).
all_consistent(sidewall_material) :-
    (indep(s_merch), consistent(s_merch, sidewall_material) ; \+indep(s_merch)),
    (indep(s26), consistent(s26, sidewall_material) ; \+indep(s26)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_internal_uhmw_sintered)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_birch
% @type categorical
% @canonical false
% @original_name sidewall_material (birch detail)
% @values birch_pop_durability=Rugged_lightweight_vertical_end_grain_Birch_pop_durability unk_sidewall_material_birch=Unknown
% @importance 0.7

0.80::acc(s26, sidewall_material_birch).
0.80::true_val(sidewall_material_birch, birch_pop_durability); 0.20::true_val(sidewall_material_birch, unk_sidewall_material_birch).
measured(s26, sidewall_material_birch, birch_pop_durability).
all_consistent(sidewall_material_birch) :-
    (indep(s26), consistent(s26, sidewall_material_birch) ; \+indep(s26)).
evidence(all_consistent(sidewall_material_birch)).
query(true_val(sidewall_material_birch, birch_pop_durability)).
query(true_val(sidewall_material_birch, unk_sidewall_material_birch)).

% @attr sidewall_material_sintered
% @type categorical
% @canonical false
% @original_name sidewall_material (sintered detail)
% @values twice_sintered=Twice_as_sintered_increases_durability_response_control unk_sidewall_material_sintered=Unknown
% @importance 0.7

0.80::acc(s26, sidewall_material_sintered).
0.80::true_val(sidewall_material_sintered, twice_sintered); 0.20::true_val(sidewall_material_sintered, unk_sidewall_material_sintered).
measured(s26, sidewall_material_sintered, twice_sintered).
all_consistent(sidewall_material_sintered) :-
    (indep(s26), consistent(s26, sidewall_material_sintered) ; \+indep(s26)).
evidence(all_consistent(sidewall_material_sintered)).
query(true_val(sidewall_material_sintered, twice_sintered)).
query(true_val(sidewall_material_sintered, unk_sidewall_material_sintered)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values ocean_bound_eco_sublimated_poly=Ocean_Bound_Eco_Sublimated_Poly_Topsheet unk_topsheet=Unknown
% @importance 0.85

0.90::acc(s_merch, topsheet).
0.90::true_val(topsheet, ocean_bound_eco_sublimated_poly); 0.10::true_val(topsheet, unk_topsheet).
measured(s_merch, topsheet, ocean_bound_eco_sublimated_poly).
all_consistent(topsheet) :-
    (indep(s_merch), consistent(s_merch, topsheet) ; \+indep(s_merch)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, ocean_bound_eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr sustainability_certification_pet
% @type categorical
% @canonical false
% @original_name sustainability_certification (PET)
% @values pet_50km_waterways=PET_bottles_upcycled_within_50km_of_waterways unk_sustainability_certification_pet=Unknown
% @importance 0.925

0.90::acc(s_merch, sustainability_certification_pet).
0.93::acc(s1, sustainability_certification_pet).
0.95::true_val(sustainability_certification_pet, pet_50km_waterways); 0.05::true_val(sustainability_certification_pet, unk_sustainability_certification_pet).
measured(s_merch, sustainability_certification_pet, pet_50km_waterways).
measured(s1, sustainability_certification_pet, pet_50km_waterways).
all_consistent(sustainability_certification_pet) :-
    (indep(s_merch), consistent(s_merch, sustainability_certification_pet) ; \+indep(s_merch)),
    consistent(s1, sustainability_certification_pet).
evidence(all_consistent(sustainability_certification_pet)).
query(true_val(sustainability_certification_pet, pet_50km_waterways)).
query(true_val(sustainability_certification_pet, unk_sustainability_certification_pet)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_knife_cut=Sintered_Knife_Cut_Base unk_base_type=Unknown
% @importance 0.85

0.90::acc(s_merch, base_type).
0.90::true_val(base_type, sintered_knife_cut); 0.10::true_val(base_type, unk_base_type).
measured(s_merch, base_type, sintered_knife_cut).
all_consistent(base_type) :-
    (indep(s_merch), consistent(s_merch, base_type) ; \+indep(s_merch)).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_knife_cut)).
query(true_val(base_type, unk_base_type)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values high_density_uhmw=High_density_UHMW unk_base_material=Unknown
% @importance 0.85

0.85::acc(s19, base_material).
0.88::true_val(base_material, high_density_uhmw); 0.12::true_val(base_material, unk_base_material).
measured(s19, base_material, high_density_uhmw).
all_consistent(base_material) :-
    (indep(s19), consistent(s19, base_material) ; \+indep(s19)).
evidence(all_consistent(base_material)).
query(true_val(base_material, high_density_uhmw)).
query(true_val(base_material, unk_base_material)).

% @attr base_material_properties
% @type categorical
% @canonical false
% @original_name base_material (properties)
% @values optimized_wax_retention=Optimized_wax_retention_and_toughness unk_base_material_properties=Unknown
% @importance 0.85

0.82::acc(s19, base_material_properties).
0.82::true_val(base_material_properties, optimized_wax_retention); 0.18::true_val(base_material_properties, unk_base_material_properties).
measured(s19, base_material_properties, optimized_wax_retention).
all_consistent(base_material_properties) :-
    (indep(s19), consistent(s19, base_material_properties) ; \+indep(s19)).
evidence(all_consistent(base_material_properties)).
query(true_val(base_material_properties, optimized_wax_retention)).
query(true_val(base_material_properties, unk_base_material_properties)).

% @attr base_maintenance
% @type categorical
% @canonical false
% @original_name Base maintenance
% @values wax_regularly_repair_professionally=Wax_regularly_repair_professionally unk_base_maintenance=Unknown
% @importance 0.85

0.82::acc(s19, base_maintenance).
0.82::true_val(base_maintenance, wax_regularly_repair_professionally); 0.18::true_val(base_maintenance, unk_base_maintenance).
measured(s19, base_maintenance, wax_regularly_repair_professionally).
all_consistent(base_maintenance) :-
    (indep(s19), consistent(s19, base_maintenance) ; \+indep(s19)).
evidence(all_consistent(base_maintenance)).
query(true_val(base_maintenance, wax_regularly_repair_professionally)).
query(true_val(base_maintenance, unk_base_maintenance)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.93::acc(s_merch, mounting_pattern).
0.93::true_val(mounting_pattern, inserts_2x4); 0.07::true_val(mounting_pattern, unk_mounting_pattern).
measured(s_merch, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :-
    (indep(s_merch), consistent(s_merch, mounting_pattern) ; \+indep(s_merch)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values uhmw_tip_tail_impact=UHMW_Tip_Tail_Impact_Deflection unk_construction_material_innovation=Unknown
% @importance 0.85

0.90::acc(s_merch, construction_material_innovation).
0.90::true_val(construction_material_innovation, uhmw_tip_tail_impact); 0.10::true_val(construction_material_innovation, unk_construction_material_innovation).
measured(s_merch, construction_material_innovation, uhmw_tip_tail_impact).
all_consistent(construction_material_innovation) :-
    (indep(s_merch), consistent(s_merch, construction_material_innovation) ; \+indep(s_merch)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, uhmw_tip_tail_impact)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction=Magne_Traction unk_edge_technology=Unknown
% @importance 0.85

0.93::acc(s_merch, edge_technology).
0.93::true_val(edge_technology, magne_traction); 0.07::true_val(edge_technology, unk_edge_technology).
measured(s_merch, edge_technology, magne_traction).
all_consistent(edge_technology) :-
    (indep(s_merch), consistent(s_merch, edge_technology) ; \+indep(s_merch)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_technology_detail
% @type categorical
% @canonical false
% @original_name edge_technology (detail)
% @values seven_serrations=Seven_strategically_placed_serrations_each_edge unk_edge_technology_detail=Unknown
% @importance 0.85

0.90::acc(s_merch, edge_technology_detail).
0.90::true_val(edge_technology_detail, seven_serrations); 0.10::true_val(edge_technology_detail, unk_edge_technology_detail).
measured(s_merch, edge_technology_detail, seven_serrations).
all_consistent(edge_technology_detail) :-
    (indep(s_merch), consistent(s_merch, edge_technology_detail) ; \+indep(s_merch)).
evidence(all_consistent(edge_technology_detail)).
query(true_val(edge_technology_detail, seven_serrations)).
query(true_val(edge_technology_detail, unk_edge_technology_detail)).

% @attr edge_hold_qualitative
% @type categorical
% @canonical false
% @original_name edge_hold (qualitative TGR)
% @values exceptional_magne_traction=Exceptional_pronounced_Magne_Traction_grips_hard_releases_soft unk_edge_hold_qualitative=Unknown
% @importance 0.95

0.85::acc(s35, edge_hold_qualitative).
0.85::true_val(edge_hold_qualitative, exceptional_magne_traction); 0.15::true_val(edge_hold_qualitative, unk_edge_hold_qualitative).
measured(s35, edge_hold_qualitative, exceptional_magne_traction).
all_consistent(edge_hold_qualitative) :- consistent(s35, edge_hold_qualitative).
evidence(all_consistent(edge_hold_qualitative)).
query(true_val(edge_hold_qualitative, exceptional_magne_traction)).
query(true_val(edge_hold_qualitative, unk_edge_hold_qualitative)).

% @attr sidecut_radius_size_small
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (small sizes)
% @unit m
% @values v6_8=6.8 unk_sidecut_radius_size_small=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_small).
0.93::true_val(sidecut_radius_size_small, v6_8); 0.07::true_val(sidecut_radius_size_small, unk_sidecut_radius_size_small).
measured(s1, sidecut_radius_size_small, v6_8).
all_consistent(sidecut_radius_size_small) :- consistent(s1, sidecut_radius_size_small).
evidence(all_consistent(sidecut_radius_size_small)).
query(true_val(sidecut_radius_size_small, v6_8)).
query(true_val(sidecut_radius_size_small, unk_sidecut_radius_size_small)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_0=7.0 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size).
0.93::true_val(sidecut_radius_size, v7_0); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).
measured(s1, sidecut_radius_size, v7_0).
all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_0)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr contact_length_size_138
% @type numeric
% @canonical false
% @original_name contact_length_size (138cm)
% @unit mm
% @values v1000=1000.0 unk_contact_length_size_138=Unknown
% @importance 0.925

0.93::acc(s_merch, contact_length_size_138).
0.93::true_val(contact_length_size_138, v1000); 0.07::true_val(contact_length_size_138, unk_contact_length_size_138).
measured(s_merch, contact_length_size_138, v1000).
all_consistent(contact_length_size_138) :-
    (indep(s_merch), consistent(s_merch, contact_length_size_138) ; \+indep(s_merch)).
evidence(all_consistent(contact_length_size_138)).
query(true_val(contact_length_size_138, v1000)).
query(true_val(contact_length_size_138, unk_contact_length_size_138)).

% @attr contact_length_size_144
% @type numeric
% @canonical false
% @original_name contact_length_size (144cm)
% @unit mm
% @values v1020=1020.0 unk_contact_length_size_144=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_144).
0.93::true_val(contact_length_size_144, v1020); 0.07::true_val(contact_length_size_144, unk_contact_length_size_144).
measured(s1, contact_length_size_144, v1020).
all_consistent(contact_length_size_144) :- consistent(s1, contact_length_size_144).
evidence(all_consistent(contact_length_size_144)).
query(true_val(contact_length_size_144, v1020)).
query(true_val(contact_length_size_144, unk_contact_length_size_144)).

% @attr contact_length_size_147
% @type numeric
% @canonical false
% @original_name contact_length_size (147cm)
% @unit mm
% @values v1050=1050.0 unk_contact_length_size_147=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_147).
0.93::true_val(contact_length_size_147, v1050); 0.07::true_val(contact_length_size_147, unk_contact_length_size_147).
measured(s1, contact_length_size_147, v1050).
all_consistent(contact_length_size_147) :- consistent(s1, contact_length_size_147).
evidence(all_consistent(contact_length_size_147)).
query(true_val(contact_length_size_147, v1050)).
query(true_val(contact_length_size_147, unk_contact_length_size_147)).

% @attr contact_length_size_150
% @type numeric
% @canonical false
% @original_name contact_length_size (150cm)
% @unit mm
% @values v1080=1080.0 unk_contact_length_size_150=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_150).
0.93::true_val(contact_length_size_150, v1080); 0.07::true_val(contact_length_size_150, unk_contact_length_size_150).
measured(s1, contact_length_size_150, v1080).
all_consistent(contact_length_size_150) :- consistent(s1, contact_length_size_150).
evidence(all_consistent(contact_length_size_150)).
query(true_val(contact_length_size_150, v1080)).
query(true_val(contact_length_size_150, unk_contact_length_size_150)).

% @attr contact_length_size_153
% @type numeric
% @canonical false
% @original_name contact_length_size (153cm)
% @unit mm
% @values v1100=1100.0 unk_contact_length_size_153=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_153).
0.93::true_val(contact_length_size_153, v1100); 0.07::true_val(contact_length_size_153, unk_contact_length_size_153).
measured(s1, contact_length_size_153, v1100).
all_consistent(contact_length_size_153) :- consistent(s1, contact_length_size_153).
evidence(all_consistent(contact_length_size_153)).
query(true_val(contact_length_size_153, v1100)).
query(true_val(contact_length_size_153, unk_contact_length_size_153)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit mm
% @values v1130=1130.0 unk_contact_length_size=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size).
0.93::true_val(contact_length_size, v1130); 0.07::true_val(contact_length_size, unk_contact_length_size).
measured(s1, contact_length_size, v1130).
all_consistent(contact_length_size) :- consistent(s1, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1130)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr contact_length_size_159
% @type numeric
% @canonical false
% @original_name contact_length_size (159cm)
% @unit mm
% @values v1150=1150.0 unk_contact_length_size_159=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_159).
0.93::true_val(contact_length_size_159, v1150); 0.07::true_val(contact_length_size_159, unk_contact_length_size_159).
measured(s1, contact_length_size_159, v1150).
all_consistent(contact_length_size_159) :- consistent(s1, contact_length_size_159).
evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v1150)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

% @attr contact_length_size_162
% @type numeric
% @canonical false
% @original_name contact_length_size (162cm)
% @unit mm
% @values v1180=1180.0 unk_contact_length_size_162=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_162).
0.93::true_val(contact_length_size_162, v1180); 0.07::true_val(contact_length_size_162, unk_contact_length_size_162).
measured(s1, contact_length_size_162, v1180).
all_consistent(contact_length_size_162) :- consistent(s1, contact_length_size_162).
evidence(all_consistent(contact_length_size_162)).
query(true_val(contact_length_size_162, v1180)).
query(true_val(contact_length_size_162, unk_contact_length_size_162)).

% @attr waist_width_138
% @type numeric
% @canonical false
% @original_name Waist width 138cm
% @unit cm
% @values v24_7=24.7 unk_waist_width_138=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_138).
0.93::true_val(waist_width_138, v24_7); 0.07::true_val(waist_width_138, unk_waist_width_138).
measured(s1, waist_width_138, v24_7).
all_consistent(waist_width_138) :- consistent(s1, waist_width_138).
evidence(all_consistent(waist_width_138)).
query(true_val(waist_width_138, v24_7)).
query(true_val(waist_width_138, unk_waist_width_138)).

% @attr waist_width_144
% @type numeric
% @canonical false
% @original_name Waist width 144cm
% @unit cm
% @values v25_0=25.0 unk_waist_width_144=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_144).
0.93::true_val(waist_width_144, v25_0); 0.07::true_val(waist_width_144, unk_waist_width_144).
measured(s1, waist_width_144, v25_0).
all_consistent(waist_width_144) :- consistent(s1, waist_width_144).
evidence(all_consistent(waist_width_144)).
query(true_val(waist_width_144, v25_0)).
query(true_val(waist_width_144, unk_waist_width_144)).

% @attr waist_width_147
% @type numeric
% @canonical false
% @original_name Waist width 147cm
% @unit cm
% @values v25_2=25.2 unk_waist_width_147=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_147).
0.93::true_val(waist_width_147, v25_2); 0.07::true_val(waist_width_147, unk_waist_width_147).
measured(s1, waist_width_147, v25_2).
all_consistent(waist_width_147) :- consistent(s1, waist_width_147).
evidence(all_consistent(waist_width_147)).
query(true_val(waist_width_147, v25_2)).
query(true_val(waist_width_147, unk_waist_width_147)).

% @attr waist_width_150
% @type numeric
% @canonical false
% @original_name Waist width 150cm
% @unit cm
% @values v25_5=25.5 unk_waist_width_150=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_150).
0.93::true_val(waist_width_150, v25_5); 0.07::true_val(waist_width_150, unk_waist_width_150).
measured(s1, waist_width_150, v25_5).
all_consistent(waist_width_150) :- consistent(s1, waist_width_150).
evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v25_5)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr waist_width_153
% @type numeric
% @canonical false
% @original_name Waist width 153cm
% @unit cm
% @values v26_7=26.7 unk_waist_width_153=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_153).
0.93::true_val(waist_width_153, v26_7); 0.07::true_val(waist_width_153, unk_waist_width_153).
measured(s1, waist_width_153, v26_7).
all_consistent(waist_width_153) :- consistent(s1, waist_width_153).
evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v26_7)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name Waist width 156cm
% @unit cm
% @values v26_7=26.7 unk_waist_width_156=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_156).
0.93::true_val(waist_width_156, v26_7); 0.07::true_val(waist_width_156, unk_waist_width_156).
measured(s1, waist_width_156, v26_7).
all_consistent(waist_width_156) :- consistent(s1, waist_width_156).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v26_7)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name Waist width 159cm
% @unit cm
% @values v26_7=26.7 unk_waist_width_159=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_159).
0.93::true_val(waist_width_159, v26_7); 0.07::true_val(waist_width_159, unk_waist_width_159).
measured(s1, waist_width_159, v26_7).
all_consistent(waist_width_159) :- consistent(s1, waist_width_159).
evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v26_7)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr waist_width_162
% @type numeric
% @canonical false
% @original_name Waist width 162cm
% @unit cm
% @values v26_9=26.9 unk_waist_width_162=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_162).
0.93::true_val(waist_width_162, v26_9); 0.07::true_val(waist_width_162, unk_waist_width_162).
measured(s1, waist_width_162, v26_9).
all_consistent(waist_width_162) :- consistent(s1, waist_width_162).
evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v26_9)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v32_2_31_1=32.2_31.1cm v32_3_31_1=32.3_31.1cm
% @importance 0.925

0.95::acc(s1, tip_tail_width_size).
0.85::acc(s_merch, tip_tail_width_size).
0.60::true_val(tip_tail_width_size, v32_2_31_1); 0.40::true_val(tip_tail_width_size, v32_3_31_1).
measured(s1, tip_tail_width_size, v32_2_31_1).
measured(s_merch, tip_tail_width_size, v32_3_31_1).
all_consistent(tip_tail_width_size) :-
    consistent(s1, tip_tail_width_size),
    (indep(s_merch), consistent(s_merch, tip_tail_width_size) ; \+indep(s_merch)).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v32_2_31_1)).
query(true_val(tip_tail_width_size, v32_3_31_1)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit inches
% @values v2_0=2.0 v2_5=2.5
% @importance 0.775

0.80::acc(s_merch, setback).
0.78::acc(s15, setback).
0.75::acc(s71, setback).
0.40::true_val(setback, v2_0); 0.60::true_val(setback, v2_5).
measured(s_merch, setback, v2_0).
measured(s15, setback, v2_0).
measured(s71, setback, v2_5).
all_consistent(setback) :-
    (indep(s_merch), consistent(s_merch, setback) ; \+indep(s_merch)),
    consistent(s15, setback),
    consistent(s71, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v2_0)).
query(true_val(setback, v2_5)).

% @attr recommended_weight_range_size_138
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (138cm)
% @values w90_plus_lbs=90_plus_lbs_45_plus_kg unk_recommended_weight_range_size_138=Unknown
% @importance 1.0

0.93::acc(s1, recommended_weight_range_size_138).
0.93::true_val(recommended_weight_range_size_138, w90_plus_lbs); 0.07::true_val(recommended_weight_range_size_138, unk_recommended_weight_range_size_138).
measured(s1, recommended_weight_range_size_138, w90_plus_lbs).
all_consistent(recommended_weight_range_size_138) :- consistent(s1, recommended_weight_range_size_138).
evidence(all_consistent(recommended_weight_range_size_138)).
query(true_val(recommended_weight_range_size_138, w90_plus_lbs)).
query(true_val(recommended_weight_range_size_138, unk_recommended_weight_range_size_138)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w160_plus_lbs=160_plus_lbs_75_plus_kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.93::acc(s1, recommended_weight_range_size).
0.93::true_val(recommended_weight_range_size, w160_plus_lbs); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
measured(s1, recommended_weight_range_size, w160_plus_lbs).
all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w160_plus_lbs)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr surface_area_138
% @type numeric
% @canonical false
% @original_name Surface area 138cm
% @unit sq_cm
% @values v574=574.0 unk_surface_area_138=Unknown
% @importance 1.0

0.93::acc(s1, surface_area_138).
0.93::true_val(surface_area_138, v574); 0.07::true_val(surface_area_138, unk_surface_area_138).
measured(s1, surface_area_138, v574).
all_consistent(surface_area_138) :- consistent(s1, surface_area_138).
evidence(all_consistent(surface_area_138)).
query(true_val(surface_area_138, v574)).
query(true_val(surface_area_138, unk_surface_area_138)).

% @attr surface_area_162
% @type numeric
% @canonical false
% @original_name Surface area 162cm
% @unit sq_cm
% @values v714=714.0 unk_surface_area_162=Unknown
% @importance 1.0

0.93::acc(s1, surface_area_162).
0.93::true_val(surface_area_162, v714); 0.07::true_val(surface_area_162, unk_surface_area_162).
measured(s1, surface_area_162, v714).
all_consistent(surface_area_162) :- consistent(s1, surface_area_162).
evidence(all_consistent(surface_area_162)).
query(true_val(surface_area_162, v714)).
query(true_val(surface_area_162, unk_surface_area_162)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values very_fast_edge_to_edge=Very_fast_edge_to_edge_fun_to_get_on_edge unk_turn_initiation_performance=Unknown
% @importance 0.95

0.85::acc(s35, turn_initiation_performance).
0.85::true_val(turn_initiation_performance, very_fast_edge_to_edge); 0.15::true_val(turn_initiation_performance, unk_turn_initiation_performance).
measured(s35, turn_initiation_performance, very_fast_edge_to_edge).
all_consistent(turn_initiation_performance) :- consistent(s35, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, very_fast_edge_to_edge)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr turn_initiation_performance_turny
% @type categorical
% @canonical false
% @original_name turn_initiation_performance (turny)
% @values turny_tight_and_drawn_out=Turny_personality_tight_radius_and_long_drawn_out_carves unk_turn_initiation_performance_turny=Unknown
% @importance 0.95

0.85::acc(s35, turn_initiation_performance_turny).
0.85::true_val(turn_initiation_performance_turny, turny_tight_and_drawn_out); 0.15::true_val(turn_initiation_performance_turny, unk_turn_initiation_performance_turny).
measured(s35, turn_initiation_performance_turny, turny_tight_and_drawn_out).
all_consistent(turn_initiation_performance_turny) :- consistent(s35, turn_initiation_performance_turny).
evidence(all_consistent(turn_initiation_performance_turny)).
query(true_val(turn_initiation_performance_turny, turny_tight_and_drawn_out)).
query(true_val(turn_initiation_performance_turny, unk_turn_initiation_performance_turny)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values ton_of_pop=A_ton_of_pop_very_poppy_aggressive_launches_off_jumps unk_pop=Unknown
% @importance 0.95

0.85::acc(s35, pop).
0.85::true_val(pop, ton_of_pop); 0.15::true_val(pop, unk_pop).
measured(s35, pop, ton_of_pop).
all_consistent(pop) :- consistent(s35, pop).
evidence(all_consistent(pop)).
query(true_val(pop, ton_of_pop)).
query(true_val(pop, unk_pop)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values absorbs_well_hard_snow=Absorbs_chatter_very_well_hard_uneven_snow_stays_damp unk_chatter_performance=Unknown
% @importance 0.95

0.85::acc(s35, chatter_performance).
0.85::true_val(chatter_performance, absorbs_well_hard_snow); 0.15::true_val(chatter_performance, unk_chatter_performance).
measured(s35, chatter_performance, absorbs_well_hard_snow).
all_consistent(chatter_performance) :- consistent(s35, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, absorbs_well_hard_snow)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr chatter_performance_soft
% @type categorical
% @canonical false
% @original_name chatter_performance (soft snow)
% @values chunder_buster=Certified_chunder_buster_soft_uneven_snow unk_chatter_performance_soft=Unknown
% @importance 0.95

0.85::acc(s35, chatter_performance_soft).
0.85::true_val(chatter_performance_soft, chunder_buster); 0.15::true_val(chatter_performance_soft, unk_chatter_performance_soft).
measured(s35, chatter_performance_soft, chunder_buster).
all_consistent(chatter_performance_soft) :- consistent(s35, chatter_performance_soft).
evidence(all_consistent(chatter_performance_soft)).
query(true_val(chatter_performance_soft, chunder_buster)).
query(true_val(chatter_performance_soft, unk_chatter_performance_soft)).

% @attr speed_rating_tgr
% @type categorical
% @canonical false
% @original_name speed_rating_tgr
% @values speed_demons=Speed_demons_no_issue_going_fast unk_speed_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s35, speed_rating_tgr).
0.85::true_val(speed_rating_tgr, speed_demons); 0.15::true_val(speed_rating_tgr, unk_speed_rating_tgr).
measured(s35, speed_rating_tgr, speed_demons).
all_consistent(speed_rating_tgr) :- consistent(s35, speed_rating_tgr).
evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, speed_demons)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values better_switch_than_older=Rides_better_switch_than_older_Orcas_more_switch_friendly_tail unk_switch_riding=Unknown
% @importance 0.95

0.85::acc(s35, switch_riding).
0.85::true_val(switch_riding, better_switch_than_older); 0.15::true_val(switch_riding, unk_switch_riding).
measured(s35, switch_riding, better_switch_than_older).
all_consistent(switch_riding) :- consistent(s35, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, better_switch_than_older)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr switch_riding_tail
% @type categorical
% @canonical false
% @original_name switch_riding (tail detail)
% @values rounded_softer_tail_balanced=More_rounded_softer_tail_more_balanced_opposite_stance unk_switch_riding_tail=Unknown
% @importance 0.85

0.82::acc(s42, switch_riding_tail).
0.82::true_val(switch_riding_tail, rounded_softer_tail_balanced); 0.18::true_val(switch_riding_tail, unk_switch_riding_tail).
measured(s42, switch_riding_tail, rounded_softer_tail_balanced).
all_consistent(switch_riding_tail) :- consistent(s42, switch_riding_tail).
evidence(all_consistent(switch_riding_tail)).
query(true_val(switch_riding_tail, rounded_softer_tail_balanced)).
query(true_val(switch_riding_tail, unk_switch_riding_tail)).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values good_but_wax_hungry=Good_base_glide_but_very_wax_hungry unk_base_glide_performance=Unknown
% @importance 0.95

0.85::acc(s35, base_glide_performance).
0.85::true_val(base_glide_performance, good_but_wax_hungry); 0.15::true_val(base_glide_performance, unk_base_glide_performance).
measured(s35, base_glide_performance, good_but_wax_hungry).
all_consistent(base_glide_performance) :- consistent(s35, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good_but_wax_hungry)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical false
% @original_name pipe_rating_tgr
% @values exceptional_pipe=Exceptional_pipe_board_edge_hold_camber_drive_speed_turnability unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.85::acc(s35, pipe_rating_tgr).
0.85::true_val(pipe_rating_tgr, exceptional_pipe); 0.15::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).
measured(s35, pipe_rating_tgr, exceptional_pipe).
all_consistent(pipe_rating_tgr) :- consistent(s35, pipe_rating_tgr).
evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, exceptional_pipe)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

% @attr reviewer_opinion_tgr_edge
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (edge engagement)
% @values keep_edge_engaged=Can_straight_line_but_keep_edge_engaged_harder_snow unk_reviewer_opinion_tgr_edge=Unknown
% @importance 0.95

0.82::acc(s35, reviewer_opinion_tgr_edge).
0.82::true_val(reviewer_opinion_tgr_edge, keep_edge_engaged); 0.18::true_val(reviewer_opinion_tgr_edge, unk_reviewer_opinion_tgr_edge).
measured(s35, reviewer_opinion_tgr_edge, keep_edge_engaged).
all_consistent(reviewer_opinion_tgr_edge) :- consistent(s35, reviewer_opinion_tgr_edge).
evidence(all_consistent(reviewer_opinion_tgr_edge)).
query(true_val(reviewer_opinion_tgr_edge, keep_edge_engaged)).
query(true_val(reviewer_opinion_tgr_edge, unk_reviewer_opinion_tgr_edge)).

% @attr powder_rating_tgr
% @type numeric
% @canonical false
% @original_name powder_rating_tgr
% @unit /10
% @values v10=10.0 unk_powder_rating_tgr=Unknown
% @importance 0.9

0.82::acc(s65, powder_rating_tgr).
0.84::true_val(powder_rating_tgr, v10); 0.16::true_val(powder_rating_tgr, unk_powder_rating_tgr).
measured(s65, powder_rating_tgr, v10).
all_consistent(powder_rating_tgr) :- consistent(s65, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, v10)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr edge_hold
% @type numeric
% @canonical true
% @original_name edge_hold
% @unit /10
% @values v10=10.0 unk_edge_hold=Unknown
% @importance 0.9

0.82::acc(s65, edge_hold).
0.84::true_val(edge_hold, v10); 0.16::true_val(edge_hold, unk_edge_hold).
measured(s65, edge_hold, v10).
all_consistent(edge_hold) :- consistent(s65, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, v10)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr ice_grip_rating
% @type numeric
% @canonical false
% @original_name Ice grip rating
% @unit /10
% @values v10=10.0 unk_ice_grip_rating=Unknown
% @importance 0.9

0.82::acc(s65, ice_grip_rating).
0.84::true_val(ice_grip_rating, v10); 0.16::true_val(ice_grip_rating, unk_ice_grip_rating).
measured(s65, ice_grip_rating, v10).
all_consistent(ice_grip_rating) :- consistent(s65, ice_grip_rating).
evidence(all_consistent(ice_grip_rating)).
query(true_val(ice_grip_rating, v10)).
query(true_val(ice_grip_rating, unk_ice_grip_rating)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v91_15=91.15 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.9

0.82::acc(s65, overall_rating_snowboardingprofiles).
0.84::true_val(overall_rating_snowboardingprofiles, v91_15); 0.16::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).
measured(s65, overall_rating_snowboardingprofiles, v91_15).
all_consistent(overall_rating_snowboardingprofiles) :- consistent(s65, overall_rating_snowboardingprofiles).
evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v91_15)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr overall_rating_snowboardingprofiles_original
% @type numeric
% @canonical false
% @original_name overall_rating_snowboardingprofiles (original Orca)
% @unit /100
% @values v93_41=93.41 unk_overall_rating_sp_original=Unknown
% @importance 0.9

0.82::acc(s65, overall_rating_snowboardingprofiles_original).
0.84::true_val(overall_rating_snowboardingprofiles_original, v93_41); 0.16::true_val(overall_rating_snowboardingprofiles_original, unk_overall_rating_sp_original).
measured(s65, overall_rating_snowboardingprofiles_original, v93_41).
all_consistent(overall_rating_snowboardingprofiles_original) :- consistent(s65, overall_rating_snowboardingprofiles_original).
evidence(all_consistent(overall_rating_snowboardingprofiles_original)).
query(true_val(overall_rating_snowboardingprofiles_original, v93_41)).
query(true_val(overall_rating_snowboardingprofiles_original, unk_overall_rating_sp_original)).

% @attr overall_rating_sp_stars
% @type numeric
% @canonical false
% @original_name overall_rating_snowboardingprofiles (stars, original Orca)
% @unit /5
% @values v4_7=4.7 unk_overall_rating_sp_stars=Unknown
% @importance 0.8

0.80::acc(s116, overall_rating_sp_stars).
0.80::true_val(overall_rating_sp_stars, v4_7); 0.20::true_val(overall_rating_sp_stars, unk_overall_rating_sp_stars).
measured(s116, overall_rating_sp_stars, v4_7).
all_consistent(overall_rating_sp_stars) :- consistent(s116, overall_rating_sp_stars).
evidence(all_consistent(overall_rating_sp_stars)).
query(true_val(overall_rating_sp_stars, v4_7)).
query(true_val(overall_rating_sp_stars, unk_overall_rating_sp_stars)).

% @attr overall_rating_sp_rank
% @type categorical
% @canonical false
% @original_name overall_rating_snowboardingprofiles (rank)
% @values rank_2nd_of_38=2nd_out_of_38_boards_reviewed unk_overall_rating_sp_rank=Unknown
% @importance 0.85

0.80::acc(s66, overall_rating_sp_rank).
0.80::true_val(overall_rating_sp_rank, rank_2nd_of_38); 0.20::true_val(overall_rating_sp_rank, unk_overall_rating_sp_rank).
measured(s66, overall_rating_sp_rank, rank_2nd_of_38).
all_consistent(overall_rating_sp_rank) :- consistent(s66, overall_rating_sp_rank).
evidence(all_consistent(overall_rating_sp_rank)).
query(true_val(overall_rating_sp_rank, rank_2nd_of_38)).
query(true_val(overall_rating_sp_rank, unk_overall_rating_sp_rank)).

% @attr reviewer_opinion_tgr_favorite
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (favorite)
% @values absolute_favorite=Absolute_favorite_not_letting_it_go unk_reviewer_opinion_tgr_favorite=Unknown
% @importance 0.95

0.85::acc(s35, reviewer_opinion_tgr_favorite).
0.85::true_val(reviewer_opinion_tgr_favorite, absolute_favorite); 0.15::true_val(reviewer_opinion_tgr_favorite, unk_reviewer_opinion_tgr_favorite).
measured(s35, reviewer_opinion_tgr_favorite, absolute_favorite).
all_consistent(reviewer_opinion_tgr_favorite) :- consistent(s35, reviewer_opinion_tgr_favorite).
evidence(all_consistent(reviewer_opinion_tgr_favorite)).
query(true_val(reviewer_opinion_tgr_favorite, absolute_favorite)).
query(true_val(reviewer_opinion_tgr_favorite, unk_reviewer_opinion_tgr_favorite)).

% @attr lib_tech_site_reviews
% @type categorical
% @canonical false
% @original_name Lib Tech manufacturer site reviews
% @values pct100_2reviews=100pct_rating_2_reviews unk_lib_tech_site_reviews=Unknown
% @importance 1.0

0.85::acc(s1, lib_tech_site_reviews).
0.85::true_val(lib_tech_site_reviews, pct100_2reviews); 0.15::true_val(lib_tech_site_reviews, unk_lib_tech_site_reviews).
measured(s1, lib_tech_site_reviews, pct100_2reviews).
all_consistent(lib_tech_site_reviews) :- consistent(s1, lib_tech_site_reviews).
evidence(all_consistent(lib_tech_site_reviews)).
query(true_val(lib_tech_site_reviews, pct100_2reviews)).
query(true_val(lib_tech_site_reviews, unk_lib_tech_site_reviews)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values top_100_2023_24=Selected_top_100_snowboard_products_2023_2024 unk_reviewer_opinion_whitelines=Unknown
% @importance 0.6

0.82::acc(s45, reviewer_opinion_whitelines).
0.82::true_val(reviewer_opinion_whitelines, top_100_2023_24); 0.18::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).
measured(s45, reviewer_opinion_whitelines, top_100_2023_24).
all_consistent(reviewer_opinion_whitelines) :- consistent(s45, reviewer_opinion_whitelines).
evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, top_100_2023_24)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr terrain_suitability_excels
% @type categorical
% @canonical false
% @original_name terrain_suitability (excels in)
% @values excels_powder_groomers_ice=Excels_in_powder_groomers_variable_conditions_trees_ice unk_terrain_suitability_excels=Unknown
% @importance 0.7

0.82::acc(s24, terrain_suitability_excels).
0.82::true_val(terrain_suitability_excels, excels_powder_groomers_ice); 0.18::true_val(terrain_suitability_excels, unk_terrain_suitability_excels).
measured(s24, terrain_suitability_excels, excels_powder_groomers_ice).
all_consistent(terrain_suitability_excels) :- consistent(s24, terrain_suitability_excels).
evidence(all_consistent(terrain_suitability_excels)).
query(true_val(terrain_suitability_excels, excels_powder_groomers_ice)).
query(true_val(terrain_suitability_excels, unk_terrain_suitability_excels)).

% @attr edge_hold_ice
% @type categorical
% @canonical false
% @original_name edge_hold (ice)
% @values exceptional_ice_magne_traction=Exceptional_edge_hold_on_ice_Magne_Traction unk_edge_hold_ice=Unknown
% @importance 0.8

0.78::acc(s14, edge_hold_ice).
0.78::true_val(edge_hold_ice, exceptional_ice_magne_traction); 0.22::true_val(edge_hold_ice, unk_edge_hold_ice).
measured(s14, edge_hold_ice, exceptional_ice_magne_traction).
all_consistent(edge_hold_ice) :- consistent(s14, edge_hold_ice).
evidence(all_consistent(edge_hold_ice)).
query(true_val(edge_hold_ice, exceptional_ice_magne_traction)).
query(true_val(edge_hold_ice, unk_edge_hold_ice)).

% @attr carving_rating_tgr
% @type categorical
% @canonical false
% @original_name carving_rating_tgr
% @values carves_beautifully=Carves_beautifully_tons_of_power_and_response unk_carving_rating_tgr=Unknown
% @importance 0.85

0.82::acc(s66, carving_rating_tgr).
0.82::true_val(carving_rating_tgr, carves_beautifully); 0.18::true_val(carving_rating_tgr, unk_carving_rating_tgr).
measured(s66, carving_rating_tgr, carves_beautifully).
all_consistent(carving_rating_tgr) :- consistent(s66, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, carves_beautifully)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values most_fun_board=Most_fun_snowboard_ridden_by_multiple_reviewers unk_positive_aspect=Unknown
% @importance 0.85

0.82::acc(s66, positive_aspect).
0.82::true_val(positive_aspect, most_fun_board); 0.18::true_val(positive_aspect, unk_positive_aspect).
measured(s66, positive_aspect, most_fun_board).
all_consistent(positive_aspect) :- consistent(s66, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, most_fun_board)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_toe_drag
% @type categorical
% @canonical false
% @original_name positive_aspect (toe drag)
% @values wider_no_toe_drag=Wider_platform_eliminates_toe_drag_larger_boots unk_positive_aspect_toe_drag=Unknown
% @importance 0.7

0.80::acc(s26, positive_aspect_toe_drag).
0.80::true_val(positive_aspect_toe_drag, wider_no_toe_drag); 0.20::true_val(positive_aspect_toe_drag, unk_positive_aspect_toe_drag).
measured(s26, positive_aspect_toe_drag, wider_no_toe_drag).
all_consistent(positive_aspect_toe_drag) :-
    (indep(s26), consistent(s26, positive_aspect_toe_drag) ; \+indep(s26)).
evidence(all_consistent(positive_aspect_toe_drag)).
query(true_val(positive_aspect_toe_drag, wider_no_toe_drag)).
query(true_val(positive_aspect_toe_drag, unk_positive_aspect_toe_drag)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values prone_gouges_jibbing=Prone_to_gouges_jibbing_park_rails_not_designed_for_that unk_negative_aspect=Unknown
% @importance 0.85

0.82::acc(s42, negative_aspect).
0.82::true_val(negative_aspect, prone_gouges_jibbing); 0.18::true_val(negative_aspect, unk_negative_aspect).
measured(s42, negative_aspect, prone_gouges_jibbing).
all_consistent(negative_aspect) :- consistent(s42, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, prone_gouges_jibbing)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_wax
% @type categorical
% @canonical false
% @original_name negative_aspect (wax hungry)
% @values very_wax_hungry=Very_wax_hungry_needs_frequent_waxing unk_negative_aspect_wax=Unknown
% @importance 0.95

0.85::acc(s35, negative_aspect_wax).
0.85::true_val(negative_aspect_wax, very_wax_hungry); 0.15::true_val(negative_aspect_wax, unk_negative_aspect_wax).
measured(s35, negative_aspect_wax, very_wax_hungry).
all_consistent(negative_aspect_wax) :- consistent(s35, negative_aspect_wax).
evidence(all_consistent(negative_aspect_wax)).
query(true_val(negative_aspect_wax, very_wax_hungry)).
query(true_val(negative_aspect_wax, unk_negative_aspect_wax)).

% @attr negative_aspect_price
% @type categorical
% @canonical false
% @original_name negative_aspect (above average price)
% @values above_average_price=Above_average_for_snowboard_market unk_negative_aspect_price=Unknown
% @importance 0.85

0.80::acc(s66, negative_aspect_price).
0.80::true_val(negative_aspect_price, above_average_price); 0.20::true_val(negative_aspect_price, unk_negative_aspect_price).
measured(s66, negative_aspect_price, above_average_price).
all_consistent(negative_aspect_price) :- consistent(s66, negative_aspect_price).
evidence(all_consistent(negative_aspect_price)).
query(true_val(negative_aspect_price, above_average_price)).
query(true_val(negative_aspect_price, unk_negative_aspect_price)).

% @attr user_review_forum_overhyped
% @type categorical
% @canonical false
% @original_name user_review_forum (overhyped)
% @values overhyped=Multiple_forum_users_describe_board_as_overhyped unk_user_review_forum_overhyped=Unknown
% @importance 0.7

0.55::acc(s67, user_review_forum_overhyped).
0.55::true_val(user_review_forum_overhyped, overhyped); 0.45::true_val(user_review_forum_overhyped, unk_user_review_forum_overhyped).
measured(s67, user_review_forum_overhyped, overhyped).
all_consistent(user_review_forum_overhyped) :- consistent(s67, user_review_forum_overhyped).
evidence(all_consistent(user_review_forum_overhyped)).
query(true_val(user_review_forum_overhyped, overhyped)).
query(true_val(user_review_forum_overhyped, unk_user_review_forum_overhyped)).

% @attr user_review_forum_cheaper
% @type categorical
% @canonical false
% @original_name user_review_forum (cheaper alternatives)
% @values many_cheaper_alternatives=Many_boards_do_what_Orca_does_for_cheaper unk_user_review_forum_cheaper=Unknown
% @importance 0.7

0.55::acc(s67, user_review_forum_cheaper).
0.55::true_val(user_review_forum_cheaper, many_cheaper_alternatives); 0.45::true_val(user_review_forum_cheaper, unk_user_review_forum_cheaper).
measured(s67, user_review_forum_cheaper, many_cheaper_alternatives).
all_consistent(user_review_forum_cheaper) :- consistent(s67, user_review_forum_cheaper).
evidence(all_consistent(user_review_forum_cheaper)).
query(true_val(user_review_forum_cheaper, many_cheaper_alternatives)).
query(true_val(user_review_forum_cheaper, unk_user_review_forum_cheaper)).

% @attr user_review_forum_hardpack
% @type categorical
% @canonical false
% @original_name user_review_forum (hardpack)
% @values meh_hardpack=Meh_on_hardpack_groomers_dissenting unk_user_review_forum_hardpack=Unknown
% @importance 0.7

0.50::acc(s67, user_review_forum_hardpack).
0.50::true_val(user_review_forum_hardpack, meh_hardpack); 0.50::true_val(user_review_forum_hardpack, unk_user_review_forum_hardpack).
measured(s67, user_review_forum_hardpack, meh_hardpack).
all_consistent(user_review_forum_hardpack) :- consistent(s67, user_review_forum_hardpack).
evidence(all_consistent(user_review_forum_hardpack)).
query(true_val(user_review_forum_hardpack, meh_hardpack)).
query(true_val(user_review_forum_hardpack, unk_user_review_forum_hardpack)).

% @attr negative_aspect_freestyle
% @type categorical
% @canonical false
% @original_name negative_aspect (freestyle)
% @values not_suited_freestyle_park=Directional_shape_not_suited_freestyle_park unk_negative_aspect_freestyle=Unknown
% @importance 0.75

0.78::acc(s15, negative_aspect_freestyle).
0.78::true_val(negative_aspect_freestyle, not_suited_freestyle_park); 0.22::true_val(negative_aspect_freestyle, unk_negative_aspect_freestyle).
measured(s15, negative_aspect_freestyle, not_suited_freestyle_park).
all_consistent(negative_aspect_freestyle) :- consistent(s15, negative_aspect_freestyle).
evidence(all_consistent(negative_aspect_freestyle)).
query(true_val(negative_aspect_freestyle, not_suited_freestyle_park)).
query(true_val(negative_aspect_freestyle, unk_negative_aspect_freestyle)).

% @attr negative_aspect_camber_pref
% @type categorical
% @canonical false
% @original_name negative_aspect (camber preference)
% @values too_loose_for_full_camber=Riders_preferring_full_camber_may_find_profile_too_loose unk_negative_aspect_camber_pref=Unknown
% @importance 0.9

0.78::acc(s65, negative_aspect_camber_pref).
0.78::true_val(negative_aspect_camber_pref, too_loose_for_full_camber); 0.22::true_val(negative_aspect_camber_pref, unk_negative_aspect_camber_pref).
measured(s65, negative_aspect_camber_pref, too_loose_for_full_camber).
all_consistent(negative_aspect_camber_pref) :- consistent(s65, negative_aspect_camber_pref).
evidence(all_consistent(negative_aspect_camber_pref)).
query(true_val(negative_aspect_camber_pref, too_loose_for_full_camber)).
query(true_val(negative_aspect_camber_pref, unk_negative_aspect_camber_pref)).

% @attr negative_aspect_auto_spinny
% @type categorical
% @canonical false
% @original_name negative_aspect (auto-spinny)
% @values auto_spinny_flat_basing=Slightly_auto_spinny_flat_basing_keep_on_edge unk_negative_aspect_auto_spinny=Unknown
% @importance 0.6

0.72::acc(s20, negative_aspect_auto_spinny).
0.72::true_val(negative_aspect_auto_spinny, auto_spinny_flat_basing); 0.28::true_val(negative_aspect_auto_spinny, unk_negative_aspect_auto_spinny).
measured(s20, negative_aspect_auto_spinny, auto_spinny_flat_basing).
all_consistent(negative_aspect_auto_spinny) :- consistent(s20, negative_aspect_auto_spinny).
evidence(all_consistent(negative_aspect_auto_spinny)).
query(true_val(negative_aspect_auto_spinny, auto_spinny_flat_basing)).
query(true_val(negative_aspect_auto_spinny, unk_negative_aspect_auto_spinny)).

% @attr user_review_forum_durability
% @type categorical
% @canonical false
% @original_name user_review_forum (durability)
% @values notorious_lack_durability=Libs_notorious_lack_of_durability_forum_comment unk_user_review_forum_durability=Unknown
% @importance 0.75

0.45::acc(s47, user_review_forum_durability).
0.45::true_val(user_review_forum_durability, notorious_lack_durability); 0.55::true_val(user_review_forum_durability, unk_user_review_forum_durability).
measured(s47, user_review_forum_durability, notorious_lack_durability).
all_consistent(user_review_forum_durability) :- consistent(s47, user_review_forum_durability).
evidence(all_consistent(user_review_forum_durability)).
query(true_val(user_review_forum_durability, notorious_lack_durability)).
query(true_val(user_review_forum_durability, unk_user_review_forum_durability)).

% @attr sustainability_certification_donation
% @type categorical
% @canonical false
% @original_name sustainability_certification (Orca Conservancy donation)
% @values orca_conservancy_donation=Portion_of_sale_donated_Orca_Conservancy_Salish_Sea unk_sustainability_certification_donation=Unknown
% @importance 0.85

0.90::acc(s_merch, sustainability_certification_donation).
0.90::true_val(sustainability_certification_donation, orca_conservancy_donation); 0.10::true_val(sustainability_certification_donation, unk_sustainability_certification_donation).
measured(s_merch, sustainability_certification_donation, orca_conservancy_donation).
all_consistent(sustainability_certification_donation) :-
    (indep(s_merch), consistent(s_merch, sustainability_certification_donation) ; \+indep(s_merch)).
evidence(all_consistent(sustainability_certification_donation)).
query(true_val(sustainability_certification_donation, orca_conservancy_donation)).
query(true_val(sustainability_certification_donation, unk_sustainability_certification_donation)).

% @attr sustainability_certification_hydro
% @type categorical
% @canonical false
% @original_name sustainability_certification (hydroelectric)
% @values wa_89_6pct_hydro=Washington_State_electricity_89_6pct_hydroelectric unk_sustainability_certification_hydro=Unknown
% @importance 0.45

0.82::acc(s73, sustainability_certification_hydro).
0.82::true_val(sustainability_certification_hydro, wa_89_6pct_hydro); 0.18::true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro).
measured(s73, sustainability_certification_hydro, wa_89_6pct_hydro).
all_consistent(sustainability_certification_hydro) :-
    (indep(s73), consistent(s73, sustainability_certification_hydro) ; \+indep(s73)).
evidence(all_consistent(sustainability_certification_hydro)).
query(true_val(sustainability_certification_hydro, wa_89_6pct_hydro)).
query(true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro)).

% @attr sustainability_certification_biodiesel
% @type categorical
% @canonical false
% @original_name sustainability_certification (biodiesel)
% @values runs_biodiesel=Runs_on_renewable_based_biodiesel unk_sustainability_certification_biodiesel=Unknown
% @importance 0.45

0.82::acc(s73, sustainability_certification_biodiesel).
0.82::true_val(sustainability_certification_biodiesel, runs_biodiesel); 0.18::true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel).
measured(s73, sustainability_certification_biodiesel, runs_biodiesel).
all_consistent(sustainability_certification_biodiesel) :-
    (indep(s73), consistent(s73, sustainability_certification_biodiesel) ; \+indep(s73)).
evidence(all_consistent(sustainability_certification_biodiesel)).
query(true_val(sustainability_certification_biodiesel, runs_biodiesel)).
query(true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values one_year_mfr_defects=1_year_against_manufacturers_defects_from_purchase unk_warranty=Unknown
% @importance 0.775

0.95::acc(s102, warranty).
0.85::acc(s105, warranty).
0.95::true_val(warranty, one_year_mfr_defects); 0.05::true_val(warranty, unk_warranty).
measured(s102, warranty, one_year_mfr_defects).
measured(s105, warranty, one_year_mfr_defects).
all_consistent(warranty) :-
    (indep(s102), consistent(s102, warranty) ; \+indep(s102)),
    (indep(s105), consistent(s105, warranty) ; \+indep(s105)).
evidence(all_consistent(warranty)).
query(true_val(warranty, one_year_mfr_defects)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty (coverage detail)
% @values materials_workmanship_only=Covers_defects_materials_workmanship_not_impact_abuse_wear unk_warranty_coverage=Unknown
% @importance 0.75

0.82::acc(s105, warranty_coverage).
0.82::true_val(warranty_coverage, materials_workmanship_only); 0.18::true_val(warranty_coverage, unk_warranty_coverage).
measured(s105, warranty_coverage, materials_workmanship_only).
all_consistent(warranty_coverage) :-
    (indep(s105), consistent(s105, warranty_coverage) ; \+indep(s105)).
evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, materials_workmanship_only)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

% @attr b_grades
% @type categorical
% @canonical false
% @original_name B-Grades
% @values cosmetic_only_full_warranty=Mild_cosmetic_imperfections_no_performance_impact_full_warranty unk_b_grades=Unknown
% @importance 0.4

0.90::acc(s111, b_grades).
0.90::true_val(b_grades, cosmetic_only_full_warranty); 0.10::true_val(b_grades, unk_b_grades).
measured(s111, b_grades, cosmetic_only_full_warranty).
all_consistent(b_grades) :-
    (indep(s111), consistent(s111, b_grades) ; \+indep(s111)).
evidence(all_consistent(b_grades)).
query(true_val(b_grades, cosmetic_only_full_warranty)).
query(true_val(b_grades, unk_b_grades)).

% @attr user_review_forum_warranty
% @type categorical
% @canonical false
% @original_name user_review_forum (warranty experience)
% @values positive_warranty_experience=Multiple_positive_forum_reports_Mervin_exceeded_expectations unk_user_review_forum_warranty=Unknown
% @importance 0.65

0.50::acc(s103, user_review_forum_warranty).
0.50::true_val(user_review_forum_warranty, positive_warranty_experience); 0.50::true_val(user_review_forum_warranty, unk_user_review_forum_warranty).
measured(s103, user_review_forum_warranty, positive_warranty_experience).
all_consistent(user_review_forum_warranty) :- consistent(s103, user_review_forum_warranty).
evidence(all_consistent(user_review_forum_warranty)).
query(true_val(user_review_forum_warranty, positive_warranty_experience)).
query(true_val(user_review_forum_warranty, unk_user_review_forum_warranty)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values golden_orca_2027=Lib_Tech_Golden_Orca_2027_849_99_Firepower_volume_shift unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.88::acc(s13, comparable_board_same_brand).
0.88::true_val(comparable_board_same_brand, golden_orca_2027); 0.12::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
measured(s13, comparable_board_same_brand, golden_orca_2027).
all_consistent(comparable_board_same_brand) :- consistent(s13, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, golden_orca_2027)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_split
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (splitboard)
% @values orca_ii_techno_split=Lib_Tech_Orca_II_Techno_Split_2027_carbon_volume_shift_3cm unk_comparable_board_same_brand_split=Unknown
% @importance 0.5

0.85::acc(s8, comparable_board_same_brand_split).
0.85::true_val(comparable_board_same_brand_split, orca_ii_techno_split); 0.15::true_val(comparable_board_same_brand_split, unk_comparable_board_same_brand_split).
measured(s8, comparable_board_same_brand_split, orca_ii_techno_split).
all_consistent(comparable_board_same_brand_split) :- consistent(s8, comparable_board_same_brand_split).
evidence(all_consistent(comparable_board_same_brand_split)).
query(true_val(comparable_board_same_brand_split, orca_ii_techno_split)).
query(true_val(comparable_board_same_brand_split, unk_comparable_board_same_brand_split)).

% @attr comparable_board_same_brand_apex
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Apex Orca prior gen)
% @values apex_orca_prior=Lib_Tech_Apex_Orca_lightweight_carbon_same_shape unk_comparable_board_same_brand_apex=Unknown
% @importance 0.5

0.85::acc(s29, comparable_board_same_brand_apex).
0.85::true_val(comparable_board_same_brand_apex, apex_orca_prior); 0.15::true_val(comparable_board_same_brand_apex, unk_comparable_board_same_brand_apex).
measured(s29, comparable_board_same_brand_apex, apex_orca_prior).
all_consistent(comparable_board_same_brand_apex) :- consistent(s29, comparable_board_same_brand_apex).
evidence(all_consistent(comparable_board_same_brand_apex)).
query(true_val(comparable_board_same_brand_apex, apex_orca_prior)).
query(true_val(comparable_board_same_brand_apex, unk_comparable_board_same_brand_apex)).

% @attr comparable_board_same_brand_apex_ii
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Apex Orca II 2027)
% @values apex_orca_ii_2027=Lib_Tech_Apex_Orca_II_2027_unidirectional_carbon_Anti_Matter unk_comparable_board_same_brand_apex_ii=Unknown
% @importance 0.5

0.75::acc(s101, comparable_board_same_brand_apex_ii).
0.75::true_val(comparable_board_same_brand_apex_ii, apex_orca_ii_2027); 0.25::true_val(comparable_board_same_brand_apex_ii, unk_comparable_board_same_brand_apex_ii).
measured(s101, comparable_board_same_brand_apex_ii, apex_orca_ii_2027).
all_consistent(comparable_board_same_brand_apex_ii) :-
    (indep(s101), consistent(s101, comparable_board_same_brand_apex_ii) ; \+indep(s101)).
evidence(all_consistent(comparable_board_same_brand_apex_ii)).
query(true_val(comparable_board_same_brand_apex_ii, apex_orca_ii_2027)).
query(true_val(comparable_board_same_brand_apex_ii, unk_comparable_board_same_brand_apex_ii)).

% @attr comparable_board_same_brand_orca_2026
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Orca 2026)
% @values orca_2026_699_sale_489=Lib_Tech_T_Rice_Orca_2026_699_99_sale_489_99 unk_comparable_board_same_brand_orca_2026=Unknown
% @importance 0.7

0.85::acc(s58, comparable_board_same_brand_orca_2026).
0.85::true_val(comparable_board_same_brand_orca_2026, orca_2026_699_sale_489); 0.15::true_val(comparable_board_same_brand_orca_2026, unk_comparable_board_same_brand_orca_2026).
measured(s58, comparable_board_same_brand_orca_2026, orca_2026_699_sale_489).
all_consistent(comparable_board_same_brand_orca_2026) :-
    (indep(s58), consistent(s58, comparable_board_same_brand_orca_2026) ; \+indep(s58)).
evidence(all_consistent(comparable_board_same_brand_orca_2026)).
query(true_val(comparable_board_same_brand_orca_2026, orca_2026_699_sale_489)).
query(true_val(comparable_board_same_brand_orca_2026, unk_comparable_board_same_brand_orca_2026)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values ns_harpoon=Never_Summer_Harpoon_Orca_clone_softer_flex_better_freestyle unk_comparable_board_cross_brand=Unknown
% @importance 0.75

0.60::acc(s47, comparable_board_cross_brand).
0.60::true_val(comparable_board_cross_brand, ns_harpoon); 0.40::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
measured(s47, comparable_board_cross_brand, ns_harpoon).
all_consistent(comparable_board_cross_brand) :- consistent(s47, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, ns_harpoon)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_mind_expander
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mind Expander)
% @values jones_mind_expander=Jones_Mind_Expander_full_rocker_spoon_nose_more_surfy unk_cb_mind_expander=Unknown
% @importance 0.65

0.78::acc(s85, comparable_board_cross_brand_mind_expander).
0.78::true_val(comparable_board_cross_brand_mind_expander, jones_mind_expander); 0.22::true_val(comparable_board_cross_brand_mind_expander, unk_cb_mind_expander).
measured(s85, comparable_board_cross_brand_mind_expander, jones_mind_expander).
all_consistent(comparable_board_cross_brand_mind_expander) :- consistent(s85, comparable_board_cross_brand_mind_expander).
evidence(all_consistent(comparable_board_cross_brand_mind_expander)).
query(true_val(comparable_board_cross_brand_mind_expander, jones_mind_expander)).
query(true_val(comparable_board_cross_brand_mind_expander, unk_cb_mind_expander)).

% @attr comparable_board_cross_brand_psychocandy
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Ride Psychocandy)
% @values ride_psychocandy=Ride_Psychocandy_shorter_wider_tapered_flat_rocker_589_95 unk_cb_psychocandy=Unknown
% @importance 0.6

0.75::acc(s89, comparable_board_cross_brand_psychocandy).
0.75::true_val(comparable_board_cross_brand_psychocandy, ride_psychocandy); 0.25::true_val(comparable_board_cross_brand_psychocandy, unk_cb_psychocandy).
measured(s89, comparable_board_cross_brand_psychocandy, ride_psychocandy).
all_consistent(comparable_board_cross_brand_psychocandy) :- consistent(s89, comparable_board_cross_brand_psychocandy).
evidence(all_consistent(comparable_board_cross_brand_psychocandy)).
query(true_val(comparable_board_cross_brand_psychocandy, ride_psychocandy)).
query(true_val(comparable_board_cross_brand_psychocandy, unk_cb_psychocandy)).

% @attr comparable_board_cross_brand_flagship
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Flagship)
% @values jones_flagship=Jones_Flagship_stiffer_backcountry_similar_hybrid_rocker unk_cb_flagship=Unknown
% @importance 0.65

0.75::acc(s85, comparable_board_cross_brand_flagship).
0.75::true_val(comparable_board_cross_brand_flagship, jones_flagship); 0.25::true_val(comparable_board_cross_brand_flagship, unk_cb_flagship).
measured(s85, comparable_board_cross_brand_flagship, jones_flagship).
all_consistent(comparable_board_cross_brand_flagship) :- consistent(s85, comparable_board_cross_brand_flagship).
evidence(all_consistent(comparable_board_cross_brand_flagship)).
query(true_val(comparable_board_cross_brand_flagship, jones_flagship)).
query(true_val(comparable_board_cross_brand_flagship, unk_cb_flagship)).

% @attr comparable_board_cross_brand_transition_finder
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Korua Transition Finder)
% @values korua_transition_finder=Korua_Transition_Finder_volume_shifted_directional unk_cb_transition_finder=Unknown
% @importance 0.65

0.72::acc(s85, comparable_board_cross_brand_transition_finder).
0.72::true_val(comparable_board_cross_brand_transition_finder, korua_transition_finder); 0.28::true_val(comparable_board_cross_brand_transition_finder, unk_cb_transition_finder).
measured(s85, comparable_board_cross_brand_transition_finder, korua_transition_finder).
all_consistent(comparable_board_cross_brand_transition_finder) :- consistent(s85, comparable_board_cross_brand_transition_finder).
evidence(all_consistent(comparable_board_cross_brand_transition_finder)).
query(true_val(comparable_board_cross_brand_transition_finder, korua_transition_finder)).
query(true_val(comparable_board_cross_brand_transition_finder, unk_cb_transition_finder)).

% @attr comparable_board_cross_brand_party_wave
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Bataleon Party Wave II)
% @values bataleon_party_wave_ii=Bataleon_Party_Wave_II_short_wide_alternative unk_cb_party_wave=Unknown
% @importance 0.7

0.55::acc(s82, comparable_board_cross_brand_party_wave).
0.55::true_val(comparable_board_cross_brand_party_wave, bataleon_party_wave_ii); 0.45::true_val(comparable_board_cross_brand_party_wave, unk_cb_party_wave).
measured(s82, comparable_board_cross_brand_party_wave, bataleon_party_wave_ii).
all_consistent(comparable_board_cross_brand_party_wave) :- consistent(s82, comparable_board_cross_brand_party_wave).
evidence(all_consistent(comparable_board_cross_brand_party_wave)).
query(true_val(comparable_board_cross_brand_party_wave, bataleon_party_wave_ii)).
query(true_val(comparable_board_cross_brand_party_wave, unk_cb_party_wave)).

% @attr comparable_board_cross_brand_yes_hybrid
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes Hybrid)
% @values yes_hybrid=Yes_Hybrid_similar_category unk_cb_yes_hybrid=Unknown
% @importance 0.65

0.72::acc(s85, comparable_board_cross_brand_yes_hybrid).
0.72::true_val(comparable_board_cross_brand_yes_hybrid, yes_hybrid); 0.28::true_val(comparable_board_cross_brand_yes_hybrid, unk_cb_yes_hybrid).
measured(s85, comparable_board_cross_brand_yes_hybrid, yes_hybrid).
all_consistent(comparable_board_cross_brand_yes_hybrid) :- consistent(s85, comparable_board_cross_brand_yes_hybrid).
evidence(all_consistent(comparable_board_cross_brand_yes_hybrid)).
query(true_val(comparable_board_cross_brand_yes_hybrid, yes_hybrid)).
query(true_val(comparable_board_cross_brand_yes_hybrid, unk_cb_yes_hybrid)).

% @attr comparable_board_cross_brand_gremlin
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (GNU Gremlin)
% @values gnu_gremlin=GNU_Gremlin_Mervin_C3_profile_more_locked_in_ice unk_cb_gremlin=Unknown
% @importance 0.9

0.78::acc(s65, comparable_board_cross_brand_gremlin).
0.78::true_val(comparable_board_cross_brand_gremlin, gnu_gremlin); 0.22::true_val(comparable_board_cross_brand_gremlin, unk_cb_gremlin).
measured(s65, comparable_board_cross_brand_gremlin, gnu_gremlin).
all_consistent(comparable_board_cross_brand_gremlin) :- consistent(s65, comparable_board_cross_brand_gremlin).
evidence(all_consistent(comparable_board_cross_brand_gremlin)).
query(true_val(comparable_board_cross_brand_gremlin, gnu_gremlin)).
query(true_val(comparable_board_cross_brand_gremlin, unk_cb_gremlin)).

% @attr comparable_board_cross_brand_dancehaul
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Salomon Dancehaul)
% @values salomon_dancehaul=Salomon_Dancehaul_volume_shifted_directional unk_cb_dancehaul=Unknown
% @importance 0.75

0.60::acc(s47, comparable_board_cross_brand_dancehaul).
0.60::true_val(comparable_board_cross_brand_dancehaul, salomon_dancehaul); 0.40::true_val(comparable_board_cross_brand_dancehaul, unk_cb_dancehaul).
measured(s47, comparable_board_cross_brand_dancehaul, salomon_dancehaul).
all_consistent(comparable_board_cross_brand_dancehaul) :- consistent(s47, comparable_board_cross_brand_dancehaul).
evidence(all_consistent(comparable_board_cross_brand_dancehaul)).
query(true_val(comparable_board_cross_brand_dancehaul, salomon_dancehaul)).
query(true_val(comparable_board_cross_brand_dancehaul, unk_cb_dancehaul)).

% @attr comparable_board_cross_brand_hovercraft
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Hovercraft 2.0)
% @values jones_hovercraft=Jones_Hovercraft_2_0_dedicated_powder_great_float unk_cb_hovercraft=Unknown
% @importance 0.65

0.72::acc(s85, comparable_board_cross_brand_hovercraft).
0.72::true_val(comparable_board_cross_brand_hovercraft, jones_hovercraft); 0.28::true_val(comparable_board_cross_brand_hovercraft, unk_cb_hovercraft).
measured(s85, comparable_board_cross_brand_hovercraft, jones_hovercraft).
all_consistent(comparable_board_cross_brand_hovercraft) :- consistent(s85, comparable_board_cross_brand_hovercraft).
evidence(all_consistent(comparable_board_cross_brand_hovercraft)).
query(true_val(comparable_board_cross_brand_hovercraft, jones_hovercraft)).
query(true_val(comparable_board_cross_brand_hovercraft, unk_cb_hovercraft)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name Retailer (evo.com)
% @values evo_us_5pct_match=evo_com_major_US_5pct_price_match_free_shipping_1yr_returns unk_retailer_evo=Unknown
% @importance 0.5

0.85::acc(s52, retailer_evo).
0.85::true_val(retailer_evo, evo_us_5pct_match); 0.15::true_val(retailer_evo, unk_retailer_evo).
measured(s52, retailer_evo, evo_us_5pct_match).
all_consistent(retailer_evo) :-
    (indep(s52), consistent(s52, retailer_evo) ; \+indep(s52)).
evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, evo_us_5pct_match)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_libtech
% @type categorical
% @canonical false
% @original_name Retailer (lib-tech.com)
% @values libtech_direct_free_ship_75=Lib_Tech_direct_free_shipping_over_75 unk_retailer_libtech=Unknown
% @importance 1.0

0.93::acc(s1, retailer_libtech).
0.93::true_val(retailer_libtech, libtech_direct_free_ship_75); 0.07::true_val(retailer_libtech, unk_retailer_libtech).
measured(s1, retailer_libtech, libtech_direct_free_ship_75).
all_consistent(retailer_libtech) :- consistent(s1, retailer_libtech).
evidence(all_consistent(retailer_libtech)).
query(true_val(retailer_libtech, libtech_direct_free_ship_75)).
query(true_val(retailer_libtech, unk_retailer_libtech)).

% @attr retailer_tactics
% @type categorical
% @canonical false
% @original_name Retailer (Tactics.com)
% @values tactics_free_ship_99=Tactics_com_US_free_shipping_99_carries_2026_model unk_retailer_tactics=Unknown
% @importance 0.7

0.80::acc(s26, retailer_tactics).
0.80::true_val(retailer_tactics, tactics_free_ship_99); 0.20::true_val(retailer_tactics, unk_retailer_tactics).
measured(s26, retailer_tactics, tactics_free_ship_99).
all_consistent(retailer_tactics) :-
    (indep(s26), consistent(s26, retailer_tactics) ; \+indep(s26)).
evidence(all_consistent(retailer_tactics)).
query(true_val(retailer_tactics, tactics_free_ship_99)).
query(true_val(retailer_tactics, unk_retailer_tactics)).

% @attr retailer_blauer
% @type categorical
% @canonical false
% @original_name Retailer (Blauer Board Shop)
% @values blauer_specialty_expert=Blauer_Board_Shop_specialty_expert_guidance unk_retailer_blauer=Unknown
% @importance 0.8

0.78::acc(s34, retailer_blauer).
0.78::true_val(retailer_blauer, blauer_specialty_expert); 0.22::true_val(retailer_blauer, unk_retailer_blauer).
measured(s34, retailer_blauer, blauer_specialty_expert).
all_consistent(retailer_blauer) :-
    (indep(s34), consistent(s34, retailer_blauer) ; \+indep(s34)).
evidence(all_consistent(retailer_blauer)).
query(true_val(retailer_blauer, blauer_specialty_expert)).
query(true_val(retailer_blauer, unk_retailer_blauer)).

% @attr retailer_darkside
% @type categorical
% @canonical false
% @original_name Retailer (Darkside Snowboards)
% @values darkside_vt_free_ship_99_14day=Darkside_Vermont_free_shipping_99_14_day_returns unk_retailer_darkside=Unknown
% @importance 0.35

0.70::acc(s38, retailer_darkside).
0.70::true_val(retailer_darkside, darkside_vt_free_ship_99_14day); 0.30::true_val(retailer_darkside, unk_retailer_darkside).
measured(s38, retailer_darkside, darkside_vt_free_ship_99_14day).
all_consistent(retailer_darkside) :-
    (indep(s38), consistent(s38, retailer_darkside) ; \+indep(s38)).
evidence(all_consistent(retailer_darkside)).
query(true_val(retailer_darkside, darkside_vt_free_ship_99_14day)).
query(true_val(retailer_darkside, unk_retailer_darkside)).

% @attr retailer_rudeboys
% @type categorical
% @canonical false
% @original_name Retailer (Rude Boys)
% @values rudeboys_banff_ab=Rude_Boys_brick_mortar_Banff_Alberta_Canada unk_retailer_rudeboys=Unknown
% @importance 0.4

0.65::acc(s5, retailer_rudeboys).
0.65::true_val(retailer_rudeboys, rudeboys_banff_ab); 0.35::true_val(retailer_rudeboys, unk_retailer_rudeboys).
measured(s5, retailer_rudeboys, rudeboys_banff_ab).
all_consistent(retailer_rudeboys) :-
    (indep(s5), consistent(s5, retailer_rudeboys) ; \+indep(s5)).
evidence(all_consistent(retailer_rudeboys)).
query(true_val(retailer_rudeboys, rudeboys_banff_ab)).
query(true_val(retailer_rudeboys, unk_retailer_rudeboys)).

% @attr retailer_one_boardshop
% @type categorical
% @canonical false
% @original_name Retailer (ONE Boardshop)
% @values one_boardshop_cad=ONE_Boardshop_CAD_pricing_online unk_retailer_one_boardshop=Unknown
% @importance 0.7

0.75::acc(s100, retailer_one_boardshop).
0.75::true_val(retailer_one_boardshop, one_boardshop_cad); 0.25::true_val(retailer_one_boardshop, unk_retailer_one_boardshop).
measured(s100, retailer_one_boardshop, one_boardshop_cad).
all_consistent(retailer_one_boardshop) :-
    (indep(s100), consistent(s100, retailer_one_boardshop) ; \+indep(s100)).
evidence(all_consistent(retailer_one_boardshop)).
query(true_val(retailer_one_boardshop, one_boardshop_cad)).
query(true_val(retailer_one_boardshop, unk_retailer_one_boardshop)).

% @attr retailer_empire
% @type categorical
% @canonical false
% @original_name Retailer (EMPIRE)
% @values empire_in_stock_30day=EMPIRE_in_stock_30_day_returns unk_retailer_empire=Unknown
% @importance 0.4

0.75::acc(s41, retailer_empire).
0.75::true_val(retailer_empire, empire_in_stock_30day); 0.25::true_val(retailer_empire, unk_retailer_empire).
measured(s41, retailer_empire, empire_in_stock_30day).
all_consistent(retailer_empire) :-
    (indep(s41), consistent(s41, retailer_empire) ; \+indep(s41)).
evidence(all_consistent(retailer_empire)).
query(true_val(retailer_empire, empire_in_stock_30day)).
query(true_val(retailer_empire, unk_retailer_empire)).

% @attr retailer_ballistyx
% @type categorical
% @canonical false
% @original_name Retailer (Ballistyx)
% @values ballistyx_au_preorder_tshirt=Ballistyx_Australian_preorder_bonus_t_shirt unk_retailer_ballistyx=Unknown
% @importance 0.5

0.72::acc(s94, retailer_ballistyx).
0.72::true_val(retailer_ballistyx, ballistyx_au_preorder_tshirt); 0.28::true_val(retailer_ballistyx, unk_retailer_ballistyx).
measured(s94, retailer_ballistyx, ballistyx_au_preorder_tshirt).
all_consistent(retailer_ballistyx) :-
    (indep(s94), consistent(s94, retailer_ballistyx) ; \+indep(s94)).
evidence(all_consistent(retailer_ballistyx)).
query(true_val(retailer_ballistyx, ballistyx_au_preorder_tshirt)).
query(true_val(retailer_ballistyx, unk_retailer_ballistyx)).

% @attr retailer_balmoral
% @type categorical
% @canonical false
% @original_name Retailer (Balmoral Boards)
% @values balmoral_au_preorder_apr_may=Balmoral_Boards_Australian_preorder_Apr_May_delivery unk_retailer_balmoral=Unknown
% @importance 0.5

0.70::acc(s97, retailer_balmoral).
0.70::true_val(retailer_balmoral, balmoral_au_preorder_apr_may); 0.30::true_val(retailer_balmoral, unk_retailer_balmoral).
measured(s97, retailer_balmoral, balmoral_au_preorder_apr_may).
all_consistent(retailer_balmoral) :-
    (indep(s97), consistent(s97, retailer_balmoral) ; \+indep(s97)).
evidence(all_consistent(retailer_balmoral)).
query(true_val(retailer_balmoral, balmoral_au_preorder_apr_may)).
query(true_val(retailer_balmoral, unk_retailer_balmoral)).

% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Retailer (Melbourne Snowboard Centre)
% @values melbourne_sc_au=Melbourne_Snowboard_Centre_Australian_retailer unk_retailer_melbourne_snowboard=Unknown
% @importance 0.35

0.65::acc(s30, retailer_melbourne_snowboard).
0.65::true_val(retailer_melbourne_snowboard, melbourne_sc_au); 0.35::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).
measured(s30, retailer_melbourne_snowboard, melbourne_sc_au).
all_consistent(retailer_melbourne_snowboard) :-
    (indep(s30), consistent(s30, retailer_melbourne_snowboard) ; \+indep(s30)).
evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, melbourne_sc_au)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

% @attr retailer_boardhouse
% @type categorical
% @canonical false
% @original_name Retailer (Boardhouse NZ)
% @values boardhouse_nz_preorder=Boardhouse_New_Zealand_preorder unk_retailer_boardhouse=Unknown
% @importance 0.3

0.65::acc(s37, retailer_boardhouse).
0.65::true_val(retailer_boardhouse, boardhouse_nz_preorder); 0.35::true_val(retailer_boardhouse, unk_retailer_boardhouse).
measured(s37, retailer_boardhouse, boardhouse_nz_preorder).
all_consistent(retailer_boardhouse) :-
    (indep(s37), consistent(s37, retailer_boardhouse) ; \+indep(s37)).
evidence(all_consistent(retailer_boardhouse)).
query(true_val(retailer_boardhouse, boardhouse_nz_preorder)).
query(true_val(retailer_boardhouse, unk_retailer_boardhouse)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard=Standard unk_width_options=Unknown
% @importance 0.85

0.90::acc(s_merch, width_options).
0.90::true_val(width_options, standard); 0.10::true_val(width_options, unk_width_options).
measured(s_merch, width_options, standard).
all_consistent(width_options) :-
    (indep(s_merch), consistent(s_merch, width_options) ; \+indep(s_merch)).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

% @attr construction_material_innovation_whale_tail
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Whale Tail)
% @values whale_tail_tech=Whale_Tail_Technology_contact_maximizing_short_radius_tail unk_cmi_whale_tail=Unknown
% @importance 1.0

0.93::acc(s1, construction_material_innovation_whale_tail).
0.93::true_val(construction_material_innovation_whale_tail, whale_tail_tech); 0.07::true_val(construction_material_innovation_whale_tail, unk_cmi_whale_tail).
measured(s1, construction_material_innovation_whale_tail, whale_tail_tech).
all_consistent(construction_material_innovation_whale_tail) :- consistent(s1, construction_material_innovation_whale_tail).
evidence(all_consistent(construction_material_innovation_whale_tail)).
query(true_val(construction_material_innovation_whale_tail, whale_tail_tech)).
query(true_val(construction_material_innovation_whale_tail, unk_cmi_whale_tail)).

% @attr sidecut_type
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values tight_7m_trench_gouging=Tight_7m_trench_gouging_sidecut unk_sidecut_type=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_type).
0.93::true_val(sidecut_type, tight_7m_trench_gouging); 0.07::true_val(sidecut_type, unk_sidecut_type).
measured(s1, sidecut_type, tight_7m_trench_gouging).
all_consistent(sidecut_type) :- consistent(s1, sidecut_type).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, tight_7m_trench_gouging)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_flex=Directional_flex unk_flex_direction=Unknown
% @importance 0.95

0.85::acc(s35, flex_direction).
0.85::true_val(flex_direction, directional_flex); 0.15::true_val(flex_direction, unk_flex_direction).
measured(s35, flex_direction, directional_flex).
all_consistent(flex_direction) :- consistent(s35, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr redesign_year
% @type categorical
% @canonical false
% @original_name redesign_year
% @values new_eco_construction_nose_tail=New_environmentally_friendly_construction_new_nose_switch_friendly_tail unk_redesign_year=Unknown
% @importance 0.95

0.85::acc(s35, redesign_year).
0.85::true_val(redesign_year, new_eco_construction_nose_tail); 0.15::true_val(redesign_year, unk_redesign_year).
measured(s35, redesign_year, new_eco_construction_nose_tail).
all_consistent(redesign_year) :- consistent(s35, redesign_year).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, new_eco_construction_nose_tail)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr reviewer_opinion_tgr_subtle
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (subtle upgrades)
% @values subtle_upgrades=Subtle_performance_upgrades_many_wont_notice_weight_or_shape unk_reviewer_opinion_tgr_subtle=Unknown
% @importance 0.9

0.78::acc(s65, reviewer_opinion_tgr_subtle).
0.78::true_val(reviewer_opinion_tgr_subtle, subtle_upgrades); 0.22::true_val(reviewer_opinion_tgr_subtle, unk_reviewer_opinion_tgr_subtle).
measured(s65, reviewer_opinion_tgr_subtle, subtle_upgrades).
all_consistent(reviewer_opinion_tgr_subtle) :- consistent(s65, reviewer_opinion_tgr_subtle).
evidence(all_consistent(reviewer_opinion_tgr_subtle)).
query(true_val(reviewer_opinion_tgr_subtle, subtle_upgrades)).
query(true_val(reviewer_opinion_tgr_subtle, unk_reviewer_opinion_tgr_subtle)).

% @attr reviewer_opinion_tgr_switch
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (switch recommendation)
% @values worthwhile_30pct_switch=Worthwhile_if_you_ride_switch_30pct_or_more unk_reviewer_opinion_tgr_switch=Unknown
% @importance 0.85

0.82::acc(s42, reviewer_opinion_tgr_switch).
0.82::true_val(reviewer_opinion_tgr_switch, worthwhile_30pct_switch); 0.18::true_val(reviewer_opinion_tgr_switch, unk_reviewer_opinion_tgr_switch).
measured(s42, reviewer_opinion_tgr_switch, worthwhile_30pct_switch).
all_consistent(reviewer_opinion_tgr_switch) :- consistent(s42, reviewer_opinion_tgr_switch).
evidence(all_consistent(reviewer_opinion_tgr_switch)).
query(true_val(reviewer_opinion_tgr_switch, worthwhile_30pct_switch)).
query(true_val(reviewer_opinion_tgr_switch, unk_reviewer_opinion_tgr_switch)).

% @attr terrain_suitability_quiver
% @type categorical
% @canonical false
% @original_name terrain_suitability (quiver board)
% @values best_powder_freeride_quiver=Best_powder_freeride_quiver_not_one_quiver_for_most unk_terrain_suitability_quiver=Unknown
% @importance 0.75

0.78::acc(s15, terrain_suitability_quiver).
0.78::true_val(terrain_suitability_quiver, best_powder_freeride_quiver); 0.22::true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver).
measured(s15, terrain_suitability_quiver, best_powder_freeride_quiver).
all_consistent(terrain_suitability_quiver) :- consistent(s15, terrain_suitability_quiver).
evidence(all_consistent(terrain_suitability_quiver)).
query(true_val(terrain_suitability_quiver, best_powder_freeride_quiver)).
query(true_val(terrain_suitability_quiver, unk_terrain_suitability_quiver)).

% @attr terrain_suitability_daily
% @type categorical
% @canonical false
% @original_name terrain_suitability (daily driver)
% @values can_be_daily_driver=Some_reviewers_say_CAN_be_daily_driver_all_season unk_terrain_suitability_daily=Unknown
% @importance 0.9

0.78::acc(s16, terrain_suitability_daily).
0.78::true_val(terrain_suitability_daily, can_be_daily_driver); 0.22::true_val(terrain_suitability_daily, unk_terrain_suitability_daily).
measured(s16, terrain_suitability_daily, can_be_daily_driver).
all_consistent(terrain_suitability_daily) :- consistent(s16, terrain_suitability_daily).
evidence(all_consistent(terrain_suitability_daily)).
query(true_val(terrain_suitability_daily, can_be_daily_driver)).
query(true_val(terrain_suitability_daily, unk_terrain_suitability_daily)).