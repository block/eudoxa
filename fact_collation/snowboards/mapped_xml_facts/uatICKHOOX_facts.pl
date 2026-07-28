0.70::indep(s1).
0.15::indep(s3).
0.15::indep(s5).
0.60::indep(s8).
0.15::indep(s10).
0.12::indep(s11).
0.12::indep(s14).
0.12::indep(s15).
0.15::indep(s20).
0.15::indep(s21).
0.12::indep(s22).
0.15::indep(s23).
0.12::indep(s25).
0.15::indep(s26).
0.12::indep(s28).
0.15::indep(s29).
0.12::indep(s30).
0.12::indep(s31).
0.50::indep(s32).
0.12::indep(s33).
0.15::indep(s39).
0.12::indep(s40).
0.30::indep(s48).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.975

0.93::acc(s1, brand).
0.95::acc(s2, brand).

0.97::true_val(brand, salomon); 0.03::true_val(brand, unk_brand).

measured(s1, brand, salomon).
measured(s2, brand, salomon).

all_consistent(brand) :-
    consistent(s2, brand),
    (indep(s1), consistent(s1, brand) ; \+indep(s1)).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values sleepwalker=Sleepwalker unk_model_name=Unknown
% @importance 0.975

0.93::acc(s1, model_name).
0.95::acc(s2, model_name).

0.97::true_val(model_name, sleepwalker); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, sleepwalker).
measured(s2, model_name, sleepwalker).

all_consistent(model_name) :-
    consistent(s2, model_name),
    (indep(s1), consistent(s1, model_name) ; \+indep(s1)).

evidence(all_consistent(model_name)).
query(true_val(model_name, sleepwalker)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 0.975

0.93::acc(s1, model_year).
0.95::acc(s2, model_year).

0.97::true_val(model_year, y2026); 0.03::true_val(model_year, unk_model_year).

measured(s1, model_year, y2026).
measured(s2, model_year, y2026).

all_consistent(model_year) :-
    consistent(s2, model_year),
    (indep(s1), consistent(s1, model_year) ; \+indep(s1)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.95

0.93::acc(s1, product_type).

0.93::true_val(product_type, snowboard); 0.07::true_val(product_type, unk_product_type).

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
% @values freestyle=Freestyle unk_board_category=Unknown
% @importance 0.975

0.93::acc(s1, board_category).
0.95::acc(s2, board_category).

0.97::true_val(board_category, freestyle); 0.03::true_val(board_category, unk_board_category).

measured(s1, board_category, freestyle).
measured(s2, board_category, freestyle).

all_consistent(board_category) :-
    consistent(s2, board_category),
    (indep(s1), consistent(s1, board_category) ; \+indep(s1)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.4

0.70::acc(s3, gender).

0.68::true_val(gender, mens); 0.32::true_val(gender, unk_gender).

measured(s3, gender, mens).

all_consistent(gender) :-
    (indep(s3), consistent(s3, gender) ; \+indep(s3)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values tommy_gesme=Tommy_Gesme unk_pro_rider_name=Unknown
% @importance 0.975

0.93::acc(s1, pro_rider_name).
0.95::acc(s2, pro_rider_name).

0.97::true_val(pro_rider_name, tommy_gesme); 0.03::true_val(pro_rider_name, unk_pro_rider_name).

measured(s1, pro_rider_name, tommy_gesme).
measured(s2, pro_rider_name, tommy_gesme).

all_consistent(pro_rider_name) :-
    consistent(s2, pro_rider_name),
    (indep(s1), consistent(s1, pro_rider_name) ; \+indep(s1)).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, tommy_gesme)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr manufacturer_founding
% @type categorical
% @canonical false
% @original_name Manufacturer founding
% @values founded_1947_annecy=Founded_1947_Annecy_France unk_manufacturer_founding=Unknown
% @importance 0.35

0.70::acc(s4, manufacturer_founding).
0.65::acc(s5, manufacturer_founding).

0.95::true_val(manufacturer_founding, founded_1947_annecy); 0.05::true_val(manufacturer_founding, unk_manufacturer_founding).

measured(s4, manufacturer_founding, founded_1947_annecy).
measured(s5, manufacturer_founding, founded_1947_annecy).

all_consistent(manufacturer_founding) :-
    consistent(s4, manufacturer_founding),
    consistent(s5, manufacturer_founding).

evidence(all_consistent(manufacturer_founding)).
query(true_val(manufacturer_founding, founded_1947_annecy)).
query(true_val(manufacturer_founding, unk_manufacturer_founding)).

% @attr manufacturer_description
% @type categorical
% @canonical false
% @original_name Manufacturer description
% @values leading_outdoor_brand=Leading_outdoor_adventure_sports_brand unk_manufacturer_description=Unknown
% @importance 0.35

0.70::acc(s4, manufacturer_description).

0.68::true_val(manufacturer_description, leading_outdoor_brand); 0.32::true_val(manufacturer_description, unk_manufacturer_description).

measured(s4, manufacturer_description, leading_outdoor_brand).

all_consistent(manufacturer_description) :-
    consistent(s4, manufacturer_description).

evidence(all_consistent(manufacturer_description)).
query(true_val(manufacturer_description, leading_outdoor_brand)).
query(true_val(manufacturer_description, unk_manufacturer_description)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports=Amer_Sports_Corporation unk_parent_company=Unknown
% @importance 0.375

0.65::acc(s5, parent_company).
0.85::acc(s6, parent_company).

0.95::true_val(parent_company, amer_sports); 0.05::true_val(parent_company, unk_parent_company).

measured(s5, parent_company, amer_sports).
measured(s6, parent_company, amer_sports).

all_consistent(parent_company) :-
    consistent(s5, parent_company),
    consistent(s6, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports)).
query(true_val(parent_company, unk_parent_company)).

% @attr parent_company_hq
% @type categorical
% @canonical false
% @original_name Parent company HQ
% @values helsinki_finland=Helsinki_Finland unk_parent_company_hq=Unknown
% @importance 0.4

0.85::acc(s6, parent_company_hq).

0.81::true_val(parent_company_hq, helsinki_finland); 0.19::true_val(parent_company_hq, unk_parent_company_hq).

measured(s6, parent_company_hq, helsinki_finland).

all_consistent(parent_company_hq) :-
    consistent(s6, parent_company_hq).

evidence(all_consistent(parent_company_hq)).
query(true_val(parent_company_hq, helsinki_finland)).
query(true_val(parent_company_hq, unk_parent_company_hq)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values multi_country=Austria_Bulgaria_France_Finland_Canada_US unk_manufacturing_location_current=Unknown
% @importance 0.4

0.85::acc(s6, manufacturing_location_current).

0.81::true_val(manufacturing_location_current, multi_country); 0.19::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s6, manufacturing_location_current, multi_country).

all_consistent(manufacturing_location_current) :-
    consistent(s6, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, multi_country)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2017_18=2017_18_season unk_model_first_available_year=Unknown
% @importance 0.6

0.80::acc(s7, model_first_available_year).

0.76::true_val(model_first_available_year, season_2017_18); 0.24::true_val(model_first_available_year, unk_model_first_available_year).

measured(s7, model_first_available_year, season_2017_18).

all_consistent(model_first_available_year) :-
    consistent(s7, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2017_18)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values graphics_only_2026=Only_graphics_updated_for_2026 unk_redesign_year=Unknown
% @importance 0.85

0.80::acc(s8, redesign_year).

0.76::true_val(redesign_year, graphics_only_2026); 0.24::true_val(redesign_year, unk_redesign_year).

measured(s8, redesign_year, graphics_only_2026).

all_consistent(redesign_year) :-
    (indep(s8), consistent(s8, redesign_year) ; \+indep(s8)).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, graphics_only_2026)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered unk_base_type=Unknown
% @importance 0.78

0.80::acc(s10, base_type).
0.75::acc(s11, base_type).

0.95::true_val(base_type, sintered); 0.05::true_val(base_type, unk_base_type).

measured(s10, base_type, sintered).
measured(s11, base_type, sintered).

all_consistent(base_type) :-
    (indep(s10), consistent(s10, base_type) ; \+indep(s10)),
    (indep(s11), consistent(s11, base_type) ; \+indep(s11)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, unk_base_type)).

% @attr base_type_2025
% @type categorical
% @canonical false
% @original_name base_type (2025 model)
% @values extruded_eg=Extruded_EG unk_base_type_2025=Unknown
% @importance 0.75

0.78::acc(s9, base_type_2025).

0.71::true_val(base_type_2025, extruded_eg); 0.29::true_val(base_type_2025, unk_base_type_2025).

measured(s9, base_type_2025, extruded_eg).

all_consistent(base_type_2025) :-
    consistent(s9, base_type_2025).

evidence(all_consistent(base_type_2025)).
query(true_val(base_type_2025, extruded_eg)).
query(true_val(base_type_2025, unk_base_type_2025)).

% @attr sku_merchant
% @type categorical
% @canonical false
% @original_name SKU (merchant provided)
% @values l47924600_155w=L47924600_155W unk_sku_merchant=Unknown
% @importance 0.85

0.95::acc(s_merchant, sku_merchant).

0.93::true_val(sku_merchant, l47924600_155w); 0.07::true_val(sku_merchant, unk_sku_merchant).

measured(s_merchant, sku_merchant, l47924600_155w).

all_consistent(sku_merchant) :-
    consistent(s_merchant, sku_merchant).

evidence(all_consistent(sku_merchant)).
query(true_val(sku_merchant, l47924600_155w)).
query(true_val(sku_merchant, unk_sku_merchant)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v449_95=449.95 unk_price_usd_msrp=Unknown
% @importance 0.91

0.88::acc(s12, price_usd_msrp).
0.90::acc(s13, price_usd_msrp).
0.82::acc(s14, price_usd_msrp).
0.82::acc(s15, price_usd_msrp).

0.97::true_val(price_usd_msrp, v449_95); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s12, price_usd_msrp, v449_95).
measured(s13, price_usd_msrp, v449_95).
measured(s14, price_usd_msrp, v449_95).
measured(s15, price_usd_msrp, v449_95).

all_consistent(price_usd_msrp) :-
    consistent(s12, price_usd_msrp),
    consistent(s13, price_usd_msrp),
    (indep(s14), consistent(s14, price_usd_msrp) ; \+indep(s14)),
    (indep(s15), consistent(s15, price_usd_msrp) ; \+indep(s15)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v449_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v559_99=559.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(s_merchant, price_aud_merchant).

0.93::true_val(price_aud_merchant, v559_99); 0.07::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v559_99).

all_consistent(price_aud_merchant) :-
    consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v559_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_aud_merchant_rrp
% @type numeric
% @canonical false
% @original_name price_aud_merchant (RRP)
% @unit AUD
% @values v699_99=699.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.85

0.95::acc(s_merchant, price_aud_merchant_rrp).

0.93::true_val(price_aud_merchant_rrp, v699_99); 0.07::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s_merchant, price_aud_merchant_rrp, v699_99).

all_consistent(price_aud_merchant_rrp) :-
    consistent(s_merchant, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v699_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

% @attr merchant_discount
% @type numeric
% @canonical false
% @original_name Merchant discount
% @unit percent
% @values v20=20.0 unk_merchant_discount=Unknown
% @importance 0.85

0.95::acc(s_merchant, merchant_discount).

0.93::true_val(merchant_discount, v20); 0.07::true_val(merchant_discount, unk_merchant_discount).

measured(s_merchant, merchant_discount, v20).

all_consistent(merchant_discount) :-
    consistent(s_merchant, merchant_discount).

evidence(all_consistent(merchant_discount)).
query(true_val(merchant_discount, v20)).
query(true_val(merchant_discount, unk_merchant_discount)).

% @attr price_usd_msrp_2025
% @type numeric
% @canonical false
% @original_name price_usd_msrp (2025 model)
% @unit USD
% @values v419_95=419.95 unk_price_usd_msrp_2025=Unknown
% @importance 0.8

0.88::acc(s16, price_usd_msrp_2025).

0.81::true_val(price_usd_msrp_2025, v419_95); 0.19::true_val(price_usd_msrp_2025, unk_price_usd_msrp_2025).

measured(s16, price_usd_msrp_2025, v419_95).

all_consistent(price_usd_msrp_2025) :-
    consistent(s16, price_usd_msrp_2025).

evidence(all_consistent(price_usd_msrp_2025)).
query(true_val(price_usd_msrp_2025, v419_95)).
query(true_val(price_usd_msrp_2025, unk_price_usd_msrp_2025)).

% @attr price_eur_blue_tomato
% @type categorical
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values eur_449_95_disc_299=EUR449.95_discounted_to_EUR299 unk_price_eur_blue_tomato=Unknown
% @importance 0.7

0.65::acc(s17, price_eur_blue_tomato).

0.55::true_val(price_eur_blue_tomato, eur_449_95_disc_299); 0.45::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s17, price_eur_blue_tomato, eur_449_95_disc_299).

all_consistent(price_eur_blue_tomato) :-
    consistent(s17, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, eur_449_95_disc_299)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_chf_exodus
% @type numeric
% @canonical false
% @original_name CHF price
% @unit CHF
% @values v366=366.0 unk_price_chf_exodus=Unknown
% @importance 0.7

0.65::acc(s18, price_chf_exodus).

0.55::true_val(price_chf_exodus, v366); 0.45::true_val(price_chf_exodus, unk_price_chf_exodus).

measured(s18, price_chf_exodus, v366).

all_consistent(price_chf_exodus) :-
    consistent(s18, price_chf_exodus).

evidence(all_consistent(price_chf_exodus)).
query(true_val(price_chf_exodus, v366)).
query(true_val(price_chf_exodus, unk_price_chf_exodus)).

% @attr price_usd_evo
% @type categorical
% @canonical true
% @original_name price_usd_evo
% @values v449_95_in_stock_free_ship=449.95_in_stock_free_shipping unk_price_usd_evo=Unknown
% @importance 0.9

0.88::acc(s12, price_usd_evo).

0.85::true_val(price_usd_evo, v449_95_in_stock_free_ship); 0.15::true_val(price_usd_evo, unk_price_usd_evo).

measured(s12, price_usd_evo, v449_95_in_stock_free_ship).

all_consistent(price_usd_evo) :-
    consistent(s12, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v449_95_in_stock_free_ship)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_backcountry
% @type categorical
% @canonical true
% @original_name price_usd_backcountry
% @values listed=Listed unk_price_usd_backcountry=Unknown
% @importance 0.6

0.75::acc(s19, price_usd_backcountry).

0.56::true_val(price_usd_backcountry, listed); 0.44::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s19, price_usd_backcountry, listed).

all_consistent(price_usd_backcountry) :-
    consistent(s19, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, listed)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values available_449_95_selling_fast=Available_at_449.95_many_sizes_sold_out unk_availability_status=Unknown
% @importance 0.77

0.85::acc(s20, availability_status).
0.82::acc(s15, availability_status).
0.80::acc(s21, availability_status).
0.78::acc(s14, availability_status).
0.78::acc(s22, availability_status).
0.78::acc(s23, availability_status).
0.75::acc(s24, availability_status).
0.75::acc(s25, availability_status).
0.72::acc(s26, availability_status).
0.72::acc(s27, availability_status).
0.70::acc(s28, availability_status).
0.70::acc(s29, availability_status).
0.70::acc(s30, availability_status).
0.65::acc(s31, availability_status).
0.70::acc(s32, availability_status).
0.70::acc(s33, availability_status).

0.97::true_val(availability_status, available_449_95_selling_fast); 0.03::true_val(availability_status, unk_availability_status).

measured(s20, availability_status, available_449_95_selling_fast).
measured(s15, availability_status, available_449_95_selling_fast).
measured(s21, availability_status, available_449_95_selling_fast).
measured(s14, availability_status, available_449_95_selling_fast).
measured(s22, availability_status, available_449_95_selling_fast).
measured(s23, availability_status, available_449_95_selling_fast).
measured(s24, availability_status, available_449_95_selling_fast).
measured(s25, availability_status, available_449_95_selling_fast).
measured(s26, availability_status, available_449_95_selling_fast).
measured(s27, availability_status, available_449_95_selling_fast).
measured(s28, availability_status, available_449_95_selling_fast).
measured(s29, availability_status, available_449_95_selling_fast).
measured(s30, availability_status, available_449_95_selling_fast).
measured(s31, availability_status, available_449_95_selling_fast).
measured(s32, availability_status, available_449_95_selling_fast).
measured(s33, availability_status, available_449_95_selling_fast).

all_consistent(availability_status) :-
    (indep(s20), consistent(s20, availability_status) ; \+indep(s20)),
    (indep(s15), consistent(s15, availability_status) ; \+indep(s15)),
    (indep(s21), consistent(s21, availability_status) ; \+indep(s21)),
    (indep(s14), consistent(s14, availability_status) ; \+indep(s14)),
    (indep(s22), consistent(s22, availability_status) ; \+indep(s22)),
    (indep(s23), consistent(s23, availability_status) ; \+indep(s23)),
    consistent(s24, availability_status),
    (indep(s25), consistent(s25, availability_status) ; \+indep(s25)),
    (indep(s26), consistent(s26, availability_status) ; \+indep(s26)),
    (indep(s28), consistent(s28, availability_status) ; \+indep(s28)),
    (indep(s29), consistent(s29, availability_status) ; \+indep(s29)),
    (indep(s30), consistent(s30, availability_status) ; \+indep(s30)),
    (indep(s31), consistent(s31, availability_status) ; \+indep(s31)),
    (indep(s32), consistent(s32, availability_status) ; \+indep(s32)),
    (indep(s33), consistent(s33, availability_status) ; \+indep(s33)),
    (indep(s27), consistent(s27, availability_status) ; \+indep(s27)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, available_449_95_selling_fast)).
query(true_val(availability_status, unk_availability_status)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v2=2.0 unk_warranty_period_years=Unknown
% @importance 0.8

0.78::acc(s8, warranty_period_years).
0.78::acc(s34, warranty_period_years).

0.95::true_val(warranty_period_years, v2); 0.05::true_val(warranty_period_years, unk_warranty_period_years).

measured(s8, warranty_period_years, v2).
measured(s34, warranty_period_years, v2).

all_consistent(warranty_period_years) :-
    (indep(s8), consistent(s8, warranty_period_years) ; \+indep(s8)),
    (indep(s8), consistent(s34, warranty_period_years) ; \+indep(s8)).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values up_to_1_year=Up_to_full_year_return unk_return_policy_terms=Unknown
% @importance 0.9

0.88::acc(s12, return_policy_terms).

0.85::true_val(return_policy_terms, up_to_1_year); 0.15::true_val(return_policy_terms, unk_return_policy_terms).

measured(s12, return_policy_terms, up_to_1_year).

all_consistent(return_policy_terms) :-
    consistent(s12, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, up_to_1_year)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr return_policy_terms_typical
% @type categorical
% @canonical false
% @original_name return_policy_terms (typical retailers)
% @values days_14_to_30=14_to_30_days_typical unk_return_policy_terms_typical=Unknown
% @importance 0.85

0.75::acc(s21, return_policy_terms_typical).

0.59::true_val(return_policy_terms_typical, days_14_to_30); 0.41::true_val(return_policy_terms_typical, unk_return_policy_terms_typical).

measured(s21, return_policy_terms_typical, days_14_to_30).

all_consistent(return_policy_terms_typical) :-
    (indep(s21), consistent(s21, return_policy_terms_typical) ; \+indep(s21)).

evidence(all_consistent(return_policy_terms_typical)).
query(true_val(return_policy_terms_typical, days_14_to_30)).
query(true_val(return_policy_terms_typical, unk_return_policy_terms_typical)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin unk_shape=Unknown
% @importance 0.975

0.93::acc(s1, shape).
0.95::acc(s2, shape).

0.97::true_val(shape, true_twin); 0.03::true_val(shape, unk_shape).

measured(s1, shape, true_twin).
measured(s2, shape, true_twin).

all_consistent(shape) :-
    consistent(s2, shape),
    (indep(s1), consistent(s1, shape) ; \+indep(s1)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values rock_out_camber=Rock_Out_Camber unk_camber_type=Unknown
% @importance 0.975

0.93::acc(s1, camber_type).
0.95::acc(s2, camber_type).

0.97::true_val(camber_type, rock_out_camber); 0.03::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, rock_out_camber).
measured(s2, camber_type, rock_out_camber).

all_consistent(camber_type) :-
    consistent(s2, camber_type),
    (indep(s1), consistent(s1, camber_type) ; \+indep(s1)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, rock_out_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values eq_rad=EQ_Rad_Sidecut unk_sidecut_type=Unknown
% @importance 0.975

0.93::acc(s1, sidecut_type).
0.95::acc(s2, sidecut_type).

0.97::true_val(sidecut_type, eq_rad); 0.03::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, eq_rad).
measured(s2, sidecut_type, eq_rad).

all_consistent(sidecut_type) :-
    consistent(s2, sidecut_type),
    (indep(s1), consistent(s1, sidecut_type) ; \+indep(s1)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, eq_rad)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr setback
% @type categorical
% @canonical true
% @original_name setback
% @values zero=Zero_centered unk_setback=Unknown
% @importance 0.95

0.93::acc(s1, setback).

0.90::true_val(setback, zero); 0.10::true_val(setback, unk_setback).

measured(s1, setback, zero).

all_consistent(setback) :-
    (indep(s1), consistent(s1, setback) ; \+indep(s1)).

evidence(all_consistent(setback)).
query(true_val(setback, zero)).
query(true_val(setback, unk_setback)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values twin_flex=Twin_flex_symmetrical unk_flex_direction=Unknown
% @importance 0.95

0.93::acc(s1, flex_direction).

0.90::true_val(flex_direction, twin_flex); 0.10::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, twin_flex).

all_consistent(flex_direction) :-
    (indep(s1), consistent(s1, flex_direction) ; \+indep(s1)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v3=3.0 unk_flex_rating_10=Unknown
% @importance 0.85

0.93::acc(s_merchant, flex_rating_10).

0.93::true_val(flex_rating_10, v3); 0.07::true_val(flex_rating_10, unk_flex_rating_10).

measured(s_merchant, flex_rating_10, v3).

all_consistent(flex_rating_10) :-
    consistent(s_merchant, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v3)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_rating_5
% @type numeric
% @canonical true
% @original_name flex_rating_5
% @unit /5
% @values v2=2.0 unk_flex_rating_5=Unknown
% @importance 0.85

0.78::acc(s8, flex_rating_5).

0.71::true_val(flex_rating_5, v2); 0.29::true_val(flex_rating_5, unk_flex_rating_5).

measured(s8, flex_rating_5, v2).

all_consistent(flex_rating_5) :-
    (indep(s8), consistent(s8, flex_rating_5) ; \+indep(s8)).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v2)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical true
% @original_name flex_rating_10_evo
% @values medium=Medium unk_flex_rating_10_evo=Unknown
% @importance 0.85

0.85::acc(s35, flex_rating_10_evo).

0.72::true_val(flex_rating_10_evo, medium); 0.28::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s35, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :-
    consistent(s35, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values balanced_soft_playful=Balanced_soft_enough_for_pressing_stable_for_jumps unk_flex_feel=Unknown
% @importance 0.85

0.78::acc(s8, flex_feel).

0.71::true_val(flex_feel, balanced_soft_playful); 0.29::true_val(flex_feel, unk_flex_feel).

measured(s8, flex_feel, balanced_soft_playful).

all_consistent(flex_feel) :-
    (indep(s8), consistent(s8, flex_feel) ; \+indep(s8)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, balanced_soft_playful)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_intermediate=Beginner_Intermediate intermediate_advanced=Intermediate_Advanced all_levels=Beginner_Intermediate_Advanced
% @importance 0.77

0.90::acc(s_merchant, skill_level_recommendation).
0.85::acc(s35, skill_level_recommendation).
0.78::acc(s8, skill_level_recommendation).
0.72::acc(s32, skill_level_recommendation).
0.65::acc(s18, skill_level_recommendation).

0.30::true_val(skill_level_recommendation, beginner_intermediate); 0.45::true_val(skill_level_recommendation, intermediate_advanced); 0.25::true_val(skill_level_recommendation, all_levels).

measured(s_merchant, skill_level_recommendation, beginner_intermediate).
measured(s35, skill_level_recommendation, intermediate_advanced).
measured(s8, skill_level_recommendation, intermediate_advanced).
measured(s32, skill_level_recommendation, beginner_intermediate).
measured(s18, skill_level_recommendation, all_levels).

all_consistent(skill_level_recommendation) :-
    consistent(s_merchant, skill_level_recommendation),
    consistent(s35, skill_level_recommendation),
    (indep(s8), consistent(s8, skill_level_recommendation) ; \+indep(s8)),
    (indep(s32), consistent(s32, skill_level_recommendation) ; \+indep(s32)),
    consistent(s18, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_intermediate)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, all_levels)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values regular_and_wide=Regular_and_Wide unk_width_options=Unknown
% @importance 0.85

0.93::acc(s_merchant, width_options).
0.82::acc(s14, width_options).

0.95::true_val(width_options, regular_and_wide); 0.05::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, regular_and_wide).
measured(s14, width_options, regular_and_wide).

all_consistent(width_options) :-
    consistent(s_merchant, width_options),
    (indep(s14), consistent(s14, width_options) ; \+indep(s14)).

evidence(all_consistent(width_options)).
query(true_val(width_options, regular_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=151_153_155_158_155W_158W seven_sizes=148_151_153_155_158_155W_158W
% @importance 0.8

0.90::acc(s_merchant, available_sizes).
0.80::acc(s24, available_sizes).
0.78::acc(s27, available_sizes).

0.35::true_val(available_sizes, six_sizes); 0.65::true_val(available_sizes, seven_sizes).

measured(s_merchant, available_sizes, six_sizes).
measured(s24, available_sizes, seven_sizes).
measured(s27, available_sizes, seven_sizes).

all_consistent(available_sizes) :-
    consistent(s_merchant, available_sizes),
    consistent(s24, available_sizes),
    (indep(s27), consistent(s27, available_sizes) ; \+indep(s27)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, seven_sizes)).

% @attr effective_edge_151
% @type numeric
% @canonical false
% @original_name Effective edge 151cm
% @unit cm
% @values v117_0=117.0 unk_effective_edge_151=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_151).

0.93::true_val(effective_edge_151, v117_0); 0.07::true_val(effective_edge_151, unk_effective_edge_151).

measured(s_merchant, effective_edge_151, v117_0).

all_consistent(effective_edge_151) :-
    consistent(s_merchant, effective_edge_151).

evidence(all_consistent(effective_edge_151)).
query(true_val(effective_edge_151, v117_0)).
query(true_val(effective_edge_151, unk_effective_edge_151)).

% @attr tip_tail_width_size_151
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (151cm)
% @unit cm
% @values v29_2=29.2 unk_tip_tail_width_size_151=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_tail_width_size_151).

0.93::true_val(tip_tail_width_size_151, v29_2); 0.07::true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151).

measured(s_merchant, tip_tail_width_size_151, v29_2).

all_consistent(tip_tail_width_size_151) :-
    consistent(s_merchant, tip_tail_width_size_151).

evidence(all_consistent(tip_tail_width_size_151)).
query(true_val(tip_tail_width_size_151, v29_2)).
query(true_val(tip_tail_width_size_151, unk_tip_tail_width_size_151)).

% @attr waist_width_151
% @type numeric
% @canonical false
% @original_name Waist width 151cm
% @unit cm
% @values v24_7=24.7 unk_waist_width_151=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_151).

0.93::true_val(waist_width_151, v24_7); 0.07::true_val(waist_width_151, unk_waist_width_151).

measured(s_merchant, waist_width_151, v24_7).

all_consistent(waist_width_151) :-
    consistent(s_merchant, waist_width_151).

evidence(all_consistent(waist_width_151)).
query(true_val(waist_width_151, v24_7)).
query(true_val(waist_width_151, unk_waist_width_151)).

% @attr sidecut_radius_size_151
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (151cm)
% @unit m
% @values v7_6=7.6 unk_sidecut_radius_size_151=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_151).

0.93::true_val(sidecut_radius_size_151, v7_6); 0.07::true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151).

measured(s_merchant, sidecut_radius_size_151, v7_6).

all_consistent(sidecut_radius_size_151) :-
    consistent(s_merchant, sidecut_radius_size_151).

evidence(all_consistent(sidecut_radius_size_151)).
query(true_val(sidecut_radius_size_151, v7_6)).
query(true_val(sidecut_radius_size_151, unk_sidecut_radius_size_151)).

% @attr stance_width_range_size_151
% @type numeric
% @canonical false
% @original_name stance_width_range_size (151cm)
% @unit cm
% @values v54_0=54.0 unk_stance_width_range_size_151=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size_151).

0.93::true_val(stance_width_range_size_151, v54_0); 0.07::true_val(stance_width_range_size_151, unk_stance_width_range_size_151).

measured(s_merchant, stance_width_range_size_151, v54_0).

all_consistent(stance_width_range_size_151) :-
    consistent(s_merchant, stance_width_range_size_151).

evidence(all_consistent(stance_width_range_size_151)).
query(true_val(stance_width_range_size_151, v54_0)).
query(true_val(stance_width_range_size_151, unk_stance_width_range_size_151)).

% @attr recommended_weight_range_size_151
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (151cm)
% @unit kg
% @values w50_70=50_70kg unk_recommended_weight_range_size_151=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_151).

0.93::true_val(recommended_weight_range_size_151, w50_70); 0.07::true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151).

measured(s_merchant, recommended_weight_range_size_151, w50_70).

all_consistent(recommended_weight_range_size_151) :-
    consistent(s_merchant, recommended_weight_range_size_151).

evidence(all_consistent(recommended_weight_range_size_151)).
query(true_val(recommended_weight_range_size_151, w50_70)).
query(true_val(recommended_weight_range_size_151, unk_recommended_weight_range_size_151)).

% @attr effective_edge_153
% @type numeric
% @canonical false
% @original_name Effective edge 153cm
% @unit cm
% @values v119_0=119.0 unk_effective_edge_153=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_153).

0.93::true_val(effective_edge_153, v119_0); 0.07::true_val(effective_edge_153, unk_effective_edge_153).

measured(s_merchant, effective_edge_153, v119_0).

all_consistent(effective_edge_153) :-
    consistent(s_merchant, effective_edge_153).

evidence(all_consistent(effective_edge_153)).
query(true_val(effective_edge_153, v119_0)).
query(true_val(effective_edge_153, unk_effective_edge_153)).

% @attr tip_tail_width_size_153
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (153cm)
% @unit cm
% @values v29_5=29.5 unk_tip_tail_width_size_153=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_tail_width_size_153).

0.93::true_val(tip_tail_width_size_153, v29_5); 0.07::true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153).

measured(s_merchant, tip_tail_width_size_153, v29_5).

all_consistent(tip_tail_width_size_153) :-
    consistent(s_merchant, tip_tail_width_size_153).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v29_5)).
query(true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153)).

% @attr waist_width_153
% @type numeric
% @canonical false
% @original_name Waist width 153cm
% @unit cm
% @values v25_0=25.0 unk_waist_width_153=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_153).

0.93::true_val(waist_width_153, v25_0); 0.07::true_val(waist_width_153, unk_waist_width_153).

measured(s_merchant, waist_width_153, v25_0).

all_consistent(waist_width_153) :-
    consistent(s_merchant, waist_width_153).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v25_0)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr sidecut_radius_size_153
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (153cm)
% @unit m
% @values v7_8=7.8 unk_sidecut_radius_size_153=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_153).

0.93::true_val(sidecut_radius_size_153, v7_8); 0.07::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(s_merchant, sidecut_radius_size_153, v7_8).

all_consistent(sidecut_radius_size_153) :-
    consistent(s_merchant, sidecut_radius_size_153).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v7_8)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

% @attr stance_width_range_size_153
% @type numeric
% @canonical false
% @original_name stance_width_range_size (153cm)
% @unit cm
% @values v55_0=55.0 unk_stance_width_range_size_153=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size_153).

0.93::true_val(stance_width_range_size_153, v55_0); 0.07::true_val(stance_width_range_size_153, unk_stance_width_range_size_153).

measured(s_merchant, stance_width_range_size_153, v55_0).

all_consistent(stance_width_range_size_153) :-
    consistent(s_merchant, stance_width_range_size_153).

evidence(all_consistent(stance_width_range_size_153)).
query(true_val(stance_width_range_size_153, v55_0)).
query(true_val(stance_width_range_size_153, unk_stance_width_range_size_153)).

% @attr recommended_weight_range_size_153
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (153cm)
% @unit kg
% @values w55_75=55_75kg unk_recommended_weight_range_size_153=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_153).

0.93::true_val(recommended_weight_range_size_153, w55_75); 0.07::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).

measured(s_merchant, recommended_weight_range_size_153, w55_75).

all_consistent(recommended_weight_range_size_153) :-
    consistent(s_merchant, recommended_weight_range_size_153).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w55_75)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

% @attr effective_edge_155
% @type numeric
% @canonical false
% @original_name Effective edge 155cm
% @unit cm
% @values v120_5=120.5 unk_effective_edge_155=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_155).

0.93::true_val(effective_edge_155, v120_5); 0.07::true_val(effective_edge_155, unk_effective_edge_155).

measured(s_merchant, effective_edge_155, v120_5).

all_consistent(effective_edge_155) :-
    consistent(s_merchant, effective_edge_155).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v120_5)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v29_7=29.7 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_tail_width_size).

0.93::true_val(tip_tail_width_size, v29_7); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_merchant, tip_tail_width_size, v29_7).

all_consistent(tip_tail_width_size) :-
    consistent(s_merchant, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_7)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name Waist width 155cm
% @unit cm
% @values v25_2=25.2 unk_waist_width_155=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_155).

0.93::true_val(waist_width_155, v25_2); 0.07::true_val(waist_width_155, unk_waist_width_155).

measured(s_merchant, waist_width_155, v25_2).

all_consistent(waist_width_155) :-
    consistent(s_merchant, waist_width_155).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_2)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v8_0=8.0 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size).

0.93::true_val(sidecut_radius_size, v8_0); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s_merchant, sidecut_radius_size, v8_0).

all_consistent(sidecut_radius_size) :-
    consistent(s_merchant, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_0)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @original_name stance_width_range_size
% @unit cm
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size).

0.93::true_val(stance_width_range_size, v56_0); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s_merchant, stance_width_range_size, v56_0).

all_consistent(stance_width_range_size) :-
    consistent(s_merchant, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @unit kg
% @values w55_85=55_85kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size).

0.93::true_val(recommended_weight_range_size, w55_85); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_merchant, recommended_weight_range_size, w55_85).

all_consistent(recommended_weight_range_size) :-
    consistent(s_merchant, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w55_85)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_158
% @type numeric
% @canonical false
% @original_name Effective edge 158cm
% @unit cm
% @values v123_0=123.0 unk_effective_edge_158=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_158).

0.93::true_val(effective_edge_158, v123_0); 0.07::true_val(effective_edge_158, unk_effective_edge_158).

measured(s_merchant, effective_edge_158, v123_0).

all_consistent(effective_edge_158) :-
    consistent(s_merchant, effective_edge_158).

evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v123_0)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

% @attr tip_tail_width_size_158
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (158cm)
% @unit cm
% @values v29_9=29.9 unk_tip_tail_width_size_158=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_tail_width_size_158).

0.93::true_val(tip_tail_width_size_158, v29_9); 0.07::true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158).

measured(s_merchant, tip_tail_width_size_158, v29_9).

all_consistent(tip_tail_width_size_158) :-
    consistent(s_merchant, tip_tail_width_size_158).

evidence(all_consistent(tip_tail_width_size_158)).
query(true_val(tip_tail_width_size_158, v29_9)).
query(true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158)).

% @attr waist_width_158
% @type numeric
% @canonical false
% @original_name Waist width 158cm
% @unit cm
% @values v25_4=25.4 unk_waist_width_158=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_158).

0.93::true_val(waist_width_158, v25_4); 0.07::true_val(waist_width_158, unk_waist_width_158).

measured(s_merchant, waist_width_158, v25_4).

all_consistent(waist_width_158) :-
    consistent(s_merchant, waist_width_158).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v25_4)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr sidecut_radius_size_158
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (158cm)
% @unit m
% @values v8_2=8.2 unk_sidecut_radius_size_158=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_158).

0.93::true_val(sidecut_radius_size_158, v8_2); 0.07::true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158).

measured(s_merchant, sidecut_radius_size_158, v8_2).

all_consistent(sidecut_radius_size_158) :-
    consistent(s_merchant, sidecut_radius_size_158).

evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v8_2)).
query(true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158)).

% @attr stance_width_range_size_158
% @type numeric
% @canonical false
% @original_name stance_width_range_size (158cm)
% @unit cm
% @values v57_0=57.0 unk_stance_width_range_size_158=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size_158).

0.93::true_val(stance_width_range_size_158, v57_0); 0.07::true_val(stance_width_range_size_158, unk_stance_width_range_size_158).

measured(s_merchant, stance_width_range_size_158, v57_0).

all_consistent(stance_width_range_size_158) :-
    consistent(s_merchant, stance_width_range_size_158).

evidence(all_consistent(stance_width_range_size_158)).
query(true_val(stance_width_range_size_158, v57_0)).
query(true_val(stance_width_range_size_158, unk_stance_width_range_size_158)).

% @attr recommended_weight_range_size_158
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (158cm)
% @unit kg
% @values w65_90=65_90kg unk_recommended_weight_range_size_158=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_158).

0.93::true_val(recommended_weight_range_size_158, w65_90); 0.07::true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158).

measured(s_merchant, recommended_weight_range_size_158, w65_90).

all_consistent(recommended_weight_range_size_158) :-
    consistent(s_merchant, recommended_weight_range_size_158).

evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, w65_90)).
query(true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158)).

% @attr effective_edge_155w
% @type numeric
% @canonical false
% @original_name Effective edge 155W
% @unit cm
% @values v120_5=120.5 unk_effective_edge_155w=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_155w).

0.93::true_val(effective_edge_155w, v120_5w); 0.07::true_val(effective_edge_155w, unk_effective_edge_155w).

measured(s_merchant, effective_edge_155w, v120_5w).

all_consistent(effective_edge_155w) :-
    consistent(s_merchant, effective_edge_155w).

evidence(all_consistent(effective_edge_155w)).
query(true_val(effective_edge_155w, v120_5w)).
query(true_val(effective_edge_155w, unk_effective_edge_155w)).

% @attr tip_tail_width_size_155w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (155W)
% @unit cm
% @values v30_4=30.4 unk_tip_tail_width_size_155w=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_tail_width_size_155w).

0.93::true_val(tip_tail_width_size_155w, v30_4); 0.07::true_val(tip_tail_width_size_155w, unk_tip_tail_width_size_155w).

measured(s_merchant, tip_tail_width_size_155w, v30_4).

all_consistent(tip_tail_width_size_155w) :-
    consistent(s_merchant, tip_tail_width_size_155w).

evidence(all_consistent(tip_tail_width_size_155w)).
query(true_val(tip_tail_width_size_155w, v30_4)).
query(true_val(tip_tail_width_size_155w, unk_tip_tail_width_size_155w)).

% @attr waist_width_155w
% @type numeric
% @canonical false
% @original_name Waist width 155W
% @unit cm
% @values v25_9=25.9 unk_waist_width_155w=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_155w).

0.93::true_val(waist_width_155w, v25_9); 0.07::true_val(waist_width_155w, unk_waist_width_155w).

measured(s_merchant, waist_width_155w, v25_9).

all_consistent(waist_width_155w) :-
    consistent(s_merchant, waist_width_155w).

evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v25_9)).
query(true_val(waist_width_155w, unk_waist_width_155w)).

% @attr sidecut_radius_size_155w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (155W)
% @unit m
% @values v8_0=8.0 unk_sidecut_radius_size_155w=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_155w).

0.93::true_val(sidecut_radius_size_155w, v8_0w); 0.07::true_val(sidecut_radius_size_155w, unk_sidecut_radius_size_155w).

measured(s_merchant, sidecut_radius_size_155w, v8_0w).

all_consistent(sidecut_radius_size_155w) :-
    consistent(s_merchant, sidecut_radius_size_155w).

evidence(all_consistent(sidecut_radius_size_155w)).
query(true_val(sidecut_radius_size_155w, v8_0w)).
query(true_val(sidecut_radius_size_155w, unk_sidecut_radius_size_155w)).

% @attr stance_width_range_size_155w
% @type numeric
% @canonical false
% @original_name stance_width_range_size (155W)
% @unit cm
% @values v56_0=56.0 unk_stance_width_range_size_155w=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size_155w).

0.93::true_val(stance_width_range_size_155w, v56_0w); 0.07::true_val(stance_width_range_size_155w, unk_stance_width_range_size_155w).

measured(s_merchant, stance_width_range_size_155w, v56_0w).

all_consistent(stance_width_range_size_155w) :-
    consistent(s_merchant, stance_width_range_size_155w).

evidence(all_consistent(stance_width_range_size_155w)).
query(true_val(stance_width_range_size_155w, v56_0w)).
query(true_val(stance_width_range_size_155w, unk_stance_width_range_size_155w)).

% @attr recommended_weight_range_size_155w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (155W)
% @unit kg
% @values w65_95=65_95kg unk_recommended_weight_range_size_155w=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_155w).

0.93::true_val(recommended_weight_range_size_155w, w65_95); 0.07::true_val(recommended_weight_range_size_155w, unk_recommended_weight_range_size_155w).

measured(s_merchant, recommended_weight_range_size_155w, w65_95).

all_consistent(recommended_weight_range_size_155w) :-
    consistent(s_merchant, recommended_weight_range_size_155w).

evidence(all_consistent(recommended_weight_range_size_155w)).
query(true_val(recommended_weight_range_size_155w, w65_95)).
query(true_val(recommended_weight_range_size_155w, unk_recommended_weight_range_size_155w)).

% @attr effective_edge_158w
% @type numeric
% @canonical false
% @original_name Effective edge 158W
% @unit cm
% @values v123_0=123.0 unk_effective_edge_158w=Unknown
% @importance 0.85

0.93::acc(s_merchant, effective_edge_158w).

0.93::true_val(effective_edge_158w, v123_0w); 0.07::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(s_merchant, effective_edge_158w, v123_0w).

all_consistent(effective_edge_158w) :-
    consistent(s_merchant, effective_edge_158w).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v123_0w)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr tip_tail_width_size_158w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (158W)
% @unit cm
% @values v30_7=30.7 unk_tip_tail_width_size_158w=Unknown
% @importance 0.85

0.93::acc(s_merchant, tip_tail_width_size_158w).

0.93::true_val(tip_tail_width_size_158w, v30_7); 0.07::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).

measured(s_merchant, tip_tail_width_size_158w, v30_7).

all_consistent(tip_tail_width_size_158w) :-
    consistent(s_merchant, tip_tail_width_size_158w).

evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v30_7)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

% @attr waist_width_158w
% @type numeric
% @canonical false
% @original_name Waist width 158W
% @unit cm
% @values v26_2=26.2 unk_waist_width_158w=Unknown
% @importance 0.85

0.93::acc(s_merchant, waist_width_158w).

0.93::true_val(waist_width_158w, v26_2); 0.07::true_val(waist_width_158w, unk_waist_width_158w).

measured(s_merchant, waist_width_158w, v26_2).

all_consistent(waist_width_158w) :-
    consistent(s_merchant, waist_width_158w).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v26_2)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr sidecut_radius_size_158w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (158W)
% @unit m
% @values v8_2=8.2 unk_sidecut_radius_size_158w=Unknown
% @importance 0.85

0.93::acc(s_merchant, sidecut_radius_size_158w).

0.93::true_val(sidecut_radius_size_158w, v8_2w); 0.07::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).

measured(s_merchant, sidecut_radius_size_158w, v8_2w).

all_consistent(sidecut_radius_size_158w) :-
    consistent(s_merchant, sidecut_radius_size_158w).

evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, v8_2w)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

% @attr stance_width_range_size_158w
% @type numeric
% @canonical false
% @original_name stance_width_range_size (158W)
% @unit cm
% @values v57_0=57.0 unk_stance_width_range_size_158w=Unknown
% @importance 0.85

0.93::acc(s_merchant, stance_width_range_size_158w).

0.93::true_val(stance_width_range_size_158w, v57_0w); 0.07::true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w).

measured(s_merchant, stance_width_range_size_158w, v57_0w).

all_consistent(stance_width_range_size_158w) :-
    consistent(s_merchant, stance_width_range_size_158w).

evidence(all_consistent(stance_width_range_size_158w)).
query(true_val(stance_width_range_size_158w, v57_0w)).
query(true_val(stance_width_range_size_158w, unk_stance_width_range_size_158w)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (158W)
% @unit kg
% @values w70_105=70_105kg unk_recommended_weight_range_size_158w=Unknown
% @importance 0.85

0.93::acc(s_merchant, recommended_weight_range_size_158w).

0.93::true_val(recommended_weight_range_size_158w, w70_105); 0.07::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s_merchant, recommended_weight_range_size_158w, w70_105).

all_consistent(recommended_weight_range_size_158w) :-
    consistent(s_merchant, recommended_weight_range_size_158w).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, w70_105)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

% @attr waist_width_148
% @type numeric
% @canonical false
% @original_name Waist width 148cm
% @unit mm
% @values v242=242.0 unk_waist_width_148=Unknown
% @importance 0.7

0.65::acc(s18, waist_width_148).

0.55::true_val(waist_width_148, v242); 0.45::true_val(waist_width_148, unk_waist_width_148).

measured(s18, waist_width_148, v242).

all_consistent(waist_width_148) :-
    consistent(s18, waist_width_148).

evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v242)).
query(true_val(waist_width_148, unk_waist_width_148)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_strong=Aspen_Strong_Core_CNC_selected unk_core_material=Unknown
% @importance 0.975

0.93::acc(s1, core_material).
0.95::acc(s2, core_material).

0.97::true_val(core_material, aspen_strong); 0.03::true_val(core_material, unk_core_material).

measured(s1, core_material, aspen_strong).
measured(s2, core_material, aspen_strong).

all_consistent(core_material) :-
    consistent(s2, core_material),
    (indep(s1), consistent(s1, core_material) ; \+indep(s1)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_strong)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_bio_resin=FSC_certified_wood_plus_30pct_bio_resin unk_sustainability_certification=Unknown
% @importance 0.55

0.85::acc(s36, sustainability_certification).
0.70::acc(s37, sustainability_certification).
0.70::acc(s43, sustainability_certification).
0.75::acc(s32, sustainability_certification).

0.97::true_val(sustainability_certification, fsc_bio_resin); 0.03::true_val(sustainability_certification, unk_sustainability_certification).

measured(s36, sustainability_certification, fsc_bio_resin).
measured(s37, sustainability_certification, fsc_bio_resin).
measured(s43, sustainability_certification, fsc_bio_resin).
measured(s32, sustainability_certification, fsc_bio_resin).

all_consistent(sustainability_certification) :-
    consistent(s36, sustainability_certification),
    (indep(s28), consistent(s37, sustainability_certification) ; \+indep(s28)),
    (indep(s11), consistent(s43, sustainability_certification) ; \+indep(s11)),
    (indep(s32), consistent(s32, sustainability_certification) ; \+indep(s32)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_bio_resin)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values popster=Popster_milled_core_for_natural_flex_and_pop unk_construction_material_innovation=Unknown
% @importance 0.9

0.93::acc(s1, construction_material_innovation).
0.80::acc(s38, construction_material_innovation).

0.95::true_val(construction_material_innovation, popster); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, popster).
measured(s38, construction_material_innovation, popster).

all_consistent(construction_material_innovation) :-
    (indep(s1), consistent(s1, construction_material_innovation) ; \+indep(s1)),
    (indep(s8), consistent(s38, construction_material_innovation) ; \+indep(s8)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, popster)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_rubber
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Royal Rubber Pads)
% @values royal_rubber_pads=2mm_soft_rubber_in_ABS_sidewalls unk_construction_material_innovation_rubber=Unknown
% @importance 0.73

0.78::acc(s9, construction_material_innovation_rubber).
0.75::acc(s40, construction_material_innovation_rubber).

0.95::true_val(construction_material_innovation_rubber, royal_rubber_pads); 0.05::true_val(construction_material_innovation_rubber, unk_construction_material_innovation_rubber).

measured(s9, construction_material_innovation_rubber, royal_rubber_pads).
measured(s40, construction_material_innovation_rubber, royal_rubber_pads).

all_consistent(construction_material_innovation_rubber) :-
    consistent(s9, construction_material_innovation_rubber),
    (indep(s40), consistent(s40, construction_material_innovation_rubber) ; \+indep(s40)).

evidence(all_consistent(construction_material_innovation_rubber)).
query(true_val(construction_material_innovation_rubber, royal_rubber_pads)).
query(true_val(construction_material_innovation_rubber, unk_construction_material_innovation_rubber)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values ba_md=BA_MD_Biaxial_Medium_Density_fiberglass unk_laminate=Unknown
% @importance 0.75

0.80::acc(s38, laminate).
0.75::acc(s39, laminate).

0.95::true_val(laminate, ba_md); 0.05::true_val(laminate, unk_laminate).

measured(s38, laminate, ba_md).
measured(s39, laminate, ba_md).

all_consistent(laminate) :-
    (indep(s8), consistent(s38, laminate) ; \+indep(s8)),
    (indep(s39), consistent(s39, laminate) ; \+indep(s39)).

evidence(all_consistent(laminate)).
query(true_val(laminate, ba_md)).
query(true_val(laminate, unk_laminate)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values bio_30pct=30pct_Bio_Based_Resin unk_resin=Unknown
% @importance 0.85

0.75::acc(s32, resin).
0.80::acc(s38, resin).

0.95::true_val(resin, bio_30pct); 0.05::true_val(resin, unk_resin).

measured(s32, resin, bio_30pct).
measured(s38, resin, bio_30pct).

all_consistent(resin) :-
    (indep(s32), consistent(s32, resin) ; \+indep(s32)),
    (indep(s8), consistent(s38, resin) ; \+indep(s8)).

evidence(all_consistent(resin)).
query(true_val(resin, bio_30pct)).
query(true_val(resin, unk_resin)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs_royal_rubber=ABS_Sidewalls_with_Royal_Rubber_Pads unk_sidewall_material=Unknown
% @importance 0.68

0.75::acc(s39, sidewall_material).
0.75::acc(s40, sidewall_material).

0.95::true_val(sidewall_material, abs_royal_rubber); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s39, sidewall_material, abs_royal_rubber).
measured(s40, sidewall_material, abs_royal_rubber).

all_consistent(sidewall_material) :-
    (indep(s39), consistent(s39, sidewall_material) ; \+indep(s39)),
    (indep(s40), consistent(s40, sidewall_material) ; \+indep(s40)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs_royal_rubber)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values freestyle_edge_bevel=Freestyle_Edge_Bevel unk_edge_technology=Unknown
% @importance 0.78

0.93::acc(s_merchant, edge_technology).
0.80::acc(s41, edge_technology).

0.95::true_val(edge_technology, freestyle_edge_bevel); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s_merchant, edge_technology, freestyle_edge_bevel).
measured(s41, edge_technology, freestyle_edge_bevel).

all_consistent(edge_technology) :-
    consistent(s_merchant, edge_technology),
    (indep(s8), consistent(s41, edge_technology) ; \+indep(s8)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, freestyle_edge_bevel)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_bevel_spec
% @type categorical
% @canonical true
% @original_name edge_bevel_spec
% @values base_1_5deg=1.5_degree_base_edge_bevel multi_zone_2_3deg=2deg_sidecut_3deg_between_feet
% @importance 0.73

0.88::acc(s_merchant, edge_bevel_spec).
0.82::acc(s41, edge_bevel_spec).
0.80::acc(s42, edge_bevel_spec).

0.35::true_val(edge_bevel_spec, base_1_5deg); 0.65::true_val(edge_bevel_spec, multi_zone_2_3deg).

measured(s_merchant, edge_bevel_spec, base_1_5deg).
measured(s41, edge_bevel_spec, multi_zone_2_3deg).
measured(s42, edge_bevel_spec, multi_zone_2_3deg).

all_consistent(edge_bevel_spec) :-
    consistent(s_merchant, edge_bevel_spec),
    (indep(s8), consistent(s41, edge_bevel_spec) ; \+indep(s8)),
    consistent(s42, edge_bevel_spec).

evidence(all_consistent(edge_bevel_spec)).
query(true_val(edge_bevel_spec, base_1_5deg)).
query(true_val(edge_bevel_spec, multi_zone_2_3deg)).

% @attr base_material
% @type categorical
% @canonical false
% @original_name base_material
% @values sintered=Sintered unk_base_material=Unknown
% @importance 0.82

0.93::acc(s_merchant, base_material).
0.80::acc(s10, base_material).
0.75::acc(s11, base_material).

0.97::true_val(base_material, sintered_bm); 0.03::true_val(base_material, unk_base_material).

measured(s_merchant, base_material, sintered_bm).
measured(s10, base_material, sintered_bm).
measured(s11, base_material, sintered_bm).

all_consistent(base_material) :-
    consistent(s_merchant, base_material),
    (indep(s10), consistent(s10, base_material) ; \+indep(s10)),
    (indep(s11), consistent(s11, base_material) ; \+indep(s11)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_bm)).
query(true_val(base_material, unk_base_material)).

% @attr base_finish
% @type categorical
% @canonical false
% @original_name Base finish
% @values medium_stone=Medium_Stone_Finish unk_base_finish=Unknown
% @importance 0.78

0.93::acc(s_merchant, base_finish).
0.78::acc(s42, base_finish).

0.95::true_val(base_finish, medium_stone); 0.05::true_val(base_finish, unk_base_finish).

measured(s_merchant, base_finish, medium_stone).
measured(s42, base_finish, medium_stone).

all_consistent(base_finish) :-
    consistent(s_merchant, base_finish),
    consistent(s42, base_finish).

evidence(all_consistent(base_finish)).
query(true_val(base_finish, medium_stone)).
query(true_val(base_finish, unk_base_finish)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values natural_wax=Natural_Wax_pre_waxed unk_factory_wax=Unknown
% @importance 0.85

0.93::acc(s_merchant, factory_wax).
0.80::acc(s38, factory_wax).

0.95::true_val(factory_wax, natural_wax); 0.05::true_val(factory_wax, unk_factory_wax).

measured(s_merchant, factory_wax, natural_wax).
measured(s38, factory_wax, natural_wax).

all_consistent(factory_wax) :-
    consistent(s_merchant, factory_wax),
    (indep(s8), consistent(s38, factory_wax) ; \+indep(s8)).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, natural_wax)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr mounting_pattern
% @type categorical
% @canonical false
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.93::acc(s_merchant, mounting_pattern).
0.80::acc(s8, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_merchant, mounting_pattern, inserts_2x4).
measured(s8, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(s_merchant, mounting_pattern),
    (indep(s8), consistent(s8, mounting_pattern) ; \+indep(s8)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_rails_street=Park_rails_side_hits_streets unk_terrain_suitability=Unknown
% @importance 0.83

0.93::acc(s_merchant, terrain_suitability).
0.78::acc(s32, terrain_suitability).

0.95::true_val(terrain_suitability, park_rails_street); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_merchant, terrain_suitability, park_rails_street).
measured(s32, terrain_suitability, park_rails_street).

all_consistent(terrain_suitability) :-
    consistent(s_merchant, terrain_suitability),
    (indep(s32), consistent(s32, terrain_suitability) ; \+indep(s32)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_rails_street)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values freestyle_jib=Freestyle_jib_pressing_buttering unk_riding_style=Unknown
% @importance 0.85

0.93::acc(s_merchant, riding_style).

0.93::true_val(riding_style, freestyle_jib); 0.07::true_val(riding_style, unk_riding_style).

measured(s_merchant, riding_style, freestyle_jib).

all_consistent(riding_style) :-
    consistent(s_merchant, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_jib)).
query(true_val(riding_style, unk_riding_style)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values excellent_value=Excellent_value_for_money_in_park_category unk_positive_aspect=Unknown
% @importance 0.85

0.82::acc(s47, positive_aspect).
0.68::acc(s49, positive_aspect).

0.95::true_val(positive_aspect, excellent_value); 0.05::true_val(positive_aspect, unk_positive_aspect).

measured(s47, positive_aspect, excellent_value).
measured(s49, positive_aspect, excellent_value).

all_consistent(positive_aspect) :-
    consistent(s47, positive_aspect),
    consistent(s49, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, excellent_value)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_press
% @type categorical
% @canonical false
% @original_name positive_aspect (press and butter)
% @values easy_press_butter=Easy_to_press_butter_stomp_tricks unk_positive_aspect_press=Unknown
% @importance 0.93

0.90::acc(s23, positive_aspect_press).
0.93::acc(s1, positive_aspect_press).
0.95::acc(s2, positive_aspect_press).

0.97::true_val(positive_aspect_press, easy_press_butter); 0.03::true_val(positive_aspect_press, unk_positive_aspect_press).

measured(s23, positive_aspect_press, easy_press_butter).
measured(s1, positive_aspect_press, easy_press_butter).
measured(s2, positive_aspect_press, easy_press_butter).

all_consistent(positive_aspect_press) :-
    consistent(s2, positive_aspect_press),
    (indep(s1), consistent(s1, positive_aspect_press) ; \+indep(s1)),
    (indep(s23), consistent(s23, positive_aspect_press) ; \+indep(s23)).

evidence(all_consistent(positive_aspect_press)).
query(true_val(positive_aspect_press, easy_press_butter)).
query(true_val(positive_aspect_press, unk_positive_aspect_press)).

% @attr positive_aspect_rails
% @type categorical
% @canonical false
% @original_name positive_aspect (rail lock)
% @values locks_into_rails=Locks_into_rails_flat_section_stability unk_positive_aspect_rails=Unknown
% @importance 0.78

0.93::acc(s1, positive_aspect_rails).
0.82::acc(s7, positive_aspect_rails).

0.95::true_val(positive_aspect_rails, locks_into_rails); 0.05::true_val(positive_aspect_rails, unk_positive_aspect_rails).

measured(s1, positive_aspect_rails, locks_into_rails).
measured(s7, positive_aspect_rails, locks_into_rails).

all_consistent(positive_aspect_rails) :-
    (indep(s1), consistent(s1, positive_aspect_rails) ; \+indep(s1)),
    consistent(s7, positive_aspect_rails).

evidence(all_consistent(positive_aspect_rails)).
query(true_val(positive_aspect_rails, locks_into_rails)).
query(true_val(positive_aspect_rails, unk_positive_aspect_rails)).

% @attr positive_aspect_sintered
% @type categorical
% @canonical false
% @original_name positive_aspect (sintered base upgrade)
% @values sintered_upgrade=Sintered_base_2026_upgrade_better_glide unk_positive_aspect_sintered=Unknown
% @importance 0.78

0.80::acc(s10, positive_aspect_sintered).
0.55::acc(s45, positive_aspect_sintered).

0.90::true_val(positive_aspect_sintered, sintered_upgrade); 0.10::true_val(positive_aspect_sintered, unk_positive_aspect_sintered).

measured(s10, positive_aspect_sintered, sintered_upgrade).
measured(s45, positive_aspect_sintered, sintered_upgrade).

all_consistent(positive_aspect_sintered) :-
    (indep(s10), consistent(s10, positive_aspect_sintered) ; \+indep(s10)),
    consistent(s45, positive_aspect_sintered).

evidence(all_consistent(positive_aspect_sintered)).
query(true_val(positive_aspect_sintered, sintered_upgrade)).
query(true_val(positive_aspect_sintered, unk_positive_aspect_sintered)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values explosive_popster=Explosive_pop_from_Popster_core unk_pop=Unknown
% @importance 0.9

0.93::acc(s1, pop).
0.80::acc(s38, pop).

0.95::true_val(pop, explosive_popster); 0.05::true_val(pop, unk_pop).

measured(s1, pop, explosive_popster).
measured(s38, pop, explosive_popster).

all_consistent(pop) :-
    (indep(s1), consistent(s1, pop) ; \+indep(s1)),
    (indep(s8), consistent(s38, pop) ; \+indep(s8)).

evidence(all_consistent(pop)).
query(true_val(pop, explosive_popster)).
query(true_val(pop, unk_pop)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values identical_switch=True_twin_identical_switch_riding unk_switch_riding=Unknown
% @importance 0.95

0.93::acc(s1, switch_riding).

0.90::true_val(switch_riding, identical_switch); 0.10::true_val(switch_riding, unk_switch_riding).

measured(s1, switch_riding, identical_switch).

all_consistent(switch_riding) :-
    (indep(s1), consistent(s1, switch_riding) ; \+indep(s1)).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, identical_switch)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr chatter_performance
% @type categorical
% @canonical false
% @original_name chatter_performance
% @values rubber_dampened=Royal_Rubber_Pads_absorb_shocks unk_chatter_performance=Unknown
% @importance 0.7

0.75::acc(s40, chatter_performance).
0.75::acc(s29, chatter_performance).

0.95::true_val(chatter_performance, rubber_dampened); 0.05::true_val(chatter_performance, unk_chatter_performance).

measured(s40, chatter_performance, rubber_dampened).
measured(s29, chatter_performance, rubber_dampened).

all_consistent(chatter_performance) :-
    (indep(s40), consistent(s40, chatter_performance) ; \+indep(s40)),
    (indep(s29), consistent(s29, chatter_performance) ; \+indep(s29)).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, rubber_dampened)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values eq_rad_enhanced=EQ_Rad_sidecut_enhances_control unk_edge_hold=Unknown
% @importance 0.85

0.78::acc(s32, edge_hold).

0.68::true_val(edge_hold, eq_rad_enhanced); 0.32::true_val(edge_hold, unk_edge_hold).

measured(s32, edge_hold, eq_rad_enhanced).

all_consistent(edge_hold) :-
    (indep(s32), consistent(s32, edge_hold) ; \+indep(s32)).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, eq_rad_enhanced)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values mad_scientist=Mad_scientists_electrifying_mishap unk_topsheet_appearance_description=Unknown
% @importance 0.85

0.72::acc(s23, topsheet_appearance_description).

0.63::true_val(topsheet_appearance_description, mad_scientist); 0.37::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s23, topsheet_appearance_description, mad_scientist).

all_consistent(topsheet_appearance_description) :-
    (indep(s23), consistent(s23, topsheet_appearance_description) ; \+indep(s23)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, mad_scientist)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values noodle_jib_not_stable=Noodle_jib_board_not_stable_at_speed unk_user_review_forum=Unknown
% @importance 0.85

0.55::acc(s44, user_review_forum).

0.34::true_val(user_review_forum, noodle_jib_not_stable); 0.66::true_val(user_review_forum, unk_user_review_forum).

measured(s44, user_review_forum, noodle_jib_not_stable).

all_consistent(user_review_forum) :-
    consistent(s44, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, noodle_jib_not_stable)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_stiffness
% @type categorical
% @canonical false
% @original_name user_review_forum (stiffness change)
% @values feels_stiffer_2024=2024_model_feels_stiffer_than_previous unk_user_review_forum_stiffness=Unknown
% @importance 0.75

0.50::acc(s45, user_review_forum_stiffness).

0.32::true_val(user_review_forum_stiffness, feels_stiffer_2024); 0.68::true_val(user_review_forum_stiffness, unk_user_review_forum_stiffness).

measured(s45, user_review_forum_stiffness, feels_stiffer_2024).

all_consistent(user_review_forum_stiffness) :-
    consistent(s45, user_review_forum_stiffness).

evidence(all_consistent(user_review_forum_stiffness)).
query(true_val(user_review_forum_stiffness, feels_stiffer_2024)).
query(true_val(user_review_forum_stiffness, unk_user_review_forum_stiffness)).

% @attr user_review_forum_sintered
% @type categorical
% @canonical false
% @original_name user_review_forum (sintered base)
% @values sintered_positive=Sintered_base_upgrade_noted_as_significant_positive unk_user_review_forum_sintered=Unknown
% @importance 0.75

0.50::acc(s45, user_review_forum_sintered).

0.32::true_val(user_review_forum_sintered, sintered_positive); 0.68::true_val(user_review_forum_sintered, unk_user_review_forum_sintered).

measured(s45, user_review_forum_sintered, sintered_positive).

all_consistent(user_review_forum_sintered) :-
    consistent(s45, user_review_forum_sintered).

evidence(all_consistent(user_review_forum_sintered)).
query(true_val(user_review_forum_sintered, sintered_positive)).
query(true_val(user_review_forum_sintered, unk_user_review_forum_sintered)).

% @attr user_review_forum_sidecut_width
% @type categorical
% @canonical false
% @original_name user_review_forum (sidecut width)
% @values narrower_2_3mm=Quadratic_sidecut_2_3mm_narrower_underfoot unk_user_review_forum_sidecut_width=Unknown
% @importance 0.75

0.50::acc(s45, user_review_forum_sidecut_width).

0.32::true_val(user_review_forum_sidecut_width, narrower_2_3mm); 0.68::true_val(user_review_forum_sidecut_width, unk_user_review_forum_sidecut_width).

measured(s45, user_review_forum_sidecut_width, narrower_2_3mm).

all_consistent(user_review_forum_sidecut_width) :-
    consistent(s45, user_review_forum_sidecut_width).

evidence(all_consistent(user_review_forum_sidecut_width)).
query(true_val(user_review_forum_sidecut_width, narrower_2_3mm)).
query(true_val(user_review_forum_sidecut_width, unk_user_review_forum_sidecut_width)).

% @attr user_rating_merchant
% @type numeric
% @canonical false
% @original_name User rating (merchant)
% @unit /5
% @values v5_0=5.0 unk_user_rating_merchant=Unknown
% @importance 0.85

0.90::acc(s_merchant, user_rating_merchant).

0.80::true_val(user_rating_merchant, v5_0); 0.20::true_val(user_rating_merchant, unk_user_rating_merchant).

measured(s_merchant, user_rating_merchant, v5_0).

all_consistent(user_rating_merchant) :-
    consistent(s_merchant, user_rating_merchant).

evidence(all_consistent(user_rating_merchant)).
query(true_val(user_rating_merchant, v5_0)).
query(true_val(user_rating_merchant, unk_user_rating_merchant)).

% @attr youtube_review_title
% @type categorical
% @canonical false
% @original_name YouTube review title
% @values best_bang_for_buck=Best_Bang_for_Your_Buck_Park_Board unk_youtube_review_title=Unknown
% @importance 0.7

0.45::acc(s46, youtube_review_title).

0.30::true_val(youtube_review_title, best_bang_for_buck); 0.70::true_val(youtube_review_title, unk_youtube_review_title).

measured(s46, youtube_review_title, best_bang_for_buck).

all_consistent(youtube_review_title) :-
    consistent(s46, youtube_review_title).

evidence(all_consistent(youtube_review_title)).
query(true_val(youtube_review_title, best_bang_for_buck)).
query(true_val(youtube_review_title, unk_youtube_review_title)).

% @attr youtube_review_description
% @type categorical
% @canonical false
% @original_name YouTube review description
% @values solid_park_all_mtn=Solid_choice_for_park_and_all_mountain_medium_flex unk_youtube_review_description=Unknown
% @importance 0.7

0.45::acc(s46, youtube_review_description).

0.30::true_val(youtube_review_description, solid_park_all_mtn); 0.70::true_val(youtube_review_description, unk_youtube_review_description).

measured(s46, youtube_review_description, solid_park_all_mtn).

all_consistent(youtube_review_description) :-
    consistent(s46, youtube_review_description).

evidence(all_consistent(youtube_review_description)).
query(true_val(youtube_review_description, solid_park_all_mtn)).
query(true_val(youtube_review_description, unk_youtube_review_description)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values top_100_great_value=Top_100_product_great_value_for_park_jib unk_reviewer_opinion_whitelines=Unknown
% @importance 0.9

0.82::acc(s47, reviewer_opinion_whitelines).

0.68::true_val(reviewer_opinion_whitelines, top_100_great_value); 0.32::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s47, reviewer_opinion_whitelines, top_100_great_value).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s47, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, top_100_great_value)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_2018
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (2017/18)
% @values fun_spring_edge_hold=Fun_spring_shredding_good_edge_hold_affordable_quiver unk_reviewer_opinion_whitelines_2018=Unknown
% @importance 0.6

0.80::acc(s7, reviewer_opinion_whitelines_2018).

0.76::true_val(reviewer_opinion_whitelines_2018, fun_spring_edge_hold); 0.24::true_val(reviewer_opinion_whitelines_2018, unk_reviewer_opinion_whitelines_2018).

measured(s7, reviewer_opinion_whitelines_2018, fun_spring_edge_hold).

all_consistent(reviewer_opinion_whitelines_2018) :-
    consistent(s7, reviewer_opinion_whitelines_2018).

evidence(all_consistent(reviewer_opinion_whitelines_2018)).
query(true_val(reviewer_opinion_whitelines_2018, fun_spring_edge_hold)).
query(true_val(reviewer_opinion_whitelines_2018, unk_reviewer_opinion_whitelines_2018)).

% @attr aspen_ski_board_editorial
% @type categorical
% @canonical false
% @original_name Aspen Ski and Board editorial
% @values household_name_right_price=Household_name_right_price_freestyle_performance unk_aspen_ski_board_editorial=Unknown
% @importance 0.7

0.55::acc(s48, aspen_ski_board_editorial).

0.48::true_val(aspen_ski_board_editorial, household_name_right_price); 0.52::true_val(aspen_ski_board_editorial, unk_aspen_ski_board_editorial).

measured(s48, aspen_ski_board_editorial, household_name_right_price).

all_consistent(aspen_ski_board_editorial) :-
    (indep(s48), consistent(s48, aspen_ski_board_editorial) ; \+indep(s48)).

evidence(all_consistent(aspen_ski_board_editorial)).
query(true_val(aspen_ski_board_editorial, household_name_right_price)).
query(true_val(aspen_ski_board_editorial, unk_aspen_ski_board_editorial)).

% @attr snowboard_robot_review
% @type categorical
% @canonical false
% @original_name Snowboard Robot review (2018 model)
% @values super_fun_board=Super_fun_board_high_praise_for_value unk_snowboard_robot_review=Unknown
% @importance 0.8

0.60::acc(s49, snowboard_robot_review).

0.45::true_val(snowboard_robot_review, super_fun_board); 0.55::true_val(snowboard_robot_review, unk_snowboard_robot_review).

measured(s49, snowboard_robot_review, super_fun_board).

all_consistent(snowboard_robot_review) :-
    consistent(s49, snowboard_robot_review).

evidence(all_consistent(snowboard_robot_review)).
query(true_val(snowboard_robot_review, super_fun_board)).
query(true_val(snowboard_robot_review, unk_snowboard_robot_review)).

% @attr snowboard_robot_flex_impression
% @type categorical
% @canonical false
% @original_name Snowboard Robot flex impression (2018)
% @values soft_not_too_soft=Soft_flex_not_too_soft_still_stable_riding_fast unk_snowboard_robot_flex_impression=Unknown
% @importance 0.8

0.60::acc(s49, snowboard_robot_flex_impression).

0.45::true_val(snowboard_robot_flex_impression, soft_not_too_soft); 0.55::true_val(snowboard_robot_flex_impression, unk_snowboard_robot_flex_impression).

measured(s49, snowboard_robot_flex_impression, soft_not_too_soft).

all_consistent(snowboard_robot_flex_impression) :-
    consistent(s49, snowboard_robot_flex_impression).

evidence(all_consistent(snowboard_robot_flex_impression)).
query(true_val(snowboard_robot_flex_impression, soft_not_too_soft)).
query(true_val(snowboard_robot_flex_impression, unk_snowboard_robot_flex_impression)).

% @attr snowboard_robot_edge_hold
% @type categorical
% @canonical false
% @original_name Snowboard Robot edge hold
% @values good_for_soft_flex=Good_edge_hold_for_soft_flex_board unk_snowboard_robot_edge_hold=Unknown
% @importance 0.8

0.60::acc(s49, snowboard_robot_edge_hold).

0.45::true_val(snowboard_robot_edge_hold, good_for_soft_flex); 0.55::true_val(snowboard_robot_edge_hold, unk_snowboard_robot_edge_hold).

measured(s49, snowboard_robot_edge_hold, good_for_soft_flex).

all_consistent(snowboard_robot_edge_hold) :-
    consistent(s49, snowboard_robot_edge_hold).

evidence(all_consistent(snowboard_robot_edge_hold)).
query(true_val(snowboard_robot_edge_hold, good_for_soft_flex)).
query(true_val(snowboard_robot_edge_hold, unk_snowboard_robot_edge_hold)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values cheaper_villain=Essentially_cheaper_Villain_similar_features unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.82::acc(s47, comparable_board_same_brand).
0.65::acc(s50, comparable_board_same_brand).

0.90::true_val(comparable_board_same_brand, cheaper_villain); 0.10::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s47, comparable_board_same_brand, cheaper_villain).
measured(s50, comparable_board_same_brand, cheaper_villain).

all_consistent(comparable_board_same_brand) :-
    consistent(s47, comparable_board_same_brand),
    consistent(s50, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, cheaper_villain)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_huck_knife
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Huck Knife)
% @values huck_knife_stiffer_jump=Huck_Knife_quad_camber_stiffer_5_10_carbon_for_jumps unk_comparable_board_same_brand_huck_knife=Unknown
% @importance 0.75

0.68::acc(s51, comparable_board_same_brand_huck_knife).
0.65::acc(s52, comparable_board_same_brand_huck_knife).

0.90::true_val(comparable_board_same_brand_huck_knife, huck_knife_stiffer_jump); 0.10::true_val(comparable_board_same_brand_huck_knife, unk_comparable_board_same_brand_huck_knife).

measured(s51, comparable_board_same_brand_huck_knife, huck_knife_stiffer_jump).
measured(s52, comparable_board_same_brand_huck_knife, huck_knife_stiffer_jump).

all_consistent(comparable_board_same_brand_huck_knife) :-
    consistent(s51, comparable_board_same_brand_huck_knife),
    consistent(s52, comparable_board_same_brand_huck_knife).

evidence(all_consistent(comparable_board_same_brand_huck_knife)).
query(true_val(comparable_board_same_brand_huck_knife, huck_knife_stiffer_jump)).
query(true_val(comparable_board_same_brand_huck_knife, unk_comparable_board_same_brand_huck_knife)).

% @attr comparable_board_same_brand_assassin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Assassin)
% @values assassin_better_carving=Assassin_better_for_high_speed_and_carving unk_comparable_board_same_brand_assassin=Unknown
% @importance 0.85

0.55::acc(s44, comparable_board_same_brand_assassin).

0.34::true_val(comparable_board_same_brand_assassin, assassin_better_carving); 0.66::true_val(comparable_board_same_brand_assassin, unk_comparable_board_same_brand_assassin).

measured(s44, comparable_board_same_brand_assassin, assassin_better_carving).

all_consistent(comparable_board_same_brand_assassin) :-
    consistent(s44, comparable_board_same_brand_assassin).

evidence(all_consistent(comparable_board_same_brand_assassin)).
query(true_val(comparable_board_same_brand_assassin, assassin_better_carving)).
query(true_val(comparable_board_same_brand_assassin, unk_comparable_board_same_brand_assassin)).

% @attr comparable_board_same_brand_craft
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Craft)
% @values craft_do_it_all=Craft_do_it_all_freestyle_directional_twin_cork_sidewalls unk_comparable_board_same_brand_craft=Unknown
% @importance 0.7

0.72::acc(s29, comparable_board_same_brand_craft).

0.50::true_val(comparable_board_same_brand_craft, craft_do_it_all); 0.50::true_val(comparable_board_same_brand_craft, unk_comparable_board_same_brand_craft).

measured(s29, comparable_board_same_brand_craft, craft_do_it_all).

all_consistent(comparable_board_same_brand_craft) :-
    (indep(s29), consistent(s29, comparable_board_same_brand_craft) ; \+indep(s29)).

evidence(all_consistent(comparable_board_same_brand_craft)).
query(true_val(comparable_board_same_brand_craft, craft_do_it_all)).
query(true_val(comparable_board_same_brand_craft, unk_comparable_board_same_brand_craft)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_doa=CAPiTA_DOA_poppy_predictable_safest_park_rec unk_comparable_board_cross_brand=Unknown
% @importance 0.75

0.72::acc(s53, comparable_board_cross_brand).

0.49::true_val(comparable_board_cross_brand, capita_doa); 0.51::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s53, comparable_board_cross_brand, capita_doa).

all_consistent(comparable_board_cross_brand) :-
    consistent(s53, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_twinpig
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Twinpig)
% @values ride_twinpig=Ride_Twinpig_excels_presses_buttering_wide_forgiving unk_comparable_board_cross_brand_twinpig=Unknown
% @importance 0.75

0.72::acc(s53, comparable_board_cross_brand_twinpig).

0.49::true_val(comparable_board_cross_brand_twinpig, ride_twinpig); 0.51::true_val(comparable_board_cross_brand_twinpig, unk_comparable_board_cross_brand_twinpig).

measured(s53, comparable_board_cross_brand_twinpig, ride_twinpig).

all_consistent(comparable_board_cross_brand_twinpig) :-
    consistent(s53, comparable_board_cross_brand_twinpig).

evidence(all_consistent(comparable_board_cross_brand_twinpig)).
query(true_val(comparable_board_cross_brand_twinpig, ride_twinpig)).
query(true_val(comparable_board_cross_brand_twinpig, unk_comparable_board_cross_brand_twinpig)).

% @attr best_park_boards_2026_list
% @type categorical
% @canonical false
% @original_name Best park boards 2026 list
% @values huck_knife_not_sleepwalker=Lists_Huck_Knife_not_Sleepwalker_more_jib_focused unk_best_park_boards_2026_list=Unknown
% @importance 0.75

0.72::acc(s53, best_park_boards_2026_list).

0.49::true_val(best_park_boards_2026_list, huck_knife_not_sleepwalker); 0.51::true_val(best_park_boards_2026_list, unk_best_park_boards_2026_list).

measured(s53, best_park_boards_2026_list, huck_knife_not_sleepwalker).

all_consistent(best_park_boards_2026_list) :-
    consistent(s53, best_park_boards_2026_list).

evidence(all_consistent(best_park_boards_2026_list)).
query(true_val(best_park_boards_2026_list, huck_knife_not_sleepwalker)).
query(true_val(best_park_boards_2026_list, unk_best_park_boards_2026_list)).

% @attr manufacturer_reputation
% @type categorical
% @canonical false
% @original_name Manufacturer reputation
% @values trusted_name=Trusted_name_enhancing_outdoor_performance unk_manufacturer_reputation=Unknown
% @importance 0.35

0.65::acc(s5, manufacturer_reputation).

0.60::true_val(manufacturer_reputation, trusted_name); 0.40::true_val(manufacturer_reputation, unk_manufacturer_reputation).

measured(s5, manufacturer_reputation, trusted_name).

all_consistent(manufacturer_reputation) :-
    consistent(s5, manufacturer_reputation).

evidence(all_consistent(manufacturer_reputation)).
query(true_val(manufacturer_reputation, trusted_name)).
query(true_val(manufacturer_reputation, unk_manufacturer_reputation)).

% @attr brand_history
% @type categorical
% @canonical false
% @original_name Brand history
% @values over_75_years=Over_75_years_outdoor_sports_innovation unk_brand_history=Unknown
% @importance 0.35

0.65::acc(s5, brand_history).

0.60::true_val(brand_history, over_75_years); 0.40::true_val(brand_history, unk_brand_history).

measured(s5, brand_history, over_75_years).

all_consistent(brand_history) :-
    consistent(s5, brand_history).

evidence(all_consistent(brand_history)).
query(true_val(brand_history, over_75_years)).
query(true_val(brand_history, unk_brand_history)).

% @attr retailer_perception
% @type categorical
% @canonical false
% @original_name Retailer perception
% @values widely_stocked=Widely_stocked_at_major_specialty_retailers unk_retailer_perception=Unknown
% @importance 0.75

0.85::acc(s12, retailer_perception).
0.78::acc(s19, retailer_perception).

0.90::true_val(retailer_perception, widely_stocked); 0.10::true_val(retailer_perception, unk_retailer_perception).

measured(s12, retailer_perception, widely_stocked).
measured(s19, retailer_perception, widely_stocked).

all_consistent(retailer_perception) :-
    consistent(s12, retailer_perception),
    consistent(s19, retailer_perception).

evidence(all_consistent(retailer_perception)).
query(true_val(retailer_perception, widely_stocked)).
query(true_val(retailer_perception, unk_retailer_perception)).

% @attr evo_retailer_reputation
% @type categorical
% @canonical false
% @original_name evo.com retailer reputation
% @values major_us_retailer=Major_US_retailer_price_match_free_ship_1yr_returns unk_evo_retailer_reputation=Unknown
% @importance 0.9

0.88::acc(s12, evo_retailer_reputation).

0.85::true_val(evo_retailer_reputation, major_us_retailer); 0.15::true_val(evo_retailer_reputation, unk_evo_retailer_reputation).

measured(s12, evo_retailer_reputation, major_us_retailer).

all_consistent(evo_retailer_reputation) :-
    consistent(s12, evo_retailer_reputation).

evidence(all_consistent(evo_retailer_reputation)).
query(true_val(evo_retailer_reputation, major_us_retailer)).
query(true_val(evo_retailer_reputation, unk_evo_retailer_reputation)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_all_mountain=Not_suitable_for_aggressive_all_mountain_or_high_speed unk_negative_aspect=Unknown
% @importance 0.85

0.55::acc(s44, negative_aspect).

0.34::true_val(negative_aspect, not_all_mountain); 0.66::true_val(negative_aspect, unk_negative_aspect).

measured(s44, negative_aspect, not_all_mountain).

all_consistent(negative_aspect) :-
    consistent(s44, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_all_mountain)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_dampening
% @type categorical
% @canonical false
% @original_name negative_aspect (dampening)
% @values limited_dampening=Limited_dampening_stability_vs_stiffer_boards unk_negative_aspect_dampening=Unknown
% @importance 0.85

0.55::acc(s44, negative_aspect_dampening).

0.34::true_val(negative_aspect_dampening, limited_dampening); 0.66::true_val(negative_aspect_dampening, unk_negative_aspect_dampening).

measured(s44, negative_aspect_dampening, limited_dampening).

all_consistent(negative_aspect_dampening) :-
    consistent(s44, negative_aspect_dampening).

evidence(all_consistent(negative_aspect_dampening)).
query(true_val(negative_aspect_dampening, limited_dampening)).
query(true_val(negative_aspect_dampening, unk_negative_aspect_dampening)).

% @attr negative_aspect_no_carbon
% @type categorical
% @canonical false
% @original_name negative_aspect (no carbon)
% @values no_carbon=No_carbon_reinforcement_BA_MD_biax_only unk_negative_aspect_no_carbon=Unknown
% @importance 0.8

0.80::acc(s38, negative_aspect_no_carbon).
0.68::acc(s51, negative_aspect_no_carbon).

0.90::true_val(negative_aspect_no_carbon, no_carbon); 0.10::true_val(negative_aspect_no_carbon, unk_negative_aspect_no_carbon).

measured(s38, negative_aspect_no_carbon, no_carbon).
measured(s51, negative_aspect_no_carbon, no_carbon).

all_consistent(negative_aspect_no_carbon) :-
    (indep(s8), consistent(s38, negative_aspect_no_carbon) ; \+indep(s8)),
    consistent(s51, negative_aspect_no_carbon).

evidence(all_consistent(negative_aspect_no_carbon)).
query(true_val(negative_aspect_no_carbon, no_carbon)).
query(true_val(negative_aspect_no_carbon, unk_negative_aspect_no_carbon)).