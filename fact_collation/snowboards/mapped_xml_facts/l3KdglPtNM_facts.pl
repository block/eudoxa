0.15::indep(s3).
0.20::indep(s7).
0.35::indep(s16).
0.30::indep(s17).
0.20::indep(s29).
0.20::indep(s30).
0.20::indep(s31).
0.20::indep(s33).
0.20::indep(s36).
0.25::indep(s9).
0.20::indep(s21).
0.25::indep(s23).
0.20::indep(s25).
0.20::indep(s28).
0.20::indep(s37).
0.20::indep(s40).
0.20::indep(s41).
0.20::indep(s43).
0.20::indep(s44).
0.20::indep(s32).
0.35::indep(s35).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 1.0

0.95::acc(s1, brand).
0.95::acc(s2, brand).

0.97::true_val(brand, salomon); 0.03::true_val(brand, unk_brand).

measured(s1, brand, salomon).
measured(s2, brand, salomon).

all_consistent(brand) :-
    consistent(s1, brand),
    consistent(s2, brand).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values kickback=Kickback unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).
0.95::acc(s2, model_name).

0.97::true_val(model_name, kickback); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, kickback).
measured(s2, model_name, kickback).

all_consistent(model_name) :-
    consistent(s1, model_name),
    consistent(s2, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, kickback)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 1.0

0.82::acc(s3, model_year).

0.80::true_val(model_year, y2027); 0.20::true_val(model_year, unk_model_year).

measured(s3, model_year, y2027).

all_consistent(model_year) :-
    (indep(s3), consistent(s3, model_year) ; \+indep(s3)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values mens_freestyle_snowboard=Mens_Freestyle_Snowboard unk_product_type=Unknown
% @importance 0.95

0.93::acc(s1, product_type).
0.93::acc(s2, product_type).

0.97::true_val(product_type, mens_freestyle_snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, mens_freestyle_snowboard).
measured(s2, product_type, mens_freestyle_snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type),
    consistent(s2, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, mens_freestyle_snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values salomon_sas_amer=Salomon_SAS_Amer_Sports unk_manufacturer=Unknown
% @importance 0.5

0.93::acc(s4, manufacturer).

0.90::true_val(manufacturer, salomon_sas_amer); 0.10::true_val(manufacturer, unk_manufacturer).

measured(s4, manufacturer, salomon_sas_amer).

all_consistent(manufacturer) :-
    consistent(s4, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas_amer)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y1947_french_alps=1947_French_Alps_saw_blade_workshop unk_manufacturer_founded=Unknown
% @importance 0.3

0.55::acc(s5, manufacturer_founded).

0.58::true_val(manufacturer_founded, y1947_french_alps); 0.42::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s5, manufacturer_founded, y1947_french_alps).

all_consistent(manufacturer_founded) :-
    consistent(s5, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y1947_french_alps)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr manufacturer_reputation
% @type categorical
% @canonical false
% @original_name Manufacturer reputation
% @values established_trusted_innovator=Established_trusted_innovator unk_manufacturer_reputation=Unknown
% @importance 0.6

0.45::acc(s6, manufacturer_reputation).

0.41::true_val(manufacturer_reputation, established_trusted_innovator); 0.59::true_val(manufacturer_reputation, unk_manufacturer_reputation).

measured(s6, manufacturer_reputation, established_trusted_innovator).

all_consistent(manufacturer_reputation) :-
    consistent(s6, manufacturer_reputation).

evidence(all_consistent(manufacturer_reputation)).
query(true_val(manufacturer_reputation, established_trusted_innovator)).
query(true_val(manufacturer_reputation, unk_manufacturer_reputation)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_years_mfr_defects=2_years_manufacturer_defects unk_warranty=Unknown
% @importance 0.75

0.65::acc(s7, warranty).
0.93::acc(s8, warranty).

0.97::true_val(warranty, two_years_mfr_defects); 0.03::true_val(warranty, unk_warranty).

measured(s7, warranty, two_years_mfr_defects).
measured(s8, warranty, two_years_mfr_defects).

all_consistent(warranty) :-
    (indep(s7), consistent(s7, warranty) ; \+indep(s7)),
    consistent(s8, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_years_mfr_defects)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty
% @values defects_only_no_wear=Defects_only_no_wear_tear_abuse unk_warranty_coverage=Unknown
% @importance 0.75

0.65::acc(s7, warranty_coverage).

0.66::true_val(warranty_coverage, defects_only_no_wear); 0.34::true_val(warranty_coverage, unk_warranty_coverage).

measured(s7, warranty_coverage, defects_only_no_wear).

all_consistent(warranty_coverage) :-
    (indep(s7), consistent(s7, warranty_coverage) ; \+indep(s7)).

evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, defects_only_no_wear)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

% @attr warranty_proof
% @type categorical
% @canonical false
% @original_name warranty
% @values sales_receipt_required=Sales_receipt_required unk_warranty_proof=Unknown
% @importance 0.75

0.65::acc(s7, warranty_proof).

0.66::true_val(warranty_proof, sales_receipt_required); 0.34::true_val(warranty_proof, unk_warranty_proof).

measured(s7, warranty_proof, sales_receipt_required).

all_consistent(warranty_proof) :-
    (indep(s7), consistent(s7, warranty_proof) ; \+indep(s7)).

evidence(all_consistent(warranty_proof)).
query(true_val(warranty_proof, sales_receipt_required)).
query(true_val(warranty_proof, unk_warranty_proof)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2025=2025 unk_model_first_available_year=Unknown
% @importance 0.6

0.50::acc(s9, model_first_available_year).

0.49::true_val(model_first_available_year, y2025); 0.51::true_val(model_first_available_year, unk_model_first_available_year).

measured(s9, model_first_available_year, y2025).

all_consistent(model_first_available_year) :-
    (indep(s9), consistent(s9, model_first_available_year) ; \+indep(s9)).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2025)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr previous_model_years
% @type categorical
% @canonical false
% @original_name Previous model years available
% @values y2025_and_y2026=2025_and_2026 unk_previous_model_years=Unknown
% @importance 0.5

0.55::acc(s10, previous_model_years).
0.50::acc(s11, previous_model_years).

0.85::true_val(previous_model_years, y2025_and_y2026); 0.15::true_val(previous_model_years, unk_previous_model_years).

measured(s10, previous_model_years, y2025_and_y2026).
measured(s11, previous_model_years, y2025_and_y2026).

all_consistent(previous_model_years) :-
    consistent(s10, previous_model_years),
    consistent(s11, previous_model_years).

evidence(all_consistent(previous_model_years)).
query(true_val(previous_model_years, y2025_and_y2026)).
query(true_val(previous_model_years, unk_previous_model_years)).

% @attr article_reference_number
% @type categorical
% @canonical false
% @original_name Salomon article reference number (2026 model)
% @values l47924700=L47924700 unk_article_reference_number=Unknown
% @importance 0.3

0.93::acc(s12, article_reference_number).

0.90::true_val(article_reference_number, l47924700); 0.10::true_val(article_reference_number, unk_article_reference_number).

measured(s12, article_reference_number, l47924700).

all_consistent(article_reference_number) :-
    consistent(s12, article_reference_number).

evidence(all_consistent(article_reference_number)).
query(true_val(article_reference_number, l47924700)).
query(true_val(article_reference_number, unk_article_reference_number)).

% @attr price_aud_merchant_preorder
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v719_99=719.99 unk_price_aud_merchant_preorder=Unknown
% @importance 1.0

0.82::acc(s3, price_aud_merchant_preorder).

0.80::true_val(price_aud_merchant_preorder, v719_99); 0.20::true_val(price_aud_merchant_preorder, unk_price_aud_merchant_preorder).

measured(s3, price_aud_merchant_preorder, v719_99).

all_consistent(price_aud_merchant_preorder) :-
    (indep(s3), consistent(s3, price_aud_merchant_preorder) ; \+indep(s3)).

evidence(all_consistent(price_aud_merchant_preorder)).
query(true_val(price_aud_merchant_preorder, v719_99)).
query(true_val(price_aud_merchant_preorder, unk_price_aud_merchant_preorder)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v487_49=487.49 unk_price_aud_merchant=Unknown
% @importance 0.9

0.88::acc(s13, price_aud_merchant).

0.88::true_val(price_aud_merchant, v487_49); 0.12::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s13, price_aud_merchant, v487_49).

all_consistent(price_aud_merchant) :-
    consistent(s13, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v487_49)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_aud_merchant_analysis
% @type categorical
% @canonical false
% @original_name price_aud_merchant
% @values preorder_markup_vs_current=Preorder_markup_vs_current_season unk_price_aud_merchant_analysis=Unknown
% @importance 0.95

0.82::acc(s3, price_aud_merchant_analysis).
0.88::acc(s13, price_aud_merchant_analysis).

0.90::true_val(price_aud_merchant_analysis, preorder_markup_vs_current); 0.10::true_val(price_aud_merchant_analysis, unk_price_aud_merchant_analysis).

measured(s3, price_aud_merchant_analysis, preorder_markup_vs_current).
measured(s13, price_aud_merchant_analysis, preorder_markup_vs_current).

all_consistent(price_aud_merchant_analysis) :-
    (indep(s3), consistent(s3, price_aud_merchant_analysis) ; \+indep(s3)),
    consistent(s13, price_aud_merchant_analysis).

evidence(all_consistent(price_aud_merchant_analysis)).
query(true_val(price_aud_merchant_analysis, preorder_markup_vs_current)).
query(true_val(price_aud_merchant_analysis, unk_price_aud_merchant_analysis)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v429_95=429.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.65::acc(s14, price_usd_msrp).
0.55::acc(s15, price_usd_msrp).

0.95::true_val(price_usd_msrp, v429_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s14, price_usd_msrp, v429_95).
measured(s15, price_usd_msrp, v429_95).

all_consistent(price_usd_msrp) :-
    consistent(s14, price_usd_msrp),
    consistent(s15, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v429_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v343_96=343.96 unk_price_usd_evo=Unknown
% @importance 0.95

0.82::acc(s16, price_usd_evo).

0.76::true_val(price_usd_evo, v343_96); 0.24::true_val(price_usd_evo, unk_price_usd_evo).

measured(s16, price_usd_evo, v343_96).

all_consistent(price_usd_evo) :-
    consistent(s16, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v343_96)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_the_house
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD, The House sale, 2025/2026 model)
% @values v279_95=279.95 unk_price_usd_the_house=Unknown
% @importance 0.9

0.70::acc(s17, price_usd_the_house).

0.67::true_val(price_usd_the_house, v279_95); 0.33::true_val(price_usd_the_house, unk_price_usd_the_house).

measured(s17, price_usd_the_house, v279_95).

all_consistent(price_usd_the_house) :-
    consistent(s17, price_usd_the_house).

evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v279_95)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

% @attr price_usd_msrp_analysis
% @type categorical
% @canonical false
% @original_name price_usd_msrp
% @values msrp_increase_30_yr=MSRP_increase_30_year_over_year unk_price_usd_msrp_analysis=Unknown
% @importance 0.93

0.70::acc(s17, price_usd_msrp_analysis).
0.65::acc(s14, price_usd_msrp_analysis).
0.55::acc(s15, price_usd_msrp_analysis).

0.90::true_val(price_usd_msrp_analysis, msrp_increase_30_yr); 0.10::true_val(price_usd_msrp_analysis, unk_price_usd_msrp_analysis).

measured(s17, price_usd_msrp_analysis, msrp_increase_30_yr).
measured(s14, price_usd_msrp_analysis, msrp_increase_30_yr).
measured(s15, price_usd_msrp_analysis, msrp_increase_30_yr).

all_consistent(price_usd_msrp_analysis) :-
    consistent(s17, price_usd_msrp_analysis),
    consistent(s14, price_usd_msrp_analysis),
    consistent(s15, price_usd_msrp_analysis).

evidence(all_consistent(price_usd_msrp_analysis)).
query(true_val(price_usd_msrp_analysis, msrp_increase_30_yr)).
query(true_val(price_usd_msrp_analysis, unk_price_usd_msrp_analysis)).

% @attr price_usd_modern_skate
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD, Modern Skate, 2026/2027 model)
% @values v429_95=429.95 unk_price_usd_modern_skate=Unknown
% @importance 0.85

0.50::acc(s18, price_usd_modern_skate).

0.49::true_val(price_usd_modern_skate, v429_95); 0.51::true_val(price_usd_modern_skate, unk_price_usd_modern_skate).

measured(s18, price_usd_modern_skate, v429_95).

all_consistent(price_usd_modern_skate) :-
    consistent(s18, price_usd_modern_skate).

evidence(all_consistent(price_usd_modern_skate)).
query(true_val(price_usd_modern_skate, v429_95)).
query(true_val(price_usd_modern_skate, unk_price_usd_modern_skate)).

% @attr price_usd_getboards
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD, Getboards, 2026 model)
% @values v429_95=429.95 unk_price_usd_getboards=Unknown
% @importance 0.85

0.55::acc(s19, price_usd_getboards).

0.54::true_val(price_usd_getboards, v429_95); 0.46::true_val(price_usd_getboards, unk_price_usd_getboards).

measured(s19, price_usd_getboards, v429_95).

all_consistent(price_usd_getboards) :-
    consistent(s19, price_usd_getboards).

evidence(all_consistent(price_usd_getboards)).
query(true_val(price_usd_getboards, v429_95)).
query(true_val(price_usd_getboards, unk_price_usd_getboards)).

% @attr price_usd_willis
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD, Willi's Ski & Board, 2026 model)
% @values v429_95=429.95 unk_price_usd_willis=Unknown
% @importance 0.85

0.65::acc(s20, price_usd_willis).

0.63::true_val(price_usd_willis, v429_95); 0.37::true_val(price_usd_willis, unk_price_usd_willis).

measured(s20, price_usd_willis, v429_95).

all_consistent(price_usd_willis) :-
    consistent(s20, price_usd_willis).

evidence(all_consistent(price_usd_willis)).
query(true_val(price_usd_willis, v429_95)).
query(true_val(price_usd_willis, unk_price_usd_willis)).

% @attr price_usd_action_rideshop
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD, Action Rideshop, 2025 model, on sale)
% @values v339_96=339.96 unk_price_usd_action_rideshop=Unknown
% @importance 0.85

0.52::acc(s21, price_usd_action_rideshop).

0.51::true_val(price_usd_action_rideshop, v339_96); 0.49::true_val(price_usd_action_rideshop, unk_price_usd_action_rideshop).

measured(s21, price_usd_action_rideshop, v339_96).

all_consistent(price_usd_action_rideshop) :-
    consistent(s21, price_usd_action_rideshop).

evidence(all_consistent(price_usd_action_rideshop)).
query(true_val(price_usd_action_rideshop, v339_96)).
query(true_val(price_usd_action_rideshop, unk_price_usd_action_rideshop)).

% @attr price_usd_sundance
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD, Sundance Ski, 2025 model)
% @values v336_00=336.0 unk_price_usd_sundance=Unknown
% @importance 0.8

0.44::acc(s22, price_usd_sundance).

0.44::true_val(price_usd_sundance, v336_00); 0.56::true_val(price_usd_sundance, unk_price_usd_sundance).

measured(s22, price_usd_sundance, v336_00).

all_consistent(price_usd_sundance) :-
    consistent(s22, price_usd_sundance).

evidence(all_consistent(price_usd_sundance)).
query(true_val(price_usd_sundance, v336_00)).
query(true_val(price_usd_sundance, unk_price_usd_sundance)).

% @attr price_positioning
% @type categorical
% @canonical false
% @original_name Price positioning
% @values budget_friendly_freestyle=Budget_friendly_freestyle_lineup unk_price_positioning=Unknown
% @importance 0.8

0.58::acc(s23, price_positioning).

0.58::true_val(price_positioning, budget_friendly_freestyle); 0.42::true_val(price_positioning, unk_price_positioning).

measured(s23, price_positioning, budget_friendly_freestyle).

all_consistent(price_positioning) :-
    (indep(s23), consistent(s23, price_positioning) ; \+indep(s23)).

evidence(all_consistent(price_positioning)).
query(true_val(price_positioning, budget_friendly_freestyle)).
query(true_val(price_positioning, unk_price_positioning)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock_2026=In_stock_2026_model unk_availability_status=Unknown
% @importance 0.95

0.82::acc(s16, availability_status).

0.76::true_val(availability_status, in_stock_2026); 0.24::true_val(availability_status, unk_availability_status).

measured(s16, availability_status, in_stock_2026).

all_consistent(availability_status) :-
    consistent(s16, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_2026)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_148_158w=In_stock_148_to_158W unk_availability_status_the_house=Unknown
% @importance 0.9

0.70::acc(s17, availability_status_the_house).

0.67::true_val(availability_status_the_house, in_stock_148_158w); 0.33::true_val(availability_status_the_house, unk_availability_status_the_house).

measured(s17, availability_status_the_house, in_stock_148_158w).

all_consistent(availability_status_the_house) :-
    consistent(s17, availability_status_the_house).

evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, in_stock_148_158w)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

% @attr availability_status_willis
% @type categorical
% @canonical false
% @original_name availability_status
% @values select_sizes_in_stock=Select_sizes_in_stock unk_availability_status_willis=Unknown
% @importance 0.85

0.65::acc(s20, availability_status_willis).

0.63::true_val(availability_status_willis, select_sizes_in_stock); 0.37::true_val(availability_status_willis, unk_availability_status_willis).

measured(s20, availability_status_willis, select_sizes_in_stock).

all_consistent(availability_status_willis) :-
    consistent(s20, availability_status_willis).

evidence(all_consistent(availability_status_willis)).
query(true_val(availability_status_willis, select_sizes_in_stock)).
query(true_val(availability_status_willis, unk_availability_status_willis)).

% @attr availability_status_salomon_au
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_sale_prior_year=Available_sale_pricing_prior_year unk_availability_status_salomon_au=Unknown
% @importance 0.9

0.88::acc(s13, availability_status_salomon_au).

0.81::true_val(availability_status_salomon_au, available_sale_prior_year); 0.19::true_val(availability_status_salomon_au, unk_availability_status_salomon_au).

measured(s13, availability_status_salomon_au, available_sale_prior_year).

all_consistent(availability_status_salomon_au) :-
    consistent(s13, availability_status_salomon_au).

evidence(all_consistent(availability_status_salomon_au)).
query(true_val(availability_status_salomon_au, available_sale_prior_year)).
query(true_val(availability_status_salomon_au, unk_availability_status_salomon_au)).

% @attr availability_status_rhythm
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2027=2027_model_listed unk_availability_status_rhythm=Unknown
% @importance 0.7

0.55::acc(s24, availability_status_rhythm).

0.55::true_val(availability_status_rhythm, listed_2027); 0.45::true_val(availability_status_rhythm, unk_availability_status_rhythm).

measured(s24, availability_status_rhythm, listed_2027).

all_consistent(availability_status_rhythm) :-
    consistent(s24, availability_status_rhythm).

evidence(all_consistent(availability_status_rhythm)).
query(true_val(availability_status_rhythm, listed_2027)).
query(true_val(availability_status_rhythm, unk_availability_status_rhythm)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2027=2027_model_listed unk_availability_status_blauer=Unknown
% @importance 0.6

0.48::acc(s25, availability_status_blauer).

0.48::true_val(availability_status_blauer, listed_2027); 0.52::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s25, availability_status_blauer, listed_2027).

all_consistent(availability_status_blauer) :-
    (indep(s25), consistent(s25, availability_status_blauer) ; \+indep(s25)).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, listed_2027)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_getboards
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_2026=2026_model_in_stock unk_availability_status_getboards=Unknown
% @importance 0.85

0.55::acc(s19, availability_status_getboards).

0.54::true_val(availability_status_getboards, in_stock_2026); 0.46::true_val(availability_status_getboards, unk_availability_status_getboards).

measured(s19, availability_status_getboards, in_stock_2026).

all_consistent(availability_status_getboards) :-
    consistent(s19, availability_status_getboards).

evidence(all_consistent(availability_status_getboards)).
query(true_val(availability_status_getboards, in_stock_2026)).
query(true_val(availability_status_getboards, unk_availability_status_getboards)).

% @attr availability_status_skipro
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out_all_sizes=Sold_out_all_sizes unk_availability_status_skipro=Unknown
% @importance 0.8

0.51::acc(s26, availability_status_skipro).

0.51::true_val(availability_status_skipro, sold_out_all_sizes); 0.49::true_val(availability_status_skipro, unk_availability_status_skipro).

measured(s26, availability_status_skipro, sold_out_all_sizes).

all_consistent(availability_status_skipro) :-
    consistent(s26, availability_status_skipro).

evidence(all_consistent(availability_status_skipro)).
query(true_val(availability_status_skipro, sold_out_all_sizes)).
query(true_val(availability_status_skipro, unk_availability_status_skipro)).

% @attr availability_status_ebay
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_2026_158w=2026_model_available_158W unk_availability_status_ebay=Unknown
% @importance 0.5

0.28::acc(s27, availability_status_ebay).

0.28::true_val(availability_status_ebay, available_2026_158w); 0.72::true_val(availability_status_ebay, unk_availability_status_ebay).

measured(s27, availability_status_ebay, available_2026_158w).

all_consistent(availability_status_ebay) :-
    consistent(s27, availability_status_ebay).

evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, available_2026_158w)).
query(true_val(availability_status_ebay, unk_availability_status_ebay)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_1_2026=May_1_2026_preorder unk_estimated_availability_date=Unknown
% @importance 1.0

0.82::acc(s3, estimated_availability_date).

0.80::true_val(estimated_availability_date, may_1_2026); 0.20::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s3, estimated_availability_date, may_1_2026).

all_consistent(estimated_availability_date) :-
    (indep(s3), consistent(s3, estimated_availability_date) ; \+indep(s3)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle=Freestyle unk_board_category=Unknown
% @importance 0.95

0.93::acc(s1, board_category).
0.93::acc(s2, board_category).

0.97::true_val(board_category, freestyle); 0.03::true_val(board_category, unk_board_category).

measured(s1, board_category, freestyle).
measured(s2, board_category, freestyle).

all_consistent(board_category) :-
    consistent(s1, board_category),
    consistent(s2, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle)).
query(true_val(board_category, unk_board_category)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park=Park unk_terrain_suitability=Unknown
% @importance 0.95

0.93::acc(s1, terrain_suitability).
0.82::acc(s3, terrain_suitability).

0.95::true_val(terrain_suitability, park); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, park).
measured(s3, terrain_suitability, park).

all_consistent(terrain_suitability) :-
    consistent(s1, terrain_suitability),
    (indep(s3), consistent(s3, terrain_suitability) ; \+indep(s3)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_presses_rails_jumps=Freestyle_presses_rails_jumps unk_riding_style=Unknown
% @importance 0.95

0.93::acc(s1, riding_style).
0.93::acc(s2, riding_style).

0.97::true_val(riding_style, freestyle_presses_rails_jumps); 0.03::true_val(riding_style, unk_riding_style).

measured(s1, riding_style, freestyle_presses_rails_jumps).
measured(s2, riding_style, freestyle_presses_rails_jumps).

all_consistent(riding_style) :-
    consistent(s1, riding_style),
    consistent(s2, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_presses_rails_jumps)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner_intermediate=Beginner_Intermediate unk_rider_level=Unknown
% @importance 0.95

0.93::acc(s2, rider_level).
0.82::acc(s3, rider_level).

0.95::true_val(rider_level, beginner_intermediate); 0.05::true_val(rider_level, unk_rider_level).

measured(s2, rider_level, beginner_intermediate).
measured(s3, rider_level, beginner_intermediate).

all_consistent(rider_level) :-
    consistent(s2, rider_level),
    (indep(s3), consistent(s3, rider_level) ; \+indep(s3)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.7

0.60::acc(s28, gender).

0.62::true_val(gender, mens); 0.38::true_val(gender, unk_gender).

measured(s28, gender, mens).

all_consistent(gender) :-
    (indep(s28), consistent(s28, gender) ; \+indep(s28)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.85

0.60::acc(s29, shape).

0.62::true_val(shape, true_twin); 0.38::true_val(shape, unk_shape).

measured(s29, shape, true_twin).

all_consistent(shape) :-
    (indep(s29), consistent(s29, shape) ; \+indep(s29)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rock_out_camber=Rock_Out_Camber_flat_camber_rocker unk_camber_type=Unknown
% @importance 0.95

0.93::acc(s1, camber_type).
0.93::acc(s2, camber_type).

0.97::true_val(camber_type, rock_out_camber); 0.03::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, rock_out_camber).
measured(s2, camber_type, rock_out_camber).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    consistent(s2, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, rock_out_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v2=2.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 1.0

0.82::acc(s3, flex_rating_10_manufacturer).

0.80::true_val(flex_rating_10_manufacturer, v2); 0.20::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s3, flex_rating_10_manufacturer, v2).

all_consistent(flex_rating_10_manufacturer) :-
    (indep(s3), consistent(s3, flex_rating_10_manufacturer) ; \+indep(s3)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v2)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_rating_10
% @type categorical
% @canonical true
% @original_name flex_rating_10
% @values softest_category_all_scales=Softest_category_across_scales unk_flex_rating_10=Unknown
% @importance 0.85

0.58::acc(s30, flex_rating_10).
0.52::acc(s21, flex_rating_10).
0.82::acc(s3, flex_rating_10).
0.55::acc(s31, flex_rating_10).

0.95::true_val(flex_rating_10, softest_category_all_scales); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

measured(s30, flex_rating_10, softest_category_all_scales).
measured(s21, flex_rating_10, softest_category_all_scales).
measured(s3, flex_rating_10, softest_category_all_scales).
measured(s31, flex_rating_10, softest_category_all_scales).

all_consistent(flex_rating_10) :-
    (indep(s30), consistent(s30, flex_rating_10) ; \+indep(s30)),
    (indep(s21), consistent(s21, flex_rating_10) ; \+indep(s21)),
    (indep(s3), consistent(s3, flex_rating_10) ; \+indep(s3)),
    (indep(s31), consistent(s31, flex_rating_10) ; \+indep(s31)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, softest_category_all_scales)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values soft_playful_forgiving_buttery=Soft_playful_forgiving_buttery unk_flex_feel=Unknown
% @importance 0.84

0.82::acc(s16, flex_feel).
0.55::acc(s31, flex_feel).
0.90::acc(s1, flex_feel).
0.55::acc(s41, flex_feel).

0.95::true_val(flex_feel, soft_playful_forgiving_buttery); 0.05::true_val(flex_feel, unk_flex_feel).

measured(s16, flex_feel, soft_playful_forgiving_buttery).
measured(s31, flex_feel, soft_playful_forgiving_buttery).
measured(s1, flex_feel, soft_playful_forgiving_buttery).
measured(s41, flex_feel, soft_playful_forgiving_buttery).

all_consistent(flex_feel) :-
    (indep(s16), consistent(s16, flex_feel) ; \+indep(s16)),
    (indep(s31), consistent(s31, flex_feel) ; \+indep(s31)),
    consistent(s1, flex_feel),
    (indep(s41), consistent(s41, flex_feel) ; \+indep(s41)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, soft_playful_forgiving_buttery)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_feel_vs_sleepwalker
% @type categorical
% @canonical false
% @original_name flex_feel
% @values pct20_softer_sleepwalker=20pct_softer_than_Sleepwalker unk_flex_feel_vs_sleepwalker=Unknown
% @importance 0.8

0.58::acc(s23, flex_feel_vs_sleepwalker).

0.58::true_val(flex_feel_vs_sleepwalker, pct20_softer_sleepwalker); 0.42::true_val(flex_feel_vs_sleepwalker, unk_flex_feel_vs_sleepwalker).

measured(s23, flex_feel_vs_sleepwalker, pct20_softer_sleepwalker).

all_consistent(flex_feel_vs_sleepwalker) :-
    (indep(s23), consistent(s23, flex_feel_vs_sleepwalker) ; \+indep(s23)).

evidence(all_consistent(flex_feel_vs_sleepwalker)).
query(true_val(flex_feel_vs_sleepwalker, pct20_softer_sleepwalker)).
query(true_val(flex_feel_vs_sleepwalker, unk_flex_feel_vs_sleepwalker)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values eq_rad=EQ_Rad_straight_and_radial unk_sidecut_type=Unknown
% @importance 0.95

0.93::acc(s1, sidecut_type).
0.93::acc(s2, sidecut_type).

0.97::true_val(sidecut_type, eq_rad); 0.03::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, eq_rad).
measured(s2, sidecut_type, eq_rad).

all_consistent(sidecut_type) :-
    consistent(s1, sidecut_type),
    consistent(s2, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, eq_rad)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values pattern_2x4=2x4 unk_mounting_pattern=Unknown
% @importance 0.95

0.82::acc(s3, mounting_pattern).
0.70::acc(s17, mounting_pattern).

0.95::true_val(mounting_pattern, pattern_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s3, mounting_pattern, pattern_2x4).
measured(s17, mounting_pattern, pattern_2x4).

all_consistent(mounting_pattern) :-
    (indep(s3), consistent(s3, mounting_pattern) ; \+indep(s3)),
    (indep(s17), consistent(s17, mounting_pattern) ; \+indep(s17)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, pattern_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 1.0

0.82::acc(s3, width_options).

0.80::true_val(width_options, standard_and_wide); 0.20::true_val(width_options, unk_width_options).

measured(s3, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(s3), consistent(s3, width_options) ; \+indep(s3)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s151_153_155_155w=151_153_155_155W unk_available_sizes=Unknown
% @importance 1.0

0.82::acc(s3, available_sizes).

0.80::true_val(available_sizes, s151_153_155_155w); 0.20::true_val(available_sizes, unk_available_sizes).

measured(s3, available_sizes, s151_153_155_155w).

all_consistent(available_sizes) :-
    (indep(s3), consistent(s3, available_sizes) ; \+indep(s3)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s151_153_155_155w)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_2025
% @type categorical
% @canonical false
% @original_name available_sizes
% @values s148_151_153_155_158_155w_158w=148_151_153_155_158_155W_158W unk_available_sizes_2025=Unknown
% @importance 0.9

0.70::acc(s17, available_sizes_2025).

0.67::true_val(available_sizes_2025, s148_151_153_155_158_155w_158w); 0.33::true_val(available_sizes_2025, unk_available_sizes_2025).

measured(s17, available_sizes_2025, s148_151_153_155_158_155w_158w).

all_consistent(available_sizes_2025) :-
    consistent(s17, available_sizes_2025).

evidence(all_consistent(available_sizes_2025)).
query(true_val(available_sizes_2025, s148_151_153_155_158_155w_158w)).
query(true_val(available_sizes_2025, unk_available_sizes_2025)).

% @attr available_sizes_analysis
% @type categorical
% @canonical false
% @original_name available_sizes
% @values fewer_2027_or_incomplete=2027_fewer_sizes_or_incomplete_listing unk_available_sizes_analysis=Unknown
% @importance 0.95

0.82::acc(s3, available_sizes_analysis).
0.70::acc(s17, available_sizes_analysis).

0.85::true_val(available_sizes_analysis, fewer_2027_or_incomplete); 0.15::true_val(available_sizes_analysis, unk_available_sizes_analysis).

measured(s3, available_sizes_analysis, fewer_2027_or_incomplete).
measured(s17, available_sizes_analysis, fewer_2027_or_incomplete).

all_consistent(available_sizes_analysis) :-
    (indep(s3), consistent(s3, available_sizes_analysis) ; \+indep(s3)),
    (indep(s17), consistent(s17, available_sizes_analysis) ; \+indep(s17)).

evidence(all_consistent(available_sizes_analysis)).
query(true_val(available_sizes_analysis, fewer_2027_or_incomplete)).
query(true_val(available_sizes_analysis, unk_available_sizes_analysis)).

% @attr effective_edge_151
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 151cm
% @values v114_0=114.0 unk_effective_edge_151=Unknown
% @importance 1.0

0.82::acc(s3, effective_edge_151).

0.80::true_val(effective_edge_151, v114_0); 0.20::true_val(effective_edge_151, unk_effective_edge_151).

measured(s3, effective_edge_151, v114_0).

all_consistent(effective_edge_151) :-
    (indep(s3), consistent(s3, effective_edge_151) ; \+indep(s3)).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v114_0)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

% @attr effective_edge_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 153cm
% @values v119_0=119.0 unk_effective_edge_153=Unknown
% @importance 1.0

0.82::acc(s3, effective_edge_153).

0.80::true_val(effective_edge_153, v119_0); 0.20::true_val(effective_edge_153, unk_effective_edge_153).

measured(s3, effective_edge_153, v119_0).

all_consistent(effective_edge_153) :-
    (indep(s3), consistent(s3, effective_edge_153) ; \+indep(s3)).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v119_0)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

% @attr effective_edge_155
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 155cm
% @values v120_5=120.5 unk_effective_edge_155=Unknown
% @importance 1.0

0.82::acc(s3, effective_edge_155).

0.80::true_val(effective_edge_155, v120_5); 0.20::true_val(effective_edge_155, unk_effective_edge_155).

measured(s3, effective_edge_155, v120_5).

all_consistent(effective_edge_155) :-
    (indep(s3), consistent(s3, effective_edge_155) ; \+indep(s3)).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v120_5)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

% @attr effective_edge_155w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 155cm Wide
% @values v120_5=120.5 unk_effective_edge_155w=Unknown
% @importance 1.0

0.82::acc(s3, effective_edge_155w).

0.80::true_val(effective_edge_155w, v120_5); 0.20::true_val(effective_edge_155w, unk_effective_edge_155w).

measured(s3, effective_edge_155w, v120_5).

all_consistent(effective_edge_155w) :-
    (indep(s3), consistent(s3, effective_edge_155w) ; \+indep(s3)).

evidence(all_consistent(effective_edge_155w)).
query(true_val(effective_edge_155w, v120_5)).
query(true_val(effective_edge_155w, unk_effective_edge_155w)).

% @attr waist_width_151
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 151cm
% @values v24_7=24.7 unk_waist_width_151=Unknown
% @importance 0.95

0.82::acc(s3, waist_width_151).
0.70::acc(s17, waist_width_151).

0.95::true_val(waist_width_151, v24_7); 0.05::true_val(waist_width_151, unk_waist_width_151).

measured(s3, waist_width_151, v24_7).
measured(s17, waist_width_151, v24_7).

all_consistent(waist_width_151) :-
    (indep(s3), consistent(s3, waist_width_151) ; \+indep(s3)),
    (indep(s17), consistent(s17, waist_width_151) ; \+indep(s17)).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v24_7)).
query(true_val(waist_width_151, unk_waist_width_151)).

% @attr waist_width_153
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 153cm
% @values v25_0=25.0 unk_waist_width_153=Unknown
% @importance 1.0

0.82::acc(s3, waist_width_153).

0.80::true_val(waist_width_153, v25_0); 0.20::true_val(waist_width_153, unk_waist_width_153).

measured(s3, waist_width_153, v25_0).

all_consistent(waist_width_153) :-
    (indep(s3), consistent(s3, waist_width_153) ; \+indep(s3)).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_0)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr waist_width_155
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 155cm
% @values v25_2=25.2 unk_waist_width_155=Unknown
% @importance 0.95

0.82::acc(s3, waist_width_155).
0.70::acc(s17, waist_width_155).

0.95::true_val(waist_width_155, v25_2); 0.05::true_val(waist_width_155, unk_waist_width_155).

measured(s3, waist_width_155, v25_2).
measured(s17, waist_width_155, v25_2).

all_consistent(waist_width_155) :-
    (indep(s3), consistent(s3, waist_width_155) ; \+indep(s3)),
    (indep(s17), consistent(s17, waist_width_155) ; \+indep(s17)).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_2)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr waist_width_155w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 155cm Wide
% @values v25_9=25.9 unk_waist_width_155w=Unknown
% @importance 0.95

0.82::acc(s3, waist_width_155w).
0.70::acc(s17, waist_width_155w).

0.95::true_val(waist_width_155w, v25_9); 0.05::true_val(waist_width_155w, unk_waist_width_155w).

measured(s3, waist_width_155w, v25_9).
measured(s17, waist_width_155w, v25_9).

all_consistent(waist_width_155w) :-
    (indep(s3), consistent(s3, waist_width_155w) ; \+indep(s3)),
    (indep(s17), consistent(s17, waist_width_155w) ; \+indep(s17)).

evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v25_9)).
query(true_val(waist_width_155w, unk_waist_width_155w)).

% @attr tip_tail_width_size_151
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v29_2=29.2 unk_tip_tail_width_size_151=Unknown
% @importance 1.0

0.82::acc(s3, tip_tail_width_size_151).

0.80::true_val(tip_tail_width_size_151, v29_2); 0.20::true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151).

measured(s3, tip_tail_width_size_151, v29_2).

all_consistent(tip_tail_width_size_151) :-
    (indep(s3), consistent(s3, tip_tail_width_size_151) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, v29_2)).
query(true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151)).

% @attr tip_tail_width_size_153
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v29_5=29.5 unk_tip_tail_width_size_153=Unknown
% @importance 1.0

0.82::acc(s3, tip_tail_width_size_153).

0.80::true_val(tip_tail_width_size_153, v29_5); 0.20::true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153).

measured(s3, tip_tail_width_size_153, v29_5).

all_consistent(tip_tail_width_size_153) :-
    (indep(s3), consistent(s3, tip_tail_width_size_153) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v29_5)).
query(true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v29_7=29.7 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.82::acc(s3, tip_tail_width_size).

0.80::true_val(tip_tail_width_size, v29_7); 0.20::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s3, tip_tail_width_size, v29_7).

all_consistent(tip_tail_width_size) :-
    (indep(s3), consistent(s3, tip_tail_width_size) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_7)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_155w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v30_4=30.4 unk_tip_tail_width_size_155w=Unknown
% @importance 1.0

0.82::acc(s3, tip_tail_width_size_155w).

0.80::true_val(tip_tail_width_size_155w, v30_4); 0.20::true_val(tip_tail_width_size_155w, unk_tip_tail_width_size_155w).

measured(s3, tip_tail_width_size_155w, v30_4).

all_consistent(tip_tail_width_size_155w) :-
    (indep(s3), consistent(s3, tip_tail_width_size_155w) ; \+indep(s3)).

evidence(all_consistent(tip_tail_width_size_155w)).
query(true_val(tip_tail_width_size_155w, v30_4)).
query(true_val(tip_tail_width_size_155w, unk_tip_tail_width_size_155w)).

% @attr sidecut_radius_size_151
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_6=7.6 unk_sidecut_radius_size_151=Unknown
% @importance 1.0

0.82::acc(s3, sidecut_radius_size_151).

0.80::true_val(sidecut_radius_size_151, v7_6); 0.20::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).

measured(s3, sidecut_radius_size_151, v7_6).

all_consistent(sidecut_radius_size_151) :-
    (indep(s3), consistent(s3, sidecut_radius_size_151) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v7_6)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

% @attr sidecut_radius_size_153
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_8=7.8 unk_sidecut_radius_size_153=Unknown
% @importance 1.0

0.82::acc(s3, sidecut_radius_size_153).

0.80::true_val(sidecut_radius_size_153, v7_8); 0.20::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(s3, sidecut_radius_size_153, v7_8).

all_consistent(sidecut_radius_size_153) :-
    (indep(s3), consistent(s3, sidecut_radius_size_153) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v7_8)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v8_0=8.0 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.82::acc(s3, sidecut_radius_size).

0.80::true_val(sidecut_radius_size, v8_0); 0.20::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s3, sidecut_radius_size, v8_0).

all_consistent(sidecut_radius_size) :-
    (indep(s3), consistent(s3, sidecut_radius_size) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_0)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_155w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_0=8.0 unk_sidecut_radius_size_155w=Unknown
% @importance 1.0

0.82::acc(s3, sidecut_radius_size_155w).

0.80::true_val(sidecut_radius_size_155w, v8_0); 0.20::true_val(sidecut_radius_size_155w, unk_sidecut_radius_size_155w).

measured(s3, sidecut_radius_size_155w, v8_0).

all_consistent(sidecut_radius_size_155w) :-
    (indep(s3), consistent(s3, sidecut_radius_size_155w) ; \+indep(s3)).

evidence(all_consistent(sidecut_radius_size_155w)).
query(true_val(sidecut_radius_size_155w, v8_0)).
query(true_val(sidecut_radius_size_155w, unk_sidecut_radius_size_155w)).

% @attr stance_width_range_size_151
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v54_0=54.0 unk_stance_width_range_size_151=Unknown
% @importance 1.0

0.82::acc(s3, stance_width_range_size_151).

0.80::true_val(stance_width_range_size_151, v54_0); 0.20::true_val(stance_width_range_size_151, unk_stance_width_range_size_151).

measured(s3, stance_width_range_size_151, v54_0).

all_consistent(stance_width_range_size_151) :-
    (indep(s3), consistent(s3, stance_width_range_size_151) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_151)).
query(true_val(stance_width_range_size_151, v54_0)).
query(true_val(stance_width_range_size_151, unk_stance_width_range_size_151)).

% @attr stance_width_range_size_153
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v55_0=55.0 unk_stance_width_range_size_153=Unknown
% @importance 1.0

0.82::acc(s3, stance_width_range_size_153).

0.80::true_val(stance_width_range_size_153, v55_0); 0.20::true_val(stance_width_range_size_153, unk_stance_width_range_size_153).

measured(s3, stance_width_range_size_153, v55_0).

all_consistent(stance_width_range_size_153) :-
    (indep(s3), consistent(s3, stance_width_range_size_153) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_153)).
query(true_val(stance_width_range_size_153, v55_0)).
query(true_val(stance_width_range_size_153, unk_stance_width_range_size_153)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 1.0

0.82::acc(s3, stance_width_range_size).

0.80::true_val(stance_width_range_size, v56_0); 0.20::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s3, stance_width_range_size, v56_0).

all_consistent(stance_width_range_size) :-
    (indep(s3), consistent(s3, stance_width_range_size) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_155w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_stance_width_range_size_155w=Unknown
% @importance 1.0

0.82::acc(s3, stance_width_range_size_155w).

0.80::true_val(stance_width_range_size_155w, v56_0); 0.20::true_val(stance_width_range_size_155w, unk_stance_width_range_size_155w).

measured(s3, stance_width_range_size_155w, v56_0).

all_consistent(stance_width_range_size_155w) :-
    (indep(s3), consistent(s3, stance_width_range_size_155w) ; \+indep(s3)).

evidence(all_consistent(stance_width_range_size_155w)).
query(true_val(stance_width_range_size_155w, v56_0)).
query(true_val(stance_width_range_size_155w, unk_stance_width_range_size_155w)).

% @attr recommended_weight_range_size_151
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r50_70=50-70kg unk_recommended_weight_range_size_151=Unknown
% @importance 1.0

0.82::acc(s3, recommended_weight_range_size_151).

0.80::true_val(recommended_weight_range_size_151, r50_70); 0.20::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).

measured(s3, recommended_weight_range_size_151, r50_70).

all_consistent(recommended_weight_range_size_151) :-
    (indep(s3), consistent(s3, recommended_weight_range_size_151) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, r50_70)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

% @attr recommended_weight_range_size_153
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r55_75=55-75kg unk_recommended_weight_range_size_153=Unknown
% @importance 1.0

0.82::acc(s3, recommended_weight_range_size_153).

0.80::true_val(recommended_weight_range_size_153, r55_75); 0.20::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).

measured(s3, recommended_weight_range_size_153, r55_75).

all_consistent(recommended_weight_range_size_153) :-
    (indep(s3), consistent(s3, recommended_weight_range_size_153) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, r55_75)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values r55_85=55-85kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.82::acc(s3, recommended_weight_range_size).

0.80::true_val(recommended_weight_range_size, r55_85); 0.20::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s3, recommended_weight_range_size, r55_85).

all_consistent(recommended_weight_range_size) :-
    (indep(s3), consistent(s3, recommended_weight_range_size) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r55_85)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_155w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r65_95=65-95kg unk_recommended_weight_range_size_155w=Unknown
% @importance 1.0

0.82::acc(s3, recommended_weight_range_size_155w).

0.80::true_val(recommended_weight_range_size_155w, r65_95); 0.20::true_val(recommended_weight_range_size_155w, unk_recommended_weight_range_size_155w).

measured(s3, recommended_weight_range_size_155w, r65_95).

all_consistent(recommended_weight_range_size_155w) :-
    (indep(s3), consistent(s3, recommended_weight_range_size_155w) ; \+indep(s3)).

evidence(all_consistent(recommended_weight_range_size_155w)).
query(true_val(recommended_weight_range_size_155w, r65_95)).
query(true_val(recommended_weight_range_size_155w, unk_recommended_weight_range_size_155w)).

% @attr waist_width_148
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 148cm
% @values v24_2=24.2 unk_waist_width_148=Unknown
% @importance 0.9

0.70::acc(s17, waist_width_148).

0.67::true_val(waist_width_148, v24_2); 0.33::true_val(waist_width_148, unk_waist_width_148).

measured(s17, waist_width_148, v24_2).

all_consistent(waist_width_148) :-
    (indep(s17), consistent(s17, waist_width_148) ; \+indep(s17)).

evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v24_2)).
query(true_val(waist_width_148, unk_waist_width_148)).

% @attr tip_tail_width_size_148
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v28_7=28.7 unk_tip_tail_width_size_148=Unknown
% @importance 0.9

0.70::acc(s17, tip_tail_width_size_148).

0.67::true_val(tip_tail_width_size_148, v28_7); 0.33::true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148).

measured(s17, tip_tail_width_size_148, v28_7).

all_consistent(tip_tail_width_size_148) :-
    (indep(s17), consistent(s17, tip_tail_width_size_148) ; \+indep(s17)).

evidence(all_consistent(tip_tail_width_size_148)).
query(true_val(tip_tail_width_size_148, v28_7)).
query(true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148)).

% @attr tip_tail_width_size_155_2025
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v29_9=29.9 unk_tip_tail_width_size_155_2025=Unknown
% @importance 0.9

0.70::acc(s17, tip_tail_width_size_155_2025).

0.67::true_val(tip_tail_width_size_155_2025, v29_9); 0.33::true_val(tip_tail_width_size_155_2025, unk_tip_tail_width_size_155_2025).

measured(s17, tip_tail_width_size_155_2025, v29_9).

all_consistent(tip_tail_width_size_155_2025) :-
    (indep(s17), consistent(s17, tip_tail_width_size_155_2025) ; \+indep(s17)).

evidence(all_consistent(tip_tail_width_size_155_2025)).
query(true_val(tip_tail_width_size_155_2025, v29_9)).
query(true_val(tip_tail_width_size_155_2025, unk_tip_tail_width_size_155_2025)).

% @attr tip_tail_width_size_158w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v30_7=30.7 unk_tip_tail_width_size_158w=Unknown
% @importance 0.9

0.70::acc(s17, tip_tail_width_size_158w).

0.67::true_val(tip_tail_width_size_158w, v30_7); 0.33::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).

measured(s17, tip_tail_width_size_158w, v30_7).

all_consistent(tip_tail_width_size_158w) :-
    (indep(s17), consistent(s17, tip_tail_width_size_158w) ; \+indep(s17)).

evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v30_7)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

% @attr sidecut_radius_size_148
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_4=7.4 unk_sidecut_radius_size_148=Unknown
% @importance 0.9

0.70::acc(s17, sidecut_radius_size_148).

0.67::true_val(sidecut_radius_size_148, v7_4); 0.33::true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148).

measured(s17, sidecut_radius_size_148, v7_4).

all_consistent(sidecut_radius_size_148) :-
    (indep(s17), consistent(s17, sidecut_radius_size_148) ; \+indep(s17)).

evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v7_4)).
query(true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148)).

% @attr sidecut_radius_size_155_2025
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_2=8.2 unk_sidecut_radius_size_155_2025=Unknown
% @importance 0.9

0.70::acc(s17, sidecut_radius_size_155_2025).

0.67::true_val(sidecut_radius_size_155_2025, v8_2); 0.33::true_val(sidecut_radius_size_155_2025, unk_sidecut_radius_size_155_2025).

measured(s17, sidecut_radius_size_155_2025, v8_2).

all_consistent(sidecut_radius_size_155_2025) :-
    (indep(s17), consistent(s17, sidecut_radius_size_155_2025) ; \+indep(s17)).

evidence(all_consistent(sidecut_radius_size_155_2025)).
query(true_val(sidecut_radius_size_155_2025, v8_2)).
query(true_val(sidecut_radius_size_155_2025, unk_sidecut_radius_size_155_2025)).

% @attr sidecut_radius_size_158w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v8_2=8.2 unk_sidecut_radius_size_158w=Unknown
% @importance 0.9

0.70::acc(s17, sidecut_radius_size_158w).

0.67::true_val(sidecut_radius_size_158w, v8_2); 0.33::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).

measured(s17, sidecut_radius_size_158w, v8_2).

all_consistent(sidecut_radius_size_158w) :-
    (indep(s17), consistent(s17, sidecut_radius_size_158w) ; \+indep(s17)).

evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, v8_2)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

% @attr recommended_weight_range_size_148
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r45_65=45-65kg unk_recommended_weight_range_size_148=Unknown
% @importance 0.9

0.70::acc(s17, recommended_weight_range_size_148).

0.67::true_val(recommended_weight_range_size_148, r45_65); 0.33::true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148).

measured(s17, recommended_weight_range_size_148, r45_65).

all_consistent(recommended_weight_range_size_148) :-
    (indep(s17), consistent(s17, recommended_weight_range_size_148) ; \+indep(s17)).

evidence(all_consistent(recommended_weight_range_size_148)).
query(true_val(recommended_weight_range_size_148, r45_65)).
query(true_val(recommended_weight_range_size_148, unk_recommended_weight_range_size_148)).

% @attr recommended_weight_range_size_155_2025
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r65_90=65-90kg unk_recommended_weight_range_size_155_2025=Unknown
% @importance 0.9

0.70::acc(s17, recommended_weight_range_size_155_2025).

0.67::true_val(recommended_weight_range_size_155_2025, r65_90); 0.33::true_val(recommended_weight_range_size_155_2025, unk_recommended_weight_range_size_155_2025).

measured(s17, recommended_weight_range_size_155_2025, r65_90).

all_consistent(recommended_weight_range_size_155_2025) :-
    (indep(s17), consistent(s17, recommended_weight_range_size_155_2025) ; \+indep(s17)).

evidence(all_consistent(recommended_weight_range_size_155_2025)).
query(true_val(recommended_weight_range_size_155_2025, r65_90)).
query(true_val(recommended_weight_range_size_155_2025, unk_recommended_weight_range_size_155_2025)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values r70_105=70-105kg unk_recommended_weight_range_size_158w=Unknown
% @importance 0.9

0.70::acc(s17, recommended_weight_range_size_158w).

0.67::true_val(recommended_weight_range_size_158w, r70_105); 0.33::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s17, recommended_weight_range_size_158w, r70_105).

all_consistent(recommended_weight_range_size_158w) :-
    (indep(s17), consistent(s17, recommended_weight_range_size_158w) ; \+indep(s17)).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, r70_105)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

% @attr recommended_binding_sizes_148_153
% @type categorical
% @canonical false
% @original_name Recommended binding sizes 148-153
% @values size_s_m=S_M unk_recommended_binding_sizes_148_153=Unknown
% @importance 0.9

0.70::acc(s17, recommended_binding_sizes_148_153).

0.67::true_val(recommended_binding_sizes_148_153, size_s_m); 0.33::true_val(recommended_binding_sizes_148_153, unk_recommended_binding_sizes_148_153).

measured(s17, recommended_binding_sizes_148_153, size_s_m).

all_consistent(recommended_binding_sizes_148_153) :-
    (indep(s17), consistent(s17, recommended_binding_sizes_148_153) ; \+indep(s17)).

evidence(all_consistent(recommended_binding_sizes_148_153)).
query(true_val(recommended_binding_sizes_148_153, size_s_m)).
query(true_val(recommended_binding_sizes_148_153, unk_recommended_binding_sizes_148_153)).

% @attr recommended_binding_sizes_155_158w
% @type categorical
% @canonical false
% @original_name Recommended binding sizes 155-158W
% @values size_m_l=M_L unk_recommended_binding_sizes_155_158w=Unknown
% @importance 0.9

0.70::acc(s17, recommended_binding_sizes_155_158w).

0.67::true_val(recommended_binding_sizes_155_158w, size_m_l); 0.33::true_val(recommended_binding_sizes_155_158w, unk_recommended_binding_sizes_155_158w).

measured(s17, recommended_binding_sizes_155_158w, size_m_l).

all_consistent(recommended_binding_sizes_155_158w) :-
    (indep(s17), consistent(s17, recommended_binding_sizes_155_158w) ; \+indep(s17)).

evidence(all_consistent(recommended_binding_sizes_155_158w)).
query(true_val(recommended_binding_sizes_155_158w, size_m_l)).
query(true_val(recommended_binding_sizes_155_158w, unk_recommended_binding_sizes_155_158w)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_strong=Aspen_Strong_CNC_high_density unk_core_material=Unknown
% @importance 0.95

0.93::acc(s1, core_material).
0.93::acc(s2, core_material).

0.97::true_val(core_material, aspen_strong); 0.03::true_val(core_material, unk_core_material).

measured(s1, core_material, aspen_strong).
measured(s2, core_material, aspen_strong).

all_consistent(core_material) :-
    consistent(s1, core_material),
    consistent(s2, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_strong)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_aspen=FSC_certified_high_density_Aspen unk_sustainability_certification=Unknown
% @importance 0.65

0.58::acc(s30, sustainability_certification).
0.55::acc(s32, sustainability_certification).

0.85::true_val(sustainability_certification, fsc_certified_aspen); 0.15::true_val(sustainability_certification, unk_sustainability_certification).

measured(s30, sustainability_certification, fsc_certified_aspen).
measured(s32, sustainability_certification, fsc_certified_aspen).

all_consistent(sustainability_certification) :-
    (indep(s30), consistent(s30, sustainability_certification) ; \+indep(s30)),
    (indep(s32), consistent(s32, sustainability_certification) ; \+indep(s32)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_aspen)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr core_technology
% @type categorical
% @canonical false
% @original_name Core technology
% @values popster=Popster_milled_core_natural_flex_pop unk_core_technology=Unknown
% @importance 0.95

0.93::acc(s1, core_technology).
0.93::acc(s2, core_technology).

0.97::true_val(core_technology, popster); 0.03::true_val(core_technology, unk_core_technology).

measured(s1, core_technology, popster).
measured(s2, core_technology, popster).

all_consistent(core_technology) :-
    consistent(s1, core_technology),
    consistent(s2, core_technology).

evidence(all_consistent(core_technology)).
query(true_val(core_technology, popster)).
query(true_val(core_technology, unk_core_technology)).

% @attr popster_description
% @type categorical
% @canonical false
% @original_name Popster description
% @values thins_underfoot_thickens_outside=Shaped_core_thins_underfoot_thickens_outside unk_popster_description=Unknown
% @importance 0.8

0.58::acc(s30, popster_description).

0.58::true_val(popster_description, thins_underfoot_thickens_outside); 0.42::true_val(popster_description, unk_popster_description).

measured(s30, popster_description, thins_underfoot_thickens_outside).

all_consistent(popster_description) :-
    (indep(s30), consistent(s30, popster_description) ; \+indep(s30)).

evidence(all_consistent(popster_description)).
query(true_val(popster_description, thins_underfoot_thickens_outside)).
query(true_val(popster_description, unk_popster_description)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values ba_md_fiberglass=BA_MD_Biaxial_Medium_Density_Fiberglass unk_laminate=Unknown
% @importance 0.7

0.55::acc(s33, laminate).
0.93::acc(s34, laminate).

0.95::true_val(laminate, ba_md_fiberglass); 0.05::true_val(laminate, unk_laminate).

measured(s33, laminate, ba_md_fiberglass).
measured(s34, laminate, ba_md_fiberglass).

all_consistent(laminate) :-
    (indep(s33), consistent(s33, laminate) ; \+indep(s33)),
    consistent(s34, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, ba_md_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values bio_based_30=Bio_Based_Resin_30pct_plant_derived unk_resin=Unknown
% @importance 0.5

0.78::acc(s35, resin).

0.76::true_val(resin, bio_based_30); 0.24::true_val(resin, unk_resin).

measured(s35, resin, bio_based_30).

all_consistent(resin) :-
    (indep(s35), consistent(s35, resin) ; \+indep(s35)).

evidence(all_consistent(resin)).
query(true_val(resin, bio_based_30)).
query(true_val(resin, unk_resin)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_sidewalls=ABS_Sidewalls_tough_dampening unk_sidewall_material=Unknown
% @importance 0.7

0.55::acc(s33, sidewall_material).

0.54::true_val(sidewall_material, abs_sidewalls); 0.46::true_val(sidewall_material, unk_sidewall_material).

measured(s33, sidewall_material, abs_sidewalls).

all_consistent(sidewall_material) :-
    (indep(s33), consistent(s33, sidewall_material) ; \+indep(s33)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_sidewalls)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_technology
% @type categorical
% @canonical false
% @original_name Sidewall technology
% @values royal_rubber_pads=Royal_Rubber_Pads_dampening unk_sidewall_technology=Unknown
% @importance 0.85

0.93::acc(s1, sidewall_technology).
0.93::acc(s34, sidewall_technology).

0.97::true_val(sidewall_technology, royal_rubber_pads); 0.03::true_val(sidewall_technology, unk_sidewall_technology).

measured(s1, sidewall_technology, royal_rubber_pads).
measured(s34, sidewall_technology, royal_rubber_pads).

all_consistent(sidewall_technology) :-
    consistent(s1, sidewall_technology),
    consistent(s34, sidewall_technology).

evidence(all_consistent(sidewall_technology)).
query(true_val(sidewall_technology, royal_rubber_pads)).
query(true_val(sidewall_technology, unk_sidewall_technology)).

% @attr sidewall_dampening_description
% @type categorical
% @canonical false
% @original_name Sidewall dampening description
% @values suspension_dampening_edge_protection=Suspension_dampening_edge_protection unk_sidewall_dampening_description=Unknown
% @importance 0.7

0.58::acc(s36, sidewall_dampening_description).

0.58::true_val(sidewall_dampening_description, suspension_dampening_edge_protection); 0.42::true_val(sidewall_dampening_description, unk_sidewall_dampening_description).

measured(s36, sidewall_dampening_description, suspension_dampening_edge_protection).

all_consistent(sidewall_dampening_description) :-
    (indep(s36), consistent(s36, sidewall_dampening_description) ; \+indep(s36)).

evidence(all_consistent(sidewall_dampening_description)).
query(true_val(sidewall_dampening_description, suspension_dampening_edge_protection)).
query(true_val(sidewall_dampening_description, unk_sidewall_dampening_description)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values extruded_eg=Extruded_EG_harder_electra_glide unk_base_material=Unknown
% @importance 0.88

0.93::acc(s1, base_material).
0.60::acc(s37, base_material).

0.95::true_val(base_material, extruded_eg); 0.05::true_val(base_material, unk_base_material).

measured(s1, base_material, extruded_eg).
measured(s37, base_material, extruded_eg).

all_consistent(base_material) :-
    consistent(s1, base_material),
    (indep(s37), consistent(s37, base_material) ; \+indep(s37)).

evidence(all_consistent(base_material)).
query(true_val(base_material, extruded_eg)).
query(true_val(base_material, unk_base_material)).

% @attr base_finish
% @type categorical
% @canonical false
% @original_name Base finish
% @values medium_stone_finish=Medium_Stone_Finish_all_conditions unk_base_finish=Unknown
% @importance 0.88

0.93::acc(s1, base_finish).
0.60::acc(s37, base_finish).

0.95::true_val(base_finish, medium_stone_finish); 0.05::true_val(base_finish, unk_base_finish).

measured(s1, base_finish, medium_stone_finish).
measured(s37, base_finish, medium_stone_finish).

all_consistent(base_finish) :-
    consistent(s1, base_finish),
    (indep(s37), consistent(s37, base_finish) ; \+indep(s37)).

evidence(all_consistent(base_finish)).
query(true_val(base_finish, medium_stone_finish)).
query(true_val(base_finish, unk_base_finish)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values natural_wax_paraffin_free=Natural_Wax_paraffin_free unk_factory_wax=Unknown
% @importance 0.45

0.93::acc(s38, factory_wax).

0.90::true_val(factory_wax, natural_wax_paraffin_free); 0.10::true_val(factory_wax, unk_factory_wax).

measured(s38, factory_wax, natural_wax_paraffin_free).

all_consistent(factory_wax) :-
    consistent(s38, factory_wax).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, natural_wax_paraffin_free)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values freestyle_edge_bevel=Freestyle_Edge_Bevel_detuned_2deg_3deg unk_edge_technology=Unknown
% @importance 0.73

0.60::acc(s37, edge_technology).
0.93::acc(s39, edge_technology).

0.95::true_val(edge_technology, freestyle_edge_bevel); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s37, edge_technology, freestyle_edge_bevel).
measured(s39, edge_technology, freestyle_edge_bevel).

all_consistent(edge_technology) :-
    (indep(s37), consistent(s37, edge_technology) ; \+indep(s37)),
    consistent(s39, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, freestyle_edge_bevel)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_bevel_spec_analysis
% @type categorical
% @canonical false
% @original_name edge_bevel_spec
% @values both_true_diff_measurements=Both_1_5deg_base_and_2deg_3deg_sidecut_may_coexist unk_edge_bevel_spec_analysis=Unknown
% @importance 0.85

0.82::acc(s3, edge_bevel_spec_analysis).
0.60::acc(s37, edge_bevel_spec_analysis).
0.93::acc(s39, edge_bevel_spec_analysis).

0.90::true_val(edge_bevel_spec_analysis, both_true_diff_measurements); 0.10::true_val(edge_bevel_spec_analysis, unk_edge_bevel_spec_analysis).

measured(s3, edge_bevel_spec_analysis, both_true_diff_measurements).
measured(s37, edge_bevel_spec_analysis, both_true_diff_measurements).
measured(s39, edge_bevel_spec_analysis, both_true_diff_measurements).

all_consistent(edge_bevel_spec_analysis) :-
    (indep(s3), consistent(s3, edge_bevel_spec_analysis) ; \+indep(s3)),
    (indep(s37), consistent(s37, edge_bevel_spec_analysis) ; \+indep(s37)),
    consistent(s39, edge_bevel_spec_analysis).

evidence(all_consistent(edge_bevel_spec_analysis)).
query(true_val(edge_bevel_spec_analysis, both_true_diff_measurements)).
query(true_val(edge_bevel_spec_analysis, unk_edge_bevel_spec_analysis)).

% @attr factory_ready
% @type categorical
% @canonical false
% @original_name Board comes waxed and ready to ride from the factory
% @values waxed_ready=Waxed_and_ready_to_ride unk_factory_ready=Unknown
% @importance 0.4

0.60::acc(s40, factory_ready).

0.62::true_val(factory_ready, waxed_ready); 0.38::true_val(factory_ready, unk_factory_ready).

measured(s40, factory_ready, waxed_ready).

all_consistent(factory_ready) :-
    (indep(s40), consistent(s40, factory_ready) ; \+indep(s40)).

evidence(all_consistent(factory_ready)).
query(true_val(factory_ready, waxed_ready)).
query(true_val(factory_ready, unk_factory_ready)).

% @attr presses_rails
% @type categorical
% @canonical false
% @original_name Presses/rails
% @values effortless_lock=Effortless_locking_soft_flex_flat unk_presses_rails=Unknown
% @importance 0.95

0.78::acc(s16, presses_rails).

0.76::true_val(presses_rails, effortless_lock); 0.24::true_val(presses_rails, unk_presses_rails).

measured(s16, presses_rails, effortless_lock).

all_consistent(presses_rails) :-
    (indep(s16), consistent(s16, presses_rails) ; \+indep(s16)).

evidence(all_consistent(presses_rails)).
query(true_val(presses_rails, effortless_lock)).
query(true_val(presses_rails, unk_presses_rails)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values generous_popster=Generous_pop_via_Popster unk_pop=Unknown
% @importance 0.95

0.93::acc(s1, pop).
0.93::acc(s2, pop).

0.97::true_val(pop, generous_popster); 0.03::true_val(pop, unk_pop).

measured(s1, pop, generous_popster).
measured(s2, pop, generous_popster).

all_consistent(pop) :-
    consistent(s1, pop),
    consistent(s2, pop).

evidence(all_consistent(pop)).
query(true_val(pop, generous_popster)).
query(true_val(pop, unk_pop)).

% @attr buttering
% @type categorical
% @canonical false
% @original_name Buttering
% @values insanely_playful_flexible=Insanely_playful_and_flexible unk_buttering=Unknown
% @importance 0.75

0.32::acc(s42, buttering).

0.32::true_val(buttering, insanely_playful_flexible); 0.68::true_val(buttering, unk_buttering).

measured(s42, buttering, insanely_playful_flexible).

all_consistent(buttering) :-
    consistent(s42, buttering).

evidence(all_consistent(buttering)).
query(true_val(buttering, insanely_playful_flexible)).
query(true_val(buttering, unk_buttering)).

% @attr stability
% @type categorical
% @canonical false
% @original_name Stability
% @values flat_section_stability=Flat_section_provides_stability_for_jumps_rails unk_stability=Unknown
% @importance 0.7

0.58::acc(s36, stability).

0.58::true_val(stability, flat_section_stability); 0.42::true_val(stability, unk_stability).

measured(s36, stability, flat_section_stability).

all_consistent(stability) :-
    (indep(s36), consistent(s36, stability) ; \+indep(s36)).

evidence(all_consistent(stability)).
query(true_val(stability, flat_section_stability)).
query(true_val(stability, unk_stability)).

% @attr dampening
% @type categorical
% @canonical false
% @original_name Dampening
% @values royal_rubber_chatter=Royal_Rubber_Pads_soak_chatter_durability unk_dampening=Unknown
% @importance 0.95

0.78::acc(s16, dampening).

0.76::true_val(dampening, royal_rubber_chatter); 0.24::true_val(dampening, unk_dampening).

measured(s16, dampening, royal_rubber_chatter).

all_consistent(dampening) :-
    (indep(s16), consistent(s16, dampening) ; \+indep(s16)).

evidence(all_consistent(dampening)).
query(true_val(dampening, royal_rubber_chatter)).
query(true_val(dampening, unk_dampening)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values enabled_true_twin=Enabled_by_true_twin unk_switch_riding=Unknown
% @importance 0.7

0.60::acc(s43, switch_riding).

0.58::true_val(switch_riding, enabled_true_twin); 0.42::true_val(switch_riding, unk_switch_riding).

measured(s43, switch_riding, enabled_true_twin).

all_consistent(switch_riding) :-
    (indep(s43), consistent(s43, switch_riding) ; \+indep(s43)).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, enabled_true_twin)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values blend_hold_forgiveness=Blend_edge_hold_and_forgiveness unk_edge_hold=Unknown
% @importance 0.75

0.60::acc(s37, edge_hold).

0.58::true_val(edge_hold, blend_hold_forgiveness); 0.42::true_val(edge_hold, unk_edge_hold).

measured(s37, edge_hold, blend_hold_forgiveness).

all_consistent(edge_hold) :-
    (indep(s37), consistent(s37, edge_hold) ; \+indep(s37)).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, blend_hold_forgiveness)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr forgiveness
% @type categorical
% @canonical false
% @original_name Forgiveness
% @values soft_forgiving_playful=Soft_flex_forgiving_playful unk_forgiveness=Unknown
% @importance 0.7

0.58::acc(s44, forgiveness).

0.55::true_val(forgiveness, soft_forgiving_playful); 0.45::true_val(forgiveness, unk_forgiveness).

measured(s44, forgiveness, soft_forgiving_playful).

all_consistent(forgiveness) :-
    (indep(s44), consistent(s44, forgiveness) ; \+indep(s44)).

evidence(all_consistent(forgiveness)).
query(true_val(forgiveness, soft_forgiving_playful)).
query(true_val(forgiveness, unk_forgiveness)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values easier_maintain_slower=Extruded_easier_maintain_slower_than_sintered unk_base_glide_performance=Unknown
% @importance 0.73

0.60::acc(s37, base_glide_performance).
0.68::acc(s45, base_glide_performance).

0.88::true_val(base_glide_performance, easier_maintain_slower); 0.12::true_val(base_glide_performance, unk_base_glide_performance).

measured(s37, base_glide_performance, easier_maintain_slower).
measured(s45, base_glide_performance, easier_maintain_slower).

all_consistent(base_glide_performance) :-
    (indep(s37), consistent(s37, base_glide_performance) ; \+indep(s37)),
    consistent(s45, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, easier_maintain_slower)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr terrain_suitability_detailed
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values park_rails_sidehits_chill=Park_laps_rails_side_hits_chill_sessions unk_terrain_suitability_detailed=Unknown
% @importance 0.8

0.51::acc(s26, terrain_suitability_detailed).

0.51::true_val(terrain_suitability_detailed, park_rails_sidehits_chill); 0.49::true_val(terrain_suitability_detailed, unk_terrain_suitability_detailed).

measured(s26, terrain_suitability_detailed, park_rails_sidehits_chill).

all_consistent(terrain_suitability_detailed) :-
    consistent(s26, terrain_suitability_detailed).

evidence(all_consistent(terrain_suitability_detailed)).
query(true_val(terrain_suitability_detailed, park_rails_sidehits_chill)).
query(true_val(terrain_suitability_detailed, unk_terrain_suitability_detailed)).

% @attr not_ideal_for
% @type categorical
% @canonical false
% @original_name Not ideal for
% @values high_speed_choppy=High_speed_all_mountain_choppy_terrain unk_not_ideal_for=Unknown
% @importance 0.8

0.32::acc(s46, not_ideal_for).

0.28::true_val(not_ideal_for, high_speed_choppy); 0.72::true_val(not_ideal_for, unk_not_ideal_for).

measured(s46, not_ideal_for, high_speed_choppy).

all_consistent(not_ideal_for) :-
    consistent(s46, not_ideal_for).

evidence(all_consistent(not_ideal_for)).
query(true_val(not_ideal_for, high_speed_choppy)).
query(true_val(not_ideal_for, unk_not_ideal_for)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values sleepwalker_med_soft_449=Sleepwalker_medium_soft_449_95_Rock_Out_Camber unk_comparable_board_same_brand=Unknown
% @importance 0.78

0.75::acc(s47, comparable_board_same_brand).
0.75::acc(s48, comparable_board_same_brand).

0.90::true_val(comparable_board_same_brand, sleepwalker_med_soft_449); 0.10::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s47, comparable_board_same_brand, sleepwalker_med_soft_449).
measured(s48, comparable_board_same_brand, sleepwalker_med_soft_449).

all_consistent(comparable_board_same_brand) :-
    consistent(s47, comparable_board_same_brand),
    consistent(s48, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, sleepwalker_med_soft_449)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr sleepwalker_base_comparison
% @type categorical
% @canonical false
% @original_name Sleepwalker has sintered base vs Kickback extruded
% @values sintered_vs_extruded=Sleepwalker_sintered_faster_vs_Kickback_extruded unk_sleepwalker_base_comparison=Unknown
% @importance 0.7

0.68::acc(s45, sleepwalker_base_comparison).

0.60::true_val(sleepwalker_base_comparison, sintered_vs_extruded); 0.40::true_val(sleepwalker_base_comparison, unk_sleepwalker_base_comparison).

measured(s45, sleepwalker_base_comparison, sintered_vs_extruded).

all_consistent(sleepwalker_base_comparison) :-
    consistent(s45, sleepwalker_base_comparison).

evidence(all_consistent(sleepwalker_base_comparison)).
query(true_val(sleepwalker_base_comparison, sintered_vs_extruded)).
query(true_val(sleepwalker_base_comparison, unk_sleepwalker_base_comparison)).

% @attr sleepwalker_rider_level
% @type categorical
% @canonical false
% @original_name Sleepwalker rider level and design
% @values tommy_gesme_progressed=Tommy_Gesme_pro_model_progressed_park_rider unk_sleepwalker_rider_level=Unknown
% @importance 0.75

0.52::acc(s49, sleepwalker_rider_level).

0.51::true_val(sleepwalker_rider_level, tommy_gesme_progressed); 0.49::true_val(sleepwalker_rider_level, unk_sleepwalker_rider_level).

measured(s49, sleepwalker_rider_level, tommy_gesme_progressed).

all_consistent(sleepwalker_rider_level) :-
    consistent(s49, sleepwalker_rider_level).

evidence(all_consistent(sleepwalker_rider_level)).
query(true_val(sleepwalker_rider_level, tommy_gesme_progressed)).
query(true_val(sleepwalker_rider_level, unk_sleepwalker_rider_level)).

% @attr comparable_board_same_brand_sight
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values sight_am_freestyle_449=Salomon_Sight_all_mountain_freestyle_449_95 unk_comparable_board_same_brand_sight=Unknown
% @importance 0.6

0.75::acc(s50, comparable_board_same_brand_sight).

0.68::true_val(comparable_board_same_brand_sight, sight_am_freestyle_449); 0.32::true_val(comparable_board_same_brand_sight, unk_comparable_board_same_brand_sight).

measured(s50, comparable_board_same_brand_sight, sight_am_freestyle_449).

all_consistent(comparable_board_same_brand_sight) :-
    consistent(s50, comparable_board_same_brand_sight).

evidence(all_consistent(comparable_board_same_brand_sight)).
query(true_val(comparable_board_same_brand_sight, sight_am_freestyle_449)).
query(true_val(comparable_board_same_brand_sight, unk_comparable_board_same_brand_sight)).

% @attr comparable_board_same_brand_huck_knife
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values huck_knife_579_carbon_sintered=Huck_Knife_579_95_carbon_stringers_sintered unk_comparable_board_same_brand_huck_knife=Unknown
% @importance 0.7

0.75::acc(s51, comparable_board_same_brand_huck_knife).
0.44::acc(s52, comparable_board_same_brand_huck_knife).

0.80::true_val(comparable_board_same_brand_huck_knife, huck_knife_579_carbon_sintered); 0.20::true_val(comparable_board_same_brand_huck_knife, unk_comparable_board_same_brand_huck_knife).

measured(s51, comparable_board_same_brand_huck_knife, huck_knife_579_carbon_sintered).
measured(s52, comparable_board_same_brand_huck_knife, huck_knife_579_carbon_sintered).

all_consistent(comparable_board_same_brand_huck_knife) :-
    consistent(s51, comparable_board_same_brand_huck_knife),
    consistent(s52, comparable_board_same_brand_huck_knife).

evidence(all_consistent(comparable_board_same_brand_huck_knife)).
query(true_val(comparable_board_same_brand_huck_knife, huck_knife_579_carbon_sintered)).
query(true_val(comparable_board_same_brand_huck_knife, unk_comparable_board_same_brand_huck_knife)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values burton_process_flying_v=Burton_Process_Flying_V_best_beginner unk_comparable_board_cross_brand=Unknown
% @importance 0.7

0.65::acc(s53, comparable_board_cross_brand).

0.49::true_val(comparable_board_cross_brand, burton_process_flying_v); 0.51::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s53, comparable_board_cross_brand, burton_process_flying_v).

all_consistent(comparable_board_cross_brand) :-
    consistent(s53, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, burton_process_flying_v)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_jib
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values bataleon_disaster_plus=Bataleon_Disaster_Plus_best_jib unk_comparable_board_cross_brand_jib=Unknown
% @importance 0.7

0.65::acc(s53, comparable_board_cross_brand_jib).

0.49::true_val(comparable_board_cross_brand_jib, bataleon_disaster_plus); 0.51::true_val(comparable_board_cross_brand_jib, unk_comparable_board_cross_brand_jib).

measured(s53, comparable_board_cross_brand_jib, bataleon_disaster_plus).

all_consistent(comparable_board_cross_brand_jib) :-
    consistent(s53, comparable_board_cross_brand_jib).

evidence(all_consistent(comparable_board_cross_brand_jib)).
query(true_val(comparable_board_cross_brand_jib, bataleon_disaster_plus)).
query(true_val(comparable_board_cross_brand_jib, unk_comparable_board_cross_brand_jib)).

% @attr comparable_board_cross_brand_am
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values k2_antidote=K2_Antidote_best_all_mountain_freestyle unk_comparable_board_cross_brand_am=Unknown
% @importance 0.7

0.65::acc(s53, comparable_board_cross_brand_am).

0.49::true_val(comparable_board_cross_brand_am, k2_antidote); 0.51::true_val(comparable_board_cross_brand_am, unk_comparable_board_cross_brand_am).

measured(s53, comparable_board_cross_brand_am, k2_antidote).

all_consistent(comparable_board_cross_brand_am) :-
    consistent(s53, comparable_board_cross_brand_am).

evidence(all_consistent(comparable_board_cross_brand_am)).
query(true_val(comparable_board_cross_brand_am, k2_antidote)).
query(true_val(comparable_board_cross_brand_am, unk_comparable_board_cross_brand_am)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values craft_alternative_nicer=Salomon_Craft_suggested_nicer_approachable unk_user_review_forum=Unknown
% @importance 0.75

0.26::acc(s54, user_review_forum).

0.26::true_val(user_review_forum, craft_alternative_nicer); 0.74::true_val(user_review_forum, unk_user_review_forum).

measured(s54, user_review_forum, craft_alternative_nicer).

all_consistent(user_review_forum) :-
    consistent(s54, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, craft_alternative_nicer)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_too_soft
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values too_soft_for_am=Too_soft_for_all_mountain_park_only unk_user_review_forum_too_soft=Unknown
% @importance 0.78

0.26::acc(s54, user_review_forum_too_soft).
0.28::acc(s46, user_review_forum_too_soft).

0.55::true_val(user_review_forum_too_soft, too_soft_for_am); 0.45::true_val(user_review_forum_too_soft, unk_user_review_forum_too_soft).

measured(s54, user_review_forum_too_soft, too_soft_for_am).
measured(s46, user_review_forum_too_soft, too_soft_for_am).

all_consistent(user_review_forum_too_soft) :-
    consistent(s54, user_review_forum_too_soft),
    consistent(s46, user_review_forum_too_soft).

evidence(all_consistent(user_review_forum_too_soft)).
query(true_val(user_review_forum_too_soft, too_soft_for_am)).
query(true_val(user_review_forum_too_soft, unk_user_review_forum_too_soft)).

% @attr salomon_headquarters
% @type categorical
% @canonical false
% @original_name Salomon headquarters
% @values annecy_france=Annecy_France unk_salomon_headquarters=Unknown
% @importance 0.3

0.48::acc(s55, salomon_headquarters).

0.48::true_val(salomon_headquarters, annecy_france); 0.52::true_val(salomon_headquarters, unk_salomon_headquarters).

measured(s55, salomon_headquarters, annecy_france).

all_consistent(salomon_headquarters) :-
    consistent(s55, salomon_headquarters).

evidence(all_consistent(salomon_headquarters)).
query(true_val(salomon_headquarters, annecy_france)).
query(true_val(salomon_headquarters, unk_salomon_headquarters)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports=Amer_Sports_previously_Adidas unk_parent_company=Unknown
% @importance 0.3

0.55::acc(s5, parent_company).

0.58::true_val(parent_company, amer_sports); 0.42::true_val(parent_company, unk_parent_company).

measured(s5, parent_company, amer_sports).

all_consistent(parent_company) :-
    consistent(s5, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports)).
query(true_val(parent_company, unk_parent_company)).

% @attr sustainability_bio_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values bio_resin_30_plant=Bio_Based_Resin_30pct_plant_derived unk_sustainability_bio_resin=Unknown
% @importance 0.5

0.78::acc(s35, sustainability_bio_resin).

0.76::true_val(sustainability_bio_resin, bio_resin_30_plant); 0.24::true_val(sustainability_bio_resin, unk_sustainability_bio_resin).

measured(s35, sustainability_bio_resin, bio_resin_30_plant).

all_consistent(sustainability_bio_resin) :-
    (indep(s35), consistent(s35, sustainability_bio_resin) ; \+indep(s35)).

evidence(all_consistent(sustainability_bio_resin)).
query(true_val(sustainability_bio_resin, bio_resin_30_plant)).
query(true_val(sustainability_bio_resin, unk_sustainability_bio_resin)).

% @attr sustainability_natural_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values paraffin_free_natural=Paraffin_free_natural_wax unk_sustainability_natural_wax=Unknown
% @importance 0.45

0.93::acc(s38, sustainability_natural_wax).

0.90::true_val(sustainability_natural_wax, paraffin_free_natural); 0.10::true_val(sustainability_natural_wax, unk_sustainability_natural_wax).

measured(s38, sustainability_natural_wax, paraffin_free_natural).

all_consistent(sustainability_natural_wax) :-
    consistent(s38, sustainability_natural_wax).

evidence(all_consistent(sustainability_natural_wax)).
query(true_val(sustainability_natural_wax, paraffin_free_natural)).
query(true_val(sustainability_natural_wax, unk_sustainability_natural_wax)).

% @attr sustainability_comparison_highpath
% @type categorical
% @canonical false
% @original_name Salomon most sustainable board comparison
% @values kickback_some_not_all=Kickback_uses_some_not_all_Highpath_tech unk_sustainability_comparison_highpath=Unknown
% @importance 0.4

0.48::acc(s56, sustainability_comparison_highpath).

0.48::true_val(sustainability_comparison_highpath, kickback_some_not_all); 0.52::true_val(sustainability_comparison_highpath, unk_sustainability_comparison_highpath).

measured(s56, sustainability_comparison_highpath, kickback_some_not_all).

all_consistent(sustainability_comparison_highpath) :-
    consistent(s56, sustainability_comparison_highpath).

evidence(all_consistent(sustainability_comparison_highpath)).
query(true_val(sustainability_comparison_highpath, kickback_some_not_all)).
query(true_val(sustainability_comparison_highpath, unk_sustainability_comparison_highpath)).

% @attr brand_perception
% @type categorical
% @canonical false
% @original_name Brand perception
% @values complete_lineup_consistent=Complete_lineup_consistent_not_hype unk_brand_perception=Unknown
% @importance 0.6

0.41::acc(s6, brand_perception).

0.41::true_val(brand_perception, complete_lineup_consistent); 0.59::true_val(brand_perception, unk_brand_perception).

measured(s6, brand_perception, complete_lineup_consistent).

all_consistent(brand_perception) :-
    consistent(s6, brand_perception).

evidence(all_consistent(brand_perception)).
query(true_val(brand_perception, complete_lineup_consistent)).
query(true_val(brand_perception, unk_brand_perception)).

% @attr customer_rating_the_house
% @type numeric
% @unit /5
% @canonical false
% @original_name The House customer rating (Kickback)
% @values v4_2=4.2 unk_customer_rating_the_house=Unknown
% @importance 0.9

0.70::acc(s17, customer_rating_the_house).

0.67::true_val(customer_rating_the_house, v4_2); 0.33::true_val(customer_rating_the_house, unk_customer_rating_the_house).

measured(s17, customer_rating_the_house, v4_2).

all_consistent(customer_rating_the_house) :-
    consistent(s17, customer_rating_the_house).

evidence(all_consistent(customer_rating_the_house)).
query(true_val(customer_rating_the_house, v4_2)).
query(true_val(customer_rating_the_house, unk_customer_rating_the_house)).

% @attr youtube_review_impression
% @type categorical
% @canonical false
% @original_name YouTube review impression
% @values insanely_playful_flexible=Insanely_playful_flexible_buttering unk_youtube_review_impression=Unknown
% @importance 0.75

0.32::acc(s42, youtube_review_impression).

0.32::true_val(youtube_review_impression, insanely_playful_flexible); 0.68::true_val(youtube_review_impression, unk_youtube_review_impression).

measured(s42, youtube_review_impression, insanely_playful_flexible).

all_consistent(youtube_review_impression) :-
    consistent(s42, youtube_review_impression).

evidence(all_consistent(youtube_review_impression)).
query(true_val(youtube_review_impression, insanely_playful_flexible)).
query(true_val(youtube_review_impression, unk_youtube_review_impression)).

% @attr skipro_description
% @type categorical
% @canonical false
% @original_name Ski Pro AZ description
% @values laid_back_jib_friendly=More_laid_back_jib_friendly_than_Sleepwalker unk_skipro_description=Unknown
% @importance 0.8

0.51::acc(s26, skipro_description).

0.51::true_val(skipro_description, laid_back_jib_friendly); 0.49::true_val(skipro_description, unk_skipro_description).

measured(s26, skipro_description, laid_back_jib_friendly).

all_consistent(skipro_description) :-
    consistent(s26, skipro_description).

evidence(all_consistent(skipro_description)).
query(true_val(skipro_description, laid_back_jib_friendly)).
query(true_val(skipro_description, unk_skipro_description)).

% @attr skipro_bottom_line
% @type categorical
% @canonical false
% @original_name Ski Pro AZ bottom line
% @values smooth_poppy_confidence=Smooth_poppy_confidence_boosting_park_board unk_skipro_bottom_line=Unknown
% @importance 0.8

0.51::acc(s26, skipro_bottom_line).

0.51::true_val(skipro_bottom_line, smooth_poppy_confidence); 0.49::true_val(skipro_bottom_line, unk_skipro_bottom_line).

measured(s26, skipro_bottom_line, smooth_poppy_confidence).

all_consistent(skipro_bottom_line) :-
    consistent(s26, skipro_bottom_line).

evidence(all_consistent(skipro_bottom_line)).
query(true_val(skipro_bottom_line, smooth_poppy_confidence)).
query(true_val(skipro_bottom_line, unk_skipro_bottom_line)).

% @attr evo_description
% @type categorical
% @canonical false
% @original_name evo description
% @values backstage_pass_park=Backstage_pass_park_progression_playful unk_evo_description=Unknown
% @importance 0.95

0.78::acc(s16, evo_description).

0.76::true_val(evo_description, backstage_pass_park); 0.24::true_val(evo_description, unk_evo_description).

measured(s16, evo_description, backstage_pass_park).

all_consistent(evo_description) :-
    (indep(s16), consistent(s16, evo_description) ; \+indep(s16)).

evidence(all_consistent(evo_description)).
query(true_val(evo_description, backstage_pass_park)).
query(true_val(evo_description, unk_evo_description)).

% @attr rudeboys_description
% @type categorical
% @canonical false
% @original_name Rudeboys description
% @values ideal_beginner_park=Ideal_beginner_park_progressing_freestyle unk_rudeboys_description=Unknown
% @importance 0.7

0.51::acc(s41, rudeboys_description).

0.51::true_val(rudeboys_description, ideal_beginner_park); 0.49::true_val(rudeboys_description, unk_rudeboys_description).

measured(s41, rudeboys_description, ideal_beginner_park).

all_consistent(rudeboys_description) :-
    (indep(s41), consistent(s41, rudeboys_description) ; \+indep(s41)).

evidence(all_consistent(rudeboys_description)).
query(true_val(rudeboys_description, ideal_beginner_park)).
query(true_val(rudeboys_description, unk_rudeboys_description)).

% @attr melbourne_snowboard_description
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard description
% @values versatile_approachable_forgiving=Versatile_approachable_forgiving_pop unk_melbourne_snowboard_description=Unknown
% @importance 0.8

0.54::acc(s31, melbourne_snowboard_description).

0.54::true_val(melbourne_snowboard_description, versatile_approachable_forgiving); 0.46::true_val(melbourne_snowboard_description, unk_melbourne_snowboard_description).

measured(s31, melbourne_snowboard_description, versatile_approachable_forgiving).

all_consistent(melbourne_snowboard_description) :-
    (indep(s31), consistent(s31, melbourne_snowboard_description) ; \+indep(s31)).

evidence(all_consistent(melbourne_snowboard_description)).
query(true_val(melbourne_snowboard_description, versatile_approachable_forgiving)).
query(true_val(melbourne_snowboard_description, unk_melbourne_snowboard_description)).

% @attr user_review_forum_step_up
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values step_up_to_craft=Forum_advises_experienced_step_up_to_Craft unk_user_review_forum_step_up=Unknown
% @importance 0.75

0.26::acc(s54, user_review_forum_step_up).

0.26::true_val(user_review_forum_step_up, step_up_to_craft); 0.74::true_val(user_review_forum_step_up, unk_user_review_forum_step_up).

measured(s54, user_review_forum_step_up, step_up_to_craft).

all_consistent(user_review_forum_step_up) :-
    consistent(s54, user_review_forum_step_up).

evidence(all_consistent(user_review_forum_step_up)).
query(true_val(user_review_forum_step_up, step_up_to_craft)).
query(true_val(user_review_forum_step_up, unk_user_review_forum_step_up)).

% @attr user_review_forum_speed_limit
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values soft_extruded_limit_speed=Soft_flex_extruded_base_limit_speed unk_user_review_forum_speed_limit=Unknown
% @importance 0.8

0.28::acc(s46, user_review_forum_speed_limit).

0.28::true_val(user_review_forum_speed_limit, soft_extruded_limit_speed); 0.72::true_val(user_review_forum_speed_limit, unk_user_review_forum_speed_limit).

measured(s46, user_review_forum_speed_limit, soft_extruded_limit_speed).

all_consistent(user_review_forum_speed_limit) :-
    consistent(s46, user_review_forum_speed_limit).

evidence(all_consistent(user_review_forum_speed_limit)).
query(true_val(user_review_forum_speed_limit, soft_extruded_limit_speed)).
query(true_val(user_review_forum_speed_limit, unk_user_review_forum_speed_limit)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values budget_friendly_entry=Budget_friendly_Salomon_freestyle_entry unk_positive_aspect=Unknown
% @importance 0.8

0.58::acc(s23, positive_aspect).

0.58::true_val(positive_aspect, budget_friendly_entry); 0.42::true_val(positive_aspect, unk_positive_aspect).

measured(s23, positive_aspect, budget_friendly_entry).

all_consistent(positive_aspect) :-
    (indep(s23), consistent(s23, positive_aspect) ; \+indep(s23)).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, budget_friendly_entry)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_base_durability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values extruded_durable_easy_repair=Extruded_base_durable_easy_repair_for_rails unk_positive_aspect_base_durability=Unknown
% @importance 0.7

0.68::acc(s45, positive_aspect_base_durability).

0.60::true_val(positive_aspect_base_durability, extruded_durable_easy_repair); 0.40::true_val(positive_aspect_base_durability, unk_positive_aspect_base_durability).

measured(s45, positive_aspect_base_durability, extruded_durable_easy_repair).

all_consistent(positive_aspect_base_durability) :-
    consistent(s45, positive_aspect_base_durability).

evidence(all_consistent(positive_aspect_base_durability)).
query(true_val(positive_aspect_base_durability, extruded_durable_easy_repair)).
query(true_val(positive_aspect_base_durability, unk_positive_aspect_base_durability)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values extruded_slower_sintered=Extruded_base_slower_than_sintered unk_negative_aspect=Unknown
% @importance 0.7

0.68::acc(s45, negative_aspect).

0.60::true_val(negative_aspect, extruded_slower_sintered); 0.40::true_val(negative_aspect, unk_negative_aspect).

measured(s45, negative_aspect, extruded_slower_sintered).

all_consistent(negative_aspect) :-
    consistent(s45, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, extruded_slower_sintered)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_outgrown
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values soft_flex_outgrown_quickly=Very_soft_flex_may_be_outgrown_quickly unk_negative_aspect_outgrown=Unknown
% @importance 0.75

0.26::acc(s54, negative_aspect_outgrown).

0.26::true_val(negative_aspect_outgrown, soft_flex_outgrown_quickly); 0.74::true_val(negative_aspect_outgrown, unk_negative_aspect_outgrown).

measured(s54, negative_aspect_outgrown, soft_flex_outgrown_quickly).

all_consistent(negative_aspect_outgrown) :-
    consistent(s54, negative_aspect_outgrown).

evidence(all_consistent(negative_aspect_outgrown)).
query(true_val(negative_aspect_outgrown, soft_flex_outgrown_quickly)).
query(true_val(negative_aspect_outgrown, unk_negative_aspect_outgrown)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name evo.com
% @values major_specialty_1yr_return=Major_specialty_1yr_return_5pct_beat unk_retailer_evo=Unknown
% @importance 0.5

0.78::acc(s57, retailer_evo).

0.64::true_val(retailer_evo, major_specialty_1yr_return); 0.36::true_val(retailer_evo, unk_retailer_evo).

measured(s57, retailer_evo, major_specialty_1yr_return).

all_consistent(retailer_evo) :-
    consistent(s57, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_specialty_1yr_return)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_the_house
% @type categorical
% @canonical false
% @original_name The House
% @values established_90day_return=Established_snow_retailer_90day_return_4_2_rating unk_retailer_the_house=Unknown
% @importance 0.9

0.70::acc(s17, retailer_the_house).

0.67::true_val(retailer_the_house, established_90day_return); 0.33::true_val(retailer_the_house, unk_retailer_the_house).

measured(s17, retailer_the_house, established_90day_return).

all_consistent(retailer_the_house) :-
    consistent(s17, retailer_the_house).

evidence(all_consistent(retailer_the_house)).
query(true_val(retailer_the_house, established_90day_return)).
query(true_val(retailer_the_house, unk_retailer_the_house)).

% @attr retailer_salomon_com
% @type categorical
% @canonical false
% @original_name Salomon.com
% @values official_mfr_splus=Official_manufacturer_Splus_membership unk_retailer_salomon_com=Unknown
% @importance 0.3

0.93::acc(s12, retailer_salomon_com).

0.90::true_val(retailer_salomon_com, official_mfr_splus); 0.10::true_val(retailer_salomon_com, unk_retailer_salomon_com).

measured(s12, retailer_salomon_com, official_mfr_splus).

all_consistent(retailer_salomon_com) :-
    consistent(s12, retailer_salomon_com).

evidence(all_consistent(retailer_salomon_com)).
query(true_val(retailer_salomon_com, official_mfr_splus)).
query(true_val(retailer_salomon_com, unk_retailer_salomon_com)).

% @attr retailer_rhythm_snowsports
% @type categorical
% @canonical false
% @original_name Rhythm Snowsports
% @values au_snow_specialty=Australian_snow_sports_specialty unk_retailer_rhythm_snowsports=Unknown
% @importance 0.7

0.55::acc(s24, retailer_rhythm_snowsports).

0.55::true_val(retailer_rhythm_snowsports, au_snow_specialty); 0.45::true_val(retailer_rhythm_snowsports, unk_retailer_rhythm_snowsports).

measured(s24, retailer_rhythm_snowsports, au_snow_specialty).

all_consistent(retailer_rhythm_snowsports) :-
    consistent(s24, retailer_rhythm_snowsports).

evidence(all_consistent(retailer_rhythm_snowsports)).
query(true_val(retailer_rhythm_snowsports, au_snow_specialty)).
query(true_val(retailer_rhythm_snowsports, unk_retailer_rhythm_snowsports)).

% @attr retailer_blauer_board_shop
% @type categorical
% @canonical false
% @original_name Blauer Board Shop
% @values specialty_board_2027=Specialty_board_shop_2027_model unk_retailer_blauer_board_shop=Unknown
% @importance 0.6

0.48::acc(s25, retailer_blauer_board_shop).

0.48::true_val(retailer_blauer_board_shop, specialty_board_2027); 0.52::true_val(retailer_blauer_board_shop, unk_retailer_blauer_board_shop).

measured(s25, retailer_blauer_board_shop, specialty_board_2027).

all_consistent(retailer_blauer_board_shop) :-
    (indep(s25), consistent(s25, retailer_blauer_board_shop) ; \+indep(s25)).

evidence(all_consistent(retailer_blauer_board_shop)).
query(true_val(retailer_blauer_board_shop, specialty_board_2027)).
query(true_val(retailer_blauer_board_shop, unk_retailer_blauer_board_shop)).

% @attr retailer_rudeboys
% @type categorical
% @canonical false
% @original_name Rudeboys
% @values specialty_snowboard=Specialty_snowboard_retailer unk_retailer_rudeboys=Unknown
% @importance 0.7

0.51::acc(s41, retailer_rudeboys).

0.51::true_val(retailer_rudeboys, specialty_snowboard); 0.49::true_val(retailer_rudeboys, unk_retailer_rudeboys).

measured(s41, retailer_rudeboys, specialty_snowboard).

all_consistent(retailer_rudeboys) :-
    (indep(s41), consistent(s41, retailer_rudeboys) ; \+indep(s41)).

evidence(all_consistent(retailer_rudeboys)).
query(true_val(retailer_rudeboys, specialty_snowboard)).
query(true_val(retailer_rudeboys, unk_retailer_rudeboys)).

% @attr retailer_getboards
% @type categorical
% @canonical false
% @original_name Getboards.com
% @values online_30day_price_match=Online_board_retailer_30day_price_match unk_retailer_getboards=Unknown
% @importance 0.85

0.55::acc(s19, retailer_getboards).

0.54::true_val(retailer_getboards, online_30day_price_match); 0.46::true_val(retailer_getboards, unk_retailer_getboards).

measured(s19, retailer_getboards, online_30day_price_match).

all_consistent(retailer_getboards) :-
    consistent(s19, retailer_getboards).

evidence(all_consistent(retailer_getboards)).
query(true_val(retailer_getboards, online_30day_price_match)).
query(true_val(retailer_getboards, unk_retailer_getboards)).

% @attr retailer_willis
% @type categorical
% @canonical false
% @original_name Willi's Ski & Board
% @values expert_fitted_1970_30day=Expert_fitted_since_1970_30day_returns unk_retailer_willis=Unknown
% @importance 0.85

0.65::acc(s20, retailer_willis).

0.63::true_val(retailer_willis, expert_fitted_1970_30day); 0.37::true_val(retailer_willis, unk_retailer_willis).

measured(s20, retailer_willis, expert_fitted_1970_30day).

all_consistent(retailer_willis) :-
    consistent(s20, retailer_willis).

evidence(all_consistent(retailer_willis)).
query(true_val(retailer_willis, expert_fitted_1970_30day)).
query(true_val(retailer_willis, unk_retailer_willis)).