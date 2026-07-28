0.15::indep(sm).
0.25::indep(s4).
0.20::indep(s22).
0.30::indep(s26).
0.15::indep(s27).
0.20::indep(s28).
0.20::indep(s29).
0.70::indep(s30).
0.65::indep(s31).
0.50::indep(s33).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values jones_snowboards=Jones_Snowboards unk_brand=Unknown
% @importance 1.0

0.93::acc(s2, brand).

0.97::true_val(brand, jones_snowboards); 0.03::true_val(brand, unk_brand).

measured(s2, brand, jones_snowboards).

all_consistent(brand) :- consistent(s2, brand).

evidence(all_consistent(brand)).
query(true_val(brand, jones_snowboards)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values tweaker_pro_2_0=Tweaker_Pro_2.0 unk_model_name=Unknown
% @importance 0.95

0.93::acc(s2, model_name).
0.82::acc(s4, model_name).

0.95::true_val(model_name, tweaker_pro_2_0); 0.05::true_val(model_name, unk_model_name).

measured(s2, model_name, tweaker_pro_2_0).
measured(s4, model_name, tweaker_pro_2_0).

all_consistent(model_name) :-
    consistent(s2, model_name),
    (indep(s4), consistent(s4, model_name) ; \+indep(s4)).

evidence(all_consistent(model_name)).
query(true_val(model_name, tweaker_pro_2_0)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.875

0.90::acc(s4, model_year).
0.88::acc(s5, model_year).

0.95::true_val(model_year, y2027); 0.05::true_val(model_year, unk_model_year).

measured(s4, model_year, y2027).
measured(s5, model_year, y2027).

all_consistent(model_year) :-
    (indep(s4), consistent(s4, model_year) ; \+indep(s4)),
    consistent(s5, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values tweaker_am_freestyle=Tweaker_all_mountain_freestyle unk_model_series=Unknown
% @importance 0.85

0.86::acc(s5, model_series).

0.81::true_val(model_series, tweaker_am_freestyle); 0.19::true_val(model_series, unk_model_series).

measured(s5, model_series, tweaker_am_freestyle).

all_consistent(model_series) :- consistent(s5, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, tweaker_am_freestyle)).
query(true_val(model_series, unk_model_series)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.93::acc(s2, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s2, product_type, snowboard).

all_consistent(product_type) :- consistent(s2, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_am=Freestyle_All_Mountain_Freestyle unk_board_category=Unknown
% @importance 0.9

0.88::acc(s4, board_category).

0.90::true_val(board_category, freestyle_am); 0.10::true_val(board_category, unk_board_category).

measured(s4, board_category, freestyle_am).

all_consistent(board_category) :-
    (indep(s4), consistent(s4, board_category) ; \+indep(s4)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_am)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.93::acc(s2, gender).

0.97::true_val(gender, mens); 0.03::true_val(gender, unk_gender).

measured(s2, gender, mens).

all_consistent(gender) :- consistent(s2, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values jones_nidecker=Jones_Snowboards_Nidecker_Group unk_manufacturer=Unknown
% @importance 0.6

0.70::acc(s15, manufacturer).

0.60::true_val(manufacturer, jones_nidecker); 0.40::true_val(manufacturer, unk_manufacturer).

measured(s15, manufacturer, jones_nidecker).

all_consistent(manufacturer) :- consistent(s15, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, jones_nidecker)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr company_founder
% @type categorical
% @canonical false
% @original_name Company founder
% @values jeremy_jones=Jeremy_Jones unk_company_founder=Unknown
% @importance 0.4

0.72::acc(s16, company_founder).

0.68::true_val(company_founder, jeremy_jones); 0.32::true_val(company_founder, unk_company_founder).

measured(s16, company_founder, jeremy_jones).

all_consistent(company_founder) :- consistent(s16, company_founder).

evidence(all_consistent(company_founder)).
query(true_val(company_founder, jeremy_jones)).
query(true_val(company_founder, unk_company_founder)).

% @attr company_founded
% @type categorical
% @canonical false
% @original_name Company founded
% @values y2009=2009 y2010=2010
% @importance 0.5

0.90::acc(s17, company_founded).
0.65::acc(s15, company_founded).
0.68::acc(s18, company_founded).

0.55::true_val(company_founded, y2009); 0.45::true_val(company_founded, y2010).

measured(s17, company_founded, y2009).
measured(s15, company_founded, y2010).
measured(s18, company_founded, y2010).

all_consistent(company_founded) :-
    consistent(s17, company_founded),
    consistent(s15, company_founded),
    consistent(s18, company_founded).

evidence(all_consistent(company_founded)).
query(true_val(company_founded, y2009)).
query(true_val(company_founded, y2010)).

% @attr company_headquarters
% @type categorical
% @canonical false
% @original_name Company headquarters
% @values truckee_ca=Truckee_California_USA unk_company_headquarters=Unknown
% @importance 0.5

0.88::acc(s17, company_headquarters).

0.86::true_val(company_headquarters, truckee_ca); 0.14::true_val(company_headquarters, unk_company_headquarters).

measured(s17, company_headquarters, truckee_ca).

all_consistent(company_headquarters) :- consistent(s17, company_headquarters).

evidence(all_consistent(company_headquarters)).
query(true_val(company_headquarters, truckee_ca)).
query(true_val(company_headquarters, unk_company_headquarters)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values dubai_sws=Dubai_SWS_Board_Technology unk_manufacturing_location=Unknown
% @importance 0.6

0.65::acc(s15, manufacturing_location).

0.60::true_val(manufacturing_location, dubai_sws); 0.40::true_val(manufacturing_location, unk_manufacturing_location).

measured(s15, manufacturing_location, dubai_sws).

all_consistent(manufacturing_location) :- consistent(s15, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, dubai_sws)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values nidecker_group=Nidecker_Group unk_parent_company=Unknown
% @importance 0.6

0.65::acc(s15, parent_company).

0.60::true_val(parent_company, nidecker_group); 0.40::true_val(parent_company, unk_parent_company).

measured(s15, parent_company, nidecker_group).

all_consistent(parent_company) :- consistent(s15, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fair_trade_certified=Fair_Trade_Certified_since_2024_25 unk_sustainability_certification=Unknown
% @importance 0.52

0.93::acc(s19, sustainability_certification).
0.75::acc(s18, sustainability_certification).

0.95::true_val(sustainability_certification, fair_trade_certified); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s19, sustainability_certification, fair_trade_certified).
measured(s18, sustainability_certification, fair_trade_certified).

all_consistent(sustainability_certification) :-
    consistent(s19, sustainability_certification),
    consistent(s18, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fair_trade_certified)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_solar
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values solar_100_since_2020=100_pct_solar_energy_since_2020 unk_sustainability_certification_solar=Unknown
% @importance 0.5

0.82::acc(s20, sustainability_certification_solar).

0.77::true_val(sustainability_certification_solar, solar_100_since_2020); 0.23::true_val(sustainability_certification_solar, unk_sustainability_certification_solar).

measured(s20, sustainability_certification_solar, solar_100_since_2020).

all_consistent(sustainability_certification_solar) :- consistent(s20, sustainability_certification_solar).

evidence(all_consistent(sustainability_certification_solar)).
query(true_val(sustainability_certification_solar, solar_100_since_2020)).
query(true_val(sustainability_certification_solar, unk_sustainability_certification_solar)).

% @attr sustainability_certification_reup
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values reup_tech=ReUp_Tech_snowboard_recycling_2023 unk_sustainability_certification_reup=Unknown
% @importance 0.5

0.82::acc(s20, sustainability_certification_reup).

0.77::true_val(sustainability_certification_reup, reup_tech); 0.23::true_val(sustainability_certification_reup, unk_sustainability_certification_reup).

measured(s20, sustainability_certification_reup, reup_tech).

all_consistent(sustainability_certification_reup) :- consistent(s20, sustainability_certification_reup).

evidence(all_consistent(sustainability_certification_reup)).
query(true_val(sustainability_certification_reup, reup_tech)).
query(true_val(sustainability_certification_reup, unk_sustainability_certification_reup)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values shaun_gordon=Shaun_Gordon_UK unk_graphic_designer_artist=Unknown
% @importance 0.85

0.86::acc(s5, graphic_designer_artist).

0.81::true_val(graphic_designer_artist, shaun_gordon); 0.19::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s5, graphic_designer_artist, shaun_gordon).

all_consistent(graphic_designer_artist) :- consistent(s5, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, shaun_gordon)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr model_first_available_year
% @type categorical
% @canonical false
% @original_name model_first_available_year
% @values y2025=2025_model_year unk_model_first_available_year=Unknown
% @importance 0.7

0.70::acc(s25, model_first_available_year).

0.59::true_val(model_first_available_year, y2025); 0.41::true_val(model_first_available_year, unk_model_first_available_year).

measured(s25, model_first_available_year, y2025).

all_consistent(model_first_available_year) :- consistent(s25, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2025)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr redesign_year
% @type categorical
% @canonical false
% @original_name redesign_year
% @values yes_2027=Redesigned_outline_updated_profile_2026_27 unk_redesign_year=Unknown
% @importance 0.85

0.86::acc(s5, redesign_year).

0.81::true_val(redesign_year, yes_2027); 0.19::true_val(redesign_year, unk_redesign_year).

measured(s5, redesign_year, yes_2027).

all_consistent(redesign_year) :- consistent(s5, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, yes_2027)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr pro_construction_update_2027
% @type categorical
% @canonical false
% @original_name 2027 Pro Construction update
% @values basalt_replaces_carbon=Basalt_fiber_laminates_replacing_carbon unk_pro_construction_update_2027=Unknown
% @importance 0.85

0.86::acc(s5, pro_construction_update_2027).

0.81::true_val(pro_construction_update_2027, basalt_replaces_carbon); 0.19::true_val(pro_construction_update_2027, unk_pro_construction_update_2027).

measured(s5, pro_construction_update_2027, basalt_replaces_carbon).

all_consistent(pro_construction_update_2027) :- consistent(s5, pro_construction_update_2027).

evidence(all_consistent(pro_construction_update_2027)).
query(true_val(pro_construction_update_2027, basalt_replaces_carbon)).
query(true_val(pro_construction_update_2027, unk_pro_construction_update_2027)).

% @attr pro_construction_models
% @type categorical
% @canonical false
% @original_name Pro Construction applied to
% @values flagship_mt_tweaker=Flagship_Pro_Mountain_Twin_Pro_Tweaker_Pro_2_0 unk_pro_construction_models=Unknown
% @importance 0.85

0.86::acc(s5, pro_construction_models).

0.81::true_val(pro_construction_models, flagship_mt_tweaker); 0.19::true_val(pro_construction_models, unk_pro_construction_models).

measured(s5, pro_construction_models, flagship_mt_tweaker).

all_consistent(pro_construction_models) :- consistent(s5, pro_construction_models).

evidence(all_consistent(pro_construction_models)).
query(true_val(pro_construction_models, flagship_mt_tweaker)).
query(true_val(pro_construction_models, unk_pro_construction_models)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values tweaker_pro_2025_2026=Jones_Tweaker_Pro_2025_2026 unk_predecessor_model_name=Unknown
% @importance 0.7

0.70::acc(s25, predecessor_model_name).

0.59::true_val(predecessor_model_name, tweaker_pro_2025_2026); 0.41::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s25, predecessor_model_name, tweaker_pro_2025_2026).

all_consistent(predecessor_model_name) :- consistent(s25, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, tweaker_pro_2025_2026)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values tweaker_2_0=Jones_Tweaker_2_0_softer_less_aggressive unk_comparable_board_same_brand=Unknown
% @importance 0.875

0.82::acc(s4, comparable_board_same_brand).
0.78::acc(s25, comparable_board_same_brand).

0.95::true_val(comparable_board_same_brand, tweaker_2_0); 0.05::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s4, comparable_board_same_brand, tweaker_2_0).
measured(s25, comparable_board_same_brand, tweaker_2_0).

all_consistent(comparable_board_same_brand) :-
    (indep(s4), consistent(s4, comparable_board_same_brand) ; \+indep(s4)),
    consistent(s25, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, tweaker_2_0)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 0.85

0.93::acc(sm, availability_status).

0.95::true_val(availability_status, preorder); 0.05::true_val(availability_status, unk_availability_status).

measured(sm, availability_status, preorder).

all_consistent(availability_status) :-
    (indep(sm), consistent(sm, availability_status) ; \+indep(sm)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values june_8_2026=June_8_2026 early_june_2026=Early_June_2026 may_2026=May_2026
% @importance 0.78

0.90::acc(sm, estimated_availability_date).
0.72::acc(s22, estimated_availability_date).
0.80::acc(s4, estimated_availability_date).

0.40::true_val(estimated_availability_date, june_8_2026); 0.35::true_val(estimated_availability_date, early_june_2026); 0.25::true_val(estimated_availability_date, may_2026).

measured(sm, estimated_availability_date, june_8_2026).
measured(s22, estimated_availability_date, early_june_2026).
measured(s4, estimated_availability_date, may_2026).

all_consistent(estimated_availability_date) :-
    (indep(sm), consistent(sm, estimated_availability_date) ; \+indep(sm)),
    (indep(s22), consistent(s22, estimated_availability_date) ; \+indep(s22)),
    (indep(s4), consistent(s4, estimated_availability_date) ; \+indep(s4)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, june_8_2026)).
query(true_val(estimated_availability_date, early_june_2026)).
query(true_val(estimated_availability_date, may_2026)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v629_95=629.95 unk_price_usd_msrp=Unknown
% @importance 1.0

0.93::acc(s2, price_usd_msrp).

0.95::true_val(price_usd_msrp, v629_95); 0.05::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s2, price_usd_msrp, v629_95).

all_consistent(price_usd_msrp) :- consistent(s2, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v629_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v1099_99=1099.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.92::acc(s4, price_aud_merchant).
0.93::acc(sm, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1099_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s4, price_aud_merchant, v1099_99).
measured(sm, price_aud_merchant, v1099_99).

all_consistent(price_aud_merchant) :-
    (indep(s4), consistent(s4, price_aud_merchant) ; \+indep(s4)),
    (indep(sm), consistent(sm, price_aud_merchant) ; \+indep(sm)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1099_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_tweaker_standard
% @type numeric
% @unit USD
% @canonical false
% @original_name Standard Tweaker 2.0 price (USD, Jones direct)
% @values v529_95=529.95 unk_price_usd_tweaker_standard=Unknown
% @importance 1.0

0.93::acc(s2, price_usd_tweaker_standard).

0.95::true_val(price_usd_tweaker_standard, v529_95); 0.05::true_val(price_usd_tweaker_standard, unk_price_usd_tweaker_standard).

measured(s2, price_usd_tweaker_standard, v529_95).

all_consistent(price_usd_tweaker_standard) :- consistent(s2, price_usd_tweaker_standard).

evidence(all_consistent(price_usd_tweaker_standard)).
query(true_val(price_usd_tweaker_standard, v529_95)).
query(true_val(price_usd_tweaker_standard, unk_price_usd_tweaker_standard)).

% @attr price_usd_tweaker_standard_evo
% @type categorical
% @unit USD
% @canonical false
% @original_name Standard Tweaker 2.0 price (evo, on sale)
% @values v529_95_list_423_96_sale=529.95_list_423.96_sale unk_price_usd_tweaker_standard_evo=Unknown
% @importance 0.7

0.82::acc(s24, price_usd_tweaker_standard_evo).

0.66::true_val(price_usd_tweaker_standard_evo, v529_95_list_423_96_sale); 0.34::true_val(price_usd_tweaker_standard_evo, unk_price_usd_tweaker_standard_evo).

measured(s24, price_usd_tweaker_standard_evo, v529_95_list_423_96_sale).

all_consistent(price_usd_tweaker_standard_evo) :- consistent(s24, price_usd_tweaker_standard_evo).

evidence(all_consistent(price_usd_tweaker_standard_evo)).
query(true_val(price_usd_tweaker_standard_evo, v529_95_list_423_96_sale)).
query(true_val(price_usd_tweaker_standard_evo, unk_price_usd_tweaker_standard_evo)).

% @attr price_comparison_avg
% @type categorical
% @canonical false
% @original_name Price comparison to average snowboard
% @values above_avg_35_95=35.95_more_than_avg_468.01 unk_price_comparison_avg=Unknown
% @importance 0.85

0.72::acc(s25, price_comparison_avg).

0.57::true_val(price_comparison_avg, above_avg_35_95); 0.43::true_val(price_comparison_avg, unk_price_comparison_avg).

measured(s25, price_comparison_avg, above_avg_35_95).

all_consistent(price_comparison_avg) :- consistent(s25, price_comparison_avg).

evidence(all_consistent(price_comparison_avg)).
query(true_val(price_comparison_avg, above_avg_35_95)).
query(true_val(price_comparison_avg, unk_price_comparison_avg)).

% @attr availability_status_jones_direct
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock=In_stock_ships_free unk_availability_status_jones_direct=Unknown
% @importance 1.0

0.93::acc(s2, availability_status_jones_direct).

0.90::true_val(availability_status_jones_direct, in_stock); 0.10::true_val(availability_status_jones_direct, unk_availability_status_jones_direct).

measured(s2, availability_status_jones_direct, in_stock).

all_consistent(availability_status_jones_direct) :- consistent(s2, availability_status_jones_direct).

evidence(all_consistent(availability_status_jones_direct)).
query(true_val(availability_status_jones_direct, in_stock)).
query(true_val(availability_status_jones_direct, unk_availability_status_jones_direct)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_2026=In_stock_2026_model unk_availability_status_evo=Unknown
% @importance 0.8

0.82::acc(s26, availability_status_evo).

0.74::true_val(availability_status_evo, in_stock_2026); 0.26::true_val(availability_status_evo, unk_availability_status_evo).

measured(s26, availability_status_evo, in_stock_2026).

all_consistent(availability_status_evo) :- consistent(s26, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock_2026)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_milosport
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2027=2027_model_listed unk_availability_status_milosport=Unknown
% @importance 0.55

0.55::acc(s27, availability_status_milosport).

0.42::true_val(availability_status_milosport, listed_2027); 0.58::true_val(availability_status_milosport, unk_availability_status_milosport).

measured(s27, availability_status_milosport, listed_2027).

all_consistent(availability_status_milosport) :- consistent(s27, availability_status_milosport).

evidence(all_consistent(availability_status_milosport)).
query(true_val(availability_status_milosport, listed_2027)).
query(true_val(availability_status_milosport, unk_availability_status_milosport)).

% @attr availability_status_ballistyx
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_au=Melbourne_AU_since_1991 unk_availability_status_ballistyx=Unknown
% @importance 0.85

0.88::acc(s4, availability_status_ballistyx).

0.76::true_val(availability_status_ballistyx, available_au); 0.24::true_val(availability_status_ballistyx, unk_availability_status_ballistyx).

measured(s4, availability_status_ballistyx, available_au).

all_consistent(availability_status_ballistyx) :-
    (indep(s4), consistent(s4, availability_status_ballistyx) ; \+indep(s4)).

evidence(all_consistent(availability_status_ballistyx)).
query(true_val(availability_status_ballistyx, available_au)).
query(true_val(availability_status_ballistyx, unk_availability_status_ballistyx)).

% @attr availability_status_balmoral
% @type categorical
% @canonical false
% @original_name availability_status
% @values preorder_2027_au=2027_preorder_Sydney_AU unk_availability_status_balmoral=Unknown
% @importance 0.65

0.72::acc(s22, availability_status_balmoral).

0.60::true_val(availability_status_balmoral, preorder_2027_au); 0.40::true_val(availability_status_balmoral, unk_availability_status_balmoral).

measured(s22, availability_status_balmoral, preorder_2027_au).

all_consistent(availability_status_balmoral) :-
    (indep(s22), consistent(s22, availability_status_balmoral) ; \+indep(s22)).

evidence(all_consistent(availability_status_balmoral)).
query(true_val(availability_status_balmoral, preorder_2027_au)).
query(true_val(availability_status_balmoral, unk_availability_status_balmoral)).

% @attr availability_status_basenz
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_nz=2027_Tweaker_2_0_listed_NZ unk_availability_status_basenz=Unknown
% @importance 0.5

0.55::acc(s28, availability_status_basenz).

0.42::true_val(availability_status_basenz, listed_nz); 0.58::true_val(availability_status_basenz, unk_availability_status_basenz).

measured(s28, availability_status_basenz, listed_nz).

all_consistent(availability_status_basenz) :-
    (indep(s28), consistent(s28, availability_status_basenz) ; \+indep(s28)).

evidence(all_consistent(availability_status_basenz)).
query(true_val(availability_status_basenz, listed_nz)).
query(true_val(availability_status_basenz, unk_availability_status_basenz)).

% @attr availability_status_nzshred
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_nz_tweaker=2027_Tweaker_listed_NZ unk_availability_status_nzshred=Unknown
% @importance 0.4

0.48::acc(s29, availability_status_nzshred).

0.30::true_val(availability_status_nzshred, listed_nz_tweaker); 0.70::true_val(availability_status_nzshred, unk_availability_status_nzshred).

measured(s29, availability_status_nzshred, listed_nz_tweaker).

all_consistent(availability_status_nzshred) :-
    (indep(s29), consistent(s29, availability_status_nzshred) ; \+indep(s29)).

evidence(all_consistent(availability_status_nzshred)).
query(true_val(availability_status_nzshred, listed_nz_tweaker)).
query(true_val(availability_status_nzshred, unk_availability_status_nzshred)).

% @attr availability_status_blauer
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2025=2025_Tweaker_Pro_listed unk_availability_status_blauer=Unknown
% @importance 0.7

0.68::acc(s30, availability_status_blauer).

0.59::true_val(availability_status_blauer, listed_2025); 0.41::true_val(availability_status_blauer, unk_availability_status_blauer).

measured(s30, availability_status_blauer, listed_2025).

all_consistent(availability_status_blauer) :- consistent(s30, availability_status_blauer).

evidence(all_consistent(availability_status_blauer)).
query(true_val(availability_status_blauer, listed_2025)).
query(true_val(availability_status_blauer, unk_availability_status_blauer)).

% @attr availability_status_liptrix
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_2025_liptrix=2025_Tweaker_Pro_listed unk_availability_status_liptrix=Unknown
% @importance 0.55

0.58::acc(s31, availability_status_liptrix).

0.49::true_val(availability_status_liptrix, listed_2025_liptrix); 0.51::true_val(availability_status_liptrix, unk_availability_status_liptrix).

measured(s31, availability_status_liptrix, listed_2025_liptrix).

all_consistent(availability_status_liptrix) :- consistent(s31, availability_status_liptrix).

evidence(all_consistent(availability_status_liptrix)).
query(true_val(availability_status_liptrix, listed_2025_liptrix)).
query(true_val(availability_status_liptrix, unk_availability_status_liptrix)).

% @attr availability_status_powderstuff
% @type categorical
% @canonical false
% @original_name availability_status
% @values guide_available=Product_guide_available unk_availability_status_powderstuff=Unknown
% @importance 0.75

0.58::acc(s32, availability_status_powderstuff).

0.45::true_val(availability_status_powderstuff, guide_available); 0.55::true_val(availability_status_powderstuff, unk_availability_status_powderstuff).

measured(s32, availability_status_powderstuff, guide_available).

all_consistent(availability_status_powderstuff) :- consistent(s32, availability_status_powderstuff).

evidence(all_consistent(availability_status_powderstuff)).
query(true_val(availability_status_powderstuff, guide_available)).
query(true_val(availability_status_powderstuff, unk_availability_status_powderstuff)).

% @attr availability_status_melbourne_snow
% @type categorical
% @canonical false
% @original_name availability_status
% @values listed_tweaker_2_0=Tweaker_2_0_listed_AU unk_availability_status_melbourne_snow=Unknown
% @importance 0.5

0.55::acc(s33, availability_status_melbourne_snow).

0.36::true_val(availability_status_melbourne_snow, listed_tweaker_2_0); 0.64::true_val(availability_status_melbourne_snow, unk_availability_status_melbourne_snow).

measured(s33, availability_status_melbourne_snow, listed_tweaker_2_0).

all_consistent(availability_status_melbourne_snow) :-
    (indep(s33), consistent(s33, availability_status_melbourne_snow) ; \+indep(s33)).

evidence(all_consistent(availability_status_melbourne_snow)).
query(true_val(availability_status_melbourne_snow, listed_tweaker_2_0)).
query(true_val(availability_status_melbourne_snow, unk_availability_status_melbourne_snow)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values true_twin=True_Twin_symmetrical unk_shape=Unknown
% @importance 0.95

0.93::acc(s2, shape).
0.82::acc(s4, shape).

0.95::true_val(shape, true_twin); 0.05::true_val(shape, unk_shape).

measured(s2, shape, true_twin).
measured(s4, shape, true_twin).

all_consistent(shape) :-
    consistent(s2, shape),
    (indep(s4), consistent(s4, shape) ; \+indep(s4)).

evidence(all_consistent(shape)).
query(true_val(shape, true_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values true_camber=True_Camber_full_camber unk_camber_type=Unknown
% @importance 0.95

0.93::acc(s2, camber_type).
0.82::acc(s4, camber_type).

0.95::true_val(camber_type, true_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s2, camber_type, true_camber).
measured(s4, camber_type, true_camber).

all_consistent(camber_type) :-
    consistent(s2, camber_type),
    (indep(s4), consistent(s4, camber_type) ; \+indep(s4)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, true_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v6=6.0 unk_camber_height_mm=Unknown
% @importance 0.88

0.88::acc(s34, camber_height_mm).

0.75::true_val(camber_height_mm, v6); 0.25::true_val(camber_height_mm, unk_camber_height_mm).

measured(s34, camber_height_mm, v6).

all_consistent(camber_height_mm) :- consistent(s34, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v6)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values medium_3d_contour_dual_flip=Medium_3D_Contour_Base_Dual_Radius_Flip_Tips unk_camber_description=Unknown
% @importance 0.85

0.90::acc(sm, camber_description).

0.95::true_val(camber_description, medium_3d_contour_dual_flip); 0.05::true_val(camber_description, unk_camber_description).

measured(sm, camber_description, medium_3d_contour_dual_flip).

all_consistent(camber_description) :-
    (indep(sm), consistent(sm, camber_description) ; \+indep(sm)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, medium_3d_contour_dual_flip)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_bevel
% @type categorical
% @canonical false
% @original_name camber_description
% @values spoon_4mm_nose_tail=4mm_spoon_bevel_nose_and_tail unk_camber_description_bevel=Unknown
% @importance 0.85

0.90::acc(sm, camber_description_bevel).

0.95::true_val(camber_description_bevel, spoon_4mm_nose_tail); 0.05::true_val(camber_description_bevel, unk_camber_description_bevel).

measured(sm, camber_description_bevel, spoon_4mm_nose_tail).

all_consistent(camber_description_bevel) :-
    (indep(sm), consistent(sm, camber_description_bevel) ; \+indep(sm)).

evidence(all_consistent(camber_description_bevel)).
query(true_val(camber_description_bevel, spoon_4mm_nose_tail)).
query(true_val(camber_description_bevel, unk_camber_description_bevel)).

% @attr camber_description_spoon
% @type categorical
% @canonical false
% @original_name camber_description
% @values subtle_spoon_tips=Subtle_spoon_shaping_reduce_swing_weight unk_camber_description_spoon=Unknown
% @importance 0.9

0.82::acc(s4, camber_description_spoon).

0.70::true_val(camber_description_spoon, subtle_spoon_tips); 0.30::true_val(camber_description_spoon, unk_camber_description_spoon).

measured(s4, camber_description_spoon, subtle_spoon_tips).

all_consistent(camber_description_spoon) :-
    (indep(s4), consistent(s4, camber_description_spoon) ; \+indep(s4)).

evidence(all_consistent(camber_description_spoon)).
query(true_val(camber_description_spoon, subtle_spoon_tips)).
query(true_val(camber_description_spoon, unk_camber_description_spoon)).

% @attr blunt_nose_design
% @type categorical
% @canonical false
% @original_name Blunt nose design
% @values reduces_swing_weight_float=Reduces_swing_weight_float_benefits unk_blunt_nose_design=Unknown
% @importance 0.7

0.72::acc(s30, blunt_nose_design).

0.59::true_val(blunt_nose_design, reduces_swing_weight_float); 0.41::true_val(blunt_nose_design, unk_blunt_nose_design).

measured(s30, blunt_nose_design, reduces_swing_weight_float).

all_consistent(blunt_nose_design) :- consistent(s30, blunt_nose_design).

evidence(all_consistent(blunt_nose_design)).
query(true_val(blunt_nose_design, reduces_swing_weight_float)).
query(true_val(blunt_nose_design, unk_blunt_nose_design)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v0=0.0 unk_taper=Unknown
% @importance 0.925

0.93::acc(s2, taper).
0.90::acc(sm, taper).

0.95::true_val(taper, v0); 0.05::true_val(taper, unk_taper).

measured(s2, taper, v0).
measured(sm, taper, v0).

all_consistent(taper) :-
    consistent(s2, taper),
    (indep(sm), consistent(sm, taper) ; \+indep(sm)).

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

0.93::acc(s2, setback).

0.95::true_val(setback, v0); 0.05::true_val(setback, unk_setback).

measured(s2, setback, v0).

all_consistent(setback) :- consistent(s2, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values progressive=Progressive_sidecut unk_sidecut_type=Unknown
% @importance 0.7

0.72::acc(s30, sidecut_type).

0.59::true_val(sidecut_type, progressive); 0.41::true_val(sidecut_type, unk_sidecut_type).

measured(s30, sidecut_type, progressive).

all_consistent(sidecut_type) :- consistent(s30, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, progressive)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v8=8.0 v7=7.0 v7_5=7.5
% @importance 0.82

0.88::acc(sm, flex_rating_10).
0.78::acc(s4, flex_rating_10).
0.82::acc(s25, flex_rating_10).
0.75::acc(s30, flex_rating_10).

0.40::true_val(flex_rating_10, v8); 0.35::true_val(flex_rating_10, v7); 0.25::true_val(flex_rating_10, v7_5).

measured(sm, flex_rating_10, v8).
measured(s4, flex_rating_10, v7).
measured(s25, flex_rating_10, v7_5).
measured(s30, flex_rating_10, v8).

all_consistent(flex_rating_10) :-
    (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)),
    (indep(s4), consistent(s4, flex_rating_10) ; \+indep(s4)),
    consistent(s25, flex_rating_10),
    (indep(s30), consistent(s30, flex_rating_10) ; \+indep(s30)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v8)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, v7_5)).

% @attr flex_rating_5
% @type numeric
% @unit /5
% @canonical true
% @original_name flex_rating_5
% @values v4=4.0 unk_flex_rating_5=Unknown
% @importance 0.8

0.82::acc(s26, flex_rating_5).

0.74::true_val(flex_rating_5, v4); 0.26::true_val(flex_rating_5, unk_flex_rating_5).

measured(s26, flex_rating_5, v4).

all_consistent(flex_rating_5) :-
    (indep(s26), consistent(s26, flex_rating_5) ; \+indep(s26)).

evidence(all_consistent(flex_rating_5)).
query(true_val(flex_rating_5, v4)).
query(true_val(flex_rating_5, unk_flex_rating_5)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values twin_flex=Twin_flex_same_stiffness_nose_to_tail unk_flex_direction=Unknown
% @importance 0.7

0.72::acc(s30, flex_direction).

0.59::true_val(flex_direction, twin_flex); 0.41::true_val(flex_direction, unk_flex_direction).

measured(s30, flex_direction, twin_flex).

all_consistent(flex_direction) :- consistent(s30, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, twin_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiffer_by_3_pts=Noticeably_stiffer_than_standard_Tweaker_by_3_pts unk_flex_feel=Unknown
% @importance 0.85

0.78::acc(s25, flex_feel).

0.57::true_val(flex_feel, stiffer_by_3_pts); 0.43::true_val(flex_feel, unk_flex_feel).

measured(s25, flex_feel, stiffer_by_3_pts).

all_consistent(flex_feel) :- consistent(s25, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiffer_by_3_pts)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr forever_flex
% @type categorical
% @canonical false
% @original_name Forever Flex
% @values yes_factory_broken_in=Factory_broken_in_20_day_equivalent unk_forever_flex=Unknown
% @importance 0.775

0.90::acc(sm, forever_flex).
0.72::acc(s30, forever_flex).

0.95::true_val(forever_flex, yes_factory_broken_in); 0.05::true_val(forever_flex, unk_forever_flex).

measured(sm, forever_flex, yes_factory_broken_in).
measured(s30, forever_flex, yes_factory_broken_in).

all_consistent(forever_flex) :-
    (indep(sm), consistent(sm, forever_flex) ; \+indep(sm)),
    (indep(s30), consistent(s30, forever_flex) ; \+indep(s30)).

evidence(all_consistent(forever_flex)).
query(true_val(forever_flex, yes_factory_broken_in)).
query(true_val(forever_flex, unk_forever_flex)).

% @attr flex_feel_assessment
% @type categorical
% @canonical false
% @original_name flex_feel
% @values stiff_big_jumps_not_rails=Stiff_for_jumps_stability_too_stiff_for_rail_pressing unk_flex_feel_assessment=Unknown
% @importance 0.85

0.78::acc(s25, flex_feel_assessment).

0.57::true_val(flex_feel_assessment, stiff_big_jumps_not_rails); 0.43::true_val(flex_feel_assessment, unk_flex_feel_assessment).

measured(s25, flex_feel_assessment, stiff_big_jumps_not_rails).

all_consistent(flex_feel_assessment) :- consistent(s25, flex_feel_assessment).

evidence(all_consistent(flex_feel_assessment)).
query(true_val(flex_feel_assessment, stiff_big_jumps_not_rails)).
query(true_val(flex_feel_assessment, unk_flex_feel_assessment)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values boost_surf_core=Boost_Surf_Core boost_core=Boost_Core
% @importance 0.95

0.93::acc(s2, core_material).
0.80::acc(s4, core_material).

0.60::true_val(core_material, boost_surf_core); 0.40::true_val(core_material, boost_core).

measured(s2, core_material, boost_surf_core).
measured(s4, core_material, boost_core).

all_consistent(core_material) :-
    consistent(s2, core_material),
    (indep(s4), consistent(s4, core_material) ; \+indep(s4)).

evidence(all_consistent(core_material)).
query(true_val(core_material, boost_surf_core)).
query(true_val(core_material, boost_core)).

% @attr core_material_composition
% @type categorical
% @canonical false
% @original_name core_material
% @values triple_density_bamboo_paulownia_poplar=Triple_density_Bamboo_Paulownia_Poplar unk_core_material_composition=Unknown
% @importance 1.0

0.93::acc(s2, core_material_composition).

0.90::true_val(core_material_composition, triple_density_bamboo_paulownia_poplar); 0.10::true_val(core_material_composition, unk_core_material_composition).

measured(s2, core_material_composition, triple_density_bamboo_paulownia_poplar).

all_consistent(core_material_composition) :- consistent(s2, core_material_composition).

evidence(all_consistent(core_material_composition)).
query(true_val(core_material_composition, triple_density_bamboo_paulownia_poplar)).
query(true_val(core_material_composition, unk_core_material_composition)).

% @attr core_material_wood_detail
% @type categorical
% @canonical false
% @original_name core_material
% @values bamboo_stringers_paulownia_poplar=Bamboo_stringers_sidecut_Paulownia_Poplar_dampening unk_core_material_wood_detail=Unknown
% @importance 0.925

0.93::acc(s2, core_material_wood_detail).
0.88::acc(sm, core_material_wood_detail).

0.95::true_val(core_material_wood_detail, bamboo_stringers_paulownia_poplar); 0.05::true_val(core_material_wood_detail, unk_core_material_wood_detail).

measured(s2, core_material_wood_detail, bamboo_stringers_paulownia_poplar).
measured(sm, core_material_wood_detail, bamboo_stringers_paulownia_poplar).

all_consistent(core_material_wood_detail) :-
    consistent(s2, core_material_wood_detail),
    (indep(sm), consistent(sm, core_material_wood_detail) ; \+indep(sm)).

evidence(all_consistent(core_material_wood_detail)).
query(true_val(core_material_wood_detail, bamboo_stringers_paulownia_poplar)).
query(true_val(core_material_wood_detail, unk_core_material_wood_detail)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values aerospace_synthetic_dampening=Aerospace_derived_synthetic_core_dampening_swing_weight unk_construction_material_innovation=Unknown
% @importance 1.0

0.93::acc(s2, construction_material_innovation).

0.90::true_val(construction_material_innovation, aerospace_synthetic_dampening); 0.10::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s2, construction_material_innovation, aerospace_synthetic_dampening).

all_consistent(construction_material_innovation) :- consistent(s2, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, aerospace_synthetic_dampening)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values basalt_pro_layup=Basalt_Pro_Layup_basalt_fibre unk_laminate=Unknown
% @importance 0.875

0.85::acc(s4, laminate).
0.86::acc(s5, laminate).

0.95::true_val(laminate, basalt_pro_layup); 0.05::true_val(laminate, unk_laminate).

measured(s4, laminate, basalt_pro_layup).
measured(s5, laminate, basalt_pro_layup).

all_consistent(laminate) :-
    (indep(s4), consistent(s4, laminate) ; \+indep(s4)),
    consistent(s5, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, basalt_pro_layup)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_2025
% @type categorical
% @canonical false
% @original_name laminate
% @values triax_carbon_innegra_basalt=Triax_fiberglass_carbon_Innegra_basalt_stringers unk_laminate_2025=Unknown
% @importance 0.625

0.72::acc(s30, laminate_2025).
0.62::acc(s31, laminate_2025).

0.90::true_val(laminate_2025, triax_carbon_innegra_basalt); 0.10::true_val(laminate_2025, unk_laminate_2025).

measured(s30, laminate_2025, triax_carbon_innegra_basalt).
measured(s31, laminate_2025, triax_carbon_innegra_basalt).

all_consistent(laminate_2025) :-
    (indep(s30), consistent(s30, laminate_2025) ; \+indep(s30)),
    (indep(s31), consistent(s31, laminate_2025) ; \+indep(s31)).

evidence(all_consistent(laminate_2025)).
query(true_val(laminate_2025, triax_carbon_innegra_basalt)).
query(true_val(laminate_2025, unk_laminate_2025)).

% @attr laminate_evolution
% @type categorical
% @canonical false
% @original_name laminate
% @values basalt_pro_koroyd_bio_resin_2027=2027_Basalt_Pro_Koroyd_Bio_Resin_replaces_carbon unk_laminate_evolution=Unknown
% @importance 0.775

0.86::acc(s5, laminate_evolution).
0.72::acc(s30, laminate_evolution).

0.90::true_val(laminate_evolution, basalt_pro_koroyd_bio_resin_2027); 0.10::true_val(laminate_evolution, unk_laminate_evolution).

measured(s5, laminate_evolution, basalt_pro_koroyd_bio_resin_2027).
measured(s30, laminate_evolution, basalt_pro_koroyd_bio_resin_2027).

all_consistent(laminate_evolution) :-
    consistent(s5, laminate_evolution),
    (indep(s30), consistent(s30, laminate_evolution) ; \+indep(s30)).

evidence(all_consistent(laminate_evolution)).
query(true_val(laminate_evolution, basalt_pro_koroyd_bio_resin_2027)).
query(true_val(laminate_evolution, unk_laminate_evolution)).

% @attr laminate_fiberglass
% @type categorical
% @canonical false
% @original_name laminate
% @values triaxial_fiberglass=Triaxial_fiberglass_triple_layer_multi_axis unk_laminate_fiberglass=Unknown
% @importance 1.0

0.93::acc(s2, laminate_fiberglass).

0.90::true_val(laminate_fiberglass, triaxial_fiberglass); 0.10::true_val(laminate_fiberglass, unk_laminate_fiberglass).

measured(s2, laminate_fiberglass, triaxial_fiberglass).

all_consistent(laminate_fiberglass) :- consistent(s2, laminate_fiberglass).

evidence(all_consistent(laminate_fiberglass)).
query(true_val(laminate_fiberglass, triaxial_fiberglass)).
query(true_val(laminate_fiberglass, unk_laminate_fiberglass)).

% @attr construction_material_innovation_carbon
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values reclaimed_aerospace_carbon_stringer=Reclaimed_Aerospace_Carbon_Stringer unk_construction_material_innovation_carbon=Unknown
% @importance 1.0

0.93::acc(s2, construction_material_innovation_carbon).

0.90::true_val(construction_material_innovation_carbon, reclaimed_aerospace_carbon_stringer); 0.10::true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon).

measured(s2, construction_material_innovation_carbon, reclaimed_aerospace_carbon_stringer).

all_consistent(construction_material_innovation_carbon) :- consistent(s2, construction_material_innovation_carbon).

evidence(all_consistent(construction_material_innovation_carbon)).
query(true_val(construction_material_innovation_carbon, reclaimed_aerospace_carbon_stringer)).
query(true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values bio_based_27_pct_plant=Bio_based_epoxy_27pct_plant_carbon_33pct_CO2_reduction unk_resin=Unknown
% @importance 1.0

0.93::acc(s2, resin).

0.90::true_val(resin, bio_based_27_pct_plant); 0.10::true_val(resin, unk_resin).

measured(s2, resin, bio_based_27_pct_plant).

all_consistent(resin) :- consistent(s2, resin).

evidence(all_consistent(resin)).
query(true_val(resin, bio_based_27_pct_plant)).
query(true_val(resin, unk_resin)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values recycled_abs_round=Recycled_ABS_round_finish unk_sidewall_material=Unknown
% @importance 0.925

0.90::acc(sm, sidewall_material).
0.93::acc(s2, sidewall_material).

0.95::true_val(sidewall_material, recycled_abs_round); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(sm, sidewall_material, recycled_abs_round).
measured(s2, sidewall_material, recycled_abs_round).

all_consistent(sidewall_material) :-
    consistent(s2, sidewall_material),
    (indep(sm), consistent(sm, sidewall_material) ; \+indep(sm)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, recycled_abs_round)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr edge_material
% @type categorical
% @canonical false
% @original_name Edge material
% @values recycled_german_steel=Recycled_German_steel unk_edge_material=Unknown
% @importance 0.925

0.90::acc(sm, edge_material).
0.93::acc(s2, edge_material).

0.95::true_val(edge_material, recycled_german_steel); 0.05::true_val(edge_material, unk_edge_material).

measured(sm, edge_material, recycled_german_steel).
measured(s2, edge_material, recycled_german_steel).

all_consistent(edge_material) :-
    consistent(s2, edge_material),
    (indep(sm), consistent(sm, edge_material) ; \+indep(sm)).

evidence(all_consistent(edge_material)).
query(true_val(edge_material, recycled_german_steel)).
query(true_val(edge_material, unk_edge_material)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_8000=Sintered_8000 unk_base_material=Unknown
% @importance 0.95

0.93::acc(s2, base_material).
0.82::acc(s4, base_material).
0.90::acc(sm, base_material).

0.95::true_val(base_material, sintered_8000); 0.05::true_val(base_material, unk_base_material).

measured(s2, base_material, sintered_8000).
measured(s4, base_material, sintered_8000).
measured(sm, base_material, sintered_8000).

all_consistent(base_material) :-
    consistent(s2, base_material),
    (indep(s4), consistent(s4, base_material) ; \+indep(s4)),
    (indep(sm), consistent(sm, base_material) ; \+indep(sm)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_8000)).
query(true_val(base_material, unk_base_material)).

% @attr base_material_description
% @type categorical
% @canonical false
% @original_name base_material
% @values premium_sintered_fast_wax=Premium_sintered_ultra_fast_wax_absorbent_easy_repair unk_base_material_description=Unknown
% @importance 1.0

0.93::acc(s2, base_material_description).

0.90::true_val(base_material_description, premium_sintered_fast_wax); 0.10::true_val(base_material_description, unk_base_material_description).

measured(s2, base_material_description, premium_sintered_fast_wax).

all_consistent(base_material_description) :- consistent(s2, base_material_description).

evidence(all_consistent(base_material_description)).
query(true_val(base_material_description, premium_sintered_fast_wax)).
query(true_val(base_material_description, unk_base_material_description)).

% @attr base_material_year_change
% @type categorical
% @canonical false
% @original_name base_material
% @values sintered_9000_to_8000=2025_Sintered_9000_to_2026_Sintered_8000 unk_base_material_year_change=Unknown
% @importance 0.85

0.68::acc(s30, base_material_year_change).
0.90::acc(s2, base_material_year_change).
0.82::acc(s26, base_material_year_change).

0.90::true_val(base_material_year_change, sintered_9000_to_8000); 0.10::true_val(base_material_year_change, unk_base_material_year_change).

measured(s30, base_material_year_change, sintered_9000_to_8000).
measured(s2, base_material_year_change, sintered_9000_to_8000).
measured(s26, base_material_year_change, sintered_9000_to_8000).

all_consistent(base_material_year_change) :-
    consistent(s2, base_material_year_change),
    (indep(s26), consistent(s26, base_material_year_change) ; \+indep(s26)),
    (indep(s30), consistent(s30, base_material_year_change) ; \+indep(s30)).

evidence(all_consistent(base_material_year_change)).
query(true_val(base_material_year_change, sintered_9000_to_8000)).
query(true_val(base_material_year_change, unk_base_material_year_change)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values premium_durable_scratch_resistant=Premium_durable_scratch_resistant unk_topsheet=Unknown
% @importance 0.925

0.93::acc(s2, topsheet).
0.90::acc(sm, topsheet).

0.95::true_val(topsheet, premium_durable_scratch_resistant); 0.05::true_val(topsheet, unk_topsheet).

measured(s2, topsheet, premium_durable_scratch_resistant).
measured(sm, topsheet, premium_durable_scratch_resistant).

all_consistent(topsheet) :-
    consistent(s2, topsheet),
    (indep(sm), consistent(sm, topsheet) ; \+indep(sm)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, premium_durable_scratch_resistant)).
query(true_val(topsheet, unk_topsheet)).

% @attr factory_wax
% @type categorical
% @canonical false
% @original_name Factory wax
% @values wend_natural_wax=WEND_Natural_Wax unk_factory_wax=Unknown
% @importance 0.925

0.93::acc(s2, factory_wax).
0.90::acc(sm, factory_wax).

0.95::true_val(factory_wax, wend_natural_wax); 0.05::true_val(factory_wax, unk_factory_wax).

measured(s2, factory_wax, wend_natural_wax).
measured(sm, factory_wax, wend_natural_wax).

all_consistent(factory_wax) :-
    consistent(s2, factory_wax),
    (indep(sm), consistent(sm, factory_wax) ; \+indep(sm)).

evidence(all_consistent(factory_wax)).
query(true_val(factory_wax, wend_natural_wax)).
query(true_val(factory_wax, unk_factory_wax)).

% @attr factory_tuned
% @type categorical
% @canonical false
% @original_name Factory tuned
% @values yes_detuned_tips=Yes_detuned_tip_tail_ready_to_ride unk_factory_tuned=Unknown
% @importance 0.85

0.90::acc(sm, factory_tuned).

0.95::true_val(factory_tuned, yes_detuned_tips); 0.05::true_val(factory_tuned, unk_factory_tuned).

measured(sm, factory_tuned, yes_detuned_tips).

all_consistent(factory_tuned) :-
    (indep(sm), consistent(sm, factory_tuned) ; \+indep(sm)).

evidence(all_consistent(factory_tuned)).
query(true_val(factory_tuned, yes_detuned_tips)).
query(true_val(factory_tuned, unk_factory_tuned)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts_Standard_Pack unk_mounting_pattern=Unknown
% @importance 0.925

0.93::acc(s2, mounting_pattern).
0.90::acc(sm, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s2, mounting_pattern, inserts_2x4).
measured(sm, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(s2, mounting_pattern),
    (indep(sm), consistent(sm, mounting_pattern) ; \+indep(sm)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr pro_construction_designation
% @type categorical
% @canonical false
% @original_name Pro Construction designation
% @values yes_triax_carbon=Yes_PRO_Triax_fiberglass_carbon_stringers unk_pro_construction_designation=Unknown
% @importance 1.0

0.93::acc(s2, pro_construction_designation).

0.90::true_val(pro_construction_designation, yes_triax_carbon); 0.10::true_val(pro_construction_designation, unk_pro_construction_designation).

measured(s2, pro_construction_designation, yes_triax_carbon).

all_consistent(pro_construction_designation) :- consistent(s2, pro_construction_designation).

evidence(all_consistent(pro_construction_designation)).
query(true_val(pro_construction_designation, yes_triax_carbon)).
query(true_val(pro_construction_designation, unk_pro_construction_designation)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values seven_sizes=146_149_151_154_156_157W_159 unk_available_sizes=Unknown
% @importance 0.85

0.93::acc(s2, available_sizes).
0.72::acc(s25, available_sizes).

0.95::true_val(available_sizes, seven_sizes); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s2, available_sizes, seven_sizes).
measured(s25, available_sizes, seven_sizes).

all_consistent(available_sizes) :-
    consistent(s2, available_sizes),
    consistent(s25, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, seven_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr available_sizes_merchant
% @type categorical
% @canonical false
% @original_name available_sizes
% @values four_sizes=154_156_159_157W unk_available_sizes_merchant=Unknown
% @importance 0.85

0.88::acc(sm, available_sizes_merchant).

0.95::true_val(available_sizes_merchant, four_sizes); 0.05::true_val(available_sizes_merchant, unk_available_sizes_merchant).

measured(sm, available_sizes_merchant, four_sizes).

all_consistent(available_sizes_merchant) :-
    (indep(sm), consistent(sm, available_sizes_merchant) ; \+indep(sm)).

evidence(all_consistent(available_sizes_merchant)).
query(true_val(available_sizes_merchant, four_sizes)).
query(true_val(available_sizes_merchant, unk_available_sizes_merchant)).

% @attr effective_edge_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (154cm)
% @values v119=119.0 v120=120.0
% @importance 0.925

0.92::acc(s2, effective_edge_154).
0.85::acc(sm, effective_edge_154).

0.55::true_val(effective_edge_154, v119); 0.45::true_val(effective_edge_154, v120).

measured(s2, effective_edge_154, v119).
measured(sm, effective_edge_154, v120).

all_consistent(effective_edge_154) :-
    consistent(s2, effective_edge_154),
    (indep(sm), consistent(sm, effective_edge_154) ; \+indep(sm)).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v119)).
query(true_val(effective_edge_154, v120)).

% @attr waist_width_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (154cm)
% @values v25_1=25.1 v25_2=25.2
% @importance 0.925

0.92::acc(s2, waist_width_154).
0.85::acc(sm, waist_width_154).

0.55::true_val(waist_width_154, v25_1); 0.45::true_val(waist_width_154, v25_2).

measured(s2, waist_width_154, v25_1).
measured(sm, waist_width_154, v25_2).

all_consistent(waist_width_154) :-
    consistent(s2, waist_width_154),
    (indep(sm), consistent(sm, waist_width_154) ; \+indep(sm)).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_1)).
query(true_val(waist_width_154, v25_2)).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v29_4=29.4 v29_8=29.8
% @importance 0.925

0.92::acc(s2, tip_tail_width_size).
0.85::acc(sm, tip_tail_width_size).

0.55::true_val(tip_tail_width_size, v29_4); 0.45::true_val(tip_tail_width_size, v29_8).

measured(s2, tip_tail_width_size, v29_4).
measured(sm, tip_tail_width_size, v29_8).

all_consistent(tip_tail_width_size) :-
    consistent(s2, tip_tail_width_size),
    (indep(sm), consistent(sm, tip_tail_width_size) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_4)).
query(true_val(tip_tail_width_size, v29_8)).

% @attr sidecut_radius_size_154
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size
% @values v7_7=7.7 v7_5=7.5
% @importance 0.925

0.92::acc(s2, sidecut_radius_size_154).
0.85::acc(sm, sidecut_radius_size_154).

0.55::true_val(sidecut_radius_size_154, v7_7); 0.45::true_val(sidecut_radius_size_154, v7_5).

measured(s2, sidecut_radius_size_154, v7_7).
measured(sm, sidecut_radius_size_154, v7_5).

all_consistent(sidecut_radius_size_154) :-
    consistent(s2, sidecut_radius_size_154),
    (indep(sm), consistent(sm, sidecut_radius_size_154) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v7_7)).
query(true_val(sidecut_radius_size_154, v7_5)).

% @attr stance_width_range_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name stance_width_range_size
% @values v52=52.0 v54=54.0
% @importance 0.925

0.92::acc(s2, stance_width_range_size_154).
0.85::acc(sm, stance_width_range_size_154).

0.55::true_val(stance_width_range_size_154, v52); 0.45::true_val(stance_width_range_size_154, v54).

measured(s2, stance_width_range_size_154, v52).
measured(sm, stance_width_range_size_154, v54).

all_consistent(stance_width_range_size_154) :-
    consistent(s2, stance_width_range_size_154),
    (indep(sm), consistent(sm, stance_width_range_size_154) ; \+indep(sm)).

evidence(all_consistent(stance_width_range_size_154)).
query(true_val(stance_width_range_size_154, v52)).
query(true_val(stance_width_range_size_154, v54)).

% @attr board_weight_grams_154
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v2800=2800.0
% @importance 1.0

0.93::acc(s2, board_weight_grams_154).

0.90::true_val(board_weight_grams_154, v2800); 0.10::true_val(board_weight_grams_154, unk_board_weight_grams_154).

measured(s2, board_weight_grams_154, v2800).

all_consistent(board_weight_grams_154) :- consistent(s2, board_weight_grams_154).

evidence(all_consistent(board_weight_grams_154)).
query(true_val(board_weight_grams_154, v2800)).
query(true_val(board_weight_grams_154, unk_board_weight_grams_154)).

% @attr contact_length_154
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size
% @values v112_6=112.6 unk_contact_length_154=Unknown
% @importance 1.0

0.93::acc(s2, contact_length_154).

0.90::true_val(contact_length_154, v112_6); 0.10::true_val(contact_length_154, unk_contact_length_154).

measured(s2, contact_length_154, v112_6).

all_consistent(contact_length_154) :- consistent(s2, contact_length_154).

evidence(all_consistent(contact_length_154)).
query(true_val(contact_length_154, v112_6)).
query(true_val(contact_length_154, unk_contact_length_154)).

% @attr recommended_weight_range_size_154
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size
% @values lbs_120_170=120_170lbs_54_77kg unk_recommended_weight_range_size_154=Unknown
% @importance 0.925

0.93::acc(s2, recommended_weight_range_size_154).
0.90::acc(sm, recommended_weight_range_size_154).

0.95::true_val(recommended_weight_range_size_154, lbs_120_170); 0.05::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(s2, recommended_weight_range_size_154, lbs_120_170).
measured(sm, recommended_weight_range_size_154, lbs_120_170).

all_consistent(recommended_weight_range_size_154) :-
    consistent(s2, recommended_weight_range_size_154),
    (indep(sm), consistent(sm, recommended_weight_range_size_154) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, lbs_120_170)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr tip_tail_length_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Tip/tail length (154cm)
% @values v20_7=20.7 unk_tip_tail_length_154=Unknown
% @importance 1.0

0.93::acc(s2, tip_tail_length_154).

0.90::true_val(tip_tail_length_154, v20_7); 0.10::true_val(tip_tail_length_154, unk_tip_tail_length_154).

measured(s2, tip_tail_length_154, v20_7).

all_consistent(tip_tail_length_154) :- consistent(s2, tip_tail_length_154).

evidence(all_consistent(tip_tail_length_154)).
query(true_val(tip_tail_length_154, v20_7)).
query(true_val(tip_tail_length_154, unk_tip_tail_length_154)).

% @attr effective_edge_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (156cm)
% @values v120=120.0 v121_6=121.6
% @importance 0.925

0.92::acc(s2, effective_edge_156).
0.85::acc(sm, effective_edge_156).

0.55::true_val(effective_edge_156, v120); 0.45::true_val(effective_edge_156, v121_6).

measured(s2, effective_edge_156, v120).
measured(sm, effective_edge_156, v121_6).

all_consistent(effective_edge_156) :-
    consistent(s2, effective_edge_156),
    (indep(sm), consistent(sm, effective_edge_156) ; \+indep(sm)).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v120)).
query(true_val(effective_edge_156, v121_6)).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (156cm)
% @values v25_4=25.4 unk_waist_width_156=Unknown
% @importance 0.925

0.93::acc(s2, waist_width_156).
0.90::acc(sm, waist_width_156).

0.95::true_val(waist_width_156, v25_4); 0.05::true_val(waist_width_156, unk_waist_width_156).

measured(s2, waist_width_156, v25_4).
measured(sm, waist_width_156, v25_4).

all_consistent(waist_width_156) :-
    consistent(s2, waist_width_156),
    (indep(sm), consistent(sm, waist_width_156) ; \+indep(sm)).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_4)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2900=2900.0 unk_board_weight_grams=Unknown
% @importance 1.0

0.93::acc(s2, board_weight_grams).

0.90::true_val(board_weight_grams, v2900); 0.10::true_val(board_weight_grams, unk_board_weight_grams).

measured(s2, board_weight_grams, v2900).

all_consistent(board_weight_grams) :- consistent(s2, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2900)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr recommended_weight_range_size
% @type categorical
% @unit lbs
% @canonical true
% @original_name recommended_weight_range_size
% @values lbs_130_180=130_180lbs_59_82kg unk_recommended_weight_range_size=Unknown
% @importance 0.925

0.93::acc(s2, recommended_weight_range_size).
0.90::acc(sm, recommended_weight_range_size).

0.95::true_val(recommended_weight_range_size, lbs_130_180); 0.05::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s2, recommended_weight_range_size, lbs_130_180).
measured(sm, recommended_weight_range_size, lbs_130_180).

all_consistent(recommended_weight_range_size) :-
    consistent(s2, recommended_weight_range_size),
    (indep(sm), consistent(sm, recommended_weight_range_size) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, lbs_130_180)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v7_8=7.8 v7_6=7.6
% @importance 0.925

0.92::acc(s2, sidecut_radius_size).
0.85::acc(sm, sidecut_radius_size).

0.55::true_val(sidecut_radius_size, v7_8); 0.45::true_val(sidecut_radius_size, v7_6).

measured(s2, sidecut_radius_size, v7_8).
measured(sm, sidecut_radius_size, v7_6).

all_consistent(sidecut_radius_size) :-
    consistent(s2, sidecut_radius_size),
    (indep(sm), consistent(sm, sidecut_radius_size) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_8)).
query(true_val(sidecut_radius_size, v7_6)).

% @attr stance_width_range_size
% @type numeric
% @unit cm
% @canonical true
% @original_name stance_width_range_size
% @values v54=54.0 v56=56.0
% @importance 0.925

0.92::acc(s2, stance_width_range_size).
0.85::acc(sm, stance_width_range_size).

0.55::true_val(stance_width_range_size, v54); 0.45::true_val(stance_width_range_size, v56).

measured(s2, stance_width_range_size, v54).
measured(sm, stance_width_range_size, v56).

all_consistent(stance_width_range_size) :-
    consistent(s2, stance_width_range_size),
    (indep(sm), consistent(sm, stance_width_range_size) ; \+indep(sm)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v54)).
query(true_val(stance_width_range_size, v56)).

% @attr effective_edge_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (159cm)
% @values v122=122.0 v124=124.0
% @importance 0.925

0.92::acc(s2, effective_edge_159).
0.85::acc(sm, effective_edge_159).

0.55::true_val(effective_edge_159, v122); 0.45::true_val(effective_edge_159, v124).

measured(s2, effective_edge_159, v122).
measured(sm, effective_edge_159, v124).

all_consistent(effective_edge_159) :-
    consistent(s2, effective_edge_159),
    (indep(sm), consistent(sm, effective_edge_159) ; \+indep(sm)).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v122)).
query(true_val(effective_edge_159, v124)).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (159cm)
% @values v25_7=25.7 unk_waist_width_159=Unknown
% @importance 0.925

0.93::acc(s2, waist_width_159).
0.90::acc(sm, waist_width_159).

0.95::true_val(waist_width_159, v25_7); 0.05::true_val(waist_width_159, unk_waist_width_159).

measured(s2, waist_width_159, v25_7).
measured(sm, waist_width_159, v25_7).

all_consistent(waist_width_159) :-
    consistent(s2, waist_width_159),
    (indep(sm), consistent(sm, waist_width_159) ; \+indep(sm)).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_7)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr board_weight_grams_159
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v3000=3000.0 unk_board_weight_grams_159=Unknown
% @importance 1.0

0.93::acc(s2, board_weight_grams_159).

0.90::true_val(board_weight_grams_159, v3000); 0.10::true_val(board_weight_grams_159, unk_board_weight_grams_159).

measured(s2, board_weight_grams_159, v3000).

all_consistent(board_weight_grams_159) :- consistent(s2, board_weight_grams_159).

evidence(all_consistent(board_weight_grams_159)).
query(true_val(board_weight_grams_159, v3000)).
query(true_val(board_weight_grams_159, unk_board_weight_grams_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size
% @values lbs_140_190=140_190lbs_64_86kg unk_recommended_weight_range_size_159=Unknown
% @importance 0.925

0.93::acc(s2, recommended_weight_range_size_159).
0.90::acc(sm, recommended_weight_range_size_159).

0.95::true_val(recommended_weight_range_size_159, lbs_140_190); 0.05::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s2, recommended_weight_range_size_159, lbs_140_190).
measured(sm, recommended_weight_range_size_159, lbs_140_190).

all_consistent(recommended_weight_range_size_159) :-
    consistent(s2, recommended_weight_range_size_159),
    (indep(sm), consistent(sm, recommended_weight_range_size_159) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, lbs_140_190)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr effective_edge_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name Effective edge (157W)
% @values v121=121.0 v122_6=122.6
% @importance 0.925

0.92::acc(s2, effective_edge_157w).
0.85::acc(sm, effective_edge_157w).

0.55::true_val(effective_edge_157w, v121); 0.45::true_val(effective_edge_157w, v122_6).

measured(s2, effective_edge_157w, v121).
measured(sm, effective_edge_157w, v122_6).

all_consistent(effective_edge_157w) :-
    consistent(s2, effective_edge_157w),
    (indep(sm), consistent(sm, effective_edge_157w) ; \+indep(sm)).

evidence(all_consistent(effective_edge_157w)).
query(true_val(effective_edge_157w, v121)).
query(true_val(effective_edge_157w, v122_6)).

% @attr waist_width_157w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width (157W)
% @values v26_3=26.3 unk_waist_width_157w=Unknown
% @importance 0.925

0.93::acc(s2, waist_width_157w).
0.90::acc(sm, waist_width_157w).

0.95::true_val(waist_width_157w, v26_3); 0.05::true_val(waist_width_157w, unk_waist_width_157w).

measured(s2, waist_width_157w, v26_3).
measured(sm, waist_width_157w, v26_3).

all_consistent(waist_width_157w) :-
    consistent(s2, waist_width_157w),
    (indep(sm), consistent(sm, waist_width_157w) ; \+indep(sm)).

evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_3)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

% @attr board_weight_grams_157w
% @type numeric
% @unit g
% @canonical false
% @original_name board_weight_grams
% @values v3000w=3000.0 unk_board_weight_grams_157w=Unknown
% @importance 1.0

0.93::acc(s2, board_weight_grams_157w).

0.90::true_val(board_weight_grams_157w, v3000w); 0.10::true_val(board_weight_grams_157w, unk_board_weight_grams_157w).

measured(s2, board_weight_grams_157w, v3000w).

all_consistent(board_weight_grams_157w) :- consistent(s2, board_weight_grams_157w).

evidence(all_consistent(board_weight_grams_157w)).
query(true_val(board_weight_grams_157w, v3000w)).
query(true_val(board_weight_grams_157w, unk_board_weight_grams_157w)).

% @attr recommended_weight_range_size_157w
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size
% @values lbs_130_180w=130_180lbs_59_82kg unk_recommended_weight_range_size_157w=Unknown
% @importance 0.925

0.93::acc(s2, recommended_weight_range_size_157w).
0.90::acc(sm, recommended_weight_range_size_157w).

0.95::true_val(recommended_weight_range_size_157w, lbs_130_180w); 0.05::true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w).

measured(s2, recommended_weight_range_size_157w, lbs_130_180w).
measured(sm, recommended_weight_range_size_157w, lbs_130_180w).

all_consistent(recommended_weight_range_size_157w) :-
    consistent(s2, recommended_weight_range_size_157w),
    (indep(sm), consistent(sm, recommended_weight_range_size_157w) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size_157w)).
query(true_val(recommended_weight_range_size_157w, lbs_130_180w)).
query(true_val(recommended_weight_range_size_157w, unk_recommended_weight_range_size_157w)).

% @attr boot_size_rec_157w
% @type categorical
% @canonical false
% @original_name Boot size recommendation (157W)
% @values us11_plus=US_11_plus_EU_44_5_plus unk_boot_size_rec_157w=Unknown
% @importance 1.0

0.93::acc(s2, boot_size_rec_157w).

0.90::true_val(boot_size_rec_157w, us11_plus); 0.10::true_val(boot_size_rec_157w, unk_boot_size_rec_157w).

measured(s2, boot_size_rec_157w, us11_plus).

all_consistent(boot_size_rec_157w) :- consistent(s2, boot_size_rec_157w).

evidence(all_consistent(boot_size_rec_157w)).
query(true_val(boot_size_rec_157w, us11_plus)).
query(true_val(boot_size_rec_157w, unk_boot_size_rec_157w)).

% @attr terrain_suitability
% @type numeric
% @unit /10
% @canonical true
% @original_name terrain_suitability
% @values v8=8.0 unk_terrain_suitability=Unknown
% @importance 0.925

0.90::acc(sm, terrain_suitability).
0.93::acc(s2, terrain_suitability).

0.95::true_val(terrain_suitability, v8); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(sm, terrain_suitability, v8).
measured(s2, terrain_suitability, v8).

all_consistent(terrain_suitability) :-
    consistent(s2, terrain_suitability),
    (indep(sm), consistent(sm, terrain_suitability) ; \+indep(sm)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v8)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_powder
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v6=6.0 unk_terrain_suitability_powder=Unknown
% @importance 0.925

0.90::acc(sm, terrain_suitability_powder).
0.93::acc(s2, terrain_suitability_powder).

0.95::true_val(terrain_suitability_powder, v6); 0.05::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(sm, terrain_suitability_powder, v6).
measured(s2, terrain_suitability_powder, v6).

all_consistent(terrain_suitability_powder) :-
    consistent(s2, terrain_suitability_powder),
    (indep(sm), consistent(sm, terrain_suitability_powder) ; \+indep(sm)).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v6)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr terrain_suitability_freestyle
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v10=10.0 unk_terrain_suitability_freestyle=Unknown
% @importance 0.925

0.90::acc(sm, terrain_suitability_freestyle).
0.93::acc(s2, terrain_suitability_freestyle).

0.95::true_val(terrain_suitability_freestyle, v10); 0.05::true_val(terrain_suitability_freestyle, unk_terrain_suitability_freestyle).

measured(sm, terrain_suitability_freestyle, v10).
measured(s2, terrain_suitability_freestyle, v10).

all_consistent(terrain_suitability_freestyle) :-
    consistent(s2, terrain_suitability_freestyle),
    (indep(sm), consistent(sm, terrain_suitability_freestyle) ; \+indep(sm)).

evidence(all_consistent(terrain_suitability_freestyle)).
query(true_val(terrain_suitability_freestyle, v10)).
query(true_val(terrain_suitability_freestyle, unk_terrain_suitability_freestyle)).

% @attr terrain_suitability_types
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values am_park_freestyle_features_groomers=All_Mountain_Park_Freestyle_Features_Groomers unk_terrain_suitability_types=Unknown
% @importance 0.85

0.88::acc(sm, terrain_suitability_types).

0.95::true_val(terrain_suitability_types, am_park_freestyle_features_groomers); 0.05::true_val(terrain_suitability_types, unk_terrain_suitability_types).

measured(sm, terrain_suitability_types, am_park_freestyle_features_groomers).

all_consistent(terrain_suitability_types) :-
    (indep(sm), consistent(sm, terrain_suitability_types) ; \+indep(sm)).

evidence(all_consistent(terrain_suitability_types)).
query(true_val(terrain_suitability_types, am_park_freestyle_features_groomers)).
query(true_val(terrain_suitability_types, unk_terrain_suitability_types)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_switch=Freestyle_Switch_riding unk_riding_style=Unknown
% @importance 0.85

0.88::acc(sm, riding_style).

0.95::true_val(riding_style, freestyle_switch); 0.05::true_val(riding_style, unk_riding_style).

measured(sm, riding_style, freestyle_switch).

all_consistent(riding_style) :-
    (indep(sm), consistent(sm, riding_style) ; \+indep(sm)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_switch)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced_expert=Advanced_to_Expert unk_rider_level=Unknown
% @importance 0.94

0.93::acc(s2, rider_level).
0.85::acc(s34, rider_level).

0.95::true_val(rider_level, advanced_expert); 0.05::true_val(rider_level, unk_rider_level).

measured(s2, rider_level, advanced_expert).
measured(s34, rider_level, advanced_expert).

all_consistent(rider_level) :-
    consistent(s2, rider_level),
    consistent(s34, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values aggressive_am_freestyle=Aggressive_AM_freestyle_stability_pop_power unk_skill_level_recommendation=Unknown
% @importance 0.85

0.78::acc(s25, skill_level_recommendation).

0.57::true_val(skill_level_recommendation, aggressive_am_freestyle); 0.43::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s25, skill_level_recommendation, aggressive_am_freestyle).

all_consistent(skill_level_recommendation) :- consistent(s25, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, aggressive_am_freestyle)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr skill_level_recommendation_not_for
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values not_beginners_forgiving=Not_for_beginners_or_forgiving_flex_preference unk_skill_level_recommendation_not_for=Unknown
% @importance 0.815

0.82::acc(s34, skill_level_recommendation_not_for).
0.68::acc(s32, skill_level_recommendation_not_for).

0.90::true_val(skill_level_recommendation_not_for, not_beginners_forgiving); 0.10::true_val(skill_level_recommendation_not_for, unk_skill_level_recommendation_not_for).

measured(s34, skill_level_recommendation_not_for, not_beginners_forgiving).
measured(s32, skill_level_recommendation_not_for, not_beginners_forgiving).

all_consistent(skill_level_recommendation_not_for) :-
    consistent(s34, skill_level_recommendation_not_for),
    consistent(s32, skill_level_recommendation_not_for).

evidence(all_consistent(skill_level_recommendation_not_for)).
query(true_val(skill_level_recommendation_not_for, not_beginners_forgiving)).
query(true_val(skill_level_recommendation_not_for, unk_skill_level_recommendation_not_for)).

% @attr terrain_suitability_conditions
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values hardpack_groomed_park=Hardpack_groomed_runs_terrain_park unk_terrain_suitability_conditions=Unknown
% @importance 0.88

0.82::acc(s34, terrain_suitability_conditions).

0.68::true_val(terrain_suitability_conditions, hardpack_groomed_park); 0.32::true_val(terrain_suitability_conditions, unk_terrain_suitability_conditions).

measured(s34, terrain_suitability_conditions, hardpack_groomed_park).

all_consistent(terrain_suitability_conditions) :- consistent(s34, terrain_suitability_conditions).

evidence(all_consistent(terrain_suitability_conditions)).
query(true_val(terrain_suitability_conditions, hardpack_groomed_park)).
query(true_val(terrain_suitability_conditions, unk_terrain_suitability_conditions)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.88::acc(sm, width_options).

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).

measured(sm, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(sm), consistent(sm, width_options) ; \+indep(sm)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr big_horn_series
% @type categorical
% @canonical false
% @original_name Big Horn Series
% @values w157_26_3cm_us11_5=157W_waist_26_3cm_US_11_5_plus unk_big_horn_series=Unknown
% @importance 1.0

0.93::acc(s2, big_horn_series).

0.90::true_val(big_horn_series, w157_26_3cm_us11_5); 0.10::true_val(big_horn_series, unk_big_horn_series).

measured(s2, big_horn_series, w157_26_3cm_us11_5).

all_consistent(big_horn_series) :- consistent(s2, big_horn_series).

evidence(all_consistent(big_horn_series)).
query(true_val(big_horn_series, w157_26_3cm_us11_5)).
query(true_val(big_horn_series, unk_big_horn_series)).

% @attr warranty_period_years
% @type categorical
% @canonical true
% @original_name warranty_period_years
% @values two_plus_one=2_plus_1_years_with_registration unk_warranty_period_years=Unknown
% @importance 0.8

0.93::acc(s35, warranty_period_years).

0.90::true_val(warranty_period_years, two_plus_one); 0.10::true_val(warranty_period_years, unk_warranty_period_years).

measured(s35, warranty_period_years, two_plus_one).

all_consistent(warranty_period_years) :- consistent(s35, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, two_plus_one)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty_terms
% @type categorical
% @canonical false
% @original_name warranty
% @values authorized_dealer_nontransfer=Authorized_dealer_non_transferable_original_buyer unk_warranty_terms=Unknown
% @importance 0.8

0.93::acc(s35, warranty_terms).

0.90::true_val(warranty_terms, authorized_dealer_nontransfer); 0.10::true_val(warranty_terms, unk_warranty_terms).

measured(s35, warranty_terms, authorized_dealer_nontransfer).

all_consistent(warranty_terms) :- consistent(s35, warranty_terms).

evidence(all_consistent(warranty_terms)).
query(true_val(warranty_terms, authorized_dealer_nontransfer)).
query(true_val(warranty_terms, unk_warranty_terms)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values d30_unused_buyer_shipping=30_days_unused_buyer_return_shipping unk_return_policy_terms=Unknown
% @importance 1.0

0.93::acc(s2, return_policy_terms).

0.90::true_val(return_policy_terms, d30_unused_buyer_shipping); 0.10::true_val(return_policy_terms, unk_return_policy_terms).

measured(s2, return_policy_terms, d30_unused_buyer_shipping).

all_consistent(return_policy_terms) :- consistent(s2, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, d30_unused_buyer_shipping)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr recommended_binding
% @type categorical
% @canonical false
% @original_name Recommended binding
% @values jones_orion=Jones_Orion_flex_tuned unk_recommended_binding=Unknown
% @importance 1.0

0.93::acc(s2, recommended_binding).

0.90::true_val(recommended_binding, jones_orion); 0.10::true_val(recommended_binding, unk_recommended_binding).

measured(s2, recommended_binding, jones_orion).

all_consistent(recommended_binding) :- consistent(s2, recommended_binding).

evidence(all_consistent(recommended_binding)).
query(true_val(recommended_binding, jones_orion)).
query(true_val(recommended_binding, unk_recommended_binding)).

% @attr recommended_binding_2027
% @type categorical
% @canonical false
% @original_name Recommended binding (2027)
% @values jones_mercury_fase=Jones_Mercury_FASE_369_95 unk_recommended_binding_2027=Unknown
% @importance 1.0

0.93::acc(s2, recommended_binding_2027).

0.90::true_val(recommended_binding_2027, jones_mercury_fase); 0.10::true_val(recommended_binding_2027, unk_recommended_binding_2027).

measured(s2, recommended_binding_2027, jones_mercury_fase).

all_consistent(recommended_binding_2027) :- consistent(s2, recommended_binding_2027).

evidence(all_consistent(recommended_binding_2027)).
query(true_val(recommended_binding_2027, jones_mercury_fase)).
query(true_val(recommended_binding_2027, unk_recommended_binding_2027)).

% @attr review_score_botw
% @type numeric
% @unit /100
% @canonical false
% @original_name Board of the World review score
% @values v89_15=89.15 unk_review_score_botw=Unknown
% @importance 0.85

0.78::acc(s25, review_score_botw).

0.57::true_val(review_score_botw, v89_15); 0.43::true_val(review_score_botw, unk_review_score_botw).

measured(s25, review_score_botw, v89_15).

all_consistent(review_score_botw) :- consistent(s25, review_score_botw).

evidence(all_consistent(review_score_botw)).
query(true_val(review_score_botw, v89_15)).
query(true_val(review_score_botw, unk_review_score_botw)).

% @attr review_ranking_botw
% @type categorical
% @canonical false
% @original_name Board of the World ranking
% @values rank_10_of_38=10th_of_38_all_mountain unk_review_ranking_botw=Unknown
% @importance 0.85

0.78::acc(s25, review_ranking_botw).

0.57::true_val(review_ranking_botw, rank_10_of_38); 0.43::true_val(review_ranking_botw, unk_review_ranking_botw).

measured(s25, review_ranking_botw, rank_10_of_38).

all_consistent(review_ranking_botw) :- consistent(s25, review_ranking_botw).

evidence(all_consistent(review_ranking_botw)).
query(true_val(review_ranking_botw, rank_10_of_38)).
query(true_val(review_ranking_botw, unk_review_ranking_botw)).

% @attr user_rating_jones
% @type numeric
% @unit /5
% @canonical false
% @original_name Jones website user rating
% @values v5_0=5.0 unk_user_rating_jones=Unknown
% @importance 1.0

0.85::acc(s2, user_rating_jones).

0.90::true_val(user_rating_jones, v5_0); 0.10::true_val(user_rating_jones, unk_user_rating_jones).

measured(s2, user_rating_jones, v5_0).

all_consistent(user_rating_jones) :- consistent(s2, user_rating_jones).

evidence(all_consistent(user_rating_jones)).
query(true_val(user_rating_jones, v5_0)).
query(true_val(user_rating_jones, unk_user_rating_jones)).

% @attr review_snow_magazine
% @type categorical
% @canonical false
% @original_name Snow Magazine assessment
% @values perfect_piste_park=Perfect_for_piste_and_park unk_review_snow_magazine=Unknown
% @importance 0.7

0.72::acc(s36, review_snow_magazine).

0.60::true_val(review_snow_magazine, perfect_piste_park); 0.40::true_val(review_snow_magazine, unk_review_snow_magazine).

measured(s36, review_snow_magazine, perfect_piste_park).

all_consistent(review_snow_magazine) :- consistent(s36, review_snow_magazine).

evidence(all_consistent(review_snow_magazine)).
query(true_val(review_snow_magazine, perfect_piste_park)).
query(true_val(review_snow_magazine, unk_review_snow_magazine)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values phenomenal=Phenomenal_Traction_Tech_ice_hardpack unk_edge_hold=Unknown
% @importance 0.85

0.78::acc(s25, edge_hold).

0.57::true_val(edge_hold, phenomenal); 0.43::true_val(edge_hold, unk_edge_hold).

measured(s25, edge_hold, phenomenal).

all_consistent(edge_hold) :- consistent(s25, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, phenomenal)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values v20_pct_more_than_standard=20pct_more_pop_than_standard_Tweaker unk_pop=Unknown
% @importance 0.85

0.78::acc(s25, pop).

0.57::true_val(pop, v20_pct_more_than_standard); 0.43::true_val(pop, unk_pop).

measured(s25, pop, v20_pct_more_than_standard).

all_consistent(pop) :- consistent(s25, pop).

evidence(all_consistent(pop)).
query(true_val(pop, v20_pct_more_than_standard)).
query(true_val(pop, unk_pop)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values exceptional_carving_park=Exceptional_carving_for_park_board unk_positive_aspect=Unknown
% @importance 0.85

0.78::acc(s25, positive_aspect).

0.57::true_val(positive_aspect, exceptional_carving_park); 0.43::true_val(positive_aspect, unk_positive_aspect).

measured(s25, positive_aspect, exceptional_carving_park).

all_consistent(positive_aspect) :- consistent(s25, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, exceptional_carving_park)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_swing_weight
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values blunted_nose_tail_spin=Blunted_nose_tail_reduce_swing_weight_easier_spinning unk_positive_aspect_swing_weight=Unknown
% @importance 0.85

0.78::acc(s25, positive_aspect_swing_weight).

0.57::true_val(positive_aspect_swing_weight, blunted_nose_tail_spin); 0.43::true_val(positive_aspect_swing_weight, unk_positive_aspect_swing_weight).

measured(s25, positive_aspect_swing_weight, blunted_nose_tail_spin).

all_consistent(positive_aspect_swing_weight) :- consistent(s25, positive_aspect_swing_weight).

evidence(all_consistent(positive_aspect_swing_weight)).
query(true_val(positive_aspect_swing_weight, blunted_nose_tail_spin)).
query(true_val(positive_aspect_swing_weight, unk_positive_aspect_swing_weight)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values identical_both_directions=True_twin_identical_both_directions unk_switch_riding=Unknown
% @importance 0.875

0.78::acc(s25, switch_riding).
0.82::acc(s4, switch_riding).

0.90::true_val(switch_riding, identical_both_directions); 0.10::true_val(switch_riding, unk_switch_riding).

measured(s25, switch_riding, identical_both_directions).
measured(s4, switch_riding, identical_both_directions).

all_consistent(switch_riding) :-
    consistent(s25, switch_riding),
    (indep(s4), consistent(s4, switch_riding) ; \+indep(s4)).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, identical_both_directions)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr positive_aspect_koroyd
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values koroyd_high_end_feel=Koroyd_makes_high_end_feel unk_positive_aspect_koroyd=Unknown
% @importance 0.85

0.78::acc(s25, positive_aspect_koroyd).

0.57::true_val(positive_aspect_koroyd, koroyd_high_end_feel); 0.43::true_val(positive_aspect_koroyd, unk_positive_aspect_koroyd).

measured(s25, positive_aspect_koroyd, koroyd_high_end_feel).

all_consistent(positive_aspect_koroyd) :- consistent(s25, positive_aspect_koroyd).

evidence(all_consistent(positive_aspect_koroyd)).
query(true_val(positive_aspect_koroyd, koroyd_high_end_feel)).
query(true_val(positive_aspect_koroyd, unk_positive_aspect_koroyd)).

% @attr positive_aspect_stability
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values stiff_stability_big_jumps=Stiffer_flex_stability_big_jumps_fast_groomers unk_positive_aspect_stability=Unknown
% @importance 0.88

0.82::acc(s34, positive_aspect_stability).

0.68::true_val(positive_aspect_stability, stiff_stability_big_jumps); 0.32::true_val(positive_aspect_stability, unk_positive_aspect_stability).

measured(s34, positive_aspect_stability, stiff_stability_big_jumps).

all_consistent(positive_aspect_stability) :- consistent(s34, positive_aspect_stability).

evidence(all_consistent(positive_aspect_stability)).
query(true_val(positive_aspect_stability, stiff_stability_big_jumps)).
query(true_val(positive_aspect_stability, unk_positive_aspect_stability)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values basalt_damping_composed=Basalt_Pro_damping_composed_at_speed unk_chatter_performance=Unknown
% @importance 0.9

0.82::acc(s4, chatter_performance).

0.70::true_val(chatter_performance, basalt_damping_composed); 0.30::true_val(chatter_performance, unk_chatter_performance).

measured(s4, chatter_performance, basalt_damping_composed).

all_consistent(chatter_performance) :-
    (indep(s4), consistent(s4, chatter_performance) ; \+indep(s4)).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, basalt_damping_composed)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr positive_aspect_versatility
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values blurs_park_am_line=Blurs_line_between_high_end_park_and_AM unk_positive_aspect_versatility=Unknown
% @importance 0.85

0.78::acc(s25, positive_aspect_versatility).

0.57::true_val(positive_aspect_versatility, blurs_park_am_line); 0.43::true_val(positive_aspect_versatility, unk_positive_aspect_versatility).

measured(s25, positive_aspect_versatility, blurs_park_am_line).

all_consistent(positive_aspect_versatility) :- consistent(s25, positive_aspect_versatility).

evidence(all_consistent(positive_aspect_versatility)).
query(true_val(positive_aspect_versatility, blurs_park_am_line)).
query(true_val(positive_aspect_versatility, unk_positive_aspect_versatility)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values too_stiff_casual_park=Too_stiff_for_casual_park_riders_pressing_rails unk_negative_aspect=Unknown
% @importance 0.85

0.78::acc(s25, negative_aspect).

0.57::true_val(negative_aspect, too_stiff_casual_park); 0.43::true_val(negative_aspect, unk_negative_aspect).

measured(s25, negative_aspect, too_stiff_casual_park).

all_consistent(negative_aspect) :- consistent(s25, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, too_stiff_casual_park)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_buttering
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values buttering_challenging=Stiffer_torsional_flex_buttering_challenging unk_negative_aspect_buttering=Unknown
% @importance 0.85

0.78::acc(s25, negative_aspect_buttering).

0.57::true_val(negative_aspect_buttering, buttering_challenging); 0.43::true_val(negative_aspect_buttering, unk_negative_aspect_buttering).

measured(s25, negative_aspect_buttering, buttering_challenging).

all_consistent(negative_aspect_buttering) :- consistent(s25, negative_aspect_buttering).

evidence(all_consistent(negative_aspect_buttering)).
query(true_val(negative_aspect_buttering, buttering_challenging)).
query(true_val(negative_aspect_buttering, unk_negative_aspect_buttering)).

% @attr negative_aspect_base_speed
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values base_not_faster=Upgraded_base_not_significantly_faster unk_negative_aspect_base_speed=Unknown
% @importance 0.85

0.78::acc(s25, negative_aspect_base_speed).

0.57::true_val(negative_aspect_base_speed, base_not_faster); 0.43::true_val(negative_aspect_base_speed, unk_negative_aspect_base_speed).

measured(s25, negative_aspect_base_speed, base_not_faster).

all_consistent(negative_aspect_base_speed) :- consistent(s25, negative_aspect_base_speed).

evidence(all_consistent(negative_aspect_base_speed)).
query(true_val(negative_aspect_base_speed, base_not_faster)).
query(true_val(negative_aspect_base_speed, unk_negative_aspect_base_speed)).

% @attr negative_aspect_demands_riding
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values will_ride_you=If_not_riding_it_will_ride_you unk_negative_aspect_demands_riding=Unknown
% @importance 0.88

0.82::acc(s34, negative_aspect_demands_riding).

0.68::true_val(negative_aspect_demands_riding, will_ride_you); 0.32::true_val(negative_aspect_demands_riding, unk_negative_aspect_demands_riding).

measured(s34, negative_aspect_demands_riding, will_ride_you).

all_consistent(negative_aspect_demands_riding) :- consistent(s34, negative_aspect_demands_riding).

evidence(all_consistent(negative_aspect_demands_riding)).
query(true_val(negative_aspect_demands_riding, will_ride_you)).
query(true_val(negative_aspect_demands_riding, unk_negative_aspect_demands_riding)).

% @attr negative_aspect_soft_snow
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values difficult_soft_snow=6mm_camber_twin_difficult_soft_snow_back_leg_burner unk_negative_aspect_soft_snow=Unknown
% @importance 0.88

0.82::acc(s34, negative_aspect_soft_snow).

0.68::true_val(negative_aspect_soft_snow, difficult_soft_snow); 0.32::true_val(negative_aspect_soft_snow, unk_negative_aspect_soft_snow).

measured(s34, negative_aspect_soft_snow, difficult_soft_snow).

all_consistent(negative_aspect_soft_snow) :- consistent(s34, negative_aspect_soft_snow).

evidence(all_consistent(negative_aspect_soft_snow)).
query(true_val(negative_aspect_soft_snow, difficult_soft_snow)).
query(true_val(negative_aspect_soft_snow, unk_negative_aspect_soft_snow)).

% @attr negative_aspect_aggressive
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values demands_advanced_skill=Aggressive_character_demands_advanced_skill unk_negative_aspect_aggressive=Unknown
% @importance 0.815

0.82::acc(s34, negative_aspect_aggressive).
0.68::acc(s32, negative_aspect_aggressive).

0.90::true_val(negative_aspect_aggressive, demands_advanced_skill); 0.10::true_val(negative_aspect_aggressive, unk_negative_aspect_aggressive).

measured(s34, negative_aspect_aggressive, demands_advanced_skill).
measured(s32, negative_aspect_aggressive, demands_advanced_skill).

all_consistent(negative_aspect_aggressive) :-
    consistent(s34, negative_aspect_aggressive),
    consistent(s32, negative_aspect_aggressive).

evidence(all_consistent(negative_aspect_aggressive)).
query(true_val(negative_aspect_aggressive, demands_advanced_skill)).
query(true_val(negative_aspect_aggressive, unk_negative_aspect_aggressive)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values bit_slow_edge_to_edge=Bit_slow_edge_to_edge_size_dependent unk_turn_initiation_performance=Unknown
% @importance 0.88

0.82::acc(s34, turn_initiation_performance).

0.68::true_val(turn_initiation_performance, bit_slow_edge_to_edge); 0.32::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s34, turn_initiation_performance, bit_slow_edge_to_edge).

all_consistent(turn_initiation_performance) :- consistent(s34, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, bit_slow_edge_to_edge)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values warranty_slow_1_2_months=Warranty_communication_slow_1_2_months unk_user_review_forum=Unknown
% @importance 0.7

0.45::acc(s37, user_review_forum).

0.23::true_val(user_review_forum, warranty_slow_1_2_months); 0.77::true_val(user_review_forum, unk_user_review_forum).

measured(s37, user_review_forum, warranty_slow_1_2_months).

all_consistent(user_review_forum) :- consistent(s37, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, warranty_slow_1_2_months)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_super_doa=CAPiTA_Super_DOA_4_67_of_5 unk_comparable_board_cross_brand=Unknown
% @importance 0.7

0.65::acc(s38, comparable_board_cross_brand).

0.49::true_val(comparable_board_cross_brand, capita_super_doa); 0.51::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s38, comparable_board_cross_brand, capita_super_doa).

all_consistent(comparable_board_cross_brand) :- consistent(s38, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_super_doa)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_process
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_process=Burton_Process unk_comparable_board_cross_brand_process=Unknown
% @importance 0.65

0.70::acc(s39, comparable_board_cross_brand_process).

0.59::true_val(comparable_board_cross_brand_process, burton_process); 0.41::true_val(comparable_board_cross_brand_process, unk_comparable_board_cross_brand_process).

measured(s39, comparable_board_cross_brand_process, burton_process).

all_consistent(comparable_board_cross_brand_process) :- consistent(s39, comparable_board_cross_brand_process).

evidence(all_consistent(comparable_board_cross_brand_process)).
query(true_val(comparable_board_cross_brand_process, burton_process)).
query(true_val(comparable_board_cross_brand_process, unk_comparable_board_cross_brand_process)).

% @attr comparable_board_cross_brand_blossom
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_blossom=Burton_Blossom unk_comparable_board_cross_brand_blossom=Unknown
% @importance 0.7

0.62::acc(s40, comparable_board_cross_brand_blossom).

0.49::true_val(comparable_board_cross_brand_blossom, burton_blossom); 0.51::true_val(comparable_board_cross_brand_blossom, unk_comparable_board_cross_brand_blossom).

measured(s40, comparable_board_cross_brand_blossom, burton_blossom).

all_consistent(comparable_board_cross_brand_blossom) :- consistent(s40, comparable_board_cross_brand_blossom).

evidence(all_consistent(comparable_board_cross_brand_blossom)).
query(true_val(comparable_board_cross_brand_blossom, burton_blossom)).
query(true_val(comparable_board_cross_brand_blossom, unk_comparable_board_cross_brand_blossom)).

% @attr comparable_board_same_brand_mt
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values jones_mountain_twin=Jones_Mountain_Twin_directional_twin_more_versatile unk_comparable_board_same_brand_mt=Unknown
% @importance 0.65

0.62::acc(s41, comparable_board_same_brand_mt).

0.47::true_val(comparable_board_same_brand_mt, jones_mountain_twin); 0.53::true_val(comparable_board_same_brand_mt, unk_comparable_board_same_brand_mt).

measured(s41, comparable_board_same_brand_mt, jones_mountain_twin).

all_consistent(comparable_board_same_brand_mt) :- consistent(s41, comparable_board_same_brand_mt).

evidence(all_consistent(comparable_board_same_brand_mt)).
query(true_val(comparable_board_same_brand_mt, jones_mountain_twin)).
query(true_val(comparable_board_same_brand_mt, unk_comparable_board_same_brand_mt)).

% @attr comparable_board_cross_brand_agent
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values rome_agent_pro=Rome_Agent_Pro unk_comparable_board_cross_brand_agent=Unknown
% @importance 0.7

0.62::acc(s40, comparable_board_cross_brand_agent).

0.49::true_val(comparable_board_cross_brand_agent, rome_agent_pro); 0.51::true_val(comparable_board_cross_brand_agent, unk_comparable_board_cross_brand_agent).

measured(s40, comparable_board_cross_brand_agent, rome_agent_pro).

all_consistent(comparable_board_cross_brand_agent) :- consistent(s40, comparable_board_cross_brand_agent).

evidence(all_consistent(comparable_board_cross_brand_agent)).
query(true_val(comparable_board_cross_brand_agent, rome_agent_pro)).
query(true_val(comparable_board_cross_brand_agent, unk_comparable_board_cross_brand_agent)).

% @attr comparable_board_cross_brand_greats
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values yes_greats_xtrm=YES_Greats_XTRM_num_1_AM_freestyle unk_comparable_board_cross_brand_greats=Unknown
% @importance 0.7

0.62::acc(s40, comparable_board_cross_brand_greats).

0.49::true_val(comparable_board_cross_brand_greats, yes_greats_xtrm); 0.51::true_val(comparable_board_cross_brand_greats, unk_comparable_board_cross_brand_greats).

measured(s40, comparable_board_cross_brand_greats, yes_greats_xtrm).

all_consistent(comparable_board_cross_brand_greats) :- consistent(s40, comparable_board_cross_brand_greats).

evidence(all_consistent(comparable_board_cross_brand_greats)).
query(true_val(comparable_board_cross_brand_greats, yes_greats_xtrm)).
query(true_val(comparable_board_cross_brand_greats, unk_comparable_board_cross_brand_greats)).

% @attr comparable_board_cross_brand_proto
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values ns_proto_type_3=Never_Summer_Proto_Type_3 unk_comparable_board_cross_brand_proto=Unknown
% @importance 0.85

0.72::acc(s25, comparable_board_cross_brand_proto).

0.57::true_val(comparable_board_cross_brand_proto, ns_proto_type_3); 0.43::true_val(comparable_board_cross_brand_proto, unk_comparable_board_cross_brand_proto).

measured(s25, comparable_board_cross_brand_proto, ns_proto_type_3).

all_consistent(comparable_board_cross_brand_proto) :- consistent(s25, comparable_board_cross_brand_proto).

evidence(all_consistent(comparable_board_cross_brand_proto)).
query(true_val(comparable_board_cross_brand_proto, ns_proto_type_3)).
query(true_val(comparable_board_cross_brand_proto, unk_comparable_board_cross_brand_proto)).

% @attr reviewer_opinion_sp
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values top_10_am_freestyle=Listed_top_10_AM_freestyle unk_reviewer_opinion_sp=Unknown
% @importance 0.7

0.62::acc(s40, reviewer_opinion_sp).

0.49::true_val(reviewer_opinion_sp, top_10_am_freestyle); 0.51::true_val(reviewer_opinion_sp, unk_reviewer_opinion_sp).

measured(s40, reviewer_opinion_sp, top_10_am_freestyle).

all_consistent(reviewer_opinion_sp) :- consistent(s40, reviewer_opinion_sp).

evidence(all_consistent(reviewer_opinion_sp)).
query(true_val(reviewer_opinion_sp, top_10_am_freestyle)).
query(true_val(reviewer_opinion_sp, unk_reviewer_opinion_sp)).

% @attr sustainability_certification_solar_co2
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values solar_100_89_pct_co2_drop=100pct_solar_since_2020_89pct_CO2_drop unk_sustainability_certification_solar_co2=Unknown
% @importance 0.5

0.65::acc(s15, sustainability_certification_solar_co2).

0.60::true_val(sustainability_certification_solar_co2, solar_100_89_pct_co2_drop); 0.40::true_val(sustainability_certification_solar_co2, unk_sustainability_certification_solar_co2).

measured(s15, sustainability_certification_solar_co2, solar_100_89_pct_co2_drop).

all_consistent(sustainability_certification_solar_co2) :- consistent(s15, sustainability_certification_solar_co2).

evidence(all_consistent(sustainability_certification_solar_co2)).
query(true_val(sustainability_certification_solar_co2, solar_100_89_pct_co2_drop)).
query(true_val(sustainability_certification_solar_co2, unk_sustainability_certification_solar_co2)).

% @attr sustainability_certification_bio_resin
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values bio_resin_27_plant_33_co2=27pct_plant_carbon_33pct_CO2_reduction unk_sustainability_certification_bio_resin=Unknown
% @importance 1.0

0.93::acc(s2, sustainability_certification_bio_resin).

0.90::true_val(sustainability_certification_bio_resin, bio_resin_27_plant_33_co2); 0.10::true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin).

measured(s2, sustainability_certification_bio_resin, bio_resin_27_plant_33_co2).

all_consistent(sustainability_certification_bio_resin) :- consistent(s2, sustainability_certification_bio_resin).

evidence(all_consistent(sustainability_certification_bio_resin)).
query(true_val(sustainability_certification_bio_resin, bio_resin_27_plant_33_co2)).
query(true_val(sustainability_certification_bio_resin, unk_sustainability_certification_bio_resin)).

% @attr sustainability_certification_recycled_abs
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_abs_yes=Recycled_ABS_plastic unk_sustainability_certification_recycled_abs=Unknown
% @importance 1.0

0.93::acc(s2, sustainability_certification_recycled_abs).

0.90::true_val(sustainability_certification_recycled_abs, recycled_abs_yes); 0.10::true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs).

measured(s2, sustainability_certification_recycled_abs, recycled_abs_yes).

all_consistent(sustainability_certification_recycled_abs) :- consistent(s2, sustainability_certification_recycled_abs).

evidence(all_consistent(sustainability_certification_recycled_abs)).
query(true_val(sustainability_certification_recycled_abs, recycled_abs_yes)).
query(true_val(sustainability_certification_recycled_abs, unk_sustainability_certification_recycled_abs)).

% @attr sustainability_certification_recycled_steel
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values recycled_german_steel_yes=Recycled_German_steel unk_sustainability_certification_recycled_steel=Unknown
% @importance 1.0

0.93::acc(s2, sustainability_certification_recycled_steel).

0.90::true_val(sustainability_certification_recycled_steel, recycled_german_steel_yes); 0.10::true_val(sustainability_certification_recycled_steel, unk_sustainability_certification_recycled_steel).

measured(s2, sustainability_certification_recycled_steel, recycled_german_steel_yes).

all_consistent(sustainability_certification_recycled_steel) :- consistent(s2, sustainability_certification_recycled_steel).

evidence(all_consistent(sustainability_certification_recycled_steel)).
query(true_val(sustainability_certification_recycled_steel, recycled_german_steel_yes)).
query(true_val(sustainability_certification_recycled_steel, unk_sustainability_certification_recycled_steel)).

% @attr sustainability_certification_wend_wax
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values wend_natural_bio_wax=WEND_natural_bio_wax unk_sustainability_certification_wend_wax=Unknown
% @importance 1.0

0.93::acc(s2, sustainability_certification_wend_wax).

0.90::true_val(sustainability_certification_wend_wax, wend_natural_bio_wax); 0.10::true_val(sustainability_certification_wend_wax, unk_sustainability_certification_wend_wax).

measured(s2, sustainability_certification_wend_wax, wend_natural_bio_wax).

all_consistent(sustainability_certification_wend_wax) :- consistent(s2, sustainability_certification_wend_wax).

evidence(all_consistent(sustainability_certification_wend_wax)).
query(true_val(sustainability_certification_wend_wax, wend_natural_bio_wax)).
query(true_val(sustainability_certification_wend_wax, unk_sustainability_certification_wend_wax)).

% @attr sustainability_certification_wood
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values responsibly_harvested=Responsibly_harvested_wood unk_sustainability_certification_wood=Unknown
% @importance 1.0

0.93::acc(s2, sustainability_certification_wood).

0.90::true_val(sustainability_certification_wood, responsibly_harvested); 0.10::true_val(sustainability_certification_wood, unk_sustainability_certification_wood).

measured(s2, sustainability_certification_wood, responsibly_harvested).

all_consistent(sustainability_certification_wood) :- consistent(s2, sustainability_certification_wood).

evidence(all_consistent(sustainability_certification_wood)).
query(true_val(sustainability_certification_wood, responsibly_harvested)).
query(true_val(sustainability_certification_wood, unk_sustainability_certification_wood)).

% @attr sustainability_certification_sws
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values sws_certified_oct_2023=SWS_Board_Technology_certified_Oct_2023_100_plus_criteria unk_sustainability_certification_sws=Unknown
% @importance 0.55

0.93::acc(s19, sustainability_certification_sws).

0.90::true_val(sustainability_certification_sws, sws_certified_oct_2023); 0.10::true_val(sustainability_certification_sws, unk_sustainability_certification_sws).

measured(s19, sustainability_certification_sws, sws_certified_oct_2023).

all_consistent(sustainability_certification_sws) :- consistent(s19, sustainability_certification_sws).

evidence(all_consistent(sustainability_certification_sws)).
query(true_val(sustainability_certification_sws, sws_certified_oct_2023)).
query(true_val(sustainability_certification_sws, unk_sustainability_certification_sws)).

% @attr sustainability_certification_one_percent
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values donates_1_pct_sales=Donates_1pct_sales_sustainability_nonprofits unk_sustainability_certification_one_percent=Unknown
% @importance 0.45

0.75::acc(s18, sustainability_certification_one_percent).

0.68::true_val(sustainability_certification_one_percent, donates_1_pct_sales); 0.32::true_val(sustainability_certification_one_percent, unk_sustainability_certification_one_percent).

measured(s18, sustainability_certification_one_percent, donates_1_pct_sales).

all_consistent(sustainability_certification_one_percent) :- consistent(s18, sustainability_certification_one_percent).

evidence(all_consistent(sustainability_certification_one_percent)).
query(true_val(sustainability_certification_one_percent, donates_1_pct_sales)).
query(true_val(sustainability_certification_one_percent, unk_sustainability_certification_one_percent)).

% @attr sustainability_certification_trade_in
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values trade_in_50_credit=Trade_in_dead_boards_50_toward_new unk_sustainability_certification_trade_in=Unknown
% @importance 1.0

0.93::acc(s2, sustainability_certification_trade_in).

0.90::true_val(sustainability_certification_trade_in, trade_in_50_credit); 0.10::true_val(sustainability_certification_trade_in, unk_sustainability_certification_trade_in).

measured(s2, sustainability_certification_trade_in, trade_in_50_credit).

all_consistent(sustainability_certification_trade_in) :- consistent(s2, sustainability_certification_trade_in).

evidence(all_consistent(sustainability_certification_trade_in)).
query(true_val(sustainability_certification_trade_in, trade_in_50_credit)).
query(true_val(sustainability_certification_trade_in, unk_sustainability_certification_trade_in)).

% @attr construction_material_innovation_basalt
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values volcanic_rock_replaces_carbon=Derived_from_volcanic_rock_replaces_carbon_fiber unk_construction_material_innovation_basalt=Unknown
% @importance 0.85

0.86::acc(s5, construction_material_innovation_basalt).

0.81::true_val(construction_material_innovation_basalt, volcanic_rock_replaces_carbon); 0.19::true_val(construction_material_innovation_basalt, unk_construction_material_innovation_basalt).

measured(s5, construction_material_innovation_basalt, volcanic_rock_replaces_carbon).

all_consistent(construction_material_innovation_basalt) :- consistent(s5, construction_material_innovation_basalt).

evidence(all_consistent(construction_material_innovation_basalt)).
query(true_val(construction_material_innovation_basalt, volcanic_rock_replaces_carbon)).
query(true_val(construction_material_innovation_basalt, unk_construction_material_innovation_basalt)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values jimmy_goodman=Jimmy_Goodman unk_pro_rider_name=Unknown
% @importance 0.35

0.72::acc(s43, pro_rider_name).

0.56::true_val(pro_rider_name, jimmy_goodman); 0.44::true_val(pro_rider_name, unk_pro_rider_name).

measured(s43, pro_rider_name, jimmy_goodman).

all_consistent(pro_rider_name) :- consistent(s43, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, jimmy_goodman)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values change_board_change_mountain=Change_your_board_change_your_mountain unk_design_philosophy=Unknown
% @importance 0.85

0.86::acc(s5, design_philosophy).

0.81::true_val(design_philosophy, change_board_change_mountain); 0.19::true_val(design_philosophy, unk_design_philosophy).

measured(s5, design_philosophy, change_board_change_mountain).

all_consistent(design_philosophy) :- consistent(s5, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, change_board_change_mountain)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr recommended_binding_pairing
% @type categorical
% @canonical false
% @original_name Recommended binding pairing
% @values jones_orion_skatetech=Jones_Orion_SKATETECH_pivot_aligns_Traction_Tech unk_recommended_binding_pairing=Unknown
% @importance 1.0

0.93::acc(s2, recommended_binding_pairing).

0.90::true_val(recommended_binding_pairing, jones_orion_skatetech); 0.10::true_val(recommended_binding_pairing, unk_recommended_binding_pairing).

measured(s2, recommended_binding_pairing, jones_orion_skatetech).

all_consistent(recommended_binding_pairing) :- consistent(s2, recommended_binding_pairing).

evidence(all_consistent(recommended_binding_pairing)).
query(true_val(recommended_binding_pairing, jones_orion_skatetech)).
query(true_val(recommended_binding_pairing, unk_recommended_binding_pairing)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values medium_traction_tech=Medium_Traction_Tech_multiple_contact_points unk_edge_technology=Unknown
% @importance 1.0

0.93::acc(s2, edge_technology).

0.90::true_val(edge_technology, medium_traction_tech); 0.10::true_val(edge_technology, unk_edge_technology).

measured(s2, edge_technology, medium_traction_tech).

all_consistent(edge_technology) :- consistent(s2, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, medium_traction_tech)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr camber_description_taper
% @type categorical
% @canonical false
% @original_name camber_description
% @values camber_tapers_3d_contour_tips=Camber_radius_tapers_beveled_3D_contour_tips_releases_edges unk_camber_description_taper=Unknown
% @importance 0.6

0.60::acc(s44, camber_description_taper).

0.45::true_val(camber_description_taper, camber_tapers_3d_contour_tips); 0.55::true_val(camber_description_taper, unk_camber_description_taper).

measured(s44, camber_description_taper, camber_tapers_3d_contour_tips).

all_consistent(camber_description_taper) :- consistent(s44, camber_description_taper).

evidence(all_consistent(camber_description_taper)).
query(true_val(camber_description_taper, camber_tapers_3d_contour_tips)).
query(true_val(camber_description_taper, unk_camber_description_taper)).

% @attr surface_area_156
% @type numeric
% @unit dm2
% @canonical false
% @original_name Surface area (156cm)
% @values v41_6=41.6 unk_surface_area_156=Unknown
% @importance 1.0

0.93::acc(s2, surface_area_156).

0.90::true_val(surface_area_156, v41_6); 0.10::true_val(surface_area_156, unk_surface_area_156).

measured(s2, surface_area_156, v41_6).

all_consistent(surface_area_156) :- consistent(s2, surface_area_156).

evidence(all_consistent(surface_area_156)).
query(true_val(surface_area_156, v41_6)).
query(true_val(surface_area_156, unk_surface_area_156)).