0.20::indep(s2).
0.30::indep(s10).
0.25::indep(s50).
0.15::indep(s116).
0.15::indep(s118).
0.15::indep(s120).
0.15::indep(s41).
0.20::indep(s48).
0.20::indep(s70).
0.80::indep(s8).
0.85::indep(s5).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values gnu=GNU unk_brand=Unknown
% @importance 0.975

0.93::acc(s1, brand).
0.90::acc(s2, brand).

0.97::true_val(brand, gnu); 0.03::true_val(brand, unk_brand).

measured(s1, brand, gnu).
measured(s2, brand, gnu).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s2), consistent(s2, brand) ; \+indep(s2)).

evidence(all_consistent(brand)).
query(true_val(brand, gnu)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values facts=Facts unk_model_name=Unknown
% @importance 0.975

0.93::acc(s1, model_name).
0.90::acc(s2, model_name).

0.97::true_val(model_name, facts); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, facts).
measured(s2, model_name, facts).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s2), consistent(s2, model_name) ; \+indep(s2)).

evidence(all_consistent(model_name)).
query(true_val(model_name, facts)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values season_2025_2026=2025-2026 season_2027_sh=2027_Southern_Hemisphere unk_model_year=Unknown
% @importance 0.975

0.93::acc(s1, model_year).
0.80::acc(s2, model_year).

0.70::true_val(model_year, season_2025_2026); 0.25::true_val(model_year, season_2027_sh); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, season_2025_2026).
measured(s2, model_year, season_2027_sh).

all_consistent(model_year) :-
    consistent(s1, model_year),
    (indep(s2), consistent(s2, model_year) ; \+indep(s2)).

evidence(all_consistent(model_year)).
query(true_val(model_year, season_2025_2026)).
query(true_val(model_year, season_2027_sh)).
query(true_val(model_year, unk_model_year)).

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
% @values freestyle_all_mountain=Freestyle-All_Mountain unk_board_category=Unknown
% @importance 0.90

0.85::acc(s2, board_category).
0.83::acc(s10, board_category).

0.95::true_val(board_category, freestyle_all_mountain); 0.05::true_val(board_category, unk_board_category).

measured(s2, board_category, freestyle_all_mountain).
measured(s10, board_category, freestyle_all_mountain).

all_consistent(board_category) :-
    (indep(s2), consistent(s2, board_category) ; \+indep(s2)),
    (indep(s10), consistent(s10, board_category) ; \+indep(s10)).

evidence(all_consistent(board_category)).
query(true_val(board_category, freestyle_all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.65

0.92::acc(s7, manufacturer).
0.80::acc(s21, manufacturer).

0.95::true_val(manufacturer, mervin_manufacturing); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s7, manufacturer, mervin_manufacturing).
measured(s21, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :-
    consistent(s7, manufacturer),
    consistent(s21, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values sequim_wa_usa=Sequim_Carlsborg_Washington_USA unk_manufacturing_location=Unknown
% @importance 0.60

0.90::acc(s7, manufacturing_location).
0.88::acc(s23, manufacturing_location).

0.95::true_val(manufacturing_location, sequim_wa_usa); 0.05::true_val(manufacturing_location, unk_manufacturing_location).

measured(s7, manufacturing_location, sequim_wa_usa).
measured(s23, manufacturing_location, sequim_wa_usa).

all_consistent(manufacturing_location) :-
    consistent(s7, manufacturing_location),
    consistent(s23, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, sequim_wa_usa)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr mervin_manufacturing_founded
% @type categorical
% @canonical false
% @original_name Mervin Manufacturing founded
% @values founded_1977_olson_saari=1977_by_Mike_Olson_and_Pete_Saari unk_mervin_manufacturing_founded=Unknown
% @importance 0.625

0.90::acc(s22, mervin_manufacturing_founded).
0.78::acc(s23, mervin_manufacturing_founded).

0.95::true_val(mervin_manufacturing_founded, founded_1977_olson_saari); 0.05::true_val(mervin_manufacturing_founded, unk_mervin_manufacturing_founded).

measured(s22, mervin_manufacturing_founded, founded_1977_olson_saari).
measured(s23, mervin_manufacturing_founded, founded_1977_olson_saari).

all_consistent(mervin_manufacturing_founded) :-
    consistent(s22, mervin_manufacturing_founded),
    consistent(s23, mervin_manufacturing_founded).

evidence(all_consistent(mervin_manufacturing_founded)).
query(true_val(mervin_manufacturing_founded, founded_1977_olson_saari)).
query(true_val(mervin_manufacturing_founded, unk_mervin_manufacturing_founded)).

% @attr mervin_ownership
% @type categorical
% @canonical false
% @original_name Mervin ownership
% @values quiksilver_1997_altamont_2013=Quiksilver_1997_Altamont_Capital_2013 unk_mervin_ownership=Unknown
% @importance 0.60

0.78::acc(s21, mervin_ownership).

0.70::true_val(mervin_ownership, quiksilver_1997_altamont_2013); 0.30::true_val(mervin_ownership, unk_mervin_ownership).

measured(s21, mervin_ownership, quiksilver_1997_altamont_2013).

all_consistent(mervin_ownership) :-
    consistent(s21, mervin_ownership).

evidence(all_consistent(mervin_ownership)).
query(true_val(mervin_ownership, quiksilver_1997_altamont_2013)).
query(true_val(mervin_ownership, unk_mervin_ownership)).

% @attr gnu_brand_founded
% @type categorical
% @canonical false
% @original_name GNU brand founded
% @values founded_1977=1977 unk_gnu_brand_founded=Unknown
% @importance 0.55

0.88::acc(s7, gnu_brand_founded).
0.80::acc(s57, gnu_brand_founded).

0.95::true_val(gnu_brand_founded, founded_1977); 0.05::true_val(gnu_brand_founded, unk_gnu_brand_founded).

measured(s7, gnu_brand_founded, founded_1977).
measured(s57, gnu_brand_founded, founded_1977).

all_consistent(gnu_brand_founded) :-
    consistent(s7, gnu_brand_founded),
    consistent(s57, gnu_brand_founded).

evidence(all_consistent(gnu_brand_founded)).
query(true_val(gnu_brand_founded, founded_1977)).
query(true_val(gnu_brand_founded, unk_gnu_brand_founded)).

% @attr mervin_last_major_factory
% @type categorical
% @canonical false
% @original_name Mervin is the last major board building factory in the USA
% @values yes=Yes unk_mervin_last_major_factory=Unknown
% @importance 0.625

0.90::acc(s22, mervin_last_major_factory).
0.85::acc(s23, mervin_last_major_factory).

0.95::true_val(mervin_last_major_factory, yes); 0.05::true_val(mervin_last_major_factory, unk_mervin_last_major_factory).

measured(s22, mervin_last_major_factory, yes).
measured(s23, mervin_last_major_factory, yes).

all_consistent(mervin_last_major_factory) :-
    consistent(s22, mervin_last_major_factory),
    consistent(s23, mervin_last_major_factory).

evidence(all_consistent(mervin_last_major_factory)).
query(true_val(mervin_last_major_factory, yes)).
query(true_val(mervin_last_major_factory, unk_mervin_last_major_factory)).

% @attr mervin_parent_brands
% @type categorical
% @canonical false
% @original_name Mervin parent brands
% @values libtech_gnu_roxy_bentmetal=Lib_Tech_GNU_Roxy_Bent_Metal unk_mervin_parent_brands=Unknown
% @importance 0.625

0.85::acc(s21, mervin_parent_brands).
0.90::acc(s22, mervin_parent_brands).

0.95::true_val(mervin_parent_brands, libtech_gnu_roxy_bentmetal); 0.05::true_val(mervin_parent_brands, unk_mervin_parent_brands).

measured(s21, mervin_parent_brands, libtech_gnu_roxy_bentmetal).
measured(s22, mervin_parent_brands, libtech_gnu_roxy_bentmetal).

all_consistent(mervin_parent_brands) :-
    consistent(s21, mervin_parent_brands),
    consistent(s22, mervin_parent_brands).

evidence(all_consistent(mervin_parent_brands)).
query(true_val(mervin_parent_brands, libtech_gnu_roxy_bentmetal)).
query(true_val(mervin_parent_brands, unk_mervin_parent_brands)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values new_for_2026=New_for_2026 unk_model_first_available_year=Unknown
% @importance 0.85

0.80::acc(s50, model_first_available_year).

0.75::true_val(model_first_available_year, new_for_2026); 0.25::true_val(model_first_available_year, unk_model_first_available_year).

measured(s50, model_first_available_year, new_for_2026).

all_consistent(model_first_available_year) :-
    (indep(s50), consistent(s50, model_first_available_year) ; \+indep(s50)).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, new_for_2026)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values sam_davidson_antihero=Sam_Davidson_Anti_Hero unk_graphic_designer_artist=Unknown
% @importance 0.30

0.82::acc(s3, graphic_designer_artist).

0.80::true_val(graphic_designer_artist, sam_davidson_antihero); 0.20::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s3, graphic_designer_artist, sam_davidson_antihero).

all_consistent(graphic_designer_artist) :-
    consistent(s3, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, sam_davidson_antihero)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.825

0.88::acc(s2, gender).
0.88::acc(s8, gender).

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).

measured(s2, gender, mens).
measured(s8, gender, mens).

all_consistent(gender) :-
    (indep(s2), consistent(s2, gender) ; \+indep(s2)),
    (indep(s8), consistent(s8, gender) ; \+indep(s8)).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr sku
% @type categorical
% @canonical false
% @original_name SKU (merchant provided)
% @values sku_26sn001_150=26SN001_150 unk_sku=Unknown
% @importance 0.85

0.92::acc(s2, sku).

0.90::true_val(sku, sku_26sn001_150); 0.10::true_val(sku, unk_sku).

measured(s2, sku, sku_26sn001_150).

all_consistent(sku) :-
    (indep(s2), consistent(s2, sku) ; \+indep(s2)).

evidence(all_consistent(sku)).
query(true_val(sku, sku_26sn001_150)).
query(true_val(sku, unk_sku)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v429_99=429.99 unk_price_usd_msrp=Unknown
% @importance 1.0

0.95::acc(s1, price_usd_msrp).

0.97::true_val(price_usd_msrp, v429_99); 0.03::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s1, price_usd_msrp, v429_99).

all_consistent(price_usd_msrp) :-
    consistent(s1, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v429_99)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v300_99=300.99 unk_price_usd_evo=Unknown
% @importance 0.90

0.88::acc(s5, price_usd_evo).

0.85::true_val(price_usd_evo, v300_99); 0.15::true_val(price_usd_evo, unk_price_usd_evo).

measured(s5, price_usd_evo, v300_99).

all_consistent(price_usd_evo) :-
    (indep(s5), consistent(s5, price_usd_evo) ; \+indep(s5)).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v300_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_evo_blem
% @type numeric
% @canonical false
% @original_name price_usd_evo (blem)
% @unit USD
% @values v257_99=257.99 unk_price_usd_evo_blem=Unknown
% @importance 0.90

0.88::acc(s5, price_usd_evo_blem).

0.85::true_val(price_usd_evo_blem, v257_99); 0.15::true_val(price_usd_evo_blem, unk_price_usd_evo_blem).

measured(s5, price_usd_evo_blem, v257_99).

all_consistent(price_usd_evo_blem) :-
    (indep(s5), consistent(s5, price_usd_evo_blem) ; \+indep(s5)).

evidence(all_consistent(price_usd_evo_blem)).
query(true_val(price_usd_evo_blem, v257_99)).
query(true_val(price_usd_evo_blem, unk_price_usd_evo_blem)).

% @attr price_skipro
% @type numeric
% @canonical false
% @original_name Price at Ski Pro AZ (2026 model)
% @unit USD
% @values v339_95=339.95 unk_price_skipro=Unknown
% @importance 0.85

0.82::acc(s36, price_skipro).

0.75::true_val(price_skipro, v339_95); 0.25::true_val(price_skipro, unk_price_skipro).

measured(s36, price_skipro, v339_95).

all_consistent(price_skipro) :-
    consistent(s36, price_skipro).

evidence(all_consistent(price_skipro)).
query(true_val(price_skipro, v339_95)).
query(true_val(price_skipro, unk_price_skipro)).

% @attr price_eriks
% @type categorical
% @canonical false
% @original_name Price at ERIK'S Bike Board & Ski
% @values available=Available unk_price_eriks=Unknown
% @importance 0.75

0.70::acc(s41, price_eriks).

0.70::true_val(price_eriks, available); 0.30::true_val(price_eriks, unk_price_eriks).

measured(s41, price_eriks, available).

all_consistent(price_eriks) :-
    (indep(s41), consistent(s41, price_eriks) ; \+indep(s41)).

evidence(all_consistent(price_eriks)).
query(true_val(price_eriks, available)).
query(true_val(price_eriks, unk_price_eriks)).

% @attr price_blauer
% @type categorical
% @canonical false
% @original_name Price at Blauer Board Shop
% @values available=Available unk_price_blauer=Unknown
% @importance 0.85

0.75::acc(s50, price_blauer).

0.75::true_val(price_blauer, available); 0.25::true_val(price_blauer, unk_price_blauer).

measured(s50, price_blauer, available).

all_consistent(price_blauer) :-
    (indep(s50), consistent(s50, price_blauer) ; \+indep(s50)).

evidence(all_consistent(price_blauer)).
query(true_val(price_blauer, available)).
query(true_val(price_blauer, unk_price_blauer)).

% @attr price_speck_eur
% @type numeric
% @canonical false
% @original_name Price at Speck Sports (EUR)
% @unit EUR
% @values v343_99=343.99 unk_price_speck_eur=Unknown
% @importance 0.70

0.72::acc(s70, price_speck_eur).

0.65::true_val(price_speck_eur, v343_99); 0.35::true_val(price_speck_eur, unk_price_speck_eur).

measured(s70, price_speck_eur, v343_99).

all_consistent(price_speck_eur) :-
    (indep(s70), consistent(s70, price_speck_eur) ; \+indep(s70)).

evidence(all_consistent(price_speck_eur)).
query(true_val(price_speck_eur, v343_99)).
query(true_val(price_speck_eur, unk_price_speck_eur)).

% @attr price_gnu_eur
% @type numeric
% @canonical false
% @original_name Price at gnu.com EUR site
% @unit EUR
% @values v429_99_eur=429.99 unk_price_gnu_eur=Unknown
% @importance 0.85

0.92::acc(s8, price_gnu_eur).

0.90::true_val(price_gnu_eur, v429_99_eur); 0.10::true_val(price_gnu_eur, unk_price_gnu_eur).

measured(s8, price_gnu_eur, v429_99_eur).

all_consistent(price_gnu_eur) :-
    consistent(s8, price_gnu_eur).

evidence(all_consistent(price_gnu_eur)).
query(true_val(price_gnu_eur, v429_99_eur)).
query(true_val(price_gnu_eur, unk_price_gnu_eur)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant
% @unit AUD
% @values v699_99=699.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.92::acc(s2, price_aud_merchant).

0.92::true_val(price_aud_merchant, v699_99); 0.08::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s2, price_aud_merchant, v699_99).

all_consistent(price_aud_merchant) :-
    consistent(s2, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v699_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr price_level_nine
% @type categorical
% @canonical false
% @original_name Price at Level Nine Sports
% @values available=Available unk_price_level_nine=Unknown
% @importance 0.80

0.72::acc(s118, price_level_nine).

0.70::true_val(price_level_nine, available); 0.30::true_val(price_level_nine, unk_price_level_nine).

measured(s118, price_level_nine, available).

all_consistent(price_level_nine) :-
    consistent(s118, price_level_nine).

evidence(all_consistent(price_level_nine)).
query(true_val(price_level_nine, available)).
query(true_val(price_level_nine, unk_price_level_nine)).

% @attr price_source_boards
% @type categorical
% @canonical false
% @original_name Price at The Source Snowboard & Skate
% @values available=Available unk_price_source_boards=Unknown
% @importance 0.70

0.72::acc(s116, price_source_boards).

0.70::true_val(price_source_boards, available); 0.30::true_val(price_source_boards, unk_price_source_boards).

measured(s116, price_source_boards, available).

all_consistent(price_source_boards) :-
    consistent(s116, price_source_boards).

evidence(all_consistent(price_source_boards)).
query(true_val(price_source_boards, available)).
query(true_val(price_source_boards, unk_price_source_boards)).

% @attr price_snowboards_com
% @type categorical
% @canonical false
% @original_name Price at snowboards.com
% @values available=Available unk_price_snowboards_com=Unknown
% @importance 0.75

0.72::acc(s120, price_snowboards_com).

0.70::true_val(price_snowboards_com, available); 0.30::true_val(price_snowboards_com, unk_price_snowboards_com).

measured(s120, price_snowboards_com, available).

all_consistent(price_snowboards_com) :-
    consistent(s120, price_snowboards_com).

evidence(all_consistent(price_snowboards_com)).
query(true_val(price_snowboards_com, available)).
query(true_val(price_snowboards_com, unk_price_snowboards_com)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values not_stocked_tactics=Not_stocked_at_Tactics unk_availability_status=Unknown
% @importance 0.55

0.75::acc(s97, availability_status).

0.70::true_val(availability_status, not_stocked_tactics); 0.30::true_val(availability_status, unk_availability_status).

measured(s97, availability_status, not_stocked_tactics).

all_consistent(availability_status) :-
    consistent(s97, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, not_stocked_tactics)).
query(true_val(availability_status, unk_availability_status)).

% @attr board_of_world_recommendation
% @type categorical
% @canonical false
% @original_name Board of the World recommendation
% @values beginner_package_bent_metal=Beginner_package_with_Bent_Metal_Joint unk_board_of_world_recommendation=Unknown
% @importance 0.85

0.82::acc(s75, board_of_world_recommendation).

0.80::true_val(board_of_world_recommendation, beginner_package_bent_metal); 0.20::true_val(board_of_world_recommendation, unk_board_of_world_recommendation).

measured(s75, board_of_world_recommendation, beginner_package_bent_metal).

all_consistent(board_of_world_recommendation) :-
    consistent(s75, board_of_world_recommendation).

evidence(all_consistent(board_of_world_recommendation)).
query(true_val(board_of_world_recommendation, beginner_package_bent_metal)).
query(true_val(board_of_world_recommendation, unk_board_of_world_recommendation)).

% @attr free_shipping
% @type categorical
% @canonical false
% @original_name Free shipping at gnu.com
% @values over_75_excl_ak_hi=Over_75_USD_excluding_AK_HI unk_free_shipping=Unknown
% @importance 1.0

0.93::acc(s1, free_shipping).

0.93::true_val(free_shipping, over_75_excl_ak_hi); 0.07::true_val(free_shipping, unk_free_shipping).

measured(s1, free_shipping, over_75_excl_ak_hi).

all_consistent(free_shipping) :-
    consistent(s1, free_shipping).

evidence(all_consistent(free_shipping)).
query(true_val(free_shipping, over_75_excl_ak_hi)).
query(true_val(free_shipping, unk_free_shipping)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms
% @values one_year_return=Up_to_full_year_return unk_return_policy_terms=Unknown
% @importance 0.60

0.85::acc(s10, return_policy_terms).

0.82::true_val(return_policy_terms, one_year_return); 0.18::true_val(return_policy_terms, unk_return_policy_terms).

measured(s10, return_policy_terms, one_year_return).

all_consistent(return_policy_terms) :-
    (indep(s10), consistent(s10, return_policy_terms) ; \+indep(s10)).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, one_year_return)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.917

0.95::acc(s1, shape).
0.85::acc(s2, shape).
0.82::acc(s10, shape).

0.97::true_val(shape, directional_twin); 0.03::true_val(shape, unk_shape).

measured(s1, shape, directional_twin).
measured(s2, shape, directional_twin).
measured(s10, shape, directional_twin).

all_consistent(shape) :-
    consistent(s1, shape),
    (indep(s2), consistent(s2, shape) ; \+indep(s2)),
    (indep(s10), consistent(s10, shape) ; \+indep(s10)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values sym_shifted_stance=Symmetrical_shape_slightly_shifted_stance unk_shape_description=Unknown
% @importance 0.75

0.82::acc(s2, shape_description).

0.78::true_val(shape_description, sym_shifted_stance); 0.22::true_val(shape_description, unk_shape_description).

measured(s2, shape_description, sym_shifted_stance).

all_consistent(shape_description) :-
    (indep(s2), consistent(s2, shape_description) ; \+indep(s2)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, sym_shifted_stance)).
query(true_val(shape_description, unk_shape_description)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values eight_sizes=147_150_153_156_159_156W_159W_162W unk_available_sizes=Unknown
% @importance 1.0

0.95::acc(s1, available_sizes).

0.95::true_val(available_sizes, eight_sizes); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s1, available_sizes, eight_sizes).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, eight_sizes)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_Wide unk_width_options=Unknown
% @importance 0.90

0.85::acc(s2, width_options).

0.88::true_val(width_options, standard_and_wide); 0.12::true_val(width_options, unk_width_options).

measured(s2, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(s2), consistent(s2, width_options) ; \+indep(s2)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit inches
% @values v0_75=0.75 unk_setback=Unknown
% @importance 1.0

0.93::acc(s1, setback).

0.93::true_val(setback, v0_75); 0.07::true_val(setback, unk_setback).

measured(s1, setback, v0_75).

all_consistent(setback) :-
    consistent(s1, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v0_75)).
query(true_val(setback, unk_setback)).

% @attr waist_width_147
% @type numeric
% @canonical false
% @original_name Waist width 147
% @unit cm
% @values v24_2=24.2 unk_waist_width_147=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_147).

0.93::true_val(waist_width_147, v24_2); 0.07::true_val(waist_width_147, unk_waist_width_147).

measured(s1, waist_width_147, v24_2).

all_consistent(waist_width_147) :-
    consistent(s1, waist_width_147).

evidence(all_consistent(waist_width_147)).
query(true_val(waist_width_147, v24_2)).
query(true_val(waist_width_147, unk_waist_width_147)).

% @attr waist_width_150
% @type numeric
% @canonical false
% @original_name Waist width 150
% @unit cm
% @values v24_5=24.5 unk_waist_width_150=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_150).

0.93::true_val(waist_width_150, v24_5); 0.07::true_val(waist_width_150, unk_waist_width_150).

measured(s1, waist_width_150, v24_5).

all_consistent(waist_width_150) :-
    consistent(s1, waist_width_150).

evidence(all_consistent(waist_width_150)).
query(true_val(waist_width_150, v24_5)).
query(true_val(waist_width_150, unk_waist_width_150)).

% @attr waist_width_153
% @type numeric
% @canonical false
% @original_name Waist width 153
% @unit cm
% @values v24_8=24.8 unk_waist_width_153=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_153).

0.93::true_val(waist_width_153, v24_8); 0.07::true_val(waist_width_153, unk_waist_width_153).

measured(s1, waist_width_153, v24_8).

all_consistent(waist_width_153) :-
    consistent(s1, waist_width_153).

evidence(all_consistent(waist_width_153)).
query(true_val(waist_width_153, v24_8)).
query(true_val(waist_width_153, unk_waist_width_153)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @original_name Waist width 156
% @unit cm
% @values v25_4=25.4 unk_waist_width_156=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_156).

0.93::true_val(waist_width_156, v25_4); 0.07::true_val(waist_width_156, unk_waist_width_156).

measured(s1, waist_width_156, v25_4).

all_consistent(waist_width_156) :-
    consistent(s1, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_4)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name Waist width 159
% @unit cm
% @values v25_5=25.5 unk_waist_width_159=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_159).

0.93::true_val(waist_width_159, v25_5); 0.07::true_val(waist_width_159, unk_waist_width_159).

measured(s1, waist_width_159, v25_5).

all_consistent(waist_width_159) :-
    consistent(s1, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_5)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr waist_width_156w
% @type numeric
% @canonical false
% @original_name Waist width 156W
% @unit cm
% @values v26_7=26.7 unk_waist_width_156w=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_156w).

0.93::true_val(waist_width_156w, v26_7); 0.07::true_val(waist_width_156w, unk_waist_width_156w).

measured(s1, waist_width_156w, v26_7).

all_consistent(waist_width_156w) :-
    consistent(s1, waist_width_156w).

evidence(all_consistent(waist_width_156w)).
query(true_val(waist_width_156w, v26_7)).
query(true_val(waist_width_156w, unk_waist_width_156w)).

% @attr waist_width_159w
% @type numeric
% @canonical false
% @original_name Waist width 159W
% @unit cm
% @values v26_7=26.7 unk_waist_width_159w=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_159w).

0.93::true_val(waist_width_159w, v26_7); 0.07::true_val(waist_width_159w, unk_waist_width_159w).

measured(s1, waist_width_159w, v26_7).

all_consistent(waist_width_159w) :-
    consistent(s1, waist_width_159w).

evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_7)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

% @attr waist_width_162w
% @type numeric
% @canonical false
% @original_name Waist width 162W
% @unit cm
% @values v26_7=26.7 unk_waist_width_162w=Unknown
% @importance 1.0

0.93::acc(s1, waist_width_162w).

0.93::true_val(waist_width_162w, v26_7); 0.07::true_val(waist_width_162w, unk_waist_width_162w).

measured(s1, waist_width_162w, v26_7).

all_consistent(waist_width_162w) :-
    consistent(s1, waist_width_162w).

evidence(all_consistent(waist_width_162w)).
query(true_val(waist_width_162w, v26_7)).
query(true_val(waist_width_162w, unk_waist_width_162w)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v29_8_29_8=29.8/29.8 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size).

0.93::true_val(tip_tail_width_size, v29_8_29_8); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, v29_8_29_8).

all_consistent(tip_tail_width_size) :-
    consistent(s1, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_8_29_8)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_size_147
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (147)
% @unit cm
% @values v28_1_28_1=28.1/28.1 unk_tip_tail_width_size_147=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size_147).

0.93::true_val(tip_tail_width_size_147, v28_1_28_1); 0.07::true_val(tip_tail_width_size_147, unk_tip_tail_width_size_147).

measured(s1, tip_tail_width_size_147, v28_1_28_1).

all_consistent(tip_tail_width_size_147) :-
    consistent(s1, tip_tail_width_size_147).

evidence(all_consistent(tip_tail_width_size_147)).
query(true_val(tip_tail_width_size_147, v28_1_28_1)).
query(true_val(tip_tail_width_size_147, unk_tip_tail_width_size_147)).

% @attr tip_tail_width_size_150
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (150)
% @unit cm
% @values v28_2_28_2=28.2/28.2 unk_tip_tail_width_size_150=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size_150).

0.93::true_val(tip_tail_width_size_150, v28_2_28_2); 0.07::true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150).

measured(s1, tip_tail_width_size_150, v28_2_28_2).

all_consistent(tip_tail_width_size_150) :-
    consistent(s1, tip_tail_width_size_150).

evidence(all_consistent(tip_tail_width_size_150)).
query(true_val(tip_tail_width_size_150, v28_2_28_2)).
query(true_val(tip_tail_width_size_150, unk_tip_tail_width_size_150)).

% @attr tip_tail_width_size_153
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (153)
% @unit cm
% @values v28_9_28_9=28.9/28.9 unk_tip_tail_width_size_153=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size_153).

0.93::true_val(tip_tail_width_size_153, v28_9_28_9); 0.07::true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153).

measured(s1, tip_tail_width_size_153, v28_9_28_9).

all_consistent(tip_tail_width_size_153) :-
    consistent(s1, tip_tail_width_size_153).

evidence(all_consistent(tip_tail_width_size_153)).
query(true_val(tip_tail_width_size_153, v28_9_28_9)).
query(true_val(tip_tail_width_size_153, unk_tip_tail_width_size_153)).

% @attr tip_tail_width_size_159
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (159)
% @unit cm
% @values v30_2_30_2=30.2/30.2 unk_tip_tail_width_size_159=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size_159).

0.93::true_val(tip_tail_width_size_159, v30_2_30_2); 0.07::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s1, tip_tail_width_size_159, v30_2_30_2).

all_consistent(tip_tail_width_size_159) :-
    consistent(s1, tip_tail_width_size_159).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v30_2_30_2)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

% @attr tip_tail_width_size_156w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (156W)
% @unit cm
% @values v31_1_31_1=31.1/31.1 unk_tip_tail_width_size_156w=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size_156w).

0.93::true_val(tip_tail_width_size_156w, v31_1_31_1); 0.07::true_val(tip_tail_width_size_156w, unk_tip_tail_width_size_156w).

measured(s1, tip_tail_width_size_156w, v31_1_31_1).

all_consistent(tip_tail_width_size_156w) :-
    consistent(s1, tip_tail_width_size_156w).

evidence(all_consistent(tip_tail_width_size_156w)).
query(true_val(tip_tail_width_size_156w, v31_1_31_1)).
query(true_val(tip_tail_width_size_156w, unk_tip_tail_width_size_156w)).

% @attr tip_tail_width_size_159w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (159W)
% @unit cm
% @values v31_2_31_2=31.2/31.2 unk_tip_tail_width_size_159w=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size_159w).

0.93::true_val(tip_tail_width_size_159w, v31_2_31_2); 0.07::true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w).

measured(s1, tip_tail_width_size_159w, v31_2_31_2).

all_consistent(tip_tail_width_size_159w) :-
    consistent(s1, tip_tail_width_size_159w).

evidence(all_consistent(tip_tail_width_size_159w)).
query(true_val(tip_tail_width_size_159w, v31_2_31_2)).
query(true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w)).

% @attr tip_tail_width_size_162w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (162W)
% @unit cm
% @values v31_4_31_4=31.4/31.4 unk_tip_tail_width_size_162w=Unknown
% @importance 1.0

0.93::acc(s1, tip_tail_width_size_162w).

0.93::true_val(tip_tail_width_size_162w, v31_4_31_4); 0.07::true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w).

measured(s1, tip_tail_width_size_162w, v31_4_31_4).

all_consistent(tip_tail_width_size_162w) :-
    consistent(s1, tip_tail_width_size_162w).

evidence(all_consistent(tip_tail_width_size_162w)).
query(true_val(tip_tail_width_size_162w, v31_4_31_4)).
query(true_val(tip_tail_width_size_162w, unk_tip_tail_width_size_162w)).

% @attr contact_length_size
% @type numeric
% @canonical true
% @original_name contact_length_size
% @unit cm
% @values v119=119.0 unk_contact_length_size=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size).

0.93::true_val(contact_length_size, v119); 0.07::true_val(contact_length_size, unk_contact_length_size).

measured(s1, contact_length_size, v119).

all_consistent(contact_length_size) :-
    consistent(s1, contact_length_size).

evidence(all_consistent(contact_length_size)).
query(true_val(contact_length_size, v119)).
query(true_val(contact_length_size, unk_contact_length_size)).

% @attr contact_length_size_147
% @type numeric
% @canonical false
% @original_name contact_length_size (147)
% @unit cm
% @values v109=109.0 unk_contact_length_size_147=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_147).

0.93::true_val(contact_length_size_147, v109); 0.07::true_val(contact_length_size_147, unk_contact_length_size_147).

measured(s1, contact_length_size_147, v109).

all_consistent(contact_length_size_147) :-
    consistent(s1, contact_length_size_147).

evidence(all_consistent(contact_length_size_147)).
query(true_val(contact_length_size_147, v109)).
query(true_val(contact_length_size_147, unk_contact_length_size_147)).

% @attr contact_length_size_150
% @type numeric
% @canonical false
% @original_name contact_length_size (150)
% @unit cm
% @values v111=111.0 unk_contact_length_size_150=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_150).

0.93::true_val(contact_length_size_150, v111); 0.07::true_val(contact_length_size_150, unk_contact_length_size_150).

measured(s1, contact_length_size_150, v111).

all_consistent(contact_length_size_150) :-
    consistent(s1, contact_length_size_150).

evidence(all_consistent(contact_length_size_150)).
query(true_val(contact_length_size_150, v111)).
query(true_val(contact_length_size_150, unk_contact_length_size_150)).

% @attr contact_length_size_153
% @type numeric
% @canonical false
% @original_name contact_length_size (153)
% @unit cm
% @values v114_5=114.5 unk_contact_length_size_153=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_153).

0.93::true_val(contact_length_size_153, v114_5); 0.07::true_val(contact_length_size_153, unk_contact_length_size_153).

measured(s1, contact_length_size_153, v114_5).

all_consistent(contact_length_size_153) :-
    consistent(s1, contact_length_size_153).

evidence(all_consistent(contact_length_size_153)).
query(true_val(contact_length_size_153, v114_5)).
query(true_val(contact_length_size_153, unk_contact_length_size_153)).

% @attr contact_length_size_159
% @type numeric
% @canonical false
% @original_name contact_length_size (159)
% @unit cm
% @values v121=121.0 unk_contact_length_size_159=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_159).

0.93::true_val(contact_length_size_159, v121); 0.07::true_val(contact_length_size_159, unk_contact_length_size_159).

measured(s1, contact_length_size_159, v121).

all_consistent(contact_length_size_159) :-
    consistent(s1, contact_length_size_159).

evidence(all_consistent(contact_length_size_159)).
query(true_val(contact_length_size_159, v121)).
query(true_val(contact_length_size_159, unk_contact_length_size_159)).

% @attr contact_length_size_156w
% @type numeric
% @canonical false
% @original_name contact_length_size (156W)
% @unit cm
% @values v119w=119.0 unk_contact_length_size_156w=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_156w).

0.93::true_val(contact_length_size_156w, v119w); 0.07::true_val(contact_length_size_156w, unk_contact_length_size_156w).

measured(s1, contact_length_size_156w, v119w).

all_consistent(contact_length_size_156w) :-
    consistent(s1, contact_length_size_156w).

evidence(all_consistent(contact_length_size_156w)).
query(true_val(contact_length_size_156w, v119w)).
query(true_val(contact_length_size_156w, unk_contact_length_size_156w)).

% @attr contact_length_size_159w
% @type numeric
% @canonical false
% @original_name contact_length_size (159W)
% @unit cm
% @values v121w=121.0 unk_contact_length_size_159w=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_159w).

0.93::true_val(contact_length_size_159w, v121w); 0.07::true_val(contact_length_size_159w, unk_contact_length_size_159w).

measured(s1, contact_length_size_159w, v121w).

all_consistent(contact_length_size_159w) :-
    consistent(s1, contact_length_size_159w).

evidence(all_consistent(contact_length_size_159w)).
query(true_val(contact_length_size_159w, v121w)).
query(true_val(contact_length_size_159w, unk_contact_length_size_159w)).

% @attr contact_length_size_162w
% @type numeric
% @canonical false
% @original_name contact_length_size (162W)
% @unit cm
% @values v122=122.0 unk_contact_length_size_162w=Unknown
% @importance 1.0

0.93::acc(s1, contact_length_size_162w).

0.93::true_val(contact_length_size_162w, v122); 0.07::true_val(contact_length_size_162w, unk_contact_length_size_162w).

measured(s1, contact_length_size_162w, v122).

all_consistent(contact_length_size_162w) :-
    consistent(s1, contact_length_size_162w).

evidence(all_consistent(contact_length_size_162w)).
query(true_val(contact_length_size_162w, v122)).
query(true_val(contact_length_size_162w, unk_contact_length_size_162w)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size
% @unit m
% @values v8_2=8.2 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size).

0.93::true_val(sidecut_radius_size, v8_2); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, v8_2).

all_consistent(sidecut_radius_size) :-
    consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v8_2)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_size_147
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (147)
% @unit m
% @values v8_0=8.0 unk_sidecut_radius_size_147=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_147).

0.93::true_val(sidecut_radius_size_147, v8_0); 0.07::true_val(sidecut_radius_size_147, unk_sidecut_radius_size_147).

measured(s1, sidecut_radius_size_147, v8_0).

all_consistent(sidecut_radius_size_147) :-
    consistent(s1, sidecut_radius_size_147).

evidence(all_consistent(sidecut_radius_size_147)).
query(true_val(sidecut_radius_size_147, v8_0)).
query(true_val(sidecut_radius_size_147, unk_sidecut_radius_size_147)).

% @attr sidecut_radius_size_150
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (150)
% @unit m
% @values v8_1=8.1 unk_sidecut_radius_size_150=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_150).

0.93::true_val(sidecut_radius_size_150, v8_1); 0.07::true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150).

measured(s1, sidecut_radius_size_150, v8_1).

all_consistent(sidecut_radius_size_150) :-
    consistent(s1, sidecut_radius_size_150).

evidence(all_consistent(sidecut_radius_size_150)).
query(true_val(sidecut_radius_size_150, v8_1)).
query(true_val(sidecut_radius_size_150, unk_sidecut_radius_size_150)).

% @attr sidecut_radius_size_153
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (153)
% @unit m
% @values v8_2s=8.2 unk_sidecut_radius_size_153=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_153).

0.93::true_val(sidecut_radius_size_153, v8_2s); 0.07::true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153).

measured(s1, sidecut_radius_size_153, v8_2s).

all_consistent(sidecut_radius_size_153) :-
    consistent(s1, sidecut_radius_size_153).

evidence(all_consistent(sidecut_radius_size_153)).
query(true_val(sidecut_radius_size_153, v8_2s)).
query(true_val(sidecut_radius_size_153, unk_sidecut_radius_size_153)).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (159)
% @unit m
% @values v8_3=8.3 unk_sidecut_radius_size_159=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_159).

0.93::true_val(sidecut_radius_size_159, v8_3); 0.07::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s1, sidecut_radius_size_159, v8_3).

all_consistent(sidecut_radius_size_159) :-
    consistent(s1, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_3)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr sidecut_radius_size_156w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (156W)
% @unit m
% @values v8_3w=8.3 unk_sidecut_radius_size_156w=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_156w).

0.93::true_val(sidecut_radius_size_156w, v8_3w); 0.07::true_val(sidecut_radius_size_156w, unk_sidecut_radius_size_156w).

measured(s1, sidecut_radius_size_156w, v8_3w).

all_consistent(sidecut_radius_size_156w) :-
    consistent(s1, sidecut_radius_size_156w).

evidence(all_consistent(sidecut_radius_size_156w)).
query(true_val(sidecut_radius_size_156w, v8_3w)).
query(true_val(sidecut_radius_size_156w, unk_sidecut_radius_size_156w)).

% @attr sidecut_radius_size_159w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (159W)
% @unit m
% @values v8_3wl=8.3 unk_sidecut_radius_size_159w=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_159w).

0.93::true_val(sidecut_radius_size_159w, v8_3wl); 0.07::true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w).

measured(s1, sidecut_radius_size_159w, v8_3wl).

all_consistent(sidecut_radius_size_159w) :-
    consistent(s1, sidecut_radius_size_159w).

evidence(all_consistent(sidecut_radius_size_159w)).
query(true_val(sidecut_radius_size_159w, v8_3wl)).
query(true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w)).

% @attr sidecut_radius_size_162w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (162W)
% @unit m
% @values v8_4=8.4 unk_sidecut_radius_size_162w=Unknown
% @importance 1.0

0.93::acc(s1, sidecut_radius_size_162w).

0.93::true_val(sidecut_radius_size_162w, v8_4); 0.07::true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w).

measured(s1, sidecut_radius_size_162w, v8_4).

all_consistent(sidecut_radius_size_162w) :-
    consistent(s1, sidecut_radius_size_162w).

evidence(all_consistent(sidecut_radius_size_162w)).
query(true_val(sidecut_radius_size_162w, v8_4)).
query(true_val(sidecut_radius_size_162w, unk_sidecut_radius_size_162w)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size
% @unit inches
% @values r19_24_to_24=19.24-24 unk_stance_width_range_size=Unknown
% @importance 1.0

0.93::acc(s1, stance_width_range_size).

0.93::true_val(stance_width_range_size, r19_24_to_24); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, r19_24_to_24).

all_consistent(stance_width_range_size) :-
    consistent(s1, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r19_24_to_24)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_size_small
% @type categorical
% @canonical false
% @original_name stance_width_range_size (small)
% @unit inches
% @values r17_to_22=17-22 unk_stance_width_range_size_small=Unknown
% @importance 1.0

0.93::acc(s1, stance_width_range_size_small).

0.93::true_val(stance_width_range_size_small, r17_to_22); 0.07::true_val(stance_width_range_size_small, unk_stance_width_range_size_small).

measured(s1, stance_width_range_size_small, r17_to_22).

all_consistent(stance_width_range_size_small) :-
    consistent(s1, stance_width_range_size_small).

evidence(all_consistent(stance_width_range_size_small)).
query(true_val(stance_width_range_size_small, r17_to_22)).
query(true_val(stance_width_range_size_small, unk_stance_width_range_size_small)).

% @attr stance_width_range_size_large
% @type categorical
% @canonical false
% @original_name stance_width_range_size (large)
% @unit inches
% @values r20_25_to_25=20.25-25 unk_stance_width_range_size_large=Unknown
% @importance 1.0

0.93::acc(s1, stance_width_range_size_large).

0.93::true_val(stance_width_range_size_large, r20_25_to_25); 0.07::true_val(stance_width_range_size_large, unk_stance_width_range_size_large).

measured(s1, stance_width_range_size_large, r20_25_to_25).

all_consistent(stance_width_range_size_large) :-
    consistent(s1, stance_width_range_size_large).

evidence(all_consistent(stance_width_range_size_large)).
query(true_val(stance_width_range_size_large, r20_25_to_25)).
query(true_val(stance_width_range_size_large, unk_stance_width_range_size_large)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values w110_plus_lbs=110+lbs_50+kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.93::acc(s1, recommended_weight_range_size).

0.93::true_val(recommended_weight_range_size, w110_plus_lbs); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, w110_plus_lbs).

all_consistent(recommended_weight_range_size) :-
    consistent(s1, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w110_plus_lbs)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_size_147
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (147)
% @values w80_plus_lbs=80+lbs_35+kg unk_recommended_weight_range_size_147=Unknown
% @importance 1.0

0.93::acc(s1, recommended_weight_range_size_147).

0.93::true_val(recommended_weight_range_size_147, w80_plus_lbs); 0.07::true_val(recommended_weight_range_size_147, unk_recommended_weight_range_size_147).

measured(s1, recommended_weight_range_size_147, w80_plus_lbs).

all_consistent(recommended_weight_range_size_147) :-
    consistent(s1, recommended_weight_range_size_147).

evidence(all_consistent(recommended_weight_range_size_147)).
query(true_val(recommended_weight_range_size_147, w80_plus_lbs)).
query(true_val(recommended_weight_range_size_147, unk_recommended_weight_range_size_147)).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (150)
% @values w90_plus_lbs=90+lbs_40+kg unk_recommended_weight_range_size_150=Unknown
% @importance 1.0

0.93::acc(s1, recommended_weight_range_size_150).

0.93::true_val(recommended_weight_range_size_150, w90_plus_lbs); 0.07::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).

measured(s1, recommended_weight_range_size_150, w90_plus_lbs).

all_consistent(recommended_weight_range_size_150) :-
    consistent(s1, recommended_weight_range_size_150).

evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, w90_plus_lbs)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

% @attr recommended_weight_range_size_153
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (153)
% @values w100_plus_lbs=100+lbs_45+kg unk_recommended_weight_range_size_153=Unknown
% @importance 1.0

0.93::acc(s1, recommended_weight_range_size_153).

0.93::true_val(recommended_weight_range_size_153, w100_plus_lbs); 0.07::true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153).

measured(s1, recommended_weight_range_size_153, w100_plus_lbs).

all_consistent(recommended_weight_range_size_153) :-
    consistent(s1, recommended_weight_range_size_153).

evidence(all_consistent(recommended_weight_range_size_153)).
query(true_val(recommended_weight_range_size_153, w100_plus_lbs)).
query(true_val(recommended_weight_range_size_153, unk_recommended_weight_range_size_153)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159)
% @values w130_plus_lbs=130+lbs_60+kg unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.93::acc(s1, recommended_weight_range_size_159).

0.93::true_val(recommended_weight_range_size_159, w130_plus_lbs); 0.07::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s1, recommended_weight_range_size_159, w130_plus_lbs).

all_consistent(recommended_weight_range_size_159) :-
    consistent(s1, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, w130_plus_lbs)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr recommended_weight_range_size_156w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (156W)
% @values w110_plus_lbs_w=110+lbs_50+kg unk_recommended_weight_range_size_156w=Unknown
% @importance 1.0

0.93::acc(s1, recommended_weight_range_size_156w).

0.93::true_val(recommended_weight_range_size_156w, w110_plus_lbs_w); 0.07::true_val(recommended_weight_range_size_156w, unk_recommended_weight_range_size_156w).

measured(s1, recommended_weight_range_size_156w, w110_plus_lbs_w).

all_consistent(recommended_weight_range_size_156w) :-
    consistent(s1, recommended_weight_range_size_156w).

evidence(all_consistent(recommended_weight_range_size_156w)).
query(true_val(recommended_weight_range_size_156w, w110_plus_lbs_w)).
query(true_val(recommended_weight_range_size_156w, unk_recommended_weight_range_size_156w)).

% @attr recommended_weight_range_size_159w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159W)
% @values w130_plus_lbs_w=130+lbs_60+kg unk_recommended_weight_range_size_159w=Unknown
% @importance 1.0

0.93::acc(s1, recommended_weight_range_size_159w).

0.93::true_val(recommended_weight_range_size_159w, w130_plus_lbs_w); 0.07::true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w).

measured(s1, recommended_weight_range_size_159w, w130_plus_lbs_w).

all_consistent(recommended_weight_range_size_159w) :-
    consistent(s1, recommended_weight_range_size_159w).

evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, w130_plus_lbs_w)).
query(true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w)).

% @attr recommended_weight_range_size_162w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (162W)
% @values w140_plus_lbs=140+lbs_65+kg unk_recommended_weight_range_size_162w=Unknown
% @importance 1.0

0.93::acc(s1, recommended_weight_range_size_162w).

0.93::true_val(recommended_weight_range_size_162w, w140_plus_lbs); 0.07::true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w).

measured(s1, recommended_weight_range_size_162w, w140_plus_lbs).

all_consistent(recommended_weight_range_size_162w) :-
    consistent(s1, recommended_weight_range_size_162w).

evidence(all_consistent(recommended_weight_range_size_162w)).
query(true_val(recommended_weight_range_size_162w, w140_plus_lbs)).
query(true_val(recommended_weight_range_size_162w, unk_recommended_weight_range_size_162w)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.90::acc(s2, mounting_pattern).

0.90::true_val(mounting_pattern, inserts_2x4); 0.10::true_val(mounting_pattern, unk_mounting_pattern).

measured(s2, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s2), consistent(s2, mounting_pattern) ; \+indep(s2)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v4=4.0 v5=5.0
% @importance 0.975

0.60::acc(s2, flex_rating_10).
0.92::acc(s1, flex_rating_10).

0.35::true_val(flex_rating_10, v4); 0.65::true_val(flex_rating_10, v5).

measured(s2, flex_rating_10, v4).
measured(s1, flex_rating_10, v5).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    (indep(s2), consistent(s2, flex_rating_10) ; \+indep(s2)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v4)).
query(true_val(flex_rating_10, v5)).

% @attr flex_rating_10_manufacturer_153
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer (153)
% @unit /10
% @values v4_5=4.5 unk_flex_rating_10_manufacturer_153=Unknown
% @importance 1.0

0.93::acc(s1, flex_rating_10_manufacturer_153).

0.93::true_val(flex_rating_10_manufacturer_153, v4_5); 0.07::true_val(flex_rating_10_manufacturer_153, unk_flex_rating_10_manufacturer_153).

measured(s1, flex_rating_10_manufacturer_153, v4_5).

all_consistent(flex_rating_10_manufacturer_153) :-
    consistent(s1, flex_rating_10_manufacturer_153).

evidence(all_consistent(flex_rating_10_manufacturer_153)).
query(true_val(flex_rating_10_manufacturer_153, v4_5)).
query(true_val(flex_rating_10_manufacturer_153, unk_flex_rating_10_manufacturer_153)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @original_name flex_rating_10_manufacturer
% @unit /10
% @values v6=6.0 unk_flex_rating_10_manufacturer=Unknown
% @importance 1.0

0.93::acc(s1, flex_rating_10_manufacturer).

0.93::true_val(flex_rating_10_manufacturer, v6); 0.07::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s1, flex_rating_10_manufacturer, v6).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s1, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_rating_10_manufacturer_159
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer (159)
% @unit /10
% @values v5m=5.0 unk_flex_rating_10_manufacturer_159=Unknown
% @importance 1.0

0.93::acc(s1, flex_rating_10_manufacturer_159).

0.93::true_val(flex_rating_10_manufacturer_159, v5m); 0.07::true_val(flex_rating_10_manufacturer_159, unk_flex_rating_10_manufacturer_159).

measured(s1, flex_rating_10_manufacturer_159, v5m).

all_consistent(flex_rating_10_manufacturer_159) :-
    consistent(s1, flex_rating_10_manufacturer_159).

evidence(all_consistent(flex_rating_10_manufacturer_159)).
query(true_val(flex_rating_10_manufacturer_159, v5m)).
query(true_val(flex_rating_10_manufacturer_159, unk_flex_rating_10_manufacturer_159)).

% @attr flex_rating_10_manufacturer_159w
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer (159W)
% @unit /10
% @values v6w=6.0 unk_flex_rating_10_manufacturer_159w=Unknown
% @importance 1.0

0.93::acc(s1, flex_rating_10_manufacturer_159w).

0.93::true_val(flex_rating_10_manufacturer_159w, v6w); 0.07::true_val(flex_rating_10_manufacturer_159w, unk_flex_rating_10_manufacturer_159w).

measured(s1, flex_rating_10_manufacturer_159w, v6w).

all_consistent(flex_rating_10_manufacturer_159w) :-
    consistent(s1, flex_rating_10_manufacturer_159w).

evidence(all_consistent(flex_rating_10_manufacturer_159w)).
query(true_val(flex_rating_10_manufacturer_159w, v6w)).
query(true_val(flex_rating_10_manufacturer_159w, unk_flex_rating_10_manufacturer_159w)).

% @attr flex_rating_10_manufacturer_162w
% @type numeric
% @canonical false
% @original_name flex_rating_10_manufacturer (162W)
% @unit /10
% @values v7=7.0 unk_flex_rating_10_manufacturer_162w=Unknown
% @importance 1.0

0.93::acc(s1, flex_rating_10_manufacturer_162w).

0.93::true_val(flex_rating_10_manufacturer_162w, v7); 0.07::true_val(flex_rating_10_manufacturer_162w, unk_flex_rating_10_manufacturer_162w).

measured(s1, flex_rating_10_manufacturer_162w, v7).

all_consistent(flex_rating_10_manufacturer_162w) :-
    consistent(s1, flex_rating_10_manufacturer_162w).

evidence(all_consistent(flex_rating_10_manufacturer_162w)).
query(true_val(flex_rating_10_manufacturer_162w, v7)).
query(true_val(flex_rating_10_manufacturer_162w, unk_flex_rating_10_manufacturer_162w)).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values medium_soft=Medium-Soft unk_flex_feel=Unknown
% @importance 0.85

0.78::acc(s50, flex_feel).

0.75::true_val(flex_feel, medium_soft); 0.25::true_val(flex_feel, unk_flex_feel).

measured(s50, flex_feel, medium_soft).

all_consistent(flex_feel) :-
    (indep(s50), consistent(s50, flex_feel) ; \+indep(s50)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, medium_soft)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values medium=Medium unk_flex_rating_10_evo=Unknown
% @importance 0.75

0.80::acc(s10, flex_rating_10_evo).

0.80::true_val(flex_rating_10_evo, medium); 0.20::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s10, flex_rating_10_evo, medium).

all_consistent(flex_rating_10_evo) :-
    (indep(s10), consistent(s10, flex_rating_10_evo) ; \+indep(s10)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, medium)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values ob_btx_hybrid=OB_Original_Banana_BTX_Hybrid unk_camber_type=Unknown
% @importance 0.93

0.95::acc(s1, camber_type).
0.85::acc(s2, camber_type).
0.83::acc(s10, camber_type).

0.97::true_val(camber_type, ob_btx_hybrid); 0.03::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, ob_btx_hybrid).
measured(s2, camber_type, ob_btx_hybrid).
measured(s10, camber_type, ob_btx_hybrid).

all_consistent(camber_type) :-
    consistent(s1, camber_type),
    (indep(s2), consistent(s2, camber_type) ; \+indep(s2)),
    (indep(s10), consistent(s10, camber_type) ; \+indep(s10)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, ob_btx_hybrid)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values mild_rocker_camber_tips=Mild_rocker_between_feet_mild_camber_to_tips unk_camber_description=Unknown
% @importance 0.85

0.93::acc(s1, camber_description).
0.88::acc(s7, camber_description).
0.82::acc(s2, camber_description).
0.80::acc(s10, camber_description).

0.96::true_val(camber_description, mild_rocker_camber_tips); 0.04::true_val(camber_description, unk_camber_description).

measured(s1, camber_description, mild_rocker_camber_tips).
measured(s7, camber_description, mild_rocker_camber_tips).
measured(s2, camber_description, mild_rocker_camber_tips).
measured(s10, camber_description, mild_rocker_camber_tips).

all_consistent(camber_description) :-
    consistent(s1, camber_description),
    consistent(s7, camber_description),
    (indep(s2), consistent(s2, camber_description) ; \+indep(s2)),
    (indep(s10), consistent(s10, camber_description) ; \+indep(s10)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, mild_rocker_camber_tips)).
query(true_val(camber_description, unk_camber_description)).

% @attr catch_free_design
% @type categorical
% @canonical false
% @original_name Catch-free design
% @values yes_catch_free=Yes_catch_free_carvy_floaty unk_catch_free_design=Unknown
% @importance 0.85

0.93::acc(s1, catch_free_design).
0.82::acc(s2, catch_free_design).

0.95::true_val(catch_free_design, yes_catch_free); 0.05::true_val(catch_free_design, unk_catch_free_design).

measured(s1, catch_free_design, yes_catch_free).
measured(s2, catch_free_design, yes_catch_free).

all_consistent(catch_free_design) :-
    consistent(s1, catch_free_design),
    (indep(s2), consistent(s2, catch_free_design) ; \+indep(s2)).

evidence(all_consistent(catch_free_design)).
query(true_val(catch_free_design, yes_catch_free)).
query(true_val(catch_free_design, unk_catch_free_design)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values g_lite_1=G_Lite_1_Core unk_core_material=Unknown
% @importance 0.85

0.88::acc(s2, core_material).
0.82::acc(s10, core_material).

0.95::true_val(core_material, g_lite_1); 0.05::true_val(core_material, unk_core_material).

measured(s2, core_material, g_lite_1).
measured(s10, core_material, g_lite_1).

all_consistent(core_material) :-
    (indep(s2), consistent(s2, core_material) ; \+indep(s2)),
    (indep(s10), consistent(s10, core_material) ; \+indep(s10)).

evidence(all_consistent(core_material)).
query(true_val(core_material, g_lite_1)).
query(true_val(core_material, unk_core_material)).

% @attr core_wood_species
% @type categorical
% @canonical false
% @original_name core_material (wood species)
% @values poplar_paulownia=Poplar_and_Paulownia aspen_paulownia=Aspen_and_Paulownia
% @importance 0.85

0.85::acc(s2, core_wood_species).
0.72::acc(s120, core_wood_species).
0.75::acc(s50, core_wood_species).

0.60::true_val(core_wood_species, poplar_paulownia); 0.40::true_val(core_wood_species, aspen_paulownia).

measured(s2, core_wood_species, poplar_paulownia).
measured(s120, core_wood_species, aspen_paulownia).
measured(s50, core_wood_species, aspen_paulownia).

all_consistent(core_wood_species) :-
    (indep(s2), consistent(s2, core_wood_species) ; \+indep(s2)),
    (indep(s120), consistent(s120, core_wood_species) ; \+indep(s120)),
    (indep(s50), consistent(s50, core_wood_species) ; \+indep(s50)).

evidence(all_consistent(core_wood_species)).
query(true_val(core_wood_species, poplar_paulownia)).
query(true_val(core_wood_species, aspen_paulownia)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values fsc_certified_core=FSC_certified_core_wood unk_sustainability_certification=Unknown
% @importance 0.82

0.85::acc(s2, sustainability_certification).
0.80::acc(s50, sustainability_certification).
0.72::acc(s120, sustainability_certification).

0.95::true_val(sustainability_certification, fsc_certified_core); 0.05::true_val(sustainability_certification, unk_sustainability_certification).

measured(s2, sustainability_certification, fsc_certified_core).
measured(s50, sustainability_certification, fsc_certified_core).
measured(s120, sustainability_certification, fsc_certified_core).

all_consistent(sustainability_certification) :-
    (indep(s2), consistent(s2, sustainability_certification) ; \+indep(s2)),
    (indep(s50), consistent(s50, sustainability_certification) ; \+indep(s50)),
    (indep(s120), consistent(s120, sustainability_certification) ; \+indep(s120)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, fsc_certified_core)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values tri_ax_bi_ax=Tri-Ax_Bi-Ax_Fiber_alloy_glass unk_laminate=Unknown
% @importance 0.90

0.85::acc(s2, laminate).

0.88::true_val(laminate, tri_ax_bi_ax); 0.12::true_val(laminate, unk_laminate).

measured(s2, laminate, tri_ax_bi_ax).

all_consistent(laminate) :-
    (indep(s2), consistent(s2, laminate) ; \+indep(s2)).

evidence(all_consistent(laminate)).
query(true_val(laminate, tri_ax_bi_ax)).
query(true_val(laminate, unk_laminate)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values eco_sublimated_poly=Eco_Sublimated_Poly_Topsheet unk_topsheet=Unknown
% @importance 0.90

0.93::acc(s1, topsheet).
0.85::acc(s10, topsheet).
0.85::acc(s2, topsheet).

0.96::true_val(topsheet, eco_sublimated_poly); 0.04::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, eco_sublimated_poly).
measured(s10, topsheet, eco_sublimated_poly).
measured(s2, topsheet, eco_sublimated_poly).

all_consistent(topsheet) :-
    consistent(s1, topsheet),
    (indep(s10), consistent(s10, topsheet) ; \+indep(s10)),
    (indep(s2), consistent(s2, topsheet) ; \+indep(s2)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, eco_sublimated_poly)).
query(true_val(topsheet, unk_topsheet)).

% @attr topsheet_appearance_description
% @type categorical
% @canonical false
% @original_name topsheet_appearance_description
% @values tough_eco=Tough_and_environmentally_nice unk_topsheet_appearance_description=Unknown
% @importance 0.80

0.78::acc(s10, topsheet_appearance_description).

0.75::true_val(topsheet_appearance_description, tough_eco); 0.25::true_val(topsheet_appearance_description, unk_topsheet_appearance_description).

measured(s10, topsheet_appearance_description, tough_eco).

all_consistent(topsheet_appearance_description) :-
    (indep(s10), consistent(s10, topsheet_appearance_description) ; \+indep(s10)).

evidence(all_consistent(topsheet_appearance_description)).
query(true_val(topsheet_appearance_description, tough_eco)).
query(true_val(topsheet_appearance_description, unk_topsheet_appearance_description)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values uhmw=UHMW_Polyethylene unk_sidewall_material=Unknown
% @importance 0.87

0.88::acc(s2, sidewall_material).

0.90::true_val(sidewall_material, uhmw); 0.10::true_val(sidewall_material, unk_sidewall_material).

measured(s2, sidewall_material, uhmw).

all_consistent(sidewall_material) :-
    (indep(s2), consistent(s2, sidewall_material) ; \+indep(s2)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, uhmw)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr tip_tail_protection
% @type categorical
% @canonical false
% @original_name Tip/tail protection
% @values uhmw_deflection=UHMW_Tip_Tail_Impact_Deflection unk_tip_tail_protection=Unknown
% @importance 0.75

0.78::acc(s120, tip_tail_protection).

0.72::true_val(tip_tail_protection, uhmw_deflection); 0.28::true_val(tip_tail_protection, unk_tip_tail_protection).

measured(s120, tip_tail_protection, uhmw_deflection).

all_consistent(tip_tail_protection) :-
    (indep(s120), consistent(s120, tip_tail_protection) ; \+indep(s120)).

evidence(all_consistent(tip_tail_protection)).
query(true_val(tip_tail_protection, uhmw_deflection)).
query(true_val(tip_tail_protection, unk_tip_tail_protection)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values extruded=Extruded_Eco_Knife_Cut_Co-Ex sintered=Sintered_Knife_Cut_Co-Ex
% @importance 0.85

0.85::acc(s2, base_type).
0.78::acc(s50, base_type).
0.82::acc(s10, base_type).
0.72::acc(s118, base_type).

0.60::true_val(base_type, extruded); 0.40::true_val(base_type, sintered).

measured(s2, base_type, extruded).
measured(s50, base_type, extruded).
measured(s10, base_type, sintered).
measured(s118, base_type, sintered).

all_consistent(base_type) :-
    (indep(s2), consistent(s2, base_type) ; \+indep(s2)),
    (indep(s50), consistent(s50, base_type) ; \+indep(s50)),
    (indep(s10), consistent(s10, base_type) ; \+indep(s10)),
    (indep(s118), consistent(s118, base_type) ; \+indep(s118)).

evidence(all_consistent(base_type)).
query(true_val(base_type, extruded)).
query(true_val(base_type, sintered)).

% @attr base_colour_note
% @type categorical
% @canonical false
% @original_name Base colour note
% @values random=Base_colours_are_random unk_base_colour_note=Unknown
% @importance 0.85

0.82::acc(s2, base_colour_note).

0.80::true_val(base_colour_note, random); 0.20::true_val(base_colour_note, unk_base_colour_note).

measured(s2, base_colour_note, random).

all_consistent(base_colour_note) :-
    (indep(s2), consistent(s2, base_colour_note) ; \+indep(s2)).

evidence(all_consistent(base_colour_note)).
query(true_val(base_colour_note, random)).
query(true_val(base_colour_note, unk_base_colour_note)).

% @attr edge_technology
% @type categorical
% @canonical false
% @original_name edge_technology
% @values magne_traction_7=Magne-Traction_7_serrations unk_edge_technology=Unknown
% @importance 0.88

0.95::acc(s1, edge_technology).
0.88::acc(s7, edge_technology).
0.82::acc(s2, edge_technology).

0.97::true_val(edge_technology, magne_traction_7); 0.03::true_val(edge_technology, unk_edge_technology).

measured(s1, edge_technology, magne_traction_7).
measured(s7, edge_technology, magne_traction_7).
measured(s2, edge_technology, magne_traction_7).

all_consistent(edge_technology) :-
    consistent(s1, edge_technology),
    consistent(s7, edge_technology),
    (indep(s2), consistent(s2, edge_technology) ; \+indep(s2)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values serrated_ice_hardpack=Serrated_steak_knife_unreal_edge_hold unk_edge_hold=Unknown
% @importance 0.85

0.90::acc(s7, edge_hold).
0.88::acc(s1, edge_hold).
0.80::acc(s10, edge_hold).

0.95::true_val(edge_hold, serrated_ice_hardpack); 0.05::true_val(edge_hold, unk_edge_hold).

measured(s7, edge_hold, serrated_ice_hardpack).
measured(s1, edge_hold, serrated_ice_hardpack).
measured(s10, edge_hold, serrated_ice_hardpack).

all_consistent(edge_hold) :-
    consistent(s7, edge_hold),
    consistent(s1, edge_hold),
    (indep(s10), consistent(s10, edge_hold) ; \+indep(s10)).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, serrated_ice_hardpack)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr factory_tuned
% @type categorical
% @canonical false
% @original_name Factory tuned
% @values yes_waxed_ready=Yes_waxed_and_ready unk_factory_tuned=Unknown
% @importance 0.75

0.78::acc(s120, factory_tuned).

0.72::true_val(factory_tuned, yes_waxed_ready); 0.28::true_val(factory_tuned, unk_factory_tuned).

measured(s120, factory_tuned, yes_waxed_ready).

all_consistent(factory_tuned) :-
    (indep(s120), consistent(s120, factory_tuned) ; \+indep(s120)).

evidence(all_consistent(factory_tuned)).
query(true_val(factory_tuned, yes_waxed_ready)).
query(true_val(factory_tuned, unk_factory_tuned)).

% @attr sustainability_zero_waste
% @type categorical
% @canonical false
% @original_name sustainability_certification (zero hazardous waste)
% @values zero_hazardous_waste=Zero_hazardous_waste unk_sustainability_zero_waste=Unknown
% @importance 0.62

0.90::acc(s7, sustainability_zero_waste).
0.88::acc(s22, sustainability_zero_waste).
0.85::acc(s23, sustainability_zero_waste).

0.96::true_val(sustainability_zero_waste, zero_hazardous_waste); 0.04::true_val(sustainability_zero_waste, unk_sustainability_zero_waste).

measured(s7, sustainability_zero_waste, zero_hazardous_waste).
measured(s22, sustainability_zero_waste, zero_hazardous_waste).
measured(s23, sustainability_zero_waste, zero_hazardous_waste).

all_consistent(sustainability_zero_waste) :-
    consistent(s7, sustainability_zero_waste),
    consistent(s22, sustainability_zero_waste),
    consistent(s23, sustainability_zero_waste).

evidence(all_consistent(sustainability_zero_waste)).
query(true_val(sustainability_zero_waste, zero_hazardous_waste)).
query(true_val(sustainability_zero_waste, unk_sustainability_zero_waste)).

% @attr sustainability_water_solvents
% @type categorical
% @canonical false
% @original_name sustainability_certification (water-based solvents)
% @values water_based=Water_based_solvents unk_sustainability_water_solvents=Unknown
% @importance 0.50

0.78::acc(s99, sustainability_water_solvents).

0.72::true_val(sustainability_water_solvents, water_based); 0.28::true_val(sustainability_water_solvents, unk_sustainability_water_solvents).

measured(s99, sustainability_water_solvents, water_based).

all_consistent(sustainability_water_solvents) :-
    consistent(s99, sustainability_water_solvents).

evidence(all_consistent(sustainability_water_solvents)).
query(true_val(sustainability_water_solvents, water_based)).
query(true_val(sustainability_water_solvents, unk_sustainability_water_solvents)).

% @attr sustainability_renewable_forest
% @type categorical
% @canonical false
% @original_name sustainability_certification (renewable forest products)
% @values renewable_forest=Fast_growing_renewable_forest unk_sustainability_renewable_forest=Unknown
% @importance 0.50

0.78::acc(s99, sustainability_renewable_forest).

0.72::true_val(sustainability_renewable_forest, renewable_forest); 0.28::true_val(sustainability_renewable_forest, unk_sustainability_renewable_forest).

measured(s99, sustainability_renewable_forest, renewable_forest).

all_consistent(sustainability_renewable_forest) :-
    consistent(s99, sustainability_renewable_forest).

evidence(all_consistent(sustainability_renewable_forest)).
query(true_val(sustainability_renewable_forest, renewable_forest)).
query(true_val(sustainability_renewable_forest, unk_sustainability_renewable_forest)).

% @attr handbuilt_claim
% @type categorical
% @canonical false
% @original_name Handbuilt claim
% @values handmade_usa=Handmade_by_snowboarders_in_USA unk_handbuilt_claim=Unknown
% @importance 0.50

0.80::acc(s99, handbuilt_claim).
0.78::acc(s102, handbuilt_claim).

0.82::true_val(handbuilt_claim, handmade_usa); 0.18::true_val(handbuilt_claim, unk_handbuilt_claim).

measured(s99, handbuilt_claim, handmade_usa).
measured(s102, handbuilt_claim, handmade_usa).

all_consistent(handbuilt_claim) :-
    consistent(s99, handbuilt_claim),
    consistent(s102, handbuilt_claim).

evidence(all_consistent(handbuilt_claim)).
query(true_val(handbuilt_claim, handmade_usa)).
query(true_val(handbuilt_claim, unk_handbuilt_claim)).

% @attr construction_process
% @type categorical
% @canonical false
% @original_name Construction process
% @values wet_laminated_epoxy=Wet_laminated_proprietary_epoxy_custom_formblocks unk_construction_process=Unknown
% @importance 0.50

0.85::acc(s23, construction_process).

0.82::true_val(construction_process, wet_laminated_epoxy); 0.18::true_val(construction_process, unk_construction_process).

measured(s23, construction_process, wet_laminated_epoxy).

all_consistent(construction_process) :-
    consistent(s23, construction_process).

evidence(all_consistent(construction_process)).
query(true_val(construction_process, wet_laminated_epoxy)).
query(true_val(construction_process, unk_construction_process)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner_intermediate=Beginner-Intermediate unk_rider_level=Unknown
% @importance 0.86

0.85::acc(s2, rider_level).
0.83::acc(s10, rider_level).
0.82::acc(s10, rider_level).

0.95::true_val(rider_level, beginner_intermediate); 0.05::true_val(rider_level, unk_rider_level).

measured(s2, rider_level, beginner_intermediate).
measured(s10, rider_level, beginner_intermediate).

all_consistent(rider_level) :-
    (indep(s2), consistent(s2, rider_level) ; \+indep(s2)),
    (indep(s10), consistent(s10, rider_level) ; \+indep(s10)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical false
% @original_name skill_level_recommendation
% @values first_time_to_intermediate=First_time_to_intermediate_out_of_rentals unk_skill_level_recommendation=Unknown
% @importance 0.85

0.82::acc(s2, skill_level_recommendation).

0.80::true_val(skill_level_recommendation, first_time_to_intermediate); 0.20::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s2, skill_level_recommendation, first_time_to_intermediate).

all_consistent(skill_level_recommendation) :-
    (indep(s2), consistent(s2, skill_level_recommendation) ; \+indep(s2)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, first_time_to_intermediate)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values resort_freestyle_all_mountain=Resort_freestyle_all_mountain unk_terrain_suitability=Unknown
% @importance 0.83

0.92::acc(s1, terrain_suitability).
0.80::acc(s3, terrain_suitability).
0.83::acc(s10, terrain_suitability).

0.96::true_val(terrain_suitability, resort_freestyle_all_mountain); 0.04::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, resort_freestyle_all_mountain).
measured(s3, terrain_suitability, resort_freestyle_all_mountain).
measured(s10, terrain_suitability, resort_freestyle_all_mountain).

all_consistent(terrain_suitability) :-
    consistent(s1, terrain_suitability),
    consistent(s3, terrain_suitability),
    (indep(s10), consistent(s10, terrain_suitability) ; \+indep(s10)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, resort_freestyle_all_mountain)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freestyle_park_groomers_powder_jib=Freestyle_park_groomers_powder_jibbing unk_riding_style=Unknown
% @importance 0.925

0.92::acc(s1, riding_style).
0.83::acc(s10, riding_style).

0.95::true_val(riding_style, freestyle_park_groomers_powder_jib); 0.05::true_val(riding_style, unk_riding_style).

measured(s1, riding_style, freestyle_park_groomers_powder_jib).
measured(s10, riding_style, freestyle_park_groomers_powder_jib).

all_consistent(riding_style) :-
    consistent(s1, riding_style),
    (indep(s10), consistent(s10, riding_style) ; \+indep(s10)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freestyle_park_groomers_powder_jib)).
query(true_val(riding_style, unk_riding_style)).

% @attr use_case_evo
% @type categorical
% @canonical false
% @original_name Use case (evo)
% @values boost_slash_spin_send=Built_to_boost_slash_spin_send unk_use_case_evo=Unknown
% @importance 0.85

0.80::acc(s10, use_case_evo).

0.78::true_val(use_case_evo, boost_slash_spin_send); 0.22::true_val(use_case_evo, unk_use_case_evo).

measured(s10, use_case_evo, boost_slash_spin_send).

all_consistent(use_case_evo) :-
    (indep(s10), consistent(s10, use_case_evo) ; \+indep(s10)).

evidence(all_consistent(use_case_evo)).
query(true_val(use_case_evo, boost_slash_spin_send)).
query(true_val(use_case_evo, unk_use_case_evo)).

% @attr turn_initiation_performance
% @type categorical
% @canonical false
% @original_name turn_initiation_performance
% @values easy_catch_free=Easy_and_catch_free unk_turn_initiation_performance=Unknown
% @importance 0.925

0.92::acc(s1, turn_initiation_performance).
0.78::acc(s50, turn_initiation_performance).

0.93::true_val(turn_initiation_performance, easy_catch_free); 0.07::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s1, turn_initiation_performance, easy_catch_free).
measured(s50, turn_initiation_performance, easy_catch_free).

all_consistent(turn_initiation_performance) :-
    consistent(s1, turn_initiation_performance),
    (indep(s50), consistent(s50, turn_initiation_performance) ; \+indep(s50)).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, easy_catch_free)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr float_performance
% @type categorical
% @canonical false
% @original_name Float
% @values natural_float_powder=Natural_float_in_powder unk_float_performance=Unknown
% @importance 0.85

0.78::acc(s50, float_performance).

0.75::true_val(float_performance, natural_float_powder); 0.25::true_val(float_performance, unk_float_performance).

measured(s50, float_performance, natural_float_powder).

all_consistent(float_performance) :-
    (indep(s50), consistent(s50, float_performance) ; \+indep(s50)).

evidence(all_consistent(float_performance)).
query(true_val(float_performance, natural_float_powder)).
query(true_val(float_performance, unk_float_performance)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values lively_poppy=Lively_and_poppy unk_pop=Unknown
% @importance 0.85

0.92::acc(s1, pop).
0.82::acc(s2, pop).

0.93::true_val(pop, lively_poppy); 0.07::true_val(pop, unk_pop).

measured(s1, pop, lively_poppy).
measured(s2, pop, lively_poppy).

all_consistent(pop) :-
    consistent(s1, pop),
    (indep(s2), consistent(s2, pop) ; \+indep(s2)).

evidence(all_consistent(pop)).
query(true_val(pop, lively_poppy)).
query(true_val(pop, unk_pop)).

% @attr chatter_performance
% @type categorical
% @canonical false
% @original_name chatter_performance
% @values nerve_wracking_at_speed=Nerve_wracking_at_speed unk_chatter_performance=Unknown
% @importance 0.70

0.62::acc(s48, chatter_performance).

0.52::true_val(chatter_performance, nerve_wracking_at_speed); 0.48::true_val(chatter_performance, unk_chatter_performance).

measured(s48, chatter_performance, nerve_wracking_at_speed).

all_consistent(chatter_performance) :-
    (indep(s48), consistent(s48, chatter_performance) ; \+indep(s48)).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, nerve_wracking_at_speed)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values fast_low_maintenance=Fast_and_low_maintenance unk_base_glide_performance=Unknown
% @importance 0.875

0.90::acc(s1, base_glide_performance).

0.88::true_val(base_glide_performance, fast_low_maintenance); 0.12::true_val(base_glide_performance, unk_base_glide_performance).

measured(s1, base_glide_performance, fast_low_maintenance).

all_consistent(base_glide_performance) :-
    consistent(s1, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, fast_low_maintenance)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr base_maintenance
% @type categorical
% @canonical false
% @original_name Base maintenance
% @values low_maintenance_easy_repair=Low_maintenance_easy_to_repair unk_base_maintenance=Unknown
% @importance 0.80

0.72::acc(s41, base_maintenance).
0.75::acc(s50, base_maintenance).

0.80::true_val(base_maintenance, low_maintenance_easy_repair); 0.20::true_val(base_maintenance, unk_base_maintenance).

measured(s41, base_maintenance, low_maintenance_easy_repair).
measured(s50, base_maintenance, low_maintenance_easy_repair).

all_consistent(base_maintenance) :-
    (indep(s41), consistent(s41, base_maintenance) ; \+indep(s41)),
    (indep(s50), consistent(s50, base_maintenance) ; \+indep(s50)).

evidence(all_consistent(base_maintenance)).
query(true_val(base_maintenance, low_maintenance_easy_repair)).
query(true_val(base_maintenance, unk_base_maintenance)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v1=1.0 unk_warranty_period_years=Unknown
% @importance 0.85

0.95::acc(s82, warranty_period_years).
0.95::acc(s83, warranty_period_years).
0.95::acc(s84, warranty_period_years).

0.97::true_val(warranty_period_years, v1); 0.03::true_val(warranty_period_years, unk_warranty_period_years).

measured(s82, warranty_period_years, v1).
measured(s83, warranty_period_years, v1).
measured(s84, warranty_period_years, v1).

all_consistent(warranty_period_years) :-
    consistent(s82, warranty_period_years),
    consistent(s83, warranty_period_years),
    consistent(s84, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values defects_materials_workmanship=Defects_in_materials_and_workmanship unk_warranty=Unknown
% @importance 0.85

0.95::acc(s83, warranty).
0.95::acc(s84, warranty).

0.97::true_val(warranty, defects_materials_workmanship); 0.03::true_val(warranty, unk_warranty).

measured(s83, warranty, defects_materials_workmanship).
measured(s84, warranty, defects_materials_workmanship).

all_consistent(warranty) :-
    consistent(s83, warranty),
    consistent(s84, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, defects_materials_workmanship)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty (exclusions)
% @values no_wear_abuse_cosmetic=No_wear_tear_abuse_misuse_impacts_cosmetic_mods unk_warranty_exclusions=Unknown
% @importance 0.85

0.95::acc(s82, warranty_exclusions).

0.95::true_val(warranty_exclusions, no_wear_abuse_cosmetic); 0.05::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s82, warranty_exclusions, no_wear_abuse_cosmetic).

all_consistent(warranty_exclusions) :-
    consistent(s82, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, no_wear_abuse_cosmetic)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr warranty_receipt_requirement
% @type categorical
% @canonical false
% @original_name warranty (receipt requirement)
% @values receipt_authorized_dealer=Must_have_receipt_from_authorized_dealer unk_warranty_receipt_requirement=Unknown
% @importance 0.85

0.95::acc(s83, warranty_receipt_requirement).

0.95::true_val(warranty_receipt_requirement, receipt_authorized_dealer); 0.05::true_val(warranty_receipt_requirement, unk_warranty_receipt_requirement).

measured(s83, warranty_receipt_requirement, receipt_authorized_dealer).

all_consistent(warranty_receipt_requirement) :-
    consistent(s83, warranty_receipt_requirement).

evidence(all_consistent(warranty_receipt_requirement)).
query(true_val(warranty_receipt_requirement, receipt_authorized_dealer)).
query(true_val(warranty_receipt_requirement, unk_warranty_receipt_requirement)).

% @attr warranty_unauthorized_void
% @type categorical
% @canonical false
% @original_name warranty (unauthorized dealers void)
% @values void_ebay_craigslist=Void_if_from_unauthorized_eBay_Craigslist unk_warranty_unauthorized_void=Unknown
% @importance 0.825

0.95::acc(s83, warranty_unauthorized_void).
0.95::acc(s85, warranty_unauthorized_void).

0.97::true_val(warranty_unauthorized_void, void_ebay_craigslist); 0.03::true_val(warranty_unauthorized_void, unk_warranty_unauthorized_void).

measured(s83, warranty_unauthorized_void, void_ebay_craigslist).
measured(s85, warranty_unauthorized_void, void_ebay_craigslist).

all_consistent(warranty_unauthorized_void) :-
    consistent(s83, warranty_unauthorized_void),
    consistent(s85, warranty_unauthorized_void).

evidence(all_consistent(warranty_unauthorized_void)).
query(true_val(warranty_unauthorized_void, void_ebay_craigslist)).
query(true_val(warranty_unauthorized_void, unk_warranty_unauthorized_void)).

% @attr customer_service_email
% @type categorical
% @canonical false
% @original_name Customer service email
% @values orders_at_mervin=orders_at_mervin_dot_com unk_customer_service_email=Unknown
% @importance 1.0

0.93::acc(s1, customer_service_email).

0.93::true_val(customer_service_email, orders_at_mervin); 0.07::true_val(customer_service_email, unk_customer_service_email).

measured(s1, customer_service_email, orders_at_mervin).

all_consistent(customer_service_email) :-
    consistent(s1, customer_service_email).

evidence(all_consistent(customer_service_email)).
query(true_val(customer_service_email, orders_at_mervin)).
query(true_val(customer_service_email, unk_customer_service_email)).

% @attr gnu_review_rating
% @type categorical
% @canonical false
% @original_name gnu.com review rating
% @values pct_100_1_review=100pct_1_review unk_gnu_review_rating=Unknown
% @importance 1.0

0.70::acc(s1, gnu_review_rating).

0.68::true_val(gnu_review_rating, pct_100_1_review); 0.32::true_val(gnu_review_rating, unk_gnu_review_rating).

measured(s1, gnu_review_rating, pct_100_1_review).

all_consistent(gnu_review_rating) :-
    consistent(s1, gnu_review_rating).

evidence(all_consistent(gnu_review_rating)).
query(true_val(gnu_review_rating, pct_100_1_review)).
query(true_val(gnu_review_rating, unk_gnu_review_rating)).

% @attr board_of_world_assessment
% @type categorical
% @canonical false
% @original_name Board of the World assessment
% @values new_beginner_2026_cruise_resort=New_beginner_board_2026_cruise_resort unk_board_of_world_assessment=Unknown
% @importance 0.85

0.82::acc(s75, board_of_world_assessment).

0.80::true_val(board_of_world_assessment, new_beginner_2026_cruise_resort); 0.20::true_val(board_of_world_assessment, unk_board_of_world_assessment).

measured(s75, board_of_world_assessment, new_beginner_2026_cruise_resort).

all_consistent(board_of_world_assessment) :-
    consistent(s75, board_of_world_assessment).

evidence(all_consistent(board_of_world_assessment)).
query(true_val(board_of_world_assessment, new_beginner_2026_cruise_resort)).
query(true_val(board_of_world_assessment, unk_board_of_world_assessment)).

% @attr youtube_review_board_archive
% @type categorical
% @canonical false
% @original_name YouTube review (Board Archive)
% @values no_nonsense_am_freestyle=No_nonsense_all_mountain_freestyle unk_youtube_review_board_archive=Unknown
% @importance 0.65

0.60::acc(s13, youtube_review_board_archive).

0.52::true_val(youtube_review_board_archive, no_nonsense_am_freestyle); 0.48::true_val(youtube_review_board_archive, unk_youtube_review_board_archive).

measured(s13, youtube_review_board_archive, no_nonsense_am_freestyle).

all_consistent(youtube_review_board_archive) :-
    consistent(s13, youtube_review_board_archive).

evidence(all_consistent(youtube_review_board_archive)).
query(true_val(youtube_review_board_archive, no_nonsense_am_freestyle)).
query(true_val(youtube_review_board_archive, unk_youtube_review_board_archive)).

% @attr blauer_characterization
% @type categorical
% @canonical false
% @original_name Blauer Board Shop characterization
% @values am_progression_simple=All_Mountain_Progression_Made_Simple unk_blauer_characterization=Unknown
% @importance 0.85

0.78::acc(s50, blauer_characterization).

0.75::true_val(blauer_characterization, am_progression_simple); 0.25::true_val(blauer_characterization, unk_blauer_characterization).

measured(s50, blauer_characterization, am_progression_simple).

all_consistent(blauer_characterization) :-
    (indep(s50), consistent(s50, blauer_characterization) ; \+indep(s50)).

evidence(all_consistent(blauer_characterization)).
query(true_val(blauer_characterization, am_progression_simple)).
query(true_val(blauer_characterization, unk_blauer_characterization)).

% @attr speck_sports_assessment
% @type categorical
% @canonical false
% @original_name Speck Sports assessment
% @values ideal_improve_fun_value=Ideal_improve_fun_excellent_value unk_speck_sports_assessment=Unknown
% @importance 0.70

0.68::acc(s70, speck_sports_assessment).

0.62::true_val(speck_sports_assessment, ideal_improve_fun_value); 0.38::true_val(speck_sports_assessment, unk_speck_sports_assessment).

measured(s70, speck_sports_assessment, ideal_improve_fun_value).

all_consistent(speck_sports_assessment) :-
    (indep(s70), consistent(s70, speck_sports_assessment) ; \+indep(s70)).

evidence(all_consistent(speck_sports_assessment)).
query(true_val(speck_sports_assessment, ideal_improve_fun_value)).
query(true_val(speck_sports_assessment, unk_speck_sports_assessment)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values magne_traction_best_edge=Magne_Traction_best_edge_hold_tech unk_user_review_forum=Unknown
% @importance 0.75

0.55::acc(s74, user_review_forum).

0.45::true_val(user_review_forum, magne_traction_best_edge); 0.55::true_val(user_review_forum, unk_user_review_forum).

measured(s74, user_review_forum, magne_traction_best_edge).

all_consistent(user_review_forum) :-
    consistent(s74, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, magne_traction_best_edge)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_topsheet
% @type categorical
% @canonical false
% @original_name user_review_forum (topsheet)
% @values topsheet_scratch_chip=Top_sheets_scratch_chip_easily unk_user_review_forum_topsheet=Unknown
% @importance 0.65

0.45::acc(s79, user_review_forum_topsheet).
0.55::acc(s127, user_review_forum_topsheet).

0.42::true_val(user_review_forum_topsheet, topsheet_scratch_chip); 0.58::true_val(user_review_forum_topsheet, unk_user_review_forum_topsheet).

measured(s79, user_review_forum_topsheet, topsheet_scratch_chip).
measured(s127, user_review_forum_topsheet, topsheet_scratch_chip).

all_consistent(user_review_forum_topsheet) :-
    consistent(s79, user_review_forum_topsheet),
    consistent(s127, user_review_forum_topsheet).

evidence(all_consistent(user_review_forum_topsheet)).
query(true_val(user_review_forum_topsheet, topsheet_scratch_chip)).
query(true_val(user_review_forum_topsheet, unk_user_review_forum_topsheet)).

% @attr user_review_forum_quality
% @type categorical
% @canonical false
% @original_name user_review_forum (quality)
% @values damage_rider_not_build=Damage_attributed_to_rider_not_build_quality unk_user_review_forum_quality=Unknown
% @importance 0.75

0.55::acc(s127, user_review_forum_quality).

0.48::true_val(user_review_forum_quality, damage_rider_not_build); 0.52::true_val(user_review_forum_quality, unk_user_review_forum_quality).

measured(s127, user_review_forum_quality, damage_rider_not_build).

all_consistent(user_review_forum_quality) :-
    consistent(s127, user_review_forum_quality).

evidence(all_consistent(user_review_forum_quality)).
query(true_val(user_review_forum_quality, damage_rider_not_build)).
query(true_val(user_review_forum_quality, unk_user_review_forum_quality)).

% @attr blister_review_topsheet
% @type categorical
% @canonical false
% @original_name Blister Review (Mervin general)
% @values bean_topsheet_durable=Bean_topsheet_durable_no_chips_20_days unk_blister_review_topsheet=Unknown
% @importance 0.60

0.72::acc(s130, blister_review_topsheet).

0.60::true_val(blister_review_topsheet, bean_topsheet_durable); 0.40::true_val(blister_review_topsheet, unk_blister_review_topsheet).

measured(s130, blister_review_topsheet, bean_topsheet_durable).

all_consistent(blister_review_topsheet) :-
    consistent(s130, blister_review_topsheet).

evidence(all_consistent(blister_review_topsheet)).
query(true_val(blister_review_topsheet, bean_topsheet_durable)).
query(true_val(blister_review_topsheet, unk_blister_review_topsheet)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values gnu_fiction=GNU_Fiction_BTX_399_99 unk_comparable_board_same_brand=Unknown
% @importance 0.70

0.78::acc(s75, comparable_board_same_brand).
0.75::acc(s102, comparable_board_same_brand).

0.82::true_val(comparable_board_same_brand, gnu_fiction); 0.18::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s75, comparable_board_same_brand, gnu_fiction).
measured(s102, comparable_board_same_brand, gnu_fiction).

all_consistent(comparable_board_same_brand) :-
    consistent(s75, comparable_board_same_brand),
    consistent(s102, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, gnu_fiction)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_skate_banana
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Lib Tech Skate Banana)
% @values libtech_skate_banana=Lib_Tech_Skate_Banana_579_99 unk_comparable_board_same_brand_skate_banana=Unknown
% @importance 0.78

0.78::acc(s75, comparable_board_same_brand_skate_banana).
0.82::acc(s5, comparable_board_same_brand_skate_banana).

0.82::true_val(comparable_board_same_brand_skate_banana, libtech_skate_banana); 0.18::true_val(comparable_board_same_brand_skate_banana, unk_comparable_board_same_brand_skate_banana).

measured(s75, comparable_board_same_brand_skate_banana, libtech_skate_banana).
measured(s5, comparable_board_same_brand_skate_banana, libtech_skate_banana).

all_consistent(comparable_board_same_brand_skate_banana) :-
    consistent(s75, comparable_board_same_brand_skate_banana),
    (indep(s5), consistent(s5, comparable_board_same_brand_skate_banana) ; \+indep(s5)).

evidence(all_consistent(comparable_board_same_brand_skate_banana)).
query(true_val(comparable_board_same_brand_skate_banana, libtech_skate_banana)).
query(true_val(comparable_board_same_brand_skate_banana, unk_comparable_board_same_brand_skate_banana)).

% @attr comparable_board_same_brand_gremlin
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (GNU Gremlin)
% @values gnu_gremlin=GNU_Gremlin_C3_579_99 unk_comparable_board_same_brand_gremlin=Unknown
% @importance 0.80

0.82::acc(s5, comparable_board_same_brand_gremlin).
0.78::acc(s76, comparable_board_same_brand_gremlin).

0.82::true_val(comparable_board_same_brand_gremlin, gnu_gremlin); 0.18::true_val(comparable_board_same_brand_gremlin, unk_comparable_board_same_brand_gremlin).

measured(s5, comparable_board_same_brand_gremlin, gnu_gremlin).
measured(s76, comparable_board_same_brand_gremlin, gnu_gremlin).

all_consistent(comparable_board_same_brand_gremlin) :-
    (indep(s5), consistent(s5, comparable_board_same_brand_gremlin) ; \+indep(s5)),
    consistent(s76, comparable_board_same_brand_gremlin).

evidence(all_consistent(comparable_board_same_brand_gremlin)).
query(true_val(comparable_board_same_brand_gremlin, gnu_gremlin)).
query(true_val(comparable_board_same_brand_gremlin, unk_comparable_board_same_brand_gremlin)).

% @attr comparable_board_same_brand_wagyu
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (GNU Wagyu)
% @values gnu_wagyu=GNU_Wagyu_C3_499_99 unk_comparable_board_same_brand_wagyu=Unknown
% @importance 0.90

0.82::acc(s5, comparable_board_same_brand_wagyu).

0.80::true_val(comparable_board_same_brand_wagyu, gnu_wagyu); 0.20::true_val(comparable_board_same_brand_wagyu, unk_comparable_board_same_brand_wagyu).

measured(s5, comparable_board_same_brand_wagyu, gnu_wagyu).

all_consistent(comparable_board_same_brand_wagyu) :-
    (indep(s5), consistent(s5, comparable_board_same_brand_wagyu) ; \+indep(s5)).

evidence(all_consistent(comparable_board_same_brand_wagyu)).
query(true_val(comparable_board_same_brand_wagyu, gnu_wagyu)).
query(true_val(comparable_board_same_brand_wagyu, unk_comparable_board_same_brand_wagyu)).

% @attr comparable_board_same_brand_c_money
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (GNU C-Money)
% @values gnu_c_money=GNU_C_Money_C3_449_99 unk_comparable_board_same_brand_c_money=Unknown
% @importance 0.90

0.82::acc(s5, comparable_board_same_brand_c_money).

0.80::true_val(comparable_board_same_brand_c_money, gnu_c_money); 0.20::true_val(comparable_board_same_brand_c_money, unk_comparable_board_same_brand_c_money).

measured(s5, comparable_board_same_brand_c_money, gnu_c_money).

all_consistent(comparable_board_same_brand_c_money) :-
    (indep(s5), consistent(s5, comparable_board_same_brand_c_money) ; \+indep(s5)).

evidence(all_consistent(comparable_board_same_brand_c_money)).
query(true_val(comparable_board_same_brand_c_money, gnu_c_money)).
query(true_val(comparable_board_same_brand_c_money, unk_comparable_board_same_brand_c_money)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values burton_cultivator=Burton_Cultivator unk_comparable_board_cross_brand=Unknown
% @importance 0.70

0.70::acc(s72, comparable_board_cross_brand).

0.65::true_val(comparable_board_cross_brand, burton_cultivator); 0.35::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s72, comparable_board_cross_brand, burton_cultivator).

all_consistent(comparable_board_cross_brand) :-
    consistent(s72, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, burton_cultivator)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_process
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Process Flying V)
% @values burton_process_fv=Burton_Process_Flying_V unk_comparable_board_cross_brand_process=Unknown
% @importance 0.70

0.75::acc(s76, comparable_board_cross_brand_process).

0.68::true_val(comparable_board_cross_brand_process, burton_process_fv); 0.32::true_val(comparable_board_cross_brand_process, unk_comparable_board_cross_brand_process).

measured(s76, comparable_board_cross_brand_process, burton_process_fv).

all_consistent(comparable_board_cross_brand_process) :-
    consistent(s76, comparable_board_cross_brand_process).

evidence(all_consistent(comparable_board_cross_brand_process)).
query(true_val(comparable_board_cross_brand_process, burton_process_fv)).
query(true_val(comparable_board_cross_brand_process, unk_comparable_board_cross_brand_process)).

% @attr comparable_board_cross_brand_nitro_prime
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Nitro Prime)
% @values nitro_prime=Nitro_Prime unk_comparable_board_cross_brand_nitro_prime=Unknown
% @importance 0.70

0.70::acc(s72, comparable_board_cross_brand_nitro_prime).

0.62::true_val(comparable_board_cross_brand_nitro_prime, nitro_prime); 0.38::true_val(comparable_board_cross_brand_nitro_prime, unk_comparable_board_cross_brand_nitro_prime).

measured(s72, comparable_board_cross_brand_nitro_prime, nitro_prime).

all_consistent(comparable_board_cross_brand_nitro_prime) :-
    consistent(s72, comparable_board_cross_brand_nitro_prime).

evidence(all_consistent(comparable_board_cross_brand_nitro_prime)).
query(true_val(comparable_board_cross_brand_nitro_prime, nitro_prime)).
query(true_val(comparable_board_cross_brand_nitro_prime, unk_comparable_board_cross_brand_nitro_prime)).

% @attr comparable_board_cross_brand_k2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 Standard/Gateway)
% @values k2_standard_gateway=K2_Standard_Gateway unk_comparable_board_cross_brand_k2=Unknown
% @importance 0.70

0.70::acc(s72, comparable_board_cross_brand_k2).

0.62::true_val(comparable_board_cross_brand_k2, k2_standard_gateway); 0.38::true_val(comparable_board_cross_brand_k2, unk_comparable_board_cross_brand_k2).

measured(s72, comparable_board_cross_brand_k2, k2_standard_gateway).

all_consistent(comparable_board_cross_brand_k2) :-
    consistent(s72, comparable_board_cross_brand_k2).

evidence(all_consistent(comparable_board_cross_brand_k2)).
query(true_val(comparable_board_cross_brand_k2, k2_standard_gateway)).
query(true_val(comparable_board_cross_brand_k2, unk_comparable_board_cross_brand_k2)).

% @attr comparable_board_cross_brand_custom
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Burton Custom Camber)
% @values burton_custom=Burton_Custom_Camber_679_95 unk_comparable_board_cross_brand_custom=Unknown
% @importance 0.85

0.78::acc(s75, comparable_board_cross_brand_custom).

0.72::true_val(comparable_board_cross_brand_custom, burton_custom); 0.28::true_val(comparable_board_cross_brand_custom, unk_comparable_board_cross_brand_custom).

measured(s75, comparable_board_cross_brand_custom, burton_custom).

all_consistent(comparable_board_cross_brand_custom) :-
    consistent(s75, comparable_board_cross_brand_custom).

evidence(all_consistent(comparable_board_cross_brand_custom)).
query(true_val(comparable_board_cross_brand_custom, burton_custom)).
query(true_val(comparable_board_cross_brand_custom, unk_comparable_board_cross_brand_custom)).

% @attr comparable_board_cross_brand_proto
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Never Summer Proto T3 Ultra)
% @values ns_proto_t3=Never_Summer_Proto_T3_Ultra_699_99 unk_comparable_board_cross_brand_proto=Unknown
% @importance 0.85

0.78::acc(s75, comparable_board_cross_brand_proto).

0.72::true_val(comparable_board_cross_brand_proto, ns_proto_t3); 0.28::true_val(comparable_board_cross_brand_proto, unk_comparable_board_cross_brand_proto).

measured(s75, comparable_board_cross_brand_proto, ns_proto_t3).

all_consistent(comparable_board_cross_brand_proto) :-
    consistent(s75, comparable_board_cross_brand_proto).

evidence(all_consistent(comparable_board_cross_brand_proto)).
query(true_val(comparable_board_cross_brand_proto, ns_proto_t3)).
query(true_val(comparable_board_cross_brand_proto, unk_comparable_board_cross_brand_proto)).

% @attr comparable_board_cross_brand_mercury
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (CAPiTA Mercury)
% @values capita_mercury=CAPiTA_Mercury_679_95 unk_comparable_board_cross_brand_mercury=Unknown
% @importance 0.85

0.78::acc(s75, comparable_board_cross_brand_mercury).

0.72::true_val(comparable_board_cross_brand_mercury, capita_mercury); 0.28::true_val(comparable_board_cross_brand_mercury, unk_comparable_board_cross_brand_mercury).

measured(s75, comparable_board_cross_brand_mercury, capita_mercury).

all_consistent(comparable_board_cross_brand_mercury) :-
    consistent(s75, comparable_board_cross_brand_mercury).

evidence(all_consistent(comparable_board_cross_brand_mercury)).
query(true_val(comparable_board_cross_brand_mercury, capita_mercury)).
query(true_val(comparable_board_cross_brand_mercury, unk_comparable_board_cross_brand_mercury)).

% @attr value_positioning
% @type categorical
% @canonical false
% @original_name Value positioning
% @values affordable_us_made_magne=Most_affordable_US_made_with_Magne_Traction unk_value_positioning=Unknown
% @importance 0.88

0.85::acc(s5, value_positioning).
0.78::acc(s75, value_positioning).

0.85::true_val(value_positioning, affordable_us_made_magne); 0.15::true_val(value_positioning, unk_value_positioning).

measured(s5, value_positioning, affordable_us_made_magne).
measured(s75, value_positioning, affordable_us_made_magne).

all_consistent(value_positioning) :-
    (indep(s5), consistent(s5, value_positioning) ; \+indep(s5)),
    consistent(s75, value_positioning).

evidence(all_consistent(value_positioning)).
query(true_val(value_positioning, affordable_us_made_magne)).
query(true_val(value_positioning, unk_value_positioning)).

% @attr graphic_designer_artist_team
% @type categorical
% @canonical false
% @original_name graphic_designer_artist (team)
% @values gnu_team=GNU_Snowboards_team unk_graphic_designer_artist_team=Unknown
% @importance 1.0

0.85::acc(s1, graphic_designer_artist_team).

0.85::true_val(graphic_designer_artist_team, gnu_team); 0.15::true_val(graphic_designer_artist_team, unk_graphic_designer_artist_team).

measured(s1, graphic_designer_artist_team, gnu_team).

all_consistent(graphic_designer_artist_team) :-
    consistent(s1, graphic_designer_artist_team).

evidence(all_consistent(graphic_designer_artist_team)).
query(true_val(graphic_designer_artist_team, gnu_team)).
query(true_val(graphic_designer_artist_team, unk_graphic_designer_artist_team)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values standard_2x4_all_brands=Standard_2x4_all_major_binding_brands unk_binding_compatibility=Unknown
% @importance 0.85

0.90::acc(s2, binding_compatibility).

0.90::true_val(binding_compatibility, standard_2x4_all_brands); 0.10::true_val(binding_compatibility, unk_binding_compatibility).

measured(s2, binding_compatibility, standard_2x4_all_brands).

all_consistent(binding_compatibility) :-
    (indep(s2), consistent(s2, binding_compatibility) ; \+indep(s2)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_2x4_all_brands)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr sustainability_eco_sublimated
% @type categorical
% @canonical false
% @original_name sustainability_certification (eco sublimated)
% @values eco_sublimated=Eco_sublimated_not_screen_printed unk_sustainability_eco_sublimated=Unknown
% @importance 0.90

0.92::acc(s1, sustainability_eco_sublimated).
0.82::acc(s10, sustainability_eco_sublimated).

0.93::true_val(sustainability_eco_sublimated, eco_sublimated); 0.07::true_val(sustainability_eco_sublimated, unk_sustainability_eco_sublimated).

measured(s1, sustainability_eco_sublimated, eco_sublimated).
measured(s10, sustainability_eco_sublimated, eco_sublimated).

all_consistent(sustainability_eco_sublimated) :-
    consistent(s1, sustainability_eco_sublimated),
    (indep(s10), consistent(s10, sustainability_eco_sublimated) ; \+indep(s10)).

evidence(all_consistent(sustainability_eco_sublimated)).
query(true_val(sustainability_eco_sublimated, eco_sublimated)).
query(true_val(sustainability_eco_sublimated, unk_sustainability_eco_sublimated)).

% @attr wide_board_purpose
% @type categorical
% @canonical false
% @original_name Wide board purpose
% @values large_boots_flotation=Large_boot_sizes_extra_flotation_reduced_drag unk_wide_board_purpose=Unknown
% @importance 0.75

0.82::acc(s2, wide_board_purpose).

0.78::true_val(wide_board_purpose, large_boots_flotation); 0.22::true_val(wide_board_purpose, unk_wide_board_purpose).

measured(s2, wide_board_purpose, large_boots_flotation).

all_consistent(wide_board_purpose) :-
    (indep(s2), consistent(s2, wide_board_purpose) ; \+indep(s2)).

evidence(all_consistent(wide_board_purpose)).
query(true_val(wide_board_purpose, large_boots_flotation)).
query(true_val(wide_board_purpose, unk_wide_board_purpose)).

% @attr directional_twin_advantage
% @type categorical
% @canonical false
% @original_name Directional twin advantage
% @values excels_one_direction_switch_ok=Excels_one_direction_good_switch unk_directional_twin_advantage=Unknown
% @importance 0.75

0.82::acc(s2, directional_twin_advantage).

0.78::true_val(directional_twin_advantage, excels_one_direction_switch_ok); 0.22::true_val(directional_twin_advantage, unk_directional_twin_advantage).

measured(s2, directional_twin_advantage, excels_one_direction_switch_ok).

all_consistent(directional_twin_advantage) :-
    (indep(s2), consistent(s2, directional_twin_advantage) ; \+indep(s2)).

evidence(all_consistent(directional_twin_advantage)).
query(true_val(directional_twin_advantage, excels_one_direction_switch_ok)).
query(true_val(directional_twin_advantage, unk_directional_twin_advantage)).