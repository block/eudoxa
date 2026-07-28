0.20::indep(s1).
0.10::indep(s19).
0.15::indep(s28).
0.12::indep(s29).
0.12::indep(s30).
0.15::indep(s39).
0.12::indep(s40).
0.10::indep(s25).
0.20::indep(s38).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values capita=CAPiTA unk_brand=Unknown
% @importance 1.0

0.92::acc(s1, brand).

0.95::true_val(brand, capita); 0.05::true_val(brand, unk_brand).

measured(s1, brand, capita).

all_consistent(brand) :- consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, capita)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values bsod=The_Black_Snowboard_of_Death unk_model_name=Unknown
% @importance 0.5

0.88::acc(s2, model_name).
0.85::acc(s3, model_name).

0.95::true_val(model_name, bsod); 0.05::true_val(model_name, unk_model_name).

measured(s2, model_name, bsod).
measured(s3, model_name, bsod).

all_consistent(model_name) :-
    consistent(s2, model_name),
    consistent(s3, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, bsod)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type numeric
% @canonical true
% @original_name model_year
% @values v2027=2027 unk_model_year=Unknown
% @importance 1.0

0.92::acc(s1, model_year).

0.95::true_val(model_year, v2027); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, v2027).

all_consistent(model_year) :- consistent(s1, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, v2027)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.92::acc(s1, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 1.0

0.90::acc(s1, board_category).

0.95::true_val(board_category, all_mountain_freeride); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain_freeride).

all_consistent(board_category) :- consistent(s1, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.6

0.90::acc(s4, gender).

0.95::true_val(gender, mens); 0.05::true_val(gender, unk_gender).

measured(s4, gender, mens).

all_consistent(gender) :- consistent(s4, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values capita_super_corp=CAPiTA_Super_Corporation unk_manufacturer=Unknown
% @importance 0.4

0.80::acc(s5, manufacturer).

0.56::true_val(manufacturer, capita_super_corp); 0.44::true_val(manufacturer, unk_manufacturer).

measured(s5, manufacturer, capita_super_corp).

all_consistent(manufacturer) :- consistent(s5, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, capita_super_corp)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr founders
% @type categorical
% @canonical false
% @original_name Founders
% @values brown_montgomery=Jason_Brown_and_Blue_Montgomery unk_founders=Unknown
% @importance 0.5

0.90::acc(s7, founders).

0.62::true_val(founders, brown_montgomery); 0.38::true_val(founders, unk_founders).

measured(s7, founders, brown_montgomery).

all_consistent(founders) :- consistent(s7, founders).

evidence(all_consistent(founders)).
query(true_val(founders, brown_montgomery)).
query(true_val(founders, unk_founders)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2001_02=2001_02_season unk_model_first_available_year=Unknown
% @importance 0.5

0.55::acc(s10, model_first_available_year).
0.80::acc(s11, model_first_available_year).

0.75::true_val(model_first_available_year, season_2001_02); 0.25::true_val(model_first_available_year, unk_model_first_available_year).

measured(s10, model_first_available_year, season_2001_02).
measured(s11, model_first_available_year, season_2001_02).

all_consistent(model_first_available_year) :-
    consistent(s10, model_first_available_year),
    consistent(s11, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2001_02)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr model_series_lineage
% @type categorical
% @canonical false
% @original_name Model series lineage
% @values redesign_20th_anniversary=Full_redesign_for_20th_anniversary_2020_21 unk_model_series_lineage=Unknown
% @importance 0.5

0.82::acc(s11, model_series_lineage).

0.72::true_val(model_series_lineage, redesign_20th_anniversary); 0.28::true_val(model_series_lineage, unk_model_series_lineage).

measured(s11, model_series_lineage, redesign_20th_anniversary).

all_consistent(model_series_lineage) :- consistent(s11, model_series_lineage).

evidence(all_consistent(model_series_lineage)).
query(true_val(model_series_lineage, redesign_20th_anniversary)).
query(true_val(model_series_lineage, unk_model_series_lineage)).

% @attr manufacturing_location
% @type categorical
% @canonical true
% @original_name manufacturing_location
% @values austria_feistritz=Austria_Feistritz_ad_Gail unk_manufacturing_location=Unknown
% @importance 0.7

0.95::acc(s12, manufacturing_location).

0.95::true_val(manufacturing_location, austria_feistritz); 0.05::true_val(manufacturing_location, unk_manufacturing_location).

measured(s12, manufacturing_location, austria_feistritz).

all_consistent(manufacturing_location) :- consistent(s12, manufacturing_location).

evidence(all_consistent(manufacturing_location)).
query(true_val(manufacturing_location, austria_feistritz)).
query(true_val(manufacturing_location, unk_manufacturing_location)).

% @attr energy_source
% @type categorical
% @canonical false
% @original_name Energy source
% @values hydro_nh3_solar=Hydro_NH3_thermal_plus_solar unk_energy_source=Unknown
% @importance 0.6

0.90::acc(s14, energy_source).

0.81::true_val(energy_source, hydro_nh3_solar); 0.19::true_val(energy_source, unk_energy_source).

measured(s14, energy_source, hydro_nh3_solar).

all_consistent(energy_source) :- consistent(s14, energy_source).

evidence(all_consistent(energy_source)).
query(true_val(energy_source, hydro_nh3_solar)).
query(true_val(energy_source, unk_energy_source)).

% @attr facility_size
% @type categorical
% @canonical false
% @original_name Facility size
% @values acres_7_sqft_53000=7_acres_53000_sqft unk_facility_size=Unknown
% @importance 0.35

0.80::acc(s15, facility_size).

0.72::true_val(facility_size, acres_7_sqft_53000); 0.28::true_val(facility_size, unk_facility_size).

measured(s15, facility_size, acres_7_sqft_53000).

all_consistent(facility_size) :- consistent(s15, facility_size).

evidence(all_consistent(facility_size)).
query(true_val(facility_size, acres_7_sqft_53000)).
query(true_val(facility_size, unk_facility_size)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values certified_b_corp=Certified_B_Corporation_score_98_9 unk_sustainability_certification=Unknown
% @importance 0.55

0.92::acc(s16, sustainability_certification).

0.86::true_val(sustainability_certification, certified_b_corp); 0.14::true_val(sustainability_certification, unk_sustainability_certification).

measured(s16, sustainability_certification, certified_b_corp).

all_consistent(sustainability_certification) :- consistent(s16, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, certified_b_corp)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr awards
% @type categorical
% @canonical false
% @original_name Awards
% @values energy_globe_2017=Energy_Globe_Award_Austria_2017 unk_awards=Unknown
% @importance 0.4

0.78::acc(s17, awards).

0.63::true_val(awards, energy_globe_2017); 0.37::true_val(awards, unk_awards).

measured(s17, awards, energy_globe_2017).

all_consistent(awards) :- consistent(s17, awards).

evidence(all_consistent(awards)).
query(true_val(awards, energy_globe_2017)).
query(true_val(awards, unk_awards)).

% @attr forestry_certification
% @type categorical
% @canonical false
% @original_name Forestry certification
% @values fsc_certified_cores=FSC_certified_wood_cores unk_forestry_certification=Unknown
% @importance 0.6

0.88::acc(s14, forestry_certification).

0.81::true_val(forestry_certification, fsc_certified_cores); 0.19::true_val(forestry_certification, unk_forestry_certification).

measured(s14, forestry_certification, fsc_certified_cores).

all_consistent(forestry_certification) :- consistent(s14, forestry_certification).

evidence(all_consistent(forestry_certification)).
query(true_val(forestry_certification, fsc_certified_cores)).
query(true_val(forestry_certification, unk_forestry_certification)).

% @attr nfc_technology
% @type categorical
% @canonical false
% @original_name NFC technology
% @values embedded_since_2020=NFC_embedded_since_2020 unk_nfc_technology=Unknown
% @importance 0.4

0.88::acc(s18, nfc_technology).

0.81::true_val(nfc_technology, embedded_since_2020); 0.19::true_val(nfc_technology, unk_nfc_technology).

measured(s18, nfc_technology, embedded_since_2020).

all_consistent(nfc_technology) :- consistent(s18, nfc_technology).

evidence(all_consistent(nfc_technology)).
query(true_val(nfc_technology, embedded_since_2020)).
query(true_val(nfc_technology, unk_nfc_technology)).

% @attr recycled_content
% @type categorical
% @canonical false
% @original_name Recycled content
% @values all_scraps_recycled=Recycles_all_production_scraps unk_recycled_content=Unknown
% @importance 0.6

0.88::acc(s14, recycled_content).

0.81::true_val(recycled_content, all_scraps_recycled); 0.19::true_val(recycled_content, unk_recycled_content).

measured(s14, recycled_content, all_scraps_recycled).

all_consistent(recycled_content) :- consistent(s14, recycled_content).

evidence(all_consistent(recycled_content)).
query(true_val(recycled_content, all_scraps_recycled)).
query(true_val(recycled_content, unk_recycled_content)).

% @attr ink_type
% @type categorical
% @canonical false
% @original_name Ink type
% @values water_based_uv=Water_based_UV_curable_solventless unk_ink_type=Unknown
% @importance 0.35

0.75::acc(s19, ink_type).

0.51::true_val(ink_type, water_based_uv); 0.49::true_val(ink_type, unk_ink_type).

measured(s19, ink_type, water_based_uv).

all_consistent(ink_type) :- consistent(s19, ink_type).

evidence(all_consistent(ink_type)).
query(true_val(ink_type, water_based_uv)).
query(true_val(ink_type, unk_ink_type)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @unit AUD
% @original_name price_aud_merchant
% @values v1299_99=1299.99 unk_price_aud_merchant=Unknown
% @importance 1.0

0.92::acc(s1, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1299_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s1, price_aud_merchant, v1299_99).

all_consistent(price_aud_merchant) :- consistent(s1, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1299_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder_2027=Preorder_2027 unk_availability_status=Unknown
% @importance 1.0

0.90::acc(s1, availability_status).

0.95::true_val(availability_status, preorder_2027); 0.05::true_val(availability_status, unk_availability_status).

measured(s1, availability_status, preorder_2027).

all_consistent(availability_status) :- consistent(s1, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder_2027)).
query(true_val(availability_status, unk_availability_status)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values may_2026=May_1_2026 unk_estimated_availability_date=Unknown
% @importance 1.0

0.88::acc(s1, estimated_availability_date).

0.71::true_val(estimated_availability_date, may_2026); 0.29::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s1, estimated_availability_date, may_2026).

all_consistent(estimated_availability_date) :- consistent(s1, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, may_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @unit USD
% @original_name price_usd_msrp
% @values v749_95=749.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.92::acc(s20, price_usd_msrp).

0.81::true_val(price_usd_msrp, v749_95); 0.19::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s20, price_usd_msrp, v749_95).

all_consistent(price_usd_msrp) :- consistent(s20, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v749_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_sale_evo
% @type numeric
% @canonical false
% @unit USD
% @original_name USD sale price at evo (2026 used)
% @values v712_45=712.45 unk_price_usd_sale_evo=Unknown
% @importance 0.8

0.88::acc(s21, price_usd_sale_evo).

0.72::true_val(price_usd_sale_evo, v712_45); 0.28::true_val(price_usd_sale_evo, unk_price_usd_sale_evo).

measured(s21, price_usd_sale_evo, v712_45).

all_consistent(price_usd_sale_evo) :- consistent(s21, price_usd_sale_evo).

evidence(all_consistent(price_usd_sale_evo)).
query(true_val(price_usd_sale_evo, v712_45)).
query(true_val(price_usd_sale_evo, unk_price_usd_sale_evo)).

% @attr availability_status_evo_2026
% @type categorical
% @canonical false
% @original_name availability_status (evo 2026)
% @values in_stock=In_stock unk_availability_status_evo_2026=Unknown
% @importance 0.7

0.88::acc(s22, availability_status_evo_2026).

0.77::true_val(availability_status_evo_2026, in_stock); 0.23::true_val(availability_status_evo_2026, unk_availability_status_evo_2026).

measured(s22, availability_status_evo_2026, in_stock).

all_consistent(availability_status_evo_2026) :- consistent(s22, availability_status_evo_2026).

evidence(all_consistent(availability_status_evo_2026)).
query(true_val(availability_status_evo_2026, in_stock)).
query(true_val(availability_status_evo_2026, unk_availability_status_evo_2026)).

% @attr availability_status_tactics
% @type categorical
% @canonical false
% @original_name Availability at Tactics.com
% @values in_stock=In_stock unk_availability_status_tactics=Unknown
% @importance 0.7

0.85::acc(s23, availability_status_tactics).

0.72::true_val(availability_status_tactics, in_stock); 0.28::true_val(availability_status_tactics, unk_availability_status_tactics).

measured(s23, availability_status_tactics, in_stock).

all_consistent(availability_status_tactics) :- consistent(s23, availability_status_tactics).

evidence(all_consistent(availability_status_tactics)).
query(true_val(availability_status_tactics, in_stock)).
query(true_val(availability_status_tactics, unk_availability_status_tactics)).

% @attr availability_status_blauer_2027
% @type categorical
% @canonical false
% @original_name availability_status (Blauer 2027)
% @values listed_preorder=Listed_preorder unk_availability_status_blauer_2027=Unknown
% @importance 0.7

0.70::acc(s24, availability_status_blauer_2027).

0.46::true_val(availability_status_blauer_2027, listed_preorder); 0.54::true_val(availability_status_blauer_2027, unk_availability_status_blauer_2027).

measured(s24, availability_status_blauer_2027, listed_preorder).

all_consistent(availability_status_blauer_2027) :- consistent(s24, availability_status_blauer_2027).

evidence(all_consistent(availability_status_blauer_2027)).
query(true_val(availability_status_blauer_2027, listed_preorder)).
query(true_val(availability_status_blauer_2027, unk_availability_status_blauer_2027)).

% @attr availability_status_amazon_2026
% @type categorical
% @canonical false
% @original_name availability_status (Amazon 2026)
% @values listed=Listed unk_availability_status_amazon_2026=Unknown
% @importance 0.85

0.70::acc(s25, availability_status_amazon_2026).

0.47::true_val(availability_status_amazon_2026, listed); 0.53::true_val(availability_status_amazon_2026, unk_availability_status_amazon_2026).

measured(s25, availability_status_amazon_2026, listed).

all_consistent(availability_status_amazon_2026) :- consistent(s25, availability_status_amazon_2026).

evidence(all_consistent(availability_status_amazon_2026)).
query(true_val(availability_status_amazon_2026, listed)).
query(true_val(availability_status_amazon_2026, unk_availability_status_amazon_2026)).

% @attr availability_status_rei_2026
% @type categorical
% @canonical false
% @original_name availability_status (REI 2026)
% @values listed=Listed unk_availability_status_rei_2026=Unknown
% @importance 0.7

0.85::acc(s26, availability_status_rei_2026).

0.72::true_val(availability_status_rei_2026, listed); 0.28::true_val(availability_status_rei_2026, unk_availability_status_rei_2026).

measured(s26, availability_status_rei_2026, listed).

all_consistent(availability_status_rei_2026) :- consistent(s26, availability_status_rei_2026).

evidence(all_consistent(availability_status_rei_2026)).
query(true_val(availability_status_rei_2026, listed)).
query(true_val(availability_status_rei_2026, unk_availability_status_rei_2026)).

% @attr availability_status_melbourne_2027
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne 2027)
% @values preorder=Preorder unk_availability_status_melbourne_2027=Unknown
% @importance 0.8

0.85::acc(s27, availability_status_melbourne_2027).

0.63::true_val(availability_status_melbourne_2027, preorder); 0.37::true_val(availability_status_melbourne_2027, unk_availability_status_melbourne_2027).

measured(s27, availability_status_melbourne_2027, preorder).

all_consistent(availability_status_melbourne_2027) :- consistent(s27, availability_status_melbourne_2027).

evidence(all_consistent(availability_status_melbourne_2027)).
query(true_val(availability_status_melbourne_2027, preorder)).
query(true_val(availability_status_melbourne_2027, unk_availability_status_melbourne_2027)).

% @attr availability_status_sportsbasement
% @type categorical
% @canonical false
% @original_name availability_status (Sports Basement)
% @values listed=Listed unk_availability_status_sportsbasement=Unknown
% @importance 0.85

0.78::acc(s28, availability_status_sportsbasement).

0.63::true_val(availability_status_sportsbasement, listed); 0.37::true_val(availability_status_sportsbasement, unk_availability_status_sportsbasement).

measured(s28, availability_status_sportsbasement, listed).

all_consistent(availability_status_sportsbasement) :- consistent(s28, availability_status_sportsbasement).

evidence(all_consistent(availability_status_sportsbasement)).
query(true_val(availability_status_sportsbasement, listed)).
query(true_val(availability_status_sportsbasement, unk_availability_status_sportsbasement)).

% @attr availability_status_buckmans
% @type categorical
% @canonical false
% @original_name availability_status (Buckmans)
% @values listed=Listed unk_availability_status_buckmans=Unknown
% @importance 0.45

0.72::acc(s29, availability_status_buckmans).

0.55::true_val(availability_status_buckmans, listed); 0.45::true_val(availability_status_buckmans, unk_availability_status_buckmans).

measured(s29, availability_status_buckmans, listed).

all_consistent(availability_status_buckmans) :- consistent(s29, availability_status_buckmans).

evidence(all_consistent(availability_status_buckmans)).
query(true_val(availability_status_buckmans, listed)).
query(true_val(availability_status_buckmans, unk_availability_status_buckmans)).

% @attr availability_status_gravity
% @type categorical
% @canonical false
% @original_name availability_status (Gravity Coalition)
% @values listed=Listed unk_availability_status_gravity=Unknown
% @importance 0.5

0.68::acc(s30, availability_status_gravity).

0.42::true_val(availability_status_gravity, listed); 0.58::true_val(availability_status_gravity, unk_availability_status_gravity).

measured(s30, availability_status_gravity, listed).

all_consistent(availability_status_gravity) :- consistent(s30, availability_status_gravity).

evidence(all_consistent(availability_status_gravity)).
query(true_val(availability_status_gravity, listed)).
query(true_val(availability_status_gravity, unk_availability_status_gravity)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values mega_death=CAPiTA_Mega_Death unk_comparable_board_same_brand=Unknown
% @importance 0.75

0.85::acc(s31, comparable_board_same_brand).
0.80::acc(s45, comparable_board_same_brand).

0.95::true_val(comparable_board_same_brand, mega_death); 0.05::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s31, comparable_board_same_brand, mega_death).
measured(s45, comparable_board_same_brand, mega_death).

all_consistent(comparable_board_same_brand) :-
    consistent(s31, comparable_board_same_brand),
    consistent(s45, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, mega_death)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.95

0.90::acc(s1, shape).
0.88::acc(s33, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s1, shape, tapered_directional).
measured(s33, shape, tapered_directional).

all_consistent(shape) :-
    (indep(s1), consistent(s1, shape) ; \+indep(s1)),
    consistent(s33, shape).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values five_sizes_2027=156_159_162_157W_161W seven_sizes_2026=156_159_162_157W_161W_165W_169W
% @importance 0.875

0.88::acc(s1, available_sizes).
0.80::acc(s32, available_sizes).

0.55::true_val(available_sizes, five_sizes_2027); 0.45::true_val(available_sizes, seven_sizes_2026).

measured(s1, available_sizes, five_sizes_2027).
measured(s32, available_sizes, seven_sizes_2026).

all_consistent(available_sizes) :-
    consistent(s1, available_sizes),
    consistent(s32, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, five_sizes_2027)).
query(true_val(available_sizes, seven_sizes_2026)).

% @attr taper_amount
% @type numeric
% @canonical false
% @unit mm
% @original_name Taper amount
% @values v1_1=1.1 unk_taper_amount=Unknown
% @importance 0.9

0.88::acc(s33, taper_amount).

0.74::true_val(taper_amount, v1_1); 0.26::true_val(taper_amount, unk_taper_amount).

measured(s33, taper_amount, v1_1).

all_consistent(taper_amount) :- consistent(s33, taper_amount).

evidence(all_consistent(taper_amount)).
query(true_val(taper_amount, v1_1)).
query(true_val(taper_amount, unk_taper_amount)).

% @attr setback
% @type numeric
% @canonical true
% @unit cm
% @original_name setback
% @values v2_0=2.0 unk_setback=Unknown
% @importance 1.0

0.90::acc(s1, setback).

0.71::true_val(setback, v2_0); 0.29::true_val(setback, unk_setback).

measured(s1, setback, v2_0).

all_consistent(setback) :- consistent(s1, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v2_0)).
query(true_val(setback, unk_setback)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 1.0

0.90::acc(s1, width_options).

0.71::true_val(width_options, standard_wide); 0.29::true_val(width_options, unk_width_options).

measured(s1, width_options, standard_wide).

all_consistent(width_options) :- consistent(s1, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_wide)).
query(true_val(width_options, unk_width_options)).

% @attr effective_edge_156
% @type numeric
% @canonical false
% @unit mm
% @original_name Effective edge 156cm
% @values v1197=1197 unk_effective_edge_156=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_156).

0.71::true_val(effective_edge_156, v1197); 0.29::true_val(effective_edge_156, unk_effective_edge_156).

measured(s1, effective_edge_156, v1197).

all_consistent(effective_edge_156) :- consistent(s1, effective_edge_156).

evidence(all_consistent(effective_edge_156)).
query(true_val(effective_edge_156, v1197)).
query(true_val(effective_edge_156, unk_effective_edge_156)).

% @attr effective_edge_159
% @type numeric
% @canonical false
% @unit mm
% @original_name Effective edge 159cm
% @values v1221=1221 unk_effective_edge_159=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_159).

0.71::true_val(effective_edge_159, v1221); 0.29::true_val(effective_edge_159, unk_effective_edge_159).

measured(s1, effective_edge_159, v1221).

all_consistent(effective_edge_159) :- consistent(s1, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v1221)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr effective_edge_162
% @type numeric
% @canonical false
% @unit mm
% @original_name Effective edge 162cm
% @values v1245=1245 unk_effective_edge_162=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_162).

0.71::true_val(effective_edge_162, v1245); 0.29::true_val(effective_edge_162, unk_effective_edge_162).

measured(s1, effective_edge_162, v1245).

all_consistent(effective_edge_162) :- consistent(s1, effective_edge_162).

evidence(all_consistent(effective_edge_162)).
query(true_val(effective_edge_162, v1245)).
query(true_val(effective_edge_162, unk_effective_edge_162)).

% @attr effective_edge_157w
% @type numeric
% @canonical false
% @unit mm
% @original_name Effective edge 157W
% @values v1205=1205 unk_effective_edge_157w=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_157w).

0.71::true_val(effective_edge_157w, v1205); 0.29::true_val(effective_edge_157w, unk_effective_edge_157w).

measured(s1, effective_edge_157w, v1205).

all_consistent(effective_edge_157w) :- consistent(s1, effective_edge_157w).

evidence(all_consistent(effective_edge_157w)).
query(true_val(effective_edge_157w, v1205)).
query(true_val(effective_edge_157w, unk_effective_edge_157w)).

% @attr effective_edge_161w
% @type numeric
% @canonical false
% @unit mm
% @original_name Effective edge 161W
% @values v1237=1237 unk_effective_edge_161w=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_161w).

0.71::true_val(effective_edge_161w, v1237); 0.29::true_val(effective_edge_161w, unk_effective_edge_161w).

measured(s1, effective_edge_161w, v1237).

all_consistent(effective_edge_161w) :- consistent(s1, effective_edge_161w).

evidence(all_consistent(effective_edge_161w)).
query(true_val(effective_edge_161w, v1237)).
query(true_val(effective_edge_161w, unk_effective_edge_161w)).

% @attr effective_edge_165
% @type numeric
% @canonical false
% @unit mm
% @original_name effective_edge_165
% @values v1269=1269 unk_effective_edge_165=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_165).

0.71::true_val(effective_edge_165, v1269); 0.29::true_val(effective_edge_165, unk_effective_edge_165).

measured(s1, effective_edge_165, v1269).

all_consistent(effective_edge_165) :- consistent(s1, effective_edge_165).

evidence(all_consistent(effective_edge_165)).
query(true_val(effective_edge_165, v1269)).
query(true_val(effective_edge_165, unk_effective_edge_165)).

% @attr effective_edge_169w
% @type numeric
% @canonical false
% @unit mm
% @original_name Effective edge 169W
% @values v1301=1301 unk_effective_edge_169w=Unknown
% @importance 1.0

0.90::acc(s1, effective_edge_169w).

0.71::true_val(effective_edge_169w, v1301); 0.29::true_val(effective_edge_169w, unk_effective_edge_169w).

measured(s1, effective_edge_169w, v1301).

all_consistent(effective_edge_169w) :- consistent(s1, effective_edge_169w).

evidence(all_consistent(effective_edge_169w)).
query(true_val(effective_edge_169w, v1301)).
query(true_val(effective_edge_169w, unk_effective_edge_169w)).

% @attr sidecut_type
% @type categorical
% @canonical true
% @original_name sidecut_type
% @values new_age_progressive_death_grip=New_Age_Progressive_plus_Death_Grip unk_sidecut_type=Unknown
% @importance 1.0

0.90::acc(s1, sidecut_type).

0.71::true_val(sidecut_type, new_age_progressive_death_grip); 0.29::true_val(sidecut_type, unk_sidecut_type).

measured(s1, sidecut_type, new_age_progressive_death_grip).

all_consistent(sidecut_type) :- consistent(s1, sidecut_type).

evidence(all_consistent(sidecut_type)).
query(true_val(sidecut_type, new_age_progressive_death_grip)).
query(true_val(sidecut_type, unk_sidecut_type)).

% @attr sidecut_radius_size
% @type categorical
% @canonical true
% @unit m
% @original_name sidecut_radius_size (156cm)
% @values r8_2_7_8_7_6=8.2_7.8_7.6 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.90::acc(s1, sidecut_radius_size).

0.71::true_val(sidecut_radius_size, r8_2_7_8_7_6); 0.29::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s1, sidecut_radius_size, r8_2_7_8_7_6).

all_consistent(sidecut_radius_size) :- consistent(s1, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, r8_2_7_8_7_6)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr sidecut_radius_159
% @type categorical
% @canonical false
% @unit m
% @original_name sidecut_radius_size (159cm)
% @values r8_4_8_0_7_8=8.4_8.0_7.8 unk_sidecut_radius_159=Unknown
% @importance 1.0

0.90::acc(s1, sidecut_radius_159).

0.71::true_val(sidecut_radius_159, r8_4_8_0_7_8); 0.29::true_val(sidecut_radius_159, unk_sidecut_radius_159).

measured(s1, sidecut_radius_159, r8_4_8_0_7_8).

all_consistent(sidecut_radius_159) :- consistent(s1, sidecut_radius_159).

evidence(all_consistent(sidecut_radius_159)).
query(true_val(sidecut_radius_159, r8_4_8_0_7_8)).
query(true_val(sidecut_radius_159, unk_sidecut_radius_159)).

% @attr sidecut_radius_162
% @type categorical
% @canonical false
% @unit m
% @original_name sidecut_radius_size (162cm)
% @values r8_6_8_2_8_0=8.6_8.2_8.0 unk_sidecut_radius_162=Unknown
% @importance 1.0

0.90::acc(s1, sidecut_radius_162).

0.71::true_val(sidecut_radius_162, r8_6_8_2_8_0); 0.29::true_val(sidecut_radius_162, unk_sidecut_radius_162).

measured(s1, sidecut_radius_162, r8_6_8_2_8_0).

all_consistent(sidecut_radius_162) :- consistent(s1, sidecut_radius_162).

evidence(all_consistent(sidecut_radius_162)).
query(true_val(sidecut_radius_162, r8_6_8_2_8_0)).
query(true_val(sidecut_radius_162, unk_sidecut_radius_162)).

% @attr sidecut_radius_157w
% @type categorical
% @canonical false
% @unit m
% @original_name sidecut_radius_size (157W)
% @values r8_2_7_8_7_7=8.2_7.8_7.7 unk_sidecut_radius_157w=Unknown
% @importance 1.0

0.90::acc(s1, sidecut_radius_157w).

0.71::true_val(sidecut_radius_157w, r8_2_7_8_7_7); 0.29::true_val(sidecut_radius_157w, unk_sidecut_radius_157w).

measured(s1, sidecut_radius_157w, r8_2_7_8_7_7).

all_consistent(sidecut_radius_157w) :- consistent(s1, sidecut_radius_157w).

evidence(all_consistent(sidecut_radius_157w)).
query(true_val(sidecut_radius_157w, r8_2_7_8_7_7)).
query(true_val(sidecut_radius_157w, unk_sidecut_radius_157w)).

% @attr sidecut_radius_161w
% @type categorical
% @canonical false
% @unit m
% @original_name sidecut_radius_size (161W)
% @values r8_5_8_1_7_9=8.5_8.1_7.9 unk_sidecut_radius_161w=Unknown
% @importance 1.0

0.90::acc(s1, sidecut_radius_161w).

0.71::true_val(sidecut_radius_161w, r8_5_8_1_7_9); 0.29::true_val(sidecut_radius_161w, unk_sidecut_radius_161w).

measured(s1, sidecut_radius_161w, r8_5_8_1_7_9).

all_consistent(sidecut_radius_161w) :- consistent(s1, sidecut_radius_161w).

evidence(all_consistent(sidecut_radius_161w)).
query(true_val(sidecut_radius_161w, r8_5_8_1_7_9)).
query(true_val(sidecut_radius_161w, unk_sidecut_radius_161w)).

% @attr sidecut_radius_165
% @type categorical
% @canonical false
% @unit m
% @original_name sidecut_radius_165
% @values r8_8_8_4_8_2=8.8_8.4_8.2 unk_sidecut_radius_165=Unknown
% @importance 1.0

0.90::acc(s1, sidecut_radius_165).

0.71::true_val(sidecut_radius_165, r8_8_8_4_8_2); 0.29::true_val(sidecut_radius_165, unk_sidecut_radius_165).

measured(s1, sidecut_radius_165, r8_8_8_4_8_2).

all_consistent(sidecut_radius_165) :- consistent(s1, sidecut_radius_165).

evidence(all_consistent(sidecut_radius_165)).
query(true_val(sidecut_radius_165, r8_8_8_4_8_2)).
query(true_val(sidecut_radius_165, unk_sidecut_radius_165)).

% @attr sidecut_radius_169w
% @type categorical
% @canonical false
% @unit m
% @original_name sidecut_radius_size (169W)
% @values r9_0_8_6_8_5=9.0_8.6_8.5 unk_sidecut_radius_169w=Unknown
% @importance 1.0

0.90::acc(s1, sidecut_radius_169w).

0.71::true_val(sidecut_radius_169w, r9_0_8_6_8_5); 0.29::true_val(sidecut_radius_169w, unk_sidecut_radius_169w).

measured(s1, sidecut_radius_169w, r9_0_8_6_8_5).

all_consistent(sidecut_radius_169w) :- consistent(s1, sidecut_radius_169w).

evidence(all_consistent(sidecut_radius_169w)).
query(true_val(sidecut_radius_169w, r9_0_8_6_8_5)).
query(true_val(sidecut_radius_169w, unk_sidecut_radius_169w)).

% @attr waist_width_156
% @type numeric
% @canonical false
% @unit cm
% @original_name Waist width 156cm
% @values v25_6=25.6 unk_waist_width_156=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_156).

0.71::true_val(waist_width_156, v25_6); 0.29::true_val(waist_width_156, unk_waist_width_156).

measured(s1, waist_width_156, v25_6).

all_consistent(waist_width_156) :- consistent(s1, waist_width_156).

evidence(all_consistent(waist_width_156)).
query(true_val(waist_width_156, v25_6)).
query(true_val(waist_width_156, unk_waist_width_156)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @unit cm
% @original_name Waist width 159cm
% @values v25_9=25.9 unk_waist_width_159=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_159).

0.71::true_val(waist_width_159, v25_9); 0.29::true_val(waist_width_159, unk_waist_width_159).

measured(s1, waist_width_159, v25_9).

all_consistent(waist_width_159) :- consistent(s1, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_9)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr waist_width_162
% @type numeric
% @canonical false
% @unit cm
% @original_name Waist width 162cm
% @values v26_2=26.2 unk_waist_width_162=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_162).

0.71::true_val(waist_width_162, v26_2); 0.29::true_val(waist_width_162, unk_waist_width_162).

measured(s1, waist_width_162, v26_2).

all_consistent(waist_width_162) :- consistent(s1, waist_width_162).

evidence(all_consistent(waist_width_162)).
query(true_val(waist_width_162, v26_2)).
query(true_val(waist_width_162, unk_waist_width_162)).

% @attr waist_width_157w
% @type numeric
% @canonical false
% @unit cm
% @original_name Waist width 157W
% @values v26_4=26.4 unk_waist_width_157w=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_157w).

0.71::true_val(waist_width_157w, v26_4); 0.29::true_val(waist_width_157w, unk_waist_width_157w).

measured(s1, waist_width_157w, v26_4).

all_consistent(waist_width_157w) :- consistent(s1, waist_width_157w).

evidence(all_consistent(waist_width_157w)).
query(true_val(waist_width_157w, v26_4)).
query(true_val(waist_width_157w, unk_waist_width_157w)).

% @attr waist_width_161w
% @type numeric
% @canonical false
% @unit cm
% @original_name Waist width 161W
% @values v26_7=26.7 unk_waist_width_161w=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_161w).

0.71::true_val(waist_width_161w, v26_7); 0.29::true_val(waist_width_161w, unk_waist_width_161w).

measured(s1, waist_width_161w, v26_7).

all_consistent(waist_width_161w) :- consistent(s1, waist_width_161w).

evidence(all_consistent(waist_width_161w)).
query(true_val(waist_width_161w, v26_7)).
query(true_val(waist_width_161w, unk_waist_width_161w)).

% @attr waist_width_165
% @type numeric
% @canonical false
% @unit cm
% @original_name waist_width_165
% @values v27_0=27.0 unk_waist_width_165=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_165).

0.71::true_val(waist_width_165, v27_0); 0.29::true_val(waist_width_165, unk_waist_width_165).

measured(s1, waist_width_165, v27_0).

all_consistent(waist_width_165) :- consistent(s1, waist_width_165).

evidence(all_consistent(waist_width_165)).
query(true_val(waist_width_165, v27_0)).
query(true_val(waist_width_165, unk_waist_width_165)).

% @attr waist_width_169w
% @type numeric
% @canonical false
% @unit cm
% @original_name Waist width 169W
% @values v27_4=27.4 unk_waist_width_169w=Unknown
% @importance 1.0

0.90::acc(s1, waist_width_169w).

0.71::true_val(waist_width_169w, v27_4); 0.29::true_val(waist_width_169w, unk_waist_width_169w).

measured(s1, waist_width_169w, v27_4).

all_consistent(waist_width_169w) :- consistent(s1, waist_width_169w).

evidence(all_consistent(waist_width_169w)).
query(true_val(waist_width_169w, v27_4)).
query(true_val(waist_width_169w, unk_waist_width_169w)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @unit cm
% @original_name tip_tail_width_size (156cm)
% @values w29_6_29_5=29.6_29.5 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.90::acc(s1, tip_tail_width_size).

0.71::true_val(tip_tail_width_size, w29_6_29_5); 0.29::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s1, tip_tail_width_size, w29_6_29_5).

all_consistent(tip_tail_width_size) :- consistent(s1, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, w29_6_29_5)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr tip_tail_width_159
% @type categorical
% @canonical false
% @unit cm
% @original_name tip_tail_width_size (159cm)
% @values w30_0_29_9=30.0_29.9 unk_tip_tail_width_159=Unknown
% @importance 1.0

0.90::acc(s1, tip_tail_width_159).

0.71::true_val(tip_tail_width_159, w30_0_29_9); 0.29::true_val(tip_tail_width_159, unk_tip_tail_width_159).

measured(s1, tip_tail_width_159, w30_0_29_9).

all_consistent(tip_tail_width_159) :- consistent(s1, tip_tail_width_159).

evidence(all_consistent(tip_tail_width_159)).
query(true_val(tip_tail_width_159, w30_0_29_9)).
query(true_val(tip_tail_width_159, unk_tip_tail_width_159)).

% @attr tip_tail_width_162
% @type categorical
% @canonical false
% @unit cm
% @original_name tip_tail_width_size (162cm)
% @values w30_4_30_3=30.4_30.3 unk_tip_tail_width_162=Unknown
% @importance 1.0

0.90::acc(s1, tip_tail_width_162).

0.71::true_val(tip_tail_width_162, w30_4_30_3); 0.29::true_val(tip_tail_width_162, unk_tip_tail_width_162).

measured(s1, tip_tail_width_162, w30_4_30_3).

all_consistent(tip_tail_width_162) :- consistent(s1, tip_tail_width_162).

evidence(all_consistent(tip_tail_width_162)).
query(true_val(tip_tail_width_162, w30_4_30_3)).
query(true_val(tip_tail_width_162, unk_tip_tail_width_162)).

% @attr tip_tail_width_157w
% @type categorical
% @canonical false
% @unit cm
% @original_name tip_tail_width_size (157W)
% @values w30_5_30_3=30.5_30.3 unk_tip_tail_width_157w=Unknown
% @importance 1.0

0.90::acc(s1, tip_tail_width_157w).

0.71::true_val(tip_tail_width_157w, w30_5_30_3); 0.29::true_val(tip_tail_width_157w, unk_tip_tail_width_157w).

measured(s1, tip_tail_width_157w, w30_5_30_3).

all_consistent(tip_tail_width_157w) :- consistent(s1, tip_tail_width_157w).

evidence(all_consistent(tip_tail_width_157w)).
query(true_val(tip_tail_width_157w, w30_5_30_3)).
query(true_val(tip_tail_width_157w, unk_tip_tail_width_157w)).

% @attr tip_tail_width_161w
% @type categorical
% @canonical false
% @unit cm
% @original_name tip_tail_width_size (161W)
% @values w30_9_30_8=30.9_30.8 unk_tip_tail_width_161w=Unknown
% @importance 1.0

0.90::acc(s1, tip_tail_width_161w).

0.71::true_val(tip_tail_width_161w, w30_9_30_8); 0.29::true_val(tip_tail_width_161w, unk_tip_tail_width_161w).

measured(s1, tip_tail_width_161w, w30_9_30_8).

all_consistent(tip_tail_width_161w) :- consistent(s1, tip_tail_width_161w).

evidence(all_consistent(tip_tail_width_161w)).
query(true_val(tip_tail_width_161w, w30_9_30_8)).
query(true_val(tip_tail_width_161w, unk_tip_tail_width_161w)).

% @attr nose_tail_width_165
% @type categorical
% @canonical false
% @unit cm
% @original_name nose_tail_width_165
% @values w31_2_31_1=31.2_31.1 unk_nose_tail_width_165=Unknown
% @importance 1.0

0.90::acc(s1, nose_tail_width_165).

0.71::true_val(nose_tail_width_165, w31_2_31_1); 0.29::true_val(nose_tail_width_165, unk_nose_tail_width_165).

measured(s1, nose_tail_width_165, w31_2_31_1).

all_consistent(nose_tail_width_165) :- consistent(s1, nose_tail_width_165).

evidence(all_consistent(nose_tail_width_165)).
query(true_val(nose_tail_width_165, w31_2_31_1)).
query(true_val(nose_tail_width_165, unk_nose_tail_width_165)).

% @attr tip_tail_width_169w
% @type categorical
% @canonical false
% @unit cm
% @original_name tip_tail_width_size (169W)
% @values w31_7_31_6=31.7_31.6 unk_tip_tail_width_169w=Unknown
% @importance 1.0

0.90::acc(s1, tip_tail_width_169w).

0.71::true_val(tip_tail_width_169w, w31_7_31_6); 0.29::true_val(tip_tail_width_169w, unk_tip_tail_width_169w).

measured(s1, tip_tail_width_169w, w31_7_31_6).

all_consistent(tip_tail_width_169w) :- consistent(s1, tip_tail_width_169w).

evidence(all_consistent(tip_tail_width_169w)).
query(true_val(tip_tail_width_169w, w31_7_31_6)).
query(true_val(tip_tail_width_169w, unk_tip_tail_width_169w)).

% @attr stance_width_range_size
% @type numeric
% @canonical true
% @unit cm
% @original_name stance_width_range_size (156cm)
% @values v55_9=55.9 unk_stance_width_range_size=Unknown
% @importance 1.0

0.90::acc(s1, stance_width_range_size).

0.71::true_val(stance_width_range_size, v55_9); 0.29::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s1, stance_width_range_size, v55_9).

all_consistent(stance_width_range_size) :- consistent(s1, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v55_9)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr stance_width_range_159
% @type numeric
% @canonical false
% @unit cm
% @original_name stance_width_range_size (159cm)
% @values v55_9=55.9 unk_stance_width_range_159=Unknown
% @importance 1.0

0.90::acc(s1, stance_width_range_159).

0.71::true_val(stance_width_range_159, v55_9); 0.29::true_val(stance_width_range_159, unk_stance_width_range_159).

measured(s1, stance_width_range_159, v55_9).

all_consistent(stance_width_range_159) :- consistent(s1, stance_width_range_159).

evidence(all_consistent(stance_width_range_159)).
query(true_val(stance_width_range_159, v55_9)).
query(true_val(stance_width_range_159, unk_stance_width_range_159)).

% @attr stance_width_range_162
% @type numeric
% @canonical false
% @unit cm
% @original_name stance_width_range_size (162cm)
% @values v58_4=58.4 unk_stance_width_range_162=Unknown
% @importance 1.0

0.90::acc(s1, stance_width_range_162).

0.71::true_val(stance_width_range_162, v58_4); 0.29::true_val(stance_width_range_162, unk_stance_width_range_162).

measured(s1, stance_width_range_162, v58_4).

all_consistent(stance_width_range_162) :- consistent(s1, stance_width_range_162).

evidence(all_consistent(stance_width_range_162)).
query(true_val(stance_width_range_162, v58_4)).
query(true_val(stance_width_range_162, unk_stance_width_range_162)).

% @attr stance_width_range_157w
% @type numeric
% @canonical false
% @unit cm
% @original_name stance_width_range_size (157W)
% @values v55_9=55.9 unk_stance_width_range_157w=Unknown
% @importance 1.0

0.90::acc(s1, stance_width_range_157w).

0.71::true_val(stance_width_range_157w, v55_9); 0.29::true_val(stance_width_range_157w, unk_stance_width_range_157w).

measured(s1, stance_width_range_157w, v55_9).

all_consistent(stance_width_range_157w) :- consistent(s1, stance_width_range_157w).

evidence(all_consistent(stance_width_range_157w)).
query(true_val(stance_width_range_157w, v55_9)).
query(true_val(stance_width_range_157w, unk_stance_width_range_157w)).

% @attr stance_width_range_161w
% @type numeric
% @canonical false
% @unit cm
% @original_name stance_width_range_size (161W)
% @values v58_4=58.4 unk_stance_width_range_161w=Unknown
% @importance 1.0

0.90::acc(s1, stance_width_range_161w).

0.71::true_val(stance_width_range_161w, v58_4); 0.29::true_val(stance_width_range_161w, unk_stance_width_range_161w).

measured(s1, stance_width_range_161w, v58_4).

all_consistent(stance_width_range_161w) :- consistent(s1, stance_width_range_161w).

evidence(all_consistent(stance_width_range_161w)).
query(true_val(stance_width_range_161w, v58_4)).
query(true_val(stance_width_range_161w, unk_stance_width_range_161w)).

% @attr stance_width_range_165w
% @type numeric
% @canonical false
% @unit cm
% @original_name stance_width_range_size (165W)
% @values v58_4=58.4 unk_stance_width_range_165w=Unknown
% @importance 1.0

0.90::acc(s1, stance_width_range_165w).

0.71::true_val(stance_width_range_165w, v58_4); 0.29::true_val(stance_width_range_165w, unk_stance_width_range_165w).

measured(s1, stance_width_range_165w, v58_4).

all_consistent(stance_width_range_165w) :- consistent(s1, stance_width_range_165w).

evidence(all_consistent(stance_width_range_165w)).
query(true_val(stance_width_range_165w, v58_4)).
query(true_val(stance_width_range_165w, unk_stance_width_range_165w)).

% @attr stance_width_range_169w
% @type numeric
% @canonical false
% @unit cm
% @original_name stance_width_range_size (169W)
% @values v58_4=58.4 unk_stance_width_range_169w=Unknown
% @importance 1.0

0.90::acc(s1, stance_width_range_169w).

0.71::true_val(stance_width_range_169w, v58_4); 0.29::true_val(stance_width_range_169w, unk_stance_width_range_169w).

measured(s1, stance_width_range_169w, v58_4).

all_consistent(stance_width_range_169w) :- consistent(s1, stance_width_range_169w).

evidence(all_consistent(stance_width_range_169w)).
query(true_val(stance_width_range_169w, v58_4)).
query(true_val(stance_width_range_169w, unk_stance_width_range_169w)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @unit kg
% @original_name recommended_weight_range_size (156cm)
% @values w59_86=59_86kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_size).

0.71::true_val(recommended_weight_range_size, w59_86); 0.29::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s1, recommended_weight_range_size, w59_86).

all_consistent(recommended_weight_range_size) :- consistent(s1, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, w59_86)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr recommended_weight_range_159
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size (159cm)
% @values w63_90=63_90kg unk_recommended_weight_range_159=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_159).

0.71::true_val(recommended_weight_range_159, w63_90); 0.29::true_val(recommended_weight_range_159, unk_recommended_weight_range_159).

measured(s1, recommended_weight_range_159, w63_90).

all_consistent(recommended_weight_range_159) :- consistent(s1, recommended_weight_range_159).

evidence(all_consistent(recommended_weight_range_159)).
query(true_val(recommended_weight_range_159, w63_90)).
query(true_val(recommended_weight_range_159, unk_recommended_weight_range_159)).

% @attr recommended_weight_range_162
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size (162cm)
% @values w68_95=68_95kg unk_recommended_weight_range_162=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_162).

0.71::true_val(recommended_weight_range_162, w68_95); 0.29::true_val(recommended_weight_range_162, unk_recommended_weight_range_162).

measured(s1, recommended_weight_range_162, w68_95).

all_consistent(recommended_weight_range_162) :- consistent(s1, recommended_weight_range_162).

evidence(all_consistent(recommended_weight_range_162)).
query(true_val(recommended_weight_range_162, w68_95)).
query(true_val(recommended_weight_range_162, unk_recommended_weight_range_162)).

% @attr recommended_weight_range_157w
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size (157W)
% @values w63_90=63_90kg unk_recommended_weight_range_157w=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_157w).

0.71::true_val(recommended_weight_range_157w, w63_90); 0.29::true_val(recommended_weight_range_157w, unk_recommended_weight_range_157w).

measured(s1, recommended_weight_range_157w, w63_90).

all_consistent(recommended_weight_range_157w) :- consistent(s1, recommended_weight_range_157w).

evidence(all_consistent(recommended_weight_range_157w)).
query(true_val(recommended_weight_range_157w, w63_90)).
query(true_val(recommended_weight_range_157w, unk_recommended_weight_range_157w)).

% @attr recommended_weight_range_161w
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size (161W)
% @values w68_95=68_95kg unk_recommended_weight_range_161w=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_161w).

0.71::true_val(recommended_weight_range_161w, w68_95); 0.29::true_val(recommended_weight_range_161w, unk_recommended_weight_range_161w).

measured(s1, recommended_weight_range_161w, w68_95).

all_consistent(recommended_weight_range_161w) :- consistent(s1, recommended_weight_range_161w).

evidence(all_consistent(recommended_weight_range_161w)).
query(true_val(recommended_weight_range_161w, w68_95)).
query(true_val(recommended_weight_range_161w, unk_recommended_weight_range_161w)).

% @attr recommended_weight_165
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_165
% @values w71_100=71_100kg unk_recommended_weight_165=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_165).

0.71::true_val(recommended_weight_165, w71_100); 0.29::true_val(recommended_weight_165, unk_recommended_weight_165).

measured(s1, recommended_weight_165, w71_100).

all_consistent(recommended_weight_165) :- consistent(s1, recommended_weight_165).

evidence(all_consistent(recommended_weight_165)).
query(true_val(recommended_weight_165, w71_100)).
query(true_val(recommended_weight_165, unk_recommended_weight_165)).

% @attr recommended_weight_range_169w
% @type categorical
% @canonical false
% @unit kg
% @original_name recommended_weight_range_size (169W)
% @values w77_104=77_104kg unk_recommended_weight_range_169w=Unknown
% @importance 1.0

0.90::acc(s1, recommended_weight_range_169w).

0.71::true_val(recommended_weight_range_169w, w77_104); 0.29::true_val(recommended_weight_range_169w, unk_recommended_weight_range_169w).

measured(s1, recommended_weight_range_169w, w77_104).

all_consistent(recommended_weight_range_169w) :- consistent(s1, recommended_weight_range_169w).

evidence(all_consistent(recommended_weight_range_169w)).
query(true_val(recommended_weight_range_169w, w77_104)).
query(true_val(recommended_weight_range_169w, unk_recommended_weight_range_169w)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values alpine_v1_dir_flat_kick=Alpine_V1_Directional_plus_Flat_Kick_Tech unk_camber_type=Unknown
% @importance 1.0

0.90::acc(s1, camber_type).

0.71::true_val(camber_type, alpine_v1_dir_flat_kick); 0.29::true_val(camber_type, unk_camber_type).

measured(s1, camber_type, alpine_v1_dir_flat_kick).

all_consistent(camber_type) :- consistent(s1, camber_type).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, alpine_v1_dir_flat_kick)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name Camber description
% @values mid_camber_flat_tail_reverse_nose=Mid_body_camber_flat_tail_reverse_cambered_nose unk_camber_description=Unknown
% @importance 0.95

0.90::acc(s9, camber_description).

0.86::true_val(camber_description, mid_camber_flat_tail_reverse_nose); 0.14::true_val(camber_description, unk_camber_description).

measured(s9, camber_description, mid_camber_flat_tail_reverse_nose).

all_consistent(camber_description) :- consistent(s9, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, mid_camber_flat_tail_reverse_nose)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_detail
% @type categorical
% @canonical false
% @original_name Camber detail
% @values longer_camber_in_tail=Camber_runs_longer_in_tail unk_camber_detail=Unknown
% @importance 0.95

0.88::acc(s9, camber_detail).

0.86::true_val(camber_detail, longer_camber_in_tail); 0.14::true_val(camber_detail, unk_camber_detail).

measured(s9, camber_detail, longer_camber_in_tail).

all_consistent(camber_detail) :- consistent(s9, camber_detail).

evidence(all_consistent(camber_detail)).
query(true_val(camber_detail, longer_camber_in_tail)).
query(true_val(camber_detail, unk_camber_detail)).

% @attr camber_height_mm
% @type numeric
% @canonical true
% @unit mm
% @original_name camber_height_mm
% @values v4=4.0 unk_camber_height_mm=Unknown
% @importance 0.9

0.85::acc(s34, camber_height_mm).

0.69::true_val(camber_height_mm, v4); 0.31::true_val(camber_height_mm, unk_camber_height_mm).

measured(s34, camber_height_mm, v4).

all_consistent(camber_height_mm) :- consistent(s34, camber_height_mm).

evidence(all_consistent(camber_height_mm)).
query(true_val(camber_height_mm, v4)).
query(true_val(camber_height_mm, unk_camber_height_mm)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @unit per_10
% @original_name flex_rating_10
% @values v7=7.0 v6_5=6.5
% @importance 0.9

0.82::acc(s1, flex_rating_10).
0.93::acc(s35, flex_rating_10).
0.70::acc(s25, flex_rating_10).
0.72::acc(s28, flex_rating_10).

0.40::true_val(flex_rating_10, v7); 0.60::true_val(flex_rating_10, v6_5).

measured(s1, flex_rating_10, v7).
measured(s35, flex_rating_10, v6_5).
measured(s25, flex_rating_10, v6_5).
measured(s28, flex_rating_10, v6_5).

all_consistent(flex_rating_10) :-
    consistent(s1, flex_rating_10),
    consistent(s35, flex_rating_10),
    (indep(s25), consistent(s25, flex_rating_10) ; \+indep(s25)),
    (indep(s28), consistent(s28, flex_rating_10) ; \+indep(s28)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, v6_5)).

% @attr flex_rating_10_manufacturer
% @type numeric
% @canonical true
% @unit per_10
% @original_name flex_rating_10_manufacturer
% @values v6_5=6.5 unk_flex_rating_10_manufacturer=Unknown
% @importance 0.875

0.93::acc(s35, flex_rating_10_manufacturer).
0.75::acc(s32, flex_rating_10_manufacturer).

0.95::true_val(flex_rating_10_manufacturer, v6_5); 0.05::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s35, flex_rating_10_manufacturer, v6_5).
measured(s32, flex_rating_10_manufacturer, v6_5).

all_consistent(flex_rating_10_manufacturer) :-
    consistent(s35, flex_rating_10_manufacturer),
    consistent(s32, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, v6_5)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_feel
% @type numeric
% @canonical true
% @unit per_10
% @original_name Flex feel on snow
% @values v7=7.0 v8=8.0 v9=9.0
% @importance 0.88

0.88::acc(s33, flex_feel).
0.82::acc(s34, flex_feel).
0.72::acc(s36, flex_feel).

0.40::true_val(flex_feel, v7); 0.40::true_val(flex_feel, v8); 0.20::true_val(flex_feel, v9).

measured(s33, flex_feel, v8).
measured(s34, flex_feel, v7).
measured(s36, flex_feel, v9).

all_consistent(flex_feel) :-
    consistent(s33, flex_feel),
    consistent(s34, flex_feel),
    consistent(s36, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, v7)).
query(true_val(flex_feel, v8)).
query(true_val(flex_feel, v9)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_stiffer_tail=Directional_stiffer_tail_softer_nose unk_flex_direction=Unknown
% @importance 1.0

0.90::acc(s1, flex_direction).

0.71::true_val(flex_direction, directional_stiffer_tail); 0.29::true_val(flex_direction, unk_flex_direction).

measured(s1, flex_direction, directional_stiffer_tail).

all_consistent(flex_direction) :- consistent(s1, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_stiffer_tail)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_pattern
% @type categorical
% @canonical false
% @original_name Flex pattern
% @values medium_softer_nose=Medium_overall_softer_nose_than_tail unk_flex_pattern=Unknown
% @importance 0.9

0.82::acc(s33, flex_pattern).

0.74::true_val(flex_pattern, medium_softer_nose); 0.26::true_val(flex_pattern, unk_flex_pattern).

measured(s33, flex_pattern, medium_softer_nose).

all_consistent(flex_pattern) :- consistent(s33, flex_pattern).

evidence(all_consistent(flex_pattern)).
query(true_val(flex_pattern, medium_softer_nose)).
query(true_val(flex_pattern, unk_flex_pattern)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values stiff=Stiff unk_flex_rating_10_evo=Unknown
% @importance 0.95

0.85::acc(s20, flex_rating_10_evo).

0.81::true_val(flex_rating_10_evo, stiff); 0.19::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s20, flex_rating_10_evo, stiff).

all_consistent(flex_rating_10_evo) :- consistent(s20, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 1.0

0.90::acc(s1, mounting_pattern).

0.71::true_val(mounting_pattern, inserts_2x4); 0.29::true_val(mounting_pattern, unk_mounting_pattern).

measured(s1, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s1, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values plt_technology=PLT_Technology unk_topsheet=Unknown
% @importance 1.0

0.90::acc(s1, topsheet).

0.71::true_val(topsheet, plt_technology); 0.29::true_val(topsheet, unk_topsheet).

measured(s1, topsheet, plt_technology).

all_consistent(topsheet) :- consistent(s1, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, plt_technology)).
query(true_val(topsheet, unk_topsheet)).

% @attr printing_technology
% @type categorical
% @canonical false
% @original_name Printing technology
% @values pam16000=PAM16000_16000_nozzle_solventless_UV unk_printing_technology=Unknown
% @importance 1.0

0.88::acc(s1, printing_technology).

0.71::true_val(printing_technology, pam16000); 0.29::true_val(printing_technology, unk_printing_technology).

measured(s1, printing_technology, pam16000).

all_consistent(printing_technology) :- consistent(s1, printing_technology).

evidence(all_consistent(printing_technology)).
query(true_val(printing_technology, pam16000)).
query(true_val(printing_technology, unk_printing_technology)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values holysheet_tri_tri=Holysheet_Tri_Tri_Fiberglass unk_laminate=Unknown
% @importance 1.0

0.90::acc(s1, laminate).

0.71::true_val(laminate, holysheet_tri_tri); 0.29::true_val(laminate, unk_laminate).

measured(s1, laminate, holysheet_tri_tri).

all_consistent(laminate) :- consistent(s1, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, holysheet_tri_tri)).
query(true_val(laminate, unk_laminate)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values magic_bean=Magic_Bean_Resin_60pct_bio unk_resin=Unknown
% @importance 1.0

0.90::acc(s1, resin).

0.71::true_val(resin, magic_bean); 0.29::true_val(resin, unk_resin).

measured(s1, resin, magic_bean).

all_consistent(resin) :- consistent(s1, resin).

evidence(all_consistent(resin)).
query(true_val(resin, magic_bean)).
query(true_val(resin, unk_resin)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values fairmat_carbon_4x20mm=4x20mm_Fairmat_Carbon_Amplifiers unk_construction_material_innovation=Unknown
% @importance 1.0

0.88::acc(s1, construction_material_innovation).

0.71::true_val(construction_material_innovation, fairmat_carbon_4x20mm); 0.29::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s1, construction_material_innovation, fairmat_carbon_4x20mm).

all_consistent(construction_material_innovation) :- consistent(s1, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, fairmat_carbon_4x20mm)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_carbonflax
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Carbonflax)
% @values carbonflax=Carbonflax_natural_flax_carbon unk_construction_material_carbonflax=Unknown
% @importance 1.0

0.90::acc(s1, construction_material_carbonflax).
0.90::acc(s35, construction_material_carbonflax).

0.95::true_val(construction_material_carbonflax, carbonflax); 0.05::true_val(construction_material_carbonflax, unk_construction_material_carbonflax).

measured(s1, construction_material_carbonflax, carbonflax).
measured(s35, construction_material_carbonflax, carbonflax).

all_consistent(construction_material_carbonflax) :-
    (indep(s1), consistent(s1, construction_material_carbonflax) ; \+indep(s1)),
    consistent(s35, construction_material_carbonflax).

evidence(all_consistent(construction_material_carbonflax)).
query(true_val(construction_material_carbonflax, carbonflax)).
query(true_val(construction_material_carbonflax, unk_construction_material_carbonflax)).

% @attr construction_material_carbon_fleece
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Carbon Fleece)
% @values two_carbon_fleece=Two_Carbon_Fleece_Power_Shields unk_construction_material_carbon_fleece=Unknown
% @importance 1.0

0.88::acc(s1, construction_material_carbon_fleece).

0.71::true_val(construction_material_carbon_fleece, two_carbon_fleece); 0.29::true_val(construction_material_carbon_fleece, unk_construction_material_carbon_fleece).

measured(s1, construction_material_carbon_fleece, two_carbon_fleece).

all_consistent(construction_material_carbon_fleece) :- consistent(s1, construction_material_carbon_fleece).

evidence(all_consistent(construction_material_carbon_fleece)).
query(true_val(construction_material_carbon_fleece, two_carbon_fleece)).
query(true_val(construction_material_carbon_fleece, unk_construction_material_carbon_fleece)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values thermopolymer_hover=Thermopolymer_Hover_Core unk_core_material=Unknown
% @importance 1.0

0.90::acc(s1, core_material).

0.71::true_val(core_material, thermopolymer_hover); 0.29::true_val(core_material, unk_core_material).

measured(s1, core_material, thermopolymer_hover).

all_consistent(core_material) :- consistent(s1, core_material).

evidence(all_consistent(core_material)).
query(true_val(core_material, thermopolymer_hover)).
query(true_val(core_material, unk_core_material)).

% @attr core_wood_species
% @type categorical
% @canonical false
% @original_name Core wood species (2023 spec)
% @values poplar_paulownia=Poplar_and_Paulownia_with_recycled_PET unk_core_wood_species=Unknown
% @importance 0.5

0.65::acc(s38, core_wood_species).

0.49::true_val(core_wood_species, poplar_paulownia); 0.51::true_val(core_wood_species, unk_core_wood_species).

measured(s38, core_wood_species, poplar_paulownia).

all_consistent(core_wood_species) :- consistent(s38, core_wood_species).

evidence(all_consistent(core_wood_species)).
query(true_val(core_wood_species, poplar_paulownia)).
query(true_val(core_wood_species, unk_core_wood_species)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_certified_3d=FSC_Certified_3D unk_sustainability_certification_fsc=Unknown
% @importance 0.7

0.85::acc(s39, sustainability_certification_fsc).

0.72::true_val(sustainability_certification_fsc, fsc_certified_3d); 0.28::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s39, sustainability_certification_fsc, fsc_certified_3d).

all_consistent(sustainability_certification_fsc) :- consistent(s39, sustainability_certification_fsc).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified_3d)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values megadrive_xt=Megadrive_XT_sintered_UHMW_carbon_fluro unk_base_material=Unknown
% @importance 1.0

0.88::acc(s1, base_material).

0.71::true_val(base_material, megadrive_xt); 0.29::true_val(base_material, unk_base_material).

measured(s1, base_material, megadrive_xt).

all_consistent(base_material) :- consistent(s1, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, megadrive_xt)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values moonshot_omni_tune=Moonshot_Omni_Tune unk_base_type=Unknown
% @importance 1.0

0.88::acc(s1, base_type).

0.71::true_val(base_type, moonshot_omni_tune); 0.29::true_val(base_type, unk_base_type).

measured(s1, base_type, moonshot_omni_tune).

all_consistent(base_type) :- consistent(s1, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, moonshot_omni_tune)).
query(true_val(base_type, unk_base_type)).

% @attr base_protection
% @type categorical
% @canonical false
% @original_name Base protection
% @values inlaid_alloy_skid=Inlaid_Alloy_Skid_Plates unk_base_protection=Unknown
% @importance 1.0

0.88::acc(s1, base_protection).

0.71::true_val(base_protection, inlaid_alloy_skid); 0.29::true_val(base_protection, unk_base_protection).

measured(s1, base_protection, inlaid_alloy_skid).

all_consistent(base_protection) :- consistent(s1, base_protection).

evidence(all_consistent(base_protection)).
query(true_val(base_protection, inlaid_alloy_skid)).
query(true_val(base_protection, unk_base_protection)).

% @attr base_cutting
% @type categorical
% @canonical false
% @original_name Base cutting
% @values laser_guided_die=Laser_guided_die_cutting unk_base_cutting=Unknown
% @importance 1.0

0.88::acc(s1, base_cutting).

0.71::true_val(base_cutting, laser_guided_die); 0.29::true_val(base_cutting, unk_base_cutting).

measured(s1, base_cutting, laser_guided_die).

all_consistent(base_cutting) :- consistent(s1, base_cutting).

evidence(all_consistent(base_cutting)).
query(true_val(base_cutting, laser_guided_die)).
query(true_val(base_cutting, unk_base_cutting)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values random=Random_base_colours unk_available_colors=Unknown
% @importance 1.0

0.88::acc(s1, available_colors).

0.71::true_val(available_colors, random); 0.29::true_val(available_colors, unk_available_colors).

measured(s1, available_colors, random).

all_consistent(available_colors) :- consistent(s1, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, random)).
query(true_val(available_colors, unk_available_colors)).

% @attr sidewall_material
% @type categorical
% @canonical false
% @original_name sidewall_material
% @values abs1000=Full_ABS1000_Sidewalls unk_sidewall_material=Unknown
% @importance 0.65

0.80::acc(s40, sidewall_material).

0.64::true_val(sidewall_material, abs1000); 0.36::true_val(sidewall_material, unk_sidewall_material).

measured(s40, sidewall_material, abs1000).

all_consistent(sidewall_material) :- consistent(s40, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, abs1000)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr edge_material
% @type categorical
% @canonical false
% @original_name Edge material
% @values hrc48_steel_360=360_Degree_HRC48_Steel_Edges unk_edge_material=Unknown
% @importance 0.65

0.80::acc(s40, edge_material).

0.64::true_val(edge_material, hrc48_steel_360); 0.36::true_val(edge_material, unk_edge_material).

measured(s40, edge_material, hrc48_steel_360).

all_consistent(edge_material) :- consistent(s40, edge_material).

evidence(all_consistent(edge_material)).
query(true_val(edge_material, hrc48_steel_360)).
query(true_val(edge_material, unk_edge_material)).

% @attr insert_material
% @type categorical
% @canonical false
% @original_name Insert material
% @values stainless_4x2=Stainless_Steel_4x2_Inserts unk_insert_material=Unknown
% @importance 0.65

0.80::acc(s40, insert_material).

0.64::true_val(insert_material, stainless_4x2); 0.36::true_val(insert_material, unk_insert_material).

measured(s40, insert_material, stainless_4x2).

all_consistent(insert_material) :- consistent(s40, insert_material).

evidence(all_consistent(insert_material)).
query(true_val(insert_material, stainless_4x2)).
query(true_val(insert_material, unk_insert_material)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name rider_level
% @values advanced=Advanced advanced_expert=Advanced_Expert
% @importance 0.975

0.82::acc(s1, skill_level_recommendation).
0.88::acc(s20, skill_level_recommendation).

0.40::true_val(skill_level_recommendation, advanced); 0.60::true_val(skill_level_recommendation, advanced_expert).

measured(s1, skill_level_recommendation, advanced).
measured(s20, skill_level_recommendation, advanced_expert).

all_consistent(skill_level_recommendation) :-
    (indep(s1), consistent(s1, skill_level_recommendation) ; \+indep(s1)),
    consistent(s20, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, advanced)).
query(true_val(skill_level_recommendation, advanced_expert)).

% @attr target_rider
% @type categorical
% @canonical false
% @original_name Target rider
% @values aggressive_advanced=Aggressive_advanced_riders_speed_air_powder unk_target_rider=Unknown
% @importance 0.85

0.82::acc(s41, target_rider).

0.64::true_val(target_rider, aggressive_advanced); 0.36::true_val(target_rider, unk_target_rider).

measured(s41, target_rider, aggressive_advanced).

all_consistent(target_rider) :- consistent(s41, target_rider).

evidence(all_consistent(target_rider)).
query(true_val(target_rider, aggressive_advanced)).
query(true_val(target_rider, unk_target_rider)).

% @attr not_for_beginners
% @type categorical
% @canonical false
% @original_name Not for beginners
% @values confirmed=Not_for_beginners_or_many_intermediates unk_not_for_beginners=Unknown
% @importance 0.85

0.82::acc(s33, not_for_beginners).

0.74::true_val(not_for_beginners, confirmed); 0.26::true_val(not_for_beginners, unk_not_for_beginners).

measured(s33, not_for_beginners, confirmed).

all_consistent(not_for_beginners) :- consistent(s33, not_for_beginners).

evidence(all_consistent(not_for_beginners)).
query(true_val(not_for_beginners, confirmed)).
query(true_val(not_for_beginners, unk_not_for_beginners)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mountain_freeride=All_Mountain_and_Freeride unk_terrain_suitability=Unknown
% @importance 1.0

0.90::acc(s1, terrain_suitability).

0.71::true_val(terrain_suitability, all_mountain_freeride); 0.29::true_val(terrain_suitability, unk_terrain_suitability).

measured(s1, terrain_suitability, all_mountain_freeride).

all_consistent(terrain_suitability) :- consistent(s1, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mountain_freeride)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_for_park_playful=Not_for_playful_riding_park_or_ground_tricks unk_negative_aspect=Unknown
% @importance 0.9

0.82::acc(s33, negative_aspect).

0.74::true_val(negative_aspect, not_for_park_playful); 0.26::true_val(negative_aspect, unk_negative_aspect).

measured(s33, negative_aspect, not_for_park_playful).

all_consistent(negative_aspect) :- consistent(s33, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_for_park_playful)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr riding_style
% @type categorical
% @canonical false
% @original_name Riding style
% @values hard_charger=Hard_charger_likes_speed unk_riding_style=Unknown
% @importance 0.85

0.82::acc(s41, riding_style).

0.64::true_val(riding_style, hard_charger); 0.36::true_val(riding_style, unk_riding_style).

measured(s41, riding_style, hard_charger).

all_consistent(riding_style) :- consistent(s41, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, hard_charger)).
query(true_val(riding_style, unk_riding_style)).

% @attr forgiveness
% @type categorical
% @canonical false
% @original_name Forgiveness
% @values some_forgiveness=Just_enough_forgiveness_to_chill unk_forgiveness=Unknown
% @importance 0.85

0.80::acc(s41, forgiveness).

0.64::true_val(forgiveness, some_forgiveness); 0.36::true_val(forgiveness, unk_forgiveness).

measured(s41, forgiveness, some_forgiveness).

all_consistent(forgiveness) :- consistent(s41, forgiveness).

evidence(all_consistent(forgiveness)).
query(true_val(forgiveness, some_forgiveness)).
query(true_val(forgiveness, unk_forgiveness)).

% @attr carving
% @type categorical
% @canonical false
% @original_name Carving
% @values excellent_high_speed=Excellent_prefers_high_speed_long_radius unk_carving=Unknown
% @importance 0.9

0.85::acc(s33, carving).

0.74::true_val(carving, excellent_high_speed); 0.26::true_val(carving, unk_carving).

measured(s33, carving, excellent_high_speed).

all_consistent(carving) :- consistent(s33, carving).

evidence(all_consistent(carving)).
query(true_val(carving, excellent_high_speed)).
query(true_val(carving, unk_carving)).

% @attr speed_stability
% @type categorical
% @canonical false
% @original_name Speed/stability
% @values exceptional=One_of_stiffest_dampest_most_stable unk_speed_stability=Unknown
% @importance 0.85

0.78::acc(s36, speed_stability).

0.53::true_val(speed_stability, exceptional); 0.47::true_val(speed_stability, unk_speed_stability).

measured(s36, speed_stability, exceptional).

all_consistent(speed_stability) :- consistent(s36, speed_stability).

evidence(all_consistent(speed_stability)).
query(true_val(speed_stability, exceptional)).
query(true_val(speed_stability, unk_speed_stability)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name Edge hold
% @values good_not_great_ice=Good_in_good_snow_not_best_on_ice unk_edge_hold=Unknown
% @importance 0.9

0.85::acc(s33, edge_hold).

0.74::true_val(edge_hold, good_not_great_ice); 0.26::true_val(edge_hold, unk_edge_hold).

measured(s33, edge_hold, good_not_great_ice).

all_consistent(edge_hold) :- consistent(s33, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, good_not_great_ice)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr weight_feel
% @type categorical
% @canonical false
% @original_name Weight feel
% @values significantly_lighter=Significantly_lighter_than_average unk_weight_feel=Unknown
% @importance 0.9

0.82::acc(s34, weight_feel).

0.69::true_val(weight_feel, significantly_lighter); 0.31::true_val(weight_feel, unk_weight_feel).

measured(s34, weight_feel, significantly_lighter).

all_consistent(weight_feel) :- consistent(s34, weight_feel).

evidence(all_consistent(weight_feel)).
query(true_val(weight_feel, significantly_lighter)).
query(true_val(weight_feel, unk_weight_feel)).

% @attr pop
% @type categorical
% @canonical false
% @original_name Pop
% @values solid=Solid_better_than_expected_for_camber unk_pop=Unknown
% @importance 0.9

0.82::acc(s33, pop).

0.74::true_val(pop, solid); 0.26::true_val(pop, unk_pop).

measured(s33, pop, solid).

all_consistent(pop) :- consistent(s33, pop).

evidence(all_consistent(pop)).
query(true_val(pop, solid)).
query(true_val(pop, unk_pop)).

% @attr float_in_powder
% @type categorical
% @canonical false
% @original_name Float in powder
% @values good_enough=Good_enough_but_strength_is_speed_carving unk_float_in_powder=Unknown
% @importance 0.9

0.82::acc(s33, float_in_powder).

0.74::true_val(float_in_powder, good_enough); 0.26::true_val(float_in_powder, unk_float_in_powder).

measured(s33, float_in_powder, good_enough).

all_consistent(float_in_powder) :- consistent(s33, float_in_powder).

evidence(all_consistent(float_in_powder)).
query(true_val(float_in_powder, good_enough)).
query(true_val(float_in_powder, unk_float_in_powder)).

% @attr turning
% @type categorical
% @canonical false
% @original_name Turning
% @values balanced_any_radius=Balanced_any_radius_turn unk_turning=Unknown
% @importance 0.9

0.82::acc(s33, turning).

0.74::true_val(turning, balanced_any_radius); 0.26::true_val(turning, unk_turning).

measured(s33, turning, balanced_any_radius).

all_consistent(turning) :- consistent(s33, turning).

evidence(all_consistent(turning)).
query(true_val(turning, balanced_any_radius)).
query(true_val(turning, unk_turning)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name Switch riding
% @values possible_limited=Possible_but_limited_by_tail_rocker unk_switch_riding=Unknown
% @importance 0.9

0.82::acc(s33, switch_riding).

0.74::true_val(switch_riding, possible_limited); 0.26::true_val(switch_riding, unk_switch_riding).

measured(s33, switch_riding, possible_limited).

all_consistent(switch_riding) :- consistent(s33, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, possible_limited)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr one_board_quiver_potential
% @type categorical
% @canonical false
% @original_name One-board quiver potential
% @values good_aggressive=Good_for_aggressive_riders unk_one_board_quiver_potential=Unknown
% @importance 0.9

0.82::acc(s33, one_board_quiver_potential).

0.74::true_val(one_board_quiver_potential, good_aggressive); 0.26::true_val(one_board_quiver_potential, unk_one_board_quiver_potential).

measured(s33, one_board_quiver_potential, good_aggressive).

all_consistent(one_board_quiver_potential) :- consistent(s33, one_board_quiver_potential).

evidence(all_consistent(one_board_quiver_potential)).
query(true_val(one_board_quiver_potential, good_aggressive)).
query(true_val(one_board_quiver_potential, unk_one_board_quiver_potential)).

% @attr snowboardingprofiles_rating
% @type numeric
% @canonical false
% @unit per_100
% @original_name SnowboardingProfiles rating
% @values v87_0=87.0 unk_snowboardingprofiles_rating=Unknown
% @importance 0.9

0.82::acc(s34, snowboardingprofiles_rating).

0.69::true_val(snowboardingprofiles_rating, v87_0); 0.31::true_val(snowboardingprofiles_rating, unk_snowboardingprofiles_rating).

measured(s34, snowboardingprofiles_rating, v87_0).

all_consistent(snowboardingprofiles_rating) :- consistent(s34, snowboardingprofiles_rating).

evidence(all_consistent(snowboardingprofiles_rating)).
query(true_val(snowboardingprofiles_rating, v87_0)).
query(true_val(snowboardingprofiles_rating, unk_snowboardingprofiles_rating)).

% @attr snowboardingprofiles_ranking
% @type categorical
% @canonical false
% @original_name SnowboardingProfiles ranking
% @values rank_10_of_27=10th_out_of_27_freeride_boards unk_snowboardingprofiles_ranking=Unknown
% @importance 0.9

0.82::acc(s34, snowboardingprofiles_ranking).

0.69::true_val(snowboardingprofiles_ranking, rank_10_of_27); 0.31::true_val(snowboardingprofiles_ranking, unk_snowboardingprofiles_ranking).

measured(s34, snowboardingprofiles_ranking, rank_10_of_27).

all_consistent(snowboardingprofiles_ranking) :- consistent(s34, snowboardingprofiles_ranking).

evidence(all_consistent(snowboardingprofiles_ranking)).
query(true_val(snowboardingprofiles_ranking, rank_10_of_27)).
query(true_val(snowboardingprofiles_ranking, unk_snowboardingprofiles_ranking)).

% @attr switch_skate_snow_opinion
% @type categorical
% @canonical false
% @original_name Switch Skate & Snow opinion
% @values top_tier=Top_tier_board_for_serious_riders unk_switch_skate_snow_opinion=Unknown
% @importance 0.75

0.75::acc(s32, switch_skate_snow_opinion).

0.51::true_val(switch_skate_snow_opinion, top_tier); 0.49::true_val(switch_skate_snow_opinion, unk_switch_skate_snow_opinion).

measured(s32, switch_skate_snow_opinion, top_tier).

all_consistent(switch_skate_snow_opinion) :- consistent(s32, switch_skate_snow_opinion).

evidence(all_consistent(switch_skate_snow_opinion)).
query(true_val(switch_skate_snow_opinion, top_tier)).
query(true_val(switch_skate_snow_opinion, unk_switch_skate_snow_opinion)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values whitelines_100_selected=Selected_for_Whitelines_100_2020_21 unk_reviewer_opinion_whitelines=Unknown
% @importance 0.5

0.80::acc(s11, reviewer_opinion_whitelines).

0.72::true_val(reviewer_opinion_whitelines, whitelines_100_selected); 0.28::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s11, reviewer_opinion_whitelines, whitelines_100_selected).

all_consistent(reviewer_opinion_whitelines) :- consistent(s11, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, whitelines_100_selected)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr tgr_review_note_2026
% @type categorical
% @canonical false
% @original_name The Good Ride review note (2026)
% @values gloss_topsheet_less_damp=2026_gloss_topsheet_less_damp_more_bucky unk_tgr_review_note_2026=Unknown
% @importance 0.9

0.85::acc(s33, tgr_review_note_2026).

0.74::true_val(tgr_review_note_2026, gloss_topsheet_less_damp); 0.26::true_val(tgr_review_note_2026, unk_tgr_review_note_2026).

measured(s33, tgr_review_note_2026, gloss_topsheet_less_damp).

all_consistent(tgr_review_note_2026) :- consistent(s33, tgr_review_note_2026).

evidence(all_consistent(tgr_review_note_2026)).
query(true_val(tgr_review_note_2026, gloss_topsheet_less_damp)).
query(true_val(tgr_review_note_2026, unk_tgr_review_note_2026)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name Carving excellence
% @values carving_strength=Carving_was_one_of_its_strengths unk_positive_aspect=Unknown
% @importance 0.9

0.85::acc(s33, positive_aspect).

0.74::true_val(positive_aspect, carving_strength); 0.26::true_val(positive_aspect, unk_positive_aspect).

measured(s33, positive_aspect, carving_strength).

all_consistent(positive_aspect) :- consistent(s33, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, carving_strength)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr positive_aspect_speed
% @type categorical
% @canonical false
% @original_name Speed
% @values fast_excellent_carving_jumps=Fast_board_excellent_carving_and_jumps unk_positive_aspect_speed=Unknown
% @importance 0.9

0.82::acc(s33, positive_aspect_speed).

0.74::true_val(positive_aspect_speed, fast_excellent_carving_jumps); 0.26::true_val(positive_aspect_speed, unk_positive_aspect_speed).

measured(s33, positive_aspect_speed, fast_excellent_carving_jumps).

all_consistent(positive_aspect_speed) :- consistent(s33, positive_aspect_speed).

evidence(all_consistent(positive_aspect_speed)).
query(true_val(positive_aspect_speed, fast_excellent_carving_jumps)).
query(true_val(positive_aspect_speed, unk_positive_aspect_speed)).

% @attr positive_aspect_lively_feel
% @type categorical
% @canonical false
% @original_name Lively feel
% @values stable_damp_lively=Great_edge_hold_stable_damp_still_lively unk_positive_aspect_lively_feel=Unknown
% @importance 0.9

0.82::acc(s33, positive_aspect_lively_feel).

0.74::true_val(positive_aspect_lively_feel, stable_damp_lively); 0.26::true_val(positive_aspect_lively_feel, unk_positive_aspect_lively_feel).

measured(s33, positive_aspect_lively_feel, stable_damp_lively).

all_consistent(positive_aspect_lively_feel) :- consistent(s33, positive_aspect_lively_feel).

evidence(all_consistent(positive_aspect_lively_feel)).
query(true_val(positive_aspect_lively_feel, stable_damp_lively)).
query(true_val(positive_aspect_lively_feel, unk_positive_aspect_lively_feel)).

% @attr positive_aspect_fun_factor
% @type categorical
% @canonical false
% @original_name Fun factor
% @values rewards_pushing=Kept_wanting_to_push_more_rewarded unk_positive_aspect_fun_factor=Unknown
% @importance 0.9

0.82::acc(s33, positive_aspect_fun_factor).

0.74::true_val(positive_aspect_fun_factor, rewards_pushing); 0.26::true_val(positive_aspect_fun_factor, unk_positive_aspect_fun_factor).

measured(s33, positive_aspect_fun_factor, rewards_pushing).

all_consistent(positive_aspect_fun_factor) :- consistent(s33, positive_aspect_fun_factor).

evidence(all_consistent(positive_aspect_fun_factor)).
query(true_val(positive_aspect_fun_factor, rewards_pushing)).
query(true_val(positive_aspect_fun_factor, unk_positive_aspect_fun_factor)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name Forum recommendation
% @values highly_recommended=Quick_edge_to_edge_handles_anything_highly_recommended unk_user_review_forum=Unknown
% @importance 0.75

0.65::acc(s42, user_review_forum).

0.30::true_val(user_review_forum, highly_recommended); 0.70::true_val(user_review_forum, unk_user_review_forum).

measured(s42, user_review_forum, highly_recommended).

all_consistent(user_review_forum) :- consistent(s42, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, highly_recommended)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr dampening_concern
% @type categorical
% @canonical false
% @original_name Dampening concern
% @values below_avg_older_model=Not_damp_below_average_older_model unk_dampening_concern=Unknown
% @importance 0.6

0.50::acc(s43, dampening_concern).

0.23::true_val(dampening_concern, below_avg_older_model); 0.77::true_val(dampening_concern, unk_dampening_concern).

measured(s43, dampening_concern, below_avg_older_model).

all_consistent(dampening_concern) :- consistent(s43, dampening_concern).

evidence(all_consistent(dampening_concern)).
query(true_val(dampening_concern, below_avg_older_model)).
query(true_val(dampening_concern, unk_dampening_concern)).

% @attr topsheet_durability
% @type categorical
% @canonical false
% @original_name Topsheet durability
% @values marks_easily=Topsheet_marked_up_very_easily unk_topsheet_durability=Unknown
% @importance 0.9

0.80::acc(s33, topsheet_durability).

0.74::true_val(topsheet_durability, marks_easily); 0.26::true_val(topsheet_durability, unk_topsheet_durability).

measured(s33, topsheet_durability, marks_easily).

all_consistent(topsheet_durability) :- consistent(s33, topsheet_durability).

evidence(all_consistent(topsheet_durability)).
query(true_val(topsheet_durability, marks_easily)).
query(true_val(topsheet_durability, unk_topsheet_durability)).

% @attr nose_softness_older
% @type categorical
% @canonical false
% @original_name Nose softness (older models)
% @values soft_floppy_older=Nose_soft_floppy_on_older_models_addressed_later unk_nose_softness_older=Unknown
% @importance 0.5

0.50::acc(s44, nose_softness_older).

0.25::true_val(nose_softness_older, soft_floppy_older); 0.75::true_val(nose_softness_older, unk_nose_softness_older).

measured(s44, nose_softness_older, soft_floppy_older).

all_consistent(nose_softness_older) :- consistent(s44, nose_softness_older).

evidence(all_consistent(nose_softness_older)).
query(true_val(nose_softness_older, soft_floppy_older)).
query(true_val(nose_softness_older, unk_nose_softness_older)).

% @attr not_for_casual_riders
% @type categorical
% @canonical false
% @original_name Not for casual riders
% @values confirmed=Not_for_casual_park_or_developing_riders unk_not_for_casual_riders=Unknown
% @importance 0.75

0.78::acc(s32, not_for_casual_riders).

0.51::true_val(not_for_casual_riders, confirmed); 0.49::true_val(not_for_casual_riders, unk_not_for_casual_riders).

measured(s32, not_for_casual_riders, confirmed).

all_consistent(not_for_casual_riders) :- consistent(s32, not_for_casual_riders).

evidence(all_consistent(not_for_casual_riders)).
query(true_val(not_for_casual_riders, confirmed)).
query(true_val(not_for_casual_riders, unk_not_for_casual_riders)).

% @attr edge_hold_on_ice
% @type categorical
% @canonical false
% @original_name Edge hold on ice
% @values not_best_on_ice=Not_best_in_icy_conditions_vs_Magnetraction unk_edge_hold_on_ice=Unknown
% @importance 0.9

0.82::acc(s33, edge_hold_on_ice).

0.74::true_val(edge_hold_on_ice, not_best_on_ice); 0.26::true_val(edge_hold_on_ice, unk_edge_hold_on_ice).

measured(s33, edge_hold_on_ice, not_best_on_ice).

all_consistent(edge_hold_on_ice) :- consistent(s33, edge_hold_on_ice).

evidence(all_consistent(edge_hold_on_ice)).
query(true_val(edge_hold_on_ice, not_best_on_ice)).
query(true_val(edge_hold_on_ice, unk_edge_hold_on_ice)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name Similar boards per The Good Ride
% @values tgr_list=Korua_Otto_Mercury_YES_NSB_Jones_MT_K2_Manifest unk_comparable_board_cross_brand=Unknown
% @importance 0.9

0.85::acc(s33, comparable_board_cross_brand).

0.74::true_val(comparable_board_cross_brand, tgr_list); 0.26::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s33, comparable_board_cross_brand, tgr_list).

all_consistent(comparable_board_cross_brand) :- consistent(s33, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, tgr_list)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_slash
% @type categorical
% @canonical false
% @original_name Alternatives per Slash Board Shop
% @values slash_list=K2_Alchemist_Jones_Flagship_Pro_Nitro_Pantera_Ride_Commissioner_Arbor_Candle unk_comparable_board_cross_brand_slash=Unknown
% @importance 0.85

0.75::acc(s36, comparable_board_cross_brand_slash).

0.53::true_val(comparable_board_cross_brand_slash, slash_list); 0.47::true_val(comparable_board_cross_brand_slash, unk_comparable_board_cross_brand_slash).

measured(s36, comparable_board_cross_brand_slash, slash_list).

all_consistent(comparable_board_cross_brand_slash) :- consistent(s36, comparable_board_cross_brand_slash).

evidence(all_consistent(comparable_board_cross_brand_slash)).
query(true_val(comparable_board_cross_brand_slash, slash_list)).
query(true_val(comparable_board_cross_brand_slash, unk_comparable_board_cross_brand_slash)).

% @attr jones_flagship_comparison
% @type categorical
% @canonical false
% @original_name Jones Flagship comparison
% @values flagship_more_stable=Flagship_has_more_stability_better_contact_points unk_jones_flagship_comparison=Unknown
% @importance 0.75

0.55::acc(s42, jones_flagship_comparison).

0.30::true_val(jones_flagship_comparison, flagship_more_stable); 0.70::true_val(jones_flagship_comparison, unk_jones_flagship_comparison).

measured(s42, jones_flagship_comparison, flagship_more_stable).

all_consistent(jones_flagship_comparison) :- consistent(s42, jones_flagship_comparison).

evidence(all_consistent(jones_flagship_comparison)).
query(true_val(jones_flagship_comparison, flagship_more_stable)).
query(true_val(jones_flagship_comparison, unk_jones_flagship_comparison)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @unit years
% @original_name warranty_period_years
% @values v2=2 unk_warranty_period_years=Unknown
% @importance 0.8

0.95::acc(s46, warranty_period_years).
0.82::acc(s39, warranty_period_years).

0.97::true_val(warranty_period_years, v2); 0.03::true_val(warranty_period_years, unk_warranty_period_years).

measured(s46, warranty_period_years, v2).
measured(s39, warranty_period_years, v2).

all_consistent(warranty_period_years) :-
    consistent(s46, warranty_period_years),
    (indep(s39), consistent(s39, warranty_period_years) ; \+indep(s39)).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v2)).
query(true_val(warranty_period_years, unk_warranty_period_years)).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name Warranty coverage
% @values delam_cracking_inserts=Topsheet_base_sidewall_delam_cracking_inserts unk_warranty_coverage=Unknown
% @importance 0.8

0.92::acc(s46, warranty_coverage).

0.90::true_val(warranty_coverage, delam_cracking_inserts); 0.10::true_val(warranty_coverage, unk_warranty_coverage).

measured(s46, warranty_coverage, delam_cracking_inserts).

all_consistent(warranty_coverage) :- consistent(s46, warranty_coverage).

evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, delam_cracking_inserts)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name Warranty exclusions
% @values impact_damage=Damage_caused_by_impact_delam_stress_cracking unk_warranty_exclusions=Unknown
% @importance 0.8

0.92::acc(s46, warranty_exclusions).

0.90::true_val(warranty_exclusions, impact_damage); 0.10::true_val(warranty_exclusions, unk_warranty_exclusions).

measured(s46, warranty_exclusions, impact_damage).

all_consistent(warranty_exclusions) :- consistent(s46, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, impact_damage)).
query(true_val(warranty_exclusions, unk_warranty_exclusions)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values nfc_serial_registration=NFC_based_serial_registration_available unk_warranty=Unknown
% @importance 0.8

0.90::acc(s46, warranty).

0.90::true_val(warranty, nfc_serial_registration); 0.10::true_val(warranty, unk_warranty).

measured(s46, warranty, nfc_serial_registration).

all_consistent(warranty) :- consistent(s46, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, nfc_serial_registration)).
query(true_val(warranty, unk_warranty)).

% @attr user_review_forum_warranty
% @type categorical
% @canonical false
% @original_name user_review_forum (warranty)
% @values mixed=Mixed_warranty_experience unk_user_review_forum_warranty=Unknown
% @importance 0.65

0.45::acc(s47, user_review_forum_warranty).

0.20::true_val(user_review_forum_warranty, mixed); 0.80::true_val(user_review_forum_warranty, unk_user_review_forum_warranty).

measured(s47, user_review_forum_warranty, mixed).

all_consistent(user_review_forum_warranty) :- consistent(s47, user_review_forum_warranty).

evidence(all_consistent(user_review_forum_warranty)).
query(true_val(user_review_forum_warranty, mixed)).
query(true_val(user_review_forum_warranty, unk_user_review_forum_warranty)).

% @attr model_continuity_2023_2026
% @type categorical
% @canonical false
% @original_name 2023-2026 continuity
% @values same_shape_camber_minor_tweaks=Same_shape_camber_minor_setback_base_tweaks unk_model_continuity_2023_2026=Unknown
% @importance 0.9

0.82::acc(s33, model_continuity_2023_2026).

0.74::true_val(model_continuity_2023_2026, same_shape_camber_minor_tweaks); 0.26::true_val(model_continuity_2023_2026, unk_model_continuity_2023_2026).

measured(s33, model_continuity_2023_2026, same_shape_camber_minor_tweaks).

all_consistent(model_continuity_2023_2026) :- consistent(s33, model_continuity_2023_2026).

evidence(all_consistent(model_continuity_2023_2026)).
query(true_val(model_continuity_2023_2026, same_shape_camber_minor_tweaks)).
query(true_val(model_continuity_2023_2026, unk_model_continuity_2023_2026)).

% @attr setback_improvement_2024_2026
% @type categorical
% @canonical false
% @original_name 2024-2026 setback improvement
% @values better_setback_narrower_stance=Better_setback_narrower_stance_more_versatile unk_setback_improvement_2024_2026=Unknown
% @importance 0.9

0.82::acc(s33, setback_improvement_2024_2026).

0.74::true_val(setback_improvement_2024_2026, better_setback_narrower_stance); 0.26::true_val(setback_improvement_2024_2026, unk_setback_improvement_2024_2026).

measured(s33, setback_improvement_2024_2026, better_setback_narrower_stance).

all_consistent(setback_improvement_2024_2026) :- consistent(s33, setback_improvement_2024_2026).

evidence(all_consistent(setback_improvement_2024_2026)).
query(true_val(setback_improvement_2024_2026, better_setback_narrower_stance)).
query(true_val(setback_improvement_2024_2026, unk_setback_improvement_2024_2026)).

% @attr notable_changes_2027
% @type categorical
% @canonical false
% @original_name 2027 notable changes
% @values base_carbon_flex_size_changes=Megadrive_XT_base_Fairmat_4x20mm_flex_7_fewer_sizes unk_notable_changes_2027=Unknown
% @importance 1.0

0.85::acc(s1, notable_changes_2027).

0.71::true_val(notable_changes_2027, base_carbon_flex_size_changes); 0.29::true_val(notable_changes_2027, unk_notable_changes_2027).

measured(s1, notable_changes_2027, base_carbon_flex_size_changes).

all_consistent(notable_changes_2027) :- consistent(s1, notable_changes_2027).

evidence(all_consistent(notable_changes_2027)).
query(true_val(notable_changes_2027, base_carbon_flex_size_changes)).
query(true_val(notable_changes_2027, unk_notable_changes_2027)).