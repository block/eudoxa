0.15::indep(s3).
0.20::indep(s8).
0.15::indep(s15).
0.25::indep(s16).
0.12::indep(s18).
0.25::indep(s20).
0.10::indep(s21).
0.10::indep(s22).
0.10::indep(s23).
0.10::indep(s24).
0.10::indep(s25).
0.20::indep(s28).
0.25::indep(s30).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

0.82::acc(s1, brand).
0.95::acc(s2, brand).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 0.90

0.95::true_val(brand, lib_tech); 0.05::true_val(brand, unk_brand).

measured(s1, brand, lib_tech).
measured(s2, brand, lib_tech).

all_consistent(brand) :-
    consistent(s1, brand),
    consistent(s2, brand).

evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

0.95::acc(s2, model_name).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values skate_banana=Skate_Banana unk_model_name=Unknown
% @importance 1.0

0.87::true_val(model_name, skate_banana); 0.13::true_val(model_name, unk_model_name).

measured(s2, model_name, skate_banana).

all_consistent(model_name) :- consistent(s2, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, skate_banana)).
query(true_val(model_name, unk_model_name)).

0.93::acc(s2, model_series).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values s2627_early_release=2026-2027_Early_Release unk_model_series=Unknown
% @importance 1.0

0.88::true_val(model_series, s2627_early_release); 0.12::true_val(model_series, unk_model_series).

measured(s2, model_series, s2627_early_release).

all_consistent(model_series) :- consistent(s2, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, s2627_early_release)).
query(true_val(model_series, unk_model_series)).

0.95::acc(s2, model_year).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 1.0

0.87::true_val(model_year, y2027); 0.13::true_val(model_year, unk_model_year).

measured(s2, model_year, y2027).

all_consistent(model_year) :- consistent(s2, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

0.93::acc(s2, anniversary_edition).

% @attr anniversary_edition
% @type categorical
% @canonical false
% @original_name Anniversary edition
% @values y20_anniversary=20_year_anniversary unk_anniversary_edition=Unknown
% @importance 1.0

0.88::true_val(anniversary_edition, y20_anniversary); 0.12::true_val(anniversary_edition, unk_anniversary_edition).

measured(s2, anniversary_edition, y20_anniversary).

all_consistent(anniversary_edition) :- consistent(s2, anniversary_edition).

evidence(all_consistent(anniversary_edition)).
query(true_val(anniversary_edition, y20_anniversary)).
query(true_val(anniversary_edition, unk_anniversary_edition)).

0.95::acc(s2, product_type).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.87::true_val(product_type, snowboard); 0.13::true_val(product_type, unk_product_type).

measured(s2, product_type, snowboard).

all_consistent(product_type) :- consistent(s2, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

0.95::acc(s2, board_category).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain unk_board_category=Unknown
% @importance 1.0

0.87::true_val(board_category, freestyle_all_mountain); 0.13::true_val(board_category, unk_board_category).

measured(s2, board_category, freestyle_all_mountain).

all_consistent(board_category) :- consistent(s2, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

0.95::acc(s2, shape).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values twin=Twin unk_shape=Unknown
% @importance 1.0

0.87::true_val(shape, twin); 0.13::true_val(shape, unk_shape).

measured(s2, shape, twin).

all_consistent(shape) :- consistent(s2, shape).

evidence(all_consistent(shape)).
query(true_val(shape, twin)).
query(true_val(shape, unk_shape)).

0.72::acc(s3, gender).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.50

0.59::true_val(gender, mens); 0.41::true_val(gender, unk_gender).

measured(s3, gender, mens).

all_consistent(gender) :-
    (indep(s3), consistent(s3, gender) ; \+indep(s3)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

0.93::acc(s2, pro_rider_name).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values brandon_reis=Brandon_Reis unk_pro_rider_name=Unknown
% @importance 1.0

0.87::true_val(pro_rider_name, brandon_reis); 0.13::true_val(pro_rider_name, unk_pro_rider_name).

measured(s2, pro_rider_name, brandon_reis).

all_consistent(pro_rider_name) :- consistent(s2, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, brandon_reis)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

0.80::acc(s4, parent_company).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values mervin_manufacturing=Mervin_Manufacturing unk_parent_company=Unknown
% @importance 0.70

0.71::true_val(parent_company, mervin_manufacturing); 0.29::true_val(parent_company, unk_parent_company).

measured(s4, parent_company, mervin_manufacturing).

all_consistent(parent_company) :- consistent(s4, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, mervin_manufacturing)).
query(true_val(parent_company, unk_parent_company)).

0.78::acc(s5, parent_company_ownership).

% @attr parent_company_ownership
% @type categorical
% @canonical false
% @original_name Parent company ownership
% @values altamont_capital=Altamont_Capital_Partners unk_parent_company_ownership=Unknown
% @importance 0.45

0.71::true_val(parent_company_ownership, altamont_capital); 0.29::true_val(parent_company_ownership, unk_parent_company_ownership).

measured(s5, parent_company_ownership, altamont_capital).

all_consistent(parent_company_ownership) :- consistent(s5, parent_company_ownership).

evidence(all_consistent(parent_company_ownership)).
query(true_val(parent_company_ownership, altamont_capital)).
query(true_val(parent_company_ownership, unk_parent_company_ownership)).

0.90::acc(s6, founders).

% @attr founders
% @type categorical
% @canonical false
% @original_name Founders
% @values olson_saari=Mike_Olson_and_Pete_Saari unk_founders=Unknown
% @importance 0.50

0.84::true_val(founders, olson_saari); 0.16::true_val(founders, unk_founders).

measured(s6, founders, olson_saari).

all_consistent(founders) :- consistent(s6, founders).

evidence(all_consistent(founders)).
query(true_val(founders, olson_saari)).
query(true_val(founders, unk_founders)).

0.80::acc(s7, manufacturing_location).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values sequim_wa_usa=Sequim_Washington_USA unk_manufacturing_location=Unknown
% @importance 0.65

0.71::true_val(manufacturing_location, sequim_wa_usa); 0.29::true_val(manufacturing_location, unk_manufacturing_location).

measured(s7, manufacturing_location, sequim_wa_usa).

all_consistent(manufacturing_location) :- consistent(s7, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, sequim_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

0.80::acc(s8, handbuilt_in_usa).

% @attr handbuilt_in_usa
% @type categorical
% @canonical false
% @original_name Handbuilt in USA
% @values yes=Yes unk_handbuilt_in_usa=Unknown
% @importance 0.85

0.72::true_val(handbuilt_in_usa, yes); 0.28::true_val(handbuilt_in_usa, unk_handbuilt_in_usa).

measured(s8, handbuilt_in_usa, yes).

all_consistent(handbuilt_in_usa) :-
    (indep(s8), consistent(s8, handbuilt_in_usa) ; \+indep(s8)).

evidence(all_consistent(handbuilt_in_usa)).
query(true_val(handbuilt_in_usa, yes)).
query(true_val(handbuilt_in_usa, unk_handbuilt_in_usa)).

0.88::acc(s9, sustainability_certification_zero_waste).

% @attr sustainability_certification_zero_waste
% @type categorical
% @canonical false
% @original_name sustainability_certification (zero hazardous waste)
% @values zero_hazardous_waste=Zero_hazardous_waste_producing_factory unk_sustainability_certification_zero_waste=Unknown
% @importance 0.55

0.82::true_val(sustainability_certification_zero_waste, zero_hazardous_waste); 0.18::true_val(sustainability_certification_zero_waste, unk_sustainability_certification_zero_waste).

measured(s9, sustainability_certification_zero_waste, zero_hazardous_waste).

all_consistent(sustainability_certification_zero_waste) :- consistent(s9, sustainability_certification_zero_waste).

evidence(all_consistent(sustainability_certification_zero_waste)).
query(true_val(sustainability_certification_zero_waste, zero_hazardous_waste)).
query(true_val(sustainability_certification_zero_waste, unk_sustainability_certification_zero_waste)).

0.85::acc(s10, factory_size).

% @attr factory_size
% @type categorical
% @canonical false
% @original_name Factory size
% @values over_60000_sqft=Over_60000_sq_ft unk_factory_size=Unknown
% @importance 0.60

0.74::true_val(factory_size, over_60000_sqft); 0.26::true_val(factory_size, unk_factory_size).

measured(s10, factory_size, over_60000_sqft).

all_consistent(factory_size) :- consistent(s10, factory_size).

evidence(all_consistent(factory_size)).
query(true_val(factory_size, over_60000_sqft)).
query(true_val(factory_size, unk_factory_size)).

0.85::acc(s10, annual_production_volume).

% @attr annual_production_volume
% @type categorical
% @canonical false
% @original_name Annual production volume
% @values approx_100000=Approximately_100000_units unk_annual_production_volume=Unknown
% @importance 0.60

0.74::true_val(annual_production_volume, approx_100000); 0.26::true_val(annual_production_volume, unk_annual_production_volume).

measured(s10, annual_production_volume, approx_100000).

all_consistent(annual_production_volume) :- consistent(s10, annual_production_volume).

evidence(all_consistent(annual_production_volume)).
query(true_val(annual_production_volume, approx_100000)).
query(true_val(annual_production_volume, unk_annual_production_volume)).

0.78::acc(s11, model_first_available_year).
0.78::acc(s12, model_first_available_year).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values y2006=2006 y2007=2007
% @importance 0.60

0.45::true_val(model_first_available_year, y2006); 0.55::true_val(model_first_available_year, y2007).

measured(s11, model_first_available_year, y2006).
measured(s12, model_first_available_year, y2007).

all_consistent(model_first_available_year) :-
    consistent(s11, model_first_available_year),
    consistent(s12, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, y2006)).
query(true_val(model_first_available_year, y2007)).

0.80::acc(s13, banana_technology_inaugural_year).

% @attr banana_technology_inaugural_year
% @type categorical
% @canonical false
% @original_name Banana Technology inaugural year for broad sales
% @values y2008=2008 unk_banana_technology_inaugural_year=Unknown
% @importance 0.55

0.72::true_val(banana_technology_inaugural_year, y2008); 0.28::true_val(banana_technology_inaugural_year, unk_banana_technology_inaugural_year).

measured(s13, banana_technology_inaugural_year, y2008).

all_consistent(banana_technology_inaugural_year) :- consistent(s13, banana_technology_inaugural_year).

evidence(all_consistent(banana_technology_inaugural_year)).
query(true_val(banana_technology_inaugural_year, y2008)).
query(true_val(banana_technology_inaugural_year, unk_banana_technology_inaugural_year)).

0.78::acc(s11, industry_impact).
0.80::acc(s13, industry_impact).

% @attr industry_impact
% @type categorical
% @canonical false
% @original_name Industry impact
% @values started_rocker_revolution=Started_rocker_reverse_camber_revolution unk_industry_impact=Unknown
% @importance 0.575

0.95::true_val(industry_impact, started_rocker_revolution); 0.05::true_val(industry_impact, unk_industry_impact).

measured(s11, industry_impact, started_rocker_revolution).
measured(s13, industry_impact, started_rocker_revolution).

all_consistent(industry_impact) :-
    consistent(s11, industry_impact),
    consistent(s13, industry_impact).

evidence(all_consistent(industry_impact)).
query(true_val(industry_impact, started_rocker_revolution)).
query(true_val(industry_impact, unk_industry_impact)).

0.80::acc(s13, award_sia_2007).

% @attr award_sia_2007
% @type categorical
% @canonical false
% @original_name Award (SIA 2007)
% @values innovation_of_the_year=2007_Innovation_of_the_Year_SIA unk_award_sia_2007=Unknown
% @importance 0.55

0.72::true_val(award_sia_2007, innovation_of_the_year); 0.28::true_val(award_sia_2007, unk_award_sia_2007).

measured(s13, award_sia_2007, innovation_of_the_year).

all_consistent(award_sia_2007) :- consistent(s13, award_sia_2007).

evidence(all_consistent(award_sia_2007)).
query(true_val(award_sia_2007, innovation_of_the_year)).
query(true_val(award_sia_2007, unk_award_sia_2007)).

0.80::acc(s13, award_best_of_test_2009).

% @attr award_best_of_test_2009
% @type categorical
% @canonical false
% @original_name Award (Best of Test 2009)
% @values best_of_test_snowboarder=2009_Best_of_Test_Snowboarder_Magazine unk_award_best_of_test_2009=Unknown
% @importance 0.55

0.72::true_val(award_best_of_test_2009, best_of_test_snowboarder); 0.28::true_val(award_best_of_test_2009, unk_award_best_of_test_2009).

measured(s13, award_best_of_test_2009, best_of_test_snowboarder).

all_consistent(award_best_of_test_2009) :- consistent(s13, award_best_of_test_2009).

evidence(all_consistent(award_best_of_test_2009)).
query(true_val(award_best_of_test_2009, best_of_test_snowboarder)).
query(true_val(award_best_of_test_2009, unk_award_best_of_test_2009)).

0.80::acc(s13, award_good_wood_2009).

% @attr award_good_wood_2009
% @type categorical
% @canonical false
% @original_name Award (Good Wood 2009)
% @values good_wood_transworld=2009_Good_Wood_Transworld_Snowboarding unk_award_good_wood_2009=Unknown
% @importance 0.55

0.72::true_val(award_good_wood_2009, good_wood_transworld); 0.28::true_val(award_good_wood_2009, unk_award_good_wood_2009).

measured(s13, award_good_wood_2009, good_wood_transworld).

all_consistent(award_good_wood_2009) :- consistent(s13, award_good_wood_2009).

evidence(all_consistent(award_good_wood_2009)).
query(true_val(award_good_wood_2009, good_wood_transworld)).
query(true_val(award_good_wood_2009, unk_award_good_wood_2009)).

0.96::acc(s14, price_usd_msrp).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v579_99=579.99 unk_price_usd_msrp=Unknown
% @importance 1.0

0.93::true_val(price_usd_msrp, v579_99); 0.07::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s14, price_usd_msrp, v579_99).

all_consistent(price_usd_msrp) :- consistent(s14, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v579_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

0.72::acc(s15, price_aud_merchant).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v969_99=969.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.63::true_val(price_aud_merchant, v969_99); 0.37::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s15, price_aud_merchant, v969_99).

all_consistent(price_aud_merchant) :-
    (indep(s15), consistent(s15, price_aud_merchant) ; \+indep(s15)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v969_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

0.88::acc(s16, price_usd_evo).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v405_99=405.99 unk_price_usd_evo=Unknown
% @importance 0.90

0.81::true_val(price_usd_evo, v405_99); 0.19::true_val(price_usd_evo, unk_price_usd_evo).

measured(s16, price_usd_evo, v405_99).

all_consistent(price_usd_evo) :- consistent(s16, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v405_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

0.85::acc(s16, price_usd_evo_blem).

% @attr price_usd_evo_blem
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo (blem)
% @values v347_99=347.99 unk_price_usd_evo_blem=Unknown
% @importance 0.90

0.78::true_val(price_usd_evo_blem, v347_99); 0.22::true_val(price_usd_evo_blem, unk_price_usd_evo_blem).

measured(s16, price_usd_evo_blem, v347_99).

all_consistent(price_usd_evo_blem) :- consistent(s16, price_usd_evo_blem).

evidence(all_consistent(price_usd_evo_blem)).
query(true_val(price_usd_evo_blem, v347_99)).
query(true_val(price_usd_evo_blem, unk_price_usd_evo_blem)).

0.82::acc(s17, price_usd_tactics).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v405_99=405.99 unk_price_usd_tactics=Unknown
% @importance 0.90

0.66::true_val(price_usd_tactics, v405_99); 0.34::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s17, price_usd_tactics, v405_99).

all_consistent(price_usd_tactics) :- consistent(s17, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v405_99)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

0.80::acc(s17, price_usd_rei).

% @attr price_usd_rei
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_rei
% @values v405_83=405.83 unk_price_usd_rei=Unknown
% @importance 0.90

0.58::true_val(price_usd_rei, v405_83); 0.42::true_val(price_usd_rei, unk_price_usd_rei).

measured(s17, price_usd_rei, v405_83).

all_consistent(price_usd_rei) :- consistent(s17, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v405_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

0.72::acc(s18, price_usd_outdoor_gear_exchange).

% @attr price_usd_outdoor_gear_exchange
% @type numeric
% @unit USD
% @canonical false
% @original_name Price (USD, Outdoor Gear Exchange)
% @values v579_99=579.99 unk_price_usd_outdoor_gear_exchange=Unknown
% @importance 0.70

0.54::true_val(price_usd_outdoor_gear_exchange, v579_99); 0.46::true_val(price_usd_outdoor_gear_exchange, unk_price_usd_outdoor_gear_exchange).

measured(s18, price_usd_outdoor_gear_exchange, v579_99).

all_consistent(price_usd_outdoor_gear_exchange) :-
    (indep(s18), consistent(s18, price_usd_outdoor_gear_exchange) ; \+indep(s18)).

evidence(all_consistent(price_usd_outdoor_gear_exchange)).
query(true_val(price_usd_outdoor_gear_exchange, v579_99)).
query(true_val(price_usd_outdoor_gear_exchange, unk_price_usd_outdoor_gear_exchange)).

0.95::acc(s14, availability_status).
0.88::acc(s16, availability_status).
0.82::acc(s17, availability_status).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock=In_stock unk_availability_status=Unknown
% @importance 0.93

0.95::true_val(availability_status, in_stock); 0.05::true_val(availability_status, unk_availability_status).

measured(s14, availability_status, in_stock).
measured(s16, availability_status, in_stock).
measured(s17, availability_status, in_stock).

all_consistent(availability_status) :-
    consistent(s14, availability_status),
    consistent(s16, availability_status),
    consistent(s17, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock)).
query(true_val(availability_status, unk_availability_status)).

0.72::acc(s15, estimated_availability_date).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_1_2026=Preorder_estimated_May_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.85

0.63::true_val(estimated_availability_date, may_1_2026); 0.37::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s15, estimated_availability_date, may_1_2026).

all_consistent(estimated_availability_date) :-
    (indep(s15), consistent(s15, estimated_availability_date) ; \+indep(s15)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

0.70::acc(s19, comparable_board_cross_brand_capita_price).

% @attr comparable_board_cross_brand_capita_price
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (CAPiTA DOA price)
% @values capita_doa_463_96=CAPiTA_DOA_at_463_96 unk_comparable_board_cross_brand_capita_price=Unknown
% @importance 0.85

0.60::true_val(comparable_board_cross_brand_capita_price, capita_doa_463_96); 0.40::true_val(comparable_board_cross_brand_capita_price, unk_comparable_board_cross_brand_capita_price).

measured(s19, comparable_board_cross_brand_capita_price, capita_doa_463_96).

all_consistent(comparable_board_cross_brand_capita_price) :- consistent(s19, comparable_board_cross_brand_capita_price).

evidence(all_consistent(comparable_board_cross_brand_capita_price)).
query(true_val(comparable_board_cross_brand_capita_price, capita_doa_463_96)).
query(true_val(comparable_board_cross_brand_capita_price, unk_comparable_board_cross_brand_capita_price)).

0.70::acc(s19, comparable_board_cross_brand_jones_price).

% @attr comparable_board_cross_brand_jones_price
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones price)
% @values jones_mt_twin_579_95=Jones_Mountain_Twin_at_579_95 unk_comparable_board_cross_brand_jones_price=Unknown
% @importance 0.85

0.60::true_val(comparable_board_cross_brand_jones_price, jones_mt_twin_579_95); 0.40::true_val(comparable_board_cross_brand_jones_price, unk_comparable_board_cross_brand_jones_price).

measured(s19, comparable_board_cross_brand_jones_price, jones_mt_twin_579_95).

all_consistent(comparable_board_cross_brand_jones_price) :- consistent(s19, comparable_board_cross_brand_jones_price).

evidence(all_consistent(comparable_board_cross_brand_jones_price)).
query(true_val(comparable_board_cross_brand_jones_price, jones_mt_twin_579_95)).
query(true_val(comparable_board_cross_brand_jones_price, unk_comparable_board_cross_brand_jones_price)).

0.83::acc(s10, market_positioning).

% @attr market_positioning
% @type categorical
% @canonical false
% @original_name Market positioning
% @values higher_end_usa_made=Higher_end_performance_USA_made unk_market_positioning=Unknown
% @importance 0.60

0.72::true_val(market_positioning, higher_end_usa_made); 0.28::true_val(market_positioning, unk_market_positioning).

measured(s10, market_positioning, higher_end_usa_made).

all_consistent(market_positioning) :- consistent(s10, market_positioning).

evidence(all_consistent(market_positioning)).
query(true_val(market_positioning, higher_end_usa_made)).
query(true_val(market_positioning, unk_market_positioning)).

0.93::acc(s14, available_colors).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values random_colorways=Random_colorways unk_available_colors=Unknown
% @importance 1.0

0.87::true_val(available_colors, random_colorways); 0.13::true_val(available_colors, unk_available_colors).

measured(s14, available_colors, random_colorways).

all_consistent(available_colors) :- consistent(s14, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, random_colorways)).
query(true_val(available_colors, unk_available_colors)).

0.93::acc(s14, availability_status_libtech).

% @attr availability_status_libtech
% @type categorical
% @canonical false
% @original_name availability_status (Lib-tech.com)
% @values available=Available unk_availability_status_libtech=Unknown
% @importance 1.0

0.91::true_val(availability_status_libtech, available); 0.09::true_val(availability_status_libtech, unk_availability_status_libtech).

measured(s14, availability_status_libtech, available).

all_consistent(availability_status_libtech) :- consistent(s14, availability_status_libtech).

evidence(all_consistent(availability_status_libtech)).
query(true_val(availability_status_libtech, available)).
query(true_val(availability_status_libtech, unk_availability_status_libtech)).

0.85::acc(s16, availability_status_evo).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo.com)
% @values available=Available unk_availability_status_evo=Unknown
% @importance 0.90

0.83::true_val(availability_status_evo, available); 0.17::true_val(availability_status_evo, unk_availability_status_evo).

measured(s16, availability_status_evo, available).

all_consistent(availability_status_evo) :- consistent(s16, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

0.80::acc(s17, availability_status_tactics).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (Tactics.com)
% @values available=Available unk_availability_status_tactics=Unknown
% @importance 0.90

0.78::true_val(availability_status_tactics, available); 0.22::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s17, availability_status_tactics, available).

all_consistent(availability_status_tactics) :- consistent(s17, availability_status_tactics).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, available)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

0.82::acc(s20, availability_status_rei).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI)
% @values available=Available unk_availability_status_rei=Unknown
% @importance 0.75

0.79::true_val(availability_status_rei, available); 0.21::true_val(availability_status_rei, unk_availability_status_rei).

measured(s20, availability_status_rei, available).

all_consistent(availability_status_rei) :-
    (indep(s20), consistent(s20, availability_status_rei) ; \+indep(s20)).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, available)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

0.68::acc(s18, availability_status_gearx).

% @attr availability_status_gearx
% @type categorical
% @canonical false
% @original_name availability_status (Outdoor Gear Exchange)
% @values available=Available unk_availability_status_gearx=Unknown
% @importance 0.70

0.54::true_val(availability_status_gearx, available); 0.46::true_val(availability_status_gearx, unk_availability_status_gearx).

measured(s18, availability_status_gearx, available).

all_consistent(availability_status_gearx) :-
    (indep(s18), consistent(s18, availability_status_gearx) ; \+indep(s18)).

evidence(all_consistent(availability_status_gearx)).
query(true_val(availability_status_gearx, available)).
query(true_val(availability_status_gearx, unk_availability_status_gearx)).

0.62::acc(s21, availability_status_bluezone).

% @attr availability_status_bluezone
% @type categorical
% @canonical false
% @original_name availability_status (BlueZone Sports)
% @values available=Available unk_availability_status_bluezone=Unknown
% @importance 0.50

0.45::true_val(availability_status_bluezone, available); 0.55::true_val(availability_status_bluezone, unk_availability_status_bluezone).

measured(s21, availability_status_bluezone, available).

all_consistent(availability_status_bluezone) :-
    (indep(s21), consistent(s21, availability_status_bluezone) ; \+indep(s21)).

evidence(all_consistent(availability_status_bluezone)).
query(true_val(availability_status_bluezone, available)).
query(true_val(availability_status_bluezone, unk_availability_status_bluezone)).

0.65::acc(s15, availability_status_melbourne).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard Centre)
% @values available=Available unk_availability_status_melbourne=Unknown
% @importance 0.85

0.63::true_val(availability_status_melbourne, available); 0.37::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s15, availability_status_melbourne, available).

all_consistent(availability_status_melbourne) :-
    (indep(s15), consistent(s15, availability_status_melbourne) ; \+indep(s15)).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

0.62::acc(s22, availability_status_hansens).

% @attr availability_status_hansens
% @type categorical
% @canonical false
% @original_name availability_status (Hansens Surf)
% @values available=Available unk_availability_status_hansens=Unknown
% @importance 0.40

0.42::true_val(availability_status_hansens, available); 0.58::true_val(availability_status_hansens, unk_availability_status_hansens).

measured(s22, availability_status_hansens, available).

all_consistent(availability_status_hansens) :-
    (indep(s22), consistent(s22, availability_status_hansens) ; \+indep(s22)).

evidence(all_consistent(availability_status_hansens)).
query(true_val(availability_status_hansens, available)).
query(true_val(availability_status_hansens, unk_availability_status_hansens)).

0.62::acc(s23, availability_status_eriks).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status (ERIKS Bike Board Ski)
% @values available=Available unk_availability_status_eriks=Unknown
% @importance 0.40

0.42::true_val(availability_status_eriks, available); 0.58::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s23, availability_status_eriks, available).

all_consistent(availability_status_eriks) :-
    (indep(s23), consistent(s23, availability_status_eriks) ; \+indep(s23)).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, available)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

0.60::acc(s24, availability_status_sports_basement).

% @attr availability_status_sports_basement
% @type categorical
% @canonical false
% @original_name availability_status (Sports Basement)
% @values available=Available unk_availability_status_sports_basement=Unknown
% @importance 0.35

0.36::true_val(availability_status_sports_basement, available); 0.64::true_val(availability_status_sports_basement, unk_availability_status_sports_basement).

measured(s24, availability_status_sports_basement, available).

all_consistent(availability_status_sports_basement) :-
    (indep(s24), consistent(s24, availability_status_sports_basement) ; \+indep(s24)).

evidence(all_consistent(availability_status_sports_basement)).
query(true_val(availability_status_sports_basement, available)).
query(true_val(availability_status_sports_basement, unk_availability_status_sports_basement)).

0.58::acc(s25, availability_status_ridge_river).

% @attr availability_status_ridge_river
% @type categorical
% @canonical false
% @original_name availability_status (Ridge and River)
% @values available=Available unk_availability_status_ridge_river=Unknown
% @importance 0.35

0.36::true_val(availability_status_ridge_river, available); 0.64::true_val(availability_status_ridge_river, unk_availability_status_ridge_river).

measured(s25, availability_status_ridge_river, available).

all_consistent(availability_status_ridge_river) :-
    (indep(s25), consistent(s25, availability_status_ridge_river) ; \+indep(s25)).

evidence(all_consistent(availability_status_ridge_river)).
query(true_val(availability_status_ridge_river, available)).
query(true_val(availability_status_ridge_river, unk_availability_status_ridge_river)).

0.95::acc(s14, camber_type).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values original_banana=Original_Banana_OB_mild_rocker_between_feet unk_camber_type=Unknown
% @importance 1.0

0.93::true_val(camber_type, original_banana); 0.07::true_val(camber_type, unk_camber_type).

measured(s14, camber_type, original_banana).

all_consistent(camber_type) :- consistent(s14, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, original_banana)).
query(true_val(camber_type, unk_camber_type)).

0.92::acc(s14, camber_description).
0.88::acc(s26, camber_description).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values dynamic_camber_rocker=Rocker_between_feet_dynamic_camber hybrid_rocker_near_full=Hybrid_rocker_closer_to_full_rocker
% @importance 0.975

0.55::true_val(camber_description, dynamic_camber_rocker); 0.45::true_val(camber_description, hybrid_rocker_near_full).

measured(s14, camber_description, dynamic_camber_rocker).
measured(s26, camber_description, hybrid_rocker_near_full).

all_consistent(camber_description) :-
    consistent(s14, camber_description),
    consistent(s26, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, dynamic_camber_rocker)).
query(true_val(camber_description, hybrid_rocker_near_full)).

0.90::acc(s26, camber_height_mm).

% @attr camber_height_mm
% @type numeric
% @unit mm
% @canonical true
% @original_name camber_height_mm
% @values v1=1.0 unk_camber_height_mm=Unknown
% @importance 0.95

0.74::true_val(camber_height_mm, v1); 0.26::true_val(camber_height_mm, unk_camber_height_mm).

measured(s26, camber_height_mm, v1).

all_consistent(camber_height_mm) :- consistent(s26, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v1)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

0.93::acc(s14, flex_rating_10_manufacturer).
0.68::acc(s15, flex_rating_10_manufacturer).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values v5=5.0 v4=4.0
% @importance 0.925

0.60::true_val(flex_rating_10_manufacturer, v5); 0.40::true_val(flex_rating_10_manufacturer, v4).

measured(s14, flex_rating_10_manufacturer, v5).
measured(s15, flex_rating_10_manufacturer, v4).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s14, flex_rating_10_manufacturer),
    (indep(s15), consistent(s15, flex_rating_10_manufacturer) ; \+indep(s15)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v5)).
query(true_val(flex_rating_10_manufacturer, v4)).

0.90::acc(s14, flex_rating_10_manufacturer_large).

% @attr flex_rating_10_manufacturer_large
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer (larger sizes)
% @values v6=6.0 unk_flex_rating_10_manufacturer_large=Unknown
% @importance 1.0

0.88::true_val(flex_rating_10_manufacturer_large, v6); 0.12::true_val(flex_rating_10_manufacturer_large, unk_flex_rating_10_manufacturer_large).

measured(s14, flex_rating_10_manufacturer_large, v6).

all_consistent(flex_rating_10_manufacturer_large) :- consistent(s14, flex_rating_10_manufacturer_large).

evidence(all_consistent(flex_rating_10_manufacturer_large)).
query(true_val(flex_rating_10_manufacturer_large, v6)).
query(true_val(flex_rating_10_manufacturer_large, unk_flex_rating_10_manufacturer_large)).

0.70::acc(s15, flex_rating_10).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v4=4.0 unk_flex_rating_10=Unknown
% @importance 0.85

0.63::true_val(flex_rating_10, v4); 0.37::true_val(flex_rating_10, unk_flex_rating_10).

measured(s15, flex_rating_10, v4).

all_consistent(flex_rating_10) :-
    (indep(s15), consistent(s15, flex_rating_10) ; \+indep(s15)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

0.88::acc(s26, flex_feel).
0.82::acc(s27, flex_feel).
0.75::acc(s28, flex_feel).
0.62::acc(s29, flex_feel).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_soft=Medium_Soft unk_flex_feel=Unknown
% @importance 0.81

0.95::true_val(flex_feel, medium_soft); 0.05::true_val(flex_feel, unk_flex_feel).

measured(s26, flex_feel, medium_soft).
measured(s27, flex_feel, medium_soft).
measured(s28, flex_feel, medium_soft).
measured(s29, flex_feel, medium_soft).

all_consistent(flex_feel) :-
    consistent(s26, flex_feel),
    consistent(s27, flex_feel),
    (indep(s28), consistent(s28, flex_feel) ; \+indep(s28)),
    consistent(s29, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_soft)).
query(true_val(flex_feel, unk_flex_feel)).

0.95::acc(s14, core_material).
0.80::acc(s8, core_material).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values op_plus_aspen_paulownia=OP_Plus_75pct_Aspen_25pct_Paulownia unk_core_material=Unknown
% @importance 0.925

0.95::true_val(core_material, op_plus_aspen_paulownia); 0.05::true_val(core_material, unk_core_material).

measured(s14, core_material, op_plus_aspen_paulownia).
measured(s8, core_material, op_plus_aspen_paulownia).

all_consistent(core_material) :-
    consistent(s14, core_material),
    (indep(s8), consistent(s8, core_material) ; \+indep(s8)).

evidence(all_consistent(core_material)).
query(true_val(core_material, op_plus_aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

0.95::acc(s14, sustainability_certification_fsc).
0.88::acc(s9, sustainability_certification_fsc).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC certified wood)
% @values fsc_certified=FSC_certified_wood unk_sustainability_certification_fsc=Unknown
% @importance 0.775

0.95::true_val(sustainability_certification_fsc, fsc_certified); 0.05::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s14, sustainability_certification_fsc, fsc_certified).
measured(s9, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :-
    consistent(s14, sustainability_certification_fsc),
    consistent(s9, sustainability_certification_fsc).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

0.85::acc(s20, laminate).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values tri_ax_bi_ax=Tri_Ax_Bi_Ax_Fiber unk_laminate=Unknown
% @importance 0.75

0.79::true_val(laminate, tri_ax_bi_ax); 0.21::true_val(laminate, unk_laminate).

measured(s20, laminate, tri_ax_bi_ax).

all_consistent(laminate) :-
    (indep(s20), consistent(s20, laminate) ; \+indep(s20)).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax_bi_ax)).
query(true_val(laminate, unk_laminate)).

0.85::acc(s20, laminate_triax).

% @attr laminate_triax
% @type categorical
% @canonical false
% @original_name laminate (Tri-Ax detail)
% @values triax_0_45_45=Tri_Ax_0x45x45_torsional_responsiveness unk_laminate_triax=Unknown
% @importance 0.75

0.79::true_val(laminate_triax, triax_0_45_45); 0.21::true_val(laminate_triax, unk_laminate_triax).

measured(s20, laminate_triax, triax_0_45_45).

all_consistent(laminate_triax) :-
    (indep(s20), consistent(s20, laminate_triax) ; \+indep(s20)).

evidence(all_consistent(laminate_triax)).
query(true_val(laminate_triax, triax_0_45_45)).
query(true_val(laminate_triax, unk_laminate_triax)).

0.85::acc(s20, laminate_biax).

% @attr laminate_biax
% @type categorical
% @canonical false
% @original_name laminate (Bi-Ax detail)
% @values biax_0_90=Bi_Ax_0x90_pop_stability_control unk_laminate_biax=Unknown
% @importance 0.75

0.79::true_val(laminate_biax, biax_0_90); 0.21::true_val(laminate_biax, unk_laminate_biax).

measured(s20, laminate_biax, biax_0_90).

all_consistent(laminate_biax) :-
    (indep(s20), consistent(s20, laminate_biax) ; \+indep(s20)).

evidence(all_consistent(laminate_biax)).
query(true_val(laminate_biax, biax_0_90)).
query(true_val(laminate_biax, unk_laminate_biax)).

0.82::acc(s8, sidewall_material).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch_internal=Birch_internal_sidewalls unk_sidewall_material=Unknown
% @importance 0.85

0.72::true_val(sidewall_material, birch_internal); 0.28::true_val(sidewall_material, unk_sidewall_material).

measured(s8, sidewall_material, birch_internal).

all_consistent(sidewall_material) :-
    (indep(s8), consistent(s8, sidewall_material) ; \+indep(s8)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_internal)).
query(true_val(sidewall_material, unk_sidewall_material)).

0.82::acc(s8, sidewall_material_uhmw).

% @attr sidewall_material_uhmw
% @type categorical
% @canonical false
% @original_name sidewall_material (UHMW sintered)
% @values uhmw_sintered=UHMW_Sintered_Sidewalls unk_sidewall_material_uhmw=Unknown
% @importance 0.85

0.72::true_val(sidewall_material_uhmw, uhmw_sintered); 0.28::true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw).

measured(s8, sidewall_material_uhmw, uhmw_sintered).

all_consistent(sidewall_material_uhmw) :-
    (indep(s8), consistent(s8, sidewall_material_uhmw) ; \+indep(s8)).

evidence(all_consistent(sidewall_material_uhmw)).
query(true_val(sidewall_material_uhmw, uhmw_sintered)).
query(true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw)).

0.85::acc(s30, topsheet).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Topsheet unk_topsheet=Unknown
% @importance 0.70

0.72::true_val(topsheet, eco_sublimated_poly); 0.28::true_val(topsheet, unk_topsheet).

measured(s30, topsheet, eco_sublimated_poly).

all_consistent(topsheet) :-
    (indep(s30), consistent(s30, topsheet) ; \+indep(s30)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

0.85::acc(s30, base_type).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_knife_cut=Sintered_Knife_Cut_Base unk_base_type=Unknown
% @importance 0.70

0.72::true_val(base_type, sintered_knife_cut); 0.28::true_val(base_type, unk_base_type).

measured(s30, base_type, sintered_knife_cut).

all_consistent(base_type) :-
    (indep(s30), consistent(s30, base_type) ; \+indep(s30)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_knife_cut)).
query(true_val(base_type, unk_base_type)).

0.95::acc(s14, edge_technology).
0.85::acc(s20, edge_technology).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction_7=Magne_Traction_7_serrations unk_edge_technology=Unknown
% @importance 0.875

0.95::true_val(edge_technology, magne_traction_7); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s14, edge_technology, magne_traction_7).
measured(s20, edge_technology, magne_traction_7).

all_consistent(edge_technology) :-
    consistent(s14, edge_technology),
    (indep(s20), consistent(s20, edge_technology) ; \+indep(s20)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7)).
query(true_val(edge_technology, unk_edge_technology)).

0.72::acc(s15, tip_tail_protection).

% @attr tip_tail_protection
% @type categorical
% @canonical false
% @original_name Tip/tail protection
% @values uhmw_deflection=UHMW_Tip_Tail_Impact_Deflection unk_tip_tail_protection=Unknown
% @importance 0.85

0.63::true_val(tip_tail_protection, uhmw_deflection); 0.37::true_val(tip_tail_protection, unk_tip_tail_protection).

measured(s15, tip_tail_protection, uhmw_deflection).

all_consistent(tip_tail_protection) :-
    (indep(s15), consistent(s15, tip_tail_protection) ; \+indep(s15)).

evidence(all_consistent(tip_tail_protection)).
query(true_val(tip_tail_protection, uhmw_deflection)).
query(true_val(tip_tail_protection, unk_tip_tail_protection)).

0.72::acc(s15, mounting_pattern).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.63::true_val(mounting_pattern, inserts_2x4); 0.37::true_val(mounting_pattern, unk_mounting_pattern).

measured(s15, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s15), consistent(s15, mounting_pattern) ; \+indep(s15)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

0.88::acc(s9, sustainability_certification).
0.78::acc(s31, sustainability_certification).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values comprehensive_eco=FSC_wood_eco_sublimation_zero_waste_biodiesel_hydroelectric unk_sustainability_certification=Unknown
% @importance 0.475

0.95::true_val(sustainability_certification, comprehensive_eco); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s9, sustainability_certification, comprehensive_eco).
measured(s31, sustainability_certification, comprehensive_eco).

all_consistent(sustainability_certification) :-
    consistent(s9, sustainability_certification),
    consistent(s31, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, comprehensive_eco)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

0.95::acc(s14, available_sizes).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values r150_152_154_156_159=150_152_154_156_159cm unk_available_sizes=Unknown
% @importance 1.0

0.93::true_val(available_sizes, r150_152_154_156_159); 0.07::true_val(available_sizes, unk_available_sizes).

measured(s14, available_sizes, r150_152_154_156_159).

all_consistent(available_sizes) :- consistent(s14, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, r150_152_154_156_159)).
query(true_val(available_sizes, unk_available_sizes)).

0.95::acc(s14, available_sizes_wide).

% @attr available_sizes_wide
% @type categorical
% @canonical false
% @original_name available_sizes (wide)
% @values w153_156_159_162=153W_156W_159W_162W unk_available_sizes_wide=Unknown
% @importance 1.0

0.93::true_val(available_sizes_wide, w153_156_159_162); 0.07::true_val(available_sizes_wide, unk_available_sizes_wide).

measured(s14, available_sizes_wide, w153_156_159_162).

all_consistent(available_sizes_wide) :- consistent(s14, available_sizes_wide).

evidence(all_consistent(available_sizes_wide)).
query(true_val(available_sizes_wide, w153_156_159_162)).
query(true_val(available_sizes_wide, unk_available_sizes_wide)).

0.95::acc(s14, contact_length_size_150).

% @attr contact_length_size_150
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (150cm)
% @values v112=112.0 unk_contact_length_size_150=Unknown
% @importance 1.0

0.93::true_val(contact_length_size_150, v112); 0.07::true_val(contact_length_size_150, unk_contact_length_size_150).

measured(s14, contact_length_size_150, v112).

all_consistent(contact_length_size_150) :- consistent(s14, contact_length_size_150).

evidence(all_consistent(contact_length_size_150)).
query(true_val(contact_length_size_150, v112)).
query(true_val(contact_length_size_150, unk_contact_length_size_150)).

0.95::acc(s14, sidecut_radius_size_150).

% @attr sidecut_radius_size_150
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (150cm)
% @values v8_1=8.1 unk_sidecut_radius_size_150=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_size_150, v8_1); 0.07::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).

measured(s14, sidecut_radius_size_150, v8_1).

all_consistent(sidecut_radius_size_150) :- consistent(s14, sidecut_radius_size_150).

evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v8_1)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

0.95::acc(s14, tip_tail_width_size).

% @attr tip_tail_width_size
% @type numeric
% @unit cm
% @canonical true
% @original_name tip_tail_width_size
% @values v28_8=28.8 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.93::true_val(tip_tail_width_size, v28_8); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s14, tip_tail_width_size, v28_8).

all_consistent(tip_tail_width_size) :- consistent(s14, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v28_8)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

0.95::acc(s14, waist_width_150).

% @attr waist_width_150
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 150cm
% @values v25_0=25.0 unk_waist_width_150=Unknown
% @importance 1.0

0.93::true_val(waist_width_150, v25_0); 0.07::true_val(waist_width_150, unk_waist_width_150).

measured(s14, waist_width_150, v25_0).

all_consistent(waist_width_150) :- consistent(s14, waist_width_150).

evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v25_0)).
query(true_val(waist_width_150, unk_waist_width_150)).

0.95::acc(s14, recommended_weight_range_size_150).

% @attr recommended_weight_range_size_150
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size (150cm)
% @values w65_plus=65_plus_lbs unk_recommended_weight_range_size_150=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size_150, w65_plus); 0.07::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).

measured(s14, recommended_weight_range_size_150, w65_plus).

all_consistent(recommended_weight_range_size_150) :- consistent(s14, recommended_weight_range_size_150).

evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, w65_plus)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

0.95::acc(s14, contact_length_size_152).

% @attr contact_length_size_152
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (152cm)
% @values v114=114.0 unk_contact_length_size_152=Unknown
% @importance 1.0

0.93::true_val(contact_length_size_152, v114); 0.07::true_val(contact_length_size_152, unk_contact_length_size_152).

measured(s14, contact_length_size_152, v114).

all_consistent(contact_length_size_152) :- consistent(s14, contact_length_size_152).

evidence(all_consistent(contact_length_size_152)).
query(true_val(contact_length_size_152, v114)).
query(true_val(contact_length_size_152, unk_contact_length_size_152)).

0.95::acc(s14, sidecut_radius_size_152).

% @attr sidecut_radius_size_152
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (152cm)
% @values v8_2=8.2 unk_sidecut_radius_size_152=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_size_152, v8_2); 0.07::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

measured(s14, sidecut_radius_size_152, v8_2).

all_consistent(sidecut_radius_size_152) :- consistent(s14, sidecut_radius_size_152).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v8_2)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

0.95::acc(s14, waist_width_152).

% @attr waist_width_152
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 152cm
% @values v25_2=25.2 unk_waist_width_152=Unknown
% @importance 1.0

0.93::true_val(waist_width_152, v25_2); 0.07::true_val(waist_width_152, unk_waist_width_152).

measured(s14, waist_width_152, v25_2).

all_consistent(waist_width_152) :- consistent(s14, waist_width_152).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v25_2)).
query(true_val(waist_width_152, unk_waist_width_152)).

0.95::acc(s14, recommended_weight_range_size_152).

% @attr recommended_weight_range_size_152
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size (152cm)
% @values w70_plus=70_plus_lbs unk_recommended_weight_range_size_152=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size_152, w70_plus); 0.07::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(s14, recommended_weight_range_size_152, w70_plus).

all_consistent(recommended_weight_range_size_152) :- consistent(s14, recommended_weight_range_size_152).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, w70_plus)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

0.95::acc(s14, contact_length_size_154).

% @attr contact_length_size_154
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (154cm)
% @values v115=115.0 unk_contact_length_size_154=Unknown
% @importance 1.0

0.93::true_val(contact_length_size_154, v115); 0.07::true_val(contact_length_size_154, unk_contact_length_size_154).

measured(s14, contact_length_size_154, v115).

all_consistent(contact_length_size_154) :- consistent(s14, contact_length_size_154).

evidence(all_consistent(contact_length_size_154)).
query(true_val(contact_length_size_154, v115)).
query(true_val(contact_length_size_154, unk_contact_length_size_154)).

0.95::acc(s14, waist_width_154).

% @attr waist_width_154
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 154cm
% @values v25_3=25.3 unk_waist_width_154=Unknown
% @importance 1.0

0.93::true_val(waist_width_154, v25_3); 0.07::true_val(waist_width_154, unk_waist_width_154).

measured(s14, waist_width_154, v25_3).

all_consistent(waist_width_154) :- consistent(s14, waist_width_154).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_3)).
query(true_val(waist_width_154, unk_waist_width_154)).

0.95::acc(s14, recommended_weight_range_size_154).

% @attr recommended_weight_range_size_154
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size (154cm)
% @values w75_plus=75_plus_lbs unk_recommended_weight_range_size_154=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size_154, w75_plus); 0.07::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(s14, recommended_weight_range_size_154, w75_plus).

all_consistent(recommended_weight_range_size_154) :- consistent(s14, recommended_weight_range_size_154).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, w75_plus)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

0.95::acc(s14, contact_length_size).

% @attr contact_length_size
% @type numeric
% @unit cm
% @canonical true
% @original_name contact_length_size
% @values v117=117.0 unk_contact_length_size=Unknown
% @importance 1.0

0.93::true_val(contact_length_size, v117); 0.07::true_val(contact_length_size, unk_contact_length_size).

measured(s14, contact_length_size, v117).

all_consistent(contact_length_size) :- consistent(s14, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v117)).
query(true_val(contact_length_size, unk_contact_length_size)).

0.95::acc(s14, sidecut_radius_size).

% @attr sidecut_radius_size
% @type numeric
% @unit m
% @canonical true
% @original_name sidecut_radius_size
% @values v8_3=8.3 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_size, v8_3); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s14, sidecut_radius_size, v8_3).

all_consistent(sidecut_radius_size) :- consistent(s14, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_3)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

0.95::acc(s14, waist_width_156).

% @attr waist_width_156
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156cm
% @values v25_5=25.5 unk_waist_width_156=Unknown
% @importance 1.0

0.93::true_val(waist_width_156, v25_5); 0.07::true_val(waist_width_156, unk_waist_width_156).

measured(s14, waist_width_156, v25_5).

all_consistent(waist_width_156) :- consistent(s14, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_5)).
query(true_val(waist_width_156, unk_waist_width_156)).

0.95::acc(s14, recommended_weight_range_size).

% @attr recommended_weight_range_size
% @type categorical
% @unit lbs
% @canonical true
% @original_name recommended_weight_range_size
% @values w80_plus=80_plus_lbs unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size, w80_plus); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s14, recommended_weight_range_size, w80_plus).

all_consistent(recommended_weight_range_size) :- consistent(s14, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w80_plus)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

0.95::acc(s14, contact_length_size_159).

% @attr contact_length_size_159
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (159cm)
% @values v120=120.0 unk_contact_length_size_159=Unknown
% @importance 1.0

0.93::true_val(contact_length_size_159, v120); 0.07::true_val(contact_length_size_159, unk_contact_length_size_159).

measured(s14, contact_length_size_159, v120).

all_consistent(contact_length_size_159) :- consistent(s14, contact_length_size_159).

evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v120)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

0.95::acc(s14, sidecut_radius_size_159).

% @attr sidecut_radius_size_159
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @values v8_4=8.4 unk_sidecut_radius_size_159=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_size_159, v8_4); 0.07::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s14, sidecut_radius_size_159, v8_4).

all_consistent(sidecut_radius_size_159) :- consistent(s14, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_4)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

0.95::acc(s14, waist_width_159).

% @attr waist_width_159
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159cm
% @values v25_5=25.5 unk_waist_width_159=Unknown
% @importance 1.0

0.93::true_val(waist_width_159, v25_5); 0.07::true_val(waist_width_159, unk_waist_width_159).

measured(s14, waist_width_159, v25_5).

all_consistent(waist_width_159) :- consistent(s14, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_5)).
query(true_val(waist_width_159, unk_waist_width_159)).

0.95::acc(s14, recommended_weight_range_size_159).

% @attr recommended_weight_range_size_159
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @values w85_plus=85_plus_lbs unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size_159, w85_plus); 0.07::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s14, recommended_weight_range_size_159, w85_plus).

all_consistent(recommended_weight_range_size_159) :- consistent(s14, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w85_plus)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

0.95::acc(s14, waist_width_153w).

% @attr waist_width_153w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 153W
% @values v26_1=26.1 unk_waist_width_153w=Unknown
% @importance 1.0

0.93::true_val(waist_width_153w, v26_1); 0.07::true_val(waist_width_153w, unk_waist_width_153w).

measured(s14, waist_width_153w, v26_1).

all_consistent(waist_width_153w) :- consistent(s14, waist_width_153w).

evidence(all_consistent(waist_width_153w)).
query(true_val(waist_width_153w, v26_1)).
query(true_val(waist_width_153w, unk_waist_width_153w)).

0.95::acc(s14, waist_width_156w).

% @attr waist_width_156w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 156W
% @values v26_5=26.5 unk_waist_width_156w=Unknown
% @importance 1.0

0.93::true_val(waist_width_156w, v26_5); 0.07::true_val(waist_width_156w, unk_waist_width_156w).

measured(s14, waist_width_156w, v26_5).

all_consistent(waist_width_156w) :- consistent(s14, waist_width_156w).

evidence(all_consistent(waist_width_156w)).
query(true_val(waist_width_156w, v26_5)).
query(true_val(waist_width_156w, unk_waist_width_156w)).

0.95::acc(s14, waist_width_159w).

% @attr waist_width_159w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 159W
% @values v26_5=26.5 unk_waist_width_159w=Unknown
% @importance 1.0

0.93::true_val(waist_width_159w, v26_5); 0.07::true_val(waist_width_159w, unk_waist_width_159w).

measured(s14, waist_width_159w, v26_5).

all_consistent(waist_width_159w) :- consistent(s14, waist_width_159w).

evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_5)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

0.95::acc(s14, waist_width_162w).

% @attr waist_width_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name Waist width 162W
% @values v26_5=26.5 unk_waist_width_162w=Unknown
% @importance 1.0

0.93::true_val(waist_width_162w, v26_5); 0.07::true_val(waist_width_162w, unk_waist_width_162w).

measured(s14, waist_width_162w, v26_5).

all_consistent(waist_width_162w) :- consistent(s14, waist_width_162w).

evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v26_5)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

0.95::acc(s14, contact_length_size_162w).

% @attr contact_length_size_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name contact_length_size (162W)
% @values v123=123.0 unk_contact_length_size_162w=Unknown
% @importance 1.0

0.93::true_val(contact_length_size_162w, v123); 0.07::true_val(contact_length_size_162w, unk_contact_length_size_162w).

measured(s14, contact_length_size_162w, v123).

all_consistent(contact_length_size_162w) :- consistent(s14, contact_length_size_162w).

evidence(all_consistent(contact_length_size_162w)).
query(true_val(contact_length_size_162w, v123)).
query(true_val(contact_length_size_162w, unk_contact_length_size_162w)).

0.95::acc(s14, sidecut_radius_size_162w).

% @attr sidecut_radius_size_162w
% @type numeric
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162W)
% @values v8_4=8.4 unk_sidecut_radius_size_162w=Unknown
% @importance 1.0

0.93::true_val(sidecut_radius_size_162w, v8_4); 0.07::true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w).

measured(s14, sidecut_radius_size_162w, v8_4).

all_consistent(sidecut_radius_size_162w) :- consistent(s14, sidecut_radius_size_162w).

evidence(all_consistent(sidecut_radius_size_162w)).
query(true_val(sidecut_radius_size_162w, v8_4)).
query(true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w)).

0.95::acc(s14, tip_tail_width_size_162w).

% @attr tip_tail_width_size_162w
% @type numeric
% @unit cm
% @canonical false
% @original_name tip_tail_width_size (162W)
% @values v31_0=31.0 unk_tip_tail_width_size_162w=Unknown
% @importance 1.0

0.93::true_val(tip_tail_width_size_162w, v31_0); 0.07::true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w).

measured(s14, tip_tail_width_size_162w, v31_0).

all_consistent(tip_tail_width_size_162w) :- consistent(s14, tip_tail_width_size_162w).

evidence(all_consistent(tip_tail_width_size_162w)).
query(true_val(tip_tail_width_size_162w, v31_0)).
query(true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w)).

0.95::acc(s14, recommended_weight_range_size_162w).

% @attr recommended_weight_range_size_162w
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size (162W)
% @values w90_plus=90_plus_lbs unk_recommended_weight_range_size_162w=Unknown
% @importance 1.0

0.93::true_val(recommended_weight_range_size_162w, w90_plus); 0.07::true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w).

measured(s14, recommended_weight_range_size_162w, w90_plus).

all_consistent(recommended_weight_range_size_162w) :- consistent(s14, recommended_weight_range_size_162w).

evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, w90_plus)).
query(true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w)).

0.95::acc(s14, setback).
0.72::acc(s15, setback).

% @attr setback
% @type numeric
% @unit inches
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 0.925

0.95::true_val(setback, v0); 0.05::true_val(setback, unk_setback).

measured(s14, setback, v0).
measured(s15, setback, v0).

all_consistent(setback) :-
    consistent(s14, setback),
    (indep(s15), consistent(s15, setback) ; \+indep(s15)).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

0.95::acc(s14, stance_width_range_size).

% @attr stance_width_range_size
% @type categorical
% @unit inches
% @canonical true
% @original_name stance_width_range_size
% @values r19_25_to_24=19.25_to_24_inches unk_stance_width_range_size=Unknown
% @importance 1.0

0.93::true_val(stance_width_range_size, r19_25_to_24); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s14, stance_width_range_size, r19_25_to_24).

all_consistent(stance_width_range_size) :- consistent(s14, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r19_25_to_24)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

0.95::acc(s14, stance_width_range_size_wide).

% @attr stance_width_range_size_wide
% @type categorical
% @unit inches
% @canonical false
% @original_name stance_width_range_size (wide)
% @values r20_25_to_25=20.25_to_25_inches unk_stance_width_range_size_wide=Unknown
% @importance 1.0

0.93::true_val(stance_width_range_size_wide, r20_25_to_25); 0.07::true_val(stance_width_range_size_wide, unk_stance_width_range_size_wide).

measured(s14, stance_width_range_size_wide, r20_25_to_25).

all_consistent(stance_width_range_size_wide) :- consistent(s14, stance_width_range_size_wide).

evidence(all_consistent(stance_width_range_size_wide)).
query(true_val(stance_width_range_size_wide, r20_25_to_25)).
query(true_val(stance_width_range_size_wide, unk_stance_width_range_size_wide)).

0.88::acc(s26, board_weight_grams).

% @attr board_weight_grams
% @type numeric
% @unit g
% @canonical true
% @original_name board_weight_grams
% @values v2860=2860.0 unk_board_weight_grams=Unknown
% @importance 0.95

0.74::true_val(board_weight_grams, v2860); 0.26::true_val(board_weight_grams, unk_board_weight_grams).

measured(s26, board_weight_grams, v2860).

all_consistent(board_weight_grams) :- consistent(s26, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2860)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

0.88::acc(s26, weight_per_cm).

% @attr weight_per_cm
% @type numeric
% @unit g/cm
% @canonical true
% @original_name weight_per_cm
% @values v18_33=18.33 unk_weight_per_cm=Unknown
% @importance 0.95

0.74::true_val(weight_per_cm, v18_33); 0.26::true_val(weight_per_cm, unk_weight_per_cm).

measured(s26, weight_per_cm, v18_33).

all_consistent(weight_per_cm) :- consistent(s26, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v18_33)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

0.85::acc(s26, weight_per_cm_avg).

% @attr weight_per_cm_avg
% @type numeric
% @unit g/cm
% @canonical false
% @original_name weight_per_cm (average comparison)
% @values v18_58=18.58 unk_weight_per_cm_avg=Unknown
% @importance 0.95

0.74::true_val(weight_per_cm_avg, v18_58); 0.26::true_val(weight_per_cm_avg, unk_weight_per_cm_avg).

measured(s26, weight_per_cm_avg, v18_58).

all_consistent(weight_per_cm_avg) :- consistent(s26, weight_per_cm_avg).

evidence(all_consistent(weight_per_cm_avg)).
query(true_val(weight_per_cm_avg, v18_58)).
query(true_val(weight_per_cm_avg, unk_weight_per_cm_avg)).

0.80::acc(s27, reviewer_opinion_the_good_ride).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values heavy_but_reliable=Heavy_side_trade_weight_for_reliability unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.85

0.66::true_val(reviewer_opinion_the_good_ride, heavy_but_reliable); 0.34::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s27, reviewer_opinion_the_good_ride, heavy_but_reliable).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s27, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, heavy_but_reliable)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

0.95::acc(s14, rider_level).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner_to_pro=Beginner_to_Pro unk_rider_level=Unknown
% @importance 1.0

0.93::true_val(rider_level, beginner_to_pro); 0.07::true_val(rider_level, unk_rider_level).

measured(s14, rider_level, beginner_to_pro).

all_consistent(rider_level) :- consistent(s14, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_to_pro)).
query(true_val(rider_level, unk_rider_level)).

0.70::acc(s15, skill_level_recommendation).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_intermediate=Beginner_Intermediate unk_skill_level_recommendation=Unknown
% @importance 0.85

0.63::true_val(skill_level_recommendation, beginner_intermediate); 0.37::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s15, skill_level_recommendation, beginner_intermediate).

all_consistent(skill_level_recommendation) :-
    (indep(s15), consistent(s15, skill_level_recommendation) ; \+indep(s15)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_intermediate)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

0.88::acc(s26, skill_level_recommendation_detailed).

% @attr skill_level_recommendation_detailed
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (detailed)
% @values loose_playful_jib=Best_for_loose_playful_jib_butter_small_jumps unk_skill_level_recommendation_detailed=Unknown
% @importance 0.95

0.74::true_val(skill_level_recommendation_detailed, loose_playful_jib); 0.26::true_val(skill_level_recommendation_detailed, unk_skill_level_recommendation_detailed).

measured(s26, skill_level_recommendation_detailed, loose_playful_jib).

all_consistent(skill_level_recommendation_detailed) :- consistent(s26, skill_level_recommendation_detailed).

evidence(all_consistent(skill_level_recommendation_detailed)).
query(true_val(skill_level_recommendation_detailed, loose_playful_jib)).
query(true_val(skill_level_recommendation_detailed, unk_skill_level_recommendation_detailed)).

0.88::acc(s26, negative_aspect_aggressive).

% @attr negative_aspect_aggressive
% @type categorical
% @canonical false
% @original_name negative_aspect (aggressive riding)
% @values not_for_bombing_carving_big_air=Not_suited_to_bombing_carving_big_air unk_negative_aspect_aggressive=Unknown
% @importance 0.95

0.74::true_val(negative_aspect_aggressive, not_for_bombing_carving_big_air); 0.26::true_val(negative_aspect_aggressive, unk_negative_aspect_aggressive).

measured(s26, negative_aspect_aggressive, not_for_bombing_carving_big_air).

all_consistent(negative_aspect_aggressive) :- consistent(s26, negative_aspect_aggressive).

evidence(all_consistent(negative_aspect_aggressive)).
query(true_val(negative_aspect_aggressive, not_for_bombing_carving_big_air)).
query(true_val(negative_aspect_aggressive, unk_negative_aspect_aggressive)).

0.88::acc(s26, overall_rating_snowboardingprofiles).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v84_2=84.2 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.95

0.74::true_val(overall_rating_snowboardingprofiles, v84_2); 0.26::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s26, overall_rating_snowboardingprofiles, v84_2).

all_consistent(overall_rating_snowboardingprofiles) :- consistent(s26, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v84_2)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

0.88::acc(s26, overall_rating_snowboardingprofiles_rank).

% @attr overall_rating_snowboardingprofiles_rank
% @type categorical
% @canonical false
% @original_name overall_rating_snowboardingprofiles (ranking)
% @values rank_15_of_28=15th_out_of_28 unk_overall_rating_snowboardingprofiles_rank=Unknown
% @importance 0.95

0.74::true_val(overall_rating_snowboardingprofiles_rank, rank_15_of_28); 0.26::true_val(overall_rating_snowboardingprofiles_rank, unk_overall_rating_snowboardingprofiles_rank).

measured(s26, overall_rating_snowboardingprofiles_rank, rank_15_of_28).

all_consistent(overall_rating_snowboardingprofiles_rank) :- consistent(s26, overall_rating_snowboardingprofiles_rank).

evidence(all_consistent(overall_rating_snowboardingprofiles_rank)).
query(true_val(overall_rating_snowboardingprofiles_rank, rank_15_of_28)).
query(true_val(overall_rating_snowboardingprofiles_rank, unk_overall_rating_snowboardingprofiles_rank)).

0.88::acc(s26, jumps_rating_tgr).

% @attr jumps_rating_tgr
% @type numeric
% @unit /5
% @canonical true
% @original_name jumps_rating_tgr
% @values v3_5=3.5 unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.74::true_val(jumps_rating_tgr, v3_5); 0.26::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s26, jumps_rating_tgr, v3_5).

all_consistent(jumps_rating_tgr) :- consistent(s26, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, v3_5)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

0.88::acc(s26, jibbing_rating_tgr).

% @attr jibbing_rating_tgr
% @type numeric
% @unit /5
% @canonical true
% @original_name jibbing_rating_tgr
% @values v4_5=4.5 unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.74::true_val(jibbing_rating_tgr, v4_5); 0.26::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s26, jibbing_rating_tgr, v4_5).

all_consistent(jibbing_rating_tgr) :- consistent(s26, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, v4_5)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

0.88::acc(s26, spins_rating).

% @attr spins_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Spins rating
% @values v4=4.0 unk_spins_rating=Unknown
% @importance 0.95

0.74::true_val(spins_rating, v4); 0.26::true_val(spins_rating, unk_spins_rating).

measured(s26, spins_rating, v4).

all_consistent(spins_rating) :- consistent(s26, spins_rating).

evidence(all_consistent(spins_rating)).
query(true_val(spins_rating, v4)).
query(true_val(spins_rating, unk_spins_rating)).

0.88::acc(s26, switch_riding).

% @attr switch_riding
% @type numeric
% @unit /5
% @canonical true
% @original_name switch_riding
% @values v4_5=4.5 unk_switch_riding=Unknown
% @importance 0.95

0.74::true_val(switch_riding, v4_5); 0.26::true_val(switch_riding, unk_switch_riding).

measured(s26, switch_riding, v4_5).

all_consistent(switch_riding) :- consistent(s26, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, v4_5)).
query(true_val(switch_riding, unk_switch_riding)).

0.88::acc(s26, butters_rating).

% @attr butters_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Butters rating
% @values v4_5=4.5 unk_butters_rating=Unknown
% @importance 0.95

0.74::true_val(butters_rating, v4_5); 0.26::true_val(butters_rating, unk_butters_rating).

measured(s26, butters_rating, v4_5).

all_consistent(butters_rating) :- consistent(s26, butters_rating).

evidence(all_consistent(butters_rating)).
query(true_val(butters_rating, v4_5)).
query(true_val(butters_rating, unk_butters_rating)).

0.88::acc(s26, uneven_terrain_rating).

% @attr uneven_terrain_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Uneven terrain rating
% @values v3_5=3.5 unk_uneven_terrain_rating=Unknown
% @importance 0.95

0.74::true_val(uneven_terrain_rating, v3_5); 0.26::true_val(uneven_terrain_rating, unk_uneven_terrain_rating).

measured(s26, uneven_terrain_rating, v3_5).

all_consistent(uneven_terrain_rating) :- consistent(s26, uneven_terrain_rating).

evidence(all_consistent(uneven_terrain_rating)).
query(true_val(uneven_terrain_rating, v3_5)).
query(true_val(uneven_terrain_rating, unk_uneven_terrain_rating)).

0.88::acc(s26, powder_score_snowboardingprofiles).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v2_5=2.5 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.95

0.74::true_val(powder_score_snowboardingprofiles, v2_5); 0.26::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s26, powder_score_snowboardingprofiles, v2_5).

all_consistent(powder_score_snowboardingprofiles) :- consistent(s26, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v2_5)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

0.88::acc(s26, speed_rating_tgr).

% @attr speed_rating_tgr
% @type numeric
% @unit /5
% @canonical true
% @original_name speed_rating_tgr
% @values v2_5=2.5 unk_speed_rating_tgr=Unknown
% @importance 0.95

0.74::true_val(speed_rating_tgr, v2_5); 0.26::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s26, speed_rating_tgr, v2_5).

all_consistent(speed_rating_tgr) :- consistent(s26, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, v2_5)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

0.88::acc(s26, carving_score_snowboardingprofiles).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v2_5=2.5 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.95

0.74::true_val(carving_score_snowboardingprofiles, v2_5); 0.26::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s26, carving_score_snowboardingprofiles, v2_5).

all_consistent(carving_score_snowboardingprofiles) :- consistent(s26, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v2_5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

0.88::acc(s26, turn_initiation_performance).

% @attr turn_initiation_performance
% @type numeric
% @unit /5
% @canonical true
% @original_name turn_initiation_performance
% @values v4_5=4.5 unk_turn_initiation_performance=Unknown
% @importance 0.95

0.74::true_val(turn_initiation_performance, v4_5); 0.26::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s26, turn_initiation_performance, v4_5).

all_consistent(turn_initiation_performance) :- consistent(s26, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, v4_5)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

0.88::acc(s26, chatter_performance).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values chattery_4_10=Chattery_4_out_of_10_dampness unk_chatter_performance=Unknown
% @importance 0.95

0.74::true_val(chatter_performance, chattery_4_10); 0.26::true_val(chatter_performance, unk_chatter_performance).

measured(s26, chatter_performance, chattery_4_10).

all_consistent(chatter_performance) :- consistent(s26, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, chattery_4_10)).
query(true_val(chatter_performance, unk_chatter_performance)).

0.88::acc(s26, smooth_snappy).

% @attr smooth_snappy
% @type numeric
% @unit /10
% @canonical false
% @original_name Smooth/Snappy
% @values v6=6.0 unk_smooth_snappy=Unknown
% @importance 0.95

0.74::true_val(smooth_snappy, v6); 0.26::true_val(smooth_snappy, unk_smooth_snappy).

measured(s26, smooth_snappy, v6).

all_consistent(smooth_snappy) :- consistent(s26, smooth_snappy).

evidence(all_consistent(smooth_snappy)).
query(true_val(smooth_snappy, v6)).
query(true_val(smooth_snappy, unk_smooth_snappy)).

0.88::acc(s26, playful_aggressive).

% @attr playful_aggressive
% @type numeric
% @unit /10
% @canonical false
% @original_name Playful/Aggressive
% @values v3=3.0 unk_playful_aggressive=Unknown
% @importance 0.95

0.74::true_val(playful_aggressive, v3); 0.26::true_val(playful_aggressive, unk_playful_aggressive).

measured(s26, playful_aggressive, v3).

all_consistent(playful_aggressive) :- consistent(s26, playful_aggressive).

evidence(all_consistent(playful_aggressive)).
query(true_val(playful_aggressive, v3)).
query(true_val(playful_aggressive, unk_playful_aggressive)).

0.88::acc(s26, edge_hold).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values good_magne_traction=Good_helped_by_Magne_Traction unk_edge_hold=Unknown
% @importance 0.95

0.74::true_val(edge_hold, good_magne_traction); 0.26::true_val(edge_hold, unk_edge_hold).

measured(s26, edge_hold, good_magne_traction).

all_consistent(edge_hold) :- consistent(s26, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good_magne_traction)).
query(true_val(edge_hold, unk_edge_hold)).

0.88::acc(s26, catch_free).

% @attr catch_free
% @type categorical
% @canonical false
% @original_name Catch-free
% @values very_low_catch_risk=Very_close_to_catchless unk_catch_free=Unknown
% @importance 0.95

0.74::true_val(catch_free, very_low_catch_risk); 0.26::true_val(catch_free, unk_catch_free).

measured(s26, catch_free, very_low_catch_risk).

all_consistent(catch_free) :- consistent(s26, catch_free).

evidence(all_consistent(catch_free)).
query(true_val(catch_free, very_low_catch_risk)).
query(true_val(catch_free, unk_catch_free)).

0.88::acc(s26, positive_aspect_jib).

% @attr positive_aspect_jib
% @type categorical
% @canonical false
% @original_name positive_aspect (born to jib)
% @values born_to_jib=Born_to_jib_confidence_building_easy_pop unk_positive_aspect_jib=Unknown
% @importance 0.95

0.74::true_val(positive_aspect_jib, born_to_jib); 0.26::true_val(positive_aspect_jib, unk_positive_aspect_jib).

measured(s26, positive_aspect_jib, born_to_jib).

all_consistent(positive_aspect_jib) :- consistent(s26, positive_aspect_jib).

evidence(all_consistent(positive_aspect_jib)).
query(true_val(positive_aspect_jib, born_to_jib)).
query(true_val(positive_aspect_jib, unk_positive_aspect_jib)).

0.88::acc(s26, positive_aspect_press).

% @attr positive_aspect_press
% @type categorical
% @canonical false
% @original_name positive_aspect (press)
% @values super_easy_press=Super_easy_to_press_nose_and_tail unk_positive_aspect_press=Unknown
% @importance 0.95

0.74::true_val(positive_aspect_press, super_easy_press); 0.26::true_val(positive_aspect_press, unk_positive_aspect_press).

measured(s26, positive_aspect_press, super_easy_press).

all_consistent(positive_aspect_press) :- consistent(s26, positive_aspect_press).

evidence(all_consistent(positive_aspect_press)).
query(true_val(positive_aspect_press, super_easy_press)).
query(true_val(positive_aspect_press, unk_positive_aspect_press)).

0.65::acc(s29, positive_aspect_forgiving).

% @attr positive_aspect_forgiving
% @type categorical
% @canonical false
% @original_name positive_aspect (forgiving)
% @values extremely_forgiving=Extremely_forgiving_when_turning unk_positive_aspect_forgiving=Unknown
% @importance 0.65

0.43::true_val(positive_aspect_forgiving, extremely_forgiving); 0.57::true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving).

measured(s29, positive_aspect_forgiving, extremely_forgiving).

all_consistent(positive_aspect_forgiving) :- consistent(s29, positive_aspect_forgiving).

evidence(all_consistent(positive_aspect_forgiving)).
query(true_val(positive_aspect_forgiving, extremely_forgiving)).
query(true_val(positive_aspect_forgiving, unk_positive_aspect_forgiving)).

0.88::acc(s26, positive_aspect_beginner).

% @attr positive_aspect_beginner
% @type categorical
% @canonical false
% @original_name positive_aspect (beginner friendly)
% @values well_suited_beginners=Well_suited_to_beginners unk_positive_aspect_beginner=Unknown
% @importance 0.95

0.74::true_val(positive_aspect_beginner, well_suited_beginners); 0.26::true_val(positive_aspect_beginner, unk_positive_aspect_beginner).

measured(s26, positive_aspect_beginner, well_suited_beginners).

all_consistent(positive_aspect_beginner) :- consistent(s26, positive_aspect_beginner).

evidence(all_consistent(positive_aspect_beginner)).
query(true_val(positive_aspect_beginner, well_suited_beginners)).
query(true_val(positive_aspect_beginner, unk_positive_aspect_beginner)).

0.88::acc(s26, positive_aspect).
0.82::acc(s27, positive_aspect).
0.78::acc(s32, positive_aspect).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values super_fun=Consistently_described_as_super_fun unk_positive_aspect=Unknown
% @importance 0.92

0.95::true_val(positive_aspect, super_fun); 0.05::true_val(positive_aspect, unk_positive_aspect).

measured(s26, positive_aspect, super_fun).
measured(s27, positive_aspect, super_fun).
measured(s32, positive_aspect, super_fun).

all_consistent(positive_aspect) :-
    consistent(s26, positive_aspect),
    consistent(s27, positive_aspect),
    consistent(s32, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, super_fun)).
query(true_val(positive_aspect, unk_positive_aspect)).

0.80::acc(s33, positive_aspect_powder_float).

% @attr positive_aspect_powder_float
% @type categorical
% @canonical false
% @original_name positive_aspect (powder float)
% @values rocker_powder_float=Rocker_helps_float_naturally_in_powder unk_positive_aspect_powder_float=Unknown
% @importance 0.70

0.60::true_val(positive_aspect_powder_float, rocker_powder_float); 0.40::true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float).

measured(s33, positive_aspect_powder_float, rocker_powder_float).

all_consistent(positive_aspect_powder_float) :- consistent(s33, positive_aspect_powder_float).

evidence(all_consistent(positive_aspect_powder_float)).
query(true_val(positive_aspect_powder_float, rocker_powder_float)).
query(true_val(positive_aspect_powder_float, unk_positive_aspect_powder_float)).

0.55::acc(s34, user_review_forum).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values loyal_12_plus_years=Users_report_12_plus_years_returning unk_user_review_forum=Unknown
% @importance 0.60

0.37::true_val(user_review_forum, loyal_12_plus_years); 0.63::true_val(user_review_forum, unk_user_review_forum).

measured(s34, user_review_forum, loyal_12_plus_years).

all_consistent(user_review_forum) :-
    (indep(s8), consistent(s34, user_review_forum) ; \+indep(s8)).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, loyal_12_plus_years)).
query(true_val(user_review_forum, unk_user_review_forum)).

0.42::acc(s35, user_review_forum_quora).

% @attr user_review_forum_quora
% @type categorical
% @canonical false
% @original_name user_review_forum (Quora durability)
% @values seven_year_single_board=Rode_same_board_7_years unk_user_review_forum_quora=Unknown
% @importance 0.65

0.25::true_val(user_review_forum_quora, seven_year_single_board); 0.75::true_val(user_review_forum_quora, unk_user_review_forum_quora).

measured(s35, user_review_forum_quora, seven_year_single_board).

all_consistent(user_review_forum_quora) :- consistent(s35, user_review_forum_quora).

evidence(all_consistent(user_review_forum_quora)).
query(true_val(user_review_forum_quora, seven_year_single_board)).
query(true_val(user_review_forum_quora, unk_user_review_forum_quora)).

0.88::acc(s26, negative_aspect).
0.82::acc(s27, negative_aspect).
0.82::acc(s36, negative_aspect).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_stable_at_speed=Not_stable_at_speed_chatter_starts_quickly unk_negative_aspect=Unknown
% @importance 0.92

0.95::true_val(negative_aspect, not_stable_at_speed); 0.05::true_val(negative_aspect, unk_negative_aspect).

measured(s26, negative_aspect, not_stable_at_speed).
measured(s27, negative_aspect, not_stable_at_speed).
measured(s36, negative_aspect, not_stable_at_speed).

all_consistent(negative_aspect) :-
    consistent(s26, negative_aspect),
    consistent(s27, negative_aspect),
    consistent(s36, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_stable_at_speed)).
query(true_val(negative_aspect, unk_negative_aspect)).

0.88::acc(s26, negative_aspect_washy_carving).

% @attr negative_aspect_washy_carving
% @type categorical
% @canonical false
% @original_name negative_aspect (washy carving)
% @values loose_washy_carving=Pretty_loose_and_washy_when_carving unk_negative_aspect_washy_carving=Unknown
% @importance 0.95

0.74::true_val(negative_aspect_washy_carving, loose_washy_carving); 0.26::true_val(negative_aspect_washy_carving, unk_negative_aspect_washy_carving).

measured(s26, negative_aspect_washy_carving, loose_washy_carving).

all_consistent(negative_aspect_washy_carving) :- consistent(s26, negative_aspect_washy_carving).

evidence(all_consistent(negative_aspect_washy_carving)).
query(true_val(negative_aspect_washy_carving, loose_washy_carving)).
query(true_val(negative_aspect_washy_carving, unk_negative_aspect_washy_carving)).

0.88::acc(s26, negative_aspect_landing_air).

% @attr negative_aspect_landing_air
% @type categorical
% @canonical false
% @original_name negative_aspect (landing from air)
% @values washy_landing_bigger_air=Washy_unstable_landing_from_bigger_air unk_negative_aspect_landing_air=Unknown
% @importance 0.95

0.74::true_val(negative_aspect_landing_air, washy_landing_bigger_air); 0.26::true_val(negative_aspect_landing_air, unk_negative_aspect_landing_air).

measured(s26, negative_aspect_landing_air, washy_landing_bigger_air).

all_consistent(negative_aspect_landing_air) :- consistent(s26, negative_aspect_landing_air).

evidence(all_consistent(negative_aspect_landing_air)).
query(true_val(negative_aspect_landing_air, washy_landing_bigger_air)).
query(true_val(negative_aspect_landing_air, unk_negative_aspect_landing_air)).

0.88::acc(s26, negative_aspect_overspin).

% @attr negative_aspect_overspin
% @type categorical
% @canonical false
% @original_name negative_aspect (overspin)
% @values overspins=Overspins_quite_a_bit unk_negative_aspect_overspin=Unknown
% @importance 0.95

0.74::true_val(negative_aspect_overspin, overspins); 0.26::true_val(negative_aspect_overspin, unk_negative_aspect_overspin).

measured(s26, negative_aspect_overspin, overspins).

all_consistent(negative_aspect_overspin) :- consistent(s26, negative_aspect_overspin).

evidence(all_consistent(negative_aspect_overspin)).
query(true_val(negative_aspect_overspin, overspins)).
query(true_val(negative_aspect_overspin, unk_negative_aspect_overspin)).

0.88::acc(s26, negative_aspect_choppy).

% @attr negative_aspect_choppy
% @type categorical
% @canonical false
% @original_name negative_aspect (choppy snow)
% @values bucked_in_choppy=Gets_bucked_around_in_choppy_snow unk_negative_aspect_choppy=Unknown
% @importance 0.95

0.74::true_val(negative_aspect_choppy, bucked_in_choppy); 0.26::true_val(negative_aspect_choppy, unk_negative_aspect_choppy).

measured(s26, negative_aspect_choppy, bucked_in_choppy).

all_consistent(negative_aspect_choppy) :- consistent(s26, negative_aspect_choppy).

evidence(all_consistent(negative_aspect_choppy)).
query(true_val(negative_aspect_choppy, bucked_in_choppy)).
query(true_val(negative_aspect_choppy, unk_negative_aspect_choppy)).

0.88::acc(s26, negative_aspect_deep_powder).

% @attr negative_aspect_deep_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (deep powder)
% @values not_great_deep_powder=Not_great_in_deep_powder_centered_twin unk_negative_aspect_deep_powder=Unknown
% @importance 0.95

0.74::true_val(negative_aspect_deep_powder, not_great_deep_powder); 0.26::true_val(negative_aspect_deep_powder, unk_negative_aspect_deep_powder).

measured(s26, negative_aspect_deep_powder, not_great_deep_powder).

all_consistent(negative_aspect_deep_powder) :- consistent(s26, negative_aspect_deep_powder).

evidence(all_consistent(negative_aspect_deep_powder)).
query(true_val(negative_aspect_deep_powder, not_great_deep_powder)).
query(true_val(negative_aspect_deep_powder, unk_negative_aspect_deep_powder)).

0.88::acc(s26, negative_aspect_one_foot).

% @attr negative_aspect_one_foot
% @type categorical
% @canonical false
% @original_name negative_aspect (one-footing)
% @values challenging_one_foot=Loose_feel_challenging_one_footing unk_negative_aspect_one_foot=Unknown
% @importance 0.95

0.74::true_val(negative_aspect_one_foot, challenging_one_foot); 0.26::true_val(negative_aspect_one_foot, unk_negative_aspect_one_foot).

measured(s26, negative_aspect_one_foot, challenging_one_foot).

all_consistent(negative_aspect_one_foot) :- consistent(s26, negative_aspect_one_foot).

evidence(all_consistent(negative_aspect_one_foot)).
query(true_val(negative_aspect_one_foot, challenging_one_foot)).
query(true_val(negative_aspect_one_foot, unk_negative_aspect_one_foot)).

0.82::acc(s27, negative_aspect_flat_base).

% @attr negative_aspect_flat_base
% @type categorical
% @canonical false
% @original_name negative_aspect (flat basing)
% @values not_for_flat_basing=Not_for_flat_basing_loose_truck_feel unk_negative_aspect_flat_base=Unknown
% @importance 0.85

0.66::true_val(negative_aspect_flat_base, not_for_flat_basing); 0.34::true_val(negative_aspect_flat_base, unk_negative_aspect_flat_base).

measured(s27, negative_aspect_flat_base, not_for_flat_basing).

all_consistent(negative_aspect_flat_base) :- consistent(s27, negative_aspect_flat_base).

evidence(all_consistent(negative_aspect_flat_base)).
query(true_val(negative_aspect_flat_base, not_for_flat_basing)).
query(true_val(negative_aspect_flat_base, unk_negative_aspect_flat_base)).

0.45::acc(s37, user_review_forum_outgrown).

% @attr user_review_forum_outgrown
% @type categorical
% @canonical false
% @original_name user_review_forum (outgrown)
% @values outgrown_quickly=Some_report_outgrowing_board_quickly unk_user_review_forum_outgrown=Unknown
% @importance 0.70

0.27::true_val(user_review_forum_outgrown, outgrown_quickly); 0.73::true_val(user_review_forum_outgrown, unk_user_review_forum_outgrown).

measured(s37, user_review_forum_outgrown, outgrown_quickly).

all_consistent(user_review_forum_outgrown) :- consistent(s37, user_review_forum_outgrown).

evidence(all_consistent(user_review_forum_outgrown)).
query(true_val(user_review_forum_outgrown, outgrown_quickly)).
query(true_val(user_review_forum_outgrown, unk_user_review_forum_outgrown)).

0.82::acc(s27, reviewer_opinion_the_good_ride_carving).

% @attr reviewer_opinion_the_good_ride_carving
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (carving)
% @values waste_on_carve_washy=Waste_on_a_carve_pretty_washy unk_reviewer_opinion_the_good_ride_carving=Unknown
% @importance 0.85

0.66::true_val(reviewer_opinion_the_good_ride_carving, waste_on_carve_washy); 0.34::true_val(reviewer_opinion_the_good_ride_carving, unk_reviewer_opinion_the_good_ride_carving).

measured(s27, reviewer_opinion_the_good_ride_carving, waste_on_carve_washy).

all_consistent(reviewer_opinion_the_good_ride_carving) :- consistent(s27, reviewer_opinion_the_good_ride_carving).

evidence(all_consistent(reviewer_opinion_the_good_ride_carving)).
query(true_val(reviewer_opinion_the_good_ride_carving, waste_on_carve_washy)).
query(true_val(reviewer_opinion_the_good_ride_carving, unk_reviewer_opinion_the_good_ride_carving)).

0.82::acc(s8, warranty_period_years).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v1=1.0 unk_warranty_period_years=Unknown
% @importance 0.85

0.72::true_val(warranty_period_years, v1); 0.28::true_val(warranty_period_years, unk_warranty_period_years).

measured(s8, warranty_period_years, v1).

all_consistent(warranty_period_years) :-
    (indep(s8), consistent(s8, warranty_period_years) ; \+indep(s8)).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

0.82::acc(s8, warranty).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values structural_defects_only=Structural_defects_only_no_impact_abuse unk_warranty=Unknown
% @importance 0.85

0.72::true_val(warranty, structural_defects_only); 0.28::true_val(warranty, unk_warranty).

measured(s8, warranty, structural_defects_only).

all_consistent(warranty) :-
    (indep(s8), consistent(s8, warranty) ; \+indep(s8)).

evidence(all_consistent(warranty)).
query(true_val(warranty, structural_defects_only)).
query(true_val(warranty, unk_warranty)).

0.70::acc(s19, comparable_board_cross_brand).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values capita_doa=CAPiTA_DOA_more_aggressive_hybrid_camber unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.60::true_val(comparable_board_cross_brand, capita_doa); 0.40::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s19, comparable_board_cross_brand, capita_doa).

all_consistent(comparable_board_cross_brand) :- consistent(s19, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, capita_doa)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

0.60::acc(s38, comparable_board_cross_brand_burton_process).

% @attr comparable_board_cross_brand_burton_process
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Process)
% @values burton_process=Burton_Process_balanced_twin_camber unk_comparable_board_cross_brand_burton_process=Unknown
% @importance 0.75

0.40::true_val(comparable_board_cross_brand_burton_process, burton_process); 0.60::true_val(comparable_board_cross_brand_burton_process, unk_comparable_board_cross_brand_burton_process).

measured(s38, comparable_board_cross_brand_burton_process, burton_process).

all_consistent(comparable_board_cross_brand_burton_process) :- consistent(s38, comparable_board_cross_brand_burton_process).

evidence(all_consistent(comparable_board_cross_brand_burton_process)).
query(true_val(comparable_board_cross_brand_burton_process, burton_process)).
query(true_val(comparable_board_cross_brand_burton_process, unk_comparable_board_cross_brand_burton_process)).

0.75::acc(s39, comparable_board_cross_brand_burton_cfv).

% @attr comparable_board_cross_brand_burton_cfv
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Custom Flying V)
% @values burton_custom_fv=Burton_Custom_Flying_V_rocker_dominant unk_comparable_board_cross_brand_burton_cfv=Unknown
% @importance 0.75

0.59::true_val(comparable_board_cross_brand_burton_cfv, burton_custom_fv); 0.41::true_val(comparable_board_cross_brand_burton_cfv, unk_comparable_board_cross_brand_burton_cfv).

measured(s39, comparable_board_cross_brand_burton_cfv, burton_custom_fv).

all_consistent(comparable_board_cross_brand_burton_cfv) :- consistent(s39, comparable_board_cross_brand_burton_cfv).

evidence(all_consistent(comparable_board_cross_brand_burton_cfv)).
query(true_val(comparable_board_cross_brand_burton_cfv, burton_custom_fv)).
query(true_val(comparable_board_cross_brand_burton_cfv, unk_comparable_board_cross_brand_burton_cfv)).

0.70::acc(s19, comparable_board_cross_brand_jones).

% @attr comparable_board_cross_brand_jones
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mountain Twin)
% @values jones_mountain_twin=Jones_Mountain_Twin_camber_serrated_edges unk_comparable_board_cross_brand_jones=Unknown
% @importance 0.85

0.60::true_val(comparable_board_cross_brand_jones, jones_mountain_twin); 0.40::true_val(comparable_board_cross_brand_jones, unk_comparable_board_cross_brand_jones).

measured(s19, comparable_board_cross_brand_jones, jones_mountain_twin).

all_consistent(comparable_board_cross_brand_jones) :- consistent(s19, comparable_board_cross_brand_jones).

evidence(all_consistent(comparable_board_cross_brand_jones)).
query(true_val(comparable_board_cross_brand_jones, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand_jones, unk_comparable_board_cross_brand_jones)).

0.70::acc(s19, comparable_board_cross_brand_never_summer).

% @attr comparable_board_cross_brand_never_summer
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Never Summer Proto Type 3)
% @values ns_proto_type_3=Never_Summer_Proto_Type_3 unk_comparable_board_cross_brand_never_summer=Unknown
% @importance 0.85

0.60::true_val(comparable_board_cross_brand_never_summer, ns_proto_type_3); 0.40::true_val(comparable_board_cross_brand_never_summer, unk_comparable_board_cross_brand_never_summer).

measured(s19, comparable_board_cross_brand_never_summer, ns_proto_type_3).

all_consistent(comparable_board_cross_brand_never_summer) :- consistent(s19, comparable_board_cross_brand_never_summer).

evidence(all_consistent(comparable_board_cross_brand_never_summer)).
query(true_val(comparable_board_cross_brand_never_summer, ns_proto_type_3)).
query(true_val(comparable_board_cross_brand_never_summer, unk_comparable_board_cross_brand_never_summer)).

0.80::acc(s27, comparable_board_same_brand).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values lib_tech_box_scratcher=Lib_Tech_Box_Scratcher unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.66::true_val(comparable_board_same_brand, lib_tech_box_scratcher); 0.34::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s27, comparable_board_same_brand, lib_tech_box_scratcher).

all_consistent(comparable_board_same_brand) :- consistent(s27, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, lib_tech_box_scratcher)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

0.78::acc(s40, comparable_board_same_brand_gnu).

% @attr comparable_board_same_brand_gnu
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Gnu Riders Choice)
% @values gnu_riders_choice=Gnu_Riders_Choice_stiffer_more_poppy unk_comparable_board_same_brand_gnu=Unknown
% @importance 0.60

0.56::true_val(comparable_board_same_brand_gnu, gnu_riders_choice); 0.44::true_val(comparable_board_same_brand_gnu, unk_comparable_board_same_brand_gnu).

measured(s40, comparable_board_same_brand_gnu, gnu_riders_choice).

all_consistent(comparable_board_same_brand_gnu) :- consistent(s40, comparable_board_same_brand_gnu).

evidence(all_consistent(comparable_board_same_brand_gnu)).
query(true_val(comparable_board_same_brand_gnu, gnu_riders_choice)).
query(true_val(comparable_board_same_brand_gnu, unk_comparable_board_same_brand_gnu)).

0.72::acc(s19, competitor_category_positioning).
0.60::acc(s38, competitor_category_positioning).

% @attr competitor_category_positioning
% @type categorical
% @canonical false
% @original_name Competitor category positioning
% @values more_jib_butter_oriented=More_jib_butter_oriented_than_most_competitors unk_competitor_category_positioning=Unknown
% @importance 0.80

0.95::true_val(competitor_category_positioning, more_jib_butter_oriented); 0.05::true_val(competitor_category_positioning, unk_competitor_category_positioning).

measured(s19, competitor_category_positioning, more_jib_butter_oriented).
measured(s38, competitor_category_positioning, more_jib_butter_oriented).

all_consistent(competitor_category_positioning) :-
    consistent(s19, competitor_category_positioning),
    consistent(s38, competitor_category_positioning).

evidence(all_consistent(competitor_category_positioning)).
query(true_val(competitor_category_positioning, more_jib_butter_oriented)).
query(true_val(competitor_category_positioning, unk_competitor_category_positioning)).

0.68::acc(s15, laminate_merchant).

% @attr laminate_merchant
% @type categorical
% @canonical false
% @original_name laminate (merchant description)
% @values smooth_ride_low_weight=Smooth_ride_while_keeping_weight_low unk_laminate_merchant=Unknown
% @importance 0.85

0.48::true_val(laminate_merchant, smooth_ride_low_weight); 0.52::true_val(laminate_merchant, unk_laminate_merchant).

measured(s15, laminate_merchant, smooth_ride_low_weight).

all_consistent(laminate_merchant) :-
    (indep(s15), consistent(s15, laminate_merchant) ; \+indep(s15)).

evidence(all_consistent(laminate_merchant)).
query(true_val(laminate_merchant, smooth_ride_low_weight)).
query(true_val(laminate_merchant, unk_laminate_merchant)).

0.78::acc(s32, construction_material_innovation).

% @attr construction_material_innovation
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values no_carbon=No_carbon_stringers_or_layers_basic_construction unk_construction_material_innovation=Unknown
% @importance 0.65

0.62::true_val(construction_material_innovation, no_carbon); 0.38::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s32, construction_material_innovation, no_carbon).

all_consistent(construction_material_innovation) :- consistent(s32, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, no_carbon)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

0.88::acc(s9, sustainability_certification_hydroelectric).

% @attr sustainability_certification_hydroelectric
% @type categorical
% @canonical false
% @original_name sustainability_certification (hydroelectric)
% @values hydro_89_6_pct=Washington_State_89_6pct_hydroelectric unk_sustainability_certification_hydroelectric=Unknown
% @importance 0.55

0.82::true_val(sustainability_certification_hydroelectric, hydro_89_6_pct); 0.18::true_val(sustainability_certification_hydroelectric, unk_sustainability_certification_hydroelectric).

measured(s9, sustainability_certification_hydroelectric, hydro_89_6_pct).

all_consistent(sustainability_certification_hydroelectric) :- consistent(s9, sustainability_certification_hydroelectric).

evidence(all_consistent(sustainability_certification_hydroelectric)).
query(true_val(sustainability_certification_hydroelectric, hydro_89_6_pct)).
query(true_val(sustainability_certification_hydroelectric, unk_sustainability_certification_hydroelectric)).

0.88::acc(s9, sustainability_certification_biodiesel).

% @attr sustainability_certification_biodiesel
% @type categorical
% @canonical false
% @original_name sustainability_certification (biodiesel)
% @values renewable_biodiesel=Renewable_based_biodiesel_heating unk_sustainability_certification_biodiesel=Unknown
% @importance 0.55

0.82::true_val(sustainability_certification_biodiesel, renewable_biodiesel); 0.18::true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel).

measured(s9, sustainability_certification_biodiesel, renewable_biodiesel).

all_consistent(sustainability_certification_biodiesel) :- consistent(s9, sustainability_certification_biodiesel).

evidence(all_consistent(sustainability_certification_biodiesel)).
query(true_val(sustainability_certification_biodiesel, renewable_biodiesel)).
query(true_val(sustainability_certification_biodiesel, unk_sustainability_certification_biodiesel)).

0.88::acc(s9, sustainability_certification_wood_shop).

% @attr sustainability_certification_wood_shop
% @type categorical
% @canonical false
% @original_name sustainability_certification (wood shop)
% @values onsite_wood_shop=Onsite_wood_shop_finger_joining_scrap_repurposed unk_sustainability_certification_wood_shop=Unknown
% @importance 0.55

0.82::true_val(sustainability_certification_wood_shop, onsite_wood_shop); 0.18::true_val(sustainability_certification_wood_shop, unk_sustainability_certification_wood_shop).

measured(s9, sustainability_certification_wood_shop, onsite_wood_shop).

all_consistent(sustainability_certification_wood_shop) :- consistent(s9, sustainability_certification_wood_shop).

evidence(all_consistent(sustainability_certification_wood_shop)).
query(true_val(sustainability_certification_wood_shop, onsite_wood_shop)).
query(true_val(sustainability_certification_wood_shop, unk_sustainability_certification_wood_shop)).

0.78::acc(s31, sustainability_certification_recyclable_poly).

% @attr sustainability_certification_recyclable_poly
% @type categorical
% @canonical false
% @original_name sustainability_certification (recyclable polyethylene)
% @values replaced_abs_1986=Replaced_toxic_ABS_with_recyclable_polyethylene_1986 unk_sustainability_certification_recyclable_poly=Unknown
% @importance 0.40

0.62::true_val(sustainability_certification_recyclable_poly, replaced_abs_1986); 0.38::true_val(sustainability_certification_recyclable_poly, unk_sustainability_certification_recyclable_poly).

measured(s31, sustainability_certification_recyclable_poly, replaced_abs_1986).

all_consistent(sustainability_certification_recyclable_poly) :- consistent(s31, sustainability_certification_recyclable_poly).

evidence(all_consistent(sustainability_certification_recyclable_poly)).
query(true_val(sustainability_certification_recyclable_poly, replaced_abs_1986)).
query(true_val(sustainability_certification_recyclable_poly, unk_sustainability_certification_recyclable_poly)).

0.82::acc(s30, sustainability_certification_eco_sublimation).

% @attr sustainability_certification_eco_sublimation
% @type categorical
% @canonical false
% @original_name sustainability_certification (eco-sublimation)
% @values eco_sublimation=Eco_sublimation_process_for_topsheet_graphics unk_sustainability_certification_eco_sublimation=Unknown
% @importance 0.70

0.72::true_val(sustainability_certification_eco_sublimation, eco_sublimation); 0.28::true_val(sustainability_certification_eco_sublimation, unk_sustainability_certification_eco_sublimation).

measured(s30, sustainability_certification_eco_sublimation, eco_sublimation).

all_consistent(sustainability_certification_eco_sublimation) :-
    (indep(s30), consistent(s30, sustainability_certification_eco_sublimation) ; \+indep(s30)).

evidence(all_consistent(sustainability_certification_eco_sublimation)).
query(true_val(sustainability_certification_eco_sublimation, eco_sublimation)).
query(true_val(sustainability_certification_eco_sublimation, unk_sustainability_certification_eco_sublimation)).