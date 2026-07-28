0.15::indep(s2).
0.12::indep(s4).
0.15::indep(s7).
0.12::indep(s8).
0.20::indep(s13).
0.15::indep(s33).
0.20::indep(s35).
0.20::indep(s44).
0.15::indep(s51).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 1.0

0.95::acc(s1, brand).

0.90::true_val(brand, lib_tech); 0.10::true_val(brand, unk_brand).

measured(s1, brand, lib_tech).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values terrain_wrecker=Terrain_Wrecker unk_model_name=Unknown
% @importance 1.0

0.95::acc(s1, model_name).

0.90::true_val(model_name, terrain_wrecker); 0.10::true_val(model_name, unk_model_name).

measured(s1, model_name, terrain_wrecker).

all_consistent(model_name) :- consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, terrain_wrecker)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027_26_27_season unk_model_year=Unknown
% @importance 0.95

0.80::acc(s2, model_year).

0.71::true_val(model_year, y2027); 0.29::true_val(model_year, unk_model_year).

measured(s2, model_year, y2027).

all_consistent(model_year) :- consistent(s2, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.90::true_val(product_type, snowboard); 0.10::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_directional_twin=All_Mountain_Directional_Twin all_mountain_freeride=All_Mountain_Freeride
% @importance 0.925

0.93::acc(s3, board_category).
0.75::acc(s2, board_category).

0.65::true_val(board_category, all_mountain_directional_twin); 0.35::true_val(board_category, all_mountain_freeride).

measured(s3, board_category, all_mountain_directional_twin).
measured(s2, board_category, all_mountain_freeride).

all_consistent(board_category) :-
    consistent(s3, board_category),
    (indep(s2), consistent(s2, board_category) ; \+indep(s2)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_directional_twin)).
query(true_val(board_category, all_mountain_freeride)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.5

0.70::acc(s4, gender).

0.63::true_val(gender, mens); 0.37::true_val(gender, unk_gender).

measured(s4, gender, mens).

all_consistent(gender) :- consistent(s4, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.8

0.95::acc(s5, manufacturer).

0.90::true_val(manufacturer, mervin_manufacturing); 0.10::true_val(manufacturer, unk_manufacturer).

measured(s5, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :- consistent(s5, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values sequim_wa_usa=Sequim_Washington_USA unk_manufacturing_location_current=Unknown
% @importance 0.65

0.95::acc(s6, manufacturing_location_current).

0.90::true_val(manufacturing_location_current, sequim_wa_usa); 0.10::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s6, manufacturing_location_current, sequim_wa_usa).

all_consistent(manufacturing_location_current) :- consistent(s6, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, sequim_wa_usa)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values handbuilt_usa=Handbuilt_in_the_USA unk_manufacturing_location=Unknown
% @importance 0.6

0.82::acc(s7, manufacturing_location).

0.72::true_val(manufacturing_location, handbuilt_usa); 0.28::true_val(manufacturing_location, unk_manufacturing_location).

measured(s7, manufacturing_location, handbuilt_usa).

all_consistent(manufacturing_location) :-
    (indep(s7), consistent(s7, manufacturing_location) ; \+indep(s7)).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, handbuilt_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_hazardous_waste=Zero_hazardous_waste_production unk_sustainability_certification=Unknown
% @importance 0.5

0.70::acc(s8, sustainability_certification).

0.60::true_val(sustainability_certification, zero_hazardous_waste); 0.40::true_val(sustainability_certification, unk_sustainability_certification).

measured(s8, sustainability_certification, zero_hazardous_waste).

all_consistent(sustainability_certification) :-
    (indep(s8), consistent(s8, sustainability_certification) ; \+indep(s8)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_hazardous_waste)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr sustainability_certification_hydro
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values hydro_89_6=89_6_pct_hydroelectric_biodiesel_heating unk_sustainability_certification_hydro=Unknown
% @importance 0.45

0.85::acc(s9, sustainability_certification_hydro).

0.72::true_val(sustainability_certification_hydro, hydro_89_6); 0.28::true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro).

measured(s9, sustainability_certification_hydro, hydro_89_6).

all_consistent(sustainability_certification_hydro) :- consistent(s9, sustainability_certification_hydro).

evidence(all_consistent(sustainability_certification_hydro)).
query(true_val(sustainability_certification_hydro, hydro_89_6)).
query(true_val(sustainability_certification_hydro, unk_sustainability_certification_hydro)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values fsc_certified_renewable=FSC_certified_fast_growing_renewable_forest_products unk_sustainability_certification_fsc=Unknown
% @importance 0.45

0.85::acc(s10, sustainability_certification_fsc).

0.72::true_val(sustainability_certification_fsc, fsc_certified_renewable); 0.28::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s10, sustainability_certification_fsc, fsc_certified_renewable).

all_consistent(sustainability_certification_fsc) :- consistent(s10, sustainability_certification_fsc).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified_renewable)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr parent_company_current
% @type categorical
% @canonical false
% @original_name Parent company (current)
% @values spring_capital_group=Spring_Capital_Group_acquired_April_2026 unk_parent_company_current=Unknown
% @importance 0.55

0.80::acc(s11, parent_company_current).

0.71::true_val(parent_company_current, spring_capital_group); 0.29::true_val(parent_company_current, unk_parent_company_current).

measured(s11, parent_company_current, spring_capital_group).

all_consistent(parent_company_current) :- consistent(s11, parent_company_current).

evidence(all_consistent(parent_company_current)).
query(true_val(parent_company_current, spring_capital_group)).
query(true_val(parent_company_current, unk_parent_company_current)).

% @attr parent_company_previous
% @type categorical
% @canonical false
% @original_name Parent company (previous)
% @values altamont_capital=Altamont_Capital_2013_2026 unk_parent_company_previous=Unknown
% @importance 0.45

0.65::acc(s12, parent_company_previous).

0.48::true_val(parent_company_previous, altamont_capital); 0.52::true_val(parent_company_previous, unk_parent_company_previous).

measured(s12, parent_company_previous, altamont_capital).

all_consistent(parent_company_previous) :- consistent(s12, parent_company_previous).

evidence(all_consistent(parent_company_previous)).
query(true_val(parent_company_previous, altamont_capital)).
query(true_val(parent_company_previous, unk_parent_company_previous)).

% @attr lib_tech_founding_year
% @type numeric
% @canonical false
% @original_name Lib Tech founding year
% @values v1989=1989
% @importance 0.35

0.75::acc(s13, lib_tech_founding_year).

0.60::true_val(lib_tech_founding_year, v1989); 0.40::true_val(lib_tech_founding_year, unk_lib_tech_founding_year).

measured(s13, lib_tech_founding_year, v1989).

all_consistent(lib_tech_founding_year) :-
    (indep(s13), consistent(s13, lib_tech_founding_year) ; \+indep(s13)).

evidence(all_consistent(lib_tech_founding_year)).
query(true_val(lib_tech_founding_year, v1989)).
query(true_val(lib_tech_founding_year, unk_lib_tech_founding_year)).

% @attr mervin_founders
% @type categorical
% @canonical false
% @original_name Mervin founders
% @values olson_saari=Mike_Olson_and_Pete_Saari unk_mervin_founders=Unknown
% @importance 0.3

0.92::acc(s14, mervin_founders).

0.86::true_val(mervin_founders, olson_saari); 0.14::true_val(mervin_founders, unk_mervin_founders).

measured(s14, mervin_founders, olson_saari).

all_consistent(mervin_founders) :- consistent(s14, mervin_founders).

evidence(all_consistent(mervin_founders)).
query(true_val(mervin_founders, olson_saari)).
query(true_val(mervin_founders, unk_mervin_founders)).

% @attr mervin_market_share
% @type categorical
% @canonical false
% @original_name Mervin market share
% @values pct_23_above_500=23_pct_US_market_above_500 unk_mervin_market_share=Unknown
% @importance 0.55

0.85::acc(s15, mervin_market_share).

0.77::true_val(mervin_market_share, pct_23_above_500); 0.23::true_val(mervin_market_share, unk_mervin_market_share).

measured(s15, mervin_market_share, pct_23_above_500).

all_consistent(mervin_market_share) :- consistent(s15, mervin_market_share).

evidence(all_consistent(mervin_market_share)).
query(true_val(mervin_market_share, pct_23_above_500)).
query(true_val(mervin_market_share, unk_mervin_market_share)).

% @attr mervin_production_volume
% @type categorical
% @canonical false
% @original_name Mervin production volume
% @values approx_100k=Approximately_100000_units_annually unk_mervin_production_volume=Unknown
% @importance 0.35

0.82::acc(s16, mervin_production_volume).

0.72::true_val(mervin_production_volume, approx_100k); 0.28::true_val(mervin_production_volume, unk_mervin_production_volume).

measured(s16, mervin_production_volume, approx_100k).

all_consistent(mervin_production_volume) :- consistent(s16, mervin_production_volume).

evidence(all_consistent(mervin_production_volume)).
query(true_val(mervin_production_volume, approx_100k)).
query(true_val(mervin_production_volume, unk_mervin_production_volume)).

% @attr manufacturer_factory_size
% @type categorical
% @canonical false
% @original_name Manufacturer factory size
% @values over_60k_sqft=Over_60000_square_feet unk_manufacturer_factory_size=Unknown
% @importance 0.3

0.85::acc(s17, manufacturer_factory_size).

0.77::true_val(manufacturer_factory_size, over_60k_sqft); 0.23::true_val(manufacturer_factory_size, unk_manufacturer_factory_size).

measured(s17, manufacturer_factory_size, over_60k_sqft).

all_consistent(manufacturer_factory_size) :- consistent(s17, manufacturer_factory_size).

evidence(all_consistent(manufacturer_factory_size)).
query(true_val(manufacturer_factory_size, over_60k_sqft)).
query(true_val(manufacturer_factory_size, unk_manufacturer_factory_size)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2017_2018=2017_2018_season unk_model_first_available_year=Unknown
% @importance 0.65

0.82::acc(s18, model_first_available_year).

0.68::true_val(model_first_available_year, season_2017_2018); 0.32::true_val(model_first_available_year, unk_model_first_available_year).

measured(s18, model_first_available_year, season_2017_2018).

all_consistent(model_first_available_year) :- consistent(s18, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2017_2018)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr review_continuity
% @type categorical
% @canonical false
% @original_name Terrain Wrecker reviewed continuously
% @values reviewed_2018_2026_unchanged_since_2021=Reviewed_continuously_2018_2026_design_unchanged_since_2021 unk_review_continuity=Unknown
% @importance 0.7

0.82::acc(s19, review_continuity).

0.72::true_val(review_continuity, reviewed_2018_2026_unchanged_since_2021); 0.28::true_val(review_continuity, unk_review_continuity).

measured(s19, review_continuity, reviewed_2018_2026_unchanged_since_2021).

all_consistent(review_continuity) :- consistent(s19, review_continuity).

evidence(all_consistent(review_continuity)).
query(true_val(review_continuity, reviewed_2018_2026_unchanged_since_2021)).
query(true_val(review_continuity, unk_review_continuity)).

% @attr redesign_year
% @type categorical
% @canonical true
% @original_name redesign_year
% @values nose_blunted_2024=Nose_blunted_slightly_graphic_changed_specs_identical_to_2021 unk_redesign_year=Unknown
% @importance 0.7

0.80::acc(s20, redesign_year).

0.68::true_val(redesign_year, nose_blunted_2024); 0.32::true_val(redesign_year, unk_redesign_year).

measured(s20, redesign_year, nose_blunted_2024).

all_consistent(redesign_year) :- consistent(s20, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, nose_blunted_2024)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr redesign_year_manufacturer
% @type categorical
% @canonical false
% @original_name redesign_year
% @values newly_reshaped_floaty_nose=Newly_reshaped_floaty_nose_blunted_tail unk_redesign_year_manufacturer=Unknown
% @importance 0.75

0.88::acc(s21, redesign_year_manufacturer).

0.77::true_val(redesign_year_manufacturer, newly_reshaped_floaty_nose); 0.23::true_val(redesign_year_manufacturer, unk_redesign_year_manufacturer).

measured(s21, redesign_year_manufacturer, newly_reshaped_floaty_nose).

all_consistent(redesign_year_manufacturer) :- consistent(s21, redesign_year_manufacturer).

evidence(all_consistent(redesign_year_manufacturer)).
query(true_val(redesign_year_manufacturer, newly_reshaped_floaty_nose)).
query(true_val(redesign_year_manufacturer, unk_redesign_year_manufacturer)).

% @attr redesign_year_2027
% @type categorical
% @canonical false
% @original_name redesign_year
% @values carries_forward_same=2027_carries_forward_same_construction_C2x unk_redesign_year_2027=Unknown
% @importance 0.95

0.78::acc(s2, redesign_year_2027).

0.71::true_val(redesign_year_2027, carries_forward_same); 0.29::true_val(redesign_year_2027, unk_redesign_year_2027).

measured(s2, redesign_year_2027, carries_forward_same).

all_consistent(redesign_year_2027) :-
    (indep(s2), consistent(s2, redesign_year_2027) ; \+indep(s2)).

evidence(all_consistent(redesign_year_2027)).
query(true_val(redesign_year_2027, carries_forward_same)).
query(true_val(redesign_year_2027, unk_redesign_year_2027)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v599_99=599.99 unk_price_usd_msrp=Unknown
% @importance 0.95

0.95::acc(s22, price_usd_msrp).

0.90::true_val(price_usd_msrp, v599_99); 0.10::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s22, price_usd_msrp, v599_99).

all_consistent(price_usd_msrp) :- consistent(s22, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v599_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v999_99=999.99 unk_price_aud_merchant=Unknown
% @importance 0.95

0.80::acc(s2, price_aud_merchant).

0.71::true_val(price_aud_merchant, v999_99); 0.29::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s2, price_aud_merchant, v999_99).

all_consistent(price_aud_merchant) :-
    (indep(s2), consistent(s2, price_aud_merchant) ; \+indep(s2)).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v999_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder=Preorder unk_availability_status=Unknown
% @importance 0.95

0.78::acc(s2, availability_status).

0.71::true_val(availability_status, preorder); 0.29::true_val(availability_status, unk_availability_status).

measured(s2, availability_status, preorder).

all_consistent(availability_status) :-
    (indep(s2), consistent(s2, availability_status) ; \+indep(s2)).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder)).
query(true_val(availability_status, unk_availability_status)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_1_2026=May_1_2026 unk_estimated_availability_date=Unknown
% @importance 0.95

0.78::acc(s2, estimated_availability_date).

0.71::true_val(estimated_availability_date, may_1_2026); 0.29::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s2, estimated_availability_date, may_1_2026).

all_consistent(estimated_availability_date) :-
    (indep(s2), consistent(s2, estimated_availability_date) ; \+indep(s2)).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_1_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v479_99=479.99 unk_price_usd_evo=Unknown
% @importance 0.9

0.75::acc(s23, price_usd_evo).

0.56::true_val(price_usd_evo, v479_99); 0.44::true_val(price_usd_evo, unk_price_usd_evo).

measured(s23, price_usd_evo, v479_99).

all_consistent(price_usd_evo) :- consistent(s23, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v479_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v509_99=509.99 unk_price_usd_backcountry=Unknown
% @importance 0.9

0.75::acc(s24, price_usd_backcountry).

0.56::true_val(price_usd_backcountry, v509_99); 0.44::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s24, price_usd_backcountry, v509_99).

all_consistent(price_usd_backcountry) :- consistent(s24, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v509_99)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_usd_sun_ski
% @type numeric
% @canonical false
% @original_name Price at Sun & Ski Sports (prior season, on sale)
% @unit USD
% @values v419_83=419.83 unk_price_usd_sun_ski=Unknown
% @importance 0.9

0.75::acc(s25, price_usd_sun_ski).

0.56::true_val(price_usd_sun_ski, v419_83); 0.44::true_val(price_usd_sun_ski, unk_price_usd_sun_ski).

measured(s25, price_usd_sun_ski, v419_83).

all_consistent(price_usd_sun_ski) :- consistent(s25, price_usd_sun_ski).

evidence(all_consistent(price_usd_sun_ski)).
query(true_val(price_usd_sun_ski, v419_83)).
query(true_val(price_usd_sun_ski, unk_price_usd_sun_ski)).

% @attr price_usd_tactics
% @type numeric
% @canonical true
% @original_name price_usd_tactics
% @unit USD
% @values v419_99=419.99 unk_price_usd_tactics=Unknown
% @importance 0.85

0.82::acc(s26, price_usd_tactics).

0.64::true_val(price_usd_tactics, v419_99); 0.36::true_val(price_usd_tactics, unk_price_usd_tactics).

measured(s26, price_usd_tactics, v419_99).

all_consistent(price_usd_tactics) :- consistent(s26, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v419_99)).
query(true_val(price_usd_tactics, unk_price_usd_tactics)).

% @attr price_usd_the_house
% @type numeric
% @canonical false
% @original_name Price at The House (prior season)
% @unit USD
% @values v479_99_house=479.99 unk_price_usd_the_house=Unknown
% @importance 0.85

0.75::acc(s27, price_usd_the_house).

0.56::true_val(price_usd_the_house, v479_99_house); 0.44::true_val(price_usd_the_house, unk_price_usd_the_house).

measured(s27, price_usd_the_house, v479_99_house).

all_consistent(price_usd_the_house) :- consistent(s27, price_usd_the_house).

evidence(all_consistent(price_usd_the_house)).
query(true_val(price_usd_the_house, v479_99_house)).
query(true_val(price_usd_the_house, unk_price_usd_the_house)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v489_00=489.00 unk_price_eur_blue_tomato=Unknown
% @importance 0.8

0.75::acc(s28, price_eur_blue_tomato).

0.56::true_val(price_eur_blue_tomato, v489_00); 0.44::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s28, price_eur_blue_tomato, v489_00).

all_consistent(price_eur_blue_tomato) :- consistent(s28, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v489_00)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr price_gbp_blue_tomato_uk
% @type numeric
% @canonical true
% @original_name price_gbp_blue_tomato_uk
% @unit GBP
% @values v440_00=440.00 unk_price_gbp_blue_tomato_uk=Unknown
% @importance 0.8

0.75::acc(s29, price_gbp_blue_tomato_uk).

0.56::true_val(price_gbp_blue_tomato_uk, v440_00); 0.44::true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk).

measured(s29, price_gbp_blue_tomato_uk, v440_00).

all_consistent(price_gbp_blue_tomato_uk) :- consistent(s29, price_gbp_blue_tomato_uk).

evidence(all_consistent(price_gbp_blue_tomato_uk)).
query(true_val(price_gbp_blue_tomato_uk, v440_00)).
query(true_val(price_gbp_blue_tomato_uk, unk_price_gbp_blue_tomato_uk)).

% @attr price_eur_snowcountry
% @type numeric
% @canonical false
% @original_name Price at SnowCountry (EU, prior season)
% @unit EUR
% @values v499_00=499.00 unk_price_eur_snowcountry=Unknown
% @importance 0.8

0.75::acc(s30, price_eur_snowcountry).

0.56::true_val(price_eur_snowcountry, v499_00); 0.44::true_val(price_eur_snowcountry, unk_price_eur_snowcountry).

measured(s30, price_eur_snowcountry, v499_00).

all_consistent(price_eur_snowcountry) :- consistent(s30, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v499_00)).
query(true_val(price_eur_snowcountry, unk_price_eur_snowcountry)).

% @attr price_cad_prfo
% @type numeric
% @canonical true
% @original_name price_cad_prfo
% @unit CAD
% @values v599_99_cad=599.99 unk_price_cad_prfo=Unknown
% @importance 0.8

0.75::acc(s31, price_cad_prfo).

0.56::true_val(price_cad_prfo, v599_99_cad); 0.44::true_val(price_cad_prfo, unk_price_cad_prfo).

measured(s31, price_cad_prfo, v599_99_cad).

all_consistent(price_cad_prfo) :- consistent(s31, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v599_99_cad)).
query(true_val(price_cad_prfo, unk_price_cad_prfo)).

% @attr price_eur_stoked
% @type numeric
% @canonical false
% @original_name Price at Stoked Board Shop (Belgium, prior season)
% @unit EUR
% @values v419_95=419.95 unk_price_eur_stoked=Unknown
% @importance 0.8

0.75::acc(s32, price_eur_stoked).

0.56::true_val(price_eur_stoked, v419_95); 0.44::true_val(price_eur_stoked, unk_price_eur_stoked).

measured(s32, price_eur_stoked, v419_95).

all_consistent(price_eur_stoked) :- consistent(s32, price_eur_stoked).

evidence(all_consistent(price_eur_stoked)).
query(true_val(price_eur_stoked, v419_95)).
query(true_val(price_eur_stoked, unk_price_eur_stoked)).

% @attr price_aud_merchant_ballistyx
% @type categorical
% @canonical false
% @original_name price_aud_merchant
% @values listed_no_price=Listed_but_price_not_shown unk_price_aud_merchant_ballistyx=Unknown
% @importance 0.75

0.65::acc(s33, price_aud_merchant_ballistyx).

0.49::true_val(price_aud_merchant_ballistyx, listed_no_price); 0.51::true_val(price_aud_merchant_ballistyx, unk_price_aud_merchant_ballistyx).

measured(s33, price_aud_merchant_ballistyx, listed_no_price).

all_consistent(price_aud_merchant_ballistyx) :-
    (indep(s33), consistent(s33, price_aud_merchant_ballistyx) ; \+indep(s33)).

evidence(all_consistent(price_aud_merchant_ballistyx)).
query(true_val(price_aud_merchant_ballistyx, listed_no_price)).
query(true_val(price_aud_merchant_ballistyx, unk_price_aud_merchant_ballistyx)).

% @attr seller_amazon
% @type categorical
% @canonical false
% @original_name Seller
% @values amazon_prior_season=Amazon_prior_season_models_available unk_seller_amazon=Unknown
% @importance 0.5

0.70::acc(s4, seller_amazon).

0.63::true_val(seller_amazon, amazon_prior_season); 0.37::true_val(seller_amazon, unk_seller_amazon).

measured(s4, seller_amazon, amazon_prior_season).

all_consistent(seller_amazon) :-
    (indep(s4), consistent(s4, seller_amazon) ; \+indep(s4)).

evidence(all_consistent(seller_amazon)).
query(true_val(seller_amazon, amazon_prior_season)).
query(true_val(seller_amazon, unk_seller_amazon)).

% @attr seller_sport_conrad
% @type categorical
% @canonical false
% @original_name Seller
% @values sport_conrad_eu=Sport_Conrad_EU unk_seller_sport_conrad=Unknown
% @importance 0.7

0.70::acc(s34, seller_sport_conrad).

0.55::true_val(seller_sport_conrad, sport_conrad_eu); 0.45::true_val(seller_sport_conrad, unk_seller_sport_conrad).

measured(s34, seller_sport_conrad, sport_conrad_eu).

all_consistent(seller_sport_conrad) :- consistent(s34, seller_sport_conrad).

evidence(all_consistent(seller_sport_conrad)).
query(true_val(seller_sport_conrad, sport_conrad_eu)).
query(true_val(seller_sport_conrad, unk_seller_sport_conrad)).

% @attr evo_price_match
% @type categorical
% @canonical false
% @original_name evo price match
% @values beat_by_5pct=We_will_beat_it_by_5_percent unk_evo_price_match=Unknown
% @importance 0.5

0.82::acc(s35, evo_price_match).

0.72::true_val(evo_price_match, beat_by_5pct); 0.28::true_val(evo_price_match, unk_evo_price_match).

measured(s35, evo_price_match, beat_by_5pct).

all_consistent(evo_price_match) :- consistent(s35, evo_price_match).

evidence(all_consistent(evo_price_match)).
query(true_val(evo_price_match, beat_by_5pct)).
query(true_val(evo_price_match, unk_evo_price_match)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v1=1.0 unk_warranty_period_years=Unknown
% @importance 0.8

0.95::acc(s36, warranty_period_years).

0.90::true_val(warranty_period_years, v1); 0.10::true_val(warranty_period_years, unk_warranty_period_years).

measured(s36, warranty_period_years, v1).

all_consistent(warranty_period_years) :- consistent(s36, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values excludes_impact_abuse_wear=Does_NOT_cover_impact_damage_abuse_misuse_normal_wear unk_warranty=Unknown
% @importance 0.75

0.82::acc(s37, warranty).

0.76::true_val(warranty, excludes_impact_abuse_wear); 0.24::true_val(warranty, unk_warranty).

measured(s37, warranty, excludes_impact_abuse_wear).

all_consistent(warranty) :-
    (indep(s7), consistent(s37, warranty) ; \+indep(s7)).

evidence(all_consistent(warranty)).
query(true_val(warranty, excludes_impact_abuse_wear)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_shipping
% @type categorical
% @canonical false
% @original_name warranty
% @values customer_ships_mervin_returns=Customer_pays_to_ship_Mervin_pays_return unk_warranty_shipping=Unknown
% @importance 0.6

0.90::acc(s38, warranty_shipping).

0.86::true_val(warranty_shipping, customer_ships_mervin_returns); 0.14::true_val(warranty_shipping, unk_warranty_shipping).

measured(s38, warranty_shipping, customer_ships_mervin_returns).

all_consistent(warranty_shipping) :- consistent(s38, warranty_shipping).

evidence(all_consistent(warranty_shipping)).
query(true_val(warranty_shipping, customer_ships_mervin_returns)).
query(true_val(warranty_shipping, unk_warranty_shipping)).

% @attr b_grade_availability
% @type categorical
% @canonical false
% @original_name B-Grade availability
% @values cosmetic_imperfect_discount_full_warranty=Cosmetically_imperfect_at_discount_full_factory_warranty unk_b_grade_availability=Unknown
% @importance 0.5

0.90::acc(s39, b_grade_availability).

0.81::true_val(b_grade_availability, cosmetic_imperfect_discount_full_warranty); 0.19::true_val(b_grade_availability, unk_b_grade_availability).

measured(s39, b_grade_availability, cosmetic_imperfect_discount_full_warranty).

all_consistent(b_grade_availability) :- consistent(s39, b_grade_availability).

evidence(all_consistent(b_grade_availability)).
query(true_val(b_grade_availability, cosmetic_imperfect_discount_full_warranty)).
query(true_val(b_grade_availability, unk_b_grade_availability)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values positive_warranty_experience=Generally_positive_warranty_experiences unk_user_review_forum=Unknown
% @importance 0.65

0.50::acc(s40, user_review_forum).

0.28::true_val(user_review_forum, positive_warranty_experience); 0.72::true_val(user_review_forum, unk_user_review_forum).

measured(s40, user_review_forum, positive_warranty_experience).

all_consistent(user_review_forum) :- consistent(s40, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, positive_warranty_experience)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values five_sizes=152_154_157_156W_161W six_sizes=152_154_156W_157_160_161W
% @importance 0.975

0.78::acc(s2, available_sizes).
0.95::acc(s41, available_sizes).

0.40::true_val(available_sizes, five_sizes); 0.60::true_val(available_sizes, six_sizes).

measured(s2, available_sizes, five_sizes).
measured(s41, available_sizes, six_sizes).

all_consistent(available_sizes) :-
    consistent(s41, available_sizes),
    (indep(s2), consistent(s2, available_sizes) ; \+indep(s2)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, five_sizes)).
query(true_val(available_sizes, six_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.95

0.78::acc(s2, width_options).

0.71::true_val(width_options, standard_and_wide); 0.29::true_val(width_options, unk_width_options).

measured(s2, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(s2), consistent(s2, width_options) ; \+indep(s2)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr flex_rating_10_manufacturer_152
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v6=6.0 unk_flex_rating_10_manufacturer_152=Unknown
% @importance 1.0

0.95::acc(s41, flex_rating_10_manufacturer_152).

0.90::true_val(flex_rating_10_manufacturer_152, v6); 0.10::true_val(flex_rating_10_manufacturer_152, unk_flex_rating_10_manufacturer_152).

measured(s41, flex_rating_10_manufacturer_152, v6).

all_consistent(flex_rating_10_manufacturer_152) :- consistent(s41, flex_rating_10_manufacturer_152).

evidence(all_consistent(flex_rating_10_manufacturer_152)).
query(true_val(flex_rating_10_manufacturer_152, v6)).
query(true_val(flex_rating_10_manufacturer_152, unk_flex_rating_10_manufacturer_152)).

% @attr flex_rating_10_manufacturer_154
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v6_5=6.5 unk_flex_rating_10_manufacturer_154=Unknown
% @importance 1.0

0.95::acc(s41, flex_rating_10_manufacturer_154).

0.90::true_val(flex_rating_10_manufacturer_154, v6_5); 0.10::true_val(flex_rating_10_manufacturer_154, unk_flex_rating_10_manufacturer_154).

measured(s41, flex_rating_10_manufacturer_154, v6_5).

all_consistent(flex_rating_10_manufacturer_154) :- consistent(s41, flex_rating_10_manufacturer_154).

evidence(all_consistent(flex_rating_10_manufacturer_154)).
query(true_val(flex_rating_10_manufacturer_154, v6_5)).
query(true_val(flex_rating_10_manufacturer_154, unk_flex_rating_10_manufacturer_154)).

% @attr flex_rating_10_manufacturer_156w
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v6_5=6.5 unk_flex_rating_10_manufacturer_156w=Unknown
% @importance 1.0

0.95::acc(s41, flex_rating_10_manufacturer_156w).

0.90::true_val(flex_rating_10_manufacturer_156w, v6_5_156w); 0.10::true_val(flex_rating_10_manufacturer_156w, unk_flex_rating_10_manufacturer_156w).

measured(s41, flex_rating_10_manufacturer_156w, v6_5_156w).

all_consistent(flex_rating_10_manufacturer_156w) :- consistent(s41, flex_rating_10_manufacturer_156w).

evidence(all_consistent(flex_rating_10_manufacturer_156w)).
query(true_val(flex_rating_10_manufacturer_156w, v6_5_156w)).
query(true_val(flex_rating_10_manufacturer_156w, unk_flex_rating_10_manufacturer_156w)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v6_5=6.5 unk_flex_rating_10_manufacturer=Unknown
% @importance 1.0

0.95::acc(s41, flex_rating_10_manufacturer).

0.90::true_val(flex_rating_10_manufacturer, v6_5_mfr); 0.10::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s41, flex_rating_10_manufacturer, v6_5_mfr).

all_consistent(flex_rating_10_manufacturer) :- consistent(s41, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6_5_mfr)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_rating_10_manufacturer_160
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v7=7.0 unk_flex_rating_10_manufacturer_160=Unknown
% @importance 1.0

0.95::acc(s41, flex_rating_10_manufacturer_160).

0.90::true_val(flex_rating_10_manufacturer_160, v7_160); 0.10::true_val(flex_rating_10_manufacturer_160, unk_flex_rating_10_manufacturer_160).

measured(s41, flex_rating_10_manufacturer_160, v7_160).

all_consistent(flex_rating_10_manufacturer_160) :- consistent(s41, flex_rating_10_manufacturer_160).

evidence(all_consistent(flex_rating_10_manufacturer_160)).
query(true_val(flex_rating_10_manufacturer_160, v7_160)).
query(true_val(flex_rating_10_manufacturer_160, unk_flex_rating_10_manufacturer_160)).

% @attr flex_rating_10_manufacturer_161w
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v7=7.0 unk_flex_rating_10_manufacturer_161w=Unknown
% @importance 1.0

0.95::acc(s41, flex_rating_10_manufacturer_161w).

0.90::true_val(flex_rating_10_manufacturer_161w, v7_161w); 0.10::true_val(flex_rating_10_manufacturer_161w, unk_flex_rating_10_manufacturer_161w).

measured(s41, flex_rating_10_manufacturer_161w, v7_161w).

all_consistent(flex_rating_10_manufacturer_161w) :- consistent(s41, flex_rating_10_manufacturer_161w).

evidence(all_consistent(flex_rating_10_manufacturer_161w)).
query(true_val(flex_rating_10_manufacturer_161w, v7_161w)).
query(true_val(flex_rating_10_manufacturer_161w, unk_flex_rating_10_manufacturer_161w)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v6_flex=6.0 v7_flex=7.0
% @importance 0.9

0.75::acc(s2, flex_rating_10).
0.80::acc(s42, flex_rating_10).

0.45::true_val(flex_rating_10, v6_flex); 0.55::true_val(flex_rating_10, v7_flex).

measured(s2, flex_rating_10, v6_flex).
measured(s42, flex_rating_10, v7_flex).

all_consistent(flex_rating_10) :-
    (indep(s2), consistent(s2, flex_rating_10) ; \+indep(s2)),
    consistent(s42, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6_flex)).
query(true_val(flex_rating_10, v7_flex)).

% @attr contact_length_size_152
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v115=115.0 unk_contact_length_size_152=Unknown
% @importance 1.0

0.95::acc(s41, contact_length_size_152).

0.90::true_val(contact_length_size_152, v115); 0.10::true_val(contact_length_size_152, unk_contact_length_size_152).

measured(s41, contact_length_size_152, v115).

all_consistent(contact_length_size_152) :- consistent(s41, contact_length_size_152).

evidence(all_consistent(contact_length_size_152)).
query(true_val(contact_length_size_152, v115)).
query(true_val(contact_length_size_152, unk_contact_length_size_152)).

% @attr contact_length_size_154
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v117=117.0 unk_contact_length_size_154=Unknown
% @importance 1.0

0.95::acc(s41, contact_length_size_154).

0.90::true_val(contact_length_size_154, v117); 0.10::true_val(contact_length_size_154, unk_contact_length_size_154).

measured(s41, contact_length_size_154, v117).

all_consistent(contact_length_size_154) :- consistent(s41, contact_length_size_154).

evidence(all_consistent(contact_length_size_154)).
query(true_val(contact_length_size_154, v117)).
query(true_val(contact_length_size_154, unk_contact_length_size_154)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit cm
% @values v119=119.0 unk_contact_length_size=Unknown
% @importance 1.0

0.95::acc(s41, contact_length_size).

0.90::true_val(contact_length_size, v119); 0.10::true_val(contact_length_size, unk_contact_length_size).

measured(s41, contact_length_size, v119).

all_consistent(contact_length_size) :- consistent(s41, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v119)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr contact_length_size_156w
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v119_156w=119.0 unk_contact_length_size_156w=Unknown
% @importance 1.0

0.95::acc(s41, contact_length_size_156w).

0.90::true_val(contact_length_size_156w, v119_156w); 0.10::true_val(contact_length_size_156w, unk_contact_length_size_156w).

measured(s41, contact_length_size_156w, v119_156w).

all_consistent(contact_length_size_156w) :- consistent(s41, contact_length_size_156w).

evidence(all_consistent(contact_length_size_156w)).
query(true_val(contact_length_size_156w, v119_156w)).
query(true_val(contact_length_size_156w, unk_contact_length_size_156w)).

% @attr contact_length_size_161w
% @type numeric
% @canonical false
% @original_name contact_length_size
% @unit cm
% @values v121=121.0 unk_contact_length_size_161w=Unknown
% @importance 1.0

0.95::acc(s41, contact_length_size_161w).

0.90::true_val(contact_length_size_161w, v121); 0.10::true_val(contact_length_size_161w, unk_contact_length_size_161w).

measured(s41, contact_length_size_161w, v121).

all_consistent(contact_length_size_161w) :- consistent(s41, contact_length_size_161w).

evidence(all_consistent(contact_length_size_161w)).
query(true_val(contact_length_size_161w, v121)).
query(true_val(contact_length_size_161w, unk_contact_length_size_161w)).

% @attr sidecut_radius_size_152
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_1=8.1 unk_sidecut_radius_size_152=Unknown
% @importance 1.0

0.95::acc(s41, sidecut_radius_size_152).

0.90::true_val(sidecut_radius_size_152, v8_1); 0.10::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

measured(s41, sidecut_radius_size_152, v8_1).

all_consistent(sidecut_radius_size_152) :- consistent(s41, sidecut_radius_size_152).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v8_1)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

% @attr sidecut_radius_size_154
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_2=8.2 unk_sidecut_radius_size_154=Unknown
% @importance 1.0

0.95::acc(s41, sidecut_radius_size_154).

0.90::true_val(sidecut_radius_size_154, v8_2); 0.10::true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154).

measured(s41, sidecut_radius_size_154, v8_2).

all_consistent(sidecut_radius_size_154) :- consistent(s41, sidecut_radius_size_154).

evidence(all_consistent(sidecut_radius_size_154)).
query(true_val(sidecut_radius_size_154, v8_2)).
query(true_val(sidecut_radius_size_154, unk_sidecut_radius_size_154)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v8_3=8.3 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.95::acc(s41, sidecut_radius_size).

0.90::true_val(sidecut_radius_size, v8_3); 0.10::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s41, sidecut_radius_size, v8_3).

all_consistent(sidecut_radius_size) :- consistent(s41, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_3)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_156w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_3_156w=8.3 unk_sidecut_radius_size_156w=Unknown
% @importance 1.0

0.95::acc(s41, sidecut_radius_size_156w).

0.90::true_val(sidecut_radius_size_156w, v8_3_156w); 0.10::true_val(sidecut_radius_size_156w, unk_sidecut_radius_size_156w).

measured(s41, sidecut_radius_size_156w, v8_3_156w).

all_consistent(sidecut_radius_size_156w) :- consistent(s41, sidecut_radius_size_156w).

evidence(all_consistent(sidecut_radius_size_156w)).
query(true_val(sidecut_radius_size_156w, v8_3_156w)).
query(true_val(sidecut_radius_size_156w, unk_sidecut_radius_size_156w)).

% @attr sidecut_radius_size_161w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size
% @unit m
% @values v8_4=8.4 unk_sidecut_radius_size_161w=Unknown
% @importance 1.0

0.95::acc(s41, sidecut_radius_size_161w).

0.90::true_val(sidecut_radius_size_161w, v8_4); 0.10::true_val(sidecut_radius_size_161w, unk_sidecut_radius_size_161w).

measured(s41, sidecut_radius_size_161w, v8_4).

all_consistent(sidecut_radius_size_161w) :- consistent(s41, sidecut_radius_size_161w).

evidence(all_consistent(sidecut_radius_size_161w)).
query(true_val(sidecut_radius_size_161w, v8_4)).
query(true_val(sidecut_radius_size_161w, unk_sidecut_radius_size_161w)).

% @attr tip_tail_width_size_152
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v29_4_29_4=29.4/29.4 unk_tip_tail_width_size_152=Unknown
% @importance 1.0

0.95::acc(s41, tip_tail_width_size_152).

0.90::true_val(tip_tail_width_size_152, v29_4_29_4); 0.10::true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152).

measured(s41, tip_tail_width_size_152, v29_4_29_4).

all_consistent(tip_tail_width_size_152) :- consistent(s41, tip_tail_width_size_152).

evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, v29_4_29_4)).
query(true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152)).

% @attr tip_tail_width_size_154
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v29_6_29_6=29.6/29.6 unk_tip_tail_width_size_154=Unknown
% @importance 1.0

0.95::acc(s41, tip_tail_width_size_154).

0.90::true_val(tip_tail_width_size_154, v29_6_29_6); 0.10::true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154).

measured(s41, tip_tail_width_size_154, v29_6_29_6).

all_consistent(tip_tail_width_size_154) :- consistent(s41, tip_tail_width_size_154).

evidence(all_consistent(tip_tail_width_size_154)).
query(true_val(tip_tail_width_size_154, v29_6_29_6)).
query(true_val(tip_tail_width_size_154, unk_tip_tail_width_size_154)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v30_0_30_0=30.0/30.0 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.95::acc(s41, tip_tail_width_size).

0.90::true_val(tip_tail_width_size, v30_0_30_0); 0.10::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s41, tip_tail_width_size, v30_0_30_0).

all_consistent(tip_tail_width_size) :- consistent(s41, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_0_30_0)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_156w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v31_0_31_0_156w=31.0/31.0 unk_tip_tail_width_size_156w=Unknown
% @importance 1.0

0.95::acc(s41, tip_tail_width_size_156w).

0.90::true_val(tip_tail_width_size_156w, v31_0_31_0_156w); 0.10::true_val(tip_tail_width_size_156w, unk_tip_tail_width_size_156w).

measured(s41, tip_tail_width_size_156w, v31_0_31_0_156w).

all_consistent(tip_tail_width_size_156w) :- consistent(s41, tip_tail_width_size_156w).

evidence(all_consistent(tip_tail_width_size_156w)).
query(true_val(tip_tail_width_size_156w, v31_0_31_0_156w)).
query(true_val(tip_tail_width_size_156w, unk_tip_tail_width_size_156w)).

% @attr tip_tail_width_size_161w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size
% @unit cm
% @values v31_0_31_0_161w=31.0/31.0 unk_tip_tail_width_size_161w=Unknown
% @importance 1.0

0.95::acc(s41, tip_tail_width_size_161w).

0.90::true_val(tip_tail_width_size_161w, v31_0_31_0_161w); 0.10::true_val(tip_tail_width_size_161w, unk_tip_tail_width_size_161w).

measured(s41, tip_tail_width_size_161w, v31_0_31_0_161w).

all_consistent(tip_tail_width_size_161w) :- consistent(s41, tip_tail_width_size_161w).

evidence(all_consistent(tip_tail_width_size_161w)).
query(true_val(tip_tail_width_size_161w, v31_0_31_0_161w)).
query(true_val(tip_tail_width_size_161w, unk_tip_tail_width_size_161w)).

% @attr waist_width_152
% @type numeric
% @canonical false
% @original_name Waist width 152cm
% @unit cm
% @values v25_3=25.3 unk_waist_width_152=Unknown
% @importance 1.0

0.95::acc(s41, waist_width_152).

0.90::true_val(waist_width_152, v25_3); 0.10::true_val(waist_width_152, unk_waist_width_152).

measured(s41, waist_width_152, v25_3).

all_consistent(waist_width_152) :- consistent(s41, waist_width_152).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v25_3)).
query(true_val(waist_width_152, unk_waist_width_152)).

% @attr waist_width_154
% @type numeric
% @canonical false
% @original_name Waist width 154cm
% @unit cm
% @values v25_5=25.5 unk_waist_width_154=Unknown
% @importance 1.0

0.95::acc(s41, waist_width_154).

0.90::true_val(waist_width_154, v25_5); 0.10::true_val(waist_width_154, unk_waist_width_154).

measured(s41, waist_width_154, v25_5).

all_consistent(waist_width_154) :- consistent(s41, waist_width_154).

evidence(all_consistent(waist_width_154)).
query(true_val(waist_width_154, v25_5)).
query(true_val(waist_width_154, unk_waist_width_154)).

% @attr waist_width_157
% @type numeric
% @canonical false
% @original_name Waist width 157cm
% @unit cm
% @values v25_7=25.7 unk_waist_width_157=Unknown
% @importance 1.0

0.95::acc(s41, waist_width_157).

0.90::true_val(waist_width_157, v25_7); 0.10::true_val(waist_width_157, unk_waist_width_157).

measured(s41, waist_width_157, v25_7).

all_consistent(waist_width_157) :- consistent(s41, waist_width_157).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_7)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr waist_width_156w
% @type numeric
% @canonical false
% @original_name Waist width 156W
% @unit cm
% @values v26_7_156w=26.7 unk_waist_width_156w=Unknown
% @importance 1.0

0.95::acc(s41, waist_width_156w).

0.90::true_val(waist_width_156w, v26_7_156w); 0.10::true_val(waist_width_156w, unk_waist_width_156w).

measured(s41, waist_width_156w, v26_7_156w).

all_consistent(waist_width_156w) :- consistent(s41, waist_width_156w).

evidence(all_consistent(waist_width_156w)).
query(true_val(waist_width_156w, v26_7_156w)).
query(true_val(waist_width_156w, unk_waist_width_156w)).

% @attr waist_width_161w
% @type numeric
% @canonical false
% @original_name Waist width 161W
% @unit cm
% @values v26_7_161w=26.7 unk_waist_width_161w=Unknown
% @importance 1.0

0.95::acc(s41, waist_width_161w).

0.90::true_val(waist_width_161w, v26_7_161w); 0.10::true_val(waist_width_161w, unk_waist_width_161w).

measured(s41, waist_width_161w, v26_7_161w).

all_consistent(waist_width_161w) :- consistent(s41, waist_width_161w).

evidence(all_consistent(waist_width_161w)).
query(true_val(waist_width_161w, v26_7_161w)).
query(true_val(waist_width_161w, unk_waist_width_161w)).

% @attr stance_width_range_size
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @unit inches/cm
% @values v20_25_to_25=20.25_to_25_inches_51.5_to_63.5cm unk_stance_width_range_size=Unknown
% @importance 1.0

0.95::acc(s41, stance_width_range_size).

0.90::true_val(stance_width_range_size, v20_25_to_25); 0.10::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s41, stance_width_range_size, v20_25_to_25).

all_consistent(stance_width_range_size) :- consistent(s41, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v20_25_to_25)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr setback
% @type categorical
% @canonical true
% @original_name setback
% @values zero_on_sidecut=0_inches_on_sidecut_centered_effective_edge unk_setback=Unknown
% @importance 1.0

0.95::acc(s41, setback).

0.90::true_val(setback, zero_on_sidecut); 0.10::true_val(setback, unk_setback).

measured(s41, setback, zero_on_sidecut).

all_consistent(setback) :- consistent(s41, setback).

evidence(all_consistent(setback)).
query(true_val(setback, zero_on_sidecut)).
query(true_val(setback, unk_setback)).

% @attr setback_on_board
% @type numeric
% @canonical false
% @original_name setback
% @unit inches
% @values v1_75=1.75 unk_setback_on_board=Unknown
% @importance 0.75

0.85::acc(s43, setback_on_board).

0.72::true_val(setback_on_board, v1_75); 0.28::true_val(setback_on_board, unk_setback_on_board).

measured(s43, setback_on_board, v1_75).

all_consistent(setback_on_board) :- consistent(s43, setback_on_board).

evidence(all_consistent(setback_on_board)).
query(true_val(setback_on_board, v1_75)).
query(true_val(setback_on_board, unk_setback_on_board)).

% @attr recommended_weight_range_size_152
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w95_plus=95_plus_lbs_45_plus_kg unk_recommended_weight_range_size_152=Unknown
% @importance 1.0

0.95::acc(s41, recommended_weight_range_size_152).

0.90::true_val(recommended_weight_range_size_152, w95_plus); 0.10::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(s41, recommended_weight_range_size_152, w95_plus).

all_consistent(recommended_weight_range_size_152) :- consistent(s41, recommended_weight_range_size_152).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, w95_plus)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

% @attr recommended_weight_range_size_154
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w100_plus=100_plus_lbs_45_plus_kg unk_recommended_weight_range_size_154=Unknown
% @importance 1.0

0.95::acc(s41, recommended_weight_range_size_154).

0.90::true_val(recommended_weight_range_size_154, w100_plus); 0.10::true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154).

measured(s41, recommended_weight_range_size_154, w100_plus).

all_consistent(recommended_weight_range_size_154) :- consistent(s41, recommended_weight_range_size_154).

evidence(all_consistent(recommended_weight_range_size_154)).
query(true_val(recommended_weight_range_size_154, w100_plus)).
query(true_val(recommended_weight_range_size_154, unk_recommended_weight_range_size_154)).

% @attr recommended_weight_range_size_156w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w110_plus=110_plus_lbs_50_plus_kg unk_recommended_weight_range_size_156w=Unknown
% @importance 1.0

0.95::acc(s41, recommended_weight_range_size_156w).

0.90::true_val(recommended_weight_range_size_156w, w110_plus); 0.10::true_val(recommended_weight_range_size_156w, unk_recommended_weight_range_size_156w).

measured(s41, recommended_weight_range_size_156w, w110_plus).

all_consistent(recommended_weight_range_size_156w) :- consistent(s41, recommended_weight_range_size_156w).

evidence(all_consistent(recommended_weight_range_size_156w)).
query(true_val(recommended_weight_range_size_156w, w110_plus)).
query(true_val(recommended_weight_range_size_156w, unk_recommended_weight_range_size_156w)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w120_plus=120_plus_lbs_55_plus_kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.95::acc(s41, recommended_weight_range_size).

0.90::true_val(recommended_weight_range_size, w120_plus); 0.10::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s41, recommended_weight_range_size, w120_plus).

all_consistent(recommended_weight_range_size) :- consistent(s41, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w120_plus)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_160
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w120_plus_160=120_plus_lbs_55_plus_kg unk_recommended_weight_range_size_160=Unknown
% @importance 1.0

0.95::acc(s41, recommended_weight_range_size_160).

0.90::true_val(recommended_weight_range_size_160, w120_plus_160); 0.10::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).

measured(s41, recommended_weight_range_size_160, w120_plus_160).

all_consistent(recommended_weight_range_size_160) :- consistent(s41, recommended_weight_range_size_160).

evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, w120_plus_160)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr recommended_weight_range_size_161w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size
% @values w120_plus_161w=120_plus_lbs_55_plus_kg unk_recommended_weight_range_size_161w=Unknown
% @importance 1.0

0.95::acc(s41, recommended_weight_range_size_161w).

0.90::true_val(recommended_weight_range_size_161w, w120_plus_161w); 0.10::true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w).

measured(s41, recommended_weight_range_size_161w, w120_plus_161w).

all_consistent(recommended_weight_range_size_161w) :- consistent(s41, recommended_weight_range_size_161w).

evidence(all_consistent(recommended_weight_range_size_161w)).
query(true_val(recommended_weight_range_size_161w, w120_plus_161w)).
query(true_val(recommended_weight_range_size_161w, unk_recommended_weight_range_size_161w)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.95

0.78::acc(s2, mounting_pattern).

0.71::true_val(mounting_pattern, inserts_2x4); 0.29::true_val(mounting_pattern, unk_mounting_pattern).

measured(s2, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s2), consistent(s2, mounting_pattern) ; \+indep(s2)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 1.0

0.95::acc(s41, shape).

0.90::true_val(shape, directional_twin); 0.10::true_val(shape, unk_shape).

measured(s41, shape, directional_twin).

all_consistent(shape) :- consistent(s41, shape).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name shape
% @values sym_shifted_floaty_nose_blunted_tail=Symmetrical_shifted_stance_floaty_nose_blunted_tail unk_shape_description=Unknown
% @importance 0.75

0.88::acc(s21, shape_description).

0.77::true_val(shape_description, sym_shifted_floaty_nose_blunted_tail); 0.23::true_val(shape_description, unk_shape_description).

measured(s21, shape_description, sym_shifted_floaty_nose_blunted_tail).

all_consistent(shape_description) :- consistent(s21, shape_description).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, sym_shifted_floaty_nose_blunted_tail)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c2x_directional_hybrid_rocker=C2x_Directional_Hybrid_Rocker unk_camber_type=Unknown
% @importance 0.9

0.85::acc(s44, camber_type).

0.76::true_val(camber_type, c2x_directional_hybrid_rocker); 0.24::true_val(camber_type, unk_camber_type).

measured(s44, camber_type, c2x_directional_hybrid_rocker).

all_consistent(camber_type) :-
    (indep(s44), consistent(s44, camber_type) ; \+indep(s44)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, c2x_directional_hybrid_rocker)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values shortened_rocker_lengthened_camber=Shortened_rocker_between_feet_lengthened_directional_camber_to_tip_tail unk_camber_description=Unknown
% @importance 0.85

0.82::acc(s45, camber_description).

0.76::true_val(camber_description, shortened_rocker_lengthened_camber); 0.24::true_val(camber_description, unk_camber_description).

measured(s45, camber_description, shortened_rocker_lengthened_camber).

all_consistent(camber_description) :-
    (indep(s7), consistent(s45, camber_description) ; \+indep(s7)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, shortened_rocker_lengthened_camber)).
query(true_val(camber_description, unk_camber_description)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values op_75_aspen_25_paulownia=OP_Original_Power_75pct_Aspen_25pct_Paulownia unk_core_material=Unknown
% @importance 0.75

0.85::acc(s46, core_material).

0.76::true_val(core_material, op_75_aspen_25_paulownia); 0.24::true_val(core_material, unk_core_material).

measured(s46, core_material, op_75_aspen_25_paulownia).

all_consistent(core_material) :-
    (indep(s7), consistent(s46, core_material) ; \+indep(s7)).

evidence(all_consistent(core_material)).
query(true_val(core_material, op_75_aspen_25_paulownia)).
query(true_val(core_material, unk_core_material)).

% @attr core_material_feel
% @type categorical
% @canonical false
% @original_name core_material
% @values light_strong_lively=Light_environmentally_friendly_strong_lively unk_core_material_feel=Unknown
% @importance 0.75

0.85::acc(s46, core_material_feel).

0.76::true_val(core_material_feel, light_strong_lively); 0.24::true_val(core_material_feel, unk_core_material_feel).

measured(s46, core_material_feel, light_strong_lively).

all_consistent(core_material_feel) :-
    (indep(s7), consistent(s46, core_material_feel) ; \+indep(s7)).

evidence(all_consistent(core_material_feel)).
query(true_val(core_material_feel, light_strong_lively)).
query(true_val(core_material_feel, unk_core_material_feel)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch_vertical_end_grain=Birch_vertical_end_grain_pop_durability unk_sidewall_material=Unknown
% @importance 0.6

0.85::acc(s47, sidewall_material).

0.76::true_val(sidewall_material, birch_vertical_end_grain); 0.24::true_val(sidewall_material, unk_sidewall_material).

measured(s47, sidewall_material, birch_vertical_end_grain).

all_consistent(sidewall_material) :-
    (indep(s7), consistent(s47, sidewall_material) ; \+indep(s7)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_vertical_end_grain)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_material_uhmw
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values uhmw_sintered=UHMW_Sintered_Sidewalls unk_sidewall_material_uhmw=Unknown
% @importance 0.6

0.82::acc(s48, sidewall_material_uhmw).

0.72::true_val(sidewall_material_uhmw, uhmw_sintered); 0.28::true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw).

measured(s48, sidewall_material_uhmw, uhmw_sintered).

all_consistent(sidewall_material_uhmw) :-
    (indep(s7), consistent(s48, sidewall_material_uhmw) ; \+indep(s7)).

evidence(all_consistent(sidewall_material_uhmw)).
query(true_val(sidewall_material_uhmw, uhmw_sintered)).
query(true_val(sidewall_material_uhmw, unk_sidewall_material_uhmw)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values tri_ax_bi_ax=Tri_Ax_Bi_Ax_Fiber_combination unk_laminate=Unknown
% @importance 0.95

0.78::acc(s2, laminate).

0.71::true_val(laminate, tri_ax_bi_ax); 0.29::true_val(laminate, unk_laminate).

measured(s2, laminate, tri_ax_bi_ax).

all_consistent(laminate) :-
    (indep(s2), consistent(s2, laminate) ; \+indep(s2)).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax_bi_ax)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_biax
% @type categorical
% @canonical false
% @original_name laminate
% @values biax_2way_snap=2_way_fiber_orientation_max_snap_decreased_chatter unk_laminate_biax=Unknown
% @importance 0.55

0.82::acc(s49, laminate_biax).

0.72::true_val(laminate_biax, biax_2way_snap); 0.28::true_val(laminate_biax, unk_laminate_biax).

measured(s49, laminate_biax, biax_2way_snap).

all_consistent(laminate_biax) :-
    (indep(s7), consistent(s49, laminate_biax) ; \+indep(s7)).

evidence(all_consistent(laminate_biax)).
query(true_val(laminate_biax, biax_2way_snap)).
query(true_val(laminate_biax, unk_laminate_biax)).

% @attr laminate_triax
% @type categorical
% @canonical false
% @original_name laminate
% @values triax_3way_stability=3_way_fiber_orientation_increased_snap_decreased_vibrations unk_laminate_triax=Unknown
% @importance 0.55

0.75::acc(s50, laminate_triax).

0.60::true_val(laminate_triax, triax_3way_stability); 0.40::true_val(laminate_triax, unk_laminate_triax).

measured(s50, laminate_triax, triax_3way_stability).

all_consistent(laminate_triax) :- consistent(s50, laminate_triax).

evidence(all_consistent(laminate_triax)).
query(true_val(laminate_triax, triax_3way_stability)).
query(true_val(laminate_triax, unk_laminate_triax)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values eco_sublimated_tnt=Eco_Sublimated_TNT_Base unk_base_type=Unknown
% @importance 0.95

0.78::acc(s2, base_type).

0.71::true_val(base_type, eco_sublimated_tnt); 0.29::true_val(base_type, unk_base_type).

measured(s2, base_type, eco_sublimated_tnt).

all_consistent(base_type) :-
    (indep(s2), consistent(s2, base_type) ; \+indep(s2)).

evidence(all_consistent(base_type)).
query(true_val(base_type, eco_sublimated_tnt)).
query(true_val(base_type, unk_base_type)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values highest_density_uhmw_dual_layer=Highest_density_UHMW_dual_layer_thermal_fusion_crystalline unk_base_material=Unknown
% @importance 0.95

0.78::acc(s2, base_material).

0.71::true_val(base_material, highest_density_uhmw_dual_layer); 0.29::true_val(base_material, unk_base_material).

measured(s2, base_material, highest_density_uhmw_dual_layer).

all_consistent(base_material) :-
    (indep(s2), consistent(s2, base_material) ; \+indep(s2)).

evidence(all_consistent(base_material)).
query(true_val(base_material, highest_density_uhmw_dual_layer)).
query(true_val(base_material, unk_base_material)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Topsheet unk_topsheet=Unknown
% @importance 0.95

0.78::acc(s2, topsheet).

0.71::true_val(topsheet, eco_sublimated_poly); 0.29::true_val(topsheet, unk_topsheet).

measured(s2, topsheet, eco_sublimated_poly).

all_consistent(topsheet) :-
    (indep(s2), consistent(s2, topsheet) ; \+indep(s2)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction_7_serrations=Magne_Traction_7_serrations_each_edge unk_edge_technology=Unknown
% @importance 0.8

0.78::acc(s51, edge_technology).

0.63::true_val(edge_technology, magne_traction_7_serrations); 0.37::true_val(edge_technology, unk_edge_technology).

measured(s51, edge_technology, magne_traction_7_serrations).

all_consistent(edge_technology) :-
    (indep(s51), consistent(s51, edge_technology) ; \+indep(s51)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7_serrations)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr magne_traction_patents
% @type categorical
% @canonical false
% @original_name Magne-Traction patents
% @values us_7823892_8511704=US_Patent_7823892_8511704 unk_magne_traction_patents=Unknown
% @importance 0.85

0.80::acc(s42, magne_traction_patents).

0.68::true_val(magne_traction_patents, us_7823892_8511704); 0.32::true_val(magne_traction_patents, unk_magne_traction_patents).

measured(s42, magne_traction_patents, us_7823892_8511704).

all_consistent(magne_traction_patents) :- consistent(s42, magne_traction_patents).

evidence(all_consistent(magne_traction_patents)).
query(true_val(magne_traction_patents, us_7823892_8511704)).
query(true_val(magne_traction_patents, unk_magne_traction_patents)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values uhmw_tip_tail_impact_deflection=UHMW_Tip_Tail_Impact_Deflection_edge_removed_nose_tail unk_construction_material_innovation=Unknown
% @importance 0.95

0.78::acc(s2, construction_material_innovation).

0.71::true_val(construction_material_innovation, uhmw_tip_tail_impact_deflection); 0.29::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s2, construction_material_innovation, uhmw_tip_tail_impact_deflection).

all_consistent(construction_material_innovation) :-
    (indep(s2), consistent(s2, construction_material_innovation) ; \+indep(s2)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, uhmw_tip_tail_impact_deflection)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values schoph=Schoph_at_schoph unk_graphic_designer_artist=Unknown
% @importance 0.25

0.95::acc(s52, graphic_designer_artist).

0.90::true_val(graphic_designer_artist, schoph); 0.10::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s52, graphic_designer_artist, schoph).

all_consistent(graphic_designer_artist) :- consistent(s52, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, schoph)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr terrain_suitability
% @type numeric
% @canonical true
% @original_name terrain_suitability
% @unit /10
% @values v9=9.0 v10=10.0
% @importance 0.775

0.80::acc(s42, terrain_suitability).
0.70::acc(s34, terrain_suitability).

0.50::true_val(terrain_suitability, v9_am); 0.50::true_val(terrain_suitability, v10_am).

measured(s42, terrain_suitability, v9_am).
measured(s34, terrain_suitability, v10_am).

all_consistent(terrain_suitability) :-
    consistent(s42, terrain_suitability),
    consistent(s34, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, v9_am)).
query(true_val(terrain_suitability, v10_am)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability
% @unit /10
% @values v6_park=6.0 unk_terrain_suitability_park=Unknown
% @importance 0.85

0.80::acc(s42, terrain_suitability_park).

0.68::true_val(terrain_suitability_park, v6_park); 0.32::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s42, terrain_suitability_park, v6_park).

all_consistent(terrain_suitability_park) :- consistent(s42, terrain_suitability_park).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v6_park)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr terrain_suitability_freeride
% @type numeric
% @canonical false
% @original_name terrain_suitability
% @unit /10
% @values v7_freeride=7.0 unk_terrain_suitability_freeride=Unknown
% @importance 0.7

0.70::acc(s34, terrain_suitability_freeride).

0.55::true_val(terrain_suitability_freeride, v7_freeride); 0.45::true_val(terrain_suitability_freeride, unk_terrain_suitability_freeride).

measured(s34, terrain_suitability_freeride, v7_freeride).

all_consistent(terrain_suitability_freeride) :- consistent(s34, terrain_suitability_freeride).

evidence(all_consistent(terrain_suitability_freeride)).
query(true_val(terrain_suitability_freeride, v7_freeride)).
query(true_val(terrain_suitability_freeride, unk_terrain_suitability_freeride)).

% @attr terrain_suitability_freestyle
% @type numeric
% @canonical false
% @original_name terrain_suitability
% @unit /10
% @values v7_freestyle=7.0 unk_terrain_suitability_freestyle=Unknown
% @importance 0.7

0.70::acc(s34, terrain_suitability_freestyle).

0.55::true_val(terrain_suitability_freestyle, v7_freestyle); 0.45::true_val(terrain_suitability_freestyle, unk_terrain_suitability_freestyle).

measured(s34, terrain_suitability_freestyle, v7_freestyle).

all_consistent(terrain_suitability_freestyle) :- consistent(s34, terrain_suitability_freestyle).

evidence(all_consistent(terrain_suitability_freestyle)).
query(true_val(terrain_suitability_freestyle, v7_freestyle)).
query(true_val(terrain_suitability_freestyle, unk_terrain_suitability_freestyle)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate=Intermediate unk_rider_level=Unknown
% @importance 0.95

0.78::acc(s2, rider_level).

0.71::true_val(rider_level, intermediate); 0.29::true_val(rider_level, unk_rider_level).

measured(s2, rider_level, intermediate).

all_consistent(rider_level) :-
    (indep(s2), consistent(s2, rider_level) ; \+indep(s2)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate_advanced=Intermediate_Advanced beginner_expert=Beginner_Expert confident_expert=Confident_to_expert
% @importance 0.833

0.82::acc(s53, skill_level_recommendation).
0.80::acc(s54, skill_level_recommendation).
0.72::acc(s55, skill_level_recommendation).

0.40::true_val(skill_level_recommendation, intermediate_advanced); 0.35::true_val(skill_level_recommendation, beginner_expert); 0.25::true_val(skill_level_recommendation, confident_expert).

measured(s53, skill_level_recommendation, intermediate_advanced).
measured(s54, skill_level_recommendation, beginner_expert).
measured(s55, skill_level_recommendation, confident_expert).

all_consistent(skill_level_recommendation) :-
    consistent(s53, skill_level_recommendation),
    consistent(s54, skill_level_recommendation),
    (indep(s2), consistent(s55, skill_level_recommendation) ; \+indep(s2)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, beginner_expert)).
query(true_val(skill_level_recommendation, confident_expert)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values semi_loose=Semi_stable_semi_loose unk_on_snow_feel_tgr=Unknown
% @importance 0.8

0.80::acc(s56, on_snow_feel_tgr).

0.68::true_val(on_snow_feel_tgr, semi_loose); 0.32::true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr).

measured(s56, on_snow_feel_tgr, semi_loose).

all_consistent(on_snow_feel_tgr) :- consistent(s56, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, semi_loose)).
query(true_val(on_snow_feel_tgr, unk_on_snow_feel_tgr)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values fast=Fast unk_turn_initiation_performance=Unknown
% @importance 0.75

0.85::acc(s57, turn_initiation_performance).

0.72::true_val(turn_initiation_performance, fast); 0.28::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s57, turn_initiation_performance, fast).

all_consistent(turn_initiation_performance) :- consistent(s57, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, fast)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values medium_soft_due_rocker=Medium_soft_feels_softer_on_snow_due_central_rocker unk_flex_feel=Unknown
% @importance 0.85

0.85::acc(s58, flex_feel).

0.72::true_val(flex_feel, medium_soft_due_rocker); 0.28::true_val(flex_feel, unk_flex_feel).

measured(s58, flex_feel, medium_soft_due_rocker).

all_consistent(flex_feel) :- consistent(s58, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_soft_due_rocker)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values excellent_icy=Excellent_rated_for_icy_snow unk_edge_hold=Unknown
% @importance 0.85

0.85::acc(s59, edge_hold).

0.72::true_val(edge_hold, excellent_icy); 0.28::true_val(edge_hold, unk_edge_hold).

measured(s59, edge_hold, excellent_icy).

all_consistent(edge_hold) :- consistent(s59, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, excellent_icy)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr buttering
% @type categorical
% @canonical false
% @original_name Buttering
% @values semi_easy=Semi_easy_to_easy unk_buttering=Unknown
% @importance 0.6

0.85::acc(s60, buttering).

0.72::true_val(buttering, semi_easy); 0.28::true_val(buttering, unk_buttering).

measured(s60, buttering, semi_easy).

all_consistent(buttering) :- consistent(s60, buttering).

evidence(all_consistent(buttering)).
query(true_val(buttering, semi_easy)).
query(true_val(buttering, unk_buttering)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good_not_exceptional=Good_but_not_exceptional_slow_for_price unk_base_glide_performance=Unknown
% @importance 0.75

0.85::acc(s61, base_glide_performance).

0.72::true_val(base_glide_performance, good_not_exceptional); 0.28::true_val(base_glide_performance, unk_base_glide_performance).

measured(s61, base_glide_performance, good_not_exceptional).

all_consistent(base_glide_performance) :- consistent(s61, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good_not_exceptional)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values average_to_good=Average_to_good_decent_float unk_powder_rating_tgr=Unknown
% @importance 0.8

0.82::acc(s62, powder_rating_tgr).

0.68::true_val(powder_rating_tgr, average_to_good); 0.32::true_val(powder_rating_tgr, unk_powder_rating_tgr).

measured(s62, powder_rating_tgr, average_to_good).

all_consistent(powder_rating_tgr) :- consistent(s62, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, average_to_good)).
query(true_val(powder_rating_tgr, unk_powder_rating_tgr)).

% @attr speed_stability
% @type categorical
% @canonical false
% @original_name Speed stability
% @values good_loose_high_speed=Good_but_can_feel_loose_at_high_speed unk_speed_stability=Unknown
% @importance 0.75

0.82::acc(s63, speed_stability).

0.68::true_val(speed_stability, good_loose_high_speed); 0.32::true_val(speed_stability, unk_speed_stability).

measured(s63, speed_stability, good_loose_high_speed).

all_consistent(speed_stability) :- consistent(s63, speed_stability).

evidence(all_consistent(speed_stability)).
query(true_val(speed_stability, good_loose_high_speed)).
query(true_val(speed_stability, unk_speed_stability)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values great_like_true_twin=Great_almost_like_true_twin unk_switch_riding=Unknown
% @importance 0.7

0.85::acc(s64, switch_riding).

0.72::true_val(switch_riding, great_like_true_twin); 0.28::true_val(switch_riding, unk_switch_riding).

measured(s64, switch_riding, great_like_true_twin).

all_consistent(switch_riding) :- consistent(s64, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, great_like_true_twin)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great_pop_ollie=Great_pop_and_ollie_easy_to_access unk_jumps_rating_tgr=Unknown
% @importance 0.7

0.85::acc(s65, jumps_rating_tgr).

0.72::true_val(jumps_rating_tgr, great_pop_ollie); 0.28::true_val(jumps_rating_tgr, unk_jumps_rating_tgr).

measured(s65, jumps_rating_tgr, great_pop_ollie).

all_consistent(jumps_rating_tgr) :- consistent(s65, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great_pop_ollie)).
query(true_val(jumps_rating_tgr, unk_jumps_rating_tgr)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values good_rocker_hurries=Good_for_hybrid_rocker_but_rocker_hurries_through_turns unk_carving_rating_tgr=Unknown
% @importance 0.8

0.82::acc(s66, carving_rating_tgr).

0.68::true_val(carving_rating_tgr, good_rocker_hurries); 0.32::true_val(carving_rating_tgr, unk_carving_rating_tgr).

measured(s66, carving_rating_tgr, good_rocker_hurries).

all_consistent(carving_rating_tgr) :- consistent(s66, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, good_rocker_hurries)).
query(true_val(carving_rating_tgr, unk_carving_rating_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values good_not_specialist=Good_not_specialist unk_jibbing_rating_tgr=Unknown
% @importance 0.55

0.82::acc(s67, jibbing_rating_tgr).

0.68::true_val(jibbing_rating_tgr, good_not_specialist); 0.32::true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr).

measured(s67, jibbing_rating_tgr, good_not_specialist).

all_consistent(jibbing_rating_tgr) :- consistent(s67, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, good_not_specialist)).
query(true_val(jibbing_rating_tgr, unk_jibbing_rating_tgr)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v87_3=87.3 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.8

0.82::acc(s68, overall_rating_snowboardingprofiles).

0.71::true_val(overall_rating_snowboardingprofiles, v87_3); 0.29::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s68, overall_rating_snowboardingprofiles, v87_3).

all_consistent(overall_rating_snowboardingprofiles) :- consistent(s68, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v87_3)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical true
% @original_name reviewer_opinion_snowboardingprofiles
% @values rank_10th_of_32=10th_out_of_32_all_mountain_boards_tested unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.75

0.80::acc(s69, reviewer_opinion_snowboardingprofiles).

0.68::true_val(reviewer_opinion_snowboardingprofiles, rank_10th_of_32); 0.32::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s69, reviewer_opinion_snowboardingprofiles, rank_10th_of_32).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s69, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, rank_10th_of_32)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles_avg
% @type numeric
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @unit /100
% @values v84_6=84.6 unk_reviewer_opinion_snowboardingprofiles_avg=Unknown
% @importance 0.65

0.80::acc(s70, reviewer_opinion_snowboardingprofiles_avg).

0.68::true_val(reviewer_opinion_snowboardingprofiles_avg, v84_6); 0.32::true_val(reviewer_opinion_snowboardingprofiles_avg, unk_reviewer_opinion_snowboardingprofiles_avg).

measured(s70, reviewer_opinion_snowboardingprofiles_avg, v84_6).

all_consistent(reviewer_opinion_snowboardingprofiles_avg) :- consistent(s70, reviewer_opinion_snowboardingprofiles_avg).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_avg)).
query(true_val(reviewer_opinion_snowboardingprofiles_avg, v84_6)).
query(true_val(reviewer_opinion_snowboardingprofiles_avg, unk_reviewer_opinion_snowboardingprofiles_avg)).

% @attr lib_tech_website_user_rating
% @type categorical
% @canonical false
% @original_name Lib Tech website user rating
% @values pct_99_of_100_37_reviews=99_pct_of_100_37_reviews unk_lib_tech_website_user_rating=Unknown
% @importance 1.0

0.90::acc(s41, lib_tech_website_user_rating).

0.90::true_val(lib_tech_website_user_rating, pct_99_of_100_37_reviews); 0.10::true_val(lib_tech_website_user_rating, unk_lib_tech_website_user_rating).

measured(s41, lib_tech_website_user_rating, pct_99_of_100_37_reviews).

all_consistent(lib_tech_website_user_rating) :- consistent(s41, lib_tech_website_user_rating).

evidence(all_consistent(lib_tech_website_user_rating)).
query(true_val(lib_tech_website_user_rating, pct_99_of_100_37_reviews)).
query(true_val(lib_tech_website_user_rating, unk_lib_tech_website_user_rating)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values forgiving_versatile_grip=Very_forgiving_versatile_one_board_quiver_excellent_grip unk_positive_aspect=Unknown
% @importance 0.9

0.85::acc(s71, positive_aspect).

0.76::true_val(positive_aspect, forgiving_versatile_grip); 0.24::true_val(positive_aspect, unk_positive_aspect).

measured(s71, positive_aspect, forgiving_versatile_grip).

all_consistent(positive_aspect) :- consistent(s71, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, forgiving_versatile_grip)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values loose_auto_spinny_slow_base=Can_feel_loose_auto_spinny_base_slow_for_price unk_negative_aspect=Unknown
% @importance 0.9

0.85::acc(s72, negative_aspect).

0.76::true_val(negative_aspect, loose_auto_spinny_slow_base); 0.24::true_val(negative_aspect, unk_negative_aspect).

measured(s72, negative_aspect, loose_auto_spinny_slow_base).

all_consistent(negative_aspect) :- consistent(s72, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, loose_auto_spinny_slow_base)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values no_fuss_workhorse=No_fuss_no_frills_steamrolling_everything_workhorse unk_reviewer_opinion_whitelines=Unknown
% @importance 0.7

0.82::acc(s73, reviewer_opinion_whitelines).

0.68::true_val(reviewer_opinion_whitelines, no_fuss_workhorse); 0.32::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s73, reviewer_opinion_whitelines, no_fuss_workhorse).

all_consistent(reviewer_opinion_whitelines) :- consistent(s73, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, no_fuss_workhorse)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_edge
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values edge_hold_fantastic=Edge_hold_fantastic_due_to_magne_traction unk_reviewer_opinion_whitelines_edge=Unknown
% @importance 0.8

0.82::acc(s74, reviewer_opinion_whitelines_edge).

0.68::true_val(reviewer_opinion_whitelines_edge, edge_hold_fantastic); 0.32::true_val(reviewer_opinion_whitelines_edge, unk_reviewer_opinion_whitelines_edge).

measured(s74, reviewer_opinion_whitelines_edge, edge_hold_fantastic).

all_consistent(reviewer_opinion_whitelines_edge) :- consistent(s74, reviewer_opinion_whitelines_edge).

evidence(all_consistent(reviewer_opinion_whitelines_edge)).
query(true_val(reviewer_opinion_whitelines_edge, edge_hold_fantastic)).
query(true_val(reviewer_opinion_whitelines_edge, unk_reviewer_opinion_whitelines_edge)).

% @attr reviewer_opinion_whitelines_confidence
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values quick_confidence=Takes_very_little_time_to_gain_confidence unk_reviewer_opinion_whitelines_confidence=Unknown
% @importance 0.7

0.78::acc(s75, reviewer_opinion_whitelines_confidence).

0.64::true_val(reviewer_opinion_whitelines_confidence, quick_confidence); 0.36::true_val(reviewer_opinion_whitelines_confidence, unk_reviewer_opinion_whitelines_confidence).

measured(s75, reviewer_opinion_whitelines_confidence, quick_confidence).

all_consistent(reviewer_opinion_whitelines_confidence) :- consistent(s75, reviewer_opinion_whitelines_confidence).

evidence(all_consistent(reviewer_opinion_whitelines_confidence)).
query(true_val(reviewer_opinion_whitelines_confidence, quick_confidence)).
query(true_val(reviewer_opinion_whitelines_confidence, unk_reviewer_opinion_whitelines_confidence)).

% @attr reviewer_opinion_snowboardingprofiles_feel
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values snappy_lively_not_damp=Best_for_snappy_lively_feel_rather_than_damp_smooth unk_reviewer_opinion_snowboardingprofiles_feel=Unknown
% @importance 0.8

0.80::acc(s76, reviewer_opinion_snowboardingprofiles_feel).

0.68::true_val(reviewer_opinion_snowboardingprofiles_feel, snappy_lively_not_damp); 0.32::true_val(reviewer_opinion_snowboardingprofiles_feel, unk_reviewer_opinion_snowboardingprofiles_feel).

measured(s76, reviewer_opinion_snowboardingprofiles_feel, snappy_lively_not_damp).

all_consistent(reviewer_opinion_snowboardingprofiles_feel) :- consistent(s76, reviewer_opinion_snowboardingprofiles_feel).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles_feel)).
query(true_val(reviewer_opinion_snowboardingprofiles_feel, snappy_lively_not_damp)).
query(true_val(reviewer_opinion_snowboardingprofiles_feel, unk_reviewer_opinion_snowboardingprofiles_feel)).

% @attr reviewer_opinion_whitelines_base
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values tnt_base_not_fast=TNT_Base_not_as_fast_as_others_but_durable_low_maintenance unk_reviewer_opinion_whitelines_base=Unknown
% @importance 0.75

0.82::acc(s77, reviewer_opinion_whitelines_base).

0.72::true_val(reviewer_opinion_whitelines_base, tnt_base_not_fast); 0.28::true_val(reviewer_opinion_whitelines_base, unk_reviewer_opinion_whitelines_base).

measured(s77, reviewer_opinion_whitelines_base, tnt_base_not_fast).

all_consistent(reviewer_opinion_whitelines_base) :- consistent(s77, reviewer_opinion_whitelines_base).

evidence(all_consistent(reviewer_opinion_whitelines_base)).
query(true_val(reviewer_opinion_whitelines_base, tnt_base_not_fast)).
query(true_val(reviewer_opinion_whitelines_base, unk_reviewer_opinion_whitelines_base)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values quiver_killer_ice_praised=Truly_a_quiver_killer_ice_handling_praised unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.65

0.60::acc(s78, reviewer_opinion_the_good_ride).

0.36::true_val(reviewer_opinion_the_good_ride, quiver_killer_ice_praised); 0.64::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s78, reviewer_opinion_the_good_ride, quiver_killer_ice_praised).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s78, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, quiver_killer_ice_praised)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr reviewer_opinion_the_good_ride_pop
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values ton_of_pop_carving_washout=A_TON_of_pop_praised_carving_noted_washout unk_reviewer_opinion_the_good_ride_pop=Unknown
% @importance 0.65

0.60::acc(s79, reviewer_opinion_the_good_ride_pop).

0.36::true_val(reviewer_opinion_the_good_ride_pop, ton_of_pop_carving_washout); 0.64::true_val(reviewer_opinion_the_good_ride_pop, unk_reviewer_opinion_the_good_ride_pop).

measured(s79, reviewer_opinion_the_good_ride_pop, ton_of_pop_carving_washout).

all_consistent(reviewer_opinion_the_good_ride_pop) :- consistent(s79, reviewer_opinion_the_good_ride_pop).

evidence(all_consistent(reviewer_opinion_the_good_ride_pop)).
query(true_val(reviewer_opinion_the_good_ride_pop, ton_of_pop_carving_washout)).
query(true_val(reviewer_opinion_the_good_ride_pop, unk_reviewer_opinion_the_good_ride_pop)).

% @attr negative_aspect_stability
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values not_stable_high_speed_not_beginner=Not_most_stable_super_high_speeds_not_best_beginners unk_negative_aspect_stability=Unknown
% @importance 0.75

0.65::acc(s80, negative_aspect_stability).

0.47::true_val(negative_aspect_stability, not_stable_high_speed_not_beginner); 0.53::true_val(negative_aspect_stability, unk_negative_aspect_stability).

measured(s80, negative_aspect_stability, not_stable_high_speed_not_beginner).

all_consistent(negative_aspect_stability) :- consistent(s80, negative_aspect_stability).

evidence(all_consistent(negative_aspect_stability)).
query(true_val(negative_aspect_stability, not_stable_high_speed_not_beginner)).
query(true_val(negative_aspect_stability, unk_negative_aspect_stability)).

% @attr user_review_forum_rocker
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values semi_loose_icy_ramps=Rocker_feels_semi_loose_squirrelly_on_icy_lift_ramps unk_user_review_forum_rocker=Unknown
% @importance 0.7

0.50::acc(s81, user_review_forum_rocker).

0.28::true_val(user_review_forum_rocker, semi_loose_icy_ramps); 0.72::true_val(user_review_forum_rocker, unk_user_review_forum_rocker).

measured(s81, user_review_forum_rocker, semi_loose_icy_ramps).

all_consistent(user_review_forum_rocker) :- consistent(s81, user_review_forum_rocker).

evidence(all_consistent(user_review_forum_rocker)).
query(true_val(user_review_forum_rocker, semi_loose_icy_ramps)).
query(true_val(user_review_forum_rocker, unk_user_review_forum_rocker)).

% @attr user_review_forum_base
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values tnt_not_fast=TNT_base_not_as_fast_as_sintered_other_brands unk_user_review_forum_base=Unknown
% @importance 0.7

0.50::acc(s82, user_review_forum_base).

0.30::true_val(user_review_forum_base, tnt_not_fast); 0.70::true_val(user_review_forum_base, unk_user_review_forum_base).

measured(s82, user_review_forum_base, tnt_not_fast).

all_consistent(user_review_forum_base) :- consistent(s82, user_review_forum_base).

evidence(all_consistent(user_review_forum_base)).
query(true_val(user_review_forum_base, tnt_not_fast)).
query(true_val(user_review_forum_base, unk_user_review_forum_base)).

% @attr user_review_forum_magne_traction
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values catchy_flat_basing=Magne_Traction_can_feel_catchy_when_flat_basing unk_user_review_forum_magne_traction=Unknown
% @importance 0.65

0.45::acc(s83, user_review_forum_magne_traction).

0.25::true_val(user_review_forum_magne_traction, catchy_flat_basing); 0.75::true_val(user_review_forum_magne_traction, unk_user_review_forum_magne_traction).

measured(s83, user_review_forum_magne_traction, catchy_flat_basing).

all_consistent(user_review_forum_magne_traction) :- consistent(s83, user_review_forum_magne_traction).

evidence(all_consistent(user_review_forum_magne_traction)).
query(true_val(user_review_forum_magne_traction, catchy_flat_basing)).
query(true_val(user_review_forum_magne_traction, unk_user_review_forum_magne_traction)).

% @attr board_weight_grams_154
% @type numeric
% @canonical false
% @original_name board_weight_grams
% @unit grams
% @values v2900=2900.0 unk_board_weight_grams_154=Unknown
% @importance 0.65

0.82::acc(s84, board_weight_grams_154).

0.68::true_val(board_weight_grams_154, v2900); 0.32::true_val(board_weight_grams_154, unk_board_weight_grams_154).

measured(s84, board_weight_grams_154, v2900).

all_consistent(board_weight_grams_154) :- consistent(s84, board_weight_grams_154).

evidence(all_consistent(board_weight_grams_154)).
query(true_val(board_weight_grams_154, v2900)).
query(true_val(board_weight_grams_154, unk_board_weight_grams_154)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit grams
% @values v2860=2860.0 unk_board_weight_grams=Unknown
% @importance 0.65

0.82::acc(s85, board_weight_grams).

0.68::true_val(board_weight_grams, v2860); 0.32::true_val(board_weight_grams, unk_board_weight_grams).

measured(s85, board_weight_grams, v2860).

all_consistent(board_weight_grams) :- consistent(s85, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2860)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type numeric
% @canonical true
% @original_name weight_per_cm
% @unit g/cm
% @values v18_83=18.83 unk_weight_per_cm=Unknown
% @importance 0.55

0.75::acc(s86, weight_per_cm).

0.60::true_val(weight_per_cm, v18_83); 0.40::true_val(weight_per_cm, unk_weight_per_cm).

measured(s86, weight_per_cm, v18_83).

all_consistent(weight_per_cm) :- consistent(s86, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, v18_83)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr reviewer_opinion_the_good_ride_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values normal_bordering_light=Feels_pretty_normal_bordering_on_light_far_from_ultra_light unk_reviewer_opinion_the_good_ride_weight=Unknown
% @importance 0.55

0.82::acc(s87, reviewer_opinion_the_good_ride_weight).

0.68::true_val(reviewer_opinion_the_good_ride_weight, normal_bordering_light); 0.32::true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight).

measured(s87, reviewer_opinion_the_good_ride_weight, normal_bordering_light).

all_consistent(reviewer_opinion_the_good_ride_weight) :- consistent(s87, reviewer_opinion_the_good_ride_weight).

evidence(all_consistent(reviewer_opinion_the_good_ride_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, normal_bordering_light)).
query(true_val(reviewer_opinion_the_good_ride_weight, unk_reviewer_opinion_the_good_ride_weight)).

% @attr ideal_boot_size_152
% @type categorical
% @canonical false
% @original_name Ideal boot size 152cm
% @values us_8_9=US_8_to_9 unk_ideal_boot_size_152=Unknown
% @importance 0.85

0.85::acc(s88, ideal_boot_size_152).

0.72::true_val(ideal_boot_size_152, us_8_9); 0.28::true_val(ideal_boot_size_152, unk_ideal_boot_size_152).

measured(s88, ideal_boot_size_152, us_8_9).

all_consistent(ideal_boot_size_152) :- consistent(s88, ideal_boot_size_152).

evidence(all_consistent(ideal_boot_size_152)).
query(true_val(ideal_boot_size_152, us_8_9)).
query(true_val(ideal_boot_size_152, unk_ideal_boot_size_152)).

% @attr ideal_boot_size_154
% @type categorical
% @canonical false
% @original_name Ideal boot size 154cm
% @values us_8_5_9_5=US_8.5_to_9.5 unk_ideal_boot_size_154=Unknown
% @importance 0.85

0.85::acc(s88, ideal_boot_size_154).

0.72::true_val(ideal_boot_size_154, us_8_5_9_5); 0.28::true_val(ideal_boot_size_154, unk_ideal_boot_size_154).

measured(s88, ideal_boot_size_154, us_8_5_9_5).

all_consistent(ideal_boot_size_154) :- consistent(s88, ideal_boot_size_154).

evidence(all_consistent(ideal_boot_size_154)).
query(true_val(ideal_boot_size_154, us_8_5_9_5)).
query(true_val(ideal_boot_size_154, unk_ideal_boot_size_154)).

% @attr ideal_boot_size_157
% @type categorical
% @canonical false
% @original_name Ideal boot size 157cm
% @values us_9_5_10_5=US_9.5_to_10.5 unk_ideal_boot_size_157=Unknown
% @importance 0.85

0.85::acc(s88, ideal_boot_size_157).

0.72::true_val(ideal_boot_size_157, us_9_5_10_5); 0.28::true_val(ideal_boot_size_157, unk_ideal_boot_size_157).

measured(s88, ideal_boot_size_157, us_9_5_10_5).

all_consistent(ideal_boot_size_157) :- consistent(s88, ideal_boot_size_157).

evidence(all_consistent(ideal_boot_size_157)).
query(true_val(ideal_boot_size_157, us_9_5_10_5)).
query(true_val(ideal_boot_size_157, unk_ideal_boot_size_157)).

% @attr ideal_boot_size_160
% @type categorical
% @canonical false
% @original_name Ideal boot size 160cm
% @values us_10_11=US_10_to_11 unk_ideal_boot_size_160=Unknown
% @importance 0.85

0.85::acc(s88, ideal_boot_size_160).

0.72::true_val(ideal_boot_size_160, us_10_11); 0.28::true_val(ideal_boot_size_160, unk_ideal_boot_size_160).

measured(s88, ideal_boot_size_160, us_10_11).

all_consistent(ideal_boot_size_160) :- consistent(s88, ideal_boot_size_160).

evidence(all_consistent(ideal_boot_size_160)).
query(true_val(ideal_boot_size_160, us_10_11)).
query(true_val(ideal_boot_size_160, unk_ideal_boot_size_160)).

% @attr ideal_boot_size_156w
% @type categorical
% @canonical false
% @original_name Ideal boot size 156W
% @values us_11_12=US_11_to_12 unk_ideal_boot_size_156w=Unknown
% @importance 0.85

0.85::acc(s88, ideal_boot_size_156w).

0.72::true_val(ideal_boot_size_156w, us_11_12); 0.28::true_val(ideal_boot_size_156w, unk_ideal_boot_size_156w).

measured(s88, ideal_boot_size_156w, us_11_12).

all_consistent(ideal_boot_size_156w) :- consistent(s88, ideal_boot_size_156w).

evidence(all_consistent(ideal_boot_size_156w)).
query(true_val(ideal_boot_size_156w, us_11_12)).
query(true_val(ideal_boot_size_156w, unk_ideal_boot_size_156w)).

% @attr ideal_boot_size_161w
% @type categorical
% @canonical false
% @original_name Ideal boot size 161W
% @values us_11_5_12_5=US_11.5_to_12.5 unk_ideal_boot_size_161w=Unknown
% @importance 0.85

0.85::acc(s88, ideal_boot_size_161w).

0.72::true_val(ideal_boot_size_161w, us_11_5_12_5); 0.28::true_val(ideal_boot_size_161w, unk_ideal_boot_size_161w).

measured(s88, ideal_boot_size_161w, us_11_5_12_5).

all_consistent(ideal_boot_size_161w) :- consistent(s88, ideal_boot_size_161w).

evidence(all_consistent(ideal_boot_size_161w)).
query(true_val(ideal_boot_size_161w, us_11_5_12_5)).
query(true_val(ideal_boot_size_161w, unk_ideal_boot_size_161w)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values jones_mountain_twin=Jones_Mountain_Twin_similar_all_mountain_freestyle_hybrid unk_comparable_board_cross_brand=Unknown
% @importance 0.7

0.55::acc(s89, comparable_board_cross_brand).

0.34::true_val(comparable_board_cross_brand, jones_mountain_twin); 0.66::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s89, comparable_board_cross_brand, jones_mountain_twin).

all_consistent(comparable_board_cross_brand) :- consistent(s89, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_yes
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values yes_standard_uninc=YES_Standard_Uninc_similar_versatile_all_mountain unk_comparable_board_cross_brand_yes=Unknown
% @importance 0.65

0.50::acc(s90, comparable_board_cross_brand_yes).

0.28::true_val(comparable_board_cross_brand_yes, yes_standard_uninc); 0.72::true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes).

measured(s90, comparable_board_cross_brand_yes, yes_standard_uninc).

all_consistent(comparable_board_cross_brand_yes) :- consistent(s90, comparable_board_cross_brand_yes).

evidence(all_consistent(comparable_board_cross_brand_yes)).
query(true_val(comparable_board_cross_brand_yes, yes_standard_uninc)).
query(true_val(comparable_board_cross_brand_yes, unk_comparable_board_cross_brand_yes)).

% @attr comparable_board_cross_brand_ride
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values ride_algorhythm=Ride_Algorhythm_similar_all_mountain_daily_driver unk_comparable_board_cross_brand_ride=Unknown
% @importance 0.7

0.82::acc(s91, comparable_board_cross_brand_ride).

0.68::true_val(comparable_board_cross_brand_ride, ride_algorhythm); 0.32::true_val(comparable_board_cross_brand_ride, unk_comparable_board_cross_brand_ride).

measured(s91, comparable_board_cross_brand_ride, ride_algorhythm).

all_consistent(comparable_board_cross_brand_ride) :- consistent(s91, comparable_board_cross_brand_ride).

evidence(all_consistent(comparable_board_cross_brand_ride)).
query(true_val(comparable_board_cross_brand_ride, ride_algorhythm)).
query(true_val(comparable_board_cross_brand_ride, unk_comparable_board_cross_brand_ride)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values lib_tech_trs=Lib_Tech_TRS_narrower_waist_more_park_focused unk_comparable_board_same_brand=Unknown
% @importance 0.6

0.50::acc(s92, comparable_board_same_brand).

0.28::true_val(comparable_board_same_brand, lib_tech_trs); 0.72::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s92, comparable_board_same_brand, lib_tech_trs).

all_consistent(comparable_board_same_brand) :- consistent(s92, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, lib_tech_trs)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_dynamo
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values lib_tech_dynamo=Lib_Tech_Dynamo_more_directional unk_comparable_board_same_brand_dynamo=Unknown
% @importance 0.55

0.50::acc(s93, comparable_board_same_brand_dynamo).

0.28::true_val(comparable_board_same_brand_dynamo, lib_tech_dynamo); 0.72::true_val(comparable_board_same_brand_dynamo, unk_comparable_board_same_brand_dynamo).

measured(s93, comparable_board_same_brand_dynamo, lib_tech_dynamo).

all_consistent(comparable_board_same_brand_dynamo) :- consistent(s93, comparable_board_same_brand_dynamo).

evidence(all_consistent(comparable_board_same_brand_dynamo)).
query(true_val(comparable_board_same_brand_dynamo, lib_tech_dynamo)).
query(true_val(comparable_board_same_brand_dynamo, unk_comparable_board_same_brand_dynamo)).

% @attr comparable_board_cross_brand_gnu
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values gnu_riders_choice=GNU_Riders_Choice_similar_C2X_asymmetric_sintered unk_comparable_board_cross_brand_gnu=Unknown
% @importance 0.65

0.55::acc(s94, comparable_board_cross_brand_gnu).

0.36::true_val(comparable_board_cross_brand_gnu, gnu_riders_choice); 0.64::true_val(comparable_board_cross_brand_gnu, unk_comparable_board_cross_brand_gnu).

measured(s94, comparable_board_cross_brand_gnu, gnu_riders_choice).

all_consistent(comparable_board_cross_brand_gnu) :- consistent(s94, comparable_board_cross_brand_gnu).

evidence(all_consistent(comparable_board_cross_brand_gnu)).
query(true_val(comparable_board_cross_brand_gnu, gnu_riders_choice)).
query(true_val(comparable_board_cross_brand_gnu, unk_comparable_board_cross_brand_gnu)).

% @attr comparable_board_cross_brand_capita
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values capita_outerspace_living=CAPiTA_Outerspace_Living_comparable_all_mountain_freestyle unk_comparable_board_cross_brand_capita=Unknown
% @importance 0.55

0.45::acc(s95, comparable_board_cross_brand_capita).

0.23::true_val(comparable_board_cross_brand_capita, capita_outerspace_living); 0.77::true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita).

measured(s95, comparable_board_cross_brand_capita, capita_outerspace_living).

all_consistent(comparable_board_cross_brand_capita) :- consistent(s95, comparable_board_cross_brand_capita).

evidence(all_consistent(comparable_board_cross_brand_capita)).
query(true_val(comparable_board_cross_brand_capita, capita_outerspace_living)).
query(true_val(comparable_board_cross_brand_capita, unk_comparable_board_cross_brand_capita)).

% @attr comparable_board_cross_brand_burton
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand
% @values burton_deep_thinker=Burton_Deep_Thinker_more_freeride_commonly_cross_shopped unk_comparable_board_cross_brand_burton=Unknown
% @importance 0.55

0.45::acc(s96, comparable_board_cross_brand_burton).

0.24::true_val(comparable_board_cross_brand_burton, burton_deep_thinker); 0.76::true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton).

measured(s96, comparable_board_cross_brand_burton, burton_deep_thinker).

all_consistent(comparable_board_cross_brand_burton) :- consistent(s96, comparable_board_cross_brand_burton).

evidence(all_consistent(comparable_board_cross_brand_burton)).
query(true_val(comparable_board_cross_brand_burton, burton_deep_thinker)).
query(true_val(comparable_board_cross_brand_burton, unk_comparable_board_cross_brand_burton)).

% @attr comparable_board_same_brand_comparison
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand
% @values friendlier_less_aggressive=Slightly_friendlier_less_aggressive_than_Travis_Rice_Pro_TRS unk_comparable_board_same_brand_comparison=Unknown
% @importance 0.7

0.72::acc(s97, comparable_board_same_brand_comparison).

0.55::true_val(comparable_board_same_brand_comparison, friendlier_less_aggressive); 0.45::true_val(comparable_board_same_brand_comparison, unk_comparable_board_same_brand_comparison).

measured(s97, comparable_board_same_brand_comparison, friendlier_less_aggressive).

all_consistent(comparable_board_same_brand_comparison) :-
    (indep(s51), consistent(s97, comparable_board_same_brand_comparison) ; \+indep(s51)).

evidence(all_consistent(comparable_board_same_brand_comparison)).
query(true_val(comparable_board_same_brand_comparison, friendlier_less_aggressive)).
query(true_val(comparable_board_same_brand_comparison, unk_comparable_board_same_brand_comparison)).

% @attr sustainability_certification_eco_sub
% @type categorical
% @canonical false
% @original_name Eco-friendly sublimation used on topsheet and base
% @values eco_sublimation_topsheet_base=Eco_friendly_sublimation_on_topsheet_and_base unk_sustainability_certification_eco_sub=Unknown
% @importance 0.95

0.78::acc(s2, sustainability_certification_eco_sub).

0.71::true_val(sustainability_certification_eco_sub, eco_sublimation_topsheet_base); 0.29::true_val(sustainability_certification_eco_sub, unk_sustainability_certification_eco_sub).

measured(s2, sustainability_certification_eco_sub, eco_sublimation_topsheet_base).

all_consistent(sustainability_certification_eco_sub) :-
    (indep(s2), consistent(s2, sustainability_certification_eco_sub) ; \+indep(s2)).

evidence(all_consistent(sustainability_certification_eco_sub)).
query(true_val(sustainability_certification_eco_sub, eco_sublimation_topsheet_base)).
query(true_val(sustainability_certification_eco_sub, unk_sustainability_certification_eco_sub)).

% @attr sustainability_certification_sawdust
% @type categorical
% @canonical false
% @original_name Sawdust recycled as composting material
% @values sawdust_composting=Sawdust_recycled_as_composting_material unk_sustainability_certification_sawdust=Unknown
% @importance 0.45

0.85::acc(s10, sustainability_certification_sawdust).

0.72::true_val(sustainability_certification_sawdust, sawdust_composting); 0.28::true_val(sustainability_certification_sawdust, unk_sustainability_certification_sawdust).

measured(s10, sustainability_certification_sawdust, sawdust_composting).

all_consistent(sustainability_certification_sawdust) :- consistent(s10, sustainability_certification_sawdust).

evidence(all_consistent(sustainability_certification_sawdust)).
query(true_val(sustainability_certification_sawdust, sawdust_composting)).
query(true_val(sustainability_certification_sawdust, unk_sustainability_certification_sawdust)).

% @attr mervin_longest_running_factory
% @type categorical
% @canonical false
% @original_name Mervin is the longest-running and last major snowboard factory in the USA
% @values longest_running_last_major=Longest_running_last_major_board_factory_in_USA unk_mervin_longest_running_factory=Unknown
% @importance 0.5

0.88::acc(s98, mervin_longest_running_factory).

0.77::true_val(mervin_longest_running_factory, longest_running_last_major); 0.23::true_val(mervin_longest_running_factory, unk_mervin_longest_running_factory).

measured(s98, mervin_longest_running_factory, longest_running_last_major).

all_consistent(mervin_longest_running_factory) :- consistent(s98, mervin_longest_running_factory).

evidence(all_consistent(mervin_longest_running_factory)).
query(true_val(mervin_longest_running_factory, longest_running_last_major)).
query(true_val(mervin_longest_running_factory, unk_mervin_longest_running_factory)).

% @attr mervin_workforce
% @type numeric
% @canonical false
% @original_name Mervin workforce
% @values v120=120 unk_mervin_workforce=Unknown
% @importance 0.3

0.85::acc(s17, mervin_workforce).

0.77::true_val(mervin_workforce, v120); 0.23::true_val(mervin_workforce, unk_mervin_workforce).

measured(s17, mervin_workforce, v120).

all_consistent(mervin_workforce) :- consistent(s17, mervin_workforce).

evidence(all_consistent(mervin_workforce)).
query(true_val(mervin_workforce, v120)).
query(true_val(mervin_workforce, unk_mervin_workforce)).

% @attr mervin_four_day_workweek
% @type categorical
% @canonical false
% @original_name Mervin operates a four-day workweek
% @values four_day_workweek=Operates_four_day_workweek unk_mervin_four_day_workweek=Unknown
% @importance 0.3

0.85::acc(s17, mervin_four_day_workweek).

0.77::true_val(mervin_four_day_workweek, four_day_workweek); 0.23::true_val(mervin_four_day_workweek, unk_mervin_four_day_workweek).

measured(s17, mervin_four_day_workweek, four_day_workweek).

all_consistent(mervin_four_day_workweek) :- consistent(s17, mervin_four_day_workweek).

evidence(all_consistent(mervin_four_day_workweek)).
query(true_val(mervin_four_day_workweek, four_day_workweek)).
query(true_val(mervin_four_day_workweek, unk_mervin_four_day_workweek)).