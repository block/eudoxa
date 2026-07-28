0.15::indep(s7).
0.25::indep(s14).
0.15::indep(s17).
0.20::indep(s27).
0.15::indep(s32).
0.20::indep(s33).
0.15::indep(s_merchant).
0.15::indep(s23).
0.20::indep(s31).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, lib_tech); 0.05::true_val(brand, unk_brand).
0.95::acc(s1, brand).
measured(s1, brand, lib_tech).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values trs=TRS_Total_Ripper_Series unk_model_name=Unknown
% @importance 1.0

0.95::true_val(model_name, trs); 0.05::true_val(model_name, unk_model_name).
0.95::acc(s1, model_name).
measured(s1, model_name, trs).
all_consistent(model_name) :- consistent(s1, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, trs)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2025=2025 unk_model_year=Unknown
% @importance 1.0

0.95::true_val(model_year, y2025); 0.05::true_val(model_year, unk_model_year).
0.95::acc(s1, model_year).
measured(s1, model_year, y2025).
all_consistent(model_year) :- consistent(s1, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2025)).
query(true_val(model_year, unk_model_year)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU
% @values trs_hp=trs-hp unk_sku=Unknown
% @importance 1.0

0.95::true_val(sku, trs_hp); 0.05::true_val(sku, unk_sku).
0.95::acc(s1, sku).
measured(s1, sku, trs_hp).
all_consistent(sku) :- consistent(s1, sku).
evidence(all_consistent(sku)).
query(true_val(sku, trs_hp)).
query(true_val(sku, unk_sku)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2006_07=2006-2007_season unk_model_first_available_year=Unknown
% @importance 0.6

0.76::true_val(model_first_available_year, season_2006_07); 0.24::true_val(model_first_available_year, unk_model_first_available_year).
0.80::acc(s2, model_first_available_year).
measured(s2, model_first_available_year, season_2006_07).
all_consistent(model_first_available_year) :- consistent(s2, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2006_07)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year_btx
% @type categorical
% @canonical false
% @original_name redesign_year (BTX era)
% @values y2008_2010=2008-2010 unk_redesign_year_btx=Unknown
% @importance 0.6

0.76::true_val(redesign_year_btx, y2008_2010); 0.24::true_val(redesign_year_btx, unk_redesign_year_btx).
0.80::acc(s2, redesign_year_btx).
measured(s2, redesign_year_btx, y2008_2010).
all_consistent(redesign_year_btx) :- consistent(s2, redesign_year_btx).
evidence(all_consistent(redesign_year_btx)).
query(true_val(redesign_year_btx, y2008_2010)).
query(true_val(redesign_year_btx, unk_redesign_year_btx)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year (C3 camber change)
% @values y2021=2021 unk_redesign_year=Unknown
% @importance 0.53

0.55::true_val(redesign_year, y2021); 0.45::true_val(redesign_year, unk_redesign_year).
0.55::acc(s3, redesign_year).
0.65::acc(s5, redesign_year).
measured(s3, redesign_year, y2021).
measured(s5, redesign_year, y2021).
all_consistent(redesign_year) :- consistent(s3, redesign_year), consistent(s5, redesign_year).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, y2021)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr redesign_year_riser_pads
% @type categorical
% @canonical false
% @original_name redesign_year (riser pads added)
% @values y2022=2022 unk_redesign_year_riser_pads=Unknown
% @importance 0.55

0.41::true_val(redesign_year_riser_pads, y2022); 0.59::true_val(redesign_year_riser_pads, unk_redesign_year_riser_pads).
0.50::acc(s3, redesign_year_riser_pads).
measured(s3, redesign_year_riser_pads, y2022).
all_consistent(redesign_year_riser_pads) :- consistent(s3, redesign_year_riser_pads).
evidence(all_consistent(redesign_year_riser_pads)).
query(true_val(redesign_year_riser_pads, y2022)).
query(true_val(redesign_year_riser_pads, unk_redesign_year_riser_pads)).

% @attr redesign_year_2025
% @type categorical
% @canonical false
% @original_name redesign_year (2025 changes)
% @values not_significant=Not_super_significant_accumulated_small_changes unk_redesign_year_2025=Unknown
% @importance 0.5

0.60::true_val(redesign_year_2025, not_significant); 0.40::true_val(redesign_year_2025, unk_redesign_year_2025).
0.70::acc(s4, redesign_year_2025).
measured(s4, redesign_year_2025, not_significant).
all_consistent(redesign_year_2025) :- consistent(s4, redesign_year_2025).
evidence(all_consistent(redesign_year_2025)).
query(true_val(redesign_year_2025, not_significant)).
query(true_val(redesign_year_2025, unk_redesign_year_2025)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).
0.97::acc(s1, product_type).
measured(s1, product_type, snowboard).
all_consistent(product_type) :- consistent(s1, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.7

0.90::true_val(manufacturer, mervin_manufacturing); 0.10::true_val(manufacturer, unk_manufacturer).
0.82::acc(s6, manufacturer).
measured(s6, manufacturer, mervin_manufacturing).
all_consistent(manufacturer) :- consistent(s6, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values sequim_wa_usa=Hand_built_Sequim_Washington_USA unk_manufacturing_location_current=Unknown
% @importance 0.65

0.90::true_val(manufacturing_location_current, sequim_wa_usa); 0.10::true_val(manufacturing_location_current, unk_manufacturing_location_current).
0.80::acc(s7, manufacturing_location_current).
0.82::acc(s8, manufacturing_location_current).
measured(s7, manufacturing_location_current, sequim_wa_usa).
measured(s8, manufacturing_location_current, sequim_wa_usa).
all_consistent(manufacturing_location_current) :-
    consistent(s8, manufacturing_location_current),
    (indep(s7), consistent(s7, manufacturing_location_current) ; \+indep(s7)).
evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, sequim_wa_usa)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr mervin_us_factory_status
% @type categorical
% @canonical false
% @original_name Mervin US factory status
% @values longest_running_last_major=Longest_running_last_major_board_factory_in_USA unk_mervin_us_factory_status=Unknown
% @importance 0.65

0.72::true_val(mervin_us_factory_status, longest_running_last_major); 0.28::true_val(mervin_us_factory_status, unk_mervin_us_factory_status).
0.80::acc(s8, mervin_us_factory_status).
measured(s8, mervin_us_factory_status, longest_running_last_major).
all_consistent(mervin_us_factory_status) :- consistent(s8, mervin_us_factory_status).
evidence(all_consistent(mervin_us_factory_status)).
query(true_val(mervin_us_factory_status, longest_running_last_major)).
query(true_val(mervin_us_factory_status, unk_mervin_us_factory_status)).

% @attr mervin_factory_size
% @type categorical
% @canonical false
% @original_name Mervin factory size
% @values over_60k_sqft=Over_60000_square_feet unk_mervin_factory_size=Unknown
% @importance 0.55

0.77::true_val(mervin_factory_size, over_60k_sqft); 0.23::true_val(mervin_factory_size, unk_mervin_factory_size).
0.85::acc(s9, mervin_factory_size).
measured(s9, mervin_factory_size, over_60k_sqft).
all_consistent(mervin_factory_size) :- consistent(s9, mervin_factory_size).
evidence(all_consistent(mervin_factory_size)).
query(true_val(mervin_factory_size, over_60k_sqft)).
query(true_val(mervin_factory_size, unk_mervin_factory_size)).

% @attr mervin_annual_production
% @type categorical
% @canonical false
% @original_name Mervin annual production
% @values approx_100k=Approximately_100000_units_annually unk_mervin_annual_production=Unknown
% @importance 0.55

0.77::true_val(mervin_annual_production, approx_100k); 0.23::true_val(mervin_annual_production, unk_mervin_annual_production).
0.85::acc(s9, mervin_annual_production).
measured(s9, mervin_annual_production, approx_100k).
all_consistent(mervin_annual_production) :- consistent(s9, mervin_annual_production).
evidence(all_consistent(mervin_annual_production)).
query(true_val(mervin_annual_production, approx_100k)).
query(true_val(mervin_annual_production, unk_mervin_annual_production)).

% @attr mervin_ownership
% @type categorical
% @canonical false
% @original_name Mervin ownership
% @values spring_capital_2025=Spring_Capital_Group_acquired_2025 unk_mervin_ownership=Unknown
% @importance 0.4

0.67::true_val(mervin_ownership, spring_capital_2025); 0.33::true_val(mervin_ownership, unk_mervin_ownership).
0.72::acc(s10, mervin_ownership).
measured(s10, mervin_ownership, spring_capital_2025).
all_consistent(mervin_ownership) :- consistent(s10, mervin_ownership).
evidence(all_consistent(mervin_ownership)).
query(true_val(mervin_ownership, spring_capital_2025)).
query(true_val(mervin_ownership, unk_mervin_ownership)).

% @attr mervin_market_share
% @type categorical
% @canonical false
% @original_name Mervin U.S. market share
% @values pct_23_above_500=23pct_for_boards_above_500USD unk_mervin_market_share=Unknown
% @importance 0.55

0.77::true_val(mervin_market_share, pct_23_above_500); 0.23::true_val(mervin_market_share, unk_mervin_market_share).
0.85::acc(s9, mervin_market_share).
measured(s9, mervin_market_share, pct_23_above_500).
all_consistent(mervin_market_share) :- consistent(s9, mervin_market_share).
evidence(all_consistent(mervin_market_share)).
query(true_val(mervin_market_share, pct_23_above_500)).
query(true_val(mervin_market_share, unk_mervin_market_share)).

% @attr mervin_founders
% @type categorical
% @canonical false
% @original_name Mervin founders
% @values olson_saari=Mike_Olson_and_Pete_Saari unk_mervin_founders=Unknown
% @importance 0.7

0.71::true_val(mervin_founders, olson_saari); 0.29::true_val(mervin_founders, unk_mervin_founders).
0.80::acc(s6, mervin_founders).
measured(s6, mervin_founders, olson_saari).
all_consistent(mervin_founders) :- consistent(s6, mervin_founders).
evidence(all_consistent(mervin_founders)).
query(true_val(mervin_founders, olson_saari)).
query(true_val(mervin_founders, unk_mervin_founders)).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Lib Tech brand reputation
% @values weird_functional_grip=Keep_it_weird_functional_edges_grip unk_brand_reputation=Unknown
% @importance 0.5

0.40::true_val(brand_reputation, weird_functional_grip); 0.60::true_val(brand_reputation, unk_brand_reputation).
0.55::acc(s12, brand_reputation).
measured(s12, brand_reputation, weird_functional_grip).
all_consistent(brand_reputation) :- consistent(s12, brand_reputation).
evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, weird_functional_grip)).
query(true_val(brand_reputation, unk_brand_reputation)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v699_99=699.99 v629=629.0
% @importance 0.95

0.70::true_val(price_usd_msrp, v699_99); 0.30::true_val(price_usd_msrp, v629).
0.95::acc(s1, price_usd_msrp).
0.72::acc(s13, price_usd_msrp).
measured(s1, price_usd_msrp, v699_99).
measured(s13, price_usd_msrp, v629).
all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp), consistent(s13, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v699_99)).
query(true_val(price_usd_msrp, v629)).

% @attr price_usd_evo
% @type categorical
% @canonical false
% @original_name price_usd_evo
% @unit USD
% @values v489_99_to_559_99=489.99-559.99_marked_down_from_699.99 unk_price_usd_evo=Unknown
% @importance 0.85

0.90::true_val(price_usd_evo, v489_99_to_559_99); 0.10::true_val(price_usd_evo, unk_price_usd_evo).
0.88::acc(s14, price_usd_evo).
measured(s14, price_usd_evo, v489_99_to_559_99).
all_consistent(price_usd_evo) :- consistent(s14, price_usd_evo).
evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v489_99_to_559_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_the_house
% @type categorical
% @canonical false
% @original_name Price at The House
% @unit USD
% @values v454_99_to_489_99=454.99-489.99_sale unk_price_the_house=Unknown
% @importance 0.9

0.64::true_val(price_the_house, v454_99_to_489_99); 0.36::true_val(price_the_house, unk_price_the_house).
0.75::acc(s13, price_the_house).
measured(s13, price_the_house, v454_99_to_489_99).
all_consistent(price_the_house) :- consistent(s13, price_the_house).
evidence(all_consistent(price_the_house)).
query(true_val(price_the_house, v454_99_to_489_99)).
query(true_val(price_the_house, unk_price_the_house)).

% @attr price_ebay
% @type numeric
% @canonical false
% @original_name Price at eBay
% @unit USD
% @values v545=545.0 unk_price_ebay=Unknown
% @importance 0.7

0.51::true_val(price_ebay, v545); 0.49::true_val(price_ebay, unk_price_ebay).
0.60::acc(s15, price_ebay).
measured(s15, price_ebay, v545).
all_consistent(price_ebay) :- consistent(s15, price_ebay).
evidence(all_consistent(price_ebay)).
query(true_val(price_ebay, v545)).
query(true_val(price_ebay, unk_price_ebay)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v489_95=489.95 unk_price_eur_blue_tomato=Unknown
% @importance 0.9

0.64::true_val(price_eur_blue_tomato, v489_95); 0.36::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).
0.75::acc(s13, price_eur_blue_tomato).
measured(s13, price_eur_blue_tomato, v489_95).
all_consistent(price_eur_blue_tomato) :- consistent(s13, price_eur_blue_tomato).
evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v489_95)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v818_99=818.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant, v818_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).
0.95::acc(s_merchant, price_aud_merchant).
measured(s_merchant, price_aud_merchant, v818_99).
all_consistent(price_aud_merchant) :- consistent(s_merchant, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v818_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_aud_merchant_rrp
% @type numeric
% @canonical false
% @original_name price_aud_merchant RRP
% @unit AUD
% @values v1169_99=1169.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.85

0.95::true_val(price_aud_merchant_rrp, v1169_99); 0.05::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).
0.95::acc(s_merchant, price_aud_merchant_rrp).
measured(s_merchant, price_aud_merchant_rrp, v1169_99).
all_consistent(price_aud_merchant_rrp) :- consistent(s_merchant, price_aud_merchant_rrp).
evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v1169_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values widely_available=Widely_available_multiple_authorized_retailers unk_availability_status=Unknown
% @importance 0.5

0.95::true_val(availability_status, widely_available); 0.05::true_val(availability_status, unk_availability_status).
0.93::acc(s1, availability_status).
0.80::acc(s14, availability_status).
measured(s1, availability_status, widely_available).
measured(s14, availability_status, widely_available).
all_consistent(availability_status) :-
    consistent(s1, availability_status),
    (indep(s14), consistent(s14, availability_status) ; \+indep(s14)).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, widely_available)).
query(true_val(availability_status, unk_availability_status)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values one_year_mfr_defects=One_year_against_manufacturer_defects unk_warranty=Unknown
% @importance 0.8

0.95::true_val(warranty, one_year_mfr_defects); 0.05::true_val(warranty, unk_warranty).
0.95::acc(s21, warranty).
measured(s21, warranty, one_year_mfr_defects).
all_consistent(warranty) :- consistent(s21, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, one_year_mfr_defects)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty (coverage details)
% @values structural_only=Structural_defects_only_no_impact_abuse_wear unk_warranty_coverage=Unknown
% @importance 0.8

0.92::true_val(warranty_coverage, structural_only); 0.08::true_val(warranty_coverage, unk_warranty_coverage).
0.95::acc(s21, warranty_coverage).
measured(s21, warranty_coverage, structural_only).
all_consistent(warranty_coverage) :- consistent(s21, warranty_coverage).
evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, structural_only)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

% @attr warranty_service
% @type categorical
% @canonical false
% @original_name warranty (user service reports)
% @values excellent_reported=Excellent_warranty_service_reported unk_warranty_service=Unknown
% @importance 0.7

0.30::true_val(warranty_service, excellent_reported); 0.70::true_val(warranty_service, unk_warranty_service).
0.50::acc(s22, warranty_service).
measured(s22, warranty_service, excellent_reported).
all_consistent(warranty_service) :- consistent(s22, warranty_service).
evidence(all_consistent(warranty_service)).
query(true_val(warranty_service, excellent_reported)).
query(true_val(warranty_service, unk_warranty_service)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain_twin=Freestyle_All_Mountain_Twin unk_board_category=Unknown
% @importance 0.93

0.95::true_val(board_category, freestyle_all_mountain_twin); 0.05::true_val(board_category, unk_board_category).
0.95::acc(s1, board_category).
0.85::acc(s_merchant, board_category).
measured(s1, board_category, freestyle_all_mountain_twin).
measured(s_merchant, board_category, freestyle_all_mountain_twin).
all_consistent(board_category) :-
    consistent(s1, board_category),
    (indep(s_merchant), consistent(s_merchant, board_category) ; \+indep(s_merchant)).
evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain_twin)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.5

0.90::true_val(gender, mens); 0.10::true_val(gender, unk_gender).
0.82::acc(s23, gender).
measured(s23, gender, mens).
all_consistent(gender) :-
    (indep(s23), consistent(s23, gender) ; \+indep(s23)).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate_advanced=Intermediate_to_Advanced unk_rider_level=Unknown
% @importance 0.85

0.95::true_val(rider_level, intermediate_advanced); 0.05::true_val(rider_level, unk_rider_level).
0.88::acc(s_merchant, rider_level).
measured(s_merchant, rider_level, intermediate_advanced).
all_consistent(rider_level) :- consistent(s_merchant, rider_level).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_Expert unk_skill_level_recommendation=Unknown
% @importance 0.85

0.90::true_val(skill_level_recommendation, advanced_expert); 0.10::true_val(skill_level_recommendation, unk_skill_level_recommendation).
0.82::acc(s14, skill_level_recommendation).
measured(s14, skill_level_recommendation, advanced_expert).
all_consistent(skill_level_recommendation) :-
    (indep(s14), consistent(s14, skill_level_recommendation) ; \+indep(s14)).
evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr skill_level_recommendation_aggressive
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (aggressive)
% @values aggressive_skilled=For_aggressive_skilled_riders unk_skill_level_recommendation_aggressive=Unknown
% @importance 0.85

0.74::true_val(skill_level_recommendation_aggressive, aggressive_skilled); 0.26::true_val(skill_level_recommendation_aggressive, unk_skill_level_recommendation_aggressive).
0.82::acc(s14, skill_level_recommendation_aggressive).
measured(s14, skill_level_recommendation_aggressive, aggressive_skilled).
all_consistent(skill_level_recommendation_aggressive) :-
    (indep(s14), consistent(s14, skill_level_recommendation_aggressive) ; \+indep(s14)).
evidence(all_consistent(skill_level_recommendation_aggressive)).
query(true_val(skill_level_recommendation_aggressive, aggressive_skilled)).
query(true_val(skill_level_recommendation_aggressive, unk_skill_level_recommendation_aggressive)).

% @attr skill_level_recommendation_mfr
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (manufacturer)
% @values progressive_freestyle=Progressive_freestyle_riders_park_to_backcountry unk_skill_level_recommendation_mfr=Unknown
% @importance 1.0

0.92::true_val(skill_level_recommendation_mfr, progressive_freestyle); 0.08::true_val(skill_level_recommendation_mfr, unk_skill_level_recommendation_mfr).
0.93::acc(s1, skill_level_recommendation_mfr).
measured(s1, skill_level_recommendation_mfr, progressive_freestyle).
all_consistent(skill_level_recommendation_mfr) :- consistent(s1, skill_level_recommendation_mfr).
evidence(all_consistent(skill_level_recommendation_mfr)).
query(true_val(skill_level_recommendation_mfr, progressive_freestyle)).
query(true_val(skill_level_recommendation_mfr, unk_skill_level_recommendation_mfr)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_groomers_all_mtn=Park_groomers_all_mountain_pipe_jumps_poor_deep_powder unk_terrain_suitability=Unknown
% @importance 0.88

0.90::true_val(terrain_suitability, park_groomers_all_mtn); 0.10::true_val(terrain_suitability, unk_terrain_suitability).
0.85::acc(s24, terrain_suitability).
0.78::acc(s26, terrain_suitability).
measured(s24, terrain_suitability, park_groomers_all_mtn).
measured(s26, terrain_suitability, park_groomers_all_mtn).
all_consistent(terrain_suitability) :- consistent(s24, terrain_suitability), consistent(s26, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_groomers_all_mtn)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_mfr
% @type categorical
% @canonical false
% @original_name terrain_suitability (manufacturer)
% @values slopestyle_all_mtn_freestyle=Slopestyle_all_mountain_freestyle unk_terrain_suitability_mfr=Unknown
% @importance 1.0

0.92::true_val(terrain_suitability_mfr, slopestyle_all_mtn_freestyle); 0.08::true_val(terrain_suitability_mfr, unk_terrain_suitability_mfr).
0.93::acc(s1, terrain_suitability_mfr).
measured(s1, terrain_suitability_mfr, slopestyle_all_mtn_freestyle).
all_consistent(terrain_suitability_mfr) :- consistent(s1, terrain_suitability_mfr).
evidence(all_consistent(terrain_suitability_mfr)).
query(true_val(terrain_suitability_mfr, slopestyle_all_mtn_freestyle)).
query(true_val(terrain_suitability_mfr, unk_terrain_suitability_mfr)).

% @attr terrain_suitability_conditions
% @type categorical
% @canonical false
% @original_name terrain_suitability (conditions)
% @values hard_icy_wet_coastal=Hard_icy_snow_and_wet_coastal_snowpack unk_terrain_suitability_conditions=Unknown
% @importance 0.88

0.85::true_val(terrain_suitability_conditions, hard_icy_wet_coastal); 0.15::true_val(terrain_suitability_conditions, unk_terrain_suitability_conditions).
0.83::acc(s24, terrain_suitability_conditions).
0.75::acc(s25, terrain_suitability_conditions).
measured(s24, terrain_suitability_conditions, hard_icy_wet_coastal).
measured(s25, terrain_suitability_conditions, hard_icy_wet_coastal).
all_consistent(terrain_suitability_conditions) :- consistent(s24, terrain_suitability_conditions), consistent(s25, terrain_suitability_conditions).
evidence(all_consistent(terrain_suitability_conditions)).
query(true_val(terrain_suitability_conditions, hard_icy_wet_coastal)).
query(true_val(terrain_suitability_conditions, unk_terrain_suitability_conditions)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values aggressive_freestyle_all_mtn=Aggressive_freestyle_shredding_all_mountain_versatility unk_riding_style=Unknown
% @importance 1.0

0.92::true_val(riding_style, aggressive_freestyle_all_mtn); 0.08::true_val(riding_style, unk_riding_style).
0.93::acc(s1, riding_style).
measured(s1, riding_style, aggressive_freestyle_all_mtn).
all_consistent(riding_style) :- consistent(s1, riding_style).
evidence(all_consistent(riding_style)).
query(true_val(riding_style, aggressive_freestyle_all_mtn)).
query(true_val(riding_style, unk_riding_style)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values beginners_deep_powder=Beginners_and_deep_light_powder unk_negative_aspect=Unknown
% @importance 0.88

0.90::true_val(negative_aspect, beginners_deep_powder); 0.10::true_val(negative_aspect, unk_negative_aspect).
0.83::acc(s24, negative_aspect).
0.78::acc(s26, negative_aspect).
0.75::acc(s25, negative_aspect).
measured(s24, negative_aspect, beginners_deep_powder).
measured(s26, negative_aspect, beginners_deep_powder).
measured(s25, negative_aspect, beginners_deep_powder).
all_consistent(negative_aspect) :- consistent(s24, negative_aspect), consistent(s26, negative_aspect), consistent(s25, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, beginners_deep_powder)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values twin=Twin directional_twin=Directional_Twin
% @importance 0.83

0.72::true_val(shape, twin); 0.28::true_val(shape, directional_twin).
0.95::acc(s1, shape).
0.85::acc(s_merchant, shape).
0.70::acc(s37, shape).
0.65::acc(s27, shape).
measured(s1, shape, twin).
measured(s_merchant, shape, twin).
measured(s37, shape, twin).
measured(s27, shape, directional_twin).
all_consistent(shape) :-
    consistent(s1, shape),
    consistent(s37, shape),
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)),
    (indep(s27), consistent(s27, shape) ; \+indep(s27)).
evidence(all_consistent(shape)).
query(true_val(shape, twin)).
query(true_val(shape, directional_twin)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c3=C3 unk_camber_type=Unknown
% @importance 1.0

0.95::true_val(camber_type, c3); 0.05::true_val(camber_type, unk_camber_type).
0.95::acc(s1, camber_type).
measured(s1, camber_type, c3).
all_consistent(camber_type) :- consistent(s1, camber_type).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, c3)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values aggressive_camber_mild_rocker=Aggressive_dominant_camber_with_mild_rocker_between_feet unk_camber_description=Unknown
% @importance 0.85

0.90::true_val(camber_description, aggressive_camber_mild_rocker); 0.10::true_val(camber_description, unk_camber_description).
0.82::acc(s14, camber_description).
measured(s14, camber_description, aggressive_camber_mild_rocker).
all_consistent(camber_description) :-
    (indep(s14), consistent(s14, camber_description) ; \+indep(s14)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, aggressive_camber_mild_rocker)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_freestyle
% @type categorical
% @canonical false
% @original_name camber_description (freestyle)
% @values subtle_banana_max_stability=Subtle_banana_rocker_freestyle_freedom_max_stability unk_camber_description_freestyle=Unknown
% @importance 0.85

0.74::true_val(camber_description_freestyle, subtle_banana_max_stability); 0.26::true_val(camber_description_freestyle, unk_camber_description_freestyle).
0.82::acc(s14, camber_description_freestyle).
measured(s14, camber_description_freestyle, subtle_banana_max_stability).
all_consistent(camber_description_freestyle) :-
    (indep(s14), consistent(s14, camber_description_freestyle) ; \+indep(s14)).
evidence(all_consistent(camber_description_freestyle)).
query(true_val(camber_description_freestyle, subtle_banana_max_stability)).
query(true_val(camber_description_freestyle, unk_camber_description_freestyle)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit inches
% @values v0_5=0.5 unk_setback=Unknown
% @importance 1.0

0.92::true_val(setback, v0_5); 0.08::true_val(setback, unk_setback).
0.95::acc(s1, setback).
measured(s1, setback, v0_5).
all_consistent(setback) :- consistent(s1, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v0_5)).
query(true_val(setback, unk_setback)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v6=6.0 v7=7.0
% @importance 0.85

0.65::true_val(flex_rating_10_manufacturer, v6); 0.35::true_val(flex_rating_10_manufacturer, v7).
0.93::acc(s1, flex_rating_10_manufacturer).
0.60::acc(s31, flex_rating_10_manufacturer).
measured(s1, flex_rating_10_manufacturer, v6).
measured(s31, flex_rating_10_manufacturer, v7).
all_consistent(flex_rating_10_manufacturer) :-
    consistent(s1, flex_rating_10_manufacturer),
    (indep(s31), consistent(s31, flex_rating_10_manufacturer) ; \+indep(s31)).
evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6)).
query(true_val(flex_rating_10_manufacturer, v7)).

% @attr flex_rating_10_manufacturer_154
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer (154cm)
% @unit /10
% @values v5=5.0 unk_flex_rating_10_manufacturer_154=Unknown
% @importance 1.0

0.92::true_val(flex_rating_10_manufacturer_154, v5); 0.08::true_val(flex_rating_10_manufacturer_154, unk_flex_rating_10_manufacturer_154).
0.93::acc(s1, flex_rating_10_manufacturer_154).
measured(s1, flex_rating_10_manufacturer_154, v5).
all_consistent(flex_rating_10_manufacturer_154) :- consistent(s1, flex_rating_10_manufacturer_154).
evidence(all_consistent(flex_rating_10_manufacturer_154)).
query(true_val(flex_rating_10_manufacturer_154, v5)).
query(true_val(flex_rating_10_manufacturer_154, unk_flex_rating_10_manufacturer_154)).

% @attr flex_rating_10_manufacturer_162
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer (162cm)
% @unit /10
% @values v7=7.0 unk_flex_rating_10_manufacturer_162=Unknown
% @importance 1.0

0.92::true_val(flex_rating_10_manufacturer_162, v7); 0.08::true_val(flex_rating_10_manufacturer_162, unk_flex_rating_10_manufacturer_162).
0.93::acc(s1, flex_rating_10_manufacturer_162).
measured(s1, flex_rating_10_manufacturer_162, v7).
all_consistent(flex_rating_10_manufacturer_162) :- consistent(s1, flex_rating_10_manufacturer_162).
evidence(all_consistent(flex_rating_10_manufacturer_162)).
query(true_val(flex_rating_10_manufacturer_162, v7)).
query(true_val(flex_rating_10_manufacturer_162, unk_flex_rating_10_manufacturer_162)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium_stiff=Medium_Stiff_stout_enough_to_charge unk_flex_rating_10_evo=Unknown
% @importance 0.85

0.74::true_val(flex_rating_10_evo, medium_stiff); 0.26::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).
0.80::acc(s14, flex_rating_10_evo).
measured(s14, flex_rating_10_evo, medium_stiff).
all_consistent(flex_rating_10_evo) :-
    (indep(s14), consistent(s14, flex_rating_10_evo) ; \+indep(s14)).
evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium_stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_playful=Medium_about_5_of_10_playful stiff=Stiff_with_riser_pads
% @importance 0.76

0.50::true_val(flex_feel, medium_playful); 0.50::true_val(flex_feel, stiff).
0.78::acc(s28, flex_feel).
0.82::acc(s24, flex_feel).
0.55::acc(s29, flex_feel).
0.45::acc(s30, flex_feel).
measured(s28, flex_feel, medium_playful).
measured(s24, flex_feel, medium_playful).
measured(s29, flex_feel, stiff).
measured(s30, flex_feel, stiff).
all_consistent(flex_feel) :- consistent(s28, flex_feel), consistent(s24, flex_feel), consistent(s29, flex_feel), consistent(s30, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_playful)).
query(true_val(flex_feel, stiff)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_symmetrical=Twin_symmetrical_flex unk_flex_direction=Unknown
% @importance 1.0

0.92::true_val(flex_direction, twin_symmetrical); 0.08::true_val(flex_direction, unk_flex_direction).
0.95::acc(s1, flex_direction).
measured(s1, flex_direction, twin_symmetrical).
all_consistent(flex_direction) :- consistent(s1, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values hpp_aspen_paulownia=HPP_Horsepower_Pop_60pct_Aspen_40pct_Paulownia unk_core_material=Unknown
% @importance 1.0

0.92::true_val(core_material, hpp_aspen_paulownia); 0.08::true_val(core_material, unk_core_material).
0.95::acc(s1, core_material).
measured(s1, core_material, hpp_aspen_paulownia).
all_consistent(core_material) :- consistent(s1, core_material).
evidence(all_consistent(core_material)).
query(true_val(core_material, hpp_aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values extended_core_triax_mag_carbon=Extended_core_Triax_Magnesium_Techno_Fiber_Carbon unk_construction_material_innovation=Unknown
% @importance 0.88

0.93::true_val(construction_material_innovation, extended_core_triax_mag_carbon); 0.07::true_val(construction_material_innovation, unk_construction_material_innovation).
0.95::acc(s1, construction_material_innovation).
0.80::acc(s32, construction_material_innovation).
measured(s1, construction_material_innovation, extended_core_triax_mag_carbon).
measured(s32, construction_material_innovation, extended_core_triax_mag_carbon).
all_consistent(construction_material_innovation) :-
    consistent(s1, construction_material_innovation),
    (indep(s32), consistent(s32, construction_material_innovation) ; \+indep(s32)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, extended_core_triax_mag_carbon)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified=FSC_certified_sustainable_forestry unk_sustainability_certification=Unknown
% @importance 1.0

0.92::true_val(sustainability_certification, fsc_certified); 0.08::true_val(sustainability_certification, unk_sustainability_certification).
0.93::acc(s1, sustainability_certification).
measured(s1, sustainability_certification, fsc_certified).
all_consistent(sustainability_certification) :- consistent(s1, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr construction_material_innovation_org_throttle
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Org-Throttle)
% @values org_throttle_maple=Org_Throttle_transverse_grain_Maple_platform_under_feet unk_construction_material_innovation_org_throttle=Unknown
% @importance 0.95

0.93::true_val(construction_material_innovation_org_throttle, org_throttle_maple); 0.07::true_val(construction_material_innovation_org_throttle, unk_construction_material_innovation_org_throttle).
0.95::acc(s1, construction_material_innovation_org_throttle).
0.83::acc(s24, construction_material_innovation_org_throttle).
measured(s1, construction_material_innovation_org_throttle, org_throttle_maple).
measured(s24, construction_material_innovation_org_throttle, org_throttle_maple).
all_consistent(construction_material_innovation_org_throttle) :- consistent(s1, construction_material_innovation_org_throttle), consistent(s24, construction_material_innovation_org_throttle).
evidence(all_consistent(construction_material_innovation_org_throttle)).
query(true_val(construction_material_innovation_org_throttle, org_throttle_maple)).
query(true_val(construction_material_innovation_org_throttle, unk_construction_material_innovation_org_throttle)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_biax_basalt=Triaxial_Biaxial_Fiberglass_with_Basalt_Alloy unk_laminate=Unknown
% @importance 0.85

0.90::true_val(laminate, triax_biax_basalt); 0.10::true_val(laminate, unk_laminate).
0.82::acc(s14, laminate).
0.78::acc(s_merchant, laminate).
measured(s14, laminate, triax_biax_basalt).
measured(s_merchant, laminate, triax_biax_basalt).
all_consistent(laminate) :-
    (indep(s14), consistent(s14, laminate) ; \+indep(s14)),
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)).
evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_basalt)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation_magnesium
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Magnesium fiber)
% @values high_mag_glass_fiber=High_magnesium_content_glass_fiber_high_tensile_strength unk_construction_material_innovation_magnesium=Unknown
% @importance 0.75

0.69::true_val(construction_material_innovation_magnesium, high_mag_glass_fiber); 0.31::true_val(construction_material_innovation_magnesium, unk_construction_material_innovation_magnesium).
0.78::acc(s32, construction_material_innovation_magnesium).
measured(s32, construction_material_innovation_magnesium, high_mag_glass_fiber).
all_consistent(construction_material_innovation_magnesium) :-
    (indep(s32), consistent(s32, construction_material_innovation_magnesium) ; \+indep(s32)).
evidence(all_consistent(construction_material_innovation_magnesium)).
query(true_val(construction_material_innovation_magnesium, high_mag_glass_fiber)).
query(true_val(construction_material_innovation_magnesium, unk_construction_material_innovation_magnesium)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_knife_cut=Sintered_Knife_Cut_Base unk_base_type=Unknown
% @importance 0.75

0.63::true_val(base_type, sintered_knife_cut); 0.37::true_val(base_type, unk_base_type).
0.72::acc(s33, base_type).
measured(s33, base_type, sintered_knife_cut).
all_consistent(base_type) :-
    (indep(s33), consistent(s33, base_type) ; \+indep(s33)).
evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_knife_cut)).
query(true_val(base_type, unk_base_type)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values double_uhmwpe=Double_layer_UHMW_polyethylene unk_base_material=Unknown
% @importance 0.75

0.63::true_val(base_material, double_uhmwpe); 0.37::true_val(base_material, unk_base_material).
0.72::acc(s33, base_material).
measured(s33, base_material, double_uhmwpe).
all_consistent(base_material) :-
    (indep(s33), consistent(s33, base_material) ; \+indep(s33)).
evidence(all_consistent(base_material)).
query(true_val(base_material, double_uhmwpe)).
query(true_val(base_material, unk_base_material)).

% @attr base_maintenance
% @type categorical
% @canonical false
% @original_name Base maintenance
% @values regular_waxing_pro_repairs=Regular_waxing_and_professional_repairs_required unk_base_maintenance=Unknown
% @importance 0.75

0.63::true_val(base_maintenance, regular_waxing_pro_repairs); 0.37::true_val(base_maintenance, unk_base_maintenance).
0.72::acc(s33, base_maintenance).
measured(s33, base_maintenance, regular_waxing_pro_repairs).
all_consistent(base_maintenance) :-
    (indep(s33), consistent(s33, base_maintenance) ; \+indep(s33)).
evidence(all_consistent(base_maintenance)).
query(true_val(base_maintenance, regular_waxing_pro_repairs)).
query(true_val(base_maintenance, unk_base_maintenance)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values random_colorways=Random_colorways unk_available_colors=Unknown
% @importance 1.0

0.92::true_val(available_colors, random_colorways); 0.08::true_val(available_colors, unk_available_colors).
0.90::acc(s1, available_colors).
measured(s1, available_colors, random_colorways).
all_consistent(available_colors) :- consistent(s1, available_colors).
evidence(all_consistent(available_colors)).
query(true_val(available_colors, random_colorways)).
query(true_val(available_colors, unk_available_colors)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values slow_for_price=Slow_base_for_the_price_point unk_base_glide_performance=Unknown
% @importance 0.9

0.74::true_val(base_glide_performance, slow_for_price); 0.26::true_val(base_glide_performance, unk_base_glide_performance).
0.83::acc(s24, base_glide_performance).
measured(s24, base_glide_performance, slow_for_price).
all_consistent(base_glide_performance) :- consistent(s24, base_glide_performance).
evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, slow_for_price)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch_internal_6ply=Birch_Internal_Sidewalls_6_ply unk_sidewall_material=Unknown
% @importance 0.75

0.69::true_val(sidewall_material, birch_internal_6ply); 0.31::true_val(sidewall_material, unk_sidewall_material).
0.78::acc(s32, sidewall_material).
measured(s32, sidewall_material, birch_internal_6ply).
all_consistent(sidewall_material) :-
    (indep(s32), consistent(s32, sidewall_material) ; \+indep(s32)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_internal_6ply)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_uhmw
% @type categorical
% @canonical false
% @original_name sidewall_material (UHMW)
% @values uhmw_sintered=UHMW_Sintered_Sidewalls unk_sidewall_material_uhmw=Unknown
% @importance 0.75

0.69::true_val(sidewall_material_uhmw, uhmw_sintered); 0.31::true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw).
0.78::acc(s32, sidewall_material_uhmw).
measured(s32, sidewall_material_uhmw, uhmw_sintered).
all_consistent(sidewall_material_uhmw) :-
    (indep(s32), consistent(s32, sidewall_material_uhmw) ; \+indep(s32)).
evidence(all_consistent(sidewall_material_uhmw)).
query(true_val(sidewall_material_uhmw, uhmw_sintered)).
query(true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw)).

% @attr construction_material_innovation_tip_tail
% @type categorical
% @canonical false
% @original_name construction_material_innovation (tip/tail)
% @values uhmw_tip_tail_deflection=UHMW_Tip_Tail_Impact_Deflection unk_construction_material_innovation_tip_tail=Unknown
% @importance 0.75

0.69::true_val(construction_material_innovation_tip_tail, uhmw_tip_tail_deflection); 0.31::true_val(construction_material_innovation_tip_tail, unk_construction_material_innovation_tip_tail).
0.78::acc(s32, construction_material_innovation_tip_tail).
measured(s32, construction_material_innovation_tip_tail, uhmw_tip_tail_deflection).
all_consistent(construction_material_innovation_tip_tail) :-
    (indep(s32), consistent(s32, construction_material_innovation_tip_tail) ; \+indep(s32)).
evidence(all_consistent(construction_material_innovation_tip_tail)).
query(true_val(construction_material_innovation_tip_tail, uhmw_tip_tail_deflection)).
query(true_val(construction_material_innovation_tip_tail, unk_construction_material_innovation_tip_tail)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Top_high_strength unk_topsheet=Unknown
% @importance 0.75

0.69::true_val(topsheet, eco_sublimated_poly); 0.31::true_val(topsheet, unk_topsheet).
0.78::acc(s32, topsheet).
measured(s32, topsheet, eco_sublimated_poly).
all_consistent(topsheet) :-
    (indep(s32), consistent(s32, topsheet) ; \+indep(s32)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr negative_aspect_topsheet
% @type categorical
% @canonical false
% @original_name negative_aspect (topsheet durability)
% @values topsheet_wear_peel=Bio_bean_topsheet_wear_peel_delamination unk_negative_aspect_topsheet=Unknown
% @importance 0.75

0.48::true_val(negative_aspect_topsheet, topsheet_wear_peel); 0.52::true_val(negative_aspect_topsheet, unk_negative_aspect_topsheet).
0.50::acc(s34, negative_aspect_topsheet).
0.70::acc(s40, negative_aspect_topsheet).
measured(s34, negative_aspect_topsheet, topsheet_wear_peel).
measured(s40, negative_aspect_topsheet, topsheet_wear_peel).
all_consistent(negative_aspect_topsheet) :- consistent(s34, negative_aspect_topsheet), consistent(s40, negative_aspect_topsheet).
evidence(all_consistent(negative_aspect_topsheet)).
query(true_val(negative_aspect_topsheet, topsheet_wear_peel)).
query(true_val(negative_aspect_topsheet, unk_negative_aspect_topsheet)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction_7=Magne_Traction_7_serrations unk_edge_technology=Unknown
% @importance 0.75

0.93::true_val(edge_technology, magne_traction_7); 0.07::true_val(edge_technology, unk_edge_technology).
0.95::acc(s1, edge_technology).
0.75::acc(s17, edge_technology).
measured(s1, edge_technology, magne_traction_7).
measured(s17, edge_technology, magne_traction_7).
all_consistent(edge_technology) :-
    consistent(s1, edge_technology),
    (indep(s17), consistent(s17, edge_technology) ; \+indep(s17)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
0.88::acc(s_merchant, mounting_pattern).
0.75::acc(s33, mounting_pattern).
measured(s_merchant, mounting_pattern, inserts_2x4).
measured(s33, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :-
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)),
    (indep(s33), consistent(s33, mounting_pattern) ; \+indep(s33)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values standard_2x4=Standard_2x4_four_screws_per_binding unk_binding_compatibility=Unknown
% @importance 0.75

0.63::true_val(binding_compatibility, standard_2x4); 0.37::true_val(binding_compatibility, unk_binding_compatibility).
0.72::acc(s33, binding_compatibility).
measured(s33, binding_compatibility, standard_2x4).
all_consistent(binding_compatibility) :-
    (indep(s33), consistent(s33, binding_compatibility) ; \+indep(s33)).
evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_2x4)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=154_157_157W_159_159W_162cm unk_available_sizes=Unknown
% @importance 1.0

0.92::true_val(available_sizes, six_sizes); 0.08::true_val(available_sizes, unk_available_sizes).
0.95::acc(s1, available_sizes).
measured(s1, available_sizes, six_sizes).
all_consistent(available_sizes) :- consistent(s1, available_sizes).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr size_154_specs
% @type categorical
% @canonical false
% @original_name Size 154cm specs
% @values contact115_sc8_2_w25_3=Contact_115_Sidecut_8.2_Waist_25.3_Flex_5 unk_size_154_specs=Unknown
% @importance 1.0

0.92::true_val(size_154_specs, contact115_sc8_2_w25_3); 0.08::true_val(size_154_specs, unk_size_154_specs).
0.95::acc(s1, size_154_specs).
measured(s1, size_154_specs, contact115_sc8_2_w25_3).
all_consistent(size_154_specs) :- consistent(s1, size_154_specs).
evidence(all_consistent(size_154_specs)).
query(true_val(size_154_specs, contact115_sc8_2_w25_3)).
query(true_val(size_154_specs, unk_size_154_specs)).

% @attr size_157_specs
% @type categorical
% @canonical false
% @original_name Size 157cm specs
% @values contact117_sc8_3_w25_3=Contact_117_Sidecut_8.3_Waist_25.3_Flex_6 unk_size_157_specs=Unknown
% @importance 1.0

0.92::true_val(size_157_specs, contact117_sc8_3_w25_3); 0.08::true_val(size_157_specs, unk_size_157_specs).
0.95::acc(s1, size_157_specs).
measured(s1, size_157_specs, contact117_sc8_3_w25_3).
all_consistent(size_157_specs) :- consistent(s1, size_157_specs).
evidence(all_consistent(size_157_specs)).
query(true_val(size_157_specs, contact117_sc8_3_w25_3)).
query(true_val(size_157_specs, unk_size_157_specs)).

% @attr size_157w_specs
% @type categorical
% @canonical false
% @original_name Size 157W specs
% @values contact117_sc8_3_w26_0=Contact_117_Sidecut_8.3_Waist_26.0_Flex_6 unk_size_157w_specs=Unknown
% @importance 1.0

0.92::true_val(size_157w_specs, contact117_sc8_3_w26_0); 0.08::true_val(size_157w_specs, unk_size_157w_specs).
0.95::acc(s1, size_157w_specs).
measured(s1, size_157w_specs, contact117_sc8_3_w26_0).
all_consistent(size_157w_specs) :- consistent(s1, size_157w_specs).
evidence(all_consistent(size_157w_specs)).
query(true_val(size_157w_specs, contact117_sc8_3_w26_0)).
query(true_val(size_157w_specs, unk_size_157w_specs)).

% @attr size_159_specs
% @type categorical
% @canonical false
% @original_name Size 159cm specs
% @values contact119_sc8_32_w25_3=Contact_119_Sidecut_8.32_Waist_25.3_Flex_6 unk_size_159_specs=Unknown
% @importance 1.0

0.92::true_val(size_159_specs, contact119_sc8_32_w25_3); 0.08::true_val(size_159_specs, unk_size_159_specs).
0.95::acc(s1, size_159_specs).
measured(s1, size_159_specs, contact119_sc8_32_w25_3).
all_consistent(size_159_specs) :- consistent(s1, size_159_specs).
evidence(all_consistent(size_159_specs)).
query(true_val(size_159_specs, contact119_sc8_32_w25_3)).
query(true_val(size_159_specs, unk_size_159_specs)).

% @attr size_159w_specs
% @type categorical
% @canonical false
% @original_name Size 159W specs
% @values contact119_sc8_32_w26_0=Contact_119_Sidecut_8.32_Waist_26.0_Flex_6 unk_size_159w_specs=Unknown
% @importance 1.0

0.92::true_val(size_159w_specs, contact119_sc8_32_w26_0); 0.08::true_val(size_159w_specs, unk_size_159w_specs).
0.95::acc(s1, size_159w_specs).
measured(s1, size_159w_specs, contact119_sc8_32_w26_0).
all_consistent(size_159w_specs) :- consistent(s1, size_159w_specs).
evidence(all_consistent(size_159w_specs)).
query(true_val(size_159w_specs, contact119_sc8_32_w26_0)).
query(true_val(size_159w_specs, unk_size_159w_specs)).

% @attr size_162_specs
% @type categorical
% @canonical false
% @original_name Size 162cm specs
% @values contact122_sc8_45_w25_6=Contact_122_Sidecut_8.45_Waist_25.6_Flex_7 unk_size_162_specs=Unknown
% @importance 1.0

0.92::true_val(size_162_specs, contact122_sc8_45_w25_6); 0.08::true_val(size_162_specs, unk_size_162_specs).
0.95::acc(s1, size_162_specs).
measured(s1, size_162_specs, contact122_sc8_45_w25_6).
all_consistent(size_162_specs) :- consistent(s1, size_162_specs).
evidence(all_consistent(size_162_specs)).
query(true_val(size_162_specs, contact122_sc8_45_w25_6)).
query(true_val(size_162_specs, unk_size_162_specs)).

% @attr stance_width_range
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit inches
% @values v20_25_to_25=20.25-25_inches v19_5_to_24_5=19.5-24.5_inches
% @importance 0.93

0.65::true_val(stance_width_range, v20_25_to_25); 0.35::true_val(stance_width_range, v19_5_to_24_5).
0.93::acc(s1, stance_width_range).
0.80::acc(s_merchant, stance_width_range).
measured(s1, stance_width_range, v20_25_to_25).
measured(s_merchant, stance_width_range, v19_5_to_24_5).
all_consistent(stance_width_range) :-
    consistent(s1, stance_width_range),
    (indep(s_merchant), consistent(s_merchant, stance_width_range) ; \+indep(s_merchant)).
evidence(all_consistent(stance_width_range)).
query(true_val(stance_width_range, v20_25_to_25)).
query(true_val(stance_width_range, v19_5_to_24_5)).

% @attr recommended_boot_sizes
% @type categorical
% @canonical false
% @original_name Recommended boot sizes
% @values per_tgr=154_8to9_157_8p5to9p5_159_8p5to9p5_162_9p5to10p5_157W_10to11_159W_10to11 unk_recommended_boot_sizes=Unknown
% @importance 0.85

0.72::true_val(recommended_boot_sizes, per_tgr); 0.28::true_val(recommended_boot_sizes, unk_recommended_boot_sizes).
0.82::acc(s35, recommended_boot_sizes).
measured(s35, recommended_boot_sizes, per_tgr).
all_consistent(recommended_boot_sizes) :- consistent(s35, recommended_boot_sizes).
evidence(all_consistent(recommended_boot_sizes)).
query(true_val(recommended_boot_sizes, per_tgr)).
query(true_val(recommended_boot_sizes, unk_recommended_boot_sizes)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values amazing_grip=Amazing_Grip_outstanding_edge_hold unk_edge_hold=Unknown
% @importance 0.9

0.90::true_val(edge_hold, amazing_grip); 0.10::true_val(edge_hold, unk_edge_hold).
0.85::acc(s24, edge_hold).
measured(s24, edge_hold, amazing_grip).
all_consistent(edge_hold) :- consistent(s24, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, amazing_grip)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values decent=Decent_pops_well_for_mellow_camber unk_pop=Unknown
% @importance 0.9

0.74::true_val(pop, decent); 0.26::true_val(pop, unk_pop).
0.83::acc(s24, pop).
measured(s24, pop, decent).
all_consistent(pop) :- consistent(s24, pop).
evidence(all_consistent(pop)).
query(true_val(pop, decent)).
query(true_val(pop, unk_pop)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values good_for_twin=Carves_well_for_a_twin_quick_turn_initiation unk_carving_rating_tgr=Unknown
% @importance 0.9

0.74::true_val(carving_rating_tgr, good_for_twin); 0.26::true_val(carving_rating_tgr, unk_carving_rating_tgr).
0.83::acc(s24, carving_rating_tgr).
measured(s24, carving_rating_tgr, good_for_twin).
all_consistent(carving_rating_tgr) :- consistent(s24, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, good_for_twin)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values great_mtn_freestyle_twin=Great_mtn_freestyle_twin_hard_icy_snow_not_powder unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.74::true_val(reviewer_opinion_the_good_ride, great_mtn_freestyle_twin); 0.26::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.83::acc(s24, reviewer_opinion_the_good_ride).
measured(s24, reviewer_opinion_the_good_ride, great_mtn_freestyle_twin).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s24, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, great_mtn_freestyle_twin)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_tgr_speed
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (speed/dampening)
% @values competent_at_speed=Competent_at_speed_Org_Throttle_helps_dampening unk_reviewer_opinion_tgr_speed=Unknown
% @importance 0.9

0.74::true_val(reviewer_opinion_tgr_speed, competent_at_speed); 0.26::true_val(reviewer_opinion_tgr_speed, unk_reviewer_opinion_tgr_speed).
0.83::acc(s24, reviewer_opinion_tgr_speed).
measured(s24, reviewer_opinion_tgr_speed, competent_at_speed).
all_consistent(reviewer_opinion_tgr_speed) :- consistent(s24, reviewer_opinion_tgr_speed).
evidence(all_consistent(reviewer_opinion_tgr_speed)).
query(true_val(reviewer_opinion_tgr_speed, competent_at_speed)).
query(true_val(reviewer_opinion_tgr_speed, unk_reviewer_opinion_tgr_speed)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values middle_snappy=Middle_of_scale_more_snappy_than_smooth unk_chatter_performance=Unknown
% @importance 0.8

0.60::true_val(chatter_performance, middle_snappy); 0.40::true_val(chatter_performance, unk_chatter_performance).
0.73::acc(s36, chatter_performance).
measured(s36, chatter_performance, middle_snappy).
all_consistent(chatter_performance) :- consistent(s36, chatter_performance).
evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, middle_snappy)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values poor_float=Poor_float_in_powder_even_for_twin unk_powder_rating_tgr=Unknown
% @importance 0.9

0.74::true_val(powder_rating_tgr, poor_float); 0.26::true_val(powder_rating_tgr, unk_powder_rating_tgr).
0.83::acc(s24, powder_rating_tgr).
measured(s24, powder_rating_tgr, poor_float).
all_consistent(powder_rating_tgr) :- consistent(s24, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, poor_float)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr powder_rating_tgr_wet
% @type categorical
% @canonical false
% @original_name powder_rating_tgr (wet powder)
% @values good_wet_powder=Performs_well_in_wet_powder_PNW unk_powder_rating_tgr_wet=Unknown
% @importance 0.85

0.56::true_val(powder_rating_tgr_wet, good_wet_powder); 0.44::true_val(powder_rating_tgr_wet, unk_powder_rating_tgr_wet).
0.72::acc(s25, powder_rating_tgr_wet).
measured(s25, powder_rating_tgr_wet, good_wet_powder).
all_consistent(powder_rating_tgr_wet) :- consistent(s25, powder_rating_tgr_wet).
evidence(all_consistent(powder_rating_tgr_wet)).
query(true_val(powder_rating_tgr_wet, good_wet_powder)).
query(true_val(powder_rating_tgr_wet, unk_powder_rating_tgr_wet)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values excellent=Excellent_true_twin_nearly_centered_identical_both_ways unk_switch_riding=Unknown
% @importance 0.75

0.63::true_val(switch_riding, excellent); 0.37::true_val(switch_riding, unk_switch_riding).
0.75::acc(s37, switch_riding).
measured(s37, switch_riding, excellent).
all_consistent(switch_riding) :- consistent(s37, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, excellent)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great_all_sizes=Great_for_natural_terrain_and_park_jumps_all_sizes unk_jumps_rating_tgr=Unknown
% @importance 0.75

0.60::true_val(jumps_rating_tgr, great_all_sizes); 0.40::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).
0.73::acc(s38, jumps_rating_tgr).
measured(s38, jumps_rating_tgr, great_all_sizes).
all_consistent(jumps_rating_tgr) :- consistent(s38, jumps_rating_tgr).
evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great_all_sizes)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values not_terrible_not_strong=Not_terrible_but_not_strongest_feature unk_jibbing_rating_tgr=Unknown
% @importance 0.8

0.60::true_val(jibbing_rating_tgr, not_terrible_not_strong); 0.40::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).
0.73::acc(s36, jibbing_rating_tgr).
measured(s36, jibbing_rating_tgr, not_terrible_not_strong).
all_consistent(jibbing_rating_tgr) :- consistent(s36, jibbing_rating_tgr).
evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, not_terrible_not_strong)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr reviewer_opinion_tgr_buttery
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (buttery)
% @values nice_buttery=Nice_and_buttery_easy_to_press_tip_tail unk_reviewer_opinion_tgr_buttery=Unknown
% @importance 0.8

0.60::true_val(reviewer_opinion_tgr_buttery, nice_buttery); 0.40::true_val(reviewer_opinion_tgr_buttery, unk_reviewer_opinion_tgr_buttery).
0.73::acc(s36, reviewer_opinion_tgr_buttery).
measured(s36, reviewer_opinion_tgr_buttery, nice_buttery).
all_consistent(reviewer_opinion_tgr_buttery) :- consistent(s36, reviewer_opinion_tgr_buttery).
evidence(all_consistent(reviewer_opinion_tgr_buttery)).
query(true_val(reviewer_opinion_tgr_buttery, nice_buttery)).
query(true_val(reviewer_opinion_tgr_buttery, unk_reviewer_opinion_tgr_buttery)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values quick_edge_to_edge=Quick_edge_to_edge unk_turn_initiation_performance=Unknown
% @importance 0.9

0.74::true_val(turn_initiation_performance, quick_edge_to_edge); 0.26::true_val(turn_initiation_performance, unk_turn_initiation_performance).
0.83::acc(s24, turn_initiation_performance).
measured(s24, turn_initiation_performance, quick_edge_to_edge).
all_consistent(turn_initiation_performance) :- consistent(s24, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, quick_edge_to_edge)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values pretty_normal=Feels_pretty_normal_not_specified_precisely unk_board_weight_grams=Unknown
% @importance 0.85

0.72::true_val(board_weight_grams, pretty_normal); 0.28::true_val(board_weight_grams, unk_board_weight_grams).
0.78::acc(s35, board_weight_grams).
measured(s35, board_weight_grams, pretty_normal).
all_consistent(board_weight_grams) :- consistent(s35, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, pretty_normal)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr reviewer_opinion_tgr_aggressive
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (aggressive)
% @values aggressive_no_consequences=Aggressive_without_consequences_of_aggressive_board unk_reviewer_opinion_tgr_aggressive=Unknown
% @importance 0.9

0.74::true_val(reviewer_opinion_tgr_aggressive, aggressive_no_consequences); 0.26::true_val(reviewer_opinion_tgr_aggressive, unk_reviewer_opinion_tgr_aggressive).
0.83::acc(s24, reviewer_opinion_tgr_aggressive).
measured(s24, reviewer_opinion_tgr_aggressive, aggressive_no_consequences).
all_consistent(reviewer_opinion_tgr_aggressive) :- consistent(s24, reviewer_opinion_tgr_aggressive).
evidence(all_consistent(reviewer_opinion_tgr_aggressive)).
query(true_val(reviewer_opinion_tgr_aggressive, aggressive_no_consequences)).
query(true_val(reviewer_opinion_tgr_aggressive, unk_reviewer_opinion_tgr_aggressive)).

% @attr manufacturer_site_rating
% @type categorical
% @canonical false
% @original_name Manufacturer site rating
% @values pct96_of_100=96pct_of_100_from_23_reviews unk_manufacturer_site_rating=Unknown
% @importance 1.0

0.92::true_val(manufacturer_site_rating, pct96_of_100); 0.08::true_val(manufacturer_site_rating, unk_manufacturer_site_rating).
0.90::acc(s1, manufacturer_site_rating).
measured(s1, manufacturer_site_rating, pct96_of_100).
all_consistent(manufacturer_site_rating) :- consistent(s1, manufacturer_site_rating).
evidence(all_consistent(manufacturer_site_rating)).
query(true_val(manufacturer_site_rating, pct96_of_100)).
query(true_val(manufacturer_site_rating, unk_manufacturer_site_rating)).

% @attr trs_slopestyle_legacy
% @type categorical
% @canonical false
% @original_name TRS slopestyle legacy
% @values one_of_winningest=One_of_the_winningest_slopestyle_boards_of_all_time unk_trs_slopestyle_legacy=Unknown
% @importance 0.85

0.74::true_val(trs_slopestyle_legacy, one_of_winningest); 0.26::true_val(trs_slopestyle_legacy, unk_trs_slopestyle_legacy).
0.78::acc(s14, trs_slopestyle_legacy).
measured(s14, trs_slopestyle_legacy, one_of_winningest).
all_consistent(trs_slopestyle_legacy) :-
    (indep(s14), consistent(s14, trs_slopestyle_legacy) ; \+indep(s14)).
evidence(all_consistent(trs_slopestyle_legacy)).
query(true_val(trs_slopestyle_legacy, one_of_winningest)).
query(true_val(trs_slopestyle_legacy, unk_trs_slopestyle_legacy)).

% @attr awards
% @type categorical
% @canonical false
% @original_name Awards
% @values multiple_good_wood=Multiple_Transworld_Good_Wood_10_years_in_row unk_awards=Unknown
% @importance 0.6

0.72::true_val(awards, multiple_good_wood); 0.28::true_val(awards, unk_awards).
0.82::acc(s39, awards).
measured(s39, awards, multiple_good_wood).
all_consistent(awards) :- consistent(s39, awards).
evidence(all_consistent(awards)).
query(true_val(awards, multiple_good_wood)).
query(true_val(awards, unk_awards)).

% @attr good_wood_award_example
% @type categorical
% @canonical false
% @original_name Good Wood award example
% @values y2015_all_mtn_over_450=2015_TRS_HP_Good_Wood_All_Mountain_Over_450 unk_good_wood_award_example=Unknown
% @importance 0.6

0.72::true_val(good_wood_award_example, y2015_all_mtn_over_450); 0.28::true_val(good_wood_award_example, unk_good_wood_award_example).
0.82::acc(s39, good_wood_award_example).
measured(s39, good_wood_award_example, y2015_all_mtn_over_450).
all_consistent(good_wood_award_example) :- consistent(s39, good_wood_award_example).
evidence(all_consistent(good_wood_award_example)).
query(true_val(good_wood_award_example, y2015_all_mtn_over_450)).
query(true_val(good_wood_award_example, unk_good_wood_award_example)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values excellent_edge_hold_ice=Excellent_edge_hold_on_ice_and_hardpack unk_positive_aspect=Unknown
% @importance 0.87

0.90::true_val(positive_aspect, excellent_edge_hold_ice); 0.10::true_val(positive_aspect, unk_positive_aspect).
0.85::acc(s24, positive_aspect).
0.78::acc(s25, positive_aspect).
0.73::acc(s28, positive_aspect).
measured(s24, positive_aspect, excellent_edge_hold_ice).
measured(s25, positive_aspect, excellent_edge_hold_ice).
measured(s28, positive_aspect, excellent_edge_hold_ice).
all_consistent(positive_aspect) :- consistent(s24, positive_aspect), consistent(s25, positive_aspect), consistent(s28, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, excellent_edge_hold_ice)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_pop
% @type categorical
% @canonical false
% @original_name positive_aspect (pop)
% @values good_pop_snappy=Good_pop_and_snappy_feel_for_ollie_jumps unk_positive_aspect_pop=Unknown
% @importance 0.8

0.78::true_val(positive_aspect_pop, good_pop_snappy); 0.22::true_val(positive_aspect_pop, unk_positive_aspect_pop).
0.73::acc(s28, positive_aspect_pop).
0.73::acc(s36, positive_aspect_pop).
measured(s28, positive_aspect_pop, good_pop_snappy).
measured(s36, positive_aspect_pop, good_pop_snappy).
all_consistent(positive_aspect_pop) :- consistent(s28, positive_aspect_pop), consistent(s36, positive_aspect_pop).
evidence(all_consistent(positive_aspect_pop)).
query(true_val(positive_aspect_pop, good_pop_snappy)).
query(true_val(positive_aspect_pop, unk_positive_aspect_pop)).

% @attr positive_aspect_versatile
% @type categorical
% @canonical false
% @original_name positive_aspect (versatile)
% @values versatile_freestyle_mindset=Versatile_rides_whole_mountain_freestyle_mindset unk_positive_aspect_versatile=Unknown
% @importance 0.85

0.74::true_val(positive_aspect_versatile, versatile_freestyle_mindset); 0.26::true_val(positive_aspect_versatile, unk_positive_aspect_versatile).
0.80::acc(s14, positive_aspect_versatile).
measured(s14, positive_aspect_versatile, versatile_freestyle_mindset).
all_consistent(positive_aspect_versatile) :-
    (indep(s14), consistent(s14, positive_aspect_versatile) ; \+indep(s14)).
evidence(all_consistent(positive_aspect_versatile)).
query(true_val(positive_aspect_versatile, versatile_freestyle_mindset)).
query(true_val(positive_aspect_versatile, unk_positive_aspect_versatile)).

% @attr positive_aspect_light_snappy
% @type categorical
% @canonical false
% @original_name positive_aspect (light and snappy)
% @values light_snappy=Light_and_snappy_feel unk_positive_aspect_light_snappy=Unknown
% @importance 0.8

0.55::true_val(positive_aspect_light_snappy, light_snappy); 0.45::true_val(positive_aspect_light_snappy, unk_positive_aspect_light_snappy).
0.73::acc(s28, positive_aspect_light_snappy).
measured(s28, positive_aspect_light_snappy, light_snappy).
all_consistent(positive_aspect_light_snappy) :- consistent(s28, positive_aspect_light_snappy).
evidence(all_consistent(positive_aspect_light_snappy)).
query(true_val(positive_aspect_light_snappy, light_snappy)).
query(true_val(positive_aspect_light_snappy, unk_positive_aspect_light_snappy)).

% @attr positive_aspect_switch
% @type categorical
% @canonical false
% @original_name positive_aspect (switch)
% @values great_switch=Great_for_riding_switch_true_twin unk_positive_aspect_switch=Unknown
% @importance 0.75

0.63::true_val(positive_aspect_switch, great_switch); 0.37::true_val(positive_aspect_switch, unk_positive_aspect_switch).
0.75::acc(s37, positive_aspect_switch).
measured(s37, positive_aspect_switch, great_switch).
all_consistent(positive_aspect_switch) :- consistent(s37, positive_aspect_switch).
evidence(all_consistent(positive_aspect_switch)).
query(true_val(positive_aspect_switch, great_switch)).
query(true_val(positive_aspect_switch, unk_positive_aspect_switch)).

% @attr positive_aspect_natural_features
% @type categorical
% @canonical false
% @original_name positive_aspect (natural features)
% @values fun_natural_features=Fun_for_natural_features_and_side_hits unk_positive_aspect_natural_features=Unknown
% @importance 0.8

0.60::true_val(positive_aspect_natural_features, fun_natural_features); 0.40::true_val(positive_aspect_natural_features, unk_positive_aspect_natural_features).
0.73::acc(s36, positive_aspect_natural_features).
measured(s36, positive_aspect_natural_features, fun_natural_features).
all_consistent(positive_aspect_natural_features) :- consistent(s36, positive_aspect_natural_features).
evidence(all_consistent(positive_aspect_natural_features)).
query(true_val(positive_aspect_natural_features, fun_natural_features)).
query(true_val(positive_aspect_natural_features, unk_positive_aspect_natural_features)).

% @attr positive_aspect_carving
% @type categorical
% @canonical false
% @original_name positive_aspect (carving)
% @values good_carving_twin=Good_carving_for_a_twin_board unk_positive_aspect_carving=Unknown
% @importance 0.9

0.74::true_val(positive_aspect_carving, good_carving_twin); 0.26::true_val(positive_aspect_carving, unk_positive_aspect_carving).
0.83::acc(s24, positive_aspect_carving).
measured(s24, positive_aspect_carving, good_carving_twin).
all_consistent(positive_aspect_carving) :- consistent(s24, positive_aspect_carving).
evidence(all_consistent(positive_aspect_carving)).
query(true_val(positive_aspect_carving, good_carving_twin)).
query(true_val(positive_aspect_carving, unk_positive_aspect_carving)).

% @attr positive_aspect_conditions
% @type categorical
% @canonical false
% @original_name positive_aspect (conditions)
% @values suited_hard_icy_pnw=Well_suited_hard_icy_East_Coast_PNW unk_positive_aspect_conditions=Unknown
% @importance 0.88

0.82::true_val(positive_aspect_conditions, suited_hard_icy_pnw); 0.18::true_val(positive_aspect_conditions, unk_positive_aspect_conditions).
0.83::acc(s24, positive_aspect_conditions).
0.72::acc(s25, positive_aspect_conditions).
measured(s24, positive_aspect_conditions, suited_hard_icy_pnw).
measured(s25, positive_aspect_conditions, suited_hard_icy_pnw).
all_consistent(positive_aspect_conditions) :- consistent(s24, positive_aspect_conditions), consistent(s25, positive_aspect_conditions).
evidence(all_consistent(positive_aspect_conditions)).
query(true_val(positive_aspect_conditions, suited_hard_icy_pnw)).
query(true_val(positive_aspect_conditions, unk_positive_aspect_conditions)).

% @attr negative_aspect_slow_base
% @type categorical
% @canonical false
% @original_name negative_aspect (slow base)
% @values slow_base=Slow_base_for_price_vs_competitors unk_negative_aspect_slow_base=Unknown
% @importance 0.9

0.74::true_val(negative_aspect_slow_base, slow_base); 0.26::true_val(negative_aspect_slow_base, unk_negative_aspect_slow_base).
0.83::acc(s24, negative_aspect_slow_base).
measured(s24, negative_aspect_slow_base, slow_base).
all_consistent(negative_aspect_slow_base) :- consistent(s24, negative_aspect_slow_base).
evidence(all_consistent(negative_aspect_slow_base)).
query(true_val(negative_aspect_slow_base, slow_base)).
query(true_val(negative_aspect_slow_base, unk_negative_aspect_slow_base)).

% @attr negative_aspect_catchy
% @type categorical
% @canonical false
% @original_name negative_aspect (catchy)
% @values can_feel_catchy=Can_feel_catchy_not_easiest_to_skid_turn unk_negative_aspect_catchy=Unknown
% @importance 0.9

0.74::true_val(negative_aspect_catchy, can_feel_catchy); 0.26::true_val(negative_aspect_catchy, unk_negative_aspect_catchy).
0.83::acc(s24, negative_aspect_catchy).
measured(s24, negative_aspect_catchy, can_feel_catchy).
all_consistent(negative_aspect_catchy) :- consistent(s24, negative_aspect_catchy).
evidence(all_consistent(negative_aspect_catchy)).
query(true_val(negative_aspect_catchy, can_feel_catchy)).
query(true_val(negative_aspect_catchy, unk_negative_aspect_catchy)).

% @attr negative_aspect_tip_tail
% @type categorical
% @canonical false
% @original_name negative_aspect (tip/tail vulnerability)
% @values tip_tail_vulnerable=Tip_tail_vulnerable_no_fully_wrapped_edges unk_negative_aspect_tip_tail=Unknown
% @importance 0.8

0.57::true_val(negative_aspect_tip_tail, tip_tail_vulnerable); 0.43::true_val(negative_aspect_tip_tail, unk_negative_aspect_tip_tail).
0.70::acc(s40, negative_aspect_tip_tail).
measured(s40, negative_aspect_tip_tail, tip_tail_vulnerable).
all_consistent(negative_aspect_tip_tail) :- consistent(s40, negative_aspect_tip_tail).
evidence(all_consistent(negative_aspect_tip_tail)).
query(true_val(negative_aspect_tip_tail, tip_tail_vulnerable)).
query(true_val(negative_aspect_tip_tail, unk_negative_aspect_tip_tail)).

% @attr negative_aspect_jibbing
% @type categorical
% @canonical false
% @original_name negative_aspect (jibbing)
% @values not_ideal_jibbing=Not_ideal_for_jibbing_or_rail_work unk_negative_aspect_jibbing=Unknown
% @importance 0.73

0.58::true_val(negative_aspect_jibbing, not_ideal_jibbing); 0.42::true_val(negative_aspect_jibbing, unk_negative_aspect_jibbing).
0.70::acc(s38, negative_aspect_jibbing).
0.50::acc(s41, negative_aspect_jibbing).
measured(s38, negative_aspect_jibbing, not_ideal_jibbing).
measured(s41, negative_aspect_jibbing, not_ideal_jibbing).
all_consistent(negative_aspect_jibbing) :- consistent(s38, negative_aspect_jibbing), consistent(s41, negative_aspect_jibbing).
evidence(all_consistent(negative_aspect_jibbing)).
query(true_val(negative_aspect_jibbing, not_ideal_jibbing)).
query(true_val(negative_aspect_jibbing, unk_negative_aspect_jibbing)).

% @attr negative_aspect_magne_traction
% @type categorical
% @canonical false
% @original_name negative_aspect (Magne-Traction catchiness)
% @values catchy_variable_snow=Magne_Traction_catchy_in_variable_snow_bumps unk_negative_aspect_magne_traction=Unknown
% @importance 0.85

0.56::true_val(negative_aspect_magne_traction, catchy_variable_snow); 0.44::true_val(negative_aspect_magne_traction, unk_negative_aspect_magne_traction).
0.72::acc(s25, negative_aspect_magne_traction).
measured(s25, negative_aspect_magne_traction, catchy_variable_snow).
all_consistent(negative_aspect_magne_traction) :- consistent(s25, negative_aspect_magne_traction).
evidence(all_consistent(negative_aspect_magne_traction)).
query(true_val(negative_aspect_magne_traction, catchy_variable_snow)).
query(true_val(negative_aspect_magne_traction, unk_negative_aspect_magne_traction)).

% @attr negative_aspect_waist_width
% @type categorical
% @canonical false
% @original_name negative_aspect (waist width)
% @values too_narrow_large_feet=Waist_width_too_narrow_for_some_larger_feet unk_negative_aspect_waist_width=Unknown
% @importance 0.65

0.30::true_val(negative_aspect_waist_width, too_narrow_large_feet); 0.70::true_val(negative_aspect_waist_width, unk_negative_aspect_waist_width).
0.50::acc(s41, negative_aspect_waist_width).
measured(s41, negative_aspect_waist_width, too_narrow_large_feet).
all_consistent(negative_aspect_waist_width) :- consistent(s41, negative_aspect_waist_width).
evidence(all_consistent(negative_aspect_waist_width)).
query(true_val(negative_aspect_waist_width, too_narrow_large_feet)).
query(true_val(negative_aspect_waist_width, unk_negative_aspect_waist_width)).

% @attr sustainability_certification_zero_waste
% @type categorical
% @canonical false
% @original_name sustainability_certification (zero waste)
% @values zero_haz_waste=Zero_hazardous_waste_production unk_sustainability_certification_zero_waste=Unknown
% @importance 0.53

0.71::true_val(sustainability_certification_zero_waste, zero_haz_waste); 0.29::true_val(sustainability_certification_zero_waste, unk_sustainability_certification_zero_waste).
0.78::acc(s7, sustainability_certification_zero_waste).
measured(s7, sustainability_certification_zero_waste, zero_haz_waste).
all_consistent(sustainability_certification_zero_waste) :-
    (indep(s7), consistent(s7, sustainability_certification_zero_waste) ; \+indep(s7)).
evidence(all_consistent(sustainability_certification_zero_waste)).
query(true_val(sustainability_certification_zero_waste, zero_haz_waste)).
query(true_val(sustainability_certification_zero_waste, unk_sustainability_certification_zero_waste)).

% @attr sustainability_certification_hydro
% @type categorical
% @canonical false
% @original_name sustainability_certification (hydroelectric)
% @values hydro_89_6_pct=89.6pct_hydroelectric_power unk_sustainability_certification_hydro=Unknown
% @importance 0.4

0.68::true_val(sustainability_certification_hydro, hydro_89_6_pct); 0.32::true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro).
0.78::acc(s11, sustainability_certification_hydro).
measured(s11, sustainability_certification_hydro, hydro_89_6_pct).
all_consistent(sustainability_certification_hydro) :- consistent(s11, sustainability_certification_hydro).
evidence(all_consistent(sustainability_certification_hydro)).
query(true_val(sustainability_certification_hydro, hydro_89_6_pct)).
query(true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro)).

% @attr sustainability_certification_eco_print
% @type categorical
% @canonical false
% @original_name sustainability_certification (eco print)
% @values eco_sublimated=Eco_sublimated_printing_process unk_sustainability_certification_eco_print=Unknown
% @importance 0.75

0.69::true_val(sustainability_certification_eco_print, eco_sublimated); 0.31::true_val(sustainability_certification_eco_print, unk_sustainability_certification_eco_print).
0.78::acc(s32, sustainability_certification_eco_print).
measured(s32, sustainability_certification_eco_print, eco_sublimated).
all_consistent(sustainability_certification_eco_print) :-
    (indep(s32), consistent(s32, sustainability_certification_eco_print) ; \+indep(s32)).
evidence(all_consistent(sustainability_certification_eco_print)).
query(true_val(sustainability_certification_eco_print, eco_sublimated)).
query(true_val(sustainability_certification_eco_print, unk_sustainability_certification_eco_print)).

% @attr sustainability_certification_bio_plastic
% @type categorical
% @canonical false
% @original_name sustainability_certification (bio-plastic)
% @values bio_plastic_beans=Bio_plastic_topsheet_made_from_beans unk_sustainability_certification_bio_plastic=Unknown
% @importance 0.85

0.95::true_val(sustainability_certification_bio_plastic, bio_plastic_beans); 0.05::true_val(sustainability_certification_bio_plastic, unk_sustainability_certification_bio_plastic).
0.88::acc(s_merchant, sustainability_certification_bio_plastic).
measured(s_merchant, sustainability_certification_bio_plastic, bio_plastic_beans).
all_consistent(sustainability_certification_bio_plastic) :-
    (indep(s_merchant), consistent(s_merchant, sustainability_certification_bio_plastic) ; \+indep(s_merchant)).
evidence(all_consistent(sustainability_certification_bio_plastic)).
query(true_val(sustainability_certification_bio_plastic, bio_plastic_beans)).
query(true_val(sustainability_certification_bio_plastic, unk_sustainability_certification_bio_plastic)).

% @attr sustainability_certification_biodiesel
% @type categorical
% @canonical false
% @original_name sustainability_certification (biodiesel)
% @values biodiesel_heating=Factory_heating_renewable_biodiesel unk_sustainability_certification_biodiesel=Unknown
% @importance 0.4

0.68::true_val(sustainability_certification_biodiesel, biodiesel_heating); 0.32::true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel).
0.78::acc(s11, sustainability_certification_biodiesel).
measured(s11, sustainability_certification_biodiesel, biodiesel_heating).
all_consistent(sustainability_certification_biodiesel) :- consistent(s11, sustainability_certification_biodiesel).
evidence(all_consistent(sustainability_certification_biodiesel)).
query(true_val(sustainability_certification_biodiesel, biodiesel_heating)).
query(true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel)).

% @attr sustainability_certification_materials
% @type categorical
% @canonical false
% @original_name sustainability_certification (materials)
% @values bio_voc_free_renewable=Non_petroleum_bio_plastics_water_graphics_VOC_free_resin unk_sustainability_certification_materials=Unknown
% @importance 0.45

0.64::true_val(sustainability_certification_materials, bio_voc_free_renewable); 0.36::true_val(sustainability_certification_materials, unk_sustainability_certification_materials).
0.78::acc(s42, sustainability_certification_materials).
measured(s42, sustainability_certification_materials, bio_voc_free_renewable).
all_consistent(sustainability_certification_materials) :- consistent(s42, sustainability_certification_materials).
evidence(all_consistent(sustainability_certification_materials)).
query(true_val(sustainability_certification_materials, bio_voc_free_renewable)).
query(true_val(sustainability_certification_materials, unk_sustainability_certification_materials)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values phil_hansen=Phil_Hansen_phliphansen unk_graphic_designer_artist=Unknown
% @importance 1.0

0.92::true_val(graphic_designer_artist, phil_hansen); 0.08::true_val(graphic_designer_artist, unk_graphic_designer_artist).
0.93::acc(s1, graphic_designer_artist).
measured(s1, graphic_designer_artist, phil_hansen).
all_consistent(graphic_designer_artist) :- consistent(s1, graphic_designer_artist).
evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, phil_hansen)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values ejack_lynn_fredi_blair_luebke=EJack_Jamie_Lynn_Fredi_K_Blair_Habenicht_Sammy_Luebke unk_pro_rider_name=Unknown
% @importance 0.85

0.82::true_val(pro_rider_name, ejack_lynn_fredi_blair_luebke); 0.18::true_val(pro_rider_name, unk_pro_rider_name).
0.80::acc(s14, pro_rider_name).
0.72::acc(s25, pro_rider_name).
measured(s14, pro_rider_name, ejack_lynn_fredi_blair_luebke).
measured(s25, pro_rider_name, ejack_lynn_fredi_blair_luebke).
all_consistent(pro_rider_name) :-
    (indep(s14), consistent(s14, pro_rider_name) ; \+indep(s14)),
    consistent(s25, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, ejack_lynn_fredi_blair_luebke)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values ns_photo_yes_greats_etc=NS_Photosynthesis_Yes_Greats_Stone_Message_Box_Knife_Yes_Basic_Ride_TwinPig unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.72::true_val(comparable_board_cross_brand, ns_photo_yes_greats_etc); 0.28::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
0.82::acc(s35, comparable_board_cross_brand).
measured(s35, comparable_board_cross_brand, ns_photo_yes_greats_etc).
all_consistent(comparable_board_cross_brand) :- consistent(s35, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, ns_photo_yes_greats_etc)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (T.Rice Pro)
% @values t_rice_pro=T_Rice_Pro_same_MSRP_more_freeride unk_comparable_board_same_brand=Unknown
% @importance 0.6

0.77::true_val(comparable_board_same_brand, t_rice_pro); 0.23::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
0.85::acc(s43, comparable_board_same_brand).
measured(s43, comparable_board_same_brand, t_rice_pro).
all_consistent(comparable_board_same_brand) :- consistent(s43, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, t_rice_pro)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_similar
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (similar camber)
% @values similar_camber_asym_sidecut=Very_similar_camber_feel_asymmetric_sidecut unk_comparable_board_same_brand_similar=Unknown
% @importance 0.9

0.74::true_val(comparable_board_same_brand_similar, similar_camber_asym_sidecut); 0.26::true_val(comparable_board_same_brand_similar, unk_comparable_board_same_brand_similar).
0.80::acc(s24, comparable_board_same_brand_similar).
measured(s24, comparable_board_same_brand_similar, similar_camber_asym_sidecut).
all_consistent(comparable_board_same_brand_similar) :- consistent(s24, comparable_board_same_brand_similar).
evidence(all_consistent(comparable_board_same_brand_similar)).
query(true_val(comparable_board_same_brand_similar, similar_camber_asym_sidecut)).
query(true_val(comparable_board_same_brand_similar, unk_comparable_board_same_brand_similar)).

% @attr comparable_board_same_brand_no43
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (No.43)
% @values lib_tech_no43=Lib_Tech_No43_146_149_152cm unk_comparable_board_same_brand_no43=Unknown
% @importance 0.8

0.55::true_val(comparable_board_same_brand_no43, lib_tech_no43); 0.45::true_val(comparable_board_same_brand_no43, unk_comparable_board_same_brand_no43).
0.70::acc(s28, comparable_board_same_brand_no43).
measured(s28, comparable_board_same_brand_no43, lib_tech_no43).
all_consistent(comparable_board_same_brand_no43) :- consistent(s28, comparable_board_same_brand_no43).
evidence(all_consistent(comparable_board_same_brand_no43)).
query(true_val(comparable_board_same_brand_no43, lib_tech_no43)).
query(true_val(comparable_board_same_brand_no43, unk_comparable_board_same_brand_no43)).

% @attr comparable_board_cross_brand_burton
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Custom Twin)
% @values burton_custom_twin=Burton_Custom_Twin_Channel_System unk_comparable_board_cross_brand_burton=Unknown
% @importance 0.65

0.30::true_val(comparable_board_cross_brand_burton, burton_custom_twin); 0.70::true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton).
0.50::acc(s44, comparable_board_cross_brand_burton).
measured(s44, comparable_board_cross_brand_burton, burton_custom_twin).
all_consistent(comparable_board_cross_brand_burton) :- consistent(s44, comparable_board_cross_brand_burton).
evidence(all_consistent(comparable_board_cross_brand_burton)).
query(true_val(comparable_board_cross_brand_burton, burton_custom_twin)).
query(true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton)).

% @attr comparable_board_cross_brand_ns_proto
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (NS Proto)
% @values ns_proto=Never_Summer_Proto_3yr_warranty unk_comparable_board_cross_brand_ns_proto=Unknown
% @importance 0.65

0.30::true_val(comparable_board_cross_brand_ns_proto, ns_proto); 0.70::true_val(comparable_board_cross_brand_ns_proto, unk_comparable_board_cross_brand_ns_proto).
0.50::acc(s44, comparable_board_cross_brand_ns_proto).
measured(s44, comparable_board_cross_brand_ns_proto, ns_proto).
all_consistent(comparable_board_cross_brand_ns_proto) :- consistent(s44, comparable_board_cross_brand_ns_proto).
evidence(all_consistent(comparable_board_cross_brand_ns_proto)).
query(true_val(comparable_board_cross_brand_ns_proto, ns_proto)).
query(true_val(comparable_board_cross_brand_ns_proto, unk_comparable_board_cross_brand_ns_proto)).

% @attr comparable_board_cross_brand_other
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (other)
% @values another_am_freestyle_twin=Another_commonly_compared_all_mountain_freestyle_twin unk_comparable_board_cross_brand_other=Unknown
% @importance 0.65

0.30::true_val(comparable_board_cross_brand_other, another_am_freestyle_twin); 0.70::true_val(comparable_board_cross_brand_other, unk_comparable_board_cross_brand_other).
0.50::acc(s41, comparable_board_cross_brand_other).
measured(s41, comparable_board_cross_brand_other, another_am_freestyle_twin).
all_consistent(comparable_board_cross_brand_other) :- consistent(s41, comparable_board_cross_brand_other).
evidence(all_consistent(comparable_board_cross_brand_other)).
query(true_val(comparable_board_cross_brand_other, another_am_freestyle_twin)).
query(true_val(comparable_board_cross_brand_other, unk_comparable_board_cross_brand_other)).

% @attr comparable_board_cross_brand_yes_greats
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES Greats)
% @values yes_greats_xtrm=YES_Greats_XTRM_num1_all_mtn_freestyle unk_comparable_board_cross_brand_yes_greats=Unknown
% @importance 0.6

0.49::true_val(comparable_board_cross_brand_yes_greats, yes_greats_xtrm); 0.51::true_val(comparable_board_cross_brand_yes_greats, unk_comparable_board_cross_brand_yes_greats).
0.68::acc(s45, comparable_board_cross_brand_yes_greats).
measured(s45, comparable_board_cross_brand_yes_greats, yes_greats_xtrm).
all_consistent(comparable_board_cross_brand_yes_greats) :- consistent(s45, comparable_board_cross_brand_yes_greats).
evidence(all_consistent(comparable_board_cross_brand_yes_greats)).
query(true_val(comparable_board_cross_brand_yes_greats, yes_greats_xtrm)).
query(true_val(comparable_board_cross_brand_yes_greats, unk_comparable_board_cross_brand_yes_greats)).

% @attr user_review_forum
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values both_good_same_quality=Both_Burton_and_Mervin_good_products_same_quality unk_user_review_forum=Unknown
% @importance 0.7

0.30::true_val(user_review_forum, both_good_same_quality); 0.70::true_val(user_review_forum, unk_user_review_forum).
0.50::acc(s34, user_review_forum).
measured(s34, user_review_forum, both_good_same_quality).
all_consistent(user_review_forum) :- consistent(s34, user_review_forum).
evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, both_good_same_quality)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr condition_merchant
% @type categorical
% @canonical false
% @original_name Condition at listed merchant
% @values b_grade=B_Grade_slight_cosmetic_defects unk_condition_merchant=Unknown
% @importance 0.85

0.95::true_val(condition_merchant, b_grade); 0.05::true_val(condition_merchant, unk_condition_merchant).
0.95::acc(s_merchant, condition_merchant).
measured(s_merchant, condition_merchant, b_grade).
all_consistent(condition_merchant) :- consistent(s_merchant, condition_merchant).
evidence(all_consistent(condition_merchant)).
query(true_val(condition_merchant, b_grade)).
query(true_val(condition_merchant, unk_condition_merchant)).

% @attr merchant_sku
% @type categorical
% @canonical false
% @original_name Merchant SKU
% @values sku_24sn035_159=24SN035_159 unk_merchant_sku=Unknown
% @importance 0.85

0.95::true_val(merchant_sku, sku_24sn035_159); 0.05::true_val(merchant_sku, unk_merchant_sku).
0.95::acc(s_merchant, merchant_sku).
measured(s_merchant, merchant_sku, sku_24sn035_159).
all_consistent(merchant_sku) :- consistent(s_merchant, merchant_sku).
evidence(all_consistent(merchant_sku)).
query(true_val(merchant_sku, sku_24sn035_159)).
query(true_val(merchant_sku, unk_merchant_sku)).

% @attr merchant_discount
% @type numeric
% @canonical false
% @original_name Merchant discount
% @unit percent
% @values v30=30.0 unk_merchant_discount=Unknown
% @importance 0.85

0.95::true_val(merchant_discount, v30); 0.05::true_val(merchant_discount, unk_merchant_discount).
0.95::acc(s_merchant, merchant_discount).
measured(s_merchant, merchant_discount, v30).
all_consistent(merchant_discount) :- consistent(s_merchant, merchant_discount).
evidence(all_consistent(merchant_discount)).
query(true_val(merchant_discount, v30)).
query(true_val(merchant_discount, unk_merchant_discount)).

% @attr trs_c3_upgrade
% @type categorical
% @canonical false
% @original_name TRS C3 upgrade description
% @values lighter_core_c3=Upgraded_lighter_core_and_C3_camber_profile unk_trs_c3_upgrade=Unknown
% @importance 0.5

0.51::true_val(trs_c3_upgrade, lighter_core_c3); 0.49::true_val(trs_c3_upgrade, unk_trs_c3_upgrade).
0.60::acc(s5, trs_c3_upgrade).
measured(s5, trs_c3_upgrade, lighter_core_c3).
all_consistent(trs_c3_upgrade) :- consistent(s5, trs_c3_upgrade).
evidence(all_consistent(trs_c3_upgrade)).
query(true_val(trs_c3_upgrade, lighter_core_c3)).
query(true_val(trs_c3_upgrade, unk_trs_c3_upgrade)).