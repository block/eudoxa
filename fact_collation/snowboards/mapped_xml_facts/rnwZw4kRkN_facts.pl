0.20::indep(s2).
0.15::indep(s_m).
0.15::indep(s7).
0.12::indep(s22).
0.15::indep(s21).
0.12::indep(s24).
0.15::indep(s16).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values salomon=Salomon unk_brand=Unknown
% @importance 0.925

0.93::acc(s1, brand).
0.82::acc(s2, brand).

0.97::true_val(brand, salomon); 0.03::true_val(brand, unk_brand).

measured(s1, brand, salomon).
measured(s2, brand, salomon).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, salomon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values pulse=Pulse unk_model_name=Unknown
% @importance 0.925

0.95::acc(s1, model_name).
0.83::acc(s2, model_name).

0.97::true_val(model_name, pulse); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, pulse).
measured(s2, model_name, pulse).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, pulse)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values season_2024_25=2024/2025 unk_model_year=Unknown
% @importance 0.70

0.94::acc(s1, model_year).

0.92::true_val(model_year, season_2024_25); 0.08::true_val(model_year, unk_model_year).

measured(s1, model_year, season_2024_25).

all_consistent(model_year) :-
    consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, season_2024_25)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.925

0.95::acc(s1, product_type).
0.84::acc(s2, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type),
    (indep(s2), consistent(s2, product_type) ; \+indep(s2)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.95::acc(s1, gender).

0.93::true_val(gender, mens); 0.07::true_val(gender, unk_gender).

measured(s1, gender, mens).

all_consistent(gender) :-
    consistent(s1, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All-Mountain unk_board_category=Unknown
% @importance 0.925

0.94::acc(s1, board_category).
0.82::acc(s2, board_category).

0.97::true_val(board_category, all_mountain); 0.03::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain).
measured(s2, board_category, all_mountain).

all_consistent(board_category) :-
    consistent(s1, board_category),
    (indep(s2), consistent(s2, board_category) ; \+indep(s2)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mountain_freestyle=All-Mountain_Freestyle unk_terrain_suitability=Unknown
% @importance 1.0

0.90::acc(s1, terrain_suitability).

0.88::true_val(terrain_suitability, all_mountain_freestyle); 0.12::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, all_mountain_freestyle).

all_consistent(terrain_suitability) :-
    consistent(s1, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mountain_freestyle)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values salomon_sas_annecy=Salomon_SAS_Annecy_France unk_manufacturer=Unknown
% @importance 0.50

0.80::acc(s4, manufacturer).

0.72::true_val(manufacturer, salomon_sas_annecy); 0.28::true_val(manufacturer, unk_manufacturer).

measured(s4, manufacturer, salomon_sas_annecy).

all_consistent(manufacturer) :-
    consistent(s4, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, salomon_sas_annecy)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values amer_sports_helsinki=Amer_Sports_Helsinki unk_parent_company=Unknown
% @importance 0.45

0.78::acc(s4, parent_company).
0.85::acc(s5, parent_company).

0.95::true_val(parent_company, amer_sports_helsinki); 0.05::true_val(parent_company, unk_parent_company).

measured(s4, parent_company, amer_sports_helsinki).
measured(s5, parent_company, amer_sports_helsinki).

all_consistent(parent_company) :-
    consistent(s4, parent_company),
    consistent(s5, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, amer_sports_helsinki)).
query(true_val(parent_company, unk_parent_company)).

% @attr amer_sports_ultimate_ownership
% @type categorical
% @canonical false
% @original_name Amer Sports ultimate ownership
% @values anta_sports_china=Anta_Sports_China unk_amer_sports_ultimate_ownership=Unknown
% @importance 0.30

0.48::acc(s6, amer_sports_ultimate_ownership).

0.47::true_val(amer_sports_ultimate_ownership, anta_sports_china); 0.53::true_val(amer_sports_ultimate_ownership, unk_amer_sports_ultimate_ownership).

measured(s6, amer_sports_ultimate_ownership, anta_sports_china).

all_consistent(amer_sports_ultimate_ownership) :-
    consistent(s6, amer_sports_ultimate_ownership).

evidence(all_consistent(amer_sports_ultimate_ownership)).
query(true_val(amer_sports_ultimate_ownership, anta_sports_china)).
query(true_val(amer_sports_ultimate_ownership, unk_amer_sports_ultimate_ownership)).

% @attr manufacturer_founded
% @type categorical
% @canonical false
% @original_name Manufacturer founded
% @values y1947_francois_salomon=1947_Francois_Salomon_Annecy unk_manufacturer_founded=Unknown
% @importance 0.45

0.78::acc(s4, manufacturer_founded).
0.82::acc(s5, manufacturer_founded).

0.95::true_val(manufacturer_founded, y1947_francois_salomon); 0.05::true_val(manufacturer_founded, unk_manufacturer_founded).

measured(s4, manufacturer_founded, y1947_francois_salomon).
measured(s5, manufacturer_founded, y1947_francois_salomon).

all_consistent(manufacturer_founded) :-
    consistent(s4, manufacturer_founded),
    consistent(s5, manufacturer_founded).

evidence(all_consistent(manufacturer_founded)).
query(true_val(manufacturer_founded, y1947_francois_salomon)).
query(true_val(manufacturer_founded, unk_manufacturer_founded)).

% @attr us_operations
% @type categorical
% @canonical false
% @original_name US operations
% @values ogden_utah=Ogden_Utah unk_us_operations=Unknown
% @importance 0.50

0.78::acc(s4, us_operations).

0.72::true_val(us_operations, ogden_utah); 0.28::true_val(us_operations, unk_us_operations).

measured(s4, us_operations, ogden_utah).

all_consistent(us_operations) :-
    consistent(s4, us_operations).

evidence(all_consistent(us_operations)).
query(true_val(us_operations, ogden_utah)).
query(true_val(us_operations, unk_us_operations)).

% @attr manufacturer_reputation
% @type categorical
% @canonical false
% @original_name Manufacturer reputation
% @values leading_outdoor_brand=Leading_outdoor_adventure_sports_brand unk_manufacturer_reputation=Unknown
% @importance 0.50

0.62::acc(s7, manufacturer_reputation).

0.56::true_val(manufacturer_reputation, leading_outdoor_brand); 0.44::true_val(manufacturer_reputation, unk_manufacturer_reputation).

measured(s7, manufacturer_reputation, leading_outdoor_brand).

all_consistent(manufacturer_reputation) :-
    consistent(s7, manufacturer_reputation).

evidence(all_consistent(manufacturer_reputation)).
query(true_val(manufacturer_reputation, leading_outdoor_brand)).
query(true_val(manufacturer_reputation, unk_manufacturer_reputation)).

% @attr manufacturer_brand_status
% @type categorical
% @canonical false
% @original_name Manufacturer brand status
% @values premium_partner_2026_olympics=Premium_Partner_Milano_Cortina_2026 unk_manufacturer_brand_status=Unknown
% @importance 0.50

0.78::acc(s4, manufacturer_brand_status).

0.72::true_val(manufacturer_brand_status, premium_partner_2026_olympics); 0.28::true_val(manufacturer_brand_status, unk_manufacturer_brand_status).

measured(s4, manufacturer_brand_status, premium_partner_2026_olympics).

all_consistent(manufacturer_brand_status) :-
    consistent(s4, manufacturer_brand_status).

evidence(all_consistent(manufacturer_brand_status)).
query(true_val(manufacturer_brand_status, premium_partner_2026_olympics)).
query(true_val(manufacturer_brand_status, unk_manufacturer_brand_status)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2008_09=2008/2009 unk_model_first_available_year=Unknown
% @importance 0.55

0.70::acc(s8, model_first_available_year).
0.78::acc(s9, model_first_available_year).

0.95::true_val(model_first_available_year, season_2008_09); 0.05::true_val(model_first_available_year, unk_model_first_available_year).

measured(s8, model_first_available_year, season_2008_09).
measured(s9, model_first_available_year, season_2008_09).

all_consistent(model_first_available_year) :-
    consistent(s8, model_first_available_year),
    consistent(s9, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2008_09)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr model_lineage
% @type categorical
% @canonical false
% @original_name Model lineage
% @values long_standing_entry_level_16_seasons=Long-standing_entry-level_16+_seasons unk_model_lineage=Unknown
% @importance 0.40

0.75::acc(s10, model_lineage).

0.68::true_val(model_lineage, long_standing_entry_level_16_seasons); 0.32::true_val(model_lineage, unk_model_lineage).

measured(s10, model_lineage, long_standing_entry_level_16_seasons).

all_consistent(model_lineage) :-
    consistent(s10, model_lineage).

evidence(all_consistent(model_lineage)).
query(true_val(model_lineage, long_standing_entry_level_16_seasons)).
query(true_val(model_lineage, unk_model_lineage)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v399_95=399.95 v349_95=349.95
% @importance 0.90

0.94::acc(s1, price_usd_msrp).
0.78::acc(s13, price_usd_msrp).
0.68::acc(s16, price_usd_msrp).
0.58::acc(s32, price_usd_msrp).
0.55::acc(s33, price_usd_msrp).
0.72::acc(s11, price_usd_msrp).
0.65::acc(s12, price_usd_msrp).

0.70::true_val(price_usd_msrp, v399_95); 0.30::true_val(price_usd_msrp, v349_95).

measured(s1, price_usd_msrp, v399_95).
measured(s13, price_usd_msrp, v399_95).
measured(s16, price_usd_msrp, v399_95).
measured(s32, price_usd_msrp, v399_95).
measured(s33, price_usd_msrp, v399_95).
measured(s11, price_usd_msrp, v349_95).
measured(s12, price_usd_msrp, v349_95).

all_consistent(price_usd_msrp) :-
    consistent(s1, price_usd_msrp),
    consistent(s13, price_usd_msrp),
    consistent(s16, price_usd_msrp),
    consistent(s32, price_usd_msrp),
    consistent(s33, price_usd_msrp),
    consistent(s11, price_usd_msrp),
    consistent(s12, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v399_95)).
query(true_val(price_usd_msrp, v349_95)).

% @attr salomon_com_sale_price_usd
% @type numeric
% @canonical false
% @original_name Salomon.com sale price (USD)
% @unit USD
% @values v319_96=319.96 unk_salomon_com_sale_price_usd=Unknown
% @importance 1.0

0.94::acc(s1, salomon_com_sale_price_usd).

0.92::true_val(salomon_com_sale_price_usd, v319_96); 0.08::true_val(salomon_com_sale_price_usd, unk_salomon_com_sale_price_usd).

measured(s1, salomon_com_sale_price_usd, v319_96).

all_consistent(salomon_com_sale_price_usd) :-
    consistent(s1, salomon_com_sale_price_usd).

evidence(all_consistent(salomon_com_sale_price_usd)).
query(true_val(salomon_com_sale_price_usd, v319_96)).
query(true_val(salomon_com_sale_price_usd, unk_salomon_com_sale_price_usd)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v549_99=549.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::acc(s_m, price_aud_merchant).

0.93::true_val(price_aud_merchant, v549_99); 0.07::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_m, price_aud_merchant, v549_99).

all_consistent(price_aud_merchant) :-
    consistent(s_m, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v549_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr the_house_sale_price_2025
% @type numeric
% @canonical false
% @original_name The House sale price (2025 model)
% @unit USD
% @values v258_95=258.95 unk_the_house_sale_price_2025=Unknown
% @importance 0.90

0.78::acc(s13, the_house_sale_price_2025).

0.74::true_val(the_house_sale_price_2025, v258_95); 0.26::true_val(the_house_sale_price_2025, unk_the_house_sale_price_2025).

measured(s13, the_house_sale_price_2025, v258_95).

all_consistent(the_house_sale_price_2025) :-
    consistent(s13, the_house_sale_price_2025).

evidence(all_consistent(the_house_sale_price_2025)).
query(true_val(the_house_sale_price_2025, v258_95)).
query(true_val(the_house_sale_price_2025, unk_the_house_sale_price_2025)).

% @attr the_house_price_2024
% @type numeric
% @canonical false
% @original_name The House price (2024 model)
% @unit USD
% @values v249_95=249.95 unk_the_house_price_2024=Unknown
% @importance 0.90

0.78::acc(s11, the_house_price_2024).

0.72::true_val(the_house_price_2024, v249_95); 0.28::true_val(the_house_price_2024, unk_the_house_price_2024).

measured(s11, the_house_price_2024, v249_95).

all_consistent(the_house_price_2024) :-
    consistent(s11, the_house_price_2024).

evidence(all_consistent(the_house_price_2024)).
query(true_val(the_house_price_2024, v249_95)).
query(true_val(the_house_price_2024, unk_the_house_price_2024)).

% @attr sundance_sale_price_usd
% @type numeric
% @canonical false
% @original_name Sundance Ski Shop sale price (USD)
% @unit USD
% @values v220_00=220.0 unk_sundance_sale_price_usd=Unknown
% @importance 0.85

0.55::acc(s14, sundance_sale_price_usd).

0.53::true_val(sundance_sale_price_usd, v220_00); 0.47::true_val(sundance_sale_price_usd, unk_sundance_sale_price_usd).

measured(s14, sundance_sale_price_usd, v220_00).

all_consistent(sundance_sale_price_usd) :-
    consistent(s14, sundance_sale_price_usd).

evidence(all_consistent(sundance_sale_price_usd)).
query(true_val(sundance_sale_price_usd, v220_00)).
query(true_val(sundance_sale_price_usd, unk_sundance_sale_price_usd)).

% @attr mount_everest_price_2024
% @type numeric
% @canonical false
% @original_name Mount Everest price (USD, 2024)
% @unit USD
% @values v332_96=332.96 unk_mount_everest_price_2024=Unknown
% @importance 0.85

0.60::acc(s15, mount_everest_price_2024).

0.53::true_val(mount_everest_price_2024, v332_96); 0.47::true_val(mount_everest_price_2024, unk_mount_everest_price_2024).

measured(s15, mount_everest_price_2024, v332_96).

all_consistent(mount_everest_price_2024) :-
    consistent(s15, mount_everest_price_2024).

evidence(all_consistent(mount_everest_price_2024)).
query(true_val(mount_everest_price_2024, v332_96)).
query(true_val(mount_everest_price_2024, unk_mount_everest_price_2024)).

% @attr curated_price_2024
% @type numeric
% @canonical false
% @original_name Curated price (2024 model)
% @unit USD
% @values v332_45=332.45 unk_curated_price_2024=Unknown
% @importance 0.85

0.65::acc(s12, curated_price_2024).

0.66::true_val(curated_price_2024, v332_45); 0.34::true_val(curated_price_2024, unk_curated_price_2024).

measured(s12, curated_price_2024, v332_45).

all_consistent(curated_price_2024) :-
    consistent(s12, curated_price_2024).

evidence(all_consistent(curated_price_2024)).
query(true_val(curated_price_2024, v332_45)).
query(true_val(curated_price_2024, unk_curated_price_2024)).

% @attr snowboards_com_price
% @type numeric
% @canonical false
% @original_name Snowboards.com price (current model)
% @unit USD
% @values v319_96s=319.96 unk_snowboards_com_price=Unknown
% @importance 0.85

0.68::acc(s16, snowboards_com_price).

0.65::true_val(snowboards_com_price, v319_96s); 0.35::true_val(snowboards_com_price, unk_snowboards_com_price).

measured(s16, snowboards_com_price, v319_96s).

all_consistent(snowboards_com_price) :-
    consistent(s16, snowboards_com_price).

evidence(all_consistent(snowboards_com_price)).
query(true_val(snowboards_com_price, v319_96s)).
query(true_val(snowboards_com_price, unk_snowboards_com_price)).

% @attr snowboard_travel_guide_price
% @type numeric
% @canonical false
% @original_name Snowboard Travel Guide price claim
% @unit USD
% @values v480=480.0 unk_snowboard_travel_guide_price=Unknown
% @importance 0.85

0.10::acc(s17, snowboard_travel_guide_price).

0.06::true_val(snowboard_travel_guide_price, v480); 0.94::true_val(snowboard_travel_guide_price, unk_snowboard_travel_guide_price).

measured(s17, snowboard_travel_guide_price, v480).

all_consistent(snowboard_travel_guide_price) :-
    consistent(s17, snowboard_travel_guide_price).

evidence(all_consistent(snowboard_travel_guide_price)).
query(true_val(snowboard_travel_guide_price, v480)).
query(true_val(snowboard_travel_guide_price, unk_snowboard_travel_guide_price)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v2=2.0 v3=3.0
% @importance 0.80

0.88::acc(s_m, flex_rating_10).
0.72::acc(s18, flex_rating_10).
0.68::acc(s19, flex_rating_10).

0.72::true_val(flex_rating_10, v2); 0.28::true_val(flex_rating_10, v3).

measured(s_m, flex_rating_10, v2).
measured(s18, flex_rating_10, v2).
measured(s19, flex_rating_10, v3).

all_consistent(flex_rating_10) :-
    (indep(s_m), consistent(s_m, flex_rating_10) ; \+indep(s_m)),
    consistent(s18, flex_rating_10),
    consistent(s19, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v2)).
query(true_val(flex_rating_10, v3)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values soft=Soft unk_flex_feel=Unknown
% @importance 0.80

0.85::acc(s2, flex_feel).
0.68::acc(s21, flex_feel).

0.95::true_val(flex_feel, soft); 0.05::true_val(flex_feel, unk_flex_feel).

measured(s2, flex_feel, soft).
measured(s21, flex_feel, soft).

all_consistent(flex_feel) :-
    (indep(s2), consistent(s2, flex_feel) ; \+indep(s2)),
    (indep(s21), consistent(s21, flex_feel) ; \+indep(s21)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, soft)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values beginner_intermediate_advanced_freestyle=Beginner_Intermediate_and_advanced_freestyle unk_skill_level_recommendation=Unknown
% @importance 0.825

0.68::acc(s21, skill_level_recommendation).
0.80::acc(s2, skill_level_recommendation).

0.95::true_val(skill_level_recommendation, beginner_intermediate_advanced_freestyle); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s21, skill_level_recommendation, beginner_intermediate_advanced_freestyle).
measured(s2, skill_level_recommendation, beginner_intermediate_advanced_freestyle).

all_consistent(skill_level_recommendation) :-
    (indep(s21), consistent(s21, skill_level_recommendation) ; \+indep(s21)),
    (indep(s2), consistent(s2, skill_level_recommendation) ; \+indep(s2)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, beginner_intermediate_advanced_freestyle)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values directional_flex=Directional_flex_power_in_nose unk_flex_direction=Unknown
% @importance 1.0

0.92::acc(s1, flex_direction).

0.90::true_val(flex_direction, directional_flex); 0.10::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, directional_flex).

all_consistent(flex_direction) :-
    consistent(s1, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.925

0.95::acc(s1, shape).
0.82::acc(s2, shape).

0.97::true_val(shape, directional_twin); 0.03::true_val(shape, unk_shape).

measured(s1, shape, directional_twin).
measured(s2, shape, directional_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s2), consistent(s2, shape) ; \+indep(s2)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values twin_freestyle_directional_flex_setback=Twin_shape_freestyle_directional_flex_setback unk_shape_description=Unknown
% @importance 0.70

0.62::acc(s22, shape_description).

0.56::true_val(shape_description, twin_freestyle_directional_flex_setback); 0.44::true_val(shape_description, unk_shape_description).

measured(s22, shape_description, twin_freestyle_directional_flex_setback).

all_consistent(shape_description) :-
    (indep(s22), consistent(s22, shape_description) ; \+indep(s22)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, twin_freestyle_directional_flex_setback)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values flat_out_camber=Flat_Out_Camber unk_camber_type=Unknown
% @importance 0.925

0.95::acc(s1, camber_type).
0.82::acc(s2, camber_type).

0.97::true_val(camber_type, flat_out_camber); 0.03::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, flat_out_camber).
measured(s2, camber_type, flat_out_camber).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s2), consistent(s2, camber_type) ; \+indep(s2)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, flat_out_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values flat_camber_underfoot_stability=Flat_profile_camber_underfoot_max_stability_response unk_camber_description=Unknown
% @importance 1.0

0.92::acc(s1, camber_description).

0.90::true_val(camber_description, flat_camber_underfoot_stability); 0.10::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, flat_camber_underfoot_stability).

all_consistent(camber_description) :-
    consistent(s1, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, flat_camber_underfoot_stability)).
query(true_val(camber_description, unk_camber_description)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values radial=Radial unk_sidecut_type=Unknown
% @importance 0.85

0.94::acc(s1, sidecut_type).
0.62::acc(s22, sidecut_type).

0.96::true_val(sidecut_type, radial); 0.04::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, radial).
measured(s22, sidecut_type, radial).

all_consistent(sidecut_type) :-
    consistent(s1, sidecut_type),
    (indep(s22), consistent(s22, sidecut_type) ; \+indep(s22)).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, radial)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_description
% @type categorical
% @canonical false
% @original_name Sidecut description
% @values perfect_circle_classic_consistent=Perfect_circle_classic_sidecut_consistent_response unk_sidecut_description=Unknown
% @importance 0.70

0.62::acc(s22, sidecut_description).

0.56::true_val(sidecut_description, perfect_circle_classic_consistent); 0.44::true_val(sidecut_description, unk_sidecut_description).

measured(s22, sidecut_description, perfect_circle_classic_consistent).

all_consistent(sidecut_description) :-
    (indep(s22), consistent(s22, sidecut_description) ; \+indep(s22)).

evidence(all_consistent(sidecut_description)).
query(true_val(sidecut_description, perfect_circle_classic_consistent)).
query(true_val(sidecut_description, unk_sidecut_description)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values aspen_birch_inserts=Full_length_Aspen_with_birch_stripes unk_core_material=Unknown
% @importance 0.875

0.94::acc(s1, core_material).
0.68::acc(s21, core_material).

0.96::true_val(core_material, aspen_birch_inserts); 0.04::true_val(core_material, unk_core_material).

measured(s1, core_material, aspen_birch_inserts).
measured(s21, core_material, aspen_birch_inserts).

all_consistent(core_material) :-
    consistent(s1, core_material),
    (indep(s21), consistent(s21, core_material) ; \+indep(s21)).

evidence(all_consistent(core_material)).
query(true_val(core_material, aspen_birch_inserts)).
query(true_val(core_material, unk_core_material)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_aspen=FSC_Certified_Aspen_wood_core unk_sustainability_certification=Unknown
% @importance 0.75

0.68::acc(s21, sustainability_certification).

0.66::true_val(sustainability_certification, fsc_certified_aspen); 0.34::true_val(sustainability_certification, unk_sustainability_certification).

measured(s21, sustainability_certification, fsc_certified_aspen).

all_consistent(sustainability_certification) :-
    (indep(s21), consistent(s21, sustainability_certification) ; \+indep(s21)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_aspen)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values biax_ld_fiberglass=BIAX_LD_fiberglass_BA_LD_Glass unk_laminate=Unknown
% @importance 0.85

0.94::acc(s1, laminate).
0.62::acc(s24, laminate).

0.96::true_val(laminate, biax_ld_fiberglass); 0.04::true_val(laminate, unk_laminate).

measured(s1, laminate, biax_ld_fiberglass).
measured(s24, laminate, biax_ld_fiberglass).

all_consistent(laminate) :-
    consistent(s1, laminate),
    (indep(s24), consistent(s24, laminate) ; \+indep(s24)).

evidence(all_consistent(laminate)).
query(true_val(laminate, biax_ld_fiberglass)).
query(true_val(laminate, unk_laminate)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values abs=ABS_Acrylonitrile_Butadiene_Styrene unk_sidewall_material=Unknown
% @importance 0.70

0.68::acc(s21, sidewall_material).

0.66::true_val(sidewall_material, abs); 0.34::true_val(sidewall_material, unk_sidewall_material).

measured(s21, sidewall_material, abs).

all_consistent(sidewall_material) :-
    (indep(s21), consistent(s21, sidewall_material) ; \+indep(s21)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_description
% @type categorical
% @canonical false
% @original_name Sidewall description
% @values concrete_rubber_toughness_dampening=Toughness_energy_transfer_dampening unk_sidewall_description=Unknown
% @importance 0.65

0.65::acc(s25, sidewall_description).

0.57::true_val(sidewall_description, concrete_rubber_toughness_dampening); 0.43::true_val(sidewall_description, unk_sidewall_description).

measured(s25, sidewall_description, concrete_rubber_toughness_dampening).

all_consistent(sidewall_description) :-
    (indep(s21), consistent(s21, sidewall_description) ; \+indep(s21)).

evidence(all_consistent(sidewall_description)).
query(true_val(sidewall_description, concrete_rubber_toughness_dampening)).
query(true_val(sidewall_description, unk_sidewall_description)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values extruded=Extruded unk_base_material=Unknown
% @importance 1.0

0.95::acc(s1, base_material).

0.93::true_val(base_material, extruded); 0.07::true_val(base_material, unk_base_material).

measured(s1, base_material, extruded).

all_consistent(base_material) :-
    consistent(s1, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, extruded)).
query(true_val(base_material, unk_base_material)).

% @attr base_description
% @type categorical
% @canonical false
% @original_name Base description
% @values long_lasting_glide_low_maintenance=Long_lasting_glide_low_maintenance unk_base_description=Unknown
% @importance 1.0

0.88::acc(s1, base_description).

0.86::true_val(base_description, long_lasting_glide_low_maintenance); 0.14::true_val(base_description, unk_base_description).

measured(s1, base_description, long_lasting_glide_low_maintenance).

all_consistent(base_description) :-
    consistent(s1, base_description).

evidence(all_consistent(base_description)).
query(true_val(base_description, long_lasting_glide_low_maintenance)).
query(true_val(base_description, unk_base_description)).

% @attr base_type
% @type categorical
% @canonical false
% @original_name base_type
% @values standard_stone_finish=Standard_Stone_Finish_extruded unk_base_type=Unknown
% @importance 0.825

0.92::acc(s1, base_type).
0.65::acc(s25, base_type).

0.95::true_val(base_type, standard_stone_finish); 0.05::true_val(base_type, unk_base_type).

measured(s1, base_type, standard_stone_finish).
measured(s25, base_type, standard_stone_finish).

all_consistent(base_type) :-
    consistent(s1, base_type),
    (indep(s21), consistent(s21, base_type) ; \+indep(s21)).

evidence(all_consistent(base_type)).
query(true_val(base_type, standard_stone_finish)).
query(true_val(base_type, unk_base_type)).

% @attr sustainability_certification_2
% @type categorical
% @canonical false
% @original_name sustainability_certification (Natural wax)
% @values natural_wax_paraffin_free=Natural_wax_paraffin_free_non_pollutant unk_sustainability_certification_2=Unknown
% @importance 1.0

0.90::acc(s1, sustainability_certification_2).

0.88::true_val(sustainability_certification_2, natural_wax_paraffin_free); 0.12::true_val(sustainability_certification_2, unk_sustainability_certification_2).

measured(s1, sustainability_certification_2, natural_wax_paraffin_free).

all_consistent(sustainability_certification_2) :-
    consistent(s1, sustainability_certification_2).

evidence(all_consistent(sustainability_certification_2)).
query(true_val(sustainability_certification_2, natural_wax_paraffin_free)).
query(true_val(sustainability_certification_2, unk_sustainability_certification_2)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values uv_protected_gloss=UV_Protected_Gloss unk_topsheet=Unknown
% @importance 0.55

0.62::acc(s26, topsheet).

0.58::true_val(topsheet, uv_protected_gloss); 0.42::true_val(topsheet, unk_topsheet).

measured(s26, topsheet, uv_protected_gloss).

all_consistent(topsheet) :-
    (indep(s24), consistent(s24, topsheet) ; \+indep(s24)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, uv_protected_gloss)).
query(true_val(topsheet, unk_topsheet)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values bite_free_edges=Bite_Free_Edges unk_edge_technology=Unknown
% @importance 1.0

0.94::acc(s1, edge_technology).

0.92::true_val(edge_technology, bite_free_edges); 0.08::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, bite_free_edges).

all_consistent(edge_technology) :-
    consistent(s1, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, bite_free_edges)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_description
% @type categorical
% @canonical false
% @original_name Edge description
% @values fully_detuned_tip_to_tail=Fully_detuned_tip_to_tail_forgiving unk_edge_description=Unknown
% @importance 1.0

0.90::acc(s1, edge_description).

0.88::true_val(edge_description, fully_detuned_tip_to_tail); 0.12::true_val(edge_description, unk_edge_description).

measured(s1, edge_description, fully_detuned_tip_to_tail).

all_consistent(edge_description) :-
    consistent(s1, edge_description).

evidence(all_consistent(edge_description)).
query(true_val(edge_description, fully_detuned_tip_to_tail)).
query(true_val(edge_description, unk_edge_description)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_4x2=4x2_Inserts unk_mounting_pattern=Unknown
% @importance 0.925

0.94::acc(s1, mounting_pattern).
0.90::acc(s_m, mounting_pattern).

0.97::true_val(mounting_pattern, inserts_4x2); 0.03::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_4x2).
measured(s_m, mounting_pattern, inserts_4x2).

all_consistent(mounting_pattern) :-
    consistent(s1, mounting_pattern),
    (indep(s_m), consistent(s_m, mounting_pattern) ; \+indep(s_m)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_4x2)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values sizes_142_to_163_158w_162w=142_145_149_152_156_160_163_158W_162W unk_available_sizes=Unknown
% @importance 0.925

0.94::acc(s1, available_sizes).
0.90::acc(s_m, available_sizes).

0.97::true_val(available_sizes, sizes_142_to_163_158w_162w); 0.03::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, sizes_142_to_163_158w_162w).
measured(s_m, available_sizes, sizes_142_to_163_158w_162w).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes),
    (indep(s_m), consistent(s_m, available_sizes) ; \+indep(s_m)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, sizes_142_to_163_158w_162w)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values regular_wide=Regular_and_Wide unk_width_options=Unknown
% @importance 1.0

0.94::acc(s1, width_options).

0.92::true_val(width_options, regular_wide); 0.08::true_val(width_options, unk_width_options).

measured(s1, width_options, regular_wide).

all_consistent(width_options) :-
    consistent(s1, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, regular_wide)).
query(true_val(width_options, unk_width_options)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v6_5=6.5
% @importance 1.0

0.95::acc(s1, sidecut_radius_size).

0.93::true_val(sidecut_radius_size, v6_5); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v6_5).

all_consistent(sidecut_radius_size) :-
    consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v6_5)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr waist_width_142
% @type numeric
% @canonical false
% @original_name Waist width (142cm)
% @unit mm
% @values v239=239.0 unk_waist_width_142=Unknown
% @importance 0.925

0.95::acc(s1, waist_width_142).
0.90::acc(s_m, waist_width_142).

0.97::true_val(waist_width_142, v239); 0.03::true_val(waist_width_142, unk_waist_width_142).

measured(s1, waist_width_142, v239).
measured(s_m, waist_width_142, v239).

all_consistent(waist_width_142) :-
    consistent(s1, waist_width_142),
    (indep(s_m), consistent(s_m, waist_width_142) ; \+indep(s_m)).

evidence(all_consistent(waist_width_142)).
query(true_val(waist_width_142, v239)).
query(true_val(waist_width_142, unk_waist_width_142)).

% @attr tip_tail_width_size_142
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (142cm)
% @unit mm
% @values v283=283.0 unk_tip_tail_width_size_142=Unknown
% @importance 1.0

0.95::acc(s1, tip_tail_width_size_142).

0.93::true_val(tip_tail_width_size_142, v283); 0.07::true_val(tip_tail_width_size_142, unk_tip_tail_width_size_142).

measured(s1, tip_tail_width_size_142, v283).

all_consistent(tip_tail_width_size_142) :-
    consistent(s1, tip_tail_width_size_142).

evidence(all_consistent(tip_tail_width_size_142)).
query(true_val(tip_tail_width_size_142, v283)).
query(true_val(tip_tail_width_size_142, unk_tip_tail_width_size_142)).

% @attr effective_edge_142
% @type numeric
% @canonical false
% @original_name Effective edge (142cm)
% @unit cm
% @values v106_5=106.5 unk_effective_edge_142=Unknown
% @importance 0.85

0.90::acc(s_m, effective_edge_142).

0.88::true_val(effective_edge_142, v106_5); 0.12::true_val(effective_edge_142, unk_effective_edge_142).

measured(s_m, effective_edge_142, v106_5).

all_consistent(effective_edge_142) :-
    (indep(s_m), consistent(s_m, effective_edge_142) ; \+indep(s_m)).

evidence(all_consistent(effective_edge_142)).
query(true_val(effective_edge_142, v106_5)).
query(true_val(effective_edge_142, unk_effective_edge_142)).

% @attr board_weight_grams
% @type numeric
% @canonical true
% @original_name board_weight_grams
% @unit g
% @values v2350=2350.0 unk_board_weight_grams=Unknown
% @importance 1.0

0.93::acc(s1, board_weight_grams).

0.91::true_val(board_weight_grams, v2350); 0.09::true_val(board_weight_grams, unk_board_weight_grams).

measured(s1, board_weight_grams, v2350).

all_consistent(board_weight_grams) :-
    consistent(s1, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, v2350)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr recommended_binding_size_142
% @type categorical
% @canonical false
% @original_name Recommended binding size (142cm)
% @values s_m_binding=S/M unk_recommended_binding_size_142=Unknown
% @importance 1.0

0.93::acc(s1, recommended_binding_size_142).

0.91::true_val(recommended_binding_size_142, s_m_binding); 0.09::true_val(recommended_binding_size_142, unk_recommended_binding_size_142).

measured(s1, recommended_binding_size_142, s_m_binding).

all_consistent(recommended_binding_size_142) :-
    consistent(s1, recommended_binding_size_142).

evidence(all_consistent(recommended_binding_size_142)).
query(true_val(recommended_binding_size_142, s_m_binding)).
query(true_val(recommended_binding_size_142, unk_recommended_binding_size_142)).

% @attr recommended_weight_range_size_142
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (142cm)
% @unit kg
% @values w35_55=35-55kg unk_recommended_weight_range_size_142=Unknown
% @importance 0.925

0.94::acc(s1, recommended_weight_range_size_142).
0.90::acc(s_m, recommended_weight_range_size_142).

0.97::true_val(recommended_weight_range_size_142, w35_55); 0.03::true_val(recommended_weight_range_size_142, unk_recommended_weight_range_size_142).

measured(s1, recommended_weight_range_size_142, w35_55).
measured(s_m, recommended_weight_range_size_142, w35_55).

all_consistent(recommended_weight_range_size_142) :-
    consistent(s1, recommended_weight_range_size_142),
    (indep(s_m), consistent(s_m, recommended_weight_range_size_142) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size_142)).
query(true_val(recommended_weight_range_size_142, w35_55)).
query(true_val(recommended_weight_range_size_142, unk_recommended_weight_range_size_142)).

% @attr waist_width_145
% @type numeric
% @canonical false
% @original_name Waist width (145cm)
% @unit mm
% @values v243=243.0 unk_waist_width_145=Unknown
% @importance 0.85

0.90::acc(s_m, waist_width_145).

0.88::true_val(waist_width_145, v243); 0.12::true_val(waist_width_145, unk_waist_width_145).

measured(s_m, waist_width_145, v243).

all_consistent(waist_width_145) :-
    (indep(s_m), consistent(s_m, waist_width_145) ; \+indep(s_m)).

evidence(all_consistent(waist_width_145)).
query(true_val(waist_width_145, v243)).
query(true_val(waist_width_145, unk_waist_width_145)).

% @attr effective_edge_145
% @type numeric
% @canonical false
% @original_name Effective edge (145cm)
% @unit cm
% @values v110=110.0 unk_effective_edge_145=Unknown
% @importance 0.85

0.90::acc(s_m, effective_edge_145).

0.88::true_val(effective_edge_145, v110); 0.12::true_val(effective_edge_145, unk_effective_edge_145).

measured(s_m, effective_edge_145, v110).

all_consistent(effective_edge_145) :-
    (indep(s_m), consistent(s_m, effective_edge_145) ; \+indep(s_m)).

evidence(all_consistent(effective_edge_145)).
query(true_val(effective_edge_145, v110)).
query(true_val(effective_edge_145, unk_effective_edge_145)).

% @attr tip_tail_width_size_145
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (145cm)
% @unit mm
% @values v288=288.0 unk_tip_tail_width_size_145=Unknown
% @importance 0.85

0.90::acc(s_m, tip_tail_width_size_145).

0.88::true_val(tip_tail_width_size_145, v288); 0.12::true_val(tip_tail_width_size_145, unk_tip_tail_width_size_145).

measured(s_m, tip_tail_width_size_145, v288).

all_consistent(tip_tail_width_size_145) :-
    (indep(s_m), consistent(s_m, tip_tail_width_size_145) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size_145)).
query(true_val(tip_tail_width_size_145, v288)).
query(true_val(tip_tail_width_size_145, unk_tip_tail_width_size_145)).

% @attr recommended_weight_range_size_145
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (145cm)
% @unit kg
% @values w40_60=40-60kg unk_recommended_weight_range_size_145=Unknown
% @importance 0.85

0.90::acc(s_m, recommended_weight_range_size_145).

0.88::true_val(recommended_weight_range_size_145, w40_60); 0.12::true_val(recommended_weight_range_size_145, unk_recommended_weight_range_size_145).

measured(s_m, recommended_weight_range_size_145, w40_60).

all_consistent(recommended_weight_range_size_145) :-
    (indep(s_m), consistent(s_m, recommended_weight_range_size_145) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size_145)).
query(true_val(recommended_weight_range_size_145, w40_60)).
query(true_val(recommended_weight_range_size_145, unk_recommended_weight_range_size_145)).

% @attr waist_width_149
% @type numeric
% @canonical false
% @original_name Waist width (149cm)
% @unit mm
% @values v244=244.0 unk_waist_width_149=Unknown
% @importance 0.85

0.90::acc(s_m, waist_width_149).

0.88::true_val(waist_width_149, v244); 0.12::true_val(waist_width_149, unk_waist_width_149).

measured(s_m, waist_width_149, v244).

all_consistent(waist_width_149) :-
    (indep(s_m), consistent(s_m, waist_width_149) ; \+indep(s_m)).

evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v244)).
query(true_val(waist_width_149, unk_waist_width_149)).

% @attr effective_edge_149
% @type numeric
% @canonical false
% @original_name Effective edge (149cm)
% @unit cm
% @values v113=113.0 unk_effective_edge_149=Unknown
% @importance 0.85

0.90::acc(s_m, effective_edge_149).

0.88::true_val(effective_edge_149, v113); 0.12::true_val(effective_edge_149, unk_effective_edge_149).

measured(s_m, effective_edge_149, v113).

all_consistent(effective_edge_149) :-
    (indep(s_m), consistent(s_m, effective_edge_149) ; \+indep(s_m)).

evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v113)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

% @attr tip_tail_width_size_149
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (149cm)
% @unit mm
% @values v290=290.0 unk_tip_tail_width_size_149=Unknown
% @importance 0.85

0.90::acc(s_m, tip_tail_width_size_149).

0.88::true_val(tip_tail_width_size_149, v290); 0.12::true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149).

measured(s_m, tip_tail_width_size_149, v290).

all_consistent(tip_tail_width_size_149) :-
    (indep(s_m), consistent(s_m, tip_tail_width_size_149) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size_149)).
query(true_val(tip_tail_width_size_149, v290)).
query(true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149)).

% @attr recommended_weight_range_size_149
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (149cm)
% @unit kg
% @values w50_65=50-65kg unk_recommended_weight_range_size_149=Unknown
% @importance 0.85

0.90::acc(s_m, recommended_weight_range_size_149).

0.88::true_val(recommended_weight_range_size_149, w50_65); 0.12::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).

measured(s_m, recommended_weight_range_size_149, w50_65).

all_consistent(recommended_weight_range_size_149) :-
    (indep(s_m), consistent(s_m, recommended_weight_range_size_149) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, w50_65)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

% @attr waist_width_152
% @type numeric
% @canonical false
% @original_name Waist width (152cm)
% @unit mm
% @values v247=247.0 unk_waist_width_152=Unknown
% @importance 0.85

0.90::acc(s_m, waist_width_152).

0.88::true_val(waist_width_152, v247); 0.12::true_val(waist_width_152, unk_waist_width_152).

measured(s_m, waist_width_152, v247).

all_consistent(waist_width_152) :-
    (indep(s_m), consistent(s_m, waist_width_152) ; \+indep(s_m)).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v247)).
query(true_val(waist_width_152, unk_waist_width_152)).

% @attr effective_edge_152
% @type numeric
% @canonical false
% @original_name Effective edge (152cm)
% @unit cm
% @values v114_5=114.5 unk_effective_edge_152=Unknown
% @importance 0.85

0.90::acc(s_m, effective_edge_152).

0.88::true_val(effective_edge_152, v114_5); 0.12::true_val(effective_edge_152, unk_effective_edge_152).

measured(s_m, effective_edge_152, v114_5).

all_consistent(effective_edge_152) :-
    (indep(s_m), consistent(s_m, effective_edge_152) ; \+indep(s_m)).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v114_5)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

% @attr tip_tail_width_size_152
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (152cm)
% @unit mm
% @values v292=292.0 unk_tip_tail_width_size_152=Unknown
% @importance 0.85

0.90::acc(s_m, tip_tail_width_size_152).

0.88::true_val(tip_tail_width_size_152, v292); 0.12::true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152).

measured(s_m, tip_tail_width_size_152, v292).

all_consistent(tip_tail_width_size_152) :-
    (indep(s_m), consistent(s_m, tip_tail_width_size_152) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, v292)).
query(true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152)).

% @attr recommended_weight_range_size_152
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (152cm)
% @unit kg
% @values w52_70=52-70kg unk_recommended_weight_range_size_152=Unknown
% @importance 0.85

0.90::acc(s_m, recommended_weight_range_size_152).

0.88::true_val(recommended_weight_range_size_152, w52_70); 0.12::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(s_m, recommended_weight_range_size_152, w52_70).

all_consistent(recommended_weight_range_size_152) :-
    (indep(s_m), consistent(s_m, recommended_weight_range_size_152) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, w52_70)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name Waist width (156cm)
% @unit mm
% @values v251=251.0 unk_waist_width_156=Unknown
% @importance 0.85

0.90::acc(s_m, waist_width_156).

0.88::true_val(waist_width_156, v251); 0.12::true_val(waist_width_156, unk_waist_width_156).

measured(s_m, waist_width_156, v251).

all_consistent(waist_width_156) :-
    (indep(s_m), consistent(s_m, waist_width_156) ; \+indep(s_m)).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v251)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr effective_edge_156
% @type numeric
% @canonical false
% @original_name Effective edge (156cm)
% @unit cm
% @values v117_5=117.5 unk_effective_edge_156=Unknown
% @importance 0.85

0.90::acc(s_m, effective_edge_156).

0.88::true_val(effective_edge_156, v117_5); 0.12::true_val(effective_edge_156, unk_effective_edge_156).

measured(s_m, effective_edge_156, v117_5).

all_consistent(effective_edge_156) :-
    (indep(s_m), consistent(s_m, effective_edge_156) ; \+indep(s_m)).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v117_5)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size (156cm)
% @unit mm
% @values v296=296.0 unk_tip_tail_width_size=Unknown
% @importance 0.85

0.90::acc(s_m, tip_tail_width_size).

0.88::true_val(tip_tail_width_size, v296); 0.12::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s_m, tip_tail_width_size, v296).

all_consistent(tip_tail_width_size) :-
    (indep(s_m), consistent(s_m, tip_tail_width_size) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v296)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (156cm)
% @unit kg
% @values w55_75=55-75kg unk_recommended_weight_range_size=Unknown
% @importance 0.85

0.90::acc(s_m, recommended_weight_range_size).

0.88::true_val(recommended_weight_range_size, w55_75); 0.12::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s_m, recommended_weight_range_size, w55_75).

all_consistent(recommended_weight_range_size) :-
    (indep(s_m), consistent(s_m, recommended_weight_range_size) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w55_75)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr waist_width_160
% @type numeric
% @canonical false
% @original_name Waist width (160cm)
% @unit mm
% @values v256=256.0 unk_waist_width_160=Unknown
% @importance 0.85

0.90::acc(s_m, waist_width_160).

0.88::true_val(waist_width_160, v256); 0.12::true_val(waist_width_160, unk_waist_width_160).

measured(s_m, waist_width_160, v256).

all_consistent(waist_width_160) :-
    (indep(s_m), consistent(s_m, waist_width_160) ; \+indep(s_m)).

evidence(all_consistent(waist_width_160)).
query(true_val(waist_width_160, v256)).
query(true_val(waist_width_160, unk_waist_width_160)).

% @attr effective_edge_160
% @type numeric
% @canonical false
% @original_name Effective edge (160cm)
% @unit cm
% @values v121=121.0 unk_effective_edge_160=Unknown
% @importance 0.85

0.90::acc(s_m, effective_edge_160).

0.88::true_val(effective_edge_160, v121); 0.12::true_val(effective_edge_160, unk_effective_edge_160).

measured(s_m, effective_edge_160, v121).

all_consistent(effective_edge_160) :-
    (indep(s_m), consistent(s_m, effective_edge_160) ; \+indep(s_m)).

evidence(all_consistent(effective_edge_160)).
query(true_val(effective_edge_160, v121)).
query(true_val(effective_edge_160, unk_effective_edge_160)).

% @attr tip_tail_width_size_160
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (160cm)
% @unit mm
% @values v300=300.0 unk_tip_tail_width_size_160=Unknown
% @importance 0.85

0.90::acc(s_m, tip_tail_width_size_160).

0.88::true_val(tip_tail_width_size_160, v300); 0.12::true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160).

measured(s_m, tip_tail_width_size_160, v300).

all_consistent(tip_tail_width_size_160) :-
    (indep(s_m), consistent(s_m, tip_tail_width_size_160) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size_160)).
query(true_val(tip_tail_width_size_160, v300)).
query(true_val(tip_tail_width_size_160, unk_tip_tail_width_size_160)).

% @attr recommended_weight_range_size_160
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (160cm)
% @unit kg
% @values w60_90=60-90kg unk_recommended_weight_range_size_160=Unknown
% @importance 0.85

0.90::acc(s_m, recommended_weight_range_size_160).

0.88::true_val(recommended_weight_range_size_160, w60_90); 0.12::true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160).

measured(s_m, recommended_weight_range_size_160, w60_90).

all_consistent(recommended_weight_range_size_160) :-
    (indep(s_m), consistent(s_m, recommended_weight_range_size_160) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size_160)).
query(true_val(recommended_weight_range_size_160, w60_90)).
query(true_val(recommended_weight_range_size_160, unk_recommended_weight_range_size_160)).

% @attr waist_width_163
% @type numeric
% @canonical false
% @original_name Waist width (163cm)
% @unit mm
% @values v259=259.0 unk_waist_width_163=Unknown
% @importance 0.85

0.90::acc(s_m, waist_width_163).

0.88::true_val(waist_width_163, v259); 0.12::true_val(waist_width_163, unk_waist_width_163).

measured(s_m, waist_width_163, v259).

all_consistent(waist_width_163) :-
    (indep(s_m), consistent(s_m, waist_width_163) ; \+indep(s_m)).

evidence(all_consistent(waist_width_163)).
query(true_val(waist_width_163, v259)).
query(true_val(waist_width_163, unk_waist_width_163)).

% @attr effective_edge_163
% @type numeric
% @canonical false
% @original_name Effective edge (163cm)
% @unit cm
% @values v123=123.0 unk_effective_edge_163=Unknown
% @importance 0.85

0.90::acc(s_m, effective_edge_163).

0.88::true_val(effective_edge_163, v123); 0.12::true_val(effective_edge_163, unk_effective_edge_163).

measured(s_m, effective_edge_163, v123).

all_consistent(effective_edge_163) :-
    (indep(s_m), consistent(s_m, effective_edge_163) ; \+indep(s_m)).

evidence(all_consistent(effective_edge_163)).
query(true_val(effective_edge_163, v123)).
query(true_val(effective_edge_163, unk_effective_edge_163)).

% @attr tip_tail_width_size_163
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (163cm)
% @unit mm
% @values v303=303.0 unk_tip_tail_width_size_163=Unknown
% @importance 0.85

0.90::acc(s_m, tip_tail_width_size_163).

0.88::true_val(tip_tail_width_size_163, v303); 0.12::true_val(tip_tail_width_size_163, unk_tip_tail_width_size_163).

measured(s_m, tip_tail_width_size_163, v303).

all_consistent(tip_tail_width_size_163) :-
    (indep(s_m), consistent(s_m, tip_tail_width_size_163) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size_163)).
query(true_val(tip_tail_width_size_163, v303)).
query(true_val(tip_tail_width_size_163, unk_tip_tail_width_size_163)).

% @attr recommended_weight_range_size_163
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (163cm)
% @unit kg
% @values w65_plus=65+kg unk_recommended_weight_range_size_163=Unknown
% @importance 0.85

0.90::acc(s_m, recommended_weight_range_size_163).

0.88::true_val(recommended_weight_range_size_163, w65_plus); 0.12::true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163).

measured(s_m, recommended_weight_range_size_163, w65_plus).

all_consistent(recommended_weight_range_size_163) :-
    (indep(s_m), consistent(s_m, recommended_weight_range_size_163) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size_163)).
query(true_val(recommended_weight_range_size_163, w65_plus)).
query(true_val(recommended_weight_range_size_163, unk_recommended_weight_range_size_163)).

% @attr waist_width_158w
% @type numeric
% @canonical false
% @original_name Waist width (158cm Wide)
% @unit mm
% @values v260=260.0 unk_waist_width_158w=Unknown
% @importance 0.85

0.90::acc(s_m, waist_width_158w).

0.88::true_val(waist_width_158w, v260); 0.12::true_val(waist_width_158w, unk_waist_width_158w).

measured(s_m, waist_width_158w, v260).

all_consistent(waist_width_158w) :-
    (indep(s_m), consistent(s_m, waist_width_158w) ; \+indep(s_m)).

evidence(all_consistent(waist_width_158w)).
query(true_val(waist_width_158w, v260)).
query(true_val(waist_width_158w, unk_waist_width_158w)).

% @attr effective_edge_158w
% @type numeric
% @canonical false
% @original_name Effective edge (158cm Wide)
% @unit cm
% @values v119_5=119.5 unk_effective_edge_158w=Unknown
% @importance 0.85

0.90::acc(s_m, effective_edge_158w).

0.88::true_val(effective_edge_158w, v119_5); 0.12::true_val(effective_edge_158w, unk_effective_edge_158w).

measured(s_m, effective_edge_158w, v119_5).

all_consistent(effective_edge_158w) :-
    (indep(s_m), consistent(s_m, effective_edge_158w) ; \+indep(s_m)).

evidence(all_consistent(effective_edge_158w)).
query(true_val(effective_edge_158w, v119_5)).
query(true_val(effective_edge_158w, unk_effective_edge_158w)).

% @attr tip_tail_width_size_158w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (158cm Wide)
% @unit mm
% @values v306=306.0 unk_tip_tail_width_size_158w=Unknown
% @importance 0.85

0.90::acc(s_m, tip_tail_width_size_158w).

0.88::true_val(tip_tail_width_size_158w, v306); 0.12::true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w).

measured(s_m, tip_tail_width_size_158w, v306).

all_consistent(tip_tail_width_size_158w) :-
    (indep(s_m), consistent(s_m, tip_tail_width_size_158w) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size_158w)).
query(true_val(tip_tail_width_size_158w, v306)).
query(true_val(tip_tail_width_size_158w, unk_tip_tail_width_size_158w)).

% @attr recommended_weight_range_size_158w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (158cm Wide)
% @unit kg
% @values w60_plus=60+kg unk_recommended_weight_range_size_158w=Unknown
% @importance 0.85

0.90::acc(s_m, recommended_weight_range_size_158w).

0.88::true_val(recommended_weight_range_size_158w, w60_plus); 0.12::true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w).

measured(s_m, recommended_weight_range_size_158w, w60_plus).

all_consistent(recommended_weight_range_size_158w) :-
    (indep(s_m), consistent(s_m, recommended_weight_range_size_158w) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size_158w)).
query(true_val(recommended_weight_range_size_158w, w60_plus)).
query(true_val(recommended_weight_range_size_158w, unk_recommended_weight_range_size_158w)).

% @attr waist_width_162w
% @type numeric
% @canonical false
% @original_name Waist width (162cm Wide)
% @unit mm
% @values v265=265.0 unk_waist_width_162w=Unknown
% @importance 0.85

0.90::acc(s_m, waist_width_162w).

0.88::true_val(waist_width_162w, v265); 0.12::true_val(waist_width_162w, unk_waist_width_162w).

measured(s_m, waist_width_162w, v265).

all_consistent(waist_width_162w) :-
    (indep(s_m), consistent(s_m, waist_width_162w) ; \+indep(s_m)).

evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v265)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

% @attr effective_edge_162w
% @type numeric
% @canonical false
% @original_name Effective edge (162cm Wide)
% @unit cm
% @values v123_5=123.5 unk_effective_edge_162w=Unknown
% @importance 0.85

0.90::acc(s_m, effective_edge_162w).

0.88::true_val(effective_edge_162w, v123_5); 0.12::true_val(effective_edge_162w, unk_effective_edge_162w).

measured(s_m, effective_edge_162w, v123_5).

all_consistent(effective_edge_162w) :-
    (indep(s_m), consistent(s_m, effective_edge_162w) ; \+indep(s_m)).

evidence(all_consistent(effective_edge_162w)).
query(true_val(effective_edge_162w, v123_5)).
query(true_val(effective_edge_162w, unk_effective_edge_162w)).

% @attr tip_tail_width_size_162w
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (162cm Wide)
% @unit mm
% @values v309=309.0 unk_tip_tail_width_size_162w=Unknown
% @importance 0.85

0.90::acc(s_m, tip_tail_width_size_162w).

0.88::true_val(tip_tail_width_size_162w, v309); 0.12::true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w).

measured(s_m, tip_tail_width_size_162w, v309).

all_consistent(tip_tail_width_size_162w) :-
    (indep(s_m), consistent(s_m, tip_tail_width_size_162w) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size_162w)).
query(true_val(tip_tail_width_size_162w, v309)).
query(true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w)).

% @attr recommended_weight_range_size_162w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (162cm Wide)
% @unit kg
% @values w65_plus_w=65+kg unk_recommended_weight_range_size_162w=Unknown
% @importance 0.85

0.90::acc(s_m, recommended_weight_range_size_162w).

0.88::true_val(recommended_weight_range_size_162w, w65_plus_w); 0.12::true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w).

measured(s_m, recommended_weight_range_size_162w, w65_plus_w).

all_consistent(recommended_weight_range_size_162w) :-
    (indep(s_m), consistent(s_m, recommended_weight_range_size_162w) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, w65_plus_w)).
query(true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner_intermediate=Beginner_Intermediate unk_rider_level=Unknown
% @importance 0.925

0.94::acc(s1, rider_level).
0.82::acc(s2, rider_level).

0.97::true_val(rider_level, beginner_intermediate); 0.03::true_val(rider_level, unk_rider_level).

measured(s1, rider_level, beginner_intermediate).
measured(s2, rider_level, beginner_intermediate).

all_consistent(rider_level) :-
    consistent(s1, rider_level),
    (indep(s2), consistent(s2, rider_level) ; \+indep(s2)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr terrain_suitability_2
% @type categorical
% @canonical false
% @original_name terrain_suitability (All-Mountain detailed)
% @values groomers_powder_park=All-Mountain_groomers_powder_park unk_terrain_suitability_2=Unknown
% @importance 0.80

0.82::acc(s2, terrain_suitability_2).

0.80::true_val(terrain_suitability_2, groomers_powder_park); 0.20::true_val(terrain_suitability_2, unk_terrain_suitability_2).

measured(s2, terrain_suitability_2, groomers_powder_park).

all_consistent(terrain_suitability_2) :-
    (indep(s2), consistent(s2, terrain_suitability_2) ; \+indep(s2)).

evidence(all_consistent(terrain_suitability_2)).
query(true_val(terrain_suitability_2, groomers_powder_park)).
query(true_val(terrain_suitability_2, unk_terrain_suitability_2)).

% @attr terrain_suitability_3
% @type categorical
% @canonical false
% @original_name terrain_suitability (groomed slopes, park, soft snow)
% @values groomed_park_soft_snow=Groomed_slopes_park_soft_snow unk_terrain_suitability_3=Unknown
% @importance 0.75

0.65::acc(s27, terrain_suitability_3).

0.57::true_val(terrain_suitability_3, groomed_park_soft_snow); 0.43::true_val(terrain_suitability_3, unk_terrain_suitability_3).

measured(s27, terrain_suitability_3, groomed_park_soft_snow).

all_consistent(terrain_suitability_3) :-
    consistent(s27, terrain_suitability_3).

evidence(all_consistent(terrain_suitability_3)).
query(true_val(terrain_suitability_3, groomed_park_soft_snow)).
query(true_val(terrain_suitability_3, unk_terrain_suitability_3)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values beginner_progression_park_cruising=Beginner_progression_park_cruising_all_mountain unk_riding_style=Unknown
% @importance 0.85

0.88::acc(s_m, riding_style).
0.82::acc(s2, riding_style).

0.95::true_val(riding_style, beginner_progression_park_cruising); 0.05::true_val(riding_style, unk_riding_style).

measured(s_m, riding_style, beginner_progression_park_cruising).
measured(s2, riding_style, beginner_progression_park_cruising).

all_consistent(riding_style) :-
    (indep(s_m), consistent(s_m, riding_style) ; \+indep(s_m)),
    (indep(s2), consistent(s2, riding_style) ; \+indep(s2)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, beginner_progression_park_cruising)).
query(true_val(riding_style, unk_riding_style)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values consistent_response_forward_switch=Radial_sidecut_consistent_forward_and_switch unk_switch_riding=Unknown
% @importance 0.70

0.62::acc(s22, switch_riding).

0.56::true_val(switch_riding, consistent_response_forward_switch); 0.44::true_val(switch_riding, unk_switch_riding).

measured(s22, switch_riding, consistent_response_forward_switch).

all_consistent(switch_riding) :-
    (indep(s22), consistent(s22, switch_riding) ; \+indep(s22)).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, consistent_response_forward_switch)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr setback
% @type categorical
% @canonical true
% @original_name setback
% @values slight_setback_nose_float=Binding_stance_set_back_slightly_nose_float unk_setback=Unknown
% @importance 0.775

0.62::acc(s22, setback).
0.88::acc(s_m, setback).

0.95::true_val(setback, slight_setback_nose_float); 0.05::true_val(setback, unk_setback).

measured(s22, setback, slight_setback_nose_float).
measured(s_m, setback, slight_setback_nose_float).

all_consistent(setback) :-
    (indep(s22), consistent(s22, setback) ; \+indep(s22)),
    (indep(s_m), consistent(s_m, setback) ; \+indep(s_m)).

evidence(all_consistent(setback)).
query(true_val(setback, slight_setback_nose_float)).
query(true_val(setback, unk_setback)).

% @attr size_range_suitability
% @type categorical
% @canonical false
% @original_name Size range suitability
% @values potentially_unisex_youth=Enough_sizes_potentially_unisex_or_youth unk_size_range_suitability=Unknown
% @importance 0.80

0.78::acc(s28, size_range_suitability).

0.67::true_val(size_range_suitability, potentially_unisex_youth); 0.33::true_val(size_range_suitability, unk_size_range_suitability).

measured(s28, size_range_suitability, potentially_unisex_youth).

all_consistent(size_range_suitability) :-
    consistent(s28, size_range_suitability).

evidence(all_consistent(size_range_suitability)).
query(true_val(size_range_suitability, potentially_unisex_youth)).
query(true_val(size_range_suitability, unk_size_range_suitability)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v2_years=2.0 unk_warranty_period_years=Unknown
% @importance 0.80

0.65::acc(s29, warranty_period_years).
0.93::acc(s30, warranty_period_years).

0.97::true_val(warranty_period_years, v2_years); 0.03::true_val(warranty_period_years, unk_warranty_period_years).

measured(s29, warranty_period_years, v2_years).
measured(s30, warranty_period_years, v2_years).

all_consistent(warranty_period_years) :-
    consistent(s29, warranty_period_years),
    consistent(s30, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2_years)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values authorized_retailer_repair_replace=Valid_from_authorized_retailer_repair_or_replace unk_warranty=Unknown
% @importance 0.80

0.93::acc(s30, warranty).

0.91::true_val(warranty, authorized_retailer_repair_replace); 0.09::true_val(warranty, unk_warranty).

measured(s30, warranty, authorized_retailer_repair_replace).

all_consistent(warranty) :-
    consistent(s30, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, authorized_retailer_repair_replace)).
query(true_val(warranty, unk_warranty)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (Salomon.com)
% @values salomon_direct_399_95_sale_319_96=Salomon.com_direct_$399.95_sale_$319.96 unk_availability_status=Unknown
% @importance 1.0

0.94::acc(s1, availability_status).

0.92::true_val(availability_status, salomon_direct_399_95_sale_319_96); 0.08::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, salomon_direct_399_95_sale_319_96).

all_consistent(availability_status) :-
    consistent(s1, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, salomon_direct_399_95_sale_319_96)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo.com)
% @values evo_in_stock_free_shipping=evo.com_in_stock_free_shipping unk_availability_status_evo=Unknown
% @importance 0.85

0.82::acc(s2, availability_status_evo).

0.77::true_val(availability_status_evo, evo_in_stock_free_shipping); 0.23::true_val(availability_status_evo, unk_availability_status_evo).

measured(s2, availability_status_evo, evo_in_stock_free_shipping).

all_consistent(availability_status_evo) :-
    consistent(s2, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, evo_in_stock_free_shipping)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_the_house
% @type categorical
% @canonical false
% @original_name availability_status (The House)
% @values the_house_258_95_sale=The_House_$258.95_sale_35pct_off unk_availability_status_the_house=Unknown
% @importance 0.90

0.78::acc(s13, availability_status_the_house).

0.74::true_val(availability_status_the_house, the_house_258_95_sale); 0.26::true_val(availability_status_the_house, unk_availability_status_the_house).

measured(s13, availability_status_the_house, the_house_258_95_sale).

all_consistent(availability_status_the_house) :-
    consistent(s13, availability_status_the_house).

evidence(all_consistent(availability_status_the_house)).
query(true_val(availability_status_the_house, the_house_258_95_sale)).
query(true_val(availability_status_the_house, unk_availability_status_the_house)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status (Amazon)
% @values amazon_listed_160cm=Amazon_listed_160cm unk_availability_status_amazon=Unknown
% @importance 0.75

0.65::acc(s31, availability_status_amazon).

0.56::true_val(availability_status_amazon, amazon_listed_160cm); 0.44::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s31, availability_status_amazon, amazon_listed_160cm).

all_consistent(availability_status_amazon) :-
    consistent(s31, availability_status_amazon).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, amazon_listed_160cm)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr availability_status_wiredsport
% @type categorical
% @canonical false
% @original_name availability_status (Wiredsport)
% @values wiredsport_free_shipping_50=Wiredsport_free_shipping_over_$50 unk_availability_status_wiredsport=Unknown
% @importance 0.55

0.62::acc(s26, availability_status_wiredsport).

0.58::true_val(availability_status_wiredsport, wiredsport_free_shipping_50); 0.42::true_val(availability_status_wiredsport, unk_availability_status_wiredsport).

measured(s26, availability_status_wiredsport, wiredsport_free_shipping_50).

all_consistent(availability_status_wiredsport) :-
    consistent(s26, availability_status_wiredsport).

evidence(all_consistent(availability_status_wiredsport)).
query(true_val(availability_status_wiredsport, wiredsport_free_shipping_50)).
query(true_val(availability_status_wiredsport, unk_availability_status_wiredsport)).

% @attr availability_status_blauer_board
% @type categorical
% @canonical false
% @original_name availability_status (Blauer Board Shop)
% @values blauer_board_available=Blauer_Board_Shop_available unk_availability_status_blauer_board=Unknown
% @importance 0.75

0.68::acc(s23, availability_status_blauer_board).

0.66::true_val(availability_status_blauer_board, blauer_board_available); 0.34::true_val(availability_status_blauer_board, unk_availability_status_blauer_board).

measured(s23, availability_status_blauer_board, blauer_board_available).

all_consistent(availability_status_blauer_board) :-
    consistent(s23, availability_status_blauer_board).

evidence(all_consistent(availability_status_blauer_board)).
query(true_val(availability_status_blauer_board, blauer_board_available)).
query(true_val(availability_status_blauer_board, unk_availability_status_blauer_board)).

% @attr availability_status_sundance
% @type categorical
% @canonical false
% @original_name availability_status (Sundance)
% @values sundance_220_sale=Sundance_$220_sale unk_availability_status_sundance=Unknown
% @importance 0.85

0.55::acc(s14, availability_status_sundance).

0.53::true_val(availability_status_sundance, sundance_220_sale); 0.47::true_val(availability_status_sundance, unk_availability_status_sundance).

measured(s14, availability_status_sundance, sundance_220_sale).

all_consistent(availability_status_sundance) :-
    consistent(s14, availability_status_sundance).

evidence(all_consistent(availability_status_sundance)).
query(true_val(availability_status_sundance, sundance_220_sale)).
query(true_val(availability_status_sundance, unk_availability_status_sundance)).

% @attr availability_status_mt_everest
% @type categorical
% @canonical false
% @original_name availability_status (Mount Everest)
% @values mt_everest_332_96=Mount_Everest_$332.96 unk_availability_status_mt_everest=Unknown
% @importance 0.85

0.60::acc(s15, availability_status_mt_everest).

0.53::true_val(availability_status_mt_everest, mt_everest_332_96); 0.47::true_val(availability_status_mt_everest, unk_availability_status_mt_everest).

measured(s15, availability_status_mt_everest, mt_everest_332_96).

all_consistent(availability_status_mt_everest) :-
    consistent(s15, availability_status_mt_everest).

evidence(all_consistent(availability_status_mt_everest)).
query(true_val(availability_status_mt_everest, mt_everest_332_96)).
query(true_val(availability_status_mt_everest, unk_availability_status_mt_everest)).

% @attr availability_status_curated
% @type categorical
% @canonical false
% @original_name availability_status (Curated)
% @values curated_332_45_out_of_stock=Curated_$332.45_out_of_stock_2024 unk_availability_status_curated=Unknown
% @importance 0.85

0.65::acc(s12, availability_status_curated).

0.66::true_val(availability_status_curated, curated_332_45_out_of_stock); 0.34::true_val(availability_status_curated, unk_availability_status_curated).

measured(s12, availability_status_curated, curated_332_45_out_of_stock).

all_consistent(availability_status_curated) :-
    consistent(s12, availability_status_curated).

evidence(all_consistent(availability_status_curated)).
query(true_val(availability_status_curated, curated_332_45_out_of_stock)).
query(true_val(availability_status_curated, unk_availability_status_curated)).

% @attr availability_status_snowboards_com
% @type categorical
% @canonical false
% @original_name availability_status (Snowboards.com)
% @values snowboards_com_319_96_20off=Snowboards.com_$319.96_20pct_off unk_availability_status_snowboards_com=Unknown
% @importance 0.85

0.68::acc(s16, availability_status_snowboards_com).

0.65::true_val(availability_status_snowboards_com, snowboards_com_319_96_20off); 0.35::true_val(availability_status_snowboards_com, unk_availability_status_snowboards_com).

measured(s16, availability_status_snowboards_com, snowboards_com_319_96_20off).

all_consistent(availability_status_snowboards_com) :-
    consistent(s16, availability_status_snowboards_com).

evidence(all_consistent(availability_status_snowboards_com)).
query(true_val(availability_status_snowboards_com, snowboards_com_319_96_20off)).
query(true_val(availability_status_snowboards_com, unk_availability_status_snowboards_com)).

% @attr availability_status_joes
% @type categorical
% @canonical false
% @original_name availability_status (Joe's Sporting Goods)
% @values joes_399_95_sold_out=Joes_$399.95_sold_out unk_availability_status_joes=Unknown
% @importance 0.70

0.58::acc(s32, availability_status_joes).

0.54::true_val(availability_status_joes, joes_399_95_sold_out); 0.46::true_val(availability_status_joes, unk_availability_status_joes).

measured(s32, availability_status_joes, joes_399_95_sold_out).

all_consistent(availability_status_joes) :-
    consistent(s32, availability_status_joes).

evidence(all_consistent(availability_status_joes)).
query(true_val(availability_status_joes, joes_399_95_sold_out)).
query(true_val(availability_status_joes, unk_availability_status_joes)).

% @attr availability_status_utah_ski
% @type categorical
% @canonical false
% @original_name availability_status (Utah Ski Gear)
% @values utah_ski_399_95=Utah_Ski_Gear_$399.95 unk_availability_status_utah_ski=Unknown
% @importance 0.70

0.55::acc(s33, availability_status_utah_ski).

0.53::true_val(availability_status_utah_ski, utah_ski_399_95); 0.47::true_val(availability_status_utah_ski, unk_availability_status_utah_ski).

measured(s33, availability_status_utah_ski, utah_ski_399_95).

all_consistent(availability_status_utah_ski) :-
    consistent(s33, availability_status_utah_ski).

evidence(all_consistent(availability_status_utah_ski)).
query(true_val(availability_status_utah_ski, utah_ski_399_95)).
query(true_val(availability_status_utah_ski, unk_availability_status_utah_ski)).

% @attr availability_status_petersons
% @type categorical
% @canonical false
% @original_name availability_status (Petersons Ski and Cycle)
% @values petersons_available=Petersons_Ski_and_Cycle_available unk_availability_status_petersons=Unknown
% @importance 0.50

0.50::acc(s34, availability_status_petersons).

0.41::true_val(availability_status_petersons, petersons_available); 0.59::true_val(availability_status_petersons, unk_availability_status_petersons).

measured(s34, availability_status_petersons, petersons_available).

all_consistent(availability_status_petersons) :-
    consistent(s34, availability_status_petersons).

evidence(all_consistent(availability_status_petersons)).
query(true_val(availability_status_petersons, petersons_available)).
query(true_val(availability_status_petersons, unk_availability_status_petersons)).

% @attr availability_status_getboards
% @type categorical
% @canonical false
% @original_name availability_status (GetBoards.com)
% @values getboards_available=GetBoards.com_available unk_availability_status_getboards=Unknown
% @importance 0.70

0.62::acc(s22, availability_status_getboards).

0.56::true_val(availability_status_getboards, getboards_available); 0.44::true_val(availability_status_getboards, unk_availability_status_getboards).

measured(s22, availability_status_getboards, getboards_available).

all_consistent(availability_status_getboards) :-
    consistent(s22, availability_status_getboards).

evidence(all_consistent(availability_status_getboards)).
query(true_val(availability_status_getboards, getboards_available)).
query(true_val(availability_status_getboards, unk_availability_status_getboards)).

% @attr availability_status_attic
% @type categorical
% @canonical false
% @original_name availability_status (Attic Skate Shop)
% @values attic_2023_244_96=Attic_Skate_2023_model_$244.96 unk_availability_status_attic=Unknown
% @importance 0.70

0.50::acc(s35, availability_status_attic).

0.45::true_val(availability_status_attic, attic_2023_244_96); 0.55::true_val(availability_status_attic, unk_availability_status_attic).

measured(s35, availability_status_attic, attic_2023_244_96).

all_consistent(availability_status_attic) :-
    consistent(s35, availability_status_attic).

evidence(all_consistent(availability_status_attic)).
query(true_val(availability_status_attic, attic_2023_244_96)).
query(true_val(availability_status_attic, unk_availability_status_attic)).

% @attr salomon_com_review_rating
% @type numeric
% @canonical false
% @original_name Salomon.com review rating (current model)
% @unit /5
% @values v2_4=2.4 unk_salomon_com_review_rating=Unknown
% @importance 1.0

0.88::acc(s1, salomon_com_review_rating).

0.86::true_val(salomon_com_review_rating, v2_4); 0.14::true_val(salomon_com_review_rating, unk_salomon_com_review_rating).

measured(s1, salomon_com_review_rating, v2_4).

all_consistent(salomon_com_review_rating) :-
    consistent(s1, salomon_com_review_rating).

evidence(all_consistent(salomon_com_review_rating)).
query(true_val(salomon_com_review_rating, v2_4)).
query(true_val(salomon_com_review_rating, unk_salomon_com_review_rating)).

% @attr merchant_review_rating
% @type numeric
% @canonical false
% @original_name Merchant (original source) review rating
% @unit /5
% @values v5_0=5.0 unk_merchant_review_rating=Unknown
% @importance 0.85

0.88::acc(s_m, merchant_review_rating).

0.86::true_val(merchant_review_rating, v5_0); 0.14::true_val(merchant_review_rating, unk_merchant_review_rating).

measured(s_m, merchant_review_rating, v5_0).

all_consistent(merchant_review_rating) :-
    (indep(s_m), consistent(s_m, merchant_review_rating) ; \+indep(s_m)).

evidence(all_consistent(merchant_review_rating)).
query(true_val(merchant_review_rating, v5_0)).
query(true_val(merchant_review_rating, unk_merchant_review_rating)).

% @attr review_disagreement_note
% @type categorical
% @canonical false
% @original_name Review disagreement note
% @values significant_rating_discrepancy=Significant_rating_discrepancy_2.4_vs_5.0 unk_review_disagreement_note=Unknown
% @importance 0.925

0.85::acc(s1, review_disagreement_note).
0.85::acc(s_m, review_disagreement_note).

0.95::true_val(review_disagreement_note, significant_rating_discrepancy); 0.05::true_val(review_disagreement_note, unk_review_disagreement_note).

measured(s1, review_disagreement_note, significant_rating_discrepancy).
measured(s_m, review_disagreement_note, significant_rating_discrepancy).

all_consistent(review_disagreement_note) :-
    consistent(s1, review_disagreement_note),
    (indep(s_m), consistent(s_m, review_disagreement_note) ; \+indep(s_m)).

evidence(all_consistent(review_disagreement_note)).
query(true_val(review_disagreement_note, significant_rating_discrepancy)).
query(true_val(review_disagreement_note, unk_review_disagreement_note)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values warranty_service_failure=Defect_warranty_service_went_silent unk_negative_aspect=Unknown
% @importance 0.82

0.55::acc(s36, negative_aspect).

0.54::true_val(negative_aspect, warranty_service_failure); 0.46::true_val(negative_aspect, unk_negative_aspect).

measured(s36, negative_aspect, warranty_service_failure).

all_consistent(negative_aspect) :-
    consistent(s36, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, warranty_service_failure)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values perfect_beginner_forgiving_playful=Perfect_board_for_beginners_forgiving_playful_low_price unk_reviewer_opinion_whitelines=Unknown
% @importance 0.80

0.78::acc(s28, reviewer_opinion_whitelines).

0.67::true_val(reviewer_opinion_whitelines, perfect_beginner_forgiving_playful); 0.33::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s28, reviewer_opinion_whitelines, perfect_beginner_forgiving_playful).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s28, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, perfect_beginner_forgiving_playful)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr snowboardingdays_assessment
% @type categorical
% @canonical false
% @original_name SnowboardingDays (2024 buyers guide)
% @values freestyle_all_mountain_camber_dominant=Freestyle_all-mountain_camber-dominant_profile unk_snowboardingdays_assessment=Unknown
% @importance 0.80

0.65::acc(s19, snowboardingdays_assessment).

0.48::true_val(snowboardingdays_assessment, freestyle_all_mountain_camber_dominant); 0.52::true_val(snowboardingdays_assessment, unk_snowboardingdays_assessment).

measured(s19, snowboardingdays_assessment, freestyle_all_mountain_camber_dominant).

all_consistent(snowboardingdays_assessment) :-
    consistent(s19, snowboardingdays_assessment).

evidence(all_consistent(snowboardingdays_assessment)).
query(true_val(snowboardingdays_assessment, freestyle_all_mountain_camber_dominant)).
query(true_val(snowboardingdays_assessment, unk_snowboardingdays_assessment)).

% @attr snowboardingdays_beginner_camber_note
% @type categorical
% @canonical false
% @original_name SnowboardingDays beginner camber note
% @values avoid_camber_beginners_cruel_mistress=Normally_avoid_camber_for_beginners_cruel_mistress unk_snowboardingdays_beginner_camber_note=Unknown
% @importance 0.80

0.65::acc(s19, snowboardingdays_beginner_camber_note).

0.48::true_val(snowboardingdays_beginner_camber_note, avoid_camber_beginners_cruel_mistress); 0.52::true_val(snowboardingdays_beginner_camber_note, unk_snowboardingdays_beginner_camber_note).

measured(s19, snowboardingdays_beginner_camber_note, avoid_camber_beginners_cruel_mistress).

all_consistent(snowboardingdays_beginner_camber_note) :-
    consistent(s19, snowboardingdays_beginner_camber_note).

evidence(all_consistent(snowboardingdays_beginner_camber_note)).
query(true_val(snowboardingdays_beginner_camber_note, avoid_camber_beginners_cruel_mistress)).
query(true_val(snowboardingdays_beginner_camber_note, unk_snowboardingdays_beginner_camber_note)).

% @attr snowboardingdays_bite_free_assessment
% @type categorical
% @canonical false
% @original_name SnowboardingDays assessment (Bite Free)
% @values bite_free_mitigates_camber_catch=Bite_Free_Edge_Bevel_mitigates_camber_catch_risk unk_snowboardingdays_bite_free_assessment=Unknown
% @importance 0.80

0.65::acc(s19, snowboardingdays_bite_free_assessment).

0.48::true_val(snowboardingdays_bite_free_assessment, bite_free_mitigates_camber_catch); 0.52::true_val(snowboardingdays_bite_free_assessment, unk_snowboardingdays_bite_free_assessment).

measured(s19, snowboardingdays_bite_free_assessment, bite_free_mitigates_camber_catch).

all_consistent(snowboardingdays_bite_free_assessment) :-
    consistent(s19, snowboardingdays_bite_free_assessment).

evidence(all_consistent(snowboardingdays_bite_free_assessment)).
query(true_val(snowboardingdays_bite_free_assessment, bite_free_mitigates_camber_catch)).
query(true_val(snowboardingdays_bite_free_assessment, unk_snowboardingdays_bite_free_assessment)).

% @attr the_drop_ride_shop_review
% @type categorical
% @canonical false
% @original_name The Drop Ride Shop (2026 edition)
% @values chill_progression_feel_like_you_know=Chill_progression_makes_you_feel_like_you_know_what_youre_doing unk_the_drop_ride_shop_review=Unknown
% @importance 0.78

0.55::acc(s37, the_drop_ride_shop_review).

0.49::true_val(the_drop_ride_shop_review, chill_progression_feel_like_you_know); 0.51::true_val(the_drop_ride_shop_review, unk_the_drop_ride_shop_review).

measured(s37, the_drop_ride_shop_review, chill_progression_feel_like_you_know).

all_consistent(the_drop_ride_shop_review) :-
    consistent(s37, the_drop_ride_shop_review).

evidence(all_consistent(the_drop_ride_shop_review)).
query(true_val(the_drop_ride_shop_review, chill_progression_feel_like_you_know)).
query(true_val(the_drop_ride_shop_review, unk_the_drop_ride_shop_review)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values excellent_beginner_board=Excellent_beginner_board unk_user_review_forum=Unknown
% @importance 0.80

0.45::acc(s38, user_review_forum).

0.39::true_val(user_review_forum, excellent_beginner_board); 0.61::true_val(user_review_forum, unk_user_review_forum).

measured(s38, user_review_forum, excellent_beginner_board).

all_consistent(user_review_forum) :-
    consistent(s38, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, excellent_beginner_board)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_2
% @type categorical
% @canonical false
% @original_name user_review_forum (topsheet chipping)
% @values topsheet_chipped_sheared_15_days=Topsheet_chipped_sheared_after_15_days unk_user_review_forum_2=Unknown
% @importance 0.80

0.45::acc(s38, user_review_forum_2).

0.39::true_val(user_review_forum_2, topsheet_chipped_sheared_15_days); 0.61::true_val(user_review_forum_2, unk_user_review_forum_2).

measured(s38, user_review_forum_2, topsheet_chipped_sheared_15_days).

all_consistent(user_review_forum_2) :-
    consistent(s38, user_review_forum_2).

evidence(all_consistent(user_review_forum_2)).
query(true_val(user_review_forum_2, topsheet_chipped_sheared_15_days)).
query(true_val(user_review_forum_2, unk_user_review_forum_2)).

% @attr positive_aspect_2
% @type categorical
% @canonical false
% @original_name positive_aspect (teenager entry)
% @values great_entry_teen_park_tricks=Great_entry_board_teenager_soft_flex_park_tricks unk_positive_aspect_2=Unknown
% @importance 0.85

0.88::acc(s_m, positive_aspect_2).

0.86::true_val(positive_aspect_2, great_entry_teen_park_tricks); 0.14::true_val(positive_aspect_2, unk_positive_aspect_2).

measured(s_m, positive_aspect_2, great_entry_teen_park_tricks).

all_consistent(positive_aspect_2) :-
    (indep(s_m), consistent(s_m, positive_aspect_2) ; \+indep(s_m)).

evidence(all_consistent(positive_aspect_2)).
query(true_val(positive_aspect_2, great_entry_teen_park_tricks)).
query(true_val(positive_aspect_2, unk_positive_aspect_2)).

% @attr positive_aspect_3
% @type categorical
% @canonical false
% @original_name positive_aspect (beginner/intermediate setup)
% @values great_beginner_setup_good_price=Great_beginner_intermediate_setup_good_price_with_bindings unk_positive_aspect_3=Unknown
% @importance 0.85

0.88::acc(s_m, positive_aspect_3).

0.86::true_val(positive_aspect_3, great_beginner_setup_good_price); 0.14::true_val(positive_aspect_3, unk_positive_aspect_3).

measured(s_m, positive_aspect_3, great_beginner_setup_good_price).

all_consistent(positive_aspect_3) :-
    (indep(s_m), consistent(s_m, positive_aspect_3) ; \+indep(s_m)).

evidence(all_consistent(positive_aspect_3)).
query(true_val(positive_aspect_3, great_beginner_setup_good_price)).
query(true_val(positive_aspect_3, unk_positive_aspect_3)).

% @attr user_review_forum_3
% @type categorical
% @canonical false
% @original_name user_review_forum (washy for carving)
% @values washy_playful_carving=Washy_and_very_playful_for_carving_outgrow_quickly unk_user_review_forum_3=Unknown
% @importance 0.85

0.42::acc(s39, user_review_forum_3).

0.37::true_val(user_review_forum_3, washy_playful_carving); 0.63::true_val(user_review_forum_3, unk_user_review_forum_3).

measured(s39, user_review_forum_3, washy_playful_carving).

all_consistent(user_review_forum_3) :-
    consistent(s39, user_review_forum_3).

evidence(all_consistent(user_review_forum_3)).
query(true_val(user_review_forum_3, washy_playful_carving)).
query(true_val(user_review_forum_3, unk_user_review_forum_3)).

% @attr user_review_forum_4
% @type categorical
% @canonical false
% @original_name user_review_forum (outgrow quickly)
% @values outgrow_quick_progression=Will_outgrow_board_quickly_in_progression unk_user_review_forum_4=Unknown
% @importance 0.85

0.42::acc(s39, user_review_forum_4).

0.37::true_val(user_review_forum_4, outgrow_quick_progression); 0.63::true_val(user_review_forum_4, unk_user_review_forum_4).

measured(s39, user_review_forum_4, outgrow_quick_progression).

all_consistent(user_review_forum_4) :-
    consistent(s39, user_review_forum_4).

evidence(all_consistent(user_review_forum_4)).
query(true_val(user_review_forum_4, outgrow_quick_progression)).
query(true_val(user_review_forum_4, unk_user_review_forum_4)).

% @attr user_review_forum_5
% @type categorical
% @canonical false
% @original_name user_review_forum (detuned edges concern)
% @values detuned_edges_lack_grip=Would_not_go_detuned_edges_lack_edge_grip unk_user_review_forum_5=Unknown
% @importance 0.80

0.40::acc(s40, user_review_forum_5).

0.33::true_val(user_review_forum_5, detuned_edges_lack_grip); 0.67::true_val(user_review_forum_5, unk_user_review_forum_5).

measured(s40, user_review_forum_5, detuned_edges_lack_grip).

all_consistent(user_review_forum_5) :-
    consistent(s40, user_review_forum_5).

evidence(all_consistent(user_review_forum_5)).
query(true_val(user_review_forum_5, detuned_edges_lack_grip)).
query(true_val(user_review_forum_5, unk_user_review_forum_5)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values k2_raygun_yes_basic_rossignol_one_lf_sight_ride_agenda=K2_Raygun_Yes_Basic_Rossignol_One_LF_Salomon_Sight_Ride_Agenda unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.42::acc(s39, comparable_board_cross_brand).

0.37::true_val(comparable_board_cross_brand, k2_raygun_yes_basic_rossignol_one_lf_sight_ride_agenda); 0.63::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s39, comparable_board_cross_brand, k2_raygun_yes_basic_rossignol_one_lf_sight_ride_agenda).

all_consistent(comparable_board_cross_brand) :-
    consistent(s39, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, k2_raygun_yes_basic_rossignol_one_lf_sight_ride_agenda)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr user_review_forum_6
% @type categorical
% @canonical false
% @original_name user_review_forum (fantastic board foot fit)
% @values fantastic_board_focus_foot_fit=Fantastic_board_focus_on_foot_fit unk_user_review_forum_6=Unknown
% @importance 0.80

0.45::acc(s38, user_review_forum_6).

0.39::true_val(user_review_forum_6, fantastic_board_focus_foot_fit); 0.61::true_val(user_review_forum_6, unk_user_review_forum_6).

measured(s38, user_review_forum_6, fantastic_board_focus_foot_fit).

all_consistent(user_review_forum_6) :-
    consistent(s38, user_review_forum_6).

evidence(all_consistent(user_review_forum_6)).
query(true_val(user_review_forum_6, fantastic_board_focus_foot_fit)).
query(true_val(user_review_forum_6, unk_user_review_forum_6)).

% @attr negative_aspect_2
% @type categorical
% @canonical false
% @original_name negative_aspect (glossy laminate chipping)
% @values glossy_laminate_chips_easier=Glossy_laminate_chips_easier_than_competitors unk_negative_aspect_2=Unknown
% @importance 0.70

0.35::acc(s41, negative_aspect_2).

0.25::true_val(negative_aspect_2, glossy_laminate_chips_easier); 0.75::true_val(negative_aspect_2, unk_negative_aspect_2).

measured(s41, negative_aspect_2, glossy_laminate_chips_easier).

all_consistent(negative_aspect_2) :-
    consistent(s41, negative_aspect_2).

evidence(all_consistent(negative_aspect_2)).
query(true_val(negative_aspect_2, glossy_laminate_chips_easier)).
query(true_val(negative_aspect_2, unk_negative_aspect_2)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values soft_flex_bite_free_catch_free=Soft_flex_Bite_Free_Edges_catch_free_low_consequence unk_positive_aspect=Unknown
% @importance 0.925

0.92::acc(s1, positive_aspect).
0.82::acc(s2, positive_aspect).

0.96::true_val(positive_aspect, soft_flex_bite_free_catch_free); 0.04::true_val(positive_aspect, unk_positive_aspect).

measured(s1, positive_aspect, soft_flex_bite_free_catch_free).
measured(s2, positive_aspect, soft_flex_bite_free_catch_free).

all_consistent(positive_aspect) :-
    consistent(s1, positive_aspect),
    (indep(s2), consistent(s2, positive_aspect) ; \+indep(s2)).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, soft_flex_bite_free_catch_free)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_4
% @type categorical
% @canonical false
% @original_name positive_aspect (Flat Out Camber stability)
% @values flat_out_camber_stability_response=Flat_Out_Camber_stability_response_underfoot unk_positive_aspect_4=Unknown
% @importance 1.0

0.90::acc(s1, positive_aspect_4).

0.88::true_val(positive_aspect_4, flat_out_camber_stability_response); 0.12::true_val(positive_aspect_4, unk_positive_aspect_4).

measured(s1, positive_aspect_4, flat_out_camber_stability_response).

all_consistent(positive_aspect_4) :-
    consistent(s1, positive_aspect_4).

evidence(all_consistent(positive_aspect_4)).
query(true_val(positive_aspect_4, flat_out_camber_stability_response)).
query(true_val(positive_aspect_4, unk_positive_aspect_4)).

% @attr positive_aspect_5
% @type categorical
% @canonical false
% @original_name positive_aspect (Directional Twin versatile)
% @values directional_twin_freeride_freestyle=Directional_Twin_comfortable_freeride_freestyle unk_positive_aspect_5=Unknown
% @importance 1.0

0.90::acc(s1, positive_aspect_5).

0.88::true_val(positive_aspect_5, directional_twin_freeride_freestyle); 0.12::true_val(positive_aspect_5, unk_positive_aspect_5).

measured(s1, positive_aspect_5, directional_twin_freeride_freestyle).

all_consistent(positive_aspect_5) :-
    consistent(s1, positive_aspect_5).

evidence(all_consistent(positive_aspect_5)).
query(true_val(positive_aspect_5, directional_twin_freeride_freestyle)).
query(true_val(positive_aspect_5, unk_positive_aspect_5)).

% @attr positive_aspect_6
% @type categorical
% @canonical false
% @original_name positive_aspect (maneuverable slow speeds)
% @values maneuverable_slow_speed=Soft_flex_more_maneuverable_at_slow_speeds unk_positive_aspect_6=Unknown
% @importance 0.80

0.68::acc(s21, positive_aspect_6).

0.65::true_val(positive_aspect_6, maneuverable_slow_speed); 0.35::true_val(positive_aspect_6, unk_positive_aspect_6).

measured(s21, positive_aspect_6, maneuverable_slow_speed).

all_consistent(positive_aspect_6) :-
    (indep(s21), consistent(s21, positive_aspect_6) ; \+indep(s21)).

evidence(all_consistent(positive_aspect_6)).
query(true_val(positive_aspect_6, maneuverable_slow_speed)).
query(true_val(positive_aspect_6, unk_positive_aspect_6)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values camber_more_pop_than_flat_rocker=Camber_underfoot_more_pop_than_flat_rocker unk_pop=Unknown
% @importance 0.80

0.65::acc(s19, pop).

0.48::true_val(pop, camber_more_pop_than_flat_rocker); 0.52::true_val(pop, unk_pop).

measured(s19, pop, camber_more_pop_than_flat_rocker).

all_consistent(pop) :-
    consistent(s19, pop).

evidence(all_consistent(pop)).
query(true_val(pop, camber_more_pop_than_flat_rocker)).
query(true_val(pop, unk_pop)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values camber_superior_edge_hold=Camber_underfoot_superior_edge_hold_vs_rocker unk_edge_hold=Unknown
% @importance 0.80

0.65::acc(s19, edge_hold).

0.48::true_val(edge_hold, camber_superior_edge_hold); 0.52::true_val(edge_hold, unk_edge_hold).

measured(s19, edge_hold, camber_superior_edge_hold).

all_consistent(edge_hold) :-
    consistent(s19, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, camber_superior_edge_hold)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr negative_aspect_3
% @type categorical
% @canonical false
% @original_name negative_aspect (squirrely high speed)
% @values soft_flex_squirrely_high_speed=Soft_flex_squirrely_at_high_speeds unk_negative_aspect_3=Unknown
% @importance 0.80

0.78::acc(s42, negative_aspect_3).

0.72::true_val(negative_aspect_3, soft_flex_squirrely_high_speed); 0.28::true_val(negative_aspect_3, unk_negative_aspect_3).

measured(s42, negative_aspect_3, soft_flex_squirrely_high_speed).

all_consistent(negative_aspect_3) :-
    consistent(s42, negative_aspect_3).

evidence(all_consistent(negative_aspect_3)).
query(true_val(negative_aspect_3, soft_flex_squirrely_high_speed)).
query(true_val(negative_aspect_3, unk_negative_aspect_3)).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values easy_turn_initiation=Easy_turn_initiation_Flat_Out_Camber_detuned_edges unk_turn_initiation_performance=Unknown
% @importance 0.80

0.78::acc(s28, turn_initiation_performance).

0.67::true_val(turn_initiation_performance, easy_turn_initiation); 0.33::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s28, turn_initiation_performance, easy_turn_initiation).

all_consistent(turn_initiation_performance) :-
    consistent(s28, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, easy_turn_initiation)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr terrain_suitability_4
% @type categorical
% @canonical false
% @original_name terrain_suitability (beginner park)
% @values beginner_park_presses=Beginner_park_learning_presses unk_terrain_suitability_4=Unknown
% @importance 0.85

0.80::acc(s2, terrain_suitability_4).

0.77::true_val(terrain_suitability_4, beginner_park_presses); 0.23::true_val(terrain_suitability_4, unk_terrain_suitability_4).

measured(s2, terrain_suitability_4, beginner_park_presses).

all_consistent(terrain_suitability_4) :-
    (indep(s2), consistent(s2, terrain_suitability_4) ; \+indep(s2)).

evidence(all_consistent(terrain_suitability_4)).
query(true_val(terrain_suitability_4, beginner_park_presses)).
query(true_val(terrain_suitability_4, unk_terrain_suitability_4)).

% @attr terrain_suitability_5
% @type categorical
% @canonical false
% @original_name terrain_suitability (setback nose float)
% @values setback_nose_float_not_dedicated_powder=Setback_provides_nose_float_not_dedicated_powder unk_terrain_suitability_5=Unknown
% @importance 0.85

0.88::acc(s_m, terrain_suitability_5).

0.86::true_val(terrain_suitability_5, setback_nose_float_not_dedicated_powder); 0.14::true_val(terrain_suitability_5, unk_terrain_suitability_5).

measured(s_m, terrain_suitability_5, setback_nose_float_not_dedicated_powder).

all_consistent(terrain_suitability_5) :-
    (indep(s_m), consistent(s_m, terrain_suitability_5) ; \+indep(s_m)).

evidence(all_consistent(terrain_suitability_5)).
query(true_val(terrain_suitability_5, setback_nose_float_not_dedicated_powder)).
query(true_val(terrain_suitability_5, unk_terrain_suitability_5)).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Instigator)
% @values burton_instigator=Burton_Instigator_Flat_Top_Easy_Bevel_Channel unk_comparable_board_cross_brand_2=Unknown
% @importance 0.79

0.65::acc(s19, comparable_board_cross_brand_2).
0.55::acc(s37, comparable_board_cross_brand_2).

0.90::true_val(comparable_board_cross_brand_2, burton_instigator); 0.10::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).

measured(s19, comparable_board_cross_brand_2, burton_instigator).
measured(s37, comparable_board_cross_brand_2, burton_instigator).

all_consistent(comparable_board_cross_brand_2) :-
    consistent(s19, comparable_board_cross_brand_2),
    consistent(s37, comparable_board_cross_brand_2).

evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, burton_instigator)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values salomon_sight_step_up=Salomon_Sight_step_up_Rock_Out_Camber unk_comparable_board_same_brand=Unknown
% @importance 0.78

0.55::acc(s37, comparable_board_same_brand).
0.55::acc(s43, comparable_board_same_brand).
0.45::acc(s38, comparable_board_same_brand).

0.90::true_val(comparable_board_same_brand, salomon_sight_step_up); 0.10::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s37, comparable_board_same_brand, salomon_sight_step_up).
measured(s43, comparable_board_same_brand, salomon_sight_step_up).
measured(s38, comparable_board_same_brand, salomon_sight_step_up).

all_consistent(comparable_board_same_brand) :-
    consistent(s37, comparable_board_same_brand),
    consistent(s43, comparable_board_same_brand),
    consistent(s38, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, salomon_sight_step_up)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Salomon Craft)
% @values salomon_craft=Salomon_Craft_intermediate_all_mountain unk_comparable_board_same_brand_2=Unknown
% @importance 0.78

0.55::acc(s37, comparable_board_same_brand_2).

0.49::true_val(comparable_board_same_brand_2, salomon_craft); 0.51::true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2).

measured(s37, comparable_board_same_brand_2, salomon_craft).

all_consistent(comparable_board_same_brand_2) :-
    consistent(s37, comparable_board_same_brand_2).

evidence(all_consistent(comparable_board_same_brand_2)).
query(true_val(comparable_board_same_brand_2, salomon_craft)).
query(true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2)).

% @attr comparable_board_cross_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nitro Prime Raw)
% @values nitro_prime_raw=Nitro_Prime_Raw_rocker_extruded_value unk_comparable_board_cross_brand_3=Unknown
% @importance 0.80

0.65::acc(s19, comparable_board_cross_brand_3).

0.48::true_val(comparable_board_cross_brand_3, nitro_prime_raw); 0.52::true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3).

measured(s19, comparable_board_cross_brand_3, nitro_prime_raw).

all_consistent(comparable_board_cross_brand_3) :-
    consistent(s19, comparable_board_cross_brand_3).

evidence(all_consistent(comparable_board_cross_brand_3)).
query(true_val(comparable_board_cross_brand_3, nitro_prime_raw)).
query(true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3)).

% @attr comparable_board_cross_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Gnu GWO BTX)
% @values gnu_gwo_btx=Gnu_GWO_BTX_hybrid_rocker_banana_Magne_Traction unk_comparable_board_cross_brand_4=Unknown
% @importance 0.80

0.65::acc(s19, comparable_board_cross_brand_4).

0.48::true_val(comparable_board_cross_brand_4, gnu_gwo_btx); 0.52::true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4).

measured(s19, comparable_board_cross_brand_4, gnu_gwo_btx).

all_consistent(comparable_board_cross_brand_4) :-
    consistent(s19, comparable_board_cross_brand_4).

evidence(all_consistent(comparable_board_cross_brand_4)).
query(true_val(comparable_board_cross_brand_4, gnu_gwo_btx)).
query(true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4)).

% @attr comparable_board_cross_brand_5
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Ride Twinpig)
% @values ride_twinpig=Ride_Twinpig_volume_shifted_short_fat_pow_park unk_comparable_board_cross_brand_5=Unknown
% @importance 0.85

0.15::acc(s17, comparable_board_cross_brand_5).

0.06::true_val(comparable_board_cross_brand_5, ride_twinpig); 0.94::true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5).

measured(s17, comparable_board_cross_brand_5, ride_twinpig).

all_consistent(comparable_board_cross_brand_5) :-
    consistent(s17, comparable_board_cross_brand_5).

evidence(all_consistent(comparable_board_cross_brand_5)).
query(true_val(comparable_board_cross_brand_5, ride_twinpig)).
query(true_val(comparable_board_cross_brand_5, unk_comparable_board_cross_brand_5)).

% @attr sustainability_certification_3
% @type categorical
% @canonical false
% @original_name sustainability_certification (2024 Impact Report)
% @values impact_report_2024_recyclable_helmet=2024_Impact_Report_first_fully_recyclable_helmet unk_sustainability_certification_3=Unknown
% @importance 0.35

0.55::acc(s44, sustainability_certification_3).

0.48::true_val(sustainability_certification_3, impact_report_2024_recyclable_helmet); 0.52::true_val(sustainability_certification_3, unk_sustainability_certification_3).

measured(s44, sustainability_certification_3, impact_report_2024_recyclable_helmet).

all_consistent(sustainability_certification_3) :-
    consistent(s44, sustainability_certification_3).

evidence(all_consistent(sustainability_certification_3)).
query(true_val(sustainability_certification_3, impact_report_2024_recyclable_helmet)).
query(true_val(sustainability_certification_3, unk_sustainability_certification_3)).

% @attr sku_2024_model
% @type categorical
% @canonical false
% @original_name SKU (2024 model)
% @values l47346900=L47346900 unk_sku_2024_model=Unknown
% @importance 0.85

0.93::acc(s_m, sku_2024_model).

0.91::true_val(sku_2024_model, l47346900); 0.09::true_val(sku_2024_model, unk_sku_2024_model).

measured(s_m, sku_2024_model, l47346900).

all_consistent(sku_2024_model) :-
    (indep(s_m), consistent(s_m, sku_2024_model) ; \+indep(s_m)).

evidence(all_consistent(sku_2024_model)).
query(true_val(sku_2024_model, l47346900)).
query(true_val(sku_2024_model, unk_sku_2024_model)).

% @attr article_ref_2025_model
% @type categorical
% @canonical false
% @original_name Article ref (current/2025 model)
% @values l47661600=L47661600 unk_article_ref_2025_model=Unknown
% @importance 0.40

0.94::acc(s1, article_ref_2025_model).

0.92::true_val(article_ref_2025_model, l47661600); 0.08::true_val(article_ref_2025_model, unk_article_ref_2025_model).

measured(s1, article_ref_2025_model, l47661600).

all_consistent(article_ref_2025_model) :-
    consistent(s1, article_ref_2025_model).

evidence(all_consistent(article_ref_2025_model)).
query(true_val(article_ref_2025_model, l47661600)).
query(true_val(article_ref_2025_model, unk_article_ref_2025_model)).

% @attr available_colors
% @type categorical
% @canonical false
% @original_name available_colors
% @values black_white=Black_White unk_available_colors=Unknown
% @importance 0.70

0.58::acc(s32, available_colors).

0.54::true_val(available_colors, black_white); 0.46::true_val(available_colors, unk_available_colors).

measured(s32, available_colors, black_white).

all_consistent(available_colors) :-
    consistent(s32, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, black_white)).
query(true_val(available_colors, unk_available_colors)).

% @attr predecessor_model_name
% @type categorical
% @canonical false
% @original_name predecessor_model_name
% @values previous_pulse_since_2008=Previous_Salomon_Pulse_models_since_2008_2009 unk_predecessor_model_name=Unknown
% @importance 0.60

0.70::acc(s8, predecessor_model_name).

0.64::true_val(predecessor_model_name, previous_pulse_since_2008); 0.36::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s8, predecessor_model_name, previous_pulse_since_2008).

all_consistent(predecessor_model_name) :-
    consistent(s8, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, previous_pulse_since_2008)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).