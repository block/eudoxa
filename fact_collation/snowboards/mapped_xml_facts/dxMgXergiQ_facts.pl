0.15::indep(s_merchant).
0.20::indep(s19).
0.15::indep(s10).
0.20::indep(s24).
0.25::indep(s30).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values jones_snowboards=Jones_Snowboards unk_brand=Unknown
% @importance 0.6

0.81::true_val(brand, jones_snowboards); 0.19::true_val(brand, unk_brand).
0.90::acc(s1, brand).
measured(s1, brand, jones_snowboards).
all_consistent(brand) :- consistent(s1, brand).
evidence(all_consistent(brand)).
query(true_val(brand, jones_snowboards)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values mens_tweaker_2_0=Mens_Tweaker_2.0 unk_model_name=Unknown
% @importance 0.9

0.93::true_val(model_name, mens_tweaker_2_0); 0.07::true_val(model_name, unk_model_name).
0.92::acc(s_merchant, model_name).
measured(s_merchant, model_name, mens_tweaker_2_0).
all_consistent(model_name) :- consistent(s_merchant, model_name).
evidence(all_consistent(model_name)).
query(true_val(model_name, mens_tweaker_2_0)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.9

0.93::true_val(model_year, y2027); 0.07::true_val(model_year, unk_model_year).
0.92::acc(s_merchant, model_year).
measured(s_merchant, model_year, y2027).
all_consistent(model_year) :- consistent(s_merchant, model_year).
evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values jones_tweaker_original=Jones_Tweaker_original_2022_23 unk_predecessor_model_name=Unknown
% @importance 0.5

0.77::true_val(predecessor_model_name, jones_tweaker_original); 0.23::true_val(predecessor_model_name, unk_predecessor_model_name).
0.82::acc(s3, predecessor_model_name).
measured(s3, predecessor_model_name, jones_tweaker_original).
all_consistent(predecessor_model_name) :- consistent(s3, predecessor_model_name).
evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, jones_tweaker_original)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values y2027_redesign=2027_first_year_of_2.0_redesign unk_redesign_year=Unknown
% @importance 0.77

0.95::true_val(redesign_year, y2027_redesign); 0.05::true_val(redesign_year, unk_redesign_year).
0.88::acc(s4, redesign_year).
0.75::acc(s30, redesign_year).
measured(s4, redesign_year, y2027_redesign).
measured(s30, redesign_year, y2027_redesign).
all_consistent(redesign_year) :-
    consistent(s4, redesign_year),
    (indep(s30), consistent(s30, redesign_year) ; \+indep(s30)).
evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, y2027_redesign)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.9

0.93::true_val(product_type, snowboard); 0.07::true_val(product_type, unk_product_type).
0.95::acc(s_merchant, product_type).
measured(s_merchant, product_type, snowboard).
all_consistent(product_type) :- consistent(s_merchant, product_type).
evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_am_freestyle=Freestyle_All_mountain_freestyle unk_board_category=Unknown
% @importance 0.9

0.93::true_val(board_category, freestyle_am_freestyle); 0.07::true_val(board_category, unk_board_category).
0.90::acc(s_merchant, board_category).
measured(s_merchant, board_category, freestyle_am_freestyle).
all_consistent(board_category) :- consistent(s_merchant, board_category).
evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_am_freestyle)).
query(true_val(board_category, unk_board_category)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values jones_nidecker=Jones_Snowboards_Nidecker_US_Inc unk_manufacturer=Unknown
% @importance 0.4

0.90::true_val(manufacturer, jones_nidecker); 0.10::true_val(manufacturer, unk_manufacturer).
0.93::acc(s5, manufacturer).
measured(s5, manufacturer, jones_nidecker).
all_consistent(manufacturer) :- consistent(s5, manufacturer).
evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, jones_nidecker)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr company_founded
% @type categorical
% @canonical false
% @original_name Company founded
% @values y2010=2010 unk_company_founded=Unknown
% @importance 0.5

0.63::true_val(company_founded, y2010); 0.37::true_val(company_founded, unk_company_founded).
0.70::acc(s6, company_founded).
measured(s6, company_founded, y2010).
all_consistent(company_founded) :- consistent(s6, company_founded).
evidence(all_consistent(company_founded)).
query(true_val(company_founded, y2010)).
query(true_val(company_founded, unk_company_founded)).

% @attr founder
% @type categorical
% @canonical false
% @original_name Founder
% @values jeremy_jones=Jeremy_Jones unk_founder=Unknown
% @importance 0.4

0.81::true_val(founder, jeremy_jones); 0.19::true_val(founder, unk_founder).
0.88::acc(s7, founder).
measured(s7, founder, jeremy_jones).
all_consistent(founder) :- consistent(s7, founder).
evidence(all_consistent(founder)).
query(true_val(founder, jeremy_jones)).
query(true_val(founder, unk_founder)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values nidecker_group=Nidecker_Group_NDK unk_parent_company=Unknown
% @importance 0.5

0.63::true_val(parent_company, nidecker_group); 0.37::true_val(parent_company, unk_parent_company).
0.70::acc(s6, parent_company).
measured(s6, parent_company, nidecker_group).
all_consistent(parent_company) :- consistent(s6, parent_company).
evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values dubai_sws=Dubai_SWS_Board_Technology unk_manufacturing_location=Unknown
% @importance 0.55

0.95::true_val(manufacturing_location, dubai_sws); 0.05::true_val(manufacturing_location, unk_manufacturing_location).
0.70::acc(s6, manufacturing_location).
0.92::acc(s8, manufacturing_location).
measured(s6, manufacturing_location, dubai_sws).
measured(s8, manufacturing_location, dubai_sws).
all_consistent(manufacturing_location) :-
    consistent(s6, manufacturing_location),
    consistent(s8, manufacturing_location).
evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, dubai_sws)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fair_trade_certified=Fair_Trade_Certified_first_snowboard_brand unk_sustainability_certification=Unknown
% @importance 0.6

0.90::true_val(sustainability_certification, fair_trade_certified); 0.10::true_val(sustainability_certification, unk_sustainability_certification).
0.93::acc(s8, sustainability_certification).
measured(s8, sustainability_certification, fair_trade_certified).
all_consistent(sustainability_certification) :- consistent(s8, sustainability_certification).
evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fair_trade_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_solar
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values solar_100=100_percent_solar_power unk_sustainability_certification_solar=Unknown
% @importance 0.55

0.77::true_val(sustainability_certification_solar, solar_100); 0.23::true_val(sustainability_certification_solar, unk_sustainability_certification_solar).
0.82::acc(s9, sustainability_certification_solar).
measured(s9, sustainability_certification_solar, solar_100).
all_consistent(sustainability_certification_solar) :- consistent(s9, sustainability_certification_solar).
evidence(all_consistent(sustainability_certification_solar)).
query(true_val(sustainability_certification_solar, solar_100)).
query(true_val(sustainability_certification_solar, unk_sustainability_certification_solar)).

% @attr sustainability_certification_eco
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values eco_performance=Bio_resin_recycled_sidewalls_edges_sustainably_sourced_wood unk_sustainability_certification_eco=Unknown
% @importance 0.55

0.64::true_val(sustainability_certification_eco, eco_performance); 0.36::true_val(sustainability_certification_eco, unk_sustainability_certification_eco).
0.72::acc(s10, sustainability_certification_eco).
measured(s10, sustainability_certification_eco, eco_performance).
all_consistent(sustainability_certification_eco) :- consistent(s10, sustainability_certification_eco).
evidence(all_consistent(sustainability_certification_eco)).
query(true_val(sustainability_certification_eco, eco_performance)).
query(true_val(sustainability_certification_eco, unk_sustainability_certification_eco)).

% @attr sustainability_certification_donation
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values one_pct_revenue=1pct_revenue_to_Protect_Our_Winters unk_sustainability_certification_donation=Unknown
% @importance 0.45

0.86::true_val(sustainability_certification_donation, one_pct_revenue); 0.14::true_val(sustainability_certification_donation, unk_sustainability_certification_donation).
0.88::acc(s11, sustainability_certification_donation).
measured(s11, sustainability_certification_donation, one_pct_revenue).
all_consistent(sustainability_certification_donation) :- consistent(s11, sustainability_certification_donation).
evidence(all_consistent(sustainability_certification_donation)).
query(true_val(sustainability_certification_donation, one_pct_revenue)).
query(true_val(sustainability_certification_donation, unk_sustainability_certification_donation)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values jimmy_goodman=Jimmy_Goodman unk_pro_rider_name=Unknown
% @importance 0.35

0.90::true_val(pro_rider_name, jimmy_goodman); 0.10::true_val(pro_rider_name, unk_pro_rider_name).
0.93::acc(s12, pro_rider_name).
measured(s12, pro_rider_name, jimmy_goodman).
all_consistent(pro_rider_name) :- consistent(s12, pro_rider_name).
evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, jimmy_goodman)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v949_99=949.99 unk_price_aud_merchant=Unknown
% @importance 0.9

0.93::true_val(price_aud_merchant, v949_99); 0.07::true_val(price_aud_merchant, unk_price_aud_merchant).
0.95::acc(s_merchant, price_aud_merchant).
measured(s_merchant, price_aud_merchant, v949_99).
all_consistent(price_aud_merchant) :- consistent(s_merchant, price_aud_merchant).
evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v949_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v529_95=529.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.87::true_val(price_usd_msrp, v529_95); 0.13::true_val(price_usd_msrp, unk_price_usd_msrp).
0.93::acc(s13, price_usd_msrp).
measured(s13, price_usd_msrp, v529_95).
all_consistent(price_usd_msrp) :- consistent(s13, price_usd_msrp).
evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v529_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values tweaker_pro=Tweaker_Pro_649.95USD_stiffer_7_10_flex_Koroyd_dampened unk_comparable_board_same_brand=Unknown
% @importance 0.78

0.95::true_val(comparable_board_same_brand, tweaker_pro); 0.05::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).
0.78::acc(s14, comparable_board_same_brand).
0.80::acc(s35, comparable_board_same_brand).
measured(s14, comparable_board_same_brand, tweaker_pro).
measured(s35, comparable_board_same_brand, tweaker_pro).
all_consistent(comparable_board_same_brand) :-
    consistent(s14, comparable_board_same_brand),
    consistent(s35, comparable_board_same_brand).
evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, tweaker_pro)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v423_96_to_503_96=423.96-503.96 unk_price_usd_backcountry=Unknown
% @importance 0.8

0.46::true_val(price_usd_backcountry, v423_96_to_503_96); 0.54::true_val(price_usd_backcountry, unk_price_usd_backcountry).
0.60::acc(s15, price_usd_backcountry).
measured(s15, price_usd_backcountry, v423_96_to_503_96).
all_consistent(price_usd_backcountry) :- consistent(s15, price_usd_backcountry).
evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v423_96_to_503_96)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status
% @values discontinued_2024_25=Discontinued_prior_year_model unk_availability_status_rei=Unknown
% @importance 0.6

0.68::true_val(availability_status_rei, discontinued_2024_25); 0.32::true_val(availability_status_rei, unk_availability_status_rei).
0.82::acc(s16, availability_status_rei).
measured(s16, availability_status_rei, discontinued_2024_25).
all_consistent(availability_status_rei) :- consistent(s16, availability_status_rei).
evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, discontinued_2024_25)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values early_june_2026=Early_June_2026 unk_estimated_availability_date=Unknown
% @importance 0.8

0.90::true_val(estimated_availability_date, early_june_2026); 0.10::true_val(estimated_availability_date, unk_estimated_availability_date).
0.90::acc(s_merchant, estimated_availability_date).
0.85::acc(s17, estimated_availability_date).
measured(s_merchant, estimated_availability_date, early_june_2026).
measured(s17, estimated_availability_date, early_june_2026).
all_consistent(estimated_availability_date) :-
    consistent(s_merchant, estimated_availability_date),
    consistent(s17, estimated_availability_date).
evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, early_june_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder_june_2026=Pre_order_expected_arrival_early_June_2026 unk_availability_status=Unknown
% @importance 0.75

0.90::true_val(availability_status, preorder_june_2026); 0.10::true_val(availability_status, unk_availability_status).
0.85::acc(s17, availability_status).
measured(s17, availability_status, preorder_june_2026).
all_consistent(availability_status) :- consistent(s17, availability_status).
evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder_june_2026)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_ballistyx
% @type categorical
% @canonical false
% @original_name availability_status
% @values preorder_limited=Pre_order_limited_allocation_bonus_tshirt unk_availability_status_ballistyx=Unknown
% @importance 0.5

0.60::true_val(availability_status_ballistyx, preorder_limited); 0.40::true_val(availability_status_ballistyx, unk_availability_status_ballistyx).
0.70::acc(s18, availability_status_ballistyx).
measured(s18, availability_status_ballistyx, preorder_limited).
all_consistent(availability_status_ballistyx) :- consistent(s18, availability_status_ballistyx).
evidence(all_consistent(availability_status_ballistyx)).
query(true_val(availability_status_ballistyx, preorder_limited)).
query(true_val(availability_status_ballistyx, unk_availability_status_ballistyx)).

% @attr availability_status_nzshred
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_for_order=Available_for_order_NZ_authorized unk_availability_status_nzshred=Unknown
% @importance 0.6

0.63::true_val(availability_status_nzshred, available_for_order); 0.37::true_val(availability_status_nzshred, unk_availability_status_nzshred).
0.72::acc(s19, availability_status_nzshred).
measured(s19, availability_status_nzshred, available_for_order).
all_consistent(availability_status_nzshred) :- consistent(s19, availability_status_nzshred).
evidence(all_consistent(availability_status_nzshred)).
query(true_val(availability_status_nzshred, available_for_order)).
query(true_val(availability_status_nzshred, unk_availability_status_nzshred)).

% @attr availability_status_basenz
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_for_order_nz=Available_for_order_NZ unk_availability_status_basenz=Unknown
% @importance 0.5

0.55::true_val(availability_status_basenz, available_for_order_nz); 0.45::true_val(availability_status_basenz, unk_availability_status_basenz).
0.65::acc(s20, availability_status_basenz).
measured(s20, availability_status_basenz, available_for_order_nz).
all_consistent(availability_status_basenz) :- consistent(s20, availability_status_basenz).
evidence(all_consistent(availability_status_basenz)).
query(true_val(availability_status_basenz, available_for_order_nz)).
query(true_val(availability_status_basenz, unk_availability_status_basenz)).

% @attr availability_status_milosport
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_pickup=Available_to_order_pickup_available unk_availability_status_milosport=Unknown
% @importance 0.5

0.56::true_val(availability_status_milosport, available_pickup); 0.44::true_val(availability_status_milosport, unk_availability_status_milosport).
0.70::acc(s21, availability_status_milosport).
measured(s21, availability_status_milosport, available_pickup).
all_consistent(availability_status_milosport) :- consistent(s21, availability_status_milosport).
evidence(all_consistent(availability_status_milosport)).
query(true_val(availability_status_milosport, available_pickup)).
query(true_val(availability_status_milosport, unk_availability_status_milosport)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_2026=2026_model_in_stock_2027_not_listed unk_availability_status_evo=Unknown
% @importance 0.65

0.68::true_val(availability_status_evo, in_stock_2026); 0.32::true_val(availability_status_evo, unk_availability_status_evo).
0.80::acc(s22, availability_status_evo).
measured(s22, availability_status_evo, in_stock_2026).
all_consistent(availability_status_evo) :- consistent(s22, availability_status_evo).
evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_2026)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values y2_plus_1=2_year_warranty_plus_1_free_year_extension unk_warranty=Unknown
% @importance 0.8

0.90::true_val(warranty, y2_plus_1); 0.10::true_val(warranty, unk_warranty).
0.95::acc(s23, warranty).
measured(s23, warranty, y2_plus_1).
all_consistent(warranty) :- consistent(s23, warranty).
evidence(all_consistent(warranty)).
query(true_val(warranty, y2_plus_1)).
query(true_val(warranty, unk_warranty)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values d30_new_unused=30_day_returns_new_unused_buyer_covers_shipping unk_return_policy_terms=Unknown
% @importance 1.0

0.87::true_val(return_policy_terms, d30_new_unused); 0.13::true_val(return_policy_terms, unk_return_policy_terms).
0.90::acc(s13, return_policy_terms).
measured(s13, return_policy_terms, d30_new_unused).
all_consistent(return_policy_terms) :- consistent(s13, return_policy_terms).
evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, d30_new_unused)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.85

0.93::true_val(gender, mens); 0.07::true_val(gender, unk_gender).
0.95::acc(s_merchant, gender).
measured(s_merchant, gender, mens).
all_consistent(gender) :- consistent(s_merchant, gender).
evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_to_expert=Intermediate_to_Expert unk_rider_level=Unknown
% @importance 0.93

0.95::true_val(rider_level, intermediate_to_expert); 0.05::true_val(rider_level, unk_rider_level).
0.88::acc(s13, rider_level).
0.85::acc(s_merchant, rider_level).
measured(s13, rider_level, intermediate_to_expert).
measured(s_merchant, rider_level, intermediate_to_expert).
all_consistent(rider_level) :-
    consistent(s13, rider_level),
    (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)).
evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_to_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v8=8.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 0.9

0.90::true_val(terrain_suitability_all_mountain, v8); 0.10::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).
0.85::acc(s_merchant, terrain_suitability_all_mountain).
measured(s_merchant, terrain_suitability_all_mountain, v8).
all_consistent(terrain_suitability_all_mountain) :- consistent(s_merchant, terrain_suitability_all_mountain).
evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v8)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v6=6.0 unk_terrain_suitability_powder=Unknown
% @importance 0.9

0.90::true_val(terrain_suitability_powder, v6); 0.10::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).
0.85::acc(s_merchant, terrain_suitability_powder).
measured(s_merchant, terrain_suitability_powder, v6).
all_consistent(terrain_suitability_powder) :- consistent(s_merchant, terrain_suitability_powder).
evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v6)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability
% @values v10=10.0 unk_terrain_suitability=Unknown
% @importance 0.9

0.90::true_val(terrain_suitability, v10); 0.10::true_val(terrain_suitability, unk_terrain_suitability).
0.85::acc(s_merchant, terrain_suitability).
measured(s_merchant, terrain_suitability, v10).
all_consistent(terrain_suitability) :- consistent(s_merchant, terrain_suitability).
evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v10)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v4=4.0 unk_flex_rating_10=Unknown
% @importance 0.93

0.95::true_val(flex_rating_10, v4); 0.05::true_val(flex_rating_10, unk_flex_rating_10).
0.90::acc(s13, flex_rating_10).
0.85::acc(s_merchant, flex_rating_10).
measured(s13, flex_rating_10, v4).
measured(s_merchant, flex_rating_10, v4).
all_consistent(flex_rating_10) :-
    consistent(s13, flex_rating_10),
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)).
evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_soft=Mid_soft_friendly_flex_playful unk_flex_feel=Unknown
% @importance 0.85

0.68::true_val(flex_feel, mid_soft); 0.32::true_val(flex_feel, unk_flex_feel).
0.75::acc(s24, flex_feel).
measured(s24, flex_feel, mid_soft).
all_consistent(flex_feel) :- consistent(s24, flex_feel).
evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_soft)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values soft_center_stiff_tips=Softer_between_feet_stiffer_in_tips unk_flex_direction=Unknown
% @importance 1.0

0.87::true_val(flex_direction, soft_center_stiff_tips); 0.13::true_val(flex_direction, unk_flex_direction).
0.93::acc(s13, flex_direction).
measured(s13, flex_direction, soft_center_stiff_tips).
all_consistent(flex_direction) :- consistent(s13, flex_direction).
evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, soft_center_stiff_tips)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values true_camber=True_Camber unk_camber_type=Unknown
% @importance 0.93

0.95::true_val(camber_type, true_camber); 0.05::true_val(camber_type, unk_camber_type).
0.93::acc(s13, camber_type).
0.88::acc(s_merchant, camber_type).
measured(s13, camber_type, true_camber).
measured(s_merchant, camber_type, true_camber).
all_consistent(camber_type) :-
    consistent(s13, camber_type),
    (indep(s_merchant), consistent(s_merchant, camber_type) ; \+indep(s_merchant)).
evidence(all_consistent(camber_type)).
query(true_val(camber_type, true_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin_symmetrical unk_shape=Unknown
% @importance 0.93

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).
0.93::acc(s13, shape).
0.88::acc(s_merchant, shape).
measured(s13, shape, true_twin).
measured(s_merchant, shape, true_twin).
all_consistent(shape) :-
    consistent(s13, shape),
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)).
evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values medium_3d_contour_flip_tips=Medium_3D_Contour_Base_Dual_Radius_Flip_Tips_4mm_spoon unk_camber_description=Unknown
% @importance 0.8

0.95::true_val(camber_description, medium_3d_contour_flip_tips); 0.05::true_val(camber_description, unk_camber_description).
0.88::acc(s_merchant, camber_description).
0.78::acc(s19, camber_description).
measured(s_merchant, camber_description, medium_3d_contour_flip_tips).
measured(s19, camber_description, medium_3d_contour_flip_tips).
all_consistent(camber_description) :-
    consistent(s_merchant, camber_description),
    (indep(s19), consistent(s19, camber_description) ; \+indep(s19)).
evidence(all_consistent(camber_description)).
query(true_val(camber_description, medium_3d_contour_flip_tips)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_2027_update
% @type categorical
% @canonical false
% @original_name camber_description
% @values bevel_increase=Base_bevel_increases_outside_contact_points_added_stability unk_camber_description_2027_update=Unknown
% @importance 0.85

0.81::true_val(camber_description_2027_update, bevel_increase); 0.19::true_val(camber_description_2027_update, unk_camber_description_2027_update).
0.85::acc(s4, camber_description_2027_update).
measured(s4, camber_description_2027_update, bevel_increase).
all_consistent(camber_description_2027_update) :- consistent(s4, camber_description_2027_update).
evidence(all_consistent(camber_description_2027_update)).
query(true_val(camber_description_2027_update, bevel_increase)).
query(true_val(camber_description_2027_update, unk_camber_description_2027_update)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v0=0.0 unk_taper=Unknown
% @importance 0.93

0.95::true_val(taper, v0); 0.05::true_val(taper, unk_taper).
0.93::acc(s13, taper).
0.88::acc(s_merchant, taper).
measured(s13, taper, v0).
measured(s_merchant, taper, v0).
all_consistent(taper) :-
    consistent(s13, taper),
    (indep(s_merchant), consistent(s_merchant, taper) ; \+indep(s_merchant)).
evidence(all_consistent(taper)).
query(true_val(taper, v0)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 1.0

0.87::true_val(setback, v0); 0.13::true_val(setback, unk_setback).
0.93::acc(s13, setback).
measured(s13, setback, v0).
all_consistent(setback) :- consistent(s13, setback).
evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.93

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).
0.93::acc(s13, mounting_pattern).
0.88::acc(s_merchant, mounting_pattern).
measured(s13, mounting_pattern, inserts_2x4).
measured(s_merchant, mounting_pattern, inserts_2x4).
all_consistent(mounting_pattern) :-
    consistent(s13, mounting_pattern),
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)).
evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.90::true_val(width_options, standard_and_wide); 0.10::true_val(width_options, unk_width_options).
0.90::acc(s_merchant, width_options).
measured(s_merchant, width_options, standard_and_wide).
all_consistent(width_options) :- consistent(s_merchant, width_options).
evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_4_2027=154_156_157W_160W sizes_9_2026=146_149_151_154_156_157W_159_160W_162
% @importance 0.93

0.55::true_val(available_sizes, sizes_4_2027); 0.45::true_val(available_sizes, sizes_9_2026).
0.90::acc(s_merchant, available_sizes).
0.88::acc(s13, available_sizes).
measured(s_merchant, available_sizes, sizes_4_2027).
measured(s13, available_sizes, sizes_9_2026).
all_consistent(available_sizes) :-
    consistent(s13, available_sizes),
    (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)).
evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_4_2027)).
query(true_val(available_sizes, sizes_9_2026)).

% @attr effective_edge_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 154cm
% @values v120_0=120.0 v119=119.0
% @importance 0.93

0.55::true_val(effective_edge_154, v120_0); 0.45::true_val(effective_edge_154, v119).
0.90::acc(s_merchant, effective_edge_154).
0.88::acc(s13, effective_edge_154).
measured(s_merchant, effective_edge_154, v120_0).
measured(s13, effective_edge_154, v119).
all_consistent(effective_edge_154) :-
    consistent(s13, effective_edge_154),
    (indep(s_merchant), consistent(s_merchant, effective_edge_154) ; \+indep(s_merchant)).
evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v120_0)).
query(true_val(effective_edge_154, v119)).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 156cm
% @values v121_6=121.6 unk_effective_edge_156=Unknown
% @importance 0.85

0.90::true_val(effective_edge_156, v121_6); 0.10::true_val(effective_edge_156, unk_effective_edge_156).
0.90::acc(s_merchant, effective_edge_156).
measured(s_merchant, effective_edge_156, v121_6).
all_consistent(effective_edge_156) :- consistent(s_merchant, effective_edge_156).
evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v121_6)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr effective_edge_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 157W
% @values v122_6=122.6 unk_effective_edge_157w=Unknown
% @importance 0.85

0.90::true_val(effective_edge_157w, v122_6); 0.10::true_val(effective_edge_157w, unk_effective_edge_157w).
0.90::acc(s_merchant, effective_edge_157w).
measured(s_merchant, effective_edge_157w, v122_6).
all_consistent(effective_edge_157w) :- consistent(s_merchant, effective_edge_157w).
evidence(all_consistent(effective_edge_157w)).
query(true_val(effective_edge_157w, v122_6)).
query(true_val(effective_edge_157w, unk_effective_edge_157w)).

% @attr effective_edge_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge 160W
% @values v125_0=125.0 unk_effective_edge_160w=Unknown
% @importance 0.85

0.90::true_val(effective_edge_160w, v125_0); 0.10::true_val(effective_edge_160w, unk_effective_edge_160w).
0.90::acc(s_merchant, effective_edge_160w).
measured(s_merchant, effective_edge_160w, v125_0).
all_consistent(effective_edge_160w) :- consistent(s_merchant, effective_edge_160w).
evidence(all_consistent(effective_edge_160w)).
query(true_val(effective_edge_160w, v125_0)).
query(true_val(effective_edge_160w, unk_effective_edge_160w)).

% @attr tip_tail_width_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v29_8=29.8 unk_tip_tail_width_size_154=Unknown
% @importance 0.85

0.90::true_val(tip_tail_width_size_154, v29_8); 0.10::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).
0.90::acc(s_merchant, tip_tail_width_size_154).
measured(s_merchant, tip_tail_width_size_154, v29_8).
all_consistent(tip_tail_width_size_154) :- consistent(s_merchant, tip_tail_width_size_154).
evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v29_8)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v30_0=30.0 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.90::true_val(tip_tail_width_size, v30_0); 0.10::true_val(tip_tail_width_size, unk_tip_tail_width_size).
0.90::acc(s_merchant, tip_tail_width_size).
measured(s_merchant, tip_tail_width_size, v30_0).
all_consistent(tip_tail_width_size) :- consistent(s_merchant, tip_tail_width_size).
evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_0)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v31_0=31.0 unk_tip_tail_width_size_157w=Unknown
% @importance 0.85

0.90::true_val(tip_tail_width_size_157w, v31_0); 0.10::true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w).
0.90::acc(s_merchant, tip_tail_width_size_157w).
measured(s_merchant, tip_tail_width_size_157w, v31_0).
all_consistent(tip_tail_width_size_157w) :- consistent(s_merchant, tip_tail_width_size_157w).
evidence(all_consistent(tip_tail_width_size_157w)).
query(true_val(tip_tail_width_size_157w, v31_0)).
query(true_val(tip_tail_width_size_157w, unk_tip_tail_width_size_157w)).

% @attr tip_tail_width_size_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size
% @values v31_4=31.4 unk_tip_tail_width_size_160w=Unknown
% @importance 0.85

0.90::true_val(tip_tail_width_size_160w, v31_4); 0.10::true_val(tip_tail_width_size_160w, unk_tip_tail_width_size_160w).
0.90::acc(s_merchant, tip_tail_width_size_160w).
measured(s_merchant, tip_tail_width_size_160w, v31_4).
all_consistent(tip_tail_width_size_160w) :- consistent(s_merchant, tip_tail_width_size_160w).
evidence(all_consistent(tip_tail_width_size_160w)).
query(true_val(tip_tail_width_size_160w, v31_4)).
query(true_val(tip_tail_width_size_160w, unk_tip_tail_width_size_160w)).

% @attr waist_width_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 154cm
% @values v25_2=25.2 v25_1=25.1
% @importance 0.93

0.55::true_val(waist_width_154, v25_2); 0.45::true_val(waist_width_154, v25_1).
0.90::acc(s_merchant, waist_width_154).
0.88::acc(s13, waist_width_154).
measured(s_merchant, waist_width_154, v25_2).
measured(s13, waist_width_154, v25_1).
all_consistent(waist_width_154) :-
    consistent(s13, waist_width_154),
    (indep(s_merchant), consistent(s_merchant, waist_width_154) ; \+indep(s_merchant)).
evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_2)).
query(true_val(waist_width_154, v25_1)).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v25_4=25.4 unk_waist_width_156=Unknown
% @importance 0.85

0.90::true_val(waist_width_156, v25_4); 0.10::true_val(waist_width_156, unk_waist_width_156).
0.90::acc(s_merchant, waist_width_156).
measured(s_merchant, waist_width_156, v25_4).
all_consistent(waist_width_156) :- consistent(s_merchant, waist_width_156).
evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_4)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr waist_width_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 157W
% @values v26_3=26.3 unk_waist_width_157w=Unknown
% @importance 0.85

0.90::true_val(waist_width_157w, v26_3); 0.10::true_val(waist_width_157w, unk_waist_width_157w).
0.90::acc(s_merchant, waist_width_157w).
measured(s_merchant, waist_width_157w, v26_3).
all_consistent(waist_width_157w) :- consistent(s_merchant, waist_width_157w).
evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_3)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

% @attr waist_width_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 160W
% @values v26_6=26.6 unk_waist_width_160w=Unknown
% @importance 0.85

0.90::true_val(waist_width_160w, v26_6); 0.10::true_val(waist_width_160w, unk_waist_width_160w).
0.90::acc(s_merchant, waist_width_160w).
measured(s_merchant, waist_width_160w, v26_6).
all_consistent(waist_width_160w) :- consistent(s_merchant, waist_width_160w).
evidence(all_consistent(waist_width_160w)).
query(true_val(waist_width_160w, v26_6)).
query(true_val(waist_width_160w, unk_waist_width_160w)).

% @attr sidecut_radius_size_154
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_5=7.5 unk_sidecut_radius_size_154=Unknown
% @importance 0.85

0.90::true_val(sidecut_radius_size_154, v7_5); 0.10::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).
0.90::acc(s_merchant, sidecut_radius_size_154).
measured(s_merchant, sidecut_radius_size_154, v7_5).
all_consistent(sidecut_radius_size_154) :- consistent(s_merchant, sidecut_radius_size_154).
evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_5)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_6=7.6 unk_sidecut_radius_size=Unknown
% @importance 0.85

0.90::true_val(sidecut_radius_size, v7_6); 0.10::true_val(sidecut_radius_size, unk_sidecut_radius_size).
0.90::acc(s_merchant, sidecut_radius_size).
measured(s_merchant, sidecut_radius_size, v7_6).
all_consistent(sidecut_radius_size) :- consistent(s_merchant, sidecut_radius_size).
evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_6)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_157w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_7=7.7 unk_sidecut_radius_size_157w=Unknown
% @importance 0.85

0.90::true_val(sidecut_radius_size_157w, v7_7); 0.10::true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w).
0.90::acc(s_merchant, sidecut_radius_size_157w).
measured(s_merchant, sidecut_radius_size_157w, v7_7).
all_consistent(sidecut_radius_size_157w) :- consistent(s_merchant, sidecut_radius_size_157w).
evidence(all_consistent(sidecut_radius_size_157w)).
query(true_val(sidecut_radius_size_157w, v7_7)).
query(true_val(sidecut_radius_size_157w, unk_sidecut_radius_size_157w)).

% @attr sidecut_radius_size_160w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_8=7.8 unk_sidecut_radius_size_160w=Unknown
% @importance 0.85

0.90::true_val(sidecut_radius_size_160w, v7_8); 0.10::true_val(sidecut_radius_size_160w, unk_sidecut_radius_size_160w).
0.90::acc(s_merchant, sidecut_radius_size_160w).
measured(s_merchant, sidecut_radius_size_160w, v7_8).
all_consistent(sidecut_radius_size_160w) :- consistent(s_merchant, sidecut_radius_size_160w).
evidence(all_consistent(sidecut_radius_size_160w)).
query(true_val(sidecut_radius_size_160w, v7_8)).
query(true_val(sidecut_radius_size_160w, unk_sidecut_radius_size_160w)).

% @attr stance_width_range_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v54_0=54.0 unk_stance_width_range_size_154=Unknown
% @importance 0.85

0.90::true_val(stance_width_range_size_154, v54_0); 0.10::true_val(stance_width_range_size_154, unk_stance_width_range_size_154).
0.90::acc(s_merchant, stance_width_range_size_154).
measured(s_merchant, stance_width_range_size_154, v54_0).
all_consistent(stance_width_range_size_154) :- consistent(s_merchant, stance_width_range_size_154).
evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v54_0)).
query(true_val(stance_width_range_size_154, unk_stance_width_range_size_154)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_stance_width_range_size=Unknown
% @importance 0.85

0.90::true_val(stance_width_range_size, v56_0); 0.10::true_val(stance_width_range_size, unk_stance_width_range_size).
0.90::acc(s_merchant, stance_width_range_size).
measured(s_merchant, stance_width_range_size, v56_0).
all_consistent(stance_width_range_size) :- consistent(s_merchant, stance_width_range_size).
evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v56_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_stance_width_range_size_157w=Unknown
% @importance 0.85

0.90::true_val(stance_width_range_size_157w, v56_0_157w); 0.10::true_val(stance_width_range_size_157w, unk_stance_width_range_size_157w).
0.90::acc(s_merchant, stance_width_range_size_157w).
measured(s_merchant, stance_width_range_size_157w, v56_0_157w).
all_consistent(stance_width_range_size_157w) :- consistent(s_merchant, stance_width_range_size_157w).
evidence(all_consistent(stance_width_range_size_157w)).
query(true_val(stance_width_range_size_157w, v56_0_157w)).
query(true_val(stance_width_range_size_157w, unk_stance_width_range_size_157w)).

% @attr stance_width_range_size_160w
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v56_0=56.0 unk_stance_width_range_size_160w=Unknown
% @importance 0.85

0.90::true_val(stance_width_range_size_160w, v56_0_160w); 0.10::true_val(stance_width_range_size_160w, unk_stance_width_range_size_160w).
0.90::acc(s_merchant, stance_width_range_size_160w).
measured(s_merchant, stance_width_range_size_160w, v56_0_160w).
all_consistent(stance_width_range_size_160w) :- consistent(s_merchant, stance_width_range_size_160w).
evidence(all_consistent(stance_width_range_size_160w)).
query(true_val(stance_width_range_size_160w, v56_0_160w)).
query(true_val(stance_width_range_size_160w, unk_stance_width_range_size_160w)).

% @attr recommended_weight_range_size_154
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w54_77=54-77kg unk_recommended_weight_range_size_154=Unknown
% @importance 0.85

0.90::true_val(recommended_weight_range_size_154, w54_77); 0.10::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).
0.90::acc(s_merchant, recommended_weight_range_size_154).
measured(s_merchant, recommended_weight_range_size_154, w54_77).
all_consistent(recommended_weight_range_size_154) :- consistent(s_merchant, recommended_weight_range_size_154).
evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, w54_77)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size
% @values w59_82=59-82kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.90::true_val(recommended_weight_range_size, w59_82); 0.10::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).
0.90::acc(s_merchant, recommended_weight_range_size).
measured(s_merchant, recommended_weight_range_size, w59_82).
all_consistent(recommended_weight_range_size) :- consistent(s_merchant, recommended_weight_range_size).
evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w59_82)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_157w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w59_82_157w=59-82kg unk_recommended_weight_range_size_157w=Unknown
% @importance 0.85

0.90::true_val(recommended_weight_range_size_157w, w59_82_157w); 0.10::true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w).
0.90::acc(s_merchant, recommended_weight_range_size_157w).
measured(s_merchant, recommended_weight_range_size_157w, w59_82_157w).
all_consistent(recommended_weight_range_size_157w) :- consistent(s_merchant, recommended_weight_range_size_157w).
evidence(all_consistent(recommended_weight_range_size_157w)).
query(true_val(recommended_weight_range_size_157w, w59_82_157w)).
query(true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w)).

% @attr recommended_weight_range_size_160w
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size
% @values w67_91=67-91kg unk_recommended_weight_range_size_160w=Unknown
% @importance 0.85

0.90::true_val(recommended_weight_range_size_160w, w67_91); 0.10::true_val(recommended_weight_range_size_160w, unk_recommended_weight_range_size_160w).
0.90::acc(s_merchant, recommended_weight_range_size_160w).
measured(s_merchant, recommended_weight_range_size_160w, w67_91).
all_consistent(recommended_weight_range_size_160w) :- consistent(s_merchant, recommended_weight_range_size_160w).
evidence(all_consistent(recommended_weight_range_size_160w)).
query(true_val(recommended_weight_range_size_160w, w67_91)).
query(true_val(recommended_weight_range_size_160w, unk_recommended_weight_range_size_160w)).

% @attr board_weight_grams_154
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v2800_154=2800.0 unk_board_weight_grams_154=Unknown
% @importance 1.0

0.87::true_val(board_weight_grams_154, v2800_154); 0.13::true_val(board_weight_grams_154, unk_board_weight_grams_154).
0.90::acc(s13, board_weight_grams_154).
measured(s13, board_weight_grams_154, v2800_154).
all_consistent(board_weight_grams_154) :- consistent(s13, board_weight_grams_154).
evidence(all_consistent(board_weight_grams_154)).
query(true_val(board_weight_grams_154, v2800_154)).
query(true_val(board_weight_grams_154, unk_board_weight_grams_154)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2800=2800.0 unk_board_weight_grams=Unknown
% @importance 1.0

0.87::true_val(board_weight_grams, v2800); 0.13::true_val(board_weight_grams, unk_board_weight_grams).
0.90::acc(s13, board_weight_grams).
measured(s13, board_weight_grams, v2800).
all_consistent(board_weight_grams) :- consistent(s13, board_weight_grams).
evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2800)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr board_weight_grams_160w
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v3100=3100.0 unk_board_weight_grams_160w=Unknown
% @importance 1.0

0.87::true_val(board_weight_grams_160w, v3100); 0.13::true_val(board_weight_grams_160w, unk_board_weight_grams_160w).
0.90::acc(s13, board_weight_grams_160w).
measured(s13, board_weight_grams_160w, v3100).
all_consistent(board_weight_grams_160w) :- consistent(s13, board_weight_grams_160w).
evidence(all_consistent(board_weight_grams_160w)).
query(true_val(board_weight_grams_160w, v3100)).
query(true_val(board_weight_grams_160w, unk_board_weight_grams_160w)).

% @attr surface_area_156
% @type numeric
% @unit dm2
% @canonical false
% @original_name Surface area 156cm
% @values v41_6=41.6 unk_surface_area_156=Unknown
% @importance 1.0

0.87::true_val(surface_area_156, v41_6); 0.13::true_val(surface_area_156, unk_surface_area_156).
0.90::acc(s13, surface_area_156).
measured(s13, surface_area_156, v41_6).
all_consistent(surface_area_156) :- consistent(s13, surface_area_156).
evidence(all_consistent(surface_area_156)).
query(true_val(surface_area_156, v41_6)).
query(true_val(surface_area_156, unk_surface_area_156)).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size
% @values v114_0=114.0 unk_contact_length_size=Unknown
% @importance 1.0

0.87::true_val(contact_length_size, v114_0); 0.13::true_val(contact_length_size, unk_contact_length_size).
0.90::acc(s13, contact_length_size).
measured(s13, contact_length_size, v114_0).
all_consistent(contact_length_size) :- consistent(s13, contact_length_size).
evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v114_0)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr tip_length_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Tip length 156cm
% @values v21_0=21.0 unk_tip_length_156=Unknown
% @importance 1.0

0.87::true_val(tip_length_156, v21_0); 0.13::true_val(tip_length_156, unk_tip_length_156).
0.90::acc(s13, tip_length_156).
measured(s13, tip_length_156, v21_0).
all_consistent(tip_length_156) :- consistent(s13, tip_length_156).
evidence(all_consistent(tip_length_156)).
query(true_val(tip_length_156, v21_0)).
query(true_val(tip_length_156, unk_tip_length_156)).

% @attr tail_length_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Tail length 156cm
% @values v21_0=21.0 unk_tail_length_156=Unknown
% @importance 1.0

0.87::true_val(tail_length_156, v21_0_tail); 0.13::true_val(tail_length_156, unk_tail_length_156).
0.90::acc(s13, tail_length_156).
measured(s13, tail_length_156, v21_0_tail).
all_consistent(tail_length_156) :- consistent(s13, tail_length_156).
evidence(all_consistent(tail_length_156)).
query(true_val(tail_length_156, v21_0_tail)).
query(true_val(tail_length_156, unk_tail_length_156)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values progressive=Progressive_radius_more_aggressive_near_contact_points unk_sidecut_type=Unknown
% @importance 0.9

0.68::true_val(sidecut_type, progressive); 0.32::true_val(sidecut_type, unk_sidecut_type).
0.78::acc(s25, sidecut_type).
measured(s25, sidecut_type, progressive).
all_consistent(sidecut_type) :- consistent(s25, sidecut_type).
evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values master_core=Master_Core_1to1_Poplar_Paulownia_sustainably_sourced unk_core_material=Unknown
% @importance 1.0

0.95::true_val(core_material, master_core); 0.05::true_val(core_material, unk_core_material).
0.93::acc(s13, core_material).
0.88::acc(s_merchant, core_material).
measured(s13, core_material, master_core).
measured(s_merchant, core_material, master_core).
all_consistent(core_material) :-
    consistent(s13, core_material),
    (indep(s_merchant), consistent(s_merchant, core_material) ; \+indep(s_merchant)).
evidence(all_consistent(core_material)).
query(true_val(core_material, master_core)).
query(true_val(core_material, unk_core_material)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biax_fiberglass=Biaxial_Fiberglass unk_laminate=Unknown
% @importance 0.93

0.95::true_val(laminate, biax_fiberglass); 0.05::true_val(laminate, unk_laminate).
0.93::acc(s13, laminate).
0.88::acc(s_merchant, laminate).
measured(s13, laminate, biax_fiberglass).
measured(s_merchant, laminate, biax_fiberglass).
all_consistent(laminate) :-
    consistent(s13, laminate),
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)).
evidence(all_consistent(laminate)).
query(true_val(laminate, biax_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_construction
% @type categorical
% @canonical false
% @original_name laminate
% @values dual_layer_dual_dir=Dual_layer_dual_directional_construction unk_laminate_construction=Unknown
% @importance 1.0

0.87::true_val(laminate_construction, dual_layer_dual_dir); 0.13::true_val(laminate_construction, unk_laminate_construction).
0.90::acc(s13, laminate_construction).
measured(s13, laminate_construction, dual_layer_dual_dir).
all_consistent(laminate_construction) :- consistent(s13, laminate_construction).
evidence(all_consistent(laminate_construction)).
query(true_val(laminate_construction, dual_layer_dual_dir)).
query(true_val(laminate_construction, unk_laminate_construction)).

% @attr laminate_feel
% @type categorical
% @canonical false
% @original_name laminate
% @values forgiving_snappy=Forgiving_yet_snappy_mid_soft_torsional_quick_energy unk_laminate_feel=Unknown
% @importance 0.85

0.90::true_val(laminate_feel, forgiving_snappy); 0.10::true_val(laminate_feel, unk_laminate_feel).
0.85::acc(s_merchant, laminate_feel).
measured(s_merchant, laminate_feel, forgiving_snappy).
all_consistent(laminate_feel) :- consistent(s_merchant, laminate_feel).
evidence(all_consistent(laminate_feel)).
query(true_val(laminate_feel, forgiving_snappy)).
query(true_val(laminate_feel, unk_laminate_feel)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values bcomp_carbon_flax=BComp_Carbon_Flax_Stringer_pop_chatter_absorption unk_construction_material_innovation=Unknown
% @importance 0.9

0.95::true_val(construction_material_innovation, bcomp_carbon_flax); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).
0.93::acc(s13, construction_material_innovation).
0.88::acc(s_merchant, construction_material_innovation).
0.78::acc(s19, construction_material_innovation).
measured(s13, construction_material_innovation, bcomp_carbon_flax).
measured(s_merchant, construction_material_innovation, bcomp_carbon_flax).
measured(s19, construction_material_innovation, bcomp_carbon_flax).
all_consistent(construction_material_innovation) :-
    consistent(s13, construction_material_innovation),
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation) ; \+indep(s_merchant)),
    (indep(s19), consistent(s19, construction_material_innovation) ; \+indep(s19)).
evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, bcomp_carbon_flax)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values bio_resin=Bio_Resin_27pct_plant_based_carbon_33pct_less_CO2 unk_resin=Unknown
% @importance 1.0

0.87::true_val(resin, bio_resin); 0.13::true_val(resin, unk_resin).
0.93::acc(s13, resin).
measured(s13, resin, bio_resin).
all_consistent(resin) :- consistent(s13, resin).
evidence(all_consistent(resin)).
query(true_val(resin, bio_resin)).
query(true_val(resin, unk_resin)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs_rounded=Recycled_ABS_rounded_finish_reduces_chipping unk_sidewall_material=Unknown
% @importance 0.93

0.95::true_val(sidewall_material, recycled_abs_rounded); 0.05::true_val(sidewall_material, unk_sidewall_material).
0.93::acc(s13, sidewall_material).
0.88::acc(s_merchant, sidewall_material).
measured(s13, sidewall_material, recycled_abs_rounded).
measured(s_merchant, sidewall_material, recycled_abs_rounded).
all_consistent(sidewall_material) :-
    consistent(s13, sidewall_material),
    (indep(s_merchant), consistent(s_merchant, sidewall_material) ; \+indep(s_merchant)).
evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs_rounded)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr edge_material
% @type categorical
% @canonical false
% @original_name Edge material
% @values recycled_german_steel=Recycled_German_steel unk_edge_material=Unknown
% @importance 0.93

0.95::true_val(edge_material, recycled_german_steel); 0.05::true_val(edge_material, unk_edge_material).
0.93::acc(s13, edge_material).
0.88::acc(s_merchant, edge_material).
measured(s13, edge_material, recycled_german_steel).
measured(s_merchant, edge_material, recycled_german_steel).
all_consistent(edge_material) :-
    consistent(s13, edge_material),
    (indep(s_merchant), consistent(s_merchant, edge_material) ; \+indep(s_merchant)).
evidence(all_consistent(edge_material)).
query(true_val(edge_material, recycled_german_steel)).
query(true_val(edge_material, unk_edge_material)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_8000=Sintered_8000_UHMWPE_carbon_fast_durable unk_base_material=Unknown
% @importance 0.93

0.95::true_val(base_material, sintered_8000); 0.05::true_val(base_material, unk_base_material).
0.93::acc(s13, base_material).
0.88::acc(s_merchant, base_material).
measured(s13, base_material, sintered_8000).
measured(s_merchant, base_material, sintered_8000).
all_consistent(base_material) :-
    consistent(s13, base_material),
    (indep(s_merchant), consistent(s_merchant, base_material) ; \+indep(s_merchant)).
evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_8000)).
query(true_val(base_material, unk_base_material)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values premium_topsheet=Premium_Topsheet_durable_scratch_resistant unk_topsheet=Unknown
% @importance 0.93

0.95::true_val(topsheet, premium_topsheet); 0.05::true_val(topsheet, unk_topsheet).
0.93::acc(s13, topsheet).
0.88::acc(s_merchant, topsheet).
measured(s13, topsheet, premium_topsheet).
measured(s_merchant, topsheet, premium_topsheet).
all_consistent(topsheet) :-
    consistent(s13, topsheet),
    (indep(s_merchant), consistent(s_merchant, topsheet) ; \+indep(s_merchant)).
evidence(all_consistent(topsheet)).
query(true_val(topsheet, premium_topsheet)).
query(true_val(topsheet, unk_topsheet)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values wend_natural=WEND_Natural_Wax_plant_based_biodegradable unk_factory_wax=Unknown
% @importance 0.93

0.95::true_val(factory_wax, wend_natural); 0.05::true_val(factory_wax, unk_factory_wax).
0.93::acc(s13, factory_wax).
0.88::acc(s_merchant, factory_wax).
measured(s13, factory_wax, wend_natural).
measured(s_merchant, factory_wax, wend_natural).
all_consistent(factory_wax) :-
    consistent(s13, factory_wax),
    (indep(s_merchant), consistent(s_merchant, factory_wax) ; \+indep(s_merchant)).
evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, wend_natural)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr factory_tuning
% @type categorical
% @canonical false
% @original_name Factory tuning
% @values detuned_90_0=De_tuned_tip_tail_edges_90_0_ready_to_ride unk_factory_tuning=Unknown
% @importance 0.7

0.86::true_val(factory_tuning, detuned_90_0); 0.14::true_val(factory_tuning, unk_factory_tuning).
0.92::acc(s26, factory_tuning).
measured(s26, factory_tuning, detuned_90_0).
all_consistent(factory_tuning) :- consistent(s26, factory_tuning).
evidence(all_consistent(factory_tuning)).
query(true_val(factory_tuning, detuned_90_0)).
query(true_val(factory_tuning, unk_factory_tuning)).

% @attr construction_material_innovation_forever_flex
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values forever_flex=Forever_Flex_overbuilt_then_broken_in_mimics_20_days unk_construction_material_innovation_forever_flex=Unknown
% @importance 0.93

0.95::true_val(construction_material_innovation_forever_flex, forever_flex); 0.05::true_val(construction_material_innovation_forever_flex, unk_construction_material_innovation_forever_flex).
0.93::acc(s13, construction_material_innovation_forever_flex).
0.88::acc(s_merchant, construction_material_innovation_forever_flex).
measured(s13, construction_material_innovation_forever_flex, forever_flex).
measured(s_merchant, construction_material_innovation_forever_flex, forever_flex).
all_consistent(construction_material_innovation_forever_flex) :-
    consistent(s13, construction_material_innovation_forever_flex),
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation_forever_flex) ; \+indep(s_merchant)).
evidence(all_consistent(construction_material_innovation_forever_flex)).
query(true_val(construction_material_innovation_forever_flex, forever_flex)).
query(true_val(construction_material_innovation_forever_flex, unk_construction_material_innovation_forever_flex)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values traction_tech_3_0=Traction_Tech_3.0_three_bumps_per_edge unk_edge_technology=Unknown
% @importance 0.85

0.95::true_val(edge_technology, traction_tech_3_0); 0.05::true_val(edge_technology, unk_edge_technology).
0.93::acc(s13, edge_technology).
0.92::acc(s26, edge_technology).
0.88::acc(s_merchant, edge_technology).
measured(s13, edge_technology, traction_tech_3_0).
measured(s26, edge_technology, traction_tech_3_0).
measured(s_merchant, edge_technology, traction_tech_3_0).
all_consistent(edge_technology) :-
    consistent(s13, edge_technology),
    consistent(s26, edge_technology),
    (indep(s_merchant), consistent(s_merchant, edge_technology) ; \+indep(s_merchant)).
evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, traction_tech_3_0)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values blunt_nose=Blunt_nose_reduces_swing_weight_float_no_snow_plow unk_nose_design=Unknown
% @importance 1.0

0.87::true_val(nose_design, blunt_nose); 0.13::true_val(nose_design, unk_nose_design).
0.93::acc(s13, nose_design).
measured(s13, nose_design, blunt_nose).
all_consistent(nose_design) :- consistent(s13, nose_design).
evidence(all_consistent(nose_design)).
query(true_val(nose_design, blunt_nose)).
query(true_val(nose_design, unk_nose_design)).

% @attr camber_description_surfboard
% @type categorical
% @canonical false
% @original_name camber_description
% @values surfboard_inspired=Surfboard_inspired_reduces_tip_drag_better_glide_float unk_camber_description_surfboard=Unknown
% @importance 0.85

0.85::true_val(camber_description_surfboard, surfboard_inspired); 0.15::true_val(camber_description_surfboard, unk_camber_description_surfboard).
0.85::acc(s_merchant, camber_description_surfboard).
measured(s_merchant, camber_description_surfboard, surfboard_inspired).
all_consistent(camber_description_surfboard) :- consistent(s_merchant, camber_description_surfboard).
evidence(all_consistent(camber_description_surfboard)).
query(true_val(camber_description_surfboard, surfboard_inspired)).
query(true_val(camber_description_surfboard, unk_camber_description_surfboard)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values fun_loose_playful=Fun_loose_playful_prefers_moderate_speeds_maneuverability unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.9

0.68::true_val(reviewer_opinion_the_good_ride, fun_loose_playful); 0.32::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).
0.82::acc(s27, reviewer_opinion_the_good_ride).
measured(s27, reviewer_opinion_the_good_ride, fun_loose_playful).
all_consistent(reviewer_opinion_the_good_ride) :- consistent(s27, reviewer_opinion_the_good_ride).
evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, fun_loose_playful)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values easy_access_effortless=Easy_access_pop_effortless_not_highest_total unk_pop=Unknown
% @importance 0.85

0.68::true_val(pop, easy_access_effortless); 0.32::true_val(pop, unk_pop).
0.82::acc(s28, pop).
measured(s28, pop, easy_access_effortless).
all_consistent(pop) :- consistent(s28, pop).
evidence(all_consistent(pop)).
query(true_val(pop, easy_access_effortless)).
query(true_val(pop, unk_pop)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values very_little_catch=Very_little_catch_risk_3D_contour_lifted_edges_soft_torsional unk_positive_aspect=Unknown
% @importance 0.9

0.68::true_val(positive_aspect, very_little_catch); 0.32::true_val(positive_aspect, unk_positive_aspect).
0.82::acc(s27, positive_aspect).
measured(s27, positive_aspect, very_little_catch).
all_consistent(positive_aspect) :- consistent(s27, positive_aspect).
evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, very_little_catch)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values super_easy=Super_easy_turn_initiation_effortless_slashes unk_turn_initiation_performance=Unknown
% @importance 0.9

0.68::true_val(turn_initiation_performance, super_easy); 0.32::true_val(turn_initiation_performance, unk_turn_initiation_performance).
0.82::acc(s27, turn_initiation_performance).
measured(s27, turn_initiation_performance, super_easy).
all_consistent(turn_initiation_performance) :- consistent(s27, turn_initiation_performance).
evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, super_easy)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values good_moderate=Carves_well_not_pushed_hard_edge_wash_at_speed unk_carving_rating_tgr=Unknown
% @importance 0.9

0.68::true_val(carving_rating_tgr, good_moderate); 0.32::true_val(carving_rating_tgr, unk_carving_rating_tgr).
0.82::acc(s27, carving_rating_tgr).
measured(s27, carving_rating_tgr, good_moderate).
all_consistent(carving_rating_tgr) :- consistent(s27, carving_rating_tgr).
evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, good_moderate)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values standout_icy=Traction_Tech_standout_icy_conditions_top_east_coast_park unk_edge_hold=Unknown
% @importance 0.9

0.68::true_val(edge_hold, standout_icy); 0.32::true_val(edge_hold, unk_edge_hold).
0.78::acc(s25, edge_hold).
measured(s25, edge_hold, standout_icy).
all_consistent(edge_hold) :- consistent(s25, edge_hold).
evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, standout_icy)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_stable_speed=Not_stable_at_speed_wobbly_above_moderate unk_negative_aspect=Unknown
% @importance 0.9

0.68::true_val(negative_aspect, not_stable_speed); 0.32::true_val(negative_aspect, unk_negative_aspect).
0.82::acc(s27, negative_aspect).
measured(s27, negative_aspect, not_stable_speed).
all_consistent(negative_aspect) :- consistent(s27, negative_aspect).
evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_stable_speed)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_rough_snow
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_solid_rough=Not_solid_rough_snow_bucked_around_easy_corrections unk_negative_aspect_rough_snow=Unknown
% @importance 0.9

0.68::true_val(negative_aspect_rough_snow, not_solid_rough); 0.32::true_val(negative_aspect_rough_snow, unk_negative_aspect_rough_snow).
0.82::acc(s27, negative_aspect_rough_snow).
measured(s27, negative_aspect_rough_snow, not_solid_rough).
all_consistent(negative_aspect_rough_snow) :- consistent(s27, negative_aspect_rough_snow).
evidence(all_consistent(negative_aspect_rough_snow)).
query(true_val(negative_aspect_rough_snow, not_solid_rough)).
query(true_val(negative_aspect_rough_snow, unk_negative_aspect_rough_snow)).

% @attr positive_aspect_trees
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values super_fun_trees=Super_fun_in_trees_quick_sharp_turns unk_positive_aspect_trees=Unknown
% @importance 0.9

0.68::true_val(positive_aspect_trees, super_fun_trees); 0.32::true_val(positive_aspect_trees, unk_positive_aspect_trees).
0.82::acc(s27, positive_aspect_trees).
measured(s27, positive_aspect_trees, super_fun_trees).
all_consistent(positive_aspect_trees) :- consistent(s27, positive_aspect_trees).
evidence(all_consistent(positive_aspect_trees)).
query(true_val(positive_aspect_trees, super_fun_trees)).
query(true_val(positive_aspect_trees, unk_positive_aspect_trees)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values decent_light=Decent_in_light_powder_not_deep unk_powder_rating_tgr=Unknown
% @importance 0.9

0.68::true_val(powder_rating_tgr, decent_light); 0.32::true_val(powder_rating_tgr, unk_powder_rating_tgr).
0.82::acc(s27, powder_rating_tgr).
measured(s27, powder_rating_tgr, decent_light).
all_consistent(powder_rating_tgr) :- consistent(s27, powder_rating_tgr).
evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, decent_light)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr positive_aspect_pressability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values extremely_pressable=Extremely_pressable_nose_tail_presses_butters_easy unk_positive_aspect_pressability=Unknown
% @importance 0.85

0.77::true_val(positive_aspect_pressability, extremely_pressable); 0.23::true_val(positive_aspect_pressability, unk_positive_aspect_pressability).
0.85::acc(s29, positive_aspect_pressability).
measured(s29, positive_aspect_pressability, extremely_pressable).
all_consistent(positive_aspect_pressability) :- consistent(s29, positive_aspect_pressability).
evidence(all_consistent(positive_aspect_pressability)).
query(true_val(positive_aspect_pressability, extremely_pressable)).
query(true_val(positive_aspect_pressability, unk_positive_aspect_pressability)).

% @attr target_speed_range
% @type categorical
% @canonical false
% @original_name Target speed range
% @values mph_15_25=15_to_25_mph_per_Jeremy_Jones unk_target_speed_range=Unknown
% @importance 0.85

0.77::true_val(target_speed_range, mph_15_25); 0.23::true_val(target_speed_range, unk_target_speed_range).
0.85::acc(s29, target_speed_range).
measured(s29, target_speed_range, mph_15_25).
all_consistent(target_speed_range) :- consistent(s29, target_speed_range).
evidence(all_consistent(target_speed_range)).
query(true_val(target_speed_range, mph_15_25)).
query(true_val(target_speed_range, unk_target_speed_range)).

% @attr positive_aspect_jumps_jibbing
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values outstanding_jumps_jib=Outstanding_jumps_jibbing_rails_both_remarkably_well unk_positive_aspect_jumps_jibbing=Unknown
% @importance 0.9

0.68::true_val(positive_aspect_jumps_jibbing, outstanding_jumps_jib); 0.32::true_val(positive_aspect_jumps_jibbing, unk_positive_aspect_jumps_jibbing).
0.78::acc(s25, positive_aspect_jumps_jibbing).
measured(s25, positive_aspect_jumps_jibbing, outstanding_jumps_jib).
all_consistent(positive_aspect_jumps_jibbing) :- consistent(s25, positive_aspect_jumps_jibbing).
evidence(all_consistent(positive_aspect_jumps_jibbing)).
query(true_val(positive_aspect_jumps_jibbing, outstanding_jumps_jib)).
query(true_val(positive_aspect_jumps_jibbing, unk_positive_aspect_jumps_jibbing)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values identical_to_regular=True_twin_switch_identical_to_regular unk_switch_riding=Unknown
% @importance 1.0

0.87::true_val(switch_riding, identical_to_regular); 0.13::true_val(switch_riding, unk_switch_riding).
0.93::acc(s13, switch_riding).
measured(s13, switch_riding, identical_to_regular).
all_consistent(switch_riding) :- consistent(s13, switch_riding).
evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, identical_to_regular)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr positive_aspect_tracking
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values cleaner_tracking=Cleaner_tracking_between_turns_more_confident_edge_hold unk_positive_aspect_tracking=Unknown
% @importance 0.85

0.60::true_val(positive_aspect_tracking, cleaner_tracking); 0.40::true_val(positive_aspect_tracking, unk_positive_aspect_tracking).
0.72::acc(s30, positive_aspect_tracking).
measured(s30, positive_aspect_tracking, cleaner_tracking).
all_consistent(positive_aspect_tracking) :- consistent(s30, positive_aspect_tracking).
evidence(all_consistent(positive_aspect_tracking)).
query(true_val(positive_aspect_tracking, cleaner_tracking)).
query(true_val(positive_aspect_tracking, unk_positive_aspect_tracking)).

% @attr positive_aspect_groomers
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values holds_on_groomers=Holds_together_on_groomers_side_hits_mixed_conditions unk_positive_aspect_groomers=Unknown
% @importance 0.85

0.60::true_val(positive_aspect_groomers, holds_on_groomers); 0.40::true_val(positive_aspect_groomers, unk_positive_aspect_groomers).
0.72::acc(s30, positive_aspect_groomers).
measured(s30, positive_aspect_groomers, holds_on_groomers).
all_consistent(positive_aspect_groomers) :- consistent(s30, positive_aspect_groomers).
evidence(all_consistent(positive_aspect_groomers)).
query(true_val(positive_aspect_groomers, holds_on_groomers)).
query(true_val(positive_aspect_groomers, unk_positive_aspect_groomers)).

% @attr camber_description_release
% @type categorical
% @canonical false
% @original_name camber_description
% @values clean_release=Helps_board_release_cleanly_not_grabby unk_camber_description_release=Unknown
% @importance 0.85

0.60::true_val(camber_description_release, clean_release); 0.40::true_val(camber_description_release, unk_camber_description_release).
0.72::acc(s30, camber_description_release).
measured(s30, camber_description_release, clean_release).
all_consistent(camber_description_release) :- consistent(s30, camber_description_release).
evidence(all_consistent(camber_description_release)).
query(true_val(camber_description_release, clean_release)).
query(true_val(camber_description_release, unk_camber_description_release)).

% @attr camber_description_pop
% @type categorical
% @canonical false
% @original_name camber_description
% @values adds_pop_versatility=Full_camber_with_3D_flip_tips_adds_pop_and_versatility unk_camber_description_pop=Unknown
% @importance 0.85

0.81::true_val(camber_description_pop, adds_pop_versatility); 0.19::true_val(camber_description_pop, unk_camber_description_pop).
0.85::acc(s4, camber_description_pop).
measured(s4, camber_description_pop, adds_pop_versatility).
all_consistent(camber_description_pop) :- consistent(s4, camber_description_pop).
evidence(all_consistent(camber_description_pop)).
query(true_val(camber_description_pop, adds_pop_versatility)).
query(true_val(camber_description_pop, unk_camber_description_pop)).

% @attr botw_rating
% @type numeric
% @unit /100
% @canonical false
% @original_name Board of the World rating (Tweaker)
% @values v92_55=92.55 unk_botw_rating=Unknown
% @importance 0.9

0.68::true_val(botw_rating, v92_55); 0.32::true_val(botw_rating, unk_botw_rating).
0.78::acc(s25, botw_rating).
measured(s25, botw_rating, v92_55).
all_consistent(botw_rating) :- consistent(s25, botw_rating).
evidence(all_consistent(botw_rating)).
query(true_val(botw_rating, v92_55)).
query(true_val(botw_rating, unk_botw_rating)).

% @attr botw_am_freestyle_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Board of the World top-6 AM freestyle twins list
% @values v4_29=4.29 unk_botw_am_freestyle_rating=Unknown
% @importance 0.8

0.68::true_val(botw_am_freestyle_rating, v4_29); 0.32::true_val(botw_am_freestyle_rating, unk_botw_am_freestyle_rating).
0.78::acc(s31, botw_am_freestyle_rating).
measured(s31, botw_am_freestyle_rating, v4_29).
all_consistent(botw_am_freestyle_rating) :- consistent(s31, botw_am_freestyle_rating).
evidence(all_consistent(botw_am_freestyle_rating)).
query(true_val(botw_am_freestyle_rating, v4_29)).
query(true_val(botw_am_freestyle_rating, unk_botw_am_freestyle_rating)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values top_100_selected=Selected_Whitelines_top_100_2022_23_and_2023_24 unk_reviewer_opinion_whitelines=Unknown
% @importance 0.5

0.77::true_val(reviewer_opinion_whitelines, top_100_selected); 0.23::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).
0.82::acc(s3, reviewer_opinion_whitelines).
measured(s3, reviewer_opinion_whitelines, top_100_selected).
all_consistent(reviewer_opinion_whitelines) :- consistent(s3, reviewer_opinion_whitelines).
evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, top_100_selected)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr rei_user_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name REI user rating (2024/25 Tweaker)
% @values v5_0=5.0 unk_rei_user_rating=Unknown
% @importance 0.6

0.68::true_val(rei_user_rating, v5_0); 0.32::true_val(rei_user_rating, unk_rei_user_rating).
0.80::acc(s16, rei_user_rating).
measured(s16, rei_user_rating, v5_0).
all_consistent(rei_user_rating) :- consistent(s16, rei_user_rating).
evidence(all_consistent(rei_user_rating)).
query(true_val(rei_user_rating, v5_0)).
query(true_val(rei_user_rating, unk_rei_user_rating)).

% @attr jones_user_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Jones.com user rating
% @values v4_9=4.9 unk_jones_user_rating=Unknown
% @importance 1.0

0.87::true_val(jones_user_rating, v4_9); 0.13::true_val(jones_user_rating, unk_jones_user_rating).
0.90::acc(s13, jones_user_rating).
measured(s13, jones_user_rating, v4_9).
all_consistent(jones_user_rating) :- consistent(s13, jones_user_rating).
evidence(all_consistent(jones_user_rating)).
query(true_val(jones_user_rating, v4_9)).
query(true_val(jones_user_rating, unk_jones_user_rating)).

% @attr the_inertia_verdict
% @type categorical
% @canonical false
% @original_name The Inertia verdict
% @values quiver_killer=True_quiver_killer_AM_freestyle_severely_underrated unk_the_inertia_verdict=Unknown
% @importance 0.8

0.68::true_val(the_inertia_verdict, quiver_killer); 0.32::true_val(the_inertia_verdict, unk_the_inertia_verdict).
0.80::acc(s32, the_inertia_verdict).
measured(s32, the_inertia_verdict, quiver_killer).
all_consistent(the_inertia_verdict) :- consistent(s32, the_inertia_verdict).
evidence(all_consistent(the_inertia_verdict)).
query(true_val(the_inertia_verdict, quiver_killer)).
query(true_val(the_inertia_verdict, unk_the_inertia_verdict)).

% @attr snowboarder_magazine_review
% @type categorical
% @canonical false
% @original_name Snowboarder Magazine review
% @values praised_pop_press_edge=Praised_pop_pressability_edge_hold_park_daily_driver unk_snowboarder_magazine_review=Unknown
% @importance 0.85

0.77::true_val(snowboarder_magazine_review, praised_pop_press_edge); 0.23::true_val(snowboarder_magazine_review, unk_snowboarder_magazine_review).
0.85::acc(s29, snowboarder_magazine_review).
measured(s29, snowboarder_magazine_review, praised_pop_press_edge).
all_consistent(snowboarder_magazine_review) :- consistent(s29, snowboarder_magazine_review).
evidence(all_consistent(snowboarder_magazine_review)).
query(true_val(snowboarder_magazine_review, praised_pop_press_edge)).
query(true_val(snowboarder_magazine_review, unk_snowboarder_magazine_review)).

% @attr reviewer_opinion_the_good_ride_learning_curve
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values easy_twin_short_curve=Very_easy_twin_short_learning_curve_spoon_washy_hard_snow unk_reviewer_opinion_the_good_ride_learning_curve=Unknown
% @importance 0.8

0.64::true_val(reviewer_opinion_the_good_ride_learning_curve, easy_twin_short_curve); 0.36::true_val(reviewer_opinion_the_good_ride_learning_curve, unk_reviewer_opinion_the_good_ride_learning_curve).
0.78::acc(s33, reviewer_opinion_the_good_ride_learning_curve).
measured(s33, reviewer_opinion_the_good_ride_learning_curve, easy_twin_short_curve).
all_consistent(reviewer_opinion_the_good_ride_learning_curve) :- consistent(s33, reviewer_opinion_the_good_ride_learning_curve).
evidence(all_consistent(reviewer_opinion_the_good_ride_learning_curve)).
query(true_val(reviewer_opinion_the_good_ride_learning_curve, easy_twin_short_curve)).
query(true_val(reviewer_opinion_the_good_ride_learning_curve, unk_reviewer_opinion_the_good_ride_learning_curve)).

% @attr positive_aspect_edge_hold
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values impressed_edge_hold=Always_impressed_by_edge_hold_carving_for_park_board unk_positive_aspect_edge_hold=Unknown
% @importance 0.9

0.68::true_val(positive_aspect_edge_hold, impressed_edge_hold); 0.32::true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold).
0.78::acc(s25, positive_aspect_edge_hold).
measured(s25, positive_aspect_edge_hold, impressed_edge_hold).
all_consistent(positive_aspect_edge_hold) :- consistent(s25, positive_aspect_edge_hold).
evidence(all_consistent(positive_aspect_edge_hold)).
query(true_val(positive_aspect_edge_hold, impressed_edge_hold)).
query(true_val(positive_aspect_edge_hold, unk_positive_aspect_edge_hold)).

% @attr positive_aspect_grippy
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values grippy_catch_free=Grippy_when_needed_catch_free_skate_like_flat_base unk_positive_aspect_grippy=Unknown
% @importance 0.9

0.68::true_val(positive_aspect_grippy, grippy_catch_free); 0.32::true_val(positive_aspect_grippy, unk_positive_aspect_grippy).
0.78::acc(s25, positive_aspect_grippy).
measured(s25, positive_aspect_grippy, grippy_catch_free).
all_consistent(positive_aspect_grippy) :- consistent(s25, positive_aspect_grippy).
evidence(all_consistent(positive_aspect_grippy)).
query(true_val(positive_aspect_grippy, grippy_catch_free)).
query(true_val(positive_aspect_grippy, unk_positive_aspect_grippy)).

% @attr positive_aspect_park_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values outstanding_in_out_park=Outstanding_in_and_out_of_park_jumping_and_jibbing unk_positive_aspect_park_versatility=Unknown
% @importance 0.9

0.68::true_val(positive_aspect_park_versatility, outstanding_in_out_park); 0.32::true_val(positive_aspect_park_versatility, unk_positive_aspect_park_versatility).
0.78::acc(s25, positive_aspect_park_versatility).
measured(s25, positive_aspect_park_versatility, outstanding_in_out_park).
all_consistent(positive_aspect_park_versatility) :- consistent(s25, positive_aspect_park_versatility).
evidence(all_consistent(positive_aspect_park_versatility)).
query(true_val(positive_aspect_park_versatility, outstanding_in_out_park)).
query(true_val(positive_aspect_park_versatility, unk_positive_aspect_park_versatility)).

% @attr positive_aspect_confidence
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values great_trying_new_things=Great_for_trying_new_things_low_consequence_feel unk_positive_aspect_confidence=Unknown
% @importance 0.9

0.68::true_val(positive_aspect_confidence, great_trying_new_things); 0.32::true_val(positive_aspect_confidence, unk_positive_aspect_confidence).
0.82::acc(s27, positive_aspect_confidence).
measured(s27, positive_aspect_confidence, great_trying_new_things).
all_consistent(positive_aspect_confidence) :- consistent(s27, positive_aspect_confidence).
evidence(all_consistent(positive_aspect_confidence)).
query(true_val(positive_aspect_confidence, great_trying_new_things)).
query(true_val(positive_aspect_confidence, unk_positive_aspect_confidence)).

% @attr positive_aspect_value
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values premium_approachable=Premium_construction_approachable_price_strong_sustainability unk_positive_aspect_value=Unknown
% @importance 0.8

0.68::true_val(positive_aspect_value, premium_approachable); 0.32::true_val(positive_aspect_value, unk_positive_aspect_value).
0.80::acc(s32, positive_aspect_value).
measured(s32, positive_aspect_value, premium_approachable).
all_consistent(positive_aspect_value) :- consistent(s32, positive_aspect_value).
evidence(all_consistent(positive_aspect_value)).
query(true_val(positive_aspect_value, premium_approachable)).
query(true_val(positive_aspect_value, unk_positive_aspect_value)).

% @attr positive_aspect_carving
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values euro_carves=Euro_carves_achieved_despite_soft_flex unk_positive_aspect_carving=Unknown
% @importance 0.85

0.77::true_val(positive_aspect_carving, euro_carves); 0.23::true_val(positive_aspect_carving, unk_positive_aspect_carving).
0.85::acc(s29, positive_aspect_carving).
measured(s29, positive_aspect_carving, euro_carves).
all_consistent(positive_aspect_carving) :- consistent(s29, positive_aspect_carving).
evidence(all_consistent(positive_aspect_carving)).
query(true_val(positive_aspect_carving, euro_carves)).
query(true_val(positive_aspect_carving, unk_positive_aspect_carving)).

% @attr negative_aspect_edge_washout
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values edge_wash_speed=Edge_wash_out_higher_speeds_aggressive_lean_hard_snow unk_negative_aspect_edge_washout=Unknown
% @importance 0.9

0.68::true_val(negative_aspect_edge_washout, edge_wash_speed); 0.32::true_val(negative_aspect_edge_washout, unk_negative_aspect_edge_washout).
0.82::acc(s27, negative_aspect_edge_washout).
measured(s27, negative_aspect_edge_washout, edge_wash_speed).
all_consistent(negative_aspect_edge_washout) :- consistent(s27, negative_aspect_edge_washout).
evidence(all_consistent(negative_aspect_edge_washout)).
query(true_val(negative_aspect_edge_washout, edge_wash_speed)).
query(true_val(negative_aspect_edge_washout, unk_negative_aspect_edge_washout)).

% @attr negative_aspect_landing
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values landing_not_solid=Landing_bigger_air_not_solid_flex_limiting_large_jumps unk_negative_aspect_landing=Unknown
% @importance 0.85

0.68::true_val(negative_aspect_landing, landing_not_solid); 0.32::true_val(negative_aspect_landing, unk_negative_aspect_landing).
0.82::acc(s28, negative_aspect_landing).
measured(s28, negative_aspect_landing, landing_not_solid).
all_consistent(negative_aspect_landing) :- consistent(s28, negative_aspect_landing).
evidence(all_consistent(negative_aspect_landing)).
query(true_val(negative_aspect_landing, landing_not_solid)).
query(true_val(negative_aspect_landing, unk_negative_aspect_landing)).

% @attr negative_aspect_control
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values loose_harder_control=Loose_feel_may_be_harder_to_control_starting_out unk_negative_aspect_control=Unknown
% @importance 0.9

0.68::true_val(negative_aspect_control, loose_harder_control); 0.32::true_val(negative_aspect_control, unk_negative_aspect_control).
0.82::acc(s27, negative_aspect_control).
measured(s27, negative_aspect_control, loose_harder_control).
all_consistent(negative_aspect_control) :- consistent(s27, negative_aspect_control).
evidence(all_consistent(negative_aspect_control)).
query(true_val(negative_aspect_control, loose_harder_control)).
query(true_val(negative_aspect_control, unk_negative_aspect_control)).

% @attr negative_aspect_spoon_washy
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values spoon_washy=Spoon_tech_washy_edgeless_harder_snow unk_negative_aspect_spoon_washy=Unknown
% @importance 0.8

0.64::true_val(negative_aspect_spoon_washy, spoon_washy); 0.36::true_val(negative_aspect_spoon_washy, unk_negative_aspect_spoon_washy).
0.78::acc(s33, negative_aspect_spoon_washy).
measured(s33, negative_aspect_spoon_washy, spoon_washy).
all_consistent(negative_aspect_spoon_washy) :- consistent(s33, negative_aspect_spoon_washy).
evidence(all_consistent(negative_aspect_spoon_washy)).
query(true_val(negative_aspect_spoon_washy, spoon_washy)).
query(true_val(negative_aspect_spoon_washy, unk_negative_aspect_spoon_washy)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values burton_process=Burton_Process_similar_AM_versatility unk_comparable_board_cross_brand=Unknown
% @importance 0.8

0.68::true_val(comparable_board_cross_brand, burton_process); 0.32::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).
0.80::acc(s32, comparable_board_cross_brand).
measured(s32, comparable_board_cross_brand, burton_process).
all_consistent(comparable_board_cross_brand) :- consistent(s32, comparable_board_cross_brand).
evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, burton_process)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_doa
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_doa=CAPiTA_DOA_freestyle_legend_AM_chops unk_comparable_board_cross_brand_doa=Unknown
% @importance 0.75

0.48::true_val(comparable_board_cross_brand_doa, capita_doa); 0.52::true_val(comparable_board_cross_brand_doa, unk_comparable_board_cross_brand_doa).
0.65::acc(s34, comparable_board_cross_brand_doa).
measured(s34, comparable_board_cross_brand_doa, capita_doa).
all_consistent(comparable_board_cross_brand_doa) :- consistent(s34, comparable_board_cross_brand_doa).
evidence(all_consistent(comparable_board_cross_brand_doa)).
query(true_val(comparable_board_cross_brand_doa, capita_doa)).
query(true_val(comparable_board_cross_brand_doa, unk_comparable_board_cross_brand_doa)).

% @attr comparable_board_cross_brand_t1
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values nitro_t1=Nitro_T1_classic_park_twin unk_comparable_board_cross_brand_t1=Unknown
% @importance 0.75

0.48::true_val(comparable_board_cross_brand_t1, nitro_t1); 0.52::true_val(comparable_board_cross_brand_t1, unk_comparable_board_cross_brand_t1).
0.65::acc(s34, comparable_board_cross_brand_t1).
measured(s34, comparable_board_cross_brand_t1, nitro_t1).
all_consistent(comparable_board_cross_brand_t1) :- consistent(s34, comparable_board_cross_brand_t1).
evidence(all_consistent(comparable_board_cross_brand_t1)).
query(true_val(comparable_board_cross_brand_t1, nitro_t1)).
query(true_val(comparable_board_cross_brand_t1, unk_comparable_board_cross_brand_t1)).

% @attr comparable_board_cross_brand_evil_twin
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values bataleon_evil_twin=Bataleon_Evil_Twin_playful_3BT unk_comparable_board_cross_brand_evil_twin=Unknown
% @importance 0.75

0.48::true_val(comparable_board_cross_brand_evil_twin, bataleon_evil_twin); 0.52::true_val(comparable_board_cross_brand_evil_twin, unk_comparable_board_cross_brand_evil_twin).
0.65::acc(s34, comparable_board_cross_brand_evil_twin).
measured(s34, comparable_board_cross_brand_evil_twin, bataleon_evil_twin).
all_consistent(comparable_board_cross_brand_evil_twin) :- consistent(s34, comparable_board_cross_brand_evil_twin).
evidence(all_consistent(comparable_board_cross_brand_evil_twin)).
query(true_val(comparable_board_cross_brand_evil_twin, bataleon_evil_twin)).
query(true_val(comparable_board_cross_brand_evil_twin, unk_comparable_board_cross_brand_evil_twin)).

% @attr comparable_board_same_brand_mountain_twin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values mountain_twin=Directional_twin_setback_more_all_mountain unk_comparable_board_same_brand_mountain_twin=Unknown
% @importance 0.7

0.77::true_val(comparable_board_same_brand_mountain_twin, mountain_twin); 0.23::true_val(comparable_board_same_brand_mountain_twin, unk_comparable_board_same_brand_mountain_twin).
0.85::acc(s36, comparable_board_same_brand_mountain_twin).
measured(s36, comparable_board_same_brand_mountain_twin, mountain_twin).
all_consistent(comparable_board_same_brand_mountain_twin) :- consistent(s36, comparable_board_same_brand_mountain_twin).
evidence(all_consistent(comparable_board_same_brand_mountain_twin)).
query(true_val(comparable_board_same_brand_mountain_twin, mountain_twin)).
query(true_val(comparable_board_same_brand_mountain_twin, unk_comparable_board_same_brand_mountain_twin)).

% @attr comparable_board_same_brand_beginner
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values rally_cat=Directional_twin_soft_flex_beginner_intermediate unk_comparable_board_same_brand_beginner=Unknown
% @importance 0.8

0.68::true_val(comparable_board_same_brand_beginner, rally_cat); 0.32::true_val(comparable_board_same_brand_beginner, unk_comparable_board_same_brand_beginner).
0.80::acc(s32, comparable_board_same_brand_beginner).
measured(s32, comparable_board_same_brand_beginner, rally_cat).
all_consistent(comparable_board_same_brand_beginner) :- consistent(s32, comparable_board_same_brand_beginner).
evidence(all_consistent(comparable_board_same_brand_beginner)).
query(true_val(comparable_board_same_brand_beginner, rally_cat)).
query(true_val(comparable_board_same_brand_beginner, unk_comparable_board_same_brand_beginner)).

% @attr availability_status_jones_com
% @type categorical
% @canonical false
% @original_name availability_status
% @values jones_store_529_95=Official_store_529.95USD_free_ship_30day_returns unk_availability_status_jones_com=Unknown
% @importance 1.0

0.87::true_val(availability_status_jones_com, jones_store_529_95); 0.13::true_val(availability_status_jones_com, unk_availability_status_jones_com).
0.90::acc(s13, availability_status_jones_com).
measured(s13, availability_status_jones_com, jones_store_529_95).
all_consistent(availability_status_jones_com) :- consistent(s13, availability_status_jones_com).
evidence(all_consistent(availability_status_jones_com)).
query(true_val(availability_status_jones_com, jones_store_529_95)).
query(true_val(availability_status_jones_com, unk_availability_status_jones_com)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status
% @values melb_auth_949_99=Authorized_dealer_AUD949.99_30day_credit_exchange unk_availability_status_melbourne=Unknown
% @importance 0.9

0.90::true_val(availability_status_melbourne, melb_auth_949_99); 0.10::true_val(availability_status_melbourne, unk_availability_status_melbourne).
0.88::acc(s_merchant, availability_status_melbourne).
measured(s_merchant, availability_status_melbourne, melb_auth_949_99).
all_consistent(availability_status_melbourne) :- consistent(s_merchant, availability_status_melbourne).
evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, melb_auth_949_99)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_backcountry
% @type categorical
% @canonical false
% @original_name availability_status
% @values discounted_prior=Discounted_prior_models_424_504USD unk_availability_status_backcountry=Unknown
% @importance 0.8

0.46::true_val(availability_status_backcountry, discounted_prior); 0.54::true_val(availability_status_backcountry, unk_availability_status_backcountry).
0.60::acc(s15, availability_status_backcountry).
measured(s15, availability_status_backcountry, discounted_prior).
all_consistent(availability_status_backcountry) :- consistent(s15, availability_status_backcountry).
evidence(all_consistent(availability_status_backcountry)).
query(true_val(availability_status_backcountry, discounted_prior)).
query(true_val(availability_status_backcountry, unk_availability_status_backcountry)).

% @attr jones_founding_year
% @type categorical
% @canonical false
% @original_name Jones Snowboards founding year
% @values y2010=2010 unk_jones_founding_year=Unknown
% @importance 0.5

0.63::true_val(jones_founding_year, y2010_founding); 0.37::true_val(jones_founding_year, unk_jones_founding_year).
0.70::acc(s6, jones_founding_year).
measured(s6, jones_founding_year, y2010_founding).
all_consistent(jones_founding_year) :- consistent(s6, jones_founding_year).
evidence(all_consistent(jones_founding_year)).
query(true_val(jones_founding_year, y2010_founding)).
query(true_val(jones_founding_year, unk_jones_founding_year)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2022_23=2022_23_season_first_park_freestyle_Jones unk_model_first_available_year=Unknown
% @importance 0.7

0.95::true_val(model_first_available_year, season_2022_23); 0.05::true_val(model_first_available_year, unk_model_first_available_year).
0.82::acc(s3, model_first_available_year).
0.78::acc(s25, model_first_available_year).
measured(s3, model_first_available_year, season_2022_23).
measured(s25, model_first_available_year, season_2022_23).
all_consistent(model_first_available_year) :-
    consistent(s3, model_first_available_year),
    consistent(s25, model_first_available_year).
evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2022_23)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values change_board_change_mountain=Change_your_board_change_your_mountain_experience_driven unk_design_philosophy=Unknown
% @importance 0.85

0.81::true_val(design_philosophy, change_board_change_mountain); 0.19::true_val(design_philosophy, unk_design_philosophy).
0.85::acc(s4, design_philosophy).
measured(s4, design_philosophy, change_board_change_mountain).
all_consistent(design_philosophy) :- consistent(s4, design_philosophy).
evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, change_board_change_mountain)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr sustainability_certification_lca
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values full_lca=One_of_only_manufacturers_full_lifecycle_analysis unk_sustainability_certification_lca=Unknown
% @importance 0.5

0.68::true_val(sustainability_certification_lca, full_lca); 0.32::true_val(sustainability_certification_lca, unk_sustainability_certification_lca).
0.78::acc(s37, sustainability_certification_lca).
measured(s37, sustainability_certification_lca, full_lca).
all_consistent(sustainability_certification_lca) :- consistent(s37, sustainability_certification_lca).
evidence(all_consistent(sustainability_certification_lca)).
query(true_val(sustainability_certification_lca, full_lca)).
query(true_val(sustainability_certification_lca, unk_sustainability_certification_lca)).

% @attr sustainability_certification_recycled_sidewalls
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values since_2014_847mi=Recycled_ABS_sidewalls_since_2014_847_miles unk_sustainability_certification_recycled_sidewalls=Unknown
% @importance 0.7

0.86::true_val(sustainability_certification_recycled_sidewalls, since_2014_847mi); 0.14::true_val(sustainability_certification_recycled_sidewalls, unk_sustainability_certification_recycled_sidewalls).
0.92::acc(s26, sustainability_certification_recycled_sidewalls).
measured(s26, sustainability_certification_recycled_sidewalls, since_2014_847mi).
all_consistent(sustainability_certification_recycled_sidewalls) :- consistent(s26, sustainability_certification_recycled_sidewalls).
evidence(all_consistent(sustainability_certification_recycled_sidewalls)).
query(true_val(sustainability_certification_recycled_sidewalls, since_2014_847mi)).
query(true_val(sustainability_certification_recycled_sidewalls, unk_sustainability_certification_recycled_sidewalls)).