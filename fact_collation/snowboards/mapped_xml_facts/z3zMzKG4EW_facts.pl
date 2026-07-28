0.20::indep(s_merchant).
0.15::indep(s23).
0.12::indep(s24).
0.15::indep(s25).
0.25::indep(s27).
0.20::indep(s28).
0.55::indep(s22).
0.35::indep(s26).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values bataleon=Bataleon unk_brand=Unknown
% @importance 1.0

0.90::acc(s1, brand).
0.95::acc(s2, brand).

0.97::true_val(brand, bataleon); 0.03::true_val(brand, unk_brand).

measured(s1, brand, bataleon).
measured(s2, brand, bataleon).

all_consistent(brand) :-
    consistent(s2, brand),
    consistent(s1, brand).

evidence(all_consistent(brand)).
query(true_val(brand, bataleon)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values chaser=Chaser unk_model_name=Unknown
% @importance 1.0

0.90::acc(s1, model_name).
0.95::acc(s2, model_name).

0.97::true_val(model_name, chaser); 0.03::true_val(model_name, unk_model_name).

measured(s1, model_name, chaser).
measured(s2, model_name, chaser).

all_consistent(model_name) :-
    consistent(s2, model_name),
    consistent(s1, model_name).

evidence(all_consistent(model_name)).
query(true_val(model_name, chaser)).
query(true_val(model_name, unk_model_name)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values season_2025_26=2025/2026 unk_model_year=Unknown
% @importance 1.0

0.95::acc(s2, model_year).

0.93::true_val(model_year, season_2025_26); 0.07::true_val(model_year, unk_model_year).

measured(s2, model_year, season_2025_26).

all_consistent(model_year) :-
    consistent(s2, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, season_2025_26)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values mens_snowboard=Mens_Snowboard unk_model_series=Unknown
% @importance 1.0

0.95::acc(s2, model_series).

0.93::true_val(model_series, mens_snowboard); 0.07::true_val(model_series, unk_model_series).

measured(s2, model_series, mens_snowboard).

all_consistent(model_series) :-
    consistent(s2, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, mens_snowboard)).
query(true_val(model_series, unk_model_series)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.90::acc(s1, product_type).
0.95::acc(s2, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s2, product_type),
    consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 1.0

0.95::acc(s2, gender).

0.93::true_val(gender, mens); 0.07::true_val(gender, unk_gender).

measured(s2, gender, mens).

all_consistent(gender) :-
    consistent(s2, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values bataleon_lps_nidecker=Bataleon_Low_Pressure_Studio_Nidecker_Group unk_manufacturer=Unknown
% @importance 0.43

0.88::acc(s3, manufacturer).
0.78::acc(s4, manufacturer).

0.95::true_val(manufacturer, bataleon_lps_nidecker); 0.05::true_val(manufacturer, unk_manufacturer).

measured(s3, manufacturer, bataleon_lps_nidecker).
measured(s4, manufacturer, bataleon_lps_nidecker).

all_consistent(manufacturer) :-
    consistent(s3, manufacturer),
    consistent(s4, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, bataleon_lps_nidecker)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr brand_founded
% @type categorical
% @canonical false
% @original_name Brand founded
% @values y2000=2000 y2001=2001
% @importance 0.33

0.82::acc(s5, brand_founded).
0.60::acc(s6, brand_founded).

0.65::true_val(brand_founded, y2000); 0.35::true_val(brand_founded, y2001).

measured(s5, brand_founded, y2000).
measured(s6, brand_founded, y2001).

all_consistent(brand_founded) :-
    consistent(s5, brand_founded),
    consistent(s6, brand_founded).

evidence(all_consistent(brand_founded)).
query(true_val(brand_founded, y2000)).
query(true_val(brand_founded, y2001)).

% @attr brand_origin_country
% @type categorical
% @canonical false
% @original_name Brand origin country
% @values netherlands_amsterdam=Netherlands_Amsterdam unk_brand_origin_country=Unknown
% @importance 0.33

0.82::acc(s7, brand_origin_country).
0.65::acc(s8, brand_origin_country).

0.95::true_val(brand_origin_country, netherlands_amsterdam); 0.05::true_val(brand_origin_country, unk_brand_origin_country).

measured(s7, brand_origin_country, netherlands_amsterdam).
measured(s8, brand_origin_country, netherlands_amsterdam).

all_consistent(brand_origin_country) :-
    consistent(s7, brand_origin_country),
    consistent(s8, brand_origin_country).

evidence(all_consistent(brand_origin_country)).
query(true_val(brand_origin_country, netherlands_amsterdam)).
query(true_val(brand_origin_country, unk_brand_origin_country)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values nidecker_group=Nidecker_Group_acquired_LPS_2018 unk_parent_company=Unknown
% @importance 0.45

0.72::acc(s4, parent_company).

0.68::true_val(parent_company, nidecker_group); 0.32::true_val(parent_company, unk_parent_company).

measured(s4, parent_company, nidecker_group).

all_consistent(parent_company) :-
    consistent(s4, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, nidecker_group)).
query(true_val(parent_company, unk_parent_company)).

% @attr nidecker_group_description
% @type categorical
% @canonical false
% @original_name Nidecker Group description
% @values swiss_second_biggest=Swiss_family_owned_second_biggest_snowboard_company unk_nidecker_group_description=Unknown
% @importance 0.45

0.70::acc(s4, nidecker_group_description).

0.68::true_val(nidecker_group_description, swiss_second_biggest); 0.32::true_val(nidecker_group_description, unk_nidecker_group_description).

measured(s4, nidecker_group_description, swiss_second_biggest).

all_consistent(nidecker_group_description) :-
    consistent(s4, nidecker_group_description).

evidence(all_consistent(nidecker_group_description)).
query(true_val(nidecker_group_description, swiss_second_biggest)).
query(true_val(nidecker_group_description, unk_nidecker_group_description)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values austria_capita_mothership=Austria_CAPiTA_Mothership unk_manufacturing_location_current=Unknown
% @importance 0.58

0.85::acc(s9, manufacturing_location_current).
0.70::acc(s10, manufacturing_location_current).

0.95::true_val(manufacturing_location_current, austria_capita_mothership); 0.05::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s9, manufacturing_location_current, austria_capita_mothership).
measured(s10, manufacturing_location_current, austria_capita_mothership).

all_consistent(manufacturing_location_current) :-
    consistent(s9, manufacturing_location_current),
    consistent(s10, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, austria_capita_mothership)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr manufacturing_location_prior
% @type categorical
% @canonical true
% @original_name manufacturing_location_prior
% @values elan_then_asia=Elan_Austria_then_Asia unk_manufacturing_location_prior=Unknown
% @importance 0.43

0.78::acc(s5, manufacturing_location_prior).
0.65::acc(s12, manufacturing_location_prior).

0.90::true_val(manufacturing_location_prior, elan_then_asia); 0.10::true_val(manufacturing_location_prior, unk_manufacturing_location_prior).

measured(s5, manufacturing_location_prior, elan_then_asia).
measured(s12, manufacturing_location_prior, elan_then_asia).

all_consistent(manufacturing_location_prior) :-
    consistent(s5, manufacturing_location_prior),
    consistent(s12, manufacturing_location_prior).

evidence(all_consistent(manufacturing_location_prior)).
query(true_val(manufacturing_location_prior, elan_then_asia)).
query(true_val(manufacturing_location_prior, unk_manufacturing_location_prior)).

% @attr brand_motto
% @type categorical
% @canonical false
% @original_name Brand motto
% @values smile_its_snowboarding=Smile_its_Snowboarding unk_brand_motto=Unknown
% @importance 0.15

0.82::acc(s13, brand_motto).

0.76::true_val(brand_motto, smile_its_snowboarding); 0.24::true_val(brand_motto, unk_brand_motto).

measured(s13, brand_motto, smile_its_snowboarding).

all_consistent(brand_motto) :-
    consistent(s13, brand_motto).

evidence(all_consistent(brand_motto)).
query(true_val(brand_motto, smile_its_snowboarding)).
query(true_val(brand_motto, unk_brand_motto)).

% @attr brand_usp
% @type categorical
% @canonical false
% @original_name Brand USP
% @values triple_base_tech_3bt=Triple_Base_Technology_3BT unk_brand_usp=Unknown
% @importance 0.7

0.85::acc(s14, brand_usp).

0.81::true_val(brand_usp, triple_base_tech_3bt); 0.19::true_val(brand_usp, unk_brand_usp).

measured(s14, brand_usp, triple_base_tech_3bt).

all_consistent(brand_usp) :-
    consistent(s14, brand_usp).

evidence(all_consistent(brand_usp)).
query(true_val(brand_usp, triple_base_tech_3bt)).
query(true_val(brand_usp, unk_brand_usp)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values circa_2019=circa_2019_reviewed_2021_forum_2018 unk_model_first_available_year=Unknown
% @importance 0.4

0.65::acc(s15, model_first_available_year).
0.50::acc(s16, model_first_available_year).

0.85::true_val(model_first_available_year, circa_2019); 0.15::true_val(model_first_available_year, unk_model_first_available_year).

measured(s15, model_first_available_year, circa_2019).
measured(s16, model_first_available_year, circa_2019).

all_consistent(model_first_available_year) :-
    consistent(s15, model_first_available_year),
    consistent(s16, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, circa_2019)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values entry_level_am_since_2019=Entry_level_all_mountain_since_2019 unk_predecessor_model_name=Unknown
% @importance 0.4

0.50::acc(s16, predecessor_model_name).

0.28::true_val(predecessor_model_name, entry_level_am_since_2019); 0.72::true_val(predecessor_model_name, unk_predecessor_model_name).

measured(s16, predecessor_model_name, entry_level_am_since_2019).

all_consistent(predecessor_model_name) :-
    consistent(s16, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, entry_level_am_since_2019)).
query(true_val(predecessor_model_name, unk_predecessor_model_name)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values new_progressing_riders=New_and_progressing_riders_forgiving_confidence_building unk_skill_level_recommendation=Unknown
% @importance 0.73

0.88::acc(s17, skill_level_recommendation).
0.80::acc(s20, skill_level_recommendation).
0.78::acc(s22, skill_level_recommendation).

0.95::true_val(skill_level_recommendation, new_progressing_riders); 0.05::true_val(skill_level_recommendation, unk_skill_level_recommendation).

measured(s17, skill_level_recommendation, new_progressing_riders).
measured(s20, skill_level_recommendation, new_progressing_riders).
measured(s22, skill_level_recommendation, new_progressing_riders).

all_consistent(skill_level_recommendation) :-
    consistent(s17, skill_level_recommendation),
    consistent(s20, skill_level_recommendation),
    (indep(s22), consistent(s22, skill_level_recommendation) ; \+indep(s22)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, new_progressing_riders)).
query(true_val(skill_level_recommendation, unk_skill_level_recommendation)).

% @attr board_bindings_package_available
% @type categorical
% @canonical false
% @original_name Available as board-bindings package
% @values yes_select_retailers=Available_as_set_at_select_retailers unk_board_bindings_package_available=Unknown
% @importance 1.0

0.93::acc(s2, board_bindings_package_available).

0.93::true_val(board_bindings_package_available, yes_select_retailers); 0.07::true_val(board_bindings_package_available, unk_board_bindings_package_available).

measured(s2, board_bindings_package_available, yes_select_retailers).

all_consistent(board_bindings_package_available) :-
    consistent(s2, board_bindings_package_available).

evidence(all_consistent(board_bindings_package_available)).
query(true_val(board_bindings_package_available, yes_select_retailers)).
query(true_val(board_bindings_package_available, unk_board_bindings_package_available)).

% @attr price_usd_msrp_rrp
% @type numeric
% @canonical false
% @original_name price_usd_msrp (RRP)
% @unit USD
% @values v459_95=459.95 unk_price_usd_msrp_rrp=Unknown
% @importance 0.95

0.95::acc(s2, price_usd_msrp_rrp).

0.93::true_val(price_usd_msrp_rrp, v459_95); 0.07::true_val(price_usd_msrp_rrp, unk_price_usd_msrp_rrp).

measured(s2, price_usd_msrp_rrp, v459_95).

all_consistent(price_usd_msrp_rrp) :-
    consistent(s2, price_usd_msrp_rrp).

evidence(all_consistent(price_usd_msrp_rrp)).
query(true_val(price_usd_msrp_rrp, v459_95)).
query(true_val(price_usd_msrp_rrp, unk_price_usd_msrp_rrp)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp (sale)
% @unit USD
% @values v321_95=321.95 unk_price_usd_msrp=Unknown
% @importance 0.95

0.95::acc(s2, price_usd_msrp).

0.93::true_val(price_usd_msrp, v321_95); 0.07::true_val(price_usd_msrp, unk_price_usd_msrp).

measured(s2, price_usd_msrp, v321_95).

all_consistent(price_usd_msrp) :-
    consistent(s2, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v321_95)).
query(true_val(price_usd_msrp, unk_price_usd_msrp)).

% @attr price_usd_evo
% @type numeric
% @canonical false
% @original_name price_usd_evo
% @unit USD
% @values v459_95=459.95 unk_price_usd_evo=Unknown
% @importance 0.9

0.82::acc(s1, price_usd_evo).

0.74::true_val(price_usd_evo, v459_95); 0.26::true_val(price_usd_evo, unk_price_usd_evo).

measured(s1, price_usd_evo, v459_95).

all_consistent(price_usd_evo) :-
    consistent(s1, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v459_95)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_aud_merchant_rrp
% @type numeric
% @canonical false
% @original_name price_aud_merchant (RRP)
% @unit AUD
% @values v769_99=769.99 unk_price_aud_merchant_rrp=Unknown
% @importance 0.85

0.95::acc(s_merchant, price_aud_merchant_rrp).

0.95::true_val(price_aud_merchant_rrp, v769_99); 0.05::true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp).

measured(s_merchant, price_aud_merchant_rrp, v769_99).

all_consistent(price_aud_merchant_rrp) :-
    consistent(s_merchant, price_aud_merchant_rrp).

evidence(all_consistent(price_aud_merchant_rrp)).
query(true_val(price_aud_merchant_rrp, v769_99)).
query(true_val(price_aud_merchant_rrp, unk_price_aud_merchant_rrp)).

% @attr price_aud_merchant
% @type numeric
% @canonical true
% @original_name price_aud_merchant (sale)
% @unit AUD
% @values v615_99=615.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.95::acc(s_merchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v615_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_merchant, price_aud_merchant, v615_99).

all_consistent(price_aud_merchant) :-
    consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v615_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr value_positioning
% @type categorical
% @canonical false
% @original_name Value positioning
% @values most_affordable_dt=Most_affordable_directional_twin unk_value_positioning=Unknown
% @importance 0.75

0.80::acc(s20, value_positioning).

0.68::true_val(value_positioning, most_affordable_dt); 0.32::true_val(value_positioning, unk_value_positioning).

measured(s20, value_positioning, most_affordable_dt).

all_consistent(value_positioning) :-
    consistent(s20, value_positioning).

evidence(all_consistent(value_positioning)).
query(true_val(value_positioning, most_affordable_dt)).
query(true_val(value_positioning, unk_value_positioning)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status (Bataleon.com)
% @values in_stock_low=In_stock_low_stock_2_left_sale_321_95 unk_availability_status=Unknown
% @importance 0.95

0.95::acc(s2, availability_status).

0.93::true_val(availability_status, in_stock_low); 0.07::true_val(availability_status, unk_availability_status).

measured(s2, availability_status, in_stock_low).

all_consistent(availability_status) :-
    consistent(s2, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock_low)).
query(true_val(availability_status, unk_availability_status)).

% @attr availability_status_evo
% @type categorical
% @canonical false
% @original_name availability_status (evo.com)
% @values available_459_95=Available_459_95_free_shipping_1yr_return unk_availability_status_evo=Unknown
% @importance 0.9

0.82::acc(s1, availability_status_evo).

0.74::true_val(availability_status_evo, available_459_95); 0.26::true_val(availability_status_evo, unk_availability_status_evo).

measured(s1, availability_status_evo, available_459_95).

all_consistent(availability_status_evo) :-
    consistent(s1, availability_status_evo).

evidence(all_consistent(availability_status_evo)).
query(true_val(availability_status_evo, available_459_95)).
query(true_val(availability_status_evo, unk_availability_status_evo)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status (Melbourne Snowboard)
% @values available_au_only=Available_ships_within_Australia unk_availability_status_melbourne=Unknown
% @importance 0.73

0.90::acc(s_merchant, availability_status_melbourne).
0.70::acc(s21, availability_status_melbourne).

0.95::true_val(availability_status_melbourne, available_au_only); 0.05::true_val(availability_status_melbourne, unk_availability_status_melbourne).

measured(s_merchant, availability_status_melbourne, available_au_only).
measured(s21, availability_status_melbourne, available_au_only).

all_consistent(availability_status_melbourne) :-
    consistent(s_merchant, availability_status_melbourne),
    consistent(s21, availability_status_melbourne).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available_au_only)).
query(true_val(availability_status_melbourne, unk_availability_status_melbourne)).

% @attr availability_status_absolute_snow
% @type categorical
% @canonical false
% @original_name availability_status (Absolute-Snow)
% @values available=Available unk_availability_status_absolute_snow=Unknown
% @importance 0.75

0.78::acc(s22, availability_status_absolute_snow).

0.68::true_val(availability_status_absolute_snow, available); 0.32::true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow).

measured(s22, availability_status_absolute_snow, available).

all_consistent(availability_status_absolute_snow) :-
    consistent(s22, availability_status_absolute_snow).

evidence(all_consistent(availability_status_absolute_snow)).
query(true_val(availability_status_absolute_snow, available)).
query(true_val(availability_status_absolute_snow, unk_availability_status_absolute_snow)).

% @attr availability_status_sports_ltd
% @type categorical
% @canonical false
% @original_name availability_status (Sports Ltd)
% @values available=Available unk_availability_status_sports_ltd=Unknown
% @importance 0.7

0.60::acc(s23, availability_status_sports_ltd).

0.51::true_val(availability_status_sports_ltd, available); 0.49::true_val(availability_status_sports_ltd, unk_availability_status_sports_ltd).

measured(s23, availability_status_sports_ltd, available).

all_consistent(availability_status_sports_ltd) :-
    consistent(s23, availability_status_sports_ltd).

evidence(all_consistent(availability_status_sports_ltd)).
query(true_val(availability_status_sports_ltd, available)).
query(true_val(availability_status_sports_ltd, unk_availability_status_sports_ltd)).

% @attr availability_status_pelican
% @type categorical
% @canonical false
% @original_name availability_status (Pelican)
% @values available=Available unk_availability_status_pelican=Unknown
% @importance 0.5

0.55::acc(s24, availability_status_pelican).

0.47::true_val(availability_status_pelican, available); 0.53::true_val(availability_status_pelican, unk_availability_status_pelican).

measured(s24, availability_status_pelican, available).

all_consistent(availability_status_pelican) :-
    consistent(s24, availability_status_pelican).

evidence(all_consistent(availability_status_pelican)).
query(true_val(availability_status_pelican, available)).
query(true_val(availability_status_pelican, unk_availability_status_pelican)).

% @attr availability_status_tustablas
% @type categorical
% @canonical false
% @original_name availability_status (TusTablas)
% @values last_items=Listed_last_items_in_stock unk_availability_status_tustablas=Unknown
% @importance 0.5

0.55::acc(s25, availability_status_tustablas).

0.44::true_val(availability_status_tustablas, last_items); 0.56::true_val(availability_status_tustablas, unk_availability_status_tustablas).

measured(s25, availability_status_tustablas, last_items).

all_consistent(availability_status_tustablas) :-
    consistent(s25, availability_status_tustablas).

evidence(all_consistent(availability_status_tustablas)).
query(true_val(availability_status_tustablas, last_items)).
query(true_val(availability_status_tustablas, unk_availability_status_tustablas)).

% @attr availability_status_skatepro
% @type categorical
% @canonical false
% @original_name availability_status (SkatePro)
% @values available=Available unk_availability_status_skatepro=Unknown
% @importance 0.65

0.70::acc(s26, availability_status_skatepro).

0.63::true_val(availability_status_skatepro, available); 0.37::true_val(availability_status_skatepro, unk_availability_status_skatepro).

measured(s26, availability_status_skatepro, available).

all_consistent(availability_status_skatepro) :-
    consistent(s26, availability_status_skatepro).

evidence(all_consistent(availability_status_skatepro)).
query(true_val(availability_status_skatepro, available)).
query(true_val(availability_status_skatepro, unk_availability_status_skatepro)).

% @attr availability_status_surfdevils
% @type categorical
% @canonical false
% @original_name availability_status (Surfdevils)
% @values available_package=Available_as_package_with_Fly_HeelWrap unk_availability_status_surfdevils=Unknown
% @importance 0.65

0.60::acc(s27, availability_status_surfdevils).

0.51::true_val(availability_status_surfdevils, available_package); 0.49::true_val(availability_status_surfdevils, unk_availability_status_surfdevils).

measured(s27, availability_status_surfdevils, available_package).

all_consistent(availability_status_surfdevils) :-
    consistent(s27, availability_status_surfdevils).

evidence(all_consistent(availability_status_surfdevils)).
query(true_val(availability_status_surfdevils, available_package)).
query(true_val(availability_status_surfdevils, unk_availability_status_surfdevils)).

% @attr availability_status_snowbindx
% @type categorical
% @canonical false
% @original_name availability_status (Snowbindx)
% @values available=Available unk_availability_status_snowbindx=Unknown
% @importance 0.5

0.55::acc(s28, availability_status_snowbindx).

0.40::true_val(availability_status_snowbindx, available); 0.60::true_val(availability_status_snowbindx, unk_availability_status_snowbindx).

measured(s28, availability_status_snowbindx, available).

all_consistent(availability_status_snowbindx) :-
    consistent(s28, availability_status_snowbindx).

evidence(all_consistent(availability_status_snowbindx)).
query(true_val(availability_status_snowbindx, available)).
query(true_val(availability_status_snowbindx, unk_availability_status_snowbindx)).

% @attr availability_status_amazon
% @type categorical
% @canonical false
% @original_name availability_status (Amazon)
% @values unavailable_2026=Currently_unavailable_for_2026_model unk_availability_status_amazon=Unknown
% @importance 0.5

0.65::acc(s29, availability_status_amazon).

0.53::true_val(availability_status_amazon, unavailable_2026); 0.47::true_val(availability_status_amazon, unk_availability_status_amazon).

measured(s29, availability_status_amazon, unavailable_2026).

all_consistent(availability_status_amazon) :-
    consistent(s29, availability_status_amazon).

evidence(all_consistent(availability_status_amazon)).
query(true_val(availability_status_amazon, unavailable_2026)).
query(true_val(availability_status_amazon, unk_availability_status_amazon)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values two_plus_one_year=2_plus_1_year_warranty_via_registration unk_warranty=Unknown
% @importance 0.95

0.95::acc(s2, warranty).

0.93::true_val(warranty, two_plus_one_year); 0.07::true_val(warranty, unk_warranty).

measured(s2, warranty, two_plus_one_year).

all_consistent(warranty) :-
    consistent(s2, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, two_plus_one_year)).
query(true_val(warranty, unk_warranty)).

% @attr return_policy_terms
% @type categorical
% @canonical true
% @original_name return_policy_terms (Bataleon)
% @values d45_day=45_day_returns unk_return_policy_terms=Unknown
% @importance 0.95

0.95::acc(s2, return_policy_terms).

0.93::true_val(return_policy_terms, d45_day); 0.07::true_val(return_policy_terms, unk_return_policy_terms).

measured(s2, return_policy_terms, d45_day).

all_consistent(return_policy_terms) :-
    consistent(s2, return_policy_terms).

evidence(all_consistent(return_policy_terms)).
query(true_val(return_policy_terms, d45_day)).
query(true_val(return_policy_terms, unk_return_policy_terms)).

% @attr return_policy_terms_evo
% @type categorical
% @canonical false
% @original_name return_policy_terms (evo)
% @values one_year=Up_to_one_full_year unk_return_policy_terms_evo=Unknown
% @importance 0.9

0.82::acc(s1, return_policy_terms_evo).

0.74::true_val(return_policy_terms_evo, one_year); 0.26::true_val(return_policy_terms_evo, unk_return_policy_terms_evo).

measured(s1, return_policy_terms_evo, one_year).

all_consistent(return_policy_terms_evo) :-
    consistent(s1, return_policy_terms_evo).

evidence(all_consistent(return_policy_terms_evo)).
query(true_val(return_policy_terms_evo, one_year)).
query(true_val(return_policy_terms_evo, unk_return_policy_terms_evo)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain=All_Mountain unk_board_category=Unknown
% @importance 1.0

0.88::acc(s1, board_category).
0.95::acc(s2, board_category).

0.97::true_val(board_category, all_mountain); 0.03::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain).
measured(s2, board_category, all_mountain).

all_consistent(board_category) :-
    consistent(s2, board_category),
    consistent(s1, board_category).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain)).
query(true_val(board_category, unk_board_category)).

% @attr rider_level
% @type categorical
% @canonical true
% @original_name rider_level
% @values beginner_intermediate=Beginner_to_Intermediate unk_rider_level=Unknown
% @importance 0.8

0.78::acc(s22, rider_level).
0.85::acc(s1, rider_level).

0.95::true_val(rider_level, beginner_intermediate); 0.05::true_val(rider_level, unk_rider_level).

measured(s22, rider_level, beginner_intermediate).
measured(s1, rider_level, beginner_intermediate).

all_consistent(rider_level) :-
    consistent(s1, rider_level),
    (indep(s22), consistent(s22, rider_level) ; \+indep(s22)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, beginner_intermediate)).
query(true_val(rider_level, unk_rider_level)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mountain_groomed_park_powder=All_mountain_groomed_offpiste_park_powder unk_terrain_suitability=Unknown
% @importance 0.8

0.88::acc(s_merchant, terrain_suitability).
0.78::acc(s22, terrain_suitability).

0.95::true_val(terrain_suitability, all_mountain_groomed_park_powder); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_merchant, terrain_suitability, all_mountain_groomed_park_powder).
measured(s22, terrain_suitability, all_mountain_groomed_park_powder).

all_consistent(terrain_suitability) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability) ; \+indep(s_merchant)),
    (indep(s22), consistent(s22, terrain_suitability) ; \+indep(s22)).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mountain_groomed_park_powder)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values progression_tricks_carving_am=Progression_tricks_carving_all_mountain unk_riding_style=Unknown
% @importance 0.85

0.88::acc(s_merchant, riding_style).

0.95::true_val(riding_style, progression_tricks_carving_am); 0.05::true_val(riding_style, unk_riding_style).

measured(s_merchant, riding_style, progression_tricks_carving_am).

all_consistent(riding_style) :-
    (indep(s_merchant), consistent(s_merchant, riding_style) ; \+indep(s_merchant)).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, progression_tricks_carving_am)).
query(true_val(riding_style, unk_riding_style)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values directional_twin=Directional_Twin unk_shape=Unknown
% @importance 0.68

0.88::acc(s_merchant, shape).
0.65::acc(s28, shape).

0.95::true_val(shape, directional_twin); 0.05::true_val(shape, unk_shape).

measured(s_merchant, shape, directional_twin).
measured(s28, shape, directional_twin).

all_consistent(shape) :-
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)),
    (indep(s28), consistent(s28, shape) ; \+indep(s28)).

evidence(all_consistent(shape)).
query(true_val(shape, directional_twin)).
query(true_val(shape, unk_shape)).

% @attr shape_description
% @type categorical
% @canonical false
% @original_name Shape description
% @values twin_versatility_directional_stability=Twin_versatility_with_directional_stability unk_shape_description=Unknown
% @importance 0.68

0.85::acc(s_merchant, shape_description).
0.60::acc(s28, shape_description).

0.93::true_val(shape_description, twin_versatility_directional_stability); 0.07::true_val(shape_description, unk_shape_description).

measured(s_merchant, shape_description, twin_versatility_directional_stability).
measured(s28, shape_description, twin_versatility_directional_stability).

all_consistent(shape_description) :-
    (indep(s_merchant), consistent(s_merchant, shape_description) ; \+indep(s_merchant)),
    (indep(s28), consistent(s28, shape_description) ; \+indep(s28)).

evidence(all_consistent(shape_description)).
query(true_val(shape_description, twin_versatility_directional_stability)).
query(true_val(shape_description, unk_shape_description)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values medium_camber_3bt=Medium_Camber_with_3BT_Medium_Nose_Tail_Uplift unk_camber_type=Unknown
% @importance 0.68

0.85::acc(s_merchant, camber_type).
0.60::acc(s28, camber_type).

0.93::true_val(camber_type, medium_camber_3bt); 0.07::true_val(camber_type, unk_camber_type).

measured(s_merchant, camber_type, medium_camber_3bt).
measured(s28, camber_type, medium_camber_3bt).

all_consistent(camber_type) :-
    (indep(s_merchant), consistent(s_merchant, camber_type) ; \+indep(s_merchant)),
    (indep(s28), consistent(s28, camber_type) ; \+indep(s28)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, medium_camber_3bt)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values medium_camber=Medium_Camber low_camber=Low_Camber positive_camber_3bt=Positive_camber_with_3BT
% @importance 0.9

0.75::acc(s1, camber_description).
0.85::acc(s_merchant, camber_description).
0.60::acc(s28, camber_description).
0.93::acc(s2, camber_description).

0.45::true_val(camber_description, medium_camber); 0.25::true_val(camber_description, low_camber); 0.30::true_val(camber_description, positive_camber_3bt).

measured(s1, camber_description, low_camber).
measured(s_merchant, camber_description, medium_camber).
measured(s28, camber_description, medium_camber).
measured(s2, camber_description, positive_camber_3bt).

all_consistent(camber_description) :-
    consistent(s1, camber_description),
    consistent(s2, camber_description),
    (indep(s_merchant), consistent(s_merchant, camber_description) ; \+indep(s_merchant)),
    (indep(s28), consistent(s28, camber_description) ; \+indep(s28)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, medium_camber)).
query(true_val(camber_description, low_camber)).
query(true_val(camber_description, positive_camber_3bt)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values d3d_base_shaping_reduced_edge_catch=3D_base_shaping_reduces_edge_catch_maintains_ollie_carving unk_edge_technology=Unknown
% @importance 0.95

0.93::acc(s2, edge_technology).

0.93::true_val(edge_technology, d3d_base_shaping_reduced_edge_catch); 0.07::true_val(edge_technology, unk_edge_technology).

measured(s2, edge_technology, d3d_base_shaping_reduced_edge_catch).

all_consistent(edge_technology) :-
    consistent(s2, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, d3d_base_shaping_reduced_edge_catch)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr nose_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Nose sidebase uplift
% @values medium=Medium unk_nose_sidebase_uplift=Unknown
% @importance 0.75

0.85::acc(s_merchant, nose_sidebase_uplift).
0.65::acc(s25, nose_sidebase_uplift).

0.93::true_val(nose_sidebase_uplift, medium); 0.07::true_val(nose_sidebase_uplift, unk_nose_sidebase_uplift).

measured(s_merchant, nose_sidebase_uplift, medium).
measured(s25, nose_sidebase_uplift, medium).

all_consistent(nose_sidebase_uplift) :-
    (indep(s_merchant), consistent(s_merchant, nose_sidebase_uplift) ; \+indep(s_merchant)),
    (indep(s25), consistent(s25, nose_sidebase_uplift) ; \+indep(s25)).

evidence(all_consistent(nose_sidebase_uplift)).
query(true_val(nose_sidebase_uplift, medium)).
query(true_val(nose_sidebase_uplift, unk_nose_sidebase_uplift)).

% @attr tail_sidebase_uplift
% @type categorical
% @canonical false
% @original_name Tail sidebase uplift
% @values medium=Medium unk_tail_sidebase_uplift=Unknown
% @importance 0.75

0.85::acc(s_merchant, tail_sidebase_uplift).
0.65::acc(s25, tail_sidebase_uplift).

0.93::true_val(tail_sidebase_uplift, medium); 0.07::true_val(tail_sidebase_uplift, unk_tail_sidebase_uplift).

measured(s_merchant, tail_sidebase_uplift, medium).
measured(s25, tail_sidebase_uplift, medium).

all_consistent(tail_sidebase_uplift) :-
    (indep(s_merchant), consistent(s_merchant, tail_sidebase_uplift) ; \+indep(s_merchant)),
    (indep(s25), consistent(s25, tail_sidebase_uplift) ; \+indep(s25)).

evidence(all_consistent(tail_sidebase_uplift)).
query(true_val(tail_sidebase_uplift, medium)).
query(true_val(tail_sidebase_uplift, unk_tail_sidebase_uplift)).

% @attr sidekick_tips
% @type categorical
% @canonical false
% @original_name SideKick tips
% @values enhanced_3bt_uplift=Enhanced_3BT_sidebase_uplift_nose_tail unk_sidekick_tips=Unknown
% @importance 0.6

0.78::acc(s34, sidekick_tips).

0.68::true_val(sidekick_tips, enhanced_3bt_uplift); 0.32::true_val(sidekick_tips, unk_sidekick_tips).

measured(s34, sidekick_tips, enhanced_3bt_uplift).

all_consistent(sidekick_tips) :-
    consistent(s34, sidekick_tips).

evidence(all_consistent(sidekick_tips)).
query(true_val(sidekick_tips, enhanced_3bt_uplift)).
query(true_val(sidekick_tips, unk_sidekick_tips)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v3=3.0 unk_flex_rating_10=Unknown
% @importance 0.85

0.90::acc(s_merchant, flex_rating_10).
0.95::acc(s2, flex_rating_10).
0.70::acc(s23, flex_rating_10).

0.97::true_val(flex_rating_10, v3); 0.03::true_val(flex_rating_10, unk_flex_rating_10).

measured(s_merchant, flex_rating_10, v3).
measured(s2, flex_rating_10, v3).
measured(s23, flex_rating_10, v3).

all_consistent(flex_rating_10) :-
    consistent(s2, flex_rating_10),
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    (indep(s23), consistent(s23, flex_rating_10) ; \+indep(s23)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v3)).
query(true_val(flex_rating_10, unk_flex_rating_10)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10_evo
% @values soft=Soft_evo_classification unk_flex_rating_10_evo=Unknown
% @importance 0.9

0.80::acc(s1, flex_rating_10_evo).

0.74::true_val(flex_rating_10_evo, soft); 0.26::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s1, flex_rating_10_evo, soft).

all_consistent(flex_rating_10_evo) :-
    consistent(s1, flex_rating_10_evo).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, soft)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical false
% @original_name flex_feel
% @values forgiving_easy_press_mellow=Forgiving_easy_to_press_mellow unk_flex_feel=Unknown
% @importance 1.0

0.93::acc(s2, flex_feel).

0.93::true_val(flex_feel, forgiving_easy_press_mellow); 0.07::true_val(flex_feel, unk_flex_feel).

measured(s2, flex_feel, forgiving_easy_press_mellow).

all_consistent(flex_feel) :-
    consistent(s2, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, forgiving_easy_press_mellow)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr flex_direction
% @type categorical
% @canonical false
% @original_name flex_direction
% @values assumed_symmetrical=Not_specified_assumed_symmetrical unk_flex_direction=Unknown
% @importance 0.5

0.45::acc(s_analyst, flex_direction).

0.40::true_val(flex_direction, assumed_symmetrical); 0.60::true_val(flex_direction, unk_flex_direction).

measured(s_analyst, flex_direction, assumed_symmetrical).

all_consistent(flex_direction) :-
    consistent(s_analyst, flex_direction).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, assumed_symmetrical)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values bi_ax=Bi_Axial_fiberglass_two_way_weave unk_laminate=Unknown
% @importance 0.88

0.90::acc(s_merchant, laminate).
0.95::acc(s2, laminate).
0.65::acc(s25, laminate).

0.97::true_val(laminate, bi_ax); 0.03::true_val(laminate, unk_laminate).

measured(s_merchant, laminate, bi_ax).
measured(s2, laminate, bi_ax).
measured(s25, laminate, bi_ax).

all_consistent(laminate) :-
    consistent(s2, laminate),
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)),
    (indep(s25), consistent(s25, laminate) ; \+indep(s25)).

evidence(all_consistent(laminate)).
query(true_val(laminate, bi_ax)).
query(true_val(laminate, unk_laminate)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values full_poplar_core=Core_Core_full_poplar_wood unk_core_material=Unknown
% @importance 0.93

0.90::acc(s_merchant, core_material).
0.95::acc(s2, core_material).

0.97::true_val(core_material, full_poplar_core); 0.03::true_val(core_material, unk_core_material).

measured(s_merchant, core_material, full_poplar_core).
measured(s2, core_material, full_poplar_core).

all_consistent(core_material) :-
    consistent(s2, core_material),
    (indep(s_merchant), consistent(s_merchant, core_material) ; \+indep(s_merchant)).

evidence(all_consistent(core_material)).
query(true_val(core_material, full_poplar_core)).
query(true_val(core_material, unk_core_material)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values beech_stringers_tip_to_tail=Two_hardwood_beech_stringers_tip_to_tail unk_construction_material_innovation=Unknown
% @importance 0.9

0.93::acc(s2, construction_material_innovation).
0.82::acc(s1, construction_material_innovation).

0.95::true_val(construction_material_innovation, beech_stringers_tip_to_tail); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s2, construction_material_innovation, beech_stringers_tip_to_tail).
measured(s1, construction_material_innovation, beech_stringers_tip_to_tail).

all_consistent(construction_material_innovation) :-
    consistent(s2, construction_material_innovation),
    consistent(s1, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, beech_stringers_tip_to_tail)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr core_construction_purpose
% @type categorical
% @canonical false
% @original_name Core construction purpose
% @values strengthen_reinforce_pop=Strengthens_backbone_reinforces_inserts_increases_pop unk_core_construction_purpose=Unknown
% @importance 0.85

0.93::acc(s2, core_construction_purpose).
0.65::acc(s25, core_construction_purpose).

0.95::true_val(core_construction_purpose, strengthen_reinforce_pop); 0.05::true_val(core_construction_purpose, unk_core_construction_purpose).

measured(s2, core_construction_purpose, strengthen_reinforce_pop).
measured(s25, core_construction_purpose, strengthen_reinforce_pop).

all_consistent(core_construction_purpose) :-
    consistent(s2, core_construction_purpose),
    (indep(s25), consistent(s25, core_construction_purpose) ; \+indep(s25)).

evidence(all_consistent(core_construction_purpose)).
query(true_val(core_construction_purpose, strengthen_reinforce_pop)).
query(true_val(core_construction_purpose, unk_core_construction_purpose)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values flex_walls_urethane=FlexWalls_urethane_poured unk_sidewall_material=Unknown
% @importance 0.93

0.90::acc(s_merchant, sidewall_material).
0.95::acc(s2, sidewall_material).

0.97::true_val(sidewall_material, flex_walls_urethane); 0.03::true_val(sidewall_material, unk_sidewall_material).

measured(s_merchant, sidewall_material, flex_walls_urethane).
measured(s2, sidewall_material, flex_walls_urethane).

all_consistent(sidewall_material) :-
    consistent(s2, sidewall_material),
    (indep(s_merchant), consistent(s_merchant, sidewall_material) ; \+indep(s_merchant)).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, flex_walls_urethane)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr sidewall_technology
% @type categorical
% @canonical false
% @original_name Sidewall technology
% @values shock_absorption_reduced_chatter=Exceptional_shock_absorption_reduced_chatter_vibration unk_sidewall_technology=Unknown
% @importance 1.0

0.93::acc(s2, sidewall_technology).

0.93::true_val(sidewall_technology, shock_absorption_reduced_chatter); 0.07::true_val(sidewall_technology, unk_sidewall_technology).

measured(s2, sidewall_technology, shock_absorption_reduced_chatter).

all_consistent(sidewall_technology) :-
    consistent(s2, sidewall_technology).

evidence(all_consistent(sidewall_technology)).
query(true_val(sidewall_technology, shock_absorption_reduced_chatter)).
query(true_val(sidewall_technology, unk_sidewall_technology)).

% @attr sidewall_bonding
% @type categorical
% @canonical false
% @original_name Sidewall bonding
% @values urethane_bonds_better=Urethane_bonds_better_than_ABS_more_durable_damp unk_sidewall_bonding=Unknown
% @importance 0.55

0.60::acc(s28, sidewall_bonding).

0.50::true_val(sidewall_bonding, urethane_bonds_better); 0.50::true_val(sidewall_bonding, unk_sidewall_bonding).

measured(s28, sidewall_bonding, urethane_bonds_better).

all_consistent(sidewall_bonding) :-
    (indep(s28), consistent(s28, sidewall_bonding) ; \+indep(s28)).

evidence(all_consistent(sidewall_bonding)).
query(true_val(sidewall_bonding, urethane_bonds_better)).
query(true_val(sidewall_bonding, unk_sidewall_bonding)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values hyper_glide_s=Hyper_Glide_S unk_base_material=Unknown
% @importance 0.93

0.90::acc(s_merchant, base_material).
0.95::acc(s2, base_material).

0.97::true_val(base_material, hyper_glide_s); 0.03::true_val(base_material, unk_base_material).

measured(s_merchant, base_material, hyper_glide_s).
measured(s2, base_material, hyper_glide_s).

all_consistent(base_material) :-
    consistent(s2, base_material),
    (indep(s_merchant), consistent(s_merchant, base_material) ; \+indep(s_merchant)).

evidence(all_consistent(base_material)).
query(true_val(base_material, hyper_glide_s)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values sintered=Sintered extruded=Extruded sintruded=Sintruded
% @importance 0.74

0.95::acc(s40, base_type).
0.80::acc(s1, base_type).
0.82::acc(s_merchant, base_type).
0.55::acc(s23, base_type).
0.60::acc(s26, base_type).
0.70::acc(s20, base_type).
0.75::acc(s38, base_type).

0.50::true_val(base_type, sintered); 0.25::true_val(base_type, extruded); 0.25::true_val(base_type, sintruded).

measured(s40, base_type, sintered).
measured(s1, base_type, sintered).
measured(s_merchant, base_type, sintered).
measured(s23, base_type, extruded).
measured(s26, base_type, extruded).
measured(s20, base_type, extruded).
measured(s38, base_type, sintruded).

all_consistent(base_type) :-
    consistent(s40, base_type),
    consistent(s1, base_type),
    consistent(s20, base_type),
    consistent(s38, base_type),
    (indep(s_merchant), consistent(s_merchant, base_type) ; \+indep(s_merchant)),
    (indep(s23), consistent(s23, base_type) ; \+indep(s23)),
    (indep(s26), consistent(s26, base_type) ; \+indep(s26)).

evidence(all_consistent(base_type)).
query(true_val(base_type, sintered)).
query(true_val(base_type, extruded)).
query(true_val(base_type, sintruded)).

% @attr base_glide_performance
% @type categorical
% @canonical false
% @original_name base_glide_performance
% @values durable_fast=Durable_and_fast_faster_when_waxed unk_base_glide_performance=Unknown
% @importance 1.0

0.93::acc(s2, base_glide_performance).

0.93::true_val(base_glide_performance, durable_fast); 0.07::true_val(base_glide_performance, unk_base_glide_performance).

measured(s2, base_glide_performance, durable_fast).

all_consistent(base_glide_performance) :-
    consistent(s2, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, durable_fast)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr insert_count
% @type numeric
% @canonical false
% @original_name Insert count
% @values v20=20 unk_insert_count=Unknown
% @importance 0.85

0.93::acc(s2, insert_count).
0.65::acc(s25, insert_count).

0.95::true_val(insert_count, v20); 0.05::true_val(insert_count, unk_insert_count).

measured(s2, insert_count, v20).
measured(s25, insert_count, v20).

all_consistent(insert_count) :-
    consistent(s2, insert_count),
    (indep(s25), consistent(s25, insert_count) ; \+indep(s25)).

evidence(all_consistent(insert_count)).
query(true_val(insert_count, v20)).
query(true_val(insert_count, unk_insert_count)).

% @attr insert_material
% @type categorical
% @canonical false
% @original_name Insert material
% @values a_grade_german_stainless=A_grade_German_stainless_steel unk_insert_material=Unknown
% @importance 1.0

0.93::acc(s2, insert_material).

0.93::true_val(insert_material, a_grade_german_stainless); 0.07::true_val(insert_material, unk_insert_material).

measured(s2, insert_material, a_grade_german_stainless).

all_consistent(insert_material) :-
    consistent(s2, insert_material).

evidence(all_consistent(insert_material)).
query(true_val(insert_material, a_grade_german_stainless)).
query(true_val(insert_material, unk_insert_material)).

% @attr insert_durability
% @type categorical
% @canonical false
% @original_name Insert durability
% @values years_of_stance_switches=Can_withstand_years_of_binding_stance_switches unk_insert_durability=Unknown
% @importance 1.0

0.93::acc(s2, insert_durability).

0.93::true_val(insert_durability, years_of_stance_switches); 0.07::true_val(insert_durability, unk_insert_durability).

measured(s2, insert_durability, years_of_stance_switches).

all_consistent(insert_durability) :-
    consistent(s2, insert_durability).

evidence(all_consistent(insert_durability)).
query(true_val(insert_durability, years_of_stance_switches)).
query(true_val(insert_durability, unk_insert_durability)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_inserts unk_mounting_pattern=Unknown
% @importance 0.75

0.88::acc(s_merchant, mounting_pattern).
0.75::acc(s26, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_merchant, mounting_pattern, inserts_2x4).
measured(s26, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :-
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)),
    (indep(s26), consistent(s26, mounting_pattern) ; \+indep(s26)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr binding_compatibility
% @type categorical
% @canonical false
% @original_name binding_compatibility
% @values standard_2x4_wide_stance=Standard_2x4_wide_variety_stance_options unk_binding_compatibility=Unknown
% @importance 0.65

0.75::acc(s26, binding_compatibility).

0.63::true_val(binding_compatibility, standard_2x4_wide_stance); 0.37::true_val(binding_compatibility, unk_binding_compatibility).

measured(s26, binding_compatibility, standard_2x4_wide_stance).

all_consistent(binding_compatibility) :-
    (indep(s26), consistent(s26, binding_compatibility) ; \+indep(s26)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, standard_2x4_wide_stance)).
query(true_val(binding_compatibility, unk_binding_compatibility)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values s149_152_155_157_159_159w=149_152_155_157_159_159W unk_available_sizes=Unknown
% @importance 0.93

0.95::acc(s2, available_sizes).
0.88::acc(s_merchant, available_sizes).

0.97::true_val(available_sizes, s149_152_155_157_159_159w); 0.03::true_val(available_sizes, unk_available_sizes).

measured(s2, available_sizes, s149_152_155_157_159_159w).
measured(s_merchant, available_sizes, s149_152_155_157_159_159w).

all_consistent(available_sizes) :-
    consistent(s2, available_sizes),
    (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, s149_152_155_157_159_159w)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.85

0.88::acc(s_merchant, width_options).

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(s_merchant), consistent(s_merchant, width_options) ; \+indep(s_merchant)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr effective_edge_149
% @type numeric
% @canonical false
% @original_name Effective edge 149cm
% @unit cm
% @values v114_9=114.9 unk_effective_edge_149=Unknown
% @importance 1.0

0.95::acc(s2, effective_edge_149).

0.93::true_val(effective_edge_149, v114_9); 0.07::true_val(effective_edge_149, unk_effective_edge_149).

measured(s2, effective_edge_149, v114_9).

all_consistent(effective_edge_149) :- consistent(s2, effective_edge_149).

evidence(all_consistent(effective_edge_149)).
query(true_val(effective_edge_149, v114_9)).
query(true_val(effective_edge_149, unk_effective_edge_149)).

% @attr waist_width_149
% @type numeric
% @canonical false
% @original_name Waist width 149cm
% @unit cm
% @values v24_5=24.5 unk_waist_width_149=Unknown
% @importance 1.0

0.95::acc(s2, waist_width_149).

0.93::true_val(waist_width_149, v24_5); 0.07::true_val(waist_width_149, unk_waist_width_149).

measured(s2, waist_width_149, v24_5).

all_consistent(waist_width_149) :- consistent(s2, waist_width_149).

evidence(all_consistent(waist_width_149)).
query(true_val(waist_width_149, v24_5)).
query(true_val(waist_width_149, unk_waist_width_149)).

% @attr tip_tail_width_size_149
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (149cm)
% @unit cm
% @values v28_6=28.6/28.6 unk_tip_tail_width_size_149=Unknown
% @importance 1.0

0.95::acc(s2, tip_tail_width_size_149).

0.93::true_val(tip_tail_width_size_149, v28_6); 0.07::true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149).

measured(s2, tip_tail_width_size_149, v28_6).

all_consistent(tip_tail_width_size_149) :- consistent(s2, tip_tail_width_size_149).

evidence(all_consistent(tip_tail_width_size_149)).
query(true_val(tip_tail_width_size_149, v28_6)).
query(true_val(tip_tail_width_size_149, unk_tip_tail_width_size_149)).

% @attr sidecut_radius_size_149
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (149cm)
% @unit m
% @values v7_45=7.45 unk_sidecut_radius_size_149=Unknown
% @importance 1.0

0.95::acc(s2, sidecut_radius_size_149).

0.93::true_val(sidecut_radius_size_149, v7_45); 0.07::true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149).

measured(s2, sidecut_radius_size_149, v7_45).

all_consistent(sidecut_radius_size_149) :- consistent(s2, sidecut_radius_size_149).

evidence(all_consistent(sidecut_radius_size_149)).
query(true_val(sidecut_radius_size_149, v7_45)).
query(true_val(sidecut_radius_size_149, unk_sidecut_radius_size_149)).

% @attr stance_width_range_size_149
% @type categorical
% @canonical false
% @original_name stance_width_range_size (149cm)
% @unit cm
% @values r46_0_54_0=46.0-54.0 unk_stance_width_range_size_149=Unknown
% @importance 1.0

0.95::acc(s2, stance_width_range_size_149).

0.93::true_val(stance_width_range_size_149, r46_0_54_0); 0.07::true_val(stance_width_range_size_149, unk_stance_width_range_size_149).

measured(s2, stance_width_range_size_149, r46_0_54_0).

all_consistent(stance_width_range_size_149) :- consistent(s2, stance_width_range_size_149).

evidence(all_consistent(stance_width_range_size_149)).
query(true_val(stance_width_range_size_149, r46_0_54_0)).
query(true_val(stance_width_range_size_149, unk_stance_width_range_size_149)).

% @attr recommended_weight_range_size_149
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (149cm)
% @unit kg
% @values r54_74=54-74kg unk_recommended_weight_range_size_149=Unknown
% @importance 1.0

0.95::acc(s2, recommended_weight_range_size_149).

0.93::true_val(recommended_weight_range_size_149, r54_74); 0.07::true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149).

measured(s2, recommended_weight_range_size_149, r54_74).

all_consistent(recommended_weight_range_size_149) :- consistent(s2, recommended_weight_range_size_149).

evidence(all_consistent(recommended_weight_range_size_149)).
query(true_val(recommended_weight_range_size_149, r54_74)).
query(true_val(recommended_weight_range_size_149, unk_recommended_weight_range_size_149)).

% @attr boot_size_eu_149
% @type categorical
% @canonical false
% @original_name Boot size (EU) 149cm
% @values r36_41=36-41 unk_boot_size_eu_149=Unknown
% @importance 1.0

0.95::acc(s2, boot_size_eu_149).

0.93::true_val(boot_size_eu_149, r36_41); 0.07::true_val(boot_size_eu_149, unk_boot_size_eu_149).

measured(s2, boot_size_eu_149, r36_41).

all_consistent(boot_size_eu_149) :- consistent(s2, boot_size_eu_149).

evidence(all_consistent(boot_size_eu_149)).
query(true_val(boot_size_eu_149, r36_41)).
query(true_val(boot_size_eu_149, unk_boot_size_eu_149)).

% @attr effective_edge_152
% @type numeric
% @canonical false
% @original_name Effective edge 152cm
% @unit cm
% @values v116_3=116.3 unk_effective_edge_152=Unknown
% @importance 1.0

0.95::acc(s2, effective_edge_152).

0.93::true_val(effective_edge_152, v116_3); 0.07::true_val(effective_edge_152, unk_effective_edge_152).

measured(s2, effective_edge_152, v116_3).

all_consistent(effective_edge_152) :- consistent(s2, effective_edge_152).

evidence(all_consistent(effective_edge_152)).
query(true_val(effective_edge_152, v116_3)).
query(true_val(effective_edge_152, unk_effective_edge_152)).

% @attr waist_width_152
% @type numeric
% @canonical false
% @original_name Waist width 152cm
% @unit cm
% @values v24_8=24.8 unk_waist_width_152=Unknown
% @importance 1.0

0.95::acc(s2, waist_width_152).

0.93::true_val(waist_width_152, v24_8); 0.07::true_val(waist_width_152, unk_waist_width_152).

measured(s2, waist_width_152, v24_8).

all_consistent(waist_width_152) :- consistent(s2, waist_width_152).

evidence(all_consistent(waist_width_152)).
query(true_val(waist_width_152, v24_8)).
query(true_val(waist_width_152, unk_waist_width_152)).

% @attr tip_tail_width_size_152
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (152cm)
% @unit cm
% @values v28_9=28.9/28.9 unk_tip_tail_width_size_152=Unknown
% @importance 1.0

0.95::acc(s2, tip_tail_width_size_152).

0.93::true_val(tip_tail_width_size_152, v28_9); 0.07::true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152).

measured(s2, tip_tail_width_size_152, v28_9).

all_consistent(tip_tail_width_size_152) :- consistent(s2, tip_tail_width_size_152).

evidence(all_consistent(tip_tail_width_size_152)).
query(true_val(tip_tail_width_size_152, v28_9)).
query(true_val(tip_tail_width_size_152, unk_tip_tail_width_size_152)).

% @attr sidecut_radius_size_152
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (152cm)
% @unit m
% @values v7_6=7.6 unk_sidecut_radius_size_152=Unknown
% @importance 1.0

0.95::acc(s2, sidecut_radius_size_152).

0.93::true_val(sidecut_radius_size_152, v7_6); 0.07::true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152).

measured(s2, sidecut_radius_size_152, v7_6).

all_consistent(sidecut_radius_size_152) :- consistent(s2, sidecut_radius_size_152).

evidence(all_consistent(sidecut_radius_size_152)).
query(true_val(sidecut_radius_size_152, v7_6)).
query(true_val(sidecut_radius_size_152, unk_sidecut_radius_size_152)).

% @attr stance_width_range_size_152
% @type categorical
% @canonical false
% @original_name stance_width_range_size (152cm)
% @unit cm
% @values r47_5_55_5=47.5-55.5 unk_stance_width_range_size_152=Unknown
% @importance 1.0

0.95::acc(s2, stance_width_range_size_152).

0.93::true_val(stance_width_range_size_152, r47_5_55_5); 0.07::true_val(stance_width_range_size_152, unk_stance_width_range_size_152).

measured(s2, stance_width_range_size_152, r47_5_55_5).

all_consistent(stance_width_range_size_152) :- consistent(s2, stance_width_range_size_152).

evidence(all_consistent(stance_width_range_size_152)).
query(true_val(stance_width_range_size_152, r47_5_55_5)).
query(true_val(stance_width_range_size_152, unk_stance_width_range_size_152)).

% @attr recommended_weight_range_size_152
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (152cm)
% @unit kg
% @values r59_79=59-79kg unk_recommended_weight_range_size_152=Unknown
% @importance 1.0

0.95::acc(s2, recommended_weight_range_size_152).

0.93::true_val(recommended_weight_range_size_152, r59_79); 0.07::true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152).

measured(s2, recommended_weight_range_size_152, r59_79).

all_consistent(recommended_weight_range_size_152) :- consistent(s2, recommended_weight_range_size_152).

evidence(all_consistent(recommended_weight_range_size_152)).
query(true_val(recommended_weight_range_size_152, r59_79)).
query(true_val(recommended_weight_range_size_152, unk_recommended_weight_range_size_152)).

% @attr boot_size_eu_152
% @type categorical
% @canonical false
% @original_name Boot size (EU) 152cm
% @values r39_43=39-43 unk_boot_size_eu_152=Unknown
% @importance 1.0

0.95::acc(s2, boot_size_eu_152).

0.93::true_val(boot_size_eu_152, r39_43); 0.07::true_val(boot_size_eu_152, unk_boot_size_eu_152).

measured(s2, boot_size_eu_152, r39_43).

all_consistent(boot_size_eu_152) :- consistent(s2, boot_size_eu_152).

evidence(all_consistent(boot_size_eu_152)).
query(true_val(boot_size_eu_152, r39_43)).
query(true_val(boot_size_eu_152, unk_boot_size_eu_152)).

% @attr effective_edge_155
% @type numeric
% @canonical false
% @original_name Effective edge 155cm
% @unit cm
% @values v118_7=118.7 unk_effective_edge_155=Unknown
% @importance 1.0

0.95::acc(s2, effective_edge_155).

0.93::true_val(effective_edge_155, v118_7); 0.07::true_val(effective_edge_155, unk_effective_edge_155).

measured(s2, effective_edge_155, v118_7).

all_consistent(effective_edge_155) :- consistent(s2, effective_edge_155).

evidence(all_consistent(effective_edge_155)).
query(true_val(effective_edge_155, v118_7)).
query(true_val(effective_edge_155, unk_effective_edge_155)).

% @attr waist_width_155
% @type numeric
% @canonical false
% @original_name Waist width 155cm
% @unit cm
% @values v25_1=25.1 unk_waist_width_155=Unknown
% @importance 1.0

0.95::acc(s2, waist_width_155).

0.93::true_val(waist_width_155, v25_1); 0.07::true_val(waist_width_155, unk_waist_width_155).

measured(s2, waist_width_155, v25_1).

all_consistent(waist_width_155) :- consistent(s2, waist_width_155).

evidence(all_consistent(waist_width_155)).
query(true_val(waist_width_155, v25_1)).
query(true_val(waist_width_155, unk_waist_width_155)).

% @attr tip_tail_width_size
% @type categorical
% @canonical true
% @original_name tip_tail_width_size (155cm)
% @unit cm
% @values v29_3=29.3/29.3 unk_tip_tail_width_size=Unknown
% @importance 1.0

0.95::acc(s2, tip_tail_width_size).

0.93::true_val(tip_tail_width_size, v29_3); 0.07::true_val(tip_tail_width_size, unk_tip_tail_width_size).

measured(s2, tip_tail_width_size, v29_3).

all_consistent(tip_tail_width_size) :- consistent(s2, tip_tail_width_size).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v29_3)).
query(true_val(tip_tail_width_size, unk_tip_tail_width_size)).

% @attr sidecut_radius_size
% @type numeric
% @canonical true
% @original_name sidecut_radius_size (155cm)
% @unit m
% @values v7_75=7.75 unk_sidecut_radius_size=Unknown
% @importance 1.0

0.95::acc(s2, sidecut_radius_size).

0.93::true_val(sidecut_radius_size, v7_75); 0.07::true_val(sidecut_radius_size, unk_sidecut_radius_size).

measured(s2, sidecut_radius_size, v7_75).

all_consistent(sidecut_radius_size) :- consistent(s2, sidecut_radius_size).

evidence(all_consistent(sidecut_radius_size)).
query(true_val(sidecut_radius_size, v7_75)).
query(true_val(sidecut_radius_size, unk_sidecut_radius_size)).

% @attr stance_width_range_size
% @type categorical
% @canonical true
% @original_name stance_width_range_size (155cm)
% @unit cm
% @values r49_0_57_0=49.0-57.0 unk_stance_width_range_size=Unknown
% @importance 1.0

0.95::acc(s2, stance_width_range_size).

0.93::true_val(stance_width_range_size, r49_0_57_0); 0.07::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s2, stance_width_range_size, r49_0_57_0).

all_consistent(stance_width_range_size) :- consistent(s2, stance_width_range_size).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, r49_0_57_0)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size (155cm)
% @unit kg
% @values r65_85=65-85kg unk_recommended_weight_range_size=Unknown
% @importance 1.0

0.95::acc(s2, recommended_weight_range_size).

0.93::true_val(recommended_weight_range_size, r65_85); 0.07::true_val(recommended_weight_range_size, unk_recommended_weight_range_size).

measured(s2, recommended_weight_range_size, r65_85).

all_consistent(recommended_weight_range_size) :- consistent(s2, recommended_weight_range_size).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, r65_85)).
query(true_val(recommended_weight_range_size, unk_recommended_weight_range_size)).

% @attr effective_edge_157
% @type numeric
% @canonical false
% @original_name Effective edge 157cm
% @unit cm
% @values v120_3=120.3 unk_effective_edge_157=Unknown
% @importance 1.0

0.95::acc(s2, effective_edge_157).

0.93::true_val(effective_edge_157, v120_3); 0.07::true_val(effective_edge_157, unk_effective_edge_157).

measured(s2, effective_edge_157, v120_3).

all_consistent(effective_edge_157) :- consistent(s2, effective_edge_157).

evidence(all_consistent(effective_edge_157)).
query(true_val(effective_edge_157, v120_3)).
query(true_val(effective_edge_157, unk_effective_edge_157)).

% @attr waist_width_157
% @type numeric
% @canonical false
% @original_name Waist width 157cm
% @unit cm
% @values v25_3=25.3 unk_waist_width_157=Unknown
% @importance 1.0

0.95::acc(s2, waist_width_157).

0.93::true_val(waist_width_157, v25_3); 0.07::true_val(waist_width_157, unk_waist_width_157).

measured(s2, waist_width_157, v25_3).

all_consistent(waist_width_157) :- consistent(s2, waist_width_157).

evidence(all_consistent(waist_width_157)).
query(true_val(waist_width_157, v25_3)).
query(true_val(waist_width_157, unk_waist_width_157)).

% @attr tip_tail_width_size_157
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (157cm)
% @unit cm
% @values v29_5=29.5/29.5 unk_tip_tail_width_size_157=Unknown
% @importance 1.0

0.95::acc(s2, tip_tail_width_size_157).

0.93::true_val(tip_tail_width_size_157, v29_5); 0.07::true_val(tip_tail_width_size_157, unk_tip_tail_width_size_157).

measured(s2, tip_tail_width_size_157, v29_5).

all_consistent(tip_tail_width_size_157) :- consistent(s2, tip_tail_width_size_157).

evidence(all_consistent(tip_tail_width_size_157)).
query(true_val(tip_tail_width_size_157, v29_5)).
query(true_val(tip_tail_width_size_157, unk_tip_tail_width_size_157)).

% @attr sidecut_radius_size_157
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (157cm)
% @unit m
% @values v7_85=7.85 unk_sidecut_radius_size_157=Unknown
% @importance 1.0

0.95::acc(s2, sidecut_radius_size_157).

0.93::true_val(sidecut_radius_size_157, v7_85); 0.07::true_val(sidecut_radius_size_157, unk_sidecut_radius_size_157).

measured(s2, sidecut_radius_size_157, v7_85).

all_consistent(sidecut_radius_size_157) :- consistent(s2, sidecut_radius_size_157).

evidence(all_consistent(sidecut_radius_size_157)).
query(true_val(sidecut_radius_size_157, v7_85)).
query(true_val(sidecut_radius_size_157, unk_sidecut_radius_size_157)).

% @attr stance_width_range_size_157
% @type categorical
% @canonical false
% @original_name stance_width_range_size (157cm)
% @unit cm
% @values r51_0_59_0=51.0-59.0 unk_stance_width_range_size_157=Unknown
% @importance 1.0

0.95::acc(s2, stance_width_range_size_157).

0.93::true_val(stance_width_range_size_157, r51_0_59_0); 0.07::true_val(stance_width_range_size_157, unk_stance_width_range_size_157).

measured(s2, stance_width_range_size_157, r51_0_59_0).

all_consistent(stance_width_range_size_157) :- consistent(s2, stance_width_range_size_157).

evidence(all_consistent(stance_width_range_size_157)).
query(true_val(stance_width_range_size_157, r51_0_59_0)).
query(true_val(stance_width_range_size_157, unk_stance_width_range_size_157)).

% @attr recommended_weight_range_size_157
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (157cm)
% @unit kg
% @values r71_91=71-91kg unk_recommended_weight_range_size_157=Unknown
% @importance 1.0

0.95::acc(s2, recommended_weight_range_size_157).

0.93::true_val(recommended_weight_range_size_157, r71_91); 0.07::true_val(recommended_weight_range_size_157, unk_recommended_weight_range_size_157).

measured(s2, recommended_weight_range_size_157, r71_91).

all_consistent(recommended_weight_range_size_157) :- consistent(s2, recommended_weight_range_size_157).

evidence(all_consistent(recommended_weight_range_size_157)).
query(true_val(recommended_weight_range_size_157, r71_91)).
query(true_val(recommended_weight_range_size_157, unk_recommended_weight_range_size_157)).

% @attr effective_edge_159
% @type numeric
% @canonical false
% @original_name Effective edge 159cm
% @unit cm
% @values v122_7=122.7 unk_effective_edge_159=Unknown
% @importance 1.0

0.95::acc(s2, effective_edge_159).

0.93::true_val(effective_edge_159, v122_7); 0.07::true_val(effective_edge_159, unk_effective_edge_159).

measured(s2, effective_edge_159, v122_7).

all_consistent(effective_edge_159) :- consistent(s2, effective_edge_159).

evidence(all_consistent(effective_edge_159)).
query(true_val(effective_edge_159, v122_7)).
query(true_val(effective_edge_159, unk_effective_edge_159)).

% @attr waist_width_159
% @type numeric
% @canonical false
% @original_name Waist width 159cm
% @unit cm
% @values v25_6=25.6 unk_waist_width_159=Unknown
% @importance 1.0

0.95::acc(s2, waist_width_159).

0.93::true_val(waist_width_159, v25_6); 0.07::true_val(waist_width_159, unk_waist_width_159).

measured(s2, waist_width_159, v25_6).

all_consistent(waist_width_159) :- consistent(s2, waist_width_159).

evidence(all_consistent(waist_width_159)).
query(true_val(waist_width_159, v25_6)).
query(true_val(waist_width_159, unk_waist_width_159)).

% @attr tip_tail_width_size_159
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (159cm)
% @unit cm
% @values v29_9=29.9/29.9 unk_tip_tail_width_size_159=Unknown
% @importance 1.0

0.95::acc(s2, tip_tail_width_size_159).

0.93::true_val(tip_tail_width_size_159, v29_9); 0.07::true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159).

measured(s2, tip_tail_width_size_159, v29_9).

all_consistent(tip_tail_width_size_159) :- consistent(s2, tip_tail_width_size_159).

evidence(all_consistent(tip_tail_width_size_159)).
query(true_val(tip_tail_width_size_159, v29_9)).
query(true_val(tip_tail_width_size_159, unk_tip_tail_width_size_159)).

% @attr sidecut_radius_size_159
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (159cm)
% @unit m
% @values v8_0=8.0 unk_sidecut_radius_size_159=Unknown
% @importance 1.0

0.95::acc(s2, sidecut_radius_size_159).

0.93::true_val(sidecut_radius_size_159, v8_0); 0.07::true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159).

measured(s2, sidecut_radius_size_159, v8_0).

all_consistent(sidecut_radius_size_159) :- consistent(s2, sidecut_radius_size_159).

evidence(all_consistent(sidecut_radius_size_159)).
query(true_val(sidecut_radius_size_159, v8_0)).
query(true_val(sidecut_radius_size_159, unk_sidecut_radius_size_159)).

% @attr stance_width_range_size_159
% @type categorical
% @canonical false
% @original_name stance_width_range_size (159cm)
% @unit cm
% @values r52_0_60_0=52.0-60.0 unk_stance_width_range_size_159=Unknown
% @importance 1.0

0.95::acc(s2, stance_width_range_size_159).

0.93::true_val(stance_width_range_size_159, r52_0_60_0); 0.07::true_val(stance_width_range_size_159, unk_stance_width_range_size_159).

measured(s2, stance_width_range_size_159, r52_0_60_0).

all_consistent(stance_width_range_size_159) :- consistent(s2, stance_width_range_size_159).

evidence(all_consistent(stance_width_range_size_159)).
query(true_val(stance_width_range_size_159, r52_0_60_0)).
query(true_val(stance_width_range_size_159, unk_stance_width_range_size_159)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @unit kg
% @values r75_95=75-95kg unk_recommended_weight_range_size_159=Unknown
% @importance 1.0

0.95::acc(s2, recommended_weight_range_size_159).

0.93::true_val(recommended_weight_range_size_159, r75_95); 0.07::true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159).

measured(s2, recommended_weight_range_size_159, r75_95).

all_consistent(recommended_weight_range_size_159) :- consistent(s2, recommended_weight_range_size_159).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, r75_95)).
query(true_val(recommended_weight_range_size_159, unk_recommended_weight_range_size_159)).

% @attr effective_edge_159w
% @type numeric
% @canonical false
% @original_name Effective edge 159cm Wide
% @unit cm
% @values v122_4=122.4 unk_effective_edge_159w=Unknown
% @importance 1.0

0.95::acc(s2, effective_edge_159w).

0.93::true_val(effective_edge_159w, v122_4); 0.07::true_val(effective_edge_159w, unk_effective_edge_159w).

measured(s2, effective_edge_159w, v122_4).

all_consistent(effective_edge_159w) :- consistent(s2, effective_edge_159w).

evidence(all_consistent(effective_edge_159w)).
query(true_val(effective_edge_159w, v122_4)).
query(true_val(effective_edge_159w, unk_effective_edge_159w)).

% @attr waist_width_159w
% @type numeric
% @canonical false
% @original_name Waist width 159cm Wide
% @unit cm
% @values v26_6=26.6 unk_waist_width_159w=Unknown
% @importance 1.0

0.95::acc(s2, waist_width_159w).

0.93::true_val(waist_width_159w, v26_6); 0.07::true_val(waist_width_159w, unk_waist_width_159w).

measured(s2, waist_width_159w, v26_6).

all_consistent(waist_width_159w) :- consistent(s2, waist_width_159w).

evidence(all_consistent(waist_width_159w)).
query(true_val(waist_width_159w, v26_6)).
query(true_val(waist_width_159w, unk_waist_width_159w)).

% @attr tip_tail_width_size_159w
% @type categorical
% @canonical false
% @original_name tip_tail_width_size (159cm Wide)
% @unit cm
% @values v30_9=30.9/30.9 unk_tip_tail_width_size_159w=Unknown
% @importance 1.0

0.95::acc(s2, tip_tail_width_size_159w).

0.93::true_val(tip_tail_width_size_159w, v30_9); 0.07::true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w).

measured(s2, tip_tail_width_size_159w, v30_9).

all_consistent(tip_tail_width_size_159w) :- consistent(s2, tip_tail_width_size_159w).

evidence(all_consistent(tip_tail_width_size_159w)).
query(true_val(tip_tail_width_size_159w, v30_9)).
query(true_val(tip_tail_width_size_159w, unk_tip_tail_width_size_159w)).

% @attr sidecut_radius_size_159w
% @type numeric
% @canonical false
% @original_name sidecut_radius_size (159cm Wide)
% @unit m
% @values v7_95=7.95 unk_sidecut_radius_size_159w=Unknown
% @importance 1.0

0.95::acc(s2, sidecut_radius_size_159w).

0.93::true_val(sidecut_radius_size_159w, v7_95); 0.07::true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w).

measured(s2, sidecut_radius_size_159w, v7_95).

all_consistent(sidecut_radius_size_159w) :- consistent(s2, sidecut_radius_size_159w).

evidence(all_consistent(sidecut_radius_size_159w)).
query(true_val(sidecut_radius_size_159w, v7_95)).
query(true_val(sidecut_radius_size_159w, unk_sidecut_radius_size_159w)).

% @attr stance_width_range_size_159w
% @type categorical
% @canonical false
% @original_name stance_width_range_size (159cm Wide)
% @unit cm
% @values r52_0_60_0=52.0-60.0 unk_stance_width_range_size_159w=Unknown
% @importance 1.0

0.95::acc(s2, stance_width_range_size_159w).

0.93::true_val(stance_width_range_size_159w, r52_0_60_0); 0.07::true_val(stance_width_range_size_159w, unk_stance_width_range_size_159w).

measured(s2, stance_width_range_size_159w, r52_0_60_0).

all_consistent(stance_width_range_size_159w) :- consistent(s2, stance_width_range_size_159w).

evidence(all_consistent(stance_width_range_size_159w)).
query(true_val(stance_width_range_size_159w, r52_0_60_0)).
query(true_val(stance_width_range_size_159w, unk_stance_width_range_size_159w)).

% @attr recommended_weight_range_size_159w
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159cm Wide)
% @unit kg
% @values r75_95=75-95kg unk_recommended_weight_range_size_159w=Unknown
% @importance 1.0

0.95::acc(s2, recommended_weight_range_size_159w).

0.93::true_val(recommended_weight_range_size_159w, r75_95); 0.07::true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w).

measured(s2, recommended_weight_range_size_159w, r75_95).

all_consistent(recommended_weight_range_size_159w) :- consistent(s2, recommended_weight_range_size_159w).

evidence(all_consistent(recommended_weight_range_size_159w)).
query(true_val(recommended_weight_range_size_159w, r75_95)).
query(true_val(recommended_weight_range_size_159w, unk_recommended_weight_range_size_159w)).

% @attr boot_size_eu_159w
% @type categorical
% @canonical false
% @original_name Boot size (EU) 159cm Wide
% @values r42_47=42-47 unk_boot_size_eu_159w=Unknown
% @importance 1.0

0.95::acc(s2, boot_size_eu_159w).

0.93::true_val(boot_size_eu_159w, r42_47); 0.07::true_val(boot_size_eu_159w, unk_boot_size_eu_159w).

measured(s2, boot_size_eu_159w, r42_47).

all_consistent(boot_size_eu_159w) :- consistent(s2, boot_size_eu_159w).

evidence(all_consistent(boot_size_eu_159w)).
query(true_val(boot_size_eu_159w, r42_47)).
query(true_val(boot_size_eu_159w, unk_boot_size_eu_159w)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values smooth_easy=Smooth_and_easy_3BT_breeze unk_turn_initiation_performance=Unknown
% @importance 0.65

0.60::acc(s41, turn_initiation_performance).
0.55::acc(s42, turn_initiation_performance).

0.90::true_val(turn_initiation_performance, smooth_easy); 0.10::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s41, turn_initiation_performance, smooth_easy).
measured(s42, turn_initiation_performance, smooth_easy).

all_consistent(turn_initiation_performance) :-
    consistent(s41, turn_initiation_performance),
    consistent(s42, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, smooth_easy)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values reduced_3bt=Significantly_reduced_due_to_3BT unk_edge_hold=Unknown
% @importance 0.95

0.93::acc(s2, edge_hold).

0.93::true_val(edge_hold, reduced_3bt); 0.07::true_val(edge_hold, unk_edge_hold).

measured(s2, edge_hold, reduced_3bt).

all_consistent(edge_hold) :-
    consistent(s2, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, reduced_3bt)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr pop
% @type categorical
% @canonical true
% @original_name pop
% @values adequate=Adequate_pop_from_camber_and_beech_stringers unk_pop=Unknown
% @importance 0.73

0.75::acc(s22, pop).
0.60::acc(s43, pop).

0.90::true_val(pop, adequate); 0.10::true_val(pop, unk_pop).

measured(s22, pop, adequate).
measured(s43, pop, adequate).

all_consistent(pop) :-
    (indep(s22), consistent(s22, pop) ; \+indep(s22)),
    consistent(s43, pop).

evidence(all_consistent(pop)).
query(true_val(pop, adequate)).
query(true_val(pop, unk_pop)).

% @attr forgiveness
% @type categorical
% @canonical false
% @original_name Forgiveness
% @values highly_forgiving=Highly_forgiving_wont_punish_mistakes unk_forgiveness=Unknown
% @importance 0.88

0.93::acc(s2, forgiveness).
0.78::acc(s20, forgiveness).

0.95::true_val(forgiveness, highly_forgiving); 0.05::true_val(forgiveness, unk_forgiveness).

measured(s2, forgiveness, highly_forgiving).
measured(s20, forgiveness, highly_forgiving).

all_consistent(forgiveness) :-
    consistent(s2, forgiveness),
    consistent(s20, forgiveness).

evidence(all_consistent(forgiveness)).
query(true_val(forgiveness, highly_forgiving)).
query(true_val(forgiveness, unk_forgiveness)).

% @attr stability
% @type categorical
% @canonical false
% @original_name Stability
% @values directional_twin_adds=Directional_twin_adds_stability_higher_speeds unk_stability=Unknown
% @importance 0.65

0.62::acc(s27, stability).

0.51::true_val(stability, directional_twin_adds); 0.49::true_val(stability, unk_stability).

measured(s27, stability, directional_twin_adds).

all_consistent(stability) :-
    (indep(s27), consistent(s27, stability) ; \+indep(s27)).

evidence(all_consistent(stability)).
query(true_val(stability, directional_twin_adds)).
query(true_val(stability, unk_stability)).

% @attr float_in_powder
% @type categorical
% @canonical false
% @original_name Float in powder
% @values medium_uplift_improved=Medium_nose_tail_uplift_improves_float unk_float_in_powder=Unknown
% @importance 0.7

0.75::acc(s22, float_in_powder).
0.55::acc(s42, float_in_powder).

0.90::true_val(float_in_powder, medium_uplift_improved); 0.10::true_val(float_in_powder, unk_float_in_powder).

measured(s22, float_in_powder, medium_uplift_improved).
measured(s42, float_in_powder, medium_uplift_improved).

all_consistent(float_in_powder) :-
    (indep(s22), consistent(s22, float_in_powder) ; \+indep(s22)),
    consistent(s42, float_in_powder).

evidence(all_consistent(float_in_powder)).
query(true_val(float_in_powder, medium_uplift_improved)).
query(true_val(float_in_powder, unk_float_in_powder)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values flexwalls_absorb=FlexWalls_shock_absorption_reduce_chatter unk_chatter_performance=Unknown
% @importance 1.0

0.93::acc(s2, chatter_performance).

0.93::true_val(chatter_performance, flexwalls_absorb); 0.07::true_val(chatter_performance, unk_chatter_performance).

measured(s2, chatter_performance, flexwalls_absorb).

all_consistent(chatter_performance) :-
    consistent(s2, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, flexwalls_absorb)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr speed_stability
% @type categorical
% @canonical false
% @original_name Speed stability
% @values adequate_beginner_limited_high_speed=Adequate_for_beginner_intermediate_soft_flex_limits_speed unk_speed_stability=Unknown
% @importance 0.6

0.45::acc(s44, speed_stability).

0.26::true_val(speed_stability, adequate_beginner_limited_high_speed); 0.74::true_val(speed_stability, unk_speed_stability).

measured(s44, speed_stability, adequate_beginner_limited_high_speed).

all_consistent(speed_stability) :-
    consistent(s44, speed_stability).

evidence(all_consistent(speed_stability)).
query(true_val(speed_stability, adequate_beginner_limited_high_speed)).
query(true_val(speed_stability, unk_speed_stability)).

% @attr ride_feel
% @type categorical
% @canonical false
% @original_name Ride feel
% @values surfy_catch_free_loose=Surfy_catch_free_loose unk_ride_feel=Unknown
% @importance 0.65

0.75::acc(s22, ride_feel).
0.60::acc(s45, ride_feel).

0.90::true_val(ride_feel, surfy_catch_free_loose); 0.10::true_val(ride_feel, unk_ride_feel).

measured(s22, ride_feel, surfy_catch_free_loose).
measured(s45, ride_feel, surfy_catch_free_loose).

all_consistent(ride_feel) :-
    (indep(s22), consistent(s22, ride_feel) ; \+indep(s22)),
    consistent(s45, ride_feel).

evidence(all_consistent(ride_feel)).
query(true_val(ride_feel, surfy_catch_free_loose)).
query(true_val(ride_feel, unk_ride_feel)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values fun_both_excels_one=Fun_regular_or_switch_excels_one_direction unk_switch_riding=Unknown
% @importance 0.65

0.55::acc(s42, switch_riding).

0.36::true_val(switch_riding, fun_both_excels_one); 0.64::true_val(switch_riding, unk_switch_riding).

measured(s42, switch_riding, fun_both_excels_one).

all_consistent(switch_riding) :-
    consistent(s42, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, fun_both_excels_one)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr manufacturer_review_rating
% @type numeric
% @canonical false
% @original_name Manufacturer site review rating
% @values v5_0=5.0 unk_manufacturer_review_rating=Unknown
% @importance 1.0

0.80::acc(s2, manufacturer_review_rating).

0.76::true_val(manufacturer_review_rating, v5_0); 0.24::true_val(manufacturer_review_rating, unk_manufacturer_review_rating).

measured(s2, manufacturer_review_rating, v5_0).

all_consistent(manufacturer_review_rating) :-
    consistent(s2, manufacturer_review_rating).

evidence(all_consistent(manufacturer_review_rating)).
query(true_val(manufacturer_review_rating, v5_0)).
query(true_val(manufacturer_review_rating, unk_manufacturer_review_rating)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values playful_lightweight_jib=Playful_lightweight_perfect_for_jibbing_charges_rough_terrain unk_user_review_forum=Unknown
% @importance 0.65

0.55::acc(s42, user_review_forum).

0.36::true_val(user_review_forum, playful_lightweight_jib); 0.64::true_val(user_review_forum, unk_user_review_forum).

measured(s42, user_review_forum, playful_lightweight_jib).

all_consistent(user_review_forum) :-
    consistent(s42, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, playful_lightweight_jib)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_2
% @type categorical
% @canonical false
% @original_name user_review_forum (3BT convert)
% @values hard_to_ride_else=Once_used_to_3BT_hard_to_ride_anything_else unk_user_review_forum_2=Unknown
% @importance 0.65

0.55::acc(s41, user_review_forum_2).

0.43::true_val(user_review_forum_2, hard_to_ride_else); 0.57::true_val(user_review_forum_2, unk_user_review_forum_2).

measured(s41, user_review_forum_2, hard_to_ride_else).

all_consistent(user_review_forum_2) :-
    consistent(s41, user_review_forum_2).

evidence(all_consistent(user_review_forum_2)).
query(true_val(user_review_forum_2, hard_to_ride_else)).
query(true_val(user_review_forum_2, unk_user_review_forum_2)).

% @attr user_review_forum_3
% @type categorical
% @canonical false
% @original_name user_review_forum (turn initiation)
% @values turn_init_breeze=3BT_makes_turn_initiation_breeze_flat_riding_easier unk_user_review_forum_3=Unknown
% @importance 0.7

0.55::acc(s43, user_review_forum_3).

0.38::true_val(user_review_forum_3, turn_init_breeze); 0.62::true_val(user_review_forum_3, unk_user_review_forum_3).

measured(s43, user_review_forum_3, turn_init_breeze).

all_consistent(user_review_forum_3) :-
    consistent(s43, user_review_forum_3).

evidence(all_consistent(user_review_forum_3)).
query(true_val(user_review_forum_3, turn_init_breeze)).
query(true_val(user_review_forum_3, unk_user_review_forum_3)).

% @attr user_review_forum_4
% @type categorical
% @canonical false
% @original_name user_review_forum (smooth turns)
% @values smooth_turns_fast=Smooth_turns_well_fast_base_good_board unk_user_review_forum_4=Unknown
% @importance 0.65

0.55::acc(s41, user_review_forum_4).

0.43::true_val(user_review_forum_4, smooth_turns_fast); 0.57::true_val(user_review_forum_4, unk_user_review_forum_4).

measured(s41, user_review_forum_4, smooth_turns_fast).

all_consistent(user_review_forum_4) :-
    consistent(s41, user_review_forum_4).

evidence(all_consistent(user_review_forum_4)).
query(true_val(user_review_forum_4, smooth_turns_fast)).
query(true_val(user_review_forum_4, unk_user_review_forum_4)).

% @attr user_review_forum_5
% @type categorical
% @canonical false
% @original_name user_review_forum (soft noodly)
% @values soft_noodly=Board_described_as_soft_noodly_3_of_10_flex unk_user_review_forum_5=Unknown
% @importance 0.6

0.45::acc(s44, user_review_forum_5).

0.26::true_val(user_review_forum_5, soft_noodly); 0.74::true_val(user_review_forum_5, unk_user_review_forum_5).

measured(s44, user_review_forum_5, soft_noodly).

all_consistent(user_review_forum_5) :-
    consistent(s44, user_review_forum_5).

evidence(all_consistent(user_review_forum_5)).
query(true_val(user_review_forum_5, soft_noodly)).
query(true_val(user_review_forum_5, unk_user_review_forum_5)).

% @attr user_review_forum_6
% @type categorical
% @canonical false
% @original_name user_review_forum (3BT gimmick perception)
% @values initially_gimmicky=Some_perceive_3BT_gimmicky_but_converts_enthusiastic unk_user_review_forum_6=Unknown
% @importance 0.6

0.55::acc(s41, user_review_forum_6).
0.50::acc(s45, user_review_forum_6).

0.85::true_val(user_review_forum_6, initially_gimmicky); 0.15::true_val(user_review_forum_6, unk_user_review_forum_6).

measured(s41, user_review_forum_6, initially_gimmicky).
measured(s45, user_review_forum_6, initially_gimmicky).

all_consistent(user_review_forum_6) :-
    consistent(s41, user_review_forum_6),
    consistent(s45, user_review_forum_6).

evidence(all_consistent(user_review_forum_6)).
query(true_val(user_review_forum_6, initially_gimmicky)).
query(true_val(user_review_forum_6, unk_user_review_forum_6)).

% @attr user_review_forum_7
% @type categorical
% @canonical false
% @original_name user_review_forum (forgiving camber feel)
% @values forgiving_3d_camber_feel=Forgiving_3D_shape_provides_full_camber_feel unk_user_review_forum_7=Unknown
% @importance 0.65

0.50::acc(s46, user_review_forum_7).

0.34::true_val(user_review_forum_7, forgiving_3d_camber_feel); 0.66::true_val(user_review_forum_7, unk_user_review_forum_7).

measured(s46, user_review_forum_7, forgiving_3d_camber_feel).

all_consistent(user_review_forum_7) :-
    consistent(s46, user_review_forum_7).

evidence(all_consistent(user_review_forum_7)).
query(true_val(user_review_forum_7, forgiving_3d_camber_feel)).
query(true_val(user_review_forum_7, unk_user_review_forum_7)).

% @attr user_review_forum_8
% @type categorical
% @canonical false
% @original_name user_review_forum (floaty loose)
% @values floaty_loose_surfboard=Felt_floaty_loose_like_surfboard_much_faster unk_user_review_forum_8=Unknown
% @importance 0.55

0.50::acc(s45, user_review_forum_8).

0.41::true_val(user_review_forum_8, floaty_loose_surfboard); 0.59::true_val(user_review_forum_8, unk_user_review_forum_8).

measured(s45, user_review_forum_8, floaty_loose_surfboard).

all_consistent(user_review_forum_8) :-
    consistent(s45, user_review_forum_8).

evidence(all_consistent(user_review_forum_8)).
query(true_val(user_review_forum_8, floaty_loose_surfboard)).
query(true_val(user_review_forum_8, unk_user_review_forum_8)).

% @attr user_review_forum_9
% @type categorical
% @canonical false
% @original_name user_review_forum (reduced edge hold ice)
% @values reduced_edge_icy=Reduced_edge_hold_icy_hard_conditions unk_user_review_forum_9=Unknown
% @importance 0.8

0.55::acc(s47, user_review_forum_9).

0.38::true_val(user_review_forum_9, reduced_edge_icy); 0.62::true_val(user_review_forum_9, unk_user_review_forum_9).

measured(s47, user_review_forum_9, reduced_edge_icy).

all_consistent(user_review_forum_9) :-
    consistent(s47, user_review_forum_9).

evidence(all_consistent(user_review_forum_9)).
query(true_val(user_review_forum_9, reduced_edge_icy)).
query(true_val(user_review_forum_9, unk_user_review_forum_9)).

% @attr user_review_forum_10
% @type categorical
% @canonical false
% @original_name user_review_forum (less edge control steep firm)
% @values less_edge_steep_firm=Less_edge_control_steep_firm_snow unk_user_review_forum_10=Unknown
% @importance 0.8

0.55::acc(s47, user_review_forum_10).

0.38::true_val(user_review_forum_10, less_edge_steep_firm); 0.62::true_val(user_review_forum_10, unk_user_review_forum_10).

measured(s47, user_review_forum_10, less_edge_steep_firm).

all_consistent(user_review_forum_10) :-
    consistent(s47, user_review_forum_10).

evidence(all_consistent(user_review_forum_10)).
query(true_val(user_review_forum_10, less_edge_steep_firm)).
query(true_val(user_review_forum_10, unk_user_review_forum_10)).

% @attr user_review_forum_11
% @type categorical
% @canonical false
% @original_name user_review_forum (weight centering)
% @values center_weight_turns=Weight_more_centered_through_turns unk_user_review_forum_11=Unknown
% @importance 0.65

0.50::acc(s48, user_review_forum_11).

0.32::true_val(user_review_forum_11, center_weight_turns); 0.68::true_val(user_review_forum_11, unk_user_review_forum_11).

measured(s48, user_review_forum_11, center_weight_turns).

all_consistent(user_review_forum_11) :-
    consistent(s48, user_review_forum_11).

evidence(all_consistent(user_review_forum_11)).
query(true_val(user_review_forum_11, center_weight_turns)).
query(true_val(user_review_forum_11, unk_user_review_forum_11)).

% @attr user_review_forum_12
% @type categorical
% @canonical false
% @original_name user_review_forum (stone grind difficulty)
% @values stone_grind_hard=Shops_may_not_know_how_to_stone_grind_3BT unk_user_review_forum_12=Unknown
% @importance 0.5

0.40::acc(s49, user_review_forum_12).

0.25::true_val(user_review_forum_12, stone_grind_hard); 0.75::true_val(user_review_forum_12, unk_user_review_forum_12).

measured(s49, user_review_forum_12, stone_grind_hard).

all_consistent(user_review_forum_12) :-
    consistent(s49, user_review_forum_12).

evidence(all_consistent(user_review_forum_12)).
query(true_val(user_review_forum_12, stone_grind_hard)).
query(true_val(user_review_forum_12, unk_user_review_forum_12)).

% @attr user_review_forum_13
% @type categorical
% @canonical false
% @original_name user_review_forum (marmite love hate)
% @values marmite_love_hate=Bataleon_boards_like_marmite_love_or_hate unk_user_review_forum_13=Unknown
% @importance 0.6

0.50::acc(s50, user_review_forum_13).

0.34::true_val(user_review_forum_13, marmite_love_hate); 0.66::true_val(user_review_forum_13, unk_user_review_forum_13).

measured(s50, user_review_forum_13, marmite_love_hate).

all_consistent(user_review_forum_13) :-
    consistent(s50, user_review_forum_13).

evidence(all_consistent(user_review_forum_13)).
query(true_val(user_review_forum_13, marmite_love_hate)).
query(true_val(user_review_forum_13, unk_user_review_forum_13)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values solved_learner_stumbling_blocks=Considered_every_stumbling_block_for_learners_legit_solution unk_reviewer_opinion_whitelines=Unknown
% @importance 0.75

0.78::acc(s20, reviewer_opinion_whitelines).

0.68::true_val(reviewer_opinion_whitelines, solved_learner_stumbling_blocks); 0.32::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s20, reviewer_opinion_whitelines, solved_learner_stumbling_blocks).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s20, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, solved_learner_stumbling_blocks)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr reviewer_opinion_whitelines_2
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (progression)
% @values progression_curve_up=Plenty_to_keep_progression_curve_upwards unk_reviewer_opinion_whitelines_2=Unknown
% @importance 0.75

0.78::acc(s20, reviewer_opinion_whitelines_2).

0.68::true_val(reviewer_opinion_whitelines_2, progression_curve_up); 0.32::true_val(reviewer_opinion_whitelines_2, unk_reviewer_opinion_whitelines_2).

measured(s20, reviewer_opinion_whitelines_2, progression_curve_up).

all_consistent(reviewer_opinion_whitelines_2) :-
    consistent(s20, reviewer_opinion_whitelines_2).

evidence(all_consistent(reviewer_opinion_whitelines_2)).
query(true_val(reviewer_opinion_whitelines_2, progression_curve_up)).
query(true_val(reviewer_opinion_whitelines_2, unk_reviewer_opinion_whitelines_2)).

% @attr reviewer_opinion_whitelines_3
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines (fast-tracks)
% @values fast_tracks_progression=The_snowboard_that_fast_tracks_progression unk_reviewer_opinion_whitelines_3=Unknown
% @importance 0.75

0.78::acc(s20, reviewer_opinion_whitelines_3).

0.68::true_val(reviewer_opinion_whitelines_3, fast_tracks_progression); 0.32::true_val(reviewer_opinion_whitelines_3, unk_reviewer_opinion_whitelines_3).

measured(s20, reviewer_opinion_whitelines_3, fast_tracks_progression).

all_consistent(reviewer_opinion_whitelines_3) :-
    consistent(s20, reviewer_opinion_whitelines_3).

evidence(all_consistent(reviewer_opinion_whitelines_3)).
query(true_val(reviewer_opinion_whitelines_3, fast_tracks_progression)).
query(true_val(reviewer_opinion_whitelines_3, unk_reviewer_opinion_whitelines_3)).

% @attr absolute_snow_assessment
% @type categorical
% @canonical false
% @original_name Absolute-Snow assessment
% @values surfy_catch_free_confidence=Surfy_catch_free_builds_confidence_day_one unk_absolute_snow_assessment=Unknown
% @importance 0.75

0.75::acc(s22, absolute_snow_assessment).

0.68::true_val(absolute_snow_assessment, surfy_catch_free_confidence); 0.32::true_val(absolute_snow_assessment, unk_absolute_snow_assessment).

measured(s22, absolute_snow_assessment, surfy_catch_free_confidence).

all_consistent(absolute_snow_assessment) :-
    (indep(s22), consistent(s22, absolute_snow_assessment) ; \+indep(s22)).

evidence(all_consistent(absolute_snow_assessment)).
query(true_val(absolute_snow_assessment, surfy_catch_free_confidence)).
query(true_val(absolute_snow_assessment, unk_absolute_snow_assessment)).

% @attr surfdevils_assessment
% @type categorical
% @canonical false
% @original_name Surfdevils assessment
% @values predictable_easy_going=Predictable_easy_going_smooth_turn_initiation unk_surfdevils_assessment=Unknown
% @importance 0.65

0.60::acc(s27, surfdevils_assessment).

0.51::true_val(surfdevils_assessment, predictable_easy_going); 0.49::true_val(surfdevils_assessment, unk_surfdevils_assessment).

measured(s27, surfdevils_assessment, predictable_easy_going).

all_consistent(surfdevils_assessment) :-
    (indep(s27), consistent(s27, surfdevils_assessment) ; \+indep(s27)).

evidence(all_consistent(surfdevils_assessment)).
query(true_val(surfdevils_assessment, predictable_easy_going)).
query(true_val(surfdevils_assessment, unk_surfdevils_assessment)).

% @attr youtube_review_angry_snowboarder
% @type categorical
% @canonical false
% @original_name YouTube review (Angry Snowboarder, Dec 2025)
% @values starter_board_3d_shaping=Just_a_starter_snowboard_with_3D_shaping unk_youtube_review_angry_snowboarder=Unknown
% @importance 0.75

0.72::acc(s51, youtube_review_angry_snowboarder).

0.56::true_val(youtube_review_angry_snowboarder, starter_board_3d_shaping); 0.44::true_val(youtube_review_angry_snowboarder, unk_youtube_review_angry_snowboarder).

measured(s51, youtube_review_angry_snowboarder, starter_board_3d_shaping).

all_consistent(youtube_review_angry_snowboarder) :-
    consistent(s51, youtube_review_angry_snowboarder).

evidence(all_consistent(youtube_review_angry_snowboarder)).
query(true_val(youtube_review_angry_snowboarder, starter_board_3d_shaping)).
query(true_val(youtube_review_angry_snowboarder, unk_youtube_review_angry_snowboarder)).

% @attr positive_customer_service
% @type categorical
% @canonical false
% @original_name Positive customer service note
% @values smooth_return_refund=Robin_helpful_smooth_return_refund unk_positive_customer_service=Unknown
% @importance 0.55

0.45::acc(s52, positive_customer_service).

0.38::true_val(positive_customer_service, smooth_return_refund); 0.62::true_val(positive_customer_service, unk_positive_customer_service).

measured(s52, positive_customer_service, smooth_return_refund).

all_consistent(positive_customer_service) :-
    consistent(s52, positive_customer_service).

evidence(all_consistent(positive_customer_service)).
query(true_val(positive_customer_service, smooth_return_refund)).
query(true_val(positive_customer_service, unk_positive_customer_service)).

% @attr negative_customer_service
% @type categorical
% @canonical false
% @original_name Negative customer service note
% @values poor_warranty_response=Poor_warranty_2_week_wait_50pct_discount_only unk_negative_customer_service=Unknown
% @importance 0.7

0.45::acc(s53, negative_customer_service).

0.32::true_val(negative_customer_service, poor_warranty_response); 0.68::true_val(negative_customer_service, unk_negative_customer_service).

measured(s53, negative_customer_service, poor_warranty_response).

all_consistent(negative_customer_service) :-
    consistent(s53, negative_customer_service).

evidence(all_consistent(negative_customer_service)).
query(true_val(negative_customer_service, poor_warranty_response)).
query(true_val(negative_customer_service, unk_negative_customer_service)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values soft_boards_break_wear=Soft_boards_break_often_cosmetically_wear unk_negative_aspect=Unknown
% @importance 0.7

0.40::acc(s53, negative_aspect).

0.32::true_val(negative_aspect, soft_boards_break_wear); 0.68::true_val(negative_aspect, unk_negative_aspect).

measured(s53, negative_aspect, soft_boards_break_wear).

all_consistent(negative_aspect) :-
    consistent(s53, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, soft_boards_break_wear)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values yes_basic=YES_Basic unk_comparable_board_cross_brand=Unknown
% @importance 0.8

0.55::acc(s54, comparable_board_cross_brand).

0.41::true_val(comparable_board_cross_brand, yes_basic); 0.59::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s54, comparable_board_cross_brand, yes_basic).

all_consistent(comparable_board_cross_brand) :-
    consistent(s54, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, yes_basic)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_cross_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (K2 Raygun)
% @values k2_raygun=K2_Raygun unk_comparable_board_cross_brand_2=Unknown
% @importance 0.8

0.55::acc(s54, comparable_board_cross_brand_2).

0.41::true_val(comparable_board_cross_brand_2, k2_raygun); 0.59::true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2).

measured(s54, comparable_board_cross_brand_2, k2_raygun).

all_consistent(comparable_board_cross_brand_2) :-
    consistent(s54, comparable_board_cross_brand_2).

evidence(all_consistent(comparable_board_cross_brand_2)).
query(true_val(comparable_board_cross_brand_2, k2_raygun)).
query(true_val(comparable_board_cross_brand_2, unk_comparable_board_cross_brand_2)).

% @attr comparable_board_cross_brand_3
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Jones Mountain Twin)
% @values jones_mountain_twin=Jones_Mountain_Twin unk_comparable_board_cross_brand_3=Unknown
% @importance 0.65

0.50::acc(s46, comparable_board_cross_brand_3).

0.34::true_val(comparable_board_cross_brand_3, jones_mountain_twin); 0.66::true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3).

measured(s46, comparable_board_cross_brand_3, jones_mountain_twin).

all_consistent(comparable_board_cross_brand_3) :-
    consistent(s46, comparable_board_cross_brand_3).

evidence(all_consistent(comparable_board_cross_brand_3)).
query(true_val(comparable_board_cross_brand_3, jones_mountain_twin)).
query(true_val(comparable_board_cross_brand_3, unk_comparable_board_cross_brand_3)).

% @attr comparable_board_cross_brand_4
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (Ride Agenda/Burnout)
% @values ride_agenda_burnout=Ride_Agenda_Ride_Burnout unk_comparable_board_cross_brand_4=Unknown
% @importance 0.75

0.65::acc(s51, comparable_board_cross_brand_4).

0.56::true_val(comparable_board_cross_brand_4, ride_agenda_burnout); 0.44::true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4).

measured(s51, comparable_board_cross_brand_4, ride_agenda_burnout).

all_consistent(comparable_board_cross_brand_4) :-
    consistent(s51, comparable_board_cross_brand_4).

evidence(all_consistent(comparable_board_cross_brand_4)).
query(true_val(comparable_board_cross_brand_4, ride_agenda_burnout)).
query(true_val(comparable_board_cross_brand_4, unk_comparable_board_cross_brand_4)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values bataleon_whatever=Bataleon_Whatever_medium_flex_upgrade unk_comparable_board_same_brand=Unknown
% @importance 0.65

0.55::acc(s55, comparable_board_same_brand).

0.41::true_val(comparable_board_same_brand, bataleon_whatever); 0.59::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s55, comparable_board_same_brand, bataleon_whatever).

all_consistent(comparable_board_same_brand) :-
    consistent(s55, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, bataleon_whatever)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_2
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Goliath)
% @values bataleon_goliath=Bataleon_Goliath_advanced_all_mountain unk_comparable_board_same_brand_2=Unknown
% @importance 0.7

0.80::acc(s17, comparable_board_same_brand_2).

0.68::true_val(comparable_board_same_brand_2, bataleon_goliath); 0.32::true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2).

measured(s17, comparable_board_same_brand_2, bataleon_goliath).

all_consistent(comparable_board_same_brand_2) :-
    consistent(s17, comparable_board_same_brand_2).

evidence(all_consistent(comparable_board_same_brand_2)).
query(true_val(comparable_board_same_brand_2, bataleon_goliath)).
query(true_val(comparable_board_same_brand_2, unk_comparable_board_same_brand_2)).

% @attr value_proposition
% @type categorical
% @canonical false
% @original_name Value proposition
% @values high_end_3bt_affordable=High_end_3BT_at_most_affordable_price unk_value_proposition=Unknown
% @importance 0.75

0.78::acc(s20, value_proposition).
0.75::acc(s22, value_proposition).

0.93::true_val(value_proposition, high_end_3bt_affordable); 0.07::true_val(value_proposition, unk_value_proposition).

measured(s20, value_proposition, high_end_3bt_affordable).
measured(s22, value_proposition, high_end_3bt_affordable).

all_consistent(value_proposition) :-
    consistent(s20, value_proposition),
    (indep(s22), consistent(s22, value_proposition) ; \+indep(s22)).

evidence(all_consistent(value_proposition)).
query(true_val(value_proposition, high_end_3bt_affordable)).
query(true_val(value_proposition, unk_value_proposition)).

% @attr budget_positioning
% @type categorical
% @canonical false
% @original_name Budget positioning
% @values entry_level_simple=Entry_level_simple_construction_keeps_cost_down unk_budget_positioning=Unknown
% @importance 0.6

0.62::acc(s56, budget_positioning).

0.51::true_val(budget_positioning, entry_level_simple); 0.49::true_val(budget_positioning, unk_budget_positioning).

measured(s56, budget_positioning, entry_level_simple).

all_consistent(budget_positioning) :-
    consistent(s56, budget_positioning).

evidence(all_consistent(budget_positioning)).
query(true_val(budget_positioning, entry_level_simple)).
query(true_val(budget_positioning, unk_budget_positioning)).

% @attr price_vs_competition
% @type categorical
% @canonical false
% @original_name Price vs. competition
% @values competitive_460_usd=At_460_USD_competitive_with_YES_Basic_K2_Raygun unk_price_vs_competition=Unknown
% @importance 0.6

0.50::acc(s_analyst, price_vs_competition).

0.40::true_val(price_vs_competition, competitive_460_usd); 0.60::true_val(price_vs_competition, unk_price_vs_competition).

measured(s_analyst, price_vs_competition, competitive_460_usd).

all_consistent(price_vs_competition) :-
    consistent(s_analyst, price_vs_competition).

evidence(all_consistent(price_vs_competition)).
query(true_val(price_vs_competition, competitive_460_usd)).
query(true_val(price_vs_competition, unk_price_vs_competition)).

% @attr binding_package_availability
% @type categorical
% @canonical false
% @original_name Binding package availability
% @values board_binding_set=Can_purchase_board_binding_set_select_retailers unk_binding_package_availability=Unknown
% @importance 0.88

0.93::acc(s2, binding_package_availability).
0.75::acc(s22, binding_package_availability).

0.95::true_val(binding_package_availability, board_binding_set); 0.05::true_val(binding_package_availability, unk_binding_package_availability).

measured(s2, binding_package_availability, board_binding_set).
measured(s22, binding_package_availability, board_binding_set).

all_consistent(binding_package_availability) :-
    consistent(s2, binding_package_availability),
    (indep(s22), consistent(s22, binding_package_availability) ; \+indep(s22)).

evidence(all_consistent(binding_package_availability)).
query(true_val(binding_package_availability, board_binding_set)).
query(true_val(binding_package_availability, unk_binding_package_availability)).

% @attr construction_material_innovation_carbon
% @type categorical
% @canonical false
% @original_name construction_material_innovation (no carbon)
% @values none_no_carbon=No_carbon_stringers_reserved_for_higher_end unk_construction_material_innovation_carbon=Unknown
% @importance 0.6

0.62::acc(s56, construction_material_innovation_carbon).

0.51::true_val(construction_material_innovation_carbon, none_no_carbon); 0.49::true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon).

measured(s56, construction_material_innovation_carbon, none_no_carbon).

all_consistent(construction_material_innovation_carbon) :-
    consistent(s56, construction_material_innovation_carbon).

evidence(all_consistent(construction_material_innovation_carbon)).
query(true_val(construction_material_innovation_carbon, none_no_carbon)).
query(true_val(construction_material_innovation_carbon, unk_construction_material_innovation_carbon)).

% @attr edge_material
% @type categorical
% @canonical false
% @original_name Edge material
% @values standard_steel_assumed=Not_disclosed_standard_steel_assumed unk_edge_material=Unknown
% @importance 0.5

0.35::acc(s_analyst, edge_material).

0.30::true_val(edge_material, standard_steel_assumed); 0.70::true_val(edge_material, unk_edge_material).

measured(s_analyst, edge_material, standard_steel_assumed).

all_consistent(edge_material) :-
    consistent(s_analyst, edge_material).

evidence(all_consistent(edge_material)).
query(true_val(edge_material, standard_steel_assumed)).
query(true_val(edge_material, unk_edge_material)).

% @attr topsheet
% @type categorical
% @canonical false
% @original_name topsheet
% @values not_described=Not_described_in_technical_specs unk_topsheet=Unknown
% @importance 0.5

0.30::acc(s_analyst, topsheet).

0.25::true_val(topsheet, not_described); 0.75::true_val(topsheet, unk_topsheet).

measured(s_analyst, topsheet, not_described).

all_consistent(topsheet) :-
    consistent(s_analyst, topsheet).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, not_described)).
query(true_val(topsheet, unk_topsheet)).

% @attr taper
% @type categorical
% @canonical false
% @original_name taper
% @values not_specified_slight_nose=Not_specified_directional_twin_implies_slight_nose_bias unk_taper=Unknown
% @importance 0.6

0.75::acc(s17, taper).

0.64::true_val(taper, not_specified_slight_nose); 0.36::true_val(taper, unk_taper).

measured(s17, taper, not_specified_slight_nose).

all_consistent(taper) :-
    consistent(s17, taper).

evidence(all_consistent(taper)).
query(true_val(taper, not_specified_slight_nose)).
query(true_val(taper, unk_taper)).