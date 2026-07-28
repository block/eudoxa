0.20::indep(s2).
0.15::indep(s4).
0.15::indep(s5).
0.15::indep(s6).
0.20::indep(s7).
0.15::indep(sm).
0.15::indep(s11).
0.10::indep(s12).
0.15::indep(s37).
0.15::indep(s38).
0.20::indep(s30).
0.20::indep(s31).
0.20::indep(s33).
0.15::indep(s3).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values gnu=GNU unk_brand=Unknown
% @importance 0.90

0.95::acc(s1, brand).
0.65::acc(s4, brand).

0.97::true_val(brand, gnu); 0.03::true_val(brand, unk_brand).

measured(s1, brand, gnu).
measured(s4, brand, gnu).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s4), consistent(s4, brand) ; \+indep(s4)).

evidence(all_consistent(brand)).
query(true_val(brand, gnu)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values riders_choice=Riders_Choice unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).

0.95::true_val(model_name, riders_choice); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, riders_choice).

all_consistent(model_name) :-
    consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, riders_choice)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 1.0

0.95::acc(s1, model_year).

0.95::true_val(model_year, y2026); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2026).

all_consistent(model_year) :-
    consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.725

0.65::acc(s4, manufacturer).
0.70::acc(s7, manufacturer).

0.95::true_val(manufacturer, mervin_manufacturing); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s4, manufacturer, mervin_manufacturing).
measured(s7, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :-
    (indep(s4), consistent(s4, manufacturer) ; \+indep(s4)),
    (indep(s7), consistent(s7, manufacturer) ; \+indep(s7)).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values freestyle_all_mountain=Freestyle_All_Mountain all_mountain_freestyle=All_Mountain_Freestyle
% @importance 0.95

0.93::acc(s1, board_category).
0.85::acc(s9, board_category).

0.55::true_val(board_category, freestyle_all_mountain); 0.45::true_val(board_category, all_mountain_freestyle).

measured(s1, board_category, freestyle_all_mountain).
measured(s9, board_category, all_mountain_freestyle).

all_consistent(board_category) :-
    consistent(s1, board_category),
    consistent(s9, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, all_mountain_freestyle)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.80

0.80::acc(sm, gender).

0.90::true_val(gender, mens); 0.10::true_val(gender, unk_gender).

measured(sm, gender, mens).

all_consistent(gender) :-
    consistent(sm, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU (merchant provided)
% @values sku_25sn008_155w=25SN008_155W unk_sku=Unknown
% @importance 0.85

0.90::acc(sm, sku).

0.90::true_val(sku, sku_25sn008_155w); 0.10::true_val(sku, unk_sku).

measured(sm, sku, sku_25sn008_155w).

all_consistent(sku) :-
    consistent(sm, sku).

evidence(all_consistent(sku)).
query(true_val(sku, sku_25sn008_155w)).
query(true_val(sku, unk_sku)).

% @attr mervin_founded
% @type categorical
% @canonical false
% @original_name Mervin Manufacturing founded
% @values y1977_olson_saari=1977_by_Mike_Olson_and_Pete_Saari unk_mervin_founded=Unknown
% @importance 0.575

0.70::acc(s7, mervin_founded).
0.75::acc(s15, mervin_founded).

0.95::true_val(mervin_founded, y1977_olson_saari); 0.05::true_val(mervin_founded, unk_mervin_founded).

measured(s7, mervin_founded, y1977_olson_saari).
measured(s15, mervin_founded, y1977_olson_saari).

all_consistent(mervin_founded) :-
    (indep(s7), consistent(s7, mervin_founded) ; \+indep(s7)),
    consistent(s15, mervin_founded).

evidence(all_consistent(mervin_founded)).
query(true_val(mervin_founded, y1977_olson_saari)).
query(true_val(mervin_founded, unk_mervin_founded)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values sequim_wa_usa=Sequim_Washington_USA unk_manufacturing_location=Unknown
% @importance 0.575

0.70::acc(s7, manufacturing_location).
0.85::acc(s17, manufacturing_location).

0.95::true_val(manufacturing_location, sequim_wa_usa); 0.05::true_val(manufacturing_location, unk_manufacturing_location).

measured(s7, manufacturing_location, sequim_wa_usa).
measured(s17, manufacturing_location, sequim_wa_usa).

all_consistent(manufacturing_location) :-
    (indep(s7), consistent(s7, manufacturing_location) ; \+indep(s7)),
    consistent(s17, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, sequim_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr handbuilt_usa
% @type categorical
% @canonical false
% @original_name Mervin is handbuilt in the USA
% @values yes_handbuilt=Handbuilt_in_USA unk_handbuilt_usa=Unknown
% @importance 0.70

0.65::acc(s4, handbuilt_usa).
0.85::acc(s17, handbuilt_usa).

0.95::true_val(handbuilt_usa, yes_handbuilt); 0.05::true_val(handbuilt_usa, unk_handbuilt_usa).

measured(s4, handbuilt_usa, yes_handbuilt).
measured(s17, handbuilt_usa, yes_handbuilt).

all_consistent(handbuilt_usa) :-
    (indep(s4), consistent(s4, handbuilt_usa) ; \+indep(s4)),
    consistent(s17, handbuilt_usa).

evidence(all_consistent(handbuilt_usa)).
query(true_val(handbuilt_usa, yes_handbuilt)).
query(true_val(handbuilt_usa, unk_handbuilt_usa)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_hazardous_waste=Zero_hazardous_waste_manufacturing unk_sustainability_certification=Unknown
% @importance 0.575

0.85::acc(s17, sustainability_certification).
0.85::acc(s19, sustainability_certification).

0.95::true_val(sustainability_certification, zero_hazardous_waste); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s17, sustainability_certification, zero_hazardous_waste).
measured(s19, sustainability_certification, zero_hazardous_waste).

all_consistent(sustainability_certification) :-
    consistent(s17, sustainability_certification),
    consistent(s19, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_hazardous_waste)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_renewable_power
% @type categorical
% @canonical false
% @original_name sustainability_certification (renewable power)
% @values pct89_wind_water=89pct_power_wind_or_water unk_sustainability_certification_renewable_power=Unknown
% @importance 0.50

0.75::acc(s20, sustainability_certification_renewable_power).
0.85::acc(s19, sustainability_certification_renewable_power).

0.90::true_val(sustainability_certification_renewable_power, pct89_wind_water); 0.10::true_val(sustainability_certification_renewable_power, unk_sustainability_certification_renewable_power).

measured(s20, sustainability_certification_renewable_power, pct89_wind_water).
measured(s19, sustainability_certification_renewable_power, pct89_wind_water).

all_consistent(sustainability_certification_renewable_power) :-
    consistent(s20, sustainability_certification_renewable_power),
    consistent(s19, sustainability_certification_renewable_power).

evidence(all_consistent(sustainability_certification_renewable_power)).
query(true_val(sustainability_certification_renewable_power, pct89_wind_water)).
query(true_val(sustainability_certification_renewable_power, unk_sustainability_certification_renewable_power)).

% @attr sustainability_certification_recycled_sidewalls
% @type categorical
% @canonical false
% @original_name sustainability_certification (recycled sidewalls)
% @values recycled_plastic_sidewalls=Sidewalls_from_recycled_plastic_scrap unk_sustainability_certification_recycled_sidewalls=Unknown
% @importance 0.45

0.75::acc(s20, sustainability_certification_recycled_sidewalls).

0.80::true_val(sustainability_certification_recycled_sidewalls, recycled_plastic_sidewalls); 0.20::true_val(sustainability_certification_recycled_sidewalls, unk_sustainability_certification_recycled_sidewalls).

measured(s20, sustainability_certification_recycled_sidewalls, recycled_plastic_sidewalls).

all_consistent(sustainability_certification_recycled_sidewalls) :-
    consistent(s20, sustainability_certification_recycled_sidewalls).

evidence(all_consistent(sustainability_certification_recycled_sidewalls)).
query(true_val(sustainability_certification_recycled_sidewalls, recycled_plastic_sidewalls)).
query(true_val(sustainability_certification_recycled_sidewalls, unk_sustainability_certification_recycled_sidewalls)).

% @attr mervin_brands
% @type categorical
% @canonical false
% @original_name Mervin brands
% @values lib_tech_gnu_bent_metal=Lib_Tech_GNU_Bent_Metal unk_mervin_brands=Unknown
% @importance 0.50

0.90::acc(s18, mervin_brands).

0.92::true_val(mervin_brands, lib_tech_gnu_bent_metal); 0.08::true_val(mervin_brands, unk_mervin_brands).

measured(s18, mervin_brands, lib_tech_gnu_bent_metal).

all_consistent(mervin_brands) :-
    consistent(s18, mervin_brands).

evidence(all_consistent(mervin_brands)).
query(true_val(mervin_brands, lib_tech_gnu_bent_metal)).
query(true_val(mervin_brands, unk_mervin_brands)).

% @attr mervin_acquisition
% @type categorical
% @canonical false
% @original_name Mervin recently acquired by Spring Capital Group (April 2026)
% @values spring_capital_apr2026=Spring_Capital_Group_April_2026 unk_mervin_acquisition=Unknown
% @importance 0.45

0.80::acc(s21, mervin_acquisition).

0.82::true_val(mervin_acquisition, spring_capital_apr2026); 0.18::true_val(mervin_acquisition, unk_mervin_acquisition).

measured(s21, mervin_acquisition, spring_capital_apr2026).

all_consistent(mervin_acquisition) :-
    consistent(s21, mervin_acquisition).

evidence(all_consistent(mervin_acquisition)).
query(true_val(mervin_acquisition, spring_capital_apr2026)).
query(true_val(mervin_acquisition, unk_mervin_acquisition)).

% @attr longest_running_factory
% @type categorical
% @canonical false
% @original_name Mervin is the longest-running major board factory in the USA
% @values yes_longest=Longest_running_major_board_factory_USA unk_longest_running_factory=Unknown
% @importance 0.575

0.70::acc(s7, longest_running_factory).
0.75::acc(s15, longest_running_factory).

0.90::true_val(longest_running_factory, yes_longest); 0.10::true_val(longest_running_factory, unk_longest_running_factory).

measured(s7, longest_running_factory, yes_longest).
measured(s15, longest_running_factory, yes_longest).

all_consistent(longest_running_factory) :-
    (indep(s7), consistent(s7, longest_running_factory) ; \+indep(s7)),
    consistent(s15, longest_running_factory).

evidence(all_consistent(longest_running_factory)).
query(true_val(longest_running_factory, yes_longest)).
query(true_val(longest_running_factory, unk_longest_running_factory)).

% @attr gnu_founding_year
% @type categorical
% @canonical false
% @original_name GNU has been crafting boards since 1977
% @values since_1977=Since_1977 unk_gnu_founding_year=Unknown
% @importance 0.80

0.65::acc(s4, gnu_founding_year).

0.82::true_val(gnu_founding_year, since_1977); 0.18::true_val(gnu_founding_year, unk_gnu_founding_year).

measured(s4, gnu_founding_year, since_1977).

all_consistent(gnu_founding_year) :-
    (indep(s4), consistent(s4, gnu_founding_year) ; \+indep(s4)).

evidence(all_consistent(gnu_founding_year)).
query(true_val(gnu_founding_year, since_1977)).
query(true_val(gnu_founding_year, unk_gnu_founding_year)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v629_99=629.99 unk_price_usd_msrp=Unknown
% @importance 0.975

0.95::acc(s1, price_usd_msrp).
0.85::acc(s22, price_usd_msrp).

0.97::true_val(price_usd_msrp, v629_99); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s1, price_usd_msrp, v629_99).
measured(s22, price_usd_msrp, v629_99).

all_consistent(price_usd_msrp) :-
    consistent(s1, price_usd_msrp),
    consistent(s22, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v629_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_gnu_sale
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at gnu.com (on sale 30% off)
% @values v440_99=440.99 unk_price_usd_gnu_sale=Unknown
% @importance 1.0

0.93::acc(s1, price_usd_gnu_sale).

0.93::true_val(price_usd_gnu_sale, v440_99); 0.07::true_val(price_usd_gnu_sale, unk_price_usd_gnu_sale).

measured(s1, price_usd_gnu_sale, v440_99).

all_consistent(price_usd_gnu_sale) :-
    consistent(s1, price_usd_gnu_sale).

evidence(all_consistent(price_usd_gnu_sale)).
query(true_val(price_usd_gnu_sale, v440_99)).
query(true_val(price_usd_gnu_sale, unk_price_usd_gnu_sale)).

% @attr price_usd_evo
% @type categorical
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v629_99_to_440_99=629.99_sale_to_440.99 unk_price_usd_evo=Unknown
% @importance 0.95

0.85::acc(s22, price_usd_evo).

0.90::true_val(price_usd_evo, v629_99_to_440_99); 0.10::true_val(price_usd_evo, unk_price_usd_evo).

measured(s22, price_usd_evo, v629_99_to_440_99).

all_consistent(price_usd_evo) :-
    consistent(s22, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v629_99_to_440_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_msrp_2025
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (2025 model)
% @values v699_99=699.99 unk_price_usd_msrp_2025=Unknown
% @importance 0.80

0.93::acc(s23, price_usd_msrp_2025).

0.93::true_val(price_usd_msrp_2025, v699_99); 0.07::true_val(price_usd_msrp_2025, unk_price_usd_msrp_2025).

measured(s23, price_usd_msrp_2025, v699_99).

all_consistent(price_usd_msrp_2025) :-
    consistent(s23, price_usd_msrp_2025).

evidence(all_consistent(price_usd_msrp_2025)).
query(true_val(price_usd_msrp_2025, v699_99)).
query(true_val(price_usd_msrp_2025, unk_price_usd_msrp_2025)).

% @attr price_usd_msrp_2023
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (2023 model)
% @values v659=659.0 unk_price_usd_msrp_2023=Unknown
% @importance 0.60

0.80::acc(s24, price_usd_msrp_2023).

0.82::true_val(price_usd_msrp_2023, v659); 0.18::true_val(price_usd_msrp_2023, unk_price_usd_msrp_2023).

measured(s24, price_usd_msrp_2023, v659).

all_consistent(price_usd_msrp_2023) :-
    consistent(s24, price_usd_msrp_2023).

evidence(all_consistent(price_usd_msrp_2023)).
query(true_val(price_usd_msrp_2023, v659)).
query(true_val(price_usd_msrp_2023, unk_price_usd_msrp_2023)).

% @attr price_usd_msrp_2019
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_msrp (2019-2022 model)
% @values v599=599.0 unk_price_usd_msrp_2019=Unknown
% @importance 0.50

0.80::acc(s25, price_usd_msrp_2019).

0.82::true_val(price_usd_msrp_2019, v599); 0.18::true_val(price_usd_msrp_2019, unk_price_usd_msrp_2019).

measured(s25, price_usd_msrp_2019, v599).

all_consistent(price_usd_msrp_2019) :-
    consistent(s25, price_usd_msrp_2019).

evidence(all_consistent(price_usd_msrp_2019)).
query(true_val(price_usd_msrp_2019, v599)).
query(true_val(price_usd_msrp_2019, unk_price_usd_msrp_2019)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical false
% @original_name price_aud_merchant
% @values v879_99=879.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.92::acc(sm, price_aud_merchant).

0.92::true_val(price_aud_merchant, v879_99); 0.08::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(sm, price_aud_merchant, v879_99).

all_consistent(price_aud_merchant) :-
    consistent(sm, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v879_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_ebay_new
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at eBay (new 2026, 157.5cm)
% @values v629_99=629.99 unk_price_usd_ebay_new=Unknown
% @importance 0.70

0.65::acc(s26, price_usd_ebay_new).

0.72::true_val(price_usd_ebay_new, v629_99); 0.28::true_val(price_usd_ebay_new, unk_price_usd_ebay_new).

measured(s26, price_usd_ebay_new, v629_99).

all_consistent(price_usd_ebay_new) :-
    consistent(s26, price_usd_ebay_new).

evidence(all_consistent(price_usd_ebay_new)).
query(true_val(price_usd_ebay_new, v629_99)).
query(true_val(price_usd_ebay_new, unk_price_usd_ebay_new)).

% @attr price_usd_ebay_used
% @type numeric
% @unit USD
% @canonical false
% @original_name Price at eBay (prior year used)
% @values v185=185.0 unk_price_usd_ebay_used=Unknown
% @importance 0.70

0.55::acc(s26, price_usd_ebay_used).

0.60::true_val(price_usd_ebay_used, v185); 0.40::true_val(price_usd_ebay_used, unk_price_usd_ebay_used).

measured(s26, price_usd_ebay_used, v185).

all_consistent(price_usd_ebay_used) :-
    consistent(s26, price_usd_ebay_used).

evidence(all_consistent(price_usd_ebay_used)).
query(true_val(price_usd_ebay_used, v185)).
query(true_val(price_usd_ebay_used, unk_price_usd_ebay_used)).

% @attr competitor_price_comparison
% @type categorical
% @canonical false
% @original_name Comparable competitors typically cost $80 less
% @values competitors_80_less=Competitors_typically_80_less unk_competitor_price_comparison=Unknown
% @importance 0.80

0.55::acc(s27, competitor_price_comparison).

0.55::true_val(competitor_price_comparison, competitors_80_less); 0.45::true_val(competitor_price_comparison, unk_competitor_price_comparison).

measured(s27, competitor_price_comparison, competitors_80_less).

all_consistent(competitor_price_comparison) :-
    consistent(s27, competitor_price_comparison).

evidence(all_consistent(competitor_price_comparison)).
query(true_val(competitor_price_comparison, competitors_80_less)).
query(true_val(competitor_price_comparison, unk_competitor_price_comparison)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values widely_available=Widely_available_multiple_retailers unk_availability_status=Unknown
% @importance 0.60

0.93::acc(s1, availability_status).
0.70::acc(s3, availability_status).
0.70::acc(s5, availability_status).
0.65::acc(s6, availability_status).
0.75::acc(sm, availability_status).
0.70::acc(s11, availability_status).
0.70::acc(s12, availability_status).
0.60::acc(s26, availability_status).

0.97::true_val(availability_status, widely_available); 0.03::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, widely_available).
measured(s3, availability_status, widely_available).
measured(s5, availability_status, widely_available).
measured(s6, availability_status, widely_available).
measured(sm, availability_status, widely_available).
measured(s11, availability_status, widely_available).
measured(s12, availability_status, widely_available).
measured(s26, availability_status, widely_available).

all_consistent(availability_status) :-
    consistent(s1, availability_status),
    (indep(s3), consistent(s3, availability_status) ; \+indep(s3)),
    (indep(s5), consistent(s5, availability_status) ; \+indep(s5)),
    (indep(s6), consistent(s6, availability_status) ; \+indep(s6)),
    (indep(sm), consistent(sm, availability_status) ; \+indep(sm)),
    (indep(s11), consistent(s11, availability_status) ; \+indep(s11)),
    (indep(s12), consistent(s12, availability_status) ; \+indep(s12)),
    consistent(s26, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, widely_available)).
query(true_val(availability_status, unk_availability_status)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values at_least_2005=At_least_2005 unk_model_first_available_year=Unknown
% @importance 0.40

0.50::acc(s28, model_first_available_year).

0.50::true_val(model_first_available_year, at_least_2005); 0.50::true_val(model_first_available_year, unk_model_first_available_year).

measured(s28, model_first_available_year, at_least_2005).

all_consistent(model_first_available_year) :-
    consistent(s28, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, at_least_2005)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr good_wood_2008
% @type categorical
% @canonical false
% @original_name Won Transworld Good Wood award 2008
% @values yes_gw_2008=Won_Good_Wood_2008_three_peat_by_2009 unk_good_wood_2008=Unknown
% @importance 0.50

0.70::acc(s29, good_wood_2008).
0.78::acc(s30, good_wood_2008).

0.90::true_val(good_wood_2008, yes_gw_2008); 0.10::true_val(good_wood_2008, unk_good_wood_2008).

measured(s29, good_wood_2008, yes_gw_2008).
measured(s30, good_wood_2008, yes_gw_2008).

all_consistent(good_wood_2008) :-
    consistent(s29, good_wood_2008),
    (indep(s30), consistent(s30, good_wood_2008) ; \+indep(s30)).

evidence(all_consistent(good_wood_2008)).
query(true_val(good_wood_2008, yes_gw_2008)).
query(true_val(good_wood_2008, unk_good_wood_2008)).

% @attr good_wood_2012
% @type categorical
% @canonical false
% @original_name Won Transworld Good Wood award 2012
% @values yes_gw_2012=Won_Good_Wood_2012 unk_good_wood_2012=Unknown
% @importance 0.45

0.78::acc(s31, good_wood_2012).

0.78::true_val(good_wood_2012, yes_gw_2012); 0.22::true_val(good_wood_2012, unk_good_wood_2012).

measured(s31, good_wood_2012, yes_gw_2012).

all_consistent(good_wood_2012) :-
    (indep(s31), consistent(s31, good_wood_2012) ; \+indep(s31)).

evidence(all_consistent(good_wood_2012)).
query(true_val(good_wood_2012, yes_gw_2012)).
query(true_val(good_wood_2012, unk_good_wood_2012)).

% @attr good_wood_2015
% @type categorical
% @canonical false
% @original_name Won Transworld Good Wood award 2015
% @values yes_gw_2015=Won_Good_Wood_2015_AM_over_450 unk_good_wood_2015=Unknown
% @importance 0.50

0.90::acc(s32, good_wood_2015).

0.90::true_val(good_wood_2015, yes_gw_2015); 0.10::true_val(good_wood_2015, unk_good_wood_2015).

measured(s32, good_wood_2015, yes_gw_2015).

all_consistent(good_wood_2015) :-
    consistent(s32, good_wood_2015).

evidence(all_consistent(good_wood_2015)).
query(true_val(good_wood_2015, yes_gw_2015)).
query(true_val(good_wood_2015, unk_good_wood_2015)).

% @attr perpetual_award_winner
% @type categorical
% @canonical false
% @original_name Described as a perpetual award winner
% @values yes_perpetual=Perpetual_award_winner unk_perpetual_award_winner=Unknown
% @importance 0.40

0.70::acc(s33, perpetual_award_winner).

0.70::true_val(perpetual_award_winner, yes_perpetual); 0.30::true_val(perpetual_award_winner, unk_perpetual_award_winner).

measured(s33, perpetual_award_winner, yes_perpetual).

all_consistent(perpetual_award_winner) :-
    (indep(s33), consistent(s33, perpetual_award_winner) ; \+indep(s33)).

evidence(all_consistent(perpetual_award_winner)).
query(true_val(perpetual_award_winner, yes_perpetual)).
query(true_val(perpetual_award_winner, unk_perpetual_award_winner)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @unit /100
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @values v88_3=88.3 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.95

0.90::acc(s34, overall_rating_snowboardingprofiles).

0.92::true_val(overall_rating_snowboardingprofiles, v88_3); 0.08::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s34, overall_rating_snowboardingprofiles, v88_3).

all_consistent(overall_rating_snowboardingprofiles) :-
    consistent(s34, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v88_3)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr overall_rating_sp_2023
% @type numeric
% @unit /100
% @canonical false
% @original_name overall_rating_snowboardingprofiles (2023 model)
% @values v89_9=89.9 unk_overall_rating_sp_2023=Unknown
% @importance 0.75

0.85::acc(s35, overall_rating_sp_2023).

0.87::true_val(overall_rating_sp_2023, v89_9); 0.13::true_val(overall_rating_sp_2023, unk_overall_rating_sp_2023).

measured(s35, overall_rating_sp_2023, v89_9).

all_consistent(overall_rating_sp_2023) :-
    consistent(s35, overall_rating_sp_2023).

evidence(all_consistent(overall_rating_sp_2023)).
query(true_val(overall_rating_sp_2023, v89_9)).
query(true_val(overall_rating_sp_2023, unk_overall_rating_sp_2023)).

% @attr overall_rating_sp_2019
% @type numeric
% @unit /100
% @canonical false
% @original_name overall_rating_snowboardingprofiles (2019-2022 model)
% @values v90_8=90.8 unk_overall_rating_sp_2019=Unknown
% @importance 0.65

0.82::acc(s36, overall_rating_sp_2019).

0.85::true_val(overall_rating_sp_2019, v90_8); 0.15::true_val(overall_rating_sp_2019, unk_overall_rating_sp_2019).

measured(s36, overall_rating_sp_2019, v90_8).

all_consistent(overall_rating_sp_2019) :-
    consistent(s36, overall_rating_sp_2019).

evidence(all_consistent(overall_rating_sp_2019)).
query(true_val(overall_rating_sp_2019, v90_8)).
query(true_val(overall_rating_sp_2019, unk_overall_rating_sp_2019)).

% @attr ranking_sp_2026
% @type categorical
% @canonical false
% @original_name Ranked #3 out of 33 all-mountain freestyle boards (2026)
% @values rank3_of_33=Rank_3_of_33 unk_ranking_sp_2026=Unknown
% @importance 0.95

0.88::acc(s34, ranking_sp_2026).

0.88::true_val(ranking_sp_2026, rank3_of_33); 0.12::true_val(ranking_sp_2026, unk_ranking_sp_2026).

measured(s34, ranking_sp_2026, rank3_of_33).

all_consistent(ranking_sp_2026) :-
    consistent(s34, ranking_sp_2026).

evidence(all_consistent(ranking_sp_2026)).
query(true_val(ranking_sp_2026, rank3_of_33)).
query(true_val(ranking_sp_2026, unk_ranking_sp_2026)).

% @attr ranking_sp_2023
% @type categorical
% @canonical false
% @original_name Ranked #2 out of 27 all-mountain freestyle boards (2023)
% @values rank2_of_27=Rank_2_of_27 unk_ranking_sp_2023=Unknown
% @importance 0.75

0.82::acc(s35, ranking_sp_2023).

0.85::true_val(ranking_sp_2023, rank2_of_27); 0.15::true_val(ranking_sp_2023, unk_ranking_sp_2023).

measured(s35, ranking_sp_2023, rank2_of_27).

all_consistent(ranking_sp_2023) :-
    consistent(s35, ranking_sp_2023).

evidence(all_consistent(ranking_sp_2023)).
query(true_val(ranking_sp_2023, rank2_of_27)).
query(true_val(ranking_sp_2023, unk_ranking_sp_2023)).

% @attr ranking_sp_2019
% @type categorical
% @canonical false
% @original_name Ranked #2 out of 28 all-mountain freestyle boards (2019-2022)
% @values rank2_of_28=Rank_2_of_28 unk_ranking_sp_2019=Unknown
% @importance 0.65

0.82::acc(s36, ranking_sp_2019).

0.82::true_val(ranking_sp_2019, rank2_of_28); 0.18::true_val(ranking_sp_2019, unk_ranking_sp_2019).

measured(s36, ranking_sp_2019, rank2_of_28).

all_consistent(ranking_sp_2019) :-
    consistent(s36, ranking_sp_2019).

evidence(all_consistent(ranking_sp_2019)).
query(true_val(ranking_sp_2019, rank2_of_28)).
query(true_val(ranking_sp_2019, unk_ranking_sp_2019)).

% @attr user_rating_gnu
% @type categorical
% @canonical false
% @original_name User rating on gnu.com
% @values pct100_31_reviews=100pct_of_100_31_reviews unk_user_rating_gnu=Unknown
% @importance 1.0

0.88::acc(s1, user_rating_gnu).

0.88::true_val(user_rating_gnu, pct100_31_reviews); 0.12::true_val(user_rating_gnu, unk_user_rating_gnu).

measured(s1, user_rating_gnu, pct100_31_reviews).

all_consistent(user_rating_gnu) :-
    consistent(s1, user_rating_gnu).

evidence(all_consistent(user_rating_gnu)).
query(true_val(user_rating_gnu, pct100_31_reviews)).
query(true_val(user_rating_gnu, unk_user_rating_gnu)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values eight_sizes=151.5_154.5_155W_157.5_158W_159.5_161.5_162W four_merchant=154.5_157.5_155W_158W
% @importance 0.925

0.95::acc(s1, available_sizes).
0.88::acc(sm, available_sizes).

0.60::true_val(available_sizes, eight_sizes); 0.40::true_val(available_sizes, four_merchant).

measured(s1, available_sizes, eight_sizes).
measured(sm, available_sizes, four_merchant).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes),
    (indep(sm), consistent(sm, available_sizes) ; \+indep(sm)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, eight_sizes)).
query(true_val(available_sizes, four_merchant)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.88::acc(sm, width_options).

0.90::true_val(width_options, standard_and_wide); 0.10::true_val(width_options, unk_width_options).

measured(sm, width_options, standard_and_wide).

all_consistent(width_options) :-
    consistent(sm, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values asym_twin=Asym_Twin unk_shape=Unknown
% @importance 0.925

0.95::acc(s1, shape).
0.85::acc(sm, shape).

0.97::true_val(shape, asym_twin); 0.03::true_val(shape, unk_shape).

measured(s1, shape, asym_twin).
measured(sm, shape, asym_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(sm), consistent(sm, shape) ; \+indep(sm)).

evidence(all_consistent(shape)).
query(true_val(shape, asym_twin)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c2x=C2x_rocker_between_feet_camber_to_tips unk_camber_type=Unknown
% @importance 0.925

0.95::acc(s1, camber_type).
0.85::acc(sm, camber_type).

0.97::true_val(camber_type, c2x); 0.03::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, c2x).
measured(sm, camber_type, c2x).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(sm), consistent(sm, camber_type) ; \+indep(sm)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, c2x)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values shorter_aggressive_banana_rocker=Shorter_more_aggressive_banana_rocker_cambers_underfoot unk_camber_description=Unknown
% @importance 0.90

0.80::acc(s2, camber_description).

0.80::true_val(camber_description, shorter_aggressive_banana_rocker); 0.20::true_val(camber_description, unk_camber_description).

measured(s2, camber_description, shorter_aggressive_banana_rocker).

all_consistent(camber_description) :-
    (indep(s2), consistent(s2, camber_description) ; \+indep(s2)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, shorter_aggressive_banana_rocker)).
query(true_val(camber_description, unk_camber_description)).

% @attr setback
% @type numeric
% @unit inches
% @canonical true
% @original_name setback
% @values v0=0.0 unk_setback=Unknown
% @importance 0.925

0.95::acc(s1, setback).
0.85::acc(sm, setback).

0.97::true_val(setback, v0); 0.03::true_val(setback, unk_setback).

measured(s1, setback, v0).
measured(sm, setback, v0).

all_consistent(setback) :-
    consistent(s1, setback),
    (indep(sm), consistent(sm, setback) ; \+indep(sm)).

evidence(all_consistent(setback)).
query(true_val(setback, v0)).
query(true_val(setback, unk_setback)).

% @attr asymmetry_level
% @type categorical
% @canonical false
% @original_name Asymmetry level
% @values level_2_asym=Level_2_Asym unk_asymmetry_level=Unknown
% @importance 0.825

0.85::acc(sm, asymmetry_level).
0.80::acc(s10_b, asymmetry_level).

0.90::true_val(asymmetry_level, level_2_asym); 0.10::true_val(asymmetry_level, unk_asymmetry_level).

measured(sm, asymmetry_level, level_2_asym).

all_consistent(asymmetry_level) :-
    consistent(sm, asymmetry_level).

evidence(all_consistent(asymmetry_level)).
query(true_val(asymmetry_level, level_2_asym)).
query(true_val(asymmetry_level, unk_asymmetry_level)).

% @attr flex_rating_10_manufacturer
% @type categorical
% @canonical true
% @original_name flex_rating_10_manufacturer
% @values varies_5_5_to_7=5.5_small_to_7_large_by_size unk_flex_rating_10_manufacturer=Unknown
% @importance 1.0

0.93::acc(s1, flex_rating_10_manufacturer).

0.93::true_val(flex_rating_10_manufacturer, varies_5_5_to_7); 0.07::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s1, flex_rating_10_manufacturer, varies_5_5_to_7).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s1, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, varies_5_5_to_7)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v5=5.0 v5_5_to_7=5.5_to_7.0
% @importance 0.925

0.75::acc(sm, flex_rating_10).
0.93::acc(s1, flex_rating_10).

0.35::true_val(flex_rating_10, v5); 0.65::true_val(flex_rating_10, v5_5_to_7).

measured(sm, flex_rating_10, v5).
measured(s1, flex_rating_10, v5_5_to_7).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    (indep(sm), consistent(sm, flex_rating_10) ; \+indep(sm)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v5)).
query(true_val(flex_rating_10, v5_5_to_7)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_6=Medium_6_of_10 medium_5=Medium_5_of_10 slightly_stiffer_medium=Slightly_stiffer_than_medium
% @importance 0.817

0.88::acc(s34, flex_feel).
0.78::acc(s36, flex_feel).
0.82::acc(s39, flex_feel).

0.40::true_val(flex_feel, medium_6); 0.30::true_val(flex_feel, medium_5); 0.30::true_val(flex_feel, slightly_stiffer_medium).

measured(s34, flex_feel, medium_6).
measured(s36, flex_feel, medium_5).
measured(s39, flex_feel, slightly_stiffer_medium).

all_consistent(flex_feel) :-
    consistent(s34, flex_feel),
    consistent(s36, flex_feel),
    consistent(s39, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_6)).
query(true_val(flex_feel, medium_5)).
query(true_val(flex_feel, slightly_stiffer_medium)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.925

0.95::acc(s1, mounting_pattern).
0.85::acc(sm, mounting_pattern).

0.97::true_val(mounting_pattern, inserts_2x4); 0.03::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).
measured(sm, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    consistent(s1, mounting_pattern),
    (indep(sm), consistent(sm, mounting_pattern) ; \+indep(sm)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr contact_length_size_151_5
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size (151.5)
% @values v1130=1130.0 unk_contact_length_size_151_5=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_151_5).

0.93::true_val(contact_length_size_151_5, v1130); 0.07::true_val(contact_length_size_151_5, unk_contact_length_size_151_5).

measured(s1, contact_length_size_151_5, v1130).

all_consistent(contact_length_size_151_5) :-
    consistent(s1, contact_length_size_151_5).

evidence(all_consistent(contact_length_size_151_5)).
query(true_val(contact_length_size_151_5, v1130)).
query(true_val(contact_length_size_151_5, unk_contact_length_size_151_5)).

% @attr contact_length_size_154_5
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size (154.5)
% @values v1160=1160.0 unk_contact_length_size_154_5=Unknown
% @importance 0.925

0.93::acc(s1, contact_length_size_154_5).
0.85::acc(sm, contact_length_size_154_5).

0.97::true_val(contact_length_size_154_5, v1160); 0.03::true_val(contact_length_size_154_5, unk_contact_length_size_154_5).

measured(s1, contact_length_size_154_5, v1160).
measured(sm, contact_length_size_154_5, v1160).

all_consistent(contact_length_size_154_5) :-
    consistent(s1, contact_length_size_154_5),
    (indep(sm), consistent(sm, contact_length_size_154_5) ; \+indep(sm)).

evidence(all_consistent(contact_length_size_154_5)).
query(true_val(contact_length_size_154_5, v1160)).
query(true_val(contact_length_size_154_5, unk_contact_length_size_154_5)).

% @attr contact_length_size_155w
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size (155W)
% @values v1160=1160.0 unk_contact_length_size_155w=Unknown
% @importance 0.925

0.93::acc(s1, contact_length_size_155w).
0.85::acc(sm, contact_length_size_155w).

0.97::true_val(contact_length_size_155w, v1160); 0.03::true_val(contact_length_size_155w, unk_contact_length_size_155w).

measured(s1, contact_length_size_155w, v1160).
measured(sm, contact_length_size_155w, v1160).

all_consistent(contact_length_size_155w) :-
    consistent(s1, contact_length_size_155w),
    (indep(sm), consistent(sm, contact_length_size_155w) ; \+indep(sm)).

evidence(all_consistent(contact_length_size_155w)).
query(true_val(contact_length_size_155w, v1160)).
query(true_val(contact_length_size_155w, unk_contact_length_size_155w)).

% @attr contact_length_size
% @type numeric
% @unit mm
% @canonical true
% @original_name contact_length_size (157.5)
% @values v1190=1190.0 unk_contact_length_size=Unknown
% @importance 0.925

0.93::acc(s1, contact_length_size).
0.85::acc(sm, contact_length_size).

0.97::true_val(contact_length_size, v1190); 0.03::true_val(contact_length_size, unk_contact_length_size).

measured(s1, contact_length_size, v1190).
measured(sm, contact_length_size, v1190).

all_consistent(contact_length_size) :-
    consistent(s1, contact_length_size),
    (indep(sm), consistent(sm, contact_length_size) ; \+indep(sm)).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v1190)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr contact_length_size_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size (158W)
% @values v1190=1190.0 unk_contact_length_size_158w=Unknown
% @importance 0.925

0.93::acc(s1, contact_length_size_158w).
0.85::acc(sm, contact_length_size_158w).

0.97::true_val(contact_length_size_158w, v1190); 0.03::true_val(contact_length_size_158w, unk_contact_length_size_158w).

measured(s1, contact_length_size_158w, v1190).
measured(sm, contact_length_size_158w, v1190).

all_consistent(contact_length_size_158w) :-
    consistent(s1, contact_length_size_158w),
    (indep(sm), consistent(sm, contact_length_size_158w) ; \+indep(sm)).

evidence(all_consistent(contact_length_size_158w)).
query(true_val(contact_length_size_158w, v1190)).
query(true_val(contact_length_size_158w, unk_contact_length_size_158w)).

% @attr contact_length_size_159_5
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size (159.5)
% @values v1200=1200.0 unk_contact_length_size_159_5=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_159_5).

0.93::true_val(contact_length_size_159_5, v1200); 0.07::true_val(contact_length_size_159_5, unk_contact_length_size_159_5).

measured(s1, contact_length_size_159_5, v1200).

all_consistent(contact_length_size_159_5) :-
    consistent(s1, contact_length_size_159_5).

evidence(all_consistent(contact_length_size_159_5)).
query(true_val(contact_length_size_159_5, v1200)).
query(true_val(contact_length_size_159_5, unk_contact_length_size_159_5)).

% @attr contact_length_size_161_5
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size (161.5)
% @values v1220=1220.0 unk_contact_length_size_161_5=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_161_5).

0.93::true_val(contact_length_size_161_5, v1220); 0.07::true_val(contact_length_size_161_5, unk_contact_length_size_161_5).

measured(s1, contact_length_size_161_5, v1220).

all_consistent(contact_length_size_161_5) :-
    consistent(s1, contact_length_size_161_5).

evidence(all_consistent(contact_length_size_161_5)).
query(true_val(contact_length_size_161_5, v1220)).
query(true_val(contact_length_size_161_5, unk_contact_length_size_161_5)).

% @attr contact_length_size_162w
% @type numeric
% @unit mm
% @canonical false
% @original_name contact_length_size (162W)
% @values v1220=1220.0 unk_contact_length_size_162w=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_162w).

0.93::true_val(contact_length_size_162w, v1220); 0.07::true_val(contact_length_size_162w, unk_contact_length_size_162w).

measured(s1, contact_length_size_162w, v1220).

all_consistent(contact_length_size_162w) :-
    consistent(s1, contact_length_size_162w).

evidence(all_consistent(contact_length_size_162w)).
query(true_val(contact_length_size_162w, v1220)).
query(true_val(contact_length_size_162w, unk_contact_length_size_162w)).

% @attr sidecut_radius_size_154_5
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (154.5)
% @values v7_7_8_1=7.7_8.1m_asym unk_sidecut_radius_size_154_5=Unknown
% @importance 0.925

0.93::acc(s1, sidecut_radius_size_154_5).
0.85::acc(sm, sidecut_radius_size_154_5).

0.97::true_val(sidecut_radius_size_154_5, v7_7_8_1); 0.03::true_val(sidecut_radius_size_154_5, unk_sidecut_radius_size_154_5).

measured(s1, sidecut_radius_size_154_5, v7_7_8_1).
measured(sm, sidecut_radius_size_154_5, v7_7_8_1).

all_consistent(sidecut_radius_size_154_5) :-
    consistent(s1, sidecut_radius_size_154_5),
    (indep(sm), consistent(sm, sidecut_radius_size_154_5) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_154_5)).
query(true_val(sidecut_radius_size_154_5, v7_7_8_1)).
query(true_val(sidecut_radius_size_154_5, unk_sidecut_radius_size_154_5)).

% @attr sidecut_radius_size
% @type categorical
% @unit m
% @canonical true
% @original_name sidecut_radius_size (157.5)
% @values v7_8_8_2=7.8_8.2m_asym unk_sidecut_radius_size=Unknown
% @importance 0.925

0.93::acc(s1, sidecut_radius_size).
0.85::acc(sm, sidecut_radius_size).

0.97::true_val(sidecut_radius_size, v7_8_8_2); 0.03::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v7_8_8_2).
measured(sm, sidecut_radius_size, v7_8_8_2).

all_consistent(sidecut_radius_size) :-
    consistent(s1, sidecut_radius_size),
    (indep(sm), consistent(sm, sidecut_radius_size) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_8_8_2)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_155w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (155W)
% @values v7_7_8_1=7.7_8.1m_asym unk_sidecut_radius_size_155w=Unknown
% @importance 0.925

0.93::acc(s1, sidecut_radius_size_155w).
0.85::acc(sm, sidecut_radius_size_155w).

0.97::true_val(sidecut_radius_size_155w, v7_7_8_1); 0.03::true_val(sidecut_radius_size_155w, unk_sidecut_radius_size_155w).

measured(s1, sidecut_radius_size_155w, v7_7_8_1).
measured(sm, sidecut_radius_size_155w, v7_7_8_1).

all_consistent(sidecut_radius_size_155w) :-
    consistent(s1, sidecut_radius_size_155w),
    (indep(sm), consistent(sm, sidecut_radius_size_155w) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_155w)).
query(true_val(sidecut_radius_size_155w, v7_7_8_1)).
query(true_val(sidecut_radius_size_155w, unk_sidecut_radius_size_155w)).

% @attr sidecut_radius_size_158w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (158W)
% @values v7_8_8_2=7.8_8.2m_asym unk_sidecut_radius_size_158w=Unknown
% @importance 0.925

0.93::acc(s1, sidecut_radius_size_158w).
0.85::acc(sm, sidecut_radius_size_158w).

0.97::true_val(sidecut_radius_size_158w, v7_8_8_2); 0.03::true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w).

measured(s1, sidecut_radius_size_158w, v7_8_8_2).
measured(sm, sidecut_radius_size_158w, v7_8_8_2).

all_consistent(sidecut_radius_size_158w) :-
    consistent(s1, sidecut_radius_size_158w),
    (indep(sm), consistent(sm, sidecut_radius_size_158w) ; \+indep(sm)).

evidence(all_consistent(sidecut_radius_size_158w)).
query(true_val(sidecut_radius_size_158w, v7_8_8_2)).
query(true_val(sidecut_radius_size_158w, unk_sidecut_radius_size_158w)).

% @attr sidecut_radius_size_159_5
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (159.5)
% @values v7_9_8_2=7.9_8.2m_asym unk_sidecut_radius_size_159_5=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_159_5).

0.93::true_val(sidecut_radius_size_159_5, v7_9_8_2); 0.07::true_val(sidecut_radius_size_159_5, unk_sidecut_radius_size_159_5).

measured(s1, sidecut_radius_size_159_5, v7_9_8_2).

all_consistent(sidecut_radius_size_159_5) :-
    consistent(s1, sidecut_radius_size_159_5).

evidence(all_consistent(sidecut_radius_size_159_5)).
query(true_val(sidecut_radius_size_159_5, v7_9_8_2)).
query(true_val(sidecut_radius_size_159_5, unk_sidecut_radius_size_159_5)).

% @attr sidecut_radius_size_151_5
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (151.5)
% @values v7_9_8_0=7.9_8.0m_asym unk_sidecut_radius_size_151_5=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_151_5).

0.93::true_val(sidecut_radius_size_151_5, v7_9_8_0); 0.07::true_val(sidecut_radius_size_151_5, unk_sidecut_radius_size_151_5).

measured(s1, sidecut_radius_size_151_5, v7_9_8_0).

all_consistent(sidecut_radius_size_151_5) :-
    consistent(s1, sidecut_radius_size_151_5).

evidence(all_consistent(sidecut_radius_size_151_5)).
query(true_val(sidecut_radius_size_151_5, v7_9_8_0)).
query(true_val(sidecut_radius_size_151_5, unk_sidecut_radius_size_151_5)).

% @attr sidecut_radius_size_161_5
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (161.5)
% @values v8_0_8_4=8.0_8.4m_asym unk_sidecut_radius_size_161_5=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_161_5).

0.93::true_val(sidecut_radius_size_161_5, v8_0_8_4); 0.07::true_val(sidecut_radius_size_161_5, unk_sidecut_radius_size_161_5).

measured(s1, sidecut_radius_size_161_5, v8_0_8_4).

all_consistent(sidecut_radius_size_161_5) :-
    consistent(s1, sidecut_radius_size_161_5).

evidence(all_consistent(sidecut_radius_size_161_5)).
query(true_val(sidecut_radius_size_161_5, v8_0_8_4)).
query(true_val(sidecut_radius_size_161_5, unk_sidecut_radius_size_161_5)).

% @attr sidecut_radius_size_162w
% @type categorical
% @unit m
% @canonical false
% @original_name sidecut_radius_size (162W)
% @values v8_0_8_4=8.0_8.4m_asym unk_sidecut_radius_size_162w=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_162w).

0.93::true_val(sidecut_radius_size_162w, v8_0_8_4); 0.07::true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w).

measured(s1, sidecut_radius_size_162w, v8_0_8_4).

all_consistent(sidecut_radius_size_162w) :-
    consistent(s1, sidecut_radius_size_162w).

evidence(all_consistent(sidecut_radius_size_162w)).
query(true_val(sidecut_radius_size_162w, v8_0_8_4)).
query(true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w)).

% @attr tip_tail_width_size_154_5
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (154.5)
% @values v293=293.0 unk_tip_tail_width_size_154_5=Unknown
% @importance 0.925

0.93::acc(s1, tip_tail_width_size_154_5).
0.85::acc(sm, tip_tail_width_size_154_5).

0.97::true_val(tip_tail_width_size_154_5, v293); 0.03::true_val(tip_tail_width_size_154_5, unk_tip_tail_width_size_154_5).

measured(s1, tip_tail_width_size_154_5, v293).
measured(sm, tip_tail_width_size_154_5, v293).

all_consistent(tip_tail_width_size_154_5) :-
    consistent(s1, tip_tail_width_size_154_5),
    (indep(sm), consistent(sm, tip_tail_width_size_154_5) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size_154_5)).
query(true_val(tip_tail_width_size_154_5, v293)).
query(true_val(tip_tail_width_size_154_5, unk_tip_tail_width_size_154_5)).

% @attr tip_tail_width_size
% @type numeric
% @unit mm
% @canonical true
% @original_name tip_tail_width_size (157.5)
% @values v299=299.0 unk_tip_tail_width_size=Unknown
% @importance 0.925

0.93::acc(s1, tip_tail_width_size).
0.85::acc(sm, tip_tail_width_size).

0.97::true_val(tip_tail_width_size, v299); 0.03::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v299).
measured(sm, tip_tail_width_size, v299).

all_consistent(tip_tail_width_size) :-
    consistent(s1, tip_tail_width_size),
    (indep(sm), consistent(sm, tip_tail_width_size) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v299)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_155w
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (155W)
% @values v307=307.0 unk_tip_tail_width_size_155w=Unknown
% @importance 0.925

0.93::acc(s1, tip_tail_width_size_155w).
0.85::acc(sm, tip_tail_width_size_155w).

0.97::true_val(tip_tail_width_size_155w, v307); 0.03::true_val(tip_tail_width_size_155w, unk_tip_tail_width_size_155w).

measured(s1, tip_tail_width_size_155w, v307).
measured(sm, tip_tail_width_size_155w, v307).

all_consistent(tip_tail_width_size_155w) :-
    consistent(s1, tip_tail_width_size_155w),
    (indep(sm), consistent(sm, tip_tail_width_size_155w) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size_155w)).
query(true_val(tip_tail_width_size_155w, v307)).
query(true_val(tip_tail_width_size_155w, unk_tip_tail_width_size_155w)).

% @attr tip_tail_width_size_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name tip_tail_width_size (158W)
% @values v312=312.0 unk_tip_tail_width_size_158w=Unknown
% @importance 0.925

0.93::acc(s1, tip_tail_width_size_158w).
0.85::acc(sm, tip_tail_width_size_158w).

0.97::true_val(tip_tail_width_size_158w, v312); 0.03::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).

measured(s1, tip_tail_width_size_158w, v312).
measured(sm, tip_tail_width_size_158w, v312).

all_consistent(tip_tail_width_size_158w) :-
    consistent(s1, tip_tail_width_size_158w),
    (indep(sm), consistent(sm, tip_tail_width_size_158w) ; \+indep(sm)).

evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v312)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

% @attr waist_width_154_5
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 154.5
% @values v252=252.0 unk_waist_width_154_5=Unknown
% @importance 0.925

0.93::acc(s1, waist_width_154_5).
0.85::acc(sm, waist_width_154_5).

0.97::true_val(waist_width_154_5, v252); 0.03::true_val(waist_width_154_5, unk_waist_width_154_5).

measured(s1, waist_width_154_5, v252).
measured(sm, waist_width_154_5, v252).

all_consistent(waist_width_154_5) :-
    consistent(s1, waist_width_154_5),
    (indep(sm), consistent(sm, waist_width_154_5) ; \+indep(sm)).

evidence(all_consistent(waist_width_154_5)).
query(true_val(waist_width_154_5, v252)).
query(true_val(waist_width_154_5, unk_waist_width_154_5)).

% @attr waist_width_157_5
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 157.5
% @values v255=255.0 unk_waist_width_157_5=Unknown
% @importance 0.925

0.93::acc(s1, waist_width_157_5).
0.85::acc(sm, waist_width_157_5).

0.97::true_val(waist_width_157_5, v255); 0.03::true_val(waist_width_157_5, unk_waist_width_157_5).

measured(s1, waist_width_157_5, v255).
measured(sm, waist_width_157_5, v255).

all_consistent(waist_width_157_5) :-
    consistent(s1, waist_width_157_5),
    (indep(sm), consistent(sm, waist_width_157_5) ; \+indep(sm)).

evidence(all_consistent(waist_width_157_5)).
query(true_val(waist_width_157_5, v255)).
query(true_val(waist_width_157_5, unk_waist_width_157_5)).

% @attr waist_width_155w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 155W
% @values v265=265.0 unk_waist_width_155w=Unknown
% @importance 0.925

0.93::acc(s1, waist_width_155w).
0.85::acc(sm, waist_width_155w).

0.97::true_val(waist_width_155w, v265); 0.03::true_val(waist_width_155w, unk_waist_width_155w).

measured(s1, waist_width_155w, v265).
measured(sm, waist_width_155w, v265).

all_consistent(waist_width_155w) :-
    consistent(s1, waist_width_155w),
    (indep(sm), consistent(sm, waist_width_155w) ; \+indep(sm)).

evidence(all_consistent(waist_width_155w)).
query(true_val(waist_width_155w, v265)).
query(true_val(waist_width_155w, unk_waist_width_155w)).

% @attr waist_width_158w
% @type numeric
% @unit mm
% @canonical false
% @original_name Waist width 158W
% @values v268=268.0 unk_waist_width_158w=Unknown
% @importance 0.925

0.93::acc(s1, waist_width_158w).
0.85::acc(sm, waist_width_158w).

0.97::true_val(waist_width_158w, v268); 0.03::true_val(waist_width_158w, unk_waist_width_158w).

measured(s1, waist_width_158w, v268).
measured(sm, waist_width_158w, v268).

all_consistent(waist_width_158w) :-
    consistent(s1, waist_width_158w),
    (indep(sm), consistent(sm, waist_width_158w) ; \+indep(sm)).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v268)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr stance_width_range_size
% @type categorical
% @unit inches
% @canonical true
% @original_name stance_width_range_size (standard)
% @values v20_25_to_25_0=20.25_to_25.0_inches unk_stance_width_range_size=Unknown
% @importance 0.925

0.93::acc(s1, stance_width_range_size).
0.85::acc(sm, stance_width_range_size).

0.97::true_val(stance_width_range_size, v20_25_to_25_0); 0.03::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, v20_25_to_25_0).
measured(sm, stance_width_range_size, v20_25_to_25_0).

all_consistent(stance_width_range_size) :-
    consistent(s1, stance_width_range_size),
    (indep(sm), consistent(sm, stance_width_range_size) ; \+indep(sm)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v20_25_to_25_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_wide
% @type categorical
% @unit inches
% @canonical false
% @original_name stance_width_range_size (wide)
% @values v20_25_to_25_0=20.25_to_25.0_inches unk_stance_width_range_size_wide=Unknown
% @importance 0.925

0.93::acc(s1, stance_width_range_size_wide).
0.85::acc(sm, stance_width_range_size_wide).

0.97::true_val(stance_width_range_size_wide, v20_25_to_25_0); 0.03::true_val(stance_width_range_size_wide, unk_stance_width_range_size_wide).

measured(s1, stance_width_range_size_wide, v20_25_to_25_0).
measured(sm, stance_width_range_size_wide, v20_25_to_25_0).

all_consistent(stance_width_range_size_wide) :-
    consistent(s1, stance_width_range_size_wide),
    (indep(sm), consistent(sm, stance_width_range_size_wide) ; \+indep(sm)).

evidence(all_consistent(stance_width_range_size_wide)).
query(true_val(stance_width_range_size_wide, v20_25_to_25_0)).
query(true_val(stance_width_range_size_wide, unk_stance_width_range_size_wide)).

% @attr recommended_weight_range_size_151_5
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size (151.5)
% @values v120_plus=120_plus_lbs unk_recommended_weight_range_size_151_5=Unknown
% @importance 1.0

0.93::acc(s1, recommended_weight_range_size_151_5).

0.93::true_val(recommended_weight_range_size_151_5, v120_plus); 0.07::true_val(recommended_weight_range_size_151_5, unk_recommended_weight_range_size_151_5).

measured(s1, recommended_weight_range_size_151_5, v120_plus).

all_consistent(recommended_weight_range_size_151_5) :-
    consistent(s1, recommended_weight_range_size_151_5).

evidence(all_consistent(recommended_weight_range_size_151_5)).
query(true_val(recommended_weight_range_size_151_5, v120_plus)).
query(true_val(recommended_weight_range_size_151_5, unk_recommended_weight_range_size_151_5)).

% @attr recommended_weight_range_size_154_5
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size (154.5)
% @values v130_plus_65kg=130_plus_lbs_65_plus_kg unk_recommended_weight_range_size_154_5=Unknown
% @importance 0.925

0.93::acc(s1, recommended_weight_range_size_154_5).
0.85::acc(sm, recommended_weight_range_size_154_5).

0.97::true_val(recommended_weight_range_size_154_5, v130_plus_65kg); 0.03::true_val(recommended_weight_range_size_154_5, unk_recommended_weight_range_size_154_5).

measured(s1, recommended_weight_range_size_154_5, v130_plus_65kg).
measured(sm, recommended_weight_range_size_154_5, v130_plus_65kg).

all_consistent(recommended_weight_range_size_154_5) :-
    consistent(s1, recommended_weight_range_size_154_5),
    (indep(sm), consistent(sm, recommended_weight_range_size_154_5) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size_154_5)).
query(true_val(recommended_weight_range_size_154_5, v130_plus_65kg)).
query(true_val(recommended_weight_range_size_154_5, unk_recommended_weight_range_size_154_5)).

% @attr recommended_weight_range_size_155w
% @type categorical
% @unit lbs
% @canonical false
% @original_name recommended_weight_range_size (155W)
% @values v130_plus_60kg=130_plus_lbs_60_plus_kg v130_plus_65kg_alt=130_plus_lbs_65_plus_kg
% @importance 0.925

0.90::acc(s1, recommended_weight_range_size_155w).
0.80::acc(sm, recommended_weight_range_size_155w).

0.55::true_val(recommended_weight_range_size_155w, v130_plus_60kg); 0.45::true_val(recommended_weight_range_size_155w, v130_plus_65kg_alt).

measured(s1, recommended_weight_range_size_155w, v130_plus_60kg).
measured(sm, recommended_weight_range_size_155w, v130_plus_65kg_alt).

all_consistent(recommended_weight_range_size_155w) :-
    consistent(s1, recommended_weight_range_size_155w),
    (indep(sm), consistent(sm, recommended_weight_range_size_155w) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size_155w)).
query(true_val(recommended_weight_range_size_155w, v130_plus_60kg)).
query(true_val(recommended_weight_range_size_155w, v130_plus_65kg_alt)).

% @attr recommended_weight_range_size
% @type categorical
% @unit lbs
% @canonical true
% @original_name recommended_weight_range_size (157.5)
% @values v130_plus_65kg=130_plus_lbs_65_plus_kg unk_recommended_weight_range_size=Unknown
% @importance 0.925

0.93::acc(s1, recommended_weight_range_size).
0.85::acc(sm, recommended_weight_range_size).

0.97::true_val(recommended_weight_range_size, v130_plus_65kg); 0.03::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, v130_plus_65kg).
measured(sm, recommended_weight_range_size, v130_plus_65kg).

all_consistent(recommended_weight_range_size) :-
    consistent(s1, recommended_weight_range_size),
    (indep(sm), consistent(sm, recommended_weight_range_size) ; \+indep(sm)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v130_plus_65kg)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values g_lite_3_aspen_paulownia_carbon=G_Lite_3_FSC_Aspen_Paulownia_Carbon_Power_Bands unk_core_material=Unknown
% @importance 0.90

0.95::acc(s1, core_material).
0.65::acc(s4, core_material).
0.80::acc(sm, core_material).

0.97::true_val(core_material, g_lite_3_aspen_paulownia_carbon); 0.03::true_val(core_material, unk_core_material).

measured(s1, core_material, g_lite_3_aspen_paulownia_carbon).
measured(s4, core_material, g_lite_3_aspen_paulownia_carbon).
measured(sm, core_material, g_lite_3_aspen_paulownia_carbon).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s4), consistent(s4, core_material) ; \+indep(s4)),
    (indep(sm), consistent(sm, core_material) ; \+indep(sm)).

evidence(all_consistent(core_material)).
query(true_val(core_material, g_lite_3_aspen_paulownia_carbon)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC certified wood)
% @values fsc_certified=FSC_certified_wood unk_sustainability_certification_fsc=Unknown
% @importance 0.80

0.65::acc(s4, sustainability_certification_fsc).
0.80::acc(sm, sustainability_certification_fsc).

0.92::true_val(sustainability_certification_fsc, fsc_certified); 0.08::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s4, sustainability_certification_fsc, fsc_certified).
measured(sm, sustainability_certification_fsc, fsc_certified).

all_consistent(sustainability_certification_fsc) :-
    (indep(s4), consistent(s4, sustainability_certification_fsc) ; \+indep(s4)),
    (indep(sm), consistent(sm, sustainability_certification_fsc) ; \+indep(sm)).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr core_feel
% @type categorical
% @canonical false
% @original_name core_material (feel description)
% @values light_strong_poppy=Incredibly_light_strong_low_weight_poppy unk_core_feel=Unknown
% @importance 0.80

0.78::acc(sm, core_feel).

0.78::true_val(core_feel, light_strong_poppy); 0.22::true_val(core_feel, unk_core_feel).

measured(sm, core_feel, light_strong_poppy).

all_consistent(core_feel) :-
    (indep(sm), consistent(sm, core_feel) ; \+indep(sm)).

evidence(all_consistent(core_feel)).
query(true_val(core_feel, light_strong_poppy)).
query(true_val(core_feel, unk_core_feel)).

% @attr laminate
% @type categorical
% @canonical false
% @original_name laminate
% @values tri_ax_bi_ax_carbon=Tri_Ax_Bi_Ax_plus_Carbon_Power_Bands unk_laminate=Unknown
% @importance 0.825

0.80::acc(sm, laminate).

0.80::true_val(laminate, tri_ax_bi_ax_carbon); 0.20::true_val(laminate, unk_laminate).

measured(sm, laminate, tri_ax_bi_ax_carbon).

all_consistent(laminate) :-
    (indep(sm), consistent(sm, laminate) ; \+indep(sm)).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax_bi_ax_carbon)).
query(true_val(laminate, unk_laminate)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values carbon_power_bands=Carbon_Power_Bands_pop_response_lifespan unk_construction_material_innovation=Unknown
% @importance 0.825

0.80::acc(sm, construction_material_innovation).

0.85::true_val(construction_material_innovation, carbon_power_bands); 0.15::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(sm, construction_material_innovation, carbon_power_bands).

all_consistent(construction_material_innovation) :-
    (indep(sm), consistent(sm, construction_material_innovation) ; \+indep(sm)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, carbon_power_bands)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr sidewall_material
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values uhmw=UHMW_Ultra_High_Molecular_Weight_Polyethylene unk_sidewall_material=Unknown
% @importance 0.825

0.80::acc(sm, sidewall_material).

0.85::true_val(sidewall_material, uhmw); 0.15::true_val(sidewall_material, unk_sidewall_material).

measured(sm, sidewall_material, uhmw).

all_consistent(sidewall_material) :-
    (indep(sm), consistent(sm, sidewall_material) ; \+indep(sm)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, uhmw)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_knife_cut=Sintered_Knife_Cut_Base unk_base_material=Unknown
% @importance 0.80

0.80::acc(sm, base_material).
0.70::acc(s37, base_material).

0.92::true_val(base_material, sintered_knife_cut); 0.08::true_val(base_material, unk_base_material).

measured(sm, base_material, sintered_knife_cut).
measured(s37, base_material, sintered_knife_cut).

all_consistent(base_material) :-
    (indep(sm), consistent(sm, base_material) ; \+indep(sm)),
    (indep(s37), consistent(s37, base_material) ; \+indep(s37)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_knife_cut)).
query(true_val(base_material, unk_base_material)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction_7=Magne_Traction_7_serrations unk_edge_technology=Unknown
% @importance 0.90

0.95::acc(s1, edge_technology).
0.80::acc(sm, edge_technology).
0.70::acc(s37, edge_technology).

0.97::true_val(edge_technology, magne_traction_7); 0.03::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, magne_traction_7).
measured(sm, edge_technology, magne_traction_7).
measured(s37, edge_technology, magne_traction_7).

all_consistent(edge_technology) :-
    consistent(s1, edge_technology),
    (indep(sm), consistent(sm, edge_technology) ; \+indep(sm)),
    (indep(s37), consistent(s37, edge_technology) ; \+indep(s37)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values eco_sublimated_bio_beans=Eco_Sublimated_Bio_Beans_Topsheet unk_topsheet=Unknown
% @importance 0.825

0.80::acc(sm, topsheet).

0.85::true_val(topsheet, eco_sublimated_bio_beans); 0.15::true_val(topsheet, unk_topsheet).

measured(sm, topsheet, eco_sublimated_bio_beans).

all_consistent(topsheet) :-
    (indep(sm), consistent(sm, topsheet) ; \+indep(sm)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_bio_beans)).
query(true_val(topsheet, unk_topsheet)).

% @attr construction_material_innovation_delightwood
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Delightwood)
% @values delightwood_asym_chips=Delightwood_Asym_Chips_under_inserts unk_construction_material_innovation_delightwood=Unknown
% @importance 0.90

0.93::acc(s1, construction_material_innovation_delightwood).
0.80::acc(sm, construction_material_innovation_delightwood).

0.95::true_val(construction_material_innovation_delightwood, delightwood_asym_chips); 0.05::true_val(construction_material_innovation_delightwood, unk_construction_material_innovation_delightwood).

measured(s1, construction_material_innovation_delightwood, delightwood_asym_chips).
measured(sm, construction_material_innovation_delightwood, delightwood_asym_chips).

all_consistent(construction_material_innovation_delightwood) :-
    consistent(s1, construction_material_innovation_delightwood),
    (indep(sm), consistent(sm, construction_material_innovation_delightwood) ; \+indep(sm)).

evidence(all_consistent(construction_material_innovation_delightwood)).
query(true_val(construction_material_innovation_delightwood, delightwood_asym_chips)).
query(true_val(construction_material_innovation_delightwood, unk_construction_material_innovation_delightwood)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values trevor_yardley_jones=Trevor_Yardley_Jones unk_graphic_designer_artist=Unknown
% @importance 0.60

0.93::acc(s1, graphic_designer_artist).
0.82::acc(s38, graphic_designer_artist).

0.95::true_val(graphic_designer_artist, trevor_yardley_jones); 0.05::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s1, graphic_designer_artist, trevor_yardley_jones).
measured(s38, graphic_designer_artist, trevor_yardley_jones).

all_consistent(graphic_designer_artist) :-
    consistent(s1, graphic_designer_artist),
    (indep(s38), consistent(s38, graphic_designer_artist) ; \+indep(s38)).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, trevor_yardley_jones)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_to_advanced=Intermediate_to_Advanced unk_rider_level=Unknown
% @importance 0.867

0.82::acc(s2, rider_level).
0.80::acc(sm, rider_level).

0.92::true_val(rider_level, intermediate_to_advanced); 0.08::true_val(rider_level, unk_rider_level).

measured(s2, rider_level, intermediate_to_advanced).
measured(sm, rider_level, intermediate_to_advanced).

all_consistent(rider_level) :-
    (indep(s2), consistent(s2, rider_level) ; \+indep(s2)),
    (indep(sm), consistent(sm, rider_level) ; \+indep(sm)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_to_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values versatile_quiver_freestyle_lean=Versatile_quiver_freestyle_lean_not_beginners intermediate_to_expert=Intermediate_to_expert
% @importance 0.80

0.85::acc(s9, skill_level_recommendation).
0.88::acc(s34, skill_level_recommendation).
0.70::acc(s5, skill_level_recommendation).

0.50::true_val(skill_level_recommendation, versatile_quiver_freestyle_lean); 0.50::true_val(skill_level_recommendation, intermediate_to_expert).

measured(s9, skill_level_recommendation, versatile_quiver_freestyle_lean).
measured(s34, skill_level_recommendation, versatile_quiver_freestyle_lean).
measured(s5, skill_level_recommendation, intermediate_to_expert).

all_consistent(skill_level_recommendation) :-
    consistent(s9, skill_level_recommendation),
    consistent(s34, skill_level_recommendation),
    (indep(s5), consistent(s5, skill_level_recommendation) ; \+indep(s5)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, versatile_quiver_freestyle_lean)).
query(true_val(skill_level_recommendation, intermediate_to_expert)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values park_groomers_powder_am=Park_groomers_powder_all_mountain freestyle_all_mountain=Freestyle_All_Mountain
% @importance 0.925

0.82::acc(sm, terrain_suitability).
0.93::acc(s1, terrain_suitability).

0.45::true_val(terrain_suitability, park_groomers_powder_am); 0.55::true_val(terrain_suitability, freestyle_all_mountain).

measured(sm, terrain_suitability, park_groomers_powder_am).
measured(s1, terrain_suitability, freestyle_all_mountain).

all_consistent(terrain_suitability) :-
    consistent(s1, terrain_suitability),
    (indep(sm), consistent(sm, terrain_suitability) ; \+indep(sm)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, park_groomers_powder_am)).
query(true_val(terrain_suitability, freestyle_all_mountain)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name riding_style
% @values freestyle_carving_am=Freestyle_carving_all_mountain unk_riding_style=Unknown
% @importance 0.85

0.82::acc(sm, riding_style).

0.82::true_val(riding_style, freestyle_carving_am); 0.18::true_val(riding_style, unk_riding_style).

measured(sm, riding_style, freestyle_carving_am).

all_consistent(riding_style) :-
    (indep(sm), consistent(sm, riding_style) ; \+indep(sm)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_carving_am)).
query(true_val(riding_style, unk_riding_style)).

% @attr jumps_rating_tgr
% @type numeric
% @unit /5
% @canonical false
% @original_name jumps_rating_tgr
% @values v4_5=4.5 unk_jumps_rating_tgr=Unknown
% @importance 0.95

0.88::acc(s34, jumps_rating_tgr).

0.88::true_val(jumps_rating_tgr, v4_5); 0.12::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s34, jumps_rating_tgr, v4_5).

all_consistent(jumps_rating_tgr) :-
    consistent(s34, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, v4_5)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr switch_riding
% @type numeric
% @unit /5
% @canonical false
% @original_name switch_riding
% @values v5=5.0 unk_switch_riding=Unknown
% @importance 0.95

0.88::acc(s34, switch_riding).

0.88::true_val(switch_riding, v5); 0.12::true_val(switch_riding, unk_switch_riding).

measured(s34, switch_riding, v5).

all_consistent(switch_riding) :-
    consistent(s34, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, v5)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr carving_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name carving_score_snowboardingprofiles
% @values v3_5=3.5 unk_carving_score_snowboardingprofiles=Unknown
% @importance 0.95

0.88::acc(s34, carving_score_snowboardingprofiles).

0.88::true_val(carving_score_snowboardingprofiles, v3_5); 0.12::true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles).

measured(s34, carving_score_snowboardingprofiles, v3_5).

all_consistent(carving_score_snowboardingprofiles) :-
    consistent(s34, carving_score_snowboardingprofiles).

evidence(all_consistent(carving_score_snowboardingprofiles)).
query(true_val(carving_score_snowboardingprofiles, v3_5)).
query(true_val(carving_score_snowboardingprofiles, unk_carving_score_snowboardingprofiles)).

% @attr speed_rating_tgr
% @type numeric
% @unit /5
% @canonical false
% @original_name speed_rating_tgr
% @values v3_5=3.5 unk_speed_rating_tgr=Unknown
% @importance 0.95

0.88::acc(s34, speed_rating_tgr).

0.88::true_val(speed_rating_tgr, v3_5); 0.12::true_val(speed_rating_tgr, unk_speed_rating_tgr).

measured(s34, speed_rating_tgr, v3_5).

all_consistent(speed_rating_tgr) :-
    consistent(s34, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, v3_5)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr spins_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Spins rating
% @values v4_5=4.5 unk_spins_rating=Unknown
% @importance 0.95

0.88::acc(s34, spins_rating).

0.88::true_val(spins_rating, v4_5); 0.12::true_val(spins_rating, unk_spins_rating).

measured(s34, spins_rating, v4_5).

all_consistent(spins_rating) :-
    consistent(s34, spins_rating).

evidence(all_consistent(spins_rating)).
query(true_val(spins_rating, v4_5)).
query(true_val(spins_rating, unk_spins_rating)).

% @attr butters_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Butters rating
% @values v4=4.0 unk_butters_rating=Unknown
% @importance 0.95

0.88::acc(s34, butters_rating).

0.88::true_val(butters_rating, v4); 0.12::true_val(butters_rating, unk_butters_rating).

measured(s34, butters_rating, v4).

all_consistent(butters_rating) :-
    consistent(s34, butters_rating).

evidence(all_consistent(butters_rating)).
query(true_val(butters_rating, v4)).
query(true_val(butters_rating, unk_butters_rating)).

% @attr jibbing_rating_tgr
% @type numeric
% @unit /5
% @canonical false
% @original_name jibbing_rating_tgr
% @values v3=3.0 unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.88::acc(s34, jibbing_rating_tgr).

0.88::true_val(jibbing_rating_tgr, v3); 0.12::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s34, jibbing_rating_tgr, v3).

all_consistent(jibbing_rating_tgr) :-
    consistent(s34, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, v3)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr powder_score_snowboardingprofiles
% @type numeric
% @unit /5
% @canonical true
% @original_name powder_score_snowboardingprofiles
% @values v3=3.0 unk_powder_score_snowboardingprofiles=Unknown
% @importance 0.85

0.88::acc(s34, powder_score_snowboardingprofiles).
0.82::acc(s35, powder_score_snowboardingprofiles).

0.92::true_val(powder_score_snowboardingprofiles, v3); 0.08::true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles).

measured(s34, powder_score_snowboardingprofiles, v3).
measured(s35, powder_score_snowboardingprofiles, v3).

all_consistent(powder_score_snowboardingprofiles) :-
    consistent(s34, powder_score_snowboardingprofiles),
    consistent(s35, powder_score_snowboardingprofiles).

evidence(all_consistent(powder_score_snowboardingprofiles)).
query(true_val(powder_score_snowboardingprofiles, v3)).
query(true_val(powder_score_snowboardingprofiles, unk_powder_score_snowboardingprofiles)).

% @attr crud_handling
% @type numeric
% @unit /5
% @canonical false
% @original_name Crud handling
% @values v4=4.0 unk_crud_handling=Unknown
% @importance 0.95

0.88::acc(s34, crud_handling).

0.88::true_val(crud_handling, v4); 0.12::true_val(crud_handling, unk_crud_handling).

measured(s34, crud_handling, v4).

all_consistent(crud_handling) :-
    consistent(s34, crud_handling).

evidence(all_consistent(crud_handling)).
query(true_val(crud_handling, v4)).
query(true_val(crud_handling, unk_crud_handling)).

% @attr trees_bumps_rating
% @type numeric
% @unit /5
% @canonical false
% @original_name Trees/Bumps rating
% @values v3_5=3.5 unk_trees_bumps_rating=Unknown
% @importance 0.95

0.88::acc(s34, trees_bumps_rating).

0.88::true_val(trees_bumps_rating, v3_5); 0.12::true_val(trees_bumps_rating, unk_trees_bumps_rating).

measured(s34, trees_bumps_rating, v3_5).

all_consistent(trees_bumps_rating) :-
    consistent(s34, trees_bumps_rating).

evidence(all_consistent(trees_bumps_rating)).
query(true_val(trees_bumps_rating, v3_5)).
query(true_val(trees_bumps_rating, unk_trees_bumps_rating)).

% @attr board_weight_grams
% @type numeric
% @unit grams
% @canonical true
% @original_name board_weight_grams
% @values v3080=3080.0 unk_board_weight_grams=Unknown
% @importance 0.95

0.90::acc(s34, board_weight_grams).

0.90::true_val(board_weight_grams, v3080); 0.10::true_val(board_weight_grams, unk_board_weight_grams).

measured(s34, board_weight_grams, v3080).

all_consistent(board_weight_grams) :-
    consistent(s34, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v3080)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @unit grams/cm
% @canonical false
% @original_name weight_per_cm
% @values v19_56=19.56 unk_weight_per_cm=Unknown
% @importance 0.95

0.88::acc(s34, weight_per_cm).

0.88::true_val(weight_per_cm, v19_56); 0.12::true_val(weight_per_cm, unk_weight_per_cm).

measured(s34, weight_per_cm, v19_56).

all_consistent(weight_per_cm) :-
    consistent(s34, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v19_56)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values v6_of_10=6_of_10_chattery_damp minimal_chatter=Minimal_chatter_at_high_speed
% @importance 0.90

0.88::acc(s34, chatter_performance).
0.82::acc(s39, chatter_performance).

0.50::true_val(chatter_performance, v6_of_10); 0.50::true_val(chatter_performance, minimal_chatter).

measured(s34, chatter_performance, v6_of_10).
measured(s39, chatter_performance, minimal_chatter).

all_consistent(chatter_performance) :-
    consistent(s34, chatter_performance),
    consistent(s39, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, v6_of_10)).
query(true_val(chatter_performance, minimal_chatter)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values v6_of_10_aggressive=6_of_10_slightly_aggressive_side unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.85

0.85::acc(s34, reviewer_opinion_snowboardingprofiles).
0.82::acc(s35, reviewer_opinion_snowboardingprofiles).

0.88::true_val(reviewer_opinion_snowboardingprofiles, v6_of_10_aggressive); 0.12::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s34, reviewer_opinion_snowboardingprofiles, v6_of_10_aggressive).
measured(s35, reviewer_opinion_snowboardingprofiles, v6_of_10_aggressive).

all_consistent(reviewer_opinion_snowboardingprofiles) :-
    consistent(s34, reviewer_opinion_snowboardingprofiles),
    consistent(s35, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, v6_of_10_aggressive)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values spot_on=Spot_on_Magne_Traction unk_edge_hold=Unknown
% @importance 0.85

0.82::acc(s39, edge_hold).

0.82::true_val(edge_hold, spot_on); 0.18::true_val(edge_hold, unk_edge_hold).

measured(s39, edge_hold, spot_on).

all_consistent(edge_hold) :-
    consistent(s39, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, spot_on)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values one_board_quiver_daily_driver=One_board_quiver_ideal_seasonaire_daily_driver unk_reviewer_opinion_whitelines=Unknown
% @importance 0.70

0.78::acc(s40, reviewer_opinion_whitelines).

0.78::true_val(reviewer_opinion_whitelines, one_board_quiver_daily_driver); 0.22::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s40, reviewer_opinion_whitelines, one_board_quiver_daily_driver).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s40, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, one_board_quiver_daily_driver)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_mtnweekly_freestyle_freedom
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (freestyle freedom)
% @values freestyle_freedom_deep_snow=Adds_instant_freestyle_freedom_to_deep_snow_game unk_reviewer_opinion_mtnweekly_freestyle_freedom=Unknown
% @importance 0.85

0.82::acc(s39, reviewer_opinion_mtnweekly_freestyle_freedom).

0.82::true_val(reviewer_opinion_mtnweekly_freestyle_freedom, freestyle_freedom_deep_snow); 0.18::true_val(reviewer_opinion_mtnweekly_freestyle_freedom, unk_reviewer_opinion_mtnweekly_freestyle_freedom).

measured(s39, reviewer_opinion_mtnweekly_freestyle_freedom, freestyle_freedom_deep_snow).

all_consistent(reviewer_opinion_mtnweekly_freestyle_freedom) :-
    consistent(s39, reviewer_opinion_mtnweekly_freestyle_freedom).

evidence(all_consistent(reviewer_opinion_mtnweekly_freestyle_freedom)).
query(true_val(reviewer_opinion_mtnweekly_freestyle_freedom, freestyle_freedom_deep_snow)).
query(true_val(reviewer_opinion_mtnweekly_freestyle_freedom, unk_reviewer_opinion_mtnweekly_freestyle_freedom)).

% @attr reviewer_opinion_whitelines_2019
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (2018-2019)
% @values freestyle_forward_excels_beyond_park=Freestyle_forward_excels_away_from_park unk_reviewer_opinion_whitelines_2019=Unknown
% @importance 0.60

0.72::acc(s41, reviewer_opinion_whitelines_2019).

0.72::true_val(reviewer_opinion_whitelines_2019, freestyle_forward_excels_beyond_park); 0.28::true_val(reviewer_opinion_whitelines_2019, unk_reviewer_opinion_whitelines_2019).

measured(s41, reviewer_opinion_whitelines_2019, freestyle_forward_excels_beyond_park).

all_consistent(reviewer_opinion_whitelines_2019) :-
    consistent(s41, reviewer_opinion_whitelines_2019).

evidence(all_consistent(reviewer_opinion_whitelines_2019)).
query(true_val(reviewer_opinion_whitelines_2019, freestyle_forward_excels_beyond_park)).
query(true_val(reviewer_opinion_whitelines_2019, unk_reviewer_opinion_whitelines_2019)).

% @attr overall_assessment_mtnweekly
% @type categorical
% @canonical false
% @original_name Overall assessment (MTN Weekly)
% @values do_it_all=Truly_a_do_it_all_snowboard unk_overall_assessment_mtnweekly=Unknown
% @importance 0.85

0.82::acc(s39, overall_assessment_mtnweekly).

0.82::true_val(overall_assessment_mtnweekly, do_it_all); 0.18::true_val(overall_assessment_mtnweekly, unk_overall_assessment_mtnweekly).

measured(s39, overall_assessment_mtnweekly, do_it_all).

all_consistent(overall_assessment_mtnweekly) :-
    consistent(s39, overall_assessment_mtnweekly).

evidence(all_consistent(overall_assessment_mtnweekly)).
query(true_val(overall_assessment_mtnweekly, do_it_all)).
query(true_val(overall_assessment_mtnweekly, unk_overall_assessment_mtnweekly)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values crepel_paul_warbington=Mathieu_Crepel_Blake_Paul_Max_Gus_Warbington unk_pro_rider_name=Unknown
% @importance 0.725

0.72::acc(s39, pro_rider_name).
0.65::acc(s42, pro_rider_name).

0.85::true_val(pro_rider_name, crepel_paul_warbington); 0.15::true_val(pro_rider_name, unk_pro_rider_name).

measured(s39, pro_rider_name, crepel_paul_warbington).
measured(s42, pro_rider_name, crepel_paul_warbington).

all_consistent(pro_rider_name) :-
    consistent(s39, pro_rider_name),
    consistent(s42, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, crepel_paul_warbington)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr pro_rider_stock_model
% @type categorical
% @canonical false
% @original_name Pro rider Mathieu Crepel uses stock model
% @values yes_stock_quiver=Stock_model_one_board_quiver unk_pro_rider_stock_model=Unknown
% @importance 0.60

0.65::acc(s42, pro_rider_stock_model).

0.65::true_val(pro_rider_stock_model, yes_stock_quiver); 0.35::true_val(pro_rider_stock_model, unk_pro_rider_stock_model).

measured(s42, pro_rider_stock_model, yes_stock_quiver).

all_consistent(pro_rider_stock_model) :-
    consistent(s42, pro_rider_stock_model).

evidence(all_consistent(pro_rider_stock_model)).
query(true_val(pro_rider_stock_model, yes_stock_quiver)).
query(true_val(pro_rider_stock_model, unk_pro_rider_stock_model)).

% @attr quiver_killer
% @type categorical
% @canonical false
% @original_name quiver killer board assessment
% @values yes_quiver_killer=Quiver_killer_board unk_quiver_killer=Unknown
% @importance 0.60

0.65::acc(s42, quiver_killer).

0.65::true_val(quiver_killer, yes_quiver_killer); 0.35::true_val(quiver_killer, unk_quiver_killer).

measured(s42, quiver_killer, yes_quiver_killer).

all_consistent(quiver_killer) :-
    consistent(s42, quiver_killer).

evidence(all_consistent(quiver_killer)).
query(true_val(quiver_killer, yes_quiver_killer)).
query(true_val(quiver_killer, unk_quiver_killer)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values ns_proto_burton_custom_fv=Never_Summer_Proto_Synthesis_Burton_Custom_Flying_V unk_comparable_board_cross_brand=Unknown
% @importance 0.75

0.75::acc(s43, comparable_board_cross_brand).

0.75::true_val(comparable_board_cross_brand, ns_proto_burton_custom_fv); 0.25::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s43, comparable_board_cross_brand, ns_proto_burton_custom_fv).

all_consistent(comparable_board_cross_brand) :-
    consistent(s43, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, ns_proto_burton_custom_fv)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr curated_expert_rating
% @type categorical
% @canonical false
% @original_name Curated expert rating
% @values one_of_best_modern=One_of_the_best_modern_snowboards unk_curated_expert_rating=Unknown
% @importance 0.75

0.72::acc(s43, curated_expert_rating).

0.72::true_val(curated_expert_rating, one_of_best_modern); 0.28::true_val(curated_expert_rating, unk_curated_expert_rating).

measured(s43, curated_expert_rating, one_of_best_modern).

all_consistent(curated_expert_rating) :-
    consistent(s43, curated_expert_rating).

evidence(all_consistent(curated_expert_rating)).
query(true_val(curated_expert_rating, one_of_best_modern)).
query(true_val(curated_expert_rating, unk_curated_expert_rating)).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values excels_asym_minimal_effort=Excels_asym_sidecuts_minimal_effort unk_turn_initiation_performance=Unknown
% @importance 0.75

0.75::acc(s43, turn_initiation_performance).

0.75::true_val(turn_initiation_performance, excels_asym_minimal_effort); 0.25::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s43, turn_initiation_performance, excels_asym_minimal_effort).

all_consistent(turn_initiation_performance) :-
    consistent(s43, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, excels_asym_minimal_effort)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr negative_aspect
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_for_deep_pow_only=Not_ideal_for_dedicated_deep_powder_days unk_negative_aspect=Unknown
% @importance 0.75

0.72::acc(s43, negative_aspect).

0.72::true_val(negative_aspect, not_for_deep_pow_only); 0.28::true_val(negative_aspect, unk_negative_aspect).

measured(s43, negative_aspect, not_for_deep_pow_only).

all_consistent(negative_aspect) :-
    consistent(s43, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_for_deep_pow_only)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values well_rounded_park_covers_more=Well_rounded_park_ride_covers_more_than_expected unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.75

0.80::acc(s44, reviewer_opinion_the_good_ride).

0.80::true_val(reviewer_opinion_the_good_ride, well_rounded_park_covers_more); 0.20::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s44, reviewer_opinion_the_good_ride, well_rounded_park_covers_more).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s44, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, well_rounded_park_covers_more)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical false
% @original_name on_snow_feel_tgr
% @values loose_between_feet=Pretty_loose_feel_between_feet unk_on_snow_feel_tgr=Unknown
% @importance 0.75

0.80::acc(s44, on_snow_feel_tgr).

0.80::true_val(on_snow_feel_tgr, loose_between_feet); 0.20::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s44, on_snow_feel_tgr, loose_between_feet).

all_consistent(on_snow_feel_tgr) :-
    consistent(s44, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, loose_between_feet)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr powder_rating_tgr
% @type categorical
% @canonical false
% @original_name powder_rating_tgr
% @values better_twin_floating=One_of_better_twins_for_floating unk_powder_rating_tgr=Unknown
% @importance 0.75

0.80::acc(s44, powder_rating_tgr).

0.80::true_val(powder_rating_tgr, better_twin_floating); 0.20::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s44, powder_rating_tgr, better_twin_floating).

all_consistent(powder_rating_tgr) :-
    consistent(s44, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, better_twin_floating)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values great_all_around=Great_all_around_board_repeat_buyers unk_user_review_forum=Unknown
% @importance 0.55

0.55::acc(s47, user_review_forum).

0.55::true_val(user_review_forum, great_all_around); 0.45::true_val(user_review_forum, unk_user_review_forum).

measured(s47, user_review_forum, great_all_around).

all_consistent(user_review_forum) :-
    consistent(s47, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, great_all_around)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_magne_traction
% @type categorical
% @canonical false
% @original_name user_review_forum (Magne-Traction ice grip)
% @values ice_grip_highlighted=Magne_Traction_ice_grip_consistently_highlighted unk_user_review_forum_magne_traction=Unknown
% @importance 0.70

0.55::acc(s27, user_review_forum_magne_traction).
0.55::acc(s45, user_review_forum_magne_traction).

0.65::true_val(user_review_forum_magne_traction, ice_grip_highlighted); 0.35::true_val(user_review_forum_magne_traction, unk_user_review_forum_magne_traction).

measured(s27, user_review_forum_magne_traction, ice_grip_highlighted).
measured(s45, user_review_forum_magne_traction, ice_grip_highlighted).

all_consistent(user_review_forum_magne_traction) :-
    consistent(s27, user_review_forum_magne_traction),
    consistent(s45, user_review_forum_magne_traction).

evidence(all_consistent(user_review_forum_magne_traction)).
query(true_val(user_review_forum_magne_traction, ice_grip_highlighted)).
query(true_val(user_review_forum_magne_traction, unk_user_review_forum_magne_traction)).

% @attr user_review_forum_wax_retention
% @type categorical
% @canonical false
% @original_name user_review_forum (wax retention)
% @values holds_wax_better=Holds_wax_better_than_Terrain_Wrecker_TNT_base unk_user_review_forum_wax_retention=Unknown
% @importance 0.80

0.55::acc(s27, user_review_forum_wax_retention).

0.55::true_val(user_review_forum_wax_retention, holds_wax_better); 0.45::true_val(user_review_forum_wax_retention, unk_user_review_forum_wax_retention).

measured(s27, user_review_forum_wax_retention, holds_wax_better).

all_consistent(user_review_forum_wax_retention) :-
    consistent(s27, user_review_forum_wax_retention).

evidence(all_consistent(user_review_forum_wax_retention)).
query(true_val(user_review_forum_wax_retention, holds_wax_better)).
query(true_val(user_review_forum_wax_retention, unk_user_review_forum_wax_retention)).

% @attr user_review_forum_heelside_chatter
% @type categorical
% @canonical false
% @original_name user_review_forum (heelside chatter)
% @values heelside_chatter_high_speed=Some_report_heelside_chatter_at_very_high_speed unk_user_review_forum_heelside_chatter=Unknown
% @importance 0.70

0.50::acc(s46, user_review_forum_heelside_chatter).

0.50::true_val(user_review_forum_heelside_chatter, heelside_chatter_high_speed); 0.50::true_val(user_review_forum_heelside_chatter, unk_user_review_forum_heelside_chatter).

measured(s46, user_review_forum_heelside_chatter, heelside_chatter_high_speed).

all_consistent(user_review_forum_heelside_chatter) :-
    consistent(s46, user_review_forum_heelside_chatter).

evidence(all_consistent(user_review_forum_heelside_chatter)).
query(true_val(user_review_forum_heelside_chatter, heelside_chatter_high_speed)).
query(true_val(user_review_forum_heelside_chatter, unk_user_review_forum_heelside_chatter)).

% @attr user_review_forum_asym_heelside
% @type categorical
% @canonical false
% @original_name user_review_forum (asymmetry heelside)
% @values asym_harder_heelside_powerthrough=Asymmetry_helps_initiation_but_harder_to_power_through_heelside unk_user_review_forum_asym_heelside=Unknown
% @importance 0.70

0.48::acc(s46, user_review_forum_asym_heelside).

0.48::true_val(user_review_forum_asym_heelside, asym_harder_heelside_powerthrough); 0.52::true_val(user_review_forum_asym_heelside, unk_user_review_forum_asym_heelside).

measured(s46, user_review_forum_asym_heelside, asym_harder_heelside_powerthrough).

all_consistent(user_review_forum_asym_heelside) :-
    consistent(s46, user_review_forum_asym_heelside).

evidence(all_consistent(user_review_forum_asym_heelside)).
query(true_val(user_review_forum_asym_heelside, asym_harder_heelside_powerthrough)).
query(true_val(user_review_forum_asym_heelside, unk_user_review_forum_asym_heelside)).

% @attr user_review_forum_upgrade
% @type categorical
% @canonical false
% @original_name user_review_forum (upgrade path)
% @values good_upgrade_carbon_credit=Good_upgrade_from_GNU_Carbon_Credit unk_user_review_forum_upgrade=Unknown
% @importance 0.80

0.55::acc(s27, user_review_forum_upgrade).

0.55::true_val(user_review_forum_upgrade, good_upgrade_carbon_credit); 0.45::true_val(user_review_forum_upgrade, unk_user_review_forum_upgrade).

measured(s27, user_review_forum_upgrade, good_upgrade_carbon_credit).

all_consistent(user_review_forum_upgrade) :-
    consistent(s27, user_review_forum_upgrade).

evidence(all_consistent(user_review_forum_upgrade)).
query(true_val(user_review_forum_upgrade, good_upgrade_carbon_credit)).
query(true_val(user_review_forum_upgrade, unk_user_review_forum_upgrade)).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values union_force_burton_cartel_med_flex=Union_Force_Burton_Cartel_medium_flex unk_binding_compatibility=Unknown
% @importance 0.775

0.55::acc(s27, binding_compatibility).
0.72::acc(s43, binding_compatibility).

0.72::true_val(binding_compatibility, union_force_burton_cartel_med_flex); 0.28::true_val(binding_compatibility, unk_binding_compatibility).

measured(s27, binding_compatibility, union_force_burton_cartel_med_flex).
measured(s43, binding_compatibility, union_force_burton_cartel_med_flex).

all_consistent(binding_compatibility) :-
    consistent(s27, binding_compatibility),
    consistent(s43, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, union_force_burton_cartel_med_flex)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr user_review_forum_beginner_learning
% @type categorical
% @canonical false
% @original_name user_review_forum (beginner learning)
% @values possible_not_ideal=Some_learned_on_it_but_not_ideal_for_beginners unk_user_review_forum_beginner_learning=Unknown
% @importance 0.475

0.50::acc(s28, user_review_forum_beginner_learning).
0.50::acc(s47, user_review_forum_beginner_learning).

0.55::true_val(user_review_forum_beginner_learning, possible_not_ideal); 0.45::true_val(user_review_forum_beginner_learning, unk_user_review_forum_beginner_learning).

measured(s28, user_review_forum_beginner_learning, possible_not_ideal).
measured(s47, user_review_forum_beginner_learning, possible_not_ideal).

all_consistent(user_review_forum_beginner_learning) :-
    consistent(s28, user_review_forum_beginner_learning),
    consistent(s47, user_review_forum_beginner_learning).

evidence(all_consistent(user_review_forum_beginner_learning)).
query(true_val(user_review_forum_beginner_learning, possible_not_ideal)).
query(true_val(user_review_forum_beginner_learning, unk_user_review_forum_beginner_learning)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values desc_changed_specs_unchanged_2026=Description_changed_specs_unchanged_2026 unk_redesign_year=Unknown
% @importance 0.90

0.90::acc(s1, redesign_year).
0.88::acc(s23, redesign_year).

0.90::true_val(redesign_year, desc_changed_specs_unchanged_2026); 0.10::true_val(redesign_year, unk_redesign_year).

measured(s1, redesign_year, desc_changed_specs_unchanged_2026).
measured(s23, redesign_year, desc_changed_specs_unchanged_2026).

all_consistent(redesign_year) :-
    consistent(s1, redesign_year),
    consistent(s23, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, desc_changed_specs_unchanged_2026)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr redesign_year_2023_core
% @type categorical
% @canonical false
% @original_name redesign_year (2023 core update)
% @values g_lite_3_carbon_stiffer=G_Lite_3_core_Carbon_Power_Bands_stiffer unk_redesign_year_2023_core=Unknown
% @importance 0.75

0.82::acc(s35, redesign_year_2023_core).

0.82::true_val(redesign_year_2023_core, g_lite_3_carbon_stiffer); 0.18::true_val(redesign_year_2023_core, unk_redesign_year_2023_core).

measured(s35, redesign_year_2023_core, g_lite_3_carbon_stiffer).

all_consistent(redesign_year_2023_core) :-
    consistent(s35, redesign_year_2023_core).

evidence(all_consistent(redesign_year_2023_core)).
query(true_val(redesign_year_2023_core, g_lite_3_carbon_stiffer)).
query(true_val(redesign_year_2023_core, unk_redesign_year_2023_core)).

% @attr redesign_year_2024_delightwood
% @type categorical
% @canonical false
% @original_name redesign_year (3D Delightwood Asym Chip)
% @values delightwood_3d_platforms=3D_Delightwood_Asym_Chip_power_platforms unk_redesign_year_2024_delightwood=Unknown
% @importance 0.95

0.85::acc(s34, redesign_year_2024_delightwood).

0.85::true_val(redesign_year_2024_delightwood, delightwood_3d_platforms); 0.15::true_val(redesign_year_2024_delightwood, unk_redesign_year_2024_delightwood).

measured(s34, redesign_year_2024_delightwood, delightwood_3d_platforms).

all_consistent(redesign_year_2024_delightwood) :-
    consistent(s34, redesign_year_2024_delightwood).

evidence(all_consistent(redesign_year_2024_delightwood)).
query(true_val(redesign_year_2024_delightwood, delightwood_3d_platforms)).
query(true_val(redesign_year_2024_delightwood, unk_redesign_year_2024_delightwood)).

% @attr msrp_decrease_2026
% @type categorical
% @canonical false
% @original_name 2026 MSRP decreased from $699.99 to $629.99
% @values decreased_699_to_629=MSRP_decreased_699_99_to_629_99 unk_msrp_decrease_2026=Unknown
% @importance 0.90

0.90::acc(s1, msrp_decrease_2026).
0.88::acc(s23, msrp_decrease_2026).

0.92::true_val(msrp_decrease_2026, decreased_699_to_629); 0.08::true_val(msrp_decrease_2026, unk_msrp_decrease_2026).

measured(s1, msrp_decrease_2026, decreased_699_to_629).
measured(s23, msrp_decrease_2026, decreased_699_to_629).

all_consistent(msrp_decrease_2026) :-
    consistent(s1, msrp_decrease_2026),
    consistent(s23, msrp_decrease_2026).

evidence(all_consistent(msrp_decrease_2026)).
query(true_val(msrp_decrease_2026, decreased_699_to_629)).
query(true_val(msrp_decrease_2026, unk_msrp_decrease_2026)).

% @attr redesign_year_2023_sizes
% @type categorical
% @canonical false
% @original_name redesign_year (size lineup change)
% @values added_159_5_dropped_166w=159_5_added_166W_dropped unk_redesign_year_2023_sizes=Unknown
% @importance 0.75

0.82::acc(s35, redesign_year_2023_sizes).

0.82::true_val(redesign_year_2023_sizes, added_159_5_dropped_166w); 0.18::true_val(redesign_year_2023_sizes, unk_redesign_year_2023_sizes).

measured(s35, redesign_year_2023_sizes, added_159_5_dropped_166w).

all_consistent(redesign_year_2023_sizes) :-
    consistent(s35, redesign_year_2023_sizes).

evidence(all_consistent(redesign_year_2023_sizes)).
query(true_val(redesign_year_2023_sizes, added_159_5_dropped_166w)).
query(true_val(redesign_year_2023_sizes, unk_redesign_year_2023_sizes)).

% @attr sustainability_certification_eco_topsheet
% @type categorical
% @canonical false
% @original_name sustainability_certification (eco topsheet)
% @values eco_sublimated_zero_waste=Eco_sublimated_topsheet_zero_hazardous_waste unk_sustainability_certification_eco_topsheet=Unknown
% @importance 0.675

0.80::acc(sm, sustainability_certification_eco_topsheet).
0.85::acc(s19, sustainability_certification_eco_topsheet).

0.90::true_val(sustainability_certification_eco_topsheet, eco_sublimated_zero_waste); 0.10::true_val(sustainability_certification_eco_topsheet, unk_sustainability_certification_eco_topsheet).

measured(sm, sustainability_certification_eco_topsheet, eco_sublimated_zero_waste).
measured(s19, sustainability_certification_eco_topsheet, eco_sublimated_zero_waste).

all_consistent(sustainability_certification_eco_topsheet) :-
    (indep(sm), consistent(sm, sustainability_certification_eco_topsheet) ; \+indep(sm)),
    consistent(s19, sustainability_certification_eco_topsheet).

evidence(all_consistent(sustainability_certification_eco_topsheet)).
query(true_val(sustainability_certification_eco_topsheet, eco_sublimated_zero_waste)).
query(true_val(sustainability_certification_eco_topsheet, unk_sustainability_certification_eco_topsheet)).

% @attr sustainability_certification_knife_cut_base
% @type categorical
% @canonical false
% @original_name sustainability_certification (knife cut base waste reduction)
% @values knife_cut_reduces_waste=Sintered_Knife_Cut_base_reduces_waste unk_sustainability_certification_knife_cut_base=Unknown
% @importance 0.80

0.80::acc(sm, sustainability_certification_knife_cut_base).

0.80::true_val(sustainability_certification_knife_cut_base, knife_cut_reduces_waste); 0.20::true_val(sustainability_certification_knife_cut_base, unk_sustainability_certification_knife_cut_base).

measured(sm, sustainability_certification_knife_cut_base, knife_cut_reduces_waste).

all_consistent(sustainability_certification_knife_cut_base) :-
    (indep(sm), consistent(sm, sustainability_certification_knife_cut_base) ; \+indep(sm)).

evidence(all_consistent(sustainability_certification_knife_cut_base)).
query(true_val(sustainability_certification_knife_cut_base, knife_cut_reduces_waste)).
query(true_val(sustainability_certification_knife_cut_base, unk_sustainability_certification_knife_cut_base)).

% @attr comparable_board_cross_brand_yes_typo
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes Typo)
% @values yes_typo=Yes_Typo_similar_AMF_less_damp_camber_between unk_comparable_board_cross_brand_yes_typo=Unknown
% @importance 0.80

0.55::acc(s27, comparable_board_cross_brand_yes_typo).

0.55::true_val(comparable_board_cross_brand_yes_typo, yes_typo); 0.45::true_val(comparable_board_cross_brand_yes_typo, unk_comparable_board_cross_brand_yes_typo).

measured(s27, comparable_board_cross_brand_yes_typo, yes_typo).

all_consistent(comparable_board_cross_brand_yes_typo) :-
    consistent(s27, comparable_board_cross_brand_yes_typo).

evidence(all_consistent(comparable_board_cross_brand_yes_typo)).
query(true_val(comparable_board_cross_brand_yes_typo, yes_typo)).
query(true_val(comparable_board_cross_brand_yes_typo, unk_comparable_board_cross_brand_yes_typo)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values lib_tech_terrain_wrecker=Lib_Tech_Terrain_Wrecker_same_factory_TNT_base unk_comparable_board_same_brand=Unknown
% @importance 0.80

0.55::acc(s27, comparable_board_same_brand).

0.55::true_val(comparable_board_same_brand, lib_tech_terrain_wrecker); 0.45::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s27, comparable_board_same_brand, lib_tech_terrain_wrecker).

all_consistent(comparable_board_same_brand) :-
    consistent(s27, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, lib_tech_terrain_wrecker)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_cross_brand_yes_greats
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (YES Greats)
% @values yes_greats=YES_Greats_asym_twin_top_AMF_competitor unk_comparable_board_cross_brand_yes_greats=Unknown
% @importance 0.80

0.80::acc(s48, comparable_board_cross_brand_yes_greats).

0.80::true_val(comparable_board_cross_brand_yes_greats, yes_greats); 0.20::true_val(comparable_board_cross_brand_yes_greats, unk_comparable_board_cross_brand_yes_greats).

measured(s48, comparable_board_cross_brand_yes_greats, yes_greats).

all_consistent(comparable_board_cross_brand_yes_greats) :-
    consistent(s48, comparable_board_cross_brand_yes_greats).

evidence(all_consistent(comparable_board_cross_brand_yes_greats)).
query(true_val(comparable_board_cross_brand_yes_greats, yes_greats)).
query(true_val(comparable_board_cross_brand_yes_greats, unk_comparable_board_cross_brand_yes_greats)).

% @attr comparable_board_cross_brand_k2_antidote
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 Antidote)
% @values k2_antidote=K2_Antidote_Best_AMF_Inertia_2026 unk_comparable_board_cross_brand_k2_antidote=Unknown
% @importance 0.65

0.68::acc(s49, comparable_board_cross_brand_k2_antidote).

0.68::true_val(comparable_board_cross_brand_k2_antidote, k2_antidote); 0.32::true_val(comparable_board_cross_brand_k2_antidote, unk_comparable_board_cross_brand_k2_antidote).

measured(s49, comparable_board_cross_brand_k2_antidote, k2_antidote).

all_consistent(comparable_board_cross_brand_k2_antidote) :-
    consistent(s49, comparable_board_cross_brand_k2_antidote).

evidence(all_consistent(comparable_board_cross_brand_k2_antidote)).
query(true_val(comparable_board_cross_brand_k2_antidote, k2_antidote)).
query(true_val(comparable_board_cross_brand_k2_antidote, unk_comparable_board_cross_brand_k2_antidote)).

% @attr overall_rating_sp_ranking_context
% @type categorical
% @canonical false
% @original_name overall_rating_snowboardingprofiles (ranking context)
% @values yes_greats_xtrm_first_rc_third=YES_Greats_XTRM_1st_GNU_RC_3rd unk_overall_rating_sp_ranking_context=Unknown
% @importance 0.80

0.82::acc(s48, overall_rating_sp_ranking_context).

0.82::true_val(overall_rating_sp_ranking_context, yes_greats_xtrm_first_rc_third); 0.18::true_val(overall_rating_sp_ranking_context, unk_overall_rating_sp_ranking_context).

measured(s48, overall_rating_sp_ranking_context, yes_greats_xtrm_first_rc_third).

all_consistent(overall_rating_sp_ranking_context) :-
    consistent(s48, overall_rating_sp_ranking_context).

evidence(all_consistent(overall_rating_sp_ranking_context)).
query(true_val(overall_rating_sp_ranking_context, yes_greats_xtrm_first_rc_third)).
query(true_val(overall_rating_sp_ranking_context, unk_overall_rating_sp_ranking_context)).

% @attr comparable_board_same_brand_trs
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Lib Tech TRS)
% @values lib_tech_trs=Lib_Tech_TRS_similar_C2_lighter_snappier unk_comparable_board_same_brand_trs=Unknown
% @importance 0.60

0.50::acc(s45, comparable_board_same_brand_trs).

0.50::true_val(comparable_board_same_brand_trs, lib_tech_trs); 0.50::true_val(comparable_board_same_brand_trs, unk_comparable_board_same_brand_trs).

measured(s45, comparable_board_same_brand_trs, lib_tech_trs).

all_consistent(comparable_board_same_brand_trs) :-
    consistent(s45, comparable_board_same_brand_trs).

evidence(all_consistent(comparable_board_same_brand_trs)).
query(true_val(comparable_board_same_brand_trs, lib_tech_trs)).
query(true_val(comparable_board_same_brand_trs, unk_comparable_board_same_brand_trs)).

% @attr available_colors
% @type categorical
% @canonical false
% @original_name available_colors
% @values random_base=Random_base_colour_contact_shop unk_available_colors=Unknown
% @importance 0.825

0.80::acc(sm, available_colors).

0.85::true_val(available_colors, random_base); 0.15::true_val(available_colors, unk_available_colors).

measured(sm, available_colors, random_base).

all_consistent(available_colors) :-
    (indep(sm), consistent(sm, available_colors) ; \+indep(sm)).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, random_base)).
query(true_val(available_colors, unk_available_colors)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values designed_by_riders_for_riders=Designed_by_riders_for_riders unk_design_philosophy=Unknown
% @importance 0.65

0.75::acc(s7, design_philosophy).

0.75::true_val(design_philosophy, designed_by_riders_for_riders); 0.25::true_val(design_philosophy, unk_design_philosophy).

measured(s7, design_philosophy, designed_by_riders_for_riders).

all_consistent(design_philosophy) :-
    (indep(s7), consistent(s7, design_philosophy) ; \+indep(s7)).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, designed_by_riders_for_riders)).
query(true_val(design_philosophy, unk_design_philosophy)).