0.20::indep(s5).
0.15::indep(s2).
0.20::indep(s4).
0.15::indep(s27).
0.15::indep(s29).
0.20::indep(s30).
0.15::indep(s32).
0.15::indep(s33).
0.15::indep(s47).
0.10::indep(s48).
0.20::indep(s22).
0.20::indep(s26).
0.15::indep(s23).
0.15::indep(s24).
0.15::indep(s25).
0.12::indep(s46).
0.12::indep(s45).
0.15::indep(s16).
0.15::indep(s17).
0.15::indep(s7).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.97::acc(s1, brand).
0.85::acc(s2, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values rome=Rome_SDS unk_brand=Unknown
% @importance 0.95

0.95::true_val(brand, rome); 0.05::true_val(brand, unk_brand).

measured(s1, brand, rome).
measured(s2, brand, rome).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, rome)).
query(true_val(brand, unk_brand)).

0.97::acc(s1, model_name).
0.85::acc(s2, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values agent_pro=Agent_Pro unk_model_name=Unknown
% @importance 0.95

0.95::true_val(model_name, agent_pro); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, agent_pro).
measured(s2, model_name, agent_pro).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, agent_pro)).
query(true_val(model_name, unk_model_name)).

0.80::acc(s3, model_year).
0.75::acc(s4, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.875

0.92::true_val(model_year, y2027); 0.08::true_val(model_year, unk_model_year).

measured(s3, model_year, y2027).
measured(s4, model_year, y2027).

all_consistent(model_year) :-
    consistent(s3, model_year),
    (indep(s4), consistent(s4, model_year) ; \+indep(s4)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.97::acc(s1, product_type).
0.85::acc(s2, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.95

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type),
    (indep(s2), consistent(s2, product_type) ; \+indep(s2)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.80::acc(s5, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 0.95

0.76::true_val(board_category, freestyle_all_mountain); 0.24::true_val(board_category, unk_board_category).

measured(s5, board_category, freestyle_all_mountain).

all_consistent(board_category) :-
    consistent(s5, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

0.95::acc(s6, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.93::true_val(gender, mens); 0.07::true_val(gender, unk_gender).

measured(s6, gender, mens).

all_consistent(gender) :-
    consistent(s6, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.65::acc(s7, manufacturer).
0.82::acc(s8, manufacturer).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values rome_waterbury_vt=Rome_Snowboards_Waterbury_VT unk_manufacturer=Unknown
% @importance 0.50

0.92::true_val(manufacturer, rome_waterbury_vt); 0.08::true_val(manufacturer, unk_manufacturer).

measured(s7, manufacturer, rome_waterbury_vt).
measured(s8, manufacturer, rome_waterbury_vt).

all_consistent(manufacturer) :-
    consistent(s8, manufacturer),
    (indep(s7), consistent(s7, manufacturer) ; \+indep(s7)).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, rome_waterbury_vt)).
query(true_val(manufacturer, unk_manufacturer)).

0.70::acc(s9, manufacturer_founded).
0.85::acc(s10, manufacturer_founded).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y2001_reid_maravetz=2001_Josh_Reid_Paul_Maravetz unk_manufacturer_founded=Unknown
% @importance 0.425

0.93::true_val(manufacturer_founded, y2001_reid_maravetz); 0.07::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s9, manufacturer_founded, y2001_reid_maravetz).
measured(s10, manufacturer_founded, y2001_reid_maravetz).

all_consistent(manufacturer_founded) :-
    consistent(s9, manufacturer_founded),
    consistent(s10, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y2001_reid_maravetz)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

0.72::acc(s11, founders_background).
0.80::acc(s12, founders_background).

% @attr founders_background
% @type categorical
% @canonical false
% @original_name Founders background
% @values ex_burton=Previously_worked_at_Burton unk_founders_background=Unknown
% @importance 0.35

0.90::true_val(founders_background, ex_burton); 0.10::true_val(founders_background, unk_founders_background).

measured(s11, founders_background, ex_burton).
measured(s12, founders_background, ex_burton).

all_consistent(founders_background) :-
    consistent(s11, founders_background),
    consistent(s12, founders_background).

evidence(all_consistent(founders_background)).
query(true_val(founders_background, ex_burton)).
query(true_val(founders_background, unk_founders_background)).

0.85::acc(s13, manufacturing_location).
0.70::acc(s14, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values sws_dubai=SWS_Boards_Dubai unk_manufacturing_location=Unknown
% @importance 0.50

0.92::true_val(manufacturing_location, sws_dubai); 0.08::true_val(manufacturing_location, unk_manufacturing_location).

measured(s13, manufacturing_location, sws_dubai).
measured(s14, manufacturing_location, sws_dubai).

all_consistent(manufacturing_location) :-
    consistent(s13, manufacturing_location),
    consistent(s14, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, sws_dubai)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.70::acc(s15, headquarters_address).

% @attr headquarters_address
% @type categorical
% @canonical false
% @original_name Headquarters address
% @values derby_ln_waterbury=1_Derby_Ln_Suite_4_Waterbury_VT unk_headquarters_address=Unknown
% @importance 0.25

0.60::true_val(headquarters_address, derby_ln_waterbury); 0.40::true_val(headquarters_address, unk_headquarters_address).

measured(s15, headquarters_address, derby_ln_waterbury).

all_consistent(headquarters_address) :-
    consistent(s15, headquarters_address).

evidence(all_consistent(headquarters_address)).
query(true_val(headquarters_address, derby_ln_waterbury)).
query(true_val(headquarters_address, unk_headquarters_address)).

0.70::acc(s16, model_first_available_year).
0.72::acc(s17, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2024=2024_season unk_model_first_available_year=Unknown
% @importance 0.70

0.90::true_val(model_first_available_year, y2024); 0.10::true_val(model_first_available_year, unk_model_first_available_year).

measured(s16, model_first_available_year, y2024).
measured(s17, model_first_available_year, y2024).

all_consistent(model_first_available_year) :-
    consistent(s16, model_first_available_year),
    consistent(s17, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2024)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

0.82::acc(s18, predecessor_model_name).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values rome_agent=Rome_Agent unk_predecessor_model_name=Unknown
% @importance 0.50

0.78::true_val(predecessor_model_name, rome_agent); 0.22::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s18, predecessor_model_name, rome_agent).

all_consistent(predecessor_model_name) :-
    consistent(s18, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, rome_agent)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

0.90::acc(s19, model_series_lineage).

% @attr model_series_lineage
% @type categorical
% @canonical false
% @original_name Model series lineage
% @values since_inception=Agent_in_line_since_brand_inception unk_model_series_lineage=Unknown
% @importance 0.40

0.86::true_val(model_series_lineage, since_inception); 0.14::true_val(model_series_lineage, unk_model_series_lineage).

measured(s19, model_series_lineage, since_inception).

all_consistent(model_series_lineage) :-
    consistent(s19, model_series_lineage).

evidence(all_consistent(model_series_lineage)).
query(true_val(model_series_lineage, since_inception)).
query(true_val(model_series_lineage, unk_model_series_lineage)).

0.80::acc(s5, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1129_99=1129.99 unk_price_aud_merchant=Unknown
% @importance 0.95

0.76::true_val(price_aud_merchant, v1129_99); 0.24::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s5, price_aud_merchant, v1129_99).

all_consistent(price_aud_merchant) :-
    consistent(s5, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1129_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.95::acc(s6, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v629_95=629.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.93::true_val(price_usd_msrp, v629_95); 0.07::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s6, price_usd_msrp, v629_95).

all_consistent(price_usd_msrp) :-
    consistent(s6, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v629_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.88::acc(s20, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v440_96=440.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.84::true_val(price_usd_evo, v440_96); 0.16::true_val(price_usd_evo, unk_price_usd_evo).

measured(s20, price_usd_evo, v440_96).

all_consistent(price_usd_evo) :-
    consistent(s20, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v440_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.78::acc(s21, price_usd_blauer).

% @attr price_usd_blauer
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD) — The Good Ride lists Blauer Board Shop
% @values v503_96=503.96 unk_price_usd_blauer=Unknown
% @importance 0.90

0.66::true_val(price_usd_blauer, v503_96); 0.34::true_val(price_usd_blauer, unk_price_usd_blauer).

measured(s21, price_usd_blauer, v503_96).

all_consistent(price_usd_blauer) :-
    consistent(s21, price_usd_blauer).

evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v503_96)).
query(true_val(price_usd_blauer, unk_price_usd_blauer)).

0.78::acc(s21, price_usd_evo_tgr).

% @attr price_usd_evo_tgr
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo (TGR snapshot)
% @values v503_96=503.96 unk_price_usd_evo_tgr=Unknown
% @importance 0.90

0.66::true_val(price_usd_evo_tgr, v503_96); 0.34::true_val(price_usd_evo_tgr, unk_price_usd_evo_tgr).

measured(s21, price_usd_evo_tgr, v503_96).

all_consistent(price_usd_evo_tgr) :-
    consistent(s21, price_usd_evo_tgr).

evidence(all_consistent(price_usd_evo_tgr)).
query(true_val(price_usd_evo_tgr, v503_96)).
query(true_val(price_usd_evo_tgr, unk_price_usd_evo_tgr)).

0.75::acc(s22, price_usd_s2as).

% @attr price_usd_s2as
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD) — S2AS (UK retailer) for 2027 model
% @values v606_00=606.0 unk_price_usd_s2as=Unknown
% @importance 0.85

0.68::true_val(price_usd_s2as, v606_00); 0.32::true_val(price_usd_s2as, unk_price_usd_s2as).

measured(s22, price_usd_s2as, v606_00).

all_consistent(price_usd_s2as) :-
    consistent(s22, price_usd_s2as).

evidence(all_consistent(price_usd_s2as)).
query(true_val(price_usd_s2as, v606_00)).
query(true_val(price_usd_s2as, unk_price_usd_s2as)).

0.78::acc(s21, price_eur_blue_tomato).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v489_00=489.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.90

0.66::true_val(price_eur_blue_tomato, v489_00); 0.34::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s21, price_eur_blue_tomato, v489_00).

all_consistent(price_eur_blue_tomato) :-
    consistent(s21, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v489_00)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

0.78::acc(s21, price_gbp_blue_tomato_uk).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @unit GBP
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @values v440_00=440.0 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.90

0.66::true_val(price_gbp_blue_tomato_uk, v440_00); 0.34::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

measured(s21, price_gbp_blue_tomato_uk, v440_00).

all_consistent(price_gbp_blue_tomato_uk) :-
    consistent(s21, price_gbp_blue_tomato_uk).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v440_00)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

0.70::acc(s23, price_usd_exodus).

% @attr price_usd_exodus
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD) — Exodus Ride Shop 25/26
% @values v629_95=629.95 unk_price_usd_exodus=Unknown
% @importance 0.80

0.63::true_val(price_usd_exodus, v629_95); 0.37::true_val(price_usd_exodus, unk_price_usd_exodus).

measured(s23, price_usd_exodus, v629_95).

all_consistent(price_usd_exodus) :-
    consistent(s23, price_usd_exodus).

evidence(all_consistent(price_usd_exodus)).
query(true_val(price_usd_exodus, v629_95)).
query(true_val(price_usd_exodus, unk_price_usd_exodus)).

0.68::acc(s24, price_usd_exodus_2025_sale).

% @attr price_usd_exodus_2025_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD) — 2025 model on sale at Exodus
% @values v347_97=347.97 unk_price_usd_exodus_2025_sale=Unknown
% @importance 0.70

0.56::true_val(price_usd_exodus_2025_sale, v347_97); 0.44::true_val(price_usd_exodus_2025_sale, unk_price_usd_exodus_2025_sale).

measured(s24, price_usd_exodus_2025_sale, v347_97).

all_consistent(price_usd_exodus_2025_sale) :-
    consistent(s24, price_usd_exodus_2025_sale).

evidence(all_consistent(price_usd_exodus_2025_sale)).
query(true_val(price_usd_exodus_2025_sale, v347_97)).
query(true_val(price_usd_exodus_2025_sale, unk_price_usd_exodus_2025_sale)).

0.72::acc(s25, price_usd_msrp_2024).

% @attr price_usd_msrp_2024
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (2024 model)
% @values v589_95=589.95 unk_price_usd_msrp_2024=Unknown
% @importance 0.60

0.60::true_val(price_usd_msrp_2024, v589_95); 0.40::true_val(price_usd_msrp_2024, unk_price_usd_msrp_2024).

measured(s25, price_usd_msrp_2024, v589_95).

all_consistent(price_usd_msrp_2024) :-
    consistent(s25, price_usd_msrp_2024).

evidence(all_consistent(price_usd_msrp_2024)).
query(true_val(price_usd_msrp_2024, v589_95)).
query(true_val(price_usd_msrp_2024, unk_price_usd_msrp_2024)).

0.80::acc(s5, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 0.95

0.76::true_val(availability_status, preorder); 0.24::true_val(availability_status, unk_availability_status).

measured(s5, availability_status, preorder).

all_consistent(availability_status) :-
    consistent(s5, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

0.80::acc(s5, estimated_availability_date).

% @attr estimated_availability_date
% @type categorical
% @canonical false
% @original_name estimated_availability_date
% @values may_1_2026=May_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.95

0.76::true_val(estimated_availability_date, may_1_2026); 0.24::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s5, estimated_availability_date, may_1_2026).

all_consistent(estimated_availability_date) :-
    consistent(s5, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.93::acc(s6, availability_status_25_26_sale).

% @attr availability_status_25_26_sale
% @type categorical
% @canonical false
% @original_name availability_status (25/26 sale)
% @values on_sale_most_sold_out=On_sale_30pct_off_most_sizes_sold_out unk_availability_status_25_26_sale=Unknown
% @importance 1.0

0.91::true_val(availability_status_25_26_sale, on_sale_most_sold_out); 0.09::true_val(availability_status_25_26_sale, unk_availability_status_25_26_sale).

measured(s6, availability_status_25_26_sale, on_sale_most_sold_out).

all_consistent(availability_status_25_26_sale) :-
    consistent(s6, availability_status_25_26_sale).

evidence(all_consistent(availability_status_25_26_sale)).
query(true_val(availability_status_25_26_sale, on_sale_most_sold_out)).
query(true_val(availability_status_25_26_sale, unk_availability_status_25_26_sale)).

0.85::acc(s20, availability_status_evo_2026).

% @attr availability_status_evo_2026
% @type categorical
% @canonical false
% @original_name availability_status (evo 2026)
% @values in_stock=In_stock unk_availability_status_evo_2026=Unknown
% @importance 0.95

0.81::true_val(availability_status_evo_2026, in_stock); 0.19::true_val(availability_status_evo_2026, unk_availability_status_evo_2026).

measured(s20, availability_status_evo_2026, in_stock).

all_consistent(availability_status_evo_2026) :-
    consistent(s20, availability_status_evo_2026).

evidence(all_consistent(availability_status_evo_2026)).
query(true_val(availability_status_evo_2026, in_stock)).
query(true_val(availability_status_evo_2026, unk_availability_status_evo_2026)).

0.72::acc(s22, availability_status_2027_s2as).

% @attr availability_status_2027_s2as
% @type categorical
% @canonical false
% @original_name availability_status (2027 S2AS)
% @values preorder_low_stock=Preorder_low_stock unk_availability_status_2027_s2as=Unknown
% @importance 0.85

0.63::true_val(availability_status_2027_s2as, preorder_low_stock); 0.37::true_val(availability_status_2027_s2as, unk_availability_status_2027_s2as).

measured(s22, availability_status_2027_s2as, preorder_low_stock).

all_consistent(availability_status_2027_s2as) :-
    consistent(s22, availability_status_2027_s2as).

evidence(all_consistent(availability_status_2027_s2as)).
query(true_val(availability_status_2027_s2as, preorder_low_stock)).
query(true_val(availability_status_2027_s2as, unk_availability_status_2027_s2as)).

0.72::acc(s26, availability_status_2027_ballistyx).

% @attr availability_status_2027_ballistyx
% @type categorical
% @canonical false
% @original_name availability_status (2027 Ballistyx)
% @values preorder_2027=Preorder_2027 unk_availability_status_2027_ballistyx=Unknown
% @importance 0.75

0.60::true_val(availability_status_2027_ballistyx, preorder_2027); 0.40::true_val(availability_status_2027_ballistyx, unk_availability_status_2027_ballistyx).

measured(s26, availability_status_2027_ballistyx, preorder_2027).

all_consistent(availability_status_2027_ballistyx) :-
    consistent(s26, availability_status_2027_ballistyx).

evidence(all_consistent(availability_status_2027_ballistyx)).
query(true_val(availability_status_2027_ballistyx, preorder_2027)).
query(true_val(availability_status_2027_ballistyx, unk_availability_status_2027_ballistyx)).

0.65::acc(s27, availability_status_2027_boardertown).

% @attr availability_status_2027_boardertown
% @type categorical
% @canonical false
% @original_name availability_status (2027 Boardertown)
% @values listed_2027=Listed_2027 unk_availability_status_2027_boardertown=Unknown
% @importance 0.60

0.52::true_val(availability_status_2027_boardertown, listed_2027); 0.48::true_val(availability_status_2027_boardertown, unk_availability_status_2027_boardertown).

measured(s27, availability_status_2027_boardertown, listed_2027).

all_consistent(availability_status_2027_boardertown) :-
    consistent(s27, availability_status_2027_boardertown).

evidence(all_consistent(availability_status_2027_boardertown)).
query(true_val(availability_status_2027_boardertown, listed_2027)).
query(true_val(availability_status_2027_boardertown, unk_availability_status_2027_boardertown)).

0.95::acc(s6, shape).
0.93::acc(s28, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.95

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).

measured(s6, shape, true_twin).
measured(s28, shape, true_twin).

all_consistent(shape) :-
    consistent(s6, shape),
    consistent(s28, shape).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

0.95::acc(s6, camber_type).
0.93::acc(s28, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values fusion_camber=Fusion_Camber unk_camber_type=Unknown
% @importance 0.95

0.95::true_val(camber_type, fusion_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s6, camber_type, fusion_camber).
measured(s28, camber_type, fusion_camber).

all_consistent(camber_type) :-
    consistent(s6, camber_type),
    consistent(s28, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, fusion_camber)).
query(true_val(camber_type, unk_camber_type)).

0.95::acc(s6, flex_rating_10_manufacturer).
0.93::acc(s28, flex_rating_10_manufacturer).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v7=7.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.95

0.95::true_val(flex_rating_10_manufacturer, v7); 0.05::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s6, flex_rating_10_manufacturer, v7).
measured(s28, flex_rating_10_manufacturer, v7).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s6, flex_rating_10_manufacturer),
    consistent(s28, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v7)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

0.95::acc(s6, sidecut_type).
0.93::acc(s28, sidecut_type).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radial=Radial_Sidecut unk_sidecut_type=Unknown
% @importance 0.95

0.95::true_val(sidecut_type, radial); 0.05::true_val(sidecut_type, unk_sidecut_type).

measured(s6, sidecut_type, radial).
measured(s28, sidecut_type, radial).

all_consistent(sidecut_type) :-
    consistent(s6, sidecut_type),
    consistent(s28, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

0.95::acc(s6, nose_tail_feature).
0.93::acc(s28, nose_tail_feature).

% @attr nose_tail_feature
% @type categorical
% @canonical false
% @original_name Nose/tail feature
% @values twin_double_kick=Twin_Double_Kick unk_nose_tail_feature=Unknown
% @importance 0.95

0.95::true_val(nose_tail_feature, twin_double_kick); 0.05::true_val(nose_tail_feature, unk_nose_tail_feature).

measured(s6, nose_tail_feature, twin_double_kick).
measured(s28, nose_tail_feature, twin_double_kick).

all_consistent(nose_tail_feature) :-
    consistent(s6, nose_tail_feature),
    consistent(s28, nose_tail_feature).

evidence(all_consistent(nose_tail_feature)).
query(true_val(nose_tail_feature, twin_double_kick)).
query(true_val(nose_tail_feature, unk_nose_tail_feature)).

0.93::acc(s6, taper).
0.80::acc(s5, taper).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v0=0.0 unk_taper=Unknown
% @importance 0.975

0.95::true_val(taper, v0); 0.05::true_val(taper, unk_taper).

measured(s6, taper, v0).
measured(s5, taper, v0).

all_consistent(taper) :-
    consistent(s6, taper),
    (indep(s5), consistent(s5, taper) ; \+indep(s5)).

evidence(all_consistent(taper)).
query(true_val(taper, v0)).
query(true_val(taper, unk_taper)).

0.95::acc(s6, setback).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v0_0=0.0 unk_setback=Unknown
% @importance 1.0

0.93::true_val(setback, v0_0); 0.07::true_val(setback, unk_setback).

measured(s6, setback, v0_0).

all_consistent(setback) :-
    consistent(s6, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v0_0)).
query(true_val(setback, unk_setback)).

0.80::acc(s5, mounting_pattern).
0.70::acc(s29, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values x2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.775

0.92::true_val(mounting_pattern, x2x4); 0.08::true_val(mounting_pattern, unk_mounting_pattern).

measured(s5, mounting_pattern, x2x4).
measured(s29, mounting_pattern, x2x4).

all_consistent(mounting_pattern) :-
    (indep(s5), consistent(s5, mounting_pattern) ; \+indep(s5)),
    (indep(s29), consistent(s29, mounting_pattern) ; \+indep(s29)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, x2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.95::acc(s6, number_of_inserts).

% @attr number_of_inserts
% @type numeric
% @canonical false
% @original_name Number of inserts
% @values v24=24 unk_number_of_inserts=Unknown
% @importance 1.0

0.93::true_val(number_of_inserts, v24); 0.07::true_val(number_of_inserts, unk_number_of_inserts).

measured(s6, number_of_inserts, v24).

all_consistent(number_of_inserts) :-
    consistent(s6, number_of_inserts).

evidence(all_consistent(number_of_inserts)).
query(true_val(number_of_inserts, v24)).
query(true_val(number_of_inserts, unk_number_of_inserts)).

0.80::acc(s5, available_sizes).
0.95::acc(s6, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values eight_sizes=148_151_154_155W_157_158W_160_161W unk_available_sizes=Unknown
% @importance 0.975

0.95::true_val(available_sizes, eight_sizes); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s5, available_sizes, eight_sizes).
measured(s6, available_sizes, eight_sizes).

all_consistent(available_sizes) :-
    consistent(s6, available_sizes),
    (indep(s5), consistent(s5, available_sizes) ; \+indep(s5)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, eight_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

0.80::acc(s5, width_options).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.95

0.76::true_val(width_options, standard_and_wide); 0.24::true_val(width_options, unk_width_options).

measured(s5, width_options, standard_and_wide).

all_consistent(width_options) :-
    consistent(s5, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

0.80::acc(s5, core_material).
0.75::acc(s30, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values superpop=SuperPop_Poplar_Paulownia unk_core_material=Unknown
% @importance 0.875

0.93::true_val(core_material, superpop); 0.07::true_val(core_material, unk_core_material).

measured(s5, core_material, superpop).
measured(s30, core_material, superpop).

all_consistent(core_material) :-
    (indep(s5), consistent(s5, core_material) ; \+indep(s5)),
    (indep(s30), consistent(s30, core_material) ; \+indep(s30)).

evidence(all_consistent(core_material)).
query(true_val(core_material, superpop)).
query(true_val(core_material, unk_core_material)).

0.78::acc(s30, core_description).
0.76::acc(s31, core_description).

% @attr core_description
% @type categorical
% @canonical false
% @original_name Core description
% @values lightest_most_responsive=Lightest_most_responsive_max_energy_return unk_core_description=Unknown
% @importance 0.75

0.90::true_val(core_description, lightest_most_responsive); 0.10::true_val(core_description, unk_core_description).

measured(s30, core_description, lightest_most_responsive).
measured(s31, core_description, lightest_most_responsive).

all_consistent(core_description) :-
    (indep(s30), consistent(s30, core_description) ; \+indep(s30)),
    (indep(s5), consistent(s31, core_description) ; \+indep(s5)).

evidence(all_consistent(core_description)).
query(true_val(core_description, lightest_most_responsive)).
query(true_val(core_description, unk_core_description)).

0.80::acc(s5, construction_material_innovation).
0.95::acc(s6, construction_material_innovation).
0.93::acc(s28, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_omega_hotrods=Twin_Single_Carbon_Omega_HotRods unk_construction_material_innovation=Unknown
% @importance 0.93

0.95::true_val(construction_material_innovation, carbon_omega_hotrods); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s5, construction_material_innovation, carbon_omega_hotrods).
measured(s6, construction_material_innovation, carbon_omega_hotrods).
measured(s28, construction_material_innovation, carbon_omega_hotrods).

all_consistent(construction_material_innovation) :-
    consistent(s6, construction_material_innovation),
    consistent(s28, construction_material_innovation),
    (indep(s5), consistent(s5, construction_material_innovation) ; \+indep(s5)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_omega_hotrods)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.80::acc(s5, laminate).
0.70::acc(s32, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biax_upper=Biax_Upper_Glass unk_laminate=Unknown
% @importance 0.775

0.92::true_val(laminate, biax_upper); 0.08::true_val(laminate, unk_laminate).

measured(s5, laminate, biax_upper).
measured(s32, laminate, biax_upper).

all_consistent(laminate) :-
    (indep(s5), consistent(s5, laminate) ; \+indep(s5)),
    (indep(s32), consistent(s32, laminate) ; \+indep(s32)).

evidence(all_consistent(laminate)).
query(true_val(laminate, biax_upper)).
query(true_val(laminate, unk_laminate)).

0.80::acc(s5, laminate_lower).
0.90::acc(s6, laminate_lower).

% @attr laminate_lower
% @type categorical
% @canonical false
% @original_name laminate (lower glass)
% @values biax_lower=Biax_Lower_Glass triax_lower=Triax_Lower_Glass
% @importance 0.875

0.60::true_val(laminate_lower, biax_lower); 0.40::true_val(laminate_lower, triax_lower).

measured(s5, laminate_lower, biax_lower).
measured(s6, laminate_lower, triax_lower).

all_consistent(laminate_lower) :-
    consistent(s6, laminate_lower),
    (indep(s5), consistent(s5, laminate_lower) ; \+indep(s5)).

evidence(all_consistent(laminate_lower)).
query(true_val(laminate_lower, biax_lower)).
query(true_val(laminate_lower, triax_lower)).

0.80::acc(s5, sidewall_material).
0.95::acc(s6, sidewall_material).
0.82::acc(s33, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values twin_flax_walls=Twin_Flax_Walls unk_sidewall_material=Unknown
% @importance 0.90

0.95::true_val(sidewall_material, twin_flax_walls); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s5, sidewall_material, twin_flax_walls).
measured(s6, sidewall_material, twin_flax_walls).
measured(s33, sidewall_material, twin_flax_walls).

all_consistent(sidewall_material) :-
    consistent(s6, sidewall_material),
    (indep(s5), consistent(s5, sidewall_material) ; \+indep(s5)),
    (indep(s33), consistent(s33, sidewall_material) ; \+indep(s33)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, twin_flax_walls)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.82::acc(s33, sidewall_function).

% @attr sidewall_function
% @type categorical
% @canonical false
% @original_name Sidewall function
% @values strength_nose_tail=Strength_nose_tail_ollie_load_landing_absorb unk_sidewall_function=Unknown
% @importance 0.75

0.74::true_val(sidewall_function, strength_nose_tail); 0.26::true_val(sidewall_function, unk_sidewall_function).

measured(s33, sidewall_function, strength_nose_tail).

all_consistent(sidewall_function) :-
    consistent(s33, sidewall_function).

evidence(all_consistent(sidewall_function)).
query(true_val(sidewall_function, strength_nose_tail)).
query(true_val(sidewall_function, unk_sidewall_function)).

0.80::acc(s5, construction_material_innovation_flax).
0.95::acc(s6, construction_material_innovation_flax).
0.95::acc(s34, construction_material_innovation_flax).

% @attr construction_material_innovation_flax
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Flax Impact Plates)
% @values flax_impact_plates=Flax_Impact_Plates unk_construction_material_innovation_flax=Unknown
% @importance 0.85

0.95::true_val(construction_material_innovation_flax, flax_impact_plates); 0.05::true_val(construction_material_innovation_flax, unk_construction_material_innovation_flax).

measured(s5, construction_material_innovation_flax, flax_impact_plates).
measured(s6, construction_material_innovation_flax, flax_impact_plates).
measured(s34, construction_material_innovation_flax, flax_impact_plates).

all_consistent(construction_material_innovation_flax) :-
    consistent(s6, construction_material_innovation_flax),
    consistent(s34, construction_material_innovation_flax),
    (indep(s5), consistent(s5, construction_material_innovation_flax) ; \+indep(s5)).

evidence(all_consistent(construction_material_innovation_flax)).
query(true_val(construction_material_innovation_flax, flax_impact_plates)).
query(true_val(construction_material_innovation_flax, unk_construction_material_innovation_flax)).

0.95::acc(s34, impact_plate_function).

% @attr impact_plate_function
% @type categorical
% @canonical false
% @original_name Impact plate function
% @values withstand_distribute_lifespan=Withstand_landings_distribute_impact_increase_lifespan unk_impact_plate_function=Unknown
% @importance 0.75

0.90::true_val(impact_plate_function, withstand_distribute_lifespan); 0.10::true_val(impact_plate_function, unk_impact_plate_function).

measured(s34, impact_plate_function, withstand_distribute_lifespan).

all_consistent(impact_plate_function) :-
    consistent(s34, impact_plate_function).

evidence(all_consistent(impact_plate_function)).
query(true_val(impact_plate_function, withstand_distribute_lifespan)).
query(true_val(impact_plate_function, unk_impact_plate_function)).

0.80::acc(s5, base_material).
0.95::acc(s6, base_material).
0.93::acc(s28, base_material).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sinterspeed=SinterSpeed_Base unk_base_material=Unknown
% @importance 0.93

0.95::true_val(base_material, sinterspeed); 0.05::true_val(base_material, unk_base_material).

measured(s5, base_material, sinterspeed).
measured(s6, base_material, sinterspeed).
measured(s28, base_material, sinterspeed).

all_consistent(base_material) :-
    consistent(s6, base_material),
    consistent(s28, base_material),
    (indep(s5), consistent(s5, base_material) ; \+indep(s5)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sinterspeed)).
query(true_val(base_material, unk_base_material)).

0.93::acc(s28, base_description).

% @attr base_description
% @type categorical
% @canonical false
% @original_name Base description
% @values max_speed_high_perf=Max_speed_high_performance unk_base_description=Unknown
% @importance 0.90

0.88::true_val(base_description, max_speed_high_perf); 0.12::true_val(base_description, unk_base_description).

measured(s28, base_description, max_speed_high_perf).

all_consistent(base_description) :-
    consistent(s28, base_description).

evidence(all_consistent(base_description)).
query(true_val(base_description, max_speed_high_perf)).
query(true_val(base_description, unk_base_description)).

0.80::acc(s5, effective_edge_148).
0.95::acc(s6, effective_edge_148).

% @attr effective_edge_148
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 148cm
% @values v113_9=113.9 unk_effective_edge_148=Unknown
% @importance 0.975

0.95::true_val(effective_edge_148, v113_9); 0.05::true_val(effective_edge_148, unk_effective_edge_148).

measured(s5, effective_edge_148, v113_9).
measured(s6, effective_edge_148, v113_9).

all_consistent(effective_edge_148) :-
    consistent(s6, effective_edge_148),
    (indep(s5), consistent(s5, effective_edge_148) ; \+indep(s5)).

evidence(all_consistent(effective_edge_148)).
query(true_val(effective_edge_148, v113_9)).
query(true_val(effective_edge_148, unk_effective_edge_148)).

0.80::acc(s5, effective_edge_151).
0.95::acc(s6, effective_edge_151).

% @attr effective_edge_151
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 151cm
% @values v116_5=116.5 unk_effective_edge_151=Unknown
% @importance 0.975

0.95::true_val(effective_edge_151, v116_5); 0.05::true_val(effective_edge_151, unk_effective_edge_151).

measured(s5, effective_edge_151, v116_5).
measured(s6, effective_edge_151, v116_5).

all_consistent(effective_edge_151) :-
    consistent(s6, effective_edge_151),
    (indep(s5), consistent(s5, effective_edge_151) ; \+indep(s5)).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v116_5)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

0.80::acc(s5, effective_edge_154).
0.95::acc(s6, effective_edge_154).

% @attr effective_edge_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 154cm
% @values v119_2=119.2 unk_effective_edge_154=Unknown
% @importance 0.975

0.95::true_val(effective_edge_154, v119_2); 0.05::true_val(effective_edge_154, unk_effective_edge_154).

measured(s5, effective_edge_154, v119_2).
measured(s6, effective_edge_154, v119_2).

all_consistent(effective_edge_154) :-
    consistent(s6, effective_edge_154),
    (indep(s5), consistent(s5, effective_edge_154) ; \+indep(s5)).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v119_2)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

0.80::acc(s5, effective_edge_157).
0.95::acc(s6, effective_edge_157).

% @attr effective_edge_157
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 157cm
% @values v121_9=121.9 unk_effective_edge_157=Unknown
% @importance 0.975

0.95::true_val(effective_edge_157, v121_9); 0.05::true_val(effective_edge_157, unk_effective_edge_157).

measured(s5, effective_edge_157, v121_9).
measured(s6, effective_edge_157, v121_9).

all_consistent(effective_edge_157) :-
    consistent(s6, effective_edge_157),
    (indep(s5), consistent(s5, effective_edge_157) ; \+indep(s5)).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v121_9)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

0.80::acc(s5, effective_edge_160).
0.95::acc(s6, effective_edge_160).

% @attr effective_edge_160
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 160cm
% @values v124_6=124.6 unk_effective_edge_160=Unknown
% @importance 0.975

0.95::true_val(effective_edge_160, v124_6); 0.05::true_val(effective_edge_160, unk_effective_edge_160).

measured(s5, effective_edge_160, v124_6).
measured(s6, effective_edge_160, v124_6).

all_consistent(effective_edge_160) :-
    consistent(s6, effective_edge_160),
    (indep(s5), consistent(s5, effective_edge_160) ; \+indep(s5)).

evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v124_6)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

0.80::acc(s5, effective_edge_155w).
0.95::acc(s6, effective_edge_155w).

% @attr effective_edge_155w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 155W
% @values v120_1=120.1 unk_effective_edge_155w=Unknown
% @importance 0.975

0.95::true_val(effective_edge_155w, v120_1); 0.05::true_val(effective_edge_155w, unk_effective_edge_155w).

measured(s5, effective_edge_155w, v120_1).
measured(s6, effective_edge_155w, v120_1).

all_consistent(effective_edge_155w) :-
    consistent(s6, effective_edge_155w),
    (indep(s5), consistent(s5, effective_edge_155w) ; \+indep(s5)).

evidence(all_consistent(effective_edge_155w)).
query(true_val(effective_edge_155w, v120_1)).
query(true_val(effective_edge_155w, unk_effective_edge_155w)).

0.80::acc(s5, effective_edge_158w).
0.95::acc(s6, effective_edge_158w).

% @attr effective_edge_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 158W
% @values v122_8=122.8 unk_effective_edge_158w=Unknown
% @importance 0.975

0.95::true_val(effective_edge_158w, v122_8); 0.05::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(s5, effective_edge_158w, v122_8).
measured(s6, effective_edge_158w, v122_8).

all_consistent(effective_edge_158w) :-
    consistent(s6, effective_edge_158w),
    (indep(s5), consistent(s5, effective_edge_158w) ; \+indep(s5)).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v122_8)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

0.80::acc(s5, effective_edge_161w).
0.95::acc(s6, effective_edge_161w).

% @attr effective_edge_161w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 161W
% @values v125_5=125.5 unk_effective_edge_161w=Unknown
% @importance 0.975

0.95::true_val(effective_edge_161w, v125_5); 0.05::true_val(effective_edge_161w, unk_effective_edge_161w).

measured(s5, effective_edge_161w, v125_5).
measured(s6, effective_edge_161w, v125_5).

all_consistent(effective_edge_161w) :-
    consistent(s6, effective_edge_161w),
    (indep(s5), consistent(s5, effective_edge_161w) ; \+indep(s5)).

evidence(all_consistent(effective_edge_161w)).
query(true_val(effective_edge_161w, v125_5)).
query(true_val(effective_edge_161w, unk_effective_edge_161w)).

0.80::acc(s5, waist_width_148).
0.95::acc(s6, waist_width_148).

% @attr waist_width_148
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 148cm
% @values v25_2=25.2 unk_waist_width_148=Unknown
% @importance 0.975

0.95::true_val(waist_width_148, v25_2); 0.05::true_val(waist_width_148, unk_waist_width_148).

measured(s5, waist_width_148, v25_2).
measured(s6, waist_width_148, v25_2).

all_consistent(waist_width_148) :-
    consistent(s6, waist_width_148),
    (indep(s5), consistent(s5, waist_width_148) ; \+indep(s5)).

evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v25_2)).
query(true_val(waist_width_148, unk_waist_width_148)).

0.80::acc(s5, waist_width_151).
0.95::acc(s6, waist_width_151).

% @attr waist_width_151
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 151cm
% @values v25_3=25.3 unk_waist_width_151=Unknown
% @importance 0.975

0.95::true_val(waist_width_151, v25_3); 0.05::true_val(waist_width_151, unk_waist_width_151).

measured(s5, waist_width_151, v25_3).
measured(s6, waist_width_151, v25_3).

all_consistent(waist_width_151) :-
    consistent(s6, waist_width_151),
    (indep(s5), consistent(s5, waist_width_151) ; \+indep(s5)).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v25_3)).
query(true_val(waist_width_151, unk_waist_width_151)).

0.80::acc(s5, waist_width_154).
0.95::acc(s6, waist_width_154).

% @attr waist_width_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 154cm
% @values v25_5=25.5 unk_waist_width_154=Unknown
% @importance 0.975

0.95::true_val(waist_width_154, v25_5); 0.05::true_val(waist_width_154, unk_waist_width_154).

measured(s5, waist_width_154, v25_5).
measured(s6, waist_width_154, v25_5).

all_consistent(waist_width_154) :-
    consistent(s6, waist_width_154),
    (indep(s5), consistent(s5, waist_width_154) ; \+indep(s5)).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_5)).
query(true_val(waist_width_154, unk_waist_width_154)).

0.80::acc(s5, waist_width_157).
0.95::acc(s6, waist_width_157).

% @attr waist_width_157
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 157cm
% @values v25_7=25.7 unk_waist_width_157=Unknown
% @importance 0.975

0.95::true_val(waist_width_157, v25_7); 0.05::true_val(waist_width_157, unk_waist_width_157).

measured(s5, waist_width_157, v25_7).
measured(s6, waist_width_157, v25_7).

all_consistent(waist_width_157) :-
    consistent(s6, waist_width_157),
    (indep(s5), consistent(s5, waist_width_157) ; \+indep(s5)).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_7)).
query(true_val(waist_width_157, unk_waist_width_157)).

0.80::acc(s5, waist_width_160).
0.95::acc(s6, waist_width_160).

% @attr waist_width_160
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 160cm
% @values v25_8=25.8 unk_waist_width_160=Unknown
% @importance 0.975

0.95::true_val(waist_width_160, v25_8); 0.05::true_val(waist_width_160, unk_waist_width_160).

measured(s5, waist_width_160, v25_8).
measured(s6, waist_width_160, v25_8).

all_consistent(waist_width_160) :-
    consistent(s6, waist_width_160),
    (indep(s5), consistent(s5, waist_width_160) ; \+indep(s5)).

evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v25_8)).
query(true_val(waist_width_160, unk_waist_width_160)).

0.80::acc(s5, waist_width_155w).
0.95::acc(s6, waist_width_155w).

% @attr waist_width_155w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 155W
% @values v26_5=26.5 unk_waist_width_155w=Unknown
% @importance 0.975

0.95::true_val(waist_width_155w, v26_5); 0.05::true_val(waist_width_155w, unk_waist_width_155w).

measured(s5, waist_width_155w, v26_5).
measured(s6, waist_width_155w, v26_5).

all_consistent(waist_width_155w) :-
    consistent(s6, waist_width_155w),
    (indep(s5), consistent(s5, waist_width_155w) ; \+indep(s5)).

evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v26_5)).
query(true_val(waist_width_155w, unk_waist_width_155w)).

0.80::acc(s5, waist_width_158w).
0.95::acc(s6, waist_width_158w).

% @attr waist_width_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 158W
% @values v26_7=26.7 unk_waist_width_158w=Unknown
% @importance 0.975

0.95::true_val(waist_width_158w, v26_7); 0.05::true_val(waist_width_158w, unk_waist_width_158w).

measured(s5, waist_width_158w, v26_7).
measured(s6, waist_width_158w, v26_7).

all_consistent(waist_width_158w) :-
    consistent(s6, waist_width_158w),
    (indep(s5), consistent(s5, waist_width_158w) ; \+indep(s5)).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_7)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

0.80::acc(s5, waist_width_161w).
0.95::acc(s6, waist_width_161w).

% @attr waist_width_161w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 161W
% @values v26_9=26.9 unk_waist_width_161w=Unknown
% @importance 0.975

0.95::true_val(waist_width_161w, v26_9); 0.05::true_val(waist_width_161w, unk_waist_width_161w).

measured(s5, waist_width_161w, v26_9).
measured(s6, waist_width_161w, v26_9).

all_consistent(waist_width_161w) :-
    consistent(s6, waist_width_161w),
    (indep(s5), consistent(s5, waist_width_161w) ; \+indep(s5)).

evidence(all_consistent(waist_width_161w)).
query(true_val(waist_width_161w, v26_9)).
query(true_val(waist_width_161w, unk_waist_width_161w)).

0.95::acc(s6, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size (157cm)
% @values v8_11=8.11 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_size, v8_11); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s6, sidecut_radius_size, v8_11).

all_consistent(sidecut_radius_size) :-
    consistent(s6, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_11)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.95::acc(s6, sidecut_radius_148).

% @attr sidecut_radius_148
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (148cm)
% @values v7_57=7.57 unk_sidecut_radius_148=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_148, v7_57); 0.07::true_val(sidecut_radius_148, unk_sidecut_radius_148).

measured(s6, sidecut_radius_148, v7_57).

all_consistent(sidecut_radius_148) :-
    consistent(s6, sidecut_radius_148).

evidence(all_consistent(sidecut_radius_148)).
query(true_val(sidecut_radius_148, v7_57)).
query(true_val(sidecut_radius_148, unk_sidecut_radius_148)).

0.95::acc(s6, sidecut_radius_151).

% @attr sidecut_radius_151
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (151cm)
% @values v7_75=7.75 unk_sidecut_radius_151=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_151, v7_75); 0.07::true_val(sidecut_radius_151, unk_sidecut_radius_151).

measured(s6, sidecut_radius_151, v7_75).

all_consistent(sidecut_radius_151) :-
    consistent(s6, sidecut_radius_151).

evidence(all_consistent(sidecut_radius_151)).
query(true_val(sidecut_radius_151, v7_75)).
query(true_val(sidecut_radius_151, unk_sidecut_radius_151)).

0.95::acc(s6, sidecut_radius_154).

% @attr sidecut_radius_154
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (154cm)
% @values v7_93=7.93 unk_sidecut_radius_154=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_154, v7_93); 0.07::true_val(sidecut_radius_154, unk_sidecut_radius_154).

measured(s6, sidecut_radius_154, v7_93).

all_consistent(sidecut_radius_154) :-
    consistent(s6, sidecut_radius_154).

evidence(all_consistent(sidecut_radius_154)).
query(true_val(sidecut_radius_154, v7_93)).
query(true_val(sidecut_radius_154, unk_sidecut_radius_154)).

0.95::acc(s6, sidecut_radius_155w).

% @attr sidecut_radius_155w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (155W)
% @values v7_99=7.99 unk_sidecut_radius_155w=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_155w, v7_99); 0.07::true_val(sidecut_radius_155w, unk_sidecut_radius_155w).

measured(s6, sidecut_radius_155w, v7_99).

all_consistent(sidecut_radius_155w) :-
    consistent(s6, sidecut_radius_155w).

evidence(all_consistent(sidecut_radius_155w)).
query(true_val(sidecut_radius_155w, v7_99)).
query(true_val(sidecut_radius_155w, unk_sidecut_radius_155w)).

0.95::acc(s6, sidecut_radius_158w).

% @attr sidecut_radius_158w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (158W)
% @values v8_17=8.17 unk_sidecut_radius_158w=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_158w, v8_17); 0.07::true_val(sidecut_radius_158w, unk_sidecut_radius_158w).

measured(s6, sidecut_radius_158w, v8_17).

all_consistent(sidecut_radius_158w) :-
    consistent(s6, sidecut_radius_158w).

evidence(all_consistent(sidecut_radius_158w)).
query(true_val(sidecut_radius_158w, v8_17)).
query(true_val(sidecut_radius_158w, unk_sidecut_radius_158w)).

0.95::acc(s6, sidecut_radius_160).

% @attr sidecut_radius_160
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (160cm)
% @values v8_29=8.29 unk_sidecut_radius_160=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_160, v8_29); 0.07::true_val(sidecut_radius_160, unk_sidecut_radius_160).

measured(s6, sidecut_radius_160, v8_29).

all_consistent(sidecut_radius_160) :-
    consistent(s6, sidecut_radius_160).

evidence(all_consistent(sidecut_radius_160)).
query(true_val(sidecut_radius_160, v8_29)).
query(true_val(sidecut_radius_160, unk_sidecut_radius_160)).

0.95::acc(s6, sidecut_radius_161w).

% @attr sidecut_radius_161w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (161W)
% @values v8_35=8.35 unk_sidecut_radius_161w=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_161w, v8_35); 0.07::true_val(sidecut_radius_161w, unk_sidecut_radius_161w).

measured(s6, sidecut_radius_161w, v8_35).

all_consistent(sidecut_radius_161w) :-
    consistent(s6, sidecut_radius_161w).

evidence(all_consistent(sidecut_radius_161w)).
query(true_val(sidecut_radius_161w, v8_35)).
query(true_val(sidecut_radius_161w, unk_sidecut_radius_161w)).

0.95::acc(s6, contact_length_size).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size (157cm)
% @values v114_9=114.9 unk_contact_length_size=Unknown
% @importance 1.0

0.93::true_val(contact_length_size, v114_9); 0.07::true_val(contact_length_size, unk_contact_length_size).

measured(s6, contact_length_size, v114_9).

all_consistent(contact_length_size) :-
    consistent(s6, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v114_9)).
query(true_val(contact_length_size, unk_contact_length_size)).

0.95::acc(s6, contact_length_148).

% @attr contact_length_148
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (148cm)
% @values v107_0=107.0 unk_contact_length_148=Unknown
% @importance 1.0

0.93::true_val(contact_length_148, v107_0); 0.07::true_val(contact_length_148, unk_contact_length_148).

measured(s6, contact_length_148, v107_0).

all_consistent(contact_length_148) :-
    consistent(s6, contact_length_148).

evidence(all_consistent(contact_length_148)).
query(true_val(contact_length_148, v107_0)).
query(true_val(contact_length_148, unk_contact_length_148)).

0.95::acc(s6, contact_length_151).

% @attr contact_length_151
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (151cm)
% @values v109_6=109.6 unk_contact_length_151=Unknown
% @importance 1.0

0.93::true_val(contact_length_151, v109_6); 0.07::true_val(contact_length_151, unk_contact_length_151).

measured(s6, contact_length_151, v109_6).

all_consistent(contact_length_151) :-
    consistent(s6, contact_length_151).

evidence(all_consistent(contact_length_151)).
query(true_val(contact_length_151, v109_6)).
query(true_val(contact_length_151, unk_contact_length_151)).

0.95::acc(s6, contact_length_154).

% @attr contact_length_154
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (154cm)
% @values v112_3=112.3 unk_contact_length_154=Unknown
% @importance 1.0

0.93::true_val(contact_length_154, v112_3); 0.07::true_val(contact_length_154, unk_contact_length_154).

measured(s6, contact_length_154, v112_3).

all_consistent(contact_length_154) :-
    consistent(s6, contact_length_154).

evidence(all_consistent(contact_length_154)).
query(true_val(contact_length_154, v112_3)).
query(true_val(contact_length_154, unk_contact_length_154)).

0.95::acc(s6, contact_length_155w).

% @attr contact_length_155w
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (155W)
% @values v113_1=113.1 unk_contact_length_155w=Unknown
% @importance 1.0

0.93::true_val(contact_length_155w, v113_1); 0.07::true_val(contact_length_155w, unk_contact_length_155w).

measured(s6, contact_length_155w, v113_1).

all_consistent(contact_length_155w) :-
    consistent(s6, contact_length_155w).

evidence(all_consistent(contact_length_155w)).
query(true_val(contact_length_155w, v113_1)).
query(true_val(contact_length_155w, unk_contact_length_155w)).

0.95::acc(s6, contact_length_158w).

% @attr contact_length_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (158W)
% @values v115_7=115.7 unk_contact_length_158w=Unknown
% @importance 1.0

0.93::true_val(contact_length_158w, v115_7); 0.07::true_val(contact_length_158w, unk_contact_length_158w).

measured(s6, contact_length_158w, v115_7).

all_consistent(contact_length_158w) :-
    consistent(s6, contact_length_158w).

evidence(all_consistent(contact_length_158w)).
query(true_val(contact_length_158w, v115_7)).
query(true_val(contact_length_158w, unk_contact_length_158w)).

0.95::acc(s6, contact_length_160).

% @attr contact_length_160
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (160cm)
% @values v117_5=117.5 unk_contact_length_160=Unknown
% @importance 1.0

0.93::true_val(contact_length_160, v117_5); 0.07::true_val(contact_length_160, unk_contact_length_160).

measured(s6, contact_length_160, v117_5).

all_consistent(contact_length_160) :-
    consistent(s6, contact_length_160).

evidence(all_consistent(contact_length_160)).
query(true_val(contact_length_160, v117_5)).
query(true_val(contact_length_160, unk_contact_length_160)).

0.95::acc(s6, contact_length_161w).

% @attr contact_length_161w
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (161W)
% @values v118_4=118.4 unk_contact_length_161w=Unknown
% @importance 1.0

0.93::true_val(contact_length_161w, v118_4); 0.07::true_val(contact_length_161w, unk_contact_length_161w).

measured(s6, contact_length_161w, v118_4).

all_consistent(contact_length_161w) :-
    consistent(s6, contact_length_161w).

evidence(all_consistent(contact_length_161w)).
query(true_val(contact_length_161w, v118_4)).
query(true_val(contact_length_161w, unk_contact_length_161w)).

0.93::acc(s6, recommended_weight_range_148).
0.78::acc(s5, recommended_weight_range_148).

% @attr recommended_weight_range_148
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (148cm)
% @values r46_64=46-64_kg r50_70=50-70_kg
% @importance 0.975

0.65::true_val(recommended_weight_range_148, r46_64); 0.35::true_val(recommended_weight_range_148, r50_70).

measured(s6, recommended_weight_range_148, r46_64).
measured(s5, recommended_weight_range_148, r50_70).

all_consistent(recommended_weight_range_148) :-
    consistent(s6, recommended_weight_range_148),
    consistent(s5, recommended_weight_range_148).

evidence(all_consistent(recommended_weight_range_148)).
query(true_val(recommended_weight_range_148, r46_64)).
query(true_val(recommended_weight_range_148, r50_70)).

0.93::acc(s6, recommended_weight_range_151).
0.78::acc(s5, recommended_weight_range_151).

% @attr recommended_weight_range_151
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (151cm)
% @values r51_69=51-69_kg r56_76=56-76_kg
% @importance 0.975

0.65::true_val(recommended_weight_range_151, r51_69); 0.35::true_val(recommended_weight_range_151, r56_76).

measured(s6, recommended_weight_range_151, r51_69).
measured(s5, recommended_weight_range_151, r56_76).

all_consistent(recommended_weight_range_151) :-
    consistent(s6, recommended_weight_range_151),
    consistent(s5, recommended_weight_range_151).

evidence(all_consistent(recommended_weight_range_151)).
query(true_val(recommended_weight_range_151, r51_69)).
query(true_val(recommended_weight_range_151, r56_76)).

0.93::acc(s6, recommended_weight_range_154).
0.78::acc(s5, recommended_weight_range_154).

% @attr recommended_weight_range_154
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (154cm)
% @values r50_5_68_5=50.5-68.5_kg r61_81=61-81_kg
% @importance 0.975

0.65::true_val(recommended_weight_range_154, r50_5_68_5); 0.35::true_val(recommended_weight_range_154, r61_81).

measured(s6, recommended_weight_range_154, r50_5_68_5).
measured(s5, recommended_weight_range_154, r61_81).

all_consistent(recommended_weight_range_154) :-
    consistent(s6, recommended_weight_range_154),
    consistent(s5, recommended_weight_range_154).

evidence(all_consistent(recommended_weight_range_154)).
query(true_val(recommended_weight_range_154, r50_5_68_5)).
query(true_val(recommended_weight_range_154, r61_81)).

0.93::acc(s6, recommended_weight_range_size).
0.78::acc(s5, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (157cm)
% @values r61_79=61-79_kg r67_87=67-87_kg
% @importance 0.975

0.65::true_val(recommended_weight_range_size, r61_79); 0.35::true_val(recommended_weight_range_size, r67_87).

measured(s6, recommended_weight_range_size, r61_79).
measured(s5, recommended_weight_range_size, r67_87).

all_consistent(recommended_weight_range_size) :-
    consistent(s6, recommended_weight_range_size),
    consistent(s5, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r61_79)).
query(true_val(recommended_weight_range_size, r67_87)).

0.93::acc(s6, recommended_weight_range_160).
0.78::acc(s5, recommended_weight_range_160).

% @attr recommended_weight_range_160
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (160cm)
% @values r66_5_84_5=66.5-84.5_kg r73_93=73-93_kg
% @importance 0.975

0.65::true_val(recommended_weight_range_160, r66_5_84_5); 0.35::true_val(recommended_weight_range_160, r73_93).

measured(s6, recommended_weight_range_160, r66_5_84_5).
measured(s5, recommended_weight_range_160, r73_93).

all_consistent(recommended_weight_range_160) :-
    consistent(s6, recommended_weight_range_160),
    consistent(s5, recommended_weight_range_160).

evidence(all_consistent(recommended_weight_range_160)).
query(true_val(recommended_weight_range_160, r66_5_84_5)).
query(true_val(recommended_weight_range_160, r73_93)).

0.93::acc(s6, recommended_weight_range_155w).
0.78::acc(s5, recommended_weight_range_155w).

% @attr recommended_weight_range_155w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (155W)
% @values r55_5_73_5=55.5-73.5_kg r70_90=70-90_kg
% @importance 0.975

0.65::true_val(recommended_weight_range_155w, r55_5_73_5); 0.35::true_val(recommended_weight_range_155w, r70_90).

measured(s6, recommended_weight_range_155w, r55_5_73_5).
measured(s5, recommended_weight_range_155w, r70_90).

all_consistent(recommended_weight_range_155w) :-
    consistent(s6, recommended_weight_range_155w),
    consistent(s5, recommended_weight_range_155w).

evidence(all_consistent(recommended_weight_range_155w)).
query(true_val(recommended_weight_range_155w, r55_5_73_5)).
query(true_val(recommended_weight_range_155w, r70_90)).

0.93::acc(s6, recommended_weight_range_158w).
0.78::acc(s5, recommended_weight_range_158w).

% @attr recommended_weight_range_158w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (158W)
% @values r69_87_5=69-87.5_kg r76_96=76-96_kg
% @importance 0.975

0.65::true_val(recommended_weight_range_158w, r69_87_5); 0.35::true_val(recommended_weight_range_158w, r76_96).

measured(s6, recommended_weight_range_158w, r69_87_5).
measured(s5, recommended_weight_range_158w, r76_96).

all_consistent(recommended_weight_range_158w) :-
    consistent(s6, recommended_weight_range_158w),
    consistent(s5, recommended_weight_range_158w).

evidence(all_consistent(recommended_weight_range_158w)).
query(true_val(recommended_weight_range_158w, r69_87_5)).
query(true_val(recommended_weight_range_158w, r76_96)).

0.93::acc(s6, recommended_weight_range_161w).
0.78::acc(s5, recommended_weight_range_161w).

% @attr recommended_weight_range_161w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (161W)
% @values r74_5_92_5=74.5-92.5_kg r82_102=82-102_kg
% @importance 0.975

0.65::true_val(recommended_weight_range_161w, r74_5_92_5); 0.35::true_val(recommended_weight_range_161w, r82_102).

measured(s6, recommended_weight_range_161w, r74_5_92_5).
measured(s5, recommended_weight_range_161w, r82_102).

all_consistent(recommended_weight_range_161w) :-
    consistent(s6, recommended_weight_range_161w),
    consistent(s5, recommended_weight_range_161w).

evidence(all_consistent(recommended_weight_range_161w)).
query(true_val(recommended_weight_range_161w, r74_5_92_5)).
query(true_val(recommended_weight_range_161w, r82_102)).

0.80::acc(s5, stance_width_range_148).
0.93::acc(s6, stance_width_range_148).

% @attr stance_width_range_148
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (148cm)
% @values ref_508mm=508mm_ref_46_8_58_8cm_range unk_stance_width_range_148=Unknown
% @importance 0.975

0.93::true_val(stance_width_range_148, ref_508mm); 0.07::true_val(stance_width_range_148, unk_stance_width_range_148).

measured(s5, stance_width_range_148, ref_508mm).
measured(s6, stance_width_range_148, ref_508mm).

all_consistent(stance_width_range_148) :-
    consistent(s6, stance_width_range_148),
    (indep(s5), consistent(s5, stance_width_range_148) ; \+indep(s5)).

evidence(all_consistent(stance_width_range_148)).
query(true_val(stance_width_range_148, ref_508mm)).
query(true_val(stance_width_range_148, unk_stance_width_range_148)).

0.80::acc(s5, stance_width_range_151).
0.93::acc(s6, stance_width_range_151).

% @attr stance_width_range_151
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (151cm)
% @values ref_508mm_151=508mm_ref_46_8_58_8cm_range unk_stance_width_range_151=Unknown
% @importance 0.975

0.93::true_val(stance_width_range_151, ref_508mm_151); 0.07::true_val(stance_width_range_151, unk_stance_width_range_151).

measured(s5, stance_width_range_151, ref_508mm_151).
measured(s6, stance_width_range_151, ref_508mm_151).

all_consistent(stance_width_range_151) :-
    consistent(s6, stance_width_range_151),
    (indep(s5), consistent(s5, stance_width_range_151) ; \+indep(s5)).

evidence(all_consistent(stance_width_range_151)).
query(true_val(stance_width_range_151, ref_508mm_151)).
query(true_val(stance_width_range_151, unk_stance_width_range_151)).

0.80::acc(s5, stance_width_range_154).
0.93::acc(s6, stance_width_range_154).

% @attr stance_width_range_154
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (154cm)
% @values ref_508mm_154=508mm_ref_49_3_61_3cm_range unk_stance_width_range_154=Unknown
% @importance 0.975

0.93::true_val(stance_width_range_154, ref_508mm_154); 0.07::true_val(stance_width_range_154, unk_stance_width_range_154).

measured(s5, stance_width_range_154, ref_508mm_154).
measured(s6, stance_width_range_154, ref_508mm_154).

all_consistent(stance_width_range_154) :-
    consistent(s6, stance_width_range_154),
    (indep(s5), consistent(s5, stance_width_range_154) ; \+indep(s5)).

evidence(all_consistent(stance_width_range_154)).
query(true_val(stance_width_range_154, ref_508mm_154)).
query(true_val(stance_width_range_154, unk_stance_width_range_154)).

0.80::acc(s5, stance_width_range_size).
0.93::acc(s6, stance_width_range_size).

% @attr stance_width_range_size
% @type categorical
% @unit mm
% @canonical true
% @original_name stance_width_range_size (157cm)
% @values ref_533_4mm=533_4mm_ref_49_3_61_3cm_range unk_stance_width_range_size=Unknown
% @importance 0.975

0.93::true_val(stance_width_range_size, ref_533_4mm); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s5, stance_width_range_size, ref_533_4mm).
measured(s6, stance_width_range_size, ref_533_4mm).

all_consistent(stance_width_range_size) :-
    consistent(s6, stance_width_range_size),
    (indep(s5), consistent(s5, stance_width_range_size) ; \+indep(s5)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, ref_533_4mm)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.80::acc(s5, stance_width_range_160).
0.93::acc(s6, stance_width_range_160).

% @attr stance_width_range_160
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (160cm)
% @values ref_558_8mm_160=558_8mm_ref_51_9_63_9cm_range unk_stance_width_range_160=Unknown
% @importance 0.975

0.93::true_val(stance_width_range_160, ref_558_8mm_160); 0.07::true_val(stance_width_range_160, unk_stance_width_range_160).

measured(s5, stance_width_range_160, ref_558_8mm_160).
measured(s6, stance_width_range_160, ref_558_8mm_160).

all_consistent(stance_width_range_160) :-
    consistent(s6, stance_width_range_160),
    (indep(s5), consistent(s5, stance_width_range_160) ; \+indep(s5)).

evidence(all_consistent(stance_width_range_160)).
query(true_val(stance_width_range_160, ref_558_8mm_160)).
query(true_val(stance_width_range_160, unk_stance_width_range_160)).

0.80::acc(s5, stance_width_range_155w).
0.93::acc(s6, stance_width_range_155w).

% @attr stance_width_range_155w
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (155W)
% @values ref_533_4mm_155w=533_4mm_ref_49_3_61_3cm_range unk_stance_width_range_155w=Unknown
% @importance 0.975

0.93::true_val(stance_width_range_155w, ref_533_4mm_155w); 0.07::true_val(stance_width_range_155w, unk_stance_width_range_155w).

measured(s5, stance_width_range_155w, ref_533_4mm_155w).
measured(s6, stance_width_range_155w, ref_533_4mm_155w).

all_consistent(stance_width_range_155w) :-
    consistent(s6, stance_width_range_155w),
    (indep(s5), consistent(s5, stance_width_range_155w) ; \+indep(s5)).

evidence(all_consistent(stance_width_range_155w)).
query(true_val(stance_width_range_155w, ref_533_4mm_155w)).
query(true_val(stance_width_range_155w, unk_stance_width_range_155w)).

0.80::acc(s5, stance_width_range_158w).
0.93::acc(s6, stance_width_range_158w).

% @attr stance_width_range_158w
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (158W)
% @values ref_558_8mm_158w=558_8mm_ref_51_9_63_9cm_range unk_stance_width_range_158w=Unknown
% @importance 0.975

0.93::true_val(stance_width_range_158w, ref_558_8mm_158w); 0.07::true_val(stance_width_range_158w, unk_stance_width_range_158w).

measured(s5, stance_width_range_158w, ref_558_8mm_158w).
measured(s6, stance_width_range_158w, ref_558_8mm_158w).

all_consistent(stance_width_range_158w) :-
    consistent(s6, stance_width_range_158w),
    (indep(s5), consistent(s5, stance_width_range_158w) ; \+indep(s5)).

evidence(all_consistent(stance_width_range_158w)).
query(true_val(stance_width_range_158w, ref_558_8mm_158w)).
query(true_val(stance_width_range_158w, unk_stance_width_range_158w)).

0.80::acc(s5, stance_width_range_161w).
0.93::acc(s6, stance_width_range_161w).

% @attr stance_width_range_161w
% @type categorical
% @unit mm
% @canonical false
% @original_name stance_width_range_size (161W)
% @values ref_558_8mm_161w=558_8mm_ref_51_9_63_9cm_range unk_stance_width_range_161w=Unknown
% @importance 0.975

0.93::true_val(stance_width_range_161w, ref_558_8mm_161w); 0.07::true_val(stance_width_range_161w, unk_stance_width_range_161w).

measured(s5, stance_width_range_161w, ref_558_8mm_161w).
measured(s6, stance_width_range_161w, ref_558_8mm_161w).

all_consistent(stance_width_range_161w) :-
    consistent(s6, stance_width_range_161w),
    (indep(s5), consistent(s5, stance_width_range_161w) ; \+indep(s5)).

evidence(all_consistent(stance_width_range_161w)).
query(true_val(stance_width_range_161w, ref_558_8mm_161w)).
query(true_val(stance_width_range_161w, unk_stance_width_range_161w)).

0.95::acc(s6, boot_size_148).

% @attr boot_size_148
% @type categorical
% @canonical false
% @original_name Boot size 148cm
% @values us6_9=US_6_9_EU_39_43 unk_boot_size_148=Unknown
% @importance 1.0

0.93::true_val(boot_size_148, us6_9); 0.07::true_val(boot_size_148, unk_boot_size_148).

measured(s6, boot_size_148, us6_9).

all_consistent(boot_size_148) :-
    consistent(s6, boot_size_148).

evidence(all_consistent(boot_size_148)).
query(true_val(boot_size_148, us6_9)).
query(true_val(boot_size_148, unk_boot_size_148)).

0.95::acc(s6, boot_size_151).

% @attr boot_size_151
% @type categorical
% @canonical false
% @original_name Boot size 151cm
% @values us7_10=US_7_10_EU_39_44 unk_boot_size_151=Unknown
% @importance 1.0

0.93::true_val(boot_size_151, us7_10); 0.07::true_val(boot_size_151, unk_boot_size_151).

measured(s6, boot_size_151, us7_10).

all_consistent(boot_size_151) :-
    consistent(s6, boot_size_151).

evidence(all_consistent(boot_size_151)).
query(true_val(boot_size_151, us7_10)).
query(true_val(boot_size_151, unk_boot_size_151)).

0.95::acc(s6, boot_size_154).

% @attr boot_size_154
% @type categorical
% @canonical false
% @original_name Boot size 154cm
% @values us7_10_154=US_7_10_EU_39_44 unk_boot_size_154=Unknown
% @importance 1.0

0.93::true_val(boot_size_154, us7_10_154); 0.07::true_val(boot_size_154, unk_boot_size_154).

measured(s6, boot_size_154, us7_10_154).

all_consistent(boot_size_154) :-
    consistent(s6, boot_size_154).

evidence(all_consistent(boot_size_154)).
query(true_val(boot_size_154, us7_10_154)).
query(true_val(boot_size_154, unk_boot_size_154)).

0.95::acc(s6, boot_size_155w).

% @attr boot_size_155w
% @type categorical
% @canonical false
% @original_name Boot size 155W
% @values us8_12=US_8_12_EU_42_46 unk_boot_size_155w=Unknown
% @importance 1.0

0.93::true_val(boot_size_155w, us8_12); 0.07::true_val(boot_size_155w, unk_boot_size_155w).

measured(s6, boot_size_155w, us8_12).

all_consistent(boot_size_155w) :-
    consistent(s6, boot_size_155w).

evidence(all_consistent(boot_size_155w)).
query(true_val(boot_size_155w, us8_12)).
query(true_val(boot_size_155w, unk_boot_size_155w)).

0.95::acc(s6, boot_size_157).

% @attr boot_size_157
% @type categorical
% @canonical false
% @original_name Boot size 157cm
% @values us7_10_157=US_7_10_EU_39_44 unk_boot_size_157=Unknown
% @importance 1.0

0.93::true_val(boot_size_157, us7_10_157); 0.07::true_val(boot_size_157, unk_boot_size_157).

measured(s6, boot_size_157, us7_10_157).

all_consistent(boot_size_157) :-
    consistent(s6, boot_size_157).

evidence(all_consistent(boot_size_157)).
query(true_val(boot_size_157, us7_10_157)).
query(true_val(boot_size_157, unk_boot_size_157)).

0.95::acc(s6, boot_size_158w).

% @attr boot_size_158w
% @type categorical
% @canonical false
% @original_name Boot size 158W
% @values us9_12=US_9_12_EU_42_47 unk_boot_size_158w=Unknown
% @importance 1.0

0.93::true_val(boot_size_158w, us9_12); 0.07::true_val(boot_size_158w, unk_boot_size_158w).

measured(s6, boot_size_158w, us9_12).

all_consistent(boot_size_158w) :-
    consistent(s6, boot_size_158w).

evidence(all_consistent(boot_size_158w)).
query(true_val(boot_size_158w, us9_12)).
query(true_val(boot_size_158w, unk_boot_size_158w)).

0.95::acc(s6, boot_size_160).

% @attr boot_size_160
% @type categorical
% @canonical false
% @original_name Boot size 160cm
% @values us7_10_160=US_7_10_EU_39_44 unk_boot_size_160=Unknown
% @importance 1.0

0.93::true_val(boot_size_160, us7_10_160); 0.07::true_val(boot_size_160, unk_boot_size_160).

measured(s6, boot_size_160, us7_10_160).

all_consistent(boot_size_160) :-
    consistent(s6, boot_size_160).

evidence(all_consistent(boot_size_160)).
query(true_val(boot_size_160, us7_10_160)).
query(true_val(boot_size_160, unk_boot_size_160)).

0.95::acc(s6, boot_size_161w).

% @attr boot_size_161w
% @type categorical
% @canonical false
% @original_name Boot size 161W
% @values us9_12_161w=US_9_12_EU_42_47 unk_boot_size_161w=Unknown
% @importance 1.0

0.93::true_val(boot_size_161w, us9_12_161w); 0.07::true_val(boot_size_161w, unk_boot_size_161w).

measured(s6, boot_size_161w, us9_12_161w).

all_consistent(boot_size_161w) :-
    consistent(s6, boot_size_161w).

evidence(all_consistent(boot_size_161w)).
query(true_val(boot_size_161w, us9_12_161w)).
query(true_val(boot_size_161w, unk_boot_size_161w)).

0.80::acc(s5, terrain_suitability).
0.93::acc(s6, terrain_suitability).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability (All Mountain)
% @values v7=7.0 unk_terrain_suitability=Unknown
% @importance 0.975

0.95::true_val(terrain_suitability, v7); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s5, terrain_suitability, v7).
measured(s6, terrain_suitability, v7).

all_consistent(terrain_suitability) :-
    consistent(s6, terrain_suitability),
    (indep(s5), consistent(s5, terrain_suitability) ; \+indep(s5)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v7)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

0.80::acc(s5, terrain_suitability_park).
0.93::acc(s6, terrain_suitability_park).

% @attr terrain_suitability_park
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (Park)
% @values v6_park=6.0 v7_park=7.0
% @importance 0.975

0.40::true_val(terrain_suitability_park, v6_park); 0.60::true_val(terrain_suitability_park, v7_park).

measured(s5, terrain_suitability_park, v6_park).
measured(s6, terrain_suitability_park, v7_park).

all_consistent(terrain_suitability_park) :-
    consistent(s6, terrain_suitability_park),
    consistent(s5, terrain_suitability_park).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v6_park)).
query(true_val(terrain_suitability_park, v7_park)).

0.80::acc(s5, terrain_suitability_powder).
0.93::acc(s6, terrain_suitability_powder).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability (Powder)
% @values v5=5.0 unk_terrain_suitability_powder=Unknown
% @importance 0.975

0.95::true_val(terrain_suitability_powder, v5); 0.05::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s5, terrain_suitability_powder, v5).
measured(s6, terrain_suitability_powder, v5).

all_consistent(terrain_suitability_powder) :-
    consistent(s6, terrain_suitability_powder),
    (indep(s5), consistent(s5, terrain_suitability_powder) ; \+indep(s5)).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v5)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

0.78::acc(s5, rider_level).
0.85::acc(s13, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced=Advanced advanced_expert=Advanced_to_Expert
% @importance 0.925

0.35::true_val(rider_level, advanced); 0.65::true_val(rider_level, advanced_expert).

measured(s5, rider_level, advanced).
measured(s13, rider_level, advanced_expert).

all_consistent(rider_level) :-
    consistent(s5, rider_level),
    consistent(s13, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced)).
query(true_val(rider_level, advanced_expert)).

0.95::acc(s36, warranty).
0.95::acc(s37, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_plus_one=2yr_limited_3yr_with_registration unk_warranty=Unknown
% @importance 0.80

0.95::true_val(warranty, two_plus_one); 0.05::true_val(warranty, unk_warranty).

measured(s36, warranty, two_plus_one).
measured(s37, warranty, two_plus_one).

all_consistent(warranty) :-
    consistent(s36, warranty),
    consistent(s37, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_plus_one)).
query(true_val(warranty, unk_warranty)).

0.95::acc(s38, warranty_coverage).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty (coverage details)
% @values delam_inserts_topsheet=Delamination_inserts_cracked_topsheet unk_warranty_coverage=Unknown
% @importance 0.80

0.90::true_val(warranty_coverage, delam_inserts_topsheet); 0.10::true_val(warranty_coverage, unk_warranty_coverage).

measured(s38, warranty_coverage, delam_inserts_topsheet).

all_consistent(warranty_coverage) :-
    consistent(s38, warranty_coverage).

evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, delam_inserts_topsheet)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

0.95::acc(s39, return_policy_terms).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values days_45=45_day_return unk_return_policy_terms=Unknown
% @importance 0.65

0.90::true_val(return_policy_terms, days_45); 0.10::true_val(return_policy_terms, unk_return_policy_terms).

measured(s39, return_policy_terms, days_45).

all_consistent(return_policy_terms) :-
    consistent(s39, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, days_45)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

0.90::acc(s6, rome_user_review_rating).

% @attr rome_user_review_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Rome official website user review rating
% @values v5_0=5.0 unk_rome_user_review_rating=Unknown
% @importance 1.0

0.88::true_val(rome_user_review_rating, v5_0); 0.12::true_val(rome_user_review_rating, unk_rome_user_review_rating).

measured(s6, rome_user_review_rating, v5_0).

all_consistent(rome_user_review_rating) :-
    consistent(s6, rome_user_review_rating).

evidence(all_consistent(rome_user_review_rating)).
query(true_val(rome_user_review_rating, v5_0)).
query(true_val(rome_user_review_rating, unk_rome_user_review_rating)).

0.88::acc(s13, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values exceptional_mtn_freestyle=Very_special_Mtn_Freestyle_easy_butter_carve_ollie unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.95

0.81::true_val(reviewer_opinion_the_good_ride, exceptional_mtn_freestyle); 0.19::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s13, reviewer_opinion_the_good_ride, exceptional_mtn_freestyle).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s13, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, exceptional_mtn_freestyle)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.78::acc(s13, tgr_list_price).

% @attr tgr_list_price
% @type numeric
% @unit USD
% @canonical false
% @original_name The Good Ride list price reported
% @values v579=579.0 unk_tgr_list_price=Unknown
% @importance 0.95

0.72::true_val(tgr_list_price, v579); 0.28::true_val(tgr_list_price, unk_tgr_list_price).

measured(s13, tgr_list_price, v579).

all_consistent(tgr_list_price) :-
    consistent(s13, tgr_list_price).

evidence(all_consistent(tgr_list_price)).
query(true_val(tgr_list_price, v579)).
query(true_val(tgr_list_price, unk_tgr_list_price)).

0.85::acc(s13, riding_style).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values all_mtn_freestyle=All_Mountain_Freestyle unk_riding_style=Unknown
% @importance 0.95

0.78::true_val(riding_style, all_mtn_freestyle); 0.22::true_val(riding_style, unk_riding_style).

measured(s13, riding_style, all_mtn_freestyle).

all_consistent(riding_style) :-
    consistent(s13, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, all_mtn_freestyle)).
query(true_val(riding_style, unk_riding_style)).

0.88::acc(s13, on_snow_feel_tgr).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.81::true_val(on_snow_feel_tgr, semi_locked_in); 0.19::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s13, on_snow_feel_tgr, semi_locked_in).

all_consistent(on_snow_feel_tgr) :-
    consistent(s13, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

0.85::acc(s13, turn_initiation_performance).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_initiation_performance=Unknown
% @importance 0.95

0.78::true_val(turn_initiation_performance, medium_fast); 0.22::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s13, turn_initiation_performance, medium_fast).

all_consistent(turn_initiation_performance) :-
    consistent(s13, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.85::acc(s13, flex_rating_10_the_good_ride).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical true
% @original_name flex_rating_10_the_good_ride
% @values medium=Medium unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.95

0.78::true_val(flex_rating_10_the_good_ride, medium); 0.22::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).

measured(s13, flex_rating_10_the_good_ride, medium).

all_consistent(flex_rating_10_the_good_ride) :-
    consistent(s13, flex_rating_10_the_good_ride).

evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

0.95::acc(s6, flex_rating_10).
0.85::acc(s13, flex_rating_10).
0.80::acc(s40, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v7_flex=7.0 v6_flex=6.0
% @importance 0.95

0.60::true_val(flex_rating_10, v7_flex); 0.40::true_val(flex_rating_10, v6_flex).

measured(s6, flex_rating_10, v7_flex).
measured(s13, flex_rating_10, v7_flex).
measured(s40, flex_rating_10, v6_flex).

all_consistent(flex_rating_10) :-
    consistent(s6, flex_rating_10),
    consistent(s13, flex_rating_10),
    consistent(s40, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7_flex)).
query(true_val(flex_rating_10, v6_flex)).

0.85::acc(s13, reviewer_opinion_tgr_butter).

% @attr reviewer_opinion_tgr_butter
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (Buttering)
% @values semi_easy=Semi_Easy unk_reviewer_opinion_tgr_butter=Unknown
% @importance 0.95

0.78::true_val(reviewer_opinion_tgr_butter, semi_easy); 0.22::true_val(reviewer_opinion_tgr_butter, unk_reviewer_opinion_tgr_butter).

measured(s13, reviewer_opinion_tgr_butter, semi_easy).

all_consistent(reviewer_opinion_tgr_butter) :-
    consistent(s13, reviewer_opinion_tgr_butter).

evidence(all_consistent(reviewer_opinion_tgr_butter)).
query(true_val(reviewer_opinion_tgr_butter, semi_easy)).
query(true_val(reviewer_opinion_tgr_butter, unk_reviewer_opinion_tgr_butter)).

0.85::acc(s13, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values competent_not_specialist=Hard_snow_competent_not_specialist unk_edge_hold=Unknown
% @importance 0.95

0.78::true_val(edge_hold, competent_not_specialist); 0.22::true_val(edge_hold, unk_edge_hold).

measured(s13, edge_hold, competent_not_specialist).

all_consistent(edge_hold) :-
    consistent(s13, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, competent_not_specialist)).
query(true_val(edge_hold, unk_edge_hold)).

0.88::acc(s13, base_glide_performance).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values great=Great unk_base_glide_performance=Unknown
% @importance 0.95

0.81::true_val(base_glide_performance, great); 0.19::true_val(base_glide_performance, unk_base_glide_performance).

measured(s13, base_glide_performance, great).

all_consistent(base_glide_performance) :-
    consistent(s13, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, great)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

0.88::acc(s13, carving_rating_tgr).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(carving_rating_tgr, great); 0.19::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s13, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :-
    consistent(s13, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

0.85::acc(s13, speed_rating_tgr).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.95

0.78::true_val(speed_rating_tgr, good); 0.22::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s13, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :-
    consistent(s13, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

0.85::acc(s13, reviewer_opinion_tgr_uneven).

% @attr reviewer_opinion_tgr_uneven
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (Uneven Terrain)
% @values good=Good unk_reviewer_opinion_tgr_uneven=Unknown
% @importance 0.95

0.78::true_val(reviewer_opinion_tgr_uneven, good); 0.22::true_val(reviewer_opinion_tgr_uneven, unk_reviewer_opinion_tgr_uneven).

measured(s13, reviewer_opinion_tgr_uneven, good).

all_consistent(reviewer_opinion_tgr_uneven) :-
    consistent(s13, reviewer_opinion_tgr_uneven).

evidence(all_consistent(reviewer_opinion_tgr_uneven)).
query(true_val(reviewer_opinion_tgr_uneven, good)).
query(true_val(reviewer_opinion_tgr_uneven, unk_reviewer_opinion_tgr_uneven)).

0.88::acc(s13, reviewer_opinion_tgr_switch).

% @attr reviewer_opinion_tgr_switch
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (Switch)
% @values great=Great unk_reviewer_opinion_tgr_switch=Unknown
% @importance 0.95

0.81::true_val(reviewer_opinion_tgr_switch, great); 0.19::true_val(reviewer_opinion_tgr_switch, unk_reviewer_opinion_tgr_switch).

measured(s13, reviewer_opinion_tgr_switch, great).

all_consistent(reviewer_opinion_tgr_switch) :-
    consistent(s13, reviewer_opinion_tgr_switch).

evidence(all_consistent(reviewer_opinion_tgr_switch)).
query(true_val(reviewer_opinion_tgr_switch, great)).
query(true_val(reviewer_opinion_tgr_switch, unk_reviewer_opinion_tgr_switch)).

0.88::acc(s13, jumps_rating_tgr).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values excellent=Excellent unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(jumps_rating_tgr, excellent); 0.19::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s13, jumps_rating_tgr, excellent).

all_consistent(jumps_rating_tgr) :-
    consistent(s13, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, excellent)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

0.85::acc(s13, jibbing_rating_tgr).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values good=Good unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.78::true_val(jibbing_rating_tgr, good); 0.22::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s13, jibbing_rating_tgr, good).

all_consistent(jibbing_rating_tgr) :-
    consistent(s13, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, good)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

0.88::acc(s13, pipe_rating_tgr).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values great=Great unk_pipe_rating_tgr=Unknown
% @importance 0.95

0.81::true_val(pipe_rating_tgr, great); 0.19::true_val(pipe_rating_tgr, unk_pipe_rating_tgr).

measured(s13, pipe_rating_tgr, great).

all_consistent(pipe_rating_tgr) :-
    consistent(s13, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, great)).
query(true_val(pipe_rating_tgr, unk_pipe_rating_tgr)).

0.85::acc(s13, powder_rating_tgr).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values average=Average unk_powder_rating_tgr=Unknown
% @importance 0.95

0.78::true_val(powder_rating_tgr, average); 0.22::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s13, powder_rating_tgr, average).

all_consistent(powder_rating_tgr) :-
    consistent(s13, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, average)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

0.82::acc(s13, board_weight_grams).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values light_side_normal=Light_side_of_normal unk_board_weight_grams=Unknown
% @importance 0.95

0.75::true_val(board_weight_grams, light_side_normal); 0.25::true_val(board_weight_grams, unk_board_weight_grams).

measured(s13, board_weight_grams, light_side_normal).

all_consistent(board_weight_grams) :-
    consistent(s13, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, light_side_normal)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.85::acc(s13, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values butter_pop_damp=Next_level_buttering_exceptional_pop_damp_as_Agent unk_positive_aspect=Unknown
% @importance 0.95

0.78::true_val(positive_aspect, butter_pop_damp); 0.22::true_val(positive_aspect, unk_positive_aspect).

measured(s13, positive_aspect, butter_pop_damp).

all_consistent(positive_aspect) :-
    consistent(s13, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, butter_pop_damp)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.85::acc(s13, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_forgiving=Not_that_forgiving unk_negative_aspect=Unknown
% @importance 0.95

0.78::true_val(negative_aspect, not_forgiving); 0.22::true_val(negative_aspect, unk_negative_aspect).

measured(s13, negative_aspect, not_forgiving).

all_consistent(negative_aspect) :-
    consistent(s13, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_forgiving)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.82::acc(s40, reviewer_opinion_snowboardingprofiles).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values poppy_versatile=Poppy_versatile_freestyle_great_cruising_carving unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.90

0.69::true_val(reviewer_opinion_snowboardingprofiles, poppy_versatile); 0.31::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s40, reviewer_opinion_snowboardingprofiles, poppy_versatile).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s40, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, poppy_versatile)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

0.82::acc(s40, reviewer_opinion_sp_jumps).

% @attr reviewer_opinion_sp_jumps
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (Jumps)
% @values good_big_jumps=Good_big_jumps_ample_spring_handles_kickers unk_reviewer_opinion_sp_jumps=Unknown
% @importance 0.90

0.69::true_val(reviewer_opinion_sp_jumps, good_big_jumps); 0.31::true_val(reviewer_opinion_sp_jumps, unk_reviewer_opinion_sp_jumps).

measured(s40, reviewer_opinion_sp_jumps, good_big_jumps).

all_consistent(reviewer_opinion_sp_jumps) :-
    consistent(s40, reviewer_opinion_sp_jumps).

evidence(all_consistent(reviewer_opinion_sp_jumps)).
query(true_val(reviewer_opinion_sp_jumps, good_big_jumps)).
query(true_val(reviewer_opinion_sp_jumps, unk_reviewer_opinion_sp_jumps)).

0.82::acc(s40, reviewer_opinion_sp_powder).

% @attr reviewer_opinion_sp_powder
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (Powder)
% @values not_powder_board=Not_really_a_powder_board unk_reviewer_opinion_sp_powder=Unknown
% @importance 0.90

0.69::true_val(reviewer_opinion_sp_powder, not_powder_board); 0.31::true_val(reviewer_opinion_sp_powder, unk_reviewer_opinion_sp_powder).

measured(s40, reviewer_opinion_sp_powder, not_powder_board).

all_consistent(reviewer_opinion_sp_powder) :-
    consistent(s40, reviewer_opinion_sp_powder).

evidence(all_consistent(reviewer_opinion_sp_powder)).
query(true_val(reviewer_opinion_sp_powder, not_powder_board)).
query(true_val(reviewer_opinion_sp_powder, unk_reviewer_opinion_sp_powder)).

0.82::acc(s40, reviewer_opinion_sp_comparison).

% @attr reviewer_opinion_sp_comparison
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles (Comparison)
% @values similar_assassin_more_pop=Torsionally_similar_to_Assassin_but_more_pop unk_reviewer_opinion_sp_comparison=Unknown
% @importance 0.90

0.69::true_val(reviewer_opinion_sp_comparison, similar_assassin_more_pop); 0.31::true_val(reviewer_opinion_sp_comparison, unk_reviewer_opinion_sp_comparison).

measured(s40, reviewer_opinion_sp_comparison, similar_assassin_more_pop).

all_consistent(reviewer_opinion_sp_comparison) :-
    consistent(s40, reviewer_opinion_sp_comparison).

evidence(all_consistent(reviewer_opinion_sp_comparison)).
query(true_val(reviewer_opinion_sp_comparison, similar_assassin_more_pop)).
query(true_val(reviewer_opinion_sp_comparison, unk_reviewer_opinion_sp_comparison)).

0.70::acc(s6, user_review_forum_carve).

% @attr user_review_forum_carve
% @type categorical
% @canonical false
% @original_name user_review_forum (carving)
% @values stiffer_carves_well=Stiffer_side_carves_better_than_expected unk_user_review_forum_carve=Unknown
% @importance 1.0

0.68::true_val(user_review_forum_carve, stiffer_carves_well); 0.32::true_val(user_review_forum_carve, unk_user_review_forum_carve).

measured(s6, user_review_forum_carve, stiffer_carves_well).

all_consistent(user_review_forum_carve) :-
    consistent(s6, user_review_forum_carve).

evidence(all_consistent(user_review_forum_carve)).
query(true_val(user_review_forum_carve, stiffer_carves_well)).
query(true_val(user_review_forum_carve, unk_user_review_forum_carve)).

0.70::acc(s6, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum (underrated)
% @values between_custom_assassin=Underrated_between_Custom_and_Assassin_stiffness unk_user_review_forum=Unknown
% @importance 1.0

0.68::true_val(user_review_forum, between_custom_assassin); 0.32::true_val(user_review_forum, unk_user_review_forum).

measured(s6, user_review_forum, between_custom_assassin).

all_consistent(user_review_forum) :-
    consistent(s6, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, between_custom_assassin)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.70::acc(s6, user_review_forum_stomp).

% @attr user_review_forum_stomp
% @type categorical
% @canonical false
% @original_name user_review_forum (stomp and butter)
% @values stomp_and_butter=Stiff_stomp_jumps_lay_trench_still_butter unk_user_review_forum_stomp=Unknown
% @importance 1.0

0.68::true_val(user_review_forum_stomp, stomp_and_butter); 0.32::true_val(user_review_forum_stomp, unk_user_review_forum_stomp).

measured(s6, user_review_forum_stomp, stomp_and_butter).

all_consistent(user_review_forum_stomp) :-
    consistent(s6, user_review_forum_stomp).

evidence(all_consistent(user_review_forum_stomp)).
query(true_val(user_review_forum_stomp, stomp_and_butter)).
query(true_val(user_review_forum_stomp, unk_user_review_forum_stomp)).

0.70::acc(s6, user_review_forum_carve_freestyle).

% @attr user_review_forum_carve_freestyle
% @type categorical
% @canonical false
% @original_name user_review_forum (carve and freestyle)
% @values stellar_carver_freestyle=Stellar_mid_low_speed_carver_freestyle_and_trenches unk_user_review_forum_carve_freestyle=Unknown
% @importance 1.0

0.68::true_val(user_review_forum_carve_freestyle, stellar_carver_freestyle); 0.32::true_val(user_review_forum_carve_freestyle, unk_user_review_forum_carve_freestyle).

measured(s6, user_review_forum_carve_freestyle, stellar_carver_freestyle).

all_consistent(user_review_forum_carve_freestyle) :-
    consistent(s6, user_review_forum_carve_freestyle).

evidence(all_consistent(user_review_forum_carve_freestyle)).
query(true_val(user_review_forum_carve_freestyle, stellar_carver_freestyle)).
query(true_val(user_review_forum_carve_freestyle, unk_user_review_forum_carve_freestyle)).

0.70::acc(s6, user_review_forum_butter).

% @attr user_review_forum_butter
% @type categorical
% @canonical false
% @original_name user_review_forum (buttering)
% @values butter_possible_not_easy=Not_easiest_butter_but_possible unk_user_review_forum_butter=Unknown
% @importance 1.0

0.68::true_val(user_review_forum_butter, butter_possible_not_easy); 0.32::true_val(user_review_forum_butter, unk_user_review_forum_butter).

measured(s6, user_review_forum_butter, butter_possible_not_easy).

all_consistent(user_review_forum_butter) :-
    consistent(s6, user_review_forum_butter).

evidence(all_consistent(user_review_forum_butter)).
query(true_val(user_review_forum_butter, butter_possible_not_easy)).
query(true_val(user_review_forum_butter, unk_user_review_forum_butter)).

0.70::acc(s6, user_review_forum_pop).

% @attr user_review_forum_pop
% @type categorical
% @canonical false
% @original_name user_review_forum (pop)
% @values crazy_good_pop=Pop_is_crazy_good unk_user_review_forum_pop=Unknown
% @importance 1.0

0.68::true_val(user_review_forum_pop, crazy_good_pop); 0.32::true_val(user_review_forum_pop, unk_user_review_forum_pop).

measured(s6, user_review_forum_pop, crazy_good_pop).

all_consistent(user_review_forum_pop) :-
    consistent(s6, user_review_forum_pop).

evidence(all_consistent(user_review_forum_pop)).
query(true_val(user_review_forum_pop, crazy_good_pop)).
query(true_val(user_review_forum_pop, unk_user_review_forum_pop)).

0.65::acc(s41, user_review_forum_allrounder).

% @attr user_review_forum_allrounder
% @type categorical
% @canonical false
% @original_name user_review_forum (all-rounder vs jib)
% @values agent_allrounder=Agent_always_all_rounder_arti_park_jib unk_user_review_forum_allrounder=Unknown
% @importance 0.60

0.30::true_val(user_review_forum_allrounder, agent_allrounder); 0.70::true_val(user_review_forum_allrounder, unk_user_review_forum_allrounder).

measured(s41, user_review_forum_allrounder, agent_allrounder).

all_consistent(user_review_forum_allrounder) :-
    consistent(s41, user_review_forum_allrounder).

evidence(all_consistent(user_review_forum_allrounder)).
query(true_val(user_review_forum_allrounder, agent_allrounder)).
query(true_val(user_review_forum_allrounder, unk_user_review_forum_allrounder)).

0.68::acc(s42, user_review_forum_versatile).

% @attr user_review_forum_versatile
% @type categorical
% @canonical false
% @original_name user_review_forum (versatile)
% @values most_versatile=Most_versatile_board_solid_at_everything_mid_low_speed unk_user_review_forum_versatile=Unknown
% @importance 0.70

0.32::true_val(user_review_forum_versatile, most_versatile); 0.68::true_val(user_review_forum_versatile, unk_user_review_forum_versatile).

measured(s42, user_review_forum_versatile, most_versatile).

all_consistent(user_review_forum_versatile) :-
    consistent(s42, user_review_forum_versatile).

evidence(all_consistent(user_review_forum_versatile)).
query(true_val(user_review_forum_versatile, most_versatile)).
query(true_val(user_review_forum_versatile, unk_user_review_forum_versatile)).

0.68::acc(s42, user_review_forum_recommend_pro).

% @attr user_review_forum_recommend_pro
% @type categorical
% @canonical false
% @original_name user_review_forum (recommend Pro)
% @values recommend_pro_carving=Recommend_Pro_increased_stiffness_aids_carving unk_user_review_forum_recommend_pro=Unknown
% @importance 0.70

0.32::true_val(user_review_forum_recommend_pro, recommend_pro_carving); 0.68::true_val(user_review_forum_recommend_pro, unk_user_review_forum_recommend_pro).

measured(s42, user_review_forum_recommend_pro, recommend_pro_carving).

all_consistent(user_review_forum_recommend_pro) :-
    consistent(s42, user_review_forum_recommend_pro).

evidence(all_consistent(user_review_forum_recommend_pro)).
query(true_val(user_review_forum_recommend_pro, recommend_pro_carving)).
query(true_val(user_review_forum_recommend_pro, unk_user_review_forum_recommend_pro)).

0.85::acc(s13, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values ns_proto_yes_greats_etc=NS_Protosynthesis_Yes_Greats_Stone_Message_Lib_Box_Knife_Yes_Basic_Ride_TwinPig unk_comparable_board_cross_brand=Unknown
% @importance 0.95

0.78::true_val(comparable_board_cross_brand, ns_proto_yes_greats_etc); 0.22::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s13, comparable_board_cross_brand, ns_proto_yes_greats_etc).

all_consistent(comparable_board_cross_brand) :-
    consistent(s13, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, ns_proto_yes_greats_etc)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.82::acc(s43, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand (Agent vs Agent Pro)
% @values agent_pro_preferred=Only_thing_holding_back_Agent_is_Agent_Pro unk_comparable_board_same_brand=Unknown
% @importance 0.80

0.68::true_val(comparable_board_same_brand, agent_pro_preferred); 0.32::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s43, comparable_board_same_brand, agent_pro_preferred).

all_consistent(comparable_board_same_brand) :-
    consistent(s43, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, agent_pro_preferred)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.88::acc(s28, comparable_board_same_brand_specs).
0.82::acc(s44, comparable_board_same_brand_specs).

% @attr comparable_board_same_brand_specs
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Agent spec diff)
% @values agent_bamboo_sinterstrong_flex5=Agent_Bamboo_Omega_SinterStrong_flex_5_10 unk_comparable_board_same_brand_specs=Unknown
% @importance 0.85

0.92::true_val(comparable_board_same_brand_specs, agent_bamboo_sinterstrong_flex5); 0.08::true_val(comparable_board_same_brand_specs, unk_comparable_board_same_brand_specs).

measured(s28, comparable_board_same_brand_specs, agent_bamboo_sinterstrong_flex5).
measured(s44, comparable_board_same_brand_specs, agent_bamboo_sinterstrong_flex5).

all_consistent(comparable_board_same_brand_specs) :-
    consistent(s28, comparable_board_same_brand_specs),
    consistent(s44, comparable_board_same_brand_specs).

evidence(all_consistent(comparable_board_same_brand_specs)).
query(true_val(comparable_board_same_brand_specs, agent_bamboo_sinterstrong_flex5)).
query(true_val(comparable_board_same_brand_specs, unk_comparable_board_same_brand_specs)).

0.80::acc(s44, comparable_board_same_brand_price).

% @attr comparable_board_same_brand_price
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Agent price)
% @values agent_559_95=Agent_559_95_significantly_less unk_comparable_board_same_brand_price=Unknown
% @importance 0.80

0.74::true_val(comparable_board_same_brand_price, agent_559_95); 0.26::true_val(comparable_board_same_brand_price, unk_comparable_board_same_brand_price).

measured(s44, comparable_board_same_brand_price, agent_559_95).

all_consistent(comparable_board_same_brand_price) :-
    consistent(s44, comparable_board_same_brand_price).

evidence(all_consistent(comparable_board_same_brand_price)).
query(true_val(comparable_board_same_brand_price, agent_559_95)).
query(true_val(comparable_board_same_brand_price, unk_comparable_board_same_brand_price)).

0.80::acc(s40, comparable_board_same_brand_crewzer).

% @attr comparable_board_same_brand_crewzer
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Crewzer comparison)
% @values crewzer_stiffer_aggressive=Crewzer_6_10_flex_felt_stiffer_more_aggressive unk_comparable_board_same_brand_crewzer=Unknown
% @importance 0.90

0.69::true_val(comparable_board_same_brand_crewzer, crewzer_stiffer_aggressive); 0.31::true_val(comparable_board_same_brand_crewzer, unk_comparable_board_same_brand_crewzer).

measured(s40, comparable_board_same_brand_crewzer, crewzer_stiffer_aggressive).

all_consistent(comparable_board_same_brand_crewzer) :-
    consistent(s40, comparable_board_same_brand_crewzer).

evidence(all_consistent(comparable_board_same_brand_crewzer)).
query(true_val(comparable_board_same_brand_crewzer, crewzer_stiffer_aggressive)).
query(true_val(comparable_board_same_brand_crewzer, unk_comparable_board_same_brand_crewzer)).

0.85::acc(s20, comparable_board_same_brand_renegade).

% @attr comparable_board_same_brand_renegade
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Rene-Gade)
% @values renegade_same_msrp=Rene_Gade_same_MSRP_629_95 unk_comparable_board_same_brand_renegade=Unknown
% @importance 0.95

0.81::true_val(comparable_board_same_brand_renegade, renegade_same_msrp); 0.19::true_val(comparable_board_same_brand_renegade, unk_comparable_board_same_brand_renegade).

measured(s20, comparable_board_same_brand_renegade, renegade_same_msrp).

all_consistent(comparable_board_same_brand_renegade) :-
    consistent(s20, comparable_board_same_brand_renegade).

evidence(all_consistent(comparable_board_same_brand_renegade)).
query(true_val(comparable_board_same_brand_renegade, renegade_same_msrp)).
query(true_val(comparable_board_same_brand_renegade, unk_comparable_board_same_brand_renegade)).

0.85::acc(s20, comparable_board_same_brand_ravine).

% @attr comparable_board_same_brand_ravine
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Ravine Pro)
% @values ravine_pro_directional_669_95=Ravine_Pro_directional_freeride_669_95 unk_comparable_board_same_brand_ravine=Unknown
% @importance 0.95

0.81::true_val(comparable_board_same_brand_ravine, ravine_pro_directional_669_95); 0.19::true_val(comparable_board_same_brand_ravine, unk_comparable_board_same_brand_ravine).

measured(s20, comparable_board_same_brand_ravine, ravine_pro_directional_669_95).

all_consistent(comparable_board_same_brand_ravine) :-
    consistent(s20, comparable_board_same_brand_ravine).

evidence(all_consistent(comparable_board_same_brand_ravine)).
query(true_val(comparable_board_same_brand_ravine, ravine_pro_directional_669_95)).
query(true_val(comparable_board_same_brand_ravine, unk_comparable_board_same_brand_ravine)).

0.90::acc(s39, rome_brand_tagline).

% @attr rome_brand_tagline
% @type categorical
% @canonical false
% @original_name Rome brand tagline
% @values all_ways_down=All_Ways_Down unk_rome_brand_tagline=Unknown
% @importance 0.65

0.86::true_val(rome_brand_tagline, all_ways_down); 0.14::true_val(rome_brand_tagline, unk_rome_brand_tagline).

measured(s39, rome_brand_tagline, all_ways_down).

all_consistent(rome_brand_tagline) :-
    consistent(s39, rome_brand_tagline).

evidence(all_consistent(rome_brand_tagline)).
query(true_val(rome_brand_tagline, all_ways_down)).
query(true_val(rome_brand_tagline, unk_rome_brand_tagline)).

0.82::acc(s18, agent_original_lineup).

% @attr agent_original_lineup
% @type categorical
% @canonical false
% @original_name The Agent was one of four boards in Rome's original lineup at inception
% @values one_of_four=One_of_four_original_boards unk_agent_original_lineup=Unknown
% @importance 0.50

0.78::true_val(agent_original_lineup, one_of_four); 0.22::true_val(agent_original_lineup, unk_agent_original_lineup).

measured(s18, agent_original_lineup, one_of_four).

all_consistent(agent_original_lineup) :-
    consistent(s18, agent_original_lineup).

evidence(all_consistent(agent_original_lineup)).
query(true_val(agent_original_lineup, one_of_four)).
query(true_val(agent_original_lineup, unk_agent_original_lineup)).

0.75::acc(s22, board_description_evolution).

% @attr board_description_evolution
% @type categorical
% @canonical false
% @original_name Board is described as the high-powered evolution of the legendary Agent
% @values high_powered_evolution=High_powered_evolution_of_legendary_Agent unk_board_description_evolution=Unknown
% @importance 0.85

0.63::true_val(board_description_evolution, high_powered_evolution); 0.37::true_val(board_description_evolution, unk_board_description_evolution).

measured(s22, board_description_evolution, high_powered_evolution).

all_consistent(board_description_evolution) :-
    consistent(s22, board_description_evolution).

evidence(all_consistent(board_description_evolution)).
query(true_val(board_description_evolution, high_powered_evolution)).
query(true_val(board_description_evolution, unk_board_description_evolution)).

0.82::acc(s18, double_kick_origin).

% @attr double_kick_origin
% @type categorical
% @canonical false
% @original_name Double Kick technology originated on the Rome Artifact
% @values artifact_origin=Originated_on_Artifact_before_Agent unk_double_kick_origin=Unknown
% @importance 0.50

0.78::true_val(double_kick_origin, artifact_origin); 0.22::true_val(double_kick_origin, unk_double_kick_origin).

measured(s18, double_kick_origin, artifact_origin).

all_consistent(double_kick_origin) :-
    consistent(s18, double_kick_origin).

evidence(all_consistent(double_kick_origin)).
query(true_val(double_kick_origin, artifact_origin)).
query(true_val(double_kick_origin, unk_double_kick_origin)).

0.80::acc(s5, retailer_melbourne_sc).

% @attr retailer_melbourne_sc
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre (Australia)
% @values specialist_retailer=Specialist_snowboard_retailer_detailed_specs_preorder unk_retailer_melbourne_sc=Unknown
% @importance 0.95

0.76::true_val(retailer_melbourne_sc, specialist_retailer); 0.24::true_val(retailer_melbourne_sc, unk_retailer_melbourne_sc).

measured(s5, retailer_melbourne_sc, specialist_retailer).

all_consistent(retailer_melbourne_sc) :-
    consistent(s5, retailer_melbourne_sc).

evidence(all_consistent(retailer_melbourne_sc)).
query(true_val(retailer_melbourne_sc, specialist_retailer)).
query(true_val(retailer_melbourne_sc, unk_retailer_melbourne_sc)).

0.85::acc(s20, retailer_evo).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name evo.com (US)
% @values major_retailer=Major_outdoor_retailer_free_shipping_price_guarantee unk_retailer_evo=Unknown
% @importance 0.95

0.81::true_val(retailer_evo, major_retailer); 0.19::true_val(retailer_evo, unk_retailer_evo).

measured(s20, retailer_evo, major_retailer).

all_consistent(retailer_evo) :-
    consistent(s20, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_retailer)).
query(true_val(retailer_evo, unk_retailer_evo)).

0.78::acc(s21, retailer_blauer).

% @attr retailer_blauer
% @type categorical
% @canonical false
% @original_name Blauer Board Shop (US)
% @values core_shop_tgr_fav=Core_snowboard_shop_TGR_favorite_store unk_retailer_blauer=Unknown
% @importance 0.90

0.64::true_val(retailer_blauer, core_shop_tgr_fav); 0.36::true_val(retailer_blauer, unk_retailer_blauer).

measured(s21, retailer_blauer, core_shop_tgr_fav).

all_consistent(retailer_blauer) :-
    consistent(s21, retailer_blauer).

evidence(all_consistent(retailer_blauer)).
query(true_val(retailer_blauer, core_shop_tgr_fav)).
query(true_val(retailer_blauer, unk_retailer_blauer)).

0.75::acc(s22, retailer_s2as).

% @attr retailer_s2as
% @type categorical
% @canonical false
% @original_name Surface 2 Air Sports / S2AS (UK)
% @values specialist_snow_intl=Specialist_snow_retailer_intl_shipping_price_match unk_retailer_s2as=Unknown
% @importance 0.85

0.63::true_val(retailer_s2as, specialist_snow_intl); 0.37::true_val(retailer_s2as, unk_retailer_s2as).

measured(s22, retailer_s2as, specialist_snow_intl).

all_consistent(retailer_s2as) :-
    consistent(s22, retailer_s2as).

evidence(all_consistent(retailer_s2as)).
query(true_val(retailer_s2as, specialist_snow_intl)).
query(true_val(retailer_s2as, unk_retailer_s2as)).

0.72::acc(s26, retailer_ballistyx).

% @attr retailer_ballistyx
% @type categorical
% @canonical false
% @original_name Ballistyx (Australia)
% @values specialist_preorder_bonus=Specialist_board_retailer_preorder_bonus_tshirt unk_retailer_ballistyx=Unknown
% @importance 0.75

0.60::true_val(retailer_ballistyx, specialist_preorder_bonus); 0.40::true_val(retailer_ballistyx, unk_retailer_ballistyx).

measured(s26, retailer_ballistyx, specialist_preorder_bonus).

all_consistent(retailer_ballistyx) :-
    consistent(s26, retailer_ballistyx).

evidence(all_consistent(retailer_ballistyx)).
query(true_val(retailer_ballistyx, specialist_preorder_bonus)).
query(true_val(retailer_ballistyx, unk_retailer_ballistyx)).

0.78::acc(s21, retailer_blue_tomato).

% @attr retailer_blue_tomato
% @type categorical
% @canonical false
% @original_name BlueTomato (EU)
% @values large_eu_retailer=Large_European_action_sports_retailer unk_retailer_blue_tomato=Unknown
% @importance 0.90

0.64::true_val(retailer_blue_tomato, large_eu_retailer); 0.36::true_val(retailer_blue_tomato, unk_retailer_blue_tomato).

measured(s21, retailer_blue_tomato, large_eu_retailer).

all_consistent(retailer_blue_tomato) :-
    consistent(s21, retailer_blue_tomato).

evidence(all_consistent(retailer_blue_tomato)).
query(true_val(retailer_blue_tomato, large_eu_retailer)).
query(true_val(retailer_blue_tomato, unk_retailer_blue_tomato)).

0.75::acc(s21, retailer_snowcountry).

% @attr retailer_snowcountry
% @type categorical
% @canonical false
% @original_name SnowCountry (EU)
% @values eu_retailer_479_96=European_retailer_479_96_EUR_for_25_26 unk_retailer_snowcountry=Unknown
% @importance 0.90

0.64::true_val(retailer_snowcountry, eu_retailer_479_96); 0.36::true_val(retailer_snowcountry, unk_retailer_snowcountry).

measured(s21, retailer_snowcountry, eu_retailer_479_96).

all_consistent(retailer_snowcountry) :-
    consistent(s21, retailer_snowcountry).

evidence(all_consistent(retailer_snowcountry)).
query(true_val(retailer_snowcountry, eu_retailer_479_96)).
query(true_val(retailer_snowcountry, unk_retailer_snowcountry)).

0.68::acc(s45, retailer_darkside).

% @attr retailer_darkside
% @type categorical
% @canonical false
% @original_name Darkside Snowboards (Vermont, US)
% @values vt_core_shop=Established_1989_Vermont_core_shop unk_retailer_darkside=Unknown
% @importance 0.50

0.49::true_val(retailer_darkside, vt_core_shop); 0.51::true_val(retailer_darkside, unk_retailer_darkside).

measured(s45, retailer_darkside, vt_core_shop).

all_consistent(retailer_darkside) :-
    consistent(s45, retailer_darkside).

evidence(all_consistent(retailer_darkside)).
query(true_val(retailer_darkside, vt_core_shop)).
query(true_val(retailer_darkside, unk_retailer_darkside)).

0.68::acc(s23, retailer_exodus).

% @attr retailer_exodus
% @type categorical
% @canonical false
% @original_name Exodus Ride Shop (US)
% @values smaller_board_retailer=Smaller_board_retailer unk_retailer_exodus=Unknown
% @importance 0.80

0.59::true_val(retailer_exodus, smaller_board_retailer); 0.41::true_val(retailer_exodus, unk_retailer_exodus).

measured(s23, retailer_exodus, smaller_board_retailer).

all_consistent(retailer_exodus) :-
    consistent(s23, retailer_exodus).

evidence(all_consistent(retailer_exodus)).
query(true_val(retailer_exodus, smaller_board_retailer)).
query(true_val(retailer_exodus, unk_retailer_exodus)).

0.65::acc(s46, retailer_sbf).

% @attr retailer_sbf
% @type categorical
% @canonical false
% @original_name SBF Boardshop (US)
% @values carries_board=Carries_the_board unk_retailer_sbf=Unknown
% @importance 0.50

0.42::true_val(retailer_sbf, carries_board); 0.58::true_val(retailer_sbf, unk_retailer_sbf).

measured(s46, retailer_sbf, carries_board).

all_consistent(retailer_sbf) :-
    consistent(s46, retailer_sbf).

evidence(all_consistent(retailer_sbf)).
query(true_val(retailer_sbf, carries_board)).
query(true_val(retailer_sbf, unk_retailer_sbf)).

0.80::acc(s47, retailer_backcountry).

% @attr retailer_backcountry
% @type categorical
% @canonical false
% @original_name Backcountry.com (US)
% @values major_outdoor_retailer=Major_outdoor_retailer_listed_2025 unk_retailer_backcountry=Unknown
% @importance 0.60

0.68::true_val(retailer_backcountry, major_outdoor_retailer); 0.32::true_val(retailer_backcountry, unk_retailer_backcountry).

measured(s47, retailer_backcountry, major_outdoor_retailer).

all_consistent(retailer_backcountry) :-
    consistent(s47, retailer_backcountry).

evidence(all_consistent(retailer_backcountry)).
query(true_val(retailer_backcountry, major_outdoor_retailer)).
query(true_val(retailer_backcountry, unk_retailer_backcountry)).

0.72::acc(s48, retailer_amazon).

% @attr retailer_amazon
% @type categorical
% @canonical false
% @original_name Amazon.com (US)
% @values listed_rome_store=Listed_via_Rome_Snowboards_Store unk_retailer_amazon=Unknown
% @importance 0.60

0.56::true_val(retailer_amazon, listed_rome_store); 0.44::true_val(retailer_amazon, unk_retailer_amazon).

measured(s48, retailer_amazon, listed_rome_store).

all_consistent(retailer_amazon) :-
    consistent(s48, retailer_amazon).

evidence(all_consistent(retailer_amazon)).
query(true_val(retailer_amazon, listed_rome_store)).
query(true_val(retailer_amazon, unk_retailer_amazon)).

0.85::acc(s13, tgr_boot_sizes_regular).

% @attr tgr_boot_sizes_regular
% @type categorical
% @canonical false
% @original_name The Good Ride recommended US boot sizes for regular widths
% @values reg_sizes=151_7_5_8_5_154_8_8_5_157_9_9_5_160_9_5_10 unk_tgr_boot_sizes_regular=Unknown
% @importance 0.95

0.78::true_val(tgr_boot_sizes_regular, reg_sizes); 0.22::true_val(tgr_boot_sizes_regular, unk_tgr_boot_sizes_regular).

measured(s13, tgr_boot_sizes_regular, reg_sizes).

all_consistent(tgr_boot_sizes_regular) :-
    consistent(s13, tgr_boot_sizes_regular).

evidence(all_consistent(tgr_boot_sizes_regular)).
query(true_val(tgr_boot_sizes_regular, reg_sizes)).
query(true_val(tgr_boot_sizes_regular, unk_tgr_boot_sizes_regular)).

0.85::acc(s13, tgr_boot_sizes_wide).

% @attr tgr_boot_sizes_wide
% @type categorical
% @canonical false
% @original_name The Good Ride recommended US boot sizes for wide widths
% @values wide_sizes=155w_10_11_158w_10_5_11_5_161w_11_12 unk_tgr_boot_sizes_wide=Unknown
% @importance 0.95

0.78::true_val(tgr_boot_sizes_wide, wide_sizes); 0.22::true_val(tgr_boot_sizes_wide, unk_tgr_boot_sizes_wide).

measured(s13, tgr_boot_sizes_wide, wide_sizes).

all_consistent(tgr_boot_sizes_wide) :-
    consistent(s13, tgr_boot_sizes_wide).

evidence(all_consistent(tgr_boot_sizes_wide)).
query(true_val(tgr_boot_sizes_wide, wide_sizes)).
query(true_val(tgr_boot_sizes_wide, unk_tgr_boot_sizes_wide)).

0.80::acc(s35, reviewer_opinion_tgr_weight).

% @attr reviewer_opinion_tgr_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (Weight ranges)
% @values conservative_go_heavier=Rome_ranges_conservative_can_go_heavier unk_reviewer_opinion_tgr_weight=Unknown
% @importance 0.80

0.66::true_val(reviewer_opinion_tgr_weight, conservative_go_heavier); 0.34::true_val(reviewer_opinion_tgr_weight, unk_reviewer_opinion_tgr_weight).

measured(s35, reviewer_opinion_tgr_weight, conservative_go_heavier).

all_consistent(reviewer_opinion_tgr_weight) :-
    consistent(s35, reviewer_opinion_tgr_weight).

evidence(all_consistent(reviewer_opinion_tgr_weight)).
query(true_val(reviewer_opinion_tgr_weight, conservative_go_heavier)).
query(true_val(reviewer_opinion_tgr_weight, unk_reviewer_opinion_tgr_weight)).

0.70::acc(s29, binding_compatibility).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values x2x4_most_modern=2x4_pattern_most_modern_bindings_compatible unk_binding_compatibility=Unknown
% @importance 0.60

0.46::true_val(binding_compatibility, x2x4_most_modern); 0.54::true_val(binding_compatibility, unk_binding_compatibility).

measured(s29, binding_compatibility, x2x4_most_modern).

all_consistent(binding_compatibility) :-
    consistent(s29, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, x2x4_most_modern)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

0.85::acc(s13, stance_position).

% @attr stance_position
% @type categorical
% @canonical false
% @original_name Stance position
% @values centered=Centered_true_twin unk_stance_position=Unknown
% @importance 0.95

0.78::true_val(stance_position, centered); 0.22::true_val(stance_position, unk_stance_position).

measured(s13, stance_position, centered).

all_consistent(stance_position) :-
    consistent(s13, stance_position).

evidence(all_consistent(stance_position)).
query(true_val(stance_position, centered)).
query(true_val(stance_position, unk_stance_position)).

0.75::acc(s49, rome_ownership).

% @attr rome_ownership
% @type categorical
% @canonical false
% @original_name Rome ownership
% @values nidecker_lps_2018=Acquired_by_Nidecker_LPS_2018 unk_rome_ownership=Unknown
% @importance 0.40

0.64::true_val(rome_ownership, nidecker_lps_2018); 0.36::true_val(rome_ownership, unk_rome_ownership).

measured(s49, rome_ownership, nidecker_lps_2018).

all_consistent(rome_ownership) :-
    consistent(s49, rome_ownership).

evidence(all_consistent(rome_ownership)).
query(true_val(rome_ownership, nidecker_lps_2018)).
query(true_val(rome_ownership, unk_rome_ownership)).

0.75::acc(s49, rome_design_post_acquisition).

% @attr rome_design_post_acquisition
% @type categorical
% @canonical false
% @original_name Rome Snowboards continue to be designed in Waterbury VT post-acquisition
% @values still_waterbury_vt=Designed_in_Waterbury_VT_post_acquisition unk_rome_design_post_acquisition=Unknown
% @importance 0.40

0.64::true_val(rome_design_post_acquisition, still_waterbury_vt); 0.36::true_val(rome_design_post_acquisition, unk_rome_design_post_acquisition).

measured(s49, rome_design_post_acquisition, still_waterbury_vt).

all_consistent(rome_design_post_acquisition) :-
    consistent(s49, rome_design_post_acquisition).

evidence(all_consistent(rome_design_post_acquisition)).
query(true_val(rome_design_post_acquisition, still_waterbury_vt)).
query(true_val(rome_design_post_acquisition, unk_rome_design_post_acquisition)).