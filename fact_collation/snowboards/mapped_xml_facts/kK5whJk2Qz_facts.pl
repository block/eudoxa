0.15::indep(smerchant).
0.15::indep(s2).
0.15::indep(s25).
0.15::indep(s3).
0.20::indep(s4).
0.15::indep(s15).
0.25::indep(s16).
0.20::indep(s20).
0.15::indep(s23).
0.15::indep(s24).
0.15::indep(s30).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values k2=K2 unk_brand=Unknown
% @importance 0.90

0.93::acc(s1, brand).
0.70::acc(s2, brand).

0.95::true_val(brand, k2); 0.05::true_val(brand, unk_brand).

measured(s1, brand, k2).
measured(s2, brand, k2).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, k2)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values excavator=Excavator unk_model_name=Unknown
% @importance 0.90

0.93::acc(s1, model_name).
0.70::acc(s2, model_name).

0.95::true_val(model_name, excavator); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, excavator).
measured(s2, model_name, excavator).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, excavator)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2027=2027
% @importance 0.85

0.72::acc(s3, model_year).
0.72::acc(s4, model_year).

0.95::true_val(model_year, v2027); 0.05::true_val(model_year, unk_model_year).

measured(s3, model_year, v2027).
measured(s4, model_year, v2027).

all_consistent(model_year) :-
    (indep(s3), consistent(s3, model_year) ; \+indep(s3)),
    (indep(s4), consistent(s4, model_year) ; \+indep(s4)).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values k2_sports_llc_seattle=K2_Sports_LLC_Seattle_WA unk_manufacturer=Unknown
% @importance 0.70

0.80::acc(s5, manufacturer).

0.76::true_val(manufacturer, k2_sports_llc_seattle); 0.24::true_val(manufacturer, unk_manufacturer).

measured(s5, manufacturer, k2_sports_llc_seattle).

all_consistent(manufacturer) :-
    consistent(s5, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, k2_sports_llc_seattle)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values elevate_outdoor_kohlberg=Elevate_Outdoor_Collective_Kohlberg unk_parent_company=Unknown
% @importance 0.35

0.80::acc(s6, parent_company).
0.60::acc(s7, parent_company).

0.95::true_val(parent_company, elevate_outdoor_kohlberg); 0.05::true_val(parent_company, unk_parent_company).

measured(s6, parent_company, elevate_outdoor_kohlberg).
measured(s7, parent_company, elevate_outdoor_kohlberg).

all_consistent(parent_company) :-
    consistent(s6, parent_company),
    consistent(s7, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, elevate_outdoor_kohlberg)).
query(true_val(parent_company, unk_parent_company)).

% @attr company_founding_year
% @type numeric
% @canonical false
% @original_name Company founding year
% @values v1962=1962 unk_company_founding_year=Unknown
% @importance 0.70

0.82::acc(s5, company_founding_year).

0.76::true_val(company_founding_year, v1962); 0.24::true_val(company_founding_year, unk_company_founding_year).

measured(s5, company_founding_year, v1962).

all_consistent(company_founding_year) :-
    consistent(s5, company_founding_year).

evidence(all_consistent(company_founding_year)).
query(true_val(company_founding_year, v1962)).
query(true_val(company_founding_year, unk_company_founding_year)).

% @attr k2_snowboard_division_started
% @type numeric
% @canonical false
% @original_name K2 snowboard division started
% @values v1987=1987 v1988=1988
% @importance 0.43

0.90::acc(s8, k2_snowboard_division_started).
0.80::acc(s9, k2_snowboard_division_started).

0.55::true_val(k2_snowboard_division_started, v1987); 0.45::true_val(k2_snowboard_division_started, v1988).

measured(s8, k2_snowboard_division_started, v1987).
measured(s9, k2_snowboard_division_started, v1988).

all_consistent(k2_snowboard_division_started) :-
    consistent(s8, k2_snowboard_division_started),
    consistent(s9, k2_snowboard_division_started).

evidence(all_consistent(k2_snowboard_division_started)).
query(true_val(k2_snowboard_division_started, v1987)).
query(true_val(k2_snowboard_division_started, v1988)).

% @attr designed_by
% @type categorical
% @canonical false
% @original_name Designed by
% @values k2_snowboarding_seattle=K2_Snowboarding_Seattle_WA unk_designed_by=Unknown
% @importance 0.70

0.82::acc(s10, designed_by).

0.71::true_val(designed_by, k2_snowboarding_seattle); 0.29::true_val(designed_by, unk_designed_by).

measured(s10, designed_by, k2_snowboarding_seattle).

all_consistent(designed_by) :-
    consistent(s10, designed_by).

evidence(all_consistent(designed_by)).
query(true_val(designed_by, k2_snowboarding_seattle)).
query(true_val(designed_by, unk_designed_by)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values china_factory=K2_Sports_China_factory unk_manufacturing_location_current=Unknown
% @importance 0.70

0.82::acc(s10, manufacturing_location_current).

0.71::true_val(manufacturing_location_current, china_factory); 0.29::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s10, manufacturing_location_current, china_factory).

all_consistent(manufacturing_location_current) :-
    consistent(s10, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, china_factory)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr board_collection
% @type categorical
% @canonical false
% @original_name Board collection
% @values landscape_collection=Landscape_Collection unk_board_collection=Unknown
% @importance 0.50

0.88::acc(s11, board_collection).

0.81::true_val(board_collection, landscape_collection); 0.19::true_val(board_collection, unk_board_collection).

measured(s11, board_collection, landscape_collection).

all_consistent(board_collection) :-
    consistent(s11, board_collection).

evidence(all_consistent(board_collection)).
query(true_val(board_collection, landscape_collection)).
query(true_val(board_collection, unk_board_collection)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 1.0

0.95::acc(s12, gender).

0.90::true_val(gender, unisex); 0.10::true_val(gender, unk_gender).

measured(s12, gender, unisex).

all_consistent(gender) :-
    consistent(s12, gender).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2021_22=2021_2022_season unk_model_first_available_year=Unknown
% @importance 0.80

0.72::acc(s13, model_first_available_year).

0.63::true_val(model_first_available_year, season_2021_22); 0.37::true_val(model_first_available_year, unk_model_first_available_year).

measured(s13, model_first_available_year, season_2021_22).

all_consistent(model_first_available_year) :-
    consistent(s13, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2021_22)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v999_99=999.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::acc(smerchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v999_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(smerchant, price_aud_merchant, v999_99).

all_consistent(price_aud_merchant) :-
    consistent(smerchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v999_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v629_95=629.95 v440_97=440.97 unk_price_usd_msrp=Unknown
% @importance 1.0

0.95::acc(s14, price_usd_msrp).

0.50::true_val(price_usd_msrp, v629_95); 0.47::true_val(price_usd_msrp, v440_97); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s14, price_usd_msrp, v629_95).

all_consistent(price_usd_msrp) :-
    consistent(s14, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v629_95)).
query(true_val(price_usd_msrp, v440_97)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_milosport
% @type numeric
% @unit USD
% @canonical false
% @original_name USD price (Milosport, 2027)
% @values v629_95=629.95 unk_price_usd_milosport=Unknown
% @importance 0.90

0.78::acc(s15, price_usd_milosport).

0.68::true_val(price_usd_milosport, v629_95); 0.32::true_val(price_usd_milosport, unk_price_usd_milosport).

measured(s15, price_usd_milosport, v629_95).

all_consistent(price_usd_milosport) :-
    consistent(s15, price_usd_milosport).

evidence(all_consistent(price_usd_milosport)).
query(true_val(price_usd_milosport, v629_95)).
query(true_val(price_usd_milosport, unk_price_usd_milosport)).

% @attr price_nzd_basenz
% @type numeric
% @unit NZD
% @canonical false
% @original_name NZD price (BaseNZ, 2027)
% @values v1079_99=1079.99 unk_price_nzd_basenz=Unknown
% @importance 0.85

0.78::acc(s16, price_nzd_basenz).

0.63::true_val(price_nzd_basenz, v1079_99); 0.37::true_val(price_nzd_basenz, unk_price_nzd_basenz).

measured(s16, price_nzd_basenz, v1079_99).

all_consistent(price_nzd_basenz) :-
    consistent(s16, price_nzd_basenz).

evidence(all_consistent(price_nzd_basenz)).
query(true_val(price_nzd_basenz, v1079_99)).
query(true_val(price_nzd_basenz, unk_price_nzd_basenz)).

% @attr price_usd_sbj
% @type numeric
% @unit USD
% @canonical false
% @original_name USD price (The Snowboarders Journal cites for Excavator)
% @values v579_95=579.95 unk_price_usd_sbj=Unknown
% @importance 0.90

0.80::acc(s17, price_usd_sbj).

0.68::true_val(price_usd_sbj, v579_95); 0.32::true_val(price_usd_sbj, unk_price_usd_sbj).

measured(s17, price_usd_sbj, v579_95).

all_consistent(price_usd_sbj) :-
    consistent(s17, price_usd_sbj).

evidence(all_consistent(price_usd_sbj)).
query(true_val(price_usd_sbj, v579_95)).
query(true_val(price_usd_sbj, unk_price_usd_sbj)).

% @attr price_usd_discounted_tgr
% @type numeric
% @unit USD
% @canonical false
% @original_name USD discounted price (prior model, Sun & Ski Sports via TheGoodRide)
% @values v503_93=503.93 unk_price_usd_discounted_tgr=Unknown
% @importance 0.90

0.70::acc(s18, price_usd_discounted_tgr).

0.56::true_val(price_usd_discounted_tgr, v503_93); 0.44::true_val(price_usd_discounted_tgr, unk_price_usd_discounted_tgr).

measured(s18, price_usd_discounted_tgr, v503_93).

all_consistent(price_usd_discounted_tgr) :-
    consistent(s18, price_usd_discounted_tgr).

evidence(all_consistent(price_usd_discounted_tgr)).
query(true_val(price_usd_discounted_tgr, v503_93)).
query(true_val(price_usd_discounted_tgr, unk_price_usd_discounted_tgr)).

% @attr price_usd_tactics
% @type categorical
% @canonical true
% @original_name price_usd_tactics
% @values not_specified_warranty_only=Not_specified_warranty_only unk_price_usd_tactics=Unknown
% @importance 0.80

0.75::acc(s19, price_usd_tactics).

0.68::true_val(price_usd_tactics, not_specified_warranty_only); 0.32::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s19, price_usd_tactics, not_specified_warranty_only).

all_consistent(price_usd_tactics) :-
    consistent(s19, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, not_specified_warranty_only)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock_on_sale=In_stock_on_sale_440_97 unk_availability_status=Unknown
% @importance 1.0

0.95::acc(s14, availability_status).

0.90::true_val(availability_status, in_stock_on_sale); 0.10::true_val(availability_status, unk_availability_status).

measured(s14, availability_status, in_stock_on_sale).

all_consistent(availability_status) :-
    consistent(s14, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_on_sale)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_merchant
% @type categorical
% @canonical false
% @original_name availability_status (Merchant preorder)
% @values preorder_may_2026=Preorder_May_2026 unk_availability_status_merchant=Unknown
% @importance 0.85

0.93::acc(smerchant, availability_status_merchant).

0.95::true_val(availability_status_merchant, preorder_may_2026); 0.05::true_val(availability_status_merchant, unk_availability_status_merchant).

measured(smerchant, availability_status_merchant, preorder_may_2026).

all_consistent(availability_status_merchant) :-
    consistent(smerchant, availability_status_merchant).

evidence(all_consistent(availability_status_merchant)).
query(true_val(availability_status_merchant, preorder_may_2026)).
query(true_val(availability_status_merchant, unk_availability_status_merchant)).

% @attr availability_status_milosport
% @type categorical
% @canonical false
% @original_name availability_status (Milosport)
% @values out_of_stock=Out_of_stock unk_availability_status_milosport=Unknown
% @importance 0.90

0.78::acc(s15, availability_status_milosport).

0.68::true_val(availability_status_milosport, out_of_stock); 0.32::true_val(availability_status_milosport, unk_availability_status_milosport).

measured(s15, availability_status_milosport, out_of_stock).

all_consistent(availability_status_milosport) :-
    consistent(s15, availability_status_milosport).

evidence(all_consistent(availability_status_milosport)).
query(true_val(availability_status_milosport, out_of_stock)).
query(true_val(availability_status_milosport, unk_availability_status_milosport)).

% @attr availability_status_basenz
% @type categorical
% @canonical false
% @original_name availability_status (BaseNZ)
% @values in_stock_preorder=In_stock_preorder_NZD_1079_99 unk_availability_status_basenz=Unknown
% @importance 0.85

0.78::acc(s16, availability_status_basenz).

0.63::true_val(availability_status_basenz, in_stock_preorder); 0.37::true_val(availability_status_basenz, unk_availability_status_basenz).

measured(s16, availability_status_basenz, in_stock_preorder).

all_consistent(availability_status_basenz) :-
    consistent(s16, availability_status_basenz).

evidence(all_consistent(availability_status_basenz)).
query(true_val(availability_status_basenz, in_stock_preorder)).
query(true_val(availability_status_basenz, unk_availability_status_basenz)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo)
% @values in_stock=In_stock unk_availability_status_evo=Unknown
% @importance 0.85

0.85::acc(s20, availability_status_evo).

0.68::true_val(availability_status_evo, in_stock); 0.32::true_val(availability_status_evo, unk_availability_status_evo).

measured(s20, availability_status_evo, in_stock).

all_consistent(availability_status_evo) :-
    consistent(s20, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, in_stock)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_rei
% @type categorical
% @canonical false
% @original_name availability_status (REI)
% @values discontinued=Discontinued unk_availability_status_rei=Unknown
% @importance 0.70

0.85::acc(s21, availability_status_rei).

0.72::true_val(availability_status_rei, discontinued); 0.28::true_val(availability_status_rei, unk_availability_status_rei).

measured(s21, availability_status_rei, discontinued).

all_consistent(availability_status_rei) :-
    consistent(s21, availability_status_rei).

evidence(all_consistent(availability_status_rei)).
query(true_val(availability_status_rei, discontinued)).
query(true_val(availability_status_rei, unk_availability_status_rei)).

% @attr availability_status_ski_monster
% @type categorical
% @canonical false
% @original_name availability_status (Ski Monster)
% @values available=Available unk_availability_status_ski_monster=Unknown
% @importance 0.85

0.82::acc(s22, availability_status_ski_monster).

0.68::true_val(availability_status_ski_monster, available); 0.32::true_val(availability_status_ski_monster, unk_availability_status_ski_monster).

measured(s22, availability_status_ski_monster, available).

all_consistent(availability_status_ski_monster) :-
    consistent(s22, availability_status_ski_monster).

evidence(all_consistent(availability_status_ski_monster)).
query(true_val(availability_status_ski_monster, available)).
query(true_val(availability_status_ski_monster, unk_availability_status_ski_monster)).

% @attr availability_status_eriks
% @type categorical
% @canonical false
% @original_name availability_status (ERIKS)
% @values available_warehouse=Available_warehouse_4_9_days unk_availability_status_eriks=Unknown
% @importance 0.60

0.75::acc(s23, availability_status_eriks).

0.60::true_val(availability_status_eriks, available_warehouse); 0.40::true_val(availability_status_eriks, unk_availability_status_eriks).

measured(s23, availability_status_eriks, available_warehouse).

all_consistent(availability_status_eriks) :-
    consistent(s23, availability_status_eriks).

evidence(all_consistent(availability_status_eriks)).
query(true_val(availability_status_eriks, available_warehouse)).
query(true_val(availability_status_eriks, unk_availability_status_eriks)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name availability_status (Tactics)
% @values available=Available unk_availability_status_tactics=Unknown
% @importance 0.80

0.78::acc(s19, availability_status_tactics).

0.68::true_val(availability_status_tactics, available); 0.32::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s19, availability_status_tactics, available).

all_consistent(availability_status_tactics) :-
    consistent(s19, availability_status_tactics).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, available)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status (The-House)
% @values available=Available unk_availability_status_the_house=Unknown
% @importance 0.60

0.72::acc(s24, availability_status_the_house).

0.56::true_val(availability_status_the_house, available); 0.44::true_val(availability_status_the_house, unk_availability_status_the_house).

measured(s24, availability_status_the_house, available).

all_consistent(availability_status_the_house) :-
    consistent(s24, availability_status_the_house).

evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, available)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

% @attr retailer_evo
% @type categorical
% @canonical false
% @original_name Retailer (evo.com)
% @values major_us_online=Major_US_online_retailer_price_guarantee unk_retailer_evo=Unknown
% @importance 0.85

0.85::acc(s20, retailer_evo).

0.68::true_val(retailer_evo, major_us_online); 0.32::true_val(retailer_evo, unk_retailer_evo).

measured(s20, retailer_evo, major_us_online).

all_consistent(retailer_evo) :-
    consistent(s20, retailer_evo).

evidence(all_consistent(retailer_evo)).
query(true_val(retailer_evo, major_us_online)).
query(true_val(retailer_evo, unk_retailer_evo)).

% @attr retailer_rei
% @type categorical
% @canonical false
% @original_name Retailer (REI)
% @values large_outdoor_retailer=Large_outdoor_retailer_member_rewards unk_retailer_rei=Unknown
% @importance 0.70

0.85::acc(s21, retailer_rei).

0.72::true_val(retailer_rei, large_outdoor_retailer); 0.28::true_val(retailer_rei, unk_retailer_rei).

measured(s21, retailer_rei, large_outdoor_retailer).

all_consistent(retailer_rei) :-
    consistent(s21, retailer_rei).

evidence(all_consistent(retailer_rei)).
query(true_val(retailer_rei, large_outdoor_retailer)).
query(true_val(retailer_rei, unk_retailer_rei)).

% @attr retailer_milosport
% @type categorical
% @canonical false
% @original_name Retailer (Milosport)
% @values core_boardshop_slc=Core_boardshop_SLC_40yrs unk_retailer_milosport=Unknown
% @importance 0.90

0.78::acc(s15, retailer_milosport).

0.68::true_val(retailer_milosport, core_boardshop_slc); 0.32::true_val(retailer_milosport, unk_retailer_milosport).

measured(s15, retailer_milosport, core_boardshop_slc).

all_consistent(retailer_milosport) :-
    consistent(s15, retailer_milosport).

evidence(all_consistent(retailer_milosport)).
query(true_val(retailer_milosport, core_boardshop_slc)).
query(true_val(retailer_milosport, unk_retailer_milosport)).

% @attr retailer_basenz
% @type categorical
% @canonical false
% @original_name Retailer (BaseNZ)
% @values nz_retailer_queenstown=NZ_retailer_Queenstown_Wanaka unk_retailer_basenz=Unknown
% @importance 0.85

0.78::acc(s16, retailer_basenz).

0.63::true_val(retailer_basenz, nz_retailer_queenstown); 0.37::true_val(retailer_basenz, unk_retailer_basenz).

measured(s16, retailer_basenz, nz_retailer_queenstown).

all_consistent(retailer_basenz) :-
    consistent(s16, retailer_basenz).

evidence(all_consistent(retailer_basenz)).
query(true_val(retailer_basenz, nz_retailer_queenstown)).
query(true_val(retailer_basenz, unk_retailer_basenz)).

% @attr retailer_tactics
% @type categorical
% @canonical false
% @original_name Retailer (Tactics)
% @values established_online=Established_online_snowboard_retailer unk_retailer_tactics=Unknown
% @importance 0.80

0.78::acc(s19, retailer_tactics).

0.68::true_val(retailer_tactics, established_online); 0.32::true_val(retailer_tactics, unk_retailer_tactics).

measured(s19, retailer_tactics, established_online).

all_consistent(retailer_tactics) :-
    consistent(s19, retailer_tactics).

evidence(all_consistent(retailer_tactics)).
query(true_val(retailer_tactics, established_online)).
query(true_val(retailer_tactics, unk_retailer_tactics)).

% @attr retailer_ski_monster
% @type categorical
% @canonical false
% @original_name Retailer (The Ski Monster)
% @values specialist_shop=Specialist_ski_snowboard_shop unk_retailer_ski_monster=Unknown
% @importance 0.85

0.82::acc(s22, retailer_ski_monster).

0.68::true_val(retailer_ski_monster, specialist_shop); 0.32::true_val(retailer_ski_monster, unk_retailer_ski_monster).

measured(s22, retailer_ski_monster, specialist_shop).

all_consistent(retailer_ski_monster) :-
    consistent(s22, retailer_ski_monster).

evidence(all_consistent(retailer_ski_monster)).
query(true_val(retailer_ski_monster, specialist_shop)).
query(true_val(retailer_ski_monster, unk_retailer_ski_monster)).

% @attr retailer_eriks
% @type categorical
% @canonical false
% @original_name Retailer (ERIKS)
% @values multi_state_us=Multi_state_US_retailer unk_retailer_eriks=Unknown
% @importance 0.60

0.72::acc(s23, retailer_eriks).

0.60::true_val(retailer_eriks, multi_state_us); 0.40::true_val(retailer_eriks, unk_retailer_eriks).

measured(s23, retailer_eriks, multi_state_us).

all_consistent(retailer_eriks) :-
    consistent(s23, retailer_eriks).

evidence(all_consistent(retailer_eriks)).
query(true_val(retailer_eriks, multi_state_us)).
query(true_val(retailer_eriks, unk_retailer_eriks)).

% @attr retailer_melbourne_snowboard
% @type categorical
% @canonical false
% @original_name Retailer (Melbourne Snowboard Centre)
% @values australian_specialist=Australian_specialist unk_retailer_melbourne_snowboard=Unknown
% @importance 0.80

0.72::acc(s25, retailer_melbourne_snowboard).

0.60::true_val(retailer_melbourne_snowboard, australian_specialist); 0.40::true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard).

measured(s25, retailer_melbourne_snowboard, australian_specialist).

all_consistent(retailer_melbourne_snowboard) :-
    consistent(s25, retailer_melbourne_snowboard).

evidence(all_consistent(retailer_melbourne_snowboard)).
query(true_val(retailer_melbourne_snowboard, australian_specialist)).
query(true_val(retailer_melbourne_snowboard, unk_retailer_melbourne_snowboard)).

% @attr retailer_blauer_board_shop
% @type categorical
% @canonical false
% @original_name Retailer (Blauer Board Shop)
% @values independent_recommended=Independent_recommended_by_TheGoodRide unk_retailer_blauer_board_shop=Unknown
% @importance 0.85

0.82::acc(s26, retailer_blauer_board_shop).

0.78::true_val(retailer_blauer_board_shop, independent_recommended); 0.22::true_val(retailer_blauer_board_shop, unk_retailer_blauer_board_shop).

measured(s26, retailer_blauer_board_shop, independent_recommended).

all_consistent(retailer_blauer_board_shop) :-
    consistent(s26, retailer_blauer_board_shop).

evidence(all_consistent(retailer_blauer_board_shop)).
query(true_val(retailer_blauer_board_shop, independent_recommended)).
query(true_val(retailer_blauer_board_shop, unk_retailer_blauer_board_shop)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freeride_powder=Freeride_Powder unk_board_category=Unknown
% @importance 0.93

0.95::acc(s12, board_category).
0.70::acc(smerchant, board_category).

0.95::true_val(board_category, freeride_powder); 0.05::true_val(board_category, unk_board_category).

measured(s12, board_category, freeride_powder).
measured(smerchant, board_category, freeride_powder).

all_consistent(board_category) :-
    consistent(s12, board_category),
    (indep(smerchant), consistent(smerchant, board_category) ; \+indep(smerchant)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, unk_board_category)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values groomer_powder_hybrid=Groomer_Powder_hybrid unk_terrain_suitability=Unknown
% @importance 0.90

0.70::acc(smerchant, terrain_suitability).
0.82::acc(s22, terrain_suitability).
0.93::acc(s12, terrain_suitability).

0.95::true_val(terrain_suitability, groomer_powder_hybrid); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(smerchant, terrain_suitability, groomer_powder_hybrid).
measured(s22, terrain_suitability, groomer_powder_hybrid).
measured(s12, terrain_suitability, groomer_powder_hybrid).

all_consistent(terrain_suitability) :-
    consistent(s12, terrain_suitability),
    consistent(s22, terrain_suitability),
    (indep(smerchant), consistent(smerchant, terrain_suitability) ; \+indep(smerchant)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, groomer_powder_hybrid)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values directional_carve_powder=Directional_carving_and_powder_float unk_riding_style=Unknown
% @importance 0.88

0.70::acc(s2, riding_style).
0.82::acc(s20, riding_style).
0.93::acc(s12, riding_style).

0.95::true_val(riding_style, directional_carve_powder); 0.05::true_val(riding_style, unk_riding_style).

measured(s2, riding_style, directional_carve_powder).
measured(s20, riding_style, directional_carve_powder).
measured(s12, riding_style, directional_carve_powder).

all_consistent(riding_style) :-
    consistent(s12, riding_style),
    (indep(s20), consistent(s20, riding_style) ; \+indep(s20)),
    (indep(s2), consistent(s2, riding_style) ; \+indep(s2)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, directional_carve_powder)).
query(true_val(riding_style, unk_riding_style)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced_expert=Intermediate_Advanced_Expert unk_rider_level=Unknown
% @importance 1.0

0.95::acc(s12, rider_level).

0.90::true_val(rider_level, intermediate_advanced_expert); 0.10::true_val(rider_level, unk_rider_level).

measured(s12, rider_level, intermediate_advanced_expert).

all_consistent(rider_level) :-
    consistent(s12, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced_expert)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_to_expert=Intermediate_to_expert_groomer_lovers unk_skill_level_recommendation=Unknown
% @importance 0.85

0.82::acc(s22, skill_level_recommendation).

0.68::true_val(skill_level_recommendation, intermediate_to_expert); 0.32::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s22, skill_level_recommendation, intermediate_to_expert).

all_consistent(skill_level_recommendation) :-
    consistent(s22, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_to_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr not_recommended_beginners
% @type categorical
% @canonical false
% @original_name Not recommended for (beginners)
% @values too_demanding=Directional_shape_stiff_flex_too_demanding unk_not_recommended_beginners=Unknown
% @importance 0.85

0.82::acc(s22, not_recommended_beginners).

0.68::true_val(not_recommended_beginners, too_demanding); 0.32::true_val(not_recommended_beginners, unk_not_recommended_beginners).

measured(s22, not_recommended_beginners, too_demanding).

all_consistent(not_recommended_beginners) :-
    consistent(s22, not_recommended_beginners).

evidence(all_consistent(not_recommended_beginners)).
query(true_val(not_recommended_beginners, too_demanding)).
query(true_val(not_recommended_beginners, unk_not_recommended_beginners)).

% @attr not_recommended_park
% @type categorical
% @canonical false
% @original_name Not recommended for (park/switch)
% @values limits_switch=Directional_shape_limits_switch_riding unk_not_recommended_park=Unknown
% @importance 0.85

0.82::acc(s22, not_recommended_park).

0.68::true_val(not_recommended_park, limits_switch); 0.32::true_val(not_recommended_park, unk_not_recommended_park).

measured(s22, not_recommended_park, limits_switch).

all_consistent(not_recommended_park) :-
    consistent(s22, not_recommended_park).

evidence(all_consistent(not_recommended_park)).
query(true_val(not_recommended_park, limits_switch)).
query(true_val(not_recommended_park, unk_not_recommended_park)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional=Directional unk_shape=Unknown
% @importance 0.93

0.70::acc(smerchant, shape).
0.95::acc(s12, shape).

0.95::true_val(shape, directional); 0.05::true_val(shape, unk_shape).

measured(smerchant, shape, directional).
measured(s12, shape, directional).

all_consistent(shape) :-
    consistent(s12, shape),
    (indep(smerchant), consistent(smerchant, shape) ; \+indep(smerchant)).

evidence(all_consistent(shape)).
query(true_val(shape, directional)).
query(true_val(shape, unk_shape)).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name Tail design
% @values slight_swallowtail=Slight_swallowtail unk_tail_design=Unknown
% @importance 0.85

0.80::acc(s20, tail_design).

0.68::true_val(tail_design, slight_swallowtail); 0.32::true_val(tail_design, unk_tail_design).

measured(s20, tail_design, slight_swallowtail).

all_consistent(tail_design) :-
    (indep(s20), consistent(s20, tail_design) ; \+indep(s20)).

evidence(all_consistent(tail_design)).
query(true_val(tail_design, slight_swallowtail)).
query(true_val(tail_design, unk_tail_design)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values elongated_spoon_nose=Huge_elongated_spoon_nose unk_nose_design=Unknown
% @importance 0.85

0.80::acc(s20, nose_design).

0.68::true_val(nose_design, elongated_spoon_nose); 0.32::true_val(nose_design, unk_nose_design).

measured(s20, nose_design, elongated_spoon_nose).

all_consistent(nose_design) :-
    (indep(s20), consistent(s20, nose_design) ; \+indep(s20)).

evidence(all_consistent(nose_design)).
query(true_val(nose_design, elongated_spoon_nose)).
query(true_val(nose_design, unk_nose_design)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_camber=Directional_Camber_early_rise_nose unk_camber_type=Unknown
% @importance 1.0

0.95::acc(s12, camber_type).

0.90::true_val(camber_type, directional_camber); 0.10::true_val(camber_type, unk_camber_type).

measured(s12, camber_type, directional_camber).

all_consistent(camber_type) :-
    consistent(s12, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v20=20.0 unk_taper=Unknown
% @importance 0.83

0.70::acc(smerchant, taper).
0.70::acc(s2, taper).

0.95::true_val(taper, v20); 0.05::true_val(taper, unk_taper).

measured(smerchant, taper, v20).
measured(s2, taper, v20).

all_consistent(taper) :-
    (indep(smerchant), consistent(smerchant, taper) ; \+indep(smerchant)),
    (indep(s2), consistent(s2, taper) ; \+indep(s2)).

evidence(all_consistent(taper)).
query(true_val(taper, v20)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @unit mm
% @canonical true
% @original_name setback
% @values vneg19=neg19.0 unk_setback=Unknown
% @importance 1.0

0.95::acc(s14, setback).

0.90::true_val(setback, vneg19); 0.10::true_val(setback, unk_setback).

measured(s14, setback, vneg19).

all_consistent(setback) :-
    consistent(s14, setback).

evidence(all_consistent(setback)).
query(true_val(setback, vneg19)).
query(true_val(setback, unk_setback)).

% @attr volume_shift
% @type categorical
% @canonical false
% @original_name Volume shift
% @values yes_downsize_4_10cm=Yes_downsize_4_10cm unk_volume_shift=Unknown
% @importance 1.0

0.95::acc(s12, volume_shift).

0.90::true_val(volume_shift, yes_downsize_4_10cm); 0.10::true_val(volume_shift, unk_volume_shift).

measured(s12, volume_shift, yes_downsize_4_10cm).

all_consistent(volume_shift) :-
    consistent(s12, volume_shift).

evidence(all_consistent(volume_shift)).
query(true_val(volume_shift, yes_downsize_4_10cm)).
query(true_val(volume_shift, unk_volume_shift)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6=6.0 v7=7.0
% @importance 0.87

0.70::acc(smerchant, flex_rating_10).
0.78::acc(s16, flex_rating_10).
0.82::acc(s10, flex_rating_10).
0.70::acc(s27, flex_rating_10).
0.82::acc(s28, flex_rating_10).

0.15::true_val(flex_rating_10, v6); 0.85::true_val(flex_rating_10, v7).

measured(smerchant, flex_rating_10, v6).
measured(s16, flex_rating_10, v7).
measured(s10, flex_rating_10, v7).
measured(s27, flex_rating_10, v7).
measured(s28, flex_rating_10, v7).

all_consistent(flex_rating_10) :-
    (indep(smerchant), consistent(smerchant, flex_rating_10) ; \+indep(smerchant)),
    (indep(s16), consistent(s16, flex_rating_10) ; \+indep(s16)),
    consistent(s10, flex_rating_10),
    consistent(s27, flex_rating_10),
    consistent(s28, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, v7)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @unit /10
% @canonical false
% @original_name flex_rating_10_manufacturer (K2 rated earlier model)
% @values v9=9.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.80

0.65::acc(s13, flex_rating_10_manufacturer).

0.63::true_val(flex_rating_10_manufacturer, v9); 0.37::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s13, flex_rating_10_manufacturer, v9).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s13, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v9)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical false
% @original_name flex_rating_10_the_good_ride
% @values medium_stiff_feels_medium=Medium_stiff_rated_feels_medium_on_snow unk_flex_rating_10_the_good_ride=Unknown
% @importance 0.90

0.85::acc(s29, flex_rating_10_the_good_ride).

0.72::true_val(flex_rating_10_the_good_ride, medium_stiff_feels_medium); 0.28::true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride).

measured(s29, flex_rating_10_the_good_ride, medium_stiff_feels_medium).

all_consistent(flex_rating_10_the_good_ride) :-
    consistent(s29, flex_rating_10_the_good_ride).

evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium_stiff_feels_medium)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_rating_10_the_good_ride)).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values damp_pop_easy_butter_nose=Damp_with_pop_easy_butter_nose unk_flex_feel=Unknown
% @importance 0.90

0.85::acc(s29, flex_feel).

0.72::true_val(flex_feel, damp_pop_easy_butter_nose); 0.28::true_val(flex_feel, unk_flex_feel).

measured(s29, flex_feel, damp_pop_easy_butter_nose).

all_consistent(flex_feel) :-
    consistent(s29, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, damp_pop_easy_butter_nose)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr construction
% @type categorical
% @canonical false
% @original_name Construction
% @values hybritech=HybridTech_Hybritech_exclusive_sidewall unk_construction=Unknown
% @importance 1.0

0.95::acc(s12, construction).

0.90::true_val(construction, hybritech); 0.10::true_val(construction, unk_construction).

measured(s12, construction, hybritech).

all_consistent(construction) :-
    consistent(s12, construction).

evidence(all_consistent(construction)).
query(true_val(construction, hybritech)).
query(true_val(construction, unk_construction)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values ptex_capped_tip_tail=P_Tex_sidewall_capped_tip_tail unk_sidewall_material=Unknown
% @importance 0.65

0.72::acc(s30, sidewall_material).

0.63::true_val(sidewall_material, ptex_capped_tip_tail); 0.37::true_val(sidewall_material, unk_sidewall_material).

measured(s30, sidewall_material, ptex_capped_tip_tail).

all_consistent(sidewall_material) :-
    (indep(s30), consistent(s30, sidewall_material) ; \+indep(s30)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, ptex_capped_tip_tail)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values s1_core_bamboo_aspen_paulownia=S1_Core_Bamboo_Aspen_Paulownia unk_core_material=Unknown
% @importance 1.0

0.95::acc(s12, core_material).

0.90::true_val(core_material, s1_core_bamboo_aspen_paulownia); 0.10::true_val(core_material, unk_core_material).

measured(s12, core_material, s1_core_bamboo_aspen_paulownia).

all_consistent(core_material) :-
    consistent(s12, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, s1_core_bamboo_aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr core_wood_angles
% @type categorical
% @canonical false
% @original_name Core wood angles
% @values aspen_bamboo_30deg=Aspen_Bamboo_30deg_underfoot unk_core_wood_angles=Unknown
% @importance 1.0

0.93::acc(s12, core_wood_angles).

0.90::true_val(core_wood_angles, aspen_bamboo_30deg); 0.10::true_val(core_wood_angles, unk_core_wood_angles).

measured(s12, core_wood_angles, aspen_bamboo_30deg).

all_consistent(core_wood_angles) :-
    consistent(s12, core_wood_angles).

evidence(all_consistent(core_wood_angles)).
query(true_val(core_wood_angles, aspen_bamboo_30deg)).
query(true_val(core_wood_angles, unk_core_wood_angles)).

% @attr core_stringers
% @type categorical
% @canonical false
% @original_name Core stringers
% @values tip_to_tail_bamboo=Tip_to_tail_Bamboo_snap_durability_damping unk_core_stringers=Unknown
% @importance 1.0

0.93::acc(s12, core_stringers).

0.90::true_val(core_stringers, tip_to_tail_bamboo); 0.10::true_val(core_stringers, unk_core_stringers).

measured(s12, core_stringers, tip_to_tail_bamboo).

all_consistent(core_stringers) :-
    consistent(s12, core_stringers).

evidence(all_consistent(core_stringers)).
query(true_val(core_stringers, tip_to_tail_bamboo)).
query(true_val(core_stringers, unk_core_stringers)).

% @attr core_swing_weight_reduction
% @type categorical
% @canonical false
% @original_name Core swing weight reduction
% @values paulownia_midbody_tip_tail=Lightweight_Paulownia_midbody_tip_tail unk_core_swing_weight_reduction=Unknown
% @importance 1.0

0.93::acc(s12, core_swing_weight_reduction).

0.90::true_val(core_swing_weight_reduction, paulownia_midbody_tip_tail); 0.10::true_val(core_swing_weight_reduction, unk_core_swing_weight_reduction).

measured(s12, core_swing_weight_reduction, paulownia_midbody_tip_tail).

all_consistent(core_swing_weight_reduction) :-
    consistent(s12, core_swing_weight_reduction).

evidence(all_consistent(core_swing_weight_reduction)).
query(true_val(core_swing_weight_reduction, paulownia_midbody_tip_tail)).
query(true_val(core_swing_weight_reduction, unk_core_swing_weight_reduction)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values icg10_biax_carbon_glass=ICG_10_Biax_Carbon_Glass_90deg unk_laminate=Unknown
% @importance 0.85

0.70::acc(smerchant, laminate).

0.95::true_val(laminate, icg10_biax_carbon_glass); 0.05::true_val(laminate, unk_laminate).

measured(smerchant, laminate, icg10_biax_carbon_glass).

all_consistent(laminate) :-
    (indep(smerchant), consistent(smerchant, laminate) ; \+indep(smerchant)).

evidence(all_consistent(laminate)).
query(true_val(laminate, icg10_biax_carbon_glass)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_power_fork=Carbon_Power_Fork_pre_cambered_tail unk_construction_material_innovation=Unknown
% @importance 1.0

0.93::acc(s12, construction_material_innovation).

0.90::true_val(construction_material_innovation, carbon_power_fork); 0.10::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s12, construction_material_innovation, carbon_power_fork).

all_consistent(construction_material_innovation) :-
    consistent(s12, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_power_fork)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_2
% @type categorical
% @canonical false
% @original_name construction_material_innovation (carbon stringers)
% @values tip_to_tail_carbon_stringers=Tip_to_tail_carbon_fiber_stringers unk_construction_material_innovation_2=Unknown
% @importance 1.0

0.93::acc(s12, construction_material_innovation_2).

0.90::true_val(construction_material_innovation_2, tip_to_tail_carbon_stringers); 0.10::true_val(construction_material_innovation_2, unk_construction_material_innovation_2).

measured(s12, construction_material_innovation_2, tip_to_tail_carbon_stringers).

all_consistent(construction_material_innovation_2) :-
    consistent(s12, construction_material_innovation_2).

evidence(all_consistent(construction_material_innovation_2)).
query(true_val(construction_material_innovation_2, tip_to_tail_carbon_stringers)).
query(true_val(construction_material_innovation_2, unk_construction_material_innovation_2)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_4001_wax_infused=Wax_Infused_Sintered_4001_Crown unk_base_material=Unknown
% @importance 1.0

0.95::acc(s12, base_material).

0.90::true_val(base_material, sintered_4001_wax_infused); 0.10::true_val(base_material, unk_base_material).

measured(s12, base_material, sintered_4001_wax_infused).

all_consistent(base_material) :-
    consistent(s12, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_4001_wax_infused)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values stone_finish=Stone_Finish unk_base_type=Unknown
% @importance 1.0

0.95::acc(s12, base_type).

0.90::true_val(base_type, stone_finish); 0.10::true_val(base_type, unk_base_type).

measured(s12, base_type, stone_finish).

all_consistent(base_type) :-
    consistent(s12, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, stone_finish)).
query(true_val(base_type, unk_base_type)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Insert_packs unk_mounting_pattern=Unknown
% @importance 1.0

0.95::acc(s12, mounting_pattern).

0.90::true_val(mounting_pattern, inserts_2x4); 0.10::true_val(mounting_pattern, unk_mounting_pattern).

measured(s12, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(s12, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values standard_mini_disc=Any_binding_standard_or_mini_disc unk_binding_compatibility=Unknown
% @importance 0.60

0.72::acc(s25, binding_compatibility).

0.60::true_val(binding_compatibility, standard_mini_disc); 0.40::true_val(binding_compatibility, unk_binding_compatibility).

measured(s25, binding_compatibility, standard_mini_disc).

all_consistent(binding_compatibility) :-
    (indep(s25), consistent(s25, binding_compatibility) ; \+indep(s25)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_mini_disc)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values textured_bio_resin=Textured_Topsheet_Bio_Resin unk_topsheet=Unknown
% @importance 1.0

0.95::acc(s12, topsheet).

0.90::true_val(topsheet, textured_bio_resin); 0.10::true_val(topsheet, unk_topsheet).

measured(s12, topsheet, textured_bio_resin).

all_consistent(topsheet) :-
    consistent(s12, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, textured_bio_resin)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_snowphobic
% @type categorical
% @canonical false
% @original_name topsheet (SnowPhobic)
% @values snowphobic_hydrophobic=SnowPhobic_hydrophobic_no_snow_buildup unk_topsheet_snowphobic=Unknown
% @importance 0.45

0.75::acc(s31, topsheet_snowphobic).

0.64::true_val(topsheet_snowphobic, snowphobic_hydrophobic); 0.36::true_val(topsheet_snowphobic, unk_topsheet_snowphobic).

measured(s31, topsheet_snowphobic, snowphobic_hydrophobic).

all_consistent(topsheet_snowphobic) :-
    consistent(s31, topsheet_snowphobic).

evidence(all_consistent(topsheet_snowphobic)).
query(true_val(topsheet_snowphobic, snowphobic_hydrophobic)).
query(true_val(topsheet_snowphobic, unk_topsheet_snowphobic)).

% @attr resin
% @type categorical
% @canonical false
% @original_name resin
% @values bio_resin=Bio_Resin unk_resin=Unknown
% @importance 1.0

0.95::acc(s12, resin).

0.90::true_val(resin, bio_resin); 0.10::true_val(resin, unk_resin).

measured(s12, resin, bio_resin).

all_consistent(resin) :-
    consistent(s12, resin).

evidence(all_consistent(resin)).
query(true_val(resin, bio_resin)).
query(true_val(resin, unk_resin)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_142_146_150_154_158_162=142_146_150_154_158_162cm unk_available_sizes=Unknown
% @importance 1.0

0.95::acc(s12, available_sizes).

0.90::true_val(available_sizes, sizes_142_146_150_154_158_162); 0.10::true_val(available_sizes, unk_available_sizes).

measured(s12, available_sizes, sizes_142_146_150_154_158_162).

all_consistent(available_sizes) :-
    consistent(s12, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_142_146_150_154_158_162)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr effective_edge_142
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 142
% @values v1040=1040.0 unk_effective_edge_142=Unknown
% @importance 1.0

0.95::acc(s14, effective_edge_142).

0.90::true_val(effective_edge_142, v1040); 0.10::true_val(effective_edge_142, unk_effective_edge_142).

measured(s14, effective_edge_142, v1040).

all_consistent(effective_edge_142) :-
    consistent(s14, effective_edge_142).

evidence(all_consistent(effective_edge_142)).
query(true_val(effective_edge_142, v1040)).
query(true_val(effective_edge_142, unk_effective_edge_142)).

% @attr tip_waist_tail_142
% @type categorical
% @unit mm
% @canonical false
% @original_name Tip/waist/tail 142
% @values v299_250_279=299_250_279mm unk_tip_waist_tail_142=Unknown
% @importance 1.0

0.95::acc(s14, tip_waist_tail_142).

0.90::true_val(tip_waist_tail_142, v299_250_279); 0.10::true_val(tip_waist_tail_142, unk_tip_waist_tail_142).

measured(s14, tip_waist_tail_142, v299_250_279).

all_consistent(tip_waist_tail_142) :-
    consistent(s14, tip_waist_tail_142).

evidence(all_consistent(tip_waist_tail_142)).
query(true_val(tip_waist_tail_142, v299_250_279)).
query(true_val(tip_waist_tail_142, unk_tip_waist_tail_142)).

% @attr sidecut_142
% @type categorical
% @unit m
% @canonical false
% @original_name Sidecut 142
% @values v5_5_6_5=5.5_6.5m unk_sidecut_142=Unknown
% @importance 1.0

0.95::acc(s14, sidecut_142).

0.90::true_val(sidecut_142, v5_5_6_5); 0.10::true_val(sidecut_142, unk_sidecut_142).

measured(s14, sidecut_142, v5_5_6_5).

all_consistent(sidecut_142) :-
    consistent(s14, sidecut_142).

evidence(all_consistent(sidecut_142)).
query(true_val(sidecut_142, v5_5_6_5)).
query(true_val(sidecut_142, unk_sidecut_142)).

% @attr stance_142
% @type numeric
% @unit mm
% @canonical false
% @original_name Stance 142
% @values v483=483.0 unk_stance_142=Unknown
% @importance 1.0

0.95::acc(s14, stance_142).

0.90::true_val(stance_142, v483); 0.10::true_val(stance_142, unk_stance_142).

measured(s14, stance_142, v483).

all_consistent(stance_142) :-
    consistent(s14, stance_142).

evidence(all_consistent(stance_142)).
query(true_val(stance_142, v483)).
query(true_val(stance_142, unk_stance_142)).

% @attr recommended_weight_range_size_142
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (142)
% @values v41_73kg=41_73kg unk_recommended_weight_range_size_142=Unknown
% @importance 1.0

0.95::acc(s14, recommended_weight_range_size_142).

0.90::true_val(recommended_weight_range_size_142, v41_73kg); 0.10::true_val(recommended_weight_range_size_142, unk_recommended_weight_range_size_142).

measured(s14, recommended_weight_range_size_142, v41_73kg).

all_consistent(recommended_weight_range_size_142) :-
    consistent(s14, recommended_weight_range_size_142).

evidence(all_consistent(recommended_weight_range_size_142)).
query(true_val(recommended_weight_range_size_142, v41_73kg)).
query(true_val(recommended_weight_range_size_142, unk_recommended_weight_range_size_142)).

% @attr effective_edge_150
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 150
% @values v1110=1110.0 unk_effective_edge_150=Unknown
% @importance 1.0

0.95::acc(s14, effective_edge_150).

0.90::true_val(effective_edge_150, v1110); 0.10::true_val(effective_edge_150, unk_effective_edge_150).

measured(s14, effective_edge_150, v1110).

all_consistent(effective_edge_150) :-
    consistent(s14, effective_edge_150).

evidence(all_consistent(effective_edge_150)).
query(true_val(effective_edge_150, v1110)).
query(true_val(effective_edge_150, unk_effective_edge_150)).

% @attr tip_waist_tail_150
% @type categorical
% @unit mm
% @canonical false
% @original_name Tip/waist/tail 150
% @values v313_260_293=313_260_293mm unk_tip_waist_tail_150=Unknown
% @importance 1.0

0.95::acc(s14, tip_waist_tail_150).

0.90::true_val(tip_waist_tail_150, v313_260_293); 0.10::true_val(tip_waist_tail_150, unk_tip_waist_tail_150).

measured(s14, tip_waist_tail_150, v313_260_293).

all_consistent(tip_waist_tail_150) :-
    consistent(s14, tip_waist_tail_150).

evidence(all_consistent(tip_waist_tail_150)).
query(true_val(tip_waist_tail_150, v313_260_293)).
query(true_val(tip_waist_tail_150, unk_tip_waist_tail_150)).

% @attr sidecut_150
% @type categorical
% @unit m
% @canonical false
% @original_name Sidecut 150
% @values v5_9_6_9=5.9_6.9m unk_sidecut_150=Unknown
% @importance 1.0

0.95::acc(s14, sidecut_150).

0.90::true_val(sidecut_150, v5_9_6_9); 0.10::true_val(sidecut_150, unk_sidecut_150).

measured(s14, sidecut_150, v5_9_6_9).

all_consistent(sidecut_150) :-
    consistent(s14, sidecut_150).

evidence(all_consistent(sidecut_150)).
query(true_val(sidecut_150, v5_9_6_9)).
query(true_val(sidecut_150, unk_sidecut_150)).

% @attr stance_150
% @type numeric
% @unit mm
% @canonical false
% @original_name Stance 150
% @values v508=508.0 unk_stance_150=Unknown
% @importance 1.0

0.95::acc(s14, stance_150).

0.90::true_val(stance_150, v508); 0.10::true_val(stance_150, unk_stance_150).

measured(s14, stance_150, v508).

all_consistent(stance_150) :-
    consistent(s14, stance_150).

evidence(all_consistent(stance_150)).
query(true_val(stance_150, v508)).
query(true_val(stance_150, unk_stance_150)).

% @attr recommended_weight_range_size_150
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (150)
% @values v54_86kg=54_86kg unk_recommended_weight_range_size_150=Unknown
% @importance 1.0

0.95::acc(s14, recommended_weight_range_size_150).

0.90::true_val(recommended_weight_range_size_150, v54_86kg); 0.10::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).

measured(s14, recommended_weight_range_size_150, v54_86kg).

all_consistent(recommended_weight_range_size_150) :-
    consistent(s14, recommended_weight_range_size_150).

evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, v54_86kg)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

% @attr effective_edge_154
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 154
% @values v1150=1150.0 unk_effective_edge_154=Unknown
% @importance 1.0

0.95::acc(s14, effective_edge_154).

0.90::true_val(effective_edge_154, v1150); 0.10::true_val(effective_edge_154, unk_effective_edge_154).

measured(s14, effective_edge_154, v1150).

all_consistent(effective_edge_154) :-
    consistent(s14, effective_edge_154).

evidence(all_consistent(effective_edge_154)).
query(true_val(effective_edge_154, v1150)).
query(true_val(effective_edge_154, unk_effective_edge_154)).

% @attr tip_tail_width_size
% @type categorical
% @unit mm
% @canonical true
% @original_name tip_tail_width_size (154)
% @values v318_264_298=318_264_298mm unk_tip_tail_width_size=Unknown
% @importance 1.0

0.95::acc(s14, tip_tail_width_size).

0.90::true_val(tip_tail_width_size, v318_264_298); 0.10::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s14, tip_tail_width_size, v318_264_298).

all_consistent(tip_tail_width_size) :-
    consistent(s14, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v318_264_298)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size (154)
% @values v6_1_7_1=6.1_7.1m unk_sidecut_radius_size=Unknown
% @importance 1.0

0.95::acc(s14, sidecut_radius_size).

0.90::true_val(sidecut_radius_size, v6_1_7_1); 0.10::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s14, sidecut_radius_size, v6_1_7_1).

all_consistent(sidecut_radius_size) :-
    consistent(s14, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v6_1_7_1)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr stance_width_range_size
% @type numeric
% @unit mm
% @canonical true
% @original_name stance_width_range_size (154)
% @values v533=533.0 unk_stance_width_range_size=Unknown
% @importance 1.0

0.95::acc(s14, stance_width_range_size).

0.90::true_val(stance_width_range_size, v533); 0.10::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s14, stance_width_range_size, v533).

all_consistent(stance_width_range_size) :-
    consistent(s14, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v533)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @unit kg
% @canonical true
% @original_name recommended_weight_range_size (154)
% @values v54_86kg=54_86kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.95::acc(s14, recommended_weight_range_size).

0.90::true_val(recommended_weight_range_size, v54_86kg); 0.10::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s14, recommended_weight_range_size, v54_86kg).

all_consistent(recommended_weight_range_size) :-
    consistent(s14, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v54_86kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_158
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 158
% @values v1180=1180.0 unk_effective_edge_158=Unknown
% @importance 1.0

0.95::acc(s14, effective_edge_158).

0.90::true_val(effective_edge_158, v1180); 0.10::true_val(effective_edge_158, unk_effective_edge_158).

measured(s14, effective_edge_158, v1180).

all_consistent(effective_edge_158) :-
    consistent(s14, effective_edge_158).

evidence(all_consistent(effective_edge_158)).
query(true_val(effective_edge_158, v1180)).
query(true_val(effective_edge_158, unk_effective_edge_158)).

% @attr tip_tail_width_size_158
% @type categorical
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (158)
% @values v324_268_304=324_268_304mm unk_tip_tail_width_size_158=Unknown
% @importance 1.0

0.95::acc(s14, tip_tail_width_size_158).

0.90::true_val(tip_tail_width_size_158, v324_268_304); 0.10::true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158).

measured(s14, tip_tail_width_size_158, v324_268_304).

all_consistent(tip_tail_width_size_158) :-
    consistent(s14, tip_tail_width_size_158).

evidence(all_consistent(tip_tail_width_size_158)).
query(true_val(tip_tail_width_size_158, v324_268_304)).
query(true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158)).

% @attr sidecut_radius_size_158
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (158)
% @values v6_3_7_3=6.3_7.3m unk_sidecut_radius_size_158=Unknown
% @importance 1.0

0.95::acc(s14, sidecut_radius_size_158).

0.90::true_val(sidecut_radius_size_158, v6_3_7_3); 0.10::true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158).

measured(s14, sidecut_radius_size_158, v6_3_7_3).

all_consistent(sidecut_radius_size_158) :-
    consistent(s14, sidecut_radius_size_158).

evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v6_3_7_3)).
query(true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158)).

% @attr stance_width_range_size_158
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (158)
% @values v559=559.0 unk_stance_width_range_size_158=Unknown
% @importance 1.0

0.95::acc(s14, stance_width_range_size_158).

0.90::true_val(stance_width_range_size_158, v559); 0.10::true_val(stance_width_range_size_158, unk_stance_width_range_size_158).

measured(s14, stance_width_range_size_158, v559).

all_consistent(stance_width_range_size_158) :-
    consistent(s14, stance_width_range_size_158).

evidence(all_consistent(stance_width_range_size_158)).
query(true_val(stance_width_range_size_158, v559)).
query(true_val(stance_width_range_size_158, unk_stance_width_range_size_158)).

% @attr recommended_weight_range_size_158
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (158)
% @values v59_95kg=59_95kg unk_recommended_weight_range_size_158=Unknown
% @importance 1.0

0.95::acc(s14, recommended_weight_range_size_158).

0.90::true_val(recommended_weight_range_size_158, v59_95kg); 0.10::true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158).

measured(s14, recommended_weight_range_size_158, v59_95kg).

all_consistent(recommended_weight_range_size_158) :-
    consistent(s14, recommended_weight_range_size_158).

evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, v59_95kg)).
query(true_val(recommended_weight_range_size_158, unk_recommended_weight_range_size_158)).

% @attr effective_edge_162
% @type numeric
% @unit mm
% @canonical false
% @original_name Effective edge 162
% @values v1220=1220.0 unk_effective_edge_162=Unknown
% @importance 1.0

0.95::acc(s14, effective_edge_162).

0.90::true_val(effective_edge_162, v1220); 0.10::true_val(effective_edge_162, unk_effective_edge_162).

measured(s14, effective_edge_162, v1220).

all_consistent(effective_edge_162) :-
    consistent(s14, effective_edge_162).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1220)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr tip_tail_width_size_162
% @type categorical
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (162)
% @values v327_270_307=327_270_307mm v330_272_310=330_272_310mm
% @importance 1.0

0.93::acc(s14, tip_tail_width_size_162).
0.75::acc(s16, tip_tail_width_size_162).

0.60::true_val(tip_tail_width_size_162, v327_270_307); 0.40::true_val(tip_tail_width_size_162, v330_272_310).

measured(s14, tip_tail_width_size_162, v327_270_307).
measured(s16, tip_tail_width_size_162, v330_272_310).

all_consistent(tip_tail_width_size_162) :-
    consistent(s14, tip_tail_width_size_162),
    (indep(s16), consistent(s16, tip_tail_width_size_162) ; \+indep(s16)).

evidence(all_consistent(tip_tail_width_size_162)).
query(true_val(tip_tail_width_size_162, v327_270_307)).
query(true_val(tip_tail_width_size_162, v330_272_310)).

% @attr sidecut_radius_size_162
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162)
% @values v6_5_7_5=6.5_7.5m unk_sidecut_radius_size_162=Unknown
% @importance 1.0

0.95::acc(s14, sidecut_radius_size_162).

0.90::true_val(sidecut_radius_size_162, v6_5_7_5); 0.10::true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162).

measured(s14, sidecut_radius_size_162, v6_5_7_5).

all_consistent(sidecut_radius_size_162) :-
    consistent(s14, sidecut_radius_size_162).

evidence(all_consistent(sidecut_radius_size_162)).
query(true_val(sidecut_radius_size_162, v6_5_7_5)).
query(true_val(sidecut_radius_size_162, unk_sidecut_radius_size_162)).

% @attr stance_width_range_size_162
% @type numeric
% @unit mm
% @canonical false
% @original_name stance_width_range_size (162)
% @values v584=584.0 unk_stance_width_range_size_162=Unknown
% @importance 1.0

0.95::acc(s14, stance_width_range_size_162).

0.90::true_val(stance_width_range_size_162, v584); 0.10::true_val(stance_width_range_size_162, unk_stance_width_range_size_162).

measured(s14, stance_width_range_size_162, v584).

all_consistent(stance_width_range_size_162) :-
    consistent(s14, stance_width_range_size_162).

evidence(all_consistent(stance_width_range_size_162)).
query(true_val(stance_width_range_size_162, v584)).
query(true_val(stance_width_range_size_162, unk_stance_width_range_size_162)).

% @attr recommended_weight_range_size_162
% @type categorical
% @unit kg
% @canonical false
% @original_name recommended_weight_range_size (162)
% @values v59_95kg=59_95kg v64_104kg=64_104kg
% @importance 1.0

0.93::acc(s14, recommended_weight_range_size_162).
0.75::acc(s16, recommended_weight_range_size_162).

0.60::true_val(recommended_weight_range_size_162, v59_95kg); 0.40::true_val(recommended_weight_range_size_162, v64_104kg).

measured(s14, recommended_weight_range_size_162, v59_95kg).
measured(s16, recommended_weight_range_size_162, v64_104kg).

all_consistent(recommended_weight_range_size_162) :-
    consistent(s14, recommended_weight_range_size_162),
    (indep(s16), consistent(s16, recommended_weight_range_size_162) ; \+indep(s16)).

evidence(all_consistent(recommended_weight_range_size_162)).
query(true_val(recommended_weight_range_size_162, v59_95kg)).
query(true_val(recommended_weight_range_size_162, v64_104kg)).

% @attr sidecut_type
% @type categorical
% @canonical false
% @original_name sidecut_type
% @values dual_radius=Dual_radius_sidecut unk_sidecut_type=Unknown
% @importance 1.0

0.95::acc(s12, sidecut_type).

0.90::true_val(sidecut_type, dual_radius); 0.10::true_val(sidecut_type, unk_sidecut_type).

measured(s12, sidecut_type, dual_radius).

all_consistent(sidecut_type) :-
    consistent(s12, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, dual_radius)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr volume_shift_recommendation
% @type categorical
% @canonical false
% @original_name Volume shift recommendation
% @values size_down_4_10cm=Size_down_4_10cm unk_volume_shift_recommendation=Unknown
% @importance 1.0

0.95::acc(s12, volume_shift_recommendation).

0.90::true_val(volume_shift_recommendation, size_down_4_10cm); 0.10::true_val(volume_shift_recommendation, unk_volume_shift_recommendation).

measured(s12, volume_shift_recommendation, size_down_4_10cm).

all_consistent(volume_shift_recommendation) :-
    consistent(s12, volume_shift_recommendation).

evidence(all_consistent(volume_shift_recommendation)).
query(true_val(volume_shift_recommendation, size_down_4_10cm)).
query(true_val(volume_shift_recommendation, unk_volume_shift_recommendation)).

% @attr volume_shift_sizing_example
% @type categorical
% @canonical false
% @original_name Volume shift sizing example
% @values v154_eq_159=154cm_equals_159cm_surface_area unk_volume_shift_sizing_example=Unknown
% @importance 0.80

0.88::acc(s32, volume_shift_sizing_example).

0.86::true_val(volume_shift_sizing_example, v154_eq_159); 0.14::true_val(volume_shift_sizing_example, unk_volume_shift_sizing_example).

measured(s32, volume_shift_sizing_example, v154_eq_159).

all_consistent(volume_shift_sizing_example) :-
    consistent(s32, volume_shift_sizing_example).

evidence(all_consistent(volume_shift_sizing_example)).
query(true_val(volume_shift_sizing_example, v154_eq_159)).
query(true_val(volume_shift_sizing_example, unk_volume_shift_sizing_example)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_volume_shifted=Standard_Volume_Shifted unk_width_options=Unknown
% @importance 0.85

0.70::acc(smerchant, width_options).

0.95::true_val(width_options, standard_volume_shifted); 0.05::true_val(width_options, unk_width_options).

measured(smerchant, width_options, standard_volume_shifted).

all_consistent(width_options) :-
    (indep(smerchant), consistent(smerchant, width_options) ; \+indep(smerchant)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_volume_shifted)).
query(true_val(width_options, unk_width_options)).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v1=1.0 v5=5.0
% @importance 0.78

0.95::acc(s33, warranty_period_years).
0.75::acc(s19, warranty_period_years).

0.65::true_val(warranty_period_years, v1); 0.35::true_val(warranty_period_years, v5).

measured(s33, warranty_period_years, v1).
measured(s19, warranty_period_years, v5).

all_consistent(warranty_period_years) :-
    consistent(s33, warranty_period_years),
    consistent(s19, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, v5)).

% @attr carving_performance
% @type categorical
% @canonical false
% @original_name Carving
% @values excellent=Excellent_on_groomers_primary_purpose unk_carving_performance=Unknown
% @importance 0.85

0.70::acc(s27, carving_performance).

0.43::true_val(carving_performance, excellent); 0.57::true_val(carving_performance, unk_carving_performance).

measured(s27, carving_performance, excellent).

all_consistent(carving_performance) :-
    consistent(s27, carving_performance).

evidence(all_consistent(carving_performance)).
query(true_val(carving_performance, excellent)).
query(true_val(carving_performance, unk_carving_performance)).

% @attr stability
% @type categorical
% @canonical false
% @original_name Stability
% @values very_stable_at_speed=Very_stable_at_speed unk_stability=Unknown
% @importance 0.85

0.70::acc(s27, stability).

0.43::true_val(stability, very_stable_at_speed); 0.57::true_val(stability, unk_stability).

measured(s27, stability, very_stable_at_speed).

all_consistent(stability) :-
    consistent(s27, stability).

evidence(all_consistent(stability)).
query(true_val(stability, very_stable_at_speed)).
query(true_val(stability, unk_stability)).

% @attr dampening
% @type categorical
% @canonical false
% @original_name Dampening
% @values damp_smooth=Damp_underfoot_smooth_for_light_board unk_dampening=Unknown
% @importance 0.90

0.85::acc(s29, dampening).

0.72::true_val(dampening, damp_smooth); 0.28::true_val(dampening, unk_dampening).

measured(s29, dampening, damp_smooth).

all_consistent(dampening) :-
    consistent(s29, dampening).

evidence(all_consistent(dampening)).
query(true_val(dampening, damp_smooth)).
query(true_val(dampening, unk_dampening)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values surprising_pop_carbon=Surprising_pop_carbon_power_fork_energy_return unk_pop=Unknown
% @importance 0.85

0.70::acc(s27, pop).

0.43::true_val(pop, surprising_pop_carbon); 0.57::true_val(pop, unk_pop).

measured(s27, pop, surprising_pop_carbon).

all_consistent(pop) :-
    consistent(s27, pop).

evidence(all_consistent(pop)).
query(true_val(pop, surprising_pop_carbon)).
query(true_val(pop, unk_pop)).

% @attr float_in_powder
% @type categorical
% @canonical false
% @original_name Float in powder
% @values very_good_directional=Very_good_directional_float_short_wide unk_float_in_powder=Unknown
% @importance 0.90

0.85::acc(s29, float_in_powder).

0.72::true_val(float_in_powder, very_good_directional); 0.28::true_val(float_in_powder, unk_float_in_powder).

measured(s29, float_in_powder, very_good_directional).

all_consistent(float_in_powder) :-
    consistent(s29, float_in_powder).

evidence(all_consistent(float_in_powder)).
query(true_val(float_in_powder, very_good_directional)).
query(true_val(float_in_powder, unk_float_in_powder)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values aggressive=Aggressive_edge_hold_variable_conditions unk_edge_hold=Unknown
% @importance 0.90

0.78::acc(s15, edge_hold).

0.68::true_val(edge_hold, aggressive); 0.32::true_val(edge_hold, unk_edge_hold).

measured(s15, edge_hold, aggressive).

all_consistent(edge_hold) :-
    consistent(s15, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, aggressive)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values easy_despite_width=Easy_turn_initiation_torsional_flex unk_turn_initiation_performance=Unknown
% @importance 0.85

0.70::acc(s27, turn_initiation_performance).

0.43::true_val(turn_initiation_performance, easy_despite_width); 0.57::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s27, turn_initiation_performance, easy_despite_width).

all_consistent(turn_initiation_performance) :-
    consistent(s27, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, easy_despite_width)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr butterability
% @type categorical
% @canonical false
% @original_name Butterability
% @values difficult_groomers_possible_pow=Difficult_groomers_possible_pow unk_butterability=Unknown
% @importance 0.85

0.70::acc(s27, butterability).

0.43::true_val(butterability, difficult_groomers_possible_pow); 0.57::true_val(butterability, unk_butterability).

measured(s27, butterability, difficult_groomers_possible_pow).

all_consistent(butterability) :-
    consistent(s27, butterability).

evidence(all_consistent(butterability)).
query(true_val(butterability, difficult_groomers_possible_pow)).
query(true_val(butterability, unk_butterability)).

% @attr jibbing
% @type categorical
% @canonical false
% @original_name Jibbing
% @values not_recommended=Not_recommended unk_jibbing=Unknown
% @importance 0.85

0.70::acc(s27, jibbing).

0.43::true_val(jibbing, not_recommended); 0.57::true_val(jibbing, unk_jibbing).

measured(s27, jibbing, not_recommended).

all_consistent(jibbing) :-
    consistent(s27, jibbing).

evidence(all_consistent(jibbing)).
query(true_val(jibbing, not_recommended)).
query(true_val(jibbing, unk_jibbing)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values possible_not_ideal=Possible_but_not_ideal_directional_limits unk_switch_riding=Unknown
% @importance 0.85

0.82::acc(s22, switch_riding).

0.68::true_val(switch_riding, possible_not_ideal); 0.32::true_val(switch_riding, unk_switch_riding).

measured(s22, switch_riding, possible_not_ideal).

all_consistent(switch_riding) :-
    consistent(s22, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, possible_not_ideal)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr speed_stability
% @type categorical
% @canonical false
% @original_name Speed stability
% @values stable_charging=Stable_at_speed_comfortable_charging unk_speed_stability=Unknown
% @importance 0.85

0.82::acc(s22, speed_stability).

0.68::true_val(speed_stability, stable_charging); 0.32::true_val(speed_stability, unk_speed_stability).

measured(s22, speed_stability, stable_charging).

all_consistent(speed_stability) :-
    consistent(s22, speed_stability).

evidence(all_consistent(speed_stability)).
query(true_val(speed_stability, stable_charging)).
query(true_val(speed_stability, unk_speed_stability)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values mid_tier=Mid_tier_glide_not_fastest_for_price unk_base_glide_performance=Unknown
% @importance 0.90

0.85::acc(s29, base_glide_performance).

0.72::true_val(base_glide_performance, mid_tier); 0.28::true_val(base_glide_performance, unk_base_glide_performance).

measured(s29, base_glide_performance, mid_tier).

all_consistent(base_glide_performance) :-
    consistent(s29, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, mid_tier)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr versatility
% @type categorical
% @canonical false
% @original_name Versatility
% @values very_versatile_quiver=Very_versatile_one_board_quiver unk_versatility=Unknown
% @importance 0.90

0.85::acc(s29, versatility).

0.72::true_val(versatility, very_versatile_quiver); 0.28::true_val(versatility, unk_versatility).

measured(s29, versatility, very_versatile_quiver).

all_consistent(versatility) :-
    consistent(s29, versatility).

evidence(all_consistent(versatility)).
query(true_val(versatility, very_versatile_quiver)).
query(true_val(versatility, unk_versatility)).

% @attr weight_feel
% @type categorical
% @canonical false
% @original_name Weight feel
% @values medium_borders_light=Medium_weight_borders_on_light unk_weight_feel=Unknown
% @importance 0.90

0.85::acc(s29, weight_feel).

0.72::true_val(weight_feel, medium_borders_light); 0.28::true_val(weight_feel, unk_weight_feel).

measured(s29, weight_feel, medium_borders_light).

all_consistent(weight_feel) :-
    consistent(s29, weight_feel).

evidence(all_consistent(weight_feel)).
query(true_val(weight_feel, medium_borders_light)).
query(true_val(weight_feel, unk_weight_feel)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values very_recommendable=Very_recommendable_wide_variety_riders unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.90

0.85::acc(s29, reviewer_opinion_the_good_ride).

0.72::true_val(reviewer_opinion_the_good_ride, very_recommendable); 0.28::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s29, reviewer_opinion_the_good_ride, very_recommendable).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s29, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, very_recommendable)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr sbj_verdict
% @type categorical
% @canonical false
% @original_name Snowboarders Journal verdict
% @values easy_riding_great_daily_driver=Easy_riding_great_daily_driver unk_sbj_verdict=Unknown
% @importance 0.85

0.82::acc(s28, sbj_verdict).

0.72::true_val(sbj_verdict, easy_riding_great_daily_driver); 0.28::true_val(sbj_verdict, unk_sbj_verdict).

measured(s28, sbj_verdict, easy_riding_great_daily_driver).

all_consistent(sbj_verdict) :-
    consistent(s28, sbj_verdict).

evidence(all_consistent(sbj_verdict)).
query(true_val(sbj_verdict, easy_riding_great_daily_driver)).
query(true_val(sbj_verdict, unk_sbj_verdict)).

% @attr curated_expert_impression
% @type categorical
% @canonical false
% @original_name Curated.com expert impression
% @values powerful_aggressive=Very_powerful_aggressive_need_skill unk_curated_expert_impression=Unknown
% @importance 0.75

0.72::acc(s34, curated_expert_impression).

0.60::true_val(curated_expert_impression, powerful_aggressive); 0.40::true_val(curated_expert_impression, unk_curated_expert_impression).

measured(s34, curated_expert_impression, powerful_aggressive).

all_consistent(curated_expert_impression) :-
    consistent(s34, curated_expert_impression).

evidence(all_consistent(curated_expert_impression)).
query(true_val(curated_expert_impression, powerful_aggressive)).
query(true_val(curated_expert_impression, unk_curated_expert_impression)).

% @attr ski_monster_verdict
% @type categorical
% @canonical false
% @original_name Ski Monster verdict
% @values favorite_elite_soft_snow=Favorite_board_elite_in_softer_snow unk_ski_monster_verdict=Unknown
% @importance 0.85

0.82::acc(s22, ski_monster_verdict).

0.68::true_val(ski_monster_verdict, favorite_elite_soft_snow); 0.32::true_val(ski_monster_verdict, unk_ski_monster_verdict).

measured(s22, ski_monster_verdict, favorite_elite_soft_snow).

all_consistent(ski_monster_verdict) :-
    consistent(s22, ski_monster_verdict).

evidence(all_consistent(ski_monster_verdict)).
query(true_val(ski_monster_verdict, favorite_elite_soft_snow)).
query(true_val(ski_monster_verdict, unk_ski_monster_verdict)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values whitelines_100=Whitelines_100_Best_Products_2021_22 unk_reviewer_opinion_whitelines=Unknown
% @importance 0.60

0.80::acc(s35, reviewer_opinion_whitelines).

0.72::true_val(reviewer_opinion_whitelines, whitelines_100); 0.28::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s35, reviewer_opinion_whitelines, whitelines_100).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s35, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, whitelines_100)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr board_of_world_award
% @type categorical
% @canonical false
% @original_name Board of the World
% @values best_powder_groomer=Best_Board_Powder_and_Resort_Groomers unk_board_of_world_award=Unknown
% @importance 0.65

0.65::acc(s36, board_of_world_award).

0.51::true_val(board_of_world_award, best_powder_groomer); 0.49::true_val(board_of_world_award, unk_board_of_world_award).

measured(s36, board_of_world_award, best_powder_groomer).

all_consistent(board_of_world_award) :-
    consistent(s36, board_of_world_award).

evidence(all_consistent(board_of_world_award)).
query(true_val(board_of_world_award, best_powder_groomer)).
query(true_val(board_of_world_award, unk_board_of_world_award)).

% @attr blister_review_verdict
% @type categorical
% @canonical false
% @original_name Blister Review
% @values board_of_choice_powder=Board_of_choice_powder_variable_fast unk_blister_review_verdict=Unknown
% @importance 0.80

0.85::acc(s37, blister_review_verdict).

0.77::true_val(blister_review_verdict, board_of_choice_powder); 0.23::true_val(blister_review_verdict, unk_blister_review_verdict).

measured(s37, blister_review_verdict, board_of_choice_powder).

all_consistent(blister_review_verdict) :-
    consistent(s37, blister_review_verdict).

evidence(all_consistent(blister_review_verdict)).
query(true_val(blister_review_verdict, board_of_choice_powder)).
query(true_val(blister_review_verdict, unk_blister_review_verdict)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values favorite_board_ever=Favorite_board_carves_stable_damp_floats unk_user_review_forum=Unknown
% @importance 0.85

0.65::acc(s27, user_review_forum).

0.43::true_val(user_review_forum, favorite_board_ever); 0.57::true_val(user_review_forum, unk_user_review_forum).

measured(s27, user_review_forum, favorite_board_ever).

all_consistent(user_review_forum) :-
    consistent(s27, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, favorite_board_ever)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr japan_grabs_reviewer
% @type categorical
% @canonical false
% @original_name Japan Grabs reviewer
% @values converted_skeptic=Skeptic_of_short_wide_converted unk_japan_grabs_reviewer=Unknown
% @importance 0.80

0.72::acc(s13, japan_grabs_reviewer).

0.63::true_val(japan_grabs_reviewer, converted_skeptic); 0.37::true_val(japan_grabs_reviewer, unk_japan_grabs_reviewer).

measured(s13, japan_grabs_reviewer, converted_skeptic).

all_consistent(japan_grabs_reviewer) :-
    consistent(s13, japan_grabs_reviewer).

evidence(all_consistent(japan_grabs_reviewer)).
query(true_val(japan_grabs_reviewer, converted_skeptic)).
query(true_val(japan_grabs_reviewer, unk_japan_grabs_reviewer)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values too_demanding_new_riders=Directional_stiff_too_demanding_new_riders unk_negative_aspect=Unknown
% @importance 0.85

0.82::acc(s22, negative_aspect).

0.68::true_val(negative_aspect, too_demanding_new_riders); 0.32::true_val(negative_aspect, unk_negative_aspect).

measured(s22, negative_aspect, too_demanding_new_riders).

all_consistent(negative_aspect) :-
    consistent(s22, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, too_demanding_new_riders)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_2
% @type categorical
% @canonical false
% @original_name negative_aspect (freestyle limits)
% @values limits_freestyle=Directional_design_limits_freestyle unk_negative_aspect_2=Unknown
% @importance 0.85

0.82::acc(s22, negative_aspect_2).

0.68::true_val(negative_aspect_2, limits_freestyle); 0.32::true_val(negative_aspect_2, unk_negative_aspect_2).

measured(s22, negative_aspect_2, limits_freestyle).

all_consistent(negative_aspect_2) :-
    consistent(s22, negative_aspect_2).

evidence(all_consistent(negative_aspect_2)).
query(true_val(negative_aspect_2, limits_freestyle)).
query(true_val(negative_aspect_2, unk_negative_aspect_2)).

% @attr negative_aspect_3
% @type categorical
% @canonical false
% @original_name negative_aspect (chopped snow)
% @values slow_fatiguing_chop=Slow_fatiguing_uneven_chopped_snow unk_negative_aspect_3=Unknown
% @importance 0.90

0.85::acc(s29, negative_aspect_3).

0.72::true_val(negative_aspect_3, slow_fatiguing_chop); 0.28::true_val(negative_aspect_3, unk_negative_aspect_3).

measured(s29, negative_aspect_3, slow_fatiguing_chop).

all_consistent(negative_aspect_3) :-
    consistent(s29, negative_aspect_3).

evidence(all_consistent(negative_aspect_3)).
query(true_val(negative_aspect_3, slow_fatiguing_chop)).
query(true_val(negative_aspect_3, unk_negative_aspect_3)).

% @attr negative_aspect_4
% @type categorical
% @canonical false
% @original_name negative_aspect (torsional flex)
% @values less_torsionally_stiff=Less_torsionally_stiff_limits_ice_grip unk_negative_aspect_4=Unknown
% @importance 0.85

0.65::acc(s27, negative_aspect_4).

0.43::true_val(negative_aspect_4, less_torsionally_stiff); 0.57::true_val(negative_aspect_4, unk_negative_aspect_4).

measured(s27, negative_aspect_4, less_torsionally_stiff).

all_consistent(negative_aspect_4) :-
    consistent(s27, negative_aspect_4).

evidence(all_consistent(negative_aspect_4)).
query(true_val(negative_aspect_4, less_torsionally_stiff)).
query(true_val(negative_aspect_4, unk_negative_aspect_4)).

% @attr negative_aspect_5
% @type categorical
% @canonical false
% @original_name negative_aspect (no magnetraction)
% @values lacks_magnetraction=Lacks_magnetraction_edge_serration unk_negative_aspect_5=Unknown
% @importance 0.85

0.65::acc(s27, negative_aspect_5).

0.43::true_val(negative_aspect_5, lacks_magnetraction); 0.57::true_val(negative_aspect_5, unk_negative_aspect_5).

measured(s27, negative_aspect_5, lacks_magnetraction).

all_consistent(negative_aspect_5) :-
    consistent(s27, negative_aspect_5).

evidence(all_consistent(negative_aspect_5)).
query(true_val(negative_aspect_5, lacks_magnetraction)).
query(true_val(negative_aspect_5, unk_negative_aspect_5)).

% @attr negative_aspect_6
% @type categorical
% @canonical false
% @original_name negative_aspect (setback)
% @values not_setback_enough=Not_setback_for_low_angle_pow unk_negative_aspect_6=Unknown
% @importance 0.70

0.82::acc(s38, negative_aspect_6).

0.72::true_val(negative_aspect_6, not_setback_enough); 0.28::true_val(negative_aspect_6, unk_negative_aspect_6).

measured(s38, negative_aspect_6, not_setback_enough).

all_consistent(negative_aspect_6) :-
    consistent(s38, negative_aspect_6).

evidence(all_consistent(negative_aspect_6)).
query(true_val(negative_aspect_6, not_setback_enough)).
query(true_val(negative_aspect_6, unk_negative_aspect_6)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values lib_tech_orca=Lib_Tech_Orca unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.85::acc(s26, comparable_board_cross_brand).

0.76::true_val(comparable_board_cross_brand, lib_tech_orca); 0.24::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s26, comparable_board_cross_brand, lib_tech_orca).

all_consistent(comparable_board_cross_brand) :-
    consistent(s26, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, lib_tech_orca)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Salomon Dancehaul)
% @values salomon_dancehaul=Salomon_Dancehaul unk_comparable_board_cross_brand_2=Unknown
% @importance 0.85

0.85::acc(s26, comparable_board_cross_brand_2).

0.76::true_val(comparable_board_cross_brand_2, salomon_dancehaul); 0.24::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).

measured(s26, comparable_board_cross_brand_2, salomon_dancehaul).

all_consistent(comparable_board_cross_brand_2) :-
    consistent(s26, comparable_board_cross_brand_2).

evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, salomon_dancehaul)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

% @attr comparable_board_cross_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Gnu Gremlin)
% @values gnu_gremlin=Gnu_Gremlin unk_comparable_board_cross_brand_3=Unknown
% @importance 0.85

0.85::acc(s26, comparable_board_cross_brand_3).

0.76::true_val(comparable_board_cross_brand_3, gnu_gremlin); 0.24::true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3).

measured(s26, comparable_board_cross_brand_3, gnu_gremlin).

all_consistent(comparable_board_cross_brand_3) :-
    consistent(s26, comparable_board_cross_brand_3).

evidence(all_consistent(comparable_board_cross_brand_3)).
query(true_val(comparable_board_cross_brand_3, gnu_gremlin)).
query(true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3)).

% @attr comparable_board_cross_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Hovercraft)
% @values jones_hovercraft=Jones_Hovercraft unk_comparable_board_cross_brand_4=Unknown
% @importance 0.85

0.85::acc(s26, comparable_board_cross_brand_4).

0.76::true_val(comparable_board_cross_brand_4, jones_hovercraft); 0.24::true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4).

measured(s26, comparable_board_cross_brand_4, jones_hovercraft).

all_consistent(comparable_board_cross_brand_4) :-
    consistent(s26, comparable_board_cross_brand_4).

evidence(all_consistent(comparable_board_cross_brand_4)).
query(true_val(comparable_board_cross_brand_4, jones_hovercraft)).
query(true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4)).

% @attr comparable_board_cross_brand_5
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Ride Psychocandy)
% @values ride_psychocandy=Ride_Psychocandy unk_comparable_board_cross_brand_5=Unknown
% @importance 0.85

0.85::acc(s26, comparable_board_cross_brand_5).

0.76::true_val(comparable_board_cross_brand_5, ride_psychocandy); 0.24::true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5).

measured(s26, comparable_board_cross_brand_5, ride_psychocandy).

all_consistent(comparable_board_cross_brand_5) :-
    consistent(s26, comparable_board_cross_brand_5).

evidence(all_consistent(comparable_board_cross_brand_5)).
query(true_val(comparable_board_cross_brand_5, ride_psychocandy)).
query(true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5)).

% @attr comparable_board_cross_brand_6
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Korua Transition Finder)
% @values korua_transition_finder=Korua_Transition_Finder unk_comparable_board_cross_brand_6=Unknown
% @importance 0.85

0.85::acc(s26, comparable_board_cross_brand_6).

0.76::true_val(comparable_board_cross_brand_6, korua_transition_finder); 0.24::true_val(comparable_board_cross_brand_6, unk_comparable_board_cross_brand_6).

measured(s26, comparable_board_cross_brand_6, korua_transition_finder).

all_consistent(comparable_board_cross_brand_6) :-
    consistent(s26, comparable_board_cross_brand_6).

evidence(all_consistent(comparable_board_cross_brand_6)).
query(true_val(comparable_board_cross_brand_6, korua_transition_finder)).
query(true_val(comparable_board_cross_brand_6, unk_comparable_board_cross_brand_6)).

% @attr comparable_board_cross_brand_7
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Telos Backslash)
% @values telos_backslash=Telos_Backslash unk_comparable_board_cross_brand_7=Unknown
% @importance 0.85

0.85::acc(s26, comparable_board_cross_brand_7).

0.76::true_val(comparable_board_cross_brand_7, telos_backslash); 0.24::true_val(comparable_board_cross_brand_7, unk_comparable_board_cross_brand_7).

measured(s26, comparable_board_cross_brand_7, telos_backslash).

all_consistent(comparable_board_cross_brand_7) :-
    consistent(s26, comparable_board_cross_brand_7).

evidence(all_consistent(comparable_board_cross_brand_7)).
query(true_val(comparable_board_cross_brand_7, telos_backslash)).
query(true_val(comparable_board_cross_brand_7, unk_comparable_board_cross_brand_7)).

% @attr comparable_board_cross_brand_8
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes Hybrid)
% @values yes_hybrid=Yes_Hybrid unk_comparable_board_cross_brand_8=Unknown
% @importance 0.85

0.85::acc(s26, comparable_board_cross_brand_8).

0.76::true_val(comparable_board_cross_brand_8, yes_hybrid); 0.24::true_val(comparable_board_cross_brand_8, unk_comparable_board_cross_brand_8).

measured(s26, comparable_board_cross_brand_8, yes_hybrid).

all_consistent(comparable_board_cross_brand_8) :-
    consistent(s26, comparable_board_cross_brand_8).

evidence(all_consistent(comparable_board_cross_brand_8)).
query(true_val(comparable_board_cross_brand_8, yes_hybrid)).
query(true_val(comparable_board_cross_brand_8, unk_comparable_board_cross_brand_8)).

% @attr comparable_board_cross_brand_9
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Stranda Biru)
% @values stranda_biru=Stranda_Biru unk_comparable_board_cross_brand_9=Unknown
% @importance 0.70

0.55::acc(s39, comparable_board_cross_brand_9).

0.36::true_val(comparable_board_cross_brand_9, stranda_biru); 0.64::true_val(comparable_board_cross_brand_9, unk_comparable_board_cross_brand_9).

measured(s39, comparable_board_cross_brand_9, stranda_biru).

all_consistent(comparable_board_cross_brand_9) :-
    consistent(s39, comparable_board_cross_brand_9).

evidence(all_consistent(comparable_board_cross_brand_9)).
query(true_val(comparable_board_cross_brand_9, stranda_biru)).
query(true_val(comparable_board_cross_brand_9, unk_comparable_board_cross_brand_9)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values k2_alchemist=K2_Alchemist_traditional_stiffer unk_comparable_board_same_brand=Unknown
% @importance 0.70

0.50::acc(s40, comparable_board_same_brand).

0.30::true_val(comparable_board_same_brand, k2_alchemist); 0.70::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s40, comparable_board_same_brand, k2_alchemist).

all_consistent(comparable_board_same_brand) :-
    consistent(s40, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, k2_alchemist)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (K2 Special Effects)
% @values k2_special_effects=K2_Special_Effects_ultra_wide_deep_pow unk_comparable_board_same_brand_2=Unknown
% @importance 0.80

0.72::acc(s13, comparable_board_same_brand_2).

0.63::true_val(comparable_board_same_brand_2, k2_special_effects); 0.37::true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2).

measured(s13, comparable_board_same_brand_2, k2_special_effects).

all_consistent(comparable_board_same_brand_2) :-
    consistent(s13, comparable_board_same_brand_2).

evidence(all_consistent(comparable_board_same_brand_2)).
query(true_val(comparable_board_same_brand_2, k2_special_effects)).
query(true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values peter_sutherland_edition=Peter_Sutherland_mixed_media_artwork unk_available_colors=Unknown
% @importance 0.30

0.90::acc(s41, available_colors).

0.81::true_val(available_colors, peter_sutherland_edition); 0.19::true_val(available_colors, unk_available_colors).

measured(s41, available_colors, peter_sutherland_edition).

all_consistent(available_colors) :-
    consistent(s41, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, peter_sutherland_edition)).
query(true_val(available_colors, unk_available_colors)).

% @attr available_colors_2
% @type categorical
% @canonical false
% @original_name available_colors (Brain Dead collab)
% @values brain_dead_collab=K2_x_Brain_Dead_collaboration unk_available_colors_2=Unknown
% @importance 0.25

0.88::acc(s42, available_colors_2).

0.77::true_val(available_colors_2, brain_dead_collab); 0.23::true_val(available_colors_2, unk_available_colors_2).

measured(s42, available_colors_2, brain_dead_collab).

all_consistent(available_colors_2) :-
    consistent(s42, available_colors_2).

evidence(all_consistent(available_colors_2)).
query(true_val(available_colors_2, brain_dead_collab)).
query(true_val(available_colors_2, unk_available_colors_2)).

% @attr related_splitboard
% @type categorical
% @canonical false
% @original_name Related splitboard
% @values k2_isolator=K2_Isolator_Splitboard_homage unk_related_splitboard=Unknown
% @importance 0.40

0.88::acc(s43, related_splitboard).

0.81::true_val(related_splitboard, k2_isolator); 0.19::true_val(related_splitboard, unk_related_splitboard).

measured(s43, related_splitboard, k2_isolator).

all_consistent(related_splitboard) :-
    consistent(s43, related_splitboard).

evidence(all_consistent(related_splitboard)).
query(true_val(related_splitboard, k2_isolator)).
query(true_val(related_splitboard, unk_related_splitboard)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name manufacturing_location_prior
% @values vashon_to_china_2001=Vashon_Island_to_China_2001 unk_manufacturing_location_prior=Unknown
% @importance 0.70

0.80::acc(s5, manufacturing_location_prior).

0.76::true_val(manufacturing_location_prior, vashon_to_china_2001); 0.24::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

measured(s5, manufacturing_location_prior, vashon_to_china_2001).

all_consistent(manufacturing_location_prior) :-
    consistent(s5, manufacturing_location_prior).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, vashon_to_china_2001)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr k2_headquarters
% @type categorical
% @canonical false
% @original_name K2 headquarters
% @values seattle_wa=Seattle_Washington unk_k2_headquarters=Unknown
% @importance 0.70

0.80::acc(s5, k2_headquarters).

0.76::true_val(k2_headquarters, seattle_wa); 0.24::true_val(k2_headquarters, unk_k2_headquarters).

measured(s5, k2_headquarters, seattle_wa).

all_consistent(k2_headquarters) :-
    consistent(s5, k2_headquarters).

evidence(all_consistent(k2_headquarters)).
query(true_val(k2_headquarters, seattle_wa)).
query(true_val(k2_headquarters, unk_k2_headquarters)).

% @attr brand_reputation
% @type categorical
% @canonical false
% @original_name Brand reputation
% @values legitimate_core=Widely_considered_truly_legitimate_core unk_brand_reputation=Unknown
% @importance 0.50

0.80::acc(s9, brand_reputation).

0.72::true_val(brand_reputation, legitimate_core); 0.28::true_val(brand_reputation, unk_brand_reputation).

measured(s9, brand_reputation, legitimate_core).

all_consistent(brand_reputation) :-
    consistent(s9, brand_reputation).

evidence(all_consistent(brand_reputation)).
query(true_val(brand_reputation, legitimate_core)).
query(true_val(brand_reputation, unk_brand_reputation)).

% @attr k2_brand_naming
% @type categorical
% @canonical false
% @original_name K2 brand naming
% @values k2_mountain_kirschner=Named_after_K2_mountain_and_Kirschner_brothers unk_k2_brand_naming=Unknown
% @importance 0.70

0.80::acc(s5, k2_brand_naming).

0.76::true_val(k2_brand_naming, k2_mountain_kirschner); 0.24::true_val(k2_brand_naming, unk_k2_brand_naming).

measured(s5, k2_brand_naming, k2_mountain_kirschner).

all_consistent(k2_brand_naming) :-
    consistent(s5, k2_brand_naming).

evidence(all_consistent(k2_brand_naming)).
query(true_val(k2_brand_naming, k2_mountain_kirschner)).
query(true_val(k2_brand_naming, unk_k2_brand_naming)).