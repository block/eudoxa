0.15::indep(s_mv).
0.10::indep(s4).
0.15::indep(s5).
0.20::indep(s6).
0.20::indep(s24).
0.20::indep(s26).
0.15::indep(s20).
0.20::indep(s23).
0.15::indep(s31).
0.15::indep(s38).
0.25::indep(s28).
0.25::indep(s29).
0.20::indep(s30).
0.15::indep(s46).
0.20::indep(s17).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values gnu=GNU unk_brand=Unknown
% @importance 1.0

0.95::true_val(brand, gnu); 0.05::true_val(brand, unk_brand).

0.95::acc(s1, brand).

measured(s1, brand, gnu).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, gnu)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values gremlin=Gremlin unk_model_name=Unknown
% @importance 1.0

0.95::true_val(model_name, gremlin); 0.05::true_val(model_name, unk_model_name).

0.95::acc(s1, model_name).

measured(s1, model_name, gremlin).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, gremlin)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2027=2027 unk_model_year=Unknown
% @importance 0.9

0.88::true_val(model_year, v2027); 0.12::true_val(model_year, unk_model_year).

0.88::acc(s_mv, model_year).

measured(s_mv, model_year, v2027).

all_consistent(model_year) :- consistent(s_mv, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, unk_model_year)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.85

0.95::true_val(manufacturer, mervin_manufacturing); 0.05::true_val(manufacturer, unk_manufacturer).

0.95::acc(s1, manufacturer).
0.92::acc(s2, manufacturer).

measured(s1, manufacturer, mervin_manufacturing).
measured(s2, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :- consistent(s1, manufacturer), consistent(s2, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values sequim_wa_usa=Sequim_Washington_USA unk_manufacturing_location_current=Unknown
% @importance 0.6

0.95::true_val(manufacturing_location_current, sequim_wa_usa); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).

0.92::acc(s2, manufacturing_location_current).
0.75::acc(s3, manufacturing_location_current).
0.80::acc(s5, manufacturing_location_current).
0.85::acc(s6, manufacturing_location_current).

measured(s2, manufacturing_location_current, sequim_wa_usa).
measured(s3, manufacturing_location_current, sequim_wa_usa).
measured(s5, manufacturing_location_current, sequim_wa_usa).
measured(s6, manufacturing_location_current, sequim_wa_usa).

all_consistent(manufacturing_location_current) :-
    consistent(s2, manufacturing_location_current),
    consistent(s3, manufacturing_location_current),
    (indep(s5), consistent(s5, manufacturing_location_current) ; \+indep(s5)),
    (indep(s6), consistent(s6, manufacturing_location_current) ; \+indep(s6)).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, sequim_wa_usa)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturer_address
% @type categorical
% @canonical false
% @original_name manufacturer address
% @values banana_way_sequim=35_Banana_Way_Sequim_WA unk_manufacturer_address=Unknown
% @importance 0.4

0.60::true_val(manufacturer_address, banana_way_sequim); 0.40::true_val(manufacturer_address, unk_manufacturer_address).

0.65::acc(s4, manufacturer_address).

measured(s4, manufacturer_address, banana_way_sequim).

all_consistent(manufacturer_address) :-
    (indep(s4), consistent(s4, manufacturer_address) ; \+indep(s4)).

evidence(all_consistent(manufacturer_address)).
query(true_val(manufacturer_address, banana_way_sequim)).
query(true_val(manufacturer_address, unk_manufacturer_address)).

% @attr manufacturer_founders
% @type categorical
% @canonical false
% @original_name manufacturer founders
% @values olson_saari_1977=Mike_Olson_and_Pete_Saari_founded_1977 unk_manufacturer_founders=Unknown
% @importance 0.45

0.80::true_val(manufacturer_founders, olson_saari_1977); 0.20::true_val(manufacturer_founders, unk_manufacturer_founders).

0.72::acc(s7, manufacturer_founders).
0.82::acc(s8, manufacturer_founders).

measured(s7, manufacturer_founders, olson_saari_1977).
measured(s8, manufacturer_founders, olson_saari_1977).

all_consistent(manufacturer_founders) :- consistent(s7, manufacturer_founders), consistent(s8, manufacturer_founders).

evidence(all_consistent(manufacturer_founders)).
query(true_val(manufacturer_founders, olson_saari_1977)).
query(true_val(manufacturer_founders, unk_manufacturer_founders)).

% @attr gnu_brand_founded
% @type categorical
% @canonical false
% @original_name GNU brand founded
% @values since_1977=Handbuilt_in_USA_since_1977 unk_gnu_brand_founded=Unknown
% @importance 0.5

0.87::true_val(gnu_brand_founded, since_1977); 0.13::true_val(gnu_brand_founded, unk_gnu_brand_founded).

0.90::acc(s9, gnu_brand_founded).

measured(s9, gnu_brand_founded, since_1977).

all_consistent(gnu_brand_founded) :- consistent(s9, gnu_brand_founded).

evidence(all_consistent(gnu_brand_founded)).
query(true_val(gnu_brand_founded, since_1977)).
query(true_val(gnu_brand_founded, unk_gnu_brand_founded)).

% @attr gnu_brand_origin
% @type categorical
% @canonical false
% @original_name GNU brand origin
% @values launched_1984=Mike_Olson_launched_GNU_brand_1984 unk_gnu_brand_origin=Unknown
% @importance 0.35

0.81::true_val(gnu_brand_origin, launched_1984); 0.19::true_val(gnu_brand_origin, unk_gnu_brand_origin).

0.83::acc(s10, gnu_brand_origin).

measured(s10, gnu_brand_origin, launched_1984).

all_consistent(gnu_brand_origin) :- consistent(s10, gnu_brand_origin).

evidence(all_consistent(gnu_brand_origin)).
query(true_val(gnu_brand_origin, launched_1984)).
query(true_val(gnu_brand_origin, unk_gnu_brand_origin)).

% @attr parent_company_current_owner
% @type categorical
% @canonical false
% @original_name parent company current owner
% @values spring_capital_group=Spring_Capital_Group unk_parent_company_current_owner=Unknown
% @importance 0.4

0.67::true_val(parent_company_current_owner, spring_capital_group); 0.33::true_val(parent_company_current_owner, unk_parent_company_current_owner).

0.68::acc(s11, parent_company_current_owner).

measured(s11, parent_company_current_owner, spring_capital_group).

all_consistent(parent_company_current_owner) :- consistent(s11, parent_company_current_owner).

evidence(all_consistent(parent_company_current_owner)).
query(true_val(parent_company_current_owner, spring_capital_group)).
query(true_val(parent_company_current_owner, unk_parent_company_current_owner)).

% @attr previous_owner
% @type categorical
% @canonical false
% @original_name previous owner
% @values altamont_capital=Altamont_Capital_Partners_from_Quiksilver_2013 unk_previous_owner=Unknown
% @importance 0.3

0.76::true_val(previous_owner, altamont_capital); 0.24::true_val(previous_owner, unk_previous_owner).

0.78::acc(s12, previous_owner).

measured(s12, previous_owner, altamont_capital).

all_consistent(previous_owner) :- consistent(s12, previous_owner).

evidence(all_consistent(previous_owner)).
query(true_val(previous_owner, altamont_capital)).
query(true_val(previous_owner, unk_previous_owner)).

% @attr sister_brands_at_mervin
% @type categorical
% @canonical false
% @original_name sister brands at Mervin
% @values lib_tech_bent_metal_roxy=Lib_Tech_Bent_Metal_Roxy unk_sister_brands_at_mervin=Unknown
% @importance 0.35

0.63::true_val(sister_brands_at_mervin, lib_tech_bent_metal_roxy); 0.37::true_val(sister_brands_at_mervin, unk_sister_brands_at_mervin).

0.65::acc(s13, sister_brands_at_mervin).

measured(s13, sister_brands_at_mervin, lib_tech_bent_metal_roxy).

all_consistent(sister_brands_at_mervin) :- consistent(s13, sister_brands_at_mervin).

evidence(all_consistent(sister_brands_at_mervin)).
query(true_val(sister_brands_at_mervin, lib_tech_bent_metal_roxy)).
query(true_val(sister_brands_at_mervin, unk_sister_brands_at_mervin)).

% @attr factory_size
% @type categorical
% @canonical false
% @original_name factory size
% @values over_60000_sqft=Over_60000_square_feet unk_factory_size=Unknown
% @importance 0.2

0.76::true_val(factory_size, over_60000_sqft); 0.24::true_val(factory_size, unk_factory_size).

0.78::acc(s14, factory_size).

measured(s14, factory_size, over_60000_sqft).

all_consistent(factory_size) :- consistent(s14, factory_size).

evidence(all_consistent(factory_size)).
query(true_val(factory_size, over_60000_sqft)).
query(true_val(factory_size, unk_factory_size)).

% @attr mervin_us_market_share
% @type categorical
% @canonical false
% @original_name Mervin US market share (boards >$500)
% @values pct_23=23_percent_per_SIA unk_mervin_us_market_share=Unknown
% @importance 0.5

0.77::true_val(mervin_us_market_share, pct_23); 0.23::true_val(mervin_us_market_share, unk_mervin_us_market_share).

0.80::acc(s15, mervin_us_market_share).

measured(s15, mervin_us_market_share, pct_23).

all_consistent(mervin_us_market_share) :- consistent(s15, mervin_us_market_share).

evidence(all_consistent(mervin_us_market_share)).
query(true_val(mervin_us_market_share, pct_23)).
query(true_val(mervin_us_market_share, unk_mervin_us_market_share)).

% @attr mervin_employees
% @type numeric
% @canonical false
% @original_name Mervin employees
% @values v120=120 unk_mervin_employees=Unknown
% @importance 0.2

0.72::true_val(mervin_employees, v120); 0.28::true_val(mervin_employees, unk_mervin_employees).

0.75::acc(s16, mervin_employees).

measured(s16, mervin_employees, v120).

all_consistent(mervin_employees) :- consistent(s16, mervin_employees).

evidence(all_consistent(mervin_employees)).
query(true_val(mervin_employees, v120)).
query(true_val(mervin_employees, unk_mervin_employees)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.9

0.90::true_val(product_type, snowboard); 0.10::true_val(product_type, unk_product_type).

0.90::acc(s_mv, product_type).

measured(s_mv, product_type, snowboard).

all_consistent(product_type) :- consistent(s_mv, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.9

0.90::true_val(board_category, all_mountain_freeride); 0.10::true_val(board_category, unk_board_category).

0.90::acc(s_mv, board_category).

measured(s_mv, board_category, all_mountain_freeride).

all_consistent(board_category) :- consistent(s_mv, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2020_2021=2020_2021_season unk_model_first_available_year=Unknown
% @importance 0.7

0.77::true_val(model_first_available_year, season_2020_2021); 0.23::true_val(model_first_available_year, unk_model_first_available_year).

0.82::acc(s17, model_first_available_year).

measured(s17, model_first_available_year, season_2020_2021).

all_consistent(model_first_available_year) :- consistent(s17, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2020_2021)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr initial_size_offering
% @type categorical
% @canonical false
% @original_name initial size offering
% @values only_155cm=155cm_only unk_initial_size_offering=Unknown
% @importance 0.5

0.90::true_val(initial_size_offering, only_155cm); 0.10::true_val(initial_size_offering, unk_initial_size_offering).

0.82::acc(s18, initial_size_offering).
0.65::acc(s19, initial_size_offering).

measured(s18, initial_size_offering, only_155cm).
measured(s19, initial_size_offering, only_155cm).

all_consistent(initial_size_offering) :- consistent(s18, initial_size_offering), consistent(s19, initial_size_offering).

evidence(all_consistent(initial_size_offering)).
query(true_val(initial_size_offering, only_155cm)).
query(true_val(initial_size_offering, unk_initial_size_offering)).

% @attr model_expanded_to_full_size_run
% @type categorical
% @canonical false
% @original_name model expanded to full size run
% @values by_2022=Full_size_run_by_approx_2022 unk_model_expanded=Unknown
% @importance 0.5

0.60::true_val(model_expanded_to_full_size_run, by_2022); 0.40::true_val(model_expanded_to_full_size_run, unk_model_expanded).

0.65::acc(s20, model_expanded_to_full_size_run).

measured(s20, model_expanded_to_full_size_run, by_2022).

all_consistent(model_expanded_to_full_size_run) :-
    (indep(s20), consistent(s20, model_expanded_to_full_size_run) ; \+indep(s20)).

evidence(all_consistent(model_expanded_to_full_size_run)).
query(true_val(model_expanded_to_full_size_run, by_2022)).
query(true_val(model_expanded_to_full_size_run, unk_model_expanded)).

% @attr model_continuity
% @type categorical
% @canonical false
% @original_name model continuity
% @values unchanged_2022_2025=Unchanged_from_2022_through_2025 unk_model_continuity=Unknown
% @importance 0.8

0.76::true_val(model_continuity, unchanged_2022_2025); 0.24::true_val(model_continuity, unk_model_continuity).

0.80::acc(s21, model_continuity).

measured(s21, model_continuity, unchanged_2022_2025).

all_consistent(model_continuity) :- consistent(s21, model_continuity).

evidence(all_consistent(model_continuity)).
query(true_val(model_continuity, unchanged_2022_2025)).
query(true_val(model_continuity, unk_model_continuity)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name design inspiration
% @values amc_gremlin_car=1970s_AMC_Gremlin_car unk_design_inspiration=Unknown
% @importance 0.3

0.57::true_val(design_inspiration, amc_gremlin_car); 0.43::true_val(design_inspiration, unk_design_inspiration).

0.60::acc(s22, design_inspiration).

measured(s22, design_inspiration, amc_gremlin_car).

all_consistent(design_inspiration) :- consistent(s22, design_inspiration).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, amc_gremlin_car)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values turbo_gremlin=GNU_Turbo_Gremlin unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.85::true_val(comparable_board_same_brand, turbo_gremlin); 0.15::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

0.78::acc(s23, comparable_board_same_brand).

measured(s23, comparable_board_same_brand, turbo_gremlin).

all_consistent(comparable_board_same_brand) :-
    (indep(s23), consistent(s23, comparable_board_same_brand) ; \+indep(s23)).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, turbo_gremlin)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v969_99=969.99 unk_price_aud_merchant=Unknown
% @importance 0.9

0.88::true_val(price_aud_merchant, v969_99); 0.12::true_val(price_aud_merchant, unk_price_aud_merchant).

0.88::acc(s_mv, price_aud_merchant).

measured(s_mv, price_aud_merchant, v969_99).

all_consistent(price_aud_merchant) :- consistent(s_mv, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v969_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v405_99=405.99 unk_price_usd_msrp=Unknown
% @importance 1.0

0.90::true_val(price_usd_msrp, v405_99); 0.10::true_val(price_usd_msrp, unk_price_usd_msrp).

0.93::acc(s1, price_usd_msrp).

measured(s1, price_usd_msrp, v405_99).

all_consistent(price_usd_msrp) :- consistent(s1, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v405_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_msrp_full
% @type numeric
% @canonical false
% @original_name price_usd_msrp (full MSRP)
% @unit USD
% @values v579_99=579.99 unk_price_usd_msrp_full=Unknown
% @importance 1.0

0.90::true_val(price_usd_msrp_full, v579_99); 0.10::true_val(price_usd_msrp_full, unk_price_usd_msrp_full).

0.93::acc(s1, price_usd_msrp_full).

measured(s1, price_usd_msrp_full, v579_99).

all_consistent(price_usd_msrp_full) :- consistent(s1, price_usd_msrp_full).

evidence(all_consistent(price_usd_msrp_full)).
query(true_val(price_usd_msrp_full, v579_99)).
query(true_val(price_usd_msrp_full, unk_price_usd_msrp_full)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v405_99=405.99 unk_price_usd_evo=Unknown
% @importance 0.9

0.85::true_val(price_usd_evo, v405_99); 0.15::true_val(price_usd_evo, unk_price_usd_evo).

0.85::acc(s24, price_usd_evo).

measured(s24, price_usd_evo, v405_99).

all_consistent(price_usd_evo) :- consistent(s24, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v405_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v479_00=479.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.9

0.75::true_val(price_eur_blue_tomato, v479_00); 0.25::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

0.78::acc(s25, price_eur_blue_tomato).

measured(s25, price_eur_blue_tomato, v479_00).

all_consistent(price_eur_blue_tomato) :- consistent(s25, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v479_00)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_usd_rei
% @type numeric
% @canonical true
% @original_name price_usd_rei
% @unit USD
% @values v580_00=580.0 unk_price_usd_rei=Unknown
% @importance 0.85

0.85::true_val(price_usd_rei, v580_00); 0.15::true_val(price_usd_rei, unk_price_usd_rei).

0.85::acc(s26, price_usd_rei).

measured(s26, price_usd_rei, v580_00).

all_consistent(price_usd_rei) :- consistent(s26, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v580_00)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_usd_christy_sports
% @type numeric
% @canonical false
% @original_name price USD (Christy Sports, sale)
% @unit USD
% @values v463_99=463.99 unk_price_usd_christy_sports=Unknown
% @importance 0.9

0.75::true_val(price_usd_christy_sports, v463_99); 0.25::true_val(price_usd_christy_sports, unk_price_usd_christy_sports).

0.78::acc(s25, price_usd_christy_sports).

measured(s25, price_usd_christy_sports, v463_99).

all_consistent(price_usd_christy_sports) :- consistent(s25, price_usd_christy_sports).

evidence(all_consistent(price_usd_christy_sports)).
query(true_val(price_usd_christy_sports, v463_99)).
query(true_val(price_usd_christy_sports, unk_price_usd_christy_sports)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v463_99=463.99 unk_price_usd_backcountry=Unknown
% @importance 0.9

0.75::true_val(price_usd_backcountry, v463_99); 0.25::true_val(price_usd_backcountry, unk_price_usd_backcountry).

0.78::acc(s25, price_usd_backcountry).

measured(s25, price_usd_backcountry, v463_99).

all_consistent(price_usd_backcountry) :- consistent(s25, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v463_99)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_tactics
% @type numeric
% @canonical true
% @original_name price_usd_tactics
% @unit USD
% @values v463_99=463.99 unk_price_usd_tactics=Unknown
% @importance 0.9

0.75::true_val(price_usd_tactics, v463_99); 0.25::true_val(price_usd_tactics, unk_price_usd_tactics).

0.78::acc(s25, price_usd_tactics).

measured(s25, price_usd_tactics, v463_99).

all_consistent(price_usd_tactics) :- consistent(s25, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v463_99)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_the_house
% @type numeric
% @canonical false
% @original_name price USD (The House, sale)
% @unit USD
% @values v463_99=463.99 unk_price_usd_the_house=Unknown
% @importance 0.9

0.75::true_val(price_usd_the_house, v463_99); 0.25::true_val(price_usd_the_house, unk_price_usd_the_house).

0.78::acc(s25, price_usd_the_house).

measured(s25, price_usd_the_house, v463_99).

all_consistent(price_usd_the_house) :- consistent(s25, price_usd_the_house).

evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v463_99)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

% @attr price_comparison_vs_average
% @type categorical
% @canonical false
% @original_name price comparison vs average
% @values four_less_than_avg=Approximately_4_less_than_average_468 unk_price_comparison_vs_average=Unknown
% @importance 0.85

0.63::true_val(price_comparison_vs_average, four_less_than_avg); 0.37::true_val(price_comparison_vs_average, unk_price_comparison_vs_average).

0.68::acc(s27, price_comparison_vs_average).

measured(s27, price_comparison_vs_average, four_less_than_avg).

all_consistent(price_comparison_vs_average) :- consistent(s27, price_comparison_vs_average).

evidence(all_consistent(price_comparison_vs_average)).
query(true_val(price_comparison_vs_average, four_less_than_avg)).
query(true_val(price_comparison_vs_average, unk_price_comparison_vs_average)).

% @attr price_usd_msrp_turbo
% @type numeric
% @canonical false
% @original_name price_usd_msrp (Turbo Gremlin)
% @unit USD
% @values v629_99=629.99 unk_price_usd_msrp_turbo=Unknown
% @importance 0.9

0.90::true_val(price_usd_msrp_turbo, v629_99); 0.10::true_val(price_usd_msrp_turbo, unk_price_usd_msrp_turbo).

0.93::acc(s1, price_usd_msrp_turbo).

measured(s1, price_usd_msrp_turbo, v629_99).

all_consistent(price_usd_msrp_turbo) :- consistent(s1, price_usd_msrp_turbo).

evidence(all_consistent(price_usd_msrp_turbo)).
query(true_val(price_usd_msrp_turbo, v629_99)).
query(true_val(price_usd_msrp_turbo, unk_price_usd_msrp_turbo)).

% @attr turbo_gremlin_usd_sports_ltd
% @type numeric
% @canonical false
% @original_name Turbo Gremlin MY2027 USD (Sports Ltd.)
% @unit USD
% @values v649_99=649.99 unk_turbo_gremlin_usd_sports_ltd=Unknown
% @importance 0.8

0.59::true_val(turbo_gremlin_usd_sports_ltd, v649_99); 0.41::true_val(turbo_gremlin_usd_sports_ltd, unk_turbo_gremlin_usd_sports_ltd).

0.63::acc(s28, turbo_gremlin_usd_sports_ltd).

measured(s28, turbo_gremlin_usd_sports_ltd, v649_99).

all_consistent(turbo_gremlin_usd_sports_ltd) :-
    (indep(s28), consistent(s28, turbo_gremlin_usd_sports_ltd) ; \+indep(s28)).

evidence(all_consistent(turbo_gremlin_usd_sports_ltd)).
query(true_val(turbo_gremlin_usd_sports_ltd, v649_99)).
query(true_val(turbo_gremlin_usd_sports_ltd, unk_turbo_gremlin_usd_sports_ltd)).

% @attr turbo_gremlin_usd_ski_pro
% @type numeric
% @canonical false
% @original_name Turbo Gremlin MY2027 USD (Ski Pro AZ)
% @unit USD
% @values v649_95=649.95 unk_turbo_gremlin_usd_ski_pro=Unknown
% @importance 0.75

0.59::true_val(turbo_gremlin_usd_ski_pro, v649_95); 0.41::true_val(turbo_gremlin_usd_ski_pro, unk_turbo_gremlin_usd_ski_pro).

0.63::acc(s29, turbo_gremlin_usd_ski_pro).

measured(s29, turbo_gremlin_usd_ski_pro, v649_95).

all_consistent(turbo_gremlin_usd_ski_pro) :-
    (indep(s29), consistent(s29, turbo_gremlin_usd_ski_pro) ; \+indep(s29)).

evidence(all_consistent(turbo_gremlin_usd_ski_pro)).
query(true_val(turbo_gremlin_usd_ski_pro, v649_95)).
query(true_val(turbo_gremlin_usd_ski_pro, unk_turbo_gremlin_usd_ski_pro)).

% @attr price_cad_prfo
% @type numeric
% @canonical true
% @original_name price_cad_prfo
% @unit CAD
% @values v819_99=819.99 unk_price_cad_prfo=Unknown
% @importance 0.7

0.54::true_val(price_cad_prfo, v819_99); 0.46::true_val(price_cad_prfo, unk_price_cad_prfo).

0.58::acc(s30, price_cad_prfo).

measured(s30, price_cad_prfo, v819_99).

all_consistent(price_cad_prfo) :-
    (indep(s30), consistent(s30, price_cad_prfo) ; \+indep(s30)).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v819_99)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values widely_available=Evo_Amazon_Backcountry_Christy_Tactics_TheHouse_REI_SaltyPeaks_SteepAndCheap_Blauer_SnowCountry unk_availability_status=Unknown
% @importance 0.9

0.92::true_val(availability_status, widely_available); 0.08::true_val(availability_status, unk_availability_status).

0.82::acc(s25, availability_status).
0.85::acc(s27, availability_status).
0.85::acc(s26, availability_status).

measured(s25, availability_status, widely_available).
measured(s27, availability_status, widely_available).
measured(s26, availability_status, widely_available).

all_consistent(availability_status) :-
    consistent(s25, availability_status),
    consistent(s27, availability_status),
    consistent(s26, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, widely_available)).
query(true_val(availability_status, unk_availability_status)).

% @attr gnu_com_shipping
% @type categorical
% @canonical false
% @original_name GNU.com shipping
% @values free_over_75=Free_shipping_over_75_excl_AK_HI unk_gnu_com_shipping=Unknown
% @importance 1.0

0.90::true_val(gnu_com_shipping, free_over_75); 0.10::true_val(gnu_com_shipping, unk_gnu_com_shipping).

0.93::acc(s1, gnu_com_shipping).

measured(s1, gnu_com_shipping, free_over_75).

all_consistent(gnu_com_shipping) :- consistent(s1, gnu_com_shipping).

evidence(all_consistent(gnu_com_shipping)).
query(true_val(gnu_com_shipping, free_over_75)).
query(true_val(gnu_com_shipping, unk_gnu_com_shipping)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values one_year_structural=1yr_manufacturer_structural_defects_only unk_warranty=Unknown
% @importance 0.75

0.85::true_val(warranty, one_year_structural); 0.15::true_val(warranty, unk_warranty).

0.85::acc(s31, warranty).

measured(s31, warranty, one_year_structural).

all_consistent(warranty) :-
    (indep(s31), consistent(s31, warranty) ; \+indep(s31)).

evidence(all_consistent(warranty)).
query(true_val(warranty, one_year_structural)).
query(true_val(warranty, unk_warranty)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.9

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

0.90::acc(s_mv, shape).
0.95::acc(s1, shape).

measured(s_mv, shape, tapered_directional).
measured(s1, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s_mv), consistent(s_mv, shape) ; \+indep(s_mv)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c3=C3_mild_rocker_between_feet_camber_to_tips unk_camber_type=Unknown
% @importance 0.9

0.95::true_val(camber_type, c3); 0.05::true_val(camber_type, unk_camber_type).

0.90::acc(s_mv, camber_type).
0.93::acc(s32, camber_type).

measured(s_mv, camber_type, c3).
measured(s32, camber_type, c3).

all_consistent(camber_type) :-
    consistent(s32, camber_type),
    (indep(s_mv), consistent(s_mv, camber_type) ; \+indep(s_mv)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, c3)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values aggressive_camber_mild_rocker=Aggressive_camber_with_mild_rocker_between_feet unk_camber_description=Unknown
% @importance 0.85

0.95::true_val(camber_description, aggressive_camber_mild_rocker); 0.05::true_val(camber_description, unk_camber_description).

0.92::acc(s32, camber_description).
0.82::acc(s33, camber_description).
0.50::acc(s34, camber_description).

measured(s32, camber_description, aggressive_camber_mild_rocker).
measured(s33, camber_description, aggressive_camber_mild_rocker).
measured(s34, camber_description, aggressive_camber_mild_rocker).

all_consistent(camber_description) :-
    consistent(s32, camber_description),
    consistent(s33, camber_description),
    consistent(s34, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, aggressive_camber_mild_rocker)).
query(true_val(camber_description, unk_camber_description)).

% @attr volume_shift
% @type categorical
% @canonical true
% @original_name volume shift
% @values mild_2cm_shorter=Mild_Volume_Shift_ride_2cm_shorter unk_volume_shift=Unknown
% @importance 0.9

0.95::true_val(volume_shift, mild_2cm_shorter); 0.05::true_val(volume_shift, unk_volume_shift).

0.90::acc(s_mv, volume_shift).
0.93::acc(s1, volume_shift).
0.85::acc(s24, volume_shift).

measured(s_mv, volume_shift, mild_2cm_shorter).
measured(s1, volume_shift, mild_2cm_shorter).
measured(s24, volume_shift, mild_2cm_shorter).

all_consistent(volume_shift) :-
    consistent(s1, volume_shift),
    (indep(s_mv), consistent(s_mv, volume_shift) ; \+indep(s_mv)),
    (indep(s24), consistent(s24, volume_shift) ; \+indep(s24)).

evidence(all_consistent(volume_shift)).
query(true_val(volume_shift, mild_2cm_shorter)).
query(true_val(volume_shift, unk_volume_shift)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v6=6.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.88

0.95::true_val(flex_rating_10_manufacturer, v6); 0.05::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

0.95::acc(s35, flex_rating_10_manufacturer).
0.88::acc(s_mv, flex_rating_10_manufacturer).

measured(s35, flex_rating_10_manufacturer, v6).
measured(s_mv, flex_rating_10_manufacturer, v6).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s35, flex_rating_10_manufacturer),
    (indep(s_mv), consistent(s_mv, flex_rating_10_manufacturer) ; \+indep(s_mv)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v6=6.0 unk_flex_rating_10=Unknown
% @importance 0.85

0.95::true_val(flex_rating_10, v6); 0.05::true_val(flex_rating_10, unk_flex_rating_10).

0.85::acc(s27, flex_rating_10).
0.88::acc(s_mv, flex_rating_10).
0.78::acc(s44, flex_rating_10).
0.50::acc(s45, flex_rating_10).

measured(s27, flex_rating_10, v6).
measured(s_mv, flex_rating_10, v6).
measured(s44, flex_rating_10, v6).
measured(s45, flex_rating_10, v6).

all_consistent(flex_rating_10) :-
    consistent(s27, flex_rating_10),
    consistent(s44, flex_rating_10),
    consistent(s45, flex_rating_10),
    (indep(s_mv), consistent(s_mv, flex_rating_10) ; \+indep(s_mv)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values stiff=Stiff_evo_maps_6_to_8 unk_flex_rating_10_evo=Unknown
% @importance 0.9

0.78::true_val(flex_rating_10_evo, stiff); 0.22::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

0.80::acc(s24, flex_rating_10_evo).

measured(s24, flex_rating_10_evo, stiff).

all_consistent(flex_rating_10_evo) :-
    (indep(s24), consistent(s24, flex_rating_10_evo) ; \+indep(s24)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values directional_softer_nose_stiffer_tail=Medium_stiff_directional_softer_nose_stiffer_tail unk_flex_feel=Unknown
% @importance 0.88

0.92::true_val(flex_feel, directional_softer_nose_stiffer_tail); 0.08::true_val(flex_feel, unk_flex_feel).

0.83::acc(s33, flex_feel).
0.75::acc(s41, flex_feel).

measured(s33, flex_feel, directional_softer_nose_stiffer_tail).
measured(s41, flex_feel, directional_softer_nose_stiffer_tail).

all_consistent(flex_feel) :-
    consistent(s33, flex_feel),
    consistent(s41, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, directional_softer_nose_stiffer_tail)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional=Directional_softer_nose_stiffer_tail unk_flex_direction=Unknown
% @importance 0.75

0.70::true_val(flex_direction, directional); 0.30::true_val(flex_direction, unk_flex_direction).

0.72::acc(s36, flex_direction).

measured(s36, flex_direction, directional).

all_consistent(flex_direction) :- consistent(s36, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v12=12.0 unk_taper=Unknown
% @importance 0.95

0.80::true_val(taper, v12); 0.20::true_val(taper, unk_taper).

0.83::acc(s33, taper).

measured(s33, taper, v12).

all_consistent(taper) :- consistent(s33, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v12)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v51=51.0 unk_setback=Unknown
% @importance 0.9

0.90::true_val(setback, v51); 0.10::true_val(setback, unk_setback).

0.88::acc(s_mv, setback).

measured(s_mv, setback, v51).

all_consistent(setback) :- consistent(s_mv, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v51)).
query(true_val(setback, unk_setback)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard=Standard unk_width_options=Unknown
% @importance 0.9

0.90::true_val(width_options, standard); 0.10::true_val(width_options, unk_width_options).

0.88::acc(s_mv, width_options).

measured(s_mv, width_options, standard).

all_consistent(width_options) :- consistent(s_mv, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard)).
query(true_val(width_options, unk_width_options)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.9

0.90::true_val(mounting_pattern, inserts_2x4); 0.10::true_val(mounting_pattern, unk_mounting_pattern).

0.88::acc(s_mv, mounting_pattern).

measured(s_mv, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s_mv, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.4

0.80::true_val(gender, mens); 0.20::true_val(gender, unk_gender).

0.70::acc(s4, gender).

measured(s4, gender, mens).

all_consistent(gender) :-
    (indep(s4), consistent(s4, gender) ; \+indep(s4)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values g_lite_2_aspen_paulownia=G_Lite_2_FSC_Aspen_Paulownia unk_core_material=Unknown
% @importance 0.9

0.95::true_val(core_material, g_lite_2_aspen_paulownia); 0.05::true_val(core_material, unk_core_material).

0.90::acc(s_mv, core_material).
0.85::acc(s24, core_material).

measured(s_mv, core_material, g_lite_2_aspen_paulownia).
measured(s24, core_material, g_lite_2_aspen_paulownia).

all_consistent(core_material) :-
    (indep(s_mv), consistent(s_mv, core_material) ; \+indep(s_mv)),
    (indep(s24), consistent(s24, core_material) ; \+indep(s24)).

evidence(all_consistent(core_material)).
query(true_val(core_material, g_lite_2_aspen_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_wood=FSC_certified_wood unk_sustainability_certification=Unknown
% @importance 0.9

0.95::true_val(sustainability_certification, fsc_certified_wood); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

0.90::acc(s_mv, sustainability_certification).
0.85::acc(s24, sustainability_certification).

measured(s_mv, sustainability_certification, fsc_certified_wood).
measured(s24, sustainability_certification, fsc_certified_wood).

all_consistent(sustainability_certification) :-
    (indep(s_mv), consistent(s_mv, sustainability_certification) ; \+indep(s_mv)),
    (indep(s24), consistent(s24, sustainability_certification) ; \+indep(s24)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_wood)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values tri_ax_bi_ax_alloy_glass=Tri_Ax_Bi_Ax_Alloy_Glass unk_laminate=Unknown
% @importance 0.9

0.95::true_val(laminate, tri_ax_bi_ax_alloy_glass); 0.05::true_val(laminate, unk_laminate).

0.90::acc(s_mv, laminate).
0.85::acc(s24, laminate).

measured(s_mv, laminate, tri_ax_bi_ax_alloy_glass).
measured(s24, laminate, tri_ax_bi_ax_alloy_glass).

all_consistent(laminate) :-
    (indep(s_mv), consistent(s_mv, laminate) ; \+indep(s_mv)),
    (indep(s24), consistent(s24, laminate) ; \+indep(s24)).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax_bi_ax_alloy_glass)).
query(true_val(laminate, unk_laminate)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values uhmw=UHMW_Polyethylene unk_sidewall_material=Unknown
% @importance 0.9

0.90::true_val(sidewall_material, uhmw); 0.10::true_val(sidewall_material, unk_sidewall_material).

0.88::acc(s_mv, sidewall_material).

measured(s_mv, sidewall_material, uhmw).

all_consistent(sidewall_material) :-
    (indep(s_mv), consistent(s_mv, sidewall_material) ; \+indep(s_mv)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, uhmw)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered_knife_cut=Sintered_Knife_Cut_Base unk_base_type=Unknown
% @importance 0.9

0.90::true_val(base_type, sintered_knife_cut); 0.10::true_val(base_type, unk_base_type).

0.88::acc(s_mv, base_type).

measured(s_mv, base_type, sintered_knife_cut).

all_consistent(base_type) :-
    (indep(s_mv), consistent(s_mv, base_type) ; \+indep(s_mv)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered_knife_cut)).
query(true_val(base_type, unk_base_type)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values fast_tough_holds_wax_knife_cut=Fast_tough_holds_wax_knife_cut_waste_reduction unk_base_material=Unknown
% @importance 0.9

0.90::true_val(base_material, fast_tough_holds_wax_knife_cut); 0.10::true_val(base_material, unk_base_material).

0.82::acc(s24, base_material).
0.88::acc(s_mv, base_material).

measured(s24, base_material, fast_tough_holds_wax_knife_cut).
measured(s_mv, base_material, fast_tough_holds_wax_knife_cut).

all_consistent(base_material) :-
    (indep(s24), consistent(s24, base_material) ; \+indep(s24)),
    (indep(s_mv), consistent(s_mv, base_material) ; \+indep(s_mv)).

evidence(all_consistent(base_material)).
query(true_val(base_material, fast_tough_holds_wax_knife_cut)).
query(true_val(base_material, unk_base_material)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values eco_sublimated_poly_texture=Eco_Sublimated_Poly_Texture unk_topsheet=Unknown
% @importance 0.9

0.90::true_val(topsheet, eco_sublimated_poly_texture); 0.10::true_val(topsheet, unk_topsheet).

0.88::acc(s_mv, topsheet).

measured(s_mv, topsheet, eco_sublimated_poly_texture).

all_consistent(topsheet) :-
    (indep(s_mv), consistent(s_mv, topsheet) ; \+indep(s_mv)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly_texture)).
query(true_val(topsheet, unk_topsheet)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction_7=Magne_Traction_7_serrations unk_edge_technology=Unknown
% @importance 0.83

0.95::true_val(edge_technology, magne_traction_7); 0.05::true_val(edge_technology, unk_edge_technology).

0.93::acc(s_mv, edge_technology).
0.92::acc(s32, edge_technology).
0.75::acc(s37, edge_technology).

measured(s_mv, edge_technology, magne_traction_7).
measured(s32, edge_technology, magne_traction_7).
measured(s37, edge_technology, magne_traction_7).

all_consistent(edge_technology) :-
    consistent(s32, edge_technology),
    consistent(s37, edge_technology),
    (indep(s_mv), consistent(s_mv, edge_technology) ; \+indep(s_mv)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr sustainability_certification_zero_waste
% @type categorical
% @canonical false
% @original_name sustainability_certification (zero waste)
% @values zero_hazardous_waste=Zero_hazardous_waste_production unk_sust_zero_waste=Unknown
% @importance 0.6

0.92::true_val(sustainability_certification_zero_waste, zero_hazardous_waste); 0.08::true_val(sustainability_certification_zero_waste, unk_sust_zero_waste).

0.92::acc(s2, sustainability_certification_zero_waste).
0.90::acc(s9, sustainability_certification_zero_waste).

measured(s2, sustainability_certification_zero_waste, zero_hazardous_waste).
measured(s9, sustainability_certification_zero_waste, zero_hazardous_waste).

all_consistent(sustainability_certification_zero_waste) :-
    consistent(s2, sustainability_certification_zero_waste),
    consistent(s9, sustainability_certification_zero_waste).

evidence(all_consistent(sustainability_certification_zero_waste)).
query(true_val(sustainability_certification_zero_waste, zero_hazardous_waste)).
query(true_val(sustainability_certification_zero_waste, unk_sust_zero_waste)).

% @attr sustainability_certification_water_solvents
% @type categorical
% @canonical false
% @original_name sustainability_certification (water solvents)
% @values water_based_solvents=Water_based_solvents_instead_of_petrochemical unk_sust_water=Unknown
% @importance 0.45

0.80::true_val(sustainability_certification_water_solvents, water_based_solvents); 0.20::true_val(sustainability_certification_water_solvents, unk_sust_water).

0.78::acc(s38, sustainability_certification_water_solvents).

measured(s38, sustainability_certification_water_solvents, water_based_solvents).

all_consistent(sustainability_certification_water_solvents) :-
    (indep(s38), consistent(s38, sustainability_certification_water_solvents) ; \+indep(s38)).

evidence(all_consistent(sustainability_certification_water_solvents)).
query(true_val(sustainability_certification_water_solvents, water_based_solvents)).
query(true_val(sustainability_certification_water_solvents, unk_sust_water)).

% @attr sustainability_certification_wood_recycling
% @type categorical
% @canonical false
% @original_name sustainability_certification (wood recycling)
% @values sawdust_recycled_scrap_donated=Sawdust_recycled_scrap_wood_donated unk_sust_wood=Unknown
% @importance 0.45

0.80::true_val(sustainability_certification_wood_recycling, sawdust_recycled_scrap_donated); 0.20::true_val(sustainability_certification_wood_recycling, unk_sust_wood).

0.78::acc(s38, sustainability_certification_wood_recycling).

measured(s38, sustainability_certification_wood_recycling, sawdust_recycled_scrap_donated).

all_consistent(sustainability_certification_wood_recycling) :-
    (indep(s38), consistent(s38, sustainability_certification_wood_recycling) ; \+indep(s38)).

evidence(all_consistent(sustainability_certification_wood_recycling)).
query(true_val(sustainability_certification_wood_recycling, sawdust_recycled_scrap_donated)).
query(true_val(sustainability_certification_wood_recycling, unk_sust_wood)).

% @attr sustainability_certification_energy
% @type categorical
% @canonical false
% @original_name sustainability_certification (energy)
% @values hydro_89_6_pct_biodiesel=89_6pct_hydroelectric_biodiesel_heating unk_sust_energy=Unknown
% @importance 0.45

0.81::true_val(sustainability_certification_energy, hydro_89_6_pct_biodiesel); 0.19::true_val(sustainability_certification_energy, unk_sust_energy).

0.83::acc(s39, sustainability_certification_energy).

measured(s39, sustainability_certification_energy, hydro_89_6_pct_biodiesel).

all_consistent(sustainability_certification_energy) :- consistent(s39, sustainability_certification_energy).

evidence(all_consistent(sustainability_certification_energy)).
query(true_val(sustainability_certification_energy, hydro_89_6_pct_biodiesel)).
query(true_val(sustainability_certification_energy, unk_sust_energy)).

% @attr sustainability_certification_fsc_finger_join
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC finger joining)
% @values fsc_finger_joining=FSC_renewable_forest_finger_joining unk_sust_fsc_fj=Unknown
% @importance 0.45

0.81::true_val(sustainability_certification_fsc_finger_join, fsc_finger_joining); 0.19::true_val(sustainability_certification_fsc_finger_join, unk_sust_fsc_fj).

0.83::acc(s39, sustainability_certification_fsc_finger_join).

measured(s39, sustainability_certification_fsc_finger_join, fsc_finger_joining).

all_consistent(sustainability_certification_fsc_finger_join) :- consistent(s39, sustainability_certification_fsc_finger_join).

evidence(all_consistent(sustainability_certification_fsc_finger_join)).
query(true_val(sustainability_certification_fsc_finger_join, fsc_finger_joining)).
query(true_val(sustainability_certification_fsc_finger_join, unk_sust_fsc_fj)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values six_sizes=144_148_152_155_158_161cm unk_available_sizes=Unknown
% @importance 0.95

0.95::true_val(available_sizes, six_sizes); 0.05::true_val(available_sizes, unk_available_sizes).

0.88::acc(s_mv, available_sizes).
0.93::acc(s1, available_sizes).

measured(s_mv, available_sizes, six_sizes).
measured(s1, available_sizes, six_sizes).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes),
    (indep(s_mv), consistent(s_mv, available_sizes) ; \+indep(s_mv)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, six_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr contact_length_size_144
% @type numeric
% @canonical false
% @original_name contact_length_size (144cm)
% @unit cm
% @values v102_0=102.0 unk_contact_length_size_144=Unknown
% @importance 0.9

0.88::true_val(contact_length_size_144, v102_0); 0.12::true_val(contact_length_size_144, unk_contact_length_size_144).

0.88::acc(s_mv, contact_length_size_144).

measured(s_mv, contact_length_size_144, v102_0).

all_consistent(contact_length_size_144) :-
    (indep(s_mv), consistent(s_mv, contact_length_size_144) ; \+indep(s_mv)).

evidence(all_consistent(contact_length_size_144)).
query(true_val(contact_length_size_144, v102_0)).
query(true_val(contact_length_size_144, unk_contact_length_size_144)).

% @attr contact_length_size_148
% @type numeric
% @canonical false
% @original_name contact_length_size (148cm)
% @unit cm
% @values v104_0=104.0 unk_contact_length_size_148=Unknown
% @importance 0.9

0.88::true_val(contact_length_size_148, v104_0); 0.12::true_val(contact_length_size_148, unk_contact_length_size_148).

0.88::acc(s_mv, contact_length_size_148).

measured(s_mv, contact_length_size_148, v104_0).

all_consistent(contact_length_size_148) :-
    (indep(s_mv), consistent(s_mv, contact_length_size_148) ; \+indep(s_mv)).

evidence(all_consistent(contact_length_size_148)).
query(true_val(contact_length_size_148, v104_0)).
query(true_val(contact_length_size_148, unk_contact_length_size_148)).

% @attr contact_length_size_152
% @type numeric
% @canonical false
% @original_name contact_length_size (152cm)
% @unit cm
% @values v106_0=106.0 unk_contact_length_size_152=Unknown
% @importance 0.9

0.88::true_val(contact_length_size_152, v106_0); 0.12::true_val(contact_length_size_152, unk_contact_length_size_152).

0.88::acc(s_mv, contact_length_size_152).

measured(s_mv, contact_length_size_152, v106_0).

all_consistent(contact_length_size_152) :-
    (indep(s_mv), consistent(s_mv, contact_length_size_152) ; \+indep(s_mv)).

evidence(all_consistent(contact_length_size_152)).
query(true_val(contact_length_size_152, v106_0)).
query(true_val(contact_length_size_152, unk_contact_length_size_152)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit cm
% @values v108_0=108.0 unk_contact_length_size=Unknown
% @importance 0.9

0.88::true_val(contact_length_size, v108_0); 0.12::true_val(contact_length_size, unk_contact_length_size).

0.88::acc(s_mv, contact_length_size).

measured(s_mv, contact_length_size, v108_0).

all_consistent(contact_length_size) :-
    (indep(s_mv), consistent(s_mv, contact_length_size) ; \+indep(s_mv)).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v108_0)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr contact_length_size_158
% @type numeric
% @canonical false
% @original_name contact_length_size (158cm)
% @unit cm
% @values v110_0=110.0 unk_contact_length_size_158=Unknown
% @importance 0.9

0.88::true_val(contact_length_size_158, v110_0); 0.12::true_val(contact_length_size_158, unk_contact_length_size_158).

0.88::acc(s_mv, contact_length_size_158).

measured(s_mv, contact_length_size_158, v110_0).

all_consistent(contact_length_size_158) :-
    (indep(s_mv), consistent(s_mv, contact_length_size_158) ; \+indep(s_mv)).

evidence(all_consistent(contact_length_size_158)).
query(true_val(contact_length_size_158, v110_0)).
query(true_val(contact_length_size_158, unk_contact_length_size_158)).

% @attr contact_length_size_161
% @type numeric
% @canonical false
% @original_name contact_length_size (161cm)
% @unit cm
% @values v112_0=112.0 unk_contact_length_size_161=Unknown
% @importance 0.9

0.88::true_val(contact_length_size_161, v112_0); 0.12::true_val(contact_length_size_161, unk_contact_length_size_161).

0.88::acc(s_mv, contact_length_size_161).

measured(s_mv, contact_length_size_161, v112_0).

all_consistent(contact_length_size_161) :-
    (indep(s_mv), consistent(s_mv, contact_length_size_161) ; \+indep(s_mv)).

evidence(all_consistent(contact_length_size_161)).
query(true_val(contact_length_size_161, v112_0)).
query(true_val(contact_length_size_161, unk_contact_length_size_161)).

% @attr sidecut_radius_size_144
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (144cm)
% @unit m
% @values v6_6=6.6 unk_sidecut_radius_size_144=Unknown
% @importance 0.9

0.88::true_val(sidecut_radius_size_144, v6_6); 0.12::true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144).

0.88::acc(s_mv, sidecut_radius_size_144).

measured(s_mv, sidecut_radius_size_144, v6_6).

all_consistent(sidecut_radius_size_144) :-
    (indep(s_mv), consistent(s_mv, sidecut_radius_size_144) ; \+indep(s_mv)).

evidence(all_consistent(sidecut_radius_size_144)).
query(true_val(sidecut_radius_size_144, v6_6)).
query(true_val(sidecut_radius_size_144, unk_sidecut_radius_size_144)).

% @attr sidecut_radius_size_148
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (148cm)
% @unit m
% @values v6_8=6.8 unk_sidecut_radius_size_148=Unknown
% @importance 0.9

0.88::true_val(sidecut_radius_size_148, v6_8); 0.12::true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148).

0.88::acc(s_mv, sidecut_radius_size_148).

measured(s_mv, sidecut_radius_size_148, v6_8).

all_consistent(sidecut_radius_size_148) :-
    (indep(s_mv), consistent(s_mv, sidecut_radius_size_148) ; \+indep(s_mv)).

evidence(all_consistent(sidecut_radius_size_148)).
query(true_val(sidecut_radius_size_148, v6_8)).
query(true_val(sidecut_radius_size_148, unk_sidecut_radius_size_148)).

% @attr sidecut_radius_size_152
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (152cm)
% @unit m
% @values v7_0=7.0 unk_sidecut_radius_size_152=Unknown
% @importance 0.9

0.88::true_val(sidecut_radius_size_152, v7_0); 0.12::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

0.88::acc(s_mv, sidecut_radius_size_152).

measured(s_mv, sidecut_radius_size_152, v7_0).

all_consistent(sidecut_radius_size_152) :-
    (indep(s_mv), consistent(s_mv, sidecut_radius_size_152) ; \+indep(s_mv)).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v7_0)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v7_2=7.2 unk_sidecut_radius_size=Unknown
% @importance 0.9

0.88::true_val(sidecut_radius_size, v7_2); 0.12::true_val(sidecut_radius_size, unk_sidecut_radius_size).

0.88::acc(s_mv, sidecut_radius_size).

measured(s_mv, sidecut_radius_size, v7_2).

all_consistent(sidecut_radius_size) :-
    (indep(s_mv), consistent(s_mv, sidecut_radius_size) ; \+indep(s_mv)).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_2)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_158
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (158cm)
% @unit m
% @values v7_5=7.5 unk_sidecut_radius_size_158=Unknown
% @importance 0.9

0.88::true_val(sidecut_radius_size_158, v7_5); 0.12::true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158).

0.88::acc(s_mv, sidecut_radius_size_158).

measured(s_mv, sidecut_radius_size_158, v7_5).

all_consistent(sidecut_radius_size_158) :-
    (indep(s_mv), consistent(s_mv, sidecut_radius_size_158) ; \+indep(s_mv)).

evidence(all_consistent(sidecut_radius_size_158)).
query(true_val(sidecut_radius_size_158, v7_5)).
query(true_val(sidecut_radius_size_158, unk_sidecut_radius_size_158)).

% @attr sidecut_radius_size_161
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (161cm)
% @unit m
% @values v7_7=7.7 unk_sidecut_radius_size_161=Unknown
% @importance 0.9

0.88::true_val(sidecut_radius_size_161, v7_7); 0.12::true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161).

0.88::acc(s_mv, sidecut_radius_size_161).

measured(s_mv, sidecut_radius_size_161, v7_7).

all_consistent(sidecut_radius_size_161) :-
    (indep(s_mv), consistent(s_mv, sidecut_radius_size_161) ; \+indep(s_mv)).

evidence(all_consistent(sidecut_radius_size_161)).
query(true_val(sidecut_radius_size_161, v7_7)).
query(true_val(sidecut_radius_size_161, unk_sidecut_radius_size_161)).

% @attr tip_tail_width_size_144
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (144cm)
% @unit cm
% @values w30_0_28_8=30.0/28.8 unk_tip_tail_width_size_144=Unknown
% @importance 0.9

0.88::true_val(tip_tail_width_size_144, w30_0_28_8); 0.12::true_val(tip_tail_width_size_144, unk_tip_tail_width_size_144).

0.88::acc(s_mv, tip_tail_width_size_144).

measured(s_mv, tip_tail_width_size_144, w30_0_28_8).

all_consistent(tip_tail_width_size_144) :-
    (indep(s_mv), consistent(s_mv, tip_tail_width_size_144) ; \+indep(s_mv)).

evidence(all_consistent(tip_tail_width_size_144)).
query(true_val(tip_tail_width_size_144, w30_0_28_8)).
query(true_val(tip_tail_width_size_144, unk_tip_tail_width_size_144)).

% @attr tip_tail_width_size_148
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (148cm)
% @unit cm
% @values w30_3_29_1=30.3/29.1 unk_tip_tail_width_size_148=Unknown
% @importance 0.9

0.88::true_val(tip_tail_width_size_148, w30_3_29_1); 0.12::true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148).

0.88::acc(s_mv, tip_tail_width_size_148).

measured(s_mv, tip_tail_width_size_148, w30_3_29_1).

all_consistent(tip_tail_width_size_148) :-
    (indep(s_mv), consistent(s_mv, tip_tail_width_size_148) ; \+indep(s_mv)).

evidence(all_consistent(tip_tail_width_size_148)).
query(true_val(tip_tail_width_size_148, w30_3_29_1)).
query(true_val(tip_tail_width_size_148, unk_tip_tail_width_size_148)).

% @attr tip_tail_width_size_152
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (152cm)
% @unit cm
% @values w30_9_29_7=30.9/29.7 unk_tip_tail_width_size_152=Unknown
% @importance 0.9

0.88::true_val(tip_tail_width_size_152, w30_9_29_7); 0.12::true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152).

0.88::acc(s_mv, tip_tail_width_size_152).

measured(s_mv, tip_tail_width_size_152, w30_9_29_7).

all_consistent(tip_tail_width_size_152) :-
    (indep(s_mv), consistent(s_mv, tip_tail_width_size_152) ; \+indep(s_mv)).

evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, w30_9_29_7)).
query(true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values w31_3_30_1=31.3/30.1 unk_tip_tail_width_size=Unknown
% @importance 0.9

0.88::true_val(tip_tail_width_size, w31_3_30_1); 0.12::true_val(tip_tail_width_size, unk_tip_tail_width_size).

0.88::acc(s_mv, tip_tail_width_size).

measured(s_mv, tip_tail_width_size, w31_3_30_1).

all_consistent(tip_tail_width_size) :-
    (indep(s_mv), consistent(s_mv, tip_tail_width_size) ; \+indep(s_mv)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, w31_3_30_1)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_158
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (158cm)
% @unit cm
% @values w32_1_30_8=32.1/30.8 unk_tip_tail_width_size_158=Unknown
% @importance 0.9

0.88::true_val(tip_tail_width_size_158, w32_1_30_8); 0.12::true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158).

0.88::acc(s_mv, tip_tail_width_size_158).

measured(s_mv, tip_tail_width_size_158, w32_1_30_8).

all_consistent(tip_tail_width_size_158) :-
    (indep(s_mv), consistent(s_mv, tip_tail_width_size_158) ; \+indep(s_mv)).

evidence(all_consistent(tip_tail_width_size_158)).
query(true_val(tip_tail_width_size_158, w32_1_30_8)).
query(true_val(tip_tail_width_size_158, unk_tip_tail_width_size_158)).

% @attr tip_tail_width_size_161
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (161cm)
% @unit cm
% @values w32_6_31_3=32.6/31.3 unk_tip_tail_width_size_161=Unknown
% @importance 0.9

0.88::true_val(tip_tail_width_size_161, w32_6_31_3); 0.12::true_val(tip_tail_width_size_161, unk_tip_tail_width_size_161).

0.88::acc(s_mv, tip_tail_width_size_161).

measured(s_mv, tip_tail_width_size_161, w32_6_31_3).

all_consistent(tip_tail_width_size_161) :-
    (indep(s_mv), consistent(s_mv, tip_tail_width_size_161) ; \+indep(s_mv)).

evidence(all_consistent(tip_tail_width_size_161)).
query(true_val(tip_tail_width_size_161, w32_6_31_3)).
query(true_val(tip_tail_width_size_161, unk_tip_tail_width_size_161)).

% @attr waist_width_144
% @type numeric
% @canonical false
% @original_name waist width 144cm
% @unit cm
% @values v25_5=25.5 unk_waist_width_144=Unknown
% @importance 0.9

0.88::true_val(waist_width_144, v25_5); 0.12::true_val(waist_width_144, unk_waist_width_144).

0.88::acc(s_mv, waist_width_144).

measured(s_mv, waist_width_144, v25_5).

all_consistent(waist_width_144) :-
    (indep(s_mv), consistent(s_mv, waist_width_144) ; \+indep(s_mv)).

evidence(all_consistent(waist_width_144)).
query(true_val(waist_width_144, v25_5)).
query(true_val(waist_width_144, unk_waist_width_144)).

% @attr waist_width_148
% @type numeric
% @canonical false
% @original_name waist width 148cm
% @unit cm
% @values v25_8=25.8 unk_waist_width_148=Unknown
% @importance 0.9

0.88::true_val(waist_width_148, v25_8); 0.12::true_val(waist_width_148, unk_waist_width_148).

0.88::acc(s_mv, waist_width_148).

measured(s_mv, waist_width_148, v25_8).

all_consistent(waist_width_148) :-
    (indep(s_mv), consistent(s_mv, waist_width_148) ; \+indep(s_mv)).

evidence(all_consistent(waist_width_148)).
query(true_val(waist_width_148, v25_8)).
query(true_val(waist_width_148, unk_waist_width_148)).

% @attr waist_width_152
% @type numeric
% @canonical false
% @original_name waist width 152cm
% @unit cm
% @values v26_1=26.1 unk_waist_width_152=Unknown
% @importance 0.9

0.88::true_val(waist_width_152, v26_1); 0.12::true_val(waist_width_152, unk_waist_width_152).

0.88::acc(s_mv, waist_width_152).

measured(s_mv, waist_width_152, v26_1).

all_consistent(waist_width_152) :-
    (indep(s_mv), consistent(s_mv, waist_width_152) ; \+indep(s_mv)).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v26_1)).
query(true_val(waist_width_152, unk_waist_width_152)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name waist width 155cm
% @unit cm
% @values v26_4=26.4 unk_waist_width_155=Unknown
% @importance 0.9

0.88::true_val(waist_width_155, v26_4); 0.12::true_val(waist_width_155, unk_waist_width_155).

0.88::acc(s_mv, waist_width_155).

measured(s_mv, waist_width_155, v26_4).

all_consistent(waist_width_155) :-
    (indep(s_mv), consistent(s_mv, waist_width_155) ; \+indep(s_mv)).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v26_4)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr waist_width_158
% @type numeric
% @canonical false
% @original_name waist width 158cm
% @unit cm
% @values v27_0=27.0 unk_waist_width_158=Unknown
% @importance 0.9

0.88::true_val(waist_width_158, v27_0); 0.12::true_val(waist_width_158, unk_waist_width_158).

0.88::acc(s_mv, waist_width_158).

measured(s_mv, waist_width_158, v27_0).

all_consistent(waist_width_158) :-
    (indep(s_mv), consistent(s_mv, waist_width_158) ; \+indep(s_mv)).

evidence(all_consistent(waist_width_158)).
query(true_val(waist_width_158, v27_0)).
query(true_val(waist_width_158, unk_waist_width_158)).

% @attr waist_width_161
% @type numeric
% @canonical false
% @original_name waist width 161cm
% @unit cm
% @values v27_5=27.5 unk_waist_width_161=Unknown
% @importance 0.9

0.88::true_val(waist_width_161, v27_5); 0.12::true_val(waist_width_161, unk_waist_width_161).

0.88::acc(s_mv, waist_width_161).

measured(s_mv, waist_width_161, v27_5).

all_consistent(waist_width_161) :-
    (indep(s_mv), consistent(s_mv, waist_width_161) ; \+indep(s_mv)).

evidence(all_consistent(waist_width_161)).
query(true_val(waist_width_161, v27_5)).
query(true_val(waist_width_161, unk_waist_width_161)).

% @attr stance_width_range_size_144
% @type categorical
% @canonical false
% @original_name stance_width_range_size (144cm)
% @unit in
% @values r18_5_23_25=18.5-23.25in unk_stance_width_range_size_144=Unknown
% @importance 0.9

0.88::true_val(stance_width_range_size_144, r18_5_23_25); 0.12::true_val(stance_width_range_size_144, unk_stance_width_range_size_144).

0.88::acc(s_mv, stance_width_range_size_144).

measured(s_mv, stance_width_range_size_144, r18_5_23_25).

all_consistent(stance_width_range_size_144) :-
    (indep(s_mv), consistent(s_mv, stance_width_range_size_144) ; \+indep(s_mv)).

evidence(all_consistent(stance_width_range_size_144)).
query(true_val(stance_width_range_size_144, r18_5_23_25)).
query(true_val(stance_width_range_size_144, unk_stance_width_range_size_144)).

% @attr stance_width_range_size_148
% @type categorical
% @canonical false
% @original_name stance_width_range_size (148cm)
% @unit in
% @values r18_5_23_25=18.5-23.25in unk_stance_width_range_size_148=Unknown
% @importance 0.9

0.88::true_val(stance_width_range_size_148, r18_5_23_25); 0.12::true_val(stance_width_range_size_148, unk_stance_width_range_size_148).

0.88::acc(s_mv, stance_width_range_size_148).

measured(s_mv, stance_width_range_size_148, r18_5_23_25).

all_consistent(stance_width_range_size_148) :-
    (indep(s_mv), consistent(s_mv, stance_width_range_size_148) ; \+indep(s_mv)).

evidence(all_consistent(stance_width_range_size_148)).
query(true_val(stance_width_range_size_148, r18_5_23_25)).
query(true_val(stance_width_range_size_148, unk_stance_width_range_size_148)).

% @attr stance_width_range_size_152
% @type categorical
% @canonical false
% @original_name stance_width_range_size (152cm)
% @unit in
% @values r19_25_24_0=19.25-24.0in unk_stance_width_range_size_152=Unknown
% @importance 0.9

0.88::true_val(stance_width_range_size_152, r19_25_24_0); 0.12::true_val(stance_width_range_size_152, unk_stance_width_range_size_152).

0.88::acc(s_mv, stance_width_range_size_152).

measured(s_mv, stance_width_range_size_152, r19_25_24_0).

all_consistent(stance_width_range_size_152) :-
    (indep(s_mv), consistent(s_mv, stance_width_range_size_152) ; \+indep(s_mv)).

evidence(all_consistent(stance_width_range_size_152)).
query(true_val(stance_width_range_size_152, r19_25_24_0)).
query(true_val(stance_width_range_size_152, unk_stance_width_range_size_152)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @unit in
% @values r19_25_24_0=19.25-24.0in unk_stance_width_range_size=Unknown
% @importance 0.9

0.88::true_val(stance_width_range_size, r19_25_24_0); 0.12::true_val(stance_width_range_size, unk_stance_width_range_size).

0.88::acc(s_mv, stance_width_range_size).

measured(s_mv, stance_width_range_size, r19_25_24_0).

all_consistent(stance_width_range_size) :-
    (indep(s_mv), consistent(s_mv, stance_width_range_size) ; \+indep(s_mv)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r19_25_24_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_158
% @type categorical
% @canonical false
% @original_name stance_width_range_size (158cm)
% @unit in
% @values r19_25_24_0=19.25-24.0in unk_stance_width_range_size_158=Unknown
% @importance 0.9

0.88::true_val(stance_width_range_size_158, r19_25_24_0); 0.12::true_val(stance_width_range_size_158, unk_stance_width_range_size_158).

0.88::acc(s_mv, stance_width_range_size_158).

measured(s_mv, stance_width_range_size_158, r19_25_24_0).

all_consistent(stance_width_range_size_158) :-
    (indep(s_mv), consistent(s_mv, stance_width_range_size_158) ; \+indep(s_mv)).

evidence(all_consistent(stance_width_range_size_158)).
query(true_val(stance_width_range_size_158, r19_25_24_0)).
query(true_val(stance_width_range_size_158, unk_stance_width_range_size_158)).

% @attr stance_width_range_size_161
% @type categorical
% @canonical false
% @original_name stance_width_range_size (161cm)
% @unit in
% @values r19_25_24_0=19.25-24.0in unk_stance_width_range_size_161=Unknown
% @importance 0.9

0.88::true_val(stance_width_range_size_161, r19_25_24_0); 0.12::true_val(stance_width_range_size_161, unk_stance_width_range_size_161).

0.88::acc(s_mv, stance_width_range_size_161).

measured(s_mv, stance_width_range_size_161, r19_25_24_0).

all_consistent(stance_width_range_size_161) :-
    (indep(s_mv), consistent(s_mv, stance_width_range_size_161) ; \+indep(s_mv)).

evidence(all_consistent(stance_width_range_size_161)).
query(true_val(stance_width_range_size_161, r19_25_24_0)).
query(true_val(stance_width_range_size_161, unk_stance_width_range_size_161)).

% @attr recommended_weight_range_size_144
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (144cm)
% @values w50kg_110lbs=50plus_kg_110plus_lbs unk_rec_weight_144=Unknown
% @importance 0.95

0.92::true_val(recommended_weight_range_size_144, w50kg_110lbs); 0.08::true_val(recommended_weight_range_size_144, unk_rec_weight_144).

0.88::acc(s_mv, recommended_weight_range_size_144).
0.93::acc(s1, recommended_weight_range_size_144).

measured(s_mv, recommended_weight_range_size_144, w50kg_110lbs).
measured(s1, recommended_weight_range_size_144, w50kg_110lbs).

all_consistent(recommended_weight_range_size_144) :-
    consistent(s1, recommended_weight_range_size_144),
    (indep(s_mv), consistent(s_mv, recommended_weight_range_size_144) ; \+indep(s_mv)).

evidence(all_consistent(recommended_weight_range_size_144)).
query(true_val(recommended_weight_range_size_144, w50kg_110lbs)).
query(true_val(recommended_weight_range_size_144, unk_rec_weight_144)).

% @attr recommended_weight_range_size_148
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (148cm)
% @values w50kg_120lbs=50plus_kg_120plus_lbs unk_rec_weight_148=Unknown
% @importance 0.95

0.92::true_val(recommended_weight_range_size_148, w50kg_120lbs); 0.08::true_val(recommended_weight_range_size_148, unk_rec_weight_148).

0.88::acc(s_mv, recommended_weight_range_size_148).
0.93::acc(s1, recommended_weight_range_size_148).

measured(s_mv, recommended_weight_range_size_148, w50kg_120lbs).
measured(s1, recommended_weight_range_size_148, w50kg_120lbs).

all_consistent(recommended_weight_range_size_148) :-
    consistent(s1, recommended_weight_range_size_148),
    (indep(s_mv), consistent(s_mv, recommended_weight_range_size_148) ; \+indep(s_mv)).

evidence(all_consistent(recommended_weight_range_size_148)).
query(true_val(recommended_weight_range_size_148, w50kg_120lbs)).
query(true_val(recommended_weight_range_size_148, unk_rec_weight_148)).

% @attr recommended_weight_range_size_152
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (152cm)
% @values w60kg_130lbs=60plus_kg_130plus_lbs unk_rec_weight_152=Unknown
% @importance 0.95

0.92::true_val(recommended_weight_range_size_152, w60kg_130lbs); 0.08::true_val(recommended_weight_range_size_152, unk_rec_weight_152).

0.88::acc(s_mv, recommended_weight_range_size_152).
0.93::acc(s1, recommended_weight_range_size_152).

measured(s_mv, recommended_weight_range_size_152, w60kg_130lbs).
measured(s1, recommended_weight_range_size_152, w60kg_130lbs).

all_consistent(recommended_weight_range_size_152) :-
    consistent(s1, recommended_weight_range_size_152),
    (indep(s_mv), consistent(s_mv, recommended_weight_range_size_152) ; \+indep(s_mv)).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, w60kg_130lbs)).
query(true_val(recommended_weight_range_size_152, unk_rec_weight_152)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w65kg_140lbs=65plus_kg_140plus_lbs unk_recommended_weight_range_size=Unknown
% @importance 0.95

0.92::true_val(recommended_weight_range_size, w65kg_140lbs); 0.08::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

0.88::acc(s_mv, recommended_weight_range_size).
0.93::acc(s1, recommended_weight_range_size).

measured(s_mv, recommended_weight_range_size, w65kg_140lbs).
measured(s1, recommended_weight_range_size, w65kg_140lbs).

all_consistent(recommended_weight_range_size) :-
    consistent(s1, recommended_weight_range_size),
    (indep(s_mv), consistent(s_mv, recommended_weight_range_size) ; \+indep(s_mv)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w65kg_140lbs)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_158
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (158cm)
% @values w70kg_145lbs=70plus_kg_145plus_lbs unk_rec_weight_158=Unknown
% @importance 0.95

0.92::true_val(recommended_weight_range_size_158, w70kg_145lbs); 0.08::true_val(recommended_weight_range_size_158, unk_rec_weight_158).

0.88::acc(s_mv, recommended_weight_range_size_158).
0.93::acc(s1, recommended_weight_range_size_158).

measured(s_mv, recommended_weight_range_size_158, w70kg_145lbs).
measured(s1, recommended_weight_range_size_158, w70kg_145lbs).

all_consistent(recommended_weight_range_size_158) :-
    consistent(s1, recommended_weight_range_size_158),
    (indep(s_mv), consistent(s_mv, recommended_weight_range_size_158) ; \+indep(s_mv)).

evidence(all_consistent(recommended_weight_range_size_158)).
query(true_val(recommended_weight_range_size_158, w70kg_145lbs)).
query(true_val(recommended_weight_range_size_158, unk_rec_weight_158)).

% @attr recommended_weight_range_size_161
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (161cm)
% @values w70kg_150lbs=70plus_kg_150plus_lbs unk_rec_weight_161=Unknown
% @importance 0.95

0.92::true_val(recommended_weight_range_size_161, w70kg_150lbs); 0.08::true_val(recommended_weight_range_size_161, unk_rec_weight_161).

0.88::acc(s_mv, recommended_weight_range_size_161).
0.93::acc(s1, recommended_weight_range_size_161).

measured(s_mv, recommended_weight_range_size_161, w70kg_150lbs).
measured(s1, recommended_weight_range_size_161, w70kg_150lbs).

all_consistent(recommended_weight_range_size_161) :-
    consistent(s1, recommended_weight_range_size_161),
    (indep(s_mv), consistent(s_mv, recommended_weight_range_size_161) ; \+indep(s_mv)).

evidence(all_consistent(recommended_weight_range_size_161)).
query(true_val(recommended_weight_range_size_161, w70kg_150lbs)).
query(true_val(recommended_weight_range_size_161, unk_rec_weight_161)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced advanced_expert=Advanced_Expert
% @importance 0.9

0.30::true_val(rider_level, intermediate_advanced); 0.70::true_val(rider_level, advanced_expert).

0.75::acc(s_mv, rider_level).
0.85::acc(s24, rider_level).
0.85::acc(s33, rider_level).

measured(s_mv, rider_level, intermediate_advanced).
measured(s24, rider_level, advanced_expert).
measured(s33, rider_level, advanced_expert).

all_consistent(rider_level) :-
    consistent(s33, rider_level),
    (indep(s_mv), consistent(s_mv, rider_level) ; \+indep(s_mv)),
    (indep(s24), consistent(s24, rider_level) ; \+indep(s24)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, advanced_expert)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values advanced_expert=Advanced_Expert unk_skill_level_recommendation=Unknown
% @importance 0.93

0.95::true_val(skill_level_recommendation, advanced_expert); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

0.85::acc(s24, skill_level_recommendation).
0.85::acc(s33, skill_level_recommendation).
0.93::acc(s1, skill_level_recommendation).

measured(s24, skill_level_recommendation, advanced_expert).
measured(s33, skill_level_recommendation, advanced_expert).
measured(s1, skill_level_recommendation, advanced_expert).

all_consistent(skill_level_recommendation) :-
    consistent(s1, skill_level_recommendation),
    consistent(s33, skill_level_recommendation),
    (indep(s24), consistent(s24, skill_level_recommendation) ; \+indep(s24)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced_expert)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr ideal_boot_sizes_148
% @type categorical
% @canonical false
% @original_name ideal boot sizes 148cm
% @values us_8_9=US_8_to_9 unk_ideal_boot_sizes_148=Unknown
% @importance 0.95

0.80::true_val(ideal_boot_sizes_148, us_8_9); 0.20::true_val(ideal_boot_sizes_148, unk_ideal_boot_sizes_148).

0.83::acc(s33, ideal_boot_sizes_148).

measured(s33, ideal_boot_sizes_148, us_8_9).

all_consistent(ideal_boot_sizes_148) :- consistent(s33, ideal_boot_sizes_148).

evidence(all_consistent(ideal_boot_sizes_148)).
query(true_val(ideal_boot_sizes_148, us_8_9)).
query(true_val(ideal_boot_sizes_148, unk_ideal_boot_sizes_148)).

% @attr ideal_boot_sizes_152
% @type categorical
% @canonical false
% @original_name ideal boot sizes 152cm
% @values us_9_10=US_9_to_10 unk_ideal_boot_sizes_152=Unknown
% @importance 0.95

0.80::true_val(ideal_boot_sizes_152, us_9_10); 0.20::true_val(ideal_boot_sizes_152, unk_ideal_boot_sizes_152).

0.83::acc(s33, ideal_boot_sizes_152).

measured(s33, ideal_boot_sizes_152, us_9_10).

all_consistent(ideal_boot_sizes_152) :- consistent(s33, ideal_boot_sizes_152).

evidence(all_consistent(ideal_boot_sizes_152)).
query(true_val(ideal_boot_sizes_152, us_9_10)).
query(true_val(ideal_boot_sizes_152, unk_ideal_boot_sizes_152)).

% @attr ideal_boot_sizes_155
% @type categorical
% @canonical false
% @original_name ideal boot sizes 155cm
% @values us_10_11=US_10_to_11 unk_ideal_boot_sizes_155=Unknown
% @importance 0.95

0.80::true_val(ideal_boot_sizes_155, us_10_11); 0.20::true_val(ideal_boot_sizes_155, unk_ideal_boot_sizes_155).

0.83::acc(s33, ideal_boot_sizes_155).

measured(s33, ideal_boot_sizes_155, us_10_11).

all_consistent(ideal_boot_sizes_155) :- consistent(s33, ideal_boot_sizes_155).

evidence(all_consistent(ideal_boot_sizes_155)).
query(true_val(ideal_boot_sizes_155, us_10_11)).
query(true_val(ideal_boot_sizes_155, unk_ideal_boot_sizes_155)).

% @attr ideal_boot_sizes_158
% @type categorical
% @canonical false
% @original_name ideal boot sizes 158cm
% @values us_11_12=US_11_to_12 unk_ideal_boot_sizes_158=Unknown
% @importance 0.95

0.80::true_val(ideal_boot_sizes_158, us_11_12); 0.20::true_val(ideal_boot_sizes_158, unk_ideal_boot_sizes_158).

0.83::acc(s33, ideal_boot_sizes_158).

measured(s33, ideal_boot_sizes_158, us_11_12).

all_consistent(ideal_boot_sizes_158) :- consistent(s33, ideal_boot_sizes_158).

evidence(all_consistent(ideal_boot_sizes_158)).
query(true_val(ideal_boot_sizes_158, us_11_12)).
query(true_val(ideal_boot_sizes_158, unk_ideal_boot_sizes_158)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mtn_freeride_powder_hardpack_ice=All_Mountain_Freeride_powder_hardpack_icy_groomers unk_terrain_suitability=Unknown
% @importance 0.9

0.90::true_val(terrain_suitability, all_mtn_freeride_powder_hardpack_ice); 0.10::true_val(terrain_suitability, unk_terrain_suitability).

0.88::acc(s_mv, terrain_suitability).

measured(s_mv, terrain_suitability, all_mtn_freeride_powder_hardpack_ice).

all_consistent(terrain_suitability) :-
    (indep(s_mv), consistent(s_mv, terrain_suitability) ; \+indep(s_mv)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mtn_freeride_powder_hardpack_ice)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values slash_blast_rip=Slashing_powder_blasting_hardpack_ripping_icy_groomers unk_riding_style=Unknown
% @importance 0.9

0.90::true_val(riding_style, slash_blast_rip); 0.10::true_val(riding_style, unk_riding_style).

0.88::acc(s_mv, riding_style).

measured(s_mv, riding_style, slash_blast_rip).

all_consistent(riding_style) :-
    (indep(s_mv), consistent(s_mv, riding_style) ; \+indep(s_mv)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, slash_blast_rip)).
query(true_val(riding_style, unk_riding_style)).

% @attr quiver_status
% @type categorical
% @canonical false
% @original_name quiver status
% @values one_board_quiver=One_board_quiver unk_quiver_status=Unknown
% @importance 0.9

0.92::true_val(quiver_status, one_board_quiver); 0.08::true_val(quiver_status, unk_quiver_status).

0.88::acc(s_mv, quiver_status).
0.93::acc(s1, quiver_status).

measured(s_mv, quiver_status, one_board_quiver).
measured(s1, quiver_status, one_board_quiver).

all_consistent(quiver_status) :-
    consistent(s1, quiver_status),
    (indep(s_mv), consistent(s_mv, quiver_status) ; \+indep(s_mv)).

evidence(all_consistent(quiver_status)).
query(true_val(quiver_status, one_board_quiver)).
query(true_val(quiver_status, unk_quiver_status)).

% @attr one_board_quiver_caveat
% @type categorical
% @canonical false
% @original_name one-board quiver caveat
% @values no_rails_need_twin_for_jib=Works_if_no_rails_park_jibbers_need_twin unk_one_board_quiver_caveat=Unknown
% @importance 0.8

0.70::true_val(one_board_quiver_caveat, no_rails_need_twin_for_jib); 0.30::true_val(one_board_quiver_caveat, unk_one_board_quiver_caveat).

0.72::acc(s40, one_board_quiver_caveat).

measured(s40, one_board_quiver_caveat, no_rails_need_twin_for_jib).

all_consistent(one_board_quiver_caveat) :- consistent(s40, one_board_quiver_caveat).

evidence(all_consistent(one_board_quiver_caveat)).
query(true_val(one_board_quiver_caveat, no_rails_need_twin_for_jib)).
query(true_val(one_board_quiver_caveat, unk_one_board_quiver_caveat)).

% @attr freestyle_park_rating
% @type categorical
% @canonical true
% @original_name freestyle_park_rating
% @values better_jumping_than_jibbing=Better_jumping_than_jibbing_pop_15pct_above_avg unk_freestyle_park_rating=Unknown
% @importance 0.8

0.70::true_val(freestyle_park_rating, better_jumping_than_jibbing); 0.30::true_val(freestyle_park_rating, unk_freestyle_park_rating).

0.72::acc(s41, freestyle_park_rating).

measured(s41, freestyle_park_rating, better_jumping_than_jibbing).

all_consistent(freestyle_park_rating) :- consistent(s41, freestyle_park_rating).

evidence(all_consistent(freestyle_park_rating)).
query(true_val(freestyle_park_rating, better_jumping_than_jibbing)).
query(true_val(freestyle_park_rating, unk_freestyle_park_rating)).

% @attr board_description
% @type categorical
% @canonical false
% @original_name board description
% @values retro_unique_advanced=Retro_shape_unique_aesthetics_advanced_performance unk_board_description=Unknown
% @importance 0.9

0.90::true_val(board_description, retro_unique_advanced); 0.10::true_val(board_description, unk_board_description).

0.88::acc(s_mv, board_description).

measured(s_mv, board_description, retro_unique_advanced).

all_consistent(board_description) :-
    (indep(s_mv), consistent(s_mv, board_description) ; \+indep(s_mv)).

evidence(all_consistent(board_description)).
query(true_val(board_description, retro_unique_advanced)).
query(true_val(board_description, unk_board_description)).

% @attr graphic_designer_artist
% @type categorical
% @canonical false
% @original_name graphic_designer_artist
% @values gnu_gift_shop=By_GNU_Gift_Shop unk_graphic_designer_artist=Unknown
% @importance 1.0

0.90::true_val(graphic_designer_artist, gnu_gift_shop); 0.10::true_val(graphic_designer_artist, unk_graphic_designer_artist).

0.93::acc(s1, graphic_designer_artist).

measured(s1, graphic_designer_artist, gnu_gift_shop).

all_consistent(graphic_designer_artist) :- consistent(s1, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, gnu_gift_shop)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr review_rating_gnu_com
% @type categorical
% @canonical false
% @original_name review rating (GNU.com)
% @values pct99_of_100_43_reviews=99pct_of_100_with_43_reviews unk_review_rating_gnu_com=Unknown
% @importance 1.0

0.90::true_val(review_rating_gnu_com, pct99_of_100_43_reviews); 0.10::true_val(review_rating_gnu_com, unk_review_rating_gnu_com).

0.90::acc(s1, review_rating_gnu_com).

measured(s1, review_rating_gnu_com, pct99_of_100_43_reviews).

all_consistent(review_rating_gnu_com) :- consistent(s1, review_rating_gnu_com).

evidence(all_consistent(review_rating_gnu_com)).
query(true_val(review_rating_gnu_com, pct99_of_100_43_reviews)).
query(true_val(review_rating_gnu_com, unk_review_rating_gnu_com)).

% @attr review_rating_botw
% @type numeric
% @canonical false
% @original_name review rating (Board of the World)
% @values v87_5=87.5 unk_review_rating_botw=Unknown
% @importance 0.85

0.63::true_val(review_rating_botw, v87_5); 0.37::true_val(review_rating_botw, unk_review_rating_botw).

0.68::acc(s27, review_rating_botw).

measured(s27, review_rating_botw, v87_5).

all_consistent(review_rating_botw) :- consistent(s27, review_rating_botw).

evidence(all_consistent(review_rating_botw)).
query(true_val(review_rating_botw, v87_5)).
query(true_val(review_rating_botw, unk_review_rating_botw)).

% @attr review_rating_tgr
% @type numeric
% @canonical false
% @original_name review rating (The Good Ride)
% @values v4_0=4.0 unk_review_rating_tgr=Unknown
% @importance 0.95

0.72::true_val(review_rating_tgr, v4_0); 0.28::true_val(review_rating_tgr, unk_review_rating_tgr).

0.78::acc(s33, review_rating_tgr).

measured(s33, review_rating_tgr, v4_0).

all_consistent(review_rating_tgr) :- consistent(s33, review_rating_tgr).

evidence(all_consistent(review_rating_tgr)).
query(true_val(review_rating_tgr, v4_0)).
query(true_val(review_rating_tgr, unk_review_rating_tgr)).

% @attr all_mountain_ranking_botw
% @type categorical
% @canonical false
% @original_name all-mountain category ranking (Board of the World)
% @values rank_14_of_38=14th_out_of_38 unk_all_mountain_ranking_botw=Unknown
% @importance 0.85

0.63::true_val(all_mountain_ranking_botw, rank_14_of_38); 0.37::true_val(all_mountain_ranking_botw, unk_all_mountain_ranking_botw).

0.68::acc(s27, all_mountain_ranking_botw).

measured(s27, all_mountain_ranking_botw, rank_14_of_38).

all_consistent(all_mountain_ranking_botw) :- consistent(s27, all_mountain_ranking_botw).

evidence(all_consistent(all_mountain_ranking_botw)).
query(true_val(all_mountain_ranking_botw, rank_14_of_38)).
query(true_val(all_mountain_ranking_botw, unk_all_mountain_ranking_botw)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values excellent=Excellent_icy_snow_level unk_edge_hold=Unknown
% @importance 0.9

0.92::true_val(edge_hold, excellent); 0.08::true_val(edge_hold, unk_edge_hold).

0.85::acc(s33, edge_hold).
0.78::acc(s43, edge_hold).

measured(s33, edge_hold, excellent).
measured(s43, edge_hold, excellent).

all_consistent(edge_hold) :- consistent(s33, edge_hold), consistent(s43, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, excellent)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values excellent=Excellent unk_carving_rating_tgr=Unknown
% @importance 0.95

0.80::true_val(carving_rating_tgr, excellent); 0.20::true_val(carving_rating_tgr, unk_carving_rating_tgr).

0.83::acc(s33, carving_rating_tgr).

measured(s33, carving_rating_tgr, excellent).

all_consistent(carving_rating_tgr) :- consistent(s33, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, excellent)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values excellent=Excellent unk_pop=Unknown
% @importance 0.95

0.80::true_val(pop, excellent); 0.20::true_val(pop, unk_pop).

0.83::acc(s33, pop).

measured(s33, pop, excellent).

all_consistent(pop) :- consistent(s33, pop).

evidence(all_consistent(pop)).
query(true_val(pop, excellent)).
query(true_val(pop, unk_pop)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values good_below_avg=Good_below_avg_for_short_wide_category unk_powder_rating_tgr=Unknown
% @importance 0.95

0.80::true_val(powder_rating_tgr, good_below_avg); 0.20::true_val(powder_rating_tgr, unk_powder_rating_tgr).

0.83::acc(s33, powder_rating_tgr).

measured(s33, powder_rating_tgr, good_below_avg).

all_consistent(powder_rating_tgr) :- consistent(s33, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good_below_avg)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good_below_avg=Good_below_avg_for_price unk_base_glide_performance=Unknown
% @importance 0.95

0.80::true_val(base_glide_performance, good_below_avg); 0.20::true_val(base_glide_performance, unk_base_glide_performance).

0.83::acc(s33, base_glide_performance).

measured(s33, base_glide_performance, good_below_avg).

all_consistent(base_glide_performance) :- consistent(s33, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good_below_avg)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_rating_tgr=Unknown
% @importance 0.95

0.80::true_val(speed_rating_tgr, good); 0.20::true_val(speed_rating_tgr, unk_speed_rating_tgr).

0.83::acc(s33, speed_rating_tgr).

measured(s33, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :- consistent(s33, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_rating_tgr)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values good=Good unk_chatter_performance=Unknown
% @importance 0.95

0.80::true_val(chatter_performance, good); 0.20::true_val(chatter_performance, unk_chatter_performance).

0.83::acc(s33, chatter_performance).

measured(s33, chatter_performance, good).

all_consistent(chatter_performance) :- consistent(s33, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, good)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values average=Average unk_switch_riding=Unknown
% @importance 0.95

0.80::true_val(switch_riding, average); 0.20::true_val(switch_riding, unk_switch_riding).

0.83::acc(s33, switch_riding).

measured(s33, switch_riding, average).

all_consistent(switch_riding) :- consistent(s33, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, average)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_rating_tgr=Unknown
% @importance 0.95

0.80::true_val(jibbing_rating_tgr, average); 0.20::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

0.83::acc(s33, jibbing_rating_tgr).

measured(s33, jibbing_rating_tgr, average).

all_consistent(jibbing_rating_tgr) :- consistent(s33, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_locked_in=Semi_Locked_In unk_on_snow_feel_tgr=Unknown
% @importance 0.95

0.80::true_val(on_snow_feel_tgr, semi_locked_in); 0.20::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

0.83::acc(s33, on_snow_feel_tgr).

measured(s33, on_snow_feel_tgr, semi_locked_in).

all_consistent(on_snow_feel_tgr) :- consistent(s33, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_locked_in)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium=Medium unk_turn_initiation_performance=Unknown
% @importance 0.95

0.80::true_val(turn_initiation_performance, medium); 0.20::true_val(turn_initiation_performance, unk_turn_initiation_performance).

0.83::acc(s33, turn_initiation_performance).

measured(s33, turn_initiation_performance, medium).

all_consistent(turn_initiation_performance) :- consistent(s33, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr skidded_turns
% @type categorical
% @canonical false
% @original_name skidded turns
% @values semi_hard=Semi_Hard_not_for_beginners unk_skidded_turns=Unknown
% @importance 0.95

0.80::true_val(skidded_turns, semi_hard); 0.20::true_val(skidded_turns, unk_skidded_turns).

0.83::acc(s33, skidded_turns).

measured(s33, skidded_turns, semi_hard).

all_consistent(skidded_turns) :- consistent(s33, skidded_turns).

evidence(all_consistent(skidded_turns)).
query(true_val(skidded_turns, semi_hard)).
query(true_val(skidded_turns, unk_skidded_turns)).

% @attr buttering
% @type categorical
% @canonical true
% @original_name buttering
% @values moderate=Moderate unk_buttering=Unknown
% @importance 0.95

0.80::true_val(buttering, moderate); 0.20::true_val(buttering, unk_buttering).

0.83::acc(s33, buttering).

measured(s33, buttering, moderate).

all_consistent(buttering) :- consistent(s33, buttering).

evidence(all_consistent(buttering)).
query(true_val(buttering, moderate)).
query(true_val(buttering, unk_buttering)).

% @attr dampening
% @type categorical
% @canonical true
% @original_name dampening
% @values quite_damp=Quite_damp_heavy_weight_smooth_ride unk_dampening=Unknown
% @importance 0.8

0.70::true_val(dampening, quite_damp); 0.30::true_val(dampening, unk_dampening).

0.73::acc(s42, dampening).

measured(s42, dampening, quite_damp).

all_consistent(dampening) :- consistent(s42, dampening).

evidence(all_consistent(dampening)).
query(true_val(dampening, quite_damp)).
query(true_val(dampening, unk_dampening)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values heavier_than_avg=Heavier_than_average_for_length unk_board_weight_grams=Unknown
% @importance 0.8

0.70::true_val(board_weight_grams, heavier_than_avg); 0.30::true_val(board_weight_grams, unk_board_weight_grams).

0.73::acc(s42, board_weight_grams).

measured(s42, board_weight_grams, heavier_than_avg).

all_consistent(board_weight_grams) :- consistent(s42, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, heavier_than_avg)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr carving_experience_botw
% @type categorical
% @canonical false
% @original_name carving experience (Board of the World)
% @values cruisy_responsive_precise=Cruisy_responsive_precise_controlled unk_carving_experience_botw=Unknown
% @importance 0.85

0.70::true_val(carving_experience_botw, cruisy_responsive_precise); 0.30::true_val(carving_experience_botw, unk_carving_experience_botw).

0.72::acc(s43, carving_experience_botw).

measured(s43, carving_experience_botw, cruisy_responsive_precise).

all_consistent(carving_experience_botw) :- consistent(s43, carving_experience_botw).

evidence(all_consistent(carving_experience_botw)).
query(true_val(carving_experience_botw, cruisy_responsive_precise)).
query(true_val(carving_experience_botw, unk_carving_experience_botw)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values below_avg_base_glide=Below_average_base_glide_for_price_slow_in_powder unk_negative_aspect=Unknown
% @importance 0.95

0.80::true_val(negative_aspect, below_avg_base_glide); 0.20::true_val(negative_aspect, unk_negative_aspect).

0.83::acc(s33, negative_aspect).

measured(s33, negative_aspect, below_avg_base_glide).

all_consistent(negative_aspect) :- consistent(s33, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, below_avg_base_glide)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr negative_aspect_powder
% @type categorical
% @canonical false
% @original_name negative_aspect (powder float)
% @values below_avg_powder_float=Below_avg_powder_float_vs_Orca_Yes_Hybrid unk_negative_aspect_powder=Unknown
% @importance 0.95

0.80::true_val(negative_aspect_powder, below_avg_powder_float); 0.20::true_val(negative_aspect_powder, unk_negative_aspect_powder).

0.83::acc(s33, negative_aspect_powder).

measured(s33, negative_aspect_powder, below_avg_powder_float).

all_consistent(negative_aspect_powder) :- consistent(s33, negative_aspect_powder).

evidence(all_consistent(negative_aspect_powder)).
query(true_val(negative_aspect_powder, below_avg_powder_float)).
query(true_val(negative_aspect_powder, unk_negative_aspect_powder)).

% @attr negative_aspect_aggressive
% @type categorical
% @canonical false
% @original_name negative_aspect (aggressive)
% @values too_aggressive_beginners=Too_aggressive_and_catchy_for_beginners unk_negative_aspect_aggressive=Unknown
% @importance 0.8

0.70::true_val(negative_aspect_aggressive, too_aggressive_beginners); 0.30::true_val(negative_aspect_aggressive, unk_negative_aspect_aggressive).

0.72::acc(s41, negative_aspect_aggressive).

measured(s41, negative_aspect_aggressive, too_aggressive_beginners).

all_consistent(negative_aspect_aggressive) :- consistent(s41, negative_aspect_aggressive).

evidence(all_consistent(negative_aspect_aggressive)).
query(true_val(negative_aspect_aggressive, too_aggressive_beginners)).
query(true_val(negative_aspect_aggressive, unk_negative_aspect_aggressive)).

% @attr negative_aspect_graphics
% @type categorical
% @canonical false
% @original_name negative_aspect (graphics)
% @values plain_graphics_some_years=Some_model_years_have_plain_understated_graphics unk_negative_aspect_graphics=Unknown
% @importance 0.8

0.70::true_val(negative_aspect_graphics, plain_graphics_some_years); 0.30::true_val(negative_aspect_graphics, unk_negative_aspect_graphics).

0.72::acc(s41, negative_aspect_graphics).

measured(s41, negative_aspect_graphics, plain_graphics_some_years).

all_consistent(negative_aspect_graphics) :- consistent(s41, negative_aspect_graphics).

evidence(all_consistent(negative_aspect_graphics)).
query(true_val(negative_aspect_graphics, plain_graphics_some_years)).
query(true_val(negative_aspect_graphics, unk_negative_aspect_graphics)).

% @attr negative_aspect_rocker
% @type categorical
% @canonical false
% @original_name negative_aspect (rocker)
% @values lack_of_rocker_limits_powder=Lack_of_rocker_stops_elite_powder_performance unk_negative_aspect_rocker=Unknown
% @importance 0.8

0.70::true_val(negative_aspect_rocker, lack_of_rocker_limits_powder); 0.30::true_val(negative_aspect_rocker, unk_negative_aspect_rocker).

0.73::acc(s42, negative_aspect_rocker).

measured(s42, negative_aspect_rocker, lack_of_rocker_limits_powder).

all_consistent(negative_aspect_rocker) :- consistent(s42, negative_aspect_rocker).

evidence(all_consistent(negative_aspect_rocker)).
query(true_val(negative_aspect_rocker, lack_of_rocker_limits_powder)).
query(true_val(negative_aspect_rocker, unk_negative_aspect_rocker)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values lib_tech_orca=Lib_Tech_Orca_more_stable_precise_vs_nimble unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.70::true_val(comparable_board_cross_brand, lib_tech_orca); 0.30::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

0.72::acc(s43, comparable_board_cross_brand).

measured(s43, comparable_board_cross_brand, lib_tech_orca).

all_consistent(comparable_board_cross_brand) :- consistent(s43, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, lib_tech_orca)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_dinghy
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nitro Dinghy)
% @values nitro_dinghy=Nitro_Dinghy_Gremlin_stiffer_more_aggressive unk_comp_dinghy=Unknown
% @importance 0.8

0.65::true_val(comparable_board_cross_brand_dinghy, nitro_dinghy); 0.35::true_val(comparable_board_cross_brand_dinghy, unk_comp_dinghy).

0.55::acc(s45, comparable_board_cross_brand_dinghy).

measured(s45, comparable_board_cross_brand_dinghy, nitro_dinghy).

all_consistent(comparable_board_cross_brand_dinghy) :- consistent(s45, comparable_board_cross_brand_dinghy).

evidence(all_consistent(comparable_board_cross_brand_dinghy)).
query(true_val(comparable_board_cross_brand_dinghy, nitro_dinghy)).
query(true_val(comparable_board_cross_brand_dinghy, unk_comp_dinghy)).

% @attr comparable_board_cross_brand_hybrid
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Yes Hybrid)
% @values yes_hybrid=Yes_Hybrid_similar_short_wide_volume_shift unk_comp_hybrid=Unknown
% @importance 0.95

0.80::true_val(comparable_board_cross_brand_hybrid, yes_hybrid); 0.20::true_val(comparable_board_cross_brand_hybrid, unk_comp_hybrid).

0.83::acc(s33, comparable_board_cross_brand_hybrid).

measured(s33, comparable_board_cross_brand_hybrid, yes_hybrid).

all_consistent(comparable_board_cross_brand_hybrid) :- consistent(s33, comparable_board_cross_brand_hybrid).

evidence(all_consistent(comparable_board_cross_brand_hybrid)).
query(true_val(comparable_board_cross_brand_hybrid, yes_hybrid)).
query(true_val(comparable_board_cross_brand_hybrid, unk_comp_hybrid)).

% @attr comparable_board_cross_brand_lqk
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Lib Tech Lost Quiver Killer)
% @values lib_tech_lqk=Lib_Tech_Lost_Quiver_Killer unk_comp_lqk=Unknown
% @importance 0.95

0.80::true_val(comparable_board_cross_brand_lqk, lib_tech_lqk); 0.20::true_val(comparable_board_cross_brand_lqk, unk_comp_lqk).

0.83::acc(s33, comparable_board_cross_brand_lqk).

measured(s33, comparable_board_cross_brand_lqk, lib_tech_lqk).

all_consistent(comparable_board_cross_brand_lqk) :- consistent(s33, comparable_board_cross_brand_lqk).

evidence(all_consistent(comparable_board_cross_brand_lqk)).
query(true_val(comparable_board_cross_brand_lqk, lib_tech_lqk)).
query(true_val(comparable_board_cross_brand_lqk, unk_comp_lqk)).

% @attr comparable_board_cross_brand_hovercraft
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Hovercraft)
% @values jones_hovercraft=Jones_Hovercraft_directional_freeride unk_comp_hovercraft=Unknown
% @importance 0.95

0.80::true_val(comparable_board_cross_brand_hovercraft, jones_hovercraft); 0.20::true_val(comparable_board_cross_brand_hovercraft, unk_comp_hovercraft).

0.83::acc(s33, comparable_board_cross_brand_hovercraft).

measured(s33, comparable_board_cross_brand_hovercraft, jones_hovercraft).

all_consistent(comparable_board_cross_brand_hovercraft) :- consistent(s33, comparable_board_cross_brand_hovercraft).

evidence(all_consistent(comparable_board_cross_brand_hovercraft)).
query(true_val(comparable_board_cross_brand_hovercraft, jones_hovercraft)).
query(true_val(comparable_board_cross_brand_hovercraft, unk_comp_hovercraft)).

% @attr comparable_board_cross_brand_harpoon
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Never Summer Harpoon)
% @values ns_harpoon=Never_Summer_Harpoon_short_wide_freeride unk_comp_harpoon=Unknown
% @importance 0.95

0.80::true_val(comparable_board_cross_brand_harpoon, ns_harpoon); 0.20::true_val(comparable_board_cross_brand_harpoon, unk_comp_harpoon).

0.83::acc(s33, comparable_board_cross_brand_harpoon).

measured(s33, comparable_board_cross_brand_harpoon, ns_harpoon).

all_consistent(comparable_board_cross_brand_harpoon) :- consistent(s33, comparable_board_cross_brand_harpoon).

evidence(all_consistent(comparable_board_cross_brand_harpoon)).
query(true_val(comparable_board_cross_brand_harpoon, ns_harpoon)).
query(true_val(comparable_board_cross_brand_harpoon, unk_comp_harpoon)).

% @attr comparable_board_cross_brand_custom
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Custom)
% @values burton_custom=Burton_Custom_top_tier_all_mountain unk_comp_custom=Unknown
% @importance 0.8

0.59::true_val(comparable_board_cross_brand_custom, burton_custom); 0.41::true_val(comparable_board_cross_brand_custom, unk_comp_custom).

0.63::acc(s28, comparable_board_cross_brand_custom).

measured(s28, comparable_board_cross_brand_custom, burton_custom).

all_consistent(comparable_board_cross_brand_custom) :-
    (indep(s28), consistent(s28, comparable_board_cross_brand_custom) ; \+indep(s28)).

evidence(all_consistent(comparable_board_cross_brand_custom)).
query(true_val(comparable_board_cross_brand_custom, burton_custom)).
query(true_val(comparable_board_cross_brand_custom, unk_comp_custom)).

% @attr comparable_board_cross_brand_maverix
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Never Summer Maverix Limited)
% @values ns_maverix_limited=Never_Summer_Maverix_Limited_699_99 unk_comp_maverix=Unknown
% @importance 0.8

0.59::true_val(comparable_board_cross_brand_maverix, ns_maverix_limited); 0.41::true_val(comparable_board_cross_brand_maverix, unk_comp_maverix).

0.63::acc(s28, comparable_board_cross_brand_maverix).

measured(s28, comparable_board_cross_brand_maverix, ns_maverix_limited).

all_consistent(comparable_board_cross_brand_maverix) :-
    (indep(s28), consistent(s28, comparable_board_cross_brand_maverix) ; \+indep(s28)).

evidence(all_consistent(comparable_board_cross_brand_maverix)).
query(true_val(comparable_board_cross_brand_maverix, ns_maverix_limited)).
query(true_val(comparable_board_cross_brand_maverix, unk_comp_maverix)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values bent_metal_union=Bent_Metal_Axtion_Transfer_Union_Ultra unk_binding_compatibility=Unknown
% @importance 0.85

0.63::true_val(binding_compatibility, bent_metal_union); 0.37::true_val(binding_compatibility, unk_binding_compatibility).

0.68::acc(s27, binding_compatibility).

measured(s27, binding_compatibility, bent_metal_union).

all_consistent(binding_compatibility) :- consistent(s27, binding_compatibility).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, bent_metal_union)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr comparable_board_same_brand_core
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (G Lite 3 core)
% @values g_lite_3=G_Lite_3_lighter_stronger_FSC_aspen_paulownia unk_comp_same_brand_core=Unknown
% @importance 0.85

0.71::true_val(comparable_board_same_brand_core, g_lite_3); 0.29::true_val(comparable_board_same_brand_core, unk_comp_same_brand_core).

0.73::acc(s23, comparable_board_same_brand_core).

measured(s23, comparable_board_same_brand_core, g_lite_3).

all_consistent(comparable_board_same_brand_core) :-
    (indep(s23), consistent(s23, comparable_board_same_brand_core) ; \+indep(s23)).

evidence(all_consistent(comparable_board_same_brand_core)).
query(true_val(comparable_board_same_brand_core, g_lite_3)).
query(true_val(comparable_board_same_brand_core, unk_comp_same_brand_core)).

% @attr comparable_board_same_brand_carbon
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Carbon Power Bands)
% @values carbon_power_bands=Carbon_Power_Bands_snap_energy_stability unk_comp_same_brand_carbon=Unknown
% @importance 0.85

0.71::true_val(comparable_board_same_brand_carbon, carbon_power_bands); 0.29::true_val(comparable_board_same_brand_carbon, unk_comp_same_brand_carbon).

0.73::acc(s23, comparable_board_same_brand_carbon).

measured(s23, comparable_board_same_brand_carbon, carbon_power_bands).

all_consistent(comparable_board_same_brand_carbon) :-
    (indep(s23), consistent(s23, comparable_board_same_brand_carbon) ; \+indep(s23)).

evidence(all_consistent(comparable_board_same_brand_carbon)).
query(true_val(comparable_board_same_brand_carbon, carbon_power_bands)).
query(true_val(comparable_board_same_brand_carbon, unk_comp_same_brand_carbon)).

% @attr comparable_board_same_brand_width
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (narrower width)
% @values narrower_quicker_edge=Narrower_than_standard_rails_more_quickly unk_comp_same_brand_width=Unknown
% @importance 0.85

0.71::true_val(comparable_board_same_brand_width, narrower_quicker_edge); 0.29::true_val(comparable_board_same_brand_width, unk_comp_same_brand_width).

0.73::acc(s23, comparable_board_same_brand_width).

measured(s23, comparable_board_same_brand_width, narrower_quicker_edge).

all_consistent(comparable_board_same_brand_width) :-
    (indep(s23), consistent(s23, comparable_board_same_brand_width) ; \+indep(s23)).

evidence(all_consistent(comparable_board_same_brand_width)).
query(true_val(comparable_board_same_brand_width, narrower_quicker_edge)).
query(true_val(comparable_board_same_brand_width, unk_comp_same_brand_width)).

% @attr comparable_board_same_brand_sizing
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (normal sizing)
% @values normal_size_no_size_down=Ride_normal_size_do_not_size_down unk_comp_same_brand_sizing=Unknown
% @importance 0.85

0.71::true_val(comparable_board_same_brand_sizing, normal_size_no_size_down); 0.29::true_val(comparable_board_same_brand_sizing, unk_comp_same_brand_sizing).

0.73::acc(s23, comparable_board_same_brand_sizing).

measured(s23, comparable_board_same_brand_sizing, normal_size_no_size_down).

all_consistent(comparable_board_same_brand_sizing) :-
    (indep(s23), consistent(s23, comparable_board_same_brand_sizing) ; \+indep(s23)).

evidence(all_consistent(comparable_board_same_brand_sizing)).
query(true_val(comparable_board_same_brand_sizing, normal_size_no_size_down)).
query(true_val(comparable_board_same_brand_sizing, unk_comp_same_brand_sizing)).

% @attr available_sizes_turbo
% @type categorical
% @canonical false
% @original_name available_sizes (Turbo Gremlin)
% @values sizes_155_158_161=155_158_161cm unk_available_sizes_turbo=Unknown
% @importance 0.75

0.59::true_val(available_sizes_turbo, sizes_155_158_161); 0.41::true_val(available_sizes_turbo, unk_available_sizes_turbo).

0.63::acc(s29, available_sizes_turbo).

measured(s29, available_sizes_turbo, sizes_155_158_161).

all_consistent(available_sizes_turbo) :-
    (indep(s29), consistent(s29, available_sizes_turbo) ; \+indep(s29)).

evidence(all_consistent(available_sizes_turbo)).
query(true_val(available_sizes_turbo, sizes_155_158_161)).
query(true_val(available_sizes_turbo, unk_available_sizes_turbo)).

% @attr evo_reputation
% @type categorical
% @canonical false
% @original_name Evo reputation
% @values major_retailer_good_policies=Major_online_retailer_1yr_return_5pct_price_beat unk_evo_reputation=Unknown
% @importance 0.9

0.78::true_val(evo_reputation, major_retailer_good_policies); 0.22::true_val(evo_reputation, unk_evo_reputation).

0.80::acc(s24, evo_reputation).

measured(s24, evo_reputation, major_retailer_good_policies).

all_consistent(evo_reputation) :-
    (indep(s24), consistent(s24, evo_reputation) ; \+indep(s24)).

evidence(all_consistent(evo_reputation)).
query(true_val(evo_reputation, major_retailer_good_policies)).
query(true_val(evo_reputation, unk_evo_reputation)).

% @attr tactics_reputation
% @type categorical
% @canonical false
% @original_name Tactics reputation
% @values reputable_specialty=Reputable_specialty_retailer_low_price_guarantee unk_tactics_reputation=Unknown
% @importance 0.75

0.76::true_val(tactics_reputation, reputable_specialty); 0.24::true_val(tactics_reputation, unk_tactics_reputation).

0.78::acc(s31, tactics_reputation).

measured(s31, tactics_reputation, reputable_specialty).

all_consistent(tactics_reputation) :-
    (indep(s31), consistent(s31, tactics_reputation) ; \+indep(s31)).

evidence(all_consistent(tactics_reputation)).
query(true_val(tactics_reputation, reputable_specialty)).
query(true_val(tactics_reputation, unk_tactics_reputation)).

% @attr backcountry_reputation
% @type categorical
% @canonical false
% @original_name Backcountry reputation
% @values major_us_outdoor=Major_US_outdoor_retailer_wide_selection unk_backcountry_reputation=Unknown
% @importance 0.9

0.64::true_val(backcountry_reputation, major_us_outdoor); 0.36::true_val(backcountry_reputation, unk_backcountry_reputation).

0.68::acc(s25, backcountry_reputation).

measured(s25, backcountry_reputation, major_us_outdoor).

all_consistent(backcountry_reputation) :- consistent(s25, backcountry_reputation).

evidence(all_consistent(backcountry_reputation)).
query(true_val(backcountry_reputation, major_us_outdoor)).
query(true_val(backcountry_reputation, unk_backcountry_reputation)).

% @attr rei_reputation
% @type categorical
% @canonical false
% @original_name REI reputation
% @values well_known_outdoor_coop=Well_known_outdoor_co_op_carries_GNU unk_rei_reputation=Unknown
% @importance 0.85

0.77::true_val(rei_reputation, well_known_outdoor_coop); 0.23::true_val(rei_reputation, unk_rei_reputation).

0.80::acc(s26, rei_reputation).

measured(s26, rei_reputation, well_known_outdoor_coop).

all_consistent(rei_reputation) :-
    (indep(s26), consistent(s26, rei_reputation) ; \+indep(s26)).

evidence(all_consistent(rei_reputation)).
query(true_val(rei_reputation, well_known_outdoor_coop)).
query(true_val(rei_reputation, unk_rei_reputation)).

% @attr amazon_reputation
% @type categorical
% @canonical false
% @original_name Amazon reputation
% @values available_less_specialized=Available_less_specialised_GNU_official_store unk_amazon_reputation=Unknown
% @importance 0.4

0.60::true_val(amazon_reputation, available_less_specialized); 0.40::true_val(amazon_reputation, unk_amazon_reputation).

0.60::acc(s4, amazon_reputation).

measured(s4, amazon_reputation, available_less_specialized).

all_consistent(amazon_reputation) :-
    (indep(s4), consistent(s4, amazon_reputation) ; \+indep(s4)).

evidence(all_consistent(amazon_reputation)).
query(true_val(amazon_reputation, available_less_specialized)).
query(true_val(amazon_reputation, unk_amazon_reputation)).

% @attr salty_peaks_reputation
% @type categorical
% @canonical false
% @original_name Salty Peaks reputation
% @values specialist_utah_shop=Specialist_snowboard_shop_Utah_expert_staff unk_salty_peaks_reputation=Unknown
% @importance 0.3

0.46::true_val(salty_peaks_reputation, specialist_utah_shop); 0.54::true_val(salty_peaks_reputation, unk_salty_peaks_reputation).

0.50::acc(s46, salty_peaks_reputation).

measured(s46, salty_peaks_reputation, specialist_utah_shop).

all_consistent(salty_peaks_reputation) :-
    (indep(s46), consistent(s46, salty_peaks_reputation) ; \+indep(s46)).

evidence(all_consistent(salty_peaks_reputation)).
query(true_val(salty_peaks_reputation, specialist_utah_shop)).
query(true_val(salty_peaks_reputation, unk_salty_peaks_reputation)).

% @attr blauer_board_shop_reputation
% @type categorical
% @canonical false
% @original_name Blauer Board Shop
% @values favorite_store_tgr=Recommended_favorite_store_by_TGR_10_15pct_off unk_blauer_board_shop_reputation=Unknown
% @importance 0.9

0.64::true_val(blauer_board_shop_reputation, favorite_store_tgr); 0.36::true_val(blauer_board_shop_reputation, unk_blauer_board_shop_reputation).

0.68::acc(s25, blauer_board_shop_reputation).

measured(s25, blauer_board_shop_reputation, favorite_store_tgr).

all_consistent(blauer_board_shop_reputation) :- consistent(s25, blauer_board_shop_reputation).

evidence(all_consistent(blauer_board_shop_reputation)).
query(true_val(blauer_board_shop_reputation, favorite_store_tgr)).
query(true_val(blauer_board_shop_reputation, unk_blauer_board_shop_reputation)).